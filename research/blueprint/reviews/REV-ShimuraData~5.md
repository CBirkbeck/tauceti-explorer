# REV-ShimuraData~5 — independent review

Codex, session **codex-6ig0yK**, 17 October 2026. Issue [#10136](https://github.com/CBirkbeck/tauceti-explorer/issues/10136), claimed with bot confirmation. The input is BP-ShimuraData~5 by `claude-iigpvN`, issue #10134, PR #10152 (commit `3980a29dd`). This session wrote none of BP-ShimuraData or revisions 2–5.

**Verdict: accepted, with corrections made here.** The packet records this completed review as `independent-review-REV-ShimuraData~5` and preserves the previous review in `reviewHistory`. All 56 nodes have individual conclusions in `review.checked`. This accepts a complete target-level plan under PROTOCOL §0: six stages are planned, none is closed, and eight gaps remain explicit. No formal implementation or gap closure is claimed.

The review checked the statements, hypotheses, proof outlines, acceptance checks, API, unit tests, source matches, baseline declarations, incoming requests, ownership boundaries and planets. Revision 5's two new distinguished-datum nodes and its sixteen incoming-request dispositions are retained. Its expanded acceptance checks are useful, after the corrections below.

## Corrections made

| Location | Finding and correction |
| --- | --- |
| D3/variation; D3/transversality-tangent | Pure weight one does not imply automatic Griffiths transversality. The automatic case requires types contained in `(1,0),(0,1)`. The new test `variationNonEffectiveWeightOne` uses types `(2,−1),(−1,2)` and fails transversality despite holomorphy and opposedness. Packet, reader and suggested example agree. |
| Suggested `IsHolomorphicFamily` | Finite holomorphic generators can have a rank jump. The predicate now requires a locally independent holomorphic frame spanning each step. A new example rejects the family spanned by `(z,0)` near zero. |
| Suggested transversality | Testing only sections on the whole chosen domain can miss local sections. The predicate and tangent criterion now quantify over every open subset. The tangent criterion also requires decreasingness: passing to the quotient by `F^p` preserves the condition of belonging to `F^(p−1)` only when `F^p ⊆ F^(p−1)`. |
| Suggested partial variation signature | The local-system fibres now have an explicit finite-rank field. The file still identifies the global holomorphic bundle, filtration and connection conditions as README targets whose carriers are unavailable at the pins. |
| Suggested `dualSiegel` example | A subgroup preserving all Lagrangians need not act transitively; the trivial subgroup is a counterexample. The quotient example now explicitly assumes transitivity. The actual symplectic transitivity theorem remains the geometric target. |
| Suggested `integralMonodromy` example | The cusp example now uses a punctured unit disk, matching the packet's elliptic degeneration. Its earlier domain was the punctured plane. |
| D1/hodge-generic | A rational Hodge isomorphism conjugates MT groups, but need not transport two arbitrary polarizations to proportional forms. If one MT group is full GSp, both forms transform under the common weight multiplier, and that alternating-form eigenspace is one-dimensional. This supplies proportionality and proves isogeny invariance in both directions. The existing Lean theorem explicitly assumes polarization compatibility; its documentation now identifies this specialization. |
| D1/mumford-tate-reductive | The MT group of `ℚ(1)^{⊕n}` is the scalar multiplicative group for `n ≥ 1`; at rank zero it is trivial. More substantially, pure polarizable rational semisimplicity already exists at the Tau Ceti pin. The plan now consumes `TauCeti.Hodge.exists_isCompl_of_isPolarizable` instead of requesting another proof from HodgeStructures. |
| D5/kostant-sequence-geometry | On the genus-one open cell, the Lagrangian is exactly the coordinate line only at the Weyl representative. Other lines move while their intersection with the reference line still has dimension zero. The acceptance check now says this. |
| D0/hilbert-adelic-points | Continuity into a Hausdorff group does not prove a closed image. A rational basis of the number field containing 1 makes the scalar finite-adele subspace closed; intersecting with the idele group and pulling back by determinant gives the required closed locus. |
| D4/distinguished-levi | The Levi identities are over a common field where the cocharacters are defined. The superscript `c` on a Levi means its quotient by the distinguished subtorus of the original datum's centre. Both conventions are now explicit. The fibre-product base is `G₁^ab`, rather than the abelianization of the Levi. |

For the new transversality counterexample, take conjugation exchanging `e₀,e₁` and put `L_z=ℂ(e₀+ze₁)`. Set `F²=F¹=F⁰=L_z`, `F^(−1)=V` and `F³=0`. For `|z|<1`, the determinant comparing `L_z` with its conjugate is `1−|z|²`, so the filtration is opposed of weight one. At zero the derivative of its displayed `F²` section is `e₁`, outside `F¹(0)`. This directly distinguishes weight from the actual set of Hodge types.

The native complement theorem is in `TauCeti/Geometry/Hodge/Orthogonal.lean:275` at `f790474`. Its hypotheses include the lattice and rational/complex base-change data. For a rational polarization, choose a full lattice and multiply the form by a positive integer to clear denominators; the Hodge–Riemann inequalities persist. HodgeStructures supplies the carrier comparison, while ReductiveGroups supplies the characteristic-zero faithful-semisimple-representation criterion. The existing gap is narrowed accordingly, not declared closed.

## Source verification

The source records give the precise reading scope and file hashes. Twelve downloaded primary copies matched their recorded SHA-256 values. The BKT NSF endpoint timed out; this review instead read the public [author manuscript](https://benjamin-bakker.github.io/DefArith.pdf), SHA-256 `b559c652490eb54595e86ec063945d016dd104949a91f9d6b4616cc4e25b8c8e`, at §1.3 (PDF pp.4–5), §2.1 (pp.7–8) and §4.2 (pp.13–14). It is recorded as a distinct source version. The historical NSF-copy hash has not been reverified by this review.

The retained mathematical claims were checked at these locators:

- Milne, *Introduction to Shimura varieties*: §2 pp.23–31; Proposition 5.9 p.56; additional axioms and examples pp.63–65; §6 pp.67–69; PEL verification pp.86–88; reflex fields pp.111–112.
- Milne, *Shimura varieties and moduli*: Propositions 6.3–6.4 and Corollary 6.5 pp.494–495; Propositions 8.8–8.10 pp.512–514.
- Deligne 1979: 2.5.2–2.5.7, pp.281–282, read from page images, especially 2.5.4 and 2.5.6.
- Boxer–Pilloni, higher Hida manuscript: §1.1 p.2, §1.3 pp.3–5, §3.1 pp.33–34 and §6.1.8 p.60. *Higher Coleman theory*, arXiv v1: §3.1 pp.31–32, §4.1.1 and Remark 4.1.2 p.48, §4.4.41–4.4.44 pp.78–82 and Remark 4.6.6 pp.89–90.
- Calegari–Geraghty: §§2.1–2.2 PDF pp.7–10 and §5.3 pp.28–29. Pilloni: §§5.1.1–5.1.2 p.20, §5.2.1 p.23 and §15.2.2 p.107.
- BCGP: §§3.1–3.2, Definition 3.2.1 pp.201–202, and Lemma 7.8.3 p.409. Benoist: §6.2, Proposition 6.6 and its proof pp.93–95. Masser–Zannier: p.637. Hansen–Johansson: Definition 4.1 and Remark 4.2 p.1980.
- Lovering, arXiv v3: §4.6, 4.6.1 through Lemma 4.6.6, pp.37–41. The distinguished fibre product, its derived kernel, reflex field and norm and isogeny functoriality agree with the two new nodes. Their explicit examples distinguish the fibre product from a direct product and the torus base from the Levi's abelianization.

E19–E22 now have independent confirmed verdicts. E19's odd quadratic-unit powers have norm −1. E20's printed subtraction gives weight `2w`, whereas addition gives zero under the stated convention. E21's union repeats a fixed cell instead of its varying-index summand. E22 lists five chamber indices where the display and theorem use four. E21 and E22 were checked on page images as well as extracted text. E1–E18 retain their earlier independent verdicts; no new published-source finding is introduced by this review.

The checks of the expanded examples include the A₂ and C₂ minimal left representatives and longest-element involutions, the cyclic genus-two ordering and intersection sequences, the GSp₄ root and coroot pairings, angular parity and exponential kernel, the Cayley signs, and the quadratic-unit counterexample to using only one place above a rational prime in the neatness criterion. The integral incidence proof cited through BL03 is still unread and remains an explicit gap.

## Ownership, baseline and closure

All 30 baseline declaration statements were read with their surrounding hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Native operations are consumed only for their stated scope: the local-system carrier does not construct an analytic bundle, a root pairing does not supply the GSp comparison, and affine Weil restriction does not construct the projective Hilbert compact dual.

The reviewed library audit was read. The current library and the nine newer merged roadmap directories listed in WORKERS were checked, including nested OperatorTheory suggested files. AlgebraicVectorBundles and DifferentialGeometry were read as current upstream models, with ReductiveGroups also consulted. The semisimplicity correction above is the additional native result found in this pass; the retained targets are not replacements for existing roadmaps.

The recorded open heads for ShimuraVarieties, PELModuli, ReductiveGroupsPartII, AdelicAlgebraicGroups, ArithmeticLocallySymmetricSpaces, AbelianSchemes, ComplexKahlerGeometry, ComplexManifolds, AutomorphicGaloisRepresentationsPartII and HilbertModularVarieties were checked. The new distinguished constructions were compared with Lovering and the Higher Coleman construction; the analytic import was compared with ComplexKahlerGeometry §K4 and ComplexManifolds Milestone 7. This review retains revision 4's 74 supersessions; it does not claim to have repeated that review's full section-by-section supersession comparison.

Every remaining use of a superseded ID in another packet has a recorded retarget: 126 prerequisite occurrences across seven packets. The two new D4 nodes supply the requested PerfectoidShimuraVarieties S6 interfaces. The sixteen incoming-request dispositions distinguish what this packet owns from what ShimuraVarieties and PELModuli own. The restructure proposal and the required external retargets remain maintainer work. No other packet was edited.

The eight gaps still cover analytic-supplier registration, integral flags, reflex parabolic-type descent, MT comparison and elliptic classification inputs, projective Weil restriction, compact-dual analytic charts, the prescribed-derived-cover extension and the limits of suggested signatures. Their precise supplier requests and per-stage remaining lists are preserved. The packet is complete at the planned-stage standard, without asserting closure. The twenty planets name mathematical objects or results; none marks implementation.

## Validation

- `check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**. Counts: 56 nodes, 85 API items, 72 unit tests, 20 planets, 30 baseline declarations, 25 supplier requests, 16 incoming requests and 8 gaps.
- `lean-check` on the final 1,364-line suggested file: **exit 0**, with **116 declaration-uses-sorry warnings only**. No data definition was replaced by a placeholder; unavailable carriers remain README targets.
- `check_errata.py` on a scratch errata-v1 wrapper of all 22 findings and their source versions: **ok**.
- Structural cross-check: every node, API and test name is represented in the reader and suggested file, including the README-only section; every definition and construction has at least three unit tests. All implementation statuses remain unchecked, and all six coverage entries remain planned.
- In-memory `merge_blueprints` on the atlas snapshot and this packet succeeds. It reports the same seven skipped cross-links from ShimuraVarieties/PELModuli that the recorded restructure reverses.
- `intake.py check-files` on the five deliverables and `git diff --check`: **pass**.

The handoff records the external retarget and supplier work. Nothing remains to complete this review job.
