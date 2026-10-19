# Generalized Heegner cycles and their Iwasawa variation

This roadmap constructs the generalized Heegner cycles of Bertolini–Darmon–Prasanna, realizes them in cohomology, and organizes their fixed-weight, anticyclotomic and Hida-family applications. The coefficient projectors, local conditions, periods and integral lattices are part of each statement. Weight two is a comparison with the existing Heegner-point system through the modular quotient and Kummer map.

The definitive plan is the whole packet [GeneralizedHeegnerCycles.json](../packets/GeneralizedHeegnerCycles.json). It imports 82 targets by stable identifier from the GH.0–GH.7 and GH.8 part packets and adds twelve bridge targets. This document renders the resulting 94-target plan, including its prerequisite replacements and statement correction. It retains all 18 definition/construction targets, their 66 API items and 58 discriminating tests. There are 40 planets, at most six in any layer. All implementation statuses are unchecked. GH.0–GH.8 are planned; none is proof-closed. The 26 gap groups and 24 supplier requests below are explicit parts of the plan, rather than assertions that their inputs already exist.

The [suggested Lean file](../suggested/GeneralizedHeegnerCycles.lean) is a compact subset of statements expressible with the actual pinned carriers. Its two light definitions concern linear normalization and stabilization; its five named comparison milestones and eleven examples use existing modules, finite groups and quotient maps. The full geometric definitions, arithmetic hypotheses, APIs and tests are specified here. No abstract type parameter is declared to be a Chow group, an Iwasawa module or a regulator. The whole packet requires independent review; acceptance of an imported part does not accept these new bridges.

## Conventions and the source ranges

Write K for an imaginary quadratic field, H for its Hilbert class field, c for a ring-class conductor and K_c for its ring-class field. An auxiliary prime-to-p conductor c₀ is retained in G_n=Gal(K_(c₀pⁿ)/K); its finite class-group component is traced only by an explicit map. Geometric Artin reciprocity, the chosen prime above split p and the action on the coefficient twist must be matched before two character sums are identified. A nontrivial character on the last conductor kernel kills a lower-conductor contribution by scalar orthogonality before acting on cohomology; no cancellation of a scalar in a torsion module is legitimate.

There are two weight notations. In the BDP construction put m=k−2; W_m has dimension m+1 and X_m=W_m×A^m has dimension 2m+1, with graph-cycle codimension m+1. CH and LV write k=2r, so m=2r−2. A subscript r in a BDP source refers to its number of fibre factors and is not CH's half-weight. In particular W₁ is the universal elliptic surface over the modular curve: W₁×A is a threefold. BDP17 also allows X_(r₁,r₂)=W_(r₁)×A^(r₂), with r₁≥r₂ of equal parity. Its correspondence has u=(r₁−r₂)/2 paired CM factors.

The CM elliptic curve comes with its actual O_K-action, normalized by [a]*ω_A=aω_A. Its conjugate eigenvector η_A satisfies ⟨ω_A,η_A⟩=1. It is not an arbitrary vector complementary to ω_A. The CM splitting, product projector and newform factor use this convention. The projector denominator N^m·2^(2m)·(m!)² and the additional fine-level/Hecke denominator d_f are separate. A rational idempotent is not an integral projector until the relevant denominators are units.

A smooth proper model of W_m away from N does not supply a good model of A. Form the product only after both models are given over a common O_F. For BDP's comparison F/Q_p is finite unramified, and its canonical conductor-c application has p∤cNd_K. These hypotheses are carried into the Abel–Jacobi comparison. They are not claimed necessary for every Bloch–Kato containment theorem over an arbitrary finite local extension. The degree-one comparison over a ramified conductor field is a separate naturality/realization target and applies to points defined over that field itself.

At positive p-conductor, CH stabilization is z_c−(p^(2r−2)/α)res(z_(c/p)), where α is the ordinary unit root of X²−a_pX+p^(2r−1). At weight two the coefficient reduces to α⁻¹. At prime-to-p conductor the formula instead has two Euler operators and its source-specific unit factor. CH's full unit count |O_c×| and Castella's half count |O_c×|/2 are kept separate. Replacing only the bottom of a norm-compatible system is not a uniform change of normalization; the first trace and first degree determine that bottom.

The sources have distinct domains. BDP13 Theorem 5.13 uses all five clauses of Assumption 5.12, including its level, conductor, discriminant and finite local-sign conditions. Its squared special-value formula is different from the CH ramified-character logarithm formula. CH's standing hypothesis has all tame level primes split, its specified discriminant and weight-dependent exclusions, and the extra (N_f,D_K)=1 for Theorem 3.9. LV's admissibility, determinant-restricted big image, class-number and local assumptions remain stronger application inputs; they are not imposed on CH's rational descent theorem. Castella's family statements retain their critical twist, ordinary representation, residual/control assumptions and p-old range. Each target below states its own further conditions.

Hsieh14 Theorem C is used with the coefficient and tower primes exchanged. Over Q its local-degree-one conclusion has a finite exceptional set; over larger local degree it gives density instead. The coefficient prime must satisfy the ordinary-CM-type, residual, coprimality and local-character-order conditions. These do not disappear under the phrase analytic nonvanishing. Conversely, the corrected multiplicative BSD argument permits ramified nonsplit tame primes and uses varying higher weights. Neither CH's all-split range nor a fixed-p factorial bound covers that auxiliary sequence. The explicit auxiliary local, leading-unit and non-torsion targets below supply that boundary, subject to the recorded source/proof obligations.

The CH erratum changes the proof at p. Its unramified Fontaine–Laffaille lemma is not used over arbitrary ramified conductor fields. The required derivative condition follows the integral Perrin–Riou lifting/orthogonality route of Kobayashi–Ota Lemma 4.10 after its integral-twist, lattice and regulator-image conditions are verified. The rank slope and parity residue are (1−ε)/2, not the root sign itself.

## Dependency ownership

The following interfaces are imported, rather than rebuilt as generalized-cycle theory.

| Owner | Input and boundary |
| --- | --- |
| ModularCurvesPartII R14.3 and its proposed geometric extension | Actual modular curve, universal generalized elliptic curve, canonical fibre-power resolution, boundary geometry and fine-level descent. Current R14.3 provides weight-two H¹ only. |
| AutomorphicGaloisRepresentations R19.1 | Classical Scholl signed projector, parabolic concentration, newform realization and fixed lattice/Hecke denominator. Its current GH.0 geometry back-reference must be replaced by the preceding geometric inputs. |
| ComplexMultiplicationAndExplicitReciprocity CM.1–CM.2; HeegnerPointEulerSystems HE.0–HE.3/HE.8 | CM action and descent, ring-class fields, actual CM points, geometric trace degrees, Kummer classes and point systems, over upstream ClassFieldTheory Layer 13. |
| SchemeAndStackFoundations SF.5; EtaleDualityAndPerverseSheaves EDC.2/EDC.3/EDC.6; DerivedDeRhamCohomology DD.2 | Chow/correspondence operations, realizations, finite and continuous Gysin sequences, Künneth and duality. The Picard/Jacobian object is consumed from the existing Jacobian roadmap. |
| PadicHodgeTheory R06.2/R06.5; PadicHodgeRegulators L1/D.2 and proposed Part II | Comparison maps, Bloch–Kato logarithms, syntomic realization and generic local regulators. Current cyclotomic L3 does not imply the relative Lubin–Tate/Yager extension. |
| PadicDifferentialEquationsAndRigidCohomology RD.3–RD.4 | Wide-open comparison, rigid coefficients, Coleman primitives and residue computations. |
| AutomorphicPadicLFunctions L3h | The GL₂ square-root distribution, periods/interpolation and source-qualified analytic nonvanishing. GH.4 owns the general BDP13 cycle special-value formula. |
| EulerSystemsAndKolyvaginSystems ES.3/ES.4/ES.5/ES.8 | Generic derivative systems, CH rational bounded-error descent, Howard's self-dual DVR theorem and its Λ-adic bound. GH verifies their respective application hypotheses. |
| SelmerIwasawaCohomology L2–L4; ArithmeticGaloisDuality R02.1–R02.2 | Actual local conditions, continuous cohomology, Shapiro/descent, control, parity and global duality. |
| PadicFamilies L0; AutomorphicGaloisRepresentations R19.6 | Hida coefficients, critically twisted family representation and specialization. |

The acyclic geometric order is resolution/boundary/fine-level geometry → classical Scholl/parabolic/newform realization → CM product and coefficient adapter. The supplier corrections and precise contracts below are proposals; no edit of the suppliers is silently presumed. The current global ownership cycle therefore remains a recorded gap, even though the internal 94-target graph is acyclic.

The generic relative Lubin–Tate, ideal exponential, Yager module and two-variable regulator have one proposed local owner, Padic Hodge regulators, Part II. GH.7 applies that interface to the actual ordinary line, proves the quotient preimage equality and checks the nonzero period pairing. AutomorphicCongruences L2 consumes the same local theory and retains only its FW fixed-weight logarithm boundedness application.

GrossZagierAndArithmeticHeights GZ.9 imports L3h's GL₂ distribution and GH.4's m=0 special-value formula; it retains quaternionic, supersingular and exceptional-zero comparisons. The proposed modular-symbol dependency is removed unless a separate use establishes it. Howard's generic self-dual theory has the sole owners ES.5 and ES.8. The exact generic CH descent interface is ES.4/rational-anticyclotomic-descent. Heegner-point and generalized-cycle applications retain different hypothesis verifications; the HE.6 → HE.8 edge is part of the ownership proposal.

AutomorphicCongruences L2 receives the source-qualified ordinary reciprocity export. RankZeroOneBSD BSD.6a receives the higher-weight auxiliary-form export and owns coefficient congruences, control, Fitting/characteristic ideals and the multiplicative limit argument. A p-new multiplicative weight-two class is not identified through the p-old point comparison. ModularIwasawaMainConjectures L6 owns general main-conjecture formulations and their coefficient/determinant comparisons. Equality of the LV characteristic ideals is a conjectural strengthening, not a theorem of this roadmap.

## The layers

[GH.0 Geometry](#gh-0) · [GH.1 Cycles and realizations](#gh-1) · [GH.2 Relations and local conditions](#gh-2) · [GH.3 Stabilization](#gh-3) · [GH.4 Reciprocity](#gh-4) · [GH.5 Kolyvagin systems](#gh-5) · [GH.6 Selmer consequences](#gh-6) · [GH.7 Families](#gh-7) · [GH.8 Consumer comparisons](#gh-8)

<a id="gh-0"></a>
## GH.0. Kuga–Sato geometry and coefficient projectors

Fix the CM eigenbasis, form the product with the imported classical carrier, project the cohomology and record its independent good-model data.

<a id="generalizedheegnercycles-gh-0-cm-elliptic-curve-and-its-hodge-splitting"></a>
### The CM elliptic curve A and the algebraic splitting of H¹_dR(A)

**Target:** `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting` · definition.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.CMCurve`.

A CM elliptic curve is an elliptic abelian variety A/H, with H containing the Hilbert class field of the imaginary quadratic K, and a specified isomorphism O_K ≅ End_H(A), normalized so [α]*ω=αω. For F⊇H, H¹_dR(A/F)=Fω⊕Fη, where η lies on the conjugate CM eigenline and ⟨ω,η⟩=1. At an ordinary good split prime this conjugate eigenline is the unit-root line. No good model is inferred from the level N.

**Hypotheses and conventions.**

- The normalization of the O_K-action is on differentials: [α]^*ω = αω. The opposite normalization swaps H^{1,0} and H^{0,1}.
- Existence of A over H with End_H(A) = O_K, and its descent, are HeegnerPointEulerSystems HE.1's and ComplexMultiplicationAndExplicitReciprocity CM.1's.
- The two-character coordinate fixture is a realization of the specified CM endomorphisms through A.cm, not a construction of H¹_dR. Its comparison with the geometric carrier is imported from CM.1 and the de Rham owner.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.0/cm-character-decomposition](#generalizedheegnercycles-gh-0-cm-character-decomposition): Fixes the normalized eigenbasis and prevents a free choice of complementary line.
- [GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula](#generalizedheegnercycles-gh-4-bdp-special-value-formula): Tracks the power of a when the CM differential is rescaled.

**Planning API.**

- `TauCeti.GeneralizedHeegner.CMCurve.h10` (characterisation): The identity-character eigenvector ω lies in ker([α]*−α).
- `TauCeti.GeneralizedHeegner.CMCurve.h01` (characterisation): The conjugate-character eigenvector η lies in ker([α]*−ᾱ).
- `TauCeti.GeneralizedHeegner.CMCurve.hodgeSplitting` (equivalence): The two distinct CM eigenlines span the cohomology space and have zero intersection.
- `TauCeti.GeneralizedHeegner.CMCurve.etaOfOmega` (constructor): CMCurve.etaOfOmega(b,ω,η) is b(ω,η)⁻¹η, using an actual nonzero vector on the conjugate CM eigenline.
- `TauCeti.GeneralizedHeegner.CMCurve.map_eigenvector` (functoriality): A linear realization map commuting with the CM action transports a character eigenvector to an eigenvector with the same character value.
- `TauCeti.GeneralizedHeegner.CMCurve.etaOfOmega_spec` (characterisation): When b(ω,η) is nonzero, the constructed vector pairs to 1 and is the unique scalar multiple of η that does so.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.cmCurve_i_action` (computation): For a CM curve A with O_K=Z[i], realize the actual endomorphism A.cm(i) by the two characters through A.cm⁻¹. On the ordered basis it sends (1,0) to (i,0) and (0,1) to (0,−i). Conjugate the CM isomorphism on the same curve, keep A’s original realization fixed, and check the new i-endomorphism sends (1,0) to (−i,0), unequal to (i,0). This rejects the opposite CM normalization; the geometric realization identification is the CM.1/de Rham export.
- `TauCeti.GeneralizedHeegner.cmCurve_normalization` (characterisation): For the determinant cup pairing on C², compute CMCurve.etaOfOmega((2,0),(0,1))=(0,1/2). Check its pairing with (2,0) is 1 and the i-action has conjugate eigenvalue −i. The test calls the normalization constructor itself.
- `TauCeti.GeneralizedHeegner.cmCurve_scalar_endomorphism` (compatibility): The specified ring isomorphism sends the integer n to the endomorphism whose underlying map is the native mulBy(A,n), so the CM and abelian-variety scalar actions agree.

**Construction or proof.**

1. O_K acts on H¹_dR(A/F) through the two characters α and ᾱ, which are distinct since K is imaginary quadratic. The two eigenlines split the space, and the α-eigenline is Ω¹, because [α]^* acts on differentials by α.
2. Functoriality: morphisms commuting with O_K preserve the eigenlines.
3. Over ℂ, H^{0,1} = conj(Ω¹) is the ᾱ-eigenline, and over ℂ_p for ordinary A the unit-root line is O_K-stable and different from Ω¹.

**Acceptance checks.**

- A = ℂ/O_K for K = ℚ(i): [i]^* dz = i dz on Ω¹, and [i]^* dz̄ = −i dz̄ on H^{0,1}.

**Direct prerequisites:** `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy`, `mathlib:Submodule.span`, `DerivedDeRhamCohomology:DD.2`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, p. 1051. A over H with End_H(A) ≅ O_K.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.1), p. 1051. The algebraic splitting of H¹_dR(A/F).
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.2), p. 1052. ⟨ω_A, η_A⟩ = 1.

<a id="generalizedheegnercycles-gh-0-cm-projector-and-symmetric-power"></a>
### The projector ε_A on A^r and Lemma 1.8

**Target:** `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.epsA`.

For m≥0 let Ξ_m=μ₂^m⋊S_m act on A^m by inversion and permutation, and χ_m be the product of the inversion signs and the permutation sign. Define ε_A=(2^m m!)⁻¹Σ_g χ_m(g)Γ_g as a rational correspondence. Its realization is idempotent and projects H^j(A^m) to Sym^m H¹(A) in degree m and to zero otherwise. The permutation sign cancels the graded Künneth sign; it must not be replaced by unsigned geometric symmetrization.

**Hypotheses and conventions.**

- The denominator 2^r r! must be inverted. ε_A is not in ℤ[Aut(A^r)], so an integral projector needs 2 and r! invertible.
- The sign twist on S_r is essential. By the Koszul rule, geometric permutations act on H¹^{⊗r} with the sign, so the twisted sum is the symmetrization. Without the twist the sum projects to ∧^r H¹, which vanishes for r ≥ 3.
- Only μ_2 ⊂ O_K^× is used. For K = ℚ(i) or ℚ(√−3) the larger unit group gives further characters, which the node cm-character-decomposition records.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety](#generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety): Eliminates all CM-factor cohomology except middle symmetric power.
- [GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle](#generalizedheegnercycles-gh-1-generalized-heegner-cycle): Projects products of isogeny graphs without changing the intended symmetric tensor.

**Planning API.**

- `TauCeti.GeneralizedHeegner.epsA_idem` (relation): ε_A²=ε_A for the graph action of Ξ_m.
- `TauCeti.GeneralizedHeegner.epsA_image` (characterisation): Its range is the χ_m-isotypic subspace of the tensor realization.
- `TauCeti.GeneralizedHeegner.epsA_transpose` (compatibility): The inverse-graph involution fixes ε_A.
- `TauCeti.GeneralizedHeegner.epsA_natural` (functoriality): An equivariant linear map intertwines the signed character average with the same average on the target realization.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.epsA_order` (computation): On the eight word tensors of a rank-two vector space cubed, use the actual S_3 action ρ(σ)v(w)=sgn(σ)v(w∘σ). The signed epsA average sends e_001 to (e_001+e_010+e_100)/3 and fixes e_000. The inversion part is already identity on this all-H¹ summand of the full Ξ_3 average, whose denominator is 48.
- `TauCeti.GeneralizedHeegner.epsA_weight_zero` (degenerate): At m=0 the projector acts as the identity on H⁰(A⁰)=F.
- `TauCeti.GeneralizedHeegner.epsA_koszul` (non-example): For that same graded S_3 action, epsA with the sign character has image dimension 4, while epsA with the trivial character is the zero operator: Λ³ of a rank-two space vanishes. This distinguishes symmetric projection from unsigned geometric averaging.

**Construction or proof.**

1. Idempotence: j is a character of Ξ_r, so ε_A = (1/|Ξ_r|) Σ j(ξ)ξ is the idempotent of the character j in ℚ[Ξ_r].
2. Künneth: H^*(A^r) = ⊕ H^{i_1} ⊗ … ⊗ H^{i_r}, and [−1] acts on H^i by (−1)^i. So the μ_2^r-part of ε_A kills every summand with some i_k ≠ 1, leaving H¹^{⊗r}.
3. On H¹^{⊗r}, the geometric action of σ ∈ S_r is sgn(σ) times the permutation of tensor factors (odd classes anticommute). The j-twisted average is therefore the symmetrizer, with image Sym^r H¹.
4. Use SF.5 for rational graph correspondences and their composition; use DD.2 for the correspondence-compatible de Rham realization and graded Künneth action. Other realizations require their own compatible product export.

**Acceptance checks.**

- r = 2: ε_A H²(A²) = Sym² H¹(A), of dimension 3, while H²(A²) has dimension 6.
- At m=3 the signed average has rank 4 on the eight-dimensional all-H¹ tensor space; omitting its permutation character gives rank 0. Both are computed from the same action, not a detached sign identity.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting](#generalizedheegnercycles-gh-0-cm-elliptic-curve-and-its-hodge-splitting), `SchemeAndStackFoundations:SF.5`, `mathlib:LinearMap`, `mathlib:LinearMap.range`, `DerivedDeRhamCohomology:DD.2`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.4), p. 1052. ε_A = (1/2^r r!) Σ j(ξ)ξ.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, Lemma 1.8, p. 1052. ε_A H^*(A^r) = Sym^r H¹(A), in degree r.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, p. 1052. Sym^r as the S_r-fixed tensors.

<a id="generalizedheegnercycles-gh-0-cm-character-decomposition"></a>
### The eigenbasis ω_A^jη_A^{r−j} of Sym^r H¹_dR(A) and its O_K-characters

**Target:** `GeneralizedHeegnerCycles:GH.0/cm-character-decomposition` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.cmCharacterDecomposition`.

For 0 ≤ j ≤ r, the classes ω_A^jη_A^{r−j} := ε_A(p_1^*ω_A ∧ … ∧ p_j^*ω_A ∧ p_{j+1}^*η_A ∧ … ∧ p_r^*η_A) form a basis of ε_A H^r_dR(A^r/F) = Sym^r H¹_dR(A/F). The diagonal action of α ∈ O_K on A^r acts on ω_A^jη_A^{r−j} by α^jᾱ^{r−j}. Moreover ω_A^jη_A^{r−j} = (j!(r − j)!/r!) Σ_{|I| = j} p_1^*ϖ_{1,I} ∧ … ∧ p_r^*ϖ_{r,I}, where ϖ_{i,I} = ω_A for i ∈ I and η_A otherwise.

**Hypotheses and conventions.**

- The Hodge type of ω^jη^{r−j} is (j, r − j), and Fil^r Sym^r H¹ is spanned by ω^r.
- Rescaling ω_A by λ multiplies ω^jη^{r−j} by λ^{2j−r}, because η_A scales by λ⁻¹. Formulas of GH.4 depend on this normalization.

**Construction or proof.**

1. ε_A applied to a pure tensor of ω's and η's averages over S_r, with the sign twist compensating the Koszul sign. Each subset I with |I| = j arises from j!(r − j)! permutations.
2. The normalized CM eigenbasis gives the usual monomial basis of the symmetric power, of dimension r+1. Its joint algebraic CM characters have distinct bidegrees (j,r−j). Do not claim that their values at every α∉ℤ are distinct: for K=ℚ(i), α=i and r=2 the j=0 and j=2 values coincide.
3. The O_K-action on p_i^*ω is by α and on p_i^*η by ᾱ (node cm-elliptic-curve-and-its-hodge-splitting).

**Acceptance checks.**

- r = 2: the basis is ω², ωη, η², with characters α², |α|², ᾱ².

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power](#generalizedheegnercycles-gh-0-cm-projector-and-symmetric-power), [GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting](#generalizedheegnercycles-gh-0-cm-elliptic-curve-and-its-hodge-splitting).

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.6), p. 1053. ω^jη^{r−j} form a basis of Sym^r H¹_dR(A).

<a id="generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector"></a>
### The variety X_r = W_r × A^r and the projector ε_X = ε_W ε_A

**Target:** `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.epsX`.
**Planet:** Generalized Kuga–Sato variety.

Over F⊇H form X_m=W_m×_F A^m, dim X_m=2m+1, and ε_X=ε_W ε_A using commuting factor correspondences. ε_W is the imported universal-family projector, including the N-torsion averaging and sign projector. ε_X is self-transpose and is defined over Z[1/(2N m!)] at the level of denominators; this does not assert that X_m itself has a model over Z[1/N].

**Hypotheses and conventions.**

- The denominators are those of ε_W^{(1)} (N^r), ε_W^{(2)} (2^r r!) and ε_A (2^r r!), so ε_X is integral after 2N·r! is inverted. The atlas asks for this record before an integral projector is asserted.
- Characteristic 0 only: the desingularization and smoothness of W_r are used over F ⊇ H of characteristic 0, as imported. The integral model over ℤ[1/N] (Conrad's appendix) is not used here.
- N > 4 makes the universal generalized elliptic curve over X₁(N) exist as a scheme.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle](#generalizedheegnercycles-gh-1-generalized-heegner-cycle): Defines the ambient projected Chow group.
- [GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology](#generalizedheegnercycles-gh-0-self-duality-of-the-projected-cohomology): Self-transposition passes Poincaré duality to the image.

**Planning API.**

- `TauCeti.GeneralizedHeegner.epsX_commute` (relation): For commuting factor realizations, interchanging ε_W and ε_A leaves ε_X unchanged. The geometric factor-commutation input comes from their separate factor actions.
- `TauCeti.GeneralizedHeegner.epsX_idem` (relation): The commuting product of the two idempotents is idempotent.
- `TauCeti.GeneralizedHeegner.epsX_factor` (simp): ε_X acts by applying ε_A and then ε_W.
- `TauCeti.GeneralizedHeegner.epsX_denominator` (data): The product-projector denominator is N^m2^{2m}(m!)²; inverting 2N m! clears it.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.X_dim` (computation): At m=2, X has dimension 5 and the graph cycle has codimension 3.
- `TauCeti.GeneralizedHeegner.epsX_weight_zero` (degenerate): With the CM factor trivial, ε_X=ε_W.
- `TauCeti.GeneralizedHeegner.epsX_factor_test` (compatibility): On a supplied tensor-factor realization the action is the composite, in the displayed order.

**Construction or proof.**

1. X_r is a product of smooth proper F-varieties, so it is smooth and proper of dimension (r + 1) + r.
2. π_r = (W_r → C) ∘ pr_1, whose fibres are those of W_r times A^r.
3. ε_W acts on the first factor and ε_A on the second, so they commute, and both preserve the fibres of π_r.
4. Transpose: the transpose of Σ c_g·g is Σ c_g·g⁻¹, and the coefficient functions of ε_W^{(1)}, ε_W^{(2)} and ε_A are invariant under g ↦ g⁻¹ (j(ξ⁻¹) = j(ξ)), so ε_X^t = ε_X.

**Acceptance checks.**

- r = 0: X_0 = W_0 = C, and ε_X = 1.
- r = 1: X_1 = E × A, of dimension 3, a threefold fibred over X₁(N).

**Direct prerequisites:** `ModularCurvesPartII:R14.3`, [GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power](#generalizedheegnercycles-gh-0-cm-projector-and-symmetric-power), `SchemeAndStackFoundations:SF.5`, `AutomorphicGaloisRepresentations:R19.1/scholl-projector`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.2, p. 1060. X_r = W_r × A^r, fibred over C.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.2, (2.2.1), p. 1061. ε_X = ε_W ε_A with commuting factors.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.1, (2.1.2), p. 1057. The projector ε_W.

<a id="generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety"></a>
### Projected middle cohomology

**Target:** `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.epsX_middle`.
**Planet:** Projected middle cohomology.

For m≥1, ε_X H*_dR(X_m)=ε_X H^{2m+1}_dR(X_m)=H¹_par(C,L_m,∇)⊗Sym^m H¹_dR(A). In the p-adic étale realization, ε_X H^{2m+1}_et(X_m,Fbar,Q_p)≅H¹_par(C_Fbar,𝕃_m)⊗Sym^m H¹_et(A_Fbar,Q_p), Galois-equivariantly. The projector kills every other cohomological degree. In particular ε_X H^{2m+2}(X_m)=0. The Hodge-filtration identification is the separate projected-hodge-filtration theorem.

**Hypotheses and conventions.**

- The imported Scholl realization has ε_W H*(W_m)=H¹_par(C,L_m) in degree m+1. Both product realizations and their correspondence-compatible Künneth isomorphisms are supplied.
- The degree-2m+2 vanishing is the input for GH.1 null-homology; the m=0 divisor uses its degree-zero correction.

**Construction or proof.**

1. Apply the supplied de Rham Künneth decomposition for W_m×A^m, respecting both factor projectors.
2. The CM projector kills degrees other than m; the modular projector kills degrees other than m+1. Their surviving tensor summand is therefore in degree 2m+1.
3. Use the rational p-adic étale Künneth export and the same graph actions to obtain the Galois-equivariant identification.

**Acceptance checks.**

- For m=1 the projected H³ of the universal elliptic surface times A is H¹_par(C,L₁)⊗H¹(A), of dimension 4 dim S₃(Γ₁(N)).

**Direct prerequisites:** `ModularCurvesPartII:R14.3`, [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector), `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `DerivedDeRhamCohomology:DD.2`, `EtaleDualityAndPerverseSheaves:EDC.6`, `AutomorphicGaloisRepresentations:R19.1/scholl-projector`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.2, Proposition 2.4, p. 1061. ε_X H^*_dR(X_r) = H¹_par(C, L_r, ∇) ⊗ Sym^r H¹_dR(A).
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.2, proof of Proposition 2.4, p. 1062. Proof via Künneth.

<a id="generalizedheegnercycles-gh-0-projected-hodge-filtration"></a>
### Projected Hodge filtration

**Target:** `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.projectedHodgeFiltration`.
**Planet:** Projected Hodge filtration.

For m≥1 and X_m/F with its supplied de Rham realization, f⊗α↦ω_f∧α identifies S_{m+2}(Γ₁(N),F)⊗Sym^m H¹_dR(A/F) with Fil^{m+1}(ε_X H^{2m+1}_dR(X_m/F)). The entire symmetric CM factor occurs, not only its holomorphic line. This is the filtration piece used as the domain of the p-adic Abel–Jacobi dual functional.

**Hypotheses and conventions.**

- The modular projected factor has Hodge types (m+1,0) and (0,m+1), with Fil¹=Fil^{m+1}=S_{m+2}; the CM symmetric factor has Hodge filtration in degrees 0 through m.
- Use the field of definition and filtered de Rham product export of the preceding realization theorem.

**Construction or proof.**

1. Import the modular Hodge identification from R14.3 and the filtered Künneth theorem from DD.2.
2. The holomorphic modular summand of filtration m+1 tensored with Fil⁰ of the CM factor contributes the stated whole tensor. The antiholomorphic modular summand has filtration zero, while the CM factor has filtration at most m, so it contributes nothing to Fil^{m+1}.
3. Identify the surviving tensor by the wedge map, preserving the specified differential normalization.

**Acceptance checks.**

- At m=1 the filtration has dimension 2 dim S₃, and contains both ω_f⊗ω_A and ω_f⊗η_A; retaining only ω_A gives half the required space.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety](#generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety), `ModularCurvesPartII:R14.3`, `DerivedDeRhamCohomology:DD.2`, `AutomorphicGaloisRepresentations:R19.1/scholl-projector`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.2, Proposition 2.5, p. 1062. The wedge map identifies the cusp-form tensor with Fil^{m+1} of the projected middle cohomology.

<a id="generalizedheegnercycles-gh-0-self-duality-of-the-projected-cohomology"></a>
### Self-duality of ε_X H^{2r+1}(X_r)(r + 1)

**Target:** `GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.projectedSelfDuality`.

Poincaré duality on the smooth proper (2r + 1)-dimensional X_r restricts to a perfect pairing ε_X H^{2r+1}(X_r) × ε_X H^{2r+1}(X_r) → H^{4r+2}(X_r) ≅ ℚ_p(−2r − 1) in étale cohomology (and into F in de Rham). So V := ε_X H^{2r+1}_et(X_{r,F̄}, ℚ_p)(r + 1) is self-dual up to ℚ_p(1): V ≅ V^∨(1). The pairing is the one induced by (2.2.3) on L_{r,r} = L_r ⊗ Sym^r H¹(A). V is the coefficient representation of the generalized Heegner classes, and its f-isotypic part is V_f ⊗ Sym^r H¹(A)(r + 1).

**Hypotheses and conventions.**

- ε_X^t = ε_X (node generalized-kuga-sato-variety-and-its-projector) is what makes the pairing restrict to the image.
- The twist (r + 1) is the self-dual twist of a weight 2r + 1 representation: V is pure of weight −1 at good primes.
- The f-isotypic identification uses the Hecke action on H¹_par(C, 𝕃_r) and the newform f's Galois representation V_f, imported from ModularCurvesPartII R14.3.

**Construction or proof.**

1. Poincaré duality on X_r pairs H^{2r+1} with itself into H^{4r+2} = ℚ_p(−2r − 1) (EtaleDualityAndPerverseSheaves EDC.2).
2. For correspondences, ⟨εx, y⟩ = ⟨x, ε^t y⟩, and ε_X^t = ε_X. So ε_X H^{2r+1} is orthogonal to (1 − ε_X)H^{2r+1}, and the pairing restricts to a perfect pairing on ε_X H^{2r+1}.
3. Twisting by (r + 1) turns the target ℚ_p(−2r − 1) into ℚ_p(1).
4. Under node cohomology-of-the-generalized-kuga-sato-variety, the pairing is the tensor product of the pairing on H¹_par(C, L_r) and the one on Sym^r H¹(A), which is (2.2.3).

**Acceptance checks.**

- r = 0: V = H¹_par(C)(1) = V_p J₁(N), which is self-dual through the Weil pairing.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety](#generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety), `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector).

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.2, (2.2.3), p. 1061. The self-duality of L_{r,r} from Poincaré duality on the fibres.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.4, (3.4.1)–(3.4.2), p.1070. Projected Poincaré duality and the annihilator filtration, rather than Proposition 2.7 (homological triviality).

<a id="generalizedheegnercycles-gh-0-newform-cm-projector"></a>
### Newform and CM coefficient projector

**Target:** `GeneralizedHeegnerCycles:GH.0/newform-cm-projector` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.coefficientProjector`.
**Planet:** Coefficient projector.

For a normalized eigenform f of weight k=m+2, take the imported f-isotypic Hecke summand of ε_W cohomology and tensor the specified CM character line in Sym^m H¹(A). Extend the coefficient field enough to split both actions. Choose an integral stable lattice only after accounting for the denominators of ε_W, ε_A and the Hecke idempotent; p∤2N m! alone does not make the Hecke idempotent integral. The Tate twist is the cohomological self-dual one, V_f(r) when k=2r.

**Hypotheses and conventions.**

- N>4 for the chosen fine Γ₁ model; k≥2; supplied Hecke eigensystem and CM realization
- At original source levels N≤4, use the requested R14.3 fine-level descent; the displayed N>4 condition belongs to the chosen model, not to CH’s source theorem.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison): Fixes the coefficient lattice and denominator assumptions before integral descent.

**Planning API.**

- `TauCeti.GeneralizedHeegner.coefficientProjector_factor` (simp): The modular and CM projections compose.
- `TauCeti.GeneralizedHeegner.coefficientProjector_twist` (compatibility): For r≥1, the fiber-power index 2r−2 gives weight 2r and the self-dual modular twist V_f(r).
- `TauCeti.GeneralizedHeegner.coefficientProjector_lattice` (data): A recorded integral lattice is preserved by the composite only after both factor projectors preserve that lattice.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.coefficientProjector_identity` (degenerate): After restricting the coefficient space to the trivial CM character summand, its identity projector leaves the f summand. The trivial-character projector on the whole symmetric power need not be the identity.
- `TauCeti.GeneralizedHeegner.coefficientProjector_order` (compatibility): On commuting projectors the order of projection does not matter.
- `TauCeti.GeneralizedHeegner.coefficientProjector_denominator` (non-example): A rational idempotent with 1/2 entries need not preserve an integral lattice: the average of (1,0) and (0,1) is (1/2,1/2).

**Construction or proof.**

1. Import the Hecke action and f projector from R14.3.
2. Apply the explicit CM character decomposition, record localization denominators, and use Poincaré duality for the twist.

**Acceptance checks.**

- A congruence prime for f can divide the Hecke denominator even if p avoids 2N m!.

**Direct prerequisites:** `ModularCurvesPartII:R14.3`, [GeneralizedHeegnerCycles:GH.0/cm-character-decomposition](#generalizedheegnercycles-gh-0-cm-character-decomposition), [GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology](#generalizedheegnercycles-gh-0-self-duality-of-the-projected-cohomology), `AutomorphicGaloisRepresentations:R19.1/scholl-projector`, `AutomorphicGaloisRepresentations:R19.1/integral-structure-of-the-newform-premotive`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §4.2, pp.14–15. Names the lattice and the self-dual Vf(r) representation.

<a id="generalizedheegnercycles-gh-0-cm-product-good-model"></a>
### Good model comparison for the CM product

**Target:** `GeneralizedHeegnerCycles:GH.0/cm-product-good-model` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.cmProductGoodModel`.

If W_m and A have smooth proper models over O_F, their product has a smooth proper model over O_F. For BDP §3 take F/Q_p finite unramified, p∤N, and a chosen good CM model; in their canonical conductor-c application also p∤c d_K. An arbitrary CM twist is not made good by p∤N. The model of W_m over Z[1/N] supplied by Conrad belongs to R14.3; it is not a global model of X_m.

**Hypotheses and conventions.**

- Both factors have supplied models; F is the local field of the chosen comparison.
- Smooth/proper product stability is already in Mathlib; this node exports the chosen arithmetic models and local comparison data to the cycle construction, rather than re-planning that stability theorem.

**Construction or proof.**

1. Base change the universal-family model.
2. Use stability of smoothness and properness under products and the independently supplied model of A.

**Acceptance checks.**

- At p=5 the CM curve y²=x³−25x has bad reduction although 5∤7; the level criterion cannot apply to its CM factor.
- Positive product-model test: at p=5 the CM curve y²=x³−x has discriminant 64, a unit in Z₅. With the supplied smooth proper W_m model for level 13, the product after a common finite unramified base change is smooth proper. Smoothness and properness must be checked on both supplied factors.

**Direct prerequisites:** `ModularCurvesPartII:R14.3`, [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector), `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.IsProper`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.2, p.1067; appendix introduction, p.1139. The finite unramified local comparison requires the smooth models.

<a id="gh-1"></a>
## GH.1. Algebraic cycles and Abel–Jacobi realizations

Construct marked CM graph cycles and their realizations. The degree-one Picard–Kummer, selected-lattice and local-field diagrams are explicit comparison targets.

<a id="generalizedheegnercycles-gh-1-isogenies-of-conductor-c-prime-to-n"></a>
### The sets Isog_c^𝔑(A) of CM isogenies of conductor c with kernel prime to A[𝔑]

**Target:** `GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n` · definition.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.IsogPair`.

Assume the Heegner hypothesis: there is an ideal 𝔑 ⊂ O_K with O_K/𝔑 ≅ ℤ/Nℤ. Fix A with End(A) = O_K and a Γ₁(N)-level structure t_A ∈ A[𝔑] over the field H̃ ⊇ H over which A[𝔑] becomes constant. Isog(A) is the set of isomorphism classes of pairs (φ, A′) with φ : A → A′ an isogeny over K̄. (φ, A′) has conductor c if End(A′) = O_c = ℤ + cO_K. Isog^𝔑(A) consists of the pairs with ker φ ∩ A[𝔑] = 0, and Isog_c^𝔑(A) = Isog_c(A) ∩ Isog^𝔑(A). For (φ, A′) ∈ Isog^𝔑(A), (A′, φ(t_A)) is a Γ₁(N)-structure and determines a point P_{A′} of C = X₁(N). The semigroup P(O_c) of invertible integral O_c-ideals relatively prime to 𝔑_c=𝔑∩O_c acts on Isog_c^𝔑(A) by 𝔞 ⋆ (φ, A′) = (φ_𝔞φ, A′/A′[𝔞]).

**Hypotheses and conventions.**

- The kernel condition ker φ ∩ A[𝔑] = 0 makes φ(t_A) a point of exact order N.
- The conductor c is determined by End(A′), an order of K.
- The suggested carrier uses native group-scheme rational points over the chosen field; in the degree comparison this field is algebraically closed of characteristic zero. Its target_cm field identifies the literal order Z+cO_K with End(A′), and its marked subgroup is ideal torsion generated by t_A. Generic ring parameters omit CM.1’s quadratic maximal-order classification, which remains a source hypothesis.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle](#generalizedheegnercycles-gh-1-generalized-heegner-cycle): Specifies the graph in the fiber over the transported CM pair.
- [GeneralizedHeegnerCycles:GH.2/cycle-norm-relations](#generalizedheegnercycles-gh-2-cycle-norm-relations): Conductor-changing ideal isogenies index Hecke neighbors.

**Planning API.**

- `TauCeti.GeneralizedHeegner.IsogPair.conductor` (data): The conductor is the positive index c in the specified ring isomorphism O_c=Z+cO_K ≅ End(A′), and is invariant under marked-target isomorphism by the imported quadratic-order classification.
- `TauCeti.GeneralizedHeegner.IsogPair.level` (projection): On the actual group-scheme point carrier, ker(φ)∩A[𝔑]=0 and A[𝔑]=Z·t_A imply addOrder(φ(t_A))=N.
- `TauCeti.GeneralizedHeegner.IsogPair.idealAction` (functoriality): Compose the marked pair with the CM.1 ideal quotient isogeny, carrying its target-order identification and the prime-to-mark kernel proof. The CM.1 theorem supplies the quotient, invertible ideal condition and reciprocity square.
- `TauCeti.GeneralizedHeegner.IsogPair.degree` (data): In the characteristic-zero geometric-point presentation, degree is the cardinality of ker(φ). The single kernel-cardinality operation is used for every map; CM.1 supplies its comparison with finite morphism degree and multiplicativity.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.isog_identity_conductor` (degenerate): Construct IsogPair.identity with target A, c=1 and target CM order (Z+O_K)≅O_K≅End(A). Check its conductor is 1, its order identification sends 1 to 1, and its actual point map fixes the chosen cyclic level generator.
- `TauCeti.GeneralizedHeegner.isog_level_failure` (non-example): For a nonzero ideal-torsion point t_A killed by N, the native multiplication-by-N endomorphism has nontrivial intersection of its point-map kernel with A[𝔑]. It therefore cannot inhabit the marked IsogPair carrier.
- `TauCeti.GeneralizedHeegner.isog_degree_multiplicativity` (compatibility): Use the same kernelDegree as the isogeny point map on the finite-kernel fixture Z/6→Z/3→Z/1. The actual quotient maps have kernel cardinalities 2,3 and 6, so composition has the product degree. This tests the cardinality adapter; the finite-morphism degree comparison remains a named CM.1 export, and no elliptic curve is constructed by this fixture.
- `TauCeti.GeneralizedHeegner.isog_conductor_order_test` (non-example): For the literal Gaussian target order O_c=Z+cZ[i], i belongs to O_1 and is excluded from O_2, while 2i belongs to O_2. This tests the actual order used by target_cm and rejects a constant maximal-order conductor model.

**Construction or proof.**

1. The endomorphism ring of an isogenous curve is an order of K, hence O_c for a unique c ≥ 1.
2. φ is injective on A[𝔑] and t_A has order N, so φ(t_A) has order N.
3. For an invertible integral O_c-ideal 𝔞 relatively prime to 𝔑_c, the quotient isogeny φ_𝔞 preserves the marked cyclic level subgroup and the target endomorphism order. Import the ideal-action theorem from CM.1, including exceptional unit fields; primality to the whole integer cN is not the definition of P(O_c).
4. For degree, use the geometric-point exact kernel sequence for two surjective finite isogenies. Kernel cardinalities multiply; the characteristic-zero finite-morphism degree comparison is supplied by CM.1. Never quantify over unrelated numerical degree functions.

**Acceptance checks.**

- K = ℚ(i), N = 5 = (2 + i)(2 − i): 𝔑 = (2 + i), with O_K/𝔑 ≅ ℤ/5ℤ.
- For A = ℂ/O_K, z ↦ cz defines an isogeny ℂ/O_K → ℂ/O_c with cyclic kernel c⁻¹O_c/O_K ≅ ℤ/cℤ, and End(ℂ/O_c) = O_c: a pair of conductor c.

**Direct prerequisites:** `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, [GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting](#generalizedheegnercycles-gh-0-cm-elliptic-curve-and-its-hodge-splitting).

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, Assumption 1.9, p. 1053. The Heegner hypothesis.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, p. 1053. Conductor of a pair (φ, A′).
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, p. 1054. Isog^𝔑(A): kernel meets A[𝔑] trivially.

<a id="generalizedheegnercycles-gh-1-generalized-heegner-cycle"></a>
### The generalized Heegner cycle Δ_φ = ε_X Υ_φ

**Target:** `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.gHC`.
**Planet:** Generalized Heegner cycle.

For (φ, A′) ∈ Isog^𝔑(A), the pair (A′, φ(t_A)) gives an embedding ι_{A′} : (A′)^m → W_m onto the fibre of W_m over P_{A′}. Let Υ_φ be the image of Graph(φ)^m ⊂ (A × A′)^m ≅ (A′)^m × A^m in X_m = W_m × A^m under ι_{A′} × id. It is a codimension-(m + 1) cycle. The generalized Heegner cycle is Δ_φ := ε_X Υ_φ ∈ CH^{m+1}(X_m)_ℚ, supported on the fibre π_m^{−1}(P_{A′}) ≅ (A′)^m × A^m. For m = 0, Δ_φ is the CM point P_{A′} of C, and it is replaced by P_{A′} − ∞ for a cusp ∞.

**Hypotheses and conventions.**

- The rational correspondence ε_X has clearing denominator N^m2^{2m}(m!)², the product of the W_m and A^m averaging denominators. This scalar (or an explicitly justified multiple) clears its graph-cycle denominators; (2N·m!)² need not do so. Additional f-projector and integral-lattice denominators belong to the separate coefficient comparison.
- Graph(φ)^m has dimension m in the 2m-dimensional fibre, so it has codimension m+1 in X_m of dimension 2m+1.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map): Provides the null-homologous Chow input to the Gysin extension.
- [GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula](#generalizedheegnercycles-gh-4-bdp-special-value-formula): Provides the isogeny-indexed cycle whose Abel–Jacobi image occurs in the formula.

**Planning API.**

- `TauCeti.GeneralizedHeegner.gHC_codim` (data): The m-dimensional graph product in X_m of dimension 2m+1 has codimension m+1.
- `TauCeti.GeneralizedHeegner.gHC_projector` (characterisation): ε_X fixes Δ_φ.
- `TauCeti.GeneralizedHeegner.gHC_rational_equivalence` (compatibility): Rationally equivalent graph representatives give the same cycle class.
- `TauCeti.GeneralizedHeegner.gHC_baseChange` (functoriality): Base change commutes with projection when graph correspondences and the projector are transported.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.upsilon_codim` (computation): At m=2 the graph has dimension 2 and codimension 3 in X₂.
- `TauCeti.GeneralizedHeegner.gHC_weight_zero` (degenerate): At m=0 replace the point by point minus a chosen cusp; its degree is zero.
- `TauCeti.GeneralizedHeegner.gHC_projected_test` (characterisation): An idempotent ε fixes gHC(ε,graph), and gHC(id,graph)=graph. Together these exclude both an unprojected graph and the identically zero construction (take a nonzero graph for the identity fixture).

**Construction or proof.**

1. ι_{A′} identifies (A′)^m with the fibre of the fibre-power E^m over P_{A′}, which lies in the smooth locus of W_m since P_{A′} is not a cusp.
2. Graph(φ) ⊂ A × A′ is a curve. Its m-th power is an m-dimensional subvariety of (A × A′)^m, reordered as (A′)^m × A^m.
3. Apply the correspondence ε_X (GH.0) on Chow groups with ℚ-coefficients (SchemeAndStackFoundations SF.5). ε_X preserves the fibres of π_m, so the support stays in π_m^{−1}(P_{A′}).

**Acceptance checks.**

- m = 1: Υ_φ = Graph(φ) ⊂ A′ × A = the fibre of E × A over P_{A′}, a curve in the threefold X_1.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector), [GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n](#generalizedheegnercycles-gh-1-isogenies-of-conductor-c-prime-to-n), `SchemeAndStackFoundations:SF.5`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.3, p. 1062. The cycle Υ_φ = Graph(φ)^r.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.3, p. 1063. Δ_φ = ε_X Υ_φ is supported on the fibre over P_{A′}, in CH^{r+1}(X_r)_ℚ.

<a id="generalizedheegnercycles-gh-1-field-of-definition-of-generalized-heegner-cycles"></a>
### BDP Remark 2.6: the field of definition of Δ_φ

**Target:** `GeneralizedHeegnerCycles:GH.1/field-of-definition-of-generalized-heegner-cycles` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.gHC_descent`.

If (φ, A′) ∈ Isog_c^𝔑(A), then Δ_φ is defined over the compositum H̃·H_c of the abelian extension H̃/K over which (A, t_A) is defined with the ring class field H_c of conductor c. So the Δ_φ are defined over abelian extensions of K.

**Hypotheses and conventions.**

- The CM main theorem supplies descent of the marked pair to H̃·H_c; use the requested general CM.1 export when HE.1’s restricted unit-field hypotheses do not apply.

**Construction or proof.**

1. The CM main theorem makes (A′, φ(t_A)) and φ defined over H̃·H_c for (φ, A′) of conductor c (HE.1 under its hypotheses, otherwise the CM.1 request).
2. W_r, A and ε_X are defined over H (GH.0), so ι_{A′}, Υ_φ and Δ_φ are defined over H̃·H_c.

**Acceptance checks.**

- c = 1: Δ_φ is defined over H̃, the field of definition of A[𝔑].

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle](#generalizedheegnercycles-gh-1-generalized-heegner-cycle), `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.3, Remark 2.6, p. 1063. Δ_φ is defined over H̃·H_c.

<a id="generalizedheegnercycles-gh-1-homological-triviality-of-generalized-heegner-cycles"></a>
### BDP Proposition 2.7: Δ_φ is homologically trivial

**Target:** `GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.gHC_homologically_trivial`.

For m ≥ 1, the cycle class of Δ_φ in ε_X H^{2m+2}(X_m) vanishes in every cohomology theory (de Rham, étale, Betti), so Δ_φ ∈ CH^{m+1}(X_m)_{0,ℚ}. For m = 0, P_{A′} − ∞ is homologically trivial.

**Hypotheses and conventions.**

- The vanishing of ε_X H^{2m+2}(X_m) is the only input for m ≥ 1.
- Cycle class maps in the claimed realizations commute with correspondences. The rational étale passage from finite Gysin/cycle-class maps is part of the EDC.6 request; filtered de Rham compatibility is requested from DD.2. Betti compatibility requires the corresponding classical realization and is not inferred from torsion étale purity.

**Construction or proof.**

1. cl(Δ_φ) = cl(ε_X Υ_φ) = ε_X cl(Υ_φ) ∈ ε_X H^{2m+2}(X_m) (requested rational EDC.6 and de Rham DD.2 correspondence compatibilities, with a separate Betti realization comparison).
2. ε_X H^{2m+2}(X_m) = 0 for m ≥ 1 (GH.0/cohomology-of-the-generalized-kuga-sato-variety).
3. m = 0: a degree-zero divisor on a curve is homologically trivial.

**Acceptance checks.**

- m = 1: cl(Δ_φ) ∈ ε_X H⁴(E × A) = 0.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety](#generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle](#generalizedheegnercycles-gh-1-generalized-heegner-cycle), `EtaleDualityAndPerverseSheaves:EDC.6`, `DerivedDeRhamCohomology:DD.2`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §2.3, Proposition 2.7, p. 1063. Δ_φ is homologically trivial.

<a id="generalizedheegnercycles-gh-1-etale-abel-jacobi-map"></a>
### BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre

**Target:** `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.ajEt`.
**Planet:** Étale Abel–Jacobi map.

For X_m/F and V=ε_XH_et^{2m+1}(X̄_m,Q_p)(m+1), the étale Abel–Jacobi map sends a projected null-homologous codimension m+1 cycle to H¹(F,V). Use the Gysin exact sequence for U=X minus its support, pull back along its cycle class in the residue term, then identify Ext¹_G(Q_p,V) with H¹(F,V). It is independent of support and representative, with restriction, proper pushforward and correspondence equivariance. For m=0 the degree-zero cusp correction is required.

**Hypotheses and conventions.**

- The exactness uses m ≥ 1: ε_X H^{2m−1}(X_P)(m) = 0, and ε_X H^{2m}(X_P)(m)^0 = ε_X H^{2m}(X_P)(m) because ε_X H^{2m+2}(X_m) = 0.
- The target is rational continuous Galois cohomology. Its Gysin sequence and Ext¹-to-H¹ identification, including support/rational-equivalence independence, are explicit EDC.6, R02.1 and SF.5 requests. The integral lattice and projector denominators are the separate integral-abel-jacobi-comparison node.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections](#generalizedheegnercycles-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections): The finite local condition is imposed on actual cohomology classes.
- [GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization](#generalizedheegnercycles-gh-7-higher-weight-family-specialization): Fixes the cycle class normalization being compared with Howard’s point tower.

**Planning API.**

- `TauCeti.GeneralizedHeegner.ajEt_add` (simp): The map is additive on projected null-homologous cycles.
- `TauCeti.GeneralizedHeegner.ajEt_correspondence` (compatibility): A correspondence acts compatibly on cycles and the coefficient representation.
- `TauCeti.GeneralizedHeegner.ajEt_restriction` (functoriality): Restriction to F′ carries AJ_F(Δ) to AJ_F′(Δ_F′).
- `TauCeti.GeneralizedHeegner.ajEt_extension` (characterisation): The cocycle is g↦g·lift(1)−lift(1), and changing the lift adds a coboundary.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.ajEt_zero` (degenerate): The zero cycle gives the split extension and the zero cohomology class.
- `TauCeti.GeneralizedHeegner.ajEt_lift_change` (characterisation): Changing the lift by b adds precisely the coboundary g·b−b, with this sign.
- `TauCeti.GeneralizedHeegner.ajEt_weight_zero` (compatibility): On X₀ the degree-zero divisor map agrees with Jacobian Kummer under the imported Abel–Jacobi comparison.

**Construction or proof.**

1. Gysin sequence for the smooth divisor X_P ⊂ X_m with complement X_m^♮, twisted by (m + 1) (finite-coefficient EDC.3 followed by the requested EDC.6 rational passage).
2. Apply ε_X, which preserves X_P and X_m^♮ because it preserves the fibres of π_m. Then ε_X H^{2m−1}(X_P) = 0 (the ε_W part of the cohomology of a single fibre lives in degree m), and ε_X H^{2m+2}(X_m) = 0, giving the short exact sequence.
3. cl_P(Δ) ∈ ε_X H^{2m}(X̄_P)(m). Pull back along the map sending 1 to it; the class in Ext¹ = H¹ of Galois cohomology (requested ArithmeticGaloisDuality R02.1 continuous-representation Ext/H¹ comparison) is AJ^et_F(Δ).
4. For support enlargement and rational-equivalence independence, use the requested rational Gysin compatibility and Chow-cycle Abel–Jacobi comparison. BDP Remark 3.2 cites Nekovář Proposition II.2.4; compact inflation–restriction alone does not prove this comparison.

**Acceptance checks.**

- r = 0 analogue: for P − ∞ on a curve, AJ^et is the Kummer class of the point of the Jacobian.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles](#generalizedheegnercycles-gh-1-homological-triviality-of-generalized-heegner-cycles), `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `SchemeAndStackFoundations:SF.5`, `ArithmeticGaloisDuality:R02.1`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.1, p. 1065. The Gysin sequence (3.1.1).
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.1, Definition 3.1, p. 1066. AJ^et_F as the class of the pulled-back extension.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.1, Remark 3.2, p. 1067. Compatibility with the general definition.

<a id="generalizedheegnercycles-gh-1-extensions-of-filtered-frobenius-modules"></a>
### BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight

**Target:** `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules` · lemma.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.filteredFrobeniusExtension`.

For a negative-weight admissible filtered Frobenius module H over finite unramified F/Q_p, write Φ=Φ₀^[F:Q_p], the F-linear iterate of semilinear crystalline Frobenius. Weight separation gives 1−Φ invertible. Every extension 0→H→D→F→0 has a unique Φ-fixed lift of 1 and a lift in Fil⁰D; their difference, in the order holomorphic minus Frobenius, defines a class in H/Fil⁰H and induces Ext_ffm¹(F,H)≅H/Fil⁰H. Semilinear Φ₀-fixed elements alone do not form the required F-linear splitting.

**Hypotheses and conventions.**

- The weight hypothesis is used to make E^{Φ=1} → F an isomorphism, and to make the class independent of the lift η^frob.

**Construction or proof.**

1. Since H^{Φ=1} = 0, the map E^{Φ=1} → F^{Φ=1} = F is injective, and it is surjective because the extension of φ-modules splits (Φ − 1 is bijective on H by the weight hypothesis). This gives a φ-module splitting E = H ⊕ F with η^frob = (0, 1).
2. The filtration on E is determined by Fil⁰E = Fil⁰H + F·η^hol, with η^hol = (h, 1). Two choices give the same filtration iff h − h′ ∈ Fil⁰H.
3. Hence the class of h in H/Fil⁰H classifies the extension.

**Acceptance checks.**

- H = F(1), the Tate twist of weight −2 (Fil⁰H = 0): Ext¹_ffm(F, F(1)) ≅ F.

**Direct prerequisites:** `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.5`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.3, p. 1068. The setting of Proposition 3.5.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.3, Proposition 3.5, p. 1069. Ext_ffm(F, H) = H/Fil⁰H.

<a id="generalizedheegnercycles-gh-1-p-adic-abel-jacobi-map"></a>
### The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m

**Target:** `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.ajP`.
**Planet:** p-adic Abel–Jacobi map.

Under BDP §3’s finite unramified F/Q_p and supplied smooth proper models, AJ_et(Δ) lies in H¹_f(F,V). The crystalline extension gives the filtered Frobenius extension of the preceding node; its holomorphic-minus-Frobenius class lies in D_dR(V)/Fil⁰. Poincaré duality identifies this quotient with (S_{m+2}⊗Sym^mH¹_dR(A/F))∨, yielding AJ_F. This use of an unramified F records the selected presentation, not a claim that Bloch–Kato theory requires unramified F in general.

**Hypotheses and conventions.**

- For the BDP §3.2 comparison, F/ℚ_p is finite unramified and C and X_m have specified smooth proper models over O_F. These are separate local hypotheses, imported with crystalline comparison and Nekovář’s containment theorem from PadicHodgeTheory R06.5.
- In BDP’s selected conductor-c CM application, p∤cNd_K permits the stated choice of F and good models; the numerical condition is not a good-reduction certificate for an arbitrary CM twist. GH.0/cm-product-good-model supplies the product only after the W_m and A factors have their own models over the same O_F.
- H = ε_X H^{2m+1}_dR(m + 1) has weight −1 < 0, as Proposition 3.5 requires.
- Negative weight gives D_cris(V)^{φ=1}=0. Consequently H¹_e(F,V)=H¹_f(F,V), so the L1 logarithm, whose supplied domain is H¹_e, applies to the geometric finite class.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula](#generalizedheegnercycles-gh-1-coleman-abel-jacobi-formula): Allows the analytic primitive to evaluate the cycle extension.
- [GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula](#generalizedheegnercycles-gh-4-bdp-special-value-formula): Fixes the functional and periods in the squared formula.

**Planning API.**

- `TauCeti.GeneralizedHeegner.ajP_etale` (compatibility): AJ_p is the crystalline/Bloch–Kato logarithm of AJ_et under the stated quotient and duality identification.
- `TauCeti.GeneralizedHeegner.ajP_add` (simp): AJ_p is additive in Δ.
- `TauCeti.GeneralizedHeegner.ajP_pairing` (data): Evaluation on ω_f⊗ω_A^jη_A^(m−j) uses the Poincaré dual functional and the fixed Tate twist.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.ajP_zero` (degenerate): A split étale extension has zero p-adic Abel–Jacobi functional.
- `TauCeti.GeneralizedHeegner.ajP_filtration_independence` (characterisation): Changing the Hodge lift by Fil⁰ does not change its quotient class.
- `TauCeti.GeneralizedHeegner.ajP_sign` (non-example): The recipe is holomorphic lift minus Frobenius lift: swapping the order negates the quotient class.

**Construction or proof.**

1. AJ^et_F(CH^{m+1}_0) ⊆ H¹_f (Nekovář, Theorem 3.1.1; Nizioł), requested from PadicHodgeTheory R06.5.
2. Faltings: ε_X H^{2m+1}_et(X̄_m)(m + 1) is crystalline with D_cris equal to ε_X H^{2m+1}_dR(X_m/F)(m + 1) (R06.5). D_cris is fully faithful, and surjectivity onto Ext_ffm comes from the Bloch–Kato exponential (BDP Corollary 3.4; R06.2).
3. Use negative weight to exclude the Frobenius eigenvalue 1, identify H¹_f with H¹_e, then use the supplied L1 logarithm. The filtration identification is the separate projected-hodge-filtration node, not Künneth alone.
4. Proposition 3.5 with H = ε_X H^{2m+1}_dR(m + 1) of weight −1.
5. Poincaré duality makes Fil¹ε_X H^{2m+1}(m) and Fil⁰ε_X H^{2m+1}(m + 1) exact annihilators, so H/Fil⁰H = (Fil^{m+1} ε_X H^{2m+1}_dR)^∨ (GH.0/self-duality-of-the-projected-cohomology).
6. Fil^{m+1} ε_X H^{2m+1}_dR = S_{m+2}(Γ, F) ⊗ Sym^m H¹_dR(A) (GH.0/projected-hodge-filtration).

**Acceptance checks.**

- r = 0: AJ_F(P − ∞)(ω_f) = ∫_∞^P ω_f, the Coleman integral, which BDP §3.6 recovers.
- Reject the inference from p∤N alone: y²=x³−25x at p=5 is a bad CM twist even when N=7; it does not satisfy the supplied-model hypothesis of this Abel–Jacobi comparison.
- For y²=x³−x at p=5 and level N=13, use its unit discriminant 64 and the supplied W_m model to form X_m over a common finite unramified O_F; pass those same model data to the GH.1 comparison.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map), [GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules](#generalizedheegnercycles-gh-1-extensions-of-filtered-frobenius-modules), [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model), `PadicHodgeTheory:R06.5`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `PadicHodgeRegulators:L1/bloch-kato-logarithm`, [GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration](#generalizedheegnercycles-gh-0-projected-hodge-filtration), [GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology](#generalizedheegnercycles-gh-0-self-duality-of-the-projected-cohomology).

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.2, pp.1067–1068; introduction, p.1040. Finite unramified F and the smooth proper C and X_m models are assumed independently; the following selected CM application imposes p∤cNd_K.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.2, Theorem 3.3, p. 1068. Faltings' crystalline comparison.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.4, p. 1069. AJ^et lands in H¹_f = Ext_cris.
- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.4, p. 1070. Definition of AJ_F.

<a id="generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison"></a>
### Integral Abel–Jacobi comparison

**Target:** `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.integralAJComparison`.

For p∤2N m!, invert the remaining f-projector denominator and choose the specified stable lattice T in V_f(r), m=2r−2. The cycle extension gives an integral class in H¹(K̃_c,T⊗Sym^{2r−2}T_p(A)(1−r)); its rationalization is AJ_et in the displayed self-dual twist. Descent from the ray field K̃_c to K_c uses invariance together with the compact inflation–restriction sequence and vanishing of coefficient invariants, rather than invariance alone.

**Hypotheses and conventions.**

- The coefficient lattice and the f-projector denominator are fixed; r≥1; residual invariant vanishing is stated separately.

**Construction or proof.**

1. Track the localization of every correspondence in the Gysin sequence.
2. Use the integral Hecke lattice comparison requested from R14.3, then HS/compact-five-term to descend.

**Acceptance checks.**

- Integral descent fails without the invariant-vanishing input; rationalization alone does not remove a congruence denominator.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/newform-cm-projector](#generalizedheegnercycles-gh-0-newform-cm-projector), [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map), `ArithmeticGaloisDuality:R02.2/compact-five-term`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §4.2, (4.2), pp.14–15. Integral lattice, symmetric power and descent target are explicit.

<a id="generalizedheegnercycles-gh-1-character-projected-heegner-class"></a>
### Character-projected Heegner class

**Target:** `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.characterHeegnerClass`.
**Planet:** Character-projected Heegner class.

For CH’s canonical CM A/H_K and B=Res_{H_K/K}A, use the literal full symmetric-power module S=Sym^{2r−2}T_p(B)(1−r)⊗O_F, after the required coefficient extension. For an anticyclotomic χ of type (j,−j), −r<j<r, conductor c₀p^s with (c₀,Np)=1, choose the finite-order anticyclotomic χ_t of the same conductor, unique up to a Hilbert class character, so χ is a coefficient summand of S⊗χ_t. Apply its G_K-equivariant projector to the twisted finite-level class to define z_{f,χ,c}∈H¹(K_c,T⊗χ), as in (4.6), for c divisible by the conductor. The separately weighted corestriction (4.7) defines z_{f,χ}∈H¹(K,T⊗χ). Do not identify S with Ind_{G_H_K}^{G_K}Sym^{2r−2}T_p(A)(1−r): the printed isomorphism has unequal ranks (source issue E7). Integral projectors and the inclusion of the original A-coefficient class require the recorded CM.1 adapter.

**Hypotheses and conventions.**

- CH §4.4 hypotheses and coefficient field containing CM and χ values.
- The literal symmetric-power carrier and the chosen character summand must be checked independently of the false Sym/Ind identification. A finite-order χ_t is not necessarily unramified: only its ambiguity is a Hilbert class character. Integral eigenprojection denominators remain a gap.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula](#generalizedheegnercycles-gh-4-ramified-character-abel-jacobi-formula): Provides the correctly twisted class whose local logarithm is evaluated.
- [GeneralizedHeegnerCycles:GH.6/selmer-rank-one](#generalizedheegnercycles-gh-6-selmer-rank-one): Supplies the actual nonzero class generating the Selmer space.

**Planning API.**

- `TauCeti.GeneralizedHeegner.characterHeegnerClass_eigen` (characterisation): With the character-projector law ρ(g)e_χ=χ(g)e_χ, the projected class satisfies ρ(g)z_χ=χ(g)z_χ. Idempotence alone asserts membership in the projector image and does not specify χ.
- `TauCeti.GeneralizedHeegner.characterHeegnerClass_cores` (functoriality): Corestriction commutes with the character projector after coefficient descent.
- `TauCeti.GeneralizedHeegner.characterHeegnerClass_sum` (constructor): Weighted corestriction is additive in the conductor-indexed cycle classes.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.characterHeegnerClass_trivial` (degenerate): On the already selected trivial CM character component its projector is the identity. This does not assert identity on the entire symmetric-power coefficient module.
- `TauCeti.GeneralizedHeegner.characterHeegnerClass_orthogonal` (non-example): Orthogonal idempotents kill the class projected to the other character.
- `TauCeti.GeneralizedHeegner.characterHeegnerClass_add_test` (compatibility): The construction agrees with the linear coefficient projection on a sum of two classes.

**Construction or proof.**

1. Import the Weil restriction Tate module and CM characters, extend coefficients, and decompose the full symmetric power into monomial character lines; do not commute Sym with induction.
2. Use the chosen χ line in S⊗χ_t to project the finite-level class, following (4.5)–(4.6). Establish the requested integral projector and class inclusion separately.
3. Apply (4.7)’s weighted corestriction for the global class, retaining the distinction between z_{f,χ,c} and z_{f,χ}.

**Acceptance checks.**

- A class merely valued in Sym^mT_p(A) is not yet a G_K class when A is only defined over H_K.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison), [GeneralizedHeegnerCycles:GH.0/cm-character-decomposition](#generalizedheegnercycles-gh-0-cm-character-decomposition), `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `ArithmeticGaloisDuality:R02.2/compact-five-term`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §4.4–4.5, (4.5)–(4.7), pp.17–20. The Weil restriction supplies a G_K action that A/H alone does not have.

<a id="generalizedheegnercycles-gh-1-parabolic-residue-pairing"></a>
### Parabolic residue pairing

**Target:** `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.parabolicResiduePairing`.

For BDP’s punctured good-reduction curve with coefficient isocrystal L_{m,m}, a de Rham class is parabolic exactly when its annular residues vanish, including the horizontal cusp residue. For parabolic representatives ω₁,ω₂, the Poincaré pairing is Σ_j res_{V_j}⟨F_{1,j},ω₂⟩, where ∇F_{1,j}=ω₁. Changing a local primitive by a horizontal section does not change the pairing.

**Hypotheses and conventions.**

- BDP §3.5 good model, distinct residue disks, annuli and self-dual coefficient system; both classes parabolic.

**Construction or proof.**

1. Import the rigid/algebraic comparison and residue theorem.
2. Use the Cech–de Rham description and zero residue to eliminate dependence on horizontal constants.

**Acceptance checks.**

- Adding a horizontal constant changes no parabolic residue pairing.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `PadicDifferentialEquationsAndRigidCohomology:RD.4`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-f-isocrystal`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.5, Propositions 3.9–3.10, pp.1074–1075. The cup product is calculated as a sum of annular residues.

<a id="generalizedheegnercycles-gh-1-coleman-primitive"></a>
### Coleman primitive for the modular differential

**Target:** `GeneralizedHeegnerCycles:GH.1/coleman-primitive` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.colemanPrimitive`.
**Planet:** Coleman primitive.

For ω_f valued in L_m choose a Frobenius annihilator P killing its parabolic cohomology class, invertible on horizontal sections, with P(1)≠0. The Coleman primitive F_f is the locally analytic section with ∇F_f=ω_f and P(Φ)F_f rigid analytic on a Frobenius neighborhood. Weight separation and gluing make it choice independent; for m>0 it is unique and for m=0 unique modulo constants. Evaluation uses the specified ordinary CM residue disk and normalized basis.

**Hypotheses and conventions.**

- The good unramified local model and overconvergent Frobenius isocrystal are supplied; the weight-separation lemma applies.
- For the available section/differential prototype, supply the connection, F-linear Frobenius, annihilator polynomial P with P(1)≠0, rigid section submodule and a normalization complement disjoint from the connection kernel. The input is in the range of the connection on normalized sections satisfying P(Φ)F∈rigid. BDP Theorem 3.15 and the requested RD.4 comparison must produce this range witness for ω_f; the constructor does not claim every arbitrary differential is integrable.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula](#generalizedheegnercycles-gh-1-coleman-abel-jacobi-formula): Computes the holomorphic extension term and kills the Frobenius term.
- [GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation](#generalizedheegnercycles-gh-1-coleman-depletion-calculation): Relates component pairings to p-depleted modular forms.

**Planning API.**

- `TauCeti.GeneralizedHeegner.colemanPrimitive_differential` (characterisation): For the selected datum C and its integrable differential input ω, C.connection(colemanPrimitive(C,ω))=ω.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_frobenius` (characterisation): Evaluate the datum’s actual polynomial P on its Frobenius operator: P(Φ)colemanPrimitive(C,ω) lies in C.rigid.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_choice` (extensionality): Any section with the same differential differs from the constructed primitive by a section in the kernel of C.connection. Within the selected normalization complement this difference vanishes; globally weight zero retains constant ambiguity.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.colemanPrimitive_zero` (degenerate): In the affine disk fixture of sections a+bX with evaluation-at-zero normalization, the constructed primitive of the zero differential is zero.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_constants` (non-example): For the constructed primitive of dX, adding the actual constant section 1 preserves the connection value 1 but changes the section and makes its value at zero equal to 1. Thus the unnormalized weight-zero uniqueness claim fails.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_residue_test` (compatibility): For the same constructed primitive of dX, a constant change c contributes c times the X⁻¹ coefficient of dX to the residue pairing. That coefficient is zero, so the change contributes zero; no assumed zero bilinear pairing replaces the residue functional.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_nonzero` (computation): On affine sections a+bX, use ∇(a+bX)=b dX, Φ(X)=5X, P(T)=T−5 and F(0)=0. Compute colemanPrimitive(dX)=X, its connection is dX and P(Φ)X=0; P(1)=−4 is nonzero. An identically zero primitive fails this nonzero-input test.

**Construction or proof.**

1. Import overconvergent Frobenius and solve locally by an analytic primitive.
2. Invert P(Φ) on horizontal sections to impose the rigid condition; glue and track the m=0 constant ambiguity.
3. Express the normalized analytic construction on the image of the admissible connection, rather than claiming a right inverse for an arbitrary map. The zero-kernel complement makes this preimage unique. A finite affine-disk realization tests the operator and normalization; it does not prove the global wide-open modular input theorem.

**Acceptance checks.**

- For m=0 an arbitrary constant remains; at m>0 no global horizontal section remains.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing](#generalizedheegnercycles-gh-1-parabolic-residue-pairing), `PadicDifferentialEquationsAndRigidCohomology:RD.4`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-f-isocrystal`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.6, Lemma 3.14, Theorem 3.15 and Remarks 3.16–3.17, pp.1076–1078. Choice independence and the weight-zero constant ambiguity are explicit.

<a id="generalizedheegnercycles-gh-1-coleman-abel-jacobi-formula"></a>
### Coleman Abel–Jacobi formula

**Target:** `GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.colemanAJ`.
**Planet:** Coleman Abel–Jacobi formula.

For an ordinary marked isogeny φ:A→A′ and α∈Sym^mH¹_dR(A), AJ_F(Δ_φ)(ω_f⊗α)=⟨F_f(P_{A′})⊗α,cl_{P_{A′}}Δ_φ⟩=⟨φ*F_f(P_{A′}),α⟩_A. If φ*ω′=ω and d=deg φ, then evaluation on ω_A^jη_A^{m−j} is d^jG_j(A′,t′,ω′).

**Hypotheses and conventions.**

- BDP §3.7 local hypotheses; 0≤j≤m; normalized isogeny differential.

**Construction or proof.**

1. Use the parabolic residue formula on the extension defining AJ_p.
2. The holomorphic term is the evaluation at the CM point (Lemma 3.19). The Frobenius term vanishes by P(1)≠0 and the rigid residue theorem (Lemma 3.20).
3. Apply the projection formula to the isogeny graph and φ*η′=dη.

**Acceptance checks.**

- At j=0 the degree factor is 1; at j=m it is d^m.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map](#generalizedheegnercycles-gh-1-p-adic-abel-jacobi-map), [GeneralizedHeegnerCycles:GH.1/coleman-primitive](#generalizedheegnercycles-gh-1-coleman-primitive), [GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing](#generalizedheegnercycles-gh-1-parabolic-residue-pairing).

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.7, Propositions 3.18, 3.21 and Lemma 3.22, pp.1078–1084. The residue computation evaluates AJ on the isogeny graph.

<a id="generalizedheegnercycles-gh-1-coleman-depletion-calculation"></a>
### Depleted Coleman component calculation

**Target:** `GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.colemanDepletion`.

For the normalized components G_j=⟨F_f,ω^jη^{m−j}⟩ and f♭ the p-depletion, G_j♭=j! θ^{−1−j}f♭ on the ordinary locus. The negative power is the continuous p-adic extension of θ on p-depleted q-series. The proof uses the connection in the Tate-curve basis, the recurrence G_0♭=θ⁻¹f♭ and G_j♭=jθ⁻¹G_{j−1}♭, plus the q-expansion principle. θ, U, V, depletion and q-expansion principle belong to the modular-forms suppliers.

**Hypotheses and conventions.**

- 0≤j≤m; ordinary locus; supplied q-expansion principle and inverse θ on p-depleted forms.

**Construction or proof.**

1. Use the connection and unit-root splitting to obtain the component recurrence.
2. Check the q-expansion and apply the imported q-expansion principle.

**Acceptance checks.**

- The coefficient of q^n, p∤n, is j! a_n/n^{j+1}; at j=0 it is a_n/n.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/coleman-primitive](#generalizedheegnercycles-gh-1-coleman-primitive), `ModularCurvesPartII:R14.3`, `AutomorphicPadicLFunctions:L3h`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.8, Proposition 3.24, (3.8.5)–(3.8.6), pp.1086–1088. States the factorial and negative Atkin–Serre power.

<a id="generalizedheegnercycles-gh-1-syntomic-abel-jacobi-comparison"></a>
### Syntomic Abel–Jacobi comparison

**Target:** `GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.syntomicAJComparison`.

For the supplied smooth proper model of X_m and projected homologically trivial cycles, a geometric syntomic regulator and its étale comparison must identify the syntomic Abel–Jacobi image with AJ_p after Bloch–Kato logarithm and the exact Frobenius normalization. Besser’s regulator on Spec O_F, or its K₂ curve specialization, does not supply this higher-dimensional correspondence-compatible statement. This is a requested extension of D.2, with the precise comparison a gap until supplied.

**Hypotheses and conventions.**

- Good model, cycle support extension and the same Tate and Frobenius conventions as AJ_p.

**Construction or proof.**

1. Import the generic syntomic complex and Chern class formalism.
2. Obtain the higher-dimensional cycle regulator and compare its Gysin extension with the étale one. The absent supplier comparison is explicitly recorded.

**Acceptance checks.**

- At weight zero the syntomic regulator must reproduce the Abel–Jacobi/Kummer comparison, including the Frobenius factor.

**Direct prerequisites:** `PadicHodgeRegulators:D.2`, [GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map](#generalizedheegnercycles-gh-1-p-adic-abel-jacobi-map), [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model).

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §3.4, pp.1068–1070. Identifies the realization to which a geometric syntomic regulator must compare.

<a id="generalizedheegnercycles-gh-1-classical-generalized-cycle-comparison"></a>
### Classical and generalized cycle comparison

**Target:** `GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.classicalGeneralizedComparison`.

Put r1≥r2≥0 of the same parity, u=(r1−r2)/2, X_r1,r2=W_r1×A^r2, and let a be prime to N. BDP17 Proposition 4.1.1 supplies a rational algebraic correspondence P:X_r1,r1 → X_r1,r2 with P_*Delta_r1,a=(Na)^u Delta_r1,r2,a. At a place of good reduction and for 0≤j≤r2, Proposition 4.1.2 gives (Na)^u beta_v(Delta_r1,r2,a)[omega wedge omega_A^j eta_A^(r2−j)] = (2 sqrt(−D_K))^u beta_v(Delta_r1,a)[omega wedge omega_A^(j+u) eta_A^(r2−j+u)]. For r1=2r−2,r2=0,u=r−1 this is the classical/generalized Abel–Jacobi evaluation adapter used by Castella Theorem 6.5. Global etale transport uses the actual P and Abel–Jacobi functoriality; the displayed scalar evaluation alone does not identify integral global classes. The half-unit u_c0=|O_c0^times|/2 in Castella is a separate tower/trace normalization.

**Hypotheses and conventions.**

- BDP17 §4.1 ideal Heegner hypothesis, CM level point, r1≥r2 of equal parity, a prime to N, and a number field defining all objects; both varieties have good reduction at v. The normalized CM differential and conjugate line satisfy their fixed cup pairing.
- The correspondence is rational. Any integral class comparison records its projector, isogeny-degree and lattice denominators; a scalar identity in de Rham functionals does not make those denominators units.

**Construction or proof.**

1. Use the graph of sqrt(−D_K) on each of the u paired CM factors to form P, as in BDP17 Proposition 4.1.1. Verify the graph intersections and signed projectors give (Na)^u, retaining rational coefficients.
2. By functoriality move P from the cycle to the test differential. The projected Kunneth class of the transpose CM graph contributes 2 sqrt(−D_K) per pair; the pure-factor cup terms vanish under the sign projector. This is Proposition 4.1.2, pp.40–41.
3. Specialize r2=0 and compare the actual etale realization of P through GH.1 integral comparison before applying the family class theorem. Compute the full/half CM-unit trace factor independently at conductor zero.

**Acceptance checks.**

- u=0 gives the identity correspondence and scalar 1. At r=2,r2=0, the single CM pair contributes 2 sqrt(−D_K), not its inverse. No arbitrary nonzero factor is declared a p-adic unit.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class), [GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison).

**Sources.**

- [bdp-coniveau-published](#source-bdp-coniveau-published), §4.1, Proposition 4.1.1, pp.38–40; Proposition 4.1.2, equation (4.1.5) and proof, pp.40–41. Correspondence pushforward and the explicit normalized Abel–Jacobi evaluation; integral global transport is a distinct requirement.
- [castella-variation](#source-castella-variation), §6.2, proof of Theorem 6.5, p.28, equations (6.7)–(6.8). Uses r1=2r−2,r2=0 and the half-unit normalization.

<a id="generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison"></a>
### Degree-one Picard–Kummer and Gysin comparison

**Target:** `GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.degreeOnePicardKummerComparison`.

For a smooth proper geometrically connected curve C/L of characteristic zero with L-rational basepoint and J=Pic0(C), let D=sum_s n_s[s] be a Galois-stable degree-zero divisor. Under J[p^a]=H1_et(C_bar,mu_p^a), the finite Gysin extension boundary associated to (n_s mod p^a)_s equals the Kummer cocycle of [O(D)] in H1(L,J[p^a]), with Gysin and connecting homomorphisms normalized by sigma(Q)−Q for p^a Q=[D]. Passing compatibly in a and then rationalizing identifies GH.1 AJ_et(D) with kappa_J([D]) in H1(L,V_pJ). For an actual quotient q:J→E this gives q_* AJ_et(D)=kappa_E(q[D]).

**Hypotheses and conventions.**

- D is defined over L, or its finite support is treated as a Galois set; the support degree map includes residue degrees. Normalize the Poincare bundle at the basepoint and use the same Weil-pairing/Tate-twist convention in both exact sequences.
- J and q are the actual Picard variety and modular quotient supplied by the curve/Jacobian owners. Continuous inverse limits require their cochain/derived-limit comparison; only the rational comparison is asserted before lattice bounds.

**Construction or proof.**

1. Choose a p^a-division line bundle M with M^(p^a)=O(D), and a trivialization on U=C minus support(D). Compute sigma(M)/M and the change of trivialization; the resulting cocycle is sigma(Q)−Q in Pic0[p^a].
2. Compare this cocycle with the extension obtained from the residue/Gysin sequence of U, retaining its degree-zero kernel and the same sign. Changing M or trivialization changes it by a coboundary.
3. Check transitions a+1→a, Galois descent and rational-equivalence independence; use the continuous comparison to pass to TpJ. Apply multiplication/Kummer naturality for q.

**Acceptance checks.**

- For D=[x]−[x0], obtain the Kummer class of aj(x), with sign fixed by sigma(Q)−Q. A principal divisor gives zero; changing x0 translates by the actual divisor degree and hence leaves degree-zero D unchanged.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map), [GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison), `ModularCurvesPartII:R14.3`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Sources.**

- [bdp-published-2013-gh8](#source-bdp-published-2013-gh8), §2.3, Remark 2.6 and index-zero paragraph, pp.1062–1063; §§3.1–3.2, pp.1065–1068. Degree-zero cycle and Gysin extension specialized to a curve; the finite cocycle calculation is the comparison to prove.

<a id="generalizedheegnercycles-gh-1-uniform-integral-factor-transport"></a>
### Uniform integral transport on the selected newform factor

**Target:** `GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.uniformIntegralFactorTransport`.

For the multiplicity-one f-factor selected in H1_et(C_bar,Qp) and its actual modular-quotient realization V, choose stable lattices T and Tprime. Construct Galois-equivariant integral maps a:T→Tprime and b:Tprime→T and a single nonzero d in O with ba=d id_T and ab=d id_Tprime. The maps induced on H1(E,−) for every finite ring-class E commute with restriction and corestriction, with the same d for all E. Consequently each induced kernel and cokernel, and their coherent inverse-limit versions, is annihilated by d. This asserts a bounded integral comparison, not an integral isomorphism unless d is a unit.

**Hypotheses and conventions.**

- The chosen rational coefficient map is an isomorphism on this f-factor; no reverse identity on the whole Jacobian is claimed. The lattices are finite free over the same complete DVR after a fixed coefficient extension.
- Track the auxiliary fine-level degree, rational idempotent denominator and modular quotient isogeny/congruence denominator in d. None may depend on the ring-class level.

**Construction or proof.**

1. Import the rational selected-factor map from AGR and the modular quotient. In fixed finite lattice bases clear denominators of this map and its inverse once; multiply the clearing scalars to obtain d and the two integral maps.
2. Galois equivariance passes to continuous cochain complexes; naturality gives restriction/corestriction commutativity at every field.
3. Apply the two composite identities on cochains, then cohomology. In inverse limits use the compatible reverse map to lift d times a coherent class; no right-exactness of inverse limit is assumed.

**Acceptance checks.**

- On O^2 take a=diag(pi,1), b=diag(1,pi), d=pi: both composites are pi id but a is not an O-isomorphism. The maps diag(pi^n,1) with varying n fail a fixed nonzero bound.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), `AutomorphicGaloisRepresentations:R19.1/integral-structure-of-the-newform-premotive`, `ModularCurvesPartII:R14.3`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

**Sources.**

- [bdp-published-2013-gh8](#source-bdp-published-2013-gh8), §2.3, pp.1062–1063; §3.1, pp.1065–1066. Source degree-one realization; the bounded lattice argument supplements the rational statement.
- [mathlib-quotient-082e2d3-gh8](#source-mathlib-quotient-082e2d3-gh8), LinearAlgebra/Quotient/Basic.lean: Submodule.mapQ, ker_mapQ; Algebra/Module/Submodule/Ker.lean: LinearMap.ker_eq_bot. Existing quotient and kernel algebra reused in the transport.

<a id="generalizedheegnercycles-gh-1-degree-one-local-realisation"></a>
### Local degree-one comparison over conductor fields

**Target:** `GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.degreeOneLocalRealisation`.

For every finite extension E/L_v in the ring-class tower, including ramified E, and every E-rational degree-zero divisor D on the good-reduction curve, the Picard–Kummer/Gysin comparison over E agrees with the Bloch–Kato logarithm after the canonical map D_dR,Lv(V) tensor E ≅ D_dR,E(V). Pairing with the quotient differential satisfies log_E(q_*AJ_et,E(D))(omega_E)=c_pi AJ_dR,E(D)(omega_f) when pi*omega_E=c_pi omega_f. Restriction on finite local cohomology commutes with scalar extension of log, and corestriction is adjoint to field trace under this pairing.

**Hypotheses and conventions.**

- Good reduction/de Rham and the actual H1_f logarithm domain are retained. An E-rational divisor need not descend to Lv. The BDP13 finite-unramified F comparison is used only with its own model hypotheses; it is not invoked over arbitrary ramified E without the local comparison theorem.
- The quotient map, comparison isomorphisms, filtration quotient and differential functional are fixed geometrically, not by an arbitrary nonzero linear functional.

**Construction or proof.**

1. Apply the finite Picard–Kummer comparison over E itself and the supplier Bloch–Kato/crystalline comparison in the degree-one good-reduction range.
2. Use functoriality for q and the equality of pulled-back differentials to compute the scalar c_pi.
3. Prove restriction/log and corestriction/trace squares on the cochain/comparison maps, then check their pairings before taking any tower limit.

**Acceptance checks.**

- Over E=Lv recover the original differential comparison. Under a finite ramified extension, compute the E-rational CM divisor directly, not solely the restriction of an Lv-class. Squaring a comparison with c_pi gives c_pi^−2 in the inverse squared-log formula.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model), `PadicHodgeRegulators:L1`, `PadicHodgeTheory:R06.5`.

**Sources.**

- [bdp-published-2013-gh8](#source-bdp-published-2013-gh8), §§3.2–3.4, pp.1067–1070. Local Abel–Jacobi functional and its comparison domain; ramified base-change naturality remains the specified supplier extension.

<a id="gh-2"></a>
## GH.2. Ring-class trace, congruence and local conditions

Prove geometric norm, Frobenius and conjugation relations and the corrected p-condition. The nonsplit auxiliary-form range is a separate theorem.

<a id="generalizedheegnercycles-gh-2-cycle-norm-relations"></a>
### Heegner cycle norm relations

**Target:** `GeneralizedHeegnerCycles:GH.2/cycle-norm-relations` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.cycleNormRelations`.
**Planet:** Cycle norm relations.

For CH’s classes with p∤c and split p, n>1, cor_{K_{cp^n}/K_{cp^{n−1}}}(z_{f,cp^n})=a_p z_{f,cp^{n−1}}−p^{2r−2}res(z_{f,cp^{n−2}}). For an inert ℓ∤cND_Kp, cor_{K_{cℓ}/K_c}(z_{f,cℓ})=a_ℓ z_{f,c}. These equations are transported through the character projection with the prescribed χ weights. The n=1 split relation includes units and both Artin operators and requires an additional normalization check; it is not asserted by Proposition 4.4 in the 2022 copy.

**Hypotheses and conventions.**

- CH canonical CM data, p∤c, r≥1, prime-to-projector denominators and the displayed conductor exclusions.

**Construction or proof.**

1. Classify conductor-changing Hecke neighbors using HE.2.
2. Compare graph cycles in the Néron–Severi group: the predecessor term contributes p^{2r−2}; use the torsion-translation invariance of the projected graph.
3. Apply the f-projector, AJ functoriality and CM coefficient projection.

**Acceptance checks.**

- For r=1 the predecessor coefficient is 1; for r=2 it is p².

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class), [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map), `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §4.3, Proposition 4.4 and (4.3)–(4.4), pp.15–17. States the split recurrence for n>1 and the inert trace.

<a id="generalizedheegnercycles-gh-2-cycle-conjugation"></a>
### Complex conjugation of Heegner classes

**Target:** `GeneralizedHeegnerCycles:GH.2/cycle-conjugation` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.cycleConjugation`.
**Planet:** Conjugation relation.

With τ complex conjugation, w_f the Atkin–Lehner eigenvalue and σ_N the fixed Artin class, (z_{f,χ,c})^τ=w_f χ(σ_N)(z_{f,χ^{-1},c})^{σ_N}. The CM curve is defined over H_K^+ so τ acts on the chosen geometric cycle. Conjugation changes the coefficient character to χ^{-1}; it is not a same-character identity unless χ²=1.

**Hypotheses and conventions.**

- The decomposition N O_K=𝔑 𝔑̄ and geometric/Artin normalization are fixed.

**Construction or proof.**

1. Apply the Atkin–Lehner correspondence to the conjugate graph; the cycle comparison has N^{r−1}.
2. Use CH Lemma 4.5’s weighted Galois action to absorb the norm factor.

**Acceptance checks.**

- At χ=1 the remaining sign is w_f and the fixed σ_N action.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class), `ModularCurvesPartII:R14.3`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §4.4, Lemma 4.6, p.18. States the character inversion and Artin coefficient.

<a id="generalizedheegnercycles-gh-2-cycle-frobenius-congruence"></a>
### Frobenius congruence for cycle classes

**Target:** `GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.cycleFrobeniusCongruence`.
**Planet:** Cycle Frobenius congruence.

For ℓ∤cND_K inert, let λ_c and λ_{cℓ} be the chosen compatible local primes. Then res_{K_{λ_{cℓ}}/K_{λ_c}}(loc_{λ_c}(z_{f,χ,c})^{Frob_ℓ})=loc_{λ_{cℓ}}(z_{f,χ,cℓ}). The anticyclotomic χ is trivial on the relevant local decomposition group. This is an equality after restriction of local classes, deduced from reduction of the conductor-changing isogeny to Frobenius; it is not equality of global classes modulo ℓ.

**Hypotheses and conventions.**

- Compatible local embeddings; good reduction at ℓ; inert conductor-changing prime.

**Construction or proof.**

1. Import the geometric CM reduction congruence from HE.2.
2. Apply the graph correspondence, smooth specialization, AJ functoriality and local restriction.

**Acceptance checks.**

- The local Frobenius acts on the untwisted module because χ is trivial at this inert place.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class), `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`, `PadicHodgeTheory:R06.5`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §4.4, Lemma 4.7, pp.18–19. The local restriction and Frobenius equality are stated exactly.

<a id="generalizedheegnercycles-gh-2-finite-local-abel-jacobi-class"></a>
### Finite local Abel–Jacobi class

**Target:** `GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.finiteLocalAJ`.

At a good unramified local model AJ_et(Δ) is crystalline and hence lies in H¹_f; outside p its unramified local class follows from the good integral support and specialization. CH Proposition 7.6’s propagation through coefficient quotients uses the corrected Fontaine–Laffaille hypothesis: the local field L must be absolutely unramified over Q_p, not just relatively unramified over K_{c,w}. A ramified conductor field requires a different argument. Bloch–Kato, Greenberg and a chosen regulator-image condition are identified only after the stated comparison is proved.

**Hypotheses and conventions.**

- Good models, admissible Hodge interval p>2r−1, and absolute unramifiedness when Fontaine–Laffaille is used.

**Construction or proof.**

1. Use the geometric crystalline extension theorem at p and proper smooth specialization away from p.
2. Import propagation and lattice comparison of local conditions; use CH Lemma 7.5 only with its erratum hypothesis.

**Acceptance checks.**

- A relatively unramified extension of a ramified base is still ramified over Q_p.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model), [GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison), `SelmerIwasawaCohomology:L4/bloch-kato-condition`, `SelmerIwasawaCohomology:L2/condition-propagation`, `PadicHodgeTheory:R06.5`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §7.3, Lemma 7.5 and Proposition 7.6, p.31. The finite condition is propagated via the local coefficient quotient.
- [castella-hsieh-erratum](#source-castella-hsieh-erratum), Second correction, entire one-page erratum. Adds absolute unramifiedness and routes the replacement proof.

<a id="generalizedheegnercycles-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections"></a>
### Corrected derivative local condition

**Target:** `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.correctedDerivativeLocalCondition`.
**Planet:** Corrected local condition.

For the specialized anticyclotomic Heegner Euler system in CH Proposition 7.8, the derivative classes satisfy axiom (E5) at p by the integral Perrin–Riou lifting and orthogonality argument of KO Lemma 4.10. At a height-one P≠pΛ, use the integral regulator image defining F_P, lift the period vector through the unramified trace, apply Ω, specialize and use the local Tate pairing; use conjugation for p̄. The proof cannot use CH Lemma 7.5 over arbitrary ramified conductor fields. The identification of F_P with the CH local condition and its integral lattice must be checked explicitly.

**Hypotheses and conventions.**

- KO Condition 2.3 and CH specialization hypotheses as supplied; prime P≠pΛ; coefficient and local regulator normalizations matched.

**Construction or proof.**

1. Lift h∈R̃₁^{ψ=0}⊗D_cris(V_f)^{φ=α}(r) to h′ over the conductor coefficient ring using surjectivity of unramified trace.
2. Apply the integral Ω map to h′; use norm compatibility and the finite local pairing (KO (4.49)–(4.50)).
3. KO Lemma 4.7 makes regulator images orthogonal. Apply conjugation at p̄ and ordinary/regulator-image comparison where its hypotheses hold.

**Acceptance checks.**

- The same conclusion over a ramified local field cannot be deduced from the printed Fontaine–Laffaille proof.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class](#generalizedheegnercycles-gh-2-finite-local-abel-jacobi-class), [GeneralizedHeegnerCycles:GH.2/cycle-conjugation](#generalizedheegnercycles-gh-2-cycle-conjugation), `PadicHodgeRegulators:L3`.

**Sources.**

- [kobayashi-ota](#source-kobayashi-ota), §4, Lemma 4.7 p.42; Lemma 4.10 pp.44–45; (4.47) p.44 and (4.49)–(4.50) p.45. The load-bearing local lifting and orthogonality proof was read in full.
- [castella-hsieh-erratum](#source-castella-hsieh-erratum), Second correction, p.1. Routes the repaired argument to KO20 Lemma 4.10.

<a id="generalizedheegnercycles-gh-2-auxiliary-form-local-range"></a>
### Local conditions in the BSD auxiliary-form range

**Target:** `GeneralizedHeegnerCycles:GH.2/auxiliary-form-local-range` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.auxiliaryFormLocalRange`.

Let g be an ordinary newform of weight k=2r≥2, p not dividing tame M, in exactly the ideal-Heegner/special-local range of Castella Birch erratum Theorem 2.3. Construct the graph/projected coefficient classes at this level and prove their stabilized/derived classes lie in the canonical self-dual Selmer local conditions: finite away from p except the specified transverse auxiliary condition, and the corrected finite/ordinary condition at p. The nonsplit tame primes permitted here are ramified in K and divide M exactly once; inert primes cannot satisfy O_K/mathfrak M ≅ Z/MZ. This theorem extends the all-split source range and is not an instance of CH (H).

**Hypotheses and conventions.**

- p>3, p split in K, M≥3, ideal mathfrak M with O_K/mathfrak M ≅ Z/MZ; residual g|G_K irreducible; some nonsplit q exactly divides M; if 2 is nonsplit then 2 exactly divides M; at each nonsplit ell exactly dividing M, the source’s special representation is an unramified twist with ell sent to −ell^(r−1).
- Keep all projector/lattice/integral-twist restrictions explicit. The condition p not dividing (2r−1)! cannot be imposed silently on unbounded congruence weights; either establish an integral construction without it or prove a source-valid replacement for the actual weight set.

**Construction or proof.**

1. Use BDP17 §4.1 ideal-Heegner CM level geometry, where ramified tame primes of exponent one are allowed, and the requested fine-level geometry/lattice interface. Construct actual integral coefficient maps and record denominators.
2. Extend the tame norm/Frobenius calculation at good auxiliary primes and compute the bad ramified-tame local condition using the stated special type and residual ramification/control; the all-split calculation is not treated as that proof.
3. Apply the CH erratum via KO20 Lemma 4.10 at p, verifying the integral Ω/twist hypotheses for this coefficient lattice and conductor field. The actual nonsplit local and unbounded-weight integral verifications are recorded source gaps.

**Acceptance checks.**

- A level containing an inert prime fails the ideal Heegner input. An all-split level cannot simultaneously supply the required nonsplit q. For fixed p, arbitrarily high r makes p divide (2r−1)!, rejecting a uniform appeal to CH (H).

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector), [GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle](#generalizedheegnercycles-gh-1-generalized-heegner-cycle), [GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison), [GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections](#generalizedheegnercycles-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections), `AutomorphicGaloisRepresentations:R19.1`, `ModularCurvesPartII:R14.3`.

**Sources.**

- [bsd-multiplicative-erratum-gh8](#source-bsd-multiplicative-erratum-gh8), Theorem 2.3 and proof, pp.3–4. Precise auxiliary-form range and local theorem calls; does not independently prove the range extension.
- [bdp-coniveau-published](#source-bdp-coniveau-published), §4.1, p.38. Graph-cycle construction under the ideal Heegner hypothesis.
- [castella-hsieh-erratum](#source-castella-hsieh-erratum), Lemma 7.5/Proposition 7.8 correction, p.1. Correct p-local proof route; its integral hypotheses must be retained.

<a id="gh-3"></a>
## GH.3. Ordinary stabilization and universal norms

Separate the first trace from repeated positive transitions, construct the integral inverse-limit class and identify its genuine finite-character moments.

<a id="generalizedheegnercycles-gh-3-ordinary-stabilized-class"></a>
### Ordinary stabilized Heegner class

**Target:** `GeneralizedHeegnerCycles:GH.3/ordinary-stabilized-class` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.stabilizedClass`.
**Planet:** Ordinary stabilized class.

For CH k=2r, ap a p-adic unit and α the unit root of X²−apX+p^{2r−1}, set z_{c,α}=z_c−(p^{2r−2}/α)res(z_{c/p}) when p|c. When p∤c set z_{c,α}=u_c^{-1}(1−p^{r−1}σ_p/α)(1−p^{r−1}σ_p̄/α)z_c, with CH’s u_c=|O_c×|. The factor at p∤c is a pair of Euler operators, not the same formula as at positive p-conductor.

**Hypotheses and conventions.**

- r≥1, p split, ap unit; lattice integral away from the recorded denominators; compatible Artin operators.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class): Multiplying the conductor-n class by α^{-n} gives norm compatibility.
- [GeneralizedHeegnerCycles:GH.7/initial-family-specialization](#generalizedheegnercycles-gh-7-initial-family-specialization): Tracks the unit convention before identifying Howard’s specialization.

**Planning API.**

- `TauCeti.GeneralizedHeegner.stabilizedClass_upper` (simp): At positive p-conductor the subtraction coefficient is p^{2r−2}/α.
- `TauCeti.GeneralizedHeegner.stabilizedClass_bottom` (constructor): The bottom class is u_c⁻¹ times the product of the p and p̄ Euler operators.
- `TauCeti.GeneralizedHeegner.stabilizedClass_trace` (relation): With the matched first-step normalization, cor(z_{cp,α})=α z_{c,α}.
- `TauCeti.GeneralizedHeegner.stabilizedClass_integral` (structure): The normalized subtraction preserves the integral lattice when both classes and its explicitly recorded scalar action preserve that lattice.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.stabilizedClass_weight_two` (computation): For r=1 the predecessor coefficient is α⁻¹.
- `TauCeti.GeneralizedHeegner.stabilizedClass_zero_predecessor` (degenerate): A zero predecessor leaves the current class unchanged.
- `TauCeti.GeneralizedHeegner.stabilizedClass_root_relation` (characterisation): The unit-root equation gives α+p^{2r−1}/α=ap, which is the coefficient identity used in the trace computation.

**Construction or proof.**

1. Use the unit-root factorization and the split predecessor relation.
2. Separate the bottom conductor case and track the source’s full-unit convention; the first-step trace adapter remains a gap.

**Acceptance checks.**

- At r=1 the upper-layer subtraction is α⁻¹z_{c/p}; the bottom layer still has two Artin operators.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.2/cycle-norm-relations](#generalizedheegnercycles-gh-2-cycle-norm-relations), [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class), `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §5.2, Definition 5.2, p.22. The two formulas and u_c are explicit.

<a id="generalizedheegnercycles-gh-3-stabilized-first-step-adapter"></a>
### First-step stabilization adapter

**Target:** `GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.stabilizedFirstStep`.

The upper and lower formulas of CH Definition 5.2 must satisfy cor_{K_{cp}/K_c}(z_{cp,α})=α z_{c,α}. Prove the conductor-one trace from the Hecke neighbor classification with both Frobenius classes and the exact unit index. The July 2022 Proposition 4.4 states only n>1; its proof does not, by itself, discharge the n=1 assertion in Lemma 5.3. Compare CH’s full-unit and Castella’s half-unit conventions by an explicit scaling of the cycle classes.

**Hypotheses and conventions.**

- p∤c and the same geometric graph and AJ normalization in all three sources.

**Construction or proof.**

1. Import the first-step Heegner neighbor classification.
2. Compute the unit orbit multiplicities of the higher-weight graph cycle and both split ideal terms.
3. Substitute the unit-root relation; establish the normalization adapter before using an inverse limit.

**Acceptance checks.**

- The classical weight-two first-step check must reproduce the full versus half unit scaling.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.3/ordinary-stabilized-class](#generalizedheegnercycles-gh-3-ordinary-stabilized-class), `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, [GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison](#generalizedheegnercycles-gh-1-classical-generalized-cycle-comparison).

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §5.2, Lemma 5.3, p.22. States the trace that needs the bottom-layer calculation.

<a id="generalizedheegnercycles-gh-3-iwasawa-heegner-class"></a>
### Iwasawa Heegner class

**Target:** `GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.iwasawaClass`.
**Planet:** Iwasawa Heegner class.

After the first-step adapter, the sequence (α^{-n}z_{c₀p^n,α})_n, with its compatible coefficient projections, defines z_f in H¹_Iw(K_{c₀p∞},T). Keep the finite ring-class quotient Δ distinct from the anticyclotomic Γ≅Z_p and from a possible Δ-character projection. A finite-order nontrivial character of exact p-conductor n specializes to α^{-n}z_{f,χ}; Shapiro identifies the inverse limit with cohomology of the completed coefficient representation, with the inversion convention explicit.

**Hypotheses and conventions.**

- ap unit, compatible stable lattice, trace lemma including n=0, continuous coefficient twist.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity): Supplies the functional class in the reciprocity law.
- [GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class](#generalizedheegnercycles-gh-5-higher-weight-kolyvagin-class): Supplies the inverse-limit class to which derivative operators are applied.

**Planning API.**

- `TauCeti.GeneralizedHeegner.iwasawaClass_level` (projection): The conductor-n projection is α^{-n}z_n.
- `TauCeti.GeneralizedHeegner.iwasawaClass_norm` (relation): The normalized sequence is corestriction compatible.
- `TauCeti.GeneralizedHeegner.iwasawaClass_character` (compatibility): A nontrivial exact conductor-n character specialization gives α^{-n} times the weighted finite-level class.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.iwasawaClass_bottom` (degenerate): The bottom projection has normalization α⁰=1.
- `TauCeti.GeneralizedHeegner.iwasawaClass_unit_one` (computation): If α=1 the sequence is unchanged.
- `TauCeti.GeneralizedHeegner.iwasawaClass_sign` (non-example): At α=−1 level 1 changes sign; at α=2 and a nonzero class over Q it is one half of the class, not twice the class. The latter distinguishes α^{-n} from α^n.

**Construction or proof.**

1. Normalize by α^{-n}; use the exact trace equation at every layer.
2. Use IW and iwasawa-shapiro rather than rebuilding Iwasawa cohomology.
3. Take the finite Δ projection or corestriction before passing to the Γ module.

**Acceptance checks.**

- Corestriction of α^{-(n+1)}z_{n+1,α} equals α^{-n}z_{n,α}.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §5.2, (5.1), (5.5) and Lemma 5.4, pp.23–24. The norm-compatible class is the input to the big logarithm.

<a id="generalizedheegnercycles-gh-3-longo-vigni-trace-polynomials"></a>
### Longo–Vigni trace polynomials

**Target:** `GeneralizedHeegnerCycles:GH.3/longo-vigni-trace-polynomials` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.tracePolynomial`.
**Planet:** Trace polynomials.

In O_p[G(n)] define ρ=p^{k/2}−a_pσ_p+p^{(k−2)/2}σ_p², its conjugate ρ̄, and Φ=ρρ̄. Let γ₀=a_p−p^{(k−2)/2}(σ_p+σ_p̄), γ₁=a_pγ₀−p^{k−2}δ and γ_m=a_pγ_{m−1}−p^{k−1}γ_{m−2} for m≥2. Here δ is the fixed ring-class-to-Γ degree in LV §4.1, not a freely chosen constant. LV Lemma 4.2 gives q_m with γ_m=q_mΦ+p^{(m−1)k/2}r_m for m≥2 and q_{m+1}≡a_pq_m mod p, q₂=1.

**Hypotheses and conventions.**

- Even k≥4, LV coefficient and tower conventions, finite quotient split from Γ; ordinary ap.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection](#generalizedheegnercycles-gh-3-trace-polynomial-intersection): Controls the stable image of the corestriction sequence.
- [GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class](#generalizedheegnercycles-gh-3-universal-norm-heegner-class): Pins the bottom universal-norm class Φz_n.

**Planning API.**

- `TauCeti.GeneralizedHeegner.tracePolynomial_initial` (projection): The first two values are γ₀ and γ₁.
- `TauCeti.GeneralizedHeegner.tracePolynomial_recurrence` (relation): γ_{m+2}=a_pγ_{m+1}−p^{k−1}γ_m.
- `TauCeti.GeneralizedHeegner.tracePolynomial_remainder` (data): The higher terms equal q_mΦ plus the explicitly p-divisible remainder.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.tracePolynomial_two` (computation): The second recurrence value is apγ₁−qγ₀.
- `TauCeti.GeneralizedHeegner.tracePolynomial_zero` (degenerate): Zero initial values give the zero sequence.
- `TauCeti.GeneralizedHeegner.tracePolynomial_error_power` (non-example): At k=4,m=2 the displayed LV remainder exponent is 2. No p⁴ divisibility follows from that displayed exponent alone; a particular remainder may have additional divisibility.

**Construction or proof.**

1. Obtain the raw trace sequence from the cycle norm recurrence and finite quotient corestriction.
2. Apply the polynomial recurrence and LV Lemma 4.2’s inductive division.

**Acceptance checks.**

- γ₂ has leading term Φ; the error has p^{k/2} divisibility.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.2/cycle-norm-relations](#generalizedheegnercycles-gh-2-cycle-norm-relations), `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `mathlib:LinearMap`.

**Sources.**

- [longo-vigni](#source-longo-vigni), §4.2, Lemmas 4.1–4.2, p.12. Controls the remainder and q_m modulo p.

<a id="generalizedheegnercycles-gh-3-trace-polynomial-intersection"></a>
### Trace polynomial intersection theorem

**Target:** `GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.tracePolynomialIntersection`.

For a finitely generated O_p[G(n)]-module M in LV’s setting, ordinarity and the q_m estimates imply ΦM=⋂_m γ_mM. This is equality of images/submodules. After augmentation, eventual equality of the corresponding ideals is what is used, not literal equality γ_m=Φ.

**Hypotheses and conventions.**

- LV tower and p-adic finite coefficient ring; a_p unit; finitely generated M.

**Construction or proof.**

1. Reduce q_m modulo p, showing the successive q_m are units.
2. Use the increasingly p-divisible remainder and p-adic completeness to compute the stable intersection.

**Acceptance checks.**

- Multiplying a generator by a unit changes its value but not the principal ideal.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.3/longo-vigni-trace-polynomials](#generalizedheegnercycles-gh-3-longo-vigni-trace-polynomials).

**Sources.**

- [longo-vigni](#source-longo-vigni), §4.2, Corollary 4.3, p.12. Identifies ΦM with the intersection of γ_mM.

<a id="generalizedheegnercycles-gh-3-universal-norm-heegner-class"></a>
### Universal norm Heegner class

**Target:** `GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.universalNormClass`.
**Planet:** Universal norm Heegner class.

Let H_m[n] be the O_p[Gal(K_m[n]/K)] submodule generated by the restrictions of z_n and by the trace classes α_j[n], j≤m, and H_∞[n]=lim_cor H_m[n]. LV Proposition 4.5 constructs β[n]∈H_∞[n] with β₀[n]=Φz_n and cor_{K_∞[nℓ]/K_∞[n]}β[nℓ]=a_ℓβ[n] for the permitted inert ℓ. The finite Δ corestriction and p∤h_K are retained; this construction is not identified with the CH α-stabilized sequence without the normalization comparison.

**Hypotheses and conventions.**

- LV admissible triple; finite quotient of order prime to p; tower control.
- The additive suggested realization takes a specific compact Hausdorff norm tower, closed level subgroups, continuous vertical/tame maps, the input z and its operator Φ. Finite solvability is joint: for every finite conductor/edge set and finite height there is a partial family satisfying membership, bottom, norm and tame equations. The source trace modules prove this finite condition before compactness supplies the infinite family. This is weaker than assuming the desired infinite lift; independent choices at each conductor are insufficient. Vertical and tame maps preserve their selected level groups and the vertical/tame corestriction square commutes.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class](#generalizedheegnercycles-gh-5-higher-weight-kolyvagin-class): Provides conductor-indexed universal norms for differentiation.
- [GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one](#generalizedheegnercycles-gh-6-universal-norm-module-rank-one): Defines the generator module H∞ whose nonvanishing is established separately.

**Planning API.**

- `TauCeti.GeneralizedHeegner.universalNormClass_bottom` (projection): The constructed joint family has β₀[n]=Φz_n, using the Φ and z supplied to that construction.
- `TauCeti.GeneralizedHeegner.universalNormClass_norm` (relation): The supplied tower’s cor_m[n] sends β_{m+1}[n] to β_m[n]; these are not laws for subsequently chosen unrelated maps.
- `TauCeti.GeneralizedHeegner.universalNormClass_tame` (functoriality): For an edge nℓ→n of the same supplied tower, its tame corestriction sends β_m[nℓ] to a_ℓβ_m[n]. Both values belong to one simultaneously selected family.
- `TauCeti.GeneralizedHeegner.universalNormClass_exists` (constructor): Joint finite solvability in a compact Hausdorff tower implies a nonempty carrier of families satisfying every bottom, membership, vertical norm and tame equation. The proof uses closed constraints and the finite intersection property.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.universalNormClass_bottom_test` (characterisation): In the compact Z/5 fixture with Φ=2, z_0=1 and z_n=3 for n>0, the actual constructed bottom values are β_0[0]=2 and β_0[1]=1; β_0[0] differs from z_0. This detects dropping Φ.
- `TauCeti.GeneralizedHeegner.universalNormClass_zero` (degenerate): The constructor explicitly selects the zero family for zero geometric input, in the same fixed norm tower.
- `TauCeti.GeneralizedHeegner.universalNormClass_two_steps` (compatibility): In that fixture the vertical norm is multiplication by 2. The constructed components at conductor 0 are β_1=1 and β_2=3, and two applications of the actual corestriction give β_0=2. Replacing corestriction by zero fails the first nonzero bottom constraint.
- `TauCeti.GeneralizedHeegner.universalNormClass_tame_test` (compatibility): In the same simultaneously constructed Z/5 family, the tame edge 1→0 has identity corestriction and a_ℓ=3. At height 1, β_1[1]=3 while β_1[0]=1, so the actual tame equation is 3=3·1.

**Construction or proof.**

1. Use LV Corollary 4.3 and the presented trace modules in Proposition 4.5 to lift Φx at every finite height. This verifies finite solvability, not surjectivity of arbitrary corestriction maps.
2. For a fixed finite divisor set, transport a common presented-module lift through its conductor maps. Their commuting tame squares give a jointly compatible family; separate conductor-by-conductor choices do not provide this.
3. Use compactness first for the height limit and then for all finite divisor sets. Closed coordinate constraints give a family in the actual inverse-limit carrier with the prescribed bottom and tame laws. The suggested common-carrier additive version is a testable realization, while varying Galois cohomology carriers and coefficient linearity are imported from SelmerIwasawaCohomology:L3.

**Acceptance checks.**

- The bottom class is Φz_n, not simply z_n.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection](#generalizedheegnercycles-gh-3-trace-polynomial-intersection), `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`.

**Sources.**

- [longo-vigni](#source-longo-vigni), §4.2, Definition 4.4 and Proposition 4.5, p.13. Constructs the compatible β[n] and fixes its bottom value.

<a id="generalizedheegnercycles-gh-3-finite-character-moment-descent"></a>
### Finite-character moments and exact conductor

**Target:** `GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.finiteCharacterMomentDescent`.

Retain G_n=Gal(K_c0p^n/K) and its finite class component. For an O-valued finite-order character chi of exact last conductor n, the continuous Shapiro evaluation of the integral inverse-limit class is the descent of alpha^−n sum_{g in G_n} chi(g) z_n^g in the specified chi^−1 coefficient convention. If H_n is the last conductor kernel and the restricted lower class is H_n-invariant, the weighted lower term of z_n−(p^(2r−2)/alpha) res(z_n−1) at weight 2r vanishes when chi|H_n is nontrivial. No cancellation of a nonzero scalar in a torsion cohomology module is used. Finite-component traces and unit indices remain explicit.

**Hypotheses and conventions.**

- Choose coefficients containing all chi values and the fixed Shapiro inversion convention; exact conductor means nonfactorization through G_n−1, as supplied by HE.0.
- The stable integral system, bottom normalization and coefficient projections already exist. Use the actual quotient action, restriction and twisted descent, not a formal group sum in an unrelated module.

**Construction or proof.**

1. Apply the Iwasawa Shapiro map and evaluate the coefficient character on continuous cochains; compare the finite quotient formula with the unnormalized weighted class.
2. Use the ring-class conductor kernel theorem to translate exact conductor into nontriviality on H_n; prove the lower restriction image is H_n-fixed by restriction naturality.
3. Sum over H_n cosets. Apply existing scalar character orthogonality in an integral-domain coefficient ring and only then let the zero scalar act on the possibly torsion module.

**Acceptance checks.**

- For C4 and H={0,2}, the character (−1)^g is nontrivial on C4 but trivial on H; an H-invariant lower term need not cancel. Over Z and a Z/8-module, cancellation for the C2 sign character holds coefficientwise.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class), `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `mathlib:MulChar.sum_eq_zero_of_ne_one`, `mathlib:Equiv.prod_comp`.

**Sources.**

- [ch-author-2022-gh8](#source-ch-author-2022-gh8), §5.2, equation (5.1) and Lemma 5.4, p.23. Finite-character moment and primitive cancellation; Rubin’s lemma cited there does not replace construction of the actual coefficient map.

<a id="gh-4"></a>
## GH.4. Explicit reciprocity and p-adic Abel–Jacobi formulas

Evaluate the cycle classes against the imported distribution and keep BDP, CH and family source normalizations connected by stated period/twist maps.

<a id="generalizedheegnercycles-gh-4-bdp-special-value-formula"></a>
### BDP special value formula

**Target:** `GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.bdpSpecialValue`.
**Planet:** BDP special value formula.

Under BDP Assumption 5.12 (normalized f∈S_k(Γ₀(N),ε_f), odd c prime to Nd_K, odd discriminant K with the stated Heegner ideal, split p prime to Nc, and the finite-local-sign conditions on Σ_cc), let m=k−2 and χ∈Σ_cc^(1) have infinity type (k−1−j,1+j), 0≤j≤m. Then L_p(f,χ)/Ω_p^{2(m−2j)}=(1−χ^{-1}(p̄)a_p+χ^{-2}(p̄)ε_f(p)p^{k−1})² · (c^{−j}/j! · Σ_[a]∈Pic(O_c) χ^{-1}(a)N(a) AJ_F(Δ_{φ_aφ₀})(ω_f⊗ω_A^jη_A^{m−j}))². This is a special value of the squared BDP function, not a complex derivative. The underlying GL₂ square-root distribution and its interpolation are imported from L3h. GZ.9 consumes the m=0 specialization of this one owner; quaternionic formulas and exceptional branches remain in GZ.9.

**Hypotheses and conventions.**

- All five clauses of BDP Assumption 5.12; CM differential, periods, representatives and geometric reciprocity fixed.

**Construction or proof.**

1. Import BDP’s p-adic modular interpolation and continuity from L3h; approximate the noninterpolating character by characters in Σ_cc^(2).
2. Apply the depleted Coleman component calculation to the continued negative θ power.
3. Use the p-depletion Euler identity, change the ideal class variables, and apply the isogeny degree d=cN(a) in the Coleman AJ formula.

**Acceptance checks.**

- At m=j=0 the factorial and c power are 1; the degree-zero correction remains. A vanishing Euler polynomial forces this special value to vanish without forcing each cycle to vanish.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula](#generalizedheegnercycles-gh-1-coleman-abel-jacobi-formula), [GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation](#generalizedheegnercycles-gh-1-coleman-depletion-calculation), `AutomorphicPadicLFunctions:L3h`.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §5.3, Assumption 5.12 and Theorem 5.13, pp.1137–1139. The range, squared Euler polynomial and c^{-j}/j! weighted AJ sum are explicit.

<a id="generalizedheegnercycles-gh-4-cm-differential-scaling"></a>
### CM differential scaling

**Target:** `GeneralizedHeegnerCycles:GH.4/cm-differential-scaling` · lemma.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.cmDifferentialScaling`.

Under ω_A↦aω_A and η_A↦a^{-1}η_A with a≠0, the AJ evaluation on ω_A^jη_A^{m−j} scales by a^{2j−m}, and its square scales by a^{2(2j−m)}. The period Ω_p scales by a in the matching convention, so BDP’s normalized equation transforms consistently. These are signed integer exponents, not truncated natural subtraction.

**Hypotheses and conventions.**

- Nonzero a and the pairing normalization ⟨ω_A,η_A⟩=1.

**Construction or proof.**

1. Use multilinearity of the symmetric tensor evaluation and the reciprocal normalization of η.
2. Square and compare the signed period exponent on the other side.

**Acceptance checks.**

- For m=2,j=0 the evaluation scales by a^{-2}; using a^0 from natural subtraction fails.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/cm-character-decomposition](#generalizedheegnercycles-gh-0-cm-character-decomposition), [GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula](#generalizedheegnercycles-gh-4-bdp-special-value-formula).

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#source-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.2) and (1.4.6), pp.1052–1053. The normalization determines reciprocal scaling of η.

<a id="generalizedheegnercycles-gh-4-ramified-character-abel-jacobi-formula"></a>
### Ramified character Abel–Jacobi formula

**Target:** `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.ramifiedCharacterAJ`.
**Planet:** Ramified Abel–Jacobi formula.

In CH Theorem 4.9 let ψ have type (r,−r), conductor c₀ prime to Np, and φ type (r+j,−j−r), −r<j<r, with exact conductor p^n, n≥1; put χ=ψ̂^{-1}φ̂. Then L_{p,ψ}(f)(φ̂^{-1})/Ω_p^{−2j}=[g(φ_p^{-1})φ_p(p^n)c₀^{1−r}ψ̂_p^{-1}(p^n)/(r−1+j)!] · ⟨log_p z_{f,χ},ω_f⊗ω_A^{r−1+j}η_A^{r−1−j}t^{1−2r}⟩. This evaluates the linear square-root distribution, and the proof’s exact conductor cancellations cannot substitute for BDP’s unramified Euler polynomial.

**Hypotheses and conventions.**

- CH setup and critical interval; exact ramified conductor n≥1; periods and geometric reciprocity fixed.

**Construction or proof.**

1. Relate the weighted corestriction class to the CM sum using Lemma 4.5.
2. Use the CM expansion of the p-adic L-function, the Gauss sum identity and the Coleman AJ evaluation.
3. For the cancellation using exact conductor n>1, establish the n=1 boundary separately; the boundary is a recorded refinement.

**Acceptance checks.**

- At j=0 the factorial is (r−1)! and the t factor is t^{1−2r}; squaring is not part of this equation.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class), [GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula](#generalizedheegnercycles-gh-1-coleman-abel-jacobi-formula), `AutomorphicPadicLFunctions:L3h`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §4.5, Theorem 4.9, pp.19–21. The ramified conductor, factorial and period/Tate factors are explicit.

<a id="generalizedheegnercycles-gh-4-fixed-weight-regulator-adapter"></a>
### Fixed-weight regulator specialization

**Target:** `GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.fixedWeightRegulator`.

Apply the supplier’s relative Lubin–Tate Perrin–Riou map to V=V_f(r)⊗ψ̂^{-1}, whose F⁺ line is unramified after this twist. Pair with ω_f⊗t^{−2r} and the CM period identifications η_A=t_A^{-1}t, ω_A=t_A=Ω_pt. CH Theorem 5.1’s specialization in the positive logarithmic range and the dual exponential range supplies the epsilon, Euler and factorial factors; the density argument in Theorem 5.7 uses ramified n>1 characters and the epsilon identity ε(φ̂)=g(φ_p^{-1})φ_p(−p^n). The finite unramified base change and Γ̃ finite quotient are part of the map.

**Hypotheses and conventions.**

- Theorem 5.1 hypotheses: nonnegative Hodge–Tate weights, no trivial quotient and no invariants on the relevant tower; ordinary rank-one line and matched twists.

**Construction or proof.**

1. Import the relative Lubin–Tate regulator as an extension of L3 rather than a duplicate construction.
2. Match the de Rham differential and t powers, then compare the interpolation factor at exact ramified characters.

**Acceptance checks.**

- The line unramified before a Tate twist need not stay unramified after the twist; ψ is part of the repair.

**Direct prerequisites:** `PadicHodgeRegulators:L3`, [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula](#generalizedheegnercycles-gh-4-ramified-character-abel-jacobi-formula).

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §5.1 and §5.3, Theorem 5.1, Lemma 5.5 and proof of Theorem 5.7, pp.21–25. Supplies the relative regulator whose scalar normalization is used.

<a id="generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity"></a>
### Castella–Hsieh explicit reciprocity law

**Target:** `GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.castellaHsiehReciprocity`.
**Planet:** Castella–Hsieh reciprocity law.

Under CH §5, in Λ_{F̂^ur}(Γ̃), ⟨L_{p,ψ}(z_f),ω_f⊗t^{−2r}⟩=−c₀^{r−1} L_{p,ψ}(f)·σ_{−1,p}, where σ_{−1,p}=rec_p(−1)|_{K_{c₀p∞}} has order dividing 2. The analytic side is the linear square-root distribution. The sign, c₀ power and group-algebra translation remain in the identity; equality after squaring loses this normalization.

**Hypotheses and conventions.**

- Ordinary f; ψ of type (r,−r) and conductor c₀ prime to Np; the first-step class adapter and regulator interpolation checked.

**Construction or proof.**

1. Use the preceding regulator adapter and CH 4.9 at a dense set of exact-conductor n>1 characters with j=0.
2. The epsilon identity contributes φ_p(−1), producing σ_{−1,p}; collect c₀^{r−1} and the sign.
3. Use boundedness (Lemma 5.5) and Weierstrass density to conclude equality of Iwasawa algebra elements.

**Acceptance checks.**

- After augmenting the Artin operator one still has −c₀^{r−1}; a measure equality without these factors is a different normalization.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter](#generalizedheegnercycles-gh-4-fixed-weight-regulator-adapter), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), `AutomorphicPadicLFunctions:L3h`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §5.3, Theorem 5.7 and proof, pp.24–25. The linear reciprocity law retains −c₀^{r−1} and σ_{−1,p}.

<a id="generalizedheegnercycles-gh-4-dual-exponential-special-value"></a>
### Dual exponential special value

**Target:** `GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.dualExponentialValue`.
**Planet:** Dual exponential formula.

CH Corollary 5.8 gives, in the j≥r range, ⟨exp*loc(z_{f}^{χ^{-1}}),ω_f⊗ω_A^{−j−r}η_A^{j−r}⟩² = c_{f,K}(e′_p(f,χ))²(p^{2r−1}/α²)^n χ^{-1}ψ(𝔑)L_alg(f,χ,r)/Γ(j−r+1)², with c_{f,K}=8u_K²√D_K c₀^{2r−1}ε(f). For n>0 e′_p=1; for n=0 it is (1−α^{-1}χ(σ_p)p^{r−j−1})(1−α^{-1}χ(σ_p̄)p^{r−j−1}). This is the local nonvanishing input to rank zero, distinct from the logarithmic critical range.

**Hypotheses and conventions.**

- Ordinary f and CH’s locally algebraic character and period normalization; j≥r; α unit root.

**Construction or proof.**

1. Use the dual-exponential specialization of the regulator.
2. Combine CH 5.7 with the analytic interpolation and functional equation; square to express the normalized central complex value.

**Acceptance checks.**

- At positive conductor there is no unramified e′_p factor; a nonzero L-value gives nonzero local dual exponential.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), `AutomorphicPadicLFunctions:L3h`, `PadicHodgeRegulators:L3`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §5.3, Corollary 5.8, pp.25–26. The squared exponential formula and the n=0/n>0 Euler factors are separate.

<a id="generalizedheegnercycles-gh-4-source-period-and-twist-transport"></a>
### Transport of source periods, twists and differentials

**Target:** `GeneralizedHeegnerCycles:GH.4/source-period-and-twist-transport` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.sourcePeriodAndTwistTransport`.

Construct the coefficient/twist and de Rham-dual diagrams comparing CH22 Theorem 5.7 with Castella20 Theorem 5.3 at a permitted specialization. CH uses the functional omega_f tensor t^(−2r), the CM identities eta_A=t_A^−1 t and omega_A=t_A=Omega_p t, and scalar −c0^(r−1); the family source uses its xi^−1 twist, canonical omega_family pairing and a positive native reciprocity scalar. The transport must explain each Tate-period power, CM generator, full/half-unit and c0 factor through maps. At weight two, pullback of the elliptic functional is c_pi times the CH functional in the same completed coefficient ring. Each source equality is exported separately until this diagram is established.

**Hypotheses and conventions.**

- Use precisely the arithmetic weights, tame/CM characters, Frobenius and geometric Artin conventions of the cited versions. A Tate-period vector is not a scalar unit in the coefficient ring.
- Any localization coefficient map is defined only if the inverted lambda has nonzero image; primitive and squared/square-root conventions are fixed.

**Construction or proof.**

1. Write bases of the actual one-dimensional CM and Tate twists and their duals; compute the induced maps on tensors and pairings. Compare the printed t^(1−2r) family-proof presentation and CH22 t^(−2r) after their CM factor identification.
2. Use the geometric pullback pi*omega_E=c_pi omega_f and the CM generator identity CH (5.3) to compute the scalar functional, without selecting a new arbitrary basis to force equality.
3. Compute class tower normalization separately from analytic measure normalization; check −c0^(r−1), sigma_(−1,p), gamma/Euler factors and source periods on a common exact-character domain. Extend only by a proved density/control result.

**Acceptance checks.**

- At r=1 the c0-power is 1 but the CH minus sign remains. Rescaling omega_E by 3 multiplies the scalar log by 3; omitting sigma_(−1,p) changes its value at the sign character.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation), [GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent](#generalizedheegnercycles-gh-3-finite-character-moment-descent), `AutomorphicPadicLFunctions:L3h`.

**Sources.**

- [ch-author-2022-gh8](#source-ch-author-2022-gh8), §5.3, (5.3), Definition 5.6 and Theorem 5.7, pp.24–25. CM/Tate periods and negative reciprocity scalar.
- [castella-family-author-gh8](#source-castella-family-author-gh8), §5.1–5.2, Lemma 5.1 and Theorem 5.3, pp.21–25; §6.2 proof, pp.28–29. Family functional, native identity and specialization comparison.

<a id="gh-5"></a>
## GH.5. Higher-weight Kolyvagin system and arithmetic hypotheses

Verify higher-weight generic-descent inputs, correct finite–singular factors and track the integral leading-class unit in the actual source range.

<a id="generalizedheegnercycles-gh-5-longo-vigni-admissible-triple"></a>
### Longo–Vigni admissible triple

**Target:** `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple` · definition.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.admissibleTriple`.
**Planet:** Admissible triple.

LV Definition 2.1 excludes primes in Ξ: those dividing 6N(k−2)!φ(N)c_f, or for which im ρ_{f,p} does not contain {g∈GL₂(O_F⊗Z_p):det g∈(Z_p×)^{k−1}}. Require also p∤h_K, p unramified in F, p split in K, and a_p∈O_p×. Fix k≥4 even, (D_K,N)=1 with all primes of N split in K and O_K×={±1}; thus K=Q(i),Q(√−3) are excluded in this application. c_f is the integral index specified by the newform lattice, not an arbitrary normalizing scalar.

**Hypotheses and conventions.**

- LV §1–2 coefficient field and lattice conventions; all four admissibility clauses and its CM-unit restriction.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses](#generalizedheegnercycles-gh-5-higher-weight-howard-hypotheses): Provides the residual and finite-quotient input to H0–H5.
- [GeneralizedHeegnerCycles:GH.6/lambda-structure-consequence](#generalizedheegnercycles-gh-6-lambda-structure-consequence): Limits the higher-weight Iwasawa application to the actual source hypotheses.

**Planning API.**

- `TauCeti.GeneralizedHeegner.admissibleTriple_exceptional` (projection): Admissibility implies p∤6N(k−2)!φ(N)c_f.
- `TauCeti.GeneralizedHeegner.admissibleTriple_classNumber` (projection): Admissibility implies p∤h_K, so the bottom Hilbert class quotient has prime-to-p order; it does not assert that every auxiliary-conductor ring class quotient does.
- `TauCeti.GeneralizedHeegner.admissibleTriple_ordinary` (projection): The ordinary Fourier coefficient is a unit, not merely nonzero in F.
- `TauCeti.GeneralizedHeegner.admissibleTriple_bigImage` (data): The source p-adic image must contain the determinant-restricted subgroup, not merely be irreducible.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.admissibleTriple_two` (non-example): p=2 always belongs to the excluded set.
- `TauCeti.GeneralizedHeegner.admissibleTriple_class_number` (non-example): If p divides h_K the triple is excluded even when its Fourier coefficient is a unit.
- `TauCeti.GeneralizedHeegner.admissibleTriple_unit` (compatibility): The ordinarity projection is Mathlib’s unit predicate in O_p.

**Construction or proof.**

1. Import the newform lattice and residual representation from R14.3/R19.1.
2. Form the actual exceptional set and check each arithmetic and image condition separately.

**Acceptance checks.**

- Ordinary a_p alone is insufficient; p∤h_K and the specified big image are independent requirements.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/newform-cm-projector](#generalizedheegnercycles-gh-0-newform-cm-projector), `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `AutomorphicGaloisRepresentations:R19.1`.

**Sources.**

- [longo-vigni](#source-longo-vigni), §2.2, Definition 2.1 and Remark 2.2, pp.3–4. The exceptional set and four clauses fix the application’s hypotheses.

<a id="generalizedheegnercycles-gh-5-higher-weight-howard-hypotheses"></a>
### Higher-weight Howard hypotheses

**Target:** `GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.higherWeightHowardHypotheses`.

For LV’s T⊗Λ and each permitted height-one specialization S_P, verify the imported Howard H0–H5: rank two freeness; absolute residual irreducibility; the auxiliary extension and residual cohomology vanishing; Cartesian propagation of every local condition; a perfect self-dual pairing; and the τ-decomposition with its compatible sign. LV Lemma 2.4 gives A[p](K_∞)=0 from its determinant-restricted big image and solvable ring-class tower. Proposition 3.3 then verifies the specialization hypotheses. The pairing, local Cartier property and admissible auxiliary primes are actual verification obligations, not definitions of the source’s classes.

**Hypotheses and conventions.**

- LV admissibility; coefficients and τ action fixed; all hypotheses of ES.5 stated by its exact supplier node.

**Construction or proof.**

1. Use the residual representation and solvable tower to show invariant vanishing.
2. Apply compact inflation–restriction to propagate this to specializations.
3. Check each local condition and pairing against ES.5/howard-hypotheses and use its auxiliary-prime theorem.

**Acceptance checks.**

- A self-dual pairing alone does not imply Cartesian propagation at p.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple](#generalizedheegnercycles-gh-5-longo-vigni-admissible-triple), `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`, `ArithmeticGaloisDuality:R02.2/compact-five-term`.

**Sources.**

- [longo-vigni](#source-longo-vigni), §5.1, verification of (H.0)–(H.5), pp.18–19; Lemma 2.4, p.5. The higher-weight application verifies generic Howard hypotheses at S_P.

<a id="generalizedheegnercycles-gh-5-longo-vigni-local-assumptions"></a>
### Longo–Vigni local assumptions

**Target:** `GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.longoVigniLocalAssumptions`.

LV Assumption 3.2 requires V crystalline at p; a rank-one ordinary filtration of T whose F⁻T has trivial inertia; F⁺T and F⁺A exact annihilators under local duality; and finiteness of H⁰(K_{∞,v},F⁻A) and H⁰(K_v,F⁻A). These clauses are kept as application hypotheses. For the self-dual higher-weight twist, the untwisted ordinary quotient’s unramifiedness is not itself proof of trivial inertia on F⁻T: its Tate character must be tracked. Resolve this with the edition’s representation convention or a stronger applicable control theorem before claiming the unconditional application.

**Hypotheses and conventions.**

- LV §3.3 Assumption 3.2, rather than ordinarity alone; explicit local representation convention.

**Construction or proof.**

1. Write the local ordinary characters before and after the Tate twist.
2. Compare annihilators with the exact local duality pairing.
3. Check the two H⁰ groups and the control input; keep the missing twist verification as a gap.

**Acceptance checks.**

- Multiplying an unramified character by a nontrivial cyclotomic power usually changes its inertia action.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple](#generalizedheegnercycles-gh-5-longo-vigni-admissible-triple), `SelmerIwasawaCohomology:L4/bloch-kato-condition`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`, `PadicHodgeRegulators:L3`.

**Sources.**

- [longo-vigni](#source-longo-vigni), §3.3, Assumption 3.2, p.9. All local clauses are necessary in the theorem’s hypothesis package.

<a id="generalizedheegnercycles-gh-5-specialization-control"></a>
### Specialization and exceptional-prime control

**Target:** `GeneralizedHeegnerCycles:GH.5/specialization-control` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.specializationControl`.

LV Proposition 3.4 compares the specialized Selmer module with the S_P Selmer group, with kernel and cokernel finite and bounded in terms of [S_P:Λ/P], away from a finite exceptional set. Use the actual H⁰ and local annihilator hypotheses of Assumption 3.2. This is the application’s control input for the ES.8 height-one patching theorem, including perturbed primes (g+p^m), rather than a blanket isomorphism at every prime.

**Hypotheses and conventions.**

- LV local assumptions, finite-exception exclusion, no residual tower invariants; finite degree specialization.

**Construction or proof.**

1. Use compact inflation–restriction and local-condition propagation to construct the specialization map.
2. Bound both global and local error terms and identify the finite exceptional set.
3. Feed the bounded comparison to ES.8’s patching hypothesis.

**Acceptance checks.**

- The pΛ prime is excluded from the unramified height-one comparison; its contribution is controlled separately.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses](#generalizedheegnercycles-gh-5-higher-weight-howard-hypotheses), [GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions](#generalizedheegnercycles-gh-5-longo-vigni-local-assumptions), `SelmerIwasawaCohomology:L2/galois-selmer-group`, `ArithmeticGaloisDuality:R02.2/compact-five-term`.

**Sources.**

- [longo-vigni](#source-longo-vigni), §3.4, Proposition 3.4, pp.10–11. Provides bounded control outside finitely many primes.

<a id="generalizedheegnercycles-gh-5-higher-weight-kolyvagin-class"></a>
### Higher-weight Kolyvagin system

**Target:** `GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.correctedKolyvaginClass`.
**Planet:** Higher-weight Kolyvagin system.

Starting from LV β[n], apply D_n=∏_{ℓ|n}Σ_{i=1}^{|G_ℓ|−1}iσ_ℓ^i, sum over the specified coset representatives, reduce modulo I_n and descend uniquely using residual invariant vanishing. The raw κ_n satisfy the finite–singular relation up to units u_ℓ determined by Nekovář/CH’s local calculation. Set κ′_n=(∏_{ℓ|n}u_ℓ)^{-1}κ_n⊗⊗_{ℓ|n}σ_ℓ. This lies in the imported ES.3 Kolyvagin-system module and has κ′₁=κ₁. Transverse local membership and the p-condition are separate checks; κ₁≠0 is supplied by GH.6, not by the definition.

**Hypotheses and conventions.**

- LV admissible tower and the required local assumptions; choices of generators fixed then checked for independence; coefficient and admissible-prime ideals as in ES.5.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound](#generalizedheegnercycles-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound): Supplies the nontrivial higher-weight input to generic Howard descent.
- [GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one](#generalizedheegnercycles-gh-6-universal-norm-module-rank-one): Its leading class generates H∞ after the nonvanishing proof.

**Planning API.**

- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_unit` (relation): The local correction is the inverse product of u_ℓ, with each u_ℓ a unit.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_bottom` (projection): At n=1 the correction leaves κ₁ unchanged.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_fs` (compatibility): The corrected localization satisfies the exact generic finite–singular square.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_generator` (functoriality): Changing σ_ℓ rescales the derivative coefficient and the G_ℓ tensor by reciprocal factors, preserving the intrinsic class.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_empty` (degenerate): The empty correction product is 1 and κ′₁=κ₁.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_minus` (computation): A correction u=−1 negates the raw class.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_wrong_unit` (non-example): Replacing a correction unit by 0 kills the class and cannot give an equivalent system.

**Construction or proof.**

1. Apply the derivative norm identity and residual invariant vanishing to obtain descent.
2. Use the tame Frobenius congruence for finite–singular comparison and CH’s K2 correction units.
3. Verify local conditions at p and auxiliary primes, then apply the unit correction to obtain a genuine generic KS.

**Acceptance checks.**

- At n=1 the empty derivative and unit products are 1, so the initial class is unchanged.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class](#generalizedheegnercycles-gh-3-universal-norm-heegner-class), [GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence](#generalizedheegnercycles-gh-2-cycle-frobenius-congruence), [GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections](#generalizedheegnercycles-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections), [GeneralizedHeegnerCycles:GH.5/higher-weight-howard-hypotheses](#generalizedheegnercycles-gh-5-higher-weight-howard-hypotheses), [GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions](#generalizedheegnercycles-gh-5-longo-vigni-local-assumptions), `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`.

**Sources.**

- [longo-vigni](#source-longo-vigni), §4.3, Lemma 4.6 and Theorem 4.7, pp.14–16. The corrected classes form the KS; nonzero leading term has a separate proof.

<a id="generalizedheegnercycles-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound"></a>
### Conditional Longo–Vigni bound

**Target:** `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.longoVigniBound`.
**Planet:** Longo–Vigni bound.

Given the verified higher-weight H0–H5, local Assumption 3.2, bounded specialization control and κ′₁≠0, import ES.5’s DVR theorem and ES.8’s Λ theorem. The pro-Selmer module is torsion free of Λ-rank one and X is pseudo-isomorphic to Λ⊕M⊕M with M torsion, char(M)=char(M)^ι and char(M) dividing char(Selhat/Λκ′₁). In ideal-containment language char(Selhat/Λκ′₁)⊆char(M). This is a conditional application of generic descent; it does not re-plan Howard’s theory or reverse the divisibility. GH.6 supplies κ′₁≠0 and identifies Λκ′₁ with H∞.

**Hypotheses and conventions.**

- All application inputs explicitly verified; generic ES.8 patching assumptions, including height-one symmetry, hold.

**Construction or proof.**

1. Apply the imported generic DVR bound at each permitted S_P.
2. Use the finite exceptional-set and perturbed-prime control to patch and establish characteristic-ideal symmetry.
3. Keep κ′₁ nonzero as a hypothesis here to avoid a dependency cycle with GH.6.

**Acceptance checks.**

- The asserted inequality is an upper bound on the torsion length; equality is the separate main conjecture.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class](#generalizedheegnercycles-gh-5-higher-weight-kolyvagin-class), [GeneralizedHeegnerCycles:GH.5/specialization-control](#generalizedheegnercycles-gh-5-specialization-control), `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`.

**Sources.**

- [longo-vigni](#source-longo-vigni), §3.4, Theorem 3.5, p.11. States the rank, paired torsion structure and oriented divisibility.

<a id="generalizedheegnercycles-gh-5-auxiliary-form-leading-class-unit"></a>
### Integral auxiliary-form Kolyvagin system and leading unit

**Target:** `GeneralizedHeegnerCycles:GH.5/auxiliary-form-leading-class-unit` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.auxiliaryFormLeadingClassUnit`.

For each auxiliary g in auxiliary-form-local-range, construct its integral Lambda-adic Kolyvagin system from the actual stabilized generalized-cycle Iwasawa class kappa_g,infty. With the lattice, finite ring-class trace and Shapiro convention fixed, identify an explicit v_g in O_g^times with kappa_g,1=v_g kappa_g,infty and give v_g^−1. The local finite–singular correction factors u_ell are units; their empty product at n=1 is 1. A fixed nonzero denominator d_g or a rational isomorphism does not replace the leading unit.

**Hypotheses and conventions.**

- All generic ES hypotheses needed for the chosen descent theorem are verified in this auxiliary range. LV16 admissibility is an all-split, exceptional-prime package and cannot be silently applied here.
- The LV19 Theorem 4.7 invoked by the erratum must be collated in its version of record, or an independently applicable construction proved. Denominator and weight conditions are checked on the actual auxiliary forms, not assumed from the elliptic weight-two form.

**Construction or proof.**

1. Extend the integral norm-compatible class with the local conditions from auxiliary-form-local-range and import ES.3 derivative/descent machinery. Prove residual invariant vanishing and finite–singular compatibility for this representation.
2. Compute every coefficient, finite-component trace and tower-index normalization relating the leading derivative to kappa_g,infty. Apply inverse unit corrections at auxiliary primes; the empty-product normalization itself introduces no factor at n=1.
3. Collate LV19 Theorem 4.7 and its hypotheses against this construction. LV16 Theorem 4.7, pp.15–16, is a model for the correction calculation only; its hypotheses do not prove the nonsplit/varying-weight claim.

**Acceptance checks.**

- Taking v_g=p is rejected even though it is nonzero rationally. At n=1 the correction unit product equals 1; any extra initial scalar must come from an explicitly computed tower/lattice map.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.2/auxiliary-form-local-range](#generalizedheegnercycles-gh-2-auxiliary-form-local-range), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`.

**Sources.**

- [bsd-multiplicative-erratum-gh8](#source-bsd-multiplicative-erratum-gh8), Proof of Theorem 2.3, pp.3–4. Names LV19 Theorem 4.7 and the required initial unit comparison.
- [longo-vigni](#source-longo-vigni), §4.3, Theorem 4.7 and its proof, pp.15–16. Verified v1 inverse correction factors and unchanged initial class, in its own admissible range only.

<a id="gh-6"></a>
## GH.6. Nonvanishing and source-qualified Selmer consequences

Combine the appropriate analytic theorem, local reciprocity and generic descent. Separate clean LV and rational CH hypotheses, and prove the auxiliary non-torsion input.

<a id="generalizedheegnercycles-gh-6-anticyclotomic-nonvanishing"></a>
### Anticyclotomic nonvanishing

**Target:** `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.anticyclotomicNonvanishing`.
**Planet:** Anticyclotomic nonvanishing.

Under CH Theorem 3.9’s extra (N_f,D_K)=1, the square-root measure L_{p,ψ}(f) has nonzero value at all but finitely many finite-order anticyclotomic p-power characters. Its proof chooses an auxiliary coefficient prime ℓ with absolutely irreducible residual restriction to G_K and invokes Hsieh’s Theorem C after switching the analytic tower and auxiliary prime roles; this analytic theorem is requested from L3h. Combining nonzero values with the ramified logarithm formula gives nonzero z_{f,χφ} for all but finitely many finite-order φ in the critical interval. The analytic and algebraic conclusions retain their own hypotheses.

**Hypotheses and conventions.**

- CH §3 setup, (N_f,D_K)=1 and the auxiliary residual condition of Hsieh’s input; −r<j<r for the algebraic logarithm implication.

**Construction or proof.**

1. Import the precise mod-ℓ central-value nonvanishing theorem from L3h.
2. Show the bounded one-variable measure is not identically zero and apply p-adic Weierstrass preparation.
3. Use the nonzero interpolation constants in CH 4.9 to deduce nonzero localized class, hence nonzero global class.

**Acceptance checks.**

- A nonzero class follows from a nonzero local logarithm; a complex simple zero alone has no such implication here.

**Direct prerequisites:** `AutomorphicPadicLFunctions:L3h`, [GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula](#generalizedheegnercycles-gh-4-ramified-character-abel-jacobi-formula), [GeneralizedHeegnerCycles:GH.6/nonvanishing-hypothesis-transport](#generalizedheegnercycles-gh-6-nonvanishing-hypothesis-transport).

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §3, Theorem 3.9 and proof, p.14; §6, Theorem 6.1(2), p.27. The nonvanishing theorem has an explicit discriminant-level hypothesis.

<a id="generalizedheegnercycles-gh-6-selmer-rank-one"></a>
### Rank-one Selmer consequence

**Target:** `GeneralizedHeegnerCycles:GH.6/selmer-rank-one` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.selmerRankOne`.
**Planet:** Rank-one Selmer theorem.

For CH Hypothesis (H), canonical CM data and an anticyclotomic χ of type (j,−j) with −r<j<r, if z_{f,χ}≠0 then Sel(K,V_f(r)⊗χ)=F·z_{f,χ}. Ordinarity is not required for this fixed-weight implication. CH Theorem 7.7 identifies the source local conditions with Bloch–Kato and supplies Euler-system descent; its higher-weight verification uses the actual local p-condition. The eventual nonvanishing assertion is supplied separately by the preceding node.

**Hypotheses and conventions.**

- CH (H): p∤2(2r−1)!Nφ(N), conductor χ prime to N, every prime of N split in K, p split; class nonzero; canonical CM/period setup.

**Construction or proof.**

1. Use the cycle norm, Frobenius and conjugation relations to verify CH’s anticyclotomic Euler-system axioms.
2. Use the existing ES.4/rational-anticyclotomic-descent interface and verify its Bloch–Kato local conditions via Theorem 7.7. Do not substitute the stronger clean Howard hypotheses for CH (H).
3. The resulting dimension bound plus a nonzero Selmer class gives equality with its one-dimensional span.

**Acceptance checks.**

- For z=0 the conclusion cannot be inferred; the nonzero hypothesis is essential.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.2/cycle-norm-relations](#generalizedheegnercycles-gh-2-cycle-norm-relations), [GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence](#generalizedheegnercycles-gh-2-cycle-frobenius-congruence), [GeneralizedHeegnerCycles:GH.2/cycle-conjugation](#generalizedheegnercycles-gh-2-cycle-conjugation), [GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class](#generalizedheegnercycles-gh-2-finite-local-abel-jacobi-class), `SelmerIwasawaCohomology:L2/galois-selmer-group`, `EulerSystemsAndKolyvaginSystems:ES.4/rational-anticyclotomic-descent`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §6, Theorem 6.1(1), p.27; §7.3, Theorem 7.7, pp.31–32. The nonzero-cycle implication is the critical-range Selmer statement.

<a id="generalizedheegnercycles-gh-6-selmer-rank-zero"></a>
### Rank-zero Selmer consequence

**Target:** `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.selmerRankZero`.
**Planet:** Rank-zero Selmer theorem.

Under CH (H), for ordinary f and χ of type (j,−j) with j≥r or j≤−r, L(f,χ,r)≠0 implies Sel(K,V_f(r)⊗χ)=0. The dual-exponential special value supplies a nonzero local class in the complementary Euler-system condition; CH Theorem 7.9 and the corrected Proposition 7.8 local proof then force vanishing of the Bloch–Kato Selmer group. Use χ^{-1} and conjugation for the opposite range.

**Hypotheses and conventions.**

- Ordinary a_p; CH (H); outside the critical interval; nonzero normalized central value; corrected local condition adapter.

**Construction or proof.**

1. Apply the dual-exponential formula and nonvanishing interpolation constants.
2. Verify the specialized anticyclotomic Euler-system local axioms by the KO replacement.
3. Use local duality and the existing ES.4/rational-anticyclotomic-descent interface to eliminate the Bloch–Kato subspace; the clean Howard big-image package is not a stated hypothesis of CH Theorem 6.2.

**Acceptance checks.**

- In the critical interval the root number is −1; this theorem’s nonzero central-value hypothesis applies to the opposite range.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value](#generalizedheegnercycles-gh-4-dual-exponential-special-value), [GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections](#generalizedheegnercycles-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections), `SelmerIwasawaCohomology:L2/galois-selmer-group`, `EulerSystemsAndKolyvaginSystems:ES.4/rational-anticyclotomic-descent`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §6, Theorem 6.2 and proof, p.27; §7.4, Theorem 7.9, p.33. The ordinary central-value implication uses the specialized local class.

<a id="generalizedheegnercycles-gh-6-selmer-consequences-with-the-corrected-dimension-formula"></a>
### Corrected Selmer growth formula

**Target:** `GeneralizedHeegnerCycles:GH.6/selmer-consequences-with-the-corrected-dimension-formula` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.selmerGrowth`.
**Planet:** Selmer growth formula.

For the CH anticyclotomic ring-class p-tower, the eventual dimension is dim_F Sel(K_{p^n},V_{f,χ})=((1−ε(V_{f,χ}))/2)[K_{p^n}:K]+e with e≥0 independent of n. The root sign is −1 exactly for −r<j<r and +1 outside; thus the slope is 1 or 0. This is CH Theorem 6.3 in its corrected form, with the finite quotient and coefficient extensions in the character decomposition tracked.

**Hypotheses and conventions.**

- The fixed-weight CH setup and hypotheses used by Theorems 6.1–6.2; n sufficiently large; ordinary assumption for the rank-zero branch.

**Construction or proof.**

1. Use finite-level Shapiro and decompose into characters of the finite abelian tower quotient, extending coefficients and accounting for multiplicities.
2. Apply eventual nonvanishing and the rank-one/rank-zero results; finitely many exceptional characters contribute the constant e.
3. Insert the corrected factor (1−ε)/2 from the erratum.

**Acceptance checks.**

- For ε=+1 the dimensions stabilize; for ε=−1 their leading term is the tower degree.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing](#generalizedheegnercycles-gh-6-anticyclotomic-nonvanishing), [GeneralizedHeegnerCycles:GH.6/selmer-rank-one](#generalizedheegnercycles-gh-6-selmer-rank-one), [GeneralizedHeegnerCycles:GH.6/selmer-rank-zero](#generalizedheegnercycles-gh-6-selmer-rank-zero), `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §6, Theorem 6.3, p.27. The revised author copy carries the corrected growth factor.
- [castella-hsieh-erratum](#source-castella-hsieh-erratum), First correction, p.1. The factor is (1−ε)/2.

<a id="generalizedheegnercycles-gh-6-selmer-parity"></a>
### Selmer parity

**Target:** `GeneralizedHeegnerCycles:GH.6/selmer-parity` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.selmerParity`.
**Planet:** Selmer parity theorem.

For ordinary f under CH (H), ord_{s=r}L(f,χ,s)≡dim_F Sel(K,V_f(r)⊗χ) mod 2. The proof uses Nekovář’s self-dual family parity theorem and its 2009 correction, plus one sufficiently ramified specialization whose Selmer dimension is 0 or 1 according to the root sign. The residue is (1−ε)/2 mod 2; ±1 itself cannot represent the two different residues modulo 2.

**Hypotheses and conventions.**

- Ordinary f; the self-dual induced family and its local parity hypotheses are supplied; the corrected Nekovář theorem applies.

**Construction or proof.**

1. Form the induced self-dual family and track its local plus-submodule in each j range.
2. Use nonvanishing and the two fixed-weight Selmer theorems to choose a known parity specialization.
3. Apply the supplier’s corrected parity invariance theorem and the complex functional-equation sign.

**Acceptance checks.**

- The parity residue is 0 at ε=+1 and 1 at ε=−1.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.6/selmer-rank-one](#generalizedheegnercycles-gh-6-selmer-rank-one), [GeneralizedHeegnerCycles:GH.6/selmer-rank-zero](#generalizedheegnercycles-gh-6-selmer-rank-zero), [GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing](#generalizedheegnercycles-gh-6-anticyclotomic-nonvanishing), `SelmerIwasawaCohomology:L4`.

**Sources.**

- [castella-hsieh](#source-castella-hsieh), §6.4, Theorem 6.4 and proof, pp.27–28. The proof invokes Nek07 and Nek09 for parity in a family.

<a id="generalizedheegnercycles-gh-6-universal-norm-module-rank-one"></a>
### Universal norm module of rank one

**Target:** `GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.universalNormModuleRankOne`.
**Planet:** Universal norm module.

For LV’s admissible triple and its verified control and local assumptions, H∞, the Λ-submodule of the pro-Selmer module generated by the norm classes, is free of rank one and is generated by κ̃₁. Theorem 4.12 uses eventual nonzero generalized cycles from CH, the Φ image/intersection calculation and a universal-norm/Nakayama argument. Merely knowing κ̃₁≠0 does not prove that it generates all of H∞ or that H∞ is saturated.

**Hypotheses and conventions.**

- LV admissibility and verified application conditions; comparison of CH classes with the LV finite Δ norm convention.

**Construction or proof.**

1. Use CH nonvanishing to find a nonzero norm class at a finite level.
2. Compute the stable augmentation image using the trace-polynomial ideal equality.
3. Apply the cited universal-norm argument and Nakayama to show generation by κ̃₁, then use torsion freeness.

**Acceptance checks.**

- A nonzero element p of Λ is not a generator of Λ; nonvanishing alone cannot justify the module-generation conclusion.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class](#generalizedheegnercycles-gh-3-universal-norm-heegner-class), [GeneralizedHeegnerCycles:GH.3/trace-polynomial-intersection](#generalizedheegnercycles-gh-3-trace-polynomial-intersection), [GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing](#generalizedheegnercycles-gh-6-anticyclotomic-nonvanishing), [GeneralizedHeegnerCycles:GH.5/specialization-control](#generalizedheegnercycles-gh-5-specialization-control), [GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class](#generalizedheegnercycles-gh-5-higher-weight-kolyvagin-class).

**Sources.**

- [longo-vigni](#source-longo-vigni), §4.3, Definition 4.10 and Theorem 4.12, pp.16–18. Gives freeness and generation, a stronger statement than nonvanishing.

<a id="generalizedheegnercycles-gh-6-lambda-structure-consequence"></a>
### Higher-weight Iwasawa structure

**Target:** `GeneralizedHeegnerCycles:GH.6/lambda-structure-consequence` · application.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.lambdaStructureConsequence`.

With the GH.5 application hypotheses verified and GH.6’s H∞=Λκ̃₁ free of rank one, LV Theorem 1.1 follows by importing the generic Λ bound: X∞∼Λ⊕M⊕M, char(M)=char(M)^ι, char(M) divides char(Selhat/H∞). Equality of characteristic ideals is LV’s main conjecture and is not asserted here. This conditional structure consequence retains the local-filtration and normalization gaps until the supplier and source comparison obligations are discharged.

**Hypotheses and conventions.**

- The admissible triple, H0–H5, local Assumption 3.2, control and universal-norm identification are all verified.

**Construction or proof.**

1. Supply κ̃₁≠0 and H∞=Λκ̃₁ from the preceding theorem.
2. Apply the already imported generic Howard Λ theorem through the GH.5 adapter.

**Acceptance checks.**

- The quotient in the divisibility is Selhat/H∞ after identifying H∞, not a quotient by an arbitrary nonzero class.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound](#generalizedheegnercycles-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound), [GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one](#generalizedheegnercycles-gh-6-universal-norm-module-rank-one).

**Sources.**

- [longo-vigni](#source-longo-vigni), Introduction Theorem 1.1 and §5.1, pp.2,18–19. The source distinguishes the proven divisibility from conjectural equality.

<a id="generalizedheegnercycles-gh-6-nonvanishing-hypothesis-transport"></a>
### Hsieh nonvanishing hypothesis transport

**Target:** `GeneralizedHeegnerCycles:GH.6/nonvanishing-hypothesis-transport` · application.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.nonvanishingHypothesisTransport`.

In the F=Q, all-split tame-level CH setup with (N_f,D_K)=1, choose an auxiliary coefficient prime ell different from the anticyclotomic tower prime p. Translate Hsieh14 Theorem C to nonzero central values modulo ell for all but finitely many p-power characters, then use the imported L3h interpolation to show the bounded p-adic square-root measure is nonzero. Nonzero bounded one-variable power series has only finitely many torsion-character zeros. This supplies GH.6 nonvanishing with its extra discriminant-level hypothesis.

**Hypotheses and conventions.**

- Hsieh Theorem C: ordinary CM type at the coefficient prime, square-free nonsplit conductor n−, Hypothesis A epsilon*=+1 at v|n−, coprimality of coefficient/tower primes with n c_chi D_K, absolutely irreducible residual restriction to G_K and coefficient prime not dividing the specified local finite character orders.
- For the CH all-split specialization n−=1, Hypothesis A and square-free n− hold automatically. Choose ell outside pND_K and the finite factors at nonsplit character conductor (including 1+q as in the CH proof), with the CM type ell-ordinary and the required residual irreducibility; this prime-existence input is part of the L3h request. Hsieh’s coefficient prime and tower prime are switched; the conclusion is not a mod-p claim for the original fixed form.

**Construction or proof.**

1. Read the Theorem C package with the roles of p and ell renamed before specializing F=Q. In local-degree one its almost-all conclusion means a finite exceptional set.
2. Check each local root-number, conductor and residual condition under the CH auxiliary-prime choice, rather than applying a bare nonvanishing citation.
3. Transport the algebraic central values through the L3h period/Euler interpolation, conclude nonidentity of the p-adic measure, and apply the existing Weierstrass-preparation supplier.

**Acceptance checks.**

- Nontriviality of a distribution alone does not establish a Selmer rank. In a multivariable or local-degree>1 tower, Theorem C does not assert a finite exceptional set; use its dense-set formulation instead.

**Direct prerequisites:** `AutomorphicPadicLFunctions:L3h`, `AutomorphicGaloisRepresentations:R19.1`.

**Sources.**

- [hsieh-2014](#source-hsieh-2014), Introduction, Hypothesis A and (ord), pp.710–711; Theorem C, p.713; Theorem 7.1 and proof, pp.759–764. Full nonvanishing package, including local-degree and auxiliary residual hypotheses.
- [castella-hsieh](#source-castella-hsieh), Theorem 3.9 and proof, p.14. Auxiliary-prime choice and switching the coefficient and tower primes.

<a id="generalizedheegnercycles-gh-6-auxiliary-form-nontorsion"></a>
### Non-torsion in the auxiliary-form source range

**Target:** `GeneralizedHeegnerCycles:GH.6/auxiliary-form-nontorsion` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.auxiliaryFormNontorsion`.

For g in auxiliary-form-local-range, prove kappa_g,infty is non-torsion over the specified anticyclotomic Iwasawa algebra. Realize the square-root analytic distribution in the same coefficient/twist convention, prove its nonvanishing with the local-root-number/conductor conditions at ramified tame primes, and prove the source-qualified reciprocity formula on the integral class. For a nonzero scalar functional of the localized class, conclude the class is nonzero; use the established torsion-free Selmer/Iwasawa module to obtain non-torsion.

**Hypotheses and conventions.**

- The special nonsplit local types of the erratum and all residual/ordinary assumptions are retained. CH Theorem 3.9 has the extra (N_f,D_K)=1 and cannot prove this ramified-tame extension. Hsieh Hypothesis A is a local sign condition to verify here, not automatically vacuous.
- The regulator map is defined at the selected nonexceptional specializations; period/Euler factors are nonzero. Exceptional multiplicative specialization is an analytic regular-model problem in the consumer route, not a p-old class theorem.

**Construction or proof.**

1. Request from L3h Hsieh Theorem C/interpolation with exact special-local test-vector and sign checks at the ramified tame primes of the auxiliary form.
2. Extend the generalized-cycle reciprocity calculation in GH.4 to the same source range using the local range theorem and the fixed regulator/twist maps; do not use all-split CH5.7 without this adapter.
3. Combine analytic nonvanishing and the nonzero-line regulator pairing with torsion freeness of the actual global module. This is the non-torsion input used by the corrected BSD proof; the source-range reciprocity verification remains explicit.

**Acceptance checks.**

- Do not apply CH3.9 when a ramified tame q divides both M and D_K. Nonzero local reciprocity value implies nonzero global class, while the reverse need not hold without injectivity.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.2/auxiliary-form-local-range](#generalizedheegnercycles-gh-2-auxiliary-form-local-range), [GeneralizedHeegnerCycles:GH.5/auxiliary-form-leading-class-unit](#generalizedheegnercycles-gh-5-auxiliary-form-leading-class-unit), [GeneralizedHeegnerCycles:GH.7/ordinary-regulator-quotient-application](#generalizedheegnercycles-gh-7-ordinary-regulator-quotient-application), `AutomorphicPadicLFunctions:L3h`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

**Sources.**

- [bsd-multiplicative-erratum-gh8](#source-bsd-multiplicative-erratum-gh8), Proof of Theorem 2.3, pp.3–4. Invokes CH6.1 non-torsion on the auxiliary class.
- [hsieh-2014](#source-hsieh-2014), Hypothesis A, p.710; Theorem C, p.713; Theorem 7.1, pp.759–764. Analytic nonvanishing has explicit nonsplit-local and residual conditions.

<a id="gh-7"></a>
## GH.7. Hida-family classes and specialization

Construct the family application from its owners; verify the ordinary quotient regulator and global localization before comparing specializations.

<a id="generalizedheegnercycles-gh-7-critical-character-twist"></a>
### Critical character and CM family twist

**Target:** `GeneralizedHeegnerCycles:GH.7/critical-character-twist` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.criticalTwist`.
**Planet:** Critical family twist.

Fix the Hida component and a lift i modulo 2(p−1). Castella’s critical character is Θ=ω^{i/2}[⟨ε_cyc⟩^{1/2}]. Extend the branch to include the CM character λ, and construct Ξ and ξ=Ξ/Ξ̄ as in §2.6. The critically twisted family is T†=T⊗Θ^{-1}, with determinant ε_f ε_cyc; the self-dual convention requires trivial nebentypus ε_f=1. Keep ε_f in the general family determinant; the regulator line is in T†|_{G_K}⊗ξ^{-1}. The induced unramified rank-one character Ψ at p, its Frobenius value and λ_reg=Ψ(Fr_p)−1 must be tracked through this precise twist. ξ is not substituted for an arbitrary anticyclotomic character.

**Hypotheses and conventions.**

- Fixed branch, geometric reciprocity, square-root lift and CM character λ; ordinary residual irreducible and p-distinguished family.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.7/family-regulator-localization](#generalizedheegnercycles-gh-7-family-regulator-localization): Makes the actual plus line unramified for the supplier regulator.
- [GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization](#generalizedheegnercycles-gh-7-higher-weight-family-specialization): Pins the self-dual representation identified with V_fν(rν).

**Planning API.**

- `TauCeti.GeneralizedHeegner.criticalTwist_apply` (simp): The twisting character is Θ(g)^{-1}ξ(g)^{-1}.
- `TauCeti.GeneralizedHeegner.criticalTwist_selfDual` (compatibility): If the untwisted determinant character δ=ε_f Θ²ε_cyc, twisting by Θ⁻¹ξ⁻¹ gives determinant ε_f ε_cyc ξ⁻². Setting ε_f=1 recovers the self-dual convention; a nontrivial nebentypus factor survives the critical twist.
- `TauCeti.GeneralizedHeegner.criticalTwist_specialize` (functoriality): Specialization of the coefficient ring commutes with both inverse character factors.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.criticalTwist_trivial` (degenerate): With both characters trivial the twist is trivial.
- `TauCeti.GeneralizedHeegner.criticalTwist_inverse` (characterisation): Multiplying the twist by Θξ gives the trivial character.
- `TauCeti.GeneralizedHeegner.criticalTwist_order` (compatibility): The CM and critical inverse factors commute in the coefficient unit group.
- `TauCeti.GeneralizedHeegner.criticalTwist_nebentypus` (non-example): On G=Q× with ε_f the identity character and Θ=ξ=ε_cyc=1, the twisted determinant at −1 remains −1. Dropping ε_f would incorrectly give 1.

**Construction or proof.**

1. Import the Hida branch and continuous character algebra from PadicFamilies.
2. Apply the critical half-weight twist, then the CM anticyclotomic twist.
3. Compute the resulting local rank-one Frobenius character from the ordinary exact sequence.

**Acceptance checks.**

- Different lifts of i modulo 2(p−1) can change the half-weight character; a square-root choice must be fixed.
- A nontrivial ε_f remains in det(T†); the general family reciprocity does not imply a trivial-nebentypus global self-duality theorem.

**Direct prerequisites:** `PadicFamilies:L0/hida-control-theorem`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `AutomorphicGaloisRepresentations:R19.6`, `PadicHodgeRegulators:L3`.

**Sources.**

- [castella-variation](#source-castella-variation), §2.6, Definition 2.8, p.10; §4.1, Theorem 4.3, pp.18–19; §5.1, p.21. The family CM character and critical twist determine the regulator normalization.

<a id="generalizedheegnercycles-gh-7-howard-family-tower"></a>
### Howard family class tower

**Target:** `GeneralizedHeegnerCycles:GH.7/howard-family-tower` · construction.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.howardTowerClass`.
**Planet:** Howard family tower.

On X₁(Np^s), form the ordinary divisor/Kummer classes from Howard’s CM points P_{c₀p^n,s} defined over K̃_{c₀p^n}(μ_{p^s}), with the diamond character ϑ²=ε_cyc and critical twist Θ^{-1}. The horizontal degeneracy trace is U_p; after U_p^{-s} normalization take the s-inverse limit to X_c. Then Z_{c₀,t}=U_p^{1−t}X_{c₀p^t} is corestriction compatible in t and defines Z_{c₀,∞}∈H¹_Iw(K̃_{c₀p∞},T†). It lies in the strict Greenberg condition when the required bad-prime residual ramification holds.

**Hypotheses and conventions.**

- Hida ordinary, residual irreducible and p-distinguished; fine-level CM data; bad-prime torsion freeness as in Castella Proposition 4.8.

**Uses that determine the API.**

- [GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity](#generalizedheegnercycles-gh-7-two-variable-explicit-reciprocity): Supplies the global class to the localized regulator.
- [GeneralizedHeegnerCycles:GH.7/initial-family-specialization](#generalizedheegnercycles-gh-7-initial-family-specialization): Fixes the precise bottom point class whose specialization is evaluated.

**Planning API.**

- `TauCeti.GeneralizedHeegner.howardTowerClass_level` (projection): The conductor-t class is U_p^{1−t}X_{c₀p^t}.
- `TauCeti.GeneralizedHeegner.howardTowerClass_trace` (relation): The normalized family classes are corestriction compatible.
- `TauCeti.GeneralizedHeegner.howardTowerClass_greenberg` (structure): The local family class lies in the strict Greenberg submodule under the source bad-prime hypotheses.

**Definition checks.** Each test calls the proposed construction or its specified geometric realization. These are mathematical contracts, not assertions that the arithmetic fixture is already in Lean.

- `TauCeti.GeneralizedHeegner.howardTowerClass_one` (computation): At t=1 the class is X₁.
- `TauCeti.GeneralizedHeegner.howardTowerClass_two` (computation): At t=2 the class is U_p^{-1}X₂.
- `TauCeti.GeneralizedHeegner.howardTowerClass_unit` (degenerate): With U_p=1 there is no renormalization.

**Construction or proof.**

1. Import Howard’s CM point tower from HE and the family representation from R19.6.
2. Apply the Kummer maps and ordinary control with the U_p^{-s} normalization.
3. Use the vertical trace relation to normalize by U_p^{1−t}; apply the local Greenberg verification at p and at bad primes.

**Acceptance checks.**

- The t=1 class has U_p⁰ normalization; omitting the +1 in 1−t changes its initial comparison.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist), `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `AutomorphicGaloisRepresentations:R19.6`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `ModularCurvesPartII:R14.3`, `HeegnerPointEulerSystems:HE.1`.

**Sources.**

- [castella-variation](#source-castella-variation), §4.2, Proposition 4.4, Definitions 4.5–4.6 and Proposition 4.8, pp.19–21. The point tower, horizontal and vertical normalization are described.

<a id="generalizedheegnercycles-gh-7-family-representation-specialization"></a>
### Family representation specialization

**Target:** `GeneralizedHeegnerCycles:GH.7/family-representation-specialization` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.familyRepresentationSpecialization`.

Castella’s T=lim_s e^ord T_p(J_s)⊗_h I is free of rank two under residual irreducibility and p-distinguishedness. It has trace ρ(Fr_ℓ^{-1})=a_ℓ and determinant ε_f(ℓ)[ℓ]ℓ, and its ordinary quotient is unramified with geometric Frobenius inverse eigenvalue a_p. At an arithmetic ν the critically twisted specialization identifies with T_{fν}(rν) after the specified coefficient extension and residual assumptions. This family representation and control belong to R19.6/PadicFamilies; this node checks their convention against the GH class.

**Hypotheses and conventions.**

- Normal finite-flat Hida branch and arithmetic ν of the source’s weight and character; ordinary/residual hypotheses.

**Construction or proof.**

1. Import the family representation, ordinary exact sequence and arithmetic specialization.
2. Compare geometric Frobenius, determinant and critical twist with the fixed-weight coefficient projector.

**Acceptance checks.**

- A trace convention at Fr_ℓ^{-1} cannot be silently replaced by arithmetic Fr_ℓ.

**Direct prerequisites:** `AutomorphicGaloisRepresentations:R19.6`, `PadicFamilies:L0/hida-control-theorem`, [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist), [GeneralizedHeegnerCycles:GH.0/newform-cm-projector](#generalizedheegnercycles-gh-0-newform-cm-projector).

**Sources.**

- [castella-variation](#source-castella-variation), §4.1, Theorem 4.3, p.19. The exact representation and ordinary convention are stated.

<a id="generalizedheegnercycles-gh-7-family-measure-specialization"></a>
### Family square-root measure specialization checkpoint

**Target:** `GeneralizedHeegnerCycles:GH.7/family-measure-specialization` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.familyMeasureSpecialization`.

Import L_{p,ξ}(f)∈I_W[[Γ̃]] from L3h. Castella Theorem 2.11 gives for ν of weight (kν,1), kν≥1, and φ type (ℓ,−ℓ), ℓ≥0, conductor c₀p^n: ν(L_{p,ξ}(f))(φ̂)²/Ω_p^{2kν+4ℓ}=L_alg(fν/K,χνξνφ,kν−1)E_p²φ(𝔑^{-1})8c₀ε(fν)w_K²√D_K. Here ψ=ξνφ. For n=0 E_p=(1−ν(a_p)(χνψ)_p(p)p^{-kν/2})(1−(χνψ)_p(p)p^{kν/2−1}ν(a_p)^{-1}); for n≥1 E_p=ε((χνψ)_p^{-1})p^{-n}. The χν norm factor converts kν−1 to the central kν/2 convention (Remark 2.12). The measure is square-root normalized; the displayed interpolation squares it.

**Hypotheses and conventions.**

- Castella §2.3–2.7’s CM and modular measure data; exact arithmetic ν and locally algebraic φ; complete unramified coefficient extension W.
- This is the consumer normalization comparison using the imported L3h interpolation theorem, not a second owner of the family distribution or Theorem 2.11.

**Construction or proof.**

1. Import the family CM modular measure and its toric interpolation from L3h.
2. Check specialization of χν, ξν, periods, gamma factors and the ramified/unramified Euler cases.
3. Match the fixed-weight CH distribution with the family measure at the chosen branch; do not define a second BDP measure in GH.7.

**Acceptance checks.**

- At n>0 the epsilon factor replaces the two unramified Euler factors.

**Direct prerequisites:** `AutomorphicPadicLFunctions:L3h`, `PadicFamilies:L0/hida-control-theorem`, [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist).

**Sources.**

- [castella-variation](#source-castella-variation), §2.7, Theorem 2.11 and Remark 2.12, pp.11–12. The family interpolation and central normalization are explicit.

<a id="generalizedheegnercycles-gh-7-ochiai-exponential-checkpoint"></a>
### Ochiai exponential checkpoint

**Target:** `GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.ochiaiExponentialCheckpoint`.

The local supplier must provide Castella Theorem 3.4: with Ical=I⊗̂Z_p[[Γ_cyc]], D=(F⁺T⊗Ẑ_p^ur)^{G_Qp} and J=(Ψ(Fr_p)−1,γ₀−1), an injective E_F^cyc:J(D⊗O_F)→H¹(F,F⁺Tcal) with pseudo-null cokernel for finite unramified F/Q_p. Its arithmetic specialization, including the weight-positive exponential interpolation, differs at conductor 0 and positive conductor. This ideal-restricted domain and pseudo-null error must survive every regulator adapter.

**Hypotheses and conventions.**

- Castella ordinary deformation Definition 3.1, rank-one unramified F⁺ line, determinant convention and finite unramified F.

**Construction or proof.**

1. Request the generic Ochiai exponential as a Part II extension of the cyclotomic regulator packet.
2. Verify the actual GH critical twist satisfies its local ordinary deformation input, and retain J and its specialization error.

**Acceptance checks.**

- At an exceptional arithmetic character the J-specialized map can vanish; an everywhere-isomorphism claim is invalid.

**Direct prerequisites:** `PadicHodgeRegulators:L3`, [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist).

**Sources.**

- [castella-variation](#source-castella-variation), §3.2, Theorem 3.4, pp.14–15. The map’s ideal domain, injectivity, interpolation and pseudo-null cokernel are the checkpoint.

<a id="generalizedheegnercycles-gh-7-yager-unramified-checkpoint"></a>
### Yager unramified descent checkpoint

**Target:** `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.yagerUnramifiedCheckpoint`.

The supplier’s Yager module S∞ is the inverse limit under trace of the finite unramified coefficient modules S_m generated by y_m(x)=Σ_σ x^σ[σ^{-1}]. It is free of rank one over Z_p[[U]], satisfies y^u=[u]y, and identifies with lim_trace O_{F_m}. Use this equivariance to descend the tensor of the cyclotomic local maps to the unramified×cyclotomic tower. Finite unramified base change of a cyclotomic regulator alone is not this construction.

**Hypotheses and conventions.**

- Unramified Z_p-tower with its Galois action and trace; Castella §3.3 coefficient convention.

**Construction or proof.**

1. Request Yager’s trace module and free rank-one basis/covariance theorem from the PHR local Part II owner.
2. Use trace compatibility and covariance to obtain the local two-variable map; retain finite-level corestriction checks.

**Acceptance checks.**

- The coefficient action is by [u], with σ^{-1} in the Yager sum; changing either inversion changes descent.

**Direct prerequisites:** `PadicHodgeRegulators:L3`, [GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint](#generalizedheegnercycles-gh-7-ochiai-exponential-checkpoint).

**Sources.**

- [castella-variation](#source-castella-variation), §3.3, Proposition 3.5 and (3.6), p.15. The infinite unramified coefficient module is part of the construction.

<a id="generalizedheegnercycles-gh-7-two-variable-regulator-checkpoint"></a>
### Two-variable regulator checkpoint

**Target:** `GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.twoVariableRegulatorCheckpoint`.

With G=U×Γ_cyc and λ_reg=Ψ(Fr_p)−1, the supplier map of Castella Theorem 3.7 has target λ_reg^{-1}J(D⊗Ô_{F∞}[[G]]), is injective, and interpolates the logarithm for w>0 at nonexceptional characters. For a p-old arithmetic specialization ν, Corollary 3.9 gives the dual exponential range w≤0 with its factorial and Euler factors. Keep the conductor-zero exceptional denominator and the integral ideal J; the target is not an unlocalized unrestricted coefficient algebra.

**Hypotheses and conventions.**

- The rank-one unramified ordinary line, Yager covariance and nonexceptional arithmetic specialization; all §3 conventions.
- The dual-exponential conclusion of Corollary 3.9 additionally requires ν to be p-old.

**Construction or proof.**

1. Combine the requested exponential and Yager module into the two-variable regulator.
2. Check logarithmic and dual-exponential interpolation against the same twists before passing to the anticyclotomic quotient.

**Acceptance checks.**

- At λ_reg=0 localization does not produce a value; exceptional arithmetic primes require a separate statement.

**Direct prerequisites:** `PadicHodgeRegulators:L3`, [GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint](#generalizedheegnercycles-gh-7-yager-unramified-checkpoint), [GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint](#generalizedheegnercycles-gh-7-ochiai-exponential-checkpoint).

**Sources.**

- [castella-variation](#source-castella-variation), §3.4, Theorem 3.7 and Corollary 3.9, pp.16–17. The localized ideal target and both specialization ranges are the checkpoint.

<a id="generalizedheegnercycles-gh-7-family-regulator-localization"></a>
### Anticyclotomic family regulator

**Target:** `GeneralizedHeegnerCycles:GH.7/family-regulator-localization` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.familyRegulatorLocalization`.

Castella Proposition 5.2 supplies L_ωf^Γ:H¹_Iw(K∞/F,F⁺T†⊗ξ^{-1})→I[λ_reg^{-1}]⊗W[[Γ]], injective with pseudo-null cokernel. It pairs the local map with the canonical family differential functional of Lemma 5.1. Passing from the two-variable tower to Γ uses the H² correction; the needed vanishing is checked through H⁰(K∞,F⁺T)=0. A quotient of the local regulator cannot be declared injective solely by tensoring its source and target.

**Hypotheses and conventions.**

- The critical/CM twist is the one giving Ψ; λ_reg is inverted; H⁰/H² condition and the canonical family differential are fixed.

**Construction or proof.**

1. Pair the imported map with the family ω functional and descend to Γ.
2. Use the specialization exact sequence and the H² correction to prove injectivity and the pseudo-null bound.

**Acceptance checks.**

- The nonexceptional condition λ_reg≠0 is retained in each arithmetic specialization.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint](#generalizedheegnercycles-gh-7-two-variable-regulator-checkpoint), [GeneralizedHeegnerCycles:GH.7/family-representation-specialization](#generalizedheegnercycles-gh-7-family-representation-specialization), [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist), `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, [GeneralizedHeegnerCycles:GH.7/ordinary-regulator-quotient-application](#generalizedheegnercycles-gh-7-ordinary-regulator-quotient-application).

**Sources.**

- [castella-variation](#source-castella-variation), §5.1, Lemma 5.1 and Proposition 5.2, pp.21–22. The localized scalar regulator uses a cohomological descent check.

<a id="generalizedheegnercycles-gh-7-two-variable-explicit-reciprocity"></a>
### Two-variable explicit reciprocity

**Target:** `GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.twoVariableReciprocity`.
**Planet:** Two-variable reciprocity law.

In I[λ_reg^{-1}]⊗W[[Γ̃]], L_ωf^Γ(res_p Z_{c₀,∞}^{ξ^{-1}})=L_{p,ξ}(f)·σ_{−1,p}. This is Castella Theorem 5.3 with its own class/measure normalization; it has no additional −c₀^{r−1} prefactor. Its specialization must be compared with CH 5.7 through the named normalization adapter, not by identifying the two unnormalized class towers.

**Hypotheses and conventions.**

- Castella’s ordinary residual irreducible/p-distinguished family, local regulator domain, CM tower and measure; localized λ_reg.

**Construction or proof.**

1. Verify the local restriction is in the plus-line Iwasawa source.
2. At a dense set of weight-two arithmetic specializations with sufficiently ramified φ, compute the Coleman evaluation and period-normalized CM measure (Proposition 5.4).
3. Apply family control and density; the local epsilon sign gives σ_{−1,p}.

**Acceptance checks.**

- Squaring conceals the class normalization; the family identity is kept linear.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.7/howard-family-tower](#generalizedheegnercycles-gh-7-howard-family-tower), [GeneralizedHeegnerCycles:GH.7/family-regulator-localization](#generalizedheegnercycles-gh-7-family-regulator-localization), [GeneralizedHeegnerCycles:GH.7/family-measure-specialization](#generalizedheegnercycles-gh-7-family-measure-specialization), [GeneralizedHeegnerCycles:GH.1/coleman-abel-jacobi-formula](#generalizedheegnercycles-gh-1-coleman-abel-jacobi-formula).

**Sources.**

- [castella-variation](#source-castella-variation), §5.2, Theorem 5.3, Proposition 5.4 and proof, pp.22–25. The localized family reciprocity law uses the Artin sign translation.

<a id="generalizedheegnercycles-gh-7-ordinary-localization-injective"></a>
### Ordinary localization injectivity

**Target:** `GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective` · lemma.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.ordinaryLocalizationInjective`.

For an ordinary fixed-weight form f of even weight at least two and trivial nebentypus with residual restriction to G_K irreducible, Castella Lemma 6.4 makes the localization Sel_Gr(K_{c₀p∞}/K_{c₀},T_f(r))→H¹_Iw(local,F⁺T_f(r)) injective. The proof uses Λ-torsion freeness and infinitely many arithmetic specializations where the global rank-one class and its local logarithm are nonzero. This additional result is what turns equality of local regulator images into equality of global classes.

**Hypotheses and conventions.**

- Residual |G_K irreducibility, ordinary filtration, torsion-free global module and nonzero local classes at infinitely many finite characters.
- The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

**Construction or proof.**

1. Use the fixed-weight nonvanishing/reciprocity and Selmer rank-one result to show the finite-character localization kernels vanish.
2. Apply torsion freeness and infinitely many specializations to kill the global kernel.

**Acceptance checks.**

- Equality after a local regulator gives a global equality only after this injectivity input.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing](#generalizedheegnercycles-gh-6-anticyclotomic-nonvanishing), [GeneralizedHeegnerCycles:GH.6/selmer-rank-one](#generalizedheegnercycles-gh-6-selmer-rank-one), [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L4`.

**Sources.**

- [castella-variation](#source-castella-variation), §6.2, Lemma 6.4, p.27. Localization injectivity is a distinct ingredient in the global comparison.

<a id="generalizedheegnercycles-gh-7-initial-family-specialization"></a>
### Initial family specialization

**Target:** `GeneralizedHeegnerCycles:GH.7/initial-family-specialization` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.initialFamilySpecialization`.
**Planet:** Initial family specialization.

Under Castella Theorem 6.5, at an arithmetic ν of trivial character and weight 2rν>2 with 2rν≡k mod 2(p−1), ν(Z_{c₀,0})=(1−p^{rν−1}/ν(a_p))² AJ_et(Δ_heeg_{rν})/[u_{c₀}(2√−D_K)^{rν−1}], u_{c₀}=|O_{c₀}×|/2. Require trivial nebentypus of the fixed-weight form f, k≡2 mod p−1, residual |G_K irreducibility, p-distinguishedness and ramification at every q|(D_K,N), with Castella’s odd-discriminant Heegner and split-p setup. The weight-two p-new exceptional prime is outside this theorem.

**Hypotheses and conventions.**

- All Castella §6.2 hypotheses; α=ν(a_p) is the ordinary root; period and cycle normalization fixed.
- The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

**Construction or proof.**

1. Specialize family reciprocity and match it with CH’s fixed-weight identity using the normalization adapter.
2. Use the classical/generalized cycle comparison and its half-unit convention.
3. Use ordinary localization injectivity to promote the local equality to the global initial class.

**Acceptance checks.**

- At a vanishing ordinary Euler factor the initial class can vanish; no exceptional-branch claim is made.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity](#generalizedheegnercycles-gh-7-two-variable-explicit-reciprocity), [GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective](#generalizedheegnercycles-gh-7-ordinary-localization-injective), [GeneralizedHeegnerCycles:GH.7/family-representation-specialization](#generalizedheegnercycles-gh-7-family-representation-specialization), [GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison](#generalizedheegnercycles-gh-1-classical-generalized-cycle-comparison), [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter).

**Sources.**

- [castella-variation](#source-castella-variation), §6.2, Theorem 6.5 and proof, p.28. The first specialization and its stronger residual hypotheses are explicit.

<a id="generalizedheegnercycles-gh-7-higher-weight-family-specialization"></a>
### Higher-weight family specialization

**Target:** `GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.higherWeightFamilySpecialization`.
**Planet:** Higher-weight specialization.

Under the same source-qualified hypotheses as the initial formula, c₀^{rν−1}ν(Z_{c₀,∞})=z_{fν,c₀,α} in the strict Greenberg Iwasawa Selmer module, α=ν(a_p). The system comparison is global: it uses the family local reciprocity, CH’s fixed-weight reciprocity, exact differential and c₀ normalization, plus localization injectivity. It includes finite conductor moments through Shapiro and the specified character twists, while keeping λ_reg exceptional primes outside the localized comparison.

**Hypotheses and conventions.**

- Castella Theorem 6.5: weight and parity congruence, trivial arithmetic character, residual |G_K irreducibility, p-distinguishedness, required bad-prime ramification, odd CM discriminant, split p, c₀ prime to Np.
- The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

**Construction or proof.**

1. Compare both local regulator images at each nonexceptional arithmetic specialization with the exact c₀^{rν−1} factor.
2. Use Lemma 6.4 localization injectivity to identify global Iwasawa classes.
3. Project to finite conductor/character moments using the same Shapiro inversion and compare the initial formula.

**Acceptance checks.**

- The initial cycle equality and the full system equality are different conclusions; both retain their normalization factors.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.7/initial-family-specialization](#generalizedheegnercycles-gh-7-initial-family-specialization), [GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective](#generalizedheegnercycles-gh-7-ordinary-localization-injective), [GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity](#generalizedheegnercycles-gh-7-two-variable-explicit-reciprocity), [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), `SelmerIwasawaCohomology:L3/iwasawa-shapiro`.

**Sources.**

- [castella-variation](#source-castella-variation), §6.2, Theorem 6.5 and (6.7), p.28. Gives the full higher-weight Iwasawa class comparison, with c₀^{rν−1}.

<a id="generalizedheegnercycles-gh-7-ordinary-regulator-quotient-application"></a>
### Ordinary-line application of regulator quotient descent

**Target:** `GeneralizedHeegnerCycles:GH.7/ordinary-regulator-quotient-application` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.ordinaryRegulatorQuotientApplication`.

For the actual critically twisted ordinary line F+Tdagger tensor xi^−1, verify the hypotheses of the requested local Part II and construct the anticyclotomic quotient regulator in the source completion. If q_M and q_N are the actual source/target quotient maps and Ltilde is the two-variable regulator, prove Ltilde^−1(ker q_N)=ker q_M before claiming injectivity of the descended map. Verify H0 of the tower ordinary line vanishes in the source’s range, hence the required H2 correction, and prove the canonical omega_family pairing is nonzero on its rank-one period line after scalar extension. Retain J, lambda localization and the pseudo-null error.

**Hypotheses and conventions.**

- This is the GH application of proposed PHR2.1–PHR2.5, not a second construction of local Iwasawa theory. LZ14 injectivity before quotient and a generic mapQ lemma alone do not provide the arithmetic preimage equality.
- The rank-one line has the exact unramified character Psi after all twists. Verify nonnegative Hodge–Tate, no trivial quotient and no tower invariants before using CH5.1; the p-old condition is required for Castella Corollary 3.9.

**Construction or proof.**

1. Identify the actual coefficient and distribution quotient submodules and their pushforwards from the supplied local regulator. Use the Galois-cohomology specialization sequence to compute the H2 error.
2. Prove the preimage equality, then apply the existing Mathlib quotient kernel formula. Pair only after proving a nonzero functional on a specified one-dimensional period line; a scalar projection on a rank-two space is insufficient.
3. Check interpolation at nonexceptional arithmetic points and the domain of each coefficient map. If nu(lambda)=0, construct and prove a regular model/cleared-denominator moment as a separate obligation; never evaluate lambda^−1 there.

**Acceptance checks.**

- Multiplication by X is injective on Q[X] but induces zero on Q[X]/(X); this rejects passing injectivity through a quotient. A nonzero functional on an identified line is injective, whereas a projection Q^2→Q is not.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist), [GeneralizedHeegnerCycles:GH.7/family-representation-specialization](#generalizedheegnercycles-gh-7-family-representation-specialization), [GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint](#generalizedheegnercycles-gh-7-two-variable-regulator-checkpoint), `PadicHodgeRegulators:L3`, `mathlib:Submodule.mapQ`, `mathlib:Submodule.ker_mapQ`, `mathlib:LinearMap.ker_eq_bot`.

**Sources.**

- [castella-family-author-gh8](#source-castella-family-author-gh8), §5.1, Lemma 5.1 and Proposition 5.2, pp.21–22. Local line pairing and one-variable descent.
- [ch-author-2022-gh8](#source-ch-author-2022-gh8), §5.1, Theorem 5.1 quotient proof, pp.21–22. Relative Lubin–Tate comparison and quotient correction.
- [lz14-v3-gh8](#source-lz14-v3-gh8), Proposition 4.11 and proof, p.18. Injectivity requires the infinite unramified direction; quotient injectivity needs the additional preimage calculation.

<a id="generalizedheegnercycles-gh-7-weight-two-p-old-localization"></a>
### Localization injectivity at weight-two p-old points

**Target:** `GeneralizedHeegnerCycles:GH.7/weight-two-p-old-localization` · theorem.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.weightTwoPOldLocalization`.

In the common all-split CH/ordinary-family range, extend the localization comparison used in Castella Remark 6.6 to a weight-two p-old specialization: on each retained finite ring-class component, the strict Greenberg global Iwasawa Selmer module maps injectively to the ordinary local H1_Iw module. Together with source-period-and-twist-transport and ordinary-regulator-quotient-application this permits equality of local reciprocity images to identify the global p-old cycle/point class.

**Hypotheses and conventions.**

- Residual restriction to G_K irreducible, p-distinguished ordinary representation, the actual torsion-free Greenberg module/control statements, infinitely many nonzero specialized local classes and their rank-one Selmer bounds. Retain E(K)[p]=0 when importing the HE.8 integral point system.
- The form is p-old of level prime to p. No conclusion for the multiplicative p-new weight-two point or an exceptional lambda-zero specialization is asserted.

**Construction or proof.**

1. Repeat the argument of Castella Lemma 6.4 on each finite ring-class component using the weight-two CH nonvanishing and rank-one specialization theorem with their own hypotheses.
2. Use torsion freeness/control to deduce the global kernel vanishes from the characterwise vanishing; retain bad-prime local errors.
3. Apply the already constructed regulator and period diagrams. The additional infinite-unramified quotient check is independent of this global localization argument.

**Acceptance checks.**

- A p-new multiplicative elliptic specialization fails the p-old input. Equality of two local images without the injectivity theorem cannot imply equality of global classes.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective](#generalizedheegnercycles-gh-7-ordinary-localization-injective), [GeneralizedHeegnerCycles:GH.7/ordinary-regulator-quotient-application](#generalizedheegnercycles-gh-7-ordinary-regulator-quotient-application), [GeneralizedHeegnerCycles:GH.4/source-period-and-twist-transport](#generalizedheegnercycles-gh-4-source-period-and-twist-transport), [GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing](#generalizedheegnercycles-gh-6-anticyclotomic-nonvanishing), [GeneralizedHeegnerCycles:GH.6/selmer-rank-one](#generalizedheegnercycles-gh-6-selmer-rank-one).

**Sources.**

- [castella-family-author-gh8](#source-castella-family-author-gh8), §6.2, Lemma 6.4 and proof, p.27; Remark 6.6, pp.28–29. The proof route for the weight-two p-old extension; all hypotheses must be transported.

<a id="gh-8"></a>
## GH.8. Weight-two and main-conjecture consumer comparisons

Identify the actual Picard, quotient and Kummer classes; compare normalized tails and bottoms; export exact source-qualified scalar identities to consumers.

<a id="generalizedheegnercycles-gh-8-weight-zero-cycle"></a>
### The weight-two cycle is the corrected CM divisor

**Target:** `GeneralizedHeegnerCycles:GH.8/weight-zero-cycle` · comparison.

Let C be the modular curve used by the BDP construction, L a characteristic-zero field over which the CM point x_phi and a degree-one cusp b are rational, and identify X_0 with C by the empty-fiber-power identification. The homologically trivial weight-two cycle is [x_phi]-[b] in CH^1(C_L)_Q. After applying the chosen cuspidal Hecke correspondence e_f it is e_f([x_phi]-[b]). The raw point [x_phi] has degree one and is not the input to the degree-zero Abel--Jacobi map.

**Hypotheses and conventions.**

- BDP's fiber-power index is k-2, whereas CH writes the weight as 2r; weight two means respectively index 0 and r=1.
- Use the actual level structure and its field of definition. A ring class field alone is not asserted to define every chosen level point or cusp.
- The empty fiber-power identification and e_f are supplied by GH.0--GH.1, not new abstract carriers.

**Construction or proof.**

1. Compute the zeroth graph product in the fiber above x_phi and carry it through X_0=C.
2. Subtract the chosen cusp and compute its degree as 1-1. On a smooth proper curve this degree-zero class has zero geometric degree-two cycle class.
3. Apply the already constructed correspondence; do not apply the positive-fiber-power vanishing argument at index zero.

**Acceptance checks.**

- x_phi=b gives zero, whereas retaining [x_phi] gives degree one.
- Changing b to b_prime changes the class by [b]-[b_prime], not a literal integral independence assertion.
- Test k=2 against both source indices and retain the field extension needed for the level structure.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector), [GeneralizedHeegnerCycles:GH.0/newform-cm-projector](#generalizedheegnercycles-gh-0-newform-cm-projector), [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model), [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport), [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation), `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

**Sources.**

- [bdp-published-2013-gh8](#source-bdp-published-2013-gh8), Section 2.3, Proposition 2.7 and preceding paragraph, printed p. 1063. The preceding paragraph supplies the index-zero cusp correction; the proposition gives homological triviality.

<a id="generalizedheegnercycles-gh-8-modular-quotient-kummer"></a>
### Abel--Jacobi and Kummer classes under the modular quotient

**Target:** `GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer` · theorem.
**Planet:** Weight-two Abel--Jacobi comparison.

For the preceding C, x_phi, b and L, let J=Pic^0(C), let pi:C->E be the chosen modular parametrization defined over L, and let q_pi:J->E satisfy q_pi([x]-[b])=pi(x)-pi(b). Let theta_C:V_p J -> H^1_et(C_bar,Q_p(1)) be the Picard--Kummer identification. With the corresponding f-projector on J satisfying q_pi e_f=q_pi, set gamma_pi=V_p(q_pi) composed with theta_C^{-1}. Then H^1(L,gamma_pi)(AJ_et(e_f([x_phi]-[b]))) equals kappa_E(pi(x_phi)-pi(b)) in H^1_cont(L,V_p E). Both sides may be extended to the same finite coefficient field. This is a rational-coefficient statement; it does not identify two chosen integral lattices.

**Hypotheses and conventions.**

- C is smooth, proper and geometrically connected, L has characteristic zero, and p is prime.
- Use the GH.1 Hochschild--Serre/Gysin convention, with connecting cocycle sigma(Q)-Q.
- The Picard--Kummer comparison and correspondence action must agree with that convention; see the GH.1 request.
- The actual quotient supplies q_pi and q_pi e_f=q_pi; equality of dimensions or eigenvalues does not.

**Construction or proof.**

1. Use the finite-level Picard--Kummer/Gysin comparison to identify the degree-one Abel--Jacobi class with the Kummer class of its divisor class in J. The sign comparison is explicitly requested from GH.1.
2. For a p^n-division point Q, applying q_pi takes sigma(Q)-Q to the connecting cocycle of q_pi([D]); changes of Q give corresponding coboundaries.
3. Use compatible division points and the continuous-cochain/adic realization comparison, not an unproved interchange of H^1 and inverse limits.
4. Apply q_pi e_f=q_pi and the preceding divisor description, retaining the basepoint translation.

**Acceptance checks.**

- For C=E, origin b and identity pi, recover the rational Kummer class.
- Replacing b by b_prime adds kappa_E(pi(b)-pi(b_prime)).
- Torsion basepoint differences vanish rationally; p-primary torsion cannot be discarded integrally.
- An isogeny of rational representations need not identify the integral Tate lattices.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/weight-zero-cycle](#generalizedheegnercycles-gh-8-weight-zero-cycle), [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport), [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation), `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`.

**Sources.**

- [bdp-published-2013-gh8](#source-bdp-published-2013-gh8), Section 3.1, Definition 3.1 and Remark 3.2, printed pp. 1065--1066. Supplies the extension realization; the finite Picard comparison is a separate requested proof.
- [castella-family-author-gh8](#source-castella-family-author-gh8), Remark 6.6, p. 29. The actual quotient map and basepoint identify the weight-two objects used by the remark.

<a id="generalizedheegnercycles-gh-8-character-sum-comparison"></a>
### Character-weighted comparison without averaging

**Target:** `GeneralizedHeegnerCycles:GH.8/character-sum-comparison` · lemma.

Let F/L be a finite abelian extension defining a compatible family of the preceding cycles and points, let G=Gal(F/L), and let chi:G->B^x be a character in a common coefficient field B. For the G-equivariant scalar extension gamma_* of the preceding comparison, gamma_*(sum_g chi(g) g.z)=sum_g chi(g) g.kappa_E(P). With this left-action convention each weighted sum lies in the chi^{-1}-eigenspace. No factor 1/|G| is introduced. A descent to H^1(L,V tensor chi), if used, is a further cohomological map with its own hypotheses.

**Hypotheses and conventions.**

- The coefficient representations extend to G_L, giving the quotient action on H^1(F,-).
- The parametrization, correspondence and comparison descend to L.
- chi is finite order with values in B; it is not an unspecified Hecke character or averaging idempotent.

**Construction or proof.**

1. Apply the quotient comparison to every conjugate.
2. Commute the equivariant linear map with the finite weighted sum.
3. For h in G substitute t=hg; chi(h^{-1}t)=chi(h)^{-1}chi(t).
4. An averaging projector needs |G| invertible; inflation--restriction descent is a separate argument.
5. Identify the finite group action on continuous cohomology from GH.3; apply the coefficient-map naturality of GH.1. The weighted finite sum has the inverse-character eigenspace convention. Restriction and twisted descent must realize that convention rather than assuming invariants under the untwisted action.

**Acceptance checks.**

- The trivial character gives the trace, not the average.
- For a cyclic group of order three, check the inverse-character eigenvalue.
- When p divides |G|, the unnormalized sum is integral but division by |G| is not.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer](#generalizedheegnercycles-gh-8-modular-quotient-kummer), `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `mathlib:LinearMap`, [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport), [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), [GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent](#generalizedheegnercycles-gh-3-finite-character-moment-descent).

**Sources.**

- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Section 5.2, character specialization after equation (5.1) and Lemma 5.4, p.23. Direct reindexing fixes the convention without the problematic Section 4.4 identification.

<a id="generalizedheegnercycles-gh-8-positive-conductor-stabilization"></a>
### Comparison of positive-conductor stabilized classes

**Target:** `GeneralizedHeegnerCycles:GH.8/positive-conductor-stabilization` · comparison.

Let p be good ordinary for a weight-two form f of trivial character, and let alpha be the unit root of X^2-a_p X+p. Put K_n=K_{c_0 p^n} with (c_0,p)=1. For n>=1 let z_n be the rational corrected cycle class and k_n=kappa_E(P_n) its image under compatible maps gamma_n. Then gamma_n(z_n-alpha^{-1} res(z_{n-1}))=k_n-alpha^{-1} res(k_{n-1}). This compares only the p-divisible-conductor branch. The alpha^{-n} normalization belongs to the tower, not to the unnormalized stabilized finite-level class.

**Hypotheses and conventions.**

- CM points, basepoints and coefficient identifications are compatible with the field inclusions.
- p splits, the imaginary quadratic discriminant is less than -3, all level primes split, and p does not divide 2N phi(N), in the weight-two CH range.
- Use the same coefficient extension containing alpha and the actual continuous-cohomology restriction.
- When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

**Construction or proof.**

1. At r=1, p^{2r-2}/alpha becomes alpha^{-1}.
2. Apply the quotient comparison at n and n-1.
3. Use restriction naturality and linearity; no initial-conductor formula is needed.

**Acceptance checks.**

- The coefficient is alpha^{-1}, not p/alpha.
- At n=1 the lower class is raw conductor-c_0, not an unverified stabilized bottom.
- A nonordinary alpha is rejected for integral normalization although the rational linear identity can be written.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer](#generalizedheegnercycles-gh-8-modular-quotient-kummer), `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `mathlib:LinearMap`, `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`.

**Sources.**

- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Section 5.2, Definition 5.2 and equation (5.1), pp. 22--23. Separates positive-conductor stabilization from tower normalization.

<a id="generalizedheegnercycles-gh-8-positive-tail-corestriction"></a>
### Corestriction of the normalized positive-conductor tail

**Target:** `GeneralizedHeegnerCycles:GH.8/positive-tail-corestriction` · lemma.

In the preceding ordinary split setting, assume the actual geometric trace relation cor(k_n)=a_p k_{n-1}-res(k_{n-2}) and [K_n:K_{n-1}]=p for n>=2. Define y_n=alpha^{-n}(k_n-alpha^{-1} res(k_{n-1})) for n>=1. Then cor(y_n)=y_{n-1} for every n>=2. The uniquely determined bottom term is y_0=cor(y_1). Its Euler-factor expression is specified by initial-corestriction-comparison once the distinct first trace and degree have been supplied.

**Hypotheses and conventions.**

- The lower restriction in the trace equation lands in K_{n-1}.
- The raw trace and degree are geometric results, not postulated normalized Euler-system relations.
- Corestriction after restriction is the degree; the lattice contains the raw classes and alpha is a unit for integral boundedness.
- When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

**Construction or proof.**

1. Corestriction of k_n-alpha^{-1}res(k_{n-1}) is (a_p-p/alpha)k_{n-1}-res(k_{n-2}).
2. The Hecke polynomial gives a_p-p/alpha=alpha.
3. Multiply by alpha^{-n}.
4. The single equation at n=1 determines the bottom. The first-conductor comparison is distinct; GH.3 supplies the actual Iwasawa realization.
5. If two actual positive tails are identified by comparison maps commuting with the first corestriction, their norm-compatible bottoms agree by that commutative square. This determines the bottom from the tail, but does not identify the printed conductor-zero formula without the actual initial trace and normalization map.
6. Compare with HE.8 ordinary-stabilized-point, stabilized-corestriction and anticyclotomic-heegner-class at the actual ring-class levels before taking its anticyclotomic quotient; use the supplier’s layer shift if the p-part of the class group changes the indexing.

**Acceptance checks.**

- Check n=2 without a degree-p claim for K_1/K_0.
- Using 1/alpha in place of p/alpha fails the Hecke-polynomial calculation.
- The bottom is determined before expressing it using the two Frobenius operators.
- The abstract positive-tail calculation does not prove E(K)[p]=0. Verify this separately whenever importing the present HE.8 arithmetic realization.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/positive-conductor-stabilization](#generalizedheegnercycles-gh-8-positive-conductor-stabilization), `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), [GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent](#generalizedheegnercycles-gh-3-finite-character-moment-descent), `mathlib:LinearMap`, `HeegnerPointEulerSystems:HE.8/stabilized-corestriction`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`.

**Sources.**

- [ch-published-2018-gh8](#source-ch-published-2018-gh8), Proposition 4.4, printed pp. 591--593; Lemma 5.3, printed pp. 601--602. The split recurrence is explicitly in the positive range; it is not a computation of the initial split case.

<a id="generalizedheegnercycles-gh-8-differential-evaluation"></a>
### The modular differential factor in the logarithm comparison

**Target:** `GeneralizedHeegnerCycles:GH.8/differential-evaluation` · theorem.
**Planet:** Modular differential comparison.

Base change the quotient comparison to a finite unramified extension L_v/Q_p with the good-reduction models used in BDP Section 3. If pi^*omega_E=c_pi omega_f for the chosen invariant and modular differentials, then log_{E,omega_E}(pi(x_phi)-pi(b))=c_pi AJ_dR(e_f([x_phi]-[b]))(omega_f), transporting the realization and f-projection through the same quotient. Replacing the Abel--Jacobi evaluation by the elliptic logarithm in a squared identity introduces c_pi^{-2}, not c_pi^{-1}. No claim that c_pi=1 or is a p-adic unit is made.

**Hypotheses and conventions.**

- Use the GH.1 and PadicHodgeRegulators L1 local realization; do not extend the inspected unramified-base theorem without proof.
- c_pi is the actual nonzero pullback scalar.
- The f-projector fixes the differential and is compatible with the quotient and pairing.
- The elliptic logarithm includes its compatible extension from the formal group to the rational Kummer image.
- To use this comparison at a ramified conductor completion E, first obtain the finite-base-change restriction and corestriction/trace squares requested from GH.1 and PadicHodgeRegulators L1. This node retains the inspected unramified-base statement; it does not silently enlarge it.

**Construction or proof.**

1. Localize the quotient/Kummer comparison.
2. Apply naturality of the Bloch--Kato logarithm and its formal-group comparison.
3. Use adjunction of the de Rham quotient and differential pullback.
4. Evaluate c_pi omega_f and square the resulting equality; cancellation uses c_pi nonzero.

**Acceptance checks.**

- Scaling omega_E by u scales the equality by u and its square by u^2.
- For c_pi=3 use 1/9, not 1/3, in the squared substitution.
- A p-divisible scalar need not preserve an integral principal ideal.
- The zero CM-power exponent at weight two does not cancel c_pi.
- A conductor c_0 p^n completion is not treated as unramified merely because the regulator coefficient extension is completed unramified. The local field and coefficient field are separate data.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer](#generalizedheegnercycles-gh-8-modular-quotient-kummer), [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport), [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation), `PadicHodgeRegulators:L1`, `mathlib:Module.Dual`, `mathlib:LinearMap.dualMap_apply`, `mathlib:LinearMap.dualMap_comp_dualMap`.

**Sources.**

- [bdp-published-2013-gh8](#source-bdp-published-2013-gh8), Sections 3.2--3.4, printed pp. 1066--1070. The quotient-adjunction and scalar calculation specify the comparison with the local realization.

<a id="generalizedheegnercycles-gh-8-ordinary-p-old-family"></a>
### Weight-two p-old specialization of the ordinary family

**Target:** `GeneralizedHeegnerCycles:GH.8/ordinary-p-old-family` · theorem.
**Planet:** Weight-two ordinary-family comparison.

Use the integral Hida branch I, critically twisted representation T-dagger, and Howard class Z_{c_0,infinity} constructed in GH.7 with Castella's author-copy normalization. Let its reference form have even weight k>2 with k congruent to 2 modulo p-1, and let nu be an arithmetic specialization of weight two and trivial character with 2 congruent to k modulo 2(p-1). Suppose its form is the ordinary p-stabilization of a newform of level prime to p. With alpha=nu(a_p), the source-normalized comparison is nu(Z_{c_0,infinity})=z_{f_nu,c_0,alpha} in the identified Greenberg Iwasawa cohomology of T_{f_nu}(1). The coefficient-specialization and critical-twist identification are part of the map. This target does not identify every later version of the CH classes without a normalization map.

**Hypotheses and conventions.**

- p does not divide 6N; c_0 is prime to pN; the imaginary quadratic discriminant is odd and less than -3; p splits.
- For comparison with CH impose the all-split classical Heegner hypothesis; this is a restricted common range, not all ramified-level cases in Castella.
- The residual representation is p-distinguished and remains irreducible over G_K. Retain the source ramification condition at primes dividing (D_K,N), vacuous in this common range.
- Use the source lattices, ordinary filtration and specialization, not arbitrary rationally isomorphic representations.
- Exclude p-new/multiplicative and nonordinary weight-two specializations.

**Construction or proof.**

1. Use the actual weight-two quotient/Kummer comparison to identify both inputs of Castella equation (6.6). GH.7 supplies moments, critical twists and the coefficient/regulator specialization maps of (6.8)--(6.9).
2. For global localization injectivity, follow Castella Lemma 6.4 through GH.7: torsion-freeness of the integral Greenberg module, specialization/control of the localization kernel, nonvanishing at infinitely many characters on every finite ring-class component, and the rank-one Selmer conclusion. Irreducibility alone is not that proof.
3. For local injectivity, GH.7 must transport the two-variable regulator of Loeffler--Zerbes Proposition 4.11, whose hypothesis is an infinite unramified direction, through CH Theorem 5.1's quotient construction. Identify the coefficient algebra and the source/target submodules P,Q before taking quotients. For its linear map f, the pinned Submodule.ker_mapQ gives the descended kernel as the image of f^{-1}(Q) in M/P. The sufficient equality f^{-1}(Q)=P is an additional arithmetic/analytic obligation; injectivity before quotienting does not imply it.
4. After the vector regulator descends injectively, evaluate on the specified nonzero dual vector of the one-dimensional ordinary crystalline line. CH (2022) Section 5.3 supplies the nonzero projection and the period relation (5.3); GH.7 must realize that pairing and coefficient extension. Evaluation on the full two-dimensional crystalline space is not injective in general.
5. Transport the source-version pairing and group-like factors before comparing (6.8)--(6.9). Apply local injectivity, then global localization injectivity. At weight two c_0^{r_nu-1}=1. Neither the quotient-kernel calculation nor the fixed-denominator lemmas supplies the missing period, realization or lattice maps.

**Acceptance checks.**

- Admit ordinary p-stabilizations of prime-to-p newforms, not p-new forms.
- Check both weight congruences, not just evenness.
- Keep the finite ring-class component; this is not automatically the class traced to K.
- Do not infer global-class equality from scalar regulator values without both injectivity statements.
- Injectivity must survive the actual quotient: multiplication by X on Q[X] is injective but induces the zero map on Q[X]/(X), a nonzero quotient. This is a regression against an invalid general inference, not a counterexample to the arithmetic source theorem.
- Nonzero evaluation on a one-dimensional line is injective. Projection from Q^2 to its first coordinate is not: (0,1) is lost. Keep the ordinary line, its dual vector and the nonzero pairing factor.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer](#generalizedheegnercycles-gh-8-modular-quotient-kummer), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), [GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent](#generalizedheegnercycles-gh-3-finite-character-moment-descent), [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), [GeneralizedHeegnerCycles:GH.4/source-period-and-twist-transport](#generalizedheegnercycles-gh-4-source-period-and-twist-transport), [GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization](#generalizedheegnercycles-gh-7-higher-weight-family-specialization), [GeneralizedHeegnerCycles:GH.7/ordinary-regulator-quotient-application](#generalizedheegnercycles-gh-7-ordinary-regulator-quotient-application), [GeneralizedHeegnerCycles:GH.7/weight-two-p-old-localization](#generalizedheegnercycles-gh-7-weight-two-p-old-localization), `mathlib:Submodule.mapQ`, `mathlib:Submodule.ker_mapQ`, `mathlib:Submodule.mkQ_map_self`, `mathlib:LinearMap.ker_eq_bot`.

**Sources.**

- [castella-family-author-gh8](#source-castella-family-author-gh8), Theorem 6.5, equations (6.8)--(6.9), p. 28; Remark 6.6, p. 29. The theorem is higher-weight; the remark gives the stated p-old weight-two extension.
- [lz14-v3-gh8](#source-lz14-v3-gh8), Proposition 4.11 and proof, p. 18; context Theorem 4.7, pp. 16--17. The two-variable injectivity input includes the infinite-unramified-direction hypothesis; quotient descent still requires its own kernel calculation.
- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Theorem 5.1 and proof, pp. 21--22; Section 5.3, (5.3) and Lemma 5.5, p. 24. Locates the quotient step and the subsequent nonzero ordinary-line pairing; neither is replaced by a generic claim that injective maps stay injective after quotienting.
- [mathlib-quotient-082e2d3-gh8](#source-mathlib-quotient-082e2d3-gh8), Quotient/Basic.lean lines 228--229, together with 158--159 and Submodule/Ker.lean 199--200. Provides the existing algebraic kernel calculation used to specify the unresolved arithmetic descent condition.

<a id="generalizedheegnercycles-gh-8-initial-corestriction-comparison"></a>
### The initial Euler factor from the raw trace and degree

**Target:** `GeneralizedHeegnerCycles:GH.8/initial-corestriction-comparison` · lemma.

Let F be a field, M_0 and M_1 F-vector spaces, res:M_0->M_1 and cor:M_1->M_0 linear, and sigma,tau endomorphisms of M_0. Let alpha,u be nonzero scalars, and a,p,d scalars satisfying alpha^2-a alpha+p=0 and u d=p-1. If u cor(x_1)=a x_0-sigma(x_0)-tau(x_0), cor(res(x_0))=d x_0 and sigma(tau(x_0))=x_0, then cor(alpha^{-1}(x_1-alpha^{-1}res(x_0)))=u^{-1}(1-alpha^{-1}sigma)(1-alpha^{-1}tau)x_0.

**Hypotheses and conventions.**

- This is the algebraic comparison lemma. The symbols p,u,d are scalars, not implicit arithmetic objects.
- For application, HE.0 and HE.2 must identify u with the actual conductor-change unit index and d with the first field degree for the specified class convention.
- Only sigma(tau(x_0))=x_0 is needed; no unmentioned splitting or commutation theorem is assumed.

**Construction or proof.**

1. Read the HE.0 conductor-change-kernel and ring-class-tower-quotients together with HE.2 split-ramified-first-step-recurrence. Transport their actual point trace through HE.3 Kummer naturality, keeping any cleared Hodge/basepoint factor. The algebraic identity below applies only once u, d, sigma and tau have been identified with these maps; a published positive-conductor recurrence does not prove this initial identification.
2. Expand corestriction by linearity, and multiply by u alpha. The raw trace and u d=p-1 yield (a-(p-1)/alpha)x_0-sigma(x_0)-tau(x_0).
3. The root identity gives a-(p-1)/alpha=alpha+alpha^{-1}.
4. Expand the two Euler factors and use sigma(tau(x_0))=x_0. Cancel the nonzero scalars.
5. In the actual ring-class application the degree and raw trace must first be transported through the level maps, cusp correction and quotient. This lemma does not certify that transport.

**Acceptance checks.**

- For sigma=tau=id the factor is u^{-1}(1-alpha^{-1})^2.
- Exact rational test: p=5, alpha=2, a=9/2, u=1, d=4, x_0=1, cor=id, res=4 and x_1=5/2 give normalized bottom 1/4. These are algebraic test data, not asserted modular-form coefficients.
- Using the full unit count 2 instead of the index 1 in that test predicts 1/8 and fails.
- No degree-p assertion is made for the initial step.

**Direct prerequisites:** `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `mathlib:LinearMap`.

**Sources.**

- [ch-published-2018-gh8](#source-ch-published-2018-gh8), Section 5.2, Definition 5.2 and Lemma 5.3, printed pp. 601--602. New explicit algebraic comparison of the two branches; the paper is not claimed to supply the missing initial raw trace proof.
- [castella-family-author-gh8](#source-castella-family-author-gh8), Equation (6.7), author-copy p. 28. The half-unit normalization is a comparison target, not a substitute for identifying the raw geometric classes.

<a id="generalizedheegnercycles-gh-8-initial-only-rescaling-obstruction"></a>
### Rescaling only the bottom breaks a nonzero norm relation

**Target:** `GeneralizedHeegnerCycles:GH.8/initial-only-rescaling-obstruction` · application.

For a linear map cor:M_1->M_0 of vector spaces over a field F, suppose cor(y_1)=y_0 and y_0 is nonzero. For every scalar t different from one, cor(y_1) is not t y_0. Thus changing only the initial factor cannot be justified as a uniform change of normalization. Multiplying every level by t does preserve all norm relations.

**Hypotheses and conventions.**

- The nonzero bottom hypothesis is essential; this test cannot prove nonvanishing of an arithmetic Heegner class.

**Construction or proof.**

1. An equality cor(y_1)=t y_0 would imply (1-t)y_0=0. Cancel 1-t in the field.
2. For a uniform rescaling, linearity gives cor(t y_1)=t cor(y_1); the same calculation works at every step.

**Acceptance checks.**

- In the rational model of initial-corestriction-comparison, the bottom 1/4 differs from 1/8.
- For bottom zero, every initial scalar has the same value; do not report a contradiction without nonvanishing.
- Scaling the whole system by 1/2 is allowed over Q and is distinct from scaling only y_0.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/initial-corestriction-comparison](#generalizedheegnercycles-gh-8-initial-corestriction-comparison), `mathlib:LinearMap`.

**Sources.**

- [ch-published-2018-gh8](#source-ch-published-2018-gh8), Definition 5.2 and Lemma 5.3, printed p. 601. New negative test for a proposed normalization change. It does not assert a second independently established source error.

<a id="generalizedheegnercycles-gh-8-uniform-coherent-kernel-bound"></a>
### A common reverse comparison bounds the tower kernel

**Target:** `GeneralizedHeegnerCycles:GH.8/uniform-coherent-kernel-bound` · lemma.

Let R be a commutative ring, M_n,N_n R-modules, f_n:M_n->N_n and g_n:N_n->M_n linear, and d one fixed scalar. If g_n f_n=d id for every n, then every sequence x_n with f_n(x_n)=0 satisfies d x_n=0 for every n. In particular, this holds for every compatible sequence and bounds the kernel of the induced comparison of integral towers.

**Hypotheses and conventions.**

- For the cycle/point application, M_n is the chosen coefficient summand on which the modular quotient is a rational isomorphism, not the entire Jacobian cohomology.
- A reverse comparison on that summand and a single d for all levels are actual supplier obligations; level-dependent rational inverses do not suffice.

**Construction or proof.**

1. Apply g_n to f_n(x_n)=0. Its left side is d x_n and its right side is zero.
2. Interpret this componentwise conclusion in the existing compatible-sequence realization. No interchange of inverse limits and cohomology is used.

**Acceptance checks.**

- The statement permits torsion: d x=0 need not imply x=0 unless multiplication by d is injective.
- When d is a unit the bound gives injectivity.
- A bound d_n depending on n is not the asserted uniform conclusion.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport), [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), [GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent](#generalizedheegnercycles-gh-3-finite-character-moment-descent), `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `mathlib:LinearMap`.

**Sources.**

- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Section 5.2, equation (5.1) and the preceding integral inverse-limit construction, p.23. Elementary comparison check required for transporting the integral cycle tower; neither a new Iwasawa carrier nor a claimed source theorem.

<a id="generalizedheegnercycles-gh-8-uniform-coherent-lift"></a>
### A common reverse comparison lifts a fixed multiple

**Target:** `GeneralizedHeegnerCycles:GH.8/uniform-coherent-lift` · lemma.

Let M_n,N_n be R-module inverse systems with transitions mu_n and nu_n. Suppose linear f_n:M_n->N_n and g_n:N_n->M_n satisfy f_n g_n=d id for one scalar d independent of n, and mu_n g_{n+1}=g_n nu_n. Every compatible sequence y_n in N has the compatible sequence x_n=g_n(y_n) in M, with f_n(x_n)=d y_n at every level. Thus, when f is also transition-compatible, the cokernel of its tower map is annihilated by d.

**Hypotheses and conventions.**

- The conclusion uses a compatible family of reverse maps; pointwise existence of preimages of d y_n is weaker and is not substituted.
- R is a commutative ring. Neither d invertible nor module freeness is needed for the multiple-lifting statement.
- The arithmetic application must construct the same fixed coefficient comparison at each field level, restricted to the correct f-summand.

**Construction or proof.**

1. Set x_n=g_n(y_n) without making independent lifting choices.
2. Naturality of g and compatibility of y give mu_n(x_{n+1})=g_n(nu_n(y_{n+1}))=x_n.
3. The other composite identity gives f_n(x_n)=d y_n.
4. Together with the kernel bound, localization at powers of a nonzero d gives the rationalized comparison when the coefficient ring is a domain. An integral isomorphism needs stronger input, for example d a unit.

**Acceptance checks.**

- For constant Z towers with f=2, g=id and d=2, twice every target element lifts but 1 does not.
- No right-exactness of inverse limits is invoked.
- For d a unit the explicit inverse is d^{-1}g; for nonunit d only the bounded kernel/cokernel conclusion is asserted.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/uniform-coherent-kernel-bound](#generalizedheegnercycles-gh-8-uniform-coherent-kernel-bound), [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport), [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), [GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent](#generalizedheegnercycles-gh-3-finite-character-moment-descent), `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `mathlib:LinearMap`.

**Sources.**

- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Section 5.2, equation (5.1) and its integral inverse-limit carrier, p.23. New explicit comparison proof for fixed denominator data; the actual geometric data remain requested.

<a id="generalizedheegnercycles-gh-8-unbounded-denominators-counterexample"></a>
### Rational level isomorphisms need not compare integral limits

**Target:** `GeneralizedHeegnerCycles:GH.8/unbounded-denominators-counterexample` · application.

Take M_n=Z with transition multiplication by 2, N_n=Z with identity transitions, and f_n multiplication by 2^n. The f_n are compatible and become isomorphisms over Q at every level. Nevertheless the integral compatible sequences in M are only zero, whereas those in N are all constant integer sequences. Consequently (lim M_n) tensor Q -> (lim N_n) tensor Q is 0 -> Q and is not an isomorphism. This does not deny that the limit of the rationalized M_n has compatible sequences with increasing denominators.

**Construction or proof.**

1. Compatibility is 2^n(2x)=2^{n+1}x; the inverse over Q is multiplication by 2^{-n}.
2. For a compatible integral sequence x and fixed n, iteration gives x_n=2^k x_{n+k} for every k. If x_n is nonzero, the pinned integer divisibility bound forces 2^k<=|x_n|.
3. By induction 2^k>=k+1; choose k>|x_n| to contradict that bound. Thus every x_n is zero.
4. The constant sequence 1 survives in the target and has no integral compatible preimage. After tensoring the integral limits with Q the source stays zero.
5. In the rationalized source levels the sequence x_n=2^{-n} is compatible and maps to the constant sequence 1. Its denominators are unbounded, identifying precisely the illegitimate interchange.

**Acceptance checks.**

- Check the naturality identity at n=0 as well as positive n.
- Finite truncations admit nonzero integral solutions, so testing finitely many levels is not a proof about the infinite limit.
- The rational sequence 2^{-n} must be admitted in lim(M_n tensor Q) and excluded from every single bounded-denominator multiple of lim M_n.
- This is a regression example for a method, not a counterexample to the arithmetic theorems of CH.

**Direct prerequisites:** `mathlib:LinearMap`, `mathlib:Int.natAbs_le_of_dvd_ne_zero`.

**Sources.**

- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Section 5.2, equation (5.1), order of integral inverse limit and coefficient extension, p.23. New explicit counterexample to replacing that order by levelwise rationalization without uniform control; not an example attributed to the source.

<a id="generalizedheegnercycles-gh-8-primitive-character-stabilization"></a>
### Exact-conductor character comparison of stabilized classes

**Target:** `GeneralizedHeegnerCycles:GH.8/primitive-character-stabilization` · comparison.

Let G be a finite abelian group, H a subgroup, R a commutative integral domain, M and N R-modules, chi:G->R^x a character with chi restricted to H nontrivial, and q:M->N R-linear. For functions a,b:G->M with b(g h)=b(g) for all h in H, every beta,c in R satisfy q(c sum_g chi(g)(a(g)-beta b(g)))=c sum_g chi(g)q(a(g)). No division by |H| or |G| and no torsion-freeness of M or N is required. For the weight-two application take G=Gal(K_n/K_0), H=Gal(K_n/K_{n-1}), n>=1, b(g)=g res(z_{n-1}), beta=alpha^{-1}, c=alpha^{-n}, with alpha a unit. This proves the finite weighted cycle/point comparison; identifying it with the actual twisted cohomological specialization is a further GH.3 map.

**Hypotheses and conventions.**

- R contains the character values; alpha and its inverse lie in R for the integral arithmetic application. Over the coefficient field the same formula holds for any nonzero alpha.
- The exact conductor condition must be translated to chi|H nontrivial for the actual ring-class quotient. A character nontrivial on G but inflated from G/H is excluded.
- HE.3 supplies the quotient Galois action and H-invariance of the restriction image. The existing modular-quotient-kummer comparison supplies q, with equivariance when a(g)=g z_n.
- This is a comparison on actual modules and finite sums, not a new character carrier, an averaging projector, an inverse-limit interchange or an assumed cohomological descent theorem.

**Construction or proof.**

1. View chi|H as the existing MulChar on the finite commutative group H (the nonunit condition is vacuous), and check it is not the trivial character. Apply the pinned MulChar.sum_eq_zero_of_ne_one to obtain the scalar equality sum_h chi(h)=0 in R.
2. Partition G into left cosets tH and choose representatives only for this finite proof. By b(t h)=b(t) and multiplicativity, the sum over tH of chi(t h)b(t h) equals chi(t)(sum_h chi(h))b(t), hence zero. Reindexing is the existing finite-sum API; the result is independent of the temporary representatives.
3. Sum over the cosets, expand the stabilized expression, and commute q with scalar multiplication and the finite sum. Cancellation happened in the coefficient ring before acting on M, so possible torsion of M is harmless.
4. For n>=1, use positive-conductor-stabilization and the quotient comparison at each conjugate to identify q(a(g)). Retain alpha^{-n}; do not replace the unit-root coefficient alpha^{-1} by p/alpha.
5. GH.3 must construct the finite-character evaluation of the integral Iwasawa class, the coefficient twist and its descent. CH Lemma 5.4 invokes Rubin Lemma 2.4.3 for this map. The finite-sum calculation is not a substitute for it and does not settle the conductor-zero branch.

**Acceptance checks.**

- For G=C2, H=G, chi(g)=(-1)^g and b constant, the lower sum is zero over Z, including after acting on a torsion Z-module.
- For G=C4 and H={0,2}, chi(g)=(-1)^g is nontrivial on G but trivial on H. With b(g)=(-1)^g, b is H-invariant and the weighted lower sum is 4. The weakened condition must be rejected.
- For G=C9, H={0,3,6}, R=F19 and chi(g)=4^g, the restriction is nontrivial and every H-invariant b has zero weighted sum. Exact finite-field computation tests the last-kernel condition independently of characteristic zero.
- The domain hypothesis is genuine: for R=Z/8, G=C2, H=G, chi(1)=3 and constant b=1, the character is nontrivial with 3^2=1 but its weighted sum is 4, not zero. This input must be rejected.
- For the trivial character, lower-conductor terms need not vanish. Ramified finite-character checks therefore do not by themselves verify the printed initial Euler factor.
- At n=1 the lower term is the raw conductor-c_0 class. No equality with an unverified stabilized bottom is used; the same alpha^{-n} scalar occurs on both sides.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer](#generalizedheegnercycles-gh-8-modular-quotient-kummer), [GeneralizedHeegnerCycles:GH.8/character-sum-comparison](#generalizedheegnercycles-gh-8-character-sum-comparison), [GeneralizedHeegnerCycles:GH.8/positive-conductor-stabilization](#generalizedheegnercycles-gh-8-positive-conductor-stabilization), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), [GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent](#generalizedheegnercycles-gh-3-finite-character-moment-descent), `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `mathlib:LinearMap`, `mathlib:Equiv.prod_comp`, `mathlib:MulChar.sum_eq_zero_of_ne_one`.

**Sources.**

- [ch-published-2018-gh8](#source-ch-published-2018-gh8), Lemma 5.4 and its proof, printed p. 602; exact conductor cp^n and equation (5.1). The source uses exact conductor before dropping the lower term; the comparison spells out the last-kernel condition and supplies an integral coset proof. The separate specialization is not claimed constructed.
- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Section 5.2, Lemma 5.4, printed p. 23, including the citation of Rubin Lemma 2.4.3. Separates the finite weighted-sum calculation from the cohomological evaluation/descent used by the source.
- [mathlib-finite-characters-082e2d3-gh8](#source-mathlib-finite-characters-082e2d3-gh8), Basic.lean, section sum, theorem sum_eq_zero_of_ne_one; finite commutative-monoid and integral-domain context. Already-built scalar orthogonality supports the coset proof without cancellation in the possibly torsion coefficient module.

<a id="generalizedheegnercycles-gh-8-weight-two-reciprocity"></a>
### Weight-two reciprocity through the modular quotient

**Target:** `GeneralizedHeegnerCycles:GH.8/weight-two-reciprocity` · theorem.
**Planet:** Weight-two explicit reciprocity.

Let f be the weight-two ordinary prime-to-p newform attached to E, with the CH standing hypotheses, p split in K and (c_0,Np)=1. Let psi have infinity type (1,-1) and conductor c_0. Use the GH.3 class z_f, its CH 2022 psi^{-1}-twist and finite-ring-class corestriction, and the GH.1 quotient coefficient map gamma_pi into V_p E. Let S_F be the completed unramified coefficient Iwasawa algebra on the same ring-class quotient used in CH Theorem 5.7. On the corresponding ordinary crystalline line let d_gamma be the induced coefficient map, and let ell_f be the CH functional written omega_f tensor t^{-2}. Transport the elliptic differential and CM generator to a functional ell_E satisfying ell_E composed with d_gamma = c_pi ell_f, where pi*omega_E=c_pi omega_f; this equality is an arithmetic comparison target. Then, for the transported vector regulator R_E and point Iwasawa class y_E=H^1_Iw(gamma_pi)(z_f), ell_E(R_E(y_E tensor psi^{-1})) = -c_pi L_{p,psi}(f) sigma_{-1,p} in S_F. The point class is identified with the HE.8 Kummer system using the actual first-corestriction square. After any defined coefficient/group-quotient homomorphism rho, the image is -rho(c_pi) rho(L_{p,psi}(f)) rho(sigma_{-1,p}). No invertibility of c_pi in the integral ring is asserted.

**Hypotheses and conventions.**

- The common range is odd discriminant -D_K<-3, all primes of N split in K, p not dividing 2N phi(N), ordinary good reduction at p, and the actual level/cusp descent from GH.0--GH.1.
- Use rational coefficients until the uniform integral comparison is supplied. The two-sided lattice maps are on the selected multiplicity-one f-factor; periods in the completed unramified extension are not automatically integral units.
- For the psi-twisted differential, equation (5.3) introduces Omega_psi. Its generator and nonzero inverse must be transported explicitly when extracting ell_f. Changing omega_E or omega_psi changes both the functional and the formula.
- The chosen coefficient map and distribution pushforward respect restriction, corestriction, twisting and crystalline duality. GH.7 supplies this anticyclotomic regulator diagram.
- Finite-conductor local fields can be ramified over the unramified BDP base. GH.1 and PadicHodgeRegulators L1 must provide the de Rham/Bloch--Kato finite-base-change squares before differential-evaluation is used there; completed unramified coefficients do not remove this obligation.
- When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

**Construction or proof.**

1. Apply the imported GH.4 CH 2022 reciprocity node at r=1: the conductor factor is c_0^0=1 and the scalar is negative, with the group-like sigma_{-1,p} retained.
2. Identify the positive finite-level cycle and point classes with modular-quotient-kummer, positive-conductor-stabilization and primitive-character-stabilization. Use GH.3 finite-character descent and the genuine first-corestriction comparison to identify their Iwasawa classes.
3. First apply the GH.1/PadicHodgeRegulators L1 finite-base-change restriction and corestriction/trace squares at each actual local conductor field. Then use differential-evaluation and GH.1 de Rham duality to compute the pullback of the elliptic functional. Insert the GH.4 CM-period and Tate-period maps; verify ell_E d_gamma=c_pi ell_f on the actual line. Do not apply the inspected unramified BDP theorem directly to a ramified completion.
4. Use GH.7 regulator naturality to move gamma_pi through the vector regulator, then evaluate the functional and apply the imported reciprocity identity. Apply rho as a ring homomorphism; do not infer an integral characteristic-ideal identity from a rational scalar equation.

**Acceptance checks.**

- At r=1 the factorial and c_0 power become 1; the minus sign and sigma_{-1,p} remain.
- Replacing omega_E by b omega_E multiplies the elliptic functional and c_pi by b. The scalar reciprocity identity changes by the same factor, and a squared logarithm formula changes by b squared.
- At a character theta the group-like term evaluates to theta(sigma_{-1,p}). It can be 1 or -1 on the full ring-class quotient; projecting to a pro-p Z_p quotient may kill it and must be stated.
- A map rho killing c_pi produces a zero image identity. This gives no nonvanishing conclusion and no licence to cancel rho(c_pi).
- Check E(K)[p]=0 before the present HE.8 identification, or request and prove a supplier extension. The scalar transport by itself imposes no such torsion vanishing.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer](#generalizedheegnercycles-gh-8-modular-quotient-kummer), [GeneralizedHeegnerCycles:GH.8/differential-evaluation](#generalizedheegnercycles-gh-8-differential-evaluation), [GeneralizedHeegnerCycles:GH.8/positive-tail-corestriction](#generalizedheegnercycles-gh-8-positive-tail-corestriction), [GeneralizedHeegnerCycles:GH.8/initial-corestriction-comparison](#generalizedheegnercycles-gh-8-initial-corestriction-comparison), [GeneralizedHeegnerCycles:GH.8/primitive-character-stabilization](#generalizedheegnercycles-gh-8-primitive-character-stabilization), [GeneralizedHeegnerCycles:GH.8/uniform-coherent-lift](#generalizedheegnercycles-gh-8-uniform-coherent-lift), `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), [GeneralizedHeegnerCycles:GH.3/finite-character-moment-descent](#generalizedheegnercycles-gh-3-finite-character-moment-descent), [GeneralizedHeegnerCycles:GH.4/source-period-and-twist-transport](#generalizedheegnercycles-gh-4-source-period-and-twist-transport), [GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization](#generalizedheegnercycles-gh-7-higher-weight-family-specialization), [GeneralizedHeegnerCycles:GH.7/ordinary-regulator-quotient-application](#generalizedheegnercycles-gh-7-ordinary-regulator-quotient-application), [GeneralizedHeegnerCycles:GH.7/weight-two-p-old-localization](#generalizedheegnercycles-gh-7-weight-two-p-old-localization), `mathlib:LinearMap`, `mathlib:LinearMap.dualMap_apply`, [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport), [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation), `PadicHodgeRegulators:L1`.

**Sources.**

- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Section 5.3, equations (5.3)--(5.5), Definition 5.6 and Theorem 5.7, pp. 24--25. The exact completed-unramified formula is imported from GH.4; this node adds quotient, differential and consumer coefficient transport at r=1.
- [bdp-published-2013-gh8](#source-bdp-published-2013-gh8), Sections 3.1--3.4, pp. 1065--1070. Functorial realization and its de Rham dual determine the sign and differential map; elliptic logarithm naturality is a supplier obligation.
- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Section 4.5, de Rham base-change discussion, p. 19. States the de Rham scalar-extension identification. The additional Abel--Jacobi, Bloch--Kato logarithm and trace squares are explicit supplier requests, not conclusions inferred from this vector-space identity.

<a id="generalizedheegnercycles-gh-8-automorphic-reciprocity-export"></a>
### Source-qualified ordinary inputs for automorphic congruences

**Target:** `GeneralizedHeegnerCycles:GH.8/automorphic-reciprocity-export` · comparison.

Export to AutomorphicCongruences L2 the GH.4 CH 2022 scalar regulator identity and GH.7 Castella Theorem 5.3 with their actual coefficients and classes. For a Hida branch I and the character xi in the Castella author copy, set lambda=Psi(Frob_p)-1 and S_I=I[lambda^{-1}] completed tensor W. The family identity is R_Cas(loc_p(Z_{c_0,infty} tensor xi^{-1}))=L_{p,xi}(family) sigma_{-1,p} in S_I[[Gamma_tilde]], where R_Cas includes the printed finite-ring-class corestriction and group restriction. At a permitted specialization nu with nu(lambda) nonzero, the coefficient homomorphism sends the analytic distribution to the CH-convention L_{p,xi_nu}(f_nu) by Castella Theorem 2.11. The class moment is c_0^{1-r_nu} z_{f_nu,c_0,alpha} in the exact range of Theorem 6.5; the weight-two p-old extension uses ordinary-p-old-family and weight-two-reciprocity. For a continuous coefficient/group homomorphism rho defined on S_I[[Gamma_tilde]], the exact family identity transfers to rho(R_Cas(...))=rho(L_{p,xi}(family)) rho(sigma_{-1,p}). The CH identity transfers separately with its -c_0^{r-1} factor and t^{-2r} functional. Identify these source presentations only after the GH.4/GH.7 period, twist, pairing and coefficient diagram is proved.

**Hypotheses and conventions.**

- The family has p not dividing 6N, odd discriminant -D_K<-3, the classical Heegner hypothesis, split p, ordinary and p-distinguished residual representation irreducible on G_K, and residual ramification at primes of (D_K,N) for the comparison. The common CH weight-two comparison imposes the stronger all-tame-primes-split hypothesis.
- Theorem 6.5 requires a reference weight k congruent to 2 modulo p-1, weight 2r_nu>2 congruent to k modulo 2(p-1) and trivial character. At weight two use Remark 6.6 only when the specialization is p-old of prime-to-p level.
- A specialization of I need not extend to S_I. If nu(lambda)=0, GH.7 must construct an integral/regular model and its moment; no evaluation of a pole is allowed.
- The output is the native source identity and its defined transport. L2 constructs the automorphic congruence divisibility and compares its analytic function on the same lattice and character domain. Its Beilinson--Flach classes and its L2s semi-ordinary branch are separate inputs.

**Construction or proof.**

1. Reuse GH.7 Theorems 2.11 and 5.3, including the xi^{-1} critical twist, omega_family trivialization, lambda localization and completion. Track the local-to-global corestriction and restriction through the finite ring-class component.
2. Use GH.7 moments and ordinary-p-old-family to compare the class at admissible weights; use weight-two-reciprocity to compare the elliptic differential functional. Carry the CH and Castella pairings separately until the version diagram commutes.
3. Apply a defined continuous ring homomorphism rho to each exact equality. Verify its action on coefficients and group generators, and its commutation with the class/regulator specialization, rather than naming two distributions equal.
4. Hand these identities, their coefficient maps and their exact hypothesis ranges to L2. Period units, excluded height-one primes and resulting congruence divisibilities are proved by that consumer; the GH.8 export supplies no universal nonordinary specialization.

**Acceptance checks.**

- If nu(lambda)=0, a proposed map from S_I must be rejected unless a regular model has been proved. A denominator-cleared equality cannot be specialized by cancelling the zero denominator.
- Compare the positive Castella 5.3 sign with the negative CH 2022 sign and their t^{1-2r}/t^{-2r} conventions through actual maps; dropping the difference fails the export.
- Evaluate at a finite ring-class character before taking the anticyclotomic quotient, and check the image of sigma_{-1,p}; the full finite part cannot be replaced silently by a torsion-free group.
- A supersingular weight-two point does not pass the ordinary-family hypotheses. No claim about FW Beilinson--Flach classes follows from this Heegner identity.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/ordinary-p-old-family](#generalizedheegnercycles-gh-8-ordinary-p-old-family), [GeneralizedHeegnerCycles:GH.8/weight-two-reciprocity](#generalizedheegnercycles-gh-8-weight-two-reciprocity), [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), [GeneralizedHeegnerCycles:GH.4/source-period-and-twist-transport](#generalizedheegnercycles-gh-4-source-period-and-twist-transport), [GeneralizedHeegnerCycles:GH.7/higher-weight-family-specialization](#generalizedheegnercycles-gh-7-higher-weight-family-specialization), [GeneralizedHeegnerCycles:GH.7/ordinary-regulator-quotient-application](#generalizedheegnercycles-gh-7-ordinary-regulator-quotient-application), [GeneralizedHeegnerCycles:GH.7/weight-two-p-old-localization](#generalizedheegnercycles-gh-7-weight-two-p-old-localization).

**Sources.**

- [castella-family-author-gh8](#source-castella-family-author-gh8), Theorem 2.11 and proof, pp. 12--13; Proposition 5.2 and Theorem 5.3, pp. 22--23; Theorem 6.5 and Remark 6.6, pp. 28--29. Native family scalar identity, analytic specialization and its range; GH.8 translates the imported data for the congruence consumer.
- [ch-author-2022-gh8](#source-ch-author-2022-gh8), Theorem 5.7, p. 25. The distinct revised CH identity retains its negative scalar, group-like term and pairing.

<a id="generalizedheegnercycles-gh-8-corrected-bsd-input-export"></a>
### Higher-weight input comparison for the corrected multiplicative BSD proof

**Target:** `GeneralizedHeegnerCycles:GH.8/corrected-bsd-input-export` · comparison.

For each auxiliary ordinary prime-to-p-level newform g_m of even weight k_m>2 in the corrected Castella multiplicative proof, export the GH.2--GH.7 Heegner system with its actual lattice T_{g_m}, Selmer local conditions, character convention and completed unramified coefficients. In the source convention used by the proof, its initial Kolyvagin class agrees with the stabilized Iwasawa class kappa_{g_m,infty} through the higher-weight GH.5 comparison on the actual GH.3 class; GH.5 supplies that unit and its inverse, not just a rational nonzero multiple. Export the CH 5.7 scalar regulator formula -c_0^{r_m-1} L_{p,psi}(g_m) sigma_{-1,p}, and GH.7 Castella 2.11/5.3 analytic moments, along their proved normalization maps. Under any specified coefficient reduction R_{g_m} to R_{g_m}/p^m, these exact identities commute with reduction. The source Selmer containment and non-torsion conclusion must be proved under the precise tame-level hypotheses used for g_m. BSD.6a supplies the congruences T_{g_m}/p^m congruent to T_pE/p^m, the analytic-function congruence, control, both divisibilities and the limit argument; GH.8 supplies their source-qualified higher-weight inputs, without claiming a p-old cycle/point comparison for the p-new multiplicative weight-two form.

**Hypotheses and conventions.**

- The corrected source has p>3, split p, an ideal M in O_K with O_K/M congruent to Z/MZ, residual irreducibility on G_K for g_m, a nonsplit q exactly dividing M, the stated nonsplit-special local automorphic type, and 2 exactly dividing M if 2 is nonsplit. The lattice congruence and rigidity arguments deriving these conditions belong to BSD.6a.
- CH standing Hypothesis (H) instead assumes all tame primes split, and its factorial restriction is weight-dependent. Longo--Vigni admissibility and its exceptional set must also be verified. The export in the corrected source range therefore requires an explicit extension/adapter from GH.0--GH.7; the all-split theorem cannot be applied by dropping these conditions.
- GH.2 must supply the CH erratum and the Kobayashi--Ota replacement for the derived local condition, not the original absolutely-unramified-only Lemma 7.5 at ramified conductor.
- For E itself retain the corrected Theorem 1.1 conditions including E(Q_p)[p]=0 and the nonsplit residually ramified multiplicative prime. The transfer to E is congruence/control in BSD.6a, not Theorem 6.5 or Remark 6.6 at a p-new point.
- Use the native higher-weight GH.3/GH.5 classes and GH.7 analytic moments directly. The all-split p-old weight-two comparison and the elliptic HE.8 class are not suppliers of the higher-weight leading-class unit. The generic fixed-denominator bounds do not replace that integral unit.

**Construction or proof.**

1. Read the corrected proof of Theorem 2.3 as an import list: CH (4.7) and Section 5.2 from GH.2/GH.3, CH Theorem 5.7 from GH.4, LV Theorem 4.7 and the integral leading-class unit from GH.5, and CH Theorem 6.1 non-torsion from GH.6. GH.7 supplies the native Castella Theorems 2.11/5.3 analytic inputs. Do not replan those systems.
2. Prove the source-range adapter for nonsplit tame primes and weight-dependent admissibility in GH.0--GH.7. Until it is supplied, record the export as a target with this gap; the corrected consumer conclusion is not a proof of the adapter.
3. Compare the selected integral coefficient lattice, Iwasawa group action (including any inversion from discrete-dual conventions) and local conditions by actual maps. GH.5 supplies the higher-weight leading-class unit, and GH.7 the analytic moment identity in a defined coefficient model.
4. Apply coefficient reduction to the exact scalar reciprocity identities. Hand the resulting equalities and verified hypothesis packages to BSD.6a; that consumer compares with its Sigma-imprimitive analytic function and proves the congruence/control passage to the multiplicative elliptic curve.

**Acceptance checks.**

- An all-split auxiliary level fails the corrected Theorem 2.3 nonsplit-prime requirement; the CH all-split range and the corrected range need an explicit extension, not a common-range shortcut.
- A merely nonzero lattice multiplier, for example p, cannot replace the asserted p-adic unit relating the leading Kolyvagin class and kappa_{g_m,infty}.
- Reduction modulo p^m respects the displayed scalar equation, but reduction of characteristic ideals is not inferred from it. The congruence and Fitting/control calculation remains in BSD.6a.
- A p-new multiplicative weight-two form fails Remark 6.6. Reject a direct application, while retaining its valid auxiliary higher-weight and family analytic inputs.
- The supersingular BSTW/CLW branch has its own zeta elements and signed reciprocity. This ordinary export supplies none of those conclusions.
- The dependency graph for this export does not require a weight-two point comparison at an auxiliary nonsplit tame level. Its native higher-weight supplier range is checked separately.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.8/bsd-auxiliary-range-adapter](#generalizedheegnercycles-gh-8-bsd-auxiliary-range-adapter).

**Sources.**

- [bsd-multiplicative-erratum-gh8](#source-bsd-multiplicative-erratum-gh8), Theorem 2.3 and proof, pp. 3--4; proof of Theorem 1.1 and footnote 1, p. 4. Names the exact higher-weight systems, source theorem calls and congruence route consumed by BSD.6a; its arithmetic main-conjecture conclusions remain consumer-owned.
- [ch-erratum-gh8](#source-ch-erratum-gh8), Lemma 7.5/Proposition 7.8 correction, p. 1. Supplies the corrected proof route for derived local conditions; its replacement theorem is GH.2 work.

<a id="generalizedheegnercycles-gh-8-bsd-auxiliary-range-adapter"></a>
### Source-qualified auxiliary inputs for the corrected BSD export

**Target:** `GeneralizedHeegnerCycles:GH.8/bsd-auxiliary-range-adapter` · comparison.
**Proposed declaration:** `TauCeti.GeneralizedHeegner.bsdAuxiliaryRangeAdapter`.

For the actual sequence g_m of prime-to-p-level ordinary forms of even weights k_m>2 used in Castella Birch erratum, assemble the integral classes/local conditions of auxiliary-form-local-range, the leading-class unit of auxiliary-form-leading-class-unit and non-torsion of auxiliary-form-nontorsion. Supply the source-qualified higher-weight scalar reciprocity identity and native Castella analytic moments in coefficient models where reduction modulo p^m is defined. Record the precise allowed weight set and all denominators; an unbounded sequence cannot satisfy a fixed-p factorial exclusion. At a lambda-zero multiplicative point construct the required analytic regular model/cleared-denominator specialization, rather than applying the p-old cycle comparison. This adapter is the exact GH input to BSD.6a; BSD owns coefficient congruences, characteristic-ideal/control comparison and the limit argument.

**Hypotheses and conventions.**

- Theorem 2.3’s ideal Heegner, special nonsplit local types, condition at 2, split p and residual irreducibility hold for each g_m. The consumer supplies the actual congruence sequence and lattices, not arbitrary weight specializations.
- The new auxiliary local/system/non-torsion theorem targets and regular analytic model are proved before this export is applied. These remain explicit gaps in this plan; the erratum’s conclusion is not assumed as their proof.

**Construction or proof.**

1. Identify the class in the three auxiliary targets with the source’s Section 5.2 stabilized class through exact lattice/tower maps and the computed unit v_g.
2. Prove the corresponding nonsplit-range scalar reciprocity comparison and identify its distribution with the native Castella analytic moment in a regular coefficient model; retain all unit, sign, period and finite-component maps.
3. Apply the defined reduction maps to the exact equalities. Hand the resulting identities and unit inverses to BSD.6a, which performs the congruence/control transfer to the p-new multiplicative elliptic form.

**Acceptance checks.**

- All-split CH/LV and nonsplit auxiliary hypotheses cannot be conflated. Reduction of v_g preserves a unit, while reduction of an arbitrary nonzero scalar can annihilate the leading class.

**Direct prerequisites:** [GeneralizedHeegnerCycles:GH.2/auxiliary-form-local-range](#generalizedheegnercycles-gh-2-auxiliary-form-local-range), [GeneralizedHeegnerCycles:GH.5/auxiliary-form-leading-class-unit](#generalizedheegnercycles-gh-5-auxiliary-form-leading-class-unit), [GeneralizedHeegnerCycles:GH.6/auxiliary-form-nontorsion](#generalizedheegnercycles-gh-6-auxiliary-form-nontorsion), [GeneralizedHeegnerCycles:GH.4/source-period-and-twist-transport](#generalizedheegnercycles-gh-4-source-period-and-twist-transport), [GeneralizedHeegnerCycles:GH.7/family-measure-specialization](#generalizedheegnercycles-gh-7-family-measure-specialization), [GeneralizedHeegnerCycles:GH.7/two-variable-explicit-reciprocity](#generalizedheegnercycles-gh-7-two-variable-explicit-reciprocity).

**Sources.**

- [bsd-multiplicative-erratum-gh8](#source-bsd-multiplicative-erratum-gh8), Theorem 2.3 and proof, pp.3–4; proof of Theorem 1.1 and footnote 1, p.4. Exact import list, auxiliary congruence weights and analytic transfer; the missing source-range adapter is stated separately.

## Proposed supplier extensions and ownership corrections

These contracts delimit missing supplier outputs. Their identifiers are proposed contract identifiers, not declarations or atlas nodes that already exist. The requests remain open until their owners register and supply them.

### Canonical fibre-power geometry precedes classical Scholl cohomology, which precedes the CM product. R14.3 currently supplies weight-two H1 only; AGR R19.1 currently requests GH.0 geometry. Neither direction is silently asserted to be an established export.

Add the three geometric targets specified in proposedSupplierContracts to the geometric extension of Modular curves (ModularCurvesPartII), based on its generalized-elliptic-curve/compactification input. In AGR R19.1/parabolic-realisation-premotive and scholl-projector replace the GH.0 dependency by those geometry targets. Retain the signed classical projector, parabolic concentration and newform/lattice factor only in AGR. GH.0 then imports the resolved AGR outputs and constructs only the fixed CM factor, its product and coefficient adapter. Pending coordinated owner edits remain an explicit gap.

**`ModularCurvesPartII:R14.3/ks-canonical-resolution`.** For a fine auxiliary level n>4 and m≥0, construct the canonical desingularization W_m of the compactified m-fold universal generalized elliptic curve, with its map to X1(n), dimension m+1, rational generic-fibre smoothness/properness, and smooth proper integral model away from n in the range of Conrad’s BDP13 appendix. Extend translations, inversions, permutations and Hecke/level correspondences to the carrier. No projector theorem or CM factor is part of this target.

Source boundary: BDP13 §2.1, pp.1055–1059; Conrad appendix introduction, pp.1139–1141; full resolution details remain a source obligation.

**`ModularCurvesPartII:R14.3/ks-boundary-realisation`.** Give the boundary-stratum maps, excision/weight calculation and equivariance on the resolved fibre power needed by AGR to prove signed-projector concentration and parabolic realization. This target exports boundary geometry and cohomology sequences before applying the Scholl idempotent; it does not restate the projector’s image.

Source boundary: BDP13 §2.1, pp.1055–1059, with its Scholl reference; foundational boundary proof remains an explicit supplier/source obligation.

**`ModularCurvesPartII:R14.3/ks-fine-level-descent`.** For source level N≥1 choose fine n with N|n and degeneracy maps, realize the level-N isotypic summand over its original coefficient field, and prove independence of auxiliary n rationally. Track degree, stabilizer, torsion and projector denominators separately; no claim that extra fine-level primes are automatically harmless at p. AGR then records a fixed nonzero Hecke/congruence denominator d_f with d_f e_f preserving the chosen torsion-free lattice. Integral isomorphism requires these denominators to be units.

Source boundary: AGR R19.1 fine-level and integral-structure contracts; BDP13 §2.1, pp.1055–1059. Fine-level lattice descent is a requested extension, not a theorem inferred from R14.3 H1.

### Padic Hodge regulators, Part II: relative Lubin–Tate and unramified ordinary regulators. This is a proposed distinct extension of the existing local regulator roadmap; the current L3 cyclotomic packet does not cover it.

First prerequisite: the existing PadicHodgeRegulators L1/L3 logarithm and cyclotomic theory. Add the six target contracts below once in the local owner. GH.2/GH.4/GH.7 apply them to the actual ordinary line. AutomorphicCongruences L2 imports the same local extension and retains FW §4.2.1 fixed-weight logarithm boundedness. Proposed IDs are not claimed as existing atlas nodes; until registered, requests to L3 explicitly carry these contracts and remain open.

**`PHR2.0/integral-twists`.** Integral Perrin–Riou twisting and period pairing for crystalline lattices, with the actual Ω element, bounded denominators, finite coefficient extension and local logarithm/dual-exponential diagrams needed for KO20 Lemma 4.10.

Source boundary: KO20 §§2.3,4.7, Lemma 4.10, pp.54–56; integral twisting range requires source verification.

**`PHR2.1/relative-lubin-tate`.** CH22 Theorem 5.1 map over the specified finite unramified base and relative Lubin–Tate tower, with nonnegative crystalline Hodge–Tate weights, no trivial quotient and no tower invariants. Retain its integral source/target, distribution interpolation and epsilon/Euler/factorial cases.

Source boundary: CH22 §5.1, Theorem 5.1 and proof, pp.21–22.

**`PHR2.2/ochiai-ideal-exponential`.** For Castella’s ordinary rank-one deformation and Ical=I completed tensor Zp[[Gamma_cyc]], construct the injective exponential J(D tensor OF) → H1(F,F+Tcal), J=(Psi(Fr_p)−1,gamma0−1), with pseudo-null cokernel and the conductor-dependent interpolation.

Source boundary: Castella20 §3.2, Theorem 3.4, pp.14–15.

**`PHR2.3/yager-trace-module`.** Construct S_infty=lim_trace S_m, identify it with lim_trace O_Fm, prove rank-one freeness over Zp[[U]] and y^u=[u]y, and prove finite-level corestriction compatibility before tensoring regulators.

Source boundary: Castella20 §3.3, Proposition 3.5 and (3.6), p.15; LZ14 v3 §3.2, pp.11–13.

**`PHR2.4/two-variable-ordinary-regulator`.** Combine the ideal exponential and Yager descent over U times Gamma_cyc; prove injectivity with target lambda^−1 J(D tensor Ohat_Finfty[[G]]), lambda=Psi(Fr_p)−1, and both logarithm and p-old dual-exponential interpolation. Preserve localization, ideal and pseudo-null error.

Source boundary: Castella20 §3.4, Theorem 3.7, Corollary 3.9, pp.16–17; LZ14 v3 Proposition 4.11, p.18, only in its infinite-unramified range.

**`PHR2.5/quotient-and-specialisation`.** Supply the coefficient/distribution pushforward and H2 exact sequence for a one-variable quotient. Prove preimage of the target quotient submodule equals the source quotient submodule, or compute the descended kernel directly; pseudo-null cokernel and injectivity before quotient do not suffice. Retain nonzero scalar pairing on the one-dimensional period line and compatibility with restriction/corestriction. Specializations of a lambda-localized map require nonzero image of lambda. An exceptional zero requires a separately constructed regular integral model or cleared-denominator identity with a proved moment.

Source boundary: Castella20 Lemma 5.1/Proposition 5.2, pp.21–22; CH22 Theorem 5.1 quotient proof, pp.21–22; arithmetic application is GH.7’s. Existence of a regular model at every exceptional point is not asserted.

### RT-AREA-iwasawa-1/10: Howard’s abstract DVR and Lambda self-dual descent have the single owners ES.5 and ES.8.

Import ES.5/howard-dvr-theorem and ES.8/self-dual-lambda-adic-kolyvagin-bound. GH.5 verifies higher-weight hypotheses and supplies the actual system. HE.6/HE.8 verify elliptic hypotheses; retain the proposed HE.6 → HE.8 stage edge. CH bounded-error/rational descent imports the separate ES.4/rational-anticyclotomic-descent, whose source range is not strengthened to LV big image.

### RT-AREA-iwasawa-1/11: one GL2 square-root BDP distribution owner L3h and one general BDP13 Theorem 5.13 cycle formula owner GH.4.

Add L3h → GZ.9 and GH.4 → GZ.9; GZ.9 imports m=0 and retains quaternionic Brooks, supersingular, Kummer and exceptional-zero comparisons. Remove the ModularSymbolsPadicLFunctions L2 → GZ.9 dependency for the GL2 BDP construction unless a separate consumer supplies evidence for it.

## Open input contracts

A completed planning pass supplies definite targets and traces each missing input to an owner or gap. It does not certify proof closure. No layer is closed while the following obligations remain. Overlapping gap groups describe different consumer requirements on the same supplier work.

<a id="gap-1"></a>
### G1. Higher-weight universal-family export

R14.3 currently supplies finite-level H1 only. Its proposed geometric extension supplies canonical resolution, boundary geometry and fine-level descent, while AGR R19.1 alone supplies classical Scholl/parabolic/newform and the fixed integral Hecke denominator. Apply the explicit owner correction before GH imports this chain. Source levels N≤4 need auxiliary fine-level descent to the original newform and its CM structures; N>4 does not follow from CH (H).

Needed by [GeneralizedHeegnerCycles:GH.0/newform-cm-projector](#generalizedheegnercycles-gh-0-newform-cm-projector), [GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison).

<a id="gap-2"></a>
### G2. Product realizations and CM good model

Filtered de Rham and rational étale Künneth exports and the independently chosen CM good model are not supplied by level p∤N. Verify the selected canonical CM application over finite unramified F; do not extend it to arbitrary CM twists.

Needed by [GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety](#generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model), [GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration](#generalizedheegnercycles-gh-0-projected-hodge-filtration).

<a id="gap-3"></a>
### G3. Integral descent and CM character coefficient adapter

Prove vanishing of coefficient invariants for the K̃_c/K_c descent, and construct the Weil-restriction CM-character summand with all lattice/projector denominators. Invariance of a class alone does not identify the two H¹ groups. Use the full symmetric power of T_p(Res A) and prove the actual character/class inclusion; the published Sym/Ind identity is false by rank (E7), so it cannot supply the missing integral adapter.

Needed by [GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-integral-abel-jacobi-comparison), [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class).

<a id="gap-4"></a>
### G4. Geometric syntomic regulator comparison

Obtain the higher-dimensional Chow regulator and its exact Frobenius/Tate comparison. Current D.2 Spec O_F and D.5 K₂ curve comparison theorems are insufficient.

Needed by [GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-syntomic-abel-jacobi-comparison).

<a id="gap-5"></a>
### G5. Classical-cycle source comparison

BDP17 published Propositions 4.1.1–4.1.2, pp.38–41, have now been read and supply the correspondence and scalar evaluation. Still prove its etale realization, integral denominator transport and separate full/half-unit tower normalization before using a global integral class identity.

Needed by [GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison](#generalizedheegnercycles-gh-1-classical-generalized-cycle-comparison), [GeneralizedHeegnerCycles:GH.7/initial-family-specialization](#generalizedheegnercycles-gh-7-initial-family-specialization).

<a id="gap-6"></a>
### G6. Wide-open residue and Coleman comparison export

The exact BDP §§3.5–3.6 wide-open algebraic/rigid comparison and residue theorem with L_{m,m} must be exported by RD.4. The F-isocrystal carrier alone does not prove the analytic primitive calculation.

Needed by [GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing](#generalizedheegnercycles-gh-1-parabolic-residue-pairing), [GeneralizedHeegnerCycles:GH.1/coleman-primitive](#generalizedheegnercycles-gh-1-coleman-primitive).

<a id="gap-7"></a>
### G7. Corrected integral p-condition adapter

KO Lemma 4.10’s proof was read, but its Condition 2.3 and integral Ω construction are not discharged. Prove the requested lifting/orthogonality theorem and identify its height-one regulator-image local condition and lattice with the CH or LV condition at each required specialization.

Needed by [GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections](#generalizedheegnercycles-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections), [GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class](#generalizedheegnercycles-gh-5-higher-weight-kolyvagin-class), [GeneralizedHeegnerCycles:GH.6/selmer-rank-zero](#generalizedheegnercycles-gh-6-selmer-rank-zero).

<a id="gap-8"></a>
### G8. Bottom conductor and full/half unit normalization

Compute the missing n=1 split trace in CH’s 2022 copy and the unit orbit multiplicity. CH u_c=|O_c×| differs from Castella u_c=|O_c×|/2. No equality of their raw initial classes is assumed.

Needed by [GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter](#generalizedheegnercycles-gh-3-stabilized-first-step-adapter), [GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class](#generalizedheegnercycles-gh-3-iwasawa-heegner-class), [GeneralizedHeegnerCycles:GH.7/initial-family-specialization](#generalizedheegnercycles-gh-7-initial-family-specialization).

<a id="gap-9"></a>
### G9. Ramified conductor-one logarithm boundary

Theorem 4.9 states n≥1, while the conductor cancellation used in the density argument is n>1. Verify the n=1 calculation from the CM sum and lower conductor contributions; retain the separate BDP unramified Euler formula.

Needed by [GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula](#generalizedheegnercycles-gh-4-ramified-character-abel-jacobi-formula).

<a id="gap-10"></a>
### G10. Generic local regulator Part II

L3 presently proves the cyclotomic map. The relative Lubin–Tate and unramified×cyclotomic ordinary deformation contracts, ideal J, Yager module, λ_reg localization, pseudo-null errors and exceptional denominators require the precise proposed extension.

Needed by [GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter](#generalizedheegnercycles-gh-4-fixed-weight-regulator-adapter), [GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint](#generalizedheegnercycles-gh-7-ochiai-exponential-checkpoint), [GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint](#generalizedheegnercycles-gh-7-yager-unramified-checkpoint), [GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint](#generalizedheegnercycles-gh-7-two-variable-regulator-checkpoint).

<a id="gap-11"></a>
### G11. LV local twist and integral local verification

Check Assumption 3.2 in the representation convention of the LV edition read: trivial inertia on the quotient is not implied just by ordinarity of the untwisted form. Prove the actual annihilator, H⁰ and Cartesian/control conditions or supply a corrected applicable control theorem. This is a verification gap against arXiv v1, not an accusation about the published version.

Needed by [GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions](#generalizedheegnercycles-gh-5-longo-vigni-local-assumptions), [GeneralizedHeegnerCycles:GH.5/specialization-control](#generalizedheegnercycles-gh-5-specialization-control), [GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound](#generalizedheegnercycles-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound), [GeneralizedHeegnerCycles:GH.6/lambda-structure-consequence](#generalizedheegnercycles-gh-6-lambda-structure-consequence).

<a id="gap-12"></a>
### G12. Analytic nonvanishing supplier

Hsieh14 Theorem C and its F=Q finite-exception range have been read at pp.710–713 and §7.4, pp.763–764. The new nonvanishing-hypothesis-transport target checks the auxiliary-prime exchange, local character orders and ordinary CM type. L3h must supply its analytic theorem/interpolation and prime-existence inputs; this is an application/owner gap, not an unread-theorem claim.

Needed by [GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing](#generalizedheegnercycles-gh-6-anticyclotomic-nonvanishing).

<a id="gap-13"></a>
### G13. CH versus clean Howard descent

The exact ES.4/rational-anticyclotomic-descent now supplies CH22 Theorem 7.3 and its complementary local-class/7.9 generic descent. GH verifies that its actual CH classes, corrected derived p-condition, conjugation, nonzero localization and self-dual twist satisfy that interface. Do not strengthen CH (H) by importing the clean Howard/LV big-image assumptions.

Needed by [GeneralizedHeegnerCycles:GH.6/selmer-rank-one](#generalizedheegnercycles-gh-6-selmer-rank-one), [GeneralizedHeegnerCycles:GH.6/selmer-rank-zero](#generalizedheegnercycles-gh-6-selmer-rank-zero).

<a id="gap-14"></a>
### G14. LV universal-norm identification

Track finite Δ corestriction, p∤h_K, eventual augmented ideal equality and the Perrin–Riou universal-norm/Nakayama input. Verify generation of H∞ by κ̃₁ rather than infer it from nonvanishing of κ̃₁.

Needed by [GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class](#generalizedheegnercycles-gh-3-universal-norm-heegner-class), [GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one](#generalizedheegnercycles-gh-6-universal-norm-module-rank-one).

<a id="gap-15"></a>
### G15. Parity supplier and sign convention

Supply Nekovář’s corrected family parity theorem and check its local family hypotheses. Use parity residue (1−ε)/2; the final congruence in the CH author-copy proof printed with ε alone cannot distinguish the two root signs modulo 2.

Needed by [GeneralizedHeegnerCycles:GH.6/selmer-parity](#generalizedheegnercycles-gh-6-selmer-parity).

<a id="gap-16"></a>
### G16. Hida point and representation tower exports

Extend the finite-level CM point interface to shared p-parts of conductor/level; provide the ordinary rank-two Hida representation and specialization with its bad-prime residual hypotheses. A weight-two Hecke representation and fixed-weight Hida control alone do not give the complete tower contract. The global comparison also needs the source-specific Greenberg/Bloch–Kato equality in Lemma 6.4, requested from Selmer L4; its definition and a generic ordinary filtration do not prove the comparison.

Needed by [GeneralizedHeegnerCycles:GH.7/howard-family-tower](#generalizedheegnercycles-gh-7-howard-family-tower), [GeneralizedHeegnerCycles:GH.7/family-representation-specialization](#generalizedheegnercycles-gh-7-family-representation-specialization), [GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective](#generalizedheegnercycles-gh-7-ordinary-localization-injective).

<a id="gap-17"></a>
### G17. Rational Gysin and continuous extension adapter

EDC.3 is a finite-coefficient Gysin theorem. Establish the EDC.6 rational derived-limit and Chow-support compatibilities, the R02.1 continuous Ext¹/H¹ identification and the SF.5 rational-equivalence/Jacobian case; compact inflation–restriction is insufficient. Betti cycle-class compatibility in the homological-triviality claim must also be stated rather than inferred from torsion étale purity.

Needed by [GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles](#generalizedheegnercycles-gh-1-homological-triviality-of-generalized-heegner-cycles), [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map).

<a id="gap-18"></a>
### G18. Degree-one realization and uniform integral lattice

Supply GH.1’s finite Picard--Kummer/Gysin sign comparison on the actual curve, Jacobian and multiplication sequence, continuous passage and de Rham duality. Construct the selected f-factor maps with both composites equal to one fixed nonzero scalar and with all corestrictions commuting. A levelwise rational isomorphism does not give an integral Iwasawa isomorphism; unbounded-denominators-counterexample rejects that inference. For every finite local extension E/L_v occurring at conductor c_0 p^n, including ramified E/L_v, supply the canonical de Rham scalar-extension map D_dR,L_v(V) tensor_{L_v} E -> D_dR,E(V) and the commutative square between restriction on H^1_f and the Bloch--Kato logarithm, with the actual filtration quotient and differential functional. Prove the Abel--Jacobi/Kummer comparison commutes with this restriction. Supply the corestriction/field-trace adjoint square and its pairing compatibility before passing to the tower. Retain good reduction and all logarithm-domain hypotheses; scalar extension of D_dR alone does not prove these arithmetic squares. Prove the degree-one comparison for the CM point-minus-cusp divisors defined over E itself, not only for classes descending to L_v: base-change compatibility on restricted classes alone does not cover all E-rational points.

Needed by [GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer](#generalizedheegnercycles-gh-8-modular-quotient-kummer), [GeneralizedHeegnerCycles:GH.8/differential-evaluation](#generalizedheegnercycles-gh-8-differential-evaluation), [GeneralizedHeegnerCycles:GH.8/uniform-coherent-kernel-bound](#generalizedheegnercycles-gh-8-uniform-coherent-kernel-bound), [GeneralizedHeegnerCycles:GH.8/uniform-coherent-lift](#generalizedheegnercycles-gh-8-uniform-coherent-lift), [GeneralizedHeegnerCycles:GH.8/weight-two-reciprocity](#generalizedheegnercycles-gh-8-weight-two-reciprocity).

<a id="gap-19"></a>
### G19. CM carrier and finite-character descent

Repair or bypass the full symmetric-power/induction display E-GH8-1, including the degree-zero case, in GH.0/GH.3. Realize the quotient Galois action, exact-conductor/last-kernel comparison, restriction-image invariance and the finite-character specialization/descent of CH Lemma 5.4 (Rubin Lemma 2.4.3). The finite integral weighted-sum lemma alone proves none of these arithmetic maps.

Needed by [GeneralizedHeegnerCycles:GH.8/weight-zero-cycle](#generalizedheegnercycles-gh-8-weight-zero-cycle), [GeneralizedHeegnerCycles:GH.8/character-sum-comparison](#generalizedheegnercycles-gh-8-character-sum-comparison), [GeneralizedHeegnerCycles:GH.8/primitive-character-stabilization](#generalizedheegnercycles-gh-8-primitive-character-stabilization), [GeneralizedHeegnerCycles:GH.8/ordinary-p-old-family](#generalizedheegnercycles-gh-8-ordinary-p-old-family), [GeneralizedHeegnerCycles:GH.8/weight-two-reciprocity](#generalizedheegnercycles-gh-8-weight-two-reciprocity), [GeneralizedHeegnerCycles:GH.8/corrected-bsd-input-export](#generalizedheegnercycles-gh-8-corrected-bsd-input-export).

<a id="gap-20"></a>
### G20. Initial conductor and source normalization

Instantiate the existing HE.0/HE.2 declaration-level degree and trace results on the actual level curve, basepoint and Kummer normalization. Check geometric versus arithmetic Frobenius and any p-class tower shift. Reconcile the full unit order printed in CH Definition 5.2 with the half-order in Castella (6.7) by actual normalization maps. CH Proposition 4.4 covers n>1; it does not certify the initial input. Compare norm-compatible bottoms only through the proved first-corestriction square. The factor mismatch remains a comparison gap, not an additional established source error. Retain E(K)[p]=0 and the finite c_0 component when applying the existing HE.8 supplier; any extension outside its statement requires proof.

Needed by [GeneralizedHeegnerCycles:GH.8/initial-corestriction-comparison](#generalizedheegnercycles-gh-8-initial-corestriction-comparison), [GeneralizedHeegnerCycles:GH.8/positive-tail-corestriction](#generalizedheegnercycles-gh-8-positive-tail-corestriction), [GeneralizedHeegnerCycles:GH.8/ordinary-p-old-family](#generalizedheegnercycles-gh-8-ordinary-p-old-family), [GeneralizedHeegnerCycles:GH.8/weight-two-reciprocity](#generalizedheegnercycles-gh-8-weight-two-reciprocity).

<a id="gap-21"></a>
### G21. Regulator descent and source-qualified period maps

GH.7 must prove the typed coefficient/distribution quotient descent with zero descended kernel, nonzero pairing on the ordinary crystalline line, and the torsion-free/control/nonvanishing/rank-one chain of Castella Lemma 6.4. LZ14 Proposition 4.11 concerns an infinite unramified direction, and does not alone prove injectivity after quotienting it out. GH.4/GH.7 must transport CH 2022 and Castella author-copy twists, signs, t-powers, CM generators and completed-unramified rings by actual maps. Verify which specializations extend over lambda^{-1}; at a zero of lambda construct a regular coefficient model instead of evaluating a pole.

Needed by [GeneralizedHeegnerCycles:GH.8/ordinary-p-old-family](#generalizedheegnercycles-gh-8-ordinary-p-old-family), [GeneralizedHeegnerCycles:GH.8/weight-two-reciprocity](#generalizedheegnercycles-gh-8-weight-two-reciprocity), [GeneralizedHeegnerCycles:GH.8/automorphic-reciprocity-export](#generalizedheegnercycles-gh-8-automorphic-reciprocity-export), [GeneralizedHeegnerCycles:GH.8/corrected-bsd-input-export](#generalizedheegnercycles-gh-8-corrected-bsd-input-export).

<a id="gap-22"></a>
### G22. Corrected BSD auxiliary-form range and integral leading class

The corrected multiplicative proof uses nonsplit tame primes and varying higher weights. CH standing Hypothesis (H) has all tame primes split and a weight-dependent factorial exclusion; LV also has admissibility restrictions. GH.0--GH.7 must justify the exact extension to this auxiliary-form range, including corrected derived local conditions, non-torsion and the explicit unit relating the leading Kolyvagin class to the stabilized Iwasawa class. This is not supplied by the common all-split p-old comparison. BSD.6a owns the congruence/control transfer to the multiplicative curve; its theorem is not assumed to prove the missing source-range adapter. GH.5 owns the integral leading-class unit; GH.6 owns non-torsion. Native GH.7 analytic moments supply this export directly, without the p-old point-comparison prerequisites.

Needed by [GeneralizedHeegnerCycles:GH.8/corrected-bsd-input-export](#generalizedheegnercycles-gh-8-corrected-bsd-input-export).

<a id="gap-23"></a>
### G23. Arithmetic Lean interfaces

The arithmetic targets need the actual curve/Jacobian, Chow group, continuous Tate-module Kummer, Iwasawa cohomology, crystalline-line and completed coefficient APIs named in their supplier contracts. The suggested file gives the expressible algebraic components and identifies the omitted arithmetic signatures individually. No opaque curve/cohomology types or conclusion-bearing fields stand in for them.

Needed by [GeneralizedHeegnerCycles:GH.8/weight-zero-cycle](#generalizedheegnercycles-gh-8-weight-zero-cycle), [GeneralizedHeegnerCycles:GH.8/modular-quotient-kummer](#generalizedheegnercycles-gh-8-modular-quotient-kummer), [GeneralizedHeegnerCycles:GH.8/character-sum-comparison](#generalizedheegnercycles-gh-8-character-sum-comparison), [GeneralizedHeegnerCycles:GH.8/positive-conductor-stabilization](#generalizedheegnercycles-gh-8-positive-conductor-stabilization), [GeneralizedHeegnerCycles:GH.8/positive-tail-corestriction](#generalizedheegnercycles-gh-8-positive-tail-corestriction), [GeneralizedHeegnerCycles:GH.8/differential-evaluation](#generalizedheegnercycles-gh-8-differential-evaluation), [GeneralizedHeegnerCycles:GH.8/ordinary-p-old-family](#generalizedheegnercycles-gh-8-ordinary-p-old-family), [GeneralizedHeegnerCycles:GH.8/weight-two-reciprocity](#generalizedheegnercycles-gh-8-weight-two-reciprocity), [GeneralizedHeegnerCycles:GH.8/automorphic-reciprocity-export](#generalizedheegnercycles-gh-8-automorphic-reciprocity-export), [GeneralizedHeegnerCycles:GH.8/corrected-bsd-input-export](#generalizedheegnercycles-gh-8-corrected-bsd-input-export).

<a id="gap-24"></a>
### G24. Acyclic canonical-resolution ownership

The three proposed geometric supplier contracts must be registered and their boundary/fine-level content established; AGR must replace its GH.0 back-reference by those geometric outputs before GH consumes its classical projector. Current R14.3 H1 is insufficient, and redirecting the whole contract to AGR without that edit is circular. Global acyclicity is conditional on this coordinated owner move, not certified by the local checker.

Needed by [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector), [GeneralizedHeegnerCycles:GH.0/newform-cm-projector](#generalizedheegnercycles-gh-0-newform-cm-projector).

<a id="gap-25"></a>
### G25. Registered generic regulator Part II

PHR2.0–PHR2.5 are exact proposed target contracts in this packet, not existing supplier nodes. A local-owner Part II must register them, supply API/tests for its new objects and prove their source conditions. GH application proves the actual quotient preimage equality, line pairing and exceptional specialization domain.

Needed by [GeneralizedHeegnerCycles:GH.7/ordinary-regulator-quotient-application](#generalizedheegnercycles-gh-7-ordinary-regulator-quotient-application), [GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter](#generalizedheegnercycles-gh-4-fixed-weight-regulator-adapter).

<a id="gap-26"></a>
### G26. Auxiliary-form nonsplit and unbounded-weight adapter

Prove the three auxiliary targets and the BSD range adapter, including ramified-tame local Selmer conditions, integral construction across the actual unbounded weights, LV19 collation or independently applicable system, explicit leading-class unit, source-qualified reciprocity and non-torsion, and any lambda-zero analytic regular model. LV19 access failed; no source theorem currently read proves this full extension. The theorem targets and proof routes isolate the work without asserting it done.

Needed by [GeneralizedHeegnerCycles:GH.2/auxiliary-form-local-range](#generalizedheegnercycles-gh-2-auxiliary-form-local-range), [GeneralizedHeegnerCycles:GH.5/auxiliary-form-leading-class-unit](#generalizedheegnercycles-gh-5-auxiliary-form-leading-class-unit), [GeneralizedHeegnerCycles:GH.6/auxiliary-form-nontorsion](#generalizedheegnercycles-gh-6-auxiliary-form-nontorsion), [GeneralizedHeegnerCycles:GH.8/bsd-auxiliary-range-adapter](#generalizedheegnercycles-gh-8-bsd-auxiliary-range-adapter), [GeneralizedHeegnerCycles:GH.8/corrected-bsd-input-export](#generalizedheegnercycles-gh-8-corrected-bsd-input-export).

### Requests to other roadmaps

1. **`AutomorphicGaloisRepresentations:R19.1`:** Deligne newform representation with the exact geometric Frobenius, self-dual twist and lattice index used by LV Definition 2.1, plus its determinant-restricted big-image input and solvable-tower invariant-vanishing consequence under the stated nonexceptional prime conditions. Needed by [GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple](#generalizedheegnercycles-gh-5-longo-vigni-admissible-triple).
2. **`AutomorphicGaloisRepresentations:R19.6`:** The Hida ordinary branch representation T=lim_s e^ord T_pJ_s⊗_h I of Castella Theorem 4.3: free rank two under residual irreducibility/p-distinguishedness, trace and determinant conventions, rank-one ordinary sequence and arithmetic specialization after the critical twist. The current weight-two Hecke reconstruction nodes do not themselves prove this tower theorem. Needed by [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist), [GeneralizedHeegnerCycles:GH.7/family-representation-specialization](#generalizedheegnercycles-gh-7-family-representation-specialization), [GeneralizedHeegnerCycles:GH.7/howard-family-tower](#generalizedheegnercycles-gh-7-howard-family-tower).
3. **`AutomorphicPadicLFunctions:L3h`:** One GL₂ BDP/CH square-root distribution owner, including p-depletion and negative θ powers on the CM ordinary locus, BDP 5.9–5.10 toric interpolation/continuity, CH Proposition 3.8 and Theorem 3.9’s Hsieh Theorem C nonvanishing with auxiliary residual hypotheses, and Castella Theorem 2.11 family interpolation with period, epsilon, Euler and gamma normalization. GH.4 owns the generalized-cycle special value identity, while GZ.9 imports m=0; do not rebuild the measure in either place. Needed by [GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation](#generalizedheegnercycles-gh-1-coleman-depletion-calculation), [GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula](#generalizedheegnercycles-gh-4-bdp-special-value-formula), [GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity](#generalizedheegnercycles-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), [GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value](#generalizedheegnercycles-gh-4-dual-exponential-special-value), [GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula](#generalizedheegnercycles-gh-4-ramified-character-abel-jacobi-formula), [GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing](#generalizedheegnercycles-gh-6-anticyclotomic-nonvanishing), [GeneralizedHeegnerCycles:GH.7/family-measure-specialization](#generalizedheegnercycles-gh-7-family-measure-specialization).
4. **`ComplexMultiplicationAndExplicitReciprocity:CM.1`:** General CM A/H with End_H(A)=O_K, including exceptional unit fields; normalized Hodge characters and ideal action; the Tate module and CM character of B=Res_{H_K/K}A; decomposition of its full Sym^{2r−2} Tate module after coefficient extension, the G_K-equivariant χ projector after the finite-order twist χ_t (same conductor as χ, unique up to a Hilbert class character), and integral projector/class-inclusion denominators. Do not infer this from the false Sym/Ind isomorphism in CH §4.4. Also supply marked-isogeny descent to H̃·H_c beyond HE.1’s restricted unit fields. Supply the algebraically closed characteristic-zero point realization, target-order classification and the equality between finite-isogeny degree and geometric-kernel cardinality, with composition and marked ideal-torsion compatibility. Needed by [GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting](#generalizedheegnercycles-gh-0-cm-elliptic-curve-and-its-hodge-splitting), [GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class](#generalizedheegnercycles-gh-1-character-projected-heegner-class), [GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n](#generalizedheegnercycles-gh-1-isogenies-of-conductor-c-prime-to-n), [GeneralizedHeegnerCycles:GH.2/cycle-conjugation](#generalizedheegnercycles-gh-2-cycle-conjugation), [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist), [GeneralizedHeegnerCycles:GH.1/field-of-definition-of-generalized-heegner-cycles](#generalizedheegnercycles-gh-1-field-of-definition-of-generalized-heegner-cycles).
5. **`DerivedDeRhamCohomology:DD.2`:** Scheme-level algebraic de Rham realization for smooth proper schemes, filtered Künneth for W_m×A^m, cup product, compatibility with correspondence action and the classical smooth de Rham complex. Extend DD.2 beyond its present algebra/complex interface if this global filtered Künneth theorem is not yet included. Include the cycle-class and correspondence compatibility required for de Rham homological triviality. Also export the normalized H¹ Hodge splitting and cup pairing of the specified CM curve and graded Künneth for A^m used by ε_A. Needed by [GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety](#generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration](#generalizedheegnercycles-gh-0-projected-hodge-filtration), [GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles](#generalizedheegnercycles-gh-1-homological-triviality-of-generalized-heegner-cycles), [GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting](#generalizedheegnercycles-gh-0-cm-elliptic-curve-and-its-hodge-splitting), [GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power](#generalizedheegnercycles-gh-0-cm-projector-and-symmetric-power).
6. **`EtaleDualityAndPerverseSheaves:EDC.6`:** Rational p-adic étale Künneth and correspondence compatibility for proper smooth products, obtained from integral/finite systems with derived-limit control; no torsion duality statement alone supplies the rational product formula. Also export the rational p-adic Gysin exact sequence and cycle-class/correspondence compatibilities used for null-homologous codimension m+1 cycles supported on a smooth divisor in X_m, with derived-limit exactness, Tate twists, support enlargement and rational-equivalence independence for the pulled-back extension. Needed by [GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety](#generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles](#generalizedheegnercycles-gh-1-homological-triviality-of-generalized-heegner-cycles), [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map).
7. **`HeegnerPointEulerSystems:HE.1`:** Compatible finite-level CM points on X₁(Np^s) with p-power conductor, defined over K̃_c(μ_{p^s}), their diamond character ϑ²=ε_cyc and degeneracy/vertical trace in Castella §4.2. The existing prime-to-level canonical CM pair node is insufficient when conductor and level both have p-parts; extend that point interface, while GH.7 owns the family coefficient/class adapter. Needed by [GeneralizedHeegnerCycles:GH.7/howard-family-tower](#generalizedheegnercycles-gh-7-howard-family-tower).
8. **`ModularCurvesPartII:R14.3`:** Pending geometric extension only: ks-canonical-resolution, ks-boundary-realisation and ks-fine-level-descent with the exact contracts in restructure. Current R14.3 is weight-two H1 and does not provide these. AGR R19.1 is the sole classical Scholl/parabolic/newform owner after its GH.0 back-reference is replaced by the geometric outputs; GH.0 imports that resolved interface. Include explicit Hecke denominator d_f in the AGR integral lattice, without treating a rational projector as integral. Needed by [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model), [GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety](#generalizedheegnercycles-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector), [GeneralizedHeegnerCycles:GH.0/newform-cm-projector](#generalizedheegnercycles-gh-0-newform-cm-projector), [GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation](#generalizedheegnercycles-gh-1-coleman-depletion-calculation), [GeneralizedHeegnerCycles:GH.2/cycle-conjugation](#generalizedheegnercycles-gh-2-cycle-conjugation), [GeneralizedHeegnerCycles:GH.7/howard-family-tower](#generalizedheegnercycles-gh-7-howard-family-tower), [GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration](#generalizedheegnercycles-gh-0-projected-hodge-filtration).
9. **`PadicDifferentialEquationsAndRigidCohomology:RD.4`:** BDP §3.5 algebraic/rigid wide-open curve comparison with overconvergent coefficients, invariance under shrinking Frobenius neighborhoods, annular and cusp residues, rigid residue theorem and the Cech–de Rham cup-product formula. RD.3 supplies the F-isocrystal carrier separately; these exact wide-open comparisons need proof, not just a formal site map. Export the actual locally analytic/rigid section and differential carriers, connection and F-linear Frobenius polynomial action, and the admissible image witness for the modular differential (BDP Lemma 3.14/Theorem 3.15), including weight-zero normalization and the residue-disk comparison. Needed by [GeneralizedHeegnerCycles:GH.1/coleman-primitive](#generalizedheegnercycles-gh-1-coleman-primitive), [GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing](#generalizedheegnercycles-gh-1-parabolic-residue-pairing).
10. **`PadicHodgeRegulators:D.2`:** Higher-dimensional Chow-cycle syntomic Abel–Jacobi regulator for smooth proper X_m with projector action, proper/flat functoriality, and comparison with the étale Gysin extension and BK logarithm with an explicit Frobenius normalization. The existing Spec O_F Tate regulator and K₂ curve comparison nodes do not supply this statement. Needed by [GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison](#generalizedheegnercycles-gh-1-syntomic-abel-jacobi-comparison).
11. **`PadicHodgeRegulators:L3`:** Pending PadicHodgeRegulatorsPartII PHR2.0–PHR2.5, with exact statements in restructure: integral twisting, relative Lubin–Tate map, Ochiai J-exponential, Yager trace covariance, two-variable localized regulator and quotient/specialization exactness. Current cyclotomic L3 does not supply these. The request is open until this distinct local extension is registered and its targets are proved/planned. Needed by [GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections](#generalizedheegnercycles-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections), [GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value](#generalizedheegnercycles-gh-4-dual-exponential-special-value), [GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter](#generalizedheegnercycles-gh-4-fixed-weight-regulator-adapter), [GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions](#generalizedheegnercycles-gh-5-longo-vigni-local-assumptions), [GeneralizedHeegnerCycles:GH.7/critical-character-twist](#generalizedheegnercycles-gh-7-critical-character-twist), [GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint](#generalizedheegnercycles-gh-7-ochiai-exponential-checkpoint), [GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint](#generalizedheegnercycles-gh-7-two-variable-regulator-checkpoint), [GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint](#generalizedheegnercycles-gh-7-yager-unramified-checkpoint).
12. **`PadicHodgeTheory:R06.2`:** Negative-weight filtered Frobenius extensions over unramified F, admissible/crystalline extension comparison, Φ=Φ₀^[F:Q_p] convention and the quotient D_dR/Fil⁰ with the holomorphic-minus-Frobenius sign, as BDP §§3.2–3.4 uses. Needed by [GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules](#generalizedheegnercycles-gh-1-extensions-of-filtered-frobenius-modules).
13. **`PadicHodgeTheory:R06.5`:** Application of proper smooth comparison to projected X_m cohomology, including its Hodge/Tate normalization and the geometric Abel–Jacobi extension landing in H¹_f. The generic geometric comparison is imported from CP and the regulator extension must be compatible with the higher-dimensional Chow Gysin construction. The finite-class assertion for conductor p-power cycles must allow finite ramified support fields, using the base-changed good model; keep D_cris over the maximal unramified subfield and D_dR over the full field distinct. The unramified BDP filtered-Frobenius presentation alone does not supply that ramified comparison. Needed by [GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules](#generalizedheegnercycles-gh-1-extensions-of-filtered-frobenius-modules), [GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map](#generalizedheegnercycles-gh-1-p-adic-abel-jacobi-map), [GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence](#generalizedheegnercycles-gh-2-cycle-frobenius-congruence), [GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class](#generalizedheegnercycles-gh-2-finite-local-abel-jacobi-class).
14. **`SchemeAndStackFoundations:SF.2`:** Proper smooth base change and relative Gysin/specialization with the coefficient levels used for the product model and graph support. The already existing smooth/proper stability under products is imported from Mathlib, not re-planned. Needed by [GeneralizedHeegnerCycles:GH.0/cm-product-good-model](#generalizedheegnercycles-gh-0-cm-product-good-model), [GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing](#generalizedheegnercycles-gh-1-parabolic-residue-pairing).
15. **`SchemeAndStackFoundations:SF.5`:** Ordinary rational Chow groups, rational equivalence, proper pushforward/flat pullback, isogeny graph products, correspondence composition and action, including base change and transpose. Compare degree-zero Bloch cycle complexes with this intersection-theory API instead of giving GH a private Chow carrier. Supply compatibility of ordinary Chow rational equivalence with the support-independent Gysin Abel–Jacobi construction, and its degree-zero divisor/Jacobian Kummer case. Needed by [GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power](#generalizedheegnercycles-gh-0-cm-projector-and-symmetric-power), [GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector](#generalizedheegnercycles-gh-0-generalized-kuga-sato-variety-and-its-projector), [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map), [GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle](#generalizedheegnercycles-gh-1-generalized-heegner-cycle).
16. **`SelmerIwasawaCohomology:L4`:** Corrected Nekovář family parity theorem (Nek07 Corollary 5.3.2 with Nek09 correction), including the precise self-dual induced family and local plus-module hypotheses used by CH §6.4. This is a proposed Part II arithmetic-consequence extension, not an assertion that RJW criticality examples already prove family parity. Supply the source-scoped equality of Greenberg and Bloch–Kato local/Selmer conditions used in Castella Lemma 6.4 (Howard 2007, Eq. (23)), with exact ordinary/weight/twist hypotheses. Propagating the definition of H¹_f alone does not prove this equality. Needed by [GeneralizedHeegnerCycles:GH.6/selmer-parity](#generalizedheegnercycles-gh-6-selmer-parity), [GeneralizedHeegnerCycles:GH.7/ordinary-localization-injective](#generalizedheegnercycles-gh-7-ordinary-localization-injective).
17. **`ArithmeticGaloisDuality:R02.1`:** For continuous finite-dimensional Q_p representations of G_F, identify extension classes 0→V→E→Q_p→0 with continuous H¹(F,V) by g↦g·lift(1)−lift(1), independently of lift, functorially under restriction and coefficient maps. Apply to the rational Gysin pullback for AJ_et. The R02.2 compact five-term sequence is not this theorem. Needed by [GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map](#generalizedheegnercycles-gh-1-etale-abel-jacobi-map).
18. **`PadicHodgeRegulators:L1`:** Provide Bloch--Kato logarithm naturality for the quotient and its elliptic formal-group comparison, with the de Rham pairing and exact good-reduction range. For every finite local extension E/L_v occurring at conductor c_0 p^n, including ramified E/L_v, supply the canonical de Rham scalar-extension map D_dR,L_v(V) tensor_{L_v} E -> D_dR,E(V) and the commutative square between restriction on H^1_f and the Bloch--Kato logarithm, with the actual filtration quotient and differential functional. Prove the Abel--Jacobi/Kummer comparison commutes with this restriction. Supply the corestriction/field-trace adjoint square and its pairing compatibility before passing to the tower. Retain good reduction and all logarithm-domain hypotheses; scalar extension of D_dR alone does not prove these arithmetic squares. Prove the degree-one comparison for the CM point-minus-cusp divisors defined over E itself, not only for classes descending to L_v: base-change compatibility on restricted classes alone does not cover all E-rational points. Needed by [GeneralizedHeegnerCycles:GH.8/differential-evaluation](#generalizedheegnercycles-gh-8-differential-evaluation), [GeneralizedHeegnerCycles:GH.8/weight-two-reciprocity](#generalizedheegnercycles-gh-8-weight-two-reciprocity).
19. **`ModularCurvesPartII:R14.3`:** Actual modular Picard Jacobian, degree-one quotient and isotypic coefficient maps compatible with the fine-level geometry; use the existing curve/Jacobian owners for Picard representability. Higher-weight canonical-resolution/fine-level outputs remain the separately proposed geometric contracts. Needed by [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison), [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport).
20. **`EtaleDualityAndPerverseSheaves:EDC.6`:** Finite Gysin/residue sequence for a curve punctured at a Galois-stable finite support, with degree map including residue degrees; identify J[p^a] with H1(Cbar,mu_p^a), Poincare/Weil pairing and continuous inverse-limit naturality. The Picard object itself belongs to the existing Jacobian roadmap. Needed by [GeneralizedHeegnerCycles:GH.1/degree-one-picard-kummer-comparison](#generalizedheegnercycles-gh-1-degree-one-picard-kummer-comparison).
21. **`PadicHodgeTheory:R06.5`:** Degree-one good-reduction etale/de Rham comparison over every finite local conductor extension E/Lv, including ramified E, preserving filtration and the actual curve/Jacobian quotient map; not merely scalar extension on classes restricted from Lv. Needed by [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation).
22. **`PadicHodgeRegulators:L1`:** Bloch–Kato log naturality under finite restriction and trace-adjoint corestriction, including ramified extensions and the formal-group comparison on E-rational Picard/Kummer points in its actual good-reduction domain. Needed by [GeneralizedHeegnerCycles:GH.1/degree-one-local-realisation](#generalizedheegnercycles-gh-1-degree-one-local-realisation).
23. **`AutomorphicPadicLFunctions:L3h`:** Export the exact Hsieh14 Theorem C input of nonvanishing-hypothesis-transport and, separately, verify local root-number/test-vector/interpolation conditions for the ramified-tame auxiliary forms of Castella Birch erratum Theorem 2.3. The all-split CH3.9 coprime-discriminant argument does not cover these forms. Needed by [GeneralizedHeegnerCycles:GH.6/nonvanishing-hypothesis-transport](#generalizedheegnercycles-gh-6-nonvanishing-hypothesis-transport), [GeneralizedHeegnerCycles:GH.6/auxiliary-form-nontorsion](#generalizedheegnercycles-gh-6-auxiliary-form-nontorsion), [GeneralizedHeegnerCycles:GH.8/bsd-auxiliary-range-adapter](#generalizedheegnercycles-gh-8-bsd-auxiliary-range-adapter).
24. **`AutomorphicGaloisRepresentations:R19.1`:** On the selected newform factor supply the actual rational cohomological quotient map and a fixed pair of stable lattices with Hecke/fine-level denominator d_f. Provide the residual auxiliary-prime existence needed by Hsieh transport, with ordinary CM type at that prime. Resolve the GH.0 geometry back-reference as the acyclic owner proposal specifies. Needed by [GeneralizedHeegnerCycles:GH.1/uniform-integral-factor-transport](#generalizedheegnercycles-gh-1-uniform-integral-factor-transport), [GeneralizedHeegnerCycles:GH.6/nonvanishing-hypothesis-transport](#generalizedheegnercycles-gh-6-nonvanishing-hypothesis-transport), [GeneralizedHeegnerCycles:GH.2/auxiliary-form-local-range](#generalizedheegnercycles-gh-2-auxiliary-form-local-range).

### Coverage

| Layer | Status | Remaining contracts |
| --- | --- | --- |
| GH.0 | planned | Higher-weight universal-family export; Product realizations and CM good model; Acyclic canonical-resolution ownership |
| GH.1 | planned | Higher-weight universal-family export; Integral descent and CM character coefficient adapter; Geometric syntomic regulator comparison; Classical-cycle source comparison; Wide-open residue and Coleman comparison export; Rational Gysin and continuous extension adapter |
| GH.2 | planned | Corrected integral p-condition adapter; Auxiliary-form nonsplit and unbounded-weight adapter |
| GH.3 | planned | Bottom conductor and full/half unit normalization; LV universal-norm identification |
| GH.4 | planned | Ramified conductor-one logarithm boundary; Generic local regulator Part II; Registered generic regulator Part II |
| GH.5 | planned | Corrected integral p-condition adapter; LV local twist and integral local verification; Auxiliary-form nonsplit and unbounded-weight adapter |
| GH.6 | planned | Corrected integral p-condition adapter; LV local twist and integral local verification; Analytic nonvanishing supplier; CH versus clean Howard descent; LV universal-norm identification; Parity supplier and sign convention; Auxiliary-form nonsplit and unbounded-weight adapter |
| GH.7 | planned | Classical-cycle source comparison; Bottom conductor and full/half unit normalization; Generic local regulator Part II; Hida point and representation tower exports; Registered generic regulator Part II |
| GH.8 | planned | Degree-one realization and uniform integral lattice; CM carrier and finite-character descent; Initial conductor and source normalization; Regulator descent and source-qualified period maps; Corrected BSD auxiliary-form range and integral leading class; Arithmetic Lean interfaces; Auxiliary-form nonsplit and unbounded-weight adapter; Realize the degree-one Picard--Kummer/Gysin and de Rham quotient comparisons, including restriction/logarithm and corestriction/trace base-change squares at ramified local conductor fields, and the selected uniform integral lattice maps.; Supply the repaired CM carrier, quotient action and finite-character specialization/descent.; Instantiate the actual first trace/degree and source-normalization square using the finer HE.0/HE.2/HE.3/HE.8 plans. Retain HE.8’s E(K)[p]=0 and finite-component hypotheses.; Prove the regulator quotient kernel, global localization chain, source-version pairing/period diagram and legal coefficient specializations.; Supply the nonsplit tame-level and weight-admissibility adapters and integral Kolyvagin leading-class unit for the corrected BSD auxiliary forms.; Express the arithmetic signatures once the named supplier APIs exist; the current suggested file checks only algebraic compatibility. |

## Source corrections used by the targets

The following inherited findings describe the mathematical corrections in our own words. E7 and E-GH8-1 record the same symmetric-power obstruction with different part-level consumer lists. The new BDP17 correspondence reading does not assert an additional error in that paper. The initial unit normalization and regulator quotient questions are comparison gaps.

### GeneralizedHeegnerCycles/E1

**Location:** castella-hsieh-erratum, Theorem 6.3; corrected July 2, 2022 author copy p.27 and first item of author-hosted erratum.

The source introduces a replacement statement for Theorem 6.3. Use ((1−ε(V_f,χ))/2)[K_p^n:K]+e, not an expression using the root sign itself as a slope.
A root number +1 gives eventual rank-zero characters and slope 0; root number −1 gives rank-one characters and slope 1.

**Correction status:** Castella–Hsieh erratum, first item; incorporated in the July 2, 2022 author copy..

**Consumers:** `a`, ` `, `s`, `t`, `a`, `t`, `e`, `d`, ` `, `r`, `e`, `s`, `u`, `l`, `t`.

### GeneralizedHeegnerCycles/E2

**Location:** castella-hsieh-erratum, Lemma 7.5 and its use in Proposition 7.8; author copy pp.31–32; second erratum item.

For Lemma 7.5, the source adds the requirement that L/Qp be unramified. Require absolute unramifiedness over Q_p for the Fontaine–Laffaille proof. Use KO20 Lemma 4.10’s integral Perrin–Riou argument for the required ramified-conductor derivative local condition.
Relative unramifiedness over a ramified conductor field does not put the base in the Fontaine–Laffaille setting; the authors explicitly state that the ramified version of Lemma 7.5 is not known.

**Correction status:** Castella–Hsieh erratum, second item; correct replacement KO20 Lemma 4.10..

**Consumers:** `t`, `h`, `e`, ` `, `p`, `r`, `o`, `o`, `f`.

### GeneralizedHeegnerCycles/E3

**Location:** castella-hsieh-erratum, Lemma 7.10 and explanation; July 2, 2022 author copy p.34; third erratum item.

Lemma 7.10 describes the extension as p-ramified. The p-ramified extension in the lemma is abelian.
The character/class-field argument uses abelianity; it does not classify arbitrary p-ramified extensions.

**Correction status:** Castella–Hsieh erratum, third item; corrected in the July 2, 2022 author copy..

**Consumers:** `a`, ` `, `s`, `t`, `a`, `t`, `e`, `d`, ` `, `r`, `e`, `s`, `u`, `l`, `t`.

### GeneralizedHeegnerCycles/E4

**Location:** castella-hsieh, July 2, 2022 author copy, proof of Theorem 6.4, p.28, final displayed congruence; not a finding against the 2018 version of record.

The final displayed congruence in the proof uses the root sign ε as the parity residue. The final parity residue is (1−ε(V_f,χ))/2 modulo 2, rather than ε(V_f,χ) modulo 2. The statement of Theorem 6.4 remains the parity equality.
The preceding paragraph gives dimension 0 for root sign +1 and dimension 1 for root sign −1. Both +1 and −1 are odd, so the printed residue cannot encode the former case.

**Correction status:** new.

**Consumers:** `t`, `h`, `e`, ` `, `p`, `r`, `o`, `o`, `f`.

### GeneralizedHeegnerCycles/E5

**Location:** longo-vigni, arXiv:1605.03168v1, §4.2 Corollary 4.3 p.12 and §5.1 opening paragraph p.18; published text not collated in this run.

The source cites Assumption 2.3, item (5). Refer to the ordinarity clause (4) of Definition 2.1, imposed by Assumption 2.3.
Assumption 2.3 merely states admissibility; Definition 2.1 has four clauses, and its fourth clause is a_p a unit. This corrects the reference only; whether the self-dual twist satisfies the local quotient clause remains a separate recorded gap.

**Correction status:** new.

**Consumers:** `n`, `o`, `t`, `h`, `i`, `n`, `g`.

### GeneralizedHeegnerCycles/E6

**Location:** longo-vigni, arXiv:1605.03168v1, §4.3, p.18, proof of Theorem 4.12, Claim 2; published text not collated in this run.

The augmented trace-polynomial values are asserted equal as scalars. Use equality of generated ideals aug(γ_ℓ)O_p=aug(Φ)O_p for all sufficiently large ℓ, as in the preceding paragraph. Scalar values need not become equal.
Corollary 4.3 and the recurrence prove eventual equality of ideals, with a unit factor permitted. For example, a nonzero scalar sequence satisfying x_(m+2)=a_p x_(m+1)−p^(k−1)x_m cannot be eventually constant unless a_p−p^(k−1)=1. The lifting argument only needs ideal equality.

**Correction status:** new.

**Consumers:** `t`, `h`, `e`, ` `, `p`, `r`, `o`, `o`, `f`.

### GeneralizedHeegnerCycles/E7

**Location:** castella-hsieh, July 2, 2022 author copy §4.4 p.17; same display in author-hosted publisher-formatted Math. Ann. 370 (2018), §4.4 p.593 (castella-hsieh-published).

The display identifies the full symmetric power of the Weil-restriction Tate module with induction of the corresponding symmetric-power module of A. Delete the asserted isomorphism for the literal full symmetric-power carrier. If an induced symmetric-power carrier is intended instead, it must be defined separately with its own character projection and class inclusion; this review does not identify it with the full symmetric power.
Write h=[H_K:K] and m=2r−2. The rational ranks are binomial(2h+m−1,m) and h(m+1). For h=2,m=2 they are 10 and 6, and for m=0 they are 1 and h. A Tate twist and coefficient extension do not change ranks. Symmetric powers do not commute with induction. The character projection on the literal full Sym can be checked separately and is the requested CM.1 adapter.

**Correction status:** new.

**Consumers:** `t`, `h`, `e`, ` `, `p`, `r`, `o`, `o`, `f`.

### GeneralizedHeegnerCycles/E-GH8-1

**Location:** ch-published-2018-gh8, Published Section 4.4, printed p. 593, display defining S^{r-1}(B); also present in the 2 July 2022 author revision, Section 4.4.

The full symmetric power of the Weil-restriction Tate module is presented as the induction of the CM curve symmetric power, with the same Tate twist and coefficient extension. Do not identify the full ordinary symmetric power with the induced symmetric power. For positive degree the direct sum of the pure symmetric powers of the conjugate Tate modules is the relevant induced submodule; mixed monomials remain in the full symmetric power. In degree zero the full symmetric power is one-dimensional and needs a separate treatment. A repaired CM-character carrier and its maps must be constructed; simply changing the notation does not supply them.
Put h=[H_K:K] and extend scalars to a characteristic-zero coefficient field. T_p(B) has dimension 2h. At r=1 the left side has dimension 1 and the right side dimension h, so the displayed isomorphism is impossible when h>1. At r=2 their dimensions are h(2h+1) and 3h, again unequal for h>1. Tate twisting and coefficient extension do not change these dimensions. This refutes the display, not automatically all later theorems.

**Correction status:** new.

**Consumers:** `t`, `h`, `e`, ` `, `p`, `r`, `o`, `o`, `f`.

## Pinned baseline and current upstream boundary

The statement-level baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 19 statements below were read with their hypotheses at those exact commits. They supply ordinary algebraic/geometric operations, not the missing arithmetic constructions. Generated additive finite-sum reindexing is read through its source multiplicative declaration.

- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`: A proper geometrically integral group object over Spec K, for a field K; smoothness and the dimension interface are already available.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`, `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean`: Additive endomorphism ring of the existing abelian variety object, including toHom and integer multiplication.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy`, `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean`: mulBy A n is End.toHom of the integer n in End A; used by the scalar endomorphism compatibility test.
- `mathlib:LinearMap`, `Mathlib/Algebra/Module/LinearMap/Defs.lean`: The bundled semilinear map extends AddHom and MulActionHom; the identity-ring case supplies linear correspondence realizations.
- `mathlib:LinearMap.range`, `Mathlib/Algebra/Module/Submodule/Range.lean`: The image submodule of a linear map, with membership equivalent to existence of a preimage.
- `mathlib:Submodule.span`, `Mathlib/LinearAlgebra/Span/Defs.lean`: The infimum of submodules containing a supplied set; used for the coefficient eigenline and Selmer generation statements.
- `mathlib:AlgebraicGeometry.Smooth`, `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`: Smooth scheme morphisms, with composition and pullback stability already in the baseline.
- `mathlib:AlgebraicGeometry.IsProper`, `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`: Proper scheme morphisms, defined by separatedness, universal closedness and local finite type; composition and pullback stability are already available.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean`: The existing isogeny predicate is finiteness and surjectivity of the underlying scheme homomorphism; identities, composition and base change are already available.
- `mathlib:Module.Dual`, `Mathlib/LinearAlgebra/Dual/Defs.lean`: The algebraic dual of a module; no de Rham or Galois comparison is supplied.
- `mathlib:LinearMap.dualMap_apply`, `Mathlib/LinearAlgebra/Dual/Defs.lean`: Evaluation of the transpose: q.dualMap ell x = ell (q x).
- `mathlib:LinearMap.dualMap_comp_dualMap`, `Mathlib/LinearAlgebra/Dual/Defs.lean`: Contravariant composition of transposes, used for the differential comparison composite maps.
- `mathlib:Int.natAbs_le_of_dvd_ne_zero`, `Mathlib/Data/Int/Basic.lean`: If m divides a nonzero integer n, natAbs(m) <= natAbs(n); rules out divisibility of a fixed nonzero integer by every power of two.
- `mathlib:Submodule.mapQ`, `Mathlib/LinearAlgebra/Quotient/Basic.lean`: Induced map M/P -> N/Q from a linear map f with P contained in f^{-1}(Q); does not imply injectivity.
- `mathlib:Submodule.ker_mapQ`, `Mathlib/LinearAlgebra/Quotient/Basic.lean`: The kernel of the induced quotient map is the image of f^{-1}(Q) under M -> M/P.
- `mathlib:Submodule.mkQ_map_self`, `Mathlib/LinearAlgebra/Quotient/Basic.lean`: The image of P under its own quotient map is zero.
- `mathlib:LinearMap.ker_eq_bot`, `Mathlib/Algebra/Module/Submodule/Ker.lean`: A linear map of modules is injective exactly when its kernel is zero.
- `mathlib:Equiv.prod_comp`, `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`: Reindex a finite product by an equivalence of finite types; its to_additive attribute generates Equiv.sum_comp, the finite-sum form used here. The literal source declaration is cited because the repository index does not enumerate generated additive declarations. No arithmetic cohomology or character-specialization map is supplied.
- `mathlib:MulChar.sum_eq_zero_of_ne_one`, `Mathlib/NumberTheory/MulChar/Basic.lean`: A nontrivial multiplicative character on a finite commutative monoid has scalar sum zero in a commutative integral domain. Apply to the finite abelian conductor kernel, where every element is a unit. This existing scalar theorem, not a new orthogonality theory, supplies cancellation.

The current upstream roadmap tree was also screened at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine post-snapshot roadmaps and four Completed roadmaps named in WORKERS. AlgebraicVectorBundles and JacobianChallenge supplied the nearby style and ownership baseline. The library’s abstract Weil-divisor Abel–Jacobi and its syntomic ring algebras do not supply continuous Tate-module Kummer theory or geometric syntomic regulators. No matching generalized-cycle, Kuga–Sato/Scholl or ordinary-regulator realization was found. Existing geometry and Jacobian infrastructure is consumed from those roadmaps, not planned anew.

## Source register

Version aliases are retained because CH’s published, revised and erratum locators differ. Repeated aliases with the same SHA-256 identify the same PDF. Source statements are restated in our own words; no source passages are reproduced. The packet records reading scope and access evidence separately from the mathematical locators above.

<a id="source-bertolini-darmon-prasanna-generalized-heegner"></a>
### bertolini-darmon-prasanna-generalized-heegner

[Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf). M. Bertolini, H. Darmon, K. Prasanna; appendix B. Conrad. Published Duke Math. J. 162 (2013), 1033–1148; 116 pages.

SHA-256: `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`.

Reading locators: §1.4, pp.1051–1054; §2.1–2.4, pp.1055–1064; §3.1–3.7, pp.1064–1083; §3.8 Proposition 3.24 and its proof, pp.1086–1088; §5.3, Assumption 5.12 and Theorem 5.13 with proof, pp.1137–1139; appendix introduction, pp.1139–1141.

<a id="source-castella-hsieh"></a>
### castella-hsieh

[Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf). F. Castella, M.-L. Hsieh. Author copy dated July 2, 2022, 40 pages; distinct from Math. Ann. 370 (2018).

SHA-256: `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba`.

Reading locators: Hypothesis (H); Proposition 3.8 and Theorem 3.9 nonvanishing statements and proof; §4.1–4.7 cycle, norm, character and logarithm constructions; §5.1–5.3 relative regulator, stabilization and reciprocity; §6.1–6.4 with proofs; §7.1–7.5 descent and local condition arguments.

<a id="source-castella-hsieh-erratum"></a>
### castella-hsieh-erratum

[Erratum to Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf). F. Castella, M.-L. Hsieh. One-page author-hosted erratum.

SHA-256: `2a8b615daf100b0f2e8ee5890462a91dde9c860492ec920d2a1a7d5827028678`.

Reading locators: Entire text, including all three corrections.

<a id="source-longo-vigni"></a>
### longo-vigni

[Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168). M. Longo, S. Vigni. arXiv:1605.03168v1, May 10, 2016; findings and obligations refer to this edition.

SHA-256: `afc1a2146cae0397c5aabb337f5955d182a0dab3dd50949ec2e274426a9a5c75`.

Reading locators: Introduction and Theorem 1.1; §2–5 (hypotheses, control, universal norms, Kolyvagin construction, rank-one module and bound).

Inherited access/collation note: Publisher full-text URL was opened on 2026-10-07 but returned an Incapsula access page. arXiv lists only v1; the author publications page timed out. This packet does not claim to have collated the 2019 version of record.

<a id="source-castella-variation"></a>
### castella-variation

[On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf). F. Castella. 31-page author-hosted copy of J. Inst. Math. Jussieu 19 (2020), 2127–2164.

SHA-256: `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d`.

Reading locators: §1 introduction and conventions; §2.1–2.7; §3.1–3.4; §4.1–4.2; §5.1–5.2; §6.1–6.2, through Theorem 6.5 and Remark 6.6; §6.3 is outside this part.

<a id="source-kobayashi-ota"></a>
### kobayashi-ota

[Anticyclotomic main conjecture for modular forms and integral Perrin-Riou twists](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf). S. Kobayashi, K. Ota. Author-hosted proceedings copy, 58 pages, cited by CH erratum.

SHA-256: `377cf3e5c53b00bed813a06e18ad8dac9315997497f2dabe57a435664b9764b4`.

Reading locators: §4.7 Lemma 4.10 and its entire proof; Lemma 4.7 and Remark 4.8; integral twisting prerequisites are requested, not independently established.

<a id="source-castella-hsieh-published"></a>
### castella-hsieh-published

[Heegner cycles and p-adic L-functions](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf). F. Castella, M.-L. Hsieh. Publisher-formatted Math. Ann. 370 (2018), 567–628; author-hosted 62-page print copy.

SHA-256: `be67ffe80a7fa346e8cb0733f38c776268174eebc6277a85bfa9b91c49073ade`.

Reading locators: §4.4, p.593: coefficient definition and symmetric-power/induction display, collated for E7 only.

Inherited access/collation note: This review collates the coefficient display in §4.4 only; all other CH node locators remain explicitly tied to the July 2, 2022 author copy.

<a id="source-bdp-published-2013-gh8"></a>
### bdp-published-2013-gh8

[Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf). Massimo Bertolini; Henri Darmon; Kartik Prasanna. Duke Mathematical Journal 162 (2013), 1033--1148; 116-page published PDF on Darmon’s page.

SHA-256: `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`.

Reading locators: Section 2.3, Remark 2.6, index-zero paragraph and Proposition 2.7, pp. 1062--1063; Sections 3.1--3.4, pp. 1065--1070: Gysin extension, crystalline comparison and de Rham functional.

<a id="source-ch-published-2018-gh8"></a>
### ch-published-2018-gh8

[Heegner cycles and p-adic L-functions](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf). Francesc Castella; Ming-Lun Hsieh. Mathematische Annalen 370 (2018), 567--628; DOI 10.1007/s00208-017-1517-3; 62-page journal-typeset PDF.

SHA-256: `be67ffe80a7fa346e8cb0733f38c776268174eebc6277a85bfa9b91c49073ade`.

Reading locators: Standing Hypothesis (H); Sections 4.3--4.4, Proposition 4.4 and the symmetric-power display, pp. 591--593; p. 593 rendered and inspected; Section 5.2, Definition 5.2 and Lemmas 5.3--5.4, pp. 601--602.

<a id="source-ch-author-2022-gh8"></a>
### ch-author-2022-gh8

[Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf). Francesc Castella; Ming-Lun Hsieh. Author revision dated 2 July 2022, 40 pages; distinct from the 2018 journal typesetting.

SHA-256: `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba`.

Reading locators: Standing Hypothesis (H), pp. 1--2; Sections 4.2--4.4, pp. 15--19: coefficient carrier, Proposition 4.4 and its proof, symmetric-power display and character projection; Sections 5.1--5.3, pp. 21--25: Theorem 5.1 and quotient proof, Definition 5.2, Lemmas 5.3--5.5, period pairings, Definition 5.6 and Theorem 5.7 with proof; p. 25 rendered and inspected; Section 6.1 hypothesis package and Theorem 6.1, pp. 26--27.

<a id="source-castella-family-author-gh8"></a>
### castella-family-author-gh8

[On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf). Francesc Castella. 31-page author copy; numbering of this copy. Published: J. Inst. Math. Jussieu 19 (2020), 2127--2164.

SHA-256: `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d`.

Reading locators: Introduction and standing ordinary/Hida hypotheses, pp. 2--3; Theorem 2.11 and analytic-specialization proof, p. 12; Section 5.1--5.2, pp. 21--23: Lemma 5.1, lambda localization, Proposition 5.2, twist, corestriction/restriction and Theorem 5.3 statement; Section 6.2, pp. 27--29: Lemma 6.4 proof, Theorem 6.5 and proof, equations (6.7)--(6.9) and Remark 6.6; p. 28 rendered and inspected.

<a id="source-ch-erratum-gh8"></a>
### ch-erratum-gh8

[Erratum to Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf). Francesc Castella; Ming-Lun Hsieh. One-page author erratum linked by Hsieh.

SHA-256: `2a8b615daf100b0f2e8ee5890462a91dde9c860492ec920d2a1a7d5827028678`.

Reading locators: Entire one-page erratum: Theorem 6.3, Lemma 7.5/Proposition 7.8 and Lemma 7.10 corrections.

<a id="source-lz14-v3-gh8"></a>
### lz14-v3-gh8

[Iwasawa theory and p-adic L-functions over Z_p^2-extensions](https://arxiv.org/pdf/1108.5954v3). David Loeffler; Sarah Livia Zerbes. arXiv:1108.5954v3, 22 April 2014; 45-page accepted-version preprint, distinct from the journal typesetting.

SHA-256: `0da539348716fa2293377bba81b07de3d851f3e98bbc9b244b19e639a5ae5341`.

Reading locators: Definition 4.6 and Theorem 4.7 statement, p. 16; Propositions 4.9--4.11 including the complete injectivity proof, p. 18.

<a id="source-mathlib-quotient-082e2d3-gh8"></a>
### mathlib-quotient-082e2d3-gh8

[Mathlib quotient modules and kernels](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Basic.lean). Mathlib contributors. Commit 082e2d37e8b0463410cdb532e111cd43d5a66174.

Reading locators: Quotient/Basic.lean: mkQ_map_self, mapQ and ker_mapQ with their surrounding hypotheses; Submodule/Ker.lean: ker_eq_bot.

<a id="source-mathlib-finite-characters-082e2d3-gh8"></a>
### mathlib-finite-characters-082e2d3-gh8

[Finite sums and multiplicative-character orthogonality](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/MulChar/Basic.lean). Mathlib contributors. Commit 082e2d37e8b0463410cdb532e111cd43d5a66174.

Reading locators: MulChar Basic.lean finite CommMonoid/CommRing/IsDomain context and sum_eq_zero_of_ne_one statement/proof; BigOperators Finset Defs.lean: Equiv.prod_comp and its generated additive form Equiv.sum_comp.

<a id="source-bsd-multiplicative-erratum-gh8"></a>
### bsd-multiplicative-erratum-gh8

[Erratum to On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf). Francesc Castella. Five-page author erratum; acquired copy includes Theorem 2.3 and its proof.

SHA-256: `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf`.

Reading locators: Introduction, corrected Theorem 1.1 and Theorem A′, pp. 1--2; Theorem 2.3 and proof, pp. 3--4; proof of Theorem 1.1 and footnote 1, p. 4; reference register, p. 5.

<a id="source-bdp-coniveau-published"></a>
### bdp-coniveau-published

[p-adic L-functions and the coniveau filtration on Chow groups](https://www.math.mcgill.ca/darmon/pub/Articles/Research/57.BDP5-coniveau/crelle.pdf). M. Bertolini, H. Darmon, K. Prasanna; appendix B. Conrad. J. reine angew. Math. 731 (2017), 21–86; published 66-page PDF.

SHA-256: `c6346dc8eff7ad1e01f3146e971bc7efd4dd73c6b149a51fba0a1a32aa63383c`.

Reading locators: §4.1, pp.38–41: cycle construction, Proposition 4.1.1 and its proof, Proposition 4.1.2 and its proof; p.40 inspected as rendered PDF.

<a id="source-hsieh-2014"></a>
### hsieh-2014

[Special values of anticyclotomic Rankin–Selberg L-functions](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/24.pdf). M.-L. Hsieh. Documenta Mathematica 19 (2014), 709–767.

SHA-256: `a662df673725f6abbdb5b3ee272e78973c125cbc5d6fd0ba9307c790e8070718`.

Reading locators: Introduction Hypothesis A, (ord), (sf), Theorem C, pp.710–713; Theorem 6.2 statement and initial proof, p.757; Theorem 7.1 statement and proof outline, pp.759–760; §7.4 proof, pp.763–764.

The published BDP17 author-hosted PDF provides Propositions 4.1.1–4.1.2 and their proofs. The scalar in its de Rham evaluation is (2√(−D_K))^u, while its rational correspondence pushforward contributes (Na)^u. This supplies the stated evaluation adapter; étale realization, lattice denominators and the separate CM-unit normalization remain obligations. Hsieh14 Theorem C, its hypotheses and the local-degree-one proof route were read directly.

The LV source used for exact Definition 2.1, Theorem 4.7 and Theorem 4.12 locators is arXiv:1605.03168 v1 (2016). The LV19 publisher endpoint returned an access page, the institutional manuscript endpoint returned HTTP 403, and the author publication page links v1. LV19 was not read or collated. No v1 theorem is relabelled as a version-of-record theorem, and no claim is made that it proves the auxiliary nonsplit/varying-weight extension.

## Expressible Lean subset

The suggested file has 183 lines, two real-bodied linear definitions, five named comparison milestones and eleven examples. It elaborates with the exact pinned Mathlib; its sixteen warnings are solely admitted proofs. It imports no Tau Ceti module, so this is a Mathlib-pin elaboration claim. No arithmetic implementation follows.

The linear definition `LinearChecks.etaOfOmega` realizes the scalar normalization API of GH.0 and checks unit pairing, inverse differential scaling and the zero-pairing boundary. `LinearChecks.positiveClass` realizes the positive-conductor branch with a parameter q=p^(2r−2), and checks q=0, weight two and the different weight-four value. The five named milestones cover the first conductor transition, repeated positive traces, one uniform inverse-limit denominator, torsion-safe primitive-character cancellation and the obstruction to specializing an inverted coefficient to zero. The remaining examples check actual quotient preimages, the root-sign slope and BDP17’s scalar direction.

All cycle, cohomology, local-regulator and family targets, including the twelve new arithmetic bridges, require supplier carriers unavailable at the pins. Their complete statements and definition contracts are retained in the layers above. The native AbelianVariety structure and existing linear algebra are cited where relevant; no artificial CM record or assumed regulator identity is used to make an arithmetic signature appear expressible.
