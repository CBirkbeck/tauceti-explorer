# PKG-ReductiveGroupsPartII — handoff

Worker: Claude Code, session `cc-2d4b19`, 9 October 2026, short pipeline (package written in one
sitting from the plan as it stood; no issue, no GitHub interaction; the orchestrator pushes).

## Status

The package is complete and ready for its independent review. Deliverables:

- `research/blueprint/packages/ReductiveGroupsPartII/README.md` — 197,273 bytes (UTF-8); seven layers
  RG2.0, RG2.0a, RG2.1, RG2.2, RG2.3, RG2.4, RG2.5 with 172 targets (84 from the accepted packet
  checkpoint, 88 written at target level for the layers the packet had not planned, see below);
  every definition or construction carries its API and at least three unit tests (three are
  printed, always including a non-example; the rest are examples in Suggested.lean), every theorem its hypotheses, every target up to
  three sources (theorem, section, page) and its prerequisites.
- `research/blueprint/packages/ReductiveGroupsPartII/Suggested.lean` — 250,724 bytes, 4,876 lines,
  one header note, 46 imports (11 Tau Ceti modules, all compiled in the shared build), 331 theorems,
  232 defs, 41 instances, 11 structures, 3 abbrevs and 131 examples (unit tests), followed by a
  comment catalogue of the roadmap's API and test names that have no Lean form yet.
- `research/blueprint/packages/ReductiveGroupsPartII/metadata.toml` — `topic = "math.RT"`.

No packet, reader document, suggested file, link map or other file was changed.

## How the README was made

The accepted plan covers RG2.0 (16 targets), RG2.0a (15), RG2.1 (29) and the second half of RG2.3
(24, from associated parahorics to the nonsplit-torus example). Those 84 targets were rendered from
the packet (statement with hypotheses absorbed, API, unit tests, sources, prerequisites) and then
condensed by hand to between half and two thirds of the packet's text, keeping every hypothesis,
conclusion, formula, convention and trap; nothing was added. The 26 stage-level prerequisites of the
second-half RG2.3 targets (`ReductiveGroupsPartII:RG2.2`, `:RG2.3`) were replaced by the intended
targets named in those nodes' proof steps.

The layers the packet had not planned were written at target level from the atlas stage
descriptions and the sources the earlier handoff names, following its per-target list exactly
(ids, kinds, titles, order, sources): RG2.2 (25 targets), the first half of RG2.3 (26), RG2.4 (25)
and RG2.5 (12). RG2.2, RG2.3 (first half) and RG2.5 were drafted from the earlier worker's
unfinished build scripts (left in its scratch, never integrated into the packet), checked for
completeness (statement, sources, ≥ 4 API and ≥ 3 tests per definition, no higher-tier
prerequisites) and condensed like the planned layers. RG2.4 was written fresh against He 2018/2021,
Haines–Rapoport, Richarz, Casselman, Bruhat–Tits I, Zhu, Kisin, Gleason–Lim–Xu, van Hoften and
Kisin–Zhou, with every `mathlib:`/`tauceti:` prerequisite grepped at the pins. Locators that could
not be confirmed in the public scans (He 2018 "Lemma 16/17, Thm 22" is Lemma 4.6/4.7 and Prop. 4.3
in the arXiv numbering; the unimodularity remark "N22"; the undisplayed formula "(2.1)" of He 2021
§2.2; Bruhat–Tits I 5.2.12 is a *Remarque*; the GHN erratum) are cited by section or "as used".

The two public sources the task names that are not downloadable (Tits' Corvallis article; Kaletha–
Prasad, *Bruhat–Tits theory: a new approach*) are not cited; the statements they would support are
cited from Bruhat–Tits I/II, Bruhat–Tits 1984, Prasad 2020, Garrett and the papers that quote them.

Form: upstream style (introduction, layer table, Suggested.lean note, scope and prerequisites with
the boundaries against the neighbouring roadmaps, conventions, layers with numbered subsections,
sources). Prerequisites of other roadmaps are Tau Ceti roadmap layers only (ReductiveGroups 0, 2,
3, 4, 5, 6, 7, 9; LocalFieldsRamification 0, 2, 3; ModularCurves 0F; RepresentationTheory/RootSystems
3, 4; ProfiniteProPGroups 3; ClassFieldTheory 9), as the tier-1 rule requires.

## Interface with AdelicAlgebraicGroups (tier 2)

Its package reads the local groups `G(F_v)` through RG2.0 and the Weil restriction through RG2.0a.
The RG2.0 layer introduction and the Lean file now carry the names its package uses: the evaluation
topology on `WithConv (H →ₐ[E] R)` (`PointTopology.instTopologicalSpaceWithConv`, the coarsest
topology making every coordinate evaluation continuous), the instances `T2Space`,
`LocallyCompactSpace` and `SecondCountableTopology` on the local points of a finite-type Hopf
algebra (`PointTopology.instT2SpaceLocal`, `instLocallyCompactSpaceLocal`,
`instSecondCountableTopologyLocal`, added to the RG2.0 section), `PointTopology.isTopologicalGroup`,
the compact open integral points and `CongruenceSubgroup.subgroup`; for RG2.0a the functor
`WeilRestriction.functor`, the representing algebra `WeilRestriction.Res`, the point adjunction
`WeilRestriction.homEquiv`, the Hopf structure `WeilRestriction.instHopfAlgebraRes` with
`WeilRestriction.pointsMulEquiv`, and the Deligne torus.

## Moved-down notions and upstream-order adjustments

- The atlas stage edge `AlgebraicModuliForArithmeticGeometry:R09.1 → RG2.0a` (projective parameter
  spaces) is not used: the affine representing algebra of the Weil restriction is constructed in
  RG2.0a itself (`weil-restriction-representing-algebra`), descent of points uses Tau Ceti's
  faithfully flat descent, and no projective or non-affine Weil restriction is asserted. The README
  says so in its boundaries. The roadmap therefore cites only Mathlib, Tau Ceti and Tau Ceti
  roadmaps.
- The arithmetic invariants `π₁(G)`, z-extensions with their existence, and the Kottwitz
  homomorphisms `κ_T`, `κ_G` live in RG2.1.5 (moved down from the Kottwitz/Newton layer of a
  higher roadmap by the accepted plan); Lang's theorem has its single owner in RG2.3.7.
- The atlas consumers named by stage id in the drafted RG2.2/RG2.3/RG2.5 nodes' `uses` fields are
  not rendered; the README names no higher-tier roadmap except AdelicAlgebraicGroups as the reader
  of RG2.0/RG2.0a (in prose, never as a prerequisite).

## Duplication against Tau Ceti (current roadmaps and library)

Every target was checked against the current upstream roadmaps (read-only checkout, the four
candidates named for this roadmap: OrthogonalSpinGroups, LocalGaloisGroups, ProfiniteArithmetic and
Tau Ceti's ReductiveGroups, plus `Completed/*`) and against the current Tau Ceti library at
`a91d3aaf`, by grepping the mathematical objects (Weil restriction / restriction of scalars,
Deligne torus, point and evaluation topologies on `AlgHom`, congruence subgroups, maximal
unramified extension and its completion, valued root data, apartments, affine Weyl groups,
Bruhat–Tits buildings, parahoric and Iwahori subgroups, Moy–Prasad filtrations, Kottwitz maps,
π₁ and z-extensions, Néron models, hyperspecial points, lattice chains, Ihara's amalgam, Cartan
and Iwasawa decompositions, unimodularity, Smith normal form, Tits systems, Langlands dual
groups and L-groups, quasi-splitness and Steinberg's theorem), never by name alone.

Result: **no target is removed**. Nothing in the three new roadmaps overlaps (OrthogonalSpinGroups
mentions Weil restriction only in its Artin-map table; LocalGaloisGroups' `IwasawaGroup` is the
tame-quotient presentation, not the Iwasawa decomposition; ProfiniteArithmetic's "congruence
topology" is the topology on `Out(G)` of a profinite group, not the congruence subgroups of an
integral model), and Tau Ceti's ReductiveGroups roadmap is unchanged from the atlas copy. The
library hits are prerequisites, not targets, and are now cited where they bear:
`TauCeti.maximalUnramifiedExtension` and `TauCeti.maximalUnramifiedFrobenius`
(`NumberTheory/LocalField/Unramified/Maximal.lean`; the uncompleted `E^ur` with Frobenius, cited by
the `Ĕ` target, which completes it); `TauCeti.Pinning`, `TauCeti.IsBorel`, `TauCeti.Dynamic.parabolic`
and `levi`, `TauCeti.IsCentralIsogeny`, `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`,
`TauCeti.RootPairingIsogeny`, `RootPairing.Base.flipSupportEquiv` and `TauCeti.TitsSystem`
(anchor-layer objects; named in the scope section and in the Requires lines of the z-extension,
dual root datum, pinned automorphism and dual isogeny targets). The remaining library hits for the
grep words are unrelated (toric point topologies, Iwasawa theory, Néron–Tate heights, plumbing
lattice chains, profinite amalgams, modular-form congruence subgroups, GL₂ Hecke rings).

## Lean check

Command, run from the shared build (Tau Ceti f790474 + Mathlib 082e2d3):

```text
lean-check research/blueprint/packages/ReductiveGroupsPartII/Suggested.lean
```

Result on the installed package file: exit 0, no errors, 587 warnings, every one
`declaration uses sorry`; no other warning kind (the file sets `autoImplicit false`). The same
command on the assembled file without the trailing name catalogue gave the same result; a run on
the assembly without RG2.4 gave exit 0 with 507 sorry warnings.

The file keeps the accepted suggested file's header and spine (carriers for every layer), its RG2.0,
RG2.0a and second-half RG2.3 sections, and adds: the RG2.1 section (the earlier draft, repaired:
Galois actions as `X ≃ₗ[ℤ] X` since `AddAut` is additive at this pin, z-extensions with real data
instead of a vacuous clause, the Borel predicate passed as a Hopf ideal, `H0` as a group on a
subtype, local finiteness of walls stated on segments, 115 declarations), RG2.2 (22 of 25 targets
active), the first half of RG2.3 (17 of 26), RG2.4 (the Iwahori–Weyl carriers, length, Bruhat
order, decompositions, admissible sets; 13 of 25 targets at least partly active) and RG2.5 (10 of
12). Each layer ends with a comment block naming the targets that need vocabulary the pinned
libraries lack, and the file ends with the 47 API/test names of the document that have no Lean form
(twisted Levi subgroups, R-smooth and quasi-tame tori, the reductive quotient as a group over the
residue field, the Frobenius action on the Iwahori–Weyl group and on coinvariant cocharacters).
Proxies used and documented in docstrings: strictly henselian points by `[IsAlgClosed 𝓀[K]]`,
simple connectedness by `[Subsingleton (AlgebraicFundamentalGroup A)]`, tameness by
`¬ ringChar 𝓀[K] ∣ finrank K K'`; `TauCeti.TitsSystem`, `TauCeti.GroupTheory.Coxeter.*`,
`TauCeti.LinearAlgebra.RootSystem.*` and `TauCeti.Topology.Algebra.Group.Profinite.*` are not
compiled in the shared build and are not imported (the affine Tits system is stated by its
generation and normalization clauses only).

## What the README could not support

- The three gaps the packet records stand: Prasad–Yu Lemma 4.1 (smoothness of the closure of a
  split torus) behind `hodge-type-fixer-immersion`, the tame subdivision of Pappas–Rapoport 2024
  behind `tame-hyperspecial-realization`, and Adler's lattice comparison behind
  `mock-exponential`/`moy-prasad-lie-lattices`; the README states those targets as the plan does,
  citing the papers that use them.
- RG2.4 `iwasawa-integration-and-unimodularity` cites He 2018 and Casselman §1 by section; the
  unimodularity argument is stated in the form used there, not from a textbook proof.
- The GSp₄ self-duality is checked by direct computation on Pilloni's coordinates (the HAL copy
  refused download); the README cites §5.1.1, p. 20 and Buzzard–Gee.

## Checks

- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 file(s), 0 problem(s).
- README: no `/home/` path, no process vocabulary (packet, review, job, checkpoint, coverage,
  reviewed-extraction labels); 172 targets; 59 definitions/constructions with API and ≥ 3 tests
  each; all 172 placed in the layout; every prerequisite resolved to a target, a Mathlib or Tau Ceti
  declaration or a Tau Ceti roadmap layer.
