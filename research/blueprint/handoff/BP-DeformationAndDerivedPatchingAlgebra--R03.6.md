# Handoff: BP-DeformationAndDerivedPatchingAlgebra--R03.6

Layer: DeformationAndDerivedPatchingAlgebra:R03.6, "Support, components and descent".
Outputs: the packet, the roadmap document for the layer, and the suggested Lean file.
Baseline: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

## What is closed

The packet has 22 nodes (2 definitions, 13 lemmas, 7 theorems), 19 API items, 11 unit tests, 71 baseline
declarations, no gaps and no requests. Every prerequisite chain ends in a Mathlib declaration whose statement was
read in its source file at the pinned commit, in a node of this packet, or in one of the two stage ids named below.
The prerequisite graph is acyclic.

- **Definitions.** `nearly-faithful` uses the radical form Ann_R(M) ⊆ √0. Its API covers Taylor's nilpotent form
  when the annihilator is finitely generated or R is Noetherian, the support characterisations for finite M,
  faithful ⇒ nearly faithful, and "R reduced ⇒ nearly faithful ⇔ faithful". A unit test (Stacks 0EGG) separates it
  from the nilpotent form. `supported-on-components` is defined through the primes minimal over the annihilator, and
  it is characterised by irreducible components for finite modules.
- **Support transport.** `support-base-change` covers finite M along any map and any M along flat maps.
  `support-restrict-scalars-surjective`, `nearly-faithful-restrict-scalars-surjective`, `nearly-faithful-quotient`,
  `nearly-faithful-base-change` (including coefficient change) and `framing-variables` follow. None of them needs a
  Noetherian hypothesis. Supp(M/IM) = Supp M ∩ V(I) is the baseline declaration `Module.support_quotient`, not a node.
  Faithful flatness of power series rings is not planned: removing framing variables uses the quotient by the
  variables together with base change, and the kernel of the constant coefficient (finitely many variables) is part
  of `framing-variables`.
- **Inverting ϖ.** `minimal-primes-of-torsion-free` needs no DVR or Noetherian hypothesis.
  `nearly-faithful-after-inverting` includes the faithful variant when R[1/ϖ] is reduced.
- **Components.** `maximal-cm-support-top-components` has M ≠ 0. `nearly-faithful-maximal-depth-equidimensional`
  is Calegari–Geraghty Remark 6.5. `maximal-cm-nearly-faithful-irreducible` assumes a
  unique minimal prime. `support-group-transitive` needs neither a finite group nor a finite module.
  `nearly-faithful-lift-from-special-fibre` is Taylor's Lemma 2.2(2).
- **Patching.** `patching-nearly-faithful-descends` takes Calegari–Geraghty's hypothesis
  ı(𝔞) ⊆ ker φ + Ann(M∞). `patching-free-conclusion` requires M∞ ≠ 0 and does not require near faithfulness.
  `patched-module-support-theorem` is Calegari–Geraghty's Theorem 6.4 in module form, applied to the patched module
  of R03.5. It is the only node that lists R03.5.
- **R = T.** In `r-equals-t-reduced`, "T reduced" is necessary and sufficient. The main content of
  `r-equals-t-torsion-free-quotient` is "H[1/ϖ] faithful ⇔ R^tf ≅ T". `r-equals-t-free` requires faithfulness.

Four nodes go beyond the layer's first outline:

- `nearly-faithful-lift-from-special-fibre` and `nearly-faithful-maximal-depth-equidimensional`, as instructed.
- `nearly-faithful-restrict-scalars-surjective`: near faithfulness along a surjection, "N nearly faithful over B iff
  Ann_A(N) ⊆ √(ker φ)". It is an API item of the definition, made a node because `nearly-faithful-quotient` and the
  lift lemma use it.
- `patched-module-support-theorem`: the stage's "derive when a patched module is faithful, nearly faithful, or
  supported on a specified union of components", stated for R03.5's patched module.

The layer has six planets:

- Nearly faithful module
- Support under base change
- Maximal Cohen–Macaulay support
- Patched module support theorem
- R = T up to nilpotents
- Integral R = T from faithfulness

The plan put the patching planet on the descent lemma. It now sits on the assembled theorem, which is the named
result. The last planet was renamed because its hypothesis is now faithfulness rather than freeness.

Complex-level statements, including Calegari–Geraghty Proposition 6.6, belong to P9. The document's Boundaries
section and the packet's coverage notes both say so.

## What remains

- **The R03.3 imports**, until R03.3 has a blueprint. `maximal-cm-support-top-components`,
  `patching-free-conclusion` and `nearly-faithful-lift-from-special-fibre` cite the stage
  DeformationAndDerivedPatchingAlgebra:R03.3 as a whole, for these facts:
  - depth M ≤ dim A/𝔭 for 𝔭 ∈ Ass M (Stacks 0BK4);
  - Ass M ≠ ∅ for M ≠ 0;
  - the Krull dimension of a Noetherian local ring is finite;
  - a finite module of maximal depth over a regular local ring is free (Stacks 00O7, or Auslander–Buchsbaum 090V);
  - to apply the lift lemma to catenary rings: 𝔭 ↦ dim A/𝔭 is a dimension function on a catenary Noetherian local
    ring (Stacks 0ECF).

  The lift lemma states catenarity in this dimension-function form, which can be stated at the pin.
- **The R03.5 input**, until R03.5 has a blueprint. `patched-module-support-theorem` cites the stage
  DeformationAndDerivedPatchingAlgebra:R03.5 as a whole for the patched module and its properties.

Coverage for the stage is therefore `partial`.

## Source issues

- **DeformationAndDerivedPatchingAlgebra/E1 (misprint).** Calegari–Geraghty's Theorem 6.4(1) prints R for R∞. The
  atlas register already records this slip as PAPER-CALEGARI-GERAGHTY-18/E141 (confirmed). The bracket part is in
  the authors' 2022 Correction. The entry's `known` field says both.
- **DeformationAndDerivedPatchingAlgebra/E2 (error).** Taylor's Lemma 2.3 omits M ≠ 0. This is new: the register has
  no entry for Taylor 2008. PAPER-CALEGARI-GERAGHTY-18/E130 records the analogous omission in Calegari–Geraghty.

Nothing about these two issues exists yet under research/blueprint/errata/.

## Checks run

- **Blueprint checker.** `python3 scripts/check_blueprint.py` on the packet reports 0 errors and 0 warnings. With the
  worker declaration index passed as `--index` it also reports 0 errors and 0 warnings, so every baseline reference is
  found under its full name.
- **Baseline name corrected.** The planning baseline named a Mathlib lemma `minimalPrimes_annihilator_subset_associatedPrimes`.
  Its full name is `Module.associatedPrimes.minimalPrimes_annihilator_subset_associatedPrimes`, and the packet uses that.
- **Unnamed instances.** The packet cites no Mathlib instance without a name in the index. Two facts are cited
  through named declarations instead:
  - "a nonzero free module is faithful", through `Module.Free.chooseBasis`;
  - faithful flatness under base change, through `Module.FaithfullyFlat`.
- **Names.** A script compared the packet with the Lean file. Every suggested declaration, API item and unit test in
  the packet appears in the Lean file under the packet's name. The Lean file's only other names are five test helpers
  in `SuggestedTest`.
- **Text checks.**
  - The packet contains no local paths and no Lean code.
  - The roadmap document is 4,721 words.
  - The document uses no Lean code blocks and none of the words "deferred" or "optional".
- **Lean.** The suggested Lean file elaborates against the pinned Mathlib with `sorry` as its only warning (81 warnings,
  no errors). It was compiled with the pinned Lean toolchain (v4.34.0-rc2) on the prebuilt Mathlib build, without
  lake.

## Fields beyond the protocol's template

- Each node has `suggestedDeclarations`, the Lean names of its declarations in the suggested file.
- The Stacks source keeps `pageHashes`: one SHA-256 per tag page read. The live pages carry comments, so a later fetch
  may hash differently.
- The coverage record has `notes`, holding the P9 boundary and the two plan changes: the quotient-support lemma is a
  baseline citation, and power-series faithful flatness is dropped.
