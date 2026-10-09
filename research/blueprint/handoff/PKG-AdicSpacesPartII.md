# PKG-AdicSpacesPartII — package handoff

Session `cc-bab806`, 2026-10-09. Package written in one sitting from the accepted plan
(`research/blueprint/packets/AdicSpacesPartII.json`, 537 nodes in R0, R1, F0, R2, R3, R4, R5, F1),
its reader and its suggested file. Deliverables: `research/blueprint/packages/AdicSpacesPartII/{README.md,
Suggested.lean, metadata.toml}` (topic math.AG).

## What was done

- **README.md** (194185 bytes): generated from the packet (layers → reader sub-sections → nodes: statement,
  hypotheses, API, tests, source, prerequisites) and edited into upstream form: purpose, layer table and
  order, prerequisites and boundaries, twelve conventions, eight layers with 553 numbered targets, and a
  sources section with short keys. Targets are numbered per layer (R0.1, …); definitions and constructions
  carry their API (first names, relative to the declaration) and tests; theorems carry hypotheses; lemmas
  (309 of the plan's nodes, its proof steps) are one line with their source. The plan's text had to be
  condensed roughly tenfold to fit the 200 KB cap: statements are cut at sentence boundaries and marked
  with "…"; API lists show at most 4 names and tests at most 3, with a "(+n)" count; the full signatures
  are in `Suggested.lean`.
- **Suggested.lean** (602134 bytes): the accepted suggested file transformed into the TauCetiRoadmap form
  of the brief: `import Mathlib` plus the 23 Tau Ceti modules it uses, one module docstring,
  `namespace TauCetiRoadmap.AdicSpacesPartII` with `open TauCeti` and `open TauCeti.Huber` /
  `open TauCeti.ValuationSpectrum` inside the matching sub-namespaces, layer section comments and
  per-target `### Rk.n Title` comments, `theorem` throughout (the input had no `lemma`), tests as
  `example`s, no `#check`/`#print`/`#eval`/`#synth`, the 1,647 "not stated here" stub comments removed
  and replaced by one closing comment listing the 323 targets stated only in the README, node ids replaced
  by README numbers, process words removed. One design decision to flag: 90 declarations that extend a
  Tau Ceti type by dot notation (`Pair.uniformization`, `Pair.Hom.IsFinite`,
  `PairOfDefinition.completionTensorEquiv`, `Huber.IsPseudoUniformizer.isWeightFamily_singleton_pow`, …)
  are declared with `_root_.TauCeti.Huber.` so that `S.uniformization` and `φ.IsFinite` still elaborate;
  the module docstring says so. The one test `Omega_test_completion` needed
  `set_option synthInstance.maxHeartbeats 200000 in` under `import Mathlib`.
- **lean-check**: `lean-check research/blueprint/packages/AdicSpacesPartII/Suggested.lean` (the swarm's checker, Tau Ceti f790474 + Mathlib 082e2d3) → exit 0 in about
  one minute, 912 warnings, all `declaration uses \`sorry\``, no other warning or error. (The unmodified
  input also elaborated, exit 0, 917 sorry warnings, as a control.)

## Duplication against Tau Ceti a91d3aaf and the current upstream roadmaps

Sweep by mathematical object over `RingTheory/Huber/**`, `AlgebraicGeometry/AdicSpace/**` and the whole
tree (positive control `IsStablyUniform`), and over the current AdicSpaces README/STATUS/PROGRESS; the
nine newer upstream roadmaps and the four Completed ones are outside this area and were not hit.

- **Removed** (exists elsewhere, now cited in "Prerequisites and boundaries"): `R0/nonarchimedean-field-
  strongly-noetherian` — it is the anchor's own open target §0.5 (and the n = 1 case is Tau Ceti's
  `isNoetherianRing_restrictedMvPowerSeriesCompletion_one`). Targets were renumbered.
- **Kept as variants, with a one-clause difference in the target text** (17 targets): closed subspaces
  (anchor §5.1 + `Huber.Pair.quotient`, `isClosedEmbedding_spaComap_quotientMk`); the finite-type
  hierarchy (anchor §5.2); the five noetherian-ring-of-definition lemmas whose Tate cases are
  `isStrictMap_of_module_finite`, `IsTateRing.t2Space_moduleTopology`, `restrictedMvPowerSeriesBaseChange`,
  `isSheafyRing_of_isStronglyNoetherian`, `laurentCover_exact`; stable sheafiness (`IsStablySheafyRing`);
  discrete pairs; valuation amalgamation (`ValuationSpectrum.ofDirected`); uniformity (`Huber.IsUniform`,
  `IsUniform.isReduced`); the Laurent difference map (`laurentCoverDiff_surjective`); the rational-covering
  reduction and Čech acyclicity (degree-0 `isSheafFor_laurentSieve`, `quasiIso_cechAugmentation_iff`); the
  analytic affine space (`closedPolydisc`); open ideals and weight families.
- **Plan citation corrected**: the plan cites `Huber.IsSheafyPair`, which does not exist; Tau Ceti's
  pair-level notion is `Huber.IsSheafyForEveryPresentation`. The README's conventions say so.
- The category of adic spaces (`TauCeti.AdicSpace`), pre-adic spaces, open immersions and the analytic
  locus are now in Tau Ceti; the README cites them in the boundaries. Absence of Spf, formal schemes,
  dagger/overconvergent algebras, sousperfectoid rings, analytification, Kiehl, GAGA, étale sites of adic
  spaces and projective-module traces was confirmed by grep.

## Moved-down notions (stated here as targets)

Upward citations of the plan, per the order file, replaced by targets under "Notions this roadmap
states for its own use": AlgebraicModuliForArithmeticGeometry R09.1 → F0.64 (projective bundles,
ample sheaves, Serre finiteness and vanishing) and R09.2 → F0.65 (Chow's lemma, dévissage);
ModularCurvesPartII R13.2 → R2.88 (Deligne–Rapoport moduli of generalised elliptic curves and the formal
group along the identity); TropicalAndBerkovichArithmetic TB.0 → R3.73 (Gel'fand spectrum, Berkovich's
formula); ClassicalAdicEtaleCohomology H0 → R5.43 (affinoid criterion for tilde-limits, Scholze–Weinstein
2.4.1–2.4.2); AdicCoefficientsAndComparisons L5 → F1.77 (de Jong's strictly semistable alteration,
Theorem 6.5). The sources section gained Berkovich 1990, EGA II, Deligne–Rapoport, de Jong 1996 and
Scholze–Weinstein 2013 for these. The atlas stage link F0 ← DeformationAndDerivedPatchingAlgebra R03.1
is cited by no node and was dropped. SchemeAndStackFoundations SF.2 (tier 2) and the Tau Ceti roadmaps
StableReduction, JacobianChallenge and ModularCurves remain cited.

## What the README could not support

- The 200 KB cap forced heavy condensation (see above): lemma statements are not in the README, and
  statement, API and test lists are truncated with explicit markers. Reviewers should read a target's
  full statement in `Suggested.lean` or the packet.
- 323 of the targets have no Lean statement (their carriers — adic spaces as a category with structure
  sheaf, formal schemes, rigid and dagger spaces, étale sites, coherent sheaves — are not in the pinned
  libraries); they are listed by number in the file's closing comment. 213 targets have at least a core.
- The six moved-down targets are stated from the plan's request texts and standard references, not from
  a fresh reading of those sources.
