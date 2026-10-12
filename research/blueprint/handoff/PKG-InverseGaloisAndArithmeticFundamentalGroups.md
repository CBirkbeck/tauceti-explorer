# Handoff: PKG-InverseGaloisAndArithmeticFundamentalGroups

Worker: Claude (claude-fCZROL), 2026-10-12. Issue #8891.

## What was done

- `research/blueprint/packages/InverseGaloisAndArithmeticFundamentalGroups/README.md`: the roadmap in
  TauCetiRoadmap form (2026-10-12 shape): Summary, scope and ownership, conventions, exact supplier
  contracts, how to read the build, Layers IG.0–IG.6 with every kept target's statement, hypotheses,
  API (by name), Checks, proof sketch, source locator and prerequisites, per-layer Examples and
  Dependencies, worked examples, downstream consumers and references.
- `Suggested.lean`: one file in namespace `TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups`
  with only real-bodied light definitions (Galois tensor map and Galois-algebra predicate; the
  rational specialization component on Tau Ceti's place valuation ring; Hilbertian fields; branch
  tuples, Nielsen classes, the Hurwitz action through `TauCeti.BraidGroup.lift`, exterior
  epimorphisms and `T`-systems; rigidity predicates; the Schur multiplier, Schur relations, reduced
  multiplier, universal marked extension as a `PresentedGroup`, class degree map, universal kernel,
  cyclotomic twist, lifting invariant; the Fitting subgroup; configurations; the lifted affine group;
  realization certificates and the inverse Galois problem as named propositions) and the end
  theorems statable at the pins (Hilbert irreducibility over number fields, rational rigidity,
  Shafarevich, regular ⇒ realization over `ℚ`), proved by `sorry`. No `sorry`'d data.
- `metadata.toml`: `topic = "math.NT"`.

## Lean check

`lean-check research/blueprint/packages/InverseGaloisAndArithmeticFundamentalGroups/Suggested.lean`
(shared build, Tau Ceti f790474, Mathlib 082e2d37e8): exit 0, only `declaration uses 'sorry'`
warnings. Imports: `Mathlib`, `TauCeti.GroupTheory.SpecificGroups.Braid`,
`TauCeti.FieldTheory.FunctionField.Place.RatFunc.Order` (both at the pin and in the shared build).

## Targets removed because existing Tau Ceti work owns them (cited instead)

The cohomological point-counting family (TauCetiRoadmap pull request #196,
`CohomologicalPointCounting`, which SchemeAndStackFoundations SF.2 also defers to) was treated as
existing Tau Ceti work (PROTOCOL §15, open roadmap pull requests the atlas tracks):

- IG.0/finite-etale-covers, IG.0/geometric-fiber, IG.0/etale-fundamental-group,
  IG.0/basepoint-and-components → ConstructibleEtale Layer 3 (finite étale Galois category of a
  connected locally Noetherian scheme, fibre functors, `π₁^ét`, étale paths). Layers IG.0–IG.1 now
  work with locally Noetherian schemes, the generality of that layer and of SGA 1.
- IG.3/general-riemann-existence: the general finite-type statement → ComplexComparison Layer 8; the
  target is kept as *Riemann existence for punctured curves* (extension over punctures,
  ramification = cycle length).
- IG.3/finite-coefficient-comparison (étale/Betti with finite coefficients) → ComplexComparison
  Layer 10; IG.3/artin-good-neighborhoods kept as the `K(π, 1)` statement on top of Layer 10's
  elementary fibrations.
- IG.6/faithful-dessin-action-import → BelyiMaps Layer 13.5 (boundaries only).

Partial overlaps now cited inside kept targets: Tau Ceti `TauCeti.Place.adicOfIrreducible` /
`valuation_ofIrreducible_le_one_iff` (the regular subring is its valuation ring at `T − t`; the
Lean definition is built on it); `TauCeti.Place.stabilizer_eq_decompositionSubgroup`,
`decompositionQuotientInertiaEquiv`, `card_inertiaSubgroup` (decomposition/inertia for function
fields); Mathlib `Group.rank` (= `d(G)`, replacing the plan's `GeneratorNumber.value`); Tau Ceti
`TauCeti.FiniteEmbeddingProblem` (current Tau Ceti only, not at the pin) for weak embedding
problems; current Tau Ceti `TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup` for
`Sₙ` over `ℚ`.

## Notions moved down into this roadmap (tier rule)

- From **InductionRestrictionPartII** (outside the 94): the 43-node closure of RS.1, RS.2, RS.3 and
  RS.5 used by IG.3/IG.4/IG.5 is planned here as Layer IG.3, subsections IG.3.4–IG.3.5
  (commutators of lifts and the class map, reduced Schur multiplier, reduced Schur covers,
  conjugacy-class lifting and class-compatible markings, marked central extensions, the universal
  marked extension `U(G, c)`, the class degree map, the marked fibre product `U ≅ S_c ×_{G^ab} ℤ^D`,
  the kernel `K(G, c)`, coprime semidirect products and admissible inertia, powers by units, central
  corrections, the discrete action, the cyclotomic twist). InductionRestrictionPartII should import
  these from Layer IG.3 and drop its own RS.1–RS.3 and RS.5 targets. The image equality of RS.1
  (EVW II §7.3, a withdrawn preprint) is not used; only the zero composite (Wood, Lemma 2.2) is.
- **Lang–Weil estimate**: added as an explicit target of Layer IG.2 (Serre, *Topics*, Theorem 3.6.1,
  p. 31; curve case by Stepanov–Bombieri), because the integral thin-set count and the
  weak-approximation theorem use it and no lower-tier roadmap supplies it.
- **Hilbertianity of fields finitely generated over `ℚ`**: made part of the statement of
  IG.2 *Normal subgroups of absolute Galois groups*.
- Finite Poitou–Tate, Grunwald–Wang and the Tate–Shafarevich kernels of finite Galois modules are
  owned by Layer IG.4; ArithmeticGaloisDuality (tier 7) should import them.
- The weight bound and Poincaré duality for the finite Hurwitz schemes are stated inside
  IG.5 *Finite Hurwitz cohomology, trace formula and weights* (no lower-tier owner of Deligne's
  theorem); DeligneWeightsAndPurity / WeightsInEtaleCohomology should import or supersede it.

## Plan corrections made in the README (no packet changed)

- IG.2 *Thin sets*: the plan's sentence on complements had the inclusion backwards; the README says
  the bad full-group parameters lie in a thin set together with the guard locus.
- IG.2: an explicit *Lang–Weil estimate* target (see above); Hilbertianity of fields finitely generated
  over `ℚ` made part of the absolute-Galois statement; the more general Hilbertian-field form of
  Fried–Jarden 16.11.6 is outside the roadmap.
- IG.4 *Grunwald–Wang*: stated for `Ш¹_T(K, μ_m)` with `T` finite (the form Schmidt–Wingberg Prop. 11
  and Wood Lemma 3.2 use), with the exceptional case requiring `8 | m`.
- IG.4 *Split nilpotent proper embedding theorem*: the descent step reduced to Sylow factors, as in
  Schmidt–Wingberg Theorem 14; conditions as in their Theorem 15.
- IG.4 *Coprime profinite complements*: conjugacy needs the Feit–Thompson theorem in general, which
  no roadmap supplies; conjugacy is stated under "`Γ` solvable or `N` prosolvable", and the unramified
  `Γ`-groups carry their chosen section (independence of the choice under the same hypothesis).
- IG.4: *Induced abelian proper solutions*, *Cyclic ramification correction*, *Property E for the
  arithmetic unramified group*, *Tame central lift after adjoining roots* and *The global arithmetic
  lifting invariant* are stated over number fields. Their function-field cases need global class field
  theory of function fields, which ClassFieldTheory excludes and no lower-tier roadmap supplies; the
  layer's definitions still cover `𝔽_q(t)`, which IG.5 uses. A roadmap owning function-field class
  field theory (FunctionFieldArithmetic) is the natural home for those cases.
- IG.4 *Property E*: the finite-to-profinite step goes through `Γ`-stable open normal subgroups `U`
  with `U ∩ C_p = 1` and compactness of compatible torsors of lifts.
- IG.5: hypotheses made explicit (`m ≥ 2` for tame `G`-covers with `μ_m`; `G ≠ 1` for the nonempty
  residue set in the Frobenius component formulas; `c` generating `G` wherever `U(G, c)` is used;
  `q` prime to `|G|` for Hurwitz points). The weight bound and Poincaré duality for finite Hurwitz
  schemes are statements of the trace target, with their sources (see the moves above).
- Naming: `d(G)` is Mathlib `Group.rank` (the plan's `GeneratorNumber`); the Fitting subgroup is
  `fittingSubgroup` with Mathlib-style lemma names; `FieldRealization.degree`; titles without
  "adapter", "kernel" or "import".

## Points for the package review to check

- Harbater–Hartmann, Theorem 4.9 is stated for arbitrary `U₁, U₂ ⊆ X` as in the plan; its exact
  hypotheses were not re-read.
- The Belyi convention transport of IG.6 is `(g₁, g₂, g₃) = (τ_∞, τ₁, τ₀)`, putting `g₁` at `∞`.
- The CohomologicalPointCounting layer numbers were read from PR #196 at head 4bd7237.

## Unverified locators

- Fried–Jarden, *Field Arithmetic*, 3rd ed., Chapter 13 (purely transcendental extensions are
  Hilbertian) and Proposition 16.11.6: book not freely available; cited through Schmidt–Stix.
- Anderson, *Exactness properties of profinite completion functors*, Topology 13 (1974),
  Proposition 3: cited through Landesman–Litt, proof of Theorem 9.1.2.

## What remains

Nothing for this job. The package review (REV-PKG) should run the adversarial pass and check
the CohomologicalPointCounting citations against PR #196's current head (4bd7237).
