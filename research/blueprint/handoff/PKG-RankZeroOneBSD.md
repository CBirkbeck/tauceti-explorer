# PKG-RankZeroOneBSD handoff

Job #9191, completed by Codex (GPT-6), session codex-aO0QdW.

The package is complete as a roadmap deliverable. It does not claim that its
arithmetic targets have been formalized or that the accepted plans' mathematical
gaps have been proved. The independent package review can start from the four
deliverables without this run's scratch directory.

## Inputs and completeness

The two current accepted packets are authoritative: BSD.0 contains 68 targets
and eight gaps; BSD.7 contains 97 targets and seven gaps. The assembly reader and
its handoff describe an earlier partial state, so their coverage verdict was not
used to omit current targets. Neither packet nor the assembly files was edited.

The README has 153 numbered targets in 15 layers. The other 12 input targets
were removed because current upstream or another roadmap owns them, as enumerated below. Every
retained statement, hypothesis, proof outline, source locator, API entry, unit
test and acceptance condition is represented in the package. Every retained
definition or construction has at least three discriminating Checks. Additional
worked examples distinguish rank equality, whole-Sha finiteness, a single prime
part and a full certified leading-term identity.

The package keeps the full reader detail and uses a 241-line Suggested.lean
containing five real-bodied definitions/structures, representative milestones
and examples. Arithmetic carriers that cannot be stated together at the pins
remain README targets; the closing Lean comment names the omitted definitions
and constructions. No arbitrary arithmetic predicates, sorry-defined data,
auxiliary development or constructions with unproved data bodies were retained.

## Ownership audit and removals

Read the reviewed library audit, current upstream EllipticCurves and
ProfiniteArithmetic README/Suggested files in full. Audited the nine current
roadmaps newer than the atlas snapshot and the Completed roadmaps/current
library for overlapping mathematical objects and constructions. Current upstream commit was
0d144d044dacebca17b654695b6f1ad58f159b27; current Tau Ceti was
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. These checkouts were only read.

Pinned declarations were read at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. In particular the point map,
trace–norm twist and point equivalence, Galois point descent, canonical-height
and regulator conventions, entire-extension interface, rational
numerator/denominator, finite prime factors and totalized rational valuations
were checked before using them.

| Removed input target | Existing owner |
|---|---|
| BSD.0/actual-l-function | EllipticCurveModularity R29.6, using Tau Ceti's pinned entire-extension interface |
| BSD.0/rational-newform-bridge | EllipticCurveModularity R29.3–R29.6 |
| BSD.9/fixture-11 | EllipticCurves worked torsion example, Layers 1–2 and 6 |
| BSD.9/fixture-11-discriminant | Same owner |
| BSD.9/fixture-11-elliptic | Same owner |
| BSD.9/fixture-37 | EllipticCurves worked rank example, Layers 1–2 and 6 |
| BSD.9/fixture-37-discriminant | Same owner |
| BSD.9/fixture-37-elliptic | Same owner |
| BSD.9/point-11 | EllipticCurves worked torsion example |
| BSD.9/point-11-order | Same owner |
| BSD.9/point-37 | EllipticCurves worked rank example |
| BSD.9/point-37-order | Same owner |

The generic real period, canonical height/regulator, Mordell–Weil, isogeny,
torsion, reduction and Selmer carriers were already deferrals in the current
plans and remain deferrals. No generic lattice/determinant theory is replanned.
The 32a2 model y²=x³−x differs from the current upstream CM example y²=x³+x;
its actual affine point and dyadic BSD certificates remain new targets.

## Build order and supplier changes

The handoff's coverage table below identifies every retained target after
renumbering. The package makes these dependency changes:

- BSD.5/rank-zero-rationality is Layer 1, before the Kato finite-level bound.
  The modular-symbol proof has no BSD endpoint as an input.
- BSD.3a/definite-congruence-period is Layer 4. Its packet parentStageId was
  BSD.5 despite its early identifier. It now precedes Heegner descent and depends
  on character modules, monodromy and transfer rather than HE.6.
- The signed BSTW zeta element, its reciprocity laws and signed
  Proposition 9.18 comparison form Layer 8, before the completed signed main
  conjecture in Layer 9. AutomorphicCongruences L5a must consume this early
  interface, not the completed Layer 9 endpoint.
- Ordinary BSTW construction/reciprocity/Proposition 9.18 belong to the early
  Kato L5 extension, routed to its present L4 owner until that extension exists.
- PadicFamilies L4 is the integral CM-family/congruence-ideal supplier; its L1
  ordinary eigencurve geometry cannot supply that construction.
- The later HE.8b Eisenstein reexport is not an input to Castella's higher-weight
  argument. HE.8 supplies the early ordinary classes; the early BCK Theorem 5.2
  comparison and its higher-weight/imprimitive compatibility are explicit
  additional proof obligations at HE.8 and Layer 9.3.
- FW Theorem 4.41/Corollary 7.21 are routed to AutomorphicCongruences L2; FO
  Lemma 2.14 is separately routed to R21.3. The nonexistent FO Corollary 7.2.1
  is not used as a factorization export.
- MIMC L6 and later Eisenstein Heegner reexports are consumers of the new
  equalities. They cannot be imported as proof inputs.
- FoundationsAndLibraryIntegration bookkeeping and UPSTREAM references are
  replaced by actual libraries or the named upstream owner.

RankZeroOneBSD is outside the Caraiani–Newton 94-roadmap tier table. The README
therefore states the arithmetic proof bundle's order and exact extensions
without inventing lower-tier status. Existing narrower supplier statements are
not described as satisfying stronger integral contracts.

## Source checks

The public versions actually consulted in this run were JSW arXiv v1, Skinner
arXiv v1, Castella's five-page erratum, BSTW arXiv v2, CGS arXiv v2,
Keller–Yin arXiv v2 and Wüthrich's published EMS PDF. Sources were read in
scratch only; no source file or source passage is included in the repository.

Checks of the following primary statements supported the sensitive hypotheses
and normalizations. These are spot checks, not a claim that every referenced
proof was reread:

| Source and locator | Comparison checked |
|---|---|
| JSW v1 Theorem 1.2.1, pp.1–2 | Semistable, good odd irreducible prime; supersingular p=3 requires a_p=0 |
| JSW v1 Theorem 4.4.1, p.28 | Odd-prime Shimura Kolyvagin bound and its actual Heegner/residual conditions |
| JSW v1 Theorem 6.1.6, p.40 | Integral divisibility after control and μ=0, with the nonsplit-prime hypothesis |
| JSW v1 Theorem 7.2.1, pp.42–43 | One-sided bound versus ordinary/multiplicative and supersingular equality ranges |
| JSW v1 §7.3.2, p.44 | Full real period, congruence period and twist Gauss-sum factor |
| JSW v1 §7.4.1, pp.45–46 | Ramified auxiliary field and the original Friedberg–Hoffstein citation |
| Skinner v1 Theorems A/B/C, pp.1–3 | q≠p residual ramification, exceptional-zero factor and good/multiplicative range |
| Castella erratum A′/Theorem 1.1, pp.1–2 | p>3, nonsplit ramified q, E(ℚ_p)[p]=0, ramified Heegner ideal and additive primes allowed |
| Castella erratum Lemma 2.1, p.2 | Local H⁰ hypothesis in finite-level congruence control |
| Castella erratum Theorem 2.3, pp.3–4 | Higher-weight integral/error and projection obligations; printed C1/C2 and FO citation defects retained explicitly |
| BSTW v2 Theorems 1.3/1.5, pp.3–4 | Semistable signed endpoints and ordinary-support restriction on permitted twists |
| BSTW v2 Theorem 6.26, p.68 | Rational two-Kato-class cyclotomic projection versus integral basis/lattice refinement |
| BSTW v2 Proposition 9.18, pp.83–84 | Printed ordinary proof, implicit signed proof and both cyclotomic local non-torsion conditions |
| CGS v2 Theorems A/D, pp.2,4 | Local exclusion φ≠1,ω and prime-part torsion denominator |
| CGS v2 Proposition 2.4.5, §2.4 | Greenberg anticyclotomic ideal equals the squared BDP ideal |
| CGS v2 Theorem 4.1.1/Corollary 4.1.3, pp.17–18 | Actual BF class, opposite localizations, differential/degree/Katz rescaling of both maps |
| Keller–Yin v2 Introduction A/B/C, pp.4–5 | Wider good Eisenstein range, integral Greenberg and separate index-square statements |
| Keller–Yin v2 Theorems 3.0.8/3.0.10, pp.40–41 | Λ versus Λ^ac ambiguity and the short cyclotomic substitution proof |
| Keller–Yin v2 Theorem 4.2.1, §4.2 | p-primary BSD including rational p-torsion, with its denominator |
| Wüthrich Theorem 16/Lemma 17/Corollary 18, pp.397–398 | Local semistability, integral isogeny transfer and split-multiplicative augmentation factor |

The original Friedberg–Hoffstein Theorem B was not acquired. The publisher's
Annals page was identified; JSW's citation was checked, but the arbitrary local
range remains explicitly unverified. The BFH mirror returned HTTP 403 in this
run; its locators and the older Gross/Gross–Zagier comparisons are inherited
from the accepted source work rather than described as freshly checked.
Original Birch–Stephens and the elliptic-unit proof chain also remain unread
source obligations. No inaccessible book was obtained from another copy.

## Mathematical gaps carried into the roadmap

All 15 input gaps remain visible in the relevant targets, exact supplier
contracts and closing mathematical-boundaries section. They are proof/source
obligations for the roadmap, not omitted scope:

1. Original Friedberg–Hoffstein Theorem B and its arbitrary local prescriptions.
2. Exact dyadic Néron-lattice period exponent and ramified/dyadic Tamagawa
   comparison; odd-primary comparison cannot discharge it.
3. Original Birch–Stephens dyadic root calculation or a verified replacement.
4. Ramified Castella auxiliary twists and the BSTW ordinary-support condition.
5. Integral modular-degree multiplicity-one/freeness, with geometric
   ord_ℓ Δ rather than nonsplit rational component order.
6. Higher-weight integral Kolyvagin/error-zero, BCK, FW and Σ-projection proofs.
7. The signed proof left implicit in BSTW Proposition 9.18.
8. Integral signed local images, lattice comparison, excluded height-one
   primes and both cyclotomic local non-torsion/control hypotheses.
9. Integral imaginary-quadratic elliptic units, Rubin 1991/1994,
   Hida–Tilouine Theorem 0.3 and Hida's anticyclotomic Katz μ=0 proof chain.
10. Source-specific integral Wüthrich, early Heegner, KLZ/BF and Poitou–Tate
    exports with their lattice/isogeny indices.
11. Exact fixture Sha annihilator/Selmer, saturation, local and isogeny
    certificates; analytic-Sha tables prove none of these.
12. Actual rational interval replay for the three central values/derivative.
13. Keller–Yin's integral index-square coefficient-ring comparison; the
    separate integral Greenberg theorem is not weakened.
14. Keller–Yin's cyclotomic adaptation on the chosen invariant-free lattice,
    including control and its integral transfer to the Wüthrich lattice.
15. Absent combined arithmetic Lean interfaces; full signatures stay in README.

## Validation and signature checks

- Both input packets: check_blueprint reports zero errors and zero warnings.
- lean-check on the final Suggested.lean exits 0 with exactly 23 warnings, all
  declaration uses sorry. It uses the existing shared pinned build; no Lake
  project, library build, cache fetch or language server was started.
- intake.py check-files on all four deliverables reports zero problems.
- A scratch completeness audit checks 165=153+12, all retained statements,
  API entries and Checks, 15 numbered layers in README/Lean order, and no
  forward internal prerequisite. The scratch script is not a deliverable.
- Signature comparison checked the actual twist carriers and factor-two
  decomposition; support including denominator primes; certificate fields
  without stored positivity/equality; positive reconstruction; the nonzero
  real denominator; the dyadic gate; zero/negative-one/2/1⁄4 controls; and the
  actual affine 32a2 point and its additive order.
- README has no packet/job/review narrative, source excerpts, private paths,
  dangling empty supplier lists or placeholders for removed targets.
- Only the four authorized deliverables changed.

The next step is the independent package review. No second job was claimed.

## Retained target coverage

| Input target | README subsection |
|---|---|
| BSD.0/completed-l-function | 0.1: The completed L-function and the root number |
| BSD.0/analytic-rank | 0.2: Analytic rank and the leading coefficient at s = 1 |
| BSD.0/quadratic-field-character | 0.3: The quadratic character of a quadratic field |
| BSD.0/finite-field-twist-trace | 0.4: Trace of Frobenius of a twist over a finite field |
| BSD.0/root-number-parity | 0.5: Root-number parity of the analytic rank |
| BSD.0/twist-local-factors | 0.6: Local Euler factors of a quadratic twist |
| BSD.0/twist-l-series | 0.7: The L-series and conductor of a quadratic twist coprime to the conductor |
| BSD.0/base-change-factorization | 0.8: Factorisation of the L-function over a quadratic field |
| BSD.0/congruent-number-root-numbers | 0.9: Root numbers of the congruent-number twists |
| BSD.0/twist-root-number | 0.10: Root number of a quadratic twist |
| BSD.0/base-change-central-identities | 0.11: Order, leading term and sign of L(E/K, s) at the centre |
| BSD.5/rank-zero-rationality | 1.1: Rationality of L(E,1)/Ω_E |
| BSD.1/quadratic-point-maps | 2.1: Restriction, conjugation, trace and twist maps on points over a quadratic field |
| BSD.1/sha-finiteness-descent | 2.2: Finiteness of Sha descends along a finite extension |
| BSD.1/rank-splitting | 2.3: Rank splitting over a quadratic field |
| BSD.1/torsion-comparison | 2.4: Torsion over a quadratic field |
| BSD.1/quadratic-period | 2.5: The period of E over an imaginary quadratic field and its comparison |
| BSD.1/quadratic-regulator-comparison | 2.6: Lattice index and regulators over a quadratic field |
| BSD.1/odd-selmer-sha-decomposition | 2.7: Odd-primary Selmer and Sha over a quadratic field |
| BSD.1/two-primary-comparison | 2.8: The 2-primary restriction and corestriction comparison |
| BSD.1/tamagawa-base-change | 2.9: Tamagawa factors under quadratic base change and twist |
| BSD.1/odd-part-bsd-over-K | 2.10: The BSD quotient over K versus over ℚ at odd primes |
| BSD.2/heegner-local-conditions | 3.1: Admissible discriminants with prescribed local conditions |
| BSD.2/twist-series-residue | 3.2: The polar term of the BFH twist series and its nonvanishing |
| BSD.2/bfh-nonvanishing | 3.3: Nonvanishing of quadratic twists and their derivatives (Bump–Friedberg–Hoffstein) |
| BSD.2/prescribed-local-conditions-value-branch | 3.4: Nonvanishing central twists with arbitrary prescribed local behaviour (Friedberg–Hoffstein) |
| BSD.2/heegner-field-selection | 3.5: Choice of a Heegner field for analytic rank zero or one |
| BSD.2/auxiliary-fields-for-prime-parts | 3.6: Simultaneous choice of the auxiliary fields of the prime-part arguments |
| BSD.3a/definite-congruence-period | 4.1: The definite congruence-period identity (Ribet–Takahashi, Pollack–Weston) |
| BSD.3/heegner-point-nontorsion | 5.1: A nonzero derivative over K gives a non-torsion Heegner point |
| BSD.3/heegner-point-eigenspace | 5.2: Complex conjugation on the Heegner point selects the rational or the twisted part |
| BSD.3/analytic-rank-one-theorem | 5.3: Analytic rank one implies rank one and finite Sha (Gross–Zagier–Kolyvagin) |
| BSD.4/analytic-rank-zero-theorem | 6.1: Analytic rank zero implies rank zero and finite Sha (Kolyvagin) |
| BSD.4/kato-rank-zero-finiteness | 6.2: The Beilinson–Kato route to finiteness in analytic rank zero |
| BSD.4/kato-p-part-upper-bound | 6.3: Kato's upper bound for the p-part of Sha in analytic rank zero |
| BSD.4/analytic-rank-at-most-one-theorem | 6.4: Analytic rank at most one: rank equals analytic rank and Sha is finite |
| BSD.4/kato-heegner-comparison | 6.5: The Kato and Heegner routes in analytic rank zero compared |
| BSD.5/leading-term-positivity | 7.1: Positivity of the leading term in analytic rank at most one |
| BSD.5/heegner-index | 7.2: The Heegner index |
| BSD.5/ribet-takahashi-degree-comparison | 7.3: Modular degrees on X₀(N) and on Shimura curves (Ribet–Takahashi) |
| BSD.5/heegner-index-height-formula | 7.4: Height of the Heegner point and the squared index |
| BSD.5/rank-one-rationality | 7.5: Rationality of L′(E,1)/(Ω_E Reg_E) in analytic rank one |
| BSD.5/gross-index-formula | 7.6: Gross–Zagier's index conjecture as a form of BSD over K |
| BSD.5/sha-bound-from-heegner-index | 7.7: Kolyvagin's index bound as a one-sided p-part statement |
| BSD.5/rational-bsd-defect | 7.8: The rational BSD defect |
| BSD.5/defect-isogeny-invariance | 7.9: Isogeny invariance of the rational BSD defect |
| BSD.5/p-part-from-two-bounds | 7.10: The p-part of BSD from an upper and a lower bound |
| BSD.6a/bstw-two-variable-zeta-element | 8.1: The two-variable zeta element of an elliptic curve over an imaginary quadratic field (BSTW) |
| BSD.6a/bstw-explicit-reciprocity-laws | 8.2: The two explicit reciprocity laws for the BSTW zeta element |
| BSD.6a/bstw-signed-main-conjecture-comparison | 8.3: Signed Perrin–Riou and Greenberg main-conjecture comparison |
| BSD.6a/anticyclotomic-selmer-control | 9.1: Anticyclotomic control at the trivial character (JSW Theorem 3.3.1) |
| BSD.6a/bstw-signed-main-conjecture | 9.2: Kobayashi's signed main conjecture for semistable curves at supersingular primes (BSTW Theorem 1.3) |
| BSD.6a/higher-weight-integral-kolyvagin-bound | 9.3: Higher-weight integral Kolyvagin bound |
| BSD.6a/wan-anticyclotomic-divisibility | 9.4: The anticyclotomic divisibility for the BDP p-adic L-function (Wan; JSW §6) |
| BSD.6a/bstw-rank-zero-p-part | 9.5: Specialisation of the signed main conjecture in rank zero |
| BSD.6a/castella-higher-weight-input | 9.6: The higher-weight anticyclotomic main conjecture and Selmer lemmas used by Castella's correction |
| BSD.6a/castella-anticyclotomic-main-conjecture | 9.7: Castella's corrected anticyclotomic main conjecture at a multiplicative prime (erratum Theorem 1.1) |
| BSD.6/cyclotomic-specialization-formula | 10.1: Specialising a cyclotomic main conjecture at the trivial character |
| BSD.6/rank-zero-supersingular-p-part | 10.2: The p-part of BSD in rank zero at supersingular primes |
| BSD.6/residually-ramified-prime | 10.3: A semistable curve with irreducible E[p] is residually ramified somewhere |
| BSD.6/bstw-rank-one-p-part | 10.4: BSTW supersingular rank-one p-part |
| BSD.6/rank-zero-ordinary-multiplicative-p-part | 10.5: The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner) |
| BSD.6/jsw-lower-bound | 10.6: The lower bound for Sha[p^∞] in analytic rank one (JSW §7.4.1) |
| BSD.6/jsw-upper-bound | 10.7: The upper bound for Sha[p^∞] in analytic rank one (JSW §7.4.2) |
| BSD.6/castella-multiplicative-rank-one-p-part | 10.8: The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′) |
| BSD.6/jsw-rank-one-p-part | 10.9: The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan) |
| BSD.7a/eisenstein-ordinary-local-exclusion | 11.1: Ordinarity and local invariants at a good Eisenstein prime |
| BSD.7a/eisenstein-selmer-normalization | 11.2: Ordinary, Greenberg and unramified Eisenstein Selmer comparisons |
| BSD.7a/kriz-eisenstein-congruence | 11.3: Kriz congruence and analytic Iwasawa invariants |
| BSD.7a/heegner-reciprocity-ideal-comparison | 11.4: Heegner index and BDP ideal comparison |
| BSD.7a/ky-local-character-corrections | 11.5: Keller–Yin local character cohomology |
| BSD.7a/ky-trivial-character-main-conjecture | 11.6: Keller–Yin trivial-character augmentation correction |
| BSD.7a/distinguished-lattice-integral-input | 11.7: Distinguished Wüthrich lattice and integral Kato input adapter |
| BSD.7a/finite-euler-factor-comparison | 11.8: Primitive and imprimitive Euler factors |
| BSD.7a/uniform-near-trivial-kolyvagin-bound | 11.9: Uniform near-trivial Kolyvagin bound |
| BSD.7a/ky-ribet-lattice | 11.10: Keller–Yin nonsplit residual lattice |
| BSD.7a/integral-two-variable-functions | 11.11: Integral Rankin functions and specialization normalization |
| BSD.7a/cgls-residual-character-comparison | 11.12: CGLS residual extension and algebraic Iwasawa invariants |
| BSD.7a/augmentation-inclusive-heegner-divisibility | 11.13: Heegner divisibility including augmentation |
| BSD.7a/ky-imprimitive-residual-comparison | 11.14: Keller–Yin imprimitive residual Selmer comparison |
| BSD.7a/beilinson-flach-integral-reciprocity | 11.15: Beilinson–Flach class and two integral reciprocity laws |
| BSD.7a/congruent-characteristic-series | 11.16: Congruent twists and integral characteristic series |
| BSD.7a/ky-uniform-near-trivial-bound | 11.17: Keller–Yin uniform near-trivial bound |
| BSD.7a/cgls-equal-iwasawa-invariants | 11.18: CGLS equality of anticyclotomic Iwasawa invariants |
| BSD.7a/ky-finite-euler-factor-comparison | 11.19: Keller–Yin finite Euler comparison |
| BSD.7a/ky-integral-kolyvagin-bound | 11.20: Keller–Yin integral Kolyvagin divisibility and lattice transfer |
| BSD.7a/nontrivial-twist-rational-bf-bound | 11.21: Nontrivial-twist rational Beilinson–Flach bound |
| BSD.7a/bf-pr-reciprocity | 11.22: EisensteinBF.coleman_PR |
| BSD.7a/bf-greenberg-reciprocity | 11.23: EisensteinBF.coleman_Gr |
| BSD.7a/cgs-anticyclotomic-main-conjecture | 11.24: CGS anticyclotomic Greenberg main conjecture |
| BSD.7a/ky-residual-extension-lambda | 11.25: Keller–Yin residual extension and corrected lambda formula |
| BSD.7a/bf-poitou-tate-divisibility-comparison | 11.26: Beilinson–Flach divisibility comparison |
| BSD.7a/cgls-prototype-main-conjecture | 11.27: CGLS anticyclotomic prototype |
| BSD.7a/cgs-heegner-index-square-equality | 11.28: CGS Heegner index-square equality |
| BSD.7a/ky-equal-iwasawa-invariants | 11.29: Keller–Yin equality of analytic and algebraic invariants |
| BSD.7a/twisted-control-augmentation-comparison | 11.30: Twisted control and augmentation comparison |
| BSD.7a/ky-anticyclotomic-greenberg-equality | 11.31: Keller–Yin anticyclotomic Greenberg main conjecture |
| BSD.7a/integral-twisted-cyclotomic-equality | 11.32: Integral twisted cyclotomic equality |
| BSD.7a/ky-heegner-index-square-equality | 11.33: Keller–Yin Heegner index-square equality |
| BSD.7a/cgs-cyclotomic-main-conjecture | 11.34: CGS integral cyclotomic main conjecture |
| BSD.7a/ky-cyclotomic-proof-inputs | 11.35: Keller–Yin cyclotomic input transfer |
| BSD.7a/ky-cyclotomic-main-conjecture | 11.36: Keller–Yin integral cyclotomic main conjecture |
| BSD.7/cgls-torsion-free-control | 12.1: CGLS rank-one anticyclotomic control |
| BSD.7/ky-torsion-control | 12.2: Keller–Yin control with rational torsion |
| BSD.7/greenberg-vatsal-rank-zero-prototype | 12.3: Greenberg–Vatsal rank-zero prototype |
| BSD.7/cyclotomic-rank-zero-defect | 12.4: Rank-zero defect from integral cyclotomic equality |
| BSD.7/rank-one-twist-defect-comparison | 12.5: Rank-one twist comparison with torsion |
| BSD.7/cgls-rank-one-prototype | 12.6: CGLS rank-one Eisenstein BSD prototype |
| BSD.7/cgs-eisenstein-prime-bsd | 12.7: CGS good Eisenstein prime-part BSD |
| BSD.7/ky-eisenstein-prime-bsd | 12.8: Keller–Yin good Eisenstein prime-part BSD |
| BSD.8/prime-support | 13.1: Prime support of a rational number |
| BSD.8/zero-numerator-denominator | 13.2: Zero valuation in the reduced numerator and denominator |
| BSD.8/torsion-square-valuation | 13.3: Rational valuation with torsion square |
| BSD.8/selmer-cardinality-adapter | 13.4: Finite Selmer cardinality and Sha torsion |
| BSD.8/mordell-weil-saturation-adapter | 13.5: Certified free lattice and saturation index |
| BSD.8/local-tamagawa-certificate-adapter | 13.6: Local Tamagawa certificate adapter |
| BSD.8/local-isogeny-certificate-adapter | 13.7: Exact local isogeny comparison |
| BSD.8/support-membership | 13.8: Membership in rational prime support |
| BSD.8/empty-support-units | 13.9: Empty prime support and rational units of absolute value one |
| BSD.8/finite-prime-certificate | 13.10: Finite certificate of rational prime-valuation vanishing |
| BSD.8/sha-annihilator-adapter | 13.11: Certified Sha annihilator and finite descent |
| BSD.8/zero-iff-outside-support | 13.12: Prime valuation and exact support |
| BSD.8/certificate-from-all-primes | 13.13: Canonical certificate from all prime valuations |
| BSD.8/exceptional-prime-part-adapter | 13.14: Exceptional-prime leading-term certificate adapter |
| BSD.8/positive-rational-reconstruction | 13.15: Reconstruction of a positive rational from all prime valuations |
| BSD.8/certificate-all-primes | 13.16: A finite certificate controls every prime |
| BSD.8/certificate-from-exceptions | 13.17: Certificate from an exceptional-prime set and an outside theorem |
| BSD.8/source-qualified-prime-part-dispatch | 13.18: Source-qualified fixed-prime dispatch |
| BSD.8/certificate-reconstruction | 13.19: Positive reconstruction from a finite certificate |
| BSD.8/real-identity | 13.20: Transfer of a certified rational quotient to a real identity |
| BSD.8/elliptic-endpoint | 13.21: Full leading term under the actual defect certificate |
| BSD.8/individual-full-bsd-from-exceptions | 13.22: Individual full BSD from a finite exceptional set |
| BSD.8/family-full-bsd-from-certificates | 13.23: Full BSD for an explicitly certified family |
| BSD.9/away-from-prime | 14.1: A prime defect is invisible at every other prime |
| BSD.9/prime-obstruction | 14.2: No complete certificate for a prime defect |
| BSD.9/dyadic-gate | 14.3: The remaining dyadic equality under all odd-prime equalities |
| BSD.9/fixture-32 | 14.4: Concrete 32a2 Weierstrass model |
| BSD.9/mellin-central-tail-bounds | 14.5: Central Mellin formulas with explicit tails |
| BSD.9/fixture-11-isogeny-period | 14.6: Five-isogeny and torsion-square comparison |
| BSD.9/fixture-32-discriminant | 14.7: 32a2 discriminant calculation |
| BSD.9/analytic-fixture-enclosures | 14.8: Certified central values for the three fixtures |
| BSD.9/fixture-32-elliptic | 14.9: 32a2 ellipticity and affine point domain |
| BSD.9/fixture-11-good-five | 14.10: Rational five-torsion theorem-range test |
| BSD.9/fixture-period-height-comparisons | 14.11: Fixture periods, heights and regulator conventions |
| BSD.9/rank-equality-example | 14.12: Rank equality comparison example |
| BSD.9/whole-sha-finiteness-example | 14.13: Whole Sha finiteness comparison example |
| BSD.9/point-32 | 14.14: Actual 32 fixture point |
| BSD.9/fixed-prime-example | 14.15: Fixed prime BSD comparison example |
| BSD.9/point-32-order | 14.16: Order of the 32 fixture point |
| BSD.9/fixture-32-cm-additive | 14.17: CM and additive dyadic fixture |
| BSD.9/fixture-finite-arithmetic | 14.18: Finite descent and saturation for the three fixtures |
| BSD.9/full-bsd-example | 14.19: Full BSD certificate comparison examples |
| BSD.9/missing-exception-fixture | 14.20: Missing exceptional prime regression |
