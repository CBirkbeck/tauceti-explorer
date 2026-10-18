# DESIGN-ArcTopologyAndDescent — #3364

Codex, session codex-baHqfB; 18 October 2026. This is the completed target-level design pass, for independent review, not an implementation or a package acceptance. The claim was confirmed by the bot before work began. No second job was claimed.

## Delivered and coverage

The roadmap definition, packet, reader document and suggested Lean file cover AT.0–AT.12. There are 95 targets: 16 definitions, 7 constructions and 72 theorems, with 98 API items, 79 discriminating unit tests, 59 planets and 19 pinned baseline declarations. Every definition/construction has recorded uses, an API and at least three checks. The reader includes every target, API item and check, precise dependencies and sources, and thirteen worked examples. All six paper routes are accounted for: 177 routed items point to an owned target, an exact imported node or the recorded supplier gap.

Every stage AT.0, AT.1, AT.2, AT.3, AT.4, AT.5, AT.6, AT.7, AT.8, AT.9, AT.10, AT.11 and AT.12 is **planned**, none closed. The packet is `complete` under the issue's target-pass stopping rule. All `implementationStatus` values remain `unchecked`. The remaining lists identify supplier contracts; AT.7 also identifies the Tannaka registration gap below. No target is claimed formalised.

## What remains

The one explicit gap is the registration and verification of the qcqs algebraic-space Perf-Tannaka input used by the algebraic-space Hom/effective-epimorphism target in AT.7. BM21 Theorem 5.17, p. 45, invokes Bhatt, *Algebraization and Tannaka duality* (2016), Theorem 1.5. The routed SchemeAndStackFoundationsPartIIAlgebraicSpaceTannaka has no registered supplier stage/node in this checkout. Register its exact hypothesis-correct contract and replace the gap with that citation; do not treat SF.1 as already containing it. The primary Tannaka paper was not read in this run, and the gap explicitly requires checking it. AT.12 formal-target representable descent has a separate proof and does not use this input.

Nine open supplier contracts are recorded with exact requested mathematics and consumers:

- SchemeAndStackFoundations SF.0: remaining valuation/ring and nonnoetherian formal-scheme interfaces.
- SF.1: fppf and étale-object/algebraic-space descent.
- SF.2: torsion étale continuity, strict henselization, proper base change, support/localization, valuation base change, coherent topoi, and the characteristic-primary Artin–Schreier vanishing input.
- SF.4: Rydh refinement/approximation, compactification, quasi-finite maps and characteristic-zero valuation uniformization/ind-smoothness.
- DiamondsAndVStacks D0: ordinary spectral and Stone–Čech/ultrafilter interfaces and valuative specialization lifting.
- EtaleDualityAndPerverseSheaves EDC.0: extend its noetherian invertible-coefficient contract to bounded constructible complexes on qcqs schemes with arbitrary finite coefficients; finite Tor dimension is not imposed.
- GeneralAlgebraicKTheory K.5: arbitrary-ring Milnor/excision data, without assuming K-excision.
- AdicEtaleGeometry A1: algebraic/adic cohomology comparison with the stated analytic hypotheses, including the perfectoid generic-fibre comparison.
- PerfectoidSpaces P3: extend the existing principal nonzerodivisor approximation to bounded parameter torsion and noetherian multi-ideal punctured spectra.

Two additional request records have status `supplied`: the existing TauCetiRoadmap.AdicSpaces topological-algebra and continuous-valuation layers. They request no new work. The three `restructure` proposals put the needed extensions in EtaleDualityAndPerverseSheaves, Part II; PerfectoidSpaces, Part II; and SchemeAndStackFoundations, Part II (coherent topoi). Independent review should check these contracts and the single gap before closing stages or packaging.

## Ownership and source corrections

Current TauCetiRoadmap, including the nine roadmaps newer than the atlas snapshot and its Completed directory, and the current Tau Ceti tree were searched. AdicSpaces and ModularCurves supplied the reader/signature models. The pinned baseline declaration statements were read, rather than merely inferred from names. No reviewed library-coverage entry for this new roadmap supplied an existing arc implementation.

The following existing targets were removed from local ownership: EnhancedDerivedSheaves E1's perfect valuation convex-decomposition triangle and E2's finite-inductive-level definition/theorem; GeneralAlgebraicKTheory K.6's support K-theory formal square; and PerfectoidSpaces P3's finite étale punctured approximation. E2 owns the forward h-blowup theorem; this roadmap plans the converse criterion. SchemeKTheoryOperations S.4 owns perfect-scheme h/v sites and perfect-complex v-hyperdescent. AdicSpacesPartII R0's completed tensors and affinoid Noether normalisation, and R1's affinoid dimension theorem, are imported by exact node. The pinned ordinary derived category, direct Frobenius perfection, adic completion and Łoś theorem are baseline inputs. No notion was moved down from a higher-tier roadmap.

Seven findings are recorded against the specifically read arXiv v4 of BM21, with the existing reviewed atlas fixes credited. They do not assert a published corrigendum or identical journal wording. The corrected prime-extension lemma retains kernel containment, distinguishes the least extended prime from the largest prime over it, and uses the latter for localization. The splitting proof treats the kernel-excluded case explicitly. Finite-chain étale objects have n+1 vertices and all natural transformations; injectivity constrains object transitions. Boolean sheaves preserve disjoint unions as products. The natural-transformation proof display ends in G(S). Rational-domain estimates use a maximum. Affinoid vanishing retains the proved all-torsion d+1 bound and residue-invertible d bound. The total-integral-closure proof uses only an elementwise nil kernel, not a uniform nilpotence exponent.

Additional regression checks include field/DVR extension tests; the rank-two arc/non-v split; failure of subcanonicity on dual numbers; the Z/4-module Z/2 distinguishing constructibility from finite Tor dimension; zero, unit and two-generator ideals in formal glueing; zero/unit parameter generic fibres; characteristic-p complete valuation tests; and the (X,1) maximum/minimum example. These are the author's consistency checks, not an independent review.

## Sources read

References and exact version-specific theorem/section/page locators are in the packet and reader; all result descriptions are in our own words. Read BM21 arXiv:1807.04725v4, pp. 1–64; BS17 arXiv:1507.06490v3, §2 pp. 4–10, §4 pp. 15–16, §6 pp. 21–22 and relevant §11 pp. 39, 45–47; BS22 arXiv:1905.08229v4, §8.2 pp. 67–69 and the proof of Theorem 9.1 pp. 71–73; CS24 arXiv:1912.10932v3, §2.2 pp. 18–22, Lemma 3.1.2 p. 30 and Lemma 4.2.6 pp. 41–42; GR24 arXiv:2203.09490v3, Theorem 6.1 proof pp. 55–56; CMM21 arXiv:1803.10897v2, Theorem 6.3 proof p. 51; Mathew arXiv:1912.10968v3, Definition 5.17, Remark 5.18 and Theorem 5.19 pp. 19–22; Bouthier–Česnavičius arXiv:1908.07480v4, Theorem 2.3.4 and Corollary 2.3.5 pp. 29–31; and Stacks §59.82, culminating in Theorem 59.82.7, tag 09ZI.

The maintainer-cleared Huber (1996) copy was read at Corollary 3.2.2, printed p. 174, and Corollary 4.2.7, printed pp. 244–245. The latter supplies the valuation base-change input with invertible torsion orders. Gabber–Ramero (2003), Proposition 5.4.54, printed pp. 126–127, was checked as the existing P3 principal approximation proof. Neither book nor passages were copied. The only missing primary-source verification is the Tannaka input explicitly retained as a gap.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArcTopologyAndDescent.json --index <shared pinned declaration index>`: 0 errors, 0 warnings.
- The local target graph is acyclic and every internal inter-layer dependency points to an earlier layer; routed-item targets resolve. Reader target/API/check coverage and the six-planet limit were checked.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ArcTopologyAndDescent.lean`: passed.
- `lean-check` on the suggested file: elaborated successfully, exit 0, with only 25 declaration-uses-`sorry` warnings. The file has five real-bodied light predicates, fifteen theorem signatures and ten examples. Heavy sites, topoi, enhanced categories and perfectoid constructions remain fully specified reader targets. Memory availability was checked before compilation; no language server or build was started.
- Submission-file validation is run on exactly the five deliverables before commit.

Next action: independently review this complete design, checking source repairs, supplier sufficiency and the Tannaka registration gap. No second job or upstream package is part of this submission. Scratch sources and authoring scripts are deleted once the pull request is open; everything needed to continue is in these five files.
