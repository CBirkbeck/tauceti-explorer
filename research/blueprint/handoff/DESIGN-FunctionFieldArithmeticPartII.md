# DESIGN-FunctionFieldArithmeticPartII — native coefficient checkpoint

Worker: Codex — codex-5ebb6f. Date: 2026-10-02. Refs #3403.
Branch: codex-5ebb6f-root-coordinate-plan.
Base: 439b73117f3731f73fa90dd140f314abe453c342.
Initial winning claim5956768877/bot5956771319. Renewed claim5957291319/bot5957295431 after protocol-format correction PR#5806 released the job.

This is a partial continuation. All125 proposed declarations remain unchecked, all ten stages remain partial, and the eight gaps/thirteen supplier requests remain open. It does not certify the geometric root stack or the full suggested file.

The separate native proof prototype checks the all-ring source/target coordinate existence-and-uniqueness lemmas. The submitted suggested file retains admitted declaration and example bodies under PROTOCOL §13. Two new construction records expose their specified coefficient linear equivalences, with six API items and six tests. Their actual proof prototype includes six proved examples. They operate on the existing AdjoinRoot quotient, native group algebra and actual tensor modules. No carrier, arbitrary comparison map or basis axiom is introduced.

The zero coefficient ring is handled separately by Module.subsingleton. Only the nontrivial-ring branch makes the degree claim and uses AdjoinRoot.powerBasis'. Reindexing and the tensor-product basis identify the actual source monomials. The target characters are reindexed through Multiplicative.toAdd and ZMod.finEquiv, with their representatives checked by ZMod.val_natCast_of_lt; no set of rational roots of unity is used. A synthesis linear map, proved bijective from the coordinate lemmas, supplies each coefficient equivalence. The inverse formula is exact, including over the zero ring.

## Reading and ownership

Read the latest predecessor handoff in full. Its earlier source routes, native coaction/comparison proofs and independent arithmetic program remain available in the immutable [predecessor checkpoint](https://github.com/CBirkbeck/tauceti-explorer/blob/c686e796b76f80e40f466bef9038f46b21677a8b/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md). The broader source and supplier boundary is preserved in its linked [earlier handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/50a5391786116e4f2caa037fabe6ea063abb4034/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md).

Fresh source reading: Talpo–Vistoli arXiv:1410.1164v2 §3.1 pp14–16 finite setup, full Lemma3.7, Proposition3.10, Lemma3.12 and Corollary3.13 statements/proofs. PDF715,504 bytes; SHA-25692a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2. Fresh Stacks040N full statement/proof; HTML16,465 bytes, SHA-25621a955ccf3224e20294b510800db3342840f0f44e33d1d15980a7a477633ec24. Their finite action and positive-exponent unit-cover statements motivate these coefficient derivations; they are not literal source statements of the coordinate equivalences. No new source erratum or whole-paper reading is claimed.

Reviewed current FA.0–FA.7 target names/status and full FA.0/FA.1/FA.2/FA.4 reviewed target/evidence/duplication records. There is no PartII audit row. Native statements/constructions read at Mathlib082e2d3: AdjoinRoot's monic quotient power basis; finite basis reindex/equivFun/sum and tensor evaluation; group-algebra basis; ZMod positive finite equivalence and representative; type-tag equivalence; Module.subsingleton; monic/degree formulas; LinearEquiv.ofBijective. Twelve added baseline records give exact files, lines and hashes. Broader reviewed supplier records keep predecessor provenance.

All123 inherited IDs and mathematical statements, both paper-route inventories, AV sibling contracts, source versions/findings,39 planets,8 gaps and13 requests are preserved. Only the two coordinate proof/input/acceptance records are refined. Root stacks remain owned by FunctionFieldArithmeticPartII:key/root-stacks; moduli of curves remain with StableReductionPartII. General stack/Picard/descent suppliers and the fppf/fpqc and B24 volume235 corrections remain binding.

## Native validation

An existing Mathlib build at082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2 supplied one direct compiler process. It reported0 errors,18 admitted-body warnings and0 other warnings, on554 extracted lines/20 examples. Time3.80 seconds, maximum RSS3,112,220 KiB;72 GiB available before compilation. No build/cache/project/server was started.

All26 audited algebra declarations depend only on propext, Classical.choice and Quot.sound, without admission axioms. This includes the preceding sixteen algebra declarations, both coordinate lemmas, both coefficient equivalences and their six APIs. The separate proof prototype's new examples prove exponent-one and zero-ring behavior, the source root coefficient over Z/4 at f=2, and the target character coefficient over F₂ at n=2,f=0. The remaining eighteen warnings belong to the still-admitted kernel/image/criterion/inverse/determinant/rank branch and its earlier examples.

The full suggested Tau Ceti file was not compiled: no compiled exact-pin Tau Ceti line-bundle/roots-of-unity import set is available. No full-file or geometric implementation claim follows from the extraction. The predecessor's57,628 independent arithmetic assertions are historical evidence; their embedded program was not rerun here.

The separately checked proof prototype is available at [immutable commita7077b385885fa9b790ff4216098ad3871a87fa8](https://github.com/CBirkbeck/tauceti-explorer/blob/a7077b385885fa9b790ff4216098ad3871a87fa8/research/blueprint/suggested/FunctionFieldArithmeticPartII.lean). It is evidence for the plan, not the current suggested file or an implementation claim. Protocol-format correction PR#5806 is retained in the packet and reader.

Hashes identifying the separate proof check:

- nativeFileSha256: 3aeb6fd14052dbb4ef5ec88f24d50bc2f0847166a79a952369fdc2a8ccb1ec6d
- extractionSha256: 6385f2fa8366565f8df44a4944459f3179dbb560252084e0377176d0d0fed5b8
- axiomExtractionSha256: 52b5c89f4593f0d105f468c3b8fe4dce1443e95826032a8884de02b553e482e4
- axiomLogSha256: 3797be9fec981e5f66c181cc6b6f0ce116242e9f2aa3b6990063337167a8276b

The current admitted Mathlib-only sketch also elaborates:411 extracted lines,20 examples,0 errors,56 admitted-body warnings and0 other warnings. Its hash is 724f1b3fbd4d8f6d59d69f0efe09bc80ff0940c6679715782873b822ccd7c810. The separately checked proof prototype and its26 axiom audits retain their distinct receipts; no admission-free proof claim is made about the current sketch.

## Reproduce the native check

Use an already compiled Mathlib build at the exact pin. Check free memory first; compile only with at least20 GiB available. Run one lake env lean process from the existing project root and stop it at20 minutes. Extract the separately checked source preserved at immutable commita7077b385885fa9b790ff4216098ad3871a87fa8 with the following program. This reproduces the proof receipt, not the current admitted sketch. It expands the Tau Ceti character generator to its exact pinned definition; all other selected bodies are from that immutable proof prototype.

```python
from pathlib import Path
import subprocess
s=subprocess.check_output(['git','show','a7077b385885fa9b790ff4216098ad3871a87fa8:research/blueprint/suggested/FunctionFieldArithmeticPartII.lean'],text=True)
sc=Path('scratch-root-coordinates'); sc.mkdir(exist_ok=True)
imports='\n'.join(l for l in s.splitlines() if l.startswith('import Mathlib'))
initial=s[s.index('abbrev AffineRing (f : A)'):s.index('-- TauCeti.RootStack.affineCoaction.nativePoint')]
one=s[s.index('-- TauCeti.RootStack.affineCoaction.test_one'):s.index('-- TauCeti.RootStack.affineCoaction.test_sign')]
comparison=s[s.index('section AffineTorsorComparison'):s.index('-- Native acceptance computations')]
extra=s[s.index('-- Native acceptance computations'):]
fragment=imports+'\nnoncomputable section\nuniverse u\nnamespace TauCeti.RootStack\nvariable {A : Type u} [CommRing A]\nopen scoped TensorProduct\n'+initial+one+comparison+extra
fragment=fragment.replace('TauCeti.RootsOfUnityGroup.generator n','Multiplicative.ofAdd (1 : ZMod n)')
(sc/'native-extraction.lean').write_text(fragment)
axioms=['affineRoot.pow_eq','affineCharacter.pow','affineRoot.pow_reduce','affineCoaction','affineCoaction.root','affineCoaction.constant','affineCoaction.unique','affineCoaction.weight','affineCoaction.counit','affineCoaction.coassoc','affineTorsorComparison','affineTorsorComparison.tmul','affineTorsorComparison.left_root','affineTorsorComparison.right_factor','affineTorsorComparison.unique','affineTorsorComparison.monomial','affineTorsorComparison.source_coordinates','affineTorsorComparison.target_coordinates','affineTorsorComparison.sourceCoordinateEquiv','affineTorsorComparison.sourceCoordinateEquiv_symm_apply','affineTorsorComparison.sourceCoordinateEquiv_apply_sum','affineTorsorComparison.sourceCoordinateEquiv_monomial','affineTorsorComparison.targetCoordinateEquiv','affineTorsorComparison.targetCoordinateEquiv_symm_apply','affineTorsorComparison.targetCoordinateEquiv_apply_sum','affineTorsorComparison.targetCoordinateEquiv_monomial']
(sc/'native-axioms.lean').write_text(fragment+'\n'+'\n'.join('#print axioms TauCeti.RootStack.'+a for a in axioms)+'\n')
print('extraction lines',len(fragment.splitlines()),'axiom audit',len(axioms))
```

Compile scratch-root-coordinates/native-axioms.lean with the existing project environment. All26 printed axiom lists must exclude admissions. Diagnostic path prefixes affect the raw log hash; the source/extraction hashes and warning/axiom counts identify the content being checked.

## Packet and atlas checks

The indexed check_blueprint.py check reports0 errors/0 warnings:125 nodes,94 required API items,96 required definition/construction tests,100 total test records,92 baseline references and39 planets. All125 reader Declaration/Inputs records and every API/test identifier match the suggested signatures or the inherited explicit omission ledger. All123 original mathematical statements and121 complete original node records are unchanged; the two coordinate input/proof/acceptance records are the only refinements. Source routes/versions/findings, requests/gaps, ownership, coverage and correction history are preserved. The roadmap definition is byte-for-byte unchanged.

The actual read-only build.assemble overlay adds this packet and its roadmap definition to the normal promoted inputs. It yields3,056 stage vertices including51 unchanged virtual supplier endpoints and8,723 stage edges; the graph with176 recursively reachable declarations has3,193 vertices/9,320 edges. The own declaration graph has125 vertices/264 edges. All three graphs are acyclic, all external references resolve, and the own skipped-link/pending-link lists are empty. Other roadmaps' pre-existing skipped-link lists equal the control build. This check writes no promoted data or generated site.

The four changed deliverables pass intake check-files, and git diff --check is clean.

## Resume here

1. The coordinate existence/uniqueness proof prototype and specified synthesis inverses are preserved at the immutable proof commit. Extract that source for further proof experiments; current suggested bodies are admitted. Start with the existing native kernel_coefficients and image_coefficients signatures, retaining the actual proved δ and Θ in every extraction.
2. Formalize the index permutation (i,j)↦(i,(i+j) mod n). Its inverse is j=k−i if k≥i and j=n+k−i if k<i. The permutation and the native monomial formula turn Θ into diagonal factors1 or f. Source wrapping positions i+j≥n correspond exactly to target positions k<i.
3. Prove the coefficient kernel criterion: nonwrapping coefficients vanish and wrapping coefficients are annihilated by f. Prove the image criterion: only target coefficients below the diagonal must be multiples of f. Derive the specified module kernel and cokernel equivalences, never an algebra quotient. An API consumed as a prerequisite must first be promoted to its own lemma node.
4. Complete sharp injectivity/surjectivity/bijectivity criteria, the unit inverse, determinant sign, field ranks and the earlier nonvanishing examples. Separate n=1, zero ring, regular nonunit, nilpotent parameter and wild unit cases. A coefficient equivalence alone establishes none of these still-admitted assertions.
5. Then obtain the native geometric carriers, section/unit comparisons and fpqc tower statements through their exact suppliers. The inherited JAC-A, ST-LISSE, ST-OPS, NORM-2EXACT, FA-APPROX, EXTERIOR-COMP, LEAN-GEOMETRY, LEAN-SECTION-COMP and TOWER-TYPING boundary remains in the predecessor record. Coarse f=0 charts retain their nilpotents and are not torsors; normalized coframes have unit parameters. Infinite torsor descent uses fpqc.

The reader and packet are definitive; implementationStatus remains unchecked. After submission, delete this job's scratch and take the next available job in WORKERS order. Never unclaim submitted work or manually merge, close issues or change labels.
