# Red team: algebraic coding theory links

**One medium-severity omission:** the current moonshine blueprint explicitly names Golay codes and Construction A as inputs to its unresolved Leech-lattice construction, but the accepted link map records no such consumer. Record the handoff and missing intermediate owner; do not identify ordinary binary Construction A with the Leech lattice.

Issue #4361. Codex — `codex-rtOQ9t`, 30 September 2026. Input revision `d3cbee6e139d5836e3374bf4ef440ce17074fe78`. The original author was ChatGPT Pro `cgp-f522e092da3e`, and the reviewer was Codex `codex-c83e7a`; neither is this session. The bot confirmed claim comment5909956047 before work began. Input SHA-256 hashes are in the companion JSON.

## Finding 1 — missing moonshine handoff

The map's `examined` entry for `QSeriesPartitionsAndMockModularForms` says:

> Theta/partition and moonshine applications do not state a code-stage input; the coding roadmap excludes theta-series development.

The current [moonshine packet](https://github.com/CBirkbeck/tauceti-explorer/blob/d3cbee6e139d5836e3374bf4ef440ce17074fe78/research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json), in the gap titled “The Frenkel–Lepowsky–Meurman moonshine module V♮ and its Monster action”, expressly names:

> the Leech lattice (no roadmap of the atlas constructs it; AlgebraicCodingTheory Layers 5–6 supply the Golay code and Construction A)

The entire gap was read, including its `neededBy` entries `QSeriesPartitionsAndMockModularForms:QM.6/monster-head-characters` and `QSeriesPartitionsAndMockModularForms:QM.6/monstrous-moonshine-theorem`. It is also rendered in the [blueprint README, line3823](https://github.com/CBirkbeck/tauceti-explorer/blob/d3cbee6e139d5836e3374bf4ef440ce17074fe78/research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md#L3823). This packet is **partial and unreviewed**. The evidence is a stated planned consumer and unresolved construction, not a theorem already promoted into the atlas.

Coding [Layer5](https://github.com/CBirkbeck/tauceti-explorer/blob/d3cbee6e139d5836e3374bf4ef440ce17074fe78/content/tau-ceti/AlgebraicCodingTheory/README.md#L240) constructs the explicit extended Golay code; [Layer6](https://github.com/CBirkbeck/tauceti-explorer/blob/d3cbee6e139d5836e3374bf4ef440ce17074fe78/content/tau-ceti/AlgebraicCodingTheory/README.md#L323) exports Construction A and its even-unimodular application. Those are reusable algebraic inputs regardless of coding's exclusion of theta-series development. The map currently has no overlap or request preserving this handoff, and no sibling link packet supplies it. This is a missing routing decision in the current map, not a claim that its author ignored evidence already present at the author's earlier revision.

There is a crucial limit to the correction. For every binary code `C` and coordinate `i`, `2 e_i` reduces to zero, hence belongs to `P₂(C)`. Under the roadmap's rational form,

```text
B₂(2 e_i, 2 e_i) = 4 / 2 = 2.
```

Thus `P₂(G₂₄)` contains roots. It cannot itself discharge a rootless Leech-lattice contract. The distinction is consistent with [Shimada, *A note on construction of the Leech lattice*, arXiv:2311.18309v1](https://arxiv.org/pdf/2311.18309v1), §2.1 (printed p.2) and §3 (printed p.4): roots have absolute square-norm two, and the Leech lattice is the rootless Niemeier lattice. These passages were read on 30 September 2026; no proof of Shimada's construction or of the FLM book theorem was inspected or claimed.

**Correction:** replace the stale `none` explanation with a scoped overlap/consumer request involving coding Layers5–6 and QM.6. Cite the exact pending gap and keep its status explicit. The Golay code and Construction-A interfaces retain their coding owner; the actual rootless rank-24 construction, any rational-to-real comparison, and the lattice vertex algebra/Monster constructions need their own explicit owners. Route the missing lattice-owner decision to the maintainer under PROTOCOL§15, without expanding the completed IntegralLattices roadmap in place. Install a directed edge only after the consumer construction and comparison contract are established. This follows the map's existing treatment of the unresolved GN.4 handoff and does not invent a finished Leech supplier.

## Existing links and overlap decisions

All **thirty quotations** match their source stage/document literally; all **twenty-eight supplied line ranges** contain the quoted text. I read the seven coding layers and conventions, IntegralLattices Layers1–5, and all fourteen distinct link/overlap endpoints. `ILj` and `Cj` below denote IntegralLattices and coding Layer j.

| Link | Attack and result |
|---|---|
| L01, IL1 → C6 | The full rational carrier and form are appropriate. Self-orthogonality is required before integral bundling; arbitrary code preimages are not silently integral. |
| L02, IL2 → C6 | Dual/discriminant/unimodularity reuse is restricted to the integral application. The literal arbitrary-code dual identity remains a residue calculation: testing on every `m e_i` forces dual vectors integral, then testing code lifts gives residue orthogonality. |
| L03, IL3 → C2 | The additive alphabet is a finite Q/Z-valued bilinear module. Cardinality and double-perpendicular need nondegeneracy. This does not automatically identify a Hermitian field space with that alphabet. |
| L04, IL2 → C7 | The actual dual/subtype quotient supplies the coordinate-discriminant carrier; reduction modulo m and form preservation remain required comparisons. |
| L05, IL3 → C7 | Correctly retains finite-form isometries and half-norm values, not merely additive equivalences or group orders. |
| L06, IL4 → C7 | General gluing supplies the actual `C^⊥/C` quotient after code transport. Bilinear isotropy and quadratic isotropy remain separate; the latter requires the even base. |
| L07, IL5 → C7 | A₂ has half-norm `a²/3`; D₄ has half-norm `1/2` on nonzero classes. The named F₃/F₄ maps and trace-Hermitian comparison remain coding work. Finite checks below support those specializations. |
| L08, C1 → FF.4 | Current FF.4 generator/encoding requests reuse the unbundled code carrier and matrix API. Family-specific evaluation/residue/BCH/Reed–Solomon construction stays in FF.4. |
| L09, C2 → FF.4 | Current MDS, GRS-dual and residue-code-duality statements explicitly request coding distance/Euclidean-dual conventions. No new directed pair is needed. The zero-code convention and nonzero hypotheses remain visible. |
| L10, IL1 → C7 | The lattice-side orthogonal sum differs from the finite-form sum. The pinned binary constructions do not identify a whole finite-coordinate discriminant module with a named alphabet. |

O01 correctly requests reuse of already-built coordinate powers. O02 correctly retains common finite-character/Fourier normalization work without making MacWilliams await the entirety of FF.1 or AC.0. Primitive additive characters are not injective additive maps in general; field-linearity is needed to compare a character annihilator with the Euclidean dual. O03 correctly leaves GN.4's unspecified lattice-code application unresolved. All five existing requests preserve these boundaries, including the avoidance of a C6/C7 proof cycle and the warning against a Leech identification.

## Pinned declarations checked

The reviewed AUDIT-16 records for all seven coding layers were read as discovery evidence. The following statements and assumptions were independently reopened at the required commits:

| Primary source | Material check |
|---|---|
| [Tau Ceti Coding/Basic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/InformationTheory/Coding/Basic.lean#L31) | The linear/additive aliases are exactly submodules/subgroups of arbitrary function spaces; finiteness is added by later results. |
| [CoordinatePower](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/FiniteBilinearModule/CoordinatePower.lean#L58) | Literal Pi carriers; summed pairings/quadratic values; nondegeneracy transfer; perpendicular/isotropy membership; coordinatewise bilinear/quadratic isometries. |
| [Orthogonal/Complement](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/FiniteBilinearModule/Orthogonal/Complement.lean#L106) | Subgroup cardinality product and double-perpendicular equality explicitly use nondegeneracy. |
| [IntegralLattice/OrthogonalSum](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/OrthogonalSum.lean#L80) | The binary product carrier is an actual full integral lattice with the sum form. |
| [Discriminant/Operations](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Operations.lean#L228) | The quadratic discriminant isometry of a binary orthogonal sum assumes both nondegenerate and even. Its explicit quotient representation does not perform the finite-family code comparison. |
| [Mathlib AddCharacter](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean#L100) | `PrimitiveAddChar` stores a cyclotomic-extension target; `FiniteField.primitiveChar` requires different characteristics. Nontrivial-character sums require a finite additive group and domain target; shifted sums use primitivity. |
| [Mathlib finite-character orthogonality](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean) | General normalized character orthogonality is reusable input, without a supplied code-specific subspace-annihilator comparison. |

The three source blobs recorded by the original map match these pinned sources. Broader audit absence claims remain inherited; this is not a full library or proof/axiom audit.

## Discovery and finite checks

The fresh screen covered 429 Markdown files in the raw Tau Ceti/campaign and blueprint-readme roots, 211 atlas extracts, nine proposed-roadmap definitions, 143 blueprint packets and 51 integrated decompositions. Queries covered coding names, Hamming/distance, Construction A, finite forms/discriminants/isotropy and finite Fourier/character vocabulary. Packet **gaps and requests** were screened separately from nodes; that pass matters for the moonshine omission.

Close candidate statements were read. The current FF.4 requests confirm L08–L09. ArithmeticStatistics' MacWilliams matrix-rank count is not the code weight-enumerator identity; its field-valued quadratic/symplectic spaces do not establish a code consumer. AC.0 uses probability-normalized Fourier transforms on the dual group, compatible with O02's normalization decision. FF.1's integer-measure Fourier transform and QM.1's Jacobi-index theta transformation do not specify a code-family input. GN.0's real covolume/Gram formula does not resolve GN.4's missing geometric application. Appendix “Construction A.12” and generic “construction a…” occurrences are unrelated. Negative conclusions apply to this discovery/read scope, not every possible future proof route.

Exact enumeration of the displayed matrices gave:

| Code | Number of words by nonzero weight, plus the zero word |
|---|---|
| Tetracode | `0:1, 3:8` |
| Hexacode | `0:1, 4:45, 6:18` |
| Ternary Golay | `0:1, 6:264, 9:440, 12:24` |
| Binary Golay | `0:1, 8:759, 12:2576, 16:759, 24:1` |

F₄ was computed as F₂[t]/(t²+t+1). All 4,096 hexacode Hermitian pairs and all 531,441 ternary-Golay Euclidean pairs vanish. All sixteen F₄ alphabet pairs satisfy the D₄ trace/polar identity. The ternary words have vanishing A₂ quadratic value. The displayed permutation carries the conjugate hexacode to the hexacode, whose intersection with its conjugate has four words. These finite arithmetic diagnostics support the interface checks; they are not Lean proofs or an implementation claim.

## Graph and validation

The actual `scripts.build.assemble(require_distances=False)` succeeds in memory with **2,840 stages and 8,007 edges**. All ten accepted directed pairs and corresponding consumer `requires` entries are present. A scan of all sibling link packets finds seven repeated pairs in an unreviewed IntegralLattices packet, but the accepted coding packet independently promotes every required pair; there is no dropped-dependency defect here. No generated data was written and no edge was added by this red team.

The complete original link checker reports zero errors and warnings. `scripts/check_redteam.py`, intake validation for the two authorized deliverables, and whitespace checks pass. No Lean file was required or compiled; no Lake project, library build or language server was started. The two deliverables preserve all evidence needed after scratch cleanup.
