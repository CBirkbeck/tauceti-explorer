# PKG-JacobianChallengePartII — handoff

Refs [#7593](https://github.com/CBirkbeck/tauceti-explorer/issues/7593).
Claude (Opus 5.5), session `claude-35dVql`, 14 October 2026. Branch `claude-35dVql-jacobian-partII-package`.
The bot confirmed the claim (comment 6163078240).

**Status: complete.** The package is written in the 2026-10-12 shape: `README.md` (126,663 bytes, 1,050 lines),
`Suggested.lean` (678 lines) and `metadata.toml` (`topic = "math.AG"`). The accepted packet
`research/blueprint/packets/JacobianChallengePartII.json` (SHA-256 `2da73e3c…f275`) was not changed.

## Why the earlier "blocked" checkpoints no longer apply

The earlier Codex checkpoints stopped because the abelian-scheme suppliers (packet ids `A1`–`A3`) had no package and
because Layer 7 used StableReductionPartII MC.4, which itself uses Layer 1 (a roadmap-level cycle). Both are resolved:

1. **Suppliers now exist as TauCetiRoadmap pull requests.** Every packet supplier id was mapped to the section and
   declaration of the current upstream text (read from the PR heads on 2026-10-14):
   - `AbelianSchemesAndArithmeticModuli:A1/A2/A3` → TauCetiRoadmap PR #849 (head `1d8f849`): A0.1 `AbelianScheme`,
     A1.1 `relativeProductsAndDimension`, A1.2 `relativeRigidity`, A1.4 `relativeSeesaw`, A1.5 `relativeCube`,
     A2.1 `raynaudRepresentability`, A2.2 `AbelianScheme.dual`/`poincare`/`normalizedPoincare`, A2.3 `mumfordMap`,
     A2.5 `Polarization`, A2.6 `Polarization.graphBundle`/`graphBundle_spec`, A3.2 `multiplicationAndDensity`,
     A3.7 `polarizedWeilPairing`, A3.8 `FullLevel`.
   - `AlgebraicModuliForArithmeticGeometry:A0-extension/*` → PR #853 (head `2af2744`) §7.6.1 `relativePicardSheaf`,
     `relativePicardBaseChange`, `relativePicardKernel`, `sectionPicardSplit`; `R09.2` → §7.3
     `relative_picard_algebraicSpace`, `relative_picard_separated`, `picard_infinitesimal_lifting` and §7.9
     `picardZeroSheaf`, `picardZeroCriterion` (plus SchemeAndStackFoundations §4.14 `hilbert_quot_schemes`);
     `R09.3` → Layer 3 descent and, for closed immersions and finite morphisms, Stacks Lemmas 35.23.21 and 35.23.25.
     The packet's R09.4 `arith-*` contracts are covered by PR #849 A0–A2.
   - `NeronModelsAndSemistableAbelianVarieties:R11.4` → PR #852 (head `15a4a79`) §4.13 `StableFamilyPicard`.
   - SchemeAndStackFoundations (TauCetiRoadmap main, merged 2026-10-14): §0.11, §2.20, §3.6 (`picardComponent`),
     §3.7 (`abelMaps_highDegree`), §3.8 (`invariant_differentials`), §4.14.
   - JacobianChallenge Layers A–F, StableReduction Layers 2–3 and AlgebraicVectorBundles L0B–L0C were checked against
     the TauCetiRoadmap checkout at `0d144d0`.
2. **Layer 7 no longer depends on StableReductionPartII.** It is restated for any noetherian ℤ[1/ℓ, ζ_ℓ]-scheme M with
   a smooth projective curve C/M of genus g ≥ 2 and a full symplectic level-ℓ structure on J(C/M), defined as an
   A3.8 `FullLevel` whose A3.7 Weil pairing is the standard form through ζ_ℓ. The universal curve over M_g[ℓ] is the
   downstream instance. The targets are renamed `levelJacobian` (§7.1) and `levelFaltingsZhang` (§7.2); no new
   curve-level notion is defined here, so StableReductionPartII MC.4/full-level keeps its definition.

## Duplications removed (cited instead of re-planned)

- §3.3 `TwiceTheta`: Θ_X = Δ_J^*(P_X^∨) is exactly PR #849 A2.6's graph bundle `Polarization.graphBundle λ_X`
  (with P_X = (id × (−λ_X))^*U and U = A2.2's Poincaré bundle). §3.11–§3.13 (symmetry, zero rigidification,
  relative ampleness) are now stated as applications of `graphBundle_spec`; §3.10's Néron–Severi class 2[θ] agrees
  with it. An API item `RelativeJacobian.TwiceTheta.graphBundle` records the identification.
- §3.8 doubling formula = the n = 2 case of A1.5 `relativeCube`; §3.6 Poincaré addition = A2.3's Mumford-bundle
  identity for L = O(θ_α).
- §4.4: the Picard–Brauer exact sequence is PR #853 §7.3 `picard_brauer_obstruction`; the target keeps only its
  restriction to the algebraically trivial parts for J and X.
- §0.3 and §1.1 now rest on §7.3/§7.9 of PR #853 (algebraic-space representability, separatedness, identity
  component, properness criterion) and add only the curve-specific scheme representability (Kleiman, Theorem 4.8).
- The packet gap "algebraic equivalence of geometric-fibre line classes" is closed by defining algebraic triviality
  as membership in the fibre identity component `picardZeroSheaf` (README conventions and §4.1).
- The packet gap "relative pointed Abel immersion bridge" is closed in §2.4: proper + unramified + universally
  injective (Stacks, Lemma 41.7.2), the last two checked on fibres.

## Corrections to the earlier package text

- The earlier README cited `LineBundleClass` inverses (`inv_mk`, `mk_surjective`, `mk_eq_one_iff`) and
  `rigidifiedPicardFunctor` as library vocabulary. At the Tau Ceti pin `f790474` `LineBundleClass` is only a
  commutative monoid (no inverse, no pullback) and there is no `PicardFunctor` directory; those declarations are in
  the current Tau Ceti (`a91d3aa`) only. The README now says so.
- Packet ids (JC5.2, JC2.6, …) removed from the Lean docstrings; the closing comment lists README target names
  instead of packet node slugs.
- §4.2 check `test_poincare` said "degree-zero"; for g ≥ 2 the condition is algebraic triviality (fixed).
- §6.3 used λ_X for the Hodge line, clashing with the polarization; renamed λ_H.
- Free locators added from Kleiman, *The Picard scheme* (arXiv:math/0504020v1): Remark 2.11 pp. 20–21, Definition
  4.6 and Theorem 4.8 pp. 27–29, Propositions 5.19–5.20 pp. 47–48, Exercise 5.23 p. 50, Remark 5.26 p. 51 (read in
  this run). Yuan arXiv v4 page numbers were spot-checked against the PDF (pp. 29–31, 37, 43–44, 96–98, 108–110):
  they agree. Bosch–Lütkebohmert–Raynaud is not cleared in the atlas library and was not read; its locators are
  kept from the accepted plan. Kleiman's Abel map has the opposite sign to Yuan's i_α (recorded in §4.3).

## For other roadmaps

- **StableReductionPartII** (MC.4): import §1.2–§1.4 for the curve Jacobian and its polarization, PR #849 A3.7–A3.8
  for level, and treat JacobianChallengePartII Layer 7 (`levelJacobian`, `levelFaltingsZhang`) as the consumer
  interface for the universal curve over M_g[ℓ]; no edge from MC.4 into this roadmap is needed.
- **AbelianSchemesAndArithmeticModuliPartII** cites `JC7/universal-faltings-zhang`; it is now §7.2
  `RelativeJacobian.levelFaltingsZhang` (and `JC2/curve-difference` is §2.6).
- **AbelianVarietiesIsogenousToNoJacobian** cites §1.2 and §1.4: section numbers and names are unchanged.
- Yuan's §2.2.1 states finiteness of i_α without d ≠ 0 (the packet's source issue E1, already confirmed); §2.5 keeps
  d ≠ 0 and says so.

## Checks run

- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean` (Mathlib `082e2d37e8`, Tau Ceti pin
  build): exit 0, no errors, 78 warnings, all `declaration uses 'sorry'`. `free -g` showed 111 GiB available.
- `python3 scripts/check_sorry_data.py` on the Lean file: no offenders.
- Scripted: every API and test name of the packet's 48 nodes appears in the README; no `*Needs:*` refers to a later
  section; every backticked supplier or library name in the README was found in the upstream PR texts, the merged
  SchemeAndStackFoundations README, the pinned Mathlib/Tau Ceti sources or the Lean file; tables have consistent
  columns; no packet ids, job ids or review language in the README.
- Adversarial pass on signs and degenerate cases: Poincaré sign (elliptic Θ degree 2, Δ^*P degree −2), Theorem A.3
  identities at g = 1 and g = 2, i_α origin change and pointed factorization, the GL₂(𝔽₂) noncommuting witness, the
  48/24 level-3 count, the torsion-cokernel exponent (the argument gives exponent d), Kleiman's Abel-map sign.
