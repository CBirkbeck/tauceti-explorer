# LINK-tauceti_TauCetiRoadmap_AlgebraicCodingTheory — handoff

**Job:** LINK-tauceti_TauCetiRoadmap_AlgebraicCodingTheory, issue #38.  
**Worker:** ChatGPT Pro — cgp-f522e092da3e.  
**Date:** 17 September 2026.  
**Status:** catalogue-wide screen complete; submitted links still require independent review and integration. `implementationStatus` remains `unchecked`.

Only the authorized link packet and this handoff are deliverables. No Lean implementation, default-branch change, queue edit, promotion, merge, approval or issue closure is part of this work. No git command was run.

## Result in under 250 words

Nine new prerequisite links were established: seven incoming from IntegralLattices (the integral-lattice carrier, dual/discriminant interface, finite bilinear/quadratic modules, general gluing and ADE discriminant forms), and two outgoing to FiniteFieldsAndCharacterSums FF.4 (generic encoding/matrix and dimension API; Hamming/minimum-distance API).

Three overlaps have concrete recommendations. Rescope the repeated coordinate-power work in coding Layers 2 and 7 to consume the existing pinned Tau Ceti API. Keep the common finite-character/Fourier kernel shared with FF.1 and AdditiveCombinatorics AC.0, without forcing a prerequisite that the coding text does not require. Rescope GN.4's ambiguous promise to connect lattice codes through FF.4: specify the constructor and rational-to-real geometric interface before adding a directed dependency.

No whole-roadmap merge is recommended. The code families of FF.4, the Construction-A comparison, and geometric lattice applications have different responsibilities. The source texts explicitly exclude a Mathieu-group identification, code classification, theta-series proofs of MacWilliams, and a rank-24 lattice classification.

The official full-world validator ran locally on the complete artifact input tree and returned **0 errors, 0 warnings**. Additional checks verified all 217 examined identities, verbatim quotes and line locators, input hashes, retirement handling, and nonduplication against the atlas and 25 existing link packets. Structural success does not certify mathematical correctness or Lean completion.

## Claim and input provenance

The live issue had no prerequisite job or existing link submission. Claim comment **5713491139** was accepted for this exact session by bot comment **5713493122**. The previous #70 checkpoint was already merged and explicitly reassigned to another session; that session's claim was not touched.

- Mathematical input revision: `dbafc759460581dbd23999a3c112149fedefe2b5`.
- Artifact revision: `66e35f2051d4e49644701ad398112de45095d315`.
- GitHub Pages workflow run: `35216072568`; artifact: `10495186650` (`github-pages`).
- Artifact archive SHA-256: `b4caf4562ec7324ef7e4a8844caaefa29070200927063ce2a9210e3cdbeac8f3`.
- Atlas Git blob SHA-1: `37f2add06983c206067d1104e0f40a839cc3961a`.
- Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.

The authorized GitHub artifact download provided a complete scratch copy, including the atlas, generated browser extracts, source documents, new definitions, existing links and validators. The archive digest matched its advertised digest. GitHub's commit comparison showed that the single commit between the mathematical input and artifact revisions changed only unrelated audit24/audit25 results/reviews and the queue/ledger. All physical roadmap Markdown files matched their atlas `readme` strings. The packet records the relevant individual input blob hashes, not merely a floating branch name.

A GitHub GET attempt on the root Actions artifacts collection was unsupported; the supported per-run artifact action succeeded. No extra workflow was created to obtain inputs.

## Screen performed

The browser instructions, blueprint protocol including sections 9–11, upstream guide, expansion protocol, retirement file and focal AUDIT-16 entries were read. The focal roadmap and **every one of its seven stage descriptions** were read in full, and per-stage inputs/outputs were saved in session scratch. The entire IntegralLattices upstream document and all five stages were read; this meets the two-upstream-document requirement together with the focal upstream document. FiniteFieldsAndCharacterSums and GeometryOfNumbersAndQuadraticArithmetic were read in full. Every stage used as a link or overlap endpoint was read in full.

The search covered **211 active atlas roadmaps plus six new definitions**, **2,001 stage records**, and **all 60 upstream Tau Ceti roadmaps**. The 217-entry `examined` ledger includes the focal roadmap itself; 216 entries concern other active roadmaps. All same-area and neighboring-area summaries were included. The six new definitions were AnalyticHabiroStack, AnalyticStacks, MordellLawrenceVenkatesh, QWittVectors, RingStacksAndTransmutation and SolidAnalyticRings.

Every full roadmap text and full stage description was searched, not only filenames or headings. Query families covered code carriers; matrices/information sets; puncturing/shortening and equivalences; Hamming distance and duals; weight enumerators, MacWilliams and Krawtchouk; exceptional and Type II codes; Construction A; finite bilinear/quadratic modules and gluing; ADE alphabets; finite-field characters and F4 trace. Four wider synonym passes included every occurrence of code/coding, BCH/Reed–Solomon/Goppa, Leech/Niemeier, finite Fourier/Pontryagin, and discriminant-group/isotropic/Lagrangian terminology. Candidate matches were judged against their scope and actual use.

An `examined` entry saying summary/full-text screen does **not** claim an independent proof audit of every theorem in that unrelated document. `complete` refers to this catalogue screen, not proof completeness. `FoundationsAndLibraryIntegration` is retired and was excluded, not used as a supplier. The Completed/IntegralLattices path is not retired.

## Evidence-backed stage boundaries

The packet uses the current available stage IDs, which for coding and IntegralLattices are whole layers rather than individual numbered bullets. Each reason restricts the dependency to the actual needed interface; it does not require finishing every unrelated part of the supplier layer first. Every edge includes verbatim source and consumer quotes with physical source paths and line ranges.

| Link | Supplier → consumer | Exact boundary |
| --- | --- | --- |
| ACT-L01 | IntegralLattices 1 → Coding 6 | Bundle the full rational preimage with symmetric form `dot/m` only after integrality is proved. |
| ACT-L02 | IntegralLattices 2 → Coding 6 | Dual/discriminant and unimodularity interface for the integral, nondegenerate application. |
| ACT-L03 | IntegralLattices 3 → Coding 2 | Finite Q/Z-valued alphabet, perpendiculars and nondegeneracy; reuse coordinate powers. |
| ACT-L04 | IntegralLattices 2 → Coding 7 | Actual dual/subtype-quotient discriminant carrier for `L0 = m Z^i`. |
| ACT-L05 | IntegralLattices 3 → Coding 7 | Finite-form isometries, polar forms and orthogonal sums. |
| ACT-L06 | IntegralLattices 4 → Coding 7 | Preimage gluing and the map-level `A_(L_H) = H-perp/H` isometry. |
| ACT-L07 | IntegralLattices 5 → Coding 7 | Actual A2/D4 discriminant values and chosen representatives, not just group orders. |
| ACT-L08 | Coding 1 → FF.4 | Generic code carrier, encoding/matrix presentation, rank and dimension. |
| ACT-L09 | Coding 2 → FF.4 | Minimum distance and Hamming/coordinate-operation API; family-specific bounds stay in FF.4. |

The job-specific definition of `explicit` is used: a text names the other roadmap or stage and both endpoint contracts are quoted. Coding names the integral-lattices supplier throughout; IntegralLattices names code–lattice constructions as consumers. FF.4 explicitly names AlgebraicCodingTheory. No edge was inferred solely from shared terminology.

The construction order was checked. Coding 6 proves its literal inverse-image/residue-pairing statement; Coding 7 compares that construction with generic gluing. The packet does **not** make Coding 6 depend on its completed Coding 7 comparison. The index proof can reuse the generic index law after factoring the elementary `L0` coordinate lemma early; that is request ACT-R03, not an unstated circular prerequisite.

## Overlaps and rejected shortcuts

**ACT-O01 — coordinate powers, rescope.** Generic coordinate powers and coordinatewise isometries occur in both coding Layers 2 and 7 and at the interface to IntegralLattices finite-form theory. The relevant constructions already exist at the pin. Keep their common API in the finite-form library; coding owns the actual A2/F3 and D4/F4 identifications, code interpretation, and discriminant-coordinate maps. Rebuilding the generic objects would violate the audit rule.

**ACT-O02 — finite Fourier kernel, keep.** FF.1 and AC.0 develop broad character/Fourier topics. Coding 3 explicitly consumes Mathlib's character primitives and proves a code-subspace annihilator transform and MacWilliams. A shared kernel is not an instruction to make MacWilliams await all of FF.1 or AC.0. Keep the normalization common and unify duplicated general helper declarations, but preserve the distinct endpoints.

**ACT-O03 — GN.4 lattice codes, rescope.** GN.4 says “connect lattice codes through FF.4”; FF.4 provides finite code families but does not name the geometric constructor. Before connecting this to coding 6, the consumer must identify its construction and expose the form-preserving comparison with the real scaled lattice, plus the norms/covolumes actually used. Until then no direct dependency direction is certified. This is an explicit unresolved request, not an omitted candidate.

Other prominent candidates were rejected for concrete reasons. AlgebraicCurves' Goppa-code motivation concerns future curve-code families, which the focal roadmap excludes. CFSGStatement's sporadic lane uses group presentations, while coding explicitly excludes Mathieu identification. ADE root and weight data feed the IntegralLattices bridge; importing their classification directly into coding would duplicate that responsibility. Number-field conductor/discriminant formulas are not finite Q/Z discriminant forms. Lie-group BCH is not BCH coding. Punctured analytic/topological spaces are not coordinate puncturing. Continuous or adelic theta/Fourier theories do not supply the specified finite MacWilliams proof. Categorical Niemeier/Leech language supplies no coding-stage contract.

## Pinned library evidence: checked versus inherited

Three source files were opened at their exact library pins. Their blob hashes and declaration names are recorded in the packet.

1. `TauCeti/InformationTheory/Coding/Basic.lean`: `TauCeti.LinearCode` and `TauCeti.AdditiveCode` are exactly the intended submodule/subgroup aliases. The aliases do not require finiteness, so this is at least the needed generality. No new wrapper is needed.
2. `TauCeti/LinearAlgebra/FiniteBilinearModule/CoordinatePower.lean`: bilinear and quadratic `coordinatePower`, the nondegeneracy transfer, the perpendicular membership criterion, the quadratic isotropy criterion and both `Isometry.coordinatePower` constructions were read. They work on arbitrary finite coordinate types with literal Pi carriers. They do not themselves supply the named A2/F3 or D4/F4 discriminant comparisons.
3. `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`: the primitive-character carrier, finite-field existence, primitive/nontrivial relation, vanishing and trivial-character sums, and shifted orthogonality were read with their hypotheses. In particular, `PrimitiveAddChar F F'` stores a character into `CyclotomicField n F'`, not definitionally into `F'`. Vanishing requires a domain-valued character on a finite additive group. The coding subspace-annihilator identification is still a separate lemma, using field-linearity. It must not identify a non-prime finite field additively with the image of one primitive character.

The current Mathlib documentation was used only as a discovery/cross-reference aid. The pinned source, not that documentation, supports the baseline statements. Both library repositories were searched; zero hits in an individual search are **not** a proof of absence.

The full focal AUDIT-16 entries were read as inherited evidence. This session did not independently reopen all its matrix, discriminant or gluing citations, and does not certify all of that audit. Roadmap source bibliographies were read, but no external textbook theorem number, PDF passage or proof was newly verified. No Lean build was run and no implementation completion is claimed.

## Validation and integration handoff

The unmodified official command ran in the full artifact scratch tree:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCodingTheory.json
status: complete; links: 9; overlaps: 3; examined: 217
0 error(s), 0 warning(s)
```

The validator's SHA-256 was `68e601f58203c828c4e746061a6a119d8dbc5c7a3c181f8a8207d99d075ebe89`. Its cycle check includes the recorded atlas edges and the 25 other link packets (657 links before this submission). A separate scratch Python check verified all examined IDs, nonduplication with the atlas and other packets, unique overlap tuples, exact quotes and source line ranges, retired-owner exclusion, focal endpoint ownership, input blob hashes, and absence of private filesystem paths. These checks passed both before and after updating the validation record.

The mathematical requests ACT-R01–R05 remain visible in the packet: reuse already-built objects; clarify GN.4; choose an acyclic index-proof route; preserve the character/coefficient carrier; and retain the normalization hypotheses. They do not turn the catalogue screen back into an unfinished screen, and they must not be silently treated as implemented fixes.

Independent review should examine all nine arrows and three overlap proposals, particularly the separate odd/even gluing statements, the subgroup-versus-field-linearity distinction, and the tentative GN.4 scope. The maintainer/orchestrator may then integrate accepted links and assign owner changes. Neither this handoff nor structural validation marks issue #38 done.

### Pre-submission recheck

The live issue and complete comment thread still showed the uncontested exact-session claim. The live default-branch reference remained `66e35f2051d4e49644701ad398112de45095d315`, matching the artifact tree used for validation. The target packet was absent there and no competing link submission had appeared in the checked issue/PR search. The isolated submission branch is `cgp-f522e092da3e/link-algebraic-coding-38`. Subsequent GitHub Actions results and the durable submission URL belong in the PR and issue discussion; the local validation record above is an actual pre-submission result.
