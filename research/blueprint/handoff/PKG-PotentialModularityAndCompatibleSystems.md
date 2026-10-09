# PKG-PotentialModularityAndCompatibleSystems — handoff

Issue #7495. Worker: Claude (Claude Code), session `claude-qy6mYy`, 9 October 2026.
The bot confirmed the claim on comment 6075991200. This run completes the package begun by
the checkpoint of `codex-GIi2gr` (PR #7752): all three package files are present.

## Result

- `README.md` (188 KB) keeps the checkpoint's reader, with four changes:
  - The KW II Theorem 6.1 witnesses now say what the accepted plan states: witness (i) is
    unramified at every place above `p`, and witness (ii) has conductor dividing `v` at `v | p`.
    The reader had claimed more: (i) unramified at every finite place, (ii) unramified away
    from `p`.
  - Every one of the 92 target sections has a `**Lean name:**` line naming the declaration that
    states it.
  - The paragraph describing `Suggested.lean` now describes the file as it is.
  - The conventions list names the further Mathlib interfaces the file uses.
- `Suggested.lean` (262 KB) states every target, API item and test of the plan under the plan's
  names. A text audit against both packets found 92/92 targets, 121/121 API items and
  83/83 tests as declarations or labelled `example`s. Before this run about 75 targets and
  44 API items existed only as comments, and about 45 tests checked unrelated numerical facts.
  Those comment catalogues are gone.
- `metadata.toml`: `topic = "math.NT"`.

No packet, plan reader, plan suggested file or other job's file was changed.

## Lean check

The default build of `lean-check` is now `~/tauceti-worker-cc-e94dc5/leanenv/TauCeti`. Its
Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`. All 20 modules of the import closure of
`TauCeti.AlgebraicGeometry.LineBundle.Class` there are compiled, and their sources are
byte-identical to Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

- `lean-check research/blueprint/packages/PotentialModularityAndCompatibleSystems/Suggested.lean`
  in that build: **exit 0, 0 errors, 364 warnings, all `declaration uses sorry`**, no other
  diagnostics (final file, SHA-256 `c0734b32…a5185`). Memory was checked; nothing is left running.
- Independent cross-check: the same file with the 20 pinned Tau Ceti modules inlined (read from
  the f790474 baseline checkout), elaborated by `lean-check` in a scratch file, gave exit 0,
  0 errors and 362 `sorry` warnings with no other diagnostics in the package part. That run was
  on the version just before the last docstring edits.
- `set_option autoImplicit false` is set in the file, so a misspelt name in a statement fails
  rather than becoming a variable.

## How the Lean file is built

- **Native objects.** Mathlib and Tau Ceti objects are used directly. Examples:
  - places and completions (`InfinitePlace.Completion`, `adicCompletion`, `IsModuleTopology`);
  - `Field.absoluteGaloisGroup.map` for restriction, `cyclotomicCharacter`, `PadicAlgCl`;
  - `IntermediateField.LinearDisjoint`, `algebraicClosure`;
  - scheme morphism properties, `AffineSpace`, `topologicalKrullDim`;
  - `NumberField.Set.HasDirichletDensity`, Tau Ceti `InvertibleSheaf`/`LineBundleClass`.
- **Supplier objects.** Objects owned by other roadmaps are opaque *data*, each with its owner
  in the docstring:
  - Frobenius lifts, inertia and decomposition groups, complex conjugations (R01.1);
  - cuspidal `GL₂` representations with weights, conductors, Hecke polynomials and
    `ρ_{π,ι}` (R17/R19);
  - Hilbert–Blumenthal abelian varieties and their torsion and Tate modules (A6/H6);
  - KW deformation rings and their lifts (R04.6/R08.6);
  - Weil–Deligne parameters and Hodge–Tate/de Rham/crystalline ranks (R06.2/R06.3);
  - quaternionic Hecke algebras (R17.3);
  - the analytic topology on local points, curve compactifications, étale fundamental groups and
    the Isom torsor (SF.x/R09.3);
  - the idèle class group and algebraic Hecke characters (GlobalNumberFields).
- **Predicates.** Every predicate is defined from such data, for example `ArisesFrom`,
  `IsModularLift`, `IsLiftOfType`, `IsStrict`/`IsAlmostStrict` and `omegaDivisors`. There is no
  `def _ : Prop := sorry` and no unconstrained `Prop` field. The only `sorry` instances of `Prop`
  classes are the true facts `Fact lam.residueChar.Prime` and `IsLocalRing` of the deformation
  ring.
- **Carriers.** The family carriers now carry their compatibility conditions:
  - `WeaklyCompatibleSystem`: geometric Frobenius, unramifiedness, de Rham and crystalline
    members, labelled Hodge–Tate data;
  - the KW rank-two `CompatibleSystem`, with its Weil–Deligne data and the strict and
    almost-strict predicates;
  - `SkolemDatum`: separated, finite type, surjective, irreducible, open in the analytic
    topology, Galois-stable.
  - `AuxiliaryField` now holds its actual cuspidal witnesses and the unramifiedness of the
    universal representation mod `p`.
- **Omissions.** Hypotheses or conclusions that still cannot be stated are named in the
  docstring of their declaration ("Omitted hypothesis/conclusion: … (owner …)"), in 19
  declarations:
  - `SkolemDatum`, `reductionToCurves`, `taylorTheoremG`: geometric irreducibility,
    smoothness of points, quasi-projectivity;
  - `densityOfAlgebraicLocalPoints`: Corollaire 1.6.2;
  - `chtCharacterExtension`: global continuity;
  - `surjectiveSpecialisation`: Galois-equivariance;
  - `functionFieldIsomTorsor`: nonconstancy;
  - `potentialGlobalGaloisLocalData`: avoidance;
  - `taylorLemma11`, `taylorLemma15`: finite or tame ramification;
  - `taylorOrdinaryPotentialResidual`: the "moreover" local shape;
  - `weightReductionHeckeSurjection`: the 𝐕-operator criterion;
  - `snowdenPotentialResidual`: type compatibility;
  - `bcgpLocalData`: local completions;
  - `ordinaryGlobalFiniteness`: adequacy and the CM comparisons;
  - `monodromy_component_field`: multiplicity one;
  - `modern_prescribed_type_lifts`: (A2);
  - `brauerSystem`: the size of `E`;
  - `kw_theorem_5_1_systems`: the type identification and Savitt weights.

  The README keeps the full statements.

## For the package review

- The plan's recorded gaps and source issues are unchanged. Examples: Taylor Corollary 1.7, the
  MB90 input, the CDT and Skinner–Wiles inputs, the BCGP 9.1.12 correction, KW II source issue
  E2 and Taylor E9/E10/E11. The README keeps them; the Lean docstrings cite them where relevant.
- Worth checking:
  - the encoding of prescribed local completions through `K_v ⊗_K E ≅ ∏ E_v`;
  - the use of embeddings `K' → K_v` or `K_v^{nr}` for "split" and "unramified" in
    `moretBaillyThreeLocalConditions`;
  - `DetectsSubextensions` as the Frobenius-generation condition;
  - the KW witnesses `HasKWWitnesses`, now matched to the plan's Theorem 6.1 statement.
- Lean names are lowerCamelCase in `TauCeti.PotentialModularity` for the R23 targets, which have
  no `suggestedName` in the plan, and the plan's snake_case `suggestedName`s for R24.

## Checks run

- `python3 scripts/check_blueprint.py` on both packets: 0 errors, 0 warnings (unchanged inputs).
- `python3 research/blueprint/intake.py check-files` on the three package files: 3 files,
  0 problems.
- `git diff --check`: clean.
- The coverage audit and the anchor-to-section audit of the README: all 92 sections carry the
  API and tests of their own target.

No Lean language server, `lake build`, `lake update` or cache download was used. Scratch files
were kept outside the repository and are deleted.
