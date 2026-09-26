# GH.8 handoff — exact-conductor character comparison

**Worker:** ChatGPT Pro — cgp-20260923-h7q4  
**Date:** 27 September 2026  
**Issue:** #740  
**Status:** partial checkpoint, not a closed blueprint or an independent review.

## What changed

The packet now has thirteen nodes: three comparisons, three theorems, five
lemmas and two applications. The three planets are unchanged. It has eleven
baseline declarations, forty-nine acceptance checks, ten supplier requests
and five gap groups. All twelve previous IDs remain. Eleven previous node
objects are unchanged; `positive-tail-corestriction` gains only a proof step
explaining how an actual first-corestriction square compares compatible
bottoms. The inherited source finding `E-GH8-1` is unchanged.

The new node `GeneralizedHeegnerCycles:GH.8/primitive-character-stabilization`
compares finite character-weighted stabilized cycle and point classes. It
requires nontriviality on the **last conductor kernel**, not just on the
whole finite Galois group. Its proof imports the existing Mathlib scalar
character-sum theorem, then partitions into cosets. Cancellation is in the
coefficient domain before acting on the module, so the comparison is integral
and permits torsion modules; there is no averaging or division by a group
order. Domain coefficients, module torsion, and exact conductor are separately
tested.

The HE.0 request now specifies the conductor-to-last-kernel adapter, HE.3 the
invariance of the restriction image and quotient equivariance, and GH.3 the
finite-character specialization and twisted descent map used by CH Lemma 5.4.
The finite-sum calculation is not a substitute for the latter map.

The reader begins with the new proof, ownership contracts, counterexamples
and reproducible diagnostics, then preserves the entire previous reader
verbatim under a historical heading. Historical reading/compilation claims
are clearly separated. The enlarged Lean prototype keeps all old statements,
adds one named signature and seven examples, and has six named signatures,
twenty-four examples and six baseline checks. It has thirty proof placeholders.
**It was not compiled in this claim.** The earlier file's recorded successful
compilation does not certify the enlarged file.

## Checks performed

The fetched checker and helper were copied exactly to a scoped scratch mirror:

- `scripts/check_blueprint.py` blob
  `75ae1b45faadb74ab6f38c6fb10da5ac949e5cd9`;
- `scripts/source_issues.py` blob
  `da67776033cefc24d185ffd47b2c74d3e9167099`.

`python3 scripts/check_blueprint.py research/blueprint/packets/GeneralizedHeegnerCycles--GH.8.json`
reported zero errors and zero packet warnings. The mirror has only the actual
stage IDs needed by this packet, read from the GH/HE campaign and GH/Regulator
atlas extracts, and no full declaration index. The checker explicitly warned
that baseline references were checked for form only. Thus this is a scoped
schema, stage-resolution and internal-DAG check, not a full checkout/intake or
new whole-library audit. Repository-wide checks are separate.

The embedded standard-library Python diagnostics passed 12,187 finite cases,
plus explicit boundary regressions. They check coefficient calculations and
normalization, not arithmetic realization or a Lean proof.

The reconstructed input files were checked against the exact fetched blobs:

- packet `108876813d3f0a965376c69f83fb8a08cbfb35dd`;
- reader `ee36068a8e8fc14f18e394de1c87f215e82ad8fd`;
- suggested file `98376d04fd298299ed9da8ed0a89cbaa12a11ebc`.

A preservation check confirmed the eleven unchanged node objects, the sole
append to the twelfth, and the unchanged source-finding object. No file outside
this job's four deliverables is submitted. No source-error verdict or
self-review metadata is added.

## Fresh reads versus inherited evidence

Fresh source reading: CH's standing hypotheses, the split recurrence, and
Section 5.2; published pp. 601 and 602 inspected as page images. The 2022
Section 5.2 and Castella's family Section 6.2, pp. 27--29, were read in parsed
text. The extra family p.28 screenshot attempt failed. No full new BDP/LZ
read or independent source-error re-adjudication is claimed. New PDF downloads
to scratch failed; the historical September-26 hashes are not new acquisition
hashes.

New library evidence at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:
`MulChar.sum_eq_zero_of_ne_one`, with its finite commutative-monoid/domain
context and complete proof, and `Equiv.sum_comp` via the pinned `to_additive`
source. File blobs are `5b3f293f24cced8669b6a5cd50efe1252fccdb06` and
`0eec64f2576f4d449b44b877678fe95678cfc9f0`. The existing dual-map declarations
were also reread. Tau Ceti remains pinned at
`f790474821cf4256814db967cb154e7af3d0c369`.

The relevant accepted AUDIT-24 GH.8 entry and supplier campaign descriptions
were reread. The direct aggregate coverage fetch returned no text, so its
previous inspection remains historical. The style references were
GrothendieckEulerForms and the relevant CharacterTheory sections. No generic
character theory, regulator, cohomology or main-conjecture owner is replanned.

## Resume here

First compile the enlarged suggested file at the pins and repair elaboration
issues without replacing any geometric carrier by an opaque stand-in. Then
instantiate the finite comparison on the actual GH.3/HE.3 objects: identify
the last conductor kernel, the restriction image, the finite-character
specialization/descent, the coefficient extension and the sign of the twist.
CH Lemma 5.4 cites Rubin Lemma 2.4.3 for that specialization; its original
proof was not acquired here.

The new result does **not** settle the initial-unit question. Keep the
conditional first-trace formula and the actual field-degree/index request.
Nontrivial ramified-character values alone do not identify an arbitrary
Iwasawa class without a separation/control theorem. An actual compatible
positive-tail comparison does determine its bottom through the first
corestriction square, but that does not identify an unverified printed formula.

The previous geometric priorities remain: finite Picard--Kummer/Gysin signs
and continuous passage; selected coefficient summand and fixed uniform
forward/backward lattice maps; repaired symmetric-power/induction carrier;
actual first trace and full-versus-half-unit normalization; regulator quotient
kernel, ordinary-line pairing, source-version twists and global localization;
and source-qualified consumer maps. General determinant and
primitive/imprimitive comparisons remain with ModularIwasawaMainConjectures L6.
The earlier checkpoints are #2953, #2962 and #3123; their mathematical reader
is preserved in full in the current document. Coverage must remain partial.
