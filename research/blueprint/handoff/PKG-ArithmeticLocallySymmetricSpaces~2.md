# PKG-ArithmeticLocallySymmetricSpaces~2 — handoff

Agent: Claude (Opus 5.5), session `claude-8fRHWi`. Issue: #9158. Revision round 2 of the package,
after the independent review `REV-PKG-ArithmeticLocallySymmetricSpaces` (needs_changes, findings
F1–F4). `review.json` is left in place for the next reviewer.

## What was done

- **README.md rewritten in TauCetiRoadmap form** (`# Roadmap: …`, `**Summary.**`, layer table, Scope
  and ownership, Conventions, Exact supplier contracts, How to read the build, `## Layer ALS.k`
  with `### ALS.k.n` prose subsections, each layer ending in `### Examples` and `### Dependencies`,
  Downstream consumers, References). No field lists, no process language. All 66 planned targets
  keep their anchors, all 132 API names and all 88 test names are present (checked by script), and
  every internal link resolves. Ten targets are new (below). Lines are wrapped at 100 columns and
  asterisks outside code are escaped so that `H^*` renders literally.
- **Suggested.lean rewritten to the 2026-10-12 shape**: 470 lines, `namespace
  TauCetiRoadmap.ArithmeticLocallySymmetricSpaces`, one module docstring, `#check` pins, light
  real-bodied definitions over pinned carriers (`orthogonalTimesScalars`, `upperTriangularMod`,
  `unipotentMod`, `iwahori`, `iwahoriOne`, `gamma1Mod`, `gammaPMod`, `glOrientationSign`,
  `sliceRepresentation`, `oppositeInverse`, `endpointMonodromy`, `geodesicActionSL2`, `heckeBasis`,
  `doubleCosetOperator`, `IsDoubleCosetReps`, `twistCoefficients`), milestones statable at the pins
  (`stabilizer_I_eq_orthogonalTimesScalars`, `transposeInverse_fixed_iff_orthogonal`,
  `iwahori_index_GL2`, `iwahoriOne_relIndex`, `groupCohomology_SL2Z_one`/`_two`,
  `geodesicActionSL2_add`/`_re`, `heckeRing_normal`, `doubleCosetOperator_mem_invariants`,
  `doubleCosetOperator_indep`, `twistHecke_exists`), discriminating `example`s, and a closing
  comment listing the README targets not typed at the pins, grouped by missing carrier. The old
  file's sorry'd data (homeomorphisms, `Datum`, sorry'd instances and ring equivalences) is gone.
- `metadata.toml` unchanged: `topic = "math.NT"`.

## How the review findings were resolved

- **F1 (no Lean declarations for most targets).** Superseded by the 2026-10-12 shape rule: the
  Lean file states only what is easily statable at the pins; everything else is a README target
  with its exact hypotheses, and the closing comment lists them.
- **F2 (missing geometric and supported interfaces).** New targets: ALS.0.2 real points and the
  Lie-theoretic Cartan datum (AF.1 real points, LieGroups Layer 9 Cartan decomposition, the
  left-to-right quotient conversion by inversion, split centre inside `exp 𝔭`, components);
  ALS.1.3 independence of the neat refinement, free descent with supports, cocycle coherence and
  agreement with ordinary sheaf cohomology at neat level; ALS.1.4 now states the local-coefficient
  extension of Sella's argument and the variance of Tau Ceti's twisted cochains (`L = V^∨`,
  `M = R`); ALS.3.2 Hecke rings of normal subgroups and product pairs; ALS.3.4 the Hecke complex,
  a strict object of `D⁺(H(G^S,K^S) ⊗ R[K/K′])` built with NT16's derived Hecke-invariants functor
  for the pair `(G^S × K_S, K^S × K′_S)` — this replaces every "enhancement obligation" and the
  `EnhancedDerivedSheaves:E1` citations for strict lifts; ALS.3.7 the Mackey formula (NSW (1.5.6)
  through ProfiniteCohomology Layer 10).
- **F3 (qualifications).** Kept throughout. New ALS.4.5 descends AF.4's complex Kostant theorem to a
  characteristic-zero splitting field `E` (the request AF.4 records for ALS.4); ALS.4.4 and 4.6 now
  use AF.1a's absolute cochains over `E`. Verdier duality (ALS.5a.2) is now proved from
  AlgebraicTopology Stage 6 Poincaré–Lefschetz duality on the Douady–Hérault manifold with boundary
  plus the finite projective models; the citation of EnhancedDerivedSheaves E1 there was wrong (E1
  plans unbounded derived sheaves and pullback/pushforward, not Verdier duality) and is removed, as
  in ALS.5a.6.
- **F4 (downward moves without proof chains).**
  1. *AdditiveCombinatorics AC.3 → ALS.2*: closed. New ALS.2.6 (unipotent arithmetic lattices are
     cocompact: AA §3.4 class number one + AF.3 compactness of `N(F)\N(𝔸)`) and ALS.2.7 (the exact
     sequence `1 → Γ_N → Γ_P → Γ_M → 1` at decomposed levels); ALS.2.8 cites them.
  2. *AutomorphicSpectralTheory AS.5 → ALS.5*: the Eisenstein-free part moved down — new ALS.5b.3,
     Borel's moderate-growth comparison (Franke §2.2 Theorem 2, §2.3 Theorems 3–4, Proposition 2).
     Franke's Theorem 18 and the Franke–Schwermer description need Langlands' Eisenstein series
     (AS.0–AS.4, about a hundred targets); moving them down would duplicate AS wholesale. They are
     therefore an explicit hypothesis `FrankeInput` (ALS.5b.4), with the comparison map
     `ι_𝒜` constructed unconditionally. Cuspidal cohomology's map to interior cohomology is
     unconditional; injectivity uses `FrankeInput`.
  3. *AutomorphicGaloisRepresentationsPartII AG2.2–AG2.4 → ALS.5*: cannot move down (HLTT and the
     unitary base change use Shimura varieties built on this roadmap). New ALS.5b.7 states them as
     hypotheses `GaloisInput.GL`, `GaloisInput.unitary` (ACC+ Theorems 2.3.2–2.3.3) and proves the
     algebraic comparisons that combine them (Galois representation of an induced eigensystem via
     NT16 Lemma 4.6; constituent count for `U(n,n)` Levis). ALS.5b.6, 5b.8, 5b.9 carry these
     hypotheses explicitly; ALS.4.13 now states its Levi Galois-type input as a hypothesis, like
     NT16's ♠ in ALS.4.12.

  **For follow-ups on the higher roadmaps:** AutomorphicSpectralTheory AS.5 (`franke-comparison`)
  should cite ALS.5b.3 for the moderate-growth step and is where `FrankeInput` is discharged;
  AutomorphicGaloisRepresentationsPartII discharges `GaloisInput`; AutomorphicFormsOnReductiveGroups
  AF.1 already imports Cartan involutions from ALS.0.1–0.3 and AF.4's Kostant descent request is
  met by ALS.4.5.

## Duplication check

Current TauCetiRoadmap main (checkout `0d144d0`) now contains AdelicAlgebraicGroups,
IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups and ReductiveGroupsPartII;
every former `AA.x/…`, `IHG.x`, `SR.x`, `RG2.x` id is replaced by the upstream section and
declaration names (verified by grep in those READMEs). The arithmetic targets that apply IHG
(derived Hecke algebra, localization, Galois type) say in one clause that they are IHG's notions
applied to `RΓ(X_K, V)`. FuchsianOrbifolds (coarse Riemann surfaces `Γ\ℍ`) is not duplicated.
Current Tau Ceti (`a91d3aaf`, later than the pin): twisted cochains are cited with their variance;
`HeckeCoset.heckeSum` (coinvariant, right-coset Hecke sums) is cited in ALS.3.1 and the Lean
docstring as the transpose of the invariant operator; nothing removed beyond that.

## Mistakes in the accepted plan (packet not edited)

- The packet cites `EnhancedDerivedSheaves:E1` for Verdier duality and for strict Hecke lifts; E1
  does neither. Replaced by AlgebraicTopology Stage 6 and the Hecke complex ALS.3.4.
- ALS.5 and AutomorphicSpectralTheory AS.5 cite each other (cycle); resolved as above.
- NT16 page fixes: Lemma 2.3 is p. 12 (published), Lemma 2.17 p. 23, Lemma 4.5 p. 57; ACC+
  Lemma 2.1.14 is pp. 915–916.
- AdelicAlgebraicGroups has no `parabolic-double-cosets-finite`; ALS.2.5 now proves the finiteness of
  `P(F)\G(𝔸^∞)/K` from class numbers of `P` and compactness of `P(𝔸^∞)\G(𝔸^∞)`.

## Checks run

- `lean-check research/blueprint/packages/ArithmeticLocallySymmetricSpaces/Suggested.lean`: exit 0,
  34 warnings, all `declaration uses 'sorry'`; no errors, no other warnings.
- `scripts/check_sorry_data.py` on Suggested.lean: passes.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- README crosswalk against the packet: 66/66 anchors, 132/132 API names, 88/88 test names; all
  internal links resolve.
- Locators: all 62 distinct NT16, ACC+23, Fra98, HR15 and NSW locators checked against the source
  texts (published NT16, ACC+ author copy with Annals pagination, Franke, HR15 v2, NSW 2.3); none
  fails. BS73, CG18, CGH20, CN23, JM02, Mil17, Sel16 locators are inherited from the reviewed
  package and were not re-checked.
- Sources read: Franke (Numdam, SHA-256 `3c0465f6…c58b`), NT16 published (`c95c1b1d…aa23`), HR15 v2
  (`1d3af2de…dca06`), NSW 2.3 (author page), ACC+ and Scholze arXiv v2 from the cleared library
  (nothing copied).

## Adversarial pass (statements checked, instances tried)

| Statement | Instance | Outcome |
| --- | --- | --- |
| stabilizer of `i` in `GL(2,ℝ)` | det < 0 branch through `σ` | `(a,b;b,−a)`; equals `ℝ_{>0}O(2)` |
| Iwahori index | `GL_2(ℤ_p)`; `n = 0` | `p + 1`; `(q−1)^0 = 1` |
| projective `Γ₁` | `ZMod 8`, scalar 3 | in `Γ₁`, `3 ≠ ±1` |
| `Γ_p ≠ Γ₁` | `q = 7`, `p = 3`, `diag(1,2)` | `2³ = 1` in `F_7` |
| pro-`3` Iwahori element | `(1,1;−3,−2)` | order 3, in `Iw₁` |
| orientation sign | `diag(−1,1)`, `m = 3`, `(57,455;455,3632)` | `−1`, `1`, `−1` |
| whole-inverse monodromy | `A = (1,1;0,1)`, `B = (1,0;1,1)` | `A⁻¹B⁻¹ ≠ (AB)⁻¹` |
| `H^*(SL_2(ℤ), ℤ)` | degrees 1, 2, 4 | `0`, `ℤ/12`, `ℤ/12` |
| Hecke ring of normal subgroup | `S₃ ⊃ ⟨(12)⟩` non-normal | rank 2, not `ℤ[S₃/U]` |
| induced eigensystem Galois rep | constant eigensystem of `GL_2` | `ε⁻¹ ⊕ 1`, polynomial `(X−q)(X−1)` |
| Kostant over `E` | `GL_2`, `λ = 0` | `E(0,0)`, `E(−1,1)`: central characters differ |
| unipotent lattice | `G_m` instead of `G_a` | `{±1}` not cocompact |
| parabolic extension | `SL_2(Ẑ)`, Borel | `ℤ ⋊ {±1}`, trivial action |

## Where to resume

Nothing is left open in this job. The next step is the independent package review. Scratch files
were not kept.
