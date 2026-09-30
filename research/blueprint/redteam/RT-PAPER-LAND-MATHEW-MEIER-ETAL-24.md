# RT-PAPER-LAND-MATHEW-MEIER-ETAL-24: red team of the Land–Mathew–Meier–Tamme extraction

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4330).

**Target.** `PAPER-LAND-MATHEW-MEIER-ETAL-24` extracts M. Land, A. Mathew, L. Meier and G. Tamme, *Purity in chromatically localized algebraic K-theory*, [J. Amer. Math. Soc. 37 (2024), 1011–1040](https://doi.org/10.1090/jams/1043). The extraction reads the accepted version, [arXiv:2001.10425v5](https://arxiv.org/abs/2001.10425v5).

**Who did what.**
- Claude Code `cc-7b31c4` wrote the extraction (issue #2186, PR #2209).
- `REV-PAPER-LAND-MATHEW-MEIER-ETAL-24` (`cc-fb70e5`, issue #2187, PR #2386) accepted it and changed nothing in place.
- I did neither job, and the string `cc-f805bf` occurs in none of the four target files.

**Disclosure.** This session wrote RT-PAPER-NIKOLAUS-SCHOLZE-18 (PR #4708). Its finding /5 concerned who owns the ∞-category Sp of spectra, and **finding 13** below applies the same reading. Findings 9 and 12 use that extraction's routes and Mathlib, not that finding.

**Result: fourteen findings.** Two are high, six medium and six low. The machine-readable file is [RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.result.json](RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.result.json).

- **Where the work is sound.**
  - Item by item, the 101 statements are faithful to the paper, with the few exceptions of findings 2, 10 and 11.
  - E1 holds.
  - The Part II title and the two areas are in order.
- **Where it breaks.** Ownership:
  - the ∞-categorical K-theory the paper runs on is routed into classical layers whose blueprints are already finished without it;
  - the chromatic basics duplicate an earlier extraction's items, and that extraction uses a different convention;
  - ku and KU are planned twice;
  - two Tau Ceti owners are not imported.
- **What the extraction gets wrong.**
  - One item states Kuhn's theorem falsely.
  - E2 is not a misprint in the printed paper.

## Source

Fetched on 30 September 2026.

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v5 PDF (29 pp., 18 Dec 2023) | [arXiv](https://arxiv.org/pdf/2001.10425v5) | `9eabee34…040baa2f` (matches the extraction) |
| arXiv v5 e-print | [arXiv](https://arxiv.org/e-print/2001.10425v5) | `e7ab1af6…bd025d7d` (matches) |
| Published, JAMS 37 (2024), 1011–1040 | [AMS](https://www.ams.org/jams/2024-37-04/S0894-0347-2024-01043-X/) | landing page only; the PDF is not served |

- **Versions.**
  - v5 is the latest of five. I also read v4's e-print, for finding 10.
  - To check the paper's citations I read Clausen–Mathew–Naumann–Noel [arXiv:2011.08233](https://arxiv.org/abs/2011.08233) v1 and v2.
- **How I read it.**
  - I read the whole LaTeX source against the PDF text layer.
  - I rendered pp. 25–26 as images to see how 𝒪_𝒞(G) is actually typeset.
  - I compared every citation inside a proof with the items.

## Findings

### 1. The foundations the Part II imports are planned nowhere (high, error)

**The route.** Route 3 sends twelve items to GeneralAlgebraicKTheory K.4, K.6 and K.7 as a source:
- localizing invariants on Cat_∞^perf;
- S_• of a small stable ∞-category;
- BGL(A)⁺ for ring spectra;
- K^add and the additive Schwede–Shipley theorem;
- the stable envelope;
- Land–Tamme and truncating invariants;
- Thomason–Neeman localization;
- the theorem of the heart;
- Antieau–Gepner–Heller dévissage;
- A-theory.

**Why it fails.**
- The stage texts are classical: Waldhausen categories, flasque enlargement, and Morita and products.
- Both GAKT blueprints were accepted on 28 September with every stage `source_decomposed`. They read only the K-book and Schlichting, and plan none of this.
- Their job issues (#737, #738) were created on 16 September, before the extraction, so the source route never reached them.
- The Part II brief nevertheless says "Import, never re-plan" these items from K.4/K.6/K.7. Lemma 3.7, Propositions 3.4, 3.6 and 3.12, and Theorem 3.8 all rest on them.

**Elsewhere in the atlas.** Other extractions give the same material inconsistent statuses:
- CLAUSEN-MATHEW-21/127 marks it planned at K.6;
- CLAUSEN-MATHEW-21/129–130 route it to a Part II that was rejected;
- CLAUSEN-MATHEW-MORROW-21/074 routes Land–Tamme excision to RT.3.

**Fix.** Move the twelve items into the Part II as its first layer, "K-theory of small stable ∞-categories and localizing invariants". Import from GAKT only what it does plan:
- K.2:plus and H.3 (plus construction);
- K.3 (Quillen dévissage);
- K.4 (Waldhausen S_•);
- K.5 (excision);
- K.6 (nonconnective K).

Give /28 and /32 notes so that CM21 and CMM21 share this owner.

### 2. Item /48 states Kuhn's theorem falsely (high, error)

**The claim.** Item /48 says: "For a T(n)-local spectrum X the Tate construction X^{tC_p} vanishes". The paper says only that (L_n^{p,f}S)^{tC_p} is an L_{n−1}^{p,f}S-algebra (p. 16).

**Why it is false.** Kuhn's theorem says that L_{T(n)}(X^{tG}) = 0, not that X^{tG} = 0. Its blueshift form, as quoted by CMNN on p. 3, is that X^{tC_p} is L_{n−1}^{p,f}-local when X is L_n^{p,f}-local.

**Counterexample.**
1. Take KU_p^∧ with trivial action. It is K(1)-local, hence T(1)-local.
2. For a complex-oriented E, π_*E^{tC_p} = E_*((x))/[p](x). Here [p](x) = x·Φ_p(1+x).
3. So π_0 = Z_p[ζ_p][1/(ζ_p−1)] = Q_p(ζ_p) ≠ 0.

**Why it matters.** The brief makes Kuhn's theorem a final theorem of the chromatic roadmap.

### 3. The chromatic basics already have a claimant, with another convention (medium, duplicate)

**The earlier claimant.** PAPER-CLAUSEN-MATHEW-21 was merged a day before this extraction. It routes chromatic material to a MotivicEtaleKTheory Part II:
- /118 (L_1, L_{K(1)}, L_n^f, Morava K-theories, telescopes);
- /150;
- /024;
- /142 (CMNN descent).

Its review then rejected that route because generic chromatic material "must be supplied by [its] owning roadmaps". The chromatic roadmap proposed here is that owner, but neither brief says so.

**The conventions clash.** CM21 sets T(0) = HQ and takes L_n^f to be p-local. This paper sets T(0) = S[1/p] and uses L_n^{p,f}.

**What the report and the review missed.** Both say that no other paper routes this material. Their searches looked at layer text, not at other extractions' items.

**Fix.** Name CM21's items as a second source of the chromatic roadmap. Fix one T(0) convention and state the other as a comparison lemma. Add L_1.

### 4. ku, KU and Bott are planned at RT.4:topological (medium, duplicate)

**The problem.** Item /82 marks ko, ku, KO and KU all missing. But RT.4:topological constructs ku and KU, with π_*ku = Z[β]. The brief both imports RT.4:topological and says "Construct here … real and complex topological K-theory".

**Fix.** Split /82. Only ko, KO and β ∈ π_8 ko are missing.

### 5. About a dozen cited theorems have no item (medium, missing)

Each of these is cited in a proof and has no item, so it has no status:

- (a) Waldhausen / [LT19, Lemma 2.4]: K⊗S[1/p] is truncating on T(0)-acyclic ring spectra, and p-adic K is truncating on S[1/p]-algebras. This is used in six places.
- (b) The Bousfield–Kuhn functor, Φ_i∘Ω^∞ ≃ L_{T(i)} ([Kuh08, Thm 1.1]), which is all of Proposition 2.9's proof.
- (c) Bousfield's theorem ([Bou01, Cor 4.8]; [BHM21]) and the Serre spectral sequence in T(i)-homology.
- (d) Hopkins–Smith:
  - the nilpotence theorem (Thm 3);
  - the thick subcategory theorem (Thm 7);
  - centrality (Thm 11);
  - Cor 3.8.
- (e) Mahowald–Sadofsky, Prop 3.3 and Lemma 2.1.
- (f) [BGT, Thm 9.53].
- (g) Weibel's NK result [Wei81], which is all of Corollary 4.25's proof.
- (h) The inputs of Corollary 4.21:
  - Ravenel's Bousfield-class theorem;
  - the L_n lemmas, including "K(n)- and T(n)-localization coincide on L_n-local spectra", which the paper proves in-line;
  - Mathew–Meier's GL_2(F_3)-Galois extension;
  - CMNN20's Galois descent.
- (i) The existence theorems behind E_n and O^top (Goerss–Hopkins–Miller, Lurie).
- (j) The James splitting.

Several of the cited works are also absent from `prerequisites`:
- CMNN20;
- Ravenel 1984;
- Hebestreit–Steimle;
- Pstrągowski–Patchkoria;
- Hesselholt–Nikolaus;
- Weibel 1981;
- Mahowald–Ravenel–Shick.

### 6. K₀ nil-invariance (item /68) is not planned (medium, error)

**The problem.**
- K.3 plans G-theory dévissage, whose standing instance is "the G-theory of a ring modulo a nilpotent ideal".
- The K₀ packet (KTheoryLowDegrees--U.1) excludes it outright: "Not targets of Z.1 and so not planned here: … nilpotent-ideal invariance (II.2.2)".
- The item's own note concedes the gap.

**What exists.** Mathlib has the algebraic input: `CompleteOrthogonalIdempotents.lift_of_isNilpotent_ker` (RingTheory/Idempotents.lean:325).

**Fix.** Split /68. Keep the degree < 0 part planned at K.6. Mark K₀ nil-invariance missing and route it.

### 7. E2 is not a misprint in the printed paper (medium, error)

**What E2 rests on.** The LaTeX writes `\mathscr{Cyc}` in Proposition 4.33 and in Corollary 4.34's display, and `\mathscr{C}` in Corollary 4.34's first sentence.

**What the paper actually prints.** Under euscript the lower-case "yc" does not print. The v5 PDF prints the same 𝒪_𝒞(G) in all three places:
- Proposition 4.33 (p. 25);
- the first sentence of Corollary 4.34 (p. 26);
- the display of Corollary 4.34.

**What went wrong.** The review confirmed E2 from the source alone. The public register now lists it as a new confirmed mistake.

**Fix.** Withdraw E2.

### 8. The chromatic brief skips two Tau Ceti owners (medium, missing)

- **tauceti AlgebraicTopology** plans finite CW complexes, Hurewicz, Whitehead and the ordinary Serre spectral sequence.
- **tauceti ModularCurves 7E** plans the height-2 formal group of a supersingular curve, with Lazard's classification. Tau Ceti also has `WeierstrassCurve.formalAdd` (…/EllipticCurve/FormalGroup/Add/Series.lean:84).

The brief lists these under "Construct here" and names neither roadmap as a prerequisite.

### 9–14. Low findings

- **9 (duplicate).** Item /49 bundles NS18 Theorems I.3.3 and I.3.6 into RT.2. NIKOLAUS-SCHOLZE-18 routes them (/24, /26) to E5.
- **10 (missing source issues).** Two new misprints:
  - p. 23: "the last assertion of Corollary 4.30 also appears in [BCM]" should cite Corollary 4.23. The slip is also in v4.
  - p. 15: "[CMNN23, Lemma 4.5]" uses CMNN's v1 numbering; in v2 it is Theorem 4.6.
- **11 (error).** Item drift:
  - /31 cites the wrong Waldhausen paper (Wal84 instead of Wal78);
  - /47 misdescribes CMNN's lemma, which holds for any E_∞-ring;
  - /72 puts Antieau's bound 4p−4 ≥ n on the truncation degree; it is on the height;
  - /99 writes 𝒪_𝒞yc for the printed 𝒪_𝒞.
- **12 (library-claim).** The report says Mathlib has "no Bousfield localization", and the brief says Mathlib has "nothing else of this". Mathlib 082e2d3 in fact has:
  - `ObjectProperty.isLocal` and `isLocalization_isLocal` (Localization/Bousfield.lean:56, :239);
  - `isLocal_trW` (Triangulated/Orthogonal.lean:74);
  - triangulated localization;
  - t-structures with `bounded` and `heart`.

  The statuses stand, but these are the comparison targets.
- **13 (error).** /1's planned list omits H.5:S-delooping (smash products) and E5:spectra-comparison, where Sp is actually assembled. This finding applies RT-NS18/5.
- **14 (other).** Provenance:
  - the page range 1011–1040 is known;
  - the AMS page now answers, although the PDF is still not served;
  - the extraction has no `sourceVersions`.

## What held

- **Items.** Checked against the paper and faithful:
  - Theorem A and Theorem 3.8;
  - Theorem 1.1 and the Purity Theorem, with its optimality;
  - the height definition and its footnote;
  - Theorem B and the Redshift Theorem;
  - Corollaries C–F;
  - all of §2;
  - Propositions 3.1, 3.4, 3.6 and 3.12;
  - Remark 3.9's induction, including the order of its two maps;
  - every corollary of §4.

  I re-derived the height bookkeeping of Corollaries 4.9–4.21 and the proofs of Corollary 4.14 and Remark 4.27.
- **Statuses.**
  - No library items is correct: neither pinned library has spectra.
  - /39 (L.1), /63 (RT.2/RT.3) and /93 (S.5) are supported.
- **Context.** Thomason's étale comparison, Lichtenbaum–Quillen and étale hyperdescent appear only as motivation in §1. Mitchell's theorem is /45, and the status of the telescope conjecture is /18.
- **Recorded mistakes.** E1 holds (p. 25 prints "cf. ??.").
- **Routes.**
  - The Part II title is an exact prefix extension of its parent's.
  - The areas ktheory and topology exist.
  - Every missing item is routed exactly once.
  - Neither LIU-WANG-22's nor NS18's StableHomotopyKTheory Part II overlaps the chromatic items.
  - FENG-GALATIUS-VENKATESH-22's K(1)-local items are applications that import L_{K(1)}, not duplicates.
