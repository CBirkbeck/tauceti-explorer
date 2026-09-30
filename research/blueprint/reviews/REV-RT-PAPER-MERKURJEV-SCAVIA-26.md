# REV-RT-PAPER-MERKURJEV-SCAVIA-26

**Complete: all seven findings confirmed.** Five fixes are completed or adjusted below.

- **Job:** Refs #4529.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction, its review and the red team (RT-PAPER-MERKURJEV-SCAVIA-26, session `cc-f805bf`) were done by other sessions.
- **Verdicts:** in `research/blueprint/redteam/RT-PAPER-MERKURJEV-SCAVIA-26.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Paper.** The text read is arXiv:2410.12560v1 (SHA-256 699028a3…88ac), the file the extraction read, with its LaTeX source and page images. The published version (J. Amer. Math. Soc. 39 (2026), 73–94, doi:10.1090/jams/1059) is behind a login, so only its abstract page was read.

**Method.** Two verifiers worked in parallel: one on findings 1–3, one on findings 4–6. The lead verifier checked finding 7 and read every verdict.

**What was checked:**
- **Libraries:** every cited declaration, opened in the pinned Mathlib and Tau Ceti trees.
- **Roadmap documents:** the Tau Ceti ProfiniteProPGroups document, read from the atlas copy `content/tau-ceti/ProfiniteProPGroups/README.md`, since the document is not in the TauCeti tree at f790474.
- **Accepted routes:** the cited routes and their review verdicts (CDT25, WOOD-19, HARPAZ-WITTENBERG-23).
- **Gherman–Merkurjev:** the author PDF, for finding 5.

## /1: confirmed (medium). ProfiniteProPGroups Layer 5 is the upstream owner

**What Layer 5 plans:**
- the continuous extension/H² bijection;
- "splitting … iff its class in H²(G, M) is zero";
- `FiniteEmbeddingProblem.IsSolution` in the weak form;
- in 5.2, "vanishing of that class is exactly solvability".

**What the extraction does.** Neither the extraction, its report nor its review names ProfiniteProPGroups. The accepted Harpaz–Wittenberg extraction already cites this Layer 5.

**The fix holds.** Restricting a non-surjective ρ to its image is valid. The primary-decomposition reduction to p-primary A also works, because G is the fibre product over H of its ℓ-part quotients.

**Additions:**
- Also add the Layer 5 import to route 7's brief.
- Route 1 must also supply that the class of the pulled-back extension is ρ*α. Layer 5 states naturality in M only.

**Note for the design jobs.** Layer 5 states its bijection on Mathlib's `continuousCohomology`, but this extraction works with `TauCeti.ContCohomology.H2`. At the pin those are compared only in degree 0. Importing Layer 5 therefore needs the degree-2 comparison that ProfiniteCohomology Layer 3 plans.

## /2: confirmed (medium). The connecting maps are built

`DiscreteShortExact` provides `explicitDelta0` and `explicitDelta1`, with their `_apply` lemmas and the naturality, restriction, coefficient and corestriction theorems. It also provides `explicitCup02` and `explicitCor2`. A finite discrete H acting trivially on discrete ℤ, ℚ and ℚ/ℤ meets every hypothesis. Concretely:
- The paper's ∂₁ is δ⁰. Its ∂₂, and ∂ : H¹(H, ℚ/ℤ) → H²(H, ℤ), are δ¹.
- Inflation on p. 13 is `explicitDelta1_naturality`.
- φ_H′ is `explicitCor2 ∘ explicitCup02` for the pairing (a, n) ↦ n·a.

**Corrections to the fix:**
- **Exactness is built too.** `explicitLongExact_H0A` … `_H2B` give exactness at all eight nodes, so /67's bijectivity needs only /68 together with `_H1C` and `_H2A`.
- **Topology.** Mathlib's ℚ carries its order topology, not the discrete one. ℚ and ℚ/ℤ need discrete copies, for example `WithDiscreteTopology`.
- **A step still missing.** The identity ∂₂(χ) = χ*(θ) used on p. 9 is not in the library. It should be a missing step under /49.
- **Degree-0 versions.** /98 should also cite `explicitCor_delta0`.

## /3: confirmed (medium). The §5 matrix groups are built

The following are all present with the signatures §5 needs: `upperTriangularGroup`, `UpperTriangularGroup.map`, `diag`, `ker_diag`, `upperUnitriangularGroup` (with its map, filtration and nilpotency), `diagonalTorus`, `Matrix.GeneralLinearGroup.map` and `card_GL_field`.

The accepted route 7 of Harpaz–Wittenberg holds /14–/16: the transvections, centre and commutator subgroup of U₃(F_p). This paper's /86–/87 duplicate them, and importing them creates no cycle.

**Corrections to the fix:**
- **Orders not yet built.** The orders of B_n and U_n are built only for the n = 2 Borel case. |U_n(F_p)| = p^{n(n−1)/2} still has to be proved. |B_n| = |U_n|·(p−1)^n then follows from `ker_diag` and `diag_surjective`.
- **Transvections.** /86 should cite `transvectionUnit`, and the built `commutatorElement_transvectionUnit` for [σ₁₂, σ₂₃] = σ₁₃.
- **Coordinates.** /100 should cite `diagonalTorusEquiv` for (t₁, t₂, t₃).

## /4: confirmed (medium). The universal coefficient theorem has an accepted owner

**Ownership.** CDT25 route 7, accepted on 23 September, sends the finite-group universal coefficient theorem to ArithmeticGaloisDuality D7. D7's stage text does not mention it; D7 owns it through that accepted route. PAPER-WOOD-19/131 is a third copy, in a Part II of InductionRestriction. Neither library has the theorem.

**Same theorem.** The Tor form here and the Ext and homology forms in CDT25 are the same result: the universal coefficient theorem for a complex of free abelian groups, applied to the standard resolution. So moving /52, /53 and /123 into a source route to D7 is right. It makes this paper a second source for the accepted owner, which route 6 then imports.

**Adjustments:**
- **General form.** D7 should plan the homology Tor form and the cohomology Ext form for any group (Wood needs an arbitrary group), and the cohomology Tor form for finite groups with arbitrary coefficients.
- **Import.** Route 6's brief must name D7.
- **Reuse.** The algebraic core over PIDs is planned in Tau Ceti's AlgebraicTopology roadmap and should be imported, not re-proved.

**Note for the maintainer.** D7 depends on Poitou–Tate duality, so this algebraic lemma pulls that dependency into three Part IIs. §15 prefers the most foundational owner, which would be the pending ProfiniteCohomology Part II. Either choice satisfies §15, provided there is exactly one owner.

## /5: confirmed (medium). The sharpness statement is missing

On p. 4 the paper says the roots-of-unity hypothesis of Theorem 1.3 is sharp, and the extraction does not record this.

**The witness is correct.** Take H = A = ℤ/2 over ℚ:
- H̄², the subgroup generated by corestricted cup products (defined on p. 12), is all of H²(ℤ/2, ℤ/2) ≅ ℤ/2, generated by the class of ℤ/4.
- That class is not negligible over ℚ. The character cutting out ℚ(i) does not lift to ℤ/4, since complex conjugation would have to go to an element of order at most 2. Equivalently, (−1, −1) ≠ 0 in Br(ℚ).
- The paper's justification is Gherman–Merkurjev's classification, which also gives the general case: for H = ℤ/p^a and A = ℤ/p^s, the field ℚ(μ_{p^{a+s−1}}) is a counterexample.

**Adjustment.** Do not replace /128's "no claim of necessity". Sharp does not mean necessary: for H = A = ℤ/3 over ℚ(ζ₉ + ζ₉⁻¹), the conclusion holds although that field has no cube roots of unity. Keep the phrase, add the new sharpness item, and cite Gherman–Merkurjev Theorem 4.2 (their introduction calls it 4.1), Theorem 5.2 and Corollary 3.4.

## /6: confirmed (low). Five unregistered misprints

All five are real, and none duplicates E1–E8:
- p. 4: "A acts trivially on H";
- p. 8: fL^× for fL^{×n};
- p. 8: "étale F-algebra";
- p. 13: Div(X) for Div(V);
- p. 17: H̄²(N, A) for H̄²(U, A).

**Adjustments:**
- For the p. 8 algebra, "étale K-algebra" is the smallest correction.
- Each new entry needs a reason and E8's `searched` list, and no review verdict.
- A sixth slip may be added at the fixer's discretion: in the proof of Lemma 4.1 (p. 13) the sum runs to k where r = [H : H_x] is meant.

## /7: confirmed (low). The version of record was revised

This was checked by the lead verifier on the AMS abstract page. The article block is identified by its id S0894-0347-2025-01059-9, since the page serves the whole issue.

- **Dates:** "Received by editor(s): October 20, 2024", "Received by editor(s) in revised form: March 7, 2025", "Published electronically: May 22, 2025".
- **New references.** The published reference list includes four works that arXiv v1 lacks:
  - Karpenko, "Torsion in CH² of Severi–Brauer varieties and indecomposability of generic algebras";
  - Lur'e, "Universally solvable embedding problems" (1990);
  - Serre, *Cours* no. 12 (1991);
  - Serre, *Cours* no. 15 (1993–94).
- **What v1 has.** Its LaTeX source has 31 bibliography entries, and its only Lur'e entry is the co-authored monograph [ILF97].

**The fix is right.** Add a `published` sourceVersions entry for the abstract page ("dates, abstract and reference list only; the article PDF is behind a login"), and extend the published-version gap as proposed. The author manuscript is dated 16 October 2024, matches v1, and does not stand in for the revised text.

## For the fix job

Findings 1–5 are medium and become FIX-RT-PAPER-MERKURJEV-SCAVIA-26. Apply each with the adjustments above:
- /1: add the Layer 5 import to route 7's brief, and the pull-back naturality to route 1;
- /2: treat exactness as built, use discrete copies of ℚ and ℚ/ℤ, and add ∂₂(χ) = χ*(θ) as a missing step;
- /3: the orders of B_n and U_n are still to be proved;
- /4: have D7 plan the general form, and record the owner question for the maintainer;
- /5: keep "no claim of necessity" alongside the new sharpness item.
