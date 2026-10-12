# Handoff: PKG-CrystallineCohomology

Worker: Claude (claude-HgxPDH), 2026-10-12. Issue #8890.

## What was done

- `research/blueprint/packages/CrystallineCohomology/README.md`: the roadmap in TauCetiRoadmap form
  (2026-10-12 shape; about 820 KB, 11,400 lines), titled "crystalline cohomology, de Rham–Witt
  complexes and logarithmic structures". It has a Summary with the layer table, Scope and ownership,
  Conventions, Exact supplier contracts, How to read the build, and Layers CR.0, CR.1, CR.2, CR.3,
  CR.3:Frobenius-isogeny, CR.4, CR.3:duality, CR.5:log-algebra, CR.5, CR.6 and CR.7. Each layer has
  an introduction, numbered subsections, every target's statement with its hypotheses, the API by
  name, a proof sketch with locators, *Needs:* and Checks, and closing Examples and Dependencies.
  The README ends with Downstream consumers and References. All 274 plan targets are present, plus
  two targets added under the tier rule (below). Every definition and construction has at least
  three Checks.
- `research/blueprint/packages/CrystallineCohomology/Suggested.lean`: one short file (about 490
  lines) in namespace `TauCetiRoadmap.CrystallineCohomology`, importing `Mathlib` only.
  - **Real-bodied light definitions.** `PD.AdditivePowers` with `ofDividedPowers`; `PD.canonicalCoeff`
    (the image of `pⁿ/n!`); `PD.augmentation` (Mathlib's `DividedPowerAlgebra.lift` into the zero
    ideal) and `PD.augmentationIdeal`; `PD.pdFiltration`, `PD.IsPDNilpotent`, `PD.IsCompatibleWith`
    and the predicate `PD.IsPDEnvelope`; `Crystalline.Connection` (Leibniz rule into
    `M ⊗ KaehlerDifferential`); `Crystalline.DieudonneComplex` on `CochainComplex (ModuleCat ℤ) ℤ`
    with `IsSaturated`, `verschiebung` (by choice from saturation) and `vFiltration`;
    `LogCrystalline.IsFineMonoid`, `IsSaturatedMonoid` (via `Algebra.GrothendieckGroup`),
    `IsKummerHom`, `PrelogRing` (monoid bundled as `CommMonCat`) and `PrelogRing.IsLog`;
    `LogCrystalline.PhiNModule` on Mathlib's `WittVector.Isocrystal`.
  - **Milestones proved by `sorry`, statable at the pins.** The generator criterion; gluing on
    `I ⊔ J` (existence iff agreement on `I ⊓ J`, and uniqueness); flat extension; the localisation
    formula; the canonical divided powers on `(p)` and their functoriality; the canonical divided
    powers on the augmentation ideal; `dp₂(1) ∉ (dp₁)` over `𝔽₂`; `F⁰ = ⊤`, `F¹ = I`, `Iⁿ ≤ Fⁿ`;
    PD-nilpotent ⇒ nilpotent; existence of PD envelopes; `F V = p`, `V F = p`, `F d V = d`;
    `range Fʳ`; and `N^dim = 0` for `(φ, N)`-modules.
  - **Proved outright.** `ofDividedPowers_dpow`, `pdFiltration_zero`, `IsSaturated.smul_mem_range`,
    `F_verschiebung`, `vFiltration_zero` and several examples.
  - No `sorry`'d data. The closing comment lists the README-only targets.
- `metadata.toml`: `topic = "math.AG"`.

## Lean check

`lean-check research/blueprint/packages/CrystallineCohomology/Suggested.lean` (shared build, Tau
Ceti f790474, Mathlib 082e2d37e8): exit 0, 28 warnings, all `declaration uses 'sorry'`. Two
declarations need `set_option backward.isDefEq.respectTransparency.types false in`, the same
option Mathlib uses before `IsocrystalHom`, because the semilinear isocrystal Frobenius is not
coerced to a function without it.

## Layer order and targets placed in another layer

The README builds the layers in the order CR.0, CR.1, CR.2, CR.3, CR.3:Frobenius-isogeny, CR.4,
CR.3:duality, CR.5:log-algebra, CR.5, CR.6, CR.7. A script on the prerequisite graph checked that
no target is used before it is stated. These targets moved:

- `CR.1/etale-crystal-comparison` → Layer CR.2. It uses `CR.2/embedding-computation`.
- `CR.4/semistable-log-witt-models` and `CR.4/log-witt-proper-support` → Layer CR.6, subsection
  "Convergent complexes on tubes and Witt models". They use Layers CR.5:log-algebra and CR.5 and
  the convergent complexes of CR.6. Consumers citing them by their old stage should look them up
  by title in Layer CR.6.
- Within layers, targets were reordered by dependency. In particular, the CR.2 linearization
  targets come after the Poincaré lemma, and the CR.5:log-algebra monoid definitions come after the
  characteristic monoid.

Renamed titles: Layer CR.7 is "Coefficients, Dieudonné crystals and relative cohomology"; the
CR.7 targets `finite-projective-coefficients`, `filtered-frobenius-coefficients`,
`dieudonne-evaluation`, `messing-filtration-interface` and `relative-crystalline-direct-image` are
titled *Finite projective crystalline coefficients*, *Filtered Frobenius coefficients on
semistable models*, *The crystalline Dieudonné crystal of a Barsotti–Tate group*,
*Grothendieck–Messing deformation theory* and *Relative crystalline direct images*.

## Notions moved down into this roadmap (tier rule; this is tier 9, bundled with DerivedDeRhamCohomology)

The plan cited five higher-tier roadmaps (21 prerequisites and 6 requests). None is cited by the
README now:

- **PadicDifferentialEquationsAndRigidCohomology RD.4/RD.5** (tier 12), cited by nine CR.6
  targets, is replaced as follows:
  - Tubes, specialisation, étale sites of adic spaces and dagger spaces come from
    **AdicSpacesPartII** R2, R4, F1.22, F1.33 and F1.62 (tier 3).
  - Fréchet limits, completed projective tensor products and strict sequences come from
    **LocallyAnalyticDistributions** Layer 0 (tier 4).
  - A new target, *Log rigid Hyodo–Kato cohomology*, in CR.6 "Log rigid Hyodo–Kato cohomology". It
    gives Grosse-Klönne's simplicial dagger-tube complex RΓ_rig(Y/S₀, E), monodromy as the ∧θ
    connecting map, Nφ = qφN, finiteness and the comparison with log crystalline cohomology for
    proper Y. The locators GK05 §§5.1–5.2, Theorem 5.3, §5.4, Proposition 5.5 and §3.11 (arXiv v1
    pp. 18, 26–29) were read from the text. PadicDifferentialEquationsAndRigidCohomology should
    import this target.
  - *Convergent logarithmic embedding complexes* and *Proper support on open analytic tubes* now
    define their tubes from AdicSpacesPartII. The comparison of Disegni–Liu's quasi-étale site
    with the étale site, for coherent complexes, is stated as part of the first.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2** (tier 10) does not plan the crystalline
  Dieudonné crystal over a general base: its R07.2 is Dieudonné theory over a perfect field. CR.7
  now owns the following:
  - *The crystalline Dieudonné crystal of a Barsotti–Tate group*: D(G) = 𝓔xt¹(G, O) on the big
    crystalline site, locally free of rank the height, with F and V. Sources are BBM 3.3.6 and
    3.3.10 as recorded by de Jong 1995, 2.3.2–2.3.3, pp. 21–22. Barsotti–Tate groups come from
    AbelianSchemesAndArithmeticModuli §A4.5, and the abelian-scheme realization from §A4.6.
  - *Grothendieck–Messing deformation theory*: the full deformation theorem for Barsotti–Tate
    groups (Messing, LNM 264, Chapter V, Theorem 1.6), specialising to AbelianSchemes §A4.7.
  - *Dieudonné variance and Tate twists*: states the values for ℚ_p/ℤ_p and μ_{p^∞} directly
    (Demazure III.8).

  FiniteFlatGroupsAndIntegralPadicHodgeTheory should import these.
- **PadicHodgeTheory R06.1/R06.2** (tier 13) is replaced as follows:
  - *Normalized logarithms of units* defines the Teichmüller section for a perfect residue field
    (Serre, *Local Fields*, II §4, Proposition 8; Tau Ceti `TauCeti.teichmuller` covers the finite
    case).
  - *Completed Hyodo–Kato comparison for Stein curves* defines K̆₀ = W(k̄)[1/p] with its Galois
    action through Mathlib's `WittVector.map`.
  - The twist convention φ_{D(r)} = p^{−r}φ_D, Fil^i(D(r)) = Fil^{i+r}D is fixed in *Conventions*,
    so *Filtered Frobenius coefficients on semistable models* no longer cites R06.2.
  - *The induced log structure on A_cris* takes A_cris from Layer CR.0, and the tilt and θ from
    PerfectoidSpaces Layer 1.
- **AInfCohomology AI.0:integral/AI.1** (tier 13) is replaced as follows:
  - PerfectoidSpaces Layer 1 (§1.18, Fontaine's θ with principal kernel) supplies the tilt,
    sharp map and θ for *Valuation log structures and tilt charts* and the A_cris log structure.
  - *Saturation by iterated décalage* uses this roadmap's *Principal p-décalage on torsion-free
    complexes* instead of AI.1.
- **LefschetzPencilsAndVanishingCycles LPV.5** (tier 10) is replaced by a new target, *The
  classical Abhyankar lemma*, in CR.5:log-algebra (SGA 1, Exposé XIII, Appendice I, Propositions
  5.1 and 5.2 and Corollaire 5.3, pp. 314–316 of arXiv:math/0206203, read from the text). LPV.5
  has no Abhyankar node in any case.

## Supplier citations resolved against the packages

A Sonnet cross-check mapped every external citation; the map is not kept. The changes it led to:

- `DD.1/koszul-complex` → TauCetiRoadmap IntegralHeckeAndGaloisDeterminants Layer 6.4. The
  DerivedDeRhamCohomology package moved its Koszul target there.
- `IntegralHeckeAndGaloisDeterminants:IHG.0` → TauCetiRoadmap IntegralHeckeAndGaloisDeterminants
  Layer 0, §0.4 (grading, base change, Γ^d ≅ TSym^d). It is merged upstream.
- `AlgebraicModuliForArithmeticGeometry:A0-extension` → that package's Layer 7, §7.2
  (`perfect_proper_pushforward`). The package has no A0-extension heading.
- `AlgebraicModuliForArithmeticGeometry:R09.7a` is not in that package, and its two nodes are
  blow-up towers, not SNC boundary data. *Divisorial log structures* now states the strict normal
  crossings divisor itself (Stacks, Definition 41.21.1, tag 0BI9), so the plan's three R09.7a
  citations are gone.
- DerivedDeRhamCohomology `DD.n` layers are printed as "Layer n" with that package's section
  numbers (§1.1, 1.2, 1.4, 1.20, 2.12, 2.21, 2.27, 3.4, 3.6).
- Ownership conflict for the maintainer: the EnhancedDerivedSheaves packet (accepted 2026-10-11)
  redirects DD.1 derived completeness and completion and the Koszul complex to its Layers E4 and
  E1, while the DerivedDeRhamCohomology package keeps them. The README cites DerivedDeRhamCohomology,
  the bundle partner, and mentions the E4 overlap in Scope.

## Plan gaps stated as parts of targets

The plan's 45 gaps are now sentences inside the proof sketches of the targets they belong to,
saying what the target must prove where the source omits or only cites the argument. The Stacks
verifications omitted in Chapter 60 fall under:

- *Small and big crystalline sites*;
- *Morphisms and comparisons of crystalline sites*;
- *Crystals, stratifications and quasi-nilpotent connections*;
- *Enhanced crystalline direct image and global sections*;
- *Smooth-lift comparison and PD filtration*;
- *Formal comparison with trace-free endomorphism coefficients*.

The other gaps that become part of a target:

- Popescu's theorem (Stacks §16.12, tag 07GB), BMS1 Theorem 10.4 on Witt vectors of étale maps,
  Swan's seminormalisation and Joyal's Witt-lift input.
- Hodge and de Rham cohomology of projective space (Stacks 0FMI, 0FMJ).
- Fixed points of an endofunctor of an ∞-category, the full Dieudonné–Manin classification, and
  the finite syntomic trace (Stacks 50.19.5).
- Berthelot's purity results used by Gysin maps, the trace of an external product, and the Tate
  curve's v_K(q).

No gap is left unowned. The plan's statements that a gap was "registered" are replaced by these
sentences.

## Overlaps with existing work

- A Sonnet duplication inventory found no full duplicate in pinned Mathlib, pinned or current Tau
  Ceti, or current TauCetiRoadmap. It searched by object, covering divided powers, Witt vectors,
  Kähler forms, monoids, isocrystals and cohomology scaffolding.
- Partial overlaps are cited in *Scope and ownership*: Mathlib's `PadicInt.dividedPowers`, the
  rational and square-zero divided powers, `DividedPowerAlgebra.lift`, sub-PD ideals and quotient
  structures, `WittVector.isocrystal_classification` (rank one only), `IsCancelMul`,
  `IsAffineMonoid` and `Algebra.GrothendieckGroup`. Tau Ceti's `TauCeti.teichmuller` covers
  finite residue fields.
- All 185 Mathlib and Tau Ceti names in the plan's prerequisites exist at the pins (checked against
  `declarations.tsv` and the sources).

## Points for the package review

- **Locators not checked against an open copy** (the books are not freely available):
  - Messing LNM 264, Chapter V, Theorem 1.6 (the number commonly cited for Grothendieck–Messing);
  - BBM 3.3.6 and 3.3.10 (as quoted by de Jong 1995, 2.3.3, p. 21, which was read);
  - Demazure III.8;
  - Serre, *Local Fields*, II §4, Proposition 8;
  - the Mazur–Messing/BBM comparison D(A[p^∞]) ≅ H¹_dR of a lift, stated through
    AbelianSchemes §A4.6.

  Berthelot–Ogus is cited without a link: the plan's URL was a personal-page scan of the book.
- **Recomputed and new Checks.** All CR.0 Checks and the numerical Checks of CR.3, CR.5:log-algebra,
  CR.6 and CR.7 were recomputed; no error was found. The new Checks of *Log rigid Hyodo–Kato
  cohomology* were recomputed from the weight spectral sequence:
  - xy = 0 gives H¹ = K₀·dlog x with φ = q;
  - two ℙ¹ meeting in two points give a two-dimensional H¹ with eigenvalues 1 and q, and N ≠ 0.
- **Clarified Check.** The ambiguous twist Check of *Filtered Frobenius coefficients* now states
  Fil^i(F(−1)) = Fil^{i−1}F.
- **Stage-level citations.** Stage-level citations inside the plan (for example "Layer CR.0" in
  *The induced log structure on A_cris*) were kept as layer citations; the statements name the
  exact targets used.

## Scratch

Scratch was in the job directory, outside the repository, and is deleted with the run; nothing
here depends on it.
