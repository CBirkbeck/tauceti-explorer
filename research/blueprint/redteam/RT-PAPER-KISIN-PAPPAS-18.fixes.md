# Fix report: RT-PAPER-KISIN-PAPPAS-18

Codex (`codex-J6LwjP`), 30 September 2026. Refs #5011.

All **18 confirmed findings** in the verifier file were addressed, including the six low-severity findings omitted from the generated issue summary. This report follows the verifier’s qualifications rather than automatically applying the red-team proposals. Three assigned deliverables were changed. No roadmap packets, other extractions, generated atlas/register/queue data or independent review files were edited.

The extraction remains complete under §16, with 288 items (14 library,18 planned,256 missing), 11 routes and82 active source issues. It does not claim proof closure or formalisation. All14 new items have precise statements, locators, ownership and prerequisite contracts; new definitions/constructions have planning APIs and tests.

## Disposition of every finding

| Finding | Change or justified adjustment |
|---|---|
| 1 | Corrected D08, D09, D18, psi-constant-mod-a and kp18-lemma-3-1-9. Canonical c, constancy and versality link to KPZ26/F10, F11 and psi-constant-modulo-a through relatedExtractionItems. Cross-paper ids are not local prerequisites. Removed stale live references to the deleted sequel item; corrected the two other constancy-bearing review additions. |
| 2 | S08/S09 explicitly require very-good embeddings and 𝒢=𝒢° where appropriate. Followed the verifier: Lang remains a prerequisite of S09 only; S08 descends stable strata. E58 replaces the dangling gap reference. |
| 3 | S36’s second and S37’s last assertion, S44/S45/S47/S48 now carry corrected routes. S38 and S39–S43 remain valid as printed, and S46 is unaffected. KPZ26 Prop.7.2.19 gives very-good covers without (NE); (NE) concerns the connected refinement, removed by Cor.7.2.24. Extended E3 to pp.204–205. Recorded published Cor.1.1.2 versus preprint Cor.1.1.3. |
| 4 | Added intrinsic-connected-local-model-diagram on route9, with S47/S48, M08 (reaching M07), connected-stabilizer and finite-level prerequisites, plus Lang for the same-field conclusion. N06 now consumes it. The corrected proof includes the exceptional-case sequel input. |
| 5 | Wired all104 retained named review additions, each with explicit prerequisite list, consumers and locator evidence; generic cited supplier atoms have an explained empty local prerequisite boundary. Merged haines-rapoport-prop-3 into G01, retained the distinct torus clause. Corrected the reversed G08/G09 edge. The matrix below records every addition. Exception to the proposed S14 edges: neither pz-local-model-special-fibre nor the later finite-level-quotient-etale-local-structure proves Prop.4.3.7; they now feed S49/S50 and relevant later results. Adding the latter to S14 would create S14→finite-level→S44→S36→S35→S34→S14. Pages190–191 instead give the explicit inputs in finding12. This exception is intentional and reviewable. |
| 6 | M10 retains the m_j multiplicities, diagonal repeated representations and translated chains, with E29 cited. M11’s conclusion is unchanged. |
| 7 | Added polynomial-lattice-chain, gl-lattice-chain-local-model, lattice-model-grassmannian-immersion and unramified-local-model-base-change to route7, with APIs/tests where applicable. M10/M11/M13 and the PZ criterion now consume the corresponding inputs. The criterion requires specialization at u=p to Λ_y^•. GL-building inputs are RG2.2/RG2.3; the total Grassmannian rank is half dim V′. |
| 8 | Added planned Grassmannian and Lagrangian scheme items at R09.1, retaining Mathlib’s quotient-rank functor as partial baseline, and reflex-flag-variety at ShimuraData:D3 with R09.1. The local-group generality of D3’s export is an explicit interface obligation. Consumers include M02, M13, Görtz and A01. |
| 9 | P05 is now missing on route7 with arbitrary-field algebraic LG/L⁺G scope; added twisted-affine-flag with its source normality hypotheses. Removed route7’s GS.1 supply overclaim. Recorded the upstream shared-owner decision and KPZ26/P05 repair for the maintainer; no downstream Part II import into GS.1/ET.2b is authorized. |
| 10 | Added planned algebraic-fundamental-group and kottwitz-homomorphism at BG1, with the integral inertia-coinvariant target. Wired kernel, tensor and fundamental-group hypotheses. G01, the torus clause and S28 have RG2.3 placement constraints to avoid a BG1 cycle. Removed the claim that narrowed RG2 stage text already plans κ and Lang; listed all four Lang consumers for reconciliation. |
| 11 | N02, N06 and N14 fix geometric Frobenius. The GL₂ crossing sanity check gives1−q, not1−q⁻¹. The brief retains raw constant sheaf versus shifted/twisted IC normalization. |
| 12 | Added prime-to-p-level-finite-etale and small-level-connected-torsor on route9. S14 explicitly descends through the normal small-level free quotient using an étale surjective cover; its proof does not infer a factor’s étaleness from the composite. KPZ26/S11’s stronger very-good assumptions are documented instead of silently used. Qualification of the verifier’s raw-closure proposal: the unconditional input is finite étaleness of the normalized models. For unnormalized closures require an explicit full or open-and-closed étale pullback presentation; generic components of an étale cover of a nonnormal base alone do not justify the assertion. This does not weaken the input S14 needs. |
| 13 | N10 now transports z′ to z under matching Bernstein presentations and q^{1/2}/measure choices. N14 requires sufficiently small K^p as imported by §4.7.2. |
| 14 | U04 and E17 state cd_ℓ=3 only for ℓ≠p (Hu Thm.4.5); no assertion about cd_p is inferred. E17 records the split-G₂ anisotropic Pfister counterexample to the intermediate field-H¹ claim and leaves the finite-k lemma conclusion unresolved. U06 specifies algebraically closed k and cyclic tame splitting. The exact earlier independent E17 record is archived, not silently rewritten as a reviewer’s verdict. |
| 15 | P12 now points to A01; S09 to E58. Removed the rejected weak-admissibility gap from kisin10-lemma-1-4-5-g-splitting and preserved the valid tensor-category correction. |
| 16 | Retired E65 into E64’s mergedDuplicateRecords, preserving the old record and verdict for provenance. E64 remains active with O_{F,(p)}. Active findings are unique; later ids are not renumbered. |
| 17 | Added unreviewed E81–E83 for F[[t]]→F_p[[t]], Z_p→Z_(p) in §4.2.1, and Lemma→Proposition1.3.3 in §4.1.5. All three were checked on published page images and corresponding v3 pages52,53,78. E83 is separate from E52’s other locator bundle. S01 fixes the label and records automatic no-E₈ for Shimura data. Fresh correction searches are recorded; no invented independent verdicts. |
| 18 | Followed the verifier’s reversed direction: new source route11 puts the shared Iwahori centre/hyperspecial comparison in upstream SR.1/SR.4. It remains missing because the generalized coefficient contract is not already stated there. Route10 imports it and retains the parahoric extension and transfer. Maintainer notes request matching changes to Venkatesh and Zhu routes, outside the allowed files. This avoids making Venkatesh30/31/67 depend on a downstream Part II. |

## Source and baseline evidence

The published KP18 checksum was reproduced (`e2b4a0763f216be82da950f4c0dd2800adea8a0d911b12bfacf2b7e493b4618b`). Fresh selective reads: printed pp.124,145–146,157–159,183–184,188,190–191,197,204–205,208–210,213–215; visual checks pp.183,184,197,214. The graph also uses the inherited review’s exact source locators for its105 additions; it is not presented as a fresh reading of every cited prerequisite paper.

The published sequel was read at §§1.3.1–1.3.2, Lemma5.1.15/Remark5.1.17/§5.1.19, Proposition7.2.19, Theorem7.2.21, Corollary7.2.24 and §7.3. Its PDF has89 pages and checksum `21a23b061271cb5813b69747213ea01e710878dc3b884123934309d51e17c0e6`; its download footer differs from the earlier archive, so that earlier hash was not overwritten. The published introduction calls the connected refinement Corollary1.1.2; the verifier’s v3 reference is1.1.3. PZ v4 p.75 fixes geometric Frobenius; Hu2013 PDF p.29 fixes the prime-to-p cohomological-dimension scope. `sourceVersions` distinguishes all these reads from historical full-source evidence.

The Mathlib Grassmannian file was read at the exact pin, including its quotient convention, functor/base-change laws and representability TODO. Reviewed audits AUDIT-01/R09.1, AUDIT-10/D3 and AUDIT-20/BG1 and the live stage descriptions were inspected. Searches of the pinned trees and declaration index did not supply the new full constructions; similarly named analytic Bernstein functions are unrelated to Hecke centres. Venkatesh29 and its consuming items30/31/67 and their accepted route were inspected directly.

The stage-edge reachability check finds RG2.0a→RG2.5→BG1 and RG2.1→BG1, while BG1 and RG2.3 are incomparable. The Lang owner candidates RG2.3 and ET.0 are also incomparable. These checks justify the explicit placement constraints, not a claim that arbitrary future source-route grouping is safe.

## Independent review and maintainer actions

1. Review the18 changes above, particularly the explicit exceptions to the proposed S14 graph edges and unqualified raw-closure assertion, and the generalized Iwahori coefficient contract.
2. Reconcile route approvals. Old routes1–10 keep their numbers and candidate identities; contracts1,7,8,9,10 changed, route1 loses the duplicate item, and new route11 is unreviewed. Do not infer approval from unchanged historical numeric entries in paper.review.json.
3. Coalesce the Lang interface across this extraction, Lipnowski–Tsimerman18, Kisin–Zhou25/R14 and Kisin17/lang-lemma-integral; keep exactly one owner. BG1’s inertia-coinvariant κ import may eventually move to a common earlier owner, but requires a separate authorized restructure.
4. Place algebraic loop geometry upstream of GS.1, ET.2b and the local-model Part II; repair KPZ26/P05. Preserve all shared candidate obligations when composing design jobs; do not overwrite a Part II brief with just this paper’s tranche.
5. Update the unassigned Venkatesh and Zhu route briefs consistently with SR.1/SR.4 ownership and the downstream parahoric extension.
6. Review revised E3/E17 and new E81–E83. Exact old E3/E17 records, including verdicts, are retained under reviewHistory; E65 is retired with provenance under E64. Regenerate the source register only through intake after approval.

## Dependency evidence matrix

Each row corresponds to a retained named review addition. Prerequisites are in-file item suffixes; consumers list the new edges. Empty local prerequisites mean a generic cited input whose proof belongs to its owning blueprint, as explained in that item’s dependencyEvidence. The historical duplicate haines-rapoport-prop-3 is replaced by G01 at all its uses, including D28.

| Item | Prerequisites | Consumers | Source locator |
|---|---|---|---|
| bt-extension-criterion-1-7-6 | P02 | G02 G05 G09 R03 G13 G14 closed-immersion-criterion-via-schematic-closure | cited in §1.1.2 (p. 128), §1.1.3 (p. 128), §1.1.9 (p. 130, implicitly), Lemma 1.2.5 proof (p. 132), Prop. 1.2.10 proof (p. 134); also Used at printed pp. 140 (ρ: 𝒢_x → 𝒢ℒ_y), 142 (Γ-action on Res_{Õ/O} 𝒢_{Ω,K̃}), 143 (Prop. 1.3.9); also in §1.2 |
| bt-big-cell-isomorphism-1-2-13 | P02 P04 | G04 | Proof of Prop. 1.1.4, printed p. 129 |
| anantharaman-quotient | P02 | G04 | Proof of Prop. 1.1.4, printed p. 129 |
| bt-quasisplit-parahoric-structure | P02 P04 | G03 G04 G09 | Proof of Prop. 1.1.4 (pp. 128–129); proof of Lemma 1.2.5 (p. 132) |
| steinberg-quasi-split | L06 | G03 G04 U10 | Proof of Prop. 1.1.4, printed p. 128 |
| edixhoven-tame-fixed-points | P03 | G03 G04 G13 | Proof of Prop. 1.1.4 (finite Z case), printed p. 129; also Proof of Proposition 1.3.9, printed p. 143 |
| pappas-rapoport-torus-kernel | L07 L09 P02 | G03 G04 | Proof of Prop. 1.1.4 (Z a torus), printed p. 129 |
| landvogt-quotient-map | P01 | G02 G08 R06 | §1.1.3 (p. 128); proof of Prop. 1.2.3 (p. 132); §1.2.27 (p. 139) |
| landvogt-toral-embedding | P01 | G08 G10 G11 M09 | §1.2.1 (p. 131); proof of Prop. 1.2.3 (p. 133); proof of Cor. 1.2.11 (p. 134); proof of Prop. 1.2.21 (p. 138); also Proof of Lemma 2.3.3, printed p. 157 (also §1.2, Prop. 1.2.21) |
| landvogt-levi-product | P01 G05 | G08 G11 | Proof of Prop. 1.2.3 after (1.2.6), printed p. 133; §1.2.25, p. 138 |
| remark-1-2-7-translated-maps | G08 G05 landvogt-levi-product | G11 weight-splitting-of-image-lattice-chain | Remark 1.2.7(b)–(d), printed pp. 133–134 |
| symplectic-total-lattice | G06 G07 | M12 | §1.1.11, printed p. 131 |
| tame-twisted-form-presentation | P03 P04 L06 | R05 G11 | §1.2.14, printed pp. 135–136 |
| tame-descent-buildings | P01 tame-twisted-form-presentation | G11 G13 | §1.2.14 (p. 136), §1.2.22 (p. 138); also §1.3.8, (1.3.8), printed p. 142; also §1.2.14 and §1.2.22 |
| tits-irreducible-representations | R01 P03 P04 | R05 | §1.2.15, printed pp. 136–137 |
| minuscule-weights-multiplicity-one | R01 | R02 R03 R07 weight-splitting-of-image-lattice-chain | Proof of Prop. 1.2.10, printed p. 134 (again in Prop. 1.3.3) |
| closed-immersion-criterion-via-schematic-closure | P02 G07 bt-extension-criterion-1-7-6 | G12 G14 | Proof of Proposition 1.3.3, opening paragraph, printed pp. 139–140 |
| weight-splitting-of-image-lattice-chain | G08 G05 R01 minuscule-weights-multiplicity-one remark-1-2-7-translated-maps | G12 smooth-closure-of-root-groups-common-apartment | Proof of Proposition 1.3.3, (1.3.5)–(1.3.6), printed p. 141 |
| bt-big-cell-smoothness-criterion | P02 P04 | G12 | Proof of Proposition 1.3.3, step 1), printed p. 142, citing [11] = Bruhat–Tits, Publ. IHÉS 60 (1984) |
| smooth-closure-of-root-groups-common-apartment | R07 weight-splitting-of-image-lattice-chain | G12 | Proof of Proposition 1.3.3, step 1), printed pp. 141–142 |
| torus-closure-with-maximal-bounded-points-is-smooth | P02 L07 | G12 | Proof of Proposition 1.3.3, step 2), printed p. 142 |
| tame-reduction-diagram-1-3-11 | G11 G12 tame-descent-buildings | G14 | Proof of Proposition 1.3.3, step 3), (1.3.11)–(1.3.12), printed p. 143 |
| gille-serre-conjecture-II-quasi-split | L06 | U05 | Proof of Lemma 1.4.6, printed p. 145, citing [28] = Gille, Compos. Math. 125 (2001) |
| parahoric-flasque-sequence-1-4-9 | U03 U05 U06 G04 | U08 | Proof of Proposition 1.4.3, Step 2, (1.4.9), printed p. 146 |
| rank-one-parahoric-coset-factorization | P02 U01 | U09 products-of-rank-one-parahorics-in-image | Proof of Proposition 1.4.3, Step 3, (1.4.10)–(1.4.12), printed pp. 147–148 |
| products-of-rank-one-parahorics-in-image | rank-one-parahoric-coset-factorization | U09 | Proof of Proposition 1.4.3, Step 3, printed p. 148 |
| witt-boundary-torus-decomposition | U01 U06 G01 P02 | U09 | Proof of Proposition 1.4.3, Step 3, (1.4.13)–(1.4.14), printed p. 148 |
| fpqc-gluing-on-punctured-disc | U01 | U10 | Proof of Proposition 1.4.3, Step 3, printed pp. 146–147, citing [6, Ch. 6, Thm. 6(a)] and [29, Appendix] |
| minuscule-schubert-variety-is-flag-variety | P05 reflex-flag-variety R01 | M02 | §2.1.1, printed pp. 150–151 |
| normality-from-reduced-special-fibre | Generic supplier boundary | M05 | Proof of Corollary 2.1.3, printed p. 151 |
| quasi-split-polynomial-group-construction | P02 P03 P04 tame-twisted-form-presentation | M01 M06 | §2.1.4, printed pp. 151–152 |
| adjoint-local-model-morphism | M06 M02 | M07 | §2.2.3, printed p. 153 |
| adjoint-grassmannian-map-quasi-finite | M01 twisted-affine-flag | M07 | Proof of Proposition 2.2.4, printed p. 154 |
| derived-parahoric-quotient-2-2-6 | G04 algebraic-fundamental-group | M08 | §2.2.5, (2.2.6), printed p. 154 |
| local-hodge-embedding | R01 L09 | M09 M10 | §2.3.1, printed p. 155 |
| hodge-embedding-toral-data | P01 P04 R04 G11 local-hodge-embedding | M09 | §2.3.1, (2.3.2), printed pp. 155–156 |
| symplectic-parahoric-closed-immersions | M09 G14 G06 | M11 gortz-symplectic-local-model | §2.3.4, (2.3.5), printed p. 157 |
| gortz-symplectic-local-model | lagrangian-grassmannian gl-lattice-chain-local-model symplectic-parahoric-closed-immersions reflex-flag-variety | M11 M13 | §2.3.4, printed p. 157, citing [31] and [59] |
| pz-prop-8-1-criterion | polynomial-lattice-chain gl-lattice-chain-local-model M01 G15 | M11 | Proof of Prop. 2.3.7, printed p. 159 |
| seshadri-projective-free | Generic supplier boundary | M10 | Proof of Prop. 2.3.7, Step 1, printed p. 160 |
| satake-symplectic-structure | R05 G06 | M09 | Proof of Lemma 2.3.3, printed pp. 156–157 |
| normal-decomposition | D02 | D03 | §3.1.4, printed p. 164 |
| display-base-change-and-deformation | D02 normal-decomposition | D04 | §3.1.6, printed p. 165 |
| kp18-lemma-3-1-9 | D06 | psi-constant-mod-a | Lemma 3.1.9, printed p. 166 |
| psi-constant-mod-a | kp18-lemma-3-1-9 D06 | D08 D18 deformation-functor-notation | §3.1.11, printed p. 167 |
| zink-thm-3-extension | D02 L15 | D08 zink-thm-4-deformations | Proof of Lemma 3.1.12, printed p. 167 |
| zink-thm-4-deformations | D02 zink-thm-3-extension | D08 | Proof of Lemma 3.1.12, printed p. 167 |
| deformation-functor-notation | D05 D08 P08 | D09 | §3.1.14, printed p. 168 |
| breuil-prop-5-1-3 | D05 L15 P09 | D11 | §3.1.18, printed p. 170 |
| kisin10-lemma-1-4-5-g-splitting | D11 L06 | D13 D15 | §3.2.5 and footnote 4, printed pp. 170–171; used again in the proof of Lemma 3.2.6, printed p. 171. [43] = Kisin, JAMS 23 (2010), Lemma (1.4.5) |
| component-group-sequence-3-2-7 | P02 U01 | D15 | proof of Lemma 3.2.6, (3.2.7)–(3.2.8), printed p. 172 |
| de-jong-integrality-normal-7-3-6 | Generic supplier boundary | D17 | proof of Corollary 3.2.11, printed p. 173 |
| raynaud-gruson-flatness-4-1-2 | D16 P02 | D17 | proof of Corollary 3.2.11, printed p. 173 |
| display-deformations-over-dual-numbers-3-2-16 | D03 P08 | D20 | proof of Lemma 3.2.14, printed p. 174 |
| wa-tensor-strictness | D11 L06 | D20 | proof of Lemma 3.2.14, printed p. 175 |
| tangent-modules-def-G | D13 D18 D09 regularity-of-RG-generic-fibre | D20 | proof of Lemma 3.2.14, printed p. 175 |
| regularity-of-RG-generic-fibre | D13 reflex-flag-variety | D20 D21 | used in the proofs of Lemma 3.2.14 (printed p. 175) and Proposition 3.2.17 (printed p. 177: 'Since R_G[1/p] is regular') |
| interpolating-display-over-OK-T | D18 D19 D20 | D21 | proof of Proposition 3.2.17, printed pp. 176–177 |
| kisin-module-tensors-3-3-3 | D23 kottwitz-homomorphism | D26 D27 | 3.3.3 and the paragraph before Proposition 3.3.4, printed pp. 178–179 |
| broshi-tannakian-torsors | D23 P02 | D27 | proof of Lemma 3.3.5, printed p. 179 |
| crystalline-tensors-and-standing-assumptions-3-3-7 | D24 D25 | D29 | 3.3.7, printed p. 180 |
| group-over-W-3-3-9 | D29 | D30 | 3.3.9, printed p. 180 |
| etale-cycle-deformation-setup-3-3-11 | D30 D13 D18 U10 | D31 | 3.3.11–(3.3.12), printed p. 181 |
| shimura-datum-notation | P13 | S01 S38 | §4.1.1, printed p. 182 |
| siegel-datum | P13 | S01 A01 | §4.1.2, printed p. 183 |
| kisin-closed-embedding-of-shimura-varieties | P13 | S01 | §4.1.6, printed p. 184 |
| kisin-defining-tensors | L06 | S02 | §4.1.7, printed p. 184 |
| kisin-G-split-filtration | kisin10-lemma-1-4-5-g-splitting P13 | S03 local-formal-models-at-a-point | §4.2.1, printed pp. 184–185 |
| local-formal-models-at-a-point | D13 D30 kisin-G-split-filtration | S03 | §4.2.1, printed pp. 184–185 |
| blasius-wintenberger-comparison | D24 L13 | S03 S05 | Proofs of Proposition 4.2.2 (printed p. 185) and Proposition 4.2.6 (p. 186), and footnote 6 |
| berthelot-ogus-and-parallel-sections | D05 | S03 | Proof of Proposition 4.2.2, printed p. 185 |
| local-model-completion-notation | M02 | S04 | §4.2.3, printed p. 185 |
| generic-de-rham-frame-torsor | S01 S02 | S05 S06 | §4.2.5, printed p. 186 |
| local-frame-diagram | D26 D29 M02 | S07 | Proof of Theorem 4.2.7, printed p. 187 |
| connected-stabilizer-in-unramified-case | P01 P02 | S48 intrinsic-connected-local-model-diagram | Remark 4.2.14 b), printed p. 188 |
| rational-representative-of-cocharacter-class | L09 P13 | S10 | Proof of Lemma 4.3.2, printed p. 189 |
| kottwitz-kernel-and-parahoric-membership | G01 kottwitz-homomorphism L07 | S10 S12 | Proofs of Lemma 4.3.2 and Lemma 4.3.5, printed pp. 189–190 |
| deligne-congruence-facts | S11 | S12 | Proof of Lemma 4.3.5, printed p. 190 |
| deligne-components-and-galois-action | P13 positive-subgroups-and-closures | small-level-connected-torsor S15 | Proof of Proposition 4.3.7 and Corollary 4.3.9, printed pp. 190–191 |
| positive-subgroups-and-closures | P13 | S13 S24 S30 | §4.3.6 (printed p. 190) and §4.5.6 (p. 195) |
| connected-parahoric-torsor-pullback | S07 S13 | adjoint-frame-torsor | §4.3.10, printed p. 191 |
| a-isogeny-category | L13 | S18 siegel-points-as-isogeny-triples | §4.4.5, printed p. 192 |
| moret-bailly-integral-points | Generic supplier boundary | S19 adjoint-element-central-torsor | Proof of Lemma 4.4.6 (printed p. 192) and §4.5.3 (p. 194) |
| faltings-chai-extension-of-homomorphisms | L13 | S21 | Proof of Lemma 4.5.2, printed p. 194 |
| kisin-center-action | P13 L13 | S21 | Proof of Lemma 4.5.2, printed p. 194 |
| siegel-points-as-isogeny-triples | A01 S20 a-isogeny-category | S22 | §4.5.1, printed pp. 193–194 |
| adjoint-element-central-torsor | S21 moret-bailly-integral-points | S22 | §4.5.3, printed p. 194 |
| kisin-twisting-lemmas | S18 | S20 S25 S26 | Lemma 4.4.8 (p. 193), proof of Lemma 4.5.7 (p. 196), proof of Lemma 4.5.9 (p. 197) |
| adjoint-frame-torsor | S06 M07 connected-parahoric-torsor-pullback | S26 S37 | §4.5.8, printed p. 196 |
| zp-parahoric-adjoint-derived-models | S27 P02 | S28 derived-isogeny-setup-4-6-8 | §4.6.1, printed p. 198 |
| adelic-group-action-extends-to-parahoric-models | S25 S28 S24 | S34 | §4.6.3, printed p. 199 |
| derived-isogeny-setup-4-6-8 | P13 S30 zp-parahoric-adjoint-derived-models | S32 S33 | §4.6.8, printed pp. 200–201 |
| coset-representatives-J | S33 | S34 | §4.6.12, printed p. 202 |
| deligne-reciprocity-connected-components | P13 L09 | S15 S31 | Proof of Lemma 4.6.6, printed p. 200 (also §4.6.5, Cor. 4.3.9) |
| deligne-connected-to-full-shimura-variety | P13 S23 | S34 | Proof of Lemma 4.6.13, printed pp. 202–203 |
| sharp-cover-classical-type | P13 | S38 deligne-hodge-type-lift | §4.6.21, printed p. 205 |
| deligne-hodge-type-lift | P13 sharp-cover-classical-type | S38 | Proof of Lemma 4.6.22, printed pp. 206–207 |
| finite-level-quotient-etale-local-structure | S44 S47 S48 | S49 N05 intrinsic-connected-local-model-diagram | Remark 4.6.25(a), printed p. 209 |
| pz-local-model-special-fibre | M04 twisted-affine-flag algebraic-fundamental-group | S49 S50 | Proof of Corollary 4.6.26, printed p. 210 |
| toroidal-compactification-hodge-type | S01 | S51 | Proof of Proposition 4.6.28, printed p. 211 |
| milne-extension-property-uniqueness | S46 | S51 | §4.6.27 and proof of Proposition 4.6.28, printed pp. 210–211 |
| automorphic-line-bundle-omega-G | P13 L08 | S51 very-special-irreducible-special-fibre | Proof of Proposition 4.6.28, printed p. 210 |
| very-special-irreducible-special-fibre | S50 automorphic-line-bundle-omega-G | S51 | Proof of Proposition 4.6.28, printed p. 211 |
| siegel-extension-property | A01 L13 | S46 | Proof of Theorem 4.6.23(3), printed p. 209 |

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KISIN-PAPPAS-18.result.json`.
- `python3 research/blueprint/intake.py check-files` on the three assigned deliverables; staged whitespace check.
- `source_issues.check_issues` and `check_errata.versions_checked`: no errors; published source evidence is explicit.
- Every missing item routed exactly once; all local dependency ids resolve; graph acyclic with725 edges; all104 retained review additions have consumers; related extraction ids resolve. Item ids are preserved except the documented merge; source-issue ids are preserved except the documented duplicate retirement.
- Existing active source-issue records unchanged except the two revised entries and the E64 duplicate provenance; original E3/E17/E65 records and verdicts preserved verbatim in history. No new or revised entry is self-approved.
- Recomputed diagnostics: multiplicity2×2=4, Z/3 fixed/coinvariant groups under Frobenius−1 and its square, and geometric/arithmetic GL₂ crossing traces for several q.

No Lean file is assigned, no pinned compiled environment is available, and no Lean compilation was attempted. The remaining work is independent review and the explicit cross-owner design reconciliation, not an unfinished part of this extraction repair.
