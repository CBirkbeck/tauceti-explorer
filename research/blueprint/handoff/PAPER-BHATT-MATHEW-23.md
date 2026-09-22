# Handoff: PAPER-BHATT-MATHEW-23

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1365).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.**

- The published open-access version (Forum Math. Pi 11 (2023) e1), read in full.
- The arXiv v2 TeX source, read in full alongside it. Statement numbering and content agree.
- Bhatt–Scholze's *Prisms* (arXiv v4) and Bloch–Kato (Publ. Math. IHÉS 63), for the numbering of the statements cited.

**Deliverables:**

- `research/blueprint/papers/PAPER-BHATT-MATHEW-23.result.json`: 102 items (1 library, 27 planned, 74 missing), 7 routes, 10 prerequisites and 8 source issues.
- The report, `research/blueprint/papers/PAPER-BHATT-MATHEW-23.md`.

## Judgement calls for the reviewer

**A Part II, not a new roadmap.** Everything the paper builds is computed with PrismaticCohomology's objects. PR.4 already names the question the paper answers: how much of generic-fibre étale cohomology the syntomic complexes are. A standalone "F-smoothness" roadmap would also be defensible, but it would import almost all of PR.3–PR.5.

**Reused proposals and routes.**

- Bloch–Kato's nearby-cycle theorems go to `LocalFieldsPartIIKatoSwanConductors`, from the Bright–Newton extraction, which already plans the filtration U^m.
- AMMN's connectivity and left Kan extension statements go to PR.4, as in the AMMN extraction.
- Néron–Popescu goes to SF.0, as in the Česnavičius extraction.

**Commutative algebra.**

- The Cohen structure theorem, factoriality and localization of regular local rings, and Kunz's criterion go to DeformationAndDerivedPatchingAlgebra R03.1/R03.3.
- The cotangent-complex criteria (André, Avramov, Lemma 4.18, F-finite ⟺ L almost perfect) go to DD.0.

A reviewer may prefer a single SchemeAndStackFoundations owner for all of them.

**Example 1.6** (syntomic complexes via sheafified K_{2i}) is stated in the paper without proof. It is routed as a source statement to RefinedTraceMethods RT.6, not to the Part II.

**The E6 gap (Theorem 5.8).** The printed decomposition R[1/p]^× = π^Z ⊕ R^× is false at points on two or more components of the special fibre. I checked the following.

- In weight 2, the bilinearity trick applied to each branch parameter t_k repairs the argument. For u ∈ 1 + t_k R, one writes u as a product of elements 1 + t_k w with w a unit.
- With two components, weight-3 symbols {u, t_1, t_2} can also be reduced, using {u, −πa} = 0.
- With r ≥ 3 branches, the relations I found are not enough to reduce {u, t_1, t_2} to unit symbols.

So the finding is recorded as a gap in the proof, not as an error in the theorem.

## Leads not recorded as source issues

A reader flagged these during the reading, but I could not confirm them conclusively:

- **Kunz's Corollary 2.6** is quoted as: a noetherian local F_p-algebra is F-finite iff it is excellent with F-finite residue field. I did not have Kunz's paper to check the exact hypotheses.
- **[AMMN22, Cor. 5.43] and [AMMN22, Th. 5.1]** use the published numbering of AMMN, which I did not compare with the arXiv numbering used by the AMMN extraction.
- **Proposition 5.4** is stated for all i ∈ Z; its proof by the Nygaard filtration covers i < 0 too, since then the extra graded pieces have fibre in D^{≥1}. No issue.

## Not done

Nothing remains in the extraction. Sato's paper was not read, beyond what Bhatt–Mathew quote from it.
