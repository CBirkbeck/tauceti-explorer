# Independent review: SemisimpleAlgebrasPartII

Accepted after corrections, 2026-10-04. Reviewer: Codex — codex-a71f92, issue #3610, `independent-review-REV-DESIGN-SemisimpleAlgebrasPartII`. The reviewed author is Codex — codex-J6LwjP, issue #3469; these are different workers. Input commit `aa362c609b99b385818bd54208960dd9584bb2c4`; latest-main validation `cff58e4d55934675d5effc5774d639c5da6732e9`. The four authorized input/report paths only are changed. Neither promotion nor label/merge changes were performed by this worker.

## Verdict and counts

All 55 nodes have individual review records: 47 verified, eight corrected, zero added or removed, zero unverifiable. Every one of the 48 baseline citations was independently read at its actual pinned module, including ambient assumptions; none required removal or replacement. The complete target-level pass stays below its 300-node budget, with five planned stages and none closed. Its 11 gaps and ten requests are retained; acceptance is not a claim that these obligations or suppliers are implemented.

Counts: 26 lemmas, three definitions, 16 theorems, five comparisons, four constructions, one application; 30 API items, 31 tests and ten planets. All implementation statuses remain unchecked. Every definition/construction has at least four tests and four API items. Direct own-node prerequisites form an acyclic graph of 55 vertices and 74 edges. Stage target coverage, direct supplier contracts and proof outlines were checked at target level, without splitting them into new lemma-level work.

## Corrections made in place

1. **Index-one acceptance:** the copied positivity acceptance was replaced by the actual equivalence between index one and the identity class.
2. **Finite spectral pushforward:** the rank and power formulas now require one fixed positive matrix degree on the whole inverse image of each base chart. Different degrees on cover components mapping to the same base component cannot be conflated. This corrects `finite-pushforward-morita`, `higgs-invariant-power` and the power API of `morita-higgs-invariant`; the latter gains a test with cover degrees 1 and 2, pushed ranks 3 and 2, and zero-action polynomials T³ and T². No single integer power works. SA.3's description carries the same boundary.
3. **Relative target hypotheses:** `relative-brauer-equality` and `relative-class-vanishing-input` now retain an actual integrable connection and require its de Rham Hitchin invariant as the spectral parameter. SA.4's description agrees. An arbitrary spectral parameter was too broad for the cited Appendix A.2 application.
4. **Cohomology versus Azumaya classes:** `cartier-boundary-additivity` first asserts addition in H² of units. The shared injective Brauer comparison translates it only for represented classes; no surjectivity or equality of the Azumaya Brauer group with all H² is assumed.
5. **Transfer API:** `brauer-corestriction` gains its full units-comparison-normalized H² transfer equation. This distinguishes the intended map without unfolding transport and does not use a 2-torsion-only comparison.
6. **Honest native coverage:** absent Lean signatures are now labelled omitted, not admitted. The full dual-number polynomial counterexample is distinguished from its separate archived admission-free proof. Revised mathematical/API/test comments are synchronized in the suggested file. Its actual marked Mathlib extraction is byte-identical to the independently replayed extraction.
7. **Existing shared carrier:** `morita-higgs-invariant` now imports the current uniquely owned `HodgeStructuresPartII:key/higgs-parameter-connections`; H.0 remains the request for the missing full determinant interface. The existing scheme Azumaya/Brauer key is imported throughout, never redefined.

These changes affect eight node records; there are no new declaration nodes. The roadmap's order and ten appropriately named definition/construction/theorem planets remain unchanged.

## Sources and the seven reviewed source issues

All nodes' locators, short excerpts and mathematical hypotheses were checked against fresh public texts. PDF hashes match the packet's six primary-source records. Reading is limited to the indicated dependency passages, not a claim to have read every paper in full.

- [Gille–Szamuely, 2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf): §§4.4–4.5 and Proposition 4.2.10, pp88–89, for continuous transfer after an open-subgroup restriction. The period/index and splitting-degree chain retains arbitrary finite splitters where intended and separability for transfer. [Author errata](https://pagine.dm.unipi.it/tamas/erratams.pdf), dated December 4, 2020, confirm E1's injective-subalgebra correction at p101 and E4's corrected local-field bound at p105. The latter is outside this roadmap's targets; the errata's remark numbering mismatch is explicitly scoped by page/content.
- [Benoist, IHÉS 130 (2019)](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf): §0.1, p63, for the general index/period and finite splitting-degree conventions. The real-surface results are not silently imported.
- [Esnault–Groechenig, arXiv v4](https://arxiv.org/pdf/1707.00752v4): Theorem 2.17/Remark 2.18, pp13–14, and Appendix A.2–A.3, pp40–41. E2's monic-root uniqueness fails on nonreduced rings; the actual dual-number polynomial counterexample was independently replayed. E3's support inference fails, but that counterexample does not refute Proposition A.2 or establish nonvanishing of its Brauer boundary. The relative vanishing remains a precise gap. New E7 records the overly strong bare categorical uniqueness wording: nonzero scalar modules over F₃ have multiple automorphisms. Fixing identification and evaluation data restores the appropriate compatible comparison; the Morita theorem is not rejected. A fresh [author copy](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf) repeats these selected passages. Its bytes differ from arXiv; whole-document and journal identity are not certified. Journal acquisition returned HTTP403.
- [Ogus–Vologodsky, published IHÉS 106 (2007)](https://www.numdam.org/item/10.1007/s10240-007-0010-z.pdf): Theorem 2.8/Corollary 2.9, pp33–34, and §4.2, pp85–88. The comparison uses Frobenius pushforward, the actual relative units/closed-form exact sequence and its two connecting maps. The bounded infinitesimal splitting result is not substituted for arbitrary spectral thickening.
- [Bezrukavnikov–Braverman, arXiv v2](https://arxiv.org/pdf/math/0602255v2): §2.2 and §§3.10–3.12, pp3,11. Printed p11 was also inspected visually. E5 corrects the algebra rank to p^(2d), consistent with matrix size p^d; E6 corrects the order of the two typed maps to η∘δ. These findings concern this acquired preprint only: the journal PDF remained HTTP403.

Each of the six inherited findings has its own independently confirmed review verdict; E7 has its own confirmed verdict. No inaccessible edition is treated as checked, and no comprehensive search of every possible erratum or version is claimed. Precise PDF SHA256 values are preserved in the packet; the extra author copy is recorded separately.

## Pinned baseline and ownership

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Declaration-index SHA256: `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. The reviewed library audit has no layer key containing SemisimpleAlgebras; that absence was not used as evidence that declarations are missing.

Important actual-statement boundaries: the built degree-index splitting field need not be separable, and the built separable splitting field need not have degree index. Their conjunction stays a parent request. Field Brauer operations already exist. OrderOf zero/positivity conventions are respected. Matrix Morita is the actual functor on column products and its inverse, not an existence-only replacement. The annihilator product theorem requires nonemptiness for this equality. The tower finrank theorem works through the actual division-ring/free instances. Conjugacy and block-diagonal determinant identities use commutative coefficient rings but do not require reducedness.

All 48 independently confirmed citations, grouped by their actual pinned module:

- `TauCeti/Algebra/CentralSimple/Index.lean`: `tauceti:TauCeti.Algebra.index`, `tauceti:TauCeti.Algebra.index_matrix`, `tauceti:TauCeti.Algebra.index_eq_of_algEquiv`, `tauceti:TauCeti.Algebra.index_pos`, `tauceti:TauCeti.Algebra.index_dvd_deg`, `tauceti:TauCeti.Algebra.index_eq_deg_of_divisionRing`, `tauceti:TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`, `tauceti:TauCeti.Algebra.isSplittingField_self_iff_index_eq_one`, `tauceti:TauCeti.Algebra.index_eq_one_of_finite`.

- `TauCeti/Algebra/CentralSimple/BaseChange.lean`: `tauceti:TauCeti.Algebra.deg_baseChange`.

- `TauCeti/Algebra/CentralSimple/FiniteSeparable.lean`: `tauceti:TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable`.

- `TauCeti/Algebra/BrauerGroup/Division.lean`: `tauceti:TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`, `tauceti:TauCeti.BrauerGroup.nonempty_algEquiv_of_mk_eq_mk`.

- `TauCeti/Algebra/BrauerGroup/Group.lean`: `tauceti:TauCeti.BrauerGroup.mk`, `tauceti:TauCeti.BrauerGroup.mk_eq_mk_iff`.

- `TauCeti/Algebra/BrauerGroup/BaseChange.lean`: `tauceti:TauCeti.BrauerGroup.baseChange`, `tauceti:TauCeti.BrauerGroup.baseChange_mk`, `tauceti:TauCeti.BrauerGroup.mk_mem_ker_baseChange_iff_isSplittingField`, `tauceti:TauCeti.BrauerGroup.baseChange_self`, `tauceti:TauCeti.BrauerGroup.baseChange_comp`.

- `Mathlib/Algebra/BrauerGroup/Defs.lean`: `mathlib:BrauerGroup`.

- `Mathlib/GroupTheory/OrderOfElement.lean`: `mathlib:orderOf_dvd_iff_pow_eq_one`, `mathlib:orderOf_eq_one_iff`, `mathlib:IsOfFinOrder.orderOf_pos`, `mathlib:isOfFinOrder_iff_pow_eq_one`.

- `Mathlib/LinearAlgebra/Dimension/Free.lean`: `mathlib:Module.finrank_mul_finrank`.

- `Mathlib/Algebra/Azumaya/Defs.lean`: `mathlib:IsAzumaya`.

- `Mathlib/Algebra/Azumaya/Matrix.lean`: `mathlib:IsAzumaya.matrix`.

- `Mathlib/RingTheory/Morita/Matrix.lean`: `mathlib:ModuleCat.matrixEquivalence`, `mathlib:moritaEquivalenceMatrix`.

- `Mathlib/RingTheory/Ideal/Maps.lean`: `mathlib:Module.annihilator`, `mathlib:Module.mem_annihilator`, `mathlib:Module.annihilator_pi`, `mathlib:LinearEquiv.annihilator_eq`.

- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `mathlib:Matrix.charpoly_units_conj`.

- `Mathlib/Algebra/TrivSqZeroExt/Basic.lean`: `mathlib:TrivSqZeroExt.inr_mul_inr`.

- `TauCeti/Algebra/CentralSimple/Degree.lean`: `tauceti:TauCeti.Algebra.deg_sq`.

- `Mathlib/Algebra/Module/RingHom.lean`: `mathlib:Module.compHom`.

- `Mathlib/LinearAlgebra/Matrix/Module.lean`: `mathlib:Matrix.Module.matrixModule`.

- `Mathlib/RingTheory/TensorProduct/Basic.lean`: `mathlib:Algebra.TensorProduct.includeRight`.

- `Mathlib/Algebra/Algebra/Tower.lean`: `mathlib:IsScalarTower.of_algebraMap_smul`.

- `Mathlib/RingTheory/Finiteness/Basic.lean`: `mathlib:Module.Finite.of_restrictScalars_finite`.

- `Mathlib/LinearAlgebra/Basis/VectorSpace.lean`: `mathlib:Module.Basis.ofVectorSpace`.

- `Mathlib/LinearAlgebra/Dimension/Constructions.lean`: `mathlib:Module.finrank_pi_fintype`.

- `Mathlib/Algebra/GroupWithZero/Defs.lean`: `mathlib:mul_left_cancel₀`.

- `TauCeti/Algebra/CentralSimple/Splitting.lean`: `tauceti:TauCeti.Algebra.IsSplittingField.nonempty_algEquiv_matrix_deg`.

- `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `mathlib:Matrix.det_blockDiagonal`.

- `TauCeti/Algebra/BrauerGroup/Quaternion.lean`: `tauceti:TauCeti.Quaternion.orderOf_mk_eq_two`.


Supplier reading checked the parent SemisimpleAlgebras layers 4/6, QuadraticFormInvariants 7B, ProfiniteProPGroups 9/10, GeneralKTheory K.7, SchemeAndStackFoundations SF.0/SF.2 plus the current shared scheme-Brauer node, and HodgeStructuresPartII H.0 plus the current general Higgs key. K-theoretic Morita invariance is not a generic sheaf-progenerator export; F₂ cohomology is not the full units comparison; a schematic Brauer injection is not an equivalence onto all H². Supplier packets that are partial/unreviewed remain precisely that. This reviewer contributed earlier to the Scheme/Hodge suppliers: their statements were read for dependency compatibility here, not independently reviewed or certified in this job. The missing relative Cartier owner/interface remains an orchestrator question, not a duplicate local definition.

## Checks, Lean scope and RAM

The real indexed `scripts/check_blueprint.py` was run through an immutable, read-only repository adapter with this packet as the in-memory replacement. It reports zero errors and zero warnings. The real `scripts/build.py` assembler with provisional packet/roadmap overlay adds 24 stage edges, removes none, has no defined-stage or own-node cycles, no skipped links and no new orphan edges. Its 76 inherited orphan edges are reported rather than certified. These checks are not a proof audit of all external packets.

Two serial independent replays used an existing build at the exact Mathlib pin, Lean 4.34.0-rc2, commit 6a10ac8c22beadecabdbb0919c2b50214762f91d. Each had 35 GiB available immediately before compilation, one compiler thread, an 8192 MiB ceiling and a 1200-second timeout. No project setup, dependency build, cache fetch or language server was started.

| Existing artifact replayed | Result | Scope | Peak RSS |
| --- | --- | --- | --- |
| Archived Native.lean | exit 0; no errors/warnings; eight axiom audits, no sorryAx | Restricted columns, tower/dimension/cancellation and distinct monic polynomial counterexample; four examples | 2,230,292 KiB |
| Exact current Mathlib extraction | exit 0; no errors; 26 admission warnings only | Current marked affine/column/polynomial signatures; 14 examples; no admission-free claim | 2,425,880 KiB |

The whole suggested file was **not compiled**: the existing pinned Tau Ceti import cone is unavailable. No compilation at a different Tau Ceti revision is substituted. Neither the quotient adapter nor any sheaf/H²/Cartier geometry is certified by the native proof. Checker/assembly peak RSS was 2,220,500 KiB. Nothing was left running after these checks.

## Questions and recoverable handoff

1. The reader document is not an authorized deliverable of #3610. Please refresh its affected SA.3/SA.4 passages from this accepted packet: inverse-image degree condition, actual connection/Hitchin hypothesis, represented-class Brauer translation, corestriction API/test additions and source E7. This worker did not edit the reader.
2. Reserve the Cartier-flow supplier with the precise relative diagram, differential-operator comparison and a valid class-vanishing argument. Reduced-fibre vanishing alone does not fill that gap.
3. Keep the parent separable degree-index splitter, full units naturality, sheaf Morita/Picard/descent and symmetric Higgs determinant requests open until the owners actually supply their contracts. Existing authored key nodes are not compiled or independently accepted exports merely because the packet checker resolves their IDs.

The original author's immutable `research/blueprint/handoff/DESIGN-SemisimpleAlgebrasPartII.md` at the input commit contains the authenticated native and canonical sources and replay helper. Their source hashes agree with this review's independent receipts. The archive below contains this review's normalized logs/receipts, checker/assembly results and portable read-only validation helpers, not additional canonical Lean declarations. The manifest authenticates every artifact and the three non-report deliverables.

To recover evidence in an owned disk scratch directory, decode/decompress each named artifact and verify its bytes/SHA256 against the manifest. Do not create a repository snapshot. Supply the existing repository via `TAUCETI_REPO` and pinned index via `TAUCETI_DECLARATIONS_INDEX`. Copy the three reviewed deliverables into that owned evidence directory under the helper's expected names (`SemisimpleAlgebrasPartII.json`, `Roadmap.json`, `Suggested.lean`), then run `python3 validate_review.py`. The helper reads the recorded immutable validation commit, not a moving checkout. Compiler replay uses the author's authenticated Lean sources and an already-existing exact-pinned Mathlib build, serially and only after a fresh memory check. Source hashes and semantic counts must match; runtime/log byte hashes may change on a new replay.

<!-- REVIEW-MANIFEST -->
```json
{
  "format": "independent-review-evidence-v1",
  "job": "REV-DESIGN-SemisimpleAlgebrasPartII",
  "inputCommit": "aa362c609b99b385818bd54208960dd9584bb2c4",
  "validationCommit": "cff58e4d55934675d5effc5774d639c5da6732e9",
  "authorEvidencePath": "research/blueprint/handoff/DESIGN-SemisimpleAlgebrasPartII.md",
  "artifacts": {
    "Native.receipt.json": {
      "bytes": 503,
      "sha256": "e14052954ab0904c209b4a7e2d247ee70f14ec488bcf987d304c895e13e4cb73"
    },
    "Canonical.receipt.json": {
      "bytes": 505,
      "sha256": "aa4d715c3b2eaef269c5efe46717aae4c1c66dce21be195e84ac68f873a3a951"
    },
    "Native.log": {
      "bytes": 2040,
      "sha256": "1d14ce682cb7c9a674073e47510d2bc56602021e38a7b0daf051947df4d70ebf"
    },
    "Canonical.log": {
      "bytes": 2871,
      "sha256": "cc3577fbf79b5444a9884c9790641dbec14ca658209a23d4eb09a9c1b6c9bed9"
    },
    "check.json": {
      "bytes": 785,
      "sha256": "cea4698513cede6469d1a78b5d00083cfe5ad7f69ed123f707a7dbc0de79cfc9"
    },
    "atlas.json": {
      "bytes": 575,
      "sha256": "3b1630c19d12452417ebd5d132479d0c284c5af36cab483521889478a56aea92"
    },
    "edition-access.json": {
      "bytes": 703,
      "sha256": "83af5c5553ba4683238309dfde1067ade99ee4f54db0d69814c047516dca621b"
    },
    "common.py": {
      "bytes": 993,
      "sha256": "cfdfe10ddf9d0e3b5a00012136012b53f299c600b950170ce8a2accb849ed694"
    },
    "immutable.py": {
      "bytes": 4195,
      "sha256": "2c288e7f7c9b1a7c4a453bdc2547e4b967db7b1ace4bbce813e919a0e347f032"
    },
    "validate_review.py": {
      "bytes": 3270,
      "sha256": "4d0f427596f527dfa383e5a8cb1ac9ae80e1a826e338b7b8bdc29e362b8c2780"
    },
    "base.txt": {
      "bytes": 41,
      "sha256": "afacf222b863ca9fbe57026e2aa33934f0d8c11ce3a20df1f6e6d921b3d09a93"
    },
    "publication-base.txt": {
      "bytes": 41,
      "sha256": "80dd69d73d560e32600cafe58b6f7d34ab894ed62de89836097a2d21c559acce"
    }
  },
  "deliverables": {
    "research/blueprint/packets/SemisimpleAlgebrasPartII.json": {
      "bytes": 213183,
      "sha256": "a22b0e4cf4bb7405cfb80d792b3057900910ae92a18c3716175c0e1fe8299f05"
    },
    "research/blueprint/roadmaps/SemisimpleAlgebrasPartII.json": {
      "bytes": 9722,
      "sha256": "deab3aab287fec5e5304f5ca49ea05c149e532c66341477eff5c83ea6ac9d4fc"
    },
    "research/blueprint/suggested/SemisimpleAlgebrasPartII.lean": {
      "bytes": 25270,
      "sha256": "e8dd868da7678cfdfa00f9d69d3ac3e2b06857f21cc76999f5864eb57405b249"
    }
  }
}
```

<!-- REVIEW-ARTIFACT Native.receipt.json gzip-base64 -->
```text
H4sIAAAAAAAC/2WRu27jMBBFe38FoSoBZINviunsJkVS2cBuueBj6BCRyICSEgVB/j1UVLjYcs6duTO487VDqBnzXBxcXgwVsnlAjQ5ccKzBGa05sRIToTQOnvhABMPUAnAOxGmjMYPOMsuCENiG4IIUrGva1bXP15sl8YQ7kB11VtU5qThWDLgSBHtqnZASU0wJsM4oi70JWBDNlQ/cKww2bJbm3cTe2B4e4+kEIReo3kz8atCbtxH8BVxOfqycHLj8VQaznMfxKZ4qpLTer+k2scTpMplpXrvxhkrJ5VZ+mJJiut6A8UMcx5jT3/+UJebhOPs4raxrt1xL+TwuZwhQIDm4dfdg0h8oq9OaznMt0d37BhA/MH7A++Joi5ZO/pN8P6fXlD/Svo9pXvbXNLfI5WGIE5KGYOM6R+tXjK8vs95arIl21IqaKFeSBk18i85Qt45w3+y+dz+lSF9V9wEAAA==
```

<!-- REVIEW-ARTIFACT Canonical.receipt.json gzip-base64 -->
```text
H4sIAAAAAAAC/2WQPW/bMBCGd/8KQlMD2AZJ8TNbvHRoJhtox+JIHh0iEllQUqKi6H8vFQfw0O3uee+eA+7PjpBuKkv1eHkBLlX3SLq+j0YxFx1Ir1VwodVKSjRSSeaAAqc0gsU+OGAxWhmidtLqoC31vZbdfrMO5XpXet9LraOL2jophABrjPC2LSjBgkPPhAclDacWeB8EulZYz5zy1mGwNyW8QRrADfg1nU4YS8Xm7uVHhgP8mjBc0JccpsbZkauPZIT1PE3f0qlBLrg0ht421jRfZpiXbfoT1VrqvX2HmlO+buDTBWFM05RK/vF/tKYyPi0hzXfBVGr9/bSeMWLF7PGeDAj5O9ZNtf3nubXky9sNEHHsxZEequd7shr1U4nDkl9zec+HIeVlPVzzsie+jGOaiQJGwRvPuUMI6MEF177HrOdOUs6EVjxaFvbkjO3qhA/d7u/uH2Yj/DT5AQAA
```

<!-- REVIEW-ARTIFACT Native.log gzip-base64 -->
```text
H4sIAAAAAAAC/71VUW/bNhB+tn/FwcDQBLBVSXYc2ysKeE7SBmi6NG77MhQDRZ7liylSJSnb2bD/vqOcrdgy+GVoXiyT9/Huuzvex997tcOVpnIdejPoeXQkNOCefCBTQk3GoIKiIa16feiJrSAtCo1v6CfGD894rxZyI0r0vP6lV2vReGJARL9DYZYonFwvNKEJcY+q2rrwxol6HZe1s3a1I1Vi8G0A9LaOfz58jb+FCIEpsfMvvLIV8VK1gdjjDIwFaauaNHPUVDjhHkCRQxmse/iRzQHIAFJYowO5Rrlh4IEBHzTYetXM8jM6T9bEEkTScLI9bMAoGY6SdOBk3of9ZPzreDRozMbYnRloMs1+UJqmH0kwNRiLLBVyIvO8QKFQikIVRTrNpjIvztI8G52P89U0U324Q47q8bT3R/fFEivyTErjXJfISfhb4cL1deJrzflyGxZWN5W5Q26V5zKKwMxegMIajfLALMWebOW5LFzOGvehDwstvCcpdCLXliT24UNjQ+JtY9SXIzEVbSkmfgg5l88W6saqRuOzhPpod+ieJdIVGQrPk9QFVWj89+vW35fxAkuHeLFV3y2tKD0y3FhD8srZAg01/s7a4P9XxM6Ch1QYFjOMyha4XorHPX5tEyDL0xRevbucv38Ng3vIYHADk2yaw6vl4m7+cfH29cv3PHhbTKJe9LqdT6yVrRc48chiovzpDLIkzbud5YMPWD0xpkk+7nZu0UkeYrArWNx+grAmD/e2gNKGGUyzH7qdSy1qz0J1shNag9RWbk4fna1nVTXznL+D+I1OZ2mWjNJuZ86SxTIMfi0cHw5cEvD0Gx/aFA8BW+w3VGMecUoEcQTnA6v7EXuwgd+Lp/Ybbk/VVMCKRSqm6/EJnTwfpvk0/+bsGLj1ec95nzj82pCLPbx++fMp1PHkSjQ68GWYnE0YR+aAk1pQFYECVk5U+C/wWTZNGf6Z54dFlZ8ObtShbDsK/FowJD8fnnc712Z7BDNmassdt6wlecWPEfjDBSBTNzHQeTqcjP5p4it3sMXD3GBOuELv4zsKUeP/08AZId9AdTBSaYT2PBKa99zj7m3btLZ0f1VulE752l3u+YHiboamDfonyhgvG/gHAAA=
```

<!-- REVIEW-ARTIFACT Canonical.log gzip-base64 -->
```text
H4sIAAAAAAAC/6WWbW/bNhDHX9uf4mBgQALErkhLtqQVBTIjawu0W1avfTMMKyWdbcYUqZJUbG/Yd99RzrCHdsYAvrFM3p+/O/JO4v026SxulNzu/KSEiUMrhQI8Suel3kIntcYGql6qZnIDE/EopBKVwpfyG9LPM5rrRL0XW3Q0/mnSKdE7SYKgfoNCr1HYerdSErUPc7LtjPUvreh2YdhZYzYH2WzRu8EBOtOFPz98Cr+V8J5CIvjPNDKtpGEzOCJiCdpAbdpOKopRycoKe4JGWqy9saevyexBakDpd2ih3mG9J+E5AlqocaAqivIDWieNDkcQgoarx/MEpLN5OkumtuY3cMwXvyzSaa/32hz0VEndH6db3d+EICg0WAiWiDqvOa9QNFiLqqmqpGBFzass4SxdLvimYM0NvEPy6vB68vv4+Xr17vbH1asXz1ZCGy1roWYhpJInZV7CQVhNmSiBeEpY4UNUvUMHH52x9vTxAiAtkzjAMhIwT2IB81jAIhZQRAJSHgvISs6iCFlsJWXLSMAijQQsWSwgjwTkWWQei9haZgmLJsS+0YzFflQYfdfSSMI8MpeML6IJRSxhHvtOsDT288rS/1mToxXdcEJTJ4ChLfCyxYbuyvA0vQfKaQLP39zdfvcCpg/AYPoWclZw+C/Pk/HoPfUaAwiuHNJl3LjrEpJZno5H65Pz2H7ByBfj0T3amnoJMBtY3b8Hv5MOHkwFW+NLKPhX49GdEp2ji/7qIJSCWpl6f/0E25VtWzoHxkJ4BmiZsBlPxqNbuvKpjQG3E5YWezx6cPJXWrSvTh4H7V+qXj/pGuHFBZ3z1B1dsHvjqd/63P5WHGXbt2DRySZs1+Fn4fCUZ3n+N9gl8cB8oH1fWfzUSxvS+PrZ99fQhZUb0SvvSmBzTjqpzzoqBtkGoYCNFS3+S5xlWZB/MKrXPrRelKjzsR2kp26LJMUyH49e68cLEkaI9YEyNsT4LfVy4M75l7rrgx/OF0v+TxMV3dlGS9aUX9pvi86FNpQ2r/0XDbQhlI+hcINRbrVQjkpe0Zx9mr0fcjac3J8HlyYFVd3dkfo7SqbvB6d/AOR6NU83CwAA
```

<!-- REVIEW-ARTIFACT check.json gzip-base64 -->
```text
H4sIAAAAAAAC/3WSQW/bMAyF7/kVhk8bUCx1bdlNb0N3ya1Adxt2YCQ60SpLGiVjG4r+91GK7DQDdtTHR+o9Sq+bqqrDPE1Af+qH6pWPDDzIF4x8rgkDAsnT9mBm9KRt3J6LYfuMkw568gY/myMeCMITUNzvP/0IztY350nkQE3g06j/6RdpiBDnkJTSJVXEpWKdwlQQooAXbVVY7TIwyAkY3PU3C1I4aqujZi8PVbvieEJHODFrLtp0IZAOWSveYRsizbIM6dYCeG+0hMKbjN+KN/B6H3FK9trbwmY28hVDzLAp0BuwmFGz6A4Q0GiLX1AaoDw/1bv7pYWQ8OfMa4x4lX9pZNbfrjbT3qoP8aRDdX60j1wfLjF448fU0op/WtbHTg3Ndb4j+Ox5iZEMlWhrjjw47O2zdB4vKy380biAivG1/In3YTMXm3JdjUSO0uhv3/P5F5DV9viOyBNyMnp006Tzj5XjKO6xU0Ls2q4fhBI4jlIMQ6f6dieFgn5o73CXP1fNHwl/50v5oXHztvkLmSOCvxEDAAA=
```

<!-- REVIEW-ARTIFACT atlas.json gzip-base64 -->
```text
H4sIAAAAAAAC/12RwU7DMBBE7/2KVc6lKkmctHAqBXEAUQmOiIPr3RCriR3ZTtsI8e84DqGl1zeeWc/u1wQg2nJLa13X0kU3EImiYAtKkbFlkmY5Q0ZFIViep5glS8GQZ3kS0zKa9l5DHDeq6rzTmZamY96b459kPY2XLAu0kIpXZzi//nv8gANc+AGntyeaJb+zar0nDBmjOA8KR7zgcRoE27N1J6oA3z8C1Af1otFXblXfmLGRjuY8Hcml1e5k0xA+S7U7o1KVZKQj3Jim5KeYobiiw38+/NkK3VC/8JVwLa9AKqQjIYiSxI4McIXAB2nbygpn3FqqtxXBQboSGqP30kqtgvWq9rsxHfj9mIp3txCKw/3qMeT4JoAkKm648xYL2p9sCko7EGScLKQIAugC6OjI9Kl+gi7sbLhzzY+v1j7Ju363cTxn8/nke/IDD542qD8CAAA=
```

<!-- REVIEW-ARTIFACT edition-access.json gzip-base64 -->
```text
H4sIAAAAAAAC/63QQU/DIBQH8Ps+Bel5FAqj7XbbzNSLyUx2M2aB8lhrWFuBJhrjdxecelviYQcu/3/ee/nxNEPoIz6EMj9MroFshbLtHZZTaAeXzc/V5GzK2xBGvyJklEfIT11uJqzA2a7PNRDwvZxsIKOD0XV98KQFCz2QgpWHWB6ObshHbX53ahm+jzHKSlxQTBe/jXoP4GMlSk6r5U/oW8lEmQaoMpJSVWkloZJi2RRLrrlgnLJam5qV1aIwhdAc6rpRggpWmroUpayMqoGLLC78nF9wj5OynW9BX6BHmI1C7/NmOBHfBSBxhJjOgicHM1kb4C2Ql7izl9YT2QRJIpESypgglNKCrG/2a5wynDKcMhxF7H+/I5smnk/d/X6/Q1vnBocWlK/Q7eBUpzX0l4WbzdWFozy9RiGtEo6fhbv1wyNOWcLxP6G4rnD2PPsCTBNMJr8CAAA=
```

<!-- REVIEW-ARTIFACT common.py gzip-base64 -->
```text
H4sIAAAAAAAC/3WTUU/bMBDH3/Mp/OaEhCChjYdOligjTJ0QVA3wwlDk1tfGXWpbPge6b79zWqBo480+3/3u/P/bS283zMnQdnrO9MZZH9iUtsl+jf3cebsAxGKN1hStxJhaeCjmEuHsS2ExqUUsSZtmqTtomqz0gLZ7hjQrnfRgQjKrpre7JIslmGftrXnkd+P779XdpImn/ClLLsZ1JdL6hEd0GbaBR5RUTYBtIBgGr12aJbPJpeA1bDTSlB2MuxXMvcSp9GEy4cnP2wvBZ9XD8WVVT37cHH+eqWDJlF4BhnSejTyE3hu2v2KJrTz9ekYHZQvbfVY2lGBrX9Io2qCBiGO/Vb8LVi5aWPxubB9cH9JHvtKBFzzW8qEu5yOeR8pTsXhRIoqww8crrz/jRxfKzkqF6ccxsl1x7GXkBoqQjRLmRH0Sd98kIpCdrtTYeOhk0M/QBJvWmTSKBfJE4Ysmf/gvw7OEaSKVsNUYMI0gZjsl3KEbFKOkGBZhPxyFWsGPjo7YvVMyALui9zBiPCfjUpflxD4/J37Oebm22qT8mOfbGOZL69mWaROBJbpOh04boN7UBzqE0R48Vuo/VJ7EN7zY51zAikDTGIjN2vd2+T/twsdm+QCoSJLX8uTQUd8bMlI61/1phob8qdCGJBfDrojKiDvfQzF4v1tiUPQGxAHmsnq4ub++pqu92XIgLOn56uR6Z6XNRm+2Dv6rfuMwtQUY7D00EhdaiytJOtE4ij6cON3pkiV/AdL+a3jhAwAA
```

<!-- REVIEW-ARTIFACT immutable.py gzip-base64 -->
```text
H4sIAAAAAAAC/81X3W/bNhB/919B5IVSZyvb2xDAD26abMG6tEizvgSGQEvnmKgsCiTVxBj6v++OHxLlpBmQbcD0IJHUHe93H7w7npyc3IComd0Bk/t9b8WmASb6WlpmNQB7kHanessqDcLK9p4JpqFTRlqlD8y0ojM7ZYuTk5OZ3HdKW7Zt98JWuzj1n0ZuCrGpni72VjbDqppttdqzTtgd/gtU7CNOI4npN51WFRgzrBzMLI6Vmd1cfPzAlo4nU6aA9qvUqi3uwWb8dvXH+cXtVUk0fM6M1RnRFdVDneX4zN6uPl0g8zHf9Xn5efX+6t3q9qIkEuR1jFlZbmUDZZkXGoxqvkKWF53Q0Fp2ynjXbxpZodVUu9gIA4V9tJxIRV1aeLRIjBBkh7Jntzer898u3qFwgxJHLYtqB9WXEj3Q9Ta74/fSonTemAV5h4YL7d6LVuxhodrmgFMCuZ4z1GtJus4ZiVve6h5QZNdItHwLhuSer85/JZX//IaWW737FADksw83V79cXa/e0z/a+oyhKYQNJpszWsvZVmk3YrJlGR80I0RusjlYMDSDR2msG0njjBaGtXTw7xu1cUxxoDpo6fugpYVhTz/zm+bfZrMathiNDZoYTU9Rk5/NGD5WH/yAHg22163zNpEkroqspVUZ2Wn8hZYhVnisoLPss2h6uNBa6Se7XqsWPI4NIs++wCFAkFuGE9YqS7YJ7k3YhTTALtEQ18peqr6t3f5uA0fkvFGIuh6Xpls6z40buukd/l+TC/8ufvDMPoQ4YT8wfsbxTbxjzHiRQctx82jzGMKdCwZoK1VjcliSOXBKqhg3CdYg3MsjV6U6SeMs+cS8MQrvkthaHwuNg0Gw/0w0GLxT1IDUkGW8t9vFz5wQxA1cFHsVeKMqgVGaM2jQUZEijzIYBj6n01vhkU6M4mIzDcXvav68hj62vYr5kXU8lEETLzUcp9eJjGfxJXluYYjgQSge3FfLpEP/kkjRHjKDuVFoa6j+kLqF9rmSn6JPMGTpQ9nHJOBy8opDsmS84B6rzzyvwxqy1ktYJ/Yn+altPALKaSFm8W1Bt3MUVfXaoPjlpcBtXntMDhKamrmimQSSS6LEM0jxWH2aXU+x5Ednzk07DVv5iFg4j7K9TYeYeOoPx0guqURby1pYVxUM1mWos+ihETpuS5lsIE797cUnxPRUqsUGpIdh0QrZIMRhh7sG2oF1nQoKLUkRvhlxjgbAeKtZNtqKjvYpj3mWaI+QeKu7TuN0FO+dTYWrJAMHK+8x2Sw5FblNv92CpoS1+OmllIm1FR6oQP+7CdRV1HWCKkE0wolIBhCDFGKJNsmcQlxveH5c0j6C3ktjsOfxBY0nvSSCpCTnu5TJkZOqeEuZ7+pDNuS3fJBKoYeywoFTxSdLoFPa/yKrh9M7diDBdm+Evkf7vHnz5YFGY72feoe0JXMdueUfGGn0ZdIVrb+DKgU/FqX/Efq00j0Hv2qEMey9EjXobHKJKPxigE5qlqVspS3LzECznbOxC6OH1gp/fvA98LgLDZQYYD2mb89oOqjy53u8yAaPUE2Z/CRh8wtFvBxQP4a9Z0gXEc2YdmnHrFL7jsqIi+iBZn68l+ukoeLpnxqjFa8g0WKXsn1qsd+xd6e+3f9MLLfFhZLUDsps+6ahht5lx13IR5iYsflP09GYkripsAxYc0otZOSmglB0B57mYCoeIX0MZJR4p/3FNNHG7DC5LRYEt6SaVzY+OkbQIVxc+gitSot1pWmyADxeWEjTtqKrGQm/m95dhjGaOZteZMaJ+zdca/zArY0XnDCKq/6u4wduLVx26OMlhYVG7De1YJMyffZsG+GudI43XJiG8uMWJ7encZL8i3ols3ydnp3jO99oOB/BeP0u9kjlhBZobdA2+3EewxDd8BcLcb8wYxAAAA==
```

<!-- REVIEW-ARTIFACT validate_review.py gzip-base64 -->
```text
H4sIAAAAAAAC/5VWTW/bOBC961fwRilhlPYqQwc3cQtjg6SI08UCgmDQIm2zkUiFlBwLQf77DknZlj966CWhOTNvhvMeh1pqVaFCVZWSSFS10g26CvqF6QwpVFnyohFKGrIqiOZGtbrggTIxlxuhlczwy/jX3eRlOn+e/HzCeWoaHdplFCwtuKiqtqGLku/whTQNLUvyPBnfz8i38WyCqEH/jh+m9+OX6dPj3G4FvVcY7aop1rx4nS/KltdayIYsWlGyoKbFK2/mNW3W6ewWz3glDASUfFyu+EJT85PqZjqNfxslcVCn9n9cKspMOAiNNads3vBtE0bRSA+9QkB9hlVFaw8SHTkHhZJ2mZ6UF78rXTKonjYlNQTOsuKGaA9kiFQMfu69jW0s1xvO0h4vWCqNbGnQLlQK04QH5ygJkFiiw0ZmHfN4xZsQ9ymmDEdp+jy9R1QyBxRLWnG3dY39SRLGyzMUl1jarHWGXZk4T9z/DKgWDOd5GuJ9FCYASIattGmi4Ah2b8zTGohlfHvWLtvsuTOFl6R1P7l7GD87eczm08f7yX84jwKutdKGvFMthVxBl9uqoro7A3e/h3wTl4n0vY6CPjDD3gdEjC0hVBfr2z3MrTeaW3w9aGKguZVn+oF7EJz0C4J9fTjp68S7QnGyLxm72ri+gysoGpycXAOCXaWc4eRFt/wzqNvmd+iDfH7i80cjV2PolMvaqjahNxAuTav5nJpCiPQ7LQ2PyLJszTq1iCBQA8prkFQN8nUGVhZ9a8hfytc3drQq4n5wwA1gfImKrii5CTeQSRQQyhngWR2zlImiie2keOXdwONLNKLpYPrEAEPbsrHuoeFAGrJK3ZLOatXhAZy9F1u7wZzuu+HSnhB+0mybJ/ZPTBkLu2jEsi6/Tr8G6O0k31vLw63P4nEA3IIwCIb072sBQ+3NZt2mb3GtYOos7YGRi+n2yWAD2SQ3Ngk6oHR58hbTuubS1hEgzZtWS2SANc7OMvusC2o4madu+MWWugomK1D91gogmcGgoBLa1xPt3Oe7nqYfxt9gh2wssrVn2NOL88+R83fNTD9Ca3HTHucE1g3VK3s3IhfOT8InzEMESouVkLTsa3QXuwZ6FRzKacHucB1qpRqyVCWs00cluVUDSIupAv7wpUl3QENP6NJAr1R24Tb7mmeDqZf7qbfvXW0Ona3NdRa6eRXlxAnJZbu6+oDN5NKVt6O+4ocrXzH8GbnyrjOdBxeOmPrjBUtb+l8wtbnAjsMY0sOBle2Ale0pK9vTsAMt7zL9kIMMJzP+c6QcOul9oktOhxzSvza15u5ERjRgJxmE7W4gJPwM9CKV9qHcnlW3myUAaiN8UsddlA2elzwA3udK12sqQZMDnINUPcCXfHfDj0SPrD9o5KLxM5D8/SI6PwXdnAJt4HTcwESC0W9B/zjBrYaeZNn5EU6c88xTmpRchkcVRQS7Bg0dNpEP8lweYvwQ7QMGRhjwkLRSMI9nBw2cxN1YL5iA5z785gjdyejOzW+c7OY4sdHA8CPo4k61QJQLhR2/P4BTvesJBOwQZzKvAkYgexDyFax6kR3v5PYJXHMNAmNPjqgh9kEbgARcnnkM+L059jaFqjlO8LhoWlqi/p1F/Xvs3gzqTcdXGL0L+CqD674B1SvpQm8qaLfuELRcl7QbIdc0dD/+4XDgrIjxoqSaurcFKZADcUIqLO9LUTgDUksEt4VriwoZ1NLEmOCKbp+N+Ud8g/b039/29unWQJJwv/X8azb+MZnPJg/f4Ru1nUOYNmb3yeAe8v0ng9XtxU8GZ/jT94E3Z0eSyN0Jh9YD1+e2Y2ovYZ8L9xzlhOg8+B8MUzeqxgwAAA==
```

<!-- REVIEW-ARTIFACT base.txt gzip-base64 -->
```text
H4sIAAAAAAAC/wXBSREAMAgDwH/VUK5J5JDiX0N3Z6L9tVGkAoULbaUb2LbLQkr+8nxY7igSKQAAAA==
```

<!-- REVIEW-ARTIFACT publication-base.txt gzip-base64 -->
```text
H4sIAAAAAAAC/wXBwRHAMAgDsH/GKRiHcXoY7z9CpLFxNwV0ZBHC2gMyVdED/cX4ts8DUO7klikAAAA=
```
