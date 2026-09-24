# Perfectoid rings and spaces (part from P0)

Blueprint for the roadmap `PerfectoidSpaces`, job `BP-PerfectoidSpaces--P0` (issue #973).
Packet: `research/blueprint/packets/PerfectoidSpaces--P0.json`. Suggested Lean file:
`research/blueprint/suggested/PerfectoidSpaces--P0.lean`. Handoff:
`research/blueprint/handoff/BP-PerfectoidSpaces--P0.md`.

**Status: partial.** Six of the eight layers in scope carry the coverage status the reviewed decomposition
gave them, with its `remaining` lists kept verbatim and a note per layer added; P4 and P6 have no decomposed
source and are marked `not_read` rather than invented. The packet has
33 nodes, 54 API items and 33 unit tests, cites 28 declarations of the pinned libraries, records 11 gaps and
makes five requests to other roadmaps.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Every source is freely available and was opened and read; the sections read are listed in the packet.

- **`sch12-perfectoid`** — Peter Scholze, *Perfectoid spaces*. arXiv:1111.4914v1, 21 November 2011 (library copy; published as Publ. Math. IHES 116 (2012) 245-313); printed page numbers of the arXiv version
  <https://arxiv.org/abs/1111.4914>, read 2026-09-15.
  SHA-256 `065441a872c5861560014f5c7675fdd4606b5796684f6a829747f01afee18e7b`.
- **`ecd-2026`** — Peter Scholze, *Etale cohomology of diamonds*. Version prepared for the Asterisque volume (bibliography dated 2026; cites [FS26] as 'this Asterisque volume'); library copy EtCohDiamonds.pdf; arXiv:1709.07343 is the preprint
  <https://arxiv.org/abs/1709.07343>, read 2026-09-15.
  SHA-256 `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1`.
- **`gr-almost`** — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*. arXiv:math/0201175v3, sixth and final release, 22 July 2002 (statement numbering differs from the LNM 1800 book numbering used in Sch12's citations; correspondences noted per node)
  <https://arxiv.org/abs/math/0201175>, read 2026-09-15.
  SHA-256 `c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8`.

## What this packet is, and what it rests on

This roadmap already had a **reviewed integrated decomposition** of Scholze's *Perfectoid spaces*,
*Étale cohomology of diamonds* and Gabber–Ramero's *Almost ring theory*. This packet keeps all 33 node
identifiers with their statements, hypotheses, proof steps, acceptance tests and verified locators, and
adds prerequisites resolved to the pinned libraries or to a named supplier stage, an API outline with unit
tests for each of the five definitions and six constructions, planets, and a coverage record per layer.
The restructuring proposal RS-05 is accepted and binding; the layers are planned only as far as it keeps.

**There is no reviewed library audit for this roadmap**, so the boundary with the pinned libraries was
drawn by reading the declaration index directly for this packet. What is already there is not negligible:

- Mathlib has `PreTilt` (the inverse limit along Frobenius), `PreTilt.untilt`,
  `WittVector.fontaineTheta` as a ring homomorphism, `surjective_fontaineTheta`, and `BDeRhamPlus`. The
  node on `θ` therefore plans only the **kernel** half of its statement.
- Tau Ceti has Huber pairs, the adic spectrum `Spa`, rational subsets with their basis, covering,
  refinement and perturbation theory, and the localization with its universal property. The rational
  localization and tilting-homeomorphism nodes build on those rather than rebuilding adic geometry.

Each baseline citation says which half of which node it discharges. A reviewed audit would put this on a
firmer footing and is recorded as a gap.

**Source hashes.** Two of the three sources are arXiv items and both were re-downloaded and re-hashed for
this packet: `arXiv:1111.4914` and `arXiv:math/0201175` reproduce their recorded SHA-256 byte for byte.
The third does not, and the reason is recorded as a gap: its own edition field says the copy inspected was
a library copy of the Astérisque version while its `url` points at the arXiv preprint. All five arXiv
versions were downloaded and hashed here and none matches, which corroborates that the two are different
documents — so the locators into that source rest on the decomposition's reading and were not re-checked.

Five requests are filed:

- **`AdicEtaleGeometry:A0`** — Adic spaces with their structure presheaf and the adic spectrum of a Huber pair, in the generality the sheaf theorem and the perfectoid space construction of this packet are stated over. The pinned Tau Ceti library already has the adic spectrum and the rational subsets; what is requested is the adic space itself and its structure presheaf.
- **`AdicEtaleGeometry:A1`** — The etale site of an adic space, with finite etale and etale morphisms and the descent statements attached to them. The etale site comparison of P3 and the finite-stage descent of P5 are statements about that site, which this packet does not construct.
- **`AdicSpacesPartII:R3`** — Huber's locally noetherian etale theory and the comparison of etale topoi under a tilde-limit, which the last node of P7 consumes. The decomposition records this as a gap and names Huber's papers; the atlas assigns the theory to this stage.
- **`DerivedDeRhamCohomology:DD.0`** — The cotangent complex in the generality the vanishing statement of P1 needs, that is for an almost algebra over an almost base. The pinned library has the naive cotangent complex in one degree only; the almost version is neither in the libraries nor planned here.
- **`DiamondsAndVStacks:D0`** — The abstract cutoff cardinal arithmetic that RS-05 assigns to that layer and that the cardinal bounds of the cofiltered limits in P5 and of the presentations in P6 are stated against.

## Layers

---

## P0 Almost mathematics with a reusable base ideal

**Coverage: partial.** Gabber and Ramero's almost mathematics, in the generality RS-05 narrows this layer to: almost modules over an idempotent flat base ideal with their quotient and adjoints, the almost finiteness conditions, and the unique lifting of finite etale almost algebras along a complete flat base. The pinned libraries have flatness, projectivity, finite type, etale and formally etale algebras and adic completeness in the ordinary sense; they have no almost mathematics at all, so every node here is new and every ordinary notion it is modelled on is cited as baseline.

**Remaining in this layer:**

- Gabber-Ramero's general basic setup (V, m) with an idempotent flat ideal, and the actual proofs of GR §2.2-2.4 (Hom formula, adjoints, Proposition 2.4.18, 4.3.27, Theorem 4.1.14) and of GR Theorem 5.3.27/5.3.24 (lifting of finite etale algebras along tight henselian ideals), which Sch12 only cites.
- Instantiation for R^+ (rather than K°) and comparison of the almost categories of R^+ and R° (ECD 3.21-3.23 state the equivalence R°a-mod ≅ R+a-mod without proof).
- Descent of almost modules along faithfully flat maps and the 'almost exact ⇒ exact after inversion' statements demanded by the stage: not located in the sections read.

Almost mathematics is the price of the whole theory and it is paid here. Modules annihilated by
the base ideal are declared zero; what survives is a tensor category in which flatness, projectivity, finite
presentation and étaleness all have *approximate* versions — the lifting exists after multiplying by an
arbitrary element of the ideal, not on the nose. RS-05 narrows the layer to this general setting, for an
abstract idempotent flat base ideal, and that is what is planned.

Neither pinned library has any of it. What they do have — flatness, projectivity, finite type, étale and
formally étale algebras, adic completeness — is cited as baseline, because each almost notion has to be stated
against, and compared with, its ordinary counterpart.

**Planets of this layer** (3): *Almost modules*, *Almost finite etale algebras*, *Finite etale lifting*.

### Nodes (3)

#### `almost-modules-over-perfectoid-base` — Almost modules over (K°, m) for a perfectoid field

*definition.* **Planet:** *Almost modules*.

**Statement.** Let K be a perfectoid field, K° its valuation ring and m = K°° = {x : |x|<1} its maximal ideal. Then m² = m, the almost-zero K°-modules (mM = 0) form a thick Serre subcategory, and K°a-mod := K°-mod/(m-torsion) is an abelian tensor category with Hom_{K°a}(Mᵃ, Nᵃ) = Hom_{K°}(m ⊗ M, N), internal alHom, a right adjoint M ↦ M_* = Hom_{K°a}(K°a, M) to localization with (M_*)ᵃ ≅ M and (Mᵃ)_* = Hom(m, M), and a left adjoint M ↦ M_! = m ⊗ M_*. Almost algebras and their modules are defined abstractly in this tensor category, and every K°a-algebra is Aᵃ_* for the K°-algebra A_*.

**Hypotheses.**

- K is a perfectoid field (Sch12 Definition 3.1); the base ideal is m = K°°. Idempotence m² = m, which Lemma 4.2 uses without comment, follows from nondiscreteness of the rank-1 valuation alone (packet-authored: for x ∈ m choose y ∈ m with |y|² ≥ |x|); p-divisibility of the value group (Lemma 3.2) is not needed for it.
- This is the special case (V, m) = (K°, K°°) of Gabber-Ramero's basic setup; the general abstract base (idempotent flat ideal) demanded by stage P0 was not read in this session.

**Construction, or proof, in steps.**

1. Thickness (Lemma 4.2): the only nontrivial closure is under extensions; an extension of two almost-zero modules is killed by m², and m² = m.
2. Hom formula, tensor structure and the adjoints are cited from Gabber-Ramero §2.2 (Sch12 Propositions 4.4-4.6); no almost-zero elements exist in Hom_{K°a}(X, Y).
3. The left adjoint M_! = m ⊗ M_* is used in the proof of Lemma 5.3(iv) to show that both M ↦ M_* and N ↦ Nᵃ commute with inverse limits.

**Acceptance.**

- For K = completed Q_p(p^{1/p^∞}) the residue field K°/m is almost zero, and Hom_{K°a}(K°a, K°a/ϖ) = Hom(m, K°/ϖ) contains the sums Σ ϖ^{1-1/p^i} x_i that are not in the image of K° (Remark 4.8), so K°a is not projective in the categorical sense.
- m ⊗ M_* → M_* is the counit and (M_*)ᵃ → M is an isomorphism for every almost module M.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `AlmostModule` | data | The category of almost modules over the pair consisting of the ring of integers and the maximal ideal, obtained by killing the modules annihilated by the ideal. |
| `AlmostModule.localisation` | structure | The quotient functor, with its left and right adjoints. |
| `AlmostModule.tensor` | structure | The tensor product and internal hom on almost modules. |
| `AlmostModule.almostZero_iff` | characterisation | A module is almost zero exactly when the ideal annihilates it. |
| `AlmostModule.idempotent_ideal` | structure | The hypothesis on the base ideal: it is idempotent and flat as a module, which is what makes the quotient well behaved. |

**Uses.**

- `PerfectoidSpaces:P0/almost-finite-projective-and-finite-etale-algebras`: the finiteness conditions are conditions in this category
- `PerfectoidSpaces:P1/almost-integral-dictionary`: the dictionary between perfectoid algebras and almost algebras is an equivalence of these categories

**Unit tests.** A plausible wrong definition fails one of these.

- `almost_zero`: A module killed by the maximal ideal is almost zero, and a nonzero module killed by it is not zero; the two notions must not be identified.
- `idempotent_hypothesis`: The base ideal is idempotent and flat; for an ideal that is not idempotent the quotient category is not a tensor category in the same way, so the hypothesis is not decorative.
- `perfectoid_field_case`: For a perfectoid field the maximal ideal of the ring of integers satisfies the hypothesis, which is the case the rest of the roadmap uses.

**Prerequisites.**

- `mathlib:Module.Flat`
- `mathlib:Valuation`
- `mathlib:PerfectRing`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 4, Definition 4.1, Lemma 4.2, Definition 4.3, Propositions 4.4-4.6, Remark 4.8, pp. 18-20 (extraction lines 926-1030).

  > In general, one gets that m^2 M = 0. But in our situation, m^2 = m, so M is almost zero.

  Idempotence of m is the only input for thickness; the rest of the node records the categorical package Sch12 imports from Gabber-Ramero §2.2.

#### `almost-finite-projective-and-finite-etale-algebras` — Almost flat, almost projective, almost finitely presented and finite etale almost algebras

*definition.* **Planet:** *Almost finite etale algebras*.

**Statement.** Over a K°a-algebra A: M is flat if M ⊗_A – is exact (equivalently all Tor_i^R(N, X), i>0, are almost zero when M = Nᵃ); almost projective if alHom_A(M, –) is exact (equivalently all Ext^i_R(N, X), i>0, almost zero); almost finitely generated/presented if for every ε ∈ m there is a finitely generated/presented R-module N_ε with a map N_ε → N whose kernel and cokernel are killed by ε, uniformly so if the number of generators can be bounded independently of ε. 'Finite projective' (flat and almost finitely presented) equals almost projective and almost finitely generated (GR 2.4.18). A uniformly finite projective module has a unique rank decomposition A = A_0 × ... × A_k with ∧^i M_i invertible and ∧^{i+1} M_i = 0. A → B is unramified if there is an idempotent e ∈ (B ⊗_A B)_* with μ(e) = 1 and ker(μ)_* e = 0, etale if unramified and flat, finite etale if etale and B almost finitely presented; for B finite projective, A → B is finite etale iff the trace form t_{B/A} is a perfect pairing (GR 4.1.14).

**Hypotheses.**

- A is an algebra over K°a for a perfectoid field K. The definitions are Gabber-Ramero's, specialized to this base: Sch12 Definition/Proposition 4.7 cites [14] Definition 2.4.4, §2.4.10 and Remark 2.4.12(i) for flatness and almost projectivity, and Definition 2.3.8, Remark 2.3.9(i) and Corollary 2.3.13 for almost finite generation/presentation; Proposition 4.10 cites [14] Proposition 2.4.18; Theorem 4.11 cites [14] Proposition 4.3.27 and Remark 4.3.10(i); Theorem 4.16 cites [14] Theorem 4.1.14. All GR numbers in Sch12 are LNM 1800 book numbers.
- The term 'finite etale' is Sch12's, not Gabber-Ramero's; it means etale plus almost finitely presented, hence B is finite projective over A.

**Construction, or proof, in steps.**

1. The Tor/Ext reformulations and the independence of the almost finite presentation property from the representative N are quoted from GR §2.3-2.4 (Sch12 Definition/Proposition 4.7, Remark 4.8).
2. Trace form: for P finite projective, P* = alHom(P, A), End(P)ᵃ = P ⊗_A P*, giving tr_{P/A}; t_{B/A}(b ⊗ b') = tr(b b' ·) is defined on almost elements via B_* → End_{A_*}(B_*) (Remark 4.15).
3. The rank decomposition is GR Proposition 4.3.27 with Remark 4.3.10(i) (Sch12 Theorem 4.11), not reproved.

**Acceptance.**

- Example 4.9: for K = completed Q_p(p^{1/p^∞}), p ≠ 2, and L = K(p^{1/2}), the maps K° ⊕ p^{1/2p^n} K° → L° have cokernel killed by p^{1/2p^n}, so L°a is uniformly almost finitely presented over K°a.
- GR Proposition 2.4.18 reads: every almost finitely generated projective module is almost finitely presented, and every almost finitely presented flat module is almost projective.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `AlmostFlat` | data | Almost flatness of an almost module. |
| `AlmostProjective` | data | Almost projectivity, defined by an approximate lifting property rather than by a splitting. |
| `AlmostFinitelyPresented` | data | Almost finite presentation. |
| `AlmostFiniteEtale` | data | Almost finite etale algebras, defined by almost projectivity of the algebra over itself tensor itself. |
| `AlmostFiniteEtale.baseChange` | compatibility | Stability of the condition under base change. |

**Uses.**

- `PerfectoidSpaces:P0/finite-etale-lifting-along-complete-flat-almost-algebras`: the lifting theorem is about these algebras
- `PerfectoidSpaces:P3/almost-purity-theorem`: almost purity concludes that a finite etale cover is almost finite etale

**Unit tests.** A plausible wrong definition fails one of these.

- `approximate_lifting`: Almost projectivity is an approximate lifting property: the lift exists after multiplying by an arbitrary element of the ideal. A definition demanding an exact splitting is strictly stronger and fails for the standard examples.
- `base_change`: The conditions are stable under base change.
- `etale_not_almost_etale`: A finite etale algebra in the ordinary sense is almost finite etale, and the converse fails; the two must not be identified.

**Prerequisites.**

- `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`
- `mathlib:Module.Projective`
- `mathlib:Algebra.Etale`
- `mathlib:Algebra.FiniteType`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 4, Definition/Proposition 4.7, Example 4.9, Proposition 4.10, Theorem 4.11, Definitions 4.12-4.14, Theorem 4.16, pp. 19-21 (extraction lines 1000-1090).

  > A morphism A → B of K°a-algebras is said to be finite etale if it is etale and B is an almost finitely presented A-module.

  Fixes the exact meaning of 'finite etale almost algebra' used in the tilting of finite etale covers and in almost purity.

- gr-almost — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*, Proposition 2.4.18 (extraction line 1376) and Theorem 4.1.14 (extraction line 4128).

  > An almost finite projective morphism φ : A → B of almost V-algebras is etale if and only if the trace form t_{B/A} is a perfect pairing.

  Confirms the trace-form criterion cited as Sch12 Theorem 4.16 in the arXiv numbering of Gabber-Ramero.

#### `finite-etale-lifting-along-complete-flat-almost-algebras` — Finite etale almost algebras lift uniquely modulo ϖ

*theorem.* **Planet:** *Finite etale lifting*.

**Statement.** Let A be a K°a-algebra which is flat over K°a and ϖ-adically complete (A ≅ lim A/ϖⁿ). Then B ↦ B ⊗_A A/ϖ is an equivalence A_fet ≅ (A/ϖ)_fet. Every B ∈ A_fet is again flat over K°a and ϖ-adically complete, and B is uniformly finite projective over A iff B ⊗_A A/ϖ is uniformly finite projective over A/ϖ.

**Hypotheses.**

- A flat over K°a and ϖ-adically complete; ϖ ∈ K a fixed element with |p| ≤ |ϖ| < 1.
- The equivalence is imported from Gabber-Ramero Theorem 5.3.27 (tight ideal I = ϖA of an inverse system A_n = A/ϖⁿ); Sch12 marks the remaining assertions 'easy' and gives no argument.

**Construction, or proof, in steps.**

1. GR 5.3.27: for a tight ideal, the functor A_∞-Ét_afp → A_0-Ét_afp is an equivalence, reduced via GR 3.2.28(ii) (lifting along nilpotent thickenings) and GR 5.3.24 (lifting of almost finitely generated projective modules) to Claim 5.3.29 that an algebra whose reduction is unramified is unramified.
2. Flatness and completeness of B and the uniform bound are asserted without proof in Sch12 ('The rest is easy').

**Acceptance.**

- Applied with A = K°a: K°a_fet ≅ (K°a/ϖ)_fet, the middle link in the chain K_fet ≅ K°a_fet ≅ (K°a/ϖ)_fet = (K♭°a/ϖ♭)_fet ≅ K♭°a_fet ≅ K♭_fet.
- A finite etale cover of A/ϖ has exactly one deformation to a finite etale A-algebra up to unique isomorphism.

**Prerequisites.**

- `PerfectoidSpaces:P0/almost-finite-projective-and-finite-etale-algebras`
- `mathlib:Algebra.FormallyEtale`
- `mathlib:IsAdicComplete`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 4, Theorem 4.17 and proof, p. 21 (extraction lines 1091-1099).

  > Then the functor B ↦ B ⊗_A A/ϖ induces an equivalence of categories A_fet ≅ (A/ϖ)_fet. ... Proof. The first part follows from [14], Theorem 5.3.27. The rest is easy.

  The theorem statement and the exact import boundary (GR 5.3.27) for the lifting equivalence.

- gr-almost — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*, Section 5.3, 5.3.21-5.3.24 and Theorem 5.3.27 with the opening of its proof (extraction lines 6445-6487).

  > Theorem 5.3.27. In the situation of (5.3.21), suppose that I is tight. Then (5.3.23) is an equivalence of categories.

  Confirms that the cited result is the lifting equivalence A_∞-Ét_afp → A_0-Ét_afp for tight ideals; its proof (Claim 5.3.29 and Theorem 5.3.24) was not read.

---

## P1 Perfectoid Tate rings, tilts and marked untilts

**Coverage: partial.** Perfectoid fields and perfectoid Tate rings with their tilts, the tilting equivalence, and Fontaine's theta. Part of this layer is already built: the pinned Mathlib has the pre-tilt as an inverse limit along Frobenius, the untilt map, Fontaine's theta as a ring homomorphism and its surjectivity under surjectivity of Frobenius modulo p. The node on theta therefore plans only the second half of its statement, that the kernel is generated by a primitive element of degree one, and the tilting nodes build their ring and topological structure on the pinned pre-tilt rather than redefining it. There is no reviewed library audit for this roadmap, so that boundary was determined by reading the pinned declaration index for this packet and is recorded in the baseline notes.

**Remaining in this layer:**

- Tate-ring generality of the tilting equivalence (ECD Theorem 3.13: 'the proof works in general') and of the untilt classification (ECD Theorem 3.17, 'straightforward to check'): neither is proved in the sources read; KL15 Theorem 3.6.5 and Fontaine's Bourbaki talk are the cited proofs.
- Almost-context deformation theory (GR Propositions 3.2.9, 3.2.16) and the almost cotangent-complex triangle for the extension 0 → A → A_n → A_{n-1} → 0 (Sch12 cites GR 'Theorem 2.5.36' in book numbering; the arXiv Theorem 2.5.36 is a different statement): read as statements only.
- GR Lemma 6.5.13 i) (Frobenius vanishing criterion in the almost setting) not located in the arXiv extraction; Sch12 sketches the classical version.
- Examples demanded by the stage (non-field perfectoid Tate ring ECD 3.4(iv)) recorded as examples only.
- ECD Remark 3.7 (a perfectoid Tate ring which is a field is a perfectoid field, attributed to Kedlaya [Ked18]) and ECD Proposition 3.8 (equivalence with the Sch12 field definition, stated without proof): the Kedlaya reference was not read.

Tilting. A perfectoid field has a p-divisible value group and surjective Frobenius mod p; its
tilt is the inverse limit along Frobenius, and the sharp map back is multiplicative but not additive. The layer
goes from there to the tilting equivalence between perfectoid algebras over `K` and over `K♭`, and to Fontaine's
`θ`.

**Part of this layer is already built, and the packet says so.** Mathlib has `PreTilt` as the inverse limit
along Frobenius, `PreTilt.untilt`, `WittVector.fontaineTheta` as a ring homomorphism, and
`surjective_fontaineTheta` — surjectivity of `θ` under surjectivity of Frobenius mod p. So the node on `θ`
plans only the *second* half of its statement, that the kernel is generated by a primitive element of degree
one, and the tilting nodes build on the pinned pre-tilt rather than redefining the limit. There is no reviewed
audit for this roadmap; that boundary was drawn by reading the pinned declaration index for this packet.

**Planets of this layer** (6): *Perfectoid field*, *Tilt of a perfectoid field*, *Perfectoid Tate ring*, *The tilting equivalence*, *Tilt of a perfectoid Tate ring*, *Fontaine theta and its kernel*.

### Nodes (11)

#### `perfectoid-field-definition` — Perfectoid fields and p-divisibility of the value group

*definition.* **Planet:** *Perfectoid field*.

**Statement.** A perfectoid field is a complete nonarchimedean field K of residue characteristic p > 0 whose rank-1 valuation is nondiscrete and such that Frobenius is surjective on K°/p. Then the minimal value group Γ = |K^×| is p-divisible. In characteristic p a perfectoid field is the same as a complete perfect nonarchimedean field. Equivalently (ECD Definition 3.6 / Proposition 3.8) a nonarchimedean field is perfectoid iff it is a perfectoid Tate ring; in particular Q_p and every discretely valued field are not perfectoid.

**Hypotheses.**

- Completeness, nondiscreteness of the valuation (needed to exclude unramified extensions of Q_p), residue characteristic p, Frobenius surjective on K°/p.
- ECD's Remark 3.3 gives the exclusion of discretely valued fields via the length argument on K°/ϖ vs K°/ϖ^p.
- ECD Remark 3.7: it is not clear a priori that a perfectoid Tate ring which is a field is a perfectoid field; ECD attributes the affirmative answer to Kedlaya [Ked18], which was not read.

**Construction, or proof, in steps.**

1. Lemma 3.2: Γ ≠ |p|^Z, so Γ is generated by |x| with |p| < |x| ≤ 1; choose y with |x − y^p| ≤ |p|, then |y|^p = |x|, hence Γ is p-divisible.
2. ECD Remark 3.3: if K were discretely valued with ϖ^p | p, K°/ϖ and K°/ϖ^p are Artin local rings of different lengths, so Φ cannot be an isomorphism.

**Acceptance.**

- Completed Q_p(p^{1/p^∞}), Q_p^cycl and completed F_p((t))(t^{1/p^∞}) are perfectoid; Q_p is not (ECD Remark 3.3, Example 3.4).

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `IsPerfectoidField` | data | The predicate on a complete nonarchimedean field of residue characteristic p: the value group is p-divisible and the Frobenius on the ring of integers modulo p is surjective. |
| `IsPerfectoidField.valueGroup_divisible` | characterisation | The value group is p-divisible and in particular not discrete. |
| `IsPerfectoidField.frobenius_surjective` | characterisation | Frobenius is surjective modulo p. |
| `IsPerfectoidField.complete` | structure | Completeness, which is part of the definition and not a consequence. |
| `IsPerfectoidField.charP_case` | example | In characteristic p the condition says exactly that the field is perfect and complete. |

**Uses.**

- `PerfectoidSpaces:P1/tilt-of-perfectoid-field`: the tilt is constructed from the two conditions
- `PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields`: the theorem is that the class is stable under finite extension

**Unit tests.** A plausible wrong definition fails one of these.

- `discrete_valuation_is_not_perfectoid`: The p-adic numbers are not a perfectoid field: the value group is discrete, hence not p-divisible.
- `cyclotomic_tower`: The completion of the field obtained by adjoining all p-power roots of unity is perfectoid, which is the motivating example.
- `characteristic_p`: In characteristic p the condition reduces to perfect and complete; a definition that does not reduce to this is wrong.

**Prerequisites.**

- `mathlib:Valuation`
- `mathlib:frobenius`
- `mathlib:UniformSpace.Completion`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 3, Definition 3.1 and Lemma 3.2 with proof, p. 15 (extraction lines 753-765).

  > As Γ ≠ |p|^Z, the group Γ is generated by the set of all |x| for x ∈ K with |p| < |x| ≤ 1. For such x, choose some y such that |x − y^p| ≤ |p|. Then |y|^p = |y^p| = |x|

  The proof of p-divisibility, which is used to normalize ϖ with compatible p-power roots and to define the almost setting.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Remark 3.3, Definition 3.6, Proposition 3.8, pp. 14-15 (extraction lines 645-698).

  > The field Q_p is not perfectoid, even though the Frobenius map on F_p is an isomorphism. The issue is that there is no element ϖ ∈ Z_p whose p-th power divides p.

  Supports the stage's insistence that surjectivity of Frobenius on the residue field is not enough.

#### `tilt-of-perfectoid-field` — Tilt of a perfectoid field and the sharp map

*construction.* **Planet:** *Tilt of a perfectoid field*.

**Statement.** Let K be perfectoid and ϖ ∈ K^× with |p| ≤ |ϖ| < 1. Projection gives a multiplicative homeomorphism lim_{x↦x^p} K° ≅ lim_Φ K°/ϖ, independent of ϖ, with a multiplicative continuous map x ↦ x♯ to K° given by x♯ = lim_n x_n^{p^n} for arbitrary lifts x_n. There is ϖ♭ ∈ lim_Φ K°/ϖ with |(ϖ♭)♯| = |ϖ|, and K♭ := (lim_Φ K°/ϖ)[(ϖ♭)^{-1}] = lim_{x↦x^p} K (multiplicative homeomorphism) is a perfectoid field of characteristic p with K♭° = lim K°, valuation |x|_{K♭} = |x♯|_K, |K♭×| = |K^×|, K♭°/ϖ♭ ≅ K°/ϖ and K♭°/m♭ = K°/m. If char K = p then K♭ = K. Replacing ϖ by (ϖ♭)♯ one may assume ϖ has a compatible system of p-power roots.

**Hypotheses.**

- K perfectoid field; ϖ with |p| ≤ |ϖ| < 1 (so ϖ | p in K°, used in the convergence estimate).
- The sharp map is multiplicative and continuous but not additive (only stated as multiplicative).

**Construction, or proof, in steps.**

1. Well-definedness of x♯: if x_n' is another lift, x_n − x_n' ∈ ϖK° and by induction (x_n')^{p^i} − x_n^{p^i} is well defined in K°/ϖ^{i+1}, using ϖ | p; so x_n^{p^n} is well defined mod ϖ^{n+1} and the limit exists.
2. Inverse of the projection: x ↦ (x♯, (x^{1/p})♯, ...).
3. Existence of ϖ♭: pick ϖ_1 with |ϖ_1|^p = |ϖ|, lift the sequence (0, ϖ_1, ...) using surjectivity of Φ on K°/ϖ; |(ϖ♭)♯ − ϖ_1^p| ≤ |ϖ|², hence |(ϖ♭)♯| = |ϖ|.
4. K♭ → lim_{x↦x^p} K is a homeomorphism, the topology on lim_Φ K°/ϖ is induced by x ↦ |x♯|, K♭ is perfect and complete, hence perfectoid of characteristic p.

**Acceptance.**

- For K = completed Q_p(p^{1/p^∞}), K♭ = completed F_p((t^{1/p^∞})) with t = (p, p^{1/p}, ...) and t♯ = p.
- |(ϖ♭)♯| = |ϖ| and K♭°/ϖ♭ ≅ K°/ϖ via x ↦ x♯.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `tiltField` | data | The tilt of a perfectoid field, the inverse limit of the ring of integers modulo p along Frobenius, made into a field. |
| `tiltField.sharp` | data | The sharp map from the tilt to the original field, the projection to the zeroth component. |
| `tiltField.isPerfectoid` | structure | The tilt is again a perfectoid field, of characteristic p. |
| `tiltField.valueGroup` | characterisation | The value groups of a field and of its tilt are identified. |
| `tiltField.charP` | projection | The tilt has characteristic p, whatever the characteristic of the field. |

**Uses.**

- `PerfectoidSpaces:P1/continuous-valuations-under-tilting`: the correspondence of valuations is stated through the sharp map
- `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`: the equivalence extends this construction from fields to algebras

**Unit tests.** A plausible wrong definition fails one of these.

- `value_groups_agree`: The value group of the tilt is the same as that of the field; a construction that changes it is wrong.
- `char_p`: The tilt has characteristic p even when the field has characteristic zero, which is the whole point of the construction.
- `tilt_of_char_p_is_itself`: For a field already of characteristic p the tilt is canonically the field itself.

**Prerequisites.**

- `PerfectoidSpaces:P1/perfectoid-field-definition`
- `mathlib:PreTilt`
- `mathlib:ModP`
- `mathlib:frobenius`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 3, Lemma 3.4 (i)-(iv), Remark 3.5 and proof, pp. 15-17 (extraction lines 781-879).

  > Then we claim that the limit x♯ = lim_{n→∞} x_n^{p^n} exists and is independent of all choices. For this, it is enough to see that x_n^{p^n} gives a well-defined element of K°/ϖ^{n+1}.

  The construction of the sharp map and the tilt exactly as stated, including the role of ϖ | p.

#### `continuous-valuations-under-tilting` — Continuous valuations of K and K♭ correspond

*lemma.*

**Statement.** For a perfectoid field K with tilt K♭, |·| ↦ |·|♭, |x|♭ := |x♯|, is a bijection between continuous valuations of K up to equivalence and continuous valuations of K♭ up to equivalence.

**Hypotheses.**

- K perfectoid; continuity of valuations in Huber's sense (open valuation subrings K^+ ⊂ K° contain m).

**Construction, or proof, in steps.**

1. |·|♭ is a valuation: only the ultrametric inequality is nontrivial and follows from |x+y|♭ = lim |(x^{1/p^n})♯ + (y^{1/p^n})♯|^{p^n} ≤ max(|x♯|, |y♯|).
2. Continuous valuations correspond to open valuation subrings K^+ ⊂ K°, which contain m, hence to valuation subrings of K°/m = K♭°/m♭; this bijection is the one described.

**Acceptance.**

- The rank-1 valuation of K maps to the rank-1 valuation of K♭ defined in Lemma 3.4(iii); higher-rank continuous valuations correspond to valuation subrings of the common residue ring K°/m.

**Prerequisites.**

- `PerfectoidSpaces:P1/tilt-of-perfectoid-field`
- `mathlib:Valuation.IsEquiv`
- `tauceti:TauCeti.ValuationSpectrum.spa`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 3, Proposition 3.6 and proof, p. 17 (extraction lines 880-898).

  > We see that open valuation subrings K^+ ⊂ K° are in bijection with valuation subrings in K°/m = K♭°/m♭.

  The proof mechanism, reused for the surjectivity part of the tilting homeomorphism of Spa (Corollary 6.7(iii)).

#### `perfectoid-tate-rings-and-algebras` — Perfectoid Tate rings; perfectoid K-algebras; characteristic p and field cases

*definition.* **Planet:** *Perfectoid Tate ring*.

**Statement.** (ECD 3.1) A Tate ring R is perfectoid if it is complete, uniform (R° bounded), and there is a pseudo-uniformizer ϖ with ϖ^p | p in R° such that Φ: R°/ϖ → R°/ϖ^p is an isomorphism. Injectivity of Φ is automatic for any complete Tate ring with ϖ^p | p, and the condition is equivalent to surjectivity of Φ: R°/p → R°/p, independent of ϖ. (Sch12 5.1) Over a perfectoid field K, a perfectoid K-algebra is a Banach K-algebra R with R° open and bounded and Φ surjective on R°/ϖ; then Φ: R°/ϖ^{1/p} ≅ R°/ϖ, R is reduced, and if char K = p, R is perfectoid iff R is perfect (given R° open and bounded). A topological ring with pR = 0 is a perfectoid Tate ring iff it is a perfect complete Tate ring (uniformity is automatic).

**Hypotheses.**

- Tate ring: has an open bounded subring and a topologically nilpotent unit; completeness and uniformity are part of the definition.
- In Sch12 the base field K is perfectoid and ϖ ∈ K; in ECD ϖ is any pseudo-uniformizer with ϖ^p | p in R°.

**Construction, or proof, in steps.**

1. Automatic injectivity (ECD Remark 3.2): if x^p = ϖ^p y with y ∈ R°, then (x/ϖ)^p ∈ R°, so x/ϖ ∈ R°.
2. Independence of ϖ / equivalence with Φ surjective on R°/p: successive ϖ^p-adic approximation writes x = x_0^p + ϖ^p x_1^p + ..., so x ≡ (x_0 + ϖx_1 + ...)^p mod p.
3. Char p (ECD Prop. 3.5): if R is perfect, Φ is an open bijection on R by Banach's open mapping theorem, giving ϖ^n R_0 ⊂ Φ(R_0) and hence Φ^{-k}(R_0) ⊂ ϖ^{-n} R_0 for all k, so R° ⊂ ϖ^{-n}R_0 is bounded; conversely R°/ϖⁿ ≅ R°/ϖ^{np} for all n gives Φ bijective on R° after completion.
4. Reducedness (Sch12 5.8): a nonzero nilpotent x gives Kx ⊂ R°, contradicting boundedness.
5. Sch12 Prop. 5.5: injectivity of Φ: R°/ϖ^{1/p} → R°/ϖ since x^p/ϖ powerbounded implies x/ϖ^{1/p} powerbounded.

**Acceptance.**

- Q_p^cycl, F_p((t^{1/p^∞})), Q_p^cycl⟨T^{1/p^∞}⟩ and the non-field example R = Z_p^cycl[[T^{1/p^∞}]]⟨(p/T)^{1/p^∞}⟩[1/T] with ϖ = T^{1/p} (ECD Example 3.4) satisfy the definition.
- Uniformity is not automatic in characteristic 0: the definition asks for it explicitly.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `IsPerfectoidTateRing` | data | The predicate on a complete Tate ring: it is uniform and Frobenius is surjective on the ring of power-bounded elements modulo p. |
| `PerfectoidAlgebra` | data | Perfectoid algebras over a fixed perfectoid field. |
| `IsPerfectoidTateRing.uniform` | characterisation | Uniformity, which is part of the definition. |
| `IsPerfectoidTateRing.charP_case` | example | In characteristic p the condition says the ring is perfect and uniform. |
| `IsPerfectoidTateRing.field_criterion` | characterisation | The criterion distinguishing which perfectoid Tate rings are fields. |

**Uses.**

- `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring`: the tilt is constructed for these rings
- `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`: the localisation theorem says the class is stable under rational localisation

**Unit tests.** A plausible wrong definition fails one of these.

- `uniformity_needed`: A complete Tate ring on which Frobenius is surjective modulo p but which is not uniform is not perfectoid; uniformity is not implied.
- `field_case`: A perfectoid field is a perfectoid Tate ring, which is the compatibility a user needs.
- `polydisc`: The completed perfection of a Tate algebra in finitely many variables over a perfectoid field is perfectoid; this is the example the approximation lemma is about.

**Prerequisites.**

- `tauceti:TauCeti.Huber.Pair`
- `mathlib:frobenius`

**Sources.**

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Definition 3.1, Remarks 3.2-3.3, Example 3.4, Proposition 3.5 with proof, pp. 14-15 (extraction lines 613-684).

  > A Tate ring R is perfectoid if R is complete, uniform, i.e. R° ⊂ R is bounded, and there exists a pseudo-uniformizer ϖ ∈ R such that ϖ^p | p in R° and the Frobenius map Φ : R°/ϖ → R°/ϖ^p : x ↦ x^p is an isomorphism.

  Exact definition used by the stage; Remark 3.2's proof of the equivalent Frobenius-surjectivity criterion was read.

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 5, Definition 5.1, Propositions 5.5, 5.8, 5.9 with proofs, pp. 21-24 (extraction lines 1113-1257).

  > Assume 0 ≠ x ∈ R is nilpotent. Then Kx ⊂ R°, contradicting the condition that R° is bounded.

  Reducedness and the field-based definition on which the proofs of Sections 5-7 rest.

#### `almost-integral-dictionary` — Perfectoid K-algebras are equivalent to perfectoid K°a-algebras

*lemma.*

**Statement.** A perfectoid K°a-algebra is a ϖ-adically complete flat K°a-algebra A with Φ: A/ϖ^{1/p} ≅ A/ϖ. (Lemma 5.3) For a K°a-module M: M is flat iff M_* is flat over K° iff M_* has no ϖ-torsion; for N flat, (Nᵃ)_* = {x ∈ N[1/ϖ] : εx ∈ N for all ε ∈ m}; for M flat, (xM)_* = xM_*, M_*/xM_* ⊂ (M/xM)_* with ε(M/xM)_* ⊂ M_*/xM_* for all ε ∈ m; M is ϖ-adically complete iff M_* is. (Prop. 5.5, Lemma 5.6) R ↦ R°a and A ↦ A_*[ϖ^{-1}] (with A_* open and bounded) are inverse equivalences K-Perf ≅ K°a-Perf; in particular A_* = R° is the full ring of powerbounded elements and Φ: A_*/ϖ^{1/p} ≅ A_*/ϖ is an actual isomorphism.

**Hypotheses.**

- K perfectoid field, ϖ ∈ K with |p| ≤ |ϖ| < 1 and a chosen p-th root ϖ^{1/p}.
- Flatness over K° is equivalent to ϖ-torsion-freeness because K° is a valuation ring.

**Construction, or proof, in steps.**

1. Lemma 5.3(i): Tor_1(M_*, K°/ϖ) almost zero gives ϖ-torsion of M_* almost zero; M_* = Hom(m, M_*) has no almost-zero elements, so no ϖ-torsion.
2. Lemma 5.3(iii): for m ∈ (M/xM)_* evaluate a lift at ε to get n ∈ M_*/xM_*, lift to ñ ∈ M_*; ñ is divisible by ε because δñ ∈ εM_* for all δ ∈ m; then ñ/ε lifts εm.
3. Lemma 5.3(iv): both M ↦ M_* and N ↦ Nᵃ have left adjoints, so commute with inverse limits; combine with (iii).
4. Lemma 5.7: if x^p ∈ A_* then x ∈ A_*, by descending induction on k with ϖ^{k/p} x ∈ A_*, using injectivity of Φ and absence of ϖ-torsion.
5. Lemma 5.6: powerbounded x has (εx)^{p^N} ∈ A_* for large N, so εx ∈ A_* for all ε, so x ∈ A_* by 5.3(ii); Φ surjective on A_*/ϖ: from almost surjectivity ϖ^{1/p} x ≡ y^p mod ϖ, set z = y/ϖ^{1/p²}, then z^p ≡ x mod ϖ^{(p-1)/p}, z ∈ A_* by Lemma 5.7, and x ≡ z^p mod m A_*, which suffices for surjectivity onto A_*/m and hence mod ϖ.

**Acceptance.**

- For R = K⟨T^{1/p^∞}⟩, R° = the ϖ-adic completion of K°[T^{1/p^∞}] and R°a is a perfectoid K°a-algebra (Prop. 5.20).
- The non-surjectivity of M_*/xM_* → (M/xM)_* in Lemma 5.3(iii) is witnessed by the elements of Remark 4.8 (Remark 5.4).

**Prerequisites.**

- `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`
- `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`
- `mathlib:Module.Flat`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 5, Definition 5.1(ii), Lemma 5.3, Remark 5.4, Proposition 5.5, Lemmas 5.6-5.7 with proofs, pp. 21-23 (extraction lines 1119-1237).

  > Then A_* = R° is the set of power-bounded elements, R is perfectoid, and Φ : A_*/ϖ^{1/p} ≅ A_*/ϖ.

  The equivalence K-Perf ≅ K°a-Perf and the exact integral statements (no ϖ-torsion, completeness transfer) used in every later limit argument.

#### `cotangent-complex-vanishing-mod-varpi` — Vanishing of the almost cotangent complex of a perfectoid K°a/ϖ-algebra

*lemma.*

**Statement.** (Prop. 5.13(ii)) If R → S is a map of F_p-algebras such that the relative Frobenius induces an isomorphism R_(Φ) ⊗^L_R S → S_(Φ) in D(R), then L_{S/R} ≅ 0; in particular L_{R/F_p} = 0 for perfect R. (Cor. 5.16) For a perfectoid K°a/ϖ-algebra A (flat over K°a/ϖ with Φ: A/ϖ^{1/p} ≅ A), the almost cotangent complex Lᵃ_{A/(K°a/ϖ)} vanishes.

**Hypotheses.**

- pR = 0 for the Frobenius argument; the hypothesis is on the derived relative Frobenius, not merely on Ω¹.
- Cor. 5.16 uses the almost version of Prop. 5.13, which Sch12 says 'can be proved in the same way', or the functor C ↦ C_!! of GR §2.2.25 applied to B = (A × K°a/ϖ)_!!, a flat K°/ϖ-algebra with B/ϖ^{1/p} ≅ B via Φ; neither route is written out.

**Construction, or proof, in steps.**

1. Take a simplicial resolution S^• of S by free R-algebras; the relative Frobenius R_(Φ) ⊗_R S^• → S^•_(Φ) sends X_i ↦ X_i^p on polynomial generators.
2. The hypothesis says this is a quasi-isomorphism of simplicial R_(Φ)-algebras, hence R_(Φ) ⊗^L_R L_{S/R} ≅ L_{S_(Φ)/R_(Φ)}.
3. On differentials the map sends dX_i ↦ dX_i^p = 0, so the induced map is zero, forcing L_{S_(Φ)/R_(Φ)} = 0, which identifies with L_{S/R}.

**Acceptance.**

- Ω¹_{R/F_p} = 0 for perfect R since dx = d(y^p) = p y^{p-1} dy = 0 (Remark 5.14); the full statement is the derived strengthening.
- Remark 5.14: W(R) for perfect R is characterized as the unique flat p-adically complete deformation of R.

**Prerequisites.**

- `DerivedDeRhamCohomology:DD.0`
- `mathlib:KaehlerDifferential`
- `mathlib:Algebra.Extension.H1Cotangent`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 5, Proposition 5.13, Remark 5.14, Remark 5.15, Corollary 5.16 with proofs, pp. 25-26 (extraction lines 1304-1350).

  > On the other hand, the explicit description shows that the map induced by Φ_{S^k/R} on differentials will map dX_i to dX_i^p = 0, and hence is the zero map. This shows that L_{S_(Φ)/R_(Φ)} ≅ 0

  The core mechanism of the Frobenius vanishing criterion, attributed to GR Lemma 6.5.13 i) (book numbering; not located in the arXiv extraction).

#### `deformation-lifting-of-perfectoid-mod-varpi-algebras` — Unique flat deformation of perfectoid K°a/ϖ-algebras to K°a

*theorem.*

**Statement.** The functor A ↦ A/ϖ is an equivalence K°a-Perf ≅ (K°a/ϖ)-Perf. Concretely, a perfectoid K°a/ϖ-algebra A lifts uniquely, through the square-zero extensions (K°/ϖⁿ)ᵃ → (K°/ϖ^{n-1})ᵃ, to a compatible system of flat (K°/ϖⁿ)ᵃ-algebras A_n with A_n/ϖ^{n-1} ≅ A_{n-1}; the inverse limit A is ϖ-adically complete with A/ϖⁿ = A_n, flat, and Φ: A/ϖ^{1/p} ≅ A/ϖ, so A is perfectoid.

**Hypotheses.**

- Illusie's deformation theory (Thm 5.11: obstruction in Ext²(L_{S_0/R_0}, S_0 ⊗ I), deformations a torsor under Ext¹, automorphisms Hom; Thm 5.12: lifting of morphisms obstructed in Ext¹ with lifts a torsor under Hom) in its almost version (GR Propositions 3.2.9 and 3.2.16) for square-zero ideals I with I² = 0 and flat S_0.
- The vanishing Lᵃ_{A_n/(K°/ϖⁿ)ᵃ} = 0 for all n, which is deduced from the case n = 1 by the transitivity triangle for the exact sequence 0 → A → A_n → A_{n-1} → 0 (Sch12 cites GR 'Theorem 2.5.36' in book numbering; the arXiv Theorem 2.5.36 is a different statement, see gap).

**Construction, or proof, in steps.**

1. Obstruction and ambiguity groups for lifting A_{n-1} to a flat (K°/ϖⁿ)ᵃ-algebra are Ext groups of the almost cotangent complex, which vanish by Cor. 5.16 and the inductive triangle Lᵃ_{A/(K°/ϖ)ᵃ} → Lᵃ_{A_n/(K°/ϖⁿ)ᵃ} → Lᵃ_{A_{n-1}/(K°/ϖ^{n-1})ᵃ} →.
2. Uniqueness of lifts of morphisms (Thm 5.12) gives full faithfulness at every finite level, hence for the inverse limit.
3. The inverse limit A is ϖ-adically complete with A/ϖⁿ A = A_n; flatness and the Frobenius isomorphism are inherited from A_1 = A.
4. Combined with the dictionary K-Perf ≅ K°a-Perf and the tautology (K°a/ϖ)-Perf = (K♭°a/ϖ♭)-Perf (since K°/ϖ = K♭°/ϖ♭ with matching almost settings), this yields the tilting equivalence Theorem 5.2.

**Acceptance.**

- Prop. 5.20: K⟨T^{1/p^∞}⟩ and K♭⟨T^{1/p^∞}⟩ have the same reduction K°/ϖ[T^{1/p^∞}] and are therefore tilts of each other.
- Uniqueness: two flat deformations with the same reduction are uniquely isomorphic compatibly with the reduction.

**Prerequisites.**

- `PerfectoidSpaces:P1/cotangent-complex-vanishing-mod-varpi`
- `mathlib:Algebra.FormallyEtale`
- `mathlib:IsAdicComplete`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 5, Theorem 5.10 with proof, Theorems 5.11-5.12, pp. 24-26 (extraction lines 1258-1303 and 1351-1378).

  > We see inductively that all obstructions and ambiguities in lifting inductively to a flat (K°/ϖⁿ)ᵃ-algebra A_n vanish: All groups occuring can be expressed in terms of the cotangent complex by the theorems above, so that it suffices to show that Lᵃ_{A_n/(K°/ϖⁿ)ᵃ} = 0.

  The actual deformation-theoretic proof of the lifting equivalence, with its dependence on the cotangent-complex vanishing.

- gr-almost — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*, Propositions 3.2.9 and 3.2.16 (extraction lines 2197-2296).

  > Assume that the obstruction ω(B̃, f_0, u) vanishes. Then the set of isomorphism classes of A-extensions C̃ as in (i) forms a torsor under the group: Exal_{B_0}(C_0, J) ≃ Ext¹_{C_0}(Lᵃ_{C_0/B_0}, J).

  The almost version of the obstruction/torsor statements cited as Sch12 Theorems 5.11-5.12 ([14, 3.2.9], [14, 3.2.16]).

#### `tilting-equivalence-and-explicit-tilt` — Tilting equivalence K-Perf ≅ K♭-Perf and the explicit tilt R♭ = lim R

*theorem.* **Planet:** *The tilting equivalence*.

**Statement.** (Thm 5.2) K-Perf ≅ K°a-Perf ≅ (K°a/ϖ)-Perf = (K♭°a/ϖ♭)-Perf ≅ K♭°a-Perf ≅ K♭-Perf. (Prop. 5.17) For R perfectoid over K with A = R°a, the tilt is R♭ = A♭_*[(ϖ♭)^{-1}] with A♭ = lim_Φ A/ϖ; moreover R♭ = lim_{x↦x^p} R, A♭_* = lim_{x↦x^p} A_* and A♭_*/ϖ♭ ≅ A_*/ϖ, so there is a continuous multiplicative map R♭ → R, x ↦ x♯. The tilting functor is independent of the choices of ϖ, ϖ♭ (Remark 5.18). (Lemma 5.21) R is a perfectoid field iff R♭ is. (ECD Thm 3.13) The same equivalence is asserted for perfectoid R-algebras over any perfectoid Tate ring R, with the remark that the Sch12 proof works in general.

**Hypotheses.**

- Sch12 proves the equivalence over a perfectoid base field K; the Tate-ring version (ECD 3.13) is not proved in either source read here and is a recorded boundary.
- A♭_* = lim_Φ A_*/ϖ requires Lemma 5.3(iii) (image of Φ on (A/ϖ)_* is A_*/ϖ) and Lemma 5.6.

**Construction, or proof, in steps.**

1. A♭_* = (lim_Φ A/ϖ)_* = lim_Φ (A/ϖ)_* = lim_Φ A_*/ϖ because (−)_* commutes with inverse limits and Φ on (A/ϖ)_* factors through (A/ϖ^{1/p})_* with image A_*/ϖ; then lim_Φ A_*/ϖ = lim_{x↦x^p} A_* as in Lemma 3.4(i).
2. A♭_* is ϖ♭-adically complete and flat over K♭°, and x ↦ x♯ induces A♭_*/ϖ♭ ≅ A_*/ϖ by Lemma 5.6, so A♭ is a perfectoid K♭°a-algebra.
3. Running through the chain of equivalences identifies A♭/ϖ♭ with A/ϖ, so R♭ is the tilt of R.
4. Lemma 5.21: the spectral norm ||x||_R = inf{|t|^{-1} : tx ∈ R°} satisfies ||x||_{R♭} = ||x♯||_R; multiplicativity transfers in both directions by approximating x, y ∈ R° by (x♭)♯, (y♭)♯ modulo ϖR°, and R is a field because ||1 − (x x♭)♯|| < 1 makes (x x♭)♯ invertible.
5. Remark 5.19 records the converse functor R = W(R♭°) ⊗_{W(K♭°)} K via θ, not used in the proof.

**Acceptance.**

- Prop. 5.20: the tilt of K⟨T_1^{1/p^∞}, ..., T_n^{1/p^∞}⟩ is K♭⟨T_1^{1/p^∞}, ..., T_n^{1/p^∞}⟩.
- The sharp map is multiplicative and continuous; additivity is not asserted.

**Prerequisites.**

- `PerfectoidSpaces:P1/almost-integral-dictionary`
- `PerfectoidSpaces:P1/deformation-lifting-of-perfectoid-mod-varpi-algebras`
- `PerfectoidSpaces:P1/tilt-of-perfectoid-field`
- `mathlib:CategoryTheory.Equivalence`
- `mathlib:PreTilt`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 5, Theorem 5.2 (p. 22), Proposition 5.17, Remarks 5.18-5.19, Proposition 5.20, Lemma 5.21 with proofs, pp. 26-28 (extraction lines 1131-1142 and 1379-1474).

  > R♭ = lim_{x↦x^p} R, A♭_* = lim_{x↦x^p} A_*, A♭_*/ϖ♭ ≅ A_*/ϖ. In particular, we have a continuous multiplicative map R♭ → R, x ↦ x♯.

  The explicit description of the tilt and the sharp map used in the sheaf theorem and almost purity.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Theorem 3.13 and its one-line proof, p. 17 (extraction lines 766-770).

  > Proof. In [Sch12], these are only proved over a perfectoid field, but the proof works in general.

  Records that the Tate-ring generality of the tilting equivalence rests on an unwritten adaptation; kept as a gap.

#### `tilt-of-perfectoid-tate-ring` — Tilt of a perfectoid Tate ring and its rings of integral elements

*construction.* **Planet:** *Tilt of a perfectoid Tate ring*.

**Statement.** For a perfectoid Tate ring R, R♭ := lim_{x↦x^p} R with the inverse limit topology, pointwise multiplication and addition (x + y)^{(i)} = lim_n (x^{(i+n)} + y^{(i+n)})^{p^n} is a perfectoid F_p-algebra with R♭° = lim_{x↦x^p} R° ≅ lim_Φ R°/ϖ for any pseudo-uniformizer ϖ | p. There is a pseudo-uniformizer ϖ with ϖ^p | p admitting compatible p-power roots, giving ϖ♭ = (ϖ, ϖ^{1/p}, ...) ∈ R♭°, a pseudo-uniformizer of R♭ with R♭ = R♭°[1/ϖ♭]. Projection to the zeroth coordinate is a continuous multiplicative map f ↦ f♯ inducing R♭°/ϖ♭ ≅ R°/ϖ, and R^+ ↦ R♭+ = lim_{x↦x^p} R^+ is an inclusion-preserving bijection between open integrally closed subrings of R° and of R♭°, with R♭+/ϖ♭ = R^+/ϖ.

**Hypotheses.**

- R perfectoid Tate ring (complete, uniform, ϖ^p | p, Φ iso mod ϖ); ϖ_0 | p in R° for the identification lim R° ≅ lim_Φ R°/ϖ_0.
- The existence of ϖ with p-power roots uses ϖ_0 = ϖ_1^p and lifting ϖ_1 through R♭° = lim_Φ R°/ϖ_0 → R°/ϖ_0.

**Construction, or proof, in steps.**

1. Any (x̄_0, x̄_1, ...) ∈ lim_Φ R°/ϖ_0 lifts uniquely to lim_{x↦x^p} R° via x^{(i)} = lim_n x_{n+i}^{p^n}, since x ≡ y mod ϖ_0^n implies x^p ≡ y^p mod ϖ_0^{n+1}.
2. A preimage ϖ♭ of ϖ_1 is congruent to ϖ_1 mod ϖ_0, hence topologically nilpotent and invertible in R♭; ϖ := ϖ♭♯ is the desired pseudo-uniformizer.
3. R♭ = R♭°[1/ϖ♭] as monoids and rings, so the addition is well defined and R♭ is a perfect ring of characteristic p.
4. Open integrally closed subrings of R° and R♭° both correspond to integrally closed subrings of the common quotient R°/ϖ = R♭°/ϖ♭ (ECD Lemma 3.11; Sch12 Lemma 6.2 over a field).

**Acceptance.**

- For R over a perfectoid field K this recovers Prop. 5.17: R♭ = lim R and R♭° = lim R°.
- R♭+ /ϖ♭ = R^+/ϖ and R♭+ = lim_{x↦x^p} R^+ (Sch12 Lemma 6.2).

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `tiltRing` | data | The tilt of a perfectoid Tate ring, with its ring of integral elements. |
| `tiltRing.integral` | structure | The identification of the integral elements of the tilt with the inverse limit along Frobenius. |
| `tiltRing.isPerfectoid` | structure | The tilt is a perfectoid Tate ring of characteristic p. |
| `tiltRing.sharp` | data | The multiplicative sharp map to the original ring. |
| `tiltRing.of_field` | compatibility | For a perfectoid field this is the tilt of the previous construction. |

**Uses.**

- `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`: the equivalence is between the two categories these constructions relate
- `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets`: the homeomorphism of adic spectra is induced by this construction

**Unit tests.** A plausible wrong definition fails one of these.

- `compatible_with_fields`: On a perfectoid field the construction agrees with the tilt of a field.
- `multiplicative_sharp`: The sharp map is multiplicative but not additive; treating it as a ring map is a standard error.
- `integral_elements`: The integral elements of the tilt are the inverse limit along Frobenius of the integral elements modulo p, and not the naive inverse limit.

**Prerequisites.**

- `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`
- `mathlib:PreTilt`
- `tauceti:TauCeti.Huber.Pair`

**Sources.**

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Definition 3.9, Lemma 3.10 with proof, Lemma 3.11, pp. 16-17 (extraction lines 699-760).

  > This lift is given by x^{(i)} = lim_{n→∞} x_{n+i}^{p^n}, where x_j ∈ R° is any lift of x̄_j. (For the convergence of that limit, note that if x ≡ y (mod ϖ_0^n), then x^p ≡ y^p (mod ϖ_0^{n+1}).)

  The construction of the tilt in Tate-ring generality with the precise divisibility hypothesis on ϖ_0.

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Definition 6.1, Lemma 6.2 with proof, p. 30 (extraction lines 1595-1607).

  > Giving an open integrally closed subring of R° is equivalent to giving an integrally closed subring of R°/m. This description is compatible with tilting.

  The correspondence of plus rings under tilting over a perfectoid field.

#### `fontaine-theta-and-primitive-kernel` — Fontaine's θ: W(R♭+) → R^+ is surjective with kernel generated by a degree-one primitive nonzerodivisor

*theorem.* **Planet:** *Fontaine theta and its kernel*.

**Statement.** Let R be a perfectoid Tate ring with ring of integral elements R^+ and tilt (R♭, R♭+). Then θ: W(R♭+) → R^+, Σ [r_n] pⁿ ↦ Σ r_n♯ pⁿ, is a surjective ring homomorphism whose kernel is generated by a nonzerodivisor ξ = p + [ϖ]α with ϖ ∈ R♭+ a pseudo-uniformizer and α ∈ W(R♭+). Any element of the form p + [ϖ♭]α with ϖ♭ ∈ R♭+ a pseudo-uniformizer is a nonzerodivisor in W(R♭+) (ECD Lemma 3.16; the printed statement writes α ∈ W(R^+), a misprint for W(R♭+)).

**Hypotheses.**

- R perfectoid Tate; ϖ♭ ∈ R♭ a pseudo-uniformizer such that ϖ = (ϖ♭)♯ satisfies ϖ^p | p (needed for surjectivity and for the description of ker θ).
- W(R♭+)/ξ is [ϖ♭]-torsion free and [ϖ♭]-adically complete (used without proof in ECD).

**Construction, or proof, in steps.**

1. θ is a ring map: modulo ϖ^m it agrees with the composite W(R♭+) → W(R^+/ϖ) → R^+/ϖ^m, where the second map is induced by the m-th ghost component (x_0, x_1, ...) ↦ Σ x_n^{p^{m-n}} pⁿ, which factors over W(R^+/ϖ) by congruences.
2. Surjectivity: R♭+ → R^+/ϖ is surjective, so θ is surjective modulo [ϖ♭]; conclude by [ϖ♭]-adic completeness.
3. Kernel: with α = p/ϖ ∈ R^+ choose β ∈ R♭+ with β♯ ≡ α mod pR^+, so f := ϖ♭β satisfies f♯ ≡ p mod pϖR^+; write p = f♯ + pϖ♯ Σ r_n♯ pⁿ and set ξ = p − [f] − [ϖ♭] Σ [r_n] p^{n+1} ∈ ker θ.
4. ξ generates: W(R♭+)/ξ → R^+ is surjective and an isomorphism modulo [ϖ♭] since W(R♭+)/(ξ, [ϖ♭]) = W(R♭+)/(p, [ϖ♭]) = R♭+/ϖ♭ = R^+/ϖ; conclude using [ϖ♭]-torsion-freeness and completeness of W(R♭+)/ξ.
5. Nonzerodivisor (Lemma 3.16): if ξ Σ [c_n] pⁿ = 0 then mod [ϖ♭] all c_n ≡ 0 mod ϖ♭; divide by ϖ♭ and induct.

**Acceptance.**

- For R = C = completed algebraic closure of Q_p, ξ can be taken as p − [p♭] with p♭ = (p, p^{1/p}, ...).
- The Mathlib primitive Mathlib.RingTheory.Perfectoid.FontaineTheta defines fontaineTheta : 𝕎 R♭ →+* R for p-adically complete R and proves surjectivity under Frobenius surjectivity on R/p (candidate implementation input, unchecked against this node).

**Prerequisites.**

- `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring`
- `mathlib:WittVector`
- `mathlib:WittVector.fontaineTheta`
- `mathlib:surjective_fontaineTheta`

**Sources.**

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Lemma 3.14, Definition 3.15, Lemma 3.16 with proofs, pp. 17-18 (extraction lines 772-824).

  > It is enough to show that f is an isomorphism modulo [ϖ♭], because W(R♭+)/ξ is [ϖ♭]-torsion free and [ϖ♭]-adically complete. But W(R♭+)/(ξ, [ϖ♭]) = W(R♭+)/(p, [ϖ♭]) = R♭+/ϖ♭ = R^+/ϖ

  The proof that the kernel is principal, including the two completeness/torsion facts assumed without proof.

#### `untilts-classified-by-primitive-ideals` — Untilts of a characteristic-p perfectoid pair are classified by degree-one primitive ideals

*comparison.*

**Statement.** (ECD Thm 3.17) The functors (S, S^+) ↦ (S♭, S♭+, ker θ) and (R, R^+, J) ↦ (W(R^+)[[ϖ]^{-1}]/J, W(R^+)/J) (ϖ ∈ R any pseudouniformizer) are inverse equivalences between pairs (S, S^+) of a perfectoid Tate ring with an open integrally closed S^+ ⊂ S°, and triples (R, R^+, J) with R perfectoid of characteristic p, R^+ ⊂ R° open and integrally closed, and J ⊂ W(R^+) primitive of degree 1.

**Hypotheses.**

- Primitive of degree 1 means J = (ξ) with ξ = p + [ϖ♭]α, ϖ♭ a pseudo-uniformizer of R^+ and α ∈ W(R^+).
- ECD states the theorem as 'straightforward to check' after Lemma 3.14 and attributes it to [KL15] and [Fon13]; no proof is written in ECD. Only the direction (S, S^+) ↦ (S♭, S♭+, ker θ) is supported by the proofs read (Lemma 3.14).

**Construction, or proof, in steps.**

1. Forward direction: Lemma 3.14 shows ker θ is primitive of degree 1 and θ: W(S♭+)/ker θ ≅ S^+.
2. Backward direction (not verified here): show W(R^+)/J is a ring of integral elements of the Tate ring W(R^+)[[ϖ]^{-1}]/J, that this ring is perfectoid with tilt R, and that the two composites are naturally isomorphic; the topology and plus ring construction must be checked (stage text: 'including the converse construction with its topology and plus ring').

**Acceptance.**

- For (R, R^+) = (K♭, K♭°) for a perfectoid field K, ker θ = (ξ) and the construction returns (K, K°).
- Different primitive ideals give non-isomorphic untilts over the same tilt (e.g. Frobenius-twisted ideals φ(J)).

**Prerequisites.**

- `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`
- `mathlib:WittVector.fontaineTheta`
- `mathlib:PreTilt.untilt`

**Sources.**

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Theorem 3.17, p. 18 (extraction lines 825-832).

  > It is now straightforward to check the following theorem. Theorem 3.17 ([KL15], [Fon13]). There is an equivalence of categories between: (i) Pairs (S, S^+) ... and (ii) Triples (R, R^+, J)

  Statement matched to the stage's 'classification of marked untilts by primitive degree-one ideals'; proof absent in the source read.

---

## P2 Rational localization, sheafiness, and perfectoid spaces

**Coverage: partial.** Rational localisation, the approximation lemma, the tilting homeomorphism of adic spectra, almost acyclicity and the sheaf theorem, then perfectoid spaces with their glued tilts and fibre products. The pinned Tau Ceti library has a substantial adic-space development - Huber pairs, the adic spectrum, rational subsets with their basis, covering and refinement theory, and the localisation with its universal property - and this layer builds the perfectoid statements on top of it rather than rebuilding the adic geometry.

**Remaining in this layer:**

- Bosch-Guntzer-Remmert inputs for Proposition 6.10 (6.2.4 Theorem 1: S° open and bounded for reduced tft; 7.3.2 Corollary 10: rational localizations reduced tft; 8.2.1 Theorem 1: Tate acyclicity) and Huber [19] Proposition 4.3 (translation to rigid geometry), [19] Propositions 2.10, 2.11, 2.14, 2.15, 2.19 and [31] Theorem 5.2: not read.
- Passage from Čech exactness on finite rational covers to sheaf cohomology (acyclic basis) is not written in Sch12; supplier D0 is proposed.
- Products in Perf without a common perfectoid base, and completed residue fields' plus rings in the Tate-ring setting: not treated in the sections read.
- The Tate-ring versions (ECD 3.12, 3.18, 3.24) are proved in KL15 (Theorem 3.6.14 etc.), not read.

From algebra to geometry. Rational localizations of perfectoid affinoids are perfectoid, the
approximation lemma controls functions on the perfectoid polydisc, and the two together give the tilting
homeomorphism `Spa(R,R⁺) ≅ Spa(R♭,R♭⁺)` **identifying rational subsets**. That identification is what makes the
whole comparison local, and it is what the sheaf theorem is then proved on.

Tau Ceti already has a substantial adic-space development — Huber pairs, the adic spectrum, rational subsets
with basis, covering, refinement and perturbation theory, and the localization with its universal property — so
this layer adds the perfectoid statements on top rather than rebuilding adic geometry.

**Planets of this layer** (5): *Rational localization*, *The tilting homeomorphism*, *The sheaf theorem*, *Perfectoid spaces*, *Fibre products*.

### Nodes (8)

#### `rational-localization-of-perfectoid-affinoids` — Rational localizations of perfectoid affinoid algebras are perfectoid, with explicit integral model and tilt

*construction.* **Planet:** *Rational localization*.

**Statement.** Let (R, R^+) be a perfectoid affinoid K-algebra with tilt (R♭, R♭+), X = Spa(R, R^+), and U = U(f_1, ..., f_n / g) ⊂ X♭ rational with f_i, g ∈ R♭° and f_n = (ϖ♭)^N, with preimage U♯ ⊂ X. Then (i) the ϖ-adic completion R°⟨(f_1♯/g♯)^{1/p^∞}, ..., (f_n♯/g♯)^{1/p^∞}⟩ of the subring R°[(f_i♯/g♯)^{1/p^∞}] ⊂ R[1/g♯] is, almost, a perfectoid K°a-algebra; (ii) O_X(U♯) is a perfectoid K-algebra with O_X(U♯)°a equal to that completion; (iii) the tilt of O_X(U♯) is O_{X♭}(U).

**Hypotheses.**

- K perfectoid field; the normalization f_n = (ϖ♭)^N ensures f_1♯, ..., f_n♯ generate R (Remark 2.8) so that U♯ is the rational subset U(f_1♯, ..., f_n♯ / g♯).
- Statement (i) in characteristic p is proved first; the general case uses tilting through (ii) and the already-known characteristic-p case for U.

**Construction, or proof, in steps.**

1. Char p: R°[T_1^{1/p^∞}, ..., T_n^{1/p^∞}]/I → R°[(f_i/g)^{1/p^∞}] with I generated by T_i^{1/p^m} g^{1/p^m} − f_i^{1/p^m} is an almost isomorphism (isomorphism after inverting ϖ, and ϖ^k f ∈ I implies ϖ^{k/p^m} f ∈ I by perfectness of I); reducing mod ϖ and using Φ: (I, ϖ^{1/p}) ↦ (I, ϖ) shows the completion is almost perfectoid.
2. (i) ⇒ (ii) for general K: the inclusions R°⟨f_i♯/g♯⟩ ⊂ R°⟨(f_i♯/g♯)^{1/p^∞}⟩ ⊂ R⟨f_i♯/g♯⟩ = O_X(U♯) together with ϖ^{nN} R°[(f_i♯/g♯)^{1/p^∞}] ⊂ R°[f_i♯/g♯] (since 1/g♯ = ϖ^{-N} f_n♯/g♯) show O_X(U♯) = R°⟨(f_i♯/g♯)^{1/p^∞}⟩[ϖ^{-1}] is perfectoid.
3. (i), (iii) general K: let (S, S^+) be the tilt of (O_{X♭}(U), O^+_{X♭}(U)); Spa(S, S^+) → X factors over U♯, giving O_X(U♯) → S; the composite R°⟨T^{1/p^∞}⟩ᵃ/(I, ϖ) → R°⟨(f_i♯/g♯)^{1/p^∞}⟩ᵃ/ϖ → S°a/ϖ is the tilt of R♭°⟨T^{1/p^∞}⟩ᵃ/(I♭, ϖ♭) → O_{X♭}(U)°a/ϖ♭, an isomorphism; the first map being surjective, both maps are isomorphisms, giving (i), (ii) and then (iii).

**Acceptance.**

- For U = {|g| ≤ |ϖ|^c} on the perfectoid unit polydisc, O_X(U♯)°a = R°⟨(g♯/ϖ^c)^{1/p^∞}⟩ᵃ, the formula used in the proof of the approximation lemma.
- O_X(U♯)°a is ϖ-adically complete and flat over K°a by construction; the perfectoid property is the nontrivial assertion.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `rationalLocalization` | data | The rational localisation of a perfectoid affinoid algebra at a rational subset. |
| `rationalLocalization.isPerfectoid` | structure | The localisation is again perfectoid. |
| `rationalLocalization.tilt` | compatibility | Its tilt is the rational localisation of the tilt at the corresponding subset. |
| `rationalLocalization.universal` | universal-property | The universal property of the localisation, which the pinned Tau Ceti development supplies for Huber pairs. |
| `rationalLocalization.almost_integral` | structure | The almost integral statement comparing the integral elements before and after localisation. |

**Uses.**

- `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`: the sheaf property is proved on rational subsets
- `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets`: the correspondence of rational subsets under tilting is what makes the comparison local

**Unit tests.** A plausible wrong definition fails one of these.

- `perfectoid_is_preserved`: The localisation of a perfectoid affinoid is perfectoid; this is what makes the structure presheaf take values in perfectoid rings.
- `tilt_commutes`: Localising and tilting commute, with the rational subset transported by the homeomorphism.
- `not_just_an_algebra`: The localisation carries its topology and its ring of integral elements, not only the underlying algebra.

**Prerequisites.**

- `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`
- `tauceti:TauCeti.ValuationSpectrum.rationalSubset`
- `tauceti:TauCeti.Huber.Pair`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Lemma 6.4 with proof, pp. 31-33 (extraction lines 1659-1818).

  > If f lies in the kernel of this map, there is some k with ϖ^k f ∈ I. But then (ϖ^{k/p^m} f)^{p^m} ∈ I, and because I is perfect, also ϖ^{k/p^m} f ∈ I. This gives the desired statement.

  The Frobenius-descent argument that makes the presentation of the rational localization almost exact in characteristic p.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Theorem 3.18 statement, p. 18 (extraction lines 833-841).

  > Moreover, for any rational subset U ⊂ X with image U♭ ⊂ X♭, O_X(U) is perfectoid with tilt O_{X♭}(U♭).

  The Tate-ring form of the localization statement cited by the stage as ECD 3.18.

#### `approximation-lemma` — Approximation lemma: functions on the perfectoid polydisc are approximated by sharps of tilted functions

*lemma.*

**Statement.** Let R = K⟨T_0^{1/p^∞}, ..., T_n^{1/p^∞}⟩ and f ∈ R° homogeneous of degree d ∈ Z[1/p]. For every rational c ≥ 0 and ε > 0 there is g_{c,ε} ∈ R♭° = K♭°⟨T_0^{1/p^∞}, ..., T_n^{1/p^∞}⟩ homogeneous of degree d with |f(x) − g_{c,ε}♯(x)| ≤ |ϖ|^{1−ε} max(|f(x)|, |ϖ|^c) for all x ∈ Spa(R, R°). In particular for ε < 1, max(|f(x)|, |ϖ|^c) = max(|g♯(x)|, |ϖ|^c). (Cor. 6.7(i)) For any perfectoid affinoid (R, R^+), f ∈ R, c ≥ 0, ε > 0 there is g ∈ R♭ with the same estimate on Spa(R, R^+).

**Hypotheses.**

- K perfectoid; ϖ with compatible p-power roots; homogeneity in the T-variables with degrees in Z[1/p].
- The proof uses Lemma 6.4's description O_X(U_c♯)°a = R°⟨(g_c♯/ϖ^c)^{1/p^∞}⟩ᵃ for U_c = {|g_c| ≤ |ϖ♭|^c} and loses a small constant ε(c) at each step because of almost mathematics.

**Construction, or proof, in steps.**

1. Fix ε ∈ Z[1/p], 0 < ε < 1; prove by induction on c (steps c → c' = c + a, 0 < a < ε) the existence of ε(c) > 0 and g_c with |f − g_c♯| ≤ |ϖ|^{1−ε+ε(c)} max(|f|, |ϖ|^c); c = 0 is trivial with ε(0) = ε.
2. On U_c♯ = {|f| ≤ |ϖ|^c}, h := f − g_c♯ lies in ϖ^{c+1−ε+ε(c)} O^+_X(U_c♯); by homogeneity h lies almost in the completion of ⊕_{i ∈ Z[1/p], 0 ≤ i ≤ 1} ϖ^{c+1−ε+ε(c)} (g_c♯/ϖ^c)^i R°_{deg = d − di}, so h = Σ ϖ^{c+1−ε+ε(c')} (g_c♯/ϖ^c)^i r_i with r_i → 0 homogeneous.
3. Choose s_i ∈ R♭+ homogeneous with ϖ | r_i − s_i♯ and set g_{c'} = g_c + Σ (ϖ♭)^{c+1−ε+ε(c')} (g_c/(ϖ♭)^c)^i s_i.
4. If |f(x)| > |ϖ|^c then |g_c♯(x)| = |f(x)| and each correction term is bounded by |ϖ|^{1−ε+ε(c')} |f(x)| (maximal at i = 1); if |f(x)| ≤ |ϖ|^c then f − g_{c'}♯ = f − g_c♯ − h = 0 modulo ϖ^{c+1} in O_X(U_c♯)°, giving |f(x) − g_{c'}♯(x)| ≤ |ϖ|^{c'+1−ε+ε(c')}.
5. Cor. 6.7(i): reduce to R^+ = R° via maximal points, to f ∈ R° and c integral, write f = g_0♯ + ϖ g_1♯ + ... + ϖ^c g_c♯ + ϖ^{c+1} f_{c+1} and pull back T_0 + ϖT_1 + ... + ϖ^c T_c along K⟨T_0^{1/p^∞}, ..., T_c^{1/p^∞}⟩ → R, T_i^{1/p^m} ↦ (g_i^{1/p^m})♯.

**Acceptance.**

- For f = T_0 the lemma is trivial (g = T_0); for f = T_0 + ϖ T_1 one needs a genuine correction since (T_0 + ϖT_1) is not a sharp.
- Remark 6.6: for ε < 1 the loci {|f| ≤ |ϖ|^c} and {|g♯| ≤ |ϖ|^c} coincide, which is what the tilting homeomorphism needs.

**Prerequisites.**

- `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`
- `mathlib:frobenius`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Lemma 6.5, Remark 6.6, proof pp. 33-34, Corollary 6.7(i) with proof p. 35 (extraction lines 1819-1943).

  > We will need ε(c), as each induction step will lose some small constant because of some almost mathematics involved. Now we argue by induction, increasing from c to c' = c + a, where 0 < a < ε is some fixed rational number in Z[1/p].

  The inductive structure and the almost-mathematics loss that the stage must reproduce.

#### `tilting-homeomorphism-and-rational-subsets` — Spa(R, R^+) ≅ Spa(R♭, R♭+) identifying rational subsets; completed residue fields are perfectoid

*theorem.* **Planet:** *The tilting homeomorphism*.

**Statement.** For a perfectoid affinoid K-algebra (R, R^+) with tilt (R♭, R♭+): x ↦ x♭, |f(x♭)| := |f♯(x)|, is a homeomorphism Spa(R, R^+) → Spa(R♭, R♭+) under which rational subsets correspond; every completed residue field k(x)^ is a perfectoid field; for rational U ⊂ X the pair (O_X(U), O^+_X(U)) is a perfectoid affinoid K-algebra with tilt (O_{X♭}(U♭), O^+_{X♭}(U♭)). (ECD Thm 3.12 states the homeomorphism for any perfectoid Tate ring.)

**Hypotheses.**

- Perfectoid base field K in Sch12; well-definedness of x♭ uses that |·|♭ is a valuation (proof of Prop. 3.6).
- Surjectivity uses the untilting of perfectoid fields (Lemma 5.21) and of continuous valuations (Prop. 3.6).

**Construction, or proof, in steps.**

1. Continuity: the preimage of U(f_1, ..., f_n / g) is U(f_1♯, ..., f_n♯ / g♯) after arranging f_n = (ϖ♭)^N.
2. Injectivity: by the approximation lemma every rational subset {|f| ≤ |ϖ|^c}-type condition of X is the preimage of a rational subset of X♭, so rational subsets of X are preimages; X is T_0, so the map is injective.
3. Surjectivity: a point of X♭ factors R♭ → k(x)^ → Γ ∪ {0}; k(x)^ is perfectoid (char p: the ϖ-adic completion of O_{X,x}°a is perfectoid by Lemma 6.4), untilt to a perfectoid field over K and untilt the valuation by Prop. 3.6.
4. Cor. 6.8: (O_X(U), O^+_X(U)) is perfectoid affinoid by Cor. 6.7(iii) and Lemma 6.4(ii), characterized by the universal property of Huber's Prop. 2.14 among perfectoid affinoid K-algebras; tilting the universal property identifies its tilt with (O_{X♭}(U♭), O^+_{X♭}(U♭)).

**Acceptance.**

- For R = K⟨T^{1/p^∞}⟩ the closed disc {|T| ≤ |ϖ|} tilts to {|T| ≤ |ϖ♭|}; the point given by T ↦ ϖ tilts to T ↦ ϖ♭.
- The homeomorphism is not merely on rank-one points: all continuous valuations correspond (Prop. 3.6 mechanism).

**Prerequisites.**

- `PerfectoidSpaces:P1/continuous-valuations-under-tilting`
- `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`
- `PerfectoidSpaces:P2/approximation-lemma`
- `tauceti:TauCeti.ValuationSpectrum.spa`
- `tauceti:TauCeti.ValuationSpectrum.rationalSubset`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Theorem 6.3(i)-(ii), Corollary 6.7(ii)-(iii), Corollary 6.8 with proofs, pp. 30 and 34-35 (extraction lines 1608-1658 and 1926-1979).

  > First, part (i) immediately implies that any rational subset of X is the preimage of a rational subset of X♭. Because X is T_0, this implies that the map is injective.

  The deduction of the homeomorphism from the approximation lemma.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Theorem 3.12, p. 17 (extraction lines 761-765).

  > The map sending x ∈ Spa(R, R^+) to x♭ ∈ Spa(R♭, R♭+) defined by |f(x♭)| = |f♯(x)| defines a homeomorphism Spa(R, R^+) ≅ Spa(R♭, R♭+). A subset U ⊂ Spa(R, R^+) is rational if and only if its image in Spa(R♭, R♭+) is rational.

  The Tate-ring statement referenced by the stage; its proof over a general perfectoid Tate ring is delegated to [KL15] and not read.

#### `p-finite-acyclicity-from-tate` — Almost acyclicity for p-finite perfectoid affinoids via Tate's acyclicity theorem

*lemma.*

**Statement.** Assume char K = p. A perfectoid affinoid K-algebra (R, R^+) is p-finite if it is the completed perfection of a reduced affinoid K-algebra (S, S^+) of topologically finite type (R^+ = ϖ-adic completion of colim_Φ S^+, R = R^+[ϖ^{-1}]). For such (S, S^+) with Y = Spa(S, S^+): S^+ = S° is open and bounded; rational localizations are reduced tft; and for any finite rational cover the Čech complex of O° has cohomology killed by a power of ϖ. Consequently Spa(R, R^+) ≅ Y identifying rational subsets, (O_X(U), O^+_X(U)) is the completed perfection of (O_Y(V), O^+_Y(V)), and the Čech complex 0 → O_X(X)°a → Π O_X(U_i)°a → Π O_X(U_i ∩ U_j)°a → ... is exact, so O_X is a sheaf and H^i(X, O_X°a) = 0 for i > 0 (equivalently H^i(X, O^+_X) is killed by m).

**Hypotheses.**

- char K = p; S reduced and topologically of finite type over K (the Bosch-Guntzer-Remmert results 6.2.4 Theorem 1, 7.3.2 Corollary 10 and Tate's acyclicity 8.2.1 Theorem 1 are cited via Huber [19] Proposition 4.3 and were not read).
- Banach's open mapping theorem for K-Banach spaces is used to compare subspace and quotient topologies on ker d_i = im d_{i-1}.

**Construction, or proof, in steps.**

1. Tate acyclicity gives exactness of the rational Čech complex of O; ker d_i is closed, hence Banach, and d_{i-1} is open onto it, so the subspace and quotient topologies on im d_{i-1} coincide.
2. By (i) and (ii) these topologies have bases ϖⁿ im d°_{i-1} and ϖⁿ ker d°_i respectively; agreement means the cohomology of the O°-complex is killed by a power of ϖ.
3. Perfection does not change the adic space or rational subsets, nor does completion (Huber Prop. 2.11); the completed perfection of O_Y(V) has the universal property of O_X(U) among perfectoid affinoids.
4. The O°-Čech complex of Y is exact up to a ϖ-power; passing to the perfection (direct limit over Frobenius, dividing the exponent by p each time) makes it almost exact, and completion preserves this.

**Acceptance.**

- For S = K⟨T⟩ and the cover by {|T| ≤ |ϖ|} and {|ϖ| ≤ |T| ≤ 1}, the O°-Čech cohomology is not zero but is ϖ-power torsion; after perfection it is almost zero.
- Remark 6.12: almost exactness of the O°a complex is equivalent to m-torsion of H^i(X, O^+_X).

**Prerequisites.**

- `AdicSpacesPartII:R3`
- `mathlib:TopCat.Presheaf`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Definition 6.9, Propositions 6.10-6.11, Remark 6.12 with proofs, pp. 35-37 (extraction lines 1980-2053).

  > That they agree precisely amounts to saying that the cohomology group is annihilated by some power of ϖ.

  The open-mapping argument turning Tate's acyclicity into a bounded-torsion statement on integral Čech cohomology.

#### `completed-direct-limits-of-p-finite-affinoids` — Every perfectoid affinoid K-algebra in characteristic p is a completed direct limit of p-finite ones

*lemma.*

**Statement.** Assume char K = p and that R^+ is a K°-algebra. Then (R, R^+) is the completion of a filtered direct limit of p-finite perfectoid affinoid K-algebras (R_i, R_i^+); Spa(R, R^+) ≅ lim Spa(R_i, R_i^+) with every rational U ⊂ X the preimage of some rational U_i; (O_X(U), O^+_X(U)) is the completion of the direct limit of the (O_{X_j}(U_j), O^+_{X_j}(U_j)); and any quasicompact open U_i ⊂ X_i containing the image of X contains the image of X_j for some j.

**Hypotheses.**

- char K = p and R^+ a K°-algebra (arranged in Prop. 6.14 by replacing K with the perfectoid subfield completed F_p((ϖ))(ϖ^{1/p^∞})).
- S_I^+ (powerbounded elements of the reduced quotient S_I of K⟨T_i : i ∈ I⟩) is the integral closure of K°⟨T_i⟩ by [31] Theorem 5.2 (unread); S_I^+ is in general not the preimage of R^+.

**Construction, or proof, in steps.**

1. For finite I ⊂ R^+, S_I = image of K⟨T_i⟩ → R with quotient topology, (R_I, R_I^+) its completed perfection; R^+/ϖⁿ = colim_I R_I^+/ϖⁿ (surjective, and injective since a relation f_1 − f_2 = ϖⁿ g with g ∈ R^+ holds in R_J^+ for J ∋ g).
2. Spa of the uncompleted direct limit (L, L^+) is lim Spa(R_i, R_i^+) compatibly with rational subsets, and completion does not change Spa (Prop. 2.11).
3. (iii) by the universal property of completed direct limits of perfectoid affinoids; (iv) by the constructible topology: the complements A_j are compact in the constructible topology with continuous transition maps, so if their inverse limit is empty one of them is empty.

**Acceptance.**

- For R = K⟨T^{1/p^∞}⟩ the system {S_I} contains K⟨T^{1/p^n}⟩ and the construction returns R itself as a completed perfection at a finite stage.
- Part (iv) is the spectral-space input that lets a finite rational cover of X descend to a finite level.

**Prerequisites.**

- `mathlib:CategoryTheory.Limits.limit`
- `mathlib:UniformSpace.Completion`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Lemma 6.13 (i)-(iv) with proof, p. 37 (extraction lines 2054-2096).

  > We claim that R^+/ϖⁿ = colim_I R_I^+/ϖⁿ. Indeed, the map is clearly surjective. It is also injective, since if f_1, f_2 ∈ R_I^+ satisfy f_1 − f_2 = ϖⁿ g for some g ∈ R^+, then for some larger J ⊃ I containing g, also f_1 − f_2 ∈ ϖⁿ R_J^+.

  The completed-direct-limit presentation reused in the sheaf theorem, Prop. 7.6 and Lemma 7.5.

#### `sheaf-theorem-and-almost-acyclicity` — Sheaf theorem: O_X is a sheaf on Spa(R, R^+) and H^i(X, O_X°a) = 0 for i > 0

*theorem.* **Planet:** *The sheaf theorem*.

**Statement.** For any perfectoid affinoid K-algebra (R, R^+), X = Spa(R, R^+) and any finite cover of X by rational subsets U_i, the Čech complex 0 → O_X(X)°a → Π_i O_X(U_i)°a → Π_{i,j} O_X(U_i ∩ U_j)°a → ... is exact. Hence O_X is a sheaf, H^i(X, O_X°a) = 0 for i > 0, and H^i(X, O^+_X) is m-torsion for i > 0 (Thm 6.3(iii)-(iv)); ECD 3.18/3.24 record the same for perfectoid Tate rings with H^0(X, O^+_X) = R^+.

**Hypotheses.**

- Perfectoid base field K (Sch12). In characteristic p one first reduces to a perfectoid subfield to make R^+ a K°-algebra; in characteristic 0 the tilted sequence is used.
- Passage from Čech exactness on finite rational covers to sheaf cohomology vanishing is stated ('the rest follows as before') and relies on the standard acyclic-basis comparison, which is not written in the source.

**Construction, or proof, in steps.**

1. Char p: write X = lim X_i with (R_i, R_i^+) p-finite (Lemma 6.13); a finite rational cover descends to a finite level; the almost exact sequences for X_i (Prop. 6.11) pass to the completed direct limit.
2. Char 0: the tilted sequence is exact; reduce modulo ϖ♭ (exact by flatness); this is the original sequence reduced modulo ϖ; conclude exactness of the original sequence by flatness and completeness (Lemma 5.3).
3. Sheafiness of O_X follows from exactness in degrees 0 and 1 after inverting ϖ; the almost vanishing of higher cohomology is the higher-degree exactness.

**Acceptance.**

- Prop. 6.14 applied to the trivial cover recovers R°a = O_X(X)°a; applied to the two-disc cover of the perfectoid closed disc gives almost vanishing where the tft O°-cohomology was only ϖ-power torsion.
- The statement is about the almost integral structure sheaf O°a, not merely about O after inverting ϖ.

**Prerequisites.**

- `DiamondsAndVStacks:D0`
- `PerfectoidSpaces:P1/almost-integral-dictionary`
- `PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids`
- `PerfectoidSpaces:P2/p-finite-acyclicity-from-tate`
- `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets`
- `mathlib:TopCat.Presheaf`
- `tauceti:TauCeti.ValuationSpectrum.spa`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Theorem 6.3(iii)-(iv) and Proposition 6.14 with proof, pp. 30 and 37-38 (extraction lines 1616-1626 and 2097-2129).

  > In characteristic 0, first use the exactness of the tilted sequence, then reduce modulo ϖ♭ (which is still exact by flatness), and then remark that this is just the original sequence reduced modulo ϖ. As this is exact, the original sequence is exact, by flatness and completeness.

  The tilting reduction that proves the sheaf property in characteristic 0.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Theorem 3.18 and Theorem 3.24, pp. 18-19 (extraction lines 833-841 and 870-874).

  > Then the R^+-module H^i(X, O^+_X) is almost zero for i > 0, and H^0(X, O^+_X) = R^+.

  The Tate-ring form of the almost acyclicity, including the degree-0 identification the stage must supply.

#### `perfectoid-spaces-and-glued-tilting` — Perfectoid spaces, glued tilts and the equivalence of perfectoid spaces over K and K♭

*construction.* **Planet:** *Perfectoid spaces*.

**Statement.** A perfectoid space over K is an adic space over K locally isomorphic to an affinoid perfectoid space Spa(R, R^+); morphisms are morphisms of adic spaces. X♭ is a tilt of X if Hom(Spa(R♭, R♭+), X♭) = Hom(Spa(R, R^+), X) functorially in perfectoid affinoid (R, R^+). Every perfectoid space admits a tilt, unique up to unique isomorphism; tilting is an equivalence between perfectoid spaces over K and over K♭; |X| = |X♭|; X is affinoid perfectoid iff X♭ is; and for affinoid perfectoid U ⊂ X, (O_X(U), O^+_X(U)) is perfectoid affinoid with tilt (O_{X♭}(U♭), O^+_{X♭}(U♭)). (ECD 3.19-3.20 state the definition and the slice equivalence for general perfectoid Tate rings.)

**Hypotheses.**

- Uses Theorem 5.2 (tilting equivalence of algebras), Theorem 6.3 (sheafiness and tilting of rational localizations) and Huber's Prop. 2.19 (Spa of a sheafy affinoid is an adic space with the expected global sections).
- The ECD slice equivalence (Cor. 3.20) over a general perfectoid Tate base is asserted by 'globalizing' Thm 3.13 and is not proved in the sources read.

**Construction, or proof, in steps.**

1. Sch12 calls Prop. 6.17 'a formal consequence' of Theorem 5.2, Theorem 6.3 and Prop. 2.19; the only additional observation given is that an open U ⊂ X with its restricted structure sheaf and valuations is a perfectoid space with global sections (O_X(U), O^+_X(U)), so affinoid U equals Spa(O_X(U), O^+_X(U)).
2. The gluing of tilts along rational subsets uses Corollary 6.8 (tilt of a rational localization is the corresponding localization of the tilt).

**Acceptance.**

- The tilt of the perfectoid projective space (P^n)^{ad} over K, built from perfected affine charts, is the corresponding space over K♭ (Section 8 construction, not read here).
- Affinoid perfectoid subsets of X are exactly the tilts of affinoid perfectoid subsets of X♭.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `PerfectoidSpace` | data | An adic space covered by affinoids that are perfectoid. |
| `PerfectoidSpace.tilt` | data | The glued tilt of a perfectoid space. |
| `PerfectoidSpace.tilt_equiv` | equivalence | The equivalence between perfectoid spaces over a perfectoid field and over its tilt. |
| `PerfectoidSpace.underlying_homeomorphism` | characterisation | The underlying topological spaces of a perfectoid space and its tilt are homeomorphic. |
| `PerfectoidSpace.affinoid_cover` | structure | The existence of a covering by affinoid perfectoids, which is the definition. |

**Uses.**

- `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`: fibre products are formed in this category
- `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`: the etale site is attached to these spaces and is compared under the glued tilt

**Unit tests.** A plausible wrong definition fails one of these.

- `gluing_is_well_defined`: The glued tilt does not depend on the chosen affinoid cover, which is what the local comparison buys.
- `homeomorphism`: The tilt has the same underlying space; a construction that changes the topology is wrong.
- `affinoid_case`: On an affinoid the glued tilt is the tilt of the algebra.

**Prerequisites.**

- `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`
- `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets`
- `tauceti:TauCeti.ValuationSpectrum.spa`
- `mathlib:TopCat.Presheaf`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Definitions 6.15-6.16, Proposition 6.17 with proof, p. 38 (extraction lines 2130-2160).

  > This is a formal consequence of Theorem 5.2, Theorem 6.3 and Proposition 2.19.

  The gluing is delegated to formal arguments; the node records exactly which inputs are named.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 3, Definition 3.19 and Corollary 3.20, pp. 18-19 (extraction lines 842-851).

  > Let X be a perfectoid space with tilt X♭. Then the functor X' ↦ X'♭ from perfectoid spaces over X to perfectoid spaces over X♭ is an equivalence of categories.

  The slice-category form of the equivalence named by the stage (ECD 3.20).

#### `fibre-products-of-perfectoid-spaces` — Fibre products of perfectoid spaces over K exist and are perfectoid

*construction.* **Planet:** *Fibre products*.

**Statement.** If X → Y ← Z are perfectoid spaces over K, the fibre product X ×_Y Z exists in adic spaces over K and is perfectoid. Affinoid case X = Spa(A, A^+), Y = Spa(B, B^+), Z = Spa(C, C^+): W = Spa(D, D^+) with D the completion of A ⊗_B C and D^+ the completion of the integral closure of the image of A^+ ⊗_{B^+} C^+ in D; the completed almost tensor product A°a ⊗̂_{B°a} C°a is a perfectoid K°a-algebra.

**Hypotheses.**

- All three spaces are perfectoid over the same perfectoid field K; the absolute product of perfectoid spaces (no common perfectoid Tate base) is not covered by this proposition.
- Perfectoidness of the tensor product is checked modulo ϖ (flatness over K°a/ϖ), which reduces to characteristic p.

**Construction, or proof, in steps.**

1. Reduce to the affinoid case; define (D, D^+) as above.
2. A°a ⊗_{B°a} C°a /ϖ is flat over K°a/ϖ: in characteristic p, if ϖ f = 0 then ϖ^{1/p} f^{1/p} = 0 by perfectness, so ϖ^{1/p} f = 0, and iterating shows ϖ-torsion is almost zero.
3. Hence (D, D^+) is perfectoid affinoid and the universal property is checked directly (stated as immediate in the source).

**Acceptance.**

- Spa K⟨T^{1/p^∞}⟩ ×_{Spa K} Spa K⟨S^{1/p^∞}⟩ = Spa K⟨T^{1/p^∞}, S^{1/p^∞}⟩.
- The construction uses the completion of the ordinary tensor product, not a uniformization; uniformity of D follows from perfectoidness.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `PerfectoidSpace.fibreProduct` | data | The fibre product of two perfectoid spaces over a perfectoid field. |
| `PerfectoidSpace.fibreProduct.isPerfectoid` | structure | It is again perfectoid. |
| `PerfectoidSpace.fibreProduct.universal` | universal-property | Its universal property in the category of perfectoid spaces. |
| `PerfectoidSpace.fibreProduct.tilt` | compatibility | It commutes with tilting. |

**Uses.**

- `PerfectoidSpaces:P3/strongly-etale-morphisms-and-base-change`: base change of a strongly etale morphism is formed as such a fibre product
- `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`: the limits of the later layer are built from these

**Unit tests.** A plausible wrong definition fails one of these.

- `exists_and_is_perfectoid`: The fibre product exists in perfectoid spaces, which is not automatic: the corresponding statement for general adic spaces is false without hypotheses.
- `tilt_commutes`: Tilting commutes with fibre products.
- `affinoid_case`: For affinoids the fibre product is the completed tensor product of the algebras.

**Prerequisites.**

- `AdicEtaleGeometry:A0`
- `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`
- `mathlib:CategoryTheory.Limits.limit`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 6, Proposition 6.18 with proof, p. 38 (extraction lines 2161-2184).

  > Here, it is enough to check that A°a ⊗_{B°a} C°a is ϖ-torsion free; but if ϖf = 0, then ϖ^{1/p} f^{1/p} = 0 by perfectness, hence ϖ^{1/p} f = 0. Continuing gives the result.

  The characteristic-p torsion argument proving perfectoidness of the completed tensor product.

---

## P3 Almost purity and étale tilting

**Coverage: partial.** Almost purity, in characteristic p first and then in general, with the tilting of finite etale algebras, the stability of perfectoid fields under finite extension, the three classes of etale morphism, and the etale site with its tilting isomorphism and almost acyclicity. The henselian finite etale approximation node is placed here rather than in P5, which is the dependency correction the independent review of the decomposition made.

**Remaining in this layer:**

- GR imports: Theorem 3.5.13(ii), Theorem 3.5.28 (proof), Propositions 6.6.2, 6.6.6, 6.3.6 (ramification-theory proof of Theorem 3.7): statements read, proofs not.
- Huber [Hub96] Example 1.6.6(ii), Lemma 2.2.8, Proposition 1.7.8, Proposition 1.6.7(ii), and [Hub93] Lemma 3.9(i) (surjectivity on topological fibre products): not read.
- Krasner's lemma and the density of N = ∪ L♯ in M♯ in the proof of Theorem 3.7: standard, unread here.
- ECD Theorem 6.1 over a general perfectoid Tate ring ([KL15, 3.6.21, 5.5.9]): not read; the ECD definition of finite etale ('for all affinoid opens') vs Sch12's ('there is a cover') is reconciled by Proposition 7.6 only over a perfectoid field.

Almost purity: a finite étale cover of a perfectoid affinoid is again perfectoid, and almost
finite étale. In characteristic p it is a Frobenius argument; in general it goes through tilting, which is why
the tilting of finite étale algebras and the stability of perfectoid fields under finite extension come first.

The henselian finite-étale approximation node sits **here**, not in P5. That is the dependency correction the
independent review of the decomposition made, and this packet keeps it: P3 needs the approximation, so placing
it in a later layer reverses the real order.

**Planets of this layer** (4): *Almost purity in characteristic p*, *Finite extensions of perfectoid fields*, *Strongly etale morphisms*, *The almost purity theorem*.

### Nodes (8)

#### `finite-etale-covers-in-characteristic-p` — Almost purity in characteristic p: finite etale covers of perfectoid algebras

*theorem.* **Planet:** *Almost purity in characteristic p*.

**Statement.** (Prop. 5.22) A finite etale algebra over a perfectoid K°a/ϖ-algebra is perfectoid. (Prop. 5.23) If char K = p, R is a perfectoid K-algebra and S/R is finite etale (with the canonical topology of a finite projective R-module), then S is perfectoid, S°a is finite etale over R°a, and S°a is a uniformly finite projective R°a-module.

**Hypotheses.**

- char K = p for Prop. 5.23; S carries the canonical topology of a finitely generated module over R = R°[ϖ^{-1}] (GR Definitions 5.4.10-5.4.11), for which S is complete since it is projective.
- Prop. 5.22 imports GR Theorem 3.5.13(ii) (weakly etale maps in characteristic p commute with Frobenius twists) for the Frobenius condition.

**Construction, or proof, in steps.**

1. S is a perfect Banach K-algebra; for a finitely generated R°-subalgebra S_0 with S_0[1/ϖ] = S define S_0^⊥ via the perfect trace pairing; then S_0 ⊂ Y ⊂ S_0^⊥ for Y the integral closure of R° in S, so Y is open and bounded and S°a = Y^a, hence S° is open and bounded.
2. Uniform finite projectivity: the unramified idempotent e ∈ S ⊗_R S satisfies ϖ^N e ∈ image of S° ⊗_{R°} S°; by bijectivity of Frobenius ϖ^{N/p^m} e = Σ x_i^{1/p^m} ⊗ y_i^{1/p^m}, so for every ε ∈ m, εe = Σ_{i=1}^n a_i ⊗ b_i with a_i, b_i ∈ S°; the maps s ↦ (t(s, b_i))_i and (r_i) ↦ Σ a_i r_i compose to multiplication by ε.
3. Unramifiedness of S°a/R°a: the same e defines an almost element of S°a ⊗ S°a with the idempotent properties.

**Acceptance.**

- Reviewer-authored test (the source gives no example): for K the completion of F_p((t^{1/p^∞})) and the Artin-Schreier extension S = K[u]/(u^p − u − t^{-1}), Proposition 5.23 gives that S is perfectoid and S°a is finite etale and uniformly finite projective over K°a. Whether S° is free over K° at any finite level is not addressed in the source and must not be assumed.
- The bound n on the number of generators is independent of ε: uniformity.

**Prerequisites.**

- `mathlib:Algebra.Etale`
- `mathlib:frobenius`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 5, Propositions 5.22-5.23 and Remark 5.24 with proofs, pp. 28-29 (extraction lines 1475-1552).

  > As Frobenius is bijective, we have ϖ^{N/p^m} e = Σ_{i=1}^n x_i^{1/p^m} ⊗ y_i^{1/p^m} for all m. In particular, for any ε ∈ m, we can write εe = Σ_{i=1}^n a_i ⊗ b_i for certain a_i, b_i ∈ S°, depending on ε.

  The Frobenius-division argument that produces almost finite presentation with a uniform bound.

- gr-almost — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*, Theorem 3.5.13 statement and Theorem 3.5.28 with opening of proof (extraction lines 3701-3737 and 3869-3880).

  > Let R be a finite etale V[ε^{-1}]-algebra. Since V[ε^{-1}] is perfect, the same holds for R, in view of theorem 3.5.13(ii)

  Confirms the imported results are the Frobenius-compatibility of weakly etale maps and the finite etale equivalence over perfect bases, in arXiv numbering.

#### `tilting-finite-etale-algebras-fully-faithful` — Tilting of finite etale algebras: fully faithful functor R♭_fet → R_fet with identified essential image

*theorem.*

**Statement.** For R perfectoid over K with tilt R♭, A = R°a, Ā = A/ϖ = A♭/ϖ♭: the chain R_fet ← A_fet ≅ Ā_fet ≅ A♭_fet → R♭_fet (with A_fet ≅ Ā_fet by Theorem 4.17 and A♭_fet ≅ R♭_fet by Prop. 5.23) gives a fully faithful functor R♭_fet → R_fet, inverse to tilting on its image. The essential image consists of the finite etale S/R such that S is perfectoid and S°a is finite etale over R°a; in that case S°a is uniformly finite projective over R°a and the functor preserves degrees.

**Hypotheses.**

- Theorem 4.17 (needs A flat and ϖ-adically complete: true for A = R°a by Prop. 5.5) and Prop. 5.22 (finite etale over Ā is again perfectoid) make the middle equivalences land in perfectoid algebras.
- Full faithfulness of A_fet → R_fet is read off from the diagram (S°a determines S = S°a_*[1/ϖ]); the theorem does not yet assert essential surjectivity in characteristic 0 (that is Theorem 7.9).

**Construction, or proof, in steps.**

1. Prop. 5.22 shows finite etale algebras over perfectoid Ā are perfectoid Ā-algebras, so Thm 4.17 lifts them to perfectoid A- and A♭-algebras; Prop. 5.23 identifies A♭_fet with R♭_fet in characteristic p.
2. All finite etale algebras over A, Ā, A♭ are uniformly almost finitely presented by Thm 4.17 and Prop. 5.23.
3. Degrees are preserved because rank decompositions (Thm 4.11) are compatible with the equivalences.

**Acceptance.**

- For R = K a perfectoid field this is the input to Theorem 3.7; for K♭ algebraically closed the image is all of K_fet (Prop. 3.8 route).
- Neither ordinary etaleness of S° over R° nor freeness of S over R is asserted or needed.

**Prerequisites.**

- `PerfectoidSpaces:P0/finite-etale-lifting-along-complete-flat-almost-algebras`
- `PerfectoidSpaces:P3/finite-etale-covers-in-characteristic-p`
- `mathlib:CategoryTheory.Equivalence`
- `mathlib:Algebra.Etale`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 5, the diagram following Proposition 5.22, the diagram following Proposition 5.23, and Theorem 5.25, pp. 28-29 (extraction lines 1481-1494 and 1553-1565).

  > There is a fully faithful functor from R♭_fet to R_fet inverse to the tilting functor. The essential image of this functor consists of the finite etale covers S of R, for which S (with its natural topology) is perfectoid and S°a is finite etale over R°a.

  Exact statement of the pre-almost-purity comparison of finite etale categories.

#### `finite-extensions-of-perfectoid-fields` — Finite extensions of perfectoid fields are perfectoid and tilting is a degree-preserving equivalence

*theorem.* **Planet:** *Finite extensions of perfectoid fields*.

**Statement.** Let K be a perfectoid field. (i) Every finite extension L/K, with its natural topology, is a perfectoid field. (ii) L ↦ L♭ is an equivalence between finite extensions of K and of K♭, preserving degrees. Auxiliary: if K♭ is algebraically closed then K is algebraically closed (Prop. 3.8).

**Hypotheses.**

- Two proofs are sketched; the ramification-theory proof imports GR Propositions 6.6.2, 6.6.6 (deeply ramified fields; L°a/K°a etale) and 6.3.6 (L°a finite projective), which were read only as statements.
- The second proof reduces to K♭ algebraically closed and uses Krasner's lemma and Lemma 5.21; it relies on Theorem 5.25 for full faithfulness and degree preservation.

**Construction, or proof, in steps.**

1. Prop. 3.8: for monic irreducible P ∈ K°[X] of degree d with |a_0| = 1 (possible since |K^×| is a Q-vector space), pick Q ∈ K♭°[X] with the same image in K°/ϖ[X] = K♭°/ϖ♭[X] and a root y ∈ K♭°; P(y♯) is divisible by ϖ, so P_1(X) = c^{-d} P(cX + y♯) with |c|^d = |P(y♯)| has integral coefficients; iterate to converge to a root.
2. Second proof of 3.7: let M = completed algebraic closure of K♭ (perfect, complete, hence perfectoid), M♯ its untilt, algebraically closed by Lemma 5.21 and Prop. 3.8; the union N of the untilts L♯ of finite extensions L ⊂ M of K♭ is dense in M♯ and algebraically closed by Krasner; so any finite F/K lies in some Galois L♯, is cut out by a subgroup H of Gal(L♯/K) = Gal(L/K♭), and F♭ = L^H untilts to F by full faithfulness and degree count.

**Acceptance.**

- Q_p(p^{1/p^∞})^ and F_p((t^{1/p^∞}))^ have isomorphic absolute Galois groups (Theorem 1.1); the equivalence is compatible with Galois groups because it preserves degrees and automorphisms.
- For K = Q_p^cycl and L = K(p^{1/2}), L is perfectoid and L♭ is a degree-2 extension of K♭.

**Prerequisites.**

- `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`
- `PerfectoidSpaces:P3/tilting-finite-etale-algebras-fully-faithful`
- `mathlib:Valuation`
- `mathlib:Algebra.Etale`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 3, Theorem 3.7, Proposition 3.8 with proof, pp. 17-18, and the proof of Theorem 3.7 at the end of Section 5, p. 29 (extraction lines 899-929 and 1566-1594).

  > Now Krasner's lemma implies that N is algebraically closed. Hence any finite extension F of K is contained in N; this means that there is some Galois extension L of K♭ such that F is contained in L♯.

  The reduction of the equivalence for finite extensions to the algebraically closed case.

- gr-almost — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*, Propositions 6.3.6, 6.6.2 and 6.6.6, statements (extraction lines 9020-9023, 9983-9988, 10029-10040, in that order).

  > (ii) The morphism of almost algebras (K^+)^a → (K^{s+})^a is weakly etale; ... Moreover, the above equivalent conditions imply that the valuation of K is not discrete.

  The ramification-theoretic alternative proof's imports, verified as statements only.

#### `strongly-etale-morphisms-and-base-change` — Finite etale, etale and strongly (finite) etale morphisms; base change

*definition.* **Planet:** *Strongly etale morphisms*.

**Statement.** (Def. 7.1) A morphism (R, R^+) → (S, S^+) of affinoid k-algebras is finite etale if S is finite etale over R with the induced topology and S^+ is the integral closure of R^+ in S; a morphism of adic spaces is finite etale if locally on the target it is of this affinoid form, and etale if locally on source and target it factors as an open embedding followed by a finite etale map. (Def. 7.2) A morphism of perfectoid affinoid K-algebras is strongly finite etale if additionally S°a is finite etale over R°a, with the corresponding local notions of strongly finite etale and strongly etale maps of perfectoid spaces; f is strongly (finite) etale iff its tilt is, and in characteristic p (finite) etale implies strongly (finite) etale. (Lemma 7.3, Prop. 7.10) Strongly (finite) etale maps are stable under base change along arbitrary maps of perfectoid spaces, with affinoid formula D = A ⊗_B C, D^+ = integral closure of C^+ in D, and surjective on the topological fibre product; the same holds for (finite) etale maps from adic spaces to perfectoid targets in characteristic p, and, after Theorem 7.9, in characteristic 0.

**Hypotheses.**

- For locally noetherian adic spaces these notions agree with Huber's (Example 1.6.6 ii), Lemma 2.2.8 of [Hub96]); this comparison was not read.
- Surjectivity onto |X| ×_{|Z|} |Y| is imported from the argument of [19], proof of Lemma 3.9(i), where [19] is Huber, A generalization of formal schemes and rigid analytic varieties, Math. Z. 217 (1994). The printed statement of Lemma 7.3(i) writes |X ×_Z Y| → |X| ×_{|Z|} |Y| where |X ×_Y Z| → |X| ×_{|Y|} |Z| is meant.

**Construction, or proof, in steps.**

1. Lemma 7.3(ii): A ⊗_B C is finite projective over C, hence complete; the universal property follows; base change preserves finite etale almost algebras.
2. (i) reduces to (ii) via the definition; open embeddings are preserved by fibre products.
3. (iv): Prop. 5.23 shows D = A ⊗_B C is perfectoid, so Spa(D, D^+) is a perfectoid space; (iii) reduces to (iv).

**Acceptance.**

- A finite etale cover of a perfectoid affinoid pulled back along a rational localization is given by the tensor product with the localization (used in Thm 7.9(ii)).
- In characteristic 0 the identification etale = strongly etale is a theorem (7.9), not part of the definition.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `IsFiniteEtale` | data | Finite etale morphisms of perfectoid spaces. |
| `IsEtale` | data | Etale morphisms, defined as compositions of open immersions and finite etale maps. |
| `IsStronglyEtale` | data | Strongly etale morphisms, the class for which the integral structure is also almost etale. |
| `IsStronglyEtale.baseChange` | compatibility | Stability under base change. |
| `IsStronglyEtale.comp` | functoriality | Stability under composition. |

**Uses.**

- `PerfectoidSpaces:P3/strongly-finite-etale-maps-are-affinoid-over-affinoids`: the affinoid statement is about this class
- `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`: the etale site is built from these morphisms

**Unit tests.** A plausible wrong definition fails one of these.

- `strongly_is_stronger`: Strongly finite etale implies finite etale and not conversely; the integral condition is extra.
- `base_change`: The classes are stable under base change, which is what makes the etale site a site.
- `open_immersion`: An open immersion is etale but not finite etale; the three classes are genuinely different.

**Prerequisites.**

- `PerfectoidSpaces:P3/tilting-finite-etale-algebras-fully-faithful`
- `mathlib:Algebra.Etale`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 7, Definitions 7.1-7.2, Lemma 7.3 with proof, Proposition 7.10, pp. 39-40 and 43 (extraction lines 2185-2269 and 2417-2419).

  > From the definitions, Proposition 6.17, and Theorem 5.25, we see that f : X → Y is strongly finite etale, resp. strongly etale, if and only if the tilt f♭ : X♭ → Y♭ is strongly finite etale, resp. strongly etale.

  The tilting invariance of the strong notions, which is what makes the reduction to characteristic p possible.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 6, Definition 6.2 and following paragraph, p. 26 (extraction lines 1177-1198).

  > In particular, it is proved there that a morphism is finite etale if and only if there is a cover by open affinoid perfectoid U = Spa(R, R^+) ⊂ X such that their preimages V = Spa(S, S^+) ⊂ Y are affinoid perfectoid, R → S is finite etale, and S^+ is the integral closure of R^+ in S.

  ECD's definition quantifies over all affinoid perfectoid opens; the equivalence with Sch12's 'exists a cover' definition is Prop. 7.6 plus Thm 7.9.

#### `strongly-finite-etale-maps-are-affinoid-over-affinoids` — Preimages of affinoid perfectoids under strongly finite etale maps are affinoid; local structure of etale maps in characteristic p

*lemma.*

**Statement.** (Prop. 7.6) If f: X → Y is strongly finite etale and V ⊂ Y is open affinoid perfectoid, then U = f^{-1}(V) is affinoid perfectoid and (O_Y(V), O^+_Y(V)) → (O_X(U), O^+_X(U)) is strongly finite etale; hence in characteristic p finite etale covers of Spa(R, R^+) are the finite etale covers of R. (Prop. 7.7) In characteristic p an etale map of perfectoid spaces is locally the base change of an etale map U' → V' of affinoid noetherian adic spaces over K. (Cor. 7.8) Strongly etale maps are open and strongly (finite) etale maps compose.

**Hypotheses.**

- Reduction to characteristic p by tilting (Theorem 5.25) and to R^+ a K°-algebra by shrinking K.
- Imports for noetherian adic spaces: [Hub96] Example 1.6.6(ii), Proposition 1.7.8 (openness), Proposition 1.6.7(ii) (composition); not read.

**Construction, or proof, in steps.**

1. Write (R, R^+) as a completed direct limit of p-finite (R_i, R_i^+) (Lemma 6.13); the finitely many rational subsets over which X is finite etale, the covers, the gluing data and cocycle conditions are all defined at a finite level by Lemma 7.5(i) and quasi-separatedness of Y.
2. By Lemma 7.3(ii) reduce to (R, R^+) p-finite, the completed perfection of tft (S, S^+); by Lemma 7.5(ii) X is defined as a finite etale cover of Z = Spa(S, S^+), where the noetherian result applies, and Lemma 7.3(iv) transfers it back.
3. Prop. 7.7 and Cor. 7.8 follow by the same reduction.

**Acceptance.**

- A finite etale cover of the perfectoid closed disc glued from covers of two rational pieces with compatible gluing is the analytification of a single finite etale algebra over K⟨T^{1/p^∞}⟩.
- Openness of strongly etale maps is deduced, not assumed.

**Prerequisites.**

- `AdicEtaleGeometry:A1`
- `PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids`
- `PerfectoidSpaces:P3/henselian-finite-etale-approximation`
- `PerfectoidSpaces:P3/strongly-etale-morphisms-and-base-change`
- `tauceti:TauCeti.ValuationSpectrum.spa`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 7, Propositions 7.6-7.7 and Corollary 7.8 with proofs, pp. 41-42 (extraction lines 2310-2353).

  > Indeed, there are finitely many rational subsets of Y over which we have a finite etale cover; by Lemma 7.5 (i), these are defined over a finite level, and because Y is quasi-separated, also the gluing data over intersections (as well as the cocycle condition) are defined over a finite level.

  The finite-level descent step that reduces to the noetherian case.

#### `almost-purity-theorem` — Almost purity: finite etale covers of a perfectoid affinoid are perfectoid with almost finite etale integral closure

*theorem.* **Planet:** *The almost purity theorem*.

**Statement.** Let (R, R^+) be perfectoid affinoid over K, X = Spa(R, R^+). (i) For any open affinoid perfectoid U ⊂ X, global sections give a fully faithful functor from strongly finite etale covers of U to finite etale O_X(U)-algebras. (ii) This functor is an equivalence. (iii) For any finite etale S/R, S is perfectoid, S°a is finite etale over R°a, and S°a is uniformly almost finitely generated over R°a. Consequently every (finite) etale map of perfectoid spaces is strongly (finite) etale. ECD Theorem 6.1 records (i) S perfectoid, (ii) tilting is an equivalence of finite etale categories, (iii) S° almost finite etale over R°, for any perfectoid Tate ring.

**Hypotheses.**

- Perfectoid base field K (Sch12); ECD's Tate-ring statement cites [KL15, 3.6.21, 5.5.9] and [Fal02] in addition and is not proved in the sources read.
- Inputs: Prop. 7.6, Theorem 5.25, Lemma 7.5(i) (finite etale covers of the completed residue field come from neighbourhoods), Theorem 3.7 (perfectoid fields), Lemma 7.3(ii), the sheaf property of O_X and O_Y, and flatness of S over R.

**Construction, or proof, in steps.**

1. (i): by Prop. 7.6 and Thm 5.25, strongly finite etale covers of U are the finite etale O_X(U)°a-algebras, a full subcategory of finite etale O_X(U)-algebras.
2. (ii), local step: for x ∈ X, 2-colim_{x ∈ U} (O_X(U))_fet ≅ (k(x)^)_fet by Lemma 7.5(i); k(x)^ is perfectoid and by Theorem 3.7 (k(x)^)_fet ≅ (k(x♭)^)_fet; so 2-colim (O_X(U))_fet ≅ 2-colim (O_{X♭}(U♭))_fet; choose V♭ finite etale over some U♭ whose global sections tilt to S ⊗ k(x)^ up to shrinking, and untilt to a strongly finite etale V → U.
3. (ii), global step: get a finite rational cover X = ∪ U_i with strongly finite etale V_i = Spa(S_i, S_i^+) → U_i, S_i = O_X(U_i) ⊗_R S; by Lemma 7.3(ii) these glue to a strongly finite etale Y → X, affinoid by Prop. 7.6, Y = Spa(A, A^+); the sheaf sequence of O_Y is the sheaf sequence of O_X tensored with the flat R-module S, so A = S.
4. (iii): formal from (ii), Prop. 7.6 and Thm 5.25.

**Acceptance.**

- Every finite etale R-algebra S, for R perfectoid over K, is itself perfectoid with S°a finite etale over R°a; the three assertions of ECD 6.1 are recovered with 'almost finite etale' meaning finite etale in the almost category, not etaleness of S° over R°.
- Test: R = Q_p^cycl⟨T^{±1/p^∞}⟩ and the Kummer cover S = R[T^{1/ℓ}] for ℓ ≠ p, and a wildly ramified Artin-Schreier-Witt type cover, both have S°a uniformly almost finitely generated over R°a.

**Prerequisites.**

- `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`
- `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets`
- `PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields`
- `PerfectoidSpaces:P3/henselian-finite-etale-approximation`
- `PerfectoidSpaces:P3/strongly-finite-etale-maps-are-affinoid-over-affinoids`
- `mathlib:Algebra.Etale`
- `mathlib:Module.Projective`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 7, Theorem 7.9 with proof, pp. 42-43 (extraction lines 2354-2416).

  > Because S is flat over R, tensoring is exact, and the first sequence is identified with the second sequence after ⊗_R S. Therefore A = S, as desired.

  The final identification in the proof of (ii), which needs the sheaf property from P2 and flatness of S.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 6, Theorem 6.1, p. 26 (extraction lines 1170-1176).

  > (i) For any finite etale R-algebra S, S is perfectoid. (ii) Tilting induces an equivalence {Finite etale R-algebras} → {Finite etale R♭-algebras} (iii) For any finite etale R-algebras S, S° is almost finite etale over R°.

  The three-part statement demanded by the stage (ECD 6.1).

#### `etale-site-tilting-and-etale-almost-acyclicity` — The etale site of a perfectoid space, its tilting isomorphism, and almost acyclicity of O°a on X_et

*comparison.*

**Statement.** The etale site X_et of a perfectoid space X has objects the perfectoid spaces etale over X and coverings the topological coverings; tilting induces an isomorphism of sites X_et ≅ X♭_et, functorial in X (Thm 7.12; ECD 6.3). U ↦ O_U(U) is a sheaf on X_et, and H^i(X_et, O_X°a) = 0 for i > 0 when X is affinoid perfectoid (Prop. 7.13; ECD 6.3 states H^i(X_et, O^+_X) almost zero and H^0 = R^+).

**Hypotheses.**

- Site axioms rely on Lemma 7.3, Prop. 7.10 and Cor. 7.8 (base change, composition, openness); a morphism to a locally noetherian adic space also induces a morphism of sites.
- Prop. 7.13's proof covers X by finitely many etale U_i given as rational subsets of finite etale covers of rational subsets, reduces by tilting to characteristic p and to p-finite (R, R^+), and uses that the analogous sequence for noetherian adic spaces is exact up to a bounded ϖ-power (imported, unread).

**Construction, or proof, in steps.**

1. Thm 7.12 is 'immediate' from the tilting invariance of strongly etale maps and Thm 7.9 (etale = strongly etale).
2. Prop. 7.13: exactness of the etale Čech complex of O°a for the stated covers; after tilting and reduction to p-finite algebras, take the perfection of the bounded-torsion exact sequence.

**Acceptance.**

- For a finite etale Galois cover Y → X of affinoid perfectoids, H^i(G, O_Y°a) is almost zero for i > 0 and (O_Y°a)^G = O_X°a (a special case of the Čech statement).
- The site isomorphism is compatible with the underlying topological homeomorphism |X| = |X♭|.

**Prerequisites.**

- `PerfectoidSpaces:P2/p-finite-acyclicity-from-tate`
- `PerfectoidSpaces:P3/almost-purity-theorem`
- `mathlib:TopCat.Presheaf`
- `mathlib:CategoryTheory.Equivalence`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 7, Definition 7.11, Theorem 7.12, Proposition 7.13 with proofs, p. 43 (extraction lines 2420-2452).

  > Under tilting, this reduces to the assertion in characteristic p, and then to the assertion for p-finite (R, R^+). In that case, one uses that the analogous sequence for noetherian adic spaces is exact up to a bounded ϖ-power, and hence after taking the perfection almost exact.

  The proof of etale almost acyclicity and its imported noetherian input.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 6, Theorem 6.3, p. 26 (extraction lines 1199-1204).

  > If X = Spa(R, R^+) is affinoid perfectoid, then the R^+-module H^i(X_et, O^+_X) is almost zero for i > 0, and H^0(X_et, O^+_X) = R^+.

  The stage's ECD 6.3 target, including the H^0 identification.

#### `henselian-finite-etale-approximation` — Finite etale algebras over henselian K°-algebras and their completions; finite-stage descent of finite etale covers

*theorem.*

**Statement.** (Prop. 7.4) For a flat K°-algebra A henselian along (ϖ), finite etale A[ϖ^{-1}]-algebras and finite etale Â[ϖ^{-1}]-algebras are equivalent (Â the ϖ-adic completion). (Lemma 7.5) (i) If A_i is a filtered direct system of complete flat K°-algebras and A the completion of their direct limit, then A[ϖ^{-1}]_fet ≅ 2-colim A_i[ϖ^{-1}]_fet; in particular for perfectoid R_i with completed direct limit R, R_fet ≅ 2-colim (R_i)_fet. (ii) In characteristic p, for (R, R^+) p-finite from (S, S^+), R_fet ≅ S_fet.

**Hypotheses.**

- A flat over K° and henselian along (ϖ): ϖ-adically complete algebras are henselian along (ϖ), and direct limits of algebras henselian along (ϖ) are henselian along (ϖ) (recalled without proof).
- Prop. 7.4 is imported from Gabber-Ramero (book Proposition 5.4.53 = arXiv Proposition 5.4.54, requiring the assumptions of Proposition 5.4.21: t a nonzerodivisor, (R, tI) henselian, R^∧ the (t, I)-adic completion); the proof (Elkik-type approximation, Theorem 5.4.38, Corollary 5.4.42, Lemmas 5.4.46, 5.4.53) was not read.
- Placement: the atlas stage P5 assigns this henselian finite-stage approximation to P5, but Sch12 uses Lemma 7.5(i) inside the proofs of Proposition 7.6 and Theorem 7.9 (almost purity, stage P3); since P5 requires P3 in the atlas, the node is filed under P3 and exported to P5 and P7 (see gap 'Reversed dependency').

**Construction, or proof, in steps.**

1. Lemma 7.5(i): finite etale covers and their morphisms are finitely presented objects, so (colim A_i[ϖ^{-1}])_fet ≅ 2-colim A_i[ϖ^{-1}]_fet; colim A_i is henselian along (ϖ), so Prop. 7.4 identifies this with A[ϖ^{-1}]_fet.
2. Lemma 7.5(ii): R_fet ≅ 2-colim (S^{1/pⁿ})_fet by (i), and each (S^{1/pⁿ})_fet ≅ S_fet.

**Acceptance.**

- A finite etale cover of the completed direct limit is, with all its morphisms, defined and unique at a finite stage (used in Prop. 7.6, Thm 7.9, ECD 6.4(i)).
- Uniqueness of the finite-stage descent is part of the 2-colimit equivalence, not only existence.

**Prerequisites.**

- `mathlib:Algebra.Etale`
- `mathlib:IsAdicComplete`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 7, Proposition 7.4 and Lemma 7.5 with proofs, pp. 40-41 (extraction lines 2270-2309).

  > Because finite etale covers, and morphisms between these, are finitely presented objects, we have (colim A_i[ϖ^{-1}])_fet ≅ 2-colim A_i[ϖ^{-1}]_fet. On the other hand, colim A_i is henselian along (ϖ), hence the left-hand side agrees with A[ϖ^{-1}]_fet by Proposition 7.4.

  The two-step argument (finite presentation, then henselian comparison with the completion).

- gr-almost — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*, Section 5.4 introduction, Proposition 5.4.21 and Proposition 5.4.54 with the opening of its proof (extraction lines 6499-6512, 6764-6769, 7032-7046).

  > Proposition 5.4.54. Resume the assumptions of proposition 5.4.21. Then the base change functor R[t^{-1}]-Alg → R^∧[t^{-1}]-Alg induces an equivalence of categories from the category of finite etale R[t^{-1}]-algebras to the category of finite etale R^∧[t^{-1}]-algebras.

  Identifies the imported henselian approximation theorem and its hypotheses ((R, tI) henselian, t a nonzerodivisor) in the arXiv numbering.

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 6, proof of Proposition 6.4(i), p. 27 (extraction lines 1345-1349).

  > This is a consequence [Sch12, Lemma 7.5 (i)] of a theorem of Elkik, [Elk73], (in the noetherian case) and Gabber-Ramero, [GR03, Proposition 5.4.53], in general.

  Confirms the provenance chain Elkik/Gabber-Ramero → Sch12 7.5 → ECD 6.4(i).

---

## P4 Morphisms and perfectoid quotients

**Coverage: not_read.** Not decomposed. The integrated decomposition has no node for this layer, and this packet adds none: RS-05 narrows the layer to perfectoid open and closed immersions and the Zariski-closed-locus criteria over an existing adic immersion carrier, with the strong closed quotient theorem an explicit import, and no source for those statements was read for this packet.

**Remaining in this layer:**

- ECD §5 (Definition 5.1 - Proposition 5.11: injections, qcqs criteria on (C, C^+)-points, immersions, Zariski closed immersions, diagonals, separatedness) was indexed but not read in this session.

**Not decomposed.** The integrated decomposition has no node for this layer, and this packet
adds none. RS-05 narrows it to perfectoid open and closed immersions and the Zariski-closed-locus criteria over
an existing adic-immersion carrier, with the strong closed quotient theorem an explicit import, and no source
for those statements was read here. The coverage note says what a continuation job needs.

### Nodes (0)

---

## P5 Limits and étale finite-stage descent

**Coverage: partial.** Cofiltered limits of affinoid perfectoids with their cardinal bounds, and finite-stage descent of qcqs etale objects along such limits.

**Remaining in this layer:**

- Correction to the stage text: the Gabber-Ramero finite etale approximation (Sch12 Prop. 7.4 / Lemma 7.5) is consumed by P3's almost purity proof, so it is recorded as node PerfectoidSpaces:P3/henselian-finite-etale-approximation and imported here rather than proved here.
- Gabber-Ramero Proposition 5.4.54 (book 5.4.53) proof and its inputs (Theorem 5.4.38, Corollary 5.4.42, Lemmas 5.4.46, 5.4.53; Elkik's approximation theory): statements read only.
- Preservation of henselianity along (ϖ) under direct limits and for complete algebras: recalled without proof in Sch12.
- ECD Lemma 4.1 (cutoff cardinals) and the size bound in Proposition 6.4: not read in detail.
- ECD 6.4(iv) is deliberately excluded (P6/A3).

Cofiltered limits of affinoid perfectoids, with the cardinal bounds that make them behave, and
finite-stage descent along them: a qcqs étale object over the limit comes from a finite stage. This is the
machinery the pro-étale presentations later depend on.

**Planets of this layer** (2): *Cofiltered limits*, *Finite-stage descent*.

### Nodes (2)

#### `cofiltered-limits-of-affinoid-perfectoid-spaces` — Cofiltered limits of affinoid perfectoid spaces; ω₁-cofiltered limits; countably generated presentations

*construction.* **Planet:** *Cofiltered limits*.

**Statement.** For a cofiltered diagram X_i = Spa(R_i, R_i^+) of affinoid perfectoid spaces, the limit X = lim X_i exists in perfectoid spaces and is X = Spa(R, R^+) with R^+ the ϖ-adic completion of colim R_i^+ (ϖ a compatible pseudouniformizer for large i) and R = R^+[ϖ^{-1}]; |X| → lim |X_i| is a homeomorphism of spectral spaces. If I is ω₁-cofiltered then colim R_i → R and colim R_i^+ → R^+ are bijective. Every affinoid perfectoid space is an ω₁-cofiltered limit of affinoid perfectoid spaces with topologically countably generated R_i, R_i^+.

**Hypotheses.**

- The R_i are perfectoid Tate rings (ECD generality); the claim that (R, R^+) is again perfectoid is used without proof in the statement.
- The homeomorphism (o) is imported from [Hub93a, Prop. 3.9] via Sch12 Lemma 6.13(ii).

**Construction, or proof, in steps.**

1. Universal property from uniformity: a compatible family Y → X_i gives colim R_i^+ → O^+(Y), which extends uniquely to the ϖ-adic completion R^+ because O^+(Y) is complete, inducing (R, R^+) → (O(Y), O^+(Y)).
2. ω₁-cofiltered: any Cauchy sequence in colim R_i^+ already lives in some R_i^+, so the colimit is complete.
3. Countable generation: (R, R^+) is the (automatically ω₁-filtered) colimit of the perfectoid sub-pairs admitting a countable dense subset.

**Acceptance.**

- Spa Q_p^cycl⟨T^{1/p^∞}⟩ = lim_n Spa Q_p^cycl⟨T^{1/pⁿ}⟩ in perfectoid spaces? No: the finite-level spaces are not perfectoid, so this is a tilde-limit (P7), not an instance of this node; the node applies to towers of perfectoid affinoids, e.g. lim_n Spa(R_n, R_n^+) with all R_n perfectoid.
- For a countable tower (I = N) the uncompleted colimit is not complete in general; the ω₁ hypothesis is necessary for the bijectivity statement.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `PerfectoidSpace.cofilteredLimit` | data | The limit of a cofiltered system of affinoid perfectoid spaces, as an affinoid perfectoid. |
| `PerfectoidSpace.cofilteredLimit.isPerfectoid` | structure | The limit is perfectoid. |
| `PerfectoidSpace.cofilteredLimit.cardinalBound` | structure | The cardinal bound under which the construction is carried out. |
| `PerfectoidSpace.cofilteredLimit.omega1` | example | The countably cofiltered case, which is the one the descent statement uses. |
| `PerfectoidSpace.cofilteredLimit.universal` | universal-property | The universal property in the category of affinoid perfectoids. |

**Uses.**

- `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`: descent is stated along these limits
- `PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison`: the tilde-limits of the last layer are compared with these

**Unit tests.** A plausible wrong definition fails one of these.

- `limit_is_affinoid`: The limit of affinoid perfectoids is affinoid perfectoid; the corresponding statement without the perfectoid hypothesis is false.
- `cardinal_bound`: The construction carries a cardinal bound; without it the colimit of the algebras need not be well behaved.
- `countable_case`: In the countably cofiltered case the limit is the completion of the colimit of the algebras.

**Prerequisites.**

- `mathlib:CategoryTheory.Limits.limit`
- `mathlib:Filter`

**Sources.**

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 6, Proposition 6.4(o) and Proposition 6.5 with proof, pp. 27 and 29 (extraction lines 1210-1220 and 1313-1343).

  > The first part follows from uniformity of perfectoid spaces, which means that whenever Y maps compatibly to all X_i, the map colim R_i^+ → O^+(Y) extends uniquely to the ϖ-adic completion R^+

  The uniformity argument for the universal property, and the ω₁-cofiltered refinement demanded by the stage (ECD 6.5).

#### `finite-stage-descent-of-qcqs-etale-objects` — Finite-stage descent along cofiltered limits: finite etale, qcqs etale and qc separated etale objects

*theorem.* **Planet:** *Finite-stage descent*.

**Statement.** In the situation of the previous node: (i) 2-colim (X_i)_fet → X_fet is an equivalence; (ii) 2-colim (X_i)_{et,qcqs} → X_{et,qcqs} is an equivalence; (iii) 2-colim (X_i)_{et,qc,sep} → X_{et,qc,sep} is an equivalence. Size: if I is λ-small for λ < κ and all X_i are κ'-small for a strong limit cardinal κ' < κ (κ as in ECD Lemma 4.1) then X is κ-small. Part (iv) (affinoid etale objects) is excluded here and belongs to P6/A3.

**Hypotheses.**

- Uses (o) (|X| = lim |X_i| as spectral spaces), (i) (from Lemma 7.5(i)), approximation of quasicompact open subsets of inverse limits of spectral spaces at finite level, and that graphs of maps between etale spaces over X are quasicompact open immersions.
- The size statement uses ECD Lemma 4.1 (cofinal class of cardinals κ with κ_λ of cofinality > λ), not read in detail.

**Construction, or proof, in steps.**

1. Faithfulness: two maps f_i, g_i: Y_i → Y_i' equal after pullback have graphs Γ_{f_i}, Γ_{g_i} whose quasicompact open images in |Z_i| = |Y_i ×_{X_i} Y_i'| agree after pullback to |Z| = lim |Z_j|, hence agree in |Z_j| for large j.
2. Isomorphism detection: if f_i pulls back to an isomorphism then f_j is surjective for large j (image is quasicompact open, Y' → Y_i' factors through it at a finite stage); applying this to the diagonal Δ_{f_i} (an injection) shows Δ_{f_j} is an isomorphism, hence f_j is.
3. Fullness: the graph Γ_f ⊂ Y ×_X Y' is a quasicompact open immersion approximated by V_j ⊂ Y_j ×_{X_j} Y_j'; V_j → Y_j becomes an isomorphism after pullback, hence at a finite stage; compose the inverse with the projection to Y_j'.
4. Essential surjectivity: a qcqs etale Y → X is covered by finitely many pieces which are composites of rational opens, a finite etale map and a rational open, each descending by (i); pieces glue at a finite stage by full faithfulness.
5. (iii): separatedness of f_j for large j since an open-and-closed quasicompact subset of an inverse limit of spectral spaces (here the diagonal) descends to an open-and-closed subset at a finite stage.

**Acceptance.**

- A finite etale cover of a limit of perfectoid affinoids is the pullback of one at a finite stage, uniquely up to unique isomorphism at a later stage.
- The affinoid statement (iv) requires the extra input (Hub96 1.7.1 / KL16 pseudocoherent sheaves / FS IV.4.19) and is not proved here.

**Prerequisites.**

- `PerfectoidSpaces:P3/henselian-finite-etale-approximation`
- `PerfectoidSpaces:P3/strongly-finite-etale-maps-are-affinoid-over-affinoids`
- `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`
- `mathlib:CategoryTheory.Limits.limit`
- `mathlib:Algebra.Etale`

**Sources.**

- ecd-2026 — Peter Scholze, *Etale cohomology of diamonds*, Section 6, Proposition 6.4 (i)-(iii) with proof, pp. 27-28 (extraction lines 1210-1300).

  > The graph Γ_f : Y ↪ Y ×_X Y' is a quasicompact open embedding. By approximation of quasicompact open subsets, we can find a quasicompact open immersion V_j ⊂ Y_j ×_{X_j} Y_j' whose pullback agrees with the image of Γ_f.

  The graph-approximation argument for fullness demanded by the stage ('full faithfulness through graph approximation').

---

## P6 Affinoid approximation and pro-étale presentations

**Coverage: not_read.** Not decomposed. The integrated decomposition has no node for this layer and this packet adds none; RS-05 retains cardinal-bounded perfectoid presentations and w-local preliminaries here, and no source for them was read.

**Remaining in this layer:**

- ECD 6.4(iv) with its inputs (Hub96 1.7.1, KL16 pseudocoherent sheaves, FS IV.4.19), ECD 7.9-7.11 (pro-etale maps) and ECD 4.2-4.4 (κ-small perfectoid spaces): not read.

**Not decomposed**, like P4. RS-05 retains cardinal-bounded perfectoid presentations, closure
bounds, coverings and w-local preliminaries here; no source for them was read for this packet, and nothing is
invented.

### Nodes (0)

---

## P7 Tilde-limits and Frobenius-controlled towers

**Coverage: partial.** The tilde-limit comparison of etale topoi. Only the comparison node is decomposed; the Frobenius-controlled towers and the perfectoid criterion for tilde-limits that RS-05 also assigns to this layer are recorded as a gap in the decomposition and carried forward here.

**Remaining in this layer:**

- Huber [Hub96] Remark 2.4.3, Proposition 2.4.4, Corollary 2.4.6 and the remark after Proposition 2.3.7, on which Proposition 7.16 - Corollary 7.19 are proved 'by the same proof': not read.
- The Frobenius-controlled integral tower theorem (torsion paper II.1-II.2) giving the perfectoid criterion for A_i^+ with eventual Frobenius lifting: not read; the source scholze-torsion.txt is in the library.
- Uniqueness in the perfectoid representable class, restriction to rational opens, cofinal change of index and finite etale base change of tilde-limits: not in Sch12 §7; the Shimura source (Hansen-Johansson) is in the scratch library but unread.

The tilde-limit comparison: for `X ~ lim X_i` of noetherian adic spaces, the étale topos of the
limit is the limit of the étale topoi. Only this comparison is decomposed; the Frobenius-controlled towers and
the perfectoid criterion for tilde-limits that RS-05 also assigns here are recorded as a gap and carried
forward.

### Nodes (1)

#### `tilde-limits-and-etale-topos-comparison` — Tilde-limits X ~ lim X_i of noetherian adic spaces and the comparison of etale topoi

*comparison.*

**Statement.** For a perfectoid space X with compatible maps φ_i: X → X_i to a filtered inverse system of noetherian (qcqs, locally strongly noetherian) adic spaces over K, write X ~ lim X_i if |X| → lim |X_i| is a homeomorphism and for every x ∈ X the map colim k(x_i) → k(x) has dense image. Then |X| is spectral; for Y → X_i etale, Y ×_{X_i} X ~ lim_{j ≥ i} Y ×_{X_i} X_j; X_et^~ is the projective limit of the fibred topos (X_{i,et}^~); colim H^n(X_{j,et}, F_j) ≅ H^n(X_et, F) for abelian sheaves F_i on X_{i,et}; and if all transition maps induce purely inseparable extensions on completed residue fields and homeomorphisms then X_et^~ ≅ X_{i,et}^~ for every i.

**Hypotheses.**

- All X_i are qcqs noetherian adic spaces over K; X perfectoid (so its etale site is the one of Definition 7.11).
- Proofs are by reference to [Hub96] Remark 2.4.3, Proposition 2.4.4 (with the modification that etale maps factor locally as open immersion followed by finite etale, descended via Lemma 7.5), Corollary 2.4.6 and the remark after Proposition 2.3.7; none of these Huber arguments were read.
- The bijectivity-plus-density criterion (Prop. 7.16) shows that |X| → lim |X_i| bijective with dense residue-field images already implies a homeomorphism.

**Construction, or proof, in steps.**

1. Prop. 7.16 and Thm 7.17: transcribe Huber's proofs, replacing the appeal to [Hub96] 1.7.3 by the local factorization of etale maps and finite-stage descent of finite etale maps (Lemma 7.5).
2. Cor. 7.18 follows as in Huber Cor. 2.4.6; Cor. 7.19 from the invariance of the etale topos under purely inseparable universal homeomorphisms.

**Acceptance.**

- Spa K⟨T^{1/p^∞}⟩ ~ lim_n Spa K⟨T^{1/pⁿ}⟩ and Spa K⟨T^{±1/p^∞}⟩ ~ lim Spa K⟨T^{±1/pⁿ}⟩ (compatible-root disc and torus).
- Theorem 1.12/8.5's (P^n)^{ad} ~ lim_φ (P^n)^{ad} (Frobenius tower) is the source's application; in this case Cor. 7.19 does not apply but Thm 7.17 does.

**Prerequisites.**

- `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`
- `PerfectoidSpaces:P3/henselian-finite-etale-approximation`
- `mathlib:CategoryTheory.Limits.limit`
- `mathlib:TopCat.Presheaf`

**Sources.**

- sch12-perfectoid — Peter Scholze, *Perfectoid spaces*, Section 7, Definition 7.14, Remark 7.15, Proposition 7.16, Theorem 7.17, Corollaries 7.18-7.19 with proofs, pp. 43-44 (extraction lines 2453-2503).

  > The same proof as for Proposition 2.4.4 of [20] works, except that one uses that any etale morphism factors locally as the composite of an open immersion and a finite etale map instead of appealing to Corollary 1.7.3 of [20] on the top of page 128. The latter kind of morphisms can be descended to a finite level because of Lemma 7.5.

  The exact modification of Huber's argument; the rest of the proof is by reference and remains an unread boundary.

---

## Gaps

Each of these is something this packet could not establish from the sources read. None is papered over,
and no node depends on one without naming it.

### Tilting equivalence and untilt classification over general perfectoid Tate rings

Sch12 proves Theorems 5.2, 6.3 and 7.9 over a perfectoid base field K. ECD 3.12, 3.13, 3.17, 3.18, 3.24, 6.1 state the Tate-ring versions citing [KL15] (Theorems 3.6.5, 3.6.14, 3.6.21, 5.5.9) and [Fon13], with the remark 'the proof works in general' for 3.13 and 'straightforward to check' for 3.17. Next source action: read Kedlaya-Liu, Relative p-adic Hodge theory: foundations, §3.6 (library file KedlayaLiu_RelativePadicHodgeFoundations.pdf, scratch extraction available) and Fontaine, Perfectoides, presque purete et monodromie-poids (Fontaine_Perfectoides.pdf) for the untilt classification, then decide whether the P1 nodes can be restated over a perfectoid Tate base or must remain over a field.

### Almost deformation theory and cotangent-complex inputs cited from Gabber-Ramero (book numbering)

Verified as statements in the arXiv extraction: Propositions 3.2.9 and 3.2.16 (obstruction classes, torsors). Not located: 'Theorem 2.5.36' (the arXiv Theorem 2.5.36 is a Tor-vanishing criterion, so the book's 2.5.36 must be the almost transitivity/extension triangle) and 'Lemma 6.5.13 i)' (Frobenius vanishing). DD.0 is proposed as supplier for the classical cotangent complex and transitivity triangle; the almost-context versions (GR §2.5, §3.2) have no supplier stage. Next action: locate the corresponding statements in the LNM 1800 edition or in GR §2.5 of the arXiv version by content, and read Illusie III.2.1.2.3 / III.2.2.2.

### Rigid-analytic inputs of the sheaf theorem (BGR, Huber 1993/1994)

Proposition 6.10 imports BGR 6.2.4 Theorem 1, 7.3.2 Corollary 10 and Tate's acyclicity 8.2.1 Theorem 1 through Huber [19] Proposition 4.3; Lemma 6.13 imports [31] Theorem 5.2 (powerbounded = integral over K°⟨T⟩ for reduced tft) and Huber Proposition 2.11 (completion does not change Spa); Corollary 6.8 uses Huber Proposition 2.14 (universal property of rational localization). AdicSpacesPartII:R3 is proposed as supplier for Tate acyclicity only; no atlas stage description mentions the boundedness statements. Next action: read Huber, A generalization of formal schemes and rigid analytic varieties (Math. Z. 1994) §§1-4 and BGR 6.2.4, 7.3.2, 8.2.1, then check R3's packet for the tft acyclicity statement.

### Huber's locally noetherian etale theory and the tilde-limit comparison

Sch12 §7 proves Propositions 7.6-7.8, 7.13 and 7.16-7.19 by reduction to [Hub96] (Example 1.6.6(ii), Lemma 2.2.8, Propositions 1.6.7(ii), 1.7.8, Remark 2.4.3, Proposition 2.4.4, Corollary 2.4.6, remark after 2.3.7) and to bounded-torsion exactness of etale Čech complexes of O° on noetherian adic spaces. The library has SUP_Huber_EtaleCohomology_1996.pdf (text extracted with OCR caveats). AdicEtaleGeometry:A1 is proposed as supplier for the finite etale/etale comparison; the tilde-limit topos comparison has no identified supplier. Next action: read Hub96 §§1.6-1.7 and §2.4 and record which statements A1 actually covers.

### Elkik/Gabber-Ramero henselian approximation (GR arXiv 5.4.54 = book 5.4.53)

The statement was verified (finite etale R[t^{-1}]-algebras ≅ finite etale R^∧[t^{-1}]-algebras under the assumptions of GR 5.4.21: t a nonzerodivisor and (R, tI) henselian). Its proof via Theorem 5.4.38, Corollary 5.4.42 and Lemmas 5.4.46, 5.4.53 (groupoid of etale algebra structures on a projective module) was not read, nor was Elkik's noetherian original. The stage text asks for lifting and uniqueness statements: uniqueness is part of the equivalence. Next action: read GR §5.4 (extraction lines 6499-7053) in full.

### Frobenius-controlled towers and the perfectoid criterion for tilde-limits

Sch12 §7 only defines tilde-limits and compares etale topoi; the criterion producing a perfectoid tilde-limit from an integral tower with eventual Frobenius lifting modulo p (torsion paper, Lemma II.2.1 / Cor. II.2.3 range) and the Shimura-variety cofinality arguments (Hansen-Johansson) were not read. Library sources: text/scholze-torsion.txt and the scratch extraction of Hansen-Johansson. No packet node claims these results.

### Candidate Lean primitives (unchecked against the nodes)

Mathlib (as vendored in the TauCeti project) has Mathlib.RingTheory.Perfection (Perfection, PerfectionMap, ModP, PreTilt = Perfection of O/(p), Tilt = FractionRing (PreTilt) for a field with a real valuation), Mathlib.RingTheory.Perfectoid.Untilt (PreTilt.untilt : PreTilt O p →* O for p-adically complete O), Mathlib.RingTheory.Perfectoid.FontaineTheta (fontaineTheta : 𝕎 R♭ →+* R and surjectivity under Frobenius surjectivity on R/p), Mathlib.RingTheory.Perfectoid.BDeRham, and Mathlib.RingTheory.WittVector. These cover parts of the tilt-of-a-field construction and of Lemma 3.14(i); none covers perfectoid Tate rings, the kernel description of θ, almost mathematics, or any sheaf-theoretic statement. The TauCeti sources contain no perfectoid material (grep for 'perfectoid' returned nothing). Implementation status of every node remains unchecked.

### Reversed dependency: henselian finite-stage approximation is needed by P3, not first by P5

Stage P5's text ('Prove finite etale finite-stage approximation using the henselian-pair/approximation theorem cited from Gabber-Ramero 5.4.53') places Sch12 Proposition 7.4 and Lemma 7.5 after almost purity, but the proof of Theorem 7.9(ii) uses Lemma 7.5(i) to identify finite etale covers of the completed residue field with the 2-colimit over affinoid neighbourhoods, and Proposition 7.6 uses Lemma 7.5(i)-(ii) to descend covers to a p-finite level. Adding the link P5 -> P3 would create a stage-level cycle (P5 requires P3). The node is therefore filed under P3; the atlas stage texts of P3 and P5 should be adjusted so that P3 states the henselian import and P5 only reuses it for ECD 6.4(i).

### Printed misprints and unargued small steps recorded by REVIEW-EXT-03

(a) Sch12 Lemma 4.2 uses m² = m without justification; nondiscreteness of the valuation gives it. (b) ECD Lemma 3.16 states α ∈ W(R^+) where W(R♭+) is meant. (c) Sch12 Lemma 7.3(i) writes the surjectivity statement as |X ×_Z Y| → |X| ×_{|Z|} |Y| instead of |X ×_Y Z| → |X| ×_{|Y|} |Z|. (d) Sch12 Theorem 1.1 is stated for Q_p(p^{1/p^∞}) and F_p((t^{1/p^∞})) themselves, while the proof works with their completions; the invariance of the absolute Galois group under completion is used implicitly and was not read. None of these affects a node statement; they are recorded so that a later formalization does not copy them.

### The url of the second source does not serve the document its hash records

The source ecd-2026 of the integrated decomposition carries the url of the arXiv preprint 1709.07343 and a SHA-256 of a different file: its own edition field says that the copy inspected was a library copy of the version prepared for the Asterisque volume, and that the arXiv item is only the preprint. For this packet each of the five arXiv versions was downloaded and hashed, and none of them reproduces the recorded hash, which corroborates that the two really are different documents. Since the two versions may number their statements differently, every locator into that source rests on the reading recorded in the decomposition and was not re-checked here. The other two sources are genuine arXiv items and both reproduce their recorded hashes byte for byte, which was checked in this session. A maintainer may wish to give that source a url that serves the document the hash belongs to, or to record that no public url does.

### This roadmap has no reviewed library audit, so the boundary with the libraries was drawn by hand

data/library-coverage.json has no entry for any layer of PerfectoidSpaces. The protocol says to plan only what the pinned libraries do not have, so for this packet the pinned declaration index was read directly. What was found is recorded in the baseline notes and is not negligible: Mathlib has the pre-tilt as an inverse limit along Frobenius, the untilt map, Fontaine's theta as a ring homomorphism, its surjectivity under surjectivity of Frobenius modulo p, and B_dR^+; Tau Ceti has Huber pairs, the adic spectrum, rational subsets with their basis, covering, refinement and perturbation theory, and the localisation with its universal property. The nodes were kept but their prerequisites and their notes now say which half of each statement is already pinned. A reviewed audit would put this on a firmer footing and is worth scheduling before the P8 part of this roadmap is planned.

## Structural proposals

Recorded in the packet's `restructure` list. This packet works with the current structure.

### P4 and P6 are in the scope of this job and have no decomposed source (`note-empty-layers`)

The job's scope is P0 to P7. The integrated decomposition covers P0, P1, P2, P3, P5 and P7; it has no node for P4, perfectoid open and closed immersions and the Zariski-closed-locus criteria, or for P6, cardinal-bounded perfectoid presentations and w-local preliminaries. This packet marks both not read rather than inventing nodes for them, and says in each coverage note what RS-05 narrows the layer to and what a continuation job needs. A maintainer may prefer to split this job so that the two undecomposed layers are a job of their own with their own source route, since they are otherwise invisible: a reader of the packet sees six layers with content and two without, and nothing says that the second group is a smaller piece of work rather than a failure.

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidSpaces.json

Zero errors and zero warnings against the pinned declaration index.
