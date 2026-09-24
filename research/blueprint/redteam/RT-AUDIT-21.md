# RT-AUDIT-21 — independent red team

Agent: Codex. Session: codex-c83e7a. Read: 24 September 2026.
Target: accepted AUDIT-21, after REV-AUDIT-21. Status: complete.

One **medium** finding corrects the repeated claim that smooth representations are not defined in the pinned libraries. Tau Ceti supplies the ordinary smooth discrete category and its coefficient dictionary. The geometric and enhanced derived comparisons remain unbuilt.

## Coverage

| Roadmap | Audited layers | Targets |
| --- | ---: | ---: |
| GeometricSatakeAndFusion | 14 | 49 |
| HeckeStacksAndLocalShtukas | 5 | 22 |
| LanglandsParameterStacks | 8 | 35 |
| VStackSheavesAndLisseCategories | 6 | 29 |
| tauceti:TauCetiRoadmap/CFSGStatement | 9 | 46 |
| Total | 42 | 181 |

The accepted audit, its review, five full documents and stage extracts were read. The layer census is three built, six partly built and 33 not built. The target census is 111 absent, 41 partial, one Mathlib and 28 Tau Ceti. This worker did neither AUDIT-21 nor REV-AUDIT-21. The target is the accepted audit, not a new area-wide blueprint.

All 199 cited occurrences resolve to 177 distinct declarations. Statements were read with section hypotheses and complete structure fields; the internal assignments in faithfully-flat descent, Tannaka and diagram-permutation signatures were retained. The CFSG inductive constructors and carrier definitions were also opened. All 101 cited source files match the pinned Git blobs. Additional evidence brings this set to 129 files; separately, all 52 CFSG-directory files pass hash verification and a comment-aware sorry/admit scan. This is source inspection, not recompilation or an independent verification of every imported proof.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Finding RT-AUDIT-21/1 — existing smooth discrete representations

**Severity: medium.** In `AUDIT-21.result.json`, HS3 target 2 says that smooth representations of p-adic groups do not exist in either library. VS4 target 0 repeats that claim for locally pro-p groups; the VS summary repeats it again. The search vocabulary `smoothRepresentation/SmoothRep` missed a differently named construction.

At the Tau Ceti pin, [`IsSmoothDiscrete`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L245-L258) requires a discrete underlying module and an open stabilizer for each vector. [`SmoothDiscreteTopRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L529-L560) is the full subcategory on that predicate. `DiscreteRep` bundles a discrete module with a continuous group action, with equivariant linear maps as morphisms. Finally, [`discreteRepEquivSmoothTopRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L646-L687) proves the equivalence of these two categories.

The latter takes an arbitrary topological group, with no compactness, profiniteness or finite-group hypothesis. In the discrete torsion-coefficient setting of VS4, the scalar-continuity field introduces no additional restriction on discrete modules. The predicates and equivalence therefore apply to locally pro-p groups. Their actual statements were read; this is not an inference from the filename. The file's pinned Git blob is `456ca497a722465b26ceca5a35cbea2009bf9e09`.

The correction has a strict boundary. The file does not supply an abelian or enhanced derived category, compact induction, admissibility, or the equivalence with `D_et([*/H], Lambda)`. Its own roadmap paragraph records the missing limit/subobject/quotient API. Keep HS3 target 2 absent, VS4 target 0 partial, and both layer verdicts not built. Correct both notes and the VS summary, and add the predicate/category/equivalence as related declarations. The JSON finding gives the exact locations and proposed edit.

## Remaining checks

### Geometric Satake and Hecke/shtuka layers

GS0's module Grassmannian, Witt vectors and ring perfection do not construct an affine Grassmannian or a geometric perfection. Fontaine's `BDeRhamPlus` completes a localization along the theta kernel; its explicit TODOs leave the DVR and principal-kernel properties open. Faithfully-flat descent for affine group-valued points does not prove v-descent for bundles on a completed divisor. Searches found no Schubert or Demazure geometry, ample/nef/semiample line-bundle API, or Bhatt–Scholze projectivity package. Demazure references concern algebraic-group sources, not such declarations.

GS1–GS3 correctly separate abstract t-structures, monoidal coherence, flatness and exact pairings from geometric perversity, ULA, convolution and fusion. No alternate-name search supplied these endpoints. Compact-support functions and analytic convolution are unrelated to exceptional sheaf pushforward. Verdier-localizing predicates concern triangulated quotients, not Verdier duality of constructible complexes.

GS4's Tannaka result starts from a known commutative Hopf algebra over a field. It is not reconstruction from an arbitrary integral rigid tensor category. `RootPairing.flip` and the named simply connected root datum provide combinatorial dual data, not the integral pinned dual group scheme or Weil action. The Lie-algebra Chevalley involution is not a group involution. The abstract Hecke ring and the GL_2 polynomial-ring equivalence are correctly credited; neither is the general hyperspecial Satake transform or trace comparison.

HS0–HS4's modification stacks, local shtuka fibres, reflex descent, Weil actions, Hecke kernels and enhanced limit/duality statements remain absent. `WittVector.Isocrystal` supplies a Frobenius-linear vector-space carrier, not the general Kottwitz set or sigma-centralizer. The new smooth-category evidence corrects the foundation claim but does not construct the Hecke-fibre comparison or compact-induction generators.

### Parameter stacks

LP0's valuation inertia and absolute Galois group are genuine inputs. Tau Ceti also has lower ramification groups for a `Place`; their definition uses a normalized discrete valuation trivial on a constant field. This does not produce the local Weil group with its different topology, absolute wild inertia or dense tame discretization. The audit already mentions the place-based development. No new Weil-group result was found.

The alternate-name search did find [`PresheafOfGroups.OneCocycle`, `OneCohomologyRelation` and `H1`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/NonabelianCohomology/H1.lean#L123-L205), with noncommutative coefficients. This is a genuine nonabelian Cech construction for a presheaf on a chosen family, not continuous crossed cocycles on a Weil group. It does not contradict the scoped absence of the parameter construction. Mathlib's multiplicative group-cohomology cocycles still require `CommGroup`. The formal `PowerSeries.binomialSeries` has an addition law; the analytic radius results impose `RCLike`. Neither provides LP0's topologically-unipotent extension theorem.

LP1 correctly credits regular sequences and the naive cotangent complex without calling them a cocycle scheme, a derived stack or a complete-intersection theorem for it. LP2's spectrum-homeomorphism criterion and free groups do not construct excursion invariants or recover parameters. Search hits for excursions are in combinatorics/probability. The complete-reducibility result is for finite-dimensional Lie modules in characteristic zero, not Serre complete reducibility in the needed reductive group. LP3's Lie highest weights and rational Schur/Weyl modules do not supply integral Weyl/dual-Weyl modules, good filtrations or Donkin's theorem. LP4's generic shift/cone/retract machinery does not supply perfect complexes on a parameter stack.

### Artin v-stacks and coefficients

VS0–VS1 retain the distinction between a pseudofunctor stack condition and an Artin v-stack, and between algebraic formal smoothness and the Fargues–Scholze Jacobian criterion for section functors. The condensed foundation in VS2 is present, including the pointwise right Kan extension and solidification map. [`Solid.lean`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Solid.lean) explicitly retains both the general-coefficient correction and the unproved-solidness TODOs. Light condensed monoidal structure is not the solid derived tensor/Hom package. VS3–VS5's enhanced lisse category, classifying-stack comparison, HN localization, compact generation and dualities are not supplied by the ordinary smooth-category dictionary recovered in the finding.

### CFSG statement

I0's seventeen Lie-type constructors, the rank/field restrictions, duplicate exclusions, 26 sporadic names, four CFSG constructors, algebraic closures and numbered permutations match the document. Rank is read from `dynkinType.rank`. The B2/C2 adapter and exceptional-isogeny length permutation play different roles and are not conflated.

L0–L3 correctly identify thirteen constructed branches and four missing designated carriers/branches: triality D4, Ree G2, Ree F4 and Tits. A generic toral numbered symmetry and triality on the Geck carrier do not produce the specified tripled GL_24 carrier. The short-root G2/F4 modules are Lie-algebra representations; root-datum and torus isogenies do not construct the required group-scheme isogenies. Ordinary Steinberg maps compose the graph automorphism with Frobenius; Suzuki uses an odd half-Frobenius power. The positive-simple-root equations retain their stated scope. Generic rigidity also requires the negative roots and weight torus, so it is only related to the full pinned isomorphism theorem.

`FixedPointCandidate` takes the derived subgroup of fixed points and then its own central quotient. It does not quotient by the ambient centre. L5's transport machinery is available, but the independent pinned carrier and intertwining comparison are not. The document's separate L4 comparison with an external Mathlib Suzuki construction is acknowledged; that construction is not at the pinned baseline, and no such comparison was found. L4 is not a separate layer in this audit's nine-layer brief. A0's uniform assembly is still absent; the universe-lowering theorem for an arbitrary family genuinely supplies the mathematical content of its last target.

S0/S1 were challenged beyond the assembly signature. The 26 records contain sources, locators, generator conventions and full relator lists, with uniform count checks. The stored compiler reverses and inverts words correctly, and its semantic theorem links the checked expressions to `PresentedGroup`. Monster uses the 78 Coxeter relations, spider relation and central `f_312` relator, for 80 total; Baby Monster uses 66 Coxeter relations and three added words, for 69. Source and comparison records were inspected across the group modules, including the distinction between a full presentation and an ATLAS semi-presentation, redundant-but-retained versus commented-out words, and the different commutator conventions. The source-to-Lean and permutation-comparison records are review provenance. Their GAP/Python computations were not rerun in this audit. No finiteness, simplicity or abstract-group identification theorem for the candidates is inferred from a count check, and the statement-only roadmap does not require those theorems.

## Ownership, freshness and validation

All 26 overlap leads were checked against the full descriptions of 16 distinct named owner stages, matched to their document sections. Global-curve geometric Satake/shtukas and Fargues–Fontaine constructions have separate geometric proofs; classical Satake and its geometric trace comparison are separate targets. The local Weil group, pinned group schemes, abstract reconstruction and classical tower constructions remain imports. Accepted RS-22 explicitly preserves the global/local distinction; RS-05 retains VS4's geometric comparison while importing the coefficient carriers. No additional duplicate or wrong-owner finding was established. Reading restructuring context, including earlier work by this session, is not a new red-team review of those proposals.

The acquisition at `fcc2bb1f0ecb258bc7c7a664c6539bfb248fad24` was refreshed to `470336c5e85deb65341ede42881e2798f13a6e4f`; no guarded input changed. Publication checks those hashes and the original deliverable state again.

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-21.result.json` — passed.
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-21.result.json research/blueprint/redteam/RT-AUDIT-21.md` — two files, zero problems.
- Census, citation-location, pinned-file and authorized-path checks — passed.

Only the two issue deliverables are submitted. No Lean file was compiled, and no new mathematics is claimed formalized. The finding goes to independent verification.
