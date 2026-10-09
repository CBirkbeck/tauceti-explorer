# Handoff: BP-SmoothRepresentationsOfLocalGroups--SR.0 (checkpoint)

Worker session cc-144b52 (Claude Code), issue #996. This is a checkpoint: the maintainer moved the remaining work to the Codex workers.

## State

- Packet `research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.0.json`, part "SR.0", status `partial`. It has 99 nodes (55 theorems, 21 definitions, 19 constructions, 2 comparisons, 2 applications), 282 API items, 161 unit tests and 35 planets (at most 6 per layer). It records 75 baseline declarations, 13 requests, 5 gaps, 2 restructure proposals and 25 sourceIssues.
- Checker: `python3 scripts/check_blueprint.py research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.0.json --index <baseline>/declarations.tsv` reports 0 errors and 0 warnings. With status `complete` it also gave 0 errors: every stage in scope has coverage `planned`.
- Roadmap document `research/blueprint/readmes/SmoothRepresentationsOfLocalGroups--SR.0.md` is generated from the packet, with hand-written scope, conventions, library table, layer introductions and layer order.
- **Not written:** the suggested Lean file `research/blueprint/suggested/SmoothRepresentationsOfLocalGroups--SR.0.lean`. Nothing was compiled.

## What remains

1. **Suggested Lean file.** It must name every packet api and test name, with each test as `-- <name>` followed by an `example`. State reductive statements for GL_n(ℚ_p) = (Matrix (Fin n) (Fin n) ℚ_[p])ˣ, or omit them with a comment. Write `open _root_.CategoryTheory` where needed. Compile with the lean-check wrapper of WORKERS.md. Useful baseline anchors:
   - `Rep` (abelian), `ObjectProperty.FullSubcategory`;
   - `IsGrothendieckAbelian`, `DerivedCategory`, `CochainComplex.HomComplex`, `CatCenter`;
   - `IsHeckeTriple`/`HeckeRing`, `Representation.Coinvariants`, `MeasureTheory.Measure.modularCharacter`;
   - Tau Ceti `HeckeCosetModule.mul` and `instRingHeckeRing`, `TauCeti.profiniteOrder`, `IsProP`.
2. **Status `complete`.** After the Lean file exists, set the packet status to `complete`; all 8 stages are already `planned`.
3. **Review points.**
   - Each layer's nodes are listed in the readme.
   - The gaps: Whittaker uniqueness and Rodier heredity for general quasi-split G; Harish-Chandra's classification of tempered representations, the input to Konno's proof of the Langlands classification; projectivity of discrete series in the tempered category; degenerate Whittaker models; Bushnell 2001 and Bushnell–Kutzko 1998, which are not public.

## Decisions to carry forward

- **Stage order (restructure proposal 1).**
  - The atlas order is SR.2 → SR.2a → SR.3a → SR.3. The proposed order is SR.0:abelian-category → SR.1 → SR.0:derived-extension → SR.2 → SR.3a → SR.3 → SR.2a.
  - SR.2a nodes depend on SR.3a and SR.3 nodes. Stabilisation needs uniform admissibility, the Bernstein decomposition, noetherianity and generic irreducibility (Bernstein 1992 III.3.3, Theorem 22; Bernstein 1987 §5.3). Bezrukavnikov–Kazhdan need noetherianity. Dat 2009 covers only special cases.
  - No public source gives SR.3a an independent route to second adjointness.
  - SR.3 uses no SR.2a node: the centre follows Bernstein–Deligne 1984.
- **Two new early edges.** SR.1 → SR.0:derived-extension (the derived Hecke algebra) and SR.0:derived-extension → SR.2 (principal-series Jacquet modules use Ext vanishing).
- **Moved down from EnhancedDerivedSheaves:E1 (tier 4), restructure proposal 2.** SR.0:derived-extension now plans the K-injective resolutions, the dg (Hom-complex) enhancement and the derived invariants. The ∞-categorical comparison stays with E1 and the V-stack roadmaps.
- **No ExcursionOperatorsAndSpectralAction or LanglandsParameterStacks prerequisites.** These roadmaps appear only in `uses` (consumers).
- **RT-AREA-geomlanglands/9.** Handled in SR.1:
  - `bernstein-centre-corners` proves π₀End(id) of D(G, Λ) = lim_K Z(e_K H e_K) over pro-p K;
  - `l-adic-separatedness` proves separatedness over ℤ_ℓ[√q] from the freeness of the Hecke algebras;
  - the ordinary centre is `SR.0:abelian-category/smooth-centre`.
  - Fargues–Scholze assert both facts without proof (sourceIssues E24, E25).
- **SR.4/SR.5/SR.6 boundary (Codex job #997).** Left for that packet:
  - the spherical comparison z ↦ e_K z and Satake;
  - Venkatesh's Satake-side items;
  - TV §7, the Pilloni Satake normalisations, CG18 block material, GS mirabolic and the BCGP25 §7.4 items.
- **REV-RS-21 applied.** SR.0 is the alias of SR.0:abelian-category: its nodes realise both ids. SR.1 has no unconditional averaging; the permutation-module Hecke algebra covers characteristic p. SR.3a does not use centre finiteness.

## Requests (13)

- ProfiniteCohomology Layers 0, 1, 7 and 10;
- ProfiniteProPGroups Layer 1;
- InductionRestriction Layers 0 and 3;
- ModularForms Layer 2;
- ReductiveGroups Layer 7;
- ReductiveGroupsPartII RG2.0, RG2.1, RG2.3 and RG2.4.

## Sources read (URLs; sha256 in the packet)

- Casselman 1995 notes: https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf
- Bernstein 1992 notes:
  - https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bernst_Lecture_p-adic_repr.pdf
  - second TeX build: https://www.math.tau.ac.il/~bernstei/Unpublished_texts/unpublished_texts/Bernstein93new-harv.lect.from-chic.pdf
- Bernstein 1987, second adjointness: https://www.math.tau.ac.il/~bernstei/Unpublished_texts/unpublished_texts/Bernstein87-second-adj-from-chicago.pdf
- Bernstein–Deligne 1984: https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bern_Center.pdf
- Bernstein–Zelevinsky 1976 (English): https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf
- Bernstein–Zelevinsky 1977: http://archive.numdam.org/article/ASENS_1977_4_10_4_441_0.pdf
- Borel 1976: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0035/LOG_0029.pdf
- Casselman 1980: http://archive.numdam.org/article/CM_1980__40_3_387_0.pdf
- Iwahori–Matsumoto 1965: http://archive.numdam.org/article/PMIHES_1965__25__5_0.pdf
- Haines–Kottwitz–Prasad: https://arxiv.org/pdf/math/0309168
- Lusztig 1989: https://www.ams.org/journals/jams/1989-02-03/S0894-0347-1989-0991016-9/S0894-0347-1989-0991016-9.pdf
- Vignéras 1998 preprint: https://perso.imj-prg.fr/mariefrance-vigneras/wp-content/uploads/vigneras-pub/sealu98.pdf
- Dat 2009: https://arxiv.org/pdf/math/0607405
- Bezrukavnikov–Kazhdan: https://arxiv.org/pdf/1112.6340v4
- Konno 2003: https://www.jstage.jst.go.jp/article/kyushujm/57/2/57_2_383/_pdf
- Routed papers:
  - Fargues–Scholze arXiv v4;
  - Treumann–Venkatesh (Annals, and arXiv v1);
  - Venkatesh (Forum Pi, and arXiv v3);
  - He (Forum Pi, and arXiv v3);
  - Allen et al. (Ramanujan.pdf, and arXiv v2);
  - BCGP21 arXiv v3 and PMIHÉS;
  - Boxer–Pilloni (author copy);
  - Pilloni 2020 (author copy);
  - Calegari–Geraghty 2018 arXiv v2;
  - Calegari–Geraghty 2020 arXiv v1;
  - Clozel–Thorne (manuscript);
  - Gan–Savin arXiv v1;
  - Kaletha arXiv v5;
  - Pan arXiv v1;
  - Stacks Tags 070Y and 079P.
  - The URLs are in the packet's `sources`.
- **Not obtained:**
  - Bushnell 2001 (paywalled);
  - Bushnell–Kutzko 1998;
  - Bushnell–Henniart, *The local Langlands conjecture for GL(2)* (book, no public copy used);
  - Renard, *Représentations des groupes réductifs p-adiques* (book, no public copy used);
  - the published Invent. Math. and Duke versions of CG18, CG20, Gan–Savin and Boxer–Pilloni.
