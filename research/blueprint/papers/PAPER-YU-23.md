# PAPER-YU-23 — whole-arXiv reading checkpoint

Status: partial. Agent: Codex, session codex-a71f92. Refs #1091.

This is an extraction and routing plan, not a formalization. It contains 141 items: 8 pinned-library inputs, 23 planned items and 110 missing items. All missing items have exactly one route. All 46 definitions/constructions have three API specifications and two acceptance tests in the JSON; all 95 theorem items have proof outlines and explicit dependencies.

## Version and reading boundary

The main source is [Yu, arXiv:1807.04659v5](https://arxiv.org/pdf/1807.04659v5), dated 18 July 2022, 85 pages. All sections, proofs, Appendices A–C, the symbol index and bibliography were read line by line (5866 extracted lines). The JSON includes the contiguous reading ledger and SHA-256 hashes.

The [Annals record](https://annals.math.princeton.edu/2023/197-2/p01) identifies the 2023 publication, volume197, pp423–531, DOI10.4007/annals.2023.197.2.1. Its 109-page text has **not** been collated with the arXiv version. Attempts at the public publisher PDF filenames returned404. All page locators and source findings below refer to arXivv5 unless explicitly stated otherwise; do not report them as independently confirmed journal errata.

Additional reading was selective, not whole-source reading:

- [Anton Mellit, Poincare polynomials of moduli spaces of Higgs bundles and character varieties (no punctures), Inventiones221(2020),301–327](https://d-nb.info/1209124246/34): First3pages: introduction, Theorem1.1, Corollary1.2 and beginning§2 only. Confirms the prefactor (1−q)(1−z), not (1−g)(1−z); not a full27-page read.
- [Laurent Lafforgue, Chtoucas de Drinfeld et conjecture de Ramanujan-Petersson, Asterisque243(1997)](https://www.numdam.org/item/AST_1997__243__1_0.pdf): Printedpp306–308: Lemma9, Corollary10, Theorem11 and proof. OCR of operators is corrupt; image-level full formula collation remains S2. Not the entire monograph.
- [Wei Luo and Shengmao Zhu, Integrality of the LMOV invariants for framed unknot, CNTP13(2019),81–100](https://arxiv.org/pdf/2106.02882): Authorpp6–7, §3 equation10 and Lemma3.1 with its full proof only. This2021 arXiv deposit records the2019 article, derived from the older1611.06506 manuscript; not a whole-paper read.
- [Pierre-Henri Chaudouard, Sur le comptage des fibres de Hitchin, Asterisque369(2015),223–284](https://webusers.imj-prg.fr/~pierre-henri.chaudouard/contrib-Laumon.pdf): Authorpp18–19: Lemmas4.2.1–4.2.2 with full proofs and beginning4.2.3. Authorpp24–25: Definition4.5.3, Example4.5.4, Proposition4.5.5 and proof opening. Authorpp29–30: Theorem5.2.1, Corollaries5.2.2–5.2.3 with full proofs. Authorpp32–33: Theorem6.2.1 and proof reduction; NOT downstream Lemmas6.2.3–6.2.6. Not a full article read.

The other prerequisites listed in the JSON are located sources or cited inputs, not completed reading. In particular KW01's exact normalizer theorem, the Higgs-purity/character-variety comparisons and the AppendixC monodromy/sieve sources remain open.

## Mathematical outcome and dependency structure

For a smooth proper geometrically connected curve X1/Fq, let E_n be the irreducible rank-n geometric l-adic local systems, and pair the Frobenius eigenvalues as sigma_i and q/sigma_i. Yu proves for g≥2 a universal polynomial

`P_g,n ∈ R_g = Z[z_i,t/z_i]^(S_g ⋉ (S2)^g)`

whose evaluation at `(q^k,sigma_1^k,...,sigma_g^k)` counts the classes fixed by the k-th Frobenius power. Its unique highest weighted term is `t^((g−1)n²+1)`. With

`J_g = product_i (1−z_i)(1−t/z_i)`,

one has `P_g,n = J_g Q_g,n` in the same integral admissible ring and

`Q_g,n(1,...,1) = sum_(d|n) mu(d) mu(n/d) d^(2g−3)`.

The trace has a second geometric interpretation: `J_e = P_n^e`, the unweighted count of isocline bundles, and depends only on the order of e in Z/nZ. For coprime rank/degree this joins the geometrically indecomposable and stable-Higgs counts. Genus1 is handled separately: the recurrence dividing by 2g−2 cannot be specialized there.

The extraction keeps the following chains separate:

| Chain | Inputs and outputs |
| --- | --- |
| Weil and automorphic descent | 001–021, 123–124: Frobenius-fixed geometric classes → Weil representations modulo inertial twists → stabilizer-one cuspidal count |
| Geometric trace | 022–040, 125–126, 138: truncation, shifted HN splitting, adelic bundles and automorphism weights → isocline/Higgs counts |
| Spectral trace | 047–073, 115–118, 127–130: torus fibres, regularized families, Whittaker/Haar normalizations and L-factor zeros/poles → finite cycle sums |
| Exact recurrence | 074–097: weighted trees, cofactor/block identities, cycle index and Frobenius orbit inversion → coefficient-one rank recurrence |
| Universal polynomial | 041–046, 098–114: bundle polynomial, arithmetic divisibility and cone induction → integral counting polynomial, Jacobian factor and Euler specialization |
| AppendixC | 120–122, 134–137, 140: ordinary maximal-monodromy curve + Vandermonde power sums → necessary admissible exponent cone |
| Optional representation interpretation | 099, 141: existing split K0 and upstream classical groups → rational GSp character ring; not a premise for elementary integrality |

The JSON is the detailed item inventory, including corrected mathematical statements, proof sketches, definition APIs/tests, uses and the acyclic dependency graph. Some imported statements are deliberately marked incomplete: especially item123's KW01 input and item063's full operator-valued expression. The existence of a proof outline is not proof closure.

## Reuse at the pinned commits

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Atlas inspected at `a79a97d5c4f2c2e2246534c119ab10a8775b13f3`; publication prepared on `3f02b067baa564e05e9f5def7a4751cf92eef40a`.

- 007: `tauceti:TauCeti.Divisor.finite_ker_degreeClass` — `TauCeti/FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean`, lines143. Read finite_ker_degreeClass including finite constant-field and IsFunctionField parameters.
- 008: `tauceti:TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`, `tauceti:TauCeti.degree_weilDifferentialDivisor` — `TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.lean`, lines375,394. Read the Weil differential Riemann–Roch theorem and degree theorem with exact constants/nonzero differential.
- 043: `mathlib:Nat.Partition` — `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean`, lines57. Read Nat.Partition: positive multiset parts with prescribed sum. The S_i statistics are not covered by this carrier.
- 074: `mathlib:SimpleGraph.IsTree`, `mathlib:SimpleGraph.isTree_iff_existsUnique_path` — `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`, lines60,243. Read IsTree and the nonempty unique-path characterization.
- 081: `mathlib:Matrix.det_one_sub_mul_comm` — `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`, lines412. Read rectangular det(1−AB)=det(1−BA), finite decidable index types and commutative coefficient ring.
- 092: `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq` — `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`, lines206. Read the additive-group divisor-antidiagonal Mobius inversion statement, including positivity.
- 140: `mathlib:Matrix.det_vandermonde`, `mathlib:Matrix.det_vandermonde_ne_zero_iff` — `Mathlib/LinearAlgebra/Vandermonde.lean`, lines219,233. Read the determinant product and injectivity/nonzero equivalence over a domain.
- 141: `tauceti:TauCeti.repRing`, `tauceti:TauCeti.repRingCharacter`, `tauceti:TauCeti.repRingCharacter_of` — `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean`, lines106,128,135. Read split K0 carrier, character ring homomorphism and class evaluation. Also read RepresentationRing/Injective.lean: its injectivity requires Finite G and CharZero k; no GSp specialization.

The partition and graph statuses mean their carriers exist, not that the paper's statistics or weighted matrix-tree theorem are already implemented. The rectangular determinant identity avoids assuming diagonalizability; it does not supply the singular cofactor identity. Split representation rings already exist, but their finite-group character-injectivity theorem is not a GSp theorem.

Read relevant AUDIT20 entries for FA.1/FA.2/FA.4/FA.6 and GS.0/GS.6; AUDIT14 AS.1/AS.2/AS.3/AS.4/AS.6 and AL.3; AUDIT18 DWP.0/DWP.1/DWP.7, EDC.2:pairings and CA.2/CA.3; AUDIT15 QM.0; AUDIT01 SF.3 and R09.4/R09.5; AUDIT19 WC.1 and WC.5:power-sum-converse. These distinguish existing divisors, partitions, binomial and determinant primitives from absent spectral/geometric targets. ET.2b and the classical-group stage IDs have no reviewed entry in this snapshot; no negative audit is inferred from that absence.

## Routing decisions

### Route 1: FunctionFieldArithmetic

Type: source. Items: 001, 009, 011, 012, 013, 064.

Yu supplies the unramified function-field specialization, exact degree/Haar conventions and the degree-zero spherical nonvanishing test inside existing arithmetic and automorphic layers. Import the pinned divisor results; do not duplicate the upstream curve/function-field dictionary.

Existing layers: `FunctionFieldArithmetic:FA.0`, `FunctionFieldArithmetic:FA.1`, `FunctionFieldArithmetic:FA.2`, `FunctionFieldArithmetic:FA.4`, `FunctionFieldArithmetic:FA.6`.

### Route 2: GlobalShtukasAndFunctionFieldLanglands

Type: source. Items: 014, 026, 033, 126.

Reuse the global bundle and full GL_n correspondence owners. The shifted HN and adelic orbit-mass interfaces are source additions inside GS.0, not a second shtuka or Langlands programme.

Existing layers: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `GlobalShtukasAndFunctionFieldLanglands:GS.6`.

### Route 3: AutomorphicSpectralTheory

Type: source. Items: 010, 017, 018, 019, 020, 021, 022, 023, 024, 025, 038, 039, 047, 048, 049, 050, 051, 052, 053, 054, 055, 056, 058, 059, 060, 061, 062, 063, 065, 066, 115, 116, 117.

The existing spectral programme owns truncation, induced sections, residual spectrum, regularized families and the trace formula. Yu adds explicit finite-field degree lattices, finite torus fibres, spherical scalar normalizations and degree-cutoff formulas. Keep these as source contributions, including the corrected Lafforgue formula.

Existing layers: `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `AutomorphicSpectralTheory:AS.3`, `AutomorphicSpectralTheory:AS.4`, `AutomorphicSpectralTheory:AS.6`.

### Route 4: AutomorphicLFunctionsAndLocalFactors

Type: source. Items: 057, 068, 069, 127, 128, 130.

Whittaker normalization and unramified Rankin–Selberg product, pole and functional-equation calculations belong to the existing Rankin–Selberg layer. Import Langlands and cohomological weights/duality, preserving residual-segment and inertial-equivalence hypotheses.

Existing layers: `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### Route 5: DeligneWeightsAndPurity

Type: source. Items: 041, 042.

The curve Weil-eigenvalue and pure lisse-coefficient input is already planned here. The Euler determinant formula and duality are imports from WeilConjectures:WC.1 and EtaleDualityAndPerverseSheaves:EDC.2:pairings, not new weight theorems.

Existing layers: `DeligneWeightsAndPurity:DWP.0`, `DeligneWeightsAndPurity:DWP.1`, `DeligneWeightsAndPurity:DWP.7`.

### Route 6: EndoscopicTransferAndUnitaryTraceComparison

Type: source. Items: 035.

Reuse the Hitchin/Higgs carrier already in the geometric fundamental-lemma layer. Its good-characteristic and sufficiently positive setup is not the all-characteristic coprime stable GL_n moduli theorem; item036 remains an additional endpoint in the counting extension. No reviewed ET.2b audit entry was found.

Existing layers: `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`.

### Route 7: QSeriesPartitionsAndMockModularForms

Type: source. Items: 044, 086, 087, 090, 094, 102, 106, 107.

Formal coefficientwise series, partition cycle indices, plethystic operations and generalized-binomial coefficient manipulations belong in the existing formal q-series layer. Export them over general characteristic-zero coefficient rings and integral subrings, without introducing analytic convergence assumptions.

Existing layers: `QSeriesPartitionsAndMockModularForms:QM.0`.

### Route 8: ClassicalArithmeticCompletion

Type: source. Items: 103, 104, 105.

The binomial divisibility and p-free factorial congruences support arithmetic generating functions already in CA.2. Reuse existing binomial arithmetic; the exact Luo–Zhu congruence and its exceptional 2-adic case are the added source lemmas.

Existing layers: `ClassicalArithmeticCompletion:CA.2`.

### Route 9: SchemeAndStackFoundations

Type: source. Items: 125.

Import coherent Serre duality through SF.3 and its upstream JacobianChallenge Layer B supplier. The function-field Riemann–Roch theorem does not establish duality for arbitrary vector bundles on the scheme. No new Serre-duality programme is proposed.

Existing layers: `SchemeAndStackFoundations:SF.3`.

### Route 10: EtaleDualityAndPerverseSheaves

Type: source. Items: 129.

The tensor H0/H2 calculation is an application of the existing smooth-proper perfect-pairing interface, with corrected Hom directions and Frobenius conventions.

Existing layers: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.

### Route 11: WeilConjectures

Type: source. Items: 120.

The nonarchimedean negative-power-sum obstruction is a companion specialization of the existing independent finite-spectrum lemma. Reuse the pinned Vandermonde determinant instead of proposing a new exponential-sum owner.

Existing layers: `WeilConjectures:WC.5:power-sum-converse`.

### Route 12: GlobalShtukasAndFunctionFieldLanglandsCountingPartII

Type: part-ii. Items: 002, 003, 004, 005, 006, 015, 016, 027, 028, 029, 030, 031, 032, 034, 036, 037, 040, 045, 046, 067, 070, 071, 072, 073, 075, 076, 077, 078, 079, 080, 082, 083, 084, 085, 088, 089, 091, 093, 095, 096, 097, 098, 100, 101, 108, 109, 110, 111, 112, 113, 114, 118, 119, 121, 122, 123, 124, 131, 132, 133, 134, 135, 136, 137, 138, 139.

The existing GS programme constructs bundles, shtukas and Langlands, but not Yu's exact Frobenius-fixed counts, recurrence, integral universal polynomial, Jacobian quotient or degree independence. These require new counting layers after the existing correspondence, not a replacement correspondence.

Design brief: Final targets are Yu Theorem1.1: for g≥2 and n≥1 the Frobenius-fixed irreducible rank-n geometric local-system count is P_g,n(q^k,sigma_1^k,...,sigma_g^k), for a unique P_g,n in R_g=Z[z_i,t/z_i]^W. Its unique top-weight term is t^((g−1)n²+1); P_g,n=J_g Q_g,n with J_g=product_i(1−z_i)(1−t/z_i), Q_g,n in R_g and Q_g,n(1)=sum_(d|n)mu(d)mu(n/d)d^(2g−3). Prove Theorem1.3 J_e=P_n^e and Theorem1.4 dependence only on the order of e modulo n, the coprime Higgs comparison, and AppendixC's necessary exponent cone in every characteristic. Build, in order: Weil descent and twist stabilizers; isocline bundles and the geometric trace; the coprime stable GL_n coarse-moduli/mass adapter; finite spectral character sums; one reusable weighted matrix-tree/cofactor module and its cycle-block specialization; cuspidal orbit inversion and the exact recurrence097; universal Laurent polynomials and integral/Jacobian/Euler consequences. Import Function-field arithmetic (FunctionFieldArithmetic), Global shtukas and Langlands over function fields (GlobalShtukasAndFunctionFieldLanglands), Automorphic spectral theory (AutomorphicSpectralTheory), Automorphic L-functions and local factors (AutomorphicLFunctionsAndLocalFactors), Deligne weights and purity (DeligneWeightsAndPurity), Etale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves), Q-series, partitions and mock modular forms (QSeriesPartitionsAndMockModularForms), Classical arithmetic completion (ClassicalArithmeticCompletion), and the scheme curve suppliers through SchemeAndStackFoundations. Reuse Hitchin carriers from EndoscopicTransferAndUnitaryTraceComparison:ET.2b, coordinate with the GWZ20-B endoscopic Part II, and consume ClassicalGroupsPartII's GSp character interpretation as optional explanatory infrastructure, not as a circular premise for polynomial integrality. Use Mathlib partition/graph/matrix/Mobius/Vandermonde primitives and Tau Ceti divisor/split-K0 results. Do not rebuild any upstream roadmap. Resolve S1–S8, especially exact spectral operators and external Higgs/monodromy proofs, before claiming the design has no gaps.

### Route 13: ClassicalGroupsPartII

Type: part-ii. Items: 099.

Yu's Remark7.1.1 needs rational algebraic GSp over Q and the tensor-generated integral character subring; the upstream classical-group roadmap treats classical highest weights and characters, mostly over C, and is imported rather than replanned.

Design brief: Prove that restriction of rational algebraic representations of the split group GSp_2g to its diagonal torus identifies the representation ring with Z[t±1,z_i±1]^(S_g⋉(S2)^g), where a reciprocal swap sends z_i to t/z_i. Identify the tensor-generated subring of the standard representation with Z[z_i,t/z_i]^W, generated by t and the fundamental exterior expressions ∧^k V−t∧^(k−2)V, 1≤k≤g, with negative exterior degree interpreted as zero. Import Finite-dimensional representations of the classical groups (tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups), especially Layers0,3,4, its reductive-group and highest-weight suppliers, and the existing TauCeti.SplitK0/TauCeti.repRing infrastructure. Supply the central-similitude weight lattice, rational-versus-complex base-change/descent, the correct algebraic representation category, character restriction/injectivity, and the integral tensor-generation argument. Do not apply the finite-group repRingCharacter_injective theorem to GSp(Q), or construct a second split Grothendieck ring. Accept rank-one GSp2=GL2, standard exterior-square multiplier and reciprocal-swap invariance as tests. The counting extension imports this interpretation without depending on it for its elementary cone definition.

These routes do not recreate the upstream JacobianChallenge, classical-group, curve or representation-ring programmes. The counting extension owns the new application, while reusable analytical/arithmetic lemmas go to existing proposed layers. No other extracted paper was found owning Yu's exact recurrence. The existing GWZ20-B endoscopic Part II has a different endpoint; shared Hitchin carriers need coordination, not duplication.

## Source findings awaiting independent review

The findings below are in arXivv5. “New” means no correction was found in the bounded search of the publisher record, author page, arXiv history and exact-title/DOI correction searches on 22 September2026. Earlier arXiv versions were not fully collated, and the journal text was unavailable. E9 records Yu's already-published correction to the Lafforgue spectral formula; it is not a claim to have newly discovered that issue.

### E1 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: §2.3.1 p9 and §3.3.1 p18.

Printed: `P ∈ P(B)`.

Correction: Restrict the cuspidal vanishing condition and the F^G cutoff test to proper parabolics P≠G.

Reason: For P=G the unipotent quotient is a point and the constant term is phi itself; hat-tau_G=1 would also kill the cutoff. GL_1 gives an immediate counterexample.

Known correction: new.

### E2 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: §3.2.3 p17, displayed definition of H_g,n.

Printed: `−(1−g)(1−z) Log(Omega_g)`.

Correction: Use −(1−q)(1−z) Log(Omega_g).

Reason: The rank-one Young-diagram term has denominator (z−1)(1−q); the corrected prefactor gives the Jacobian factor. The printed prefactor gives (1−g)/(1−q) times that factor and vanishes for g=1. Image checked; Mellit's published Theorem1.1 independently confirms q.

Known correction: new.

### E3 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Proposition3.3.4 proof p21, convex identity and next two displays.

Printed: `Σ_(t=a)^(l−1)(t−a+1)alpha_t; a−l`.

Correction: For a=N_i,b=N_(i+1), the first root sum starts at a+1 with coefficient t−a; block-internal vanishing starts at a+1; the next inequality uses b−l, not a−l.

Reason: The corrected identity is (b−l)omega_a+(l−a)omega_b−(b−a)omega_l=−(b−l)Σ_(a<t<l)(t−a)alpha_t−(l−a)Σ_(l≤t<b)(b−t)alpha_t. For n=3,a=1,l=2,b=3 the left side is −alpha_2, not −alpha_1−alpha_2. All three slips image checked.

Known correction: new.

### E4 — gap; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Corollary4.2.6 p27.

Printed: `c_beta: holomorphic and nonzero near S1; N(c_beta)−P(c_beta) in |z|<1`.

Correction: Also require a meromorphic extension to a neighborhood of the closed disk, with no boundary zero or pole; rational functions with that boundary condition suffice.

Reason: Annular holomorphy does not define the interior divisor. For example z exp(1/z) is nonzero on an annulus but has an essential singularity at zero. The later rational L-factor application is repaired by specifying its extension.

Known correction: new.

### E5 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Theorem4.2.4 proof p25, root-wall estimate.

Printed: `theta_Q(z beta_1+xi_1)=O(z^−1)`.

Correction: The estimate needed in that argument is theta_Q(z beta_1+xi_1)^−1=O(z^−1), for generic xi_1 on the chosen wall.

Reason: The printed upper bound for theta itself is true but does not control its reciprocal. At most one denominator factor vanishes on a generic wall, so the reciprocal has at most a simple pole, which is what kills the higher-derivative coefficient.

Known correction: new.

### E6 — error; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §5.1.1 p29, choice of kappa.

Printed: `proj_(a_L)(kappa)≠0 ⇒ alpha(kappa)≠0 for all relative roots`.

Correction: Choose kappa off the finite union of all relative-root hyperplanes for every semistandard Levi.

Reason: Image checked. kappa=(3,2,1) is in the positive chamber and every Levi projection is nonzero, but the blocks {1,3}|{2} have equal averages 2, so their relative root evaluates to zero.

Known correction: new.

### E7 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Proposition5.2.1 p32, type of H_Q^e.

Printed: `H_Q^e ∈ a_L^G`.

Correction: H_Q^e belongs to a_(L,Z) in the affine degree −e hyperplane, not the degree-zero vector space.

Reason: The floor differences telescope to −e. With one block and e=1, H=−1 while a_G^G=0. Image checked; 119 exact small floor checks corroborate the sign.

Known correction: new.

### E8 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §5.2.2 p32 compared with §5.3.2 p39.

Printed: `rho_P(m)^−1 phi(m) ∈ pi; phi_R(nmk)=rho_R(m)^−1 phi_pi(m)`.

Correction: With the latter basis convention, the membership condition is rho_R(m)phi(m)∈pi. Use R rather than the unrelated P and make the same choice in the intertwining normalization.

Reason: Even R=P, combining the two printed displays gives rho_P^−2 phi_pi instead of phi_pi. The extraction records the consistent basis convention; a full original-source normalization collation remains a gate. Image p32 checked.

Known correction: new.

### E9 — error; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Yu §5.2.3 pp33–35 concerning Lafforgue1997 Theorem11 pp307–308.

Printed: `Lafforgue: Theorem11 spectral Fourier recovery`.

Correction: Use Yu Theorem5.2.2 and its proof from Lafforgue's Lemma9, retaining the finite-kernel torus map and normalized fibre sum.

Reason: Yu explicitly identifies errors in the recovery of the spectral expression. Lafforgue pp306–308 were inspected; their OCR corrupts operators, so this record does not pretend to identify every glyph-level change. Yu reconstructs the formula and the |w||X_L^L| factor from Fourier inversion.

Known correction: Yu arXiv:1807.04659v5, §5.2.3, Theorem5.2.2.

### E10 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma5.3.3 p36.

Printed: `phi ∈ pi ⇒ ∃x∈G(A)^0, phi(x)≠0`.

Correction: Add phi≠0.

Reason: The zero vector is an immediate counterexample; the proof explicitly uses nonzero phi and a nonzero Whittaker scalar.

Known correction: new.

### E11 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma5.3.3 proof p38.

Printed: `deg x0=−n(n−1)(g−1); x0 a^((n−1)(g−1))`.

Correction: With J_v=(-(n−1)n_v,...,0) and deg=−Σv, deg x0=+n(n−1)(g−1); multiply by a^−((n−1)(g−1)) to reach degree zero.

Reason: Sum the diagonal valuations and use deg K=2g−2. Both displayed signs were checked in the image and against §2.2.1.

Known correction: new.

### E12 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Proposition5.3.4 proof, final paragraph p39.

Printed: `q^((g−1)ni nj)`.

Correction: Use q^((1−g)ni nj), as in equation5.1.1.

Reason: With product local volume(O_v)=1, the additive adelic quotient has volume q^(g−1); imposing global unipotent quotient volume one multiplies the measure by q^(1−g) in each root direction. The definition and calculation must use the same normalization.

Known correction: new.

### E13 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §5.3.3 p41, central shift and equation5.3.6.

Printed: `lambda_(L1)^e; lambda_(G1)^e`.

Correction: Use lambda_(L1)^−e and lambda_(G1)^−e, matching Proposition5.1.1.

Reason: The floor exponent has total −e and each root denominator is invariant under a central shift. Hence hat1_Q^e(mu lambda)=lambda_1^−e hat1_Q^e(mu). Image checked. The final degree-order argument is insensitive to e↦−e but intermediate identities are not.

Known correction: new.

### E14 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Equations6.1.1–6.1.2 pp42–43.

Printed: `H0(F1⊗F2∨)=Hom(F1,F2); H2=Hom(F2,F1)∨(−1)`.

Correction: The Hom arguments are reversed: H0=Hom(F2,F1), H2=Hom(F1,F2)∨(−1).

Reason: Tensor-Hom identifies F1⊗F2∨ with Hom(F2,F1); Poincare duality gives the second formula. The self-pair calculation used for the pole count is unaffected.

Known correction: new.

### E15 — gap; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Corollary6.1.2 p43, two-case statement.

Printed: `Π1 not inertially equivalent to Π2; Π1=Π2`.

Correction: Specify the good-representative assumption, or give the missing case of unequal but inertially equivalent unitary constituents.

Reason: The two printed alternatives do not exhaust arbitrary pairs. The application in §6.4 uses good representatives and is covered; no failure of that application is claimed. For equal segment lengths a unitary twist rotates the poles and leaves the extra stabilizer contribution.

Known correction: new.

### E16 — error; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma6.3.2(b) p50.

Printed: `rank(A)=n−1: (product of nonzero eigenvalues)/n`.

Correction: Use algebraic multiplicity: remove one zero root and multiply the remaining n−1 roots, or add that zero is a simple eigenvalue.

Reason: For A=[[0,1],[0,0]], rank=1 but det(A+tI)=t², so kappa=0; the printed product over nonzero eigenvalues is the empty product and gives 1/2. Image checked. The actual symmetric Laplacian calculations can use determinant coefficients without the false general assertion.

Known correction: new.

### E17 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Theorem6.4.1 proof p53, block matrix conventions.

Printed: `M=diag(y)−(x); x_i,j(s,t)=−l_i,s l_j,t(...); 1≤s≤m_i`.

Correction: Use positive x_i,j(s,t)=l_i,s l_j,t[(2g−2)d_i d_j min(ν_i,ν_j)+delta_ij f_i], and index cycles by 1≤s≤alpha_i, not multiplicities m_i.

Reason: The same page defines x_i,j positively and the next page states x_i,j(s,t)=l_i,s l_j,t x_i,j. Negative x makes the advertised row sums nonzero. Image checked; 2,187 exact block-Laplacian specializations match the corrected formula.

Known correction: new.

### E18 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma6.6.2 proof p62.

Printed: `|Fix(sigma)|=1 for the induced size-d orbit`.

Correction: Replace 1 by d.

Reason: Proposition2.1.3 says induction from d distinct geometric conjugates gives twist stabilizer of order d. The conclusion D_n(d)=O_(n/d)(d) on the same page uses the corrected value.

Known correction: new.

### E19 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §6.2 p46, product following equation6.2.7.

Printed: `∏_(s=2)^l n_beta(pi,lambda_1^(s−1))=∏_(s=2)^l lambda_1^((s−1)A)`.

Correction: Include the factor (−1)^(l−1), inherited from equation6.2.6.

Reason: There is one minus sign per root factor in equation6.2.6. The first display on p47 correctly restores it, so the subsequent equation6.2.8 has the intended sign.

Known correction: new.

### E20 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §7.2.2 p72, divisibility threshold and p=2 definitions.

Printed: `p^(2 gcd(k)); g_i,j,s=∏_(i,j,s)(...)`.

Correction: The threshold is p^(2 v_p(gcd(k)))=p^(2alpha). In the definitions of individual g_i,j,s remove the extraneous product signs.

Reason: The argument immediately sets alpha=v_p(gcd k) and proves valuation at least 2alpha, not the stronger exponent 2gcd(k). The surrounding equation already takes the product of the individual g_i,j,s; repeating that product inside each factor changes the expression.

Known correction: new.

### E21 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: §7.3.1 p73, definition of Euler characteristic.

Printed: `chi(V)=Σ_(i=1)^(2m)(−1)^i dim H^i`.

Correction: Start the sum at i=0.

Reason: For a point the printed definition gives zero, whereas both the cohomological Euler characteristic and its point-count specialization are one.

Known correction: new.

### E22 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma7.3.1 proof p74, ambient ring of Omega_g and Log Omega_g.

Printed: `Omega_g ∈ 1+T J_g Q(q,z)[T,z_i±1]`.

Correction: Use formal T-adic power series, with each coefficient a Laurent polynomial in z_i; the same correction applies to Log Omega_g.

Reason: Omega has nonzero contributions in arbitrarily high T degrees. Coefficientwise finiteness makes the formal logarithm meaningful, but it is not a polynomial in T.

Known correction: new.

### E23 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma7.3.1 proof p74, Gauss-lemma justification.

Printed: `J_g(q,1,z_i) has constant term 1`.

Correction: Use primitivity: the coefficient of ∏z_i is (−1)^g. The Laurent constant coefficient is (1+q)^g.

Reason: For g=1, J=(1−z)(1−q/z)=1+q−z−q/z. Gauss's lemma still proves integral division because a coefficient is a unit in Z[q].

Known correction: new.

### E24 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: LemmaA.2 proof p76.

Printed: `d_Q(lambda)=hat1_Q^e(lambda mu0)theta_Q(lambda)^−1`.

Correction: Multiply by theta_Q(lambda), rather than its inverse.

Reason: The family product formula writes the desired sum as Σ d_Q c_Q/theta_Q. The printed choice introduces a double pole even at mu0=1; the corrected choice is the holomorphic monomial family from LemmaA.1.

Known correction: new.

### E25 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §7.2.2 pp65–66, alpha/beta list lengths.

Printed: `∏_(j=1)^ls(1−beta_j z)/∏_(j=1)^ms(1−alpha_j z), then alpha_j indexed to ls`.

Correction: Keep alpha indexed by 1..ms and beta by 1..ls throughout the binomial expansion and the independent-variable assignment, or rename both lists consistently.

Reason: The recurrence defines ms denominator monomials alpha and ls numerator monomials beta, but the next displayed products and assignment interchange those lengths. If ls≠ms some referenced variables are undefined. The abstract epsilon-indexed argument does not depend on either list name.

Known correction: new.

### E26 — error; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: TheoremA.4 proof p78, order of a sum.

Printed: `ord(e+a)=lcm(ord(e),ord(a))`.

Correction: Only test whether e+a=0. Since 2a=0 in Z/cZ, a is zero or the unique element of order two; equality e=−a is determined by ord(e).

Reason: Take c=2,e=a=1: ord(e+a)=1 but lcm(2,2)=2. These parameters occur for one cycle l=2,f=1. Image checked. The replacement proves the needed invariance; 80,100 exact degree tests pass.

Known correction: new.

### E27 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: TheoremC.1 p79, reciprocal indexing.

Printed: `sigma_i sigma_(2g−i)=q`.

Correction: Use sigma_i sigma_(2g+1−i)=q, or the consistent sigma_i sigma_(i+g)=q for 1≤i≤g.

Reason: At i=g the printed formula forces sigma_g²=q, incompatible with the ordinary eigenvalues used in the proof. Image checked.

Known correction: new.

### E28 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Proposition5.2.1 p32, definition of floor.

Printed: `[x]=max{m∈Z : m<x}`.

Correction: Replace m<x by m≤x.

Reason: At an integer x the printed description gives x−1, whereas all floor identities and endpoint telescoping use floor(x)=x. Image checked on the same page as E7.

Known correction: new.

The two explicit false general assertions are worth retaining as regression tests. For E16, A=[[0,1],[0,0]] has rank1 but det(A+tI)=t², so the normalized first coefficient is zero, whereas the empty product of its nonzero eigenvalues divided by2 is1/2. For E26, in Z/2Z both1 and1 have order2, but their sum has order1. The replacement proof uses the special two-torsion shift, not a general lcm rule.

None of these findings has a reviewer verdict in this submission. No authors have been contacted.

## Checks and reproducibility

The paper/source-issue schema checks passed; the intake check reported three files and zero problems. The paper-checker suite passed all 9 tests and the source-issue suite passed all 7 tests. The declared dependency graph has no cycle; all referenced items exist; every missing item appears in exactly one route. No Lean file was compiled or is represented as compiled.

The finite exact-arithmetic script below passed 110864 assertions: Mobius selector1728; central-character identity4368; degree-order invariance80100; weighted trees760; cycle-block Laplacians2187; positive-range Mobius/binomial integrality21600; two elementary counterexample checks; floor-vector total119. It uses integer/Fraction arithmetic and Python's standard library. These finite checks are sanity tests, not proofs. In particular the binomial test covers only the positive application range, not every case in the printed Theorem7.2.3.

Save this block as `yu23-mathchecks.py` in scratch and run `python3 yu23-mathchecks.py`:

```python
from fractions import Fraction as F
from itertools import product, combinations
from math import gcd, prod, factorial

counts = {}
def check(label, condition):
    assert condition, label
    counts[label] = counts.get(label, 0) + 1

def divisors(n):
    return [d for d in range(1, n + 1) if n % d == 0]

def mu(n):
    ans, p = 1, 2
    while p * p <= n:
        if n % p == 0:
            n //= p
            ans = -ans
            if n % p == 0:
                return 0
        p += 1
    return -ans if n > 1 else ans

def choose(n, k):
    return prod(F(n-i, i+1) for i in range(k))

def det(a):
    a = [[F(x) for x in row] for row in a]
    ans = F(1)
    for i in range(len(a)):
        pivot = next((j for j in range(i, len(a)) if a[j][i]), None)
        if pivot is None:
            return F(0)
        if pivot != i:
            a[i], a[pivot] = a[pivot], a[i]
            ans = -ans
        x = a[i][i]
        ans *= x
        for j in range(i+1, len(a)):
            t = a[j][i] / x
            for k in range(i+1, len(a)):
                a[j][k] -= t * a[i][k]
    return ans

def cofactor(a):
    return det([r[1:] for r in a[1:]])

for l, t, L in product(range(1, 13), repeat=3):
    value = sum(mu(m) for m in range(1, L+1) if L % (m*l//gcd(l,m*t)) == 0)
    check('6.6.3 Mobius selector', value == int(L == 1 and t % l == 0))

for length in range(1, 4):
    for data in product(list(product(range(1, 5), repeat=2)), repeat=length):
        c = gcd(*(l*f for l,f in data))
        n = sum(l*f for l,f in data)
        a = sum(l*(l-1)*f//2 for l,f in data)
        value = c if (a+1) % c == 0 else 0
        rhs = sum(mu(d)*(-1)**sum(l+l//(d//gcd(d,f)) for l,f in data) for d in divisors(c))
        check('6.2.4 character Mobius identity', value == rhs)
        by_order = {}
        for e in range(n):
            v = c if (a+e) % c == 0 else 0
            order = n//gcd(n,e)
            check('A.4 degree order', by_order.setdefault(order,v) == v)

for n in range(1,5):
    edges = list(combinations(range(n),2))
    for weights in product(range(1,4), repeat=len(edges)):
        a = [[0]*n for _ in range(n)]
        for (i,j),w in zip(edges,weights):
            a[i][i] += w; a[j][j] += w
            a[i][j] -= w; a[j][i] -= w
        total = 0
        for selected in combinations(range(len(edges)),n-1):
            parent = list(range(n))
            def root(i):
                while i != parent[i]: i = parent[i]
                return i
            good = True
            for k in selected:
                i,j = edges[k]
                if root(i) == root(j): good = False; break
                parent[root(i)] = root(j)
            if good: total += prod(weights[k] for k in selected)
        check('6.3.1 weighted trees', cofactor(a) == total)

for g, d1, d2, v1, v2, f1, f2, cycles1, cycles2 in product(
    range(3), range(1,3), range(1,3), range(1,4), range(1,4),
    range(1,3), range(1,3), [(1,),(2,),(1,1)], [(1,),(2,),(1,1)]):
    if d1 % f1 or d2 % f2: continue
    data = [(d1,v1,f1,cycles1),(d2,v2,f2,cycles2)]
    chi = 2*g-2
    vertices = [(i,l) for i,(_,_,_,cs) in enumerate(data) for l in cs]
    a = [[0]*len(vertices) for _ in vertices]
    for x,(i,l) in enumerate(vertices):
        for y,(j,k) in enumerate(vertices):
            if x >= y: continue
            di,vi,fi,_ = data[i]; dj,vj,_,_ = data[j]
            w = l*k*(chi*di*dj*min(vi,vj)+(fi if i==j else 0))
            a[x][x] += w; a[y][y] += w; a[x][y] -= w; a[y][x] -= w
    av = {}
    for d,v,f,cs in data: av[v] = av.get(v,0)+d*sum(cs)
    n = sum(v*x for v,x in av.items())
    S = {v: sum(x*min(v,u) for u,x in av.items()) for v in av}
    rhs = F(prod(l for _,l in vertices)*d1*d2*chi, n*sum(av.values()))
    rhs *= prod(S[v] for _,v,_,_ in data)
    rhs *= prod((f*sum(cs)+chi*d*S[v])**(len(cs)-1) for d,v,f,cs in data)
    check('6.4.1 block Laplacian', cofactor(a) == rhs)

rows = [(a,b) for a,b in product(range(4),repeat=2) if a+b]
for row1,row2,nu1,nu2,chi,eps in product(rows,rows,range(1,3),range(2,4),[2,4],list(product([-1,1],repeat=4))):
    if nu1 >= nu2: continue
    ks = row1+row2
    av = [row1[0]+2*row1[1],row2[0]+2*row2[1]]
    S = [nu1*sum(av),nu1*av[0]+nu2*av[1]]
    common = gcd(*ks)
    total = F(0)
    for l in divisors(common):
        total += mu(l)*(-1)**(sum(ks)//l)*prod(choose(eps[j]*chi*(1+j%2)*S[j//2]//l,ks[j]//l) for j in range(4))
    check('7.2.3 restricted positive range', total.denominator == 1 and total.numerator % (chi*S[-1]*sum(av)) == 0)

check('E16 nilpotent counterexample', det([[0,1],[0,0]]) == 0 and F(1,2) != 0)
check('E26 order counterexample', 2//gcd(2,1+1) == 1 and 2//gcd(2,1) == 2)
for n in range(1,8):
    for e in range(-8,9):
        h = [(e*i)//n-(e*(i+1))//n for i in range(n)]
        check('E7 floor exponent total',sum(h) == -e)

print(counts)
print('PASS', sum(counts.values()), 'finite exact checks; these are not Lean proofs')
```

## Exact continuation gates

### S1 — Journal collation and independent verification of source issues

Read the final 109-page journal text and collate with arXivv5, not just the publisher record. Independently verify E1–E28 with images, particularly E4/E6/E8/E15/E16/E26; establish exact effect on the final printed results. No finding presently claims to be confirmed in the journal or by an independent reviewer.

Needed by: 001, 002, 003, 004, 005, 006, 007, 008, 009, 010, 011, 012, 013, 014, 015, 016, 017, 018, 019, 020, 021, 022, 023, 024, 025, 026, 027, 028, 029, 030, 031, 032, 033, 034, 035, 036, 037, 038, 039, 040, 041, 042, 043, 044, 045, 046, 047, 048, 049, 050, 051, 052, 053, 054, 055, 056, 057, 058, 059, 060, 061, 062, 063, 064, 065, 066, 067, 068, 069, 070, 071, 072, 073, 074, 075, 076, 077, 078, 079, 080, 081, 082, 083, 084, 085, 086, 087, 088, 089, 090, 091, 092, 093, 094, 095, 096, 097, 098, 099, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139.

### S2 — Spectral original sources and exact operator formulas

Read the full relevant Arthur, Langlands, Moeglin–Waldspurger and Laf97 proofs; finish image-level collation of Laf97 pp306–308. Expand item063's structural formula into every operator, finite fibre and domain, reconcile rho conventions in E8 and check the conductor/central sign computation. Read Ch15 Lemmas6.2.3–6.2.6 and its HN construction, not merely the theorem reduction.

Needed by: 020, 021, 025, 038, 039, 050, 051, 060, 061, 062, 063, 064, 065, 066, 067, 116, 117.

### S3 — Bundle/Higgs and Mellit source closure

Read Nitsure Thm7.4, the full Schiffmann bundle/Higgs and density arguments, Mellit's full proof and Ch15 Thm4.1.2. Separate existence, smoothness, rational coarse points, scalar stabilizers, stack mass and point counts. Split all multi-part imports and give exact base-field/characteristic hypotheses; ET.2b alone does not supply the all-characteristic coarse-moduli result.

Needed by: 026, 027, 030, 031, 033, 035, 036, 037, 039, 045, 046, 110, 125, 126, 138.

### S4 — Weil, Langlands, normalizer and Whittaker leaves

Read the exact KW01 Thm3.3(2) normalizer statement: item123 is only a bounded input contract and must not be treated as complete. Read relevant Lafforgue02, Deligne, Shalika, Flath, Shintani and Cogdell arguments. Split trace, Euler characteristic, purity and duality in item042. Close continuity, semisimplicity, unramified twist and conductor interfaces.

Needed by: 003, 005, 006, 013, 014, 016, 040, 042, 057, 068, 123, 124, 127, 128, 129, 130.

### S5 — Combinatorial and integral boundary cases

Turn the exact finite tests into symbolic proof obligations. Split partition-statistics adapters off the already-built carrier. Spell out all block indices and polynomial continuation of determinant formulas. Item107 only records the positive-nu, positive-even-chi range needed for g≥2: Yu's broader zero/negative possibilities remain to be reconciled. Check generalized binomials at zero upper entries and empty products, full low-rank expansions and admissible-cone division.

Needed by: 043, 075, 076, 077, 078, 079, 082, 083, 084, 085, 087, 090, 098, 101, 102, 103, 104, 105, 106, 107, 108, 112, 139.

### S6 — Top-weight, Higgs purity and Euler characteristic sources

Read Schiffmann's leading asymptotic and AppendixB density, Hausel's Higgs purity, the exact twisted coprime nonabelian Hodge theorem and HR08 Cor1.1.1 with its quotient comparison. Item131's cohomological conventions require a complete check. No smoothness-to-purity shortcut or raw point-count division by a finite group is accepted.

Needed by: 100, 109, 111, 112, 113, 131, 132, 133.

### S7 — AppendixC ordinary monodromy and sieve closure

Read KS99 §10.6, Koblitz75 Thm5, Kowalski06 Props1/3 and Lemmas1/2, Larsen and Chavdarov97 Thm2.1 with proof. Check the replacement of almost-all auxiliary primes by infinitely many; identify the exact Honda–Tate elliptic realization. The elementary Vandermonde proof is given, but these geometric and sieve leaves are not source-closed.

Needed by: 120, 121, 122, 134, 135, 136, 137.

### S8 — Owner adapters and shared prerequisites

Confirm generic matrix-tree ownership across new merged work; this checkpoint gives it one reusable implementation in the counting extension, not a second graph carrier. Coordinate the all-characteristic GL_n moduli bridge with ET.2b and the GWZ20-B endoscopic Part II. ClassicalGroups Part II must import the split K0 machinery and upstream highest-weight theory, then separately build rational GSp descent and the tensor-generated subring. No reviewed ClassicalGroups or ET.2b audit entry exists in this snapshot; absence is not an audited negative verdict.

Needed by: 007, 008, 026, 035, 036, 074, 075, 076, 077, 078, 079, 080, 082, 083, 084, 085, 098, 099, 125, 129, 140, 141.

Resume with S2's spectral formula and S3's original Higgs/bundle inputs. Do not replace this checkpoint with a broad summary, erase the source issues, or promote it to complete until all gates and multi-part item refinements are closed.
