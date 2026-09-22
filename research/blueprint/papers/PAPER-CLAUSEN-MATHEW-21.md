# PAPER-CLAUSEN-MATHEW-21: extraction and routing

Issue #1290. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Dustin Clausen and Akhil Mathew, *Hyperdescent and étale K-theory*, Invent. Math. 225 (2021), 981–1076 (doi 10.1007/s00222-021-01043-3; arXiv 1905.06611).

The result has **195 items: 3 library, 12 planned and 180 missing**. The missing items are routed exactly once, by six routes:

- two new Part IIs, one of EnhancedDerivedSheaves (83 items) and one of MotivicEtaleKTheory (70 items);
- one existing proposal, reused: the henselian-pairs Part II of RefinedTraceMethods (7 items);
- three source routes (20 items).

The paper was read in full. Five misprints are recorded under `sourceIssues`. No error or gap was found.

## What the paper proves

Étale K-theory K^et is defined here in the simplest way: sheafify nonconnective K-theory for the étale topology on qcqs E_2-spectral algebraic spaces. Sheafification of spectra is hard to access, but the paper controls K^et completely:

- **Theorem 1.1 (7.12(1)).** K^et(X) → K^Sel(X) = L_1K(X) ×_{L_1TC(X)} TC(X) is an isomorphism in degrees ≥ −1. Selmer K-theory depends only on Perf(X), so K^et keeps the flexibility of K-theory.
- **Theorem 1.2 (7.13), Lichtenbaum–Quillen in all characteristics.** K(X) → K^et(X) is a p-local isomorphism in degrees ≥ max(d − 2, 0). Here d bounds vcd_p of the residue fields away from p and 1 + log_p[k : k^p] at p.
- **Theorem 1.3 (7.12(2)).** Under finite Krull dimension and bounded virtual cohomological dimension, K^et is a Postnikov sheaf, with a convergent descent spectral sequence, and every K^et-module sheaf is too.
- **Theorem 1.5 (7.12(3)).** K^et commutes with filtered colimits, so its stalks are K-theory of strictly henselian rings.
- **Theorem 1.11 (7.14).** L_n^f-local localizing invariants satisfy étale hyperdescent, strengthening Clausen–Mathew–Naumann–Noel.

Behind these is a theory of hypercompleteness for sheaves of spectra:

1. **Zariski and Nisnevich (Theorem 1.7 = 3.12, 3.18).** The topoi of qcqs algebraic spaces of Krull dimension d have homotopy dimension ≤ d, without noetherian hypotheses. So every sheaf is a hypersheaf. The proofs pass to finite spectral spaces and to p-Nisnevich sites attached to spectral stratifications, using that homotopy dimension survives filtered colimits of excisive finitary sites.
2. **Profinite groups (Theorem 1.8 = 4.26).** For G of finite cohomological dimension d, a sheaf on 𝒯_G is hypercomplete iff its Galois actions are d-nilpotent. Tate vanishing does not suffice: the constant sheaf K(n) on 𝒯_{Z_p} is not hypercomplete (Example 4.15, answering Jardine).
3. **Étale = Nisnevich + Galois (Theorem 1.6 = 4.36, Theorem 4.38).** Consequently étale hypercompletion is smashing (Theorem 1.9 = Corollary 4.40), and modules over hypersheaves are hypersheaves (Corollary 1.10).

The K-theoretic inputs are:

- Gabber–Suslin rigidity, and the rigidity theorem of Clausen–Mathew–Morrow;
- the norm-residue theorem (Beilinson–Lichtenbaum), and at p the Geisser–Levine and Geisser–Hesselholt theorems;
- Drinfeld's vanishing of K_{−1} for henselian local rings;
- a new proof that TC is an étale hypersheaf over E_2-bases (Theorem 5.16);
- the extension of Clausen–Mathew–Naumann–Noel's L_n^f-local étale descent from E_∞ to E_2 bases, via Dundas–Goodwillie–McCarthy and noncommutative motives (Theorem 5.39).

## Sources inspected

- [arXiv 1905.06611v3](https://arxiv.org/abs/1905.06611v3) (18 March 2021, 89 pages, "various corrections and edits"; v1 16 May 2019, v2 12 June 2019).
  - PDF SHA-256 `e8f55e27…64265eab2a`; TeX source SHA-256 `7e5275ac…7cadd8`.
  - The full TeX source `hyper_revised_2.tex` (5230 lines) and the bibliography were read.
  - All locators, page, equation and footnote numbers refer to the arXiv v3 PDF.
- The published Inventiones PDF could not be retrieved (the request returned an HTML page) and was not compared.
- Crossref lists no correction or update for the DOI.

All sources were accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

All five are misprints whose meaning is clear from the context. Each was confirmed in both the TeX and the PDF.

| Id | Where | What is printed | Correct reading |
| --- | --- | --- | --- |
| E1 | proof of Proposition 3.9, p. 26 | "assuming G ∈ Sh^f(C)_{≥d+1}" | G ∈ Sh(C)_{≥d+1}: only F is finite, and the step uses only the connectivity of G |
| E2 | proof of Proposition 4.23, p. 48 | S^{ρ̃_G} is "the one-point compactification of G" | the one-point compactification of ρ̃_G |
| E3 | proof of Corollary 4.39, p. 55 | A_{V→U} and F(Y) are "d-nilpotent" | (d + l)-nilpotent as in Theorem 4.38(3), and F(V) for F(Y); the corollary defines no d |
| E4 | proof of Theorem 6.18, p. 78 | "if R′ is a finite étale R-algebra, then R is a finite product of henselian local rings" | R′ is |
| E5 | p. 7 and proof of Proposition 5.33, p. 67 | "the May nilpotence conjecture [MNN19]", where [MNN19] is *Derived induction and restriction theory* (Geom. Topol. 2019) | the conjecture is proved in Mathew–Naumann–Noel, *On a nilpotence conjecture of J. P. May*, J. Topol. 8 (2015) |

For E5 the arXiv abstracts of both papers and their Crossref records were checked. The TeX key is `MNN15`, but its bibliography entry prints the 2019 paper, which remains the right citation for the Euler-class criterion in Proposition 4.23.

## What the atlas and the libraries already have

**Library (3 items).** These are read at Mathlib 082e2d3:

- spectral spaces and spectral maps (`SpectralSpace`, `IsSpectralMap`);
- the spectral space Spec(R) (the `SpectralSpace` instance on `PrimeSpectrum`, Topology.lean:842);
- Krull dimension (`topologicalKrullDim`, `PrimeSpectrum.topologicalKrullDim_eq_ringKrullDim`).

Neither Mathlib nor Tau Ceti has sheaves of spectra, ∞-topoi, the Nisnevich topology, spectral algebraic geometry, Bousfield localization, THH/TC or K-theory spectra.

**Planned (12 items).**

| Topic | Planned in |
| --- | --- |
| Hochster's presentation of spectral spaces | DiamondsAndVStacks D0 |
| The étale site of a qcqs algebraic space | SchemeAndStackFoundations SF.1, SF.2 |
| cd_p and vcd_p of profinite groups and fields | Tau Ceti ProfiniteCohomology, layer 11 |
| Continuous cohomology through finite quotients | Tau Ceti ProfiniteCohomology, layers 4 and 10 |
| Nonconnective K, THH, TC and the trace | GeneralAlgebraicKTheory K.6, RefinedTraceMethods RT.2–RT.3 |
| Dundas–Goodwillie–McCarthy | RefinedTraceMethods RT.3 |
| K-theory commutes with filtered colimits | GeneralAlgebraicKTheory K.7 |
| Gabber rigidity away from p | KTheoryFiniteLocalFields L.2 |
| Quillen's K-theory of finite fields | KTheoryFiniteLocalFields L.1 |
| The motivic filtration | MotivicEtaleKTheory M.6 |
| Beilinson–Lichtenbaum | MotivicEtaleKTheory M.5, M.7 |
| Lichtenbaum–Quillen for fields of finite cd_p away from p | MotivicEtaleKTheory M.7 |

**What the atlas lacks.**

- EnhancedDerivedSheaves E2 plans Postnikov completion, the finite-cohomological-dimension criterion and hypercovers for *derived categories* of sheaves. Nothing plans:
  - hypercompleteness of sheaves of spectra, or smashing hypercompletion;
  - homotopy dimension;
  - the Nisnevich topology on non-noetherian algebraic spaces;
  - nilpotence criteria for Galois descent.
- M.7 plans étale K-theory and Quillen–Lichtenbaum for fields and S-integers away from the residue characteristic. Nothing plans:
  - E_2-spectral algebraic spaces;
  - chromatic localization;
  - Selmer K-theory;
  - étale descent for localizing invariants;
  - the p-adic, integral and non-noetherian versions of these theorems.

## Routes

1. **Enhanced derived categories of sheaves, Part II: hypercompleteness of sheaves of spectra on Zariski, Nisnevich and étale sites** (`EnhancedDerivedSheavesPartIIHypercompleteSheavesOfSpectra`, area `etale`, 83 items). The paper's §§2.2–4 extend E2 in its own direction:
   - smashing hypercompletion and the local–global principle;
   - finitary and excisive sites, and nilpotence criteria for hyperdescent;
   - homotopy dimension, spectral spaces and the Nisnevich topos;
   - the site 𝒯_G with nilpotence in Fun(BG, 𝒞) and Tate–Thomason;
   - the étale topos as Nisnevich plus Galois.
2. **Motivic and étale methods for arithmetic K-theory, Part II: Selmer K-theory and étale K-theory of spectral algebraic spaces** (`MotivicEtaleKTheoryPartIISelmerAndEtaleKTheory`, area `ktheory`, 70 items). This Part II goes further in M.7's direction. It also owns the inputs no other layer plans:
   - chromatic localizations, Kuhn's Tate vanishing and May's nilpotence conjecture;
   - E_2-spectral algebraic spaces, and localizing invariants over them;
   - THH/TC étale descent;
   - L_n^f-local finite étale descent through noncommutative motives;
   - Selmer K-theory, Lichtenbaum–Quillen and étale K-theory.

   Two chromatic examples also go here: the K(1)-acyclic Example 2.18 and the non-hypercomplete sheaf of Example 4.15. This keeps chromatic homotopy theory out of route 1, which this Part II imports.
3. **Hochschild, cyclotomic and refined trace methods, Part II: K-theory and topological cyclic homology of henselian pairs** (`RefinedTraceMethodsPartIIHenselianPairs`, reused, 7 items). The Clausen–Mathew–Morrow extraction (merged in #1985) proposes this Part II. It already owns the inputs this paper takes from that work:
   - rigidity, Theorem G and Theorem C;
   - Geisser–Levine and Geisser–Hesselholt;
   - the mod p cohomological dimension of F_p-algebras;
   - rigidity along extensions of separably closed fields, hence Gabber–Suslin invariance.
4. **Source routes (20 items).**
   - EnhancedDerivedSheaves E2 (16 items): the standard facts on Grothendieck prestable ∞-categories in §2.1 (Definition 2.4 to Example 2.21, except Examples 2.12 and 2.18) and the Dugger–Hollander–Isaksen hypercover construction (Proposition 2.36). E2 already receives the hyperdescent results of Bhatt–Scholze.
   - SchemeAndStackFoundations SF.1 (2 items): Rydh's stratification into finite étale pieces, and étale dévissage.
   - SchemeAndStackFoundations SF.0 (2 items): henselization and strict henselization, and noetherian approximation. The Clausen–Mathew–Morrow extraction routes henselization of pairs to SF.0.

**Dependencies between the Part IIs.**

- Route 2 imports route 1.
- Route 2 imports route 3's rigidity.
- Route 3's item 111 needs route 2's Theorem 5.16 (TC/p is an étale Postnikov sheaf) and route 1's Nisnevich homotopy dimension.

This is a layer-level dependency in both directions between routes 2 and 3, like the one between EnhancedDerivedSheaves E4 and DerivedDeRhamCohomology DD.1. The briefs of routes 2 and 3 say so.

## Coverage crosswalk

Item numbers are the suffixes after `PAPER-CLAUSEN-MATHEW-21/`.

| Paper block | Items |
| --- | --- |
| §1: Theorems 1.1–1.3, 1.5–1.9, Corollary 1.10, Theorem 1.11 (with their §§3–7 counterparts) | 001–011 |
| §2.1: prestable ∞-categories, hypercompleteness, cohomological dimension, completions (Example 2.18 is 024) | 012–027 |
| §2.2: smashing hypercompletion, local–global principle, strong generation | 028–033 |
| §2.3: finitary sites, HZ-modules, nilpotence and hyperdescent, DHI hypercovers, Example 2.12 | 034–042 |
| §3.1: homotopy dimension, excisive sites, approximation by finite sheaves | 043–051 |
| §3.2: spectral spaces, Hochster, Sancho de Salas, Theorems 3.12 and 3.14 | 052–060 |
| §3.3: étale and Nisnevich sites, Rydh, stratifications, p-Nisnevich sites, Theorem 3.18 consequences | 061–079 |
| §4.1: profinite groups, 𝒯_G, sheafification, nilpotence, Tate–Thomason (with Proposition 7.1 at 087) | 080–109 |
| §4.2: ind-étale extension, henselization, points, Theorems 4.36–4.38, Corollary 4.39 | 110–117 |
| Chromatic inputs: L_1, L_n^f, Kuhn, Example 4.15, May nilpotence | 118–121 |
| §5.1–5.2: E_2-spectral algebraic spaces, Perf, localizing invariants, Nisnevich descent | 122–133 |
| §5.3: THH étale base change, TC étale hyperdescent, Galois nilpotence of TC | 134–139 |
| §5.4: finite étale descent for L_n^f-local invariants, noncommutative motives | 140–154 |
| Inputs: Clausen–Mathew–Morrow, Geisser–Levine/Hesselholt, Gabber–Suslin, Quillen, motivic filtration, Beilinson–Lichtenbaum | 155–166 |
| §6.1: Selmer K-theory, finitariness, fppf descent, stalks, homotopy sheaves | 167–178 |
| §6.2: Lichtenbaum–Quillen for fields and in general | 179–187 |
| §7 and Remark 3.31: big étale site, K^et, Proposition 7.11, Corollary 7.15 | 188–195 |

## Prerequisite papers the atlas does not cover

- Clausen, *A K-theoretic approach to Artin maps* (arXiv 2017).
- Clausen–Mathew–Naumann–Noel (JEMS 2020).
- Mathew–Naumann–Noel:
  - *Nilpotence and descent in equivariant stable homotopy theory* (Adv. Math. 2017);
  - *Derived induction and restriction theory* (Geom. Topol. 2019);
  - *On a nilpotence conjecture of J. P. May* (J. Topol. 2015).
- Thomason, *Algebraic K-theory and étale cohomology* (Ann. Sci. ÉNS 1985, with the 1989 erratum).
- Rosenschon–Østvær (Topology 2005; JPAA 2006).
- Rydh (J. Algebra 2011).
- Dugger–Hollander–Isaksen (Math. Proc. Cambridge 2004).
- Blumberg–Gepner–Tabuada (Geom. Topol. 2013).
- Hoyois–Scherotzke–Sibilla (Adv. Math. 2017).
- Drinfeld (Progr. Math. 244, 2006).
- Kuhn (Invent. 2004).
- Suslin, *On the K-theory of local fields* (JPAA 1984).
- Goerss–Hopkins (LMS Lecture Notes 315, 2004).
- Bachmann–Hoyois (Astérisque 425).
- Bhatt–Clausen–Mathew (Selecta 2020).
- Mitchell (Fields Inst. Commun. 16, 1997).
- Hochster (Trans. AMS 1969).
- Sancho de Salas–Sancho de Salas (Topology Appl. 1991), with Isbell (1985).
- Lurie, *Spectral Algebraic Geometry* (with HTT, HA and DAG XI).

Every DOI was checked against Crossref. Three papers are not re-listed because the Clausen–Mathew–Morrow extraction already lists them: Gabber (Contemp. Math. 126), Geisser–Levine and Geisser–Hesselholt. Miller's *Finite localizations* (Bol. Soc. Mat. Mexicana 1992) has no DOI; it is named in item 118.
