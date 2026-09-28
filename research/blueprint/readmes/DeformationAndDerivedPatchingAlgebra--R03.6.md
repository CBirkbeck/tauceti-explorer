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
  assembly for any module satisfying the stated patching data (Calegari–Geraghty, Theorem 6.4, in module form).

Maximal depth does not give full support: that is the point of the layer. The node k⟦x,y⟧/(xy) with M = A/(x) is
maximal Cohen–Macaulay and not nearly faithful, and it is a test in several milestones.

## Prerequisites

- **Mathlib**, at the pinned commit 082e2d3: supports, annihilators, the nilradical, minimal primes, localisation,
  faithful flatness, Krull dimension, regular sequences and Krull's principal ideal theorem (listed below).
- **R03.3's integrated node** `depth-auslander-buchsbaum-and-dimension-bounds` supplies the bound
  depth M ≤ dim A/𝔭 for 𝔭 ∈ Ass M. Nonempty associated primes and finite Krull dimension of Noetherian local
  rings already belong to Mathlib: `associatedPrimes.nonempty` and `ringKrullDim_lt_top`, with the instance
  in `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean`.
- **Two precise R03.3 imports** come from the P7 part of the roadmap, which plans R03.3:
  - maximal-depth freeness over a regular local ring (`R03.3/free-of-maximal-depth-regular-local`; Stacks 00NT,
    00O7);
  - the equivalence between catenarity and the displayed dimension-function condition
    (`R03.3/catenary-iff-dimension-function`; Stacks 0ECF).
  With them every prerequisite of this layer is a node or a baseline declaration, and the packet is closed.
- **One declaration per node.** Every lemma and theorem node carries exactly one suggested declaration. The
  thirteen former multi-declaration nodes are split into forty nodes. Each retained identifier names one of
  its former declarations, as listed with the node in Milestones 1–6, and every consumer cites the leaf that
  its proof actually uses.
- **Patching data are hypotheses of the assembled theorem.** No construction in R03.5 or P8 is used in its
  proof. In the Calegari–Geraghty application, P8's Theorem 6.3 constructs the perfect complex and supplies
  its top cohomology with those data. This layer proves the conditional implication for any such module.

No other roadmap is a prerequisite.

## Boundaries

- **R03.3 owns** regular sequences, depth, Cohen–Macaulay rings and modules, projective dimension,
  Auslander–Buchsbaum, equidimensionality and catenarity. This layer does not define any of them. Where a statement
  needs depth, it assumes "M ≠ 0 and depth_A M ≥ dim A" and cites R03.3 for the depth facts used in the proof.
- **R03.5 owns** abstract patching of modules. **P8 owns** patching of perfect complexes, including
  Calegari–Geraghty Theorem 6.3. This layer constructs neither: its support theorem takes the finite module,
  depth, quotient and augmentation conditions as explicit hypotheses.
- **P9 owns** the complex-level support consequences: support of perfect complexes and of H*(C∞), the
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
  `MvPowerSeries.X`, `MvPowerSeries.C`, coefficient extensionality and the monomial multiplication formula.
  `MvPowerSeries.constantCoeff_comp_C` is the retraction used for arbitrary variable sets;
  `Ideal.comap_comap` and `Ideal.comap_id` give the induced lifting of primes.

## What is missing

- The predicates themselves: near faithfulness and support on components.
- Supp_B(B ⊗_A M) = (Spec φ)⁻¹(Supp_A M) (Stacks 0BUR). Mathlib has only an inclusion, for restriction of
  scalars.
- Supports and annihilators along surjections, beyond that inclusion.
- The equality between the augmentation kernel and the variable ideal for finitely many power-series variables; the constant-coefficient retraction itself is already in Mathlib.
- The bijection between the minimal primes of R and of R[1/ϖ]; Mathlib has the pieces but not the statement.
- Group actions on supports, and the reduced and torsion-free quotient isomorphisms R_red ≅ T and R^tf ≅ T.
- Depth, Cohen–Macaulay modules and Auslander–Buchsbaum, which are R03.3's.

Faithful flatness of power series rings is not needed: removing framing variables is a quotient together with base
change.

## Milestones

Library modules live under `TauCeti/RingTheory/Support/`: `NearlyFaithful`, `BaseChange`, `Localization`,
`Components`, `ImageInEnd` and `Patching`. Declarations are in the namespace `Module` unless another is written.

### Milestone 1: nearly faithful modules and components

**Object: nearly faithful modules** (`Module.NearlyFaithful`, a class; node `nearly-faithful`; file `NearlyFaithful`). For a commutative ring
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

**Object: modules supported on components** (`Module.IsSupportedOnComponents`, a definition; node `supported-on-components`; file `NearlyFaithful`).
M is supported on components of Spec R if every prime minimal over Ann_R(M) is a minimal prime of R.

*API.* `IsSupportedOnComponents.mem_minimalPrimes`; `isSupportedOnComponents_iff_exists_irreducibleComponents`
(for finite M: Supp M = ⋃ 𝒮 for a set 𝒮 of irreducible components); `NearlyFaithful.isSupportedOnComponents`;
`LinearEquiv.isSupportedOnComponents_iff`.

*Unit tests.* The zero module is supported on components (`isSupportedOnComponents_test_zero`); ℤ/2 over ℤ is not
(`isSupportedOnComponents_test_zmod`); over the node, A/(x) is supported on components and not nearly faithful
(`isSupportedOnComponents_test_node`); over a domain, a nonzero finite module is supported on components iff it is
faithful (`isSupportedOnComponents_test_domain`). Finiteness is needed for the characterisation: ℚ_p/ℤ_p over ℤ_p
satisfies the definition, and its support {(p)} is not a union of components.

**Lemma: near faithfulness as full support** (`Module.nearlyFaithful_iff_support_eq_univ`; node `nearly-faithful-iff-support-eq-univ`; file `NearlyFaithful`). Let R be a commutative ring and M a finite R-module. Then M is nearly faithful over R if and only if Supp_R M = Spec R. When Ann_R M is finitely generated (for instance R Noetherian), both conditions are also equivalent to Ann_R M being nilpotent; that is the API item `nearlyFaithful_iff_isNilpotent_annihilator_of_fg` of the object, not part of this lemma.

*Hypotheses.* M is finite over R. There is no Noetherian hypothesis. Finiteness is needed only for ⇒, because Supp M ⊆ V(Ann_R M) for every M.

*Proof.*

1. For finite M, Supp M = V(Ann_R M) (`Module.support_eq_zeroLocus`, Stacks 00L2).
2. V(Ann_R M) = Spec R if and only if Ann_R M ⊆ √0 (`PrimeSpectrum.zeroLocus_eq_univ_iff`), which is the definition of near faithfulness.

*Acceptance.* Over ℤ, ℚ/ℤ is faithful and (0) ∉ Supp(ℚ/ℤ), since ℚ ⊗ ℚ/ℤ = 0, so ⇒ needs finiteness. The zero module over a nonzero ring has empty support and is not nearly faithful. ACC+ §6.3.5 uses ⇒: the kernel of T∞ → End(H*(C∞)) is nilpotent, so Supp_{T∞}(H*(C∞)) = Spec T∞.

**Lemma: near faithfulness tested on minimal primes** (`Module.nearlyFaithful_iff_forall_minimalPrimes_mem_support`; node `nearly-faithful-iff-minimal-primes-mem-support`; file `NearlyFaithful`). Let R be a commutative ring and M a finite R-module. Then M is nearly faithful over R if and only if every minimal prime of R lies in Supp_R M.

*Hypotheses.* M is finite over R; finiteness is needed only for ⇒. There is no Noetherian hypothesis.

*Proof.*

1. ⇒: by the full-support lemma, Supp M = Spec R.
2. ⇐: every prime q contains a minimal prime p (`Ideal.exists_minimalPrimes_le`, Stacks 00E0). Since p ∈ Supp M and supports are stable under specialisation (`Module.mem_support_mono`), q ∈ Supp M. So Supp M = Spec R, and the full-support lemma applies.

*Acceptance.* ⇒ needs finiteness: ℚ/ℤ over ℤ is faithful and its support misses (0). One minimal prime is not enough: over the node A = k⟦x,y⟧/(xy), Supp(A/(x)) = V(x) contains (x) but not (y), and A/(x) is not nearly faithful (`nearlyFaithful_test_node`). Calegari–Geraghty test near faithfulness component by component (proof of Theorem 6.4, p. 94).

**Lemma: near faithfulness along a surjective ring map** (`nearlyFaithful_iff_annihilator_le_radical_ker`; node `nearly-faithful-restrict-scalars-surjective`). For
φ: A ↠ B and a B-module N, Ann_A(N) = φ⁻¹(Ann_B N), and

```text
N nearly faithful over B   ⟺   Ann_A(N) ⊆ √(ker φ).
```

No finiteness is needed. *Proof.* `Module.comap_annihilator` and `Ideal.comap_radical`.

**Lemma: the annihilator of M/IM has radical √I** (`Module.NearlyFaithful.radical_annihilator_quotient`; node `radical-annihilator-quotient`; file `NearlyFaithful`). Let M be a finite nearly faithful A-module and I ⊆ A an ideal. Then √Ann_A(M/IM) = √I.

*Hypotheses.* M is finite and nearly faithful over A. There is no Noetherian or local hypothesis.

*Proof.*

1. M has full support, so Supp(M/IM) = Supp M ∩ V(I) = V(I) (`Module.support_quotient`, Stacks 00L3).
2. M/IM is finite, so Supp(M/IM) = V(Ann_A(M/IM)) (`Module.support_eq_zeroLocus`).
3. V(Ann_A(M/IM)) = V(I) gives I ⊆ √Ann_A(M/IM) and Ann_A(M/IM) ⊆ √I (`PrimeSpectrum.zeroLocus_subset_zeroLocus_iff`).

*Acceptance.* Over ℤ, ℚ/2ℚ = 0 has annihilator ℤ, whose radical is not √(2) = (2): finiteness is needed. For A = ℤ, M = ℤ/2 and I = 0, √Ann M = (2) ≠ √0: near faithfulness is needed. For I = 0 the conclusion is the definition of near faithfulness.

**Lemma: near faithfulness passes to quotients** (`Module.NearlyFaithful.quotient`; node `nearly-faithful-quotient`; file `NearlyFaithful`; Taylor, Lemma 2.2(1)). Let M be finite and nearly faithful over A and I ⊆ A an ideal. Then M/IM is nearly faithful over A/I.

*Hypotheses.* M is finite and nearly faithful over A. There is no Noetherian hypothesis.

*Proof.*

1. I kills M/IM, which gives its A/I-module structure (`Module.isTorsionBySet_quotient_ideal_smul`, `Module.IsTorsionBySet.module`).
2. The map A → A/I is surjective with kernel I (`Ideal.mk_ker`). By the lemma on surjective ring maps, the claim is Ann_A(M/IM) ⊆ √I, which the radical lemma gives.

*Acceptance.* ℤ acts faithfully on ℚ, and ℚ/2ℚ = 0 is not nearly faithful over 𝔽₂ (`quotient_nearlyFaithful_requires_finite`): finiteness is needed. Taylor's proof of Theorem 4.1 applies the lemma to H_χ/λ over R_χ/λ.

**Lemma: a second action on M/IM has kernel inside √I** (`Module.NearlyFaithful.ker_le_radical_of_equiv_quotient`; node `quotient-action-kernel-bound`; file `NearlyFaithful`). Let M be finite and nearly faithful over A, I ⊆ A an ideal, φ: A → B any map of commutative rings, and N a B-module with the compatible A-action and an A-linear isomorphism M/IM ≅ N. Then ker φ ⊆ √I.

*Hypotheses.* M is finite and nearly faithful over A. φ need not be surjective.

*Proof.*

1. ker φ kills N, so ker φ ⊆ Ann_A(N) = Ann_A(M/IM) (`LinearEquiv.annihilator_eq`).
2. Ann_A(M/IM) ⊆ √I by the radical lemma.

*Acceptance.* The call-site example `quotient_kernel_bound_without_surjectivity` passes no surjectivity argument. For A = ℤ, M = ℚ, I = (2) and B = N = 0, ker(ℤ → 0) = ℤ ⊄ (2): finiteness is needed. For A = ℤ, M = N = B = ℤ/2 and I = 0, ker φ = (2) ⊄ √0: near faithfulness is needed.

**Lemma: near faithfulness for a second action on M/IM** (`Module.NearlyFaithful.of_equiv_quotient`; node `quotient-action-nearly-faithful`; file `NearlyFaithful`). With M, I and N as in the kernel bound, let φ: A → B be surjective and assume I ⊆ √(ker φ) (for instance I ⊆ ker φ). Then N is nearly faithful over B.

*Hypotheses.* M is finite and nearly faithful over A, φ is surjective and I ⊆ √(ker φ). Neither of the last two follows from the kernel bound.

*Proof.*

1. Ann_A(N) = Ann_A(M/IM) ⊆ √I ⊆ √(ker φ), by `LinearEquiv.annihilator_eq`, the radical lemma and the hypothesis.
2. The lemma on surjective ring maps turns this into near faithfulness over B.

*Acceptance.* For A = B = ℤ/6, φ = id, M = A and I = (2), ker φ = 0 ⊆ √I, but I ⊄ √0 and N = A/I is killed by the non-nilpotent element 2 (`quotient_action_requires_reverse_radical`). For A = 𝔽₂, B = 𝔽₂ × 𝔽₂ with the diagonal map, I = 0 and N = B/(0 × 𝔽₂) ≅ A, the idempotent (0, 1) kills N, so even an injective flat φ fails (`quotient_action_requires_surjective`). Taylor's case J ⊇ I is I ⊆ J ⊆ √J.

*Sources.* Taylor, Definition 2.1, the remark after it and Lemma 2.2(1) (IHÉS 108, pp. 187–188); ACC+ §6.5, p. 1066;
Calegari–Geraghty §6.1, Theorem 6.4; Stacks 00IM, 0EGG, 00L2, 00L3, 00E0, 02CE.
*Dependencies.* Mathlib only.

### Milestone 2: transport of supports

**Unconditional support inclusion under base change** (`Module.support_baseChange_subset`; node `support-base-change-subset`; file `BaseChange`). For every map φ:A→B of commutative rings and every A-module M, Supp_B(B⊗_A M) is contained in (Spec φ)⁻¹(Supp_A M).

*Hypotheses.* A and B are commutative rings and M is an A-module. No finiteness or flatness hypothesis.

*Proof.*

1. For q∈Spec B and p=φ⁻¹(q), equip B_q with its A_p-algebra structure using Localization.localRingHom and its coefficient-map identity. First use LocalizedModule.equivTensorProduct to identify (B⊗_A M)_q with B_q⊗_B(B⊗_A M); cancel B using TensorProduct.AlgebraTensorModule.cancelBaseChange to obtain B_q⊗_A M. In the opposite direction cancel A_p in B_q⊗_{A_p}(A_p⊗_A M), and identify A_p⊗_A M with M_p using the same localization equivalence. These existing maps and their inverses give the displayed local tensor identity; no new localization carrier or assumed equivalence is introduced.
2. If p is outside Supp_A M, then M_p is zero. Its tensor product with B_q is zero. By the local tensor identity, q is outside Supp_B(B⊗_A M). Take the contrapositive.

*Acceptance.* The inclusion is strict for A=ℤ, B=ℤ/2, M=ℚ: the right side is all Spec(ℤ/2), while the tensor product is zero. For the zero module both sides are empty.

*Dependencies.* mathlib:Module.support, mathlib:Module.mem_support_iff, mathlib:PrimeSpectrum.comap, mathlib:LocalizedModule.equivTensorProduct, mathlib:Localization.localRingHom, mathlib:Localization.localRingHom_to_map, mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange, mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul.

**Support under base change for a finite module** (`Module.support_baseChange`; node `support-base-change`; file `BaseChange`). For any map φ:A→B of commutative rings and any finite A-module M, Supp_B(B⊗_A M)=(Spec φ)⁻¹(Supp_A M).

*Hypotheses.* M is finite over A; no flatness, injectivity or finiteness hypothesis is imposed on the ring map φ.

*Proof.*

1. Apply support-base-change-subset for one inclusion.
2. If p=φ⁻¹(q) belongs to Supp_A M, the pinned finite-module residue-field criterion gives κ(p)⊗_A M≠0.
3. Use Ideal.ResidueField.map and map_algebraMap to give κ(q) its compatible κ(p)-algebra structure. A field extension is a nonzero free vector space; choose a nonempty basis, identify it with a Finsupp module, and use Module.FaithfullyFlat.finsupp and of_linearEquiv. The lTensor_nontrivial instance therefore gives κ(q)⊗_{κ(p)}(κ(p)⊗_A M)≠0.
4. Apply cancelBaseChange with the towers A→κ(p)→κ(q) and A→B→κ(q) to identify this module with κ(q)⊗_B(B⊗_A M). The coefficient-map identities ensure both are the same A action.
5. B⊗_A M is finite over B by Module.Finite.base_change. Apply the finite-module residue-field support criterion over B to obtain q in its support.

*Acceptance.* For ℤ→ℤ/2 and the finite module ℤ/2, the tensor product has full support over ℤ/2 even though the coefficient map is not flat. The finite hypothesis is on M, not on φ; the finite ring map ℤ→ℤ/2 with M=ℚ is the counterexample when M is not finite. For arbitrary power-series variables and a finite M, this is the support equality used by the framing branch.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/support-base-change-subset, mathlib:Module.mem_support_iff_nontrivial_residueField_tensorProduct, mathlib:Module.Finite.base_change, mathlib:Ideal.ResidueField.map, mathlib:Ideal.ResidueField.map_algebraMap, mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange, mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul, mathlib:Module.Basis.ofVectorSpace, mathlib:Module.FaithfullyFlat.finsupp, mathlib:Module.FaithfullyFlat.of_linearEquiv, mathlib:Module.FaithfullyFlat.lTensor_nontrivial.

**Support under a flat base change** (`Module.support_baseChange_of_flat`; node `support-base-change-flat`; file `BaseChange`). For a flat map φ:A→B of commutative rings and any A-module M, Supp_B(B⊗_A M)=(Spec φ)⁻¹(Supp_A M).

*Hypotheses.* B is flat as an A-module. M may be infinitely generated.

*Proof.*

1. Use support-base-change-subset for the forward inclusion.
2. For q∈Spec B and p=φ⁻¹(q), equip B_q with its A_p-algebra structure using Localization.localRingHom and its coefficient-map identity. First use LocalizedModule.equivTensorProduct to identify (B⊗_A M)_q with B_q⊗_B(B⊗_A M); cancel B using TensorProduct.AlgebraTensorModule.cancelBaseChange to obtain B_q⊗_A M. In the opposite direction cancel A_p in B_q⊗_{A_p}(A_p⊗_A M), and identify A_p⊗_A M with M_p using the same localization equivalence. These existing maps and their inverses give the displayed local tensor identity; no new localization carrier or assumed equivalence is introduced.
3. For q over p, Localization.flat makes B_q flat over A. Module.flat_iff_of_isLocalization transfers this to flatness over A_p. The canonical localRingHom is local by isLocalHom_localRingHom. Apply Module.FaithfullyFlat.of_flat_of_isLocalHom to obtain faithful flatness of B_q over A_p.
4. If M_p is nonzero, Module.FaithfullyFlat.lTensor_nontrivial makes B_q⊗_{A_p}M_p nonzero. Transfer across the local tensor identity to obtain q in the support.

*Acceptance.* For ℤ→ℚ and the infinite direct sum of copies of ℤ, the tensor product has full support over ℚ. No finite-module hypothesis is used. For a localization A→A[1/s], arbitrary module support restricts to D(s), including the empty open when s is nilpotent. Global faithful flatness is not required: it is the local map at each existing q over p that is faithfully flat.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/support-base-change-subset, mathlib:Module.support, mathlib:Module.mem_support_iff, mathlib:PrimeSpectrum.comap, mathlib:LocalizedModule.equivTensorProduct, mathlib:Localization.localRingHom, mathlib:Localization.localRingHom_to_map, mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange, mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul, mathlib:Module.Flat, mathlib:Localization.flat, mathlib:Module.flat_iff_of_isLocalization, mathlib:Localization.isLocalHom_localRingHom, mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom, mathlib:Module.FaithfullyFlat.lTensor_nontrivial.

**Lemma: support along a surjective ring map** (`support_eq_image_comap_of_surjective`; node `support-restrict-scalars-surjective`). For φ: A ↠ B with kernel I
and any B-module N, Supp_A(N) = (Spec φ)(Supp_B N): 𝔭 ∈ Supp_A N iff I ⊆ 𝔭 and φ(𝔭) ∈ Supp_B N. *Proof.* An element
of I outside 𝔭 kills N and is invertible on N_𝔭; for I ⊆ 𝔭, A_𝔭 ⊗_A N ≅ B_{φ(𝔭)} ⊗_B N (Stacks 00E5).

The quotient case Supp(M/IM) = Supp M ∩ V(I) for finite M is Mathlib's `Module.support_quotient` and is cited, not
restated.

**Lemma: near faithfulness ascends along base change** (`Module.NearlyFaithful.baseChange`; node `nearly-faithful-base-change`; file `BaseChange`). For any map φ: A → B of commutative rings and any finite nearly faithful A-module M, B ⊗_A M is nearly faithful over B.

*Hypotheses.* M is finite over A. There is no hypothesis on φ and no Noetherian hypothesis.

*Proof.*

1. B ⊗_A M is finite over B (`Module.Finite.base_change`).
2. Full support of M and support-base-change give Supp_B(B ⊗_A M) = (Spec φ)⁻¹(Spec A) = Spec B. Conclude by full support over B.

*Acceptance.* ℚ is faithful over ℤ, but (ℤ/2) ⊗_ℤ ℚ = 0: finiteness is needed. ℤ⟦X⟧ ⊗_ℤ ℤ is nearly faithful over ℤ⟦X⟧.

**Lemma: near faithfulness descends when minimal primes lift** (`Module.NearlyFaithful.of_baseChange`; node `nearly-faithful-of-base-change`; file `BaseChange`). Let φ: A → B be a map of commutative rings and M a finite A-module. If every minimal prime of A is φ⁻¹(q) for a prime q of B, and B ⊗_A M is nearly faithful over B, then M is nearly faithful over A.

*Hypotheses.* M is finite. The minimal primes of A lift to Spec B, for instance when φ is faithfully flat or has a ring retraction. There is no Noetherian hypothesis.

*Proof.*

1. B ⊗_A M is finite and nearly faithful, so Supp_B(B ⊗_A M) = Spec B (full support over B).
2. For a minimal prime p = φ⁻¹(q), q ∈ Supp_B(B ⊗_A M) ⊆ (Spec φ)⁻¹(Supp_A M) by support-base-change-subset, so p ∈ Supp_A M. Conclude by the minimal-prime test over A.

*Acceptance.* Let A = k × k → B = k be the first projection and M = A/(0 × k) ≅ k × 0. Then B ⊗_A M = k is faithful over B, while Ann_A M = 0 × k ⊄ √0; the minimal prime k × 0 does not lift. Along A → A⟦x_s : s ∈ σ⟧ every prime of A lifts, for any σ.

**Lemma: near faithfulness under faithfully flat base change and coefficient change** (`Module.nearlyFaithful_baseChange_iff`; node `nearly-faithful-base-change-iff`; file `BaseChange`). If B is faithfully flat over A and M is a finite A-module, then B ⊗_A M is nearly faithful over B if and only if M is nearly faithful over A.

*Hypotheses.* B is faithfully flat over A and M is finite. There is no Noetherian hypothesis.

*Proof.*

1. ⇐ is ascent.
2. ⇒: Spec B → Spec A is surjective (`PrimeSpectrum.comap_surjective_of_faithfullyFlat`, Stacks 00HQ), so descent applies.

*Acceptance.* Coefficient change: for a faithfully flat 𝒪 → 𝒪′ and an 𝒪-algebra A, A → A ⊗_𝒪 𝒪′ is faithfully flat (the base-change instance of `Module.FaithfullyFlat`, Stacks 00HI). So M is nearly faithful over A if and only if (A ⊗_𝒪 𝒪′) ⊗_A M ≅ 𝒪′ ⊗_𝒪 M is nearly faithful over A ⊗_𝒪 𝒪′. The flat projection k × k → k above shows that faithful flatness cannot be weakened to flatness. Over ℤ_p, B = ℤ_p × ℚ_p is faithfully flat and M = ℚ_p/ℤ_p is faithful, while B ⊗ M = M × 0 is killed by (0, 1): finiteness is needed.

**Lemma: kernel of the framing augmentation** (`MvPowerSeries.ker_constantCoeff`; node
`framing-augmentation-kernel`). Let σ be finite, B = A⟦x_s : s ∈ σ⟧ and J = (x_s : s ∈ σ).
The constant-coefficient map ε: B → A has kernel J. There is no Noetherian or flatness hypothesis.
The zero coefficient ring is allowed. To prove the reverse inclusion, order σ and, for f with ε(f) = 0,
define g_s at a multi-index e to have the coefficient of f at e + δ_s when s is the first variable
occurring in e + δ_s, and zero otherwise. Every nonzero monomial contributes to exactly one x_s g_s.
The pinned coefficient formula for multiplication by a monomial and coefficient extensionality give
f = Σ_s x_s g_s, a finite sum in J. If σ is empty there are no nonconstant monomials and ker ε = 0.

Finiteness matters for this kernel formula. Over F₂ with σ = N, the power series with coefficient 1
at each x_n and zero at every other monomial has constant coefficient zero. Every element of J is
a finite sum of multiples of variables. Choose n outside that finite set: its coefficient at x_n
vanishes, unlike the displayed series. Thus this series lies outside J. This counterexample uses a
nonzero coefficient ring; over the zero ring both ideals are zero for every variable set.

**Lemma: adjoining framing variables** (`Module.nearlyFaithful_mvPowerSeries_baseChange_iff`; retained
node `framing-variables`). For **any** set σ and a finite A-module M, near faithfulness of M over A is
equivalent to near faithfulness of A⟦x_s : s ∈ σ⟧ ⊗_A M over A⟦x_s : s ∈ σ⟧. Ascent is finite-module
base change. For descent, let C: A → B include constant series. The pinned identity ε ∘ C = id_A
holds without a finiteness condition on σ. Every prime p of A is the contraction of ε⁻¹(p) along C,
so the minimal-prime descent clause of `NearlyFaithful.of_baseChange` applies. This proof does not
use the kernel formula. In particular it applies to countably many variables over F₂, even though
that kernel formula fails. For an empty variable set it recovers invariance under B ≅ A.

**Lemma: removing framing variables** (`Module.NearlyFaithful.quotient_span_X`; node
`framing-quotient-nearly-faithful`). Let σ be finite. If N is finite and nearly faithful over B, then
N/JN is nearly faithful over A, with A acting by constant series. The quotient theorem first gives
near faithfulness over B/J. The kernel formula, surjectivity of ε (since ε(C(a)) = a), and the pinned
first isomorphism theorem identify B/J with A. This identification sends the class of C(a) to a,
so it transports the stated scalar action, its annihilator, and the radical near-faithfulness condition.
The acceptance cases include N = B with two variables and the empty-variable quotient N/0.
This uses the radical generalization of Taylor's quotient argument already planned in Milestone 1;
Taylor Lemma 2.2 itself is stated for finite modules over Noetherian local rings.

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

**Lemma: near faithfulness tested on the minimal primes of R[1/ϖ]** (`Module.nearlyFaithful_iff_forall_minimalPrimes_away_mem_support`; node `nearly-faithful-iff-minimal-primes-away-mem-support`; file `Localization`). Let ϖ be a nonzerodivisor of R and M a finite R-module. Then M is nearly faithful over R if and only if every minimal prime of R[1/ϖ] lies in Supp M[1/ϖ]. Equivalently, every irreducible component of Spec R[1/ϖ] lies in Supp M[1/ϖ], since the components are the closures of the minimal primes.

*Hypotheses.* ϖ is a nonzerodivisor and M is finite. There is no Noetherian hypothesis.

*Proof.*

1. M[1/ϖ] ≅ R[1/ϖ] ⊗_R M (`LocalizedModule.equivTensorProduct`, `LinearEquiv.support_eq`). By support-base-change, Supp M[1/ϖ] is the preimage of Supp M.
2. Contraction maps the minimal primes of R[1/ϖ] onto those of R (the lemma on minimal primes after inverting a nonzerodivisor). Conclude by the minimal-prime test over R.

*Acceptance.* For R = ℤ_p × 𝔽_p, ϖ = (p, 0) and M = ℤ_p × 0, R[1/ϖ] = ℚ_p and its generic point lies in Supp M[1/ϖ], but M is not nearly faithful. Over ℤ_p, ℚ_p/ℤ_p is faithful and (ℚ_p/ℤ_p)[1/p] = 0.

**Lemma: near faithfulness tested after inverting ϖ** (`Module.nearlyFaithful_iff_localizedModule_away`; node `nearly-faithful-after-inverting`; file `Localization`). Let ϖ be a nonzerodivisor of R and M a finite R-module. Then M is nearly faithful over R if and only if M[1/ϖ] is nearly faithful over R[1/ϖ].

*Hypotheses.* ϖ is a nonzerodivisor and M is finite. There is no Noetherian hypothesis.

*Proof.*

1. M[1/ϖ] is finite over R[1/ϖ] (`Module.Finite.of_isLocalizedModule`).
2. By the minimal-prime test over R[1/ϖ] and the previous lemma, both sides are equivalent to every minimal prime of R[1/ϖ] lying in Supp M[1/ϖ].

*Acceptance.* The two examples of the previous lemma show that ϖ must be a nonzerodivisor and M finite.

**Lemma: faithfulness tested after inverting ϖ** (`Module.faithfulSMul_iff_localizedModule_away`; node `faithful-iff-after-inverting`; file `Localization`). Let ϖ be a nonzerodivisor of R with R[1/ϖ] reduced, and M a finite R-module. Then M is faithful over R if and only if M[1/ϖ] is faithful over R[1/ϖ].

*Hypotheses.* ϖ is a nonzerodivisor, R[1/ϖ] is reduced (for instance regular) and M is finite.

*Proof.*

1. R → R[1/ϖ] is injective (`Submonoid.powers_le`, `IsLocalization.injective`), so R is reduced (`isReduced_of_injective`).
2. Over a reduced ring, nearly faithful means faithful (`nilradical_eq_bot_iff`, `Module.annihilator_eq_bot`). Apply the previous lemma.

*Acceptance.* For R = ℤ_p × 𝔽_p and ϖ = (p, 0), R[1/ϖ] = ℚ_p is reduced, and M = ℤ_p × 0 becomes faithful after inverting ϖ without being faithful. Khare–Wintenberger II, Lemma 9.6 b), is ⇐ with ϖ = 2. For finite M the equivalence also holds without reducedness, since Ann_{R[1/ϖ]}(M[1/ϖ]) = Ann_R(M)[1/ϖ] and R has no ϖ-torsion; the hypothesis follows the sources.

*Sources.* Calegari–Geraghty, proof of Theorem 6.4, p. 94 ("Since R∞ is p-torsion free, all its minimal primes have
characteristic 0"); Khare–Wintenberger II, proof of Lemma 9.6 b); Stacks 00EU, 00E3, 00LD.
*Dependencies.* Milestones 1 and 2.

### Milestone 4: maximal depth, components and symmetry

**Lemma: associated primes of a module of maximal depth** (`Module.mem_minimalPrimes_of_mem_associatedPrimes_of_isRegular`; node `maximal-depth-associated-primes-minimal`; file `Components`). Let (A, 𝔪) be a Noetherian local ring and M a finite A-module with an M-regular sequence r₁, …, r_n in 𝔪 of length n = dim A. Then every associated prime P of M is a minimal prime of A, and dim A/P = dim A.

*Hypotheses.* A is Noetherian and local, and M is finite. The sequence is M-regular in Mathlib's sense (`RingTheory.Sequence.IsRegular`, which includes M/(r₁, …, r_n)M ≠ 0), each rᵢ lies in 𝔪, and n = dim A in WithBot ℕ∞. Together these say M ≠ 0 and depth_A M ≥ dim A.

*Proof.*

1. The sequence gives depth_A M ≥ dim A. The associated-prime bound of the integrated R03.3 depth node (Stacks 0BK4: depth M ≤ dim A/P for P ∈ Ass M) gives dim A ≤ dim A/P, and `ringKrullDim_quotient_le` gives dim A/P ≤ dim A.
2. dim A is finite (`ringKrullDim_lt_top`, with the Noetherian-local `FiniteRingKrullDim` instance). By `ringKrullDim_quotient` there is a chain of primes of length dim A starting at P. A prime strictly inside P would extend it to a chain of length dim A + 1, so P is a minimal prime of A.

*Acceptance.* Over the node A = k⟦x,y⟧/(xy), M = A/(x) with the M-regular element x + y has the single associated prime (x), a minimal prime with dim A/(x) = 1 = dim A. The length condition is needed: over A = k⟦x,y⟧, M = A/(x) has the M-regular sequence y of length 1 < 2 = dim A, and its associated prime (x) is not minimal. When dim A = 0, the empty sequence is M-regular exactly when M ≠ 0, and 𝔪 is the only prime.

**Lemma: primes minimal over the annihilator have maximal dimension** (`Module.ringKrullDim_quotient_eq_of_isRegular`; node `maximal-depth-annihilator-primes-top-dimensional`; file `Components`). Under the same hypotheses on A, M and r₁, …, r_n, every prime P minimal over Ann_A M satisfies dim A/P = dim A.

*Hypotheses.* As in the previous lemma, and P is a prime minimal over Ann_A M.

*Proof.* P is an associated prime of M (`Module.associatedPrimes.minimalPrimes_annihilator_subset_associatedPrimes`, Stacks 02CE, for A Noetherian and M finite). Apply the dimension clause of `maximal-depth-associated-primes-minimal`.

*Acceptance.* Over the node, Ann M = (x) and dim A/(x) = 1 = dim A. Maximal depth is needed: A = k⟦x,y,z⟧/(xy, xz) has dimension 2, and M = A/(y, z) ≅ k⟦x⟧ has the M-regular sequence x of length 1; the prime (y, z), minimal over Ann M and even a minimal prime of A, has dim A/(y, z) = 1. The equidimensionality lemma below applies this lemma to the minimal primes of A.

**Theorem: modules of maximal depth are supported on components** (`Module.isSupportedOnComponents_of_isRegular`; node `maximal-cm-support-top-components`; file `Components`). Under the same hypotheses, M is supported on components: every prime minimal over Ann_A M is a minimal prime of A. With `isSupportedOnComponents_iff_exists_irreducibleComponents` and the previous lemma, Supp M is a union of irreducible components of Spec A of dimension dim A (Taylor, Lemma 2.3).

*Hypotheses.* As in the first lemma of this milestone. The conclusion is not full support.

*Proof.* A prime minimal over Ann_A M is an associated prime of M (`Module.associatedPrimes.minimalPrimes_annihilator_subset_associatedPrimes`), hence a minimal prime of A by `maximal-depth-associated-primes-minimal`. This is the definition of supported on components.

*Acceptance.* Counterexample to full support: over A = k⟦x,y⟧/(xy), M = A/(x) has the M-regular element x + y, so depth M = 1 = dim A; Supp M = V(x) is one of the two components, and M is not nearly faithful. The length condition is needed: over k⟦x,y⟧, M = A/(x) with the sequence y is not supported on components, since (x) is not a minimal prime. The zero module is supported on components vacuously. M ≠ 0 (depth 0 = ∞) matters for Taylor's "depth M = dim A" and for the irreducible-base lemma below.

**Lemma: a nearly faithful module of maximal depth forces equidimensionality**
(`NearlyFaithful.ringKrullDim_quotient_eq_of_isRegular`; node `nearly-faithful-maximal-depth-equidimensional`; Calegari–Geraghty, Remark 6.5). If A is Noetherian local and
M is finite, nearly faithful and depth_A M ≥ dim A, then dim A/𝔭 = dim A for every minimal prime 𝔭. *Proof.* Each
minimal prime lies in Supp M (`nearly-faithful-iff-minimal-primes-mem-support`), hence is minimal over Ann M; apply
`maximal-depth-annihilator-primes-top-dimensional`. *Test.* A = k⟦x,y,z⟧/(xy, xz) has
components of dimensions 2 and 1, so no finite module of depth 2 is nearly faithful over it.

**Lemma: maximal depth over an irreducible base gives near faithfulness** (`Module.nearlyFaithful_of_isRegular_of_subsingleton_minimalPrimes`; node `maximal-cm-nearly-faithful-irreducible`; file `Components`; Taylor, Lemma 2.3). Let (A, 𝔪) be a Noetherian local ring with at most one minimal prime, and M a finite A-module with an M-regular sequence r₁, …, r_n in 𝔪 of length n = dim A. Then M is nearly faithful.

*Hypotheses.* A is Noetherian and local, and its set of minimal primes is a subsingleton; as A ≠ 0, Spec A is irreducible. M is finite, with the regular sequence as in the maximal-depth theorem, which includes M ≠ 0.

*Proof.*

1. M ≠ 0 (`RingTheory.Sequence.IsRegular.nontrivial`), so M has an associated prime Q (`associatedPrimes.nonempty`). Q is the annihilator of an element, so Ann M ⊆ Q, and `Ideal.exists_minimalPrimes_le` gives a prime P ⊆ Q minimal over Ann M.
2. By the maximal-depth theorem, P is a minimal prime of A, hence the only one.
3. Ann M ⊆ P, so P ∈ Supp M (`Module.mem_support_iff_of_finite`). Every minimal prime of A lies in Supp M; conclude by `nearlyFaithful_iff_forall_minimalPrimes_mem_support`.

*Acceptance.* "A unique minimal prime of maximal dimension" is not enough: over A = k⟦x,y,z⟧/(xy, xz), M = A/(x) ≅ k⟦y,z⟧ has the M-regular sequence y, z of length 2 = dim A, and Ann M = (x) is not nilpotent. M ≠ 0 is needed, and the regular-sequence hypothesis enforces it; Taylor omits it (source issue E2). Taylor applies the lemma to a patched ring with a unique minimal prime (proof of Theorem 4.1).

**Lemma: maximal depth with an irreducible generic fibre gives near faithfulness** (`Module.nearlyFaithful_of_isRegular_of_subsingleton_minimalPrimes_away`; node `maximal-depth-nearly-faithful-irreducible-away`; file `Components`; Calegari–Geraghty, Theorem 6.4(2)). Let A, M and r₁, …, r_n be as in the maximal-depth theorem, and let ϖ be a nonzerodivisor of A such that A[1/ϖ] has at most one minimal prime. Then M is nearly faithful.

*Hypotheses.* As in the previous lemma, with the condition on minimal primes imposed on A[1/ϖ] (`Localization.Away ϖ`) instead of A, and ϖ ∈ A a nonzerodivisor.

*Proof.* Contraction maps the minimal primes of A[1/ϖ] onto those of A (`IsLocalization.Away.comap_minimalPrimes_eq_of_mem_nonZeroDivisors`, Milestone 3), so A has at most one minimal prime; apply the previous lemma.

*Acceptance.* ϖ must be a nonzerodivisor: A = ℤ_p⟦x⟧/(px) is local of dimension 1 with minimal primes (p) and (x), p kills x, and A[1/p] ≅ ℚ_p has one minimal prime. M = A/(p) ≅ 𝔽_p⟦x⟧ has the M-regular element x, and Ann M = (p) is not nilpotent. Calegari–Geraghty apply the lemma to the p-torsion-free ring R∞ with R∞[1/p] irreducible.

**Lemma: the annihilator is stable under a semilinear action** (`Module.smul_mem_annihilator_of_smulDistribClass`; node `annihilator-group-stable`; file `Components`). Let a group G act on a commutative ring A by ring automorphisms and on an A-module M by additive automorphisms, semilinearly: g(a·m) = g(a)·g(m). If a ∈ Ann M and g ∈ G, then g(a) ∈ Ann M.

*Hypotheses.* `MulSemiringAction G A`, `DistribMulAction G M` and `SMulDistribClass G A M`. No finiteness of G or M and no Noetherian hypothesis.

*Proof.* For m ∈ M, g(a)·m = g(a)·g(g⁻¹m) = g(a·g⁻¹m) = g(0) = 0 (`Module.mem_annihilator`).

*Acceptance.* Semilinearity is needed: let ℤ/2 swap the factors of A = k × k and act trivially on M = k × 0. Then Ann M = 0 × k, and the swap sends (0, 1) to (1, 0), which does not kill M. Khare–Wintenberger II use the lemma for the annihilator of L_{m,n} under 𝔗2(𝒪) (proof of Lemma 9.6 b)).

**Lemma: the support is stable under a semilinear action** (`Module.comap_mulSemiringAction_mem_support`; node `support-group-stable`; file `Components`). In the same setting, if 𝔭 ∈ Supp M and g ∈ G, then the prime {a : g(a) ∈ 𝔭}, the preimage of 𝔭 under a ↦ g(a), lies in Supp M.

*Hypotheses.* As in the previous lemma; M is arbitrary.

*Proof.* Choose m with Ann(A·m) ⊆ 𝔭 (`Module.mem_support_iff_exists_annihilator`). If a·g⁻¹m = 0, then g(a)·m = g(a·g⁻¹m) = 0, so g(a) ∈ 𝔭 (`Submodule.mem_annihilator_span_singleton`). Thus Ann(A·g⁻¹m) lies in the preimage, and the same criterion puts it in Supp M.

*Acceptance.* For the non-semilinear swap action above, Supp M = {0 × k}, and the preimage k × 0 of 0 × k is not in the support. Complex conjugation acts semilinearly on ℤ[i] and on M = ℤ[i]/(5), and exchanges the two primes (2 + i), (2 − i) of Supp M.

**Lemma: near faithfulness from a group transitive on components** (`Module.nearlyFaithful_of_forall_minimalPrimes_exists_smul`; node `support-group-transitive`; file `Components`). In the same setting, suppose that for all minimal primes 𝔭, 𝔮 of A some g ∈ G has {a : g(a) ∈ 𝔭} = 𝔮, and that one minimal prime 𝔭 lies in Supp M. Then M is nearly faithful.

*Hypotheses.* As above. The transitivity is an arithmetic input of the consumer (Khare–Wintenberger II, Lemma 9.4). No finiteness of G or M and no Noetherian hypothesis.

*Proof.* For each minimal prime 𝔮, transitivity and the previous lemma put 𝔮 in Supp M. The constructor `nearlyFaithful_of_forall_minimalPrimes_mem_support` needs no finiteness. If A is Noetherian, `nearlyFaithful_iff_isNilpotent_annihilator` then makes Ann M nilpotent.

*Acceptance.* Transitivity is needed: A = k × k, G trivial, M = k × 0. A minimal prime in the support is needed: M = 0.

**Lemma: faithfulness over a reduced ring** (`Module.faithfulSMul_of_forall_minimalPrimes_exists_smul`; node `faithful-group-transitive`; file `Components`). If moreover A is reduced, M is faithful.

*Hypotheses.* As in the previous lemma, and A reduced.

*Proof.* The previous lemma gives Ann M ⊆ √0, and √0 = 0 (`nilradical_eq_bot_iff`); Ann M = 0 is faithfulness (`Module.annihilator_eq_bot`).

*Acceptance.* Reducedness is needed: over the dual numbers k[ε] with G trivial, M = k is nearly faithful and not faithful. Khare–Wintenberger II, Lemma 9.6 b): 𝔗2(𝒪) ≅ (±1)^t permutes the components of the regular ring R∞[1/2] transitively, so M∞[1/2] is faithful.

**Lemma: lifting near faithfulness from the special fibre** (`NearlyFaithful.of_quotient_of_isSMulRegular`; node `nearly-faithful-lift-from-special-fibre`; Taylor,
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
*Dependencies.* Milestones 1 and 3; the integrated R03.3 depth node for its associated-prime bound, and
`R03.3/catenary-iff-dimension-function` for the catenarity equivalence. Mathlib supplies nonempty associated primes and finite local
Krull dimension; these are not new R03.3 deliverables.

### Milestone 5: R = T

Throughout, T is a commutative R-algebra acting faithfully on H, compatibly with R, so that
ker(R → T) = Ann_R(H). Surjectivity of R → T is assumed only where an entry states it. File `ImageInEnd`.

**Lemma: the kernel of R → T is nil** (`Module.NearlyFaithful.ker_algebraMap_le_nilradical`; node `r-to-t-kernel-nil`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If H is nearly faithful over R, then ker(R → T) ⊆ √0.

*Hypotheses.* H nearly faithful over R. R → T need not be surjective; no finiteness or Noetherian hypothesis. The faithful T-action is in the signature, but the proof uses only compatibility of the two actions.

*Proof.*

1. Module.comap_annihilator gives Ann_R(H) = (R → T)⁻¹(Ann_T(H)), which contains (R → T)⁻¹(0) = ker(R → T).
2. Ann_R(H) ⊆ √0 is the defining property of a nearly faithful module.

*Acceptance.* R = k × k and T = H = k via the first projection: T acts faithfully and ker(R → T) = 0 × k ⊄ √0 = 0, so near faithfulness is needed. For R = T = H = k[ε] the inclusion 0 ⊆ (ε) is strict.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful, mathlib:Module.comap_annihilator.

**Lemma: over a Noetherian ring the kernel is nilpotent** (`Module.NearlyFaithful.isNilpotent_ker_algebraMap`; node `r-to-t-kernel-nilpotent`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If R is Noetherian and H is nearly faithful over R, then ker(R → T) is a nilpotent ideal.

*Hypotheses.* R Noetherian; H nearly faithful. No surjectivity; the faithful T-action is unused.

*Proof.*

1. r-to-t-kernel-nil gives ker(R → T) ⊆ √0.
2. The kernel is finitely generated (IsNoetherian.noetherian), so Ideal.FG.isNilpotent_iff_le_nilradical makes it nilpotent (Stacks 00IM).

*Acceptance.* Stacks 0EGG: S = k[x_0, x_1, …]/(x_n^{n+1}), J = (x_n), T = H = S/J = k. H is nearly faithful over S and ker(S → T) = J is not nilpotent, so the Noetherian hypothesis is needed. Use-site: ACC+ §6.3.5 (the kernel of T∞ → End(H^*(C∞)) is nilpotent).

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/r-to-t-kernel-nil, mathlib:IsNoetherian.noetherian, mathlib:Ideal.FG.isNilpotent_iff_le_nilradical.

**Lemma: R_red ≅ T_red** (`Module.NearlyFaithful.exists_ringEquiv_nilradical`; node `r-red-equals-t-red`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If H is nearly faithful over R and R → T is surjective, then R/√0 ≅ T/√0 by a ring isomorphism sending [r] to [image of r].

*Hypotheses.* H nearly faithful; R → T surjective. T need not be reduced; the faithful T-action is unused.

*Proof.*

1. Let g: R → T/√0 be R → T followed by the quotient map; g is surjective. By Ideal.Quotient.eq_zero_iff_mem, ker g = √ker(R → T).
2. r-to-t-kernel-nil gives ker(R → T) ⊆ √0, so √ker(R → T) = √0 and ker g = √0.
3. RingHom.quotientKerEquivOfSurjective for g, precomposed with Ideal.quotEquivOfEq, gives the isomorphism with the stated values.

*Acceptance.* R = k × k, T = H = k (first projection) shows near faithfulness is needed; R = k, T = H = k × k (diagonal) shows surjectivity is needed; R = T = H = k[ε] has non-reduced T.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/r-to-t-kernel-nil, mathlib:Ideal.Quotient.eq_zero_iff_mem, mathlib:nilradical, mathlib:Ideal.radical, mathlib:RingHom.quotientKerEquivOfSurjective, mathlib:Ideal.quotEquivOfEq.

**Lemma: T reduced iff ker(R → T) = √0** (`Module.NearlyFaithful.isReduced_iff_ker_eq_nilradical`; node `t-reduced-iff-kernel-nilradical`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If H is nearly faithful over R and R → T is surjective, then T is reduced iff ker(R → T) = √0.

*Hypotheses.* H nearly faithful; R → T surjective; the faithful T-action is unused.

*Proof.*

1. RingHom.quotientKerEquivOfSurjective identifies T with R/ker(R → T); by isReduced_of_injective in both directions and Ideal.isRadical_iff_quotient_reduced, T is reduced iff ker(R → T) is radical.
2. r-to-t-kernel-nil gives √ker(R → T) = √0, so ker(R → T) is radical iff it equals √0.

*Acceptance.* R = k × k, T = H = k (first projection): T is reduced and ker(R → T) = 0 × k ≠ 0. R = k, T = H = k[ε]: ker(R → T) = 0 = √0 but T is not reduced, so surjectivity is needed. R = T = H = k[ε]: both sides fail.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/r-to-t-kernel-nil, mathlib:RingHom.quotientKerEquivOfSurjective, mathlib:isReduced_of_injective, mathlib:Ideal.isRadical_iff_quotient_reduced, mathlib:nilradical, mathlib:Ideal.radical.

**Theorem: reduced R = T from near faithfulness** (`Module.NearlyFaithful.exists_ringEquiv_of_isReduced`; node `r-equals-t-reduced`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If H is nearly faithful over R, T is reduced and R → T is surjective, then R/√0 ≅ T by a ring isomorphism sending [r] to the image of r. The basic example is T = R/Ann_R(H), the image of R in End(H).

*Hypotheses.* H nearly faithful; T reduced; R → T surjective; the faithful T-action is unused.

*Proof.*

1. t-reduced-iff-kernel-nilradical gives ker(R → T) = √0.
2. RingHom.quotientKerEquivOfSurjective, precomposed with Ideal.quotEquivOfEq, gives the isomorphism.

*Acceptance.* R = T = H = k[ε]: H is faithful, R_red = k and T is not reduced, so 'T reduced' is needed. R = k × k, T = H = k (first projection): T is reduced but R_red = k × k ≇ k.

*Source.* Taylor, Theorem 4.1 ("As T is reduced, the theorem follows").

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/t-reduced-iff-kernel-nilradical, mathlib:RingHom.quotientKerEquivOfSurjective, mathlib:Ideal.quotEquivOfEq.

**Lemma: ϖ-power torsion lies in the kernel of R → T** (`Module.ker_away_le_ker_algebraMap`; node `torsion-in-kernel`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If ϖ ∈ R is H-regular, then R[ϖ^∞] = ker(R → R[1/ϖ]) = {r : ϖⁿr = 0 for some n} is contained in ker(R → T), so R → T factors through R^tf = R/R[ϖ^∞].

*Hypotheses.* ϖ H-regular (not necessarily a nonzerodivisor of R); T faithful on H. No surjectivity, no finiteness.

*Proof.*

1. IsLocalization.eq_iff_exists and Submonoid.mem_powers_iff: r ∈ R[ϖ^∞] iff ϖⁿr = 0 for some n.
2. Then ϖⁿ(rh) = 0 and IsSMulRegular.pow give rh = 0 for every h ∈ H, so r ∈ Ann_R(H).
3. Module.comap_annihilator and Module.annihilator_eq_bot (T faithful) give Ann_R(H) = ker(R → T).

*Acceptance.* R = T = H = ℤ_p[ε]/(ε², pε), ϖ = p: ε is p-torsion but ε ≠ 0 in T, and p is not H-regular. For ϖ = 0, H-regularity forces H = 0 and T = 0.

*Dependencies.* mathlib:Localization.Away, mathlib:IsSMulRegular, mathlib:IsLocalization.eq_iff_exists, mathlib:Submonoid.mem_powers_iff, mathlib:IsSMulRegular.pow, mathlib:Module.comap_annihilator, mathlib:Module.annihilator_eq_bot.

**Theorem: torsion-free R = T** (`Module.exists_ringEquiv_torsionFree_iff_faithfulSMul`; node `r-equals-t-torsion-free-quotient`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. Let ϖ ∈ R be H-regular and R → T surjective. Then R^tf ≅ T by a ring isomorphism sending [r] to the image of r iff H[1/ϖ] is faithful over R[1/ϖ]:

```text
H[1/ϖ] faithful over R[1/ϖ]   ⟺   ker(R → T) = R[ϖ^∞]   ⟺   R^tf ≅ T.
```

*Hypotheses.* ϖ H-regular; T faithful on H; R → T surjective. No finiteness of H.

*Proof.*

1. Module.comap_annihilator and Module.annihilator_eq_bot give ker(R → T) = Ann_R(H); torsion-in-kernel gives R[ϖ^∞] ⊆ ker(R → T).
2. (⇐) An element of ker(R → T) kills H, hence H[1/ϖ] (LocalizedModule.induction_on, algebraMap_smul, LocalizedModule.smul'_mk), so it dies in R[1/ϖ] by faithfulness. Then RingHom.quotientKerEquivOfSurjective and Ideal.quotEquivOfEq give the isomorphism.
3. (⇒) The compatible isomorphism gives ker(R → T) = R[ϖ^∞] (Ideal.Quotient.eq_zero_iff_mem). If x kills H[1/ϖ], write x·(s/1) = r/1 (IsLocalization.surj); LocalizedModule.mk_eq, Submonoid.mem_powers_iff and IsSMulRegular.pow give r ∈ Ann_R(H) = R[ϖ^∞], so r/1 = 0 and x = 0 (IsLocalization.map_units).

*Acceptance.* R = T = H = ℤ_p[ε]/(ε², pε), ϖ = p: H[1/p] = ℚ_p is faithful over R[1/p] = ℚ_p, and T = R ≠ R^tf = ℤ_p, since H has p-torsion. R = k, T = H = k × k (diagonal), ϖ = 1 shows surjectivity is needed.

*Source.* Kisin (3.3.1) ("isomorphism up to p-torsion"); Khare–Wintenberger II, Propositions 9.2(III) and 9.3(III).

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/torsion-in-kernel, mathlib:FaithfulSMul, mathlib:Localization.Away, mathlib:LocalizedModule.Away, mathlib:IsSMulRegular, mathlib:Module.comap_annihilator, mathlib:Module.annihilator_eq_bot, mathlib:LocalizedModule.induction_on, mathlib:algebraMap_smul, mathlib:LocalizedModule.smul'_mk, mathlib:LocalizedModule.mk_eq, mathlib:Submonoid.mem_powers_iff, mathlib:IsLocalization.surj, mathlib:IsLocalization.map_units, mathlib:IsSMulRegular.pow, mathlib:RingHom.quotientKerEquivOfSurjective, mathlib:Ideal.quotEquivOfEq, mathlib:Ideal.Quotient.eq_zero_iff_mem.

**Lemma: ϖ-power torsion is nil for nearly faithful H** (`Module.NearlyFaithful.ker_away_le_nilradical`; node `torsion-in-nilradical`; file `ImageInEnd`). Let R be a commutative ring, H a nearly faithful R-module and ϖ ∈ R an H-regular element. Then R[ϖ^∞] = ker(R → R[1/ϖ]) ⊆ √0. No ring T appears.

*Hypotheses.* H nearly faithful; ϖ H-regular. No finiteness of H.

*Proof.*

1. IsLocalization.eq_iff_exists, Submonoid.mem_powers_iff and IsSMulRegular.pow give R[ϖ^∞] ⊆ Ann_R(H).
2. Ann_R(H) ⊆ √0 by near faithfulness.

*Acceptance.* R = ℤ × ℤ, H = ℤ × 0, ϖ = (p, 0): R[ϖ^∞] = 0 × ℤ ⊄ √0 = 0, so near faithfulness is needed. R = H = ℤ/p², ϖ = p: H is faithful but R[p^∞] = R, so H-regularity is needed.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful, mathlib:Localization.Away, mathlib:IsSMulRegular, mathlib:IsLocalization.eq_iff_exists, mathlib:Submonoid.mem_powers_iff, mathlib:IsSMulRegular.pow.

**Lemma: T reduced iff T[1/ϖ] reduced** (`Module.isReduced_iff_isReduced_away`; node `t-reduced-iff-after-inverting`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If ϖ ∈ R is H-regular and ϖ_T is its image in T, then T is reduced iff T[1/ϖ_T] is reduced.

*Hypotheses.* ϖ H-regular; T faithful on H. No surjectivity, no finiteness.

*Proof.*

1. isSMulRegular_algebraMap_iff makes ϖ_T H-regular; with Module.annihilator_eq_bot (T faithful), ϖ_T is a nonzerodivisor of T.
2. Submonoid.powers_le and IsLocalization.injective make T → T[1/ϖ_T] injective; isReduced_of_injective gives one direction and isReduced_localizationPreserves the other.

*Acceptance.* R = T = H = k[ε], ϖ = ε: T[1/ε] = 0 is reduced and T is not. R = ℤ, T = ℤ × 𝔽_p[ε] acting on H = ℤ through the first factor, ϖ = p: T[1/(p, 0)] = ℤ[1/p] is reduced and T is not, so faithfulness of T is needed.

*Dependencies.* mathlib:Localization.Away, mathlib:IsSMulRegular, mathlib:isSMulRegular_algebraMap_iff, mathlib:Module.annihilator_eq_bot, mathlib:nonZeroDivisors, mathlib:Submonoid.powers_le, mathlib:IsLocalization.injective, mathlib:isReduced_of_injective, mathlib:isReduced_localizationPreserves.

**Theorem: integral R = T from faithfulness** (`Module.bijective_algebraMap_iff_faithfulSMul`; node `r-equals-t-free`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If R → T is surjective, then R → T is an isomorphism iff H is faithful over R.

*Hypotheses.* T faithful on H; R → T surjective (without it, faithfulness only gives injectivity). No finiteness.

*Proof.*

1. Module.comap_annihilator and Module.annihilator_eq_bot give ker(R → T) = Ann_R(H).
2. RingHom.injective_iff_ker_eq_bot and Module.annihilator_eq_bot: R → T is injective iff Ann_R(H) = 0 iff H is faithful.

*Acceptance.* R = k, T = H = k × k (diagonal): H is faithful over R and T, but R → T is not surjective. R = k[ε], T = H = k: H is nearly faithful, not faithful, and R → T is not injective.

*Dependencies.* mathlib:FaithfulSMul, mathlib:Module.comap_annihilator, mathlib:Module.annihilator_eq_bot, mathlib:RingHom.injective_iff_ker_eq_bot.

**Lemma: integral R = T for a nonzero free module** (`Module.bijective_algebraMap_of_free`; node `r-equals-t-of-free`; file `ImageInEnd`). Let R and T be commutative rings, T an R-algebra, and H an R-module and T-module on which R acts through R → T and T acts faithfully. If H is free and nonzero over R and R → T is surjective, then R → T is bijective.

*Hypotheses.* H free over R and H ≠ 0; T faithful on H; R → T surjective.

*Proof.*

1. Module.Free.instFaithfulSMulOfNontrivial (a basis from Module.Free.chooseBasis with nonempty index set) makes H faithful over R.
2. Apply r-equals-t-free.

*Acceptance.* The zero module is free and not faithful: R = ℤ, T = H = 0. R = k[ε], T = H = k: H ≠ 0 is not free and R → T is not injective.

*Source.* Calegari–Geraghty, proof of Theorem 6.4(1) ("R acts freely on H").

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/r-equals-t-free, mathlib:Module.Free.instFaithfulSMulOfNontrivial, mathlib:Module.Free.chooseBasis.

*Dependencies.* Milestone 1.

### Milestone 6: patching conclusions

The data are those of the standing hypotheses: ı: S → R∞, 𝔞 ⊆ S, φ: R∞ ↠ R, M∞ finite over R∞, and
M∞/ı(𝔞)M∞ ≅ H with R∞ acting on H through φ (hypothesis (a)). Hypothesis (b) is Calegari–Geraghty's Theorem 6.3(iv):

```text
(b)   ı(𝔞) ⊆ ker φ + Ann_{R∞}(M∞),
```

that is, the image of 𝔞 in End(M∞) lies in the image of ker φ. It is weaker than ı(𝔞)R∞ ⊆ ker φ. File `Patching`.

**Lemma: radical comparison for the patched quotient** (`Module.NearlyFaithful.radical_map_eq_radical_ker`; node `patching-radical-comparison`; file `Patching`). Let M∞ be a finite R∞-module that is nearly faithful over R∞, let φ be surjective, and assume (a), (b) and an R∞-linear isomorphism e: M∞/ı(𝔞)M∞ ≅ H. Then √(ı(𝔞)R∞) = √(ker φ).

*Hypotheses.* S, R∞ and R are commutative rings, 𝔞 is an ideal of S, M∞ is finite and nearly faithful over R∞, and H is an R∞-module and an R-module with R∞ acting through φ. The signature also assumes φ surjective, but the proof does not use it. No Noetherian or local hypothesis.

*Proof.*

1. `quotient-action-kernel-bound`, applied with A = R∞, I = ı(𝔞)R∞, B = R, N = H and e, gives ker φ ⊆ √(ı(𝔞)R∞). This step needs no surjectivity.
2. Near faithfulness gives Ann_{R∞}(M∞) ⊆ √0 ⊆ √(ker φ). Since also ker φ ⊆ √(ker φ), hypothesis (b) gives ı(𝔞)R∞ ⊆ √(ker φ).
3. `Ideal.radical_le_radical_iff` turns these two containments into the two inclusions of radicals.

*Acceptance.* M∞ must be finite: R∞ = S = ℤ_p, ı = id, 𝔞 = (p), M∞ = ℚ_p and R = H = 0 satisfy (a) and (b), but √(pℤ_p) = (p) ≠ ℤ_p = √(ker φ). Hypothesis (b) is needed: for R∞ = R = S = ℤ/6, ı = φ = id, M∞ = ℤ/6, 𝔞 = (2) and H = ℤ/2, (a) holds and √(ı(𝔞)R∞) = (2), but √(ker φ) = 0.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/quotient-action-kernel-bound, DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful, mathlib:Ideal.radical_le_radical_iff, mathlib:Ideal.radical, mathlib:nilradical.

**Theorem: near faithfulness descends from the patched ring** (`Module.NearlyFaithful.of_patching`; node `patching-nearly-faithful-descends`; file `Patching`). Let M∞ be a finite R∞-module that is nearly faithful over R∞, let φ be surjective, and assume (a), (b) and an R∞-linear isomorphism e: M∞/ı(𝔞)M∞ ≅ H. Then H is nearly faithful over R.

*Hypotheses.* As for the radical comparison; here surjectivity of φ is used. No Noetherian hypothesis.

*Proof.*

1. `patching-radical-comparison` gives ı(𝔞)R∞ ⊆ √(ı(𝔞)R∞) = √(ker φ).
2. `quotient-action-nearly-faithful`, applied with A = R∞, I = ı(𝔞)R∞, B = R, the surjection φ, e and the containment of step 1, makes H nearly faithful over R.

*Acceptance.* M∞ must be finite: R∞ = S = ℤ, ı = id, 𝔞 = (2), M∞ = ℚ, R = 𝔽₂ and H = ℚ/2ℚ = 0 satisfy (a) and (b), but the zero module is not nearly faithful over 𝔽₂ (Lean example `quotient_nearlyFaithful_requires_finite`). φ must be surjective: R∞ = S = M∞ = 𝔽₂, 𝔞 = 0, R = 𝔽₂ × 𝔽₂ with the diagonal map and H = R/(0,1) satisfy (a) and (b), but the idempotent (0,1) kills H (Lean example `quotient_action_requires_surjective`). Calegari–Geraghty's Theorem 6.3(iv) supplies (a) and (b) for M∞ = H^{l₀}(P∞^□).

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/patching-radical-comparison, DeformationAndDerivedPatchingAlgebra:R03.6/quotient-action-nearly-faithful, DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful.

**Lemma: the reduced patched quotient is the reduced finite-level ring** (`Module.NearlyFaithful.exists_ringEquiv_nilradical_of_patching`; node `patching-reduced-quotient-iso`; file `Patching`). Under the hypotheses of the radical comparison, there is a ring isomorphism f: (R∞/ı(𝔞)R∞)_red ≅ R_red, where B_red = B/nil(B), that sends the class of x to the class of φ(x) for every x ∈ R∞.

*Hypotheses.* As for the radical comparison; here surjectivity of φ is used. No Noetherian hypothesis.

*Proof.*

1. The composite ψ: R∞ → R → R_red is surjective. Its kernel is φ⁻¹(√0) = √(ker φ) by `Ideal.comap_radical`.
2. The composite χ: R∞ → R∞/ı(𝔞)R∞ → (R∞/ı(𝔞)R∞)_red is surjective. Its kernel is √(ı(𝔞)R∞), by `Ideal.comap_radical` for the quotient map.
3. `patching-radical-comparison` makes the two kernels equal. Join the isomorphisms that `RingHom.quotientKerEquivOfSurjective` gives for χ and ψ by `Ideal.quotEquivOfEq`; the result sends the class of x to the class of φ(x) by construction.

*Acceptance.* M∞ must be finite: in the ℤ_p example of the radical comparison, (R∞/pR∞)_red = 𝔽_p but R_red = 0. φ must be surjective: R∞ = S = M∞ = H = ℤ, ı = id, 𝔞 = 0 and R = ℤ[x] acting on H with x acting as 0 satisfy (a) and (b), but ℤ is not isomorphic to ℤ[x]. This is Calegari–Geraghty's "(R∞/ı(𝔞))^red ↠ R^red" in the proof of Theorem 6.4(2)–(3).

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/patching-radical-comparison, mathlib:Ideal.comap_radical, mathlib:RingHom.quotientKerEquivOfSurjective, mathlib:Ideal.quotEquivOfEq, mathlib:nilradical.

**Lemma: over a regular patched ring the kernel of φ is the patching ideal** (`Module.ker_algebraMap_eq_map_of_patching`; node `patching-kernel-equals-ideal`; file `Patching`). Let R∞ be a regular local ring and rs an M∞-regular sequence in the maximal ideal of R∞ of length dim R∞, the pinned form of "M∞ ≠ 0 and depth M∞ ≥ dim R∞". Under (a), (b) and an R∞-linear isomorphism e: M∞/ı(𝔞)M∞ ≅ H, ker φ = ı(𝔞)R∞.

*Hypotheses.* M∞ is finite, and the regular sequence includes M∞ ≠ (rs)M∞, so M∞ ≠ 0. φ need not be surjective, R may be zero, and there is no near-faithfulness hypothesis.

*Proof.*

1. By `R03.3/free-of-maximal-depth-regular-local` (Stacks 00NT; 00O7 with e = d), M∞ is free over R∞. Its basis (`Module.Free.chooseBasis`) is nonempty because M∞ ≠ 0.
2. A nonzero free module is faithful, so Ann_{R∞}(M∞) = 0 (`Module.annihilator_eq_bot`), and (b) gives ı(𝔞)R∞ ⊆ ker φ.
3. Let k ∈ ker φ. It acts on H as φ(k) = 0, so k ∈ Ann_{R∞}(H) = Ann_{R∞}(M∞/ı(𝔞)M∞) (`LinearEquiv.annihilator_eq`). For a basis vector b, k·b ∈ ı(𝔞)M∞. By `Submodule.mem_ideal_smul_span_iff_exists_sum`, k·b is a combination of basis vectors with coefficients in ı(𝔞)R∞, and comparing b-coordinates gives k ∈ ı(𝔞)R∞.

*Acceptance.* M∞ ≠ 0 is needed: M∞ = 0 satisfies depth ≥ dim in the Stacks convention and (b) for every φ, and ker φ is then arbitrary; the Lean regular-sequence hypothesis excludes it. Regularity is needed: R∞ = S = k[ε]/(ε²), ı = id, 𝔞 = 0, M∞ = H = k, R = k and φ the augmentation satisfy (a), (b) and the depth condition with the empty sequence (dim R∞ = 0), but ker φ = (ε) ≠ 0.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local, mathlib:IsRegularLocalRing, mathlib:RingTheory.Sequence.IsRegular, mathlib:Module.Free.chooseBasis, mathlib:Module.annihilator_eq_bot, mathlib:LinearEquiv.annihilator_eq, mathlib:Submodule.mem_ideal_smul_span_iff_exists_sum.

**Lemma: freeness over a regular patched ring** (`Module.free_of_patching`; node `patching-free-conclusion`; file `Patching`). Let R be nonzero, R∞ regular local, rs an M∞-regular sequence in the maximal ideal of R∞ of length dim R∞, and φ surjective. Under (a), (b) and an R∞-linear isomorphism e: M∞/ı(𝔞)M∞ ≅ H, H is a free R-module and H ≠ 0.

*Hypotheses.* M∞ is finite, and M∞ ≠ 0 comes from the regular sequence. No near-faithfulness hypothesis.

*Proof.*

1. M∞ is free over R∞ (`R03.3/free-of-maximal-depth-regular-local`, as in the kernel lemma). Take a basis (b_i) (`Module.Free.chooseBasis`), nonempty since M∞ ≠ 0, and put h_i = e(b̄_i).
2. The h_i span H over R: e(Σ x_i b_i mod ı(𝔞)M∞) = Σ x_i·h_i = Σ φ(x_i)·h_i.
3. The h_i are linearly independent. Write c_i = φ(x_i), using surjectivity. If Σ c_i h_i = 0, then Σ x_i b_i ∈ ı(𝔞)M∞. By `Submodule.mem_ideal_smul_span_iff_exists_sum` and uniqueness of coordinates, each x_i lies in ı(𝔞)R∞, which is ker φ by `patching-kernel-equals-ideal`; so c_i = 0.
4. `Module.Basis.mk` and `Module.Free.of_basis` make H free. If some h_i were 0, then b_i ∈ ı(𝔞)M∞ and its b_i-coordinate 1 would lie in ker φ, which is impossible because R ≠ 0. So H ≠ 0.

*Acceptance.* R ≠ 0 is needed for H ≠ 0: R∞ = S = M∞ = k, ı = id, 𝔞 = k and R = H = 0 satisfy all other hypotheses (the empty regular sequence has length dim k = 0), but H is zero. The Lean example `patching_free_zero_quotient` records that the zero ring is a free, trivial module over itself. Regularity is needed: R∞ = S = R = k[ε]/(ε²), ı = φ = id, 𝔞 = 0 and M∞ = H = k satisfy the other hypotheses, but k is not free over k[ε]/(ε²). This is Calegari–Geraghty's Theorem 6.4(1), "H is a free R-module", with R∞ ≅ 𝒪⟦x₁, …, x_{q+j−l₀}⟧ (source issue E1).

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/patching-kernel-equals-ideal, DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local, mathlib:Module.Free.chooseBasis, mathlib:Submodule.mem_ideal_smul_span_iff_exists_sum, mathlib:Module.Basis.mk, mathlib:Module.Free.of_basis.

Part (0) of Calegari–Geraghty's module theorem is Milestone 4 applied to M∞: `Module.isSupportedOnComponents_of_isRegular` puts Supp M∞ on irreducible components of dimension dim R∞, and `Module.NearlyFaithful.ringKrullDim_quotient_eq_of_isRegular` makes R∞ equidimensional when M∞ is nearly faithful. It is not restated here. The three declarations below are the module form of Calegari–Geraghty's Theorem 6.4(1)–(3). Each is conditional on the displayed data ı, 𝔞, φ, e and (b); none assumes H ≠ 0, completeness of R∞ or an 𝒪-algebra structure. The complex-level statement and Proposition 6.6 are P9's. Theorem 6.3 and its proof supply the module data with M∞ = H^{l₀}(P∞^□); the complex is constructed in P8, not in R03.5. This is an application of the conditional module theorems, not a prerequisite for their proofs.

**Theorem: near faithfulness of H over an irreducible patched ring** (`Module.NearlyFaithful.of_patching_of_subsingleton_minimalPrimes`; node `patched-module-support-theorem`; file `Patching`; Calegari–Geraghty, Theorem 6.4(2), module form). Let R∞ be a Noetherian local ring with at most one minimal prime, rs an M∞-regular sequence in its maximal ideal of length dim R∞, and φ surjective. Under (a), (b) and an R∞-linear isomorphism e: M∞/ı(𝔞)M∞ ≅ H, H is nearly faithful over R.

*Hypotheses.* R∞ is Noetherian local, so it has exactly one minimal prime. M∞ is finite, and M∞ ≠ 0 comes from the regular sequence.

*Proof.*

1. `maximal-cm-nearly-faithful-irreducible` makes M∞ nearly faithful over R∞.
2. `patching-nearly-faithful-descends` transfers near faithfulness to H over R.

*Acceptance.* One minimal prime is needed. Take the node A = k⟦x,y⟧/(xy), with minimal primes (x) and (y), and M = A/(x); M carries the regular element x + y and dim A = 1. With R∞ = S = R = A, ı = φ = id, 𝔞 = 0 and M∞ = H = M, (a) and (b) hold, but H is not nearly faithful. If ϖ is a nonzerodivisor of R∞ and Spec R∞[1/ϖ] is irreducible, `minimal-primes-of-torsion-free` gives R∞ exactly one minimal prime; this is Calegari–Geraghty's Theorem 6.4(2).

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-nearly-faithful-irreducible, DeformationAndDerivedPatchingAlgebra:R03.6/patching-nearly-faithful-descends.

**Theorem: near faithfulness of H from component support after inverting ϖ** (`Module.NearlyFaithful.of_patching_of_away`; node `patched-module-away-support`; file `Patching`; Calegari–Geraghty, Theorem 6.4(3), module form). Let ϖ be a nonzerodivisor of R∞ such that every minimal prime of R∞[1/ϖ] lies in Supp M∞[1/ϖ], and let φ be surjective. Under (a), (b) and e, H is nearly faithful over R.

*Hypotheses.* M∞ is finite. No local, Noetherian or depth hypothesis.

*Proof.*

1. `nearly-faithful-iff-minimal-primes-away-mem-support`, from (iii) to (i), makes M∞ nearly faithful over R∞.
2. `patching-nearly-faithful-descends` transfers near faithfulness to H over R.

*Acceptance.* Every component is needed. In the node A take ϖ = x + y, a nonzerodivisor, and R∞ = S = R = A, ı = φ = id, 𝔞 = 0 and M∞ = H = A/(x). Then Supp M∞[1/ϖ] contains the minimal prime (x) but not (y), and H is not nearly faithful.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-iff-minimal-primes-away-mem-support, DeformationAndDerivedPatchingAlgebra:R03.6/patching-nearly-faithful-descends.

**Theorem: integral R = T over a regular patched ring** (`Module.bijective_algebraMap_of_patching`; node `patched-module-r-equals-t`; file `Patching`; Calegari–Geraghty, Theorem 6.4(1), module form). Let R∞ be regular local, rs an M∞-regular sequence in its maximal ideal of length dim R∞, and φ surjective, and assume (a), (b) and e. Let T be a commutative R-algebra with a compatible, faithful T-module structure on H, and assume R → T is surjective. Then R → T is bijective.

*Hypotheses.* M∞ is finite. R may be zero; there is no hypothesis H ≠ 0.

*Proof.*

1. If R = 0, then T = 0 because R → T is surjective, and R → T is bijective.
2. Otherwise `patching-free-conclusion` makes H free and nonzero over R, and `r-equals-t-of-free` gives bijectivity.

*Acceptance.* Surjectivity of R → T cannot be dropped. Put R∞ = R = S = k, M∞ = H = k × k, ı = φ = id and 𝔞 = 0. The depth, quotient and freeness hypotheses hold, and T = k × k acts faithfully on H, but the diagonal k → T is not surjective. Thus faithfulness alone does not give R = T. The Lean example `patching_rt_diagonal_not_surjective` uses k = ZMod 2.

*Dependencies.* DeformationAndDerivedPatchingAlgebra:R03.6/patching-free-conclusion, DeformationAndDerivedPatchingAlgebra:R03.6/r-equals-t-of-free.

*Sources.* Calegari–Geraghty, Theorem 6.3(iv) and Theorem 6.4 with its proof, pp. 91–94; Taylor, end of the proof of
Theorem 4.1, p. 221; Kisin, Lemma (3.3.4); Stacks 00O7, 090V.
*Dependencies.* Milestones 1–5; `R03.3/free-of-maximal-depth-regular-local` (freeness over regular local rings). There is no prerequisite
asserting existence of a patched module.

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


### Base-change continuation: exact baseline bridges

The retained `support-base-change` identifier denotes finite-module equality. Its two consumers,
near-faithful ascent under base change (`nearly-faithful-base-change`) and the minimal-prime test after inverting ϖ
(`nearly-faithful-iff-minimal-primes-away-mem-support`), both assume that the module is finite. Descent under base
change (`nearly-faithful-of-base-change`) needs only the unconditional inclusion `support-base-change-subset`. The two
other identifiers isolate inclusion without hypotheses and equality for a flat coefficient map without module
finiteness. No node of the packet now has more than one declaration.

The three signatures already existed in the suggested file. Four added acceptance examples distinguish
the hypotheses: full support of ℚ over ℤ, vanishing of (ℤ/2)⊗_ℤℚ, full support for the finite module ℤ/2
after the nonflat quotient map, and full support after the flat map ℤ→ℚ for a countable free ℤ-module.
The local tensor identity is a composite of existing localization and cancellation equivalences with
their actual scalar towers; it is not a newly assumed equivalence. The following pinned declarations
complete the previously unnamed proof inputs:

- `mathlib:Localization.localRingHom` — The canonical local-ring map A_p→B_q for p=comap(q).
- `mathlib:Localization.localRingHom_to_map` — The localized map agrees with the original coefficient map on A; supplies the scalar-tower compatibility.
- `mathlib:Localization.isLocalHom_localRingHom` — The canonical map between the two local rings is a local homomorphism.
- `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange` — For compatible R→A→B modules, M⊗_A(A⊗_R N)≃M⊗_R N, B-linearly; the exact tower assumptions were read.
- `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul` — The cancellation equivalence sends m⊗(a⊗n) to (a·m)⊗n, fixing its orientation and scalar action.
- `mathlib:Module.mem_support_iff` — Support membership is nontriviality of the actual localized module.
- `mathlib:Module.flat_iff_of_isLocalization` — For a localization S of R and an S-module with compatible R action, flatness over S is equivalent to flatness over R.
- `mathlib:Localization.flat` — Localizing a flat R-algebra at any multiplicative subset is still flat over R.
- `mathlib:Module.FaithfullyFlat.lTensor_nontrivial` — Tensoring a nonzero module on the left with a faithfully flat module preserves nontriviality.
- `mathlib:Ideal.ResidueField.map` — For p=comap(q), the canonical field homomorphism κ(p)→κ(q).
- `mathlib:Ideal.ResidueField.map_algebraMap` — The residue-field map commutes with the maps from the original coefficient ring, giving the scalar tower used in tensor cancellation.
- `mathlib:Module.Basis.ofVectorSpace` — Every vector space is free; used for κ(q) over κ(p).
- `mathlib:Module.FaithfullyFlat.finsupp` — A nonempty direct sum of copies of R is faithfully flat.
- `mathlib:Module.FaithfullyFlat.of_linearEquiv` — Faithful flatness transports across a linear equivalence. Together with a nonempty basis this gives faithful flatness of the residue-field extension.
