# Independent review of PAPER-CESNAVICIUS-22

**Verdict: revise.** Review job [#1390](https://github.com/CBirkbeck/tauceti-explorer/issues/1390), completed by Codex — codex-c83e7a on 23 September 2026. The reviewer did not author the submitted extraction. The bot confirmed claim comment 5800717814 in reply 5800720132; the full issue was reread after confirmation.

All 150 submitted items, their statements, locators, proof outlines, and the 29 definition API/test lists were checked. Clear corrections have been applied in place. The corrected result has **9 library, 10 planned and 131 missing items**, eight unique routes and **13 confirmed source findings**. The six source routes are accepted. Both Part II routes are rejected for design intake until the recorded extraction and specification obligations are resolved.

## Main reasons for revision

The prior continuation labelled the extraction complete while deferring the primary/transitive supplier readings and declaration-sized decomposition. Several proof outlines explicitly say their named inputs remain unverified or should be extracted later. CTHK’s projection/separation/shrinking packages combine multiple nonroutine assertions; the general henselian Bruhat–Tits supplier still needs an ownership/scope decision. These are coverage obligations under PROTOCOL §§0, 2–4 and 16, not merely a lack of finished Lean proofs.

The 29 definitions/constructions have 87 API entries and 87 test outlines. Their presence is useful, but names such as `api1` and requests to expose unspecified maps do not constitute exact declarations. For example, the weighted-blowup base-change API must state its hypothesis, and the total-isotropy API must identify the base-change maps to which it applies. The three twisting signatures have been repaired; the remaining audit is explicit in `gap-api-precision`.

The extraction is therefore **partial**. Twenty-four formerly deferred records were reconsidered: mathematical obligations remain open, while the Lean-prototype record is resolved as outside this paper-review issue’s deliverables. The final-coverage record is reopened and the API-precision record added. There are 27 gap records, 25 open and two resolved. This is a finished review with a revision verdict, not an unfinished review checkpoint.

## In-place corrections

1. **Remark 3.3.** Added purity to the dimension-equality item. For X=P³_Q, the union of the plane x₃=0 and line x₀=x₁=0, with Z the line x₂=x₃=0, meets H: x₂ᴺ+x₃ᴺ=0 outside Z in finitely many points. The proposed equality would give dimension one. The Jacobian check shows H is smooth off Z, for every positive N. Lemma 3.2’s upper bound and its actual projection consumers remain usable.
2. **Lemma 6.3.** Added finite presentation to both presentation items and the geometry brief. Spec Q[[t]] with its closed point retained and empty Z disproves the literal statement without a finiteness condition. A quasi-finite map to A¹_Q would be of finite type; cardinality excludes it. The actual smooth affine-curve application has the repaired hypothesis.
3. **Orthogonal torsors.** The item `orthogonal-h1` still repeated the false all-inner-forms assertion despite E7. It now concerns SO_n-torsor twists. An independent real example is `(SL₂ × SL₁(H))/μ₂`: its Lie algebra has Killing signature (2,4), distinct from the signatures of every rank-four SO(p,q). The main twisting argument only needs pure inner forms.
4. **Twisting base point.** The bijection H¹(^E G)→H¹(G) is pointed at [E] on its target, not at the usual neutral class. The item and its three API signatures now state this precisely.
5. **Local loop lifts.** Replaced the unjustified localization-injectivity proof. After spreading a pointed map Aᵈ→G over R_g, scale to lift its nonconstant coefficients into gR. Its finitely many equation coefficients are killed by a common g-power; a further variable scaling kills all equations over R. Coefficientwise Laurent lifts then realize the selected residue point and are the identity at every other maximal ideal. No nonzerodivisor assumption survives in the proof.
6. **Whitehead congruence and locators.** Gil09 p.54 uses conjugated unipotent tangent directions and henselian étale lifting, not the asserted big-cell proof. Gil02 3.7 and CTHK97 3.2.2 are theorems; their locators are corrected.
7. **Existing Picard theorem.** Moved semilocal Picard vanishing from missing to library and removed it from route 2. Its finite-flat rank-one theorem and the existing semilocal Picard instance were read at the exact pin. `IsRegular` is now explicitly comparison-only; `IsWeaklyRegular` is the library notion matching the paper.
8. **CTHK proof details.** Corrected the bad-locus ambient dimension, the residue-coordinate surjectivity statement, and the locus on which étaleness is needed. These feed directly into the geometric-presentation supplier items.

## Source findings

Every E1–E13 entry has an independent `confirmed` verdict and a mathematical reason. Four have known corrections: E1, the author’s post-publication footnote; E2, Gille’s 2005 erratum; E3, his 2026 consolidated errata; E4, the later Česnavičius survey’s semilocal-isotropy footnotes. E5–E7 were already recorded but are freshly checked. E8–E13 were found in this review.

The three CTHK checks are particularly small:

- E11: for linear maps A²→A², the determinant-zero locus has dimension 3 in a 4-dimensional parameter space, contradicting the misprinted comparison with dimension 2.
- E12: with X=A¹, Z={0} and the identity projection, the printed residue map is k[u]→k. It is surjective, not an isomorphism; Nakayama needs surjectivity.
- E13: with φ(x)=x(x−1)² and T={0}, φ is étale at T but its fiber also has a double point at 1. The proof needs étaleness only along the section. A graph embedding makes this φ a permitted linear projection.

These findings are certified for the author-hosted CTHK97 version; a separate scan of the printed 1997 volume was not compared. The current author PDF, Kahn’s publication entry, Colliot-Thélène’s list, and targeted correction searches were checked. No correction was located. For the main paper the reviewer checked arXiv’s version history, the current author PDF, the Cambridge article/PDF and targeted erratum/statement searches. These bounded searches do not claim knowledge of unpublished corrections.

## Library and ownership audit

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Ten source files containing the cited declarations were read and their blobs checked against the pinned repository trees. The original eight library statuses survive. Semilocal Picard vanishing is the recovered ninth baseline item; its scheme-H¹ comparison remains a separate interface.

The missing-item audit used independent semantic search families and item-specific patterns across both complete cached Lean trees, then compared candidate scopes against the atlas. Searches included regularity/semilocal algebra, weighted projections/Bertini, curve presentation, torsor descent, supported cohomology, étale components, formal gluing, relative groups, projective-line classification, GS, orthogonal forms and Whitehead/Bruhat–Tits theory. Per-item `reviewAudit` entries explain the exclusions. The initial 132 missing items were all searched; 131 remain after the Picard correction. A negative text search is supporting evidence, not a proof of logical nonderivability.

All cited planned layers and source layers were read, together with the reviewed SF.0/SF.1/SF.2/SF.4, R03.3 and LPV.3 audit entries. Upstream relative-group foundations, StableReduction’s relative Proj/coherent-curve theory and RG2.0a’s affine Weil restriction remain imports. Field reductive predicates do not supply general-base torsors. Fargues–Fontaine patching and semiglobal flag results have distinct hypotheses; they do not cover the semilocal contracts here.

| Route | Verdict | Reason |
| --- | --- | --- |
| 1, SF.0 | Accept | Four general scheme/regular-map/component/affine-target source contracts fit the existing foundation owner. |
| 2, SF.1 | Accept | Fifteen descent/purity/patching contracts fit after removing the existing Picard result. |
| 3, SF.2 | Accept | Five supported/coherent/multiplicative-type cohomology contracts retain the existing sheaf-cohomology carrier and upstream curve imports. |
| 4, SF.4 | Accept | The arbitrary-base formal torsor-gluing contract belongs with the foundation’s formal geometry; specialized RF4/GS0 constructions require compatibility. |
| 5, R03.3 | Accept | Regular-local factoriality and the corrected CM flatness interface extend the existing algebra owner. |
| 6, RG2.0a | Accept | Existing affine Weil restriction is the single owner; its Shapiro interface is sourced here. |
| 7, arithmetic presentation Part II | Reject | Direction justified, but admitted supplier decomposition and exact API work remain. Corrected brief includes E8/E10–E13. |
| 8, GS Part II | Reject | Direction justified, but source chains and the general henselian building-scope request remain unresolved. Corrected local-loop and orthogonal arguments do not discharge them. |

Accepted source routes supply mathematical contracts and references to their existing owners. They do not certify closed implementation packets. Rejected Part II routes must not launch their design jobs from this incomplete extraction.

## Reading record and validation

Fresh reading comprised all 32 pages of the [main author PDF](https://www.imo.universite-paris-saclay.fr/~kestutis.cesnavicius/split-unramified.pdf); the relevant published passages; [CTHK97](https://webusers.imj-prg.fr/~bruno.kahn/preprints/bo.pdf) §3, pp.13–19; Gil02 pp.231,236–239 as images; all three pages of [Gil05](https://math.univ-lyon1.fr/~gille/publis/erratum05.pdf); Gil09 p.54; [Gille’s consolidated errata](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf) p.4; [Guo v3](https://arxiv.org/abs/1902.02315v3) p.7; and the [later survey](https://arxiv.org/abs/2201.06424v4) p.26. Prior workers’ broader supplier readings are retained with attribution and are not counted as this reviewer’s fresh readings.

Validation: `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CESNAVICIUS-22.result.json` passes. Custom audits check unique item IDs, the dependency DAG, one route per missing item, library/planned references, the 29 API/test lists, all 13 source verdicts, and the four authorized paths. Publication guards compare the current atlas/roadmap inputs and original deliverable blobs before creating the submission. No Lean deliverable was requested or compiled.

To resume the extraction, first close the geometric supplier decomposition and replace placeholder API contracts; then address the named GS supplier chains and the Bruhat–Tits scope request. Do not promote the status merely because the JSON checker passes. The corrected JSON and paper report are the authoritative handoff; this review’s mathematical verdict is complete.
