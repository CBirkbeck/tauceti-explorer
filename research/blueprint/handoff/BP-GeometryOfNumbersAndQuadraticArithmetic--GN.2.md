# Handoff: BP-GeometryOfNumbersAndQuadraticArithmetic--GN.2

Job #9326, Claude (Opus 5.5), session claude-fEioPU, 2026-10-12.

## What was done

Follow-up plan for Layer GN.2 (quadratic and hermitian local-global theory), in its own packet
`research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic--GN.2.json` (part `GN.2`, scope `GN.2`,
status `complete`, coverage `planned`), with the reader
`research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.2.md` (rendered from the packet, about
26,000 words, §§2.10–2.19) and the suggested file
`research/blueprint/suggested/GeometryOfNumbersAndQuadraticArithmetic--GN.2.lean` (686 lines).

The base packet's 55 GN.2 nodes are cited by id and not re-planned. The items its coverage record left open are planned:

1. **Native Dedekind-lattice adapters** (§2.10): `lattice-pseudobasis` (Voight Thms 9.3.6, 9.3.9), `lattice-steinitz-class`,
   `lattice-completion` (on Mathlib's `adicCompletion`/`adicCompletionIntegers`), `lattice-local-global-dictionary`
   (Voight Thm 9.4.9 with Lemma 9.5.3), `lattice-index-ideal` (Voight §9.6), `lattice-discriminant-ideal`.
2. **Dyadic spinor stabilizer images** (§2.14): `regular-quadratic-module-spinor-norm` (spinor norms of integral isometries of a
   regular quadratic module over a local ring are unit classes, through GSpin; Chenevier–Taïbi §3.2, Conrad App. C) and
   `dyadic-unimodular-spinor-image` (equality with R^×K^{×2} at nondyadic places and whenever the lattice contains a hyperbolic plane).
   The general dyadic image (Beli) stays a recorded gap.
3. **Quaternion classification inputs** (§2.11): `quaternion-order` (the general order notion, moved down from
   ClassicalArithmeticCompletion CA.7), `quaternion-order-discriminant`, `maximal-quaternion-order-criterion` (Voight Thm 15.5.5),
   `hasse-schilling-norm-theorem` (Eichler/Hasse–Schilling, proved through the norm form and GlobalQuadraticForms Layer 6).
4. **Finite-field quadrics and Arf** (§2.12): classification in all characteristics, the Arf invariant, the three quadric surfaces.
5. **Local-classifier consumers** (§§2.13–2.16): binary genus characters with local factors, the ℤ_p normal form of a binary form,
   odd unimodular unit representation, isometry eigenspaces with the Cayley discriminant, Zassenhaus's formula, the Chenevier–Taïbi
   constraint; hermitian trace forms with Jacobson's theorem, local and global classification, Jacobowitz's unramified
   diagonalization, norm ideals, unimodular classification, hermitian genera, Lipnowski–Tsimerman's unit labels, Gram-orbit bijection,
   model rings and their local stable-lattice lemmas.
6. **Full KSS Proposition 3.15 and the maximal-element input** (§2.17): `signed-hermitian-space`, `quadratic-norm-squares`,
   `equivariant-linear-form`, `signed-witt-parity`, `signed-transfer-determinant`, `standard-transfer-values`, and
   `skodlerack-stevens-maximal-transfer`: the input KSS cite as [39, Theorem 4.4] is Skodlerack–Stevens, arXiv:1503.08882v3, §4
   (Theorem 4.4, Proposition 4.6, Lemma 4.7, pp.8–11), now read; the base packet's `signed-transfer-maximal-element` can cite it.
7. **Per-paper routed worklist**: every GN.2-routed item of the 13 papers is accounted for in `routing` (planned node, base-packet
   node, the owning Tau Ceti milestone, or another GN follow-up), including Li's even ℤ-unimodular lattices (with a self-contained
   existence proof: local split lattices glued by the dictionary, so Chang's criterion and Hecke's theorem on the different are not
   needed), Charles's Λ_{2d} transport with the primitivity correction, the explicit Zarhin plane, LMS's discriminant and
   norm-selection lemmas, and Calmès et al.'s signature splitting (408).

Counts: 58 nodes (16 definitions, 4 constructions, 36 theorems, 2 lemmas), 123 API items, 70 unit tests, 6 planets,
61 baseline declarations (each looked up in the pinned index and its statement read at Mathlib 082e2d3 / Tau Ceti f790474),
18 requests (all to Tau Ceti roadmap layers or AdelicAlgebraicGroups AA.1), 2 gaps, 1 new source issue.

## Decisions a reviewer should check

- **Ownership.** TauCetiRoadmap IntegralLattices owns ℤ/ℤ_p Jordan splittings, genus symbols, spinor genera over ℚ, binary forms
  (Layer B) and Nikulin's theory (Layer 5); those are cited in proof steps (the atlas snapshot does not register that roadmap's layers
  as stages, as the base packet's gaps already note). The genus character χ_d on binary forms is not in Layer B and is planned here, as
  the single owner requested by MultiquadraticPartII RQ.3 and MetaplecticAutomorphicForms MP.0/MP.7.
- **Tier move.** GN is tier 3, ClassicalArithmeticCompletion higher. CA.7's `order-in-finite-dimensional-algebra` and `maximal-order`
  move down into `quaternion-order` (recorded in `tierMoves` and the second `restructure` entry). **CA.7 should cite GN.2/quaternion-order.**
- **Planets.** The packet carries six planets; the first `restructure` entry proposes sub-layers GN.2a/2b/2c because the base packet
  already has five GN.2 planets.
- **Source issue E201 (new).** Voight 15.4.5 and Lemma 15.4.7 state `discrd(I) = [J:I]discrd(J)` and `disc(I) = discrd(I)²` for
  projective lattices; they fail for `I = 2M₂(ℤ)` (disc 2⁸, discrd 2³) and hold for orders. The packet states them for orders.
- **Gaps.** (1) Dyadic ramified unimodular hermitian lattices (Jacobowitz Prop. 10.4, not freely available, not read); the unramified and
  odd ramified cases are proved. (2) The general dyadic integral spinor image (Beli 2003, not acquired).

## Red-team finding RT-AREA-algebraicnt-1/1

Roadmap-level metadata is outside this job's files. The third `restructure` entry records the reciprocal prerequisite/consumer
relations the finding prescribes with the stage-level edges (QuadraticFormInvariants, GlobalQuadraticForms, Completed IntegralLattices,
AdelicAlgebraicGroups → GN.2); every GN.2 use of those suppliers in this packet is a prerequisite with a `requests` entry.

## Consumers to update

- MultiquadraticPartII RQ.3 and MetaplecticAutomorphicForms MP.0 requests: cite `GN.2/binary-form-genus-character` and
  `GN.2/binary-form-genus-character-invariance`.
- ArithmeticStatistics ST.5 (model ring and its quaternionic analogue): `GN.2/model-ring-positive-involution`; ST.1 (ternary forms with
  4det = −1): `GN.2/ternary-unit-half-discriminant-classification`.
- ComplexMultiplicationAndExplicitReciprocity CM.5 (quaternion order carrier, maximality, reduced discriminant): `GN.2/quaternion-order`,
  `GN.2/quaternion-order-discriminant`, `GN.2/maximal-quaternion-order-criterion`.
- AbelianSchemesAndArithmeticModuliPartII F4: the §2.16 local lemmas and `GN.2/hasse-schilling-norm-theorem`; the orbit counts
  (L1–L9/S2–S3) are Layer 3 (follow-up #9327).
- The GN package (`research/blueprint/packages/GeometryOfNumbersAndQuadraticArithmetic`, Layer 2.9.8) cites Skodlerack–Stevens through the
  URL `ueaeprints.uea.ac.uk/id/eprint/60983/...`, which serves an unrelated biology paper; the correct free source is arXiv:1503.08882v3.

## Checks run

- `python3 scripts/check_blueprint.py` on the packet with the pinned declaration index: 0 errors, 0 warnings.
- `lean-check` of the suggested file at Tau Ceti f790474 / Mathlib 082e2d3: exit 0, 67 warnings, all "declaration uses `sorry`", no
  errors or other warnings. 67 of the 231 packet API/test/theorem names have signatures; the other 164 are listed in the file's closing
  comment, most because their carriers (Hilbert symbols, hermitian lattices, adelic unitary groups, GSpin over rings, signed Witt groups)
  are not at the pins.
- The reader is rendered from the packet (every node appears once) and contains none of the words "optional", "deferred", "later".

## Sources read (all free or maintainer-cleared)

Voight, *Quaternion algebras* (v1.0.7u), §§9.3–9.6, 10.2–10.4, 13.3–13.4, 14.7, 15.2–15.5; Bruinier–Ehlen–Yang arXiv:1912.12084v2 §7;
Khayutin arXiv:1710.04557v3 App. B.2; Kurinczuk–Skodlerack–Stevens arXiv:1611.02667v3 §§3.1–3.5; Skodlerack–Stevens arXiv:1503.08882v3 §4;
Lipnowski–Tsimerman arXiv:1511.02212v1 §§3.1–3.2, 5.1–5.3; Zhang arXiv:1909.02697 §1.2; Leslie arXiv:1911.07907v3 §3.2–3.3;
Li–Zhang arXiv:1908.01701v3 §1.7; Elman–Karpenko–Merkurjev §§12–13, 35; Bergström–Faber–Payne arXiv:2206.07759v2 §6;
Chenevier–Taïbi arXiv:1907.08783 §3.2; Charles, Annals 184 (2016) §§2.2, 4; Lieblich–Maulik–Snowden arXiv:1107.1221 §§2.1, 3.5;
Li arXiv:2106.13653v2 §2.4; Calmès et al. arXiv:2009.07225v4 §3.1; Schulze-Pillot arXiv:2008.12847v2 §9.2; Conrad, *Reductive group
schemes*, App. C (statements). Not read: Jacobowitz 1962 (AJM), Beli 2003, Chang (Li's Satz 1), Duke–Imamoḡlu–Tóth (Annals; its
routed GN.2 items are planned from Bruinier–Ehlen–Yang's statement of the same character).

## What remains

Nothing at target level beyond the two gaps. At lemma level: split `lattice-pseudobasis`, `hermitian-trace-form` (Jacobson) and
`regular-quadratic-module-spinor-norm`; type the remaining names of the suggested file as their carriers reach the pins.
