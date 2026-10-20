# Independent review: algebraic cycles, pure and mixed motives

Job `REV-PKG-MotivesAndAlgebraicCycles~codex2`, issue #11383. Codex, session `codex-icAQ38`, 2026-10-20. Reviewed base commit: `776ee28941e8a22d4a18f01095eb4f18cf0a541e`. This reviewer did not author the package or its intervening fix. The issue's reference to a report ending in `~codex.md` does not resolve; the actual earlier independent report is `REV-PKG-MotivesAndAlgebraicCycles~adv.md` (#11276). I read that report and `handoff/FIX-PKG-MotivesAndAlgebraicCycles~adv.md` (#11301), and checked their mathematical claims independently.

## Verdict and handoff

**`needs_changes`.** The earlier real-torsion and primitive-height findings are closed by the revised statements, for the reasons below. The fixes made in this review repair the remaining period-integration dependency, a library module path and incorrect source locators. One substantial prerequisite gap remains:

**R3 — downstream MotivicEtaleKTheory is still used as a foundational supplier.** The scope paragraph, “Effective motivic complexes and K-theory” supplier contract, §4.1 and Layer 4's dependency paragraph import all of the following from MotivicEtaleKTheory:

- Higher Chow cycle complexes, localization and homotopy invariance.
- Finite correspondences `SmCor`, presheaves and Nisnevich sheaves with transfers.
- Their derived category, effective `𝔸¹` localization, Suslin complex and smooth-scheme motives.
- Effective Tate objects, the homotopy-invariant-cohomology criterion and perfect-field cancellation.
- Exact cdh pullback and the complex-level Nisnevich/cdh Brown–Gersten adapter.

The maintainer explicitly orders MotivicEtaleKTheory after this roadmap. Its independent cycle/transfer part being mathematically separable does not authorize a reverse roadmap dependency. Mathlib's `DerivedCategory` supplies a generic categorical construction; it supplies neither sheaves with transfers nor their motivic localization. Section 4.1 begins *inside* the supplied effective category and never constructs these missing carriers. Sections 4.4–4.7 construct relative-cycle and compact-support adapters on top of them. Consequently replacing the supplier's name, or calling the contract an assumption, would leave a genuine gap in the build.

To close R3, place the required foundational targets before their first use here, or identify a permitted earlier owner that actually supplies them. Each definition needs its construction, functorial API and three discriminating Checks; cancellation and descent need their exact field/coefficient hypotheses and proof prerequisites. Useful starting points are MVW Lectures 1–3, 9, 12–14 and 17–19, and Voevodsky's cancellation paper. Preserve arbitrary-field constructions and distinguish the results requiring perfectness or resolution. Higher-Chow localization must retain the scheme hypotheses of its proof; changing to complex coefficients or assuming resolution throughout is not a repair. Export the resulting foundational theory to MotivicEtaleKTheory and record the ownership move for its worker. No files of that downstream job are authorized here.

I could repair the period adapter directly, but have not completed and independently verified the additional foundational target plan needed for R3. That requires substantially more than a boundary edit. The package must therefore not be marked ready for an upstream draft. This is a completed independent review with a concrete unresolved finding, not a checkpoint of an unfinished review. This report is the durable handoff because the issue authorizes no separate handoff file.

## Earlier findings

### R1: real torsion descent — closed

The original requested combination of an empty real locus, vanishing higher coherent cohomology, and failure of invariant torsion descent is impossible. I checked the replacement argument rather than asking for another surface with the same incompatible properties.

For a geometrically integral smooth projective variety over a real closed field, the square of a conjugate-linear lift on an invariant line bundle is a nonzero real scalar. Norm rescaling reduces its obstruction to either sign. The negative sign would give a quaternionic operator on every coherent cohomology group. Taking determinants forces each complex dimension to be even. A torsion line bundle has the same Euler characteristic as the structure sheaf by rational Riemann–Roch. Thus odd Euler characteristic excludes the negative obstruction. Hilbert 90 gives injectivity of restriction on Picard groups, so the descended class has its original torsion order. This applies to every torsion order, not just two-primary torsion, and vanishing higher coherent cohomology gives Euler characteristic one.

The displayed intersection of two diagonal quadrics in projective three-space is instead a valid empty-real genus-one curve `B`: the first equation excludes real points; distinct diagonal coefficients give the Jacobian criterion over the algebraic closure; the Koszul resolution gives connectedness; adjunction gives genus one. Its product with a projective line has `h¹=1`, `h²=0`, Euler characteristic zero. Benoist–Wittenberg I, Lemma 3.7, p.50, provides the non-descending invariant two-torsion class. Pullback to the product preserves its obstruction because the projection to `B` has a section defined over the real closed field. Corollary 3.17(ii), p.56, with the surface criterion gives the asserted obstruction and `ind₁=2`. Example 4.2, p.58, also fixes the odd-genus control. These statements were read in the [primary paper](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf).

Independently, the weight-four coefficient action in the rejected Campedelli construction squares to minus the identity. An invariant line would imply `-1=a ā`, impossible over a real closed field. The README correctly retains that obstruction and does not turn it into nonexistence of every real Campedelli surface. The generic quaternionic predicate already in Tau Ceti is used; only this specific coefficient action is kept here.

### R2: primitive heights — closed with the stated construction premises

The revised §7.17 specifies an actual model construction domain using lifts orthogonal to vertical complementary classes. It explicitly assumes the higher arithmetic intersection pairing on the model; the line-bundle arithmetic-degree API is not credited with supplying higher codimension. Independence on the orthogonal-lift domain, the hypotheses needed to extend to all homologically trivial rational cycles, and the abelian-variety existence theorem are distinguished. I read Künnemann 2001, Assumptions 1.2–1.3, equation (7), Lemma 1.5, Theorem 1.6 and Corollary 1.7, pp.505–507, in the [primary PDF](https://www.numdam.org/article/ASENS_2001_4_34_4_503_0.pdf).

Künnemann 1996, §5, equations (15)–(17), Conjecture 5.2 and Theorem 6.1, pp.786–788, were checked through the [indexed primary text](https://citeseerx.ist.psu.edu/document?doi=24752c170be79846ab861e9c80a8977cac60035f&repid=rep1&type=pdf). Direct PDF retrieval failed, so I do not claim a downloaded-file receipt or a full proof reading for that article. Its displayed formulation supports the rational primitive kernel and parity convention; the accessible 2001 paper independently checks the construction premises and field descent. I do not claim to have read the original Beilinson chapter.

The exponent is `m=d+1-2p`; primitivity is the kernel of `L^(m+1)`, whereas the pairing uses `L^m`. At `d=3,p=2` this is `ker L`; at `d=2,p=1` it is `ker L²` paired with `Lx`. The sign is `(-1)^p`. Raw heights multiply by extension degree and division by the number-field degree gives the absolute convention. On curves the displayed comparison is with the negative canonical Jacobian/dual Néron–Tate pairing, with no extra implicit polarization factor.

The irrational-kernel example in §7.17 correctly prevents strict positivity on rational vectors from implying strict positivity after real or complex extension. Li–Liu's stronger local-cycle-class domain, initial `ℂ⊗ℚ ℚ_ℓ` values, archimedean factor two and positive level-volume normalization remain distinct. Their weak predicted inequality is not substituted for rational strict positivity. No unconditional pairing or positivity theorem on all cycles is claimed.

## Corrections made in place

| Location | Change and reason |
| --- | --- |
| Scope, §6.7 and Layer 6 dependencies | Removed the residual import of analytic integration and the Tate period from downstream PeriodsAndSpecialValues. DifferentialGeometry Layers 5–8 supplies integration and Stokes; the existing algebraic/analytic relative comparison contract supplies the algebraic input. The local target now constructs marked evaluation and computes the positively oriented loop using `z=exp(2πit)`, giving pullback `2πi dt`. PeriodsAndSpecialValues consumes the evaluated algebra. |
| Scope | Corrected the generic quaternionic module to `RepresentationTheory/QuaternionicStructure`, after reading the current library file. |
| §§0.1–0.2 | Corrected the kinds of Stacks statements: 3.2 is an Example and 3.5 a Remark, rather than Lemmas. Tags and the supported mathematical targets are retained. |
| §5.4 | Replaced the nonexistent pair of Harrer Theorems 4.3.1–4.3.2, pp.132–139. Classical Basic Lemma is Theorem 4.3.1, p.130; the sheaf version is Theorem 4.3.8, p.132; equivariant use is Theorem 4.4.5, pp.136–137. Added Huber–Müller-Stach Theorem 2.5.7 beside 2.5.2. |

No target, hypothesis, worked example or Check was removed. Suggested.lean and metadata.toml need no edits. No packet, other roadmap, atlas data or source document was changed.

## Form, input preservation and existing work

Read WORKERS, PROTOCOL, the expansion protocol, UPSTREAM_GUIDE and PACKAGE_REVIEW. Compared the package with the ClassFieldTheory and EllipticCurves upstream roadmaps. The README is organized around mathematical objects and proof routes, with Summary, boundaries, conventions, exact contracts, ordered layers, APIs, Checks and references. It contains no new source excerpts or section-by-section source digest. Its approximately 217 KB size is permitted by PACKAGE_REVIEW's later “Shape of a roadmap” rule, which expressly overrides older size limits; I did not delete content to meet the issue's obsolete 200 KB limit.

Recomputed the input inventory: 182 base nodes; MC.0 adds 15; MC.2 adds 11; MC.4 adds 17; MC.5 adds 28; MC.6 adds 12 and replaces 19 existing entries; MC.7 adds 50. There are **315 unique effective nodes**. Against the author's crosswalk, 313 are retained in the README and two are removed in favor of existing library results, with no missing or extra identifiers. The separate Part II's 79 nodes are outside this review. Preservation of the input does not close R3, which is an ordering defect in the input's inherited supplier split.

Current-roadmap comparison used commit `0d144d044dacebca17b654695b6f1ad58f159b27`; current-library comparison used `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These differ from the older elaboration pins. Read the library-coverage audit and the related audited intersection, Hodge, realization, transfer and reconstruction entries. Searched by objects and defining operations, then read the relevant matches, rather than treating absence of a declaration name as absence of its mathematics.

| Compared object | Result |
| --- | --- |
| Finite biproduct duality | `CategoryTheory/Monoidal/Rigid/Biproduct`, including `TauCeti.ExactPairing.biproduct`, supplies it. The existing removal of MC.1 `dual-of-biproduct` is correct. Summand duality and the correspondence-specific evaluation remain separate. |
| Finite-comodule abelianness | `Algebra/Coalgebra/Comodule/Finite/Abelian` supplies the stronger Noetherian-base, flat-coalgebra theorem and the exact forgetful functor. The existing removal of MC.5 `finite-comodules-abelian` is correct. |
| Known affine group reconstruction | Representation/comodule equivalence and the Tannaka modules start from a given group or Hopf algebra. They do not construct the coefficient Hopf algebra from an arbitrary fiber category. |
| Hodge linear algebra | Current Hodge structure, morphism and Tate modules and Completed/HodgeStructures supply the carriers and rational-substructure infrastructure. The inverse image of a particular piece under an explicit comparison is a distinct specialization. |
| Quaternionic structures | The generic conjugate-linear predicate, bijectivity and fixed-vector theorem already exist. The four-coefficient action and its invariant-line obstruction are genuinely additional. |
| Derived categories, Karoubi and triangulated K₀ | Generic carriers are imported. Effective motivic localization is additional mathematics, which is exactly why the generic derived category cannot repair R3. The compact-support measure uses the existing K₀ relations. |
| DifferentialGeometry | Layers 5–8 already plan analytic de Rham, integration and Stokes. Used for the period correction; not replanned. Algebraic comparison and cycle compatibility remain different targets/contracts. |
| AlgebraicVectorBundles and RealAlgebraicGeometry | Vector-bundle/projectivization foundations are existing work; ordinary Chow is assigned to its existing intersection owner. Semialgebraic syntax/projection does not provide equivariant cohomology or its duality. |

Screened the other post-snapshot directions IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions and ProfiniteArithmetic, and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts for overlapping objects and operators. No further target removal was justified. This review adds no removal to the two already recorded above. No Lake command was run in either current read-only checkout.

MotivesAndAlgebraicCycles is outside the 94-roadmap Caraiani–Newton order. That order cannot by itself certify a global tier for all its suppliers. I checked the listed geometric and categorical boundaries against the concrete earlier plans and the maintainer's explicit directions. HodgeStructuresPartII is not used as a supplier. PeriodsAndSpecialValues is now entirely downstream. MotivicEtaleKTheory remains the explicit counterexample, R3; I do not repeat the previous report's blanket assertion that all supplier directions pass. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` pseudo-supplier remains.

## Source checks

The independent sample is `random.Random(11383).sample` on the 77 numbered subsection headings in README order. All 15 sampled groups below were opened afresh. Printed pagination is used; version-specific PDF pagination is identified where needed. Source statements were checked against the actual hypotheses, not merely located by a search hit.

| Sample | Primary locator read and result |
| --- | --- |
| §4.1 | [MVW](https://www.claymath.org/library/monographs/cmim02.pdf), Definitions 14.1–14.2, pp.109–110; Corollary 15.8, p.122; Theorem 16.25 and Remark 16.26, p.131. Thick geometric construction and the cyclic Tate/cancellation distinctions are represented correctly; availability of the effective input fails R3. |
| §7.4 | [Kleiman](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), Proposition 4.3, p.16. Read the scanned page. Known B/C cases retain the cohomology and characteristic conditions. |
| §7.8 | [Benoist–Wittenberg I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Propositions 2.8–2.10, pp.39–40; Proposition 2.13, Lemma 2.14 and Proposition 2.15, pp.41–44. Divisor, zero-cycle and projective/blow-up claims match their distinct scopes. |
| §4.6 | [Friedlander–Voevodsky](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf), Theorem 7.1, p.37; Theorem 7.4, p.41; Theorems 8.2–8.3, pp.43–45. Arbitrary-field projective comparison is distinguished from the resolution-dependent extension; Gysin shifts agree. |
| §0.6 | [Benoist–Wittenberg I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Propositions 5.1–5.2 and proofs, pp.62–67. Rational support and regular-base generic-fiber assumptions were retained. |
| §0.8 | [Karpenko](https://sites.ualberta.ca/~karpenko/publ/agiqf.pdf), pp.126,128,132, including Theorems 3.8 and 5.3; read page images because the text extraction loses formulas. Compared BW I, Remark 3.13, p.52. The torsion middle-cycle example is not an integral injectivity theorem. |
| §7.11 | [Benoist–Wittenberg I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Example 4.2, p.58, plus Lemma 3.7 and Corollary 3.17(ii), pp.50,56. The genus-one product is valid; the impossibility of the original Euler-characteristic-one target is independently justified above. |
| §7.13 | [BW I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Proposition 5.7, p.70, Lemmas 5.8–5.9 and Remark 5.10, pp.71–72; [BW II](https://www.math.ens.psl.eu/~benoist/articles/hodgereel2.pdf), Theorem 7.1 and Corollary 7.2, pp.389–390. Smooth/empty-real and stronger Chow-calculation hypotheses remain explicit. |
| §6.6 | [Huber–Müller-Stach 2014](https://arxiv.org/pdf/1105.0865v5), Definitions 2.1,2.4, p.9; Theorem 2.6 and Remark 2.7, p.10. The integral presentation requires the torsion-free quotient; the rational comparison is correctly stronger. |
| §7.7 | [BW I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Theorem 1.18 and Definition 1.19, p.31, equation (1.58), p.32. Even-square admissibility and the restriction to real-locus data were checked. |
| §0.1 | [Stacks Weil Cohomology](https://stacks.math.columbia.edu/download/weil.pdf), §3, Tags 0FG0–0FG3, pp.3–5. Composition formula agrees; fixed Example/Lemma designations. |
| §7.19 | [Li–Liu](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Assumption 1.3 and Theorems 1.5,1.7, pp.4–7; Hypotheses 4.5,6.6, pp.24,30; Remark 1.10, p.8. The scanned/displayed cardinality is intersection with split places and **at least two**; unreliable extracted symbols were checked against the page image. |
| §7.3 | [Kleiman](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), Theorem 4.1, pp.14–15; Proposition 5.1 and Corollary 5.3, pp.17–18, read as images. Rational algebraic classes, inverse Lefschetz correspondence degree and Hodge-standard sign agree. |
| §4.3 | [Voevodsky](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf), Propositions 3.5.2–3.5.4, pp.35–39. Smooth-pair blow-up/Gysin does not inherit a resolution hypothesis from another proof. |
| §6.8 | [Deligne–Milne, corrected 2012](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf), Theorem 3.2 and Remark 3.3, pp.30–31. Extension fibers and fpqc tensor-isomorphism torsors do not require a rational point. |

### Follow-up of the author's source warnings

The author's handoff listed eleven limits, not eleven unsupported theorem claims. I followed up each; retaining a correctly stated construction/proof target is different from claiming its formal proof already exists.

| Earlier warning | Independent follow-up and remaining limit |
| --- | --- |
| 1. Geometric suppliers | Read the concrete current cohomology/intersection contracts, coverage audit and geometric targets. Abstract Weil axioms are not identified with actual cycle-compatible realizations. R3 is the additional ordering defect. I do not certify unimplemented supplier exports as library theorems. |
| 2. Moving, transfers, finite fields and Gysin | Read Suslin–Voevodsky, Theorem 3.3.1, p.23, and Theorem 3.7.3, p.51; Friedlander–Lawson, Theorem 1.7, pp.10–12; and FV's projective comparison/localization statements. The bounded-degree moving construction, field-size issue and descent on complexes remain named proof tasks; I have not reread every moving-lemma proof page. |
| 3. Nori geometry and relative comparison | Read HM 2017, Theorems 7.1.12–7.1.13, pp.138–139, Propositions 7.4.1–7.4.2, pp.164–165; Harrer, classical/sheaf Basic Lemmas and equivariant filtration, pp.130–137, and Theorem 7.4.17, p.213. Corrected §5.4. Checked HM's 2025 corrected §9.3, pp.222–225: inverse excision is needed; the README avoids its potentially nongood intermediate pair. General relative de Rham remains a separate descent contract. |
| 4. Relative Beck | Read Fargues–Scholze v4, Proposition VI.10.2 and argument, pp.232–234. The sufficient theorem in §6.4 has preservation as well as reflection. A reflection-only route is explicitly an additional obligation; no preservation instance is conjured from conservativity. |
| 5. Heap quotient | Read HMS 2014, Proposition A.6, p.16, and Stacks Tags [0245](https://stacks.math.columbia.edu/tag/0245), [02W0](https://stacks.math.columbia.edu/tag/02W0). Effective affine fpqc descent and descent of morphisms support the explicit cocycle route now used. No unread SGA quotient theorem is needed for that route. |
| 6. Roitman | The local download timed out, but the [primary MathNet PDF](https://www.mathnet.ru/php/getFT.phtml?jrnid=sm&option_lang=eng&paperid=3248&what=fullteng) opened in the browser. Read §5, Theorem 6(a), Lemma 17, pp.587–588, with the torsion/divisibility argument in §2. The contact-line proof is present; this is not a receipt for a locally downloaded file. Characteristic-zero and field-descent tasks remain as stated. |
| 7. Known Tate/standard cases | Read Totaro §§1–5, especially Theorem 4.1 and the characteristic-two discussion, and Kleiman's cited pages. The register matches the stated field/deformation restrictions. This checks the register, not every Zarhin, K3, Artin–Tate or Schoen primary proof; those remain identified proof inputs. |
| 8. Gersten and torsion cycle maps | Read Bloch–Ogus, Theorem 4.2, p.190, in its perfect-field duality-with-supports setting, and Bloch 1979, §§1–3, pp.108–118. Prime-to-characteristic coefficients and the low-codimension range are retained. Neither paper alone supplies the real equivariant adapter. |
| 9. Real constructions | BW I/II supply the checked detector and example scopes. R1 is settled by the independent Euler-characteristic argument and genus-one product. K3/conic-bundle/deformation/classification constructions remain explicit proof targets; the uncleared K3 book was not accessed. |
| 10. Quartic Chow calculations | Checked the exact BW hypotheses in the sample. The README still requires the intermediate-Jacobian/lattice and anticanonical calculations for the full Chow group, rather than inferring a Chow-torsion answer from a cohomological defect. Those calculations are not claimed verified in full here. |
| 11. Heights and local arithmetic identity | R2 checked as above. Also read Li–Zhang v3, Definition 10.1.1, p.64, Conjecture 10.4.1, p.67, Theorem 10.5.1, p.70, Remark 10.5.4, p.72; and Li–Rapoport–Zhang v2, Theorem 14.6.2, pp.60–61, Corollary 16.1.5, p.69. The earlier theorem is conditional; the later statement uses a **reduced** inverse image. The README correctly retains local-model, divisor-multiplicity and Whittaker-normalization comparisons as premises of the global application. |

For reproducibility, the principal downloaded versions have these SHA-256 digests. They identify source versions, not evidence that every page of each source was read.

| Source | SHA-256 |
| --- | --- |
| BW I | `daeb43ec861bd6c30564543dac796c55c7f21aa943c442f826b32613e72a46a9` |
| Künnemann 2001 | `0b03cc6d1896d4f530978c16e0577b31ac6be3e94e33827713fd63e6436c2f55` |
| MVW | `1197e239873e2a7f7f4dcbd1d115af67281a6d0867eff8816cc630b86b67f020` |
| HM corrected 2025 | `6d08014f21a616abb4ba7e177effad4d15e4a215b0f234ce3a4605c20a02b731` |
| Harrer | `26cd326422cd4ae1444d9a7ca60cebf74723450de522003de33784a4e09e3a06` |
| Li–Liu | `6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566` |

## Adversarial mathematics pass

The following covers all 77 retained numbered subsections. “Retained” records a sanity check of the statement and its hypotheses, not a formal proof. All heavy objects remain future construction targets. The outstanding effective-foundation definitions in R3 have no local API/Checks to audit; adequate tests on their consumers cannot replace that missing plan.

| Statement group | Instances, calculation and disposition |
| --- | --- |
| 0.1 Correspondences/actions/composition | A point has only degree zero. Two points give matrix units with ordered composite `E₁₂E₂₁=E₁₁`. Empty and mixed-dimensional disjoint unions require the componentwise grading. Retained; locator kinds corrected. |
| 0.2 Graphs/transpose/tensor | Point inclusion and structure map interchange pullback/pushforward. Transpose of a curve's structure graph has degree minus one. Tensor interchange on two-point matrices has no cycle-level Koszul sign. Retained. |
| 0.3 Projectors | On a positive-genus pointed curve the two point-factor projectors omit a nonzero middle piece. Their sum is the whole diagonal only in genus zero. Retained. |
| 0.4 Algebraic equivalence | A connected parameter family differs from arbitrary geometric pointwise choices; field extension and norm preserve the specified equivalence. The trivial parameter difference is zero. Ground-field descent is not omitted. |
| 0.5 Adequacy/numerical relation | Degree-zero divisors are numerically trivial, a positive-degree point is not. Numerical testing uses all complementary cycles. Zero cycles and empty schemes give the zero relation tests. Retained. |
| 0.6 Support/diagonal/coniveau | Projective space has point support; rational diagonal decomposition requires an integer multiplier integrally. Rationally split generic-fiber assertions keep regularity. Retained. |
| 0.7 Hypersurfaces/indices | A low-degree contact line gives torsion of differences, and divisibility is needed for the final degree statement. Real-empty examples have no degree-one zero-cycle. Arithmetic genus is only controlled modulo the lower index. Retained. |
| 0.8 Anisotropic quadric | Compare the integral middle torsion class with its rational image; vanishing of the latter is not integral vanishing. Degree and split/non-split controls retained. |
| 1.1 Twisted Karoubi category | The zero projector gives zero, the identity recovers the original object, and the Hom exponent is `n-m`. Empty schemes and unequal component dimensions remain permitted. |
| 1.2 Tensor/Tate/additivity | Unit twists add; `𝟙(1)` and the Lefschetz motive have opposite marks. Rank-zero direct sums give zero, not the unit. Retained. |
| 1.3 Duality/retracts | Point duality is identity; the curve's diagonal contractions give the required twist. Transposed projector remains idempotent. No second finite-biproduct dual theorem is planned. |
| 1.4 Chow groups/identity principle | Testing a projector only on the ground-field points can miss it; base changes/test varieties are quantified. Zero projector and unit cycle recover the expected extreme cases. Retained. |
| 1.5 Universal property | Identity realization recovers the original correspondences, rational equivalence is killed, and retract images use idempotent completeness. No functor is obtained without the required cycle operations. |
| 1.6 Projective bundles | Rank one gives one summand; rank zero is empty. On projective space the hyperplane/point projectors have the stated degrees and sum to the diagonal. Retained. |
| 1.7 Adequate quotients | The homological quotient needs a fixed realization; the numerical quotient is unconditional. A numerical realization is not obtained merely by enlarging the equivalence relation. Retained. |
| 2.1 Graded coefficient spaces | Interchanging two odd lines gives minus one; a degree-zero line gives plus one. Finite total dimension excludes an infinite collection of nonzero degree pieces. Retained. |
| 2.2 Weil axioms | The empty variety has zero cohomology, a point the coefficient field, and top trace records residue degree. Hard Lefschetz is not a defining Weil axiom. Retained. |
| 2.3 Realization of motives | A projector realizes to its image; a unit twist changes degree and Tate weight. The realization kernel gives the homological quotient, not automatically the numerical one. Retained. |
| 2.4 Künneth/Chern classes | `[x×C]` acts on degree zero and `[C×x]` on degree two. A positive-genus curve also has a middle projector. Leading Chern-character terms use the supplied rational comparison. Retained. |
| 2.5 Comparison normalization | The Tate generator, inverse `2πi` comparison and geometric Frobenius `q⁻¹` fix opposite-looking twist conventions. Positive residue degree fixes trace. Retained. |
| 2.6 Betti/de Rham | Projective-line top class has its specified analytic integral. Nonproper smooth comparison does not imply projective Hodge decomposition or arbitrary-pair comparison. Retained. |
| 2.7 Étale/all-degree comparison | Invertibility of the prime is essential, including characteristic two. Finite coefficients, adic passage and multiplicative/trace compatibility are separate steps. Retained. |
| 2.8 Curves/kernels | Jacobian degree-one cohomology is not the degree-zero or top Tate summand. Homologically trivial correspondences act by zero; the converse is tested in the stated realization setting. Retained. |
| 3.1 Numerical trace radical | A nilpotent endomorphism has zero trace against the appropriate radical tests, but a diagonal matrix need not. Complementary cycle degrees matter. Retained. |
| 3.2 Category criterion | Finite-dimensional endomorphism algebras and the trace-radical hypothesis are used; an exact fiber alone does not make the dual-number module category semisimple. Retained. |
| 3.3 Jannsen theorem | Zero and unit numerical motives have the expected endomorphisms. Semisimplicity does not assert faithfulness of an arbitrary Weil realization on numerical motives. Retained. |
| 3.4 Rank/signed symmetry | An odd cohomology line has categorical trace minus one before the parity modification. The adjusted symmetry is not the original one. Retained. |
| 3.5 Radical/cohomology pieces | A splitting modulo the radical is not a canonical Chow splitting. Multiple lifts of a projector need not agree. Retained. |
| 3.6 Tannakian terminology | The zero category has `End(1)=0`, so fails the field condition. Super vector spaces fail the ordinary symmetric-fiber condition in characteristic different from two. Retained. |
| 4.1 Geometry/stabilization | Inverting the unit changes nothing; inverting a monoid generator gives integer marks. Rationalization kills prime torsion, so full faithfulness needs cancellation. Effective input is missing under the allowed order: R3. |
| 4.2 Homotopy/projective bundle | A rank-zero vector bundle has base motive, but a rank-zero projective bundle is empty. Mayer–Vietoris first maps have opposite signs. `M(𝔸¹)` differs from its compact-support motive. Consumer tests retained; R3 affects foundation. |
| 4.3 Blow-up/Gysin | A divisor blow-up adds no summands; a surface point blow-up adds `R(1)[2]`. The two composites from the exceptional divisor cancel. The uniformizer residue is positive one. Retained with perfectness, not unnecessary resolution. |
| 4.4 Relative cycles/transfers | The graph `st=1` is not finite over the affine-line test base. Applying a transfer `2id` once multiplies a diagonal product by two, not four. Independent-base exterior products avoid the false transfer-bilinearity claim. Retained. |
| 4.5 Bivariant/moving | `CH₀(𝔸¹)=0` differs from ordinary Suslin `H₀=ℤ`. Affine-line cycle suspension shifts dimension. Finite fields do not justify a generic rational parameter choice. Retained. |
| 4.6 Duality | Test base point gives no dimension shift; projective-line base gives adjacent cycle dimensions. Gysin boundary lowers homological degree by one and raises the closed cycle dimension by codimension. Retained. |
| 4.7 Compact support | Empty motive is zero, proper ordinary/compact-support motives agree, and affine-line compact support is `R(1)[2]`. Nonflat coefficients use derived tensor. Effective complex inputs remain R3. |
| 4.8 Representability/Chow bridge | Point Hom gives coefficients; `H^BM_(2,1)(𝔸¹)=R`. The contravariant Chow bridge uses transpose, negative twist and negative even shift. Retained. |
| 4.9 Duality/Tate | The stable dual of `R(1)[2]` is `R(-1)[-2]`; effective internal Hom need not give it. Negative-weight Tate Homs vanish in the stated setting. Retained. |
| 4.10 Scissor measure | A fat point has class one; projective line has `1+𝕃`. A localized source map requires the corresponding target elements to be invertible. The even shift has positive K₀ sign. Retained. |
| 5.1 Endomorphism coalgebras | Isolated `K²` gives `M₂(K)`; an identity edge equates scalars while a zero edge does not. A Jordan loop changes the centralizer. Filtered coefficient maps need not be inclusions. Retained. |
| 5.2 Universal category | Isolated line and plane have equivalent module categories with different marked generators. A faithful exact fiber permits nonsplit extensions. Universal functor direction and markings retained. |
| 5.3 Pair diagrams | Relative boundary for the two-point subset of the projective line is nonzero. Empty/full relative pairs give zero; the multiplicative Tate pair lies in degree one. Retained. |
| 5.4 Basic Lemma/filtration | Point cellular complex is degree zero; two points in an affine line give differential `(a,b)↦b-a`. Repeated low-dimensional levels do not satisfy the very-good dimension condition automatically. Locators corrected. |
| 5.5 Covers/cones | Two choices of index map for a repeated affine chart need only be homotopic. The total differential's cross terms cancel; forgetting the sign doubles their composite. The relative cone requires `[-1]`. Retained. |
| 5.6 Tensor/excision/localization | Inverse excision supplies the good endpoint without a potentially nongood intermediate pair. Odd–odd geometric flip has minus sign, corrected ordinary symmetry plus sign. Sending a coefficient to a unit does not prove the canonical localization universal property. Retained. |
| 5.7 Fibers/rigidity | Duality on smooth normal-crossing pair generators is geometric, not a consequence of an arbitrary abstract Weil theory. Betti/de Rham comparison preserves the specified Tate line. Retained. |
| 5.8 Quotient/correspondence action | An arbitrary filtration need not give a good quotient filtration. Finite-group invariants are compared after rationalization; finite correspondence action must recover graph and repeated-transfer multiplicities. Retained. |
| 5.9 Geometric-to-Nori | Common refinement gives comparison zigzags, not a unique-map directed poset. Nisnevich and homotopy relations must be killed before localization. Reduced projective-line motive maps to the Nori Tate object shifted by minus two. Retained. |
| 6.1 Neutral fibers/finite hulls | Zero hull is zero, and a single nontrivial multiplicative-group character does not generate a tensor-closed finite-sum hull. Nonsemisimple characteristic-p representation categories remain allowed. Retained. |
| 6.2 Hopf reconstruction | Matrix monoid has no antipode merely from its bialgebra. On a character the antipode inverts `t`. Both convolution identities are required; no Hopf structure is a premise. Retained. |
| 6.3 Generation/maps | Multiplicative group is of finite type and not finite. A closed subgroup gives restriction in the stated direction. Infinitesimal characteristic-p groups require all algebra-valued points. Retained. |
| 6.4 Relative reconstruction | Matrix multiplication fixes module side. Finite weight pieces give `K^S` and assemble to `K[ℤ]`. Identity reconstruction needs action balancing. Reflection is not preservation. Retained with explicit stronger hypotheses. |
| 6.5 Heaps/descent | Noncommutative `xy⁻¹z` checks the middle reversal. Integer translation classes give identical translations. A nonempty real affine heap without real points is allowed; the empty heap cannot define a pointed group. Retained. |
| 6.6 Coefficient algebra | Relation `2(y-x)=0` has integral torsion detected modulo two; the dual-Hom module is torsion free. Off-diagonal coefficient equals one. Retained. |
| 6.7 Formal periods | Positive loop gives `2πi`, hence its image is nonzero and localization can be evaluated. Two Koszul signs cancel in the product. Supplier direction repaired. |
| 6.8 Extended fibers | An isomorphism torsor can be nonempty fpqc-locally without a rational point. Extension of scalars retains finite-projective fibers. Retained. |
| 6.9 Marked period point | A marked complex point is not a rational point. Evaluation need not be injective; a period-conjecture assertion is not a theorem of reconstruction. Retained. |
| 6.10 Artin/pure Tate | Finite étale point decompositions recover the Galois-set representation. Pure Tate weights give a multiplicative group, whereas extension closure introduces extra objects. Retained. |
| 7.1 Rational Hodge | Zero comparison has full inverse-image source and invalidates zero-conclusion without injectivity. Fixed comparison and weight `2p` give the diagonal-filtration equivalence. Tate unit controls are proved in Lean. Retained. |
| 7.2 Tate variants | A Frobenius Jordan block has invariants without a stable complement. Finite extension can enlarge invariants. Rational-source injection is distinct from integral surjectivity and from a ℚℓ-source assertion. Retained. |
| 7.3 Standard predicates | Surface primitive divisor sign is minus intersection; a point has positive multiplication. On `ℙ¹×ℙ¹`, one complementary class misses `a-b` while another detects it. Rational representatives are not automatically Chow projectors. Retained. |
| 7.4 Known cases/smash | For three factors the norm coefficient is `2³·6=48`; genus zero is already rationally trivial. The inequalities `n>g` and the projective-bundle range serve distinct purposes. Retained. |
| 7.5 Filtrations/Murre | Empty intersection gives full Chow; on a pointed curve the first divisor kernel is Picard-zero and the strong next term is zero. Filtration independence is weaker than equality of projector choices. Retained. |
| 7.6 Motivic t-structure | `ℚ(1)[2]` is shifted, not in degree-zero heart. T-exactness alone need not be conservative. Pure semisimplicity does not make the mixed heart semisimple. Retained as a conjectural premise and consequences. |
| 7.7 Integral/real Hodge | Torsion classes prevent replacement by rational cohomology. Real-locus admissibility includes the even Steenrod constraints, with the sign twist. Non-Archimedean real closed fields use semialgebraic comparison. Retained. |
| 7.8 Basic real cases | Conic and projective-space cases distinguish empty and nonempty real locus. Projective-bundle and blow-up contributions keep their codimensions. Divisor and zero-cycle conclusions use different propositions. Retained. |
| 7.9 One-cycle detectors | Real-empty genus-zero and genus-one curves give different detector values. Arithmetic genus of a singular curve cannot replace geometric genus. Invariant torsion is not automatically descended torsion. Retained. |
| 7.10 Surface obstructions | The topological and Hodge predicates need different targets, even when a surface theorem identifies them. Empty-real index and torsion-descent hypotheses remain visible. Retained. |
| 7.11 Explicit examples | Quaternionic coefficient square is minus identity. Odd coherent Euler characteristic forbids failed torsion descent. The actual genus-one product has Euler characteristic zero. Odd ramification separates valuation residues modulo four. R1 closed. |
| 7.12 Unramified/torsion | Rational vanishing does not remove integral or divisible defects. The torsion cycle map keeps prime-to-characteristic and low-dimensional injectivity restrictions. Retained. |
| 7.13 Quartics | Real-point and empty-real quartics have different torsion calculations. A cohomological cokernel does not compute a whole Chow group. Smoothness, field and geometric calculation inputs retained. |
| 7.14 Quantified questions | Universal, existential and fixed-variety assertions are distinct. Zero/low-dimensional cases are tested without turning an open question into an existence theorem. Retained. |
| 7.15 Compatible Hodge/Tate | Separate surjectivity after two scalar extensions does not choose a common rational cycle. Compatibility demands a shared rational source and comparison. Retained. |
| 7.16 Rank predicates | Analytic order zero and positive order are separate conditions; the Hom multiplicity must refer to the selected realization. Nonvanishing alone does not give the predicted rank. Retained as a predicate. |
| 7.17 Primitive heights | At `d=2,p=1`, primitivity is `ker L²`, not `ker L`. Rational strict positivity has a real-null-vector counterexample after extension. Degree-two/three tower scales raw height by six and leaves absolute height unchanged. R2 closed. |
| 7.18 Unitary rank | At `n=2` the Shimura variety is a curve. Multiple base-change factors do not permit replacing the selected factor by their product. A nonzero Hom does not give its dimension. Retained. |
| 7.19 Li–Liu | `C₁=-π/4`, raised to even `[F:ℚ]`; all Gamma denominators have positive integral arguments. Exactly two split places suffice. The local formula has subtraction and denominator `q+1`; reduced inverse image does not give scheme multiplicities. Retained with its explicit local premise. |

There are 360 prose Check bullets across the 77 numbered sections, with at least three in each. I checked examples and non-examples at the defining-object level; the count alone does not establish that a definition is sound. The four light Lean definitions each have exactly two proved examples, supplemented by prose checks of the other domain, non-example and comparison conditions. Heavy constructions remain in the README and closing Lean comment. R3 identifies the definitions for which that local coverage is absent altogether.

## Lean and validation

`lean-check` on the package's Suggested.lean **exited 0**, with exactly five warnings, all “declaration uses `sorry`”. It has 204 lines, four real-bodied definitions, five admitted theorem targets and eight proved examples. It imports `Mathlib` once and the three Tau Ceti modules actually used. There is no admitted data, admitted example, `set_option`, algorithm, auxiliary proof development or Tate's-thesis theorem. The unchanged file was checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; source truth was checked separately from elaboration.

| Signature spot check | Comparison with README |
| --- | --- |
| `comparisonCoefficient` | Source vector and target covector give the dual functional on linear comparisons; no diagonal restriction. |
| `exists_antipode_of_rigid_finite_comodules` | Field, commutative bialgebra and rigidity are hypotheses; both convolution identities are conclusions. No Hopf premise. |
| `rationalClassesOfType` | Rational inverse image of a complex Hodge piece; injectivity/fixed image are not hidden in the definition. |
| `rationalClassesOfType_diagonal_iff` | Weight `2p` and fixed image are explicit; membership is compared with the filtration. |
| `rationalClassesOfType_map` | Hodge morphism and commuting comparison square are required. |
| `rationalClassesOfType_wrong_weight` | Injectivity and fixed image are both present before concluding the source subspace is zero. |
| `weightFourAction` | Actual conjugate-linear map on the four complex coefficients, with the correct two minus signs. |
| `rationalHeightPositive` | Rational domain, specified primitive subspace and `(-1)^p` sign; no complex-extension conclusion. |
| `rationalHeightPositive_zero_iff` | Membership in the positivity domain is an explicit hypothesis; no conclusion for outside vectors. |
| Off-diagonal coefficient example | The selected comparison sends the second source basis vector into the first target coordinate and computes one. This detects a diagonal-only substitute. |

Metadata is the single fitting line `topic = "math.AG"`. Final checks:

- `python3 scripts/check_blueprint.py` on the base and all six continuation packets: **seven packets, zero errors and zero warnings**. No packet was edited.
- `python3 research/blueprint/intake.py check-files` on README, Suggested.lean, metadata, review.json and this report: **five files, zero problems**.
- Independent crosswalk set comparison: **315 input nodes, 313 unique mapped nodes, two verified existing-work removals, no missing or extra nodes**.
- `git diff --check`: **passed**. The changed paths are exactly README.md, review.json and this report.

Sources and other authors' text were treated as data. The cleared-library index was checked; no uncleared book was accessed, and no source file or verbatim passage is committed. No instruction to execute fetched code, use a credential or alter unrelated files was followed. No suspicious instruction of that kind was encountered during this review. Only this report and the authorized package files belong to the submission; no background Lean process is left running.
