# Independent fixing review: FiniteFlatGroupsAndIntegralPadicHodgeTheory

**Verdict: accepted, with the fixes in this change.** Agent: Claude (Opus 5.5), session claude-GtBNOt,
13 October 2026. Refs #9376. The input was the package written by session claude-vE8exZ (#9374,
merged as #9440). This reviewer wrote neither the package nor its plan.

With the corrections below, the package is ready for the maintainer's draft TauCetiRoadmap pull
request. This review checks a roadmap. It does not claim that any of the theory is formalised. The heavy
objects are still README targets: `p`-divisible groups beyond the finite levels, Dieudonné functors,
period rings, Breuil–Kisin and Breuil modules, the Robba ring, tame inertia and ramification
filtrations. The Lean file only states signatures over carriers that exist at the pins.

## What was read and compared

- **Method documents.** WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md §§5, 13 and 20, and
  UPSTREAM_GUIDE.md.
- **The package.** The whole README (6,395 lines, 153 numbered targets in six layers) and the whole
  `Suggested.lean`, read through.
- **The plan.** A Sonnet subagent mapped the 147 nodes of the accepted packet to README targets. I
  read the result, and the flagged hypotheses, myself.
  - Every node is placed. 146 match by title, and the `p-divisible-group` node is §R07.1.6.
  - Six targets were moved down from the tier-13 PadicHodgeTheory and the tier-12
    PadicDifferentialEquationsAndRigidCohomology: §§R07.1.18, R07.3.1–R07.3.3, R07.4.7 and R07.4.8.
  - Two packet nodes now sit in another layer: Frobenius and Verschiebung (§R07.1.1) and the tame
    characters (§R07.1.26). Both moves follow the plan review's layer-order notes.
- **API names and Checks.**
  - All 171 packet API names are in the README, under the author's two documented renames:
    `PDivisibleGroup.*` became `BarsottiTate.*`, and the mod-`p` `BreuilModule.*` became
    `BreuilModuleModP.*`.
  - Every definition has at least three Checks and every theorem at least two.
  - There are 405 `*Needs:*` references to other targets, none forward and none dangling.
- **Tiers.** FiniteFlat is tier 10. Every roadmap it cites is lower:
  - SchemeAndStackFoundations (tier 2);
  - AbelianSchemesAndArithmeticModuli and InverseGaloisAndArithmeticFundamentalGroups (tier 6);
  - ArithmeticGaloisRepresentations (tier 7);
  - SelmerIwasawaCohomology and NeronModelsAndSemistableAbelianVarieties (tier 8);
  - CrystallineCohomology and DerivedDeRhamCohomology (tier 9);
  - the TauCetiRoadmap roadmaps.

  Higher roadmaps are named only in *Not built here* and *Downstream consumers*. There is no
  `FoundationsAndLibraryIntegration` and no `UPSTREAM:` citation.


## Fixes applied to Suggested.lean

The original file elaborated, but four of its statements were wrong or weaker than the README, and one
duplicated the current library.

1. **`isEtale_of_isUnit_rank` was false as stated.** `rank G` is `Module.finrank R (coord G)`, which
   is the order only when `Spec R` is connected.
   - Counterexample: `R = F₂ × F₂`, with `G` trivial on the first factor and `μ₂` on the second.
     The coordinate algebra `F₂ × F₂[x]/(x² − 1)` has `Module.rank` 1, because any two elements are
     dependent through the first factor. So `IsUnit (rank G : R)` holds, yet `G` is not étale.
   - Fix: added `[IsLocalRing R]`. The `rank` docstring now records the counterexample and the
     local-base convention.
2. **`IsConnectedLocal` docstring.** "Local coordinate algebra" equals "connected" only over a
   *henselian* local base. The docstring and the README Conventions now say so. The one theorem
   using the predicate, `rank_eq_one_of_isEtale_of_isConnectedLocal`, is true over any local base:
   a finite étale algebra with a section splits off `R`.
3. **`schematicClosure_flat` was weaker than §R07.1.20.** The old conclusion,
   `Nonempty (genericFibre 𝓗 ≅ H)`, did not tie the closure to the given subgroup `ι`. It now
   provides `e : genericFibre K 𝓗 ≅ H` with `e.hom ≫ ι = (baseChangeFunctor R K).map j`.
4. **`prolongation_unique_of_lt` was weaker than Raynaud 3.3.3 and §R07.1.30.** The old conclusion,
   an abstract `Nonempty (𝓖.model ≅ 𝓖'.model)`, says nothing about the identification of generic
   fibres. It now concludes `𝓖.Dominates 𝓖'`. With `dominates_unique` this is uniqueness up to
   unique isomorphism, which is what Raynaud's proof gives: any morphism of models extending the
   identity is an isomorphism.
5. **`Eisenstein` accepted `E = 1`.** Mathlib's `Polynomial.IsEisensteinAt` puts no condition on the
   degree: the constant `1` satisfies `leading`, `mem` (vacuous) and `notMem`.
   - With `E = 1`, the test `KisinModule.eisenstein_height_one` (height `≤ 1` but not `≤ 0`) is
     false.
   - Fix: added the field `natDegree_pos : 0 < E.natDegree`, proved for `eisensteinUnramified` by
     `natDegree_X_sub_C`.
6. **Duplication.** Removed `rank_cartierDual`. The current Tau Ceti library proves the stronger
   statement `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.finrank_cartierDual` (the whole rank
   function, any base, `CartierDuality/Rank.lean`). The module docstring and the README now cite it.
7. **Proof obligations.** The seven `sorry`'d axiom fields of `DieudonneModule.qpZp` and
   `DieudonneModule.muPInfty` (`V_smul`, `F_V`, `V_F`, and `F_smul` of `muPInfty`) are now proved. The
   proofs are short `simp only` computations with `WittVector.frobeniusEquiv`. Both standard modules
   are therefore genuine objects, and the contravariant convention `F = σ` / `F = pσ` is checked by
   Lean.

`lean-check` exits 0. The only warnings are 29 `declaration uses 'sorry'`, down from 32: there is one
fewer theorem and two fewer definitions with sorry'd fields. `scripts/check_sorry_data.py` reports no
offenders. The file has 731 lines.

## Fixes applied to README.md

### Statements and Checks that were false or overstated

- **§R07.1.31, Raynaud's boundary case `e = p − 1`.**
  - Raynaud's Proposition 3.3.2 3° (p. 267) is about a simple `K`-scheme in `F`-vector spaces of
    rank `q`.
  - The README stated it for an arbitrary simple finite group killed by `p`. Over a henselian base
    that is not strictly henselian, a simple group killed by `p` need not be an `F`-vector scheme:
    `E[p]` of a supersingular curve over `ℚ_p` has commutant `F_p` and rank `p²`.
  - The statement is now scoped to `F`-vector schemes of rank `q`. It also records that the
    prolongations are `F`-vector schemes, and §R07.1.27 was added to *Needs*.
- **§R07.3.6, the ring `S`.**
  - Fontaine–Laffaille §2.6–2.7 (p. 561) define `Fil^i S` as the `i`-th power of `ker θ` intersected
    with `{x ∈ S : Φx ∈ p^i S}`. The README kept only the second condition, under which `p ∈ Fil¹S`.
  - Corrected the definition and added the locator.
  - The Check `flPeriodComparison_xi` now uses both conditions, with `p` as the negative control:
    `Φ(p) ∈ pS`, but `θ(p) ≠ 0`.
- **§R07.6.7 (ii), Ramakrishna's flat deformation ring.**
  - The README asserted `R^fl = W(F_q)⟦T₁, T₂⟧` for every `ρ̄` with `End = F_q`.
  - Ramakrishna proves it for `q = p` (Theorem 3.1, p. 276) and for irreducible `ρ̄` (Theorem 4.2,
    p. 281). The statement is now scoped to these two cases.
- **§R07.1.27 `FVectorScheme.not_of_rank`.** The Check claimed that `ℤ/p × ℤ/p` has eigen-sheaves
  of rank 2. In fact `𝔽_p^×` acts freely on the `p² − 1` nonzero points with `p + 1` orbits, so each
  eigen-sheaf has rank `p + 1`. Corrected.
- **§R07.1.30 `prolongation_unique_ext`.** The Check read the Ext-injectivity backwards ("a
  nonsplit generic extension that is split integrally cannot occur", which is trivially true). It
  now states the content: an extension over `ℤ_p` that splits over `ℚ_p` splits over `ℤ_p`.
- **§R07.2.10 `dieudonnePDivisible_torsion_free`.** The Check was self-contradictory. It now
  contrasts two limits:
  - the inverse limit along `M(G_{n+1}) ↠ M(G_n)`, which is `W(k)` for `ℚ_p/ℤ_p`;
  - the direct limit along `M(G_n) ↪ M(G_{n+1})`, which is `W(k)[1/p]/W(k)` and not finitely
    generated.
- **§R07.4.24 `finiteFlatRestriction_needs_flat`.**
  - The Check argued that the Kummer extension `V` by `π` is not finite flat from
    `H¹_fppf(𝒪_K, μ_p) = 𝒪_K^×/(𝒪_K^×)^p`. That rules out only the model with sub `μ_p` and quotient
    `ℤ/p`. Here `μ_p ⊂ K` forces `e ≥ p − 1`, where other models of the two factors exist.
  - The Check now uses the ramification break `pe/(p − 1)` of `K(π^{1/p})/K`, which Fontaine's bound
    (§R07.6.5) excludes.
- **§R07.5.15, the Barthel–Livné exceptions.** The exceptions `(r, λ) ∈ {(0, ±1), (p − 1, ±1)}`
  are now stated for `F = ℚ_p` and `σ = Sym^r ⊗ det^s`; the label `r` is undefined for general `F`.
- **§R07.6.3 `krasnerCriterion_tame`.** The Check needs `L/K` totally ramified, so that
  `e_{L/K} = m′`.

### Hypotheses restated where they were only implicit

- "Characteristic `p`" in §§R07.2.1, R07.2.4 (with `n, m ≥ 1`), R07.2.8 and R07.2.20.
- `σ` is an automorphism of `W(k)` (§R07.2.5).
- The Krull topology (§R07.2.7).
- `p` a prime in §R07.1.12.

### Duplication against current Tau Ceti and Mathlib

The searches are by object, over TauCetiRoadmap `0d144d04` and the Tau Ceti library `a91d3aaf`.

- Cartier duality preserving rank is
  `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.finrank_cartierDual`. The Lean theorem was
  removed, as above, and the README cites this declaration.
- The abstract Tate module `TauCeti.TateModule p A` and `TauCeti.PadicTateTwist` are now named:
  - in §R07.1.8, where `T_p(G)` is the Tate module of `colim G_v(K̄)` and the target keeps only
    freeness and the duality pairing;
  - in the supplier contracts.
- The lower and upper ramification groups and Herbrand functions of the current library
  (`LocalFieldsRamification.*`) are now named in §R07.6.2. That target keeps only Fontaine's shifted
  normalisation.
- `TauCeti.AlphaP.CoordinateRing` and `TauCeti.RootsOfUnityGroup.groupScheme` (both at the pin) are
  listed as suppliers.
- Mathlib's one-dimensional `FormalGroup` with `FormalGroup.IsComm` is named in §R07.1.12 as the case
  `n = 1` of `FormalLieGroup`.
- No other target exists in the current library or in a current roadmap:
  - there are no `p`-divisible or truncated BT groups, no Dieudonné theory, no isocrystal slopes and
    no Oort–Tate or Raynaud classification;
  - there are no period rings, no filtered, Breuil–Kisin or Wach modules, and no Robba ring;
  - there are no Serre weights and no peu or très ramifié classes.

  ModularCurves plans finite flat groups at Layers 0B–0E and 7E, and says that Dieudonné theory and
  Oort–Tate are not scheduled there. The README already imports those layers.

### Structure and own words

- The *Downstream consumers* bullets had been spliced into the middle of *References*, after AGHMP,
  leaving the `## Downstream consumers` heading empty. They are now under their own heading.
- The Serre 1987 link (College de France) returns 404. The DOI link
  `https://doi.org/10.1215/S0012-7094-87-05413-5`, which resolves to the article, replaces it. Every
  other reference URL returns 200.
- Two short quoted source phrases were reworded: a Pilloni phrase in §R07.1.4 and "analogous" in
  §R07.5.7.
- There are no other quotations, no section-by-section summaries, and no process language.
- Edited paragraphs were re-wrapped to 100 columns.

## Sources checked

The sample covered the plan review's open points and the author's moved-down targets, and went well
beyond 15 locators. Retrieval subagents pulled each statement. I read the source text myself wherever
a mismatch, a hypothesis or a convention was in question.

| Source | Locators checked | Result |
| --- | --- | --- |
| Raynaud 1974 (Numdam) | 1.2 (\*\*), 1.2.2, 1.4.1, 1.5.1–1.5.2, 2.1, 2.2.1–2.2.3, 2.3.1, 3.3.2, 3.3.3, 3.3.5–3.3.7, 3.4.1, 3.4.3–3.4.4, 4.1.1–4.1.2, 4.2.1, App. Déf. 8, Prop. 9 | All pages match. 3.3.2 3° is about `F`-vector schemes: §R07.1.31 fixed. 2.1 is over a DVR, as the README says. |
| Oort–Tate 1970 | Thm 2 (p. 12), Thm 3 (p. 20, exponent `−n_v`, `0 ≤ n_v ≤ v(p)`), Lemmas 4–5, Deligne (p. 4), Artin–Mazur (Intro, p. 2) | All match; §3 allows any integrally closed `R` with fraction field `K`. |
| Tate 1967 | Thms 1–2 (p. 176), Thm 3 (p. 179), Cor. (p. 180), Thm 4 and Cors. 1–2, Prop. 12 (pp. 180–181), Prop. 2 and Lemma 1 (pp. 164–165) | All match. |
| Schoof 2003 | §2 `T_ε` (p. 418), Prop. 2.3, Cor. 2.4 (pp. 419–420) | All match. |
| Fontaine–Laffaille 1982 | 0.4, 0.9, 1.5, 1.8, 2.6–2.7, 3.3–3.4, 4.4, 5.3, 6.1, 6.6, 7.7–7.8, 7.15, 7.17, 8.4, 9.10–9.12 | Pages match. 2.7's filtration: §R07.3.6 fixed. 8.4's window `D^j = D`, `D^{j+p} = 0` is the README's. |
| Ramakrishna 1993 | 1.1, 1.2, 2.1, 3.1, 3.2, 4.1–4.4, Cor. 4.1 | Pages match; scope of 3.1 and 4.2: §R07.6.7 fixed. |
| Wintenberger 1983 | 1.2.2–1.2.3, 2.1.3, 3.1.2, 3.2.2–3.2.3 | All match. |
| Fontaine 1985 | Théorème A, 1.2 Rem. i), 1.3–1.5, 1.7, 1.8, 2.1 Thm 1, 2.2 Rem. a) | All match (`u > e(n + 1/(p − 1))`, `G^(u) = G^{u−1}`). |
| Pink 2005 | 14.3, 14.4, 15.5, 23.2, 26.1, 27.3, (28.1), 28.3, 28.4 | All match (printed = PDF − 4). |
| Stix 2012 | Thms 33, 34, 60, 70, 88, 91; Props 37, 40(4), 62; Lemma 61; Cors 64, 92–94 | All match. |
| Savitt 2005 (arXiv v3) | 2.17, 2.18, 2.21, 3.1 (prints `Gal(F′/F)`, as the README notes), 3.2, 6.8, 6.11, 6.15 | All match; `p` odd throughout, as the README says. |
| Brinon–Conrad 2009 | 2.2.7 (the image of `η` a commutative `p`-adic Lie group of dimension ≤ 1, exactly as §R07.1.18), 8.2.1, 8.2.8, 8.3.1, 9.1.12, 9.2.14, 9.3.4, 9.3.8–9.3.9 | All match. |
| Kedlaya 2005 (arXiv) | 4.5.7, 4.6.1, 6.3.3, 6.3.5, 6.4.1, 6.4.3 | All match. |
| Yu 2026 | Def. 1, Thm 3, Ex. 2, Lemma 4, Thm 5 | All match. |
| ACC 2023 (cleared library copy) | Lemma 7.1.8 (pp. 1091–1092), Lemma 7.2.2 (pp. 1098–1099) | Match; the `ε`-has-weight-`−1` convention is flagged in §R07.5.12. |
| Pilloni 2020 (cleared library copy) | 6.3.1.1, 6.3.3.1–6.3.3.2, 6.3.4.2, 7.4.2.1, 9.1.1.1, 10.1.1, 10.2.1, 14.1.2, 14.3.2 | Pages match. |

Not checked:

- **Serre 1987.** The only free copy, the College de France page, is offline.
- **Kisin 2006, 2008, 2009 and 2009b.** The author's copies are DVI files only, and this machine has
  no DVI tools.
- **Serre 1972.** A GDZ scan with no text layer.

These locators stay as the author and the plan review left them.

## Adversarial mathematics pass

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| `isEtale_of_isUnit_rank` | disconnected base `F₂ × F₂` | false: hypothesis added (above) |
| `Eisenstein`, Kisin height tests | `E = 1`, `E = u − p` | `E = 1` broke a test: degree field added |
| Raynaud uniqueness / boundary (§§R07.1.30–31) | `p = 2`, `e = p − 1` (`ℤ_p[ζ_p]`), `ℤ/p × ℤ/p`, supersingular `E[p]` over `ℚ_p` | Lean conclusion strengthened; §R07.1.31 scoped |
| Contravariant Dieudonné conventions (§§R07.2.6–R07.2.20) | `ℚ_p/ℤ_p`, `μ_{p^∞}`, `α_p`, `M₁`, `M₂`, covariant module, linear dual | consistent; `F`/`V` now proved in Lean |
| Filtered modules and twist (§§R07.3.1–R07.3.3) | `unit⟨−1⟩`, `D_cris(ℚ_p(1))` vs `D*_cris`, the diag(`σ`, `pσ`) example, `N`-relation | consistent with `HT(χ) = +1` |
| Fontaine–Laffaille weights (§§R07.3.9–R07.3.18) | `M(1;0)`, `M(1;p−1)`, `p = 2` safe interval `[0,0]`, `μ_p` ↔ jump 1 | consistent |
| Kisin rank-one objects (§§R07.4.10–R07.4.25) | `ℚ_p`, `ℚ_p(1)`, `ℚ_p(2)`, `φ(e) = pe`, Kisin vs. AGHMP twist | consistent; the twist checks follow from `𝔐 ⊗ W[1/p] = D_cris` and do not depend on the BMS sign question |
| Kummer, peu/très (§§R07.4.24, R07.5.4–R07.5.8) | `p = 2` with `d ∈ {5, −1, −5, ±2, ±10}`, Tate curve `v(q) = 1`, `μ_p ⊂ K` | one Check argument repaired (above) |
| Oort–Tate counts (§§R07.1.34–R07.1.35) | `ℤ_p`, `F_p` (`α_p`), `p = 2` over `ℤ`, `ℤ[1/2]` with `p = 3` (eight groups) | consistent |
| Ramification (§§R07.6.2–R07.6.10) | `ℚ_p(ζ_{p^n})`: `u = n`, `v(𝒟) = n − 1/(p − 1)`, `u − i`; `p = 3` with `ℚ_3(ζ_9)` | consistent |
| Schematic closure, models (§§R07.1.20–R07.1.24) | graph of `ℤ/p ≅ μ_p` over `ℤ_p[ζ_p]`, `ℤ_2` | consistent; Lean compatibility added |

## Checks run

- `lean-check …/Suggested.lean`: exit 0. The only warnings are 29 `declaration uses 'sorry'`.
- `scripts/check_sorry_data.py`: no offenders.
- `research/blueprint/intake.py check-files` on the package files, the review and the handoff: no
  problems.
- `metadata.toml`: `topic = "math.NT"`, which fits.

## Left for the maintainer

- **Overlap with SelmerIwasawaCohomology.** That roadmap's §§4.6–4.7 also state covariant
  Fontaine–Laffaille theory over a finite residue field. The package states the relation in *Scope
  and ownership*. The package author flagged this; it is a restructuring choice, not a defect of this
  package.
- **Unsampled locators.** The Serre 1987 and Kisin locators could not be checked, for the reasons
  above.
