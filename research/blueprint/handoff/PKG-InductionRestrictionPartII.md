# PKG-InductionRestrictionPartII — package complete

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Claude (Opus 5.5), session `claude-RZTzXj`, 14 October 2026.
Branch: `claude-RZTzXj-pkg-induction-restriction-part-ii`.

## What this submission does

The three package files are rewritten in the 2026-10-12 shape, and the obstruction recorded by the
earlier checkpoints (prerequisites without an owner) is resolved by owning them in a new first
layer, as WORKERS.md "Upstream tiers" and PROTOCOL §15 allow for notions no roadmap plans.

- `README.md` (≈165 KB, 3026 lines): upstream form — `# Roadmap:` title, **Summary**, layer table,
  Scope and ownership, Conventions, Exact supplier contracts (Mathlib pin, Tau Ceti pin, current
  Tau Ceti after the pin, InductionRestriction Layer 7), How to read the build, Layers RS.0–RS.6
  with `### RS.k.n` subsections (statement, construction or proof sketch, API, *Needs:*, *Source.*,
  **Checks.**), per-layer Examples and Dependencies, Downstream consumers, References. Layer labels
  RS.1–RS.6 are kept because other plans cite them.
- `Suggested.lean` (896 lines): written from scratch. Light real-bodied definitions over pinned
  carriers (`Multiplier`, `IsCentralExtension`, `IsStemExtension`, `cyclePairing`,
  `liftCommutator`, `commutingPairCycle`, `homologicalCommutator`, `schurRelations`,
  `ReducedMultiplier`, `reducedCoverRelations`, `MarkedExtension`, `MarkedHom`, `markedRelators`,
  `UniversalMarked`, `universalProjection`, `ClassIndex`, `classDegreeMap`, `universalDegree`,
  `markedFiberProduct`, `universalKernel`, `finitePower`, `degreePermutation`, `CyclotomicTwist`,
  `boundedDegreeSlice`, `powerFixedDegree`, `torsionImageFiltration`, `obstructionThreshold`,
  `jointParityMap`, `parityWeightEnumerator`, `equalOrderInertia`, `swapAction`, `SwapWreath`,
  `abelianizedSum`, `sumKernelModel`, `outsideInvolutions`), the layer milestones statable at the
  pins, discriminating `example`s, and a closing list of the README targets not typed at the pins.
  No data definition has a `sorry` body (the two proof obligations inside definitions are separate
  `theorem`s).
- `metadata.toml`: `topic = "math.GR"`.

## Moves and plan corrections (the packet is unchanged)

1. **New Layer RS.0 owns the unassigned homological bridge** (packet gap "Natural integral
   homological bridge — supplier unassigned" and the coverage remarks of RS.1, RS.2, RS.5):
   RS.0.1 `integralEvaluation`; RS.0.2 universal-coefficient description (finite G; free Gᵃᵇ for
   any G, which covers the infinite marked fiber product; divisible coefficients); RS.0.3
   `extensionClassMap` with the commutator formula and naturality; RS.0.4 five-term exact
   sequence and the stem corollaries; RS.0.6 finiteness and |G|-annihilation of positive-degree
   integral homology; RS.0.7 Hall decomposition of the multiplier of a coprime semidirect product.
   The plan's coprime Lyndon–Hochschild–Serre "edge with d₃" is replaced by a transfer argument
   (corestriction after transfer is the index), which needs no spectral sequence; the LHS route is
   kept as a remark. Consumers re-pointed: RS.1.3, RS.1.7, RS.1.8, RS.1.13, RS.2.12, RS.3.7,
   RS.5.2, RS.5.5, RS.5.6, RS.6.1.
2. **Cyclic complement conjugacy** (the second packet gap) is RS.0.8, with an elementary Sylow
   normaliser induction; RS.5.7 uses it.
3. **Ordinary Schur covers** (packet request to InductionRestriction Layer 7): the parent's Layer 7
   plans the representation group but says explicitly that `H₂(G, ℤ)` must be pinned separately.
   RS.0.5 defines `IsSchurCover` (stem + bijective class map) and proves that the parent's
   representation group is one (stem + order of `H²(G, ℂˣ)` + RS.0.2 divisible case). The parent
   supplies only existence of the representation group.
4. **Abelian rows of Wood's Table 2** (19 of 31 rows): RS.6.8 proves `M(F(G), c) ≅ Λ²G` for the
   anti-diagonal model of an odd-order abelian G from RS.6.1 and the Künneth formula, so these rows
   no longer depend on computational certificates. The values agree with Table 2 (C₃² → C₃,
   C₅² → C₅, C₉ × C₃ → C₃, C₃³ → C₃³, cyclic → 1).
5. **Explicit models for the nonabelian rows** (RS.6.9–RS.6.10): sum-kernel, graph and full wreath
   models, with orders checked against Table 2 (96, 294, 384, 162, 54, 48, 336, 7200, 56 448). The
   identification of each model with the embedded type selected in the source stays with
   ArithmeticStatistics ST.3. The earlier draft's longer lists of class sizes and kernel shapes
   were dropped where not verified.
6. The order-96 computation "M(F) ≅ C₂³ with relation subgroup of order 4" is not in Wood's paper;
   the README marks it as an unverified machine computation to be certified.
7. **Names**: packet snake_case declaration names were converted to Lean style — definitions
   lowerCamelCase (`lift_commutator` → `liftCommutator`), types UpperCamelCase
   (`reduced_multiplier` → `ReducedMultiplier`, `marked_extension` → `MarkedExtension`,
   `universal_presentation` → `UniversalMarked`, `cyclotomic_twist` → `CyclotomicTwist`,
   `degree_orbit_set` → `DegreeOrbitSet`, `reduction_certificate` → `ReductionCertificate`),
   API and test labels follow (`lift_commutator_inl` → `liftCommutator_inl`,
   `lift_commutator_test_1` → `liftCommutator_test_1`); theorem names keep the slug
   (`homology_image`, `two_adic_survival`, …). A script confirmed that every one of the 109
   targets, 124 API names and 96 test labels appears in the README under the converted name.
8. Corrections made while checking the plan's statements: RS.1.13 (`homology_image`) is now
   proved by naturality of the class map plus five-term exactness; RS.2.12 records why the class
   map of a marked extension kills Q_c; RS.2.13's tests were rewritten as tests of the correction
   itself; checks that were remarks were replaced by computed examples (RS.1.12, RS.2.12, RS.3.6,
   RS.3.7, RS.4.1, RS.4.3, RS.4.5, RS.4.10–RS.4.12, RS.4.14, RS.4.16, RS.4.17, RS.4.19, RS.5.3,
   RS.5.4, RS.5.6, RS.6.1, RS.6.2).

Other plans that cite `InductionRestrictionPartII:RS.k` remain valid. Any roadmap needing the class
map or five-term sequence of a central extension can cite RS.0.3–RS.0.4.

## Checks run

- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean` at Mathlib
  082e2d3 / Tau Ceti f790474: **exit 0, 88 warnings, all `declaration uses 'sorry'`, no errors and
  no other warnings** (109 GB memory available at the start).
- `python3 scripts/check_sorry_data.py` on the Lean file: no offenders.
- `python3 research/blueprint/intake.py check-files` on the three files: 0 problems.
- Scripted: all packet targets/API/test names present in the README; every `RS.k.n` reference
  resolves to a heading; Lean declarations are named in the README or in the closing comment;
  `*` outside code spans escaped where it is mathematics.
- Locators verified against the free PDFs this run: Löh, *Group Cohomology* (2019 notes; printed
  page = PDF page − 8): Thm 1.4.1 p. 20, Thm 1.5.1 p. 30, Outlook 1.5.15 p. 40, Cor 1.6.13 p. 49,
  Thm 1.7.15 p. 64, Cor 1.7.16 pp. 64–65, Thm 3.2.12 p. 123, Prop 3.2.13 p. 124, Rem 3.2.14 p. 125,
  Thm 3.2.18 pp. 129–131, Cor 3.2.20 p. 133, Cor 3.2.23 p. 136; Hatcher §3.1: Lemma 3.1 p. 194,
  Thm 3.2 p. 195; Conrad, *The Schur–Zassenhaus theorem*: Example 2 p. 1, second proof pp. 3–4,
  Remark 5 p. 4. Wood's lifting paper PDF matches the packet SHA-256. The Wood (2019), EVW and
  LWZB locators are carried over from the accepted plan and were not re-opened in this run.

## For the reviewer

Worth a close look: RS.0.7 (transfer proof of the Hall decomposition, including the norm formula
for a normal subgroup), RS.0.8 (the induction), RS.6.8 (Λ²G formula), and the row-to-model table
in RS.6.10.
