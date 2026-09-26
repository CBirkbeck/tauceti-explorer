# Handoff: BP-AutomorphicBundles--B5

## Current continuation

Issue #681; stage exactly `AutomorphicBundles:B5`. Author: ChatGPT Pro (GPT-6 Astra Pro), session `gpt-20260926-c4e7b2`, 26 September 2026. Claim comment `5848962539`, workflow confirmation `5848963446`. Branch `gpt-20260926-c4e7b2-681`.

**Partial source-level proof checkpoint, not completion of the blueprint or a Lean implementation.** Only the B5 reader and this handoff change. The packet and suggested Lean file are unchanged. No request, gap, node status or coverage flag is marked discharged.

The exact preceding handoff, including its detailed source history, inherited checks and remaining-work register, is preserved [at branch base bb5169e6ac6ef3639aeb180798ae86cd46837577](https://github.com/CBirkbeck/tauceti-explorer/blob/bb5169e6ac6ef3639aeb180798ae86cd46837577/research/blueprint/handoff/BP-AutomorphicBundles--B5.md). It is the continuation of merged checkpoints #2932, #2935, #2938 and #2949. Keep those deliverables; do not restart the fifteen-node packet.

## Concrete mathematical advance

The reader now contains **Relative-coordinate density and the neat stratum identification**, inside the existing prime-quotient component-detection argument. This expands the preceding handoff's request for a proof that the actual neat stratum is dense in every geometric fiber of its smooth proper closure.

The generic relative-coordinate lemma is stated with its full hypothesis: distinct boundary branches are independent relative coordinates in a smooth chart. If W is a connected component of a closed intersection of a selected set of boundary components, remove the other boundary components to obtain W^o. Each removed branch cuts a proper divisor in every geometric fiber, or is absent there. A finite union cannot contain a fiber component. The reader proves fiberwise density, descent from etale charts, smoothness, and properness when the ambient model is proper over the regular base. It also checks relative dimension zero.

The application retains the **actual orbit-to-label dictionary**, not just an unlabelled completed local ring. For a stratum component Z_a with cone dimension d, take its closure W_a in the appropriate d-fold boundary intersection. On W_a^o there are exactly d branches. A frontier label corresponds, in a common chart of the compatible fan, to a containing cone face. Equality of branch counts forces that face to be the whole cone, and the chart's orbit-to-label transport gives the original label. Equality of dimensions alone is not used to identify unrelated cusp labels. Finally, W_a^o is connected and the components of the smooth original stratum are open and closed, proving Z_a = W_a^o.

Together with the preceding smooth-closure/Stein argument, this gives the written neat-level component-detection deduction **from those source-qualified owner contracts**. Their actual algebraic-space, chart, label and descent declarations still require integration and validation. The reader explicitly retains that boundary. It does not label an unimplemented interface as an available theorem.

The new collision test shows why the relative condition cannot be weakened. In P1 over a DVR, the sections t=0 and t=pi are each smooth proper, but their intersection is defined by (t,t-pi)=(t,pi). Removing the second from the first gives Spec R[1/pi], which misses the closed fiber. The branches coincide after reduction and are not relative normal crossings. This is a counterexample to a weakened auxiliary assertion, not to Lan's theorem and not a new source-error allegation.

## What is unchanged

The exact reader sections for coefficients, common boundary completions, fan refinement, constant terms, coefficient devissage, arbitrary coefficients, recognition, cuspidality, ownership and the three source issues are retained. In particular:

- The common-completion construction is still an open geometric input. There is still no coordinate-preserving map from k[[x,y]] to k[y,y^-1][[x]] in the claimed generality.
- The finite-thickening quotient/tensor proof still does not interchange tensor and an arbitrary inverse limit.
- The prime-filtration reduction, nonsplit coefficient extensions and unique-lift argument for invariant families are unchanged. There is no averaging and no product/filtered-colimit shortcut.
- Refinement cohomology and the tensor-exact boundary sequence remain separate obligations.
- The non-neat geometric component-transport and descent problem remains open. A neat pullback does not automatically meet every component over a chosen detecting collection; a toroidal level map is not automatically etale everywhere.

The preceding handoff reports 15 nodes, 9 API entries, 9 prose definition/construction tests, 3 planets, 5 pinned baseline declarations, 11 supplier requests, 8 gaps, 3 source issues and 8 packet source records. Those are inherited packet counts, not a new full-packet recount. This continuation adds **no packet nodes, API entries, packet tests, planets or baseline declarations**. A local check did verify preservation of all fifteen reader node references.

The suggested file is unchanged at blob `8e6ddc50b4bc0f57e1da94cfc7f78061dfa71baf`, as recorded in the preceding handoff. Its thirteen low-level example blocks and linear recognition theorem do not constitute the fifteen geometric signatures. Neither those signatures nor the nine geometric tests have been supplied or compiled by this continuation.

## Source and repository evidence

Unchanged library pins:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

No new assertion about presence or absence of a declaration at either pin is made. Existing verification records remain attributable to their earlier authors.

Read the current handoff and whole B5 reader, and the packet's header, baseline and source records relevant to this continuation. The reader input was reconstructed in local scratch and its complete Git blob hash verified as `897897c01da38403ac94463a92f60527e260c898` before editing. The handoff input blob was `009c2b9322aeba23b433580285f2617a22c35af4`.

The actual sources inspected for the new argument were:

- Lan's [author-hosted revision dated 14 March 2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf): the relevant statement of Proposition 6.3.1.6 and its stratum clause; Definitions 6.3.2.13-6.3.2.16; the relevant clauses of Theorem 6.4.1.1 and the neat algebraic-space conclusion. Rendered printed pp. 491, 519-521 and 523 were inspected. Attempts to render pp. 490 and 507 failed; those portions were read as parsed text, not claimed visually verified. PDF indices for the successful page images are 518, 546-548 and 550.
- [Stacks 0CBP](https://stacks.math.columbia.edu/tag/0CBP), its statement and regular-parameter proof. This is an absolute normal-crossings lemma for schemes; the reader expressly does not use it to manufacture the needed relative hypothesis or the algebraic-space chart comparison.

No PDF bytes or binary hashes were obtained. The publisher edition was not inspected. The earlier Stein-factor and other Stacks readings are preserved as history, not presented as new full-source checks. No new errata search or independent re-adjudication of E6811-E6813 was performed. Their scope and novelty limitations remain unchanged; no author was contacted.

## Validation actually performed

1. Verified the full original reader's Git blob hash before editing. Verified that the uploaded reader's returned blob, `264175578055388e9e122a11dc9b89b88ad951bd`, exactly matches the complete locally revised file, not merely a matching excerpt.
2. Checked all 15 reader node references against the original, in order, and checked preservation of the existing numbered sections. Assertions also confirmed byte-for-byte preservation of the mathematical sections outside the bounded insertion, introductory status adjustment and final provenance update.
3. Ran 15 symbolic ideal checks using SymPy, over QQ and finite fields of characteristics 2, 3, 5 and 7. In each coefficient field, Groebner bases verify the total intersection (t,t-u)=(t,u), its specialization u=0 to (t), and the unit ideal after passing to the rational-function field in u. All passed. These are regression checks for the collision example, not a proof of the generic geometric lemma, not tests of a PEL datum, and not Lean tests.

No full repository checkout, `scripts/check_blueprint.py`, global stage-DAG check or pinned Lean compilation was run here. The local environment could not download the full repository or provide the pinned Lean environment; connected GitHub reads and writes worked. Submission CI results must be recorded only after observation in the PR conversation, separately from the checks above. No predecessor's CI or compilation result is relabelled as current.

## Exact next work and ownership

The next worker should integrate the now-written proof into the existing supplier contracts rather than ask again for an undifferentiated proof of fiberwise density. Distinguish three declarations: the generic relative-coordinate density lemma; the neat labelled-stratum/closure identification on the actual toroidal charts; and its application to component detection. Retain their source hypotheses, actual carrier and label maps, and comparisons after geometric base change. Add their source locators and relevant tests to the owning packet(s), then update the consuming B5 request and matching suggested signatures. This checkpoint did not make those packet edits.

Generic relative-coordinate and algebraic-space geometry belongs to the existing SF.0/SF.1 interfaces; the toric cone and label transport belongs to C0/C1 and early C5; the Stein input coordinates SF.2. Resolve export granularity before promoting whole-stage edges. The safe dependency direction remains early spaces/descent, then proper coherent cohomology and Stein factor, then component detection, then the early PEL chart instantiation, then B5. Do not import all later SF.2 into foundational SF.1, and do not confuse the arithmetic-base Stein factor with the late minimal Shimura compactification.

Then continue the non-neat branch/stack transport with actual component coverage and descent. Continue the finite-thickening comparison on the real Mumford-family chart ideals, Hodge transports and degree projections. The common-boundary-completion construction, coefficient-sensitive refinement cohomology, tensor-exact boundary sequence and genuine Lean-carrier/signature obligations remain required. The generic prime-filtration request in R03.3 must still be accepted at the general Noetherian scope, not only its present complete-local conventions.

The early/late C5 split remains essential: early toroidal charts feed B5, while the late minimal-compactification construction consumes B5 constant terms. The untouched B5 scope also includes the geometric pull-identify-trace Hecke action, its arithmetic normalization and composition, non-neat Hecke descent, general Levi weights, ramified Hilbert cases, and actual analytic comparisons. Reuse the reviewed modular-curve and analytic suppliers before introducing new nodes.

The packet and B5 stage must remain partial until these recorded obligations and their validation are actually completed.
