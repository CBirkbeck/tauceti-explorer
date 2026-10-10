# Independent review of P8: bounded complex patching

Accepted as a complete planning pass, with the two recorded gaps and precise native prototype omissions retained. P8 is planned, not closed. This verdict does not establish an unconditional deformation-ring action, finish the requested supplier interfaces, or assert any formalization.

Reviewer: Codex, session `codex-JQhY6E`, job `REV-DeformationAndDerivedPatchingAlgebra--P8`, issue #6270, 2026-10-10. The original worker was Codex session `codex-akHcd3`, issue #6318. This reviewer did not author that work.

The reviewed deliverables are the P8 packet and suggested Lean file. The reader and original handoff were read as context. They are outside this review's editable deliverables; the reconciliation needed in a later assembly is specified below.

## Counts and verdict scope

The input had 52 nodes, 11 baseline declarations, 18 API items, 18 unit tests and six planets. The corrected packet has 51 nodes: two definitions, four constructions, 33 lemmas and 12 theorems. It has 14 baseline declarations, 18 API items, 19 unit tests and the same six planets. No nodes were added. One duplicate library lemma was removed. The review object checks all 51 retained nodes individually and records the disposition of the removed node. Ten retained nodes have corrective verdicts; 41 have verified verdicts. Every source issue E8–E14 has an independent confirmed verdict.

The current `detail.json` sets target level, overriding the older issue text's lemma-level assumption. I checked the target graph and every existing auxiliary statement without adding smaller proof nodes. Both integrated P8 ids survive. The main constructions distinguish the CG cohomology-action patch from the ACC derived Hecke patch. The requests and recorded gaps terminate the remaining non-routine prerequisite chains, as permitted for planned coverage by PROTOCOL §0. No stage is declared closed.

## Corrections made

1. **Cofinality.** The proof of `quotient-cofinal` reversed the group quotient map. The kernel condition gives Δ_N → Z_p^h/p^N Z_p^h, hence S∞ → T[Δ_N] → T[Z_p^h/p^N Z_p^h]. Its first kernel is contained in the standard kernel. Combined with the standard relations tending to zero, this gives the stated containment in every open ideal. The statement and the existing Lean estimate had the correct direction; the proof sketch now agrees.
2. **Numbered source attributions.** ACC 6.4.8 is a remark, and 6.4.16 is a proposition. Corrected the deformation quotient and augmentation locators accordingly. Corrected the Lean comment calling Definition 6.4.3 a lemma.
3. **Mixed-paper locators.** Split the ACC/GN citations for ultrapatching, GN/ACC citations for eventual isomorphism, and ACC/KT citations for the inverse limit and derived Hecke injection. Added KT Lemma 2.14, p.12, for the strictification of compatible minimal models, alongside Lemma 2.13, pp.11–12, for the limit and Hom comparison.
4. **Attribution precision.** Replaced every generic source-match sentence with the specific role of its source. The papers supply the bounded free representatives and patching arguments; the named matrix structures, coordinate APIs, extensionality and naturality formulas are native formulations or explicit consequences. GN Lemma 2.2.2 is stated in finite characteristic-p local coefficients. The packet's finite-value germ construction works for any finite commutative ring by its own fibre proof, and the localization consequence extends to any finite commutative local ring by the displayed idempotent/kernel argument. These extensions are now identified as such.
5. **Existing augmentation theorem.** Removed `augmentation-retains-coefficients`, whose entire assertion is already `MvPowerSeries.constantCoeff_C`. Added `MvPowerSeries.constantCoeff` and `MvPowerSeries.constantCoeff_C` to the baseline and the derived-augmentation prerequisites. Replaced its admitted local theorem with an example using the existing theorem. This preserves the mathematical distinction between coefficient variables and group/framing variables without planning a library result again.
6. **Existing K-projectivity theorem.** Added `CochainComplex.isKProjective_of_projective` to the baseline and finite-endomorphism-count prerequisites. The P7 request now consumes this theorem instead of requesting another proof of bounded-projective K-projectivity. K-flatness, relative derived tensor, minimal strictification and completion remain separate exact requests.
7. **Definition test.** Added `presentation_complex_unit_disk`: a two-term rank-one presentation over F₂ with differential one must have a nonzero native successor differential. The old zero-term, coordinate and nonsuccessor tests alone would accept a constructor erasing every differential. The new example appears in the suggested file under its test comment.
8. **Source version evidence.** Independently checked all five PDF hashes against the supplied URLs and added the missing hash of the published correction to both source records. Added KT Lemma 2.14 to the sections read.

No original baseline citation needed removal. No target statement needed weakening beyond its already explicit corrected hypotheses. Every implementation status remains unchecked.

## Source reading and mathematical checks

All repository statements and source findings remain in our own words; no source passage or PDF is included. The source records distinguish the texts actually read from unseen replacements.

- [Calegari–Geraghty](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), author-hosted Springer-formatted journal PDF, §6.1, Theorem 6.3 and construction proof, PDF pp.90–93. Checked finite decorations, coefficient/framing reductions, top augmentation, scalar image and depth boundary.
- [Allen and collaborators](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), author-hosted Annals journal PDF, §6.4.1–6.4.17, printed pp.1053–1061, PDF pp.157–165. Checked the input rings and paired data, minimal models, localized products, error ideals, all finite/limit comparisons and residual conclusions.
- [Gee–Newton](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), author version, §2.2, pp.12–13: Lemma 2.2.2, Definition 2.2.5, Lemma 2.2.6, Corollary 2.2.7 and Remark 2.2.8. Checked product localization and bounded finite representative selection.
- [Khare–Thorne](https://www.dpmms.cam.ac.uk/~jat58/taylor-wiles-hida-leopoldt.pdf), author version dated 9 August 2016, Lemma 2.3 and Proposition 2.4, pp.6–7; Lemma 2.5, p.7; Lemmas 2.13–2.14 and proofs, pp.11–12. Checked minimal representatives, derived/homotopy comparison, compatible free limits and Hom completion.
- [Published CG correction](https://link.springer.com/content/pdf/10.1007/s00222-021-01095-5.pdf), Inventiones 227 (2022), pp.855–856, complete text, particularly items (1) and (10).

The graph's finite matrix selection requires bounded support and bounded ranks. Its endomorphism cardinal estimate counts chain representatives before quotienting by homotopy; it never injects derived maps into the chain-map set. Uniform deformation nilpotence concerns a power of the whole maximal ideal. The patched error exponent is fixed across all quotients. Completion of derived Hom requires the bounded free/complete Noetherian local contracts, rather than scalar adic completeness alone. Quotient surjectivity uses exactness of the finite error systems and compactness. These non-routine contracts are explicitly requested from their owners.

Augmentation kills group and framing variables together and lands in Λ. Hecke augmentation is surjective only after I₀, with the image of I∞ retained. Residual complex and image comparisons use the same ultrafilter and supplied coherent identifications. Residual deformation comparisons retain both error images. None of the nodes asserts arbitrary ultrafilter independence or promotes a cohomology action to a derived action.

## Pinned baseline and ownership

All actual declarations and their ambient hypotheses were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the recorded Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`. Every baseline entry here is Mathlib. The shared build's Mathlib commit and manifest match the pin.

| Declaration | Contract checked |
|---|---|
| `Ultrafilter.eventually_exists_iff` | Finite witness selection; no nonprincipality required. |
| `Filter.Germ` | Fixed-type eventual-equality quotient, not a varying-type ultraproduct. |
| `Filter.Germ.coeRingHom` | Pointwise function-to-germ semiring homomorphism. |
| `Filter.Germ.coe_eq` | Germ equality exactly means eventual equality. |
| `CochainComplex.of` | Successor differential construction and square-zero condition, including integer degrees. |
| `DerivedCategory.Q` | Existing localization functor with its derived-category choice hypothesis. |
| `CochainComplex.IsKProjective.Qh_map_bijective` | Homotopy-to-derived morphism bijection for a K-projective source. |
| `nonempty_sections_of_finite_cofiltered_system` | Compatible section for a cofiltered-or-empty diagram of nonempty finite types. Patch-data finiteness and the functor still need proof. |
| `AdicCompletion.of_bijective_iff` | Canonical completion map bijective exactly for an adically complete module. It is an entrywise ingredient, not derived Hom completion. |
| `MvPowerSeries.isNoetherianRing` | Finite variables over a commutative Noetherian coefficient ring. |
| `IsArtinianRing.isNilpotent_jacobson_bot` | Radical nilpotence in an Artinian ring; no uniform family exponent by itself. |
| `MvPowerSeries.constantCoeff` | Constant-term ring map over a semiring, with arbitrary variable type. |
| `MvPowerSeries.constantCoeff_C` | Constants survive that map without Noetherian or finite-variable hypotheses. |
| `CochainComplex.isKProjective_of_projective` | Bounded-above, termwise-projective cochain complexes in an abelian category are K-projective. |

Read the reviewed library audit and the actual supplier statements for P7 perfect objects, minimal representatives, residual ranks and minimal homotopy equivalences. Read the R03.1 and R03.5 stage scopes: complete local coefficient/continuous lifting interfaces and finite decorated module patching remain theirs. Read IHG.2's blueprint statements and current upstream Layer 2 reader and relevant suggested declarations: derived images, finite derived morphism modules and ghost ideal powers are imported existing roadmap targets.

Checked the read-only current upstream tree, including the nine additions absent from the atlas snapshot, and searched the current Tau Ceti library for bounded complex patching, ultraproduct patching and competing completion targets. No matching P8 patch construction was found. Current upstream Hecke and ghost theory is cited, not replanned. Generic perfect/minimal/completion theory remains P7's responsibility. No upward dependency on the arithmetic or completed-cohomology consumers is introduced.

## Source issues E8–E14

These verdicts concern the specified author-hosted CG journal PDF. They do not claim a result about an unseen revised publisher replacement or novelty across every version.

| Finding | Independent check |
|---|---|
| E8 | With H=Frac(O), all H/πⁿ vanish, while a bounded finite free patched top O-module cannot equal H. Finiteness/completeness of H is missing from the printed construction claim. |
| E9 | The proof's depth calculation is framed. For the corrected finite range, j=1 and a one-degree O complex give framed depth two and unframed depth one. |
| E10 | The published correction's items (1) and (10) explicitly restore the completed-ring brackets. |
| E11 | A free representative over coefficients modulo πᴹ cannot be ordinarily reduced to modulo πⁿ for n>M. The one-degree augmentation at n=N+1 also contradicts the printed unrestricted range. |
| E12 | The decoration extracted from level M uses φ_M; φ_N is undefined when N=0. |
| E13 | For A=O/π² and I=(z²,πz), tensoring ker(π) gives k[z]/z² with nonzero z action, while the kernel after quotient is spanned by π and z and has zero z action. Nonflat framing quotient base change fails. |
| E14 | The zero input satisfies the hypotheses but cannot satisfy the asserted positive finite depth. Nonzero top cohomology is needed for the numerical P9 conclusion. |

The packet already repairs E8, E11, E12 and E13 in its construction hypotheses. E9 and E14 constrain P9's future depth target. No additional source issue was needed.

## Remaining work and validation

The orchestrator must reconcile the inherited unconditional continuous R∞ action with ACC Proposition 6.4.12: it supplies T∞ → End_D(C∞) and R∞ → T∞/I∞. The conditional supplied-lift node is correct. The scalar lift S∞ → R∞ in Remark 6.4.14 does not furnish R∞ → T∞. Either adopt the stated scope correction or supply the additional continuous lift theorem.

The native P7/R03.1/R03.5 interfaces and all nine prototype omissions remain explicit. In particular, the CG prototype packages already supplied completed output, rather than constructing it from the full decorated input. Its mathematical existence target retains the stronger framing-quotient actions needed to repair E13. Acceptance of this plan does not discharge those interfaces.

The original reader is outside this review's allowed edits. During assembly, remove its planned coefficient-preservation declaration and use the baseline citation; incorporate the corrected cofinality proof, source locators, K-projectivity import and fourth native-complex test. The corrected packet and suggested file are authoritative for these changes.

Validation on 2026-10-10: the packet checker reports zero errors and zero warnings; section-18 issue and source-version checks pass; the suggested file elaborates with `lean-check` against the pinned shared Mathlib build, with only admitted-proof warnings and no errors. Compilation checks the displayed signatures, including the new native disk example and the proved baseline augmentation example. It does not prove the planned mathematics or omitted contracts. Intake path/JSON checks and whitespace checks also pass.
