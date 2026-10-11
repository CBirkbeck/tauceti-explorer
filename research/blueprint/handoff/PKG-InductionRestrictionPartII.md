# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-Sab9f8`, 11 October 2026.
Branch: `codex-Sab9f8-induction-restriction-package`.
The bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6106392582),
identifying claim comment 6106391584. One issue was claimed; no second job
was taken. None of the manager's priority issues appeared in the open
`swarm`, `state:available` inventory, so selection followed the fallback
package priority in WORKERS.md.

Base atlas commit: `9dc0fd5222fd32551e4379b6893ff72744f7f682`.

## Outcome and new work

**Blocked checkpoint; this package is unfinished.** The remaining supplier
ownership decisions require changes outside this issue's permitted files.
This continuation gives a direct proof route for the existing
`integral_uct_evaluation_free` specialization and uses its injectivity in
`marked_pullback_split`. It reduces what the latter's final splitting step
requires, including when the marked group and kernel are infinite. The
README contains the argument; Suggested.lean has matching comments. Its
executable declarations are unchanged. No new target or supplier is added.

For the integral trivial-action bar complex, Z₁=C₁. If H₁ is free, split
q:C₁→H₁ by s and put r₁(c)=c−s(q(c)). This retracts the free C₁ onto B₁,
so B₁ is projective as a direct summand. Split d₂:C₂→B₁ by t and put
r₂(c)=c−t(d₂(c)); this retracts C₂ onto Z₂.

- A two-cocycle F with zero evaluation vanishes on Z₂. Set ψ=F∘t.
  Then F=ψ∘d₂, and ψ∘r₁ is a one-cochain whose coboundary is F.
- A functional h:H₂→A gives λ:Z₂→A by the native homology quotient.
  The cochain λ∘r₂ restricts to λ. Since r₂ fixes B₂ and λ kills B₂,
  it is a cocycle and evaluates to h.

Thus evaluation is bijective in this specialization without constructing
the general Ext injection or using arbitrary-rank subgroup-freeness.
Splittings occur only in the proof; the evaluation map remains canonical.
For the marked pullback, only this injectivity is needed once its
evaluation is zero and its abelianization is identified with the free
degree lattice. Native evaluation, group-map naturality and the comparison
with the existing factor-set splitting criterion are still required.

The independent scratch Lean check proved the module mechanism over an
arbitrary ring: a surjection to a projective module has a kernel
retraction; a projective middle term makes that kernel projective;
functionals extend along the retraction; a functional vanishing on the
kernel factors through the surjection; and the two degree-two consequences
above follow. The quotient specialization was checked as well. The final
`lean-check` returned **zero errors, zero warnings and no `sorry`**.
It used the exact-pin statements of `Module.Projective.of_free`,
`LinearMap.exists_rightInverse_of_surjective`,
`Module.Projective.of_split`, and the existing linear-map quotient APIs.
This check does not implement the native bar/dual comparisons or prove the
package's admitted declarations.

Read Hatcher, *Algebraic Topology*, §3.1, printed pp.191–196: in particular
the cycle/boundary argument on pp.191–193, Lemma 3.1 on pp.194–195,
Theorem 3.2 on p.195 and naturality on p.196. The direct projective-quotient
proof is our deduction, using the library lifting statements, rather than
a separately attributed theorem. Public author copy:
https://pi.math.cornell.edu/~hatcher/AT/AT.pdf. Accessed 2026-10-11;
SHA-256 `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618`.
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

Two refinements are ready for that amendment:

- For `RS.2/marked-pullback-split`, replace the general UCT-exactness/Ext
  proof step by native evaluation and its free-abelianization injectivity
  as above. Keep the native evaluation adapter as an input: this target
  cannot be removed wholesale from the bridge gap yet.
- The predecessor's direct bar-boundary proof, retained in the README,
  removes `RS.1/commutator-order` from the first gap's `neededBy` list.
  The homological-commutator node still needs its UCT/extension and oriented
  torus comparisons. The immutable predecessor handoff below records the
  boundary formula and admission-free verification.

Other bridge consumers remain. No packet was edited; its SHA-256 remains
`85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5`.

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

These scope checks are against the supplied read-only checkouts. No
external ownership amendment was available during this run. The manager
was asked for the missing supplying layers; none is invented here.

## Validation and continuation

- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  **0 errors, 0 warnings**; 109 nodes, 124 API items, 96 tests, 30 planets,
  30 baseline declarations, five gaps, one request and six planned stages.
- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  **zero errors; 696 warnings, all declaration uses `sorry`; zero other
  warnings.** Memory preflight showed 101 GiB available. The wrapper
  designates Tau Ceti f790474; the shared Mathlib source HEAD independently
  matches the full pin. The Tau Ceti build tree lacks Git metadata, so its
  pin designation is the wrapper's. No compiler is left running.
- Inventory confirms every one of the 109 target suffixes, 124 API names
  and 96 test labels remains in both package files. This is a correspondence
  check, not certification of all inherited mathematical statements or
  finite certificates. README size: 171,268 bytes, within the 200 KB limit.
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
The direct free-abelianization proof requires no surviving scratch artifact:
its retractions, functional extensions and coboundary argument are in the
README and above. Scratch files are removed after the pull request opens.

The prior native boundary proof, UCT refinement, supplier mismatch details
and accumulated finite model receipts remain in
[the predecessor handoff at the immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/9dc0fd5222fd32551e4379b6893ff72744f7f682/research/blueprint/handoff/PKG-InductionRestrictionPartII.md)
and its continuation links. Those receipts cover rows 13/24, 16/17,
22/23 and 30/31; no finite certificate is claimed proved here. The cleared
source index was read; no restricted book was fetched or copied.
