# Independent review: Perfect powers in primitive arithmetic progressions

Accepted as a complete target-level planning pass. Every stage remains planned, none closed; seven explicit gaps and twenty supplier requests remain. Nothing is claimed formalised. Reviewer: Codex — codex-7e92bd, independent of designer Codex — codex-a71f92 (PR6144). Refs #1723. The claim was confirmed by bot comment 5990321877 after claim 5990320063; the unchanged whole issue was reread.

The final packet has 49 nodes (8 definitions, 10 constructions, 8 lemmas, 23 theorems), 56 API items, 59 unit examples, 36 planets and 24 pinned baseline citations. One node was added; none removed. All 80 routed catalogue items are accounted for, with the historical Erdős–Selfridge theorem retained only in the statement register. The correct source route is 9, not 12.

## Corrections

- Make triple membership explicit in the coefficient-prime and Kraus-threshold contracts.
- Reject source finding E23 after image inspection: equations (16) and (21) already have absolute-value bars; correct the transcription and attribution without changing the character-sum mathematics.
- Restrict the generic survivor conductor API to odd primes, add its character-family dependency, and explain why the thin-set witness still avoids every requested prime.
- Exclude the principal L-function pole from both analytic zero predicates and add a principal-pole non-example; native totalized values are not meromorphic zeros.
- Add the direct prime-count input and request needed to leave more than 2k/7 disjoint blocks in the Granville witness.
- Record E24: repair the off-by-one coefficients in Darmon–Granville equation (2.2), retaining the verified genus formula and signed-adapter gap.
- Add one target-level Stirling numerical adapter for routed item 141, with three actual pinned baseline inputs and a native suggested signature; remove the unsupported generic Stirling request and explain the simpler factorial bound sufficient for the endgame.
- Correct catalogueCoverage.route from 12 to 9, the one-based ErdosProgressionPowers route in the reviewed paper result; all 80 routed items are retained.
- Replace generic baseline fit descriptions with the actual hypotheses and conventions for all 21 inherited citations; retain all of them.
- Give every inherited source issue an independent verdict: 19 confirmed and E23 rejected; add confirmed E24. Historical preprint collation is distinguished from this review’s publisher-image checks.

The source finding E23 is rejected, not merely softened: the authenticated publisher images visibly contain absolute-value bars in equations(16) and(21), at pp. 367 and 369. Text extraction had lost them. The paper already proves the conclusion used by both analytic routes. The other nineteen inherited findings are confirmed with the qualifications in their individual reviews. New finding E24 concerns the local off-by-one elimination formula in Darmon–Granville, equation (2.2), p.520: coefficients j-1,j-2 are required by its 1-based indexing. This leaves the degree and genus calculation intact. Twenty of the final twenty-one findings are confirmed; no global counterexample to either paper’s main theorem is asserted.

## Sources and baseline

The [Bennett–Siksek publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), SHA256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf, was read through all 38 physical pages (printed355–392), including Granville’s addendum. Critical page images were checked at 357, 361, 367, 369,371,374,377,380,383 and 384. The [Darmon–Granville author scan](https://www.math.mcgill.ca/darmon/pub/Articles/Research/12.Granville/pub12.pdf), SHA256 2a77462524aebdce6a34c540e99afb3913c2c6113b597af9792bed6c82376aca, was read at physical 7–9, printed 519–521, including the complete Corollary 2.1 proof; images 520–521 settle the elimination and genus formulas. No full DG-paper reading or publisher-PDF collation is claimed. Bounded journal/author-page correction searches found no correction of the new display issue; this is not an exhaustive novelty claim. Earlier arXiv collations in the inherited errata remain historical provenance rather than newly repeated checks.

All 21 inherited baseline citations were confirmed by reading actual declarations at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Their generic fit descriptions were replaced by precise hypotheses and conventions. Three Stirling declarations were added after reading the native definition, Robbins stepwise bound and positive limit. No baseline citation was removed. The existing Roth theorem is not re-planned; it does not by itself supply the requested Rahman numerical threshold. There is no roadmap-specific row in the reviewed library audit. Relevant supplier audit rows and all 30 exact supplier statements were checked; broad stages are treated as owners of precise open requests, not completed proofs.

## Validation and limits

The exact final suggested file elaborates in the existing pinned Mathlib build: zero errors, 140 `sorry` warnings, no other warnings. Its SHA256 is 0fa93662503c08df51e5bb73390a4297ad6afd047d6977e56fa1af24c2607fa4. Before the one serial compiler process, 35 GiB was available; 3517 transitive Mathlib source modules and package revisions were authenticated. No dependencies were built. As in the packet’s explicit boundary, the file states 39 target declarations and 55 API signatures; ten geometric targets, one Frey compatibility API and three local/conductor clauses remain omitted pending real supplier interfaces. Elaboration is not proof, and an existential cutoff is not an effectivity certificate.

Independent Python controls passed 67,804 exact assertions covering both Frey invariant calculations, gcd and residue counts, valuation deletion, 1,096 corrected finite-field halving points and their doubles, character-conductor bookkeeping, the DG index/genus formulas, and rational certificates for the numerical margins. The controls test local implications and finite cases; they do not establish the universal analytic or geometric theorems. The issue forbids Lean code outside the suggested file, so no scratch Lean probes were created.

The packet checker, source-version checks, actual intake path/independence checks and immutable dependency/payload checks are replayed by the evidence verifier below. The publication guard binds the author inputs and supplier files to the final base. The SieveMethodsAndPrimePatterns packet changed during the review: its exact Bombieri supplier and prerequisites are unchanged; the sole edited inherited node is the separate level-of-distribution target. PublicationReconciliation.json retains both packet hashes and the compared theorem payloads. The atlas assembly preserves foreign mathematical payloads, adds only the direct AN.2 to EP.5 stage edge, and has no unresolved references or pending links. Five unpromoted supplier packets remain planning inputs, with no claim that their results are proved. Public recovery is tested before the pull request is opened.

## Node-by-node review

| Node | Verdict | Independent check |
| --- | --- | --- |
| EP.0/primitive-solution | verified | The positive-length, prime-exponent, integer-gcd and nontriviality domains match equation(2); signed and degenerate examples distinguish them. |
| EP.0/term-gcd | verified | The gcd cancellation uses gcd(n,d)=1 and the nonzero index difference. No perfect-power premise is needed for this stronger elementary statement. |
| EP.0/large-prime-valuations | verified | A prime at least k divides at most one nonzero term; product valuations give the required exponent divisibility, including the q=k endpoint. |
| EP.0/signed-factors | verified | Odd positive exponent carries signs in z_i; full small-prime powers remain in positive A_i. The uniqueness and support tests rule out a powerfree interpretation. |
| EP.0/ap-triples | verified | Strict first two indices and i+h=2j force a nonconstant ordered triple; small cardinalities and empty ranges agree. |
| EP.0/equal-sum-quadruples | verified | The repeated middle index is allowed. Equal sums with strict exterior inequalities force negative nonzero kappa, with absolute value below k^2. |
| EP.0/divisibility-indices | verified | The total finite divisibility filter, including r=0, matches its API; prime divisors of d give an empty set under coprimality. |
| EP.0/residue-class-count | verified | Coprimality gives an empty set or one residue class; the k/r+1 loss and prime strict discrepancy are preserved, also when r>k. |
| EP.1/first-curve | verified | Native five-coefficient specialization and positive gcd normalization agree with(7)-(8). The absent generic Frey equality remains an explicit omitted API. |
| EP.1/first-local-invariants | verified | The corrected native discriminant is16(abc)^2 and c4=16(a^2-bc). Odd local minimality and valuation obligations remain honestly untyped. |
| EP.1/linear-fermat-identities | verified | Expansion gives the three-index linear relation; signed factors specialize it to the progression Fermat identity. |
| EP.1/second-curve | verified | Equal-sum cancellation yields A-B=kappa*d^2 and the actual second-family coefficients. The two sample models distinguish the two families. |
| EP.1/second-local-invariants | verified | Both invariant formulas hold. The two-term half-interval branch proves its own c4-unit test rather than misapplying the p>=k clause. |
| EP.1/first-reduced-level | verified | Irreducibility at ell>=7 and level lowering lead to the deletion-level bounds. This statement does not identify that level with the residual conductor. |
| EP.1/second-reduced-level | verified | The rational-two-torsion cutoff ell>=11 and wild 2/3 factors are retained in the second-family level bounds. |
| EP.1/half-primes-divide-d | verified | The unique and two-divisible-term cases use the appropriate family and the removed-prime bound with p!=ell; numerical H supplies all cutoffs. |
| EP.1/coefficient-prime-bridge | corrected | Added explicit a in A(k). The coefficient-prime finite-flat weight and exact Artin-conductor comparison remain real requested theorems, not assigned invariants. |
| EP.1/kraus-progression-threshold | corrected | Added explicit a in A(k). Native Gamma0 index, lcm(N,4), trivial-character newspace dimension and the exact Kraus thresholds match the supplier. |
| EP.1/comparison-curve | verified | The same residual representation and exact conductor belong to an actual full-two-torsion elliptic curve; no fake conductor field is used. |
| EP.1/good-trace-comparison | verified | Half-interval divisibility gives good reduction; Hasse plus the large residual prime lifts congruence to equality. Supersingularity uses the p>=5 criterion. |
| EP.2/case-partition | verified | The finite parameter-set adapter is exhaustive and disjoint. Constructing the actual six Legendre parameters remains with the missing generic owner. |
| EP.2/case-one-projection | corrected | The mod8 projection gives exactly the absolute-value bound printed in(21). Reject E23: the authenticated page images show bars in both(21) and(16). |
| EP.2/case-two-normalization | verified | Positive normalization and the p=5mod8 square test match the source after replacing its faulty halving coordinates; the generic geometric interfaces remain gaps. |
| EP.2/frey-non-cm | verified | The native j expression and pairwise coprimality force the powers-of-two case; d=0 or d\|3 contradicts the half-prime input under H. |
| EP.2/case-two-projection | verified | Odd-conductor exclusion uses the actual quartic descent, CM image, and non-CM surjectivity with a rational cyclic isogeny, preserving every supplier hypothesis. |
| EP.2/character-family | verified | One primitive real quadratic character supplies absolute mass, nontrivial odd support and dyadic bound simultaneously. Native modulus and conductor are related by primitivity. |
| EP.3/harmonic-criterion | verified | The effective PNT requires a nonprincipal character and gives exponent min(c1,1/2). Exceptional repulsion and the finite nonvanishing certificate remain exact supplier obligations. |
| EP.3/many-character-criterion | verified | The Gram bound uses squared absolute sums and 1/68<0.1239^2. The correlation input distinguishes ambient modulus from primitive product conductor. |
| EP.4/thin-prime-survivors | corrected | Corrected the generic avoidance API to odd primes and added its direct character-family dependency; the dyadic bound still controls the largest prime factor. |
| EP.4/valuation-deletion | verified | The least maximal valuation deletes at most one index per supported prime. The remaining product divides(k-1)!; exact finite controls exercise signs and ties. |
| EP.4/survivor-density | corrected | Added the missing explicit Stirling adapter and separated its routed item. The simpler native factorial bound also suffices for 0.44 in the certified range. |
| EP.4/thin-conductor-witness | corrected | The same witness carries all avoidance and size conclusions. Reciprocal mass<0.17 excludes2, so the corrected odd-prime API suffices; the Roth cutoff is 10^7. |
| EP.4/maximal-conductor-family | verified | Finite inclusion maximality and distinct largest conductor primes give the augmentation argument. Empty, repeated-prime and extension tests are substantive. |
| EP.4/original-route-bound | verified | The large-family branch uses c2=418; the small branch has mass>=0.1683 and uses c1=1/20000 to handle the closed lower endpoint. |
| EP.5/exceptional-moduli | corrected | Added a regular-point guard to both zero predicates so a totalized value at the principal pole cannot be a zero witness; added a principal-pole test. |
| EP.5/exceptional-moduli-bounds | verified | The exact bounded-height Landau-Page constant and zero density give the simultaneous effective bounds, with the primary quantitative inputs still requested. |
| EP.5/nonexceptional-half-sum | verified | Primitive nonprincipal characters, conductor<=k^4, heightT and all explicit-formula errors are retained; the integral difference handles low zeros. |
| EP.5/exceptional-indices | verified | Positive divisors may exceed k. The modulus 8 boundary and modulus 1000 large-divisor examples match the real cube-root threshold. |
| EP.5/exceptional-indices-sparse | verified | The uniform residue count keeps+1, whose total is O(k^(1/3)log(k)^61); it is negligible relative to the claimed bound. |
| EP.5/addendum-witness | corrected | Added direct effective pi(k)=o(k) input. Deleting bad indices and prime maxima leaves disjoint blocks whose combined product gives one simultaneous small witness. |
| EP.5/conductor-detection | verified | Odd squarefree conductor support supplies the product-of-gcds lower bound; the same selected index would detect any exceptional conductor. |
| EP.5/granville-route-bound | verified | The same primitive nonprincipal witness is small and nonexceptional; its effective O(k/logk) bound contradicts the printed absolute lower bound. |
| EP.6/effective-prime-bound | verified | Both routes yield the stated logical endpoint; effective computability remains a separate recorded ledger obligation, not inferred from a classical existential. |
| EP.6/fixed-exponent-finiteness | corrected | Added the corrected 1-based elimination coefficients in DG(2.2). The genus formula was image-checked; signed smoothness, connectedness and primitive lifts remain explicit obligations. |
| EP.6/composite-exponent-reduction | verified | Prime-divisor reduction preserves the product equation. Five distinct nonzero terms exclude \|y\|<=1; fixed nonunit integers have finitely many power representations. |
| EP.6/fixed-length-finiteness | verified | The finite union is for each fixed sufficiently large k. Signed finiteness depends on the recorded diagonal adapter; neither varying-k finiteness nor effective point enumeration is claimed. |
| EP.7/erdos-threshold | verified | The stronger conjecture is an explicit positive-domain predicate with false small-threshold examples. It is neither an axiom nor an input to the proof. |
| EP.7/smooth-multiplier | verified | The smooth-multiplier predicate excludes zero and records the fixed tau<1/2 announcement without asserting an unproved quantified theorem. |
| EP.4/stirling-upper-adapter | added | Added routed item 141 as a numerical theorem. The pinned Robbins stepwise inequality telescopes to the positive Stirling limit, yielding the stated finite-m upper bound. |

## Remaining owner decisions

Designate the missing EllipticLegendreCharacterInterfaces supplier named by the reviewed paper route. Close the native conductor/residual/Serre-weight interfaces and quantitative analytic certificates in their owners. The signed diagonal-curve adapter must still prove smoothness, geometric connectedness, genus identification and primitive-lift finiteness. These are recorded planning gaps, not unresolved contradictions in the reviewed statements. The mandatory endpoint is positive-solution finiteness for each fixed sufficiently large length; there is no finiteness claim over varying lengths and no effective enumeration of Faltings points.
