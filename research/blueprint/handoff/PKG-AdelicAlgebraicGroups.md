# PKG-AdelicAlgebraicGroups — handoff

Issue: #7453. Worker: Claude Code, session `cc-23c490`, 9 October 2026 (claim
confirmed by the bot on comment 6079261198). Earlier checkpoints: Codex
sessions `codex-Jw16pG` and `codex-39yEkh`.

## Status

The package is complete and ready for its independent review. All three
deliverables are present:

- `packages/AdelicAlgebraicGroups/README.md`: 198,539 UTF-8 bytes; six layers
  AA.0–AA.5; all 264 targets and 231 API names of the accepted plan, plus the
  two AA.5 targets that carry the move-down recorded below.
- `packages/AdelicAlgebraicGroups/Suggested.lean`: one header note, one import
  block (62 modules, 17 of them Tau Ceti), and 671 active declarations
  (319 theorems, 191 definitions, 49 instances, 2 structures, 110 examples),
  followed by the mathematical interface catalogue.
- `packages/AdelicAlgebraicGroups/metadata.toml`: `topic = "math.NT"`.

No packet, reader document, link map or other file was changed.

## Lean check

Command, run from the repository root:

```text
lean-check research/blueprint/packages/AdelicAlgebraicGroups/Suggested.lean
```

It ran in the shared build at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, with every imported Tau Ceti
module compiled. Result: exit 0, no errors, 540 warnings, every one
"declaration uses `sorry`". The file sets `autoImplicit false`, so no
misspelled name is silently bound as a variable.

## Move-down from ModularCurvesPartII (upstream tier rule)

The accepted plan cited `ModularCurvesPartII:R12.2` (tier 11) as the supplier
of the analytic identification of Γ(N)\ℍ (and the Γ₀, Γ₁ quotients) with the
GL₂ level quotients, used by
`AdelicAlgebraicGroups:AA.5/gl2-upper-half-plane-component`. AdelicAlgebraicGroups
is in tier 2, so that notion now lives in AA.5.2 as two targets:

1. **Congruence groups of the GL₂ components** (placed before the component
   theorem): Γ_{g,U} = GL₂(ℚ)^+ ∩ gUg⁻¹ lies in SL₂(ℚ), contains Γ(M) when
   K(M) ⊂ gUg⁻¹, is commensurable with SL₂(ℤ), is arithmetic in Mathlib's
   sense (`Subgroup.IsArithmetic`), acts properly discontinuously on ℍ, and
   its orbit space is the coarse quotient Riemann surface of the Tau Ceti
   FuchsianOrbifolds roadmap (layers 0, 1 and 4); conjugation and
   finite-index inclusions induce biholomorphisms and finite holomorphic maps.
   Sources: Milne, *Introduction to Shimura varieties*, §4 p. 42,
   Proposition 4.1 p. 43, Lemma 5.13 and the following remarks pp. 57–58.
2. **Riemann-surface structure and change of level for GL₂ quotients**
   (placed after the principal-level target): the transported complex
   structure on X_U, holomorphy of X_{U′} → X_U and of T(h), and the standard
   levels K(N), K₀(N), K₁(N) with Γ(N), Γ₀(N), Γ₁(N). Sources: Milne,
   Lemma 5.13 p. 57, the maps Sh_{K′} → Sh_K and T(g) p. 58, π₀ at principal
   level p. 63; the K₀, K₁ cases are direct computations.

What AA.5 itself uses is the general Γ_c\ℍ (component theorem) and Γ(N)
(principal level). The Γ₀(N), Γ₁(N) cases are included because the plan's
supplier request names them. The comparison of these analytic quotients with
algebraic modular curves (R12.2's uniformization of moduli problems) stays in
ModularCurvesPartII; that roadmap's plan should cite the two AA.5.2 targets
for the analytic side. The component theorem now cites them instead of
`ModularCurvesPartII:R12.2`, and the scope section names the FuchsianOrbifolds
roadmap (a Tau Ceti roadmap) as the supplier of the Riemann-surface quotients.
The accepted packet still records the old request; a later revision of the
plan should move `AdelicAlgebraicGroups:AA.5/gl2-upper-half-plane-component`'s
prerequisite accordingly.

## Other upstream-order adjustments

- The scope section named higher-tier consumers by atlas id
  (ArithmeticLocallySymmetricSpaces:ALS.0, ShimuraVarieties:V0, ShimuraData:D5,
  AutomorphicFormsOnReductiveGroups). The boundary is now stated without those
  ids; no prerequisite pointed at them.
- There were no `FoundationsAndLibraryIntegration` or `UPSTREAM:` citations in
  the package. All remaining roadmap citations are ReductiveGroupsPartII
  (tier 1) and Tau Ceti roadmaps.
- The link map `tauceti_TauCetiRoadmap_RepresentationTheory_CompactGroups`
  records CompactGroups layer 0 → AA.0 (Haar probability on compact open
  factors); the scope section now states it.
- The README size fell from 196 KB to under 199 KB after the additions by
  stating the standing hypothesis "H finitely generated" once instead of
  repeating its long form.

## Suggested.lean

The inherited file had 245 active declarations (55 examples) and left most
targets in the comment catalogue, mainly because no topology on points of an
affine group was available. The plan itself lists
`AdelicPoints.instTopologicalSpace` ("induced from 𝔸_F^H by evaluation") as an
AA.1 API item, so the file now defines that evaluation topology and builds on
it. Coverage of the accepted plan in active Lean:

| | before | now |
| --- | --- | --- |
| theorem/lemma nodes with signatures | 37 of 215 | 128 of 215 |
| definition/construction nodes with typed carriers | 20 of 49 | 35 of 49 |
| API names declared | 106 of 231 | 165 of 231 |
| unit tests as examples | about 50 of 148 | 99 of 148 |

Notions owned by other roadmaps are written out in their defining form, and
the header says so: the evaluation topology on points (ReductiveGroupsPartII,
RG2.0, with the local Hausdorff, local compactness and countability instances
of that layer stated as instances) and the idele norm (Global number fields
roadmap, layer 6). `AdelicPoints.SplitComponent` is a `sorry`-bodied
subgroup with its characterizing API, since its definition needs Weil
restriction (RG2.0a). Concrete examples use Mathlib carriers directly:
`GL (Fin 2) (FiniteAdeleRing ℤ ℚ)`, Mathlib ideles, `ℍ[ℚ, a, b]`,
`CongruenceSubgroup.Gamma0/Gamma1`, `Subgroup.IsArithmetic`, `PadicAlgCl`,
`Height.mulHeight`.

The catalogue was synchronized: every newly typed node reads "Native
equivalent signature(s)" with its declarations, and partially typed nodes say
what is left. The remaining omissions (87 theorem nodes, 14 definition nodes)
need objects that no pinned library offers in Lean: rational parabolic
subgroups, relative roots and Siegel sets (RG2.1, most of AA.3), Weil
restriction (RG2.0a), simply connected covers and the residual quotient
(RG2.1/RG2.3), Artin L-functions and local analytic charts (AA.2 Tamagawa
normalization), and measurable Hermitian lines for central-character L².
Three Tau Ceti predicates that would type some of them exist at the pinned
commit but are not compiled in the shared build, so they were not imported:
`TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic`,
`...Semisimple.Basic` and `...Center.Basic`. The centre statements are typed
for any central Hopf ideal instead.

## Notes on the plan

- `AA.3/adelic-height`: the API `height_inv_le` (polynomial bound for x⁻¹)
  holds only for a representation that contains its dual, as the node's
  statement assumes; for the standard character of GL₁ it fails. The Lean
  `Reduction.height` therefore builds in r ⊕ r^∨, which also makes the plan's
  tests `height_gl1` and `height_one` (value m^{[F:ℚ]/2} with m the size of
  r ⊕ r^∨) consistent.
- `AA.3/compactness-isotropic` and `AA.3/arithmetic-quotient-compact` are
  typed in Godement's form (compact iff G(F) has no nontrivial unipotent
  element); the equivalence with anisotropy of the derived group needs RG2.1.
- No mathematical statement of the accepted plan was changed.

## Checks

- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  0 problems.
- Process vocabulary (packet, review, job, gap, source issue) was removed from
  the catalogue text of Suggested.lean; the README has none.
