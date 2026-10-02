# DESIGN-HodgeStructuresPartII — all-order affine tensor checkpoint

Codex — codex-J6LwjP; Refs #3371. Partial checkpoint based on bdfc250. Claim5958216969 was confirmed by bot5958219587; the complete issue was reread after confirmation. The [predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/bdfc250/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md) preserves the wider source and augmentation/rank experiments. Those historical receipts are inherited, not repeated checks here.

## Delivery and mathematical boundary

Thirteen new H.0 nodes give two native constructions and eleven lemma nodes, including two consumed affine-contraction APIs promoted from the existing construction. Eleven new declaration signatures, seven APIs and seven examples extend ordered Higgs iterates to every N≥0. Import Mathlib TensorPower, singleton/multiplication/cast/unit equivalences, native dual pairing and piTensorProduct basis. No generic tensor/basis carrier is replanned. The newest factor is prepended; the coefficient formula is an ordered list product in the possibly noncommutative End algebra. The base scalar ring alone is commutative. At N=0 the empty contraction is id_E, not zero.

The exact coefficient formula needs neither integrability nor finite basis. Its converse zero criterion requires a chosen finite basis only of Q, never E. The seven new proved examples cover the tensor-unit boundary, positive iterates of the zero field, nonzero scalar iterates at every order, a nonzero Z/4 scalar field with square-zero iterate, and zero/subsingleton-coefficient/nonzero-scalar successor steps. The inherited E12/E21 N=2 example still checks factor order. These are affine module examples; none instantiates an omitted global bundle.

All75 predecessor IDs and statements,74 full node objects,115 APIs,107 tests,149 routed obligations,source findings,five requests,eleven gaps and six planets remain. Only ordered-coordinate-vanishing proof/prerequisites are refined. Counts:88 nodes (12 definitions,22 constructions,35 lemmas,14 theorems,five comparisons),122 APIs,114 total tests,112 required definition/construction tests,105 baseline entries. Every node is unchecked; H.0 partial,H.1–H.8 not_read,zero stages/keys closed. Preserve parent Hodge L0–L3, D3 common variations, CR.1 ordinary connections,E1 generic sheaf tensor/dual/descent and DD.1 filtration/Rees ownership. Spectral image/coherence/twisting stays with the p-adic Simpson consumer.

## Fresh reading

Full predecessor handoff and scoped packet contracts, actual roadmap stage descriptions/requires and reserved key read. Full reviewed parent Hodge L0–L3 and E1/D3 audit rows, CR.1/E1/DD.1/D3 stage contracts and current Hodge upstream README read. Other nearby upstream documents retain continuous-session readings. No separate reviewed PartII audit row was found; this is not an implementation conclusion. Twenty-three new baseline entries record full named statements and construction/proof reading at Mathlib082e2d3, with exact modules, lines and file hashes.

Fresh primary evidence: complete [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4), including image algebra, canonical section and twisting, publisher HTML SHA256 f70c37b9ea04164e15efe2dfe2754cd5eb605adb008260000153ce279a9f4934. Complete [Liu–Zhu Theorem2.1(i)–(v), PDFp.7, and Lemma2.15 with proof, pp.18–19](https://arxiv.org/pdf/1602.06282v3), PDF SHA256 8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79. The source's logarithm/characteristic-polynomial nilpotence argument motivates the adapter; our tensor recurrence and coefficient proof are algebraic deductions, not misattributed printed results. No correspondence proof or other full-paper reading claimed. All accepted route contracts and findings are preserved; no new source error is asserted.

## Immutable proof and admitted sketch

The [immutable proof source](https://github.com/CBirkbeck/tauceti-explorer/blob/ea49500be7122dfa7b09c7128537d8a304dae405/research/blueprint/suggested/HodgeStructuresPartII.lean) restores the actual contraction/reconstruction/square prefix and appends all eleven actual new proofs and seven actual new tests. Its exact445-line narrow extraction includes14 examples and passes with zero errors,warnings or admissions. Twenty kernel axiom audits have no admission dependencies; only propext,Classical.choice and Quot.sound occur. Runtime3.00 seconds,maximum RSS2942916 KiB,67 GiB available before compile. Existing exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 were used; one bounded process, no project/cache/library build/LSP.

Proof SHA256:

- Full immutable source: ea88d223a722d734a190368f979b3235f0da621a9e1ca9d904600b79e7e3dd9d.
- Narrow extraction: 0bdf51d8056063efdc38796d1f76b09f39b0bf88fc7fdd7a93988263c5d1ea99.
- Extraction with audits: cd5c5b3e1edbdd9be9ed60334fcdd79f6f9ad552574bdb99b5ebfcea81dfd61b.
- Normalized audit log: 3a9f4aa995dbfa80b6ca5d4955ca53c9887e8a2cecba81a418ce85795901eb58.

To reproduce, run the following in a checkout containing the immutable commit, then elaborate iterate-axioms.lean from an already existing exact-pin build under WORKERS memory/process/time rules. The recipe extracts the source verbatim and injects only axiom print commands.

```python
from pathlib import Path
import subprocess
commit = "ea49500be7122dfa7b09c7128537d8a304dae405"
path = "research/blueprint/suggested/HodgeStructuresPartII.lean"
s = subprocess.check_output(["git", "show", commit + ":" + path], text=True)
imports = "\n".join(l for l in s.splitlines() if l.startswith("import Mathlib"))
a = s.index("namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle")
b = s.index("/-- Affine adapter", a)
fragment = imports + "\nopen scoped TensorProduct\nnoncomputable section\n" + s[a:b]
fragment += "\nend TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle\n"
Path("iterate-native.lean").write_text(fragment)
names = ['affineContractions', 'affineContractions_apply', 'affineContractions_zero', 'affineContractions_reconstruct', 'affineOrderedSquare', 'affineOrderedSquare_apply', 'affineOrderedSquare_zero', 'affineOrderedSquare_contraction', 'affineOrderedSquare_eq_zero_iff', 'affineOrderedStep', 'affineOrderedIterate', 'affineOrderedIterate_zero', 'affineOrderedIterate_succ', 'affineOrderedStep_contraction', 'affineOrderedIterate_contraction', 'affineTensorPower_coordinate', 'affineOrderedIterate_eq_zero_iff', 'affineOrderedStep_zero', 'affineOrderedStep_add', 'affineOrderedIterate_zero_field']
audits = "\n".join("#print axioms TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle." + n for n in names)
Path("iterate-axioms.lean").write_text(fragment + "\n" + audits + "\n")
```

Under PROTOCOL section13 the current submitted signatures and examples have admitted bodies. The entire suggested file, all Mathlib imports, elaborates:73 examples,zero errors,184 admitted-declaration warnings,no other warnings. Runtime4.00 seconds,maximum RSS2937240 KiB,69 GiB available. The35 inherited global signature omissions remain; this does not certify them, global sheaf statements or any stage. No TauCeti compiled import set is required or claimed for this file.

Submitted suggested SHA256 055c383caade3e28edf700be28447603ac43dcee5c6b9636063943234fbae24e; normalized log SHA256 16410b26a650f836ab34891268d4f172ca8adc9c55d4b72c97d7185464a1eb0d.

## Validation and resume

Indexed packet and five-file intake/whitespace checks pass. Reader includes each new statement, input, API and test; predecessor mathematical/source/owner preservation passes. Actual read-only atlas assembly gives88 declaration nodes/six planets, no own pending or skipped links, unchanged stage edges and unrelated deferred links. The stage/planet DAG has3022 vertices,8663 edges,including51 existing virtual supplier endpoints. The own prerequisite DAG has88 vertices,168 edges. The combined stage/planet plus scoped prerequisite graph has3105 vertices,8869 edges and89 reachable declarations; no node-to-realises attachment is inserted. All acyclic,zero unresolved references. No atlas/site output was written.

Next establish change-of-chart and scalar/restriction compatibility, identify the native degree-two tensor power with the existing Q⊗Q square, then apply E1 sheaf tensor-power/equality-detection/gluing contracts. The global ordered-coordinate theorem remains open despite its checked all-N affine calculation. Resume the canonical TauCeti augmentation bridge only with an existing exact compiled import set; do not build it. Keep same exponent, source ideal and noncommutative End target. Supply field/reduced-ring rank bounds with genuine hypotheses, coefficient/Tate equivariance, CR.1/DD.1/period adapters, global determinant/descent, and source-decompose remaining routes before advancing H.1–H.8. Scratch is deleted after PR submission; the immutable proof recipe and receipts above preserve the reproducible work.
