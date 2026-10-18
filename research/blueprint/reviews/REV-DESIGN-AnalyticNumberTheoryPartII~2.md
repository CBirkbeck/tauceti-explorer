# Independent review: AnalyticNumberTheoryPartII, revision 2

Accepted on 2026-10-18 by Codex, session codex-1Roz5J, for issue #8933. This session did none of the original design or its revision. The packet records the independent reviewer as `independent-review-REV-DESIGN-AnalyticNumberTheoryPartII~2`.

The revision resolves the previous review's reason for withholding acceptance: the definitive reader now agrees with the corrected packet and suggested file. This review also checked the mathematics independently, rather than treating synchronization as sufficient. Two further corrections are applied below. Acceptance concerns a complete target-level planning pass; it does not assert completed certificates or formal proofs.

| Item | Result |
|---|---|
| Nodes | 39: 37 verified, two corrected, none added or unverifiable |
| Definitions / theorem targets | 8 / 31 |
| Definition API items / unit tests | 45 / 31 |
| Planets | 27 |
| Baseline declarations | 27 confirmed; none removed or replaced |
| Supplier requests / explicit gaps | 12 / 2, retained |
| Layers | Six planned; none closed |
| Source issues | Empty: no published-source error established |

The roadmap definition and suggested Lean file required no further change. The packet and reader were corrected together. This report and the handoff record the result.

## Corrections made in this review

**Finite-product endpoint.** The truncated-residue target defined G_U using p≤U. O85 §3.1, formula (3.1.2), printed p. 315, uses p<U, with complementary primes p≥U. This matters when U is prime and keeps the residue target compatible with the strict cutoff in the tail decomposition. The packet and reader now use p<U. The source locator includes (3.1.2), and the match explains the complementary endpoint. The residue expansion itself is unchanged. The suggested file has no competing non-strict Euler-product definition requiring an edit.

**LLS locator.** The small-range sieve cited pp. 448–451 as part of its supporting sieve tables, and the source metadata called those pages a continuation of Table I. Reading the printed pages shows other prescribed-character problems and the references there. The relevant locations are the search and tables on pp. 433–444, Table III on p. 440, and the class-number-three argument on pp. 445–447. Both node and reader now give those locations; the inaccurate metadata entry is removed. The mathematical thresholds are unchanged.

Source access dates were refreshed. The IMPAN MW endpoint returned HTTP 403, so its access note now identifies the identical public journal PDF linked by EuDML. O88's note identifies the publisher's actual IIIF page images instead of implying a downloaded PDF. The current upstream ownership note now records the commit actually inspected. Each baseline entry records this session's independent reading.

## Previous corrections independently checked

The first review corrected seven nodes, grouped into five mathematical issues. All are present consistently in the revised reader, requests and suggested statements:

- O85 §3.3, Lemma 3, p. 316, uses integrated cumulative domination. The positive hinge argument includes the boundary atom for the m=2 kernel. The nonaxial comparison measure has its atom at A=√d/2, cumulative mass (πt/√d)1_[A,∞), and Mellin transform (π/2)s/(s−1)A^−s. The GN.3 request asks for the integrated estimate with the correct support. The atomic example distinguishes this hypothesis from pointwise domination; completed-product integrability is retained.
- GZ83 Corollary 6 and its proof, p. 87, put the CM value in H, not initially in K. From u^12=λ^12 and [H:K]=3, the quadratic extensions K(i) and K(ζ₃) cannot lie in H. The resulting ±λ values, Galois equivariance and source divisor multiplicities yield the trace argument. The CN.3 request includes those exact inputs.
- The exceptional-conductor target correctly proves that no imaginary quadratic field has absolute discriminant 5077. The proposed negative discriminant is 3 modulo 4. The stronger statement has no class-number-three assumption and no obsolete split-prime prerequisites. O85 §1.1, p. 311, supplies the discriminant convention used in §5.1, p. 321.
- MW74 Table I, p. 537, and §5, especially p. 540, use primitive real odd characters of discriminants −17923, −115147 and −123204. Their positive conductors, signed Legendre symbols, 2-adic values −1,−1,0 and Γ((s+1)/2) phase agree throughout. The brackets assert existence, not that these are the first zeros.
- LLS70 Table III, p. 440, gives the 67-pattern least-prime threshold 51599563. The reader uses it consistently with 1333963 and 1432817816347. Candidate primality and character checks are distinguished from the future complete sieve proving minimality.

The revised Lean definitions have actual light bodies: there is no placeholder data definition. The ordinary reader pointers have been restored. The earlier synchronization-only obstacle is resolved.

## Sources and library evidence

All eight sources were read at the node locators. The packet contains primary URLs, edition details and individual locators; seven downloaded PDFs have the recorded SHA-256 values. O88 was inspected as publisher images and has no invented PDF hash. These passages anchor the review checks:

| Primary source | Locations used for the relevant comparisons |
|---|---|
| [Gross–Zagier 1986](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | I §6, (6.3)–(6.5), p. 230; Proposition (7.4), p. 231; Theorem (8.1), bound (8.2) and class-number-three consequence, p. 232 |
| [Gross–Zagier 1983](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PointsHeegner/fulltext.pdf) | Theorem 1 and corollaries, pp. 85–87; Corollary 6's CM and divisor argument, p. 87 |
| [Oesterlé 1985](https://numdam.org/item/SB_1983-1984__26__309_0.pdf) | Theorem 1, pp. 310–311; §1.4, p. 312; C1–C4 and analytic comparison, §§2–3, pp. 313–319; local corrections and constants, §§4–5, pp. 319–321 |
| [Oesterlé 1988](https://doi.org/10.5169/seals-56588) | II §§3–9, pp. 56–67, including height-gap and improved-bound applications on pp. 65–67; publisher IIIF access recorded in packet |
| [Buhler–Gross–Zagier 1985](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.2307/2007967/fulltext.pdf) | Equation (2), p. 473; points and height data, pp. 475–476; (10)–(14), pp. 478–479; §5 and note added in proof, pp. 480–481 |
| [Montgomery–Weinberger 1974, public journal PDF](https://matwbn.icm.edu.pl/ksiazki/aa/aa24/aa2457.pdf) | Theorem, p. 530; Lemmas 1–9 and Table I, pp. 532–539; §5 numerical evaluation, pp. 539–542 |
| [Lehmer–Lehmer–Shanks 1970](https://oeis.org/A002189/a002189.pdf) | Prescribed-character searches and tables, pp. 433–444; Table III, p. 440; class-number-three application, pp. 445–447 |
| [Goldfeld 1977](https://www.numdam.org/item/AST_1977__41-42__219_0.pdf) | §1, p. 219, for the ineffective comparison; §§2–5, pp. 220–225, for scope of the effective strategy |

All 27 baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their names, module paths and provides fields remain valid. In particular:

- The Dedekind-zeta residue limit supplies neither analytic continuation nor a complex residue theorem by itself.
- Genus theory retains its squarefree radicand, integral generator, minimal-polynomial and field-generation hypotheses. GN.3 supplies the discriminant bridge and handles the small exceptions.
- Native elliptic L-series are raw sums. The actual entire continuation and finite analytic order are requested from BSD.0, with agreement on the convergence half-plane.
- Native canonical height has the (O) normalization, dividing the doubling limit by 2·4^n. BGZ's height data use 2(O), so the factor of one half is necessary.
- Mellin inversion and contour residues retain their convergence, continuity, domain, pole-avoidance and homology conditions. Totalized native quotients do not replace removable analytic extensions.
- Odd-prime Legendre symbols and the 2-adic character are separate evaluations. The native twist discriminant t²−4n gives −7 for the auxiliary twist parameters.

No baseline citation was removed, added or weakened to disguise a near miss.

## Closure, ownership and scope

Each proof sketch was traced through its listed prerequisites. The six layers are ordered correctly: quadratic input precedes the analytic comparison and curve certificates; those support the numerical bounds, effective finiteness and final classification. Target-level granularity is appropriate; no proof was split into artificial small nodes. Every stage target is represented. Each definition has at least three discriminating tests, and its API covers the uses in later targets. The 27 planets name the central objects and results.

Supplier statements were checked, including BSD.0's entire L-function/rank/parity/twist interfaces, GZ.8's classical and elliptic height formulas and Petersson normalization, R29.4's conductor and bad-factor comparison, and R29.5's parametrisation. The AL.3 request explicitly asks for the normalization and finite-factor strengthening needed here; a unitary global-pole statement alone is insufficient. CN.2's class-group stopping condition is stronger than collecting some relations. CN.4's interval and L-value interfaces do not by themselves supply arbitrary-level cusp-form evaluation; that strengthening remains requested. The CN.1–4, ED.3, GN.3 and AN.2/AN.4 requests state concrete consumer needs. No generic descent, Gross–Zagier or certification machinery is replanned here.

The reviewed library-coverage audit was compared with current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read without running a build there. Checks included the nine roadmaps newer than the atlas snapshot, Completed contour/effective-bound work, IntegralLattices Layer B and EllipticCurves Layers 4 and 6. Existing class-number upper bounds, genus/discriminant facts, residues, heights and descent remain imports. IntegralLattices B1/B2/B5 owns the form/Picard dictionary and finite reduction enumeration; GN.3 supplies the native class-group and explicit counting adapters. Current `TauCeti.primeNumberTheoremTransfer` and `TauCeti.LSeries.wienerIkehara` were read as existing inputs; AN.2 is asked only for the nth-prime and weighted-sum consequences. No duplicate effective lower-bound or concrete classification plan was found.

Two explicit certificate gaps remain: the E139 arithmetic descent and independent-point witnesses, and the complete rational comparison data for constants 7000/55, including all ramified cases and the strict endpoint margin. They are honest missing inputs to specified targets, compatible with planned coverage and this review's acceptance. Future MW signs/phases and LLS sieve completeness also require the certificates already specified by their targets. None is claimed implemented.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheoryPartII.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/AnalyticNumberTheoryPartII.lean`: exit 0 at the pins, 112 declaration-uses-sorry warnings, no other diagnostics. The file was not changed after compilation. No language server or library build was run.
- Independent exact integer/rational calculations enumerated 16,772,606 primitive reduced forms of negative fundamental discriminant with |D|≤318028. Exactly the sixteen listed fields have three representatives. For −907 the forms are (1,1,227), (13,−9,19), (13,9,19). The filter rejects −243 and −5077.
- Exact calculations also checked both curve discriminants, the cleared-denominator E139 coordinate identity, E5077 points, MW signed discriminants/parity/2-adic values, the three LLS candidates' primality and inert signs, the threshold chain, theta examples, κ exponents and the distinguishing atomic integrated-domination example. These calculations do not certify sieve minimality or the analytic numerical constants.
- Reader coverage, API/test declaration names, all-node verdict coverage, JSON validity, diff whitespace and the deliverable allowlist were checked.

No orchestrator decision blocks acceptance. Follow-ups should discharge the two recorded certificate gaps before claiming closed layers. The existing upstream height-prose/native-normalization discrepancy remains a maintainer note, not an edit to upstream work. No ownership move was made in this review. The handoff contains the information needed without retained scratch files.
