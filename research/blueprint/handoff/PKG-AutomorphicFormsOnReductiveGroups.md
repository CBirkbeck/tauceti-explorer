# Handoff: PKG-AutomorphicFormsOnReductiveGroups (#10159)

Claude (Opus 5.5), session `claude-v8lr5T`, 2026-10-17. Complete package submission, not a checkpoint.

## Starting point and method

The three package files already held a complete package written by the earlier `PKG-AutomorphicFormsOnReductiveGroups~codex` job (#10141, merged in #10151) against the same accepted plan (revision 5, accepted by `REV-AutomorphicFormsOnReductiveGroups~5`). Its form and density were good, so this job revised it rather than rewriting it: every node of the accepted packet was checked against the README, every supplier attribution against the supplier's current README, a sample of 84 source locators against the sources, and the Lean file was rewritten to the upstream form. The packet, reader and plan-stage suggested file were not edited.

Cross-checks were delegated as WORKERS.md allows: four Sonnet agents (node-by-node plan coverage in three groups; supplier-contract verification against the supplier READMEs) and three Haiku agents (locator retrieval from downloaded arXiv/author texts). Every finding used below was re-read in the source or supplier text before it was acted on; the cleared Corvallis volume and Pilloni's paper were read in place.

## What changed

**Supplier contracts (27 attributions were wrong or unsupported).** Rewritten section "Exact supplier contracts" and every dependency line:
- Hecke characters come from GlobalNumberFields Layers 9–10 (ClassFieldTheory defines none); `F\𝔸_F` compactness from GlobalNumberFields Layer 5.
- IntegralLattices concerns integral quadratic lattices; the p-adic lattice algebra of §5.6 is now built on Mathlib submodules.
- LieGroups: exponential map is Layer 0; Layer 9 assumes a given maximal compact. Existence/conjugacy of maximal compacts is ArithmeticLocallySymmetricSpaces ALS.F.1/ALS.0.3.
- RootSystems does not build root/weight lattices (LieHighestWeight Layer 2 does; character lattices of tori are ReductiveGroups Layer 7). DifferentialGeometry's exterior derivative is Layer 1.
- SmoothRepresentationsOfLocalGroups: idempotents and nondegenerate Hecke modules are SR.1 (SR.1.1, SR.1.3), Satake SR.4.1; SR does **not** state `dim π^K ≤ 1`, newvectors or Flath.
- AdelicAlgebraicGroups: quotient measures in stages / Weil's formula are §2.2 (used for constant-term transitivity); admissible maximal compact with hyperspecial factors at almost all places is §3.1; unipotent quotient compactness §3.4. It does not state a volume bound for height balls or the character duality of `F\𝔸`.
- OperatorTheory has no compact-operator spectral theorem (not needed: cuspidal discreteness is ALS.F.6); Banach spaces are Mathlib's.
- ArithmeticLocallySymmetricSpaces is cited by its own labels (ALS.F.1, ALS.F.5–F.7, ALS.4.5, ALS.1/3/5a/5b). The old "Downstream consumers" claim that ALS consumes this roadmap was false (ALS takes its automorphic inputs as hypotheses); the section was rewritten from the packet's `uses` records.

**Missing inputs made targets here (consumers of these may import them from this roadmap):**
1. §2.2 `reductiveHarishChandra`: LieHighestWeight has the isomorphism only for Killing-semisimple algebras (Layer 7); Layer 9 has the reductive splitting but no isomorphism.
2. §0.3 `integrable_height_rpow_neg` (polynomial volume of height balls in `G∞`, via `KAK`); used by the Schwartz/smoothing estimates.
3. §4.3 `addChar_equiv` (character duality of `F\𝔸_F` and Fourier expansion), used by every Fourier/Whittaker expansion. This may belong upstream in GlobalNumberFields eventually (upstream note).
4. §3.5 `finrank_spherical_le_one` (as the plan has it: commutativity from SR.4.1 + SR.1.3 corners + Schur).
5. §2.4 `IrrAdmissible` (the plan's parent node of the real classification), §6.7 the Siegel parabolic named explicitly, §5.1 Chenevier–Taïbi's `±1` algebraicity convention (`IsAlgebraicCT`).
The earlier package's moves stay: the Hermitian datum (from ShimuraData), archimedean Weil groups, Whittaker and K-Bessel interfaces (from AutomorphicLFunctionsAndLocalFactors), and discrete occurrences with the finite-jet Eisenstein realization (from AutomorphicSpectralTheory). The README cites no higher-tier roadmap as a supplier.

**Plan Checks restored.** About 110 plan tests and acceptance items that the earlier README had dropped were verified and added as Checks (all 48 subsections now have 4–13), with the corresponding missing hypotheses and API sentences (e.g. `R(y∞)R(X)R(y∞)⁻¹=R(Ad(y∞)X)`, the general `vol(J)` Hecke formula, Sobolev norms and order, every irreducible `(𝔤,K)`-module admissible, VZ K-type support, the `GL₂` compact Cartan matrices, `π(λ,C)*` formula, Hecke-character conductor, `S(J,M)` for definite unitary groups).

**Corrections where the README contradicted the plan** (resolved in favour of the source):
- Mirković check: now "trivial `SL₂(ℝ)` has coherent `H⁰=ℂ` and is not a (limit of) discrete series"; added the tempered principal series with no coherent cohomology.
- `E(k,1)` exists and is neither discrete series nor limit (Pitale–Schmidt §2.3, p.6); README previously declined to assert existence.
- Essential square-integrability: twist by a positive character of `G/[G,G]` (plan wording) instead of an unspecified central norm twist.
- Misplaced §6.8 Check at the head of Layer 7 moved back; loose-list blank lines and one duplicate Check removed.

**Locators corrected** (checked in the texts): Bernstein–Krötz section pages (§2.4 pp.9–10, §2.5 pp.11–12, §4 pp.20–23, Prop 9.6 p.40, §5.3.1 p.27); Getz Lemma 6.19/Remark 6.20/§6.5 on p.33, Theorem 7.11 (products, p.37) moved to the product paragraph, restriction of scalars now Borel–Jacquet §4.1 p.194; Flath's `(𝔤,K)` Hecke algebra is §3, p.182, global discussion pp.181–182; Pilloni §§15.2.1–15.2.2 pp.107–108; Pitale–Schmidt §2.1 pp.2–4; the two Calegari–Geraghty papers are now distinguished (beyond-TW §8.4 p.80; nonregular-symplectic Thm 5.5 pp.21–22, Thm 7.11 pp.39–40), and §6.3 now cites the GSp₄ coefficient formula's source (CG nonregular §5.3, Thm 5.5); Ding's coefficient setup is arXiv **v2 §4.2.2, pp.71–72** (v2 has no §5.1.1); Chenevier–Taïbi §2.1 pp.12–13; Harder–Raghuram Prop 3.11 pp.18–19; BCGP21 Thm 3.10.1 p.70, proof pp.72–74.

## Mistakes in the accepted plan (packets not edited)

- AF.4/vogan-zuckerman: the plan's `⟨α,λ|_𝔟⟩≥0` should be `⟨α,λ|_𝔱⟩≥0` (Vogan–Zuckerman (5.1)(b), p.73, read in the scan). README keeps `λ|𝔱`.
- AF.4/bhr-coherent-cohomology: the plan says vanishing outside the quoted degree is not in Harris; Harris Theorem 3.4(i), p.63, states it. README keeps "zero otherwise".
- AF.3/maass-cusp-forms: plan's `r∈i(0,1/2]` includes `λ=0`; README keeps `0<t<1/2`.
- AF.1a/gk-pair, AF.4/hermitian-positive-system: the plan quotients by the rational split centre `A∞`; for `Res_{F/ℚ}GSp₄`, `d>1`, `Kʰ/A∞` is not compact. README keeps the full real split centre `A_h` (agrees for `F=ℚ`).
- AF.2/spherical-dimension-one and the packet's SR requests: the dimension bound is not an SR export (see above).
- Requests naming ClassFieldTheory/IntegralLattices/RootSystems for Hecke characters, lattices and weight lattices point at the wrong suppliers.
- AF.4 locators to Ding "§5.1.1" do not exist in the current arXiv version (v2: §4.2.2).
- Errata candidates already handled in the README: Getz Prop 8.6 prints `dim V^K=1` (should be `≤1`); Pilloni Theorem 15.2.2.1(2) prints `λ₁≥R` for a negative `λ₁` (the sign-corrected `−λ₁≥R` is used, as §15.2.3 on p.108 confirms with `k=−λ₁−1≥R−1`).

## Duplication check

TauCetiRoadmap main at `350e970` (read through the GitHub API; the local checkout is on a PR branch) has new roadmaps since the atlas snapshot; MassFormula (Serre's local mass formula), CompactOperators (nonarchimedean Fredholm theory), BanachSpaceTheory and HeightsAndUnits do not overlap. Supplier PR heads read: ALS #871 `e7e16145`, AdelicAlgebraicGroups #792 `241d5d6`, ReductiveGroupsPartII/SR #785 `f24efef`. Current Tau Ceti `a91d3aaf` has no automorphic, `(𝔤,K)`, Weil-group, restricted-tensor or Maass material; `TauCeti.hcProjection`, `lift_hcProjection`, `vermaCentralCharacter_dotAction`, `twistedHeckeSlashModularFormCharEnd` and `TauCeti.GlobalNumberFields.HeckeCharacter` exist there (not at the pin f790474) and are cited as current-library names only.

## Adversarial pass (sample of the computations re-done)

| Statement | Instances | Result |
| --- | --- | --- |
| `D_k` compact basis, Casimir | `k=1,2,12`: `−1/4, 0, 30`; `[X_c,Y_c]=H_c` with explicit matrices | correct |
| SL₂ principal series | `δ^{1/2}` at `t=2`; reducibility `ν≡ε+1`; four irreducibles at trivial character | correct |
| `ℓ₀,q₀` of `Res PGLₙ` | PGL₂/ℚ (1,0), imaginary quadratic (1,1), PGL₃ (2,1), real-quadratic torus (0,1), SL₂(ℂ) defect 1 | correct (Lean `decide`) |
| Clozel weights | `n=2,k=12`: raw −10, `w_C=−11`, twist 5 | correct |
| GSp₄ coefficient | `σ=(−b,−a;a+b+2c)` checked against CG Thm 5.5 proof; chamber union; `(3,2)` limit, `(4,3)` regular | correct |
| Separation | `(20,10)`, `(12,12)`, `(12,2)`, `(5,0)` | correct (Lean `norm_num`) |
| GL₂ adelization | constant term `a₀y^{k/2}`; raising `R(U)φ_f=2iφ_{δ_kf}` derived; `τ(2)=−24` vs `R₂=−3/4` | correct |
| Bessel ODE | `K_{1/2}`, `11/4−3/2−5/4=0` | correct |
| Maass dataset | `r=9.53369…` gives `λ≈91.14`; parities | correct |
| Volume estimate | `ℝ_{>0}`: `2/r`; SL₂ threshold `r>2` | correct |
| `ψ_ℚ` on `ℚ` | `x=1/3`, sign test | correct |
| Hecke/Iwahori | `dim St^I=1`, `dim π^I=2` | correct |

## Lean

`lean-check research/blueprint/packages/AutomorphicFormsOnReductiveGroups/Suggested.lean`: exit 0, 471 lines, 20 warnings, all "declaration uses `sorry`" (thirteen theorems and seven examples). A scratch copy with a `run_cmd` audit (examples renamed to theorems) found no `sorry` in any statement type and no sorry'd definition body among the 101 constants. Changes: upstream header with design choices, `/-! ## Layer k -/` sections in README order, `HasCentralCharacter` moved to Layer 3, the arithmetic-only examples that tested no declaration removed, the easy examples proved, and new light definitions `IsLAlgebraicGL`/`IsCAlgebraicGL` (with `isCAlgebraicGL_iff_twist`) and `ell0ResPGL`/`symDimResPGL`/`q0ResPGL` (with `two_q0_add_ell0`), all named in the README.

## Checks run

`python3 research/blueprint/intake.py check-files` on the four files: 0 problems. Process-word sweep of the README: clean. Inline-code backticks balanced.

## Left for the review

- Locators not re-checked here: Clozel (scan; Lemme 3.14, 4.9, Théorème 3.13, Props 3.1–3.2, 3.16), Knapp (scan), Langlands's classification paper (IAS host refuses downloads), Duke–Imamoğlu–Tóth (Annals, not fetched), Kostant, Casselman's SL₂ notes (no printed page numbers; PDF pages used), Badulescu–Renard.
- Plan items not carried over: the Ichino–Prasanna compatibility test for cohomological representations and its locator (source not fetched), the explicit `U(p,q)` Hodge-type example, Arthur's trace-formula locators and Lapid's multiplicity reference.
