# PAPER-BHATT-MORROW-SCHOLZE-19: extraction and routing

Issue #1458. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*, Publ. Math. IHÉS 129 (2019), 199–310 (doi 10.1007/s10240-019-00106-9; arXiv 1802.03261).

The result has **114 items: 1 library, 56 planned and 57 missing**. The atlas already plans most of this paper, so it becomes a **source of existing layers**; no new roadmap is proposed. Twelve source routes take 56 missing items, and one item goes to a Part II already proposed by another extraction.

Twelve misprints are recorded under `sourceIssues`: eleven persist in the published version and one was corrected there. No error or gap was found.

## What the paper proves

**Motivic filtrations (Theorem 1.12).** For a quasisyntomic ring A:

- THH, TC^- and TP are locally even on the quasisyntomic site.
- Descending the double-speed Postnikov filtration from quasiregular semiperfectoid rings gives complete exhaustive multiplicative filtrations.
- The graded pieces are 𝒩^nΔ̂_A{n}[2n], 𝒩^{≥n}Δ̂_A{n}[2n] and Δ̂_A{n}[2n], built from:
  - Δ̂_A, the unfolding of π_0TC^-;
  - its Nygaard filtration;
  - its Breuil–Kisin twists.
- On TC the graded pieces are the syntomic complexes Z_p(n) = fib(φ − can : 𝒩^{≥n}Δ̂{n} → Δ̂{n}).

**Comparisons:**

- **Perfectoid rings (Theorem 1.6, §6).** For perfectoid R, π_0TC^-(R) = A_inf(R), with explicit π_* of THH, TC^-, TP and THH^{tC_p}. Over R, THH is a one-parameter deformation of HH(−/R) (Theorem 6.7).
- **A_inf-cohomology (Theorem 1.8, §9).** Δ̂_A ≃ AΩ_A for p-completed smooth O_C-algebras, and the Nygaard filtration corresponds to the Lη_ξ filtration (Proposition 9.10).
- **Crystalline cohomology (Theorems 1.10 and 8.17, §8).** For quasiregular semiperfect S, Δ̂_S ≅ Â_crys(S) ≅ L̂WΩ_S. A_crys(S) is p-torsion-free and equals the derived de Rham–Witt complex (Theorem 8.14). The Nygaard filtration of de Rham–Witt matches the décalage of Lη_p (§8.1).
- **Syntomic complexes (Theorem 1.15, §§8.4, 10).** Z_p(n) is WΩ^n_log[−n] for smooth algebras in characteristic p, and τ^{≤n}Rψ_*Z_p(n) (truncated p-adic nearby cycles) for smooth formal O_C-schemes. Z_p(0) = Z_p and Z_p(1) = T_pG_m (via K-theory). Conjecture 7.18 is that Z_p(n) is locally discrete; it holds in characteristic p, where Z_p(i)(S) = A_crys(S)^{φ=p^i} and K_*(S; Z_p) is computed (Corollary 8.23).
- **Cyclic homology (Theorem 1.17, §5).** HC^- and HP of quasisyntomic algebras are filtered by Hodge-completed derived de Rham cohomology.
- **Breuil–Kisin cohomology (Theorem 1.2, §11).** Relative THH over S[z] gives a Frobenius-twisted 𝔖-valued cohomology. Inverting u performs the Frobenius descent, using a Segal-conjecture statement (Corollary 8.18). This yields RΓ_𝔖(𝔛) for proper smooth formal O_K-schemes, recovering A_inf-, de Rham and crystalline cohomology.

**Foundations developed on the way:**

- the quasisyntomic site and its quasiregular semiperfectoid basis (§4);
- the Beilinson t-structure on the filtered derived category, and Lη as a Beilinson connective cover (§5.1);
- Adams operations acting with weight i (§9.4).

## Sources inspected

- [arXiv 1802.03261v2](https://arxiv.org/abs/1802.03261v2) (9 April 2019, 88 pages, "minor updates, final version"; v1 9 February 2018).
  - PDF SHA-256 `b2338ef1…b3594038`; TeX source SHA-256 `30968bad…b91878ac`.
  - The full TeX source `bms2.tex` (3266 lines) and the bibliography were read.
- The published article, [Publ. Math. IHÉS 129 (2019), 199–310](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-019-00106-9/), open access on Centre Mersenne (PDF SHA-256 `6b43d1ff…23ff23dd`).
  - It was compared with the arXiv text: all 173 numbered statements agree in number and kind.
  - Each recorded misprint was checked in both versions.
  - **Locators give the published page numbers.**
- Crossref lists no correction or update, and a Crossref search found none.

All sources were accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

All twelve are misprints whose meaning is clear from the context. None affects a result.

| Id | Where | Printed | Correct reading |
| --- | --- | --- | --- |
| E1 | §5.1 before Def. 5.3, p. 234 | the t-structure on D(R) has "connective objects DF^{≤0}(R)" | D^{≤0}(R) |
| E2 | proof of Lemma 4.34, p. 231 | L_{S/A} ∈ D(C) | D(S) |
| E3 | proof of Theorem 7.1, p. 255 | (Γ^i_R M)^∧_p | (Γ^i_S M)^∧_p |
| E4 | Theorem 7.2(2), p. 255 | the spectral sequences "calculating TC^-(R; Z_p)" and "TP(R; Z_p)" | TC^-(S; Z_p), TP(S; Z_p) |
| E5 | §7.4, p. 261 | Z_p(i)(A) := gr^n TC(A; Z_p)[−2i] | gr^i |
| E6 | proof of Prop. 7.17, p. 263 | "the p-adic completion of S … a quasisyntomic semiperfectoid" | of S^q; quasiregular semiperfectoid |
| E7 | proof of Prop. 8.4, p. 267 | "the boundary case i = n − 1" (with n < i) | n = i − 1 |
| E8 | proof of Lemma 9.4, arXiv p. 69 | (a_i) ∈ ∏ O_C^♭ | ∏ O_C (corrected in the published version) |
| E9 | proof of Theorem 9.6, p. 288 | "an honest map d_R" | d_S |
| E10 | Remark 10.6, p. 295 | g − μ^{i−j}φ^{−1}(g) | g − ξ^{i−j}φ^{−1}(g), since μ = ξφ^{−1}(μ) |
| E11 | §11.2, p. 302 | "the inclusion 𝔖 ↪ A_inf(O_K) fixed earlier" | A_inf(O_{K_∞}) |
| E12 | proof of Theorem 11.2, p. 306 | Δ̂_{A/𝔖} := gr^0(TC^-(A; Z_p)[1/u]) | gr^0(TC^-(A/S[z]; Z_p)[1/u]) |

## What the atlas and the libraries already have

**Library (1).** A_inf(R) = W(R^♭) and Fontaine's θ: Mathlib's `WittVector`, `PreTilt` and `WittVector.fontaineTheta` (for p-adically complete R, at 082e2d3). Neither library defines perfectoid rings, the cotangent complex, THH, de Rham–Witt complexes or the Nygaard filtration.

**Planned (56 items).** The atlas was written with BMS2 in view.

| Topic | Planned in |
| --- | --- |
| THH/TC^-/TP of perfectoid and quasiregular semiperfectoid rings, evenness, the motivic filtrations, Δ̂ and its twists, comparisons with Δ, AΩ and A_crys | RefinedTraceMethods RT.6 ("the BMS2 quasisyntomic THH/TC^-/TP computation and motivic-filtration interface") |
| THH, cyclotomic Frobenius, TC^-, TP, TC; TP ≃ (THH^{tC_p})^{hT}; Tsalidis and π_0TR = W | RefinedTraceMethods RT.2 |
| Derived HH, HC^-, HP; the HC^-/HP filtrations | RefinedTraceMethods RT.1 (with RT.6) |
| Bökstedt periodicity | KTheoryFiniteLocalFields L.5 (with RT.2) |
| Quasisyntomic rings and site, p-complete flatness, quasiregular semiperfectoid basis, unfolding, flat descent for ∧^iL and derived de Rham | DerivedDeRhamCohomology DD.0, DD.1, DD.5 (with PrismaticCohomology PR.2) |
| Cotangent complex; Hodge and conjugate filtrations | DerivedDeRhamCohomology DD.0, DD.2, DD.3 |
| Filtered derived category | DerivedDeRhamCohomology DD.1 |
| Lη and its lax symmetric monoidal structure | AInfCohomology AI.1 |
| Perfectoid rings, A_inf, μ and ξ, Breuil–Kisin twists | PerfectoidQuotients Q0, AInfCohomology AI.0 |
| Nygaard filtration, divided Frobenius, Nygaard as Lη filtration, A_crys(S) and its Nygaard filtration | PrismaticCohomology PR.3, CrystallineCohomology CR.0 |
| Syntomic complexes, their local discreteness, nearby cycles and log de Rham–Witt comparisons | PrismaticCohomology PR.4 |
| AΩ ≃ φ^*Δ | PrismaticCohomology PR.6 |
| Breuil–Kisin modules and cohomology, the 𝔖 prism | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4, AInfCohomology AI.7, PrismaticCohomology PR.0 |
| Left Kan extension of non-abelian derived functors | EnhancedDerivedSheaves E5:animation |
| K_0, K_1, K_2 of local rings | GeneralAlgebraicKTheory K.2:low-degree-comparisons |

## Routes

1. **Hochschild, cyclotomic and refined trace methods, Part II: K-theory and topological cyclic homology of henselian pairs** (`RefinedTraceMethodsPartIIHenselianPairs`, reused, 1 item). BMS2 uses Clausen–Mathew–Morrow's comparison K ≃ τ_{≥0}TC for rings henselian along p with semiperfect reduction (Theorem 7.15). The Clausen–Mathew–Morrow extraction proposes this Part II for their rigidity theorem, so the comparison goes there.
2. **Source routes (56 missing items, plus the planned items for which BMS2 is the main source).** The largest routes are:
   - **RefinedTraceMethods RT.6** (21 missing, 27 planned). The supporting constructions of BMS2's trace computations:
     - non-Nygaard-completed Δ and AΩ;
     - the almost-mathematics and Cartier steps of Theorem 9.6;
     - the Segal-conjecture statements (Corollaries 8.18 and 9.12);
     - Adams operations and the invertibility lemma for twists;
     - comparison with BMS1's twist;
     - relative THH over S[z], also routed there by the AMMN extraction;
     - the K-theoretic identifications of Z_p(0), Z_p(1) and K_*(S; Z_p), routed as the Bhatt–Mathew extraction routes "syntomic complexes via algebraic K-theory".
   - **PrismaticCohomology PR.4** (8 missing, 3 planned). The lemmas behind Theorem 1.15: logarithmic forms as Frobenius fixed points, φ_i − 1 surjectivity and Z_p(i) of quasiregular semiperfect rings, commutation with filtered colimits, and the nearby-cycle computations of §10.
   - **DerivedDeRhamCohomology DD.4** (5 missing). BMS2 §8.2 extends Bhatt's A_crys = derived de Rham theorem to all quasiregular semiperfect rings, with the conjugate filtration on divided power envelopes, derived de Rham–Witt and the structure theorem for A_crys(S).
   - **CrystallineCohomology CR.4** (5 missing). The Nygaard filtration on de Rham–Witt complexes and its relations to the conjugate and Hodge filtrations, to Lη_p and to Frobenius lifts, plus Illusie's logarithmic sequence (also routed there by the Clausen–Mathew–Morrow extraction).
   - **AInfCohomology AI.7** (5 missing, 1 planned). The Frobenius-twisted Breuil–Kisin complex, descent by inverting u, the two Nygaard remarks, and the de Rham torsion consequence.

   The remaining source routes are small:
   - RefinedTraceMethods RT.1 (3 items): integral HKR filtration, p-complete quasismooth HKR, universal property of HH.
   - RefinedTraceMethods RT.2 (1 item): THH ⊗_{THH(Z)} Z ≃ HH.
   - DerivedDeRhamCohomology DD.0 (1 item): Avramov's theorem.
   - DerivedDeRhamCohomology DD.1 (3 items): Beilinson t-structure, Ext in Ch(R), weak Postnikov towers.
   - DerivedDeRhamCohomology DD.5 (2 missing, 5 planned): the proj-quasisyntomic variant, and extension to formal étale sites.
   - AInfCohomology AI.1 (1 item): Lη as a Beilinson connective cover.
   - PrismaticCohomology PR.3 (1 item): the Nygaard filtration in q-de Rham coordinates.

Nothing in BMS2 lies outside the directions of existing layers, so no Part II or new roadmap is proposed.

## Coverage crosswalk

Item numbers are the suffixes after `PAPER-BHATT-MORROW-SCHOLZE-19/`.

| Paper block | Items |
| --- | --- |
| §1: Breuil–Kisin modules, Theorems 1.2–1.17, Δ̂ and the quasisyntomic site | 001–015 |
| §2: left Kan extension, cotangent complex, HH, HKR, THH, TP, Bökstedt, THH vs HH | 016–024 |
| §3: flat descent | 025–027 |
| §4: p-complete flatness, Avramov, HKR, perfectoid and quasiregular semiperfectoid rings, unfolding, variants | 028–037 |
| §5: filtered derived category, Beilinson t-structure, Lη, derived de Rham sheaves, HC^- | 038–045 |
| §6: THH, TC^-, TP of perfectoid rings, twists, TR, deformation, Hesselholt | 046–054 |
| §7: quasiregular semiperfectoids, motivic filtrations, Nygaard, Z_p(i), K-theory | 055–070 |
| §8: Nygaard on de Rham–Witt, A_crys, derived de Rham–Witt, TC^- in characteristic p, Segal, Z_p(i), K-theory | 071–089 |
| §9: A_inf notation, almost mathematics, AΩ comparison, Nygaard, Segal, Adams operations | 090–100 |
| §10: nearby cycles | 101–104 |
| §11: Breuil–Kisin prism, relative THH, twisted Breuil–Kisin cohomology, Frobenius descent | 105–114 |

## Prerequisite papers the atlas does not cover

- Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory* (Publ. IHÉS 2018), queued as issue #1462.
- Avramov (Annals 1999).
- Beilinson, *On the derived category of perverse sheaves* (LNM 1289).
- Gwilliam–Pavlov (JPAA 2018).
- Tsalidis (Topology 1998).
- Hesselholt–Madsen (Topology 1997).
- Hesselholt:
  - *TC of the algebraic closure of a local field* (Contemp. Math. 399);
  - *THH and the Hasse–Weil zeta function* (Contemp. Math. 708).
- Geisser–Hesselholt, *The de Rham–Witt complex and p-adic vanishing cycles* (JAMS 2006).
- Scholze–Weinstein, *Moduli of p-divisible groups* (Camb. J. Math. 2013).
- Morrow, *p-adic vanishing cycles as Frobenius-fixed points* (arXiv 2018).
- Nygaard (Ann. ÉNS 1981).
- Kisin, *Crystalline representations and F-crystals* (Progr. Math. 253).

Every DOI was checked against Crossref. Some works are not re-listed because earlier extractions list them or the atlas already cites them:

- Nikolaus–Scholze, Clausen–Mathew–Morrow and Geisser–Hesselholt 1999 (listed by the Clausen–Mathew–Morrow extraction);
- Bhatt–Scholze *Prisms* (extracted);
- Bhatt's derived de Rham papers and Illusie (cited by the DerivedDeRham and Crystalline roadmaps).

## Independent review (`REV-PAPER-BHATT-MORROW-SCHOLZE-19`, issue #1459)

Claude Code, session `cc-fb70e5`, 23 September 2026. **Verdict: accept**, all thirteen routes accepted,
nothing corrected in place. The full review is in
[`reviews/REV-PAPER-BHATT-MORROW-SCHOLZE-19.md`](../reviews/REV-PAPER-BHATT-MORROW-SCHOLZE-19.md).

All three recorded artifact hashes match byte for byte, and having both the arXiv and the published text
mattered: two findings are quoted in the published phrasing and were verified there. Simulating the shared
per-section counter independently gives the same **173 numbered objects**, and **every one is covered** —
once locator ranges are expanded. (My first pass flagged Lemmas 4.16 and 4.26 as uncovered; they are cited
inside "Lemmas 4.15–4.17" and "Lemmas 4.25–4.27", and 4.16's content is also folded into the
quasisyntomic-site item. Expanding ranges before auditing coverage is the lesson.) The four genuinely
uncovered objects are introductory remarks, all commentary. The `library` item's three declarations exist
at Mathlib `082e2d3`, and all 22 `planned` layers exist. The Part II route is exemplary: it adds a single
item to a roadmap that the Clausen–Mathew–Morrow and Clausen–Mathew extractions already propose with the
same parent, instead of opening a rival. All **12 findings are confirmed**, two of them by computation —
the boundary case is `n = i − 1`, as the display's `p^{i−1−n}V` shows, and the coefficient in Remark 10.6
is `ξ^{i−j}`, since `μ = ξφ^{−1}(μ)`.
