# Analytic toric geometry, Part II: arithmetic toroidal compactifications

## C6 — Hilbert and modular specializations

This is a partial blueprint for the Koecher and boundary-coefficient slice of C6. It extends [Analytic toric geometry](../../../content/tau-ceti/AnalyticToricGeometry/README.md), the first prerequisite required by accepted RS-32. Its finite cone, lattice and toric vocabulary is reused through C0. C4 imports local Raynaud uniformization from NeronModelsAndSemistableAbelianVarieties:R11.3 and supplies the additional relative cusp geometry. Neither a new fan carrier nor a new Hilbert moduli or automorphic-bundle carrier is defined here.

The reviewed AUDIT-10 entry for C6 has no existing geometric Hilbert compactification, polarization quotient, Hasse-ideal comparison or Koecher theorem. Analytic GL₂ cusp forms and the level-one constant-term criterion are useful baseline cases, but they do not supply the geometric boundary ideal. Pinned Mathlib already has the unit-theoretic input to the Koecher proof. This packet adds its finite-index cusp application and coefficient argument, with the actual geometric suppliers still explicit.

## Objects and conventions

F is a totally real number field. Its signed real embeddings are τ_w; the native infinite-place value w(x) is |τ_w(x)|. Total positivity uses the existing Tau Ceti predicate and is strict. The permitted Fourier support is X₊ ∪ {0}; the zero exponent is separate. The degree hypothesis in Koecher is [F:ℚ]>1.

The H1 and H3 suppliers retain the actual fractional ideals, trace dual f*=f⁻¹d⁻¹, level cusp b⊂b′ and exponent lattice X=cbb′. The finite-index subgroup U⊂(O_F)× consists of cusp stabilizer pairs (u,1), and acts by ξ↦u²ξ. This subgroup is neither the translation lattice nor the finite cyclotomic quotient. The source’s ramified level cusp means b′≠b; it does not refer to a base prime dividing the discriminant.

A scalar coefficient function a:F→R is obtained only after the actual invertible coefficient line is trivialized and the X-indexed expansion is extended by zero. The covariance scalars lie in R×. No ring of arbitrary coefficient functions is called a completed toric ring: its support topology and the Fourier realization are separate requests.

For the geometric targets take the source’s level n prime to the discriminant and dividing neither (2) nor (3), polarization ideal c prime to n, a regular admissible fan finite modulo the cusp unit group, and a Noetherian o′[1/Δ]-algebra R, Δ=N(dn), with the specified weight and polarization-descent values. Cyclotomic cusp covers and local line trivializations remain explicit. The toroidal construction in Theorem 7.2 is over ℤ[1/N(n)]; the smooth Hodge-line and Koecher slice used here inverts Δ. Arbitrary-prime ordinary and Hasse geometry remains a separate H2-dependent target.

On a regular rank-r cusp chart the boundary **union** is the product ideal (x₁⋯x_r). A sum ideal (x₁,…,x_r) cuts out the intersection of those divisors. The completion is formed over the chosen R. No tensor/completion interchange or geometric-point test for nilpotent sections is assumed.

## Arithmetic declarations and geometric targets

### A contracting unit in a cusp subgroup

**Identifier:** ShimuraCompactifications:C6/finite-index-cusp-unit-contraction. **Suggested declaration:** TauCeti.HilbertCusp.finiteIndex_unit_contracts_away.

If U has finite index and F has more than one infinite place, then for each w₀ there is u∈U with |τ_w₀(u)|>1 and |τ_w(u)|<1 for every w≠w₀.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. The cardinality hypothesis is equivalent to [F:Q]>1 in this totally real setting.

Proof plan:

1. Apply the pinned Dirichlet exists_unit theorem at w₀ to obtain v whose other absolute values have negative logarithms.
2. Use positivity of unit absolute values and the logarithmic product formula, with all multiplicities equal to one. There is at least one other place, so the logarithm at w₀ is strictly positive.
3. Apply the finite-index positive-power theorem to v. Raising all absolute values to this positive power preserves the strict inequalities and produces an element of U.

Acceptance:

- Over Q every integer unit has absolute value one, so the degree assumption cannot be removed.
- For a principal cusp-unit subgroup, use its actual finite index from H3; no logarithmic density of a discrete lattice is asserted.

Dependencies: mathlib:NumberField.Units.dirichletUnitTheorem.exists_unit, mathlib:NumberField.Units.sum_mult_mul_log, mathlib:NumberField.Units.pos_at_place, mathlib:NumberField.IsTotallyReal.mult_eq, mathlib:Subgroup.exists_pow_mem_of_index_ne_zero.

Source: Dimitrov, Theorem 8.3, pp. 23–24 (author copy printed p. 547). Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

### A negative embedding of a nonpositive exponent

**Identifier:** ShimuraCompactifications:C6/negative-cusp-exponent. **Suggested declaration:** TauCeti.HilbertCusp.exists_negative_embedding.

If ξ∈F is nonzero and is not totally positive, then τ_w(ξ)<0 for some infinite place w.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.

Proof plan:

1. Negate the existing universal strict-positivity predicate to obtain τ_w(ξ)≤0.
2. A field embedding is injective, so ξ≠0 implies τ_w(ξ)≠0; hence the inequality is strict.

Acceptance:

- ξ=0 has no negative embedding and must be excluded.
- A nonzero element cannot have a zero real conjugate.

Dependencies: tauceti:NumberField.isTotallyPositive_iff.

Source: Dimitrov, Theorem 8.3, pp. 23–24 (author copy printed p. 547). Corrects the omitted exclusion of exponent zero in the printed contradiction argument; see E1.

### Unbounded negative trace along cusp units

**Identifier:** ShimuraCompactifications:C6/negative-trace-orbit. **Suggested declaration:** TauCeti.HilbertCusp.negative_trace_orbit_unbounded.

Let U have finite index, [F:Q]>1, ξ≠0 not totally positive, and y_w>0 for every w. For every real B there is u∈U with Σ_w τ_w(u²ξ)y_w<B.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. The y_w form a vector of the open positive dual cone. It need not itself be a field element.

Proof plan:

1. Choose a negative embedding w₀ by negative-cusp-exponent and a unit v∈U contracting at all other places by finite-index-cusp-unit-contraction.
2. For u=v^n, the w₀ summand is τ_w₀(ξ)y_w₀|τ_w₀(v)|^(2n), tending to negative infinity.
3. At every other place |τ_w(v)|^(2n) tends to zero. The finite sum of these terms tends to zero. Therefore the whole sum is less than any prescribed B for sufficiently large n.

Acceptance:

- For Q the orbit of ξ=−1 under integer-unit squares is the singleton {−1}.
- ξ=0 has identically zero pairing; no unboundedness conclusion applies.
- For Q(√2), ξ=−√2, v=1+√2 and y=(1,1), the first positive n already gives a negative trace; positive powers continue to negative infinity.

Dependencies: ShimuraCompactifications:C6/negative-cusp-exponent, ShimuraCompactifications:C6/finite-index-cusp-unit-contraction, mathlib:tendsto_pow_atTop_atTop_of_one_lt, mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one.

Source: Dimitrov, Theorem 8.3, pp. 23–24 (author copy printed p. 547). Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

### Nonzero coefficients survive unit transport

**Identifier:** ShimuraCompactifications:C6/coefficient-unit-orbit. **Suggested declaration:** TauCeti.HilbertCusp.coefficient_ne_zero_on_unit_orbit.

For a commutative ring R, a:F→R, multipliers c:U×F→R× and covariance a(u²ξ)=c(u,ξ)a(ξ), one has a(u²ξ)≠0 if and only if a(ξ)≠0.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. No reducedness, domain, characteristic-zero, or nontriviality condition on R.

Proof plan:

1. Rewrite using the stated covariance.
2. Apply Units.mul_right_eq_zero and negate the equivalence. No division by a nonunit or by the coefficient is used.

Acceptance:

- In Z/4, multiplication by the nonunit 2 kills the nonzero coefficient 2; the unit condition is essential.
- A root of unity and a unit-valued weight character remain units after any coefficient-ring map, even if their reductions equal one.

Dependencies: mathlib:Units.mul_right_eq_zero.

Source: Dimitrov, Fourier transformation law preceding Theorem 8.3, p. 23; author copy p. 546. The scalar unit consequence of the actual Fourier transformation law; the lattice and line trivialization are supplier obligations.

### Koecher support for coefficient families

**Identifier:** ShimuraCompactifications:C6/bounded-cusp-support. **Suggested declaration:** TauCeti.HilbertCusp.bounded_cusp_support_is_positive.

Let [F:Q]>1, U have finite index, and a:F→R satisfy unit-valued covariance as in coefficient-unit-orbit. Suppose some y_w>0 and B∈ℝ satisfy B≤Σ_w τ_w(ξ)y_w whenever a(ξ)≠0. Then every nonzero coefficient is indexed by ξ=0 or by a totally positive ξ.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. A coefficient family alone is not a convergent or completed formal series.

Proof plan:

1. Suppose a nonzero coefficient has ξ≠0 not totally positive.
2. Apply negative-trace-orbit with the given y and B, obtaining u∈U with pairing strictly below B.
3. The coefficient at u²ξ is nonzero by coefficient-unit-orbit, contradicting the support lower bound.

Acceptance:

- The constant family supported only at zero is permitted. Koecher does not imply cuspidality.
- The conclusion allows torsion and nilpotents in the coefficient ring because only multiplication by units was cancelled.
- A geometric application must supply the support bound; it is not assumed from the notation for a formal series.

Dependencies: ShimuraCompactifications:C6/negative-trace-orbit, ShimuraCompactifications:C6/coefficient-unit-orbit.

Source: Dimitrov, Theorem 8.3, pp. 23–24 (author copy printed p. 547). Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

### Positive exponents vanish on every boundary ray

**Identifier:** ShimuraCompactifications:C6/positive-exponents-on-charts. **Suggested declaration:** TauCeti.HilbertCusp.positive_exponent_pairs_pos.

If ξ is totally positive and v=(v_w) is nonzero with all v_w≥0, then Σ_w τ_w(ξ)v_w>0. In an integral Hilbert cusp chart, its pairing with each primitive nonzero boundary ray is therefore a strictly positive integer.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. For the final interpretation ξ belongs to the character lattice X and the ray belongs to its integral dual; lattice integrality is imported from C0/H1.

Proof plan:

1. All summands are nonnegative. Since v is nonzero, at least one coordinate is strictly positive.
2. Its product with the corresponding strictly positive conjugate of ξ is positive, so the finite sum is positive.
3. Use the character/cocharacter integral pairing to interpret the result as a positive coordinate exponent.

Acceptance:

- The zero dual vector gives zero and must be excluded.
- For ξ=1 and every y_w>0 the pairing is positive.
- On a regular chart, positivity at each of its r rays implies divisibility of the monomial by the product x₁⋯x_r.

Dependencies: tauceti:NumberField.isTotallyPositive_iff, mathlib:Finset.sum_pos_iff_of_nonneg, ShimuraCompactifications:C0/relative-regular-coordinates, HilbertModularVarietiesAndShimuraCurves:H1.

Source: Dimitrov, §2 toric coordinates, pp. 5–6, and Theorem 8.3, pp. 23–24. Elementary positivity consequence used to identify the Hilbert boundary ideal; generic toric coordinate construction remains in C0.

### The annihilator of a constant coefficient

**Identifier:** ShimuraCompactifications:C6/constant-term-covariance. **Suggested declaration:** TauCeti.HilbertCusp.constant_coefficient_annihilated.

Under a(u²ξ)=c(u,ξ)a(ξ) with c(u,ξ)∈R×, every u satisfies (c(u,0)−1)a(0)=0. For Dimitrov’s actual weight law the root-of-unity phase at zero is one.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. R is any commutative ring; the scalar formula is written after a local trivialization of the invertible coefficient line.

Proof plan:

1. Set ξ=0 in the transformation law, since u²·0=0.
2. Subtract a(0); distributivity yields the annihilation relation.

Acceptance:

- This does not conclude a(0)=0 over a ring with zero divisors.
- For the trivial character, every a(0) satisfies the relation.

Dependencies: ShimuraCompactifications:C6/coefficient-unit-orbit.

Source: Dimitrov, Proposition 8.5(iii), p. 24; author copy printed p. 548. The explicit ring-valued equality underlying the source’s zero-divisor formulation.

### Constant-term vanishing with a regular multiplier

**Identifier:** ShimuraCompactifications:C6/constant-term-vanishing. **Suggested declaration:** TauCeti.HilbertCusp.constant_coefficient_eq_zero.

If, for some u, multiplication by c(u,0)−1 on R has zero kernel, then the covariance relation forces a(0)=0.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. The zero-kernel hypothesis is required; c(u,0)≠1 alone is insufficient for a general coefficient ring.

Proof plan:

1. Apply constant-term-covariance at the selected u.
2. Apply the zero-kernel hypothesis to a(0).

Acceptance:

- In Z/4, the unit 3 differs from 1 and fixes the nonzero coefficient 2. Thus the nontrivial-character argument valid over a field does not apply to every R.
- Over a field, any multiplier different from one supplies the zero-kernel hypothesis.

Dependencies: ShimuraCompactifications:C6/constant-term-covariance.

Source: Dimitrov, Proposition 8.5(iii), p. 24; author copy printed p. 548. Coefficient-sensitive consequence; no assertion that every nonparallel character remains nontrivial modulo a prime.

### A pole bound on a Hilbert cusp chart

**Identifier:** ShimuraCompactifications:C6/meromorphic-cusp-support-bound. **Suggested declaration:** TauCeti.HilbertCusp.meromorphic_cusp_support_bound.

Under the stated Hilbert geometric hypotheses, a section of ω^κ over the open part of a completed regular cusp chart, which has finite pole order along its boundary, has Fourier support bounded below under every y in that cone. More explicitly, after a character-compatible local trivialization, write it as t^(−m)g, where t=x₁⋯x_r, m≥0, and g lies in the t-adic completed chart ring. Then a(ξ)≠0 implies ⟨ξ,y⟩≥−mΣ_i⟨m_i,y⟩, with m_i the r polynomial coordinate characters.

Hypotheses: Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here. The completion and localization are formed over R; an unproved interchange of completion with arbitrary tensor products is not used. The coefficient description of this completion and the meromorphic representation are requested generic inputs.

Proof plan:

1. Import the C0 regular coordinate identification and the boundary-union ideal (t). Complete that R-algebra and use its proven admissible coefficient expansion.
2. Every exponent of g has nonnegative pairing with y in the cone; the Laurent coordinates pair to zero.
3. Multiplication by t^(−m) translates the support by −mΣ_i m_i. Coefficient injectivity yields the stated lower bound.

Acceptance:

- For r=1 this is the usual lower bound on Laurent-series exponents.
- The union of coordinate boundary divisors is cut out by their product, whereas the sum ideal defines their intersection.
- The empty boundary chart r=0 is excluded from boundary-completion detection.

Dependencies: ShimuraCompactifications:C0/relative-regular-coordinates, ShimuraCompactifications:C0/relative-boundary-coordinates, ShimuraCompactifications:C4, AdicSpacesPartII:F0, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H3.

Source: Dimitrov, §2, p. 5, and Theorem 8.3 proof, pp. 23–24. Hilbert specialization of imported completed-coordinate algebra; not a new generic completion theorem.

### Positive support of meromorphic Hilbert expansions

**Identifier:** ShimuraCompactifications:C6/hilbert-cusp-positive-support. **Suggested declaration:** TauCeti.HilbertCusp.hilbert_cusp_support_positive.

Under the Hilbert geometric hypotheses, every unit-equivariant meromorphic cusp expansion of an open Hilbert modular form has support contained in X_+∪{0}, where X=cbb′ is the actual character lattice at that cusp.

Hypotheses: Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here. The finite-index subgroup U consists of the stabilizer pairs (u,1); its action preserves X. Its weight and cyclotomic multipliers are units. The coefficient family on X is extended by zero to F.

Proof plan:

1. Use H3’s exact stabilizer congruences and finite-index assertion; use H1’s lattice and trace dictionary, including the distinction between b and b′.
2. Choose an open positive dual vector y. Completeness of the admissible fan puts y in a cone, without asserting that the whole fan is finite.
3. Apply meromorphic-cusp-support-bound on that cone.
4. In a local trivialization of the coefficient line, apply bounded-cusp-support. The result is independent of the trivialization because its transition scalars are units.

Acceptance:

- Both unramified level cusps (b′=b) and ramified level cusps (b′≠b) retain their actual exponent lattice.
- Ramification of a level cusp does not mean a base prime dividing the field discriminant.
- No finite flatness of a full p-adic tower is inferred from the finite cusp cyclotomic cover.

Dependencies: ShimuraCompactifications:C6/meromorphic-cusp-support-bound, ShimuraCompactifications:C6/bounded-cusp-support, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H3, ShimuraCompactifications:C0, ShimuraCompactifications:C4, ShimuraCompactifications:C5.

Source: Dimitrov, Theorem 8.3, pp. 23–24 (author copy printed p. 547). Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

### Arithmetic Koecher extension

**Identifier:** ShimuraCompactifications:C6/arithmetic-koecher. **Suggested declaration:** TauCeti.HilbertCusp.arithmetic_koecher.

Under the Hilbert geometric hypotheses, restriction along j:M_R→M̄_Σ,R is an isomorphism Γ(M̄_Σ,R,ω^κ)→Γ(M_R,ω^κ). This packet states the Noetherian coefficient case and retains the actual model, level, discriminant and descent hypotheses.

Hypotheses: Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here. Generic coherent formal detection and passage from an open section to a finite-pole section must be supplied with their precise Noetherian and schematic-density conditions. The theorem is a planned geometric target, not a completed dependency chain.

Proof plan:

1. Use schematic density of the open immersion and invertibility of the line to obtain injectivity.
2. For an open section, use the requested finite-pole and formal-detection theorem to examine it on every completed cusp chart.
3. Apply hilbert-cusp-positive-support. Its exponents lie in every positive dual monoid, so the existing meromorphic expansion has no negative coordinate exponents and belongs to the completed regular ring.
4. Use the actual equivariant chart relation to glue these regular formal sections, then coherent formal detection to extend across the boundary. Uniqueness follows from injectivity.

Acceptance:

- For degree one the weakly holomorphic q^(−1) behavior is not eliminated by units; the theorem is not claimed for F=Q.
- The constant coefficient need not vanish.
- No ramified-base Hasse-ideal conclusion follows from a theorem over o′[1/Δ].
- Changing an admissible fan uses common-refinement comparison maps from C3, not equality of the chosen toroidal schemes.

Dependencies: ShimuraCompactifications:C6/hilbert-cusp-positive-support, AdicSpacesPartII:F0, ShimuraCompactifications:C0/relative-boundary-coordinates, ShimuraCompactifications:C4, ShimuraCompactifications:C5, HilbertModularVarietiesAndShimuraCurves:H3, SchemeAndStackFoundations:SF.1.

Source: Dimitrov, Theorem 8.3, pp. 23–24 (author copy printed p. 547). Declaration-level expansion of the coefficient argument, with its necessary hypotheses made explicit.

### Hilbert cusp forms and the boundary ideal

**Identifier:** ShimuraCompactifications:C6/hilbert-boundary-constant. **Suggested declaration:** TauCeti.HilbertCusp.hilbert_cuspidal_iff_constant_zero.

Under the Hilbert geometric hypotheses, let D be the scheme-theoretic relative toroidal boundary and I_D its ideal, locally (x₁⋯x_r). For s∈Γ(M̄_Σ,R,ω^κ), membership in the image of Γ(M̄_Σ,R,ω^κ⊗I_D) is equivalent to vanishing of its constant Fourier coefficient at every cusp component, after the stated étale coefficient and line-trivializing covers.

Hypotheses: Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here. This is the scalar Hilbert coefficient comparison on its zero-dimensional cusp bases. It is not the generic B5 theorem for higher-dimensional boundary coefficients, and it does not import B3 or B5 back into their C6 supplier.

Proof plan:

1. Use arithmetic-koecher to identify open forms with regular extended sections, and hilbert-cusp-positive-support for their expansions.
2. For ξ∈X_+, positive-exponents-on-charts makes every boundary coordinate exponent a positive integer. Hence each nonconstant monomial is divisible by t=x₁⋯x_r. Division by t preserves the requested completed-ring support condition.
3. The constant coefficient survives modulo (t). Thus an expansion is in (t) exactly when its constant coefficient is zero. This is a scheme-theoretic coefficient computation, valid with nilpotents.
4. Use the invertible-line boundary exact sequence, étale descent of its ideal and coherent formal detection at every cusp to obtain the asserted global equivalence.

Acceptance:

- A section with nonzero constant term may satisfy Koecher extension but is not cuspidal.
- On a rank-one formal boundary chart the condition reduces to divisibility by q.
- Use every cusp component; a single scalar at one cusp does not replace all boundary restrictions.
- For a general Shimura variety a boundary coefficient can itself be a nonconstant form; that case remains owned by AutomorphicBundles:B5.

Dependencies: ShimuraCompactifications:C6/arithmetic-koecher, ShimuraCompactifications:C6/positive-exponents-on-charts, ShimuraCompactifications:C0/relative-boundary-coordinates, AdicSpacesPartII:F0, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1.

Source: Dimitrov, Theorem 8.3, pp. 23–24, and §2 boundary coordinates, p. 5. Explicit Hilbert-specific consequence of positive support and the boundary-ideal computation, not attributed as a separately numbered theorem in Dimitrov.

## Supplier interfaces and direction of dependence

C6 supplies the Hilbert-specific boundary geometry to AutomorphicBundles:B3 and H5; importing those consumers back into C6 would make a cycle. The generic B5 boundary-restriction theorem is a downstream consumer, while the present comparison proves why scalar Hilbert coefficients detect the relative boundary ideal. Ordinary toric coordinates are imported using the existing C0 node identifiers. Each remaining request has the following precise role:

- **ShimuraCompactifications:C0** — Extend the existing regular-coordinate and boundary nodes to completed arithmetic charts: use the common character lattice and the t-adic completion with t the product of boundary variables, prove the admissible-support coefficient description and localization shift, and prove membership/divisibility tests over an arbitrary Noetherian R including nilpotents. Supply complete, locally finite Hilbert fans finite modulo cusp units and compatible refinements. Do not replace these by the finite complex Fan carrier.
- **ShimuraCompactifications:C4** — Import R11.3 local polarized Raynaud uniformization, then supply the actual relative Hilbert Mumford chart, its semiabelian family, invariant differentials and character-compatible trivialization, level uniformization, cyclotomic change-of-lift law and face/unit equivariance. The coefficients are sections of an invertible line, scalar only on its actual trivializing cover.
- **NeronModelsAndSemistableAbelianVarieties:R11.3** — Use the accepted RS-32 owner for local Raynaud/lattice uniformization with its valuation and polarization hypotheses. C4 must prove the relative universal-chart comparison; the local theorem alone does not construct a Hilbert compactification.
- **ShimuraCompactifications:C5** — Supply the good-base Hilbert toroidal model with the actual étale cusp relation, schematic density, coherent descent and its formal chart identification; specialize its hypotheses rather than assuming that every Hilbert model is smooth. Properness, minimal projectivity and normalization are distinct remaining obligations.
- **HilbertModularVarietiesAndShimuraCurves:H1** — Supply the HBAV polarization module, trace/different convention f*=f^(−1)d^(−1), and exact cusp lattice X=cbb′ with b′/b the level-image quotient. Identify its character/cocharacter pairing with the signed real trace pairing. Import the moduli problem rather than defining it again.
- **HilbertModularVarietiesAndShimuraCurves:H3** — Supply the actual polarization quotient and the cusp stabilizer action, including the subgroup U of pairs (u,1), its finite index in O_F×, invariance of X, and unit-valued weight/cyclotomic transformation factors. Distinguish the full stabilizer, its translation lattice, its effective unit action and its finite cyclotomic quotient. Prove the descent of the invariant-differential weight line over the stated coefficient base. Do not assume the minimal-boundary quotient is free.
- **AdicSpacesPartII:F0** — For the actual Noetherian scheme and coherent invertible line, supply finite-pole presentation of a section off an effective Cartier divisor and detection of regularity and ideal membership after completion along that divisor, including coefficient injectivity and schematic-density hypotheses. Supply étale-local gluing with SF.1. Existing scheme completion APIs do not automatically give a stack or an arbitrary non-Noetherian base-change theorem.
- **SchemeAndStackFoundations:SF.0** — Use the invertible-line boundary exact sequence 0→L⊗I_D→L→L|D→0 and left exactness of global sections for the actual relative ideal; retain nilpotents. No extra nonflat coefficient module is silently tensored into this sequence.
- **SchemeAndStackFoundations:SF.1** — Effective étale descent of the specified cusp line, its boundary ideal and section restrictions; descent from the finite cyclotomic cusp coefficient cover. Checking geometric points does not detect nilpotent boundary sections.
- **HilbertModularVarietiesAndShimuraCurves:H2** — For the uncompleted stage targets, supply the arbitrary-p Deligne–Pappas/Rapoport-locus ordinary formal models and the intrinsic Hasse ideal with its ramified and p=2 hypotheses. The present discriminant-inverted Koecher slice cannot supply them.
- **HilbertModularVarietiesAndShimuraCurves:H4** — For the uncompleted stage targets, provide finite p-level effective groups, componentwise polarization quotients and the full tower action with the H3 conventions. A finite component quotient must not be identified with a profinite tower quotient.

## Source coverage and unfinished work

The complete 28-page arXiv v3 was read. Reading a theorem quoted there is not a claim to have checked its original proof. The following inventory records both the selected decomposition and the remaining owner work.

- **Introduction and §§1–2, pp. 1–6** — Hilbert group and level; semiabelian schemes; polarized periods; relatively complete models; toric characters and boundary completions; local HBAV and its torsion sequence. H1/H4 moduli and level; R11.3 local uniformization; C4 relative construction; C0 toric carriers and completed-coordinate request. The selected boundary coefficient consequence is a C6 application, not a redefinition.
- **§3, Definitions 3.1–3.2, Proposition 3.3, Example 3.4, pp. 7–11** — R-cusps, (R,n)-cusps/components, b′, stabilizer and translation groups, exponent lattice, cyclotomic component quotients, prime and prime-square cusp examples. H1/H3 owners for moduli/lattice/unit objects; C6 specialization and comparison remains to be decomposed. Finite-index U is requested, not deduced solely from its notation.
- **§4, Proposition 4.1, pp. 12–14** — Polarization quotient, choice of level uniformization, root-of-unity change-of-lift character and equivariant local moduli maps. H3/H4 actions and levels; C4 relative-chart construction; exact C6 comparison remains in coverage.
- **§§5–6, Definitions 5.1–5.5, 5.7, 5.9–5.10, Lemma 5.8, Theorems 5.6, 5.11, 6.2, pp. 14–18** — Algebraic/formal spaces, admissible blowups, rigid localization, thickenings, permitted maps, formal cutting/effectivity, Raynaud uniformization. SF.1, F0 and R11.3/C4. The source’s narrower space convention is not copied as a replacement for the modern owner. Quoted theorems have not been recursively reread at their original references.
- **§7, Definition 7.1, Theorem 7.2, Corollaries 7.4–7.5, Proposition 7.6, Theorem 7.7, pp. 18–21** — Admissible fans, compactification and its formal boundary, quotient, local charts, smooth refinement, semiabelian extension, properness. C0 arithmetic fans; C4 family/effectivity; C5 models. Hilbert specializations, APIs and comparison declarations remain in coverage. Theorem 7.2 works over Z[1/N(n)]; smoothness in 7.5 uses Z[1/Δ].
- **§8, Definition 8.1, Remark 8.2 and equation (5), pp. 22–23** — Geometric Hilbert forms, weight and invariant-differential line, coefficient invertible module and unit-equivariant Fourier expansion. H1/H3 and C4 actual line and descent; C6’s scalar argument only after its trivialization. Do not import the consuming B3 backwards.
- **Theorem 8.3 and Proposition 8.5(iii), pp. 23–24** — Koecher extension, nonnegative Fourier support and constant coefficient annihilator. The twelve current nodes provide the selected decomposition, with the four geometric statements retaining open suppliers. No new definition or API carrier is introduced.
- **Definition 8.4, Proposition 8.5(i)/(ii), Theorem 8.6(i)–(vi), examples, pp. 24–27** — q-expansion map, injectivity, coefficient descent, generation by Hodge sections, minimal Proj, independence, finite generation, projectivity/normality, boundary, formal fibers, parallel-weight descent, ramified-cusp examples. C5 minimal construction plus C6 Hilbert comparisons and H3 quotient compatibility. Still to decompose, including the extra original-source proofs the text cites. No general finite generation or formal-functions theorem is recreated here.

The stage remains partial for these specific reasons:

- Decompose the actual Hilbert cusp data, stabilizer congruences, change-of-uniformization root-of-unity action and their APIs/tests, importing the H1/H3/H4 objects. No such construction is represented by the coefficient function used in the native prototype.
- Close the C0 completed-coordinate and F0 finite-pole/formal-detection requests, then replace the four geometric statement omissions in the suggested file by genuine signatures for the actual supplied objects. The coefficient proof does not itself construct a compactification.
- Construct and compare the toroidal/minimal ordinary-neighborhood models, semiabelian extensions, refinements and G*/G polarization quotients; separate free toroidal actions from possibly stabilizing minimal-boundary actions. Read and decompose the cited Rapoport, Chai, Faltings–Chai, Lan, and Birkbeck–Heuer–Williams inputs to the required hypotheses.
- Treat arbitrary primes, including discriminant primes and p=2, using H2’s actual ordinary locus and Hasse ideals; establish the T3–T5 interfaces. The source’s ramified level cusps are not ramified-base integral models.
- Prove the F=Q toroidal/minimal comparison using ModularCurvesPartII:R13.4a/R13.4b. PR81 Layer 10 supplies only prime N≥5 and diamond quotients H≤(Z/N)×/{±1}; full and composite levels require their owning modular-curve stages. No degree-one Koecher theorem is inferred.
- Decompose the remaining read source material, including Theorem 7.2 quotient construction, 7.6 semiabelian extension, 7.7 properness, Proposition 8.5(i)/(ii) q-expansion and coefficient descent, and the six assertions of Theorem 8.6 with their generic owners. The source inventory below distinguishes these from the selected twelve nodes.
- Verify the geometric theorem over non-Noetherian coefficient algebras if the full generality of Dimitrov’s statement is required; establish any limit or base-change arguments explicitly.
- Collate the two source misprints against the publisher edition and obtain independent review; the available typeset author copy alone is not represented as a verified version of record.

## Sources and source findings

Mladen Dimitrov, [arXiv math/0212071v3](https://arxiv.org/pdf/math/0212071v3), 7 November 2004, read in full on 26 September 2026. SHA-256: e590480f6a0f29048502721505e5742a0fec2c86fa8629909a480978696a16da. The [author-hosted typeset copy](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf) was checked at physical pages 1 and 22–24, including rendered printed p. 547; SHA-256: 722986ce0343547cdbc6cd7d39fa524a9c967f3ab42fdd231cc3acd87b006f03. Its pagination differs from the published bibliography, and the publisher DOI page returned HTTP 405. No version-of-record identity is claimed.

E-C6-1 records the missing exclusion of ξ₀=0 in the negative-trace contradiction: the surrounding Fourier space expressly retains constants. E-C6-2 records the sentence identifying the zero coefficient ring with the classical specialization; taking ℂ gives the classical specialization, while the zero ring gives only zero sections. Both readings agree in the preprint and the selected author-copy pages. No correction was found in the arXiv revisions, author publication page or title/errata search. These are unreviewed, version-scoped findings; neither changes the theorem being planned.

## Prototype and validation boundary

The suggested file uses the existing number-field, unit, positivity and finite-sum carriers. It contains eight named arithmetic signatures and seven acceptance examples: zero exponent, degree-one units, nonunit cancellation, a nontrivial character with a nonzero constant over ℤ/4, zero dual vector, the constant series and positive trace of 1. There are no new definition or construction nodes, hence no duplicated API carrier or definition-unit-test inventory. Four geometric signatures are absent until their actual chart and coherent-sheaf suppliers exist; they are not encoded as arbitrary propositions.

The packet marks three central theorems as planets. Implementation status is unchecked throughout. Compilation and the exact submission checks are recorded in the handoff; compilation of these proposed signatures proves no mathematical theorem.
