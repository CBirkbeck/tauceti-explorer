# PAPER-HARPAZ-WITTENBERG-16: On the fibration method for zero-cycles and rational points

Yonatan Harpaz and Olivier Wittenberg, *On the fibration method for zero-cycles and rational points*, [Annals of Mathematics 183 (2016), 229–295](https://doi.org/10.4007/annals.2016.183.1.5); arXiv [1409.0993](https://arxiv.org/abs/1409.0993).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1179). Status: **complete**. The whole paper was read, and every missing item is routed once.

The machine-readable extraction is [PAPER-HARPAZ-WITTENBERG-16.result.json](PAPER-HARPAZ-WITTENBERG-16.result.json). It has:
- 99 items: 1 library, 15 planned, 83 missing;
- 11 routes;
- 12 prerequisite entries;
- 2 recorded source issues.

**Sources read.**
- **arXiv v4** (22 June 2015, 54 pages), read in full from its TeX source.
- **The authors' final version**, the PDF on [Wittenberg's page](https://www.math.univ-paris13.fr/~wittenberg/zcfib.pdf) that his publication list gives for the Annals paper. A word-level diff shows it is identical to v4 apart from the arXiv header, two punctuation marks, one reference's page range and a postcode.
- **The Annals PDF** is paywalled. Only its two-page preview (pp. 229–230) was read, and it matches.

Locators are statement numbers, which are the same in every version, with page numbers of the 54-page final version.

## What the paper proves

**Zero-cycles (§§2–8).**
- **Theorem 8.3.** Let f : X → C be a fibration over a curve C whose geometric generic fiber has H¹(−, Q/Z) = 0 and A₀ = 0 over an algebraically closed field; for example, it is rationally connected. Then:
  - if C and the smooth fibers above the closed points of a Hilbert subset satisfy the Colliot-Thélène–Sansuc–Kato–Saito conjecture (E), so does X;
  - there is a relative version of this exactness;
  - Condition 8.1 on the fibers suffices when every fiber has a component of multiplicity 1;
  - there is a version for (E₁).
- **Corollary 8.4** extends this to bases birational to P^n × C.
- **Corollary 8.5.** Any fibration into homogeneous spaces of connected linear groups with connected stabilisers satisfies (E). This covers toric varieties, Châtelet surfaces and p-folds, del Pezzo surfaces of degree 6, and norm hypersurfaces N_{K/k}(x) = P(t) for every K and P.

**Rational points (§9).**
- **Conjecture 9.1** (locally split values of polynomials) is new.
- **Theorem 9.17 and Corollaries 9.23–9.25.** Under Conjecture 9.1, the same fibration argument gives Brauer–Manin density on the total space of any rationally connected fibration over P^n whose fibers above a Hilbert set satisfy it.
- **Known cases of Conjecture 9.1:**
  - Schinzel's hypothesis, for almost abelian extensions (Theorem 9.6);
  - small degree, by strong approximation on an auxiliary variety W (Theorem 9.11);
  - linear polynomials over Q, by Matthiesen's additive combinatorics (Theorem 9.14);
  - one cubic case, by Irving's sieve (Theorem 9.15).
- **Unconditional results:**
  - Theorem 9.28: over Q, when the non-split fibers lie over rational points;
  - Corollary 9.29: pencils of homogeneous spaces;
  - Theorem 9.31: rank at most 2.

**How the proofs work.**
- **The key idea** is to replace Dirichlet's theorem on primes in progressions, and with it all the old abelianness hypotheses, by strong approximation on affine space minus a codimension-2 subset (Lemmas 1.8 and 5.2).
- **The machinery:**
  - Wittenberg's groups Pic₊(C) and Br₊(C), with their arithmetic duality (Theorem 2.5);
  - a formal lemma for effective zero-cycles in a fixed divisor class (Proposition 3.1);
  - Harari's specialisation of the Brauer group over a Hilbert set (Proposition 4.1);
  - the core existence theorem (Theorem 5.1), with its Hilbert-set strengthening (Theorem 6.2);
  - completion arguments that pass from ĈH_{0,A} to effective cycles (§7).

## What the atlas already has

**Library.** Hensel lifting for formally smooth algebras over complete rings (Mathlib, `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`).

**Planned:**
- adelic points and the Brauer–Manin set (RP.2);
- Hilbert subsets and Hilbert irreducibility (IG.2);
- torus Poitou–Tate (R02.4);
- smooth and proper base change, and Hochschild–Serre (SF.2, R02.2);
- Weil restriction (RG2.0a);
- Weil reciprocity and the Bass–Tate analogue of Faddeev's sequence (K2SymbolsBrauer T.4);
- the projection formula (SF.5);
- resolution in characteristic 0 (SF.4);
- in the Tau Ceti roadmaps:
  - Riemann–Roch, Serre duality, cohomology and base change, and symmetric powers (Jacobian Challenge B–C);
  - global reciprocity and the norm theorems (Class field theory Layers 10 and 13);
  - Chebotarev (Layer 10);
  - weak and additive strong approximation (Global number fields Layers 1 and 6).

**Not in the atlas:**
- the fibration method itself;
- (E) and its adelic Chow groups;
- Pic₊/Br₊;
- the cycle formal lemma;
- specialisation of Brauer groups;
- Conjecture 9.1 and every result that depends on it;
- the Lang–Weil estimate for arbitrary varieties, Ekedahl's Chebotarev, Bloch–Srinivas and Mattuck;
- Schinzel's hypothesis, Heath-Brown–Moroz, Irving, Matthiesen and Borovoi.

## Routes

**Coalescing with HW20.** PAPER-HARPAZ-WITTENBERG-20 (a partial extraction, not yet reviewed) proposed the Part II HeightsRationalPointsPartIIZeroCycles, and its brief says to "decompose HW16 Theorem 8.3, Corollary 8.4, Condition 8.1 and Lemma 8.2". This extraction therefore routes HW16's whole fibration method to that same id rather than proposing a new roadmap. There is then one owner for Theorem 8.3.

1. **Source of RP.2** (3 items): Manin's cycle pairing; Harari's formal lemma, ramified-evaluation and fiber-evaluation theorems; Stoll's adelic points modulo connected components. HW20 already routes the cycle pairing and the formal lemma to RP.2.
2. **Source of SF.2** (3 items): Grothendieck's sequence Pic⊗Q/Z → H² → Br with finiteness of geometric Br; residues of pulled-back classes along fiber components; Br of complete local rings with finite residue field.
3. **Source of IG.2** (2 items): Lemma 6.1 (after Swinnerton-Dyer and Smeets, closed points in Hilbert sets under local approximation) and Lemma 8.12 (Hilbert subsets of products).
4. **Source of WeilConjectures WC.5** (2 items): the Lang–Weil–Nisnevich estimate for arbitrary geometrically irreducible varieties, and Ekedahl's geometric Chebotarev.
5. **Source of MotivesAndAlgebraicCycles MC.0** (1 item): the Bloch–Srinivas decomposition of the diagonal.
6. **Source of SieveMethodsAndPrimePatterns SV.4** (1 item): Schinzel's hypothesis (H), (HH₁) and (H) ⇒ (HH₁). RS-07 made SV.4 the register of prime-tuple conjectures.
7. **Source of SV.5** (2 items): Heath-Brown–Moroz, and Irving's sieve for binary cubic forms.
8. **Source of AdditiveCombinatorics AC.5** (1 item): Matthiesen's theorem on norm-form values of linear forms.
9. **Part II AbelianSchemesAndArithmeticModuliPartIILocalPoints** (1 item): Mattuck's theorem, the endpoint of the candidate proposed by BRESCIANI-24 (same id).
10. **Part II HeightsRationalPointsPartIIHomogeneousMassey** (1 item): Borovoi's theorem (with Sansuc for tori). HW20 imports it from this accepted candidate (HW23's Part II, design job #1887).
11. **Part II HeightsRationalPointsPartIIZeroCycles** (66 items): everything else, i.e. the fibration method for zero-cycles and for rational points. The brief:
    - states the final theorems exactly and lists every lemma chain;
    - suggests retitling the roadmap to "… Part II: zero-cycles and the fibration method";
    - names every import;
    - carries the corrected arguments of E1–E2.

**Ownership still to reconcile.** HW20's routes send Conjecture 1.1 (its item 133), HW16's Conjecture 9.1 (its item 76) and Corollary 9.25 (its item 77) to HomogeneousMassey. These are general fibration statements with no homogeneous-space content, so this extraction proposes ZeroCycles as their single owner, with HomogeneousMassey importing them. HW20's review, or the design jobs, should settle this, and the brief says so.

## Source issues (`sourceIssues` E1–E2)

- **E1** (misprint, Lemma 9.13(4), p. 39; nothing affected). "Thus we may assume that w lies above a place of S′" should read "does not lie above".
  - The case w above S is the first alternative of (4), and the case w above S′ ∖ S has just been excluded.
  - The integrality properties that the next clause lists hold only for w outside S′.
  - The identity b′_i(t′₀ − a′_i) = b_i(t₀ − a_i)(α − γt′₀) was checked.
- **E2** (error in the proof of Theorem 9.22, p. 47; affects the proof). The step "we may assume … that any element of B₀ evaluates trivially on X(k_v) for any v ∈ Ω ∖ S", followed by arbitrary points x″_v ∈ X_h(k_v), fails for non-proper X, which Theorem 9.17, and hence Theorem 9.22, allow.
  - **Counterexample.** X = 𝔾_m × P^1 → P^1 with β = (x, a). Then β lies in B₀ and is nonzero at points of odd valuation for the infinitely many v inert in k(√a).
  - **Repair.** Take a model with B₀ defined on it, integral x_v outside S, and integral points x″_v ∈ 𝒳_h(𝒪_v).
  - **Effect.** Every later application is to proper X, where the printed claim holds.

**Also checked and correct:**
- Lemma 1.8 and Lemma 5.2. For the latter, the components of D ∖ F are permuted like the embeddings of L.
- The formal-lemma arguments of §3.
- The residue argument of Lemma 5.3, with gcd(e_{m,i}) = 1.
- The real-place parity argument of Lemma 5.5.
- The completion arguments of Propositions 7.4–7.5 and Lemma 7.6 (N even for the real places).
- Assertions (2) and (4) of Theorem 8.3, including the degree bookkeeping in (4).
- The purity/Leray argument of Lemma 8.9.
- The Schinzel argument of Theorem 9.6, including the added inert places.
- The structure of W in Theorem 9.11(i)–(ii) (dimension 5, a punctured cone over a 4-dimensional quadric).
- The sign bookkeeping of Lemma 9.16.
- The connected-component argument at real places in Theorem 9.17.
- The Frobenius bookkeeping of Lemma 9.20.

**Noted but not recorded as mistakes:**
- Remark 9.3(ii), that Conjecture 9.1 over Q implies it over every number field, is only sketched ("compare [CTSD94, Proposition 4.1]"). It is not used in the paper. The brief asks the design to write out the reduction before anything relies on it.
- Theorem 9.31 carries a footnote added in proof, saying one hypothesis is superfluous, with details to appear elsewhere. The atlas keeps the printed hypothesis.

**Where corrections were looked for:**
- arXiv v1–v4.
- The authors' page.
- The Annals article page; no erratum is listed there, but the full published text could not be checked.
- Crossref, which records no update relation.

## Prerequisites not yet covered

- Wittenberg, Duke 2012.
- Harari 1994 and 1997.
- Matthiesen, JIMJ 2018.
- Irving, Crelle 2017.
- Borovoi, Crelle 1996.
- Graber–Harris–Starr 2003.
- Bloch–Srinivas 1983.
- Colliot-Thélène–Skorobogatov–Swinnerton-Dyer 1998.
- Heath-Brown–Moroz 2004.
- Smeets 2015.
- Ekedahl 1990.
- Saito 1989.

All DOIs were checked against Crossref. Ekedahl's article has no DOI.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HARPAZ-WITTENBERG-16.result.json`: ok.
- Every missing item is in exactly one route, and no route takes a planned or library item.
- Every cited layer was read in `data/atlas.json`, together with:
  - the RS-07 and RS-29 restructurings, which keep IG.2, SV.4 and SV.5 as cited;
  - the candidate briefs of HW20, HW23 and BRESCIANI-24, and the design job #1887.
- The Mathlib citation was read at 082e2d3: `RingTheory/Smooth/AdicCompletion.lean:94`.
- No Lean was written or compiled; none is a deliverable of this job.
