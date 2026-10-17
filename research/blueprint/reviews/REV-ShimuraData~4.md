# REV-ShimuraData~4 — independent review

Claude (Opus 5.5), session **claude-7Pvc0x**, 17 October 2026. Issue [#10113](https://github.com/CBirkbeck/tauceti-explorer/issues/10113); the bot confirmed the claim. This session wrote none of BP-ShimuraData, BP-ShimuraData~2, BP-ShimuraData~3 or BP-ShimuraData~4. The revision under review is BP-ShimuraData~4 by `claude-WjBorz` (issue #10106, PR #10129).

**Verdict: accepted, with corrections made in this review.** This is a completed review, not a checkpoint. The revision followed the maintainer's instruction of 17 October 2026. It consumes ShimuraVarieties (#933) and PELModuli (#966), and the open ReductiveGroupsPartII, AdelicAlgebraicGroups and ArithmeticLocallySymmetricSpaces pull requests, instead of planning what they state. It adds the generality of data (SV2\*, SV4–SV6, the SV5 criterion, PEL type, lifting of connected data). It also resolves the D0 findings of REV-ShimuraData~3 and REV-FIX-RT-AREA-algebraicgeometry~2.

The review found:

- two mathematical errors in the revision's own new text;
- two errors copied from Milne;
- two clauses that consumers of superseded nodes use and nobody now plans;
- thirty-four source matches that did not say what the source states.

All of these are corrected here, in the packet, the reader and the suggested file. None needed the plan sent back.

## What changed in this review

| Item | Problem | Correction |
| --- | --- | --- |
| D1/mumford-tate-group | `I_MT` was defined as the kernel `K_h` of `O(GL(V)) → O(S)` and asserted to be a Hopf ideal. Step 2 equated the kernel of `h*⊗h*` (into `O(S)⊗_ℝO(S)`) with `K_h⊗O+O⊗K_h`, which fails because tensoring over `ℝ` is not tensoring over `ℚ`. `K_h` cuts out the `ℚ`-Zariski closure of `h(S)`, which need not be a group. | `I_MT` is now the largest Hopf ideal in `K_h`, the join of the Hopf ideals it contains, using Tau Ceti's `HopfIdeal.sSup_toIdeal`, which replaces `HopfIdeal.ker` in the baseline. `K_h` stays as the kernel of the complexified map. New test `mtKernelNotHopf`. In Lean, `mumfordTateHopfIdeal` is `sSup {I | ∀ x ∈ I, φ x = 0}`; its revision-4 body carried three proof placeholders for a false claim. |
| D4/additional-axioms | API `additionalAxioms_prod` and an acceptance line said that each of SV2\*, SV4, SV5, SV6 holds for a product iff it holds for both factors. | That is false for SV2\*: `GL₂ × GL₂` has centre `G_m²` modulo the diagonal weight, a split `G_m`. SV4–SV6 are iff; SV2\* passes only from the product to the factors. A product step and test `additionalProductSV2Star` are added. |
| D4/sv5-criterion | The acceptance line gave the norm-one units of `ℤ[√2]` as `±(1+√2)^n`, copying Milne SVI Example 5.25(c). | `Nm(1+√2) = −1`, so the units are `±(3+2√2)^n`. New source finding E19. |
| D4/connected-datum-lift | Step 3 replaced `μ` by `μ−μ₀`, copying Milne SVH Proposition 8.8. With `w = −μ−ιμ` this doubles the weight. | The step now uses `μ+μ₀`. New source finding E20; Milne's Proposition 8.10 uses the opposite sign convention `w = (ι+1)μ`. |
| Superseded consumers | HilbertModularVarietiesAndShimuraCurves R18.1/yz-torus-bridge needs the reflex field of a product, and AutomorphicBundles B0/homogeneous-hodge-torsor needs the Borel embedding to be a `G(ℝ)`-equivariant holomorphic open embedding into `G_ℂ/P_h`. ShimuraVarieties §§P.1 and P.3 state neither. | New lemma node **D4/product-reflex-field**, and API item `compactDualBorelEmbedding` with a proof step and the Milne Theorem 2.14 source on D3/compact-dual. Consumer retargets now name them. |
| 34 source matches | The text "the passage fixes the object/convention used in the statement…" (32 entries) or "the category, morphism or coefficient refinement…" (2) said nothing about the source. | Each was rewritten from the page it cites (Milne SVI §2 and §12, BP §§1.3, 3.1 and 6.1.8, Higher Coleman §3.1, CG §§2.1–2.2 and 5.3, Pilloni §5.1.1, BCGP pp.201–202 and 409, Hansen–Johansson §4.1). |
| Locators | D3/transversality-tangent cited "equations (18)–(19), p.29": (18) is the flag tangent space of p.24 and (19) the decomposition of p.25. D5/gsp4-kostant cited CG "§2.1.1", which does not exist. | Now "p.29, with the flag tangent space (18) of p.24" and "§2.1, PDF p.8". D3/bruhat-integral gains Higher Coleman Lemma 3.1.3 (Bruhat cells are products of root groups over `O_F`). |

## Supersession (74 nodes)

A Sonnet cross-check compared every `supersededNodes` entry with the upstream README at its recorded head: ShimuraVarieties `1dd09ed7a8`, PELModuli `7577fe7ccc`, ReductiveGroupsPartII `f24efef614`, AdelicAlgebraicGroups `241d5d6a9b`, ArithmeticLocallySymmetricSpaces `e7e16145f2`. These are still the current heads. I read the sections myself where the comparison mattered: ShimuraVarieties §§P.1–P.6, PELModuli §§M0.12 and M5.4, AdelicAlgebraicGroups §§1.3–1.4, 3.4 and 4.3.

- **Headings and names.** All 74 cited section headings exist, and every cited declaration name occurs in the section or its Suggested.lean.
- **How much upstream states.**
  - For 16 superseded nodes, upstream states the old statement in full.
  - For 45 it states part of it.
  - For 13 the old node was a detail of a larger upstream target. Examples: the graded Hodge category behind §P.3's "representation–Hodge dictionary", and the bracket relations behind §P.2's integrability.

That is consistent with the maintainer's rule that the owners own what they state. A detail of an owner's target is the owner's to plan. The revision passed the useful ones to ShimuraVarieties as candidate Checks in `upstreamNotes`, and this review adds two more (Milne SVI Proposition 5.7(a), and the Borel-embedding properties).

What matters for the atlas is whether a consumer of a superseded node relies on a clause that nobody now plans. A second Sonnet pass checked the 22 consumer pairs outside the owners (H0, AutomorphicBundles B0/B2, PerfectoidShimuraVarieties). I read each flagged pair:

| Consumer | Superseded id | Clause relied on | Disposition |
| --- | --- | --- | --- |
| H0 R18.1/yz-torus-bridge | D4/product-datum | reflex field of a product | new node D4/product-reflex-field |
| B0/homogeneous-hodge-torsor | D3/borel-embedding | equivariant holomorphic open embedding into `G_ℂ/P_h` | API item of D3/compact-dual |
| B2/filtered-de-rham-coefficient | D3/homogeneous-variation | Griffiths transversality | part of §P.3's "variation"; retarget adds D3/transversality-tangent |
| B2/betti-coefficient-local-system | D3/homogeneous-variation | weight summands rational iff they descend | retarget adds D1/rational-weight-criterion |
| H0 R18.1/yz-bridge-groups | D4/datum-morphism | possibly holomorphy on domains | ShimuraVarieties §1.6 (V1) added to the retarget |
| H0/integral-trace-family | D5/hilbert-trace-form | the old sign convention of `h(i)` | PELModuli §M5.4's `h` makes the pairing positive; the consumer's "negate the form" clause must go |
| S4/property-p | D4/adjoint-datum | `X → X^ad` injective onto a union of components | upstream note to ShimuraVarieties (Milne SVI 5.7(a), p.55) |

The other 15 pairs are stated upstream. Some reasons claimed more than upstream says; seven are reworded (D0/datum-map-points, D1/representation-hodge-equivalence, D1/test-objects, D1/tate-test-object, D2/quotient-separation, D3/homogeneous-variation, D3/homogeneous-horizontal). Six entries carry a `reviewNote` saying where the lost clause went.

**Cycle under the rescope.** `PELModuli:M5/hilbert-example-acceptance` cites the *current* node D5/hilbert-star-datum, while that node now consumes PELModuli §M5.4. This closes the stage cycle M5↔D5 that the in-memory merge reports as a skipped link. A `consumerRetargets` entry drops that citation, since the node is §M5.4's own `hilbertExample`. ShimuraVarieties V3/definable-borel and V5/siegel-canonical also cite current D3/D5 nodes. That is acyclic (V0 → D3/D5 → V3/V5), but under the proposed tier move it would be an upward citation; the maintainer should retarget them to AbelianSchemes A5 and ShimuraVarieties §5.13 or allow them in the bundle.

## Mathematics checked node by node

All 54 nodes have an individual entry in the packet's `review.checked`. Besides the corrections above:

- **D0.**
  - `G*(ℝ)` has two components: for a fixed sign of `t` the determinant locus is `ℝ_{>0} × ∏ SL₂(ℝ)`.
  - The compact-open correspondence uses a `U`-normalized `V₀` and `V = UV₀`.
  - `SL₂(O_F)` shows that `G*(ℚ)` is not discrete in the finite adeles.
- **D2.** Only the uniqueness half of Milne Proposition 5.9 is not stated upstream, and the node keeps exactly that.
- **D4.** The new revision-4 nodes were checked against Milne SVI pp.63–66 and 86–88, SVH pp.509–514 and Hansen–Johansson Definition 4.1:
  - Hodge type gives SV2\*: `G ∩ scalars = w(G_m)`, so `G/w(G_m)` is a θ-stable closed subgroup of `GSp/G_m`.
  - SV2\* with rational weight gives SV5.
  - The ℚ(√2) Hilbert datum fails SV5 and is of abelian type through `G*`.
  - In the lift, `ι` acts by `−1` on the cocharacters of the smallest ℚ-subtorus of `G/G^der` through which `h` passes, because the weight is zero and `L` is CM; this gives SV2\*, then SV5 and SV6.
- **E18 is confirmed, with a wider locator.** Milne deduces SV3 for simple PEL data from `h ≠ 1` on p.87 and asserts SV1–SV4 for all PEL data on p.88. A definite hermitian `K^n`, `n ≥ 2`, has central `h`, so SV3 fails. PELModuli §M0.12 states the same correction.
- **Recomputed.**
  - Kostant representatives for `A₂` with `W_M = ⟨s₁⟩` are `{1, s₂, s₂s₁}`.
  - The weight-three non-horizontal test fails transversality: `dF³(0) = e₃ ∉ F²(0)`.
  - The Iw₁ cyclotomic bound `1/(ℓ^{k−1}(ℓ−1)) ≤ 1/6 < 1/4` holds for ℓ > 5.
  - CG p.29's `C_{3−i} = −w₀(C_i)` and BP p.34's closure bar were read on page images.

## Sources and findings

The PDFs of Milne SVI and SVH, Boxer–Pilloni, Higher Coleman v1, Calegari–Geraghty, Pilloni, BCGP and Hansen–Johansson were downloaded again. All match their recorded SHA-256. The pages read are recorded per source (`independentReviewRead`) and per version (`reviewReread`).

- E18 confirmed.
- New, recorded for independent confirmation:
  - E19 (Milne SVI Example 5.25(c));
  - E20 (Milne SVH Proposition 8.8);
  - E21 (Higher Coleman p.32 prints `Y_w = ∪_{w′≥w} C_w`);
  - E22 (CG p.28 "C₀,…,C₄" for four chambers).
- Milne's errata page and Jungin Lee's list have no entry for E18–E20.

## Library, Lean and checks

- **Baseline.** All 22 baseline declarations exist at Mathlib 082e2d3 and Tau Ceti f790474 in the cited modules; I checked them against the pinned declaration index. `HopfIdeal.sSup_toIdeal`, `instSupSet` and `instCompleteSemilatticeSup` were read in `HopfIdeal/Basic.lean` at f790474.
- **`check_blueprint.py`** with the pinned index: 0 errors, 0 warnings. The packet has 54 nodes (11 definitions, 8 constructions, 21 lemmas, 14 theorems), 69 API items, 60 unit tests, 19 planets, 22 baseline declarations, 25 requests and 8 gaps.
- **`check_errata.py`** on a scratch errata-v1 wrapper of the 22 findings and source versions: ok.
- **`lean-check`** on the suggested file, at the pins: exit 0, with 109 placeholder-proof warnings and nothing else.
  - The unused `TauCeti.Algebra.HopfAlgebra.Kernel` import is gone.
  - `hodgeGenericBasis`, `hodgeGenericIsogeny` and `mumfordTateIsomorphism` now transport along Hopf algebra automorphisms (`≃ₐc[ℚ]`), as the corrected definition requires.
  - The remaining placeholder proof fields inside definitions are true closure properties: of subgroups and of the filtration and connection compatibilities of variation morphisms.
  - Every node, API and test name of the packet occurs in the file, in its README-only section where the carrier is not at the pins.
- **Reader.** Every node block and the superseded, request, gap and source-finding sections are rendered from the packet. A renderer reproduced the HEAD reader exactly before any change. A markdown-it pass shows no new emphasis spans apart from the review-status heading reference.
- **Atlas merge.** The in-memory `merge_blueprints` run succeeds. It skips the seven cross edges ShimuraVarieties:V0/PELModuli → ShimuraData that the restructure proposal reverses.

## For the maintainer

1. Seven packets still cite superseded ids and fail `check_blueprint.py` until `consumerRetargets` is applied: ShimuraVarieties, its V0 and V8 parts, PELModuli, HilbertModular H0, AutomorphicBundles B0 and PerfectoidShimuraVarieties. Applying the retargets is fix work outside this job's files.
2. The restructure proposal stands, with the PELModuli citation above added to step (5).
3. Thirty older lemma and theorem nodes, unchanged since revision 3, repeat their statement as their only acceptance line. This is a quality item for a later pass, not an error.
