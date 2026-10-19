# Periods, motivic L-values and special-value conjectures: PS.0–PS.7

This roadmap assembles actual motivic comparisons and sourced special-value statements. Its outputs are normalized comparison classes, leading-term and integral-line assertions, and certified examples. A realization, regulator or Selmer complex is the one constructed by its named supplier; arbitrary vector spaces or matrices do not establish that an object is motivic. Every implementation status is unchecked. The packet is complete at target level; all eight stages are planned, with the contracts and gaps below preventing closure. PS.8–PS.11 belong to the second part and are outside this pass.

Integration is β:D⊗C→B⊗C; Deligne’s comparison is I=β⁻¹. Coordinates use column vectors. The Burns–Flach fundamental object is Ξ, and the Fukaya–Kato object is its inverse Δ. A real zeta element in Δ has image L*, whereas the associated element in Ξ has image (L*)⁻¹. The completion is L_fin L_∞, without a conductor half-power. A coefficient-field unit, an integral unit and a nonzero complex number are three different conditions.

## Existing inputs and ownership

The reviewed library audit and actual pinned declarations were checked before planning. The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Current upstream was checked separately: TauCetiRoadmap 0d144d044dacebca17b654695b6f1ad58f159b27, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and its Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a. In particular the current IntegralLattices and EllipticCurves roadmaps and the Tate Hodge implementation are inputs, alongside the newer roadmap catalogue. No lake command was run in those read-only sources.

| Owner | Imported output | PS contribution |
| --- | --- | --- |
| MC.2 and C5 | Genuine realizations, tensor comparisons and geometric de Rham–Betti maps | Period orientation, determinant coordinates and coefficient-field classes |
| MC.5–MC.6 | Effective formal-period relations, Tate localization, full comparison algebra and tensor-isomorphism torsor | Actual integration evaluation and its commuting normalization diagram |
| PMIA L5 | Generic determinant functor on perfect complexes | Arithmetic factor order, inverse convention and specialization checks |
| M.8 | Selected Tate/elliptic arithmetic lines and regulator determinant comparison | BF/FK leading-term and integral/local assembly |
| R.7 and ER.5 | Sourced Borel and CM elliptic regulator results | Transport of their exact normalizations; no general K₂ spanning claim |
| L0, AL.1, AL.4 and AL.5 | Bernoulli identities, analytic factors, functional equations and scoped modular critical values | Motive-to-analytic period comparison and normalized-value assembly |
| D7 and Selmer L2–L4 | Actual cochain/local-condition complexes, finite Selmer conditions and lattice-change cones | Determinant corrections with every perfectness and real-dyadic gate |
| NE.3 and NE.7 | Reduced norms, SK₁ and source-qualified zeta-isomorphism interfaces | Relative ETNC obstruction and BF/FK orientation comparison |
| BSD.8 and upstream EllipticCurves | Néron periods, heights, Tamagawa factors and source-qualified all-prime reconstruction | Translation into the fundamental line |
| CN.4 | Sound rational/complex intervals, outward rounding and L-value enclosures | Two explicit period integrals and normalization/error ledgers |

The early PS.0 comparison inputs do not depend on M.8. M.8 consumes that prefix, while PS.3–PS.4 consume M.8. The source-level prerequisites therefore do not introduce the cycle that would result from making the whole PS.4 stage an M.8 input. The packet proposes the corresponding MC.6/M.8 boundary clarification and registration of the routed Rankin Part II.

### Pinned declarations actually used

- **mathlib:Matrix.det** (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): Determinant of a finite square matrix over a commutative ring; coordinates only, not the determinant functor of complexes.
- **mathlib:Matrix.det_mul** (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): det(AB)=det(A)det(B) over a commutative ring.
- **mathlib:Matrix.det_fin_zero** (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): The determinant of a zero-by-zero matrix is one.
- **mathlib:IsLocalization.Away** (Mathlib/RingTheory/Localization/Away/Basic.lean): Localization at powers of one element, for commutative semirings.
- **mathlib:IsLocalization.Away.mul_invSelf** (Mathlib/RingTheory/Localization/Away/Basic.lean): The image of the localized element times invSelf is one.
- **tauceti:TauCeti.Hodge.tate** (TauCeti/Geometry/Hodge/Tate/Basic.lean): Integral Tate Hodge structure of weight −2m and type (−m,−m); its lattice map is the ordinary inclusion of integers into complex numbers, not a geometric 2πi comparison.
- **tauceti:TauCeti.Hodge.tate_F** (TauCeti/Geometry/Hodge/Tate/Basic.lean): Its Hodge filtration is the whole line for p≤−m and zero for p>−m.
- **mathlib:intervalIntegral** (Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean): Oriented interval integral, defined as the difference of the two Ioc Bochner integrals; use integrability before an analytic identity.
- **mathlib:intervalIntegral.norm_integral_le_of_norm_le** (Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean): For a≤b and an integrable majorant g, an a.e. norm bound on Ioc gives norm of the interval integral ≤ integral of g.
- **mathlib:intervalIntegral.integral_comp_mul_deriv'** (Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean): Change of variables with HasDerivAt on uIcc, continuous derivative and g continuous on the image; apply to truncated nonsingular intervals.
- **mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence** (Mathlib/MeasureTheory/Integral/DominatedConvergence.lean): A.e. strong measurability, integrable domination and a.e. pointwise convergence imply convergence of Bochner integrals.
- **mathlib:IsLocalization.Away.lift** (Mathlib/RingTheory/Localization/Away/Basic.lean): A ring homomorphism sending the localized element to a unit extends to its away localization.
- **mathlib:MeasureTheory.Measure.haarMeasure** (Mathlib/MeasureTheory/Measure/Haar/Basic.lean): Normalized Haar measure attached to a positive compact set in a locally compact topological group with its Borel structure; apply the native Multiplicative type synonym for additive groups.
- **mathlib:MeasureTheory.Measure.infinitePi** (Mathlib/Probability/ProductMeasure.lean): Product of an arbitrary family of probability measures; it is zero by definition if the probability hypotheses fail. Normalize the good-prime factors before using it.

The checker warns about five existing upstream EllipticCurves layer anchors lacking request entries. These are citations of existing Tau Ceti roadmaps, whose work is imported under WORKERS.md; they are not requests to re-plan upstream. All other stage-only inputs have explicit requests below.

## Source register

Locators in targets below are theorem/section and page locators for the exact versions listed here. Statements and proof plans are written in this roadmap’s own words. The source selection is target driven; it is not an outline of any source.

- **Deligne** — Pierre Deligne, *Valeurs de fonctions L et périodes d’intégrales*. PSPM 33, Part 2 (1979), pp. 313–346; text read in Ghate–Beineke English translation, revised 2018. Page locators below refer explicitly to that translation PDF. Original IAS download refused access.. [Source](https://mathweb.tifr.res.in/~eghate/Deligne.pdf). Read: §§0.2–0.4, PDF pp. 3–4; §1, pp. 6–8; §§2.3–2.8, pp. 10–12; §§3–5.3, pp. 13–18; §§6.3–6.7, pp. 20–21; §7.8, p. 25.
- **HMS** — Annette Huber and Stefan Müller-Stach, *On the relation between Nori motives and Kontsevich periods*. arXiv:1105.0865v5 (2013). [Source](https://arxiv.org/pdf/1105.0865v5). Read: Theorem 0.2, p. 2; Definition 2.8, Remark 2.9 and Theorem 2.10, pp. 10–11; Lemmas 3.1–3.2 and Theorem 3.3/Corollary 3.4, pp. 12–13.
- **BCGP** — George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. arXiv:1812.09269 downloaded 2026-10-19, published-format preprint; not independently collated with the publisher version. [Source](https://arxiv.org/pdf/1812.09269). Read: Conjecture 1.1.1, pp. 1–2; §2.8, pp. 35–38, especially (2.8.4)–(2.8.5), Conjecture 2.8.6 and Corollary 2.8.7; §2.5 purity definition, p. 31; compatible-system coefficient closures visually checked on p. 35..
- **Serre** — Jean-Pierre Serre, *Facteurs locaux des fonctions zêta des variétés algébriques (définitions et conjectures)*. Séminaire Delange–Pisot–Poitou 11 (1969–70), exp. 19, pp. 1–15. [Source](https://numdam.org/article/SDPP_1969-1970__11_2_A4_0.pdf). Read: §§3.1–3.3 and §4.1, pp. 11–14; Conjecture C9, pp. 13–14.
- **Tate** — John Tate, *Number theoretic background*. PSPM 33, Part 2 (1979), pp. 3–26; standalone article scan, printed p. 15 inspected. [Source](https://ncatlab.org/nlab/files/TateNumberTheory.pdf). Read: §3.4, (3.4.3)–(3.4.8), printed p. 15, and beginning of §3.5 on the same page.
- **BF** — David Burns and Matthias Flach, *Tamagawa numbers for motives with (non-commutative) coefficients*. Documenta Mathematica 6 (2001), pp. 501–570, publisher PDF. [Source](https://ems.press/content/serial-article-files/25892?nt=1). Read: §§3.1–3.5, pp. 517–533, especially Conjecture 1, (19)–(29), Lemmas 5–6 and Theorem 3.1; §§4.2–4.4, pp. 534–540, Lemma 9, Conjecture 4, Remark 10 and Theorem 4.1.
- **BV** — David Burns and Otmar Venjakob, *On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory*. Documenta Mathematica extra volume (2006), pp. 165–209; author final PDF has internal pages 1–45. [Source](https://www.mathi.uni-heidelberg.de/~otmar/papervenjakob/bock-final.pdf). Read: §§4.2–4.3, internal pp. 19–21 (published pp. 183–185), Conjecture 4.1; §§5.1–5.3, internal pp. 21–27 (published pp. 185–191), hypotheses, Theorem 5.5 and Corollary 5.7.
- **BK** — Spencer Bloch and Kazuya Kato, *L-functions and Tamagawa numbers of motives*. The Grothendieck Festschrift I (1990), pp. 333–400; standalone article supplied on academic site. [Source](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf). Read: Introduction, pp. 333–336; Proposition 5.4 and Definition 5.5, pp. 370–372; §§5.9–5.15, pp. 373–377, especially Conjecture 5.15 and Remark 5.15.2; Theorem 4.1 and small-weight condition, p. 362; Definition 5.5/P1–P4 and (5.6)–(5.13), pp. 371–375; formula-bearing pages 371–372 and 374–375 visually inspected..
- **LTXZZ** — Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*. Inventiones Mathematicae 228 (2022), pp. 107–375; maintainer-cleared published NSF copy read in place. [Source](https://doi.org/10.1007/s00222-021-01088-4). Read: §1.1, Definitions 1.1.3–1.1.4, Theorems 1.1.5 and 1.1.9, pp. 109–113; downstream proof gates imported from PAPER-LIU-ETAL-22, not independently re-proved here.
- **Johansson** — Fredrik Johansson, *Numerical integration in arbitrary-precision ball arithmetic*. arXiv:1802.07942v1 (2018). [Source](https://arxiv.org/pdf/1802.07942v1). Read: §§1–2, pp. 1–3: validated interval integration, subdivision, analytic-domain and branch obligations.

The published LTXZZ text was read from the maintainer-cleared library in place. It was not copied into the repository. The original Deligne French article, the original Fukaya–Kato formulation and the original Burns–Greither theorem are acquisition/collation gaps explicitly recorded below. BV is a precise secondary formulation for the FK orientation, not a claim to have read the original FK text.

## PS.0 — Comparison spaces and period lines

Construct the normalization prefix independently of arithmetic regulators. Retain the actual realization functors, field embeddings, F∞ and the filtration; every period coordinate must identify its domain and codomain. Checks cover rank zero, Tate inversion, simultaneous coefficient units and the real elliptic components index.

### Comparison determinant line

Target **PeriodsAndSpecialValues:PS.0/comparison-period-line** (construction).

For a genuine motive M/Q with coefficient number field E, a selected embedding into C and supplied finite free Betti and de Rham realizations B,D of equal rank d, let β:D⊗C ≃ B⊗C be the integration comparison and I=β⁻¹. Define the comparison period as the nonzero element det(I) of Hom(det B,det D)⊗C. In column coordinates P=[I], replacing Betti basis b by bA and de Rham basis d by dC gives P′=C⁻¹PA and det P′=det(C)⁻¹det(P)det(A). No existence of geometric realizations is asserted from arbitrary linear algebra.

**Hypotheses.** MC.2 supplies actual realization functors and tensor compatibilities; the imported C5 comparison supplies the smooth proper geometric cases. Extension to an admitted motive or projector is part of the supplied realization comparison, not a theorem for every motive. Use E⊗Q C when recording all coefficient embeddings; coordinate matrices refer to one component.

**Proof plan.**

1. Import the realization objects and comparison; invert β, rather than silently calling integration I.
2. Apply the supplied determinant-line functor to I; use Matrix.det and det_mul for its basis coordinates.
3. Check base change against the comparison functors; a chosen coordinate is not a canonical integral generator.

**Inputs.** MotivesAndAlgebraicCycles:MC.2/realization-equivalence, PadicMeasuresIwasawaAlgebras:L5, mathlib:Matrix.det, mathlib:Matrix.det_mul, ComplexComparisonPartII:C5/repair-proper-de-rham-betti, ComplexComparisonPartII:C5/multiplicative-period-interface.

**Sources.** Deligne, §0.4, p. 4; §5.1, pp. 15–16 (English translation PDF pages): Inverse integration comparison and its determinant-line interpretation.

**Planning API.**

- **comparison_period_line.matrix** (data): Return the matrix P of I in specified ordered bases.
- **comparison_period_line.line** (projection): Return Hom(det B,det D), independent of bases.
- **comparison_period_line.basis_change** (functoriality): P′=C⁻¹PA, with the displayed determinant transformation.
- **comparison_period_line.embedding_change** (compatibility): Scalar extension along σ:E→C gives the σ-component of the E⊗C comparison.
- **comparison_period_line.direct_sum** (compatibility): The determinant of a block sum is the tensor product, using the determinant functor’s grading and ordering.

**Unit tests.**

- **comparison_period_line.empty**: Rank zero has period one, not zero.
- **comparison_period_line.rank_one**: For I(z)=αz, the coordinate is α; replacing the Betti basis by 2b multiplies it by 2.
- **comparison_period_line.inverse**: If integration on H¹(Gm) has matrix [2πi], the I-matrix is [(2πi)⁻¹].

**Consumers.** PS.1 and PS.3: Extract periods in critical-value and regulator formulas.; PS.8: Distinguish an actual geometric period normalization from a formal solution.

Atlas planet: **Comparison determinant line**.

### Real comparison and conjugation

Target **PeriodsAndSpecialValues:PS.0/real-infinity** (theorem).

For a real embedding and an actual realization, F∞:B→B is E-linear with F∞²=1 and carries H^{p,q} to H^{q,p}. After scalar extension, I intertwines F∞⊗complex conjugation on B⊗C with the scalar real structure on D⊗C. Thus B=B⁺⊕B⁻ over E, with projections (1±F∞)/2. The canonical semilinear lattice conjugation of a Hodge structure is a different operator from F∞.

**Hypotheses.** Characteristic zero; the comparison and real structures are the geometric ones.

**Proof plan.**

1. Import naturality under the real embedding from MC.2/ComplexComparison.
2. Apply Deligne Proposition 1.4 to I; diagonalize the E-linear involution using 2 invertible.
3. Do not substitute the pinned Hodge lattice conjugation for the independent geometric F∞.

**Inputs.** PeriodsAndSpecialValues:PS.0/comparison-period-line, MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology.

**Sources.** Deligne, §0.2.5, p. 3; Proposition 1.4, p. 7 (English translation PDF pages): Geometric infinity action and comparison real structure.

**Checks.**

- On Q(1), F∞ is −1 although the ordinary lattice real structure fixes integers.
- A swapped pair H^{p,q},H^{q,p} contributes one plus and one minus dimension.

Atlas planet: **Real comparison**.

### Coefficient-field period class

Target **PeriodsAndSpecialValues:PS.0/period-class** (definition).

For the comparison line of M with coefficient field E, define its basis-independent period class in (E⊗Q C)×/E×, where a single u∈E× acts through all embeddings simultaneously. In a selected component it is a class in C×/σ(E×). Equality of these classes means a specified coefficient-field unit relates two nonzero periods; it does not mean equality of scalars or equality of integral generators.

**Hypotheses.** A trivialization of each E-determinant line, and the comparison from PS.0/comparison-period-line.

**Proof plan.**

1. Use the action of E× on nonzero comparison coordinates.
2. The basis transformation formula shows that changing E-bases preserves the orbit.
3. Transport the orbit under coefficient embeddings; require one E-element rather than independently chosen algebraic factors.

**Inputs.** PeriodsAndSpecialValues:PS.0/comparison-period-line.

**Sources.** Deligne, §2.6, p. 11; Conjecture 2.8, p. 12 (English translation PDF pages): Periods over E and their simultaneous E× ambiguity.

**Planning API.**

- **period_class.mk** (constructor): A nonzero coordinate determines an orbit.
- **period_class.eq_iff** (characterisation): Two tuples represent the same orbit iff their ratio is the diagonal image of one u∈E×.
- **period_class.basis_invariant** (compatibility): Changing E-bases leaves the class unchanged.
- **period_class.multiply** (structure): Tensoring comparison lines multiplies their period classes.
- **period_class.at_embedding** (projection): Evaluation at σ descends to C×/σ(E×).

**Unit tests.**

- **period_class.rational_factor**: For E=Q, 2α and α have the same class for α≠0, but need not be equal.
- **period_class.zero_excluded**: Zero is not a period-class representative.
- **period_class.simultaneous**: For E=Q(√2), tuples (√2,−√2) and (1,1) are equivalent, while (√2,√2) and (1,1) are not.

**Consumers.** Deligne §2.8 and PS.1: State simultaneous algebraicity across coefficient embeddings.; PS.7: Prevent numerical equality being inferred from equality of period classes.

Atlas planet: **Coefficient-field period class**.

### Deligne plus and minus periods

Target **PeriodsAndSpecialValues:PS.0/deligne-periods** (construction).

For a pure realization for which the middle Hodge summand H^{w/2,w/2}, if present, has scalar F∞, choose the filtration cuts F⁺,F⁻ of dimensions d⁺=dim_E B⁺ and d⁻=dim_E B⁻ as in Deligne §1.5. Put D^±=D/F^∓. Whenever the induced I^±:B^±⊗C→D^±⊗C are isomorphisms, define c^±(M)=det(I^±), as nonzero elements of their determinant lines and then period classes. Record δ(M)=det I separately. A rank-zero sign has determinant one.

**Hypotheses.** The precise Hodge-filtration cuts exist with the stated dimensions and induced comparisons are isomorphisms; equal dimensions alone do not suffice. For a critical twist M(m), these conditions follow from the Hodge criterion, not from general analytic continuation.

**Proof plan.**

1. Use real-infinity to form E-linear eigenspaces.
2. Apply the actual filtration quotient maps and check the Hodge criterion of Deligne §1.6.
3. Take determinants using the common grading convention and period-class construction.

**Inputs.** PeriodsAndSpecialValues:PS.0/real-infinity, PeriodsAndSpecialValues:PS.0/period-class, PadicMeasuresIwasawaAlgebras:L5.

**Sources.** Deligne, §§1.5–1.7, p. 8; §2.6, p. 11; (5.1.8), p. 16 (English translation PDF pages): Filtration quotients, sign periods and Tate-twist formula.

**Planning API.**

- **deligne_periods.plus** (projection): Return the determinant of I⁺ with its source and target lines.
- **deligne_periods.minus** (projection): Return the determinant of I⁻, retaining the sign label.
- **deligne_periods.quotient_iso** (characterisation): Certify the actual induced isomorphism, not just rank equality.
- **deligne_periods.twist** (compatibility): c^±(M)=(2πi)^(−n d^±(M)) c^{±(−1)^n}(M(n)) as period classes.
- **deligne_periods.basis_units** (compatibility): Both sign periods transform by the determinant factors of their own E-bases.

**Unit tests.**

- **deligne_periods.unit**: For Q(0), c⁺=1 and the zero-dimensional c⁻=1.
- **deligne_periods.odd_twist**: A twist by one swaps the plus/minus dimensions; ignoring the sign swap fails.
- **deligne_periods.singular_quotient**: A noninvertible map between equal-dimensional spaces is rejected as a period comparison.

**Consumers.** Deligne Conjecture 2.8: Normalize the critical finite value of M(m).; PS.3: Compare determinants with the real regulator exact sequence.

Atlas planet: **Deligne periods**.

### Tate and elliptic normalization examples

Target **PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations** (application).

Choose the counterclockwise loop on Gm and the form dz/z. Integration on Q(−1)=H¹(Gm) is 2πi, so Deligne’s I has δ(Q(n))=(2πi)^n, F∞=(−1)^n and type (−n,−n). For an elliptic curve E/R with oriented integral cycles γ₁,γ₂ and an algebraic de Rham basis ω,η, write the integration matrix B=(∫γᵢωⱼ)_{i,j}; the column-coordinate comparison is β=Bᵗ and I=(Bᵗ)⁻¹. The all-components real Néron period is the number of components times the positive identity-component integral. Relating it to a primitive B⁺ cycle requires the integral index at 2, not only a rational eigenspace. In the concrete curve y²=x(1−x)(1−x/2), take ω=dx/(2y), η=xω. Let γ_a traverse [0,1] with y positive and return on the opposite sheet, and γ_b traverse [1,2] with y=−i√(x(x−1)(1−x/2)) and return on the other sheet. Put K=∫₀¹dt/√((1−t²)(1−t²/2)), J=∫₀¹t²dt/√((1−t²)(1−t²/2)), H=∫₁²x dx/(2√(x(x−1)(1−x/2))). Then the row-cycle integration matrix is B=[[2K,2J],[2iK,2iH]], with the positive-imaginary γ_b orientation and the complementary-modulus identity at 1/2. Its column comparison is (Bᵗ)⁻¹; equivalently if a=2K,b=2J,c=2iK,d=2iH, it is (ad−bc)⁻¹[[d,−c],[−b,a]]. No numerical approximation is used to assert this equality.

**Hypotheses.** Elliptic uniformization, minimal invariant differential and actual integration supplied by the existing EllipticCurves and ComplexComparison roadmaps. The basis matrix is nonsingular; orientation and form/cycle order fixed.

**Proof plan.**

1. Evaluate dz/z on the chosen loop and invert the comparison.
2. Use the already constructed Tate Hodge type; supply the geometric comparison scalar separately.
3. Form the elliptic matrix with rows cycles and columns forms, then transpose before inverting.
4. Import the all-components real-period convention and keep its lattice index visible.
5. For the displayed curve substitute x=t² on γ_a and x=1/(1−u²/2) on the half γ_b path; this gives its complementary K integral. Evaluate η on the same paths to obtain J,H, then apply the inverse-transpose formula. The actual geometric comparison supplies nonsingularity.

**Inputs.** PeriodsAndSpecialValues:PS.0/deligne-periods, tauceti:TauCeti.Hodge.tate, tauceti:TauCeti.Hodge.tate_F, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, ComplexComparisonPartII:C5/repair-proper-de-rham-betti, ComplexComparisonPartII:C5/multiplicative-period-interface, ComplexComparisonPartII:C5/regular-singular-de-rham-comparison, ComplexComparisonPartII:C5/curve-residue-localization.

**Sources.** Deligne, §3.1, pp. 13–14; §4.1, p. 14 (English translation PDF pages): Tate integration normalization and the components factor in real abelian periods.

**Checks.**

- Q(1) has I-period 2πi, and Q(−1) its inverse.
- The elliptic comparison is inverse transpose of the displayed row-cycle integration matrix.
- Two real components multiply the identity-component period by 2; replacing a cycle basis by index 2 changes its determinant.
- On the displayed λ=1/2 curve, the first column of B is (2K,2iK), so replacing I by β or omitting the transpose fails the explicit matrix test.

**Coverage: planned.** Discharge L5 determinant and actual geometric-comparison contracts for the admitted motives; collate original Deligne locators.

## PS.1 — Critical values and algebraicity statements

Own the common compatible-system completion and the distinct conjectural predicates used by BCGP and the modularity roadmap. Import local analytic/Galois constructions. Criticality is simultaneous dual regularity. Proved analytic identities need a separate geometric period comparison before they yield a Deligne-normalized statement.

### Motivic Euler product

Target **PeriodsAndSpecialValues:PS.1/motivic-euler-product** (definition).

A weakly compatible system R consists of a number field E⊂C, a finite bad set S, monic degree-d polynomials Q_v over E for v∉S, continuous semisimple representations over algebraic closures of E_λ r_λ unramified away from Sλ with those Frobenius characteristic polynomials, de Rham local restrictions at v|λ (crystalline outside S), and multisets H_τ for τ:F→Ebar agreeing with the labelled Hodge–Tate weights under every embedding Ebar→Ebar_λ over E. Strict compatibility additionally supplies, at every finite v, a WD representation over an algebraic closure of E whose scalar extension under every coefficient embedding equals WD(r_λ|G_v)^{F-ss}, including v|λ. Purity of weight w is the existing monodromy-filtration purity of each supplied WD representation; no descent of r_λ to E_λ is implicit. For this admitted system with Hodge/infinity realizations, import P_v(T)=det(1−T Fr_geom | (ker N_v)^{I_v}) and L_v=P_v(q_v^(−s))⁻¹. Define L_fin by its absolutely convergent Euler product for Re(s)>1+w/2; the proof bounds the local reciprocal roots by q_v^(w/2) and compares the resulting prime sum with the trivial-character Hecke Euler product. L_fin^S omits S. Retain every bad-place WD factor. Use local conductor exponents with an explicitly supplied global base-field/discriminant normalization N(R). Continuation is separate analytic data.

**Hypotheses.** Strict compatibility includes the Frobenius-semisimplified WD comparison for every coefficient place, including v above its residue characteristic. The imported monodromy-filtration purity bounds the eigenvalues on ker N by q_v^(w/2); Hodge and infinity data are additional inputs when not supplied by geometry.

**Proof plan.**

1. Import the actual continuous Galois representations, local WD construction and conductor exponents from AGR; formulate the BCGP compatible-system predicate here. AGR R01.5 recognition is not a construction of compatible systems.
2. Apply determinant polynomials on inertia-invariant monodromy kernels; prove coefficient-embedding independence using strict compatibility.
3. For Re(s)>1+w/2, bound the local reciprocal roots and compare the absolute logarithmic series with the supplier’s trivial-character Hecke Euler product. Keep full and partial products and their finite ratio distinct.

**Inputs.** ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier, ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification-construction, ArithmeticGaloisRepresentations:R01.2/local-euler-factor, ArithmeticGaloisRepresentations:R01.3, AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison, mathlib:Matrix.det, ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations, AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function.

**Sources.** BCGP, §2.8, pp. 35–37: Strict compatibility, purity and the Euler product from Weil–Deligne representations.; Deligne, §§1.1–1.2, p. 6 (English translation PDF pages): Admitted local factors and finite Euler products.

**Planning API.**

- **motivic_euler_product.local_polynomial** (projection): Return P_v with Frobenius, inertia and monodromy conventions.
- **motivic_euler_product.coefficient_embedding** (compatibility): Changing λ or embedding gives the image of the same E-polynomial under strict compatibility.
- **motivic_euler_product.finite_product** (constructor): Construct the convergent product on its convergence domain.
- **motivic_euler_product.remove_primes** (relation): L_fin^S=L_fin·∏_{v∈S}P_v(q_v^(−s)) wherever both sides are defined.
- **motivic_euler_product.conductor** (projection): Return the positive global conductor and a ledger of its local/discriminant normalization.
- **motivic_euler_product.unramified_adapter** (compatibility): Compare with AL.4 only through a proved local Satake–Galois compatibility.

**Unit tests.**

- **motivic_euler_product.unit**: The unit motive over Q has P_p(T)=1−T and Euler product ζ(s) for Re(s)>1.
- **motivic_euler_product.monodromy**: On a nontrivial two-dimensional Steinberg WD block only the one-dimensional (ker N)^I contributes.
- **motivic_euler_product.omission**: Removing one good factor multiplies the finite L-function by P_v(q_v^(−s)); it does not divide by it.

**Consumers.** BCGP §2.8 and AbelianSurfacesPotentialModularity: State continuation for the actual system attached to H¹(A).; ModularityAndLanglandsExtensions:ML.0: Import this common motivic completion interface.

Atlas planet: **Motivic Euler product**.

### Archimedean factors and completion

Target **PeriodsAndSpecialValues:PS.1/archimedean-completion** (construction).

For a pure Hodge realization over Q, use Γ_R(s)=π^(−s/2)Γ(s/2). A real conjugate pair (p,q),(q,p), p<q, contributes Γ_C(s−p)^{h^{p,q}}. A middle (p,p) block on which F∞=(−1)^{p+ε}, ε∈{0,1}, contributes Γ_R(s+ε−p) to its dimension. In Deligne convention Γ_C,D(s)=2(2π)^(−s)Γ(s); in BCGP convention Γ_C,B(s)=(2π)^(−s)Γ(s). At a complex place use the supplied Hodge factors for each (p,q) at the chosen embedding. Define Λ=L_fin·L_∞, with no conductor half-power absorbed. If b is the total number of complex gamma blocks counted with multiplicity, Λ_D=2^bΛ_B. Export this normalization map before transporting any value or epsilon factor.

**Hypotheses.** Actual Hodge data and infinity action from PS.0; complex-place factors obey the chosen field restriction convention. Gamma poles and continuations are the analytic functions, not values of Mathlib’s totalized Gamma at poles.

**Proof plan.**

1. Form the finite archimedean product from Deligne §§5.2–5.3 and Serre §3.
2. Compare the two Γ_C normalizations one block at a time.
3. Multiply with the finite Euler product on its convergence region; continuation remains a separate predicate.

**Inputs.** PeriodsAndSpecialValues:PS.1/motivic-euler-product, PeriodsAndSpecialValues:PS.0/real-infinity, AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor, AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory.

**Sources.** Deligne, §§5.2–5.3, pp. 17–18 (English translation PDF pages): Gamma factors from Hodge numbers and infinity signs.; BCGP, (2.8.4), p. 37: The conductor is not included in Λ and Γ_C has no prefactor 2.; Serre, §§3.1–3.3, pp. 11–12: Archimedean factors attached to real and complex Hodge structures.

**Planning API.**

- **archimedean_completion.gamma_factor** (projection): Return each gamma block with shift and multiplicity.
- **archimedean_completion.completed** (constructor): Λ=L_fin·∏_{v|∞}L_v in the specified normalization.
- **archimedean_completion.normalization_bridge** (equivalence): Λ_D=2^bΛ_B with b counting every block, including field embeddings.
- **archimedean_completion.finite_value** (projection): Recover L_fin=Λ/L_∞ at points where L_∞ is finite and nonzero.
- **archimedean_completion.twist** (compatibility): For Tate twist n, L_∞(M(n),s)=L_∞(M,s+n).

**Unit tests.**

- **archimedean_completion.unit**: For Q(0), L_∞=Γ_R(s), with a pole at s=0.
- **archimedean_completion.surface**: For H¹ of an abelian surface over totally real F, BCGP has Γ_C,B(s)^2 per real place and Λ_D/Λ_B=2^(2[F:Q]).
- **archimedean_completion.diagonal_sign**: A (0,0) block with F∞=−1 has Γ_R(s+1), not Γ_R(s).

**Consumers.** BCGP Theorem 9.3.1: Compare automorphic and motivic functional-equation normalizations.; Deligne criticality: Read poles of both the system and its dual.

Atlas planet: **Motivic completion**.

### Critical integer

Target **PeriodsAndSpecialValues:PS.1/critical-integer** (definition).

An integer m is critical for M precisely when the meromorphic factors L_∞(M,s) and L_∞(M∨,1−s) are both regular at s=m. For a real off-diagonal pair p<q this means p<m≤q. A real diagonal block (p,p,ε) requires both m+ε−p and 1−m+ε+p to avoid {0,−2,−4,…}. Take the conjunction over all nonzero Hodge blocks. This definition only concerns infinity factors and says nothing about vanishing or poles of L_fin.

**Hypotheses.** Pure geometric Hodge realization and duality; the analytic gamma-pole theorem from AL.1.

**Proof plan.**

1. Substitute the Hodge gamma shifts and their dual shifts.
2. Use the gamma pole set and purity to derive the off-diagonal interval.
3. Keep the dual test even when the first factor is regular; correct the translation’s §2.3(ii) sign as recorded in E2.

**Inputs.** PeriodsAndSpecialValues:PS.1/archimedean-completion, PeriodsAndSpecialValues:PS.0/deligne-periods, AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor, AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory.

**Sources.** Deligne, Definition 1.3, p. 6; §1.3, p. 7; §§5.2–5.3, pp. 17–18 (English translation PDF pages): Simultaneous regularity and its Hodge description.

**Planning API.**

- **critical_integer.iff_regular** (characterisation): Criticality is equivalent to regularity of both indicated meromorphic germs.
- **critical_integer.off_diagonal** (characterisation): For a lone p<q pair, critical m are exactly p<m≤q.
- **critical_integer.diagonal** (characterisation): Use the two displayed shifted even-nonpositive exclusions.
- **critical_integer.twist** (compatibility): m is critical for M iff 0 is critical for M(m).
- **critical_integer.embedding** (compatibility): The Hodge criterion is transported along coefficient embeddings.

**Unit tests.**

- **critical_integer.zeta**: For Q(0), precisely positive even and negative odd integers are critical; 0 is not.
- **critical_integer.modular**: A Hodge pair (0,k−1),(k−1,0), k≥2, has critical integers 1,…,k−1.
- **critical_integer.dual_needed**: For Q(0), m=1 passes Γ_R(m) but fails Γ_R(1−m); it is not critical.

**Consumers.** Deligne §1.8/§2.8: Limit conjectural algebraicity to critical integers.; PS.7: Reject normalization tests at gamma poles.

Atlas planet: **Critical integer**.

### Deligne normalized-value predicate

Target **PeriodsAndSpecialValues:PS.1/deligne-algebraicity** (definition).

For a critical m, a supplied meromorphic continuation regular at m, and simultaneous coefficient-embedding values L_fin^*(M,m)∈E⊗C, let DeligneAlgebraic(M,m) mean L_fin^*(M,m)/c⁺(M(m)) lies in the diagonal image of E. Its nonzero refinement requires this ratio in E×. Use the finite value, the plus period of the twisted motive and its induced sign, not Λ(M,m). The predicate includes that a single coefficient element realizes all embedding components; it is invariant under E-basis changes. General Deligne algebraicity and any nonvanishing assertion are separate conjectural assumptions.

**Hypotheses.** All realizations and periods are from PS.0; analytic continuation and regularity are supplied or separately assumed. Periods are nonzero; a chosen representative is recorded for exact scalar formulas.

**Proof plan.**

1. Use the critical twist to construct c⁺ and its coefficient-field class.
2. Define membership in the diagonal coefficient algebra, and then the stricter unit version.
3. Use the basis-change and embedding formulas to establish independence of period representatives.

**Inputs.** PeriodsAndSpecialValues:PS.1/critical-integer, PeriodsAndSpecialValues:PS.0/period-class, PeriodsAndSpecialValues:PS.0/deligne-periods.

**Sources.** Deligne, Conjecture 1.8, p. 8; §2.6 and Conjecture 2.8, pp. 11–12; (5.1.8), p. 16 (English translation PDF pages): The finite-value conjecture, simultaneous E-rationality and twist normalization.

**Planning API.**

- **deligne_algebraicity.ratio** (projection): Return the normalized finite value for chosen period bases.
- **deligne_algebraicity.iff_coefficient** (characterisation): Algebraicity means existence of one a∈E giving all embedding components.
- **deligne_algebraicity.unit_iff** (characterisation): The unit predicate is algebraicity plus nonzero value in every coefficient component.
- **deligne_algebraicity.basis_invariant** (compatibility): Replacing c by u c, u∈E×, replaces a by a/u.
- **deligne_algebraicity.galois** (functoriality): Reindexing embeddings transports a to its corresponding conjugate; it does not introduce independent coefficients.

**Unit tests.**

- **deligne_algebraicity.zero**: The zero normalized value satisfies coefficient membership but not the unit predicate.
- **deligne_algebraicity.zeta_two**: With Q(2) period (2πi)^2, ζ(2)/(2πi)^2=−1/24.
- **deligne_algebraicity.completion**: Using Γ_R(2)ζ(2) in the same formula changes the ratio and is rejected as the finite-value interface.

**Consumers.** Deligne Conjecture 2.8: Keep the conjecture distinct from proved Dirichlet/modular adapters.; PS.7: Compare exact coefficients only after a period representative is fixed.

Atlas planet: **Deligne algebraicity**.

### Dirichlet and Tate motivic adapter

Target **PeriodsAndSpecialValues:PS.1/dirichlet-tate-adapter** (comparison).

For a primitive Dirichlet character χ with coefficient field E, fixed complex embedding and the actual Artin motive Aχ whose finite Euler factors equal those of L(χ,s), transport the L0 Bernoulli/Gauss identities and AL.1 functional equation to the Deligne normalization of Aχ(m). Record χ versus its inverse, parity, conductor and the chosen Gauss-sum sign through an explicit period identification. At 1−n, n≥1, the finite value is the complex image of −B_{n,χ}/n in the supplier’s character convention. A positive critical value uses the imported functional equation and the correct dual character. For an induced character keep each omitted Euler polynomial; a vanishing polynomial requires the supplier’s leading-term correction, not division.

**Hypotheses.** Actual Artin realization and its period/Gauss comparison supplied; no arbitrary one-dimensional representation asserted motivic. The L0 principal-conductor-one endpoint convention is B₁(1)=+1/2; retain exceptional zeros and local conductors.

**Proof plan.**

1. Match Euler polynomials and the character/inverse convention before applying L0.
2. For nonpositive critical arguments use the embedded Bernoulli identity; for positive ones use AL.1 and the dual Gauss factor.
3. Apply PS.0 Tate scaling and the proved Artin period identification; transport finite corrections from AL.5.

**Inputs.** PeriodsAndSpecialValues:PS.1/deligne-algebraicity, PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations, DirichletPadicLFunctions:L0/normalized-value-complex-embedding, AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term, MotivesAndAlgebraicCycles:MC.2, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation, AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors.

**Sources.** Deligne, §3.1–3.2, pp. 13–14; §§6.3–6.7, pp. 20–21 (English translation PDF pages): Tate powers and Artin period/Gauss normalization; analytic identities are imported from their owners.

**Checks.**

- ζ(−1)=−1/12 and ζ(2)/(2πi)^2=−1/24 are distinct critical examples.
- ζ(0)=−1/2 follows from L0 but is not a critical value of Q(0).
- Changing primitive conductor to an induced modulus retains the exact missing-prime factors; no normalized quotient is formed when one is zero.

### Modular motivic period comparison

Target **PeriodsAndSpecialValues:PS.1/modular-period-adapter** (comparison).

For a normalized cuspidal eigenform f over Q of weight k≥2 in the exact GL2 scope of AL.5, its supplied rank-two motive M_f has Hodge types (0,k−1),(k−1,0) and critical integers 1≤m≤k−1. Import the AL.5 formula using its modular-symbol periods Ω_f^±, then prove the comparison of those rational structures with c^±(M_f) in E×-classes. Only after this identification transport the formula with (2πi)^m and sign (−1)^m. For a scalar equality specify integral cycles, invariant differential and the comparison coefficient; period-class equality alone proves no canonical scalar identity. Retain conductor, ramified factors and imprimitive zero-factor leading terms.

**Hypotheses.** The motive, its eigenprojector and comparison are actual supplied constructions; the chosen coefficient field contains the eigenvalues. This target makes no general Rankin or arbitrary number-field algebraicity assertion beyond its supplier’s scope.

**Proof plan.**

1. Compare the modular-symbol Betti rational structure and algebraic de Rham eigenclass via the geometric comparison.
2. Use the weight-(k−1) Hodge pair to determine the critical interval and twist sign.
3. Transport the imported critical-value formula and finite Euler corrections through the explicit period identification.

**Inputs.** PeriodsAndSpecialValues:PS.1/deligne-algebraicity, AutomorphicLFunctionsAndLocalFactors:AL.5/critical-value-period-interface, AutomorphicLFunctionsAndLocalFactors:AL.5/finite-euler-correction, AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term, MotivesAndAlgebraicCycles:MC.2.

**Sources.** Deligne, §7.8, p. 25; (5.1.8), p. 16 (English translation PDF pages): Modular critical-value normalization and its sign/Tate dependence.

**Checks.**

- For k=2 only m=1 is critical, with the minus-sign period before the Tate factor.
- Replacing Ω by uΩ changes its exact coefficient by u⁻¹ while preserving the E× class.
- A zero local correction is handled at the correct derivative order.

### Serre compatible-system predicate

Target **PeriodsAndSpecialValues:PS.1/serre-system-predicate** (definition).

For the BCGP-normalized completion of an admitted strictly compatible system R, define SerreSystem(R) to assert meromorphic continuation of Λ(R,s), Λ(R∨,s) agreeing with their Euler products on a right half-plane and the functional equation Λ(R,s)=ε(R)N(R)^(−s)Λ(R∨,1−s), with N positive and the dual conductor equal. Require nonzero meromorphic germs, and the chosen local epsilon/measure normalization. Applying the equation twice then gives ε(R)ε(R∨)=N(R). The conductor is not already multiplied into Λ. General SerreSystem is a conjectural predicate; potentially automorphic cases import a theorem giving its witness.

**Hypotheses.** Both dual completions and conductors refer to the same normalization of PS.1. The epsilon constants need additional geometric/local normalization data; strict compatibility alone does not manufacture them.

**Proof plan.**

1. Package continuation as extension of the existing holomorphic Euler-product function, not as an arbitrary entire-plane function.
2. State both dual functional equations; cancel a nonzero germ to obtain the product constraint.
3. Use Tate (3.4.7) with the dual Haar measure and opposite additive character to check compatibility with the supplied local epsilon convention.

**Inputs.** PeriodsAndSpecialValues:PS.1/archimedean-completion, ArithmeticGaloisRepresentations:R01.3, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation, AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors.

**Sources.** BCGP, (2.8.4)–(2.8.5), p. 37: Completion and conjectural continuation/functional equation.; Tate, (3.4.3)–(3.4.7), printed p. 15: Measure scaling, conductor shift and the contragredient epsilon identity.

**Planning API.**

- **serre_system_predicate.continuation** (projection): Return an agreeing meromorphic extension and its dual.
- **serre_system_predicate.functional_equation** (projection): Return the equation with the explicit N^(−s) factor.
- **serre_system_predicate.epsilon_product** (compatibility): The two nonzero dual equations imply ε(R)ε(R∨)=N(R).
- **serre_system_predicate.half_conductor** (equivalence): If Λ̂=N^(s/2)Λ, its root constant is ε/√N; for self-dual data its square is one.
- **serre_system_predicate.normalization_change** (compatibility): Changing gamma blocks by constants rescales the two sides and their epsilon constants coherently.

**Unit tests.**

- **serre_system_predicate.self_dual**: For a self-dual system, ε²=N; ε itself need not be a sign in this normalization.
- **serre_system_predicate.zero_germ**: Two identically zero functions are rejected as a witness of continuation of the Euler product.
- **serre_system_predicate.no_double_conductor**: Inserting N^(s/2) into Λ without changing the displayed functional equation fails the half-conductor test.

**Consumers.** AbelianSurfacesPotentialModularity Theorems 1.1.2 and 9.3.1: Consume a common predicate with exact conductor normalization.; ModularityAndLanglandsExtensions:ML.0: Import this predicate instead of defining another compatible-system completion.

Atlas planet: **Serre functional equation**.

### Hasse–Weil completion and duality

Target **PeriodsAndSpecialValues:PS.1/hasse-weil-predicates** (construction).

For an abelian variety A/F of dimension g, import strict compatibility and purity of H^i(A) for 0≤i≤2g, define Λ_i(A,s)=Λ(H^i(A),s) and Λ(A,s)=∏_iΛ_i(A,s)^{(−1)^i}. At good reduction the corrected local product has exponent (−1)^i and equals exp(Σ_{m≥1}#A(k_v^m)q_v^(−ms)/m). Define SerreC9_i(A) by meromorphic continuation and Λ_i(A,s)=w_i N_i^((i+1)/2−s)Λ_i(A,i+1−s), w_i∈{±1}, N_i∈Z_{>0}. Poincaré duality plus all SerreC9_i implies BCGP Corollary 2.8.7: Λ(A,s)=ε N^(−s)Λ(A,1+g−s) with ε real and N positive rational. Separately define the Conjecture 1.1.1 predicate for a smooth projective X/F of dimension d: its partial Hasse–Weil zeta function has meromorphic continuation, and there exist A₀>0, nonzero rational bad-prime polynomials P_v and the specified gamma product such that ξ(s)=ζ_X(s)A₀^(s/2)∏Γ_v(s)∏P_v(q_v^(−s)) satisfies ξ(s)=wξ(d+1−s), w=±1. These are conditional predicates, not general theorems.

**Hypotheses.** NeronModelsAndSemistableAbelianVarieties:R11.5 supplies BCGP Proposition 2.8.1. WeilConjectures:WC.1 supplies point counts and WC.2 supplies actual duality; use the chosen integral model and omitted bad set in the partial zeta predicate.

**Proof plan.**

1. Import the cohomological systems and form their finite alternating products.
2. Apply the trace/point-count identity with the corrected cohomological exponent.
3. Apply Poincaré duality together with the individual conjectural equations to obtain the total equation.
4. Keep the general smooth-projective predicate’s existence of corrections explicit; do not turn unspecified bad factors into proved local definitions.

**Inputs.** PeriodsAndSpecialValues:PS.1/serre-system-predicate, NeronModelsAndSemistableAbelianVarieties:R11.5, WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula, WeilConjectures:WC.2.

**Sources.** BCGP, §2.8, pp. 36–38, Conjecture 2.8.6 and Corollary 2.8.7; Conjecture 1.1.1, pp. 1–2: Abelian Hasse–Weil functions and the general smooth-projective conjectural statement.; Serre, §4.1, Conjecture C9, pp. 13–14: Cohomological continuation and functional-equation conjecture.

**Planning API.**

- **hasse_weil_predicates.cohomological** (constructor): Construct Λ_i from the imported pure system H^i(A).
- **hasse_weil_predicates.alternating** (constructor): Construct Λ(A) with the cohomological sign, not a complex-variable exponent.
- **hasse_weil_predicates.good_reduction** (compatibility): Identify the local product with the point-count exponential in its convergence domain or formal variable.
- **hasse_weil_predicates.c9** (constructor): Form the exact individual continuation/functional-equation predicate.
- **hasse_weil_predicates.total_equation** (compatibility): Under all individual predicates and duality, derive the stated total equation.
- **hasse_weil_predicates.smooth_projective** (constructor): Form the separate existential corrected-zeta predicate of Conjecture 1.1.1.

**Unit tests.**

- **hasse_weil_predicates.point**: For dimension-zero A=Spec F, the alternating product has only H⁰ and gives the Dedekind zeta convention.
- **hasse_weil_predicates.elliptic**: For g=1, the H¹ L-factor occurs inversely in the local Hasse–Weil zeta product; its exponent is independent of s.
- **hasse_weil_predicates.surface**: For an abelian surface over totally real F, H¹ has Γ_C,B(s)^2 per real place; the full product still includes H⁰ through H⁴.

**Consumers.** BCGP Corollary 9.3.3: Conclude exactly the indicated Serre/Hasse–Weil predicates in the proved surface case.; AbelianSurfacesPotentialModularity and ML.0: Use these common definitions instead of duplicate conjectures.

Atlas planet: **Hasse–Weil functional equations**.

**Coverage: planned.** Prove the Artin/modular geometric period identifications; obtain all-degree abelian strict compatibility and the exact global conductor/duality contracts. General Deligne and Serre/Hasse–Weil assertions remain explicit predicates.

## PS.2 — Formal periods and integration evaluation

Import MC.6’s already localized formal-period algebra and its full torsor theorem. The new map is evaluation by actual relative integration. Its well-definedness needs the full pair/connecting/product comparison, which is a named C5 request. Evaluation injectivity remains a separate predicate in PS.7.

### Localized integration evaluation

Target **PeriodsAndSpecialValues:PS.2/integration-evaluation** (construction).

Import P_eff, L=(Gm,{1},dz/z,S¹), and P=P_eff[L⁻¹] from MC.6/formal-periods. For actual relative algebraic de Rham and singular realizations, define per_eff([X,Y,ω,γ])=∫_γω using the supplied comparison. Prove that it respects linearity, morphisms of pairs, connecting maps/Stokes, products and the unit. The positively oriented Tate integral is 2πi≠0, so the localization universal property yields the unique Q-algebra map per:P→C extending per_eff and satisfying per(L⁻¹)=(2πi)⁻¹. No effective/full identification is made without localization.

**Hypotheses.** ComplexComparisonPartII:C5 supplies comparison for pairs, boundary maps, tensor products and the actual integration interpretation. The formal algebra, its relations and Tate localization are supplied once by MC.6.

**Proof plan.**

1. Evaluate generators by the geometric comparison and pair with homology.
2. Use its three compatibilities and product naturality to descend to P_eff.
3. Evaluate the loop integral and prove nonzero; extend by IsLocalization.Away to P and compute the inverse image.

**Inputs.** MotivesAndAlgebraicCycles:MC.6/formal-periods, MotivesAndAlgebraicCycles:MC.6/period-point, ComplexComparisonPartII:C5, PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations, mathlib:IsLocalization.Away, mathlib:IsLocalization.Away.mul_invSelf, mathlib:IsLocalization.Away.lift.

**Sources.** HMS, Definition 2.8 and Remark 2.9, pp. 10–11; Theorem 2.10, p. 11: Formal relations, localization and the actual period homomorphism.; Deligne, §3.1, pp. 13–14 (English translation PDF pages): The positively oriented Tate integral.

**Planning API.**

- **integration_evaluation.on_symbol** (characterisation): per of the localized symbol equals its actual relative integral.
- **integration_evaluation.stokes** (relation): A connecting-map relation evaluates to equality with the specified boundary sign.
- **integration_evaluation.product** (compatibility): per(xy)=per(x)per(y), with the product orientation inherited from the relative Künneth map.
- **integration_evaluation.tate** (simp): per(L)=2πi and per(L⁻¹)=(2πi)⁻¹.
- **integration_evaluation.unique_extension** (universal-property): Any Q-algebra map agreeing with per_eff and inverting L equals per.

**Unit tests.**

- **integration_evaluation.inverse**: In P, LL⁻¹=1 and its image is exactly 1.
- **integration_evaluation.point**: The point-pair symbol of the constant 1 evaluates to 1; zero form evaluates to 0.
- **integration_evaluation.stokes_interval**: For X=A¹, Y={0,1}, ω=dx and γ=[0,1], evaluation is 1 and agrees with the boundary evaluation of x.

**Consumers.** HMS Theorem 2.10 and PS.9: Use actual numerical evaluation on the full formal-period ring.; RT-AREA-iwasawa-3/8: Provide the missing inverse and localization contract without duplicating MC.6’s corrected algebra.

Atlas planet: **Localized period evaluation**.

### Period torsor evaluation comparison

Target **PeriodsAndSpecialValues:PS.2/torsor-integration-comparison** (comparison).

Under the canonical MC.6 isomorphism P≃O(Iso⊗(H_dR,H_B)) on the full integer-Tate category, PS.2 integration evaluation is pullback at the genuine complex comparison point β. The effective isomorphism first carries L to its comparison coefficient; localizing both sides gives the full isomorphism and the evaluation diagram commutes. Betti acts on the left by composition and de Rham on the right; this is the β convention, whereas PS.0 uses I=β⁻¹. Neither the torsor theorem nor faithful flatness implies injectivity of per.

**Hypotheses.** Use the full category and full localized comparison algebra supplied by MC.5–MC.6, not only the effective category.

**Proof plan.**

1. Import the category/localization and comparison-algebra equivalence, including its actual Tate-unit statement.
2. Check equality on integration symbols and on L⁻¹; use uniqueness of the localization lift.
3. Match β rather than I and preserve the two coaction directions.

**Inputs.** PeriodsAndSpecialValues:PS.2/integration-evaluation, MotivesAndAlgebraicCycles:MC.5/diagram-localisation, MotivesAndAlgebraicCycles:MC.6/formal-periods-equal-comparison-algebra, MotivesAndAlgebraicCycles:MC.6/period-torsor, MotivesAndAlgebraicCycles:MC.6/period-point.

**Sources.** HMS, Theorem 0.2, p. 2; Theorem 2.10, p. 11; Theorem 3.3 and Corollary 3.4, p. 13: Comparison algebra, localized formal periods and tensor-isomorphism torsor.

**Checks.**

- The comparison sends L to a unit on the full torsor, not merely a nonzero effective coordinate.
- The heap formula uses P⊗P⁻¹⊗P in the supplier’s tensor order.
- An equality of evaluation values alone is not returned as equality in P.

### Rank-one Tate torsor example

Target **PeriodsAndSpecialValues:PS.2/tate-torsor-test** (application).

For the tensor category generated by the Tate object with all integral twists, specialize the imported MC.6 torsor theorem: the distinct Tate weights make its tensor automorphisms Gm, giving O(Iso⊗)=Q[t,t⁻¹], with t representing the β-period L of Q(−1). Under PS.2 evaluation, t↦2πi and t⁻¹↦(2πi)⁻¹; under the inverse comparison I the corresponding coordinate is inverted. The effective polynomial algebra Q[t] alone is not the full torsor algebra. For the finite étale scheme Spec(Q[x]/(x²−2)), the de Rham class x paired with the complex point x=√2 evaluates to √2. Algebraic zero-dimensional periods are obtained from this point-pair realization, and products of pairs agree with multiplication in this full ring.

**Hypotheses.** The rank-one category/torsor and its comparison are imported from MC.6; this target is the concrete integration normalization.

**Proof plan.**

1. Restrict the supplied full comparison to the Tate-generated category; use the distinct Hodge weights to identify its tensor automorphisms with Gm and its coordinate algebra with the Laurent algebra.
2. Identify the distinguished integration coordinate and its inverse.
3. Use PS.2 product compatibility for all positive and negative powers.

**Inputs.** PeriodsAndSpecialValues:PS.2/torsor-integration-comparison, MotivesAndAlgebraicCycles:MC.6/formal-periods.

**Sources.** HMS, Remark 2.9, p. 11; Lemmas 3.1–3.2, p. 12: Tate inversion required for the full comparison algebra.

**Checks.**

- t·t⁻¹=1 evaluates to 1.
- Evaluation of t⁻² is (2πi)⁻².
- Replacing Q[t,t⁻¹] by Q[t] fails the negative-twist test.
- The zero-dimensional symbol (Spec(Q[x]/(x²−2)),x,point √2) evaluates to √2, and changing the point to −√2 changes the value.

**Coverage: planned.** Supply C5 relative-pair/Stokes/product comparison and complete the actual integration-evaluation descent; MC.6 already owns the localized algebra and torsor theorem.

## PS.3 — Regulator determinants and leading terms

Import the specialized M.8 lines and regulator maps. Assemble the explicit Burns–Flach factors and their real exact-sequence trivialization, then state rational leading-term membership with the inverse orientation required by Ξ. Borel/CM elliptic results retain their existing source scope.

### Rational motivic fundamental line

Target **PeriodsAndSpecialValues:PS.3/rational-fundamental-line** (comparison).

For a motive M with semisimple Q-algebra A acting, assume the supplied finite-dimensional projective motivic cohomology spaces and realizations. Import M.8/arithmetic-fundamental-line for its selected Tate/elliptic cases. In general coefficients assume the stated finite projective motivic inputs, and assemble in the ordered determinant Picard category the explicit Burns–Flach factors of the Burns–Flach object Ξ_A(M)=dH_f⁰(M)·dH_f¹(M)⁻¹·d(H_f¹(M∨(1))^*)·d(H_f⁰(M∨(1))^*)⁻¹·∏_{v|∞}d(H_v(M)^{G_v})⁻¹·d(t_M), where t_M=H_dR(M)/F⁰. For M/Q with commutative E-coefficients the archimedean term is d(B⁺)⁻¹. Define the Fukaya–Kato line Δ_E(M)=Ξ_E(M)⁻¹ with the exact reversed tensor/inverse identification in the same determinant convention. These are rational objects; no finite torsion cardinality is erased from the separate integral problem.

**Hypotheses.** Motive and cohomology objects supplied by MC.2/M.8; finite dimensionality/projectivity are explicit assumptions, not consequences of notation. General determinant functor, symmetry signs, base change and exact-sequence isomorphisms supplied by PadicMeasuresIwasawaAlgebras:L5.

**Proof plan.**

1. Import M.8’s specialized arithmetic line; identify its factors with the displayed BF formula rather than constructing that line again. For general semisimple coefficients the displayed factor list is the PS.3 conditional assembly, using L5.
2. Use base change to identify scalar extensions; record the dual spaces before taking determinant inverses.
3. Compare the displayed BF and BV formulas term by term to identify Δ=Ξ⁻¹, retaining grading signs.

**Inputs.** PeriodsAndSpecialValues:PS.0/comparison-period-line, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line, MotivicEtaleKTheory:M.8/regulator-determinant-comparison, PadicMeasuresIwasawaAlgebras:L5.

**Sources.** BF, §3.4, (29), p. 526: The rational fundamental object and its ordered factors.; BV, §4.3, internal p. 20 (published p. 184): The opposite fundamental-line orientation Δ.

**Planning API.**

- **rational_fundamental_line.xi** (constructor): Return the ordered BF fundamental object.
- **rational_fundamental_line.delta** (constructor): Return the inverse FK line and its comparison with Ξ.
- **rational_fundamental_line.base_change** (functoriality): Scalar extension carries every factor and dual to the corresponding determinant object.
- **rational_fundamental_line.coordinates** (compatibility): For chosen bases the line has the product of the listed determinants with exactly their exponents.
- **rational_fundamental_line.zero_rank** (simp): A zero-dimensional cohomology factor contributes the unit object, not a zero scalar.

**Unit tests.**

- **rational_fundamental_line.inverse**: Δ⊗Ξ is canonically the determinant unit in the fixed order.
- **rational_fundamental_line.dual_term**: The factor d(H_f¹(M∨(1))^*) occurs with positive exponent in Ξ; replacing it by its inverse fails.
- **rational_fundamental_line.finite_torsion**: A finite integral module becomes zero after tensoring with Q, but its integral correction must still appear in PS.4.

**Consumers.** BF Conjecture 4 and BV Conjecture 4.1: State ETNC and zeta elements in compatible orientations.; PS.6: Identify the actual cohomology factors in BSD/Bloch–Kato cases.

### Real period–regulator trivialization

Target **PeriodsAndSpecialValues:PS.3/real-regulator-trivialization** (construction).

Under the Burns–Flach real regulator/height exact-sequence conjecture, let α:B⁺⊗R→t_M⊗R be induced by I. The supplied cycle/regulator and height maps give the exact sequence 0→H_f⁰(M)_R→ker α→H_f¹(M∨(1))_R^*→H_f¹(M)_R→coker α→H_f⁰(M∨(1))_R^*→0. Applying the ordered determinant identifications gives θ_∞:Ξ_A(M)_R→1. In invertible regulator cases its coordinate is the corresponding signed matrix determinant together with the comparison factors. Exactness/nondegeneracy, including the weight −1 height step, is an explicit hypothesis; an arbitrary nonzero matrix is not the motivic regulator.

**Hypotheses.** Actual motivic regulator maps from M.8, BorelRegulators or EllipticRegulators; the indicated exact sequence and required height pairing supplied or conjecturally assumed. A-equivariance and projectivity as in BF §3.1; real comparison from PS.0.

**Proof plan.**

1. Import M.8/regulator-determinant-comparison for the admitted Tate/elliptic inputs. For general coefficients use the displayed real exact sequence as a hypothesis and assemble its determinant trivialization with the PS.0 comparison.
2. Apply determinant multiplicativity along the exact sequence and the short sequence defining α.
3. Translate to bases only after constructing the coordinate-free map; keep the grading signs and real orientations.

**Inputs.** PeriodsAndSpecialValues:PS.3/rational-fundamental-line, PeriodsAndSpecialValues:PS.0/deligne-periods, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line, MotivicEtaleKTheory:M.8/regulator-determinant-comparison, BorelRegulators:R.7/regulator-factor-two, BorelRegulators:R.7/number-field-small-cases, EllipticRegulators:ER.5/the-L-value-theorem, EllipticRegulators:ER.5/nonvanishing-and-what-is-not-claimed.

**Sources.** BF, §3.1, Conjecture 1, pp. 517–519; §3.4, pp. 526–529: The real exact sequence and its fundamental-object trivialization.

**Planning API.**

- **real_regulator_trivialization.theta** (constructor): Construct θ_∞ only from the actual exact sequence witness.
- **real_regulator_trivialization.matrix** (compatibility): In selected bases return the signed period/regulator determinant.
- **real_regulator_trivialization.basis_change** (functoriality): Changing motivic bases changes determinant coordinates inversely on the two sides.
- **real_regulator_trivialization.height** (projection): Expose the actual weight −1 height pairing and its nondegeneracy assumption.
- **real_regulator_trivialization.orientation** (compatibility): Switching from Ξ to Δ inverts the trivialization and leading-term coordinate.

**Unit tests.**

- **real_regulator_trivialization.empty**: An empty regulator block has determinant one.
- **real_regulator_trivialization.scaled_regulator**: Multiplying all entries of a rank-r regulator map by 2 multiplies its determinant by 2^r.
- **real_regulator_trivialization.degenerate**: A singular height/regulator pairing cannot provide θ_∞ through the asserted exact sequence.

**Consumers.** BF §§3–4: Define the archimedean component of the relative obstruction.; PS.6: Use the Néron–Tate height only through its actual comparison with the real sequence.

Atlas planet: **Period–regulator trivialization**.

### Leading-term rationality predicate

Target **PeriodsAndSpecialValues:PS.3/leading-term-line** (definition).

For the finite L-function with a supplied nonzero meromorphic germ at s=0, define its order r and leading coefficient L*=lim_{s→0}s^(−r)L_fin(M,s), componentwise in the center for semisimple coefficients. In the commutative E case with θ_∞, define LeadingTermRational(M) to mean the nonzero element θ_∞⁻¹((L*)⁻¹) belongs to the rational E-fundamental line Ξ_E(M) inside its real extension, with the explicitly selected embedding and orientation. Define a general Beilinson leading-term assertion as the predicted order together with this rationality and the required regulator exactness, kept as conjectural premises. No assertion about an integral lattice follows from this rational membership.

**Hypotheses.** Finite-value normalization from PS.1 and θ_∞ from PS.3; the order and nonzero leading term require actual meromorphic continuation. For the equivariant formulation use the center/reduced-rank version of PS.5 instead of treating noncommutative coefficients as a field.

**Proof plan.**

1. Factor each germ as s^r times a nonvanishing analytic unit, allowing negative r for poles.
2. Use θ_∞ to transport the inverse leading coefficient into Ξ; equivalently transport L* into Δ=Ξ⁻¹.
3. Separate rationality from the integral lattice-generation assertion introduced in PS.4–PS.5.

**Inputs.** PeriodsAndSpecialValues:PS.1/motivic-euler-product, PeriodsAndSpecialValues:PS.3/real-regulator-trivialization.

**Sources.** BF, §4.3, Conjecture 4(i)–(iii), pp. 535–536: Continuation, predicted order and rationality of the equivariant leading term.

**Planning API.**

- **leading_term_line.order** (projection): Return the order of the nonzero meromorphic germ.
- **leading_term_line.coefficient** (projection): Return the nonzero coefficient of s^r, so for holomorphic order r≥0 it is L^(r)(0)/r!.
- **leading_term_line.rationality** (characterisation): Membership in Ξ uses θ_∞⁻¹((L*)⁻¹); equivalently membership in Δ uses L* and the dual trivialization.
- **leading_term_line.finite_correction** (compatibility): Multiplying by an Euler germ of order e adds e to the order and multiplies leading coefficients.
- **leading_term_line.not_integral** (relation): Rational membership does not imply generation of any chosen integral lattice.

**Unit tests.**

- **leading_term_line.factorial**: For L(s)=3s²+O(s³), r=2 and L*=3, while L″(0)=6.
- **leading_term_line.pole**: For L(s)=2/s+O(1), r=−1 and L*=2.
- **leading_term_line.index**: The lattices Z and 2Z span the same rational line but give distinct generator assertions.

**Consumers.** Beilinson leading-term boundary in PS.7: Retain conjectural order and rationality explicitly.; PS.5: Upgrade to an integral relative-K obstruction only under its additional hypotheses.

Atlas planet: **Leading-term rationality**.

### Number-field and CM regulator adapters

Target **PeriodsAndSpecialValues:PS.3/regulator-specializations** (comparison).

Import the Borel–Beilinson comparison with all Tate factors and embedding multiplicities: in the Burgos convention r_Borel=2r_Beilinson in degree j≥2, hence rank-d_j determinant ratio 2^{d_j}; import the associated nonzero rational proportionality to |ζ_F*(1−j)|. The zero-rank determinant is one. For the CM elliptic input use only the corrected ER.5/the-L-value-theorem at L(E,2), its specified maximal order, class-number-one setup, Fourier kernel, conductor and integral cycle U. Transport that supplier’s actual scalar via its regulator comparison; its nonvanishing result is not a spanning theorem for K₂. Export the matrix/determinant versions of these supplied results without creating new regulator definitions.

**Hypotheses.** Exact Borel conventions from R.7, including each real/complex embedding multiplicity. ER.5 supplies its corrected sign, missing roots-of-unity factor and conductor index-set restriction; unresolved supplier corrections remain gates.

**Proof plan.**

1. Read the supplier’s comparison map before taking determinants and multiply one factor 2 per actual rank.
2. Check Q in even j≥2 as a rank-zero case and an imaginary quadratic field in j=2 as rank one.
3. Apply the ER.5 scalar only in its precise CM scope and compare its Bloch and Beilinson regulator conventions; use PS.3 determinant covariance.

**Inputs.** PeriodsAndSpecialValues:PS.3/real-regulator-trivialization, BorelRegulators:R.7/regulator-factor-two, BorelRegulators:R.7/number-field-small-cases, EllipticRegulators:ER.5/the-L-value-theorem, EllipticRegulators:ER.5/nonvanishing-and-what-is-not-claimed.

**Sources.** BF, §3.1, pp. 517–519; §4.3, pp. 535–536: Determinant assembly and conjectural leading terms; arithmetic scalar formulas are imported from the cited supplier nodes.

**Checks.**

- For F=Q and even j≥2, rank zero gives regulator determinant 1, not 0.
- For imaginary quadratic F at j=2 the factor is 2, not 4 and not 1.
- For rank d, the Borel/Beilinson covolume ratio is 2^d in the stated direction.
- An ER.5 nonzero class U does not prove that U spans K₂; its sign and CM hypotheses remain visible.

**Coverage: planned.** Supply L5 and M.8 case-specific regulator/fundamental-line comparisons with the displayed BF/FK signs. General regulator exactness and Beilinson leading terms remain hypotheses.

## PS.4 — Integral fundamental lines and local corrections

Import perfect complexes and their determinant functor, rather than defining either again. Pull the inverse M.8 arithmetic line into Ξ, and compute the resulting finite/local corrections. Integral coherence and real dyadic boundedness are hypotheses with explicit failure tests.

### Integral lattice in the BF line

Target **PeriodsAndSpecialValues:PS.4/integral-fundamental-line** (construction).

Let O_λ be a coefficient DVR with fraction field E_λ and T⊂V_λ(M) a stable finite free lattice. Import Δ_λ(T)=dRΓ_c(T)⁻¹ and its rationalization from M.8/arithmetic-fundamental-line. Assume actual global and local complexes with the required finiteness/perfectness and a proved rational comparison θ_λ:Ξ_E(M)⊗E_λ≃d_{E_λ}RΓ_c(O_{F,S},V). Using the inverse of this imported Δ_λ(T), transport the integral lattice I_λ(M,T,S)=θ_λ⁻¹(d_{O_λ}RΓ_c(O_{F,S},T)) in Ξ_E(M)⊗E_λ. The real comparison is θ_∞ from PS.3. For a general order O⊂A replace DVR lattices by the supplied projective order-structures and determinant objects; a global object Ξ_O requires the BF coherence hypothesis or its explicitly stated substitute. No global integral lattice is inferred just from rational cohomology.

**Hypotheses.** For p odd or no real places use the supplied bounded perfect compact-support model. Real dyadic places require the separate PS.4 gate. Cycle/Chern and p-adic de Rham comparison theorems, integral local finite conditions and projectivity are actual supplier hypotheses.

**Proof plan.**

1. Import M.8’s integral inverse determinant and actual regulator determinant comparison. Invert that line to match BF Ξ, then pull it back along θ_λ. No second construction of Δ or its generic quasi-isomorphism/base-change API is owned here.
2. Apply the generic determinant and the actual θ_λ, then pull back its integral lattice.
3. Use coherence only when assembling all λ into one order object; keep local construction and global gluing separate.

**Inputs.** PeriodsAndSpecialValues:PS.3/rational-fundamental-line, PeriodsAndSpecialValues:PS.3/real-regulator-trivialization, ArithmeticGaloisDuality:D7/compact-support-cochains, ArithmeticGaloisDuality:D7/cochain-finiteness-perfectness, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/selmer-complex, SelmerIwasawaCohomology:L2/condition-change-triangle, SelmerIwasawaCohomology:L2/lattice-change-cone, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line, MotivicEtaleKTheory:M.8/regulator-determinant-comparison, PadicMeasuresIwasawaAlgebras:L5.

**Sources.** BF, §§3.2–3.4, pp. 520–529, especially §3.3 and Lemmas 5–6: Integral structures, rational comparison, choice invariance and global coherence.; BV, §4.3, internal p. 20 (published p. 184), (14): The inverse-line p-adic period–regulator comparison.

**Planning API.**

- **integral_fundamental_line.local_lattice** (constructor): Return I_λ inside the specified rational fundamental line.
- **integral_fundamental_line.quasi_iso** (compatibility): A proved quasi-isomorphism of perfect integral models induces the same determinant object via the determinant functor.
- **integral_fundamental_line.comparison** (projection): Expose θ_λ and θ_∞ with their different coefficient fields and orientations.
- **integral_fundamental_line.base_change** (functoriality): Compatible flat coefficient extension transports the lattice with the derived complex.
- **integral_fundamental_line.coherence** (characterisation): Global order gluing requires the stated coherence/projective structure, not just all local rational spaces.

**Unit tests.**

- **integral_fundamental_line.unit_complex**: The zero complex contributes the unit lattice.
- **integral_fundamental_line.two_term**: Over a DVR, [O→π^a O] interpreted as [O --π^a→ O] in degrees 0,1 is perfect and its acyclic rational determinant lattice is π^a O.
- **integral_fundamental_line.nonperfect**: A torsion module of infinite projective dimension over a nonregular order does not acquire a determinant line merely because it is finite.

**Consumers.** BF Conjecture 4: Provide the integral object whose relative class is RΩ.; PS.6: Retain the torsion and local terms in an actual motivic lattice.

Atlas planet: **Integral fundamental lattice**.

### Finite lattice correction

Target **PeriodsAndSpecialValues:PS.4/finite-lattice-correction** (comparison).

For a bounded perfect complex C over a DVR O, with finite-length cohomology and acyclic fraction-field extension, use dC=⊗_i(det C^i)^{(−1)^i}. Under the canonical rational acyclic trivialization, the determinant lattice is π^{−Σ_i(−1)^i length_O H^i(C)}O. For [O --a→ O] in degrees 0,1 with a≠0 this is aO, matching Fitt_O H¹=(a); shifting the complex by one inverts the lattice. A change T′⊂T of Galois lattice is computed from the actual perfect cone RΓ_c(T/T′) and its comparison triangles. Individual finite quotient corrections need not vanish; only the complete global balance gives the choice-invariance of BF Lemma 5.

**Hypotheses.** Bounded perfectness and finite-length cohomology; coefficient DVR for the valuation formula. For a general noncommutative order replace scalar Fitting equality by the generic relative determinant class; no naive scalar formula is asserted.

**Proof plan.**

1. Specialize L5 and the existing L3/selmer-determinant valuation formula to a DVR, then invert the supplier’s inverse determinant to obtain the displayed dC sign. Use its actual acyclic trivialization.
2. Reduce the valuation calculation to the two-term multiplication complex, fixing the acyclic-trivialization direction.
3. Apply the exact triangle of the actual quotient complex for lattice change and the full local/global cancellation for invariance.

**Inputs.** PeriodsAndSpecialValues:PS.4/integral-fundamental-line, PadicMeasuresIwasawaAlgebras:L5, ArithmeticGaloisDuality:D7/derived-tensor-and-tor, SelmerIwasawaCohomology:L3/selmer-determinant.

**Sources.** BF, §3.3, Lemma 5, pp. 526–528; §3.2, (24), pp. 521–522: Lattice invariance and the distinction between the termwise and acyclic trivializations.

**Checks.**

- [O --π³→ O] maps to π³O, while its degree-one shift maps to π⁻³O.
- A finite H¹=O/π contributes length +1 to the lattice exponent, not −1.
- A unit differential contributes O, and a zero differential is excluded from the acyclic formula.

### Local Euler and Tamagawa determinant corrections

Target **PeriodsAndSpecialValues:PS.4/local-correction-adapter** (comparison).

For v∤p, import the finite local complex quasi-isomorphic to [V^{I_v} --(1−Fr_geom)→ V^{I_v}] in degrees 0,1. When the differential is invertible, its acyclic determinant factor is P_v(1), whereas the local L-value is P_v(1)⁻¹. For v|p use the actual crystalline finite complex, the tangent quotient t_v and the 1−φ comparison triangle of BF (22)–(23), not the v∤p formula. Transport integral kernel/cokernel indices through the supplied local finite-condition complex; in elliptic cases identify the resulting component-group factor with the existing Néron Tamagawa number under its hypotheses. If a local Euler factor vanishes, retain its cohomology and leading-order correction instead of cancelling it.

**Hypotheses.** Integral finite-condition compatibility and the relevant p-adic comparison are proved for the selected representation. Elliptic component-group/Tamagawa comparison and minimal differential normalization come from existing owners.

**Proof plan.**

1. Use local finite/singular triangles and their determinant maps.
2. Compare the rational acyclic trivialization with the termwise cancellation; they differ by det(1−Fr) or det(1−φ).
3. Use the integral cone lengths and actual component-group comparison to identify arithmetic local factors.

**Inputs.** PeriodsAndSpecialValues:PS.4/finite-lattice-correction, PeriodsAndSpecialValues:PS.1/motivic-euler-product, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/selmer-complex, SelmerIwasawaCohomology:L2/condition-change-triangle, SelmerIwasawaCohomology:L2/lattice-change-cone, AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, SelmerIwasawaCohomology:L4/bloch-kato-condition.

**Sources.** BF, §3.2, (19)–(24), pp. 520–522: The two distinct local models, the tangent term and their determinant trivializations.

**Checks.**

- For an unramified rank-one eigenvalue α≠1, the determinant contribution is 1−α, inverse to the L-factor.
- For α=1 the two-term complex has cohomology, so the acyclic formula is unavailable.
- At v|p omitting the tangent quotient fails the Bloch–Kato comparison triangle.

### Real dyadic correction gate

Target **PeriodsAndSpecialValues:PS.4/real-dyadic-gate** (application).

At a real place and p=2, use the imported complete Tate cochains for C₂ and the modified compact-support fibre. For a torsion-free trivial O₂-action, Ĥ^{2k}(C₂,O₂)=O₂/2O₂ and Ĥ^{2k+1}=0; for the sign action these parities reverse. This complete complex is unbounded and cannot be assigned a perfect determinant by deleting its tails. PS.4 integral theorems therefore apply under p odd/no real places or a separately supplied bounded perfect replacement with a proved comparison retaining every two-primary correction. Inverting 2 recovers the bounded comparison, but proves no integral dyadic equality.

**Hypotheses.** ArithmeticGaloisDuality supplies the actual unbounded real complex and duality. No bounded perfect real-dyadic replacement is assumed to exist for arbitrary coefficients.

**Proof plan.**

1. Import the complete two-periodic complex and compute alternating norm/difference maps.
2. Use its nonzero recurring Tate groups to reject bounded perfectness in the stated example.
3. State the precise admissible range of each determinant theorem and leave a separate gap for a selected motivic bounded replacement.

**Inputs.** ArithmeticGaloisDuality:D7/compact-support-without-p, PeriodsAndSpecialValues:PS.4/integral-fundamental-line.

**Sources.** BF, §3.2, pp. 522–523; §3.3, pp. 524–525: Compact-support comparison and the integral structures whose dyadic real extensions require care.

**Checks.**

- Trivial Z₂ gives even Tate group Z/2 and odd group zero.
- The sign lattice reverses the parity.
- Tensoring with Q₂ kills these groups; the integral formula must not be inferred from that rational vanishing.

**Coverage: planned.** Discharge perfectness/coherence and integral local-condition comparisons; resolve the real dyadic gate for any theorem claiming the prime 2.

## PS.5 — Equivariant Tamagawa-number statements

Use the actual relative K-group and extended reduced-norm boundary, then formulate separate order, rationality and integral assertions. Every proved-case adapter names its coefficient order and localization. The abelian Tate family has a source-proof gap and is not counted as an unconditional theorem.

### Equivariant Tamagawa obstruction

Target **PeriodsAndSpecialValues:PS.5/equivariant-obstruction** (construction).

Let A be a finite-dimensional semisimple Q-algebra and O⊂A an order with a projective O-structure on M. Under BF finiteness, real exactness and coherence, form RΩ(M,O)=[Ξ_O(M),θ_∞] in K₀(O,R), in its locally free class subgroup Cl(O,R). Use the extended boundary δ̂:ζ(A_R)×→Cl(O,R) of BF Lemma 9: a rational central multiplier λ makes λx a reduced norm, and the resulting correction is independent of λ. With L* in the real center define TΩ(M,O)=δ̂(L*)+RΩ(M,O). The ordinary noncommutative K₁/reduced-norm/SK₁ data are imported; scalar units alone do not define the equivariant obstruction.

**Hypotheses.** The selected order’s projective structures and global coherence, or an explicitly substituted local formulation of BF Conjecture 5/6. L* has nonzero components and the reality condition needed for ζ(A_R)×; the extended boundary is the actual supplied relative-K map.

**Proof plan.**

1. Import the relative K-group and integral fundamental object, then pair it with θ_∞.
2. Construct the extended boundary through its rational sign correction as in BF Lemma 9; do not assume every real central unit is a reduced norm.
3. Add the analytic and cohomological classes with the displayed plus sign.

**Inputs.** PeriodsAndSpecialValues:PS.4/integral-fundamental-line, PeriodsAndSpecialValues:PS.3/leading-term-line, GeneralAlgebraicKTheory:KU-fundamental, NoncommutativeAndEquivariantIwasawa:NE.3/reduced-norm-sk1-comparison.

**Sources.** BF, Lemma 9, §4.2, pp. 534–535; Conjecture 4, pp. 535–536: Extended boundary, its independence and the sign in TΩ.

**Planning API.**

- **equivariant_obstruction.r_omega** (constructor): Return [Ξ_O,θ_∞] in the relative class group.
- **equivariant_obstruction.extended_boundary** (constructor): Use δ̂ on real central units with the rational multiplier and independence proof.
- **equivariant_obstruction.t_omega** (constructor): Return δ̂(L*)+RΩ.
- **equivariant_obstruction.base_change** (functoriality): Compatible change of order or coefficient algebra transports the entire class, not just its characters.
- **equivariant_obstruction.commutative** (compatibility): For commutative O, vanishing is the exact fundamental-lattice generator assertion under θ_∞.

**Unit tests.**

- **equivariant_obstruction.sign**: TΩ=0 means δ̂(L*)=−RΩ, not δ̂(L*)=RΩ.
- **equivariant_obstruction.quaternion**: A negative real scalar in a Hamilton quaternion component is not a reduced norm; δ̂ still uses its rational sign correction.
- **equivariant_obstruction.characters**: Characterwise reduced-norm equality can leave an SK₁ or localization kernel; it is not automatically equality of K₁ classes.

**Consumers.** BF Conjecture 4: State rationality and integrality in the correct relative group.; NE.7: Compare the determinant and zeta-isomorphism formulations.

Atlas planet: **Equivariant Tamagawa obstruction**.

### Equivariant Tamagawa-number predicate

Target **PeriodsAndSpecialValues:PS.5/etnc-predicate** (definition).

Under the data of PS.5/equivariant-obstruction, define the BF ETNC package as: analytic continuation to 0; componentwise order ord₀L_A(M)=rr_A(H_f¹(M∨(1))^*)−rr_A(H_f⁰(M∨(1))^*); rationality TΩ∈Cl(O,Q) inside Cl(O,R); and integrality TΩ=0. Store these as separate propositions so a proof of analytic rank or rationality is not treated as integrality. Localized variants specify the order O[1/S] or O_λ and the induced relative class. General ETNC remains a conjecture; a theorem must carry the exact motive, order and primes.

**Hypotheses.** Coherence/projective structure and real regulator hypotheses of BF Conjecture 4; all center components and reduced ranks retained.

**Proof plan.**

1. Use the equivariant analytic order and center-valued leading coefficient from BF.
2. Define the two distinct target subgroups/equalities using the imported relative-K maps.
3. Expose projections and localization implications without asserting their converses.

**Inputs.** PeriodsAndSpecialValues:PS.5/equivariant-obstruction.

**Sources.** BF, Conjecture 4(i)–(iv), pp. 535–536; Conjectures 5–6, pp. 536–537: Continuation, reduced-rank order, rationality, integrality and local formulations.

**Planning API.**

- **etnc_predicate.analytic** (projection): Extract the continuation and predicted componentwise order.
- **etnc_predicate.rational** (projection): Extract membership in the rational relative subgroup.
- **etnc_predicate.integral** (projection): Extract TΩ=0 for the specified order.
- **etnc_predicate.localize** (functoriality): A global equality implies each localized equality by the relative-K map.
- **etnc_predicate.recover_scalar** (compatibility): For one commutative coefficient component recover θ_∞(Ξ_O)=(L*)⁻¹O, equivalently the FK generator ζ with value L*.

**Unit tests.**

- **etnc_predicate.rational_only**: A nonzero rational relative class satisfies rationality but fails integrality.
- **etnc_predicate.odd_primes**: An equality over Z[1/2][G] makes no assertion about the Z₂[G] component.
- **etnc_predicate.rank_term**: Both H_f¹(M∨(1))^* and H_f⁰(M∨(1))^* occur in the predicted order; deleting the second fails the trivial-motive pole case.

**Consumers.** PS.6: Distinguish p-primary and all-prime special-value assertions.; PS.7: Keep general ETNC among the explicit research predicates.

Atlas planet: **Equivariant Tamagawa-number conjecture**.

### Zeta-isomorphism orientation adapter

Target **PeriodsAndSpecialValues:PS.5/zeta-orientation-adapter** (comparison).

Import the FK zeta-isomorphism conjecture from NE.7, not a second definition: ζ_Λ(T):1_Λ→d_ΛRΓ_c(U,T)⁻¹, with T=Λ⊗Z_p T_p and g(x⊗y)=x ḡ⁻¹⊗g(y). Under specialization by a motivic representation ρ, use the dual twist M(ρ*) and the supplied generalized base change. With Δ=Ξ⁻¹, ζ_E:1→Δ has θ_∞,FK(ζ_E)=L*, while θ_λ identifies Δ_λ with dRΓ_c(V)⁻¹. Prove that these identifications yield the BF vanishing equation with its chosen sign. Local epsilon isomorphisms and duality are additional imported conjectural/theorem data, not consequences of the bare existence of a scalar L-value.

**Hypotheses.** p odd in the BV/NE formulation; all NE.7 arithmetic perfectness and base-change hypotheses. The original Fukaya–Kato proof text was not acquired; this target uses the precise BV restatement and the existing NE supplier, with a collation gap.

**Proof plan.**

1. Match each factor of Δ with the inverse BF object, then match the real and p-adic trivializations.
2. Check the diagonal Galois action and the appearance of ρ*, rather than ρ.
3. Apply the supplier’s determinant/zeta-to-relative-boundary comparison and retain the local epsilon/duality normalization.

**Inputs.** PeriodsAndSpecialValues:PS.5/etnc-predicate, PeriodsAndSpecialValues:PS.3/rational-fundamental-line, NoncommutativeAndEquivariantIwasawa:NE.7/fukaya-kato-zeta-isomorphism, NoncommutativeAndEquivariantIwasawa:NE.7/local-epsilon-isomorphism.

**Sources.** BV, §4.3, Conjecture 4.1, internal pp. 20–21 (published pp. 184–185): The inverse fundamental line, dual specialization and leading-term normalization.

**Checks.**

- The zeta target is dRΓ_c⁻¹, not dRΓ_c.
- Specialization produces M(ρ*), and the Galois action contains ḡ⁻¹.
- The commutative comparison recovers δ̂(L*)+RΩ=0 in BF orientation.

### Scoped Tate, Artin and abelian adapters

Target **PeriodsAndSpecialValues:PS.5/proved-case-adapters** (comparison).

For any supplied proved ETNC case, transport the full relative class through BF Theorems 3.1 and 4.1 (coefficient extension, restriction and Morita equivalence), recording motive, order, localization and reduced-norm ambiguity. The abelian Tate test family is L/Q finite abelian, K⊂L and r≤0 with pair (h⁰(Spec L)(r), Z[1/2][Gal(L/K)]); its proof is requested from the integral-Iwasawa owner with the original Burns–Greither theorem and all descent hypotheses, rather than inferred from Dirichlet algebraicity. For BV Theorem 5.5 use the exact NE.7 Tate interpolation contract including the p-adic Stark assumption and existence of ζ; it is a conditional comparison. For Corollary 5.7 retain the supplier’s Q-valued-character restriction, Leopoldt and the exponent n_ρ; permutation characters have n_ρ=1. No arbitrary Artin, dyadic or noncommutative ETNC theorem is deduced.

**Hypotheses.** Each arithmetic theorem is imported with its exact statement/proof gate; BF Remark 10 alone is a bibliographic lead for the Burns–Greither case. An annihilator or Fitting-ideal theorem does not supply a relative determinant equality without the integral-Iwasawa comparison.

**Proof plan.**

1. Import the exact Tate/abelian theorem and compare its determinant orientation/order/localization.
2. Use BF functoriality to transport its class, retaining any kernel of the map.
3. For the NE Tate interpolation cases apply only the supplier’s actual hypotheses, without treating conjectural zeta or Stark inputs as established.

**Inputs.** PeriodsAndSpecialValues:PS.5/zeta-orientation-adapter, IntegralIwasawaTheory:I.7, NoncommutativeAndEquivariantIwasawa:NE.7/tate-motive-interpolation, NoncommutativeAndEquivariantIwasawa:NE.7/tate-motive-interpolation-rational.

**Sources.** BF, Theorems 3.1/4.1, pp. 529–533 and 538–541; Remark 10, p. 537: Functoriality and the exact known abelian Tate range; the original arithmetic proof is an explicit supplier obligation.; BV, Theorem 5.5 and Corollary 5.7, internal pp. 25–27 (published pp. 189–191): Conditional interpolation and its character/exponent qualifications.

**Checks.**

- For r=0 in the abelian Tate family retain Z[1/2][G], without claiming the omitted dyadic component.
- For a permutation character the exponent is 1; a general rational character may only give an n_ρ-th-power identity.
- An SK₁ ambiguity cannot be removed just by comparing scalar Artin evaluations.

**Coverage: planned.** Acquire original FK/Burns–Greither locators and reviewed theorem-scope witnesses; discharge relative K-group/order-structure contracts. General ETNC remains a predicate.

## PS.6 — BSD and Bloch–Kato assembly

Identify the existing elliptic invariants with the conditional fundamental-line factors, then import BSD.8’s all-prime assembly. State the original Bloch–Kato Tamagawa predicate only in its weight scope, and state the distinct LTXZZ rank prediction and theorem-import gates for Rankin motives.

### Bloch–Kato motivic pair

Target **PeriodsAndSpecialValues:PS.6/bloch-kato-motivic-pair** (definition).

A BK motivic pair over Q consists of finite-dimensional Q-spaces V,D, a continuous finite-adelic Galois action on V⊗A_f preserving V under the selected real conjugation, a decreasing exhaustive separated filtration D^i, filtered comparisons D⊗Q_p≃D_dR(V_p) and D⊗R≃(V⊗C)^+ for the diagonal real action. Impose all four axioms of BK Definition 5.5: (P1) outside finitely many p every V_ℓ with ℓ≠p is unramified and V_p is crystalline; (P2) for every rational lattices T⊂V and L⊂D, outside finitely many p the filtered crystalline module admits integers i≤0,j≥1 with D^i=D,D^j=0,j−i<p, L⊗Z_p is strongly divisible, and its supplied Fontaine–Laffaille realization equals T⊗Z_p; (P3) for each p all local polynomials P_p(V_ℓ,u), including the crystalline ℓ=p polynomial, lie in Q[u] and agree; (P4) at each p there is a stable adelic lattice whose unramified H⁰ with ℓ-primary divisible coefficients is divisible for almost all ℓ. Weight ≤w means all local reciprocal roots have absolute value ≤p^(w/2) and D_∞^i∩V_∞^+=0 for i>w/2. A triple additionally supplies finite-dimensional Φ, R_∞:Φ⊗R≃D_∞/(D_∞⁰+V_∞^+) and R_Gal:Φ⊗A_f≃H_f,Spec(Z)¹(Q,V⊗A_f). Being induced by a geometric motive is an additional actual realization/regulator identification, never a consequence of these axioms alone.

**Hypotheses.** Import the actual adelic/Galois representations, period modules and small-weight strongly divisible realization; comparisons are morphisms of those objects. BK finite Selmer cohomology is the imported condition finite at every finite place. No unproved geometric P3/P4 or regulator bijectivity is silently inserted.

**Proof plan.**

1. Assemble the displayed comparisons and four testable axioms on genuine supplied objects.
2. Import L4 small-weight crystalline realization for P2; the forbidden finite set may depend on both lattices.
3. Form weight bounds and the two triple comparison maps; keep the assertion of geometric origin separate.

**Inputs.** MotivesAndAlgebraicCycles:MC.2/realization-equivalence, MotivicEtaleKTheory:M.8/regulator-determinant-comparison, SelmerIwasawaCohomology:L4/period-realization, SelmerIwasawaCohomology:L4/fontaine-laffaille-data, SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison, SelmerIwasawaCohomology:L2/galois-selmer-group.

**Sources.** BK, Definition 5.5 and 5.5.1, pp. 371–372; triple comparisons, p. 374; §4 Theorem 4.1(iii), p. 362: Actual axioms, weight bound and real/adelic regulator identifications.

**Planning API.**

- **bloch_kato_motivic_pair.realizations** (projection): Expose V,D, filtration, all continuous coefficient actions and the actual comparison maps.
- **bloch_kato_motivic_pair.axioms** (projection): Expose P1–P4 separately, including the lattice-quantified P2 and every-prime P3.
- **bloch_kato_motivic_pair.weight** (characterisation): Check local reciprocal-root bounds and the real filtration/invariants condition.
- **bloch_kato_motivic_pair.triple** (constructor): Add Φ and the two specified regulator isomorphisms, not arbitrary one-dimensional identifications.
- **bloch_kato_motivic_pair.geometric_origin** (compatibility): A claimed geometric instance includes the actual maps from its motivic cohomology and an explicit proof/assumption of every axiom.

**Unit tests.**

- **bloch_kato_motivic_pair.finite_bad_set**: In a supplied rank-one Tate comparison, changing the de Rham lattice L to qL while fixing the Betti lattice T forces q into the P2 bad set; one fixed finite set cannot serve all rational lattice changes.
- **bloch_kato_motivic_pair.all_prime**: Agreement of P_p(V_ℓ) only for ℓ≠p fails P3 unless the crystalline factor is also matched.
- **bloch_kato_motivic_pair.real_weight**: A nonzero unit motive has V_∞^+≠0 and D_∞⁰=D_∞, so it fails weight ≤−3 at i=0.

**Consumers.** BK Conjecture 5.15: Specify the genuine input type and regulator comparisons before defining a Tamagawa identity.; PS.6 fixed-prime boundary: Explain which adelic/global axioms are absent from a weaker localized formulation.

### Bloch–Kato points and Tamagawa measure

Target **PeriodsAndSpecialValues:PS.6/bloch-kato-points-and-measure** (construction).

For a BK triple of weight ≤−3 and stable lattice T, set A_T(Q_p)=H_f¹(Q_p,T⊗Zhat) for finite p, and A_T(R)=((D_∞⊗C)/(D_∞⁰⊗C+T))^+ with the diagonal real action. Define A_T(Q) as the inverse image of R_Gal(Φ) inside H_f,Spec(Z)¹(Q,T⊗Zhat). Its rationalization is Φ and its completion is the integral finite Selmer group. Use the supplied BK exponential D_p/D_p⁰→A_T(Q_p), a local isomorphism, to transfer the Haar measure from a rational top-form trivialization ω of det(D/D⁰). At all sufficiently good p its total mass is P_p(V,1). Weight ≤−3 gives convergence of the product of these masses; define μ as the product of finitely many bad/real measures and the good-prime probability product scaled by ∏P_p(V,1). Since μ_p,aω=|a|_p μ_p,ω, the rational product formula makes μ independent of ω. Choose a lift of the real regulator A_T(Q)→A_T(R)/A_T(R)_cpt to define the diagonal arithmetic subgroup; its real image is discrete and cocompact. Set Tam(T) to the induced quotient volume of ∏_{p≤∞}A_T(Q_p)/A_T(Q). Finally Sha(T)=ker[H¹(Q,T⊗Q/Z)/(A_T(Q)⊗Q/Z)→⊕_{p≤∞}H¹(Q_p,T⊗Q/Z)/(A_T(Q_p)⊗Q/Z)]. This is BK’s arithmetic kernel, not a definition by selecting an arbitrary finite group.

**Hypotheses.** Use actual cohomology and local exponential maps from the suppliers, with their topology and the triple comparisons. Every Haar measure uses its Borel structure and local compactness. Prove probability normalization before infinitePi; the real regulator gives the discrete/cocompact quotient, and the quotient volume is independent of the lift.

**Proof plan.**

1. Construct local points from imported finite cohomology and the stated real quotient; use BK Theorem 4.1 and P1–P4 for the exponential local isomorphism and good mass.
2. Construct global points by the stated inverse image, using the actual adelic comparison to establish finite generation, rationalization and completion.
3. Normalize good compact factors to probability measures, apply the existing infinite product measure, and restore the convergent mass product. Use the rational product formula for top-form independence.
4. Use the real regulator to establish the arithmetic quotient and independence from the real lift; define its volume.
5. Construct the quotient-localization map on the actual groups and take its kernel. Apply BK Lemma 5.10 and Proposition 5.14 with their hypotheses; do not replace total finiteness by primary finiteness.

**Inputs.** PeriodsAndSpecialValues:PS.6/bloch-kato-motivic-pair, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L4/bloch-kato-condition, SelmerIwasawaCohomology:L4/period-fundamental-sequences, mathlib:MeasureTheory.Measure.haarMeasure, mathlib:MeasureTheory.Measure.infinitePi.

**Sources.** BK, (5.6)–(5.8), pp. 372–373; Definition 5.9 and triple/global points, pp. 373–374; Lemma 5.10, (5.11)–(5.13) and Proposition 5.14, pp. 375–376: Local/global points, exponential normalization, product measure, quotient volume and arithmetic kernel.

**Planning API.**

- **bloch_kato_points_and_measure.local_points** (constructor): Return the finite-cohomology local group or the displayed real quotient.
- **bloch_kato_points_and_measure.global_points** (constructor): Return the inverse image of the actual regulator image; expose rationalization and completion maps.
- **bloch_kato_points_and_measure.local_mass** (compatibility): Outside a proved finite set the ω-normalized local total mass is P_p(V,1).
- **bloch_kato_points_and_measure.tamagawa_measure** (constructor): Return the product measure with the convergent good-prime mass factor and its top-form independence.
- **bloch_kato_points_and_measure.quotient_volume** (projection): Return the quotient volume with its discrete/cocompact and lift-independence witnesses.
- **bloch_kato_points_and_measure.sha** (constructor): Return the kernel of the displayed quotient-localization map.

**Unit tests.**

- **bloch_kato_points_and_measure.good_factor**: In a one-dimensional good factor P_p(1)=1−a_p with |a_p|≤p^(−3/2), its mass is 1−a_p, not its inverse.
- **bloch_kato_points_and_measure.probability**: Passing unnormalized good Haar factors to infinitePi is invalid: a factor of mass different from 1 must first be normalized and its mass restored.
- **bloch_kato_points_and_measure.rational_form**: Scaling ω by 2 multiplies the real measure by 2 and the 2-adic measure by 1/2, leaving the global measure unchanged.
- **bloch_kato_points_and_measure.torsion**: The global torsion is H⁰(Q,T⊗Q/Z) by Lemma 5.10; the conjecture’s dual-torsion numerator is a different group.
- **bloch_kato_points_and_measure.zero**: For V=D=Φ=0 and T=0 every point group and Sha are zero, the quotient measure has total mass 1 and Tam(T)=1.

**Consumers.** BK Conjecture 5.15: Provide the actual Tamagawa number and Sha whose equality the next target predicts.; PS.6: Prevent an abstract regulator scalar or a finite p-primary list from standing for a global Tamagawa construction.

### Elliptic fundamental-line adapter

Target **PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter** (comparison).

For E/Q with a fixed global minimal Néron differential, identify the supplied motivic realization H¹(E)(1) of weight −1, its Kummer/finite Selmer cohomology, real regulator exact sequence and integral local terms. Under the required finiteness and comparison hypotheses, translate its commutative fundamental-line assertion into L^(r)(E,1)/r!=Ω_E Reg_E·#Sha(E/Q)·∏_p c_p/#E(Q)_tors². Here r=rank E(Q), Ω_E is the integral of |ω| over all E(R) components, Reg is the determinant of the existing Néron–Tate pairing on a basis of E(Q)/tors, empty determinant 1, and c_p are the actual Néron component-group numbers. An index-m subgroup basis multiplies Reg by m². The equivalence is conditional on the actual regulator and integral Kummer/Tamagawa identifications, not an independent proof of BSD.

**Hypotheses.** Mordell–Weil finite generation, heights, local reduction/Tamagawa numbers and Selmer/Sha from the existing EllipticCurves roadmap. Sha finiteness and analytic leading term are assumptions unless a separate theorem supplies them; include the real dyadic gate.

**Proof plan.**

1. Import the actual weight −1 motive and Kummer comparison; use BK Proposition 5.4 to separate Selmer information from Sha finiteness.
2. Identify each cohomology/determinant factor with its Mordell–Weil, height, torsion and local component-group counterpart.
3. Check the all-components period and exact minimal differential, then translate Ξ versus Δ orientation to the displayed scalar equality.

**Inputs.** PeriodsAndSpecialValues:PS.4/local-correction-adapter, PeriodsAndSpecialValues:PS.4/real-dyadic-gate, PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations, RankZeroOneBSD:BSD.8/elliptic-endpoint, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii, tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4.

**Sources.** BK, Proposition 5.4, pp. 370–371; §5, pp. 374–377: Abelian Kummer/Selmer comparison and the distinct arithmetic finiteness assumptions.; BF, §3.1, pp. 517–519; Conjecture 4, pp. 535–536: Weight −1 height exactness and the integral fundamental-line conjecture.

**Checks.**

- At r=0, Reg=1, so a zero regulator determinant cannot be used.
- If E(R) has two components, Ω_E is twice the identity-component integral.
- Replacing a Mordell–Weil basis by an index-3 subgroup basis multiplies Reg by 9 and requires the corresponding determinant-index correction.
- A rational cohomology identification alone does not remove the squared torsion denominator.

### BSD prime-by-prime assembly adapter

Target **PeriodsAndSpecialValues:PS.6/bsd-prime-assembly** (application).

Import the BSD.8 endpoint, real identity and source-qualified prime-part dispatch. For analytic rank 0 or 1, a proof packet must separately supply rank equality, finiteness of Sha and the positive real identity, then the p-adic valuation equality at every prime in the finite support certified by the BSD owner. Transport that owner’s all-prime conclusion into the PS.4 line. No new prime-dispatch algorithm is defined here. If even one required prime, including 2 or a bad/residual prime, lacks a proved source-qualified gate, export only the proved localized statement and retain that exact unresolved prime in the integral assertion. Higher-rank BSD remains conjectural.

**Hypotheses.** All hypotheses of the actual BSD.8 theorem, including periods, differential, curve, analytic rank and exceptional-prime handling. No finiteness of Sha is inferred from its cardinality appearing in a desired identity.

**Proof plan.**

1. Match the PS.6 scalar identity to BSD.8’s elliptic endpoint and Ω convention.
2. Apply its existing finite-support and valuation reconstruction only with all gates supplied.
3. Translate the result through the elliptic fundamental-line adapter, without strengthening a localized equality to an integral one.

**Inputs.** PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter, RankZeroOneBSD:BSD.8/real-identity, RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch, RankZeroOneBSD:BSD.8/individual-full-bsd-from-exceptions.

**Sources.** BF, Conjecture 4(iv), pp. 535–536; local formulation Conjecture 6, pp. 536–537: Integral versus localized leading-term assertions; arithmetic rank-zero/one proofs are imported from BSD.8.

**Checks.**

- A proof away from 2 retains an unresolved dyadic gate.
- A proved rank equality alone gives neither #Sha nor the leading coefficient.
- When BSD.8 provides every source-qualified prime gate, its all-prime equality transports without redoing rational reconstruction.

### Bloch–Kato Tamagawa predicate

Target **PeriodsAndSpecialValues:PS.6/bloch-kato-tamagawa** (definition).

For a motivic triple (V,D,Φ) in the precise Bloch–Kato §§5.5–5.11 sense, of weights ≤−3, with the actual real and adelic regulator identifications, let T⊂V be a Z-lattice whose adelic extension is Galois stable. Use PS.6/bloch-kato-points-and-measure’s global points A(Q), local points A(Q_v), finite-condition kernel Sha(T) of (5.12)–(5.13), and Tamagawa measure of Definition 5.9 to define BK_Tam(V,D,Φ,T) as: Sha(T) is finite and Tam(T)=#H⁰(Q,T*⊗Q/Z(1))/#Sha(T). Here T*=Hom_Z(T,Z). Both total finiteness and the equality are conjectural in general. The fixed-ℓ formulation of Remark 5.15.2 is a separate localized statement under its weaker ℓ-adic/regulator hypotheses; it does not imply finiteness over all primes. Weight −1 elliptic BSD uses its separately stated height formulation rather than being forced into this weight-≤−3 definition.

**Hypotheses.** The triple comes from an actual motive and satisfies BK’s motivic-pair axioms; their global regulator identifications are supplied, not asserted from a tuple. The actual global/local groups, normalized measures and kernel are built by the preceding PS.6 assembly from the imported arithmetic/analytic objects; this target owns the conjectural equality.

**Proof plan.**

1. Use the preceding actual points/measure construction, including top-form and real-lift independence, then apply the rational product formula.
2. Define the conjunction of finiteness and the precise Tamagawa identity.
3. Use BK Proposition 5.14 for change of lattice only under its hypotheses and distinguish the single-prime variant.

**Inputs.** PeriodsAndSpecialValues:PS.4/integral-fundamental-line, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/selmer-complex, SelmerIwasawaCohomology:L2/condition-change-triangle, SelmerIwasawaCohomology:L2/lattice-change-cone, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line, MotivicEtaleKTheory:M.8/regulator-determinant-comparison, SelmerIwasawaCohomology:L4/bloch-kato-condition, PeriodsAndSpecialValues:PS.6/bloch-kato-motivic-pair, PeriodsAndSpecialValues:PS.6/bloch-kato-points-and-measure.

**Sources.** BK, Definition 5.5, pp. 371–372; Definition 5.9 and (5.11)–(5.13), pp. 373–375; Proposition 5.14 and Conjecture 5.15/Remark 5.15.2, pp. 375–377: Original weight range, measure/kernel formula, lattice invariance and distinction between all-prime and fixed-prime statements.

**Planning API.**

- **bloch_kato_tamagawa.finiteness** (projection): Extract total finiteness of Sha(T), not just each primary part.
- **bloch_kato_tamagawa.identity** (projection): Extract the Tamagawa quotient with the dual-torsion numerator.
- **bloch_kato_tamagawa.volume_form** (compatibility): Changing a rational top form rescales local measures by normalized absolute values with product 1.
- **bloch_kato_tamagawa.lattice_change** (compatibility): Use BK Proposition 5.14 to transport the conjecture between stable lattices in the same rational realization.
- **bloch_kato_tamagawa.localized** (projection): A global identity implies its fixed-ℓ version; a single localized version has no converse to total finiteness.

**Unit tests.**

- **bloch_kato_tamagawa.weight_range**: A weight −1 elliptic realization is outside this exact definition; Q(2) has weight −4 and is in range when its motivic data are supplied.
- **bloch_kato_tamagawa.primary_finiteness**: The group ⊕_p Z/p has finite p-primary parts but is infinite, so primary finiteness cannot witness the global predicate.
- **bloch_kato_tamagawa.product_formula**: Scaling the top form by a nonzero rational a changes the product measure by ∏_v|a|_v=1.

**Consumers.** PS.6/PS.7: Keep the original Tamagawa conjecture separate from BSD and general ETNC.; BK Remark 5.15.2: Allow precisely stated fixed-prime tests without hidden global hypotheses.

Atlas planet: **Bloch–Kato Tamagawa conjecture**.

### Rankin–Selberg BBK prediction

Target **PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction** (definition).

Let F/F⁺ be CM, n≥2, and n₀,n₁ the even and odd members of {n,n+1}. Let Π_α be relevant representations of GL_{n_α}(A_F): irreducible cuspidal, conjugate self-dual, with infinity principal-series characters arg^{1−n_α},arg^{3−n_α},…,arg^{n_α−1}. For a common strong coefficient field E and the supplied Galois systems put V_λ=ρ_{Π₀,λ}⊗ρ_{Π₁,λ}(n), normalized to weight −1. Define BBK_rank01 to assert, for every coefficient place λ, L(1/2,Π₀×Π₁)≠0 implies H_f¹(F,V_λ)=0, and global epsilon −1 together with L′(1/2,Π₀×Π₁)≠0 implies dim_{E_λ}H_f¹(F,V_λ)=1. This interface predicts ranks, not an integral leading-term equality or Sha finiteness. The diagonal Abel–Jacobi class Δ_λ lies in a finite direct sum of copies of this Selmer group; its nonvanishing and derivative nonvanishing are separate propositions.

**Hypotheses.** Relevant representation and strong coefficient field carriers, Galois systems, Rankin analytic normalization and Bloch–Kato local conditions supplied by their owners. The analytic center 1/2 and Tate twist n are transported together; no unproved automorphic tensor-product representation is assumed.

**Proof plan.**

1. Import Π_α and the normalized Galois tensor product, then the actual finite-condition Selmer group.
2. Form the two implication predicates with their quantifier over all λ.
3. Name the diagonal-cycle class only through its actual Abel–Jacobi construction from the arithmetic level-raising supplier.

**Inputs.** PeriodsAndSpecialValues:PS.1/serre-system-predicate, SelmerIwasawaCohomology:L2/galois-selmer-group, SelmerIwasawaCohomology:L2/selmer-complex, SelmerIwasawaCohomology:L4, AutomorphicLFunctionsAndLocalFactors:AL.5, SelmerIwasawaCohomology:L4/bloch-kato-condition.

**Sources.** LTXZZ, §1.1, Definition 1.1.3 and Theorems 1.1.5/1.1.9, published pp. 110–113: Relevant representations, normalization and the two conjectural rank implications; extraction item PAPER-LIU-ETAL-22/beilinson-bloch-kato fixes the ownership boundary.

**Planning API.**

- **rankin_bbk_prediction.rank_zero** (projection): Extract the nonzero-central-value implication for any λ.
- **rankin_bbk_prediction.rank_one** (projection): Extract the epsilon −1/nonzero-derivative implication for any λ.
- **rankin_bbk_prediction.twist** (compatibility): Changing motivic normalization moves the center and twist together.
- **rankin_bbk_prediction.coefficient_extension** (compatibility): A proved Selmer base-change isomorphism preserves its dimension under extension of E_λ.
- **rankin_bbk_prediction.class_gate** (relation): Δ_λ≠0 is a separate supplied assertion; converting it to L′≠0 requires the stated height and injectivity conjectures.

**Unit tests.**

- **rankin_bbk_prediction.one_place**: A rank statement at one admissible λ does not witness the universally quantified prediction.
- **rankin_bbk_prediction.sign**: The derivative implication requires epsilon −1; deleting it changes the stated conjectural interface.
- **rankin_bbk_prediction.direct_sum**: A nonzero vector in H_f¹⊕…⊕H_f¹ gives a nonzero Selmer group, but is not by itself a dimension-one proof.

**Consumers.** LTXZZ §1.1 and PAPER-LIU-ETAL-22: Provide the PS.6 conjectural interpretation, separate from the paper’s scoped proof routes.; PS.7: List rank predictions without asserting any general integral formula.

Atlas planet: **Rankin–Selberg BBK prediction**.

### Rankin rank-zero and rank-one import gates

Target **PeriodsAndSpecialValues:PS.6/rankin-proved-scope** (comparison).

For the preceding Π₀,Π₁ with F⁺≠Q and λ admissible in the full LTXZZ Definition 8.1.1 sense (all L1–L7, not merely λ∤conductor), the published statements are: Theorem 1.1.5/8.2.2, nonzero central value gives H_f¹(F,V_λ)=0; Theorem 1.1.9/8.3.2, Δ_λ≠0 gives dim H_f¹=1. Import either as an unconditional theorem only after the arithmetic level-raising/Euler-system owner resolves its recorded proof gates. PAPER-LIU-ETAL-22 records unresolved issues in these routes, so the present plan uses them only through an explicit supplier witness. Upgrading the rank-one class premise to L′≠0 additionally requires the height formula of Conjecture 8.3.1 and Beilinson Abel–Jacobi injectivity. No all-λ, all-prime or integral equality follows.

**Hypotheses.** The supplying Part II of SelmerIwasawaCohomology, routed as ArithmeticLevelRaisingAndBipartiteEulerSystems, must provide the actual class construction and reviewed proof-route contracts. The n=2/F⁺=Q relaxation in Remark 1.1.10 has its own proof route and is not inferred from the displayed F⁺≠Q statements.

**Proof plan.**

1. Match the full admissibility predicate and the precise Π/Galois normalization.
2. Require a supplier witness discharging the inherited extraction gates before applying a published conclusion.
3. For the derivative interpretation add the two separate conjectural comparison premises; retain the finite-direct-sum class target.

**Inputs.** PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction, SelmerIwasawaCohomology:L4.

**Sources.** LTXZZ, Theorems 1.1.5 and 1.1.9; Remark 1.1.10, published pp. 111–113: Exact ranks, coefficient-prime scope and the distinct derivative-versus-cycle premise.

**Checks.**

- An excluded/nonadmissible λ remains a gate even when the central value is nonzero.
- Δ_λ≠0 proves neither L′≠0 nor an integral formula without additional comparison theorems.
- The 126 issues in the routed extraction are not silently regarded as repaired or independently verified here.

**Coverage: planned.** Discharge the conditional elliptic local/regulator comparison including 2, and the routed Rankin proof/derivative gates. All-prime BSD reconstruction is imported from BSD.8.

## PS.7 — Certified computations and the research boundary

Use actual integrals with provable analytic errors and imported sound interval arithmetic. A numerical candidate becomes an exact value only through a symbolic identity or a proved discrete membership/separation premise. The general conjectures remain individually named predicates.

### Certified period quadrature examples

Target **PeriodsAndSpecialValues:PS.7/period-quadrature** (construction).

Specialize imported rational interval arithmetic and certified subdivision to actual period integrals. First π/4=∫₀¹dx/(1+x²): for S_N=Σ_{k=0}^N(−1)^k/(2k+1), the remainder has sign (−1)^{N+1} and absolute value ≤1/(2N+3), giving rational endpoints. Second, for rational 0<λ<1 define K_λ=∫₀¹dt/√((1−t²)(1−λt²)), as an improper endpoint integral. With t=2u/(1+u²), K_λ=∫₀¹ f_λ(u)du, f_λ(u)=2/√D_λ(u), D_λ(u)=(1+u²)²−4λu². On [0,1], D_λ≥1−λ and |f′_λ|≤8/(1−λ)^(3/2). Thus N≥1 midpoint panels have error ≤2/[N(1−λ)^(3/2)]. Replace this real bound by any certified larger rational and enclose every square root by positive rational square inequalities, adding the accumulated arithmetic widths. For y²=x(1−x)(1−λx), ω=dx/(2y), the oriented real oval over [0,1] has period 2K_λ. This is a specified cycle period; an all-components Néron period requires the separate elliptic adapter.

**Hypotheses.** Use exact rational λ, positive radicands and the actual branch/orientation. CN.4 supplies interval arithmetic, outward rounding and finite rational error accumulation; generic quadrature is not redefined.

**Proof plan.**

1. For the arctangent example integrate the finite geometric identity and bound the signed remainder.
2. For the elliptic example prove the rational substitution on truncated intervals and pass to the integrable endpoint limit; cancellation gives the nonsingular f_λ.
3. Use D=(1−u²)²+4(1−λ)u² or D≥(1−λ)(1+u²)² to prove positivity and the derivative bound.
4. For N equal panels integrate the Lipschitz midpoint error L/(4N), then combine rational enclosure and rounding errors.
5. Apply the actual cycle/form substitution to obtain 2K_λ, preserving the oval orientation.

**Inputs.** PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations, ComputationalNumberTheory:CN.4/rational-interval-product, ComputationalNumberTheory:CN.4/rational-interval-product-sound, ComputationalNumberTheory:CN.4/outward-dyadic-rounding, ComputationalNumberTheory:CN.4/outward-rounding-width, ComplexComparisonPartII:C5/repair-proper-de-rham-betti, ComplexComparisonPartII:C5/multiplicative-period-interface, mathlib:intervalIntegral, mathlib:intervalIntegral.norm_integral_le_of_norm_le, mathlib:intervalIntegral.integral_comp_mul_deriv', mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence.

**Sources.** Johansson, §§1–2, pp. 1–3: Validated interval subdivision and the requirement to certify analytic domains and branches; the explicit two integrands and elementary bounds are specializations proved here.

**Planning API.**

- **period_quadrature.arctan_bounds** (constructor): Return rational bounds from S_N and its signed remainder, enclosing π/4.
- **period_quadrature.legendre_integrand** (data): Return f_λ with its rational polynomial D_λ and positive square-root branch.
- **period_quadrature.legendre_change_variable** (compatibility): Identify the endpoint integral K_λ with the regular integral of f_λ.
- **period_quadrature.midpoint_bound** (characterisation): For N≥1 the exact midpoint sum differs from K_λ by at most 2/[N(1−λ)^(3/2)].
- **period_quadrature.rounded_enclosure** (constructor): Return rational endpoints with the analytic and rounding errors both added.
- **period_quadrature.elliptic_cycle** (compatibility): The explicitly oriented oval period of dx/(2y) is 2K_λ, not K_λ or an unspecified total period.

**Unit tests.**

- **period_quadrature.arctan_first**: N=0 gives 2/3≤π/4≤1; N=1 gives 2/3≤π/4≤13/15.
- **period_quadrature.lambda_half**: For λ=1/2, D_λ(u)=1+u⁴≥1, so no endpoint branch singularity remains after substitution.
- **period_quadrature.wrong_branch**: Choosing the negative square root reverses the period sign and is rejected by the positive-branch certificate.
- **period_quadrature.endpoint_excluded**: λ=1 is excluded: K_λ diverges and the bound’s denominator vanishes.

**Consumers.** PS.7 normalization tests: Provide reproducible rigorous enclosures for a rational-period integral and a genuine elliptic cycle.; PS.8: Illustrate why an analytic function approximation needs an actual geometric period comparison.

Atlas planet: **Certified period quadrature**.

### Certified normalized-value enclosure

Target **PeriodsAndSpecialValues:PS.7/normalized-enclosure** (construction).

Given a supplied L-value or derivative enclosure, a nonzero period enclosure excluding 0, exact algebraic correction factors with their chosen embeddings, and the proved period-identification map, construct an outward rational complex box enclosing the normalized finite value. Import Dirichlet exact factors from L0, analytic GL1/GL2 formulas and zero-factor leading corrections from AL.1/AL.5, and certified L-enclosures from CN.4. Division requires a certified lower bound for the denominator norm. An exact algebraic recognition theorem additionally requires a separately proved discrete candidate set and separation bound, or an exact symbolic identity; interval overlap alone is only a numerical test.

**Hypotheses.** Each enclosure comes with its soundness theorem and all truncation/rounding errors; exact coefficient field and complex embeddings fixed. At exceptional zeros use leading terms and the matching derivative orders, not division by a zero correction.

**Proof plan.**

1. Transport all exact normalization maps first, including finite/completed distinction, Tate factors and Euler corrections.
2. Apply the imported product/inverse/rounding soundness to combine numerator, denominator and algebraic-factor boxes.
3. For exact recovery use the supplier’s integer/algebraic separation certificate only with a proved membership premise.

**Inputs.** PeriodsAndSpecialValues:PS.1/dirichlet-tate-adapter, PeriodsAndSpecialValues:PS.1/modular-period-adapter, PeriodsAndSpecialValues:PS.7/period-quadrature, DirichletPadicLFunctions:L0/normalized-value-complex-embedding, AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term, ComputationalNumberTheory:CN.4/complex-box-denotation, ComputationalNumberTheory:CN.4/rational-interval-inverse, ComputationalNumberTheory:CN.4/rational-interval-inverse-sound, ComputationalNumberTheory:CN.4/dirichlet-l-value-enclosure, ComputationalNumberTheory:CN.4/cusp-l-value-enclosure, ComputationalNumberTheory:CN.4/integer-recovery-sound, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation, AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors.

**Sources.** Johansson, §§1–2, pp. 1–3: Sound enclosures and rigorously bounded truncation; exact normalization is supplied by the cited arithmetic adapters.

**Planning API.**

- **normalized_enclosure.enclose** (constructor): Return a box with a proof that it contains the specified normalized finite value.
- **normalized_enclosure.denominator** (projection): Expose a strict positive lower bound for the period norm before inversion.
- **normalized_enclosure.exact_factor** (compatibility): Evaluate an exact algebraic factor at the selected embedding before enclosing it.
- **normalized_enclosure.error_budget** (projection): Expose separate analytic-tail, period, algebraic-evaluation and rounding contributions.
- **normalized_enclosure.recover_exact** (characterisation): Exact recovery requires a proved discrete membership/separation premise or symbolic equality.

**Unit tests.**

- **normalized_enclosure.denominator_zero**: A period box containing zero is rejected for division even if its midpoint is nonzero.
- **normalized_enclosure.zeta_two**: The exact target for ζ(2)/(2πi)^2 is −1/24; a box near +1/24 fails the Tate-sign normalization.
- **normalized_enclosure.recognition**: A tiny interval containing 1/2 does not prove its unknown value is rational.
- **normalized_enclosure.local_zero**: A vanishing Euler polynomial invokes the leading-term adapter and changes the derivative order.

**Consumers.** PS.7 certified computations: Compare arithmetic examples using exact maps and rigorous errors.; RS-13 direct supplier links: Use L0, AL.1 and AL.5 directly instead of rebuilding their arithmetic/analytic inputs.

Atlas planet: **Normalized-value enclosure**.

### Normalization covariance of comparisons

Target **PeriodsAndSpecialValues:PS.7/normalization-covariance** (theorem).

For each proved scalar comparison, carry an explicit ledger of coefficient embedding, Betti/de Rham bases, regulator normalization, lattice index, differential, Haar measure and finite Euler set. If the comparison matrix changes to C⁻¹PA its determinant changes by det(A)/det(C); a rank-r regulator scaled by a changes by a^r; a finite-index Mordell–Weil basis changes its height determinant by index²; Γ_C,D versus Γ_C,B changes the completion by 2^b; and Tate’s Haar scaling dμ↦c dμ changes a local epsilon by c^{dim V}. Transport the numerator and denominator through these exact identities before comparing enclosures. State and prove covariance of each example’s normalized value, rather than claiming every numerical ratio is invariant under arbitrary independent convention changes.

**Hypotheses.** Each transformation is an actual supplied comparison or proved formula and the maps are composable in the chosen example. Measures use positive scaling; orientations and coefficient-field units remain distinct from absolute values.

**Proof plan.**

1. Apply the PS.0 basis formula, PS.3 determinant scaling and PS.6 lattice formula.
2. Use the PS.1 gamma normalization and Tate’s local-measure identity.
3. Compose the maps and transform both sides of each equality; propagate enclosure widths through the imported sound arithmetic.

**Inputs.** PeriodsAndSpecialValues:PS.0/comparison-period-line, PeriodsAndSpecialValues:PS.1/archimedean-completion, PeriodsAndSpecialValues:PS.3/regulator-specializations, PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter, PeriodsAndSpecialValues:PS.7/normalized-enclosure.

**Sources.** Deligne, §5.1, pp. 15–16 (English translation PDF pages): Period determinant and Tate covariance.; Tate, (3.4.3)–(3.4.4), printed p. 15: Haar-measure and additive-character dependence.; Johansson, §2, pp. 2–3: Interval outputs require sound propagation through the actual operations.

**Checks.**

- A rank-2 regulator multiplied by 2 changes determinant by 4.
- An index-2 Mordell–Weil sublattice changes the height determinant by 4, independently of the components factor in Ω.
- For a rank-4 local representation, Haar scaling by 2 changes epsilon by 16.

Atlas planet: **Normalization covariance**.

### Period conjecture and special-value boundary

Target **PeriodsAndSpecialValues:PS.7/period-conjecture-boundary** (definition).

For the full localized formal-period algebra and actual evaluation per:P→C, define PeriodConjecture as injectivity of per. It says precisely that an equality of numerical evaluations implies the corresponding formal relation; it is not implied by the torsor theorem. Keep this predicate separate from DeligneAlgebraic, LeadingTermRational, ETNC, BK_Tam, BBK_rank01 and the higher-rank BSD assertion of the elliptic adapter. Every exported theorem names the exact subset of these hypotheses it uses. A certified inequality is a theorem about an enclosure, and an observed numerical agreement supplies no witness to any of these general conjectures.

**Hypotheses.** P and per are the full localized constructions, not the effective algebra alone.

**Proof plan.**

1. Define injectivity on the imported period map.
2. Use the already proved relation-respecting direction without adding an injectivity proof.
3. Record each named special-value predicate by reference to its unique earlier owner, and keep its explicit proof gates.

**Inputs.** PeriodsAndSpecialValues:PS.2/torsor-integration-comparison, PeriodsAndSpecialValues:PS.1/deligne-algebraicity, PeriodsAndSpecialValues:PS.3/leading-term-line, PeriodsAndSpecialValues:PS.5/etnc-predicate, PeriodsAndSpecialValues:PS.6/bloch-kato-tamagawa, PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction, PeriodsAndSpecialValues:PS.6/bsd-prime-assembly, PeriodsAndSpecialValues:PS.7/normalized-enclosure.

**Sources.** HMS, Theorem 0.2, p. 2; Definition 2.8 and Theorem 2.10, pp. 10–11: The full formal/torsor comparison supplies evaluation; injectivity is an additional period conjecture.; BF, Conjecture 4, pp. 535–536: Special-value assertions have their own analytic, rational and integral premises.

**Planning API.**

- **period_conjecture_boundary.injective** (characterisation): PeriodConjecture is exactly ∀x,y∈P, per(x)=per(y) implies x=y.
- **period_conjecture_boundary.kernel** (equivalence): Equivalently the kernel of per is zero.
- **period_conjecture_boundary.formal_to_numeric** (compatibility): Formal equality always implies numerical equality without the conjecture.
- **period_conjecture_boundary.numeric_to_formal** (relation): The converse requires the injectivity hypothesis.
- **period_conjecture_boundary.separate_gates** (projection): The other named special-value assertions remain the existing predicates at their stated coefficient and prime scopes.

**Unit tests.**

- **period_conjecture_boundary.localization**: The inverse-Tate relation is already formal and needs no injectivity assumption.
- **period_conjecture_boundary.torsor**: A torsor with a chosen complex point does not by itself force its coordinate evaluation to be injective.
- **period_conjecture_boundary.numeric**: Overlapping error bars alone cannot establish formal equality or an exact leading coefficient.

**Consumers.** PS.9: Separate motivic identities from numerical identities through the actual evaluation map.; PS.7 research boundary: Keep all general period and special-value conjectures explicit.

Atlas planet: **Period conjecture**.

**Coverage: planned.** Discharge the imported arithmetic/period comparison contracts, then prove the two explicit quadrature specializations and their rounded error budgets. Exact recognition needs discrete membership/separation.

## Lean statement coverage

The suggested file follows the current WORKERS.md shape: light definitions over existing carriers, end statements and a few discriminating examples. It states targets and does not develop missing theories. The full target/API/test specification is above and in the packet. A missing motivic carrier is never represented by a proposition field or an unrelated tuple.

| Reader targets | Suggested-file scope |
| --- | --- |
| PS.0 comparison line and period class | Actual complex matrices and nonzero complex coordinates modulo an embedded field unit; this is the selected-component coordinate fragment, not the full motivic line or simultaneous tensor-product quotient |
| PS.0 real comparison, Deligne periods and Tate normalization | Actual pinned Tate Hodge-filtration examples and the scalar (2πi)^n; geometric F∞, quotient comparisons, Betti lattices and actual elliptic matrix remain reader targets |
| PS.1 criticality and algebraicity | Integer gamma-pole exclusions, the off-diagonal interval, unit-motive tests and coefficient membership for a fixed nonzero scalar period; analytic continuation, Hodge-block constructions and motivic comparisons remain reader targets |
| PS.2 | Actual formal-period algebra, relative integration functors and torsor carriers are supplier targets; all PS.2 statements remain here. The existing localization API is cited, not rebuilt |
| PS.3–PS.6 | Generic perfect-complex/Picard/relative-K and arithmetic motivic/regulator objects are not available with the required interfaces at the pins. Their targets, exact factor lists, source-qualified predicates, API and tests remain here |
| PS.7 quadrature | Rational arctangent sums, real Legendre polynomial/integrands, actual interval integrals, substitution and error milestones; integral-cycle identification and interval-algorithm adapters remain reader targets |
| PS.7 normalization and conjecture boundary | Matrix normalization milestone is statable; full normalized-value enclosures, Selmer/regulator transformations and injectivity of the imported formal-period evaluation remain reader targets |

The prototype names are coordinate-specific and appear in its declaration comments; they do not purport to provide the complete planning namespaces above. The simultaneous coefficient-unit quotient and general criticality predicate are deliberately specified here at their actual mathematical carriers.

## Supplier contracts

### PadicMeasuresIwasawaAlgebras:L5

Determinant Picard functor of bounded perfect complexes over fields, DVRs and projective coefficient orders, with grading signs, inverse, dual, quasi-isomorphism, triangles, derived base change and the actual acyclic fractional-lattice trivialization. Import the generic functor; PS computes its arithmetic adapters.

Needed by: PeriodsAndSpecialValues:PS.0/comparison-period-line, PeriodsAndSpecialValues:PS.0/deligne-periods, PeriodsAndSpecialValues:PS.3/rational-fundamental-line, PeriodsAndSpecialValues:PS.4/integral-fundamental-line, PeriodsAndSpecialValues:PS.4/finite-lattice-correction.

### GeneralAlgebraicKTheory:KU-fundamental

Relative K₀(O,A_R), its triple presentation, K₁ boundary, scalar-extension/restriction maps and exact sequence for projective order-structures, through the native K.3–K.5 owners aggregated at this checkpoint. No generic determinant functor is requested here.

Needed by: PeriodsAndSpecialValues:PS.5/equivariant-obstruction.

### ArithmeticGaloisRepresentations:R01.3

Import wd-from-monodromy and global-away-conductor for all admitted away-coefficient local exponents. Extend the latter’s excluded-prime scope only with the supplied compatible WD system; specify the exact positive conductor N(R), including base-field/discriminant normalization, used in the BCGP functional equation.

Needed by: PeriodsAndSpecialValues:PS.1/motivic-euler-product, PeriodsAndSpecialValues:PS.1/serre-system-predicate.

### MotivesAndAlgebraicCycles:MC.2

Actual Artin and modular eigenprojector motives in the stated scope, with coefficient fields, dual/Tate/real realization compatibilities and their geometric comparison. Artin Gauss-sum and modular-symbol period identifications must be actual morphism comparisons; equal ranks alone are insufficient.

Needed by: PeriodsAndSpecialValues:PS.1/dirichlet-tate-adapter, PeriodsAndSpecialValues:PS.1/modular-period-adapter.

### ComplexComparisonPartII:C5

Extend the proper smooth and curve comparison interfaces to the relative algebraic pairs used by MC.6 formal symbols, with naturality for pair morphisms, connecting maps/Stokes and relative products, and equality with integration. Existing proper and regular-singular curve nodes alone do not supply general singular pairs.

Needed by: PeriodsAndSpecialValues:PS.2/integration-evaluation.

### NeronModelsAndSemistableAbelianVarieties:R11.5

BCGP Proposition 2.8.1 for every H^i(A), 0≤i≤2g: actual strict compatibility at all v including v|λ, purity, and the indicated Hodge/infinity realization. The existing local-euler-polynomial node handles the local H¹ comparison but not this full all-degree global theorem.

Needed by: PeriodsAndSpecialValues:PS.1/hasse-weil-predicates.

### WeilConjectures:WC.2

Actual perfect Poincaré duality on H^i(A) and identification with the dual Tate twist H^{2g−i}(A), including local/infinity factors, needed for BCGP Corollary 2.8.7. Import the finite-field determinant duality already used by signed-zeta-functional-equation; provide this global-motivic compatibility extension.

Needed by: PeriodsAndSpecialValues:PS.1/hasse-weil-predicates.

### IntegralIwasawaTheory:I.7

The precise finite-level ETNC theorem for the abelian Tate family cited by BF Remark 10: L/Q finite abelian, K⊂L, r≤0, order Z[1/2][Gal(L/K)]. Supply original Burns–Greither theorem/section/page, descent and coefficient-order hypotheses, and its determinant/relative-class identity, rather than class-group annihilation alone.

Needed by: PeriodsAndSpecialValues:PS.5/proved-case-adapters.

### SelmerIwasawaCohomology:L4

The routed ArithmeticLevelRaisingAndBipartiteEulerSystems Part II: actual LTXZZ relevant Rankin Galois systems, strong coefficient field, full admissible-place predicate L1–L7, diagonal finite-direct-sum Abel–Jacobi class and reviewed theorem witnesses for Theorems 8.2.2/8.3.2 with inherited extraction proof gates discharged. The existing L4 Bloch–Kato condition is only the local-condition input.

Needed by: PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction, PeriodsAndSpecialValues:PS.6/rankin-proved-scope.

### AutomorphicLFunctionsAndLocalFactors:AL.5

The precise Rankin–Selberg L(s,Π₀×Π₁), central point 1/2, duality/epsilon and motivic normalization for the LTXZZ relevant conjugate-self-dual GL_even×GL_odd scope; the existing GL2 critical-value-period-interface does not supply a general Rankin special-value theorem.

Needed by: PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction.

## Proof and interface gaps

### Geometric period identifications

The imported analytic values are not by themselves Deligne algebraicity theorems. Source/refine the actual Artin Gauss-sum and modular-symbol-to-motivic comparison, with character inverse, sign, rational structure and chosen period. Deligne §§6.3–6.7 and §7.8 give the route, but full geometric comparison proofs were not established in this pass. MC.2 supplies the geometric objects; AL.5 the analytic formula.

Needed by: PeriodsAndSpecialValues:PS.1/dirichlet-tate-adapter, PeriodsAndSpecialValues:PS.1/modular-period-adapter.

### Relative-pair integration comparison

C5’s present proper smooth and curve contracts do not cover every singular algebraic pair in the MC.6 presentation. Its requested relative/Stokes/product comparison is an explicit prerequisite before descent of the actual integral evaluation can be completed.

Needed by: PeriodsAndSpecialValues:PS.2/integration-evaluation, PeriodsAndSpecialValues:PS.2/torsor-integration-comparison.

### Integral real dyadic determinant

Complete real Tate cochains at 2 are unbounded. Supply a specific bounded perfect replacement with its comparison and retained two-primary errors, or restrict the theorem to odd primes/no real places. No general integral replacement is asserted to exist. The p=2 elliptic comparison cannot be concluded from the odd-prime line.

Needed by: PeriodsAndSpecialValues:PS.4/real-dyadic-gate, PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter.

### Original zeta-isomorphism and abelian Tate proof sources

The original Fukaya–Kato formulation was not acquired; the orientation uses BV §4.3 and the reviewed NE.7 interface. Original Burns–Greither proof and exact theorem locator for the BF Remark 10 abelian Tate family remain an I.7 supplier obligation; this pass does not count that family as a proved ETNC import. BV Theorem 5.5 remains conditional and the corrected NE.7 Corollary 5.7 scope is retained.

Needed by: PeriodsAndSpecialValues:PS.5/zeta-orientation-adapter, PeriodsAndSpecialValues:PS.5/proved-case-adapters.

### Rankin proof-route and derivative comparison gates

The routed PAPER-LIU-ETAL-22 extraction records 126 issues, with proof-route gates not resolved here. Its Part II owner must discharge the relevant gates before supplying unconditional rank-zero/one theorem witnesses. Derivative nonvanishing versus diagonal-cycle nonvanishing separately needs Conjecture 8.3.1 and Abel–Jacobi injectivity. The Part II has no registered atlas id in this checkout, so the request is attached to L4 and recorded in restructure.

Needed by: PeriodsAndSpecialValues:PS.6/rankin-proved-scope.

### Deligne original-version collation

The English translation revised 2018 was read; the original IAS file refused download. Collate original Proposition–Definition 2.3(ii), and the critical-period locators, before attributing E2 to the published French article. The corrected simultaneous dual regularity agrees with Definition 1.3 and the unit-motive test in the translation itself.

Needed by: PeriodsAndSpecialValues:PS.1/critical-integer, PeriodsAndSpecialValues:PS.1/deligne-algebraicity.

## Source corrections and version boundaries

### PeriodsAndSpecialValues/E1

§2.8 local cohomological zeta-product display after (2.8.5), preprint p. 37; published p. 196 reported by the existing extraction, not collated here.

The alternating local product uses the complex variable in the sign exponent (−1)^s. The exponent is (−1)^i, the cohomological degree, when the factors are local L-functions (inverse characteristic polynomials).

**Check.** For an elliptic curve the H¹ L-function must occur inversely, while H⁰/H² occur positively, at every complex s in the convergence region. A complex-variable sign cannot implement that point-count identity.

Effect: nothing. Known correction: Already recorded in PAPER-BOXER-CALEGARI-GEE-PILLONI-21; this packet imports that correction.

Searched: Existing PAPER-BOXER-CALEGARI-GEE-PILLONI-21 extraction and errata record; arXiv:1812.09269 version opened 2026-10-19; publisher version not independently collated.

### PeriodsAndSpecialValues/E2

Proposition–Definition 2.3(ii), Ghate–Beineke English translation revised 2018, PDF p. 10 only; original French article not collated.

The second infinity factor is evaluated as L∞(M∨(1),s) at s=n, with a positive s argument. Use L∞(M∨(1),−s), equivalently L∞(M∨,1−s), at s=n, in agreement with Definition 1.3.

**Check.** For Q(0), n=−1 is critical: Γ_R(−1) and Γ_R(2) are regular. The printed second factor instead evaluates Γ_R(1+n)=Γ_R(0), falsely excluding n=−1. The corrected dual test also rejects n=1.

Effect: a stated result. Known correction: new

Searched: Translator’s mathematics page and revised-2018 translation link, accessed 2026-10-19; no identified correction of this sign; IAS Deligne publication listing/original Valeurs de file attempted; download refused, so no assertion about the published French wording; Definition 1.3 and the Tate critical-value examples within the translation.

The BCGP exponent correction is inherited. The Deligne finding is scoped to the 2018 English translation, with original-version collation still open. The corrected NE.7 rational-character scope and the ER.5 CM normalization gates are imported from their owners. The unresolved LTXZZ proof-route findings stay with the routed Part II; this roadmap makes no new verdict on all 126 findings.

## Review and completion criteria

A review must check the β/I inverse and transpose, the single coefficient-field unit across embeddings, the dual gamma argument, every conductor/gamma normalization, Ξ versus Δ, the finite-complex determinant sign, and the real dyadic restriction. It must also check the actual source-qualified scope of every analytic, regulator, ETNC, BSD and Rankin adapter. Passing numerical tests does not discharge any missing comparison or conjectural premise.

Completion of the planning pass means that every scoped target has a node and a terminating prerequisite/request/gap route. Closing a stage additionally requires discharging its coverage list and all upstream gaps affecting it. No stage is presently closed. The next work is to review this plan, satisfy the named supplier contracts and source collation, and resolve each gap at its owner; PS.8–PS.11 remain a separate job.
