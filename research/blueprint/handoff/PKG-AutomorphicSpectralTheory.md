# PKG-AutomorphicSpectralTheory — handoff

Issue [#7893](https://github.com/CBirkbeck/tauceti-explorer/issues/7893). Claude (Opus 5.5),
session `claude-C7E33F`, 11 October 2026. Branch `claude-C7E33F-pkg-automorphic-spectral-theory`,
from explorer `e718e3b95`. The bot confirmed the claim in
[this comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6110386552).
None of the manager's priority issues was available; this focus package was the first allowed job
in WORKERS.md's order. Only this issue was claimed.

## Outcome

The package is complete: `README.md`, `Suggested.lean` and `metadata.toml`
(`topic = "math.NT"`) in `research/blueprint/packages/AutomorphicSpectralTheory/`. It replaces the
earlier checkpoints, which stopped on two points this run resolves:

1. **Upward citations** (WORKERS.md, "Upstream tiers"). The plan cited EndoscopicTransfer (tier 14)
   from AS (tier 13). Following the rule that the notion moves down, the package now plans the
   three notions itself, and the endoscopic roadmap should import them from here:
   - **AS.2.6a Generic local packets of classical groups** (Jiang–Zhang, arXiv:1508.03205v4,
     Appendix B (B.1)–(B.2), pp.84–85). Replaces the ET.0 input of AS.2.11 and of the request whose
     consumers are AS.2.7, AS.2.8 and AS.2.12 (that request also omitted its direct consumer AS.2.11).
     As in the accepted AutomorphicLFunctions package, tempered packets with a generic member, and
     the local Langlands correspondence for general linear groups, enter as data; their existence is
     stated as a boundary.
   - **AS.6.8a Invariant orbital integrals** (Arthur 2005, §18, pp.102–104, citing Ranga Rao 1972).
     Replaces ET.1 in AS.6.9.
   - **AS.6.16a Discrete functionals and pseudo-coefficients** (Clozel–Delorme 1990, §5.2 Lemma 6,
     Proposition 4 and Corollary, pp.212–213). Replaces ET.1 in AS.6.17. The discrete series itself
     is imported from `AF.1/tempered-square-integrable` and `AF.1/discrete-series`, which already
     plan it.
   For the EndoscopicTransferAndUnitaryTraceComparison plan: point its ordinary orbital integrals,
   pseudo-coefficients and generic-packet carriers at AS.6.8a, AS.6.16a and AS.2.6a.
2. **Citations outside the order.** QSeriesPartitionsAndMockModularForms and EllipticRegulators are
   not among the roadmaps Caraiani–Newton needs, so the package cannot cite them:
   - QM.2 Bessel J and I → **AS.0.25a**, defined from Mathlib's `Complex.regularizedHGFun`
     (DLMF 10.2.2, 10.25.2 and neighbours; locators checked on dlmf.nist.gov).
   - QM.3 Kloosterman sum and weight-k Laplacian → **AS.1.15a** (Bruinier–Funke, Duke 2004, §3 (3.1),
     p.8, checked in arXiv v2; Ramanujan-sum test from DLMF 27.10.4–5).
   - ER.7 congruence-class Eisenstein series → AS.1.22 now defines E_N directly as the
     Γ∞\Γ₀(N) coset sum. Its API item `congruence_adapter` is replaced by `coprime_pairs`.
   - The Green-function remark naming GZ.7 now says the arithmetic Green function is not built here.

Also:

- **Tau Ceti roadmaps.** AdelicAlgebraicGroups, ReductiveGroupsPartII and
  SmoothRepresentationsOfLocalGroups are now on TauCetiRoadmap main. The README cites them as Tau
  Ceti roadmaps, with AA slugs mapped to upstream sections (§§2.1–2.3, 3.1, 3.4, 3.5). AS.0.5 and
  AS.0.7–AS.0.10 now state only what they add to OperatorTheory/SelfAdjointSpectralTheory and
  OperatorIdeals, instead of restating those roadmaps' definitions.
- **README.** New introduction, neighbouring roadmaps and boundaries. Plan ids (`AS.1/dit-57`,
  `item 024`, `trace151` and similar) are replaced by target numbers. Placeholder dependencies
  ("input contract", "rank-one definition") are replaced by the targets above. Remarks about Lean
  test fixtures are removed.
- **Suggested.lean.** Upstream form: imports, then the standard note, then layer headings. About 140
  process comments (job ids, supplier and omission notes) are replaced by one closing comment,
  "Statements not typed at the pins", which lists every untyped statement (see Checks) grouped by the carriers
  they need. The accepted AdelicAlgebraicGroups package uses the same form. New typed declarations:
  - `bessel_j`, `bessel_i`, `bessel_k` and `SpecialFunctions.canonical`;
  - `kloosterman_sum` and `weight_laplacian`;
  - `orbital_integral` and its API;
  - `level_eisenstein` (AS.1.22), now defined directly.

  `bessel_kloosterman_coefficient` (formerly `dit_88`) used an arbitrary function parameter in place
  of the Kloosterman sum, which made `initialConvergence` false as stated; it now uses
  `kloosterman_sum`. Its `resolventComparison` asserted equality with an arbitrary function; it is
  now the Fourier-coefficient identity at frequencies n ∉ {0, m}.
- **Names.** The 95 source-locator names (`yu_151`, `dit_88`, `gz_69`, …) are now descriptive names,
  in both files. The table below maps each plan name to its package name.

## Checks

- `lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`: exit 0, no
  errors; every warning is `declaration uses sorry` (722 warnings). Shared build at Mathlib
  `082e2d37e8` and Tau Ceti `f790474`; 100 GB available. No language server or build ran, and
  nothing is left running.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  0 errors, 0 warnings (the packet is unchanged).
- Coverage against the accepted plan: all 190 targets, 223 API items and 219 tests are in the
  README under their package names. Suggested.lean declares 122 targets, 188 API items and 218
  tests. The other 103 items (68 targets, 34 API items, one test) are in the closing list, together
  with Arthur's multiplier theorem. The remaining API item, `congruence_adapter`, became
  `coprime_pairs`.
- README: 209223 bytes, above the 200 KB guide. The input already sat at 199,944 bytes; the
  five moved-down targets and the neighbouring-roadmap section add about 12 KB, and Lean-fixture
  remarks were removed to offset part of it. Every remaining byte is specification. Accepted
  packages above the guide include IntegralHeckeAndGaloisDeterminants (202 KB),
  LocallyAnalyticDistributions (305 KB) and AdicSpacesPartII (556 KB, accepted with the same
  justification). If the limit must hold, compress the rank-one modular targets of AS.0 and AS.1.

## Audit of the typed signatures

Every theorem, definition and example in Suggested.lean was checked against the README in five
read-only audit passes, one per layer group, run as subagents of this session; a sixth pass checked
every statement added or changed in this run. These are not the independent package review. Earlier rounds had removed some statements made for unconstrained data;
many remained. The fixes:

- **False as stated, removed and listed as untyped (41 declarations).** These were quantified
  over arbitrary data, and each has a concrete counterexample. Examples:
  - AS.4: spectral completeness, finite multiplicity, the compact-quotient trace class, the
    Mœglin–Waldspurger classification and the residual-spectrum statements;
  - modular L²: the spectral expansion, the Weyl law, cusp decay and the residue formulas;
  - AS.3: the function-field cutoff identities;
  - also the Shahidi `target` and `global_product`, the intertwiner factorization and the
    wave-packet Gram identity.

  A few stand-ins whose hypotheses were their own conclusions went too (`levi_compatible`,
  `d_squared`, `weyl_transport`, `cuspidalInclusion`, the scalar-trace Euler–Poincaré stand-in).
- **`ContDiff ℝ ⊤`** means real-analytic at the Mathlib pin, because `⊤ : WithTop ℕ∞` is `ω`. The
  16 occurrences (Paley–Wiener sections, cutoffs, Fourier decay) now use
  `((⊤ : ℕ∞) : WithTop ℕ∞)`, i.e. C^∞. Before this change, `IsPaleyWienerSection` forced the zero
  section and two almost-compact statements were false.
- **Repaired.**
  - Adelic statements:
    - `spectral_map` now carries the Gram and integrability hypotheses;
    - normalized induction carries its action (`NormalizedInduction`), so the induced-family laws
      are consistent.
  - Modular forms:
    - SL₂(ℤ) transformation laws replace laws stated for arbitrary maps (Eisenstein, Poincaré,
      the weight-two form, and character Eisenstein series with Dirichlet characters);
    - `primitive_to_full` and `genus_eisenstein_fourier` now state the actual identities;
    - characters vanish off units in `n_one`/`d1_one`;
    - `eisenstein_fourier_weight_two` uses `riemannZeta` instead of an arbitrary function;
    - the completed Eisenstein functional equation is stated on punctured neighbourhoods; the
      pointwise form fails at zeros of Λ(2s).
  - Local and function-field:
    - `conjugateDual` goes through the Galois involution;
    - the chamber selector also requires the positive chamber;
    - quasi-polynomial determination is stated for residue-periodic coefficients;
    - `twisted_truncated_trace` needs a measurable degree;
    - `QuasiPolynomial` contained a `sorry` that could never be filled;
    - (G,M)-families are holomorphic, not merely continuous.
  - AS.0:
    - Herglotz representation with uniqueness;
    - the spectral theorem target is now the direct-integral model;
    - `unbounded_multiplier` quantifies over functions (the old form constrained a choice of
      representative);
    - Whittaker equations and both limits;
    - decay of the archimedean integral;
    - nuclear-map and LF Banach–Steinhaus statements, in place of restated Mathlib lemmas.
  - New specification lemmas tie opaque data to its object: the scalar measures, Borel integral
    and resolvent of a projection-valued measure, kernel operators, and the coset models of
    SL₂(ℤ) and Γ₀(N).

The final check of the new and changed statements found none false or unfaithful. It confirmed
two constants numerically: the Bessel–Kloosterman Fourier coefficient and the derivative of the
Whittaker seed. It also re-derived the genus Fourier coefficient, including κ(D₂). It then raised
two points, both fixed:
- The `(𝔤, K)`-cohomology instances are now the quotient instances rather than `sorry` data, so
  the finrank values in the Euler–Poincaré checks are determined.
- `level_eisenstein.continued` is stated to be meromorphic, so its residue tests pin it down.

The README was checked against the new Lean names. Statements removed from the Lean file remain
README targets.

## For the maintainer: plan corrections to carry into the packet

The issue forbids packet edits, so these are recorded here.

- Upward citations ET.0/ET.1 → AS.2.6a, AS.6.8a and AS.6.16a, as above.
- Out-of-order citations QM.2, QM.3 and ER.7 → AS.0.25a, AS.1.15a and AS.1.22, as above.
- `AS.1/dit-88`: the Kloosterman sum is a definition, not a parameter.
- **AF/ALS cite AS upward.** AF.4/coherent-relative-cohomology (→ AS.4),
  AF.4/clozel-rationality (→ AS.5), ALS.5/automorphic-comparison and ALS.5/cuspidal-cohomology
  (→ AS.5/franke-comparison and AS.5/franke-schwermer-support) are tier-11 nodes citing this
  tier-13 roadmap. Under the moving-down rule, the AF/ALS package would plan Franke's comparison and
  the cuspidal-support decomposition itself, and AS.5 would then import them. That would remove most
  of AS.5's content. The alternative is to put AS in the AF/ALS bundle. This package keeps AS.4–AS.5
  as the accepted plan has them; the choice between bundling and moving is the maintainer's.
- AS.0.5 and AS.0.7–AS.0.10 overlap TauCetiRoadmap OperatorTheory; the package states only the
  additions, and the plan should do the same.

## Name map

| Target | Plan name | Package name |
| --- | --- | --- |
| AS.0.20 | `yu_145` | `spectral_cycle_coordinates` |
| AS.0.21 | `yu_146` | `weyl_cycle_difference_map` |
| AS.0.22 | `yu_147` | `spectral_cover_fibres` |
| AS.0.23 | `yu_148` | `compact_cover_transfer` |
| AS.0.24 | `yu_149` | `character_inversion_fibre_average` |
| AS.0.25 | `yu_150` | `torus_fourier_decay` |
| AS.0.26 | `dit_112` | `whittaker_m` |
| AS.0.27 | `dit_113` | `whittaker_bessel_comparison` |
| AS.0.28 | `dit_114` | `whittaker_asymptotics` |
| AS.0.29 | `dit_115` | `sine_power_integral` |
| AS.0.30 | `dit_118` | `whittaker_cycle_integral` |
| AS.0.31 | `dit_165` | `whittaker_integration_by_parts` |
| AS.0.32 | `dit_appendix_a2_series_of_whittaker_cycle_integral` | `whittaker_cycle_series` |
| AS.0.33 | `dit_appendix_a3_series_of_rhs` | `bessel_cycle_series` |
| AS.0.34 | `dit_appendix_a_leading_coefficient_match` | `cycle_series_leading_coefficients` |
| AS.0.35 | `gz_64` | `legendre_q` |
| AS.0.36 | `gz_65` | `legendre_q_asymptotics` |
| AS.0.37 | `gz_66` | `point_pair_invariant` |
| AS.0.38 | `gz_108` | `legendre_q_near_one` |
| AS.0.39 | `gz_207` | `archimedean_v_integral` |
| AS.0.40 | `gz_212` | `archimedean_v_at_zero` |
| AS.0.41 | `gz_213` | `archimedean_v_holomorphic` |
| AS.0.42 | `gz_214` | `archimedean_v_functional_equation` |
| AS.0.43 | `gz_215` | `archimedean_v_integer_points` |
| AS.0.44 | `gz_216` | `archimedean_v_central_derivative` |
| AS.0.45 | `gz_217` | `archimedean_v_bessel_k` |
| AS.1.11 | `yu_010` | `unramified_character_torus` |
| AS.1.12 | `yu_060` | `induced_spherical_section` |
| AS.1.13 | `yu_153` | `induction_normalization_transport` |
| AS.1.14 | `dit_57` | `nonholomorphic_eisenstein` |
| AS.1.15 | `dit_58` | `completed_eisenstein` |
| AS.1.16 | `dit_88` | `bessel_kloosterman_coefficient` |
| AS.1.17 | `dit_89` | `poincare_family` |
| AS.1.18 | `dit_90` | `poincare_eigenfunction` |
| AS.1.19 | `dit_105` | `poincare_one_form` |
| AS.1.20 | `dit_110` | `whittaker_seed_derivative` |
| AS.1.21 | `dit_fourier_expansion_weight0_poincare` | `poincare_fourier_expansion` |
| AS.1.22 | `gz_69` | `level_eisenstein` |
| AS.1.23 | `gz_70` | `level_eisenstein_mobius` |
| AS.1.24 | `gz_179` | `character_eisenstein` |
| AS.1.25 | `gz_192` | `genus_eisenstein` |
| AS.1.26 | `gz_208` | `lipschitz_poisson_identity` |
| AS.1.27 | `gz_209` | `genus_eisenstein_fourier` |
| AS.1.28 | `gz_241` | `eisenstein_growth` |
| AS.1.29 | `gz_265` | `eisenstein_fourier_weight_two` |
| AS.2.14 | `yu_061` | `operator_intertwiner_family` |
| AS.2.15 | `yu_066` | `spherical_scalar_intertwiner` |
| AS.2.16 | `dit_59` | `completed_eisenstein_fourier` |
| AS.2.17 | `dit_60` | `completed_eisenstein_continuation` |
| AS.2.18 | `dit_91` | `resolvent_kernel` |
| AS.2.19 | `dit_92` | `resolvent_polar_part` |
| AS.2.20 | `dit_93` | `poincare_residue` |
| AS.2.21 | `dit_94` | `bessel_coefficient_residue` |
| AS.2.22 | `dit_resolvent_fourier_expansion_weight0` | `resolvent_kernel_fourier` |
| AS.2.23 | `gz_68` | `green_kernel_continuation` |
| AS.3.10 | `yu_022` | `gln_relative_roots` |
| AS.3.11 | `yu_023` | `chamber_height_functions` |
| AS.3.12 | `yu_056` | `auxiliary_chamber_selector` |
| AS.3.13 | `yu_058` | `degree_cone_series` |
| AS.3.14 | `yu_059` | `cone_series_floor_vector` |
| AS.3.15 | `yu_115` | `floor_monomial_family` |
| AS.3.16 | `yu_116` | `degree_cutoff_vanishing` |
| AS.3.17 | `yu_117` | `cutoff_degree_order` |
| AS.3.18 | `yu_157` | `lattice_count_quasipolynomial` |
| AS.3.19 | `yu_175` | `cone_sum_levi_vanishing` |
| AS.4.11 | `yu_017` | `discrete_spherical_spectrum` |
| AS.4.12 | `yu_018` | `discrete_pair` |
| AS.4.13 | `yu_019` | `good_discrete_pair` |
| AS.4.14 | `yu_020` | `moeglin_waldspurger` |
| AS.4.15 | `yu_021` | `residual_twist_stabilizer` |
| AS.4.16 | `yu_065` | `stabilizing_twist_spherical` |
| AS.4.17 | `yu_166` | `residual_eisenstein_residue` |
| AS.4.18 | `dit_138` | `cusp_decay` |
| AS.4.19 | `dit_wrong_sign_weyl_integrals_vanish` | `wrong_sign_weyl_vanishing` |
| AS.4.20 | `dit_eisenstein_integrable_over_core` | `eisenstein_core_integrable` |
| AS.6.19 | `yu_024` | `fixed_degree_trace` |
| AS.6.20 | `yu_025` | `fixed_degree_continuation` |
| AS.6.21 | `yu_038` | `charpoly_kernel_refinement` |
| AS.6.22 | `yu_039` | `coprime_nilpotent_vanishing` |
| AS.6.23 | `yu_047` | `weyl_fixed_levi` |
| AS.6.24 | `yu_048` | `torus_pairing` |
| AS.6.25 | `yu_049` | `multiplicative_gm_family` |
| AS.6.26 | `yu_050` | `regularized_family_value` |
| AS.6.27 | `yu_051` | `family_product_formula` |
| AS.6.28 | `yu_052` | `root_product_derivative` |
| AS.6.29 | `yu_053` | `root_coordinate_haar` |
| AS.6.30 | `yu_054` | `family_argument_principle` |
| AS.6.31 | `yu_055` | `family_central_vanishing` |
| AS.6.32 | `yu_062` | `torus_fourier_inversion` |
| AS.6.33 | `yu_063` | `arthur_lafforgue_spectral` |
| AS.6.34 | `yu_151` | `finite_fibre_trace` |
| AS.6.35 | `yu_152` | `degree_fourier_recovery` |
| AS.6.36 | `yu_164` | `twisted_truncated_trace` |
| AS.6.37 | `yu_165` | `lafforgue_spectral_expansion` |
| AS.6.38 | `yu_169` | `root_basis_identity` |
