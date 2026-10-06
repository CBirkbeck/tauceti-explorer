# ER.1 — Chosen periods for elliptic regulators

This document supplements the accepted [EllipticRegulators packet](../packets/EllipticRegulators.json) for `EllipticRegulators:ER.1`, the analytic elliptic curve and its periods. Its task is to specify the choices carried from an elliptic curve to the regulator: an oriented integral basis, the ratio of its periods, the exponential modulus, conjugation at all field embeddings, and the normalized differential and primitive cycles consumed by ER.2. The corresponding [packet](../packets/EllipticRegulators--ER.1.json) records seven new targets. The [suggested file](../suggested/EllipticRegulators--ER.1.lean) gives their scalar signatures, API, and unit tests. All new declarations remain unchecked mathematical plans.

The geometric input belongs to its existing owners. `ModularCurvesPartII:R12.1` supplies analytic uniformisation with its group and differential compatibility. `ComplexComparisonPartII:C5` supplies the smooth proper de Rham–Betti comparison. `ComplexComparisonPartII:C6` supplies the elliptic Hodge line, polarized integral cohomology, and integration calculation. This implements the ownership correction in RT-AREA-ktheory-2/8. ER.1 consumes that calculation, and the elliptic matrix acceptance test of `PeriodsAndSpecialValues:PS.0` must consume the same C6 calculation. The packet proposes this reassignment for assembly; it does not edit another job's packet.

## Sources and conventions

The principal source is François Brunault, [*Valeur en 2 de fonctions L de courbes elliptiques*](https://arxiv.org/pdf/math/0602186v1), the 2005 thesis in arXiv version math/0602186v1, §1.2, pp.20–27. Equations (1.36)–(1.40) specify the additive and multiplicative presentations and the oriented integral periods. Remarque 20 fixes the real normalization, and Proposition 26 identifies the differential whose integral on the oriented neutral real component is one. The explicit matrix transport and the integral eigensublattice computations below are deductions from these conventions; they are not quotations of independently numbered source theorems.

For the regulator's anti-invariant cycles and number-field embeddings, use Tim Dokchitser, Rob de Jeu, and Don Zagier, [*Numerical verification of Beilinson's conjecture for K₂ of hyperelliptic curves*](https://arxiv.org/pdf/math/0405040v2), arXiv version math/0405040v2 of 4 May 2005, §3, especially (3.3)–(3.4) and Remark 3.14. The inspected source is this preprint. Remark 3.14 uses the disjoint union over every complex embedding and applies conjugation to the union. That convention matters even in genus one: one nonreal place consists of two embedding components.

Both public versions were read on 6 October 2026. Their version identifiers, checked passages, and SHA-256 hashes are in the packet. No source correction was needed for these passages. The source basis orientation was checked against the displayed integrals, including a visual check of Brunault p.22.

Let E be a smooth proper elliptic curve over ℂ, with origin and a nonzero invariant differential ω. Write H = H₁,sing(E(ℂ),ℤ) for actual integral singular homology. A positive basis (γ₁,γ₂) has intersection γ₁·γ₂ = +1 for the complex orientation. Put ωⱼ = ∫γⱼ ω, Λω = ℤω₁ + ℤω₂, τ = ω₂/ω₁, and q = exp(2πiτ). Positivity means Im τ > 0. The normalized coordinate is z/ω₁, with normalized lattice ℤ + τℤ. Complex conjugation of a scalar is written with a bar. Complex conjugation of a curve over a number field also conjugates its embedding and acts on singular cycles.

Over ℝ, take ω to be real and choose γ₁ as the positively oriented primitive cycle of the identity component of E(ℝ). Its nonzero real period ω₁ normalizes the differential. Reversing this chosen orientation reverses both vectors of an oriented basis; it preserves τ and q but negates the normalized additive coordinate and inverts its exponential. There is no choice of a universal Chern or Deligne factor in this layer. ER.2 owns the regulator convention and its factors of 2π.

## Imported geometry and the homology boundary

The accepted packet provides these three useful targets, cited by their existing IDs:

| Accepted target | Use here |
| --- | --- |
| `EllipticRegulators:ER.1/complex-uniformisation` | The normalized analytic isomorphism η : E(ℂ) → ℂ/(ℤ+τℤ), its differential pullback, and real normalization, subject to the genuine integral comparison input. |
| `EllipticRegulators:ER.1/the-q-parameter-and-the-multiplicative-presentation` | The presentation ℂ/(ℤ+τℤ) → ℂ×/qℤ by z ↦ exp(2πiz). |
| `EllipticRegulators:ER.1/all-embeddings-and-the-conjugation-action` | Base change at every actual embedding, the combined conjugation action, and ranks of the two eigenspaces. |

The parent's `periods-and-the-comparison-isomorphism` target mixes the foreign cohomological calculation with the period choices. It also leaves a comparison between a deck-group model and singular H₁ open. This supplement does not use its deck-group alias as singular homology. During assembly, its comparison portions are replaced by the C5/C6 imports and the following map-level contracts.

| Supplier | Exact input required by ER.1 |
| --- | --- |
| `ModularCurvesPartII:R12.1` | The analytic group uniformisation E(ℂ) ≃ ℂ/Λω and its compatibility with integration of ω. The current R12.1 part packet has no target in R12.1, so the request specifies the full interface. |
| `ComplexComparisonPartII:C5/repair-proper-de-rham-betti` | The existing node's smooth proper de Rham–Betti isomorphism after extending coefficients to ℂ. |
| `ComplexComparisonPartII:C5` | The integral integration map before complexification, with naturality under every field embedding and conjugation. This additional interface is requested explicitly; it does not follow merely from an abstract vector-space isomorphism. |
| `ComplexComparisonPartII:C6` | The elliptic Hodge line generated by ω, the actual integral map H → Λω, its bijectivity, its values on projected straight-line loops, and the compatibility of integration and the oriented intersection pairing. Its real and embedding naturality are part of this input. |
| `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent` | Integral singular homology of the two-torus, its coordinate-loop basis, and transport under integer matrices and homeomorphisms. |
| `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` | The integral intersection form with +1 on the positive coordinate loops, and its transformation under orientation-preserving and orientation-reversing maps. |

For λ in Λω, let ℓλ be the loop in ℂ/Λω obtained by projecting t ↦ tλ for 0 ≤ t ≤ 1. The required integration isomorphism sends [ℓλ] to λ. The real-linear coordinate map (s,t) ↦ sω₁+tω₂ identifies the period torus with a product of two circles; Stage 5 computes its actual singular homology, and R12.1 transports it to E(ℂ). C6 compares this transported integral basis with holomorphic integration. Thus the chain from H to Λω contains maps with specified values and specified inverses. Identifying both groups abstractly with ℤ² is insufficient to identify their generators, their conjugation action, or their regulator integrals.

This removes the need to plan a general Hurewicz theorem inside ER.1. The torus homology calculation and its naturality belong to the upstream AlgebraicTopology roadmap, while the elliptic specialization belongs to C6. The five supplier requests are precise boundaries of this complete planning pass. They are still open inputs, and ER.1 has coverage `planned`, not `closed`.

## What the pinned libraries supply

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit records the analytic elliptic geometry and the singular homology comparison as missing while identifying partial scalar, differential, and fundamental-group support. Each declaration below was checked by reading its statement at the recorded commit.

| Existing declarations | Role and limit |
| --- | --- |
| `PeriodPair`, `PeriodPair.lattice`, `PeriodPair.latticeBasis`, `PeriodPair.latticeEquivProd` | Two ℝ-independent complex periods, their actual ℤ-submodule, its ordered basis, and its ℤ² coordinates. `PeriodPair` itself does not impose positive orientation. |
| `UpperHalfPlane` | The type of complex numbers with positive imaginary part. |
| `Matrix.SpecialLinearGroup` | The existing group of determinant-one integer matrices, specialized to two indices. |
| `Function.Periodic.qParam`, `norm_qParam`, `norm_qParam_lt_one`, `qParam_ne_zero` | The exponential parameter, its exact norm, its strict bound for positive imaginary part, and its nonvanishing. These functions are used with period parameter 1. |
| `NumberField.ComplexEmbedding.conjugate`, `involutive_conjugate` | Conjugation of actual field embeddings and its involutivity. These are imported rather than planned again. |
| `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` | The signature identity r₁+2r₂ = [F:ℚ]. |
| `AddCircle.prodFundamentalGroupMulEquiv` | The fundamental group of a product of circles, with nonzero circle periods and basepoint lifts. It supplies π₁, not singular H₁. |
| `WeierstrassCurve.Affine.invariantDifferential` | The algebraic Kähler differential dx/(2y+a₁x+a₃). Its definition does not assert the analytic integration or comparison interfaces requested above. |

## Scalar period data and its use

`RegulatorPeriods` stores an existing `PeriodPair` and the inequality Im(ω₂/ω₁)>0. The geometric caller obtains its periods by integrating ω on the imported positive singular-homology basis. The scalar structure can also represent a square pair for tests; constructing it does not assert the existence of an elliptic curve with those periods. No curve, singular-homology carrier, comparison matrix, or assumed comparison theorem is stored in this structure.

This is the data used in Brunault's normalized uniformisation and in ER.2's differential normalization. ER.3 and ER.4 use the same additive coordinate and exponential modulus for orbit sums and divisor lifts. Multiplication of the differential by c ≠ 0 multiplies both periods and the unnormalized coordinate by c. Consequently τ is unchanged and (cz)/(cω₁) = z/ω₁. This dependence on simultaneous scaling is explicit: scaling the differential does not leave the unnormalized coordinate fixed.

All new declarations belong to the proposed module `TauCeti/NumberTheory/EllipticRegulator/Periods`. The scalar structure is `TauCeti.EllipticRegulator.RegulatorPeriods`, and its associated functions and theorems use that full namespace. The lists below give short names within it.

## 1. Chosen oriented periods for an elliptic regulator

Target: `EllipticRegulators:ER.1/oriented-regulator-period-data`.

Given the genuine integration map H1_sing(E(C),Z) → Lambda_omega imported from C6 and a positively oriented integral basis (gamma1,gamma2), set omega_j=integral_gamma_j omega. RegulatorPeriods consists of the existing Mathlib PeriodPair (omega1,omega2), together with Im(omega2/omega1)>0. It does not store an elliptic curve, homology, a comparison matrix or an assumed comparison theorem. Set tau=omega2/omega1 in UpperHalfPlane, q=qParam 1 tau and normalise(z)=z/omega1. A nonzero rescaling omega↦c omega gives scale(D,c) with both periods multiplied by c; tau and the normalised coordinate are independent of this differential choice when the unnormalised coordinate is also rescaled.

Declaration: `TauCeti.EllipticRegulator.RegulatorPeriods`.

Hypotheses:

- E is a smooth proper elliptic curve over C with origin and nonzero invariant differential omega.
- For number fields work separately at each actual embedding; the periods come from the imported integration map, never arbitrary assigned values.
- The pair is independent over R and the integral basis is positively oriented for the complex structure.

Construction or proof:

1. Import E(C), the group-compatible uniformisation and its differential compatibility from R12.1.
2. Use the Stage 5 torus singular-homology calculation and C6 integration compatibility to obtain the two periods from actual coordinate loops. The lattice map is integration, not a definition of H1 as the deck group.
3. Use C6’s polarized elliptic computation and the Stage 6 intersection sign to obtain Im(omega2/omega1)>0. Package exactly the PeriodPair and that inequality.
4. Define tau, q and normalise using existing library objects. Scaling the differential multiplies all its integrals by c, which cancels in the displayed ratios.

API:

| Name | Specification |
| --- | --- |
| `tau` | The upper-half-plane point omega2/omega1. |
| `q` | Evaluate the existing qParam with h=1 at tau. |
| `normalise` | The scalar coordinate z/omega1. |
| `square` | The period data with omega1=1, omega2=i. |
| `scale` | For c≠0 multiply both periods by c and retain positive orientation. |
| `ext` | Equality of both complex periods implies equality of the data, by proof irrelevance. |
| `tau_eq` | The underlying complex number of tau is omega2/omega1. |
| `q_eq` | q is exactly Function.Periodic.qParam 1 tau. |
| `normalise_eq` | normalise(z)=z/omega1. |
| `square_periods` | The square construction has first period 1 and second period i. |
| `scale_periods` | The first and second periods of scale(D,c) are c omega1 and c omega2. |
| `scale_tau` | The upper-half-plane point of scale(D,c) is tau(D). |
| `scale_normalise` | normalise(scale(D,c),c*z)=normalise(D,z). |

Unit tests:

- `test_square_tau` (computation): The square datum has tau=i.
- `test_square_q` (computation): The square datum has q=exp(-2*pi), as an exact real scalar in C.
- `test_scale_identity` (degenerate): Scaling by 1 returns the same data.
- `test_q_compatibility` (compatibility): q(D)=Function.Periodic.qParam 1 tau(D).
- `test_negative_orientation` (non-example): There is no RegulatorPeriods with periods (1,-i).

Acceptance:

- The square pair (1,i) is accepted; (1,-i) is rejected although it is a Mathlib PeriodPair.
- A lattice is the existing PeriodPair.lattice, with the existing latticeBasis and latticeEquivProd; no private lattice or H1 carrier is introduced.

Direct prerequisites: `mathlib:PeriodPair`, `mathlib:PeriodPair.lattice`, `mathlib:PeriodPair.latticeBasis`, `mathlib:PeriodPair.latticeEquivProd`, `mathlib:UpperHalfPlane`, `mathlib:Function.Periodic.qParam`, `ModularCurvesPartII:R12.1`, `ComplexComparisonPartII:C6`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:AddCircle.prodFundamentalGroupMulEquiv`, `tauceti:WeierstrassCurve.Affine.invariantDifferential`.

Source passages: Brunault.These.2005, Remarque 20, (1.40), p.22.

## 2. Transport of a chosen oriented integral period basis

Target: `EllipticRegulators:ER.1/oriented-basis-transport`.

For M=(a b;c d) in the existing SL2(Z), rebase(D,M) has periods (d*omega1+c*omega2,b*omega1+a*omega2). It retains the same integral lattice and positive orientation. Its tau is (a*tau+b)/(c*tau+d) and its normalized coordinate is normalise(D,z)/(c*tau+d). With this convention rebase(rebase(D,N),M)=rebase(D,M*N). These are the coordinate laws for the chosen-basis part of the parent normalised uniformisation; no new uniformisation is constructed.

Declaration: `TauCeti.EllipticRegulator.RegulatorPeriods.rebase`.

Hypotheses:

- D is RegulatorPeriods.
- M is an integral determinant-one matrix. Determinant-minus-one changes orientation and is excluded.

Construction or proof:

1. The integral change of basis is J*M*J on the column (omega1,omega2), where J swaps the coordinates. Its determinant is 1.
2. The inverse integral matrix proves equality of the two period spans.
3. The first new period is omega1*(c*tau+d), which is nonzero because tau is nonreal. Divide both new periods by it.
4. Compute Im(tau_new)=Im(tau)/norm(c*tau+d)^2>0. Matrix multiplication proves identity and composition.

API:

| Name | Specification |
| --- | --- |
| `rebase_periods` | The new ordered periods are (d*omega1+c*omega2,b*omega1+a*omega2). |
| `rebase_one` | Rebasing by the identity gives D. |
| `rebase_mul` | Rebasing first by N then by M equals rebasing by M*N. |
| `rebase_lattice` | The Mathlib PeriodPair lattice is unchanged. |
| `rebase_tau` | tau_new=(a*tau+b)/(c*tau+d). |
| `rebase_normalise` | normalise_new(z)=normalise(z)/(c*tau+d). |

Unit tests:

- `test_rebase_identity` (degenerate): Rebasing by the identity gives D.
- `test_rebase_inverse` (characterisation): Rebasing by M and then by its inverse recovers D.
- `test_rebase_integral_lattice` (compatibility): Rebasing preserves the exact Mathlib Z-submodule of C.
- `test_rebase_minus_identity` (non-example): Rebasing by -I fixes tau but negates normalise(1).

Acceptance:

- T=(1 k;0 1) gives tau+k, the same normalized coordinate and the same q.
- S=(0 -1;1 0) gives -1/tau and divides the coordinate by tau.
- Minus the identity fixes tau and sends the coordinate to its negative; it must not act trivially on coordinates.

Direct prerequisites: `EllipticRegulators:ER.1/oriented-regulator-period-data`, `mathlib:Matrix.SpecialLinearGroup`, `mathlib:PeriodPair.lattice`, `EllipticRegulators:ER.1/complex-uniformisation`.

Source passages: Brunault.These.2005, (1.36) and Remarque 20, (1.40), pp.21–22.

The apparently reversed entries of the period matrix fix the convention unambiguously. If M = (a b; c d), then the column of periods transforms by JMJ = (d c; b a), where J interchanges the two coordinates. Applying N followed by M therefore gives (JMJ)(JNJ) = J(MN)J. This explains the order in `rebase_mul`; exchanging it changes the result for noncommuting matrices. The denominator cτ+d cannot vanish because τ has positive imaginary part. These conventions agree with the fractional-linear action in the inherited normalized uniformisation.

## 3. Oriented period data at a conjugate embedding

Target: `EllipticRegulators:ER.1/conjugate-oriented-periods`.

Conjugate(D) has periods (conj(omega1),-conj(omega2)). It is oriented, involutive, and has tau_bar=-conj(tau), q_bar=conj(q). Its normalise(conj(z)) equals conj(normalise(z)), and its existing Mathlib lattice is the complex conjugate of the original lattice. Geometrically at a pair of distinct conjugate embeddings choose gamma1_bar=c_*gamma1 and gamma2_bar=-c_*gamma2. At a real embedding these are generally a different basis of the same curve: for the half-integral real shape tau_bar=tau-1. They are not asserted to be the same chosen basis.

Declaration: `TauCeti.EllipticRegulator.RegulatorPeriods.conjugate`.

Hypotheses:

- D is RegulatorPeriods; coefficient conjugation and the antiholomorphic base-change map are those of the parent all-embeddings node.
- The sign on the second basis vector compensates for orientation reversal.

Construction or proof:

1. Conjugation reverses complex orientation. Negation of the second vector restores it, since Im(-conj(tau))=Im(tau).
2. Complex conjugation of the integration pairing is imported from C6 and the parent all-embeddings node.
3. Compute both period ratios and normalized coordinates. Use the existing exponential definition to compute q(-conj(tau))=conj(q(tau)).
4. Negation of one integral lattice generator does not change its span. Conjugating twice returns the original two periods.

API:

| Name | Specification |
| --- | --- |
| `conjugate_periods` | The periods are (conj(omega1),-conj(omega2)). |
| `conjugate_involutive` | Applying conjugate twice returns D. |
| `conjugate_tau` | tau(conjugate(D))=-conj(tau(D)). |
| `conjugate_q` | q(conjugate(D))=conj(q(D)). |
| `conjugate_normalise` | normalise(conjugate(D),conj(z))=conj(normalise(D,z)). |
| `conjugate_lattice` | z belongs to the conjugate period lattice iff conj(z) belongs to the original Mathlib lattice. |

Unit tests:

- `test_conjugate_square` (computation): The square pair is fixed.
- `test_conjugate_twice` (degenerate): Conjugate is an involution.
- `test_conjugate_scalar` (compatibility): Conjugate(scale(D,c))=scale(conjugate(D),conj(c)).
- `test_conjugate_not_lower_half_plane` (non-example): Im(tau(conjugate(D)))>0; using the naive conjugate tau gives the wrong half-plane.

Acceptance:

- Conjugating the square pair returns it.
- Conjugating a scaled pair conjugates the scale as well.
- The conjugate datum lies in the upper, not lower, half-plane.

Direct prerequisites: `EllipticRegulators:ER.1/oriented-regulator-period-data`, `EllipticRegulators:ER.1/all-embeddings-and-the-conjugation-action`, `mathlib:NumberField.ComplexEmbedding.conjugate`, `ComplexComparisonPartII:C6`.

Source passages: Brunault.These.2005, Remarque 20 and (1.40), p.22; DJZ.2005v2, Remark 3.14, Section 3, p.7.

For a curve over a number field F, use σ : F → ℂ and its existing conjugate embedding σ̄. The comparison's naturality gives ∫c*γ ωσ̄ = conjugate(∫γ ωσ). Since c reverses orientation, the basis (c*γ₁,−c*γ₂) is positive. Its periods are precisely the pair in `conjugate`. The supporting signature `TauCeti.EllipticRegulator.paired_embedding_period_q` combines `conjugate_tau` and `conjugate_q` when the two data satisfy this relation. It asserts a consequence of the supplied relation, not a geometric construction of base change.

At a real embedding σ = σ̄, the real-adapted basis is retained. In the half-integral case, −conjugate(τ) = τ−1, so conjugating the oriented pair gives a different basis of the same lattice. It does not follow that the chosen datum is fixed merely because the embedding is real. The modulus is nevertheless unchanged because q is real and the shift by an integer has trivial exponential.

## 4. Real-adapted periods and the sign of q

Target: `EllipticRegulators:ER.1/real-period-shape`.

For D with conj(omega1)=omega1 and conj(omega2)=-omega2+m*omega1, m an integer, 2*Re(tau)=m. In a real-adapted oriented basis with gamma1 primitive in H1^+, the integral replacement gamma2↦gamma2+k*gamma1 changes m by 2k. Choose m=0 or 1; then Re(tau)=0 or 1/2 respectively. In the first case q=exp(-2*pi*Im(tau))>0; in the second q=-exp(-2*pi*Im(tau))<0. Both have imaginary part zero and 0<norm(q)<1. Existence of the real-adapted basis is the parent real-normalisation input, not a new elliptic Hodge theorem.

Named declarations: `real_period_shape`, `real_q_sign`.

Hypotheses:

- The real assertions concern an elliptic curve over R and a real nonzero invariant differential.
- gamma1 is the primitive positive generator of the conjugation-fixed integral sublattice, not an arbitrary real multiple.
- The shape formula for general D assumes the displayed conjugation relation; m is an integer.

Construction or proof:

1. Conjugation reverses orientation, fixes gamma1 and acts by -1 on the quotient by its fixed sublattice; use C6’s elliptic pairing to obtain the displayed integral relation.
2. Divide the relation by the real nonzero omega1 and take real parts.
3. Reduce m modulo 2 by the stated integral basis shear; its parity is unchanged.
4. Evaluate the existing exponential at tau=i*y or tau=1/2+i*y. Its phase is 1 or -1; use qParam_ne_zero and norm_qParam_lt_one.

Acceptance:

- For periods (1,i), m=0 and q=exp(-2*pi).
- For periods (1,1/2+i), m=1 and q=-exp(-2*pi); a real curve need not have positive q.
- Reversing the orientation of E(R) negates both basis vectors, preserves tau and q and inverts the multiplicative point coordinate.

Direct prerequisites: `EllipticRegulators:ER.1/oriented-regulator-period-data`, `EllipticRegulators:ER.1/complex-uniformisation`, `ComplexComparisonPartII:C6`, `mathlib:Function.Periodic.norm_qParam`, `mathlib:Function.Periodic.norm_qParam_lt_one`, `mathlib:Function.Periodic.qParam_ne_zero`.

Source passages: Brunault.These.2005, Remarque 20, (1.40)–(1.41), p.22.

## 5. Primitive real regulator cycles and their index

Target: `EllipticRegulators:ER.1/primitive-real-regulator-cycles`.

In the real-adapted ordered integral basis with m=0 or 1, conjugation sends (u,v) to (u+m*v,-v). Its positive integral eigensublattice is Z*(1,0). For m=0 its negative integral eigensublattice is Z*(0,1), with normalized period i*Im(tau). For m=1 it is Z*(-1,2), with normalized period 2*i*Im(tau). The sum of the two integral eigensublattices is the whole Z^2 for m=0 and is the subgroup of pairs with even second coordinate, of index two, for m=1. Over R both eigenspaces have dimension one. The rational anti-eigenvector (-1/2,1) in the m=1 case is not an integral generator.

Named declarations: `real_conjugation_coordinates`, `positive_cycle_coordinates`, `negative_cycle_coordinates_zero`, `negative_cycle_coordinates_one`, `negative_cycle_period_zero`, `negative_cycle_period_one`, `eigensublattice_index_two`.

Hypotheses:

- The integral singular-period identification and orientation are supplied by C6 and the upstream torus homology/intersection inputs.
- m is reduced to 0 or 1, and the displayed conjugation relation holds.

Construction or proof:

1. Conjugate u*omega1+v*omega2 using the real period relation.
2. Solve (u+m*v,-v)=(u,v), which forces v=0.
3. Solve (u+m*v,-v)=(-u,-v), namely 2u+m*v=0: for m=0 use (0,1), for m=1 use (-1,2). These vectors are primitive.
4. The determinant of the two eigen-generators is 1 or 2. In the second case their span is exactly the pairs with even v.
5. Divide their actual periods by omega1. The real part cancels, giving i*y or 2*i*y.

Acceptance:

- The half-integral real shape has an integral anti-cycle with twice the normalized imaginary period, not i*y.
- An anti-invariant functional vanishes on gamma1; evaluation on the negative generator is twice its evaluation on gamma2 when m=1.
- Use exact integral kernels rather than substituting a direct-sum decomposition over Z.

Direct prerequisites: `EllipticRegulators:ER.1/oriented-regulator-period-data`, `ComplexComparisonPartII:C6`, `mathlib:PeriodPair.latticeEquivProd`.

Source passages: Brunault.These.2005, Remarque 20, p.22 and (1.48), p.23; DJZ.2005v2, Section 3, paragraph before (3.4), p.5.

The coordinate involution has matrix (1 m; 0 −1). Its negative kernel is the integral equation 2u+mv=0. For m=1, divisibility forces v to be even, and the generator is (−1,2). The two eigen-generators have determinant two; their sum is therefore not an integral direct-sum decomposition of the full homology lattice. It is a direct sum after tensoring with ℝ. An anti-invariant real functional α satisfies α(γ₁)=0 and α(−γ₁+2γ₂)=2α(γ₂), which is the factor ER.2 needs when its domain is the primitive integral anti-cycle. This conclusion uses the imported homology-to-period map to identify cycles with the displayed lattice coordinates.

## 6. Conjugation in multiplicative period coordinates

Target: `EllipticRegulators:ER.1/exponential-conjugation-coordinates`.

For every z in C, qParam 1 (conj(z))=1/conj(qParam 1 z), and qParam 1 (-z)=1/qParam 1 z. These are point-coordinate identities, distinct from the modulus identity q(-conj(tau))=conj(q(tau)). Hence, in the inherited multiplicative presentation, conjugation from E_sigma to E_sigma_bar is [x]↦[1/conj(x)], between the quotients with moduli q and conj(q). This is well-defined because q^n maps to conj(q)^(-n). In the real-normalized case it is an involution on the same quotient. A representative of modulus one is fixed; the second fixed circle for positive real q is fixed in the quotient, rather than pointwise before quotienting.

Named declarations: `exponential_conjugate`, `exponential_neg`.

Hypotheses:

- Use the inherited exponential-induced group presentation; x is nonzero.
- The paired embedding modulus is conj(q); real moduli include both signs.

Construction or proof:

1. Conjugate exp(2*pi*i*z), observing that conjugation sends i to -i.
2. Use exp(-w)=1/exp(w), so both displayed identities are exact.
3. For a q^n multiple compute its image as a conj(q)^(-n) multiple; invoke the parent quotient presentation.
4. When q>0 and norm(x)^2=q, 1/conj(x)=x/q, so equality is a quotient equality.

Acceptance:

- At z=i/2, conjugation changes exp(-pi) to exp(pi); it does not merely conjugate exp(-pi).
- For positive q and norm(x)^2=q, the images differ by q^(-1) before quotienting.
- Orientation reversal gives inversion [x]↦[1/x].

Direct prerequisites: `EllipticRegulators:ER.1/the-q-parameter-and-the-multiplicative-presentation`, `mathlib:Function.Periodic.qParam`.

Source passages: Brunault.These.2005, (1.36)–(1.37), p.21; Remarque 20, p.22.

## 7. Normalized differential and period handoff to the regulator

Target: `EllipticRegulators:ER.1/regulator-period-handoff`.

For the inherited normalized uniformisation eta and the chosen period datum D, the normalized holomorphic differential is omega/omega1=eta^*dz, with integrals 1 and tau on gamma1 and gamma2. The existing qParam gives the same nonzero modulus q with norm less than one. For E over R, gamma1 is the positive primitive real cycle and integral_gamma1(omega/omega1)=1. For E over a number field carry this statement at every embedding, with conjugation acting simultaneously on coefficients, the curve and its homology; the conjugate-oriented construction supplies compatible bases for pairs of nonreal embeddings. The parent all-embeddings comparison gives rank(H1^±)=r1+2*r2=[F:Q], not r1+r2. The primitive negative cycles specified here fix the period-coordinate convention for ER.2. No universal Chern/Deligne factor, including its 2*pi, is chosen here.

Named declarations: `regulator_period_handoff`.

Hypotheses:

- All curves, differential comparisons and integration maps are the imported geometric ones.
- At a real embedding use a real-adapted basis. At distinct conjugate embeddings choose gamma1_bar=c_*gamma1 and gamma2_bar=-c_*gamma2.
- The rank statement uses the disjoint union over all embeddings, not the set of infinite places.

Construction or proof:

1. Apply the parent normalized-uniformisation pullback formula and divide the actual period integrals by omega1.
2. Use the existing qParam nonvanishing and norm theorem, with Im(tau)>0.
3. For each conjugate pair apply the constructed conjugate period basis; at a real embedding use its real-adapted basis and primitive negative cycle calculation.
4. Import the parent all-embeddings rank statement and its Mathlib number-field identity. The disjoint union has total rank 2*[F:Q], and each sign has rank [F:Q].

Acceptance:

- The positive period is exactly 1; an unspecified nonzero period is insufficient.
- For the half-integral real shape the primitive negative-cycle period is 2*i*Im(tau).
- A complex pair contributes two real dimensions to each eigenspace, not one.

Direct prerequisites: `EllipticRegulators:ER.1/oriented-regulator-period-data`, `EllipticRegulators:ER.1/complex-uniformisation`, `EllipticRegulators:ER.1/all-embeddings-and-the-conjugation-action`, `EllipticRegulators:ER.1/primitive-real-regulator-cycles`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, `ComplexComparisonPartII:C5`, `ComplexComparisonPartII:C6`, `mathlib:Function.Periodic.norm_qParam_lt_one`, `mathlib:Function.Periodic.qParam_ne_zero`, `mathlib:NumberField.ComplexEmbedding.conjugate`, `mathlib:NumberField.ComplexEmbedding.involutive_conjugate`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`.

Source passages: Brunault.These.2005, Proposition 26, (1.64), p.26; Remarque 20, (1.40), p.22; DJZ.2005v2, Remark 3.14, Section 3, p.7.

## Layer acceptance and planet selection

The acceptance path starts with the supplier maps on actual singular homology, evaluates both coordinate loops, and checks the positive intersection sign. It then packages the periods in `RegulatorPeriods`, normalizes the first period to one, and applies the q-parameter already in Mathlib. Acceptance includes both real shapes, (1,i) and (1,1/2+i); they have opposite q signs and distinct primitive anti-cycle periods. Basis tests include translation, inversion, and minus the identity so that a correct modulus does not conceal an incorrect coordinate sign. Conjugation tests separate the modulus from the exponential coordinate of a point, and separate a real embedding from a pair of distinct conjugate embeddings.

For a number field, the inherited disjoint-union statement has total first-homology rank 2[F:ℚ]. Each real embedding contributes rank one to each sign. Each conjugate nonreal pair contributes rank two to each sign. The rank of each eigensublattice is consequently r₁+2r₂, equal to [F:ℚ]. Choosing one component per nonreal place and counting r₁+r₂ would lose part of the regulator domain. The integral index-two phenomenon at a real place is compatible with these rank statements; equality of ranks does not imply equality of integral sublattices.

The layer's six planets are **Oriented period basis**, **Change of period basis**, **Conjugate periods**, **Real period normalization**, **Primitive regulator cycle**, and **Normalized invariant differential**. They are the source objects and central constructions needed by the regulator. The exponential identities support their use but receive no seventh planet.

## Prototype and coverage boundary

The suggested file imports individual modules for the existing Mathlib objects. Every new scalar definition, its 25 API items, and its 13 unit tests has a signature there. The named scalar consequences of the four theorem targets also have signatures. The actual elliptic singular integration map, differential pullback, and base-change maps require the supplier interfaces specified above. Their exact mathematical requirements remain in the packet and this document; the suggested file omits those unavailable geometric conditions rather than encoding them as assumed proposition fields. Its scalar signatures do not prove geometric comparison.

This pass is complete at target granularity. ER.1 is planned, with zero unowned gaps and five explicit supplier requests. It becomes closed when R12.1 supplies analytic uniformisation, C5/C6 supply natural integral integration and the elliptic Hodge computation, and the upstream singular-homology and intersection interfaces are connected through those maps. The assembly must also replace the parent's mixed comparison target and route PS.0's elliptic test to C6. ER.1's retained mathematics then consists exactly of period choices, coordinate transport, q, conjugation, and the normalized period data used by ER.2.
