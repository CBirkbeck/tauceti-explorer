# Handoff: REV-ArithmeticGaloisRepresentations--R01.5

Completed independent review for [#7950](https://github.com/CBirkbeck/tauceti-explorer/issues/7950), Codex session `codex-ryNkhU`, 2026-10-09. The author was the different session `codex-AMR33J`, PR #8109. Verdict: **accepted**; packet complete as a planning pass, R01.5 planned with bounded gaps, not closed.

Deliverables are the part packet, reader and suggested Lean file, plus the review report. The packet has 23 reviewed nodes (19 verified, four corrected), 51 verified baseline declarations, 15 API items, 12 named tests, 53 accepted-parent imports, three gaps and six requests. No new nodes, deleted nodes, duplicated source issues or edits to the accepted parent. The report records the source checks, every correction and per-node reasoning.

Validation: blueprint checker zero errors/warnings; final lean-check exits zero with 44 sorry warnings and no other warnings. The suggested file imports the pinned kernel module, exposes the image-algebra universal property and index conjugacy API, and strengthens the quaternion examples to require the algebra identification and real dimension. All names/tests and the 53 retained reader IDs pass parity checks. These are prototype declarations, not formalized proofs.

Assembly must retain every parent principal ID and apply `principalRefinement` and `prerequisiteRefinements`; merge the part's definitions/APIs/tests without duplicating the retained signatures. Preserve the five parent planets plus Trace field, for six assembled planets.

Remaining mathematical work:

- The nonarchimedean analytic chart/Haar comparison is shared with DeligneWeightsAndPurity:DWP.3. It concerns the compact-algebraic-subgroup extension of the polynomial Frobenius zero-locus application, including GSp₄. It does not block the abstract Chebotarev bound or the accepted open-GLₙ polynomial theorem. Nonvanishing must be checked on every component met by the compact group.
- The Sp₄ target still needs finite-coefficient/logarithm, minuscule-weight and finite-component inputs. Nekovář Proposition 3.10 case (3) requires a=r=1; it gives global semisimplicity and open-subgroup isotypy. BLR is a separate rank-two theorem and cannot close the rank-four argument.
- The induced/Asai targets still need algebraic Goursat, char-zero unipotent/reductive input, specialized SL₂×SL₂ quotient representation classification, O₄/SO₄ closure, and the nonsplit extension's degree-five witness. Generic missing exports belong in ReductiveGroups Part II. Representation-specific Asai inputs remain here/G7.
- Move the Ext¹ restriction/induction comparison into this lower-tier direction. ArithmeticGaloisDuality must import it; do not introduce the upward citation.
- The generic reduced characteristic polynomial/reduced norm API is SemisimpleAlgebras Part II work. The current layer 4 does not state it. This part supplies only the attached matrix coefficient descent, while the baseline already supplies central-simple structure, index and splitting.

The six exact requests remain Dirichlet/natural Chebotarev, density calculus, semisimple blocks, function-field Chebotarev with the constant-field degree congruence, and étale π₁/Frobenius/lisse interfaces. Original Carayol 1994 theorem attribution and the published Chenevier/Kisin–Zhou comparisons remain source/version tasks. E501 and E502 are inherited and independently reconfirmed at their recorded public versions, with no claim about unread published wording.

Current upstream was checked read-only: TauCetiRoadmap `94ff6a17fb5f138baeac6cd961cd5c21e40f6696`, current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer roadmap directions and current library did not supply matching attached-representation targets. Existing IHG reconstruction/coefficient descent and SemisimpleAlgebras/density work remain imports. Sources and pinned declaration evidence are recorded in the packet/report; no continuation depends on scratch files.
