# REV-PAPER-TSIMERMAN-18 — independent review

**Accept after correction; all eleven routes accepted.** Codex, session `codex-hjdg0j`, 23 September 2026, issue #1142. I did not author the extraction. This verdict certifies paper intake/routing, not closed source decompositions or formalized mathematics.

Input: repository `85e12faced69f184b09205c0a5abed1cabdd7594`, original 101 items and eleven routes. Output preserves all item IDs: **5 library, 30 planned, 66 missing**. Every missing item has one route. The review JSON gives a reason for every route.

## Source evidence and limits

I read all twelve pages of the [published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), SHA-256 `43259ca3cfedfb574bf1fe2f80e1023cb736ea299a76588536fd816340722abc`, as text, and inspected images of pp. 381–388. I compared §§1–6 of [arXiv v5](https://arxiv.org/pdf/1506.01466v5), SHA-256 `ccc5f8beb50e11fc46bdaf1f05ae5718d26280643698585dcca3ddb99dc3ee9c`. Published numbering, the new Lemma 4.1 and the conductor factor differ from that earlier version.

Auxiliary passages personally read in this review:

| Source | Extent |
| --- | --- |
| [PT2014](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf) | pp. 663, 670, complete §7 pp. 673–678, and reference identification on p. 680. |
| [PT2013 arXiv](https://arxiv.org/pdf/1106.4023) | §3 and Lemma 4.1, PDF pp. 3–10. The exact published-edition reconciliation remains open. |
| [Tsimerman2012 v3](https://arxiv.org/pdf/1103.5619v3) | §§7.1–7.2, PDF pp. 17–22; sufficient general-centre-order reduction and compact-index interface. |
| [Gao v6](https://arxiv.org/pdf/1310.1302v6) | §13, PDF pp. 46–50, including conditional mixed AO and its proof. Earlier mixed foundations and full Ax-Lindemann proof not reread. |
| [Yuan–Zhang](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | pp. 534–535, text and images; metric and averaged formula. The [2023 erratum](https://annals.math.princeton.edu/2023/198-2/p08) abstract confirms the auxiliary correction; full proof belongs to its dedicated intake. |
| [Thorner–Zaman](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf) | pp. 1139–1142, with images of pp. 1141–1142; variable-field convention, completion and Lemma 2.3. |
| [Masser–Wüstholz](https://www.numdam.org/item/PMIHES_1995__81__5_0.pdf) | Printed pp. 6–7, 23–24: actual Theorem II is p. 6; field-degree refinement p. 23. |
| [Silverberg–Zarhin](https://webapps.math.uci.edu/~asilverb/bibliography/rigidity.pdf) | Introduction's explicit sufficient homomorphism-descent contract. Original Silverberg1992 Prop.2.3 remains unread. |
| [Pila2011](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p11-p.pdf) | pp. 1792–1793, Definition 3.1 and Theorem 3.2; SHA-256 `cef3f37837e592309f4200b36a998ef2f1bb9c0d7c9267d5879b440effdc3bf4`. |

These reads establish the stated interfaces, not every recursive proof. In particular I do not certify a uniform general-Artin Cauchy contour. The checked alternative uses the entire nontrivial quadratic Hecke function, its two-sided value bound and the normalized averaged theorem.

## Libraries, owners and independent searches

Both pins are unchanged: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I opened every cited declaration, with surrounding assumptions:

| Pinned file / declaration | Actual contract |
| --- | --- |
| Mathlib `NumberTheory/NumberField/CMField.lean`: `NumberField.IsCMField` | Totally complex quadratic extension of maximal real subfield; no Galois-over-Q assumption. |
| Same file: `units_rank_eq_units_rank`, `indexRealUnits_eq_one_or_two`, `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv` | Equal unit ranks and regulator ratio `2^rank / unitIndex`, index 1 or 2. |
| Mathlib `NumberTheory/NumberField/Discriminant/Different.lean`: `NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow` | Exact tower formula with fraction-ring, Dedekind, finite-module and scalar-tower hypotheses. Rings of integers give the needed degree-two specialization. |
| Tau Ceti `NumberTheory/EffectiveBounds/IdealCount/Basic.lean`: `NumberField.card_ideal_absNorm_le` | Finite nonzero ideals with norm at most X, bound `X^2*2^[K:Q]` for X>=1. |
| Mathlib `NumberTheory/NumberField/DedekindZeta.lean`: `dedekindZeta`, `dedekindZeta_residue`, `dedekindZeta_residue_pos`, `tendsto_sub_one_mul_dedekindZeta_nhdsGT` | L-series definition and explicit positive right-real residue. No complex continuation/functional equation follows from that file. |

I read the 17 relevant accepted audit records (analytic, heights, CM, abelian, PEL and rational-height suppliers). LD's AUDIT-34 is pending and is not evidence for an absence. Direct searches ran over both complete pinned source trees; the following search groups cover every missing item in the ledger, with overlaps where a theorem combines inputs:

| Search group | Items checked and closest existing results |
| --- | --- |
| CM types, CM abelian classification, ideal action, reflex norms/class maps, class-norm index, positive units | 4, 11, 16–18, 20, 22–24, 34–45. CM field/unit/regulator results exist; no general CM abelian/reflex or quantitative moduli-degree theorem found. Generic class groups and norms do not prove these adapters. |
| Faltings/Colmez/Bost/Masser/Wüstholz/Silverberg, arithmetic Hom, level descent | 10, 21–24, 30–35, 68–69, 96–98, 101. No pinned Faltings height or quantitative isogeny theorem found; unrelated polarization identities were discarded. |
| Brauer–Siegel, Hecke/Artin L, conductors, residue bounds, convexity, Cauchy derivatives | 12, 19, 25–30, 86–95, 99–101. Generic complex-analysis and zeta results are ingredients, not the variable-field Hecke estimates. |
| Ideal counting, Euler coefficient majorants, divisor functions | 19, 99–100. Opened Tau Ceti `ArithmeticDirichletSeries/Estimates.lean`: `IdealCountingLinearBounds` has constants depending on fixed K. It does not replace bounded-degree uniform counting. The separate quadratic bound is retained as a library item. |
| CM lattices, trace discriminant/order index, reduction of period matrices | 36, 44–45, 50–51, 69–73. Generic lattice/determinant facts do not construct the CM order, polarization, symplectic basis or uniform height adapter. |
| Siegel/Shimura, o-minimal/Pila/Ax-Lindemann, special/weakly-special families, normalizers, Galois transport | 46, 48, 50–51, 56, 58, 61–65, 74–84. No relevant pinned theorem found; Lie-algebra normalizer/centre hits are not reductive algebraic-group normalizer theorems. |

The atlas/proposed-roadmap index contains 218 roadmap documents and 2007 stages. I searched their titles and full descriptions for these groups, read all cited supplier descriptions, full CM.0–CM.6 and R28 owner documents, relevant AN/R28 accepted partial decompositions, and the CFT11/13 additions. EffectiveBounds and ModularCurves upstream documents had also been read fully in this session. Every `planned` reference was checked for actual scope. The relevant suppliers are A3/A6, R35.1/.2/.3/.5/.6, CM.0/.2, RP.0, AN.0/.4/.5, AL.1, LD.6, M3/M6, D5, V0/V1 and upstream GNF9/10, CFT11/13. Broader V and ShimuraData stages, the compactification boundary stage C1, class-field norm/class-field stages and reductive-group candidates were checked for competing ownership.

The Part II IDs occur only as shared pending paper proposals, not as existing roadmaps or reservations. `PAPER-YUAN-ZHANG-18` and `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18` explicitly augment the same CM Part II. The brief now preserves that single design. R28's reviewed nodes concern qualitative finiteness/height change; none supplies the new minimum-degree bound.

## Item ledger

Numbers are the unchanged 1-based order in the extraction. Library/planned verdicts check the existing supplier; missing means searched and routed, not proved here. Source locators are the corrected locators in the JSON.

| # | Item suffix | Status | Review finding |
| --- | --- | --- | --- |
| 1 | `cm-field` | library | Pinned CM carrier; no Galois hypothesis. |
| 2 | `cm-type` | planned | CM.0 type and tangent representation. |
| 3 | `primitive-type` | planned | CM.0 proper-subfield induction criterion. |
| 4 | `cm-isomorphism-classes` | missing | Unpolarized equivariant class set; not principal-polarization classes. |
| 5 | `field-of-moduli` | planned | M6 coarse residue field versus actual model. |
| 6 | `hodge-line` | planned | R35.2 determinant/metric; corrected p. 381. |
| 7 | `stable-faltings-height` | planned | R35.3 normalized stable height; corrected p. 381. |
| 8 | `height-section-independence` | planned | Product-formula section independence; p. 381. |
| 9 | `height-field-independence` | planned | Semistable extension independence; p. 381. |
| 10 | `bost-lower-bound` | missing | Bost real lower constant, not nonnegativity. |
| 11 | `cm-class-number` | missing | Class number counts equivariant maximal-order classes. |
| 12 | `brauer-siegel` | missing | Bounded-degree Brauer-Siegel; ineffective constants allowed. |
| 13 | `relative-discriminant` | library | Pinned different/discriminant tower, rings-of-integers specialization. |
| 14 | `cm-regulator-comparison` | library | Pinned unit index 1 or 2; regulator equality is not asserted. |
| 15 | `relative-class-number-growth` | missing | Relative class-number growth uses existing regulator and discriminant inputs. |
| 16 | `primitive-endomorphisms` | missing | Primitive maximal CM gives the full endomorphism order. |
| 17 | `ideal-isogeny` | missing | Nonzero ideal kernel and quotient; no zero ideal. |
| 18 | `ideal-isogeny-degree` | missing | Norm is actual isogeny degree through classification. |
| 19 | `small-ideal-count` | missing | Uniform near-linear count; quadratic/fixed-field library results insufficient. |
| 20 | `distant-isogenies` | missing | For every starting A, a distant B; correct source-use quantifier. |
| 21 | `quantitative-isogeny` | missing | MW geometric bound; corrected primary pages 6 and 23. |
| 22 | `cm-height-invariance` | missing | Colmez constancy within the specified CM type; source theorem imported. |
| 23 | `colmez-character-data` | missing | Coefficient/conductor conventions; individual conjecture not assumed. |
| 24 | `averaged-colmez` | missing | Averaged theorem imported through dedicated jobs, with 1/2 conductor term. |
| 25 | `colmez-finite-uniformity` | missing | Finite bounded-degree group/type combinatorics; not a new analytic theorem. |
| 26 | `conductor-discriminant-control` | missing | Sufficient conductor bound retained as unverified general-Artin obligation. |
| 27 | `artin-functional-equation` | planned | Completed Artin relation uses conjugate representation and gamma terms. |
| 28 | `artin-values` | missing | Both upper and reciprocal bounds required; general-Artin proof remains prerequisite. |
| 29 | `artin-derivatives` | missing | No unproved Artin-holomorphy contour; quadratic alternative is separate. |
| 30 | `cm-height-subpolynomial` | missing | Height bound follows from the explicit quadratic chain and Bost. |
| 31 | `level-three-descent` | missing | Full level three rigidifies; level two would not. |
| 32 | `endomorphism-definition` | missing | Silverberg contract includes torsion of both varieties. |
| 33 | `bounded-field-definition` | missing | Degree bound 2*3^(4g^2); actual model precedes application. |
| 34 | `cm-common-definition-field` | missing | Added compatible quotient polarization and its moduli-field inclusion. |
| 35 | `primitive-orbit-bound` | missing | Every primitive maximal-CM polarized A; positive dimension-only exponent. |
| 36 | `centre-order` | missing | Integral centre order, including product and nonmaximal cases. |
| 37 | `reflex-type` | planned | Normal-closure stabilizer and reflex type in CM.0. |
| 38 | `reflex-norm` | planned | Element and ideal reflex maps; correct domain K*. |
| 39 | `reflex-class-map` | planned | Class map and normal-closure norm composite have distinct domains. |
| 40 | `norm-image-index` | missing | Class-norm cokernel bound; CM application of class-field theory. |
| 41 | `polarized-reciprocity-kernel` | missing | Corrected r(I)=(a) to t(I)=(a); representative independence. |
| 42 | `unit-quotient` | missing | Positive-unit quotient bound; no equality of all unit groups. |
| 43 | `cm-reciprocity-moduli-degree` | missing | Sufficient moduli-degree inequality; exact base-field equality not certified. |
| 44 | `general-cm-orbit-reduction` | missing | Tsimerman2012 requires all simple dimensions h<=g. |
| 45 | `all-cm-orbit-bound` | missing | Orbit bound for arbitrary centre orders, not just maximal simple CM. |
| 46 | `siegel-uniformization` | planned | Moved to planned D5/V0/V1/M3 and PEL source route. |
| 47 | `special-weakly-special` | planned | Special versus weakly special; corrected §2 locator. |
| 48 | `reduction-to-number-field` | missing | CM-density reduction and number-field model for V. |
| 49 | `algebraic-point-height` | planned | Coordinatewise degree and maximum absolute height, checked in Pila2011. |
| 50 | `cm-lift-degree` | missing | Only a dimension-dependent coordinate bound; no unchecked exact 2g. |
| 51 | `cm-lift-height` | missing | PT2013 all-dimensional centre-order height theorem. |
| 52 | `o-minimal-real-field` | planned | R_an,exp o-minimality in LD.6; corrected p. 388. |
| 53 | `uniformization-definability` | planned | Restricted fundamental-set uniformization definability; corrected p. 388. |
| 54 | `algebraic-part` | planned | Algebraic part need not be definable; corrected p. 388. |
| 55 | `pila-wilkie` | planned | Bounded-degree theorem verified directly in Pila2011 p. 1793. |
| 56 | `orbit-to-many-lifts` | missing | Galois orbit over V's field; bounded lift degree/height and multiplicity. |
| 57 | `northcott-finiteness` | planned | RP.0 bounded-degree Northcott; fixed-field version alone insufficient. |
| 58 | `semialgebraic-to-complex-algebraic` | missing | Replaced nonexistent lemma locator by PT2014 p. 670 and PT2013 Lemma4.1. |
| 59 | `hyperbolic-ax-lindemann` | planned | Ax-Lindemann gives weakly special, with semialgebraic formulation. |
| 60 | `cm-promotes-special` | planned | CM point supplies promotion to special. |
| 61 | `finitely-many-exceptional-cm` | missing | Added explicit Galois-transport dependency. |
| 62 | `finite-weakly-special-families` | missing | Finite-family reduction uses full PT2014 §7, not Lemma7.2 alone. |
| 63 | `family-induction` | missing | Both proper-normalizer and normal-factor induction branches. |
| 64 | `andre-oort-ag` | planned | André-Oort endpoint retains finitely many maximal special subvarieties. |
| 65 | `mixed-application-interface` | missing | Restricted mixed application uses pure orbit theorem, not pure AO alone. |
| 66 | `small-ideal-count-quadratic-library` | library | Pinned finite quadratic ideal bound only. |
| 67 | `dedekind-class-number-residue-library` | library | Pinned positive right-real class-number residue only. |
| 68 | `dual-three-torsion-pairing` | planned | Perfect Weil pairing plus mu_3 and rational A[3] gives dual torsion. |
| 69 | `cm-isotypic-decomposition` | missing | End^0 blocks use multiplicities; fields may repeat across inequivalent types. |
| 70 | `cm-centre-order-discriminant` | missing | Product order discriminant has squared lattice index. |
| 71 | `cm-compact-index-comparison` | missing | Compact-index comparison is an inequality; keep local p=2 proof obligations. |
| 72 | `cm-lattice-bounded-basis` | missing | CM lattice basis needs order index and correct square-root covolume. |
| 73 | `cm-siegel-reduction-height` | missing | Quantitative Siegel/Minkowski reduction; no mere compactness shortcut. |
| 74 | `normalizer-reductive` | missing | PT2014 Lemma7.2 uses connected rational F without compact Q-factors. |
| 75 | `normalizer-special-envelopes` | missing | Lemma7.3 finite normalizer envelopes with Deligne-torus condition. |
| 76 | `weakly-special-countable-union` | planned | Lemma7.5 countable union of closed algebraic subsets. |
| 77 | `weakly-special-union-definable` | planned | Lemma7.6 definability from finite real embedding families, not arbitrary unions. |
| 78 | `definable-countable-algebraic-union-finite` | planned | Lemma7.7 finite subunion requires complex algebraic closed pieces. |
| 79 | `normal-factor-parameter-locus` | missing | Whole-fibre containment; finite product cover and smaller parameter dimension. |
| 80 | `maximal-fibre-isolated-parameter` | missing | Maximal fibres correspond to isolated special parameters after induction. |
| 81 | `special-galois-transport` | missing | Transport special conjugate back inside V over its field of definition. |
| 82 | `mixed-special-point-order` | missing | Fixed datum/lattice/level denominator, not a universal coordinate-free order. |
| 83 | `mixed-galois-orbit-factor` | missing | Gao13.3 relative orbit inequality, constants depend on fixed datum. |
| 84 | `mixed-conditional-andre-oort` | missing | Gao13.6 conditional input is the pure orbit bound. |
| 85 | `cm-quadratic-hecke-character` | planned | Added actual reciprocity supplier CFT11 to GNF character carriers. |
| 86 | `cm-hecke-conductor` | planned | Reclassified planned CFT13 conductor-discriminant; removed from AN new work. |
| 87 | `cm-hecke-zeta-factorization` | missing | Quadratic Euler factorization, including ramified primes. |
| 88 | `cm-hecke-entire` | planned | Nontrivial primitive Hecke function entire, supplied by AL.1. |
| 89 | `cm-hecke-completed-functional-equation` | planned | Odd real gamma factors and quadratic self-conjugacy. |
| 90 | `bounded-degree-residue-bounds` | missing | Bounded-degree residues via Brauer-Siegel, no normality assumption. |
| 91 | `cm-hecke-value-one` | missing | Positive residue quotient gives two-sided value bound. |
| 92 | `primitive-hecke-convexity` | missing | TZ Lemma2.3 uniform in K; trivial-character pole factor retained. |
| 93 | `cm-hecke-cauchy-derivative` | missing | Cauchy on L itself; a zero inside the circle does not obstruct it. |
| 94 | `cm-hecke-log-derivative-one` | missing | Divide by a two-sided value bound and allocate exponents. |
| 95 | `cm-hecke-log-functional-equation` | missing | Log FE gamma signs verified against the completion. |
| 96 | `cm-height-metric-normalization` | missing | Squared-metric scaling sign checked from both printed definitions. |
| 97 | `quadratic-hecke-averaged-colmez` | missing | All 2^g types; exact quadratic averaged formula from YZ p. 535. |
| 98 | `cm-height-average-to-individual` | missing | Bost average-to-individual inequality includes possibly negative lower bound. |
| 99 | `ideal-coefficient-divisor-majorant` | missing | Coefficientwise local Euler majorant by fixed-order divisor function. |
| 100 | `fixed-divisor-subpolynomial` | missing | Large/small-prime split gives a uniform subpolynomial divisor bound. |
| 101 | `primitive-orbit-exponent-budget` | missing | Positive exponent delta<1/(4*kappa_g) with errors allocated first. |

## Source findings and concrete corrections

The input had no `sourceIssues` key, but its separate errata file already contains E1–E5. I rechecked them: reflex-field ideal norm and `t` versus `r` typing (E1); the arbitrary-starting-A quantifier supplied by the counting proof (E2); the pinned regulator ratio and sextic counterexample (E3); distinct embedded fields of moduli in the discriminant -23 elliptic class set (E4); and the four arXiv v5 slips corrected in publication (E5). For E4, the [official Sage class-polynomial example](https://doc.sagemath.org/html/en/reference/arithmetic_curves/sage/schemes/elliptic_curves/cm.html#sage.schemes.elliptic_curves.cm.hilbert_class_polynomial) matches the recorded polynomial. Exact SymPy checks give irreducible reduction `X^3+X+1` modulo 2, discriminant `-5^18*7^12*11^4*17^2*19^2*23` and one real root. Thus the real and nonreal roots cannot generate the same embedded cubic field. The published descent argument does not require equality of those fields.

Those five entries retain their existing independently reviewed register location. Copying them would duplicate them: `scripts/errata.py` appends extraction and errata entries without deduplicating IDs. A `sourceIssueReferences` record links them. E6–E8 are newly added with this review's verdict: correct the bound variable in the lift-set definition, distinguish weakly special from special using the CM point, and retain special points when excluding positive-dimensional special parameter loci. The published images and the actual arXiv differences were checked. The journal page, latest-version record and author publication listing were checked for corrections, together with title/correction searches; no applicable separate correction was found. The historical arXiv notice withdrawing v2's general-Shimura claim is a distinct issue.

Every in-place mathematical/ownership edit is listed in §11 of the paper report and in the item ledger. In addition, 69 API topic strings became 69 proposed named statements with valid roles and use records, retaining all 69 test proposals. General Artin obligations remain explicitly open. G1 and G6 are resolved by this review, whereas G2–G4 remain precisely bounded prerequisite/source-edition work. The malformed rendered height derivation was replaced with valid mathematics and the metric/functional-equation algebra checked symbolically.

## Validation and handoff

Ran `python3 scripts/check_paper.py research/blueprint/papers/PAPER-TSIMERMAN-18.result.json` and the intake file checker on the four deliverables plus this job's handoff. Checked all 101 IDs against the original, every planned stage against the atlas, dependencies for dangling IDs/cycles, each missing item for exactly one route, all eleven review route indices, 23 structured definition/construction APIs and 69 retained acceptance tests. Archive comparison limits changes to those five permitted files. These structural checks and the exact polynomial/height calculations are not Lean proofs. No Lean file was required or compiled.

Downstream design must acquire/decompose the named original sources and preserve their version and normalization limits. This accepted paper route is not a claim that the resulting blueprints are closed.
