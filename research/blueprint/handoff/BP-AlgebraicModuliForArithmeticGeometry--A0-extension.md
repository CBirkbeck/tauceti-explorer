# BP-AlgebraicModuliForArithmeticGeometry--A0-extension

Codex — codex-5ebb6f; Refs #672. Partial checkpoint. No stage or reserved key definition is closed.

Claim comment 5957369958 was confirmed by bot comment 5957373280; the full issue was reread after confirmation. Immutable base 439b73117f3731f73fa90dd140f314abe453c342 includes merged predecessor PR #5808. The [previous handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/439b73117f3731f73fa90dd140f314abe453c342/research/blueprint/handoff/BP-AlgebraicModuliForArithmeticGeometry--A0-extension.md) retains historical module/Picard/cohomology proofs, broader paper reading and its reproducible 8876-assertion finite regression. Those receipts are not this continuation's fresh reading or compilation; that finite regression was not rerun here.

## Delivery and preservation

Add six R09.4 nodes: promote the existing compatible and restrict_apply equations; specify native matching-family coverTransition, coverIso, coverAut and coverAut_unique. The two construction nodes add six API items and six mathematical tests. Only the existing central-section sheaf node's prerequisites/proof outline and one existing gap detail change. All 138 predecessor mathematical statements, 137 complete predecessor node objects, 68 routes, 21 requests, source-issue/owner boundaries and ten planets are retained.

Counts: 144 nodes (16 definitions, 33 constructions, 64 lemmas, 27 theorems, four comparisons), 164 total API items, 157 total tests, 91 baseline declarations, ten planets, nine gaps, 21 requests. Definition/construction-only counts are 159 API items and 151 tests. Four scope rows remain partial and four not_read; every implementation status remains unchecked.

For an arbitrary sieve R, matching central sections on its native arrow category give compatible automorphisms of the native canonical descent datum of an explicit x. At a common test arrow q, sieve downward closure and Over.homMk identify both local sections with the same central component. CatCenter naturality establishes the actual transition equation, retaining the pseudofunctor composition constraints. Native DescentData.isoMk includes inverse arrows. When R covers and F is a prestack, the existing fully faithful toDescentData functor's preimageIso gives an actual automorphism of x; component extensionality/faithfulness gives uniqueness. No fibre products, gerbe, groupoid or abelian-inertia hypothesis is needed. No second generic Hom-descent or stack carrier is planned.

The six examples check identity-family descent, inverse components, the empty-sieve descent category, identity automorphisms, exact agreement for restrictions of an existing central section and trivial inertia. They use the actual parameterized native carriers; none claims an instantiated geometric point-site or root-gerbe fixture.

## Fresh source and owner boundary

Read the full current reviewed R09.4 target/evidence/duplication audit and its accepted RS-27 narrowing. D0 supplies ordinary prestacks/stacks/stackification and generic quotients; SF1 supplies ordinary spaces/sites/diagonals. R09.4 retains algebraic-stack/general-criteria/elliptic compatibility, importing generalized elliptic/abelian scheme consumers without reverse dependencies. Coherent duality and stable pointed-curve moduli retain their reserved suppliers. The reserved gerbe key still requires band-sensitive étale/fppf H², genuine objects/inertia and fpqc profinite 2-limits; no set-class surrogate or finite-presentation claim for the profinite classifying object is introduced.

Fresh reading is the full statement and proof of [Stacks Lemma 8.11.8](https://stacks.math.columbia.edu/tag/06NY), including the final omitted varying-base conclusion, and the whole printed [Definition 8.4.1](https://stacks.math.columbia.edu/tag/026F). Other statements on those pages and referenced proofs are not claimed as fresh full reading. Downloaded HTML SHA256 values are 784df742e6d6c147f90645bfef73a6ad9fa60cb34e9b2d3006401857ed88a32e and 0024923a8e370df81c72261a9765c15c3e1d3bbb8b59a46ab41605f2f2ae60a0. Broader eight-row audits, red-team confirmations and paper routes retain predecessor provenance.

The exact pinned native statements/constructions and relevant proofs were read for DescentData.isoMk/ofObj/hom_ext, pullHom/presheafHom/IsPrestack, fully faithful preimageIso, Presieve.category, Over.homMk, CatCenter naturality and the algebraic-category sheaf interface. Five new index-confirmed baseline entries supplement existing ones. map_preimage is a native record field, not a fabricated separately indexed declaration.

## Separate native proof receipt

A [pushed immutable proof prototype](https://github.com/CBirkbeck/tauceti-explorer/blob/f0bb4f284aefaffe97578454ecf9a0588472103e/research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean) contains actual proofs of all nine new declarations and all six new examples. Its distinct narrow Mathlib-only extraction has seven examples (six new, one unused inherited example), zero errors, two unused inherited admission warnings and no other warnings. Eleven kernel audits cover compatible, restrict_apply and the nine new declarations; all depend only on propext, Classical.choice and Quot.sound, with no admission dependency. This excludes the unfinished global sheaf/evaluation-surjectivity blocks. Runtime 2.50 seconds, maximum RSS 3269732 KiB; 71 GiB available before the single bounded compiler process.

SHA256:

- Full proof source: b2cf95029e01260cc9bb3791e3175fec7307c533bdd356b75481c16aad3b02ee.
- Native proof extraction: 793781fadfb9ac763332e165150bed89a3f8d1c57ba9f5141a87bfb6532d396e.
- Extraction plus eleven audits: ff54309df4423b4823c6e388bafe98d22892f44b93014ed82b95bc0d5cdb1509.
- Normalized compiler/audit log: 0ffa61b545edc6cd318d8cfd0a09040b372f7239dc46958f6cca93638975a4c1.

To reproduce in a checkout containing that immutable commit, save the following Python extraction recipe and run it. It reads that exact suggested file; it does not inject replacement proofs. Recipe SHA256 c58b89d3f43864f83f0d8b924d3b22f9102e3dfd2c695a058bc477b312aac75f. Run the resulting cover-axioms.lean with lake env lean from the root of an existing exact-pin Mathlib build. Respect the shared-machine memory/one-process/20-minute constraints in WORKERS.md.

```python
from pathlib import Path
import subprocess
commit = "f0bb4f284aefaffe97578454ecf9a0588472103e"
path = "research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean"
s = subprocess.check_output(["git", "show", commit + ":" + path], text=True)
imports = "\n".join(l for l in s.splitlines() if l.startswith("import Mathlib"))
prefix = s[s.index("open CategoryTheory Opposite Bicategory"):s.index("variable {A : Sheaf")]
marker = "namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C"
central = s[s.index(marker, s.index("/-! Intrinsic-band continuation")):]
central = central[:central.index("/-- R09.4/band-center-sheaf: glue")]
fragment = imports + "\n" + prefix + "\nend TauCeti.AlgebraicGeometry\n" + central
fragment += "\nend IntrinsicBandSections\nend TauCeti.AlgebraicGeometry\n"
Path("cover-native.lean").write_text(fragment)
names = ["compatible", "restrict_apply", "coverTransition", "coverIso",
         "coverIso_hom_apply", "coverIso_one", "coverIso_inv", "coverAut",
         "coverAut_map_hom", "coverAut_unique", "coverAut_one"]
audits = "\n".join("#print axioms TauCeti.AlgebraicGeometry.IntrinsicBandSections." + n for n in names)
Path("cover-axioms.lean").write_text(fragment + "\n" + audits + "\n")
```

## Submitted admitted sketch receipt

PROTOCOL §13 requires proposed declaration/example bodies to be admitted. The final suggested file therefore leaves all nine new declarations and six new examples admitted, preserving inherited bodies. Its separate extraction uses the submitted source, all Mathlib imports, the complete initial gerbe/banding prefix (through before variable A : Sheaf), an explicit namespace closure and the entire final intrinsic-band namespace. Unlike the proof extraction it does not truncate at band-center-sheaf. Earlier module/cohomology blocks and the TauCeti cohomology import are excluded.

This 874-line extraction has 32 examples and passes with zero errors, 24 admission warnings and no other warnings. Runtime 3.90 seconds, maximum RSS 3298640 KiB; 70 GiB available before the single bounded process. The full suggested file remains uncompiled because the exact TauCeti cohomology import has no available compiled artifact. Both extractions use existing Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean 4.34.0-rc2; no project/cache/build/LSP was started. Neither receipt certifies the full TauCeti file, central-section sheafness or omitted geometric fixtures.

SHA256:

- Submitted suggested source: 0de33335bf1b43074ffb4f8190799db9c5e1bbff6979b78b4cd03687b0f83893.
- Admitted intrinsic-band extraction: fd2fe591c567c63273ccfb51468749ebff7f7ebeabab38cadfb5375363a945e9.
- Normalized admitted-sketch log: 674a66bc919ca87fbb89d22f81ee9edc01016d27a1c67cd5392d964fede67962.

## Packet and atlas validation

Indexed check_blueprint and actual intake file policy pass with zero errors/warnings; whitespace passes. Reader/native API/test presence and preservation checks pass, respecting inherited structure-field namespaces and existing omission ledgers. The actual read-only build.assemble overlay exposes all 144 declarations and ten planets without this packet's skipped/pending links. Its stage graph contains 3017 vertices (including the same 51 virtual supplier endpoints as the control) and 8655 edges. The own prerequisite DAG has 144 nodes and 271 edges. Traversing all 147 reachable declaration prerequisites gives a combined 3154-vertex, 9132-edge stage/declaration DAG, with zero unresolved references. All are acyclic; other roadmaps' skipped links remain unchanged. No assembly files were written.

## Resume

For each covering matching family, first prove the descended coverAut is natural in x using morphism-sheaf separatedness. Then prove compatibility under arbitrary base restriction on common refinements, retaining native mapId/mapComp transports; assemble a compatible unit of each fibre center into a global IntrinsicBandSection. Only then use separatedness for uniqueness and prove the existing isSheaf statement. The new component-descent construction alone does not discharge these obligations.

Next finish abelian-inertia evaluation surjectivity, the locally glued inverse of the supplied fixed-band comparison and the SF1 descended-slice sheaf comparison. Instantiate actual point-site connected/disconnected classifying groupoids, the no-terminal restriction-chain site and nonneutral O(1) root gerbes; they remain omissions. Continue the remaining sources, nine gaps and 21 requests before claiming a stage or reserved-key closure. Broader geometric stack/gerbe/cohomology completion is not established by this checkpoint.
