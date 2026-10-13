# Handoff: PKG-FiniteFlatGroupsAndIntegralPadicHodgeTheory (package, complete)

Agent: Claude (Opus 5.5), session claude-vE8exZ, 2026-10-13. Refs #9374.

## Deliverables

- `research/blueprint/packages/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`: about 450 KB, six layers R07.1–R07.6, 153 targets (the 147 nodes of the accepted packet and 6 targets moved down into this roadmap). Every target has its statement, hypotheses, proof sketch with locators, `*Needs:*`, and **Checks**; every definition has an API list and at least three checks, every theorem at least two. All 171 API names and 139 test names of the packet appear in the README, except `PDivisibleGroup.height` (the height is a parameter of AbelianSchemesAndArithmeticModuli's `BarsottiTate S p h`) and the four `BreuilModule.*` names of the mod-`p` Breuil modules, renamed `BreuilModuleModP.*` to avoid a clash with Breuil's `S`-modules (`BreuilModule`, §R07.4.18).
- `Suggested.lean`: 690 lines in the 2026-10-12 shape: real-bodied light definitions, layer milestones statable at the pins, and tests; nothing sorry'd as data. The closing comment lists the README targets not typed at the pins.
- `metadata.toml`: `topic = "math.NT"`.

## Checks run

- `lean-check …/Suggested.lean`: exit 0. The only warnings are 32 `declaration uses 'sorry'`.
- `python3 scripts/check_sorry_data.py …/Suggested.lean`: no offenders.
- `python3 research/blueprint/intake.py check-files` on the three files: 0 problems.
- Scripted checks on the README: every `*Needs:*` reference points to an earlier target, no target is numbered twice, no stage ids, packet names or process words remain, and emphasis markers balance.

## Layer order (from the review's coverage notes)

The README places targets so that every target uses only earlier ones.

- **Moved into R07.1:** Frobenius and Verschiebung (§R07.1.1) and the tame characters (§R07.1.26).
- **Moved into R07.2:** the multiplicative–connected–étale filtration (§R07.2.2), the order-`p` type decomposition (§R07.2.3), henselian lifting (§R07.2.24), universal covers and their rigidity (§R07.2.25–§R07.2.26).
- **Moved into R07.5:** `fl-residual-weights` (§R07.5.11).
- **Within R07.1:** the level exactness (§R07.1.5) now comes before homomorphisms and standard examples (§R07.1.6).

Downstream roadmaps that cite these nodes by stage should follow the new layer of each.

## Upward citations

These are resolved as WORKERS.md "Upstream tiers" requires.

- **PadicHodgeTheory R06.1/R06.2 (tier 13), 28 citations.**
  - Re-pointed to lower-tier owners:
    - SelmerIwasawaCohomology Layer 4 (tier 8): `C_p` and `B_dR` (§4.1), `A_cris` and `B_cris` (§4.2), the fundamental sequences (§4.3), and `D_cris` with crystalline representations (§4.5).
    - NeronModelsAndSemistableAbelianVarieties §5.3 (tier 8): `B_st`, `D_st`, semistable representations and `D_pst`.
  - Moved down as new targets here:
    - the Tate–Sen theorem (§R07.1.18);
    - filtered `(φ, N)`-modules (§R07.3.1);
    - Hodge and Newton numbers and weak admissibility (§R07.3.2);
    - Fontaine's theorem that `D_st(V)` is weakly admissible, with full faithfulness and admissibility (§R07.3.3).
  - The Colmez–Fontaine theorem is Kisin's proof, §R07.4.13 (`semistable-finite-height`).
  - PadicHodgeTheory should import all of these from here.
- **PadicDifferentialEquationsAndRigidCohomology RD.1 (tier 12), 1 citation.** Moved down as the Robba ring and `φ`-modules with degree, slope and purity (§R07.4.7), and Kedlaya's slope filtration theorem with Dieudonné–Manin over the extended Robba ring and descent of pure modules (§R07.4.8). RD.1 should import these rather than plan them again.
- **New sources for the moved-down targets** (free; fetched to scratch and read for the cited statements):
  - Brinon–Conrad, CMI notes, <https://math.stanford.edu/~conrad/papers/notes.pdf>, sha256 f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187.
  - Kedlaya, *A p-adic local monodromy theorem*, arXiv:math/0110124, sha256 f38f45d4a956187ba26872363fcb880bf9e18c20f611bd07e25825022c9fc568.
  - Kedlaya, *Slope filtrations revisited*, arXiv:math/0504204, sha256 da80101622bfea911682476b1e3542bfd79200f247acf0c788c5b2383bd3ce07.
  - Locators read: BC Thm 2.2.7 p. 15, Defs 7.3.4 p. 98, 8.1.1 p. 102, 8.1.7 p. 105, 8.2.1 p. 110, 8.2.5 p. 112, 8.2.9 p. 114, 8.3.1 p. 117, Lemma 8.1.13 p. 109, Props 9.2.11 p. 144, 9.2.14 p. 146, Thm 9.3.4 p. 147, Def 9.3.8 and Prop 9.3.9 p. 151; Kedlaya 2005 Defs 2.2.13, 2.4.8, 3.1.1, 3.4.1, 3.4.5, 4.1.1, 4.6.1, Cor 2.5.12, Thm 4.5.7, Thm 6.3.3, Prop 6.3.5, Thm 6.4.1, Cor 6.4.3 (arXiv pages); Kedlaya 2004 Thms 4.16 and 6.10.

## Overlaps with lower-tier packages, resolved by citation

- **AbelianSchemesAndArithmeticModuli §A4.5 `BarsottiTate`** is the carrier of every `p`-divisible group.
  - §R07.1.6 (formerly `p-divisible-group`) adds only homomorphisms and the standard examples.
  - §R07.1.7 pins the transition maps of A4.5's dual.
  - §R07.1.9 extends A4.5's connected–étale sequence to an arbitrary henselian local base.
  - The packet's `PDivisibleGroup.*` API names are written `BarsottiTate.*`.
- **CrystallineCohomology §CR.7.2** owns the crystalline Dieudonné crystal and Grothendieck–Messing; §CR.7.3 owns relative direct images.
- **SelmerIwasawaCohomology §§4.6–4.7 duplicates part of R07.3.** It plans the covariant small-weight Fontaine–Laffaille category over an unramified field with finite residue field, and its crystalline realisation, citing FL Theorems 3.3, 6.1 and 8.4.
  - The README keeps R07.3 as the general theory: arbitrary perfect `k`, contravariant `U_S`, simple objects, tame inertia, the endpoint analysis and the finite-flat dictionary. It states in *Scope and ownership* how the two relate: over a finite field, `U_S` composed with duality is Selmer §4.7.
  - **For the maintainer:** two tier-8/10 roadmaps now prove FL's main theorems at different generality. Either Selmer §§4.6–4.7 stays as a special case, or the restructure moves the general theory down into Selmer.

## Supplier corrections

- **R07.1.2 (finite étale groups as π₁-modules).** The plan took the Galois-category structure on finite étale algebras over a connected ring from InverseGaloisAndArithmeticFundamentalGroups IG.0.
  - IG.0's package does not supply it: IG consumes `π₁^ét` from ConstructibleEtale, TauCetiRoadmap PR #196, which is not tracked here.
  - Constructing the `GaloisCategory` instance on `(CommAlgCat.FiniteEtale R)ᵒᵖ` is now part of R07.1.2. IG.0 is cited only for its conventions.
- **R07.5.14 (integral peu ramifié lifting).** Local Tate duality is cited from TauCetiRoadmap.ClassFieldTheory (`tateDualityPairing_perfect_mixed`), not ProfiniteCohomology.
- **SmoothRepresentationsOfLocalGroups SR.2** is now a TauCetiRoadmap roadmap; it is cited as such.

## The recorded gap

The fibrewise `BT_n` criterion (§R07.1.11 (ii)) is stated as follows:

- for `n = 1`, as in Pilloni;
- for `n ≥ 2`, under the extra hypothesis that each `G[p^i]` is finite locally free, where the fibrewise flatness argument goes through.

The unconditional statement for `n ≥ 2`, which Pilloni attributes to Fargues, is not asserted. No consumer in the packet needs it.

## Coverage "remaining" lists

These are now under *Not built here*, each with the consumer that owns it:

- displays, Norman–Oort and polarised `O`-displays: PELModuli;
- BCDT descent data beyond Savitt's weight-two case, Kisin modules with tame descent data, and the weights `{0, p − 1}` and `{0, p}`: LocalGaloisDeformationRings and EllipticCurveModularity;
- quotients in families, Faltings' integral Hodge–Tate complex, Fargues' degree and canonical subgroups: HodgeTateAndCanonicalSubgroups and IgusaVarietiesAndTorsionConcentration;
- `E`-linear Fontaine–Laffaille theory: AutomorphicGaloisRepresentations and PotentialAutomorphyInfrastructure;
- Serre's characters for `e > 1`: SerreWeightAndLevelOptimisation.

Those consumers' requests to this roadmap for these items should be re-pointed to their own plans.

## Inputs the plan cited but did not read

The README now makes their proofs part of the target that uses them:

- Fontaine's Honda-system classification (§R07.3.18);
- Faltings' Theorem 7 (§R07.4.19);
- Illusie's Théorème 4.4 and Wedhorn–Lau (§R07.2.23);
- Fontaine, Astérisque 47–48, n° 4.3 (§R07.6.5);
- the Breuil–Mézard and Breuil 1999 lemmas (§R07.4.33).

## Lean

`Suggested.lean` keeps the following, which compiled in the planning file:

- the finite flat carriers;
- Raynaud's uniqueness and full faithfulness;
- Dieudonné modules, now with a `Category` instance;
- Fontaine–Laffaille modules;
- Kisin modules;
- descent data;
- peu ramifiée classes;
- the coefficient statements.

It adds:

- `isMultiplicative_cartierDual_iff`, `isEtale_of_isUnit_rank`, `rank_eq_one_of_isEtale_of_isConnectedLocal`;
- `dieudonneEquivalenceFinite`, the R07.2 milestone, stated as the existence of a full and faithful functor with the length, étaleness and essential-image properties;
- `FilteredPhiNModule` with `IsEffective` and `tH`;
- `SerreWeights.Label` with `card_label` and `finrank_sym`.

It removes every sorry'd data definition of the planning file: `oortTateGroup`, `katzMazur`, `katzMazurIsoOfDiv`, `frobeniusHom`, `verschiebungHom`, `dieudonneModule`, `dieudonneMap`, `FLModule.unit` and `Prolongation.sup`. These are README targets.

`KisinModule.unit` now has a real proof of finite height. The rank theorems carry `[IsLocalRing R]`, so that `finrank` is the order.

## Questions for the orchestrator

1. **Brinon–Conrad sign.** Definition 8.3.1 (p. 117: `D⟨i⟩` has `φ = p^{−i}φ_D`, `Fil^r(D⟨i⟩) = Fil^{r+i}`) conflicts with Example 9.1.12 (p. 135).
   - The example computes `D*_cris(ℚ_p(r))` as `φ = p^r σ` with its jump in degree `r`, and calls this `K₀[0]⟨r⟩`; under Definition 8.3.1 that object is `K₀[0]⟨−r⟩`.
   - The remark after Definition 8.3.1 (`D*_st(V(i)) ≃ D*_st(V)⟨i⟩`) has the same sign.
   - This is a candidate for the register of mistakes in published sources.
   - The README fixes its own twist, the same as CrystallineCohomology §CR.7.1, by the explicit check `FilteredPhiNModule.unit_twist`.
2. **BMS twist.** The review's question on the sign of the Breuil–Kisin twist (BMS Example 4.2) is unchanged. No README check depends on it.
3. **FaltingsFinitenessAndIsogenyTheorems.** It can now cite §R07.1.17 (invariant differentials and the absolute different) directly.

## Scratch

Nothing in the scratch directory is needed later. The README was assembled from per-target fragments by a script; the fragments mirror the README exactly.
