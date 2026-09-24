# Support, components and descent (layer R03.6)

*Deformation and derived patching algebra, layer R03.6.*

## Purpose

A Taylor–Wiles–Kisin argument ends with commutative algebra. Patching produces a finite module M∞ over a
complete local ring R∞, with a surjection R∞ ↠ R onto a deformation ring and an identification of M∞ modulo an
augmentation ideal with a Hecke module H. What the argument then proves depends on the algebra of supports.
Sometimes H is free and R equals the Hecke algebra T integrally. Sometimes R and T agree only up to nilpotents, or
up to ϖ-torsion. Sometimes only the points on some irreducible components of Spec R are modular. This layer makes
each of these conclusions a named theorem with every hypothesis stated, and builds the library they rest on.

The layer develops:

- **nearly faithful modules**, in the radical form Ann_R(M) ⊆ √0, and **modules supported on a union of irreducible
  components**, with their full API;
- **transport of supports** along base change, flat maps, surjections, coefficient changes and the removal of framing
  variables, and along the inversion of a nonzerodivisor ϖ;
- the **maximal-depth theorems**: a nonzero module of maximal depth is supported on top-dimensional components, but is
  nearly faithful only under an irreducibility hypothesis; near faithfulness spreads along a transitive group of
  symmetries and lifts from the special fibre;
- three **R = T theorems**: R_red ≅ T exactly when T is reduced, R^tf ≅ T exactly when H[1/ϖ] is faithful, and R ≅ T
  exactly when H is faithful;
- the **patching conclusions**: descent of near faithfulness from R∞ to R, freeness over a regular R∞, and their
  assembly for the patched module of layer R03.5 (Calegari–Geraghty, Theorem 6.4, in module form).

Maximal depth does not give full support: that is the point of the layer. The node k⟦x,y⟧/(xy) with M = A/(x) is
maximal Cohen–Macaulay and not nearly faithful, and it is a test in several milestones.

## Prerequisites

- **Mathlib**, at the pinned commit 082e2d3: supports, annihilators, the nilradical, minimal primes, localisation,
  faithful flatness, Krull dimension, regular sequences and Krull's principal ideal theorem (listed below).
- **Layer R03.3** of this roadmap (dimension, depth and complete intersections): depth, associated primes of finite
  modules, finiteness of the dimension of a Noetherian local ring, the Auslander–Buchsbaum formula and freeness of
  modules of maximal depth over regular local rings, and the dimension function of a catenary local ring. Three
  results depend on it: the maximal-depth theorem and the lift from the special fibre (Milestone 4), and freeness over
  a regular patched ring (Milestone 6).
- **Layer R03.5** of this roadmap (patching modules): the patched module M∞, its finiteness, the compatibility of the
  augmentation ideal with ker φ∞, and depth M∞ = dim R∞. Only the assembled patching theorem (Milestone 6) uses it.

No other roadmap is a prerequisite.

## Boundaries

- **R03.3 owns** regular sequences, depth, Cohen–Macaulay rings and modules, projective dimension,
  Auslander–Buchsbaum, equidimensionality and catenarity. This layer does not define any of them. Where a statement
  needs depth, it assumes "M ≠ 0 and depth_A M ≥ dim A" and cites R03.3 for the depth facts used in the proof.
- **R03.5 owns** the construction of patched modules. This layer takes the patched module with the properties R03.5
  proves and draws the support conclusions.
- **P9 owns** everything at the level of complexes: support of perfect complexes and of H*(C∞), the
  amplitude and codimension inequalities, derived Ihara avoidance, ACC+ Proposition 6.3.8, and Calegari–Geraghty
  Proposition 6.6, the comparison of two patched systems. P9 consumes this layer: it applies the module theorems
  here in each degree, and it uses the lift from the special fibre (Milestone 4) after Proposition 6.6. None of P9's
  material is planned here.
- **Consumers.** GL2ModularityLifting R22.1 applies the patching and R = T theorems to its patched Hecke module;
  GL2ModularityLifting R32.1 records, for each row of its statement table, which of the three R = T theorems or
  which component statement applies; PotentialModularityAndCompatibleSystems R24.1 uses the faithfulness criteria of
  Milestones 3 and 4 (Khare–Wintenberger II, Lemma 9.6 b)) and supplies itself the arithmetic transitivity input. The
  finiteness of R∞ over 𝒪⟦y⟧ that R24.1 also needs is a finiteness statement of layer R03.4, not a support statement.

## Standing hypotheses

- Rings are commutative with 1. Modules are arbitrary unless "finite" is written; finite means finitely generated.
- No statement assumes a ring Noetherian unless it says so. The radical definition makes the transport results hold
  for all rings; Noetherian hypotheses enter only for nilpotence and for depth.
- ϖ denotes an element of a ring, usually a nonzerodivisor. In applications R is an 𝒪-algebra for a complete
  discrete valuation ring 𝒪 and ϖ is the image of a uniformiser; no statement here needs 𝒪.
- In the patching statements, ı: S → R∞ is a ring map (from the patching algebra, including framing variables),
  𝔞 ⊆ S is an ideal, φ: R∞ ↠ R is surjective, M∞ is a finite R∞-module and H is an R-module with an R∞-linear
  isomorphism M∞/ı(𝔞)M∞ ≅ H through which R∞ acts on H via φ.

## Pinned conventions

- **Nearly faithful** means Ann_R(M) ⊆ √0: every element of R that kills M is nilpotent. Taylor's Definition 2.1
  asks for Ann_R(M) nilpotent, for finite modules over Noetherian local rings. The two agree whenever Ann_R(M) is
  finitely generated, in particular over every Noetherian ring (Stacks 00IM), which covers every source. They differ
  in general: in S = k[x₀, x₁, …]/(x_n^{n+1}) with J = (x_n), the module S/J has Ann = J ⊆ √0 and J is not nilpotent
  (Stacks 0EGG). The radical form is the one P9 asks for, is equivalent to full support for finite modules over any
  ring, and is preserved by every transport result below without Noetherian hypotheses.
- **Faithful** is Mathlib's `FaithfulSMul R M`, equivalently `Module.annihilator R M = ⊥`.
- **Support** is Mathlib's `Module.support R M`, the set of primes 𝔭 with M_𝔭 ≠ 0. For finite M it equals
  V(Ann_R M) and is closed; for other modules it need not be (over ℤ_p, ℚ_p/ℤ_p has Ann = 0 and support {(p)}).
- **Supported on components** means every prime minimal over Ann_R(M) is a minimal prime of R. It is used for finite
  modules, where it says Supp M is a union of irreducible components.
- **Reduced quotient.** R_red = R/√0. "R_red ≅ T" means that R → T induces a ring isomorphism R/√0 ≅ T, and it is
  stated as a `RingEquiv` together with its value on classes of elements of R.
- **Torsion-free quotient.** R[ϖ^∞] = ker(R → R[1/ϖ]) = {r : ϖⁿr = 0 for some n}, and R^tf = R/R[ϖ^∞].
- **The ring T.** T is a commutative R-algebra acting faithfully on H, compatibly with R, with R → T surjective. The
  basic example is the image of R in End(H), which is R/Ann_R(H).
- **Depth.** depth(0) = ∞ (Stacks, proof of 0FCC). Every maximal-depth hypothesis is written "M ≠ 0 and
  depth_A M ≥ dim A". The pinned Mathlib has no depth, so the suggested Lean statements use an M-regular sequence
  in 𝔪 of length dim A instead (Mathlib `RingTheory.Sequence.IsRegular`, which includes M/(rs)M ≠ 0).
- **Catenary** Noetherian local rings are used through the equivalent statement that 𝔭 ↦ dim A/𝔭 is a dimension
  function (Stacks 0ECF):

  ```text
  dim A/𝔭 = dim A/𝔮 + 1   whenever 𝔭 ⋖ 𝔮 in Spec A (no prime strictly between).
  ```

## What Mathlib supplies

Tau Ceti at f790474 has no declarations on supports, near faithfulness or depth. At Mathlib 082e2d3:

- *Supports.* `Module.support`, `Module.mem_support_iff_exists_annihilator` (𝔭 ∈ Supp M iff Ann(m) ⊆ 𝔭 for some m),
  `Module.mem_support_mono`, `Module.mem_support_iff_of_finite`, `Module.support_eq_zeroLocus` (Stacks 00L2),
  `Module.support_quotient` (Supp(M/IM) = Supp M ∩ V(I) for finite M, Stacks 00L3), `Module.support_subset_preimage_comap`
  (one inclusion for restriction of scalars), `Module.support_of_algebra`,
  `Module.mem_support_iff_nontrivial_residueField_tensorProduct` (the fibre criterion for finite M).
- *Annihilators and faithfulness.* `Module.annihilator`, `Module.annihilator_eq_bot`, `Module.annihilator_eq_top_iff`,
  `Module.comap_annihilator`, `LinearMap.annihilator_le_of_injective`, `LinearEquiv.annihilator_eq`,
  `Ideal.annihilator_quotient`, `FaithfulSMul`, `Module.Free.chooseBasis` with the instance making a nonzero free
  module faithful.
- *Radicals and quotients.* `nilradical`, `nilradical_eq_bot_iff`, `Ideal.FG.isNilpotent_iff_le_nilradical`,
  `Ideal.radical`, `Ideal.comap_radical`, `Ideal.map_radical_of_surjective`, `Ideal.isRadical_iff_quotient_reduced`,
  `RingHom.quotientKerEquivOfSurjective`, `PrimeSpectrum.zeroLocus_eq_univ_iff`,
  `PrimeSpectrum.zeroLocus_subset_zeroLocus_iff`, `isReduced_of_injective`, `isReduced_localizationPreserves`.
- *Minimal primes.* `minimalPrimes`, `Ideal.minimalPrimes`, `Ideal.exists_minimalPrimes_le`, `Ideal.sInf_minimalPrimes`,
  `minimalPrimes.equivIrreducibleComponents`, `Ideal.disjoint_nonZeroDivisors_of_mem_minimalPrimes`,
  `IsSMulRegular.notMem_of_mem_minimalPrimes`, `IsLocalization.minimalPrimes_comap`,
  `PrimeSpectrum.localization_comap_injective`, `PrimeSpectrum.localization_away_comap_range`,
  `Module.associatedPrimes.minimalPrimes_annihilator_subset_associatedPrimes` (Stacks 02CE).
- *Base change and flatness.* `Module.Finite.base_change`, `Module.Flat`, `Module.FaithfullyFlat` with its base-change
  instance, `Module.FaithfullyFlat.of_flat_of_isLocalHom` (Stacks 00HR), `PrimeSpectrum.comap_surjective_of_faithfullyFlat`,
  `LocalizedModule.equivTensorProduct`, `TensorProduct.quotTensorEquivQuotSMul`, `Module.isTorsionBySet_quotient_ideal_smul`.
- *Dimension.* `ringKrullDim`, `ringKrullDim_quotient`, `Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes`
  (Krull's principal ideal theorem), `RingTheory.Sequence.IsRegular`, `IsRegularLocalRing`.
- *Actions and power series.* `MulSemiringAction.toRingHom`, `SMulDistribClass`, `MvPowerSeries.constantCoeff`,
  `MvPowerSeries.X`.

## What is missing

- The predicates themselves: near faithfulness and support on components.
- Supp_B(B ⊗_A M) = (Spec φ)⁻¹(Supp_A M) (Stacks 0BUR). Mathlib has only an inclusion, for restriction of
  scalars.
- Supports and annihilators along surjections, beyond that inclusion.
- The kernel of the constant coefficient of A⟦x₁, …, x_n⟧.
- The bijection between the minimal primes of R and of R[1/ϖ]; Mathlib has the pieces but not the statement.
- Group actions on supports, and the reduced and torsion-free quotient isomorphisms R_red ≅ T and R^tf ≅ T.
- Depth, Cohen–Macaulay modules and Auslander–Buchsbaum, which are R03.3's.

Faithful flatness of power series rings is not needed: removing framing variables is a quotient together with base
change.

## Milestones

Library modules live under `TauCeti/RingTheory/Support/`: `NearlyFaithful`, `BaseChange`, `Localization`,
`Components`, `ImageInEnd` and `Patching`. Declarations are in the namespace `Module` unless another is written.

### Milestone 1: nearly faithful modules and components

**Object: nearly faithful modules** (`Module.NearlyFaithful`, a class; file `NearlyFaithful`). For a commutative ring
R and an R-module M,

```text
M is nearly faithful over R   ⟺   Ann_R(M) ⊆ √0.
```

*API.* The field `NearlyFaithful.annihilator_le_nilradical` and `nearlyFaithful_iff`;
the instance `NearlyFaithful.of_faithfulSMul` (faithful ⇒ nearly faithful);
`nearlyFaithful_iff_faithfulSMul` (R reduced: nearly faithful ⇔ faithful);
`NearlyFaithful.of_isNilpotent_annihilator`; `nearlyFaithful_iff_isNilpotent_annihilator_of_fg` (Ann finitely
generated: nearly faithful ⇔ Ann nilpotent, Taylor's form) and `nearlyFaithful_iff_isNilpotent_annihilator`
(R Noetherian); `nearlyFaithful_of_forall_minimalPrimes_mem_support` (every minimal prime in Supp M ⇒ nearly faithful,
any M); `NearlyFaithful.support_eq_univ` (finite M); `NearlyFaithful.nontrivial` (over a nonzero ring, M ≠ 0);
`NearlyFaithful.of_injective`; `LinearEquiv.nearlyFaithful_iff`. The support characterisations and the behaviour
along surjections are the lemmas below.

*Unit tests.* Over the dual numbers k[ε], k[ε]/(ε) is nearly faithful and not faithful (`nearlyFaithful_test_dualNumber`).
The zero module over a nonzero ring is not nearly faithful (`nearlyFaithful_test_zero`). R is nearly faithful over
itself (`nearlyFaithful_test_self`). Over ℤ/8, (ℤ/8)/(4) is nearly faithful; over ℤ/6, (ℤ/6)/(3) is not
(`nearlyFaithful_test_zmod`). Over the node A = k⟦x,y⟧/(xy), A/(x) is not (`nearlyFaithful_test_node`). Over ℤ, nearly
faithful is faithful (`nearlyFaithful_test_int`). With S and J as in Stacks 0EGG, S/J is nearly faithful while
Ann = J is not nilpotent (`nearlyFaithful_test_notNilpotent`); this test is what rejects the nilpotent form as a
definition.

**Object: modules supported on components** (`Module.IsSupportedOnComponents`, a definition; file `NearlyFaithful`).
M is supported on components of Spec R if every prime minimal over Ann_R(M) is a minimal prime of R.

*API.* `IsSupportedOnComponents.mem_minimalPrimes`; `isSupportedOnComponents_iff_exists_irreducibleComponents`
(for finite M: Supp M = ⋃ 𝒮 for a set 𝒮 of irreducible components); `NearlyFaithful.isSupportedOnComponents`;
`LinearEquiv.isSupportedOnComponents_iff`.

*Unit tests.* The zero module is supported on components (`isSupportedOnComponents_test_zero`); ℤ/2 over ℤ is not
(`isSupportedOnComponents_test_zmod`); over the node, A/(x) is supported on components and not nearly faithful
(`isSupportedOnComponents_test_node`); over a domain, a nonzero finite module is supported on components iff it is
faithful (`isSupportedOnComponents_test_domain`). Finiteness is needed for the characterisation: ℚ_p/ℤ_p over ℤ_p
satisfies the definition, and its support {(p)} is not a union of components.

**Lemma: near faithfulness as full support** (`nearlyFaithful_iff_support_eq_univ`,
`nearlyFaithful_iff_forall_minimalPrimes_mem_support`). For an R-module M consider (i) M nearly faithful,
(ii) Supp M = Spec R, (iii) every minimal prime of R lies in Supp M. For every M, (ii) ⇔ (iii) ⇒ (i). For finite M
all three are equivalent, and when Ann_R M is finitely generated they are equivalent to (iv) Ann_R M nilpotent.
*Proof.* (iii) ⇒ (i) from `Module.mem_support_iff_exists_annihilator` and ⋂ Min(R) = √0 (`Ideal.sInf_minimalPrimes`);
(ii) ⇔ (iii) because every prime contains a minimal prime and supports are stable under specialisation; (i) ⇒ (ii)
from `Module.support_eq_zeroLocus` and `PrimeSpectrum.zeroLocus_eq_univ_iff`. *Counterexample.* Over ℤ, ℚ/ℤ is
faithful and (0) ∉ Supp(ℚ/ℤ): (i) ⇒ (ii) needs finiteness.

**Lemma: near faithfulness along a surjective ring map** (`nearlyFaithful_iff_annihilator_le_radical_ker`). For
φ: A ↠ B and a B-module N, Ann_A(N) = φ⁻¹(Ann_B N), and

```text
N nearly faithful over B   ⟺   Ann_A(N) ⊆ √(ker φ).
```

No finiteness is needed. *Proof.* `Module.comap_annihilator` and `Ideal.comap_radical`.

**Lemma: near faithfulness passes to quotients** (`NearlyFaithful.quotient`, `NearlyFaithful.ker_le_radical_of_equiv_quotient`,
`NearlyFaithful.of_equiv_quotient`; Taylor, Lemma 2.2(1)). Let M be finite and nearly faithful over A and I ⊆ A an
ideal. Then M/IM is nearly faithful over A/I. If φ: A ↠ B and N is a B-module with an A-linear isomorphism
M/IM ≅ N, then ker φ ⊆ √I; if moreover I ⊆ √(ker φ), then N is nearly faithful over B. No Noetherian hypothesis.
*Proof.* Supp(M/IM) = Supp M ∩ V(I) = V(I) (`Module.support_quotient` and full support), so √Ann(M/IM) = √I; then
the previous lemma. *Counterexample.* Over ℤ_p, ℚ_p is faithful and ℚ_p/pℚ_p = 0 is not nearly faithful over 𝔽_p.

*Sources.* Taylor, Definition 2.1, the remark after it and Lemma 2.2(1) (IHÉS 108, pp. 187–188); ACC+ §6.5, p. 1066;
Calegari–Geraghty §6.1, Theorem 6.4; Stacks 00IM, 0EGG, 00L2, 00L3, 00E0, 02CE.
*Dependencies.* Mathlib only.

### Milestone 2: transport of supports

**Theorem: support under base change** (`support_baseChange_subset`, `support_baseChange`, `support_baseChange_of_flat`;
file `BaseChange`). Let φ: A → B be a ring map and M an A-module. Always

```text
Supp_B(B ⊗_A M) ⊆ (Spec φ)⁻¹ Supp_A(M),
```

with equality when M is finite (any φ) or when φ is flat (any M). *Proof.* (B ⊗_A M)_𝔮 ≅ B_𝔮 ⊗_{A_𝔭} M_𝔭. For finite
M, the fibre criterion `Module.mem_support_iff_nontrivial_residueField_tensorProduct` over A and over B, the residue
field of 𝔮 being an extension of that of 𝔭 (Stacks 0BUR). For flat φ, A_𝔭 → B_𝔮 is flat and local, hence faithfully
flat (`Module.FaithfullyFlat.of_flat_of_isLocalHom`). *Counterexample.* For ℤ → ℤ/2 and M = ℚ, neither hypothesis
holds: Supp_ℤ ℚ = Spec ℤ and ℤ/2 ⊗ ℚ = 0.

**Lemma: support along a surjective ring map** (`support_eq_image_comap_of_surjective`). For φ: A ↠ B with kernel I
and any B-module N, Supp_A(N) = (Spec φ)(Supp_B N): 𝔭 ∈ Supp_A N iff I ⊆ 𝔭 and φ(𝔭) ∈ Supp_B N. *Proof.* An element
of I outside 𝔭 kills N and is invertible on N_𝔭; for I ⊆ 𝔭, A_𝔭 ⊗_A N ≅ B_{φ(𝔭)} ⊗_B N (Stacks 00E5).

The quotient case Supp(M/IM) = Supp M ∩ V(I) for finite M is Mathlib's `Module.support_quotient` and is cited, not
restated.

**Lemma: near faithfulness under base change and coefficient change** (`NearlyFaithful.baseChange`,
`NearlyFaithful.of_baseChange`, `nearlyFaithful_baseChange_iff`). Let M be a finite A-module and φ: A → B. (a) M
nearly faithful ⇒ B ⊗_A M nearly faithful over B. (b) If B ⊗_A M is nearly faithful and every minimal prime of A is
the contraction of a prime of B (for instance φ faithfully flat), M is nearly faithful. (c) For a faithfully flat
𝒪 → 𝒪′ and an 𝒪-algebra A, M is nearly faithful over A iff 𝒪′ ⊗_𝒪 M is nearly faithful over A ⊗_𝒪 𝒪′. No
Noetherian hypothesis. *Proof.* The base-change theorem and full support; for (c), A → A ⊗_𝒪 𝒪′ is faithfully flat
and surjective on spectra (`PrimeSpectrum.comap_surjective_of_faithfullyFlat`). *Counterexample.* For (b):
A = k × k → B = k, M = k × 0; B ⊗ M = k is faithful, and Ann_A M = 0 × k ⊄ √0.

**Lemma: removing framing variables** (`MvPowerSeries.ker_constantCoeff`, `nearlyFaithful_mvPowerSeries_baseChange_iff`,
`NearlyFaithful.quotient_span_X`). Let σ be finite and A⟦x⟧ = A⟦x_s : s ∈ σ⟧. (0) The constant coefficient
A⟦x⟧ → A has kernel (x_s), so A⟦x⟧/(x) ≅ A. (a) A finite A-module M is nearly faithful iff A⟦x⟧ ⊗_A M is nearly
faithful over A⟦x⟧. (b) If N is finite and nearly faithful over A⟦x⟧, then N/(x)N is nearly faithful over A. No
Noetherian or flatness hypothesis. *Proof.* (0) splits a power series by the least variable in each monomial; (b) is
the quotient lemma with I = (x); (a) ⇒ is base change, and (a) ⇐ applies (b) to A⟦x⟧ ⊗_A M, whose quotient by (x) is
M (`TensorProduct.quotTensorEquivQuotSMul`). *Counterexample.* (0) fails for infinitely many variables: Σ_s x_s has
constant coefficient 0 and lies outside (x_s).

*Sources.* Stacks 0BUR, 00HR, 00HI, 00HQ, 00E5, 05BY; Calegari–Geraghty §6.1 (the ideal 𝔞 contains the framing
variables); Kisin (3.3.1).
*Dependencies.* Milestone 1.

### Milestone 3: inverting ϖ

**Lemma: minimal primes after inverting a nonzerodivisor** (`IsLocalization.Away.comap_minimalPrimes_eq_of_mem_nonZeroDivisors`;
file `Localization`, namespace `IsLocalization.Away`). If ϖ ∈ R is a nonzerodivisor, ϖ lies in no minimal prime of R,
and contraction along R → R[1/ϖ] is a bijection Min(R[1/ϖ]) → Min(R). No Noetherian or discrete-valuation
hypothesis. *Proof.* `Ideal.disjoint_nonZeroDivisors_of_mem_minimalPrimes`, then `IsLocalization.minimalPrimes_comap`
for the zero ideal, whose contraction is 0 because ϖ is a nonzerodivisor. *Counterexample.* R = ℤ_p × 𝔽_p,
ϖ = (p, 0): the minimal prime ℤ_p × 0 contains ϖ, and R[1/ϖ] = ℚ_p has one minimal prime while R has two.

**Lemma: near faithfulness tested after inverting ϖ** (`nearlyFaithful_iff_localizedModule_away`,
`nearlyFaithful_iff_forall_minimalPrimes_away_mem_support`, `faithfulSMul_iff_localizedModule_away`). Let ϖ be a
nonzerodivisor of R and M a finite R-module. Equivalent: (i) M nearly faithful over R; (ii) M[1/ϖ] nearly faithful
over R[1/ϖ]; (iii) every irreducible component of Spec R[1/ϖ] lies in Supp M[1/ϖ]. If R[1/ϖ] is reduced, R is
reduced and these are equivalent to (iv) M faithful and (v) M[1/ϖ] faithful. *Proof.* M[1/ϖ] ≅ R[1/ϖ] ⊗_R M, so
Supp M[1/ϖ] = Supp M ∩ D(ϖ) by the base-change theorem; the minimal primes of R lie in D(ϖ) by the previous lemma;
then full support over R and over R[1/ϖ]. *Counterexamples.* R = ℤ_p × 𝔽_p, ϖ = (p, 0), M = ℤ_p × 0: M[1/ϖ] is
faithful and M is not nearly faithful. Over ℤ_p, ℚ_p/ℤ_p is faithful and (ℚ_p/ℤ_p)[1/p] = 0.

*Sources.* Calegari–Geraghty, proof of Theorem 6.4, p. 94 ("Since R∞ is p-torsion free, all its minimal primes have
characteristic 0"); Khare–Wintenberger II, proof of Lemma 9.6 b); Stacks 00EU, 00E3, 00LD.
*Dependencies.* Milestones 1 and 2.

### Milestone 4: maximal depth, components and symmetry

**Theorem: modules of maximal depth are supported on top-dimensional components** (`mem_minimalPrimes_of_mem_associatedPrimes_of_isRegular`,
`ringKrullDim_quotient_eq_of_isRegular`, `isSupportedOnComponents_of_isRegular`; file `Components`). Let (A, 𝔪) be a
Noetherian local ring and M ≠ 0 a finite A-module with depth_A M ≥ dim A. Then depth_A M = dim A; every associated
prime 𝔭 of M is a minimal prime of A with dim A/𝔭 = dim A; the primes minimal over Ann M are minimal primes of maximal
dimension; so M is supported on components and Supp M is a union of irreducible components of dimension dim A.
*Proof.* For 𝔭 ∈ Ass M, depth M ≤ dim A/𝔭 (Stacks 0BK4, R03.3) forces dim A/𝔭 = dim A and 𝔭 minimal; primes minimal
over Ann M are associated (`Module.associatedPrimes.minimalPrimes_annihilator_subset_associatedPrimes`).
*Counterexample to full support.* A = k⟦x,y⟧/(xy), M = A/(x): x + y is M-regular, depth M = 1 = dim A, Supp M = V(x),
and M is not nearly faithful. M = 0 must be excluded, as depth 0 = ∞.

**Lemma: a nearly faithful module of maximal depth forces equidimensionality**
(`NearlyFaithful.ringKrullDim_quotient_eq_of_isRegular`; Calegari–Geraghty, Remark 6.5). If A is Noetherian local and
M is finite, nearly faithful and depth_A M ≥ dim A, then dim A/𝔭 = dim A for every minimal prime 𝔭. *Proof.* Each
minimal prime lies in Supp M, hence is minimal over Ann M; apply the theorem. *Test.* A = k⟦x,y,z⟧/(xy, xz) has
components of dimensions 2 and 1, so no finite module of depth 2 is nearly faithful over it.

**Lemma: maximal depth over an irreducible base gives near faithfulness**
(`nearlyFaithful_of_isRegular_of_subsingleton_minimalPrimes`, `nearlyFaithful_of_isRegular_of_subsingleton_minimalPrimes_away`;
Taylor, Lemma 2.3). If A is Noetherian local with a unique minimal prime and M ≠ 0 is finite with
depth_A M ≥ dim A, then Supp M = Spec A and M is nearly faithful. If ϖ is a nonzerodivisor of A and Spec A[1/ϖ] is
irreducible, A has a unique minimal prime (Milestone 3), which is Calegari–Geraghty, Theorem 6.4(2).
*Counterexamples.* "A unique minimal prime of maximal dimension" is not enough: over A = k⟦x,y,z⟧/(xy, xz),
M = A/(x) ≅ k⟦y,z⟧ has depth 2 = dim A and Ann M = (x) is not nilpotent. M ≠ 0 is needed.

**Lemma: support stable under a group acting transitively on components**
(`smul_mem_annihilator_of_smulDistribClass`, `comap_mulSemiringAction_mem_support`,
`nearlyFaithful_of_forall_minimalPrimes_exists_smul`, `faithfulSMul_of_forall_minimalPrimes_exists_smul`). Let a group
G act on A by ring automorphisms and on M additively with g(a·m) = g(a)·g(m). Then Ann M is G-stable and Supp M is
stable under 𝔭 ↦ g(𝔭). If G is transitive on the minimal primes of A and one of them lies in Supp M, M is nearly
faithful, and faithful when A is reduced. No finiteness of G or M and no Noetherian hypothesis. The transitivity is
an arithmetic input of the consumer (Khare–Wintenberger II, Lemma 9.4). *Counterexample.* A = k × k, G trivial,
M = k × 0.

**Lemma: lifting near faithfulness from the special fibre** (`NearlyFaithful.of_quotient_of_isSMulRegular`; Taylor,
Lemma 2.2(2)). Let (A, 𝔪) be Noetherian local and ϖ ∈ 𝔪. Assume A catenary (in the dimension-function form above) and
equidimensional, that no minimal prime contains ϖ, and that every prime minimal over ϖA contains exactly one minimal
prime. If M is finite, ϖ is M-regular and M/ϖM is nearly faithful over A/ϖA, then M is nearly faithful over A.
*Proof.* For a minimal prime P, take ℘ minimal over P + ϖA. Krull's principal ideal theorem in A/P gives P ⋖ ℘; the
dimension function and equidimensionality make every prime strictly inside ℘ minimal, so ℘ is minimal over ϖA and P
is the only prime strictly inside it. ℘ ∈ Supp(M/ϖM) ⊆ Supp M. A prime 𝔮 ⊆ ℘ minimal over Ann M avoids ϖ
(`IsSMulRegular.notMem_of_mem_minimalPrimes`), so 𝔮 = P and P ∈ Supp M. *Counterexamples.* A = ℤ_p, M = 𝔽_p
(M must be ϖ-torsion-free). A = ℤ_p⟦x⟧/(x(x − p)), M = A/(x): both minimal primes lie in (p, x), M/pM is nearly
faithful over A/pA = 𝔽_p⟦x⟧/(x²), and M is not nearly faithful (uniqueness is needed). ϖ a unit and M = 0
(ϖ ∈ 𝔪 is needed).

*Sources.* Taylor, Lemmas 2.2(2) and 2.3, pp. 188, and the end of the proof of Theorem 4.1, p. 221;
Calegari–Geraghty, proof of Theorem 6.4(2) and Remark 6.5, p. 94; Khare–Wintenberger II, Lemma 9.6 b), p. 88;
Stacks 0BK4, 02CE, 0BUS, 00NF, 0FCC, 00KV, 0ECF.
*Dependencies.* Milestones 1 and 3; R03.3 for depth, associated primes, finiteness of dimension and catenarity.

### Milestone 5: R = T

Throughout, T is a commutative R-algebra acting faithfully on H, compatibly with R, with R → T surjective; then
ker(R → T) = Ann_R(H). File `ImageInEnd`.

**Theorem: reduced R = T from near faithfulness** (`NearlyFaithful.ker_algebraMap_le_nilradical`,
`NearlyFaithful.isNilpotent_ker_algebraMap`, `NearlyFaithful.exists_ringEquiv_nilradical`,
`NearlyFaithful.isReduced_iff_ker_eq_nilradical`, `NearlyFaithful.exists_ringEquiv_of_isReduced`). If H is nearly
faithful over R, then ker(R → T) ⊆ √0 (nilpotent when R is Noetherian), R_red ≅ T_red, and

```text
T reduced   ⟺   Ann_R(H) = √0   ⟺   R → T induces R_red ≅ T.
```

"T reduced" is therefore necessary and sufficient. *Proof.* √Ann_R(H) = √0 and `Ideal.isRadical_iff_quotient_reduced`.
*Test.* R = T = H = k[ε]: H is faithful, R_red = k and T is not reduced. *Source.* Taylor, Theorem 4.1 ("As T is
reduced, the theorem follows").

**Theorem: torsion-free R = T** (`ker_away_le_ker_algebraMap`, `exists_ringEquiv_torsionFree_iff_faithfulSMul`,
`NearlyFaithful.ker_away_le_nilradical`, `isReduced_iff_isReduced_away`). Let ϖ be a nonzerodivisor on H. (a)
R[ϖ^∞] ⊆ Ann_R(H), so R → T factors through R^tf, and ϖ is a nonzerodivisor on T. (b) Ann_{R[1/ϖ]}(H[1/ϖ]) =
Ann_R(H)[1/ϖ], so

```text
H[1/ϖ] faithful over R[1/ϖ]   ⟺   ker(R → T) = R[ϖ^∞]   ⟺   R^tf ≅ T.
```

(c) If H is nearly faithful, R[ϖ^∞] ⊆ √0, and T is reduced iff T[1/ϖ] is. No finiteness of H. *Test.*
R = H = ℤ_p[ε]/(ε², pε): H[1/p] = ℚ_p is faithful over R[1/p] = ℚ_p, and T = R ≠ R^tf = ℤ_p, since H has
p-torsion. *Sources.* Kisin (3.3.1) ("isomorphism up to p-torsion"); Khare–Wintenberger II, Propositions 9.2(III)
and 9.3(III).

**Theorem: integral R = T from faithfulness** (`bijective_algebraMap_iff_faithfulSMul`, `bijective_algebraMap_of_free`).
R → T is an isomorphism iff H is faithful over R; in particular when H is free of positive rank. *Test.* The zero
module is free and not faithful. *Source.* Calegari–Geraghty, proof of Theorem 6.4(1) ("R acts freely on H").

*Dependencies.* Milestone 1.

### Milestone 6: patching conclusions

The data are those of the standing hypotheses: ı: S → R∞, 𝔞 ⊆ S, φ: R∞ ↠ R, M∞ finite over R∞, and
M∞/ı(𝔞)M∞ ≅ H with R∞ acting on H through φ (hypothesis (a)). Hypothesis (b) is Calegari–Geraghty's Theorem 6.3(iv):

```text
(b)   ı(𝔞) ⊆ ker φ + Ann_{R∞}(M∞),
```

that is, the image of 𝔞 in End(M∞) lies in the image of ker φ. It is weaker than ı(𝔞)R∞ ⊆ ker φ. File `Patching`.

**Theorem: near faithfulness descends from the patched ring** (`NearlyFaithful.radical_map_eq_radical_ker`,
`NearlyFaithful.of_patching`, `NearlyFaithful.exists_ringEquiv_nilradical_of_patching`). Under (a) and (b), if M∞ is
nearly faithful over R∞ then √(ı(𝔞)R∞) = √(ker φ), (R∞/ı(𝔞)R∞)_red ≅ R_red compatibly with the maps from R∞, and H is
nearly faithful over R∞/ı(𝔞)R∞ and over R. No Noetherian hypothesis. *Proof.* The quotient lemma gives
ker φ ⊆ √(ı(𝔞)R∞); (b) and Ann M∞ ⊆ √0 give ı(𝔞) ⊆ √(ker φ); then `Ideal.map_radical_of_surjective`.
*Counterexample.* R∞ = S = ℤ_p, 𝔞 = (p), M∞ = ℚ_p, R = 0: (a) and (b) hold, and (R∞/p)_red = 𝔽_p ≠ 0 (M∞ must be finite).

**Lemma: freeness over a regular patched ring** (`ker_algebraMap_eq_map_of_patching`, `free_of_patching`). Under (a)
and (b), if R∞ is regular local and M∞ ≠ 0 has depth ≥ dim R∞, then M∞ is free of positive rank, ker φ = ı(𝔞)R∞,
and H is free of positive rank over R. No near-faithfulness hypothesis. *Proof.* Freeness of M∞ is R03.3
(Stacks 00O7, Auslander–Buchsbaum); then Ann M∞ = 0, (b) gives ı(𝔞) ⊆ ker φ, and Ann_{R∞}(H) = ı(𝔞)R∞ ⊇ ker φ.
*Counterexample.* M∞ = 0 satisfies the depth hypothesis and (b), and ker φ is then arbitrary.

**Theorem: support and faithfulness of the patched module** (`NearlyFaithful.of_patching_of_subsingleton_minimalPrimes`,
`NearlyFaithful.of_patching_of_away`, `bijective_algebraMap_of_patching`; Calegari–Geraghty, Theorem 6.4, module form).
Let M∞ be the patched module of R03.5, with H ≠ 0, the compatibility of 𝔞 with ker φ∞ and depth M∞ = dim R∞. Then:

- (0) Supp M∞ is a union of irreducible components of Spec R∞ of dimension dim R∞, and if M∞ is nearly faithful,
  R∞ is equidimensional;
- (1) if R∞ is regular (formally smooth over 𝒪), ker φ∞ = ı(𝔞)R∞, H is free of positive rank over R, and R ≅ T for
  every T through which R acts faithfully on H;
- (2) if R∞ has a unique minimal prime (for instance ϖ a nonzerodivisor and Spec R∞[1/ϖ] irreducible), H is nearly
  faithful over R and (R∞/ı(𝔞)R∞)_red ≅ R_red;
- (3) if ϖ is a nonzerodivisor of R∞ and every irreducible component of Spec R∞[1/ϖ] lies in Supp M∞[1/ϖ], the
  conclusions of (2) hold; this part does not use depth.

*Proof.* The R03.5 data give (a) and (b). Part (0) is Milestone 4; (1) is the freeness lemma with the integral R = T
theorem; (2) is the irreducible-base lemma with descent; (3) is Milestone 3 with descent. *Test.* The node
A = k⟦x,y⟧/(xy) with M = A/(x) in the roles of R∞ and M∞ satisfies (0) with one component, and (2) and (3) do not
apply. This theorem is the top-degree case of Calegari–Geraghty's Theorem 6.4; the complex-level statement and
Proposition 6.6 are P9's.

*Sources.* Calegari–Geraghty, Theorem 6.3(iv) and Theorem 6.4 with its proof, pp. 91–94; Taylor, end of the proof of
Theorem 4.1, p. 221; Kisin, Lemma (3.3.4); Stacks 00O7, 090V.
*Dependencies.* Milestones 1–5; R03.3 (freeness over regular local rings); R03.5 (the patched module).

## Sources

- R. Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations. II*, Publ. Math. IHÉS 108
  (2008), §2 and §4.
- F. Calegari and D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. 211 (2018), §6.1,
  with the authors' Correction, Invent. Math. 227 (2022).
- M. Kisin, *Moduli of finite flat group schemes, and modularity*, Ann. of Math. 170 (2009), (3.3).
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), §§9.1, 10.1.
- P. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. Le Hung, J. Newton, P. Scholze, R. Taylor and J. Thorne,
  *Potential automorphy over CM fields*, Ann. of Math. 197 (2023), §§6.3, 6.5.
- The Stacks Project, Algebra, §§10.17–10.111.

Two statements are used in corrected form. Calegari–Geraghty's Theorem 6.4(1) prints "R ≃ 𝒪[x₁, …]" for
R∞ ≃ 𝒪⟦x₁, …, x_{q+j−l0}⟧ (the bracket part is in the authors' Correction). Taylor's Lemma 2.3 omits M ≠ 0, without
which its conclusions fail for the zero module; every result here that needs it states it.
