# BP-LocallyAnalyticDistributions--L2 — handoff

Job: blueprint follow-up for stage `LocallyAnalyticDistributions:L2` (Admissible growth and uniqueness), issue #9292.
Worker: Claude (Opus), session claude-RjcM3s, 2026-10-12.

## Deliverables

- `research/blueprint/packets/LocallyAnalyticDistributions--L2.json`: part `L2`, scope `LocallyAnalyticDistributions:L2`,
  status `complete`, 38 nodes (5 definitions, 3 constructions, 14 lemmas, 15 theorems, 1 comparison), 59 API items,
  35 unit tests, 3 planets, 19 baseline declarations, 0 gaps, 0 requests. `scripts/check_blueprint.py` (with
  `TAUCETI_BASELINE` pointing at the pinned index) reports 0 errors and 0 warnings.
- `research/blueprint/readmes/LocallyAnalyticDistributions--L2.md`: the layer document, about 16,000 words. The
  introduction, conventions, dependencies, acceptance tests and source corrections are written by hand; each
  declaration's entry is rendered from the packet, so the two agree.
- `research/blueprint/suggested/LocallyAnalyticDistributions--L2.lean`: Mathlib-only. **It compiles:** `lean-check`
  in the shared build (Mathlib 082e2d3) exits 0, and its only warnings are 82 "declaration uses sorry". Every packet
  API and test name occurs in the file, as a declaration or `example` or, where no carrier exists at the pins, in the
  closing omission list with the reason.

## Coverage

L2 is `planned`. With the predecessor's sixteen L2 nodes (cited by id, not repeated), every target the stage states
is a node whose prerequisites end in Mathlib, in this roadmap's L0/L1/L2 nodes or in PadicMeasuresIwasawaAlgebras
(`L2/residue-fiber-clopen`). The one `remaining` item is reading the published Loeffler chapter, which is not freely
available (see below). The packet's `continuation` field maps each predecessor node to the new nodes that refine it,
for the assembly job.

## The three items the predecessor left open

1. *Colmez C^r wavelet/density and tensor multidegree moment bounds; box indicators, refinement partition, wavelet
   basis and completed tensor realization.* One variable, Colmez §I.5: `locally-polynomial-functions`,
   `colmez-wavelets`, `taylor-coefficient-bounds`, `cr-derivatives`, `cr-locally-analytic-bound`,
   `wavelet-norm-bound`, `amplitude-coefficient-bound`, `taylor-truncation-density`, `cr-wavelet-basis` (planet),
   `cr-mahler-criterion`, `cr-derivative-surjection`. The two halves of Amice–Vélu–Vishik: `moment-bound-necessity`,
   `wavelet-value-bound`, `higher-degree-vanishing`, `order-r-valuations`. Several variables: `box-indicators` (typed
   through `PadicInt.toZModPow`, with the refinement identity), `multivariable-van-der-put` (basis and mixed-difference
   coefficients), `separate-degree-polynomials`, `tensor-function-realization` (the realization of the completed
   tensor as functions is injective, with an inductive proof), `tensor-moment-necessity`,
   `tensor-wavelet-value-bound`, `tensor-higher-degree-vanishing`. The last proves the multidegree uniqueness by
   subdividing one coordinate at a time; subdividing all coordinates at once fails, because coordinates of exponent
   below r_j contribute negative multiples of their radii.
2. *Bounded pullback/chart invariance for higher vector orders; finite-group Fourier inversion over the splitting
   field.* `cr-banach-algebra`, `cr-composition` (corrected, see E8/E9), `order-on-one-dimensional-groups` (chart
   transitions are affine, so composition applies with no extra hypothesis), `tensor-chart-pullback` (closes the
   higher-order input of `L2/quasifactor-chart-invariance`), `finite-fourier-inversion` (from Mathlib's
   `AddChar.sum_mulShift`, `zmodChar_primitive_of_primitive_root` and `DirichletCharacter.sum_char_inv_mul_char_eq`),
   `coefficient-extension`, and `unit-character-determination` (planet), which is the uniqueness on ℤ_p^× from the
   values at χx^j that ModularSymbolsPadicLFunctions L2 and RJW Theorem B.1 use, with two sharpness examples.
3. *Verify E3 against an accessible published chapter or author correction.* arXiv v1, v2 and v3 were read (hashes
   in `sources`). v2 (22 August 2013) is typeset in the proceedings format and has Definition 12 and Remark 13
   identical to v3's 2.12 and 2.13. v1 leaves the filter unnamed; under the reading in which every m_i → ∞, the
   stated valuation is −∞ on the same tensor element. The v3 listing comment says the revision corrects interpolation
   formulae, and §2.3 is unchanged. The accepted manuscript in the Warwick repository (record 75859,
   `padicLfunc-springer.pdf`) returns HTTP 401 to the public, and the Springer chapter is paywalled. No author
   correction was found. Recorded as **E11** (known = E3). The corrected definition is now a theorem:
   `vector-order-mixed-differences` characterises the tensor space by mixed van der Put differences, and the Lean
   file states the counterexample (`loeffler_literal_counterexample`).

Additional coverage not in the predecessor: Loeffler's isotropic spaces and Theorem 2.9 (`isotropic-order-functions`,
`isotropic-wavelet-basis` with a full proof of the basis claim Loeffler leaves to the reader, `isotropic-extension`;
the predecessor's `rayclass-growth-adapter` invokes this theorem without a node), and the block vector order for
quasi-factorizations with higher-dimensional summands (`block-vector-order`, `block-rectangular-extension`).
Theorem 2.15 is stated for these, and ray class groups of general number fields need them. Also
`admissible-algebraic-distributions` (planet; the stage's "norm estimates on small balls against locally polynomial
test functions"), `order-r-operations`, and `critical-kernel`: for r ≥ N + 1 the kernel of restriction to
LP^{[0,N]} is d^{N+1}D_{r−N−1}, the exact form of "do not apply strict uniqueness at critical slope".

## Source issues (new unless stated)

- **E7** Colmez, proof of Theorem II.3.2(ii), p. 33: misprint in the integrand of b_{i,k} (page image checked).
- **E8** Colmez, Proposition I.5.6, p. 20: false for 0 < r < 1. The digit map d(x) = Σa_n(x)p^{⌊2n/3⌋} is C^{1/2}
  and d∘d is not. True for r = 0, r ≥ 1, and for Lipschitz inner maps (page image checked).
- **E9** De Ieso, Proposition 2.12, pp. 12–13: the case [r] = 0 "left to the reader" fails in the same way.
- **E10** De Ieso, Definition 2.10, p. 12: f(x + y) printed for h(x + y).
- **E11** Loeffler v1/v2: the E3 defect, version-scoped (known).

None of these is in the errata register or in another packet's `sourceIssues`.

## Requests, moves and tiers

No requests and no gaps. The only cross-roadmap prerequisite added is PadicMeasuresIwasawaAlgebras
`L2/residue-fiber-clopen` (lower tier, TauCetiRoadmap #780). No notion is moved down from a higher tier. The current
TauCetiRoadmap checkout and the current Tau Ceti library (a91d3aaf) were searched: neither has C^r spaces, wavelets,
Mahler-weighted norms or order-r distributions, so nothing here duplicates upstream.

## Planets and structure

Planets added to L2: "Wavelet basis of C^r", "Admissible locally polynomial distributions", "Determination by
locally algebraic characters". With the predecessor's three, L2 has six. The packet's `restructure` entry proposes
two atlas sub-layers for L2 (one variable; several variables), with the node lists; it changes no stage id.

## Sources

Read (URLs, hashes and sections in the packet): Colmez, *Fonctions d'une variable p-adique* (author PDF, §§I.3,
I.5, II.1–II.4); Loeffler arXiv:1304.4042 v1, v2, v3 (§2); De Ieso arXiv:1203.6766v1 (§§1–2.2); Rodrigues Jacinto–
Williams arXiv:2309.15692v2 (Appendix B.2.1). Not read: the published Loeffler chapter (Iwasawa 2012, Springer) and
the Astérisque 330 version of Colmez; neither is freely available or in the cleared library.

## Checks run

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `lean-check` on the suggested file: exit 0, only `sorry` warnings.
- A script confirmed that every packet API and unit-test name occurs in the Lean file.
- Every Colmez, De Ieso, Loeffler (v1–v3) and Rodrigues Jacinto–Williams locator was checked against the PDFs by
  page. Misprints and errors were checked on rendered page images.
- An independent mechanical cross-check (a Sonnet subagent) read all 19 baseline declarations at the pinned Mathlib
  and found every `provides` sentence accurate. It recomputed every numerical test: one acceptance line had C(N − 1)
  for C(N), now corrected. It listed API items whose Lean statement was weaker than the packet text: three Lean
  statements were strengthened (`boxIndicator_mul`, `tensorWavelet_basis`, `isoCr_locallyConstant_dense`), and the
  packet texts now say what the Lean states, with the norm statements marked as README targets.

## For the reviewer

The new nodes refine predecessor nodes but cannot edit them; the assembly should add the refining ids to the
predecessor nodes' prerequisites (packet `continuation.assemblyNote`). Three proofs are worker derivations and need
the closest checks:
- the multidegree vanishing by coordinatewise subdivision;
- the injectivity of the tensor realization;
- the isotropic wavelet lower bound through mixed differences.
