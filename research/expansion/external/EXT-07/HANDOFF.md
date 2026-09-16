# EXT-07 handoff — Arithmetic geometry

Job: EXT-07 in `research/expansion/EXTERNAL_AGENTS.md`.
Roadmaps: `EffectiveDiophantineMethods`, `FaltingsFinitenessAndIsogenyTheorems`,
`FiniteFlatGroupsAndIntegralPadicHodgeTheory`, `HeightsRationalPointsAndObstructions`,
`InverseGaloisAndArithmeticFundamentalGroups`, `NeronModelsAndSemistableAbelianVarieties`,
`tauceti:TauCetiRoadmap/JacobianChallenge`.

Status: **all seven packets written; every packet is `partial`**. The first run stopped on a
request timeout after writing the Faltings packet. A continuation run (16 September 2026) wrote
the remaining six roadmaps in this order:

1. `FiniteFlatGroupsAndIntegralPadicHodgeTheory` — **done**
2. `EffectiveDiophantineMethods` — **done**
3. `HeightsRationalPointsAndObstructions` — **done**
4. `InverseGaloisAndArithmeticFundamentalGroups` — **done**
5. `NeronModelsAndSemistableAbelianVarieties` — **done**
6. `tauceti:TauCetiRoadmap/JacobianChallenge` — **done**

This file is updated after every packet. Every packet has `status: partial`, and every node is
`implementationStatus: unchecked`.

## Files written

| file | roadmap | nodes | links | gaps | coverage | state |
|------|---------|-------|-------|------|----------|-------|
| `FaltingsFinitenessAndIsogenyTheorems.json` | FaltingsFinitenessAndIsogenyTheorems | 32 | 43 | 11 | 6 stages, all `partial` | first run; edited by the independent reviewer (counts as on disk at 11:17); not edited by the continuation run |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory.json` | FiniteFlatGroupsAndIntegralPadicHodgeTheory | 90 | 157 | 20 | 6 stages, all `partial` | continuation run; validated (IDs, owners, sources, coverage, no stage cycle with the atlas) |
| `EffectiveDiophantineMethods.json` | EffectiveDiophantineMethods | 26 | 38 | 7 | 7 stages, all `partial` | continuation run; validated; all four sources are public copies fetched outside the library |
| `HeightsRationalPointsAndObstructions.json` | HeightsRationalPointsAndObstructions | 59 | 107 | 11 | 7 stages, all `partial` | continuation run; validated; two library sources (Silverman AEC, Faltings 1983) and four public copies (Poonen, Zhang 1998, Ullmo, Szpiro–Ullmo–Zhang) |
| `InverseGaloisAndArithmeticFundamentalGroups.json` | InverseGaloisAndArithmeticFundamentalGroups | 27 | 44 | 8 | 7 stages, all `partial` | continuation run; validated; all excerpts matched against source text; five public sources (SGA 1, Dèbes lecture notes, NSW electronic edition, Romagny–Wewers, Dèbes 2026) |
| `NeronModelsAndSemistableAbelianVarieties.json` | NeronModelsAndSemistableAbelianVarieties | 24 | 43 | 7 | 6 stages, all `partial` | continuation run; validated; every excerpt matched against source text (SGA 7 I against a local OCR pass); library sources SGA 7 I Exp. IX, SGA 7 II Exp. XV, Silverman AEC and Poonen, plus four public copies (Romagny 2011, Lichtenstein, Conrad 2015, Raynaud 1970) |
| `tauceti_TauCetiRoadmap_JacobianChallenge.json` | tauceti:TauCetiRoadmap/JacobianChallenge | 29 | 55 | 9 | 6 stages, all `partial` | continuation run; validated; every excerpt matched against source text; none of the roadmap's named books is in the library, so it uses public copies: six Stacks Project chapters, Milne's *Abelian Varieties* notes, Kleiman's *The Picard scheme*, plus the library Silverman |

## Validation notes on packets already written

* **Faltings packet, dangling link — resolved.** It links from
  `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/determinant-of-the-generic-fibre-by-the-tame-different-character`.
  That node now exists in the FiniteFlatGroups packet under exactly that ID: Raynaud 1974 Thm
  4.1.1, with hypotheses e ≤ p−1, R strictly henselian of mixed characteristic, and killed by p.
* **Faltings packet, stage cycle — resolved by the reviewer.** The reduction node is now
  `…R28.3/reduction-to-a-principally-polarized-semiabelian-model`, so the link to the R28.3
  quotient node stays inside R28.3. The validator reports no stage cycle for the file on disk.
* **FiniteFlatGroups packet, new stage edges.** R07.1 → R07.4 (Liu uses Raynaud Prop. 2.3.1) and
  R07.1 → R07.5 (the supersingular example uses Raynaud 3.2.1/3.3.2/3.4.1). Both are acyclic and
  consistent with the atlas order.
* **Heights packet, new stage edges** (all acyclic with the atlas):
  * Internal: RP.0 → RP.4, RP.1 → RP.3, RP.1 → RP.6, RP.2 → RP.6, RP.4 → RP.6. All are already
    implied transitively by atlas edges.
  * External suppliers: LI.4 → RP.1, SF.2 → RP.1, SF.2 → RP.3, R28.1 → RP.4, A6 → RP.5,
    SF.3 → RP.5, SF.3 → RP.6, and ArakelovGeometryAndAbelianHeights R35.1 → RP.5.
  * Cross-packet links go to two Faltings nodes: R28.1 (Hermite–Minkowski) and R28.5 (the curve
    corollary).
* **NeronModels packet, new stage edges** (all acyclic with the atlas):
  * Internal: R11.1 → R11.4, R11.1 → R11.5, R11.2 → R11.5, R11.3 → R11.6. All are already
    implied transitively by the atlas order.
  * External: FiniteFlatGroups R07.1 → R11.6 (the node for Raynaud's uniqueness of prolongation
    when e < p−1), LefschetzPencilsAndVanishingCycles LPV.1 → R11.3 (monodromy theorem) and
    LPV.2 → R11.4 (Picard–Lefschetz), and R11.3 → Faltings R28.3 (the reviewer-renamed node
    `reduction-to-a-principally-polarized-semiabelian-model`).
* **JacobianChallenge packet, node IDs.** The atlas stage IDs of this tauceti roadmap use `#`
  (`tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-…`). `scripts/decompositions.py` requires
  node IDs to start with `<roadmapId>:`, so nodes are named
  `tauceti:TauCetiRoadmap/JacobianChallenge:<layer anchor>/<slug>`, with `parentStageId` set to
  the `#` stage ID.
* **JacobianChallenge packet, new stage edges** (the atlas has no stage edges for this roadmap;
  all acyclic):
  * Internal: A → B, A → C, B → D, B → E, B → F, C → D, C → F, D → E, D → F, E → F, and
    **C → B** (flat base change for the genus, against the roadmap order). Three further
    reversals are recorded as a gap and not linked, because they would create cycles.
  * External suppliers: SchemeAndStackFoundations SF.1 → Layers C and D (fppf/fpqc descent).
  * External consumers:
    * Layer B → SF.3 and → AlgebraicCurves Layer 12;
    * Layer D → SF.3 and → the R11.4 Raynaud node;
    * Layer E → AbelianSchemesAndArithmeticModuli A6, → FiniteFlatGroups R07.2, → WeilConjectures
      WC.5, and → EtaleDualityAndPerverseSheaves EDC.2:trace-purity. The last two refine the
      atlas edges from `UPSTREAM:JacobianChallenge`.
* **Dry-run merge.** `merge_decompositions` from `scripts/decompositions.py` was run in memory on
  all seven EXT-07 packets, with placeholder reviews and nothing written. It accepts them together:
  287 nodes, no deferred links, and no cycle in the merged stage graph.

## Sources read in the continuation run

Library-relative paths; nothing was copied into the repository.

| packet id | work | file / provenance | sha256 | read |
|-----------|------|-------------------|--------|------|
| `raynaud-1974-schemas-en-groupes-p-p` | Raynaud, *Schémas en groupes de type (p,…,p)*, Bull. SMF 102 (1974) 241–280 | `papers/R02_SS_Raynaud1974.pdf` | 05cad2f5…84f2edfe | all of §§1–4 and appendix; formulas checked on page images |
| `fontaine-laffaille-1982-construction` | Fontaine–Laffaille, *Construction de représentations p-adiques*, Ann. ENS 15 (1982) 547–608 | `papers/SS_FontaineLaffaille.pdf` | c049a7bf…2c011a2 | whole paper §§0–9; key statements on page images |
| `kisin-2009-moduli-finite-flat-group-schemes` | Kisin, *Moduli of finite flat group schemes, and modularity*, Ann. Math. 170 (2009) | `papers/SS_KisinFlat.pdf` | 076f8bb6…86f4ee7 | intro; §1.1–1.2; 2.1.2–2.1.4; 2.2.9–2.2.22; 2.4.13–2.4.14 |
| `liu-2013-barsotti-tate-kisin-modules-p-2` | Liu, *BT groups and Kisin modules when p = 2*, JTNB 25 (2013); author copy | `papers/SS_Liu2BT.pdf` | 0ce78fbc…fce8b3 | whole paper |
| `fontaine-1985-pas-de-variete-abelienne-sur-Z` | Fontaine, *Il n'y a pas de variété abélienne sur Z*, Invent. 81 (1985) | `papers/SUP_Fontaine_NoAbelianSchemes_1985.pdf` | c10642fb…bf901fdd3 | intro, §1, §2, §3.1.1; page images for all formulas |
| `conrad-1999-finite-group-schemes-low-ramification` | Conrad, *Finite group schemes over bases with low ramification*, Compositio 119 (1999); author copy | **not in library**; fetched 2026-09-16 from https://math.stanford.edu/~conrad/papers/gpscheme.pdf (author's page) | 8da16031…f836616da61aa8f5739c74cdd82547054a5189 | intro, summary of Fontaine, Thm 1.1 (proof), Def 1.2, Lemma 1.3, Thm 1.4 (statement), Cors 1.5–1.6 (proofs), Lemma 4.1 |
| `mccallum-poonen-method-of-chabauty-coleman` | McCallum–Poonen, *The method of Chabauty and Coleman*, Panoramas et Synthèses 36 (2012) | **not in library**; https://math.mit.edu/~poonen/papers/chabauty.pdf (author page), author copy of June 14, 2010 | fb8d1a58…2f21ab55a | whole paper including Appendix A |
| `bruin-stoll-mordell-weil-sieve` | Bruin–Stoll, *The Mordell–Weil sieve*, arXiv:0906.1934v2 (LMS JCM 13, 2010) | **not in library**; arXiv | 33f88cbd…ffe1485d38122667a88cd9a5f88d842cd43dd | §§1–4 (pp. 1–21); §§5–8 not read |
| `tzanakis-de-weger-practical-thue` | Tzanakis–de Weger, *On the practical solution of the Thue equation*, J. Number Theory 31 (1989) 99–132 | **not in library**; https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf (institutional repository) | 2eff85fb…2c7b3 | §I, §II.1–II.3 (pp. 99–116), constants read on page images; §III and appendices not read |
| `bdmtv-quadratic-chabauty-modular-curves` | Balakrishnan–Dogra–Müller–Tuitman–Vonk, *Quadratic Chabauty for modular curves: algorithms and examples*, arXiv:2101.01862v4 | **not in library**; arXiv | 738f0ec0…57c25f61d | §1, §2, §3 (3.1 statement, 3.4, 3.5 incl. Algorithm 3.12), §4 opening and §4.4 |
| `silverman-arithmetic-of-elliptic-curves-2009` | Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., GTM 106 (2009) | library copy, catalogue `WEIL-PRIVATE-SILVERMAN2009` (user-supplied private copy, not redistributed; cited by DOI) | 72ee67bf…788cab25 | VIII.1–VIII.6, VIII.9, VIII.10 opening; IX intro, IX.1–IX.4; X.1; X.4. Relations read on page images, because the text layer drops ≠. For the Néron packet: VII notation (p. 185), VII.5–VII.7. For the Jacobian packet: III.3.4 |
| `poonen-rational-points-on-varieties` | Poonen, *Rational points on varieties*, AMS GSM 186 (2017) | **not in library**; https://math.mit.edu/~poonen/papers/Qpoints.pdf, the author's PDF (created 2018-12-18, watermarked "Unofficial version for incidental online use") | 42e92ce4…16887353579 | §5.7; Thms 5.12.24, 5.12.29; §6.5.7 with Thm 6.5.13; all of Ch. 8 and its exercises; §9.5 |
| `faltings-1983-endlichkeitssaetze` | Faltings 1983 (same file as the Faltings packet) | `papers/ADD_FALTINGS83.pdf` | 0b7fb3e5…a8faa3fc2 | re-read for this packet: Lemma 4 (p. 357) and Satz 7 with Bemerkungen (p. 365), on page images |
| `zhang-1998-equidistribution-small-points` | Zhang, *Equidistribution of small points on abelian varieties*, Ann. Math. 147 (1998) 159–165 | **not in library**; JSTOR scan linked from the author's publication list (https://web.math.princeton.edu/~shouwu/publications/bogomolov.pdf) | 023ecdf2…10931bfe2 | whole article, on page images |
| `ullmo-1998-positivite-discretion` | Ullmo, *Positivité et discrétion des points algébriques des courbes*, arXiv:alg-geom/9606017v1 (Ann. Math. 147, 1998) | **not in library**; arXiv | d273b998…b604acf8 | whole preprint (16 pp.); published version not inspected |
| `szpiro-ullmo-zhang-1997-equirepartition` | Szpiro–Ullmo–Zhang, *Équirépartition des petits points*, Invent. Math. 127 (1997) 337–347 | **not in library**; scan linked from the author's publication list (https://web.math.princeton.edu/~shouwu/publications/SUZ.pdf) | 1cf79d5c…06e7b14ca | whole article, on page images |
| `sga1-revetements-etales-et-groupe-fondamental` | Grothendieck et al., *Revêtements étales et groupe fondamental* (SGA 1), SMF Documents Mathématiques 3 (2003 reedition) | **not in library**; arXiv:math/0206203v2 (posted by the editors) | 8e64218d…cbaf60d3c | V §§4–9; IX §6; X §§1–3 (1.1–1.10, 2.1–2.12, 3.8–3.11); XII §5; XIII 2.11–2.12 |
| `debes-arithmetique-des-revetements-de-la-droite` | Dèbes, *Arithmétique des revêtements de la droite*, lecture notes v2 (2024, work in progress) | **not in library**; author page https://pro.univ-lille.fr/pierre-debes/publications | 7b07f882…fedc34374 | §5.2; §6.2.1; §6.5; §§8.1–8.4; §9.2.1 (separable case) |
| `nsw-cohomology-of-number-fields-2e` | Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*, 2nd ed., electronic version 2.3 (May 2020) | **not in library** (catalogue: book_requested); author page https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/, "free for non-commercial use" | abbb7cde…0afdcb91 | III 3.5.1–3.5.4; IX §5 opening; IX §6 (9.6.1, 9.6.6, 9.6.7 steps 1 and 4 and char p, 9.6.8–9.6.10); shrinking proofs 9.6.2–9.6.5 not read |
| `romagny-wewers-hurwitz-spaces` | Romagny–Wewers, *Hurwitz spaces*, Séminaires et Congrès 13 (2006) 313–341 | **not in library**; author page https://perso.univ-rennes1.fr/matthieu.romagny/articles/hurwitz_spaces.pdf | caed858e…2b529d8f8 | §§1–2; §3.1–3.2; §4.1–4.2; §4.5 statements |
| `debes-2026-hurwitz-spaces-and-inverse-galois-theory` | Dèbes, *Hurwitz spaces and Inverse Galois Theory*, arXiv:2601.06532v2 (April 2026) | **not in library**; arXiv | 7f640bc6…b2a24a66 | intro, contents, §§2.1–2.4 |
| `sga7-I-expose-IX` | Grothendieck, *Modèles de Néron et monodromie*, SGA 7 I Exp. IX, LNM 288 (1972) | `papers/R02_SGA7I.pdf` (scan, no text layer; same file as https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf). Read through a local tesseract OCR pass; printed page = PDF page − 5 | 17286b0f…c03c8dab | sommaire, 0.1–0.2; 2.2.9; 2.4 statement, 2.6; §3 (3.1 opening, 3.2–3.9; 3.5 and 3.6 on page images); 11.0–11.1, 11.5 (page image) with 11.5.2; §12 (12.1–12.7.2) |
| `sga7-II-expose-XV` | Deligne, *La formule de Picard-Lefschetz*, SGA 7 II Exp. XV, LNM 340 (1973) | `papers/Weil_SGA7II.pdf` (catalogue WEIL-SGA7-II, IAS author archive; text layer present); printed page = PDF page − 8 | fa679deb…876e1297 | contents; end of 3.3 (D), (E), (F); 3.4 Résumé and Théorème 3.4 on page images |
| `romagny-2011-neron-models-of-abelian-varieties` | Romagny, *Néron models of abelian varieties*, SGA 3 summer school notes (2011) | **not in library**; author page https://perso.univ-rennes1.fr/matthieu.romagny/exposes/Neron_models.pdf | 22f81b54…ea1a7d7e | whole note (8 pp.) |
| `lichtenstein-neron-models-stanford-seminar` | Lichtenstein, *Néron models*, Stanford Mordell seminar notes (2011) | **not in library**; B. Conrad's seminar page http://virtualmath1.stanford.edu/~conrad/mordellsem/Notes/L11.pdf | 8ef7cac5…27ca9ebf | §§1.3–1.4, 2, 3.6, 4, 5 (Thm 5.2.1 with full proof), 6 (statements) |
| `conrad-2015-neron-models-tamagawa-factors-sha` | Conrad, *Néron models, Tamagawa factors, and Tate–Shafarevich groups*, Stanford BSD seminar notes (2015) | **not in library**; author page https://virtualmath1.stanford.edu/~conrad/BSDseminar/Notes/L3.pdf | bc27aad2…2ce988e6 | §§1–4 (pp. 1–13); §§5–6 not read |
| `raynaud-1970-specialisation-du-foncteur-de-picard` | Raynaud, *Spécialisation du foncteur de Picard*, Publ. Math. IHES 38 (1970) 27–76 | **not in library**; NUMDAM https://www.numdam.org/item/PMIHES_1970__38__27_0/ | fdba4b96…cf04cf92 | §8 (8.0–8.2.3, proofs of 8.1.2, 8.1.4, 8.2.1); §9.1–9.2 opening; §§5–7 not read |
| `stacks-project-picard-schemes-of-curves` | Stacks Project, ch. 44 *Picard Schemes of Curves* (tag 0B92), version ed88ff78 (compiled 14 July 2026) | **not in library**; https://stacks.math.columbia.edu/download/pic.pdf (GFDL) | d2d67eba…31b27174 | whole chapter, §§1–7 with proofs |
| `stacks-project-algebraic-curves` | Stacks Project, ch. 53 *Algebraic Curves* (tag 0BRV), same version | **not in library**; …/download/curves.pdf | c4e3d4c0…9f82c030 | §4 (4.1–4.6), §5 (5.1–5.2), 6.1 statement, §8 (8.1–8.4) |
| `stacks-project-varieties` | Stacks Project, ch. 33 *Varieties* (tag 0209), same version | **not in library**; …/download/varieties.pdf | ed339c31…5f4bca45 | 9.3, 25.6, 26.2, 43.4–43.5 statements; §44 (44.1–44.17 with proofs) |
| `stacks-project-divisors` | Stacks Project, ch. 31 *Divisors* (tag 01WO), same version | **not in library**; …/download/divisors.pdf | 0527740a…9f28a493 | §15 (15.1, 15.10–15.11), 16.1–16.2, §19 (19.1–19.4, 19.9), §§27–28 |
| `stacks-project-cohomology-of-schemes` | Stacks Project, ch. 30 *Cohomology of Schemes* (tag 01X6), same version | **not in library**; …/download/coherent.pdf | b4980a08…bcbdbfb8 | 2.2, 2.6, 4.2, 5.2, 7.1, 17.1 statement, 19.1–19.2 |
| `stacks-project-derived-categories-of-schemes` | Stacks Project, ch. 36 *Derived Categories of Schemes* (tag 08CU), same version | **not in library**; …/download/perfect.pdf | f79e0ebb…bf72fb02 | 30.4–30.7; §32 (32.1–32.7) |
| `milne-2008-abelian-varieties-v2` | Milne, *Abelian Varieties*, course notes v2.00 (16 March 2008) | **not in library**; author page https://www.jmilne.org/math/CourseNotes/AV.pdf | f5ca4e63…67f6aaef | I §§1, 3, 4, 5 (cube statement only), 7, 8, 11; III §§1–6; signs in III.6 checked on page images |
| `kleiman-2005-the-picard-scheme` | Kleiman, *The Picard scheme*, arXiv:math/0504020v1 (FGA Explained, AMS 2005) | **not in library**; arXiv | cc14e62f…5f3beeaa | §2 (2.2–2.11); 4.4, 4.7, Thm 4.8 statement; §5 (5.3–5.4, 5.10–5.15, 5.19–5.20) |

Earlier-run sources (Faltings 1983 and erratum) are recorded in the Faltings packet.

## Corrections to existing atlas statements (FiniteFlatGroupsAndIntegralPadicHodgeTheory)

1. **R07.1, Raynaud Cor. 3.3.6.** Raynaud states Cor. 3.3.6 (full faithfulness, flat kernel and
   cokernel, Ext¹ injectivity) and Cor. 3.3.7 with **no written proof** (checked on the page
   image of p. 268). Conrad 1999 writes out only the step from isomorphism detection to full
   faithfulness (Cor. 1.6), and cites Raynaud for e > 1. The nodes give candidate routes and label
   them as not source-based.
2. **R07.1 scope.** Faltings needs Raynaud **Thm 4.1.1** (§4, determinant = τ_p^{v(𝔇)}, e ≤ p−1),
   which lies outside the "§§2–3" scope named in R07.1. It is added under R07.1 because the
   Faltings packet cites that ID. Raynaud Thm 4.2.1 (det T(X) = τ^d, any e) is placed under R07.6,
   since its proof is a deformation argument.
3. **R07.3, e = 1.** Fontaine–Laffaille is **not** restricted to e = 1. They treat K = E·K₀, where
   E contains a uniformizer of K, with O_E-coefficients and filtration bound q = #(O_E/π);
   e = 1 is the case E = Q_p.
4. **R07.3/R06.4, torsion range.** Unrestricted full faithfulness on [0, p−2] "after a common
   Tate shift" is **not stated** by Fontaine–Laffaille. The inclusion of [0, q−2] into
   MF_tor^{f,q′} is derived in a separate node, marked as derived. The shift itself remains an
   obligation, possibly via 6.13(b). Full faithfulness on MF_tor^{f,q″} (no subobject with N¹ = 0)
   is **only indicated** in the source (6.12). The fully proved endpoint statement is the one for
   MF_tor^{f,q′}.
5. **R07.3, Theorem 8.4.** The hypothesis is K = K₀, D weakly admissible, and D^j = D, D^{j+p} = 0
   for some j. The proof imports [F1]/[F2] (the Barsotti–Tate ring B) and Laffaille 1980
   Thm 3.2, and uses the contravariant U_{S_K} = V_B^*.
6. **R07.4 hypotheses.** Kisin 2009 §1 assumes **p ≠ 2 and k finite**. Breuil's classification
   (Kisin 1.1.3) and its p-divisible version ([Br3] 4.2.2.9) are imported. The dyadic
   (and general perfect-k) statement is Liu 2013 Thm 1.0.1, whose proof imports Kisin 2006,
   Kisin 2009a, Liu 2007/08/10 and Breuil 1997/2002. Descent data and the potentially
   Barsotti–Tate/semistable cases are not in either source.
7. **R07.6 conventions.** The R07.6 text agrees with Fontaine: G^{(u)} = G^{u−1}, cutoff
   u > e(n + 1/(p−1)), and a strict different bound v₀(𝔇_{L/K}) < n + 1/(p−1). Two points are
   missing from the text. Theorem 1(b) imports Grothendieck's embedding into a Barsotti–Tate
   group. The case e = n = 1 needs no such embedding (Remark 2.2(a)).
8. **R07.2** is decomposed only at statement level. No primary proof of classical Dieudonné
   theory is in the library.

## Corrections and qualifications (EffectiveDiophantineMethods)

1. **ED.1/ED.2 order.** In Tzanakis–de Weger the lattice reduction (ED.1) consumes the huge bound
   produced by the logarithmic-form lemmas (ED.2). The reduction propositions are stated for
   arbitrary K₁, K₂, K₃, so the atlas order ED.1 → ED.2 is kept. The combination sits in a
   separate ED.2 node (the four-class certificate); no reversed stage edge was added.
2. **ED.2 constants.** Tzanakis–de Weger use **Waldschmidt 1980**, not Matveev. The ED.2 text asks
   to "register the Baker/Matveev source separately"; the constants depend on that choice. The
   EXT-08 DT.3 node records Baker and Matveev.
3. **ED.4, Chabauty's theorem.** McCallum–Poonen **omit** the proof of Chabauty's theorem
   (Thm 4.4) and prove only Coleman's refinement at a good prime (Thm 5.3), plus the
   bad-reduction version (Thm A.5). Their residue-class facts are stated with "one can show".
4. **ED.5 termination.** Bruin–Stoll's Chabauty-plus-sieve procedure is **correct when it
   terminates**. Termination is conditional on Stoll's Main Conjecture and on their
   Conjecture 4.2. The one-point-per-residue-class claim is cited to Stoll 2006 §6; this packet
   ties it to Coleman's bound with m = 0.
5. **ED.6 scope.** BDMTV Algorithm 3.12 requires r = g **certified a priori**, the log isomorphism
   (2.1), rk NS(J) ≥ 2, T_p generating End⁰(J), Tuitman's Assumption 3.10 at p, and externally
   supplied local heights at bad primes. It returns a finite superset of X(Q_p)₂ or FAIL. The
   comparison with X(Q) (Mordell–Weil sieve) is a separate step.

## Corrections and qualifications (HeightsRationalPointsAndObstructions)

1. **Silverman misprints found on page images.** Each is recorded in node hypotheses.
   * **Prop. VIII.5.4(c)** prints H_L(P) = H_K(P)^{1/[K:Q]}. The proof on the same page gives
     H_K(P)^{[L:K]}.
   * **Example X.4.5.1** prints S^(2)(E/Q) = (Z/2Z)² for y² = x³ − 12x² + 20x. Example X.1.5
     proves E(Q) ≅ Z × (Z/2Z)², with eight Q-trivial pairs in Table 10.1, so E(Q)/2E(Q) is
     (Z/2Z)³ and injects into S^(2). The correct value is (Z/2Z)³.
   * **Prop. X.4.9** prints E′ : Y² = X³ − 2aX² + (a² − b)X. Example 4.8, δ(0,0), C_d and
     Example 4.10 all use a² − 4b.
   * Two cross-reference slips: "(VIII.2.1)" for (VIII.1.2), and "(VIII.6.2)" for (VIII.6.3).
2. **Poonen convention.** Example 6.5.12 prints Z^τ = Z ×^G T, while §6.5.6.4 and the proof of
   Thm 8.4.1 use Z ×^G T^{-1}. The T^{-1} form is the consistent one.
3. **RP.0 scope.** The sources read give heights on P^N and on elliptic curves only. The general
   Weil height machine, local heights and abelian Néron–Tate heights are a gap: Hindry–Silverman
   is catalogued as "book_requested" and absent.
4. **RP.1 scope.**
   * Poonen's weak Mordell–Weil (Thm 8.4.9) excludes char k | m. No source read gives the fppf
     descent the stage asks for when n meets the residue characteristic.
   * The atlas input **R02.6 → RP.1** (patching inequalities) is not used by any source read.
5. **RP.2 and RP.3 proof status.**
   * Poonen leaves Prop. 8.1.8, Cors 8.1.9–8.1.10 (Exercise 8.1) and the twist description and
     closedness of descent sets (Exercise 8.7) unproved.
   * Thm 8.5.4 is a sketch whose first and third inclusions are imports (Skorobogatov 2009,
     Demarche 2009). Cao's Thm 8.5.5 is cited only.
   * Exact obstruction equality is recorded only for X(A)^PGL = X(A)^Br with X regular
     quasi-projective.
6. **RP.4.**
   * The Parshin reduction exists only as Faltings' Satz 7. It leaves several steps unwritten:
     the unramified cover, the generalized Jacobian, the genus and bad reduction of Y(x), de
     Franchis finiteness, and Chevalley–Weil.
   * Poonen Cor. 8.4.8 is linked as the proved torsor form of the uniform field K₁.
   * Siegel is proved only for genus-1 curves and y² = f(x) (Silverman IX.3–IX.4, Roth
     imported). General affine curves remain cited.
7. **RP.5.**
   * Zhang 1998 proves Bogomolov for nontorsion subvarieties over number fields, using an asserted
     stabilizer reduction and an asserted measure comparison. Its proof section calls Cor. 3
     "Corollary 1.2".
   * Zhang's Cor. 4 (Manin–Mumford over Q̄) has no proof.
   * Mordell–Lang has no source.
   * Ullmo's curve case is an independent proof, using Szpiro–Ullmo–Zhang equidistribution and
     Zhang's admissible pairing. The latter is in the library (`ZhangAdmissible`) but unread.

## Corrections and qualifications (InverseGaloisAndArithmeticFundamentalGroups)

1. **IG.0 acceptance ordering.** The G_m computation (π₁ over an algebraically closed char-0
   field is Ẑ) is proved in the sources read only through SGA 1 XIII 2.12. That proof uses the
   tame π₁ of punctured curves and specialization (placed in IG.1) and Riemann existence
   (XII 5.1–5.2, via the C4 supplier of IG.3). The node therefore sits under IG.1: the IG.0
   acceptance cannot be discharged inside IG.0 under the atlas order IG.0 → IG.1.
2. **Selected SGA range for IG.1.**
   * IX 6.1 is stated for S = Spec of an artinian ring and X with quasi-compact, geometrically
     connected special fibre.
   * Specialization is surjective for proper **separable** morphisms (X 2.3–2.4).
   * It is an isomorphism on prime-to-p quotients only for proper **smooth** morphisms
     (X 3.8–3.9).
   * Without properness it fails in characteristic p (Artin–Schreier family, X 1.10).
   * Tame π₁ of punctured curves is described only on the prime-to-p quotient in characteristic
     p (XIII 2.12).
3. **SGA 1 write-up gaps.**
   * The transcendental presentations X 2.6/3.10 rest on an oral exposé "qui n'[a] pas été
     rédigé" (X 2, footnote 3).
   * V 6.13 and the limit step of IX 6.1 are left to the reader.
4. **IG.2 scope.** Dèbes proves Hilbert irreducibility for Q only with one parameter and one
   variable (Hilbert–Dörge, O(B^{1−δ}) exceptions). Number fields follow via Thm 9.2.1, which
   is proved only in the separable case; the inseparable case is cited to Fried–Jarden 12.3.5.
5. **IG.3.**
   * The rigidity criterion (Dèbes 8.2.2) needs (H1) Z(G) = 1, (H2) rational classes and
     (H3) transitivity on sni. (H2) is necessary for rational branch points and can be dropped
     over Q^ab.
   * PSL₂(F_p) is realized by rigidity only when (2/p) = −1 or (3/p) = −1, using
     quadratic-conjugate branch points.
   * No example of a field of moduli that is not a field of definition was found. Only the
     criteria (Dèbes 8.4.4) and the H²(k_m, Z(G)) obstruction (Romagny–Wewers, citing
     Dèbes–Douai 1997) appear.
6. **IG.4.**
   * NSW states that no Poitou–Tate-based proof of Shafarevich's theorem is available in the
     literature, and that Shafarevich's original article has a mistake at p = 2. Their proof
     uses the refined p-central filtration from Shafarevich's correction.
   * The method does not realize prescribed local extensions.
7. **IG.5.**
   * Romagny–Wewers Theorem 2.1 (coarse moduli over Z) is cited to Wewers' thesis; they prove the
     weaker Theorem 4.11.
   * Their acknowledgments note a referee-found gap in the proof of Proposition 4.10; its
     resolution was not checked.
   * The Hurwitz space is fine only for Z(G) = 1.

## Corrections and qualifications (NeronModelsAndSemistableAbelianVarieties)

1. **R11.1 source.** Bosch–Lütkebohmert–Raynaud, cited by the stage, is **absent**
   (book_requested). The existence chain is decomposed from Romagny 2011 and Lichtenstein. Both
   omit proofs of:
   * the δ-defect drop under blow-ups (BLR 3.3/5);
   * Weil's extension theorems (BLR 4.4/1, 5.1–5.2);
   * descent from R^sh (BLR 6.5/4);
   * base change (BLR 7.1–7.2);
   * quasi-projectivity (Raynaud, LNM 119).

   The atlas input F0 (formal geometry) is **not used** by any source read. The link carries
   that caveat.
2. **R11.1 lattice.** The sources give only the local R-line of invariant top forms and the
   canonical measure (Conrad §4). The **global** invariant-differential lattice for R35.2 is a gap.
3. **R11.2.**
   * Silverman VII.6.1 (elliptic Néron models and component groups) has **no proof** in the book;
     it points to Advanced Topics IV.
   * Lichtenstein's Weierstrass comparisons assume residue characteristic ≠ 2, 3.
   * Chevalley's decomposition is cited, and fails over imperfect fields.
   * The 57C2 component groups are quoted from tables.
4. **R11.3.**
   * SGA 7 IX proves Thm 3.6 (semistable reduction) only by reduction to Cor. 3.7, which is
     proved in **Exposé I** (monodromy theorem, via resolution for excellent 2-dimensional schemes).
   * The Galois criterion 3.5 uses the orthogonality theorem 2.4, proved with the biextensions of
     Exposés VII–VIII. The atlas lists neither import; both are unread.
   * Conrad's choice K′ = K(A[ℓ]) (K(A[4]) for ℓ = 2) and the uniform bound #GL_{2g}(Z/15Z) are
     stated without proof in his notes.
   * The Raynaud extension and uniformisation were not read.
5. **R11.4.**
   * Raynaud 8.1.4 (Q = P/E is the Néron model) needs k(s) **perfect or δ prime to p**.
     SGA 7 IX 12.1 needs d = 1.
   * IX 11.5 identifies only the **ℓ-primary part** of the component group with coker u_ℓ. The
     integral statement (11.5.2 b) uses Thm 10.4.
   * IX 12.3.7 (M = H₁ of the dual graph) is "left to the reader".
   * IX 12.5 (Picard–Lefschetz) needs a **regular** total space. For ℓ ≠ p it rests on SGA 7 II
     XV 3.4; for ℓ = p it reduces to characteristic 0. IX 12.7.2 calls the proof transcendental
     in nature.
   * The atlas supplier LPV.2 states the formula for **one** singular point, while XV 3.4 sums
     over all nodes.
6. **R11.5.**
   * Both Néron–Ogg–Shafarevich proofs read (Lichtenstein 5.2, Silverman VII.7) assume a
     **perfect residue field**.
   * The sources give only the inertia-invariant local factor #A⁰_k(k) = q^{dim A} L(1/q). The
     Weil–Deligne operator and conductor asked for by the stage are not in them.
   * The p-adic criterion (SGA 7 IX 5.10) is cited only.
7. **R11.6.**
   * BLR 7.5/4 (exactness for e < p−1) is quoted, not proved.
   * Component groups change under ramified base change even for semistable A (IX 3.3.2).
   * The level-lowering sequences and R29 comparisons have no source read.

## Corrections and qualifications (tauceti:TauCetiRoadmap/JacobianChallenge)

1. **Stacks tags in the README.**
   * Tag 0B95 is Lemma 44.2.1 (Hilb^d is an fpqc sheaf); the chapter *Picard Schemes of Curves*
     is 0B92.
   * Tag 01WP is §31.1, the introduction; the chapter *Divisors* is 01WO.
   * Tag 0B91 (Lemma 36.30.4, cohomology and base change) is correct.
   * Tag 0D04 is Prop. 99.10.2: the Picard *stack* is algebraic for flat proper finitely presented
     morphisms. It is not a Picard-functor statement.
2. **Representability over a general field.**
   * The Stacks chapter proves representability of Pic_{X/k} only for **separably closed** k
     (6.5–6.7), although its introduction says "algebraically closed". The proof of 6.7 says
     "(2)" where properness, part (1), is meant.
   * For a field with a rational point, the sources give Milne III 1.6 with Galois descent
     (1.13–1.14), which cites AG 16.23 and needs projectivity of abelian varieties via the cube.
     The other route is Kleiman 4.8, whose Hilbert/Quot proof was not read.
   * Milne works with functors on finite-type k-spaces, not on all k-schemes.
3. **Layer A degree and Riemann–Roch.**
   * With deg L := χ(L) − χ(O_X), the formula χ(L) = deg L + 1 − g is definitional once
     h⁰(O_X) = 1.
   * The content moves to three places: agreement with Σ[κ(x):k]·ord_x (a derived length
     computation), deg ω = 2g − 2 (Curves 5.2, via Chow Homology 41.3), and Serre duality (via
     Duality for Schemes).
   * The Layer A definition also needs Layer B finiteness and Layer C flat base change.
4. **Layer order.** Three proofs run against the roadmap's A → F order:
   * degree (A) needs B and C;
   * Milne's descent step (D) needs projectivity of abelian varieties (E);
   * autoduality and the principal polarization (E) need the Abel–Jacobi map and Theorem III 5.1
     (F).

   These are recorded as a gap and not linked. The one reversal linked is C → B.
5. **Unproved inputs in Milne's notes.**
   * The theorem of the cube (I 5.1) has its proof "deferred … until the next version".
   * The diagram in III 2.2 is "left as an exercise (unfortunately rather complicated)".
   * III 1.4(b) (base change) and 1.4(e) (Jac = C in genus 1) are stated without proof.
   * The rank of T_ℓA (I 7.3) and the structure of Ker p (I 7.4) are asserted.
   * The PDF text layer drops minus signs in III.6. On the page images, Lemma 6.9 reads "−f^∨ and
     φ_{L(Θ)} are inverse", and Summary 6.11 gives f^∨ = −φ_{L(Θ)}^{-1}.
6. **Genus one.** Silverman III.3.4 identifies E(K̄) with Pic⁰(E_K̄) only as groups of points. The
   scheme-level Jac(E, O) ≅ E and the reconciliation with Mathlib's class-group group law are
   derived or open.

## Shared-supplier requests

* **Duplicate Raynaud material in EXT-10.**
  `AlgebraicModularFormsAndSerreWeights:R15.4/raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction`
  restates Raynaud Prop. 3.3.2, Thm 3.3.3, Cor. 3.3.6, Thms 3.4.1/3.4.3, Cor. 3.4.4 and Rem. 3.4.6.
  These are now R07.1 nodes. Recommendation: replace that node with links from the R07.1 nodes
  `maximal-prolongation-characterized-by-valuation-bounds`,
  `uniqueness-of-finite-flat-prolongation-when-e-less-than-p-minus-1`,
  `finite-flat-prolongation-criterion-for-F-vector-space-schemes` and
  `tame-characters-of-jordan-holder-quotients-of-finite-flat-p-groups`.
* **Owner of Edixhoven Prop. 8.2** (peu ramifié ⇔ finite flat): R07.5 or R15.4. This is still
  open in `DECISIONS.md`. The FiniteFlatGroups packet adds no duplicate node and records the
  question as an R07.5 gap.
* **Kisin's general-height functor (Kisin 2006).** CohomologyComparisons CP.5 asks for it.
  R07.4 as decomposed covers only height ≤ 1 (Kisin 2009 for p > 2, Liu 2013 for all p). An
  owner and a source copy are needed.
* **Scope of PadicHodgeTheory R06.2.** Fontaine–Laffaille Thm 8.4 uses Fontaine's Barsotti–Tate
  ring B and B⁺_a ≅ Ŝ_K, while R06.2 names only D_cris. The links R06.2 → Thm 8.4 carry this
  caveat.
* **R25.1 convention translation.** Fontaine's shifted numbering must be translated to
  ArithmeticGaloisRepresentations R01 before SmallRamificationAndAbelianVarietyBaseCases R25.1
  consumes it. The dictionary is recorded in the node `R07.6/fontaine-shifted-ramification-numbering`.

* **EffectiveDiophantineMethods.**
  * DiophantineApproximationAndTranscendence DT.3 (EXT-08) should export the constants of the
    logarithmic-form theorem actually used: Waldschmidt 1980 for Tzanakis–de Weger, or Matveev.
  * GeometryOfNumbersAndQuadraticArithmetic GN.5 should export LLL (1.11) and the
    closest-vector distance lemma (de Weger 1989, Lemma 3.5).
  * AnabelianGeometryAndNonabelianChabauty NC.5 (EXT-06) is the owner of the quadratic Chabauty
    theory used by BDMTV Algorithm 3.12.

* **HeightsRationalPointsAndObstructions.**
  * **Roth over number fields** (DiophantineApproximationAndTranscendence DT.1/DT.2, EXT-08).
    Silverman IX.1.4 uses Roth for a number field K, any absolute value and α of any degree. The
    EXT-08 packet states Roth only over Q, archimedean, without proof.
  * **S-unit equations.** DT.2 owns them; Silverman IX.4.1 is a second, Roth-based proof. DT.2
    should export the two-term S-unit finiteness in the form used.
  * **Arithmetic intersection theory** on higher-dimensional arithmetic varieties, adelic metrics
    and Zhang's successive-minima theorem have **no atlas owner**. ArakelovGeometryAndAbelianHeights
    R35.1 covers only arithmetic degree over Spec O_K. A new stage or an R35 extension is needed
    before RP.5 is executable.
  * **Parshin construction duplication** with the Faltings packet (R28.5 Satz 7 node) needs an
    orchestrator decision: keep one node and link the other to it. The atlas assigns the
    construction to RP.4.
  * **Generalized Jacobians** (used in Satz 7) are not named in SchemeAndStackFoundations SF.3.
  * **Weil pairing and [m] étale** are linked from AbelianSchemesAndArithmeticModuli A3.
    **Poincaré reducibility** (used by Zhang's stabilizer reduction) is linked from A6.

* **InverseGaloisAndArithmeticFundamentalGroups.**
  * **BelyiMaps successors.** IG.3 and IG.6 must consume tauceti:TauCetiRoadmap/BelyiMaps and
    its successors (BelyiAnalyticCovers, BelyiAlgebraicAndDescent, BelyiArithmeticActions).
    Their stage statements were not checked, so no links were added.
  * **Galois-category proof** for SF.2. The Grothendieck pro-representability import and the
    (G1)–(G6) verification for étale covers should be owned there.
  * **Riemann existence** (Dèbes ch. 7 or SGA 1 XII 5.1). This is shared by IG.3 and
    ComplexComparisonPartII C4, and its algebraization step belongs to C4.
  * **Poitou–Tate and Grunwald–Wang-type existence** (NSW 9.3.2) belong to the class-field-theory
    supplier LI.4 or ArithmeticGaloisDuality; they are used by Shafarevich's theorem.
  * **Stack-theoretic Hurwitz spaces** belong to R09.4.

* **NeronModelsAndSemistableAbelianVarieties.**
  * **Monodromy theorem** (SGA 7 I Exp. I). LPV.1 owns quasi-unipotence "in the geometric
    coefficient setting actually used". It should confirm that this covers H¹ of an abelian
    variety over a mixed-characteristic trait with the echelon-2 refinement of IX 3.7.
    Alternatively, R11.3 must own it.
  * **Orthogonality theorem IX 2.4 and biextensions** (SGA 7 VII–VIII) have no named owner. They
    are needed by the Galois criterion (R11.3). A3 owns the Weil pairing only.
  * **LPV.2 multi-node form.** The semistable-curve consumer needs XV 3.4 with several ordinary
    double points, or an exported localization.
  * **LPV.7:semistable-curves** asks for "compatibility with the component/Jacobian/Tate-module
    description". That is SGA 7 IX 12.3–12.5 as decomposed in R11.4. An orchestrator should decide
    whether LPV.7 links to the R11.4 nodes or duplicates them. No link was added.
  * **ArithmeticGaloisRepresentations R01** (Weil–Deligne carrier and conductor, per LPV.1's
    statement) is needed for R11.5's characteristic-zero local factor. No link was added, because
    no conductor source was read.
  * **Source acquisitions:** BLR *Néron Models* (chapters 2–7) and Faltings–Chai (Raynaud
    extension, uniformisation).

* **tauceti:TauCetiRoadmap/JacobianChallenge.**
  * **SchemeAndStackFoundations SF.1** should export fppf descent of invertible modules with
    rigidification (Stacks Descent 5.2) and effective descent of closed immersions (Descent 37.2).
    It should also export Galois descent for quasi-projective schemes (Milne III 1.13).
  * **Étale realization of the Jacobian**, H¹_et(X_k̄, Z_ℓ(1)) ≅ T_ℓJ and the Kummer sequence.
    Consumers: WC.5, EDC.2:trace-purity, SF.3 and PadicHodgeTheory R06.5 ("general étale
    realization is consumed from #196/JacobianChallenge"). The atlas has no owner decision; either
    JacobianChallenge or the TraceFormula Layer 8 named in EDC.2 must own it.
  * **Duplicate ownership of Riemann–Roch.** The function-field route in AlgebraicCurves (Layer 12
    comparison contract) and TauCeti `FieldTheory/FunctionField/RiemannRoch` overlap with Layer B.
    AlgebraicCurves 12E already names JacobianChallenge Layers A–B as the scheme side.
  * **Generalized Jacobians** (Faltings Satz 7, NeronModels R11.4) are outside JacobianChallenge v1
    (smooth proper curves). R11.4 or SF.3 must own them.
  * **Source acquisitions:** Mumford, *Abelian Varieties* (catalogued as requested); Milne,
    *Jacobian varieties* in Cornell–Silverman (1986); Kleiman's Appendix A; Stacks *Duality for
    Schemes*, *Descent* and *Chow Homology* chapters (public).

## Unresolved cross-job dependencies

* AlgebraicModuliForArithmeticGeometry **R09.3** (EXT-06), the only atlas prerequisite of R07.1.
  Its scope for Cartier duality, fppf quotients and descent of finite flat groups was not checked.
* LocalGaloisDeformationRings **L7, R08.4** (EXT-11). Links were added from the Fontaine–Laffaille
  lattice full faithfulness and from Kisin's coefficient functors/Prop. 1.2.11. The consumer
  sections were verified by reading Kisin 2.1.2–2.1.4 and 2.4.13–2.4.14.
* PotentialAutomorphyInfrastructure **PA.1** (EXT-12). A link was added from the
  Fontaine–Laffaille lattice functor.
* PadicHodgeTheory **R06.4** (internal). Links were added from Thm 8.4, the [0, q−2] derived node
  and the MF′ full faithfulness.
* SmallRamificationAndAbelianVarietyBaseCases **R25.1** (EXT-13). Links were added from Fontaine
  Theorem A and its different bound.
* CrystallineCohomology **CR.7** (internal). The covariance check on the constant and
  multiplicative groups is listed as an acceptance item of the R07.2 anti-equivalence node.

* EffectiveDiophantineMethods: links were added from DT.3 (EXT-08), GN.5 (EXT-09), ColemanIntegration L1 (EXT-14), SchemeAndStackFoundations SF.3 (EXT-01), HeightsRationalPointsAndObstructions RP.1 (this job, pending) and AnabelianGeometryAndNonabelianChabauty NC.5 (EXT-06). All are existing atlas edges except node-level refinements. The only new stage edge is ED.0 → ED.6 (the BDMTV root-isolation lemma used in Step 6c).

* HeightsRationalPointsAndObstructions links from outside suppliers:
  * FoundationsAndLibraryIntegration LI.4 (EXT-01): product formula, class groups, S-units,
    reciprocity.
  * SchemeAndStackFoundations SF.2 and SF.3 (EXT-01).
  * AbelianSchemesAndArithmeticModuli A3 and A6.
  * AlgebraicModuliForArithmeticGeometry R09.3 (EXT-06).
  * DiophantineApproximationAndTranscendence DT.2 (EXT-08).
  * ArakelovGeometryAndAbelianHeights R35.1.
  * Sibling Faltings nodes R28.1 (Hermite–Minkowski) and R28.5 (curve corollary).

  None of the consumer packets (DY.1, DY.4, ED.2, ED.3, NC.5, ST.4) was checked against the new
  node IDs. EffectiveDiophantineMethods links to the RP.1 stage, not to nodes.

* InverseGaloisAndArithmeticFundamentalGroups links from outside suppliers, all on existing atlas
  edges:
  * SchemeAndStackFoundations SF.2 → IG.0 and SF.3 → IG.3;
  * FoundationsAndLibraryIntegration LI.4 → IG.0, IG.2 and IG.4;
  * ComplexComparisonPartII C4 → IG.3;
  * AlgebraicModuliForArithmeticGeometry R09.4 → IG.5.

  Links to consumer stages: IG.1 → AnabelianGeometryAndNonabelianChabauty NC.0 (EXT-06) and
  IG.0 → ArithmeticDynamics DY.5. New internal stage edges IG.1 → IG.5 and IG.3 → IG.4 are
  acyclic.

* NeronModelsAndSemistableAbelianVarieties links from outside suppliers:
  * AbelianSchemesAndArithmeticModuli A1 → R11.1 and A3 → R11.3 (existing atlas edges);
  * AdicSpacesPartII F0 → R11.1 (existing, recorded as not exercised);
  * PadicHodgeTheory R06.6 → R11.5 (existing);
  * LefschetzPencilsAndVanishingCycles LPV.1 → R11.3 and LPV.2 → R11.4 (new, with caveats);
  * sibling FiniteFlatGroups R07.1 → R11.6 (new).

  Links to consumers: R11.1 → ArakelovGeometryAndAbelianHeights R35.2, R11.2 →
  HeegnerPointEulerSystems HE.5, R11.3 → R35.3, R11.6 → Faltings R28.1 (all existing atlas
  edges), and R11.3 → the Faltings R28.3 node (new). The consumer packets for R35, HE, BSD, CM, R14,
  R20, R25 and GZ were not checked against the new node IDs.

* tauceti:TauCetiRoadmap/JacobianChallenge links:
  * Supplier: SchemeAndStackFoundations SF.1 (EXT-01) → Layers C and D.
  * Consumers, each stage statement read in `data/atlas.json`:
    * SF.3 (EXT-01);
    * tauceti AlgebraicCurves Layer 12 (12E names JacobianChallenge Layers A–B);
    * sibling NeronModels R11.4 Raynaud node;
    * AbelianSchemesAndArithmeticModuli A6 ("field Hom/End API of JacobianChallenge");
    * FiniteFlatGroups R07.2 ("field-valued abelian varieties are imported from
      JacobianChallenge/R10");
    * WeilConjectures WC.5 and EtaleDualityAndPerverseSheaves EDC.2:trace-purity, where the atlas
      edge comes from `UPSTREAM:JacobianChallenge`.

  Stages that name JacobianChallenge but got no link: GrossZagierAndArithmeticHeights GZ.2,
  DeligneWeightsAndPurity DWP.1, PadicHodgeTheory R06.5 and SchemeKTheoryOperations S.7. Consumer
  packets were not checked against the new node IDs.

## Next actions

1. Orchestrator decisions:
   * Parshin construction duplication (Heights RP.4 against Faltings R28.5);
   * layer-order conflicts in JacobianChallenge (A↔B/C, D↔E, E↔F);
   * owner of the étale realization of the Jacobian;
   * whether LPV.7:semistable-curves reuses the R11.4 nodes;
   * independent review of the six continuation-run packets.
2. Deferred JacobianChallenge reading:
   * Stacks *Duality for Schemes* (§§3, 12, 15–16, 21–24), *Chow Homology* §41, *Descent* §§5–6
     and 37, and *Derived Categories of Schemes* §§30–31;
   * Kleiman §§3–4 and Appendix A;
   * Milne AV I §§6, 8–9 and III §§7–9;
   * Mumford, *Abelian Varieties*, once acquired;
   * an étale-cohomology source for T_ℓJ ≅ H¹_et.
3. Deferred NeronModels reading:
   * SGA 7 I Exp. I (monodromy theorem, with Deligne's appendix);
   * Exp. IX §§2 and 4–10 on page images (orthogonality, conductor, p-adic criterion, Raynaud
     extension, monodromy pairing, 10.4);
   * SGA 7 II XV §§1–3 (library copy with text layer);
   * Raynaud 1970 §§5–7;
   * Conrad, *Minimal models for elliptic curves*;
   * Silverman, Advanced Topics IV;
   * Ribet 1990 §§2–3;
   * BLR and Faltings–Chai, once acquired.
4. Deferred Heights reading:
   * Hindry–Silverman Parts B and D, once acquired;
   * Serre, *Lectures on the Mordell–Weil theorem*;
   * Poonen §§6.6–6.9 and §1.5.7;
   * Zhang 1995 (JAG) and Zhang 1993 (library `ZhangAdmissible`);
   * Corvaja–Zannier 2002;
   * Faltings 1991/1994.
5. Deferred InverseGalois reading:
   * Dèbes ch. 7 (Riemann existence) and §§2.5–2.6;
   * SGA 1 XIII §§2.1–2.10;
   * NSW 9.6.2–9.6.5, IX §5 and 9.3.2;
   * Romagny–Wewers §§4.3–4.5;
   * Dèbes–Douai 1997 (field of moduli counterexample);
   * the BelyiMaps successor stages.
6. Deferred FiniteFlatGroups reading:
   * Conrad 1999 pp. 10–20 (proof of Fontaine's Honda-system theorem);
   * `papers/SS_Kisin2.dvi` §2.2 (Cor. 2.2.6, via dvipdfmx);
   * `papers/SS_KisinSemistable.dvi` (descent data, potentially semistable case);
   * public copies of Tate 1967, Serre 1972 §1 and Laffaille 1980 (NUMDAM).
