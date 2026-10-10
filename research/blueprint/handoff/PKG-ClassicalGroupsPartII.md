# PKG-ClassicalGroupsPartII — completed package

Issue: [#7534](https://github.com/CBirkbeck/tauceti-explorer/issues/7534).
Agent: Codex (GPT-6), session `codex-hDQfIP`.
Branch: `codex-hDQfIP-classical-groups-package`.
Date: 2026-10-10.

The bot confirmed this session's claim at 14:02:42 UTC, in
[comment 6098284331](https://github.com/CBirkbeck/tauceti-explorer/issues/7534#issuecomment-6098284331).
None of the manager's priority issues was available when selecting this job.
This run took one package job and submits it as complete.

## Deliverables and coverage

- [README](../packages/ClassicalGroupsPartII/README.md): 104,571 bytes, with the
  four layers CG.0–CG.3 and all 26 accepted targets. It gives the exact
  characteristic-zero hypotheses, matrix/form conventions, integral central
  lattice, fppf central cover, rational models and field comparisons, both
  integral character-ring presentations and the tensor occurrence criterion.
  All 76 API items and all 58 unit tests are included. Each of the 18 definition
  or construction targets has at least three tests. The two Laurent invariant
  presentations and the support-cone proof are independent of representations.
- [Suggested.lean](../packages/ClassicalGroupsPartII/Suggested.lean): one import
  block and one standard header; all 26 suggested target names, 76 API names
  and 58 named test examples are preserved. It uses the actual finite-comodule,
  SplitK0, weight, coordinate-Hopf, exterior and base-change library APIs.
- [metadata.toml](../packages/ClassicalGroupsPartII/metadata.toml):
  `topic = "math.RT"`.

The accepted packet, reader document and original suggested file were inputs
only and remain unchanged. The README is authored mathematical prose, with
theorem/section/page references; no source passage or section-by-section
source summary was added.

## Library and upstream checks

Checked the statements and relevant hypotheses of all 22 declarations in the
accepted baseline, at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Also read and linked the native
`Matrix.GeneralLinearGroup` definition, which supplies the invertible matrix
carrier in the points equivalence. In particular:

- finite-comodule monoidal/braiding universes match the coefficient universe;
- the kernel interface needs a flat coalgebra and a Noetherian source, both
  automatic for this field-coefficient finite-dimensional setting;
- the matrix-coefficient subcoalgebra already exists for finite free comodules;
- `Comodule.baseChange` changes both the coalgebra and the underlying module;
- `char_extPowerRep_diagonal` supplies an abstract GL trace calculation, rather
  than an algebraic GSp exterior comodule;
- the existing integral symmetric-polynomial algebra equivalence is valid
  over arbitrary commutative coefficient rings and requires no denominators.

Read the library-coverage audit. It contains no entries whose roadmap/stage
identifier is exactly `ClassicalGroups` or `ClassicalGroupsPartII`; occurrences
of these names within other entries do not establish this roadmap's coverage.

Read the current ClassicalGroups and ReductiveGroups READMEs in full and
LieHighestWeight Layer 4, rather than relying on the atlas snapshot. The
read-only current roadmap checkout was at
`a7712b2de0fbbe57dc06903169fe84cc69cf71ab`; current Tau Ceti was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched the Suggested files of
AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory (all its component files),
OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry, and the current library's algebraic-group and
representation-theory material. No duplicate of these GSp character-ring
targets was found. The package cites the existing general foundations and
complex Sp classification, rather than planning them again. No build was run
in either read-only checkout.

Read-only searches of open Mathlib pull requests for `symplectic`, `comodule`
and `exterior primitive` returned no results; public Zulip searches supplied
no relevant alternative interface. These searches do not replace the pinned
source checks.

## Packaging corrections and dependency decisions

1. **False signed-coefficient test in the accepted inputs.**
   `positive.test_signed_coefficients` asserted that an individual
   `−(z_i+t/z_i)` belongs to the full Weyl-invariant positive subring for every
   rank. It fails when g>1: a pair permutation takes it to another pair sum.
   The package preserves the test name but uses
   `−Σ_i(z_i+t/z_i) ∈ B_g^W`, which checks negative integer coefficients and
   invariance under both flips and permutations. Apply the same correction to
   the packet and original reader/suggested file when their owner can do so;
   this issue did not authorize those edits.
2. **Unpackaged arithmetic-statistics prerequisite.** The coordinate target
   cited `ArithmeticStatistics:ST.5/symplectic-similitude-group`.
   ArithmeticStatistics has no package and is not an upstream prerequisite
   suitable for this package. Its use here was only the explicitly displayed
   matrix carrier. The package instead uses native `Matrix.GeneralLinearGroup`
   and states `hJhᵀ=sJ` directly in `pointsEquiv`; the Hopf presentation and
   ReductiveGroups Layer 0 represent that closed subfunctor. No general
   arithmetic-statistics matrix-group theory is moved or duplicated. This
   removes the dependency on that unsubmitted roadmap without adding a new
   general matrix-group target. ClassicalGroupsPartII is outside the 94-roadmap
   Caraiani–Newton tier list and has no bundle; its remaining external inputs
   are existing upstream roadmaps or library declarations. Point the accepted
   coordinate target at this direct carrier rather than the statistics node.
3. **Cartan component ownership.** The original reader's supplier list assigned
   a Cartan-component theorem to LieHighestWeight Layer 4, which explicitly
   provides classification. Follow the accepted packet's corrected request:
   derive this component here from the one-dimensional highest line in the
   tensor product, the existing classification and ReductiveGroups Layer 6
   semisimplicity. The README gives that derivation and keeps generic
   coefficient-generated subcomodules in ReductiveGroups Layer 1, reusing the
   native finite matrix-coefficient subcoalgebra. No upstream scope change is
   proposed.
4. **Suggested-file repairs.** Fixed the reserved `λ` identifiers, matrix-index
   inference, integer-polynomial evaluation base ring, unit-to-algebra
   coercions for multiplier powers and inverse classes, categorical tensor
   coercion, explicit native zero objects, scalar-point rank inference and
   redundant instance/proof binders. These repairs preserve the mathematical
   specifications and eliminate every non-`sorry` diagnostic.

## Sources inspected

Public author originals were read and their SHA-256 receipts matched the
accepted versions. No cleared private book was needed.

- Hongjie Yu, [arXiv:1807.04659v5](https://arxiv.org/pdf/1807.04659v5),
  18 July 2022: printed p.64, §7.1, equation (7.1.1) and Remark 7.1.1;
  also checked the transition to §7.2 on p.65. SHA-256:
  `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`.
- J. S. Milne, [Algebraic Groups, second edition](https://www.jmilne.org/math/Books/iAG2022.pdf),
  author PDF dated 5 October 2021: Chapter 22 §a, Theorem 22.2 and
  complements 22.3–22.6, printed pp.464–466; complement 22.12, p.466;
  Chapter 22 §c, Lemma 22.39 and Theorem 22.42, pp.477–479. SHA-256:
  `f2ddd8fa4d263085f173934664b246007a2c0bd539739b7c82de39bfb5d21f40`.
- Shlomo Sternberg, [Lie Algebras](https://people.math.harvard.edu/~shlomo/docs/lie_algebras.pdf),
  author lecture notes dated 23 April 2004: §7.9, printed pp.131–133.
  The package uses the contraction target Λ^(k−2)V and the dimension
  binom(2g,k)−binom(2g,k−2); it does not propagate the second-binomial
  index misprint. SHA-256:
  `7d81adf60297c1a756e899028ca077a0861ee21275e62992bd7dc8ec670f88bb`.

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalGroupsPartII.json`:
  passed, 0 errors and 0 warnings (the accepted input is unchanged).
- `lean-check research/blueprint/packages/ClassicalGroupsPartII/Suggested.lean`:
  passed at the exact pinned library versions, exit 0; 188 warnings, each
  `declaration uses sorry`, and no errors or other warnings. One compile ran
  at a time, with over 20 GB memory available. No language server, library
  build, dependency update or cache download was started.
- Mechanical coverage and link checks: all 26 target anchors, 76 API names,
  58 test names and 58 Lean examples present; all 68 internal target links and
  external upstream layer-heading links resolve against the current checkout.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  passed, 4 files and 0 problems.
- Metadata is the required single line; the README contains no local paths or
  blueprint workflow identifiers. The four changed paths are the issue's
  authorized deliverables.

The accepted plan's existing suggested-file expressibility gap remains
explicit: the fppf faithfully flat quotient and full representation-descent
clauses cannot yet be typed against the generic supplier interfaces. Their
complete mathematical statements, proof and ownership are in the README;
the Lean file gives the coordinate morphism, algebraically closed point lift
and parity forms. As required by the upstream prototyping rule, it introduces
no opaque `Prop` placeholder or axiom. Add the scheme signatures against the
ReductiveGroups interfaces when those interfaces exist. This is the inherited
prototype limitation, not unfinished package prose or a missing roadmap target.

The package is ready for independent package review, including a fresh
`lean-check`. No implementation is claimed. No additional package work remains;
the input corrections above are recorded for their owners. Scratch sources,
generation scripts and diagnostic logs are disposable and are not needed to
resume or review this package.
