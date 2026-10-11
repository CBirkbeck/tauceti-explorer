# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-1DTuZ3`, 11 October 2026.
Branch: `codex-1DTuZ3-induction-restriction-package`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6105575515)
at 04:49:37 UTC, identifying claim comment 6105574583.
Base atlas commit: `98e12a03c5d9478e5c37363f8a3daa086ac341cd`.

## Outcome and scope

**Blocked checkpoint.** The README now reuses current Tau Ceti's
`CategoryTheory.ShortComplex.finite_homology` for the finite-generation step
of integral group homology. It specifies the native inhomogeneous chain
complex, its finite free middle term, and the distinction between
`Module.Finite` and finiteness of the underlying group. This avoids planning
another generic finite-generation theorem or a singular-homology comparison
for that step. A comment in Suggested.lean records the reuse and the older
compilation pin. All signatures and imports are unchanged.

The inherited Kronecker-evaluation and first-homology reuse, concrete RS.6
models and supplier boundaries remain in place. No second job was claimed.
None of the forty manager-priority issues appeared in the live
`swarm`/`state:available` inventory. No eligible finished-plan or package
review was available, so this package preceded new planning in the fallback
order. The accepted packet remains unchanged.

The accepted packet explicitly leaves two prerequisite owners unassigned:
its first gap covers the native integral homological bridge, and its fifth
gap covers complement conjugacy for a cyclic coprime quotient. Its
restructuring proposal treats the former as an ownership decision requiring
a continuation, rather than an existing dependency. The issue authorizes
only the three package files and this handoff and forbids packet changes.
Consequently, the necessary ownership amendment cannot be made in this job.
This is a scope blocker, not a time or Lean failure.

The local queue still gives this package `after: []`. Package-only iterations
cannot resolve the missing owners. The maintainer should make the planning
amendment before offering this job for another package pass. This is a
recommendation; no queue, label or upstream file was changed.

## What must change before resuming

Assign the following five contracts to actual supplier layers and reconcile
the accepted packet, reader and suggested file. The proposed RS.1/RS.5
placements below are inherited proposals, not ownership assignments by this
session. Another supplier must match the carriers, hypotheses, maps and
naturality. Preserve the parent Layer 7 request for ordinary Schur covers.

| Contract | Required planning amendment |
| --- | --- |
| Native integral UCT | Before RS.1 reduced covers, give H²(G,A) → Hom(H₂(G,ℤ),A) for arbitrary groups G and abelian A, its oriented cycle formula, surjectivity, and the specified Ext¹(Gᵃᵇ,A) injection. Preserve naturality in both group and coefficients, free-abelian Ext vanishing, the definition's API and its discriminating tests. |
| Central-extension class map and five-term sequence | Before RS.1 `homology_image`, supply the section-independent class-map construction and exactness of H₂(E,ℤ) → H₂(G,ℤ) → A → Eᵃᵇ → Gᵃᵇ → 0, with arbitrary abelian central kernels and the commutator sign XYX⁻¹Y⁻¹. Reuse the factor-set and abelianization interfaces. |
| Finite integral homology | Before RS.1 order arguments, supply positive-degree finiteness and annihilation by the finite group order. Reuse current native transfer and `CategoryTheory.ShortComplex.finite_homology` on the native finite free chain modules. Retain the tests distinguishing positive degrees from H₀. |
| Coprime degree-two edge | Before RS.5 multiplier and compatible-cover results, supply the natural degree-two reduction, including the inclusion-induced map, the quotient action on normal-subgroup homology, coinvariants and the incoming d₃ check. RS.6 imports the odd-index-two specialization. |
| Cyclic complement conjugacy | Before RS.5 admissible inertia classes, supply H-conjugacy of complements in H⋊C for finite coprime H,C with C cyclic, including nonabelian H. Preserve the Sylow-induction proof route and the three existing conjugacy tests, or identify an actual finite-group supplier with this scope. |

The first unassigned gap names twelve consuming nodes, including
`reduced-cover`, `homology-image`, `marked-pullback-split`, `compatible-covers`
and `odd-index-two-reduction`. The conjugacy gap directly affects
`admissible-inertia-classes`. Adding admitted signatures or a source citation
alone does not assign these prerequisites under PROTOCOL §§3, 15 and 20.

## Fresh supplier checks

Read-only TauCetiRoadmap commit:
`070dc2becd74419e76303ede84b465ed4a69461f`.
Current read-only Tau Ceti commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read InductionRestriction and SemisimpleAlgebras READMEs in full; inspected
the relevant suggested interfaces, AlgebraicTopology Stage 6 and
ProfiniteCohomology's five-term scope. The reviewed library audit has no direct
Part II entry. R17.5 and MP.1 concern factor sets and projective lifting, not
the required arbitrary-coefficient integral bridge.

- Parent InductionRestriction Layer 7 owns ordinary representation groups.
  Its `schurMultiplier` interface uses scalar-valued second cohomology and
  explicitly distinguishes integral second homology. Keep the ordinary-cover
  request; do not use that layer as an unstated general homological supplier.
- AlgebraicTopology Stage 6 states the UCT for singular cochains. Using its
  generic free-chain argument on native group bar complexes still needs the
  assigned comparison and naturality interface. ProfiniteCohomology supplies
  a cohomological five-term sequence and excludes the Hochschild–Serre
  spectral sequence from its scope.
- Current `TauCeti.ChainComplex.kronecker` and `kronecker_naturality`,
  `Algebra/Homology/Kronecker.lean:98,116`, already provide evaluation and
  chain-map naturality without assuming injective coefficients. Reuse these
  when building the bar adapter; do not rebuild the generic evaluation map.
  In contrast, `kronecker_bijective`, line 177, requires an injective
  coefficient object. It does not supply the arbitrary-coefficient Ext
  injection, its exact image or both variance contracts required here.
- Current `TauCeti.groupHomology.transfer_comp_map_subtype_id`,
  `RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:107`,
  gives index multiplication in every degree. Use it for annihilation; finite
  generation and the extension spectral-sequence contracts remain separate.
  Current-only modules cannot be imported into the older compilation pin.
- Current `CategoryTheory.ShortComplex.finite_homology`,
  `Algebra/Homology/ShortComplex/ModuleCat.lean:35`, already proves
  `Module.Finite` for the homology of a short complex with noetherian middle
  module. At the Mathlib pin, `groupHomology.inhomogeneousChains`
  (`RepresentationTheory/Homological/GroupHomology/Basic.lean:155`) has term
  `(Fin n → G) →₀ A`, and `groupHomology` (line 230) is its homology. For
  finite G and A = ℤ with trivial action, this term is finite free over ℤ,
  hence noetherian. Apply the existing theorem to the degree-n short complex;
  no singular-chain comparison is needed for finite generation. This also
  applies in degree zero, where the underlying group is infinite. The
  positive-degree annihilation argument remains needed to deduce set
  finiteness. This current Tau Ceti module is absent from the older
  compilation pin, so it is documented rather than imported. Its existence
  narrows the missing construction work but does not assign the full
  finite-homology contract to an actual roadmap layer.
- At the same Mathlib pin, `groupHomology.H1AddEquivOfIsTrivial`
  (`RepresentationTheory/Homological/GroupHomology/LowDegree.lean:1023`),
  its `H1AddEquivOfIsTrivial_single` formula (line 1044),
  `groupHomology.H1π_comp_map` (`Functoriality.lean:387`) and
  `TensorProduct.rid` (`LinearAlgebra/TensorProduct/Associator.lean:72`)
  supply the first-homology input by specialization and tensor-unit
  composition. The README records the naturality check on generators.
  This reuses baseline mathematics rather than asking a new owner to
  reconstruct H₁ or abelianization.
- At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
  `Subgroup.exists_right_complement'_of_coprime`,
  `GroupTheory/SchurZassenhaus.lean:277`, concludes complement existence.
  Its statement has no conjugacy conclusion.

Two accepted atlas suppliers were also checked by their actual statements:

| Candidate | Why it does not resolve the required contract |
| --- | --- |
| `ArithmeticGaloisDuality:D7/finite-group-uct-sylow` (accepted 10 October 2026) | It states a tensor/Tor homological UCT for finite G, integral-coefficient cohomological Ext, finite-field duality and Sylow detection. It does not supply H²(G,A) with the specified Ext injection for arbitrary G and A, or the central-extension five-term comparison and coprime d₃ contract. |
| `ArithmeticStatistics:ST.5/complements-of-a-coprime-abelian-normal-subgroup-are-conjugate` | Its normal subgroup H is explicitly abelian. RS.5 needs nonabelian H as well. The node's prose names `ArithmeticStatisticsPartIIRandomGammaGroups` as a general supplier, but no packet, reader or suggested artifact with that name exists in this atlas checkout; that prose is not a readable dependency contract. |

`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect` confirms the baseline H₁
specialization above. Its supplier packet is unnecessary for the package's
baseline imports; it does not supply the missing degree-two bridge.

The preceding handoff records primary-source checks for Hatcher,
*Algebraic Topology*, §3.1, Theorem 3.2, printed pp.195–196, Conrad,
*The Schur–Zassenhaus theorem*, Remark 5, printed p.4, and earlier Löh
checks. Those source inspections are inherited, not repeated in this
session. This pass read the actual library statements and supplier plans
above. The cleared-source index was read; no restricted book was obtained.
No source passage or source file was added.

## Validation

- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`
  completed with **exit 0, zero errors, 696 warnings, all declaration uses
  sorry, and zero other warnings**. Preflight showed 101 GiB available. The
  helper targets Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the
  Mathlib source HEAD and build manifest agree on
  `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  The four reuse comments were added after that check; executable Lean text
  is unchanged.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
  reports **zero errors and zero warnings**: 109 nodes, 124 API items, 96
  tests, 30 planets, 30 baseline declarations, five gaps, one request and six
  planned stages, none closed. This does not close the ownership gaps.
- A fresh inventory finds all 109 target-name suffixes, 124 API-name suffixes
  and 96 test labels in both package files. This is a name inventory, not a
  mathematical audit of every inherited statement or finite certificate.
  The README is 163,063 bytes, below the 200 KB limit.
- Local intake validation reports three permitted changed files and zero
  problems. `git diff --check` passes. The package completion predicate is
  false because metadata is absent, so this remains a checkpoint.

| Final artifact | SHA-256 |
| --- | --- |
| `packets/InductionRestrictionPartII.json` | `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5` |
| `packages/InductionRestrictionPartII/README.md` | `8a996dffd1e5a97280fdd189107bc656e8e652d771af079e5dc9ba0dd429cd98` |
| `packages/InductionRestrictionPartII/Suggested.lean` | `b706dc2f3414afa5a140b3f2b7b4982b073a5357d60f785166bf19a17314afd8` |

## Inherited receipts and continuation

The preceding checkpoint and links to the full accumulated notes are retained in
[the handoff at the base commit](https://github.com/CBirkbeck/tauceti-explorer/blob/98e12a03c5d9478e5c37363f8a3daa086ac341cd/research/blueprint/handoff/PKG-InductionRestrictionPartII.md).
They include finite-model calculations, source hashes, the nonsplit C₄→C₂
UCT test, oriented extension maps, the noncentral C₃⋊C₂ tail test, the
coprime-edge d₃ argument and the complement-conjugacy tests. Those receipts
are inherited and were not all repeated here.

Retain all 109 targets, 31 row-certificate obligations, 38 RS.6 targets and
the ten accepted source issues. Preserve actual projections, embeddings,
centralizer enumerations, relation subgroups and group-valued outputs.
Rows 13/24 use affine sum kernels; 16/17 use native SL₂(𝔽₃) graph/sum
models; 22/23 use Heisenberg graph/sum models; 30/31 use inverse transpose
on SL₃(𝔽₂) and its full wreath model. Further details and calculation
provenance remain in the permanent inherited handoff.

Resume with a maintainer planning amendment assigning the five contracts,
including the exact group-complex comparison; merely repeating the package
pass cannot change the explicit unassigned gaps. Then reconcile every
dependency and native interface, complete the package audit, rerun the checks
and add `metadata.toml` with `topic = "math.GR"`. Metadata remains absent now:
`issues.deliverables_complete` otherwise classifies the package by output
existence and would treat this unresolved checkpoint as a completed job.
No scratch artifact is needed to resume.
