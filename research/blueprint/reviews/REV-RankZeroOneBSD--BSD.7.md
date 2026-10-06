# Independent review: RankZeroOneBSD BSD.7–BSD.9

**Verdict: accepted after corrections.** Reviewer: Codex, session codex-k9WVwB; job REV-RankZeroOneBSD--BSD.7, issue #478; 2026-10-06. The reviewed planning work was submitted by a different worker, codex-fmL5n5, in PR #6711. This review covers the packet and suggested file, the corresponding reader, all stage targets, the reviewed library audit, RS-30 and its review, and RT-AREA-iwasawa-1/5 and its confirmation. The binding blueprint/expansion protocols and upstream EllipticCurves and ModularForms documents were read.

The complete target-level planning pass meets PROTOCOL §0: all four stages are **planned**, none is closed, and prerequisite chains terminate in baseline declarations, justified supplier nodes/contracts, or seven explicit gaps. Acceptance does not certify the pending arithmetic proofs, integral supplier extensions, source ambiguity resolution, or fixture certificates. No unresolved contradiction is asserted as a theorem. The packet’s per-node review ledger is the full record of the 97 checks.

| Item | Final count |
|---|---:|
| Nodes | 97 |
| Definitions / constructions | 8 / 3 |
| Lemmas / theorems / comparisons / applications | 19 / 38 / 22 / 7 |
| Verified / corrected / added / unverifiable | 77 / 18 / 2 / 0 |
| API items / unit tests | 46 / 37 |
| Planets | 16 |
| Baseline declarations | 25 |
| Supplier requests / gaps | 32 / 7 |
| Reviewed source issues | 8 confirmed, 0 rejected |

## Source verification

Every node’s mathematical statement, source locator, excerpt and consumed hypotheses was checked. Searchable excerpts were matched literally modulo whitespace, then read in context; this mechanical match alone was not treated as mathematical verification. Gross’s printed pp.235–239 were inspected as images because the scan has no extractable text. His conjectural BSD statement was not used as a theorem. Source conventions distinguish primitive/imprimitive and unramified/Greenberg Selmer groups, inertia coinvariants, arithmetic Frobenius versus inverse module action, integral versus p-inverted ideals, original/chosen/distinguished lattices, full versus free point index, and absolute versus relative heights.

The source URLs below are the versions actually read. The packet’s `sources` and `sourceVersions` retain exact SHA-256 receipts and narrower read scopes. All ten main PDF receipts matched, and both author/preprint comparison receipts were independently acquired. No finding is asserted against an unverified Keller–Yin journal version.

- [Mazur's main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v2): arXiv:2303.04373v2, 15 October 2025; version actually read.
- [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/pdf/2402.12781v2): arXiv:2402.12781v2, 30 October 2024; preprint, not a verified published version.
- [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf): Inventiones mathematicae 227 (2022), 517–580; published author PDF.
- [On the integrality of modular symbols and Kato’s Euler system for elliptic curves](https://ems.press/content/serial-article-files/26230?nt=1): Documenta Mathematica 19 (2014), 381–402; DOI 10.4171/DM/450.
- [Kolyvagin’s work on modular elliptic curves](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf): L-functions and Arithmetic (Durham 1989), Cambridge University Press 1991, pp.235–256; scanned printed text.
- [Algorithms for Modular Elliptic Curves: chapter2](https://johncremona.github.io/book/fulltext/chapter2.pdf): Second edition (1997), corrected author online edition.
- [Algorithms for Modular Elliptic Curves: chapter3](https://johncremona.github.io/book/fulltext/chapter3.pdf): Second edition (1997), corrected author online edition.
- [Algorithms for Modular Elliptic Curves: examples](https://johncremona.github.io/book/fulltext/examples.pdf): Second edition (1997), corrected author online edition.
- [Algorithms for Modular Elliptic Curves: Table 1](https://johncremona.github.io/book/fulltext/table1.pdf): Second edition (1997), corrected author online edition; rows are acceptance data, not proofs.
- [Algorithms for Modular Elliptic Curves: Table 4](https://johncremona.github.io/book/fulltext/table4.pdf): Second edition (1997), corrected author online edition; numerical/analytic Sha entries are not proofs.
- [Keller–Yin author copy](https://web.math.ucsb.edu/~mulun/files/Eisenstein.pdf): collated the example, local codomain, self-disjointness, coefficient field, ring labels and cross-reference issues.
- [CGLS author preprint](https://web.math.ucsb.edu/~castella/Eisenstein.pdf): collated only the known §5.3 height/sign issues against the published author PDF.

The four elliptic-unit primary proofs named in the gap were not acquired/read as part of this packet, and full global KLZ reciprocity remains requested arithmetic work. Their existence as references does not close those gaps.

## Corrections and additions

Each changed existing node is listed here; its ledger note records the mathematical check. Identifiers below are suffixes of the node IDs in the packet.

- **eisenstein-selmer-normalization:** Checked source Selmer definitions and KY Lemma 1.3.6: the unramified/Greenberg comparison has a finite cyclic kernel and only the claimed height-one equivalence. Added the general Iwasawa algebra supplier.
- **finite-euler-factor-comparison:** Corrected inertia invariants to coinvariants and ℓ⁻¹γ evaluation, CGS Def.2.5.2/Prop.3.3.2 locators and cyclotomic hypotheses. Removed its use as an unrestricted KY/local-character Euler comparison.
- **kriz-eisenstein-congruence:** Checked integral periods, p-depletion and Euler corrections. Added p∤cond(φ) ordering and the analytic p-adic-function supplier; no algebraic local-exclusion Euler theorem is used for the analytic factor.
- **heegner-reciprocity-ideal-comparison:** Clarified that κ₁/κ∞ generate the same line only within one fixed lattice. Geometric-to-chosen lattice p^{t+N} transfer is kept explicitly and is not called a unit.
- **ky-local-character-corrections:** Corrected the restriction kernel to O-cofree rank one (dual Λ-rank zero); separated local ω H¹ dual from global ω finite-submodule correction and retained the two-generator/projective-dimension facts.
- **ky-residual-extension-lambda:** Rewired to the two new KY inputs; the primitive λ formula keeps the extra +1 precisely when φ|G_K=ω and ψ|G_K=1.
- **ky-equal-iwasawa-invariants:** Added the direct CGS/CGLS invariant-comparison input for the local-exclusion branch. In the remaining branch, the trivial-character +1 cancels the residual correction as KY states.
- **ky-integral-kolyvagin-bound:** Corrected Proposition 3.0.3 to Lemma 3.0.3; checked the integral height-one bound and explicit geometric p^t plus limiting p^N transfer.
- **integral-two-variable-functions:** Checked CGS degree/Manin, H_p and Katz h_K factors. Corrected critical-slope L3 to ordinary L2 plus integral-period L1, and registered the elliptic-unit/CM-congruence gap as a direct consumer.
- **congruent-characteristic-series:** Checked twist automorphism, finite S and no finite submodules before Fitting=characteristic. Added the general Weierstrass/Fitting algebra supplier.
- **twisted-control-augmentation-comparison:** Checked CGS Prop.3.4.2 and its local H⁰-square/Tamagawa factors. Added Bloch–Kato L4 rather than treating ordinary-cohomology L2 as the finite-local-condition interface.
- **integral-twisted-cyclotomic-equality:** Checked the three-step removal of the p-denominator and augmentation-unit argument. Added its algebra supplier; cyclotomic μ may be positive and is not silently set to zero.
- **ky-torsion-control:** Corrected Appendix B locator to Prop.B.0.1 and Thm.B.0.2, integral local δ codomain and direct BK L4 supplier. Global/local H⁰ and torsion denominator are retained.
- **greenberg-vatsal-rank-zero-prototype:** Verified the two kernel-character parity/ramification cases and torsion square from CGLS Thm.5.2.1. Corrected ordinary L2/integral-period L1 supplier paths.
- **cyclotomic-rank-zero-defect:** Verified augmentation control cancels the interpolation factors only after including torsion/Euler terms. Corrected the same ordinary-function and period supplier paths.
- **sha-annihilator-adapter:** Corrected Gross Thm.1.3 locator to p.236. A whole-Sha positive annihilator including the exceptional 2-part is required; odd bounds alone cannot justify the full product.
- **local-tamagawa-certificate-adapter:** Corrected Néron supplier from Picard R11.4 to special-fibre/component-group R11.2. Exact minimality, wild 2/3 traces and the upstream local elliptic algorithm remain required.
- **fixture-period-height-comparisons:** Corrected Gross’s literal generator excerpt/locator. Checked real component counts 1,2,2 and Reg_BSD=2^r Reg_Tau; rank-zero existing regulator result is imported with its hypotheses.

Two target-level steps were added, both marked `addedBy: REV-RankZeroOneBSD--BSD.7`:

- **BSD.7a/ky-imprimitive-residual-comparison:** KY’s chosen invariant-free residual extension and local/global correction argument gives imprimitive torsion, μ=0 and λ additivity, with the global ω/1 extra +1. Sources: §1.4.1 and Lemmas 1.4.3–1.4.4.
- **BSD.7a/ky-finite-euler-factor-comparison:** the broader KY primitive/imprimitive exact sequence and local Euler characteristic comparison on that chosen lattice. Sources: §§1.1, 1.2, 1.4 and 1.5. Its hypotheses differ from CGS’s local-exclusion branch, so the latter cannot supply it.

The added nodes are in `targetInventory`, the concrete-interface omission gap and the suggested-file inventory. Existing API items and tests were retained: all eleven definitions/constructions have at least three tests, covering such failures as zero/sign valuation conventions, missing support coverage, wrong model coefficients, false finite point order, swapped BF images and loss of integral normalization. The sixteen planets remain central definitions/constructions or named source theorems within the per-stage limit.

Other packet changes:

- Corrected the Gross source URL to its working `www` host, the printed theorem/generator locators and the literal generator excerpt. Expanded the Cremona Table 1 read scope to distinguish 26b1 and 26b2. Expanded the KY author-copy collation scope.
- Replaced the ordinary-function request to **ModularSymbolsPadicLFunctions:L3** (critical slope) with **L2** (small slope/ordinary), and added **L1** for saturated integral period lines and actual Néron comparison. Corrected the three consuming nodes accordingly.
- Replaced the Tamagawa request to **NeronModelsAndSemistableAbelianVarieties:R11.4** (Picard/semistable direction) with **R11.2** (special fibres/component groups). Retained the upstream elliptic minimality/Tate-algorithm owner and a separate real-component comparison.
- Added **SelmerIwasawaCohomology:L4** for the actual integral Bloch–Kato finite conditions. Narrowed L2 to its ordinary/unramified cohomology and lattice/Kummer scope; L3 now explicitly includes both new KY comparisons.
- Added **PadicMeasuresIwasawaAlgebras:L4** for Weierstrass, height-one characteristic, μ/λ, finite corrections, Fitting hypotheses and augmentation-unit algebra. Narrowed **IntegralIwasawaTheory:L4** to its actual Ferrero–Washington use in Wüthrich’s isogeny comparison.
- Refined **PadicHodgeRegulators:L3** to local integral Coleman maps, injectivity and pseudo-null cokernel. The **EulerSystemsAndKolyvaginSystems:ES.2** extension must separately prove the global KLZ identities for actual BF classes; a generic local big logarithm does not do that. Expanded the R01.1 and automorphic p-adic-function requests to state the additional new-node needs.
- Registered both new KY steps and the integral two-variable CM-congruence comparison as consumers of the elliptic-unit owner gap. Expanded BSD.7a’s `remaining` to retain the ring ambiguity, broader cyclotomic adaptation and fixed-lattice comparison. These changes leave seven gaps and all four stage statuses unchanged.
- Added the top-level review and source-issue verdicts. The suggested Lean changes are two comment inventory entries; no arithmetic surrogate type or signature was introduced.

## Baseline and supplier checks

Every one of the following declarations was opened and its statement read at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** or Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. **No baseline citation was removed or replaced.** The existing reviewed audit shows the higher BSD stages unavailable; the existing rank-zero regulator, curve/point carriers and valuations are reused, not replanned.

| Exact reference | Statement/convention verified |
|---|---|
| `mathlib:padicValRat` | Integer-valued rational valuation, defined as numerator valuation minus denominator valuation; its value at zero is zero. |
| `mathlib:padicValInt` | Natural-valued integer valuation, defined using the absolute value of the integer. |
| `mathlib:Rat.num_or_den_zero_padicVal` | For any rational q and prime p, the valuation of q.num or q.den is zero. |
| `mathlib:dvd_iff_padicValNat_ne_zero` | For a prime p and nonzero natural n, p divides n exactly when its natural valuation is nonzero. |
| `mathlib:padicValRat.zero` | For every natural p, the valuation of rational zero is zero. |
| `mathlib:padicValRat.one` | For every natural p, the valuation of rational one is zero. |
| `mathlib:padicValRat.neg` | Negation preserves the rational valuation. |
| `mathlib:padicValRat.of_nat` | Rational valuation of a natural cast equals its natural valuation. |
| `mathlib:padicValRat.self` | For 1 < p, the valuation at p of the rational p is one. |
| `mathlib:padicValNat.eq_zero_of_not_dvd` | Nondivisibility of a natural n by p implies valuation zero. |
| `mathlib:Nat.primeFactors` | The finite set of prime factors of a natural number; at zero it is empty. |
| `mathlib:Nat.mem_primeFactors` | Membership means primality, divisibility, and nonzero natural argument. |
| `mathlib:Nat.primeFactors_eq_empty` | The prime-factor set is empty exactly for zero and one. |
| `mathlib:Nat.Prime.dvd_iff_eq` | If p is prime and a is not one, a divides p exactly when p equals a. |
| `mathlib:Nat.forall_prime_iff_two_and_odd` | An assertion holds at every prime exactly when it holds at two and every odd prime. |
| `mathlib:padicValRat.mul` | Under Fact p.Prime and nonzero q,r, v_p(qr)=v_p(q)+v_p(r). |
| `mathlib:padicValRat.pow` | Under Fact p.Prime, v_p(q^k)=k*v_p(q), including the library zero convention. |
| `mathlib:padicValRat.div` | Under Fact p.Prime and nonzero q,r, v_p(q/r)=v_p(q)−v_p(r). |
| `mathlib:WeierstrassCurve` | Actual five-coefficient Weierstrass model over a type R. |
| `mathlib:WeierstrassCurve.Δ` | Integral polynomial discriminant of the actual coefficients. |
| `mathlib:WeierstrassCurve.IsElliptic` | Ellipticity is invertibility of the discriminant; over a field this is its nonvanishing. |
| `mathlib:WeierstrassCurve.Affine.Nonsingular` | The affine equation with at least one nonzero partial derivative. |
| `mathlib:WeierstrassCurve.Affine.Point` | Actual nonsingular affine points plus zero; the group law has an AddCommGroup instance. |
| `mathlib:orderOf` | Multiplicative minimal-period definition and its generated additive addOrderOf: least positive n with n•a=0, or zero for infinite additive order. The declaration index lists the source orderOf name. |
| `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero` | With Field, AdmissibleAbsValues, DecidableEq, IsElliptic and Module.Finite ℤ PointModTorsion, finrank zero implies regulator=1. |

For the prime-support core, nonzero rational hypotheses are retained where prime-factor membership needs a nonzero argument; rational valuation at zero is zero. For the curves, `IsElliptic` means invertible discriminant, and the point constructor needs an actual nonsingularity proof. The cited `orderOf` source generates `addOrderOf`, where zero represents infinite order. The regulator theorem’s finite-module and absolute-value assumptions were read, not inferred from its name.

Twenty-five directly cited external blueprint node statements were read, together with the relevant supplier stage contracts and the upstream elliptic/modular layers. BSD.0/BSD.4/BSD.5/BSD.6 and GZ.0 conventions were checked. Requests explicitly identify extra work or Part II exports where an existing statement is insufficient. In particular, the early HE.8 class input is distinct from the downstream HE.8b equality; generic Euler-system bounds are not full KLZ reciprocity; and Kato’s presently rational input is not Wüthrich’s integral distinguished-lattice theorem. No finished downstream main conjecture is used to prove itself.

The supplied RT-AREA-iwasawa-1/5 is correctly represented in both packet and reader as an **elliptic-unit main-conjecture owner gap**: Rubin’s integral equality, Hida–Tilouine’s CM congruence comparison and Hida’s anticyclotomic μ=0 still require exact-character source verification. Katz construction alone, a nonexistent stage, HE.8b or MIMC L6 does not discharge it. The review additionally registers the CM-congruence consumer at `integral-two-variable-functions`. The packet’s proposed EU.0–EU.4 direction needs coordination with the existing HE.7s routing before an owner is instantiated.

## Source-issue review

All six original entries now carry independent confirmed verdicts. Two missed misprints were added with confirmed verdicts. The packet records searches in current arXiv versions, author copies and correction/erratum searches; no additional correction was located in those searches.

- **E3:** confirmed the CGLS published §5.3 sign error, corrected explicitly by KY §4.2: the two defect valuations sum to zero. The final vanishing conclusion is unaffected.
- **E4:** confirmed the CGLS full-index height error. The regulator uses the free lattice; full index contributes an extra torsion square. KY’s control denominator and the BSD.5 height convention are separate checks.
- **E5:** confirmed KY Appendix B’s global-W/local-T codomain mismatch. The following (B.1) gives the correctly typed integral local finite group modulo torsion.
- **E6:** confirmed and corrected the extraction itself: Cremona 19a3 has rank 0/torsion 3; Cremona 26b2 has rank 0/trivial torsion. The rank-zero torsion-seven curve is Cremona 26b1, which is LMFDB 26.b2. [Cremona Table 1](https://johncremona.github.io/book/fulltext/table1.pdf), printed pp.110–111, and the [LMFDB 26b class cross-labels](https://www.lmfdb.org/EllipticCurve/Q/26b/) independently distinguish the suffix conventions.
- **E7:** confirmed the impossible cyclotomic self-disjointness assertion in KY Remark 1.2.3(ii). The intended anticyclotomic/cyclotomic disjointness supplies the needed open character image, with the finite cyclotomic part kept separate.
- **E8:** confirmed an internal **ring ambiguity**, not a refutation of integral IMC2 or BSD: Introduction B says Λ; detailed IMC1/IMC1′ say undefined Λ^ac. The packet retains the weaker index-square interface until the integral class/lattice comparison is verified.
- **E9 (added):** KY’s proof of Theorem 3.0.10 calls item 3.0.9 a theorem; it is Remark 3.0.9. This repairs the reference but does not close the broader cyclotomic-adaptation gap.
- **E10 (added):** KY §1.5 prints the wrong ℓ-adic coefficient field for its p-adic lattice. The correct representation is obtained over the fixed p-adic fraction field F, as explicitly defined in §1.3. The new local Euler comparison uses that representation and inertia coinvariants.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/RankZeroOneBSD--BSD.7.json`: **0 errors, 0 warnings**, with the declaration index available.
- `lean-check research/blueprint/suggested/RankZeroOneBSD--BSD.7.lean`: **exit 0** in the shared pinned build, after the memory check; **85 warnings, all declaration uses of `sorry`**, no errors or other warnings. The final file was checked after its two inventory additions.
- Independent structural checks: exact one-entry-per-node review coverage; every added node has the required `addedBy`; local dependency graph acyclic; every scoped `targetInventory` exactly matches the realised target nodes; all 97 node IDs, 46 API names and 37 test names occur in the suggested file or its explicit omission inventory.
- Independent exact rational arithmetic replay: all three discriminants/c₄/j invariants, 11a3 point multiples through 5P=O, 37a1 multiples through 8P and its nonintegral short-model coordinate, 32a2 two-torsion addition, and #11a3(𝔽₅)=5/a₅=1 passed. This checks the fixture mathematics; it is not a Lean proof, a saturation/rank/Sha certificate, or the requested analytic interval replay.
- The suggested file uses the real baseline rational, Weierstrass and affine-point types. Missing concrete arithmetic interfaces are omitted by name as permitted by §13; they are not fabricated as arbitrary Prop-valued parameters. All existing definitions/constructions retain their required tests and actual mathematical acceptance values.

## Orchestrator follow-up

1. Synchronize `research/blueprint/readmes/RankZeroOneBSD--BSD.7.md` from the accepted packet. The reader correctly states the confirmed red-team gap but still has the old local-cofree wording, Euler comparison, supplier routes and source-issue extraction. It was read but cannot be edited under this review issue’s deliverables.
2. Coordinate the proposed elliptic-unit owner with HE.7s and arrange the four exact primary-source verifications. The packet does not claim those proofs were read or available.
3. Route the precise supplier extensions for Wüthrich, actual KLZ reciprocity, early Heegner local conditions, chosen/distinguished lattice transfer and broader KY cyclotomic adaptation; retain the noncircular proof ownership.
4. Seek a definitive clarification of KY’s IMC1 coefficient ring and perform the integral two-way class comparison before strengthening that export. Keep integral IMC2 and the odd-good-prime BSD theorem separate.
5. Queue rigorous analytic interval replay and model-specific finite arithmetic, whole-Sha annihilator, local/isogeny and saturation certificates. A listed fixture’s full BSD application remains conditional until those producers are supplied; odd-prime evidence alone never resolves the dyadic gate.

No maintainer approval is needed for this review’s submission. These are precisely scoped follow-up questions/work, not reasons to reject an otherwise correct finished target-level pass.
