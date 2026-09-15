# EXT-01 handoff (in progress)

Job: EXT-01 — Shared foundations. Roadmaps: DeformationAndDerivedPatchingAlgebra,
EnhancedDerivedSheaves, FoundationsAndLibraryIntegration, GeneralAlgebraicKTheory,
SchemeAndStackFoundations, StableHomotopyKTheory (60 stage records in the atlas).

This file is updated after each packet so that everything saved remains usable if the
session stops. All packets are `partial`; every node has `implementationStatus:
"unchecked"`. No Lean files, tickets, commits or edits outside this directory.

## Working order

1. StableHomotopyKTheory — done (packet written, validated).
2. GeneralAlgebraicKTheory — Quillen §§2–5; Waldhausen §1; Weibel K-book IV §6, V §§1–5;
   Schlichting (negative K). In progress.
3. DeformationAndDerivedPatchingAlgebra — Stacks Project formal deformation theory;
   Calegari–Geraghty §2; Kisin 2009; KW II; ACC+ §6.
4. EnhancedDerivedSheaves — Bhatt–Scholze pro-étale §3; Lurie HTT §4.3.2; Liu–Zheng §2.
5. SchemeAndStackFoundations — Stacks Project chapters in the library.
6. FoundationsAndLibraryIntegration — library-integration stages.

## Files written

| File | Nodes | Links | Gaps | Coverage |
| --- | --- | --- | --- | --- |
| `StableHomotopyKTheory.json` | 25 | 28 | 7 | 12/12 stages (11 partial, 1 not_read) |
| `GeneralAlgebraicKTheory.json` | 24 | 55 | 7 | 15/15 stages (14 partial, 1 not_read) |

Validation: `json.load` plus the repository's own `scripts/decompositions.py`
`merge_decompositions` run in a scratch copy with an in-memory placeholder review
(structure, node ownership, endpoints and global acyclicity all pass). The placeholder
review is not part of the packet and is not a review. The two K-theory packets link to
each other's nodes; validated jointly all links resolve (validated alone, the 17
cross-packet links of GeneralAlgebraicKTheory are reported as deferred, as designed).

## Sources read (with hashes)

- Quillen, *Higher algebraic K-theory: I*, LNM 341 (1973) — sha256 `5d2db42d…bae04`.
  §1 complete (LNM pp. 89–99), §2 opening, references.
- Weibel, *The K-book*, chapter IV online file — sha256 `9f1c1b8c…75248`.
  §§1–4 complete, §7 complete, §8 pp. IV.66–75, §2 complete.
- Carlsson, *Deloopings in algebraic K-theory*, Handbook of K-theory I.1 (2005) —
  library copy of the Handbook, sha256 `3d5b694c…b7e60`; §§1.1–1.2 (printed pp. 3–9).
- Hatcher, *Algebraic Topology*, author's online edition (public copy downloaded from
  https://pi.math.cornell.edu/~hatcher/AT/AT.pdf to scratch; sha256 `bebb3032…e5618`);
  §4.2 plus construction (printed pp. 373–374) and Exercise 23 (p. 420).

## Corrections and precision notes for existing statements

- StableHomotopyKTheory H.6: completion of homotopy groups is not just tensoring with
  Z_ℓ even under finiteness. Weibel IV 2.9: if the π_{n+1}(E; Z/ℓ^ν) are finite, lim¹
  vanishes and π_n(E; Z_ℓ) is an extension of the Tate module of π_{n−1}(E) by the
  ℓ-adic completion of π_n(E). The stage text should keep the Tate-module term.
- StableHomotopyKTheory H.3: the only existence proof read (Hatcher Prop. 4.40 and the
  perfect-subgroup construction) gives an integral homology isomorphism; the
  local-coefficient isomorphism in Weibel's Definition 1.1(2) and the universal property
  (Theorem 1.5(2)) have no proof in the sources read. The perfect subgroup need not be
  normal in Hatcher; the kernel is its normal closure.
- StableHomotopyKTheory H.4: Carlsson's printed statement of Segal's delooping theorem
  says σ_n are weak equivalences "for n > 1"; the case n = 1 must be checked against
  Segal 1974 before use.
- StableHomotopyKTheory H.5:S-delooping / GeneralAlgebraicKTheory K.4: Weibel IV 8.5.5
  derives the S.-delooping from the fibration sequence of V.1.7, which uses additivity.
  The atlas has K.4 (owner of additivity) *requiring* H.5:S-delooping. If confirmed from
  Waldhausen §1.4–1.5, additivity must be split into a node that precedes the delooping.

## Shared-supplier requests

- A construction stage for the Serre spectral sequence of a fibration with local
  coefficients and its comparison theorem (needed by StableHomotopyKTheory H.3 nodes;
  no atlas stage constructs it; Mathlib has no file named for it — unchecked beyond grep).
- A concrete spectrum model with stable homotopy category (Bousfield–Friedlander or
  symmetric spectra) — currently assigned to StableHomotopyKTheory H.5:spectra but no
  library source; next action is to download Hovey–Shipley–Smith (arXiv:math/9801077).

## Unresolved cross-job dependencies

- New node-level links into other jobs' stages (all refine existing stage-level needs,
  scope checked against the consumer stage text): H.3 → K2SymbolsBrauer:T.1:plus and
  K3BlochGroups:V.1 (EXT-18); H.2 homotopy-fibre sequence → KTheoryFiniteLocalFields:L.1
  (EXT-18, new stage-level edge); KTheoryLowDegrees:U.1 and Z.1 (EXT-18) → H.4 nodes.
- H.4 cofinality node → GeneralAlgebraicKTheory:K.2:plus (this job).

## Next actions

1. GeneralAlgebraicKTheory: Quillen §§2–5 proofs (Q-construction, π₁BQ = K₀,
   additivity/characteristic sequences, resolution, dévissage, localization);
   Waldhausen §1.3–1.6 (S., additivity, delooping, fibration, approximation) to settle
   the K.4 / H.5:S-delooping ordering; Weibel IV §6 and V §§1–5; Schlichting for K.6.
2. Then DeformationAndDerivedPatchingAlgebra.
