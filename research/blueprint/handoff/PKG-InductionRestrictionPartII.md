# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-0RDX2k`, 11 October 2026.
Branch: `codex-0RDX2k-induction-restriction-package`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6105942875)
at 05:44:24 UTC, identifying claim comment 6105941964.
Base atlas commit: `1e244e56b469b0c84906f48d7f670d09780fd895`.

## Outcome

**Blocked checkpoint; the package is unfinished.** The native UCT proof
contract now identifies the evaluation kernel with an explicit Hom cokernel
and reuses the current Tau Ceti projective-presentation comparison with Ext.
Pinned native degree-one cycle declarations eliminate an unnecessary general
subgroup-freeness step. The README distinguishes the remaining arbitrary-rank
boundary-projectivity input and group-map comparison from existing results.
Suggested.lean has matching comments; no executable declaration changed.

No issue in the manager's priority list was in the available swarm inventory.
The first fallback plan review, #1726, had an unfinished author checkpoint,
so it was ineligible under WORKERS' finished-plan condition. This package was
the first eligible fallback by kind before new planning. One issue was
claimed; no second job was taken.

## Blocking evidence

The accepted packet's first gap is **Natural integral homological bridge —
supplier unassigned**. Its second restructuring proposal leaves the generic
integral homology and central-extension package to an ownership decision for
a continuation, with no supplier edge until a stage exists. The fifth gap
asks for an owner for cyclic coprime complement conjugacy. Neither names a
readable supplier layer. The accepted review dated 2026-10-05 retains these
gaps; acceptance certifies a completed planning pass, not closed prerequisite
chains.

Issue #7592 forbids packet changes and permits only the three package outputs
and this handoff. PROTOCOL §§3, 15 and 20 require actual supplier chains and
prohibit duplication. An admitted signature or a link to the package section
containing it does not assign an owner. Resolving the packet's explicit
continuation boundary requires a planning amendment outside this job's files.

The required external change is to assign matching supplier layers, or revise
planning ownership so that actual layers of this roadmap own the necessary
contracts. Reconcile the packet, roadmap definition, reader, and suggested
interfaces, adding supplier edges and preserving the full API/tests.
Ordinary Schur covers remain in parent InductionRestriction Layer 7. The local
package queue has no preceding dependency, so repeated package checkpoints
cannot settle this decision. No queue, issue label, or upstream file was
changed here.

## New proof refinement and reuse

The README's **Native UCT evaluation** subsection specifies the map from
K=Hom(B₁,A)/im(Hom(Z₁,A)) to the evaluation kernel: ψ represents the cocycle
ψ∘d₂, corestricting d₂ to B₁. A zero-evaluation cocycle factors through B₁;
coboundaries give precisely the restrictions from Z₁. Extending maps on Z₂
to C₂ proves evaluation onto when B₁ is projective. These proof extensions do
not define a natural splitting.

- Current `TauCeti.homCokernelEquivExt`,
  `Algebra/Homology/Ext/Presentation.lean:86`, identifies K with categorical
  Ext¹(H₁,A) using 0→B₁→Z₁→H₁→0 with projective middle term. Its
  `homCokernelEquivExt_mk` at line 93 fixes the pushout representative;
  `homCokernelEquivExt_naturality` at line 109 gives coefficient naturality.
  It needs no projectivity of B₁ for this Ext comparison. Group-map
  naturality still needs comparison of the native short exact sequences and
  their extension classes, followed by comparison with the derived Ext
  bifunctor in the package signature. A new general resolution-comparison
  theory is unnecessary.
- At the recorded Mathlib pin,
  `groupHomology.d₁₀_eq_zero_of_isTrivial`,
  `RepresentationTheory/Homological/GroupHomology/LowDegree.lean:138`,
  and `groupHomology.cycles₁IsoOfIsTrivial` at line 360 identify Z₁ with the
  free bar term C₁, with B₀=0. They apply to infinite G as well. Thus the
  Ext comparison's middle-term projectivity is supplied by native
  declarations and free-module projectivity.
- At that same pin, `Submodule.basisOfPid`,
  `LinearAlgebra/FreeModule/PID.lean:299`, requires a finite basis index.
  It proves B₁ free for finite G, but is insufficient for the unrestricted
  evaluation-surjectivity signature. General B₁ projectivity remains part
  of the UCT supplier contract. This checks the scope of this particular
  declaration; it does not claim that every possible library formulation
  has been ruled out.
- Read Hatcher's author PDF, *Algebraic Topology*, §3.1, printed pp.191–196:
  cycle/boundary construction pp.191–193, Lemma 3.1 pp.194–195, Theorem 3.2
  p.195, and naturality p.196. The package records the argument in its own
  words with these locators, retaining arbitrary coefficients and the
  distinction between a natural exact sequence and a chosen splitting.

The current Ext presentation module is absent at the Tau Ceti pin. It is
current-library reuse evidence, not a new import into the pinned Suggested
file. These changes refine an existing contract; no mathematical target,
signature, unit test, or ownership edge was added.

## Supplier checks and required amendment

Read-only TauCetiRoadmap commit:
`070dc2becd74419e76303ede84b465ed4a69461f`.
Read-only Tau Ceti commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Pinned baseline: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Read the current InductionRestriction and SemisimpleAlgebras READMEs in full,
parent Layer 7, the relevant AlgebraicTopology README/Suggested UCT interfaces,
and ProfiniteCohomology's scope and five-term inventory. Read the reviewed
library audit: no direct Part II entry; R17.5 and MP.1 supply factor-set and
projective-lifting information. Parent Layer 7 retains ordinary covers and
distinguishes its H²(G,kˣ) multiplier from integral H₂. The singular UCT does
not assign the native group-bar adapter; the profinite five-term sequence is
cohomological and that roadmap explicitly excludes the Hochschild–Serre
spectral sequence.

Read current Kronecker statements at `Algebra/Homology/Kronecker.lean:98,105,116,177`:
evaluation and chain-map naturality are available; bijectivity requires
injective coefficients. Read native transfer at
`RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:107`:
subgroup-index multiplication, combined with positive-degree trivial-group
vanishing, gives the order-annihilation argument. Read
`Algebra/Homology/ShortComplex/ModuleCat.lean:35`: noetherian middle terms give
`Module.Finite` homology; set finiteness also needs the order annihilator.
Read `Subgroup.exists_right_complement'_of_coprime` at the Mathlib pin,
`GroupTheory/SchurZassenhaus.lean:277`: complement existence, no conjugacy
assertion. These results narrow the missing work without supplying all the
required native contracts or their ownership.

| Contract requiring an assigned supplier | Scope and consumers to retain |
| --- | --- |
| Native integral UCT | Arbitrary G and abelian A; canonical Ext injection, onto evaluation, oriented cycle formula, group/coefficient variance, free-abelian Ext vanishing, and infinite-group/kernel tests. RS.1 compatibility and RS.2 marked pullback/kernel comparison. Reuse the native cycles and current Ext presentation described above. |
| Central-extension homological sequence | Arbitrary central abelian kernel; exact H₂(E,ℤ)→H₂(G,ℤ)→A→Eᵃᵇ→Gᵃᵇ→0, section independence, specified extension maps and sign XYX⁻¹Y⁻¹. RS.1 homology-image equality and RS.5 cover diagrams. |
| Finite integral homology consequences | Native finite generation, set finiteness and positive-degree order annihilation; reuse current transfer and short-complex finiteness. RS.3 finite-level action and RS.5 primary support; retain the H₀ counterexample. |
| Coprime degree-two edge | For the specified finite coprime semidirect product, identify the multiplier-projection kernel with native coinvariants, retaining the inclusion map, action and incoming d₃ check. RS.5 homological inputs and RS.6 odd-index-two reduction. |
| Cyclic complement conjugacy | For finite coprime H,C with cyclic C and possibly nonabelian H, every complement in H⋊C is H-conjugate to the standard one. RS.5 admissible inertia classes; retain the Sylow-induction proof route and all three conjugacy tests. |

The first gap names twelve consumers; the fifth names
`RS.5/admissible-inertia-classes`. The amendment must reconnect their actual
prerequisite edges. Bibliographic citations alone cannot replace them.

## Validation and continuation

- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`
  exited 0: no errors, 696 declaration-uses-`sorry` warnings, no other
  warnings. Memory preflight showed 99 GiB available. The helper is configured
  for Tau Ceti f790474; the shared build's Mathlib manifest and source HEAD
  both match the full recorded Mathlib pin. One final comment-only
  clarification followed the compile; executable declarations are identical.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
  reports zero errors and zero warnings: 109 nodes, 124 API items, 96 tests,
  30 planets, 30 baseline declarations, five gaps, one ordinary-cover request,
  six planned stages and no closed stages. The accepted packet is unchanged.
- Inventory finds all 109 target suffixes, 124 API suffixes and 96 test labels
  in both package files. This does not certify the mathematics of every
  inherited statement or finite certificate. README size is 167,380 bytes,
  within the 200 KB limit.
- Local intake file validation and `git diff --check` pass. Only the package
  README, Suggested comments, and this handoff change. The executable Lean
  plan, packet, reader, and author Suggested file are unchanged.
- `metadata.toml` remains absent. The package completion detector uses output
  existence, so adding it would incorrectly classify the unresolved package
  as complete.

| Artifact | SHA-256 |
| --- | --- |
| `packets/InductionRestrictionPartII.json` | `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5` |
| `packages/InductionRestrictionPartII/README.md` | `5703d12ab110776d9bd2e7eb0b2ba84547bc198e0b5dba79cebfd60e3c5ea9a9` |
| `packages/InductionRestrictionPartII/Suggested.lean` | `5514649c61862239312c61ecbeac42fc9b052bb39c11dd7941476c248e845093` |

Resume after the ownership amendment. Preserve all 109 accepted targets,
the 31 row-certificate obligations, 38 RS.6 targets and ten accepted source
findings. Concrete marked models, projections, embeddings, centralizer data
and relation subgroups remain required. Complete the mathematical audit,
replace each contract reference by its assigned supplier, check the amended
target/API/test inventory, rerun `lean-check`, then create metadata with
`topic = "math.GR"`.

Prior supplier mismatches, source findings and accumulated finite-model
calculation receipts remain in
[the inherited handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/1e244e56b469b0c84906f48d7f670d09780fd895/research/blueprint/handoff/PKG-InductionRestrictionPartII.md)
and its immutable continuation links. Those receipts cover affine sum kernels
in rows 13/24, SL₂(𝔽₃) in rows 16/17, Heisenberg models in rows 22/23, and
inverse-transpose SL₃(𝔽₂)/wreath models in rows 30/31. No finite certificate is
claimed proved here. The cleared source index was read; no restricted source
or source passage was copied. No scratch artifact is needed to resume.
