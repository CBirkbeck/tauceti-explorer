# PAPER-FENG-YUN-ZHANG-24: Higher Siegel–Weil formula for unitary groups: the non-singular terms

Tony Feng, Zhiwei Yun and Wei Zhang, *Higher Siegel–Weil formula for unitary groups: the non-singular terms*, [Invent. Math. 235 (2024), no. 2, 569–668](https://doi.org/10.1007/s00222-023-01228-y); arXiv [2103.11514](https://arxiv.org/abs/2103.11514).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1230). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-FENG-YUN-ZHANG-24.result.json](PAPER-FENG-YUN-ZHANG-24.result.json): 34 items after the independent review, which added item 34 (originally 33: 5 planned, 28 missing), 3 routes, 20 prerequisite entries and 28 recorded source issues (E1–E3 from the extraction, E4–E28 from the independent review).

**Source.** The article is open access (CC BY 4.0), so the **published version** was read in full (100 pp., SHA-256 `f4ebe96f…3155fcd`, fetched 2026-09-22); locators are its journal pages. **arXiv v4** (29 November 2023) carries exactly the same 112 numbered statements and the same reading at each recorded misprint.

## What the paper proves

**Setting.** X is a smooth proper geometrically connected curve over k = F_q (q odd), ν : X′ → X an étale double cover with involution σ (X′ = X ⊔ X allowed). Sht^r_{U(n)} is the moduli of Hermitian shtukas with r legs: chains F_0 ⇢ F_1 ⇢ ⋯ ⇢ F_r ≅ ^τF_0 of rank n Hermitian bundles on X′, related by elementary modifications at the legs. It plays the role of a Shimura variety.

**Theorem 1.1.** For a rank n bundle E on X′ and an injective Hermitian map a : E → σ^*E^∨,

  (1/(log q)^r)·(d/ds)^r|_{s=0}( q^{ds}·Ẽ_a(m(E), s, Φ) ) = deg[Z^r_E(a)],  d = −χ(X′, E),

where Ẽ_a is the normalized a-th Fourier coefficient of the Siegel–Eisenstein series on the quasi-split U(2n), and [Z^r_E(a)] is a virtual 0-cycle on the special cycle Z^r_E(a) ⊆ Sht^r_{U(n)}.

The identity holds **for every r**, whatever the vanishing order: r = 0 is the classical Siegel–Weil formula, r = 1 the analogue of the arithmetic Siegel–Weil formula (the Kudla–Rapoport conjecture), and this is the first higher-derivative formula for groups of arbitrary rank.

**Method (the three steps of §1.2).** Both sides come, through the sheaf-to-function dictionary, from graded perverse sheaves on the stack Herm_{2d}(X′/X) of Hermitian torsion sheaves of length 2d, and the theorem becomes an identity of virtual representations of the Weyl group W_d = (Z/2Z)^d ⋊ S_d.
- **Analytic side (§§2–5).** Non-singular Fourier coefficients are local Siegel series (Theorem 2.8); the Cho–Yamauchi formula — extended here to the split case (Theorem 2.3) — shows they depend only on coker(a). A Springer theory over the curve, for Coh_d(X) after Laumon (§3) and its Hermitian analogue on Herm_{2d}(X′/X) with local model [o_{2d}/O_{2d}] (§4), geometrizes them: Den(T, Q) = Tr(Fr, K^{Eis}_d(T)_Q) (Theorem 5.3).
- **Geometric side (§§6–11).** Special cycles Z^r_E(a) are defined after Kudla–Rapoport (§7). Their dimension exceeds the virtual one, so the class is built from corank-one cycles (which do have the expected dimension, §9) and a **good framing**, and then shown to be intrinsic by redoing the intersections in a different order — linear intersections first, the Frobenius one last — through **Hitchin-type moduli stacks** M(n, n) (§§8, 10). The Hitchin fibration is small over Herm_{2d} through the Lagrangian stack, and a Lefschetz trace formula for Hitchin shtukas gives deg[Z^r_E(a)] = Σ_i(d−2i)^r Tr(Fr, Spr^{Herm}_{2d}[ρ_i]_Q) (§11).
- **Comparison (§12).** K^{Int}_d ≅ K^{Eis}_d, which reduces to the W_d-identity χ_d = Σ_j(−1)^j Ind^{W_d}_{S_{d−j}×W_j}(1 ⊠ sgn_j) (Lemma 12.4). §12.3 spells out the split case against the Yun–Zhang GL_n picture.

## What the atlas already has

- **Library.** Nothing: no moduli of bundles or shtukas over a curve, no perverse sheaves, no Chow groups of stacks, no local densities.
- **Planned** (5 items): GlobalShtukasAndFunctionFieldLanglands GS.0–GS.2 (Bun_G, Hecke stacks and multi-leg shtuka stacks for a general — possibly nonsplit — group scheme over the curve, hence Bun_{U(n)}, Hk^r_{U(n)}, Sht^r_{U(n)}); SchemeAndStackFoundations SF.5 (Chow groups, refined Gysin maps, intersection products); EtaleDualityAndPerverseSheaves EDC.5 and EDC.7 (perverse t-structure, intermediate extension, purity and the decomposition theorem); EDC.8 with WeightsInEtaleCohomology R34.1 (cohomological correspondences, trace classes, Frobenius conventions).
- **Not in the atlas.** Special cycles on shtuka moduli; the Hitchin-type stacks of this paper; global Springer theory on Coh_d(X) and Herm_{2d}(X′/X); Hermitian local densities; Siegel–Eisenstein series over function fields. In particular EndoscopicTransferAndUnitaryTraceComparison ET.2b plans Ngô's Hitchin fibration and affine Springer fibres for reductive groups — a different construction from the moduli of torsion sheaves used here.

## Routes

1. **New Part II of GlobalShtukasAndFunctionFieldLanglands: `ShtukaSpecialCyclesAndHigherSiegelWeil`** (24 items) — "…, Part II: special cycles on shtuka moduli and the higher Siegel–Weil formula". It takes the Springer theory of §§3–4, the density sheaf of §5, the special cycles and their dimension theory (§§7, 9), the Hitchin-type stacks and the intrinsic cycle class (§§8, 10), the trace formula and the sheaf K^{Int}_d (§11), and the matching with Theorem 1.1 and the split case (§12). The brief says to plan it together with the Yun–Zhang PGL_2 theory it generalizes (whose Octahedron Lemma and Hecke-action computation it imports), and to import GS.0–GS.2, SF.5, EDC.5/7/8 and R34.1 rather than re-planning them.
2. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.3** (2 items): Hermitian local densities, including the split algebra F′ = F × F, and the Cho–Yamauchi formula for the normalized local Siegel series with its functional equation. PAPER-LI-ZHANG-22-B and PAPER-LI-LIU-22 route the same family of densities there.
3. **Source of FunctionFieldArithmetic FA.6** (2 items): the Siegel–Eisenstein series of the quasi-split unitary group over a function field — the everywhere unramified section (Remark 2.1), the Fourier expansion against the residue pairing, the factorization into local Whittaker functions, and their identification with local Siegel series (Lemma 2.7, Theorem 2.8).

## Source issues (`sourceIssues` E1–E3)

All three are misprints, present in the published version and in arXiv v4; no mathematical error or gap was found.

- **E1.** Definition 6.6(1)–(2), p. 616: the graphs are written "Γ_{x′_i} ⊂ X × S" (they lie in X′ × S, as in Definition 6.3(1)), and the chain of bundles is written "F_0, …, F_n" instead of F_0, …, F_r — n is the rank, r the number of legs.
- **E2.** §12.3, p. 665: the same index slip, "F_0, …, F_n ∈ Bun_{GL_n}(S)", in the recollection of the Yun–Zhang moduli of GL_n-shtukas.
- **E3.** §12.3, p. 665: "Here see (2.2) for m_v(t_v; T)" should point at Definition 2.2 (the polynomials m(a; T)); the display (2.2) is the factorization of a Fourier coefficient into local Whittaker functions.

**Also checked:**
- **Lemma 12.4**, the representation-theoretic heart of the comparison, was verified by direct character computation in the hyperoctahedral group for d = 1, 2, 3, 4 — and the computation pins down the reading of sgn_j: it must be the inflation to W_j of the sign character of S_j (with the product-of-signs character χ_j the identity fails at every d tested).
- **The decomposition (11.5)**, Ind^{W_d}_{S_d}1 = ⊕_{i=0}^dρ_i with ρ_i = Ind^{W_d}_{(Z/2)^d⋊(S_i×S_{d−i})}(χ_i ⊠ 1), together with the irreducibility of each ρ_i, likewise for d ≤ 4.
- **The normalizations**: d = −deg E + n deg ω_X = −χ(X′, E) = (deg E^∨ − deg E)/2 with g′ = 2g−1 and deg ω_{X′} = 2 deg ω_X (Theorem 1.1 against Definition 8.7); the renormalization (12.1) inverts Theorem 2.8 exactly; and Corollary 11.9's three expressions agree, since q^{ds}K^{Int}_d(q^{−2s}) = Σ_i Tr(Fr, Spr^{Herm}_{2d}[ρ_i]_Q)q^{(d−2i)s}.
- **Consistency of the two vanishing statements**: Sht^r_{U(n)} = ∅ for odd r (Lemma 6.7) and the evenness of the analytic side (Corollary 11.14).
- Every internal cross-reference, mechanically, against the statement it names: only E3.
- Crossref for the article and the DOIs of the prerequisites: no correction notice or update relation.

## Prerequisites not yet covered

V. Lafforgue (shtukas for reductive groups); Yun–Zhang I and II (the PGL_2 model, the Octahedron Lemma, the Hecke-action computation); Laumon (the Springer sheaf on Coh_d(X)); Kudla–Rapoport I and II; Li–Zhang (JAMS 2022) and Cho–Yamauchi (local densities); Weil and Siegel (the classical formula); Kudla 1997 (Fourier coefficients and Whittaker functions); Li–Liu I and II; Kresch and Fulton (Chow groups of stacks, refined Gysin maps); Heinloth and Varshavsky (Bun_G and moduli of F-bundles); Borho–MacPherson and Hotta–Springer (Springer theory); Hironaka (the functional equation of the Hermitian Siegel series); the companion paper Feng–Yun–Zhang, arXiv:2110.07001 (cycle classes for all ranks and singular a, and the modularity conjecture); Bruinier–Howard–Kudla–Rapoport–Yang; Wei 2019; Garcia–Sankaran and Liu 2011; Mumford (theta characteristics, for the Prym argument).

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FENG-YUN-ZHANG-24.result.json`: ok.
- `python3 research/blueprint/intake.py check-files …`: ok.
- Every missing item appears in exactly one route, and no route takes a planned item.
- The cited stages (GS.0–GS.2, SF.5, EDC.5, EDC.7, EDC.8, R34.1, GN.3, FA.6) and the parent were checked against `data/atlas.json`, every accepted restructure in `data/restructure/` and `data/roadmap-retirements.json`: none is restructured or retired. Library verdicts come from `data/library-coverage.json`.
- The new Part II id was checked free against every existing extraction, `research/blueprint/reserved-ids.json` and the atlas data.
- The character computations used scripts in the worker's scratch directory; no Lean was written, as none is a deliverable of this job.

## Independent review corrections (REV-PAPER-FENG-YUN-ZHANG-24, 23 September 2026)

**What was read.** The published article is open access (CC BY) at Springer, but Springer's bot protection blocked the download here. The eScholarship copy is the author version.
- The review therefore read arXiv v4, which has the same SHA-256 as the extraction's, in full.
- It checked every statement, section and equation number against arXiv v4.
- It could not re-check the extraction's journal-page locators.

**Method.** Three read-only helper agents split the paper (§§1–5; §§6–9; §§10–12). They checked densities and character identities by computer, and dimension counts by hand and script. The reviewer checked every finding at the page image or in the text.

**Routes and statuses.** All three routes are accepted, and the Part II brief gets review additions. Statuses are unchanged: every planned stage id exists.

**Recorded issues.** E1–E3 are confirmed.

The line above saying that no mathematical error or gap was found is superseded by the following.

**New issues (E4–E28).**
- **E22 (error in a stated result).** Lemma 10.5's claim that u_1 is étale fails for some very good framings.
  - Example: n = 2, with both points over a split x in Div(s). The fibre then contains a P¹ of self-dual lattices.
  - The proof's isomorphism M_{d,e} ≅ M_d ×_{A_d} A_{d,e} fails even for n = 1.
  - The maps actually used later, w_1 and h_1, are étale by a corrected argument through divisors with disjoint support. So Lemma 10.7, Theorems 10.1–10.2 and Theorem 1.1 stand.
- **Proof gaps, each with a short repair:**
  - E13: the proof of Lemma 6.7 fails for X′ = X_{k′}, where Frobenius swaps the components, so the Lang map lands in the even components.
  - E19: Lemma 7.6's reduction to κ̄ fails for imperfect κ.
  - E18: the k^×-torsor claim in the proof of Proposition 7.5.
- **False sentences that are not used later:**
  - E8: Remark 4.8's d′.
  - E9: (X′_{2d})^σ ≅ X_d needs ν étale.
  - E11: the middle map of (4.1).
  - E20: the "local complete intersections" claim at the start of §9.
  - E21: Proposition 9.5(1) says "partition" for a cover.
  - E27: a display in the proof of Lemma 12.4.
- **Misprints.** The rest, including:
  - E4: Remark 2.4's weight m(t′(Q′)) should be m(t′(Q′^⊥/Q′)); read literally it gives wrong densities.
  - E14: the sign of the Lemma 6.7 square.
  - E15: ν^*ω_{X′}^{1/2} for ν^*ω_X^{1/2}.
  - E26: sgn_j for sgn̄_j in Proposition 12.3.
  - Bundles of slips in §§2–5, §§6–9, §10 and §11.

None affects Theorem 1.1.

**Items corrected in place:**
- **Item 15.** The modification convention was reversed: the paper has lower at x′_i and upper at σ(x′_i).
- **Item 14.** F_n = (ν^*ω_X^{1/2}, h_1)^{⊕n}, the ω_{X′}-dual convention, and dim Bun_{U(n)} = n²(g−1).
- **Item 17.** The dimension bounds of Proposition 9.1 are placed correctly, with n ≥ 2 and Claim 9.2.
- **Item 23.** Lemma 10.5 is now stated for w_1 and h_1 only.
- **Items 24, 22.** Proposition 10.9 needs a representable map, and Lemma 10.10 holds on Z^♡. §10.5 treats the geometrically disconnected cases, and Theorem 10.2 needs X′ geometrically connected.
- **Items 26, 29.** The definition of ρ_i, and sgn̄_j.
- **Items 5, 12.** The weight in Remark 2.4 corrected, the split/unramified hypothesis, and the global Den(T, Q).
- **Other items.** 1, 4, 6, 8, 16, 18, 19, 25, 31 and 33, with smaller fixes.
- **Locators.** Items 13, 15, 16, 17 and 27 (statement and section numbers).
- **New item 34 (missing, Part II).** The U(n)-specific Lemmas 6.7 and 6.9, split off from item 15. They are the dimension input for §§7–8.
