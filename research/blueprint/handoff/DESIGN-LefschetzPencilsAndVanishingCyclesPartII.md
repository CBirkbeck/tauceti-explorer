# Handoff — DESIGN-LefschetzPencilsAndVanishingCyclesPartII

Issue: [#3359](https://github.com/CBirkbeck/tauceti-explorer/issues/3359). Worker: Codex, session `codex-wuPx6G`. The bot confirmed claim comment 6260506650 in comment 6260508576. This run performs only this job.

## Result and scope

The job is complete at target level for its first direction, using the issue’s explicit permission to plan the first independent direction and propose the rest as separate roadmaps. The roadmap retains the required id, area `etale` and parent `LefschetzPencilsAndVanishingCycles`. Its subtitle specifies prescribed finite-field points. `LefschetzFiniteFieldBertiniPartII` in the Kisin–Zhou extraction is the old proposed route id, not an additional roadmap to create.

Deliverables are the roadmap definition, packet, reader, compact suggested file and this handoff. The reader has the exact endpoint, proof, all fifteen API items, eight discriminating definition/construction tests, further acceptance tests and precise scope boundaries. The plan has six nodes: one definition, one construction, one lemma and three theorems; five are planets. Nineteen baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with Tau Ceti pinned at `f790474821cf4256814db967cb154e7af3d0c369`.

| Stage | Coverage | What is closed |
| --- | --- | --- |
| FC.0 | closed | Polynomial evaluation graph, bounded-support coefficient preservation, surjectivity and avoiding-graph existence. |
| FC.1 | closed | The marked component of the actual étale pullback and the same-field local curve theorem, including dimension zero. |

There are no gaps or open requests in these stages. Closure is relative to exact imported blueprint nodes, not a claim that those suppliers or this plan are implemented. The enclosing `SchemeAndStackFoundations--SF.0` packet has a `needs_changes` review on wider issues. Its `/etale-coordinates` parts (b),(c) and `/rational-point-component` parts (b),(c) supply the contracts needed here and are cited directly. No general smooth-coordinate, boundary-image dimension, component or digit-expansion theory is duplicated. No modifications were made to the supplier.

The parent LPV.3 permits a finite extension for projective pencils and does not imply this same-field conclusion. It is an ancestry/scope relation, not an artificial dependency edge. The entire smooth-chart curve argument works over any field; the finite-field specialization keeps the marked residue fields and Frobenius power unchanged. Stack-atlas rational lifting, singular local-model root subgroups and the global independence-of-ℓ theorem remain with their original owners.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/LefschetzPencilsAndVanishingCyclesPartII.json` reports **0 errors, 0 warnings**, using the provided pinned declaration index. The index omits the source-present instance `UniversallyOpen.of_flat`; the packet instead cites the source-read, indexed statements `Flat.generalizingMap` and `isOpenMap_of_generalizingMap`, which prove the required openness directly.

`lean-check research/blueprint/suggested/LefschetzPencilsAndVanishingCyclesPartII.lean` elaborated successfully against the shared pinned build. Its only warnings are the expected unproved theorem/example warnings. It is a signature artifact, not an implementation. The sole new data definition has a real evaluation body. The heavy marked-component data and its nine-item API are reader targets, as required by the current WORKERS.md shape; the Lean file gives its representative existence milestone on existing scheme carriers. No surrogate carriers or empty proposition fields are used.

Definition tests distinguish polynomial nonvanishing from rational-value nonvanishing, reject a non-strict exponent bound, check the one-variable and zero-variable cases, keep a mark on the boundary, and select the marked component of a disconnected pullback of an **integral** chart. The latter example uses characteristic three and the étale chart π(x,z)=(x,z²−1−2x) on Spec k[x,z,z⁻¹]; at B=2 its two branches are z=±(T+1), and the mark (0,1) selects the plus branch.

## Sources and ownership screen

Read Kisin–Zhou arXiv:2103.09945v2 (7 October 2024), Proposition 5.2.3 and Remark 5.2.4, pp. 49–52; Corollary 5.2.7, pp. 52–53; Proposition 5.3.5 and its curve use, p. 54. The packet gives the PDF hash and URL. Read Poonen’s author PDF dated 31 August 2004, §3.3, Theorem 3.3, remarks and Corollary 3.4, p. 10, for hypothesis comparison. Read Stacks 054L and 0CDW, statements and proofs, plus every baseline declaration cited. No uncleared book or private passage was used, copied or placed in the repository.

The polynomial graph and pullback proof are explicitly derived adapters, not falsely attributed as printed Kisin–Zhou theorems. The preprint’s projective-Bertini citation mismatch was already recorded and reviewed as `PAPER-KISIN-ZHOU-25/E11`; the packet has a scoped source issue resolving the local conclusion. The final Annals article was not compared. An additional author-hosted 66-page PDF was located, but its edition was not identified and it does not replace the explicitly pinned preprint or certify the final article. There is no new erratum-priority claim.

Read the reviewed LPV.3 audit, the relevant SF.0 supplier nodes, parent atlas stage descriptions/edges and every link-map entry mentioning the parent. The LocalFields/LPV.1 inertia overlap does not enter this proof. Read the current upstream AlgebraicCurves and StableReduction roadmap documents in the relevant geometry/acceptance sections, upstream writing/contribution guidance, and screened the current README/Suggested corpus including the newer roadmaps. Current TauCetiRoadmap HEAD was `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti HEAD was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current smooth relative-dimension modules do not supply the new existence result. These trees were read only; elaboration used the authorized shared build.

## Split proposal: preserve the other three routes

The packet proposes three independent owners. Only FC.0–FC.1 are planned by this submission. The following allocations preserve the other routes for design jobs if the orchestrator accepts the split. Their suggested layer labels are allocations, not already-defined stage ids. The original route briefs remain authoritative and must be re-read; this handoff does not certify their original mathematical sources.

### UniversalHypersurfaceMonodromy

Combine the Browning–Sawin and Schiffmann routes under this **one** roadmap. Preserve all of these items:

- `PAPER-BROWNING-SAWIN-20/primitive`, `/universalmonodromy`, `/algebraicgoursat`, `/rev-geometric-monodromy-group-of-a`.
- `PAPER-SCHIFFMANN-16/36`.

Allocation UH.0: universal smooth degree-k hypersurface family, primitive middle local system, ambient hyperplane-class summand in the even case, pairing, rank and geometric Zariski monodromy definition. Import LPV.0–5, shared scheme fundamental groups and EDC.2–4.

UH.1: Katz–Sarnak 11.4.9 (p. 334), for hypersurface dimension s≥1, degree k≥3, excluding (s,k)=(2,3), gives Sp in odd dimension and **full O** in even dimension in every characteristic distinct from ℓ, including characteristic two when allowed. Quadrics have separate rank-zero/rank-one primitives. Prove the even-dimensional finite-monodromy exclusion with its ordinary-hypersurface, Newton and Hodge inputs. Do not substitute ℓ-adic point openness for algebraic Zariski monodromy. Browning–Sawin’s printed use is proof of Lemma 4.3, pp. 924–925.

UH.2: algebraic Goursat for the relevant closed subgroups of O_a×Sp_b, including disconnected O, central quotients, exceptional pairs (3,2),(5,4), and b=0. The circle-method consumer needs the −1-eigenspace argument, not an unproved scalar splitting.

UH.3: export characteristic-zero full O/Sp monodromy to `MordellLawrenceVenkateshPartII` by actual parameter-space, primitive-pairing and Betti/étale comparisons for Lawrence–Venkatesh §§10.1–10.2. Preserve its other hypotheses. No integral monodromy theorem or all Beauville exceptional cases follow from this ℓ-adic statement alone.

UH.4: Katz–Sarnak 10.1.16, p. 299, and its proof steps 10.1.9–10.1.15. For odd q, g≥1 and squarefree f of degree 2g, the proper smooth projective completion of y²=f(x)(x−T), over the complement of the roots of f, has geometric monodromy Sp(2g). Include lissity/purity/pairing, tame infinity, local pseudoreflections, connectedness, irreducibility and the Kazhdan–Margulis step. Import the Euler–Poincaré formula from its owner. Katz–Sarnak 10.2.2’s characteristic-two family requires source closure via Sutor’s unread thesis only if a characteristic-two consumer is included; Schiffmann’s density argument can fix odd q.

Schiffmann Proposition 4.7, Annals 183 (2016), p. 321, Appendix B pp. 357–358, is Proposition 4.8 in arXiv v2. Preserve the density conclusion in T_g/W_g for Frobenius tuples of genus-g curves, importing DWP.0, DWP.5’s rank-one half-weight twist, DWP.8:equidistribution and upstream maximal-torus/Weyl theory. Normalize by q^(−n/2), with the chosen square root sent to positive √q under the fixed embedding. This is not the ordinary Tate twist (−1) in the older preprint. The published Chenevier scaling/leading-coefficient argument recovers Zariski density of the unnormalized tuples. The explicit curve family suffices; no universal curve over a moduli stack is required. Keep the genus-one measure, excluded root parameter and square-root-choice tests.

### SemistablePotentialMaps

Preserve all nine `PAPER-LIU-ETAL-22` items: `/potential-B`, `/potential-B0`, `/potential-factorisation`, `/P01`, `/cite-liu19-lemma-2-4`, `/P02`, `/P03`, `/P04`, `/cite-liu19-prop-2-19`.

Allocation SP.0: the strictly semistable strata and weight-spectral-sequence interface, importing LPV.7. SP.1: B^r, B_r, their null parts, A groups and Liu’s nice/very nice hypotheses. SP.2: alternating restriction/Gysin differential, its factorization, Δ and η. SP.3: the localized unramified-to-singular exact sequence. SP.4: potential-boundary/Abel–Jacobi compatibility and the special-closure cycle class. Import EDC.3–4 for cycle classes/Gysin/purity and MC.2 for Abel–Jacobi, without duplicating them.

The intended original supplier is Y. Liu, *Bounding cubic-triple product Selmer groups of elliptic curves*, JEMS 21 (2019), §2: Lemma 2.4, Definition 2.5 and equations (2.4)–(2.5), localized equations (2.14), Definitions 2.7, 2.12, 2.14–2.15, Theorems 2.16 and 2.18 with Lemma 2.17, and Proposition 2.19 (the extraction’s arXiv-v2 numbering). Its stated setting is **proper** strictly semistable X over O_K, relative dimension d, coefficients Q_ℓ or Z/ℓ^ν, with the exact nice/very nice and Hecke-localization hypotheses. Retain those hypotheses in each theorem.

SP.5 must prove the extension needed by LTXZZ, Inventiones 228 (2022), §§5.11 and 7.2, or name it as an explicit unresolved supplier input: the product Q is nonproper and coefficients are O_λ (Proposition 7.2.7, p. 292, footnote 29). Compare compact supports, invariants versus coinvariants, B-null-part definitions, integral coefficient passage and closure hypotheses; do not treat the proper rational/torsion-coefficient theorem as supplying this application unchanged. LTXZZ’s definitions/factorization are on p. 262, and the comparison is used on pp. 291–295. These sources were not read for a new blueprint in this run; the split preserves their source gates rather than claiming their proof closure.

## Follow-up

Independent review should check the six local proof contracts and all source/baseline matches, with particular attention to bounded digits, the marked component, the zero-dimensional branch and the version-scoped citation repair. The orchestrator must decide the split and issue the two separate design jobs with the routes above. No second job was claimed. There is no unfinished local stage requiring a checkpoint.
