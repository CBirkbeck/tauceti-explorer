# Handoff: PKG-AdditiveCombinatorics (package, complete)

Agent: Claude (Opus 5.5), session claude-m8rfAX, 2026-10-14. Refs #9156.

## Deliverables

- `research/blueprint/packages/AdditiveCombinatorics/README.md`: about 185 KB, six layers in build
  order AC.0, AC.1, AC.3, AC.2, AC.4, AC.5 (AC.3 precedes AC.2 because the density-increment proof of
  Szemerédi's theorem uses the Gowers inverse theorem; the layer ids are kept, so consumers that cite
  `AdditiveCombinatorics:AC.k` still point at the right layer). 101 targets: the 100 nodes of the
  accepted packet (the two indicator bounds `fourier-indicator-norm-le` and
  `fourier-indicator-fourth-le` share §AC.0.8) and 2 targets moved down into this roadmap (below).
  Every target has its statement, hypotheses, proof sketch with locators and a `*Needs:*` line; every
  definition has its API list and at least three Checks. All 286 API names and 131 test names of the
  packet appear in the README.
- `Suggested.lean`: 887 lines in the 2026-10-12 shape. Real-bodied light definitions (`fourier`,
  `nconv`, entropy, `rdist`, `tau`, Bohr sets, `GeneralizedAP`, Gowers cubes and norms, interval
  norms, `DegreeFiltration`, filtered polynomials, smoothness, rationality, `FilteredNilmanifold` as
  a structure of real conditions, progression averages, upper density, the linear-forms error, cut
  discrepancy, the smooth and sharp majorants, affine systems, Cauchy–Schwarz complexity, integer
  local factors); the end theorems and layer milestones statable at the pins (`pfr`,
  `entropic_pfr`, Bogolyubov, BSG, both Freiman theorems, `quantitative_szemeredi`,
  `layered_cycle_removal`, `ordered_product_removal`, the dense model and relative counting
  theorems, `linear_forms_relative_szemeredi`, `prime_progressions`, `linear_equations_in_primes`);
  discriminating `example`s; `#check`s pinning the library declarations the README names. No
  sorry'd data. The closing comment lists the README targets not typed at the pins (nilsequence
  complexity, equidistribution, the inverse theorems, Green–Tao pseudorandom families, Kai's
  number-field weights).
- `metadata.toml`: `topic = "math.NT"`.

## Checks run

- `lean-check …/Suggested.lean`: exit 0; the only warnings are 86 `declaration uses 'sorry'`.
- `python3 scripts/check_sorry_data.py …/Suggested.lean`: no offenders.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- Scripted README checks: every `*Needs:*` reference points to an earlier target; no target number
  repeats; every definition has at least three Checks; every API and test name of the packet occurs;
  no packet names, job ids or process words.

## Targets moved down into this roadmap

The plan recorded both as supplier requests to roadmaps that do not exist; a package cannot leave
them as gaps, so they are targets here, stated exactly as the consumers need them.

- **AC.3.10 Connected, simply connected nilpotent Lie groups** (`nilpotent_exp_homeomorph`,
  `nilmanifold_haar_unique`): the exponential map is a diffeomorphism, the BCH series terminates with
  rational coefficients, and `G/Γ` has a unique invariant probability measure. The plan's request
  went to a "LieGroups, Part II" that no roadmap plans; it specialises TauCetiRoadmap's
  RepresentationTheory/LieGroups Layers 0, 2, 3, 5. Locators: Leng–Sah–Sawhney, inverse paper,
  arXiv:2402.17994v3, §2.1, p. 6; Green–Tao, polynomial orbits, arXiv:0709.3562v4, Definition 1.2,
  p. 2.
- **AC.2.11 Cycle removal lemma for layered graphs** (`layered_cycle_removal`): the plan's request
  went to "Regularity, Part II", which is not on TauCetiRoadmap main (only the open PR #66, which
  does not state it). Only the layered case that `ordered_product_removal` consumes is owned; it is
  proved from Mathlib's `szemeredi_regularity` and the labelled counting lemma. Source: Conlon–Fox,
  *Graph removal lemmas*, arXiv:1211.3487v1 (fetched 2026-10-14, SHA-256
  91b6941f54ef25fc5cb79c5fda959ae33224e422d09dca8e330596fc387a079f): Theorem 4.3 (directed removal,
  Alon–Shapira) and the Král'–Serra–Vena reduction, p. 20; proof of Theorem 1.1 and Lemma 2.4, p. 8.
  AC.2.12's proof sketch was rewritten through this target and checked (labels, lifts, deletion
  count `εN`).

If a Regularity or LieGroups Part II roadmap is ever planned, these two targets are its to import.

## Citations of roadmaps that are not yet Tau Ceti roadmaps

AdditiveCombinatorics is outside the Caraiani–Newton tiers, so the tier rule cannot order it. The
README cites, with exact supplier contracts: AnalyticNumberTheory AN.2 (the fixed-progression prime
number theorem; the zero-free region for the sharp route), AN.3, AN.4; SieveMethodsAndPrimePatterns
SV.1, SV.2; ExponentialSumsAndCircleMethod ES.0, ES.3, ES.4; ClassicalArithmeticCompletion CA.2;
FiniteFieldsAndCharacterSums FF.2. TauCetiRoadmap citations: RepresentationTheory/LieGroups,
GeometryOfNumbersAndQuadraticArithmetic Layer 1.5 (PR #851), ArithmeticDirichletSeries Layer 9
(as the route to the fixed-progression PNT through Mathlib's
`ArithmeticFunction.vonMangoldt.continuousOn_LFunctionResidueClassAux`). Before this roadmap goes
upstream, the cited atlas roadmaps must be upstream first, or AdditiveCombinatorics should be bundled
with ExponentialSumsAndCircleMethod and SieveMethodsAndPrimePatterns (their packages were queued
together).

## Duplication against Tau Ceti

Current TauCetiRoadmap main (all roadmaps, including the nine newer than the atlas snapshot and
`Completed/`) and the current Tau Ceti library (a91d3aaf) were searched by object: Fourier analysis
on finite abelian groups, energy bounds, entropy, Ruzsa distance, Bohr sets, Freiman, Gowers norms,
nilmanifolds, Mal'cev bases, progression counts, removal lemmas, majorants, prime patterns. Nothing
there duplicates a target; DenseGraphLimits consumes Mathlib's triangle removal only. Nothing was
removed.

## Corrections to the plan (packet unchanged)

Locators were spot-checked against the public sources (all SHA-256 prefixes match the packet's
records). Corrected in the README:

- **Gowers–Green–Manners–Tao.** The plan cites the accepted-manuscript pagination and numbering,
  which differ from arXiv:2311.05762v2, the public version the README cites. All locators are now
  arXiv v2: Theorem 1.8 p. 4; Proposition 2.1 p. 6; Lemma 2.2 p. 7 (v2's proof quotes Tao's entropy
  paper, Theorem 1.11(i), for the first step); Proposition 4.1 p. 15; Corollary 4.2 pp. 15–16; the
  conditioning lemma is **Lemma 5.1** (plan: 5.2), p. 17; the distance-to-sums lemma is **Lemma 5.2**
  (plan: 5.3), p. 18, with the sign credited in footnote 4 (plan: footnote 7); §5 pp. 16–19; §6
  pp. 19–21; Lemma 7.1 p. 21; Lemma 7.2 pp. 22–24; Appendix A (A.1)–(A.9) pp. 25–26, (A.10)–(A.15)
  pp. 26–28, Lemmas A.1–A.2 pp. 28–30; Appendix B pp. 30–31; the discrete-Gaussian remark p. 12. The
  plan's "Remark 5.1" is not in v2 and the sentence citing it was dropped. The errata E5 and E6 hold
  in v2 as well.
- **Tao, Notes 3.** The plan's "Theorems 2.1–2.2" are Theorem 1.1, Lemma 2.1 and Theorem 2.2.
- **Leng–Sah–Sawhney, Szemerédi paper.** The ES.0 contract cited "Proposition 2.1 and Corollary 2.2",
  which do not exist; simultaneous recurrence is Proposition 2.2, p. 4. Fact 3.6 is on p. 10.
- **Conlon–Fox–Zhao (v4).** Linear-forms condition: Definition 4.2, p. 8 (plan: Definition 4.1); cut
  norm: (7)–(8) and `‖·‖_{□,r}`, p. 9 (plan: "Definition 5.2"); dense model: Theorem 5.1, pp. 9–11;
  relative counting: Theorems 6.2 and 6.5 with Lemma 6.4, pp. 11–16 (plan: "Theorem 6.1"); relative
  Szemerédi: Theorem 4.3, p. 8, proved in §7 (plan: "Theorem 7.1"); majorant: Proposition 8.1 p. 17,
  Definition 8.2 p. 18, Proposition 8.4 p. 19. CFZ use `b = 1`; the general coprime `b` of the plan is
  noted as handled by the same computation.
- **Green–Tao.** Primes paper Lemma 5.2 is on p. 13; polynomial-orbits Definition 2.5 on p. 13;
  linear-equations paper: Conjecture 1.2 p. 4, Main Theorem p. 9, Theorem 1.8 p. 12 (plan:
  pp. 1–2, 9–10).
- **Bennett–Siksek.** Rahman's reference [31] is on p. 390 (plan: p. 392).
- **Unit tests.** `fourier.test_conjugate_reflection`: for the real point mass the plain and the
  conjugate reflection coincide, so the plan's "plain reflection would not conjugate" does not
  discriminate; the README states the correct value and adds the complex point mass `Pi.single 1 i`,
  where the two reflections give `1/4` and `−1/4`.

## Adversarial pass

| Statement | Instances computed | Result |
| --- | --- | --- |
| `fourier`, `fourier_zmod` | `ZMod 4`, `δ₁` at `zmodAddEquiv 1`; `ZMod.dft δ₁ 1 = −i` | `−i/4 = (1/4)(−i)` |
| `fourier_reflection` | real and complex point masses | test reworded (above) |
| `nconv` checks | `ZMod 3`, `ZMod 4`, `A = B = {0,1}` | all values confirmed |
| `fourier_energy` | `A = B = G`, `A = B = {0}`, `A = {0,1} ⊆ ZMod 3` (`E = 6`), `A = {0,1,2} ⊆ ZMod 5` (`E = 19`) | confirmed |
| `rdist` checks | uniform on `{0, e₁, e₂} ⊆ 𝔽₂²` | `(2/3) log(3/2)` |
| `pfr` covering count | `K|A|/|A ∩ (H + x₀)|` | `K^{C'/2+1}(|A|/|H|)^{1/2}` |
| Bogolyubov | `|Λ| ≤ ρ/τ² = 4K/ρ`; mass `9/16 − 4/16 = 5/16` | confirmed |
| Bohr sets on `ZMod 4` | chord radii `√2, 2`; phases `1/4, 1/2`; `2 sin(π/24) > 1/4` | confirmed |
| Gowers checks | `(1, −1)` on `ZMod 2`; point mass `1/8`; mixed cube `−1`; `3i` | confirmed |
| `gowersNorm_mono` | proof sketch rewritten through `|𝔼 g|⁴ ≤ ‖g‖_{U²}⁴` | corrected sketch |
| Heisenberg example | `exp(αnX)exp(βnY)` | 2nd-kind `(αn, βn, 0)`, 1st-kind central `½αβn²` |
| `filteredDerivative` orientation | `g(n) = aⁿb` | `a^h`; other order gives `b⁻¹a^h b` |
| smoothness | `n/4`, `binom(n,2)/2`, `n²/2 = binom(n,2) + n/2` | `N/4`, `N²/2`, `N/2` |
| progression averages | `ZMod 5` singleton; `[2]`, `k = 3` | `1/25`, `2/9` |
| upper density | blocks `[N_j, 2^{N_j})`, `N_{j+1} ≥ 2^{2^{N_j}}` | upper `1`, lower `0` |
| `ordered_product_removal` via AC.2.11 | label/lift/deletion count | `≤ εN` per set; a surviving lift exists |
| majorants | `δ_k = 1/(c_χ k 2^{k+4})` vs CFZ p. 19; `k = 3` sharp constant `1/(3·2⁸)` | confirmed |
| W-trick | `30n + 1`, `n = 1..4` | `31, 61` prime; `91, 121` composite |
| local factors | `ψ = 2x` at `2`; `ψ = x`; 3-AP at `p = 2, 3`; `S = {(2)}` | `0`; `1`; `2`, `3/4`; `2` (the first draft's `β₂ = 1` was wrong and fixed) |

## For the reviewer

Read `README.md` first; `Suggested.lean` states only what is statable at the pins. The two moved-down
targets (AC.2.11, AC.3.10) and the locator corrections above are the places where the README departs
from the packet.
