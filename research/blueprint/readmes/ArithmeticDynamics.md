# Arithmetic dynamics

Blueprint for the roadmap `ArithmeticDynamics`, job `BP-ArithmeticDynamics` (issue #1023).
Packet: `research/blueprint/packets/ArithmeticDynamics.json`. Suggested Lean file:
`research/blueprint/suggested/ArithmeticDynamics.lean`. Handoff: `research/blueprint/handoff/BP-ArithmeticDynamics.md`.

The roadmap goes from the iteration of a single rational map to the arithmetic of families.
- **DY.0 and DY.1** set up self-maps of the projective line by coprime forms, and the Call–Silverman canonical height.
- **DY.2** localises the height into escape rates and canonical measures, and treats reduction.
- **DY.3** counts periodic and preperiodic points through dynatomic polynomials.
- **DY.4** proves equidistribution of small points for adelic measures.
- **DY.5** builds arboreal Galois representations.
- **DY.6** treats families: Lattès maps, specialisation and variation of canonical heights, the critical height, uniform
  common torsion for Legendre pairs, and the proven cases of dynamical Mordell–Lang.

Conjectures (uniform boundedness, dynamical Lehmer, general dynamical Mordell–Lang and André–Oort) are stated as
conjectures and never consumed.

**Status: partial.** DY.0, DY.1 and DY.4 are source decomposed. DY.2, DY.3, DY.5 and DY.6 are partial, each with a
precise `remaining` list in the packet's coverage record. The packet has:
- 403 nodes, 627 API items and 359 unit tests;
- 379 declarations of the pinned libraries cited;
- 47 mistakes in its sources recorded;
- 17 gaps and 26 requests to other roadmaps.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Layer | Status | Nodes | Planets |
|---|---|---|---|
| DY.0 | source decomposed | 39 | Preperiodic point; Resultant of a rational map; Rational map of ℙ¹; Moduli space M_d; Milnor's M₂ ≅ 𝔸²; Good reduction |
| DY.1 | source decomposed | 29 | Tate's limit; Canonical height on ℙ¹; Call–Silverman canonical height; Zero canonical height iff preperiodic; Northcott for preperiodic points; Canonical height of a divisorial eigenclass |
| DY.2 | partial | 55 | Homogeneous escape rate; Local canonical height; Local decomposition of the canonical height; Multiplier of a periodic cycle; Periods of points under good reduction; Canonical measure |
| DY.3 | partial | 68 | Effectivity of dynatomic cycles; Dynatomic polynomial; Dynatomic curve Y₁(n); Northcott finiteness of preperiodic points; Certified enumeration of preperiodic points; Uniform boundedness conjecture |
| DY.4 | source decomposed | 66 | Adelic measure; Equidistribution of small points on P¹; Arakelov–Zhang pairing; Yuan's equidistribution theorem; Dynamical equidistribution; Vanishing of the dynamical pairing |
| DY.5 | partial | 65 | Automorphism group of a rooted tree; Preimage tree; Arboreal Galois representation; Stoll's maximality criterion; Jones's ramification criterion; Odoni's theorem |
| DY.6 | partial | 81 | Lattès map; Call–Silverman specialization theorem; Critical height; Critical height is a moduli height; Uniform common torsion images for Legendre pairs; Étale dynamical Mordell–Lang |

## What this roadmap owns, and what it imports

- **From the pinned libraries** (baseline citations, listed in each layer's section): iteration, periodic points and
  minimal periods, and semiconjugacy (Mathlib's `Dynamics`); resultants; the absolute logarithmic Weil height,
  admissible absolute values and Northcott; Galois actions on roots and Krull topologies; and Tau Ceti's canonical
  height on elliptic curves.
- **From other roadmaps**, each through a `requests` entry:
  - TropicalAndBerkovichArithmetic TB.0, TB.1 and TB.6: the Berkovich line, potential theory, model metrics and local
    measures;
  - HeightsRationalPointsAndObstructions RP.0: Weil heights on general varieties;
  - SchemeAndStackFoundations SF.0 and SF.5;
  - ComputationalNumberTheory CN.0, and EffectiveDiophantineMethods ED.0, ED.3 and ED.4: exact arithmetic, and
    certified point lists and Chabauty certificates;
  - InverseGaloisAndArithmeticFundamentalGroups IG.2: Hilbert irreducibility;
  - Tau Ceti's ModularCurves 0D, NumberFieldArithmetic and AlgebraicCurves layers.
- **Supplied to others:** the canonical height of a rational map of ℙ¹, requested by ClassicalArithmeticCompletion CA.6.
- **Sources beyond the roadmap document:** DeMarco–Krieger–Ye (Ann. of Math. 2020) and DeMarco–Mavraki–Ye (Forum Math. Pi
  2026). Their accepted source routes name DY.0, DY.2, DY.4 and DY.6, and their items are covered in those layers.
- **Retired supplier.** The roadmap's input `FoundationsAndLibraryIntegration` was retired on 16 September 2026. No node
  names it.

## Sources

Every source is freely available and was opened and read; the sections read, and the SHA-256 of each file, are in the
packet. Silverman's *The Arithmetic of Dynamical Systems* and Baker–Rumely's book are not public; public papers and lecture
notes replace them.

- **`call-silverman-1993`** — Gregory S. Call and Joseph H. Silverman, *Canonical heights on varieties with morphisms*. Compositio Math. 89 (1993), no. 2, 163–205; Numdam scan, read 2026-09-24 <https://www.numdam.org/item/CM_1993__89_2_163_0.pdf>.
- **`demarco-mavraki-ye-2026`** — Laura DeMarco, Niki Myrto Mavraki and Hexi Ye, *Bounded geometry for PCF-special subvarieties*. Forum Math. Pi 14 (2026) e4; read in arXiv:2405.17343v3 (the accepted version); read 2026-09-24 <https://arxiv.org/abs/2405.17343>.
- **`levy-2011`** — Alon Levy, *The space of morphisms on projective space*. arXiv:0903.1318v2 (Acta Arith. 146 (2011) 13–31); read 2026-09-24 <https://arxiv.org/abs/0903.1318>.
- **`milnor-1993`** — John Milnor (Appendix F with Tan Lei), *Geometry and dynamics of quadratic rational maps (arXiv title: Remarks on quadratic rational maps)*. Experiment. Math. 2 (1993) 37–83; read in arXiv math/9209221v1 (Stony Brook IMS preprint 1992/14), the published version not being accessible to this worker; read 2026-09-24 <https://arxiv.org/abs/math/9209221>.
- **`rumely-2013`** — Robert Rumely, *The minimal resultant locus*. arXiv:1304.1201v2 (Acta Arith. 169 (2015) 251–290); read 2026-09-24 <https://arxiv.org/abs/1304.1201>.
- **`rumely-2014`** — Robert Rumely, *The geometry of the minimal resultant locus*. arXiv:1402.6017v2; read 2026-09-24 <https://arxiv.org/abs/1402.6017>.
- **`silverman-ads-sample`** — Joseph H. Silverman, *The Arithmetic of Dynamical Systems, §§3.3–3.5 (author's public sample pages)*. GTM 241, Springer 2007, printed pp. 95–116 as posted by the author; errata list of May 8, 2014 checked; read 2026-09-24 <https://www.math.brown.edu/johsilve/ADSSample.pdf>.
- **`silverman-aws-2010`** — Joseph H. Silverman, *Lecture Notes on Arithmetic Dynamics (Arizona Winter School 2010)*. Version of February 8, 2010, 39 pp.; read 2026-09-24 <https://swc-math.github.io/aws/2010/2010SilvermanNotes.pdf>.
- **`demarco-krieger-ye-2020`** — Laura DeMarco; Holly Krieger; Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*. arXiv:1901.09945v2 (3 December 2019), 49 pp., read 2026-09-24; published Ann. of Math. 191 (2020) 949–1001 (the published text was collated by the paper extraction PAPER-DEMARCO-KRIEGER-YE-20, not for this layer). Locators are to arXiv v2. <https://arxiv.org/pdf/1901.09945v2>.
- **`baker-rumely-2006`** — Matthew Baker; Robert Rumely, *Equidistribution of small points, rational dynamics, and potential theory*. arXiv:math/0407426v2 (27 July 2005), 50 pp., read 2026-09-24; published Ann. Inst. Fourier 56 (2006) 625–688 (not collated). Locators are to arXiv v2. <https://arxiv.org/pdf/math/0407426v2>.
- **`favre-rivera-letelier-2006`** — Charles Favre; Juan Rivera-Letelier, *Équidistribution quantitative des points de petite hauteur sur la droite projective*. arXiv:math/0407471v2 (24 January 2006), 46 pp., read 2026-09-24; published Math. Ann. 335 (2006) 311–361 (not collated). Locators are to arXiv v2. <https://arxiv.org/pdf/math/0407471v2>.
- **`benedetto-aws-2010`** — Robert L. Benedetto, *Non-archimedean dynamics in dimension one: lecture notes*. Arizona Winter School 2010, notes dated 9 March 2010, 87 pp., read 2026-09-24. Printed page numbers equal PDF page numbers. <https://swc-math.github.io/aws/2010/2010BenedettoNotes-09Mar.pdf>.
- **`hutz-2009`** — Benjamin Hutz, *Good reduction of periodic points on projective varieties*. arXiv:0801.3645v3 (12 March 2010), 18 pp., read 2026-09-24 (v2 of 19 March 2009, SHA-256 9e1d87cce1ec15317ec6d531b38f6c2dc11c00ea57f79c7b0c03511ca4b57633, compared at Lemma 23); published Illinois J. Math. 53 (2009) (not collated). <https://arxiv.org/pdf/0801.3645v3>.
- **`ms95`** — Patrick Morton and Joseph H. Silverman, *Periodic points, multiplicities, and dynamical units*. J. reine angew. Math. 461 (1995) 81–122; scan served by the Göttingen State and University Library (GDZ), read 24 September 2026 <https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0461/LOG_0008.pdf>.
- **`hutz10`** — Benjamin Hutz, *Dynatomic cycles for morphisms of projective varieties*. arXiv:0801.3643v2 (22 October 2008); published New York J. Math. 16 (2010); arXiv version read 24 September 2026 <https://arxiv.org/abs/0801.3643>.
- **`hutz15`** — Benjamin Hutz, *Determination of all rational preperiodic points for morphisms of PN*. arXiv:1210.6246v3 (3 July 2013); published Math. Comp. 84 (2015); arXiv version read 24 September 2026 <https://arxiv.org/abs/1210.6246>.
- **`fps95`** — E. V. Flynn, Bjorn Poonen and Edward F. Schaefer, *Cycles of quadratic polynomials and rational points on a genus-2 curve*. arXiv:math/9508211v1 (4 August 1995; the only arXiv version); published Duke Math. J. 90 (1997) 435–463; arXiv version read 24 September 2026 <https://arxiv.org/abs/math/9508211>.
- **`poonen95`** — Bjorn Poonen, *The complete classification of rational preperiodic points of quadratic polynomials over Q: a refined conjecture*. arXiv:math/9512217v1 (11 December 1995; the only arXiv version); published Math. Z. 228 (1998) 11–29; arXiv version read 24 September 2026 <https://arxiv.org/abs/math/9512217>.
- **`poonen-errata`** — Bjorn Poonen, *Remarks and errata*. author's page, list dated 14 August 2025, read 24 September 2026 <https://math.mit.edu/~poonen/papers/errata.pdf>.
- **`morton98`** — Patrick Morton, *Arithmetic properties of periodic points of quadratic maps, II*. Acta Arith. 87 (1998) 89–102; PDF served by the ICM (matwbn) digital library, read 24 September 2026 <http://matwbn.icm.edu.pl/ksiazki/aa/aa87/aa8721.pdf>.
- **`morton92`** — Patrick Morton, *Arithmetic properties of periodic points of quadratic maps*. Acta Arith. 62 (1992) 343–372; PDF served by the ICM (matwbn) digital library, read 24 September 2026 <http://matwbn.icm.edu.pl/ksiazki/aa/aa62/aa6243.pdf>.
- **`stoll08`** — Michael Stoll, *Rational 6-cycles under iteration of quadratic polynomials*. arXiv:0803.2836v2 (21 April 2009); published LMS J. Comput. Math. 11 (2008) 367–380; arXiv version read 24 September 2026 <https://arxiv.org/abs/0803.2836>.
- **`gaoou13`** — Yan Gao and Yafei Ou, *The dynatomic periodic curves for polynomial z ↦ z^d + c are smooth and irreducible*. arXiv:1304.4751v1 (17 April 2013), read 24 September 2026 <https://arxiv.org/abs/1304.4751>.
- **`doylepoonen19`** — John R. Doyle and Bjorn Poonen, *Gonality of dynatomic curves and strong uniform boundedness of preperiodic points*. arXiv:1711.04233v2 (1 January 2019); published Compositio Math. 156 (2020) 733–743; arXiv version read 24 September 2026 <https://arxiv.org/abs/1711.04233>.
- **`bijmst18`** — Robert Benedetto, Patrick Ingram, Rafe Jones, Michelle Manes, Joseph H. Silverman and Thomas J. Tucker, *Current trends and open problems in arithmetic dynamics*. arXiv:1806.04980v2 (2 July 2018); published Bull. Amer. Math. Soc. 56 (2019) 611–685 (the publisher's page refused automated access); arXiv version read 24 September 2026 <https://arxiv.org/abs/1806.04980>.
- **`chambert-loir-2006`** — Antoine Chambert-Loir, *Mesures et équidistribution sur les espaces de Berkovich*. arXiv:math/0304023v3 (12 November 2004), 21 pp.; published J. reine angew. Math. 595 (2006), 215–235. Locators are to the arXiv v3 pagination, read 2026-09-24. <https://arxiv.org/pdf/math/0304023>.
- **`pst2012`** — Clayton Petsche; Lucien Szpiro; Thomas J. Tucker, *A dynamical pairing between two rational maps*. arXiv:0911.1875v1 (10 November 2009), 22 pp.; published Trans. Amer. Math. Soc. 364 (2012), 1687–1710, doi:10.1090/S0002-9947-2011-05350-X. Locators are to the arXiv v1 pagination, read 2026-09-24. <https://arxiv.org/pdf/0911.1875>.
- **`yuan2008`** — Xinyi Yuan, *Big line bundles over arithmetic varieties*. arXiv:math/0612424v2 (11 January 2012), 47 pp.; published Invent. Math. 173 (2008), 603–649. Locators are to the arXiv v2 pagination, read 2026-09-24. <https://arxiv.org/pdf/math/0612424>.
- **`baker-hsia-2005`** — Matthew Baker; Liang-Chung Hsia, *Canonical heights, transfinite diameters, and polynomial dynamics*. arXiv:math/0305181v2 (25 July 2004), 28 pp.; published J. reine angew. Math. 585 (2005), 61–92. Locators are to the arXiv v2 pagination, read 2026-09-24. <https://arxiv.org/pdf/math/0305181>.
- **`fili2017`** — Paul Fili, *A metric of mutual energy and unlikely intersections for dynamical systems*. arXiv:1708.08403v1 (28 August 2017), 17 pp. Locators are to the arXiv v1 pagination, read 2026-09-24. <https://arxiv.org/pdf/1708.08403>.
- **`baker-demarco-2011`** — Matthew Baker; Laura DeMarco, *Preperiodic points and unlikely intersections*. arXiv:0911.0918v3 (14 December 2010), 26 pp.; published Duke Math. J. 159 (2011), 1–29. Locators are to the arXiv v3 pagination, read 2026-09-24. <https://arxiv.org/pdf/0911.0918>.
- **`jones-arboreal-survey`** — Rafe Jones, *Galois representations from pre-image trees: an arboreal survey*. arXiv:1402.6018v1 (24 February 2014), 30 pp.; journal reference on the abstract page: Pub. Math. Besançon (2013) 107–136. Version read: arXiv v1, read 2026-09-24. <https://arxiv.org/abs/1402.6018>.
- **`jones-density-2008`** — Rafe Jones, *The density of prime divisors in the arithmetic dynamics of quadratic polynomials*. arXiv:math/0612415v1 (14 December 2006); journal reference: J. Lond. Math. Soc. (2) 78 (2008), no. 2, 523–544. Version read: arXiv v1 (the published version was not consulted), read 2026-09-24. <https://arxiv.org/abs/math/0612415>.
- **`aitken-hajir-maire`** — Wayne Aitken, Farshid Hajir, Christian Maire, *Finitely ramified iterated extensions*. arXiv:math/0408170v1 (12 August 2004), 19 pp. Version read: arXiv v1 (the only arXiv version; the published version was not consulted), read 2026-09-24. <https://arxiv.org/abs/math/0408170>.
- **`juul-generic-iterates`** — Jamie Juul, *Iterates of generic polynomials and generic rational functions*. arXiv:1410.3814v6 (5 April 2018), 22 pp. Version read: arXiv v6, read 2026-09-24. <https://arxiv.org/abs/1410.3814>.
- **`stoll-1992-quadratic-iterates`** — Michael Stoll, *Galois groups over Q of some iterated polynomials (Arch. Math. 59 (1992) 239–244), as reproduced with the paper's numbering in the blueprint of the QuadraticIterates formalization*. The published paper (DOI 10.1007/BF01197321) is not openly available; read instead the public leanblueprint of M. Stoll's Lean+Mathlib formalization QuadraticIterates (Apache-2.0), which states it reproduces the paper's definitions, statements and proofs with the printed numbering (Facts 1.0, Lemma 1.1, …, Lemma 2.2), at commit 7d50dc181881faffd3f97dcca422d568cc3c61c4 (17 September 2026), files blueprint/src/content.tex and chapters/00-intro.tex through 04-support.tex; read 2026-09-24. <https://github.com/MichaelStollBayreuth/QuadraticIterates/tree/7d50dc181881faffd3f97dcca422d568cc3c61c4/blueprint/src>.
- **`demarco-krieger-ye-2020-annals`** — Laura DeMarco, Holly Krieger and Hexi Ye, *Uniform Manin-Mumford for a family of genus 2 curves (published version)*. Annals of Mathematics 191 (2020), no. 3, 949–1001, doi:10.4007/annals.2020.191.3.5; PDF from annals.math.princeton.edu, read 2026-09-24 <https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf>.
- **`ingram-2018-critical-height`** — Patrick Ingram, *The critical height is a moduli height*. arXiv:1610.07904v3 (15 October 2017); published Duke Math. J. 167 (2018), 1311–1346; read 2026-09-24 <https://arxiv.org/abs/1610.07904v3>.
- **`ingram-2011-variation`** — Patrick Ingram, *Variation of the canonical height for a family of polynomials*. arXiv:1003.4225v3 (5 May 2011); read 2026-09-24 <https://arxiv.org/abs/1003.4225v3>.
- **`ghioca-tucker-zieve-2008`** — Dragos Ghioca, Thomas J. Tucker and Michael E. Zieve, *Intersections of polynomial orbits, and a dynamical Mordell-Lang conjecture*. arXiv:0705.1954v2 (8 October 2007); published Invent. Math. 171 (2008), 463–483; read 2026-09-24 <https://arxiv.org/abs/0705.1954v2>.
- **`bell-ghioca-tucker-2010`** — Jason P. Bell, Dragos Ghioca and Thomas J. Tucker, *The dynamical Mordell-Lang problem for étale maps*. arXiv:0808.3266v1 (24 August 2008), the only arXiv version; published Amer. J. Math. 132 (2010); read 2026-09-24 <https://arxiv.org/abs/0808.3266v1>.
- **`milnor-lattes-2006`** — John Milnor, *On Lattès maps*. arXiv:math/0402147v2 (Stony Brook IMS preprint 2004/01); published in Dynamics on the Riemann Sphere (EMS, 2006), 9–43; read 2026-09-24 <https://arxiv.org/abs/math/0402147v2>.
- **`ghioca-2019-positive-characteristic`** — Dragos Ghioca, *The dynamical Mordell-Lang conjecture in positive characteristic*. arXiv:1610.00367v1; read 2026-09-24 <https://arxiv.org/abs/1610.00367v1>.

## Layers

## DY.0 Iteration, periodicity and dynamical moduli

This layer builds the objects that every other layer of the roadmap iterates: orbits and preperiodic
points of an arbitrary self-map; self-maps of the projective line over a field presented by pairs of
binary forms, with their resultant, composition, action on points, base change and conjugation by
`PGL₂`; the fixed points, multipliers and critical points of such maps; the moduli spaces `M_d(K)`
and `M_d^cm(K)` of conjugacy classes, with Milnor's descriptions of `M₂` and `M₂^cm`; and good
reduction over a valuation ring, with the reduction of points and Silverman's compatibility of
reduction with composition and evaluation. Iteration is composition in a monoid, so an equality of
iterates is an equality of maps, never only an equality of values at sampled points.

Sources: Silverman, *Lecture Notes on Arithmetic Dynamics* (Arizona Winter School 2010), §§1–3 and
§6.1; Milnor, *Geometry and dynamics of quadratic rational maps* (Experiment. Math. 2 (1993), read in
arXiv math/9209221v1), §§2–3, §6 and Appendices A–C; Rumely, *The minimal resultant locus*
(arXiv:1304.1201v2) and *The geometry of the minimal resultant locus* (arXiv:1402.6017v2); Levy,
*The space of morphisms on projective space* (arXiv:0903.1318v2), §§1–2; DeMarco–Mavraki–Ye,
*Bounded geometry for PCF-special subvarieties* (arXiv:2405.17343v3), §2.1; Call–Silverman,
*Canonical heights on varieties with morphisms* (Compositio Math. 89 (1993)), p. 168. Silverman's
*The space of rational maps on ℙ¹* (Duke Math. J. 94 (1998)) and his book *The Arithmetic of
Dynamical Systems* are not publicly available; public equivalents are used throughout, and the
scheme-level moduli statements that only the 1998 paper proves are the gap recorded below.

### What the libraries already provide (consume; never restate)

At Mathlib `082e2d3` and Tau Ceti `f790474`:

- **Iteration and periodic points of a self-map of a type.** `Nat.iterate` (`f^[n]`),
  `Function.IsPeriodicPt`, `Function.periodicPts`, `Function.minimalPeriod`,
  `Function.periodicOrbit` (a `Cycle`) and the divisibility calculus, e.g.
  `Function.IsPeriodicPt.iterate_mod_apply`. This is the periodic half of the layer, in greater
  generality than morphisms of varieties.
- **Semiconjugacy.** `Function.Semiconj`, `Function.Semiconj.iterate_right`,
  `Function.IsPeriodicPt.map` and `Function.Semiconj.mapsTo_periodicPts` transport periodic points.
- **Monoids of self-maps.** `Function.End α` (composition, power = iteration) and, in a category,
  `CategoryTheory.End X` with `CategoryTheory.End.mul_def` (`xs * ys = ys ≫ xs`).
- **Univariate resultants.** `Polynomial.sylvester` and `Polynomial.resultant f g m n` with explicit
  formal degrees, with `resultant_C_mul_left/right`, `resultant_comm`, `resultant_map_map`,
  `resultant_zero_left`, `resultant_X_pow_left`, `resultant_succ_left_deg`,
  `resultant_add_left_deg/right_deg`, `resultant_mul_left/right` (at actual degrees),
  `resultant_eq_zero_iff` (actual degrees, over a field) and the Bézout-type identity
  `exists_mul_add_mul_eq_C_resultant`. Tau Ceti extends this (`Polynomial.resultant_C_sub_X_right`,
  `Polynomial.Monic.resultant_of_le`, `AdjoinRoot.norm_mk_eq_resultant`).
- **Binary forms.** `Polynomial.homogenize`, `aeval_homogenize_X_one`,
  `homogenize_eq_of_isHomogeneous`, `homogenize_mul`, `homogenize_finsetProd`, `eval_homogenize`,
  and `Polynomial.toTupleMvPolynomial p = (homogenize p (deg p), X₁^{deg p})`, the pair of forms of
  a polynomial map; `MvPolynomial.IsHomogeneous` with `.aeval` (substitution multiplies degrees),
  `.map`, `.funext` (forms over an infinite domain are determined by their values).
- **Projective line and `PGL₂`.** `Projectivization` (`ℙ K V`, `mk`, `lift`, `mk_eq_mk_iff`),
  `Matrix.ProjGenLinGroup` (`PGL(n, R)`) with its action on `ℙ K (n → K)`
  (`Projectivization.PGL.mk_smul_mk`), and conjugacy in a monoid: `IsConj`, `ConjClasses`,
  `ConjAct.units_smul_def`.
- **Local rings.** `ValuationRing`, `IsLocalRing.ResidueField`, `IsLocalRing.residue`,
  `IsLocalRing.residue_ne_zero_iff_isUnit`.
- **Near misses, not used as baseline:** `WeierstrassCurve.HasGoodReduction` is good reduction of a
  Weierstrass curve at a prime, not of a self-map of `ℙ¹`; Mathlib's `Proj` of a graded ring does not
  provide the projective line with morphisms given by forms (requested from
  `SchemeAndStackFoundations:SF.0`). Preperiodic points and forward orbits are defined in neither
  library.

### Standing conventions

- `ℙ¹(K)` is Mathlib's `ℙ K (Fin 2 → K)`; `[x : 1] = mk ![x, 1]` and `∞ = [1 : 0]`. A binary form is
  an element of `MvPolynomial (Fin 2) K`; `X₀` is the first coordinate, and dehomogenisation sets
  `X₁ = 1` (Mathlib's `homogenize` convention), so the affine coordinate is `z = x₀/x₁`.
- **Resultant orientation.** `Res_{m,n}(F, G) := Polynomial.resultant F(X,1) G(X,1) m n`. With
  `m = n = d` this is the Sylvester determinant of Silverman (AWS notes, Example 23 — reproduced
  exactly), Rumely ((1)) and Milnor (Appendix A): `Res_{d,d}(X₀^d, X₁^d) = 1`,
  `Res_{d,d}(X₁^d, X₀^d) = (−1)^d`, `Res_{1,1}(aX₀ + bX₁, cX₀ + eX₁) = ae − bc`.
- **Rational maps** carry their degree: a map of degree `d` is a pair of degree-`d` forms with
  nonzero resultant up to scaling; degree `0` maps are the constants. Composition is substitution
  of forms, and `RationalMap K` is a monoid whose units are `PGL₂(K)`.
- **Conjugation** is the left action `γ • f = γ ∘ f ∘ γ⁻¹` (Milnor, Levy), realised by Mathlib's
  `ConjAct` of the unit group; Silverman's and Rumely's `f^γ = γ⁻¹ ∘ f ∘ γ` is `γ⁻¹ • f`. On lifts,
  `γ • mk F = mk (γ ∘ F ∘ adj γ)`; Rumely's `F^γ = adj(γ) ∘ F ∘ γ`.
- **Good reduction** is over a valuation ring `R` with fraction field `K` and residue field `k`
  (e.g. `ℤ_(p)`, `ℤ_p`, the ring of integers of a complete nonarchimedean field).
- **Moduli** are sets of conjugacy classes over a field `K`; for algebraically closed `K` they are
  the `K`-points of the geometric quotients, for other `K` they separate twists.

### Objects

**Forward orbit** (`forwardOrbit`, node `DY.0/forward-orbit`). For `f : α → α`,
`O_f(x) = {f^[n] x : n ∈ ℕ}`, the range of the orbit map `n ↦ f^[n] x`.
API: `mem_forwardOrbit_iff`, `self_mem_forwardOrbit`, `mapsTo_forwardOrbit`,
`forwardOrbit_eq_insert` (`O_f(x) = {x} ∪ O_f(f x)`), `image_forwardOrbit` (a semiconjugacy maps
orbits onto orbits), `forwardOrbit_subset_of_mem`.
Unit tests: `forwardOrbit_succ_zero` (the orbit of `0` under `n ↦ n + 1` is `ℕ`),
`forwardOrbit_id` (`{x}`), `forwardOrbit_sq_sub_one` (`{1, 0, −1}` under `z² − 1` on `ℤ`),
`one_not_mem_forwardOrbit_succ_two` (non-example: not the orbit of the group generated by `f`).

**Preperiodic points** (`IsPreperiodicPt`, `preperiodicPts`, node `DY.0/preperiodic-point`).
`x` is preperiodic if some `f^[m] x` lies in Mathlib's `periodicPts f`, i.e.
`f^[m + n] x = f^[m] x` for some `m` and some `n ≥ 1`.
API: `isPreperiodicPt_iff_exists_iterate_eq`, `isPreperiodicPt_of_isPeriodicPt`,
`periodicPts_subset_preperiodicPts`, `isPreperiodicPt_apply_iff`, `IsPreperiodicPt.iterate`,
`isPreperiodicPt_of_finite` (every point of a finite type), `isPreperiodicPt_iterate_iff`.
Unit tests: `isPreperiodicPt_one_sq_sub_one` (preperiodic, not periodic),
`not_isPreperiodicPt_two_sq_sub_one` (wandering), `isPreperiodicPt_pow_iff_isOfFinOrder`
(compatibility: for `g ↦ g^d`, `d ≥ 2`, on a group, preperiodic ⟺ Mathlib's `IsOfFinOrder`;
Silverman's Exercise A), `isPreperiodicPt_id`.

**Resultant of a pair of binary forms** (`binaryResultant m n F G`, node
`DY.0/resultant-of-a-rational-map`). Mathlib's resultant of the dehomogenisations with formal
degrees `m, n`; for a homogeneous lift of a degree-`d` map, `Res_d = Res_{d,d}`, well defined up to
`(K^×)^{2d}` since `Res(cF₀, cF₁) = c^{2d} Res(F₀, F₁)`.
API: `binaryResultant_homogenize` (equals Mathlib's `resultant f g m n` on homogenisations),
`binaryResultant_smul_left` (`c^n`), `binaryResultant_smul_right` (`c^m`),
`binaryResultant_smul_smul` (`c^{2d}`), `binaryResultant_comm` (`(−1)^{mn}`), `binaryResultant_map`
(ring homomorphisms), `binaryResultant_zero_left` (`n ≠ 0`), `binaryResultant_X_pow_X_pow`,
`binaryResultant_toTupleMvPolynomial` (the pair of a polynomial `p` of degree `n` has resultant
`lead(p)^n`).
Unit tests: `binaryResultant_linear` (`ae − bc`), `binaryResultant_X_sq_add_two_Y_sq`
(`Res(X₀² + 2X₁², X₀X₁) = 2`), `binaryResultant_Y_pow_X_pow` (`(−1)^d`, the orientation),
`binaryResultant_X_X` (non-example: proportional forms give `0`), `binaryResultant_zero_degree`
(degenerate: `Res_{0,0}(0, 0) = 1`), `binaryResultant_quadratic_silverman` (Silverman's quadratic
formula).

**Homogeneous lifts** (`HomogeneousLift K d`, node `DY.0/homogeneous-lift`). Pairs
`(F₀, F₁)` of degree-`d` forms, not both zero, with `Res_{d,d}(F₀, F₁) ≠ 0`; for `d ≥ 1` this says
`F₀, F₁` have no common zero in `ℙ¹(K̄)`.
API: `eval` (`F(x) = (F₀(x), F₁(x))`), `eval_ne_zero` (`x ≠ 0 → F(x) ≠ 0`, from the resultant
certificate), `eval_smul` (`F(cx) = c^d F(x)`), constructors `smul`, `id`, `ofPolynomial` (Mathlib's
`toTupleMvPolynomial`, with `ofPolynomial_forms`), `ofGL` (degree one, resultant `det γ`), `map`
(base change, `map_forms`).
Unit tests: `HomogeneousLift.X_sq_Y_sq`, `HomogeneousLift.not_X_sq_XY` (non-example: common zero
`[0 : 1]`), `HomogeneousLift.zero_degree` (a nonzero constant pair), `HomogeneousLift.eval_X_sq_add_two`
(`(1, 1) ↦ (3, 1)`).

**Composition of lifts** (`HomogeneousLift.comp`, node `DY.0/homogeneous-lift-comp`).
`(F ∘ G)_i = F_i(G₀, G₁)`, a lift of degree `d·e` (a common zero of `F ∘ G` would give a common
zero of `F` at `G(x) ≠ 0`).
API: `comp_forms`, `eval_comp` (`(F ∘ G)(x) = F(G(x))`), `comp_assoc`, `id_comp`, `comp_id`,
`smul_comp`.
Unit tests: `HomogeneousLift.comp_X_sq` (`(X₀⁴, X₁⁴)`), `HomogeneousLift.comp_degree` (degree `6`
from `2` and `3`), `HomogeneousLift.comp_not_comm` (`(z + 1)² ≠ z² + 1`).

**Rational maps of `ℙ¹`** (`RationalMap K`, node `DY.0/rational-map-of-the-projective-line`).
Lifts up to scaling, with their degree; a monoid under composition, so `f^n` is the `n`-th iterate
as a map.
API: `RationalMap.mk`, `degree`, `degree_mk`, `mk_eq_mk_iff` (same degree, proportional forms),
`exists_mk_eq`, `instMonoid`, `mk_comp`, `one_eq_mk_id`, `degree_mul` (multiplicative),
`degree_one`, `degree_pow`, `ofPolynomial` (`z ↦ p(z)`, with `degree_ofPolynomial = natDegree p`
and `ofPolynomial_comp`: composition of polynomials is multiplication), `toRatFunc` (the rational
function `F₀(X,1)/F₁(X,1)` in Mathlib's `RatFunc K`), `toRatFunc_injOn` (injective on maps of
degree `≥ 1`; the constant `∞` goes to Mathlib's junk `0`), `toRatFunc_ofPolynomial`.
Unit tests: `RationalMap.degree_ofPolynomial_sq`, `RationalMap.pow_ofPolynomial_sq` (`(z²)^n =
z^{2^n}` as maps), `RationalMap.degree_zero_constants` (degree `0` maps ≃ `ℙ¹(K)`),
`RationalMap.toRatFunc_X_sq_add_two` (compatibility with `RatFunc`: `(X² + 2)/X`).

**Action on points** (`RationalMap.toEnd`, node `DY.0/rational-map-action-on-points`). The monoid
homomorphism `RationalMap K →* Function.End ℙ¹(K)`, `[x] ↦ [F(x)]`.
API: `toEnd_mk_apply`, `toEnd_mul`, `toEnd_pow` (`= (toEnd f)^[n]`), `toEnd_injective` (for
infinite `K`), `toEnd_ofPolynomial_mk_one` (`[x : 1] ↦ [p(x) : 1]`).
Unit tests: `RationalMap.toEnd_sq_two` (`[2 : 1] ↦ [4 : 1]`), `RationalMap.toEnd_sq_infty` (`∞` is
fixed by polynomials), `RationalMap.toEnd_frobenius` (non-example: over `𝔽_p`, `z^p` and `z` have
the same action but are different maps).

**Units = `PGL₂`** (`RationalMap.unitsEquivPGL`, node `DY.0/units-of-rational-maps`).
`(RationalMap K)ˣ ≃* PGL(2, K)`; units are exactly the degree-one maps, and their action on points
is Mathlib's.
API: `isUnit_iff_degree_eq_one`, `toEnd_units_apply`, `unitsEquivPGL_symm_mk`.
Unit tests: `RationalMap.unitsEquivPGL_inv_z` (`z ↦ 1/z`, order two),
`RationalMap.not_isUnit_sq`, `RationalMap.translation_infinite_order`.

**Base change** (`RationalMap.map`, `RationalMap.projMap`, node `DY.0/rational-map-base-change`).
Along a field homomorphism `σ : K → L`, on maps (a monoid homomorphism) and on points.
API: `map_mk`, `degree_map`, `toEnd_map_projMap` (compatible with the actions), `map_injective`,
`projMap_mk`, `projMap_injective`, `exists_map_eq_of_isAlgebraic` (over a field algebraic over `ℚ`
every map is defined over a number field).
Unit tests: `RationalMap.map_ofPolynomial`, `RationalMap.toEnd_map_sq_I` (`i ↦ −1` over `ℚ̄`),
`RationalMap.map_id_eq`.

**Conjugation** (`RationalMap.instMulActionPGL`, node `DY.0/conjugacy-of-rational-maps`).
`PGL(2, K)` acts by `γ • f = γ ∘ f ∘ γ⁻¹`; conjugacy is Mathlib's `IsConj` in the monoid.
API: `smul_def`, `isConj_iff_exists_smul`, `degree_smul`, `toEnd_smul_apply`
(`toEnd (γ • f) (γ P) = γ (toEnd f P)`), `smul_mk` (lift `γ ∘ F ∘ adj γ`), `isPreperiodicPt_smul_iff`.
Unit tests: `RationalMap.smul_sq_translation` (`z² ↦ z² − 2z + 2` under `z ↦ z + 1`),
`RationalMap.smul_sq_inv` (`z ↦ 1/z` commutes with `z²`), `RationalMap.not_isConj_sq_sq_add_one`
(three versus one `ℚ`-rational fixed points).

**The moduli space `M_d(K)`** (`ModuliSpace K d`, node `DY.0/moduli-space-of-rational-maps`).
Conjugacy classes (`ConjClasses (RationalMap K)`) of degree-`d` maps.
API: `RationalMap.conjDegree`, `ModuliSpace.mk`, `mk_eq_mk_iff` (`↔ IsConj`), `mk_surjective`,
`ModuliSpace.map` (base change), `map_mk`.
Unit tests: `ModuliSpace.subsingleton_zero` (`M₀` is a point), `ModuliSpace.twist` (`1/z²` and
`2/z²` differ in `M₂(ℚ)` and agree in `M₂(ℚ̄)`: a conjugacy must fix the critical points `{0, ∞}`
and forces `c³ = 2`), `ModuliSpace.sq_ne_sq_add_one`.

**Zeros of a binary form** (`binaryRoots n G`, node `DY.0/roots-of-a-binary-form`). The roots of
`G(X, 1)` as points `[r : 1]`, and `∞` with multiplicity `n − deg G(X, 1)`; `0` for `G = 0`.
API: `mem_binaryRoots_iff`, `card_binaryRoots` (`n` over an algebraically closed field),
`binaryRoots_mul`, `binaryRoots_smul`.
Unit tests: `binaryRoots_X_mul_Y_sq` (`{[0 : 1], ∞, ∞}`), `binaryRoots_Y_pow` (`n` copies of `∞`),
`binaryRoots_irreducible` (`X₀² + X₁²` has no roots in `ℙ¹(ℚ)`).

**Fixed points** (`RationalMap.fixedPoints`, node `DY.0/fixed-points-of-a-rational-map`). The roots of
the fixed-point form `X₁F₀ − X₀F₁` of degree `d + 1` (nonzero for `d ≥ 2`).
API: `mem_fixedPoints_iff` (`d ≥ 2`), `card_fixedPoints` (`d + 1`, algebraically closed),
`fixedPoints_smul`.
Unit tests: `RationalMap.fixedPoints_sq` (`0, 1, ∞`), `RationalMap.fixedPoints_translation`
(`∞` twice), `RationalMap.fixedPoints_sq_add_one` (only `∞` over `ℚ`).

**Multipliers** (`RationalMap.multiplier`, node `DY.0/fixed-point-multiplier`). At a finite fixed
point `[z : 1]` the derivative of `F₀(X,1)/F₁(X,1)` at `z`; at `∞` the multiplier at `0` of the
conjugate by `z ↦ 1/z`. Coordinate-free and valid in every characteristic: if `F(x) = c x` with
`c ≠ 0`, then `μ_{[x]} = (∂₀F₀(x) + ∂₁F₁(x))/c − d`.
API: `multiplier_ofPolynomial` (`p'(z)`), `multiplier_ofPolynomial_infty` (`0` for `deg p ≥ 2`),
`multiplier_eq_trace`, `multiplier_eq_one_iff` (`μ_P = 1` ⟺ multiple fixed point).
Unit tests: `RationalMap.multiplier_sq_one` (`2`), `RationalMap.multiplier_sq_infty` (non-example:
`0`, not `2z`), `RationalMap.multiplier_translation_infty` (`1`), `RationalMap.multiplier_frobenius`
(`0` in characteristic `p`).

**Symmetric functions of the multipliers** (`RationalMap.sigma`, `ModuliSpace.sigma`, node
`DY.0/multiplier-symmetric-functions`). `σᵢ(f) = esymm i` of the multiset of fixed-point
multipliers; conjugation invariant, so defined on `M_d(K)`.
API: `sigma_smul`, `sigma_eq_zero_of_lt`, `ModuliSpace.sigma_mk`.
Unit tests: `RationalMap.sigma_sq` (`σ₁ = 2`, `σ₂ = 0`), `RationalMap.sigma_sq_add_const`
(`(2, 4c, 0)`), `RationalMap.sigma_not_closed` (non-example over `ℚ`).

**Critical points** (`RationalMap.criticalPoints`, node `DY.0/critical-points-of-a-rational-map`).
The roots of the Jacobian form `∂₀F₀ ∂₁F₁ − ∂₁F₀ ∂₀F₁` of degree `2d − 2`; by Euler's identity
`Jac(F)(z, 1) = d·(f₀'f₁ − f₀f₁')(z)`, so in characteristic `0` a finite point with finite image is
critical exactly when `f'(z) = 0`.
API: `card_criticalPoints` (`2d − 2`, characteristic `0`, algebraically closed — Riemann–Hurwitz),
`criticalPoints_smul`, `count_criticalPoints_le` (multiplicity `≤ d − 1`),
`mk_one_mem_criticalPoints_iff` (characteristic `0`), `mem_criticalPoints_mul_iff` (chain rule).
Unit tests: `RationalMap.criticalPoints_pow` (`z³`: `0, 0, ∞, ∞`),
`RationalMap.criticalPoints_frobenius` (degenerate: the Jacobian of `z^p` vanishes in
characteristic `p`), `RationalMap.criticalPoints_milnor` (Milnor's `μ₂ω² + 2ω + μ₁ = 0`).

**Critically marked maps and `M_d^cm(K)`** (`CriticallyMarkedMap`, `CriticallyMarkedModuliSpace`,
node `DY.0/critically-marked-moduli-space`). Pairs `(f, c)` with `c : Fin (2d − 2) → ℙ¹(K)`
listing the critical points with multiplicity, modulo `PGL₂(K)` acting on both.
API: `CriticallyMarkedMap.instMulActionPGL`, `CriticallyMarkedModuliSpace.forget` (to `M_d`),
`forget_surjective` (characteristic `0`, algebraically closed), `instMulActionPerm` (relabelling by
`Sym(2d − 2)`), `forget_smul`, `forget_eq_forget_iff` (fibres are relabelling orbits).
Unit tests: `CriticallyMarkedModuliSpace.forget_fiber_two` (the class of `z²` has one preimage),
`CriticallyMarkedModuliSpace.degree_one` (`M₁^cm = M₁`), `CriticallyMarkedModuliSpace.fiber_generic`
(`forget` is not injective).

**Good reduction** (`RationalMap.HasGoodReduction R`, `RationalMap.reduction`, node
`DY.0/good-reduction-of-a-rational-map`). `f` has a lift with coefficients in the valuation ring
`R` and unit resultant; its reduction over `k` has the same degree.
API: `degree_reduction`, `hasGoodReduction_one`, `hasGoodReduction_ofPolynomial_iff` (unit leading
coefficient), `hasGoodReduction_map_units` (maps from `GL₂(R)`).
Unit tests: `RationalMap.not_hasGoodReduction_two` (`(z² + 2)/z` over `ℤ_[2]`, resultant `2`),
`RationalMap.hasGoodReduction_three` (the same map over `ℤ_[3]`),
`RationalMap.hasGoodReduction_sq_add` (`z² + c`, `c ∈ ℤ`, at every prime),
`RationalMap.conj_changes_reduction` (`z²/2` is conjugate to `z²` but has bad reduction at `2`).

**Reduction of points** (`projReduction R`, node `DY.0/reduction-of-points`). Scale a
representative into `R²` with a unit coordinate and reduce.
API: `projReduction_mk`, `projReduction_surjective`.
Unit tests: `projReduction_half` (`[1/2 : 1] ↦ ∞` over `ℤ_[2]`), `projReduction_three`
(`[3 : 1] ↦ [1 : 1]`), `projReduction_infty`.

### Theorems

- **Orbits.** `isPreperiodicPt_iff_finite_forwardOrbit` (`DY.0/preperiodic-iff-finite-forward-orbit`,
  Call–Silverman p. 168): preperiodic ⟺ finite forward orbit. `IsPreperiodicPt.map` and
  `isPreperiodicPt_map_iff_of_bijective` (`DY.0/preperiodic-of-semiconj`, Silverman's Exercise D):
  semiconjugacies carry preperiodic points, bijective ones in both directions.
- **Iterates of morphisms.** `iterate_comp_end_eq_comp_pow`
  (`DY.0/iterate-of-endomorphism-on-points`): for `φ ∈ End X` in any category,
  `(Q ↦ Q ≫ φ)^[n] P = P ≫ φ^n`; periodic `T`-points are those with `P ≫ φ^n = P`.
- **Resultant calculus.** `binaryResultant_mul_left/right` (`DY.0/binary-resultant-mul`,
  bimultiplicativity with formal degrees, Milnor Appendix A);
  `exists_prod_linear_of_isHomogeneous` (`DY.0/binary-form-factorisation`: over an algebraically
  closed field a form of degree `n` is a product of `n` linear forms);
  `binaryResultant_eq_zero_iff` (`DY.0/binary-resultant-eq-zero-iff`: for `d ≥ 1`,
  `Res_{d,d}(F₀, F₁) = 0` ⟺ a common zero in `ℙ¹(K̄)`; the criterion is over `K̄`, not `K`);
  `binaryResultant_linearCombination` (`DY.0/resultant-postcomp-linear`: `det(A)^d`);
  `binaryResultant_linearSubst` (`DY.0/resultant-precomp-linear`: `det(A)^{d²}`, by the universal
  identity, factorisation and bimultiplicativity); `binaryResultant_conj` (`DY.0/resultant-conj`:
  Rumely's `Res(adj(A) ∘ F ∘ A) = det(A)^{d² + d} Res(F)`); `exists_resultant_certificate`
  (`DY.0/resultant-certificate`: forms `G_{k,j}` of degree `d − 1` with
  `Σ_j G_{k,j} F_j = Res · X_k^{2d−1}`, from Mathlib's `exists_mul_add_mul_eq_C_resultant` and
  homogenisation — the certificate consumed by Mathlib's lower height bound in DY.1).
- **Scheme morphisms.** (`DY.0/rational-map-to-scheme-endomorphism`, comparison) `RationalMap K`
  embeds as a monoid into the `K`-endomorphisms of `ℙ¹_K`, compatibly with `K`-points; the scheme
  `ℙ¹_K` and the morphism `[F₀ : F₁]` are requested from `SchemeAndStackFoundations:SF.0`.
- **Multipliers.** `multiplier_smul` (`DY.0/fixed-point-multiplier-conj`): conjugation invariance.
- **Milnor's quadratic moduli.** `sigma_three_eq_sigma_one_sub_two`
  (`DY.0/quadratic-fixed-point-relation`, Milnor (1)): `σ₃ = σ₁ − 2`, proved from the normal form
  computation of Appendix C (22) rather than the complex-analytic index formula;
  `exists_quadratic_normal_form` (`DY.0/quadratic-fixed-point-normal-form`, Milnor (3)–(4)):
  `z(z + μ₁)/(μ₂z + 1)` with `μ₁μ₂ ≠ 1`, or `z + 1/z`; **Theorem** `ModuliSpace.bijective_sigma_two`
  (`DY.0/moduli-space-of-quadratic-maps`, Milnor Lemma 3.1): over an algebraically closed field of
  characteristic `0`, `M₂(K) → K²`, `⟨f⟩ ↦ (σ₁, σ₂)` is a bijection (`z² ↦ (2, 0)`,
  `z² + c ↦ (2, 4c)`, `z + 1/z ↦ (3, 3)`); **Theorem**
  `CriticallyMarkedModuliSpace.exists_equiv_milnorSurface_two`
  (`DY.0/critically-marked-quadratic-moduli`, Milnor Lemma 6.1): `M₂^cm(K)` is the surface
  `A³(A − 1) = BC`, relabelling exchanging `B` and `C`.
- **Good reduction.** `hasGoodReduction_iff_isUnit_binaryResultant` and
  `hasGoodReduction_iff_residue_binaryResultant_ne_zero`
  (`DY.0/good-reduction-iff-normalized-resultant-unit`: on a normalised integral lift, good
  reduction ⟺ `Res ∈ R^×` ⟺ the reduction keeps degree `d`; Rumely: good reduction ⟺
  `ordRes = 0`); `HasGoodReduction.mul`, `reduction_mul`, `HasGoodReduction.pow`
  (`DY.0/reduction-commutes-with-composition`, Silverman Proposition 24(a));
  `RationalMap.projReduction_toEnd` (`DY.0/reduction-commutes-with-evaluation`, Proposition 24(b));
  `RationalMap.hasGoodReduction_smul_iff` (`DY.0/good-reduction-conj-integral`: conjugation by
  `GL₂(R)` preserves good reduction, from `det(γ)^{d² + d}` with `det γ ∈ R^×`).

### Dependencies

- Inside the roadmap: DY.0 is the base; DY.1 consumes rational maps, their action, base change and
  conjugation; DY.2 consumes multipliers, lifts, good reduction and reduction of points; DY.3 consumes
  fixed points and binary roots (applied to `f^n`); DY.5 consumes preimages via the action; DY.6 and
  the Part II on bifurcation consume critical points, `M_d` and `M_d^cm`.
- `SchemeAndStackFoundations:SF.0` (request): `ℙ¹_K` and morphisms given by forms, for
  `DY.0/rational-map-to-scheme-endomorphism`.
- `tauceti:TauCetiRoadmap/StableReduction` layer 2 is an inherited supplier (through SF.0); no DY.0
  declaration uses it.
- Geometric invariant theory: no owner in the atlas (gap below; restructure proposal to
  `AlgebraicModuliForArithmeticGeometry`).

### Acceptance

- **A map whose displayed resultant vanishes at a bad prime.** `(z² + 2)/z` has normalised lift
  `(X₀² + 2X₁², X₀X₁)` with `Res = 2` (`binaryResultant_X_sq_add_two_Y_sq`): bad reduction over
  `ℤ_[2]` (the reduced forms `(X₀², X₀X₁)` share `[0 : 1]`, the degree drops to `1`), good over
  `ℤ_[3]`; at `2` reduction does not commute with evaluation at `[0 : 1]` (Silverman's Exercise N).
- **Conjugate maps compared.** `z²` and `z² − 2z + 2` are conjugate by `z ↦ z + 1`, with equal
  multipliers `(0, 2, 0)` and equal `(σ₁, σ₂) = (2, 0)`; `z²` and `z² + 1` are not conjugate
  (`σ₂ = 0` versus `4` over `ℚ̄`; three versus one rational fixed point over `ℚ`); `z²/2` is conjugate
  to `z²` over `ℚ` but has bad reduction at `2`, while conjugation by `GL₂(ℤ_(2))` preserves good
  reduction; `1/z²` and `2/z²` are twists.
- **Iterate equality is equality of morphisms.** `(z²)^n = z^{2^n}` in the monoid `RationalMap ℚ`;
  over `𝔽_p`, `z^p ≠ z` as rational maps although both fix every point of `ℙ¹(𝔽_p)`; for scheme
  endomorphisms, iterates are powers in `End X`.

### Gaps and requests

- **Gap (geometric invariant theory).** The scheme-level statements — `Rat_d` as the affine scheme
  `ℙ^{2d+1} ∖ V(Res)` with its `SL₂`-action, `M_d = Rat_d/SL₂` as a geometric quotient over `Spec ℤ`
  (affine, of dimension `2d − 2`, with a GIT compactification over `ℚ`), the stability of every
  morphism (Levy, Theorem 2.2), `M₂ ≅ 𝔸²_ℤ` as schemes, the singularity of `M_d` for `d > 2`, and
  DeMarco–Mavraki–Ye's finite branched cover `M_d^cm → M_d` with a universal family — need
  Mumford's geometric invariant theory, which no roadmap plans.
- **Request** to `SchemeAndStackFoundations:SF.0`: the projective line `ℙ¹_K` and the morphisms
  `[F₀ : F₁]` given by forms without common zero, compatible with substitution and with `K`-points.

### Source notes

Milnor's arXiv text has three misprints (sourceIssues `ArithmeticDynamics/E101`–`E103`): in
Appendix C (22) the fixed points `0` and `∞` are said to have "multiplicity" `µ₁`, `µ₂` (read
"multiplier"); the proof of Lemma C.1 refers to "normal form (4)" where it uses (3); Appendix B
(18) prints the last coefficient of `q` as `b₀` (read `b_d`). Silverman's AWS notes (§3, p. 7) write
`(z − a)` for `(z − α)` in the Taylor expansion at a fixed point (`E104`). None affects a stated
result.

---

## DY.1 Canonical heights of polarized morphisms

This layer constructs canonical heights. Its engine is Tate's telescoping lemma, stated once for an
arbitrary self-map `φ` of a set `S`, a function `h : S → ℝ` and a real `α > 1` with `h ∘ φ − αh`
bounded: the limit `ĥ = lim α^{−n} h ∘ φⁿ` exists, differs from `h` by at most `C/(α − 1)`,
satisfies `ĥ ∘ φ = αĥ`, is the unique such function, vanishes at preperiodic points, and — given
Northcott on a forward-invariant set — vanishes only there. The layer applies it three times:
(1) to rational maps of `ℙ¹`, over any field with admissible absolute values (relative heights,
Call–Silverman's global height fields) and over fields algebraic over `ℚ` with Mathlib's absolute
height, closing the `ClassicalArithmeticCompletion:CA.6` request and the power-map acceptance test
using only Mathlib, Tau Ceti and `DiophantineApproximationAndTranscendence:DT.0`; (2) to a
polarized morphism `φ : V → V`, `φ*L ≅ L^{⊗d}`, `L` ample, of a projective variety over a number
field (Call–Silverman, Theorem 1.1 and Corollary 1.1.1), with the Weil height machine requested from
`HeightsRationalPointsAndObstructions:RP.0`, and separately without ampleness, where the zero-height
criterion fails; (3) to multiplication on elliptic curves, compared exactly with Tau Ceti's
`canonicalHeight`, and on abelian varieties, compared with the requested Néron–Tate height.

Sources: Call–Silverman, *Canonical heights on varieties with morphisms*, Compositio Math. 89 (1993)
163–205 (Numdam scan), §1 in full (Theorem 1.1, Examples 1–3, Corollary 1.1.1, Proposition 1.2);
Silverman, *The Arithmetic of Dynamical Systems*, §§3.3–3.5 in the author's public sample (Theorem
3.20, the definition of `ĥ_φ`, Theorem 3.22); Silverman, *Lecture Notes on Arithmetic Dynamics*
(AWS 2010), §4.1 (Theorem 12, Weil's height machine) and §5 (Theorems 15 and 17). Call–Silverman §2
(canonical local heights and their Lemma 2.2), §§3–4 (families and specialisation) and §§5–6 belong
to DY.2 and DY.6.

### What the libraries already provide (consume; never restate)

- **Heights (Mathlib).** `Height.AdmissibleAbsValues` (a field with archimedean absolute values
  counted with multiplicity, nonarchimedean ones and the product formula);
  `NumberField.instAdmissibleAbsValues`; relative heights `Height.logHeight₁`, `Height.logHeight`
  of tuples, `Projectivization.logHeight` of points of `ℙᴺ(K)` (with `logHeight_mk`,
  `logHeight_nonneg`, `Height.logHeight_smul_eq_logHeight`, `Height.logHeight₁_eq_logHeight`,
  `logHeight₁_inv`, `mulHeight₁_pow`); the absolute height of an element
  `NumberField.absLogHeight₁` (defined through `ℚ(x)`, junk `0` at transcendental elements);
  `Height.totalWeight` with `NumberField.totalWeight_eq_finrank`.
- **The height-machine input on `ℙⁿ` (Mathlib).** `Height.logHeight_eval_le`: for forms `p` of
  degree `N`, `logHeight p(x) ≤ log max(mulHeightBound p, 1) + N logHeight x`;
  `Height.logHeight_eval_ge`: given forms `q` of degree `M` with `Σ_j q_{k,j}(x) p_j(x) = x_k^{M+N}`,
  `−log(card^{totalWeight}·max(mulHeightBound q, 1)) + N logHeight x ≤ logHeight p(x)`. Nothing in
  either library applies them to iterates or builds the limit.
- **Northcott (Mathlib).** `NumberField.finite_setOfPred_logHeight₁_le` in a fixed number field; the
  projective version is a TODO in `Mathlib/NumberTheory/Height/Northcott.lean` and is built here for
  `ℙ¹`.
- **Elliptic canonical height (Tau Ceti, EllipticCurves layer 6).** For `W` elliptic over a field with
  `AdmissibleAbsValues`: `Point.naiveHeight = logHeight (x-coordinate)`,
  `Point.canonicalHeight = ½ lim h(2ⁿP)/4ⁿ` with `Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow`
  (the limit is attained), `Point.abs_canonicalHeight_sub_naiveHeight_le` (`|ĥ − h/2| ≤ D`),
  `Point.canonicalHeight_two_nsmul`, `Point.canonicalHeight_nsmul` (`ĥ(nP) = n²ĥ(P)`),
  `approx_parallelogram_law`, `finite_naiveHeight_le`, and
  `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` under Northcott. This is the built half of
  the layer's acceptance example "multiplication on an abelian variety".
- **Absolute heights of algebraic numbers (DT.0 nodes, consumed).**
  `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow` (`absMulHeight₁` in any
  number field containing `x`), `…/abs-mul-height-eq-of-minpoly-eq` (invariance under embeddings),
  `…/mul-height-algebra-map` (heights under finite extension), `…/infinite-places-over`,
  `…/northcott-absolute-height` (Northcott of bounded degree over `ℚ̄`).

### Standing conventions

- `tateLimit φ h α P := limUnder atTop (n ↦ h(φⁿP)/αⁿ)`; every theorem assumes `α > 1` and a bound
  `|h(φQ) − αh(Q)| ≤ C`, so the junk value of `limUnder` is never used.
- **Absolute Weil height on `ℙ¹`** (the `CA.6` normalisation): for `F` of characteristic `0`,
  `h([x : 1]) = NumberField.absLogHeight₁ x`, `h([1 : 0]) = 0`. On a number field `K`,
  `h = Projectivization.logHeight / [K : ℚ]`.
- **Relative canonical height** over a field with admissible absolute values uses Mathlib's relative
  `Projectivization.logHeight` (Call–Silverman's global height field); on a number field the absolute
  canonical height is the relative one divided by `[K : ℚ]`.
- **Degrees.** The canonical heights of rational maps need `deg f ≥ 2`; for `deg f = 1` the Tate
  sequence need not converge (translation: `log n`).
- **Elliptic normalisation.** Call–Silverman's `ĥ_{E,[m],η}` for the class `η` of `2(O)`, with
  `h_{2(O)}` the naive height of the `x`-coordinate, is twice Tau Ceti's `canonicalHeight`, which is
  the Néron–Tate height for `(O)`.
- **General varieties.** `V` smooth projective over a number field `K`, `L ∈ Pic(V)` (or
  `η ∈ Pic(V) ⊗ ℝ`), `h_L` a Weil height from the requested height machine; nothing about
  `h_L` beyond functoriality, additivity, normalisation and Northcott is used.

### Objects

**Tate's limit** (`tateLimit`, node `DY.1/tate-limit`). `tateLimit φ h α : S → ℝ`.
API: `tateLimit_def`, `tateLimit_congr_of_bounded` (independent of `h` up to bounded functions),
`tateLimit_const_mul` (linear in `h`), `tateLimit_iterate` (`(φ^k, α^k)` gives the same limit),
`tateLimit_nonneg`.
Unit tests: `tateLimit_id` (degenerate: `0` for `φ = id`, `α = 2`), `tateLimit_double`
(`x ↦ 2x`, `h = id`: the limit is `x`), `not_tendsto_tateSeq_one` (non-example: `α = 1` diverges).

**Absolute Weil height on `ℙ¹`** (`projLineAbsLogHeight`, node
`DY.1/weil-height-on-the-projective-line`).
API: `projLineAbsLogHeight_mk_one`, `projLineAbsLogHeight_infty`, `projLineAbsLogHeight_nonneg`,
`projLineAbsLogHeight_mk_inv` (`h([1 : x]) = h([x : 1])`), `projLineAbsLogHeight_projMap`
(invariance under field embeddings).
Unit tests: `projLineAbsLogHeight_two` (`log 2`), `projLineAbsLogHeight_half` (`log 2`),
`projLineAbsLogHeight_zero`, `projLineAbsLogHeight_rat_compat` (on `ℚ` it is Mathlib's
`Projectivization.logHeight`), `projLineAbsLogHeight_transcendental` (non-example: junk `0` at a
transcendental point, which is why the canonical height is stated over fields algebraic over `ℚ`).

**Relative canonical height** (`RationalMap.relCanonicalHeight`, node
`DY.1/canonical-height-over-a-global-height-field`).
`ĥ_{f,K} = tateLimit (toEnd f) Projectivization.logHeight (deg f)` on `ℙ¹(K)`, `K` with admissible
absolute values.
API: `tendsto_relCanonicalHeight`, `exists_abs_relCanonicalHeight_sub_le`,
`relCanonicalHeight_toEnd` (`ĥ(f P) = d ĥ(P)`), `eq_relCanonicalHeight_of_bounded` (uniqueness),
`relCanonicalHeight_nonneg`, `relCanonicalHeight_pow`, `relCanonicalHeight_smul` (conjugation),
`relCanonicalHeight_eq_zero_of_isPreperiodicPt`, `relCanonicalHeight_map_algebraMap` (scales by
`[L : K]` for number fields).
Unit tests: `RationalMap.relCanonicalHeight_sq` (over `ℚ`, `ĥ_{z²}[x : 1] = logHeight₁ x`),
`RationalMap.relCanonicalHeight_translation` (non-example: degree one, unbounded `log n`),
`RationalMap.relCanonicalHeight_infty` (`0` at `∞` for polynomials of degree `≥ 2`).

**Canonical height on `ℙ¹`** (`RationalMap.canonicalHeight`, node
`DY.1/canonical-height-on-the-projective-line`). `ĥ_f = tateLimit (toEnd f) h (deg f)`
on `ℙ¹(F)` for the absolute height `h`. For `F` algebraic over `ℚ` (including `ℚ̄`) and `d ≥ 2`:
`ĥ_f(P) = lim d^{−n} h(fⁿ(P))` exists for every `P`, `ĥ_f − h` is bounded, `ĥ_f ∘ f = dĥ_f`, and
`ĥ_f` is the unique function with the last two properties — exactly the `CA.6` request.
API: `tendsto_canonicalHeight`, `exists_abs_canonicalHeight_sub_le`, `canonicalHeight_toEnd`,
`eq_canonicalHeight_of_bounded`, `canonicalHeight_nonneg`, `canonicalHeight_pow`,
`canonicalHeight_smul` (`ĥ_{γ•f}(γP) = ĥ_f(P)`), `canonicalHeight_map` (embeddings),
`canonicalHeight_eq_zero_of_isPreperiodicPt`.
Unit tests: `RationalMap.canonicalHeight_powMap` (acceptance: `ĥ_{z^d} = h` for `d ≥ 2`),
`RationalMap.canonicalHeight_sq_two` (`log 2`), `RationalMap.canonicalHeight_chebyshev`
(non-example: `ĥ_{z²−2}(−2) = 0` while `h(−2) = log 2`), `RationalMap.canonicalHeight_rat_compat`
(over `ℚ`, absolute = relative), `RationalMap.canonicalHeight_sq_I` (`ĥ_{z²}(i) = 0`).

### Lemmas and theorems

- **Tate's lemma**, each a declaration: `abs_tateSeq_sub_le` (`DY.1/tate-telescoping-estimate`,
  Call–Silverman (6): `|h(φⁿP)/αⁿ − h(φᵐP)/αᵐ| ≤ C/((α − 1)αᵐ)` for `m ≤ n`);
  `tendsto_tateLimit` (`DY.1/tate-limit-tendsto`, Proposition 1.2 (4));
  `abs_tateLimit_sub_le` (`DY.1/tate-limit-error-bound`, (5): `≤ C/(α − 1)`);
  `tateLimit_apply` (`DY.1/tate-limit-functional-equation`, Theorem 1.1 (ii));
  **Theorem** `eq_tateLimit_of_bounded` (`DY.1/tate-limit-unique`, Theorem 1.1 uniqueness, ADS
  Theorem 3.20); `tateLimit_comp_of_semiconj` (`DY.1/tate-limit-semiconj`: transport along a
  semiconjugacy `π ∘ φ = ψ ∘ π` with `k ∘ π − h` bounded — conjugation invariance, ADS Exercise 3.11);
  `tateLimit_eq_zero_of_isPreperiodicPt` (`DY.1/tate-limit-eq-zero-of-preperiodic`);
  `isPreperiodicPt_of_tateLimit_eq_zero` (`DY.1/preperiodic-of-tate-limit-eq-zero`: zero limit and
  Northcott on a forward-invariant set give preperiodicity; without Northcott it fails for `n ↦ n + 1`
  on `ℤ` with `h = 0`); `le_of_isPreperiodicPt` (`DY.1/height-bound-of-preperiodic`:
  `h(P) ≤ C/(α − 1)` at preperiodic points).
- **Heights on `ℙ¹`.** `projLineAbsLogHeight_eq_logHeight_div`
  (`DY.1/weil-height-eq-log-height-div-finrank`); `finite_setOf_logHeight_projLine_le`
  (`DY.1/northcott-on-the-projective-line`, AWS Theorem 12(b)); `mulHeightBound_map_algebraMap`
  (`DY.1/mul-height-bound-algebra-map`: Mathlib's constant satisfies
  `mulHeightBound_L = mulHeightBound_K^{[L : K]}`, so normalised constants are field-independent);
  `HomogeneousLift.logHeight_eval_bounds` (`DY.1/height-bounds-for-a-homogeneous-lift`: the two
  Mathlib bounds for the forms of a lift, the lower one through `q = G/Res` from
  `DY.0/resultant-certificate`); `RationalMap.exists_abs_logHeight_toEnd_sub_le`
  (`DY.1/relative-height-estimate-for-rational-map`, AWS Theorem 12(a) relative to `K`);
  `RationalMap.exists_abs_projLineAbsLogHeight_toEnd_sub_le`
  (`DY.1/absolute-height-estimate-for-rational-map`: `|h(f P) − d h(P)| ≤ C(f)` over any field
  algebraic over `ℚ`, the constant uniform over all number fields containing `P`).
- **Canonical heights on `ℙ¹`.** `canonicalHeight_eq_relCanonicalHeight_div`
  (`DY.1/canonical-height-eq-relative-div-finrank`, comparison); **Theorem**
  `canonicalHeight_eq_zero_iff` (`DY.1/zero-canonical-height-iff-preperiodic-on-the-projective-line`,
  ADS Theorem 3.22, AWS Theorem 17(c)); **Theorem**
  `exists_projLineAbsLogHeight_le_of_isPreperiodicPt`, `finite_preperiodicPts_of_numberField`,
  `finite_setOf_isPreperiodicPt_natDegree_minpoly_le`
  (`DY.1/northcott-for-preperiodic-points-on-the-projective-line`: bounded height, finiteness over a
  number field, finiteness in bounded degree — Northcott, AWS Theorem 15).
- **Polarized morphisms (general `V`).** **Theorem** `DY.1/canonical-height` (Call–Silverman,
  Theorem 1.1 with `η = [L]` ample, `α = d ≥ 2`, over a number field): `ĥ_{V,φ,L} = lim d^{−n} h_L ∘ φⁿ`
  exists, `|ĥ − h_L| ≤ c/(d − 1)`, `ĥ ∘ φ = dĥ`, unique, independent of the choice of `h_L`.
  **Theorem** `DY.1/zero-canonical-height-iff-preperiodic` (Corollary 1.1.1(a)): `P` preperiodic ⟺
  `ĥ_{V,φ,L}(P) = 0`. **Theorem** `DY.1/northcott-for-preperiodic-points` (Corollary 1.1.1(b)):
  preperiodic points have bounded height; finitely many over `K`, and in each bounded degree.
  **Theorem** `DY.1/canonical-height-for-a-divisorial-eigenclass` (Theorem 1.1 in full: any
  `η ∈ Pic(V) ⊗ ℝ` with `φ*η = αη`, real `α > 1`, no ampleness): existence and uniqueness hold and
  preperiodic points have height `0`, but the converse fails — on `ℙ¹ × ℙ¹` with `φ = (z², w + 1)` and
  `η = pr₁*O(1)`, `ĥ(0, 0) = ĥ_{z²}(0) = 0` while the orbit `(0, n)` is infinite. Comparison
  `DY.1/canonical-height-of-projective-space-morphism` (Example 3): for `(ℙ¹, f, O(1))` the general
  construction is `RationalMap.canonicalHeight`.
- **Multiplication maps.** Comparison `DY.1/tate-limit-of-elliptic-doubling`: for `W` elliptic over
  a field with admissible absolute values, `tateLimit (2 • ·) naiveHeight 4 = 2·canonicalHeight` (from
  Tau Ceti's attained limit and `smul_iterate`), and for every `m ≥ 2`,
  `tateLimit (m • ·) naiveHeight m² = 2·canonicalHeight` (by uniqueness, from
  `canonicalHeight_nsmul` and `|2ĥ − h| ≤ 2D`); points of Tate limit `0` are exactly the torsion
  points. Comparison `DY.1/canonical-height-of-multiplication-on-an-abelian-variety` (Example 1): for
  `A` abelian over a number field and `L` symmetric, `ĥ_{A,[m],L}` is independent of `m ≥ 2` and equals
  the requested Néron–Tate height.

### Dependencies

- Inside the roadmap: DY.0 (rational maps, their action on `ℙ¹(K)`, base change, conjugation,
  preperiodic points, the resultant certificate). DY.2 consumes the canonical height for its local
  decomposition; DY.3 the Northcott bounds; DY.4 the canonical height of `ℙ¹` maps; DY.6 the
  canonical heights of critical points (`ĥ_crit`) and the relative heights over function fields.
- `DiophantineApproximationAndTranscendence:DT.0` (nodes cited directly): absolute heights under
  extension and embeddings, Northcott in bounded degree.
- `HeightsRationalPointsAndObstructions:RP.0` (requests): the Weil height machine for line bundles
  and `ℝ`-divisor classes on smooth projective varieties (functoriality, additivity, normalisation on
  `ℙᴺ`, Northcott for ample classes in bounded degree), and the Néron–Tate height on abelian
  varieties with `[m]*L ≅ L^{⊗m²}` for symmetric `L`.
- `tauceti:TauCetiRoadmap/EllipticCurves` layer 6 (built declarations cited directly; the atlas
  records it as a supplier of DY.1 after the narrowing of RP.0).
- Consumer: `ClassicalArithmeticCompletion:CA.6/canonical-height-power-map`, whose request is
  answered by `DY.1/canonical-height-on-the-projective-line` (fields algebraic over `ℚ`, `d ≥ 2`,
  `h([x : 1]) = absLogHeight₁ x`, `h(∞) = 0`).

### Acceptance

- **The power map on `ℙ¹`.** `ĥ_{z^d} = h` for `d ≥ 2` (`canonicalHeight_powMap`): `h(x^d) = d h(x)`
  exactly, so `h` satisfies both characterising properties; `ĥ_{z²}([2 : 1]) = log 2`,
  `ĥ_{z²}(i) = 0`; preperiodic points are `0`, `∞` and roots of unity (Kronecker via
  `DY.1/zero-canonical-height-iff-preperiodic-on-the-projective-line`).
- **Multiplication on an abelian variety.** For elliptic curves, the Tate limit of `[m]` is twice
  Tau Ceti's `canonicalHeight` for every `m ≥ 2` (Call–Silverman's normalisation for `2(O)` against Tau
  Ceti's for `(O)`), and height zero is torsion; for abelian varieties, the comparison with the
  Néron–Tate height of `RP.0`.
- **Ampleness removed only in a separate theorem.** `DY.1/canonical-height-for-a-divisorial-eigenclass`
  keeps existence, uniqueness and vanishing at preperiodic points and exhibits the failure of the
  converse (`ℙ¹ × ℙ¹`, `(z², w + 1)`, `pr₁*O(1)`); the zero-height criterion is only stated for ample
  `L` (`DY.1/zero-canonical-height-iff-preperiodic`) and on `ℙ¹`.
- **Non-examples.** `α = 1` (or a degree-one map) makes the Tate sequence diverge; `ĥ_{z²−2}(−2) = 0 ≠
  log 2 = h(−2)`; without Northcott, zero Tate limit does not give preperiodicity.

### Source notes

No mistakes were found in Call–Silverman §1, Silverman ADS §3.4 or the AWS notes §§4–5 as read; the
telescoping constants agree (`c(V)/(α − 1)` in (5), `C/(d − 1)` in (3.15) and Theorem 17(a), and
`(2d − 1)C/(d − 1)²` in the proof of Theorem 15 is consistent with them).

---

## DY.2 Local dynamics and reduction

This layer builds the local theory of a rational map of `ℙ¹` at one place: the homogeneous
escape rate `G_{F,v}` at every absolute value, archimedean or not; the local canonical heights and
their sum over the places of a number field, which recovers the canonical height of DY.1; the
characterisation of good reduction by the escape rate; the reduction of periodic points and cycles
modulo a place of good reduction, with multipliers reducing to multipliers in the residue
characteristic and the Morton–Silverman description of the periods (including the `p`-power
phenomenon); and the canonical measure `µ_{f,v}`, defined on the Berkovich projective line of
TropicalAndBerkovichArithmetic TB.0 by `Δλ̂_{f,v} = µ_{f,v} − δ_∞`, together with its archimedean
counterpart on the Riemann sphere. It supplies DY.4 (equidistribution, adelic metrics and energies)
and DY.6 (Lattès maps and families).

Sources (all public; locators in the packet): DeMarco–Krieger–Ye, *Uniform Manin–Mumford for a
family of genus 2 curves* (arXiv:1901.09945v2) §§2, 4; Baker–Rumely, *Equidistribution of small
points, rational dynamics, and potential theory* (arXiv:math/0407426v2) §§1–3; Favre–Rivera-Letelier,
*Équidistribution quantitative des points de petite hauteur sur la droite projective*
(arXiv:math/0407471v2) §6; Benedetto, *Non-archimedean dynamics in dimension one* (Arizona Winter
School 2010 notes) §§1, 4, 6; Silverman, *Lecture notes on arithmetic dynamics* (Arizona Winter School
2010) §§3, 6; Call–Silverman, *Canonical heights on varieties with morphisms* (Compositio 1993) §2;
Hutz, *Good reduction of periodic points on projective varieties* (arXiv:0801.3645v3) §3. Silverman's
*The Arithmetic of Dynamical Systems* and Baker–Rumely's monograph are not public; their results are
taken from the papers above.

### What the libraries and the earlier layers provide (consume; never restate)

- **Mathlib (082e2d3).**
  - Local height bounds: `AbsoluteValue.eval_mvPolynomial_le` and `IsNonarchimedean.eval_mvPolynomial_le`
    (`v(p(x)) ≤ C·(⨆ i, v(x i))^N` for `p` homogeneous of degree `N`), and the linear-map bounds
    `AbsoluteValue.iSup_abv_linearMap_apply_le`, `IsNonarchimedean.iSup_abv_linearMap_apply_le`.
  - Places and heights: `NumberField.InfinitePlace` with `InfinitePlace.mult`, `NumberField.FinitePlace`
    (normalised absolute values), `NumberField.FinitePlace.hasFiniteMulSupport`, the product formula
    `NumberField.prod_abs_eq_one`, `Height.logHeight` and `NumberField.mulHeight_eq`.
  - Dynamics of self-maps: `Function.IsPeriodicPt`, `Function.minimalPeriod`,
    `Function.IsPeriodicPt.map` (transport along a semiconjugacy), `IsPeriodicPt.minimalPeriod_dvd`,
    `Function.minimalPeriod_iterate_eq_div_gcd`, `orderOf`.
  - Also `Real.posLog` (`log⁺`), `MvPolynomial.pderiv` and `MvPolynomial.pderiv_map`, `Matrix.trace`,
    `Projectivization`, `IsLocalRing.ResidueField`, `ValuationSubring`, `TendstoUniformly.continuous`,
    `Nat.sum_Icc_choose`, `Nat.Prime.dvd_choose_self`, `Nat.fib`, `OnePoint`, `MeasureTheory.Measure.dirac`.
- **Absent from both libraries** (library audit, DY.2 "not built"): every local height, every escape
  rate, dynamical good reduction beyond DY.0, multipliers of cycles and their reduction, and the
  Berkovich line (Tau Ceti has adic spaces, not Berkovich spectra).
- **DY.0** (this roadmap): homogeneous lifts `HomogeneousLift K d` with `eval`, `comp`, `smul`, `map`
  (`DY.0/homogeneous-lift`, `DY.0/homogeneous-lift-comp`); the resultant `binaryResultant` with the
  Nullstellensatz certificate (`DY.0/resultant-certificate`) and `DY.0/binary-resultant-eq-zero-iff`;
  `RationalMap K`, its action `toEnd` on `ℙ¹(K)` and base change (`DY.0/rational-map-action-on-points`,
  `DY.0/rational-map-base-change`); conjugation `γ • f = γ ∘ f ∘ γ⁻¹` (`DY.0/conjugacy-of-rational-maps`);
  the fixed-point multiplier `RationalMap.multiplier` with its trace formula and conjugation invariance
  (`DY.0/fixed-point-multiplier`, `DY.0/fixed-point-multiplier-conj`); good reduction `HasGoodReduction`
  over a valuation ring, the reduced map `reduction`, reduction of points `projReduction`, and
  `DY.0/good-reduction-iff-normalized-resultant-unit`, `DY.0/reduction-commutes-with-evaluation`,
  `DY.0/reduction-commutes-with-composition`, `DY.0/good-reduction-conj-integral`.
- **DY.1** (this roadmap): the canonical height relative to a global height field
  `RationalMap.relCanonicalHeight` (`DY.1/canonical-height-over-a-global-height-field`), the absolute
  canonical height `RationalMap.canonicalHeight` (`DY.1/canonical-height-on-the-projective-line`,
  normalised by `h([x : 1]) = NumberField.absLogHeight₁ x`) and their comparison
  (`DY.1/canonical-height-eq-relative-div-finrank`).

### Standing conventions

- **Absolute values and norms.** `v : AbsoluteValue K ℝ`, archimedean or not, on a field `K` that need
  not be complete. For `x = (x₀, x₁) ∈ K²`, `‖x‖_v = max(v(x₀), v(x₁))` (Mathlib's `⨆ i, v (x i)`, the
  convention of `Height.mulHeight`). At a place of a number field the escape rate is taken with the
  absolute value of Mathlib's place itself (normalised `FinitePlace`, and `InfinitePlace` weighted by
  `mult`), so that Σ_v `n_v` log `v(a)` = 0 is the product formula. The standard absolute values
  `|·|_p` of DeMarco–Krieger–Ye differ by a power: `escapeRate_rpow_abv` converts.
- **Coordinates.** `[x₀ : x₁]` with affine coordinate `z ↔ [z : 1]` and `∞ = [1 : 0]`, as in DY.0; a lift
  `F = (F₀, F₁)` of `f` of degree `d` gives `f(z) = F₀(z, 1)/F₁(z, 1)`, and `Fⁿ` (the `n`-fold composite)
  lifts `fⁿ`, of degree `dⁿ`. The escape rate depends on the lift; the local height on the lift only
  through an additive constant; the canonical measure not at all.
- **Nonarchimedean setting.** `𝒪 = {v ≤ 1}`, `𝔪 = {v < 1}`, `k = 𝒪/𝔪`, `p = char k ≥ 0`. A lift is
  *normalised* if its coefficients are in `𝒪` and one is a unit; `f` has good reduction when a normalised
  lift has `v(Res F) = 1` (DY.0). Every local theorem states separately whether `K` (or its residue field)
  must be algebraically closed and whether good reduction is assumed; no theorem of this layer needs a
  semistability hypothesis.
- **Laplacian sign.** DeMarco–Krieger–Ye's: `Δ log⁺|T| = ω_v − δ_∞`, with `ω_v = δ_{ζ_{0,1}}` (Gauss
  point) at nonarchimedean `v` and the normalised arc length on `{|z| = 1}` at archimedean `v`. This is
  the negative of Baker–Rumely's `Δ = −dd^c`. With it, `Δλ̂ = µ − δ_∞`.
- **Residue characteristic kept.** Multipliers are defined by DY.0's trace formula
  `tr(DΦ(x))/µ − dⁿ` (for `Φ = Fⁿ`, `Φ(x) = µx`), with no division by the degree, so they are defined
  and reduce correctly in characteristic `p | d`.

### Objects

**The homogeneous escape rate** (`escapeRate`, node `DY.2/escape-rate`, planet *Homogeneous escape
rate*). For `v`, a lift `F : HomogeneousLift K d` with `d ≥ 2`, and `x ∈ K² ∖ {0}`:
`G_{F,v}(x) = lim_{n→∞} d^{−n} log ‖Fⁿ(x)‖_v` (defined with `limUnder`; the limit exists by
`escapeRate_tendsto`). It is the Baker–Rumely height `Ĥ_{F,v}` and DeMarco–Krieger–Ye's `G_{F_t,v}`
(2.3).
API: `escapeRate_tendsto`; `escapeRate_abs_sub_log_norm_le` (`log c_v/(d − 1) ≤ G − log ‖x‖ ≤
log C_v/(d − 1)`); `escapeRate_apply_lift` (`G(F(x)) = d·G(x)`); `escapeRate_smul`
(`G(ax) = G(x) + log v(a)`); `escapeRate_const_smul_lift` (`G_{cF} = G_F + log v(c)/(d − 1)`);
`escapeRate_iterate_lift` (a lift of `fᵐ` of degree `dᵐ` has the same escape rate);
`escapeRate_conj` (`G_{A⁻¹∘F∘A}(x) = G_F(Ax)` for `A ∈ GL₂(K)`; in DY.0's convention `γ • f` has lift
`A∘F∘A⁻¹` and `G_{A∘F∘A⁻¹}(x) = G_F(A⁻¹x)`); `escapeRate_algebraMap` (unchanged under extension of
`v`); `escapeRate_comp_ringEquiv` (Galois equivariance); `escapeRate_rpow_abv` (`G_{v^s} = s·G_v`);
`continuous_escapeRate` (continuity on `E² ∖ {0}` for a normed field `E`); `escapeRate_nonpos_iff`
(`G(x) ≤ 0` iff the orbit is bounded, i.e. `x` lies in the filled Julia set); `escapeRate_monomial`
(`G = log ‖·‖` for `(X₀^d, X₁^d)`).
Unit tests: `escapeRate_powerMap` (for `(X₀², X₁²)` at `|·|_∞`, `G(3, 1) = log 3`, `G(1, 1) = 0`);
`escapeRate_padicCantor_zero` (for `(X₀^p − X₀X₁^{p−1}, pX₁^p)` at `|·|_p`, `G(0, 1) = −(log p)/(p − 1)`,
different from the one-step value `−(log p)/p`); `escapeRate_goodReduction_degenerate` (for the lift of
`z² − z − 1`, `G = log ‖·‖_p` at every prime); `escapeRate_monicPolynomial_compat` (for `z² + c` over
`ℂ`, `G(z, 1)` is the classical escape rate `lim 2^{−n} log max(|fⁿ(z)|, 1)`, and `log⁺|z|` for
`c = 0`); `escapeRate_depends_on_lift` (scaling `(X₀², X₁²)` by 2 adds `log 2` at `|·|_∞`).

**The local canonical height** (`localCanonicalHeight`, node `DY.2/local-canonical-height`, planet
*Local canonical height*). `λ̂_{F,v}(z) = G_{F,v}(z, 1)` for `z ∈ K`; homogeneously
`λ̂_{F,v}([x₀ : x₁]) = G_{F,v}(x₀, x₁) − log v(x₁)` for `x₁ ≠ 0`. It is DeMarco–Krieger–Ye's `λ_{t,v}`
(2.4), Baker–Rumely's `ĥ_{F,v,(∞)}` (in their chart), and Call–Silverman's canonical local height for
the divisor `(∞)` with `φ = F₁(z, 1)` and constant `a = 1`.
API: `localCanonicalHeight_eq_escapeRate_sub_log`; `localCanonicalHeight_eq_green_add_posLog`
(`λ̂(z) = g_{F,v}([z : 1]) + log⁺ v(z)`); `abs_localCanonicalHeight_sub_posLog_le` (a Weil local
height for `(∞)`); `localCanonicalHeight_apply_map` (`λ̂(f(z)) = d·λ̂(z) − log v(F₁(z, 1))`);
`localCanonicalHeight_const_smul_lift`; `tendsto_localCanonicalHeight_sub_log` (`λ̂(z) − log v(z) →
G_{F,v}(1, 0)` as `v(z) → ∞`); `sum_localCanonicalHeight` (the global decomposition below).
Unit tests: `localCanonicalHeight_powerMap` (`λ̂ = log⁺ v` for `(X₀², X₁²)`; at `|·|₃`, `λ̂(1/9) = log 9`,
`λ̂(3) = 0`); `localCanonicalHeight_padicCantor` (`λ̂ = −(log p)/(p − 1)` on `ℤ_p`, `log|z|_p` for
`|z|_p > 1`); `localCanonicalHeight_goodReduction` (`λ̂ = log⁺|·|_p` for `z² − z − 1`);
`localCanonicalHeight_callSilverman` (the two Call–Silverman axioms); `localCanonicalHeight_not_posLog`
(for `(z² + 1)/(3z)` over `ℂ₃`, `λ̂(i) = −(1/2) log 3 ≠ 0`).

**The dynamical Green function** (`dynamicalGreenFunction`, node `DY.2/dynamical-green-function`).
`g_{F,v} : ℙ¹(K) → ℝ`, `[x] ↦ G_{F,v}(x) − log ‖x‖_v`, bounded; DeMarco–Krieger–Ye's
`Φ_t = G_{F_t}(·, 1) − log⁺|·|` (4.6) is its affine restriction, a potential of `µ − ω`.
API: `dynamicalGreenFunction_mk`; `abs_dynamicalGreenFunction_le`; `dynamicalGreenFunction_apply_map`
(`g(f(P)) = d·g(P) − log(‖F(x)‖/‖x‖^d)`); `dynamicalGreenFunction_unique` (the unique bounded
solution); `dynamicalGreenFunction_eq_zero_of_goodReduction`; `continuous_dynamicalGreenFunction`.
Unit tests: `dynamicalGreenFunction_powerMap` (`g = 0` for `z^d`); `dynamicalGreenFunction_padicCantor`
(`g([0 : 1]) = −(log p)/(p − 1)`, `g([1 : 0]) = 0`); `dynamicalGreenFunction_scale` (`g_{cF} = g_F +
log v(c)/(d − 1)`); `dynamicalGreenFunction_not_zero_nonclosed` (for `(z² + 1)/(3z)`, `g = 0` on
`ℙ¹(ℚ₃)` but `g([i : 1]) = −(1/2) log 3` on `ℙ¹(ℂ₃)`).

**The multiplier of a periodic cycle** (`cycleMultiplier`, node `DY.2/multiplier-of-a-periodic-cycle`,
planet *Multiplier of a periodic cycle*). For `P` of exact period `n`, `λ(P) = λ_{fⁿ}(P)`, DY.0's
fixed-point multiplier of `fⁿ` at `P`; by DY.0's trace formula `λ(P) = tr(D(Fⁿ)(x))/µ − dⁿ` for
`Fⁿ(x) = µx`, in every characteristic. In a chart `λ(P) = ∏_{i<n} f′(fⁱ(z))`.
API: `cycleMultiplier_def`; `multiplier_pow_mul` (`λ_{f^{kn}} = λ_{fⁿ}^k` at a fixed point of `fⁿ`);
`cycleMultiplier_eq_prod_deriv`; `cycleMultiplier_toEnd` (constant on the cycle); `cycleMultiplier_smul`
(conjugation invariance); `cycleMultiplier_reduction` (reduction, below); `cycleMultiplier_eq_one_iff`
(`λ = 1` iff `P` is a multiple fixed point of `fⁿ`, the multiplicity input of DY.3).
Unit tests: `cycleMultiplier_twoCycle` (the 2-cycle `{1, −1}` of `z² − z − 1` has multiplier `−3`);
`cycleMultiplier_fixed` (`d` at `1` and `0` at `∞` for `z^d`); `cycleMultiplier_infinity` (`3` at `∞`
for `(z² + 1)/(3z)`); `cycleMultiplier_eq_multiplier_pow` (equals `(f²).multiplier P` for the 2-cycle);
`multiplier_ne_cycleMultiplier` (DY.0's multiplier of `f` itself at a non-fixed periodic point is not the
cycle multiplier).

**The Berkovich escape potential** (`berkovichEscapePotential`, node `DY.2/berkovich-escape-potential`,
over a complete nonarchimedean `K`). The continuous function `ĝ_F` on `P^{1,an}_K` with
`ĝ_F(x) = lim_n (d^{−n} log max([Fⁿ₀(T, 1)]_x, [Fⁿ₁(T, 1)]_x) − log max([T]_x, 1))` on `A^{1,an}_K`,
the unique continuous extension of `g_{F,v}`; `λ̂^{an}_F = ĝ_F + log max([T], 1)`
(`berkovichLocalCanonicalHeight`).
API: `iterateFormsAffine` (the dehomogenised forms of `Fⁿ`); `berkovichEscapePotential_classical`
(equals `g_{F,v}` on type I points); `continuous_berkovichEscapePotential`;
`berkovichEscapePotential_eq_limit`; `berkovichEscapePotential_const_smul_lift`;
`berkovichLocalCanonicalHeight_apply`; `berkovichEscapePotential_eq_zero_of_goodReduction`.
Unit tests: `berkovichEscapePotential_gauss_padicCantor` (`ĝ(ζ_{0,1}) = 0` but `ĝ = −(log p)/(p − 1)`
on `ℤ_p` for `(z^p − z)/p`); `berkovichEscapePotential_powerMap` (`ĝ = 0` for `z^d`);
`berkovichEscapePotential_classical_compat` (`ĝ ∘ ofProj = g`); `berkovichEscapePotential_not_onestep`
(the one-step function differs at `0`).

**The canonical measure** (`canonicalMeasure`, node `DY.2/canonical-measure`, planet *Canonical
measure*). `µ_{f,v} = Δĝ_F + δ_{ζ_{0,1}}` on `P^{1,an}_K`, independent of the lift; equivalently
`Δλ̂^{an}_F = µ_{f,v} − δ_∞`. For `K` not algebraically closed one works over `ℂ_v`.
API: `laplacian_berkovichLocalCanonicalHeight`; `isProbabilityMeasure_canonicalMeasure`;
`canonicalMeasure_pullback` (`f^*µ = d·µ`, hence `f_*µ = µ`); `canonicalMeasure_iterate`
(`µ_{fⁿ} = µ_f`); `canonicalMeasure_conj` (`µ_{φ⁻¹∘f∘φ} = (φ^{an})^*µ_f`);
`canonicalMeasure_eq_dirac_gauss_iff` (`µ = δ_{ζ_{0,1}}` iff good reduction, `K` algebraically closed);
`canonicalMeasure_isPointMass_iff` (point mass at a type II point iff potentially good reduction);
`canonicalMeasure_classical_null` (no mass on type I points).
Unit tests: `canonicalMeasure_goodReduction_quadratic` (`δ_{ζ_{0,1}}` for `z² − z − 1` over `ℂ_p`);
`canonicalMeasure_padicCantor` (Haar measure of `ℤ_p` for `(z^p − z)/p`: mass `p^{−k}` on the type I
points of each disc `a + p^kℤ_p`, carried by `ℤ_p`); `canonicalMeasure_powerMap` (`δ_{ζ_{0,1}}` for
`z^d`, also when `p | d`); `canonicalMeasure_ne_gauss_nonclosed` (for `(z² + 1)/(3z)` at 3, `g = 0` on
`ℙ¹(ℚ₃)` but `µ ≠ δ_{ζ_{0,1}}`); `canonicalMeasure_notDirac_classical`.

**The archimedean canonical measure** (`archimedeanCanonicalMeasure`, node
`DY.2/archimedean-canonical-measure`). On the Riemann sphere `ℙ¹(ℂ) = P^{1,an}_ℂ`,
`µ_{f,∞} = Δg_F + ω` with `ω` the normalised arc length on `{|z| = 1}` (`unitCircleMeasure`) and `Δ`
the measure-valued Laplacian normalised as `dd^c` (`Δ log|z| = δ₀`); on `ℂ`,
`µ_{f,∞} = (1/2π)·Δ_eucl G_F(z, 1)`.
API: `unitCircleMeasure`; `laplacian_localCanonicalHeight_archimedean` (`Δλ̂_{F,∞} = µ_{f,∞} − δ_∞`);
`isProbabilityMeasure_archimedeanCanonicalMeasure`; `archimedeanCanonicalMeasure_pullback`
(`f^*µ = d·µ`); `archimedeanCanonicalMeasure_noAtoms`; `archimedeanCanonicalMeasure_eq_lyubich`
(uniqueness among atom-free measures with `f^*µ = d·µ`).
Unit tests: `archimedeanCanonicalMeasure_powerMap` (`ω` for `z^d`); `archimedeanCanonicalMeasure_chebyshev`
(the arcsine law `dx/(π√(4 − x²))` on `[−2, 2]` for `z² − 2`); `archimedeanCanonicalMeasure_iterate`;
`archimedeanCanonicalMeasure_not_circle` (not `ω` for `z² − z − 1`: `g_F` takes the values `0` at `1`
and `−log(1 + √2)` at the fixed point `1 + √2`, so it is not constant).

### DY.2a — Local bounds and the escape rate

- `DY.2/lift-norm-upper-bound`: `‖F(x)‖_v ≤ C_v(F)·‖x‖_v^d` with `C_v(F) = max_i Σ_m v(coeff)`
  (archimedean) or `max v(coeff)` (nonarchimedean); `≤ ‖x‖^d` for `v`-integral `F`. From Mathlib's
  `eval_mvPolynomial_le` lemmas.
- `DY.2/lift-norm-lower-bound`: if `Res(F) ≠ 0` then `c_v(F)·‖x‖_v^d ≤ ‖F(x)‖_v` with
  `c_v(F) = v(Res F)/(2C_v(G))` (archimedean) or `v(Res F)/C_v(G)`, `G` the certificate forms of
  `DY.0/resultant-certificate`; for `v`-integral `F`, `v(Res F)·‖x‖^d ≤ ‖F(x)‖ ≤ ‖x‖^d`. The certificate is
  used at every place, so no completeness or compactness is needed.
- `DY.2/lift-norm-of-good-reduction`: a normalised lift with `v(Res F) = 1` has `‖F(x)‖ = ‖x‖^d`.
- `DY.2/escape-rate-tendsto` (Baker–Rumely, Lemma 3.5): the limit exists for `x ≠ 0`, `d ≥ 2`, with
  `|d^{−n} log ‖Fⁿ x‖ − G(x)| ≤ B_v/((d − 1)dⁿ)`, `B_v = max(log C_v, −log c_v)`, uniformly (telescoping).
- `DY.2/escape-rate-sub-log-norm-bounds`, `DY.2/escape-rate-functional-equation`,
  `DY.2/escape-rate-homogeneity`, `DY.2/escape-rate-scale-lift` (`(cF)ⁿ = c^{(dⁿ−1)/(d−1)}Fⁿ`),
  `DY.2/escape-rate-iterate-lift`, `DY.2/escape-rate-conjugation`, `DY.2/escape-rate-base-change`: the
  transformation rules listed under the API.
- `DY.2/escape-rate-continuous`: for a normed field, `G_{F,v}` is continuous on `K² ∖ {0}` and `g_{F,v}`
  on `ℙ¹(K)` (a uniform limit of continuous functions).
- `DY.2/escape-rate-nonpos-iff-bounded-orbit` (Baker–Rumely, Lemma 3.8): `G(x) ≤ 0` iff the orbit of `x`
  is bounded; `G(x) > 0` forces `‖Fⁿ(x)‖ → ∞`.

### DY.2b — Good reduction and the escape rate

- `DY.2/escape-rate-of-good-reduction` (Baker–Rumely, Lemma 3.9): if `f` has good reduction at the
  nonarchimedean `v` and `F` is a normalised lift, then `G_{F,v} = log ‖·‖_v` on `K² ∖ {0}` and over every
  extension of `v`. No algebraic closedness is needed.
- `DY.2/good-reduction-of-escape-rate`: conversely, if the residue field of `v` is algebraically closed
  (for instance `K = ℂ_v`) and `G_{F,v} = log ‖·‖_v` for a normalised lift, then `v(Res F) = 1`. The proof
  lifts a common zero of the reduced forms (`DY.0/binary-resultant-eq-zero-iff`) to a primitive `y` with
  `‖F(y)‖ < 1`, giving `G(y) ≤ d^{−1} log ‖F(y)‖ < 0`. **The hypothesis is needed**: for
  `f(z) = (z² + 1)/(3z)` over `ℚ₃`, `G = log ‖·‖` on `ℚ₃²` although `v(Res F) = 1/9`
  (`DY.2/example-bad-reduction-nonclosed-field`).
- `DY.2/escape-rate-trivial-at-almost-all-places`: over a number field, outside a finite set of places,
  `F` has good reduction, `‖x‖_v = 1` and `G_{F,v}(x) = 0`.

### DY.2c — Local canonical heights and the global decomposition

- `DY.2/local-canonical-height-weil-bound`: `|λ̂_{F,v} − log⁺ v| ≤ B_v/(d − 1)`; `λ̂ = log⁺ v` at places of
  good reduction.
- `DY.2/local-canonical-height-functional-equation` (Baker–Rumely (3.28); Call–Silverman Theorem 2.1):
  `λ̂(f(z)) = d·λ̂(z) − log v(F₁(z, 1))` when `F₁(z, 1) ≠ 0`.
- `DY.2/green-function-functional-equation` and `DY.2/green-function-uniqueness`: `g_{F,v}` is the
  unique bounded function with `g(f(P)) = d·g(P) − log(‖F(x)‖/‖x‖^d)`; for points whose orbit avoids `∞`
  this is Call–Silverman's uniqueness of `λ̂`.
- `DY.2/local-canonical-height-at-infinity` (DeMarco–Krieger–Ye (2.6)): `λ̂(z) − log v(z) → G_{F,v}(1, 0)`;
  summed over places these constants give `[K : ℚ]·ĥ_f(∞)`, which is 0 for the Lattès maps.
- `DY.2/sum-of-escape-rates-over-places`: over a number field `K`,
  `lim d^{−n}·Height.logHeight(Fⁿ(x)) = Σ_{v|∞} mult(v)·G_{F,v}(x) + Σ_{v∤∞} G_{F,v}(x)`, a finite sum,
  independent of the representative and of the lift (product formula).
- `DY.2/local-decomposition-of-canonical-height` (planet *Local decomposition of the canonical height*;
  Baker–Rumely Remark 3.6, DeMarco–Krieger–Ye §2.2): `relCanonicalHeight f [x] = Σ_{v|∞} mult(v)·G_{F,v}(x)
  + Σ_{v∤∞} G_{F,v}(x)` and `[K : ℚ]·ĥ_f(z) = Σ_{v|∞} mult(v)·λ̂_{F,v}(z) + Σ_{v∤∞} λ̂_{F,v}(z)`; for
  `z ∈ Q̄` any number field containing `z` and the coefficients may be used.

### DY.2d — Reduction of cycles and multipliers

- `DY.2/reduction-of-periodic-points` (Silverman, AWS notes, Proposition 24(c)): under good reduction a
  point of exact period `n` reduces to a point of exact period `m | n`; preperiodic points reduce to
  preperiodic points. It uses DY.0's `DY.0/reduction-commutes-with-evaluation` and Mathlib's
  `IsPeriodicPt.map`.
- `DY.2/multiplier-chain-rule` and `DY.2/multiplier-constant-on-cycle`: `λₙ(P) = ∏ f′(fⁱ(z))` in a chart,
  constant on the cycle, and `λ_{kn} = λₙ^k`.
- `DY.2/multiplier-reduction`: if `f` has good reduction and `fⁿ(P) = P`, then `λ_{fⁿ}(P) ∈ 𝒪` and its
  residue is `λ_{f̃ⁿ}(red P)`, computed over `k` in characteristic `p` by the same trace formula. In
  particular `|λ| ≤ 1`, and all multipliers lie in `𝔪` when `f̃ⁿ` is inseparable.
- `DY.2/good-reduction-multipliers-integral`: maps with good (or potentially good) reduction have no
  repelling cycles; a repelling cycle excludes potentially good reduction.

### DY.2e — Periods under good reduction

- `DY.2/residue-disc-expansion` (Silverman, AWS notes, (5)): if `g` has good reduction and `g̃` fixes `0̃`,
  then on `𝔪`, `g(z) = µ + λz + z²A(z)/(1 + zB(z))` with `µ ∈ 𝔪`, `λ = g′(0) ∈ 𝒪`, `A, B ∈ 𝒪[z]`.
- `DY.2/orbit-congruence-geometric-sum` (Silverman, AWS notes, (6)): if moreover `0` has exact period
  `N ≥ 2`, then `g^j(0) ≡ µ(1 + λ + ⋯ + λ^{j−1})` mod `µ²` and `1 + λ + ⋯ + λ^{N−1} ∈ 𝔪`.
- `DY.2/periods-under-good-reduction` (planet *Periods of points under good reduction*; Morton–Silverman,
  Silverman's AWS notes Theorem 25, Hutz Theorem 1): with `m` the period of `red P`, `λ̃` the multiplier of
  the reduced cycle and `r` its order in `k^×` (`r = ∞` if `λ̃` is `0` or not a root of unity):
  `n = m`, or `n = m·r·p^e` with `e ≥ 0`, and `e = 0` if `char k = 0`. This holds over any nonarchimedean
  field; the `p`-power case occurs.
- `DY.2/p-power-iterate-valuation-recursion` (Hutz, Lemma 22, for `ℙ¹`) and `DY.2/period-exponent-bound`
  (Hutz, Theorem 2): for a discrete valuation normalised by `ord(π) = 1`, `2^{e−1} ≤ ord(p)` for odd `p` and
  `F_{e−1} ≤ ord(2)` (Fibonacci) for `p = 2`; over `ℚ_p`, `e ≤ 1` for odd `p` and `e ≤ 3` for `p = 2`.
- `DY.2/zieve-period-exponent-bound` (Zieve; Silverman's notes Theorem 27): for `K/ℚ_p` with ramification
  `e_K`, `p^{e−1} ≤ 2e_K/(p − 1)` (`e_K/(p − 1)` for `p = 2`); over `ℚ_p`, `e = 0` for `p ≥ 5` and `e ≤ 1`
  for `p ∈ {2, 3}`.
- `DY.2/rational-periods-bounded-by-good-prime` (Silverman's notes Corollary 26): for `f ∈ ℚ(z)` with good
  reduction at `p` and `P ∈ ℙ¹(ℚ)` of exact period `n`: `n ≤ p³ − p` for odd `p`, and `n ≤ 24` for `p = 2`
  (`n ≤ 6` with Zieve's bound).

### DY.2f — The Berkovich line: escape potential and canonical measure

Over a complete algebraically closed nonarchimedean field `K` (for instance `ℂ_v`), with the Berkovich
line, the analytification `f^{an}`, the Laplacian, pull-backs and the potential theory of TB.0 and TB.1:

- `DY.2/berkovich-lift-bounds`: the two lift bounds hold at every seminorm `x ∈ A^{1,an}_K`, so the
  defining sequence of `ĝ_F` converges uniformly.
- `DY.2/laplacian-of-local-canonical-height`: `Δλ̂^{an}_F = µ_{f,v} − δ_∞` (DeMarco–Krieger–Ye §2.4).
- `DY.2/canonical-measure-is-probability`: `µ_{f,v}` is a positive probability measure without mass on
  type I points (uniform limits of the subharmonic `d^{−n} log max([Fⁿ₀], [Fⁿ₁])`).
- `DY.2/canonical-measure-invariance` (Baker–Rumely Proposition 3.36; Favre–Rivera-Letelier §6.1):
  `f^*µ = d·µ` and `f_*µ = µ`.
- `DY.2/canonical-measure-of-good-reduction` (Baker–Rumely Example 3.43; Favre–Rivera-Letelier §6.2): good
  reduction gives `µ = δ_{ζ_{0,1}}`.
- `DY.2/good-reduction-of-canonical-measure`: conversely `µ = δ_{ζ_{0,1}}` implies good reduction (`ĝ` is
  constant, the constant is 0 by the functional equation, then `DY.2/good-reduction-of-escape-rate`).
- `DY.2/canonical-measure-conjugation`: `µ_{φ⁻¹∘f∘φ} = (φ^{an})^*µ_f`.
- `DY.2/potential-good-reduction-iff-point-mass` (DeMarco–Krieger–Ye §2.4; Benedetto Corollary 6.25): `f`
  has potentially good reduction iff `µ_{f,v}` is a point mass at a type II point `ξ`, and then any `φ` with
  `φ^{an}(ζ_{0,1}) = ξ` conjugates `f` to good reduction.

### DY.2g — The archimedean canonical measure

- `DY.2/archimedean-canonical-measure-properties`: `µ_{f,∞}` is a probability measure without atoms,
  `Δλ̂_{F,∞} = µ_{f,∞} − δ_∞`, `f^*µ = d·µ`, `f_*µ = µ` (Baker–Rumely, proof of Proposition 3.36).
- `DY.2/archimedean-canonical-measure-is-maximal-entropy-measure` (comparison): `µ_{f,∞}` is Lyubich's
  measure, the unique atom-free probability measure with `f^*µ = d·µ`, the limit of the normalised
  preimage measures of any non-exceptional point, and the unique measure of maximal entropy `log d`
  (Lyubich; Freire–Lopes–Mañé; Baker–Rumely Theorem 2.1; for the Lattès maps of DY.6 it is the push-forward
  of Haar measure).

### Worked examples (acceptance)

- `DY.2/example-good-reduction-quadratic`, `f(z) = z² − z − 1` over `ℚ` (lift `(X₀² − X₀X₁ − X₁², X₁²)`,
  `Res = 1`): good reduction at every `p`, `G_{F,p} = log ‖·‖_p`, `λ̂_p = log⁺|·|_p`, `µ_p = δ_{ζ_{0,1}}`;
  the 2-cycle `{1, −1}` has multiplier `−3` and `G_{F,∞}(±1, 1) = 0`, so `ĥ_f(±1) = 0`. **Residue
  characteristic kept:** modulo 2 the cycle collapses to the fixed point `1` of `z² + z + 1` with reduced
  multiplier `1 ≡ −3`, so `n = 2 = m·r·p` with `m = r = 1`, `p = 2` (the `p`-power case); modulo 3 it stays a
  2-cycle whose reduced multiplier is `0 ≡ −3` (superattracting mod 3); modulo 7 the fixed points `1 ± √2`
  (multipliers `1 ± 2√2`) reduce to `4, 5` with multipliers `0, 2`. The holomorphic fixed-point formula
  `1 + 1/(−2√2) + 1/(2√2) = 1` holds.
- `DY.2/example-bad-reduction-padic-cantor-map`, `f(z) = (z^p − z)/p` over `ℚ_p` (lift
  `(X₀^p − X₀X₁^{p−1}, pX₁^p)`, `Res = p^p`): bad reduction and no potentially good reduction (fixed point
  `0` with multiplier `−1/p`, `|·|_p = p`); `λ̂ = −(log p)/(p − 1)` on `ℤ_p`, `log|z|_p` for `|z|_p > 1`;
  `λ̂(z) = ∫_{ℤ_p} log|z − y|_p dH(y)` and `µ_{f,p} = H`, the Haar probability measure of `ℤ_p` (the filled
  Julia set is `ℤ_p`, Benedetto Example 4.40).
- `DY.2/example-bad-reduction-nonclosed-field`, `f(z) = (z² + 1)/(3z)` over `ℚ` (lift `(X₀² + X₁², 3X₀X₁)`,
  `Res = 9`): good reduction away from 3; at 3, `G = log ‖·‖` on `ℚ₃²` (−1 is not a square mod 3) but
  `G(i, 1) = −(1/2) log 3` over `ℂ₃`; fixed points `∞` (multiplier 3) and `±1/√2` (multiplier `−1/3`,
  repelling at 3), so no potentially good reduction at 3; `i` and `i + 3` have the same reduction but images
  `0` and `(2i + 3)/(i + 3)` reducing to `0` and `2`. At 2 (good reduction, `f̃(z) = z + 1/z`) the three fixed
  points all reduce to the triple fixed point `∞` and their multipliers `3, −1/3, −1/3` all reduce to `1`.

### Dependencies

- Inside this roadmap: `ArithmeticDynamics:DY.0` (lifts, resultants and the certificate, good reduction,
  reduction of points and maps, conjugation, fixed-point multipliers) and `ArithmeticDynamics:DY.1` (the
  relative and absolute canonical heights on `ℙ¹`). DY.2 supplies `ArithmeticDynamics:DY.4` (canonical
  measures, local heights and adelic metrics, energies) and `ArithmeticDynamics:DY.6` (escape rates and
  measures of the Lattès maps, their conjugation symmetries), and the cycle multiplier to
  `ArithmeticDynamics:DY.3`.
- `TropicalAndBerkovichArithmetic:TB.0` (requested): the Berkovich line `P^{1,an}_K` as `A^{1,an}_K ∪ {∞}`
  of multiplicative seminorms with the Gelfand topology, density of `ℙ¹(K)`, the points `ζ_{a,r}` and the
  Gauss point, and the analytification `φ^{an}` of rational maps with `[g]_{φ^{an}(x)} = [g ∘ φ]_x`,
  functorial, with the `PGL₂` action.
- `TropicalAndBerkovichArithmetic:TB.1` (requested): point types and transitivity of `PGL₂(K)` on type II
  points; the Laplacian on continuous functions of bounded differential variation with
  `Δ log max([T], 1) = δ_{ζ_{0,1}} − δ_∞`; Liouville; Poincaré–Lelong; subharmonicity of `log[g]`, of maxima
  and of uniform limits; potentials `∫ log[T − y] dν(y)` with Laplacian `ν − δ_∞`; pull-back and push-forward
  of measures along `φ^{an}` with `Δ(h ∘ φ^{an}) = φ^*Δh`; the Laplacian of `log(‖Ax‖/‖x‖)`.
- Recorded gaps: the measure-valued Laplacian on the Riemann sphere (needed by the archimedean measure),
  the complex dynamics of rational maps behind Lyubich's measure, and a public text of Zieve's proof.

### Acceptance

- The two computed examples of the stage text: the good-reduction polynomial `z² − z − 1` and the
  bad-reduction maps `(z^p − z)/p` and `(z² + 1)/(3z)`, with multipliers and cycles reduced modulo 2, 3 and 7
  in their residue characteristics (above).
- Classical points alone do not supply the dynamical space: for every map of good reduction (for instance
  `z² − z − 1` or `z^d` over `ℂ_p`) the canonical measure is the Gauss point mass `δ_{ζ_{0,1}}`, which gives
  no mass to `ℙ¹(ℂ_p)`, and `ĝ` is determined on `P^{1,an}` only by continuity from all of `ℙ¹(ℂ_p)`; for
  `(z^p − z)/p`, `λ̂^{an}(ζ_{0,1}) = 0` while `λ̂ = −(log p)/(p − 1)` on `ℤ_p`; and for `(z² + 1)/(3z)` the
  vanishing of `g` on `ℙ¹(ℚ₃)` does not give `µ = δ_{ζ_{0,1}}`.
- The algebraic-closure hypothesis of `DY.2/good-reduction-of-escape-rate` is shown necessary by
  `(z² + 1)/(3z)` over `ℚ₃`.
- Every definition has the unit tests listed under **Objects**; the sum formula is checked on `z²`
  (`Σ_v log⁺ v(z) = [K : ℚ]·h(z)`) and on the periodic points `±1` of `z² − z − 1`.

### Source notes

Mistakes found in the sources (packet `sourceIssues`): the norm `max{|x|_v, |y|_v}` for `max{|z|_v, |w|_v}` in
DeMarco–Krieger–Ye (2.3) (E301, already recorded by the paper extraction); `α` for `γ` in Baker–Rumely's proof
of Lemma 3.21 (E302); the residue `φ′(x_i) − 1` for `1/(φ′(x_i) − 1)` in Benedetto's proof of Theorem 1.6
(E303); Silverman's AWS Theorem 25 claims `n ∈ {m, mr, mrp}` but its proof gives only `n = mrp^k` (E304; the
bound on `k` is Zieve's or Hutz's); Hutz's Definition 21 indexes the `p`-power iterates inconsistently (E305)
and the proof of his Lemma 23 uses `c_{k+1} ≥ p·c_k`, which Lemma 22 does not give (E306; Theorem 2 survives
with the argument of `DY.2/period-exponent-bound`); three misprints in Silverman's notes (E307–E309).

---

## DY.3 Periodic-point equations and finite bounds

This layer turns "P has period n" into polynomial equations and extracts from them the two kinds of
finiteness that arithmetic dynamics lives on. The equations are the **period forms**
`Φₙ(φ) = Y·Fₙ − X·Gₙ` of a self-map of `ℙ¹` and their Möbius quotients, the **dynatomic polynomials**
`Φ*ₙ(φ) = ∏_{m∣n} Φₘ(φ)^{μ(n/m)}`. The central theorem is that `Φ*ₙ` is a polynomial, equivalently that the
**dynatomic cycle** `Z*ₙ(φ) = Σ_{m∣n} μ(n/m) Zₘ(φ)` is effective, together with the exact list of points it
contains: every point of exact period `n`, and a point of exact period `m < n` only when `n = m·r` or
`n = m·r·pᵉ`, where `r` is the multiplicative order of the multiplier and `p` the characteristic
(**formal versus exact period**). Reduction modulo a prime of good reduction commutes with `Φ*ₙ`, which
yields the Morton–Silverman constraint on the periods of rational points. The finiteness side is
Northcott's theorem for preperiodic points (rational points, and points of bounded degree), an explicit
height bound from a Nullstellensatz certificate, and **certified enumeration** of the rational
preperiodic points: a sound and complete algorithm once a finite superset is certified, made fully
explicit for the family `z^d + c` over `ℚ`. The layer then states, with the conditions their proofs need,
the known results on rational cycles of `z² + c` (periods 1–3 parametrised, no rational 4-cycles, no
rational 5-cycles, no rational 6-cycles conditionally on a rank hypothesis) and Poonen's conditional
classification, and records the **uniform boundedness conjecture** and **Poonen's conjecture** as
propositions that nothing consumes except as explicit hypotheses.

Sources (all public; versions and hashes in the packet): Morton–Silverman, *Periodic points,
multiplicities, and dynamical units*, J. reine angew. Math. 461 (1995) (GDZ scan), §§1–4, the primary
source for multiplicities, effectivity, the classification of formal periods and reduction; Hutz,
*Dynatomic cycles for morphisms of projective varieties* (arXiv:0801.3643), Theorem 2.20 and Theorem 3.1;
Call–Silverman, *Canonical heights on varieties with morphisms*, Compositio 89 (1993), Corollary 1.1.1;
Hutz, *Determination of all rational preperiodic points for morphisms of PN* (arXiv:1210.6246), the height
bound, the algorithm and the family `z^d + c`; Poonen, *The complete classification of rational
preperiodic points of quadratic polynomials over Q: a refined conjecture* (arXiv:math/9512217) with
Poonen's own errata list; Flynn–Poonen–Schaefer, *Cycles of quadratic polynomials and rational points on
a genus-2 curve* (arXiv:math/9508211); Morton, *Arithmetic properties of periodic points of quadratic
maps* I and II, Acta Arith. 62 (1992) and 87 (1998); Stoll, *Rational 6-cycles under iteration of
quadratic polynomials* (arXiv:0803.2836); Gao–Ou (arXiv:1304.4751) and Doyle–Poonen (arXiv:1711.04233) for
the dynatomic curves of `z^d + c`; and the survey of Benedetto, Ingram, Jones, Manes, Silverman and
Tucker (arXiv:1806.04980), §4, for the conjectures. Silverman's *The Arithmetic of Dynamical Systems* and
the Morton–Patel paper on the Galois theory of periodic points are not publicly available; the
Morton–Silverman paper proves the corresponding results (the book's treatment of dynatomic polynomials,
Morton–Patel's polynomial case) for all maps of `ℙ¹` over any field, in any characteristic.

### What Mathlib already provides (consume; never restate)

At Mathlib 082e2d3 (Tau Ceti f790474 adds nothing on dynatomic polynomials, preperiodic points or
periods of rational maps; the word "dynatomic" does not occur in either library):

- **Periodic points of a self-map.** `Function.IsPeriodicPt`, `Function.periodicPts`,
  `Function.minimalPeriod` (the exact period; `0` for non-periodic points) and
  `Function.IsPeriodicPt.minimalPeriod_dvd`. A point is **preperiodic** when some iterate lies in
  `periodicPts`; the layer uses exactly this predicate and defines no new one.
- **Möbius inversion.** `ArithmeticFunction.moebius`, `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`,
  the multiplicative form `ArithmeticFunction.prod_eq_iff_prod_pow_moebius_eq_of_nonzero`,
  `ArithmeticFunction.coe_moebius_mul_coe_zeta` and `ArithmeticFunction.isMultiplicative_moebius`; the
  cyclotomic analogue `Polynomial.cyclotomic_eq_prod_X_pow_sub_one_pow_moebius` is the model for the
  dynatomic definition.
- **Polynomials.** `Polynomial.divByMonic` and `Polynomial.map_divByMonic` (exact division by monic
  polynomials over any commutative ring, commuting with ring homomorphisms), `Polynomial.natDegree_iterate_comp`,
  `Polynomial.iterate_comp_eval`, `Polynomial.rootMultiplicity`, `Polynomial.count_roots`,
  `IsAlgClosed.dvd_iff_roots_le_roots`, `Polynomial.cyclotomic`.
- **Binary forms and power series.** `MvPolynomial.IsHomogeneous`, `MvPolynomial.aeval`,
  `MvPolynomial.map`, `multiplicity`; `PowerSeries.subst`, `PowerSeries.substAlgHom`,
  `PowerSeries.HasSubst.of_constantCoeff_zero'`, `PowerSeries.order`, `PowerSeries.order_mul`.
- **Heights and Northcott.** `Height.logHeight`, `Height.mulHeight` (relative heights of tuples, scaling
  invariant by `Height.logHeight_smul_eq_logHeight`), `Height.mulHeight₁_div_eq_mulHeight`, the explicit
  lower bound `Height.logHeight_eval_ge` from a Nullstellensatz certificate with its constant
  `Height.mulHeightBound`, and Northcott in a fixed number field
  `NumberField.finite_setOfPred_mulHeight₁_le`.
- **Projective line and points.** `Projectivization.mk`; `ℙ¹(K)` is `ℙ K (Fin 2 → K)`.

The library audit rates this layer "not built": dynatomic polynomials and multiplicities are absent,
bounded-degree finiteness exists only for elliptic torsion (owned by DY.1 and the Tau Ceti elliptic-curve
roadmap), and no enumeration procedure exists.

### Standing conventions

- **Maps are lifts.** A self-map of `ℙ¹` over a field `K` is presented by a *lift* `φ = (F, G)`, two binary
  forms in `K[X, Y]` (`X = X 0`, `Y = X 1`); the rational-map carrier, its iterates, conjugacy, resultant
  and good reduction belong to `ArithmeticDynamics:DY.0`. The iterate `φⁿ` is the **composite lift**
  `(Fₙ, Gₙ)`: `(F₀, G₀) = (X, Y)`, `(Fₙ₊₁, Gₙ₊₁) = (F(Fₙ, Gₙ), G(Fₙ, Gₙ))`. So `Φₙ` is determined by the lift;
  scaling the lift by `u` scales `Φₙ` by `u^{1+d+⋯+d^{n−1}}`, and every statement about orders and zeros is
  invariant.
- **Sign and points.** `Φₙ(φ) = Y·Fₙ − X·Gₙ` (Morton–Silverman (21)). A vector `P = (a, b)` stands for
  `[a : b]`, so `[0 : 1]` is `z = 0` and `[1 : 0]` is `∞`. The order of a binary form at `P` is the
  multiplicity of `ℓ_P = bX − aY`.
- **Degree.** Theorems take a morphism lift of degree `d ≥ 2` (both forms homogeneous of degree `d`, no
  common zero over an algebraic closure). This makes every `φⁿ`, `n ≥ 1`, non-degenerate
  (`Φₙ ≠ 0`); Morton–Silverman's hypothesis "φⁿ non-degenerate" is thereby automatic.
- **Characteristic.** Nothing assumes characteristic zero unless stated; `p = ringChar K`,
  `vₚ = padicValNat p` (identically `0` when `p = 0`), and `r = orderOf λ` for the multiplier `λ`
  (`r = 0` encodes "0 or not a root of unity", Morton–Silverman's `r = ∞`).
- **Preperiodic.** `x` is preperiodic for `f` iff `∃ m, f^[m] x ∈ Function.periodicPts f`.
- **Heights.** Heights are Mathlib's, relative to the field of definition (`Height.logHeight` of a
  representative vector; over `ℚ` a primitive integer pair `(a, b)` has multiplicative height
  `max(|a|, |b|)`).

### Binary forms and the period form

- **`binaryFormOrder F P`** (node `DY.3/binary-form-order-at-a-point`). The order `ord_P F` of a binary
  form at a point of `ℙ¹(K)`: Mathlib's `multiplicity` of `ℓ_P` in `F`. API: `binaryFormOrder_eq_zero_iff`
  (order `0` iff `F(P) ≠ 0`), `binaryFormOrder_mul` (additive on products of nonzero forms),
  `binaryFormOrder_smul_point` (depends only on the point), `binaryFormOrder_affine` (at `[a : 1]` it is
  Mathlib's `rootMultiplicity a` of the dehomogenisation `F(X, 1)`), `pow_dvd_iff_le_binaryFormOrder`.
  Unit tests: `ord_[0:1](X²Y) = 2`, `ord_∞(X²Y) = 1`, a nonzero constant has order `0`, and
  `ord_[1:1](X² − Y²) = 1` (not `2`).
- **Divisibility criterion** (`DY.3/binary-form-divisibility-criterion`). Over an algebraically closed
  field, nonzero forms satisfy `F ∣ G` iff `ord_P F ≤ ord_P G` for all `P` (so a form is a constant times
  `∏ ℓ_P^{ord_P F}` and `Σ_P ord_P F = deg F`); divisibility of forms over `K` may be tested over any
  extension. Proof: dehomogenise and apply `IsAlgClosed.dvd_iff_roots_le_roots`; descend using a basis of
  `L/K` containing `1`. This is the algebra behind Morton–Silverman's identification of zero-cycles on
  `ℙ¹` with forms.
- **`periodForm φ n`** (`DY.3/period-form`). `Φₙ(φ) = Y·Fₙ − X·Gₙ` over any commutative ring;
  homogeneous of degree `dⁿ + 1` (`periodForm_isHomogeneous`), `Φ₀ = 0` (`periodForm_zero`), nonzero for
  morphisms of degree `≥ 2` and `n ≥ 1` (`periodForm_ne_zero`), and for a monic polynomial `f` with lift
  `(Y^d f(X/Y), Y^d)` its dehomogenisation is `fⁿ(X) − X` (`aeval_periodForm_polynomialLift`). Four
  properties are promoted to lemma nodes because other nodes use them:
  **zero locus** (`DY.3/period-form-zero-locus`, `eval_periodForm_eq_zero_iff`: `Φₙ(P) = 0` iff
  `φⁿ(P) = P`); **iterates** (`DY.3/period-form-of-an-iterate`, `periodForm_liftIterate`:
  `Φₖ(φᵐ) = Φₘₖ(φ)` exactly, Morton–Silverman's "trivial fact" `Z_{md}(φ) = Z_d(φᵐ)`); **conjugation**
  (`DY.3/period-form-conjugation`, `periodForm_conj`: for `A ∈ GL₂(K)` and `ψ = A⁻¹∘φ∘A`,
  `Φₙ(ψ) = det(A)⁻¹·Φₙ(φ)(A·(X, Y))`, hence `a_P(ψ, n) = a_{AP}(φ, n)`); **base change**
  (`DY.3/period-form-base-change`, `periodForm_map`: `Φₙ` commutes with every ring homomorphism on
  coefficients, in particular with reduction). Unit tests: for `z²` with lift `(X², Y²)`,
  `Φ₁ = Y·X² − X·Y²`; `Φ₀ = 0`; for `z² + c`, `Φ₁(X, 1) = X² − X + c`; the identity lift has `Φ₁ = 0`.

### Multiplicities

- **`periodicMultiplicity φ n P`** (`DY.3/multiplicity-of-a-periodic-point`): `a_P(n) := ord_P Φₙ(φ)`,
  Morton–Silverman's coefficient of `P` in `Zₙ(φ) = Δ·Γ(φⁿ)`; on `ℙ¹` the paper identifies `Zₙ` with the
  root cycle of (21), and that identification is taken as the definition, so no intersection theory is
  needed. API: `periodicMultiplicity_pos_iff` (positive iff `φⁿ(P) = P`),
  `periodicMultiplicity_liftIterate` (`a_P(φᵐ, k) = a_P(φ, mk)`), `sum_periodicMultiplicity` (over an
  algebraically closed field the multiplicities of the zeros of `Φₙ` add up to `dⁿ + 1`). Unit tests:
  for `z² − z`, `a₀(2) = 3` and `a₀(1) = 1` (Morton–Silverman's `Z₂ = 3(0) + (2) + (∞)`); `a_{[2:1]}(1) = 0`
  for `z²`; for a polynomial map of degree `≥ 2`, `a_∞(n) = 1`.
- **`essentialMultiplicity φ n P`** (`DY.3/essential-multiplicity`):
  `a*_P(n) := Σ_{d∣n} μ(n/d)·a_P(d) ∈ ℤ`, the coefficient of `P` in the dynatomic cycle (Morton–Silverman's
  "cycle of essential n-periodic points", Hutz's "n-th dynatomic cycle"). API: `essentialMultiplicity_one`,
  `sum_essentialMultiplicity_divisors` (`a_P(n) = Σ_{d∣n} a*_P(d)`, Hutz's Proposition 4.1(3)),
  `essentialMultiplicity_eq_of_minimalPeriod_eq`, and the promoted `essentialMultiplicity_of_minimalPeriod`
  and `essentialMultiplicity_nonneg`. Unit tests: `a*₀(2) = 2` for `z² − z`; `a*_{−1/2}(2) = 2` for `z² − 3/4`;
  `a*_P(1) = a_P(1)`; and the repelling fixed point `1` of `z²` (multiplier 2) has `a*₁(2) = 0`.

### The local computation at a fixed point

Morton–Silverman compute multiplicities in a uniformiser at the fixed point. Here the point is moved to
`0 = [0 : 1]` by a conjugation (DY.0) and the computation is done in `K⟦z⟧`:

- **`fixedPointGerm φ`** (`DY.3/fixed-point-germ`): for `F(0, 1) = 0 ≠ G(0, 1)`, the germ
  `g_φ = F(z, 1)·G(z, 1)⁻¹ ∈ K⟦z⟧`; its linear coefficient is the multiplier `λ = φ′(0)` of
  `ArithmeticDynamics:DY.2/multiplier-of-a-periodic-cycle`. **`germIterate g n`** is the `n`-fold substitution
  iterate (`PowerSeries.subst`). API: `germIterate_succ`, `coeff_one_germIterate` (the chain rule:
  the linear coefficient of `gⁿ` is `λⁿ`), `constantCoeff_fixedPointGerm`, `fixedPointGerm_polynomialLift`
  (the germ of a polynomial lift is the polynomial), `fixedPointGerm_conj_invariant_coeff_one` (the
  multiplier is unchanged by `z ↦ uz`), and the promoted `fixedPointGerm_liftIterate`. Unit tests: the
  germ of `z² − z` is `−z + z²`; the identity lift has germ `z`; `z²` has linear coefficient `0`.
- **Germ of an iterate** (`DY.3/germ-of-an-iterate`): the germ of the composite lift `φⁿ` is `(g_φ)ⁿ`
  (substitution is an algebra homomorphism commuting with inverses of units).
- **Multiplicity = order** (`DY.3/multiplicity-equals-germ-order`): at `[0 : 1]`,
  `a(n) = ord_z(gⁿ(z) − z)`, because `Φₙ(z, 1) = Gₙ(z, 1)·(gⁿ(z) − z)` with `Gₙ(z, 1)` a unit.
- **Four germ lemmas** (Morton–Silverman, Lemma 3.4 and (8)–(12)): **multiplier criterion**
  (`DY.3/germ-order-multiplier-criterion`: `ord(gⁿ − z) = 1` iff `λⁿ ≠ 1`); **monotonicity**
  (`DY.3/germ-order-monotone`: `ord(gⁿ − z) ≥ ord(g − z)`); **parabolic iterates**
  (`DY.3/germ-order-parabolic-iterate`: if `g = z + z^e u`, `e ≥ 2`, `u(0) ≠ 0`, then
  `gⁿ = z + n z^e u + O(z^{2e−1})`, so the order is `e` when `n ≠ 0` in `K` and `≥ 2e − 1` when `n = 0` in `K`);
  **rotation congruence** (`DY.3/germ-order-rotation-congruence`: if `λ` is a primitive `r`-th root of unity,
  `r ≥ 2`, then `r ∣ ord(gʳ − z) − 1`, proved by comparing the `z^s` coefficients of `gʳ∘g = g∘gʳ`; in
  particular `ord(gʳ − z) ≥ r + 1 ≥ 3`, which is the dimension-one content of Hutz's Theorem 3.1).
- **Reduction to a fixed point** (`DY.3/essential-multiplicity-of-an-iterate`, Morton–Silverman (11)): for
  `P` of exact period `m`, `a*_P(φ, n) = a*_P(φᵐ, n/m)` if `m ∣ n` and `0` otherwise; non-periodic points
  have `a* ≡ 0`.
- **The multiplicity profile** (`DY.3/multiplicity-profile-at-a-fixed-point`): at a fixed point with
  multiplier of order `r` in characteristic `p`, `a(k) = 1` if `r = 0` or `r ∤ k`, and
  `a(k) = B(vₚ(k/r))` if `r ∣ k`, where `B(a) = a(r·pᵃ)`; moreover `B(0) ≥ 2`, `B` is nondecreasing, and in
  characteristic `p > 0`, `B(a + 1) ≥ 2B(a) − 1`.
- **The Möbius transform of a profile** (`DY.3/moebius-transform-of-a-multiplicity-profile`, pure
  arithmetic): for such a profile,
  `Σ_{k∣N} μ(N/k) a(k) = [N = 1] + [N = r]·(B(0) − 1) + Σ_{a≥1} [N = r·pᵃ]·(B(a) − B(a − 1))`.
  This packages Morton–Silverman's cases 1–5 of the proof of Proposition 3.2 into one identity.

### Effectivity, formal periods and the dynatomic polynomial

- **Theorem (effectivity; Morton–Silverman 1995, Theorem 3.1 and Proposition 3.2(a); Hutz, Theorem 2.20)**
  (`DY.3/dynatomic-cycle-effective`, `essentialMultiplicity_nonneg`). For a morphism lift of degree
  `d ≥ 2` over any field, `a*_P(n) ≥ 0` for all `n ≥ 1` and all `P` (over `K̄` by base change). Proof:
  reduce to a fixed point, conjugate it to `0`, and read the sign off the Möbius formula above.
- **Theorem (classification of formal periods; Morton–Silverman, Proposition 3.2(b))**
  (`DY.3/formal-period-classification`, `isOfFormalPeriod_zero_iff`, stated at `[0 : 1]`). With `m` the
  exact period, `r` the order of the multiplier of the cycle and `p` the characteristic: `a*_P(n) ≥ 1` iff
  `n = m`, or `n = m·r` (and if `r = 1`, `a*_P(m) ≥ 2`), or `p > 0` and `n = m·r·pᵉ` with `e ≥ 1`, in which case
  `a*_P(n) ≥ 2^{e−1}(a_P(mr) − 1)`.
- **`IsOfFormalPeriod φ n P`** (`DY.3/formal-and-exact-period`, interface id): `0 < a*_P(n)`. API:
  `IsOfFormalPeriod.iterate_eq` (formal period `n` implies `φⁿ(P) = P`), `IsOfFormalPeriod.minimalPeriod_dvd`
  (the exact period, Mathlib's `Function.minimalPeriod`, divides `n`), `isOfFormalPeriod_one_iff` (formal
  period one iff fixed), `isOfFormalPeriod_of_minimalPeriod_eq` (promoted as
  `DY.3/exact-period-is-formal-period`: exact period `n` implies `a*_P(n) = a_P(n) ≥ 1`),
  `isOfFormalPeriod_zero_iff`, `eval_dynatomicForm_eq_zero_iff`. Unit tests: for `z² − 3/4`, `−1/2` has formal
  period `2` and exact period `1`; for `z² − z`, `0` has formal period `2`; `1` has formal period `1` for `z²`;
  in characteristic 0, `−1/2` does not have formal period `3` for `z² − 3/4`.
- **Theorem (characteristic zero)** (`DY.3/formal-period-classification-char-zero`): a point of exact period
  `m` and formal period `n > m` has `n = m·r` with multiplier a primitive `(n/m)`-th root of unity; so a
  point has at most two formal periods.
- **Theorem (multiplicity one; Hutz, Theorem 3.1)** (`DY.3/simple-formal-periodic-point-has-exact-period`):
  if `n ≠ 0` in `K` and `a*_P(n) = 1` then `P` has exact period `n`. Proof: the classification leaves
  `n ∈ {m, m·r}`, and `a*_P(m·r) = ord(gʳ − z) − 1 ≥ r ≥ 2` by the rotation congruence.
- **Theorem (disjointness; Morton–Silverman, Corollary 3.3)** (`DY.3/disjoint-supports-of-dynatomic-cycles`):
  if `n₁ ∤ n₂` and `n₂ ∤ n₁`, `Z*_{n₁}` and `Z*_{n₂}` have disjoint supports.
- **`dynatomicForm φ n`** (`DY.3/dynatomic-polynomial`, interface id, planet). `Φ*ₙ(φ)` is the unique
  binary form whose image in the fraction field of `K[X, Y]` is `∏_{m∣n} Φₘ^{μ(n/m)}`; the Lean prototype is
  total (junk `0` when no such form exists). API: `algebraMap_dynatomicForm` (the Möbius product),
  `prod_dynatomicForm_divisors` (`∏_{m∣n} Φ*ₘ = Φₙ`), `binaryFormOrder_dynatomicForm`
  (`ord_P Φ*ₙ = a*_P(n)`), `eval_dynatomicForm_eq_zero_iff` (zeros = points of formal period `n`),
  `dynatomicForm_one` (`Φ*₁ = Φ₁`), `dynatomicForm_map` (field homomorphisms), `dynatomicForm_isHomogeneous`,
  `aeval_dynatomicForm_polynomialLift`. Unit tests: for `z² + c`, `Φ*₂ = X² + XY + (c + 1)Y²`; `Φ*₁ = Φ₁`;
  for `z²` and `n ≥ 2` the dehomogenised `Φ*ₙ` is the product of Mathlib's `Polynomial.cyclotomic k` over
  the `k ∣ 2ⁿ − 1` in which `2` has order `n` (so `Φ*₂ = Φ₃ = z² + z + 1`); at `c = −3/4`,
  `Φ*₂ = (X + Y/2)²` is a square.
- **Theorem (Φ*ₙ is a polynomial)** (`DY.3/dynatomic-polynomial-is-polynomial`): the Möbius product lies in
  `K[X, Y]`, `∏_{m∣n} Φ*ₘ = Φₙ` and `ord_P Φ*ₙ = a*_P(n)`. Proof by strong induction: the product of the
  `Φ*ₘ` over proper divisors has order `a_P(n) − a*_P(n) ≤ a_P(n)` everywhere (effectivity), so divides `Φₙ`
  over `K̄` and hence over `K`; multiplicative Möbius inversion identifies the quotient.
- **Degree** (`DY.3/dynatomic-polynomial-degree`): `Φ*ₙ` has degree `Σ_{m∣n} μ(n/m)(dᵐ + 1) = ν_d(n) + [n = 1]`,
  `ν_d(n) = Σ_{m∣n} μ(n/m)dᵐ`; for `d = 2`, `ν₂(1), …, ν₂(7) = 2, 2, 6, 12, 30, 54, 126`.

### Good reduction

- **Theorem (reduction of Φ*ₙ; Morton–Silverman, Theorem 4.1)** (`DY.3/dynatomic-polynomial-reduction`): for
  a lift over a discrete valuation ring with good reduction (`ArithmeticDynamics:DY.0/good-reduction-of-a-rational-map`:
  the normalised reduction has no common zero), `Φ*ₙ(φ_K)` has an integral model, unique up to a unit,
  whose reduction is `Φ*ₙ(φ̃)`; in cycle language `Z̃*ₙ(φ) = Z*ₙ(φ̃)`. Proof: `Φₙ` commutes with reduction and
  has unit content; Gauss's lemma for the primitive models; Möbius inversion over the residue field.
- **Theorem (period constraint)** (`DY.3/good-reduction-period-constraint`): if `P ∈ ℙ¹(K)` has exact period `n`,
  its reduction has exact period `m` for `φ̃`, the multiplier of the reduced cycle has order `r` and the residue
  characteristic is `p`, then `n ∈ {m, m·r, m·r·pᵉ}`. Proof: `P` has formal period `n`; by effectivity and the
  reduction theorem `P̃` occurs in `Z*ₙ(φ̃)`; apply the classification over the residue field. Acceptance:
  for `z² − 7/4` the possible periods are `{1, 2}` mod 3, `{1, 2, 8}` mod 5 and `{1, 2, 3, 6}` mod 7, so every
  rational periodic point has period 1 or 2 (Hutz 2015, Example 1).

### Polynomial maps and the dynatomic curve

- **`dynatomicPolynomial f n`** (`DY.3/dynatomic-polynomial-of-a-polynomial-map`): for a monic `f ∈ R[z]` of
  degree `d ≥ 2` over any commutative ring, `Φ*₀ = 1` and `Φ*ₙ = (fⁿ(z) − z) /ₘ ∏_{m∣n, m<n} Φ*ₘ` (Mathlib's
  monic division). API: `dynatomicPolynomial_zero`, `dynatomicPolynomial_one` (`= f − z`),
  `dynatomicPolynomial_monic`, `natDegree_dynatomicPolynomial` (`= ν_d(n)`), `map_dynatomicPolynomial`
  (commutes with ring homomorphisms), and the promoted `prod_dynatomicPolynomial_divisors`,
  `aeval_dynatomicForm_polynomialLift`. Unit tests: `Φ*₂(z² + c) = z² + z + c + 1`; `Φ*₀ = 1`; the cyclotomic
  identity for `z²` over `ℤ`; `Φ*₂(z² − z) = z²` (degree 2, root the fixed point 0).
- **Theorem** (`DY.3/dynatomic-polynomial-of-a-polynomial-map-product`): `∏_{m∣n} Φ*ₘ(f) = fⁿ(z) − z` for
  monic `f` of degree `≥ 2` over any commutative ring (field case from the homogeneous theorem; domains by the
  fraction field; general rings from the universal monic polynomial over `ℤ[a₀, …, a_{d−1}]`).
- **Lemma** (`DY.3/dynatomic-polynomial-dehomogenisation`): over a field, the homogeneous `Φ*ₙ` of the lift
  `(Y^d f(X/Y), Y^d)` dehomogenises to `Φ*ₙ(f)`; `∞` has essential multiplicity `[n = 1]`.
- **`unicriticalDynatomic d n`** (`DY.3/unicritical-dynatomic-polynomial`): `Φ*ₙ(x, c) ∈ ℤ[c][x]` for the family
  `x^d + c`; monic in `x` of degree `ν_d(n)`, and specialising `c ↦ c₀` gives `Φ*ₙ(x^d + c₀)`
  (`map_unicriticalDynatomic`). Unit tests: `Φ*₁ = x² − x + c`, `Φ*₂ = x² + x + c + 1`, `Φ*₀ = 1`, and
  `deg Φ*₄ = 12` (Morton's `Φ₄`).
- **`DynatomicCurveRing d n`** (`DY.3/dynatomic-curve`, planet): the coordinate ring `ℤ[c][x]/(Φ*ₙ(x, c))` of
  the dynatomic curve `Y₁(n)`. API: `nonempty_dynatomicCurveRing_hom_iff` (points in a ring `L` are the pairs
  `(x₀, c₀)` with `Φ*ₙ(x₀, c₀) = 0`; over a field, `x₀` of formal period `n` for `x^d + c₀`),
  `dynatomicCurveRing_sigma` (the automorphism `σ : x ↦ x^d + c`, with `σⁿ = id`). Unit tests: `(−1/2, −3/4)`
  is a rational point of `Y₁(2)`; `(0, 0) ∈ Y₁(1)`; `(0, 0) ∉ Y₁(2)` since `Φ*₂(0, 0) = 1`. The smooth projective
  model `X₁(n)` and the quotient `X₀(n) = X₁(n)/⟨σ⟩` of Flynn–Poonen–Schaefer, Poonen and Stoll are named, not
  built: they need curve theory (normalisation, genus) owned by `SchemeAndStackFoundations:SF.3` and the Tau
  Ceti algebraic-curves roadmap.
- **Theorem (Bousch; Buff–Tan; Gao–Ou)** (`DY.3/unicritical-dynatomic-curve-smooth-irreducible`): over `ℂ`,
  `Φ*ₙ(x, c)` is irreducible and `Φ*ₙ = 0` is a nonsingular affine curve. Gao–Ou prove that the closure of
  `Xₙ = {(c, z) : z of exact period n, multiplier ≠ 1}` is smooth and irreducible; that closure is `V(Φ*ₙ)` by
  the characteristic-zero classification. The proof uses Thurston's contraction principle for quadratic
  differentials and kneading sequences, which no roadmap of the atlas plans; this input is recorded as a gap.
  No other node of this layer consumes the theorem.
- **Application (the acceptance example)** (`DY.3/lower-period-root-of-a-dynatomic-polynomial`):
  `Φ*₂(z² − 3/4) = (z + 1/2)²`, so `−1/2` has `a*(2) = 2` but exact period 1, with multiplier `−1`; likewise
  `Z*₂(z² − z) = 2(0)`; `(−1/2, −3/4)` is a rational point of `Y₁(2)` that does not come from a 2-cycle
  (Flynn–Poonen–Schaefer, §2).

### Northcott finiteness and an explicit height bound

- **Theorem (height bound)** (`DY.3/height-bound-for-preperiodic-points`): over a number field `L`, if the
  forms `F₀, F₁` of degree `d ≥ 2` admit a Nullstellensatz certificate `Σⱼ q(k, j)Fⱼ = X_k^{M+d}` (forms `q` of
  degree `M`), every preperiodic point has `h(P) ≤ C/(d − 1)` with `C = log(2^{[L:ℚ]}·max(H(q), 1))`, the
  explicit constant of `Height.logHeight_eval_ge`. Proof: `h(f(P)) ≥ d·h(P) − C`, applied at the point of
  maximal height in the finite forward orbit. For a morphism the certificate exists with `M = d − 1` from the
  resultant identity of `ArithmeticDynamics:DY.0/resultant-of-a-rational-map`. This is Hutz's Proposition 3,
  made adelic; the canonical height is not needed.
- **Theorem (Northcott, rational points)** (`DY.3/finiteness-of-rational-preperiodic-points`,
  `finite_preperiodicPts`): a morphism of `ℙ¹` of degree `≥ 2` over a number field has finitely many
  `L`-rational preperiodic points (height bound + `NumberField.finite_setOfPred_mulHeight₁_le`).
- **Theorem (Northcott, bounded degree; Call–Silverman, Corollary 1.1.1(b))**
  (`DY.3/finiteness-of-bounded-degree-preperiodic-points`, planet): for every `D`, the preperiodic points
  `P ∈ ℙ¹(L̄)` with `[L(P) : L] ≤ D` are finite. It consumes
  `ArithmeticDynamics:DY.1/zero-canonical-height-iff-preperiodic` and
  `ArithmeticDynamics:DY.1/northcott-for-preperiodic-points`.
- **Theorem (denominators for `z^d + c`; Hutz 2015, Lemma 7, preperiodic form)**
  (`DY.3/unicritical-preperiodic-valuation-lemma`): for a nonarchimedean valuation `v` and `α` preperiodic for
  `z^d + c`: `v(c) < 0` forces `v(c) = d·v(α)`, and `v(c) ≥ 0` forces `v(α) ≥ 0`. Over `ℚ`: `den(α)^d = den(c)`,
  and if `den(c)` is not a `d`-th power there is no finite rational preperiodic point.
- **Lemma (archimedean bound)** (`DY.3/unicritical-preperiodic-archimedean-bound`): preperiodic points of
  `z^d + c`, `d ≥ 2`, satisfy `|x| ≤ 1 + |c|` (beyond that radius `|fⁿ(x)|` strictly increases).
- **Theorem (odd degree; Narkiewicz, via Hutz 2015, Theorem 3)** (`DY.3/odd-degree-unicritical-preperiodic-points`):
  for odd `d ≥ 3` every rational preperiodic point of `z^d + c` is fixed, there are at most three, and
  `#PrePer(z^d + c, ℙ¹(ℚ)) ≤ 4`.

### Certified enumeration

- **`orbitRepeatsWithin f S N seen x`** (`DY.3/orbit-repetition-check`): iterate from `x` for at most `N`
  steps inside a finite set `S`, returning `true` at the first repetition and `false` on leaving `S` or running
  out of fuel. API: `orbitRepeatsWithin_sound` (true implies preperiodic), `orbitRepeatsWithin_complete`
  (with `S ⊇ PrePer(f)` and fuel `|S| + 1`, preperiodic implies true), `orbitRepeatsWithin_false_of_not_mem`.
  Unit tests: a fixed point is found with fuel 2; the orbit of `0` under `n ↦ n + 1` leaves `{0, …, 4}`; the
  3-cycle `0 ↦ 1 ↦ 2 ↦ 0` is found with fuel 4; fuel 0 gives `false`.
- **`preperiodicFilter f S`** (`DY.3/preperiodic-points-from-candidates`): `S` filtered by the check with
  fuel `|S| + 1`. API: `preperiodicFilter_subset`, `preperiodicFilter_mono_sound`, and the promoted
  `mem_preperiodicFilter_iff`. Unit tests: `z²` on `{−2, …, 2}` gives `{−1, 0, 1}`; `∅` gives `∅`; a translation
  on `{−3, …, 3}` gives `∅`.
- **Theorem (correctness)** (`DY.3/preperiodic-filter-correct`): if `S` contains every preperiodic point, the
  filter returns exactly the preperiodic points (soundness, and the pigeonhole principle
  `Finset.exists_ne_map_eq_of_card_lt_of_maps_to` for completeness).
- **`unicriticalCandidates d c`** (`DY.3/unicritical-candidate-box`): the rationals `a/b` with `b^d = den c`
  and `|a| ≤ ⌈b(1 + |c|)⌉`. API: the promoted containment lemma `mem_unicriticalCandidates_of_preperiodic`
  (`DY.3/unicritical-candidate-box-contains-preperiodic-points`, from the valuation lemma and the archimedean
  bound), `card_unicriticalCandidates_le`. Unit tests: `c = 0`, `d = 2` gives `{−1, 0, 1}`; `c = 1/2` gives `∅`;
  for `c = −29/16` every candidate has denominator dividing 4.
- **`unicriticalRationalPreperiodic d c`** (`DY.3/unicritical-rational-preperiodic-points`): the filter on the
  box; computable on `ℚ`. API: `unicriticalRationalPreperiodic_subset`, `mem_unicriticalRationalPreperiodic_iff`.
  Unit tests: eight points for `c = −29/16` (Poonen's maximum, nine with `∞`); `{−2, −1, 0, 1, 2}` for `c = −2`;
  `∅` for `c = 1`; `{−1, 0, 1}` for `z³`.
- **Theorem (certified enumeration for `z^d + c`)** (`DY.3/unicritical-rational-preperiodic-enumeration-correct`,
  planet): for `d ≥ 2`, `x ∈ unicriticalRationalPreperiodic d c` iff `x` is preperiodic for `z^d + c`.
- **`ratPointsOfHeightLE H`** (`DY.3/rational-points-of-bounded-height`): the points `[a : b]` of `ℙ¹(ℚ)` with
  `|a|, |b| ≤ H`. API: `mem_ratPointsOfHeightLE_iff` (membership iff Mathlib's `Height.mulHeight v ≤ H`),
  `ratPointsOfHeightLE_mono`. Unit tests: four points of height `≤ 1`; none of height `≤ 0`; `[1 : 2]` has
  height 2.
- **Theorem (enumeration over `ℚ`)** (`DY.3/rational-preperiodic-enumeration-over-Q`): with a certificate and
  `H ≥ exp(log(2·max(H(q), 1))/(d − 1))`, `PrePer(f, ℙ¹(ℚ)) = preperiodicFilter f (ratPointsOfHeightLE H)`.
- **Theorem (enumeration over a number field)** (`DY.3/rational-preperiodic-enumeration-over-a-number-field`):
  the same with the exact carrier of `ComputationalNumberTheory:CN.0` (decidable equality) and a certified
  enumeration of the points of height `≤ C/(d − 1)` from `EffectiveDiophantineMethods:ED.0`.

### Rational cycles and preperiodic points of `z² + c` over `ℚ`

Every quadratic polynomial over `ℚ` is linearly conjugate to some `z² + c`. Exact periods are Mathlib's
`Function.minimalPeriod` on `ℚ`; a point of type `(m, n)` enters an `m`-cycle after exactly `n` steps.

- **Theorem (periods 1, 2, 3; Walde–Russo, Morton, as stated by Poonen 1995, Theorem 1)**
  (`DY.3/quadratic-rational-cycles-of-length-at-most-three`): a rational fixed point exists iff
  `c = 1/4 − ρ²`; a rational point of exact period 2 iff `c = −3/4 − σ²`, `σ ≠ 0`; a rational point of exact
  period 3 iff `c = −(τ⁶ + 2τ⁵ + 4τ⁴ + 8τ³ + 9τ² + 4τ + 1)/(4τ²(τ + 1)²)` with `τ ∉ {0, −1}`, the cycle being
  explicit and `τ = x + f(x)`; at most one rational 3-cycle (Morton 1992, Theorem 3). The inverse `τ = x + f(x)`
  is verified by reduction modulo `Φ*₃`.
- **Theorem (Morton 1998, Theorem 4)** (`DY.3/morton-no-rational-four-cycles`): no rational 4-cycles. Route:
  `Φ*₄(x, c) = 0` is birational to `v² = u(u² + 1)(1 + 2u − u²)` (a model of `X₁(16)`), whose rational points are
  `(0, 0)`, `(±1, ±2)`, `∞`; the affine curve `Φ₄ = 0` is nonsingular (a Gröbner-basis certificate), so rational
  points are degree-one places, all of which are poles of `x` or `c`.
- **Theorem (Flynn–Poonen–Schaefer, Theorem 1)** (`DY.3/flynn-poonen-schaefer-no-rational-five-cycles`): no
  rational 5-cycles. Route: the trace curve `τ₅ = 0`, FPS's substitutions to
  `C : y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1` (genus 2), `J(C)(ℚ) ≅ ℤ` (2-descent) and Chabauty at 3 giving
  six rational points; the rational points outside the domain of the substitutions have
  `c ∈ {−4/3, −2, −64/9, −16/9}`, and for all resulting `c` the certified enumeration finds no 5-cycle.
- **Theorem (Stoll, Theorem 6; conditional)** (`DY.3/stoll-conditional-no-rational-six-cycles`): if the
  Jacobian `J` of `X₀^dyn(6)` has Mordell–Weil rank 3, there are no rational 6-cycles. The hypothesis is
  explicit; Stoll derives it from the weak Birch–Swinnerton-Dyer conjecture for `J` and analytic continuation of
  `L(J, s)`, which is not consumed. No Lean statement is suggested (Jacobians are absent from Mathlib).
- **Theorems (Poonen 1995, Theorems 2–3)**: `DY.3/poonen-period-combinations` (periods 1 and 2 together iff
  `c = −(3µ⁴ + 10µ² + 3)/(4(µ² − 1)²)`; a 3-cycle excludes periods 1 and 2, via the six rational points of models
  of `X₁(18)` and `X₁(13)`); `DY.3/poonen-type-m-one` (type `(m, 1)` iff `−x` is a nonzero point of period `m`);
  `DY.3/poonen-type-one-two` (type `(1, 2)` iff `c = −2(η² + 1)/(η² − 1)²`, via `E24`); `DY.3/poonen-type-two-two`
  (type `(2, 2)` iff `c = −(ν⁴ + 2ν³ + 2ν² − 2ν + 1)/(ν² − 1)²`, via `E40`); `DY.3/poonen-type-three-two` (type
  `(3, 2)` iff `c = −29/16`, via the genus-2 curve `y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1`, a 2-descent with Poonen's
  erratum and Chabauty at 3); `DY.3/poonen-type-exclusions` (via `E15`, `E17`); `DY.3/poonen-no-long-tails` (no
  type `(m, n)` with `m ≤ 3 ≤ n`, via `E11 = X₁(11)`).
- **`PoonenConjecture`** (`DY.3/poonen-conjecture`): the proposition that no `z² + c`, `c ∈ ℚ`, has a rational
  point of exact period `≥ 4`. API: `PoonenConjecture.minimalPeriod_le_three`, `card_quadratic_preperiodic_le_eight`.
  Unit tests: `−1/4` has exact period 3 for `z² − 29/16`; the conjecture implies Morton's statement; the same
  statement with 3 in place of 4 is false.
- **Theorem (Poonen 1995, Corollary 1)** (`DY.3/poonen-preperiodic-bound`): under Poonen's conjecture,
  `z² + c` has at most eight finite rational preperiodic points (nine with `∞`), attained at `c = −29/16` and
  `c = −21/16`.

### The uniform boundedness conjecture

- **`UniformBoundednessConjecture d D`** (`DY.3/uniform-boundedness-conjecture`, planet): Morton–Silverman's
  conjecture that for `N ≥ 1`, `d ≥ 2`, `D ≥ 1` there is `C(N, d, D)` bounding `#PrePer(φ, ℙᴺ(K))` for every
  morphism `φ` of degree `d` over every number field `K` with `[K : ℚ] ≤ D` (the Lean prototype states
  `N = 1`, with `Set.encard` so that infinite sets are not bounded). It is a proposition with no consumer
  except explicit hypotheses; for each fixed map finiteness is Northcott's theorem (`finite_preperiodicPts`).
  API: `UniformBoundednessConjecture.mono`, `finite_preperiodicPts`. Unit tests: it holds trivially for
  `D = 0`; it fails in degree 1 (the identity); any constant in degree 2 over `ℚ` is at least 9 (`z² − 29/16`).

### Dependencies

- Inside the roadmap: `ArithmeticDynamics:DY.0` (rational-map carrier, iterates, conjugacy, resultant and its
  Nullstellensatz certificate, good reduction), `ArithmeticDynamics:DY.1` (`zero-canonical-height-iff-preperiodic`,
  `northcott-for-preperiodic-points`), and `ArithmeticDynamics:DY.2` (`multiplier-of-a-periodic-cycle`, over
  any field including residue fields; this adds the edge DY.2 → DY.3). DY.3 supplies DY.5 (Galois theory of
  periodic points and dynatomic Galois groups) and DY.6 (dynamical modular curves in families; the frontier
  register, where uniform boundedness stays conjectural).
- Other roadmaps: `ComputationalNumberTheory:CN.0` (exact number-field carrier with decidable equality) and
  `EffectiveDiophantineMethods:ED.0` (certified bounded-height enumeration) for the number-field enumeration;
  `EffectiveDiophantineMethods:ED.3` (Mordell–Weil groups and rank-zero point lists: `C₀(5)`, `C₁(3₂)`, `E11`, `E15`,
  `E17`, `E24`, `E40`, Morton's `Y² = 4X³ − 11X² + 8X`, the models of `X₁(13)`, `X₁(16)`, `X₁(18)`, Stoll's
  saturation) and `EffectiveDiophantineMethods:ED.4` (Chabauty–Coleman for `C₀(5)`, `C₁(3₂)` and `X₀^dyn(6)`) for the
  rational-cycle theorems. No Tau Ceti layer is consumed.

### Acceptance tests

- **Lower exact period, nontrivial multiplicity.** For `z² − 3/4`: `Φ*₂ = (z + 1/2)²`, `a*_{−1/2}(2) = 2`,
  exact period of `−1/2` is 1, multiplier `−1`; `(−1/2, −3/4) ∈ Y₁(2)(ℚ)`. For `z² − z`: `Z*₂ = 2(0)`.
- **Characteristic `p`.** For a germ `g = z + z²` over `𝔽₃`, `ord(g² − z) = 2` and `ord(g³ − z) ≥ 3`, so the
  third formal period of `0` is of type (iii).
- **Cyclotomic compatibility.** For `z²`, `Φ*ₙ` is the product of cyclotomic polynomials `Φ_k` with
  `ord_k(2) = n`.
- **Morton's `Φ₄`.** `Φ*₄(x, c)` is Morton's degree-12 polynomial (verified by computer algebra), and
  `Φ*₁Φ*₂Φ*₄ = f⁴(x) − x`.
- **Certified enumeration.** For `c = −29/16` and `c = −21/16` the enumeration returns the eight points
  `±1/4, ±3/4, ±5/4, ±7/4`; for `c ∈ {−4/3, −16/9, −64/9}` it returns `∅`; for `z³` it returns `{−1, 0, 1}`.
- **Period constraint.** For `z² − 7/4` reduction modulo 3, 5 and 7 leaves only periods 1 and 2.
- **Conjectures stay conjectures.** `UniformBoundednessConjecture` and `PoonenConjecture` occur only as
  hypotheses (in `DY.3/poonen-preperiodic-bound`); Stoll's theorem carries its rank hypothesis explicitly.

---

## DY.4 Equidistribution and small points

This layer builds the theory of adelic heights on the projective line and proves that points of
small height equidistribute at every place. The primary theorem is the equidistribution theorem for
adelic measures on P¹ (Favre–Rivera-Letelier, Theorem 6; proved independently by Baker–Rumely and
Chambert-Loir), in the form given by Favre and Rivera-Letelier's energy method. It is decomposed down
to the local potential theory of the analytic line, which TropicalAndBerkovichArithmetic TB.6 (with
TB.1 for the Berkovich line) supplies, and to Mathlib. The equivalent statement for semipositive
adelic metrics on O_{P¹}(1) is derived from it. Yuan's equidistribution theorem for semipositive
adelic line bundles on projective varieties is stated with all its hypotheses; its global Arakelov
inputs are recorded as gaps. On top of the P¹ theory the layer builds the Arakelov–Zhang pairing
(Zhang; Petsche–Szpiro–Tucker; Fili; DeMarco–Krieger–Ye), the dynamical energy, and the dynamical
applications: canonical heights are adelic heights, dynamically small points equidistribute, two maps
with infinitely many common preperiodic points have the same canonical height and canonical measures,
and postcritically finite parameters of z^D + c equidistribute to the harmonic measure of the
Multibrot set.

The boundaries are these. The Laplacian, potentials, mutual energy and its positivity, test functions
and local Chambert-Loir measures belong to TB.6 (and the Berkovich line to TB.1); this layer consumes
them through requests and builds only the regularisation estimates specific to the equidistribution
proof. Escape rates, local canonical heights and canonical measures of a single map belong to DY.2,
canonical heights to DY.1. The Lattès-specific energy estimates of DeMarco–Krieger–Ye, the critical
height and the uniform unlikely-intersection results belong to DY.6. The Bogomolov small-points theorem
for abelian varieties belongs to HeightsRationalPointsAndObstructions RP.5, which consumes Yuan's
theorem stated here.

### Conventions

- **Places and weights.** K is a number field and v runs over its places (Mathlib's
  NumberField.InfinitePlace K and NumberField.FinitePlace K). C_v is ℂ at an infinite place and the
  completion of an algebraic closure of K_v at a finite place over p (isometric to PadicComplex p),
  with |·|_v extending the standard absolute value of ℚ (|p|_v = 1/p). An embedding ι_v : K̄ → C_v
  over K → K_v is fixed; |x|_v := |ι_v x|_v. The weight is r_v = [K_v : ℚ_v]/[K : ℚ]; then
  r_v log|a|_v = [K : ℚ]⁻¹ log ‖a‖_v with Mathlib's normalised place value ‖·‖_v (w(a)^{mult w} at an
  infinite place, the FinitePlace value at a finite place), the product formula reads
  Σ_v r_v log|a|_v = 0 for a ∈ K^×, and Σ_{v infinite} r_v = 1.
- **The analytic line.** P¹_v^an is the Riemann sphere P¹(ℂ) at an infinite place and the Berkovich
  projective line over C_v at a finite place; P¹(K̄) maps to it by ι_v (type I points) and ∞ ↦ ∞. The
  kernel δ_v is |x − y| on ℂ and the Hsia kernel relative to ∞ on A¹_v^an (δ_v(S, S′) = diam(S ∨ S′),
  Favre–Rivera-Letelier's sup{S, S′}); δ_v(ι x, ι y) = |x − y|_v.
- **Circle measures and the standard measure.** For a ∈ K̄ and r > 0, m_{a,r,v} is normalised arc
  length on |z − a| = r at an infinite place and the Dirac mass at ζ_{a,r} (the sup-norm on the disc
  D(a, r)) at a finite place. The standard measure is λ_v := m_{0,1,v}: Haar measure on the unit circle,
  resp. the Dirac mass at the Gauss point.
- **Laplacian and potentials** (from TB.6). The sign is Favre–Rivera-Letelier's and DeMarco–Krieger–Ye's:
  Δ log δ_v(·, y) = δ_y − δ_∞, so Δ log⁺|z|_v = λ_v − δ_∞ (the negative of the convention of
  Baker–Rumely and Petsche–Szpiro–Tucker). A probability measure ρ on P¹_v^an has a continuous potential
  if g(z) = ∫ log δ_v(z, w) dρ(w) − log⁺|z|_v extends continuously to P¹_v^an; then g(∞) = 0 and
  ρ − λ_v = Δg.
- **Mutual energy** (from TB.6). (µ, ν)_v = −∫∫ log δ_v(z, w) dµ(z) dν(w) with the diagonal of type I
  points omitted; so ([x], [y])_v = −log|x − y|_v for x ≠ y and the energy of a finite set is
  ([F], [F])_v = −|F|⁻² Σ_{x≠y} log|x − y|_v, while (δ_ζ, δ_ζ)_v = −log diam ζ at a type II/III point
  and (m_{x,r}, m_{x,r})_v = −log r. Pairs involving ∞ contribute nothing.
- **Galois-stable sets.** A finite F ⊂ P¹(K̄) is Galois-stable if σ(F) = F for all σ ∈ Gal(K̄/K);
  [F]_v := |F|⁻¹ Σ_{x∈F} δ_{ι_v x}, independent of ι_v. Heights of points are heights of their Galois
  orbits.
- **Weil height.** h(x) := NumberField.absLogHeight₁ x for x ∈ K̄ and h(∞) := 0.
- **Metrics on O(1).** Homogeneous coordinates (x₀ : x₁), affine coordinate z = x₀/x₁, ∞ = (1 : 0).
  The section x₁ has divisor ∞ and x₀ has divisor 0. The standard metric is
  ‖s(x)‖_st = |s(x₀, x₁)|_v / max(|x₀|_v, |x₁|_v); an adelic metric is ‖·‖_v = ‖·‖_st e^{−φ_v} with φ_v
  continuous on P¹_v^an and zero at all but finitely many places, so −log‖x₁‖_v(z) = log⁺|z|_v + φ_v(z).
- **The Arakelov–Zhang pairing** is normalised as in DeMarco–Krieger–Ye: a normalised height has
  h·h = 0, and for normalised heights h₁·h₂ = ½ Σ_v r_v (µ₁ − µ₂, µ₁ − µ₂)_v ≥ 0.
- **Canonical metrics** depend on a homogeneous lift F of f; replacing F by aF twists φ_v by
  log|a|_v/(d − 1), which leaves heights and pairings unchanged.

### What is already built, and what is imported

Nothing of this layer is in Mathlib or Tau Ceti (the audit finds no equidistribution theorem, no adelic
metric and no local measure). The layer uses these Mathlib declarations, each read at 082e2d3:
NumberField.InfinitePlace, NumberField.FinitePlace, NumberField.InfinitePlace.mult,
NumberField.prod_abs_eq_one (the product formula), NumberField.absLogHeight₁ and
NumberField.logHeight₁_eq (the Weil height), AlgebraicClosure, IsAlgClosed.lift, minpoly, PadicComplex,
OnePoint, circleAverage_log_norm_sub_const_eq_log_radius_add_posLog (Jensen's formula for a circle:
the circle average of log|z − a| over |z − c| = R is log max(R, |c − a|)), MeasureTheory.Measure.dirac,
MeasureTheory.ProbabilityMeasure and MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto
(weak convergence), CompactSpace.uniformContinuous_of_continuous, AlgebraicGeometry.Scheme,
AlgebraicGeometry.IsIntegral, IsClosed and Set.Finite. From the DiophantineApproximationAndTranscendence
packet it uses DT.0/northcott-absolute-height (Northcott over ℚ̄ for bounded degree) and
DT.0/abs-mul-height-eq-rpow (the absolute height computed in any number field).

It requests from TropicalAndBerkovichArithmetic TB.6, at every place (the archimedean place being the
Riemann sphere, as DeMarco–Krieger–Ye's accepted source route assigns it): the Laplacian with the
normalisation above, uniqueness of potentials up to constants and self-adjointness; potentials g_ν of
measures with continuous potential and their continuity; the mutual energy with its bilinearity,
symmetry, the Fubini formula (µ, ν)_v = −∫ g_µ dν, the values listed above, and PGL₂(C_v)-invariance
for mass-zero measures; positivity (ν, ν)_v ≥ 0 for mass-zero ν with continuous potential, with
equality only for ν = 0; a dense class D_v of test functions with Dirichlet form ⟨φ, φ⟩_v and the
Cauchy–Schwarz inequality |∫ φ dν|² ≤ ⟨φ, φ⟩_v (ν, ν)_v; continuous metrics on O(1)^an over P¹ and
their Chambert-Loir measures c₁ = λ_v + Δφ of total mass 1, with semipositivity equivalent to positivity
of c₁ and the Gauss-point mass as the curvature of the standard model; and, on a projective variety of
dimension n, the Chambert-Loir measure c₁(L̄)^n of a semipositive metric, positive of total mass
deg_L X, with density of model functions. It requests from TB.1 the Berkovich line with its points
ζ_{a,r}, the seminorm formula ζ_{a,r}(c Π(T − a_i)) = |c| Π max(|a − a_i|, r), the Gauss point, density
of type I points, the Hsia kernel, the hyperbolic metric and the chordal metric (for which rational maps
are Lipschitz); from TB.0 the analytification X^an of a
projective variety; and from SchemeAndStackFoundations SF.5 the degree deg_L X.

From sibling layers it uses the interface objects DY.0/rational-map-of-the-projective-line (lifts,
iteration), DY.0/good-reduction-of-a-rational-map (good reduction at almost all places),
DY.0/moduli-space-of-rational-maps (M_d and M_d^cm), DY.1/canonical-height-on-the-projective-line
(ĥ_f − h bounded, ĥ_f∘f = dĥ_f, Galois invariance, ĥ_f ≥ 0, ĥ_f = lim d^{−n}h∘fⁿ),
DY.1/zero-canonical-height-iff-preperiodic, DY.2/escape-rate and DY.2/local-canonical-height
(with DY.2/escape-rate-scale-lift, DY.2/escape-rate-of-good-reduction, DY.2/escape-rate-trivial-at-almost-all-places, DY.2/local-canonical-height-functional-equation and DY.2/local-decomposition-of-canonical-height: G_F(cz) = G_F(z) + log|c|, G_F∘F = dG_F, G_{aF} = G_F + log|a|/(d − 1), G_F = log max(|z|, |w|) at good
reduction, and the decomposition ĥ_f(x) = Σ_v r_v |O|⁻¹ Σ_y G_{F,v}(ỹ)), DY.2/canonical-measure
(µ_{f,v} with Δλ_{F,v} = µ_{f,v} − δ_∞, invariance f_*µ = µ and f^*µ = dµ, µ = λ_v at good reduction,
conjugation equivariance, support the Julia set; with DY.2/archimedean-canonical-measure,
DY.2/canonical-measure-invariance and DY.2/canonical-measure-of-good-reduction), DY.0/critically-marked-moduli-space,
DY.2/multiplier-of-a-periodic-cycle, and DY.3/formal-and-exact-period (a map of degree ≥ 2 has
infinitely many periodic points).

### DY.4a Local potential theory and regularisation

- **`AnalyticLine` (analytic-line-at-a-place, construction).** The data above at one place: the compact
  space P¹_v^an, the absolute value |·|_v on K̄, the type I points, the kernel δ_v, the circle measures and
  the weight. Constructors `AnalyticLine.ofInfinitePlace`, `AnalyticLine.ofFinitePlace` and the family
  `NumberFieldPlace.analyticLine`. API: `AnalyticLine.infty`; `AnalyticLine.kernel_embed`
  (δ_v(ι x, ι y) = |x − y|_v); `AnalyticLine.kernel_symm`; `AnalyticLine.potential_circle`
  (∫ log δ_v(ι z, w) dm_{a,r}(w) = log max(|z − a|_v, r) for r > 0); `AnalyticLine.weight_mul_log_eq`
  (compatibility with Mathlib's place values); `NumberFieldPlace.sum_weight_infinite`;
  `NumberFieldPlace.sum_weight_mul_log_eq_zero` (product formula); `AnalyticLine.compactSpace`. Unit
  tests: δ(ι 1, ι 3) = 1/2 at the place 2 of ℚ; the potential of m_{0,1} is log⁺|z|_v; every weight is
  1 over ℚ; at a finite place m_{0,1} is not the Dirac mass at a type I point.
- **`AnalyticLine.standard` (standard-measure-at-a-place, definition).** λ_v = m_{0,1,v}. API: its
  potential is log⁺|z|_v; (λ_v, λ_v)_v = 0; ([x], λ_v)_v = −log⁺|x|_v; λ_v has continuous potential;
  invariance under z ↦ uz with |u|_v = 1. Unit tests: (λ, λ) = 0; ([2], λ_∞) = −log 2; λ_v ≠ δ_0; at a
  finite place λ_v gives measure 0 to the type I points.
- **`IsGaloisStableFinset`, `galoisOrbitFinset`, `AnalyticLine.orbitMeasure` (galois-orbit-measure,
  construction).** API: `isGaloisStableFinset_galoisOrbitFinset` (the orbit is the smallest stable set
  containing x); `card_galoisOrbitFinset` (|Gal·x| = deg minpoly_K x); `AnalyticLine.orbitMeasure_univ`
  (mass 1); `AnalyticLine.integral_orbitMeasure`; `IsGaloisStableFinset.union`. Unit tests: [{x}] = δ_x;
  the orbit of √2 over ℚ is {√2, −√2}; {√2} is not stable; the orbit of an element of K is itself.
- **`AnalyticLine.regularised` (regularised-measure-of-a-finite-set, construction).**
  [F]_{v,r} = |F|⁻¹ Σ_{x∈F} m_{x,r,v} for a finite F ⊂ K̄ (Fili's circle regularisation at infinite
  places, Favre–Rivera-Letelier's projection π_r at finite places). API: potential
  |F|⁻¹ Σ log max(|z − x|_v, r); `AnalyticLine.energy_circle_circle`
  ((m_{x,r}, m_{y,r})_v = −log max(|x − y|_v, r)); continuous potential; [F]_{v,r} → [F]_v as r → 0;
  [{0}]_{v,1} = λ_v. Unit tests: [{0}]_{v,1} = λ_v; (m_{x,1/2}, m_{x,1/2}) = log 2; no atoms at type I
  points; far from F the potential equals that of [F].
- **Lemmas.** Regularised self-energy bound: ([F]_r, [F]_r)_v ≤ ([F], [F])_v + (−log r)/|F|.
  Regularisation modulus: for continuous g, ω_g(r) := sup_{x∈K̄} |∫ g dm_{x,r} − g(ι x)| → 0 as r → 0
  (Heine–Cantor at infinite places; a compactness argument with the seminorm formula at finite places),
  and ω_g(r) ≤ C r^κ for κ-Hölder g. Pairing estimate: for ρ with continuous potential g and 0 < r < 1,
  |([F], ρ)_v − ([F]_r, ρ)_v| ≤ ω_g(r) + ε_v(r), with ε_v(r) = r at infinite and 0 at finite places.
  Energy lower bound: ([F] − ρ, [F] − ρ)_v ≥ ([F]_r − ρ, [F]_r − ρ)_v − 2(ω_g(r) + ε_v(r)) − (−log r)/|F|
  ≥ −2(ω_g(r) + ε_v(r)) − (−log r)/|F|. Nonnegativity at standard places: at a finite place
  (λ_v − [F], λ_v − [F])_v ≥ (2/|F|²) Σ log⁺|x|_v ≥ 0 (false at infinite places: F = {±1} gives
  −½ log 2).
- **Local equidistribution criterion (theorem).** If ρ has continuous potential, |F_n| → ∞ and
  limsup_n ([F_n ∖ {∞}] − ρ, [F_n ∖ {∞}] − ρ)_v ≤ 0, then [F_n]_v → ρ weakly. Proof: the regularised
  differences have energy ≤ 2(ω_g(r) + ε_v(r)) + o(1), Cauchy–Schwarz for the Dirichlet form controls
  test functions of D_v, regularisation moves integrals of test functions by ω_φ(r), and D_v is dense.

### DY.4b Adelic measures, heights and the equidistribution theorem on P¹

- **`AdelicMeasure` (adelic-measure, definition; planet "Adelic measure").** A family ρ = (ρ_v) of
  probability measures on the analytic lines, equal to λ_v off a finite set N(ρ) of places, each with a
  continuous potential g_{ρ,v} (normalised g_{ρ,v}(∞) = 0). Base change to L/K sets ρ_w := ρ_v for
  w | v. API: `AdelicMeasure.standard`, `AdelicMeasure.exceptionalPlaces`, `AdelicMeasure.potential`,
  `AdelicMeasure.potential_eq_zero`, `AdelicMeasure.ext`, `AdelicMeasure.baseChange`,
  `AdelicMeasure.not_atom` (no mass on type I points). Unit tests: N(λ) = ∅; the Gauss-radius measure
  (δ_{ζ_{0,p}} at p, standard elsewhere) is adelic with potential log max(|z|_p, p) − log⁺|z|_p; a Dirac
  mass at a type I point is not allowed; differing from λ at every prime is not allowed.
- **`AdelicMeasure.height` (adelic-height-of-a-galois-stable-set, definition).**
  h_ρ(F) = ½ Σ_v r_v ([F]_v − ρ_v, [F]_v − ρ_v)_v for Galois-stable F, and h_ρ(x) := h_ρ(Gal·x)
  (`AdelicMeasure.heightAt`); finitely many nonzero terms, independent of K and ι_v. API:
  `height_finite`, `heightAt_galois`, `height_baseChange`, `height_eq_average`
  (h_ρ(F) = |F|⁻¹ Σ_{x∈F} h_ρ(x)), `heightAt_infty` (h_ρ(∞) = ½ Σ_v r_v (ρ_v, ρ_v)_v), `heightAt_standard`
  (h_λ = absLogHeight₁). Unit tests: h_λ(2) = log 2; h_λ(∞) = 0; for the Gauss-radius measure at a place
  of weight r_v and radius R, h(∞) = −½ r_v log R and h(0) = ½ r_v log R; h_λ({2} ∪ {3}) is the average
  (log 2 + log 3)/2, not the sum.
- **Theorems.** Product formula for the energy of a finite set: Σ_v r_v ([F]_v, [F]_v)_v = 0 for
  Galois-stable F (the discriminant Π_{x≠y}(x − y) lies in K^×; DeMarco–Krieger–Ye (2.16) with its sign
  corrected). Decomposition (Favre–Rivera-Letelier Lemma 5.3): h_ρ(∞) = ½ Σ r_v (ρ_v, ρ_v)_v and
  h_ρ(F) = h_ρ(∞) − Σ_v r_v (ρ_v, [F]_v)_v for F ⊂ K̄. Comparison: h_λ = absLogHeight₁ on K̄ and
  h_λ(∞) = 0. Weil height (Proposition 5.2): |h_ρ(x) − h_ρ(∞) − h(x)| ≤ Σ_{v∈N(ρ)} r_v sup|g_{ρ,v}|.
  Mahler formula (Proposition 1.3): h_ρ(α) = h_ρ(∞) + deg(α)⁻¹ Σ_v r_v ∫ log|P|_v dρ_v with P the
  minimal polynomial of α over K and |P|_v(S) = S(P) on the Berkovich line (by multiplicativity of the
  seminorm). Small sets grow: Galois-stable sets of bounded height, each occurring finitely often, have
  |F_n| → ∞ (Northcott over ℚ̄).
- **Equidistribution of small points on P¹ (theorem; planet).** For an adelic measure ρ and
  Galois-stable finite sets F_n ⊂ P¹(K̄), each finite set occurring for only finitely many n, with
  limsup h_ρ(F_n) ≤ 0: h_ρ(F_n) → 0 and [F_n]_v → ρ_v weakly at every place. In particular the Galois
  orbits of pairwise distinct points x_n with h_ρ(x_n) → 0 equidistribute to ρ_v. Proof: the sets grow;
  local energies are ≥ 0 at standard places and asymptotically ≥ 0 elsewhere (regularisation); so every
  local energy tends to 0 and the local criterion applies. (The hypothesis "each set occurs finitely
  often" replaces "pairwise distinct" so that Galois orbits of distinct points qualify.)
- **Essential minimum (theorem).** {x : h_ρ(x) < −ε} is finite for every ε > 0.
- **Quantitative equidistribution (theorem).** If the potentials of ρ at the places of N(ρ) satisfy
  ω(r) ≤ C₀ r^κ (0 < κ ≤ 1), there is C such that for every place v, every test function φ with
  Dirichlet norm ⟨φ, φ⟩_v and |∫ φ dm_{x,r} − φ(x)| ≤ Λ r, and every Galois-stable F ⊂ K̄ with |F| ≥ 2:
  |∫ φ d[F]_v − ∫ φ dρ_v| ≤ Λ |F|^{−1/κ} + (⟨φ, φ⟩_v r_v⁻¹ (2h_ρ(F) + C log|F|/|F|))^{1/2}. This is
  Favre–Rivera-Letelier Theorem 7 with the square root, the factor 2 and the weight restored.
- **Bilu's theorem (application).** Pairwise distinct α_n with h(α_n) → 0 equidistribute to the Haar
  measure on the unit circle at infinite places and to the Gauss point at finite places.
- **`IsGenericSequence` (generic-sequence, definition).** On an integral scheme of finite type, no
  proper closed subset contains infinitely many terms; small means h(x_n) → h_L̄(X). API:
  `isGenericSequence_iff_finite_fibres` (on a curve: each point occurs finitely often),
  `IsGenericSequence.comp_strictMono`, `IsGenericSequence.map_dominant`,
  `not_isGenericSequence_of_forall_mem`. Unit tests: a constant sequence is not generic; an injective
  sequence of closed points of an integral curve is generic; points on a line in the plane are not
  generic; on a point every sequence is generic.

### DY.4c Adelic metrics on O(1) and the Arakelov–Zhang pairing

- **`AdelicMetric` (adelic-metrized-line-bundle-on-p1, definition).** φ = (φ_v) continuous on the
  analytic lines, zero at almost all places. API: `AdelicMetric.standard`, `AdelicMetric.twist` (add
  constants c_v), `AdelicMetric.average` ((‖·‖₁‖·‖₂)^{1/2}), `AdelicMetric.ext`,
  `AdelicMetric.negLogNormX1` (−log‖x₁‖_v = log⁺|z|_v + φ_v), `AdelicMetric.support_finite`,
  `AdelicMetric.toContinuousMetric` (TB.6's continuous metric). Unit tests: −log‖x₁‖ = log⁺ for the
  standard metric; the Gauss-radius metric log max(|z|_v, R) − log⁺|z|_v has φ(∞) = 0 and φ(0) = log R;
  averaging the standard metric with itself; φ_p = 1 at every prime is not adelic.
- **`AdelicMetric.curvature` (curvature-measures-of-an-adelic-metric, construction).**
  µ_{φ,v} = λ_v + Δφ_v, of total mass 1 = deg O(1), characterised by Δ(−log‖s‖_v) = µ_{φ,v} − δ_{div s};
  φ is semipositive (`AdelicMetric.IsSemipositive`) when every µ_{φ,v} is positive, and then µ_φ is an
  adelic measure with potential φ_v − φ_v(∞). API: `potential_curvature`, `curvature_standard`,
  `curvature_twist`, `curvature_mass`, `curvature_eq_chambertLoir`. Unit tests: the standard metric has
  curvature λ; the Gauss-radius metric has curvature m_{0,R,v}; constants do not change curvature; minus
  the Gauss-radius metric (R > 1) is not semipositive.
- **`AdelicMetric.height` (height-of-an-adelic-metrized-line-bundle, definition).**
  h_φ(x) = Σ_v r_v |O|⁻¹ Σ_{y∈O}(−log‖s(y)‖_v) for any K-rational s nonvanishing on O; equivalently
  h(x) + Σ_v r_v |O|⁻¹ Σ_y φ_v(y), and h_φ(∞) = Σ_v r_v φ_v(∞). API: `height_eq_of_section`,
  `height_standard`, `height_twist` (+Σ r_v c_v), `height_average`, `height_sub_weil_bounded`,
  `height_galois`. Unit tests: h(2) = log 2 for the standard metric; h_φ(∞) = Σ r_v φ_v(∞); a constant at
  one place shifts heights by r_v c; the Gauss-radius metric has h(0) = r_v log R ≠ 0.
- **`AdelicMeasure.metric` (adelic-metric-of-an-adelic-measure, construction).** The normalised metric
  φ^ρ_v = g_{ρ,v} + ½(ρ_v, ρ_v)_v: semipositive, curvature ρ, φ^ρ_v(∞) = ½(ρ_v, ρ_v)_v, φ^λ = 0; every
  semipositive metric is φ^{µ_φ} + c (`AdelicMetric.eq_metric_curvature_add_const`). Theorem:
  h_{φ^ρ} = h_ρ. Unit tests: φ^λ = 0; φ^ρ(∞) = −½ log R for the Gauss-radius measure; curvature of φ^ρ is
  ρ; omitting the constant changes heights by ½ r_v log R.
- **`AdelicMetric.pairing` (arakelov-zhang-pairing, definition; planet "Arakelov–Zhang pairing").** For
  semipositive φ₁, φ₂: Ō₁·Ō₂ = Σ_v r_v [φ_{2,v}(∞) + ∫(log⁺|z|_v + φ_{1,v}) dµ_{2,v}], the value of
  Zhang's h₁((u)) + h₂((s)) + Σ_v r_v ∫ log‖s‖₁⁻¹ Δ(log‖u‖₂⁻¹) at s = x₁, u = x₀. API: `pairing_comm`,
  `pairing_eq_energy` (Ō₁·Ō₂ = Σ_v r_v [φ_{1,v}(∞) + φ_{2,v}(∞) − (µ_{1,v}, µ_{2,v})_v]), `pairing_twist`,
  `pairing_average`, `pairing_standard`, `pairing_eq_sections` (independence of the sections). Unit
  tests: standard·standard = 0; the Gauss-radius metric has self-pairing r_v log R; twisting by c adds
  2Σ r_v c_v to the self-pairing; the pairing is not a function of the curvatures alone.
- **Lemmas.** Energy formula and symmetry (above). Independence of sections (Petsche–Szpiro–Tucker
  (11)–(12) with the product formula). A semipositive metric satisfies φ = φ^µ + c with
  Σ r_v c_v = ½ Ō·Ō, h_φ = h_µ + ½ Ō·Ō, and Ō^ρ·Ō^ρ = 0.
- **`AdelicMeasure.pairing` (arakelov-zhang-pairing-of-adelic-measures, definition).**
  ⟨ρ, σ⟩ = ½ Σ_v r_v (ρ_v − σ_v, ρ_v − σ_v)_v, with local terms `AdelicMeasure.localPairing`. API:
  `pairing_comm`, `pairing_self`, `pairing_eq_heights` (⟨ρ, σ⟩ = h_ρ(∞) + h_σ(∞) − Σ r_v (ρ_v, σ_v)_v),
  `pairing_standard` (⟨ρ, λ⟩ = h_ρ(∞) + Σ_v r_v ∫ log⁺|z|_v dρ_v), `pairing_eq_metric_pairing`
  (⟨ρ, σ⟩ = Ō^ρ·Ō^σ). Unit tests: ⟨λ, λ⟩ = 0; ⟨ρ, λ⟩ = ½ r_v log R for the Gauss-radius measure (the
  hyperbolic distance from ζ_{0,1} to ζ_{0,R}, halved); symmetry; ⟨·,·⟩ is not bilinear.
- **Theorems.** For normalised semipositive metrics Ō₁·Ō₂ = ⟨µ₁, µ₂⟩. Nonnegativity and nondegeneracy:
  ⟨ρ, σ⟩ ≥ 0 with equality iff ρ = σ. Fili's metric: ⟨·,·⟩^{1/2} is a metric on adelic measures, with the
  triangle inequality used as DeMarco–Krieger–Ye (7.3). Limit formula (Fili Theorem 9;
  DeMarco–Krieger–Ye (1.3)): if h_ρ(F_n) → 0 along Galois-stable sets each occurring finitely often, then
  h_σ(F_n) → ⟨ρ, σ⟩. Common small points (Fili Theorem 2): if Z(ρ) ∪ Z(σ) is infinite
  (Z(ρ) = {h_ρ ≤ 0}), then ⟨ρ, σ⟩ = 0 ⇔ ρ = σ ⇔ h_ρ = h_σ ⇔ Z(ρ) = Z(σ) ⇔ Z(ρ) ∩ Z(σ) infinite ⇔ some
  distinct x_n have h_ρ(x_n) + h_σ(x_n) → 0; the hypothesis is needed (equilibrium measures of [−1, 1]
  and [−1/2, 1/2]). Zhang's inequality on P¹: liminf h_φ(x_n) ≥ ½ Ō·Ō along distinct points, so
  {h_φ ≤ b} is finite for b < ½ Ō·Ō, and {h₁ + h₂ ≤ b} is finite for b < ½ Ō₁·Ō₂ (DeMarco–Krieger–Ye
  Proposition 1.8). Equidistribution for semipositive adelic metrics on O(1): a generic sequence with
  h_φ(x_n) → ½ Ō·Ō equidistributes to µ_{φ,v} = c₁(Ō_v)/deg O(1) at every place.
- **`AdelicMeasure.ofFiniteSet` (regularised-adelic-measure-of-a-finite-set, construction).** For a
  Galois-stable F ⊂ K̄ and radii η_v (η_v = 1 at almost all places), m_{F,η} = ([F]_{v,η_v})_v is adelic
  (λ_v at the finite places where F is integral and η_v = 1); its normalised height h_{F,η} has local
  heights α_v + |F|⁻¹ Σ_x log max(|z − x|_v, η_v) with α_v = ½(m_v, m_v)_v, h_{F,η}·h_{F,η} = 0, and
  (m_v, m_v)_v ≤ ([F]_v, [F]_v)_v + (−log η_v)/|F|. Unit tests: F = {0}, η = 1 gives λ; for F = {0, 1} and
  η_∞ = 1/4 the archimedean self-energy is (log 4)/2; radii 1/2 at every prime are not adelic; the
  potential formula. Theorem (DeMarco–Krieger–Ye Proposition 7.3, general form):
  ⟨ρ, m_{F,η}⟩ ≤ h_ρ(F) + Σ_v r_v [−(ρ_v, m_{F,η,v})_v + (ρ_v, [F]_v)_v + (−log η_v)/(2|F|)].

### DY.4d The general theorem

**Equidistribution for semipositive adelic line bundles (Yuan, Theorem 3.1; planet "Yuan's
equidistribution theorem").** Let X be a projective variety of dimension n ≥ 1 over a number field K and
L̄ an ample line bundle with a semipositive adelic metric (at every place a uniform limit of semipositive
model metrics, and one model metric at almost all places). Put h_L̄(X) = ĉ₁(L̄)^{n+1}/((n + 1) deg_L X)
and h_L̄(x) = ĉ₁(L̄|_x̄)/deg x. For every generic sequence (x_m) in X(K̄) with h_L̄(x_m) → h_L̄(X) and every
place v, the Galois-orbit measures converge weakly on X_v^an to c₁(L̄_v)^n/deg_L X, which is a
probability measure because c₁(L̄_v)^n has total mass deg_L X. The proof is the variational principle:
twist the metric at v by e^{−εf}, obtain small sections of N·L̄(εf) from Yuan's arithmetic Siu
inequality, combine with Zhang's successive-minima inequality along the generic sequence, expand
ĉ₁(L̄(εf))^{n+1} to first order in ε, and let ε → 0 for f and −f. The local measures and model
approximation come from TB.6, X_v^an from TB.0 and deg_L X from SF.5; the global Arakelov theory
(adelic intersection numbers, heights of subvarieties, successive minima, arithmetic Siu) is gap G1–G2.
Genericity is necessary: torsion points of an abelian subvariety B ⊊ A equidistribute to the Haar
measure of B. For (P¹, O(1)) the theorem is the P¹ theorem of DY.4c, which does not depend on the gaps.

### DY.4e Dynamical applications

- **`RationalMap.canonicalAdelicMeasure` (construction).** For f of degree d ≥ 2 over K, ρ_f = (µ_{f,v})_v
  is an adelic measure (continuous potentials from DY.2; µ_{f,v} = λ_v where f has good reduction). API:
  `canonicalAdelicMeasure_apply`, `canonicalAdelicMeasure_eq_standard_of_goodReduction`,
  `canonicalAdelicMeasure_iterate` (ρ_{fⁿ} = ρ_f), `canonicalAdelicMeasure_conj`,
  `canonicalAdelicMeasure_invariant`. Unit tests: ρ_{z^d} = λ; ρ_{f∘f} = ρ_f; for σ_α(z) = α − (α − z)²
  and |α|_v > 1 at a finite place, ρ_{σ_α,v} = δ_{ζ_{α,1}}; (z² − z)/p at p is not standard.
- **`RationalMap.canonicalMetric` (construction).** φ^{f,F}_v = G_{F,v}(z, 1) − log⁺|z|_v, i.e.
  −log‖x₁‖_{f,v} = λ_{F,v}; semipositive with curvature ρ_f and height ĥ_f. API:
  `canonicalMetric_isSemipositive`, `curvature_canonicalMetric`, `height_canonicalMetric`,
  `canonicalMetric_smul` (twist by log|a|_v/(d − 1)), `canonicalMetric_eq_zero_of_goodReduction`,
  `canonicalMetric_functional_equation` (‖s∘f‖ = Π ‖s_j‖). Unit tests: for z^d it is the standard metric
  with height absLogHeight₁; scaling the lift leaves heights unchanged; for z² + c with |c|_v > 1,
  φ_v(0) = ½ log|c|_v; hence that metric is not standard.
- **Theorems.** Self-intersection zero: Ō_f·Ō_f = 0 (Petsche–Szpiro–Tucker Proposition 10, from
  invariance of µ_f and ĥ_f∘f = dĥ_f). Canonical heights are adelic heights: ĥ_f = h_{ρ_f}
  (Favre–Rivera-Letelier Theorems 4/8). **Dynamical equidistribution (planet).** Pairwise distinct
  x_n with ĥ_f(x_n) → 0 have Galois orbits equidistributed to µ_{f,v} at every place (Baker–Rumely
  Theorem 2.3). Iterated preimages: for z₀ with infinite backward orbit, the sets f^{−n}(Gal·z₀) are
  pairwise distinct and equidistribute. Periodic points: along any sequence (n_k) with pairwise distinct
  sets Fix(f^{n_k}) (such sequences exist since periodic points are infinite in number), these sets
  equidistribute.
- **`RationalMap.azPairing` (dynamical-arakelov-zhang-pairing, definition).** ⟨f, g⟩ = ⟨ρ_f, ρ_g⟩ =
  Ō_f·Ō_g. API: `azPairing_comm`, `azPairing_self`, `azPairing_nonneg`, `azPairing_eq_metric_pairing`,
  `azPairing_sq_eq` (⟨z², g⟩ = ĥ_g(∞) + Σ_v r_v ∫ log⁺|z|_v dµ_{g,v}), `azPairing_iterate`,
  `azPairing_conj`. Unit tests: ⟨z², z³⟩ = 0; ⟨z², 2 − (2 − z)²⟩ = log 2 over ℚ;
  ⟨z², 1 − (1 − z)²⟩ = (3√3/4π) L(2, χ₋₃) ≈ 0.323067; vanishing does not imply equality of maps.
- **`RationalMap.localEnergy` (local-dynamical-energy, definition).** E_v(f, g) = ½(µ_{f,v} − µ_{g,v},
  µ_{f,v} − µ_{g,v})_v = ½(∫(λ_f − λ_g) dµ_g + ∫(λ_g − λ_f) dµ_f). API:
  `localEnergy_eq_localHeights`, `localEnergy_nonneg` (≥ 0, zero iff µ_{f,v} = µ_{g,v}),
  `localEnergy_comm`, `localEnergy_conj`, `azPairing_eq_sum_localEnergy` (⟨f, g⟩ = Σ_v r_v E_v).
  Unit tests: E_v(z², z³) = 0; E_v(z², σ_α) = log|α|_v at a finite place with |α|_v > 1 and log|α| at
  an infinite place with |α| ≥ 2; E_v(f, f) = 0.
- **Theorems.** Petsche–Szpiro–Tucker Theorem 1: distinct x_n with ĥ_g(x_n) → 0 have ĥ_f(x_n) → ⟨f, g⟩.
  **Vanishing of the dynamical pairing (planet).** ⟨f, g⟩ ≥ 0, and ⟨f, g⟩ = 0 ⇔ ĥ_f = ĥ_g ⇔
  Preper(f) = Preper(g) ⇔ Preper(f) ∩ Preper(g) infinite ⇔ some distinct x_n have
  ĥ_f(x_n) + ĥ_g(x_n) → 0 ⇔ µ_{f,v} = µ_{g,v} at every place. Common preperiodic points (Baker–DeMarco
  Theorem 1.2 over number fields; Mimar): infinitely many common preperiodic points force equal
  preperiodic sets, canonical heights and canonical measures, hence equal Julia sets. Periodic-point
  averages: along sequences with distinct sets Fix(g^{n_k}), the averages of ĥ_f converge to ⟨f, g⟩; the
  average counted with multiplicity over all dⁿ + 1 solutions (Petsche–Szpiro–Tucker Theorem 2) converges
  to ⟨f, g⟩ given gap G5. Height difference: ĥ_ψ(x) − h(x) ≤ ⟨z², ψ⟩ + log 2 for all x (sharper than
  Petsche–Szpiro–Tucker Theorem 15 by ĥ_ψ(∞) ≥ 0); the example ψ = 1 − (1 − z)², x = −1 shows that
  log 2 cannot be lowered below log 2 − 0.3231. Hölder potentials: the potential of µ_{f,v} − λ_v is
  κ-Hölder for the chordal metric with κ = log d/log M, M a Lipschitz constant of f (telescoping the
  escape rate; Favre–Rivera-Letelier Proposition 6.5). Quantitative preimages: at an infinite place, for z
  outside the forward critical orbits, |d^{−n} Σ_{fⁿ(α)=z} φ(α) − ∫ φ dµ_{f,v}| ≤ C Lip(φ)((ĥ_f(z) + n)/dⁿ)^{1/2}.

### DY.4f Postcritically finite parameters

- **`multibrotGreen`, `multibrotAdelicMeasure` (multibrot-adelic-measure, construction).** For D ≥ 2 and
  P_c(z) = z^D + c: G_{M,v}(c) = lim D^{−(n−1)} log⁺|P_cⁿ(0)|_v, equal to log⁺|c|_v at finite places and to
  the Green function of the Multibrot set M_D (capacity 1) at the infinite place, G_M = G_{P_c}(c) =
  D·G_{P_c}(0). The adelic measure µ_{M_D} is the harmonic measure of M_D at ∞ and λ_p at every prime; its
  potential is G_M and its potentials are Hölder. API: `multibrotGreen_finite`,
  `multibrotGreen_eq_escapeRate`, `multibrotAdelicMeasure_potential`, `multibrotAdelicMeasure_holder`,
  `multibrotAdelicMeasure_heightAt_infty` (= 0). Unit tests: G_{M,p}(c) = log⁺|c|_p; G_M(0) = 0; the
  normalisation D^{−n} gives D⁻¹ log⁺|c|_p, a measure of mass 1/D; µ_{M_D,p} = λ_p.
- **Theorems.** h_{µ_{M_D}}(c) = ĥ_{P_c}(c) = D·ĥ_{P_c}(0), zero iff c is postcritically finite.
  Equidistribution of PCF parameters: Galois orbits of distinct PCF parameters (or Galois-stable sets of
  them, each occurring finitely often) equidistribute to the harmonic measure of M_D and to λ_p at every
  prime; for D = 2 this is Levin's theorem for centres of hyperbolic components, proved arithmetically.
  Quantitatively |[F](φ) − µ_{M_D}(φ)| ≤ C Lip(φ)(log|F|/|F|)^{1/2}. In the moduli space M_d^cm with
  ĥ_crit([f]) = Σ_i ĥ_f(c_i(f)), ĥ_crit is the height of a nondegenerate nef adelic line bundle whose
  archimedean curvature is the bifurcation current, and generic sequences of PCF parameters equidistribute
  to the normalised bifurcation measure (Gauthier; Yuan–Zhang); this statement rests on gaps G3–G4, and
  its one-parameter slice z^D + c is the theorem above.

### Gaps

- G1: adelic line bundles on projective varieties over number fields, their arithmetic intersection
  numbers and heights of subvarieties, and Zhang's successive minima (for Yuan's theorem).
- G2: Yuan's arithmetic Siu inequality (for Yuan's theorem).
- G3: Yuan–Zhang adelic line bundles on quasi-projective varieties and their equidistribution theorem
  (for the moduli-space PCF theorem).
- G4: bifurcation currents on M_d^cm and nonvanishing of the bifurcation measure (same theorem).
- G5: finiteness of parabolic cycles and bounded multiplicities of periodic points (for the
  multiplicity form of Petsche–Szpiro–Tucker Theorem 2).

None of these affects the P¹ theory of DY.4a–c, the dynamical applications of DY.4e other than the
multiplicity average, or the unicritical PCF theorem.

### Corrections to the sources used here

Favre–Rivera-Letelier (arXiv v2): the Cauchy–Schwarz inequalities (32)–(33) lack the squares, so
Theorems 3, 5, 7 and Corollaries 1.4, 1.6 need a square root of the bracket (E501); the proof of
Theorem 7 bounds the local term by h_ρ(F) instead of 2h_ρ(F) and drops the weight N_v (E502); Lemma 6.3
uses |P_cⁿ(0)| = |c|^{Dⁿ} instead of |c|^{D^{n−1}}, so the Multibrot measure needs the normalisation
D^{−(n−1)} and Lemma 6.4 reads h_{M_D}(c) = h_{P_c}(c) (E503); the example (42) has 2^{2n} for 2ⁿ
(E504); pairwise distinctness of periodic-point sets for large n is asserted without proof (E505); the
proof of Proposition 4.12 has η(ε) for 2η(ε) (E506); Corollary 1.6 averages over preimages with
multiplicity, which Theorem 7 covers only off the postcritical set (E508). DeMarco–Krieger–Ye: the sign
in (2.16) (E507) and the positivity statement of §2.7, which holds for (ν, ν) with ν of mass 0 (E509).
A corrigendum to Favre–Rivera-Letelier exists (Math. Ann. 339 (2007)) but could not be read.

### Dependencies

Inside the roadmap: DY.0 (rational maps, good reduction, M_d and M_d^cm), DY.1 (canonical heights and
their zeros), DY.2 (escape rates, local canonical heights, canonical measures, multipliers), DY.3
(infinitely many periodic points). Other roadmaps: TropicalAndBerkovichArithmetic TB.6 (local potential
theory, energies, test functions, metrics and Chambert-Loir measures), TB.1 (the Berkovich line), TB.0
(analytifications), SchemeAndStackFoundations SF.5 (degrees), DiophantineApproximationAndTranscendence
DT.0 (Northcott over ℚ̄, the absolute height in any number field). HeightsRationalPointsAndObstructions
RP.0 enters through the Mathlib baseline of absolute heights, as RS-03 narrows it. Consumers: DY.6
(Lattès heights, their pairings and energy estimates, the critical height, unlikely intersections),
HeightsRationalPointsAndObstructions RP.5 (Yuan's theorem for abelian varieties), and the proposed
ArithmeticDynamicsPartIIBifurcation (equidistribution of PCF parameters).

### Acceptance tests

- The standard adelic measure gives Mathlib's absolute logarithmic Weil height: h_λ(2) = log 2 =
  absLogHeight₁ 2 and h_λ(∞) = 0; the Mahler formula gives h(1/2) = log 2 and h(√2) = ½ log 2.
- The n-th roots of unity equidistribute to the Haar measure on the unit circle (their unregularised
  local energy at the infinite place is −(log n)/n → 0), and at every prime to the Gauss point.
- A sequence contained in a proper exceptional subvariety is not generic: for z^d the constant sequence
  0 has canonical height 0 but its measures are δ_0 ≠ λ_v; genericity (each set occurring finitely often)
  is a hypothesis of every equidistribution statement.
- The canonical-height limit alone proves no equidistribution: the proof passes through the energy
  identities, the product formula for the energy of a finite set, the regularisation estimates and the
  positivity of the energy; the unregularised local energy can be negative (FRL §6.7, corrected value
  −(n/2ⁿ) log √|C|_v).
- Total mass: every curvature measure of an adelic metric on O(1) has mass 1 = deg O(1), and in Yuan's
  theorem c₁(L̄_v)^n has mass deg_L X.
- Arakelov–Zhang values: ⟨z², z³⟩ = 0; ⟨z², 2 − (2 − z)²⟩ = log 2; ⟨z², 1 − (1 − z)²⟩ =
  (3√3/4π) L(2, χ₋₃); the Gauss-radius metric has self-pairing r_v log R and ⟨ρ, λ⟩ = ½ r_v log R.
- z² and z² − 2 share only the preperiodic points ∞, 0, 1, −1, and their canonical measures (Haar
  measure on the circle and the arcsine measure on [−2, 2]) differ; z² and 1/z² share all preperiodic
  points and have the same canonical height.
- The Multibrot Green function is log⁺|c|_p at every prime and PCF parameters have height 0; the
  misnormalised limit D^{−n} log⁺|P_cⁿ(0)| has Laplacian of mass 1/D.

---

## DY.5 Arboreal Galois representations

Given a polynomial `f` over a field `K` and a point `α ∈ K`, the iterated preimages
`f^{-n}(α)` form a rooted tree, the Galois group `Gal(Kˢ/K)` acts on it by tree automorphisms,
and the image of this *arboreal Galois representation* is a closed subgroup of the profinite
group `Aut(T_∞)`, an iterated wreath product of symmetric groups. This layer builds the tree,
its automorphism groups and the continuous representation with its finite levels and inverse
limit, and proves the image theorems that the sources establish from explicit irreducibility
and ramification hypotheses: Capelli's lemma and Jones's stability criterion, Stoll's
maximality criterion for monic quadratics over any field of characteristic `≠ 2`, Stoll's three
families `x² + a` over `ℚ` with surjective representation, Jones's ramification criterion, the
discriminant recursion of Aitken–Hajir–Maire (corrected for non-monic maps), the index
statements, and Odoni's theorem on the generic polynomial in characteristic `0` (by Juul's
argument). The acceptance example is `x² + 1` over `ℚ`, whose representation is proved surjective
at every level.

Suggested home: `TauCeti/Dynamics/Arboreal/` (files `LevelTower`, `PreimageTree`,
`Representation`, `Stability`, `Quadratic`, `Discriminant`, `Index`, `Odoni`), namespace
`TauCeti.ArithmeticDynamics`.

**Dependencies.**
- `ArithmeticDynamics:DY.0` — the interface `DY.0/rational-map-of-the-projective-line`, used
  only by the comparison for rational maps (5C.6).
- Tau Ceti ModularCurves layer 0D (finite étale `K`-schemes ≃ finite continuous
  `Gal(Kˢ/K)`-sets), for the finite-étale reading of the levels (5C.5); this is the link recorded
  by restructuring RS-29.
- Tau Ceti NumberFieldArithmetic layer 3 (with its layer 1.5), for "a prime not dividing the
  discriminant of a monic integer polynomial is unramified in its splitting field" (5G).
- Tau Ceti AlgebraicCurves layers 6, 7 and 8 (Kummer's theorem, Dedekind's different theorem and
  the Hurwitz formula, decomposition and inertia groups of function fields), for the ramification
  inputs of Odoni's theorem (5I).
- `InverseGaloisAndArithmeticFundamentalGroups:IG.2` (Hilbert irreducibility over number fields),
  for the thin-set corollary of Odoni's theorem (5I.9).
- Implemented Tau Ceti declarations from the Polynomial Galois Groups, Multiquadratic,
  square-class and absolute-Galois-group developments, listed below.
- Consumer: `ArithmeticDynamics:DY.6` (arboreal images in families).

The profinite Galois theory needed here (Krull topology, open fixing subgroups of finite
subextensions, the infinite Galois correspondence) is in Mathlib; no statement of this layer
consumes the scheme-theoretic fundamental group of `InverseGaloisAndArithmeticFundamentalGroups:IG.0`,
and no statement consumes a certified-computation carrier of `EffectiveDiophantineMethods:ED.0`
or `ComputationalNumberTheory:CN.0`: every level claimed in the worked example is proved, and the
only arithmetic is exact arithmetic in `ℤ` and `ℚ`.

### Conventions

- **Iterates are compositions.** `fⁿ` is the `n`-fold composite of `f` with itself (Mathlib's
  `Polynomial.comp` iterated, starting from `x`), never a power. Its evaluation is
  `Polynomial.iterate_comp_eval₂`; its degree is `(deg f)ⁿ` (`Polynomial.natDegree_iterate_comp`).
- **Levels are indexed from the root.** A level tower has root level `V_0` and parent maps
  `V_{n+1} → V_n`; level `n` of the preimage tree of `α` is `f^{-n}(α)`.
- **Words in the regular tree.** Level `n` of the `d`-ary tree `T^d` is `Fin n → Fin d`, the parent
  map is `Fin.tail` (forget the letter at index `0`), and the letter at index `n − 1` is read next
  to the root. This is the convention of Mathlib's `iteratedWreathToPermHom` and of Tau Ceti's
  `TauCeti.WreathProduct` (an element `(a, q)` acts on the base by `b i ↦ b (q⁻¹ i)`).
- **The absolute Galois group is taken at the separable closure.** The representation is defined on
  `Gal(SeparableClosure K/K)`, which is `TauCeti.AbsoluteGaloisGroup K` by definition, and is
  compared with Mathlib's `Field.absoluteGaloisGroup K` through
  `TauCeti.absoluteGaloisGroupRestrictEquiv`.
- **Quadratics in normal form.** Stability and maximality statements are for monic
  `f = (x − γ)² + δ` over a field of characteristic `≠ 2`; a general quadratic `ax² + bx + c` is
  first conjugated by `x ↦ a⁻¹x`, which is defined over `K` (5B.4). The printed non-monic forms of
  two of Jones's results are false (see *Mistakes in the sources*).
- **The adjusted critical orbit** is `c₁ = α − f(γ)` and `cₙ = fⁿ(γ) − α` for `n ≥ 2` (`c₀ = γ − α`
  is a junk value). The sign of `c₁` is Stoll's: it makes `c₁` a square in `K₁`.
- **2-independence** of `c₁, …, cₙ ∈ Kˣ` means that no nonempty subproduct is a square in `K`,
  equivalently that their classes in `TauCeti.SquareClassGroup K` are `𝔽₂`-linearly independent
  (`TauCeti.linearIndependent_squareClass_iff`). No separate predicate is introduced.
- **Discriminants** are Mathlib's `Polynomial.discr`, the standard `lc^{2m−2} ∏_{i<j}(ζᵢ − ζⱼ)²`.
- **Indices** are `Subgroup.index` (value `0` for infinite index) and relative degrees are
  `IntermediateField.relfinrank`.

### What the pinned libraries already provide

- Mathlib: `Polynomial.Gal`, its action `Polynomial.Gal.galAction` on `rootSet` with
  `galActionHom`, `galActionHom_injective`, `galActionHom_restrict`, `galAction_isPretransitive`,
  `restrict`, `restrict_surjective`, `card_of_separable` — this is the finite-level action of the
  audit; the Krull topology (`krullTopology`, `krullTopology_t2`,
  `IntermediateField.fixingSubgroup_isOpen`), compactness of Galois groups of Galois extensions (an
  instance in `Mathlib/FieldTheory/Galois/Profinite.lean`) and
  `InfiniteGalois.normalAutEquivQuotient`; `SeparableClosure`, `Field.absoluteGaloisGroup`;
  `RegularWreathProduct`, `IteratedWreathProduct` with `IteratedWreathProduct.card`,
  `iteratedWreathToPermHom` and `Sylow.mulEquivIteratedWreathProduct`; `mulAutArrow`;
  `ProfiniteGrp.of`; Capelli in one direction for monic polynomials, `Polynomial.irreducible_comp`;
  `X_pow_sub_C_irreducible_iff_of_prime`; the chain rule `Polynomial.derivative_comp`;
  separability through roots (`Polynomial.nodup_roots_iff_of_splits`,
  `Polynomial.card_rootSet_eq_natDegree`); `Polynomial.discr`, `Polynomial.resultant_deriv`,
  `Polynomial.resultant_eq_prod_eval`; `IsPGroup.card_modEq_card_fixedPoints`; the norm of a
  generator as a product of roots, `IntermediateField.AdjoinSimple.norm_gen_eq_prod_roots`;
  multiplicative Möbius inversion `ArithmeticFunction.prod_eq_iff_prod_pow_moebius_eq_on_of_nonzero`;
  `closure_of_isSwap_of_isPretransitive`; `Ideal.Quotient.stabilizerHom_surjective`;
  `IsDedekindDomain.HeightOneSpectrum.valuation_liesOver`,
  `NumberField.not_dvd_discr_iff_isUnramifiedIn`, `padicValRat`.
- Tau Ceti: `TauCeti.WreathProduct` and `TauCeti.PermSubgroupWreathProduct` with `card`;
  `TauCeti.AbsoluteGaloisGroup` and `TauCeti.absoluteGaloisGroupRestrictEquiv`;
  `TauCeti.isPretransitive_iff_irreducible` (transitivity on roots is irreducibility, for separable
  polynomials); `Polynomial.Monic.prod_roots_eval_derivative` and
  `Polynomial.Monic.isSquare_discr_iff_range_le_alternatingGroup` (the discriminant test);
  `TauCeti.SquareClassGroup`, `TauCeti.squareClass`, `TauCeti.linearIndependent_squareClass_iff`;
  the multiquadratic degree formula
  `TauCeti.Multiquadratic.finrank_adjoin_range_eq_two_pow_finrank_span_squareClass`, square descent
  `TauCeti.Multiquadratic.squareClass_of_sq_mem_fintype` and its converse
  `TauCeti.Multiquadratic.mem_adjoin_of_squareClass_mem_span`.

Nothing in either library attaches a tree to a dynamical system, and there is no automorphism
group of a rooted tree, no iterated-preimage tower and no inverse limit of its levels.

### 5A. Rooted trees and their automorphisms

**5A.1 Level towers** (`LevelTower`). A level tower is a family of types `V n` with parent maps
`V (n+1) → V n`; it is a rooted tree when `V 0` is a point. It is `d`-*regular* when `V 0` has one
element, every level is finite and every vertex has exactly `d` children.
API: `LevelTower.ancestor` (the ancestor at level `k` of a vertex at level `k + j`, with
`ancestor_zero`, `ancestor_succ`); `LevelTower.children`; `LevelTower.IsRegular`;
`card_level_of_isRegular` (level `n` has `dⁿ` elements); `parent_surjective_of_isRegular`
(`d ≥ 1`); morphisms `LevelTower.Hom` and isomorphisms `LevelTower.Iso` with `Iso.refl`,
`Iso.symm`, `Iso.trans`.
Unit tests: a 2-regular tower has 8 vertices at level 3; a 1-regular tower has one vertex per
level; the tower with levels `Fin (n+1)` and every vertex sent to the last vertex below is regular
of no degree; the ancestor one level down is the parent.

**5A.2 The complete `d`-ary tree** (`regularTree d`), with the word convention above.
API: `regularTree_parent` (the parent is `Fin.tail`), `regularTree_isRegular`,
`mem_children_regularTree_iff` (the children of `x` are the words `Fin.cons a x`),
`card_regularTree_V` (`dⁿ`).
Unit tests: level 3 of `T²` has 8 vertices; every level of `T¹` is a point; the parent of the word
`(0, 1)` of `T²` is `(1)`, not `(0)`; every vertex of `T^d` has `d` children.

**5A.3 The automorphism group `Aut(T)`** (`LevelTower.Aut`). The families `(σₙ)` of permutations
of the levels with `πₙ ∘ σ_{n+1} = σₙ ∘ πₙ`, a subgroup `autSubgroup` of `∏ₙ Perm(Vₙ)`, with the
topology induced from the product of the discrete groups `Perm(Vₙ)`. It is a Hausdorff, totally
disconnected topological group, compact when every level is finite, hence profinite.
API: `LevelTower.levelHom` (the action on level `n`); `Aut.ext_iff'`; `levelHom_parent`;
instances `Aut.isTopologicalGroup`, `Aut.totallyDisconnectedSpace`, `Aut.t2Space`;
`Aut.compactSpace` (finite levels); `continuous_levelHom`; `isOpen_ker_levelHom`;
`Iso.autCongr` (isomorphic towers have isomorphic automorphism groups).
Unit tests: `Aut(T¹)` is trivial; `Aut(T²)` maps onto `Perm` of level 1; the transposition of
the leaves `(0,0)` and `(0,1)` of `T²` (different parents) is not the level-2 action of any
automorphism; `Aut(T²)` is compact.

**5A.4 The truncated groups `Aut(T_n)`** (`LevelTower.truncAut n`), compatible families of
permutations of the levels `0, …, n`, a subgroup of `∏_{k ≤ n} Perm(V_k)`.
API: `truncAut.restrict` (to `Aut(T_{n−1})`), `truncAut.toLevelPerm` (the action on `Vₙ`),
`truncAut.toLevelPerm_injective` (surjective parents), `Aut.truncate`, `Aut.truncate_surjective`
and `truncAut.restrict_surjective` (regular towers), `levelSign` (the sign `χ_k` of the action on
level `k`, for finite levels), `Iso.truncAutCongr`.
Unit tests: `Aut(T_0)` of a rooted tree is trivial; `|Aut(T²_2)| = 8`; the transposition of two
leaves of `T²` with different parents is not in the image of `toLevelPerm`; for the binary tree,
`Aut(T_n) ≃* IteratedWreathProduct (Multiplicative (ZMod 2)) n`.

**5A.5 Theorems.**
- *Regular towers are `T^d`.* A `d`-regular tower is isomorphic to `T^d`
  (`nonempty_iso_regularTree`), so `Aut(T) ≃* Aut(T^d)` and `Aut(T_n) ≃* Aut(T^d_n)`, uniquely up to
  conjugation.
- *The restriction kernel.* For a `d`-regular tower, `Aut(T_{n+1}) → Aut(T_n)` is surjective with
  kernel `∏_{v ∈ Vₙ} Perm(children v) ≅ (S_d)^{dⁿ}`.
- *The order.* `|Aut(T_n)| = (d!)^{1 + d + ⋯ + d^{n−1}}`, written with the exponent `∑_{i<n} dⁱ` to
  match `IteratedWreathProduct.card`; for `d = 2`, `2^{2ⁿ−1}`.
- *The wreath recursion.* `Aut(T^d_{n+1}) ≃* (Fin d → Aut(T^d_n)) ⋊ Perm(Fin d)`, which is
  `TauCeti.WreathProduct (Aut(T^d_n)) (Fin d)`: the top permutation moves the root letter and the
  base acts on the subtrees through `Fin.init`. For `d = 2` this is Mathlib's
  `IteratedWreathProduct` recursion, and `Aut(T²_n)` is a Sylow 2-subgroup of the permutations of
  the `2ⁿ` leaves.
- *The inverse limit.* For a `d`-regular tower every compatible family `(sₙ ∈ Aut(T_n))` comes from a
  unique automorphism (`Aut.existsUnique_of_compatible`), so `Aut(T) = lim Aut(T_n)` as
  topological groups; a closed subgroup whose truncations are all of `Aut(T_n)` is everything.
- *Characters of binary trees.* For a 2-regular tower every homomorphism `Aut(T_n) → {±1}` is
  `∏_{k∈S} χ_k` for a unique `S ⊆ {1, …, n}` (`binary_hom_eq_prod_levelSign`); the largest
  elementary abelian 2-quotient of `[C₂]^n` is `C₂^n`.

### 5B. Preimage trees and the non-collision condition

**5B.1 The preimage tree** (`preimageTree g α`). For a map `g : X → X` and `α ∈ X`, level `n` is
`g^{-n}(α) = {x : g^[n] x = α}` and the parent of `x` is `g x`. For `f ∈ K[x]`, `α ∈ K` and a field
`L ⊇ K`, `polyPreimageTree K L f α` is the preimage tree of `y ↦ f(y)` on `L` at `α`; its level `n`
is `(fⁿ − α).rootSet L`.
API: `preimageTree`, `polyPreimageTree`, `preimageTree_parent_coe` (the parent is `g x`),
`preimageTree_ancestor_coe` (the ancestor is `g^j x`), the instance
`preimageTree.uniqueLevelZero` (level `0` is `{α}`), functoriality `preimageTree.hom` and
`preimageTree.iso` along maps `h` with `h ∘ g = g' ∘ h` and `h α = α'`, and the compatibility
`polyPreimageTree_mem_rootSet` with Mathlib's `Polynomial.rootSet` (`deg f ≥ 1`).
Unit tests: under `z ↦ z²` on `ℂ`, level `n` over `1` has `2ⁿ` elements; under the identity every
level is a point; under `z ↦ z²` the tree over the critical value `0` is not 2-regular; level `n`
of the polynomial tree is the root set of `fⁿ − α`.

**5B.2 The chain rule for iterates.** `(fⁿ)' = ∏_{i<n} f' ∘ fⁱ` over any commutative semiring
(`derivative_iterate_comp`).

**5B.3 Non-collision** (`separable_iterate_sub_iff`). For `deg f ≥ 1` and `n ≥ 1`, `fⁿ − α` is
separable iff no critical point `c ∈ K̄` (`f'(c) = 0`) satisfies `f^k(c) = α` with `1 ≤ k ≤ n`.
So all iterates are separable exactly when `α` is outside the forward orbits of the critical
points. If `f' = 0` every point is critical and both sides fail.
*Regularity* (`isRegular_polyPreimageTree`): if every `fⁿ − α` is separable and splits over `L`
(for example `L = Kˢ`), the tree is `d`-regular with `d = deg f`, hence isomorphic to `T^d`.

**5B.4 Affine conjugation.** For `h(x) = ux + v` over `K` with `u ≠ 0`, `ψ = h⁻¹ ∘ f ∘ h` and
`α' = h⁻¹(α)`, the map `h⁻¹` is a `Gal(L/K)`-equivariant isomorphism `T(f, α) ≅ T(ψ, α')`
(`nonempty_iso_polyPreimageTree_conj`); the fields `K(f^{-n}(α))`, the level images and stability
are unchanged. Every quadratic is conjugate over `K` to a monic one, and `α` can be moved to `0`.

### 5C. The Galois action and the arboreal representation

**5C.1 The Galois action** (`galoisTreeAction K L f α : Gal(L/K) →* Aut(T(f, α; L))`), because
`σ(f(x)) = f(σx)` for `f ∈ K[x]` (`Polynomial.aeval_algHom_apply`).
API: `levelHom_galoisTreeAction_coe` (the action of `σ` on a vertex is `σ` itself);
`galActionHom_restrict_eq_galoisTreeAction` (on level `n` it is Mathlib's `galActionHom` of
`fⁿ − α` after `Polynomial.Gal.restrict`).
Unit tests: complex conjugation sends the level-2 vertex `i` of the tree of `z ↦ z²` over `1` to
`−i`; `Gal(K/K)` acts trivially; complex conjugation acts nontrivially on the tree of `z² + 1`
over `0`; the level-`n` action equals `galActionHom`.

**5C.2 The arboreal representation** (`arborealRep K f α`), the action for `L = Kˢ`, with image
`arborealImage K f α = G_∞(f, α)` and level images `levelImage K f α n = G_n(f, α) ≤ Aut(T_n)`.
Under non-collision `T_∞ ≅ T^d`, so `G_∞` is a subgroup of `Aut(T^d_∞)` up to conjugacy.
API: `arborealRep`, `arborealImage`, `levelImage`, `card_levelImage` (`|G_n| = |Gal(fⁿ − α)|`
under separability), `levelImage_map_le` (over an extension `E/K` the level images shrink, along
an isomorphism of trees).
Unit tests: `G_1 = Aut(T_1)` for `x² + 1` over `ℚ` at `0`; over a separably closed field
`G_∞ = 1`; for `x² − 2` over `ℚ` at `0`, `G_2 ≠ Aut(T_2)`; `|G_n| = |Gal(fⁿ − α)|`.

**5C.3 The fields `K_n` and `K_∞`** (`preimageField K f α n = K(f^{-n}(α)) ⊆ Kˢ`,
`preimageFieldInfty`).
API: `preimageField_mono` (`K_n ⊆ K_{n+1}` under separability), `preimageField_isSplittingField`,
`preimageField_isGalois`, `finiteDimensional_preimageField`, `relfinrank_preimageField_succ_le`
(`[K_{n+1} : K_n] ≤ (d!)^{dⁿ}`), `fixingSubgroup_preimageField` (the fixing subgroup of `K_n` is
the kernel of the action on level `n`).
Unit tests: `K_0 = K`; for `z ↦ z²` over `ℚ` at `1`, `[K_2 : ℚ] = 2`; for `z ↦ z³` at `2`,
`[K_1 : ℚ] = 6` (the Galois closure, not `ℚ(∛2)`); `K_n` is a splitting field of `(x² + 1)ⁿ` over
`ℚ`.

**5C.4 Theorems.**
- *Continuity.* For `deg f ≥ 1`, `ρ` is continuous from the Krull topology to the profinite
  topology: the kernel of the action on level `n` is the fixing subgroup of the finite extension
  `K_n`, which is open.
- *Finite levels.* If `fⁿ − α` is separable, `G_n ≅ Gal(K_n/K) ≅ Gal(fⁿ − α)`, with the action on
  level `n` being `galActionHom`; `|G_n| = [K_n : K]`.
- *Inverse limit.* If `deg f ≥ 1` and all `fⁿ − α` are separable: `ker ρ` is the fixing subgroup of
  `K_∞`; `G_∞` is closed and `Gal(K_∞/K) ≃ₜ* G_∞`; `G_∞ = lim G_n`. In particular `ρ` is
  surjective iff `G_n = Aut(T_n)` for every `n`.
- *Transitivity.* For separable `fⁿ − α` (`n ≥ 1`), `Gal(Kˢ/K)` is transitive on level `n` iff
  `fⁿ − α` is irreducible (through `TauCeti.isPretransitive_iff_irreducible`).

**5C.5 Finite étale reading of the levels.** For separable `fⁿ − α`, the finite étale
`K`-scheme `Spec K[x]/(fⁿ(x) − α)`, the fibre of `fⁿ : 𝔸¹ → 𝔸¹` over `α`, corresponds under the
field-case equivalence of Tau Ceti ModularCurves 0D to level `n` with the action of `ρ`, and the
morphism induced by `x ↦ f(x)` to the parent map.

**5C.6 Rational maps.** For a rational map `φ` of degree `d ≥ 2` of `ℙ¹` over `K`
(`DY.0/rational-map-of-the-projective-line`) and `α ∈ ℙ¹(K)`, the same construction on
`ℙ¹(Kˢ)` gives a tree with a Galois action; it is `d`-regular exactly when `φⁿ(x) = α` has `dⁿ`
distinct solutions for all `n`, and for polynomials it is the tree of 5B.1.

### 5D. Stability

**5D.1 Capelli's lemma.** For `g ≠ 0`, `deg h ≥ 1` and a root `β` of `g` in any extension:
`g ∘ h` is irreducible over `K` iff `g` is irreducible over `K` and `h − β` is irreducible over
`K(β)` (`irreducible_comp_iff_capelli`; the reverse direction for monic polynomials is Mathlib's
`Polynomial.irreducible_comp`, the forward direction is a degree count).

**5D.2 Stable pairs** (`IsStableAt f α`): `fⁿ − α` is irreducible for every `n ≥ 1`.
API: `IsStableAt.irreducible_sub`, `irreducible_iterate_of_le` (irreducibility descends to
smaller iterates), `isStableAt_iff_forall_transitive` (stability is transitivity of the Galois
action on every level, under separability), `isStableAt_conj_iff` (affine conjugation).
Unit tests: `x² + 1` over `ℚ` at `0` is stable; degree-one polynomials are stable; `x² − x − 1`
over `ℚ` at `0` is not stable although its second iterate is irreducible (the third iterate is a
product of two quartics); stability is Jones's "`x − α` is `f`-stable".

**5D.3 Eventually stable pairs** (`IsEventuallyStableAt f α`): the number of irreducible factors
of `fⁿ − α`, with multiplicity (`UniqueFactorizationMonoid.factors`), is bounded.
API: `IsStableAt.isEventuallyStableAt`, `isEventuallyStableAt_iff_of_le`.
Unit tests: `x² + 1` at `0` is eventually stable; `x²` at `0` is not (`x^{2ⁿ}` has `2ⁿ` factors);
the third iterate of `x² − 16/9` over `ℚ` has four irreducible factors.

**5D.4 The adjusted critical orbit** (`adjustedCriticalOrbit f γ α n`), defined over any
commutative ring.
API: `adjustedCriticalOrbit_one`, `adjustedCriticalOrbit_of_two_le`, `adjustedCriticalOrbit_map`,
`adjustedCriticalOrbit_ne_zero_iff` (for `(x − γ)² + δ` in characteristic `≠ 2`: `c₁, …, cₙ ≠ 0` iff
`fⁿ − α` is separable), `adjustedCriticalOrbit_X_sq_add_succ` (for `x² + a` at `0`,
`c_{n+1} = cₙ² + a`).
Unit tests: for `x² + 1` at `0`, `c₁, …, c₅ = −1, 2, 5, 26, 677`; for `x²` at `0` all `cₙ = 0`;
`c₁ = −1 ≠ 1 = f(0)` for `x² + 1`; for `x² + a` at `0` this is Stoll's sequence `c₁ = −a`,
`c_{n+1} = cₙ² + a`.

**5D.5 Theorems.**
- *The shifted-root product.* For `f = (x − γ)² + δ` and `n ≥ 1`, the product over the roots `β` of
  `f^{n−1} − α` of `β − δ` is `cₙ`; if `f^{n−1} − α` is irreducible it is `N_{K(β)/K}(β − δ)`.
- *Jones's stability step.* In characteristic `≠ 2`, if `fⁿ − α` is irreducible and `c_{n+1}` is not
  a square in `K`, then `f^{n+1} − α` is irreducible (for `n = 0`: `f − α` is irreducible iff
  `α − δ` is not a square).
- *Jones's criterion.* If no `cₙ` is a square in `K`, `(f, α)` is stable
  (`isStableAt_of_forall_not_isSquare`).

### 5E. Stoll's maximality criterion

Throughout, `K` has characteristic `≠ 2` and `f = (x − γ)² + δ`.
- *Kummer generation.* If `f^{n+1} − α` is separable, `K_{n+1} = K_n(y_β − γ : β ∈ V_n)` with
  `(y_β − γ)² = β − δ`: a 2-Kummer extension of degree at most `2^{2ⁿ}` whose group is the kernel of
  `G_{n+1} → G_n`.
- *Invariant vectors.* A nonzero invariant subspace of `𝔽₂^X` under a transitive finite 2-group
  contains the constant vector `1`.
- *The Kummer step.* If `fⁿ − α` is irreducible and `c_{n+1} ≠ 0`, then `[K_{n+1} : K_n] = 2^{2ⁿ}` iff
  `c_{n+1}` is not a square in `K_n` (`stoll_kummer_step`). The relation space among the `β − δ`
  is a `G_n`-module; by transitivity it is nonzero iff it contains `(1, …, 1)`, i.e. iff
  `∏(β − δ) = c_{n+1}` is a square in `K_n`.
- *A square root of `cₙ`.* `sₙ = ∏_{β ∈ V_{n−1}} (y_β − γ) ∈ K_n` has `sₙ² = cₙ` and
  `σ(sₙ) = χₙ(ρ(σ)) sₙ`, where `χₙ` is the sign of the action on level `n`.
- **Stoll's maximality criterion.** If `fⁿ − α` is separable, then `G_n(f, α) = Aut(T_n)` (that is,
  `[K_n : K] = 2^{2ⁿ−1}`) iff `c₁, …, cₙ` are 2-independent in `K` (`stoll_maximality_criterion`).
  The proof is Stoll's: Lemma 1.4 (maximality at `n + 1` is maximality at `n` plus a maximal Kummer
  layer), the Kummer step, and Lemma 1.5 (when `G_n = Aut(T_n)` and `c₁, …, cₙ` are independent,
  `c ∈ Kˣ` is a square in `K_n` iff `c₁, …, cₙ, c` are dependent), which uses the characters of
  5A.5 to bound the multiquadratic subfields of `K_n` and Tau Ceti's square descent.
- *Surjectivity.* If all `fⁿ − α` are separable, `ρ` is surjective iff the whole adjusted critical
  orbit is 2-independent (`arborealRep_surjective_iff`).

### 5F. Stoll's families and the worked example

**5F.1 Möbius quotients** (`mobiusQuotient c n = ∏_{d ∣ n} c_d^{μ(n/d)}`, for a sequence in a
field).
API: `mobiusQuotient_one`, `prod_mobiusQuotient` (Möbius inversion `∏_{d ∣ n} b_d = cₙ` for
sequences nonvanishing on positive indices), `mobiusQuotient_prime` (`b_p = c_p/c_1`),
`mobiusQuotient_map`.
Unit tests: for the orbit of `x² + 1`, `b₂ = −2` and `b₄ = 13`; the constant sequence `1` has all
quotients `1`; `b₆ = c₆c₁/(c₂c₃)`, not `c₆/c₅`; `b₁b₂b₄ = c₄`.

**5F.2 Theorems** (for `f = x² + a`, `a ∈ ℤ`, `α = 0`, with `−a` not a square).
- *Strong divisibility.* `gcd(c_m, cₙ) = |c_{gcd(m,n)}|` (with `c₀ = 0`), from `c_m ∣ c_{m+j} − c_j`.
- *Positivity.* `cₙ > 0` for `n ≥ 2` (Stoll, Lemma 1.1 a)).
- *Stoll's Lemma 1.1.* The Möbius quotients `bₙ` of `(cₙ)` are pairwise coprime integers with
  `cₙ = ∏_{d ∣ n} b_d`; each prime divisor of the orbit divides exactly one `bₙ`.
- *Stoll's Theorem, Section 1.* `G_n = Aut(T_n)` iff `b₁, …, bₙ` are 2-independent; in particular
  `G_n = Aut(T_n)` if no `|b_m|`, `2 ≤ m ≤ n`, is a square.
- *Stoll's Lemma 2.1.* For an even `g ∈ ℤ[x]` and its iteration sequence `γ₁ = ±g(0)`,
  `γ_{n+1} = g(γₙ)` (all nonzero), if for every `n` some `m` divides `γₙ + γ_{2n}`, is coprime to
  `γₙ`, and has `−1` a non-square mod `m`, then no Möbius quotient `βₙ`, `n ≥ 2`, is a square.
- *Stoll's Lemma 2.2.* The moduli exist when all `γₙ > 0` and either `g(0) = 1`, `g(1) ≡ 2 (mod 4)`,
  or `g(0) = ±1`, `g(1) ≡ 3 (mod 4)`.
- **Stoll's theorem** (`stoll_levelImage_eq_top`). If `a > 0` and `a ≡ 1` or `2 (mod 4)`, or
  `a < 0`, `a ≡ 0 (mod 4)` and `−a` is not a square, then `G_n(x² + a, 0) = Aut(T_n)` for all `n`,
  and `ρ` is surjective. (Rescale by `g = |a|x² + sgn(a)` to apply Lemma 2.2.)

**5F.3 The worked example: `x² + 1` over `ℚ`.** The critical orbit `1, 2, 5, 26, 677, …` never
returns to `0`, so the tree is the binary tree; the adjusted critical orbit is
`−1, 2, 5, 26, 677, 458330, …`; `G_1 ≅ C₂`, `G_2 ≅ D₄` of order 8, `G_3` of order 128, and
`G_n = Aut(T_n)` of order `2^{2ⁿ−1}` for **every** `n` by Stoll's theorem (case `a = 1`); `ρ` is
surjective (`arborealRep_X_sq_add_one_surjective`). The first three levels are also read off
directly from Stoll's criterion (`−1`; `−1, 2`; `−1, 2, 5` are 2-independent). No level is
inferred from a computation: Cremona's verification up to `n = 5·10⁷` is superseded by the theorem.

### 5G. Discriminants and ramification

- **The discriminant recursion** (`discr_iterate_sub_succ`). For `f` of degree `d`, leading
  coefficient `a`, `(d : K) ≠ 0`, and the critical points `r` with multiplicity:
  `Disc(f^{n+1} − α) = A^{dⁿ} · a^{(dⁿ−1)(d^{n+1}+1)} · Disc(fⁿ − α)^d · ∏_r (f^{n+1}(r) − α)` with
  `A = (−1)^{d(d−1)/2} d^d a^{d−1}`. For monic `f` this is Aitken–Hajir–Maire's Proposition 3.2; the
  power of `a` corrects it in general.
- *Monic quadratics* (`discr_quadratic_iterate`). `Disc(f − α) = 4c₁` and
  `Disc(f^{n+1} − α) = 2^{2^{n+1}} Disc(fⁿ − α)² c_{n+1}` for `n ≥ 1`; so `Disc(fⁿ − α) ≡ cₙ` modulo
  squares.
- *Unramified primes.* For `f = x² + bx + c ∈ ℤ[x]`, `α ∈ ℤ` and an odd prime `p` with
  `v_p(c_k) = 0` for `k ≤ n`, `p` is unramified in `K_n` (from the recursion and the
  NumberFieldArithmetic input).
- *Odd valuation.* If `p` is unramified in a number field `L` and `v_p(q)` is odd, `q` is not a
  square in `L`.
- **Jones's ramification criterion** (`jones_ramification_criterion`). For such `f`, `α`, with
  `fⁿ − α` irreducible over `ℚ`: an odd prime `p` with `v_p(c_{n+1})` odd and `v_p(c_k) = 0` for
  `k ≤ n` forces `[K_{n+1} : K_n] = 2^{2ⁿ}`. The irreducibility hypothesis is essential.

### 5H. Index statements

- *Recursion.* Under non-collision,
  `[Aut(T_{n+1}) : G_{n+1}] · [K_{n+1} : K_n] = [Aut(T_n) : G_n] · (d!)^{dⁿ}`; the indices are
  non-decreasing.
- *The index of `G_∞`.* `G_∞` has finite index iff the finite-level indices are bounded, iff
  `[K_{n+1} : K_n] = (d!)^{dⁿ}` for all large `n`, and then `[Aut(T_∞) : G_∞] = supₙ [Aut(T_n) : G_n]`.
- *Unicritical maps.* For `x^d + b` with `d ≥ 3`, `(d : K) ≠ 0` and non-collision,
  `[K_{n+1} : K_n] ≤ d^{dⁿ}` (Kummer extensions, `K₁` contains the `d`-th roots of unity), so
  `G_∞` has infinite index; its Hausdorff dimension is at most `log d / log d!`.

### 5I. Odoni's theorem

Throughout, `k` is algebraically closed of characteristic `0` where stated; ramification in
`k(t)` is tame.
1. *Base change.* Over an extension `E/K` the level images embed into those over `K`.
2. *Specialization.* For an integrally closed domain `A`, a prime `𝔭`, monic `f ∈ A[x]` and `α ∈ A`
   with separable reductions, the level images over `Frac(A/𝔭)` embed into those over `Frac(A)`
   along an isomorphism of trees (decomposition groups surject onto residue Galois groups).
3. *The shift.* `g(x) = f(x + t) − t` has `gⁿ(x) = fⁿ(x + t) − t`, so `G_n(g, 0) = G_n(f, t)`.
4. *Inertia.* If `𝔭 ∥ Disc(P)` (with `A[θ]` integrally closed), inertia above `𝔭` acts on the
   roots as a transposition (Juul, Corollary 2.8; AlgebraicCurves layers 6–8).
5. *No tame covers of the affine line.* A finite extension of `k(t)` unramified at every finite
   place is trivial (Hurwitz, AlgebraicCurves layer 7).
6. *The first level.* Simple critical points with distinct critical values give
   `Gal(f(x) − t/k(t)) = S_d`.
7. *Disjoint ramification* (Juul, Lemma 3.3) and **Juul's Theorem 3.1**: if `G_1(f, t) = S_d` and a
   simple critical point `a` has no orbit relation `fᵐ(a) = f^{m'}(b)` (`1 ≤ m' ≤ m ≤ N`,
   `(m', b) ≠ (m, a)`), then `G_N(f, t) = Aut(T^d_N)` over `k(t)`.
8. *Existence.* In every degree `d ≥ 2` there are polynomials with simple critical points and no
   critical orbit relations up to `N`.
9. **Odoni's theorem** (`odoni_generic`). For the generic monic polynomial
   `G = x^d + s_{d−1}x^{d−1} + ⋯ + s₀` over `k(s)`, `char k = 0`: `G_n(G, 0) = Aut(T^d_n)` for all
   `n`. Corollary: over a number field, for each `n` the polynomials with `G_n ≠ Aut(T_n)` form a
   thin set (Hilbert irreducibility, from `IG.2`); the thin set is not effective.

### Acceptance tests

- The worked example 5F.3 for `x² + 1` over `ℚ`, at every level.
- Non-examples: `x² − 2` over `ℚ` at `0` (post-critically finite; `c₁c₂ = 4` so `G_2 ≠ Aut(T_2)`;
  `G_n` cyclic of order `2ⁿ`); `x² + 3` over `ℚ` at `0` (`G_2 = Aut(T_2)` but `c₂c₃ = 42²`, so
  `G_3 ≠ Aut(T_3)`, while `f³` is irreducible); `x² − x − 1` over `ℚ` at `0` (not stable);
  `z ↦ z²` at the critical value `0` (not regular).
- Jones's example `x² + 5`: `5, 30 = 2·3·5, 905 = 5·181, 819030 = 2·3·5·23·1187`, so the Kummer
  layers 2, 3, 4 are maximal by the ramification criterion.
- The discriminant recursion checked against direct computation for `3x² + x + 2` and
  `2x³ + x² + 1` (the uncorrected recursion is off by `3⁵` and `2²⁰` at `n = 1`).
- `|Aut(T²_3)| = 128`, `|Aut(T³_2)| = 1296`, and `Aut(T²_n) ≅ IteratedWreathProduct (Multiplicative (ZMod 2)) n`.

### Outside this layer

The following results of the sources are not statements of this layer: Jones's theorem that
post-critically finite maps have images of infinite index (it rests on the finite ramification of
`K_∞` and on Ihara's theorem on topological generation of `G_{K,S}`); Jones's finite-index theorem
for quadratics with strictly preperiodic `0` (it rests on Siegel's theorem); Juul's extension of
Odoni's theorem to positive characteristic and to the generic rational function; the
Jones–Manes results for quadratic rational functions; and the zero-density theorems for prime
divisors of orbits, which use the Chebotarev density theorem and martingale convergence.

### Sources and provenance

- R. Jones, *Galois representations from pre-image trees: an arboreal survey*, arXiv:1402.6018v1
  (Pub. Math. Besançon 2013): §§1–3, 5.
- R. Jones, *The density of prime divisors in the arithmetic dynamics of quadratic polynomials*,
  arXiv:math/0612415v1 (J. Lond. Math. Soc. 78 (2008)): §§2–4.
- W. Aitken, F. Hajir, C. Maire, *Finitely ramified iterated extensions*, arXiv:math/0408170v1:
  §§1–3.
- J. Juul, *Iterates of generic polynomials and generic rational functions*, arXiv:1410.3814v6:
  §§1–3 (characteristic-0 cases).
- M. Stoll, *Galois groups over ℚ of some iterated polynomials*, Arch. Math. 59 (1992) 239–244,
  read through the public blueprint of Stoll's QuadraticIterates formalization, which reproduces
  the paper with its numbering.

*Existing formalization.* M. Stoll's QuadraticIterates (Lean and Mathlib, Apache-2.0) formalizes
every numbered result of Stoll's paper and Li's extensions for `x² + a` over `ℚ`, with auxiliary
multiquadratic, 2-group, wreath-power and Möbius-quotient theory. The statements of 5E–5F cover the
same mathematics for any field of characteristic `≠ 2`, any monic quadratic and any base point,
against Tau Ceti's square-class and multiquadratic API; integration of that work is coordinated
with its author.

*Mistakes in the sources* (recorded as `ArithmeticDynamics/E601`–`E605`). Aitken–Hajir–Maire's
Proposition 3.2 omits the factor `a^{(dⁿ−1)(d^{n+1}+1)}` for non-monic maps; Jones 2008, Lemma 2.8
omits the factor `lc(g ∘ fⁿ)^{−(d−1)}`; Jones 2008, Proposition 4.3 is false for non-monic `f`
(counterexample `f = 2x² − 2/3` over `ℚ`: `f²(0) = 2/9` is not a square but `f²` is reducible) and
holds with `lc(g) a^{deg g} g(fⁿ(γ))`; the proof of Jones 2008, Lemma 3.2 is valid only for monic
data; Jones 2008's definition of a complete forest says "connected to d others" for "has d
children". The statements of this layer use the corrected forms.

---

## DY.6 Families, unlikely intersections and frontiers

This layer supplies the complete worked examples of the roadmap (power maps and Lattès maps, carried through canonical heights, local heights, periodic points, dynatomic polynomials, preimage trees and critical points), the theory of one-parameter families of maps of ℙ¹ with the Call–Silverman specialisation theorem, the critical height with Ingram's comparison, and the proven unlikely-intersection and dynamical Mordell–Lang results that the sources establish: the uniform bound on common torsion images of two Legendre curves (DeMarco–Krieger–Ye), the étale dynamical Mordell–Lang theorem (Bell–Ghioca–Tucker) and the Ghioca–Tucker–Zieve theorems on polynomial orbits and lines. The frontier conjectures (dynamical Lehmer, uniform boundedness, dynamical Mordell–Lang, dynamical André–Oort) are stated as propositions and enter theorems only as named hypotheses.

Boundaries. Mordell–Lang and Manin–Mumford for abelian varieties belong to HeightsRationalPointsAndObstructions:RP.5. Bifurcation currents, PCF-special subvarieties and the bounded-geometry theorems of DeMarco–Mavraki–Ye belong to the proposed Part II on bifurcation currents; that Part II imports `DY.6/flexible-lattes-map`, `DY.6/critical-height` and `DY.6/critical-height-is-a-moduli-height` from this layer. The canonical height of the power map is ClassicalArithmeticCompletion:CA.6's (`CA.6/canonical-height-power-map`) and is imported. Uniform Manin–Mumford and Bogomolov for bielliptic genus-2 curves (DeMarco–Krieger–Ye Theorems 1.1 and 1.9) belong to the uniformity Part II of HeightsRationalPointsAndObstructions, which imports the Legendre bounds of this layer. Berkovich potential theory and the hybrid space are TropicalAndBerkovichArithmetic:TB.0's; heights of line bundles on varieties are HeightsRationalPointsAndObstructions:RP.0's; quasi-projective varieties and spreading out are SchemeAndStackFoundations:SF.0's. Rigid Lattès maps (quotients by complex multiplication or by the groups of order 3, 4, 6) are not constructed in DY.6.

**Dependencies.** Within the roadmap: DY.0 (`DY.0/rational-map-of-the-projective-line`, `DY.0/resultant-of-a-rational-map`, `DY.0/good-reduction-of-a-rational-map`, `DY.0/conjugacy-of-rational-maps`, `DY.0/moduli-space-of-rational-maps`), DY.1 (`DY.1/canonical-height-on-the-projective-line`, `DY.1/zero-canonical-height-iff-preperiodic`, `DY.1/northcott-for-preperiodic-points`), DY.2 (`DY.2/escape-rate`, `DY.2/local-canonical-height`, `DY.2/multiplier-of-a-periodic-cycle`, `DY.2/canonical-measure`), DY.3 (`DY.3/dynatomic-polynomial`, `DY.3/formal-and-exact-period`), DY.4 (`DY.4/arakelov-zhang-pairing`, `DY.4/adelic-metrized-line-bundle-on-p1`, and the DY.4 stage for Zhang's essential-minimum inequality, Fili's metric, the product formula for the energy of a finite set and the heights h_{F,η}), DY.5 (`DY.5/preimage-tree`, `DY.5/arboreal-galois-representation`). Other roadmaps: TropicalAndBerkovichArithmetic:TB.0, SchemeAndStackFoundations:SF.0 and HeightsRationalPointsAndObstructions:RP.0 (requested inputs, listed below); ClassicalArithmeticCompletion:CA.6 (`CA.6/canonical-height-power-map`, `CA.6/weil-height-eq-zero-iff`); DiophantineApproximationAndTranscendence:DT.0 (`DT.0/abs-mul-height-eq-rpow`, `DT.0/mul-height-algebra-map`). Tau Ceti: EllipticCurves layer 6 (the Néron–Tate height `WeierstrassCurve.Affine.Point.canonicalHeight`) and the isogeny library of EllipticCurves layer 1 (`TauCeti.Isogeny.mulByIntIsogeny`), both built; ModularCurves layer 4C (the universal Legendre curve, of which E_t is a fibre).

**Conventions.**

- ℙ¹(K) = K ∪ {∞} with ∞ = [1 : 0]; a rational map of degree d is DY.0's pair of coprime forms of degree d up to scaling, equivalently for nonconstant maps a rational function x ↦ r(x). Iterates are composites of maps; equalities of maps are equalities of forms up to scaling, not only on points.
- Heights: h is the absolute logarithmic Weil height on ℙ¹(ℚ̄) (h([x : 1]) = `NumberField.absLogHeight₁ x`, h(∞) = 0); over a field with Mathlib `Height.AdmissibleAbsValues` the height h_F relative to F is `Height.logHeight`; over k(t) it is the degree height of `DY.6/rational-function-field-heights`. For a number field K, h_K = [K : ℚ] · h on ℙ¹(K).
- The canonical height ĥ_f of a map over ℚ̄ is DY.1's (absolute normalisation); the canonical height relative to F is `DY.1/canonical-height-over-a-global-height-field`. The Néron–Tate height is Tau Ceti's `canonicalHeight`, normalised to the divisor (O): canonicalHeight(P) = ½ lim h_F(x(2ⁿP))/4ⁿ. Hence ĥ_{f_{E,n}}(x(P)) = 2 canonicalHeight(P) relative to F, and DeMarco–Krieger–Ye's ĥ_E = ½ ĥ_f ∘ x in absolute normalisation.
- The x-coordinate x : E → ℙ¹ has x(O) = ∞ (Mathlib `WeierstrassCurve.Affine.Point.xRep`). The Lattès map of multiplication by n is x ↦ Φ_n(x)/ΨSq_n(x) with Mathlib's division polynomials `WeierstrassCurve.Φ`, `WeierstrassCurve.ΨSq`.
- Critical points, postcritical finiteness and the critical height are in characteristic 0; critical points are counted with multiplicity e_f(c) − 1.
- Arithmetic progressions are one-sided {ak + b : k ∈ ℕ} with a ≥ 0 allowed (a = 0 gives singletons).
- Energies: E_v(t₁, t₂) = ½(µ_{t₁,v} − µ_{t₂,v}, µ_{t₁,v} − µ_{t₂,v})_v is the local term of the Arakelov–Zhang pairing ĥ_{t₁} · ĥ_{t₂} = Σ_v r_v E_v(t₁, t₂), r_v = [K_v : ℚ_v]/[K : ℚ]; the Laplacian is normalised by Δ log⁺|z|_v = ω_v − δ_∞.

### 6A. Power maps

The power map is the first complete example: its canonical height is the Weil height (imported from ClassicalArithmeticCompletion:CA.6), its preperiodic points are 0, ∞ and the roots of unity, its escape rate is log max(|z|, |w|) at every place, its dynatomic polynomials are products of cyclotomic polynomials, and its preimage trees carry the Kummer action.

**The power map z ↦ z^d on the projective line** (`DY.6/power-map`, definition).

Let K be a field and d ≥ 1 an integer. The power map P_d : ℙ¹_K → ℙ¹_K is the rational map (DY.0/rational-map-of-the-projective-line) given by the pair of homogeneous forms (X^d, Y^d): [x : y] ↦ [x^d : y^d]. In the affine coordinate z = x/y it is z ↦ z^d, with P_d(0) = 0 and P_d(∞) = ∞ (∞ = [1 : 0]). It has degree d, and Res(X^d, Y^d) = 1 in the normalisation of DY.0/resultant-of-a-rational-map. Iterates P_dⁿ are composites of morphisms.

Hypotheses and conventions: K is any field; the definition needs no characteristic hypothesis. d ≥ 1; the dynamical statements (canonical height, preperiodic points, multipliers) assume d ≥ 2, where P_d is polarised: P_d^*O(1) ≅ O(d). The multiplier d at a fixed root of unity and the critical-point count use char K ∤ d (in characteristic p | d, P_d is inseparable and every affine point is critical).

API:

- `powerMap_apply` (simp): P_d(z) = z^d for z in K and P_d(∞) = ∞.
- `powerMap_comp` (relation): P_d ∘ P_e = P_{de} as rational maps.
- `powerMap_iterate` (relation): P_dⁿ = P_{dⁿ} as rational maps.
- `powerMap_degree` (characterisation): The degree of P_d is d.
- `powerMap_resultant` (other): Res(X^d, Y^d) = 1; hence P_d has good reduction at every nonarchimedean place (DY.0/good-reduction-of-a-rational-map).
- `powerMap_conj_inv` (relation): P_d commutes with ι(z) = 1/z and with z ↦ ζz for every (d−1)-th root of unity ζ.
- `powerMap_isFixedPt_iff` (characterisation): For d ≥ 2, the fixed points of P_d are 0, ∞ and the (d−1)-th roots of unity.
- `powerMap_multiplier` (other): For d ≥ 2 the multiplier (DY.2/multiplier-of-a-periodic-cycle) of the fixed points 0 and ∞ is 0; if char K ∤ d, the multiplier of a fixed (d−1)-th root of unity is d, and the n-cycle of a root of unity of exact period n has multiplier dⁿ.
- `powerMap_map` (functoriality): For a field homomorphism σ : K → L, the base change of P_d over K is P_d over L.

Unit tests:

- `powerMap_two_iterate_three` (computation): Over ℚ, P_2³(2) = 256 and P_2³(∞) = ∞.
- `powerMap_one` (degenerate): P_1 is the identity rational map of ℙ¹.
- `powerMap_canonicalHeight_eq` (compatibility): For d ≥ 2 and x ∈ ℚ̄, the canonical height ĥ_{P_d}(x) equals the absolute Weil height NumberField.absLogHeight₁ x (ClassicalArithmeticCompletion:CA.6/canonical-height-power-map, from Height.logHeight₁_pow).
- `powerMap_two_not_preperiodic` (non-example): The point 2 ∈ ℚ is not preperiodic for P_2 (its orbit 2, 4, 16, 256, … is injective), whereas every root of unity is.

Proof outline: X^d and Y^d are homogeneous of degree d; over an algebraic closure their only common zero is (0, 0), since x^d = y^d = 0 forces x = y = 0. Hence (X^d, Y^d) is a DY.0 rational map of degree d. Resultant: dehomogenising, Res(X^d, 1) = 1 (Mathlib Polynomial.resultant; the Sylvester matrix of (X^d, 1) is the identity), so Res(X^d, Y^d) = 1 and P_d has good reduction at every nonarchimedean place (DY.0/good-reduction-of-a-rational-map). Composition: (X^d, Y^d) ∘ (X^e, Y^e) = ((X^e)^d, (Y^e)^d) = (X^{de}, Y^{de}) as forms, so P_d ∘ P_e = P_{de} as rational maps and P_dⁿ = P_{dⁿ} by induction on n. Fixed points: [x : y] with x^d y = x y^d, i.e. xy(x^{d−1} − y^{d−1}) = 0: the points 0, ∞ and the (d−1)-th roots of unity. The derivative of z^d at a fixed point ζ with ζ^{d−1} = 1 is dζ^{d−1} = d, at 0 it is 0 (d ≥ 2), and at ∞ the conjugate map w ↦ w^d gives 0.

Inputs: `ArithmeticDynamics:DY.0/rational-map-of-the-projective-line`, `ArithmeticDynamics:DY.0/resultant-of-a-rational-map`, `ArithmeticDynamics:DY.0/good-reduction-of-a-rational-map`, `mathlib:Polynomial.resultant`, `mathlib:Polynomial.natDegree_X_pow`, `mathlib:Polynomial.resultant_eq_zero_iff`.

**Preperiodic and periodic points of the power map** (`DY.6/power-map-preperiodic-points`, lemma).

Let K be a field and d ≥ 2. A point x ∈ ℙ¹(K) is preperiodic for P_d if and only if x ∈ {0, ∞} or x is a root of unity. It is periodic if and only if x ∈ {0, ∞} or x is a root of unity whose order is prime to d; a root of unity of order N prime to d has exact period the multiplicative order of d modulo N.

Hypotheses and conventions: K any field; d ≥ 2.

Proof outline: 0 and ∞ are fixed. If x ≠ 0, ∞ and P_d^m(x) = P_d^n(x) with m < n, then x^{d^m} = x^{d^n}, so x^{d^m(d^{n−m} − 1)} = 1 with a positive exponent; x has finite order (isOfFinOrder_iff_pow_eq_one). Conversely if x has finite order N, all iterates x^{dⁿ} lie in the finite group generated by x, so two coincide and x is preperiodic. x (of order N) is periodic iff x^{dⁿ} = x for some n ≥ 1 iff N | dⁿ − 1 for some n ≥ 1 (orderOf_dvd_iff_pow_eq_one); this forces gcd(N, d) = 1, and conversely gcd(N, d) = 1 gives d^{φ(N)} ≡ 1 (mod N) (Nat.ModEq.pow_totient). The least such n is the order of d in (ℤ/N)^×.

Inputs: `ArithmeticDynamics:DY.6/power-map`, `mathlib:isOfFinOrder_iff_pow_eq_one`, `mathlib:orderOf_dvd_iff_pow_eq_one`, `mathlib:Nat.ModEq.pow_totient`, `mathlib:Function.IsPeriodicPt`, `ClassicalArithmeticCompletion:CA.6/weil-height-eq-zero-iff`.

**Escape rate, local canonical heights and canonical measure of the power map** (`DY.6/power-map-escape-rate`, lemma).

Let d ≥ 2, let K be a number field and v a place of K, and let F_d(z, w) = (z^d, w^d) be the homogeneous lift of P_d. Then the escape rate (DY.2/escape-rate) is G_{F_d,v}(z, w) = log max{|z|_v, |w|_v} for all (z, w) ∈ ℂ_v², the local canonical height (DY.2/local-canonical-height) is λ_{P_d,v}(x) = log⁺|x|_v, and the canonical measure (DY.2/canonical-measure) is μ_{P_d,v} = ω_v: the normalised Haar measure on the unit circle when v is archimedean and the point mass at the Gauss point ζ_{0,1} when v is nonarchimedean.

Hypotheses and conventions: d ≥ 2; K a number field with a place v; ℂ_v the completion of an algebraic closure of K_v. The Laplacian is normalised by Δ log⁺|z|_v = ω_v − δ_∞ (DY.2/canonical-measure).

Proof outline: F_dⁿ(z, w) = (z^{dⁿ}, w^{dⁿ}) and max{|z|^{dⁿ}, |w|^{dⁿ}} = max{|z|, |w|}^{dⁿ}, so d^{−n} log ‖F_dⁿ(z, w)‖_v = log ‖(z, w)‖_v for every n and the limit is attained at n = 0. λ_{P_d,v}(x) = G_{F_d,v}(x, 1) = log max{|x|_v, 1} = log⁺|x|_v. The canonical measure is Δλ + δ_∞ = Δ log⁺|z|_v + δ_∞ = ω_v by the normalisation of the Laplacian (DY.2/canonical-measure).

Inputs: `ArithmeticDynamics:DY.6/power-map`, `ArithmeticDynamics:DY.2/escape-rate`, `ArithmeticDynamics:DY.2/local-canonical-height`, `ArithmeticDynamics:DY.2/canonical-measure`.

**Dynatomic polynomials of the power map are products of cyclotomic polynomials** (`DY.6/power-map-dynatomic-polynomials`, lemma).

Let K be a field of characteristic 0 and d ≥ 2. For n ≥ 1, the affine part of the n-th dynatomic polynomial (DY.3/dynatomic-polynomial) of P_d is Φ*_n(P_d)(z) = z^{[n = 1]} · ∏_{m} Φ_m(z), the product over all m ≥ 1 with gcd(m, d) = 1 and ord_m(d) = n, where Φ_m is the m-th cyclotomic polynomial and ord_m(d) the order of d in (ℤ/m)^×; the point ∞ is a root only for n = 1. Every root has multiplicity one, and the points of formal period n (DY.3/formal-and-exact-period) are exactly the points of exact period n.

Hypotheses and conventions: char K = 0 (so that the cyclotomic polynomials are separable and d is a unit). d ≥ 2, n ≥ 1.

Proof outline: For k ≥ 1, z^{d^k} − z = z (z^{d^k − 1} − 1) = z ∏_{m | d^k − 1} Φ_m(z) (Polynomial.prod_cyclotomic_eq_X_pow_sub_one). In the Möbius product Φ*_n = ∏_{k | n} (z^{d^k} − z)^{μ(n/k)} the exponent of z is Σ_{k|n} μ(n/k) = [n = 1], and the exponent of Φ_m is Σ_{k | n, r | k} μ(n/k) with r = ord_m(d) (since m | d^k − 1 iff r | k); this sum is [n = r] (Möbius inversion, ArithmeticFunction.moebius). The cyclotomic factors are pairwise coprime and separable in characteristic 0, so all roots are simple; a simple root of Φ*_n has exact period n (DY.3/formal-and-exact-period).

Inputs: `ArithmeticDynamics:DY.6/power-map`, `ArithmeticDynamics:DY.3/dynatomic-polynomial`, `ArithmeticDynamics:DY.3/formal-and-exact-period`, `mathlib:Polynomial.cyclotomic`, `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`, `mathlib:ArithmeticFunction.moebius`, `mathlib:orderOf_dvd_iff_pow_eq_one`.

**The preimage tree of the power map and its Kummer Galois action** (`DY.6/power-map-preimage-tree`, lemma).

Let K be a field of characteristic 0, d ≥ 2 and a ∈ K^×. The n-th level of the preimage tree (DY.5/preimage-tree) of P_d at a is P_d^{−n}(a) = {β : β^{dⁿ} = a}, of size dⁿ. Choose a compatible system (β_n) with β_{n+1}^d = β_n, β_0 = a, and a compatible system (ζ_{dⁿ}) of primitive dⁿ-th roots of unity with ζ_{d^{n+1}}^d = ζ_{dⁿ}; then level n is {ζ_{dⁿ}^i β_n : i ∈ ℤ/dⁿ}, and every σ ∈ Gal(K̄/K) acts by ζ_{dⁿ}^i β_n ↦ ζ_{dⁿ}^{χ(σ) i + b_n(σ)} β_n, where χ is the cyclotomic character mod dⁿ and σ(β_n) = ζ_{dⁿ}^{b_n(σ)} β_n. Hence the arboreal representation (DY.5/arboreal-galois-representation) of (P_d, a) takes values in the affine group {i ↦ u i + b : u ∈ ℤ_d^×, b ∈ ℤ_d} of the tree lim ℤ/dⁿ, a subgroup of infinite index in the tree automorphism group for d ≥ 2.

Hypotheses and conventions: char K = 0 (so that x^{dⁿ} − a is separable for a ≠ 0). a ≠ 0 (at a = 0 the tree collapses).

Proof outline: x^{dⁿ} − a is separable (its derivative dⁿx^{dⁿ−1} vanishes only at 0, not a root), so level n has dⁿ points, and they are ζ^i β_n for the dⁿ-th roots of unity ζ^i. σ(ζ_{dⁿ}) = ζ_{dⁿ}^{χ(σ)} and σ(β_n) is again a root of x^{dⁿ} − a, so σ(β_n) = ζ_{dⁿ}^{b_n(σ)} β_n; multiplicativity gives the displayed formula. Compatibility of the β_n and ζ_{dⁿ} under x ↦ x^d makes (χ(σ), b_n(σ)) compatible in n, giving the affine group over ℤ_d = lim ℤ/dⁿ. The affine group of ℤ/dⁿ has order dⁿ φ(dⁿ), smaller than the order of the automorphism group of the d-ary tree of depth n for n ≥ 2, so the image has infinite index.

Inputs: `ArithmeticDynamics:DY.6/power-map`, `ArithmeticDynamics:DY.5/preimage-tree`, `ArithmeticDynamics:DY.5/arboreal-galois-representation`, `mathlib:IsPrimitiveRoot`, `mathlib:rootsOfUnity`.

### 6B. Lattès maps

Lattès maps are the descents of multiplication by n through the x-coordinate, built from Mathlib's division polynomials and Tau Ceti's coprimality and x(nP) formulas; the flexible ones add a 2-torsion translation. They give the second complete example: preperiodic points are the torsion images, the canonical height is twice the Néron–Tate height, and every flexible Lattès map is postcritically finite.

**The Lattès map of multiplication by n on a Weierstrass curve** (`DY.6/lattes-map`, definition, planet: Lattès map).

Let F be a field, E a Weierstrass curve over F (Mathlib WeierstrassCurve) with discriminant Δ(E) ≠ 0, and n ∈ ℤ with n ≠ 0. The Lattès map f_{E,n} : ℙ¹_F → ℙ¹_F is the rational map (DY.0/rational-map-of-the-projective-line) given by the forms (Φ_n^h(X, Z), ΨSq_n^h(X, Z)), the homogenisations in degree n² (Mathlib Polynomial.homogenize) of Mathlib's division polynomials WeierstrassCurve.Φ n and WeierstrassCurve.ΨSq n. In the affine coordinate x it is x ↦ Φ_n(x)/ΨSq_n(x), with f_{E,n}(x) = ∞ when ΨSq_n(x) = 0 and f_{E,n}(∞) = ∞. It is the descent of [n] : E → E through the x-coordinate x : E → ℙ¹ (the quotient by P ↦ −P, with x(O) = ∞): f_{E,n} ∘ x = x ∘ [n] (DY.6/lattes-map-semiconjugacy). For |n| ≥ 2 it has degree n².

Hypotheses and conventions: F any field; E any Weierstrass curve over F with Δ(E) ≠ 0 (no characteristic hypothesis: the coprimality of Φ_n and ΨSq_n holds in every characteristic). n ≠ 0 (ΨSq_0 = 0); f_{E,±1} is the identity and the dynamical statements assume |n| ≥ 2. Δ(E) ≠ 0 is necessary: for the cuspidal cubic y² = x³ the forms Φ_2 = X⁴ and ΨSq_2 = 4X³ share the root 0.

API:

- `lattesMap_apply` (simp): For x in F: f_{E,n}(x) = Φ_n(x)/ΨSq_n(x) if ΨSq_n(x) ≠ 0 and f_{E,n}(x) = ∞ otherwise; f_{E,n}(∞) = ∞.
- `lattesMap_degree` (characterisation): deg f_{E,n} = n² for n ≠ 0.
- `lattesMap_neg` (relation): f_{E,−n} = f_{E,n} (WeierstrassCurve.Φ_neg, WeierstrassCurve.ΨSq_neg).
- `lattesMap_one` (simp): f_{E,1} = id.
- `lattesMap_two` (simp): f_{E,2}(x) = (x⁴ − b₄x² − 2b₆x − b₈)/(4x³ + b₂x² + 2b₄x + b₆).
- `lattesMap_resultant_two` (other): The resultant of (Φ_2, ΨSq_2) is Δ(E)², so f_{E,2} has good reduction (DY.0/good-reduction-of-a-rational-map) at every nonarchimedean place v ∤ 2 at which E has good reduction.
- `lattesMap_map` (functoriality): For a field homomorphism σ : F → L, f_{σ(E),n} = σ(f_{E,n}) (WeierstrassCurve.map_Φ, WeierstrassCurve.map_ΨSq).
- `lattesMap_iterate` (relation): f_{E,n}^k = f_{E,n^k} as rational maps (from DY.6/lattes-map-comp).
- `lattesMap_isFixedPt_infty` (simp): ∞ is a fixed point of f_{E,n}.

Unit tests:

- `lattesMap_two_y2_eq_x3_sub_x` (computation): For E : y² = x³ − x over ℚ, f_{E,2}(x) = (x² + 1)²/(4x(x² − 1)); in particular f_{E,2}(2) = 25/24.
- `lattesMap_one_eq_id` (degenerate): f_{E,1} and f_{E,−1} are the identity rational map.
- `lattesMap_apply_xCoord` (compatibility): For P = (x₀, y₀) ∈ E(F) with nP = (x₁, y₁) affine, f_{E,n}(x₀) = x₁ = x₁ · ΨSq_n(x₀)/ΨSq_n(x₀), matching Tau Ceti WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul.
- `lattesMap_not_of_singular` (non-example): For the singular cubic y² = x³ over ℚ (Δ = 0), Φ_2 = X⁴ and ΨSq_2 = 4X³ are not coprime, so the pair does not define a degree-4 map (it reduces to x ↦ x/4).

Proof outline: Degrees: Φ_n has degree n² and leading coefficient 1 (WeierstrassCurve.natDegree_Φ, WeierstrassCurve.leadingCoeff_Φ) and ΨSq_n has degree at most n² − 1 (WeierstrassCurve.natDegree_ΨSq_le); ΨSq_n ≠ 0 (WeierstrassCurve.ΨSq_ne_zero_of_Δ_ne_zero). Φ_n and ΨSq_n are coprime (WeierstrassCurve.isCoprime_Φ_ΨSq, using Δ ≠ 0), so the degree-n² homogenisations have no common zero on ℙ¹ over an algebraic closure: at Z ≠ 0 by coprimality, at [1 : 0] because Φ_n^h(1, 0) = 1. They therefore define a DY.0 rational map of degree n². f_{E,n}(∞) = [Φ_n^h(1, 0) : ΨSq_n^h(1, 0)] = [1 : 0] since deg ΨSq_n < n². n = 2: Φ_2 = X⁴ − b₄X² − 2b₆X − b₈ and ΨSq_2 = Ψ₂Sq = 4X³ + b₂X² + 2b₄X + b₆ (WeierstrassCurve.Φ_two, WeierstrassCurve.ΨSq_two, WeierstrassCurve.Ψ₂Sq); their resultant is Δ(E)² (a direct computation), so f_{E,2} has good reduction at every place of good reduction of E away from 2.

Inputs: `mathlib:WeierstrassCurve.Φ`, `mathlib:WeierstrassCurve.ΨSq`, `mathlib:WeierstrassCurve.Ψ₂Sq`, `mathlib:WeierstrassCurve.natDegree_Φ`, `mathlib:WeierstrassCurve.leadingCoeff_Φ`, `mathlib:WeierstrassCurve.natDegree_ΨSq_le`, `mathlib:WeierstrassCurve.Φ_two`, `mathlib:WeierstrassCurve.ΨSq_two`, `mathlib:WeierstrassCurve.Φ_neg`, `mathlib:WeierstrassCurve.ΨSq_neg`, `mathlib:WeierstrassCurve.map_Φ`, `mathlib:WeierstrassCurve.map_ΨSq`, `mathlib:Polynomial.homogenize`, `mathlib:WeierstrassCurve.Δ`, `tauceti:WeierstrassCurve.isCoprime_Φ_ΨSq`, `tauceti:WeierstrassCurve.ΨSq_ne_zero_of_Δ_ne_zero`, `ArithmeticDynamics:DY.0/rational-map-of-the-projective-line`.

**The Lattès map semiconjugates multiplication by n** (`DY.6/lattes-map-semiconjugacy`, lemma).

Let F be a field, E/F a Weierstrass curve with Δ(E) ≠ 0, n ≠ 0, and x : E(F) → ℙ¹(F) the x-coordinate (Mathlib WeierstrassCurve.Affine.Point.xRep: x(O) = [1 : 0] = ∞, x(x₀, y₀) = [x₀ : 1]). Then f_{E,n}(x(P)) = x(nP) for every P ∈ E(F). Equivalently, for an affine point P = (x₀, y₀): ΨSq_n(x₀) = 0 if and only if nP = O, and otherwise x(nP) = Φ_n(x₀)/ΨSq_n(x₀).

Hypotheses and conventions: Δ(E) ≠ 0 and n ≠ 0.

Proof outline: P = O: f_{E,n}(∞) = ∞ = x(O) (DY.6/lattes-map). P = (x₀, y₀) and nP = (x₁, y₁) affine: x₁ · ΨSq_n(x₀) = Φ_n(x₀) (WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul) and ΨSq_n(x₀) ≠ 0 (WeierstrassCurve.eval_ΨSq_ne_zero_of_zsmul_ne_zero), so f_{E,n}(x₀) = Φ_n(x₀)/ΨSq_n(x₀) = x₁. P = (x₀, y₀) affine with nP = O: ψ_n(x₀, y₀) = 0 (WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero, transporting nP = O to the Jacobian model), hence ΨSq_n(x₀) = ψ_n(x₀, y₀)² = 0 (WeierstrassCurve.evalEval_ψ_eq_evalEval_Ψ, WeierstrassCurve.evalEval_Ψ_sq_eq_eval_ΨSq); by coprimality Φ_n(x₀) ≠ 0 (WeierstrassCurve.isCoprime_Φ_ΨSq), so f_{E,n}(x₀) = [Φ_n(x₀) : 0] = ∞ = x(O).

Inputs: `ArithmeticDynamics:DY.6/lattes-map`, `mathlib:WeierstrassCurve.Affine.Point.xRep`, `tauceti:WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul`, `tauceti:WeierstrassCurve.eval_ΨSq_ne_zero_of_zsmul_ne_zero`, `tauceti:WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero`, `tauceti:WeierstrassCurve.evalEval_ψ_eq_evalEval_Ψ`, `tauceti:WeierstrassCurve.evalEval_Ψ_sq_eq_eval_ΨSq`, `tauceti:WeierstrassCurve.isCoprime_Φ_ΨSq`, `mathlib:WeierstrassCurve.Jacobian.Point.toAffineAddEquiv`.

**Composition of Lattès maps: f_{E,m} ∘ f_{E,n} = f_{E,mn}** (`DY.6/lattes-map-comp`, lemma).

Let F be a field, E/F a Weierstrass curve with Δ(E) ≠ 0 and m, n nonzero integers. Then f_{E,m} ∘ f_{E,n} = f_{E,mn} as rational maps of ℙ¹_F (equality of the composite pair of forms with (Φ_{mn}^h, ΨSq_{mn}^h) up to a scalar in F^×). In particular f_{E,n}^k = f_{E,n^k}.

Hypotheses and conventions: Δ(E) ≠ 0; m, n ≠ 0.

Proof outline: In the function field F(E), the pullback of x along [n] is Φ_n(x)/ΨSq_n(x) (TauCeti.Isogeny.fieldPullback_mulByIntIsogeny_X), and [m] ∘ [n] = [mn] as isogenies (TauCeti.Isogeny.mulByIntIsogeny_comp_mulByIntIsogeny), whose field pullbacks compose (TauCeti.Isogeny.comp_fieldPullback). Pulling x back along [mn] in the two ways gives the identity Φ_m(r)/ΨSq_m(r) = Φ_{mn}(x)/ΨSq_{mn}(x) in F(E), with r = Φ_n(x)/ΨSq_n(x); since F(x) → F(E) is injective, it holds in F(x) = RatFunc F. Two coprime pairs of forms of degree D that define the same rational function are proportional (clear denominators and use coprimality); the composite forms of f_{E,m} ∘ f_{E,n} have degree m²n² = deg f_{E,mn} (DY.0 composition of forms), so the two rational maps coincide. Alternative check on points: over an algebraic closure every a is an x-coordinate (WeierstrassCurve.Affine.exists_point_on_curve), and f_{E,m}(f_{E,n}(x(P))) = x(m(nP)) = f_{E,mn}(x(P)) (DY.6/lattes-map-semiconjugacy); two rational maps agreeing at infinitely many points are equal (Polynomial.eq_zero_of_infinite_isRoot applied to the cross-multiplied difference).

Inputs: `ArithmeticDynamics:DY.6/lattes-map`, `ArithmeticDynamics:DY.6/lattes-map-semiconjugacy`, `ArithmeticDynamics:DY.0/rational-map-of-the-projective-line`, `tauceti:TauCeti.Isogeny.fieldPullback_mulByIntIsogeny_X`, `tauceti:TauCeti.Isogeny.mulByIntIsogeny_comp_mulByIntIsogeny`, `tauceti:TauCeti.Isogeny.comp_fieldPullback`, `tauceti:WeierstrassCurve.Affine.exists_point_on_curve`, `mathlib:Polynomial.eq_zero_of_infinite_isRoot`.

**Preperiodic points of a Lattès map are the torsion images** (`DY.6/lattes-map-preperiodic-iff-torsion`, theorem).

Let F be a field, E/F a Weierstrass curve with Δ(E) ≠ 0 and n ∈ ℤ with |n| ≥ 2. For P ∈ E(F), the point x(P) ∈ ℙ¹(F) is preperiodic for f_{E,n} if and only if P has finite order. If F is algebraically closed, the set of preperiodic points of f_{E,n} in ℙ¹(F) is exactly x(E(F)_tors) (which contains ∞ = x(O)).

Hypotheses and conventions: Δ(E) ≠ 0; |n| ≥ 2; no characteristic hypothesis.

Proof outline: By DY.6/lattes-map-semiconjugacy and DY.6/lattes-map-comp, f_{E,n}^k(x(P)) = x(n^k P) for all k. If P has finite order N, the points n^k P lie in the finite group generated by P, so the forward orbit of x(P) is finite. Conversely, if f^a(x(P)) = f^b(x(P)) with a < b, then x(n^a P) = x(n^b P). Points with the same x-coordinate are equal or opposite (WeierstrassCurve.Affine.Y_eq_of_X_eq for affine points; only O has x = ∞), so n^b P = ±n^a P and (n^b ∓ n^a)P = O with n^b ∓ n^a ≠ 0 because |n^b| > |n^a|; hence P has finite order (the additive form of isOfFinOrder_iff_pow_eq_one). Over an algebraically closed F, every a ∈ F is x(P) for some P (WeierstrassCurve.Affine.exists_point_on_curve, nonsingular by WeierstrassCurve.Affine.equation_iff_nonsingular_of_Δ_ne_zero), which gives the description of all preperiodic points.

Inputs: `ArithmeticDynamics:DY.6/lattes-map`, `ArithmeticDynamics:DY.6/lattes-map-semiconjugacy`, `ArithmeticDynamics:DY.6/lattes-map-comp`, `mathlib:WeierstrassCurve.Affine.Y_eq_of_X_eq`, `mathlib:isOfFinOrder_iff_pow_eq_one`, `tauceti:WeierstrassCurve.Affine.exists_point_on_curve`, `mathlib:WeierstrassCurve.Affine.equation_iff_nonsingular_of_Δ_ne_zero`.

**The canonical height of a Lattès map is twice the Néron–Tate height** (`DY.6/lattes-map-canonical-height`, theorem).

Let K be a number field, E/K a Weierstrass curve with Δ(E) ≠ 0, n ∈ ℤ with |n| ≥ 2, and P ∈ E(K). Let ĥ_{f_{E,n}} be the canonical height of f_{E,n} on ℙ¹(ℚ̄) normalised against the absolute Weil height (DY.1/canonical-height-on-the-projective-line), and canonicalHeight the Néron–Tate height of Tau Ceti (WeierstrassCurve.Affine.Point.canonicalHeight: ½ lim h_K(x(2^kP))/4^k with the height h_K relative to K, normalised to the divisor (O)). Then ĥ_{f_{E,n}}(x(P)) = 2 · canonicalHeight(P)/[K : ℚ], independently of n. In absolute normalisation this is DeMarco–Krieger–Ye's ĥ_E(P) = ½ ĥ_f(x(P)).

Hypotheses and conventions: K a number field (Mathlib NumberField.instAdmissibleAbsValues); E elliptic; |n| ≥ 2.

Proof outline: The naive height is naiveHeight(Q) = logHeight₁(x(Q)) relative to K (WeierstrassCurve.Affine.Point.naiveHeight_eq_logHeight₁), and absLogHeight₁(a) = logHeight₁(a)/[K : ℚ] for a ∈ K (DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow). f_{E,n}^k(x(P)) = x(n^k P) (DY.6/lattes-map-semiconjugacy, DY.6/lattes-map-comp), so ĥ_{f_{E,n}}(x(P)) = lim_k naiveHeight(n^k P)/(n^{2k}[K : ℚ]) by the defining limit of DY.1/canonical-height-on-the-projective-line. canonicalHeight(n^k P) = n^{2k} canonicalHeight(P) (WeierstrassCurve.Affine.Point.canonicalHeight_zsmul) and |canonicalHeight(Q) − naiveHeight(Q)/2| ≤ D for all Q (WeierstrassCurve.Affine.Point.abs_canonicalHeight_sub_naiveHeight_le); dividing by n^{2k} and letting k → ∞ gives naiveHeight(n^k P)/n^{2k} → 2 canonicalHeight(P).

Inputs: `ArithmeticDynamics:DY.6/lattes-map`, `ArithmeticDynamics:DY.6/lattes-map-semiconjugacy`, `ArithmeticDynamics:DY.6/lattes-map-comp`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_zsmul`, `tauceti:WeierstrassCurve.Affine.Point.abs_canonicalHeight_sub_naiveHeight_le`, `tauceti:WeierstrassCurve.Affine.Point.naiveHeight_eq_logHeight₁`, `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow`, `mathlib:NumberField.absLogHeight₁`.

**Translation by a 2-torsion point acts on the x-line by a Möbius involution** (`DY.6/two-torsion-translation`, lemma).

Let F be a field of characteristic ≠ 2, E/F a Weierstrass curve with Δ(E) ≠ 0 and T = (e, y_T) ∈ E(F) a point of order 2 (so Ψ₂Sq(e) = 0 and y_T = −(a₁e + a₃)/2). Let τ_T be the Möbius transformation τ_T(x) = e + Ψ₂Sq′(e)/(4(x − e)), with τ_T(e) = ∞ and τ_T(∞) = e, where Ψ₂Sq′(e) = 12e² + 2b₂e + 2b₄ ≠ 0. Then x(P + T) = τ_T(x(P)) for every P ∈ E(F), and τ_T ∘ τ_T = id. For T = O set τ_O = id.

Hypotheses and conventions: char F ≠ 2; Δ(E) ≠ 0 (so e is a simple root of Ψ₂Sq and Ψ₂Sq′(e) ≠ 0); T of exact order 2.

Proof outline: 2T = O means y_T = negY(e, y_T), i.e. 2y_T + a₁e + a₃ = 0, and substituting in the curve equation gives Ψ₂Sq(e) = 0 (Ψ₂Sq = (2y + a₁x + a₃)² on the curve). For P = (x, y) with x ≠ e, Mathlib's addition formula (WeierstrassCurve.Affine.Point.add_of_X_ne, WeierstrassCurve.Affine.addX, WeierstrassCurve.Affine.slope) gives x(P + T) = λ² + a₁λ − a₂ − x − e with λ = (y − y_T)/(x − e); reducing modulo the curve equation (a polynomial identity checked symbolically) gives e + Ψ₂Sq′(e)/(4(x − e)). P = T gives O (x = ∞ = τ_T(e)); P = O gives T (τ_T(∞) = e); P = −P′ with x(P′) = e only for P′ = T. Ψ₂Sq′(e) ≠ 0 because a double root of Ψ₂Sq would make Δ = 0 (Ψ₂Sq has discriminant 16Δ); τ_T is an involution because translation by T is.

Inputs: `mathlib:WeierstrassCurve.Affine.Point.add_of_X_ne`, `mathlib:WeierstrassCurve.Affine.addX`, `mathlib:WeierstrassCurve.Affine.slope`, `mathlib:WeierstrassCurve.Affine.negY`, `mathlib:WeierstrassCurve.Ψ₂Sq`, `mathlib:WeierstrassCurve.b₂`, `mathlib:WeierstrassCurve.b₄`, `ArithmeticDynamics:DY.0/conjugacy-of-rational-maps`.

**Flexible Lattès maps and the flexible Lattès locus** (`DY.6/flexible-lattes-map`, definition).

Let K be a field of characteristic 0 with algebraic closure K̄, and d ≥ 2. A rational map f of degree d over K is a flexible Lattès map if there exist an elliptic Weierstrass curve E over K̄, an integer n with |n| ≥ 2, a point T ∈ E(K̄) with 2T = O, and a Möbius transformation φ ∈ PGL₂(K̄) such that φ ∘ f ∘ φ⁻¹ = τ_T ∘ f_{E,n} over K̄ (DY.6/two-torsion-translation, τ_O = id), i.e. f is conjugate to the descent of P ↦ nP + T through x. Then d = n². The flexible Lattès locus L_d ⊂ M_d(K̄) (DY.0/moduli-space-of-rational-maps) is the set of conjugacy classes of flexible Lattès maps of degree d; it is empty unless d is a perfect square.

Hypotheses and conventions: char K = 0 (the sources work over ℂ and ℚ̄; the translation τ_T needs char ≠ 2). The Möbius transformation and the curve may be defined only over K̄. Rigid Lattès maps (quotients of complex-multiplication endomorphisms, or by the groups of order 3, 4, 6) are not flexible and are not constructed in DY.6.

API:

- `lattesMap_isFlexibleLattes` (constructor): For E elliptic over K̄, |n| ≥ 2 and T ∈ E[2], τ_T ∘ f_{E,n} is a flexible Lattès map.
- `IsFlexibleLattes.conj` (relation): Flexible Lattès is invariant under conjugation by PGL₂(K̄).
- `IsFlexibleLattes.degree_eq_sq` (characterisation): A flexible Lattès map has degree n² with |n| ≥ 2.
- `IsFlexibleLattes.isPostcriticallyFinite` (other): Every flexible Lattès map is postcritically finite (DY.6/lattes-map-postcritically-finite).
- `flexibleLattesLocus` (data): L_d ⊆ M_d(K̄), the set of conjugacy classes of flexible Lattès maps of degree d.
- `flexibleLattesLocus_nonempty_iff` (characterisation): L_d ≠ ∅ iff d = n² with n ≥ 2.
- `IsFlexibleLattes.map` (functoriality): Flexible Lattès is preserved by field embeddings K̄ → L̄.

Unit tests:

- `legendreLattesMap_isFlexibleLattes` (computation): For t ∈ ℚ̄ ∖ {0, 1}, the Legendre map f_t = (x² − t)²/(4x(x − 1)(x − t)) is a flexible Lattès map of degree 4.
- `not_isFlexibleLattes_of_not_square` (degenerate): No rational map of degree 2 or 3 is a flexible Lattès map (the degree of a flexible Lattès map is a perfect square ≥ 4).
- `isFlexibleLattes_conj_iff` (compatibility): f is flexible Lattès iff φ ∘ f ∘ φ⁻¹ is, for every φ ∈ PGL₂(K̄); hence L_d is a well-defined subset of M_d(K̄).
- `powerMap_four_not_isFlexibleLattes` (non-example): P_4(z) = z⁴ is not flexible Lattès: 0 is totally invariant (P_4⁻¹(0) = {0}), whereas every point of ℙ¹ has at least two preimages under a flexible Lattès map (the n² preimages under P ↦ nP + T map two-to-one by x).

Proof outline: x(nP + T) = τ_T(x(nP)) = τ_T(f_{E,n}(x(P))) (DY.6/two-torsion-translation, DY.6/lattes-map-semiconjugacy), so τ_T ∘ f_{E,n} is the descent of P ↦ nP + T; its degree is n² since τ_T is Möbius. The predicate is invariant under conjugation by PGL₂(K̄) by construction, so it descends to conjugacy classes (DY.0/conjugacy-of-rational-maps) and defines L_d ⊆ M_d(K̄). Milnor's Lemma 5.5: a Lattès map is flexible iff it is a quotient by ±1 of τ ↦ aτ + b with a ∈ ℤ; commuting with −1 forces 2b ∈ Λ, so b is a 2-torsion point and the map is τ_b ∘ f_{E,a} with E(ℂ) = ℂ/Λ.

Inputs: `ArithmeticDynamics:DY.6/lattes-map`, `ArithmeticDynamics:DY.6/two-torsion-translation`, `ArithmeticDynamics:DY.6/lattes-map-semiconjugacy`, `ArithmeticDynamics:DY.0/conjugacy-of-rational-maps`, `ArithmeticDynamics:DY.0/moduli-space-of-rational-maps`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:AlgebraicClosure`.

**Flexible Lattès maps are postcritically finite** (`DY.6/lattes-map-postcritically-finite`, lemma).

Let K be an algebraically closed field of characteristic 0, E/K elliptic, |n| ≥ 2, T ∈ E[2] and g = τ_T ∘ f_{E,n}. Every critical point of g (DY.0/critical-points-of-a-rational-map) is x(P) for some P with nP ∈ E[2], and g(x(E[2])) ⊆ x(E[2]). Hence the postcritical set of g is contained in the four points x(E[2]) = {∞} ∪ {roots of Ψ₂Sq}, g is postcritically finite (DY.6/postcritically-finite-map), and so is every flexible Lattès map. Precisely, the critical points of f_{E,n} are the 2n² − 2 points x(P) with nP ∈ E[2] and P ∉ E[2], each of multiplicity one.

Hypotheses and conventions: char K = 0 (so that [n] is separable and τ_T is defined); K algebraically closed.

Proof outline: Invariant differential: [n]*ω = n ω for ω = dx/η, η = 2y + a₁x + a₃ (TauCeti.Isogeny.pullbackDifferential_mulByIntIsogeny_invariantDifferential), and the pullback of x along [n] is f_{E,n}(x) (TauCeti.Isogeny.fieldPullback_mulByIntIsogeny_X). Comparing the two sides gives f_{E,n}′(x) · η = n · (η ∘ [n]) in K(E). Evaluating at an affine P with nP affine and P ∉ E[2] (both sides regular; η(P) ≠ 0): f_{E,n}′(x(P)) = n η(nP)/η(P), which vanishes iff η(nP) = 0 iff nP ∈ E[2]. If P ∈ E[2] then nP ∈ E[2] anyway. The poles x(P) with nP = O also satisfy nP ∈ E[2]. So every critical point c = x(P) has nP ∈ E[2], and g(c) = x(nP + T) ∈ x(E[2]). x(E[2]) is forward invariant: g(x(Q)) = x(nQ + T) with nQ + T ∈ E[2] for Q ∈ E[2]. Counting (for the multiplicities): #[n]⁻¹(E[2]) = 4n², of which the 4 points of E[2] are not critical (the local degrees satisfy e_f(x(P))·e_x(P) = e_x(nP) with e_x = 2 exactly on E[2]), leaving 4n² − 4 points and 2n² − 2 = 2 deg g − 2 simple critical points. Conjugation by φ preserves postcritical finiteness, giving the statement for every flexible Lattès map.

Inputs: `ArithmeticDynamics:DY.6/flexible-lattes-map`, `ArithmeticDynamics:DY.6/lattes-map`, `ArithmeticDynamics:DY.6/two-torsion-translation`, `ArithmeticDynamics:DY.6/lattes-map-semiconjugacy`, `ArithmeticDynamics:DY.0/critical-points-of-a-rational-map`, `ArithmeticDynamics:DY.6/postcritically-finite-map`, `tauceti:TauCeti.Isogeny.pullbackDifferential_mulByIntIsogeny_invariantDifferential`, `tauceti:TauCeti.Isogeny.fieldPullback_mulByIntIsogeny_X`, `tauceti:WeierstrassCurve.Affine.invariantDifferential`.

**Uniform boundedness for maps of ℙ¹ bounds torsion on elliptic curves (conditional)** (`DY.6/uniform-torsion-bound-of-uniform-boundedness`, theorem).

Let D ≥ 1. Assume, as an explicit hypothesis, the uniform boundedness statement UBC(1, 4, D) of DY.3/uniform-boundedness-conjecture for morphisms of ℙ¹ of degree 4 over number fields of degree D, with constant C(1, 4, D). Then for every number field K with [K : ℚ] = D and every elliptic curve E/K (a Weierstrass curve with Δ ≠ 0), #E(K)_tors ≤ 2 C(1, 4, D).

Hypotheses and conventions: The uniform boundedness conjecture enters only as the hypothesis UBC(1, 4, D); no statement of DY.6 assumes it otherwise. The conclusion is unconditionally true (it is Merel's theorem), which is not part of this roadmap; the node records how the conjecture is consumed.

Proof outline: f_{E,2} is a degree-4 morphism of ℙ¹ defined over K (DY.6/lattes-map). x maps E(K)_tors into the K-rational preperiodic points of f_{E,2} (DY.6/lattes-map-preperiodic-iff-torsion), and x is at most two-to-one (points with the same x-coordinate are ±P: WeierstrassCurve.Affine.Y_eq_of_X_eq). Hence #E(K)_tors ≤ 2 #PrePer(f_{E,2}, ℙ¹(K)) ≤ 2 C(1, 4, D).

Inputs: `ArithmeticDynamics:DY.3/uniform-boundedness-conjecture`, `ArithmeticDynamics:DY.6/lattes-map`, `ArithmeticDynamics:DY.6/lattes-map-preperiodic-iff-torsion`, `mathlib:WeierstrassCurve.Affine.Y_eq_of_X_eq`.

### 6C. The Legendre family

The Legendre curves E_t : y² = x(x − 1)(x − t) and their Lattès maps f_t carry the DeMarco–Krieger–Ye theory; the symmetries t ↦ 1 − t, 1/t are proved at the level of homogeneous lifts. Standard projections connect arbitrary pairs of elliptic curves to Legendre pairs.

**The Legendre curve E_t and its Lattès map f_t** (`DY.6/legendre-lattes-map`, definition).

Let F be a field of characteristic ≠ 2 and t ∈ F with t ≠ 0, 1. The Legendre curve E_t : y² = x(x − 1)(x − t) is the Mathlib Weierstrass curve with a₁ = a₃ = a₆ = 0, a₂ = −(1 + t), a₄ = t; its discriminant is Δ(E_t) = 16t²(t − 1)² and its j-invariant is j(t) = 256(t² − t + 1)³/(t²(t − 1)²). The Legendre Lattès map is f_t := f_{E_t,2} (DY.6/lattes-map): f_t(x) = (x² − t)²/(4x(x − 1)(x − t)), a rational map of degree 4 with homogeneous lift F_t(z, w) = ((z² − tw²)², 4zw(z − w)(z − tw)). For F = ℚ̄, the Legendre canonical height is ĥ_t := ĥ_{f_t} (DY.1/canonical-height-on-the-projective-line).

Hypotheses and conventions: char F ≠ 2 (for char 2 the curve y² = x(x − 1)(x − t) is singular). t ≠ 0, 1 (exactly the condition Δ(E_t) ≠ 0 when char F ≠ 2).

API:

- `legendreCurve` (data): E_t = WeierstrassCurve with (a₁, a₂, a₃, a₄, a₆) = (0, −(1 + t), 0, t, 0).
- `legendreCurve_Δ` (simp): Δ(E_t) = 16t²(t − 1)².
- `legendreCurve_j` (simp): j(E_t) = 256(t² − t + 1)³/(t²(t − 1)²) for t ≠ 0, 1.
- `legendreLattesMap` (data): f_t = f_{E_t,2}.
- `legendreLattesMap_eq` (simp): f_t(x) = (x² − t)²/(4x(x − 1)(x − t)).
- `legendreLift` (data): F_t(z, w) = ((z² − tw²)², 4zw(z − w)(z − tw)), a homogeneous lift of f_t of degree 4.
- `legendreLift_resultant` (other): Res(F_t) = 256t⁴(t − 1)⁴ = Δ(E_t)².
- `legendreCanonicalHeight` (data): ĥ_t = ĥ_{f_t} on ℙ¹(ℚ̄) for t ∈ ℚ̄ ∖ {0, 1}.
- `legendreCanonicalHeight_eq_zero_iff` (characterisation): ĥ_t(x) = 0 iff x ∈ x(E_t(ℚ̄)_tors) (DY.6/lattes-map-preperiodic-iff-torsion with DY.1/zero-canonical-height-iff-preperiodic).

Unit tests:

- `legendreLattesMap_neg_one` (computation): f_{−1}(x) = (x² + 1)²/(4x(x² − 1)) over ℚ; e.g. f_{−1}(2) = 25/24.
- `legendreCurve_Δ_zero` (degenerate): At t = 0 the curve y² = x²(x − 1) has Δ = 0, and (x² − 0)² = x⁴ and 4x²(x − 1) share the root 0: the formula collapses to x²/(4(x − 1)) of degree 2.
- `legendreLattesMap_eq_lattesMap` (compatibility): f_t = f_{E_t,2}, and the Tau Ceti canonical height of P ∈ E_t(K) equals ½ [K : ℚ] ĥ_t(x(P)) (DY.6/lattes-map-canonical-height).
- `legendreLattesMap_not_polynomial` (non-example): f_t is not a polynomial map: f_t⁻¹(∞) = {0, 1, t, ∞} ≠ {∞} (∞ is not totally invariant).

Proof outline: b₂ = −4(1 + t), b₄ = 2t, b₆ = 0, b₈ = −t², so Φ_2 = x⁴ − 2tx² + t² = (x² − t)² and ΨSq_2 = 4x³ − 4(1 + t)x² + 4tx = 4x(x − 1)(x − t) (WeierstrassCurve.Φ_two, WeierstrassCurve.ΨSq_two). Δ(E_t) = 16t²(t − 1)² and j(t) = 256(t² − t + 1)³/(t²(t − 1)²) from Mathlib's formulas WeierstrassCurve.Δ and WeierstrassCurve.j. Homogenising Φ_2 and ΨSq_2 in degree 4 gives F_t.

Inputs: `ArithmeticDynamics:DY.6/lattes-map`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.Φ_two`, `mathlib:WeierstrassCurve.ΨSq_two`.

**The symmetries t ↦ 1 − t and t ↦ 1/t of the Legendre Lattès family** (`DY.6/legendre-lattes-symmetries`, lemma).

For a field F of characteristic ≠ 2 and t ∈ F ∖ {0, 1}, with A(z, w) = (w − z, w) and B(z, w) = (z, tw): A ∘ F_t = −F_{1−t} ∘ A and B ∘ F_t = F_{1/t} ∘ B as maps F² → F², and more generally A ∘ F_tⁿ = −F_{1−t}ⁿ ∘ A and B ∘ F_tⁿ = F_{1/t}ⁿ ∘ B for all n ≥ 1. On ℙ¹: f_{1−t} = α ∘ f_t ∘ α⁻¹ with α(z) = 1 − z, and f_{1/t} = β ∘ f_t ∘ β⁻¹ with β(z) = z/t.

Hypotheses and conventions: char F ≠ 2; t ≠ 0, 1.

Proof outline: Second coordinates: the second coordinate of F_{1−t}(A(z, w)) is 4(w − z)w(−z)(tw − z) = −4zw(z − w)(z − tw), the negative of the second coordinate of F_t(z, w); first coordinates: (z² − 2zw + tw²)² − (z² − tw²)² = −4zw(z − w)(z − tw), so G − F = −(z² − 2zw + tw²)² with (F, G) = F_t(z, w); this is A ∘ F_t = −F_{1−t} ∘ A (a polynomial identity, ring). F_{1/t}(z, tw) = ((z² − tw²)², 4tzw(z − tw)(z − w)) = B(F_t(z, w)) (ring). Iterating: F_{1−t}(−v) = F_{1−t}(v) since F_{1−t} is homogeneous of even degree 4, so A ∘ F_tⁿ = −F_{1−t}ⁿ ∘ A by induction; similarly for B. On ℙ¹ the linear map A induces [z : w] ↦ [w − z : w], i.e. α(z) = 1 − z, and B induces [z : w] ↦ [z : tw], i.e. z ↦ z/t = β(z); the identities of forms give f_{1−t} = α ∘ f_t ∘ α⁻¹ and f_{1/t} = β ∘ f_t ∘ β⁻¹.

Inputs: `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.0/conjugacy-of-rational-maps`.

**Standard projections of an elliptic curve** (`DY.6/standard-projection`, definition).

Let E be an elliptic curve over an algebraically closed field k of characteristic ≠ 2 (a Mathlib Weierstrass curve with Δ ≠ 0 over k). A standard projection of E is a map π : E(k) → ℙ¹(k) of the form π = φ ∘ x ∘ τ_e, where x is the x-coordinate (x(O) = ∞), τ_e is translation by a point e ∈ E[2] and φ ∈ PGL₂(k); equivalently a degree-two quotient identifying P and −P + 2e′ … restricted here to the quotients identifying P with −P up to a 2-torsion translation, as in DeMarco–Krieger–Ye. Its branch set is π(E[2]), of size 4, and π(E^tors) = φ(x(E^tors)) does not depend on e.

Hypotheses and conventions: k algebraically closed, char k ≠ 2. Over ℂ these are exactly the degree-two quotients π with π(P) = π(−P) composed with 2-torsion translations.

API:

- `standardProjection` (constructor): π = φ ∘ x ∘ τ_e for φ ∈ PGL₂(k), e ∈ E[2].
- `standardProjection_neg` (characterisation): π(−P + 2e) = π(P), i.e. π(−P) = π(P) for e ∈ E[2] (2e = O).
- `standardProjection_branchSet` (characterisation): The points of ℙ¹ with exactly one preimage under π are the four points of π(E[2]); π is two-to-one elsewhere.
- `standardProjection_torsion` (relation): π(E^tors) = φ(x(E^tors)).
- `standardProjection_normalize` (other): A Möbius transformation ψ moves the branch set π(E[2]) to {0, 1, t, ∞} for some t ≠ 0, 1; after translating by a 2-torsion point so that π(O) = ∞, E is in Legendre form E_t.

Unit tests:

- `standardProjection_legendre` (computation): For E_t and e = O, φ = id, the standard projection is x, with branch set {0, 1, t, ∞}.
- `standardProjection_translate` (degenerate): Translating by e ∈ E[2] does not change the set of torsion images: π^e(E^tors) = π(E^tors).
- `standardProjection_branch_card` (compatibility): The branch set π(E[2]) has exactly four points (the roots of Ψ₂Sq and ∞ for π = x, Mathlib WeierstrassCurve.Ψ₂Sq).
- `standardProjection_not_three_to_one` (non-example): The map E → ℙ¹ given by the y-coordinate of y² = x³ + 1 has degree 3, is not a quotient by P ↦ −P, and is not a standard projection.

Proof outline: x ∘ τ_e(P) = τ_e-image of x(P) (DY.6/two-torsion-translation), so π is φ ∘ τ_e′ ∘ x with τ_e′ a Möbius map; it identifies Q and −Q + 2e = −Q. Branch set: x is ramified exactly at E[2] (x(P) = x(−P), P = −P iff P ∈ E[2]), so π(E[2]) = φ(τ_e(x(E[2]))) has four points. π(E^tors) = φ(τ_e(x(E^tors))) = φ(x(E^tors + e)) = φ(x(E^tors)) since E^tors + e = E^tors.

Inputs: `ArithmeticDynamics:DY.6/two-torsion-translation`, `ArithmeticDynamics:DY.6/legendre-lattes-map`, `mathlib:WeierstrassCurve.Affine.Point.xRep`, `mathlib:WeierstrassCurve.IsElliptic`, `ArithmeticDynamics:DY.0/conjugacy-of-rational-maps`.

### 6D. Heights over k(t), families and specialisation

A one-parameter family is a rational map over k(t). Its generic fibre has a canonical height for the degree height of k(t), obtained from a Mathlib `Height.AdmissibleAbsValues` instance on `RatFunc k`; specialisation at parameters of good reduction commutes with iteration; heights of specialised points grow like degree × h(t₀); and Call–Silverman's Theorems 3.1 and 4.1 follow for families over the t-line, with the elliptic specialisation theorem as a consequence through Lattès maps. Tate's and Ingram's O(1) theorems are recorded as endpoints.

**Admissible absolute values and heights on a rational function field** (`DY.6/rational-function-field-heights`, construction).

Let k be a field and k(t) = RatFunc k. For each monic irreducible π ∈ k[t] let |g|_π := exp(−deg π · ord_π g), and let |g|_∞ := exp(deg num(g) − deg denom(g)) (Mathlib RatFunc.inftyValuation), for g ≠ 0. These are nonarchimedean absolute values; for g ≠ 0 almost all of them equal 1 at g; and ∏_v |g|_v = 1. They form an instance of Mathlib's Height.AdmissibleAbsValues on k(t) with no archimedean absolute values. The resulting logarithmic height is the degree height: Height.logHeight₁ g = max(deg num g, deg denom g), and for coprime p, q ∈ k[t] not both zero the height of [p : q] ∈ ℙ¹(k(t)) is Height.logHeight ![p, q] = max(deg p, deg q) =: h_{k(t)}([p : q]).

Hypotheses and conventions: k any field (finite or infinite, any characteristic). The absolute values are normalised so that log|t|_∞ = 1: this is the height relative to the divisor (∞) of degree 1 on ℙ¹_k.

API:

- `ratFuncAdmissibleAbsValues` (instance): The Height.AdmissibleAbsValues instance on RatFunc k: archAbsVal = 0, nonarchAbsVal = {|·|_π} ∪ {|·|_∞}.
- `ratFunc_logHeight₁_eq` (characterisation): Height.logHeight₁ g = max(natDegree (num g), natDegree (denom g)).
- `ratFunc_logHeight_eq` (characterisation): For p, q ∈ k[t] coprime and not both zero, Height.logHeight ![p, q] = max(natDegree p, natDegree q).
- `ratFunc_totalWeight` (simp): Height.totalWeight (RatFunc k) = 0 (no archimedean absolute values), so the constants of Mathlib's lower height bound carry no archimedean factor.
- `ratFunc_logHeight₁_comp` (relation): For nonconstant g, u ∈ k(t), h(g ∘ u) = h(g) · h(u), where g ∘ u = RatFunc.eval (algebraMap k (RatFunc k)) u g.
- `ratFunc_logHeight_map_constants` (functoriality): For a field extension k ⊆ k′, the height of [p : q] ∈ ℙ¹(k(t)) equals its height in ℙ¹(k′(t)).

Unit tests:

- `ratFunc_logHeight₁_example` (computation): In ℚ(t), Height.logHeight₁ ((t² + 1)/(t − 1)) = 2.
- `ratFunc_logHeight₁_C` (degenerate): Height.logHeight₁ (C c) = 0 for every c ∈ k, and Height.logHeight₁ t = 1.
- `ratFunc_logHeight₁_eq_finrank` (compatibility): For g ∈ k(t) ∖ k, Height.logHeight₁ g = [k(t) : k(g)] = max(deg num g, deg denom g) (Mathlib RatFunc.finrank_eq_max_natDegree).
- `ratFunc_logHeight₁_ne_intDegree` (non-example): The height is not Mathlib's RatFunc.intDegree: for g = 1/t, Height.logHeight₁ g = 1 while intDegree g = −1.

Proof outline: Each |·|_π and |·|_∞ comes from a discrete valuation (IsDedekindDomain.HeightOneSpectrum.valuation on k[t], RatFunc.inftyValuation) composed with x ↦ exp(−c·x); ultrametric, hence nonarchimedean. Finiteness of support: g ≠ 0 has finitely many zeros and poles among the monic irreducibles. Product formula: Σ_π deg π · ord_π(g) = deg num(g) − deg denom(g) by unique factorisation in k[t], which is −log|g|_∞. Height: Σ_v log⁺|g|_v = Σ_π deg π · max(0, −ord_π g) + max(0, deg num g − deg denom g) = deg denom g + max(0, deg num g − deg denom g) = max(deg num g, deg denom g); the vector formula follows in the same way with max over coordinates.

Inputs: `mathlib:Height.AdmissibleAbsValues`, `mathlib:Height.logHeight₁`, `mathlib:Height.logHeight`, `mathlib:RatFunc.inftyValuation`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation`, `mathlib:RatFunc.num`, `mathlib:RatFunc.denom`, `mathlib:RatFunc.intDegree`, `mathlib:RatFunc.finrank_eq_max_natDegree`, `mathlib:AbsoluteValue`.

**The height bound for a rational map over k(t)** (`DY.6/function-field-height-bound`, lemma).

Let k be a field and f a rational map of ℙ¹ of degree d ≥ 1 over k(t), given by coprime forms F, G ∈ k(t)[X, Y] of degree d. There is C_f ≥ 0 such that |h_{k(t)}(f(P)) − d · h_{k(t)}(P)| ≤ C_f for all P ∈ ℙ¹(k(t)).

Hypotheses and conventions: k any field; the height is the degree height of DY.6/rational-function-field-heights.

Proof outline: Upper bound: Mathlib Height.logHeight_eval_le for the family (F, G) with the instance of DY.6/rational-function-field-heights: h(f(P)) ≤ d h(P) + log max(mulHeightBound (F, G), 1). Lower bound: the resultant certificate A₁F + B₁G = Res·X^{2d−1}, A₂F + B₂G = Res·Y^{2d−1} (DY.0/resultant-of-a-rational-map; Mathlib Polynomial.exists_mul_add_mul_eq_C_resultant after dehomogenising), divided by Res ∈ k(t)^×, is a family q as in Mathlib Height.logHeight_eval_ge; since totalWeight = 0 the constant is log max(mulHeightBound q, 1). Take C_f the larger of the two constants.

Inputs: `ArithmeticDynamics:DY.6/rational-function-field-heights`, `ArithmeticDynamics:DY.0/resultant-of-a-rational-map`, `mathlib:Height.logHeight_eval_le`, `mathlib:Height.logHeight_eval_ge`, `mathlib:Height.mulHeightBound`, `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant`.

The canonical height of a rational map relative to a field with admissible absolute values (for example K(t) with the degree height of `DY.6/rational-function-field-heights`) is DY.1's `DY.1/canonical-height-over-a-global-height-field`; DY.6 uses it and does not redefine it.

**Specialisation of a one-parameter family of rational maps and of its points** (`DY.6/specialization-of-rational-maps`, construction).

Let k be a field with algebraic closure k̄ and f a rational map of ℙ¹ of degree d ≥ 1 over k(t) (DY.0/rational-map-of-the-projective-line). Choose forms F, G ∈ k[t][X, Y] of degree d representing f whose coefficients have no common factor in k[t] (a primitive representative; unique up to k^×). For t₀ ∈ k̄ let F_{t₀}, G_{t₀} ∈ k̄[X, Y] be obtained by evaluating the coefficients at t₀. The good set is T⁰(f) := {t₀ ∈ k̄ : Res(F, G)(t₀) ≠ 0}, where Res(F, G) ∈ k[t] (DY.0/resultant-of-a-rational-map); it is cofinite. For t₀ ∈ T⁰(f) the specialisation f_{t₀} := [F_{t₀} : G_{t₀}] is a rational map of degree d over k(t₀). For P ∈ ℙ¹(k(t)) written P = [p : q] with p, q ∈ k[t] coprime, its specialisation is P_{t₀} := [p(t₀) : q(t₀)] ∈ ℙ¹(k(t₀)), defined for every t₀ ∈ k̄.

Hypotheses and conventions: k any field; the family is a map over the rational function field k(t) (base curve the t-line). Specialisation of maps is defined on T⁰(f); specialisation of points is defined everywhere since p and q have no common root.

API:

- `specialize` (constructor): f_{t₀} := [F_{t₀} : G_{t₀}] for t₀ ∈ T⁰(f).
- `goodSet` (data): T⁰(f) = {t₀ ∈ k̄ : Res(F, G)(t₀) ≠ 0}.
- `goodSet_compl_finite` (other): k̄ ∖ T⁰(f) is finite.
- `specializePoint` (constructor): P_{t₀} := [p(t₀) : q(t₀)] for P = [p : q], p, q ∈ k[t] coprime.
- `specialize_degree` (characterisation): deg f_{t₀} = d for t₀ ∈ T⁰(f).
- `specialize_iterate` (relation): (fⁿ)_{t₀} = (f_{t₀})ⁿ for t₀ ∈ T⁰(f) (from DY.6/specialization-commutes-with-evaluation).
- `specialize_wellDefined` (extensionality): Any representative (F, G) of f over k[t] of degree deg f gives the same specialisation: for t₀ ∈ T⁰(f) with G_{t₀} ≠ 0, F_{t₀}/G_{t₀} = f_{t₀}.
- `specializePoint_const` (simp): A constant point c ∈ ℙ¹(k) specialises to c.

Unit tests:

- `specialize_sq_add_t` (computation): For f = z² + t over ℚ(t) and t₀ = −2: T⁰(f) = ℚ̄, and f_{−2} = z² − 2.
- `specialize_const` (degenerate): If f has coefficients in k, then T⁰(f) = k̄ ∖ {roots of the constant Res} = k̄ and f_{t₀} = f for every t₀.
- `specialize_legendre` (compatibility): For the Legendre family over ℚ(t): T⁰ = ℚ̄ ∖ {0, 1} and the specialisation at t₀ is DY.6/legendre-lattes-map f_{t₀}.
- `specialize_bad_fibre` (non-example): For f = tz² + z over ℚ(t) (F = tX² + XY, G = Y²), Res(F, G) = t², so 0 ∉ T⁰(f); indeed [F₀ : G₀] = [XY : Y²] is the identity, of degree 1.

Proof outline: Primitive representatives exist and are unique up to k^×: clear denominators and divide by the gcd of the coefficients (k[t] is a UFD). Res(F, G) ∈ k[t] is nonzero because F, G have no common zero over the algebraic closure of k(t); resultants commute with the evaluation map k[t] → k̄ (the Sylvester determinant is a polynomial in the coefficients), so Res(F_{t₀}, G_{t₀}) = Res(F, G)(t₀) and f_{t₀} has degree d exactly on T⁰(f). T⁰(f) is cofinite: its complement is the set of roots of the nonzero polynomial Res(F, G).

Inputs: `ArithmeticDynamics:DY.0/rational-map-of-the-projective-line`, `ArithmeticDynamics:DY.0/resultant-of-a-rational-map`, `mathlib:Polynomial.resultant`, `mathlib:Polynomial.resultant_eq_zero_iff`, `mathlib:RatFunc`.

**Specialisation commutes with evaluation and iteration** (`DY.6/specialization-commutes-with-evaluation`, lemma).

In the setting of DY.6/specialization-of-rational-maps, for every t₀ ∈ T⁰(f) and P ∈ ℙ¹(k(t)): (f(P))_{t₀} = f_{t₀}(P_{t₀}), and hence (fⁿ(P))_{t₀} = f_{t₀}ⁿ(P_{t₀}) for all n ≥ 0.

Hypotheses and conventions: t₀ ∈ T⁰(f), i.e. Res(F, G)(t₀) ≠ 0.

Proof outline: Write P = [p : q] with p, q ∈ k[t] coprime; then f(P) = [F(p, q) : G(p, q)], and a primitive representative is obtained by dividing by g = gcd(F(p, q), G(p, q)) ∈ k[t]. Evaluating the resultant certificate A₁F + B₁G = Res·X^{2d−1}, A₂F + B₂G = Res·Y^{2d−1} (with A_i, B_i ∈ k[t][X, Y]) at (p, q) shows g | Res·p^{2d−1} and g | Res·q^{2d−1}; as gcd(p, q) = 1, g | Res(F, G) (DY.0/resultant-of-a-rational-map, Mathlib Polynomial.exists_mul_add_mul_eq_C_resultant). For t₀ ∈ T⁰(f), g(t₀) ≠ 0, so (f(P))_{t₀} = [F(p, q)(t₀) : G(p, q)(t₀)] = [F_{t₀}(p(t₀), q(t₀)) : G_{t₀}(p(t₀), q(t₀))] = f_{t₀}(P_{t₀}). Induction on n, using that fⁿ(P) ∈ ℙ¹(k(t)).

Inputs: `ArithmeticDynamics:DY.6/specialization-of-rational-maps`, `ArithmeticDynamics:DY.0/resultant-of-a-rational-map`, `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant`.

**The constant of Mathlib's height bound under extension of number fields** (`DY.6/mul-height-bound-base-change`, lemma).

Let K ⊆ L be number fields and p a finite family of polynomials with coefficients in K. Then Height.mulHeightBound computed over L of the image of p is at most (max(Height.mulHeightBound p over K, 1))^{[L:K]}. Consequently c(p) := log max(mulHeightBound_K(p), 1)/[K : ℚ] satisfies log max(mulHeightBound_L(p), 1) ≤ [L : ℚ] · c(p) for every finite extension L of K.

Hypotheses and conventions: K ⊆ L number fields with Mathlib NumberField.instAdmissibleAbsValues on each.

Proof outline: Unfold Height.mulHeightBound: a product over the archimedean absolute values (with multiplicities) of sup_j Σ |coeff|_v and over the finite places of sup_j max(sup |coeff|_v, 1) (Height.mulHeightBound_eq). Each place w of L restricts to a place v of K, |c|_w = |c|_v^{[L_w:K_v]/…} for c ∈ K in the normalisation of Mathlib's places, and Σ_{w | v} [L_w : K_v] = [L : K]; group the factors of the L-product by the place of K below (NumberField.prod_archAbsVal_eq, NumberField.prod_nonarchAbsVal_eq), exactly as in DiophantineApproximationAndTranscendence:DT.0/mul-height-algebra-map. Each group contributes at most the K-factor raised to [L : K] (archimedean sums: |Σ|-values are those of the embedding restricted to K, repeated [L : K] times in total), giving the inequality; divide logarithms by [L : ℚ] = [L : K][K : ℚ].

Inputs: `mathlib:Height.mulHeightBound`, `mathlib:Height.mulHeightBound_eq`, `mathlib:NumberField.instAdmissibleAbsValues`, `DiophantineApproximationAndTranscendence:DT.0/mul-height-algebra-map`, `mathlib:Module.finrank`.

**Height bounds for forms in absolute normalisation, uniform in the field** (`DY.6/absolute-height-bounds-for-forms`, lemma).

Let K be a number field, N, M ≥ 0, and p = (p_j)_{j ∈ J} a finite family of homogeneous polynomials of degree N in variables indexed by a finite type ι, with coefficients in K. For a number field L ⊇ K and x ∈ L^ι ∖ {0}, write h(x) := Height.logHeight_L(x)/[L : ℚ] (independent of L by DiophantineApproximationAndTranscendence:DT.0/mul-height-algebra-map). Then (a) h(p(x)) ≤ N · h(x) + c(p), and (b) if q = (q_{k,j}) are homogeneous of degree M with coefficients in K and Σ_j q_{k,j}(x) p_j(x) = x_k^{M+N} for all k, then h(p(x)) ≥ N · h(x) − c(q) − log #J, where c(·) is the constant of DY.6/mul-height-bound-base-change; moreover c(p) ≤ h_aff(coefficients of p) + log(number of monomials of degree N), with h_aff the absolute affine height of the coefficient vector.

Hypotheses and conventions: K a number field; all points and forms over number fields containing K.

Proof outline: (a) Mathlib Height.logHeight_eval_le over L, then DY.6/mul-height-bound-base-change to bound log max(mulHeightBound_L(p), 1) by [L : ℚ] c(p); divide by [L : ℚ]. (b) Mathlib Height.logHeight_eval_ge over L: the constant is log(#J^{totalWeight L} · max(mulHeightBound_L(q), 1)) with totalWeight L = [L : ℚ] (NumberField.totalWeight_eq_finrank); divide by [L : ℚ]. Bound for c(p): at an archimedean place the sum of the absolute values of the coefficients is at most the number of monomials times their maximum; at a finite place the factor is max(1, max |coeff|_v); take logarithms and sum with the weights of DY.6/mul-height-bound-base-change.

Inputs: `ArithmeticDynamics:DY.6/mul-height-bound-base-change`, `mathlib:Height.logHeight_eval_le`, `mathlib:Height.logHeight_eval_ge`, `DiophantineApproximationAndTranscendence:DT.0/mul-height-algebra-map`, `mathlib:Height.totalWeight`.

**The height of a specialised point grows like its degree** (`DY.6/height-of-specialized-points`, lemma).

Let K be a number field and P = [p : q] ∈ ℙ¹(K(t)) with p, q ∈ K[t] coprime, e := h_{K(t)}(P) = max(deg p, deg q) (DY.6/rational-function-field-heights). There is c(P) ≥ 0 with |h(P_{t₀}) − e · h(t₀)| ≤ c(P) for all t₀ ∈ ℚ̄, where h is the absolute Weil height on ℙ¹(ℚ̄) (h([x : 1]) = NumberField.absLogHeight₁ x, h(∞) = 0).

Hypotheses and conventions: K a number field; t₀ ranges over all of ℚ̄ (P_{t₀} is defined everywhere).

Proof outline: Homogenise: p^h(T, S), q^h(T, S) of degree e (Mathlib Polynomial.homogenize); P_{t₀} = [p^h(t₀, 1) : q^h(t₀, 1)] and h(t₀) = h([t₀ : 1]). Upper bound: DY.6/absolute-height-bounds-for-forms (a). Lower bound: p, q coprime and not both of degree < e give a certificate A p^h + B q^h = T^{M+e}, C p^h + D q^h = S^{M+e} with forms A, B, C, D over K (the resultant certificate of Mathlib Polynomial.exists_mul_add_mul_eq_C_resultant, homogenised and divided by the nonzero resultant); apply DY.6/absolute-height-bounds-for-forms (b). e = 0 (P constant): P_{t₀} = P and the bound is h(P).

Inputs: `ArithmeticDynamics:DY.6/absolute-height-bounds-for-forms`, `ArithmeticDynamics:DY.6/rational-function-field-heights`, `ArithmeticDynamics:DY.6/specialization-of-rational-maps`, `mathlib:Polynomial.homogenize`, `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant`, `mathlib:NumberField.absLogHeight₁`.

**Call–Silverman Theorem 3.1 for one-parameter families of maps of ℙ¹** (`DY.6/uniform-canonical-height-bound-in-families`, lemma).

Let K be a number field and f a rational map of degree d ≥ 2 over K(t), with primitive representative (F, G) over K[t] and good set T⁰(f) (DY.6/specialization-of-rational-maps). There are c₁, c₂ ≥ 0 such that for all t₀ ∈ T⁰(f) ∩ ℚ̄ and all x ∈ ℙ¹(ℚ̄): |h(f_{t₀}(x)) − d · h(x)| ≤ (d − 1)(c₁ h(t₀) + c₂), and therefore |ĥ_{f_{t₀}}(x) − h(x)| ≤ c₁ h(t₀) + c₂, with ĥ_{f_{t₀}} the absolute canonical height (DY.1/canonical-height-on-the-projective-line) and h the absolute Weil height.

Hypotheses and conventions: K a number field; t₀ ∈ ℚ̄ with Res(F, G)(t₀) ≠ 0; d ≥ 2.

Proof outline: Upper bound: apply DY.6/absolute-height-bounds-for-forms (a) to (F_{t₀}, G_{t₀}); its constant is at most h_aff(coefficients of F_{t₀}, G_{t₀}) + log(d + 1), and the coefficients are values at t₀ of polynomials of degree ≤ e over K, whose affine height is at most e · h(t₀) + c (DY.6/absolute-height-bounds-for-forms (a) for the forms (a_i^h(T, S), S^e) at (t₀, 1)). Lower bound: the resultant certificate of (F, G) over K[t] specialises to a certificate for (F_{t₀}, G_{t₀}) with Res(t₀); dividing by Res(t₀) ≠ 0 gives the family q of Mathlib Height.logHeight_eval_ge, whose coefficient height is at most c′ h(t₀) + c″ (numerators by the same polynomial-value bound, and h(1/Res(t₀)) = h(Res(t₀)) ≤ r h(t₀) + c‴); apply DY.6/absolute-height-bounds-for-forms (b). The Tate telescoping bound of DY.1/canonical-height-on-the-projective-line (|ĥ − h| ≤ C/(d − 1) when |h ∘ f − d h| ≤ C; Call–Silverman Theorem 1.1) converts the first estimate into the second.

Inputs: `ArithmeticDynamics:DY.6/specialization-of-rational-maps`, `ArithmeticDynamics:DY.6/absolute-height-bounds-for-forms`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`, `ArithmeticDynamics:DY.0/resultant-of-a-rational-map`, `mathlib:Height.logHeight_eval_ge`, `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant`.

**Call–Silverman specialisation theorem for families of maps of ℙ¹** (`DY.6/specialization-of-canonical-heights`, theorem, planet: Call–Silverman specialization theorem).

Let K be a number field, f a rational map of degree d ≥ 2 over K(t) with good set T⁰(f) (DY.6/specialization-of-rational-maps), and P ∈ ℙ¹(K(t)). Let ĥ^{K(t)}_f be the canonical height of f over K(t) (DY.1/canonical-height-over-a-global-height-field with the degree height of DY.6/rational-function-field-heights) and ĥ_{f_{t₀}} the absolute canonical height of the specialisation (DY.1/canonical-height-on-the-projective-line). Then ĥ_{f_{t₀}}(P_{t₀})/h(t₀) → ĥ^{K(t)}_f(P) as h(t₀) → ∞ with t₀ ∈ T⁰(f) ∩ ℚ̄: for every ε > 0 there is H such that |ĥ_{f_{t₀}}(P_{t₀})/h(t₀) − ĥ^{K(t)}_f(P)| ≤ ε for all t₀ ∈ T⁰(f) ∩ ℚ̄ with h(t₀) ≥ H.

Hypotheses and conventions: K a number field; f of degree d ≥ 2 over K(t); P a K(t)-rational point (a section of the family over the t-line). The base is the t-line: h_T(t₀) = h(t₀), the height of a degree-one divisor on ℙ¹.

Proof outline: (32): |ĥ_{f_{t₀}}(x) − h(x)| ≤ c₁ h(t₀) + c₂ (DY.6/uniform-canonical-height-bound-in-families). (33)–(34): |h(Q_{t₀}) − h_{K(t)}(Q) h(t₀)| ≤ c(Q) for Q ∈ ℙ¹(K(t)) (DY.6/height-of-specialized-points); on ℙ¹ over K(t) the Weil height is exactly the degree height, so Call–Silverman's c₄ is 0. (35): |ĥ^{K(t)}_f(Q) − h_{K(t)}(Q)| ≤ c₅ (DY.1/canonical-height-over-a-global-height-field). Triangle inequality and division by h(t₀) give limsup |ĥ_{f_{t₀}}(Q_{t₀})/h(t₀) − ĥ^{K(t)}_f(Q)| ≤ c₁ + c₅ as h(t₀) → ∞, with c₁, c₅ independent of Q (the point-dependent c(Q) disappears in the limit). Apply this to Q = fⁿ(P): (fⁿP)_{t₀} = f_{t₀}ⁿ(P_{t₀}) (DY.6/specialization-commutes-with-evaluation), so both canonical heights scale by dⁿ; hence dⁿ · limsup |…| ≤ c₁ + c₅ for all n, and the limsup is 0.

Inputs: `ArithmeticDynamics:DY.6/uniform-canonical-height-bound-in-families`, `ArithmeticDynamics:DY.6/height-of-specialized-points`, `ArithmeticDynamics:DY.1/canonical-height-over-a-global-height-field`, `ArithmeticDynamics:DY.6/specialization-commutes-with-evaluation`, `ArithmeticDynamics:DY.6/specialization-of-rational-maps`, `ArithmeticDynamics:DY.6/rational-function-field-heights`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`.

**Non-preperiodic points stay non-preperiodic in specialisations of large height** (`DY.6/specialization-of-non-preperiodic-points`, theorem).

In the setting of DY.6/specialization-of-canonical-heights, if ĥ^{K(t)}_f(P) > 0 then there is H such that P_{t₀} is not preperiodic for f_{t₀} for every t₀ ∈ T⁰(f) ∩ ℚ̄ with h(t₀) > H. In particular, for every r ≥ 1 there are infinitely many t₀ ∈ ℚ̄ with [ℚ(t₀) : ℚ] ≤ r at which P_{t₀} is wandering for f_{t₀}.

Hypotheses and conventions: K a number field; ĥ^{K(t)}_f(P) > 0 (this holds when f is not isotrivial and P is not preperiodic, by Benedetto's theorem for polynomials; that criterion is not part of DY.6, and the node takes positivity as its hypothesis).

Proof outline: By DY.6/specialization-of-canonical-heights, ĥ_{f_{t₀}}(P_{t₀}) ≥ ½ ĥ^{K(t)}_f(P) h(t₀) > 0 once h(t₀) is large. Preperiodic points have canonical height 0 (DY.1/zero-canonical-height-iff-preperiodic), so P_{t₀} is wandering. There are infinitely many t₀ ∈ ℚ of height > H (e.g. integers), which gives the last clause with r = 1.

Inputs: `ArithmeticDynamics:DY.6/specialization-of-canonical-heights`, `ArithmeticDynamics:DY.1/zero-canonical-height-iff-preperiodic`.

**Silverman's specialisation theorem for elliptic surfaces over the t-line** (`DY.6/elliptic-specialization-of-canonical-heights`, theorem).

Let K be a number field and E a Weierstrass curve over K(t) with coefficients in K[t] and Δ(E) ≠ 0, and P ∈ E(K(t)). For t₀ ∈ ℚ̄ with Δ(E)(t₀) ≠ 0 let E_{t₀} be the specialised curve and P_{t₀} ∈ E_{t₀}(ℚ̄) the specialised point. Write ĥ_{E_{t₀}}(Q) := canonicalHeight(Q)/[L : ℚ] for Q ∈ E_{t₀}(L) (absolute Néron–Tate height, Tau Ceti normalisation to (O)) and ĥ_{E/K(t)} for Tau Ceti's canonicalHeight over K(t) with the instance of DY.6/rational-function-field-heights. Then ĥ_{E_{t₀}}(P_{t₀})/h(t₀) → ĥ_{E/K(t)}(P) as h(t₀) → ∞.

Hypotheses and conventions: K a number field; E with coefficients in K[t] (after a change of variables) and Δ ≢ 0; the base is the t-line.

Proof outline: The Lattès family f := f_{E,2} over K(t) (DY.6/lattes-map) specialises at t₀ with Δ(t₀) ≠ 0 to f_{E_{t₀},2}, since Φ_2 and ΨSq_2 commute with specialisation of coefficients (Mathlib WeierstrassCurve.map_Φ, WeierstrassCurve.map_ΨSq); good reduction of the family at such t₀ follows from Res(Φ_2, ΨSq_2) = Δ² (DY.6/lattes-map). x(P)_{t₀} = x(P_{t₀}). DY.6/lattes-map-canonical-height, relative over K(t) and absolute over the fibres: ĥ^{K(t)}_f(x(P)) = 2 ĥ_{E/K(t)}(P) and ĥ_{f_{t₀}}(x(P_{t₀})) = 2 ĥ_{E_{t₀}}(P_{t₀}). Apply DY.6/specialization-of-canonical-heights to f and x(P), and divide by 2.

Inputs: `ArithmeticDynamics:DY.6/specialization-of-canonical-heights`, `ArithmeticDynamics:DY.6/lattes-map`, `ArithmeticDynamics:DY.6/lattes-map-canonical-height`, `ArithmeticDynamics:DY.6/rational-function-field-heights`, `mathlib:WeierstrassCurve.map_Φ`, `mathlib:WeierstrassCurve.map_ΨSq`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`.

**Tate's theorem: the canonical height varies like a Weil height on the base** (`DY.6/tate-variation-of-canonical-height`, theorem).

Let K be a number field, E a Weierstrass curve over K(t) with coefficients in K[t] and Δ(E) ≢ 0, and P ∈ E(K(t)). There is a constant C(E, P) such that |ĥ_{E_{t₀}}(P_{t₀}) − ĥ_{E/K(t)}(P) · h(t₀)| ≤ C(E, P) for all t₀ ∈ ℚ̄ with Δ(E)(t₀) ≠ 0 (absolute Néron–Tate heights normalised to (O), as in DY.6/elliptic-specialization-of-canonical-heights). (For a general base curve X, ĥ_{E_t}(P_t) = h_{D}(t) + O(1) for a ℚ-divisor D of degree ĥ_E(P); for X = ℙ¹ this is the displayed statement.)

Hypotheses and conventions: K a number field; base the t-line; Δ(E)(t₀) ≠ 0.

Proof outline: Tate's proof decomposes ĥ_{E_{t₀}} into Néron local heights λ_{E_{t₀},v} and shows that, as functions of t₀, they differ from local Weil functions of the divisor D_P on the base by bounded amounts; this uses Néron models of E over the local rings of the base (Call–Silverman Remark after Theorem 4.1; Ingram §1). The proof is not decomposed in DY.6: Tate's article is not publicly available (see gaps); the statement is recorded as a source-bound endpoint and strengthens DY.6/elliptic-specialization-of-canonical-heights from o(h(t₀)) to O(1).

Inputs: `ArithmeticDynamics:DY.6/elliptic-specialization-of-canonical-heights`, `ArithmeticDynamics:DY.6/rational-function-field-heights`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`.

**Ingram's theorem: bounded variation for families of polynomials over the t-line** (`DY.6/polynomial-variation-of-canonical-height`, theorem).

Let K be a number field, f ∈ K(t)[z] a polynomial of degree d ≥ 2 in z with coefficients in K(t), and P ∈ ℙ¹(K(t)). There is C(f, P) such that |ĥ_{f_{t₀}}(P_{t₀}) − ĥ^{K(t)}_f(P) · h(t₀)| ≤ C(f, P) for all t₀ ∈ T⁰(f) ∩ ℚ̄ (Ingram, Corollary 2, X = ℙ¹). More generally (Theorem 1), for a family over a smooth projective curve X, ĥ_{f_t}(P_t) = h_{D(f,P)}(t) + O(1) with D(f, P) = lim_N d^{−N} (f^N(P))*(∞) of degree ĥ_f(P).

Hypotheses and conventions: f a polynomial in z (not a general rational map); K a number field; base the t-line for the displayed statement.

Proof outline: Ingram's proof: for each place v of K, compare the local canonical height λ_{f_{t₀},v}(P_{t₀}) with the local Weil function of D(f, P) at t₀; the difference is bounded uniformly in t₀ (and analytic near the support of D), using the explicit Green function of a polynomial: G_{f_{t₀},v}(z) = lim d^{−n} log⁺|f_{t₀}ⁿ(z)|_v (DY.2/escape-rate) and the Böttcher-type estimates near ∞. Summing over places gives Theorem 1; for X = ℙ¹, h_D(t₀) = deg(D) h(t₀) + O(1) gives the displayed Corollary 2. The local estimates of Ingram §§2–4 are not decomposed in DY.6 (coverage remaining item); the node is a source-bound endpoint strengthening DY.6/specialization-of-canonical-heights for polynomial families.

Inputs: `ArithmeticDynamics:DY.6/specialization-of-canonical-heights`, `ArithmeticDynamics:DY.2/escape-rate`, `ArithmeticDynamics:DY.1/canonical-height-over-a-global-height-field`.

### 6E. Critical points and the critical height

Critical points are the zeros of the Jacobian of the forms; the critical height sums canonical heights over them. It is conjugation invariant, additive under iteration, vanishes exactly at postcritically finite maps, and by Ingram's theorem is commensurate with an ample moduli height off the flexible Lattès locus.

The critical divisor of a rational map, with multiplicities, is DY.0's `DY.0/critical-points-of-a-rational-map` (its API includes the chain rule `RationalMap.criticalPoints_comp` and the iterate formula `RationalMap.criticalPoints_iterate`); DY.6 uses it and does not redefine it.

**Postcritically finite rational maps** (`DY.6/postcritically-finite-map`, definition).

Let K be a field of characteristic 0 and f a rational map of degree d ≥ 2 over K. The postcritical set of f is PC(f) = ⋃_{n ≥ 1} fⁿ(supp Crit(f)) ⊆ ℙ¹(K̄). The map f is postcritically finite (PCF) if every critical point of f is preperiodic, equivalently if PC(f) is finite.

Hypotheses and conventions: char K = 0; d ≥ 2.

API:

- `postcriticalSet` (data): PC(f) = ⋃_{n ≥ 1} fⁿ(supp Crit(f)).
- `IsPostcriticallyFinite` (data): Every critical point of f is preperiodic.
- `isPostcriticallyFinite_iff_finite` (characterisation): f is PCF iff PC(f) is finite.
- `IsPostcriticallyFinite.conj` (relation): PCF is invariant under conjugation by PGL₂(K̄).
- `isPostcriticallyFinite_iterate_iff` (relation): f is PCF iff fⁿ is PCF (n ≥ 1), by DY.0/critical-points-of-a-rational-map criticalPoints_iterate.
- `IsPostcriticallyFinite.map` (functoriality): PCF is preserved by field embeddings.

Unit tests:

- `isPCF_sq_sub_two` (computation): z² − 2 over ℚ is postcritically finite, with PC = {−2, 2, ∞}.
- `isPCF_powerMap` (degenerate): P_d (d ≥ 2) is PCF: its critical points 0 and ∞ are fixed, and PC(P_d) = {0, ∞}.
- `isPCF_legendreLattesMap` (compatibility): The Legendre maps f_t are PCF with PC(f_t) = {0, 1, t, ∞} (DY.6/lattes-map-postcritically-finite).
- `not_isPCF_sq_add_one` (non-example): z² + 1 over ℚ is not PCF: the orbit 0, 1, 2, 5, 26, … of the critical point 0 is infinite.

Proof outline: supp Crit(f) is finite (DY.0/critical-points-of-a-rational-map), so PC(f) is finite iff every critical orbit is finite iff every critical point is preperiodic.

Inputs: `ArithmeticDynamics:DY.0/critical-points-of-a-rational-map`, `mathlib:Set.Finite`, `mathlib:Function.IsPeriodicPt`.

**The critical height of a rational map** (`DY.6/critical-height`, definition, planet: Critical height).

Let f be a rational map of ℙ¹ of degree d ≥ 2 defined over ℚ̄ (over a number field). The critical height is ĥ_crit(f) := Σ_{c} m_c · ĥ_f(c), summing over the critical points c of f (DY.0/critical-points-of-a-rational-map) with their multiplicities m_c, where ĥ_f is the absolute canonical height of DY.1/canonical-height-on-the-projective-line. It is a nonnegative real number, invariant under conjugation (DY.6/critical-height-conjugation-invariant), so it defines a function ĥ_crit : M_d(ℚ̄) → [0, ∞) on the moduli space of DY.0/moduli-space-of-rational-maps.

Hypotheses and conventions: f defined over ℚ̄ (the canonical height of DY.1 is defined for maps over number fields); d ≥ 2.

API:

- `criticalHeight` (data): ĥ_crit(f) = Σ_c m_c ĥ_f(c).
- `criticalHeight_nonneg` (other): ĥ_crit(f) ≥ 0.
- `criticalHeight_conj` (relation): ĥ_crit(φ⁻¹ ∘ f ∘ φ) = ĥ_crit(f) (DY.6/critical-height-conjugation-invariant).
- `criticalHeightModuli` (data): The induced function on M_d(ℚ̄).
- `criticalHeight_iterate` (relation): ĥ_crit(fⁿ) = n ĥ_crit(f) (DY.6/critical-height-of-iterate).
- `criticalHeight_eq_zero_iff` (characterisation): ĥ_crit(f) = 0 iff f is PCF (DY.6/critical-height-eq-zero-iff-postcritically-finite).
- `criticalHeight_galois` (functoriality): ĥ_crit(σ(f)) = ĥ_crit(f) for σ ∈ Gal(ℚ̄/ℚ).

Unit tests:

- `criticalHeight_sq_add_c` (computation): For c ∈ ℚ̄, ĥ_crit(z² + c) = ĥ_{z²+c}(0); for c = 1 it is positive since 0 is wandering.
- `criticalHeight_powerMap` (degenerate): ĥ_crit(P_d) = 0 for d ≥ 2.
- `criticalHeight_iterate_two` (compatibility): ĥ_crit(f ∘ f) = 2 ĥ_crit(f) (Ingram's property A′, DY.6/critical-height-of-iterate).
- `criticalHeight_lattes_not_moduli_height` (non-example): ĥ_crit is not bounded below by a positive multiple of an ample height on all of M_4: ĥ_crit(f_t) = 0 for every t ∈ ℚ̄ ∖ {0, 1}, while the classes [f_t] have unbounded moduli height (j(t) is unbounded).

Proof outline: The critical points lie in ℙ¹(ℚ̄) (roots of J(F, G), a nonzero form with algebraic coefficients); the sum is finite with 2d − 2 terms (DY.0/critical-points-of-a-rational-map). Nonnegativity from ĥ_f ≥ 0 (DY.1/canonical-height-on-the-projective-line). Descent to M_d(ℚ̄): DY.6/critical-height-conjugation-invariant.

Inputs: `ArithmeticDynamics:DY.0/critical-points-of-a-rational-map`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`, `ArithmeticDynamics:DY.0/moduli-space-of-rational-maps`.

**The critical height is invariant under conjugation** (`DY.6/critical-height-conjugation-invariant`, lemma).

For f of degree d ≥ 2 over ℚ̄ and φ ∈ PGL₂(ℚ̄): ĥ_crit(φ⁻¹ ∘ f ∘ φ) = ĥ_crit(f). Hence ĥ_crit is well defined on M_d(ℚ̄).

Hypotheses and conventions: f over ℚ̄, d ≥ 2.

Proof outline: Crit(φ⁻¹ ∘ f ∘ φ) = φ⁻¹(Crit(f)) with the same multiplicities (DY.0/critical-points-of-a-rational-map, criticalPoints_conj). ĥ_{φ⁻¹∘f∘φ} = ĥ_f ∘ φ: the right side differs from h by a bounded function (h ∘ φ − h is bounded for a Möbius φ, the degree-one height bound) and satisfies the functional equation for φ⁻¹fφ, so the uniqueness of DY.1/canonical-height-on-the-projective-line applies. Sum over critical points.

Inputs: `ArithmeticDynamics:DY.6/critical-height`, `ArithmeticDynamics:DY.0/critical-points-of-a-rational-map`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`, `ArithmeticDynamics:DY.0/conjugacy-of-rational-maps`.

**Zero critical height characterises postcritically finite maps** (`DY.6/critical-height-eq-zero-iff-postcritically-finite`, theorem).

For f of degree d ≥ 2 over ℚ̄: ĥ_crit(f) = 0 if and only if f is postcritically finite (DY.6/postcritically-finite-map).

Hypotheses and conventions: f over ℚ̄ (a number field K), d ≥ 2.

Proof outline: ĥ_crit(f) is a sum of nonnegative terms m_c ĥ_f(c) with m_c ≥ 1, so it vanishes iff ĥ_f(c) = 0 for every critical point c. Each critical point lies in ℙ¹(L) for a number field L, and over L, ĥ_f(c) = 0 iff c is preperiodic (DY.1/zero-canonical-height-iff-preperiodic).

Inputs: `ArithmeticDynamics:DY.6/critical-height`, `ArithmeticDynamics:DY.6/postcritically-finite-map`, `ArithmeticDynamics:DY.1/zero-canonical-height-iff-preperiodic`.

**The critical height of an iterate** (`DY.6/critical-height-of-iterate`, lemma).

For f of degree d ≥ 2 over ℚ̄ and n ≥ 1: ĥ_crit(fⁿ) = n · ĥ_crit(f).

Hypotheses and conventions: f over ℚ̄, d ≥ 2, n ≥ 1.

Proof outline: Crit(fⁿ) = Σ_{k=0}^{n−1} (f^k)*(Crit(f)) (DY.0/critical-points-of-a-rational-map, criticalPoints_iterate). ĥ_{fⁿ} = ĥ_f (uniqueness in DY.1/canonical-height-on-the-projective-line), and for y with f^k(y) = c, ĥ_f(y) = d^{−k} ĥ_f(c). The divisor (f^k)*[c] has degree d^k, so Σ_{y ∈ (f^k)*[c]} ĥ_f(y) = ĥ_f(c); summing over c and k gives n ĥ_crit(f).

Inputs: `ArithmeticDynamics:DY.6/critical-height`, `ArithmeticDynamics:DY.0/critical-points-of-a-rational-map`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`.

**Ingram's theorem: the critical height is a moduli height** (`DY.6/critical-height-is-a-moduli-height`, theorem, planet: Critical height is a moduli height).

Let d ≥ 2 and let h_{M_d} be an ample Weil height on M_d: the Weil height (HeightsRationalPointsAndObstructions:RP.0) attached to an ample line bundle on a projective compactification of the moduli space M_d (DY.0/moduli-space-of-rational-maps), restricted to M_d(ℚ̄). There are constants c₁, c₃ > 0 and c₂, c₄ ≥ 0 such that c₁ h_{M_d}([f]) − c₂ ≤ ĥ_crit([f]) ≤ c₃ h_{M_d}([f]) + c₄ for all [f] ∈ M_d(ℚ̄) outside the flexible Lattès locus L_d (DY.6/flexible-lattes-map). In particular the non-Lattès PCF classes form a set of bounded height, finite in each bounded degree.

Hypotheses and conventions: d ≥ 2; h_{M_d} any ample Weil height (the constants depend on it). The lower bound fails on L_d: flexible Lattès maps have ĥ_crit = 0 and unbounded moduli height.

Proof outline: Upper bound: |ĥ_f − h| ≤ c(h_{Hom_d}(f) + 1) and the critical points have height ≪ h_{Hom_d}(f), so ĥ_crit(f) ≪ h_{Hom_d}(f) + 1 for a representative of minimal height; Silverman's comparison h_{M_d} ≍ min_{g ~ f} h_{Hom_d}(g) (Ingram Lemma 13) transfers it to M_d. Local input (Ingram Lemmas 7–10): for a fixed point of multiplier λ ≠ 0, 1 and each place v, some critical point is attracted linearly: log⁺|1/(f^k(ζ) − γ)|_v ≥ k log⁺|λ⁻¹|_v − C(f, k, v), expressed through the dynamical Arakelov–Green function built from the escape rate (DY.2/escape-rate) and the multiplier (DY.2/multiplier-of-a-periodic-cycle). Summing over places and critical points (Ingram Lemma 12): d^{k+1} ĥ_crit(f) ≥ (k − 1) h(λ) − (4d − 1)(d + 2) h_{Hom_d}(f) − c₀ k. Summing over fixed points, applying the result to iterates fⁿ with ĥ_crit(fⁿ) = n ĥ_crit(f) (DY.6/critical-height-of-iterate), and using that the multiplier spectrum σ_n : M_d ∖ L_d → S^{dⁿ+1}ℙ¹ has finite fibres for some n (McMullen; Ingram Lemma 14 with the height comparison Lemma 15), one gets ε k h_{M_d}(f) ≤ d^k ĥ_crit(f) + C₅ h_{M_d}(f) + C₆ k; for k large the lower bound follows.

Inputs: `ArithmeticDynamics:DY.6/critical-height`, `ArithmeticDynamics:DY.6/flexible-lattes-map`, `ArithmeticDynamics:DY.6/critical-height-of-iterate`, `ArithmeticDynamics:DY.6/critical-height-conjugation-invariant`, `ArithmeticDynamics:DY.0/moduli-space-of-rational-maps`, `ArithmeticDynamics:DY.2/escape-rate`, `ArithmeticDynamics:DY.2/multiplier-of-a-periodic-cycle`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`, `HeightsRationalPointsAndObstructions:RP.0`.

### 6F. Uniform common torsion images for Legendre pairs (DeMarco–Krieger–Ye)

The escape rates and canonical measures of f_t are computed at every place (§§2–3 of the source), the archimedean energies are estimated near the cusps through degenerations in the hybrid space (§§4–5), and the Arakelov–Zhang pairing is bounded below uniformly and linearly in the parameter height (§6) and above by the number of common small points (§7). Together these give the uniform bound on joint small points over ℚ̄ (Theorem 8.1) and, by specialisation, the uniform bound on common torsion images over ℂ (Theorem 1.4, published Theorem 1.5). Theorem numbers are those of arXiv v2; the published numbering is given in each node.

**Symmetries of the Legendre escape rates (DeMarco–Krieger–Ye Proposition 2.1)** (`DY.6/legendre-escape-rate-symmetries`, lemma).

Let K be a number field, v a place of K and t ∈ K ∖ {0, 1}. With F_t the homogeneous lift of DY.6/legendre-lattes-map and G_{F,v} the escape rate of DY.2/escape-rate: G_{F_{1−t},v}(1 − z, 1) = G_{F_t,v}(z, 1) = G_{F_{1/t},v}(z, t) = G_{F_{1/t},v}(z/t, 1) + log|t|_v for all z ∈ ℂ_v.

Hypotheses and conventions: K a number field, v any place (archimedean or not), t ≠ 0, 1.

Proof outline: A ∘ F_tⁿ = −F_{1−t}ⁿ ∘ A with A(z, w) = (w − z, w) (DY.6/legendre-lattes-symmetries); since ‖−u‖_v = ‖u‖_v and A is invertible linear, ‖A(u)‖_v is within a bounded factor of ‖u‖_v, so d^{−n} log ‖F_tⁿ(z, 1)‖ and d^{−n} log ‖F_{1−t}ⁿ(1 − z, 1)‖ have the same limit. B ∘ F_tⁿ = F_{1/t}ⁿ ∘ B with B(z, w) = (z, tw): the same argument gives G_{F_{1/t},v}(z, t) = G_{F_t,v}(z, 1). Logarithmic homogeneity G(cz, cw) = G(z, w) + log|c|_v (DY.2/escape-rate) with c = t gives the last equality.

Inputs: `ArithmeticDynamics:DY.6/legendre-lattes-symmetries`, `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.2/escape-rate`.

**Symmetries of the local energy (DeMarco–Krieger–Ye Proposition 2.3)** (`DY.6/legendre-local-energy-symmetries`, lemma).

Let K be a number field, v ∈ M_K and t₁, t₂ ∈ K ∖ {0, 1}. The local energy E_v(t₁, t₂) = ½(∫(λ_{t₁,v} − λ_{t₂,v}) dμ_{t₂,v} + ∫(λ_{t₂,v} − λ_{t₁,v}) dμ_{t₁,v}) = ½(μ_{t₁,v} − μ_{t₂,v}, μ_{t₁,v} − μ_{t₂,v})_v of the Legendre heights (the local term of the Arakelov–Zhang pairing, DY.4/arakelov-zhang-pairing) satisfies E_v(t₂, t₁) = E_v(t₁, t₂) = E_v(1 − t₁, 1 − t₂) = E_v(1/t₁, 1/t₂).

Hypotheses and conventions: K a number field; v any place; t₁, t₂ ≠ 0, 1.

Proof outline: Symmetry in (t₁, t₂) is visible from the formula. E_v(t₁, t₂) = −½ ∫ g d(μ_{t₁,v} − μ_{t₂,v}) for any continuous potential g of μ_{t₁,v} − μ_{t₂,v} (DY.4/arakelov-zhang-pairing); g = λ_{t₁,v} − λ_{t₂,v} + c. f_{1−t} = α ∘ f_t ∘ α⁻¹ with α(z) = 1 − z (DY.6/legendre-lattes-symmetries), so μ_{1−t,v} = α_*μ_{t,v} (canonical measures are natural under conjugation, DY.2/canonical-measure) and g ∘ α⁻¹ is a potential for μ_{1−t₁,v} − μ_{1−t₂,v}; the integral is unchanged. The same with β(z) = z/t for 1/t.

Inputs: `ArithmeticDynamics:DY.6/legendre-lattes-symmetries`, `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.2/canonical-measure`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Good reduction and canonical measures of f_t at places not above 2 (DeMarco–Krieger–Ye Proposition 3.2)** (`DY.6/legendre-canonical-measure-away-from-two`, theorem).

Let K be a number field, v a nonarchimedean place of K with v ∤ 2, and t ∈ K ∖ {0, 1}. Then f_t has good reduction at v (DY.0/good-reduction-of-a-rational-map) if and only if |t(t − 1)|_v = 1, in which case μ_{t,v} is the point mass at the Gauss point ζ_{0,1}. If |t(t − 1)|_v ≠ 1, then f_t does not have potential good reduction at v, and its canonical measure μ_{t,v} (DY.2/canonical-measure) is the interval measure (uniform for the hyperbolic metric) on [ζ_{0,1}, ζ_{0,|t|_v}] when |t|_v ≠ 1, and on [ζ_{0,1}, ζ_{1,|1−t|_v}] when |1 − t|_v < 1.

Hypotheses and conventions: v nonarchimedean, v ∤ 2; t ≠ 0, 1.

Proof outline: Good reduction: Res(F_t) = 256t⁴(t − 1)⁴ (DY.6/legendre-lattes-map) is a v-unit iff |t(t − 1)|_v = 1 when |t|_v ≤ 1 and |1 − t|_v ≤ 1; if |t|_v > 1 the normalised lift has non-unit resultant. By DY.6/legendre-escape-rate-symmetries (t ↦ 1/t, 1 − t) it suffices to treat |t|_v > 1. For |t|_v > 1 the interval I = [ζ_{0,1}, ζ_{0,|t|_v}] is totally invariant, f_t⁻¹(I) = I, and f_t acts on it by the tent map f_t(ζ_{0,|t|^r}) = ζ_{0,|t|^{2r−1}} for ½ ≤ r ≤ 1 and ζ_{0,|t|^{1−2r}} for 0 ≤ r ≤ ½ (Favre–Rivera-Letelier §5.1; the action of f_t on type II points is DY.2's dynamics on the Berkovich line). The uniform measure on I is the unique f_t-balanced probability measure supported on the totally invariant interval, hence equals μ_{t,v} (characterisation of DY.2/canonical-measure); a measure that is not a point mass at a type II point rules out potential good reduction.

Inputs: `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.6/legendre-escape-rate-symmetries`, `ArithmeticDynamics:DY.0/good-reduction-of-a-rational-map`, `ArithmeticDynamics:DY.2/canonical-measure`, `TropicalAndBerkovichArithmetic:TB.0`.

**Explicit escape rates of f_t at places not above 2 (DeMarco–Krieger–Ye Propositions 3.3–3.4)** (`DY.6/legendre-escape-rate-away-from-two`, theorem).

Let v be a nonarchimedean place of a number field K with v ∤ 2 and t ∈ K ∖ {0, 1}. (a) If |t(t − 1)|_v ≥ 1, then G_{F_t,v}(z, 1) = log|z|_v for |z|_v ≥ |t|_v, = ½(log²|z|_v/log|t|_v + log|t|_v) for 1 < |z|_v < |t|_v, and = ½ log|t|_v for |z|_v ≤ 1. (b) If |t|_v < 1, then G_{F_t,v}(z, 1) = log|z|_v for |z|_v ≥ 1, = −log²|z|_v/(2 log|t|_v) + log|z|_v for |t|_v < |z|_v < 1, and = ½ log|t|_v for |z|_v ≤ |t|_v.

Hypotheses and conventions: v ∤ 2 nonarchimedean; in (a) the middle range is empty when |t|_v = 1.

Proof outline: Let λ be the continuous extension to the Berkovich affine line of the right-hand side; a direct computation of its Laplacian gives Δλ = μ_{t,v} − δ_∞ with μ_{t,v} the interval measure of DY.6/legendre-canonical-measure-away-from-two. The local canonical height λ_{t,v} = G_{F_t,v}(·, 1) (DY.2/local-canonical-height) satisfies the same equation, so λ − λ_{t,v} is harmonic on the Berkovich line, hence constant (DY.2/canonical-measure uniqueness of potentials). At z₀ with |z₀|_v > |t|_v, induction gives |z_n|_v = |z₀|_v^{4ⁿ} > |t|_v |w_n|_v for (z_n, w_n) = F_tⁿ(z₀, 1), so G(z₀, 1) = log|z₀|_v = λ(z₀) and the constant is 0. Part (b) is the same computation (or follows from (a) and DY.6/legendre-escape-rate-symmetries).

Inputs: `ArithmeticDynamics:DY.6/legendre-canonical-measure-away-from-two`, `ArithmeticDynamics:DY.6/legendre-escape-rate-symmetries`, `ArithmeticDynamics:DY.2/escape-rate`, `ArithmeticDynamics:DY.2/local-canonical-height`, `ArithmeticDynamics:DY.2/canonical-measure`.

**Canonical measures of f_t at places above 2 (DeMarco–Krieger–Ye Proposition 3.5)** (`DY.6/legendre-canonical-measure-above-two`, theorem).

Let v | 2 be a place of a number field K and t ∈ K ∖ {0, 1}. The canonical measure μ_{t,v} is the interval measure on [ζ_{0,|t/4|_v}, ζ_{0,|4|_v}] if |t|_v < |16|_v, on [ζ_{0,1/|4|_v}, ζ_{0,|4t|_v}] if |t|_v > 1/|16|_v, and on [ζ_{1,|1−t|_v/|4|_v}, ζ_{1,|4|_v}] if |1 − t|_v < |16|_v. If |16|_v ≤ |t|_v ≤ 1/|16|_v and |1 − t|_v ≥ |16|_v, then f_t has potential good reduction and μ_{t,v} is a point mass at a type II point of the Berkovich line; this point has diameter |Δ(E_t)|_v^{1/6} = |2|_v^{2/3}|t(t − 1)|_v^{1/3} (review of PAPER-DEMARCO-KRIEGER-YE-20, E7).

Hypotheses and conventions: v | 2; t ≠ 0, 1.

Proof outline: For |t|_v > 1/|16|_v the interval [ζ_{0,1/|4|}, ζ_{0,|4t|}] is totally invariant and f_t acts by the tent map f_t(ζ_{0,|4t||16t|^{−r}}) = ζ_{0,|4t||16t|^{−2r}} and f_t(ζ_{0,|4t||16t|^{r−1}}) = ζ_{0,|4t||16t|^{−2r}} for r ∈ [0, ½]; conclude as in DY.6/legendre-canonical-measure-away-from-two. The cases |t|_v < |16|_v and |1 − t|_v < |16|_v follow by DY.6/legendre-escape-rate-symmetries. In the remaining range |j(t)|_v ≤ 1 (from j(t) = 256(t² − t + 1)³/(t²(t − 1)²)), so E_t has potential good reduction, hence so does f_t (a change of coordinates x = u²x′ + r to a good model with |u|¹² = |Δ_t|); μ_{t,v} is then the point mass at the image of the Gauss point.

Inputs: `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.6/legendre-escape-rate-symmetries`, `ArithmeticDynamics:DY.6/legendre-canonical-measure-away-from-two`, `ArithmeticDynamics:DY.2/canonical-measure`, `ArithmeticDynamics:DY.0/good-reduction-of-a-rational-map`, `mathlib:WeierstrassCurve.j`.

**Explicit escape rates of f_t at places above 2 (DeMarco–Krieger–Ye Proposition 3.6)** (`DY.6/legendre-escape-rate-above-two`, theorem).

Let v | 2. (a) For |t|_v ≥ 1/|16|_v: G_{F_t,v}(z, 1) = log|z|_v for |z|_v ≥ |4t|_v, = ½(log²|4z|_v/log|16t|_v + log|t|_v) for 1/|4|_v < |z|_v < |4t|_v, and = ½ log|t|_v for |z|_v ≤ 1/|4|_v. (b) For |t|_v ≤ |16|_v: G_{F_t,v}(z, 1) = log|z|_v for |z|_v ≥ |4|_v, = ½(log²|4z/t|_v/log|16/t|_v + log|t|_v) for |t/4|_v < |z|_v < |4|_v, and = ½ log|t|_v for |z|_v ≤ |t/4|_v. (The middle range of (b) is printed |4|_v < |z|_v < |t/4|_v, which is empty; ArithmeticDynamics/E701.)

Hypotheses and conventions: v | 2 nonarchimedean.

Proof outline: As in DY.6/legendre-escape-rate-away-from-two: the right-hand side has Laplacian μ_{t,v} − δ_∞ with μ_{t,v} from DY.6/legendre-canonical-measure-above-two, and agrees with G_{F_t,v} for |z|_v large. (b) follows from (a) through DY.6/legendre-escape-rate-symmetries (t ↦ 1/t); this is how the corrected middle range is checked, and the formula is continuous at |z|_v = |t/4|_v and |4|_v.

Inputs: `ArithmeticDynamics:DY.6/legendre-canonical-measure-above-two`, `ArithmeticDynamics:DY.6/legendre-escape-rate-symmetries`, `ArithmeticDynamics:DY.2/escape-rate`, `ArithmeticDynamics:DY.2/canonical-measure`.

**Lower bound for the nonarchimedean local energy (DeMarco–Krieger–Ye Theorem 3.1)** (`DY.6/nonarchimedean-legendre-energy-lower-bound`, theorem).

Let K be a number field, v a nonarchimedean place and t₁, t₂ ∈ K ∖ {0, 1}. Then E_v(t₁, t₂) − (4/3) log|2|_v is at least log²|t₁/t₂|_v/(6 log max{|t₁|_v, |t₂|_v}) if min{|t₁|_v, |t₂|_v} > 1; at least log²|t₁/t₂|_v/(−6 log min{|t₁|_v, |t₂|_v}) if max{|t₁|_v, |t₂|_v} < 1; and at least |log|t₁/t₂|_v|/6 otherwise. Equality holds for v ∤ 2 with min{|t₁ − 1|_v, |t₂ − 1|_v} ≥ 1.

Hypotheses and conventions: v nonarchimedean; E_v the local energy of the Legendre heights (DY.4/arakelov-zhang-pairing).

Proof outline: v ∤ 2: compute 2E_v = ∫(λ_{t₁} − λ_{t₂}) dμ_{t₂} + ∫(λ_{t₂} − λ_{t₁}) dμ_{t₁} with the explicit potentials of DY.6/legendre-escape-rate-away-from-two against the interval measures of DY.6/legendre-canonical-measure-away-from-two (integrals of quadratics in x = log|z| over [log|t|, 0] or [0, log|t|]): case |t₁| > 1 > |t₂| gives log|t₁/t₂|/3; case both > 1 gives log²|t₁/t₂|/(3 log max); the good-reduction case gives |log|t₁||/3; the remaining cases by DY.6/legendre-local-energy-symmetries. v | 2: the same computation with DY.6/legendre-escape-rate-above-two and DY.6/legendre-canonical-measure-above-two, losing at most (4/3) log|2|_v⁻¹ through the factors |4|, |16| in the intervals.

Inputs: `ArithmeticDynamics:DY.6/legendre-escape-rate-away-from-two`, `ArithmeticDynamics:DY.6/legendre-canonical-measure-away-from-two`, `ArithmeticDynamics:DY.6/legendre-escape-rate-above-two`, `ArithmeticDynamics:DY.6/legendre-canonical-measure-above-two`, `ArithmeticDynamics:DY.6/legendre-local-energy-symmetries`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Degeneration of the maximal-entropy measures of f_t at a cusp (DeMarco–Faber, Favre)** (`DY.6/legendre-measure-degeneration`, theorem).

Let μ_t be the measure of maximal entropy of f_t on ℙ¹(ℂ) (the archimedean canonical measure, DY.2/canonical-measure) and μ̂_f the canonical measure of the family f_T over the complete field k₀ = ℂ((T)), the uniform measure on [ζ_{0,|T|₀}, ζ_{0,1}] ⊂ P^{1,an}_{k₀} (computed as in DY.6/legendre-escape-rate-away-from-two (b) with |T|₀ < 1). Then (a) for C > 1 and real a ≥ b, μ_t(A_t(a, b, C)) → length([0, 1] ∩ [b, a]) as t → 0, where A_t(a, b, C) = {z : C⁻¹|t|^a ≤ |z| ≤ C|t|^b}; (b) μ_t → μ̂_f weakly in the hybrid space X^hyb of the family (TropicalAndBerkovichArithmetic:TB.0); and (c) the normalised potentials ϕ(t, z) = (G_{F_t}(z, 1) − log⁺|z|)/log|t|⁻¹ extend continuously to X^hyb with central values φ̂_f(x) = 0, log|x|₀ − (log|x|₀)²/(2 log|T|₀), ½ log|T|₀ on the three ranges |x|₀ ≥ 1, |T|₀ < |x|₀ < 1, |x|₀ ≤ |T|₀.

Hypotheses and conventions: Archimedean place; the family f_t for t in a punctured disc around the cusp 0 (the cusps 1 and ∞ follow by DY.6/legendre-escape-rate-symmetries).

Proof outline: (a) is DeMarco–Faber [DF1, Theorem B] (or [DF2, Theorem D] with a vertex set in [ζ_{0,1}, ζ_{0,|T|₀}]) applied to the meromorphic family f_t, allowing coordinate changes and base changes. (b), (c) are Favre's convergence theorem in the hybrid space [Fa, Theorem B, Theorem 2.10, §4.3]. These theorems of complex dynamics are not decomposed in DY.6 (gap); the hybrid space is TropicalAndBerkovichArithmetic:TB.0's.

Inputs: `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.2/canonical-measure`, `ArithmeticDynamics:DY.6/legendre-escape-rate-away-from-two`, `TropicalAndBerkovichArithmetic:TB.0`.

**Equidistribution of μ_t on annuli near a cusp (DeMarco–Krieger–Ye Lemma 4.1 and (4.4))** (`DY.6/legendre-measure-on-annuli-near-cusp`, lemma).

For every ε > 0 and integer n ≥ 1 there is δ > 0 such that 1/n − ε < μ_t({|t|^{(i+1)/n} ≤ |z| ≤ |t|^{i/n}}) < 1/n + ε for all 0 < |t| < δ and i = 0, …, n − 1; consequently (taking ε = 1/n²) μ_t({|z| ≥ 1} ∪ {|z| ≤ |t|}) < 1/n for 0 < |t| < δ.

Hypotheses and conventions: Archimedean place; t near the cusp 0.

Proof outline: Apply DY.6/legendre-measure-degeneration (a) to the n annuli with (a, b) = ((i + 1)/n, i/n) and a constant C slightly larger than 1; the limit masses are 1/n. The complement of the n annuli in {|t| < |z| < 1} is covered by thin annuli of limit mass 0; total mass 1 gives (4.4).

Inputs: `ArithmeticDynamics:DY.6/legendre-measure-degeneration`.

**Uniform continuity of the normalised potentials near a cusp (DeMarco–Krieger–Ye Propositions 4.2–4.3)** (`DY.6/legendre-potential-continuity-near-cusp`, lemma).

(a) For every ε > 0 there is δ > 0 such that |ϕ(t, z) − φ̂_f(ζ_{0,|T|₀^a})| < ε for all 0 < |t| < δ, all a ∈ ℝ and all z with |log|z|/log|t| − a| < δ. (b) For every ε > 0 and M > 1 there is δ > 0 such that |G_{F_t}(z, 1)/log|t|⁻¹ − ĝ_f(ζ_{0,|T|₀^a})| < ε for all 0 < |t| < δ, all a ∈ ℝ and all |z| ≤ M with |log|z|/log|t| − a| < δ. Here ϕ and φ̂_f are as in DY.6/legendre-measure-degeneration and ĝ_f is the nonarchimedean escape rate of f_T over ℂ((T)).

Hypotheses and conventions: Archimedean place, t near 0.

Proof outline: The segment [0, ∞] of P^{1,an}_{k₀} is compact; ϕ extends continuously to X^hyb (DY.6/legendre-measure-degeneration (c)). The hybrid topology makes the annular sets {|t|^{a+δ} < |z| < |t|^{a−δ}, 0 < |t| < δ} ∪ A(|T|₀^{a+δ}, |T|₀^{a−δ}) open (TropicalAndBerkovichArithmetic:TB.0); uniform continuity on a compact neighbourhood of the segment gives (a). (b) is (a) plus the bounded difference G_{F_t}(z, 1) − ϕ(t, z) log|t|⁻¹ = log⁺|z| ≤ log M.

Inputs: `ArithmeticDynamics:DY.6/legendre-measure-degeneration`, `TropicalAndBerkovichArithmetic:TB.0`.

**Regularising finite sets against μ_t (DeMarco–Krieger–Ye Proposition 4.4)** (`DY.6/legendre-regularization-estimate`, theorem).

For every ε > 0 there is c(ε) > 0 such that |(μ_t, [F]) − (μ_t, [F]_r)| < ε max{log|t|⁻¹, log|t − 1|⁻¹, log|t|, 1} for all t ∈ ℂ ∖ {0, 1}, every finite set F ⊂ ℂ and every r ≤ c min{|t|², |t − 1|², |t|⁻²}, where [F] is the uniform probability measure on F, [F]_r spreads it uniformly on circles of radius r about the points of F, and (·, ·) is the mutual energy (DY.4/arakelov-zhang-pairing).

Hypotheses and conventions: Archimedean place; t ∈ ℂ ∖ {0, 1} arbitrary; F any finite set.

Proof outline: G_{F_t}(·, 1) is a potential for μ_t: ∫ log|z − w| dμ_t(z) = G_{F_t}(w, 1) + C_t, so (μ_t, [F]_r) − (μ_t, [F]) is an average over x ∈ F of the differences of G_{F_t}(·, 1) on the circle of radius r about x and at x. For t in a compact subset of ℂ ∖ {0, 1}, uniform continuity of Φ_t = G_{F_t}(·, 1) − log⁺|·| in (t, z) bounds the difference by ε. Near each cusp, DY.6/legendre-potential-continuity-near-cusp gives the bound ε log|t|⁻¹ (resp. log|t − 1|⁻¹, log|t|) for r below the stated radius; the three cusps are exchanged by DY.6/legendre-escape-rate-symmetries.

Inputs: `ArithmeticDynamics:DY.6/legendre-potential-continuity-near-cusp`, `ArithmeticDynamics:DY.6/legendre-escape-rate-symmetries`, `ArithmeticDynamics:DY.2/escape-rate`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Archimedean energy with one parameter at a cusp (DeMarco–Krieger–Ye Theorem 5.1)** (`DY.6/archimedean-energy-one-escaping-parameter`, theorem).

For every ε > 0 and compact C ⊂ ℂ ∖ {0, 1} there is δ > 0 such that (1/6 − ε) log|s|⁻¹ ≤ E_∞(s, t) ≤ (1/6 + ε) log|s|⁻¹ for all 0 < |s| < δ and t ∈ C, where E_∞ is the archimedean local energy of the Legendre heights (DY.4/arakelov-zhang-pairing).

Hypotheses and conventions: Archimedean place.

Proof outline: Write E_∞(s, t) through the potentials Φ_s = G_{F_s}(·, 1) − log⁺|·| and ϕ(s, ·) = Φ_s/log|s|⁻¹. As s → 0, μ_s → μ̂_f and ϕ(s, ·) → φ̂_f in the hybrid space (DY.6/legendre-measure-degeneration), while μ_t, Φ_t stay in a compact family (t ∈ C). The leading term is −½ ∫ φ̂_f dμ̂_f · log|s|⁻¹ with ∫ φ̂_f dμ̂_f = −1/3; the remaining terms are o(log|s|⁻¹) by DY.6/legendre-potential-continuity-near-cusp.

Inputs: `ArithmeticDynamics:DY.6/legendre-measure-degeneration`, `ArithmeticDynamics:DY.6/legendre-potential-continuity-near-cusp`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Archimedean energy with both parameters at the same cusp, bounded ratio (DeMarco–Krieger–Ye Proposition 5.3)** (`DY.6/archimedean-energy-same-cusp-bounded-ratio`, lemma).

For every ε > 0 and B > 2 there is δ > 0 such that (E₀(μ̂₁, μ̂_b) − ε) log|t|⁻¹ ≤ E_∞(s, t) ≤ (E₀(μ̂₁, μ̂_b) + ε) log|t|⁻¹ for all s, t with 0 < |t|^B ≤ |s| ≤ |t| < δ, where b = log|s|/log|t| ∈ [1, B] and E₀(μ̂₁, μ̂_b) = (b − 1)²/(6b) is the nonarchimedean energy over ℂ((T)) of the canonical measures of f_T and f_{T^b}.

Hypotheses and conventions: Archimedean place; b bounded by B.

Proof outline: Rescale the potentials: ϕ(t, z) = Φ_{F_t}(z, 1)/log|t|⁻¹ and b ϕ(s, z) = Φ_{F_s}(z, 1)/log|t|⁻¹. Weak convergence μ_t → μ̂₁ and μ_s → μ̂_b in the hybrid space, uniformly for b ∈ [1, B], with convergence of potentials (DY.6/legendre-measure-degeneration, DY.6/legendre-potential-continuity-near-cusp). E₀(μ̂₁, μ̂_b) is computed by DY.6/nonarchimedean-legendre-energy-lower-bound (equality case with |T| < 1): (b − 1)²/(6b).

Inputs: `ArithmeticDynamics:DY.6/legendre-measure-degeneration`, `ArithmeticDynamics:DY.6/legendre-potential-continuity-near-cusp`, `ArithmeticDynamics:DY.6/nonarchimedean-legendre-energy-lower-bound`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Archimedean energy with both parameters at the same cusp (DeMarco–Krieger–Ye Theorems 5.2 and 5.4)** (`DY.6/archimedean-energy-same-cusp`, theorem).

For every ε > 0 there is δ > 0 such that, for all s, t with 0 < |s| ≤ |t| < δ and b = log|s|/log|t| ≥ 1: ((1/6)(1 − 1/b)² − ε) log|s|⁻¹ ≤ E_∞(s, t) ≤ ((1/6)(1 − 1/b)² + ε) log|s|⁻¹ (Theorem 5.2), equivalently ((b − 1)²/(6b) − bε) log|t|⁻¹ ≤ E_∞(s, t) ≤ ((b − 1)²/(6b) + bε) log|t|⁻¹ (Theorem 5.4).

Hypotheses and conventions: Archimedean place; s, t near the same cusp 0.

Proof outline: For b ≤ B this is DY.6/archimedean-energy-same-cusp-bounded-ratio (multiply by log|t|⁻¹ = log|s|⁻¹/b). For b ≥ B, s is much closer to the cusp than t: compare with DY.6/archimedean-energy-one-escaping-parameter applied with t in a compact annulus after rescaling, and bound the cross terms with DY.6/legendre-measure-on-annuli-near-cusp; the two theorems are proved together (their proofs share this case analysis).

Inputs: `ArithmeticDynamics:DY.6/archimedean-energy-same-cusp-bounded-ratio`, `ArithmeticDynamics:DY.6/archimedean-energy-one-escaping-parameter`, `ArithmeticDynamics:DY.6/legendre-measure-on-annuli-near-cusp`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Archimedean energy with parameters at the cusps 0 and ∞ (DeMarco–Krieger–Ye Theorem 5.5)** (`DY.6/archimedean-energy-opposite-cusps`, theorem).

For every ε > 0 there is δ > 0 such that ((1/6)(1 + 1/b) − ε) log|s|⁻¹ ≤ E_∞(s, t) ≤ ((1/6)(1 + 1/b) + ε) log|s|⁻¹ for all |t| > 1/δ and 0 < |s| ≤ 1/|t|, where b = −log|s|/log|t|.

Hypotheses and conventions: Archimedean place.

Proof outline: Pass to u = 1/t near 0 with DY.6/legendre-local-energy-symmetries, and argue as in DY.6/archimedean-energy-same-cusp with the nonarchimedean energy E(μ̂_∞, μ̂_b) = (b + 1)/6 from DY.6/nonarchimedean-legendre-energy-lower-bound.

Inputs: `ArithmeticDynamics:DY.6/archimedean-energy-same-cusp`, `ArithmeticDynamics:DY.6/legendre-local-energy-symmetries`, `ArithmeticDynamics:DY.6/nonarchimedean-legendre-energy-lower-bound`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Energy at archimedean good places (DeMarco–Krieger–Ye Lemma 6.1)** (`DY.6/archimedean-good-places-energy-bound`, lemma).

Fix 0 < r ≤ 1/16 and, for t₁ ≠ t₂ in ℚ̄ ∖ {0, 1} and a number field K containing them, call v ∈ M_K good if |log|t₂/t₁|_v| ≥ r · max{|log|t₁|_v|, |log|t₂|_v|}. There is C₀ > 0 (depending on r) such that 6E_v(t₁, t₂) ≥ (3r/4)|log|t₁/t₂|_v| − C₀ at every archimedean good place v.

Hypotheses and conventions: r ∈ (0, 1/16]; v archimedean and good.

Proof outline: Take ε = r²/24, δ₁ the minimum of the δ of DY.6/archimedean-energy-same-cusp and DY.6/archimedean-energy-opposite-cusps, δ₂ that of DY.6/archimedean-energy-one-escaping-parameter for the compact set {δ₁ ≤ |t| ≤ 1/δ₁, |t − 1| ≥ δ₁}, and C₀ > log(1/min{δ₁, δ₂}). Case analysis on the positions of t₁, t₂ relative to the cusps, using DY.6/legendre-local-energy-symmetries to move both near 0 or to 0 and ∞; in each case the energy estimate and the goodness inequality give the bound.

Inputs: `ArithmeticDynamics:DY.6/archimedean-energy-same-cusp`, `ArithmeticDynamics:DY.6/archimedean-energy-opposite-cusps`, `ArithmeticDynamics:DY.6/archimedean-energy-one-escaping-parameter`, `ArithmeticDynamics:DY.6/legendre-local-energy-symmetries`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Sum of energies over good places (DeMarco–Krieger–Ye Lemma 6.2)** (`DY.6/good-places-energy-sum-bound`, lemma).

With r and the good places as in DY.6/archimedean-good-places-energy-bound, there is C > 0 such that Σ_{v good} 3 r_v E_v(t₁, t₂) ≥ (3r/4) h(t₂/t₁) − (3r²/2) h(t₁, t₂) − C for all t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}, where r_v = [K_v : ℚ_v]/[K : ℚ], h is the absolute Weil height and h(t₁, t₂) the naive height on 𝔸²(ℚ̄).

Hypotheses and conventions: r ∈ (0, 1/16].

Proof outline: Nonarchimedean good places: DY.6/nonarchimedean-legendre-energy-lower-bound gives 6E_v ≥ r |log|t₂/t₁|_v| − 8 log⁺|1/2|_v. Archimedean good places: DY.6/archimedean-good-places-energy-bound. Summing with weights r_v: Σ_v r_v |log|x|_v| = 2h(x) (product formula), and the bad places contribute at most r · max{|log|t₁|_v|, |log|t₂|_v|} each, bounded in total by 2r h(t₁, t₂)-type terms; Σ_{v|2} r_v log 2 and Σ_{v|∞} r_v C₀ are bounded.

Inputs: `ArithmeticDynamics:DY.6/nonarchimedean-legendre-energy-lower-bound`, `ArithmeticDynamics:DY.6/archimedean-good-places-energy-bound`, `mathlib:NumberField.absLogHeight₁`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**A birational height comparison (DeMarco–Krieger–Ye Lemma 6.3)** (`DY.6/birational-height-comparison`, lemma).

There is C > 0 such that h(t₂/t₁, (1 − t₂)/(1 − t₁)) ≥ ½ h(t₁, t₂) − C for all t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}, where h is the naive (affine) height on 𝔸²(ℚ̄).

Hypotheses and conventions: t₁ ≠ t₂, both ≠ 0, 1.

Proof outline: g(x₁, x₂) = (x₂/x₁, (1 − x₂)/(1 − x₁)) is birational on ℙ² with inverse g⁻¹(y₁, y₂) = ((1 − y₂)/(y₁ − y₂), y₁(1 − y₂)/(y₁ − y₂)), a degree-2 map with indeterminacy {(0 : 1 : 0), (1 : 0 : 0), (1 : 1 : 1)}. Heights under rational maps: off the indeterminacy locus, h(g⁻¹(P)) ≤ 2h(P) + C (Mathlib Height.logHeight_eval_le for the three quadratic forms of g⁻¹, in the absolute normalisation of DY.6/absolute-height-bounds-for-forms (a)); the points (t₂/t₁, (1 − t₂)/(1 − t₁)) avoid the indeterminacy for t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}. Apply with P = g(t₁, t₂), so g⁻¹(P) = (t₁, t₂).

Inputs: `ArithmeticDynamics:DY.6/absolute-height-bounds-for-forms`, `mathlib:Height.logHeight_eval_le`.

**The Arakelov–Zhang pairing of Legendre heights grows with the parameter height (DeMarco–Krieger–Ye Theorem 1.6; published Theorem 1.7)** (`DY.6/legendre-pairing-height-lower-bound`, theorem).

There are α, β > 0 such that ĥ_{t₁} · ĥ_{t₂} ≥ α h(t₁, t₂) − β for all t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}, where ĥ_{t₁} · ĥ_{t₂} is the Arakelov–Zhang pairing (DY.4/arakelov-zhang-pairing) of the Legendre canonical heights (DY.6/legendre-lattes-map) and h(t₁, t₂) the naive height on 𝔸²(ℚ̄); one may take α = 1/512.

Hypotheses and conventions: t₁ ≠ t₂ algebraic, ≠ 0, 1.

Proof outline: ĥ_{t₁} · ĥ_{t₂} = Σ_v r_v E_v(t₁, t₂) with every E_v ≥ 0 (DY.4/arakelov-zhang-pairing), so the sum over good places is a lower bound. Apply DY.6/good-places-energy-sum-bound to (t₁, t₂) and to (1 − t₁, 1 − t₂) (the energies agree by DY.6/legendre-local-energy-symmetries) and add: ≥ (r/4)(h(t₂/t₁) + h((1 − t₂)/(1 − t₁))) − r² h(t₁, t₂) − 2C/3 after normalising. h(x) + h(y) ≥ h(x, y) and DY.6/birational-height-comparison give h(t₂/t₁) + h((1 − t₂)/(1 − t₁)) ≥ ½ h(t₁, t₂) − C; the coefficient is α = r/16 − r²/2 > 0 for 0 < r ≤ 1/16, maximal 1/512 at r = 1/16.

Inputs: `ArithmeticDynamics:DY.6/good-places-energy-sum-bound`, `ArithmeticDynamics:DY.6/legendre-local-energy-symmetries`, `ArithmeticDynamics:DY.6/birational-height-comparison`, `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Uniform positivity of the Arakelov–Zhang pairing (DeMarco–Krieger–Ye Theorem 1.5; published Theorem 1.6)** (`DY.6/legendre-pairing-uniform-positivity`, theorem).

There is δ > 0 such that ĥ_{t₁} · ĥ_{t₂} ≥ δ for all t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}.

Hypotheses and conventions: t₁ ≠ t₂ algebraic, ≠ 0, 1.

Proof outline: Suppose (s_n, t_n) with ĥ_{s_n} · ĥ_{t_n} → 0. Each E_v ≥ 0, so the archimedean energies are small on places of total weight ≥ ½ (DY.4/arakelov-zhang-pairing). At an archimedean place E_v(s, t) is continuous in (s, t) and vanishes only for s = t (nondegeneracy of the mutual energy, DY.4/arakelov-zhang-pairing); with DY.6/archimedean-energy-one-escaping-parameter, DY.6/archimedean-energy-same-cusp and DY.6/archimedean-energy-opposite-cusps, small energy forces the parameters to the diagonal or to the cusps at places of weight ≥ 1/8. The product formula then gives max{h(s_n − t_n), h(s_n, t_n), h(s_n − 1, t_n − 1)} ≥ (1/16) log(1/δ_n) → ∞ (corrected constant: the printed 1/8 is ArithmeticDynamics/E703), so h(s_n, t_n) → ∞, contradicting DY.6/legendre-pairing-height-lower-bound.

Inputs: `ArithmeticDynamics:DY.6/legendre-pairing-height-lower-bound`, `ArithmeticDynamics:DY.6/archimedean-energy-one-escaping-parameter`, `ArithmeticDynamics:DY.6/archimedean-energy-same-cusp`, `ArithmeticDynamics:DY.6/archimedean-energy-opposite-cusps`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`.

**Finiteness of joint small points (DeMarco–Krieger–Ye Proposition 1.8; published Proposition 1.9)** (`DY.6/legendre-joint-small-points-finite`, theorem).

Let δ be as in DY.6/legendre-pairing-uniform-positivity and 0 < b < δ/2. For every t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}, the set S(b, t₁, t₂) = {x ∈ ℙ¹(ℚ̄) : ĥ_{t₁}(x) + ĥ_{t₂}(x) ≤ b} is finite.

Hypotheses and conventions: 0 < b < δ/2.

Proof outline: The adelic metric (‖·‖_{t₁}‖·‖_{t₂})^{1/2} on O(1) is continuous and semipositive with height h_L = ½(ĥ_{t₁} + ĥ_{t₂}) and self-pairing h_L · h_L = ¼ĥ_{t₁}·ĥ_{t₁} + ½ĥ_{t₁}·ĥ_{t₂} + ¼ĥ_{t₂}·ĥ_{t₂} = ½ ĥ_{t₁} · ĥ_{t₂} (bilinearity, ĥ_t · ĥ_t = 0: DY.4/arakelov-zhang-pairing). Zhang's essential-minimum inequality (liminf h_L(x_n) ≥ h_L · h_L/(2 deg L) for distinct x_n; ArithmeticDynamics:DY.4, PAPER-DEMARCO-KRIEGER-YE-20/23) gives liminf (ĥ_{t₁} + ĥ_{t₂})(x_n) ≥ ½ ĥ_{t₁}·ĥ_{t₂} ≥ δ/2 > b along any sequence of distinct points. Hence only finitely many points satisfy ĥ_{t₁} + ĥ_{t₂} ≤ b.

Inputs: `ArithmeticDynamics:DY.6/legendre-pairing-uniform-positivity`, `ArithmeticDynamics:DY.4/adelic-metrized-line-bundle-on-p1`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`, `ArithmeticDynamics:DY.4`.

**Upper bound for the pairing against a regularised finite set (DeMarco–Krieger–Ye Proposition 7.3)** (`DY.6/legendre-pairing-upper-bound-regularized`, lemma).

Let t ∈ K ∖ {0, 1} for a number field K, F ⊂ K̄ a finite Gal(K̄/K)-invariant set and η = (η_v) positive reals with η_v = 1 for almost all v. With h_{F,η} the height of the adelic measure m_{F,η} (the uniform measures on circles of radius η_v about F at archimedean v and on the points ζ_{x,η_v} at finite v; normalised by h_{F,η} · h_{F,η} = 0, a DY.4 construction), ĥ_t · h_{F,η} ≤ ĥ_t(F) + Σ_v r_v (−(μ_{t,v}, m_{F,η,v})_v + (μ_{t,v}, [F]_v)_v + (−log η_v)/(2|F|)), where ĥ_t(F) is the average of ĥ_t over F.

Hypotheses and conventions: F Galois-stable; η adelic.

Proof outline: ĥ_t · h_{F,η} = ½ Σ_v r_v ((μ_{t,v}, μ_{t,v}) − 2(m_{F,η,v}, μ_{t,v}) + (m_{F,η,v}, m_{F,η,v})) by bilinearity (DY.4/arakelov-zhang-pairing). ĥ_t(F) = ĥ_t(∞) − Σ_v r_v (μ_{t,v}, [F]_v)_v + … by the local decomposition of ĥ_t and the product formula for the energy of F (Σ_v r_v ([F]_v, [F]_v)_v = 0, ArithmeticDynamics:DY.4). (m_{F,η,v}, m_{F,η,v})_v ≤ ([F]_v, [F]_v)_v + (−log η_v)/|F| (Favre–Rivera-Letelier Lemma 4.11, Fili Lemma 12; ArithmeticDynamics:DY.4); combine.

Inputs: `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`, `ArithmeticDynamics:DY.4/adelic-metrized-line-bundle-on-p1`, `ArithmeticDynamics:DY.4`.

**The pairing is small when there are many common small points (DeMarco–Krieger–Ye Theorem 7.1 and Theorem 1.7; published Theorem 7.1 and Theorem 1.8)** (`DY.6/legendre-pairing-upper-bound-small-points`, theorem).

Let δ be as in DY.6/legendre-pairing-uniform-positivity and 0 ≤ b < δ/2. For every ε > 0 there is C(ε) such that ĥ_{t₁} · ĥ_{t₂} ≤ 4b + (ε + C(ε)/|S(b, t₁, t₂)|)(h(t₁, t₂) + 1) for all t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}. For b = 0, S(0, t₁, t₂) = π(E_{t₁}^tors) ∩ π(E_{t₂}^tors) and this is Theorem 1.7: ĥ_{t₁} · ĥ_{t₂} ≤ (ε + C(ε)/N(t₁, t₂))(h(t₁, t₂) + 1) with N(t₁, t₂) = |π(E_{t₁}^tors) ∩ π(E_{t₂}^tors)|.

Hypotheses and conventions: 0 ≤ b < δ/2; t₁ ≠ t₂ algebraic, ≠ 0, 1. The proof uses the repaired radii η_v at places above 2 (ArithmeticDynamics/E705) and the corrected estimates (7.5), (7.6) (ArithmeticDynamics/E704, E706); the statement is unchanged.

Proof outline: Fili's triangle inequality (ĥ_{t₁}·ĥ_{t₂})^{1/2} ≤ (ĥ_{t₁}·h_{F,η})^{1/2} + (ĥ_{t₂}·h_{F,η})^{1/2} (ArithmeticDynamics:DY.4, PAPER-DEMARCO-KRIEGER-YE-20/21) with F = S(b, t₁, t₂) ∖ {∞}. Bound each ĥ_{t_i}·h_{F,η} by DY.6/legendre-pairing-upper-bound-regularized: ĥ_{t_i}(F) ≤ b; at archimedean places DY.6/legendre-regularization-estimate with η_v = c(ε′) min{|t_i|², |t_i − 1|², |t_i|⁻²}; at finite places take η_v = min{1, |t₁(t₁ − 1)|_v, |t₂(t₂ − 1)|_v}, reduced by the factor |2|_v at v | 2 so that the potentials of μ_{t_i,v} are constant on η_v-discs (DY.6/legendre-canonical-measure-away-from-two, DY.6/legendre-canonical-measure-above-two). Σ_v −r_v log η_v ≤ 4(h(t₁) + h(1 − t₁) + h(t₂) + h(1 − t₂)) − log c(ε′) + log 2 (corrected (7.5)); divide by 2|F| and choose ε′ < ε/16.

Inputs: `ArithmeticDynamics:DY.6/legendre-pairing-upper-bound-regularized`, `ArithmeticDynamics:DY.6/legendre-regularization-estimate`, `ArithmeticDynamics:DY.6/legendre-canonical-measure-away-from-two`, `ArithmeticDynamics:DY.6/legendre-canonical-measure-above-two`, `ArithmeticDynamics:DY.6/legendre-joint-small-points-finite`, `ArithmeticDynamics:DY.4/arakelov-zhang-pairing`, `ArithmeticDynamics:DY.4`.

**Uniform bound on joint small points over ℚ̄ (DeMarco–Krieger–Ye Theorem 8.1)** (`DY.6/legendre-uniform-joint-small-points`, theorem).

There are B and b > 0 such that |{x ∈ ℙ¹(ℚ̄) : ĥ_{t₁}(x) + ĥ_{t₂}(x) ≤ b}| ≤ B for all t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}. In particular |π(E_{t₁}^tors) ∩ π(E_{t₂}^tors)| ≤ B for all t₁ ≠ t₂ in ℚ̄ ∖ {0, 1}.

Hypotheses and conventions: t₁ ≠ t₂ algebraic, ≠ 0, 1.

Proof outline: Fix 0 < b < δ/8 (δ of DY.6/legendre-pairing-uniform-positivity) and H > 2β/α with (H − 8b/α)/(H + 1) > 3/4 (α, β of DY.6/legendre-pairing-height-lower-bound). If h(t₁, t₂) ≥ H: DY.6/legendre-pairing-upper-bound-small-points with ε = α/4 and the lower bound (α/2) h(t₁, t₂) ≤ ĥ_{t₁}·ĥ_{t₂} give |S(b, t₁, t₂)| ≤ 8C/α. If h(t₁, t₂) < H: DY.6/legendre-pairing-upper-bound-small-points with ε′ = δ/(4(H + 1)) and ĥ_{t₁}·ĥ_{t₂} ≥ δ give |S(b, t₁, t₂)| ≤ 4(H + 1)C′/δ. The torsion images are the common zeros of ĥ_{t₁}, ĥ_{t₂} (DY.6/lattes-map-preperiodic-iff-torsion with DY.1/zero-canonical-height-iff-preperiodic), which lie in S(b, t₁, t₂).

Inputs: `ArithmeticDynamics:DY.6/legendre-pairing-uniform-positivity`, `ArithmeticDynamics:DY.6/legendre-pairing-height-lower-bound`, `ArithmeticDynamics:DY.6/legendre-pairing-upper-bound-small-points`, `ArithmeticDynamics:DY.6/lattes-map-preperiodic-iff-torsion`, `ArithmeticDynamics:DY.1/zero-canonical-height-iff-preperiodic`.

**The only torsion images common to all Legendre curves are 0, 1, ∞ (DeMarco–Wang–Ye Proposition 1.4)** (`DY.6/torsion-images-common-to-all-legendre-curves`, theorem).

If x ∈ ℙ¹(ℂ) lies in π(E_t^tors) for every t ∈ ℂ ∖ {0, 1}, then x ∈ {0, 1, ∞}.

Hypotheses and conventions: π(x, y) = x on the Legendre curve E_t.

Proof outline: DeMarco–Wang–Ye (Amer. J. Math. 138 (2016)), Proposition 1.4, cited by DeMarco–Krieger–Ye §8.2; not decomposed in DY.6 (gap). For x ∈ ℚ̄ ∖ {0, 1}, the point P_t = (x, √(x(x − 1)(x − t))) over ℚ̄(t) is not torsion; with DY.6/lattes-map-preperiodic-iff-torsion this says x is not preperiodic for the family f_t over ℚ̄(t).

Inputs: `ArithmeticDynamics:DY.6/legendre-lattes-map`, `ArithmeticDynamics:DY.6/lattes-map-preperiodic-iff-torsion`.

**Specialising a finitely generated domain to ℚ̄ while keeping finitely many elements nonzero** (`DY.6/algebraic-specialization-of-finitely-generated-algebras`, lemma).

Let R be a finitely generated ℚ-algebra that is an integral domain and s ∈ R, s ≠ 0. Then there is a ring homomorphism φ : R → ℚ̄ with φ(s) ≠ 0.

Hypotheses and conventions: R finitely generated over ℚ and a domain; s ≠ 0 (a product of finitely many elements to be kept nonzero, e.g. pairwise differences).

Proof outline: R[1/s] is a nonzero finitely generated ℚ-algebra (Localization.Away), so it has a maximal ideal m (Ideal.exists_maximal). R[1/s]/m is a field finitely generated as a ℚ-algebra, hence finite over ℚ (Zariski's lemma: finite_of_finite_type_of_isJacobsonRing, ℚ being a Jacobson ring). Embed it into ℚ̄ (IsAlgClosed.lift) and compose with R → R[1/s] → R[1/s]/m; s maps to a unit, hence to a nonzero element.

Inputs: `mathlib:Localization.Away`, `mathlib:Ideal.exists_maximal`, `mathlib:finite_of_finite_type_of_isJacobsonRing`, `mathlib:IsAlgClosed.lift`, `mathlib:Algebra.FiniteType`.

**Uniform common torsion images for pairs of Legendre curves (DeMarco–Krieger–Ye Theorem 1.4; published Theorem 1.5)** (`DY.6/legendre-uniform-common-torsion-images`, theorem, planet: Uniform common torsion images for Legendre pairs).

There is a uniform constant B such that |π(E_{t₁}^tors) ∩ π(E_{t₂}^tors)| ≤ B for all t₁ ≠ t₂ in ℂ ∖ {0, 1}, where E_t : y² = x(x − 1)(x − t) and π(x, y) = x (with π(O) = ∞).

Hypotheses and conventions: t₁ ≠ t₂ complex, ≠ 0, 1.

Proof outline: Over ℚ̄ this is DY.6/legendre-uniform-joint-small-points. Suppose t₁ ≠ t₂ ∈ ℂ with N > B common torsion images x₁, …, x_N. The torsion images of E_t are roots of division polynomials with coefficients in ℚ[t] (Mathlib WeierstrassCurve.ψ, ΨSq over ℚ[t]); an algebraic common image lies in π(E_t^tors) for every t, so it is 0, 1 or ∞ (DY.6/torsion-images-common-to-all-legendre-curves). Since N > B ≥ 3, some x_i is transcendental, and so is t₁ or t₂. The ring generated over ℚ by t₁, t₂, x₁, …, x_N, 1/(t_i(t_i − 1)), 1/(t₁ − t₂), 1/(x_i − x_j) is a finitely generated domain; the relations ΨSq_{n_i}(x_i; t_k) = 0 (or x_i = ∞) are polynomial. Specialise to ℚ̄ by DY.6/algebraic-specialization-of-finitely-generated-algebras keeping all these elements nonzero: the images give t₁′ ≠ t₂′ in ℚ̄ ∖ {0, 1} with N distinct common torsion images, contradicting the bound over ℚ̄.

Inputs: `ArithmeticDynamics:DY.6/legendre-uniform-joint-small-points`, `ArithmeticDynamics:DY.6/torsion-images-common-to-all-legendre-curves`, `ArithmeticDynamics:DY.6/algebraic-specialization-of-finitely-generated-algebras`, `ArithmeticDynamics:DY.6/legendre-lattes-map`, `mathlib:WeierstrassCurve.ψ`, `mathlib:WeierstrassCurve.ΨSq`.

**The Bogomolov–Fu–Tschinkel bound with three common branch values (DeMarco–Krieger–Ye Corollary 8.2)** (`DY.6/common-torsion-images-three-common-branch-values`, theorem).

There is a uniform B such that |π₁(E₁^tors) ∩ π₂(E₂^tors)| ≤ B for all elliptic curves E₁, E₂ over ℂ and standard projections π₁, π₂ (DY.6/standard-projection) with |π₁(E₁[2]) ∩ π₂(E₂[2])| = 3.

Hypotheses and conventions: E_i elliptic over ℂ; exactly three common branch values.

Proof outline: Apply a Möbius map to send the three common branch values to {0, 1, ∞} (standardProjection_normalize). Replace π_i by π_i^{e_i} for suitable e_i ∈ E_i[2] so that π_i(O_i) = ∞; the torsion images are unchanged (DY.6/standard-projection). Then each π_i is the x-coordinate of a Legendre model E_{t_i} with t₁ ≠ t₂ (the fourth branch values differ), and DY.6/legendre-uniform-common-torsion-images applies.

Inputs: `ArithmeticDynamics:DY.6/legendre-uniform-common-torsion-images`, `ArithmeticDynamics:DY.6/standard-projection`.

**No uniform bound on the order of common torsion images (DeMarco–Krieger–Ye Proposition 8.3, published version)** (`DY.6/common-torsion-image-orders-unbounded`, theorem).

For every N > 0 and every x₀ ∈ ℚ̄ ∖ {0, 1} there are t₁ ≠ t₂ in ℚ̄ ∖ {0, 1} such that the points P_i = (x₀, ±√(x₀(x₀ − 1)(x₀ − t_i))) are torsion points of order ≥ N on E_{t_i}, i = 1, 2.

Hypotheses and conventions: x₀ algebraic, ≠ 0, 1.

Proof outline: Tor(x₀) := {t ∈ ℚ̄ ∖ {0, 1} : P_t torsion on E_t} is infinite (DeMarco–Wang–Ye 2016, Theorem 1.2, by equidistribution; gap) and is a proper subset (DY.6/torsion-images-common-to-all-legendre-curves), hence a set of bounded height (the canonical height of x₀ on the family grows with h(t): DY.6/specialization-of-canonical-heights with DY.6/lattes-map-canonical-height). For each n there are finitely many t with P_t of order ≤ n (roots of the finitely many division-polynomial relations ΨSq_m(x₀; t) = 0, m ≤ n, nonzero polynomials in t by DY.6/torsion-images-common-to-all-legendre-curves); an infinite Tor(x₀) therefore contains t₁ ≠ t₂ with orders ≥ N.

Inputs: `ArithmeticDynamics:DY.6/torsion-images-common-to-all-legendre-curves`, `ArithmeticDynamics:DY.6/specialization-of-canonical-heights`, `ArithmeticDynamics:DY.6/lattes-map-canonical-height`, `ArithmeticDynamics:DY.6/legendre-lattes-map`, `mathlib:WeierstrassCurve.ΨSq`.

### 6G. Dynamical Mordell–Lang: proven cases

Return sets are compared with finite unions of arithmetic progressions. The étale case is proved by p-adic interpolation of orbits and Strassmann's theorem; lines under split polynomial maps by the Ghioca–Tucker–Zieve argument (Bilu–Tichy and Ritt over number fields, specialisation of canonical heights in general); the statement fails in positive characteristic.

**Finite unions of arithmetic progressions in ℕ** (`DY.6/finite-union-of-arithmetic-progressions`, definition).

A set S ⊆ ℕ is a finite union of arithmetic progressions if there are finitely many pairs (a_i, b_i) ∈ ℕ² with S = ⋃_i {a_i k + b_i : k ∈ ℕ}; the case a_i = 0 contributes the singleton {b_i}, so finite sets qualify. Equivalently, S is eventually periodic: there are N ∈ ℕ and p ≥ 1 with n ∈ S ↔ n + p ∈ S for all n ≥ N.

Hypotheses and conventions: Arithmetic progressions are one-sided (k ≥ 0) and may have difference 0.

API:

- `IsFiniteUnionAP` (data): The predicate on sets S ⊆ ℕ.
- `isFiniteUnionAP_iff_eventually_periodic` (characterisation): Equivalence with eventual periodicity.
- `IsFiniteUnionAP.union` (structure): Closed under binary union.
- `IsFiniteUnionAP.inter` (structure): Closed under binary intersection.
- `IsFiniteUnionAP.compl` (structure): Closed under complement.
- `Set.Finite.isFiniteUnionAP` (constructor): Finite sets are finite unions of arithmetic progressions.
- `IsFiniteUnionAP.exists_infinite_ap` (other): An infinite finite union of arithmetic progressions contains {ak + b : k ∈ ℕ} with a ≥ 1.
- `isFiniteUnionAP_preimage_affine` (functoriality): If S is one then so is {k : ak + b ∈ S} for a ≥ 1; and S is one iff each {k : Nk + j ∈ S}, 0 ≤ j < N, is one.

Unit tests:

- `isFiniteUnionAP_evens_union` (computation): The set {1} ∪ {2k : k ∈ ℕ} is a finite union of arithmetic progressions (pairs (0, 1) and (2, 0)).
- `isFiniteUnionAP_empty_univ` (degenerate): The empty set, every finite set and ℕ are finite unions of arithmetic progressions.
- `isFiniteUnionAP_iff_eventuallyPeriodic` (compatibility): S is a finite union of arithmetic progressions iff ∃ N, ∃ p ≥ 1, ∀ n ≥ N, (n ∈ S ↔ n + p ∈ S).
- `not_isFiniteUnionAP_powers` (non-example): For p ≥ 2, {p^k : k ∈ ℕ} is not a finite union of arithmetic progressions (it is infinite and its gaps are unbounded).

Proof outline: Equivalence: a union of progressions {a_i k + b_i} is periodic with period lcm of the nonzero a_i beyond N = max b_i; conversely an eventually periodic S is the union of the finite set S ∩ [0, N) and the progressions {pk + b} for b ∈ S ∩ [N, N + p). The class is closed under finite unions, intersections and complements (eventually periodic sets form a Boolean algebra).

Inputs: `mathlib:Set.Finite`, `mathlib:Set.Infinite`.

**Strassmann's theorem: a nonzero p-adic power series convergent on ℤ_p has finitely many zeros there** (`DY.6/strassmann-theorem`, theorem).

Let p be a prime and g(z) = Σ_{i ≥ 0} c_i z^i with c_i ∈ ℚ_p and c_i → 0. If some c_i ≠ 0, let N be the largest index with |c_N|_p = max_i |c_i|_p. Then g has at most N zeros in ℤ_p. In particular a p-adic analytic function on ℤ_p with infinitely many zeros in ℤ_p is identically zero.

Hypotheses and conventions: Coefficients tend to 0 (convergence on the closed unit disc).

Proof outline: Induction on N. For N = 0: |c_0| > |c_i| for i ≥ 1, so |g(z)| = |c_0| ≠ 0 on ℤ_p by the ultrametric inequality. If g(a) = 0 with a ∈ ℤ_p, write g(z) = g(z) − g(a) = (z − a) h(z) with h(z) = Σ_j (Σ_{i > j} c_i a^{i−1−j}) z^j; the coefficients of h tend to 0, satisfy |h_j| ≤ max_{i > j} |c_i|, and the largest index attaining the maximum of |h_j| is N − 1. By induction h has at most N − 1 zeros, so g has at most N.

Inputs: `mathlib:PowerSeries`, `mathlib:PadicInt`, `mathlib:IsUltrametricDist`.

**Power-series coordinates on a residue disc (Bell–Ghioca–Tucker Propositions 2.1–2.2, Remark 2.3)** (`DY.6/p-adic-power-series-coordinates`, lemma).

Let 𝒳 be a quasi-projective ℤ_p-scheme with geometrically irreducible fibres, Φ : 𝒳 → 𝒳 an unramified ℤ_p-endomorphism, x an 𝔽_p-point in the smooth locus with Φ(x) = x, and suppose some α ∈ 𝒳(ℤ_p) reduces to x. Then (a) Ô_{𝒳,x} ≅ ℤ_p[[T₁, …, T_g]]; (b) the points β ∈ 𝒳(ℤ_p) reducing to x correspond bijectively to β⃗ ∈ ℤ_p^g via the primes (T₁ − pβ₁, …, T_g − pβ_g); and (c) there are power series F₁, …, F_g ∈ ℤ_p[[U₁, …, U_g]] converging on ℤ_p^g with ι(Φ(β)) = F(ι(β)), each F_i ≡ (affine linear) mod p, and the coefficient of U^k (|k| ≥ 2) in F_i lying in p^{|k|−1} ℤ_p.

Hypotheses and conventions: p a prime; x smooth; Φ fixes x.

Proof outline: (a) Ô_{𝒳,x} is a complete regular local ring, unramified (p ∉ m̂² because of the ℤ_p-point), with residue field 𝔽_p; by the Cohen structure theorem (Matsumura, Theorem 29.7; gap) it is a power series ring over ℤ_p. (b) Points reducing to x are the primes q of Ô with Ô/q ≅ ℤ_p, which are (T₁ − pz₁, …, T_g − pz_g). (c) Φ* T_i = H_i ∈ ℤ_p[[T]] with constant term in pℤ_p; set F_i(T) := p⁻¹ H_i(pT₁, …, pT_g).

Inputs: `mathlib:PowerSeries`, `mathlib:PadicInt`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.FormallyUnramified`.

**An unramified map returns to the residue class to first order (Bell–Ghioca–Tucker Propositions 2.4 and 2.6)** (`DY.6/p-adic-residue-class-returns`, lemma).

In the setting of DY.6/p-adic-power-series-coordinates, write F(β⃗) = C⃗ + L β⃗ + (higher order terms). If Φ is unramified at x, then L is invertible modulo p, and there is n ≥ 1 with Fⁿ(β⃗) ≡ β⃗ (mod p) for all β⃗ ∈ ℤ_p^g.

Hypotheses and conventions: Φ unramified at the fixed point x.

Proof outline: Unramified: Φ* maps m onto m in O_{X,x} of the special fibre, so it induces an isomorphism on m/m²; this map is the reduction of Lᵀ, hence L mod p is invertible. β⃗ ↦ C⃗ + Lβ⃗ mod p is then a bijection of the finite set 𝔽_p^g, so some power is the identity; the higher order terms vanish mod p (DY.6/p-adic-power-series-coordinates (c)).

Inputs: `ArithmeticDynamics:DY.6/p-adic-power-series-coordinates`, `mathlib:AlgebraicGeometry.FormallyUnramified`.

**p-adic analytic interpolation of orbits (Bell–Ghioca–Tucker Theorem 3.3)** (`DY.6/p-adic-analytic-interpolation-of-orbits`, theorem).

Let p > 3 be prime, n ≥ 1, and ϕ₁, …, ϕ_n ∈ ℤ_p[[x₁, …, x_n]] convergent on ℤ_pⁿ such that (a) ϕ_i ≡ x_i (mod p) and (b) the coefficient of x₁^{k₁}⋯x_n^{k_n} in ϕ_i lies in p^{k₁+⋯+k_n−1} ℤ_p whenever k₁ + ⋯ + k_n ≥ 2. For every ω⃗ ∈ ℤ_pⁿ there are p-adic analytic f₁, …, f_n ∈ ℚ_p[[z]], convergent with |f_i(z)|_p ≤ 1 on |z|_p ≤ 1, with f_i(0) = ω_i and f_i(z + 1) = ϕ_i(f₁(z), …, f_n(z)). In particular (ϕ^k(ω⃗))_i = f_i(k) for k ∈ ℕ.

Hypotheses and conventions: p > 3; hypotheses (a), (b).

Proof outline: Work in the ring C of Mahler series Σ c_i binom(z, i) with c_i → 0 (the continuous functions ℤ_p → ℤ_p, Mahler) and its subring B of Mahler polynomials. Construct h_{i,j} ∈ B inductively with h_{i,0} = ω_i, h_{i,j}(0) = 0 and deg h_{i,j} ≤ 2j − 1 for j ≥ 1, such that g_{i,j} = Σ_{k ≤ j} p^k h_{i,k} satisfies g_{i,j}(z + 1) ≡ ϕ_i(g_{·,j}(z)) mod p^{j+1}C (BGT Lemma 3.2 controls the products of the correction terms). The limits f_i = lim_j g_{i,j} converge and satisfy the functional equation; the degree bound 2j − 1 against p^j and p > 3 give analyticity on |z|_p ≤ 1.

Inputs: `mathlib:PowerSeries`, `mathlib:PadicInt`, `mathlib:Polynomial`.

**Embedding a finitely generated field into ℚ_p with prescribed integral elements (Lech; Bell Lemma 3.1)** (`DY.6/lech-embedding-lemma`, lemma).

Let L be a finitely generated field extension of ℚ and u₁, …, u_e ∈ L. There are infinitely many primes p (in particular one with p ≥ 5) and field embeddings L ↪ ℚ_p sending every u_i into ℤ_p.

Hypotheses and conventions: L finitely generated over ℚ.

Proof outline: This is Lech's embedding theorem in the form of Bell, J. London Math. Soc. 73 (2006), Lemma 3.1 (see also Cassels, "An embedding theorem for fields"); it is cited by Bell–Ghioca–Tucker and not decomposed in DY.6 (gap).

Inputs: `mathlib:PadicInt`, `mathlib:Algebra.FiniteType`.

**Spreading out an unramified endomorphism (Bell–Ghioca–Tucker Proposition 4.3)** (`DY.6/etale-model-over-finitely-generated-ring`, lemma).

Let X be an irreducible smooth quasi-projective variety over ℂ, Φ an unramified endomorphism, α ∈ X(ℂ), and R ⊂ ℂ a finitely generated ℤ-algebra containing the coefficients of equations for X, Φ, V and α. There is a dense open U ⊆ Spec R and a smooth quasi-projective U-scheme X_U with generic fibre X, geometrically irreducible fibres, an unramified extension Φ_U of Φ, and a section U → X_U extending α.

Hypotheses and conventions: X smooth irreducible quasi-projective over ℂ; Φ unramified.

Proof outline: The locus where the equations of Φ fail to define a morphism, and where α meets the removed closed set, lie over proper closed subsets of Spec R; remove them. Smoothness of the projection and unramifiedness of Φ hold on open sets containing the generic fibre (Altman–Kleiman VII.1.2, VI.4.6), and geometric irreducibility of fibres holds over a dense open (van den Dries–Schmidt, a first-order property); intersect. These spreading-out statements belong to SchemeAndStackFoundations:SF.0 (requested).

Inputs: `SchemeAndStackFoundations:SF.0`, `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.FormallyUnramified`, `mathlib:Algebra.FiniteType`.

**A p-adic model of an unramified endomorphism (Bell–Ghioca–Tucker Proposition 4.4)** (`DY.6/p-adic-model-of-unramified-endomorphism`, lemma).

In the setting of DY.6/etale-model-over-finitely-generated-ring there are a prime p ≥ 5, an embedding R ↪ ℤ_p and a smooth quasi-projective ℤ_p-scheme 𝒳 with generic fibre X, geometrically irreducible generic and special fibres, an unramified extension of Φ to 𝒳, and a section Spec ℤ_p → 𝒳 extending α.

Hypotheses and conventions: As in DY.6/etale-model-over-finitely-generated-ring.

Proof outline: Choose f ∈ R vanishing on Spec R ∖ U, so Spec R[1/f] ⊆ U, and write R[1/f] = ℤ[u₁, …, u_e]. By DY.6/lech-embedding-lemma there is p ≥ 5 and Frac(R) ↪ ℚ_p with all u_i ∈ ℤ_p; this gives Spec ℤ_p → Spec R[1/f] → U. Base change X_U along it: smoothness, quasi-projectivity and unramifiedness are stable under base change; the special fibre is the fibre of X_U at the prime below (p), geometrically irreducible.

Inputs: `ArithmeticDynamics:DY.6/etale-model-over-finitely-generated-ring`, `ArithmeticDynamics:DY.6/lech-embedding-lemma`, `mathlib:PadicInt`, `mathlib:Localization.Away`.

**The dynamical Mordell–Lang theorem for étale maps (Bell–Ghioca–Tucker)** (`DY.6/etale-dynamical-mordell-lang`, theorem, planet: Étale dynamical Mordell–Lang).

Let X be a quasi-projective variety over ℂ, Φ : X → X an étale endomorphism (Mathlib AlgebraicGeometry.Etale), V ⊆ X a closed subvariety and α ∈ X(ℂ). Then V(ℂ) ∩ O_Φ(α) is a union of finitely many orbits O_{Φ^N}(Φ^ℓ(α)) (N, ℓ ∈ ℕ); equivalently {n ∈ ℕ : Φⁿ(α) ∈ V(ℂ)} is a finite union of arithmetic progressions. That is, DML(X, Φ) holds (DY.6/dynamical-mordell-lang-conjecture).

Hypotheses and conventions: Characteristic 0 (over ℂ); Φ étale (for smooth irreducible X, unramified suffices: Theorem 4.1).

Proof outline: Reduction to X irreducible: Φ permutes the irreducible components; pass to Φ^N on each component (a finite union of arithmetic progressions is stable under this decomposition, DY.6/finite-union-of-arithmetic-progressions). Induction on dimension: étale maps preserve the smooth locus; if the orbit lies in the singular locus use induction, otherwise the smooth case (Theorem 4.1). Smooth irreducible case: choose a finitely generated ℤ-algebra R carrying X, Φ, V, α; spread out to a smooth quasi-projective model with unramified Φ over a dense open of Spec R (DY.6/etale-model-over-finitely-generated-ring) and embed R into ℤ_p for a prime p ≥ 5 (DY.6/p-adic-model-of-unramified-endomorphism). Replace α by an iterate whose residue class is Φ-periodic of period N; on each residue disc, Φ^N is given by power series F_j (DY.6/p-adic-power-series-coordinates) and some F_j^{M_j} ≡ id mod p (DY.6/p-adic-residue-class-returns); by DY.6/p-adic-analytic-interpolation-of-orbits there are analytic U_{j,ℓ} : ℤ_p → ℤ_p^g with U_{j,ℓ}(k) = ι_j(Φ^{N(M_j k + ℓ) + j}(α)). For each polynomial h in the ideal of V, h ∘ ι_j⁻¹ ∘ U_{j,ℓ} is analytic on ℤ_p; by DY.6/strassmann-theorem it has finitely many zeros or vanishes identically. Hence each subprogression either meets V finitely often or lies in V.

Inputs: `ArithmeticDynamics:DY.6/finite-union-of-arithmetic-progressions`, `ArithmeticDynamics:DY.6/dynamical-mordell-lang-conjecture`, `ArithmeticDynamics:DY.6/etale-model-over-finitely-generated-ring`, `ArithmeticDynamics:DY.6/p-adic-model-of-unramified-endomorphism`, `ArithmeticDynamics:DY.6/p-adic-power-series-coordinates`, `ArithmeticDynamics:DY.6/p-adic-residue-class-returns`, `ArithmeticDynamics:DY.6/p-adic-analytic-interpolation-of-orbits`, `ArithmeticDynamics:DY.6/strassmann-theorem`, `mathlib:AlgebraicGeometry.Etale`, `SchemeAndStackFoundations:SF.0`.

**Orbits of polynomials of equal degree meeting a line (Ghioca–Tucker–Zieve Theorems 1.5 and 1.1)** (`DY.6/polynomial-orbits-on-lines-equal-degree`, theorem).

Let K be a field of characteristic 0, α, β, x₀, y₀ ∈ K with α ≠ 0, and f, g ∈ K[X] with deg f = deg g > 1. If infinitely many points of O_f(x₀) × O_g(y₀) lie on the line Y = αX + β, then g^k(αX + β) = α f^k(X) + β for some k ≥ 1. In particular (α = 1, β = 0, Theorem 1.1, K = ℂ): if O_f(x₀) ∩ O_g(y₀) is infinite then f and g have a common iterate.

Hypotheses and conventions: char K = 0; deg f = deg g ≥ 2.

Proof outline: Number fields (GTZ §3, Theorem 3.4): if fᵐ(X) = gᵐ(Y) has infinitely many S-integral solutions for every m, the Bilu–Tichy theorem (GTZ Theorem 2.1, from Siegel's theorem on integral points; gap) forces standard-pair decompositions of fᵐ and gᵐ, and GTZ's decomposition results (Proposition 3.3, Lemmas 4.1–4.2) combine them into a common iterate. Reduction from general K to number fields by induction on the transcendence degree (GTZ §6): a specialisation α : R → E′ must keep leading coefficients nonzero, keep f_α^k ≠ g_α^k for all k (Proposition 6.1, from Ritt's classification of polynomials with a common iterate, GTZ Proposition 6.3; gap) and keep x₀ wandering (Proposition 6.2: the case ĥ_f(x₀) > 0 is DY.6/specialization-of-non-preperiodic-points over a number-field base; the isotrivial case uses GTZ Lemma 6.8, and non-isotrivial f use Benedetto's theorem, GTZ Lemma 6.7; gap). The specialisation step of GTZ runs over a base curve C over a finitely generated field E of positive transcendence degree; DY.6/specialization-of-canonical-heights covers the base ℙ¹ over a number field, and the general base is a remaining item.

Inputs: `ArithmeticDynamics:DY.6/specialization-of-non-preperiodic-points`, `ArithmeticDynamics:DY.6/specialization-of-canonical-heights`, `ArithmeticDynamics:DY.1/canonical-height-over-a-global-height-field`.

**The dynamical Mordell–Lang theorem for lines under split polynomial maps (Ghioca–Tucker–Zieve Theorem 1.4)** (`DY.6/polynomial-lines-dynamical-mordell-lang`, theorem).

Let K be a field of characteristic 0, f, g ∈ K[X] and x₀, y₀ ∈ K. If {(fⁿ(x₀), gⁿ(y₀)) : n ∈ ℕ} meets a line L ⊂ 𝔸²_K in infinitely many points, then L is periodic under (f, g). Consequently {n : (fⁿ(x₀), gⁿ(y₀)) ∈ L} is a finite union of arithmetic progressions: DML(𝔸², (f, g)) holds for lines.

Hypotheses and conventions: char K = 0; f, g arbitrary polynomials (possibly of different degrees or linear).

Proof outline: GTZ §5: reduce to L the diagonal (Lemma 5.1) and to deg f ≥ 2; if f and g are linear the result is Siegel's theorem on integral points in the form u αⁿ + v βⁿ = w (Proposition 5.3; gap). Comparing heights of fⁿ(x₀) and gⁿ(y₀) (canonical heights, DY.1/canonical-height-on-the-projective-line) forces deg f = deg g when there are infinitely many common points (Lemma 5.7). Equal degrees: DY.6/polynomial-orbits-on-lines-equal-degree gives f^k = g^k, so the diagonal is (f, g)^k-invariant, i.e. periodic. Periodic L of period k: the return set is a union of the progressions {kj + ℓ} through the first return points, plus finitely many points (DY.6/finite-union-of-arithmetic-progressions).

Inputs: `ArithmeticDynamics:DY.6/polynomial-orbits-on-lines-equal-degree`, `ArithmeticDynamics:DY.6/finite-union-of-arithmetic-progressions`, `ArithmeticDynamics:DY.6/dynamical-mordell-lang-conjecture`, `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`.

**The dynamical Mordell–Lang statement fails in positive characteristic (Ghioca Example 1.4)** (`DY.6/dml-fails-in-positive-characteristic`, lemma).

Let p be prime, K = 𝔽_p(t), V ⊂ 𝔾_m² the curve tx + (1 − t)y = 1, Φ(x, y) = (t^{p²−1}x, (1 − t)^{p²−1}y) and α = (1, 1). Then {n ∈ ℕ : Φⁿ(α) ∈ V} = {(p^{2j} − 1)/(p² − 1) : j ∈ ℕ}, which is infinite but not a finite union of arithmetic progressions.

Hypotheses and conventions: K = 𝔽_p(t); Φ is an automorphism (a translation) of 𝔾_m², hence étale.

Proof outline: Φⁿ(α) = (t^{n(p²−1)}, (1 − t)^{n(p²−1)}) lies on V iff t^m + (1 − t)^m = 1 with m = n(p² − 1) + 1. If m = p^k then t^m + (1 − t)^m = (t + 1 − t)^{p^k} = 1 (Frobenius, add_pow_char_pow). Conversely write m = p^k m′ with p ∤ m′; if m′ > 1, then with u = t^{p^k} the polynomial u^{m′} + (1 − u)^{m′} − 1 has coefficient −m′ ≠ 0 at u¹, so it is nonzero and t^m + (1 − t)^m ≠ 1. m = p^k ≡ 1 (mod p² − 1) iff k is even (p ≢ 1 mod p² − 1), giving n = (p^{2j} − 1)/(p² − 1). The gaps between consecutive elements are unbounded, so the set contains no infinite arithmetic progression with positive difference and is not a finite union of arithmetic progressions (DY.6/finite-union-of-arithmetic-progressions).

Inputs: `ArithmeticDynamics:DY.6/finite-union-of-arithmetic-progressions`, `mathlib:add_pow_char_pow`, `mathlib:RatFunc`.

### 6H. Conjectures (statements only)

Each conjecture is a proposition. No theorem of the roadmap assumes one except through an explicit hypothesis of that proposition, as in `DY.6/uniform-torsion-bound-of-uniform-boundedness`.

**The dynamical Mordell–Lang conjecture (statement)** (`DY.6/dynamical-mordell-lang-conjecture`, definition).

For a quasi-projective variety X over ℂ, a morphism Φ : X → X, a closed subvariety V ⊆ X and a point α ∈ X(ℂ), let S(X, Φ, V, α) = {n ∈ ℕ : Φⁿ(α) ∈ V(ℂ)}. The dynamical Mordell–Lang property DML(X, Φ) says that S(X, Φ, V, α) is a finite union of arithmetic progressions (DY.6/finite-union-of-arithmetic-progressions) for every V and α. The dynamical Mordell–Lang conjecture is the proposition that DML(X, Φ) holds for every quasi-projective X over ℂ and every endomorphism Φ. It is a statement, not a theorem: no node of this roadmap assumes it except as an explicit hypothesis. The affine special case DML_affine(N): for every polynomial map Φ : 𝔸^N_ℂ → 𝔸^N_ℂ, every finite family G of polynomials and every α ∈ ℂ^N, {n : g(Φⁿ(α)) = 0 for all g ∈ G} is a finite union of arithmetic progressions.

Hypotheses and conventions: Characteristic 0 is essential: DY.6/dml-fails-in-positive-characteristic. Quasi-projective varieties and their morphisms are those of SchemeAndStackFoundations:SF.0 (the requests list the precise need).

API:

- `DynamicalMordellLangProperty` (data): DML(X, Φ): for all V and α, S(X, Φ, V, α) is a finite union of arithmetic progressions.
- `DynamicalMordellLangConjecture` (data): The proposition ∀ X Φ, DML(X, Φ).
- `DynamicalMordellLangAffine` (data): The proposition DML_affine(N) for polynomial self-maps of 𝔸^N_ℂ.
- `dynamicalMordellLangProperty_iterate_iff` (relation): DML(X, Φ) iff DML(X, Φ^k) for k ≥ 1.
- `dynamicalMordellLangProperty_of_etale` (other): DML(X, Φ) holds for Φ étale (DY.6/etale-dynamical-mordell-lang).
- `dynamicalMordellLangAffine_of_conjecture` (relation): The conjecture implies DML_affine(N) for every N.

Unit tests:

- `dmlSet_translation` (computation): X = 𝔸¹_ℂ, Φ(z) = z + 1, α = 0, V = {3}: S = {3}, a finite union of arithmetic progressions.
- `dmlSet_univ_empty` (degenerate): For V = X, S = ℕ; for V = ∅, S = ∅.
- `dml_linear_of_skolemMahlerLech` (compatibility): For linear Φ on 𝔸^N_ℂ and a hyperplane V, S is the zero set of a linear recurrence sequence, so DML is the Skolem–Mahler–Lech theorem (DiophantineApproximationAndTranscendence:DT.2 for the simple-root case).
- `dml_fails_char_p` (non-example): The analogue over 𝔽_p(t) is false (DY.6/dml-fails-in-positive-characteristic): the return set {(p^{2n} − 1)/(p² − 1)} is not a finite union of arithmetic progressions.

Proof outline: The two formulations agree: V(ℂ) ∩ O_Φ(α) is a finite union of orbits O_{Φ^N}(Φ^ℓ(α)) iff S is a finite union of progressions {Nk + ℓ} (DY.6/finite-union-of-arithmetic-progressions). DML_affine(N) is the case X = 𝔸^N_ℂ, V = V(G).

Inputs: `ArithmeticDynamics:DY.6/finite-union-of-arithmetic-progressions`, `SchemeAndStackFoundations:SF.0`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:MvPolynomial.aeval`.

**The dynamical Lehmer conjecture for maps of ℙ¹ (statement)** (`DY.6/dynamical-lehmer-conjecture`, definition).

For a number field K and a rational map f of ℙ¹ of degree d ≥ 2 over K, the dynamical Lehmer property Lehmer(f) says: there is C(f) > 0 such that ĥ_f(x) ≥ C(f)/[K(x) : K] for every x ∈ ℙ¹(ℚ̄) that is not preperiodic for f, where ĥ_f is the absolute canonical height (DY.1/canonical-height-on-the-projective-line). The dynamical Lehmer conjecture (for ℙ¹) is the proposition that Lehmer(f) holds for every such K and f. It is a statement, not a theorem; no node of this roadmap assumes it except as an explicit hypothesis.

Hypotheses and conventions: K a number field; d ≥ 2; x ranges over ℚ̄-points that are wandering. The ℙ^N form of the source is the same statement for morphisms of ℙ^N; DY.6 states the ℙ¹ case, which is the case its examples use.

API:

- `DynamicalLehmerProperty` (data): Lehmer(f): ∃ C > 0, ∀ wandering x ∈ ℙ¹(ℚ̄), ĥ_f(x) ≥ C/[K(x) : K].
- `DynamicalLehmerConjecture` (data): The proposition ∀ K f, Lehmer(f).
- `dynamicalLehmerProperty_conj_iff` (relation): Lehmer(φ⁻¹ ∘ f ∘ φ) ⟺ Lehmer(f) for φ ∈ PGL₂(K).
- `dynamicalLehmerProperty_iterate_iff` (relation): Lehmer(fⁿ) ⟺ Lehmer(f) for n ≥ 1 (ĥ_{fⁿ} = ĥ_f).

Unit tests:

- `dynamicalLehmer_powerMap_two_example` (computation): For f = z² and x = 2 (K = ℚ), ĥ_f(2) = log 2 ≥ C(f)/1 for any C(f) ≤ log 2.
- `dynamicalLehmer_degree_one_points` (degenerate): Restricted to x ∈ ℙ¹(K) the bound holds unconditionally: the wandering points of ℙ¹(K) have canonical height bounded below by a positive constant, because there are finitely many points of ℙ¹(K) of height ≤ 1 (DY.1/northcott-for-preperiodic-points).
- `dynamicalLehmer_powerMap_iff_lehmer` (compatibility): Lehmer(z²) over ℚ is equivalent to Lehmer's conjecture for the absolute Weil height (ClassicalArithmeticCompletion:CA.6/canonical-height-power-map).
- `dynamicalLehmer_needs_degree` (non-example): The factor 1/[K(x) : K] cannot be dropped: for f = z², ĥ_f(2^{1/n}) = (log 2)/n → 0 with 2^{1/n} wandering.

Proof outline: The degree [K(x) : K] of the field of definition of x; wandering means not preperiodic. For f = z² the property is Lehmer's conjecture ∃ C > 0, h(α) ≥ C/[ℚ(α) : ℚ] for α ≠ 0 not a root of unity (ClassicalArithmeticCompletion:CA.6/canonical-height-power-map).

Inputs: `ArithmeticDynamics:DY.1/canonical-height-on-the-projective-line`, `ClassicalArithmeticCompletion:CA.6/canonical-height-power-map`, `mathlib:IntermediateField.adjoin`, `mathlib:Module.finrank`.

The uniform boundedness conjecture is stated once, in DY.3 (`DY.3/uniform-boundedness-conjecture`, for morphisms of ℙᴺ, with the ℙ¹ form `UniformBoundednessProperty` carrying an explicit constant); DY.6 consumes it only as an explicit hypothesis.

**Dynamically related points of a map over a function field** (`DY.6/dynamically-related-points`, definition).

Let L be a field with algebraic closure L̄, f a rational map of ℙ¹ of degree d ≥ 2 over L with forms (F, G), and a, b ∈ ℙ¹(L̄). The points a and b are f-dynamically related if there is a nonzero squarefree bihomogeneous Q ∈ L̄[X₀, X₁; Y₀, Y₁] of positive total degree (defining a curve C = V(Q) ⊂ ℙ¹ × ℙ¹) with Q(a; b) = 0 and (f × f)(C) ⊆ C, i.e. Q divides Q(F(X₀, X₁), G(X₀, X₁); F(Y₀, Y₁), G(Y₀, Y₁)). For a family over k(t) (DY.6/specialization-of-rational-maps) one takes L = k(t).

Hypotheses and conventions: L any field; in the dynamical André–Oort conjecture L = k(t) with k algebraically closed of characteristic 0.

API:

- `DynamicallyRelated` (data): The relation on ℙ¹(L̄) × ℙ¹(L̄).
- `DynamicallyRelated.symm` (relation): Symmetric (swap the factors).
- `DynamicallyRelated.refl` (relation): Reflexive (the diagonal).
- `dynamicallyRelated_of_isPreperiodic` (other): A preperiodic point is related to every point.
- `DynamicallyRelated.conj` (functoriality): Relatedness is preserved by simultaneous conjugation: a ~_f b ⟹ φ⁻¹a ~_{φ⁻¹fφ} φ⁻¹b.

Unit tests:

- `dynamicallyRelated_graph_sq` (computation): Over ℚ(t), for f = z², a = t and b = t² are related through the graph C : Y₀X₁² = X₀²Y₁ of z², which is (f × f)-invariant.
- `dynamicallyRelated_refl` (degenerate): Every a is related to itself (the diagonal is invariant).
- `dynamicallyRelated_preperiodic_example` (compatibility): If a is preperiodic for f then a is related to every b.
- `dynamicallyRelated_requires_invariance` (non-example): For f = z² + 1 over ℚ, the vertical line C = {X₀ = 0} contains (0, b) but is not invariant (f(0) = 1), so it does not witness a relation; 0 is wandering and a relation needs another curve.

Proof outline: For squarefree Q, the invariance (f × f)(C) ⊆ C is equivalent to Q | Q ∘ (F, G; F, G) by the Nullstellensatz over L̄.

Inputs: `ArithmeticDynamics:DY.0/rational-map-of-the-projective-line`, `mathlib:MvPolynomial`, `mathlib:MvPolynomial.IsHomogeneous`, `mathlib:AlgebraicClosure`.

**The dynamical André–Oort conjecture for one-parameter families (statement)** (`DY.6/dynamical-andre-oort-conjecture`, definition).

Let k be an algebraically closed field of characteristic 0 and f a rational map of degree d ≥ 2 over k(t) (a family over the t-line, DY.6/specialization-of-rational-maps) that is not isotrivial in moduli: the specialisations f_{t₀}, t₀ ∈ T⁰(f), are not all conjugate to one another. Let c₁, …, c_{2d−2} ∈ ℙ¹ over an algebraic closure of k(t) be the critical points of f with multiplicity (DY.0/critical-points-of-a-rational-map). DAO(f) is the equivalence: there are infinitely many t₀ ∈ T⁰(f) such that f_{t₀} is postcritically finite (DY.6/postcritically-finite-map) if and only if c_i and c_j are f-dynamically related (DY.6/dynamically-related-points) for all i, j. The dynamical André–Oort conjecture for one-parameter families (Baker–DeMarco) is the proposition that DAO(f) holds for all such families. It is a statement, not a theorem; the higher-dimensional form of Baker–DeMarco is not precise in the sources and is not stated in DY.6.

Hypotheses and conventions: Base: the t-line, with f defined over k(t); passing to a finite cover of the base on which the critical points are rational does not change either side, so this is the source's statement for families defined over k(t). k algebraically closed of characteristic 0. The non-isotriviality hypothesis is implicit in the source (its families (11.1) are non-constant); without it the statement is false (ArithmeticDynamics/E710).

API:

- `DynamicalAndreOortProperty` (data): DAO(f) for a non-isotrivial family f over k(t).
- `DynamicalAndreOortConjecture` (data): The proposition ∀ f non-isotrivial, DAO(f).
- `dynamicalAndreOortProperty_of_all_preperiodic` (other): If all critical points of f are preperiodic over the algebraic closure of k(t), DAO(f) holds.

Unit tests:

- `dao_sq_add_t` (computation): For f = z² + t over k(t) (critical points 0 and ∞, with ∞ fixed): 0 and ∞ are related because ∞ is preperiodic, and z² + t₀ is PCF for infinitely many t₀ (for instance every root of fⁿ_t(0) = 0), so both sides of DAO(f) hold.
- `dao_all_preperiodic` (degenerate): If every critical point of f is preperiodic over the algebraic closure of k(t), then (b) holds and f_{t₀} is PCF for every t₀ ∈ T⁰(f) (preperiodicity specialises), so (a) holds.
- `dao_legendre_family` (compatibility): For the Legendre Lattès family over k(t), which is non-isotrivial (j(t) is non-constant), every specialisation is PCF (DY.6/lattes-map-postcritically-finite) and the critical points are preperiodic (they map to x(E[2])), so both sides hold.
- `dao_constant_family` (non-example): For the constant family f = z² + 1 over k(t), 0 and ∞ are related (∞ is fixed) but no specialisation is PCF: the non-isotriviality hypothesis cannot be dropped.

Proof outline: (b) ⟹ (a) is expected from relations forcing simultaneous preperiodicity; (a) ⟹ (b) is the unlikely-intersection content. Neither direction is proved in general. Both sides are unchanged by a finite base change t = φ(s) and by conjugation of the family, so the formulation with critical points over the algebraic closure of k(t) agrees with the marked-critical-point formulation of the source.

Inputs: `ArithmeticDynamics:DY.6/specialization-of-rational-maps`, `ArithmeticDynamics:DY.0/critical-points-of-a-rational-map`, `ArithmeticDynamics:DY.6/postcritically-finite-map`, `ArithmeticDynamics:DY.6/dynamically-related-points`, `ArithmeticDynamics:DY.0/conjugacy-of-rational-maps`.

### Already built

The following declarations of the pinned libraries are used as they stand (statements read at Mathlib 082e2d3 and Tau Ceti f790474); they are cited, not planned:

- `mathlib:AbsoluteValue` (Mathlib/Algebra/Order/AbsoluteValue/Basic.lean): Absolute values R → S; the places of the admissible family on k(t) are AbsoluteValue (RatFunc k) ℝ.
- `mathlib:Algebra.FiniteType` (Mathlib/RingTheory/FiniteType.lean): Finitely generated algebras (finite type).
- `mathlib:AlgebraicClosure` (Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean): The algebraic closure of a field.
- `mathlib:AlgebraicGeometry.Etale` (Mathlib/AlgebraicGeometry/Morphisms/Etale.lean): Étale morphisms of schemes.
- `mathlib:AlgebraicGeometry.FormallyUnramified` (Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean): Formally unramified morphisms of schemes (unramified with locally finite type).
- `mathlib:AlgebraicGeometry.Scheme` (Mathlib/AlgebraicGeometry/Scheme.lean): Schemes.
- `mathlib:AlgebraicGeometry.Smooth` (Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean): Smooth morphisms of schemes.
- `mathlib:ArithmeticFunction.moebius` (Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean): The Möbius function μ.
- `mathlib:Function.IsPeriodicPt` (Mathlib/Dynamics/PeriodicPts/Defs.lean): Periodic points of a self-map: f^[n] x = x.
- `mathlib:Height.AdmissibleAbsValues` (Mathlib/NumberTheory/Height/Basic.lean): Fields with an admissible family of absolute values (archimedean multiset, nonarchimedean set, product formula).
- `mathlib:Height.logHeight` (Mathlib/NumberTheory/Height/Basic.lean): The logarithmic height of a vector ι → K relative to K.
- `mathlib:Height.logHeight_eval_ge` (Mathlib/NumberTheory/Height/MvPolynomial.lean): Lower bound logHeight (p x) ≥ N logHeight x − log(#ι′^{totalWeight} · max(mulHeightBound q, 1)) from a Nullstellensatz certificate q.
- `mathlib:Height.logHeight_eval_le` (Mathlib/NumberTheory/Height/MvPolynomial.lean): Upper bound logHeight (p x) ≤ log max(mulHeightBound p, 1) + N logHeight x for homogeneous forms of degree N.
- `mathlib:Height.logHeight₁` (Mathlib/NumberTheory/Height/Basic.lean): The logarithmic height of a field element relative to K.
- `mathlib:Height.mulHeightBound` (Mathlib/NumberTheory/Height/MvPolynomial.lean): The explicit constant of the height bound for a family of polynomials.
- `mathlib:Height.mulHeightBound_eq` (Mathlib/NumberTheory/Height/MvPolynomial.lean): The unfolding of mulHeightBound as a product over archimedean and nonarchimedean absolute values.
- `mathlib:Height.totalWeight` (Mathlib/NumberTheory/Height/Basic.lean): The number of archimedean absolute values counted with multiplicity (0 for function fields, [K : ℚ] for number fields).
- `mathlib:Ideal.exists_maximal` (Mathlib/RingTheory/Ideal/Maximal.lean): Every nonzero ring has a maximal ideal.
- `mathlib:IntermediateField.adjoin` (Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean): The subfield generated over K by a set (the field of definition K(x)).
- `mathlib:IsAlgClosed.lift` (Mathlib/FieldTheory/IsAlgClosed/Basic.lean): Embedding an algebraic extension into an algebraically closed field.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation` (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean): The adic valuation of a Dedekind domain at a height-one prime, extended to the fraction field (the places π of k(t)).
- `mathlib:IsPrimitiveRoot` (Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean): Primitive roots of unity.
- `mathlib:IsUltrametricDist` (Mathlib/Topology/MetricSpace/Ultra/Basic.lean): Ultrametric distances (the nonarchimedean inequality used in Strassmann's theorem).
- `mathlib:Localization.Away` (Mathlib/GroupTheory/MonoidLocalization/Away.lean): The localisation R[1/s].
- `mathlib:Module.finrank` (Mathlib/LinearAlgebra/Dimension/Finrank.lean): Dimension of a vector space; field degrees [L : K].
- `mathlib:MvPolynomial` (Mathlib/Algebra/MvPolynomial/Basic.lean): Multivariate polynomials (forms defining rational maps and curves in ℙ¹ × ℙ¹).
- `mathlib:MvPolynomial.IsHomogeneous` (Mathlib/RingTheory/MvPolynomial/Homogeneous.lean): Homogeneity of multivariate polynomials.
- `mathlib:MvPolynomial.aeval` (Mathlib/Algebra/MvPolynomial/Eval.lean): Evaluation of multivariate polynomials in an algebra.
- `mathlib:Nat.ModEq.pow_totient` (Mathlib/FieldTheory/Finite/Basic.lean): Euler's theorem x^φ(n) ≡ 1 mod n for x coprime to n.
- `mathlib:NumberField.absLogHeight₁` (Mathlib/NumberTheory/Height/NumberField.lean): The absolute logarithmic Weil height of an algebraic number.
- `mathlib:NumberField.instAdmissibleAbsValues` (Mathlib/NumberTheory/Height/NumberField.lean): The admissible absolute values of a number field (infinite places with multiplicity, finite places).
- `mathlib:PadicInt` (Mathlib/NumberTheory/Padics/PadicIntegers.lean): The p-adic integers ℤ_p.
- `mathlib:Polynomial` (Mathlib/Algebra/Polynomial/Basic.lean): Univariate polynomials.
- `mathlib:Polynomial.cyclotomic` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): Cyclotomic polynomials Φ_m.
- `mathlib:Polynomial.derivative` (Mathlib/Algebra/Polynomial/Derivative.lean): Formal derivative of a polynomial.
- `mathlib:Polynomial.eq_zero_of_infinite_isRoot` (Mathlib/Algebra/Polynomial/Roots.lean): A polynomial with infinitely many roots is zero.
- `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant` (Mathlib/RingTheory/Polynomial/Resultant/Basic.lean): Bézout-type certificate f p + g q = C (resultant f g) with degree bounds.
- `mathlib:Polynomial.homogenize` (Mathlib/Algebra/Polynomial/Homogenize.lean): Homogenisation of a univariate polynomial to a form in two variables of a given degree.
- `mathlib:Polynomial.natDegree_X_pow` (Mathlib/Algebra/Polynomial/Degree/Defs.lean): natDegree (X^n) = n.
- `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): ∏_{i | n} Φ_i = X^n − 1.
- `mathlib:Polynomial.resultant` (Mathlib/RingTheory/Polynomial/Resultant/Basic.lean): The Sylvester resultant of two polynomials.
- `mathlib:Polynomial.resultant_eq_zero_iff` (Mathlib/RingTheory/Polynomial/Resultant/Basic.lean): Over a field, the resultant vanishes iff (not both zero and) the polynomials are not coprime.
- `mathlib:Polynomial.rootMultiplicity` (Mathlib/Algebra/Polynomial/Div.lean): Multiplicity of a root.
- `mathlib:Polynomial.roots` (Mathlib/Algebra/Polynomial/Roots.lean): The multiset of roots of a polynomial.
- `mathlib:PowerSeries` (Mathlib/RingTheory/PowerSeries/Basic.lean): Formal power series in one variable.
- `mathlib:RatFunc` (Mathlib/FieldTheory/RatFunc/Defs.lean): The rational function field K(X).
- `mathlib:RatFunc.denom` (Mathlib/FieldTheory/RatFunc/Basic.lean): The monic denominator of a rational function in lowest terms.
- `mathlib:RatFunc.finrank_eq_max_natDegree` (Mathlib/FieldTheory/RatFunc/IntermediateField.lean): [K(X) : K(f)] = max(deg num f, deg denom f).
- `mathlib:RatFunc.inftyValuation` (Mathlib/FieldTheory/RatFunc/Valuation.lean): The valuation at infinity of K(X).
- `mathlib:RatFunc.intDegree` (Mathlib/FieldTheory/RatFunc/Degree.lean): deg num − deg denom of a rational function (not the height).
- `mathlib:RatFunc.num` (Mathlib/FieldTheory/RatFunc/Basic.lean): The numerator of a rational function in lowest terms.
- `mathlib:Set.Finite` (Mathlib/Basic/Finite/Defs.lean): Finite sets.
- `mathlib:Set.Infinite` (Mathlib/Basic/Finite/Defs.lean): Infinite sets.
- `mathlib:Set.ncard` (Mathlib/Data/Set/Card.lean): Cardinality of a set as a natural number.
- `mathlib:WeierstrassCurve.Affine.Point.add_of_X_ne` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean): The addition formula for two affine points with distinct x-coordinates.
- `mathlib:WeierstrassCurve.Affine.Point.xRep` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean): The x-coordinate map E(F) → ℙ¹ as a representative vector: O ↦ ![1, 0], (x, y) ↦ ![x, 1].
- `mathlib:WeierstrassCurve.Affine.Y_eq_of_X_eq` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Formula.lean): Two points on the curve with equal x-coordinates have equal or opposite y-coordinates.
- `mathlib:WeierstrassCurve.Affine.addX` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Formula.lean): The x-coordinate of a sum: ℓ² + a₁ℓ − a₂ − x₁ − x₂.
- `mathlib:WeierstrassCurve.Affine.equation_iff_nonsingular_of_Δ_ne_zero` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean): When Δ ≠ 0, every point on the curve is nonsingular.
- `mathlib:WeierstrassCurve.Affine.negY` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Formula.lean): The y-coordinate of the negative of a point.
- `mathlib:WeierstrassCurve.Affine.slope` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Formula.lean): The slope of the line through two points (tangent when equal).
- `mathlib:WeierstrassCurve.IsElliptic` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): Weierstrass curves with invertible discriminant.
- `mathlib:WeierstrassCurve.Jacobian.Point.toAffineAddEquiv` (Mathlib/AlgebraicGeometry/EllipticCurve/Jacobian/Point.lean): The group isomorphism between Jacobian and affine points (used to transport n • P = 0).
- `mathlib:WeierstrassCurve.b₂` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): The invariant b₂ = a₁² + 4a₂.
- `mathlib:WeierstrassCurve.b₄` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): The invariant b₄ = 2a₄ + a₁a₃.
- `mathlib:WeierstrassCurve.j` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): The j-invariant.
- `mathlib:WeierstrassCurve.leadingCoeff_Φ` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Degree.lean): Φ_n is monic.
- `mathlib:WeierstrassCurve.map_Φ` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): Φ_n commutes with ring homomorphisms (base change / specialisation of coefficients).
- `mathlib:WeierstrassCurve.map_ΨSq` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): ΨSq_n commutes with ring homomorphisms.
- `mathlib:WeierstrassCurve.natDegree_Φ` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Degree.lean): deg Φ_n = n².
- `mathlib:WeierstrassCurve.natDegree_ΨSq_le` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Degree.lean): deg ΨSq_n ≤ n² − 1.
- `mathlib:WeierstrassCurve.Δ` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): The discriminant of a Weierstrass curve.
- `mathlib:WeierstrassCurve.Φ` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): The univariate division polynomials Φ_n (numerator of x(nP)).
- `mathlib:WeierstrassCurve.Φ_neg` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): Φ_{−n} = Φ_n.
- `mathlib:WeierstrassCurve.Φ_two` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): Φ_2 = X⁴ − b₄X² − 2b₆X − b₈.
- `mathlib:WeierstrassCurve.ΨSq` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): The univariate polynomials ΨSq_n congruent to ψ_n² (denominator of x(nP)).
- `mathlib:WeierstrassCurve.ΨSq_neg` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): ΨSq_{−n} = ΨSq_n.
- `mathlib:WeierstrassCurve.ΨSq_two` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): ΨSq_2 = Ψ₂Sq.
- `mathlib:WeierstrassCurve.Ψ₂Sq` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): Ψ₂Sq = 4X³ + b₂X² + 2b₄X + b₆.
- `mathlib:WeierstrassCurve.ψ` (Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): The bivariate division polynomials ψ_n.
- `mathlib:add_pow_char_pow` (Mathlib/Algebra/CharP/Lemmas.lean): Frobenius: (x + y)^{p^n} = x^{p^n} + y^{p^n} in characteristic p.
- `mathlib:cauchySeq_of_le_geometric` (Mathlib/Analysis/SpecificLimits/Basic.lean): A sequence with geometrically decaying steps is Cauchy (Tate telescoping).
- `mathlib:dist_le_of_le_geometric_of_tendsto₀` (Mathlib/Analysis/SpecificLimits/Basic.lean): Distance from the first term to the limit is at most C/(1 − r).
- `mathlib:finite_of_finite_type_of_isJacobsonRing` (Mathlib/RingTheory/Jacobson/Ring.lean): Zariski's lemma: a field of finite type over a Jacobson ring is finite over it.
- `mathlib:isOfFinOrder_iff_pow_eq_one` (Mathlib/GroupTheory/OrderOfElement.lean): Finite order iff some positive power is 1.
- `mathlib:orderOf_dvd_iff_pow_eq_one` (Mathlib/GroupTheory/OrderOfElement.lean): orderOf x ∣ n iff x^n = 1.
- `mathlib:rootsOfUnity` (Mathlib/RingTheory/RootsOfUnity/Basic.lean): The group of k-th roots of unity.
- `tauceti:TauCeti.Isogeny.comp_fieldPullback` (TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/FunctionField.lean): The function-field pullback of a composite isogeny is the composite of the pullbacks.
- `tauceti:TauCeti.Isogeny.fieldPullback_mulByIntIsogeny_X` (TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Degree.lean): The pullback of x along [n] is Φ_n(x)/ΨSq_n(x) in F(E).
- `tauceti:TauCeti.Isogeny.mulByIntIsogeny_comp_mulByIntIsogeny` (TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Comp.lean): [m] ∘ [n] = [mn] as isogenies.
- `tauceti:TauCeti.Isogeny.pullbackDifferential_mulByIntIsogeny_invariantDifferential` (TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Separability.lean): [n]*ω = n ω for the invariant differential.
- `tauceti:WeierstrassCurve.Affine.Point.abs_canonicalHeight_sub_naiveHeight_le` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): |ĥ(P) − h(P)/2| ≤ D uniformly for the Néron–Tate height.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): The Néron–Tate height ½ lim h(x(2ⁿP))/4ⁿ over a field with admissible absolute values (normalised to (O)).
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_zsmul` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): ĥ(nP) = n² ĥ(P).
- `tauceti:WeierstrassCurve.Affine.Point.naiveHeight_eq_logHeight₁` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/NaiveHeight.lean): The naive height is logHeight₁ of the x-coordinate (0 at O).
- `tauceti:WeierstrassCurve.Affine.exists_point_on_curve` (TauCeti/AlgebraicGeometry/EllipticCurve/Affine/IsAlgClosed.lean): Over an algebraically closed field every x is the x-coordinate of a point on the curve.
- `tauceti:WeierstrassCurve.Affine.invariantDifferential` (TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean): The invariant differential dx/(2y + a₁x + a₃) in the Kähler differentials of F(E).
- `tauceti:WeierstrassCurve.evalEval_Ψ_sq_eq_eval_ΨSq` (TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Eval.lean): Ψ_n(x, y)² = ΨSq_n(x) at points on the curve.
- `tauceti:WeierstrassCurve.evalEval_ψ_eq_evalEval_Ψ` (TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Eval.lean): ψ_n and Ψ_n agree at points on the curve.
- `tauceti:WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero` (TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean): If n • P = 0 then ψ_n(P) = 0.
- `tauceti:WeierstrassCurve.eval_ΨSq_ne_zero_of_zsmul_ne_zero` (TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Coprimality.lean): If n • P ≠ 0 then ΨSq_n(x(P)) ≠ 0.
- `tauceti:WeierstrassCurve.isCoprime_Φ_ΨSq` (TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Coprimality.lean): Φ_n and ΨSq_n are coprime when Δ ≠ 0, in every characteristic.
- `tauceti:WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul` (TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Descent.lean): x(nP) · ΨSq_n(x(P)) = Φ_n(x(P)) for affine P, nP.
- `tauceti:WeierstrassCurve.ΨSq_ne_zero_of_Δ_ne_zero` (TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Coprimality.lean): ΨSq_n ≠ 0 for n ≠ 0 when Δ ≠ 0.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nsmul` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): ĥ(nP) = n² ĥ(P) for natural n (the audit's built elliptic target of DY.6).
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): ĥ(P) = 0 iff P is torsion, under a Northcott instance (the elliptic case of the zero-height criterion).
- `tauceti:WeierstrassCurve.Affine.neronTatePairing` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): The Néron–Tate pairing, the polarisation of the canonical height (the audit's built elliptic target of DY.6).

### Inputs requested from other roadmaps

- TropicalAndBerkovichArithmetic:TB.0: (1) The Berkovich projective line P^{1,an} over ℂ_v (and over k₀ = ℂ((T))) with the type II/III points ζ_{a,r}, the hyperbolic metric on H = A^{1,an} ∖ ℂ_v, and the interval (hyperbolic-length) measures on segments [ζ₁, ζ₂] ⊂ H; the action of a rational map on type II points (images of discs). (2) The hybrid space X^hyb of the degenerating family 𝔻* × ℙ¹(ℂ) (Boucksom–Jonsson; Favre): the fibres ℙ¹(ℂ) over t ∈ 𝔻* glued to P^{1,an}_{ℂ((T))} over t = 0, with the topology in which the sets {|t|^{a+δ} < |z| < |t|^{a−δ}, 0 < |t| < δ} ∪ A(|T|₀^{a+δ}, |T|₀^{a−δ}) and the disc-like sets are open and which restricts to the Berkovich topology on the central fibre; compactness of the segment [0, ∞] ⊂ P^{1,an}_{ℂ((T))}.
- SchemeAndStackFoundations:SF.0: (1) Quasi-projective varieties over a field K: schemes admitting an immersion into ℙ^N_K = Proj K[x₀, …, x_N], their closed subvarieties and K-points, with étale and unramified endomorphisms as Mathlib AlgebraicGeometry.Etale / FormallyUnramified morphisms of finite type. (2) Spreading out: for X, Φ, V, α over ℂ defined over a finitely generated ℤ-algebra R ⊂ ℂ, a model X_R → Spec R such that, over a dense open U ⊆ Spec R, X_U is smooth and quasi-projective, Φ extends to an unramified endomorphism, fibres are geometrically irreducible, and α extends to a section (EGA IV §§8–9, 12; Bell–Ghioca–Tucker Proposition 4.3). (3) Base change of smoothness, unramifiedness and quasi-projectivity along Spec ℤ_p → Spec R.
- HeightsRationalPointsAndObstructions:RP.0: For a projective variety X over ℚ̄ with an ample line bundle L, the Weil height h_{X,L} : X(ℚ̄) → ℝ (well defined up to bounded functions), with pullback functoriality h_{Y,φ*M} = h_{X,M} ∘ φ + O(1) for morphisms φ : Y → X, restriction to closed subvarieties, commensurability c₁h_{X,L} − c₂ ≤ h_{X,L′} ≤ c₃h_{X,L} + c₄ of two ample heights, and the comparison h_{X,L}(u) ≤ C₁h_{Y,M}(F(u)) + C₂ on U(ℚ̄) for a quasi-finite morphism F : U → Y from an open U ⊆ X (Ingram, Lemma 15); applied to a projective compactification of the moduli space M_d of DY.0/moduli-space-of-rational-maps, giving the ample moduli height h_{M_d}.

### Recorded gaps

- Cohen structure theorem for complete regular local rings: Bell–Ghioca–Tucker Proposition 2.1 uses Matsumura Theorem 29.7: an unramified complete regular local ring of characteristic 0 with residue field 𝔽_p is ℤ_p[[T₁, …, T_g]]. Neither pinned library contains it and no atlas layer plans it.
- Lech's embedding lemma: A finitely generated field over ℚ with finitely many marked elements embeds into ℚ_p with the marked elements in ℤ_p, for infinitely many p (Lech 1953; Cassels; Bell 2006 Lemma 3.1). The proof (Chebotarev/Hensel on a model over a finitely generated ring) is not decomposed and not in the libraries.
- Degeneration of maximal-entropy measures (DeMarco–Faber; Favre): DeMarco–Faber, Forum Math. Sigma 2 (2014) (arXiv:1302.4769), Theorem B, and arXiv:1309.7103, Theorem D; Favre, J. Inst. Math. Jussieu 19 (2020) (arXiv:1611.08490), Theorem B: weak convergence μ_t → μ̂_f and continuity of the normalised potentials in the hybrid space. These complex-dynamical theorems are cited, not decomposed; no atlas layer plans them.
- DeMarco–Wang–Ye on torsion points in the Legendre family: DeMarco–Wang–Ye, Torsion points and the Lattès family, Amer. J. Math. 138 (2016): Proposition 1.4 (only 0, 1, ∞ are torsion images for every t) and Theorem 1.2 (for x₀ ∈ ℚ̄ ∖ {0, 1} the set of t with (x₀, ·) torsion on E_t is infinite). Cited by DeMarco–Krieger–Ye and not decomposed.
- Tate's variation theorem (source not public): Tate, Variation of the canonical height of a point depending on a parameter, Amer. J. Math. 105 (1983): the proof through Néron local heights is not publicly available; the statement is taken from Call–Silverman (Remark after Theorem 4.1) and Ingram (§1).
- McMullen's finiteness of the multiplier spectrum and Silverman's moduli-height comparison: Ingram's proof uses McMullen, Families of rational maps and iterative root-finding algorithms (Ann. Math. 1987), Corollary 2.3 (for some n the multiplier spectrum σ_n is finite-to-one on M_d ∖ L_d), and Silverman's comparison h_{M_d} ≍ min_{g ~ f} h_{Hom_d}(g) (Ingram Lemma 13, from The Arithmetic of Dynamical Systems p. 103, not public). Neither is planned in the atlas; McMullen's theorem belongs with the bifurcation theory of the proposed Part II.
- Inputs of the Ghioca–Tucker–Zieve theorems: Bilu–Tichy's theorem on F(x) = G(y) (via Siegel's theorem on integral points; GTZ Theorem 2.1), Ritt's classification of polynomials with a common iterate (GTZ Proposition 6.3), Benedetto's theorem that non-isotrivial polynomials over function fields have ĥ = 0 only at preperiodic points (GTZ Lemma 6.7), and Call–Silverman Theorem 4.1 over a base curve over a finitely generated field of positive transcendence degree (DY.6 proves it for the t-line over a number field). None is planned in the atlas.

### Acceptance tests for the layer

- (`DY.6/power-map`) P_2 over ℚ: P_2(2) = 4, P_2³(2) = 256, P_2(∞) = ∞, P_2(−1) = 1.
- (`DY.6/power-map`) P_d ∘ P_e = P_{de} holds as an equality of rational maps (of forms up to scaling), not only on points.
- (`DY.6/power-map`) Res(X^d, Y^d) = 1, so P_d has good reduction at every finite place of every number field.
- (`DY.6/lattes-map`) E : y² = x³ − x over ℚ: f_{E,2}(x) = (x² + 1)²/(4x(x² − 1)), with f_{E,2}(0) = f_{E,2}(±1) = ∞ (the 2-torsion) and f_{E,2}(∞) = ∞.
- (`DY.6/lattes-map`) The Legendre curve E_t: f_{E_t,2} = (x² − t)²/(4x(x − 1)(x − t)), the map (2.1) of DeMarco–Krieger–Ye (DY.6/legendre-lattes-map).
- (`DY.6/lattes-map`) deg f_{E,3} = 9: Φ_3 has degree 9 and ΨSq_3 = Ψ₃² has degree 8.
- (`DY.6/flexible-lattes-map`) f_t (t ≠ 0, 1) is flexible Lattès of degree 4 (T = O, n = 2), and so is τ_{(0,0)} ∘ f_t(x) = t/f_t(x).
- (`DY.6/flexible-lattes-map`) L_d = ∅ for d = 2, 3, 5, 6, 7, 8.
- (`DY.6/flexible-lattes-map`) P_4 is not flexible Lattès although 4 is a square.
- (`DY.6/legendre-lattes-map`) t = −1: f_{−1}(x) = (x² + 1)²/(4x(x² − 1)), the Lattès map of y² = x³ − x.
- (`DY.6/legendre-lattes-map`) Res(F_t) = 256t⁴(t − 1)⁴ = Δ(E_t)², so f_t has good reduction exactly at the places v ∤ 2 with |t(t − 1)|_v = 1 (DY.6/legendre-canonical-measure-away-from-two).
- (`DY.6/specialization-of-canonical-heights`) f = z² + t, P = 0: ĥ_{z²+t₀}(0)/h(t₀) → 1/2, since ĥ^{ℚ(t)}_{z²+t}(0) = 1/2 (DY.1/canonical-height-over-a-global-height-field).
- (`DY.6/specialization-of-canonical-heights`) Constant family f = P_2, P = t: ĥ_{P_2}(t₀) = h(t₀), so the ratio is identically 1 = h_{K(t)}(t).
- (`DY.6/specialization-of-canonical-heights`) Consequence: if ĥ^{K(t)}_f(P) > 0 then P_{t₀} is not preperiodic for f_{t₀} once h(t₀) is large (DY.6/specialization-of-non-preperiodic-points).
- (`DY.6/critical-height`) ĥ_crit(P_d) = 0; ĥ_crit(z² + c) = ĥ_{z²+c}(0) since ∞ is fixed.
- (`DY.6/critical-height`) ĥ_crit(f_t) = 0 for the Legendre Lattès maps.
- (`DY.6/legendre-uniform-common-torsion-images`) B ≥ 34 would follow from Stoll's genus-2 example through Theorem 1.1 of the paper; the bound B of the proof is not explicit.
- (`DY.6/etale-dynamical-mordell-lang`) X = 𝔾_m² over ℂ, Φ(x, y) = (2x, 3y) (an automorphism, hence étale), V = {x + y = 1}, α = (1, 1): Φⁿ(α) ∈ V iff 2ⁿ + 3ⁿ = 1, never; S = ∅.
- (`DY.6/etale-dynamical-mordell-lang`) Positive characteristic: the analogue fails even for étale maps of 𝔾_m² (DY.6/dml-fails-in-positive-characteristic), so the proof must use characteristic 0 (the p-adic embedding).
- (`DY.6/dml-fails-in-positive-characteristic`) p = 2: the set is {(4^j − 1)/3} = {0, 1, 5, 21, 85, …}.
- (`DY.6/uniform-torsion-bound-of-uniform-boundedness`) For K = ℚ the conclusion is compatible with Mazur's bound #E(ℚ)_tors ≤ 16.
- (`DY.6/uniform-torsion-bound-of-uniform-boundedness`) The hypothesis is a named parameter of the theorem; removing it leaves the torsion bound unproved in this roadmap.
- No node consumes `DY.6/dynamical-lehmer-conjecture`, `DY.3/uniform-boundedness-conjecture`, `DY.6/dynamical-mordell-lang-conjecture` or `DY.6/dynamical-andre-oort-conjecture` except as an explicit hypothesis.

### Mistakes found in the sources

- ArithmeticDynamics/E701 (misprint, demarco-krieger-ye-2020, (3.5), Proposition 3.6, p. 17 (arXiv v2); p. 965 of the published version): The middle range is |t/4|_v < |z|_v < |4|_v. Known: Recorded as PAPER-DEMARCO-KRIEGER-YE-20/E12 in the atlas paper extraction and confirmed by its review; no published correction.
- ArithmeticDynamics/E702 (misprint, demarco-krieger-ye-2020, (5.4)–(5.5), proof of Theorem 5.2, p. 29 (arXiv v2); p. 978 of the published version): i = 0, …, n − 1, as in Lemma 4.1. Known: Recorded as PAPER-DEMARCO-KRIEGER-YE-20/E13 and confirmed by its review; no published correction.
- ArithmeticDynamics/E703 (misprint, demarco-krieger-ye-2020, Proof of Theorem 1.5, p. 37 (arXiv v2); p. 986 of the published version (Theorem 1.6)): The bound is (1/16) log(1/δ). Known: Recorded as PAPER-DEMARCO-KRIEGER-YE-20/E4 (with an explicit instance by its review); no published correction.
- ArithmeticDynamics/E704 (misprint, demarco-krieger-ye-2020, (7.5), proof of Theorem 7.1, p. 41 (arXiv v2); p. 990 of the published version): Σ_v −r_v log η_v ≤ 4(h(t₁) + h(1 − t₁) + h(t₂) + h(1 − t₂)) − log c(ε′) (plus log 2 with the repaired η_v above 2, ArithmeticDynamics/E705). Known: Recorded as PAPER-DEMARCO-KRIEGER-YE-20/E5 (correction revised by its review); no published correction.
- ArithmeticDynamics/E705 (error, demarco-krieger-ye-2020, Proof of Theorem 7.1, choice of η_v at finite places, p. 41 (arXiv v2); p. 990 of the published version): At places v | 2 take η_v := |2|_v · min{1, |t₁(t₁ − 1)|_v, |t₂(t₂ − 1)|_v}; then the potentials are constant on η_v-discs and all subsequent statements of the paper stand. Known: Recorded as PAPER-DEMARCO-KRIEGER-YE-20/E7 and confirmed by its review as an error that needs this repair; no published correction.
- ArithmeticDynamics/E706 (misprint, demarco-krieger-ye-2020, Proof of Theorem 7.1, p. 41 (arXiv v2); p. 990 of the published version): The bound is ε′ max{log|t_i|_v, log|t_i|_v⁻¹, log|t_i − 1|_v⁻¹, 1}, as in Proposition 4.4; this adds 4ε′ to (7.6), absorbed by the paper's choice ε′ < ε/16. Known: Recorded as PAPER-DEMARCO-KRIEGER-YE-20/E6 and confirmed by its review; no published correction.
- ArithmeticDynamics/E707 (misprint, demarco-krieger-ye-2020, (4.1), p. 19 (arXiv v2); p. 967 of the published version): lim_{n→∞}. Known: Recorded as PAPER-DEMARCO-KRIEGER-YE-20/E3 and confirmed by its review; no published correction.
- ArithmeticDynamics/E708 (misprint, bijmst-2019, Definition 9.1, p. 17 (arXiv v2; the same in arXiv v1)): Φ_n(X, Y) := ∏_{d|n} (Y F_d(X, Y) − X G_d(X, Y))^{µ(n/d)}: the d-th iterate inside the product. Known: new
- ArithmeticDynamics/E709 (misprint, ingram-2018-critical-height, Introduction, property A, p. 1 (arXiv v3)): A. ĥ_f(f(P)) = d ĥ_f(P). Known: new
- ArithmeticDynamics/E710 (gap, bijmst-2019, Conjecture 11.6, p. 25 (arXiv v2)): Add the hypothesis that the family is not isotrivial (the map T → M_d is non-constant), as for the non-constant families (11.1) that precede Conjecture 11.3. Known: new
- ArithmeticDynamics/E711 (misprint, demarco-mavraki-ye-2026, §2.2, p. 8 (arXiv v3)): The citation is Douady–Hubbard's proof of Thurston's characterisation [DH2]. Known: The published version (Forum Math. Pi 14 (2026) e4) cites Douady–Hubbard [DH2] at this place, according to the atlas extraction PAPER-DEMARCO-MAVRAKI-YE-26 (item 5).

### Sources

- Gregory S. Call and Joseph H. Silverman, *Canonical heights on varieties with morphisms*, Compositio Mathematica 89 (1993), no. 2, 163–205; Numdam digitisation, read 2026-09-24. https://www.numdam.org/item/CM_1993__89_2_163_0.pdf
- Laura DeMarco, Holly Krieger and Hexi Ye, *Uniform Manin-Mumford for a family of genus 2 curves*, arXiv:1901.09945v2 (3 December 2019), the post-referee version; published Annals of Mathematics 191 (2020), 949–1001; read 2026-09-24. https://arxiv.org/abs/1901.09945v2
- Laura DeMarco, Holly Krieger and Hexi Ye, *Uniform Manin-Mumford for a family of genus 2 curves (published version)*, Annals of Mathematics 191 (2020), no. 3, 949–1001, doi:10.4007/annals.2020.191.3.5; PDF from annals.math.princeton.edu, read 2026-09-24. https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf
- Laura DeMarco, Niki Myrto Mavraki and Hexi Ye, *Bounded geometry for PCF-special subvarieties*, arXiv:2405.17343v3 (10 January 2026), the accepted version of Forum Math. Pi 14 (2026) e4; read 2026-09-24. https://arxiv.org/abs/2405.17343v3
- Patrick Ingram, *The critical height is a moduli height*, arXiv:1610.07904v3 (15 October 2017); published Duke Math. J. 167 (2018), 1311–1346; read 2026-09-24. https://arxiv.org/abs/1610.07904v3
- Patrick Ingram, *Variation of the canonical height for a family of polynomials*, arXiv:1003.4225v3 (5 May 2011); read 2026-09-24. https://arxiv.org/abs/1003.4225v3
- Dragos Ghioca, Thomas J. Tucker and Michael E. Zieve, *Intersections of polynomial orbits, and a dynamical Mordell-Lang conjecture*, arXiv:0705.1954v2 (8 October 2007); published Invent. Math. 171 (2008), 463–483; read 2026-09-24. https://arxiv.org/abs/0705.1954v2
- Jason P. Bell, Dragos Ghioca and Thomas J. Tucker, *The dynamical Mordell-Lang problem for étale maps*, arXiv:0808.3266v1 (24 August 2008), the only arXiv version; published Amer. J. Math. 132 (2010); read 2026-09-24. https://arxiv.org/abs/0808.3266v1
- Robert Benedetto, Laura DeMarco, Patrick Ingram, Rafe Jones, Michelle Manes, Joseph H. Silverman and Thomas J. Tucker, *Current trends and open problems in arithmetic dynamics*, arXiv:1806.04980v2 (2 July 2018); published Bull. Amer. Math. Soc. 56 (2019); read 2026-09-24 (v1 compared at Definition 9.1). https://arxiv.org/abs/1806.04980v2
- John Milnor, *On Lattès maps*, arXiv:math/0402147v2 (Stony Brook IMS preprint 2004/01); published in Dynamics on the Riemann Sphere (EMS, 2006), 9–43; read 2026-09-24. https://arxiv.org/abs/math/0402147v2
- Dragos Ghioca, *The dynamical Mordell-Lang conjecture in positive characteristic*, arXiv:1610.00367v1; read 2026-09-24. https://arxiv.org/abs/1610.00367v1

---

## Gaps

Each of these is something this packet could not establish from the sources read. None is papered over,
and every node that depends on one names it.

### Geometric invariant theory for the moduli spaces M_d and M_d^cm as schemes

The layer plans M_d(K) = Rat_d(K)/PGL₂(K) and M_d^cm(K) as sets (with Milnor's descriptions for d = 2). The scheme-level statements of the sources are not decomposed: Rat_d = ℙ^{2d+1} ∖ V(Res) with its SL₂-action as an affine scheme over ℤ; M_d = Rat_d/SL₂ as a geometric quotient over Spec ℤ, affine of dimension 2d − 2 with a projective GIT compactification over ℚ (DeMarco–Mavraki–Ye §2.1 citing Silverman, Duke Math. J. 94 (1998) 41–77); stability of every morphism (Levy, Theorem 2.2, via the Hilbert–Mumford criterion); M₂ ≅ A²_ℤ as schemes (Silverman 1998) and the singularity of M_d for d > 2; the finite branched cover M_d^cm → M_d carrying a family f : M_d^cm × ℙ¹ → M_d^cm × ℙ¹ with marked critical points (DeMarco–Mavraki–Ye (2.1)). Missing input: Mumford's geometric invariant theory (reductive group actions, geometric and categorical quotients, the Hilbert–Mumford criterion, Seshadri's theorem over ℤ) and SL₂ as a group scheme acting on Rat_d. No atlas roadmap plans geometric invariant theory; Silverman's 1998 paper is not publicly accessible to this worker. A restructure proposal assigns the theory to AlgebraicModuliForArithmeticGeometry.

Needed by: `DY.0/moduli-space-of-rational-maps`, `DY.0/critically-marked-moduli-space`, `DY.0/moduli-space-of-quadratic-maps`.

### Measure-valued Laplacian on the Riemann sphere

The archimedean canonical measure is Δg_F + ω with Δ the distributional Laplacian of a continuous function on ℙ¹(ℂ) in the dd^c normalisation (Δ log|z| = δ₀). Mathlib has distributions (Mathlib/Analysis/Distribution/Distribution.lean) and the C² Laplacian, and Tau Ceti has the C² Laplacian with maximum principles (TauCeti/Analysis/InnerProductSpace/Laplacian/), but neither has the Riesz measure of a (difference of) subharmonic function(s): positivity for subharmonic functions, total mass 0 on ℙ¹(ℂ), Δ log|g| = the divisor of g, stability under uniform limits, Δ(u ∘ φ) = φ^*Δu for rational φ, Liouville and 'continuous potential ⟹ no atoms'. No roadmap of the atlas plans it (Tau Ceti PDE lane C covers C² potential theory on ℝⁿ and Perron's method). It is the archimedean counterpart of the TB.1 request, needed also by DY.4's archimedean local energies; a complex potential-theory layer (for instance a Part II of Tau Ceti PDE lane C) should own it.

Needed by: `DY.2/archimedean-canonical-measure`, `DY.2/archimedean-canonical-measure-properties`.

### Complex dynamics of rational maps: Lyubich's measure

The identification of µ_{f,∞} with Lyubich's measure uses the theorems of Lyubich (1983), Freire–Lopes–Mañé (1983) and Mañé (1983): uniqueness of the atom-free probability measure with f^*µ = d·µ, equidistribution of iterated preimages of non-exceptional points, and maximal entropy log d (Baker–Rumely, Theorem 2.1, citing [Ly], [FLM], [HP]). The complex Fatou–Julia theory of rational maps and measure-theoretic entropy of rational maps are planned by no roadmap of the atlas. DeMarco–Krieger–Ye use the maximal-entropy description for Lattès maps (DY.6).

Needed by: `DY.2/archimedean-canonical-measure-is-maximal-entropy-measure`.

### Zieve's proof of the sharp exponent bound for periods

Silverman's AWS notes (Theorem 27) state Zieve's bound p^{e−1} ≤ 2e_K/(p − 1) (e_K/(p − 1) for p = 2) without proof; the proof is in M. Zieve, Cycles of polynomial mappings, PhD thesis, UC Berkeley 1996, which is not publicly accessible (the author's pages returned 404/403 on 2026-09-24), and in Silverman's book The Arithmetic of Dynamical Systems, which is not public. Hutz's public proof (DY.2/period-exponent-bound) gives the weaker 2^{e−1} ≤ ord(p) (Fibonacci bound for p = 2). The node's statement is recorded; its proof is not decomposed until a public text of Zieve's second-order argument is fixed.

Needed by: `DY.2/zieve-period-exponent-bound`.

### Complex-dynamics inputs for the smoothness and irreducibility of the unicritical dynatomic curves over ℂ

Gao–Ou (arXiv:1304.4751), following Buff–Tan for d = 2 and Bousch's thesis, prove that the closure of Xₙ in ℂ² is smooth using pushforwards of meromorphic quadratic differentials and Thurston's contraction principle ((f_c)_*Q − Q ≠ 0), and irreducible using kneading sequences (a simplified Lau–Schleicher argument). No roadmap of the atlas plans holomorphic dynamics of polynomials on ℂ (quadratic differentials, the contraction principle, kneading theory), and the Tau Ceti libraries have none of it. Morton 1996 (Compositio 103, Theorem B) gives an algebraic proof of irreducibility only under a computable discriminant condition, so it does not close the gap for all n. Nothing else in DY.3 depends on this theorem: the arithmetic results (Morton's n = 4, Flynn–Poonen–Schaefer's n = 5) use explicit models and a Gröbner-basis smoothness certificate instead.

Needed by: `DY.3/unicritical-dynatomic-curve-smooth-irreducible`.

### G1: adelic line bundles on projective varieties over number fields, their intersection numbers and Zhang's successive minima

Yuan's theorem needs, for a projective variety X over a number field and adelic metrized line bundles L̄₀, …, L̄_n on X (uniform limits of model metrics, standard at almost all places): the arithmetic intersection number ĉ₁(L̄₀)⋯ĉ₁(L̄_n), multilinear, symmetric, continuous for uniform convergence of metrics, with the induction formula through a section and the local measures of TB.6; the heights h_L̄(Y) of subvarieties; and Zhang's theorem of successive minima (liminf of h_L̄ along a generic sequence ≥ h_L̄(X) for semipositive L̄ with L ample). TB.6 supplies only the local measures; GrossZagierAndArithmeticHeights GZ.2 builds arithmetic intersection only on arithmetic surfaces, and ArakelovGeometryAndAbelianHeights R35.1 only on arithmetic curves. The proposed ArakelovGeometryAndAbelianHeightsPartII (PAPER-YUAN-26) is the natural owner. The P¹ theory of this stage does not depend on it.

Needed by: `DY.4/equidistribution-for-semipositive-adelic-line-bundles`.

### G2: Yuan's arithmetic Siu inequality (arithmetic bigness)

Yuan, Big line bundles over arithmetic varieties, Theorem 2.2: for ample hermitian line bundles L̄, M̄ and any Ē on an arithmetic variety of dimension n, χ_sup(Ē + N(L̄ − M̄)) ≥ (ĉ₁(L̄)^n − n ĉ₁(L̄)^{n−1}ĉ₁(M̄)) N^n/n! + o(N^n), and its adelic form Lemma 3.3. It rests on the arithmetic Hilbert–Samuel formula (Gillet–Soulé, Zhang, Abbes–Bouche) and Bouche–Tian distortion estimates. No atlas stage owns it; same proposed owner as G1.

Needed by: `DY.4/equidistribution-for-semipositive-adelic-line-bundles`.

### G3: Yuan–Zhang adelic line bundles on quasi-projective varieties and their equidistribution theorem

Nef adelic line bundles on quasi-projective varieties over number fields, the f-invariant extension of O(1) on M_d^cm × P¹ and its restriction to the ramification divisor, nondegeneracy, and equidistribution of generic small sequences (Yuan–Zhang, Adelic line bundles on quasi-projective varieties, Theorem 5.4.3 and §6.3). Routed by PAPER-DEMARCO-MAVRAKI-YE-26 and PAPER-YUAN-26 to the proposed ArakelovGeometryAndAbelianHeightsPartII, which is not yet an atlas roadmap.

Needed by: `DY.4/equidistribution-of-pcf-parameters-in-moduli`.

### G4: bifurcation currents on M_d^cm and nonvanishing of the bifurcation measure

The bifurcation current T_bif = Σ_i π_*(T̂_f ∧ [Γ_{c_i}]) on M_d^cm with continuous potentials, its wedge powers, and T_bif^{∧(2d−2)} ≠ 0 (Bassanelli–Berteloot). Routed by PAPER-DEMARCO-MAVRAKI-YE-26 to the proposed ArithmeticDynamicsPartIIBifurcation, which is not yet an atlas roadmap.

Needed by: `DY.4/equidistribution-of-pcf-parameters-in-moduli`.

### G5: finiteness of parabolic cycles and bounded multiplicities of periodic points

For a rational map g of degree d ≥ 2 over ℂ: only finitely many periodic cycles have a root of unity as multiplier (Fatou), and the multiplicity of a periodic point as a solution of gⁿ(z) = z is bounded independently of n. Hence the multiplicity excess dⁿ + 1 − |Fix(gⁿ)| is bounded. This is local complex dynamics (the natural owners are ArithmeticDynamics DY.2 or DY.3, whose interface nodes DY.2/multiplier-of-a-periodic-cycle and DY.3/formal-and-exact-period do not state it).

Needed by: `DY.4/periodic-point-average-with-multiplicity`.

### Cohen structure theorem for complete regular local rings

Bell–Ghioca–Tucker Proposition 2.1 uses Matsumura Theorem 29.7: an unramified complete regular local ring of characteristic 0 with residue field 𝔽_p is ℤ_p[[T₁, …, T_g]]. Neither pinned library contains it and no atlas layer plans it.

Needed by: `DY.6/p-adic-power-series-coordinates`.

### Lech's embedding lemma

A finitely generated field over ℚ with finitely many marked elements embeds into ℚ_p with the marked elements in ℤ_p, for infinitely many p (Lech 1953; Cassels; Bell 2006 Lemma 3.1). The proof (Chebotarev/Hensel on a model over a finitely generated ring) is not decomposed and not in the libraries.

Needed by: `DY.6/lech-embedding-lemma`.

### Degeneration of maximal-entropy measures (DeMarco–Faber; Favre)

DeMarco–Faber, Forum Math. Sigma 2 (2014) (arXiv:1302.4769), Theorem B, and arXiv:1309.7103, Theorem D; Favre, J. Inst. Math. Jussieu 19 (2020) (arXiv:1611.08490), Theorem B: weak convergence μ_t → μ̂_f and continuity of the normalised potentials in the hybrid space. These complex-dynamical theorems are cited, not decomposed; no atlas layer plans them.

Needed by: `DY.6/legendre-measure-degeneration`.

### DeMarco–Wang–Ye on torsion points in the Legendre family

DeMarco–Wang–Ye, Torsion points and the Lattès family, Amer. J. Math. 138 (2016): Proposition 1.4 (only 0, 1, ∞ are torsion images for every t) and Theorem 1.2 (for x₀ ∈ ℚ̄ ∖ {0, 1} the set of t with (x₀, ·) torsion on E_t is infinite). Cited by DeMarco–Krieger–Ye and not decomposed.

Needed by: `DY.6/torsion-images-common-to-all-legendre-curves`, `DY.6/common-torsion-image-orders-unbounded`.

### Tate's variation theorem (source not public)

Tate, Variation of the canonical height of a point depending on a parameter, Amer. J. Math. 105 (1983): the proof through Néron local heights is not publicly available; the statement is taken from Call–Silverman (Remark after Theorem 4.1) and Ingram (§1).

Needed by: `DY.6/tate-variation-of-canonical-height`.

### McMullen's finiteness of the multiplier spectrum and Silverman's moduli-height comparison

Ingram's proof uses McMullen, Families of rational maps and iterative root-finding algorithms (Ann. Math. 1987), Corollary 2.3 (for some n the multiplier spectrum σ_n is finite-to-one on M_d ∖ L_d), and Silverman's comparison h_{M_d} ≍ min_{g ~ f} h_{Hom_d}(g) (Ingram Lemma 13, from The Arithmetic of Dynamical Systems p. 103, not public). Neither is planned in the atlas; McMullen's theorem belongs with the bifurcation theory of the proposed Part II.

Needed by: `DY.6/critical-height-is-a-moduli-height`.

### Inputs of the Ghioca–Tucker–Zieve theorems

Bilu–Tichy's theorem on F(x) = G(y) (via Siegel's theorem on integral points; GTZ Theorem 2.1), Ritt's classification of polynomials with a common iterate (GTZ Proposition 6.3), Benedetto's theorem that non-isotrivial polynomials over function fields have ĥ = 0 only at preperiodic points (GTZ Lemma 6.7), and Call–Silverman Theorem 4.1 over a base curve over a finitely generated field of positive transcendence degree (DY.6 proves it for the t-line over a number field). None is planned in the atlas.

Needed by: `DY.6/polynomial-orbits-on-lines-equal-degree`, `DY.6/polynomial-lines-dynamical-mordell-lang`.

## Requests to other roadmaps

- **SchemeAndStackFoundations:SF.0** — For a field K: the projective line ℙ¹_K = Proj K[X₀, X₁] as an object of Over (Spec K), with its K-points identified with Mathlib's ℙ K (Fin 2 → K); and, for binary forms F₀, F₁ ∈ K[X₀, X₁] homogeneous of the same degree d with no common zero over an algebraic closure (Res_{d,d}(F₀, F₁) ≠ 0), the K-morphism [F₀ : F₁] : ℙ¹_K → ℙ¹_K glued on the basic opens D₊(X₀), D₊(X₁), depending only on (F₀, F₁) up to K^×, acting on K-points by [x] ↦ [F₀(x) : F₁(x)], with [F ∘ G] = [F] ∘ [G] for the substitution F ∘ G, [X₀ : X₁] = 𝟙, and every K-endomorphism of ℙ¹_K of this form. Needed by: `DY.0/rational-map-to-scheme-endomorphism`.
- **HeightsRationalPointsAndObstructions:RP.0** — Weil's height machine over a number field K (or a global height field): for a smooth projective variety V/K and η ∈ Pic(V) ⊗ ℝ, a function h_{V,η} : V(K̄) → ℝ determined up to bounded functions, with (a) ℝ-linearity in η up to O(1) (so h_{L^{⊗d}} = d·h_L + O(1)) and dependence only on the class of η; (b) functoriality: for a morphism φ : W → V, h_{V,η} ∘ φ = h_{W,φ*η} + O(1); (c) normalisation: for V = ℙᴺ and η = [O(1)], h_{V,η} is, up to O(1), the absolute logarithmic Weil height h([x₀ : … : x_N]) = Projectivization.logHeight_K(x)/[K : ℚ] for x ∈ K^{N+1} and K any number field containing the coordinates; (d) Northcott for ample η: for all B and D, {P ∈ V(K̄) : [K(P) : K] ≤ D, h_{V,η}(P) ≤ B} is finite; (e) ample η: h_{V,η} bounded below. These are Silverman's properties (i)–(iv) (AWS notes, §4.1) and the input (2) of Call–Silverman §1. Needed by: `DY.1/canonical-height`, `DY.1/zero-canonical-height-iff-preperiodic`, `DY.1/northcott-for-preperiodic-points`, `DY.1/canonical-height-for-a-divisorial-eigenclass`, `DY.1/canonical-height-of-projective-space-morphism`.
- **HeightsRationalPointsAndObstructions:RP.0** — For an abelian variety A over a number field K and a symmetric line bundle L ([−1]*L ≅ L): [m]*L ≅ L^{⊗m²} for every integer m, and the Néron–Tate height ĥ_{A,L} : A(K̄) → ℝ with ĥ_{A,L} − h_{A,L} bounded and ĥ_{A,L}(mP) = m²·ĥ_{A,L}(P), compared with Tau Ceti's elliptic canonicalHeight for dim A = 1 and L = O((O)). Needed by: `DY.1/canonical-height-of-multiplication-on-an-abelian-variety`.
- **TropicalAndBerkovichArithmetic:TB.0** — The Berkovich projective line P^{1,an}_K over a complete nonarchimedean field K (in particular K = ℂ_v, the completion of an algebraic closure of a local field, and K = the completion of an algebraic closure of ℂ((T))), as the compact Hausdorff space A^{1,an}_K ∪ {∞}, where A^{1,an}_K is the space of multiplicative seminorms [·]_x on K[T] extending the absolute value of K, with the weakest topology making x ↦ [g]_x continuous for every g ∈ K[T]; the dense embedding ℙ¹(K) ⊂ P^{1,an}_K by evaluation seminorms; the points ζ_{a,r} (sup-norm on the closed disc D(a, r)) and the Gauss point ζ_{0,1} (the Gauss norm); and, for every nonconstant rational map φ ∈ K(T), its analytification φ^{an} : P^{1,an}_K → P^{1,an}_K given by [g]_{φ^{an}(x)} = [g ∘ φ]_x, continuous, extending φ on ℙ¹(K), with (φ ∘ ψ)^{an} = φ^{an} ∘ ψ^{an} and id^{an} = id; in particular PGL₂(K) acts by homeomorphisms and PGL₂(𝒪_K) fixes ζ_{0,1}. Needed by: `DY.2/berkovich-lift-bounds`, `DY.2/berkovich-escape-potential`, `DY.2/canonical-measure`, `DY.2/canonical-measure-of-good-reduction`.
- **TropicalAndBerkovichArithmetic:TB.1** — Potential theory on the Berkovich projective line P^{1,an}_K over a complete algebraically closed nonarchimedean field K (Baker–Rumely, arXiv:math/0407426 §3.5; Favre–Rivera-Letelier, arXiv:math/0407471 §§3–4): (i) the classification of points into types I–IV, with φ^{an} mapping type II points to type II points and PGL₂(K) acting transitively on type II points; (ii) the measure-valued Laplacian Δ on continuous functions of bounded differential variation, with values finite signed Borel measures of total mass 0, linear and zero on constants, normalised by Δ log max([T], 1) = δ_{ζ_{0,1}} − δ_∞ (the sign of DeMarco–Krieger–Ye, the negative of Baker–Rumely's); (iii) a continuous function h with Δh = 0 on all of P^{1,an}_K is constant; (iv) Poincaré–Lelong: Δ log[g] = Σ_{g(a) = 0} δ_a − Σ_{g(b) = ∞} δ_b for g ∈ K(T), with multiplicities; (v) log[g] is subharmonic on A^{1,an}_K for g ∈ K[T], finite maxima of subharmonic functions are subharmonic, and uniform limits of subharmonic functions are subharmonic (so Δ ≥ 0 passes to uniform limits); (vi) for a Borel probability measure ν on a closed disc of A^{1,an}_K with continuous potential u_ν(x) = ∫ log[T − y]_x dν(y): Δu_ν = ν − δ_∞, and a measure with a continuous potential gives no mass to type I points; (vii) for a nonconstant rational map φ: pull-back φ^*ν (through the local degrees of φ^{an}, total mass multiplied by deg φ) and push-forward φ_*ν of Borel measures, with φ_*φ^* = (deg φ)·id and Δ(h ∘ φ^{an}) = φ^*(Δh) for h of bounded differential variation; (viii) for A ∈ GL₂(K) with Möbius map φ_A, the function [x] ↦ log(‖Ax‖/‖x‖) on ℙ¹(K) extends continuously to P^{1,an}_K with Laplacian δ_{φ_A⁻¹(ζ_{0,1})} − δ_{ζ_{0,1}}. Needed by: `DY.2/canonical-measure`, `DY.2/laplacian-of-local-canonical-height`, `DY.2/canonical-measure-is-probability`, `DY.2/canonical-measure-invariance`, `DY.2/good-reduction-of-canonical-measure`, `DY.2/canonical-measure-conjugation`, `DY.2/potential-good-reduction-iff-point-mass`, `DY.2/example-bad-reduction-padic-cantor-map`.
- **ComputationalNumberTheory:CN.0** — For a number field L (and for ℚ): an exact computable presentation of L (elements as coordinate vectors in a fixed ℚ-basis) with decidable equality and computable field operations, together with a proven ring isomorphism to Mathlib's carrier; and a normal form for points of ℙ¹(L) ([x : 1] or [1 : 0]) giving decidable equality on ℙ L (Fin 2 → L) compatible with Projectivization.mk. Needed by: `DY.3/rational-preperiodic-enumeration-over-a-number-field`.
- **EffectiveDiophantineMethods:ED.0** — For a number field L presented as in ComputationalNumberTheory:CN.0 and a real bound B: a certified finite list S of points of ℙ¹(L) with a proof that every [v] ∈ ℙ¹(L) with Mathlib's Height.logHeight v ≤ B lies in S (completeness), i.e. an explicit enumeration of the finite set of NumberField.finite_setOfPred_mulHeight₁_le together with ∞. Needed by: `DY.3/rational-preperiodic-enumeration-over-a-number-field`.
- **EffectiveDiophantineMethods:ED.3** — Mordell–Weil computations for the genus-2 Jacobians used by Flynn–Poonen–Schaefer and Poonen: (a) for C₀(5): y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1, J(ℚ) ≅ ℤ (2-descent; FPS 1995, Theorem 3), with an explicit generator class usable for Chabauty; (b) for C₁(3₂): y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, J(ℚ) ≅ ℤ generated up to index prime to 3 by [∞₊ − ∞₋] (Poonen 1995, Proposition 1, with Poonen's erratum: the local point at 743 is (−2, √33) and the 2-adic information is used). Needed by: `DY.3/flynn-poonen-schaefer-no-rational-five-cycles`, `DY.3/poonen-type-three-two`.
- **EffectiveDiophantineMethods:ED.3** — Complete lists of rational points of the rank-zero curves used by Poonen and Morton: E11: y² + y = x³ − x² has E11(ℚ) = {O, (0, 0), (0, −1), (1, 0), (1, −1)}; E15: y² + xy + y = x³ + x² has {O, (0, 0), (−1, 0), (0, −1)}; E17: y² + xy + y = x³ − x² − x has {O, (0, 0), (1, −1), (0, −1)}; E24: y² = x³ − x² + x has {O, (0, 0), (1, 1), (1, −1)}; E40: y² = x³ − 2x + 1 has {O, (0, ±1), (1, 0)}; Morton's Y² = 4X³ − 11X² + 8X has exactly the points ∞, (0, 0), (1, ±1), (2, ±2); each with a certificate that the Mordell–Weil rank is 0 and the torsion subgroup is as listed. Needed by: `DY.3/poonen-type-one-two`, `DY.3/poonen-type-two-two`, `DY.3/poonen-type-exclusions`, `DY.3/poonen-no-long-tails`, `DY.3/quadratic-rational-cycles-of-length-at-most-three`.
- **EffectiveDiophantineMethods:ED.3** — Complete lists of rational points of three genus-2 curves with rank-zero Jacobians (models of X₁(13), X₁(16), X₁(18)): y² = x⁶ + 2x⁵ + x⁴ + 2x³ + 6x² + 4x + 1 and y² = x⁶ + 2x⁵ + 5x⁴ + 10x³ + 10x² + 4x + 1 each have exactly the six rational points (−1, ±1), (0, ±1) and the two points at infinity; v² = u(u² + 1)(1 + 2u − u²) has exactly (0, 0), (±1, ±2) and the point at infinity. Certificates: J(ℚ) finite (descent) and the torsion computed. Needed by: `DY.3/poonen-period-combinations`, `DY.3/morton-no-rational-four-cycles`.
- **EffectiveDiophantineMethods:ED.3** — For Stoll's genus-4 curve X₀^dyn(6): the Jacobian J, its Mordell–Weil group, and a saturation certificate showing that, if rank J(ℚ) = 3, the subgroup G generated by differences of the ten known rational points has finite index and its saturation at the relevant primes is computed (Stoll 2008, §3). Needed by: `DY.3/stoll-conditional-no-rational-six-cycles`.
- **EffectiveDiophantineMethods:ED.4** — Chabauty–Coleman certificates with every residue disc treated: (a) C₀(5): y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 has exactly the six rational points (0, ±1), (−3, ±1), ∞± (FPS 1995, Theorem 6, p = 3, given J(ℚ) ≅ ℤ); (b) C₁(3₂): y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1 has exactly (−1, ±1), (0, ±1), (1, ±3), ∞± (Poonen 1995, Proposition 2, p = 3, including the variant embedding P ↦ [P + S₊] on the disc of the Weierstrass point (1, 0) mod 3); (c) under rank J(ℚ) = 3, X₀^dyn(6) has exactly its ten known rational points (Stoll 2008, p = 5 with a differential annihilating G). Needed by: `DY.3/flynn-poonen-schaefer-no-rational-five-cycles`, `DY.3/poonen-type-three-two`, `DY.3/stoll-conditional-no-rational-six-cycles`.
- **TropicalAndBerkovichArithmetic:TB.6** — Local potential theory at every place v of a number field, on the analytic line P¹_v^an (the Riemann sphere P¹(ℂ) at an infinite place; the Berkovich projective line over C_v at a finite place), as DeMarco–Krieger–Ye's accepted route assigns it: (1) the measure-valued Laplacian Δ on potentials, normalised by Δ log δ_v(·, y) = δ_y − δ_∞ for y ∈ A¹_v^an (δ_v the Hsia kernel relative to ∞, |x − y| on ℂ), hence Δ log⁺|z|_v = λ_v − δ_∞; Δg = 0 iff g is constant; ∫ f dΔg = ∫ g dΔf for continuous potentials; every signed Radon measure of total mass 0 is Δg with g unique up to constants; (2) for a signed measure ν whose total variation has continuous potential, g_ν(z) = ∫ log δ_v(z, w) dν(w) is defined, Δg_ν = ν − ν(P¹)δ_∞, and g_ν is continuous; measures with continuous potential charge no type I point; (3) the mutual energy (µ, ν)_v := −∫∫_{A¹×A¹ ∖ Diag(C_v)} log δ_v dµ dν for pairs whose total variations have continuous potentials or are finitely supported on type I points, symmetric and bilinear, with (µ, ν)_v = −∫ g_µ dν, ([x], [y])_v = −log|x − y|_v, (λ_v, λ_v)_v = 0, ([x], λ_v)_v = −log⁺|x|_v, (δ_S − δ_{S′}, δ_S − δ_{S′})_v = d_hyp(S, S′) for type II/III points S, S′, and invariance of the energy of mass-zero measures under PGL₂(C_v); (4) positivity: for ν of total mass 0 whose total variation has continuous potential, (ν, ν)_v ≥ 0 with equality iff ν = 0 (Favre–Rivera-Letelier Propositions 2.6 and 4.5); (5) a class D_v of test functions dense in C(P¹_v^an) for the sup norm (smooth functions at infinite places; continuous functions locally constant off a finite subtree and C¹ on its edges at finite places, FRL Definition 5.5) with Dirichlet form ⟨φ, φ⟩_v = (Δφ, Δφ)_v and the Cauchy–Schwarz inequality |∫ φ dν|² ≤ ⟨φ, φ⟩_v (ν, ν)_v for mass-zero ν with continuous potential, and ⟨φ, φ⟩_v ≤ C Lip(φ)² for C¹ functions on P¹(ℂ) (chordal metric). Needed by: `DY.4/adelic-height-decomposition`, `DY.4/adelic-height-is-a-weil-height`, `DY.4/adelic-height-of-a-galois-stable-set`, `DY.4/adelic-measure`, `DY.4/adelic-metric-of-an-adelic-measure`, `DY.4/adelic-metrized-line-bundle-on-p1`, `DY.4/arakelov-zhang-pairing`, `DY.4/arakelov-zhang-pairing-energy-formula`, `DY.4/arakelov-zhang-pairing-nonnegative-and-nondegenerate`, `DY.4/arakelov-zhang-pairing-of-adelic-measures`, `DY.4/curvature-measures-of-an-adelic-metric`, `DY.4/energy-lower-bound-after-regularisation`, `DY.4/equidistribution-for-semipositive-adelic-line-bundles`, `DY.4/limit-of-heights-along-small-sequences`, `DY.4/local-dynamical-energy`, `DY.4/local-equidistribution-criterion`, `DY.4/mahler-formula-for-adelic-heights`, `DY.4/multibrot-adelic-measure`, `DY.4/mutual-energy-metric`, `DY.4/nonnegative-local-energy-at-standard-places`, `DY.4/pairing-with-the-standard-measure`, `DY.4/product-formula-for-the-energy-of-a-finite-set`, `DY.4/quantitative-equidistribution`, `DY.4/regularised-measure-of-a-finite-set`, `DY.4/regularised-pairing-estimate`, `DY.4/regularised-self-energy-bound`, `DY.4/standard-measure-at-a-place`.
- **TropicalAndBerkovichArithmetic:TB.6** — Metrics and Chambert-Loir measures: (6) on P¹ over C_v, continuous metrics on O(1)^an are ‖·‖_st e^{−φ} with φ : P¹_v^an → ℝ continuous (‖s(x)‖_st = |s(x₀, x₁)|/max(|x₀|, |x₁|)); the Chambert-Loir measure c₁(Ō(1)_v) equals λ_v + Δφ, has total mass deg O(1) = 1, and semipositivity (uniform limit of semipositive model metrics) is equivalent on P¹ to positivity of c₁; the model metric of P¹_{O_{C_v}} is ‖·‖_st with c₁ = δ_{ζ_{0,1}}; (7) for a projective variety X of dimension n over C_v and a line bundle L with semipositive continuous metric, the measure c₁(L̄)^n on X^an is positive of total mass deg_L X and continuous in the metric for uniform convergence; model functions are dense in C(X^an) (Gubler) at finite places, and c₁(L̄)^n is the Monge–Ampère measure at infinite places. Needed by: `DY.4/adelic-metrized-line-bundle-on-p1`, `DY.4/curvature-measures-of-an-adelic-metric`, `DY.4/equidistribution-for-semipositive-adelic-line-bundles`.
- **TropicalAndBerkovichArithmetic:TB.1** — The Berkovich projective line over a complete algebraically closed nonarchimedean field C (absolute value extending |p| = 1/p): a compact Hausdorff space with the weak topology generated by S ↦ S(P) for P ∈ C[T]; the points ζ_{a,r} (sup norm on the disc D(a, r)) for a ∈ C, r > 0, with ζ_{a,r}(c Π(T − a_i)) = |c| Π max(|a − a_i|, r); the Gauss point ζ_{0,1}; density of the type I points C ∪ {∞}; the Hsia kernel relative to ∞, δ(S, S′) = diam(S ∨ S′), with δ(a, b) = |a − b| and δ(S, a) = S(T − a) for a ∈ C; the hyperbolic metric on H = P¹_Berk ∖ P¹(C) with d(ζ_{a,r}, ζ_{a,r′}) = |log(r/r′)|; the chordal metric d on P¹_Berk of Favre–Rivera-Letelier §4.7, with d(a, ζ_{a,r}) ≤ r, for which every rational map over C is Lipschitz; and the action of PGL₂(C) by homeomorphisms. Needed by: `DY.4/adelic-metrized-line-bundle-on-p1`, `DY.4/analytic-line-at-a-place`, `DY.4/holder-continuity-of-canonical-potentials`, `DY.4/mahler-formula-for-adelic-heights`, `DY.4/regularisation-modulus-tends-to-zero`, `DY.4/regularised-measure-of-a-finite-set`.
- **TropicalAndBerkovichArithmetic:TB.0** — For a projective variety X over a complete algebraically closed valued field C_v: the analytification X^an (the Berkovich space at a finite place, the complex analytic space at an infinite place) as a compact Hausdorff space with a dense inclusion X(C_v) → X^an, functorial in X, and equal to the analytic line of DY.4/analytic-line-at-a-place for X = P¹. Needed by: `DY.4/equidistribution-for-semipositive-adelic-line-bundles`.
- **SchemeAndStackFoundations:SF.5** — For a projective variety X of dimension n over a field and a line bundle L on X, the degree deg_L X = (c₁(L)^n · [X]) as an intersection number, positive when L is ample, and equal to deg X ⊂ P^N for L = O(1). Needed by: `DY.4/equidistribution-for-semipositive-adelic-line-bundles`.
- **tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions** — Over a field K with separable closure K^s: the equivalence X ↦ X(K^s) between finite étale K-schemes and finite continuous Gal(K^s/K)-sets, functorial in K-morphisms, together with its value on the monogenic case: for a separable g ∈ K[x], Spec K[x]/(g) ↦ the Gal(K^s/K)-set of roots of g in K^s, and for polynomials g, h and p ∈ K[x] with g ∣ h ∘ p, the morphism Spec K[x]/(g) → Spec K[y]/(h) induced by y ↦ p(x) ↦ the map of roots β ↦ p(β). Needed by: `DY.5/preimage-levels-as-finite-etale-galois-sets`.
- **tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-3-the-index-dedekindkummer-and-dedekinds-theorem** — For a monic separable f ∈ ℤ[x] and a rational prime p with p ∤ disc(f): p is unramified in the splitting field of f over ℚ, i.e. Algebra.IsUnramifiedIn (𝓞 L) (Ideal.span {p}) for L = the splitting field (equivalently: p is unramified in every root field ℚ(θ) (layer 3.5–3.6) and unramified in each of two number fields implies unramified in their compositum (layer 1.5)). Needed by: `DY.5/unramified-outside-critical-orbit`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields** — For a finite separable extension F'/F of function fields over an algebraically closed k of characteristic 0 and a place P of F with a local integral generator y whose minimal polynomial φ has 𝒪_P[y] = 𝒪'_P (monogenic case): the places over P, their ramification indices and residue degrees are read off the factorization of φ mod P (Kummer's theorem, Stichtenoth Cor. 3.3.8), and the discriminant ideal of 𝒪'_P over 𝒪_P is generated by disc φ. Needed by: `DY.5/inertia-is-transposition`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula** — Over an algebraically closed k of characteristic 0: (a) Dedekind's different theorem in the tame case, d(P'|P) = e(P'|P) − 1, so the P-adic valuation of the discriminant of F'/F is Σ_{P'|P} (e(P'|P) − 1) f(P'|P); (b) the Hurwitz genus formula 2g' − 2 = [F' : F](2g − 2) + deg Diff(F'/F) for finite separable F'/F with constant field k, in particular for F = k(t) (g = 0). Needed by: `DY.5/inertia-is-transposition`, `DY.5/no-tame-cover-of-the-affine-line`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-** — For a finite Galois extension M/F of function fields over an algebraically closed k of characteristic 0, a place q of M over p, and an intermediate field L = M^H: decomposition and inertia groups with |I(q|p)| = e(q|p); the correspondence between orbits of D(q|p) (resp. I(q|p)) on G/H and places P of L over p, with orbit lengths e(P|p)f(P|p) (resp. e(P|p)) (Juul, Lemma 2.4); and unramified in each of two subfields implies unramified in their compositum (Stichtenoth Cor. 3.9.3). Needed by: `DY.5/inertia-is-transposition`, `DY.5/juul-nonramification-lemma`.
- **InverseGaloisAndArithmeticFundamentalGroups:IG.2** — Hilbert's irreducibility theorem for number fields in the form: for a number field K, independent indeterminates s = (s_0, …, s_{d−1}) and a finite Galois extension M/K(s) split by a monic separable P ∈ K[s][x], there is a thin set E ⊆ K^d such that for a ∈ K^d ∖ E the specialized polynomial P_a is separable and Gal(P_a/K) ≅ Gal(M/K(s)) compatibly with the root actions. Needed by: `DY.5/generic-maximality-outside-thin-set`.
- **TropicalAndBerkovichArithmetic:TB.0** — (1) The Berkovich projective line P^{1,an} over ℂ_v (and over k₀ = ℂ((T))) with the type II/III points ζ_{a,r}, the hyperbolic metric on H = A^{1,an} ∖ ℂ_v, and the interval (hyperbolic-length) measures on segments [ζ₁, ζ₂] ⊂ H; the action of a rational map on type II points (images of discs). (2) The hybrid space X^hyb of the degenerating family 𝔻* × ℙ¹(ℂ) (Boucksom–Jonsson; Favre): the fibres ℙ¹(ℂ) over t ∈ 𝔻* glued to P^{1,an}_{ℂ((T))} over t = 0, with the topology in which the sets {|t|^{a+δ} < |z| < |t|^{a−δ}, 0 < |t| < δ} ∪ A(|T|₀^{a+δ}, |T|₀^{a−δ}) and the disc-like sets are open and which restricts to the Berkovich topology on the central fibre; compactness of the segment [0, ∞] ⊂ P^{1,an}_{ℂ((T))}. Needed by: `DY.6/legendre-canonical-measure-away-from-two`, `DY.6/legendre-measure-degeneration`, `DY.6/legendre-potential-continuity-near-cusp`.
- **SchemeAndStackFoundations:SF.0** — (1) Quasi-projective varieties over a field K: schemes admitting an immersion into ℙ^N_K = Proj K[x₀, …, x_N], their closed subvarieties and K-points, with étale and unramified endomorphisms as Mathlib AlgebraicGeometry.Etale / FormallyUnramified morphisms of finite type. (2) Spreading out: for X, Φ, V, α over ℂ defined over a finitely generated ℤ-algebra R ⊂ ℂ, a model X_R → Spec R such that, over a dense open U ⊆ Spec R, X_U is smooth and quasi-projective, Φ extends to an unramified endomorphism, fibres are geometrically irreducible, and α extends to a section (EGA IV §§8–9, 12; Bell–Ghioca–Tucker Proposition 4.3). (3) Base change of smoothness, unramifiedness and quasi-projectivity along Spec ℤ_p → Spec R. Needed by: `DY.6/dynamical-mordell-lang-conjecture`, `DY.6/etale-dynamical-mordell-lang`, `DY.6/etale-model-over-finitely-generated-ring`.
- **HeightsRationalPointsAndObstructions:RP.0** — For a projective variety X over ℚ̄ with an ample line bundle L, the Weil height h_{X,L} : X(ℚ̄) → ℝ (well defined up to bounded functions), with pullback functoriality h_{Y,φ*M} = h_{X,M} ∘ φ + O(1) for morphisms φ : Y → X, restriction to closed subvarieties, commensurability c₁h_{X,L} − c₂ ≤ h_{X,L′} ≤ c₃h_{X,L} + c₄ of two ample heights, and the comparison h_{X,L}(u) ≤ C₁h_{Y,M}(F(u)) + C₂ on U(ℚ̄) for a quasi-finite morphism F : U → Y from an open U ⊆ X (Ingram, Lemma 15); applied to a projective compactification of the moduli space M_d of DY.0/moduli-space-of-rational-maps, giving the ample moduli height h_{M_d}. Needed by: `DY.6/critical-height-is-a-moduli-height`.

## Structural proposals

Recorded in the packet's `restructure` list. This packet works with the current structure.

### `rescope`: AlgebraicModuliForArithmeticGeometry, ArithmeticDynamics

Geometric invariant theory (reductive group actions on affine and projective schemes over a base, geometric and categorical quotients, the Hilbert–Mumford criterion, Seshadri's extension over ℤ) is needed for the moduli space M_d of rational maps and its critically marked cover (DeMarco–Mavraki–Ye §2.1; Silverman 1998; Levy 2011) and is planned by no roadmap of the atlas (PELModuli M2 explicitly avoids an unbuilt GIT theorem). It is general moduli machinery, not dynamics.

**Proposal.** Add to AlgebraicModuliForArithmeticGeometry a layer 'Geometric invariant theory' (after R09.1 projective parameter spaces) with the quotient theorems and the Hilbert–Mumford criterion; ArithmeticDynamics:DY.0 then consumes it for M_d = Rat_d/SL₂, M_d^cm and M₂ ≅ A²_ℤ, replacing the recorded gap.

### `rescope`: ArithmeticDynamics, HeightsRationalPointsAndObstructions, ArakelovGeometryAndAbelianHeightsPartII

Owner of the global adelic intersection theory: Yuan's theorem (DY.4/equidistribution-for-semipositive-adelic-line-bundles) and HeightsRationalPointsAndObstructions RP.5 (Szpiro–Ullmo–Zhang) both need adelic line bundles on projective varieties over number fields, their arithmetic intersection numbers, Zhang's successive minima and Yuan's arithmetic Siu inequality (gaps G1–G2). No atlas stage owns them.

**Proposal.** Propose that the ArakelovGeometryAndAbelianHeightsPartII roadmap proposed by PAPER-YUAN-26 own them (it already owns the quasi-projective theory, gap G3), with links to ArithmeticDynamics DY.4 and HeightsRationalPointsAndObstructions RP.5.

### `rescope`: ArithmeticDynamics, ArithmeticDynamicsPartIIBifurcation

DeMarco–Mavraki–Ye item 10 in moduli (DY.4/equidistribution-of-pcf-parameters-in-moduli) consumes the critical height (DY.6/critical-height), the bifurcation measure (proposed ArithmeticDynamicsPartIIBifurcation) and Yuan–Zhang theory.

**Proposal.** Propose moving that node to ArithmeticDynamicsPartIIBifurcation (whose brief already imports equidistribution of PCF parameters from DY.4), keeping in DY.4 the unicritical P¹ case DY.4/equidistribution-of-pcf-parameters, which the Part II then consumes; until then the node restates the formula for ĥ_crit to avoid a DY.4 → DY.6 dependency.

### `split`: ArithmeticDynamics

DY.4 has 66 nodes in five coherent groups; as one star the layer is too broad to read in the atlas.

**Proposal.** Sub-layers for the atlas (all nodes have parent DY.4): DY.4a 'Local potential theory and regularisation' (analytic-line-at-a-place … nonnegative-local-energy-at-standard-places, 10 nodes); DY.4b 'Adelic measures, heights and equidistribution on P¹' (adelic-measure … bilu-equidistribution-theorem, generic-sequence, equidistribution-for-semipositive-adelic-line-bundles); DY.4c 'Adelic metrics and the Arakelov–Zhang pairing' (adelic-metrized-line-bundle-on-p1 … pairing-with-the-standard-measure); DY.4d 'Dynamical applications' (canonical-adelic-measure-of-a-rational-map … quantitative-equidistribution-of-preimages, local-dynamical-energy, holder-continuity-of-canonical-potentials); DY.4e 'Postcritically finite parameters' (multibrot-adelic-measure … equidistribution-of-pcf-parameters-in-moduli).

### `rescope`: ArithmeticDynamics, ComputationalNumberTheory, EffectiveDiophantineMethods

The stage edges EffectiveDiophantineMethods:ED.0 → ArithmeticDynamics:DY.5 and (RS-03) ComputationalNumberTheory:CN.0 → ArithmeticDynamics:DY.5 are not consumed by any DY.5 node: every level claimed in the worked example is proved (Stoll's theorem), and the only computations are exact integer arithmetic in ℤ and ℚ available in Mathlib. InverseGaloisAndArithmeticFundamentalGroups:IG.0 is likewise not consumed after RS-29 (the field-case Galois-set interpretation comes from Tau Ceti ModularCurves 0D and the profinite Galois machinery from Mathlib's Krull topology and InfiniteGalois); DY.5 consumes IG.2 (Hilbert irreducibility) instead.

**Proposal.** Drop the edges ED.0 → DY.5, CN.0 → DY.5 and IG.0 → DY.5; add IG.2 → DY.5 (Hilbert irreducibility for the thin-set corollary of Odoni's theorem) and the Tau Ceti links NumberFieldArithmetic layer 3 → DY.5 and AlgebraicCurves layers 6, 7, 8 → DY.5 recorded by this packet's requests.

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDynamics.json --index <pinned declaration index>

Zero errors and zero warnings. The suggested Lean file elaborates against Mathlib `082e2d3` with `lake env lean`;
its only messages are `declaration uses 'sorry'` warnings. Every API item and unit test of the packet occurs in it
under its packet name.
