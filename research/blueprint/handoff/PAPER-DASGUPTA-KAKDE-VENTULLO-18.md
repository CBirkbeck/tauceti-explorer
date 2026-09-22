# Handoff: PAPER-DASGUPTA-KAKDE-VENTULLO-18

Claude Code, session `cc-d67081`, 22 September 2026 (issue #1147).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.** The published paper in full — Ann. of Math. (2) 188 (2018), 833–870. It is **free**: the Annals article page advertises the full text through its `citation_pdf_url`, as it did for PAPER-GAN-ICHINO-18. All locators are to the published pages. arXiv:1605.08169v1 (the only version) was diffed word by word against it; the differences are editorial, plus one typo corrected in print (E9) and one sentence added that is itself a misprint (E5). The cited inputs were not read; the items that rest on them say so.

**Deliverables:**

- `research/blueprint/papers/PAPER-DASGUPTA-KAKDE-VENTULLO-18.result.json`: 118 items, 4 routes, 24 prerequisites, 9 source issues;
- the report `research/blueprint/papers/PAPER-DASGUPTA-KAKDE-VENTULLO-18.md`.

## Judgement calls for the reviewer

**A Part II, not a new roadmap.** `IntegralIwasawaTheoryPartII` (93 items, area `automorphic`), "Arithmetic Iwasawa theory and the main conjecture, Part II: the Gross–Stark conjecture". IntegralIwasawaTheory already owns the Deligne–Ribet dictionary (I.3), Wiles's totally real main conjecture with its Hilbert modular machinery (I.5) and the integral Brumer–Stark theorem of Dasgupta–Kakde (I.6–I.7) — the same authors, the same congruences, the same generalised Ribet method. A reviewer might instead prefer:

- a new roadmap, on the ground that the proof is a self-contained construction with its own Artin rings and cohomology class and touches the main conjecture only through the inequality (4);
- a Part II of NoncommutativeAndEquivariantIwasawa, whose NE.7 plans leading terms, Bockstein/regulator data and exceptional zeros — the closest conceptual neighbour outside IntegralIwasawaTheory, though in the equivariant K-theoretic framework rather than this one.

**Where the line between planned and missing was drawn.** Fifteen items are planned, which is more than in the previous two extractions, because the atlas plans most of the *inputs* to this proof: the Deligne–Ribet L-function and the Hilbert Eisenstein series (AutomorphicPadicLFunctions L3), Hida theory over totally real fields (PadicFamilies L5, L0a), the Galois representations of Theorem 4.1 (OrdinaryAutomorphicFormsAndModularityLifting R21.3), Poitou–Tate and local Tate duality (ArithmeticGaloisDuality R02.4), Iwasawa's logarithm and the Teichmüller decomposition (DirichletPadicLFunctions L3), the inequality (4) through Wiles (IntegralIwasawaTheory I.5), and the Artin maps, class fields and Chebotarev (Tau Ceti). A reviewer who thinks any of these stage descriptions is too general to count should move the item to missing and into the Part II; the candidates most worth a second look are the Hilbert Eisenstein series with the exact Fourier and constant coefficients of §3.1, and Theorem 4.1 in the residually reducible weight one case.

**Three small source routes.** The complex L-function inputs to AutomorphicPadicLFunctions L0; the p-adic Gamma function, Gross–Koblitz and Ferrero–Greenberg to DirichletPadicLFunctions L3; and three unowned facts about Hida families — the Λ-adic q-expansion principle, the reducedness of the localized Hecke algebra and its decomposition into eigenfamilies — to PadicFamilies L5.

**One library item.** Only Dirichlet's unit theorem is in the libraries (Mathlib `NumberField.Units.rank` and friends; note `rank_modTorsion` is deprecated there in favour of `finrank_modTorsion`). The S-unit theorem the paper actually uses is missing. Tau Ceti's `teichmuller`, `NormedSpace.logOneAdd` and Chebotarev infrastructure are near misses, recorded as notes on the items that need them rather than as library statuses, because none of them is the statement used.

## Source issues

Nine: two gaps, six misprints in the published text, one arXiv-only misprint already corrected in print.

- **E1 is the gap that matters.** §3.5, p. 856: the linear independence that gives the injectivity in Case 3, and so completes Theorem 3.8, is "left to the reader". It lies on the path to Theorem 1, and the Case 2 argument it points to is two pages long and splits into subcases, with a different relation ideal.
- **E2 (affects nothing).** Remark 4.5 takes the kernel of a homomorphism φ′ : T_m → E[π]/(π^{r_an+1}) that is never constructed; the only φ′ in the paper (Remark 3.4) has domain T′ and target E[π]/π^{r+1}. I checked by hand that no Λ-algebra map W → E[π]/(π^{r_an+1}) exists for r ≥ 2 unless L*_an(χ) = 0, so it cannot factor through ϕ_m. The remark is an aside.
- **The misprints** are a χ for χω in the definition of L*_an (E3), a chain of equalities whose last term should be r_an(χ^{-1}) (E4), a cross-reference to (2) for definitions that are in §1.3 (E5, new in the published version), ρ_H for ρ in (63) (E6), a(σ) for a(σ′) in the cocycle relation for c (E7), and a forward reference to (21) where (10) is applied (E8). E4, E6 and E7 were checked on page images specifically because text extraction loses primes and superscripts.
- **E9** is the one arXiv-only typo, F_P for H_P in the definition of o_P and ℓ_P, corrected in the published version; it is recorded so that anyone working from the arXiv text uses the corrected statement.

Remark 5.2, where the authors fill a hole in the rank one paper, is an **item**, not a source issue against this paper — the same call PAPER-JIANG-ZHANG-20 made.

## A note for anyone reading this PDF

The paper prints **φ for the empty set**, and R′, T′, φ′ are primed; text extraction renders these "φ", "R0", "T0", "ϕ0". Superscripts vanish: the dimensions on pp. 852 and 854 are 2^r + r_an − 1 and 2^r + 2r_an − 2. Two of the nine findings were nearly recorded wrongly, and one candidate finding was dropped, because of this; every one was settled on a page image.

## Remaining

Nothing for this job. Lean: none — nothing here is formalised, and no Lean file was written or built.
