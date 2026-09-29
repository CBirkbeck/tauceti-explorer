# REV-PAPER-MERKURJEV-SCAVIA-26: review of the extraction of Merkurjev–Scavia, *Galois representations modulo p that do not lift modulo p²*

**Verdict: accept.** All seven routes are accepted. The seven recorded mistakes are confirmed, and one new misprint is added and confirmed. No status, statement or route changes. The summary was rewritten, `sourceVersions` was added, and two notes and one gap were updated.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Codex `codex-c83e7a` (PR #1637), continued by `codex-a71f92` and completed by Claude Code `cc-39fac3` (issue #1408). It has 133 items (11 library, 10 planned, 112 missing), 7 routes and 7 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: J. Amer. Math. Soc. **39** (2026), 73–94, [doi:10.1090/jams/1059](https://doi.org/10.1090/jams/1059). I read [arXiv:2410.12560v1](https://arxiv.org/abs/2410.12560) completely (SHA-256 `699028a3…`, the file the provenance records). The earlier continuations found the author manuscript identical up to typography.

The version of record was not read. The Crossref record lists an AMS PDF link; on 29 September 2026 it redirected to pubs.ams.org and served an HTML page, not the article. The arXiv listing shows only v1. Crossref records no update to the DOI. Every finding is therefore scoped to arXiv v1, and the `published-version` gap stays open.

## 1. Items: complete and accurate

All 21 pages were read, including every proof and both remarks. Every numbered statement appears in an item locator:

- Proposition 2.1 and Lemma 2.3(1)–(5);
- Corollary 2.4 and Lemma 2.5;
- Propositions 3.1 and 3.3, Lemma 3.2, Lemma 3.4 and Remark 3.5;
- Theorem 1.3, Lemma 4.1, Corollary 4.2 and Remark 4.3;
- Theorem 5.1, Lemmas 5.2 and 5.3, and Claims 5.4–5.7;
- Remark 5.8(1)–(2) and Theorem 1.4.

I compared the statements with the text, and the hypotheses match. For example:

- /12 and /35 are Proposition 2.1's kernel description and Corollary 2.4.
- /26 keeps Lemma 2.3(4)'s condition that [H : H′] is prime to e(A).
- /57 and /70 keep the roots-of-unity hypothesis µ_{e(A)e(H)} ⊂ F.
- /72 uses the stabilizer H_a, as in Corollary 4.2.
- /111 and /112 cover every field of characteristic different from p, as in Theorem 5.1.

I redid the §5 computations the items rely on:

- **Lemma 5.2(1).** Write σ = I + N with N² = 0. Then Σ_i σ^i X σ^{-i} = pX + (p(p−1)/2)[N, X] − (p(p−1)(2p−1)/6)NXN. This vanishes mod p when p > 3, and not when p = 3.
- **Centralizers (/101).** A^U = ⟨I, E13⟩ and A^N = ⟨I, E12, E13⟩. A^Z consists of the upper-triangular matrices with a11 = a33.
- **T-weights (/102–/104).** A^U ⊗ H²(U, Z) has weights τ21, τ32, τ23, τ12. The invariants of A^N ⊗ H²(N, Z) are spanned by E12 ⊗ ∂χ12 and E13 ⊗ ∂χ13.
- **S-norm (/105).** N_S(∂χ13) = p∂χ13 + (p(p−1)/2)∂χ12 = 0 for odd p.
- **p = 3 lift (/114).** (I − 3E31)(I + E13) has cube I in GL₃(Z/9), by direct multiplication.
- **Carry formula (/130).** s(x)s(y)s(x+y)⁻¹ = I + p(κ(a,c)E12 + κ(b,d)E13), because E12 and E13 multiply to zero in both orders.
- **Weak lift (/132).** ρ̃ = I + χ̃₁E12 + χ̃₂E13 is a homomorphism for the same reason.

With these, items /126–/133 prove Remark 5.8(2), which the paper asserts without proof ("one can show").

## 2. Statuses: all hold

The fifteen declarations cited by the eleven library items resolve at Tau Ceti f790474 and Mathlib 082e2d3. They provide their items:

- `TauCeti.AbsoluteGaloisGroup` and its restriction equivalence;
- `ContCohomology.H2`, `H1EquivOfSmulEqSelf`, `explicitInfl2`, `explicitCor2`, `explicitCor2_eq_transversal` and `explicitCor2_comp_res2`;
- both projection formulas, `explicitCup_projection02` (read at the pinned file) and `explicitCup_projection20`;
- `FactorSet.cohomologyClassEquiv` and the splitting criterion;
- `kummerMap` with its cocycle formula;
- Mathlib's `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`. Its target is the homology of A → A → A built from the norm map and ρ(g) − 1, so in degree two it is the invariants modulo norms (/21).

The planned stages resolve and plan what the items claim:

- IG.4 plans "weak and proper solutions of finite embedding problems" (/3).
- IG.0 plans Galois categories and fibre functors (/9).
- ArithmeticGaloisDuality:R02.2 plans Hochschild–Serre for closed normal subgroups (/33).
- ProfiniteCohomology layers 5, 6, 9 and 10 plan five-term exactness, the change-of-group formulas, Hilbert 90 and Kummer theory, and higher continuous cohomology (/18, /20, /34, /68, /96–/98).

The missing statuses agree with the reviewed audit, which the report quotes: Kummer surjectivity, transgression and the cohomological double-coset formula are not built.

## 3. Routes: all seven accepted

Every missing item is routed exactly once. The source routes also name the planned items /3, /9 and /33.

- **Route 1: source → IG.4** (/3, /8). The continuous obstruction criterion for weak solutions with abelian kernel belongs with IG.4's weak solutions.
- **Route 2: source → IG.0** (/9, /10). Galois H-algebras, including disconnected ones, and their classification by continuous homomorphisms up to conjugacy are the torsor form of IG.0's dictionary.
- **Route 3: source → SF.1** (/14). A free invariant open with its finite étale quotient is a quotient by a free finite action, and SF.1 owns such quotients.
- **Route 4: source → SF.2** (/16). The étale-limit comparison used in the generic criterion belongs with SF.2's étale cohomology.
- **Route 5: source → R02.2** (/32, /33, /36, /37). These are the low-degree identities of the Hochschild–Serre construction that R02.2 plans: inflation–corestriction compatibility, the transgression as −u ∪ x, and the transgression–corestriction square.
- **Route 6: Part II of ProfiniteCohomology** (negligible classes). No layer plans negligible cohomology, and a Tau Ceti roadmap is extended only through a Part II. The title reproduces "Continuous cohomology of profinite groups". `make_queue.py` groups part-ii routes by parent. This route therefore joins the Harpaz–Wittenberg and Farb–Kisin–Wolfson routes in the pending DESIGN-ProfiniteCohomologyPartII.
- **Route 7: Part II of InverseGaloisAndArithmeticFundamentalGroups** (representations that do not lift modulo p²). Lifting a residual representation over an arbitrary field is an embedding problem. The number-field deformation roadmaps assume number fields, so they do not cover this. The title reproduces the parent's. This route joins the Ellenberg–Venkatesh–Westerland and Klevdal–Patrikis routes in the pending DESIGN-InverseGaloisAndArithmeticFundamentalGroupsPartII.

## 4. Mistakes in the paper: 7 of 7 confirmed, 1 added

- **E1** (error, affects a stated result; Lemma 4.1, pp. 12–13): confirmed.

  The counterexample is correct. For H = C₂ acting on A¹_R by t ↦ −t, h(1 ⊗ ct) − 1 ⊗ ct = 1 ⊗ (−1), which is nonzero in R(t)^×/R(t)^{×2}.

  The corrected lemma (/63) holds. For h ∈ H_x we have h(f_x) = c_h f_x, and c_h ∈ µ_e = µ_{ne}^n, so b ⊗ c_h = 0 when nB = 0. The orbit sums are then invariant and lift the generators of the divisor invariants. What remains lies in (B ⊗ F^×)^H.

  Theorem 1.3 uses the lemma only when µ_{ne} ⊂ F, so it is unaffected.
- **E2** (misprint; (2.3), p. 6): confirmed. The inflation target is H²(K, A), and the segment is exact in the middle.
- **E3** (misprint; proof of Lemma 2.5, p. 7): confirmed. The printed chain interchanges u and u′.
- **E4** (misprint; proof of Proposition 3.3, p. 11): confirmed. Lemma 3.4 needs trivial modules, so it applies to (3.3), not (3.2).
- **E5** (gap, affects the proof; Lemma 5.3, p. 15): confirmed. An element of E can have a nonzero p-divisible lower-left block, so "restriction to Ṽ" is not defined. The top-left block is a homomorphism modulo p².
- **E6** (misprint; Claim 5.7, p. 19, page image): confirmed. With the paper's convention (t·χ)(u) = χ(t⁻¹ut), χ_ij has weight τ_ji. The paper uses exactly this for U and N. So H²(Z, Z) ≅ F_p(τ31), and only this makes the next display correct.
- **E7** (misprint; Claim 5.7, p. 18, page image): confirmed. E12 ∉ A^U, so φ_U(E12 ⊗ ∂χ12) is undefined, and res^U_N(φ_N(E12 ⊗ ∂χ12)) is meant. By the projection formula, φ_N(E12 ⊗ ∂χ12) = φ_U(N_{U/N}(E12) ⊗ ∂χ̃12). Since σ23 E12 σ23⁻¹ = E12 − E13, N_{U/N}(E12) = Σ_k (E12 − kE13) = 0.
- **E8** (new, misprint, affects nothing; Example 2.2, p. 5, page image). The proof identifies π_*: H¹(K, Z/mn) → H¹(K, Z/m) with "F^×/F^{×mn} → F^×/F^{×m}" and concludes that "every continuous homomorphism Γ_F → Z/mZ lifts". Negligibility over F is Proposition 2.1(2), which quantifies over every extension K/F, so K^× and Γ_K are meant. Kummer theory applies over each such K, because K contains µ_mn. Item /22 already stated the corrected form, but the slip had not been recorded as a source issue.

Remark 5.8(1) also prints "in in". That is not registered.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. The review's changes are:

- the eight `review` verdicts and E8;
- the new summary and `sourceVersions`;
- the notes on /22 and /117;
- the `published-version` gap's remaining text.

The report's section "Corrections by the independent review" lists them.

Not checked at source:

- the JAMS text;
- Chu–Kang Theorem 1.6, where ScienceDirect returned HTTP 403, so /117 rests on the extraction's reading of the abstract;
- GMS03 I §5 and KMRT 18.15/28.15.

These are the open `published-version` gap and the `cited-input-proofs` gap that was transferred to the Part II designs.
