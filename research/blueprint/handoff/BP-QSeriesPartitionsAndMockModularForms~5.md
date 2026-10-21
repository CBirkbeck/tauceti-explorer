# BP-QSeriesPartitionsAndMockModularForms~5

Claude (Opus), session `claude-NX1bCW`, [issue #11524](https://github.com/CBirkbeck/tauceti-explorer/issues/11524), 21 October 2026. This is a completed revision round, not a checkpoint. The packet status is `complete`.

## Context

The stall detector opened round 5 on 20 October, when the revision-3 review had not accepted the plan. Revision 4 (Codex) was then reviewed by REV-QSeriesPartitionsAndMockModularForms~4, which **accepted** it with in-place corrections. This round therefore did three things:

- resolved the findings that REV~4 left open: the two gaps and its three notes;
- applied the maintainer's generality rule and consumed the open upstream pull requests that own targets here;
- left the REV~4 `review` object in place for the next reviewer.

The incoming packet had 537 nodes against the 300-node budget, so **no node was added**. Node ids are unchanged. One kind changed (lemma → theorem, below), and eight node records were revised.

## What changed

### Seventh-order gap: closed

- **Sources read.** Andrews, *The fifth and seventh order mock theta functions*, Trans. AMS 293 (1986), free on the AMS site. Hickerson, *On the seventh order mock theta functions*, Invent. Math. 94 (1988), pp. 661–666, free page scans on GDZ.
- **New definitions.** [QM.4/seventh-order-mock-theta-functions](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-4-seventh-order-mock-theta-functions) now defines F₀, F₁, F₂ as Ramanujan's Eulerian series in ℤ⟦q⟧, with their evaluation on the unit disc. These were Zwegers' choice of Hickerson's double sums.
- **The identification is now a theorem.** [QM.4/seventh-order-indefinite-theta-identities](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-4-seventh-order-indefinite-theta-identities) changed from lemma to theorem. It now carries:
  - Andrews' Lemmas 10–12: the polynomials U_n, V_n, W_n and three Bailey pairs;
  - Andrews' Theorem 13, in corrected form;
  - Hickerson's Theorem 2.0, the double sums over sg(r) = sg(s);
  - the previous sign-difference form (Zwegers §4.3).
- **The proof uses only existing QM.0 nodes:** `q-binomial-coefficient`, `bailey-pair`, `unit-bailey-pairs` (whose general-parameter proof gives Andrews' inversion (2.7)), and `bailey-chain-limit` with k = 1.
- **Andrews prints (7.22) and (7.24) with misprints.** These are recorded as E633 and E634. Hickerson already corrects them in print, in (2.3) and (2.5) on p. 666, "correcting some typographical errors".
- **Diagnostics.** Exact integer power-series checks, run in scratch and not in the repository, gave:
  - the double sums against the Eulerian series to O(q²¹⁹);
  - Lemma 10's relations and (7.12) for n ≤ 8;
  - Lemma 11 for n < 16;
  - the Bailey relations of Lemma 12 for n ≤ 8, to O(q⁶⁰).
- The gap moved to `closedGaps`, with its former text kept.

### Fifth-order gap: sharpened, still open

- **Read.** Andrews' Theorem 9 and its proof were read (§§4–6). The eight corrected identities, which remain the definitions, agree with the Eulerian series to O(q²¹⁷).
- **Misprints.** The printed (6.3) and (6.8) fail. They are recorded as E636 and E637, which Zwegers §4.4 already corrects. E636 also locates where the slip enters Andrews' proof, on p. 127.
- **What the gap now names.** It names exactly the three inputs missing from QM.0:
  - the one-parameter Bailey lemma ((2.4)–(2.6) with ρ₁ → ∞ and ρ₂ finite);
  - Andrews' Lemma 2, a limiting case of Watson's q-Whipple transformation;
  - Andrews' Lemma 1, a limiting case of a Sears transformation.
- **Why they are not planned here.** Each is a key theorem needing its own node, so the over-budget packet cannot plan them. They are the new last item of QM.0's remaining list, together with their routes (q-Pfaff–Saalschütz; the two-parameter Bailey lemma on the unit pair, Andrews 1984 §2).
- **E635.** Andrews' (3.1) prints (q)_∞ where 1/(q)_∞ is meant. It affects nothing; this one is new.

### Open upstream pull requests consumed (maintainer rule)

- **AffineLieAlgebras C7 (#1201).** It owns the positive-definite lattice VOA over ℂ and its Hahn-field vertex axioms. REV~4 had noted that QM.6 should cite it once merged; it is consumed now. QM.6 keeps the generality its consumers need: vertex algebras over any commutative ring, existence over any characteristic-0 field (the real framed model), and lattices of every signature (II₁,₁). The comparisons are stated as API items and tests:
  - [QM.6/vertex-algebra](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-vertex-algebra) ↔ `FormalVertexAxioms` over ℂ;
  - [QM.6/even-lattice-double-cover](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-even-lattice-double-cover) ↔ C7's ordered sign cocycle. They differ by the explicit coboundary of f(α) = (−1)^{⟨α,α⟩/2 + Σᵢ(⟨bᵢ,bᵢ⟩/2)αᵢ(αᵢ−1)/2}, checked on random Gram matrices;
  - [QM.6/lattice-vertex-algebra](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-lattice-vertex-algebra) ↔ C7's lattice VOA, via s ⊗ e^α ↦ f(α) s ⊗ e^α;
  - [QM.6/vertex-algebra-existence-theorem](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-vertex-algebra-existence-theorem) ↔ C7's reconstruction.
- **ZerosOfLFunctions Layer 1 (#253).** Item 3, `Complex.norm_Gamma_asymptotic`, is the vertical-strip Stirling estimate. AnalyticNumberTheoryPartI (#1126) and Part II §4.3b (#1167) consume it too. [QM.5/gamma-vertical-decay](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-gamma-vertical-decay) now imports it and keeps only the exponentiation to the relative-error form. Its Euler-summation route is no longer planned here. `mathlib:Complex.Gamma_ne_zero` was added to the baseline, read at the pin (Beta.lean l. 427). Two baseline records that no node cites any longer were removed.
- **HabiroCyclotomicCompletions (#1314).** Requests HC.1, HC.3 and HC.4 are met by its §§1.4, 2.1, 3.1 and 4.4. An `upstreamContract` field is added to each request, plus a new upstreamImports record.
- **Screening.** Every roadmap at stage `pr` in `upstream/tauceti_status.json` (131) was screened through its accepted explorer package for QM targets. No other overlap was found. Kac–Moody #1124 explicitly excludes Borcherds matrices, and MetaplecticAutomorphicForms has no vector-valued harmonic Maass forms.

### Bookkeeping

- `check_errata.py`'s 99 sourceVersions errors are fixed:
  - kinds are normalised to published, preprint or author copy by the URL actually opened;
  - the former descriptor is kept as `role`;
  - three errata-search and acquisition-failure records moved to `sourceSearchRecords`.
- Sources `andrews-mock-1986` and `hickerson-seventh-1988` were added, with hashes and page-image hashes.
- Coverage notes and remaining lists were updated (QM.0, QM.4, QM.5, QM.6). The changes are listed in `revision5Disposition`.
- The reader was updated in the same places:
  - the eight node sections were re-rendered from the packet (each old section was first checked to round-trip exactly);
  - the gap register, requests 7–9, upstream imports 8, 12 and 13, the baseline list, findings E633–E637 and the two references were updated or added;
  - the introduction and the coverage blocks were updated.
- 523 of 537 node sections reproduce the packet exactly. The other 14 carry status lines added by hand in earlier rounds; none was touched.
- **Suggested file.** It adds one milestone, `seventh_order_F0_hickerson`, the analytic form of Hickerson's identity for F₀ on existing carriers. The Gamma docstring now names its upstream source.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json --index <pinned declaration index>`: **0 errors, 0 warnings**. The packet has 537 nodes, 781 API items, 519 unit tests, 42 planets, 1 gap and 30 requests.
- `python3 scripts/check_errata.py` on the packet: the source-issue checks pass and the sourceVersions errors are gone. Only the file-type message "protocol must be errata-v1" remains, because the script is meant for errata files.
- `python3 scripts/check_sorry_data.py` on the suggested file: passes.
- `lean-check research/blueprint/suggested/QSeriesPartitionsAndMockModularForms.lean`: **exit 0**, ten warnings, all `declaration uses sorry` (the ten theorem signatures), no other diagnostics. The file compiled at the pinned Mathlib build.
- A Sonnet subagent independently recomputed, with its own exact integer code, every formula typed into the revised nodes and the new findings. All of them agree:
  - the Eulerian expansions and tests of F₀, F₁, F₂;
  - U_n against its closed forms for n ≤ 14;
  - the three Bailey pairs for n ≤ 7, to O(q⁶⁰);
  - the corrected Theorem 13 and Hickerson's sums in both forms, to q¹²⁰;
  - the eight fifth-order definitions, to q¹¹⁹;
  - the C7 cocycle comparison, on 400 random even Gram matrices;
  - the A₁ sign bookkeeping.

  The printed forms of E633, E634, E636 and E637 fail at the stated coefficients.

## What remains

- **QM.4.** The fifth-order Eulerian identification: plan the three QM.0 inputs above as nodes, then Andrews' Theorems 3–4, Lemma 7 and Theorem 9 as written.
- **QM.3.**
  - Vector-valued (Weil-representation) harmonic Maass forms, as needed by AGHMP §4.7 and SSTT §3.1.
  - The Gross–Zagier weight-two Hecke-trick families.

  These are the generality the maintainer's rule asks for. Generalizing the 66 scalar QM.3 contracts in place would rewrite about half the layer, and the new objects need their own nodes. Both wait for a pass with node budget; the first items of QM.3's remaining list state them precisely.
- **QM.0, QM.1, QM.2, QM.5, QM.6.** Their remaining lists are unchanged, apart from the QM.0 addition above. This includes the QM.6 granularity split of the moonshine nodes.
- **For the maintainer.** C7 deliberately keeps its positive-definite restriction, so QM.6's general-signature lattice VOA will stay a separate target with a comparison. If upstream ever generalises C7, QM.6's construction should be replaced by an import.

## Sources and access

| Source | Version and access | Read 2026-10-21 |
| --- | --- | --- |
| Andrews 1986 | AMS PDF, SHA-256 `5d91d479…`. The AMS landing page sits behind a browser check; the PDF downloads. | §§2–7 on page images |
| Hickerson 1988 | GDZ IIIF page images 00000667–00000672 of PPN356556735_0094; the volume manifest has no article structure, so pages were found by their printed labels. | pp. 661, 662, 665, 666 |
| Zwegers thesis | arXiv:0807.4834v1 | §4.4, pp. 72–73, reread |
| Upstream READMEs | AffineLieAlgebras (#1201 head 1b96abb5), ZerosOfLFunctions (roed-math cce2e041, PR #253), AnalyticNumberTheoryPartI (#1126 head 23d3de1c), AnalyticNumberTheoryPartII (#1167 head abee65e6), HabiroCyclotomicCompletions (#1314 head bf8812fb), KacMoody (#1124) and EllipticIntegrals (#1333) | read as data |

No restricted book was used. The untrusted pages fetched (publisher, GDZ, arXiv, GitHub PR files) contained no instructions.
