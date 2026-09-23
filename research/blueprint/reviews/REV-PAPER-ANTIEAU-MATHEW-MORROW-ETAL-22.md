# Independent review of PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22

**Verdict: revise.** Completed by Codex — codex-c83e7a for [issue #1313](https://github.com/CBirkbeck/tauceti-explorer/issues/1313). The reviewer did not author the original extraction (Claude Code — cc-7b31c4). Claim comment 5801298161 was confirmed by bot reply 5801300184; the issue was reread after confirmation.

The review checks all 137 original items and adds 13 needed statements or library distinctions. It corrects the extraction in place and changes its completeness claim to **partial**. The corrected 150 items comprise 3 library, 34 planned and 113 missing; each missing item is routed once. There are 67 recorded item-field/addition changes, plus the explicit ownership, prerequisite, source-issue and review metadata changes. This is a finished independent review with a revision verdict.

## Reading and evidence

All 65 pages of [arXiv v2](https://arxiv.org/pdf/2003.12541v2) were read, including every proof, Appendix A on twisted diagonals, Appendix B on left Kan extension and the bibliography. The corrected passages were compared with the [100-page published reprint](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/AMMN22.pdf), including page images for the delicate signs, indices and diagrams. A full second reading of the published version is not claimed. Supporting primary passages were Bhatt12 pp.32–33, SZ18 pp.32–36 and BEK14 author final pp.1–3; see the extraction’s source-reading ledger for URLs and hashes.

The reviewer searched both full pinned Lean trees, all 2,007 atlas stage descriptions at the acquisition snapshot, and the cached blueprint/decomposition corpus using semantic families plus an individual name search for every original item. The 13 additions were then searched independently by name and assigned the relevant semantic evidence. Broad family hits were inspected for the relevant declarations or competing owners; a search hit was never treated as an implementation certificate. The exact statements and Git blob hashes of ten pinned Lean files were checked.

All 22 originally cited planned stages were read, together with the additional proposed source owners, their relevant reviewed library-coverage entries and the existing fine derived de Rham nodes. Several recently restructured layers have no completed library audit; this absence is recorded as a limit, not interpreted as proof that their mathematics is missing from the libraries. Searches explicitly distinguish the existing one-categorical and algebraic carriers from the needed enhanced comparisons.

## Why revision is required

The extraction originally declared completion while packaging nonroutine foundations and external results into broad source items without complete declaration-level APIs or transitive proof closure. Four corrected contracts now specify meaningful maps, hypotheses and tests, but the other definitions/constructions still need that work. The fine dependency requests must distinguish uniform denominator bounds, homotopy versus ordinary limits, Hodge versus p-adic completion, and derived Frobenius fibres versus ordinary fixed points.

The proposed deformation Part II also duplicated generic de Rham/conjecture/characteristic-class directions. Formal de Rham and proper-smooth degeneration import DD/CP; the conjectural proposition belongs in MC.7; the generic Chern construction imports S.7 and its crystalline specialization belongs to CR.4. The remaining deformation direction is appropriate, but its brief needs exact targets and a declaration-sized proof DAG before design intake.

The period route retains the source’s arbitrary-perfectoid theorem as an unresolved target. R=F_p disproves its displayed integral derived de Rham identification. The O_C application avoids this defect, but accepting the mixed route as written would conceal the missing torsion reduction. Route 6 is therefore rejected. This does not assert that the general theorem itself is false.

## Source findings

Every original finding was rechecked and has a review verdict. E1 is rejected. E2–E19 are independently confirmed; E17–E18 concern the explicitly identified Bhatt preprint, not an asserted journal version. Findings classified as misprints do not invalidate the surrounding theorem unless their stated reach says otherwise.

| ID | Finding and independent check |
| --- | --- |
| E1 | **Rejected:** the claimed shortened HC range cancels divided powers incorrectly. The universal truncated PD presentation gives W(k)/p^p at the disputed endpoint. |
| E2 | Extra opening parenthesis in the relative HC display; published p.3780 retains it. |
| E3 | Theorem E’s input degree j must remain j in continuous K-theory, rather than switching to i. |
| E4 | The crystalline trace is β∘tr: the printed reverse composition is ill-typed. |
| E5 | The Cartier-module argument needs Vg−gV. Taking h=g=id, F=id, V=p disproves the printed kernel claim with gF. |
| E6 | Graded Day convolution uses addition. Multiplication gives degree d^p rather than pd and the wrong unit degree. |
| E7 | A grading truncation retains X_j in degree j≤i, not repeated copies of X_i. |
| E8 | The finite cyclotomic-truncation clause needs p-torsion-freeness. R=F_p, p≥3 has zero relative HH but a nonzero degree-zero first term; the unrestricted quasi-isogeny statement is separate. |
| E9 | ch(L)=exp(c₁(L)); on P² the degree-four term is c₁²/2 and cannot be discarded. |
| E10 | The Nygaard connectivity claim is in D(Z_p), not generally D(R). For R=F_p, Δ̂_R=Z_p has no such F_p-module structure. |
| E11 | Restore [2i] in Corollary H/6.23. The R=Z_p positive-weight calculation detects the missing homotopy degrees. |
| E12 | φ/p^i−1 reduces to minus the inclusion on the deeper filtration. Surjectivity is unaffected. |
| E13 | Derived p-completed K₁ is not the ordinary tensor product F×⊗Z_p. Already a principal-unit Z_p summand for Q_p exposes the difference. Keep the Milnor/completion justification in the general perfect-residue case. |
| E14 | A_crys(R/p)=LΩ_R cannot be used for every perfectoid R: Bhatt’s explicit R=F_p computation has additional completed PD torsion. Restrict the integral comparison and supply the missing general reduction. |
| E15 | Correct the domain category in Appendix A’s general construction and the spaces/spectra type in its unstable example. |
| E16 | Correct precomposition’s bound variable, base ring and functor-domain directions in Appendix B. |
| E17 | Bhatt’s proposed non-torsion example is killed by p. Coordinates p^⌊n/2⌋ modulo p^n instead give a convergent element of unbounded order. |
| E18 | Bhatt’s perfect-residue-algebra conclusion requires W(A₀), not Witt vectors of its already lifted algebra A. The adjacent proof uses W(A₀). |
| E19 | The introduction misreports BEK’s dimension range. BEK Theorem 1.3 assumes p>d+6, equivalently d<p−6; AMMN’s introduction prints d<p+6. |

The JSON contains exact locators, mathematical checks, impact, correction searches and individual verdicts. The bounded errata check examined the arXiv version history, relevant author listings and title/correction queries. No later arXiv AMMN version or public correction of these passages was found. The publisher article was not available as readable text and one moved author target was inaccessible; absence of a located erratum is not a claim that no correction exists. No author was contacted.

## Route decisions and proof boundaries

- Route 1, **reject**, RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses: The direction is appropriate, but generic de Rham, cycle-conjecture and characteristic-class work must be imported. The declaration-level dependency/API/coverage gaps make the design brief unready.

- Route 2, **accept**, RefinedTraceMethods: Map-level henselian square, integral cyclotomic estimates, graded THH/Tate constructions and rational TC decomposition belong in RT.1/2/3/3b/6. Generic quasi-isogenies and spectral formality have been moved to shared owners; all corrected torsion and [2i] conventions travel with these source items.

- Route 3, **accept**, PrismaticCohomology: The finite-Nygaard/syntomic comparison and rigidity results are sources for PR.3/4. Generic exterior-power/LKE lemmas import DD/EDS, and RT owns the final TC decomposition. This accepts source ownership, not completed transitive proofs.

- Route 4, **accept**, EnhancedDerivedSheaves: Animation, adjunction descent and LKE belong to E3/E5:animation; abstract quasi-isogenies to E2/E5:abstract. Ordinary 1-categorical Mathlib constructions do not discharge these enhanced statements.

- Route 5, **accept**, KTheoryFiniteLocalFields: The complete-DVR comparison and K/TC rigidity applications belong to L.5/6. The general perfect-residue result is now missing rather than falsely supplied by the finite-Q_p-field target; completion is derived.

- Route 6, **reject**, PadicHodgeTheory: The arbitrary-perfectoid fundamental square is justified using an invalid integral de Rham comparison (E14). The O_C application is retained, but the general theorem needs a torsion reduction and the classical-map proof needs its precise supplier before this mixed route can be used.

- Route 7, **accept**, CohomologyComparisons: The proper good-reduction de Rham/crystalline/étale specialization belongs in CP.2/3. Import period and syntomic theorems; distinguish derived Frobenius fibres and ordinary invariants, and retain the weight-zero boundary.

- Route 8, **accept**, DerivedDeRhamCohomology: Derived exterior-power and filtered-connectivity lemmas are shared DD.0/DD.1 sources; PR.3/4 consumes them without a duplicate construction.

- Route 9, **accept**, CrystallineCohomology: The valuation bound and universal truncated PD computation belong in CR.0. The factorial multiplication identity already exists in Mathlib; E1’s unsupported correction is rejected.

- Route 10, **accept**, MotivesAndAlgebraicCycles: The precisely stated variational Hodge conjecture belongs to MC.7 as an unproved proposition. Continuous K-theory lifting does not algebraize it.

- Route 11, **accept**, StableHomotopyKTheory: Bounded-below spectral formality up to quasi-isogeny belongs with Postnikov/completion methods at H.6, importing the abstract categorical definition. Its external proof remains an explicit supplier obligation.

The seven open gaps concern full source closure, APIs, uniformity, torsion period comparisons, weight zero, the deformation design and external comparisons. The eleven-node supplier-boundary graph is acyclic and names existing owners. It deliberately leaves external NS/DGM/BMS/AN/KN/Li–Liu/FF and other nonroutine proof inputs open rather than declaring them standard. Existing papers and source directions are separated from uncovered acquisition requests.

## Validation

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22.result.json` passes. The repository intake check and the independent structural audit pass: 150 unique item IDs, 113 missing items each routed once, all route stage references valid, 19 unique source-issue IDs with 18 confirmed and one rejected, all 150 items represented in the search ledger, and an acyclic supplier-boundary graph. Only the four issue-authorized deliverables are submitted.

No Lean file is an authorized deliverable of this review, and no Lean compilation is claimed. The proposed API tests remain mathematical test specifications. The extraction stays partial and the two rejected routes stay unavailable for automatic design/source acceptance until their recorded obligations are resolved.
