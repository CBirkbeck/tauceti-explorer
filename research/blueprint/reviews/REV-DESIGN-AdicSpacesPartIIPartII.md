# Independent review: AdicSpacesPartIIPartII

Job `REV-DESIGN-AdicSpacesPartIIPartII`, issue #3487. Reviewer: Codex, session `codex-otRdSZ`, 19 October 2026. The design was written by a different worker (Claude, session `claude-3eNeGN`).

## Verdict and extent

**Accepted as a completed target-level planning pass, with explicit proof boundaries.** This is not a closed development or an implementation claim. All seven stages have target nodes. Under PROTOCOL §0 a planned stage may have prerequisite chains ending in recorded gaps; none is marked closed. Four proof/source gaps and three precise supplier requests remain visible in both the packet and reader.

The original packet had 42 nodes, 111 API items, 69 unit tests, 18 planets and 46 baseline declarations. The corrected packet has **43 nodes: 8 definitions, 7 constructions, 27 theorems and 1 lemma; 110 API items; 70 unit tests; 18 planets; 45 baseline declarations**. All 15 definitions/constructions have at least three tests and a usable API. The review matrix contains 12 verified nodes, 30 corrected nodes and one added, justified theorem; no node is marked unverifiable. These verdicts concern the stated target and its honest dependency boundary, not completion of an unread proof.

## Sources actually inspected

- Howe–Klevdal II, [arXiv:2308.11064v2](https://arxiv.org/pdf/2308.11064v2): the Zariski conventions on p. 5, Definition 2.2.1 and Remark 2.2.2 on pp. 15–16, the resolution application on p. 35, and the proofs on pp. 56–60. All HK2 locators refer to this version, not the differently numbered published article.
- Conrad, [Irreducible components of rigid spaces, author copy](https://virtualmath1.stanford.edu/~conrad/papers/irredpaper.pdf): notation p. 2, excellence and normality pp. 3–9, normalization and components pp. 9–17, and the regular/smooth comparison pp. 20–22. The suspect local/global-component assertion was also checked in the [published article](https://aif.centre-mersenne.org/item/10.5802/aif.1681.pdf), p. 496.
- Bhatt–Hansen, [arXiv:2101.09759v2](https://arxiv.org/pdf/2101.09759v2): Definition 1.2, p. 2; §2.1, pp. 6–8; Lemma 2.16, pp. 9–10. The reduction/localization misprint was checked in the typeset PDF.
- Temkin, [arXiv:0904.1592v2](https://arxiv.org/pdf/0904.1592v2): Theorem 1.2.1 and Remark 1.2.2, pp. 2–3; blow-up sequences and functoriality, pp. 10–14; the analytic transport and hypersequence arguments, pp. 31–34. §§3–4 and the original Bierstone–Milman functoriality proofs remain the explicitly recorded G3 boundary.
- Schneider, [p-Adic Lie Groups](https://doi.org/10.1007/978-3-642-21147-8), maintainer-cleared copy read in place: Corollaries 5.7–5.8 and Proposition 5.9 with proof, pp. 33–37; Proposition 6.4, p. 42; charts, atlases and manifold conventions, pp. 45–50; tangent spaces and Proposition 9.3, pp. 56–59. No book files or passages were copied. Serre’s book was not read; its locator is identified only as a secondary citation in HK2.
- Added Conrad, [Moishezon spaces in rigid geometry](https://virtualmath1.stanford.edu/~conrad/papers/moish.pdf), author version dated 1 August 2010: Theorem 2.1.1 and Lemma 2.1.3 with proof, pp. 4–5.
- Added Poineau, [Les espaces de Berkovich sont angéliques](https://www.numdam.org/article/BSMF_2013__141_2_267_0.pdf), §4: Definition 4.1 and Lemma 4.4, pp. 283–284; Remark 4.14 and Corollaries 4.15–4.18 with proofs, pp. 287–288. This closes the original G2 reading gap.

The packet records version URLs, hashes where available, and precise inspected locations. Source descriptions and results are paraphrased; there are no verbatim excerpts or section-by-section source summaries.

## Corrections by target

- **`RZ.0/zariski-closed-subset`:** Replaced flatness alone by reduced affinoid localization; removed the unsupported boundary-point count in the negative control.
- **`RZ.0/local-dimension`:** Replaced a forward reference to global irreducible components by the finite minimal-prime decomposition of an affinoid ring.
- **`RZ.0/nowhere-dense-criteria`:** Used finite affinoid minimal primes and dimension drop, rather than semicontinuity and density alone.
- **`RZ.0/affinoid-localization-regular`:** Moved the regularity input before normalization and singular loci; retained the characteristic-zero result and explicitly requested its all-characteristic extension.
- **`RZ.1/rigid-normalization`:** Made all-characteristic excellence explicit and distinguished normalization over X_red from a map to a nonreduced X.
- **`RZ.1/connected-components`:** Matched Mathlib connectedness, including the nonempty condition and the empty-space tests.
- **`RZ.1/irreducible-components`:** Removed a false local/global branch claim in the cited source; retained a nodal counterexample and supplied Conrad’s corrected local formulation.
- **`RZ.1/full-dimensional-closed-subset`:** Replaced the incomplete full-dimensional-neighbourhood argument by the established nowhere-density/local-dimension criterion.
- **`RZ.1/dense-open-connected`:** Replaced the invalid connected-base-change proof by extension of idempotents over the original field.
- **`RZ.2/singular-locus`:** Supplied the earlier regularity input and exposed the all-characteristic excellence request.
- **`RZ.2/smooth-iff-regular`:** Qualified the assertion about completed local rings under étale maps.
- **`RZ.2/rank-loci`:** Distinguished cotangent-fibre rank from absolute local-ring tangent spaces at inseparable classical points.
- **`RZ.3/classical-point`:** Distinguished the analytic residue field from its completion and recorded that they agree at classical points.
- **`RZ.3/classical-points-dense`:** Removed the unsupported stronger constructible-density claim and its nonexistent supplier; kept the density used by the consumers.
- **`RZ.3/polydisc-points-topology`:** Removed a forward reference to RZ.6 from this topological lemma and made the ultrametric continuity argument explicit.
- **`RZ.3/gauss-point-in-closure`:** Recorded reuse of the existing current-library Gauss point while retaining the new multivariable closure theorem.
- **`RZ.4/specialisation-map`:** Corrected the ill-typed naturality square.
- **`RZ.4/shilov-point-characterisation`:** Corrected the source’s reduction/localization typo; the valuation ring is formed before reduction.
- **`RZ.4/weakly-shilov-point`:** Restricted the nonclassical-point negative control to positive local dimension and bounded the subdisc radii.
- **`RZ.4/abhyankar-bound`:** Proved the residue-transcendence bound by lifting independent residues instead of invoking an unlisted valuative Abhyankar inequality.
- **`RZ.4/weakly-shilov-transcendence-criterion`:** Read Poineau and replaced the unsupported shrinking and finite-extension argument by his strict Laurent-domain result.
- **`RZ.5/blow-up-sequence`:** Distinguished an empty-centre identity stage from a blow-up with empty total space.
- **`RZ.5/rigid-blow-up`:** Added the relative analytification supplier and qualified nowhere density of exceptional sets.
- **`RZ.5/functorial-desingularization-qe`:** Restored functoriality and the final desingularization step in Temkin’s nonreduced construction.
- **`RZ.5/rigid-resolution`:** Updated the earlier regularity prerequisite and distinguished the ground-field-extension proof input from mere flatness.
- **`RZ.6/constant-rank-theorem`:** Retained characteristic zero and constant rank on a neighbourhood; strengthened the suggested conclusion to centred charts and MapsTo.
- **`RZ.6/rigid-inverse-function-theorem`:** Corrected the inverse-series argument: the image of a polydisc under the inverse is a polydisc neighbourhood, not necessarily a round disc in the original coordinates.
- **`RZ.6/manifold-of-classical-points`:** Restricted scalar-restriction submanifold claims to finite field extensions and distinguished the general Mathlib atlas from Hausdorff manifolds.
- **`RZ.6/smooth-morphism-submersion`:** Replaced translation by a nonexistent F-rational lift of a quotient point by smoothness after faithfully flat extension and descent.
- **`RZ.6/subfield-identity-theorem`:** Removed the same-field preconnected-set identity theorem, which does not imply identity across a subfield.

The suggested Lean constant-rank theorem now requires centred charts, the entire source chart to map into the target chart, and the normal form throughout the source chart’s image. Its former implication could leave the normal-form assertion vacuous. The nowhere-density algebraic predicate now carries a Noetherian hypothesis for its topological interpretation. Removed the informational `#check`; the only diagnostics are admitted-proof warnings.

The new `RZ.1/riemann-extension` theorem is marked `addedBy` this review. Its exact arbitrary-field statement is in Conrad 2010, Theorem 2.1.1, p. 4. Its original proof remains G1. The old `RZ.5/affinoid-localization-regular` node moved to `RZ.0/affinoid-localization-regular`; all internal references, stage ownership, reader and suggested target list were updated.

## Baseline and supplier audit

Read the statements and surrounding hypotheses of **all 46 original baseline entries** at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All names exist. Removed `AnalyticOnNhd.eqOn_zero_of_preconnected_of_eventuallyEq_zero` from the prerequisites and baseline: it proves a same-field identity theorem on a preconnected ambient set and does not prove identity from a smaller subfield. The remaining 45 entries have source-module/line evidence and corrected conventions.

In particular: `Algebra.trdeg` is cardinal-valued; `ringKrullDim` takes values in `WithBot ℕ∞`; `Ideal.height` takes values in `ℕ∞`; `Module.finrank` needs finite-dimensionality for dimension arguments; `IsIntegrallyClosed` is not itself a domain hypothesis; `TangentSpace` is a manifold model fibre; `IsManifold` alone does not assert Hausdorffness. The Gauss norm definition alone supplies no multiplicativity, and the existing evaluation-point construction is not a general classical-point predicate. Completeness-to-Baire uses the inspected Mathlib instance by typeclass inference.

Read the parent supplier statements for the needed affinoid, stalk-completion, identity, differential, coherent-sheaf, proper-image and analytification inputs. The relative scheme pullback `AdicSpacesPartII:R1/scheme-fibre-product-analytification` is now explicit for blow-ups over an affinoid base. Reduced rational localization comes from the exact `R5/reduced-affinoid-rational-localisation` node. The parent’s excellence theorem is characteristic zero only: the broader target now has Q1/G4 instead of a false supplier claim. The component comparison under analytification is a later imported comparison, not an input to the component construction.

DiamondsAndVStacks D4’s surjectivity criterion explicitly requires quasicompactness; the resolution application retains it. D6 supplies the diamond functor, nilpotent insensitivity and comparisons. SchemeAndStackFoundations SF.0 supplies the excellence and regular-map framework. AlgebraicModuliForArithmeticGeometry R09.7’s variety resolution with local-isomorphism compatibility does not supply Temkin’s full regular-morphism functoriality or quasi-excellent-scheme theorem; these are theorem targets here with G3 and the existing rescope proposal.

Read the relevant reviewed audit entries `AdicCoefficientsAndComparisons:L5`, `ClassicalAdicEtaleCohomology:H0`, and `LocallyAnalyticDistributions:L0,L3`. There is no audit entry for this new roadmap. Existing scheme normalization, Rees algebra and polydisc points are distinguished from absent rigid-space normalization and resolution machinery.

The read-only current library at commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already constructs one-variable centred `gaussPoint`, with support and comparison lemmas in `Spa/Polydisc/GaussPoint.lean`; these are reused, not replanned. Current TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27` has no `RigidAnalyticGeometry` directory: removed that phantom supplier. DifferentialGeometry’s real smooth inverse-function material does not supply the nonarchimedean analytic result. ReductiveGroups Layer 3 has quotient representability but needs the explicitly requested smooth torsor statement. No upstream checkout was modified or built.

## Source issue verdicts

- **E1 — rejected:** The rational-neighbourhood argument is valid in the paper’s setting. Infinite residue field suffices; weakening an assumption and making this standard argument explicit does not establish a source gap.
- **E2 — confirmed:** HK2 p. 60 cites Definition 2.4 for weakly Shilov points; BH22 Definition 2.5, p. 7 is the matching definition.
- **E3 — rejected:** Connectedness is a valid standard consequence of a resolution being an isomorphism over a dense irreducible smooth open with dense inverse image. The packet’s former base-change proof was wrong, but no counterexample to the paper’s assertion or inadequate source proof is established.
- **E4 — rejected:** Taking a resolution of the reduction is the conventional interpretation needed here. The author supplies no example proving that the cited fibre product has a generically nonreduced component. Record reduction explicitly for the v-cover argument, without promoting a possible hypothesis issue into a verified paper error.
- **E5 — confirmed:** Checked the assertion in both copies and the nodal counterexample. Excluded the false assertion from the node’s source match.
- **E6 — confirmed:** The PDF shows the reduction symbol. Its inconsistency with t and with condition (3) identifies the misprint.

E5 has a concrete counterexample: the integral nodal cubic has globally irreducible analytification, while its analytic stalk at the node has two branches. Conrad 2010 Lemma 2.1.3 provides the correct local-neighbourhood formulation. E6 is limited to the inspected BH22 preprint: a reduction ring in which the pseudo-uniformizer vanishes cannot be the valuation ring described at that step. No uninspected erratum or source revision is claimed checked.

## Remaining work and questions for the orchestrator

1. **G1:** inspect Bartenwerfer’s original extension proof. The exact theorem is already sourced and owned here; no algebraic-closure connectedness argument remains.
2. **G3:** inspect/decompose the variety-functoriality and quasi-excellent-scheme proofs, including completed scalar-extension regularity for ground-field compatibility. Decide the proposed AlgebraicModuliForArithmeticGeometry Part II transfer; keep ownership here until a supplier actually exists.
3. **G4 / Q1:** extend the parent’s ordinary-affinoid excellence supplier to imperfect characteristic p, using the precise Kiehl/Conrad input. This is not a request for characteristic-p dagger excellence.
4. **G5 / Q2:** supply formal-model localization after admissible blow-up (the precise Bosch Theorem 8.4.3 input of BH22 Proposition 2.9). Independently inspect the Berkovich Proposition 2.4.4 proof used for the Banach Shilov-boundary comparison. Poineau’s residue-transcendence equivalence itself is now checked.
5. Supply the existing ReductiveGroups smooth quotient/torsor request for the orbit-map application. Field-extension lifts are used only to prove smoothness after faithfully flat extension, then descended; no lift in G(F) is assumed.
6. Point the future admissible-pairs roadmap at the two already proposed lower owners here: rigid analytic points and proper-image Zariski closedness. Clarify the parent’s component-comparison dependency after this component construction exists. No other roadmap was edited.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdicSpacesPartIIPartII.json`: **0 errors, 0 warnings**, using the supplied pinned declaration index.
- `lean-check research/blueprint/suggested/AdicSpacesPartIIPartII.lean`: **exit 0**, 14 `declaration uses sorry` warnings and no other diagnostics. Available memory exceeded 20 GB. The file contains no admitted data construction and remains a statement skeleton.
- Reader regenerated from all corrected target statements, hypotheses, proof sketches, direct prerequisites, API, tests, uses, Checks and source locators; no target or worked example was dropped.
- JSON validity, exact per-node review coverage, all 15 definition/construction test counts, file-scope checks and whitespace checks were also checked before submission.
