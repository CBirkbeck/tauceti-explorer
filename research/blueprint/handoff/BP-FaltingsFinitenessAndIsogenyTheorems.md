# Handoff — BP-FaltingsFinitenessAndIsogenyTheorems

Job `BP-FaltingsFinitenessAndIsogenyTheorems`, issue #729. Agent: Claude Code, session `cc-7b31c4`,
24 September 2026.

Deliverables:

- `research/blueprint/packets/FaltingsFinitenessAndIsogenyTheorems.json` — 32 nodes, 25 API items, 17 unit
  tests, 18 planets, 27 pinned baseline declarations, 13 gaps, 4 requests, 2 structural proposals.
  `python3 scripts/check_blueprint.py`: **0 errors, 0 warnings**.
- `research/blueprint/readmes/FaltingsFinitenessAndIsogenyTheorems.md` — the roadmap document, 1665 lines.
- `research/blueprint/suggested/FaltingsFinitenessAndIsogenyTheorems.lean` — 274 lines of signatures.

## What this packet is

This roadmap already had a **reviewed integrated decomposition** of Faltings' 1983 paper and its 1984 erratum,
accepted on 16 September 2026 after an independent review that checked all 32 nodes and 40 drafted links on page
images, with high-resolution zooms on three passages, and made twelve corrections. The job instructions say to
build on it: keep its node ids, refine them to declaration granularity, and reuse its verified locators.

That is what this packet does. Every one of the 32 node identifiers is kept, with the statements, hypotheses,
proof steps, acceptance tests, locators and excerpts as the review left them. What is added is what a blueprint
packet needs and a decomposition does not:

- **prerequisites**, derived from the decomposition's 43-link graph and resolved to the pinned libraries, to
  nodes of this packet, or to a named supplier stage;
- an **API outline with unit tests** for each of the two definitions and three constructions — the Hodge line
  bundle, the modular height, the correspondence stack, the polarisation reduction and the quaternion
  construction — which is where a formalisation actually starts;
- **planets**, at most six per layer, 18 in all;
- a **coverage record** per layer, all six `source_decomposed`;
- **baseline declarations**: 27, each with a note saying what the pinned libraries do have and what they do not.

## What was read in this session, and what was not

This matters and the packet says so in three places (the source records, a gap, and the document).

- **Faltings 1983 and the 1984 erratum were not re-read.** Springer is paywalled and no free copy was
  obtainable. The packet inherits the reviewed locators and excerpts and claims nothing beyond them.
- **The two freely available sources were re-fetched and re-hashed**, and both reproduce the recorded SHA-256
  byte for byte: Raynaud's paper from Numdam (`05cad2f5…`) and the SLMath copy of SGA 7 I (`17286b0f…`). That
  was the first check this job made, and it is the strongest corroboration of the decomposition's provenance
  available without the paywalled files.

Every excerpt longer than 400 characters was truncated at a word boundary with an ellipsis, and each such
source reference says so and points at the decomposition, where the full quotation sits with its verification.

## What is closed, and what remains

All six layers are `source_decomposed`: every section of the paper the roadmap covers is decomposed to
declaration granularity. The packet is **not** closed, and cannot be, because it has four open requests and
thirteen gaps. Eleven of the gaps are carried forward from the decomposition — they are the boundaries Faltings
himself imports (Tate's p-divisible groups, Zarhin's idempotent argument, SGA 7 I, Baily–Borel, Namikawa,
Deligne–Mumford, Hermite–Minkowski with ramification restricted to `S`, Torelli, Faltings' own auxiliary paper
for the logarithmic-singularity proof, the finiteness of invariant lattices, and Raynaud's theorem having no
supplier stage). Two are this job's own and are described above and below.

The reviewed library audit records **all six layers as not built**. Neither pinned library has a polarisation of
an abelian variety, a moduli space, a Néron model, a p-divisible group, a Tate module of an abelian variety, an
arithmetic degree or a Faltings height. Nothing in this packet duplicates the libraries.

## Requests

- `NeronModelsAndSemistableAbelianVarieties:R11.3` — semistable reduction after a finite extension, and the
  monodromy criterion. Used by the polarisation reduction and by the unramifiedness step of the determinant
  computation.
- `AbelianSchemesAndArithmeticModuli:A6` — the Tate module of a Weil restriction as an induced module. Faltings'
  auxiliary polynomial is the characteristic polynomial of Frobenius on an exterior power of it.
- `WeightsInEtaleCohomology:R34.2` — the Weil bound for abelian varieties. Consumed three times.
- `ArithmeticGaloisRepresentations:R01.6` — the Tate module with its Frobenius polynomial and independence of `l`.

## One supplier correction, and why it is a finding

The decomposition routes five inputs — two Chebotarev, three class field theory — through
`FoundationsAndLibraryIntegration:LI.4`. That roadmap was **retired on 16 September 2026**, the same day the
decomposition was reviewed, and `data/roadmap-retirements.json` says plainly that a retired roadmap is never a
supplier and that its consumers take the results from the libraries or from the roadmaps it names under
`coveredBy`.

This packet therefore drops those five prerequisites. The two Chebotarev inputs are routed to the pinned Tau
Ceti Chebotarev development (`NumberField.Chebotarev.frobeniusPrimeSet` and `NumberField.exists_auxiliaryPrime`),
which is cited in `baseline.declarations`. The three class field theory inputs have no non-retired supplier: what
is needed is that a continuous character of the absolute Galois group of `ℚ` with `ℓ`-adic unit values,
unramified outside `ℓ`, is a power of the cyclotomic character times a character of finite order. The retirement
record names `tauceti:TauCetiRoadmap/ClassFieldTheory` as a covering roadmap, but its layer identifiers are of
the form that cannot appear as a prerequisite (the checker parses them as baseline declarations), so no request
is filed and the need is recorded as a gap and as a structural proposal.

## Structural proposals

1. **The Chebotarev and class field theory suppliers need re-pointing**, as above: either give this roadmap an
   explicit supplier stage for class field theory, or give the covering roadmap's layers identifiers of the
   ordinary stage form.
2. **R28.5 should be divided.** It carries both the finiteness theorems (Satz 5, Satz 6 and their inputs) and
   the two applications that follow (curves of genus at least two, and Mordell through Parshin). The two halves
   have different acceptance tests, and the atlas already assigns the Parshin reduction to
   `HeightsRationalPointsAndObstructions:RP.4`. Dividing the layer would make the boundary between what this
   roadmap proves and what it consumes visible.

## Did the Lean file compile?

**No.** No Lean toolchain at the pinned commits was available in this session, and the shared Mathlib build on
this machine is a cache a worker must not rebuild. Every Mathlib and Tau Ceti name the file is written against
was confirmed present in the pinned declaration index. Because the audit records all six layers as not built,
almost every signature in the file is opaque; what is imported appears as a `variable` or a structure field and
never as an invented definition.
