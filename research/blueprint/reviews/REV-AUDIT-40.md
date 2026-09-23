# REV-AUDIT-40 — review of AUDIT-40

**Verdict: accepted.** 1 correction, 1 regrade, 4 duplicates added. 215 targets and 630 declaration
citations checked.

Batch: `tauceti:TauCetiRoadmap/PDE`, `tauceti:TauCetiRoadmap/Exchangeability`,
`tauceti:TauCetiRoadmap/StandardDistributions` — 48 layers, 215 targets, 630 declaration citations,
17 duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`, matching the audit's own
`baseline` field and the checkout at `workers/baseline`.

## What the audit claims

19 layers "built", 18 "partly built", 10 "not built", 1 "process". Unusually for these audits, most
of the batch is claimed **present**: 144 of 215 targets are in a library (142 of them in Tau Ceti),
and only 71 are absent or partial. That picture survived review. Tau Ceti really has built most of
the PDE roadmap's Lanes A, C and D, the whole of Exchangeability, and almost all of
StandardDistributions, and the audit's summaries say so accurately.

## 1. Every claim that something is in the libraries

**All 630 citations match `declarations.tsv` exactly on library, name, file and line — no
exceptions.** All 231 cited files (208 Tau Ceti, 23 Mathlib) exist at the pinned commits and none
contains a `sorry`.

I then read the source of the load-bearing claims and compared each statement with its target. The
"built" verdicts hold up:

* **PDE Lane D** is the strongest claim in the batch and it is correct.
  `UniformlyEllipticOn.garding_energyFormH1_self_norm` really is
  `λ/2‖u‖²_{W1p} − (λ/2 + β²/2λ)‖u‖²_{L²} ≤ a(u,u)`;
  `existsUnique_isWeakSolutionDirichlet`, `fredholmAlternative_isWeakSolutionDirichletMassShift`,
  `exists_hilbertBasis_forall_isDirichletEigenvalue` (a `HilbertBasis` of `L²` of Dirichlet
  eigenfunctions with positive eigenvalues) and
  `isLeast_rayleighQuotient_firstDirichletEigenvalue` (`IsLeast` of the Rayleigh set) all state what
  the milestones ask for.
* **Lane B.8:** `mul_measure_lt_maximalFunction_le` is `t·μ{Mf > t} ≤ 4^n ∫‖f‖` and
  `eLpNorm_maximalFunction_le` the strong `(p,p)` bound with an explicit constant.
* **Lane C.13:** weak maximum principle, strong maximum principle
  (`eqOn_const_of_laplacian_nonneg_of_isMaxOn`), Hopf
  (`fderiv_pos_of_laplacian_nonneg_of_lt_ball_of_le_sphere`) and the comparison principle are all
  there in the stated form.
* **Exchangeability:** every target of Layers 0–6 is matched by a declaration whose statement is the
  target — `deFinetti_equivalence`, `conditionallyIID_of_contractable`, `deFinetti_viaL2`,
  `deFinetti_viaKoopman`, `tendsto_ae_condExp_iInf`, `metProjection_eq_condExpL2`,
  `hewittSavage_trivial_of_iIndep`, `deFinetti_mixture`, `conditionallyIID_ae_unique`,
  `ConditionallyIIDWith.tendsto_empiricalMeasure_ae`.
* **StandardDistributions:** Layers 0–4 likewise, down to the exact mgf domains
  (`integrableExpSet_id_map_cast_geometricMeasure`), the closed-form cdfs (`cdf_gaussianReal_eq`
  through `Real.erf`) and the relationships (`gaussianReal_map_sq`,
  `hasLaw_studentT_of_gaussian_chiSquared`, `map_div_add_prod_gammaMeasure`).

**One entry was wrong; it is fixed in place.**

* **`PDE#milestone-d-16`, Gårding's inequality.** The note said the bound holds "for bounded
  measurable coefficients with `c ≥ 0`", and that restriction is real in the two cited
  `W1p`-packaged theorems (`garding_energyFormH1_self`, `garding_energyFormH1_self_norm`, both of
  which carry `hc_nonneg` and never use their `hc_bound : ‖c x‖ ≤ gamma`). But it is only in the
  packaging: `UniformlyEllipticOn.garding_energyFormIntegral_self_of_mass_lower_bound_on`
  (`EnergyForm/Integrated/Basic.lean:509`) proves the same estimate from a mass floor `mu ≤ c` with
  `mu` of **either sign**, and `energyFormH1 a b c u v` is *by definition*
  `energyFormIntegral (mu.restrict Ω) a b c (jetField u) (jetField v)`
  (`EnergyForm/Sobolev.lean:328`). So the roadmap's Gårding inequality for general bounded `c` is in
  Tau Ceti, by instantiation, and the audit understated what is there. The two mass-floor
  declarations are now cited and the note says this. The `tauceti` status and the `built` verdict
  are unchanged — this correction strengthens them.

## 2. Layers marked "built" or "process"

The one "process" layer, `Exchangeability#layer-7-public-api-and-examples`, is the curated export
pair `TauCeti/Probability/Exchangeability.lean` and `…/DeFinetti.lean` — an interface layer that
states no mathematics of its own, matching the process layers of previously accepted audits.

**One regrade, for consistency.** `PDE#milestone-c-12` was "not built" while `milestone-c-14`,
`milestone-b-9`, `milestone-a-6` and `lane-f` were "partly built" — and c-12 is the *same*
situation as c-14: the planar case exists (Mathlib's `circleAverage` mean-value property and
`HarmonicAt.analyticAt`, exactly as Harnack exists on a disk) and the `ℝⁿ` statement does not. Four
layers cannot be "partly built" on the strength of a planar-only partial while a fifth is "not
built" for the same reason. I regraded **c-12 to "partly built"**, which keeps the more informative
of the two readings and leaves 9 layers "not built". This is a judgement call, not an error in the
audit; the notes on both layers were already accurate and are unchanged.

## 3. Re-searching the absent and partial claims

I re-searched all 71 absent and partial targets myself, by concept, over `declarations.tsv` and with
`grep -rn -i` over both Lean trees. **Nothing turned up that the audit missed**, and several
near-misses confirm its care:

* Zero hits, in either tree, for: Meyers–Serrin, Morrey, Trudinger–Moser, Poincaré–Wirtinger,
  Riesz–Thorin, Calderón–Zygmund (decomposition, singular integrals or the `W^{2,p}` estimate),
  Mihlin–Hörmander, BMO or "mean oscillation", John–Nirenberg, Campanato, De Giorgi, Nash–Moser,
  Green's functions, Galerkin, the Gelfand triple, the heat kernel and the heat semigroup.
* The **hits that are not what they look like**, each as the audit says: `schauder` is only
  `SchauderBasis`/`GeneralSchauderBasis`, never a Schauder estimate; `perron` is
  `perronIntegrand`, Perron's formula in analytic number theory, not Perron's method; the 20 files
  matching "difference quotient" are all semigroup generators and `dslope`, none the Nirenberg
  machinery of E.20; the two "trace operator" mentions are disclaimers ("no trace operator is
  needed to state it"); "Zygmund" occurs once, in a forward-looking comment in
  `MaximalFunction.lean`; "Trudinger" is the Gilbarg–Trudinger textbook citation.
* **Marcinkiewicz, Harnack, the Poisson kernel and Bessel potentials do exist**, and the audit
  already says exactly how far: `TauCeti/MeasureTheory/Integral/Marcinkiewicz.lean` is the diagonal
  `p₀ = 1, p₁ = ∞` case only; `TauCeti/Analysis/PDE/Harnack/Planar.lean` is the disk with the sharp
  constant `((R+r)/(R−r))²`; the Poisson kernel is Mathlib's planar one; Mathlib's
  `besselPotential`/`MemSobolev` scale exists but nothing connects it to `Wkp` (I confirmed the
  audit's claim that Tau Ceti never mentions either name).
* **Aldous–Hoover.** The audit's one genuine Exchangeability gap is right, and the source says so
  itself: `Arrays/AldousHoover/Dissociated.lean` calls its content "the easy direction of the
  ergodic form of the theorem" — codings give exchangeable, dissociated arrays; the converse is not
  there.

## 4. Duplicates

All 17 recorded duplicates name layers that exist in `data/atlas.json`, and each relation is real —
the HeegaardFloer Cauchy–Riemann package against Lanes A, B and E, OneParameterSemigroups against
item 26, the three deliberately parallel de Finetti routes against each other, and DenseGraphLimits
against Layer 8.

**Four duplicates are added, all to the same roadmap the audit did not look at: OptimalTransport.**

* `PDE#lane-a` ← `OptimalTransport#layer-11`, which says it "consumes … the weak PDE infrastructure
  in the PDE roadmap" and that "where the PDE roadmap does not provide a needed continuity-equation,
  Sobolev, or compactness lemma, build and expose the bridge here before using it" — an explicit
  licence to build parts of Lane A elsewhere.
* `PDE#lane-f` ← the same layer, whose JKO and PDE-flow items route each linear flow "through the
  abstract C₀/contraction-semigroup API of the one-parameter-semigroups roadmap".
* `PDE#milestone-e-21` and `#milestone-e-22` ← `OptimalTransport#layer-6`, whose item 9 plans VMO
  control of `f` giving `W²,p`, then `f ∈ C⁰,α ⟹ C²,α`, and "for `k ≥ 1` … the ordinary interior
  Schauder bootstrap on relatively compact subdomains" — the `W^{2,p}` and Schauder estimates of
  those two milestones.

I also searched the atlas for probability-side overlaps and found none beyond the recorded ones: no
stage outside StandardDistributions plans distribution families, moment generating functions or
Wishart laws, and the only exchangeability overlap is DenseGraphLimits, already recorded twice.

## Checks

- 630 citations × (library, name, file, line) against `declarations.tsv` at the pinned commits: all
  match. After my two additions, 632 of 632.
- 231 cited files: all present, none with a `sorry`.
- 48 layer ids and 21 duplicate layer ids: all resolve in `data/atlas.json`.
- Every layer verdict now follows its targets' statuses under one reading, applied consistently.
- Lean: none.
