# Euler systems and Kolyvagin systems: revision round 3

Job `BP-EulerSystemsAndKolyvaginSystems--ES.0~3`, issue #9303. Claude (Opus 5.5),
session `claude-IUm4p8`, 2026-10-14. This round revises the plan in place after the
independent review `REV-EulerSystemsAndKolyvaginSystems--ES.0~2` (needs_changes). This
session wrote neither earlier planning round and neither review. The packet's `review`
object is left in place for the next reviewer to replace.

## What the review asked for, and what changed

The review returned three arithmetic prototype errors, R1–R3. The packet's mathematical
targets were already at the right scope; the defects were in the suggested Lean signatures
and their API lines. All three are repaired together through one coefficient dictionary.

- **R1, Selmer support.** `SelmerStructure` now carries two more fields: its coefficient
  category (`IsArithmeticCoefficient`) and `S_p ∪ S_∞ ⊆ Σ(F)` for the residue
  characteristic (`contains_pInfinity`). `isAboveP` and `pInfinity` moved to the first
  section. Every constructor must supply these fields. New support lemmas cover duality
  (`dualStructure_sigma`, MR04 Definition 2.3.1), propagation (`propagatedStructure_sigma`,
  MR04 Example 2.1.7), modification (`strict_sigma`, `relaxed_sigma`, `modify_sigma`,
  MR16 Definition 2.3) and restriction of the prime set (`SelmerTriple.restrictPrimes_F`).
  Typed tests: no Selmer structure has empty support (the trivial 𝔽_p-module over ℚ with
  Σ = ∅ is excluded); every archimedean place and every prime above p lies in Σ; the dual
  data keep the support. `dualRep.trivial_mod_p_ramified` records that for p odd the dual
  of that module is μ_p, which is ramified at p.
- **R2, coefficient/topology dictionary.** New real-bodied predicates:
  - `IsCoefficientRing`: complete noetherian local, finite residue field of prime
    characteristic, `IsAdic` maximal-ideal topology, `IsAdicComplete`.
  - `residueChar`.
  - `IsCompactCoefficient`: finite type, `IsModuleTopology`, jointly continuous action.
  - `IsDiscreteCoefficient`: Tau Ceti `IsSmoothDiscrete`, 𝔪-power torsion, finite 𝔪-torsion.
  - `IsArithmeticCoefficient`.

  Both module predicates carry the ring condition as a field. A standing instance would
  not work: Lean omits unused instance variables from `def`s, so data such as
  `finiteEvaluation` would silently lose it. Further changes:
  - The Cartier dual is now `Hom_cts(T, μ_{p^∞})` (`muPInf`, `cartierHoms`), with scope
    lemmas `dualRep_isDiscreteCoefficient`, `dualRep_isCompactCoefficient` and
    `dualRep_isUnramified`.
  - These now take compact coefficients: `finiteEvaluation`, `singularEvaluation`, the
    transverse/finite-part block, `finiteSingular*`, `finite_singular_decomposition`,
    `transverse_duality` and `quotient_dual_propagation`. A new
    `quotientRep_isCompactCoefficient` lemma carries the scope to quotients.
  - `localPairing_nondegenerate` is stated only on arithmetic coefficients.
  - `dualSelmerTorsionEquiv` is split. The MR04 general form carries (H.0), (H.1) and
    (H.3) for the residue characteristic. The new `dualSelmerTorsionEquiv_selfInjective`
    is the BSS finite self-injective form with residual invariant vanishing.
  - Length and core-rank consumers get their scope from the Selmer structure.
    Quotient-ring Selmer structures (`reducedStructure`, `reducedTriple`) take an explicit
    `IsLocalRing (R ⧸ I)` instance.
  - Typed tests: `ℤ_p` and `𝔽_p` are coefficient rings, discrete `ℚ` is not, finite
    discrete modules lie in both categories, and a discrete `Frac(R)` in neither.
- **R3, MR16 F_ur.** `unramifiedStructure` is rebuilt from Definition 5.1, pp. 9–10.
  - `UnramifiedLocalLayer` gives finite unramified extensions as open finite-index
    subgroups of the decomposition group containing inertia.
  - `unramifiedCor` is compact-coefficient corestriction, supplied by
    ArithmeticGaloisDuality D7/compact-shapiro-projection.
  - `universalNormSubgroup` is the intersection of the corestriction images, and
    `saturation` is the preimage of the torsion of the quotient.
  - `unramifiedCondition` is relaxed at archimedean places, the saturated universal norms
    above p, and the rational inertia kernel elsewhere.
  - New lemmas: `unramifiedStructure_condition`, `unramifiedStructure_condition_away`
    (agrees with F_can away from p), `unramifiedStructure_dual_corank_at_p` (Lemma 5.2)
    and `unramifiedStructure_relaxed_at_p` (Corollary 5.3). `unramifiedStructure_eq_canonical`
    now requires finite H⁰(K_𝔭, T^*) at every 𝔭 | p.
  - The false `unramifiedStructure_eq_canonical_empty` is removed.
  - `canonicalStructure` is now relaxed exactly at `S_p ∪ S_∞`; the free `atP` argument
    is gone.
  - The MR16 Theorem 5.4 consumer (`unramified_core_rank_formula`), the three Rubin-bound
    consumers and the Euler-to-Kolyvagin hypotheses use the new signatures.
  - New typed test `unramifiedStructure_tate_twist_units`: for ℤ_p(1) over ℚ with p odd,
    the inertia kernel at p is zero while F_ur at p has rank one.

## Packet, reader and counts

Twelve nodes changed:
- ES.0: selmer-triple, quotient-dual-propagation, selmer-torsion-identification,
  selmer-length-difference, core-rank, core-rank-independence-of-modulus,
  canonical-selmer-structure, core-rank-formula.
- ES.1: finite-singular-decomposition, finite-singular-comparison, transverse-duality,
  modified-selmer-structures.

All 89 node ids are kept and no node was added or removed. The tally is 89 nodes,
272 API items (was 245), 135 unit tests (was 125), 35 planets (unchanged) and 25 baseline
declarations. The six new declarations were checked against the pinned index: `IsAdic`,
`IsAdicComplete`, `IsModuleTopology`, `Submodule.torsion`, `cyclotomicCharacter` and Tau Ceti
`IsSmoothDiscrete`. There are 10 requests and 5 gaps.

The three R1–R3 gaps are removed because they are resolved. The general-coefficient
duality gap and the L2 request now name the coefficient category the supplier statements
must use. ES.0's remaining list now names the supplier proofs and the lemma-level
Lemma 5.2 / Theorem 5.4 steps. ES.1's false-finiteEvaluation item is removed. All eight
stages stay `planned`, none `closed`; the status is `complete`; every implementation
status stays `unchecked`.

The reader was regenerated with a renderer that first reproduced the committed node
sections byte for byte. It mirrors every edited node. Two sections whose formatting had
drifted from the packet were also synced: sheaf-monodromy had a stray blank line, and
cassels-structure listed its sources in a different order. The introduction,
conventions, prototype section, counts, coverage, baseline, source records, L2 request
and gaps were updated to match.

RT-AREA-iwasawa-1/10 and RT-AREA-iwasawa-1/36 are handled as in round two and were not
changed. ES.5 is the single owner of Howard's H.0–H.5, stub and DVR theory; ES.8 owns the
Λ-adic theorem; HE.6/HE.8/GH.5 consume them. The ES.2/ES.4/ES.8 → cyclotomic and Kato
edges remain `restructure` proposals.

## Sources

This round re-read the archived MR04 author copy and MR16 arXiv v1 (fingerprints
unchanged; dates updated to 2026-10-14):
- MR04: coefficient conventions (pp. 7 and 13), Lemma 1.2.1, Definitions 2.1.1 and
  2.3.1, Examples 2.1.7–2.1.8, and §3.5 with Lemmas 3.5.2–3.5.4.
- MR16: notation (p. 3), §1, Definitions 2.1 and 2.3, and §5.1 from Definition 5.1
  through the proof of Theorem 5.4 (pp. 9–11).

No passage was copied into the repository. Kolyvagin's original article remains unread,
as before.

## Validation

- `python3 scripts/check_blueprint.py` with the pinned declaration index: 0 errors,
  0 warnings.
- `lean-check` of the 5,497-line suggested file at the shared pinned build (Mathlib
  082e2d3, Tau Ceti f790474): exit 0, 1,030 warnings, all "declaration uses `sorry`",
  no other warnings or errors.
- All 351 API and suggested-declaration names are declared in the file under their
  packet names. All 135 test labels sit beside typed examples.
- The renderer finds all 89 reader node sections equal to the packet.

## For the next reviewer and follow-ups

Check the coefficient dictionary and its consumers, the two torsion-identification
scopes, and the F_ur construction and its Lemma 5.2 / Corollary 5.3 statements.
The supplier work is unchanged:
- L2: general-R duality on the stated coefficient category.
- ArithmeticGaloisDuality D7: compact corestriction.
- L6, CA.7, HE.7, I.7: as before.

At lemma level, the remaining steps are MR16 Lemma 5.2 through Perrin-Riou's
universal-norm lemma, and the bounded-kernel comparison in Theorem 5.4. ES.8 stays outside
this part.
