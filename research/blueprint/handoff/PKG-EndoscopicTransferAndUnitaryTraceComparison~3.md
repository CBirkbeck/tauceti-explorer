# Endoscopic transfer and unitary trace comparison: package revision 3

Job `PKG-EndoscopicTransferAndUnitaryTraceComparison~3`, issue #9872. Agent: Codex, session `codex-dRnBJn`, 15 October 2026. The claim was confirmed by bot comment 6183012173. This is a completed package revision for independent review, not an acceptance or a claim of formalization.

## What changed

Only the package README and this handoff change. Suggested.lean, metadata.toml, review.json, the accepted packets and the assembled reader are unchanged. The previous review's other corrections remain in place, including imported generic orbital integrals and pseudo-coefficients, the geometric/arithmetic LLC duality boundary, the normalized Jacquet half-modulus, coefficient limits, and native tower-action conventions.

The remaining finding concerned the additional structured CM realization in §8.14 and its use in §8.15. This revision separates two assertions and removes the circular proof dependency:

1. **Torus cancellation before PEL realization.** For a maximal torus in a polarized B-linear isogeny group and its commutant N, use any rational paired B,N comparison of the required geometric multiplicities. Its infinite invariant is the one determined by that comparison's positive complex structure. Changing comparison changes every local invariant, including the infinite one, by the localization of a single global torsor class. Their global sum is zero. One can therefore compute on a weak CM isogeny lift with its own CM type, without assuming that its Lie signature is the prescribed PEL signature. On that lift the prime-to-p terms vanish and the p and infinity terms are −μ₀ and μ₀. The README now gives this proof, the Morita step preserving the B-action, and the compatible positive-polarization construction.
2. **Structured realization with sufficient hypotheses.** `CMIsogenyLift.pelRealization` now starts with an existing point of the fixed unramified good-reduction PEL model of type A or C, and a maximal torus of its polarized isogeny group. Kisin–Madapusi Pera–Shin produces a CM special point for this torus. Its nonempty T-intertwining isogeny torsor gives a rational B,N-linear isogeny after forgetting polarization: invertible homomorphisms form a nonempty open subset of a rational vector space. Transport the special point's positive polarization. Its Betti space has the required real PEL signature and the resulting finite-place pairings. The signature comes from the special point's Hodge class, never from invariance under isogeny. No polarization-preserving rational isogeny is asserted; that stronger conclusion has an additional Hasse-principle restriction in the source.

The earlier arbitrary-N assertion is not retained under its old hypotheses. The worked example at the end of §8.14 explains the obstruction: p=3, F=Q(i), K=Q(√2), N=FK, and E:y²=x³−x. The isogeny diag(1,π) from E² with F-action (i,−i) to E² with scalar F-action transports the maximal N-action and a positive polarization, while the embeddingwise Lie signature changes from (1,1) to (2,0). The original object still has its integral unpolarized O_F identification with the signature-(1,1) Σ. A rational N-paired comparison of that real signature matching all finite primes away from 3 would require N_{K/Q}(a/u)<0 for a∈K× and totally positive u∈K×. This ratio is a norm from F at every finite prime, automatically also at 3 since K₃≅F₃, and a nonnorm at infinity. Quadratic norm reciprocity excludes it. Similitudes contribute squares and cannot change the obstruction. Crucially N is not Rosati-stable for the original PEL-compatible product polarization. An arbitrary maximal commutative algebra and an unpolarized integral p-divisible identification do not imply the new structured target's hypotheses.

This is a correction of an auxiliary assertion added during earlier package revisions, rather than deletion of an accepted packet target. The original polarized-realization, near-equivalence and effective-triple targets remain. In §8.15 the local/global embedding-with-involution argument first transfers T and N. Apply the torus cancellation to the prescribed comparison V, retaining its real correction. Apply it also to the initially unpolarized type realization and its centralizer to obtain the auxiliary α and β vanishing. Only then use the localization sequence and positive-cone argument to construct the polarization and correct the centralizer. The stronger structured lift is not an input to this initial PEL existence proof. New checks distinguish changing the real comparison, changing a positive polarization, and obtaining the signature from a special point.

## Sources and proof boundaries

The relevant proofs were read, not inferred from abstracts or theorem titles. Statements and calculations in the README are in our own words. No source passage or section-by-section source summary is added. Harris–Taylor is not cleared in the library index; no copy was fetched or used. The argument does not need its pp. 170–171.

- Tate, *Classes d'isogénie des variétés abéliennes sur un corps fini*, §3, Theorem 2, p. 102, and §§3–4, Lemmas 3–6, pp. 101–105: weak CM isogeny lift, algebraization and number-field descent, potential good reduction, slopes and Frobenius-power comparison. Finite residue and p-adic extensions are allowed. These results do not preserve a prescribed integral Lie module.
- Kottwitz, *Points on some Shimura varieties over finite fields*, §13, Lemmas 13.1–13.2, pp. 415–418: CM p/infinity calculation and independence under changing the paired comparison and positive polarization. The real localization term is essential. Section 14, pp. 419–422, especially Lemma 14.1 and proof, pp. 420–422: CM commutant, its splitting property, and transfer of an embedding with involution. In particular this transfer does not first require the cancellation conclusion. The existing positive-cone and twisting arguments retain their Lemma 9.2 and Lemmas 17.1–17.2 locators.
- Kisin–Madapusi Pera–Shin, *Honda–Tate theory for Shimura varieties*, public 41-page author version: §2.3 read in full, with the supporting torus-transfer and cocharacter results consulted. Proposition 2.3.11, pp. 33–34, constructs a special point of the prescribed Hodge class; Lemma 2.3.13, pp. 34–35, gives the T-torsor; Corollary 2.3.15 and Remark 2.3.16(3), p. 36, give the type-A/C lifting result and explain forgetting polarization. The first conclusion has no p>2 restriction. This revision uses it only in the fixed good-reduction PEL setting.
- Shin, *Counting points on Igusa varieties*, §§11–12, pp. 35–41, read with the PEL and PIC hypotheses: Lemma 12.1 supplies the transferred torus/commutant and comparison changes; Corollary 12.2, p. 39, covers the initially unpolarized realization; Lemma 12.3, pp. 39–41, performs the global H¹ and centralizer corrections. The free-comparison cancellation above replaces the unnecessary stronger lifting input in this proof route.

Public retrieval receipts, accessed 2026-10-15 (hashes identify versions; these are not copied source texts):

| Source | SHA-256 |
| --- | --- |
| [Tate Honda exposition](https://numdam.org/item/SB_1968-1969__11__95_0.pdf) | `a23d9cd18c2ccc155285428ca02f284bc546711c9eb9fe43555dd020fdd328f3` |
| [Kottwitz Points](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf) | `ae2f2f148d791b6cc1d79d360868182c9abd2e0e5954d5c96df2d94b98570d2b` |
| [Kisin–Madapusi Pera–Shin](https://math.berkeley.edu/~swshin/HT.pdf) | `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db` |
| [Shin Igusa](https://math.berkeley.edu/~swshin/IgusaVar.pdf) | `022defdc0ebd913cdfd96d6c37b0f583dc9dc73716c23d1577c18035ff74eff8` |

## Ownership and shape

Current upstream checks use TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the elaboration pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The ReductiveGroups and RepresentationTheory.SemisimpleAlgebras READMEs were read as upstream form models. The reviewed library-coverage file has no entry for this roadmap; the relevant AbelianSchemesAndArithmeticModuli audit was read, with its older negative Tate-module status checked against the actual current carrier. Searches of the current library and the nine newer roadmaps/four named Completed roadmaps did not supply the particular CM cancellation or structured realization target. No Lake command ran in the read-only checkouts.

The new explicit suppliers are lower-tier inputs: AbelianSchemesAndArithmeticModuli A4 for realizations (in addition to existing A5 and A6), PELModuli M4 for CM reciprocity and canonical models (in addition to M2), and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.25 for rational crystalline comparison, including p=2 and its dual-Tate convention. Their relevant statements and interfaces were read. Existing local §7.4 supplies the structured Dieudonné comparison. Generic CM reciprocity, canonical models, Riemann forms, positive cones and crystalline comparison are imported; only the realization/cancellation instances are planned here. The Layer 8 dependency summary is updated as well. No target moves upward or duplicates these supplier theories.

The README retains all 211 numbered sections, the topics of all 210 accepted nodes, the existing API names and all 271 named checks (268 distinct). The packet API inventory has 420 entries: the previous review's 416 local/specialized interfaces and four imported generic aliases remain at their established ownership boundary. The explicit local Needs graph has 211 vertices and 711 distinct edges, no unresolved local section, no cycle and no later-layer input. Qualified external section numbers are excluded from this graph. The one new local edge is §8.14→§7.4. This syntactic audit supplements the proof-dependency check above; it does not prove the mathematics.

Suggested.lean remains 311 lines, with ten light real-bodied definitions. No heavy CM/moduli carrier is faked to state the new target; these belong in the README under the fixed shape rules. Metadata remains `topic = "math.NT"`.

## Verification and unchanged packet discrepancy

- `lean-check research/blueprint/packages/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean`: exit 0; sixteen warnings, all `declaration uses sorry`; no errors or other warnings. Available memory before elaboration was 99 GB. No language server, Lake build/update/cache command or background compilation was started. The Lean file is unchanged after the check.
- `python3 scripts/check_blueprint.py` on ET.0, ET.4, ET.5 and ET.6: respectively 61, 34, 32 and 33 nodes, each with zero errors and warnings.
- ET.6a: **26 pre-existing unresolved-prerequisite errors, zero warnings**, from the same fourteen obsolete names documented by the preceding revision. This is outside the permitted packet-edit scope; no passing result is claimed and no packet is patched. The mathematical supplier reconciliation remains:

| Obsolete suffix | Current supplier / package location |
| --- | --- |
| ET.5/acceptable-test-functions | acceptable-functions-with-geometry, §8.1 |
| ET.5/igusa-endoscopic-test-function | p-test-function, §8.19 |
| ET.5/transfer-at-p | acceptable-levi-pushforward, transfer-factor-constant, p-test-function; §§8.9, 8.18, 8.19 |
| ET.5/jb-endoscopic-levi-data | effective-levi-endoscopy, §8.8 |
| ET.5/acceptable-functions-determine | central-shift-character-separation, §8.11 |
| ET.5/unitary-igusa-trace-formula | unitary-stable-specialization, §8.22 |
| ET.6/llc-characterizing-properties | functorial-weil-parameter and full-wd-correspondence, §§10.20, 10.30 |
| ET.6/full-wd-local-langlands | full-wd-parameter and full-wd-correspondence, §§10.26, 10.30 |
| ET.6/local-jacquet-langlands | esi-jacquet-langlands, §10.3 |
| ET.6/segment-wd-parameter | segment-wd-adapter and special-block-factor-formulas, §§10.23, 10.25 |
| ET.6/drinfeld-level-deformation-spaces | drinfeld-deformation-instance, §10.2 |
| ET.6/semisimple-langlands-parameter | semisimple-trace-parameter, §10.18 |
| ET.6/badulescu-langlands-jacquet-map | additive-langlands-jacquet and jacquet-induction-quotient, §§10.6, 10.10 |
| ET.6/zelevinsky-classification | Existing SmoothRepresentationsOfLocalGroups SR.5.3; no duplicate target |

- `python3 research/blueprint/intake.py check-files` on the four authorized deliverables: zero problems.
- `git diff --check`: clean. Only README.md and this handoff are changed.

No package implementation work remains in this run. Resume at independent package review, concentrating on the exact torus-comparison orientation and its infinite term, the Morita CM computation, the worked norm obstruction, and the distinction between an existing PEL point and initial polarized realization. In particular review the replacement proof route rather than treating the old stronger auxiliary assertion as unchanged. The packet-name discrepancy needs separate authorization. This handoff is self-contained; the job scratch directory is removed after submission.
