# BP-DeformationAndDerivedPatchingAlgebra--R03.6: one declaration per node

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #552.

**Status: layer R03.6 is decomposed from its sources (coverage `source_decomposed`) and ready for independent blueprint review.** The packet stays `partial` for one reason: two inputs belong to layer R03.3, which the P7 part of this roadmap plans. They are filed as `requests` to `DeformationAndDerivedPatchingAlgebra:R03.3`.

This continues the ChatGPT Pro checkpoint of 27 September (#3265), whose handoff this note replaces. It also follows my own checkpoint of 24 September (#2775).

## What changed

### Granularity (PROTOCOL §2)

- The thirteen lemma and theorem nodes that each grouped several suggested declarations are split into **forty single-declaration nodes**. The packet grows from 26 to **53 nodes**.
- Every retained identifier now names exactly one declaration. The id plan:

  | Retained node | Now names | New nodes |
  | --- | --- | --- |
  | `nearly-faithful-iff-support-eq-univ` | `nearlyFaithful_iff_support_eq_univ` | `nearly-faithful-iff-minimal-primes-mem-support` |
  | `nearly-faithful-quotient` | `NearlyFaithful.quotient` | `radical-annihilator-quotient`, `quotient-action-kernel-bound`, `quotient-action-nearly-faithful` |
  | `nearly-faithful-base-change` | `NearlyFaithful.baseChange` | `nearly-faithful-of-base-change`, `nearly-faithful-base-change-iff` |
  | `nearly-faithful-after-inverting` | `nearlyFaithful_iff_localizedModule_away` | `nearly-faithful-iff-minimal-primes-away-mem-support`, `faithful-iff-after-inverting` |
  | `maximal-cm-support-top-components` | `isSupportedOnComponents_of_isRegular` | `maximal-depth-associated-primes-minimal`, `maximal-depth-annihilator-primes-top-dimensional` |
  | `maximal-cm-nearly-faithful-irreducible` | `nearlyFaithful_of_isRegular_of_subsingleton_minimalPrimes` | `maximal-depth-nearly-faithful-irreducible-away` |
  | `support-group-transitive` | `nearlyFaithful_of_forall_minimalPrimes_exists_smul` | `annihilator-group-stable`, `support-group-stable`, `faithful-group-transitive` |
  | `patching-nearly-faithful-descends` | `NearlyFaithful.of_patching` | `patching-radical-comparison`, `patching-reduced-quotient-iso` |
  | `patching-free-conclusion` | `free_of_patching` | `patching-kernel-equals-ideal` |
  | `r-equals-t-reduced` | `NearlyFaithful.exists_ringEquiv_of_isReduced` | `r-to-t-kernel-nil`, `r-to-t-kernel-nilpotent`, `r-red-equals-t-red`, `t-reduced-iff-kernel-nilradical` |
  | `r-equals-t-torsion-free-quotient` | `exists_ringEquiv_torsionFree_iff_faithfulSMul` | `torsion-in-kernel`, `torsion-in-nilradical`, `t-reduced-iff-after-inverting` |
  | `r-equals-t-free` | `bijective_algebraMap_iff_faithfulSMul` | `r-equals-t-of-free` |
  | `patched-module-support-theorem` | `NearlyFaithful.of_patching_of_subsingleton_minimalPrimes` (part (2)) | `patched-module-away-support` (part (3)), `patched-module-r-equals-t` (part (1)) |

- **What each leaf carries:**
  - its own statement, matching the Lean signature: every hypothesis and typeclass assumption, including superfluous ones, which the statement flags;
  - proof steps whose named facts are all prerequisites;
  - acceptance items and uses;
  - the source excerpts that support that leaf.
- **Planets and tests** stay on the node they belong to: six planets, eleven unit tests.
- **Consumers are rewired to the leaf their proof uses.** For example:
  - the patching descent cites `quotient-action-kernel-bound` and `quotient-action-nearly-faithful`, not the quotient node;
  - part (1) of the patched-module theorem cites `r-equals-t-of-free`;
  - the equidimensionality and special-fibre lemmas cite `nearly-faithful-iff-minimal-primes-mem-support`;
  - the torsion-free R = T no longer depends on the reduced R = T.
- **Proof-step text** that named an old aggregate was updated along with the edges. A scan finds no node id in any proof step that is missing from that node's prerequisites.

### Statements narrowed to their declarations

Aggregate prose that no declaration states is now a proof step, an acceptance check or an API item of `nearly-faithful`; it is no longer claimed by a leaf:
- "depth M = dim A";
- "Supp M = Spec A" for maximal-depth modules;
- the nilpotent form for all M;
- part (0) of the Calegari–Geraghty module theorem, which the README still derives from Milestone 4.

### Requests instead of gaps

- The two R03.3 obligations were gaps with a `supplier` field. They are now `requests`, as PROTOCOL §3 prescribes for a need owned elsewhere:
  - freeness of a nonzero finite maximal-depth module over a regular local ring (Stacks 00O7), needed by `patching-free-conclusion` and now also `patching-kernel-equals-ideal`;
  - catenarity as the quotient-dimension function (Stacks 0ECF), needed by `nearly-faithful-lift-from-special-fibre`.
- The P7 packet, which covers R03.3, has no node for either yet.
- The granularity gap is removed.

### Other changes

- **Baseline:** 126 declarations.
  - 28 additions from the splits, each read at Mathlib 082e2d3.
  - Two names the pinned index does not list were replaced by indexed ones: `isNoetherianRing_iff_ideal_fg` for the class field `IsNoetherian.noetherian`, and `Module.Basis.index_nonempty` with `Module.Basis.repr_self` for an anonymous instance.
- **Roadmap document:**
  - Each aggregate paragraph is now one entry per declaration, naming its node.
  - The older entries now also name their nodes.
  - The status bullet, the base-change continuation paragraph and the Milestone 5 preamble are updated. Surjectivity of R → T is assumed only where an entry says so.
- **Suggested Lean file:**
  - Every declaration of a split node has `Node: <id>` in its docstring.
  - The L6 (b) acceptance comment now names the hypothesis that is actually needed (`hmin`, lifting of minimal primes), not surjectivity.
  - No signatures changed.

## Candidates for generalisation (signatures kept, statements flag them)

- `faithfulSMul_iff_localizedModule_away` holds without `[IsReduced (Localization.Away ϖ)]`.
- `NearlyFaithful.of_baseChange` holds without `[Module.Finite A M]`.
- `NearlyFaithful.radical_map_eq_radical_ker` does not use its surjectivity argument.
- The five `r-equals-t-reduced` family declarations never use the section instance `[FaithfulSMul T H]`. An `omit … in` would generalise them.

## Checks

- **Lean:** the suggested file was compiled at the pins with the toolchain `lean` (v4.34.0-rc2) against the prebuilt Mathlib 082e2d3 oleans, as one compile with at least 20 GB free and no lake. The result is 0 errors and 95 `sorry` warnings. The file compiled before the edits as well.
- **Packet:** `scripts/check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings. `research/blueprint/intake.py check-files` reports no problems.

## For the next worker or reviewer

- R03.6 has nothing left to decompose. What remains is for R03.3 to export the two requested statements.
- Once R03.3 exports them, replace the stage prerequisite `DeformationAndDerivedPatchingAlgebra:R03.3` in the three consuming nodes with those node ids, drop the requests, and close the coverage.
- The ownership decisions of RS-08 are unchanged. R03.3 owns depth, regular-local freeness and catenarity. R03.5 and P8 own the patched constructions.
