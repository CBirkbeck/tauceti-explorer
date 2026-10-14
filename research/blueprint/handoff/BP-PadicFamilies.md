# BP-PadicFamilies: completion pass (Claude — claude-LgrPjn)

Claude (Opus 5.5), session `claude-LgrPjn`, 14 October 2026. Refs #965; the bot confirmed the claim.
**Status: complete.** Every stage is planned at target level; L0a is closed.

**Totals.** 121 nodes (12 definitions, 41 constructions, 47 theorems, 16 lemmas, 5 comparisons), 252 API items, 194
unit tests, 38 planets (at most six per layer), 69 baseline declarations, 13 requests, 8 gaps, 14 source issues.
`check_blueprint.py`: 0 errors, 0 warnings. The pass added 49 nodes to the 72 of checkpoints 1–5.

**Lean.** `suggested/PadicFamilies.lean` elaborates with `lean-check` against Mathlib 082e2d3 (shared pinned build):
0 errors, 77 warnings, all `declaration uses 'sorry'`. New real-bodied definitions: `IsLocallyFiniteEnd`,
`augmentationAnnihilator`, `congruenceSubmodule`, `congruenceModule`, `congruenceIdeal`; nodes whose carriers are
not in the pinned libraries (rigid spaces, Banach modules, Hilbert forms, big Galois representations) are recorded as
signature comments, as in the earlier checkpoints.

## Stage status

| Stage | Status | New in this pass |
|---|---|---|
| L0 | planned | Λ-adic forms and duality with h^ord; primitive components (Hida §3); compact Nakayama (moved down) |
| L0a | closed | Pilloni §2 and BCGP §2.11: locally finite endomorphisms, e = lim T^{N!}, exactness, derived version, ordinary direct factor, semilocal reading |
| L1 | planned | generic congruence module and ideal; reduced Hida algebra and branches; family congruence modules; change of trivialisation; branch L-functions (EPW §§2.6–4.3) |
| L2 | planned | the eigencurve C^± from overconvergent modular symbols (Bellaïche §3), eigensymbol sheaf, classicality, étale freeness, comparison with C |
| L2a | planned | projective characteristic polynomial (gap closed), coherent eigenmodule sheaf (gap closed), spectral hypersurface and variety of a complex (Pilloni §13.1, BCGP §6.1.1) |
| L3 | planned | L2 stage citation replaced by L2 nodes |
| L4 | planned | Hida's big Galois representation, ordinary filtration, family Selmer groups and complex, Beilinson–Kato classes, big logarithm, Ochiai's two-variable L-function and Theorem C, Coleman-family regulator |
| L5 | planned | quaternionic projector, T_∞(U, 𝒪), level independence, tower duality and period modules (moved down); Λ-adic Hilbert forms and the three DKV facts |

## Maintainer-added sources

- **Dasgupta–Kakde–Ventullo (L5).** The three facts are nodes: `L5/hida-family-fourier-embedding` (§3.3, p. 850),
  `L5/hilbert-hecke-reduced` (§4, p. 857) and `L5/hecke-total-fraction-ring` ((50)–(51), p. 857), on
  `L5/lambda-adic-hilbert-forms` (§3.1, pp. 846–847).
- **Pilloni (L0a, L2a).** §2 in its general form: `L0a/locally-finite-action` (Definition 2.1.1),
  `locally-finite-stability` (Lemma 2.1.1, Remark 2.1.1 as failure test), `locally-finite-mod-maximal` (Lemma 2.1.2),
  `locally-finite-ordinary-projector` (Lemma 2.1.3), `locally-finite-projector-exactness` (Lemma 2.1.4),
  `locally-finite-derived-endomorphism` (Definitions 2.3.1–2.3.2, Proposition 2.3.1), `derived-ordinary-direct-factor`
  (Lemma 2.3.2, Remark 2.3.1), `semilocal-ordinary-projector` (sourceIssue E13 = PAPER-PILLONI-20/E5). Lemma 2.3.1,
  the minimal subcomplex and Propositions 2.2.1–2.2.2 are DeformationAndDerivedPatchingAlgebra P7 nodes, cited
  (`p7ii-complete-flat-*`). §13.1: `L2a/complex-spectral-hypersurface`, `L2a/complex-spectral-variety`;
  Proposition 13.1.3.1 is LocallyAnalyticDistributions L4/finite-slope-euler-local-constancy, cited.
- **BCGP (L0a, L2a).** §2.11 (Definition 2.11.1, Lemmas 2.11.2–2.11.4, the D^flat paragraph) is cited on the same L0a
  nodes; §6.1.1 and Theorem 6.3.16 on the L2a complex nodes. Khare–Thorne Lemma 2.12 (Remark 2.3.1) is compared in
  `derived-ordinary-direct-factor`. Urban (Ann. of Math. 174, 2011) and Coleman (Invent. Math. 127, 1997) are reached
  through LocallyAnalyticDistributions L4, which plans their slope theory; they were not read here.

## Red-team findings handed to this job

- **RT-AREA-langlands-1/8 (Igusa routing).** No PadicFamilies node cites IgusaVarietiesAndTorsionConcentration IG.1.
  The q-expansion input of `L5/lambda-adic-hilbert-forms` is `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor` (the
  ordinary tower of the dual canonical subgroup). The IG.1 → PadicFamilies:L5 stage edge in the atlas should be
  removed by the fix of that finding (it is outside this packet).
- **RT-AREA-langlands-1/27 (congruence modules).** IntegralHeckeAndGaloisDeterminants is now a TauCetiRoadmap pull
  request and the IKM24 Part II of DeformationAndDerivedPatchingAlgebra has no design job, so neither suggested owner
  exists here. The generic codimension-zero congruence module Ψ_λ(M) and congruence ideal η_λ are planned once in
  `L1/congruence-module` and `L1/congruence-ideal` (with the Iyengar–Khare–Manning comparison, Proposition 2.10 and
  Example 2.11). AutomorphicCongruences L0, SerreWeightAndLevelOptimisation R20.1 and IntegralIwasawaTheory I.5 should
  cite these nodes and keep only their instances. The higher-codimension Ψ_A(M) stays with the proposed Part II.

## Notions moved down (upstream order: this roadmap is tier 16)

- From **OrdinaryAutomorphicFormsAndModularityLifting R21.1** (tier 20) to L5: `quaternionic-ordinary-projector`,
  `nearly-ordinary-hecke-algebra`, `ordinary-level-independence`, `ordinary-towers-duality`. R21.1's nodes of the same
  names should be pointed at these.
- From **OrdinaryAutomorphicFormsAndModularityLifting R21.3** to L4 (for F = ℚ): `ordinary-big-galois-representation`
  (Hida's big Galois representation); R21.3 keeps the totally real Skinner–Wiles representation and its deformation
  theory.
- From **NoncommutativeAndEquivariantIwasawa NE.0** (outside the 94) to L0: `compact-nakayama`.
- Remaining citations outside the lower tiers: HodgeTateAndCanonicalSubgroups T5 (same tier 16, one citation, required
  by RT-AREA-langlands-1/8) and KatoEulerSystems (outside the 94; L4 only, which Caraiani–Newton does not need).

## Not replanned (existing upstream work, cited by node)

IntegralHeckeAndGaloisDeterminants (TauCetiRoadmap PR #789) IHG.2 `factorial-localizing-idempotent`,
`ordinary-localization-comparison`, `derived-idempotent-splitting`, `finite-hecke-local-factors`; IHG.0
`finite-projective-determinant`, `cayley-hamilton-identity`; IHG.4 `classical-interpolation`. L0a's
`ordinary-idempotent-finite-algebra` now derives from IHG.2's factorial powers.

## Requests and gaps

- Request to DeformationAndDerivedPatchingAlgebra P7 removed: its nodes now exist and are cited.
- Requests extended: PadicMeasuresIwasawaAlgebras L0a (universal character on an affinoid, for L2); ModularCurvesPartII
  R14.6 (Mazur–Wiles connected–étale filtration of the ordinary part of J₁(Np^t), for L4).
- Gaps closed: "Characteristic polynomials over finite projective modules" (IHG.0), "Coherent eigenmodules and nonflat
  specialization" (`L2a/coherent-eigenmodule-sheaf`). Gap rewritten: the Coleman–Mazur gap now covers only
  `L2/coleman-mazur-comparison`. New gaps: Hida/Wiles big Galois representation proofs; Ochiai's Coleman map (Amer. J.
  Math. 2003); nonordinary family inputs (Liu, Kedlaya–Pottharst–Xiao, Andreatta–Iovita–Stevens).
- New source issues: E12 (Bellaïche admits Proposition 3.6), E13 (Pilloni §2 local hypothesis applied to a semilocal
  ring; known as PAPER-PILLONI-20/E5), E14 (Bellaïche's (10) misdescribes modular symbols as a finite sum of
  invariants; L2/family-modular-symbols states specialisation with its Tor terms, and L2's open items ask for the
  universal-coefficients argument).

## What a follow-up does

- L2a: decompose Bosch–Lütkebohmert I Proposition 4.7 and II Theorem 5.2, Corollary 5.3 (now in the cleared library)
  and refine the slope cover to the corrected Buzzard Lemma 4.5 (E1–E4).
- L2: plan Coleman's overconvergent modular forms or route them to an owner; read Chenevier (Duke 2005); prove the
  specialisation of family symbols with its Tor terms (Hansen's universal coefficients), replacing Bellaïche's (10).
- L4: read Hida (Invent. 1986), Wiles (Invent. 1988) and Ochiai (AJM 2003) when obtainable.
- L5: Hida's control in weight > 2 (ASPM 17); the indefinite Hilbert cohomology instance (R18.4).

## Sources read in this pass

Pilloni (Duke 2020, author's copy in the cleared library) §2 and §13.1–13.2; BCGP arXiv:1812.09269v3 §2.11, §6.1.1,
§6.3.15–6.3.16; Dasgupta–Kakde–Ventullo (Annals, published PDF) §§3.1, 3.3, 4; Bellaïche arXiv:0912.2925v1 §§2.1 and 3;
Emerton–Pollack–Weston arXiv:math/0404484v1 §§2.3, 2.6–2.8, 4.2–4.3; Hida (ÉNS 1986) §3 and §4; Ochiai (AIF 2005) §1;
Kings–Loeffler–Zerbes arXiv:1503.02888v6 §8.2; Loeffler–Zerbes arXiv:1506.06703v2 §§4.6, 6.3–6.4, 7.1; Iyengar–Khare–
Manning arXiv:2206.08212v3 pp. 16–17. Hashes and dates are in the packet's `sources` and `sourceVersions`.

# BP-PadicFamilies: checkpoint 5 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #965; the bot confirmed the claim. **Status: partial.**

Checkpoint 5 plans L1 from Emerton–Pollack–Weston, *Variation of Iwasawa invariants in Hida families*
(arXiv:math/0404484v1; Invent. Math. 163 (2006)), §4.1. It has 6 nodes and 3 planets:
- **`ordinary-family-symbol-module`** (planet): M_m = lim H₁(X₁(Np^r))^ord_m, equal to the relative-homology limit at
  non-Eisenstein m, with its ± decomposition.
- **`family-symbol-control`:** Hida's (4.2) and M_m/ω_{r,k} ≅ (M_{r,k})_{m_{r,k}}. Hida's 1986 and 1988 papers were not
  obtained, so this is a **gap**.
- **`family-symbol-free-rank-one`** (planet): EPW Proposition 4.1.1. It uses Wiles' mod-p multiplicity one, requested
  from ModularCurvesPartII R14.6.
- **`family-period-line`:** RS-08's line-bundle view of periods. θ^± is unique up to T_m^×, and mod ℘ it is the
  saturated period lattice of ModularSymbolsPadicLFunctions L1.
- **`family-measure`** (planet): µ(a + p^rℤ_p) = U_p^{−r}{∞, a/p^r}, L^±(m, N) and L(m, N, ω^i).
- **`family-measure-specialisation`:** EPW Proposition 4.1.4, compared with ModularSymbolsPadicLFunctions L2.

**New requests:** ModularCurvesPartII R14.3 (homology of X₁(M)), R14.6 (multiplicity one) and ModularForms Layer 8
(modular-symbol paths).

**Lean.** One checked test (the distribution index identity); 0 errors.

**Totals.** 72 nodes, 105 API items, 78 unit tests, 25 planets, 14 requests, 7 gaps and 11 source issues.
`check_blueprint.py`: 0 errors, 0 warnings.

# Checkpoint 4 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #965; the bot confirmed the claim. **Status: partial.**

Checkpoint 4 plans L5 (Hida theory over totally real fields) from Skinner–Wiles, *Residually reducible
representations and modular forms*, Publ. Math. IHÉS 89 (1999), §3.2. It is a Numdam open-access scan with an OCR
text layer; the sha256 is recorded, and the formulas were read on the page images. There are 5 nodes and 3 planets:
- **`totally-real-weight-algebra`** (planet). G(U) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U). δ_F is the rank of the free part of Z(U),
  which is 1 + the Leopoldt defect. Λ′_𝒪 has δ_F + d variables, 𝒪[[G(U)]] is finite free over it, and the weight-two
  arithmetic points are dense.
- **`hida-freeness`** (planet): Proposition 3.3. M_∞(U) and M⁺_∞(U) are free over Λ′_𝒪 when the action is free.
- **`hida-hecke-finite`**: Corollary 3.4. T_∞(U, 𝒪) is finite and torsion-free over Λ′_𝒪, semilocal and complete.
- **`hida-control-nearly-ordinary`** (planet): Proposition 3.7. It gives parallel weight (μ + 2)·t. The weight-two case
  is proved from the definitions; for μ > 0, Hida [H2, Corollary 2.5] is cited and unread, and recorded as a gap.
- **`algebraic-primes-dense`**: Lemma 3.8 and Corollary 3.9, with the lying-over and dimension step written out.

**Division of labour (RS-08).** The quaternionic modules, the ordinary projector on them and the towers M_∞, H_∞ belong
to OrdinaryAutomorphicFormsAndModularityLifting R21.1 (PR #3841, merged before this one); its nodes are cited directly.
- L5 proves Hida's theorems on those modules. This answers OAFML's request to PadicFamilies L5, except for Proposition
  3.7 in weight > 2 and Wiles' Λ-adic forms.
- OAFML R21.1's `quaternionic-nearly-ordinary-hecke-algebra` describes the Λ′_𝒪-structure itself. Its next checkpoint
  should cite `totally-real-weight-algebra` for Λ′_𝒪.

**New source issue: E11 (gap, reaches a stated result).** Proposition 3.3 states the rank
rank_𝒪 eH⁰(X(U⁰_1), 𝒪) × #G(U)_tors, and its proof says it "clearly suffices" to prove the claim without e.
- Removing e only gives projectivity over 𝒪[G(U_a)]. Constant rank needs the components of all prime-to-p torsion
  characters to agree, which the argument does not show.
- Freeness over Λ′_𝒪, the only form used downstream, does follow.
- Hida's [H2] was not obtained: Project Euclid refused automated access. The Lean file has a ℤ/6 model of
  projective-but-not-free.

**New gap:** Hida's control theorem in weight μ + 2 > 2.

**New requests:** HilbertModularVarietiesAndShimuraCurves R18.3 (free action at an auxiliary prime, invariants under
free action) and GL2AutomorphicRepresentationsAndTransfer R16.6 (Hilbert cusp forms).

**Lean.** An L5 section adds `weightVariables`, `NearlyOrdinaryWeightAlgebra` (an `MvPowerSeries` abbreviation), three
checked tests and signature comments. It compiles with 0 errors, and the 60 warnings are all for `sorry`.

**Totals.** 66 nodes, 93 API items, 69 unit tests, 22 planets, 56 baseline declarations, 11 requests, 6 gaps and 11
source issues. `check_blueprint.py`: 0 errors, 0 warnings.

## L5 remaining

- Hida's control in weight > 2 (the gap above), from Hida, Ann. of Math. 128 (1988) and ASPM 17 (1989).
- The indefinite Hilbert and Shimura-curve cohomology (R18.4), and odd-degree F.
- Residual localisation and trace in p-power level beyond the quaternionic towers.
- Period modules as invertible modules.
- The comparison of the F = ℚ slice with L0.

# Checkpoint 3 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #965; the bot confirmed the claim. **Status: partial.**

Checkpoint 3 plans L3 (critical specialisation) from Bellaïche, *Critical p-adic L-functions*, arXiv:0912.2925v1
(Invent. Math. 2012), with 14 nodes:
- **Refinements:** critical-slope, critical and θ-critical refinements (Definition 2.13), their equivalences (Proposition
  2.12) and the classification (Proposition 2.14).
- **Geometry:** decency (Definition 1, Proposition 2.15) and smoothness of the eigencurve (Theorem 2.16).
- **Symbols:**
  - the θ exact sequence;
  - rank-one freeness of family symbols (Propositions 4.3–4.5);
  - the local Hecke algebra ℚ̄_p[t]/(t^e) (Theorem 4.7);
  - Bellaïche's theorem (Theorem 1, Corollary 4.8).
- **L-functions:**
  - the critical p-adic L-function;
  - θ-critical vanishing (Theorem 2);
  - infinitely many zeros (Corollary 1);
  - two-variable L-functions (Theorem 3);
  - secondary L-functions.

## L3 remaining

- PadicFamilies L2 (the modular eigencurve and overconvergent forms) is used as a stage prerequisite and is not yet planned.
- Cited inputs, not decomposed:
  - Breuil–Emerton;
  - Bellaïche–Chenevier;
  - Coleman's limit control theorem;
  - Chenevier's smoothness argument;
  - H¹_g vanishing (Kisin, Weston, Rubin).
- Pollack–Stevens' critical-slope paper was not obtained.
- The Eisenstein exceptional value.

## Requests added

GlobalGaloisDeformations R04.3: H¹_g(ad ρ_f) and refined deformations.

# Checkpoint 2 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #965; the bot confirmed the claim. **Status: partial.**

Checkpoint 2 plans layer L0 from Hida, Ann. Sci. ÉNS 19 (1986), §§1–5 and §7, with 13 nodes:
- Katz's p-adic modular functions and the q-expansion principle;
- the p-adic closure of classical forms (Katz Theorem 1.1, Corollary 1.2);
- Hecke operators and the weight action;
- the universal Hecke algebra;
- the ordinary idempotent, as an instance of L0a;
- Hecke/forms duality (Proposition 2.1, Theorem 2.2, Corollary 2.3);
- the weight algebra Λ with arithmetic points;
- Jochnowitz's lemma;
- mod-p weight independence (Theorem 4.2) and finiteness over Λ (Corollary 4.2);
- Hida's control theorem (Theorem 3.1, Corollary 3.2);
- the ordinary Eisenstein family, imported from DirichletPadicLFunctions L4 per RS-08;
- classical specialisation, with p-stabilisation from ModularSymbolsPadicLFunctions L2.

## L0 remaining

- **Katz's theory.** The Igusa tower and the p-adic q-expansion principle are imported through Hida's review; Katz's
  papers are not freely available.
- **Local components.** Finite flatness and Gorenstein questions for residually localised components: Hida §§5–6, Wiles
  1988 and Mazur–Tilouine.
- **Wiles's definition.** Wiles's Λ-adic forms and their equivalence with Hida's Hecke-algebra definition.

## Requests added

- ModularCurvesPartII R13.2 and R12.5: moduli of trivialised elliptic curves, and ω^k with Hecke normalisation.
- PadicMeasuresIwasawaAlgebras L1: Λ and its power-series coordinate.

## Lean

`suggested/PadicFamilies.lean` gains an L0 section:
- the q-expansion U_p operator;
- the arithmetic points P_k in ℤ_p[[X]], with tests.

The whole file (Mathlib-only) elaborates against Mathlib 082e2d3 with the pinned toolchain: 0 errors, and the only
warnings are for `sorry`.

# Checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #965; the bot confirmed the claim. **Status: partial.**

| Stage | Coverage |
|---|---|
| L0a | `source_decomposed` (20 nodes) |
| L2a | `partial` (the 14 reviewed nodes carried and completed) |
| L0, L1, L2, L3, L4, L5 | `not_read` |

RS-08 is accepted, and its `keeps` are followed: L0a owns the factorial projector API, which R21.1 imports.

## Closed in this checkpoint

**L0a.** All of Khare–Thorne §2.4 (Lemmas 2.10–2.15) is planned, with Hida (1986) §1 and ACC+ §5.2.
- **Finite modules (finite-set argument):**
  - `factorial-iterate-stabilises`: f^[n!] = f^[|X|!] for n ≥ |X|.
  - The projector e_U = U^{|M|!}.
  - Its identification with Mathlib's Fitting decomposition.
  - Invertibility and nilpotence on the two parts.
  - Uniqueness, naturality, exactness and quotients.
  - Localization at U (ACC+ Proposition 5.2.15).
- **Profinite modules:**
  - Finite quotient systems.
  - The projector as a limit of finite projectors, with the threshold |M/J|.
  - The decomposition, with topological nilpotence and no uniform exponent.
  - Uniqueness, and naturality for maps respecting the systems.
- **The adic instance:** noetherian local rings with finite residue field. It carries the R = ℂ, U = 2 failure test.
- **Exactness:** exactness for limits of finite exact sequences by compactness, then the profinite exactness theorem.
- **Complexes:**
  - Complexes and cohomology.
  - The idempotent e_t ∈ R[t] of an element of a finite algebra.
  - Khare–Thorne Lemma 2.12 in the homotopy category (the degreewise ordinary part splits e).
  - Khare–Thorne Proposition 2.15 along towers.

**L2a.** The fourteen nodes of the integrated decomposition are carried with their ids and texts. This checkpoint
adds:
- their prerequisites;
- re-verified excerpts, taken from the PDF text layer with ligatures as printed; twelve of the earlier excerpts were
  normalised paraphrases;
- API and at least three unit tests for each of the six constructions;
- source issues E1–E9 for Buzzard's printed defects, which were previously recorded in nodes and one gap.

**Source issues.** E10 records Khare–Thorne's T₂ ∈ End_R(M) misprint in Lemmas 2.10(2) and 2.11(2). It is in both
v1 and v2.

## Remaining, precisely

- **L2a.**
  - The Bosch–Lütkebohmert and Conrad formal-model inputs (gap).
  - Refine `strict-slope-neighborhoods` and `admissible-slope-cover` to declaration granularity with the corrected
    inequalities.
  - The coherent eigenmodule sheaf with its Tor and generalized-eigenspace comparisons (gap).
  - The characteristic polynomial over finite projective modules used by `slope-polynomials` (new gap: Mathlib's
    `LinearMap.charpoly` needs a free module).
  - Conrad's irreducible components and Coleman–Mazur 1.3.11 (gap).
- **L0.** RS-08's narrowed scope:
  - the ordinary tower and the q-expansion principle;
  - the U_p instance of L0a;
  - control over the weight Iwasawa algebra;
  - the Eisenstein family from DirichletPadicLFunctions L4;
  - specialisation.

  Read Hida (1986) §§2–3, Wiles (1988) and Emerton–Pollack–Weston (arXiv math/0505193).
- **L1.** The ordinary symbol module, period and congruence modules, and the cyclotomic measure.
- **L2.** The modular instance: Coleman–Mazur Chapters 2–7 and Buzzard §§6–7.
- **L3.** Bellaïche (Invent. Math. 2012) and Pollack–Stevens (critical slope).
- **L4.** Family Selmer complexes, regulators and big Kato classes.
- **L5.** The Hilbert instance, with Khare–Thorne §6 and Hida (Annals 1988).

## Requests made

- **DeformationAndDerivedPatchingAlgebra P7:** minimal complexes and the gluing of good complexes and homotopy
  classes (Khare–Thorne Lemmas 2.3, 2.13, 2.14).
- **AdicSpacesPartII R0, R2, R3:** Tate algebras, formal-model finiteness, and coherent algebras with descent.
- **PadicMeasuresIwasawaAlgebras L0a:** the rigid weight space.

Cited directly as node prerequisites:
- AdicSpacesPartII:F0/finite-module-inverse-limit;
- ArithmeticGaloisDuality:R02.1/milnor-sequence and mittag-leffler-lim-one;
- LocallyAnalyticDistributions L4 Fredholm and Riesz nodes.

## Suggested Lean file

`suggested/PadicFamilies.lean` imports Mathlib modules only. It elaborates against Mathlib 082e2d3, run with the
pinned toolchain v4.34.0-rc2 and a single `lean` call: 0 errors, and the only warnings are for `sorry`.
- **L0a** is prototyped in full, with signatures, API lemmas and unit tests as `example`s.
- **Derived-category and tower statements** (Khare–Thorne 2.12 and 2.15) and **L2a** are recorded as signature
  comments, because neither library has rigid spaces or the P7 minimal-complex API.

## Sources

**Read:**
- Khare–Thorne, arXiv:1409.7007v2, §2.2 and §2.4 (v1 compared);
- ACC+, arXiv:1812.09999v2, §§5.1–5.2;
- Hida, Ann. Sci. ÉNS 1986, Numdam, introduction and §1;
- Buzzard, Conrad, Chenevier and Coleman–Mazur as listed in the packet (hashes re-verified).

**Missing:**
- the CUP 2007 print of Buzzard, so E1–E9 are unchecked there;
- the Amer. J. Math. print of Khare–Thorne, so E10 is unchecked there;
- Hida, Invent. Math. 85 (1986);
- Wiles, Invent. Math. 94 (1988).
