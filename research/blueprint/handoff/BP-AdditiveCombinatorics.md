# Handoff — BP-AdditiveCombinatorics

Issue #1037. Codex session codex-a71f92, 27 September 2026.
Continuation of ChatGPT (GPT-6 Astra Pro), gpt6-20260927-qm-7c9e, PR3133.
Claim comment 5852252595 was confirmed by bot comment 5852253359 before work.

## Status: partial checkpoint, no replacement packet

This checkpoint adds the reader, extends the suggested interface and replaces
the earlier handoff with verified evidence and exact continuation boundaries.
The original mathematical interface is preserved: none of its 35 declarations
or 16 tests is deleted. Seven comparison/API lemmas and four tests are added.

The suggested file now has **2 definitions, 40 lemmas and 20 examples**:
62 deliberate placeholders. It elaborates at both pins with exactly 62 expected
placeholder warnings and no other diagnostics. Nothing is claimed implemented.

No packet is created. The issue requires all six stages in scope; a narrow
packet covering them would displace the nine accepted Green–Tao decomposition
nodes. They have not yet been reconciled to declaration granularity with full
API/test/closure contracts. Preserving that mathematics takes precedence over
publishing a superficially complete replacing graph. The new reader explicitly
retains them. No stage status or accepted decomposition file is changed.

Thus the packet counts remain zero: no allocated nodes, API records, test
records, planets or requests. The reader has four candidate planet names,
and the interface has 40 API lemma signatures and 20 example specifications.
The whole-roadmap blueprint remains incomplete.

## New verified work

- Fully read the projected audit for all six AC layers before planning,
  plus REV-AUDIT-16, the full RS-03 result/report/review, the campaign document,
  atlas extract, the complete integrated decomposition, and the inherited
  handoff/signatures.
- Read all touching link and overlap entries: coding ACT-O02 and both
  LieGroups overlap contracts. Screened reserved IDs and all packets for AC.0;
  read FF.1's exact request and consuming multiplicative-character node.
- Read the combinatorics red-team report and the relevant verifier decisions,
  including its rejections: no mandatory latest-bound/PFR programme, no
  unavoidable AC.2/AC.3 cycle, and no blanket coding prerequisite.
- Read the upstream EffectiveBounds and ArithmeticDirichletSeries documents
  completely for conventions, theorem contracts and dependency discipline.
- Read the primary finite-Fourier passage, including its exercises and the
  beginning of the Bohr/lattice transition. Checked the conjugation bars and
  suspect constants on rendered PDF pages, not extracted text alone.
- Found LeanAPAP's existing cft design through the authors' Zulip discussion.
  Read its entire compact Fourier source at commit
  3b79412fbe529449c472f0a5f866ee2e3be88b87. It is not in the pins and was not
  imported or copied. Read Mathlib PR41258's current definition and review:
  symmetric normalization differs, and its reviewer points to APAP's API.
  Any actual source-code port requires the programme's author-coordination
  step; this checkpoint is an independently specified interface.
- Added weighted-inner-product, explicit dual reindexing, finite Haar integral,
  scalar-convolution, indicator-convolution and conjugate-reflection contracts.
  The Haar signature carries the measurable structure on the multiplicative
  type-tag explicitly: the corresponding instance is not inherited automatically.

## Pinned baseline statements inspected

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

The full finite Pontryagin-duality and character-orthogonality files were read.
Other ranges are stated rather than implying a full module read.

| Source module | Inputs and scope inspected |
| --- | --- |
| Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean | Entire file: complexBasis, its evaluation, card_eq, column sums, cyclic character constructors and zmodAddEquiv. |
| Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean | Entire file: probability-normalized row orthogonality, character finiteness and independence. |
| Mathlib/Analysis/RCLike/Inner.lean | Lines 20–135: wInner, cWeight, normalized-average comparison and first-slot conjugation. |
| Mathlib/LinearAlgebra/Basis/Defs.lean | Basis coordinate and finite sum/repr identities, particularly repr_sum_self. |
| Mathlib/Analysis/Fourier/ZMod.lean | Lines 1–205: dft, evaluation, inverse, zero-frequency and counting-measure conventions. |
| Mathlib/Topology/Algebra/InfiniteSum/DiscreteConvolution.lean | Lines 1–240 and 300–end: addition-fibre definition, finite-function ring convolution, zero/unit/distributivity/scalar/commutativity interfaces, including generated additive declarations. |
| Mathlib/Combinatorics/Additive/Convolution.lean | Lines 22–100: representation multiplicity and support, generated additive version. |
| Mathlib/Combinatorics/Additive/Energy.lean | Lines 1–185: energy carrier, representation-square formula, empty cases and lower Cauchy–Schwarz inequality. |
| Mathlib/Combinatorics/Additive/PluenneckeRuzsa.lean | Triangle theorem and Plünnecke–Ruzsa statement/proof ranges, not the whole file. |
| Mathlib/Combinatorics/Additive/RuzsaCovering.lean | Finset covering statement/proof and opening set variant. |
| Mathlib/Combinatorics/Additive/Corner/Roth.lean | Finite-group and natural-number Roth statements/proofs and asymptotic corollary, lines 125–203. |
| TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean | Entire file: arbitrary-domain multiplicative column orthogonality; do not duplicate it. |
| TauCeti/RepresentationTheory/Compact/Finite.lean | Lines 175–290: normalized counting Haar measure and integral_haarProb_eq_inv_mul_sum. |
| TauCeti/RepresentationTheory/Compact/PeterWeyl.lean | Ambient hypotheses and lines 565–620: polarized and norm-square Parseval, not a new missing theorem. |

Searched both source trees for finite Fourier/character/convolution APIs and
the declaration index. Broad Fourier searches have many unrelated continuous,
Gaussian and positive-definite hits; narrower full-tree searches and the
accepted audit locate the relevant candidates above. This is not a claim
that every Fourier-related declaration in either library was read.
The APAP interface is outside the baseline; its existence corrects any
unqualified claim that no formalization exists anywhere.

## Checks actually executed

The original 51-signature worksheet first compiled unchanged.
The expanded 62-signature file then compiled against 8,482 byte-matched reached
Mathlib source files and 36 Tau Ceti modules built directly from pinned sources.
Only the 62 expected placeholder warnings remain.

Separate scratch Lean uses concrete finite-average definitions, not any
suggested placeholder, and proves 17 general lemmas with zero placeholders
and zero warnings: zero/addition/scalar, point mass, character evaluation,
inversion, basis coordinates, injectivity, zero/point-mass/unit convolution,
weighted-inner-product comparison, polarized Parseval, arbitrary dual
reindexing, discrete-convolution comparison, commutativity, and Haar integral
comparison. These probes are validation evidence, not submitted implementation.
No scratch proof file or build artifact is published.

The previous exact rational cyclotomic regression was rerun. It checks
11 groups, including noncyclic examples, 579 ordered point-mass pairs for
inversion/Parseval, 5,589 convolution coefficients, 40 self-energy subsets,
the Z/4 to Z/2 quotient basis, and the nonreal sign sentinel.
The extension checks all 576 ordered pairs of subsets for mixed energy on
Z/4, (Z/2)^2 and Z/3, plus the new conjugate-reflection, imaginary-scalar and
multiplicity sentinels. All passed, without floating-point tolerance.

The suggested file still does not constitute proofs of the remaining general
identities. In particular no general Lean proof of the energy or cyclic
constructor comparison is claimed by these scratch checks.

The packet checker is not applicable to an absent packet; no zero-error
packet-check claim is made. The source-issue records below also passed validation
in a scratch errata-v1 envelope. The intake allowlist check reported three files
and zero problems. A fresh-main overlap check found no changes to the guarded
inputs or deliverables, and the snapshot comparison found no edits outside
the three authorized deliverables.

## Source provenance and mistakes to carry into the packet

Source ID: tao-254a-notes2-cmu. Terence Tao, Lecture notes 2 for 254A.
The acquired text is the CMU-hosted compilation, not the published Tao–Vu book.
Read §6 in full (printed pp.8–11, PDF pp.34–37), Q3–Q4 on printed p.23
(PDF p.49), and the opening of §7 through the phase-radius comparison on
printed p.12. PDF pp.35,37,38 were rendered and visually checked.
No complete Freiman/Bohr proof, other lecture, or book-wide reading is claimed.

The sourceVersions and sourceIssues records below are **unreviewed findings**,
preserved here because there is no replacing packet yet. Copy them, with their
IDs, into its corresponding fields when that packet is constructed.
"new" means no correction was found in the listed searches, not author
confirmation or a claim that nobody has noticed the issue.
Do not send anything to the author without the maintainer.

```json
{
  "sourceVersions": [
    {
      "kind": "author copy",
      "url": "https://www.math.cmu.edu/users/af1p/Teaching/AdditiveCombinatorics/Tao.pdf",
      "citation": "Terence Tao, Lecture notes 2 for 254A, within the undated 118-page compilation hosted by the CMU course. Not identified with Tao–Vu's published book.",
      "read": "2026-09-27",
      "sha256": "961b333259ff9db8289e6e8a59c10a7a418d6709694fc99f33252ee91694ffe9"
    }
  ],
  "sourceIssues": [
    {
      "id": "AdditiveCombinatorics/E1",
      "source": "tao-254a-notes2-cmu",
      "kind": "misprint",
      "locator": "Lecture notes 2, §6, printed p.11 (PDF p.37), the two inequalities immediately after (9).",
      "printed": "Re Σ_{ξ∈Λ} |χ̂_A(ξ)|⁴ e(x,ξ) ≥ (3/4) Σ_{ξ∈Z} |χ̂_A(ξ)|⁴.",
      "correction": "In these two immediate inequalities put Λ, not Z, in the right-hand sum. Alternatively keep Z and use 9/16 in place of 3/4.",
      "reason": "The pointwise estimate Re e(x,ξ)>3/4 on Λ yields (3/4) times the mass on Λ. Equation (6) supplies a further factor 3/4 when converting to total mass. The complementary sum is at most one third of the mass on Λ, so the corrected argument still proves the claimed nonvanishing. This identifies the missing step/index in the printed inference; it does not assert a counterexample to every stronger inequality for actual indicator spectra.",
      "affects": "the proof",
      "known": "new",
      "searched": [
        "Author's 254A course archive https://www.math.ucla.edu/~tao/254a.1.03w/index.html: search index lists corrections to other notes, none to this passage; direct retrieval failed (502/certificate verification).",
        "Searches for Tao 254A notes2 Bohr 3/4 errata; no correction located.",
        "Repository source-issues register and blueprint errata screened for this text."
      ]
    },
    {
      "id": "AdditiveCombinatorics/E2",
      "source": "tao-254a-notes2-cmu",
      "kind": "misprint",
      "locator": "Lecture notes 2, §7 opening, printed p.11 (PDF p.37), displayed phase-distance description of X.",
      "printed": "X = {x ∈ Z : ||xξ/N|| < δN for all x ∈ Λ}.",
      "correction": "Use {x ∈ Z/NZ : ||xξ/N|| < δ for every ξ∈Λ}, where ||·|| is distance to the nearest integer and δ is a fixed small phase radius.",
      "reason": "The quantified frequency must be ξ. Phase distance is dimensionless and at most 1/2. For example N=20 and δ=1/20 makes the printed δN condition automatic, whereas x=10 and ξ=1 give character value −1 and do not satisfy (9). For comparison with the chord-radius set, choose the smaller constant in E3.",
      "affects": "the proof",
      "known": "new",
      "searched": [
        "Author's 254A course archive search-index result, with direct retrieval failure as in E1.",
        "Searches for Tao notes2 Bohr phase δN correction; none located.",
        "Repository source-issues register and blueprint errata screened."
      ]
    },
    {
      "id": "AdditiveCombinatorics/E3",
      "source": "tao-254a-notes2-cmu",
      "kind": "error",
      "locator": "Lecture notes 2, §7, first paragraph of printed p.12 (PDF p.38), comparison with the chord radius 1/4 of (9).",
      "printed": "one can shrink X a bit and take δ to be 1/20 for concreteness",
      "correction": "For the asserted contained phase-distance Bohr set, use δ=1/32 (or any positive δ with 2 sin(πδ)≤1/4).",
      "reason": "Even after correcting δN to δ, t=1/24 satisfies ||t||<1/20 but |exp(2πit)−1|=sqrt(2−(sqrt(6)+sqrt(2))/2)>1/4. The phase radius 1/20 therefore does not ensure the chord-radius condition. In contrast δ=1/32 gives |exp(2πit)−1|≤2π||t||<π/16<1/4. This changes only a harmless absolute constant, not the existence of the progression.",
      "affects": "the proof",
      "known": "new",
      "searched": [
        "Author's 254A course archive search-index result; direct text retrieval failed as in E1.",
        "Searches for Tao 254A notes2 1/20 correction Bohr; no correction located.",
        "Repository source-issues register and blueprint errata screened."
      ]
    }
  ]
}
```


## Remaining work and exact resume point

1. Preserve all nine existing node IDs. Refine the combined Szemerédi,
   Gowers, pseudorandomness, majorant and transference nodes only after their
   sources and full dependency contracts are read. The earlier worker's
   worksheet and exact regression remain recoverable in PR3133; their
   mathematical contracts are retained and expanded in the new reader.
2. Turn the AC.0 specification into declaration-sized nodes with all named
   non-routine prerequisites. Finish declaration-index matching for quotient
   fibre cardinalities, the cyclic character comparison, indicator counts,
   energy and norm conversion. Do not silently use the scratch proofs as
   baseline declarations. The explicit one-dimensional Peter–Weyl skeleton
   comparison and coding/ER.4 specialization comparisons are still obligations.
3. The inspected Tao notes state the elementary Fourier facts as an exercise;
   the reader supplies the finite-sum argument and the scratch probes verify
   its core. The Bohr/Freiman continuation needs its full proof and GN.1's
   precise Minkowski-II contract. Apply all three source corrections above
   before reusing that transition.
4. AC.2: acquire Rahman's exact double-exponential proof and edition;
   PAPER-BENNETT-SIKSEK-20/101 is only a verified route, not the proof.
   Select the all-length Szemerédi/removal/correspondence route. Preserve
   existing qualitative Roth; ensure nonzero difference/distinctness.
5. AC.3: corrected complex Gowers, interval/box interfaces, quantitative
   inverse inputs and filtered nilsequence data. Follow the verifier's
   distinction between local BCH, global nilpotent geometry and rational data.
6. AC.4: preserve the seven accepted nodes and their analytic/unread-source
   gaps. Reconcile the existing 2008 proof with the separately requested
   dense-model/relative-counting theorems. Identify actual analytic consumers
   rather than assuming a Bombieri–Vinogradov dependency.
7. AC.5: read its separate linear-equations, Möbius–nilsequence and accepted
   number-field/Kai source branches; request their precise Type I/II, uniform
   progression and quantitative box inputs from their owners.
8. The confirmed area findings require changes to other canonical files, but
   this issue does not authorize editing those files. The reader records the
   applicable boundaries; no audit, restructuring, source route or campaign
   file was changed here. In particular, rejected findings do not justify
   forcing the latest PFR/density bounds or a blanket coding dependency.
9. When reconciliation is actually complete enough for a packet, set scope to
   AC.0–AC.5 and part to null, include exact coverage/gaps, definition APIs and
   tests, keep every implementationStatus unchecked, validate with the pinned
   declaration index, and align the reader and suggested file. No roadmap
   closure or complete source coverage is claimed by this checkpoint.
