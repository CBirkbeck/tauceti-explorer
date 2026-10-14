# BP-AnabelianGeometryAndNonabelianChabauty--NC.6

Agent: Claude (Opus 5.5) — session claude-HtuEFb. Issue: #6347. Date: 14 October 2026.
Disposition: **complete planning pass**; NC.6 coverage `planned`, packet status `complete`.

## What changed from the earlier checkpoints

Three earlier checkpoints (#8722, #8813, #9663) treated NC.6 as a process-only layer and
waited for an accepted restructuring result that would drop it; the packet had no nodes. This
pass follows PROTOCOL section 9 (a job that finds a restructuring case keeps working with the
current structure) and plans the mathematics that the stage's acceptance clause names: the
section-conjecture frontier and the eventual-stabilisation frontier, with motivic hypotheses
kept explicit. No layer of the atlas stated any of these (searched all packets for the section
conjecture, the section map, Kim's Conjectures 1 and 2, Kim's eventual-equality conjecture and
the Bloch–Kato/Jannsen/Coates–Sujatha bridges); NC.4/dimension-finiteness explicitly leaves
the existence of a good depth as an input. The precedent for stating an open problem as a named
proposition in a layer is InverseGalois IG.6/inverse-galois-frontier.

The export instruction in the stage text (send NC.1–NC.5 outputs to ED.6) is still process
and has no node. `restructure[0]` now proposes **narrowing** NC.6 to the frontier (drop of the
export only), superseding the earlier drop proposal; it lists owners and the links the new
nodes use (NC.0, NC.3, NC.4 → NC.6). The old process receipts (closureCheck and history,
supplierExports, ownershipEvidence) were removed from the packet; they remain in git history.

## Closed and planned

Eighteen nodes (5 definitions, 1 construction, 1 comparison, 10 theorems, 1 application),
44 API items, 26 unit tests, 6 planets, 7 baseline declarations:

- Part A (profinite): `section-classes`, `section-class-map`, `kummer-section-comparison`
  (Stix Prop. 44), `section-map-injective` (Stix Thm. 45 / Rem. 46), `section-conjecture`.
- Part B (Kim 2009): `kim-dimension-conjecture` (Conj. 1), `graded-central-dimensions`
  (Witt/Labute), `selmer-vanishing-conjecture` (Conj. 2), `h2-growth-bound` (Lemma 6),
  `vanishing-implies-dimension` (Prop. 2), `bloch-kato-implies-vanishing` (Obs. 1),
  `weight-splitting-implies-vanishing` (Obs. 2), `weak-jannsen-implies-dimension` (Obs. 3),
  `cm-rank-one-finiteness` (§4), `pseudo-null-implies-dimension` (Obs. 4),
  `genus-zero-dimension` (Kim 2005).
- Part C (BDCKW): `kim-conjecture` (Conj. 3.1 and the S-integral variant of §8.1),
  `thrice-punctured-depth-one` (§6.1–6.3).

Planets: Galois sections; Injectivity of the section map; Section conjecture; Kim's dimension
conjecture; Selmer vanishing criterion; Kim's conjecture.

## What remains (precisely)

1. Three source gaps: read Labute, J. Algebra 14 (1970) (or Invent. Math. 4 (1967),
   Théorème 2) for the surface-group rank formula (checked here against Linton–Nyberg-Brodda
   arXiv:2501.18306 eq. (32) for genus 2 and numerically for g = 1, 2); Greenberg, Invent.
   Math. 47 (1978) §2 (pseudo-null ⇒ finitely generated over Z_p); Bloch–Kato 1990
   Conjecture 5.3 (the hypothesis is stated in the form used, H¹_g = 0).
2. Three requests: ArithmeticKTheory:N.5 (Soulé's dimensions of H¹, H² of Q_p(k) over Q),
   EtaleDualityAndPerverseSheaves:EDC.0 (Künneth for products of curves),
   ArithmeticGaloisDuality:D7 (continuous Hochschild–Serre with Mittag-Leffler systems).
3. Restructuring decision on `restructure[0]` (narrow, not drop).

No notion moved between owners or tiers. EffectiveDiophantineMethods (tier 17) is not cited;
all cited roadmaps are lower-tier or outside the 94 (QSeriesPartitions QM.6 for Witt's formula,
PadicHodgeRegulators L1 for H¹_g, MotivicEtaleKTheory M.8, ArithmeticKTheory N.5).

## Source findings (new, in `sourceIssues`)

- Kim 2009 p.123: the (−1)-eigenspace dimension d_n/2 holds only for pure odd weight; false
  for the thrice-punctured line (it is d_n); corrected count given, Prop. 2 survives (error,
  affects the proof).
- Kim 2009 pp.124–125: H¹ written where H₁ = (H¹)^∨ is meant (misprint).
- Kim 2009 p.122: V_n "pure of weight n − 2" only for proper X (error, affects the proof).
- Kim 2009 pp.127–129: "rank one" must mean Bloch–Kato Selmer rank one (gap, affects a stated
  result).
- BDCKW v4 p.8 "p = 3, 5, 6" → 3, 5, 7; p.48 "and" → "or"; p.44 Sel_1 → Sel_2 (misprints).
- Stix v1 p.22 "Theorem B" → Theorem 45 (misprint).
- Kim 2005 v1 p.18: Soulé range n ≥ 3 → n ≥ 1, last index (misprint).
Kim 2009 p.92 ("archimedean") and p.121 (étale/de Rham label) were already recorded by NC.4.

## Checks

- `python3 scripts/check_blueprint.py` (with the pinned declaration index): 0 errors,
  0 warnings.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.6.lean`:
  elaborates on the shared pinned build (Mathlib 082e2d37e8, Tau Ceti f790474), no errors, only
  `sorry` warnings; 104 GiB available. Real proofs for `GaloisSection.diff`,
  `GaloisSection.map`, `conj_map`, `SectionClasses.map`. The values of `wittDim`/`labuteDim`
  and the divisor-sum identities for n ≤ 6 were evaluated separately on the same build.
- No private paths, no source passages, no Lean in the packet or reader.

## Sources read (2026-10-14)

Kim, Publ. RIMS 45 (2009), pp.89–96, 120–133 (EMS publisher PDF, sha256 b06562bc…);
BDCKW arXiv:1209.0640v4, pp.1–16, 43–49 (sha256 1cc3059d…); Stix arXiv:0809.0017v1,
pp.1–2, 22 (sha256 b456de5e…); Kim arXiv:math/0409456v1, pp.1–2, 17–18 (sha256 00efa6e9…);
Linton–Nyberg-Brodda arXiv:2501.18306, pp.65–66 (sha256 48c9436a…). Not available: Labute
1970/1967, Greenberg 1978, Bloch–Kato 1990, published versions of BDCKW, Stix and Kim 2005.
No restricted book was used. No scratch file is needed to resume.
