# Antieau–Mathew–Morrow–Nikolaus: On the Beilinson fiber square

**Status: partial, following independent review.** There are 150 items: 3 library, 34 planned and 113 missing. Every missing item has exactly one route. Nine source routes are accepted; the proposed deformation Part II and the period-ring route require revision. The extraction was originally written by Claude Code — cc-7b31c4; Codex — codex-c83e7a independently reviewed and corrected it for [issue #1313](https://github.com/CBirkbeck/tauceti-explorer/issues/1313).

## What the paper supplies

For a commutative ring henselian along (p), Theorem A gives a natural cartesian square relating p-completed rational K-theory, reduction modulo p, negative cyclic homology and periodic cyclic homology. Its right arrow is the crystalline trace. The square, including its maps, is stronger than an equivalence of its two fibres. The integral arguments use quasi-isogenies with degreewise bounded denominators, and their diagram versions require bounds uniform over the diagram.

For proper smooth schemes over a complete mixed-characteristic DVR, the square identifies the obstruction to lifting a rational K-class of the special fibre to continuous K-theory with its crystalline Chern character’s Hodge level. This continuous lifting theorem does not prove the Fontaine–Messing variational Hodge conjecture: algebraization remains a different problem. The paper also compares syntomic complexes with Fontaine–Messing complexes, obtains a rational TC splitting, and derives local-field and period-ring consequences.

## Sources and limits

The independent reviewer read all 65 pages, including proofs, appendices and references, of [arXiv:2003.12541v2](https://arxiv.org/pdf/2003.12541v2), dated 29 September 2021. SHA-256: `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd`.

Relevant corrected statements and source findings were compared with the [public published reprint](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/AMMN22.pdf), Duke Mathematical Journal 171 (2022), 3707–3806, [DOI](https://doi.org/10.1215/00127094-2022-0037). SHA-256: `1d30916cfdf80f7601dffd41c4e2873b28042d136dc012c86ae9f367e409bf42`. This was a passage comparison, not a complete second reading of all 100 published pages.

Supporting primary readings were [Bhatt’s derived de Rham preprint](https://arxiv.org/pdf/1204.6560), pp.32–33; [Szamuely–Zábrádi’s survey](https://pagine.dm.unipi.it/tamas/beilintrorev.pdf), pp.32–36; and [Bloch–Esnault–Kerz’s author final version](https://www.math.uchicago.edu/~bloch/padic_cycle_final.pdf), pp.1–3. The JSON records source hashes and exact reading limits. The remaining external proofs are supplier obligations, not claimed completed readings.

## Corrections incorporated

The JSON contains the item-by-item change log and the independent semantic/name searches for all 150 items. Principal corrections are:

- Restore β∘tr, the properness and p-torsion-free hypotheses, the lowercase flat quasisyntomic basis, the exceptional degree in Proposition 5.30, and the finite-quotient/mod-p scope of graded Frobenius.
- Use exp(c₁(L)) for the Chern character of a line bundle. The formula 1+c₁(L) is insufficient in degree four.
- Restore [2i] on the rational TC summands. For R=Z_p and i>0, the unshifted syntomic term is Q_p[−1]; the shift produces homotopy degree 2i−1.
- Separate B_crys⁺=A_crys[1/p] from B_crys, and distinguish a period-ring carrier from its comparison theorem. The asserted integral identification with derived de Rham cohomology is false for arbitrary torsion perfectoid rings.
- Separate generic categorical, de Rham, PD and spectrum lemmas from their trace/prismatic applications. An unproved conjecture is recorded as a proposition to state, never as a theorem supplying a proof.
- Add omitted map-level, connectivity, base-change, filtration, continuity, square-zero, adjunction and PD-boundary statements. The factorial lemma is split into an existing exact identity and a missing valuation bound.

The review rejects the previous E1 correction to Example 7.3. In the universal truncated PD model, multiplication by x−p gives relations p e_j=(j+1)e_(j+1), ending in p e_(r−1)=0. For 1≤r≤p, every integer 1,…,r−1 is invertible in W(k), so the cokernel is W(k)/p^r, including r=p. The triangular determinant is ±p^r, so there is no extra kernel term. Cancelling p! or replacing this universal object by the PD structure compatible with the base would be invalid. The disputed endpoint therefore survives.

## Existing libraries and owners

The exact pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Ten Lean source files were inspected and their blob hashes checked. The three library items import:

1. `padicValNat_factorial_mul` for v_p((pr)!)=v_p(r!)+r.
2. `WittVector.fontaineTheta`, its Teichmüller formula and `surjective_fontaineTheta`.
3. `fontaineThetaInvertP` and `BDeRhamPlus` for the localized theta map and completed carrier.

Witt vectors, divided powers, the divided power algebra, ordinary derived categories, ordinary Day convolution and quasicategories also exist at the pins. Their presence does not establish the enhanced stable, prismatic, universal PD-envelope or period-comparison results. No Lean file was authored or compiled in this paper review.

The cited planned stages and relevant reviewed coverage entries were read. The existing derived de Rham decomposition already owns polynomial resolutions, derived base change, the conjugate filtration and Cartier comparison; its explicit unresolved proof boundaries remain unresolved here. A planned item records an existing owner, not an implemented theorem.

## Routing and remaining work

1. **RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses — reject.** The direction is appropriate, but generic de Rham, cycle-conjecture and characteristic-class work must be imported. The declaration-level dependency/API/coverage gaps make the design brief unready.

2. **RefinedTraceMethods — accept.** Map-level henselian square, integral cyclotomic estimates, graded THH/Tate constructions and rational TC decomposition belong in RT.1/2/3/3b/6. Generic quasi-isogenies and spectral formality have been moved to shared owners; all corrected torsion and [2i] conventions travel with these source items.

3. **PrismaticCohomology — accept.** The finite-Nygaard/syntomic comparison and rigidity results are sources for PR.3/4. Generic exterior-power/LKE lemmas import DD/EDS, and RT owns the final TC decomposition. This accepts source ownership, not completed transitive proofs.

4. **EnhancedDerivedSheaves — accept.** Animation, adjunction descent and LKE belong to E3/E5:animation; abstract quasi-isogenies to E2/E5:abstract. Ordinary 1-categorical Mathlib constructions do not discharge these enhanced statements.

5. **KTheoryFiniteLocalFields — accept.** The complete-DVR comparison and K/TC rigidity applications belong to L.5/6. The general perfect-residue result is now missing rather than falsely supplied by the finite-Q_p-field target; completion is derived.

6. **PadicHodgeTheory — reject.** The arbitrary-perfectoid fundamental square is justified using an invalid integral de Rham comparison (E14). The O_C application is retained, but the general theorem needs a torsion reduction and the classical-map proof needs its precise supplier before this mixed route can be used.

7. **CohomologyComparisons — accept.** The proper good-reduction de Rham/crystalline/étale specialization belongs in CP.2/3. Import period and syntomic theorems; distinguish derived Frobenius fibres and ordinary invariants, and retain the weight-zero boundary.

8. **DerivedDeRhamCohomology — accept.** Derived exterior-power and filtered-connectivity lemmas are shared DD.0/DD.1 sources; PR.3/4 consumes them without a duplicate construction.

9. **CrystallineCohomology — accept.** The valuation bound and universal truncated PD computation belong in CR.0. The factorial multiplication identity already exists in Mathlib; E1’s unsupported correction is rejected.

10. **MotivesAndAlgebraicCycles — accept.** The precisely stated variational Hodge conjecture belongs to MC.7 as an unproved proposition. Continuous K-theory lifting does not algebraize it.

11. **StableHomotopyKTheory — accept.** Bounded-below spectral formality up to quasi-isogeny belongs with Postnikov/completion methods at H.6, importing the abstract categorical definition. Its external proof remains an explicit supplier obligation.

The extraction remains partial because declaration-sized transitive proof coverage and definition APIs are incomplete. Four concrete API/test contracts illustrate the necessary precision; the remaining definitions still need them. The JSON provides seven explicit gaps and an acyclic supplier-boundary graph. That graph is an audit aid, not a claim to the missing fine proof decomposition.

The [independent review](../reviews/REV-PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22.md) explains the 19 source findings: 18 confirmed and one rejected. Source-route acceptance makes AMMN a source for the named owners; it does not certify those owners’ entire proof closure. The rejected routes must be revised before they create a design or supply the unresolved comparison.
