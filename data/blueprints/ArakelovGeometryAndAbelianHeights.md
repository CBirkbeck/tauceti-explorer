# Arakelov geometry and heights of abelian varieties

This roadmap builds the Arakelov geometry that heights of abelian varieties need, from the product
formula of a number field to the inputs of Faltings' finiteness theorems. It defines hermitian
vector bundles over rings of integers and their Arakelov degree, arithmetic divisors with Green
functions on arithmetic schemes and their degree on one-cycles, and heights of algebraic points for
metrized line bundles. On that base it constructs the Hodge line of an abelian scheme with its
Faltings metric, the Faltings height and the stable Faltings height, and proves their behaviour
under field extension, products, duality and isogenies. It then compares the stable height with
the height of the moduli point on the minimal compactification of the Siegel moduli space, for a
metric with logarithmic singularities at the boundary, and with the theta height. The output is a
package of finiteness and lower-bound statements with explicit constant dependence, which the
roadmap on Faltings' finiteness theorems consumes.

## Scope and boundaries

- **From the libraries.** Mathlib's product formula (`NumberField.prod_abs_eq_one`,
  `NumberField.InfinitePlace.prod_eq_abs_norm`), absolute norms of ideals and fractional ideals,
  infinite places with their multiplicities, the heights `Height.logHeight` and
  `Projectivization.logHeight` with `NumberField.mulHeight_eq`, the class `Northcott`, lattice
  covolumes `ZLattice.covolume`, the upper half plane and the modular discriminant
  `ModularForm.discriminant` (= η^24). Nothing in these is planned again.
- **From other roadmaps.** Abelian schemes, their invariant differentials and the unmetrized Hodge
  determinant, duals, isogenies with Cartier-dual kernels, theta groups and complex uniformization
  (AbelianSchemesAndArithmeticModuli A1–A6); Néron models, their differential lattice,
  semistable reduction and its base change (NeronModelsAndSemistableAbelianVarieties R11.1,
  R11.3); finite flat group schemes, p-divisible groups and the lengths of their invariant
  differentials (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1); the Siegel moduli stack over
  ℤ, its coarse space, fields of moduli and the Hodge line of the universal family (PELModuli M2,
  M3, M6); semi-abelian schemes, homomorphism extension, integral toroidal and minimal
  compactifications with the ample Hodge line (ShimuraCompactifications C4, C5); Weil's height
  machine and Northcott for ample bundles (HeightsRationalPointsAndObstructions RP.0); Cartier
  divisors, Chow groups, norms of line bundles and ample bundles (SchemeAndStackFoundations SF.3,
  SF.5); complex analytification (ComplexComparisonPartII C0).
- **Owned here and imported elsewhere.** Hermitian bundles, the Arakelov degree and arithmetic
  divisors with their pairing with one-cycles (GrossZagierAndArithmeticHeights GZ.0, GZ.2; the
  unitary and GSpin cycle Part II designs); the Faltings metric, the metrized Hodge line and its
  normalisations (HilbertModularVarietiesAndShimuraCurves R18.2, the CM-heights Part II design);
  the Faltings and stable Faltings heights, the isogeny formula and its bounds
  (FaltingsFinitenessAndIsogenyTheorems R28.1–R28.5, AbelianVarietiesIsogenousToNoJacobian,
  EllipticModularityEffectiveComparisons EC.5); the comparison with moduli and theta heights and
  the finiteness package (FaltingsFinitenessAndIsogenyTheorems R28.1, Yuan's uniform Bogomolov
  theorem).
- **Not here.** Heights of points of abelian varieties and canonical heights (HeightsRationalPoints
  RP.0, GrossZagier GZ.1); adelic metrized line bundles, arithmetic intersection numbers in higher
  dimension and arithmetic bigness (the proposed Part II of this roadmap); the bounded-height
  finiteness of abelian varieties over a fixed field up to K-isomorphism, the height bound in an
  isogeny class and the Tate and Shafarevich conjectures (FaltingsFinitenessAndIsogenyTheorems);
  CM-specific height formulas and the averaged Colmez conjecture (the CM Part II design).

## Conventions

- **Places and embeddings.** K is a number field with ring of integers O_K, Σ_K its set of field
  embeddings σ : K → ℂ and F_∞ complex conjugation. Sums over Σ_K count a complex place twice;
  sums over Mathlib's `InfinitePlace K` carry the multiplicity mult(v) ∈ {1, 2}.
- **Arakelov degree.** For a hermitian line bundle L̄ and any s ≠ 0, deg^(L̄) = log #(L/O_K s) −
  Σ_{σ∈Σ_K} log ‖s‖_σ. In Gillet–Soulé's language an arithmetic divisor (Z, g) on Spec O_K has
  degree log #(Z) + ½ Σ_σ g_σ, and L̄ ↦ (div s, −log ‖s‖²). Normalised degrees divide by [K:ℚ].
- **Faltings metric.** On H⁰(A, Ω^g) of a complex abelian variety of dimension g,
  ‖α‖²_Fal = (i^{g²}/2^g)∫_{A(ℂ)} α ∧ ᾱ = 2^{−g}|∫ α ∧ ᾱ| (Faltings' normalisation, with his sign
  corrected). Deligne's (also Bost's, Yuan–Zhang's, Gaudron–Rémond's, Pazuki's) metric is
  (2π)^{−g}|∫ α ∧ ᾱ| and gives h_Del = h_Fal + (g/2) log π; the unscaled metric |∫ α ∧ ᾱ|
  (Tsimerman, Andreatta–Goren–Howard–Madapusi Pera, Colmez) gives h_un = h_Fal − (g/2) log 2.
  Every theorem below names its normalisation; differences of heights do not depend on it.
- **Heights of abelian varieties.** h(A/K) is the normalised degree of the Néron-model Hodge line;
  it can drop on field extension. h_st(A) is h over any field where A is semistable everywhere
  (K(A[12]) suffices) and depends only on A ⊗ ℚ̄. h_st(A) ≤ h(A/K).
- **Modular discriminant.** Δ(τ) = η(τ)^24 = q∏(1 − qⁿ)^24 is Mathlib's normalised
  `ModularForm.discriminant`; the lattice discriminant g₂³ − 27g₃² of ℤ + τℤ is (2π)^12 Δ(τ).
- **Logarithmic singularities.** A continuous metric on L over X̄ ∖ Z has logarithmic
  singularities along Z if a local frame satisfies max(‖s‖, ‖s‖^{−1}) ≤ C(1 + |log dist(·, Z)|)^n.

## Sources

- P. Deligne, *Preuve des conjectures de Tate et de Shafarevitch*, Séminaire Bourbaki 616,
  Astérisque 121–122 (1985) (numdam): §1 heights, §2.1–2.2 isogenies.
- G. Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 73
  (1983) (GDZ): §§2–4; and *Arakelov's theorem for abelian varieties*, Invent. Math. 73 (1983).
- G. Faltings and C.-L. Chai, *Degeneration of Abelian Varieties* (1990): Ch. I Lemma 5.5, Ch. V
  Lemma 3.4 and §4 (Definitions 4.1–4.2, Propositions 4.4–4.6).
- M. Raynaud, *Hauteurs et isogénies*, Astérisque 127 (1985), exposé VII (numdam): §1.3–1.4 and
  Théorème 2.1.1.
- L. Szpiro, *Degrés, intersections, hauteurs*, Astérisque 127, exposé I (numdam): §1, §3.
- H. Gillet and C. Soulé, *Arithmetic intersection theory*, Publ. IHÉS 72 (1990) (numdam): §§3.3–3.6.
- J.-B. Bost, *Périodes et isogénies des variétés abéliennes*, Séminaire Bourbaki 795 (numdam):
  §2.1, Appendices A and C.
- L. Moret-Bailly, *Pinceaux de variétés abéliennes*, Astérisque 129 (1985) (numdam): Ch. IX §1.
- É. Gaudron and G. Rémond, *Théorème des périodes et degrés minimaux d'isogénies* (arXiv
  1105.1230): §2.3 and Lemme 7.9; *Polarisations et isogénies*, Duke 163 (2014).
- F. Pazuki, *Theta height and Faltings height* (arXiv 0907.1458v2): Theorem 1.1, Corollary 1.3.
- Y. Bilu, P. Parent and M. Rebolledo, *Rational points on X_0^+(p^r)*, Ann. Inst. Fourier 63
  (2013): Proposition 4.4.
- X. Yuan and S.-W. Zhang, *On the averaged Colmez conjecture* (arXiv 1507.06903v3): §§1.1, 2.1–2.2.
- J. Tsimerman, *The André–Oort conjecture for A_g* (arXiv 1506.01466v5): §2.1.
- F. Andreatta, E. Goren, B. Howard, K. Madapusi Pera, *Faltings heights of abelian varieties with
  complex multiplication* (arXiv 1508.00178v3): §§4.6, 6.4, 9.1.
- W. Zhang, *Weil representation and arithmetic fundamental lemma* (arXiv 1909.02697v3): §§8.4, 9.1.
- X. Yuan, *Arithmetic bigness and a uniform Bogomolov-type result* (arXiv 2108.05625v4): §§3.1.3,
  4.3.1.

## R35.1. Hermitian bundles and arithmetic degree

The layer starts from hermitian vector bundles over Spec O_K: projective O_K-modules with a positive definite hermitian form at every complex embedding, compatible with complex conjugation. Their Arakelov degree is the logarithm of an index minus the archimedean logarithms of a section; Mathlib's product formula makes it independent of the section, and it is additive in tensor products and exact sequences and multiplied by [L:K] under base change. Arakelov divisors give the concrete description Pic^(O_K) = Div^(O_K)/principal, and the norm along a finite extension preserves degrees. RS-06 keeps in this layer the arithmetic intersection statements its consumers use: Gillet–Soulé arithmetic divisors with Green functions on regular flat arithmetic schemes (possibly non-proper, possibly with finitely many primes removed), the isomorphism ĈH¹ ≅ Pic^, the ℝ- or ℝ_S-valued pairing with proper one-cycles (Zhang), the automorphism-weighted degree on relative dimension zero stacks (Andreatta–Goren–Howard–Madapusi Pera), and heights of points for continuous metrics. On projective space with the sup metric the Arakelov degree of a point is exactly Mathlib's height; with the Fubini–Study metric it is the ℓ² height, within ½[K:ℚ] log(n+1).

**Named milestones:** [Hermitian vector bundle](#R351-hermitian-vector-bundle), [Arakelov degree](#R351-arithmetic-degree), [Arakelov divisor and compactified Picard group](#R351-arakelov-divisors-of-number-field), [Arithmetic Chow group ĈH¹](#R351-arithmetic-divisors-green), [Arithmetic degree pairing with 1-cycles](#R351-arithmetic-degree-pairing), [Height of a point for a metrized line bundle](#R351-heights-of-points).

**Layers of other roadmaps used:** `AlgebraicModuliForArithmeticGeometry:R09.3`, `ComplexComparisonPartII:C0`, `HeightsRationalPointsAndObstructions:RP.0`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5`.

<a id="R351-hermitian-vector-bundle"></a>
### Hermitian vector bundles over the ring of integers

*Definition* · node `R35.1/hermitian-vector-bundle` · suggested module `TauCeti/NumberTheory/Arakelov/HermitianBundle`, namespace `TauCeti.Arakelov.HermitianBundle`

Let K be a number field with ring of integers O_K and let Σ_K be the set of field embeddings σ : K → ℂ, on which complex conjugation acts by σ ↦ σ̄. A hermitian vector bundle Ē = (E, (h_σ)_{σ∈Σ_K}) over Spec O_K is a finitely generated projective O_K-module E together with, for every σ ∈ Σ_K, a positive definite hermitian inner product h_σ on the complex vector space E_σ = E ⊗_{O_K,σ} ℂ, such that h_{σ̄}(x ⊗ 1, y ⊗ 1) is the complex conjugate of h_σ(x ⊗ 1, y ⊗ 1) for all x, y ∈ E. Write ‖x‖_σ = h_σ(x, x)^{1/2}. The rank of Ē is the rank of E. A hermitian line bundle is a hermitian vector bundle of rank one. An isometry Ē ≅ F̄ is an O_K-linear isomorphism E ≅ F whose complexifications are unitary at every σ. Pic^(O_K) is the set of isometry classes of hermitian line bundles; it is an abelian group under the tensor product of the next node.

Hypotheses and conventions:

- K a number field; E finitely generated and projective (equivalently torsion-free) over the Dedekind domain O_K.
- The compatibility with complex conjugation is part of the data: at a real embedding it says h_σ is the complexification of a real inner product on E ⊗_σ ℝ.
- Rank one is the case Faltings, Deligne and Szpiro call a metrized (compactified) invertible sheaf.

Construction or proof:

1. Define the structure from the module E, the family of inner products indexed by Σ_K, and the conjugation condition; for a rank-one bundle the data is equivalently one norm ‖·‖_v on E ⊗ K_v for each infinite place v (Deligne §1.1, p. 26; Szpiro §1.2, p. 13), which is how Mathlib's InfinitePlace records places.
2. Isometry classes form a set because E embeds in K^n and the inner products are finite-dimensional data; the group structure on Pic^(O_K) is the tensor product with inverse the dual (hermitian-operations).

Uses:

- Faltings 1983, §3, p. 353: metrized line bundles on Spec O_K carry the Hodge line ω_A with its integration metric.
- GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing: hermitian line bundles on Spec O_L are the targets of pullbacks of metrized line bundles on arithmetic surfaces.
- HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line: the quaternionic arithmetic Hodge line is a hermitian line bundle on Spec O_F.
- Bost, Bourbaki 795, §4.3: slopes of hermitian vector bundles of higher rank enter the period theorem consumers.

API:

| Name | Role | Statement |
|---|---|---|
| `HermitianBundle.module` | projection | The underlying finitely generated projective O_K-module E. |
| `HermitianBundle.inner` | data | For σ ∈ Σ_K, the positive definite hermitian form h_σ on E ⊗_{O_K,σ} ℂ. |
| `HermitianBundle.inner_conj` | characterisation | h_{σ̄}(x ⊗ 1, y ⊗ 1) = conj h_σ(x ⊗ 1, y ⊗ 1) for x, y ∈ E. |
| `HermitianBundle.rank` | projection | rank Ē = finrank_K (E ⊗ K). |
| `HermitianBundle.trivial` | constructor | Ō_K = (O_K, ∣·∣) with h_σ(1, 1) = 1 for every σ. |
| `HermitianBundle.ofFractionalIdeal` | constructor | For a nonzero fractional ideal 𝔞 ⊂ K and real numbers (λ_v) indexed by infinite places, the line bundle 𝔞 with ‖x‖_σ = e^{−λ_v}∣σ(x)∣ for σ inducing v. |
| `HermitianBundle.Isometry.ext` | extensionality | Two isometries with equal underlying O_K-linear maps are equal. |
| `HermitianBundle.rescale` | constructor | For c ∈ ℝ, Ē(c) has the same module and metrics e^{−c}‖·‖_σ at every σ. |
| `HermitianBundle.normAt` | compatibility | For a rank-one bundle and an infinite place v of K (Mathlib's InfinitePlace), the norm ‖·‖_v on E ⊗ K_v induced by any σ inducing v; it is independent of σ by the conjugation condition. |
| `PicHat` | structure | Pic^(O_K): isometry classes of hermitian line bundles, an abelian group under ⊗ with inverse the dual and identity Ō_K. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `HermitianBundle.trivial_rank` | degenerate | rank Ō_K = 1 and the rank of the zero module with the empty family of forms is 0. |
| `HermitianBundle.ofFractionalIdeal_one` | compatibility | ofFractionalIdeal (1) with all λ_v = 0 is isometric to Ō_K. |
| `HermitianBundle.conj_nonexample` | non-example | For K = ℚ(i) with embeddings σ, σ̄, the data O_K with h_σ(1,1) = 1 and h_{σ̄}(1,1) = 4 violates the conjugation condition, so it is not a hermitian line bundle, although each h is positive definite. |
| `HermitianBundle.rationals` | computation | For K = ℚ every hermitian line bundle is isometric to (ℤ, r·∣·∣) for a unique real r > 0. |

Checks:

- The trivial bundle Ō_K = (O_K, |·|_σ) is a hermitian line bundle; a fractional ideal 𝔞 with the restricted absolute values |σ(x)| is a hermitian line bundle; a hermitian line bundle whose metrics fail the conjugation condition is not an object of this definition.

Depends on (libraries and other roadmaps): `NumberField.RingOfIntegers` (Mathlib), `Module.Projective` (Mathlib), `Module.finrank` (Mathlib), `InnerProductSpace` (Mathlib), `NumberField.InfinitePlace` (Mathlib), `NumberField.InfinitePlace.mult` (Mathlib).

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.1, pp. 25–26: Defines a rank-one K-vector space with a v-adic absolute value at every place, the integral structure L_O giving the finite absolute values, and at each complex embedding a positive definite hermitian form with the conjugation compatibility; the real/complex normalisation of ‖·‖_v is fixed there.
- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.2, p. 13: Defines the compactified Picard group Pic_c(O_K): rank-one projective modules with positive definite hermitian forms at the infinite places, up to isometry.
- Jean-Benoît Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz)*, Appendice A.1–A.2, pp. 146–147: Hermitian vector bundles over arithmetic schemes and over Spec O_K of arbitrary rank, their Arakelov degree and normalised degree, as used for slopes.


<a id="R351-hermitian-operations"></a>
### Sums, tensor products, duals, determinants, sub-bundles and base change

*Construction* · node `R35.1/hermitian-operations` · suggested module `TauCeti/NumberTheory/Arakelov/HermitianBundle`, namespace `TauCeti.Arakelov.HermitianBundle`

For hermitian vector bundles Ē, F̄ over Spec O_K: (i) Ē ⊕ F̄ carries the orthogonal sum metric; (ii) Ē ⊗ F̄ = (E ⊗_{O_K} F, h^E_σ ⊗ h^F_σ); (iii) the dual Ē^∨ = (Hom(E, O_K), dual metric); (iv) the exterior powers Λ^k Ē with the induced metric, and the determinant det Ē = Λ^{rk E} Ē, a hermitian line bundle; (v) for an O_K-submodule F ⊂ E that is saturated (E/F torsion-free), F̄ carries the restricted metric and E/F the quotient metric (each h_σ on (E/F)_σ identified with the orthogonal complement of F_σ); (vi) for a finite extension L/K, the base change Ē_{O_L} = (E ⊗_{O_K} O_L, (h_{τ|K})_τ) with τ ∈ Σ_L extending σ = τ|_K. These are compatible with isometries and satisfy the usual identities: det(Ē ⊕ F̄) ≅ det Ē ⊗ det F̄, det(Ē^∨) ≅ (det Ē)^∨, and for 0 → F̄ → Ē → Q̄ → 0 with restricted and quotient metrics, det Ē ≅ det F̄ ⊗ det Q̄ isometrically.

Hypotheses and conventions:

- F ⊂ E saturated, so that E/F is projective.
- Base change uses that every τ ∈ Σ_L restricts to an element of Σ_K and every σ has exactly [L:K] extensions.

Construction or proof:

1. Form each module construction over O_K and the corresponding hermitian linear algebra fibrewise at each σ; the conjugation condition is preserved because every construction is natural.
2. For the determinant identity of an exact sequence choose at σ an orthonormal basis of F_σ completed by an orthonormal basis of its orthogonal complement, which maps isometrically onto Q_σ; the wedge of the combined basis has norm one, so the canonical isomorphism det E ≅ det F ⊗ det Q is an isometry (Deligne §2.1, p. 36, for the Hodge-line case).
3. Base change is functorial and compatible with ⊗, ∨ and det because these commute with the flat base change O_K → O_L.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.2/metrized-hodge-line: the Hodge line is the determinant of the hermitian bundle of invariant differentials.
- ArakelovGeometryAndAbelianHeights:R35.2/product-isometry: the Hodge line of a product is a tensor product of hermitian lines.
- ArakelovGeometryAndAbelianHeights:R35.3/field-extension-comparison: base change of the Hodge line to O_L.

API:

| Name | Role | Statement |
|---|---|---|
| `HermitianBundle.sum` | constructor | Ē ⊕ F̄ with the orthogonal sum metric. |
| `HermitianBundle.tensor` | constructor | Ē ⊗ F̄ with the tensor product metric. |
| `HermitianBundle.dual` | constructor | Ē^∨ with the dual metric. |
| `HermitianBundle.det` | constructor | det Ē = Λ^{rank} Ē, a hermitian line bundle. |
| `HermitianBundle.restrict` | constructor | For F ⊂ E saturated, F̄ with the restricted metric. |
| `HermitianBundle.quotient` | constructor | For F ⊂ E saturated, E/F with the quotient metric. |
| `HermitianBundle.baseChange` | functoriality | Ē ↦ Ē_{O_L} along O_K → O_L; baseChange_id and baseChange_comp hold up to canonical isometry. |
| `HermitianBundle.det_sum` | relation | det(Ē ⊕ F̄) ≅ det Ē ⊗ det F̄ isometrically. |
| `HermitianBundle.det_exact` | relation | For 0 → F̄ → Ē → Q̄ → 0 with restricted and quotient metrics, det Ē ≅ det F̄ ⊗ det Q̄ isometrically. |
| `HermitianBundle.dual_dual` | simp | Ē^∨∨ ≅ Ē isometrically. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `HermitianBundle.tensor_trivial` | degenerate | Ō_K ⊗ Ē ≅ Ē isometrically. |
| `HermitianBundle.det_trivial_sum` | computation | det(Ō_K ⊕ Ō_K) ≅ Ō_K, with e_1 ∧ e_2 of norm one at every σ. |
| `HermitianBundle.quotient_metric_nonexample` | non-example | For E = ℤ² with the standard metric and F = ℤ·(1,1), the quotient E/F ≅ ℤ with the quotient metric has ‖[e_1]‖ = 1/√2, not 1: the quotient metric is not the metric of a chosen complement lattice. |
| `HermitianBundle.baseChange_rank` | compatibility | rank Ē_{O_L} = rank Ē and (det Ē)_{O_L} ≅ det(Ē_{O_L}). |

Checks:

- The identities are stated as isometries, not just module isomorphisms; Ō_K ⊗ Ē ≅ Ē; the dual of Ō_K is Ō_K.

Depends on (this roadmap): [Hermitian vector bundles over the ring of integers](#R351-hermitian-vector-bundle).

Depends on (libraries and other roadmaps): `InnerProductSpace` (Mathlib).

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §2.1, p. 36: For an exact sequence of group schemes the Hodge lines satisfy ω(A) ≅ ω(A′) ⊗ ω(A″) compatibly with the hermitian structures, the determinant instance of (v).
- Jean-Benoît Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz)*, Appendice A.2–A.3, p. 147: Operations on hermitian vector bundles over Spec O_K, sub-modules with restricted metrics and the associated quotients, used for slopes.
- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.2, p. 13: Tensor product and duals of compactified invertible sheaves give the group law on Pic_c(O_K).


<a id="R351-arithmetic-degree"></a>
### The Arakelov degree of a hermitian bundle

*Definition* · node `R35.1/arithmetic-degree` · suggested module `TauCeti/NumberTheory/Arakelov/Degree`, namespace `TauCeti.Arakelov.HermitianBundle`

For a hermitian line bundle L̄ over Spec O_K and any nonzero s ∈ L, deg^(L̄) = log #(L / O_K·s) − Σ_{σ∈Σ_K} log ‖s‖_σ; equivalently, with Mathlib's infinite places and multiplicities mult(v) ∈ {1, 2}, deg^(L̄) = log #(L / O_K s) − Σ_v mult(v)·log ‖s‖_v. For a hermitian vector bundle, deg^(Ē) = deg^(det Ē), the normalised degree is deg^_n(Ē) = deg^(Ē)/[K:ℚ], and the slope is μ^(Ē) = deg^(Ē)/rank Ē. In Gillet–Soulé's normalisation an arithmetic divisor (Z, g) on Spec O_K has degree log #(Z) + ½ Σ_σ g_σ; the two agree through L̄ ↦ (div s, −log ‖s‖²).

Hypotheses and conventions:

- L̄ a hermitian line bundle over Spec O_K (hermitian-vector-bundle).
- #(L/O_K s) is the finite index of the submodule generated by s.

Construction or proof:

1. Define deg^ with a chosen nonzero section; independence of the choice is degree-independent-of-section, so deg^ is a function on Pic^(O_K).
2. For higher rank use the determinant of hermitian-operations; normalised degree and slope are quotients by [K:ℚ] and the rank.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.3/faltings-height: the Faltings height is deg^ of the metrized Hodge line divided by [K:ℚ].
- FaltingsFinitenessAndIsogenyTheorems:R28.1/faltings-modular-height-of-a-semiabelian-model: Faltings' Grad is this degree.
- GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing: local intersection numbers are summed with this normalisation.
- Yuan 2026, §4.3.1: deg^ : Div^(O_K′) → ℝ with deg^(v) = log N v.

API:

| Name | Role | Statement |
|---|---|---|
| `HermitianBundle.arakelovDegree` | constructor | deg^(L̄) = log #(L/O_K s) − Σ_σ log ‖s‖_σ for any s ≠ 0; for higher rank through det. |
| `HermitianBundle.normalizedDegree` | constructor | deg^_n(Ē) = deg^(Ē)/[K:ℚ]. |
| `HermitianBundle.slope` | constructor | μ^(Ē) = deg^(Ē)/rank Ē for Ē of positive rank. |
| `HermitianBundle.arakelovDegree_eq_infinitePlace` | characterisation | deg^(L̄) = log #(L/O_K s) − Σ_v mult(v) log ‖s‖_v, summing over InfinitePlace K. |
| `HermitianBundle.arakelovDegree_eq_fractionalIdeal` | characterisation | For any nonzero t ∈ L ⊗ K, with 𝔟 the fractional ideal such that L = 𝔟·t, deg^(L̄) = −log N(𝔟) − Σ_σ log ‖t‖_σ (N = FractionalIdeal.absNorm); for t ∈ L this is the defining formula, since then N(𝔟)^{−1} = #(L/O_K t). |
| `HermitianBundle.arakelovDegree_trivial` | simp | deg^(Ō_K) = 0. |
| `HermitianBundle.arakelovDegree_rescale` | simp | deg^(L̄(c)) = deg^(L̄) + [K:ℚ]·c for the rescaling ‖·‖ ↦ e^{−c}‖·‖. |
| `HermitianBundle.arakelovDegree_ofFractionalIdeal` | simp | deg^(𝔞, e^{−λ_v}∣·∣_v) = −log N(𝔞) + Σ_v mult(v)·λ_v. |
| `HermitianBundle.arakelovDegree_congr` | extensionality | Isometric hermitian line bundles have equal degree. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `HermitianBundle.arakelovDegree_trivial` | degenerate | deg^(Ō_K) = 0, using s = 1. |
| `HermitianBundle.arakelovDegree_ideal` | computation | For K = ℚ(i) and 𝔞 = (1 + i) with the standard metric, deg^ = −log 2. |
| `HermitianBundle.arakelovDegree_rat` | compatibility | For K = ℚ and (ℤ, r·∣·∣), deg^ = −log r; Deligne's example deg L = −½ log⟨e, e⟩. |
| `HermitianBundle.arakelovDegree_weight_nonexample` | non-example | Summing log ‖s‖ once per infinite place instead of once per embedding gives, for K = ℚ(i), Ō_K and s = 2, the value log 4 − log 2 ≠ 0, so the multiplicity mult(v) = 2 at a complex place is forced. |

Checks:

- deg^(Ō_K) = 0; deg^ of a fractional ideal 𝔞 with the standard metric is −log N(𝔞); multiplying every metric by e^{−c} adds [K:ℚ]·c.

Depends on (this roadmap): [Hermitian vector bundles over the ring of integers](#R351-hermitian-vector-bundle), [Sums, tensor products, duals, determinants, sub-bundles and base change](#R351-hermitian-operations).

Depends on (libraries and other roadmaps): `FractionalIdeal.absNorm` (Mathlib), `NumberField.InfinitePlace.mult` (Mathlib).

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.1, pp. 25–26: deg ℓ is minus the logarithm of ∏_v ‖ℓ‖_v; the finite places contribute #(L_O/O·ℓ) and the infinite places the hermitian norms, ‖·‖_v = ⟨·,·⟩^{1/2} at a real and ⟨·,·⟩ at a complex place; example deg = −½ log⟨e, e⟩ for K = ℚ.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, pp. 353–354: Grad(P) = log #(P/R·p) − Σ_v ε_v log ‖p‖_v with ε_v = 1, 2 at real and complex places.
- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.1–1.2, Corollaire, p. 14: Degree of compactified divisors Σ n_v log N(v) + Σ λ_σ and the induced homomorphism deg : Pic_c(O_K) → ℝ given by log(N(𝔞_s)/∏|s|_σ^{e_σ}).
- Henri Gillet and Christophe Soulé, *Arithmetic intersection theory*, §3.4.3, p. 131: deg : ĈH¹(Spec O_F) → ℝ, (Z, g) ↦ log #(Z) + ½ Σ_σ g_σ.


<a id="R351-degree-independent-of-section"></a>
### Independence of the section: the product formula

*Theorem* · node `R35.1/degree-independent-of-section`

For a hermitian line bundle L̄ over Spec O_K and nonzero s, t ∈ L, log #(L/O_K s) − Σ_σ log ‖s‖_σ = log #(L/O_K t) − Σ_σ log ‖t‖_σ. Consequently deg^ : Pic^(O_K) → ℝ is a well-defined group homomorphism.

Hypotheses and conventions:

- s, t ≠ 0 in L, so t = a s for a unique a ∈ K^×.

Construction or proof:

1. Write t = a·s with a ∈ K^×. The finite term changes by log #(L/O_K t) − log #(L/O_K s) = log |N_{K/ℚ}(a)| = −Σ_𝔭 log |a|_𝔭 (FractionalIdeal.absNorm_span_singleton).
2. The archimedean term changes by −Σ_σ log |σ(a)| = −log |N_{K/ℚ}(a)| (InfinitePlace.prod_eq_abs_norm).
3. The two changes cancel; this is the product formula NumberField.prod_abs_eq_one. Additivity under ⊗ follows by taking s ⊗ s′ as the section of L ⊗ L′ (degree-additivity).

Uses:

- PAPER-TSIMERMAN-18/height-section-independence: replacing the Hodge section leaves the height unchanged.

Checks:

- Replacing s by 2s in Ō_ℚ leaves log 2 − log 2 = 0; for K = ℚ(√2) and a = 1 + √2 a unit, both terms are unchanged separately.

Depends on (this roadmap): [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree).

Depends on (libraries and other roadmaps): `NumberField.prod_abs_eq_one` (Mathlib), `NumberField.InfinitePlace.prod_eq_abs_norm` (Mathlib), `FractionalIdeal.absNorm_span_singleton` (Mathlib).

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.1, p. 25: By the product formula ∏_v ‖λℓ‖_v = ∏_v ‖ℓ‖_v for λ ∈ K^×, so the degree does not depend on ℓ.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, p. 354: Grad is independent of the section p by the product formula.
- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.2, Proposition 1.1 and Corollaire, pp. 13–14: The map from compactified divisors to Pic_c is an isomorphism modulo principal divisors; principal divisors have degree zero by the product formula.


<a id="R351-degree-additivity"></a>
### Additivity of the Arakelov degree

*Theorem* · node `R35.1/degree-additivity`

For hermitian vector bundles over Spec O_K: deg^(L̄ ⊗ M̄) = deg^(L̄) + deg^(M̄) and deg^(L̄^∨) = −deg^(L̄) for line bundles; deg^(Ē ⊕ F̄) = deg^(Ē) + deg^(F̄); for an exact sequence 0 → F̄ → Ē → Q̄ → 0 with restricted and quotient metrics, deg^(Ē) = deg^(F̄) + deg^(Q̄). If L ⊂ L′ are hermitian line bundles with the same generic fibre and the same metrics, deg^(L̄′) = deg^(L̄) + log #(L′/L).

Hypotheses and conventions:

- The sub-bundle F is saturated in E.
- In the last statement L and L′ are O_K-lattices in one K-line with equal metrics at every σ.

Construction or proof:

1. For tensor products use the section s ⊗ s′: the index is multiplicative, #(L ⊗ M / O_K(s ⊗ s′)) = #(L/O_K s)·#(M/O_K s′), and norms multiply.
2. Dual: write L = 𝔞·s with 𝔞 ⊇ O_K the fractional ideal determined by s ∈ L, so log #(L/O_K s) = −log N(𝔞) (FractionalIdeal.absNorm). Then L^∨ = 𝔞^{−1}·s^∨ with s^∨(s) = 1 and ‖s^∨‖_σ = ‖s‖_σ^{−1}; s^∨ lies in L^∨ only when 𝔞 = O_K, so compute with the generic-section form of the degree (arithmetic-degree, arakelovDegree_eq_fractionalIdeal): deg^(L̄^∨) = −log N(𝔞^{−1}) − Σ_σ log ‖s^∨‖_σ = log N(𝔞) + Σ_σ log ‖s‖_σ = −deg^(L̄).
3. Exact sequences and sums reduce to rank one through det_exact and det_sum of hermitian-operations.
4. For L ⊂ L′ choose s ∈ L; #(L′/O_K s) = #(L′/L)·#(L/O_K s).

Checks:

- deg^ of the Hodge line of a product is the sum (R35.2/product-isometry); in Deligne §2.1 the exact sequence of group schemes gives deg ω(A) = deg ω(A′) + deg ω(A″).

Depends on (this roadmap): [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree), [Independence of the section: the product formula](#R351-degree-independent-of-section), [Sums, tensor products, duals, determinants, sub-bundles and base change](#R351-hermitian-operations).

Depends on (libraries and other roadmaps): `FractionalIdeal.absNorm` (Mathlib).

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §2.1, p. 36: The isometry ω(A) ≅ ω(A′) ⊗ ω(A″) gives deg ω(A) = deg ω(A′) + deg ω(A″).
- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.2, Corollaire, p. 14: deg is a homomorphism on Pic_c(O_K).
- Jean-Benoît Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz)*, Appendice A.3, p. 147: Arakelov degrees of sub-bundles with restricted metrics and of quotients, additive in exact sequences.


<a id="R351-degree-base-change"></a>
### Arakelov degree under finite extension

*Theorem* · node `R35.1/degree-base-change`

For a finite extension L/K of number fields and a hermitian vector bundle Ē over Spec O_K, deg^(Ē_{O_L}) = [L:K]·deg^(Ē); hence the normalised degree deg^(Ē)/[K:ℚ] does not change under base change. More generally, if L̄ ⊂ L̄′ are hermitian line bundles over O_L with equal metrics and L = M ⊗_{O_K} O_L for a hermitian line bundle M̄ over O_K, then deg^(L̄′) = [L:K]·deg^(M̄) + log #(L′/L).

Hypotheses and conventions:

- L/K finite; Ē over Spec O_K.

Construction or proof:

1. Reduce to rank one by the determinant. Take s ∈ M nonzero, viewed in M ⊗ O_L.
2. Finite part: the index of O_L s in M ⊗ O_L is the norm of the extended ideal, N_L(𝔞O_L) = N_K(𝔞)^{[L:K]} for 𝔞 the ideal with M = 𝔞^{-1}s, by Mathlib's Ideal.absNorm_algebraMap (absNorm(I·O_L) = absNorm(I)^{[L:K]}) applied to 𝔞, an integral ideal since s ∈ M.
3. Archimedean part: each σ ∈ Σ_K has exactly [L:K] extensions τ ∈ Σ_L with ‖s‖_τ = ‖s‖_σ.
4. The second statement adds the index term of degree-additivity.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.3/field-extension-comparison: comparison of h(A) and h(A_{K′}).

Checks:

- For K = ℚ, L = ℚ(i), M̄ = (ℤ, 2|·|): deg^(M̄) = −log 2 and deg^(M̄_{O_L}) = −2 log 2.

Depends on (this roadmap): [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree), [Additivity of the Arakelov degree](#R351-degree-additivity), [Sums, tensor products, duals, determinants, sub-bundles and base change](#R351-hermitian-operations).

Depends on (libraries and other roadmaps): `Ideal.absNorm` (Mathlib), `Algebra.norm` (Mathlib), `Algebra.norm_norm` (Mathlib), `Ideal.absNorm_algebraMap` (Mathlib).

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.2 (Remarque), p. 27: For semistable A the formation of ω(A)_O commutes with extension of scalars and the factor 1/[k:ℚ] makes h(A) invariant; the degree scales by [k′:k].
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, p. 354: h(A) is unchanged by base change to the ring of integers of a finite extension.
- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §1.1, pp. 2–3 (arXiv v3): Since A is semi-abelian, the height deg^ ω̄(A)/[K:ℚ] is invariant under base change.


<a id="R351-arakelov-divisors-of-number-field"></a>
### Arakelov divisors on Spec O_K and the compactified Picard group

*Construction* · node `R35.1/arakelov-divisors-of-number-field` · suggested module `TauCeti/NumberTheory/Arakelov/Divisor`, namespace `TauCeti.Arakelov.ArakelovDivisor`

The group Div^(O_K) of Arakelov divisors is the set of formal sums D = Σ_𝔭 n_𝔭[𝔭] + Σ_v λ_v[v] with n_𝔭 ∈ ℤ almost all zero (𝔭 nonzero primes) and λ_v ∈ ℝ (v infinite places); its degree is deg^(D) = Σ_𝔭 n_𝔭 log N𝔭 + Σ_v λ_v. The principal divisor of f ∈ K^× is (f) = Σ_𝔭 ord_𝔭(f)[𝔭] − Σ_v mult(v)·log|f|_v [v]. The map D ↦ O(D) = (𝔞_D^{-1}, ‖x‖_v = e^{−λ_v/mult(v)}|x|_v), 𝔞_D = ∏𝔭^{n_𝔭}, induces an isomorphism Div^(O_K)/{principal} ≅ Pic^(O_K) carrying deg^ to the Arakelov degree, and there is an exact sequence 0 → ℝ^{r_1 + r_2}/log|O_K^×| → Pic^(O_K) → Cl(K) → 0, where log|O_K^×| is the image of the units under u ↦ (mult(v) log|u|_v)_v. In Gillet–Soulé's language Div^(O_K)/principal is ĈH¹(Spec O_K) with Green functions g_v = 2λ_v/mult(v).

Hypotheses and conventions:

- K a number field; r_1, r_2 the numbers of real and complex places.

Construction or proof:

1. Define D ↦ O(D) and check that (f) ↦ the trivial bundle with the section f, using ‖f‖_v = 1 after twisting (Szpiro, Proposition 1.1).
2. Surjectivity: a hermitian line bundle L̄ with a section s ≠ 0 is O(D) for D = Ψ(L̄, s) = Σ ord_𝔭(𝔞_s)[𝔭] − Σ_v mult(v) log ‖s‖_v [v]; changing s changes D by a principal divisor.
3. Degree compatibility is the definition of arithmetic-degree; principal divisors have degree zero (degree-independent-of-section).
4. The exact sequence: the kernel of Pic^(O_K) → Cl(K) is represented by divisors supported at infinity, modulo the principal divisors of units (Gillet–Soulé §3.4.3); the image of the units is Mathlib's NumberField.Units.logEmbedding, which records the coordinates at the places w ≠ w₀, the coordinate at w₀ being fixed by the product formula, and the volume of ℝ^{r_1+r_2}_0/log|O_K^×| is the regulator.

Uses:

- GrossZagierAndArithmeticHeights:GZ.0: finite and infinite arithmetic degrees with conjugation-compatible metrics, as requested.
- ArakelovGeometryAndAbelianHeights:R35.1/sup-metric-height-comparison: the divisor of a point of projective space with the sup metric.

API:

| Name | Role | Statement |
|---|---|---|
| `ArakelovDivisor` | structure | A pair (𝔞, λ) of a nonzero fractional ideal (the finite part ∏𝔭^{n_𝔭}) and a real function λ on InfinitePlace K. |
| `ArakelovDivisor.degree` | constructor | deg^(𝔞, λ) = log N(𝔞) + Σ_v λ_v. |
| `ArakelovDivisor.principal` | constructor | (f) = (f·O_K, v ↦ −mult(v) log ∣f∣_v) for f ∈ K^×. |
| `ArakelovDivisor.degree_principal` | simp | deg^((f)) = 0. |
| `ArakelovDivisor.degree_add` | simp | deg^(D + D′) = deg^(D) + deg^(D′) for the componentwise group law. |
| `ArakelovDivisor.toPicHat` | equivalence | Div^(O_K)/principal ≅ Pic^(O_K), compatible with degrees. |
| `ArakelovDivisor.picHat_exact` | relation | 0 → ℝ^{r_1+r_2}/log∣O_K^×∣ → Pic^(O_K) → Cl(K) → 0. |
| `ArakelovDivisor.toChowHat` | compatibility | Identification with ĈH¹(Spec O_K): (𝔞, λ) ↦ (div 𝔞, g_v = 2λ_v/mult(v)), with degree log #(Z) + ½ Σ_σ g_σ. |
| `ArakelovDivisor.finitePart` | projection | The finite part 𝔞, an invertible fractional ideal. |
| `ArakelovDivisor.infinitePart` | projection | The archimedean coefficient λ_v at an infinite place v. |
| `ArakelovDivisor.principalSubgroup` | constructor | The subgroup generated by the principal divisors (f), f ∈ K^×. |
| `ArakelovDivisor.PicHat` | constructor | The quotient Div^(O_K)/principal, the compactified Picard group. |
| `ArakelovDivisor.degree_zero` | simp | deg^(0) = 0. |
| `ArakelovDivisor.degree_eq_of_sub_mem` | characterisation | deg^ is constant on classes modulo principal divisors. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `ArakelovDivisor.degree_principal_two` | computation | For K = ℚ and f = 2: (2) = [2] − log 2·[∞] has degree log 2 − log 2 = 0. |
| `ArakelovDivisor.degree_zero` | degenerate | The zero divisor (O_K, 0) has degree 0. |
| `ArakelovDivisor.mult_nonexample` | non-example | For K = ℚ(i) and f = 2, the divisor with archimedean coefficient −log∣2∣ (multiplicity forgotten) has degree log 4 − log 2 ≠ 0, so it is not principal-compatible. |
| `ArakelovDivisor.picHat_rat` | compatibility | For K = ℚ, deg^ : Div^(ℤ)/principal → ℝ is a bijection, matching Gillet–Soulé's deg : ĈH¹(Spec ℤ) ≅ ℝ. |

Checks:

- deg^((f)) = 0 for every f ∈ K^×; for K = ℚ, Pic^(ℤ) ≅ ℝ through deg^.

Depends on (this roadmap): [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree), [Independence of the section: the product formula](#R351-degree-independent-of-section).

Depends on (libraries and other roadmaps): `ClassGroup` (Mathlib), `NumberField.Units.regulator` (Mathlib), `FractionalIdeal.absNorm` (Mathlib), `NumberField.Units.logEmbedding` (Mathlib).

Sources:

- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.1–1.2, Proposition 1.1 and Corollaire, pp. 13–14: Compactified divisors with degree Σ n_v log N(v) + Σ λ_σ, principal divisors (f) = Σ ord_v(f)[v] − Σ e_σ log|f|_σ[σ], the isomorphism Div_c/Pr_c ≅ Pic_c and the exact sequence 0 → ℝ^{r_1+r_2}/log O^× → Pic_c → Cl → 0.
- Henri Gillet and Christophe Soulé, *Arithmetic intersection theory*, §3.4.3, p. 131: ĈH¹(Spec O_F) sits in the exact sequence with the regulator and the class group, is identified with ideles modulo units, and carries the degree log #(Z) + ½ Σ g_σ; for F = ℚ the degree is an isomorphism.


<a id="R351-arithmetic-divisors-green"></a>
### Arithmetic divisors with Green functions and ĈH¹

*Definition* · node `R35.1/arithmetic-divisors-green` · suggested module `TauCeti/AlgebraicGeometry/Arakelov/ArithmeticDivisor`, namespace `TauCeti.Arakelov.ArithmeticDivisor`

Let X be a regular scheme, flat, separated and of finite type over B = Spec O_K or over B_S = Spec O_K ∖ S for a finite set S of nonzero primes, with smooth generic fibre; X need not be proper. For σ ∈ Σ_K write X_σ(ℂ) for the complex manifold of X ⊗_σ ℂ, and F_∞ for complex conjugation acting on ⊔_σ X_σ(ℂ). An arithmetic divisor is a pair D̂ = (D, g) with D a Cartier divisor on X (ℚ-coefficients allowed) and g = (g_σ) a Green function for D: g_σ is a smooth real function on X_σ(ℂ) ∖ D_σ(ℂ), F_∞-invariant across σ, such that for every local equation f of D the function g_σ + log|f|² extends smoothly. Div^(X) is the group of arithmetic divisors; the principal arithmetic divisor of a rational function f ≠ 0 is d̂iv(f) = (div f, (−log|f|²_σ)_σ); ĈH¹(X) = Div^(X)/{principal}. The classes supported over S, ĈH¹_{|S|}(X), are those (D, 0) with D supported in fibres over primes of S; for X over O_K and X_S = X ×_B B_S restriction induces ĈH¹(X)/ĈH¹_{|S|}(X) ≅ ĈH¹(X_S).

Hypotheses and conventions:

- X regular, flat and separated of finite type over B or B_S, with smooth generic fibre; Cartier divisors and Weil divisors agree on the regular X (SchemeAndStackFoundations SF.3: classGroup_picard_locallyFactorial of the merged TauCetiRoadmap README §3.4, requested).
- Green functions are smooth Green currents of logarithmic type in Gillet–Soulé's sense for divisors; no log-log growth is allowed in this node.
- ℚ-coefficients: ĈH¹(X)_ℚ = ĈH¹(X) ⊗ ℚ is the group used by Zhang's localized pairing.

Construction or proof:

1. Define Div^(X) as pairs; principal divisors are arithmetic divisors because −log|f|² + log|f|² = 0 extends trivially (Poincaré–Lelong: dd^c of −log|f|² is the current of div f).
2. ĈH¹(X) is the quotient; on Spec O_K it is the group of arakelov-divisors-of-number-field (g_v = 2λ_v/mult(v)).
3. Localization: an element of ĈH¹(X) restricts to X_S; its kernel is generated by vertical divisors over S together with their principal relations, which is ĈH¹_{|S|}(X) (Zhang, Remark 8.5). For B = Spec ℤ and a prime p the vertical fibre V_p satisfies (V_p, 0) = (0, 2 log p) in ĈH¹(X), since d̂iv(p) = (V_p, −2 log p).

Uses:

- Zhang 2021 (AFL), §8.4: special divisors with automorphic Green functions are elements of ĈH¹(M) of a non-proper regular model over O_E[1/d].
- GrossZagierAndArithmeticHeights:GZ.2: arithmetic surfaces are the relative dimension one case; GZ.2 specializes the pairing to admissible Green functions.
- AGHMP 2018, §4.6: the metrized tautological bundle ω̂ is an element of Pic^(M) ≅ ĈH¹(M).

API:

| Name | Role | Statement |
|---|---|---|
| `ArithmeticDivisor` | structure | Pairs (D, g) of a Cartier divisor and an F_∞-invariant Green function of logarithmic type. |
| `ArithmeticDivisor.principal` | constructor | d̂iv(f) = (div f, −log∣f∣²) for f a nonzero rational function. |
| `ArithmeticChow1` | constructor | ĈH¹(X) = Div^(X)/{d̂iv(f)}, with ℚ-coefficient version. |
| `ArithmeticDivisor.ofGreen` | constructor | For a smooth F_∞-invariant function φ on X(ℂ), the class a(φ) = (0, φ). |
| `ArithmeticChow1.forget` | projection | ζ : ĈH¹(X) → CH¹(X), (D, g) ↦ D, with kernel the image of a. |
| `ArithmeticChow1.restrict` | functoriality | Restriction to an open X_S = X ×_B B_S; it vanishes on ĈH¹_{∣S∣}(X). |
| `ArithmeticChow1.localization` | equivalence | ĈH¹(X)/ĈH¹_{∣S∣}(X) ≅ ĈH¹(X_S). |
| `ArithmeticChow1.vertical_fibre` | relation | Over ℤ: (V_p, 0) = a(2 log p) in ĈH¹(X). |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `ArithmeticChow1.spec_ok` | compatibility | For X = Spec O_K, ĈH¹(X) is Div^(O_K)/principal with g_v = 2λ_v/mult(v). |
| `ArithmeticChow1.vertical_fibre_Z` | computation | For X = Spec ℤ and p prime, ([p], 0) and (0, 2 log p) define the same class, both of degree log p. |
| `ArithmeticDivisor.green_nonexample` | non-example | For X = ℙ¹_ℤ and D = [0], the pair (D, 0) is not an arithmetic divisor: 0 + log∣z∣² does not extend smoothly across z = 0. |
| `ArithmeticChow1.empty_divisor` | degenerate | a(0) = 0 and a(φ) for constant φ = c is the pullback of (0, c) from the base. |

Checks:

- The relation (V_p, 0) ≡ (0, 2 log p) over ℤ; on Spec O_K the definition recovers Szpiro's compactified divisors.

Depends on (this roadmap): [Arakelov divisors on Spec O_K and the compactified Picard group](#R351-arakelov-divisors-of-number-field).

Depends on (libraries and other roadmaps): `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5/chow-group`, `ComplexComparisonPartII:C0/repair-analytification`.

Sources:

- Henri Gillet and Christophe Soulé, *Arithmetic intersection theory*, §3.3.2–3.3.4, pp. 126–127: Arithmetic cycles (Z, g) with g a Green current for Z, principal arithmetic cycles d̂iv(f) = (div f, −log|f|²) and the arithmetic Chow groups ĈH^p(X) as the quotient.
- Wei Zhang, *Weil representation and arithmetic fundamental lemma*, §8.4 and Remark 8.5, p. 42 (arXiv v3): ĈH¹ with ℚ-coefficients of a regular flat, possibly non-proper, scheme over O_E or O_E ∖ S, Green functions via the Gillet–Soulé convention, the example V_p = (0, 2 log p) over ℚ, and the localization isomorphism ĈH¹(M)/ĈH¹_{|S|}(M) ≅ ĈH¹(M_S).
- Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, §4.6, display (4.6.1), arXiv v3: Arithmetic divisors (Z, Φ) with Φ an F_∞-invariant Green function, principal divisors (div Ψ, −log|Ψ|²) and ĈH¹(M), with the isomorphism to metrized line bundles.


<a id="R351-pic-hat-iso-chow-hat"></a>
### Metrized line bundles and arithmetic divisors

*Theorem* · node `R35.1/pic-hat-iso-chow-hat`

For X as in arithmetic-divisors-green, let Pic^(X) be the group of isometry classes of line bundles on X with an F_∞-invariant smooth hermitian metric on L_ℂ over ⊔_σ X_σ(ℂ). The map ĉ₁ : Pic^(X) → ĈH¹(X), L̄ ↦ (div s, −log ‖s‖²) for any nonzero rational section s, is a well-defined group isomorphism. For a morphism f : X′ → X of such schemes with f(X′) not contained in the support, ĉ₁(f^*L̄) = f^*ĉ₁(L̄).

Hypotheses and conventions:

- X regular, so Cartier divisors and line bundles with rational sections correspond.
- Metrics are smooth and F_∞-invariant.

Construction or proof:

1. Changing s to fs changes (div s, −log‖s‖²) by d̂iv(f), so the class is independent of s.
2. −log ‖s‖² is a Green function for div s: locally s = u·f·e with e a frame, so −log‖s‖² + log|f|² = −log(|u|²‖e‖²) is smooth.
3. Inverse: from (D, g) form O(D) with the metric ‖1_D‖² = e^{−g}; isometry classes correspond to classes modulo principal divisors.
4. Group laws: ⊗ goes to + since ‖s ⊗ t‖ = ‖s‖‖t‖. Pullback compatibility follows from the formulas.

Checks:

- On Spec O_K this is the isomorphism of arakelov-divisors-of-number-field; for X = Spec ℤ, ĉ₁(ℤ, r|·|) = (0, −2 log r) of degree −log r.

Depends on (this roadmap): [Arithmetic divisors with Green functions and ĈH¹](#R351-arithmetic-divisors-green), [Hermitian vector bundles over the ring of integers](#R351-hermitian-vector-bundle).

Depends on (libraries and other roadmaps): `SchemeAndStackFoundations:SF.3`.

Sources:

- Henri Gillet and Christophe Soulé, *Arithmetic intersection theory*, §3.4.2, p. 131: For X projective and irreducible, ĈH¹(X) is isomorphic to the group of isometry classes of line bundles with F_∞-invariant hermitian metrics ([G-S 4], Proposition 2.5).
- Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, §4.6, display (4.6.1): Pic^(M) ≅ ĈH¹(M) via L̂ ↦ (div Ψ, −log ‖Ψ‖²).
- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.2, Proposition 1.1, p. 14: The rank-zero base case on Spec O_K.


<a id="R351-arithmetic-degree-pairing"></a>
### Arithmetic degree of ĈH¹ on proper one-cycles

*Construction* · node `R35.1/arithmetic-degree-pairing` · suggested module `TauCeti/AlgebraicGeometry/Arakelov/Pairing`, namespace `TauCeti.Arakelov.ArithmeticChow1`

Let X be regular and flat over B = Spec O_K (or B_S) with smooth generic fibre, and Z_1^c(X) the group of 1-cycles on X proper over the base. There is a bilinear pairing (·,·) : ĈH¹(X)_ℚ × Z_1^c(X)_ℚ → ℝ (respectively ℝ_S = ℝ/span_ℚ{log p : some prime of S lies over p} over B_S), defined on an irreducible C not contained in |D| as follows: if C is horizontal with normalization ν : Spec O_{K(C)} → X, (D̂, C) = deg^(ν^*ĉ₁^{-1}(D̂)), the Arakelov degree of the pulled-back hermitian line bundle over O_{K(C)}, equivalently Σ_{x ∈ C ∩ |D|} i_x(C, D)·log #k(x) + ½ Σ_{y ∈ C(ℂ)} g(y), where i_x(C, D) is the length at x of the restriction of D to the normalization of C; if C is vertical, lying in the fibre over 𝔭, (D̂, C) = deg_{C}(O(D)|_C)·log N𝔭. The value depends only on the class of D̂, extends to all C by moving D̂ within its class, and on vertical cycles depends only on rational equivalence inside proper subschemes of special fibres; this defines the pairing on the quotient Z_1(X) of Z_1^c(X) by such cycles. The height of a point x ∈ X(K′) with closure C_x is h_{D̂}(x) = (D̂, C_x)/[K′:ℚ] when X is proper.

Hypotheses and conventions:

- Horizontal 1-cycles proper over the base are finite over it, so their normalizations are spectra of rings of integers.
- Over B_S the finite contributions at primes of S are not defined, so values are taken modulo ℚ-multiples of their logarithms.

Construction or proof:

1. Horizontal case: ν^*O(D) with the pulled-back metric is a hermitian line bundle over O_{K(C)}; its degree splits into the finite intersection multiplicities with D and the archimedean values of g at the points of C(ℂ).
2. Independence of the class: a principal divisor d̂iv(f) pairs to deg^ of a principal divisor on O_{K(C)}, which is 0 (degree-independent-of-section), and vertical principal relations pair to 0 by the degree of a principal divisor on a proper curve over a field.
3. Over B_S the finite contributions at S are only defined up to ℚ·log p, giving values in ℝ_S; Zhang (9.3) applies the same definition with the base Spec O_E ∖ S.
4. Extension to curves inside |D| uses moving lemmas on regular X (Bost–Gillet–Soulé §2.3, as cited by Zhang).

Uses:

- Zhang 2021 (AFL), (9.5): Int(τ, Φ) pairs the generating series of special divisors with derived CM cycles in ℝ_S.
- ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height: the modular height of a moduli point is the pairing of the metrized Hodge class with its closure.
- GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing: GZ.2 specializes this pairing to arithmetic surfaces.

API:

| Name | Role | Statement |
|---|---|---|
| `ArithmeticChow1.pairing` | constructor | (D̂, C) ∈ ℝ (or ℝ_S) for D̂ ∈ ĈH¹(X)_ℚ and C ∈ Z_1(X)_ℚ. |
| `ArithmeticChow1.pairing_horizontal` | characterisation | For C horizontal with normalization ν, (D̂, C) = deg^(ν^*ĉ₁^{-1}D̂). |
| `ArithmeticChow1.pairing_vertical` | characterisation | For C in the fibre over 𝔭, (D̂, C) = deg_C(O(D)∣_C)·log N𝔭. |
| `ArithmeticChow1.pairing_principal` | simp | (d̂iv f, C) = 0. |
| `ArithmeticChow1.pairing_green` | simp | (a(φ), C) = ½ Σ_{y ∈ C(ℂ)} φ(y) for C horizontal. |
| `ArithmeticChow1.pairing_projection` | functoriality | Projection formula (f^*D̂, C′) = (D̂, f_*C′) for f : X′ → X proper. |
| `ArithmeticChow1.pairing_localize` | compatibility | Over B_S the pairing is the image in ℝ_S of the pairing over B when X extends. |
| `ArithmeticChow1.pointHeight` | constructor | h_{D̂}(x) = (D̂, C_x)/[K(x):ℚ] for X proper over B. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `ArithmeticChow1.pairing_vertical_fibre` | computation | Over ℤ, for C a horizontal section of ℙ¹_ℤ, ((V_p, 0), C) = ((0, 2 log p), C) = log p. |
| `ArithmeticChow1.pairing_spec` | degenerate | For X = Spec O_K and C = X, the pairing is the Arakelov degree of arithmetic-degree. |
| `ArithmeticChow1.pairing_RS_nonexample` | non-example | Over Spec ℤ[1/p], the value log p is 0 in ℝ_S; a real-valued pairing on ĈH¹(X_S) is not well defined. |
| `ArithmeticChow1.pairing_metric_shift` | computation | Adding a constant c to the Green function at every σ changes (D̂, C) for a horizontal C of degree d over K by ½·c·d·[K:ℚ]. |

Checks:

- Over Spec ℤ, (0, 2 log p) pairs with the horizontal section of ℙ¹_ℤ to log p, matching ([p], 0); inverting a new prime p enlarges the quotient ℝ_S by ℚ log p.

Depends on (this roadmap): [Arithmetic divisors with Green functions and ĈH¹](#R351-arithmetic-divisors-green), [Metrized line bundles and arithmetic divisors](#R351-pic-hat-iso-chow-hat), [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree), [Independence of the section: the product formula](#R351-degree-independent-of-section).

Depends on (libraries and other roadmaps): `SchemeAndStackFoundations:SF.5/chow-group`.

Sources:

- Wei Zhang, *Weil representation and arithmetic fundamental lemma*, §9.1, (9.1)–(9.4), p. 43 (arXiv v3): The pairing ĈH¹(M) × Z̃_{1,c}(M) → ℝ for a flat regular M over O_E with proper 1-cycles, its ℝ_S-valued version over O_E ∖ S, and the quotient Z_{1,c}(M) by vertical cycles rationally equivalent to zero on proper special-fibre subschemes.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.7, pp. 29–30: Heights of points of a projective variety from an integral model, an extension of the point over the ring of integers and a hermitian metric, normalised by 1/[k:ℚ].
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Remark 4.3, p. 167: Heights of K-rational points with respect to an invertible sheaf on a scheme proper over O_K with hermitian metrics at the archimedean places.


<a id="R351-stack-weighted-degree"></a>
### Arithmetic degree on relative dimension zero Deligne–Mumford stacks

*Construction* · node `R35.1/stack-weighted-degree` · suggested module `TauCeti/AlgebraicGeometry/Arakelov/StackDegree`, namespace `TauCeti.Arakelov.StackDegree`

Let Y be a Deligne–Mumford stack, flat, proper and quasi-finite (relative dimension 0) over Spec O_E, with finite inertia. ĈH¹(Y) is the group of pairs (Z, Φ) with Z a Cartier divisor (supported in positive characteristic) and Φ an F_∞-invariant real function on Y(ℂ), modulo d̂iv(Ψ) = (div Ψ, −log|Ψ|²), and Pic^(Y) ≅ ĈH¹(Y). Its arithmetic degree is the homomorphism deg^ : ĈH¹(Y) → ℝ with deg^(Z, 0) = Σ_𝔮 log N(𝔮)·Σ_{z ∈ Z(F̄_𝔮)} length(O^{et}_{Z,z})/#Aut(z) for Z effective, and deg^(0, Φ) = ½ Σ_{y ∈ Y(ℂ)} Φ(y)/#Aut(y). For a finite étale morphism Y′ → Y of degree d, deg^(π^*D̂) = d·deg^(D̂); for Y = Spec O_L it is the Arakelov degree over O_L.

Hypotheses and conventions:

- Y finite flat over O_E as a stack: every geometric point has finite automorphism group.
- O^{et}_{Z,z} is the étale local ring at z; residue-field norms N(𝔮), not the residue characteristic, weight each prime.

Construction or proof:

1. Define the degree on effective divisors and on Green functions by the displayed weighted sums; principal divisors have degree zero by the product formula applied on an étale atlas by schemes and division by automorphism orders.
2. Pic^(Y) ≅ ĈH¹(Y) is the stack version of pic-hat-iso-chow-hat, glued by étale descent (AlgebraicModuliForArithmeticGeometry R09.3).
3. Finite étale pullback: each geometric point of Y has d preimages counted with automorphism weights, so both sums scale by d.
4. For a scheme Y = Spec O_L every automorphism group is trivial and the formula is deg^ of arithmetic-degree.

Uses:

- AGHMP 2018, Theorem 6.4.2: the arithmetic intersection of metrized line bundles with the big CM cycle.
- GSpinSpecialDivisorHeights (proposed): imports this degree for CM cycles on GSpin Shimura varieties.

API:

| Name | Role | Statement |
|---|---|---|
| `StackDegree.arakelovDegree` | constructor | deg^ : ĈH¹(Y) → ℝ by the weighted formulas. |
| `StackDegree.degree_effective` | characterisation | deg^(Z, 0) = Σ_𝔮 log N𝔮 Σ_z length(O^{et}_{Z,z})/#Aut z. |
| `StackDegree.degree_green` | characterisation | deg^(0, Φ) = ½ Σ_y Φ(y)/#Aut y. |
| `StackDegree.degree_principal` | simp | deg^(d̂iv Ψ) = 0. |
| `StackDegree.degree_pullback_etale` | functoriality | deg^(π^*D̂) = deg(π)·deg^(D̂) for π finite étale. |
| `StackDegree.degree_scheme` | compatibility | For Y = Spec O_L, deg^ is the Arakelov degree of hermitian line bundles over O_L. |
| `StackDegree.picHat_iso` | equivalence | Pic^(Y) ≅ ĈH¹(Y). |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `StackDegree.degree_point_aut` | computation | For Y = [Spec O_E / (ℤ/2)] with trivial action and Φ ≡ 2, deg^(0, Φ) = ½·[E:ℚ]·2/2 = [E:ℚ]/2. |
| `StackDegree.degree_scheme_case` | degenerate | For Y = Spec O_E (trivial automorphisms) deg^ agrees with arithmetic-degree. |
| `StackDegree.residue_norm_nonexample` | non-example | Weighting a closed point over 𝔮 with log p instead of log N(𝔮) gives the wrong degree for a divisor at an inert prime of residue degree 2. |
| `StackDegree.etale_cover_scaling` | characterisation | A degree-d finite étale cover multiplies deg^ of pulled-back classes by d. |

Checks:

- AGHMP's [·:Y] is deg^ composed with pullback along Y → M; for a level cover both numerator and denominator in Theorem 6.4.2 scale by the same d.

Depends on (this roadmap): [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree), [Metrized line bundles and arithmetic divisors](#R351-pic-hat-iso-chow-hat).

Depends on (libraries and other roadmaps): `AlgebraicModuliForArithmeticGeometry:R09.3/space-fpqc-quasicoherent-descent`.

Sources:

- Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, §6.4, Definition before Theorem 6.4.2 (arXiv v3, §6.4): For Y flat of relative dimension 0 over O_E: arithmetic divisors with functions Φ on Y(ℂ), deg^(Z, 0) through log N(𝔮) and étale local lengths weighted by 1/|Aut(z)|, deg^(0, Φ) = ½ Σ Φ(y)/|Aut(y)|, and [·:Y] as the composite with pullback.


<a id="R351-heights-of-points"></a>
### Heights of algebraic points for metrized line bundles

*Construction* · node `R35.1/heights-of-points` · suggested module `TauCeti/NumberTheory/Arakelov/Height`, namespace `TauCeti.Arakelov.Height`

Let 𝒳 be a projective flat scheme over Spec ℤ (or over Spec O_K), X = 𝒳_ℚ (respectively 𝒳_K), ℒ a line bundle on 𝒳 and ‖·‖ a continuous F_∞-invariant hermitian metric on ℒ_ℂ over 𝒳(ℂ). For a number field K′ and x ∈ X(K′), let x̄ : Spec O_{K′} → 𝒳 extend x (properness) and set h_{ℒ̄}(x) = deg^(x̄^*ℒ, x^*‖·‖)/[K′:ℚ]. This depends only on the image of x in X(ℚ̄), giving h_{ℒ̄} : X(ℚ̄) → ℝ. Changing the integral model of (X, L) changes h by a bounded function; changing the continuous metric by φ = log(‖·‖′/‖·‖) changes h by at most sup|φ|.

Hypotheses and conventions:

- 𝒳 proper over the base, so every K′-point extends uniquely to O_{K′}.
- Metrics are continuous (not necessarily smooth); smooth metrics give the pairing of arithmetic-degree-pairing on the closure of x.

Construction or proof:

1. Existence and uniqueness of x̄ is the valuative criterion of properness; x̄^*ℒ with x^*‖·‖ is a hermitian line bundle over O_{K′}.
2. Field independence: for K″ ⊃ K′ the extension of x to O_{K″} is the base change of x̄, so degree-base-change gives the same normalised value.
3. Model change: two integral models agree over ℤ[1/N]; at primes dividing N the integral structures of x̄^*ℒ differ by an amount bounded by the orders of the two lattices, uniformly in x (Deligne §1.7: heights are independent of the integral structure up to O(1)).
4. Metric change: the archimedean terms change by −Σ_σ φ(x_σ)/[K′:ℚ], bounded by sup|φ|.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/log-singular-heights: heights for metrics with logarithmic singularities extend this construction off the boundary.
- FaltingsFinitenessAndIsogenyTheorems:R28.1/northcott-property-for-heights-from-log-singular-metrics: the height h(x) of Faltings' Lemma 3.

API:

| Name | Role | Statement |
|---|---|---|
| `Height.ofMetrized` | constructor | h_{ℒ̄} : X(ℚ̄) → ℝ, x ↦ deg^(x̄^*ℒ̄)/[K(x):ℚ]. |
| `Height.ofMetrized_galois` | simp | h_{ℒ̄}(x^γ) = h_{ℒ̄}(x) for γ ∈ Gal(ℚ̄/ℚ). |
| `Height.ofMetrized_tensor` | simp | h_{ℒ̄ ⊗ ℳ̄} = h_{ℒ̄} + h_{ℳ̄}. |
| `Height.ofMetrized_pullback` | functoriality | For f : 𝒳′ → 𝒳 over the base, h_{f^*ℒ̄} = h_{ℒ̄} ∘ f. |
| `Height.ofMetrized_metric_change` | relation | ∣h_{(ℒ, ‖·‖′)} − h_{(ℒ, ‖·‖)}∣ ≤ sup ∣log(‖·‖′/‖·‖)∣. |
| `Height.ofMetrized_model_change` | relation | Two integral models of (X, L) give heights differing by a bounded function. |
| `Height.ofMetrized_field` | compatibility | The value at x ∈ X(K′) does not depend on the field K′ containing the field of definition. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `Height.ofMetrized_trivial` | degenerate | For ℒ̄ = O_𝒳 with the constant metric 1, h ≡ 0. |
| `Height.ofMetrized_constant_metric` | computation | Multiplying the metric by e^{−c} adds c to h at every point. |
| `Height.ofMetrized_projective_line` | compatibility | For 𝒳 = ℙ¹_ℤ, ℒ = O(1) with the sup metric and x = [a : b] with coprime integers, h(x) = log max(∣a∣, ∣b∣). |
| `Height.ofMetrized_unnormalised_nonexample` | non-example | Without the factor 1/[K′:ℚ] the value at x = [1 : 2] would double on passing from ℚ to ℚ(i), so the unnormalised degree is not a function on X(ℚ̄). |

Checks:

- For ℙⁿ_ℤ with O(1) and the sup metric, h_{Ō(1)} is the absolute logarithmic Weil height (sup-metric-height-comparison).

Depends on (this roadmap): [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree), [Arakelov degree under finite extension](#R351-degree-base-change), [Arithmetic degree of ĈH¹ on proper one-cycles](#R351-arithmetic-degree-pairing).

Depends on (libraries and other roadmaps): `ComplexComparisonPartII:C0/repair-analytification`.

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.7, pp. 29–30: Construction of h_L from a projective model over ℤ, an extension of L and a conjugation-invariant hermitian structure, normalised by 1/[k:ℚ] so that it is defined on X(ℚ̄).
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Remark 4.3, p. 167: The logarithmic height h_L of K-rational points for an invertible sheaf on a scheme proper over O_K with hermitian metrics at infinity.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, Lemma 3, p. 356: Heights h(x) = Grad(ρ_x^*O(1), ‖·‖)/[K:ℚ] for points of X ⊂ ℙⁿ_ℤ extended to Spec R.


<a id="R351-metrized-heights-weil-machine"></a>
### Metrized heights represent Weil heights; Northcott for ample bundles

*Theorem* · node `R35.1/metrized-heights-weil-machine`

In the situation of heights-of-points, h_{ℒ̄} represents the Weil height class h_{L} of RP.0's height machine for the generic fibre (X, L): h_{ℒ̄} − h_L is bounded on X(ℚ̄). Consequently, if L is ample, h_{ℒ̄} is bounded below on X(ℚ̄), and for all D ≥ 1 and B ∈ ℝ the set {x ∈ X(ℚ̄) : [ℚ(x):ℚ] ≤ D, h_{ℒ̄}(x) ≤ B} is finite.

Hypotheses and conventions:

- X = 𝒳_ℚ is a projective variety over ℚ (for a reducible or non-reduced X apply the statement to the reduced irreducible components); L ample for the last two statements; metrics continuous.

Construction or proof:

1. For ℒ = O(1) on ℙⁿ_ℤ with the sup metric, h_{ℒ̄} equals the normalised Weil height exactly (sup-metric-height-comparison).
2. For very ample L choose an embedding 𝒳 → ℙⁿ_ℤ over ℤ[1/N] with L = O(1); by heights-of-points the change of model and of metric is bounded, so h_{ℒ̄} represents h_L.
3. For general L write L = L_1 ⊗ L_2^{-1} with L_i very ample and use additivity.
4. Lower bound and Northcott: these are properties of the Weil class for ample L (RP.0 height-positivity-base-locus and northcott-ample), invariant under bounded change (RP.0 northcott-invariance).

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/log-singular-heights: the compact case to which Faltings–Chai reduce the logarithmically singular case.

Checks:

- Deligne's Rappel 1.8: finitely many x ∈ X(k) with h_L(x) ≤ h for L ample.

Depends on (this roadmap): [Heights of algebraic points for metrized line bundles](#R351-heights-of-points).

Depends on (libraries and other roadmaps): `HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`, `HeightsRationalPointsAndObstructions:RP.0/northcott-ample`, `HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus`, `HeightsRationalPointsAndObstructions:RP.0/northcott-invariance`.

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.7–Rappel 1.8, pp. 29–30: h_L is defined modulo O(1) independently of choices, and for L ample there are finitely many points of bounded height over a fixed number field.
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Proposition 4.4 (the case X = X̄), p. 168: Lower bound and finiteness of points of bounded height and bounded degree for an ample bundle with continuous metric, described as well known.


<a id="R351-sup-metric-height-comparison"></a>
### Projective space: the Arakelov degree is Mathlib's height

*Comparison* · node `R35.1/sup-metric-height-comparison`

Let K be a number field, n ≥ 0 and x = (x_0, …, x_n) ∈ K^{n+1} ∖ {0} with point [x] ∈ ℙⁿ(K). Let 𝔟 ⊂ K be the fractional ideal generated by the coordinates. The hermitian line bundle x̄^*O(1) with the sup metric (‖ℓ‖_σ = |ℓ(x)|_σ / max_i |x_i|_σ for linear forms ℓ) is isometric to O(D_x) for the Arakelov divisor D_x = (𝔟^{-1}, v ↦ mult(v)·log max_i |x_i|_v), and deg^(x̄^*Ō(1)_sup) = log N(𝔟^{-1}) + Σ_v mult(v) log max_i |x_i|_v = Height.logHeight x, the logarithm of Mathlib's relative multiplicative height of the tuple; it depends only on [x] and equals Projectivization.logHeight [x]. With the Fubini–Study metric ‖ℓ‖_σ = |ℓ(x)|_σ/(Σ_i |x_i|²_σ)^{1/2} the degree is log of the Arakelov (ℓ²) height, and 0 ≤ deg^_FS − deg^_sup ≤ ½[K:ℚ]·log(n + 1).

Hypotheses and conventions:

- x ≠ 0; the sup 'metric' is continuous but not smooth on ℙⁿ(ℂ).
- Mathlib's height is relative: it is [K:ℚ] times the absolute height.

Construction or proof:

1. The integral structure of x̄^*O(1) is the O_K-module generated by the coordinate forms evaluated at x, i.e. 𝔟 viewed as linear functions on the line K·x; its dual description gives the finite part log N(𝔟^{-1}) = −log N(𝔟).
2. By NumberField.absNorm_mul_finprod_finitePlace_eq_one (after scaling x to be integral, which changes neither side by mulHeight_smul_eq_mulHeight and degree-independent-of-section), ∏ᶠ_𝔭 max_i |x_i|_𝔭 = N(𝔟)^{-1}.
3. The archimedean terms are Σ_v mult(v) log max_i |x_i|_v, matching NumberField.mulHeight_eq.
4. For the Fubini–Study metric, max_i |x_i| ≤ (Σ|x_i|²)^{1/2} ≤ (n+1)^{1/2} max_i |x_i| at each embedding; summing over [K:ℚ] embeddings gives the bound.

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.1: the requested comparison |deg ρ_x^*O(1) − [K:ℚ]·logHeight x| ≤ [K:ℚ]·C for a continuous metric on O(1).
- TauCetiRoadmap ArithmeticHeights pull request #287, Layer 0: the ℓ² Arakelov tuple height owned there is the Fubini–Study case of this degree.

API:

| Name | Role | Statement |
|---|---|---|
| `ArakelovDivisor.ofTuple` | constructor | For x ≠ 0, the Arakelov divisor (𝔟^{-1}, v ↦ mult(v) log max_i ∣x_i∣_v) of x^*Ō(1) with the sup metric. |
| `ArakelovDivisor.degree_ofTuple` | characterisation | deg^(ofTuple x) = Height.logHeight x. |
| `ArakelovDivisor.ofTuple_smul` | relation | ofTuple(c·x) = ofTuple x − (c) for c ∈ K^×. |

Checks:

- For K = ℚ and x = (a, b) coprime, deg^ = log max(|a|, |b|), Mathlib's mulHeight_eq_max_abs_of_gcd_eq_one; for x = (1, 1) the Fubini–Study degree is ½ log 2.

Depends on (this roadmap): [Arakelov divisors on Spec O_K and the compactified Picard group](#R351-arakelov-divisors-of-number-field), [Heights of algebraic points for metrized line bundles](#R351-heights-of-points).

Depends on (libraries and other roadmaps): `Height.logHeight` (Mathlib), `Projectivization.logHeight` (Mathlib), `NumberField.mulHeight_eq` (Mathlib), `NumberField.absNorm_mul_finprod_finitePlace_eq_one` (Mathlib), `HeightsRationalPointsAndObstructions:RP.0/normalized-height`.

Sources:

- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, Lemma 3 and its proof, p. 356: Heights of points of X ⊂ ℙⁿ_ℤ through ρ_x^*O(1) compared, up to bounded error, with the naive height of the coordinates.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.7, p. 29: The height from a hermitian structure on O(1) is a classical height function modulo O(1).
- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.2, Corollaire, p. 14: The degree of a rank-one bundle with a section s is log(N(𝔞_s)/∏_σ|s|_σ^{e_σ}).


<a id="R351-norm-and-rational-lines"></a>
### Hermitian ℚ-lines and norms of hermitian line bundles

*Construction* · node `R35.1/norm-and-rational-lines` · suggested module `TauCeti/NumberTheory/Arakelov/Divisor`, namespace `TauCeti.Arakelov.PicHat`

(a) The group of hermitian ℚ-line bundles over Spec O_K is Pic^(O_K)_ℚ = Pic^(O_K) ⊗ ℚ, with deg^ extended ℚ-linearly; equivalently ĈH¹(Spec O_K)_ℚ. (b) For a finite extension L/K, the norm N_{L/K} : Pic^(O_L) → Pic^(O_K) sends M̄ = (M, ‖·‖) to the norm N_{O_L/O_K}(M) of the invertible O_L-module with the metrics ‖N(m)‖_σ = ∏_{τ ∈ Σ_L, τ|_K = σ} ‖m‖_τ; it is a group homomorphism, corresponds to the push-forward ĈH¹(Spec O_L) → ĈH¹(Spec O_K), and satisfies deg^(N_{L/K} M̄) = deg^(M̄) and N_{L/K}(L̄_{O_L}) ≅ L̄^{⊗[L:K]} for L̄ over O_K. (c) For π : 𝒴 → 𝒳 finite locally free of constant degree d between flat proper arithmetic schemes, étale on generic fibres, N_π(ℳ) carries the metric ‖N_π(m)‖(x) = ∏_{π(y) = x} ‖m‖(y) at complex points, and for every x ∈ 𝒳(ℚ̄), h_{N_π ℳ̄}(x) = Σ_{y ∈ 𝒴(ℚ̄), π(y) = x} h_{ℳ̄}(y), a sum over the d points above x.

Hypotheses and conventions:

- L/K finite; for (c) the morphism is finite locally free so that the module norm exists (SchemeAndStackFoundations SF.3: lineBundleNorm of the merged TauCetiRoadmap README §3.5, requested); in (c) π is étale on generic fibres.

Construction or proof:

1. (a) Tensor with ℚ; deg^ is a homomorphism (degree-additivity).
2. (b) The norm of an invertible O_L-module along the finite flat O_K → O_L exists and is multiplicative (SF.3, upstream README §3.5 lineBundleNorm); for m ∈ M nonzero, N(m) generates a submodule of index #(M/O_L m), since the absolute norm is transitive; the archimedean norms multiply over the [L:K] embeddings above each σ, so deg^ is preserved.
3. Compatibility with push-forward: Gillet–Soulé's proper push-forward on ĈH¹ of Spec O_L → Spec O_K sends (div m, −log‖m‖²) to (div N(m), −Σ log‖m‖²_τ), the class of N_{L/K}M̄.
4. N_{L/K}(L̄_{O_L}) ≅ L̄^{⊗[L:K]} because the norm of a pulled-back module is the [L:K]-th power.
5. (c) The norm commutes with the base change x̄ : Spec O_{K′} → 𝒳, so x̄^*N_π ℳ = N_{R/O_{K′}}(ℳ|_R) for the order R = O(𝒴 ×_𝒳 Spec O_{K′}); for an invertible R-module and a generic generator f the indices #(R/fR) and #(R̃/fR̃) agree (both are |N(f)|, R and its normalisation R̃ being lattices in the same étale K′-algebra), so (b) applied to the factors O_{K′_j} of R̃ gives deg x̄^*N_π ℳ̄ = Σ_j deg^ y_j^*ℳ̄; dividing by [K′:ℚ] gives the sum over the d geometric points.

Uses:

- HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line: requested: generic hermitian rational lines, arithmetic degree and norm descent of metrics.
- GrossZagierAndArithmeticHeights:GZ.0: requested hermitian rational line bundles.

API:

| Name | Role | Statement |
|---|---|---|
| `PicHat.rat` | constructor | Pic^(O_K)_ℚ = Pic^(O_K) ⊗ ℚ with the ℚ-linear degree. |
| `PicHat.norm` | constructor | N_{L/K} : Pic^(O_L) → Pic^(O_K). |
| `PicHat.norm_mul` | simp | N_{L/K}(M̄ ⊗ M̄′) = N_{L/K}M̄ ⊗ N_{L/K}M̄′. |
| `PicHat.degree_norm` | simp | deg^(N_{L/K}M̄) = deg^(M̄). |
| `PicHat.norm_baseChange` | relation | N_{L/K}(L̄_{O_L}) ≅ L̄^{⊗[L:K]}. |
| `PicHat.norm_trans` | functoriality | N_{L/K} ∘ N_{M/L} = N_{M/K} for towers M/L/K. |
| `PicHat.norm_pushforward` | compatibility | N_{L/K} agrees with the push-forward ĈH¹(Spec O_L) → ĈH¹(Spec O_K). |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `PicHat.norm_self` | degenerate | For L = K, N_{K/K} is the identity. |
| `PicHat.norm_gaussian_prime` | computation | N_{ℚ(i)/ℚ} of the ideal (1 + i) with the standard metric is (2ℤ, ∣·∣), of degree −log 2. |
| `PicHat.norm_degree_nonexample` | non-example | Taking the metric ‖N(m)‖_σ = ‖m‖_τ for a single τ above σ (instead of the product) breaks deg^(N M̄) = deg^(M̄) as soon as [L:K] > 1. |
| `PicHat.degree_rat` | compatibility | deg^ on Pic^(O_K)_ℚ restricts to deg^ on Pic^(O_K). |

Checks:

- For K = ℚ, L = ℚ(i) and M̄ = (𝔭, standard metric) with 𝔭 = (1 + i): N_{L/ℚ}M̄ = (2ℤ, |·|) of degree −log 2 = deg^(M̄).

Depends on (this roadmap): [Additivity of the Arakelov degree](#R351-degree-additivity), [Arakelov divisors on Spec O_K and the compactified Picard group](#R351-arakelov-divisors-of-number-field).

Depends on (libraries and other roadmaps): `SchemeAndStackFoundations:SF.3`, `Ideal.absNorm` (Mathlib), `Algebra.norm` (Mathlib), `Algebra.norm_norm` (Mathlib).

Sources:

- Henri Gillet and Christophe Soulé, *Arithmetic intersection theory*, §3.6, Theorem 3.6.1, pp. 134–135: Proper push-forward f_* : ĈH^p(X) → ĈH^{p−d}(Y) of arithmetic Chow groups for maps smooth on generic fibres, functorial in compositions; for Spec O_L → Spec O_K it is the norm on ĈH¹.
- Lucien Szpiro, *Degrés, intersections, hauteurs*, §1.2, Corollaire, p. 14: The degree homomorphism on the compactified Picard group, used to compare degrees before and after the norm.


## R35.2. The Hodge bundle and Faltings metric

The Hodge line of a smooth commutative group scheme is the determinant of its invariant differentials, e^*Ω^g; for abelian schemes it is the Hodge determinant of AbelianSchemesAndArithmeticModuli A6, and for semi-abelian and Néron models it is defined by the same formula (p_*Ω^g would be wrong without properness). At a complex embedding it carries the Faltings metric (i^{g²}/2^g)∫ α ∧ ᾱ, the covolume of the period lattice for dz_1 ∧ ⋯ ∧ dz_g. The layer proves the behaviour of this metric under isogenies (norms scale by deg^{1/2}), products (multiplicative) and duality (Raynaud, Faltings–Chai), builds the metrized Hodge line over O_K and its relative version over the Siegel space, the hermitian pairing with the dual variety used for τ-components, the dictionary of normalisations, and the elliptic formula 12h_Fal(E) = log N(Δ_{E/K})/[K:ℚ] − (1/[K:ℚ])Σ_σ log(|Δ(τ_σ)|(Im τ_σ)^6) − 12 log 2π, checked against LMFDB.

**Named milestones:** [Faltings metric](#R352-faltings-hermitian-form), [Metrized Hodge line bundle](#R352-metrized-hodge-line), [Elliptic Faltings height formula](#R352-elliptic-period-comparison).

**Layers of other roadmaps used:** `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianSchemesAndArithmeticModuli:A6`, `ComplexComparisonPartII:C0`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, `PELModuli:M3`, `PELModuli:M6`, `ShimuraCompactifications:C4`.

<a id="R352-hodge-line-of-group-scheme"></a>
### The Hodge line of a smooth commutative group scheme

*Construction* · node `R35.2/hodge-line-of-group-scheme` · suggested module `TauCeti/AlgebraicGeometry/GroupScheme/HodgeLine`, namespace `TauCeti.GroupScheme`

Let S be a scheme and G → S a smooth separated commutative group scheme of finite presentation, of constant relative dimension g, with unit section e. Its Hodge bundle is ω_G = e^*Ω¹_{G/S} = Lie(G/S)^∨, locally free of rank g, and its Hodge line is ω̄_G := det ω_G = e^*Ω^g_{G/S} = Λ^g Lie(G/S)^∨. (a) Formation of ω_G and of its determinant commutes with every base change S′ → S. (b) For an open subgroup scheme G⁰ ⊂ G containing e(S) (for instance the fibrewise identity component of a Néron model) restriction is an isomorphism ω̄_G = ω̄_{G⁰}. (c) A homomorphism φ : G → H of such group schemes of the same relative dimension induces φ^* : ω̄_H → ω̄_G; ω̄_{G×H} ≅ ω̄_G ⊗ ω̄_H. (d) If G → S is proper (an abelian scheme), evaluation at e gives p_*Ω^g_{G/S} ≅ ω̄_G and agrees with the Hodge line of AbelianSchemesAndArithmeticModuli A6; without properness p_*Ω^g need not be ω̄_G.

Hypotheses and conventions:

- G smooth, separated, commutative, finitely presented over S, all fibres of dimension g.
- In (d) the comparison is for abelian schemes; for a semi-abelian scheme only the definition e^*Ω^g is used.

Construction or proof:

1. ω_G = e^*Ω¹_{G/S} is locally free of rank g because G is smooth of relative dimension g; Ω¹_{G/S} ≅ p^*ω_G by translation invariance, so Ω^g_{G/S} ≅ p^*ω̄_G and e^*Ω^g = ω̄_G.
2. Base change: Ω¹ commutes with base change and pullback along e commutes with base change.
3. (b) is local at e(S); (c) pulls back differentials along φ and uses Ω¹_{G×H} = pr_1^*Ω¹_G ⊕ pr_2^*Ω¹_H.
4. (d) For an abelian scheme p_*O_G = O_S universally, so p_*Ω^g = p_*p^*ω̄_G = ω̄_G (AbelianSchemesAndArithmeticModuli A1 relative-invariant-forms).

Uses:

- ArakelovGeometryAndAbelianHeights:R35.2/metrized-hodge-line: the finite part of the metrized Hodge line.
- ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height: the Hodge line of the universal semi-abelian scheme over a toroidal compactification.
- FaltingsFinitenessAndIsogenyTheorems:R28.1/semiabelian-scheme-and-its-hodge-line-bundle: Faltings' Bemerkungen a)–b) are (a) and (d).

API:

| Name | Role | Statement |
|---|---|---|
| `GroupScheme.hodgeBundle` | constructor | ω_G = e^*Ω¹_{G/S}, locally free of rank g. |
| `GroupScheme.hodgeLine` | constructor | ω̄_G = det ω_G = e^*Ω^g_{G/S}. |
| `GroupScheme.hodgeLine_baseChange` | functoriality | ω̄_{G_{S′}} ≅ (S′ → S)^*ω̄_G, compatible with composition of base changes. |
| `GroupScheme.hodgeLine_openSubgroup` | simp | ω̄_{G⁰} = ω̄_G for an open subgroup containing the unit section. |
| `GroupScheme.hodgeLine_pullback` | functoriality | φ^* : ω̄_H → ω̄_G for a homomorphism of equal relative dimension; (ψφ)^* = φ^*ψ^*. |
| `GroupScheme.hodgeLine_prod` | simp | ω̄_{G×H} ≅ ω̄_G ⊗ ω̄_H. |
| `AbelianScheme.hodgeLine_eq_pushforward` | compatibility | For an abelian scheme p_*Ω^g ≅ ω̄_G, and ω̄_G is A6's Hodge determinant λ_H. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `GroupScheme.hodgeLine_Gm` | computation | For 𝔾_m over ℤ, ω̄ = ℤ·dt/t. |
| `GroupScheme.hodgeLine_pushforward_nonexample` | non-example | For 𝔾_m, p_*Ω¹ is free of infinite rank, so it is not the Hodge line: (d) needs properness. |
| `GroupScheme.hodgeLine_trivial_group` | degenerate | For g = 0 (G = S) the Hodge line is O_S. |
| `GroupScheme.hodgeLine_multiplication` | computation | For an abelian scheme of relative dimension g and n ∈ ℤ, [n]^* acts on ω̄_G by n^g. |

Checks:

- For G = 𝔾_m over Spec ℤ, ω̄_G = ℤ·dt/t; p_*Ω¹ = ℤ[t, t^{-1}]·dt/t is not of rank one, which is why (d) needs properness.

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A6/hodge-determinant-and-moduli-export`, `AbelianSchemesAndArithmeticModuli:A1/relative-invariant-forms`, `AbelianSchemesAndArithmeticModuli:A1/relative-products-and-dimension`, `NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice`, `ShimuraCompactifications:C4/roadmap/semi-abelian-scheme`, `Module.Projective` (Mathlib).

Sources:

- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §2, pp. 350–351, Bemerkungen a), b): ω_{A/S} = s^*(Ω^g_{A/S}) for a semiabelian scheme; it is p_*(Ω^g) if p is proper and commutes with base change.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.2 (Généralisation), p. 27: ω(G) for a flat group scheme of relative dimension g; for G smooth ω(G) = Λ^g(Lie G)^∨.
- Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*, §3.1.3, p. 43 (arXiv v4): For the semi-abelian Pic⁰ of a stable curve the Hodge bundle is ω_S = det(e^*Ω¹_{J/S}).
- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §1.1, p. 2 (arXiv v3): ω(A) = det Ω(A) with Ω(A) = Lie(A)^∨ for the identity component of the Néron model.


<a id="R352-faltings-hermitian-form"></a>
### The Faltings metric on top differential forms

*Definition* · node `R35.2/faltings-hermitian-form` · suggested module `TauCeti/AlgebraicGeometry/AbelianVariety/FaltingsMetric`, namespace `TauCeti.AbelianVariety`

For a complex abelian variety A of dimension g, the one-dimensional space H⁰(A, Ω^g) carries the hermitian form ⟨α, β⟩_Fal = (i^{g²}/2^g)·∫_{A(ℂ)} α ∧ β̄. It is positive definite: ‖α‖²_Fal = 2^{−g}·|∫_{A(ℂ)} α ∧ ᾱ| > 0 for α ≠ 0, and i^{g²} ∫ α ∧ ᾱ is a positive real number, i^{g²} = i^g(−1)^{g(g−1)/2}. Other normalisations in use are ‖α‖²_Del = (2π)^{−g}|∫ α ∧ ᾱ| (Deligne, Bost, Yuan–Zhang, Gaudron–Rémond) and ‖α‖²_un = |∫ α ∧ ᾱ| (Tsimerman, Andreatta–Goren–Howard–Madapusi Pera); see normalization-adapter.

Hypotheses and conventions:

- A a complex abelian variety (compact complex torus with a polarization) of dimension g ≥ 0; for g = 0, H⁰ = ℂ with ‖1‖ = 1.
- Faltings prints (i/2)^g ∫ α ∧ ᾱ, which is negative for g ≡ 2, 3 mod 4; the factor i^{g²} = i^g(−1)^{g(g−1)/2} corrects the sign (source issue E1).

Construction or proof:

1. In linear coordinates z_1, …, z_g on A(ℂ) = ℂ^g/Λ write α = c·dz_1 ∧ ⋯ ∧ dz_g. Then α ∧ ᾱ = |c|²(−1)^{g(g−1)/2}∏_j(dz_j ∧ dz̄_j) and dz_j ∧ dz̄_j = −2i dx_j ∧ dy_j.
2. Hence (i^{g²}/2^g)α ∧ ᾱ = |c|²·dx_1 ∧ dy_1 ∧ ⋯ ∧ dx_g ∧ dy_g, the Lebesgue volume form; integrating gives |c|²·vol(ℂ^g/Λ) > 0 (covolume-formula).
3. Sesquilinearity and hermitian symmetry follow from conjugating the integrand; the form is invariant under all automorphisms of A since they preserve ∫.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.2/metrized-hodge-line: the archimedean metrics of the Hodge line.
- ArakelovGeometryAndAbelianHeights:R35.2/relative-faltings-metric: fibrewise on families over complex bases.
- FaltingsFinitenessAndIsogenyTheorems:R28.1: requested hermitian product 2^{−g}i^{g²}∫ α ∧ β̄, positive definite and conjugation-invariant.

API:

| Name | Role | Statement |
|---|---|---|
| `AbelianVariety.faltingsInner` | constructor | ⟨α, β⟩_Fal = (i^{g²}/2^g)∫_{A(ℂ)} α ∧ β̄ on H⁰(A, Ω^g). |
| `AbelianVariety.faltingsNormSq` | constructor | ‖α‖²_Fal = 2^{−g}∣∫ α ∧ ᾱ∣. |
| `AbelianVariety.faltingsInner_pos` | characterisation | ⟨α, α⟩_Fal > 0 for α ≠ 0. |
| `AbelianVariety.faltingsNormSq_smul` | simp | ‖λα‖²_Fal = ∣λ∣²‖α‖²_Fal. |
| `AbelianVariety.faltingsNormSq_aut` | simp | ‖f^*α‖_Fal = ‖α‖_Fal for an automorphism f of A. |
| `AbelianVariety.faltingsNormSq_conj` | compatibility | For A defined over ℝ ⊂ ℂ or for the conjugate variety Ā, ‖ᾱ‖_Fal on Ā equals ‖α‖_Fal on A. |
| `AbelianVariety.faltingsNormSq_eq_volume` | characterisation | ‖α‖²_Fal is the volume of A(ℂ) for the Haar measure ∣α ∧ ᾱ∣/2^g. |
| `ComplexTorus.faltingsNormSqDz` | constructor | For a lattice Λ ⊂ ℂ, ‖dz‖²_Fal on ℂ/Λ, equal to the covolume of Λ. |
| `ComplexTorus.faltingsNormSqDz_span` | characterisation | ‖dz‖²_Fal on ℂ/(ℤ + τℤ) is Im τ. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `AbelianVariety.faltingsNormSq_elliptic` | computation | For E = ℂ/(ℤ + τℤ) and α = dz, ‖dz‖²_Fal = Im τ. |
| `AbelianVariety.faltingsInner_sign_nonexample` | non-example | For g = 2 and A = E × E with α = dz_1 ∧ dz_2, (i/2)²∫ α ∧ ᾱ = −(Im τ)² < 0: the printed factor (i/2)^g is not positive definite. |
| `AbelianVariety.faltingsNormSq_dim_zero` | degenerate | For g = 0, ‖1‖_Fal = 1. |
| `AbelianVariety.faltingsNormSq_product` | compatibility | For A × B and α ∧ β (pulled back), ‖α ∧ β‖²_Fal = ‖α‖²_Fal·‖β‖²_Fal (Fubini). |

Checks:

- ‖dz‖²_Fal = Im τ for ℂ/(ℤ + τℤ); scaling α by λ multiplies ‖α‖ by |λ|; for g = 2 the printed (i/2)²∫ α ∧ ᾱ is −‖α‖²_Fal.

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization`, `ComplexComparisonPartII:C0/repair-analytification`, `UpperHalfPlane` (Mathlib).

Sources:

- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §2, p. 351, Bemerkung d): On Γ(A, Ω^g) for complex proper A, the hermitian product (i/2)^g ∫_A α ∧ β̄ (sign corrected in this node).
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Definition 4.1, p. 167: The inner product of invariant g-forms by integration over A(ℂ); the square of the norm of α is the volume of A for the Haar measure determined by α; invariant under automorphisms.
- Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*, §3.1.3 (1), pp. 43–44 and §4.3.1, pp. 70–72 (arXiv v4): ‖α‖²_Fal = (i^{g²}/2^g)∫ α ∧ ᾱ.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.2(b), p. 26: Deligne's ⟨α, α⟩ = (2π)^{−g}∫|α ∧ ᾱ|, noting that Faltings uses 2^{−g}|α ∧ ᾱ|.


<a id="R352-covolume-formula"></a>
### The Faltings norm is a covolume

*Theorem* · node `R35.2/covolume-formula`

Let A(ℂ) ≅ V/Λ with V = T₀A ≅ ℂ^g and Λ the period lattice (AbelianSchemesAndArithmeticModuli A5). For a basis z_1, …, z_g of linear coordinates on V, ‖dz_1 ∧ ⋯ ∧ dz_g‖²_Fal = covol(Λ), the Lebesgue covolume of Λ in ℂ^g = ℝ^{2g}. In the Siegel normalisation Λ = ℤ^g + τℤ^g with τ ∈ ℍ_g, ‖dz_1 ∧ ⋯ ∧ dz_g‖²_Fal = det(Im τ); for a general basis of periods (Ω_1 | Ω_2) with Ω_1 invertible and τ = Ω_1^{−1}Ω_2, the form dual to the basis has squared norm |det Ω_1|²·det(Im τ). For g = 1 and Λ = ℤω_1 + ℤω_2 with Im(ω_2/ω_1) > 0, ‖dz‖²_Fal = |ω_1|²·Im(ω_2/ω_1) = area of ℂ/Λ.

Hypotheses and conventions:

- A a complex abelian variety; Λ ⊂ ℂ^g a full lattice; τ ∈ ℍ_g symmetric with positive definite imaginary part.

Construction or proof:

1. By the computation in faltings-hermitian-form the integrand is the Lebesgue volume form; integrate over a fundamental domain of Λ.
2. For Λ = ℤ^g + τℤ^g the real 2g × 2g matrix of the basis has determinant det(Im τ) (block elimination of Re τ).
3. Changing coordinates by Ω_1 multiplies the form by det Ω_1 and the squared norm by |det Ω_1|².

Uses:

- ArakelovGeometryAndAbelianHeights:R35.2/elliptic-period-comparison: the archimedean term |ω_1|² Im τ.
- ArakelovGeometryAndAbelianHeights:R35.2/relative-faltings-metric: the metric on the Siegel family.
- ArakelovGeometryAndAbelianHeights:R35.5/hodge-metric-log-singularities: the growth of det Im τ near the boundary.

Checks:

- For E = ℂ/(ℤ + iℤ), ‖dz‖² = 1; for τ = 2i, ‖dz‖² = 2; for E × E′ the norm squared of dz_1 ∧ dz_2 is the product of covolumes.

Depends on (this roadmap): [The Faltings metric on top differential forms](#R352-faltings-hermitian-form).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization`, `AbelianSchemesAndArithmeticModuli:A5/siegel-analytic-family`, `ZLattice.covolume` (Mathlib), `UpperHalfPlane` (Mathlib).

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, proof of Proposition 4.5, p. 168: The covolume of the lattice in ℂ^g generated by e_1, …, e_g and the columns of the period matrix a is |det Im(a)|.
- Fabien Pazuki, *Theta height and Faltings height*, Theorem 1.1, p. 2 (arXiv v2): The comparison of theta and Faltings heights is written with the archimedean terms log det(Im τ_σ) for A_σ(ℂ) ≅ ℂ^g/(ℤ^g + τ_σℤ^g).
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.10, p. 31: On the Siegel space the frame e of ω deduced from e_1, …, e_g has norm given by det Im Z (with Deligne's (2π)^{−g}), and this is Sp(V)-invariant up to the automorphy factor.


<a id="R352-isogeny-pullback-norm"></a>
### Faltings norms along isogenies

*Theorem* · node `R35.2/isogeny-pullback-norm`

Let φ : A → B be an isogeny of complex abelian varieties of degree d = deg φ. For α ∈ H⁰(B, Ω^g), ‖φ^*α‖²_Fal = d·‖α‖²_Fal. Equivalently, for the canonical section 1 of ω̄_A ⊗ ω̄_B^{−1} given by φ^*, its norm at a complex embedding with these metrics is d^{1/2}, and d at a complex place counted with multiplicity two.

Hypotheses and conventions:

- φ surjective with finite kernel of order d (AbelianSchemesAndArithmeticModuli A3 relative-isogeny over ℂ).

Construction or proof:

1. φ : A(ℂ) → B(ℂ) is a covering map of degree d, a local biholomorphism.
2. ∫_{A(ℂ)} φ^*(α ∧ ᾱ) = d·∫_{B(ℂ)} α ∧ ᾱ by the change of variables for a d-sheeted covering.
3. In lattice terms: φ is induced by a linear isomorphism V_A → V_B carrying Λ_A onto a sublattice of Λ_B of index d.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.4/isogeny-height-formula: the archimedean contribution −½[K:ℚ] log deg φ.
- FaltingsFinitenessAndIsogenyTheorems:R28.1: requested ‖φ^*α‖² = deg(φ)‖α‖².

Checks:

- For [n] : A → A, ‖[n]^*α‖² = n^{2g}‖α‖² and [n]^*α = n^g α, consistent; for E → E/⟨P⟩ with P of order p the norm squares scale by p.

Depends on (this roadmap): [The Faltings metric on top differential forms](#R352-faltings-hermitian-form), [The Faltings norm is a covolume](#R352-covolume-formula).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization`.

Sources:

- Michel Raynaud, *Hauteurs et isogénies*, §1.4, pp. 204–205: For an isogeny of complex tori of degree d, ∫_A |u^*(ω) ∧ u^*(ω̄)| = d·∫_B |ω ∧ ω̄|, so the section 1 of ω_u has ⟨1, 1⟩ = d.
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, proof of Lemma 3.4, p. 166: For an isogeny α with dual α^t, deg(α)·p_{G₁} = α^{t*} ∘ p_G ∘ α^*, the isogeny formula for the comparison maps.


<a id="R352-metrized-hodge-line"></a>
### The metrized Hodge line bundle over O_K

*Construction* · node `R35.2/metrized-hodge-line` · suggested module `TauCeti/NumberTheory/Arakelov/HodgeLine`, namespace `TauCeti.AbelianVariety`

Let K be a number field and G → Spec O_K a smooth separated commutative group scheme of finite type whose generic fibre A = G_K is an abelian variety of dimension g (a Néron model, its identity component, or a semi-abelian model). The metrized Hodge line ω̄̂(G) is the hermitian line bundle over Spec O_K whose module is ω̄_G (hodge-line-of-group-scheme) and whose metric at σ ∈ Σ_K is the Faltings metric on ω̄_G ⊗_σ ℂ = H⁰(A_σ, Ω^g), A_σ = A ⊗_{K,σ} ℂ. The archimedean data depend only on A; the finite data depend on the model, and for the Néron model 𝒜 of A one writes ω̄̂(A/K) = ω̄̂(𝒜) = ω̄̂(𝒜⁰). For a finite extension L/K there is a canonical injection ω̄_{𝒜_L} ↪ ω̄_𝒜 ⊗_{O_K} O_L of lattices in ω̄(A_L) (pullback of invariant differentials along the morphism 𝒜 ⊗ O_L → 𝒜_L given by the Néron mapping property) which is an isometry at every complex embedding.

Hypotheses and conventions:

- G smooth over O_K with abelian generic fibre; the Néron model exists by NeronModelsAndSemistableAbelianVarieties R11.1.
- The conjugation condition holds because A_{σ̄} is the complex conjugate variety of A_σ and the Faltings form is conjugation-compatible.

Construction or proof:

1. Module: ω̄_G is a projective O_K-module of rank one (hodge-line-of-group-scheme, R11.1 differential-lattice); its generic fibre is H⁰(A, Ω^g).
2. Metric: faltings-hermitian-form at each σ; conjugation compatibility from faltings-hermitian-form's conjugation API.
3. Base change map: the Néron mapping property gives 𝒜 ⊗_{O_K} O_L → 𝒜_L extending the identity; pulling back invariant differentials gives ω̄_{𝒜_L} → ω̄_{𝒜} ⊗ O_L, injective because it is the identity on generic fibres; the archimedean metrics are computed on the same complex abelian varieties.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.3/faltings-height: h(A/K) = deg^ ω̄̂(A/K)/[K:ℚ].
- HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line: the quaternionic Hodge line imports the hermitian line and its degree.
- PAPER-TSIMERMAN-18/hodge-line: Hodge determinant with its metric.

API:

| Name | Role | Statement |
|---|---|---|
| `AbelianVariety.metrizedHodgeLine` | constructor | ω̄̂(A/K): the Néron Hodge line with Faltings metrics, a hermitian line bundle over O_K. |
| `GroupScheme.metrizedHodgeLine` | constructor | ω̄̂(G) for a smooth model G with abelian generic fibre. |
| `AbelianVariety.metrizedHodgeLine_identityComponent` | simp | ω̄̂(𝒜⁰) = ω̄̂(𝒜). |
| `AbelianVariety.metrizedHodgeLine_baseChange_le` | relation | ω̄_{𝒜_L} ⊆ ω̄_𝒜 ⊗ O_L inside ω̄(A_L), with equal metrics. |
| `AbelianVariety.metrizedHodgeLine_iso` | functoriality | A K-isomorphism A ≅ B induces an isometry ω̄̂(A/K) ≅ ω̄̂(B/K). |
| `AbelianVariety.metrizedHodgeLine_pullback` | functoriality | A K-isogeny φ : A → B induces φ^* : ω̄_{𝒜_B} → ω̄_{𝒜_A} scaling norms by deg(φ)^{1/2} at every σ. |
| `AbelianVariety.metrizedHodgeLine_norm_eq_volume` | characterisation | ‖α‖²_σ is the Faltings volume of A_σ for α ∈ ω̄_{𝒜}. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `AbelianVariety.metrizedHodgeLine_elliptic_Q` | computation | For E/ℚ with Néron differential ω_N and period lattice Λ, ω̄̂(E/ℚ) ≅ (ℤ, ‖1‖² = covol(Λ)), so its degree is −½ log covol(Λ). |
| `AbelianVariety.metrizedHodgeLine_dim_zero` | degenerate | For g = 0, ω̄̂ = Ō_K. |
| `AbelianVariety.metrizedHodgeLine_model_nonexample` | non-example | For E : y² + y = x³ (27.a3) with Néron differential ω_N = dx/(2y + 1), the non-minimal model W² = X³ + 16 (X = 4x, W = 8y + 4) has invariant differential dX/(2W) = ω_N/2; its lattice ℤ·ω_N/2 contains ℤ·ω_N with index 2 and would raise the degree by log 2: the finite part must be the Néron lattice. |
| `AbelianVariety.metrizedHodgeLine_product` | compatibility | ω̄̂(A × B) ≅ ω̄̂(A) ⊗ ω̄̂(B) (product-isometry). |

Checks:

- For A = E an elliptic curve over ℚ with Néron differential ω_N, ω̄̂(E/ℚ) = (ℤ·ω_N, ‖ω_N‖² = area of ℂ/Λ_{ω_N}); LMFDB's Faltings height of 11.a2 is −½ log of that area, −0.30801…

Depends on (this roadmap): [The Hodge line of a smooth commutative group scheme](#R352-hodge-line-of-group-scheme), [The Faltings metric on top differential forms](#R352-faltings-hermitian-form), [Hermitian vector bundles over the ring of integers](#R351-hermitian-vector-bundle).

Depends on (libraries and other roadmaps): `NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice`, `NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property`, `NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence`, `NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-gluing`, `ComplexComparisonPartII:C0/repair-analytification`.

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.2(a)–(b), p. 26: ω(A)_O = Λ^g((Lie A_O)^∨) for the Néron model A_O gives the finite absolute values; integration gives the archimedean ones.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, p. 354: ω_{A/R} for a semiabelian A over R = O_K with proper generic fibre, metrized at each infinite place by the integration metric.
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 169: The projective O_K-module ω_G of a semi-abelian model has hermitian metrics by square-integration, hence a degree; the canonical map ω_{A/F} ⊗ O_K → ω_{A/K} is an isometry at the archimedean places.
- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §1.1, p. 2 (arXiv v3): The metrized line bundle ω̄(A) over Spec O_K with finite part det Ω(A) and archimedean metric (2π)^{−g}∫|α ∧ ᾱ|.
- Jacob Tsimerman, *The André–Oort conjecture for A_g*, §2.1, p. 3 (arXiv v5): The Hodge line H⁰(Spec O_K, L) of the Néron model of A with everywhere semistable reduction, with the archimedean integrals ∫σ(ω ∧ ω̄).


<a id="R352-product-isometry"></a>
### Products: the metrized Hodge line is multiplicative

*Theorem* · node `R35.2/product-isometry`

For abelian varieties A, B over a number field K, the Néron model of A × B is 𝒜 ×_{O_K} ℬ and ω̄̂(A × B) ≅ ω̄̂(A) ⊗ ω̄̂(B) isometrically; more generally for semi-abelian (or smooth) models G, H, ω̄̂(G ×_{O_K} H) ≅ ω̄̂(G) ⊗ ω̄̂(H). Hence deg^ ω̄̂(A × B) = deg^ ω̄̂(A) + deg^ ω̄̂(B), and for n ≥ 1, deg^ ω̄̂(A^n) = n·deg^ ω̄̂(A).

Hypotheses and conventions:

- A, B abelian varieties over K; the Néron mapping property is checked on smooth test schemes.

Construction or proof:

1. The product of Néron models has the Néron mapping property for A × B, since morphisms into a product are pairs.
2. hodge-line-of-group-scheme (c) gives ω̄_{G×H} ≅ ω̄_G ⊗ ω̄_H at the module level.
3. Archimedean: for α on A_σ (dimension g) and β on B_σ (dimension h), reordering α ∧ β ∧ ᾱ ∧ β̄ to α ∧ ᾱ ∧ β ∧ β̄ costs (−1)^{gh}, and i^{(g+h)²} = i^{g²}i^{h²}(−1)^{gh}; the signs cancel and 2^{−g−h} = 2^{−g}2^{−h}, so by Fubini ‖α ∧ β‖²_Fal = ‖α‖²_Fal‖β‖²_Fal and the isomorphism is an isometry.
4. Degrees add by degree-additivity.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.6/zarhin-height-identity: the height of A^4 × (A^t)^4.

Checks:

- h(E × E′) = h(E) + h(E′); h(A^4 × (A^t)^4) = 4h(A) + 4h(A^t).

Depends on (this roadmap): [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [The Hodge line of a smooth commutative group scheme](#R352-hodge-line-of-group-scheme), [Additivity of the Arakelov degree](#R351-degree-additivity).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A1/relative-products-and-dimension`, `NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property`, `NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence`, `NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-gluing`.

Sources:

- Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, §2.3, p. 7 (arXiv v1): h(A_1 × A_2) = h(A_1) + h(A_2) is recalled for every normalisation.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Remarque 1.22, p. 35: h(A × B) = h(A) + h(B) is used to make the lower bound independent of the polarization degree.


<a id="R352-dual-hodge-line"></a>
### The Hodge lines of A and its dual

*Theorem* · node `R35.2/dual-hodge-line`

Let A be an abelian variety over a number field K with dual A^t. (a) (Raynaud) For the Néron models 𝒜, 𝒜′ of A and A^t, the metrized Hodge lines satisfy ω̄̂(𝒜)^{⊗2} ≅ ω̄̂(𝒜′)^{⊗2} isometrically; in particular deg^ ω̄̂(A/K) = deg^ ω̄̂(A^t/K). (b) (Faltings–Chai) If A has semistable reduction over K, so that the Néron identity components 𝒢 of A and 𝒢^t of A^t are semi-abelian, there is a natural isomorphism ω̄_𝒢 ≅ ω̄_{𝒢^t} extending the Serre-duality isomorphism on the generic fibre, and it is an isometry for the Faltings metrics. For an isogeny α : G → G₁ with dual α^t, the comparison maps p satisfy deg(α)·p_{G₁} = α^{t*} ∘ p_G ∘ α^*.

Hypotheses and conventions:

- (a) holds for arbitrary Néron models (semistability not needed).
- (b) S normal, G semi-abelian, abelian over a dense open of S.

Construction or proof:

1. (a) Choose an ample line bundle and its polarization u_K : A → A^t of degree d. By Raynaud's Theorem 2.1.1 the differents of u and of its dual satisfy 𝔡_u 𝔡_{u′} = (d); as u is self-dual this gives 𝔡_u² = (d), so 1/d trivializes ω_u^{⊗2} with its metrics (isogeny-pullback-norm gives the archimedean norm d), whence ω̄̂(𝒜)^{⊗2} ≅ ω̄̂(𝒜′)^{⊗2}.
2. (b) Over the abelian locus Serre duality identifies ω_G with the dual of R^g f_*O_G = det(R¹f_*O_G), which is dual to ω_{G^t}; the isomorphism extends over codimension one by a degeneration computation with Mumford's construction over a complete DVR, using the isogeny formula to compare the orders of pole at the boundary.
3. Isometry over ℂ: the polarization identifies H⁰(A, Ω^g) with H⁰(A^t, Ω^g) and the Riemann form computes both volumes.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.6/zarhin-height-identity: h(A^t) = h(A) in Zarhin's trick.
- ArakelovGeometryAndAbelianHeights:R35.3/stable-height-properties: duality invariance of the stable height.

Checks:

- For an elliptic curve E, A^t ≅ A and both statements are tautological; for a principally polarized A the canonical isomorphism ω̄_A ≅ ω̄_{A^t} is induced by the polarization.

Depends on (this roadmap): [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [Faltings norms along isogenies](#R352-isogeny-pullback-norm).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `ShimuraCompactifications:C4/roadmap/semi-abelian-scheme`, `ShimuraCompactifications:C4/roadmap/homomorphism-extension`, `NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence`, `NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-gluing`.

Sources:

- Michel Raynaud, *Hauteurs et isogénies*, §2.1, p. 206; Théorème 2.1.1 and Corollaire 2.1.3, p. 207: For a K-isogeny and its dual extended to Néron models, the differents satisfy 𝔡_u 𝔡_{u′} = (d); hence the Arakelov sheaves ω_A^{⊗2} and ω_{A′}^{⊗2} are isomorphic and deg(ω_A) = deg(ω_{A′}).
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Lemma 3.4, p. 166, and §4, p. 169: For a semi-abelian G over a normal base, abelian generically, ω_G ≅ ω_{G^t} naturally; the isomorphism is an isometry, so A^t has the same height as A.
- Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, §2.3, p. 7 (arXiv v1): h(Â) = h(A), citing Raynaud's Corollaire 2.1.3.


<a id="R352-normalization-adapter"></a>
### Normalisations of the Faltings metric and height

*Comparison* · node `R35.2/normalization-adapter`

For an abelian variety A of dimension g over a number field and any model, the three metrics on the Hodge line satisfy ‖α‖²_Del = π^{−g}‖α‖²_Fal and ‖α‖²_un = 2^g‖α‖²_Fal, so the normalised degrees h_• = deg^/[K:ℚ] satisfy h_Del = h_Fal + (g/2) log π and h_un = h_Fal − (g/2) log 2 = h_Del − (g/2) log(2π). Thus Yuan–Zhang's and Gaudron–Rémond's h(A) is h_Del; Faltings' original height (also Bilu–Parent–Rebolledo's h_F) is h_Fal; Tsimerman's and Andreatta–Goren–Howard–Madapusi Pera's h_Falt, Colmez's, and Faltings–Chai's modular height h_mod (whose inner product is i^{g²}∫ α ∧ β̄, without 2^{−g}) is h_un; in particular h_YZ = h_AGHMP + (g/2) log(2π). More generally multiplying every squared norm by c > 0 changes the normalised height by −½ log c, and the finite lattices are unchanged.

Hypotheses and conventions:

- The same model and the same finite lattice are used on both sides; only the archimedean metrics differ.

Construction or proof:

1. Multiplying ‖·‖²_σ by c at every σ subtracts ½ Σ_σ log c = ½[K:ℚ] log c from deg^ (arithmetic-degree's rescaling API).
2. Substitute c = π^{−g} (Deligne), c = 2^g (unscaled), c = (2π)^{−g}·2^g relative to unscaled.

Uses:

- PAPER-TSIMERMAN-18/cm-height-metric-normalization: h_YZ = h_T + (g/2) log(2π).
- PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/faltings-height: h_YZ = h_AGHMP + (g/2) log(2π).
- EllipticModularityEffectiveComparisons:EC.5/split-cartan-large-primes: Bilu–Parent–Rebolledo's h_F is h_Fal.

Checks:

- For g = 1: h_Del(E) = h_Fal(E) + ½ log π ≈ h_Fal + 0.5724; Gaudron–Rémond state h_F(A) = h(A) − (g/2) log π.

Depends on (this roadmap): [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree), [The Faltings metric on top differential forms](#R352-faltings-hermitian-form).

Sources:

- Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, §2.3, Définition 2.1 and the following paragraph, pp. 6–7 (arXiv v1): h(A) uses (2π)^{−g}∫|s ∧ s̄|; Faltings' original h_F(A) = h(A) − (g/2) log π; Colmez works with h(A) − (g/2) log 2π.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.2(b), p. 26: Deligne's normalisation (2π)^{−g}∫|α ∧ ᾱ| against Faltings' 2^{−g}|α ∧ ᾱ|.
- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §1.1, p. 2 and the remark on normalisation, p. 3 (arXiv v3): Yuan–Zhang use (2π)^{−g}∫|α ∧ ᾱ| (p. 2) and remark that their normalisation of the Faltings height differs from the one in Colmez's statement of the averaged formula (p. 3).
- Jacob Tsimerman, *The André–Oort conjecture for A_g*, §2.1, p. 3 (arXiv v5): Tsimerman's h_Fal uses the unscaled integrals ∫σ(ω ∧ ω̄).
- Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, Definition 9.1.4 (arXiv v3): The Faltings height of AGHMP with the unscaled archimedean norm.
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Definition 4.1, p. 167, and §4, p. 169: The inner product of invariant g-forms is i^{g²} times the integral of α ∧ β̄, with no factor 2^{−g} or (2π)^{−g}; the modular height h_mod of §4 is the normalised degree for this metric, so it is the unscaled height.


<a id="R352-relative-faltings-metric"></a>
### The Faltings metric on families and on the Siegel space

*Construction* · node `R35.2/relative-faltings-metric` · suggested module `TauCeti/AlgebraicGeometry/AbelianVariety/FaltingsMetric`, namespace `TauCeti.AbelianFamily`

Let S be a complex manifold and A → S a family of complex abelian varieties (proper smooth with abelian fibres) of dimension g. The Faltings metrics on the fibres define a smooth hermitian metric ‖·‖_Fal on the Hodge line ω̄_{A/S}. On the Siegel family X_τ = ℂ^g/(ℤ^g + τℤ^g) over ℍ_g the global frame e = dz_1 ∧ ⋯ ∧ dz_g has ‖e‖²_Fal(τ) = det(Im τ), and under γ = (A B; C D) ∈ Sp_{2g}(ℤ) the frame transforms by det(Cτ + D)^{−1} while det Im(γτ) = |det(Cτ + D)|^{−2} det Im τ, so the metric descends to the Hodge line on Γ\ℍ_g and on the complex fibre of the fine moduli space A_{g,n}(ℂ), n ≥ 3. The metric is invariant under complex conjugation of the family.

Hypotheses and conventions:

- A → S proper and smooth with abelian fibres (polarizable), S a complex manifold; Γ ⊂ Sp_{2g}(ℤ) the level subgroup.

Construction or proof:

1. Smoothness: locally on S choose a holomorphic frame α of ω̄; ∫_{A_s} α ∧ ᾱ is a fibre integral of a smooth form along a proper submersion, hence smooth in s.
2. Siegel family: covolume-formula gives ‖e‖²(τ) = det Im τ; the automorphy factor of e is A5's det(Cτ + D) convention, and det Im(γτ) = |det(Cτ+D)|^{−2} det Im τ.
3. Descent to the quotient follows because both sides transform by the same factor; at neat level n ≥ 3 the quotient is the complex fibre of A_{g,n} (PELModuli M3).

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/hodge-metric-log-singularities: the metric whose boundary growth is controlled.
- ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height: the metric on the modular line bundle.

API:

| Name | Role | Statement |
|---|---|---|
| `AbelianFamily.faltingsMetric` | constructor | The smooth hermitian metric on ω̄_{A/S} given fibrewise by faltingsNormSq. |
| `AbelianFamily.faltingsMetric_baseChange` | functoriality | For f : S′ → S, f^*‖·‖_Fal is the Faltings metric of A ×_S S′. |
| `SiegelFamily.faltingsMetric_frame` | simp | ‖dz_1 ∧ ⋯ ∧ dz_g‖²(τ) = det Im τ. |
| `SiegelFamily.faltingsMetric_invariant` | characterisation | ‖·‖_Fal is Sp_{2g}(ℤ)-invariant on the Hodge line of the Siegel family. |
| `AbelianFamily.faltingsMetric_conj` | compatibility | Complex conjugation of the family is an isometry for ‖·‖_Fal. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `SiegelFamily.faltingsMetric_g1` | computation | For g = 1 and τ = i, ‖dz‖² = 1; for τ = 2i, ‖dz‖² = 2. |
| `SiegelFamily.faltingsMetric_modular_invariant` | characterisation | For f a weight-12 modular form, ∣f(τ)∣²(Im τ)^{12} is SL₂(ℤ)-invariant: for f = Δ this is the archimedean term of elliptic-period-comparison. |
| `SiegelFamily.faltingsMetric_holomorphic_nonexample` | non-example | The function τ ↦ det(τ) is not the norm of the frame: the norm must be real, positive and Sp-equivariant with the factor ∣det(Cτ+D)∣^{−2}. |
| `AbelianFamily.faltingsMetric_constant` | degenerate | For a constant family A × S → S with a constant frame, the norm is constant. |

Checks:

- For g = 1, the Petersson-type metric ‖e‖² = Im τ on weight-one forms; for a modular form f of weight k, ‖f·e^{⊗k}‖² = |f(τ)|²(Im τ)^k is Γ-invariant.

Depends on (this roadmap): [The Faltings metric on top differential forms](#R352-faltings-hermitian-form), [The Faltings norm is a covolume](#R352-covolume-formula).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A5/siegel-analytic-family`, `PELModuli:M6/hodge-line-bundle`, `PELModuli:M3/siegel-fine-uniformization`, `ComplexComparisonPartII:C0/repair-analytification`.

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.10, p. 31: On the moduli space M the hermitian structure s on ω, its analytic description on the Siegel space with frame e and ⟨e, e⟩ given by det Im Z (Deligne's normalisation), Sp(V)-invariant and characterized up to a factor by invariance.
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Definition 4.1, p. 167: The integration metric is invariant under automorphisms and so defines a hermitian metric for ω on A_g and for L on [A_g] over ℂ.
- Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*, §3.1.3, Lemma 3.4, pp. 43–44 (arXiv v4): On a family over a complex quasi-projective base the Faltings metric on ω_S is a hermitian metric.


<a id="R352-elliptic-period-comparison"></a>
### Elliptic curves: the Faltings height from the discriminant and the periods

*Theorem* · node `R35.2/elliptic-period-comparison` · suggested module `TauCeti/NumberTheory/Arakelov/EllipticHeight`, namespace `TauCeti.EllipticCurve`

Let E be an elliptic curve over a number field K with minimal discriminant ideal Δ_{E/K} (computed from the Néron model at every prime), and for σ ∈ Σ_K choose τ_σ ∈ ℍ with E_σ(ℂ) ≅ ℂ/(ℤ + τ_σℤ). With Mathlib's modular discriminant Δ(τ) = η(τ)^{24} = q∏_{n≥1}(1 − qⁿ)^{24}, q = e^{2πiτ}, the Faltings-normalised degree of the metrized Hodge line satisfies 12·deg^ ω̄̂(E/K) = log N(Δ_{E/K}) − Σ_{σ∈Σ_K} log(|Δ(τ_σ)|·(Im τ_σ)^6) − 12[K:ℚ] log(2π). The archimedean term |Δ(τ)|(Im τ)^6 is SL₂(ℤ)-invariant, so it does not depend on the choice of τ_σ.

Hypotheses and conventions:

- E/K any elliptic curve (semistability not needed for this formula, which computes the Néron-model degree).
- Δ(τ) here is the normalised q-product, without the factor (2π)^{12}; the lattice discriminant g_2³ − 27g_3² of ℤ + τℤ is (2π)^{12}Δ(τ).

Construction or proof:

1. Choose a Weierstrass equation over K with invariant differential ω and discriminant Δ_ω. At each prime 𝔭, ω = u_𝔭 ω_min with Δ_ω = u_𝔭^{−12}Δ_min, so 12·log #(ω̄_𝒜/O_K ω) = log N(Δ_{E/K}) − Σ_𝔭 v_𝔭(Δ_ω) log N𝔭 = log N(Δ_{E/K}) − log |N_{K/ℚ}(Δ_ω)|.
2. At σ: the period lattice of ω is Λ = ω_1(ℤ + τ_σℤ); by covolume-formula ‖ω‖²_σ = |ω_1|² Im τ_σ, and σ(Δ_ω) = ω_1^{−12}(2π)^{12}Δ(τ_σ) by homogeneity of the lattice discriminant; hence |σΔ_ω|·‖ω‖_σ^{12} = (2π)^{12}|Δ(τ_σ)|(Im τ_σ)^6.
3. Sum: 12 deg^ = 12 log #(ω̄/O_K ω) − 12 Σ_σ log ‖ω‖_σ, and Σ_σ log|σΔ_ω| = log|N Δ_ω| cancels.
4. SL₂(ℤ)-invariance from Δ(γτ) = (cτ + d)^{12}Δ(τ) (ModularForm.discriminant_S_invariant, discriminant_T_invariant) and Im(γτ) = Im τ/|cτ + d|².

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/elliptic-j-height-bound: the source of h_Fal(E) ≤ h(j)/12 + C.
- GrossZagierAndArithmeticHeights:GZ.0: the elliptic Hodge metric for the explicit period/height normalisation (RS-06 link R35.2 → GZ.0).

API:

| Name | Role | Statement |
|---|---|---|
| `EllipticCurve.faltingsArchimedeanTerm` | constructor | τ ↦ ∣Δ(τ)∣·(Im τ)^6 on ℍ, SL₂(ℤ)-invariant. |
| `EllipticCurve.faltingsArchimedeanTerm_smul` | simp | faltingsArchimedeanTerm(γτ) = faltingsArchimedeanTerm(τ) for γ ∈ SL₂(ℤ). |
| `EllipticCurve.faltingsHeight_formula` | characterisation | 12[K:ℚ]·h_Fal(E/K) = log N(Δ_{E/K}) − Σ_σ log faltingsArchimedeanTerm(τ_σ) − 12[K:ℚ] log 2π. |
| `EllipticCurve.faltingsArchimedeanTerm_pos` | simp | faltingsArchimedeanTerm(τ) > 0 (Δ has no zeros on ℍ). |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `EllipticCurve.faltingsHeight_11a2` | computation | For 11.a2 over ℚ the formula evaluates to −0.3080098… (agreeing with LMFDB to 10 digits). |
| `EllipticCurve.faltingsArchimedeanTerm_S` | characterisation | faltingsArchimedeanTerm(−1/τ) = faltingsArchimedeanTerm(τ). |
| `EllipticCurve.faltingsHeight_lattice_disc_nonexample` | non-example | Using the lattice discriminant (2π)^{12}Δ(τ) together with the −12 log 2π term double-counts 2π: the two normalisations differ by exactly 12 log 2π. |
| `EllipticCurve.faltingsHeight_basechange` | compatibility | For E with semistable reduction over K and L/K finite, both sides scale by [L:K]. |

Checks:

- For E = 11.a2 over ℚ (Δ_min = −11⁵, τ ≈ ½ + 1.14939i) the formula gives h_Fal(E) = deg^/1 ≈ −0.3080098, LMFDB's value of the Faltings height; in Deligne's normalisation add ½ log π.

Depends on (this roadmap): [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [The Faltings norm is a covolume](#R352-covolume-formula), [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree).

Depends on (libraries and other roadmaps): `ModularForm.discriminant` (Mathlib), `ModularForm.discriminant_eq_q_prod` (Mathlib), `UpperHalfPlane` (Mathlib), Tau Ceti roadmap `TauCetiRoadmap/EllipticCurves#layer-45a-invariant-theory-over-a-dedekind-domain-aec-viii8`.

Sources:

- Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, §7.6, proof of Lemme 7.9, p. 33 (arXiv v1): Quotes Silverman's Proposition 1.1: in the semistable case h_F(E) = (1/12[k:ℚ]) log |N Δ_{E/k}| − (1/12[k:ℚ]) Σ_σ log(|Δ(τ_σ)| y_σ^6), with the archimedean factor through the period τ_σ in Siegel's fundamental domain.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Exemple 1.4, p. 28: For E over ℚ with Néron differential ω, h(E) = −½ log((2π)^{−1}∫|ω ∧ ω̄|), with the lattice Λ, τ = ω_2/ω_1, the q-expansion of j and the integer discriminant Δ = (c_4³ − c_6²)/1728.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, p. 354: Faltings' normalisation of the archimedean metric, used here.


<a id="R352-pairing-metric"></a>
### The hermitian pairing of Ω(A) with Ω(A^t)

*Theorem* · node `R35.2/pairing-metric`

Let A be a complex abelian variety with dual A^t, uniformized as A^t(ℂ) = H¹(A, O_A)/H¹(A, 2πiℤ). The canonical isomorphisms Ω(A^t)^∨ = Lie(A^t) ≅ H¹(A, O_A) ≅ H^{0,1}(A) = Ω̄(A) give a perfect hermitian pairing Ω(A) × Ω(A^t) → ℂ, functorial in the sense (φ^*α, β) = (α, (φ^t)^*β) for φ : B → A. Its determinant metrizes ω̄(A) ⊗ ω̄(A^t), and for α ∈ det Ω(A), β ∈ det Ω(A^t), ‖α‖²·‖β‖² = ‖α ⊗ β‖², where ‖·‖ on ω̄(A) and ω̄(A^t) is Yuan–Zhang's (2π)^{−g}|∫ α ∧ ᾱ| (equivalently Deligne's).

Hypotheses and conventions:

- The dual is normalized with the lattice H¹(A, 2πiℤ); with H¹(A, ℤ) the identity acquires the factor (2π)^{2g}.
- The uniformization of A^t is Appell–Humbert's description of Pic⁰(A) as the conjugate-linear dual of V modulo the dual lattice (AbelianSchemesAndArithmeticModuli A5), rewritten through H¹(A, O_A) ≅ Ω̄(A) and H₁ = Λ, H¹ = Λ^* (A4 realization-conventions).

Construction or proof:

1. Sum the pairing and its conjugate to a perfect pairing H¹(A, ℂ) ⊗ H¹(A^t, ℂ) → ℂ, dual to H₁(A, ℤ) ⊗ H₁(A^t, ℤ) → 2πiℤ.
2. Taking determinants and the Hodge decomposition gives an isomorphism ω(A) ⊗ ω̄(A) ⊗ ω(A^t) ⊗ ω̄(A^t) ≅ ℂ dual to det H_{2g}(A, ℤ) ⊗ det H_{2g}(A^t, ℤ) → (2πi)^{2g}ℤ.
3. Evaluate on generators e_A, e_{A^t} with (e_A, e_{A^t}) = (2πi)^{2g}: the (2π)^{−2g} factors of the two norms combine to ‖α ⊗ β‖².

Uses:

- ArakelovGeometryAndAbelianHeights:R35.4/component-line-height: the metric on N(𝒜, τ).
- PAPER-YUAN-ZHANG-18/pairing-metric: determinant pairing identity.

Checks:

- For an elliptic curve E = A = A^t with the canonical principal polarization, ‖α‖⁴ = ‖α ⊗ α‖² for the self-pairing.

Depends on (this roadmap): [The Faltings metric on top differential forms](#R352-faltings-hermitian-form), [Normalisations of the Faltings metric and height](#R352-normalization-adapter).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization`, `AbelianSchemesAndArithmeticModuli:A5/appell-humbert-and-algebraicity`, `AbelianSchemesAndArithmeticModuli:A4/realization-conventions`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`.

Sources:

- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §2.1, Lemma 2.1 and the preceding construction, pp. 11–12 (arXiv v3): The uniformization A^t(ℂ) = H¹(A, O_A)/H¹(A, 2πiℤ), the perfect hermitian pairing Ω(A) × Ω(A^t) → ℂ, its functoriality, and ‖α‖²·‖β‖² = ‖α ⊗ β‖².


## R35.3. Stable Faltings height

The Faltings height h(A/K) is the normalised Arakelov degree of the Néron-model Hodge line. It is an invariant of the K-isomorphism class, independent of polarizations and of the semi-abelian model when one exists. On field extension it can only drop, by a correction supported at primes of non-semistable reduction; at each such prime the correction is at least (log p)/[K(A[15]):ℚ] (Deligne). The stable height h_st(A) is the value over any field of everywhere semistable reduction; it is additive on products and invariant under duality.

**Named milestones:** [Faltings height](#R353-faltings-height), [Stable Faltings height](#R353-stable-faltings-height).

**Layers of other roadmaps used:** `NeronModelsAndSemistableAbelianVarieties:R11.1`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `ShimuraCompactifications:C4`.

<a id="R353-faltings-height"></a>
### The Faltings height of an abelian variety over a number field

*Definition* · node `R35.3/faltings-height` · suggested module `TauCeti/NumberTheory/Arakelov/FaltingsHeight`, namespace `TauCeti.AbelianVariety`

For an abelian variety A of dimension g over a number field K with Néron model 𝒜 over O_K, the (relative, Faltings-normalised) Faltings height is h(A/K) = deg^ ω̄̂(A/K)/[K:ℚ], the normalised Arakelov degree of the metrized Hodge line. For a smooth model G over O_K with generic fibre A (for instance a semi-abelian model) put h(G) = deg^ ω̄̂(G)/[K:ℚ]. Concretely, for any nonzero α ∈ ω̄_𝒜, h(A/K) = (1/[K:ℚ])·(log #(ω̄_𝒜/O_K α) − ½ Σ_{σ∈Σ_K} log(2^{−g}|∫_{A_σ(ℂ)} α ∧ ᾱ|)). Other normalisations are obtained by normalization-adapter.

Hypotheses and conventions:

- A an abelian variety over a number field K; 𝒜 its Néron model; g = dim A ≥ 0.

Construction or proof:

1. Apply arithmetic-degree to the hermitian line bundle of metrized-hodge-line; the explicit formula is the definition with the Faltings norm of faltings-hermitian-form.

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.1/faltings-modular-height-of-a-semiabelian-model: requested: h(A) = deg(ω_{A/O_K}, Hodge metric)/[K:ℚ].
- AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant: heights of products and discriminant estimates.
- PAPER-YUAN-ZHANG-18/faltings-height: Faltings height with Yuan–Zhang metric.
- PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/faltings-height: Faltings height in the AGHMP metric.

API:

| Name | Role | Statement |
|---|---|---|
| `AbelianVariety.faltingsHeight` | constructor | h(A/K) = deg^ ω̄̂(A/K)/[K:ℚ] in the Faltings normalisation. |
| `GroupScheme.faltingsHeight` | constructor | h(G) for a smooth model with abelian generic fibre. |
| `AbelianVariety.faltingsHeight_eq` | characterisation | h(A/K) = (log #(ω̄_𝒜/O_K α) − ½ Σ_σ log ‖α‖²_{σ,Fal})/[K:ℚ] for any α ≠ 0. |
| `AbelianVariety.faltingsHeight_congr` | extensionality | A ≅ B over K implies h(A/K) = h(B/K). |
| `AbelianVariety.faltingsHeight_rescale` | relation | Replacing the squared metric by c·‖·‖² changes h by −½ log c (Deligne: +(g/2) log π; unscaled: −(g/2) log 2). |
| `AbelianVariety.faltingsHeight_prod` | simp | h((A × B)/K) = h(A/K) + h(B/K). |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `AbelianVariety.faltingsHeight_11a2` | computation | For E = 11.a2 over ℚ (semistable), h(E/ℚ) ≈ −0.3080098. |
| `AbelianVariety.faltingsHeight_dim_zero` | degenerate | For g = 0, h = 0. |
| `AbelianVariety.faltingsHeight_model_nonexample` | non-example | For E : y² + y = x³ (27.a3), computing with the lattice ℤ·dX/(2W) of the non-minimal model W² = X³ + 16 instead of the Néron lattice gives h(E/ℚ) + log 2: the Néron model is essential. |
| `AbelianVariety.faltingsHeight_normalization` | compatibility | For E/ℚ, h_Del(E) = h(E/ℚ) + ½ log π. |

Checks:

- h(A/K) does not depend on α (degree-independent-of-section) and is unchanged under K-isomorphism of A.

Depends on (this roadmap): [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree), [Independence of the section: the product formula](#R351-degree-independent-of-section).

Sources:

- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, p. 354: h(A) = Grad(ω_{A/R})/[K:ℚ] for a semiabelian model over R = O_K with the integration metric.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.2, p. 27: h(A) := deg ω(A)/[k:ℚ] with ω(A)_O from the Néron model; the k = ℚ example h(A) = −½ log((2π)^{−g}∫|α ∧ ᾱ|).
- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §1.1, p. 2 (arXiv v3): h(A) := deg^ ω̄(A)/[K:ℚ] for the identity component of the Néron model.
- Jacob Tsimerman, *The André–Oort conjecture for A_g*, §2.1, p. 3 (arXiv v5): h_Fal(A) = (log |H⁰(Spec O_K, L) : O_K ω| − ½ Σ_σ log ∫ σ(ω ∧ ω̄))/[K:ℚ], independent of K and ω.
- Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, Definition 9.1.4 (arXiv v3): h_Falt(A) as the sum of the finite and archimedean contributions for a section s.
- Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*, §4.3.1, pp. 70–72 (arXiv v4): h_Fal(C) = deg^(ω_{B′}, ‖·‖_Fal)/[K′:ℚ] with finite places weighted by log Nv, real by 1 and complex by 2.


<a id="R353-model-and-polarization-independence"></a>
### The Faltings height is an invariant of the abelian variety

*Theorem* · node `R35.3/model-and-polarization-independence`

(a) If A has semistable reduction everywhere and G is any semi-abelian scheme over O_K with generic fibre A, then G ≅ 𝒜⁰ canonically, so h(G) = h(A/K). (b) h(A/K) depends only on the K-isomorphism class of A; in particular it does not depend on a polarization: for a polarized (A, λ) one sets h(A, λ) := h(A/K). (c) The value does not depend on the nonzero section α of ω̄_𝒜 used to compute it.

Hypotheses and conventions:

- A over a number field K; in (a) semistable reduction at every prime.

Construction or proof:

1. (a) A semi-abelian model is unique up to unique isomorphism (homomorphisms of semi-abelian schemes over the normal base Spec O_K extend uniquely from the generic fibre, ShimuraCompactifications C4 homomorphism-extension); the identity component of the Néron model of a semistable A is semi-abelian (R11.3 semistable-reduction) and so is that model.
2. (b) Néron models are functorial for K-isomorphisms (Néron mapping property), and metrized-hodge-line has an isometry for each isomorphism; nothing in the construction uses a polarization.
3. (c) degree-independent-of-section.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height: the pullback of the universal semi-abelian scheme is the Néron identity component.
- FaltingsFinitenessAndIsogenyTheorems:R28.1: heights of polarized and unpolarized objects agree.

Checks:

- Two different principal polarizations on E × E give the same height; Faltings–Chai note the modular height does not depend on the choice of polarization.

Depends on (this roadmap): [The Faltings height of an abelian variety over a number field](#R353-faltings-height), [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [Independence of the section: the product formula](#R351-degree-independent-of-section).

Depends on (libraries and other roadmaps): `ShimuraCompactifications:C4/roadmap/homomorphism-extension`, `NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property`, `NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence`, `NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-gluing`, `NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction`.

Sources:

- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §2, Lemma 1, p. 350, and §3, p. 354: Unique extension of homomorphisms of semiabelian varieties over a normal base; h(A) is an invariant of the generic fibre.
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 169: The modular height h_mod(A/F) does not depend on the choice of a polarization on A.


<a id="R353-field-extension-comparison"></a>
### Faltings height under finite extension and the bad-place correction

*Theorem* · node `R35.3/field-extension-comparison`

Let A/K be an abelian variety and L/K a finite extension. The Néron mapping property gives an injection of O_L-lattices ω̄_{𝒜_L} ↪ ω̄_𝒜 ⊗_{O_K} O_L inside ω̄(A_L), an isometry at every complex embedding. Hence h(A_L/L) = h(A/K) − c(A, L/K) with c(A, L/K) = log #((ω̄_𝒜 ⊗ O_L)/ω̄_{𝒜_L})/[L:ℚ] ≥ 0. The correction is a sum of local terms supported at the primes of L over which A does not have semistable reduction over K; it vanishes if A has semistable reduction over K, so then h(A_L/L) = h(A/K).

Hypotheses and conventions:

- A/K abelian, L/K finite; 𝒜, 𝒜_L the Néron models over O_K and O_L.

Construction or proof:

1. The Néron mapping property for 𝒜_L applied to the smooth O_L-scheme 𝒜 ⊗ O_L gives a morphism 𝒜 ⊗ O_L → 𝒜_L extending the identity; pulling back invariant differentials gives ω̄_{𝒜_L} → ω̄_𝒜 ⊗ O_L, injective as it is the identity on generic fibres.
2. Metrics agree (metrized-hodge-line). By degree-base-change and degree-additivity, deg^ ω̄_{𝒜_L} = [L:K] deg^ ω̄_𝒜 − log #(quotient); divide by [L:ℚ].
3. Locality: at primes of semistable reduction 𝒜⁰ ⊗ O_{L,w} → 𝒜_L⁰ is an isomorphism (R11.3 semistable-identity-basechange), so the local quotient vanishes; ω̄ only depends on identity components.

Uses:

- PAPER-TSIMERMAN-18/height-field-independence: stable height under field extension.
- ArakelovGeometryAndAbelianHeights:R35.3/bad-place-correction-bound: the size of the local correction at a non-semistable prime.

Checks:

- For E : y² + y = x³ (27.a3), additive at 3, h(E_L/L) < h(E/ℚ) for L/ℚ over which E acquires good reduction, the difference being a positive integer multiple of (log 3)/[L:ℚ].

Depends on (this roadmap): [The Faltings height of an abelian variety over a number field](#R353-faltings-height), [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [Arakelov degree under finite extension](#R351-degree-base-change), [Additivity of the Arakelov degree](#R351-degree-additivity).

Depends on (libraries and other roadmaps): `NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property`, `NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence`, `NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-gluing`, `NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-identity-basechange`.

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.2 (Remarque), p. 27: (A_0)_{O′} maps to (A_{k′})_{O′}, whence h(A) ≥ h_geom(A), with equality if and only if the reduction is semistable.
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 169: The canonical morphism ω_{A/K} → ω_{A/F} ⊗ O_K is an isometry at the archimedean places, so the modular height only decreases on passing to bigger fields and stabilizes once semistability is reached.
- Jacob Tsimerman, *The André–Oort conjecture for A_g*, §2.1, p. 3 (arXiv v5): Independence of K once A has everywhere semistable reduction.


<a id="R353-stable-faltings-height"></a>
### The stable Faltings height

*Definition* · node `R35.3/stable-faltings-height` · suggested module `TauCeti/NumberTheory/Arakelov/FaltingsHeight`, namespace `TauCeti.AbelianVariety`

For an abelian variety A over a number field K choose a finite extension L/K over which A has semistable reduction at every prime (one exists: L = K(A[12]) works, since full level 3 forces semistability away from 3 and full level 4 away from 2). The stable Faltings height is h_st(A) := h(A_L/L). It does not depend on L, is unchanged under base change to any finite extension of K, and depends only on A ⊗_K ℚ̄; hence h_st is a function on isomorphism classes of abelian varieties over ℚ̄ (each defined over some number field).

Hypotheses and conventions:

- A over a number field; semistable reduction is that of NeronModelsAndSemistableAbelianVarieties R11.3.

Construction or proof:

1. Existence of L: R11.3 finite-torsion-semistability applied to A[3] (primes not above 3) and to A[4] (primes not above 2) shows A_{K(A[12])} is semistable everywhere.
2. Independence: for L, L′ both semistable, compare through LL′ with field-extension-comparison (equality in the semistable case).
3. Geometric invariance: if A ⊗ ℚ̄ ≅ B ⊗ ℚ̄, the isomorphism is defined over a finite extension M where both are semistable; then h(A_M) = h(B_M).

Uses:

- AbelianVarietiesIsogenousToNoJacobian:I0/period-height: imaginary periods bounded by the stable Faltings height.
- PAPER-TSIMERMAN-18/stable-faltings-height: the stable Faltings height of CM abelian varieties.
- PAPER-YUAN-26/132: the stable Faltings height of a curve is that of its Jacobian.
- EllipticModularityEffectiveComparisons:EC.5/split-cartan-large-primes: stable Faltings height of elliptic curves at Bilu–Parent–Rebolledo's normalisation.

API:

| Name | Role | Statement |
|---|---|---|
| `AbelianVariety.stableFaltingsHeight` | constructor | h_st(A) = h(A_L/L) for any L over which A is everywhere semistable. |
| `AbelianVariety.stableFaltingsHeight_eq_of_semistable` | simp | h_st(A) = h(A/K) if A is semistable over K. |
| `AbelianVariety.stableFaltingsHeight_baseChange` | simp | h_st(A_L) = h_st(A) for L/K finite. |
| `AbelianVariety.stableFaltingsHeight_le` | relation | h_st(A) ≤ h(A/K). |
| `AbelianVariety.stableFaltingsHeight_congr_geometric` | extensionality | A ⊗ ℚ̄ ≅ B ⊗ ℚ̄ ⇒ h_st(A) = h_st(B). |
| `AbelianVariety.stableFaltingsHeight_twelve` | characterisation | h_st(A) = h(A_{K(A[12])}/K(A[12])). |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `AbelianVariety.stableFaltingsHeight_11a2` | computation | h_st(11.a2) = h(11.a2/ℚ) ≈ −0.3080098 (semistable over ℚ). |
| `AbelianVariety.stableFaltingsHeight_twist` | compatibility | A quadratic twist E^d of E over K has h_st(E^d) = h_st(E), although h(E^d/K) and h(E/K) may differ. |
| `AbelianVariety.stableFaltingsHeight_relative_nonexample` | non-example | For 27.a3 over ℚ, h(E/ℚ) > h_st(E): the relative height of a non-semistable curve is not the stable height. |
| `AbelianVariety.stableFaltingsHeight_dim_zero` | degenerate | h_st of the zero abelian variety is 0. |

Checks:

- h_st(A) = h(A/K) when A is semistable over K (e.g. 11.a2); h_st of a CM elliptic curve with j = 0 is the minimum of h_st over elliptic curves (Deligne, Remarque 1.5).

Depends on (this roadmap): [The Faltings height of an abelian variety over a number field](#R353-faltings-height), [Faltings height under finite extension and the bad-place correction](#R353-field-extension-comparison).

Depends on (libraries and other roadmaps): `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-torsion-semistability`.

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.2 (Remarque), p. 27: If A acquires semistable reduction over k′, the geometric height h_geom(A) := h(A_{k′}).
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 169: The geometric height h_geom(A): the modular height over any field where A has semistable reduction.
- Jacob Tsimerman, *The André–Oort conjecture for A_g*, §2.1, p. 3 (arXiv v5): The stable Faltings height after a field extension giving everywhere semistable reduction, independent of the extension.
- Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*, §4.3.1, pp. 70–72 (arXiv v4): The stable Faltings height h_Fal(C) = h_Fal(J) after a semistable base change K′/K.


<a id="R353-stable-height-properties"></a>
### Products, duals and powers for the stable height

*Theorem* · node `R35.3/stable-height-properties`

For abelian varieties A, B over ℚ̄: h_st(A × B) = h_st(A) + h_st(B); h_st(A^n) = n·h_st(A); h_st(A^t) = h_st(A); h_st(A^4 × (A^t)^4) = 8·h_st(A). For A over a number field K, h(A/K) = h(A^t/K) for the Néron-model heights (Raynaud).

Hypotheses and conventions:

- Duality for the relative height uses Néron models of A and A^t over the same O_K.

Construction or proof:

1. Choose L over which A and B (and A^t) are semistable; Néron models of products are products (product-isometry), giving additivity and powers.
2. Duality: dual-hodge-line (a) gives deg^ ω̄̂(A/K) = deg^ ω̄̂(A^t/K) for every K, in particular over L.
3. Combine for A^4 × (A^t)^4.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.6/zarhin-height-identity: reduction of finiteness and lower bounds to principally polarized varieties.
- AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant: product/normalization laws requested of R35.3.

Checks:

- h_st(E^2) = 2h_st(E) for an elliptic curve; Deligne's Remarque 1.22 uses h(A × B) = h(A) + h(B) and h(A) = h(A*) to reduce lower bounds to principal polarizations.

Depends on (this roadmap): [The stable Faltings height](#R353-stable-faltings-height), [Products: the metrized Hodge line is multiplicative](#R352-product-isometry), [The Hodge lines of A and its dual](#R352-dual-hodge-line), [Additivity of the Arakelov degree](#R351-degree-additivity).

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Remarque 1.22, p. 35: For semistable A with dual A*, h(A) = h(A*); A^4 × A*^4 is principally polarized; h(A × B) = h(A) + h(B).
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 169: The dual abelian variety has the same height; for semistable A the modular height of A^4 × A^{t4} is eight times that of A.
- Michel Raynaud, *Hauteurs et isogénies*, Corollaire 2.1.3, p. 207: deg(ω_A) = deg(ω_{A′}) for Néron models of A and its dual, without semistability.
- Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, §2.3, p. 7 (arXiv v1): h(A_1 × A_2) = h(A_1) + h(A_2) and h(Â) = h(A).


<a id="R353-bad-place-correction-bound"></a>
### Each non-semistable prime contributes at least (log p)/[K′:ℚ]

*Theorem* · node `R35.3/bad-place-correction-bound`

Let A be an abelian variety of dimension g over a number field K and K′ = K(A[15]), so that [K′:K] ≤ #GL_{2g}(ℤ/15ℤ) and A_{K′} has semistable reduction everywhere (full level 3 and 5). Then h(A/K) − h_st(A) = c(A, K′/K) ≥ Σ_p (log p)/[K′:ℚ], the sum over the distinct residue characteristics p of primes of K at which A does not have semistable reduction. Consequently, if c ∈ ℝ is a lower bound for h_st on a class 𝒞 of abelian varieties of dimension g over K, every A ∈ 𝒞 with h(A/K) ≤ t has semistable reduction at every prime whose residue characteristic p satisfies log p > [K′:ℚ](t − c); as [K′:ℚ] ≤ [K:ℚ]·#GL_{2g}(ℤ/15ℤ), the remaining primes form a finite set depending only on (K, g, t, c). The lower bound c = c(g) for all abelian varieties of dimension g is R35.6/faltings-height-lower-bound, and the resulting finite set of bad primes is exported in R35.6/finiteness-inputs-export (c).

Hypotheses and conventions:

- A over K; the consequence is stated for an arbitrary lower bound c on h_st, so this node does not depend on R35.6.

Construction or proof:

1. Semistability over K′: NeronModels R11.3 finite-torsion-semistability with N = 3 and N = 5.
2. At a prime w of K′ over a prime of K where A is not semistable, the base-change morphism 𝒜⁰ ⊗ O_{K′,w} → 𝒜_{K′}⁰ is not an isomorphism (its special fibre has a unipotent part that must be killed), so its map on Lie algebras is not invertible and the local quotient of field-extension-comparison is nonzero; its order is at least N w ≥ p.
3. Hence c(A, K′/K) ≥ (log p)/[K′:ℚ] for each such p.
4. Consequence: h_st(A) ≥ c gives (log p)/[K′:ℚ] ≤ h(A/K) − h_st(A) ≤ t − c, bounding p.

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.1: the finite set of bad places in the descent from moduli points to K-isomorphism classes.
- ArakelovGeometryAndAbelianHeights:R35.6/moduli-point-finiteness: constant dependence on the field degree.

Checks:

- For 27.a3 over ℚ, h(E/ℚ) − h_st(E) ≥ (log 3)/[ℚ(E[15]):ℚ].

Depends on (this roadmap): [Faltings height under finite extension and the bad-place correction](#R353-field-extension-comparison), [The stable Faltings height](#R353-stable-faltings-height).

Depends on (libraries and other roadmaps): `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-torsion-semistability`, `NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction`, `NeronModelsAndSemistableAbelianVarieties:R11.3`.

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Lemme 1.23 and its proof, p. 35: Over k′ of degree at most |GL(2g, ℤ/15)| the variety acquires semistable reduction; the differential of A_0 ⊗ O′ → A′_0 is not invertible at places over non-semistable places, each contributing at least log p/[k′:ℚ] to h(A) − h(A′), which bounds p.


## R35.4. Isogeny variation

For an isogeny u : A → B of degree d, Raynaud's different 𝔡_u of the extension of u to Néron models measures the cokernel of u^* on Hodge lines, and h(B) = h(A) + ½ log d − (1/[K:ℚ]) log #(O_K/𝔡_u); in the semistable case the finite term is the order of the invariant differentials of the quasi-finite flat kernel (Faltings' Lemma 5). Since 𝔡_u𝔡_{u^t} = (d), the change is at most ½ log d in absolute value and has bounded denominators, primes dividing the degree included. Along a tower of ℓ-divisible subgroups the local terms are computed from the dimensions of the ℓ-divisible groups at the places above ℓ, which is what FaltingsFinitenessAndIsogenyTheorems R28.2 combines with Hodge–Tate theory. For O_E-actions the Hodge line splits into τ-components with their own heights and an isogeny formula.

**Named milestones:** [Faltings's isogeny formula](#R354-isogeny-height-formula), [Isogeny height bounds](#R354-isogeny-height-bounds).

**Layers of other roadmaps used:** `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `ShimuraCompactifications:C4`.

<a id="R354-isogeny-different"></a>
### The different of an isogeny of Néron models

*Definition* · node `R35.4/isogeny-different` · suggested module `TauCeti/NumberTheory/Arakelov/IsogenyHeight`, namespace `TauCeti.Isogeny`

Let u_K : A → B be an isogeny of abelian varieties over a number field K, of degree d, and u : 𝒜 → ℬ its extension to Néron models over O_K (Néron mapping property). Then Lie(u) : Lie(𝒜) → Lie(ℬ) is injective and u^* : ω̄_ℬ → ω̄_𝒜 is an injection of invertible O_K-modules; its cokernel is O_K/𝔡_u for a nonzero ideal 𝔡_u, the different of u, generated locally by det Lie(u) in bases. 𝔡_u is supported at the primes where u is not étale, hence at primes dividing d. If u restricted to identity components is surjective (fppf), with kernel ℳ, then ω̄_𝒜 ⊗ ω̄_ℬ^{−1} is the pullback along the unit section of the relative dualizing sheaf of ℳ; when the finite part M of the quasi-finite flat ℳ is finite flat (in particular when A is semistable, by the semi-abelian kernel computation), 𝔡_u is the classical different of the finite O_K-algebra of M and #(O_K/𝔡_u) = #e^*Ω¹_{M/O_K}.

Hypotheses and conventions:

- u_K an isogeny over K; Néron models over the Dedekind base O_K (R11.1).
- The comparison with e^*Ω¹ of the kernel needs the kernel to be flat; for non-semistable A multiplication by p need not even be flat on Néron models.

Construction or proof:

1. u_K étale on the generic fibre, so Lie(u) is injective and ω̄_ℬ → ω̄_𝒜 is injective; define 𝔡_u as the annihilator (equivalently Fitting ideal) of the cokernel; locally it is generated by det Lie(u).
2. Where u is étale on identity components the cokernel vanishes; u is étale at primes not dividing d.
3. Semistable case: the isogeny extends to the semi-abelian identity components (homomorphism extension over the normal base O_K); it is quasi-finite (fibrewise an isogeny of semi-abelian varieties) between schemes smooth over the regular base, hence flat by the fibrewise flatness criterion, with quasi-finite flat kernel (Faltings §4, p. 357).
4. In the flat case, ω_ℳ := e^*(relative dualizing sheaf) of the lci kernel computes ω̄_𝒜 ⊗ ω̄_ℬ^{−1}; localizing and completing at each prime 𝔭 of O_K, the Fitting ideal of e^*Ω¹ of the finite part is the different of its algebra (FiniteFlat R07.1 invariant-differentials-and-absolute-different at primes of mixed characteristic; at primes not dividing d the kernel is étale and contributes nothing).

Uses:

- ArakelovGeometryAndAbelianHeights:R35.4/isogeny-height-formula: the finite term log #(O_K/𝔡_u).
- FaltingsFinitenessAndIsogenyTheorems:R28.2/height-change-under-an-isogeny-of-semiabelian-models: Lemma 5's #s^*(Ω¹_{G/R}).

API:

| Name | Role | Statement |
|---|---|---|
| `Isogeny.different` | constructor | 𝔡_u ⊆ O_K, the Fitting ideal of coker(u^* : ω̄_ℬ → ω̄_𝒜). |
| `Isogeny.different_ne_bot` | simp | 𝔡_u ≠ 0. |
| `Isogeny.different_eq_top_of_etale` | simp | 𝔡_u = O_K at primes where u is étale; in particular at primes not dividing deg u. |
| `Isogeny.different_comp` | functoriality | 𝔡_{v∘u} = 𝔡_u·𝔡_v. |
| `Isogeny.card_quotient_different` | characterisation | #(O_K/𝔡_u) = #(ω̄_𝒜/u^*ω̄_ℬ). |
| `Isogeny.different_eq_kernel_differentials` | compatibility | If u is flat on identity components with finite flat kernel 𝒢, #(O_K/𝔡_u) = #e^*Ω¹_{𝒢/O_K}. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `Isogeny.different_mul_n` | computation | For [n] on an abelian scheme of relative dimension g, 𝔡 = (n^g). |
| `Isogeny.different_id` | degenerate | 𝔡_{id} = O_K. |
| `Isogeny.different_mu_p` | computation | For E over ℤ_p with a subgroup scheme μ_p (ordinary, multiplicative kernel) the quotient isogeny has different (p) at p, while the étale-kernel quotient (ℤ/p) has different (1). |
| `Isogeny.different_nonflat_nonexample` | non-example | For A with additive reduction at p, [p] on the Néron model is not flat, so #(O_K/𝔡) is not the order of e^*Ω¹ of a flat kernel; Raynaud's definition through det Lie(u) is needed. |

Checks:

- For [n] on an abelian scheme of relative dimension g over O_K, 𝔡_{[n]} = (n^g) and #(O_K/𝔡) = n^{g[K:ℚ]}; for an étale isogeny 𝔡_u = O_K.

Depends on (this roadmap): [The Hodge line of a smooth commutative group scheme](#R352-hodge-line-of-group-scheme), [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line).

Depends on (libraries and other roadmaps): `NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property`, `NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence`, `NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-gluing`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/invariant-differentials-and-absolute-different`, `ShimuraCompactifications:C4/roadmap/semi-abelian-scheme`, `ShimuraCompactifications:C4/roadmap/homomorphism-extension`.

Sources:

- Michel Raynaud, *Hauteurs et isogénies*, §1.3, pp. 202–204: For an isogeny extended to Néron models the canonical map ω_B → ω_A is injective; ω_u = ω_A ⊗ ω_B^{−1} = O(𝔡_u^{−1}) with 𝔡_u the different of u, generated by det Lie(u), supported where u is not étale; in the quasi-finite flat case it is the different of the finite part of the kernel.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §4, p. 357: For semiabelian A_1, A_2 and an isogeny φ, φ is flat with quasi-finite flat kernel G, φ^* : ω_{A_2} → ω_{A_1} injective with cokernel s^*(Ω¹_{G/R}).
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §2.2, p. 36: For a quasi-finite flat group scheme H over O, ω(H) ⊗ k ≅ k and, for finite H with complete-intersection algebra, ω(H) = 𝔇_0^{−1} for the inverse different.


<a id="R354-isogeny-height-formula"></a>
### Faltings' isogeny formula

*Theorem* · node `R35.4/isogeny-height-formula`

Let u_K : A → B be an isogeny of degree d of abelian varieties over a number field K. Then h(B/K) = h(A/K) + ½ log d − (1/[K:ℚ]) log #(O_K/𝔡_u). If A (equivalently B) has semistable reduction, u extends to semi-abelian models with quasi-finite flat kernel 𝒢 and h(B/K) = h(A/K) + ½ log d − (1/[K:ℚ]) log #e^*Ω¹_{𝒢/O_K}; the same formula holds for the stable heights h_st after any extension making A semistable.

Hypotheses and conventions:

- u_K an isogeny over K of degree d; heights in Faltings' normalisation (the formula is normalisation-independent since both sides shift by the same constant).

Construction or proof:

1. The section 1 of ω̄_𝒜 ⊗ ω̄_ℬ^{−1} given by u^* has finite part log #(O_K/𝔡_u) (isogeny-different).
2. At each complex embedding its norm is d^{1/2} (isogeny-pullback-norm), contributing −½[K:ℚ] log d.
3. So deg^ ω̄̂(A) − deg^ ω̄̂(B) = −½[K:ℚ] log d + log #(O_K/𝔡_u) (degree-additivity); divide by [K:ℚ].
4. Semistable case: isogeny-different identifies the finite term with the kernel's differentials; semistability is preserved by isogeny (R11.3 semistability-isogeny).

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.2/height-change-under-an-isogeny-of-semiabelian-models: Lemma 5 as requested of R35.4.
- FaltingsFinitenessAndIsogenyTheorems:R28.3/corrected-satz-2-stationarity-of-heights-along-an-l-divisible-tower: heights along an ℓ-divisible tower.
- AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant: height variation in an isogeny class.

Checks:

- Multiplication by n: d = n^{2g}, #(O_K/𝔡) = n^{g[K:ℚ]}, so h(A) = h(A) + g log n − g log n, consistent; an étale isogeny of degree d raises the height by ½ log d.

Depends on (this roadmap): [The different of an isogeny of Néron models](#R354-isogeny-different), [Faltings norms along isogenies](#R352-isogeny-pullback-norm), [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [The Faltings height of an abelian variety over a number field](#R353-faltings-height), [Additivity of the Arakelov degree](#R351-degree-additivity).

Depends on (libraries and other roadmaps): `NeronModelsAndSemistableAbelianVarieties:R11.3/semistability-isogeny`.

Sources:

- Michel Raynaud, *Hauteurs et isogénies*, Proposition 1.4.1, pp. 204–205: deg(ω_A) − deg(ω_B) = deg(ω_u) = −Log(d)[K:ℚ]/2 + Log #(O/𝔡_u).
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §4, Lemma 5, p. 358: h(A_2) = h(A_1) + ½ log Grad(φ) − [K:ℚ]^{−1} log #s^*(Ω¹_{G/R}) for semiabelian A_1 → A_2.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §2.1, (2.1.1), p. 36: For A semistable and u : A → B with kernel H closed in the connected Néron model, h(B) = h(A) − deg ω(H_0)/[k:ℚ] with ω(H) carrying #H times the standard metric.


<a id="R354-dual-isogeny-differents"></a>
### Differents of an isogeny and of its dual

*Theorem* · node `R35.4/dual-isogeny-differents`

For an isogeny u_K : A → B of degree d over a number field K with dual u_K^t : B^t → A^t, extended to Néron models, the differents satisfy 𝔡_u·𝔡_{u^t} = (d). Consequently log #(O_K/𝔡_u) + log #(O_K/𝔡_{u^t}) = [K:ℚ] log d, and h(B) − h(A) = h(B^t) − h(A^t): the height changes along u : A → B and along u^t : B^t → A^t are opposite, consistently with h(A^t) = h(A) and h(B^t) = h(B). In the finite flat case this is the local identity length ω_𝒢 + length ω_{𝒢^D} = v(#𝒢) for a finite flat group 𝒢 and its Cartier dual over a complete DVR of mixed characteristic, the kernel of u^t being the Cartier dual of the kernel of u.

Hypotheses and conventions:

- Néron models over O_K; no semistability assumption.

Construction or proof:

1. Reduce to a complete local base with algebraically closed residue field.
2. In the good-reduction case u and u^t are isogenies of abelian schemes, finite flat with Cartier-dual kernels (AbelianSchemesAndArithmeticModuli A3 dual-isogeny-and-cartier-kernel), and the identity is the product formula 𝔇(𝒢)𝔇(𝒢^D) = (#𝒢) for a finite flat group and its dual: FiniteFlat R07.1 raynaud-determinant-tame-different proves it when e ≤ p − 1 for groups killed by p, and the general case is requested from R07.1.
3. In general Raynaud computes with the pro-algebraic structure of the cohomology of Néron models (Greenberg functor) to reach the same identity.
4. The height identity follows by adding the isogeny formulas for u and u^t: with x = log #(O_K/𝔡_u)/[K:ℚ] and y = log #(O_K/𝔡_{u^t})/[K:ℚ], h(B) − h(A) = ½ log d − x and h(A^t) − h(B^t) = ½ log d − y, whose sum is log d − (x + y) = 0.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.2/dual-hodge-line: self-dual case.
- PAPER-YUAN-ZHANG-18/rev-kernel-of-the-dual-isogeny: the kernel of the dual isogeny is the Cartier dual of the kernel (supplied by A3).

Checks:

- For a self-dual isogeny (a polarization of degree d), 𝔡_u² = (d).

Depends on (this roadmap): [The different of an isogeny of Néron models](#R354-isogeny-different).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-determinant-tame-different`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/invariant-differentials-and-absolute-different`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources:

- Michel Raynaud, *Hauteurs et isogénies*, Théorème 2.1.1 and Remarque 2.1.2, p. 207: 𝔡_u 𝔡_{u′} = (d) for an isogeny and its dual extended to Néron models; in the good-reduction case it follows from the duality of the finite flat kernels.
- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, Erratum appended to arXiv v3, §2.1 (November 2021): The comparison of τ-parts of the Hodge lines of an isogeny and its dual through p-divisible groups and Cartier duality of kernels.


<a id="R354-isogeny-height-bounds"></a>
### Bounds and denominators for heights along isogenies

*Theorem* · node `R35.4/isogeny-height-bounds`

In the situation of isogeny-height-formula: (i) |h(B/K) − h(A/K)| ≤ ½ log d, and the same for stable heights; (ii) if d = p^n for a prime p, then h(A/K) − h(B/K) = (m/(2[K:ℚ]))·log p with m ∈ ℤ, |m| ≤ [K:ℚ]·n; (iii) exp(2[K:ℚ](h(B) − h(A))) = d^{[K:ℚ]}·#(O_K/𝔡_u)^{−2} is a rational number with |v_p(·)| ≤ [K:ℚ]·v_p(d) for every prime p, so only primes dividing d occur (this sharpens the exponent bound of Faltings' remark); (iv) for elliptic curves E, E′ over a number field related by an isogeny of degree δ, |h_st(E) − h_st(E′)| ≤ ½ log δ, in particular ≤ ½ log p for a cyclic p-isogeny, primes dividing p included.

Hypotheses and conventions:

- u of degree d over K; (iv) uses (i) for stable heights after a common semistable extension.

Construction or proof:

1. By dual-isogeny-differents, 𝔡_u divides (d), so 0 ≤ log #(O_K/𝔡_u) ≤ [K:ℚ] log d; insert in the formula to get (i).
2. (ii) For d = p^n, #(O_K/𝔡_u) = p^k with 0 ≤ k ≤ [K:ℚ]n; then h(A) − h(B) = ((2k − [K:ℚ]n)/(2[K:ℚ])) log p.
3. (iii) Rearrange the formula; since (d) ⊆ 𝔡_u, the p-part of #(O_K/𝔡_u) is p^k with 0 ≤ k ≤ [K:ℚ]v_p(d), so v_p of d^{[K:ℚ]}#(O_K/𝔡_u)^{−2} lies in [−[K:ℚ]v_p(d), [K:ℚ]v_p(d)].
4. (iv) is (i) with g = 1 for stable heights.

Uses:

- EllipticModularityEffectiveComparisons:EC.5/split-cartan-large-primes: requested |h_F(E) − h_F(E_1)| ≤ (log p)/2 for a cyclic p-isogeny.
- AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant: requested precise isogeny variation inequality including primes dividing the degree.
- FaltingsFinitenessAndIsogenyTheorems:R28.5/bounded-small-prime-parts-of-height-differences-in-an-isogeny-class: the bounded denominators of (iii).

Checks:

- Bilu–Parent–Rebolledo's Proposition 4.4(i): |h_F(E) − h_F(E′)| ≤ ½ log δ; Gaudron–Rémond recall h(A′) ≤ h(A) + ½ log deg φ in every normalisation.

Depends on (this roadmap): [Faltings' isogeny formula](#R354-isogeny-height-formula), [Differents of an isogeny and of its dual](#R354-dual-isogeny-differents), [The stable Faltings height](#R353-stable-faltings-height).

Sources:

- Michel Raynaud, *Hauteurs et isogénies*, Corollaire 2.1.4, p. 207: (1) |deg ω_A − deg ω_B| ≤ ½[K:ℚ] log d; (2) for d = p^n, deg ω_A − deg ω_B = (m/2) log p with |m| ≤ [K:ℚ]n.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §4, Bemerkung after Lemma 5, p. 358: exp(2[K:ℚ](h(A_2) − h(A_1))) is rational with only primes dividing the degree, its exponents bounded in terms of those of the degree.
- Yuri Bilu, Pierre Parent and Marusia Rebolledo, *Rational points on X_0^+(p^r)*, Proposition 4.4(i), p. 971: |h_F(E) − h_F(E′)| ≤ ½ log δ for elliptic curves connected by an isogeny of degree δ, attributed to Faltings' Lemma 5.
- Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, §2.3, p. 7 (arXiv v1): h(A′) ≤ h(A) + ½ log deg φ for every normalisation.


<a id="R354-p-divisible-tower-height"></a>
### Heights along a tower of p-divisible subgroups

*Theorem* · node `R35.4/p-divisible-tower-height`

Let A be an abelian variety with semistable reduction over a number field K, ℓ a prime, and G ⊂ A[ℓ^∞] a K-rational ℓ-divisible subgroup of height h_G such that, for every prime v of K over ℓ, the schematic closure of G in the ℓ-divisible group of the semi-abelian model over O_{K_v} is an ℓ-divisible group Γ_v of dimension d_v. Put G_n = G[ℓ^n] and A_n = A/G_n. Then e^*Ω¹ of the closure of G_n has length n·e_v·d_v over O_{K_v} at v | ℓ and vanishes at v ∤ ℓ, so h(A_n) = h(A) + n·log ℓ·(h_G/2 − (1/[K:ℚ]) Σ_{v|ℓ} [K_v:ℚ_ℓ]·d_v). Without the ℓ-divisibility hypothesis on the closures, the formula holds for n ≥ n_0 after replacing A by A_{n_0} (the closures become ℓ-divisible after a shift).

Hypotheses and conventions:

- A semistable over K; G an ℓ-divisible subgroup over K; the closure hypothesis at the primes over ℓ.
- The global determinant argument that evaluates Σ_v [K_v:ℚ_ℓ] d_v (through Hodge–Tate weights) is FaltingsFinitenessAndIsogenyTheorems R28.2; this node supplies only the local terms.

Construction or proof:

1. The kernel of A → A_n on semi-abelian models is the closure 𝒢_n of G_n, quasi-finite flat; at v ∤ ℓ it is étale so it contributes nothing.
2. At v | ℓ, 𝒢_n = Γ_v[ℓ^n] and length ω_{Γ_v[ℓ^n]} = n e_v d_v (FiniteFlat R07.1 invariant-differentials-and-absolute-different); log #e^*Ω¹ = Σ_{v|ℓ} n e_v d_v f_v log ℓ = n log ℓ Σ_v [K_v:ℚ_ℓ] d_v.
3. Insert in isogeny-height-formula with d = ℓ^{n h_G}.
4. The shift: closures of generic ℓ-divisible subgroups become ℓ-divisible after finitely many steps (FiniteFlat R07.1 closure-of-generic-p-divisible-subgroups), which is the correction to Faltings' Satz 2 in his erratum.

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.2: the local terms of the l-divisible isogeny tower; R28.2 proves Σ_v [K_v:ℚ_ℓ] d_v = [K:ℚ]h/2 globally.
- FaltingsFinitenessAndIsogenyTheorems:R28.3/corrected-satz-2-stationarity-of-heights-along-an-l-divisible-tower: stationarity of h(A_n).

Checks:

- For G = A[ℓ^∞] itself with good reduction at the primes above ℓ (h_G = 2g, d_v = g), h(A_n) = h(A) + n log ℓ·(g − g) = h(A), consistent with A/A[ℓ^n] ≅ A.

Depends on (this roadmap): [Faltings' isogeny formula](#R354-isogeny-height-formula).

Depends on (libraries and other roadmaps): `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/invariant-differentials-and-absolute-different`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/closure-of-generic-p-divisible-subgroups`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`.

Sources:

- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §4, p. 359, the height formula: h(A_n) − h(A) computed from the dimensions d_i of the ℓ-divisible groups at the places above ℓ (valid after the shift of the erratum).
- Michel Raynaud, *Hauteurs et isogénies*, §§4.1–4.3, pp. 219–228: The determinant of the kernel of a 'belle' p-isogeny and the invariance of the Arakelov degree along such isogenies, the computations behind the tower formula.


<a id="R354-component-line-height"></a>
### τ-components of the Hodge line under an O_E-action

*Construction* · node `R35.4/component-line-height` · suggested module `TauCeti/NumberTheory/Arakelov/ComponentHeight`, namespace `TauCeti.AbelianVariety`

Let E be a number field acting on an abelian variety A over a number field K ⊇ the normal closure of E, through O_E → End(𝒜) on the semi-abelian identity component 𝒜 of the Néron model (A semistable), with the dual action γ ↦ γ^t on A^t. For an embedding τ : E → K let W(𝒜, τ) = Ω(𝒜) ⊗_{O_K ⊗ O_E, 1⊗τ} O_K, and N(𝒜, τ) = det W(𝒜, τ) ⊗ det W(𝒜^t, τ^c), where c is the CM involution of E (trivial if E is totally real). At each complex embedding, the perfect hermitian pairing Ω(A_σ) × Ω(A^t_σ) → ℂ (pairing-metric) is an orthogonal sum of pairings between W(A_σ, τ) and W(A^t_σ, τ^c), which metrizes N(𝒜, τ). The τ-part of the Faltings height is h(A, τ) = deg^ N̄(𝒜, τ)/(2[K:ℚ]) (in Yuan–Zhang's (2π)^{−g} normalisation of pairing-metric).

Hypotheses and conventions:

- A semistable over K with O_E ⊂ End(A); K contains the Galois closure of E; E is totally real or CM when the CM involution is used.
- W(𝒜, τ) need not be locally free at primes ramified in E; its determinant is then taken of the torsion-free quotient, and isogeny comparisons assume local freeness.

Construction or proof:

1. The O_E-action on A extends to the Néron model, hence to its identity component, by the Néron mapping property; the dual action on A^t is γ ↦ γ^t.
2. Ω(A) ⊗ K decomposes under E ⊗ K = ∏_τ K into the eigenquotients W(A, τ); integrally W(𝒜, τ) is the τ-quotient.
3. pairing-metric's pairing is E-equivariant (γ on A pairs with γ^t on A^t), so it pairs W(A, τ) with W(A^t, τ^c) and is an orthogonal sum.
4. Determinants give the hermitian line bundle N̄(𝒜, τ); its degree defines h(A, τ).

Uses:

- ComplexMultiplicationAndExplicitReciprocityPartII (proposed): h(Φ, τ) and the averaged Colmez decomposition import this component height.
- PAPER-YUAN-ZHANG-18/component-line: embedding component line and height.

API:

| Name | Role | Statement |
|---|---|---|
| `AbelianVariety.componentQuotient` | constructor | W(𝒜, τ) = Ω(𝒜) ⊗_{O_K ⊗ O_E, τ} O_K. |
| `AbelianVariety.componentLine` | constructor | N̄(𝒜, τ) = det W(𝒜, τ) ⊗ det W(𝒜^t, τ^c) with the pairing metric. |
| `AbelianVariety.componentHeight` | constructor | h(A, τ) = deg^ N̄(𝒜, τ)/(2[K:ℚ]). |
| `AbelianVariety.componentHeight_baseChange` | simp | h(A_L, τ) = h(A, τ) for L/K finite (semistable A). |
| `AbelianVariety.componentPairing_orthogonal` | relation | The pairing of pairing-metric is the orthogonal sum over τ of pairings W(A, τ) × W(A^t, τ^c) → ℂ. |
| `AbelianVariety.componentLine_trivial_action` | compatibility | For E = ℚ, N̄(𝒜, id) = ω̄̂(A) ⊗ ω̄̂(A^t) with the Yuan–Zhang ((2π)^{−g}) metrics, and h(A, id) = (h_YZ(A) + h_YZ(A^t))/2 = h_YZ(A) = h_Del(A). |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `AbelianVariety.componentHeight_Q` | degenerate | For E = ℚ, h(A, id) = h_YZ(A). |
| `AbelianVariety.componentQuotient_rank` | computation | For an elliptic curve with CM by O_E of type {τ}, W(𝒜, τ) has rank 1 and W(𝒜, τ^c) = 0. |
| `AbelianVariety.componentHeight_torsion_nonexample` | non-example | At a prime ramified in E the raw quotient W(𝒜, τ) can have torsion; taking det of the raw module without the torsion-free convention changes the degree. |
| `AbelianVariety.componentHeight_sum` | characterisation | When every W is locally free and O_K ⊗ O_E ≅ ∏_τ O_K at all primes, Σ_τ h(A, τ) = h(A) for the Yuan–Zhang normalisation. |

Checks:

- Σ_τ deg^ N̄(𝒜, τ) differs from deg^ ω̄̂(A) + deg^ ω̄̂(A^t) by the discriminant-type correction of the τ-decomposition, which vanishes when all W(𝒜, τ) are locally free and O_K ⊗ O_E → ∏ O_K is an isomorphism at every prime.

Depends on (this roadmap): [The hermitian pairing of Ω(A) with Ω(A^t)](#R352-pairing-metric), [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [The Hodge line of a smooth commutative group scheme](#R352-hodge-line-of-group-scheme), [The Arakelov degree of a hermitian bundle](#R351-arithmetic-degree).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A6/coefficient-hom-and-units`, `NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property`.

Sources:

- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §2.1–2.2, pp. 11–13 (arXiv v3): The τ-eigen quotients W(A, τ), the decomposition of the pairing between Ω(A) and Ω(A^t) into pairings of W(A, τ) and W(A^t, τ^c), the line bundles N(A, τ) and h(A, τ) = deg^ N(A, τ)/(2[K:ℚ]).


<a id="R354-component-isogeny-formula"></a>
### τ-component heights along O_E-isogenies

*Theorem* · node `R35.4/component-isogeny-formula`

In the setting of component-line-height, let f : 𝒳 → 𝒴 be an O_E-linear isogeny of abelian schemes over O_K (good reduction) with dual f^t : 𝒴^t → 𝒳^t. Assume the τ-quotients of Ω(𝒳), Ω(𝒴) and the τ^c-quotients of Ω(𝒳^t), Ω(𝒴^t) are locally free O_K-modules. Then the archimedean parts of the comparison map N̄(𝒴, τ) → N̄(𝒳, τ) are isometries and h(X, τ) − h(Y, τ) = (1/(2[K:ℚ]))·(log #coker(f^* : W(𝒴, τ) → W(𝒳, τ)) − log #coker(f^{t*} : W(𝒳^t, τ^c) → W(𝒴^t, τ^c))). In particular h(X, τ) = h(Y, τ) whenever, at every finite place, the τ-length of Ω(ker f) equals the τ^c-length of Ω(ker f^t) = Ω((ker f)^D); this holds when ker f is O_E-isomorphic to its Cartier dual with conjugation-invariant O_E-action.

Hypotheses and conventions:

- Local freeness of the four τ-quotients is a hypothesis: at primes ramified in E (or F) the raw quotients can have torsion, and the length count must then be redone with a determinant convention.

Construction or proof:

1. f^* and f^{t*} induce a rational map φ = det f^* ⊗ (det f^{t*})^{−1} : N(𝒴, τ) → N(𝒳, τ).
2. Archimedean: the pairing of pairing-metric is functorial ((φ^*α, β) = (α, φ^{t*}β)), so φ is an isometry at every complex embedding.
3. Finite: under local freeness the cokernel of det f^* on W(·, τ) has the length of the cokernel of f^*, and likewise for f^{t*}; the degree difference is the difference of logarithms of the orders.
4. Self-dual kernels: ker f^t ≅ (ker f)^D O_E-linearly (A3 dual-isogeny-and-cartier-kernel), and the τ- and τ^c-lengths match under the hypotheses.

Uses:

- PAPER-YUAN-ZHANG-18/selfdual-height: local self-dual kernel height invariance (erratum Proposition 6), whose ramified-prime determinant convention remains with the CM Part II design.

Checks:

- For E = ℚ the formula reduces to the difference of the isogeny formulas for f and f^t, consistent with dual-isogeny-differents.

Depends on (this roadmap): [τ-components of the Hodge line under an O_E-action](#R354-component-line-height), [The hermitian pairing of Ω(A) with Ω(A^t)](#R352-pairing-metric), [Additivity of the Arakelov degree](#R351-degree-additivity).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/invariant-differentials-and-absolute-different`.

Sources:

- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §2.2, proof of Theorem 2.2, pp. 12–13 (arXiv v3): The rational map ϕ : N(B, τ) → N(A, τ) induced by a dual pair of O_E-isogenies, its isometry at archimedean places by functoriality of the pairing, and the reduction of the finite places to p-divisible groups.
- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, Erratum appended to arXiv v3, §2.1 (November 2021): The same rational map for an O_E-isogeny with kernel trivial at the primes of O_F unramified in O_E, reduced to ℘-divisible groups at ramified primes.


<a id="R354-cm-hodge-filtration-local"></a>
### The Hodge filtration of a CM abelian scheme over a p-adic ring

*Theorem* · node `R35.4/cm-hodge-filtration-local`

Let A have CM by O_E of type Φ ⊂ Hom(E, K) with good reduction over the completion O_σ of O_K at a finite place σ over p, model 𝒜_σ, and assume K is large enough that O_E ⊗_ℤ O_σ = O_σ[x] for an element x (monogenic). Let P(t) = ∏_{ρ ∈ Hom(E,K)} (t − x_ρ), P_Φ = ∏_{τ∈Φ}(t − x_τ), P_{Φ^c} = ∏_{τ∈Φ^c}(t − x_τ). Then, with x acting as t, the Hodge–de Rham sequence 0 → Ω(𝒜_σ) → H¹_dR(𝒜_σ/O_σ) → H¹(𝒜_σ, O) → 0 is isomorphic as a sequence of O_σ ⊗ O_E-modules to 0 → O_σ[t]/P_Φ → O_σ[t]/P → O_σ[t]/P_{Φ^c} → 0 (first map multiplication by P_{Φ^c}); in particular Ω(𝒜_σ) ≅ O_σ[t]/P_Φ, and the decomposition map Ω(𝒜_σ) → ⊕_{τ∈Φ} O_σ has determinant generating √(Δ(Φ)) with Δ(Φ) = ∏_{i<j}(x_{τ_i} − x_{τ_j})².

Hypotheses and conventions:

- Monogenicity of O_E ⊗ O_σ is a hypothesis (it may require enlarging K).
- H¹_dR(𝒜_σ) is free of rank one over O_σ ⊗ O_E (Colmez, Lemme II.1.2, as cited by Yuan–Zhang); this freeness is an imported input recorded as gap G4.

Construction or proof:

1. The Hodge–de Rham sequence of the abelian scheme 𝒜_σ (AbelianSchemesAndArithmeticModuli A4 abelian-h1-de-rham) is O_E-equivariant, and H¹_dR(𝒜_σ) ≅ O_σ[t]/P as O_σ ⊗ O_E-modules (free of rank one, gap G4).
2. Exactness of the polynomial sequence: Gauss's lemma for divisibility by P_{Φ^c} in O_σ[t].
3. The isomorphism of the middle terms carries the Hodge filtration to the unique saturated submodule of CM type Φ.
4. The determinant of t ↦ (x_τ)_{τ∈Φ} in the basis 1, t, …, t^{g−1} is a Vandermonde determinant.

Uses:

- ComplexMultiplicationAndExplicitReciprocityPartII (proposed): the decomposition h(Φ) − Σ_τ h(Φ, τ) = −(1/4[E_Φ:ℚ]) log(d_Φ d_{Φ^c}).
- PAPER-YUAN-ZHANG-18/hodge-polynomial-sequence: local Hodge polynomial sequence.
- PAPER-YUAN-ZHANG-18/hodge-polynomial-quotient: local invariant differentials quotient.

Checks:

- For E imaginary quadratic and p split, Ω(𝒜_σ) ≅ O_σ with x acting by x_τ, and Δ(Φ) = 1.

Depends on (this roadmap): [τ-components of the Hodge line under an O_E-action](#R354-component-line-height).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A4/abelian-h1-de-rham`.

Sources:

- Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §2.2, Lemma 2.4 and Corollary 2.5, pp. 15–16 (arXiv v3): The Hodge–de Rham sequence of a CM abelian scheme over O_σ is isomorphic to the polynomial sequence with P_Φ and P_{Φ^c}; Ω ≅ O_σ[t]/P_Φ and the Vandermonde computation of det φ_σ.


## R35.5. Moduli and theta-height comparison

Metrics with logarithmic singularities along a boundary still give heights with a lower bound and the Northcott property, because they differ from continuous metrics by O(log h) (Faltings–Chai V.4.4). The Faltings metric on the Hodge line of the Siegel moduli space has such singularities (Faltings–Chai V.4.5, Deligne 1.11 and 1.18), so the ample line bundle L on the minimal compactification A_g^* over ℤ, with π^*L = ω̄^{⊗m}, gives a modular height h_{L̄}. For a principally polarized A the moduli point satisfies h_{L̄}(x_A) = m·h_st(A): the point extends through an integral toroidal compactification, the universal semi-abelian scheme pulls back to the semi-abelian model of A, and the metrics agree. This gives Northcott and a lower bound for h_st of principally polarized varieties. The layer also states the theta height and Pazuki's explicit comparison with the stable Faltings height, and the elliptic bound h_st(E) ≤ h(j)/12 + 3 used by Bilu–Parent–Rebolledo.

**Named milestones:** [Metric with logarithmic singularities](#R355-log-singular-metric), [Heights for log-singular metrics](#R355-log-singular-heights), [Logarithmic growth of the Faltings metric](#R355-hodge-metric-log-singularities), [Metrized modular line bundle](#R355-siegel-modular-line-bundle), [Modular height equals Faltings height](#R355-modular-height-equals-faltings-height), [Theta height comparison](#R355-theta-faltings-comparison).

**Layers of other roadmaps used:** `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A5`, `ComplexComparisonPartII:C0`, `HeightsRationalPointsAndObstructions:RP.0`, `PELModuli:M3`, `PELModuli:M6`, `SchemeAndStackFoundations:SF.4`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`.

<a id="R355-log-singular-metric"></a>
### Hermitian metrics with logarithmic singularities

*Definition* · node `R35.5/log-singular-metric` · suggested module `TauCeti/Analysis/Complex/LogSingularMetric`, namespace `TauCeti.HermitianMetric`

Let X̄ be a compact complex analytic variety, Z ⊂ X̄ a closed analytic subvariety and U = X̄ ∖ Z, and let L be a holomorphic line bundle on X̄ with a continuous hermitian metric ‖·‖ on L|_U. The metric has logarithmic singularities along Z if every z ∈ Z has a neighbourhood N, a local generator s of L on N and local generators f_1, …, f_t of the ideal of Z on N, with constants C, n > 0, such that for x ∈ N ∖ Z: max(‖s(x)‖, ‖s(x)‖^{−1}) ≤ C·(1 + |log max_i |f_i(x)||)^n. Equivalently (Deligne) ‖·‖ is bounded above and below by ‖·‖₀·ρ^{±r} for a continuous metric ‖·‖₀ on L over X̄ and a logarithmic distance function ρ ≍ −log Σ|f_i|² to Z. The condition does not depend on the choice of compactification, is preserved under pullback, and can be checked after a proper birational modification (Faltings–Chai Remark 4.3).

Hypotheses and conventions:

- X̄ compact (the analytification of a proper ℂ-scheme, ComplexComparisonPartII C0); the bound is local near Z only.
- Metrics are F_∞-invariant when X̄ comes from a scheme over ℝ or ℚ.

Construction or proof:

1. The two formulations agree because log Σ|f_i|² and log max|f_i| differ by a bounded amount and any two continuous metrics on L over compact X̄ have bounded ratio.
2. Independence of the generators f_i: two systems of generators satisfy |f′| ≤ C|f|^a and conversely, so the logarithms are comparable.
3. Pullback: along g : Ȳ → X̄ with g^{−1}(Z) ⊂ Z′, local equations pull back to functions vanishing on g^{−1}(Z), and log of a holomorphic function vanishing on a subvariety is dominated by log of its ideal generators (Łojasiewicz).
4. Birational check: for a proper modification π : X̃ → X̄ isomorphic over U the sup over fibres is controlled (Faltings–Chai leave this as an exercise; Faltings states it with a resolution Φ).

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/log-singular-heights: the class of metrics for which Northcott holds.
- FaltingsFinitenessAndIsogenyTheorems:R28.1/metric-with-logarithmic-singularities-along-a-closed-subvariety: moved down: the R28.1 definition node is planned here.

API:

| Name | Role | Statement |
|---|---|---|
| `HermitianMetric.HasLogSingularities` | constructor | The predicate on a continuous metric on L∣_U along Z = X̄ ∖ U. |
| `HermitianMetric.hasLogSingularities_iff_distance` | characterisation | Equivalent to ‖·‖₀ρ^{−r} ≤ ‖·‖ ≤ ‖·‖₀ρ^r near Z for a logarithmic distance ρ. |
| `HermitianMetric.hasLogSingularities_pullback` | functoriality | Preserved under pullback along morphisms g with g^{−1}(Z) contained in the new boundary. |
| `HermitianMetric.hasLogSingularities_of_modification` | characterisation | Can be checked after a proper modification isomorphic over U. |
| `HermitianMetric.hasLogSingularities_tensor` | simp | Closed under tensor products and duals. |
| `HermitianMetric.hasLogSingularities_of_continuous` | compatibility | A continuous metric on L over all of X̄ has logarithmic singularities along every Z. |
| `HermitianMetric.LogSingularAtZero` | characterisation | One-variable local model: a positive frame norm f on a punctured disc has a logarithmic singularity at 0 iff max(f, f^{−1}) ≤ C(1 + ∣log∣q∣∣)^n near 0. |
| `HermitianMetric.LogSingularAtZero.pow` | simp | The local model is stable under positive integer powers. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `HermitianMetric.logSing_cusp` | computation | On the disc with coordinate q and L trivial, ‖1‖ = −log∣q∣ near 0 has logarithmic singularities along q = 0. |
| `HermitianMetric.logSing_polynomial_nonexample` | non-example | ‖1‖ = ∣q∣^{−1/2} does not have logarithmic singularities along q = 0 (it grows faster than any power of log). |
| `HermitianMetric.logSing_empty_boundary` | degenerate | With Z = ∅ every continuous metric qualifies. |
| `HermitianMetric.logSing_power` | characterisation | If ‖·‖ has logarithmic singularities so does ‖·‖^k on L^{⊗k} for k ∈ ℤ. |

Checks:

- The metric ‖dz‖² = Im τ on the Hodge line over the j-line near the cusp q = 0: Im τ = −(1/2π) log|q|, so it has logarithmic singularities along q = 0.

Depends on (libraries and other roadmaps): `ComplexComparisonPartII:C0/repair-analytification`, `SchemeAndStackFoundations:SF.4`, `UpperHalfPlane` (Mathlib).

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Definition 4.2 and Remark 4.3, p. 167: Logarithmic singularity of a continuous hermitian metric near a closed analytic subvariety, with local generators of the ideal; invariance under pullbacks and checkability on proper birational modifications.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, p. 30, the definitions following Rappel 1.8: Logarithmic distance functions to Y and hermitian structures s with logarithmic singularities, s ≍ s₀ρ^{±r}.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, Definition, p. 355: Metrics with logarithmic singularities through a proper dominant Φ from a smooth variety with normal-crossings preimage of Y; the bound is local near Φ^{−1}(Y).


<a id="R355-log-singular-heights"></a>
### Heights for metrics with logarithmic singularities

*Theorem* · node `R35.5/log-singular-heights`

Let 𝒳̄ be proper and flat over O_K (or ℤ), 𝒳 ⊂ 𝒳̄ open dense with generic fibres X ⊂ X̄, ℒ an ample line bundle on 𝒳̄ and ‖·‖ an F_∞-invariant hermitian metric on ℒ|_{X(ℂ)} with logarithmic singularities along X̄(ℂ) ∖ X(ℂ). Define h_{ℒ̄}(x) for x ∈ X(ℚ̄) as in heights-of-points. Let h′ be the height for any continuous metric on ℒ over X̄(ℂ). Then there are constants C_1, C_2 > 0 with |h_{ℒ̄}(x) − h′(x)| ≤ C_1 + C_2·log(max(h′(x), 1)) on X(ℚ̄). Consequently (i) h_{ℒ̄} is bounded below on X(ℚ̄), and (ii) for all t ∈ ℝ and D ≥ 1 the set {x ∈ X(ℚ̄) : [ℚ(x):ℚ] ≤ D, h_{ℒ̄}(x) ≤ t} is finite.

Hypotheses and conventions:

- ℒ ample on the proper 𝒳̄; the metric is singular only along the boundary X̄ ∖ X.
- Points are taken in the open part X.

Construction or proof:

1. Embed 𝒳̄ by a power of ℒ; the sup-type continuous metric gives h′ = Weil height up to O(1) (metrized-heights-weil-machine).
2. Logarithmic distance: choose sections f_1, …, f_t of ℒ^{⊗s} over 𝒳̄ with common zero locus the boundary and ‖f_i‖₀ ≤ 1 for the continuous metric (Faltings, proof of Lemma 3); log-singular-metric gives |log(‖·‖/‖·‖₀)(z)| ≤ c₁ + c₂ log(1 − log ‖f_i(z)‖₀) for each i. For x ∈ X(ℚ̄) of degree N = [ℚ(x):ℚ] pick i with f_i(x) ≠ 0; since f_i(x) is an integral section of x̄^*ℒ^{⊗s}, the finite part of its degree is ≥ 0 and (1/N)Σ_σ −log ‖f_i(x_σ)‖₀ ≤ s·h′(x) + c₃. Concavity of log (Jensen) bounds the average (1/N)Σ_σ log(1 − log ‖f_i(x_σ)‖₀) by log(1 + s·h′(x) + c₃), uniformly in N; bounding each embedding separately would make the constants depend on N.
3. Insert ‖·‖ ≍ ‖·‖₀ρ^{±r} (log-singular-metric) in the archimedean part of the degree.
4. (i), (ii): h′ is bounded below and satisfies Northcott with bounded degree (metrized-heights-weil-machine); the comparison transfers both, since h ≤ t forces h′ ≤ t + C_1 + C_2 log max(h′, 1), bounding h′.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/moduli-height-northcott: Northcott for the Hodge-metrized modular line bundle.
- FaltingsFinitenessAndIsogenyTheorems:R28.1/northcott-property-for-heights-from-log-singular-metrics: moved down: Faltings' Lemma 3 is planned here.
- ArakelovGeometryAndAbelianHeights:R35.5/theta-faltings-comparison: the log-comparison shape of Pazuki's estimate.

Checks:

- For the j-line with ‖dz‖² = Im τ, h_{Hodge}(E) = h(j)/12 + O(log max(h(j), 1)) (elliptic-j-height-bound).

Depends on (this roadmap): [Hermitian metrics with logarithmic singularities](#R355-log-singular-metric), [Heights of algebraic points for metrized line bundles](#R351-heights-of-points), [Metrized heights represent Weil heights; Northcott for ample bundles](#R351-metrized-heights-weil-machine), [Projective space: the Arakelov degree is Mathlib's height](#R351-sup-metric-height-comparison).

Depends on (libraries and other roadmaps): `HeightsRationalPointsAndObstructions:RP.0/northcott-projective`.

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Proposition 4.4 and the following paragraph, pp. 167–168: For L ample with metrics with logarithmic singularities along the boundary: a lower bound for h_L, finiteness of points of bounded height and bounded relative degree, through |h_L(x) − h′_L(x)| ≤ C_1 + C_2 log h′_L(x) for any continuous metric.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Proposition 1.9 and its proof, p. 30: Finitely many x ∈ U(k) with h_{L,s}(x) ≤ h when s has logarithmic singularities along Y = X ∖ U, via hypersurfaces D containing Y and twisted metrics s(D, r).
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, Lemma 3, p. 356: Finiteness of points of bounded height for a metric with logarithmic singularities on O(1)|(X ∖ Y), with the two displayed estimates.


<a id="R355-hodge-metric-log-singularities"></a>
### The Faltings metric has logarithmic growth at the boundary

*Theorem* · node `R35.5/hodge-metric-log-singularities`

Let S̄ be a smooth complex variety, D ⊂ S̄ a normal-crossings divisor, and G → S̄ a semi-abelian scheme that is abelian (and polarizable) over S = S̄ ∖ D. Then the Faltings metric on ω̄_G|_S (relative-faltings-metric) has logarithmic singularities along D. In particular, on a smooth toroidal compactification Ā_{g,n} of the fine Siegel moduli space (n ≥ 3) with its universal semi-abelian scheme, and hence (log-singular-metric's modification invariance) on the minimal compactification A*_{g,n} with L = descended ω̄^{⊗m}, the Faltings metric has logarithmic singularities along the boundary.

Hypotheses and conventions:

- G semi-abelian over S̄, abelian over S; D a normal-crossings divisor (after resolution).
- For the moduli application the toroidal compactification (smooth cone decompositions, so that the boundary is a divisor with smooth relative intersections) and its universal semi-abelian scheme over ℂ are the base change to ℂ of ShimuraCompactifications C4/C5 at neat level n ≥ 3.
- For a general (S̄, D, G) the local degeneration structure is not taken from C4/C5 (which are PEL charts); the proof restricts to holomorphic discs meeting D transversally and uses the one-parameter argument of Deligne's Lemme 1.18 together with the bound for several parameters of Faltings–Chai V.4.5.

Construction or proof:

1. Reduce to a polydisc near a boundary point with coordinates x_1, …, x_a cutting out D, using the degeneration data: G is the quotient of an extension of an abelian scheme by a torus by a period lattice given by a bilinear form b = ∏ x_j^{s_j} with s_j positive semi-definite.
2. The squared norm of a local frame of ω̄ is, up to bounded positive factors, the determinant of the matrix of Σ_j −log|x_j|·s_j (covolume-formula with Im of the period matrix ≈ −(1/2π) Σ log|x_j| s_j).
3. This determinant is bounded below by a positive constant and above by C(−log|x_1⋯x_a|)^g, which is a logarithmic singularity.
4. One-variable version (Deligne Lemma 1.18): over a punctured disc the lattice Λ_z contains the monodromy-invariant sublattice Λ⁰ extending across 0, and the volume of ℂ^g/Λ_z grows like |log|z||^{2g−r}.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height: the metrized modular line bundle has logarithmic singularities, so log-singular-heights applies.
- FaltingsFinitenessAndIsogenyTheorems:R28.1/hodge-metric-has-logarithmic-singularities-along-the-boundary: moved down: planned here.

Checks:

- For g = 1 near the cusp q = 0 of the j-line, ‖dz‖² = Im τ = −(1/2π)log|q|.

Depends on (this roadmap): [The Faltings metric on families and on the Siegel space](#R352-relative-faltings-metric), [The Faltings norm is a covolume](#R352-covolume-formula), [Hermitian metrics with logarithmic singularities](#R355-log-singular-metric).

Depends on (libraries and other roadmaps): `ShimuraCompactifications:C4/roadmap/semi-abelian-scheme`, `ShimuraCompactifications:C4/roadmap/formal-universal-degeneration`, `ShimuraCompactifications:C5/roadmap/integral-toroidal-space`, `ShimuraCompactifications:C5/roadmap/neat-boundary-intersection-smooth`, `SchemeAndStackFoundations:SF.4`, `PELModuli:M3/siegel-fine-uniformization`.

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Proposition 4.5 and its proof, pp. 168–169: The metric of Definition 4.1 on L over [A_g]/ℂ has logarithmic singularities; proof on an arithmetic toroidal compactification via the local coordinates and the determinant of Σ −log|x_j|·s_j.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Proposition 1.11, p. 31, and Lemme 1.18 with its proof, pp. 33–34: The hermitian structure on ω has logarithmic singularities along the boundary; the one-parameter degeneration argument with the invariant sublattice and volume growth |log|z||^{2g−r}.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, p. 355 (statement and proof sketch): The canonical metric on ω_{A/X}|(X − Y) has logarithmic singularities along a normal-crossings Y for a semiabelian scheme abelian over X − Y.
- Gerd Faltings, *Arakelov's theorem for abelian varieties*, §2 (end), pp. 339–340: After reducing to Jacobians of semistable families over a curve, explicit calculations show that the canonical metric on s^*(Ω^g) has only logarithmic singularities; the referee's remark identifies ω on A* with Mumford's extension of the Hodge bundle.
- Lucien Szpiro, *Degrés, intersections, hauteurs*, Exposé I, §3, Théorème 3.2 and Lemme 3.2.1, p. 26: The differential-modular metric of a family of abelian varieties over a normal base of finite type over ℂ has logarithmic singularities.


<a id="R355-siegel-modular-line-bundle"></a>
### The Hodge-metrized modular line bundle on the minimal compactification

*Construction* · node `R35.5/siegel-modular-line-bundle` · suggested module `TauCeti/AlgebraicGeometry/Moduli/SiegelHeight`, namespace `TauCeti.SiegelModuli`

Let A_g be the coarse moduli space of principally polarized abelian varieties of dimension g over ℤ (PELModuli M6) and A_g^* its minimal compactification, a normal projective scheme over ℤ (ShimuraCompactifications C5: all primes are good for the principal Siegel datum of level one). There is m ≥ 1 and an ample line bundle L on A_g^* such that, for every toroidal compactification Ā_{g,Σ} of the stack 𝔄_g with universal semi-abelian scheme G and proper π : Ā_{g,Σ} → A_g^*, π^*L ≅ ω̄_G^{⊗m}; over the open part the pullback of L to the stack is ω̄^{⊗m} of the universal abelian scheme. The Faltings metric on ω̄ (relative-faltings-metric) induces an F_∞-invariant continuous metric on L|_{A_g(ℂ)}, which has logarithmic singularities along the boundary (hodge-metric-log-singularities). The pair L̄ = (L, ‖·‖_Fal^{⊗m}) is the metrized modular line bundle. The same construction applies to the fine level-n spaces A_{g,n} over ℤ[1/n] (n ≥ 3), whose minimal compactification maps finitely to A_g^* ⊗ ℤ[1/n].

Hypotheses and conventions:

- Principal Siegel datum; the toroidal compactifications of the stack 𝔄_g over ℤ and its minimal compactification are those of ShimuraCompactifications C5 (stack at non-neat level, coarse minimal space by descent through a neat level).
- m is chosen so that ω̄^{⊗m} descends (killing stabilizers) and is ample on A_g^*.

Construction or proof:

1. A_g^* = Proj of the graded algebra of Hodge-line sections (C5 integral-minimal-space); some power of the Hodge line descends to an ample L with π^*L = ω̄^{⊗m} (C5 minimal-hodge-ampleness, hodge-semiampleness).
2. Metric: relative-faltings-metric on the open stack descends to the coarse space because it is invariant under automorphisms (Faltings–Chai Definition 4.1).
3. Logarithmic singularities: hodge-metric-log-singularities on the toroidal model, then pushed to A_g^* by modification invariance (log-singular-metric).

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height: the height h_{L̄} of moduli points.
- Yuan 2026, §4.3 (via StableReductionPartII and ShimuraCompactifications C5): the ample Hodge ℚ-line on the Siegel coarse minimal variety.

API:

| Name | Role | Statement |
|---|---|---|
| `SiegelModuli.modularLineBundle` | constructor | The ample L on A_g^* with π^*L ≅ ω̄_G^{⊗m}. |
| `SiegelModuli.modularLineBundle_pullback` | characterisation | π^*L ≅ ω̄_G^{⊗m} on every toroidal compactification, compatibly with refinements of Σ. |
| `SiegelModuli.modularMetric` | constructor | The metric ‖·‖_Fal^{⊗m} on L∣_{A_g(ℂ)}. |
| `SiegelModuli.modularMetric_logSing` | relation | The metric has logarithmic singularities along A_g^* ∖ A_g. |
| `SiegelModuli.modularLineBundle_level` | functoriality | Pullback along A^*_{g,n} → A_g^* ⊗ ℤ[1/n] gives the level-n metrized modular line bundle. |
| `SiegelModuli.modularLineBundle_g1` | example | For g = 1, A_1^* = ℙ¹_ℤ, L = O(1), m = 12. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `SiegelModuli.modularLineBundle_g1_norm` | computation | For g = 1, the integral discriminant section Δ of ω̄^{⊗12} (q-expansion q∏(1 − qⁿ)^{24} for 2πi dz) has ‖Δ‖_Fal^{⊗12}(τ) = (2π)^{12}∣η(τ)^{24}∣(Im τ)^6, that is ∣g₂³ − 27g₃²∣(Im τ)^6 for the lattice ℤ + τℤ; the value ∣η(τ)^{24}∣(Im τ)^6 would shift the height of j(E) by 12 log 2π. |
| `SiegelModuli.modularLineBundle_ample_nonexample` | non-example | ω̄ itself is not ample on a toroidal compactification (degree zero on boundary contraction fibres); ampleness holds only on A_g^*. |
| `SiegelModuli.modularMetric_continuous_nonexample` | non-example | The metric does not extend continuously to the boundary: ‖dz‖² = Im τ → ∞ at the cusp. |
| `SiegelModuli.modularLineBundle_g0` | degenerate | For g = 0 the moduli space is Spec ℤ and L̄ is trivial. |

Checks:

- For g = 1: A_1^* = ℙ¹_ℤ (the j-line) and L = O(1) with m = 12, the section of O(1) at j = ∞ corresponding to the discriminant section Δ of ω̄^{⊗12} (q-expansion q∏(1 − qⁿ)^{24} for the canonical differential 2πi dz of the Tate curve). Its Faltings norm at τ is (2π)^{12}|Δ(τ)|(Im τ)^6 with Mathlib's Δ = η^{24}, which gives both the archimedean term and the −12 log 2π of elliptic-period-comparison.

Depends on (this roadmap): [The Faltings metric on families and on the Siegel space](#R352-relative-faltings-metric), [The Faltings metric has logarithmic growth at the boundary](#R355-hodge-metric-log-singularities), [Hermitian metrics with logarithmic singularities](#R355-log-singular-metric).

Depends on (libraries and other roadmaps): `PELModuli:M6/siegel-stack-over-z`, `PELModuli:M6/coarse-moduli-space`, `PELModuli:M6/hodge-line-bundle`, `ShimuraCompactifications:C5/roadmap/integral-toroidal-space`, `ShimuraCompactifications:C5/roadmap/integral-minimal-space`, `ShimuraCompactifications:C5/roadmap/minimal-hodge-ampleness`, `ShimuraCompactifications:C5/roadmap/hodge-semiampleness`, `ShimuraCompactifications:C5`.

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 167: The minimal compactification A_g^* with the ample L, a descended form of ω^{⊗m}, defines heights of rational points of A_g; the hermitian metric by square integration on ω over A_g and hence on L over [A_g] ⊗ ℂ.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.10, p. 31: On the moduli space M the universal ω with its hermitian structure s, the compactification M^- defined over ℚ by sections of ω^{⊗n}, and the extension of ω.


<a id="R355-modular-height-equals-faltings-height"></a>
### The modular height of a moduli point is m times the stable Faltings height

*Theorem* · node `R35.5/modular-height-equals-faltings-height`

Let (A, λ) be a principally polarized abelian variety of dimension g over a number field K and x_A ∈ A_g(K) its moduli point. Then h_{L̄}(x_A) = m·h_st(A), where h_{L̄} is the height of heights-of-points for the metrized modular line bundle (computed on A_g^* over ℤ with the logarithmically singular metric). More precisely, if A has semistable reduction over K with semi-abelian model 𝒢 over O_K, x_A extends to x̄ : Spec O_K → A_g^* through a toroidal compactification and x̄^*L̄ ≅ ω̄̂(𝒢)^{⊗m} isometrically: the two-sided commensurability of the modular line bundle and the Hodge line holds with no correction. For a point y of a fine level-n space A_{g,n} (n ≥ 3) with image x in A_g, the pulled-back metrized line bundle gives the same value: h(y) = h_{L̄}(x) = m·h_st(A_y).

Hypotheses and conventions:

- (A, λ) principally polarized; the identity is for the stable height (the relative height h(A/K) can be larger at non-semistable primes).
- The integral structure is the one of A_g^* over ℤ of siegel-modular-line-bundle; another projective model changes h_{L̄} by O(1) (heights-of-points).

Construction or proof:

1. Extend K so that A is semistable (stable-faltings-height); h_{L̄} is unchanged by field extension (heights-of-points).
2. The point Spec K → 𝔄_g extends to Spec O_K → Ā_{g,Σ} by properness of the toroidal compactification (C5 valuative-properness); the pulled-back universal semi-abelian scheme is a semi-abelian model of A, hence 𝒢 (uniqueness: C4 homomorphism-extension).
3. Pull back π^*L ≅ ω̄_G^{⊗m}: x̄^*L ≅ ω̄_𝒢^{⊗m} as O_K-modules (hodge-line-of-group-scheme base change), and the metrics agree at every σ by construction.
4. Hence deg^ x̄^*L̄ = m·deg^ ω̄̂(𝒢), so h_{L̄}(x_A) = m·h(A/K) = m·h_st(A).
5. Alternative route without integral compactifications (Faltings 1983 §2, Deligne 1.13–1.17): pass through stable curves and Gabber's lemma to get e·ρ^*M ⊂ ω^{⊗r} ⊂ e^{−1}ρ^*M with a uniform e, which only gives equality up to O(1).

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.1/commensurability-of-the-modular-and-hodge-line-bundles: moved down: the commensurability is planned here, with e = 1 on the integral minimal compactification.
- ArakelovGeometryAndAbelianHeights:R35.5/moduli-height-northcott: Northcott for the stable height.

Checks:

- For g = 1 and E/ℚ semistable, h_{O(1)}(j(E)) with the metric ‖Δ‖(τ) = (2π)^{12}|Δ(τ)|(Im τ)^6 on the discriminant section (Mathlib's Δ = η^{24}) equals 12·h_Fal(E), which is elliptic-period-comparison (log N Δ_min is the finite part of the degree).

Depends on (this roadmap): [The Hodge-metrized modular line bundle on the minimal compactification](#R355-siegel-modular-line-bundle), [Heights of algebraic points for metrized line bundles](#R351-heights-of-points), [Arithmetic degree of ĈH¹ on proper one-cycles](#R351-arithmetic-degree-pairing), [The Hodge line of a smooth commutative group scheme](#R352-hodge-line-of-group-scheme), [The metrized Hodge line bundle over O_K](#R352-metrized-hodge-line), [The stable Faltings height](#R353-stable-faltings-height), [The Faltings height is an invariant of the abelian variety](#R353-model-and-polarization-independence).

Depends on (libraries and other roadmaps): `ShimuraCompactifications:C5/roadmap/valuative-properness`, `ShimuraCompactifications:C4/roadmap/homomorphism-extension`, `PELModuli:M6/universal-family-export`, `ShimuraCompactifications:C5`.

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 169: The height of the rational point of A_g^* of a semistable principally polarized abelian variety is m/[K:ℚ] times the degree of ω_G with its square-integration metric, since the pullback of L to Spec O_K is ω^{⊗m} as a metrized line bundle.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Proposition 1.12 and its discussion, p. 32, and §1.17, p. 33: h(A) agrees with the height h_{ω,s} on the moduli space up to O(1); the argument through semi-abelian extensions over integral toroidal compactifications, and the substitute via stable curves.
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §2, Korollar to Lemma 2, pp. 352–353: e·ρ^*(M) ⊂ (ω_{A/R})^{⊗r} ⊂ e^{−1}·ρ^*(M) for a uniform e, proved through the stable-curve correspondence.


<a id="R355-moduli-height-northcott"></a>
### Northcott and a lower bound for the stable height of principally polarized varieties

*Theorem* · node `R35.5/moduli-height-northcott`

For every g ≥ 1: (i) there is c(g) ∈ ℝ with h_st(A) ≥ c(g) for every principally polarized abelian variety of dimension g over a number field; (ii) for all t ∈ ℝ and D ≥ 1, the set of moduli points x ∈ A_g(ℚ̄) with [ℚ(x):ℚ] ≤ D and h_st(A_x) ≤ t is finite, i.e. there are finitely many ℚ̄-isomorphism classes of principally polarized (A, λ) of dimension g whose moduli point has degree at most D and whose stable height is at most t.

Hypotheses and conventions:

- Finiteness is for moduli points (ℚ̄-isomorphism classes, field of moduli of bounded degree); passing to K-isomorphism classes is FaltingsFinitenessAndIsogenyTheorems R28.1.

Construction or proof:

1. By modular-height-equals-faltings-height, m·h_st(A_x) = h_{L̄}(x).
2. L̄ is ample with a metric with logarithmic singularities (siegel-modular-line-bundle), so log-singular-heights gives a lower bound and Northcott for bounded degree.
3. The field of moduli of (A, λ) is the residue field of x (PELModuli M6 field-of-moduli), so 'moduli point of degree ≤ D' is the bounded-degree condition.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.6/moduli-point-finiteness: the export with explicit dependence.
- FaltingsFinitenessAndIsogenyTheorems:R28.1/finiteness-of-principally-polarized-semiabelian-models-of-bounded-height: Satz 1 descends from these moduli points.

Checks:

- For g = 1: finitely many j ∈ ℚ̄ of degree ≤ D with h_st(E_j) ≤ t, consistent with h_st ≥ h(j)/12 − O(log) and Northcott for h(j).

Depends on (this roadmap): [The modular height of a moduli point is m times the stable Faltings height](#R355-modular-height-equals-faltings-height), [Heights for metrics with logarithmic singularities](#R355-log-singular-heights), [The Hodge-metrized modular line bundle on the minimal compactification](#R355-siegel-modular-line-bundle).

Depends on (libraries and other roadmaps): `PELModuli:M6/field-of-moduli`.

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Proposition 4.6, p. 169: (i) A constant C with h_mod(A/F) ≥ h_geom(A/F) ≥ C for principally polarized A of dimension g; (ii) finiteness of isomorphism classes of principally polarized abelian varieties over fields of bounded degree with bounded modular height.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Lemme 1.6, p. 29, and Lemme 1.20, p. 34: Finiteness of principally polarized abelian varieties with level structure and bounded height, by comparing h(A) with the height of the moduli point; h_geom(A) = h(a) + O(1) for polarizations of degree n.


<a id="R355-theta-height"></a>
### The theta height of a principally polarized abelian variety

*Definition* · node `R35.5/theta-height` · suggested module `TauCeti/NumberTheory/Arakelov/ThetaHeight`, namespace `TauCeti.AbelianVariety`

Let (A, L) be a principally polarized abelian variety of dimension g over ℚ̄, with L symmetric and ample, and let r ≥ 2 be even. A theta structure of level r on L^{⊗r²} (an isomorphism of the theta group of L^{⊗r²} with the standard Heisenberg group of (ℤ/r²ℤ)^g compatible with the symmetric structure, AbelianSchemesAndArithmeticModuli A3 theta-group) gives a basis of Γ(A, L^{⊗r²}) and hence an embedding Θ : A → ℙ^{r^{2g}−1}. The theta null point is Θ(0) ∈ ℙ^{r^{2g}−1}(ℚ̄) and the theta height is h_Θ(A, L) = h(Θ(0)), the absolute logarithmic height for the Fubini–Study (ℓ²) metric on O(1), i.e. the normalised Arakelov degree of Θ(0)^*Ō(1)_FS. It depends only on the ℚ̄-isomorphism class of (A, L) (another theta structure changes Θ(0) by the action of a finite group of unitary matrices).

Hypotheses and conventions:

- r ≥ 2 even, so L^{⊗r²} is very ample (r² ≥ 4); L symmetric defining the principal polarization.

Construction or proof:

1. Mumford's theory: the theta group G(L^{⊗r²}) is a Heisenberg group; a symmetric theta structure gives the basis (ϑ_x) of sections; evaluate at the origin.
2. Change of theta structure acts on ℙ^{r^{2g}−1} through a finite group preserving the ℓ² norms up to the same scalar at every place, so h(Θ(0)) is unchanged.
3. The height is the Fubini–Study Arakelov degree of sup-metric-height-comparison, normalised by the degree of the field of definition.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.5/theta-faltings-comparison: compared with the stable Faltings height.
- PAPER-YUAN-26/170: the concrete form of the comparison a consumer uses.

API:

| Name | Role | Statement |
|---|---|---|
| `AbelianVariety.thetaNullPoint` | constructor | Θ(0) ∈ ℙ^{r^{2g}−1}(ℚ̄) for a symmetric theta structure of level r. |
| `AbelianVariety.thetaHeight` | constructor | h_Θ(A, L) = h_FS(Θ(0)). |
| `AbelianVariety.thetaHeight_nonneg` | simp | h_Θ(A, L) ≥ 0. |
| `AbelianVariety.thetaHeight_congr` | extensionality | Depends only on the ℚ̄-isomorphism class of (A, L), not on the theta structure. |
| `AbelianVariety.thetaHeight_northcott` | relation | Finitely many ℚ̄-classes of bounded theta height definable over fields of bounded degree. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| `AbelianVariety.thetaHeight_level_dependence` | characterisation | h_Θ depends on r; the comparison constants of theta-faltings-comparison depend on (g, r). |
| `AbelianVariety.thetaHeight_elliptic` | computation | For g = 1, r = 2 the coordinates of Θ(0) are the four second-order theta constants θ_{ab}(0, 2τ) up to the normalisation of Pazuki §2.4. |
| `AbelianVariety.thetaHeight_sup_nonexample` | non-example | Using the sup-norm Weil height of Θ(0) instead of the ℓ² height changes h_Θ by up to ½ log(r^{2g}). |
| `AbelianVariety.thetaHeight_product` | compatibility | For a product of principally polarized varieties with product theta structures, Θ(0) is the Segre product and h_Θ is additive. |

Checks:

- Over ℂ with A(ℂ) = ℂ^g/(ℤ^g + τℤ^g), the projective coordinates of Θ(0) are the theta constants θ_m(0, τ) of level r (Pazuki §2.4).

Depends on (this roadmap): [Projective space: the Arakelov degree is Mathlib's height](#R351-sup-metric-height-comparison).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A3/theta-group`, `AbelianSchemesAndArithmeticModuli:A3`, `HeightsRationalPointsAndObstructions:RP.0/normalized-height`, `AbelianSchemesAndArithmeticModuli:A5/siegel-analytic-family`.

Sources:

- Fabien Pazuki, *Theta height and Faltings height*, §2.3.3–2.3.4, Definition 2.6, p. 9 (arXiv v2): The theta embedding Θ : A → ℙ^{r^{2g}−1} from a theta structure of level r on L^{⊗r²}, and h_Θ(A, L) := h(Θ(0)) for the ℓ²-Weil height (Arakelov degree of O(1) with the Fubini–Study metric); it depends only on the ℚ̄-isomorphism class.


<a id="R355-theta-faltings-comparison"></a>
### Comparison of theta height and stable Faltings height

*Theorem* · node `R35.5/theta-faltings-comparison`

Let (A, L) be a principally polarized abelian variety of dimension g over ℚ̄ with L symmetric, r ≥ 2 even, K a number field of definition and τ_σ ∈ Siegel's fundamental domain with A_σ(ℂ) ≅ ℂ^g/(ℤ^g + τ_σℤ^g). In Deligne's normalisation h_F = h_st,Del: m(r, g) ≤ h_Θ(A, L) − ½h_F(A) − (1/(4[K:ℚ]))Σ_σ log det(Im τ_σ) ≤ M(r, g) with m(r, g) = g(¼ log(4π) − ½ r^{2g} log r) and an explicit M(r, g). Consequently, with h_Θ⁺ = max(h_Θ, 1) and h_F⁺ = max(h_F, 1): |h_Θ(A, L) − ½h_F(A)| ≤ C_1(g, r) log(h_Θ⁺ + 2) and |h_Θ⁺ − ½h_F⁺| ≤ C_2(g, r) log(min(h_Θ⁺, h_F⁺) + 2), with C_1 = 6r^{2g} log(r^{2g}), C_2 = 1000 r^{2g}(log r^{2g})^5. In particular a bound h_F(A) ≤ H (Deligne's normalisation; h_F = h_st,Fal + (g/2) log π) gives h_Θ ≤ B/2 + C_2 log(B + 2) with B = max(H, 1).

Hypotheses and conventions:

- Principal polarization by a symmetric L; constants depend only on (g, r).
- The bound on Σ_σ |log det Im τ_σ| by C(g) log(max(h_Θ, 1) + 2) is Masser's matrix lemma, made explicit by David–Philippon (Pazuki Remark 1.2).

Construction or proof:

1. Moret-Bailly's key formula expresses the Néron–Tate height of a point through its theta height, h_F(A) and base-point contributions (Pazuki Lemma 5.2); take the origin.
2. Estimate the base-point contributions by the inclusion of vector bundles of theta functions and the analysis of theta functions on the fundamental domain (Bost–David), giving Theorem 1.1.
3. Combine with the matrix lemma bound on log det Im τ_σ to get Corollary 1.3.
4. Translate normalisations with normalization-adapter (Pazuki uses (2π)^{−g}i^{g²}).

Uses:

- PAPER-YUAN-26/170: Yuan imports finiteness from bounded Faltings height via this comparison (route to R35.5/R35.6).
- ArakelovGeometryAndAbelianHeights:R35.6/moduli-point-finiteness: explicit constant dependence.

Checks:

- Pazuki's Remark 1.4 deduces h_F(A) ≥ −C(g) log C(g) − M(r, g); Bost's sharper bound is h_F ≥ −(g/2) log(2π) in this normalisation.

Depends on (this roadmap): [The theta height of a principally polarized abelian variety](#R355-theta-height), [The stable Faltings height](#R353-stable-faltings-height), [Normalisations of the Faltings metric and height](#R352-normalization-adapter), [The Faltings norm is a covolume](#R352-covolume-formula), [Heights for metrics with logarithmic singularities](#R355-log-singular-heights).

Sources:

- Fabien Pazuki, *Theta height and Faltings height*, Theorem 1.1, Remark 1.2, Corollary 1.3, pp. 2–3 (arXiv v2): The two-sided bound m(r, g) ≤ h_Θ − ½h_F − (1/4[K:ℚ])Σ log det Im τ_σ ≤ M(r, g) with explicit constants, the matrix-lemma bound, and the logarithmic comparisons with C_1 = C_3 = 6r^{2g} log(r^{2g}) and C_2 = 1000 r^{2g}(log r^{2g})^5.
- Fabien Pazuki, *Theta height and Faltings height*, §2.2, pp. 6–7 (arXiv v2): h_F is defined with ‖α‖² = (i^{g²}/(2π)^g)∫ α ∧ ᾱ, following Deligne.


<a id="R355-elliptic-j-height-bound"></a>
### The stable Faltings height of an elliptic curve and h(j)

*Theorem* · node `R35.5/elliptic-j-height-bound`

For every elliptic curve E over ℚ̄ with j-invariant j, h_st(E) ≤ h(j)/12 + 3 in Faltings' normalisation (Bilu–Parent–Rebolledo's h_F), where h is the absolute logarithmic Weil height; Gaudron–Rémond prove h_st,Del(E) ≤ h(j)/12 + 2.95 in Deligne's normalisation, which is stronger since h_st,Fal = h_st,Del − ½ log π. More precisely, for E semistable over K, 12·h_st,Fal(E) = h(j) − (1/[K:ℚ]) Σ_σ log(max(1, |j(τ_σ)|)·|Δ(τ_σ)|·(Im τ_σ)^6) − 12 log(2π), and the function U(τ) = max(1, |j(τ)|)|Δ(τ)|(Im τ)^6 is bounded below by a positive constant on Siegel's fundamental domain.

Hypotheses and conventions:

- E over a number field K; for the identity, semistable over K (pass to an extension).

Construction or proof:

1. Semistable case: at every prime v(Δ_min) = max(0, −v(j)), so log N(Δ_{E/K}) = Σ_𝔭 log max(1, |j|_𝔭)·(local degree), the finite part of [K:ℚ]h(j).
2. Substitute in elliptic-period-comparison and write the archimedean part of h(j) as Σ_σ log max(1, |j(τ_σ)|).
3. Lower bound for U on the fundamental domain: |Δ(τ)| ≥ e^{−1/9}e^{−2π Im τ} and |j(τ)| ≥ e^{2π Im τ} − 1193 (Faisant–Philibert), so U(τ) ≥ e^{−1/9}min_y f(y) with f(y) = max(y^6 e^{−2πy}, y^6(1 − 1193e^{−2πy})); the numerical minimum gives the constant.
4. Normalisation: Gaudron–Rémond's h is h_Del; subtract ½ log π for h_Fal.

Uses:

- EllipticModularityEffectiveComparisons:EC.5/split-cartan-large-primes: requested explicit comparison h_F(E) ≤ h(j(E))/12 + 3 at the source normalisation.

Checks:

- For E = 11.a2, h_st,Fal(E) ≈ −0.308 and h(j)/12 = log(122023936)/12 ≈ 1.552, consistent with the bound.
- Numerically, U(τ) = max(1, |j(τ)|)|Δ(τ)|(Im τ)^6 with Mathlib's Δ = η^24 attains its minimum on the fundamental domain on the curve |j(τ)| = 1, at τ ≈ −½ + 0.8944i (j = −1), where U ≈ 0.0020239; at τ = e^{2πi/3} (j = 0) it is ≈ 0.0020272. Hence h_st,Fal(E) ≤ h(j)/12 − 1.3210 (Deligne: −0.7486) for every E, with equality for the curves with j = −1, while h_st itself is smallest at j = 0 (≈ −1.3211 Faltings, −0.7488 Deligne; Deligne, Remarque 1.5). The source constants 3 and 2.95 are valid but far from sharp (source issue E4).

Depends on (this roadmap): [Elliptic curves: the Faltings height from the discriminant and the periods](#R352-elliptic-period-comparison), [The stable Faltings height](#R353-stable-faltings-height), [Normalisations of the Faltings metric and height](#R352-normalization-adapter).

Depends on (libraries and other roadmaps): `HeightsRationalPointsAndObstructions:RP.0/normalized-height`, `ModularForm.discriminant` (Mathlib).

Sources:

- Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, Lemme 7.9 and its proof, pp. 32–33 (arXiv v1): h(E) ≤ h(j)/12 + 2.95 for every elliptic curve, from Silverman's formulas for h(j) and h_F(E) in the semistable case, the bound for |Δ(τ)|, the Faisant–Philibert lower bound for |j(τ)|, and h_F = h − ½ log π.
- Yuri Bilu, Pierre Parent and Marusia Rebolledo, *Rational points on X_0^+(p^r)*, Proposition 4.4(ii) and the following paragraph, p. 971: h_F(E) ≤ h(j_E)/12 + 3, attributed to Silverman's Proposition 2.1 with an unspecified constant, Pellarin's computation (C = 4) and Gaudron–Rémond's Lemma 7.9 (C = 3); h_F is Faltings' original semistable height.


## R35.6. Inputs to finiteness

The layer exports what Faltings' finiteness proof needs from heights, with every constant explicit: Zarhin's trick and the identity h_st((A × A^t)^4) = 8h_st(A), the degree bounds for fields of semistability and of level structures, finiteness of principally polarized varieties of bounded stable height over fields of bounded degree (as moduli points), a lower bound c(g) for the stable height of every abelian variety (Bost's sharp −(g/2) log 2π in Deligne's normalisation is recorded), and the package consumed by FaltingsFinitenessAndIsogenyTheorems. The isogeny-class bound and the descent from moduli points to K-isomorphism classes are not proved here.

**Named milestones:** [Zarhin's trick](#R356-zarhin-trick), [Finiteness of moduli points of bounded height](#R356-moduli-point-finiteness), [Lower bound for the Faltings height](#R356-faltings-height-lower-bound).

**Layers of other roadmaps used:** `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `PELModuli:M6`.

<a id="R356-zarhin-trick"></a>
### Zarhin's trick

*Theorem* · node `R35.6/zarhin-trick`

Let (A, λ) be a polarized abelian scheme over a scheme S (in particular a polarized abelian variety over a field). Then Z(A) := (A ×_S A^t)^4 carries a principal polarization canonically attached to (A, λ). In particular, for every abelian variety A over a field k, A^4 × (A^t)^4 admits a principal polarization over k.

Hypotheses and conventions:

- (A, λ) polarized: λ : A → A^t a polarization (A2); the construction is over the base of A, no field extension.

Construction or proof:

1. For a free ℤ-module M of finite rank, A ⊗ M is an abelian scheme (≅ A^{rk M}) with (A ⊗ M)^t ≅ A^t ⊗ M^∨ compatibly with biduality; for a symmetric bilinear form B on M, λ ⊗ B : A ⊗ M → A^t ⊗ M^∨ is symmetric, a polarization iff B is positive definite, of degree d^{2 rk M}·|det B|^{2g} where deg λ = d² (A2 polarization-type-and-pfaffian; Moret-Bailly IX 1.1–1.3).
2. If B is divisible by d², the subgroup K ⊗ M (K = ker λ, killed by d) is isotropic for the Weil pairing of the kernel of λ ⊗ B (polarized Weil pairing and Cartier duality of kernels, A3).
3. Take M = ℍ ⊕ ℍ for the Lipschitz quaternions ℍ = ℤ⟨1, i, j, k⟩ (rank 4 + 4) and B the real part of the ℍ-hermitian form with matrix (a, b; b̄, c), with integers a, c > 0, c divisible by d² (isotropy on {0} × ℍ), and b ∈ ℍ with N(b) = ac − 1 (Lagrange's four squares); then B is positive definite with det B = (ac − N(b))^4 = 1 and K′ = {0} × (K ⊗ ℍ) is isotropic.
4. Descend the homomorphism, not a line bundle: for an isotropic finite flat K′ ⊂ ker(λ ⊗ B), the symmetric homomorphism λ ⊗ B factors as π^t ∘ μ ∘ π through π : A ⊗ M → (A ⊗ M)/K′ with μ symmetric (Cartier duality of kernels, A3); μ is a polarization because this is checked on geometric fibres, where it is the descent of an ample bundle along an isotropic subgroup (A2 principal-quotient-and-spreading over algebraically closed fields); deg μ = (det B)^{2g} = 1.
5. The quotient (A ⊗ M)/K′ is isomorphic to A^4 × (A/K)^4 = A^4 × (A^t)^4, and every choice is made over ℤ, so the construction is canonical and commutes with base change.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.6/zarhin-height-identity: reduction of bounds for arbitrary abelian varieties to principally polarized ones.
- FaltingsFinitenessAndIsogenyTheorems:R28.1: fixed-field Zarhin/polarization finiteness transfer (R28.1 keeps the transfer, R35.6 supplies the height identity).

Checks:

- For an elliptic curve E with its principal polarization, Z(E) = E^8 with a principal polarization (not the product one in general).

Depends on (libraries and other roadmaps): `AbelianSchemesAndArithmeticModuli:A2/polarization-type-and-pfaffian`, `AbelianSchemesAndArithmeticModuli:A2/principal-quotient-and-spreading`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`, `AbelianSchemesAndArithmeticModuli:A6/degree-formulas-for-polarized-isogenies`.

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. I, Lemma 5.5, p. 29: If (A → S, λ) is a polarized abelian scheme then (A ×_S A^t)^4 has a principal polarization canonically attached to (A, λ) (Zarhin; Moret-Bailly).
- Laurent Moret-Bailly, *Pinceaux de variétés abéliennes*, Chapitre IX, §1, Lemme 1.1 and its proof 1.2–1.5, pp. 205–207: For any S and polarized (A, ψ) of degree d², a principal polarization on (A × A^t)^4 attached canonically and compatibly with base change; the proof through A ⊗ M, ψ ⊗ B, the degree formula d^{2 rk M}|det B|^{2g} and isotropy of K ⊗ M when B is divisible by d².
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Remarque 1.22, p. 35: For any abelian variety A over any field, A^4 × A*^4 admits a principal polarization (Zarhin).
- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 169: By Zarhin's trick A^4 × A^{t4} always has a principal polarization.


<a id="R356-zarhin-height-identity"></a>
### Heights through Zarhin's trick

*Theorem* · node `R35.6/zarhin-height-identity`

For every abelian variety A over ℚ̄, h_st((A × A^t)^4) = 8·h_st(A); if A has semistable reduction over K, h((A × A^t)^4/K) = 8·h(A/K). The height of a principally polarized abelian variety does not depend on the principal polarization chosen, so bounds for principally polarized varieties of dimension 8g give bounds for all abelian varieties of dimension g.

Hypotheses and conventions:

- The stable identity holds for all A; the relative one needs semistability (Néron models of products and duals).

Construction or proof:

1. stable-height-properties gives additivity and duality invariance: h_st((A × A^t)^4) = 4h_st(A) + 4h_st(A^t) = 8h_st(A).
2. Polarization independence: model-and-polarization-independence.

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.1: product/polarization identities needed for Zarhin's trick in R28.

Checks:

- If h_st(A) ≤ t then the principally polarized Z(A) of dimension 8g has h_st ≤ 8t.

Depends on (this roadmap): [Zarhin's trick](#R356-zarhin-trick), [Products, duals and powers for the stable height](#R353-stable-height-properties), [The Faltings height is an invariant of the abelian variety](#R353-model-and-polarization-independence).

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V §4, p. 169: If A has semistable reduction, the modular height of A^4 × A^{t4} is eight times that of A.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Remarque 1.22, p. 35: h(A × B) = h(A) + h(B) and h(A) = h(A*) let the lower bound for principally polarized varieties be transported: C_{g,n} may be replaced by (1/8)C_{8g,1}.
- Jean-Benoît Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz)*, Appendice C, end, p. 155: Z(A) := A^4 × Â^4 is principally polarized and h(A) = (1/8)h(Z(A)) by duality invariance, giving an effective lower bound for all abelian varieties.


<a id="R356-field-degree-constants"></a>
### Field-degree constants for semistability and level structures

*Theorem* · node `R35.6/field-degree-constants`

Let A be an abelian variety of dimension g over a number field K. (i) A has semistable reduction everywhere over K(A[12]) (indeed over K(A[3]) at primes not above 3 and over K(A[4]) at primes not above 2), and [K(A[n]):K] ≤ #GL_{2g}(ℤ/nℤ). (ii) For a principally polarized (A, λ) and n ≥ 3, a full symplectic level-n structure exists over K(A[n]), so (A, λ) defines a point of the fine moduli space A_{g,n} over K(A[n]) ⊃ K(μ_n), of degree ≤ [K:ℚ]·#GSp_{2g}(ℤ/nℤ). (iii) A principally polarized (A, λ) over ℚ̄ whose field of moduli F has degree D over ℚ has a model over an extension F′ of F with [F′:F] ≤ 2·3^{4g²}. Hence every quantity in moduli-point-finiteness depends only on g, the degree bound and the height bound.

Hypotheses and conventions:

- n ≥ 3 for rigidity; (iii) in characteristic 0, principal polarization.

Construction or proof:

1. (i) NeronModels R11.3 finite-torsion-semistability with N = 3 and N = 4; the Galois action on A[n] embeds Gal(K(A[n])/K) into GL_{2g}(ℤ/n).
2. (ii) The Weil pairing makes the image symplectic up to similitude, so Gal(K(A[n])/K) ⊂ GSp_{2g}(ℤ/n); a symplectic basis over K(A[n]) is a level-n structure; rigidity at n ≥ 3 (AbelianSchemes A6).
3. (iii) PELModuli M6 bounded-field-of-definition.

Uses:

- ArakelovGeometryAndAbelianHeights:R35.6/moduli-point-finiteness: turning bounded-degree moduli points into bounded-degree fields of definition.
- ArakelovGeometryAndAbelianHeights:R35.3/bad-place-correction-bound: the field K′ of bounded degree.

Checks:

- For g = 1, [K(E[12]):K] ≤ #GL_2(ℤ/12) = 4608.

Depends on (libraries and other roadmaps): `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-torsion-semistability`, `PELModuli:M6/bounded-field-of-definition`, `AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.

Sources:

- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Lemme 1.23 and §1.24, p. 35: A acquires semistable reduction over an extension of degree at most |GL(2g, ℤ/15)| and a level-15 structure over an extension of bounded degree.


<a id="R356-moduli-point-finiteness"></a>
### Finiteness of principally polarized abelian varieties of bounded stable height

*Theorem* · node `R35.6/moduli-point-finiteness`

For integers g ≥ 1, D ≥ 1 and t ∈ ℝ: (i) there are only finitely many ℚ̄-isomorphism classes of principally polarized abelian varieties (A, λ) of dimension g that are defined over some number field of degree at most D and satisfy h_st(A) ≤ t; (ii) for n ≥ 3 and a number field K, there are only finitely many K-isomorphism classes of triples (A, λ, ε) over K with a principal polarization λ, a level-n structure ε, dim A = g and h(A/K) ≤ t; (iii) the same holds with h_st in place of h and with Faltings', Deligne's or the unscaled normalisation, the bounds changing by (g/2)·log π or (g/2)·log 2. The finiteness is effective in the sense that the sets are contained in the sets of moduli points of A_g of degree ≤ D (resp. of A_{g,n}(K)) with height ≤ m·t for the metrized modular line bundle.

Hypotheses and conventions:

- Finiteness of ℚ̄-classes (moduli points); the descent to K-isomorphism classes of abelian varieties without level structure, the isogeny-class bound and Shafarevich finiteness are proved in FaltingsFinitenessAndIsogenyTheorems R28.

Construction or proof:

1. (i) If (A, λ) is defined over K of degree ≤ D, its moduli point lies in A_g(ℚ̄) with residue field of degree ≤ D; moduli-height-northcott gives finiteness.
2. (ii) Level-n triples over K are K-points of the fine space A_{g,n} (no automorphisms), so isomorphism classes over K inject into A_{g,n}(K); A_{g,n} → A_g is finite, heights pull back (siegel-modular-line-bundle level API), and h(A/K) ≥ h_st(A); apply (i) with D = [K:ℚ].
3. (iii) normalization-adapter.
4. Constants: field-degree-constants bounds every auxiliary field degree in terms of g and D.

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.1/finiteness-of-principally-polarized-semiabelian-models-of-bounded-height: Satz 1 descends from (ii).
- PAPER-YUAN-26/170: finiteness of curves of bounded ω²-invariant via the Faltings height of the Jacobian (the passage to curves uses Torelli in the consumer).

Checks:

- For g = 1: finitely many j-invariants of degree ≤ D with h_st(E_j) ≤ t, recovering Northcott for h(j) through elliptic-j-height-bound in one direction.

Depends on (this roadmap): [Northcott and a lower bound for the stable height of principally polarized varieties](#R355-moduli-height-northcott), [The modular height of a moduli point is m times the stable Faltings height](#R355-modular-height-equals-faltings-height), [Field-degree constants for semistability and level structures](#R356-field-degree-constants), [Normalisations of the Faltings metric and height](#R352-normalization-adapter).

Depends on (libraries and other roadmaps): `PELModuli:M6/coarse-moduli-space`, `PELModuli:M6/field-of-moduli`.

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Proposition 4.6(ii), p. 169: Finitely many isomorphism classes of principally polarized abelian varieties of dimension g over number fields of degree ≤ d with modular height ≤ t.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Lemme 1.6, p. 29, and Proposition 1.3, p. 27: Finitely many principally polarized (A, θ, ε) with level-m structure and h(A) ≤ h over k; finitely many polarized A of given degree and height over k.
- Jean-Benoît Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz)*, §2.1.3, Théorème 2.1 ii), p. 119: Up to ℚ̄-isomorphism, finitely many abelian varieties of dimension g defined over a number field of bounded degree with bounded Faltings height.
- Fabien Pazuki, *Theta height and Faltings height*, Definition 2.6 and the following paragraph, p. 9 (arXiv v2): Finitely many ℚ̄-isomorphism classes of polarized pairs of bounded theta height definable over fields of bounded degree.


<a id="R356-faltings-height-lower-bound"></a>
### A lower bound for the stable Faltings height

*Theorem* · node `R35.6/faltings-height-lower-bound`

For every g ≥ 1 there is c(g) ∈ ℝ such that h_st(A) ≥ c(g) for every abelian variety A of dimension g over ℚ̄. Bost's theorem (gap G1) makes c(g) linear in g and sharp: h_st,Del(A) ≥ −(g/2) log(2π) in Deligne's normalisation, h_st,Fal(A) ≥ −(g/2) log(2π²) > −3g/2 in Faltings'.

Hypotheses and conventions:

- Any abelian variety (no polarization needed, through Zarhin's trick).
- The sharp constant −(g/2) log(2π) is Bost's theorem, whose primary source (Bost's 1996 Duke article and conference report) is not freely available; the existence of c(g) and an effective non-sharp c(g) are proved from freely available sources.

Construction or proof:

1. Principally polarized case: moduli-height-northcott (i) gives c′(g) with h_st ≥ c′(g).
2. General case: zarhin-height-identity gives h_st(A) = h_st(Z(A))/8 ≥ c′(8g)/8.
3. Effective form: Bost's Appendix C bounds h_F from below through second-order theta constants (Proposition C.2 and the reduction theory estimates), then Zarhin and duality invariance.
4. Normalisation translation: normalization-adapter (h_Fal = h_Del − (g/2) log π).

Uses:

- PAPER-TSIMERMAN-18/bost-lower-bound: Bost's lower bound for the stable Faltings height.
- ArakelovGeometryAndAbelianHeights:R35.6/finiteness-inputs-export: the lower bound c(g) that, with bad-place-correction-bound, makes the bad primes of varieties of bounded height finite (item (c)).
- FaltingsFinitenessAndIsogenyTheorems:R28.5: heights in an isogeny class are bounded below.

Checks:

- For g = 1 the minimum of h_st,Del over elliptic curves is attained at j = 0 (Deligne Remarque 1.5), about −0.749, which is above −½ log(2π) ≈ −0.919.

Depends on (this roadmap): [Northcott and a lower bound for the stable height of principally polarized varieties](#R355-moduli-height-northcott), [Heights through Zarhin's trick](#R356-zarhin-height-identity), [Normalisations of the Faltings metric and height](#R352-normalization-adapter).

Sources:

- Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ch. V, Proposition 4.6(i), p. 169: A constant C with h_mod(A/F) ≥ h_geom(A/F) ≥ C for principally polarized abelian varieties of dimension g.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Lemme 1.21 and Remarque 1.22, p. 35: h(A) ≥ h_geom(A) ≥ C_{g,n} for A with a polarization of degree n, and the reduction to principal polarizations making C independent of n.
- Jean-Benoît Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz)*, Théorème 2.1 i), p. 119, and Appendice C, Proposition C.2, pp. 154–155: Existence of C_0(g) with h(A) ≥ C_0(g) and an effective lower bound through theta constants, Zarhin's trick and duality.
- Fabien Pazuki, *Theta height and Faltings height*, Remark 1.4, p. 3 (arXiv v2): An explicit lower bound from the theta comparison, and Bost's sharper h_F(A) ≥ −g log(2π)/2 in Deligne's normalisation.
- Jacob Tsimerman, *The André–Oort conjecture for A_g*, Theorem 2.1, p. 3 (arXiv v5): Bost's theorem: h_Fal(A) ≥ c_g for abelian varieties of dimension g over ℚ̄, with c_g linear in g.
- Éric Gaudron and Gaël Rémond, *Polarisations et isogénies*, §9 (Conclusion des démonstrations), p. 2101: Gaudron–Rémond use Bost's minoration in Faltings' normalisation in the form h_F(A) ≥ −3g/2.


<a id="R356-finiteness-inputs-export"></a>
### The height inputs to Faltings' finiteness theorems

*Application* · node `R35.6/finiteness-inputs-export`

For a number field K and g ≥ 1 the following package is exported to FaltingsFinitenessAndIsogenyTheorems: (a) the stable and relative Faltings heights with h(A/K) ≥ h_st(A) ≥ c(g); (b) for every t, the set of moduli points (in A_g or A_{g,n}) of principally polarized varieties of dimension g over fields of degree ≤ D with h_st ≤ t is finite, with all field degrees bounded by field-degree-constants; (c) every abelian variety A of dimension g over K with h(A/K) ≤ t has semistable reduction at all primes of residue characteristic p with log p > [K′:ℚ](t − c(g)), where [K′:K] ≤ #GL_{2g}(ℤ/15ℤ), so its bad primes lie in a finite set depending on (K, g, t); (d) h(A × B) = h(A) + h(B), h(A^t) = h(A), h_st(Z(A)) = 8h_st(A); (e) the isogeny formula and bounds of R35.4. The arithmetic bound for all abelian varieties in an isogeny class, the descent from moduli points to K-isomorphism classes, and the finiteness of K-forms remain theorems of R28.

Hypotheses and conventions:

- Exported statements are exactly those of the cited nodes; nothing about isogeny classes is assumed.

Construction or proof:

1. Collect moduli-point-finiteness, faltings-height-lower-bound, bad-place-correction-bound, zarhin-height-identity and the R35.4 nodes.
2. (c) is bad-place-correction-bound applied with the lower bound c = c(g) of faltings-height-lower-bound.

Uses:

- FaltingsFinitenessAndIsogenyTheorems:R28.1: bounded-height finiteness of polarized abelian varieties over K, built on (b)–(d).
- FaltingsFinitenessAndIsogenyTheorems:R28.2: (e) in the ℓ-divisible tower.
- FaltingsFinitenessAndIsogenyTheorems:R28.5: (a), (e) for the isogeny-class height bound.

Checks:

- Every element of the package is a node of this roadmap with its own source.

Depends on (this roadmap): [Finiteness of principally polarized abelian varieties of bounded stable height](#R356-moduli-point-finiteness), [A lower bound for the stable Faltings height](#R356-faltings-height-lower-bound), [Each non-semistable prime contributes at least (log p)/[K′:ℚ]](#R353-bad-place-correction-bound), [Heights through Zarhin's trick](#R356-zarhin-height-identity), [Bounds and denominators for heights along isogenies](#R354-isogeny-height-bounds), [Faltings' isogeny formula](#R354-isogeny-height-formula).

Sources:

- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §3, Satz 1 and its proof, pp. 356–357: The finiteness of principally polarized semiabelian models of bounded height used in Faltings' proof, built from the height comparison and Northcott.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, §1.24, p. 35: The proof of Proposition 1.3 from Lemmas 1.20 and 1.23: finitely many classes over the algebraic closure, bounded bad set, level structures over bounded extensions, and finitely many forms.
- Jean-Benoît Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz)*, §2.1.3, Théorème 2.1, p. 119: The height statements Faltings' proof uses, stated for the stable normalised height.


## Requests to other roadmaps

- **ShimuraCompactifications:C5.** For the principal Siegel datum of level one (every prime good: level 1, Ibad = 1, self-dual lattice), state over Spec ℤ: the toroidal compactifications of the stack 𝔄_g with their universal semi-abelian scheme G and valuative properness, the coarse minimal compactification A_g^* as a normal projective scheme over ℤ, an integer m and an ample line bundle L on A_g^* with π^*L ≅ ω̄_G^{⊗m} on every toroidal compactification; and the finite map A^*_{g,n} → A_g^* ⊗ ℤ[1/n] for n ≥ 3. The C5 nodes are stated for neat good-prime PEL data with coarse descent; this is their level-one Siegel instance over ℤ. Needed by: [The Hodge-metrized modular line bundle on the minimal compactification](#R355-siegel-modular-line-bundle), [The modular height of a moduli point is m times the stable Faltings height](#R355-modular-height-equals-faltings-height).
- **AbelianSchemesAndArithmeticModuli:A3.** Mumford's symmetric theta structures: for a principally polarized abelian variety with symmetric L and even r ≥ 2, an isomorphism of the theta group G(L^{⊗r²}) with the standard Heisenberg group of (ℤ/r²)^g compatible with the symmetric structure, the induced basis of Γ(A, L^{⊗r²}) and the theta embedding A → ℙ^{r^{2g}−1}, independent of the theta structure up to a finite group acting by unitary matrices. Needed by: [The theta height of a principally polarized abelian variety](#R355-theta-height).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1.** For a finite flat commutative group scheme 𝒢 over a complete discrete valuation ring R of mixed characteristic (0, p) with Cartier dual 𝒢^D: length_R e^*Ω¹_𝒢 + length_R e^*Ω¹_{𝒢^D} = v_R(#𝒢), without the restriction e ≤ p − 1 of raynaud-determinant-tame-different (equivalently 𝔇(𝒢)·𝔇(𝒢^D) = (#𝒢)). Needed by: [Differents of an isogeny and of its dual](#R354-dual-isogeny-differents).
- **NeronModelsAndSemistableAbelianVarieties:R11.3.** The converse of semistable-identity-basechange: if A/K is not semistable at a prime 𝔭 and K′/K is finite with A_{K′} semistable at a prime w over 𝔭, then the base-change morphism of identity components 𝒜⁰ ⊗ O_{K′,w} → 𝒜_{K′}⁰ does not induce an isomorphism on Lie algebras (its determinant is a non-unit). Needed by: [Each non-semistable prime contributes at least (log p)/[K′:ℚ]](#R353-bad-place-correction-bound).
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-45a-invariant-theory-over-a-dedekind-domain-aec-viii8.** Minimal discriminant ideals of elliptic curves over number fields and the transformation rule Δ_{uω} = u^{−12}Δ_ω for the discriminant of a Weierstrass model with invariant differential ω. Needed by: [Elliptic curves: the Faltings height from the discriminant and the periods](#R352-elliptic-period-comparison).
- **SchemeAndStackFoundations:SF.3.** As merged in TauCetiRoadmap (SchemeAndStackFoundations README §§3.4–3.5): classGroup_picard_locallyFactorial — for X locally Noetherian, integral and normal, Pic(X) → Cl(X) is injective, and bijective when X is locally factorial (in particular regular), so Cartier and Weil divisors and their classes agree on the regular arithmetic schemes of R35.1; and lineBundleNorm — the norm Norm_π : Pic(X) → Pic(Y) along a finite locally free π, a group homomorphism with Norm_π(π^*N) ≅ N^{⊗d}, compatible with composition and base change, together with the norm of sections (sectionNorm). The atlas SF.3 part packet is not accepted; these upstream targets replace its node ids class-group-picard-locally-factorial and line-bundle-norm. Needed by: [Arithmetic divisors with Green functions and ĈH¹](#R351-arithmetic-divisors-green), [Metrized line bundles and arithmetic divisors](#R351-pic-hat-iso-chow-hat), [Hermitian ℚ-lines and norms of hermitian line bundles](#R351-norm-and-rational-lines).
- **SchemeAndStackFoundations:SF.4.** As merged in TauCetiRoadmap (SchemeAndStackFoundations README §4.17): IsStrictNormalCrossings and IsNormalCrossings for divisors on Noetherian schemes, with the local-equation API (at a point of D the ideal is generated by a product of part of a regular system of parameters) and stability under smooth pullback, used for the boundary of smooth toroidal compactifications and for the local model of logarithmic singularities. The atlas SF.4 part packet is not accepted; this upstream target replaces its node id strict-normal-crossings. Needed by: [Hermitian metrics with logarithmic singularities](#R355-log-singular-metric), [The Faltings metric has logarithmic growth at the boundary](#R355-hodge-metric-log-singularities).

## Open inputs

- **G1: Bost's sharp lower bound for the Faltings height.** The constant −(g/2) log(2π) (Deligne normalisation) is due to Bost (Duke Math. J. 82 (1996) and his report 'Arakelov geometry of abelian varieties'), neither freely available. The existence of a constant c(g) (Faltings–Chai V.4.6, Deligne 1.21–1.22) and an effective constant (Bost Bourbaki 795 Appendice C, Pazuki Remark 1.4) are planned; the sharp value is recorded but not decomposed. Needed by: [A lower bound for the stable Faltings height](#R356-faltings-height-lower-bound).
- **G2: Silverman's formulas for elliptic curves.** Gaudron–Rémond's Lemma 7.9 quotes Silverman (Heights and elliptic curves, Prop. 1.1 and (10)), which is not freely available. The Faltings-height formula is derived independently in elliptic-period-comparison (checked against LMFDB for 11.a2); the formula for h(j) in the semistable case is the elementary identity v(Δ_min) = max(0, −v(j)); the numerical constant 2.95 relies on Faisant–Philibert's bound |j(τ)| ≥ e^{2π Im τ} − 1193, quoted by Gaudron–Rémond and not re-derived. Needed by: [The stable Faltings height of an elliptic curve and h(j)](#R355-elliptic-j-height-bound).
- **G4: de Rham cohomology of CM abelian schemes is free of rank one over O_σ ⊗ O_E.** Yuan–Zhang cite Colmez (Ann. of Math. 138 (1993), Lemme II.1.2) for the freeness of H¹_dR(𝒜_σ) as an O_σ ⊗ O_E-module for a CM abelian scheme with good reduction. AbelianSchemesAndArithmeticModuli A4 supplies H¹_dR and its Hodge sequence but not this CM freeness; Colmez's paper was not read. The CM Part II design is the natural owner. Needed by: [The Hodge filtration of a CM abelian scheme over a p-adic ring](#R354-cm-hodge-filtration-local).
- **G3: Raynaud's duality for differents of Néron-model isogenies without semistability.** Raynaud's Théorème 2.1.1 in the non-semistable case uses Bégueri's duality for pro-algebraic groups and the Greenberg functor (Raynaud §§2.2–2.4); no roadmap plans these. Every consumer of this roadmap that needs only stable heights uses the semistable case, which reduces to Cartier duality of finite flat kernels (requested from FiniteFlat R07.1). Needed by: [Differents of an isogeny and of its dual](#R354-dual-isogeny-differents), [The Hodge lines of A and its dual](#R352-dual-hodge-line).

## Ownership moves and structure

- **Rescope: ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems.** RS-06 makes R35 the owner of the hermitian degree, the Hodge metric, the stable height, the isogeny formula and the moduli/Hodge commensurability with logarithmic metrics. The accepted FaltingsFinitenessAndIsogenyTheorems packet (tier 17) still plans these as its own nodes; R35 (tier 16) now plans them. Re-point the R28 nodes to their R35 owners: R28.1/semiabelian-scheme-and-its-hodge-line-bundle → R35.2/hodge-line-of-group-scheme and R35.2/faltings-hermitian-form; R28.1/faltings-modular-height-of-a-semiabelian-model → R35.3/faltings-height; R28.1/metric-with-logarithmic-singularities-along-a-closed-subvariety → R35.5/log-singular-metric; R28.1/hodge-metric-has-logarithmic-singularities-along-the-boundary → R35.5/hodge-metric-log-singularities; R28.1/northcott-property-for-heights-from-log-singular-metrics → R35.5/log-singular-heights; R28.1/commensurability-of-the-modular-and-hodge-line-bundles → R35.5/modular-height-equals-faltings-height; R28.2/height-change-under-an-isogeny-of-semiabelian-models → R35.4/isogeny-height-formula; R28.2/bounded-denominators-of-height-differences-under-isogeny → R35.4/isogeny-height-bounds. R28 keeps the descent to K-isomorphism classes, the isogeny-class bound and the Tate/Shafarevich theorems.
- **Split: ArakelovGeometryAndAbelianHeights.** R35.1 holds two coherent groups: hermitian bundles over rings of integers, and arithmetic divisors with their pairing and heights on arithmetic varieties. Sub-layers of R35.1: 'R35.1a Hermitian bundles and the Arakelov degree' (hermitian-vector-bundle, hermitian-operations, arithmetic-degree, degree-independent-of-section, degree-additivity, degree-base-change, arakelov-divisors-of-number-field); 'R35.1b Arithmetic divisors, intersections and heights' (arithmetic-divisors-green, pic-hat-iso-chow-hat, arithmetic-degree-pairing, stack-weighted-degree, heights-of-points, metrized-heights-weil-machine, sup-metric-height-comparison).

## Mistakes in the sources

- **ArakelovGeometryAndAbelianHeights/E1** (Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, §2, Bemerkung d), p. 351 and §3, p. 354; error). The hermitian product on Γ(A, Ω^g) is printed as (i/2)^g times the integral of α ∧ β̄. Correction: Use (i^{g²}/2^g)∫ α ∧ β̄ = (i/2)^g(−1)^{g(g−1)/2}∫ α ∧ β̄, equivalently 2^{−g}|∫ α ∧ ᾱ| on the diagonal. Reason: For g = 2 and α = dz_1 ∧ dz_2 on a product of elliptic curves the printed expression is −(Im τ)² < 0, so it is not positive definite when g ≡ 2, 3 mod 4. Known: Recorded in the FaltingsFinitenessAndIsogenyTheorems packet (E1); Deligne (Bourbaki 616 §1.2) and Yuan (2026 §3.1.3) use positive normalisations.. Review: confirmed; Read on the GDZ scan at p. 351 (§2, Bemerkung d)) and p. 354 (§3): the product is printed as (i/2)^g ∫ α ∧ β̄. In linear coordinates α ∧ ᾱ = (−1)^{g(g−1)/2}(−2i)^g dx_1 ∧ dy_1 ∧ ⋯ ∧ dx_g ∧ dy_g for α = dz_1 ∧ ⋯ ∧ dz_g, so the printed form is (−1)^{g(g−1)/2} times the volume, negative for g ≡ 2, 3 mod 4, while i^{g²}/2^g gives the volume. Deligne (Bourbaki 616, p. 26) records Faltings' choice as 2^{−g}|α ∧ ᾱ|, with an absolute value.
- **ArakelovGeometryAndAbelianHeights/E2** (Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §2.1, p. 12 (arXiv v3; published p. 544); error). If an abelian variety A has multiplication by an order of a number field E, then E is totally real or CM. Correction: Assume E totally real or CM (as in the application); a general number field acting on A need not be. Reason: An abelian variety with a field of multiplication E of degree dividing 2g need not have E totally real or CM (e.g. E of mixed signature acting on a simple abelian variety of type IV), so the CM involution c is not defined in general. Known: Flagged by the extraction PAPER-YUAN-ZHANG-18 and its review. Review: confirmed; Read at p. 12 of arXiv v3: the text says that a field E acting on A through an order is totally real or CM. A simpler counterexample than the packet's: for an elliptic curve B without CM, End⁰(B³) = M_3(ℚ) contains every cubic field, and ℤ[∛2] acts on B³ through its regular representation, although ℚ(∛2) is neither totally real nor CM. The paper only uses CM fields, so nothing downstream is affected.
- **ArakelovGeometryAndAbelianHeights/E3** (Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, §2.2, proof of Theorem 2.3, p. 15 (arXiv v3); gap). As a ℤ_p-algebra O_{E,p} is generated by one element x. Correction: O_E ⊗ O_σ is monogenic over O_σ only after enlarging K (or locally after a suitable extension); Lemma 2.4 is stated here under that hypothesis. Reason: O_E ⊗ ℤ_p need not be monogenic over ℤ_p (e.g. when p splits in E into more primes of residue degree one than there are elements of 𝔽_p). Known: Flagged by the extraction PAPER-YUAN-ZHANG-18 (E5 repair). Review: confirmed; Read at p. 15 of arXiv v3 (proof of Theorem 2.3): O_{E,p} is asserted to be generated by one element over ℤ_p. If 2 splits completely in a quartic field E, O_E ⊗ ℤ_2 ≅ ℤ_2^4 has no single generator (a generator needs four distinct residues mod 2). After enlarging K so that the residue field of O_σ is large, O_E ⊗ O_σ is monogenic (each O_{E_𝔭} is monogenic over ℤ_p and the factors are combined by the Chinese remainder theorem), which is the form cm-hodge-filtration-local states.
- **ArakelovGeometryAndAbelianHeights/E4** (Éric Gaudron and Gaël Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, §7.6, proof of Lemme 7.9, p. 33 (arXiv v1, the only arXiv version; the Comment. Math. Helv. text was not read); misprint). After quoting Silverman's formula h_F(E) = (1/12[k:ℚ])·(log|N Δ_{E/k}| − Σ_σ log(|Δ(τ_σ)| y_σ^6)), the proof bounds |Δ(τ_σ)| below by e^{−1/9−2πy_σ} times (2π)^{−12}, and its constant B, hence the final 2.95, carries the corresponding factor (2π)^{12}. Correction: In the normalisation in which the quoted formula holds, Δ(τ) is the lattice discriminant (2π)^{12} q∏(1 − qⁿ)^{24}, so the lower bound is e^{−1/9−2πy}·(2π)^{12}. The printed inequality is true but loses a factor (2π)^{24}; with the factor (2π)^{12} the same argument gives h(E) ≤ h(j)/12 − 0.72 in Deligne's normalisation instead of + 2.95, and the optimal constant is ≈ −0.7486, attained at j = −1. Reason: With Δ = q∏(1 − qⁿ)^{24} the quoted formula, which has no −log 2π term, gives h_F(11.a2) ≈ 1.53, while the Faltings height of 11.a2 is −0.30801 (LMFDB, reproduced by R35.2/elliptic-period-comparison); the formula gives −0.30801 exactly when Δ(τ) = (2π)^{12}η(τ)^{24}. Recomputing B = 1194(2π/log 1194)^6 e^{1/9}(2π)^{12} reproduces ½ log π + (1/12) log B ≈ 2.950; with (2π)^{−12} in place of (2π)^{12} in B it is ≈ −0.726. Known: new. Review: confirmed; Added by this review; both numerical checks recomputed in double precision from the q-products.

## Acceptance tests for the roadmap

- **Finite field extension.** degree-base-change scales Arakelov degrees by [L:K];
  field-extension-comparison shows h(A_L/L) ≤ h(A/K) with equality under semistable reduction, and
  stable-faltings-height is unchanged by extension.
- **Products.** product-isometry and stable-height-properties give h(A × B) = h(A) + h(B) and
  h_st(A^n) = n·h_st(A).
- **Multiplication by n.** For [n] on an abelian scheme of relative dimension g the different is
  (n^g), so the isogeny formula reads h = h + g log n − g log n (isogeny-different,
  isogeny-height-formula).
- **An elliptic example against its period lattice.** For 11.a2 over ℚ the elliptic formula of
  elliptic-period-comparison, with the period τ ≈ ½ + 1.14939i and Δ_min = −11⁵, gives
  h_Fal ≈ −0.3080098, LMFDB's Faltings height; ‖dz‖² is the covolume of the period lattice.
- **Stable versus non-stable at bad reduction.** For 27.a3 (additive at 3) h(E/ℚ) > h_st(E), with the
  difference at least (log 3)/[ℚ(E[15]):ℚ] (bad-place-correction-bound).
- **A quasi-projective embedding is not enough.** The comparison of modular and Faltings heights
  uses the integral toroidal compactification and the logarithmic growth of the metric at the
  boundary; a continuous metric on an embedding of A_g alone gives no two-sided comparison
  (modular-height-equals-faltings-height, hodge-metric-log-singularities).
