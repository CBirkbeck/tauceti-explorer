# Handoff: PKG-LefschetzPencilsAndVanishingCycles (issue #9179)

Worker: Claude (Claude Code), session claude-4Kwi73, 2026-10-13. The job is complete; this note records what
was done and every change made to the plan while packaging it.

## Deliverables

- `research/blueprint/packages/LefschetzPencilsAndVanishingCycles/README.md`: the roadmap, about 270 KB.
  - It opens with a summary, then scope and ownership, conventions, exact supplier contracts and the build order.
  - It has nine layers, LPV.0–LPV.6, LPV.7a (semistable curves and degenerations) and LPV.7b (invariant
    cycles), followed by downstream consumers and references.
  - Every target of the two accepted packets (LPV.0 revision 2, 89 nodes; LPV.7, 36 nodes) is in the
    README, with its statement, hypotheses, API, Checks, source locators and inputs, except where listed under
    "Changes" below.
  - A script check confirms that every node is placed. Every API and unit-test name of both packets appears in the
    README, except the ten names of the imported unipotent logarithm and the six renamed model tests (both below).
- `research/blueprint/packages/LefschetzPencilsAndVanishingCycles/Suggested.lean`: 327 lines, 26 declarations.
  - It holds the commutative algebra and linear algebra that can be stated at the pins:
    - ordinary quadratic forms over a field, the coordinate quadratic series, order at least three, the ordinary
      quadratic germ and the even Clifford centre;
    - the local transvection and its fixed-space lemma, the radical quotient and its induced form;
    - Weil I, Lemme 5.11;
    - maximal unipotence;
    - the normalization differential and the negative edge pairing;
    - the invariant-specialization corestriction and the spectral-separation lemma.
  - Each kept definition has real bodies and one or two examples. The README names every Lean declaration in a
    `*Lean:*` clause.
- `research/blueprint/packages/LefschetzPencilsAndVanishingCycles/metadata.toml`: `topic = "math.AG"`.

## Checks run

- `lean-check …/Suggested.lean` at the pinned shared build (Mathlib 082e2d3, Tau Ceti f790474): **exit 0**. The output
  has 22 warnings, all `declaration uses 'sorry'`, plus the info output of the two `#check` lines for
  `TauCeti.genericFiber` and `TauCeti.specialFiber`. The file imports `Mathlib`,
  `TauCeti.AlgebraicGeometry.Fibers` and `TauCeti.LinearAlgebra.GeneralLinearGroup.Unipotent`, whose oleans are in the
  build.
- `python3 scripts/check_sorry_data.py` on the Lean file: no offenders.
- `python3 research/blueprint/intake.py check-files` on the three files: 0 problems.
- A script found no forward references in the *Needs:* clauses. A process-word scan of the README found only upstream
  section headings ("Scope and ownership", "Exact supplier contracts", "Downstream consumers") and mathematical uses of
  "node".
- Locators checked by the worker against the sources:
  - Weil I §§4–7 printed pages (pdf + 271) and Weil II 1.6–1.7, 1.11, 3.6, 4.2–4.5 and 6.2 printed pages (pdf + 135);
  - Weil II 4.5.1–4.5.2 statements, read on the rendered page image;
  - Illusie 1994, Théorèmes 1.2 and 1.4, 1.5, Théorème 4.2, Corollaires 4.5–4.6 and the trait perversity on p. 48;
  - Illusie 2006 §1.1(b) and Illusie 2021 §§6.1–6.3;
  - Saito 2003 manuscript numbering (Propositions 1.1.1–1.1.2, Corollary 1.1.3, Lemma 2.2.1, Corollaries 2.2.2 and 2.2.4,
    Propositions 2.2.3 and 2.2.6);
  - ILO Exposé XVI (Riou), Théorème 3.1.1 and Corollaires 3.1.2–3.1.3, in arXiv:1207.3648;
  - SGA 7 II Exposé XVIII, Proposition 6.1 and 6.1.6.1;
  - Stacks tags 09ED, 09EE, 0BU4, 0BU5, 0BU7, 0BU8 and 0EYG.
- Supplier headings were mapped with a Sonnet cross-check and verified by the worker. Lower-tier package headings
  are cited as they stand.

## Changes to the plan made while packaging (for the maintainer and the next jobs)

No packet was edited. The changes below are in the README only.

### Upward citations removed (CaraianiNewton.md tier 10)

1. **DeligneWeightsAndPurity (13 citations, tier 11).** The weight-dependent targets of LPV.7:invariant-cycles are
   stated in a conditional, weight-free form (README 7b.5–7b.11):
   - `invariant-and-support-weight-bounds` becomes the spectral-separation lemma
     (`InvariantCycles.surjective_of_disjoint_spectra`, in Lean). In an equivariant exact cross, if the Frobenius spectra
     on `B` and `C` are disjoint, then `L → B` is onto. The weight bounds of Weil II 3.6.2–3.6.3 are what make the
     spectra disjoint.
   - `local-invariant-cycles` (Weil II 3.6.1) and `pure-complex-local-invariant-cycles` (6.2.9) assume disjoint
     spectra on a finite-field model.
   - `global-invariant-cycles` (6.2.12) assumes local surjectivity at the singular members of a general pencil.
   - `geometric-generic-pure-model` and `potentially-pure-model` are weight-free arithmetic model structures,
     renamed `InvariantCycles.GeometricGenericArithmeticModel` and `InvariantCycles.TraitArithmeticModel`. Their API is
     unchanged. Their tests are rewritten without purity, as `model_constant`, `model_shift_twist` and
     `model_not_closed_point`.
   - `potential-purity-incidence-pullback` keeps the transport of models and the duality identity; the purity of the
     pulled-back model is left to the weight theory.

   **For DeligneWeightsAndPurity:** its import E44 (README, input list, "LefschetzPencilsAndVanishingCycles:
   LPV.7:invariant-cycles") should become "the conditional theorems of LPV 7b.5, 7b.8, 7b.11". DWP.9 should state Weil
   II 3.6.1, 6.2.9 and 6.2.12 unconditionally by discharging the hypotheses with DWP.5/DWP.7/DWP.8: weights at most `i`
   on `B` and at least `i + 1` on `C`; local surjectivity from potential purity. DWP.8 already owns "potentially pure"
   (`potentially-property-p-3-4-10`).

   Also left to weights, as explicit hypotheses or boundary statements:
   - the mixedness existence clause of LPV.1 normal-crossings restriction (Weil II 1.9);
   - the nondegeneracy of `E` in the even orthogonal branch (5.10, from hard Lefschetz);
   - the decomposition `H^n(X_t) = H^n(X) ⊕ E(X_t)` for the gcd theorem (5.11, Weil II 4.3.9).
2. **IgusaVarietiesAndTorsionConcentration IG.4 (2, tier 19).** `LPV.6/igusa-semiperversity-interface` becomes an
   abstract tower criterion (README 6.5, "semiperversity of a tower of nearby cycles"). Its hypotheses (i)–(iii) are
   the geometric inputs IG.4 supplies. **For IgusaVarieties:** IG.4 instantiates the criterion; it is no longer
   imported by LPV.
3. **FunctionFieldArithmetic FA.5 (outside the 94).** Replaced by ArithmeticGaloisRepresentations Layer 5, §5.13
   (`functionField_chebotarev`) and CohomologicalPointCounting/TraceFormula Layers 7 and 11.
4. **FiniteFieldsAndCharacterSums FF.0 (dropped from the 94).** Replaced by CohomologicalPointCounting/FrobeniusGeometry
   Layers 3–5 and SchemeAndStackFoundations SF.0.

### Notions planned here because no allowed supplier has them

Each is a target or part of a target in the README:

- **Absolute purity** (Gabber), README 0.10, with Riou's Corollaires 3.1.2 (relative purity) and 3.1.3 (normal crossings).
  - EtaleDualityAndPerverseSheaves' own gap EDC.0-G1 names LPV as a possible owner. That package, a bundle-mate, should
    cite LPV 0.10 rather than plan purity again.
  - It is used by 1.9, 2.7 (odd Picard–Lefschetz), 6.6 and 7a.7–7a.8.
- **Tame character of an arbitrary henselian trait** (0.1, Stacks 15.114). ArithmeticGaloisRepresentations Layer 2 has
  it only for nonarchimedean local fields; 0.1 states the comparison.
- **The perverse t-structure on a scheme over a trait** (6.2 definition, Illusie 1994 p. 48). EDC.5 plans perverse
  t-structures over fields only. **For EtaleDualityAndPerverseSheaves:** cite LPV 6.2 or move it into EDC.5 when that
  package is written.
- **Commutation of costalks with filtered colimits** (6.5), in E1's unbounded category. Neither EDC.5 nor E1 has it.
- **Bertini irreducibility** (5.1, SGA 7 XVIII 6.1.6.1), and Bertini for monodromy images generalized to any dense open of
  `P̌` and any lisse sheaf. This closes the LPV.7 request for constructible-complex pencils (Weil II 6.2.10).
- **Tame generation of `π_1^t(P¹ − S)`** (5.3, SGA 1 XIII 2.12). IG.1.2 has the tame fundamental group but not this
  presentation-quotient statement.
- **The nine-diagram boundary sign** (7a.2). The EDC.1 request is NOT covered by EDC.
- **The `I_2` model** (7a.6): `y² = x³ + x² + π²` and one blow-up from StableReduction Layer 4. The StableReduction
  Layer 5 request was not covered.
- **The henselian implicit function theorem** (Tougeron, 2.4), stated in full. **Artin approximation** comes from
  AlgebraicModuliForArithmeticGeometry Layer 6, not from the "SchemeAndStackFoundations Part II" proposal.
- **The Rees blow-up** for the incidence pencil comes from TauCetiRoadmap StableReduction Layer 4, instead of
  "SchemeAndStackFoundations Part II" / SF.4.

### Duplications removed (imported from lower tiers or Tau Ceti)

- **`LPV.1/finite-monodromy-logarithm`** is ArithmeticGaloisRepresentations Layer 2, §2.4 (`IsUnipotent.log_exp`,
  `exp_log`). Its API names `finiteLog*` and its four tests are dropped from the README. The definition is quoted in 1.2.
- **Vector-space monodromy filtration with uniqueness, tensor and dual rules**: ArithmeticGaloisRepresentations Layer 2,
  §2.6 (`MonodromyFiltration.ofNilpotent`).
  - LPV 1.3–1.4 keep the abelian-category version, which LPV.7a needs on perverse sheaves (Weil II 1.6.1). They also
    keep strictness, primitive decomposition and an explicit `𝔰𝔩₂`-triple on the graded pieces.
  - The latter replaces the "LieHighestWeight, Part II" request: no Jacobson–Morozov theorem is needed.
  - `LPV.1/tensor-dual-and-symmetric-monodromy` is cited to AGR §2.6. AGR records the char-0 highest-weight chain there
    as its own prerequisite gap.
- **Closed subgroups of ℓ-adic Lie groups**: TauCetiRoadmap AdelicAlgebraicGroups Layer 4, §4.2, which replaces the
  "LieGroups, Part II" request.
- **Orthogonal groups over ℚ_ℓ**: TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2, which replaces "ClassicalGroups,
  Part II".
- **Mixed Hodge structures**: Completed HodgeStructures and Tau Ceti `MixedHodgeStructure`. The complex invariant-cycle
  theorem (7b.6) is conditional on the limit MHS, which nobody plans ("HodgeStructures, Part II" is outside the 94).
- **Nearby/vanishing cycles, Lefschetz pencils, perverse sheaves, quadrics, Kazhdan–Margulis**: no duplicate in current
  Tau Ceti (a91d3aaf), current TauCetiRoadmap main or PR #196. PR #196 explicitly excludes nearby cycles, `f^!` and
  perverse sheaves.

### Structural changes inside the roadmap

- **`LPV.4/pencil-leray-and-middle-reduction`** is stated in Layer LPV.5 (5.5), because it uses conjugacy and generation.
  - `LPV.4/global-fixed-and-local-fixed-interface` is merged into 5.3.
  - `LPV.4/cohomology-sheaves-of-a-lefschetz-pencil` is stated for the two cases, all vanishing cycles nonzero or all
    zero. The dichotomy is a corollary in 5.2.
  - This removes the backward stage edge LPV.5 → LPV.4 noted in the assembly handoff.
- **`LPV.2/isolated-nonordinary-quadratic-concentration`** is in Layer LPV.6 (6.6). It is proved from Gabber's
  perversity of `RΦ[−1]` for a regular total space with one isolated singular point. Illusie 2003, Corollaire 2.10 was
  not obtained, so its exact class is not claimed.
- **`LPV.7/export-index`** (a navigation aggregate) is dropped. LPV.7 is printed as Layers LPV.7a and LPV.7b, keeping the
  atlas stage ids `LPV.7:semistable-curves` and `LPV.7:invariant-cycles`.

### Corrections to plan statements

- **`node-residue-variation-sign`** uses the odd Picard–Lefschetz formula at a point (thickness `n_e`, Kummer character
  `n_e t_ℓ`). The regular-total-space formula was wrong for `n_e > 1` (assembly handoff fix 4).
- **The equivariance of `N`** is `ρ(g) N ρ(g)⁻¹ = χ_ℓ(g) N`, so geometric Frobenius (`χ_ℓ = q⁻¹`) gives `NF = qFN`.
- **The odd Picard–Lefschetz proof sketch** gives the semistable model explicitly: base change `t = s²`, then blow up the
  vertex; the exceptional divisor is the smooth quadric `Q = s²`. This was derived by the worker, consistently with
  Illusie 2021 §6.1. The interior of Illusie 2002 remains unread (the plan's G-algebraic-PL).
- **Checks rewritten:**
  - the cubic-pencil Kazhdan–Margulis check now argues through the section and Leray degeneration;
  - the trait-perversity example uses `Rj_*Λ_η[1]`;
  - several check texts were cleaned of plan shorthand (`seq`, `nc`, `wl`, …).

## Locators not verified by the worker

- Jouanolou, *Théorèmes de Bertini*, Théorème 6.3: the book is not available. The statement is also in SGA 7 XVIII
  6.1.6.1, which was checked.
- SGA 1 XIII Corollaire 2.12 and SGA 4 VI §5 / VII §5 are cited at section level; the scans were not opened.
- Elkik 1973 (henselian versality) is cited through SGA 7 XV 1.1.4, as the plan did.
- Huber 1996 and Schneider 2011 locators are the plan's. The plan's revision read them in the cleared library; this job
  did not reopen them.

## Where to resume

Nothing remains for this job. The next step is REV-PKG-LefschetzPencilsAndVanishingCycles. A reviewer should look
first at:
- the conditional forms of 7b and their match with DeligneWeightsAndPurity's E44;
- the new targets 0.1, 0.10, 6.2 (definition), 6.5 and 5.1;
- the moved middle-degree reduction (5.5).
