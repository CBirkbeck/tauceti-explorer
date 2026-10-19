# Handoff: REV-MotivicEtaleKTheory--M.6a

Issue #10795. Codex, session `codex-QtLh43`; claim confirmed by the bot on
19 October 2026 at 16:33:37 UTC. The input was authored by the independent
session `codex-IvZaYn` in PR #10967. This is a finished review, not a checkpoint.

## Completed

Accepted the M.6a planning pass after reviewing all 21 nodes, 4 pinned baseline
declarations, 45 distinct exact foreign supplier nodes, the 3 supplier extension
contracts, 59 API requirements, 26 named Checks, 5 planets and both source
issues. Per-node verdicts: 19 verified, 2 corrected, none unverifiable. Counts
and node identities are unchanged; no baseline reference needed replacement.
Coverage remains planned, packet status complete, implementation unchecked.

The report and packet give the full review. Corrected the proof sketches for
local-frame vanishing and the canonical Postnikov rank map, adding the latter's
direct Postnikov prerequisite. The reader incorporates those corrections,
source-review limits, assigned red-team routing and assembly obligations.

The compact suggested file now has `import Mathlib`, two real light definitions,
six named admitted theorem targets and four proved examples, two per definition.
The vertex and interior-point geometric Checks are named theorem targets.
No example or data definition is admitted. Spectra and exact-category targets
whose carriers are unavailable at the pins remain in the reader.

The current queue assigns M.6a only. M.6b, M.7 and M.8 in the older embedded
brief are separate jobs. No second job was claimed and no foreign file edited.

## Supplier work before closure

The packet's three requests give exact consuming IDs and source locators:

1. **StableHomotopyKTheory:H.5:spectra:** small filtered support homotopy
   colimits, simplicial realisation, stable finite exactness, Fubini and
   filtered homotopy-group comparison; Eilenberg–MacLane realisation;
   coherent tower/presheaf and Nisnevich replacements; finite averaging after
   inversion; total face cubes and compatibility with the K-spectrum
   Ω-prespectrum/Waldhausen presentations. Its sequential telescope alone
   does not supply this contract.
2. **SchemeKTheoryOperations:S.5:** KH for the normal-crossing boundary of
   the vertex-semilocal simplex, closed-cover descent, low-degree K→KH
   comparison, and the resulting multirelative K₀ exact sequence. This does
   not assume ordinary K closed descent for a singular union.
3. **SchemeAndStackFoundations:SF.5:** proper-intersection Tor lengths and
   Serre vanishing over regular schemes essentially smooth over a perfect
   field, including successive faces and flat degeneracies. The current
   algebraically closed-base statement needs this extension.

M.6b imports the adjacent stable triangles and
πₘLᵖK=CHᵖ(X,m)=H²ᵖ⁻ᵐ(X,ℤ(p)). It supplies its own exact couple,
connectivity/convergence and operations. The degreewise bound p>dim X+n
does not truncate the realised tower.

## Assembly adapters and an older proof to replace

The M.5d packet contains six older, broader M.6a IDs. Preserve references to
them by redirecting or adapting them to these refined targets. All IDs below
have prefix `MotivicEtaleKTheory:M.6a/`:

| Legacy suffix in M.5d | Refined suffixes in this packet |
| --- | --- |
| admissible-k-supports | facewise-supports |
| homotopy-coniveau-tower | support-tower; functorial-tower |
| moving-and-excision | moving-with-constraints; localisation-excision |
| k-theory-well-connected | well-connected-theory; semilocal-criterion; k-well-connected |
| coniveau-cycle-layer | point-layer-model; pointwise-cycle-map; face-rank-compatibility; layer-cycle-equivalence |
| global-model-comparison | face-exact-coherent-model; levine-global-comparison; friedlander-suslin-support-tower; friedlander-suslin-global-layer |

The old M.5d `k-theory-well-connected` proof still claims K₀(R/I)=ℤ for the
semilocal simplex boundary. Replace it with this packet's `k-well-connected`
proof: K₀(R)→K₀(R/I) is injective by rank at any vertex, even though the
boundary K₀ is ℤ² for n=1. The source issue and corrected argument are both
reviewed here. The older packet is outside this issue's permitted edits.

The earlier BP handoff's assertion that no incoming request names M.6a needs
this qualification: the M.6 packet's `chern-character-edge-comparison` request
addresses the old `global-model-comparison`. It asks for equality with
Levine's rational cubical cycle class (Levine 1994, Theorem 3.1), including
signs and map compatibility. The integral M.6a layer equivalence does not prove
that stronger identification. M.6/M.6b assembly must supply its map-level
adapter; do not mark the request satisfied by the present equivalence alone.

## Attached findings

- **RT-AREA-ktheory-1/2:** Beilinson–Lichtenbaum and the number-ring reduction
  remain M.5d/M.7 inputs, imported by M.6b's finite-coefficient comparison.
  M.6a proves no étale identification from a Milnor-K statement.
- **RT-AREA-ktheory-1/3:** real KO/BO, real Bott periodicity and Suslin's real
  comparison belong to M.7/ArithmeticKTheory:N.5 and their dyadic tables.
- **RT-AREA-ktheory-2/18:** place Soulé finite Chern classes and their product
  formula once in the M.7-dependent portion of M.8; HB.1/HB.2/D.2 import it.
  M.6a introduces no Chern construction.

## Sources and existing work

All four public source hashes match the packet. Two HCT arXiv-v1 proof issues
are independently confirmed: Theorem 6.4.1, p.36, has the incorrect boundary
K₀ rank; Corollary 4.2.4, p.26, uses one nonzero vector as a full normal frame.
The latter is a proof gap, not a claim that the general purity conclusion is
false. Trivialised local purity and K-specific dévissage/rank suffice here.

The arXiv record lists only v1; the author's publication list provided no
linked correction for this paper. The publisher PDF returned HTTP 403, so no
published-version collation or novelty claim is made. URLs, exact versions,
hashes and the access limitation are in the packet and reader. No book or
restricted text was needed; no source passage or source file is committed.

Checked the reviewed library audit, RS-08 and its review, the relevant
upstream AlgebraicVectorBundles and AlgebraicTopology material, and current
Tau Ceti vector-bundle/K₀ sources. Read-only roadmap commit:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current library commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing work is imported.
Ordinary S.4 coniveau is not replanned, and no upward-tier notion was moved.

## Validation and resumption

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.6a.json`:
  **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.6a.lean`:
  exit **0**, exactly **6 declaration-uses-sorry warnings**, no other warnings
  or errors. All four examples are proved. Mathlib pin:
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin:
  `f790474821cf4256814db967cb154e7af3d0c369`. The file imports only Mathlib.
  Memory was checked and Lean calls were sequential through the shared wrapper.
- Cross-artifact checks cover every node statement, hypothesis, proof step,
  acceptance criterion, prerequisite, API requirement and named Check in the
  reader. Source hashes and review-node coverage match. The file has 113 lines.
- Intake file checks: **5 files, 0 problems**. `check_sorry_data.py` and
  `git diff --check` pass.

Resume from the committed packet and reader for assembly; from the three
requests for supplier extensions. The review itself is finished. No scratch
file is needed, and this review does not establish a formalisation.
