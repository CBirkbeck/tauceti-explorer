# PAPER-CLAUSEN-MATHEW-MORROW-21: extraction and routing

Issue #1418. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*, J. Amer. Math. Soc. 34 (2021), 411–473 (doi 10.1090/jams/961; arXiv 1803.10897).

The result has **122 items: 1 library, 18 planned and 103 missing**. The missing items are routed exactly once, by nine routes:

- one new Part II of RefinedTraceMethods (the main vehicle, 84 items);
- two existing proposals, reused (10 items);
- six source routes (9 items).

The paper was read in full. Seven misprints are recorded under `sourceIssues`. No error or gap was found.

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

All seven are misprints whose meaning is clear from the context. Each was confirmed in both the TeX and the PDF.

| Id | Where | What is printed | Correct reading |
| --- | --- | --- | --- |
| E1 | §1.2, p. 5 | "Geisser–Levine [GH] and Geisser–Hesselholt [GH]" | the first citation is [GL] |
| E2 | Remark 3.11 | the free functor F is called the "right adjoint" of U | it is the left adjoint |
| E3 | proof of Theorem 5.7 | "t^{2j} da ∧ db", "τ_{2s−2} ≡ Σ b_i ∧ c_i", "∈ k_i" | t^{2j} db ∧ dc; τ_{2s} ≡ Σ db_i ∧ dc_i; ∈ k_j. The growth bound should use C(2j+2, 2j); the argument is unaffected, since the two bounds differ by a factor ≤ 6 |
| E4 | proof of Lemma 5.30 | R^{r−s} | R^{s−r} |
| E5 | proof of Proposition 6.2 | "we can assume x^*α = 0" | x_0^*α = 0 |
| E6 | Example 6.10 | K(C; C_p) | K(C; Z_p) |
| E7 | before Theorem 6.11 | π_{n+1}(𝒯𝒞/p^r) is called the sheafification of π_n(TC(−)/p^r) | it is the sheafification of π_{n+1}(TC(−)/p^r) |

## What the atlas and the libraries already have

**Library (1).** Henselian pairs and henselian local rings: Mathlib's `HenselianRing` (exactly condition (2) of Definition 3.12), `HenselianLocalRing` and `IsAdicComplete.henselianRing`, in Mathlib/RingTheory/Henselian.lean at 082e2d3.

**Planned (18 items).**

| Topic | Planned in |
| --- | --- |
| Cyclotomic spectra, TC/TC^−/TP, the Nikolaus–Scholze formula, THH of rings, classical TR/TC | RefinedTraceMethods RT.2 |
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

1. **Hochschild, cyclotomic and refined trace methods, Part II: K-theory and topological cyclic homology of henselian pairs** (`RefinedTraceMethodsPartIIHenselianPairs`, 84 items). The main theorem is the henselian extension of RT.3's Dundas–Goodwillie–McCarthy theorem, and its key input sharpens RT.2. So the paper's theory is a Part II of RefinedTraceMethods, covering:
   - finiteness of TC/p, and nonunital henselian rings;
   - pseudocoherence and the axiomatic rigidity argument;
   - the equal-characteristic inputs and the proof of Theorem A;
   - I-adic continuity and discontinuity, and pro Geisser–Levine;
   - §6's comparisons: étale K-theory, the asymptotic comparison and split injectivity.

   The brief asks RT.3's henselian export, and the AMMN Part II, to import Theorem A from here.
2. **Hochschild, cyclotomic and refined trace methods, Part II: p-adic deformation of K-theory classes** (`RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses`, reused, 9 items). The AMMN extraction's brief already requires "the continuity theorems saying which comparison maps F(X) → F^cts(X) are p-adic equivalences". §5.2 proves them for K and TC: quickly converging towers, and Theorems 5.19–5.22 with Geisser–Hesselholt's Theorem 5.10.
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
| §3: nonunital and henselian rings, henselization, Gabber, Milnor squares | 038–049 |
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
