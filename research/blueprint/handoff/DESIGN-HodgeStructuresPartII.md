# DESIGN-HodgeStructuresPartII — ordered affine square checkpoint

Codex — codex-5ebb6f; Refs #3371. Partial checkpoint. Claim comment5957813346 was confirmed by bot5957816082; the complete issue was reread after confirmation. Base 10fbe71f06e15275bec06bdcc8e7c4bc931c1636 includes merged predecessor PR#5812. The [previous handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/10fbe71f06e15275bec06bdcc8e7c4bc931c1636/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md) preserves wider source/route history, the augmentation/span proof experiment and its finite regression script. Those historical receipts are not fresh checks here; the finite script was not rerun.

## Delivery

Four new H.0 nodes give finite-basis contraction reconstruction, the native ordered second iterate, its exact two-slot contraction formula and finite-basis zero criterion. Six new declaration signatures and four tests use the existing tensor/module/basis/endomorphism objects. The only changed predecessor node is ordered-coordinate-vanishing: its statement/hypotheses remain identical; its proof/prerequisites now consume the actual affine N=2 contracts. The arbitrary-N unit/induction and sheaf gluing remain open.

All71 predecessor statements,70 complete predecessor node objects,112 APIs,103 tests,149 routed obligations,five requests,eleven gaps and six planets are preserved. Roadmap stage IDs/requires and owner prerequisites remain unchanged. The embedded overview is refreshed to the current mathematical scope; the full reader remains definitive. Counts:75 nodes (12 definitions,20 constructions,24 lemmas,14 theorems,five comparisons),115 API items,107 total tests,105 required definition/construction tests,82 baseline references and six planets. H.0 partial; H.1–H.8 not_read; every implementation status unchecked,zero stages or reserved keys closed.

## Mathematics and tests

For finite coefficient basis b of Q, reconstruct θ(e) as Σ_i a_θ(b.coord i)(e)⊗b_i. Tensor induction plus the native basis reconstruction proves this for arbitrary E over every commutative R; E needs no finite basis, field or reducedness assumption.

Define θ^[2]=assoc∘(θ⊗id_Q)∘θ in the actual E⊗(Q⊗Q). Two tensor inductions identify contraction by (v,w) with a_θ(v)·a_θ(w), where w is applied first. The newly applied coefficient occupies the left slot. No integrability or commutativity of contractions is required. Reconstructing both factors then proves θ^[2]=0 iff every ordered coefficient product vanishes. Characteristic two does not merge the two slots.

The four proved prototype tests cover the zero field, the nonzero rank-one unit field over any nontrivial ring, subsingleton coefficient modules and the explicit ℚ² field θ(e)=E12e⊗q0+E21e⊗q1. Its (q0∨,q1∨) contraction is E11 and differs from the reversed E22. The last field is not assumed integrable. These are actual affine tensor examples, not instantiated global geometric bundles. The rank-one affine test does not itself construct the full O(dx) geometric fixture.

## Fresh reading and ownership

Read the full reviewed parent Hodge L0–L3 and E1/D3 target/evidence/duplicate rows, actual CR.1/E1/DD.1/D3 supplier stage descriptions, the reserved key and full current Hodge upstream README. Other upstream-style readings remain part of the continuous-session history. No dedicated PartII audit row exists. Exact index/source searches and complete named statements were read for finite basis coordinates/reconstruction, tensor induction/map/pure tensors/finite sums and the associator. Eight new baseline entries supplement74 preserved entries; generic tensor/basis objects are imported.

Fresh primary reading: complete printed [Heuer25 Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4), including the latter's contraction/image/canonical-section and twisting paragraph. Publisher HTML SHA256 0b74ce9469ea21b3eb640da1c4ee5d3b1adc18feff52cb319f405e4e5ee54719. No correspondence proof, arbitrary-N nilpotence proof or other paper's full reading is claimed. New algebraic formulas are deductions, not misattributed printed theorems.

The reserved general Higgs/parameter-connection node is retained. Built parent Hodge theory remains imported. D3 owns common variations, CR.1 ordinary connections, E1 missing sheaf monoidal/finite-duality/descent interfaces, DD.1 filtered/Rees inputs, ColemanPowerSeries the generic Jacobi identity. Heuer spectral/coherent-image/twisting results stay with the p-adic consumer; all accepted BKT/Benoist/other route obligations remain.

## Separate proof prototype

The [pushed immutable proof prototype](https://github.com/CBirkbeck/tauceti-explorer/blob/a31c7908e2ba7455d333f1f4e25e07a6563f692b/research/blueprint/suggested/HodgeStructuresPartII.lean) contains actual proofs of the six new declarations and four new examples. It temporarily restores the historical affine-contraction proof and its three tests from9a36f4d, so the checked branch contains no admission dependencies. These proofs are separate from the submitted admitted sketch.

The actual 206-line narrow extraction has seven examples (four new,three inherited) and passes with zero errors,warnings or admissions. Seven axiom audits cover affineContractions and all six new declarations. Dependencies are only propext,Classical.choice,Quot.sound; no admission axiom occurs. Runtime2.30 seconds,maximum RSS2897292 KiB,70 GiB available before compilation. Existing exact Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 were used with one bounded process.

SHA256:

- Full proof source: ff593d09cafb7b524f6391663792370769c026c37c904ee4397eaec8a538d054.
- Narrow extraction: fc2dac59a3bcb423c8dd635aaddabe3114ab4152aeb1d50a5cd26c859c476a64.
- Extraction plus audits: 3e7fec73d7d1766616ffaadd0e73754a0a4f50972c0ba7a552ef767ac2f10bb7.
- Normalized proof log: eb652cfccfe9bb7b22359fbf3343b87ddf9ebe0eda9177160168f2ab24e11639.

To reproduce, save and run the Python recipe below in a checkout containing the immutable proof commit. It extracts the exact suggested source, without injecting alternate proofs. Recipe SHA256 09318fcc37f31d485e6f3080557945b6b0b3a97d73f318c0025bac45052560c4. Run square-axioms.lean using lake env lean from an existing exact-pin build root, following WORKERS memory/process/time rules. Do not set up or build a project.

```python
from pathlib import Path
import subprocess
commit = "a31c7908e2ba7455d333f1f4e25e07a6563f692b"
path = "research/blueprint/suggested/HodgeStructuresPartII.lean"
s = subprocess.check_output(["git", "show", commit + ":" + path], text=True)
imports = "\n".join(l for l in s.splitlines() if l.startswith("import Mathlib"))
a = s.index("namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle")
b = s.index("/-- Affine adapter", a)
fragment = imports + "\nopen scoped TensorProduct\nnoncomputable section\n" + s[a:b]
fragment += "\nend TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle\n"
Path("square-native.lean").write_text(fragment)
names = ["affineContractions", "affineContractions_reconstruct", "affineOrderedSquare",
         "affineOrderedSquare_apply", "affineOrderedSquare_zero",
         "affineOrderedSquare_contraction", "affineOrderedSquare_eq_zero_iff"]
audits = "\n".join("#print axioms TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle." + n for n in names)
Path("square-axioms.lean").write_text(fragment + "\n" + audits + "\n")
```

## Submitted sketch and assembly

Under PROTOCOL section13, all six new declaration bodies and four examples are admitted; inherited suggested bodies are byte-preserved outside the new block/import. The entire submitted suggested file was elaborated directly, not merely an extraction:66 examples,zero errors,166 admitted-declaration warnings and no other warnings. Runtime4.20 seconds,maximum RSS2911904 KiB,70 GiB available. Every import is Mathlib; no TauCeti compiled import set is certified or needed for the displayed signatures. All35 inherited global signature omissions remain, so this receipt does not certify them, any sheaf construction or any stage. No setup/update/cache/build/LSP occurred.

Full suggested SHA256 40cf843adc56ed03be635eeccd9b169dca6df7f9f1466479ff2aedb5587ab24d; normalized sketch log SHA256 0363945c0e69da1d73906656f13dedd311a1f39b59bef35a1d86063e156797b2.

Indexed packet and actual five-file intake policy pass with zero errors/warnings; whitespace passes. Reader/native API/test presence and inherited mathematical/source preservation checks pass. The actual read-only assembler shows75 declarations/six planets, no own skipped/pending links and unchanged stage edges/other-roadmap skipped links. Stage DAG:3022 vertices (including51 existing virtual suppliers),8663 edges. Own prerequisite DAG:75 vertices,147 edges. Combined stage/declaration/request DAG:3092 vertices,8929 edges,76 reachable declarations. All acyclic,zero unresolved references and all21 required stage pairs reachable. No site or atlas outputs were written.

## Resume

Extend the explicit ordered coefficient proof to arbitrary N with the existing native tensor-power/basis interfaces, keeping the newest coefficient on the left and the N=0 identity boundary. Add change-of-chart/restriction equations and local equality detection, then discharge the E1 sheaf tensor-power/gluing bridge. The N=2 result is not the full ordered-coordinate theorem or the augmentation/sheaf equivalence.

Continue the exact canonical TauCeti augmentation bridge only when a matching existing compiled import set is available, without building one. Preserve the noncommutative End target, same exponent and source ideal. Establish field/reduced-base rank bounds with genuine hypotheses; Z/4 rank-one prevents an unconditional shortcut. Discharge CR.1 ordinary/exterior comparison,DD.1 Griffiths/Rees and unbounded period/Tate adapters,global determinant/descent and coefficient equivariance. Read/decompose all remaining routed source definitions/proofs before advancing H.1–H.8. No reserved-key closure is claimed.
