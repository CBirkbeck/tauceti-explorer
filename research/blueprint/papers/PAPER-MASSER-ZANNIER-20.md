# PAPER-MASSER-ZANNIER-20: Abelian varieties isogenous to no Jacobian

David Masser and Umberto Zannier, *Abelian varieties isogenous to no Jacobian*, [Annals of Mathematics 191 (2020), no. 2, 635–674](https://doi.org/10.4007/annals.2020.191.2.7).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1121). Status: **complete**. Every missing item is routed once.

The current [machine-readable extraction](PAPER-MASSER-ZANNIER-20.result.json)
has 74 items (3 library, 11 planned, 60 missing), nine routes, 19 prerequisite
entries and 14 source diagnostics. Its original extraction and independent
review added the counting, isogeny, moduli-descent and CM-orbit inputs. The
verified fixes below supersede their earlier LD.6 ownership and supplementary
torsion/analytic-hypersurface claims. Extraction completeness records the
inventory and routing; it does not mean that the gated claims are proved.

## Verified fixes (FIX-RT-PAPER-MASSER-ZANNIER-20)

Codex, session `codex-J6LwjP`, issue #5500, 1 October 2026, applies all three
findings confirmed by [the independent verifier](../reviews/REV-RT-PAPER-MASSER-ZANNIER-20.md).
The main algebraic hypersurface-avoidance and counting theorems retain their
statements and numerical field bounds.

1. **Interpolation versus global analytic closure.** Item /66 now ends at
   the compact real-analytic parametrized image K=J(F([1,2])) meeting every
   algebraic isogeny class. Its Newton series and positivity construction
   remain. A globally closed pure analytic hypersurface of A_g is algebraic
   for g≥2: its dimension G−1 exceeds the Satake boundary dimension G−g,
   so Remmert–Stein extends its closure and Chow makes it algebraic.
   Item /74 records this obstruction and gates a separate local replacement:
   specify an open ambient U containing K and a relatively closed pure
   codimension-one W_U there, or an explicitly germwise/nonclosed statement,
   and prove it before enabling it. Compactness does not allow equations on
   different domains to be multiplied without extensions or compatibility.
   This fix does not claim that local gluing has been proved. E13 records
   the published global-endpoint error; the elliptic construction is unchanged.
2. **Supplementary rational 16-torsion.** Items /56 and /58 no longer fold
   this assertion into the theta degree estimate or Theorem 1.1. New item
   /73 records it as unresolved, with E14 documenting the missing arithmetic
   descent. Distinguish the theta coordinate field, a field carrying a
   principally polarized model, and the field splitting its torsion. Import
   arithmetic fine-level moduli and the universal family from PELModuli M2/M5,
   torsion and the perfect equivariant Weil pairing from AbelianSchemes A3,
   and analytic comparison from A5. The pairing forces μ_16 into a field
   defining full rational 16-torsion; the theta-coordinate construction
   permits real fields. Cyclotomic containment is necessary and does not
   suffice to split the entire torsion representation. Item /73 tracks
   every comparison-cover or residue-field extension in D(Ã,Ψ) and the
   final field bound. No proof that these extensions fit the advertised
   bound, or that adjoining ζ_16 alone suffices, is supplied here.
3. **One functional-transcendence supplier.** Items /19–/23 now belong to
   the already accepted `LogicAndDefinabilityPartII`, with its exact existing
   parent and title. They are missing shared foundations, not completed
   library work or targets of the existing LD.6 layer. Items /16–/18 and
   /38 stay with LD.6. The new route 9 binds genus-one and Siegel adapters
   and one shared Ax–Lindemann deduction. Import only early LD.6 counting
   into that supplier; its outputs feed arithmetic applications afterwards.
   If the owner design needs a stage split, request it there instead of
   importing all of LD.6 back into its own supplier.

The fixes add APIs and tests for the changed definitions/constructions and
the arithmetic and analytic adapters. Two supplier `requests` bind the general
singular-space Remmert–Stein theorem at ComplexComparisonPartII C4 and the
exact Siegel boundary dimension at ShimuraCompactifications C5, which their
current contracts do not explicitly export. Independent fix review remains separate.

## Sources read

- **Original extraction read:** the published version, freely available from the Annals site, read in full: 40 pages (pp. 635–674), with every proof and the references. SHA-256 8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60, fetched 29 September 2026.
- **Version search:** the original 29 September search found no arXiv version; the current fix uses the published text and claims no full version collation.
- **Errata:** the Annals article page lists no erratum, and Crossref records no update of the DOI.
- **Page images:** all five misprints, and the formulas where the text layer was ambiguous (pp. 653, 656, 661, 666, 669), were checked on page images.

The fix worker reproduced the published hash, read selected pp.637,650,663 and
665–670, and viewed pp.666,669,670 as images. Comparison reads were Le Fourn
(2019), [pp.180–182, especially 6.4–6.6](https://msp.org/ant/2019/13-1/ant-v13-n1-p04-s.pdf),
and Demailly, [Chapter II pp.118,121, (8.7)/(8.10)](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf).
The separate hashes and bounded scopes are in `sourceVersions`. Journal,
Crossref and targeted title/author correction searches revealed no correction
on 1 October; the author-profile checks are also scoped in E13/E14. No whole
paper reread by this fix worker or full source collation is claimed.

## What the paper proves

**Main theorems.** Let G = g(g+1)/2 = dim A_g.
- **Theorem 1.1.** For every algebraic hypersurface H of A_g with g ≥ 2, some A in A_g is Hodge generic and isogenous to nothing in H. A is defined over an extension of Q of degree at most 2^{16g⁴}. The supplementary torsion claim is separate and unresolved (/73, E14).
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
- **§5.4.** The dense set, the CM count (Tsimerman's Galois lower bound), the compact real-analytic interpolation image meeting algebraic isogeny classes, and the genus-4 Igusa form. Products lie in the closure of the Jacobian locus. The global closed transcendental hypersurface assertion is ruled out, and a local replacement is gated.

## What the atlas already has

**Library (3 items).**
- Mathlib: the upper half-plane with the SL₂(Z) fundamental domain, and the Frattini subgroup.
- Tau Ceti: IsIsogeny.

**Existing planned suppliers.**
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
  - André's CM-pairs theorem;
  - downstream applications using independent orbit suppliers.
- Definable uniformization, weakly special geometry and functional transcendence are shared missing foundations of LogicAndDefinabilityPartII, not completed library work. The CM orbit bound imports ComplexMultiplicationAndExplicitReciprocityPartII.
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

1. **Source of LogicAndDefinabilityInNumberTheory LD.6** (items /16–/18 and /38).
   O-minimality, Pila–Wilkie, uniform blocks, and the source-scoped André
   application remain here. Functional transcendence is supplied by route 9.
2. **Source of ShimuraData D1** (item /4).
   The Mumford–Tate definition of Hodge genericity stays upstream. Weakly
   special subvarieties and their A_g-specific consequences belong to route 9.
3. **Source of ArithmeticGaloisRepresentations R01.6** (item /5).
   The definition of Galois/p-Galois genericity belongs here; Serre, Deligne,
   Cadoret and Pink’s image results remain downstream in route 7, as corrected
   by the independent review.
4. **Source of InverseGaloisAndArithmeticFundamentalGroups [IG.2]** (1 missing). The Frattini form of Hilbert irreducibility and Cohen's thin-set count.
5. **Source of ModularCurvesPartII [R13.4]** (1 missing). The modular polynomials Φ_m.
6. **Part II `FaltingsFinitenessAndIsogenyTheoremsPartII`**.
   - Title: "Faltings finiteness, semisimplicity and isogeny theorems, Part II: Quantitative isogeny estimates". Parent: FaltingsFinitenessAndIsogenyTheorems. Area: `arithmeticgeometry`.
   - **Shared id.** PAPER-TSIMERMAN-18 proposes the same id for the Masser–Wüstholz factorization estimates. This paper adds:
     - the Rosati length and discriminant D(A);
     - the elliptic isogeny estimate (Lemma 2.2, Gaudron–Rémond);
     - the cusp-form lower bound at algebraic points;
     - the endomorphism estimate (Lemma 4.4);
     - the isogeny estimate for abelian varieties.
   - **Why this Part II:** these theorems share one transcendence method and one set of inputs, so they belong in one roadmap.
7. **New roadmap `AbelianVarietiesIsogenousToNoJacobian`**.
   - Title: "Abelian varieties isogenous to no Jacobian (Masser–Zannier)". Area: `arithmeticgeometry`.
   - **Contents:**
     - the Jacobian locus and Igusa's fundamental-domain estimates;
     - Lemmas 2.1, 3.1–3.3, 4.1–4.3 and 5.1–5.5;
     - the blocks argument;
     - Λ-forms, Igusa's order bound, theta constants and the degree bound 2^{16g⁴−1};
     - Theorems 1.1, 1.3, 1.5 and 1.7 with Corollaries 1.2, 1.4 and 1.6;
     - the §3.3 construction and §5.4 interpolation image, with the local analytic replacement and supplementary rational-torsion descent explicitly gated;
     - the Igusa form and genus-4 products.
   - **Why a new roadmap:** nothing in the atlas studies isogeny classes in A_g against a hypersurface. It imports the suppliers of routes 1–6 and 8–9, the heights, PELModuli and the Tau Ceti JacobianChallenge, and does not re-plan them.

8. **Shared ComplexMultiplicationAndExplicitReciprocityPartII** (item /65).
   The CM-height/Galois-orbit supplier remains as added by the review.
9. **Shared LogicAndDefinabilityPartII** (items /19–/23).
   Parent: LogicAndDefinabilityInNumberTheory. Title: *Logic, definability,
   valued fields and motivic integration, Part II: functional transcendence
   and Ax–Schanuel for Shimura varieties*. Reuse the accepted
   PAPER-MOK-PILA-TSIMERMAN-19 route. The binding brief supplies definability
   on fundamental sets, weakly special bi-algebraicity, and the genus-one
   and Siegel specializations of one Ax–Lindemann deduction. Points remain
   weakly special; the Hodge-generic contradiction needs a positive-dimensional
   weakly special locus inside a proper hypersurface. This removes the old
   competing executable LD.6 brief without creating a whole-stage cycle.

## Source issues (`sourceIssues` E1–E14)

The independent review confirmed original E1–E5 and added E6–E12; their complete records remain in the JSON and its review report.

E1–E12 retain the original reviewed records. New E13 affects the supplementary global analytic statement; E14 affects the proof of the supplementary torsion claim. Neither finding disproves the main Theorem 1.1.

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

- **E13** (§5.4, pp.668–670): the global closed analytic hypersurface
  cannot be transcendental for g≥2. Retain /66 and the gate in /74.
- **E14** (p.637 after Theorem 1.1; end of §5.2, p.666): the geometric
  congruence subgroup does not by itself descend full rational 16-torsion
  over the coordinate field. The arithmetic comparison and final degree
  obligations are isolated in /73.

**Originally checked and found correct:**
- the constants of Lemma 2.1 and the bound on Σψ(m)² in Lemma 3.2;
- the exponents of Lemma 3.3 and the condition ε < 2/21;
- (33)–(36), with λ ≥ 4 and ε < 1/λ;
- the product formula for U_g and V_g;
- the inequality 2(G + 1)!(32g/(π√3)·512^{2g²}c_g)^G ≤ 2^{16g⁴−1}, checked numerically for 2 ≤ g ≤ 40 (it fails at g = 1, which is outside scope).

## Prerequisites not yet covered

Nineteen entries after the independent review; the following lists the original sixteen:
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
- The original citation checks were historical evidence. The fix reread the reviewed M2/M5/A3/A5 audit and actual LD.6/owner contracts, searched the pinned libraries for the shared foundations, and read Tau Ceti’s Cholesky factorization/continuity statements at f790474. No new library credit is asserted.

Current fix validation: the paper and intake checks pass, source/version schemas
pass, and preservation checks retain all 72 original ids, twelve original source
diagnostics, 19 prerequisites and the main endpoint statements. Two planned
supplier statuses (/19,/21) are corrected to missing, /66 is narrowed to the
interpolation construction, and /73–/74 plus route 9 are added. Exact finite
regressions check boundary dimensions, symplectic pairing values and degree
bookkeeping. No Lean file is requested or compiled.
