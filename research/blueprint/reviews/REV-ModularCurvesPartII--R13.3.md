# Independent review: Modular Curves Part II, R13.3–R14.2

**Accepted as a complete planning pass with explicit gaps.** This is the finished review for issue #451, job `REV-ModularCurvesPartII--R13.3`, by Codex, session `codex-gVlOWT`, on 13 October 2026. The original checkpoint and completed blueprint were written by other sessions. No second job was taken.

The corrected [packet](../packets/ModularCurvesPartII--R13.3.json) is authoritative for this review. It retains all 46 node IDs: 30 verified without node edits and 16 corrected. No node was added or removed. There are 20 constructions, 15 theorems, seven comparisons, three applications and one definition, with 111 API items, 77 definition/construction tests and 25 planets. The one pinned baseline declaration is confirmed. There are 32 precise supplier requests and three explicit gaps. All seven mathematical stages remain `planned`; only R13.4, the nonmathematical process aggregate under RS-06, is `closed`. Packet status `complete` means the planning pass is finished, not that mathematics has been formalized or that every supplier contract is discharged.

Every node has an individual verdict and evidence in `review.checked`. Definition/construction tests were checked for detecting plausible wrong implementations, not merely for their number. The target granularity is retained: local calculations stay in proof sketches rather than becoming a chain of implementation lemmas. No baseline result, current roadmap carrier or current-library elliptic theorem is newly planned.

## Corrections made in place

1. **The proper Tate power map is not flat at the nodes.** Conrad's inspected author PDF, Example 2.5.1, p.18, asserts whole-curve finite flatness. For the branch map from `xy=t` to `XY=tᵐ`, put `X=xᵐ`, `Y=yᵐ`. Over a field the fibre at the target node has ring `k[x,y]/(xy,xᵐ,yᵐ)` and basis `1,x,…,x^(m−1),y,…,y^(m−1)`. Its length is `2m−1`, whereas the generic degree is `m`. In particular, the square map has node fibre length three, so it cannot be flat of rank two. The corrected target is a finite pointed map of generic degree `m`; its smooth-locus restriction remains finite locally free of rank `m`, with kernel `μₘ` and differential multiplier `m`. Two API items and a detecting node-fibre test were added. This is new confirmed source issue E7. It does not alter the distinct finite-flat modular degeneracy maps in Theorem 4.4.3 or the formal multiplicative-group calculation in §4.5.

2. **Effective polarized formal algebraization already has an owner and a target.** The original gap was based on the insufficiency of cohomological Grothendieck existence alone. That insufficiency is real, but the SF.4 packet separately plans `grothendieck-algebraization`: compatible proper thickenings over a Noetherian complete ring with a compatible ample line bundle are effectively algebraized. Its `algebraization-of-subschemes-and-morphisms` target supplies full faithfulness for proper maps. These exact prerequisites now replace the broad stage citation, including on the power-map node. The alleged missing planning contract was removed from `gaps`. SF.4's own partial/needs_changes status remains a supplier readiness issue; this review does not change or accept that other packet.

3. **The symbol comparison needs a cuspidal integral carrier.** Current ModularForms Layer 8 constructs the full integral symbol module, its boundary map and a period-induced quotient onto the form-side Hecke image. It gives `ker(eval_𝕄) ⊆ ker(eval_S)`, not equality. The packet previously attributed an existing integral Betti/symbol image equality to that layer. The corrected local R14.2 target requires the weight-two cuspidal boundary kernel modulo torsion, with an integral Hecke-equivariant comparison to compact-curve `H₁` or its correctly transposed dual `H¹`. The missing integral comparison is now a recorded gap. At level Γ₁(5), the curve has genus zero and four cusps: boundary symbols survive in the full symbol module, while the Jacobian is zero. The unit already distinguishes their kernels. The independent Jacobian/Betti/Tate realization comparison remains justified by the faithful Hom realization inputs; rational dimension or period injectivity alone is insufficient for the symbol assertion.

4. **Four vertical components, and the right contraction owner.** The prime-square model API said four outer plus two middle components. Edixhoven §2.1, pp.55–56, has two outer and two middle vertical components, four total, as the node's statement already said. The API and a new count test now agree. StableReduction Layer 7 supplies semistable existence; Layer 8 supplies canonical contraction and unpointed stable reduction for genus at least two. The latter is now a direct prerequisite and a precise request. Marked stabilization requires Layer 9 and its own stability inequality.

5. **A chosen root equation is stronger than its square.** BDMTV Theorems 6.5–6.6, pp.928–929, use `ϖ^((ℓ²−1)/2)=ℓ`. It implies `ϖ^(ℓ²−1)=ℓ²`; the squared equation also permits the negative sign. The two polynomial equations are no longer called equivalent without a root choice. The component genera, Fricke action, graph `K_(k,3)` and genus `6k²−3k` are unchanged.

6. **Supplier references match their actual statements.** Current ModularCurves 7E PD-3 owns elliptic Frobenius/Verschiebung, so that replaces the unrelated broad Abelian A3 reference on the Igusa node. Abelian `A3/polarized-weil-pairing` is the exact finite-flat pairing input for adjointness. Arithmetic `R01.6/good-reduction-specialization` replaces the broad arithmetic stage. R09.6's `completed-atlas-presentation` presents the identity-framed object/relation formal groupoid; other residual stabilizer arrows and the coarse invariant-ring calculation remain separate. The general tame pseudo-reflection criterion is explicitly an additional R09.5 supplier request: it is not an existing node of that packet, nor the unrestricted conclusion of current ModularCurves 9C's more specialized Katz–Mazur theorem.

7. **Level one uses the full group.** The coarse-curve acceptance case now uses `H=GL₂(Ẑ)` rather than the trivial subgroup. The latter is not open and is outside the stated input class.

8. **Source locators and metadata are corrected.** Česnavičius Lemma 6.2 and Proposition 6.3 are on p.63; Proposition 6.4 is on pp.63–64, Remark 6.6 on p.64, Theorem 6.7 on pp.64–65, and Proposition 6.9 on p.65. Theorem 5.13's proof continues to p.62. The downloaded version has printed pp.1–67. Gross–Zagier's full-subgroup degree and composition conventions are in Chapter I §2, p.227, rather than §1, p.226. Ribet–Stein Theorem 5.2 and Corollary 5.3 are on p.66; Lemma 5.7 is on pp.68–69 and Theorem 5.8 on p.69. The Bakker–Tsimerman fine-moduli assertion is on p.715. The Ribet–Stein URL now uses the working author host with the identical content hash. Source issue E5 also makes explicit that the pointed polygon's rotation and inversion actions commute, giving `μ_p×{±1}`; its raw-versus-effective order distinction is unchanged.

## Source findings and access limits

All six original source findings are independently confirmed, and E7 is added with a confirmed verdict. Each records the inspected version, locator, reasoning and searches; all descriptions are in our own words. No source passage or source-by-section exposition has been put into the repository.

| Finding | Verified locus and conclusion |
| --- | --- |
| E1 | Gross–Zagier III Proposition (1.4), p.255, corrected by Edixhoven §1.1.4–1.1.5, pp.35–36: ordinary mixed extra-automorphism points must be included. |
| E2 | Bakker–Tsimerman §2.1–2.2, pp.713–715: central inversion fixes a scalar framing, so that unrigidified problem is not fine. |
| E3 | Bakker–Tsimerman §2.5, p.717: cyclic degree is `ψ(m)`, while the full-subgroup degree and unfiltered boundary union use `σ₁(m)`. At `m=4` the degrees are six and seven. |
| E4 | Bakker–Tsimerman §2.5, pp.716–717: component domains must be those of the actual source polygons. The auxiliary polygon map has degree `m²` and supplies a prime-to-`m` torsion identification. |
| E5 | Bakker–Tsimerman §2.2, p.715: raw cusp inertia has order `2p`; order `p` is the effective stabilizer after rigidifying central inversion. |
| E6 | Conrad author PDF, Theorem 4.3.4, p.38, and Theorem 4.3.6, p.40: positive-divisor labels overcount the components, and a positive-divisor residue lift is not unique. Preserve the marked twist's inverse factor. |
| E7 | Conrad author PDF, Example 2.5.1, p.18: the proper power map's node-fibre length disproves whole-curve flatness for `m>1`. |

E1 is an existing published correction. Vu's institutional indexed dissertation text identifies the known component overcount in E6; the dissertation PDF pagination was not accessible. E6 and E7 assert the inspected Conrad author version only: the journal text was unavailable in this run. The primary Bakker erratum's stated metric/CM and bicusp repairs do not address the four §2 findings; no such correction was located in the checked author/journal/arXiv listings. These negative searches do not assert that no correction exists anywhere.

The nine public source files were checked against the packet's SHA-256 identities. Target-specific theorem, section and printed-page locators are in the packet and in each node's review note.

| Source | Public file inspected |
| --- | --- |
| conrad07 | [author version](https://math.stanford.edu/~conrad/papers/kmpaper.pdf) |
| ces17 | [author version](https://arxiv.org/pdf/1511.07475) |
| edix90 | [published version](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf) |
| ribetstein | [author version](https://wstein.org/papers/serre/ribet-stein.pdf) |
| grosszagier | [published version](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf) |
| bt16 | [published version](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf) |
| bt-erratum | [erratum version](https://benjamin-bakker.github.io/P.torsion.erratum.pdf) |
| bdmtv19 | [published version](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf) |
| mz20 | [published version](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf) |

## Baseline, ownership and closure

The retained baseline is `HeckeRing.GL2.heckeT_mul_of_coprime`, `TauCeti/NumberTheory/HeckeRing/GL2/Basic.lean`, line 221 at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Its positive-natural inputs and `Nat.Coprime` hypothesis give the exact coprime product in the abstract full-subgroup integral algebra. The suggested file's application elaborates. It supplies neither a geometric correspondence theorem nor the repeated-prime cyclic formula. No baseline citation was removed or added.

The reviewed library audit and current read-only sources were checked at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current Tate equation coefficients/discriminant/j-invariant, elliptic Tate-module rank two, Galois representation, Weil pairing and cyclotomic determinant remain existing-library imports. The new proper generalized n-gon and modular comparison targets do not duplicate them. Current prime-level ModularCurves Layer 10, quotient/deformation Layers 2B/2E and 7E–8C, StableReduction graph/surface/stabilization layers, and JacobianChallenge's field restriction were checked. The nine roadmaps absent from the atlas snapshot were screened in current README/Suggested sources, including OperatorTheory's nested files; none supplies the missing modular geometry.

Each external node statement was read with its hypotheses. Precise stage requests are distinguished from existing node-level suppliers: neither the relative curve norm/polarization nor the missing symbol comparison is inferred from an owner title. R13.4a constructs algebraic coarse curves before R13.4b compares analytic components. The lower-tier LPV.7 graph/nearby-cycle imports avoid the former upward Weights dependency. The six R20 cases retain their fine-versus-coarse, tame-versus-wild and regular-versus-nodal distinctions. Higher prime powers have regular-model targets; no stable-model formula is inferred from the prime-square case. R14.3 rank-two eigenfactor and R14.4 group/tree targets remain outside scope.

The three remaining gaps are:

- Wild level-dividing 2/3 coarse interior invariant rings, multiplicities, resolution and their graph maps. Coarse cusp regularity and fine rigidified `uv=p` do not solve this.
- The relative curve-specific norm/principal polarization contract over `ℤ[1/N]`. A field Jacobian and relative Picard space/lifting criteria alone do not give it.
- The integral cuspidal-symbol realization contract described above. The full symbol module's form-period quotient does not give equal integral kernels.

Their `neededBy` links and the precise stage `remaining` lists record the propagation. Prerequisite chains end at a confirmed baseline, another node, an explicit supplier request or a recorded gap. No unresolved contradiction remains in the corrected packet.

## Node verdict inventory

The complete evidence, including sources, hypothesis checks and supplier limitations, is in the matching `review.checked` entry. The inventory below uses the preserved node suffixes.

| Stage | Node | Verdict |
| --- | --- | --- |
| R13.3 | `generalized-tate-n-gon` | corrected |
| R13.3 | `tate-power-isogeny` | corrected |
| R13.3 | `formal-level-cusp-charts` | corrected |
| R13.3 | `gamma-one-integral-boundary` | verified |
| R13.3 | `gamma-one-twisted-tate-chart` | verified |
| R13.3 | `boundary-carriers-and-hodge-evaluation` | corrected |
| R13.4a | `integral-coarse-curves` | corrected |
| R13.4a | `coarse-normalization-comparisons` | corrected |
| R13.4a | `legal-coarse-base-change` | corrected |
| R13.4a | `coarse-cusp-regularity` | corrected |
| R13.4a | `modular-polynomial` | verified |
| R13.4a | `projective-scalar-coarse-quotient` | verified |
| R13.4a | `split-cartan-quotient` | verified |
| R13.3 | `gamma-zero-prime-power-cusp-rings` | verified |
| R13.4b | `generic-component-comparison` | verified |
| R13.4b | `compactified-map-comparison` | verified |
| R13.4b | `hecke-normalization-comparison` | verified |
| R13.5 | `igusa-components` | corrected |
| R13.5 | `gamma-zero-prime-power-local-model` | verified |
| R13.5 | `corrected-coarse-singular-locus` | verified |
| R13.5 | `tame-regular-resolution` | verified |
| R13.5 | `one-factor-mixed-level-model` | verified |
| R13.5 | `prime-square-semistable-model` | corrected |
| R13.5 | `split-cartan-semistable-model` | corrected |
| R13.5 | `split-cartan-thirteen-good-reduction` | verified |
| R13.6 | `modular-dual-graphs` | verified |
| R13.6 | `modular-character-group-interface` | verified |
| R13.6 | `modular-nearby-cycle-interface` | verified |
| R13.6 | `degeneracy-on-components` | verified |
| R14.1 | `degeneracy-maps-and-hecke-correspondence` | verified |
| R14.1 | `diamond-operators` | verified |
| R14.1 | `atkin-lehner-involution` | verified |
| R14.1 | `exact-divisor-atkin-lehner` | verified |
| R14.1 | `full-and-cyclic-correspondences` | corrected |
| R14.1 | `composition-relations-of-correspondences` | corrected |
| R14.1 | `analytic-comparison-of-correspondences` | verified |
| R14.1 | `coherent-hecke-trace` | verified |
| R14.1 | `integral-etale-trace` | verified |
| R14.1 | `projective-boundary-hecke-and-degree` | verified |
| R14.2 | `jacobian-and-functoriality` | verified |
| R14.2 | `hecke-operators-on-the-jacobian` | verified |
| R14.2 | `integral-hecke-algebra` | verified |
| R14.2 | `weil-pairing-adjointness` | corrected |
| R14.2 | `tate-module-with-galois-and-hecke-actions` | corrected |
| R14.2 | `rational-coefficient-pairing` | verified |
| R14.2 | `integral-hecke-realization-comparison` | corrected |

## Validation and orchestrator handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/ModularCurvesPartII--R13.3.json` passes with zero errors and zero warnings. The 188-line suggested file elaborates through `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, exit 0, with only two `sorry` warnings on the general counting milestones. All light data definitions have real bodies. Three added finite monomial examples detect the node-fibre obstruction; two additional analytic Fricke examples detect its sign/reciprocal and excluded zero-level case. Existing subgroup, cusp, graph/genus and characteristic-two quartic certificates still pass. Compilation verifies these finite controls and signatures; it does not formalize the geometric targets.

Before packaging, the orchestrator should:

1. Regenerate the reader from this reviewed packet and report. `research/blueprint/readmes/ModularCurvesPartII--R13.3.md` and the original blueprint handoff are outside this review issue's deliverables and were deliberately not edited. Replace their whole-curve Tate flatness assertion, false algebraization gap, full-symbol equality, six-vertical API, equivalent-root wording, misplaced suppliers and old page references. Their old prose is superseded by this review; it must not enter a package unchanged.
2. Route the exact wild and relative norm/polarization contracts to their existing owners, and the missing integral cuspidal-symbol comparison to the local R14.2 target. Determine its actual integral carrier before asserting equality of Hecke image kernels.
3. Track the explicit additional R09.5 pseudo-reflection/completion contracts separately from that owner's currently planned nodes. Do not silently substitute a tame theorem into the wild cases.
4. Respect supplier readiness and bottom-up package order, including SF.4's own unresolved review, without replanning its existing effective-algebraization targets here.

No promotion, merge, issue closure or manual label change was performed. Source URLs, identities, mathematical evidence and all continuation instructions are committed in the packet/report/handoff; no scratch file is required by a future worker.
