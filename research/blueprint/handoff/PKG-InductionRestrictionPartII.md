# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-yUbJZ8`, 11 October 2026.
Branch: `codex-yUbJZ8-induction-restriction-package`.
Base atlas commit: `1c06f95484a07926ea860dbcec1344dc75b9c275`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6107731749),
identifying claim comment 6107730701. The issue was reread after confirmation.
None of the manager's forty priority issues was in the available swarm
inventory. No eligible finished-plan or package review was available; this
package was chosen among the two available fallback packages. Only this job
was claimed.

**Blocked; the package remains unfinished.** This continuation changes only
this handoff. The accepted mathematical plan explicitly leaves prerequisite
ownership unresolved. Completing that ownership amendment requires files
outside this package job's four authorized deliverables. The obstruction is
scope, not elapsed time or a Lean error. README and Suggested.lean are
preserved; metadata is absent because the package is incomplete.

## Evidence and the decision required

The packet in this clone and GitHub main have the same Git blob,
`55ac5635e31f335b01e148781a4d7bfa4d78cd77`. Its accepted review leaves six
stages planned, five gaps and one ordinary-cover request. Its rescope proposal
explicitly requires assigning the generic integral homology and
central-extension theory to an owner before adding a supplier edge. The
cyclic-complement conjugacy gap separately requires its general finite-group
owner. The issue prohibits packet edits and directs plan mistakes to this
handoff; PROTOCOL §§3, 15 and 20 require actual supplying dependencies and
agreement with the accepted plan.

Freshly searched roadmap definitions, reserved node IDs, key-definition
owners and the supplied current upstream roadmap tree for the precise native
UCT, homological five-term and cyclic-complement contracts. The exact
unassigned contracts were found in this roadmap's definition; no assigned
replacement was found. This is a targeted supplier check, not a claim that
no related mathematics exists anywhere.

The maintainer must assign genuine supplier roadmap/layer IDs and reconcile
the accepted packet, its definition, reader and suggested interfaces. The
following contracts retain the scope already required by the accepted plan:

| Required input | Scope to preserve | Immediate consumers |
| --- | --- | --- |
| Integral degree-two UCT | Arbitrary groups and abelian coefficients with trivial action; native cycle evaluation; natural Ext injection in both variances; free-abelianization injectivity, including infinite groups. | RS.1 homological commutator and reduced-cover comparisons; RS.2 marked pullback splitting and universal comparison. |
| Central-extension homological sequence | Exact H₂(E,ℤ)→H₂(G,ℤ)→A→Eᵃᵇ→Gᵃᵇ→0 on the specified extension maps; transgression evaluates the oriented cycle as XYX⁻¹Y⁻¹; independence of sections. | RS.1 homology image; RS.2 universal kernel; RS.5 compatible covers. |
| Finite integral homology | Positive-degree finiteness and group-order annihilation, reusing native transfer; preserve the H₀ exception. | RS.3 finite-level action; RS.5 multiplier primary support and central coprime splitting. |
| Coprime degree-two edge | Native semidirect-product inclusion and projection; multiplier coinvariant action; split edge filtration; account for the possible incoming d₃. | RS.5 multiplier-kernel primary support; RS.6 odd-index-two reduction. |
| Cyclic complement conjugacy | Finite coprime H,C, with C cyclic and H possibly nonabelian; one H-conjugator identifies the actual complements in H⋊C through their projection maps. | RS.5 admissible inertia conjugacy and class bijection. |

Ordinary Schur covers continue to belong to parent InductionRestriction
Layer 7. Do not fold the arbitrary-kernel homological theory into that parent
citation or substitute H²(G,kˣ) for integral H₂(G,ℤ). Keep RS.6's 31 finite row
certificates and all 38 RS.6 targets in the eventual package; their prescribed
certification obligations are retained, not claimed as implemented here.

The queued package currently has `after: []` and state `pending` in
`research/blueprint/queue.json`. A handoff-only merge releases it again.
The maintainer should gate this package on the ownership amendment and its
supplier packages; neither queue editing nor manual relabelling is authorized
for this worker. Repeating the same supplier search and unchanged compilation
cannot resolve the ownership decision.

## Fresh reading and library checks

Read the current upstream InductionRestriction and SemisimpleAlgebras
READMEs, including parent Layer 7's separation of integral homology from
factor-set cohomology. Read AlgebraicTopology Stage 6's singular-chain UCT
and ProfiniteCohomology Layer 5's cohomological five-term sequence and
spectral-sequence exclusion. Neither supplies the native group-bar comparison
and homological transgression named by this packet. Inspected the relevant
reviewed R17.5 and MP.1 library-audit entries.

The supplied read-only TauCetiRoadmap tree is at
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`; current Tau Ceti is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither was changed or used to
run Lake. Read these current declarations and their variable contexts:

- `TauCeti.ChainComplex.kronecker`, `kronecker_homologyπ` and
  `kronecker_naturality` provide generic evaluation and chain-map naturality.
  `kronecker_bijective` requires `Injective Y`; it cannot replace the
  arbitrary-coefficient integral UCT.
- `TauCeti.homCokernelEquivExt` assumes a short exact sequence with projective
  middle term. Its representative formula and coefficient naturality supply
  reusable Ext inputs, not the missing native group-bar comparison.
- `TauCeti.groupHomology.transfer_comp_map_subtype_id` supplies transfer
  followed by inclusion as subgroup index times identity in every degree.
  Preserve that reuse rather than planning transfer again.
- At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
  `Subgroup.exists_right_complement'_of_coprime` and its left-complement
  corollary conclude complement existence; neither concludes conjugacy.

Freshly read Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh,
and Westerland*, §2.1, Lemmas 2.2–2.4 and Theorem 2.5, author PDF pp.2–4
(*Research in the Mathematical Sciences* 8 (2021), Article 21). Theorem 2.5
pulls a central extension back to the marked fiber product, using its free
abelianization and the arbitrary central kernel as coefficients. Restricting
that input to finite or injective coefficients would lose this application.
The inverse marking correction is already recorded in the inherited plan and
package; this continuation makes no new source-error claim.

Source receipt: [public author PDF](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf?download=1),
accessed 2026-10-11; SHA-256
`9628210e96313805ceac89594c64e2eceb3aaebf044f617cee4d7f25ee7ef673`.
The web reader could not serve this PDF; the same public author URL was read
using a direct download into scratch. Read the cleared-library index; no
restricted source was copied. All repository source descriptions are authored
paraphrases.

## Validation and resumption

- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  **0 errors, 0 warnings**; 109 nodes, 124 API items, 96 tests, 30 planets,
  30 baseline declarations, five gaps, one request, six planned stages and
  zero closed stages.
- Fresh `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  **exit 0, 696 declaration-uses-sorry warnings, zero errors and zero other
  warnings**. Memory preflight: 92 GiB available. The wrapper reported
  pinned Mathlib `082e2d37e8`. No compiler remains running.
- All 32 explicit packet `declarationName` values, 124 API names and 96 test
  names occur in both package files after removing the common namespace
  prefix. This is name presence only, not a mathematical correspondence
  certificate or a proof of any admitted example.
- README: 171,706 bytes, SHA-256
  `2194010224101d49bf7b8b6ae15598bd6231bdc0c10588b09c558d1789a6662a`.
  Suggested.lean: 191,498 bytes, SHA-256
  `32b58343fb5be7e738e1f5a075add4d9ccd3cef8239f1c9a89fc8f4727cb30e7`.
  Both are unchanged. The accepted packet SHA-256 is
  `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5`.
- `git diff --check` and `python3 research/blueprint/intake.py check-files
  research/blueprint/handoff/PKG-InductionRestrictionPartII.md` pass.

Resume after the ownership amendment. Complete the mathematical
correspondence audit against all 109 targets, preserve the parent-cover
boundary and finite certificates, and elaborate again after any signature
changes. Add `topic = "math.GR"` only when the package is complete.

The [preceding handoff at this immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/1c06f95484a07926ea860dbcec1344dc75b9c275/research/blueprint/handoff/PKG-InductionRestrictionPartII.md)
preserves earlier source receipts, the separate admission-free mutation and
boundary proofs, finite-model receipts, and continuation links. None of those
proofs is attributed to this session or repeated as new work. No scratch file
is needed to resume.
