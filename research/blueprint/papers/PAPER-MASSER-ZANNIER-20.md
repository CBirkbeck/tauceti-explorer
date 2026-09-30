# PAPER-MASSER-ZANNIER-20: Abelian varieties isogenous to no Jacobian

David Masser and Umberto Zannier, *Abelian varieties isogenous to no Jacobian*, [Annals of Mathematics 191 (2020), no. 2, 635–674](https://doi.org/10.4007/annals.2020.191.2.7).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1121). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-MASSER-ZANNIER-20.result.json](PAPER-MASSER-ZANNIER-20.result.json). It has:
- 68 items: 3 library, 12 planned, 53 missing;
- 7 routes: one new roadmap, one Part II (shared with PAPER-TSIMERMAN-18) and five sources of existing layers;
- 16 prerequisite entries;
- 5 recorded misprints.

After the independent review (REV-PAPER-MASSER-ZANNIER-20, research/blueprint/reviews/REV-PAPER-MASSER-ZANNIER-20.md), the extraction has 72 items (3 library, 13 planned, 56 missing), 8 routes, 19 prerequisite entries and 12 recorded mistakes, all confirmed. The review corrected it in place:
- **Routes 2 and 3 are reshaped.**
  - Weakly special subvarieties (items 22, 23) need A_g, which is downstream of ShimuraData D4, so they moved to LD.6. The Mumford–Tate definition (item 4) stays in D1.
  - Serre's open image, Deligne's monodromy and the Cadoret–Pink implications (items 24, 25, 6) need layers downstream of R01.6, so they moved to route 7. The definition of Galois genericity (item 5) stays in R01.6.
- **Two status changes.**
  - Item 21, Ax–Lindemann for A_g, is planned in LD.6, as the accepted review of PAPER-TSIMERMAN-18 classes it.
  - Item 65, the Galois-orbit bound for CM points, is missing and joins the accepted Part II "Complex multiplication and explicit reciprocity, Part II: CM heights and Galois-orbit bounds" (new route 8).
- **Four items added.**
  - Quotients by finite subgroups (item 69, planned in A3).
  - The degree and Rosati-length inequalities behind Lemma 4.2 (item 70, route 6).
  - Degrees under generic projections (item 71).
  - Fields of definition of bounded degree over the field of moduli (item 72).

  Items 71 and 72 go to route 7.
- **Seven new findings, E6–E12.**
  - A gap in the §3.3 sketch (E10).
  - The strict inequality Lemma 5.5 needs (E11).
  - The D(A) display, which repeats E1 in a worse form (E9).
  - Four other misprints.

The sections below describe the extraction as submitted; the review's changes are listed in its report.

## Sources read

- **The published version**, freely available from the Annals site, read in full: 40 pages (pp. 635–674), with every proof and the references. SHA-256 8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60, fetched 29 September 2026.
- **No arXiv version** exists; a web search on 29 September 2026 found none.
- **Errata:** the Annals article page lists no erratum, and Crossref records no update of the DOI.
- **Page images:** all five misprints, and the formulas where the text layer was ambiguous (pp. 653, 656, 661, 666, 669), were checked on page images.

## What the paper proves

**Main theorems.** Let G = g(g+1)/2 = dim A_g.
- **Theorem 1.1.** For every algebraic hypersurface H of A_g with g ≥ 2, some A in A_g is Hodge generic and isogenous to nothing in H. A is defined over an extension of Q of degree at most 2^{16g⁴}, which also defines its points of order 16.
- **Corollary 1.2.** For g ≥ 4, some principally polarized abelian variety over such a field is isogenous to no Jacobian. This answers Katz–Oort and Chai–Oort; Tsimerman had shown existence over Q̄ with CM.
- **Theorem 1.3.** Take a finite cover Ã → A_g and a finite map Ψ : Ã → A^G, and set D = [F̃ : Q][F_Ψ : Q]D_Ψ.
  - For γ < 1/2, at most C N^{G−γ} of the n ∈ [1, N]^G fail. A failure is a point of Ψ⁻¹(n) that is not defined over a field of degree at most D, or that is isogenous to a point of H.
  - The rest can be taken Galois generic.
  - For g odd or g = 2, 6, any γ < 1 works.
- **Corollary 1.4.** There is a euclidean-dense set of pairwise non-isogenous examples.
- **Theorem 1.5 and Corollary 1.6.** Rational versions, if A_g (g ≤ 5) is unirational over Q.
- **Theorem 1.7.** The elliptic analogue. For a real algebraic curve C in the j-plane, at most C N(log N)^{10} of the curves E_{n1+in2} (1 ≤ n1, n2 ≤ N) have CM or are isogenous to a curve with invariant in C.

**How the proof goes.**
- **Setup.** Suppose A_n is isogenous to Ã in H.
  - The endomorphism estimate (Masser–Wüstholz) bounds an isogeny f : A_n → Ã and its partner f̃ in terms of the degree D̃ of a field of definition of Ã (Lemmas 4.2, 5.2).
  - Lemmas 4.1 and 4.3 turn this into integer matrices ρ_σ that move a reduced period matrix τ_n of A_n to τ̃_σ of each Galois conjugate Ã^σ. Their entries are bounded polynomially in D̃.
- **Counting.** The ρ_σ are integral points on a definable family W_τ. The algebraic part of W_τ is everything, so plain Pila–Wilkie is useless. Pila's blocks theorem, uniform in τ, is used instead.
- **Positive-dimensional blocks.** A positive-dimensional block would give a semialgebraic curve in J⁻¹(H). By Ax–Lindemann for A_g (Pila–Tsimerman) it would lie in a weakly special K ⊂ H through the Hodge generic Ã^σ, which Gao's lemma rules out.
- **Conclusion.** Hence D̃ ≪ 1. The isogeny estimate then bounds the isogeny degree, and a subgroup count bounds the candidates.
- **Galois genericity.** Serre's Frattini form of Hilbert irreducibility, with Cohen's count of thin sets, makes almost all A_n Galois generic. Masser's specialisation theorem gives the stronger exponent for g odd or 2, 6.
- **The field degree.** Siegel Λ-forms, Igusa's order bound and a Siegel lemma for theta constants of level Γ(16, 32) bound the degree of the theta model V_16 by 2^{16g⁴−1}.
- **§5.4.** The dense set, the CM count (Tsimerman's Galois lower bound), a transcendental analytic hypersurface meeting every isogeny class, and the genus-4 Igusa form: products lie in the closure of the Jacobian locus.

## What the atlas already has

**Library (3 items).**
- Mathlib: the upper half-plane with the SL₂(Z) fundamental domain, and the Frattini subgroup.
- Tau Ceti: IsIsogeny.

**Planned (12 items).**
- A_g: PELModuli M2, M5.
- The Siegel datum: ShimuraData D5.
- CM abelian varieties: ShimuraVarieties V5.
- The analytic j-function: ModularCurvesPartII R12.1.
- Heights:
  - Weil heights, DT.0;
  - Faltings height, Arakelov R35.3;
  - its variation under isogeny, R35.4 and FaltingsFiniteness R28.2.
- LogicAndDefinabilityInNumberTheory LD.6:
  - o-minimal definability;
  - Pila–Wilkie;
  - definability of the uniformisation;
  - André's CM-pairs theorem;
  - Galois-orbit bounds.
- Minkowski's second theorem: GeometryOfNumbers GN.1.

**Missing.**
- Pila's blocks, and Ax–Lindemann for j² and for A_g.
- Hodge genericity, weakly special subvarieties and Gao's lemma.
- Galois genericity and open images.
- The Frattini form of Hilbert irreducibility with Cohen's count.
- Modular polynomials.
- The Masser–Wüstholz estimates for abelian varieties.
- All of the paper's own machinery.

## Routes

1. **Source of LogicAndDefinabilityInNumberTheory [LD.6]** (3 missing, 5 planned listed).
   - Pila's blocks in families.
   - No algebraic arcs in F² ∩ (j²)⁻¹(C) for non-modular C.
   - Ax–Lindemann for A_g.

   The planned o-minimal items are listed with it.
2. **Source of ShimuraData [D1, D4]** (3 missing).
   - Hodge generic points.
   - Weakly special equals bi-algebraic (Ullmo–Yafaev).
   - Gao's lemma: a weakly special subvariety through a Hodge generic point is a point or A_g.
3. **Source of ArithmeticGaloisRepresentations [R01.6]** (4 missing).
   - Galois and p-Galois generic, with the Cadoret and Pink implications.
   - Serre's open image for End = Z when g is odd or 2, 6.
   - Open monodromy of the universal family (Deligne).
4. **Source of InverseGaloisAndArithmeticFundamentalGroups [IG.2]** (1 missing). The Frattini form of Hilbert irreducibility and Cohen's thin-set count.
5. **Source of ModularCurvesPartII [R13.4]** (1 missing). The modular polynomials Φ_m.
6. **Part II `FaltingsFinitenessAndIsogenyTheoremsPartII`** (5 missing).
   - Title: "Faltings finiteness, semisimplicity and isogeny theorems, Part II: Quantitative isogeny estimates". Parent: FaltingsFinitenessAndIsogenyTheorems. Area: `arithmeticgeometry`.
   - **Shared id.** PAPER-TSIMERMAN-18 proposes the same id for the Masser–Wüstholz factorization estimates. This paper adds:
     - the Rosati length and discriminant D(A);
     - the elliptic isogeny estimate (Lemma 2.2, Gaudron–Rémond);
     - the cusp-form lower bound at algebraic points;
     - the endomorphism estimate (Lemma 4.4);
     - the isogeny estimate for abelian varieties.
   - **Why this Part II:** these theorems share one transcendence method and one set of inputs, so they belong in one roadmap.
7. **New roadmap `AbelianVarietiesIsogenousToNoJacobian`** (36 missing).
   - Title: "Abelian varieties isogenous to no Jacobian (Masser–Zannier)". Area: `arithmeticgeometry`.
   - **Contents:**
     - the Jacobian locus and Igusa's fundamental-domain estimates;
     - Lemmas 2.1, 3.1–3.3, 4.1–4.3 and 5.1–5.5;
     - the blocks argument;
     - Λ-forms, Igusa's order bound, theta constants and the degree bound 2^{16g⁴−1};
     - Theorems 1.1, 1.3, 1.5 and 1.7 with Corollaries 1.2, 1.4 and 1.6;
     - the §3.3 and §5.4 constructions;
     - the Igusa form and genus-4 products.
   - **Why a new roadmap:** nothing in the atlas studies isogeny classes in A_g against a hypersurface. It imports the suppliers of routes 1–6, the heights, PELModuli and the Tau Ceti JacobianChallenge, and does not re-plan them.

## Source issues (`sourceIssues` E1–E5, all misprints)

(The independent review confirmed all five and added E6–E12; see its report.)

None affects a stated result.

- **E1** (§4, (22), p. 653): "ℓ(v)² = tr(κyκ̄ᵗy⁻¹) = tr(ρερᵗε⁻¹)" is off by a factor 2.
  - ρ ⊗ C ≅ κ ⊕ κ̄, so tr(ρερᵗε⁻¹) = 2 tr(κyκ̄ᵗy⁻¹).
  - For v = [n] on the curve with τ = i, the two sides are n² and 2n².
  - The paper's values ℓ(n) = √(2g)n and ℓ(v₀) = √(2g) use the rational form. The constants of Lemma 4.1 absorb the factor.
- **E2** (proof of Lemma 4.2, p. 656): "define v by (50)" should cite (27). (50) is the Cholesky bound of §5.4.
- **E3** (§5.1, p. 661): "Thus (40) holds, and (23) follows from (42)" should read "(41) follows from (42)". (23) are the fundamental-domain inequalities of §4.
- **E4** (§5.4, p. 669): "We define τ̃0 = x̃0 + i(ι + w̃0w̃0ᵗ)" should read τ̃1 = x̃1 + i(ι + w̃1w̃1ᵗ). τ̃0 was defined on p. 668.
- **E5** (§5.2, p. 666): "(G + 1)!(4eN(D + 1)^G" lacks a closing parenthesis. It should read (G + 1)!(4eN(D + 1))^G.
  - This follows from (48) with W = ND.
  - N here is κ_g n/(4π), not the counting parameter of Theorem 1.3.

**Checked and found correct:**
- the constants of Lemma 2.1 and the bound on Σψ(m)² in Lemma 3.2;
- the exponents of Lemma 3.3 and the condition ε < 2/21;
- (33)–(36), with λ ≥ 4 and ε < 1/λ;
- the product formula for U_g and V_g;
- the inequality 2(G + 1)!(32g/(π√3)·512^{2g²}c_g)^G ≤ 2^{16g⁴−1}, checked numerically for 2 ≤ g ≤ 40 (it fails at g = 1, which is outside scope).

## Prerequisites not yet covered

Sixteen entries:
- Masser–Wüstholz: isogeny estimates (Annals 1993), periods and minimal abelian subvarieties (Annals 1993), endomorphism estimates (Math. Z. 1994);
- Gaudron–Rémond (Comment. Math. Helv. 2014);
- Pila, blocks (Selecta 2009);
- Pila–Tsimerman, Ax–Lindemann for A_g (Annals 2014);
- Ullmo–Yafaev (Mathematika 2011);
- André–Corvaja–Zannier with Gao's appendix (arXiv 1802.03204);
- Peterzil–Starchenko (Duke 2013);
- Masser, specialisation of endomorphism rings (Bull. SMF 1996);
- Cadoret (IMRN 2015);
- Serre, Lectures on the Mordell–Weil theorem;
- Cohen (Proc. LMS 1981);
- Igusa, Theta Functions (1972);
- Tsimerman (JAMS 2012);
- André (Crelle 1998).

Every DOI was checked against Crossref. The paper cites André's DOI as 10.1515/crll.1998.118, which is an alias. It redirects to the canonical 10.1515/crll.1998.505.203 used here.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-MASSER-ZANNIER-20.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`, and both Part II and new-roadmap ids are absent from it.
- Every Mathlib declaration cited was confirmed at Mathlib 082e2d3, and the Tau Ceti one at Tau Ceti main.
