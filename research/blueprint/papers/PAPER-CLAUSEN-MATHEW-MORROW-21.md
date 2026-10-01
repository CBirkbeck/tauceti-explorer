# PAPER-CLAUSEN-MATHEW-MORROW-21: extraction and routing

Issue #1418. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*, J. Amer. Math. Soc. 34 (2021), 411–473 (doi 10.1090/jams/961; arXiv 1803.10897).

The current result has **123 items: 2 library, 19 planned and 102 missing**. The missing items are routed exactly once, by nine routes:

- one new Part II of RefinedTraceMethods (the main vehicle, 83 items);
- two existing proposals, reused (10 items);
- six source routes (9 items).

The original extractor read the paper in full. Eleven source issues are now recorded under `sourceIssues`: ten misprints and one error in the unbounded-tower characterization. These are scoped to the accessed arXiv v2, without claiming that the unexamined JAMS printing retains them. The main continuity theorem statements remain intact.

## What the paper proves

**Theorem A (Theorem 4.36).** For a henselian pair (R, I) and every prime p, the fibre K^inv of the cyclotomic trace K → TC satisfies K^inv(R)/p ≃ K^inv(R/I)/p. Equivalently, relative K-theory and relative TC agree with finite coefficients. This is a common extension of two earlier theorems: Gabber rigidity (the case n invertible) and the profinite Dundas–Goodwillie–McCarthy theorem (the case I nilpotent).

The proof has four ingredients.

1. **TC/p is finitary (Theorem 2.7 and Corollary 2.15, Theorem G).** TC/p commutes with all colimits of connective cyclotomic spectra. The reason is that the Frobenius of the trivial cyclotomic spectrum HF_p^triv kills the periodicity class x. Consequently TC(X) ≃ fib(X → X_{hS^1}) for HF_p^triv-modules (Proposition 2.12).
2. **Nonunital henselian rings (§3).** Following Gabber, whether a pair is henselian depends only on the ideal as a nonunital ring (Proposition 3.16). The category of henselian nonunital rings is algebraic over sets, with free objects the henselized polynomial ideals.
3. **Pseudocoherence (§4.1–4.3).** K(Z ⋉ I), THH and TC/p are *projectively pseudocoherent* functors of I. The proof uses van der Kallen's homological stability, Borel–Serre and the Goodwillie tower of Σ^∞Ω^∞. An axiomatic version of the first half of Gabber's proof (Proposition 4.16) then reduces rigidity to henselizations of polynomial rings over prime fields.
4. **The equal-characteristic case (§4.4).** It comes from Geisser–Levine and Geisser–Hesselholt: π_n(K^inv(R)/p) = ν̃^{n+2}(R), and ν̃ is rigid for henselian pairs (Proposition 4.31). Excision for K^inv (Land–Tamme) then passes from (Z ⋉ I, I) to every henselian pair.

**Consequences.**

- **Theorem B (Theorem 6.5).** K/p^r ≃ TC/p^r in degrees ≥ d for rings henselian along p whose residue fields satisfy [k:k^p] ≤ p^d. Corollary 6.6 is the resulting p-adic Lichtenbaum–Quillen statement.
- **Theorem C (Theorem 6.1).** K^inv/p = 0 at strictly henselian points of residue characteristic p. Theorem 6.3: p-adic étale K-theory of schemes proper over a ring henselian along p is TC.
- **Theorem D (Theorem 6.11).** The trace is split injective for local F_p-algebras, with complement coker(π − F̄) on de Rham–Witt forms (Proposition 6.12).
- **Theorem F (Theorem 5.5).** K-theory with finite coefficients is continuous for F-finite complete noetherian rings. Theorem 5.7 shows the hypothesis is needed: continuity fails for k[[t]] when k is not F-finite.
- **p-adic continuity (Theorems 5.19–5.22).** K and TC are p-adically continuous for rings henselian along p with bounded p-torsion.
- **Theorem E (Theorems 5.26 and 5.31).** A pro Geisser–Levine theorem for F-finite regular local F_p-algebras.

## Sources inspected

- [arXiv 1803.10897v2](https://arxiv.org/abs/1803.10897v2) (20 July 2020, 59 pages, "revised and final version").
  - PDF SHA-256 `ad23c1d7…584c6abd9c`; TeX source SHA-256 `22f7d57f…6491b4f1`.
  - The full TeX source (4016 lines) and the bibliography were read.
  - All locators and page numbers refer to the arXiv v2 PDF. The second author's page links to this version.
- The published JAMS PDF could not be retrieved (HTTP 403) and was not compared.
- Crossref lists no correction or update for the DOI.

All sources were accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

E1–E7 are the original misprints, confirmed by the original review in both the TeX and PDF. The fix of 1 October 2026 adds E8–E11 from selected PDF passages; E9 is an error, while the other three are misprints. Their independent fix review is pending.

| Id | Where | What is printed | Correct reading |
| --- | --- | --- | --- |
| E1 | §1.2, p. 5 | "Geisser–Levine [GH] and Geisser–Hesselholt [GH]" | the first citation is [GL] |
| E2 | Remark 3.11 | the free functor F is called the "right adjoint" of U | it is the left adjoint |
| E3 | proof of Theorem 5.7 | "t^{2j} da ∧ db", "τ_{2s−2} ≡ Σ b_i ∧ c_i", "∈ k_i" | t^{2j} db ∧ dc; τ_{2s} ≡ Σ db_i ∧ dc_i; ∈ k_j. The growth bound should use C(2j+2, 2j); the argument is unaffected, since the two bounds differ by a factor ≤ 6 |
| E4 | proof of Lemma 5.30 | R^{r−s} | R^{s−r} |
| E5 | proof of Proposition 6.2 | "we can assume x^*α = 0" | x_0^*α = 0 |
| E6 | Example 6.10 | K(C; C_p) | K(C; Z_p) |
| E7 | before Theorem 6.11 | π_{n+1}(𝒯𝒞/p^r) is called the sheafification of π_n(TC(−)/p^r) | it is the sheafification of π_{n+1}(TC(−)/p^r) |
| E8 | §6.4, equations (26)–(27) and proof of Proposition 6.12, pp. 55–56 | quotient denominator dV^{r−1}Ω_R^m | dV^{r−1}Ω_R^{m−1}; set Ω_R^{−1}=0 at m=0; at r=1 recover Ω_R^m/dΩ_R^{m−1} |
| E9 | Definition 5.14, pp. 42–43 | degreewise nilpotence is equivalent to almost nilpotence for arbitrary towers | keep the upper-truncation definition; the converse characterization requires a common lower bound |
| E10 | proof of Theorem 5.21, p. 44 | integral equality of K^inv spectra on invoking rigidity | K^inv(R)/p ≃ K^inv(R⊗_{HZ}HZ/p^i)/p; use DGM for passage to π_0 |
| E11 | proof of Corollary 5.33, p. 49 | integral-to-mod-p surjection called an isomorphism | {K_n(R/I^s)/p}_s ≃ {K_n(R/I^s;Z/p)}_s, with the subsequent pro p-torsion term zero |

For E8, Verschiebung preserves degree and d raises it, so the printed denominator does not lie in the numerator's degree. [Morrow's published Corollary 4.2(ii)–(iii) and Remark 4.3](https://www.numdam.org/item/ASENS_2019__52_6_1537_0.pdf), pp. 1566–1567, give the corrected quotient and inverse-Cartier specialization for arbitrary F_p-algebras. The fix retains that generality in items 099 and 121 and the Part II's design brief.

For E9, take X_i=⊕_{j≥i}Σ^{−j}HF_p with tail inclusions, i≥1. Each fixed homotopy-group tower is nilpotent: π_{−j}X_i becomes zero for i>j. But τ_{≤0}X_i=X_i, and X_{i+N}→X_i is nonzero on π_{−(i+N)} for every i,N>0. A common lower bound restores the converse by finite Postnikov dévissage. Item 091 and route 2 impose that boundary; the connective or uniformly bounded-below continuity applications are preserved.

E10 and E11 repair proof transcription. Item 096's derived continuity and item 106's pro comparison/torsion-freeness statements are unchanged. For E11 the case R=F_p, I=0, n=0 is the reduction Z→Z/p, which is not injective; the Bockstein sequence gives the quotient-by-p isomorphism instead.

## What the atlas and the libraries already have

**Library (2).** Henselian pairs and henselian local rings: Mathlib's `HenselianRing` (exactly condition (2) of Definition 3.12), `HenselianLocalRing` and `IsAdicComplete.henselianRing`, in Mathlib/RingTheory/Henselian.lean at 082e2d3. The new split item **038-library** credits the existing nonunital algebra data: `NonUnitalCommRing`, `Module`, `IsScalarTower`, `SMulCommClass`, `NonUnitalAlgHom` and `Unitization`, with its ring/algebra instances, `fstHom`, `inrNonUnitalAlgHom` and `lift`. Their actual pinned declarations and hypotheses were read; the reviewed K.5 coverage also credits unitization. Residual item **038** retains the bundled category, augmented-algebra equivalence, free polynomial ideals, limits and colimits as missing. `Unitization.lift` proves the mapping equivalence into a unital algebra, not all that category theory. Local and henselian extensions in 039–041 remain missing.

**Planned (19 items).**

| Topic | Planned in |
| --- | --- |
| Cyclotomic spectra, trivial cyclotomic spectra with their monoidal structure/TC adjunction, TC/TC^−/TP, the Nikolaus–Scholze formula, THH of rings, classical TR/TC | RefinedTraceMethods RT.2 |
| Dundas–Goodwillie–McCarthy | RefinedTraceMethods RT.3 |
| Gabber rigidity away from p | KTheoryFiniteLocalFields L.2 |
| K-theory of rings and the plus construction; Bass excision; nonconnective K | GeneralAlgebraicKTheory K.2, K.5, K.6; StableHomotopyKTheory H.3 |
| Thomason–Trobaugh Nisnevich descent | SchemeKTheoryOperations S.4 |
| Cartier operator and isomorphism | DerivedDeRhamCohomology DD.3 |
| De Rham–Witt complexes, their structure, strict Dieudonné complexes, logarithmic forms | CrystallineCohomology CR.4 (with HigherLocalFieldsAndHigherClassFieldTheory HL.2) |
| Left Kan extension | EnhancedDerivedSheaves E3 |
| Borel–Serre | ArithmeticLocallySymmetricSpaces ALS.2 |
| Proper base change | SchemeAndStackFoundations SF.2, EtaleDualityAndPerverseSheaves EDC.0 |
| Strict henselization | Tau Ceti Modular Curves, layer 4D |

RT.3 asks for "the map-level square for … a henselian pair in the proven range" but plans no proof. The atlas has nothing on:

- the finiteness of TC/p;
- nonunital henselian rings;
- pseudocoherent functors;
- Geisser–Levine or Geisser–Hesselholt;
- any of the consequences listed above.

## Routes

1. **Hochschild, cyclotomic and refined trace methods, Part II: K-theory and topological cyclic homology of henselian pairs** (`RefinedTraceMethodsPartIIHenselianPairs`, 83 items). The main theorem is the henselian extension of RT.3's Dundas–Goodwillie–McCarthy theorem, and its key input sharpens RT.2. So the paper's theory is a Part II of RefinedTraceMethods, covering:
   - finiteness of TC/p, and the residual categorical and henselian nonunital theory built on Mathlib's existing data and unitization;
   - pseudocoherence and the axiomatic rigidity argument;
   - the equal-characteristic inputs and the proof of Theorem A;
   - I-adic continuity and discontinuity, and pro Geisser–Levine;
   - §6's comparisons: étale K-theory, the asymptotic comparison and split injectivity.

   The brief asks RT.3's henselian export, and the AMMN Part II, to import Theorem A from here. Its Proposition 6.12 target and all proof quotients use the E8 correction, with m=0 and r=1 tests, and preserve arbitrary F_p-algebras. The library split item is not routed for reconstruction.
2. **Hochschild, cyclotomic and refined trace methods, Part II: p-adic deformation of K-theory classes** (`RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses`, reused, 9 items). The AMMN extraction's brief already requires "the continuity theorems saying which comparison maps F(X) → F^cts(X) are p-adic equivalences". §5.2 proves them for K and TC: quickly converging towers, and Theorems 5.19–5.22 with Geisser–Hesselholt's Theorem 5.10. The brief now requires the lower-bound qualification and negative tail-tower test for E9, and the mod-p rigidity proof correction E10.
3. **ArcTopologyAndDescent** (reused, 1 item). Gabber's affine analogue of proper base change, already routed there by the Bhatt–Mathew arc-topology extraction.
4. **Source routes (9 items).**
   - SchemeAndStackFoundations SF.0 (4 items): the equivalent characterizations of henselian pairs, henselization, Elkik and Néron–Popescu. Néron–Popescu is also routed there by the Česnavičius extraction.
   - DeformationAndDerivedPatchingAlgebra R03.3 (1 item): F-finiteness, Kunz, and excellence.
   - DerivedDeRhamCohomology DD.0 (1 item): cotangent complexes of F-finite rings and p-bases.
   - CrystallineCohomology CR.4 (1 item): Illusie's exact sequence for logarithmic Hodge–Witt sheaves, with Shiho's extension.
   - RefinedTraceMethods RT.2 (1 item): Hesselholt's HKR theorem for TR. CR.4 assigns this realization to RT.
   - RefinedTraceMethods RT.3 (1 item): excision for K^inv, one of RT.3's named inputs.

## Coverage crosswalk

Item numbers are the suffixes after `PAPER-CLAUSEN-MATHEW-MORROW-21/`.

| Paper block | Items |
| --- | --- |
| §1: K^inv, Dundas–Goodwillie–McCarthy, henselian pairs, Gabber, Theorems A–G, Geisser–Levine | 001–012 |
| §2.1–2.3: cyclotomic spectra, finiteness of TC/p, pro-constancy | 013–030 |
| §2.4: Cartier, de Rham–Witt, Hesselholt HKR, TC/p of F_p-algebras, Dieudonné complexes | 031–037 |
| §3: nonunital and henselian rings, henselization, Gabber, Milnor squares | 038-library and 038–049 |
| §4.1–4.2: pseudocoherence and the axiomatic rigidity argument | 050–059 |
| §4.3: pseudocoherence of GL-homology, K, HI, THH, TC/p | 060–067 |
| §4.4–4.5: equal characteristic, excision, Theorem A, Remark 4.39 | 068–078 |
| §5.1: continuity, F-finiteness, discontinuity | 079–088 |
| §5.2: p-adic continuity | 089–097 |
| §5.3: pro Geisser–Levine | 098–107 |
| §6: étale K-theory, the asymptotic comparison, examples, split injectivity, strict henselization | 108–122 |

## Prerequisite papers the atlas does not cover

- Nikolaus–Scholze (Acta 2018).
- Gabber (Contemp. Math. 126).
- Geisser–Levine (Invent. 2000).
- Geisser–Hesselholt:
  - *Topological cyclic homology of schemes* (1999);
  - *Bi-relative K-theory* (Invent. 2006), together with Land–Tamme (Annals 2019);
  - *On the K-theory and TC of smooth schemes over a DVR* (Trans. AMS 2006).
- Dundas–Morrow (Ann. Sci. ÉNS 2017).
- Morrow, *K-theory and logarithmic Hodge–Witt sheaves* (Ann. Sci. ÉNS 2019).
- Hesselholt (Acta 1996).
- van der Kallen (Invent. 1980).
- Clausen–Mathew, *Hyperdescent and étale K-theory* (Invent. 2021), queued as PAPER-CLAUSEN-MATHEW-21.
- Blumberg–Mandell (Geom. Topol. 2012).
- Bloch–Esnault–Kerz (Algebr. Geom. 2014).

Links are in `prerequisites`.

## Review (REV-PAPER-CLAUSEN-MATHEW-MORROW-21, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1419), **accepted** this
extraction and all nine routes, with one correction made in place. The full record is
[REV-PAPER-CLAUSEN-MATHEW-MORROW-21.md](../reviews/REV-PAPER-CLAUSEN-MATHEW-MORROW-21.md).

Both recorded hashes reproduce, the PDF and the e-print tarball, so the review checked every
quotation against `rigidity_final.tex` itself. 122 items, all 103 missing ones routed exactly once;
all six source stage ids and all 18 planned layer ids exist; the 159 numbered environments in the
text all appear in items; 170 locator checks land exactly, the rest being proofs that cross a page
boundary. The library item's third citation, `IsAdicComplete.henselianRing`, is at
`Mathlib/RingTheory/Henselian.lean:170` — absent from the declaration index only because it is
declared as `instance (priority := 100)` — and was read in the source. Both Part II titles reproduce
the parent's atlas title exactly, and the three shared roadmap ids
(`RefinedTraceMethodsPartIIHenselianPairs`, `…PadicDeformationOfKTheoryClasses`,
`ArcTopologyAndDescent`) are the ones five other extractions already use, so this extraction joins
existing proposals rather than opening parallel ones.

**Correction.** Route 2's area was `motivic`, which is the parent roadmap's atlas **group**, not a
galaxy id; it is now `ktheory`, as in route 1. The review also records that 33 of the 502 route areas
across the paper extractions are group names rather than galaxy ids, that `check_paper.py` only
checks the field is non-empty, and that `PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22` carries the same
invalid area for this same roadmap id and needs the same fix in its own review.

All seven findings are **confirmed** at the source: the duplicated `\cite{GH}` at line 397 (with
GH = [30] and GL = [34] in the `.bbl`); (Law) asking for a left adjoint where the next sentence says
right adjoint; the three slips and the `τ_{2s−2}`/`τ_{2s}` index shift in the proof of Theorem 5.7,
where the corrected Bloch–Esnault–Kerz index costs at most a factor 6; `{R^{r−s}}_s` in the proof of
Lemma 5.30 against `{R^{s−r}}_s` in its statement; `K(O_C; Z_p) ≃ K(C; C_p)`; and `π_{n+1}(𝒯𝒞/p^r)`
described as the sheafification of `π_n`. E5 deserved the closest look and stands: the printed "we
can assume `x^*α = 0`" assumes the statement being proved, and the normalization actually available
is `x_0^*α = 0`.

## Verified red-team fixes, 1 October 2026

Codex, session `codex-J6LwjP`, issue #5530, applied all four confirmed findings. This is a focused fix, not a new whole-paper extraction or an independent review of the fix. The original review above records its historical 122-item result; the present 123-item counts also include the intervening Nikolaus–Scholze ownership correction and the nonunital library split.

Reacquired the [arXiv-v2 PDF](https://arxiv.org/pdf/1803.10897v2), matching SHA-256 `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c`; read selected pp. 17–18, 42–44, 49 and 55–56, checking rendered pages for the delicate formulas. Read only Corollary 4.2 and Remark 4.3, pp. 1566–1567, of the published Morrow source (SHA-256 `54988085dbe216661b2e3e7ff5ddc6479240f424b10a8c83727973f828ded4e2`), including rendered p. 1567. Whole-paper reads remain attributed to the original workers.

On this date, arXiv still listed v2 as latest, Crossref supplied no correction relationship/update, and a title/erratum search plus Morrow's publication page yielded no correction. The version-of-record and accepted-manuscript AMS URLs both returned HTTP 403 again; neither text is claimed read. `sourceVersions` records the versions actually examined, and E8–E11 await independent fix review.

Checks: paper and source-issue schemas, three-file intake, routing/ID/status preservation and correction regressions, and whitespace. No Lean file was requested or compiled, and no library build or language server was started. The fixes report gives the detailed evidence and limits.
