# PKG-GlobalShtukasAndFunctionFieldLanglands — roadmap package

Issue #10768. Agent: Claude (Opus), session `claude-rmM08Z`, 20 October 2026. Branch `claude-rmM08Z-pkg-global-shtukas`. One job claimed; no second job.

## Deliverables

- `research/blueprint/packages/GlobalShtukasAndFunctionFieldLanglands/README.md` (about 222 KB): the roadmap in TauCetiRoadmap form, built from the accepted plan (`packets/GlobalShtukasAndFunctionFieldLanglands.json`, 104 nodes, accepted by REV-GlobalShtukasAndFunctionFieldLanglands on 2026-10-19).
- `research/blueprint/packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean` (247 lines, `import Mathlib` only).
- `research/blueprint/packages/GlobalShtukasAndFunctionFieldLanglands/metadata.toml`: `topic = "math.NT"`.

## Coverage

- Layers GS.0–GS.7 keep the plan's stage ids as layer names (`## Layer GS.k`, `### GS.k.n`). Every target sits under an anchor equal to the plan's reader anchor (`gs-k-<slug>`), so existing citations of plan nodes resolve.
- 92 of the 104 plan nodes are targets. The 12 removed nodes are listed below; one new target was added (GS.1.4). Every API item of every kept node appears by name, and every definition keeps at least three Checks. The test names are dropped.
- Node placement follows the packet's `parentStageId`, which differs from the slug prefix for five nodes: three `GS.3/…` nodes sit in Layer GS.4, `GS.3/conjectural-…` sits in GS.5 and `GS.2/pgl2-finite-type-core` sits in GS.3. Within each layer the targets are in topological order; there are no forward references. Layer GS.4 was reordered from the reader order, because `coalescence-is-galois-equivariant` needs `the-functor-H-I-W`.

## Structural decisions (for the review and the port)

1. **GS.6 duplicates AutomorphicLFunctionsAndLocalFactors §AL.3.** TauCetiRoadmap PR #924 (head `d1996dc1`, section *Curve arithmetic and the unramified pure realization*) plans L. Lafforgue's GL_r correspondence at every level. The 12 plan nodes below are therefore removed and cited, as the plan's own restructure entry recommends. The AL and ET README heads do not cite GlobalShtukas, so no package-level cycle arises. The atlas AL packet still cites GS.6; that is the maintainer's clean-up.
   - `GS.6/drinfeld-shtuka-varieties-of-rank-r` → *Two-leg unramified shtukas*, *Leveled shtukas and ramified rank induction*
   - `/truncation-and-the-absence-of-a-stable-open` → *Bounded curve-bundle loci and shtuka truncations*
   - `/compactification-and-boundary-analysis` → *Two-leg unramified shtukas*, *Shtuka intersection cohomology and essential comparison*
   - `/normalized-hecke-correspondences`, `/rank-negligible-representations`, `/essential-shtuka-cohomology` and `/trace-formula-and-the-matching-of-terms` → *Essential cohomology and local factors*
   - `/negligible-cohomology-and-induction-on-the-rank` → *Shtuka intersection cohomology and essential comparison*
   - `/deligne-rank-induction`, `/the-global-correspondence-for-gl-r` and `/local-factors-purity-and-multiplicity` → *Leveled shtukas and ramified rank induction*, *Function-field local factors, multiplicity one and converse theorem*, and the unramified pure realization theorem
   - `/rank-one-is-class-field-theory` → *Rank-one unramified reciprocity*, *Ramified rank-one curve reciprocity*

   GS.6 keeps the three nodes AL.3 does not plan: constant twists, companions on curves and the excursion comparison. The layer is retitled.
2. **GS.0.15 narrowed.** `GS.0/picard-and-the-gl1-case` keeps the Picard-stack gerbe and the rank-one Lang fibres that the horocycle computations use. It cites AL.3 for rank-one reciprocity.
3. **GS.0.5 and GS.0.6** keep the G-bundle and torsion-sheaf content, with a clause saying how they differ from AL.3 on vector bundles.
4. **GS.0.1 and GS.1.1** cite EndoscopicTransferAndUnitaryTraceComparison §3.1 (`CurveBundles`) and §3.2 (`LocalLoopGrassmannian`) for the reductive case and the one-point fibre. They keep the parahoric models and the multi-leg geometry.
5. **New target GS.1.4, *ℓ-adic sheaves on stacks of finite type*.** No roadmap owns étale cohomology of algebraic stacks. EtaleDualityAndPerverseSheaves and EtaleCohomologyFoundations are scheme-only, and the "stacks Part II" of EDC was only proposed, in `handoff/ASM-EtaleDualityAndPerverseSheaves.md`. The plan's requests R4, R5 and R9 asked for it, so by the no-gaps rule it is planned here, scoped to what the shtuka stacks need. Sources (verified, arXiv versions):
   - Laszlo–Olsson I, math/0512097v2: Theorem 2.3.3, §§3–5, Theorem 5.5.6 p. 47, Theorem 5.7.5 p. 61;
   - Laszlo–Olsson II, math/0603680v1: Theorems 7.5, 7.7, 11.4, 12.1;
   - Laszlo–Olsson, perverse t-structure, math/0606175v1: Theorems 4.2, 5.1, 8.2;
   - Sun, 1008.3689v2: Theorem 1.1 p. 2, Theorem 4.2(ii) p. 29.

   If the EDC stacks Part II is created, this target should move there.

## Plan gaps and supplier contracts: disposition

The README states no gaps as such. Each plan gap is resolved as follows.

- **G1** (shifted HN existence): proof added to GS.0.8. The shifted degree d_T(F) = deg F − (T₁ + ⋯ + T_rk F) is supermodular because r ↦ T₁ + ⋯ + T_r is concave for dominant T, so the standard HN argument applies. Yu's citation of Chaudouard, Theorem 4.1.2, is kept.
- **G2** (finite-field ℓ-adic Satake): resolved for Q̄_ℓ coefficients by Richarz, arXiv 1207.5314v2 (Doc. Math. 19, 2014): Theorem 0.1 p. 2, Theorem 5.1 p. 20, and Proposition 5.6 / Corollary 5.8 p. 22 for the geometric versus algebraic Galois action (cited in GS.1.9 and GS.1.13). The étale O_E version stays a stated part of GS.1.14.
- **G3, G4, G6, G8, G9**: "part of this target" sentences in GS.3.6, GS.2.6, GS.7.2/GS.7.8, GS.5.4/GS.7.5 and GS.3.5/GS.3.10/GS.4.13.
- **G5**: the extra hypothesis of the conditional GS.5.12.
- **G7**: a remark in GS.7.7 that finite support of the integral limit is not asserted.
- **G10**: now AL.3.

Supplier contracts not met by the current supplier packages are handled as follows.

- R4/R5/R9 (stacks): GS.1.4.
- R7: "Ind(Perv) and localization modulo constructible" are not in EDC. They use Mathlib's `CategoryTheory.Ind` and `ObjectProperty.IsSerreClass`/`isoModSerre`, and the calculus is part of GS.3.4. ULA coefficients come from EtaleCohomologyFoundations §F.2.3, and the relative perversity of the Satake sheaves is part of GS.1.9. Integral perversity is in EDC Layer 2.
- R13: nonsplit compact cusp support is part of GS.0.14; FA.6 proves the split case.
- R12: ker¹ and pure inner forms are part of GS.0.7.
- R14/R15: LanglandsParameterStacks §LP2c.2 already reconstructs for an arbitrary group. Continuity for the profinite global group is part of GS.5.8 (VL Proposition 11.7, Lemmas 11.9–11.10).
- R16: LPV.0 is trait-only, so Orgogozo's theorem is part of GS.7.3. EtaleDualityAndPerverseSheavesPartII EQ.3 supplies the oriented products. Gabber's ULA comparison is part of GS.7.4.
- R11/R23 (local-shtuka realization): not used by the GL_r comparison GS.7.11, which follows LL Proposition VII.4 / Corollary VII.5 with the equal-characteristic LLC of ES §ES7:equal-characteristic.18. The uniformization comparison is GlobalShtukasAndFunctionFieldLanglandsPartII RA.3.
- R22 (DWP.3 Chebotarev): the DWP package imports it from FunctionFieldArithmetic FA.5 (its input E25), so it is cited as FA.5.
- IG.0 finite étale covers and π₁: cited as EtaleCohomologyFoundations §F.0.2, which is merged upstream.

Supplier section names were mapped with a Sonnet lookup over the package READMEs and the upstream main READMEs. FunctionFieldArithmetic and DrinfeldModulesAndTModules have no package yet, so they are cited by stage and node title.

## Other corrections relative to the plan

- The abbreviation of Genestier–Lafforgue is "GeL", to avoid confusion with the group GL.
- The undefined "EX24 A.9" in the plan's GS.7 transport node is replaced by "GeL (proof of Proposition 3.2)".
- The GL₂ monodromy example now contrasts the Steinberg representation with the trivial character; both have Weil part |·|^{1/2} ⊕ |·|^{−1/2}. The earlier wording used "the principal series".
- The weak Check "constant term is a sum over the unipotent quotient" (GS.0.14) is replaced by a non-example: the characteristic function of O ⊕ O is finitely supported but not cuspidal.
- GS.5.13 (conjectural multiplicity spaces) is phrased as "formulate as a named conjecture"; nothing depends on it.
- GS.7.11 states the LL route explicitly: Theorem VII.3, Proposition VII.4 and Corollary VII.5, pp. 195–197, checked in the author copy.
- The HeckeStacks/ExcursionOperators realization is a remark only.

## Checks run

- `lean-check …/packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean`: exit 0, 9 `declaration uses sorry` warnings and no other output (Mathlib 082e2d37e8, shared build). All `example`s are proved. The ℓ⁻¹ non-example is the named theorem `not_heckeFinite_inv_ell` (sorry), referenced in README §GS.3.2. Free memory at the time: about 80 GB available.
- `python3 scripts/check_sorry_data.py` on the Lean file: exit 0.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems; no local paths.
- Scripted checks:
  - every kept plan anchor and API name is present;
  - every Checks block has at least 3 items;
  - 364 internal links with none broken;
  - every Lean declaration name cited in the README exists in `Suggested.lean`;
  - math asterisks and shift brackets (such as `[2r](r)`) are escaped so they do not render as emphasis or links;
  - a process-word scan is clean.
- Sources re-fetched and hashed: VL v10 and LL (hashes match the plan), Richarz, Laszlo–Olsson I/II/P and Sun. These were read only in scratch; nothing from them is copied.

## Remaining

Nothing for this job. Points for the reviewer:

- GS.1.4 is new and has no plan node; its four Checks are B G_m unboundedness, B Γ and B G_m point counts, and the scheme case.
- The AL.3 citations are to TauCetiRoadmap PR #924 at head `d1996dc1`; the atlas copy of the AL package is older and lacks these subsections.

No suspicious instructions were found in issue comments or fetched texts.
