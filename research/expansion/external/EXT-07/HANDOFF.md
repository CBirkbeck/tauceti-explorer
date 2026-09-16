# EXT-07 handoff — Arithmetic geometry

Job: EXT-07 in `research/expansion/EXTERNAL_AGENTS.md`.
Roadmaps: `EffectiveDiophantineMethods`, `FaltingsFinitenessAndIsogenyTheorems`,
`FiniteFlatGroupsAndIntegralPadicHodgeTheory`, `HeightsRationalPointsAndObstructions`,
`InverseGaloisAndArithmeticFundamentalGroups`, `NeronModelsAndSemistableAbelianVarieties`,
`tauceti:TauCetiRoadmap/JacobianChallenge`.

Status: **in progress**. The first run stopped on a request timeout after writing the Faltings
packet. A continuation run (16 September 2026) is working through the remaining six roadmaps in
this order:

1. `FiniteFlatGroupsAndIntegralPadicHodgeTheory` — **done**
2. `EffectiveDiophantineMethods` — **done**
3. `HeightsRationalPointsAndObstructions` — **done**
4. `InverseGaloisAndArithmeticFundamentalGroups` — **done**
5. `NeronModelsAndSemistableAbelianVarieties`
6. `tauceti:TauCetiRoadmap/JacobianChallenge`

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
| `silverman-arithmetic-of-elliptic-curves-2009` | Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., GTM 106 (2009) | library copy, catalogue `WEIL-PRIVATE-SILVERMAN2009` (user-supplied private copy, not redistributed; cited by DOI) | 72ee67bf…788cab25 | VIII.1–VIII.6, VIII.9, VIII.10 opening; IX intro, IX.1–IX.4; X.1; X.4. Relations read on page images, because the text layer drops ≠ |
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

## Next actions

1. `NeronModelsAndSemistableAbelianVarieties` packet (next).
2. Then `tauceti:TauCetiRoadmap/JacobianChallenge`.
3. Deferred Heights reading:
   * Hindry–Silverman Parts B and D, once acquired;
   * Serre, *Lectures on the Mordell–Weil theorem*;
   * Poonen §§6.6–6.9 and §1.5.7;
   * Zhang 1995 (JAG) and Zhang 1993 (library `ZhangAdmissible`);
   * Corvaja–Zannier 2002;
   * Faltings 1991/1994.
4. Deferred InverseGalois reading:
   * Dèbes ch. 7 (Riemann existence) and §§2.5–2.6;
   * SGA 1 XIII §§2.1–2.10;
   * NSW 9.6.2–9.6.5, IX §5 and 9.3.2;
   * Romagny–Wewers §§4.3–4.5;
   * Dèbes–Douai 1997 (field of moduli counterexample);
   * the BelyiMaps successor stages.
5. Deferred FiniteFlatGroups reading:
   * Conrad 1999 pp. 10–20 (proof of Fontaine's Honda-system theorem);
   * `papers/SS_Kisin2.dvi` §2.2 (Cor. 2.2.6, via dvipdfmx);
   * `papers/SS_KisinSemistable.dvi` (descent data, potentially semistable case);
   * public copies of Tate 1967, Serre 1972 §1 and Laffaille 1980 (NUMDAM).
