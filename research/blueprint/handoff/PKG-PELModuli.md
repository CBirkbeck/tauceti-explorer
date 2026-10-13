# PKG-PELModuli — roadmap package (complete)

Claude (Opus 5.5), session claude-tXfFZE, 2026-10-13. Refs #9185. This is the complete package, not a
checkpoint.

## Deliverables

- `research/blueprint/packages/PELModuli/README.md`: 3,059 lines, about 230 KB. It has an opening
  `**Summary.**` and the sections Scope and ownership, Conventions, Exact supplier contracts and How to
  read the build. Layers M0–M6 follow with 94 target subsections, each in prose with its API, exact
  hypotheses, locators, a `*Needs:*` line and a `**Checks.**` list. It ends with Worked examples,
  Downstream consumers and References.
- `research/blueprint/packages/PELModuli/Suggested.lean`: 399 lines. It holds light real-bodied
  definitions over carriers at the pins, the statable milestones (proved by `sorry`), the
  discriminating examples, and a closing list of the README-only targets.
  - Definitions: `IsPositiveInvolution`, `StarOrder`, `SymplecticOLattice` with `dualIndex` and
    `realForm`, `IntegralPELDatum`, `IsSimilitude`, `badPrimeInteger`/`IsGoodPrime`, `detPoly`,
    `SatisfiesDetCondition`, `IsGeneralizedCMType`/`IsCMType`, `IsNeatElement`, `siegelGram`/`siegelJ`,
    `hilbertPairing`, `unitaryTraceForm` and `OrderAction`.
  - It has no sorry'd data definitions.
- `research/blueprint/packages/PELModuli/metadata.toml`: `topic = "math.NT"`.

**Lean.** `lean-check research/blueprint/packages/PELModuli/Suggested.lean` ran in the shared build at
Mathlib 082e2d37e8. It exited 0, and its only warnings are `declaration uses 'sorry'`.

**Intake.** `python3 research/blueprint/intake.py check-files` on the three files reports 0 problems.

## Plan targets and changes against the plan

Every target of the accepted packet is in the README except `M6/quasi-projective-realization` (see
below). The packet ids map to README subsections in packet order, with these renumberings:
- M0.9 is new, so packet M0 targets 9–26 are M0.10–M0.27.
- M3.3 is new.
- M2.13 and M2.15 are new.
- In M4, the twisting target M4.2 comes before canonical-model identification M4.3, because the
  identification uses it.

### Upward citations removed (tier rule, `upstream/CaraianiNewton.md`: PELModuli is tier 13)

1. **HilbertModularVarietiesAndShimuraCurves H0/H1 (tier 14).** M5.4 is now a self-contained
   principal Hilbert datum:
   - The datum is `L = O_F ⊕ 𝔡⁻¹` with `ψ = Tr(x₁y₂ − x₂y₁)`; it is self-dual by `FractionalIdeal.dual`.
   - Its rational datum is checked against ShimuraData D5 (tier 12, lower).
   - Polarization modules `𝔠`, Deligne–Pappas models at ramified primes and Hilbert–Blumenthal moduli
     in general stay with HilbertModularVarietiesAndShimuraCurves, which imports M5.4 and the PEL
     machinery.
   - Follow-up for that roadmap: its H0/H1 nodes should cite PELModuli M5.4 for the principal case.
2. **ShimuraCompactifications C5 (tier 15).** `M6/quasi-projective-realization` consisted entirely of
   C5's theorem: Lan Cor. 7.2.3.10 (integral quasi-projectivity at neat level) plus ampleness of the
   Hodge line on the minimal compactification.
   - Nothing in this roadmap uses it.
   - It is removed as a target and stated in *Scope / Not here* as ShimuraCompactifications'.
   - M2.9 now says the universal family is an abelian algebraic space, and an abelian scheme étale
     locally.
   - The Siegel acceptance item "A_{g,1,n} quasi-projective over ℤ[1/n] (Mumford)" went with it. It
     needs GIT, which no lower-tier roadmap plans.

### Supplier contracts that the named supplier does not provide

Sonnet cross-checks of all 40 requests are summarized below; I read every cited supplier section
myself. These items were planned here as targets or proof steps:

- **AdelicAlgebraicGroups "AA.4 Part II".** Upstream AdelicAlgebraicGroups (now a TauCetiRoadmap
  roadmap) supplies only fppf `torsorClasses`, Kneser local triviality and the real Hasse principle for
  simply connected groups (§4.1). New **M0.9** covers:
  - continuous nonabelian `H¹(k, G)` and its comparison with `torsorClasses`;
  - twisting;
  - `ker¹(ℚ, G)` and its finiteness (Borel–Serre, as used by Kottwitz §8, p. 399);
  - Milne Lemma 8.20 (simply connected derived group reduction) and Lemma 8.21 (norm tori, through
    ClassFieldTheory L13 `cyclicHasseNorm` and ProfiniteCohomology L9 Hilbert 90).
  - It sits in M0 because M0.20 and M0.24 use it.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory "R07.2 Part II".** That package states that displays,
  Norman–Oort and BBM belong to PELModuli M2. New **M2.13** gives the BBM cokernel-length/height
  identity, and new **M2.15** gives Zink displays (Wedhorn §3.1, pp. 591–594, Zink's theorem (3.1.12)
  p. 594) and polarized O-displays (§3.2). M2.16 (Wedhorn) uses them.
- **Kodaira–Spencer.** AbelianSchemesAndArithmeticModuli has no KS map, and its Gauss–Manin is only
  over bases smooth over a field. **M2.10** now defines KS from the deformation class (Lan
  Def. 2.1.7.1, p. 221; Def. 2.1.7.8, p. 225).
- **ShimuraVarieties V0–V3** cover only connected `G` satisfying SV3. New **M3.3** reduces the
  disconnected (type D) and non-SV3 arithmetic quotients to V0–V3 componentwise, using Lan's intro
  §5.1.3 and Milne Thms 3.12 and 3.14.
- **ComplexComparisonPartII C0** has no "analytic local iso ⇒ étale" target. This step is now a proof
  step inside **M3.6**, via `completedAnalyticStalkComparison` and `coherentAnalytification_faithful`.
- **Residual gerbes** (requested of AlgebraicModuli R09.4) are not in that package. **M6.7** defines
  the gerbe of a coarse point directly as an étale stack over `Spec k`, using AM Layer 4's
  gerbes/bands.
- **Descent of potential good reduction by neat level** (requested of R11.3) is now a proof step in
  **M2.11**, using R11.3's Néron–Ogg–Shafarevich criterion.

### Supplier remappings (the plan named a different owner)

- **"SchemeAndStackFoundations SF.2 Part II" analytic spaces**: these are AlgebraicModuliForArithmeticGeometry
  Layer 7 §7.10 (`ComplexAnalyticSpace`, `complexSchemeAnalytification`, `SpaceAnalytification`).
  "SF.2 Part II" exists in no package.
- **DiamondsAndVStacks D0 "algebraic/DM stack carrier"**: algebraic and DM stacks, Keel–Mori, and fine
  and coarse moduli spaces are SchemeAndStackFoundations SF.1. D0 supplies only stackification and
  2-fibre/quotient stacks (0.25–0.26).
- **R07.6 Grothendieck–Messing with structures**: this is AbelianSchemesAndArithmeticModuli A4.7. A4.8
  gives polarized effectivity and A4.9 gives Serre–Tate with structures.
- **ModularCurves 0E**: it covers polarized curves only. Descent of polarized abelian schemes uses AM
  Layer 3 plus SF.1.
- **AM "End_S(A) disjoint union of projective schemes"**: AM Layer 2 gives quasi-projective. M2.4
  proves the finiteness of PEL Isom itself, so nothing depends on projectivity.
- **AA.1 similitude group**: upstream AA Layer 1 has no GSp or similitude group. The PEL group is
  constructed in M0.7 as a closed subgroup of `GL(L) × G_m`, citing AA L1 (§1.2–1.3) only for
  adelic/rational points.
- **LocalFieldsRamification L2** has unramified extensions but no matrix orders or lattices. Those are
  M0.3's own targets, with completions from NumberFieldArithmetic.
- **ShimuraVarieties V4 uniqueness** is V8 `CanonicalModel.unique_iso`.

## Source corrections and locators

- **Wedhorn 1999.** The packet's page ranges are partly wrong (for example "§2.2, pp. 589–595"). From
  the published PDF:
  - §1.3 is p. 580, §1.4 p. 582, §1.5 p. 583, and §1.6/(1.6.2) p. 584.
  - Chapter 2 is pp. 585–591 (§2.1 p. 585, §2.2 p. 587, §2.3 p. 588).
  - §3.1 is p. 591, (3.1.3) p. 592, (3.1.12) p. 594 and §3.2 p. 594.
  - Chapter 4 is pp. 599–617 (§4.1 p. 599, §4.2 p. 601, §4.3 p. 602, §4.4 p. 610, §4.5 p. 611).
  - The README uses these pages.
- **LTXZZ.** The README cites the published version (Invent. Math. 228; the maintainer-cleared copy,
  read in place and not copied):
  - Def. 3.1.7 is p. 140, Def. 3.1.11 p. 143, and Defs. 3.3.1–3.3.2 p. 147.
  - Notation 3.3.6, Notation 3.4.1 and Def. 3.4.2 are p. 148; Def. 3.4.3, Constr. 3.4.4 and
    Def. 3.4.5 are p. 149.
  - Rem. 3.4.6 and Not. 3.4.7 are p. 150, Prop. 3.4.8 p. 151, and Lemma 3.4.12 pp. 153–155.
  - Def. 3.5.1 and Rem. 3.5.2 are p. 156, Defs. 3.5.3–3.5.4 p. 157, and Not. 3.5.7 and Def. 3.5.8
    p. 158.
  - The packet cites many of these by arXiv v3 pages.
- **Milne ISV** (2017 revision): Lemmas 8.20–8.21 are on p. 89, the real approximation theorem is
  Thm 5.4, and Baily–Borel and Borel algebraicity are Thms 3.12 and 3.14 (checked in the public PDF).
- **Lan thesis**: §2.1.7 KS (pp. 221, 225) and Prop. 2.3.4.2 (p. 269) were checked; printed page = PDF
  page − 40.
- **Not independently re-verified:**
  - The Kottwitz 1992 locators: the public scan has no text layer, so they are carried over from the
    twice-reviewed plan.
  - The Borel–Serre 1964 theorem number: the public copy returned 404, so it is cited only as the paper
    with Kottwitz §8 p. 399.
  - BBM LNM 930, Prop. 4.3.1: not available, so it is cited through LTXZZ's proof of Lemma 3.4.12.
  - Faltings–Chai I.1.6 and I.4.11: carried over from the plan.
- The source mistakes E1–E8 recorded in the packet are reflected in the prose at the targets they
  affect: SV3 (M0.12), the multiplier (M0.7), the auxiliary extension (M0.16, M0.19), the actual
  polarization (M1.2), type-D change of primes (M1.11), the KS finite-presentation hypothesis (M2.10),
  and the strict positivity at zero (M0.23). E7 (the Poincaré graph factor) concerns no target here.

## Checks changed or added

A few new Checks were written and then corrected during the mathematics pass:
- **Genus one:** `diag(2, 1)` is a similitude with multiplier 2, not a non-similitude.
- **Not self-dual up to scalar:** this must be the `(1, p)` rank-four lattice; the rank-two one is
  self-dual after scaling.
- **Indefinite quaternion example:** properness uses the type-C Shimura curve. The definite type-D
  example has dimension 0.
- **Level-forgetting degree:** 48 for the representable map versus 24 on coarse spaces.

Checks whose truth I could not establish were not kept (Γ₁(p) non-reducedness; a convention-dependent
display of `μ_{p^∞}`). Every definition has at least three Checks. Theorem subsections carry two or
three Checks each.

## For the reviewer and the next jobs

- Check the four new targets (M0.9, M2.13, M2.15, M3.3) and the two move-downs.
- Optionally check that Zink's display theory should live here rather than in a separate roadmap. It is
  substantial; if the maintainer prefers a separate owner, M2.15 is the single place to cut.
- **ShimuraCompactifications** should record that it owns integral quasi-projectivity and Hodge-line
  ampleness for PEL moduli, consuming PELModuli M6.
- **HilbertModularVarietiesAndShimuraCurves** should cite M5.4 for the principal datum.
- **AdelicAlgebraicGroups** consumers that wanted "AA.4 Part II" can cite PELModuli M0.9.
- No packet was edited.
