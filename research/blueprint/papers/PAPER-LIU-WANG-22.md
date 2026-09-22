# PAPER-LIU-WANG-22: extraction and routing

Issue #1262. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Ruochuan Liu and Guozhen Wang, *Topological cyclic homology of local fields*, Invent. Math. 230 (2022), 851–932 (doi 10.1007/s00222-022-01134-9; arXiv 2012.15014).

The result has **66 items: 7 planned and 59 missing**. No item is in Mathlib or Tau Ceti. The routes are:

- a **Part II of KTheoryFiniteLocalFields** (54 items), for the paper's own method and its local-field theorems;
- two **source routes into RefinedTraceMethods** (RT.6, 4 items; RT.1, 1 item), for general trace-method inputs;
- a **source route into KTheoryFiniteLocalFields L.5** that takes no missing item. It records two planned results that the paper re-proves.

Fourteen misprints and one error in a proof are recorded under `sourceIssues`. No stated result is affected.

## What the paper proves

Fix a prime p and a finite extension K/Q_p. Write:

- O_K for its ring of integers, k for the residue field, and e_K, f_K for the ramification index and residue degree;
- E_K(z) for the minimal polynomial of a uniformizer ϖ_K over K_0 = W(k)[1/p], normalized by E_K(0) = p, with leading coefficient μ;
- 𝕊_{W(k)} for the spherical Witt vectors.

**The main theorem (Theorems 1.5 and 8.18).** Let d = [K(ζ_p):K].

- The E^2-page of the mod p descent spectral sequence for TC(O_K) is, as an F_p[β]-module:
  - F_p[β] in column 0;
  - F_p[β]{λ, γ} ⊕ F_p[β]{α^{(j)}_{i,l} : 1 ≤ i ≤ e_K, 1 ≤ j ≤ d, 1 ≤ l ≤ f_K} in column −1;
  - F_p[β]{λγ} in column −2;
  - zero elsewhere.
- The degrees are β in (0, 2d), λ in (−1, 0), γ in (−1, 2d+2) and α^{(j)}_{i,l} in (−1, 2j).
- The spectral sequence collapses.

**The consequences.**

- **Theorem 8.20.** For p odd, TC_*(O_K; F_p) is the free F_p[β]-module on 1, λ, γ, λγ and the α^{(j)}_{i,l}. This agrees with Hesselholt–Madsen.
- **Theorem 8.21.** For p = 2, the same holds when [K:Q_2] is even. When [K:Q_2] is odd, there is a Z/4-extension on the odd powers of β. This happens exactly when Hamilton's quaternions do not split over K (Remark 8.22).
- **Proposition 8.23.** The integer d defined by the computation (the least d with p − 1 | e_K d and N_{k/F_p}(μ̄)^d = 1) equals [K(ζ_p):K].
- **Remark 1.8.** TC(O_K; F_p) → L_{K(1)}TC(O_K; F_p) is 0-truncated. Through the trace this gives the Lichtenbaum–Quillen statement for K(O_K; Z_p).

**The method.**

1. **The descent (§5).** Descend along 𝕊_{W(k)} → 𝕊_{W(k)}[z], with z ↦ ϖ_K (Proposition 5.5 and Corollary 5.9, via Mathew–Naumann–Noel).
   - The terms are THH, TC⁻ and TP of O_K relative to 𝕊_{W(k)}[z_0, …, z_n].
   - Relative to 𝕊_{W(k)}[z] these are BMS2's: THH_* = O_K[u], TP_0 = W(k)[[z]], and uv = E_K(z) (Theorem 2.17).
2. **The key new structure (§3, Theorem 1.3).** TP_0(O_K/𝕊_{W(k)}[z_0, z_1]) is a δ-ring. It is the closure, inside the Nygaard-completed PD envelope of (E_K(z_0), z_0 − z_1), of W(k)[z_0, z_1] together with the elements δ^k(φ(z_0 − z_1)/φ(E_K(z_0))).
   - The embedding into the PD envelope uses a Hochschild–Kostant–Rosenberg theorem for HP of lci quotients (Appendix A, Theorem A.1).
3. **Hopf algebroids (§4).** The pairs (THH_*(O_K/𝕊[z]), THH_*(O_K/𝕊[z_0, z_1])) and (TP_0(O_K/𝕊[z]), TP_0(O_K/𝕊[z_0, z_1])) are Hopf algebroids.
   - Their E^2-pages are comodule Ext groups: the coherent cohomology of a stack 𝒳.
   - The paper conjectures that 𝒳 is the Cartier–Witt stack WCart_{O_K}.
4. **THH (Corollary 5.19).** E^2(THH) recovers Lindenstrauss–Madsen: THH_{2n−1}(O_K) = O_K/(nE'_K(ϖ_K)).
5. **The algebraic Tate spectral sequence (§§5–6).** It computes E^2(TP) from E^2(THH)[σ^{±1}].
   - With F_p-coefficients it is refined by a Nygaard filtration indexed by (1/e_K)Z (Definition 6.9).
   - All its differentials are then determined by hand (Proposition 6.43): d(z^nσ^j) = n′μ̃̄^{(p^l−1)/(p−1)} z_0^{pe_K(p^l−1)/(p−1)+n−1}σ^j dz, with l = v_p(n − pe_K j/(p−1)).
   - Small e_K are handled by the tame base change K(ϖ_K^{1/m}) (Proposition 6.34).
6. **Assembly (§§7–8).** The E^2-pages of TC⁻ and TP, the Frobenius on them (Proposition 8.4) and Hilbert 90 over k (Lemma 8.10) give E^2(TC).
   - The mod p E^2-pages are multiplicative for every p, although the mod 2 Moore spectrum is not (Remark 6.1).
   - This is why p = 2 is reached.

**What is not extracted.** §9 compares the descent spectral sequence with the motivic spectral sequence for K_*(K; F_p). It consists of pictures and one assertion without proof ("one may show that λ generates the cokernel of the cyclotomic trace K(Z_p; F_p) → TC(Z_p; F_p)"). No item was made from it.

## Sources inspected

- [arXiv 2012.15014v4](https://arxiv.org/abs/2012.15014v4), dated 10 August 2022, 65 pages.
  - The listing's comment reads: "Refereed version; the constant term of the Eisenstein polynomial is obtained directly, and the original section 9 is removed; the original Theorem 3.24 is moved to the new appendix A". Earlier versions: v1 30 December 2020, v2 9 June 2021, v3 1 August 2021.
  - PDF SHA-256 `9a53718b…54240c1`; source tarball SHA-256 `a3da6dd2…93761d62`.
  - The complete TeX source (3509 lines) was read, including its commented-out and `\iffalse` passages.
  - **Locators give arXiv v4 page numbers.**
- The published article, [Invent. Math. 230 (2022), 851–932](https://link.springer.com/article/10.1007/s00222-022-01134-9): received 9 June 2021, accepted 10 June 2022, published 13 July 2022.
  - The full text is paywalled. Its abstract, dates and section list (including Appendix A with Theorem A.1) were checked against v4.
  - v4 was posted after publication and describes itself as the refereed version.
  - **The source issues below were not checked in the published text.**
- The [Publisher Correction](https://doi.org/10.1007/s00222-022-01147-4), Invent. Math. 230 (2022), 933: "During Proof correction the affiliations of the authors were mixed up". It does not touch the mathematics.
- Crossref metadata for the article: its only update relation is that correction.

All sources were accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

All fifteen are new. None is corrected in v4 or by the Publisher Correction.

**The error.**

- **E14 (proof of Proposition 8.23, p. 60).** The paper claims p/(ζ_p − 1)^{p−1} ≡ −1 mod p.
  - This holds only mod (ζ_p − 1). For p = 3, 3/(ω − 1)² = −ω², and −ω² + 1 has valuation 1/2.
  - The Hensel argument needs only the residue congruence, so the proposition stands. The recorded reach is "the proof".

**Misprints**, all with reach "nothing":

| Id | Where (arXiv v4) | Printed | Should be |
|---|---|---|---|
| E1 | proof of Theorem 2.17(6), p. 14 | u = b(z)u′, σ = φ(b(z))σ′, v = φ(b(z))^{−1}v′ | ũ, σ̃, ṽ (the elements just introduced) |
| E2 | proof of Lemma 3.32, p. 21 | u_0^{2l}t^{[2j−2l]}; HH_{2j}(W(k)/𝕊[z_0,z_1]); t_E^{[2l]}t^{[2j−2l]} for j = 0, …, k | u_0^l t^{[j−l]}; HH_{2j}(O_K/W(k)[z_0,z_1]); t_E^{[l]}t^{[j−l]} for l = 0, …, j |
| E3 | proof of Proposition 3.29, p. 20 | R′ = W(k)[{δ^k(h)}] | W(k)[z_0, z_1][{δ^k(h)}]; only this is dense by Lemma 3.27 |
| E4 | Corollary 3.35, p. 22 | {ι(δ^k(h))} | ι is defined nowhere, probably left over from the material v4 moved to Appendix A; the embedding of Lemma 3.32 is meant, as in Theorem 1.3 |
| E5 | Proposition 6.2(2), e_K = 1, p. 33 | Σ_{j=1}^{l} … (−μ̄)^j | Σ_{j=1}^{n} … (−μ̄)^{j−1}, the reduction of u^{(n)} |
| E6 | Lemma 6.12(2), p. 36 | r_n = Σ_j …(−1)^j z_0^{n−j}t^{[j]}σ^j | the summation index clashes with the row index j |
| E7 | diagrams (6.6), p. 33, and (6.14), p. 36 | bottom arrow η_L − η_R | η_R − η_L; as printed the squares anticommute |
| E8 | Convention 6.16, p. 37 | (−1)^j, "formally equal to (z_0^n − z_1^n)/n" | (−1)^{j−1}; for n = 1 the printed sum is −t |
| E9 | proof of Lemma 6.19, p. 38 | ξ_0 − z_0^p | ξ_0 − z_0^{p−1} |
| E10 | proof of Proposition 6.32, p. 41 | (z_0^{p^l} − z_1^{p^l})^{n−i}, i ≤ n − 2 | exponent n′ − i, i ≤ n′ − 2 |
| E11 | proof of Proposition 7.6, p. 49 | z^{pe_K j/(p−1)}σ^j dz | z_0^{pe_K(j−1)/(p−1)−1}σ^j dz |
| E12 | proof of Corollary 8.6, p. 52 | … − e_K(a − 1) … | … − e_K(j − 1) … |
| E13 | Theorem 8.21, p. 58 | \|α_i\| = 2i − 1 | \|α_{i,l}\| = 1, since p = 2 forces d = 1 |
| E15 | proof of Proposition 6.2, p. 34 | "(6.14) is commutative", and twice more | (6.6); the TeX gives both diagrams the label `E:thh-cobar` |

**Leads checked but not recorded:**

- **Slips too small to record:**
  - "poof" (proof of Lemma 6.12);
  - "trvial" (proof of Theorem 8.21);
  - "Frobeninus" (§1);
  - a stray parenthesis in Definition 2.4;
  - the proof of Proposition 6.34 writes λz_1^{…}dz for λz_0^{…}dz, although z_1 and z_0 agree in the associated graded when e_K > 1;
  - the proof of Lemma 6.10 omits the unit μ in z^{e_K} ≡ μ^{−1}E_K(z) mod p;
  - the proof of Proposition 7.1 writes d_r for d^r.
- **Checked and found correct:**
  - the Taylor coefficient in Proposition 4.15 is integral;
  - the counting in Lemma 7.8;
  - the norm-residue reduction in Proposition 8.23 (N(μ̄)^{d_1} = 1 ⟺ μ̄ ∈ (k^×)^{e_K} when p − 1 = e_K d_1).
- **Terse but not recorded as gaps:**
  - The appendix reduces a general lci ideal "by Zariski descent". Every application in the paper uses a global regular sequence.
  - Remark 6.45's correspondences with Hesselholt–Madsen, Rognes and Tsalidis are asserted without proof, and nothing depends on them.
  - The §9 claim about λ is not used.

## What the atlas and the libraries already have

**Libraries.** Neither Mathlib nor Tau Ceti at the pinned commits has any of the following:

- spectra with E_∞-structures, THH, cyclotomic spectra, TC⁻, TP or TC;
- spherical Witt vectors;
- δ-rings;
- PD envelopes;
- Hopf algebroids or comodule Ext.

Mathlib does have:

- `DividedPowers` and the ring `DividedPowerAlgebra`, without its divided power structure;
- Hopf algebras;
- multiplicative Hilbert 90 for cyclic extensions, `groupCohomology.exists_div_of_norm_eq_one`.

The additive form used in Lemma 8.10 follows from it but is not stated. So **no item is `library`**.

**The atlas.**

- **KTheoryFiniteLocalFields L.5** plans "the calculation of THH/TR/TC for perfect fields, truncated polynomial rings and the complete DVRs required for local-field K-theory", including Bökstedt periodicity. It follows Hesselholt–Madsen's logarithmic de Rham–Witt route. It says that "the Handbook's different hypotheses for p=2 and odd p are preserved until a separately proved theorem removes them".
  - Corollary 5.19 (THH of O_K) and Theorem 8.20 (odd p) are therefore **planned in L.5**.
  - Theorem 8.21 (p = 2) is not.
- **KTheoryFiniteLocalFields L.6 and MotivicEtaleKTheory M.7** plan the K-groups of local fields and Quillen–Lichtenbaum by the motivic and étale route. The TC-level 0-truncatedness of Remark 1.8 is not planned there.
- **RefinedTraceMethods:**
  - RT.2 plans THH, TC⁻, TP and TC with their spectral sequences, so Definitions 2.1 and 2.4 are planned.
  - RT.6 owns the BMS2 computations relative to 𝕊[z]. The BMS2 extraction routed BMS2 Construction 11.5 and Proposition 11.10 there.
  - RT.1 owns algebraic HH/HP and HKR.
- **PrismaticCohomology PR.0** plans δ-rings (Definition 3.20). **CrystallineCohomology CR.0** plans PD envelopes with explicit envelopes for regular immersions and PD filtrations.
- **Planned nowhere:** descent along 𝕊_{W(k)} → 𝕊_{W(k)}[z], Hopf algebroids and their Ext, and the refined Nygaard filtration (searched for "Hopf algebroid", "descendab" and "spherical Witt").

## Routes

**1. Source: RefinedTraceMethods RT.6** (items 007, 009, 010, 012). §2 of the paper re-derives, in the form it needs, the relative cyclotomic structures:

- Lemma 2.3, which lifts THH(−/E) to cyclotomic spectra from a lift of the augmentation;
- Propositions 2.10 and 2.14 (𝕊_{W(k)} and 𝕊_{W(k)}[z], with φ(z) = z^p);
- Theorem 2.17(1)–(5), which gives THH_*(O_K/𝕊_{W(k)}[z]) = O_K[u], TP_0 = W(k)[[z]] and the collapsing spectral sequences.

These are exactly the BMS2 statements that the BMS2 extraction routed to RT.6. They are general trace-method facts, and the Part II imports them. Theorem 2.17(6), the normalization uv = E_K(z) with E_K(0) = p, is kept in the Part II: it is proved by comparing with Bökstedt periodicity for F_p, and only the local-field computation uses it (Remark 8.25).

**2. Source: RefinedTraceMethods RT.1** (item 016). Theorem A.1 is an HKR theorem for HP of any lci quotient R/I of a Z_p-algebra: HP_0(A/R) is the Nygaard-completed PD envelope and HH_*(A/R) = Γ_A(I/I²). This is algebraic Hochschild theory in general, which RT.1 owns.

**3. Source: KTheoryFiniteLocalFields L.5** (items 038, 002, both planned). This route records Liu–Wang as a second source for the THH computation (Lindenstrauss–Madsen) and for odd-p TC of O_K. It takes no missing item.

**4. Part II: "K-theory of finite and local fields, Part II: descent spectral sequences for topological cyclic homology of p-adic local fields"** (`KTheoryFiniteLocalFieldsPartIIDescentSpectralSequences`, area `ktheory`, 54 items). It takes everything else:

- the normalization of Theorem 2.17(6);
- the structure of TP_0(O_K/𝕊[z_0, z_1]) (§3);
- the Hopf algebroids (§4);
- the descent, algebraic Tate and refined algebraic Tate spectral sequences with all their differentials (§§5–6);
- the E^2-computations and the Frobenius (§§7–8);
- the final theorems: 8.18, 8.21, 8.23 and the Lichtenbaum–Quillen remark.

The reasons for making it a Part II rather than folding it into existing layers:

- **Not into L.5.** L.5 plans the classical route to the same odd-p theorem. Loading a second, independent proof into one layer would mix two blueprints, and L.5 explicitly waits for "a separately proved theorem" for p = 2.
- **Not into RefinedTraceMethods.** Those layers own general trace theory. Hopf algebroids of TP_0(O_K/𝕊[z]^{⊗•}), the elements δ^k(h) and the refined filtration indexed by (1/e_K)Z are specific to O_K, and they only produce local-field theorems.
- **Imports named in the brief:**
  - RefinedTraceMethods RT.1, RT.2 and RT.6;
  - PrismaticCohomology PR.0;
  - CrystallineCohomology CR.0;
  - StableHomotopyKTheory H.5–H.6 (spectra, E/m, Bocksteins, spectral sequences of towers);
  - L.5, for Bökstedt periodicity.
- **Exports named in the brief:** to L.5 and L.6, with MotivicEtaleKTheory M.7 for the K-theoretic comparison.
- **Unit tests in the brief:**
  - Q_p (Bökstedt–Madsen, Tsalidis, Rognes);
  - Q_p(ζ_p), where d = 1 and β is the Bott class;
  - Q_2 and Q_2(i), the two cases of Theorem 8.21.

**Judgement calls for the reviewer:**

- **Theorem 8.20 is planned in L.5, not missing.** L.5's scope covers it, although by another proof. If the reviewer reads L.5 as committing to the Hesselholt–Madsen proof only, the item should become missing and move to the Part II.
- **Lemma 8.10 (Hilbert 90 over finite fields) is missing, routed to the Part II.** It is elementary and could instead be a small library contribution next to Mathlib's multiplicative Hilbert 90.
- **Where the (1/e_K)Z-refined filtration and the tame base-change comparison T_m belong.** They are kept in the Part II. They might also serve other computations of TC of ramified rings, but nothing in the atlas asks for them yet.

## Prerequisites

Papers the atlas does not yet cover:

- **Nikolaus–Scholze**, On topological cyclic homology (Acta Math. 2018), for TC⁻, TP and TC and for Bökstedt periodicity in the form of Theorem 2.15. It is also listed by the AMMN and Clausen–Mathew–Morrow extractions.
- **Hesselholt–Madsen**, On the K-theory of local fields (Ann. of Math. 2003), for the classical odd-p computation. It is also listed by the AMMN extraction.
- **Rognes–Weibel** (K-Theory 1999), the 2-adic input behind the previous route to Theorem 8.21.
- **Mathew–Naumann–Noel**, Nilpotence and descent in equivariant stable homotopy theory (Adv. Math. 2017), Proposition 2.14, for the convergence of the descent. It is also listed by the Clausen–Mathew extraction.
- **Lindenstrauss–Madsen** (TAMS 2000) and **Krause–Nikolaus** (Compositio 2022), for THH of DVRs.
- **Lurie**, Elliptic Cohomology II §5.2, for spherical Witt vectors.
- **Mitchell** (K-Theory 2002; Handbook 2005), for 2-adic K-theory of 2-adic local fields and K(1)-localization.
- **Rognes** (JPAA 1999), **Tsalidis** (Amer. J. Math. 1997) and **Bökstedt–Madsen** (Astérisque 1994), for the e_K = 1 cases.
- **Antieau**, Periodic cyclic homology and derived de Rham cohomology (Ann. K-Theory 2019), for Remark 3.3.

BMS2 has its own extraction (PAPER-BHATT-MORROW-SCHOLZE-19). Bhatt–Lurie's prismatization, which the paper cites only for its conjecture about 𝒳, is listed by the Anschütz–Le Bras and Bhatt–Scholze extractions.
