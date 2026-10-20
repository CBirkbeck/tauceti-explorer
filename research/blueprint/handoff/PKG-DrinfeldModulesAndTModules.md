# PKG-DrinfeldModulesAndTModules: package handoff

Issue [#10763](https://github.com/CBirkbeck/tauceti-explorer/issues/10763). Agent: Claude (Opus 5.5), session `claude-JuTyFi`, 2026-10-20. This is a complete package, not a checkpoint.

## Deliverables

- `research/blueprint/packages/DrinfeldModulesAndTModules/README.md`: the roadmap in TauCetiRoadmap form, 138 targets (the 123 targets of the plan, packets `DrinfeldModulesAndTModules--DM.0` and `--DM.8` as joined by ASM-DrinfeldModulesAndTModules, plus 15 new targets listed below). Every target has its statement with hypotheses, a proof sketch or construction, the source locator, and a *Needs* line; every definition has its API and at least three Checks. Front matter: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build; back matter: Worked examples, Downstream consumers, Notes on the sources (the plan's 18 source corrections), References.
- `research/blueprint/packages/DrinfeldModulesAndTModules/Suggested.lean`: 482 lines, `import Mathlib` only, namespace `TauCetiRoadmap.DrinfeldModulesAndTModules`. Real-bodied definitions: `frobeniusAction` (the `q`-Frobenius action giving `R{τ} = SkewPolynomial R`), `OrePolynomial` with `tau`, `C`, `coeff`, `natDegree`; `DrinfeldModule` (structure), `DrinfeldModule.charIdeal`, `DrinfeldModule.Hom`, `DrinfeldModule.IsIsogeny`, `carlitz`; `carlitzBracket`, `carlitzD`, `carlitzEll`; `coefficientTwist`; `carlitzExp`, `carlitzLog`, `carlitzPeriod`; `carlitzTensor`; `finiteModuleCardinality`; `HasExactConstants`, `IsSemilinear`, `bettiComparison`; `IsFundamentalMatrix`, `solutionSpace`, `solutionRing`, `degreeSpan`. Theorems (by `sorry`): the polynomial-ring rank theorem, Carlitz rank, the Carlitz product recurrences, convergence and functional equation of `exp_C`, the convergence disc of `log_C` and `exp_C ∘ log_C = id`, the kernel and norm of the Carlitz period, the cardinality of `F[X]/(a)`, depth-one power sums, `ζ_A(1) = log_C(1)`, independence of fixed vectors and the Betti dimension criterion, transcendence of the Carlitz period, and Papanikolas's algebraic independence of Carlitz logarithms (stated over any complete algebraically closed nonarchimedean `K` with `‖θ‖ = q`, which contains `C_∞` as the closure of `k̄`; the statement for `K` is equivalent to the one for `C_∞`). Seven proved `example`s. A closing comment lists the 50 README definitions without a declaration.
- `research/blueprint/packages/DrinfeldModulesAndTModules/metadata.toml`: `topic = "math.NT"`.

## Checks run

- `lean-check research/blueprint/packages/DrinfeldModulesAndTModules/Suggested.lean` (Mathlib 082e2d37e8, Tau Ceti f790474): exit 0, 23 `declaration uses sorry` warnings, no errors and no other warnings.
- `scripts/check_sorry_data.py` on Suggested.lean: exit 0 (no sorry'd data; the only sorry'd fields are proof fields of `carlitz`).
- The gate's `mech_check.py`: no empty sections, no round-named labels, every bold target named; its list of README identifiers absent from the Lean file is the README-only targets.
- Scripted README checks: 138 sections, every packet node has its section, no unresolved cross-references, no broken anchors, no `*Needs:*` entry that points to a later target (the layers are presented in build order, see below), every Definition has at least three Checks, balanced code spans, none of the words optional/deferred/later/packet/node/gap/request/review/checkpoint/native.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- A Sonnet proofread of the whole README; its corrections were applied (see the PR description).

## Structure decisions

- **Layer order.** DM.1 (torsion) cites DM.4 (motives) in the plan. The README keeps the layer labels DM.0–DM.8 (other packages cite `DrinfeldModulesAndTModules DM.7`) and presents them in build order DM.0, DM.2, DM.4, DM.1, DM.3, DM.5, DM.6, DM.7, DM.8; target numbers `k.n` follow the label.
- **Within-layer reordering** to remove forward dependencies: DM.3 fine-moduli-scheme before moduli-functor, reciprocal-compactification before satake-compactification; DM.5 tate-image-saturation before tate-injectivity, period-ring before local-algebraization; DM.6 nuclear-determinant and trace-formula before euler-l-value. `DM.8/coefficient-twist` stays in Layer DM.2 (§2.1), as the assembly placed it.

## New targets (supplier contracts that no roadmap states)

A supplier audit (every request and gap of both packets against current TauCetiRoadmap `origin/main`, the atlas packages and the libraries) found these items unowned; they are now targets here, each with a verified locator:

| § | Target | Source |
| --- | --- | --- |
| 1.1 | Finite `F`-shtukas, strict `F`-module schemes, Drinfeld's functor | Hartl arXiv:1706.06807v1, Defs 4.1, 4.2, 4.5, pp. 12–14 |
| 1.2 | The finite shtuka anti-equivalence (Abrashkin, Hartl–Singh) | Hartl, Thm 4.7, pp. 14–15 |
| 1.3 | Semilinear Lang lemma (also inverse-twist and Weil-restriction forms) | Hartl, proof of Prop 6.5, p. 26; ReductiveGroupsPartII RG2.3.7, RG2.0a.2 |
| 1.10 | Local shtukas and divisible local Anderson modules (equal characteristic) | Hartl, §7, Defs 7.1, 7.3, Example 7.2, pp. 27–28 |
| 1.11 | Local shtuka anti-equivalence | Hartl, Thm 7.4, p. 28 |
| 3.7 | Section rings of ample bundles on normal proper schemes | Stacks 0B5T, 0C6J |
| 4.10 | Invariant factors over a discretely valued skew field (Maurischat) | Maurischat AIF 2026, Thms 3.6, 3.8–3.11, 4.1, pp. 17–22 |
| 4.12 | Pre-t-motives (the rational category DM.8 uses) | Papanikolas arXiv v2, §§3.1–3.2, 3.4.1–3.4.2, pp. 9–11, 17 |
| 5.8 | Rational motives of Drinfeld modules are simple | BP arXiv:1806.03919v1, §4.2, p. 16; Stalder, p. 3 (argument via left ideals of `L{τ}`) |
| 8.14 | Mac Lane's separability criterion, `κ(t)` case | Stacks 030W; Papanikolas §4.1.1, p. 21 |
| 8.19 | Anderson's uniformizability criterion | BP Thm 4.2, p. 16, §4.5, p. 18; Hartl–Juschka arXiv:1607.01412v2, Rem 5.31(b), Thm 5.32, pp. 72–73 |
| 8.22 | Tensor subcategory generated by a family | Deligne–Milne 2018, Prop 2.20(b), p. 25 |
| 8.23 | Graded vector spaces over any field and `G_m` | Deligne–Milne 2018, Example 2.30, p. 28 |
| 8.38 | Zero counts and growth of entire functions (Schwarz–Jensen form) | NewtonPolygons §§2.2, 4.3; ABP §3.4 |
| 8.43 | Growth of bounded monomial spans = transcendence degree | Papanikolas, proof of Thm 5.2.2, p. 33 |

## Plan gaps closed by proof routes in the README

- Rank integrality (§0.3): `L{τ}` is finitely generated torsion-free over the Dedekind ring `A ⊗ L`, free over `L[φ_a]` of rank `deg φ_a` by right division; its rank gives `r`.
- Analytic surjectivity and general-`A` kernel rank (§§2.4, 2.6): NewtonPolygons §5.3 (entire products, entire units are constants) and restriction to `F[t] ⊂ A`.
- Integral Tate saturation (§5.3): a morphism killing `ker φ_z` factors through `φ_z` (right division), giving injectivity of `Hom ⊗ A/λ → Hom(E[λ], E'[λ])`.
- Drinfeld motive simplicity (§5.8): new target above.
- Carlitz kernel separability (§8.49): a maximal torus of `Γ_X` maps isomorphically to `G_m`, so `π` is surjective on Lie algebras; scalar conjugation makes `V` linear; `H¹(F_q(t), 𝔾_a) = 0` from SchemeAndStackFoundations §§2.3, 2.6, 2.9–2.10 gives the rational lift.
- Pre-t-motive category: new target §4.12. Anderson's comparison: new target §8.19.
- Reciprocal-ring normality: Pink–Schieder arXiv:1007.4796, Theorems 1.6–1.7 and 1.11, pp. 5–6 (the plan's "Theorems 1.9 and 1.11" follow another numbering; 1.9 is an equation in this version).
- Fine-moduli chart: Drinfeld's argument through SchemeAndStackFoundations §§4.1, 4.3; elliptic-chain morphism convention and the residue factors at a non-rational `∞` are stated in §7.4's proof sketch.

## Supplier re-pointing

- AdicSpaces Layer 0 requests → RestrictedPowerSeries (Layer 1, §§3.2, 4.3, 5.1–5.2, 7.2) and NewtonPolygons (§§1.3, 2.2, 3.3, 4.3, 5.3) on TauCetiRoadmap main; AdicSpaces Layer 0 has none of the Weierstrass/entire material.
- SchemeAndStackFoundations atlas ids → the upstream README sections (§§0.3, 0.7, 0.20, 0.21, 1.1, 1.13, 1.15, 1.17, 1.23, 2.3, 2.6, 2.9–2.11, 2.15, 3.2, 3.5, 4.1, 4.3). `SF.1/affine-fpqc-descent` has no upstream target; it is §1.1 with AlgebraicVectorBundles L1A–L1B. `SF.0/jacobson-finite-type` is consumed from Mathlib upstream (`isJacobsonRing_of_finiteType`).
- `FunctionFieldArithmetic:FA.0` (a stage, nine DM.8 citations) → its items' owners: FunctionFieldArithmetic §§0.1–0.2 and §2.1, AlgebraicCurves Layers 3, 5 and 12, the new §§1.3 and 8.14, NewtonPolygons §3.3.
- `MotivesAndAlgebraicCycles:MC.6` → its package §§6.1–6.3; the generated-subcategory and graded/`G_m` items are new targets (§§8.22–8.23) because MC states the `G_m` computation over `ℚ` only.
- JacobianChallenge Layer B for `H⁰ = L(D)` → AlgebraicCurves §12E. StableReduction Layer 0 → current Tau Ceti Fitting ideals.
- FiniteFieldsAndCharacterSums keeps the shared linearized-polynomial targets (*frobenius-ore-polynomial-comparison*, *linearized-polynomial-eval-linear*, *linearized-polynomial-separable-iff*, *subspace-polynomial-is-linearized*); it has no package yet (#10766), so the README cites the target names, not section numbers. When that package exists, its section numbers can replace the names.

## Corrections to the plan (packets unchanged)

- `DM.2/a-lattice` test *ALattice_test_discrete_constants*: `F̄ ⊂ C_∞` is not an `A`-module; the README uses `F̄[θ] = F̄·A`.
- DM.8 non-examples "`σf = θf^(−1)` is not rigid analytically trivial" do not hold (a constant solves it); the README uses the `σ`-matrix `t` (order at `0`).
- `DM.0/relative-standardization`: the README gives the nilpotent-induction route that Hartl attributes to Drinfeld and Matignon.
- Several plan Checks were vacuous or acceptance prose; the README replaces them with computed checks (for example `Σ_(c∈F) 1/(θ + c) = ℓ_1^(−1)`, `log_C(θ + 1) = θ·log_C(1)` at `q = 2`, the ABP lift `(t, −1)` of `(θ, −1)`).

## API names

The README uses package names; the plan's API items are all present by content. Renamed items (plan → README): `DrinfeldModule.map` → `toRingHom`, `constantCoeff_map` → `coeff_zero`, `carlitz_map_X` → `carlitz_toRingHom_X`, `carlitz_constantCoeff` → `carlitz_coeff_zero`, `idealTorsion_principal` → `idealTorsion_span_singleton`, `idealTorsion_crt` → `idealTorsion_mul`, `tateModule_rank` → `tateModule_free`, `ALattice.quotient_card` → `card_quotient`, `ALattice.exp_ker` → `exp_eq_zero_iff`, `carlitzPeriod_ker` → `carlitzExp_eq_zero_iff`, `carlitzPeriod_norm` → `norm_carlitzPeriod`, `carlitzOmega_at_theta` → `carlitzOmega_eval_theta`, `GeneralizedDrinfeldModule.coefficient/isWeaklySeparating` → `coeff/IsWeaklySeparating`, `TModule.isAbelian/isUniformizable` → `IsAbelian/IsUniformizable`, `EffectiveTMotive.pureTensor` → `isPure_tensor`, `EffectiveDualTMotive.isAFinite` → `IsAFinite`, `tateHomMap_pure` → `tateHomMap_tmul`, `TaelmanModel.units_mem` → `mem_units`, `tangentDelta_identity` → `tangentDelta_id`; the `TauCeti.Difference.Periods.*` names of DM.8 become package names in the same order (`twist_*` → `coefficientTwist_*`, `entire_*` → `arithmeticEntire_*`, `rigid_*` → `isRigidAnalyticallyTrivial_*`, `fundamental_*` → `IsFundamentalMatrix.*`, `admissible_*` → `IsAdmissibleTower.*`, `solution_*` → `solutionSpace_*`, `carlitzDeformation_*` → `carlitzLogDeformation_*`, `log*_entries` → `log*_apply`). `charLocalRealization` is a theorem in the README (its rank and finite-level API items are part of its statement).

## Notes

- No suspicious text was met in issue comments or fetched sources.
- Sources read this run (public copies): BP, Papanikolas, Hartl, Stalder, Taelman, Pink, Hartl–Yu, Wiedmann, Thakur, Crew, Maurischat, ABP, Pink–Schieder, Papikian, Deligne–Milne, Hartl–Juschka, and Stacks tags 030W, 0B5T, 0C6J.
