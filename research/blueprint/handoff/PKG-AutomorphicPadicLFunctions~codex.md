# AutomorphicPadicLFunctions package handoff

Issue: #10881. Agent: Codex. Session: codex-UmyIz6. Claim confirmed for comment 6292853640. This submission completes the packaging job; it is not a claim that the proposed mathematics is formalised or that the source gaps below are solved.

## Delivered scope

The three package files provide the main roadmap's eight layers, exact supplier contracts, definition APIs, discriminating Checks, worked examples, downstream interfaces and source locators. The README is approximately 147 KB. Suggested.lean has 219 lines, nine light definitions, three theorem signatures and eighteen proved examples. Two theorem proofs are admitted. All heavy carriers remain README targets, named in one closing Lean comment. No data definition or example is admitted.

The separate AutomorphicPadicLFunctionsPartII packet is the Kings–Sprang extension, with 44 nodes and nine layers. It is not silently assembled into this package: the issue's main roadmap has 105 nodes, and the Part II construction remains a downstream consumer. The input packets, readers, atlas and old suggested files were not edited.

The following coverage map accounts for all 105 main-packet nodes. Names in this table are input inventory names, not new target identifiers in the README.

| Layer and nodes | Package coverage |
| --- | --- |
| L0, 13 | §§0.1–0.5 cover unit closure; fixed-tame ray tower; exact sequence; dimension and Leopoldt defect; arithmetic reciprocity; avatars; locally algebraic characters; Gauss sums and depletion; odd-character nonvanishing; quotient distributions; evaluation/norm/twist/tame maps; conditional evaluation; Euler elements. General carrier results are supplier imports. |
| L1, 10 | §§1.1–1.4 cover weights and both coefficient conventions; cusp data and twisted L-functions; Eichler–Shimura–Harder; algebraic period line; normalized symbol; cycles; evaluation maps; BSW integral formula; critical-value formula; rational modular-symbol comparison. General cohomology and automorphic representation theory are supplier imports. |
| L2, 21 | §§2.1–2.7 cover analytic coefficients, cohomology, corrected compactness, slopes, negative-slope vanishing, partial theta maps, control and eigenlift, chart evaluation and weighted inversion, finite evaluation and representatives, refinement eigenvalue, norm relations and normalization, common levels, classical compatibility, interpolation, choices, growth/uniqueness and rational/Hilbert/Bianchi comparisons. |
| L3, 21 | Twenty construction nodes are retained in the detailed PadicFamilies Layer 5 supplier contracts: partial zeta, cusps, Eisenstein expansions and all cusp constants, rationality, p-adic Hilbert forms, Igusa irreducibility, integral q-expansions, Deligne–Ribet measure/pseudomeasure, ordinary CM type and points, periods, differential operators, CM algebraicity, Katz measure/L-function/functional equation, tame Hida–Tilouine interpolation and group-ring families. The rational Deligne–Ribet comparison stays in §3.1; §3.2 states the normalization dictionary. |
| L3h, 15 | §§3h.1–3h.10 cover the Hsieh datum, explicit Waldspurger formula, test vectors, square-root distribution, interpolation, CM integrality, global/local μ, central-value nonvanishing, BDP comparison, linear independence, corrected density, Katz μ, Hecke-value nonvanishing and Finis divisibility. The mod-p umbrella node is realized by these precise components, rather than a second unqualified theorem. Cofinite source gaps are retained explicitly. |
| L4, 16 | §§4.1–4.9 cover the EHLS datum, lattices/Hecke algebra, Gorenstein/multiplicity/minimality hypotheses, differential operators, Eisenstein measure, global doubling identity, p-local and archimedean factors and main theorem; then hermitian Siegel data, big-cell sections, family rationality, Panchishkin condition/eigenlines, local integral, bounded measure and functional-equation parity. |
| L4e, 6 | §§4e.1–4e.5 cover Eischen–Wan data, Siegel measure, pullback/local calculations, Klingen family, p-adic L-function and rank-two constant-term divisibility. |
| L5, 3 | §§5.1–5.2 cover actual evaluation domains, normalization comparisons and verified instances of the supplied CPR/Panchishkin existence proposition. The conjectural general existence proposition is not promoted to a constructor. |

## Ownership and duplication audit

Read the current TauCetiRoadmap checkout at commit 0d144d044dacebca17b654695b6f1ad58f159b27, current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and current Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Separately inspected declarations at the required pins, Tau Ceti f790474 and Mathlib 082e2d3. All use was read-only; no Lake command ran in those checkouts. The reviewed library audit lists all eight layers as not built; its partial matches concern general carriers, not these constructions.

Object searches included ray moduli and class maps, closure/profinite limits, Hecke characters and infinity types, Gauss sums, monoid algebras, locally analytic duality, compact/slope operators, algebraic coefficient systems, automorphic bundles, ordinary/CM moduli, theta functions and integral lattices. Also searched the post-snapshot AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry directions and the completed/general analysis roadmaps. General bundle, connection, lattice, profinite and closure constructions stay with those owners. No source-specific BSW, Hsieh, Finis, EHLS, Disegni–Liu or Eischen–Wan construction was found there.

Duplication removals and moves:

- Finite `Modulus`, `classMap`, `classMap_surjective` and `finite_rayClassGroup` are Tau Ceti suppliers. In particular the transition goes from the larger modulus to the smaller one. The Lean import and `#check` pin the actual module/declaration.
- Existing complex Hecke characters, `ofRayClassCharacter`, conductors and `IsAlgebraic` are cited as current-library suppliers. The README explicitly distinguishes that newer API from what is available at the pin.
- Mathlib `gaussSum` and `gaussSum_mulShift_eq` are consumed, not replanned. `finiteGaussCore` is only the short weighted kernel used by proved sign tests; the conductor/different correction is a separate roadmap target.
- Measures, completed algebras, character spaces and their general topology remain PadicMeasuresIwasawaAlgebras; analytic duals, slope decompositions and uniqueness remain LocallyAnalyticDistributions. This package states only the application-specific verification and evaluation.
- As required by upstream/CaraianiNewton.md's excluded-roadmap rule, old L3 moves into PadicFamilies Layer 5. The existing PadicFamilies §5.10 Hilbert Eisenstein constants do **not** already supply the whole DR/Katz chain. The exact extra contracts remain printed here for the supplier update, including ordinary finite-field classification and the compactified ideal carrier needed for the full 2-adic refinement. No supplier completion is falsely asserted.
- General CM theory, Heegner/Gross–Zagier constructions, metaplectic theory and integral main conjectures are not prerequisites imported from later roadmaps. The narrow CM/toric and Finis theta definitions needed here are explicitly planned at this level or in the moved-down contract. The compatible Galois representation used in the μ theorem is explicit input.
- The CPR/Panchishkin proposition and realization data are supplied by SelmerIwasawaCohomology Layer 4 and ModularIwasawaMainConjectures Layer 5; there is no duplicate general conjecture framework here.
- Corrected owner names include PELModuli, AutomorphicBundles, SmoothRepresentationsOfLocalGroups, AutomorphicFormsOnReductiveGroups and ModularSymbolsPadicLFunctions. FoundationsAndLibraryIntegration and UPSTREAM bookkeeping references do not occur in the README.
- The general-number-field Eichler–Shimura–Harder injection still needs ArithmeticLocallySymmetricSpaces' cochain/boundary-compatible supplier extension. The integral ordinary Hilbert Igusa tower is more than the existing generic-fibre Hodge–Tate tower. Eischen–Wan's auxiliary ordinary split prime is explicit input; its Sato–Tate production is not an upward dependency on ModularityAndLanglandsExtensions.

## Sources and remaining mathematical limitations

All source prose is in our own words. Public PDFs and rendered pages were read in scratch; no source file or verbatim passage is submitted. No cleared private-library book was needed. No suspicious instruction was encountered in fetched material or issue text.

The six inherited gaps were addressed as follows:

| Input gap | Source work and disposition |
| --- | --- |
| Hida 2004 density not read | Read the author's public preprint and March 2025 corrected revision. The revision withdraws the old Theorems 3.2–3.3 inference. Its Theorem 5.2, pp. 28–29, gives density in all ranks; Corollary 5.3, p. 30, gives a restriction on bad conductor levels in rank one. Neither proves cofinite nonvanishing. Both stronger Hsieh rank-one conclusions remain separately named source gaps in §§3h.7–3h.8. |
| Vatsal 2003 not read | This input never stated a Vatsal theorem, only an external contextual import. The package does not invent that theorem. Finis' independent theorem is stated directly with its exact local correction, and Vatsal is only comparison context. A consumer needing Vatsal's separate theorem must source that import itself. |
| BSW integral computation deferred to thesis | Read Williams' thesis §12.1.4, pp. 138–145, alongside BSW Theorems 4.6 and 5.7. The README retains the real/complex Mellin factors, discriminant, Gauss sum and orientation, rather than inferring them from the rational case. |
| Katz/Hida–Tilouine local terms only indirectly read | Read Katz §§2.4, 2.6, 4.2, 5.2–5.3 and Hida–Tilouine Theorem II, p. 193, and Theorem 5.1, pp. 229–230. The contracts include the finite local Fourier sum, both critical chambers, primitive interpolation and the tame functional equation. These are additional PadicFamilies obligations, not implemented suppliers. |
| Totally real growth not read | Read Barrera Salazar 2018 Proposition 6.10, p. 2208, and Theorem 7.2, pp. 2209–2210. Growth does not require Leopoldt. Finite-order interpolation alone does not give uniqueness. The README separately states the extra one-variable moment range and strict order bound sufficient for the conditional comparison. |
| Deligne ordinary finite-field equivalence missing | Read Deligne 1969 Theorem 7, pp. 240–242, and DR (4.5). The exact `ordinaryDeligneModule` input is now named with API and three Checks, including q=2 and rank zero. It belongs in the lower construction chain; ordinary deformation theory alone is insufficient. Its supplier implementation remains required. |

Other limitations remain visible rather than being hidden by schematic hypotheses:

- `hsieh_centralValues_cofinite_rankOne` and `HeckeValues_cofinite_rankOne` need independent replacement arguments matching their local hypotheses. The construction, interpolation, Fourier μ formula and corrected density conclusions do not depend on those stronger assertions. Hida 2010 linear independence is distinct from the withdrawn density inference.
- `unitaryRankOne_KatzComparison` requires the complete integral local-section, period and pairing dictionary. EHLS §1.2 motivates it but does not itself prove the proposed equality of all normalizations. It remains a comparison obligation in §5.2.
- The full DR 2-adic result uses compactly supported odd tests on its compactified ideal space, with the norm-zero-boundary parity defect. It must not be implemented as a boundary evaluation of an arbitrary distribution on the ray quotient. This extra carrier and its finite-support quotient are part of the moved supplier obligation.
- No general-number-field growth/uniqueness theorem beyond the supported cases is claimed. No zero analytic germ is assigned a finite vanishing-order parity. No characteristic-p or equal-characteristic coefficient version of characteristic-zero interpolation is asserted.

## Adversarial pass

Every statement family was checked against its displayed hypotheses, source domain and supplier contract. Rows group related definitions/theorems; source-specific heavy examples remain prose because their carriers do not exist at the pins. The nine retained light definitions each have two proved Lean examples, with paired numerical witnesses where a sign or direction is at issue. No arbitrary predicate is used as an unproved compatibility assumption hiding a missing construction.

| Statements | Instances tried | Result / change |
| --- | --- | --- |
| Ray inverse system and reciprocity | Unit tame ideal; Q at conductor p, 2 and 4; trivial class group | Fixed tame conductor is bounded by n, not arbitrary ramification outside np. Q's p-level ray group has p−1 elements. Transition direction is explicit. |
| Unit closure and dimension | F=Q, real quadratic, imaginary quadratic; δ=0 and δ>0; p=2 | Uses closed positive congruence units. The 2-adic finite sign group is retained. Dimension is r₂+1+δ. |
| Avatars and norm | Rational unit coordinates 2 and 3; trivial character | Arithmetic ray coordinate is inverse. Ideal norm and local-unit coordinates are distinguished. |
| Quotient analytic duality | Trivial subgroup, full subgroup, Dirac distribution | Corrected false invariant-distribution and unique-lift claims: quotient tests are invariant; every upstairs distribution pushes forward. |
| Gauss sum and conductor | Conductor exponents 0,1,2; trivial character; inverse additive character over F₇ | Distinguishes positive multiplicative conductor idele from inverse additive representative. Proved kernel values 5 and 2 detect the additive sign. |
| Euler elements | Trivial group; F₅[C₃]; N(w) nonunit; field versus DVR | Requires N(w) invertible in a general coefficient ring. Proved identity and nonidentity coefficients distinguish subtraction. |
| Euler units and μ | 1−[γ], augmentation zero; scalar ϖ | Deleted nonunit-implies-positive-μ and blanket unit equivalences. A nonunit Euler element can have μ=0. |
| Algebraic weights | k=0; two real weights of equal purity; unequal complex-conjugate weights | Nonnegativity, conjugation and purity kept separately. Proved positive and negative controls. |
| Critical indices | k=(2,3), j=(0,3) and (0,4) | Distinguishes the critical box from global character compatibility. |
| Polynomial coefficient action | diag(2,3), upper/lower shears on (2,3) | X scales by d, Y by a; two proved examples fix transpose/order. |
| Degree and orientation | Q at k=0,2 and j=0,1,2; imaginary quadratic | Corrected middle-degree language: bottom degree is r₁+r₂. Signs and complex factor 1/2 retained. |
| Period line | Scale Ω by a and a²; zero period | Zero is excluded. Linear symbol scales inversely; toric root scales before squaring. |
| Classical integral | Rational and complex place; critical endpoints | Retains both complex-embedding gamma factors, conductor/different and orientation. Uses thesis computation. |
| Analytic action and compactness | Upper unipotent; translation depth 0/positive; noncompact chart | Positive chart improvement and the corrected compactness domain are explicit. No generic bounded operator is called compact. |
| Negative slopes | Zero space; bounded stable lattice versus bare L-space | Retains the integral lattice needed for spectral nonnegativity. |
| Theta/control | k=0; equality at slope boundary; partial versus full classicality | Strict bounds and reflected weight/v shift retained. Equality is not small slope. |
| Eigenlift | Zero eigenspace; simultaneous small-slope space; larger cohomology | Uniqueness is inside the specified simultaneous small-slope subspace. |
| Weighted inversion | Unit coordinates 2,3 and delta at 2 | Proved values 3,4; support moves to 1/2. Weight and inverse are both needed. |
| Refinement eigenvalue | Empty index set; one prime at exponents 1,2; two primes | Empty product is 1. Proved values 2,4 and 18 pin multiplicative exponents. Zero eigenvalue is excluded. |
| Norm and common-level independence | Zero raw value; raw(n)=3·2ⁿ; constant raw=3 | The theorem assumes the genuine update norm relation. Positive example normalizes to 3; negative control gives 3 versus 3/2. |
| Growth and uniqueness | Finite-order tests only; bounded measure versus analytic distribution; Leopoldt defect | Separates interpolation, growth and uniqueness. Conditional one-variable criterion includes all needed polynomial moments. |
| Hilbert cusp constants | Infinity/zero cusp; k=1; trivial primitive conductor; failing conductor divisibility | Adds both weight-one contributions on the intersection. Inverse characters are extended by zero; no division by a zero character value. |
| Ordinary Igusa geometry | One connected component versus determinant union; supersingular point; p=2 | Irreducibility is componentwise. Ordinary multiplicative rank is required. |
| Ordinary Deligne modules | q=2 companion of X²−X+2; X²+2; T=0; q=1 | First is ordinary, second supersingular, zero is valid, q=1 excluded. Semisimplicity/Weil size and integral V are retained. |
| DR smoothing and pseudomeasure | c=1; zero polynomial; augmentation denominator zero; p=2 | No 0/0 specialization. Nonzero-divisor denominator required. Full 2-adic test domain and exceptional/parity cases preserved. |
| CM datum and periods | Split/inert p; empty CM type; zero differential; two period weights | Inert p fails ordinary type. Periods compare through algebraic differentials, not a cross-field quotient. |
| Katz operator and measure | Constant term; two commuting derivatives; x=2,3 | Constants differentiate to zero. Weighted inversion makes H=1 in both unit tests. Noncovariant functions do not descend. |
| Katz/HT interpolation | k=1,d=0; both critical chambers; ramified/unramified local character | Gamma arguments positive; finite Gauss sum and tame conductor/functional-equation factors retained. |
| Toric vectors and square | Rank-one Q case; unit/nonunit vector rescaling; local Euler zero | Normalized integral vector is required. Central values interpolate ℒ². Whittaker and final CM e-factors have an explicit nonzero character ratio. |
| Hsieh μ | Zero measure; unit Fourier coefficient; ramified coefficient DVR | μ(0)=∞. Scaling changes μ_p by 1/e and μ_ϖ by 1. Residual irreducibility and local defects retained. |
| Corrected density | Rank one and higher; single valid residue class; infinite sparse bad levels | Uses the corrected minimal coefficient hypothesis. Dense does not mean cofinite, and no-arithmetic-progression does not mean finite. |
| Katz anticyclotomic μ | Exceptional polarization/residual case; self-dual signs ±1; zero local defects | Retains all exceptional conditions. Sign −1 gives zero measure and infinite μ, not a finite local sum. |
| Finis theta and divisibility | ν=0,1; conductor/valuation primes distinct or equal; K=Q(√−3), ℓ=3 | Keeps generalized theta dimension and nilpotent order, arithmetic lattice/pairing, local correction and the exceptional lower-bound case. No appeal to withdrawn cofinite density. |
| BDP comparison | k=2 and higher; square-root sign ± | Negative norm exponent and squared Euler factors retained. Compares the square first. |
| EHLS data/hypotheses | n=1, n=0; arbitrary signatures; zero cusp module; rank-one dual | n≥1. Zero module fails required eigenline. Gorenstein, multiplicity and minimality have their actual module/Hecke content. |
| EHLS local/global identity | Unit period change; different pairing generator; exceptional Euler zero | Direction of D(χ)I is checked; periods and congruence pairing retained. Euler factors need not be nonzero. |
| Disegni–Liu local data | r=1,2; positive/zero depth; ramified π; middle β nonunit | Positive-depth rationality restriction retained. All normalized β are integral, β_r is a unit. Full q^{s(s−1)/2} factors kept in both Satake polynomials. |
| Disegni–Liu measure/parity | Leopoldt defect; trivial character; zero germ; finite order 1,2 | Character space need not be one-dimensional. Functional equation is unconditional; parity requires a nonzero germ of finite order. |
| Eischen–Wan | Finite slope versus ordinary; r=1,2,3; p=2; missing auxiliary ordinary prime | Finite slope retained. Constant-term theorem is r=2 only; p odd and auxiliary prime hypotheses are explicit. |
| Comparison/existence interface | Different ray quotients; torsion branch; square versus root; h=1 supersingular gap | No identification of unrelated groups. CPR growth integer 1 alone does not imply boundedness or ordinary admissibility. Unsupported equalities remain separate obligations. |

## Validation and resume information

- `lean-check research/blueprint/packages/AutomorphicPadicLFunctions/Suggested.lean`: exit 0 at the required pins; only two `declaration uses sorry` warnings, for `linearEulerCore_eval` and `normalisedLevelValue_independent`. All eighteen examples and weighted-inversion involutivity are proved. Memory availability was checked before compiling. No language server or build/cache/update command was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicPadicLFunctions.json`: exit 0, zero errors and zero warnings. This validates the unchanged input's structure, not the new source-gap resolutions or mathematical truth.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: four files, zero problems.
- `git diff --cached --check`: exit 0, no whitespace errors; exactly the four permitted paths are staged.

Independent review should start with the two cofinite source gaps, the explicit lower PadicFamilies extension, the rank-one EHLS/Katz comparison obligation, and normalization checks in §§1.4, 2.6, 3h.2–3h.4 and 4.4–4.8. Public links and exact source locators are in the README; no scratch artifact is necessary to resume. There is no second job in this run.
