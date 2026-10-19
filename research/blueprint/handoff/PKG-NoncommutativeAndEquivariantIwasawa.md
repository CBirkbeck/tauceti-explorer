# PKG-NoncommutativeAndEquivariantIwasawa — roadmap package (complete)

Issue #11082. Worker: Claude (Opus 5.5), session `claude-UIFV2H`, 19 October 2026. Branch `claude-UIFV2H-pkg-noncommutative-iwasawa`. The bot confirmed the claim. This run took no other job. This is a complete package, not a checkpoint; it claims no implementation.

## Deliverables

- `research/blueprint/packages/NoncommutativeAndEquivariantIwasawa/README.md`, about 431 KB, in TauCetiRoadmap form:
  - an opening **Summary**, Scope and ownership (with Prerequisites and boundaries, and a list of the statements that are conjectures), Conventions (with the sign witnesses), Exact supplier contracts (Mathlib, Tau Ceti, seven TauCetiRoadmap roadmaps, IntegralHeckeAndGaloisDeterminants and eleven atlas roadmaps), and How to read the build;
  - Layers NE.0–NE.7 with 136 numbered subsections §NE.k.n, exactly the 136 targets of the accepted plan (17, 14, 15, 14, 8, 8, 36, 24 per layer), in the plan's order. Each has its statement, sources with locators, hypotheses, proof or construction route, API (for the 50 definitions and constructions), a **Checks.** list and a *Needs:* line. Every layer has an introduction, Examples and Dependencies;
  - Main theorems compared, Corrections to the sources (E1–E40, paraphrased), nine Worked examples, Downstream consumers and References.
- `research/blueprint/packages/NoncommutativeAndEquivariantIwasawa/Suggested.lean`, 210 lines: `import Mathlib` and `TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic`, namespace `TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa`, one module docstring, layer section comments.
  - Light definitions with real bodies: `closedPowerSubgroup`, `IsPowerful`, `IsUniform` (NE.0.1), `canonicalSet`, `saturatedSet` (NE.1.1, NE.1.10), `carryExponent` (NE.6.7), `gammaStar` (NE.7.15).
  - Theorems: `of_sub_one_pow_char` and `one_mem_canonicalSet` (proved); `mul_mem_canonicalSet`, `mem_canonicalSet_powerSeries_iff` (S in the one-variable case, on `PowerSeries ℤ_[p]`), `carryExponent_cocycle`, `gammaStar_eq_Gamma`, `gammaStar_eq_residue` (sorry).
  - Nine proved examples, at most two per kept definition, none about library objects alone.
  - Everything about Λ(G), localizations, K-theory and arithmetic complexes is a README target; the closing comment lists them.
- `research/blueprint/packages/NoncommutativeAndEquivariantIwasawa/metadata.toml`: `topic = "math.NT"`.

## Checks run

- `lean-check` on `Suggested.lean` at Mathlib 082e2d37e8 and the pinned Tau Ceti build: **exit 0**, five warnings, all `declaration uses 'sorry'`, no other warning or error. About 76 GB of memory was available.
- `python3 scripts/check_sorry_data.py` on the Lean file: passes.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- README parity script: 136 `### NE.k.n` subsections; every definition and construction has at least three Checks (most have four to six), every subsection has at least one; every `](#…)` link resolves to an anchor.
- Process-language scan of the README (packet, node, review, request, obligation, gap, atlas, planet, PR numbers, local paths): none left.

## How the README was produced

A script in scratch rendered each accepted node into a prose subsection. Ordered replacement batches then rewrote every passage that carried process language or needed a mathematical correction. The batches touched about 180 passages, all hand-written. The generated text keeps every statement, hypothesis, proof step, API item, test, acceptance check and source locator of the accepted packet. Exact duplicates between a node's tests and its acceptance list were merged.

Presentation decisions, with no change to the mathematics:

- Repeated hypotheses in Layer NE.6 are stated once in the layer introduction as standing hypotheses (A) and (B).
- The plan's 19 open obligations are folded into the targets they qualify, stated as mathematics with the source to follow. Its 28 supplier requests became the Exact supplier contracts section, grouped by supplier.
- **Obligation 19**, the Ritter–Weiss uniform-smoothing step, is now an explicit **Uniform smoothing lemma** inside §NE.6.25. It gives the exact quantifier (∃g ∀ε), the subgroup structure of admissible g, and why the per-conductor elements of Proposition 5 do not give it. It is part of the target, and §§NE.6.25, NE.6.28 and NE.6.30 consume it.
- §NE.7.15 now names ArithmeticGaloisRepresentations §2.7 (`epsilon`) as the owner of Deligne's local constant of the Weil–Deligne representation, under the maintainer rule of 2026-10-19 on local constants. This adds a citation only; the target is unchanged.
- In `Suggested.lean` the earlier numerical examples (2^10 mod 15, Möbius sums, determinant scalars) were removed under the 2026-10-19 example rule. `det_scalar_twist` was removed because it restates Mathlib's `Matrix.det_smul`. The sorry'd examples became proved examples or named theorems.

## Duplication screen

- **Upstream main.** The local `~/tauceti-roadmap-env` checkout is a stale feature branch, so TauCetiRoadmap main was read at `79ff03ab775937a744719a0ebe494621f1f16d95` through `gh api`, read-only. I read the README and Suggested.lean of ClassicalArithmeticCompletion, PadicMeasuresIwasawaAlgebras, ProfiniteProPGroups, ProfiniteArithmetic, ProfiniteCohomology, InductionRestriction, SemisimpleAlgebras, PadicFunctionalAnalysis, CharacterTheory, NumberFieldArithmetic, GlobalNumberFields, HeightsAndUnits, LocalGaloisGroups and ClassFieldTheory.
- **Code search.** A search of upstream main for OreLocalization, Ore sets, Iwasawa algebras, characteristic elements, Akashi series, Fitting invariants, Bockstein, uniform/powerful groups, SK₁, Whitehead groups, reduced norms and Kakde found:
  - no competing target. ProfiniteCohomology's Bockstein is the coefficient-sequence connecting map, a different object.
  - PadicFunctionalAnalysis cites ProfiniteProPGroups Layer 9 for the completed group algebra, as this roadmap does.
- **CompletedCohomologyPartII #1035.** Read at its current head `1337958`, which postdates the plan's `e816649`. §§0.1, 3.11, 5.1, 5.5 and 5.8 still carry the imported declarations (`analytic_exists_open_uniform`, `iwasawa_isLocal_iff_pro_p`, `iwasawa_noetherian_left/right`, `iwasawa_auslanderRegular` and the grade lemmas, uniform filtration growth). The package cites them in Prerequisites and boundaries and states only the extensions (Ω(G), semilocality, groups without p-torsion).
- **Tau Ceti library at `a91d3aaf`.** No K₁, Whitehead, reduced-norm, Ore-set, uniform-group or Akashi declarations were found. The completed group algebra, `pLowerCentralSeries`, `IsProP.padicPow` and `IsCompactModule.completedGroupAlgebraModule` are on main, not at the pin; they are cited as main-only.
- **Removals.** None beyond what the accepted plan had already turned into imports.
- No lake command was run in either read-only checkout.

## For the reviewer: locators and additions to check

- **Carried from the plan.** All locators come from the accepted plan, which REV~2 checked in full. I opened no new source.
- **Citations added from my own knowledge, not re-read in a source:**
  - Brumer, *Pseudocompact algebras, profinite groups and class formations*, J. Algebra 4 (1966), cited through CFKSV p. 174;
  - Fukaya–Kato, *A formulation of conjectures on p-adic zeta functions in noncommutative Iwasawa theory*, as the bibliographic home of the Proposition 1.3.7, 1.5.1, 1.5.3, 3.3.5 numbers that BV and Kakde quote;
  - Dixon–du Sautoy–Mann–Segal, Chapter 4, for the uniform-group criterion, deliberately without a theorem number;
  - the reference list, written by hand from the packet's source records.
- **Checks I added. All were computed by hand; please re-verify:**
  - NE.0.1 (Γ₁(GL_d(ℤ_p)) uniform of dimension d²);
  - NE.0.4 (ℤ_p[ℤ/ℓ] not local; Λ(ℤ_p) local);
  - NE.0.5 (gr ℤ_p[[T]] = 𝔽_p[P, T]);
  - NE.0.6 (ℚ_p non-example; Λ/(T − p));
  - NE.0.11 (∏ℤ/p non-example);
  - NE.0.13 (ℤ_p × ℤ/ℓ has global dimension 2);
  - NE.1.5, NE.1.6, NE.1.9, NE.1.12;
  - NE.2.1, NE.2.2, NE.2.6, NE.2.9;
  - NE.3.6 (Λ/(T − p): χ = p);
  - NE.4.3 (isogenous curves share F_∞);
  - NE.6.2, NE.6.5, NE.6.15, NE.6.20, NE.6.22, NE.6.23, NE.6.26, NE.6.30;
  - NE.7.5, NE.7.8.
- **Lean statements to spot-check:**
  - `mem_canonicalSet_powerSeries_iff`: f ∈ S ⇔ C(p) ∤ f in ℤ_p[[T]], by Weierstrass preparation; f = 0 lies on neither side;
  - `carryExponent_cocycle`;
  - `gammaStar_eq_residue`: (s + n)Γ(s) → (−1)^n/n! as s → −n.

## What remains (unchanged from the accepted plan)

- **Supplier contracts not yet stated by their owners:**
  - the GeneralAlgebraicKTheory determinant Picard functor (K.4), the Ore localization sequence (K.5) and complete-ideal K₀ invariance (K.3);
  - the SelmerIwasawaCohomology compact bar homology (L0), elliptic Selmer control over p-adic Lie towers and Nekovář heights (L2), and the Γ-Euler characteristic formula (L3);
  - the vanishing H²(Gal(F_Σ/F_∞), ℚ_p/ℤ_p) = 0 at ArithmeticGaloisDuality R02.4;
  - the totally real Deligne–Ribet toolkit, Greenberg's p-adic Artin L-functions and Colmez's formula at AutomorphicPadicLFunctions L3;
  - Wiles, abelian pseudomeasure functoriality and the normalized abelian determinant at IntegralIwasawaTheory I.5, I.6 and I.9;
  - truncated Artin inductivity at negative integers (AnalyticNumberTheory AN.4);
  - the SK₁ and Oliver inputs (KTheoryLowDegrees U.3);
  - the ring-coefficient twisted algebra at InductionRestriction Layer 7;
  - the finite-free coefficient base change and subgroup squares at PadicMeasuresIwasawaAlgebras Layer 1.
- **Mathematical leaves.** The uniform smoothing lemma (§NE.6.25), the Björk filtered transfer (§NE.0.5), the constant-index criterion (§NE.0.1), and the primary proofs behind quoted arithmetic data (§§NE.3.9, NE.4.3, NE.5.4).

## For the maintainer

- **Consumer retargets still pending from the plan:**
  - CompletedCohomologyPartII.json should drop its five NE.0 prerequisites;
  - LocallyAnalyticDistributionsPartII.json ND.0 and ND.2 still cite the removed `NE.0/lower-p-series`.
- **New finding.** `StableReductionPartII--MC.5.json` cites `NoncommutativeAndEquivariantIwasawa:NE.2/determinant-functor`, a node that does not exist. The determinant functor is GeneralAlgebraicKTheory K.4's; NE.2's nearest targets are §NE.2.7 (localized K₁) and §NE.2.8 (relative classes).
- **Tier.** The roadmap is outside the Caraiani–Newton 94. Its package cites atlas roadmaps that are not upstream: GeneralAlgebraicKTheory, SelmerIwasawaCohomology, ArithmeticGaloisDuality, AutomorphicPadicLFunctions, IntegralIwasawaTheory, AnalyticNumberTheory, KTheoryLowDegrees, LocallyAnalyticDistributionsPartII, Polylogarithms, PadicHodgeTheory and ArithmeticGaloisRepresentations. These must go upstream first, or travel in its bundle.
- **Untrusted text.** I read no issue comments by others and no other pull requests' files beyond the CompletedCohomologyPartII README. I saw nothing suspicious.

## Notions moved

None.
