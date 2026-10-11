# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-Tr7yZR`, 11 October 2026.
Branch: `codex-Tr7yZR-induction-restriction-package`.
The bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6106252581),
identifying claim comment 6106251524. One issue was claimed; no second job
was taken. None of the manager's priority issues appeared in the open
`swarm`, `state:available` inventory, so selection followed the fallback
package priority in WORKERS.md.

Base atlas commit: `2790a6eabe10c8b46527cb1a6333eee4d577e572`.

## Outcome and new work

**Blocked checkpoint; this package is unfinished.** The remaining supplier
ownership decisions require changes outside this issue's permitted files.
This continuation replaces the order-bound target's indirect torus proof
with an explicit native bar-chain proof, independently checked in Lean at
the Mathlib pin without admissions. The README gives the complete boundary
formula and its hypotheses; Suggested.lean has matching proof-route
comments. Its executable declarations are unchanged.

For z(a,y)=[a|y]−[y|a], set
T(a,b;y)=[a|b|y]−[a|y|b]+[y|a|b]. If a and b each commute with y, then

- d₃T(a,b;y)=z(a,y)+z(b,y)−z(ab,y).
- d₃T(1,1;y)=z(1,y), including the unnormalized unit chains.
- For Bₙ=Σ_(0≤k<n) T(xᵏ,x;y)−T(1,1;y),
  d₃Bₙ=n z(x,y)−z(xⁿ,y), for every n≥0.

Thus the native H2π quotient gives ⟨xⁿ,y⟩=n⟨x,y⟩. Its n=0 case gives
⟨1,y⟩=0; its n=2 specialization for x²=1 gives 2⟨x,y⟩=0. There is no
finiteness, cover, UCT or torus-generator assumption. The calculation only
needs each of a,b to commute with y, not commutation between a and b.

The scratch verification defined z and T as finitely supported integer
chains, proved the differential identity, the finite-sum telescoping
identity, cycle membership, the homology power law, unit vanishing and the
involution bound. `lean-check` completed with **zero errors, zero warnings,
and no `sorry`**. The proof used the exact-pin statements of
`groupHomology.d₂₁_single`, `groupHomology.d₃₂_single`,
`groupHomology.boundaries₂` and `groupHomology.H2π_eq_iff` from
`RepresentationTheory/Homological/GroupHomology/LowDegree.lean`, plus the
existing additive and finite-sum APIs. The repository remains a plan; this
scratch check does not claim a Tau Ceti implementation.

Wood's author copy, *An algebraic lifting invariant of Ellenberg, Venkatesh,
and Westerland*, §2.1, author PDF p.2, was read for the oriented cycle;
Lemma 2.2 and its proof on p.3 were read for the homology comparison. The
boundary proof is our deduction from the cycle and the library differential,
not a theorem attributed to Wood. Source URL:
https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf?download=1.
Accessed 2026-10-11; SHA-256
`9628210e96313805ceac89594c64e2eceb3aaebf044f617cee4d7f25ee7ef673`.
No source passage enters the package or handoff.

## Blocking evidence and required external amendment

The accepted packet's first gap is **Natural integral homological bridge —
supplier unassigned**. Its second restructuring proposal expressly leaves
that package to an ownership decision: there is no supplier edge until a
stage with the necessary scope exists. Its fifth gap similarly leaves
cyclic coprime complement conjugacy without an owner. Acceptance dated
2026-10-05 retains both gaps; it certifies a completed planning pass, not
closed prerequisite chains.

Issue #7592 authorizes only this package's README, Suggested.lean,
metadata.toml and this handoff. It expressly forbids changing packets.
PROTOCOL §§3, 15 and 20 require actual suppliers and prohibit duplicating
another roadmap's work. Local admitted signatures and links to their own
input-contract paragraphs cannot settle that ownership decision.

| Contract needing an assigned supplying layer | Scope that the amendment must retain |
| --- | --- |
| Native integral UCT | Arbitrary groups and abelian kernels; natural Ext injection, onto evaluation, oriented cycle formula, both variances, free-abelian Ext vanishing and infinite-group tests. Reuse native degree-one cycles and the current Ext presentation comparison. |
| Central-extension homological sequence | Exact H₂(E,ℤ)→H₂(G,ℤ)→A→Eᵃᵇ→Gᵃᵇ→0, with arbitrary central kernel, specified extension maps, section independence and the XYX⁻¹Y⁻¹ sign. |
| Finite integral homology consequences | Finite generation, underlying-set finiteness and positive-degree order annihilation. Reuse native transfer and module-homology finiteness; retain the H₀ counterexample. |
| Coprime degree-two edge | The actual multiplier-projection kernel and inclusion, induced coinvariant action, section and incoming d₃ check. |
| Cyclic complement conjugacy | Finite coprime H,C with C cyclic and H possibly nonabelian; uniform H-conjugation of an actual complement to the standard complement. |

The amendment must assign each contract once and reconcile the packet,
roadmap definition, reader, native suggested interfaces and consumer edges.
Ordinary Schur covers remain in the parent InductionRestriction Layer 7.
This run does not move a target or invent a supplier.

One refinement is ready for that amendment: remove
`InductionRestrictionPartII:RS.1/commutator-order` from the first gap's
`neededBy` list and replace its proof route by the direct boundary above.
Its existing prerequisite, `RS.1/homological-commutator`, already supplies
the native cycle formula it uses. The basic unit-cycle test also has this
direct proof. This does **not** remove the homological-commutator node from
the bridge gap: its UCT/central-extension comparison API and oriented torus
comparison still require their own inputs. Other bridge consumers remain.
No packet was edited.

## Supplier checks

Read-only TauCetiRoadmap checkout:
`070dc2becd74419e76303ede84b465ed4a69461f`.
Read-only current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Pinned baseline: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Read the current InductionRestriction and SemisimpleAlgebras READMEs in
full, the relevant AlgebraicTopology UCT scope and ProfiniteCohomology
exclusions, and the reviewed R17.5/MP.1 library-audit entries. Parent
Layer 7 owns ordinary covers and distinguishes its coefficient-dependent
H² multiplier from integral H₂. AlgebraicTopology's UCT target is singular
cohomology and does not assign the native group-bar adapter.
ProfiniteCohomology excludes the Hochschild–Serre spectral sequence; its
cohomological five-term interface does not supply the required homological
sequence or coprime edge. ProfiniteArithmetic supplies neither of those
native contracts in its README/Suggested interfaces.

Re-read current `TauCeti.ChainComplex.kronecker`,
`kronecker_homologyπ`, `kronecker_naturality` and `kronecker_bijective`:
evaluation is available, but bijectivity assumes injective coefficients.
Re-read `TauCeti.homCokernelEquivExt`, its representative formula and
coefficient naturality in `Algebra/Homology/Ext/Presentation.lean`: a
projective middle term computes Ext¹ without projectivity of the kernel.
Native bar/dual and group-map comparisons remain to be supplied. At the
Mathlib pin, `Submodule.basisOfPid` requires a finite basis index, and
`Subgroup.exists_right_complement'_of_coprime` asserts complement
existence, not conjugacy. These exact statement checks preserve the
predecessor's distinction between reusable declarations and missing
contracts. No Lake command ran in either read-only tree.

Remote upstream main was also queried and returned
`4b002f622e9d68b627bdce9f6224897305a68bdc`. It differs from the supplied
read-only checkout. The API could not compare those hashes (HTTP 404), so
this run's declaration/scope checks are expressly against the supplied
checkout, not a claimed audit of every remote difference.

## Validation and continuation

- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  **0 errors, 0 warnings**; 109 nodes, 124 API items, 96 tests, 30 planets,
  30 baseline declarations, five gaps, one request and six planned stages.
- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  **zero errors; 696 warnings, all declaration uses `sorry`; zero other
  warnings.** Memory preflight showed 102 GiB available. The wrapper
  designates Tau Ceti f790474; the shared Mathlib source HEAD independently
  matches the full pin. The Tau Ceti build tree lacks Git metadata, so its
  pin designation is the wrapper's. No compiler is left running.
- Inventory confirms every one of the 109 target suffixes, 124 API names
  and 96 test labels remains in both package files. This is a correspondence
  check, not certification of all inherited mathematical statements or
  finite certificates. README size: 169,431 bytes, within the 200 KB limit.
- `git diff --check` and the intake file check pass. Changes are confined to
  the README proof outline, Suggested comments and this handoff. The accepted
  packet, reader and author Suggested file are unchanged.
- Metadata remains absent. `issues.py:deliverables_complete` tests package
  output existence; adding metadata would incorrectly classify unresolved
  supplier contracts as a finished package.

Resume after the ownership amendment. Preserve all 109 accepted targets,
the 31 finite row certificates, 38 RS.6 targets and ten accepted source
findings. Complete the remaining mathematical audit, replace contract
references with their assigned suppliers, synchronize the target/API/test
inventory, run `lean-check`, and then add `topic = "math.GR"` metadata.
The new boundary proof requires no surviving scratch artifact: its exact
formula and quotient argument are in the README and above.

The prior UCT refinement, supplier mismatch details and accumulated finite
model receipts remain in
[the predecessor handoff at the immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/2790a6eabe10c8b46527cb1a6333eee4d577e572/research/blueprint/handoff/PKG-InductionRestrictionPartII.md)
and its continuation links. Those receipts cover rows 13/24, 16/17,
22/23 and 30/31; no finite certificate is claimed proved here. The cleared
source index was read; no restricted book was fetched or copied.
