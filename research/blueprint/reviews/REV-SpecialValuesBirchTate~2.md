# REV-SpecialValuesBirchTate~2 — independent review

**Accepted after clear corrections.** Codex session `codex-Bb98NE` reviewed revision 2 for [issue #7094](https://github.com/CBirkbeck/tauceti-explorer/issues/7094) on 2026-10-08. This session authored neither planning pass. The prior independent report is preserved, and its packet verdict and source verdicts remain in `reviewHistory`.

Acceptance certifies a complete, sound **target-level plan**. All eight stages are planned, none is closed, and every implementation status remains unchecked. The four exact external gaps and seventeen requests remain. In particular, neither the classical arbitrary-ramification comparison nor modern finite descent is certified as established mathematics by this review. Their statements, source support, ownership and explicit gates make them honest planned targets. The old reader contradictions have been removed; no unresolved contradiction remains between the final artifacts.

## Counts and scope

| Item | Input | Final |
| --- | ---: | ---: |
| Nodes | 51 | 54 |
| Definitions / lemmas / theorems / applications / comparisons | 6 / 14 / 25 / 2 / 4 | 6 / 17 / 25 / 2 / 4 |
| API items / unit tests / planets | 25 / 23 / 15 | unchanged |
| Confirmed pinned baseline declarations | 78 | 78 |
| Supplier requests / named gaps | 17 / 4 | unchanged |
| Planned / closed stages | 8 / 0 | unchanged |
| Independently confirmed source findings | 7 from the prior review | 7 rechecked by this job |

Final node verdicts: **41 verified, 10 corrected, 3 added, 0 unverifiable**. Corrections include source-match improvements and test classification, not only changes to mathematical statements. Every original target is still realized. Final node counts B.1 through B.8 are **3, 11, 9, 5, 7, 5, 6, 8**. No fine proof decomposition was added beyond the protocol’s required promotion of consumed API items.

Read the complete packet, definitive reader and suggested file, the original B.1–B.8 roadmap, the prior independent report and revision handoff, the reviewed library coverage and AUDIT-27 result, both confirmed red-team reports, and the full upstream ArithmeticDirichletSeries and GlobalNumberFields documents. The source and baseline checks below are fresh checks by this review, not a reliance on the previous worker’s verdict.

## Corrections made in this review

1. **Promoted three consumed API lemmas.** Added `B.1/birch-tate-iff-mul`, `B.1/formula-implies-zeta-nonzero`, and `B.8/h-invariant-primary-valuation`, all marked `addedBy: REV-SpecialValuesBirchTate~2`. Their direct consumers are the denominator consequence, failure with a complex place, and higher even-weight Euler characteristic. These statements already had suggested signatures; the graph now records them as required by PROTOCOL §4.
2. **Added missing direct arithmetic inputs.** The final higher Euler-characteristic rewrite now lists N.4’s W invariant as well as the promoted primary-order lemma. The weight-two Lichtenbaum API now directly lists `N.5/e-invariant-kernel-cokernel`, whose odd-primary K₃-torsion/W₂ comparison its sketch uses.
3. **Corrected generator transport.** For γ′=γ^c and new variable T′, the old T maps to `(1+T′)^(c⁻¹)−1`, not the same forward substitution used to express T′ in old coordinates. Put u′=u^c. The new numerator is the transported old numerator times
   `Q=((1+T′)−u^c)/((1+T′)^(c⁻¹)−u)`.
   Cancel the common factor at T′=u^c−1 before forming this quotient. The remaining denominator is a unit, and Q has root value c·u^(c−1). The packet sketch, API, I.2 request and commented principal-ideal prototype now state consistent directions and include this unit.
4. **Separated the two dual actions in L2’s request.** Kolster 1989 uses a covariant dual with compact action multiplied by u and substitution `u⁻¹(1+T)−1`. The usual contragredient dual of `Hom_cts(X,ℚ_p/ℤ_p(n))` is X(−n), with compact action multiplied by κ(γ)^(−n) and substitution `κ(γ)^n(1+T)−1`. Each actual module identification and finite-evaluation hypothesis is requested explicitly. The new comments retain these distinct conventions.
5. **Corrected the S-integer K₂ source anchor.** The old locator only described removed zeta Euler factors. K-book **V.6.8, printed p. 412 (PDF p. 420)** gives the short exact even-degree number-field localization sequence. Comparing integral and S-integral sequences isolates the residue factors at primes IN S. T.5 remains the owner of the relative sequence.
6. **Improved explanatory source matches.** The B.5 finite-sequence/implication anchors now identify the arithmetic, unit-cohomology and numerator/pole inputs. The B.8 conjecture and even-weight anchors now identify their distinct K-theoretic, motivic and rank-zero claims. These changes state the support in our own words.
7. **Rechecked and paraphrased all source findings.** E1–E7 have this job’s required confirmed verdicts and independent reasons. Removed copied source sentences and copied correction fragments from the edited reader/packet; both describe the printed mistakes in our own words. Earlier verdicts remain in the packet history. No new source error was found.
8. **Synchronized the reader and validation provenance.** Added the three lemma sections and direct dependencies, corrected node counts/test classification, recorded fresh public downloads and baseline statement reads, and replaced the obsolete no-compilation statement with this run’s actual result. The wrong-field Birch–Tate test is a non-example.

## Check of the prior review’s requested corrections

| Prior finding | Independently verified in revision 2 |
| --- | --- |
| Quadratic ideal counts and continuation | Exact no-index, inertia-degree, ramification-multiplicity and norm inputs are present; native Riemann differentiability is direct. |
| Quadratic W₂ | Actual cyclotomic Galois and restriction maps support the explicit intersections, giving 8·3·5=120. |
| Discriminant positivity | `discr_ne_zero` is direct where the analytic complex-power/sign arguments require it. |
| Natural degree-two comparison | The actual M.3 Tate map and T.5 relative-S injection give an equivalence, not merely equal valuations. |
| Cyclotomic reduction and minus maps | The existing upstream Kronecker–Weber stage and exact request are retained; norm-kernel/quotient maps and finite defects remain requested. |
| Exceptional character and numerator | Greither’s meromorphic 𝒢₂ is distinct from P₂; μ belongs to P₂/2 and the χ=ω unit branch is requested. |
| Second-kind direction | The B.5 auxiliary generator is fixed; inverse substitution is stated in Greither’s u^s variable. Translation from Appendix A’s u^(1−s) and the integral comparison remain the named gap. |
| Modern series/module signatures | The exact factor −(1+T) is retained, and the I.9 output is untwisted before the subsequent involution. |
| Burns–Flach locator and lattice | Lemmas 5–6 are in §3.4 pp. 526–529; the API preserves equality of corrected classes, with Coherence and fixed integral lattice. |
| Source verdicts and reader contradictions | All seven findings are rechecked. The reader’s proofs, requests, source scope and coverage agree with the final packet. |

The revision’s two removed stage requests are justified by the exact `M.3/tate-s-integer`/`symbol-residue-compatibility` and `L.1/quillen-k-groups` statements, not by dropping obligations. M.3 includes the degree-two theorem at two and real places; the supplier’s place set is augmented by the archimedean places. The coherent normalized Chern comparison remains M.8’s request. Quillen’s every-finite-field table supplies the higher-odd torsion-free localization isomorphism.

The revision also correctly keeps the trivial analytic character’s pole term, distinguishes local dyadic orders 8/16 from full orders 24/48/240, and uses Artin component orders (0,1) for ℚ(i)/ℚ. These corrections were checked against the cited sources rather than inferred from numerical agreement.

## Public sources and source findings

Fresh downloads on **2026-10-08** matched all eight recorded current SHA-256 values. The packet records each URL, hash, access date and exact reading scope. Earlier downloads remain provenance. All text below and in the edited reader is our own description.

| Public version | Passages independently read |
| --- | --- |
| [Weibel, K-book, 29 August 2013 draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | III.6.5 p. 236; IV.1.13 p. 269; V.6.8 p. 412; V.11.11–11.13 pp. 457–459; VI.8.4, 8.6–8.8 pp. 514–516; VI.9.4–9.5 pp. 519–520. |
| [Kolster, 2009 author notes](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf) | pp. 7–16: coefficient sequence, ranks, descent, Proposition 3.2, Theorem 3.3, Corollary 3.4, Conjectures 3.5–3.7 and regulators. |
| [Kolster, 1989 published note](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf) | All pp. 248–251, including Theorem 1, Lemma 2, Conjectures 3–4 and Theorem 5. |
| [Greither, 1992 published scan](https://www.numdam.org/item/AIF_1992__42_3_449_0.pdf) | pp. 451–454 and 469–470: Theorem 3.2, Lemma 3.3, the meromorphic function and exceptional-character proof. |
| [Kurihara, 2025 author copy](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf) | Entire §4 pp. 22–28, including Theorem 4.1, Lemma 4.2 and its order-two cokernel, Corollary 4.3 and the odd-prime-only Proposition 4.4. |
| [Rognes–Weibel with Kolster appendix, 2000](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf) | Introduction pp. 1–4 and full Appendix A pp. 45–49, including the complete induction/root argument. |
| [Burns–Flach, 2001 publisher PDF](https://ems.press/content/serial-article-files/25892?nt=1) | §3.4 Lemmas 5–6 and gluing pp. 526–529; §§4.2–4.3 Lemma 9, Conjectures 4–6 and Remark 9 pp. 534–537. |
| [Cohen, Number Theory II, university-hosted copy](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf) | §10.3.1 Theorem 10.3.1/Corollary 10.3.3 and proof pp. 186–189; Theorem 10.5.3 p. 218; Proposition 10.5.5 and all-prime Euler-factor proof p. 219. |

| Finding | Current verdict and reason |
| --- | --- |
| E1, Kolster 1989 p. 250 | Confirmed: the zeta subscript must name E, not the tower exponent. |
| E2, Kolster 1989 p. 250 | Confirmed: the compact covariant dual has the no-finite-submodule property used for evaluation. |
| E3, Kolster 2009 p. 16 | Confirmed: the reference is to Corollary 3.4 on p. 15. |
| E4, Kolster 2009 p. 9 | Confirmed: the H⁰ field argument is F. |
| E5, Kolster 2009 p. 9 | Confirmed: the whole H⁰ identifies with H¹ torsion only at nonzero twist; the general coefficient sequence quotients its divisible part. |
| E6, Kolster 2009 p. 11 | Confirmed: odd weight has rank r₁+r₂ and even weight r₂. |
| E7, Greither p. 469 | Confirmed: χ=ω must be included separately, as the same article’s pp. 452/470 establish. |

Page images were independently inspected for Kolster 1989 p. 250, Kolster 2009 pp. 9/11 and Greither p. 469. E3 was checked against the numbered statement; E5 against the surrounding coefficient sequence and the twist-zero counterexample. No new search for a separate external erratum was made. The published Park City volume was not accessed, so E3–E6 remain findings about the specified author copy. The older search provenance is preserved with its original date. E5/E6 still affect a stated result.

## Baseline, ownership and closure

Independently read all **78 declarations in 50 modules**, including namespace/section hypotheses, at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. All exist and supply the stated input with compatible hypotheses/conventions. **No citation was removed, replaced, renamed or added.** The full inventory and each current check are in the packet; the reader gives all 78 names and modules.

Key scope distinctions were checked explicitly: native Dedekind zeta is only the convergent L-series object; continuation is R.5’s input. Convolution has summability hypotheses, negative Hurwitz evaluation has interval and nonzero-index conditions, reciprocal Gamma is entire despite totalized pole values, and discriminant nonvanishing justifies positivity. Generic Kummer–Dedekind support is supplemented by the number-field inertia/multiplicity equalities and the exponent-one condition. Cyclotomic restriction agrees with reduction on unit groups. S-integers invert primes IN S. Ordinary unit torsion and its free rank do not define W₂.

The reviewed audit shows no already-built special-value target being planned afresh. **RT-AREA-ktheory-1/10** is satisfied by direct N.3 even-K finiteness and N.4 W₂/positivity imports. **RT-AREA-ktheory-1/11** is satisfied by importing N.8’s independent quadratic certificate and retaining its upper-bound gap. RS-16 leaves I.9/I.10 as owners of modern determinant/descent; RS-08 leaves the coherent normalized Chern comparison with M.8. No supplier packet or upstream document was edited.

Read every **32 distinct direct foreign fine-node statement**, every **16 direct stage contract** (including the existing upstream Kronecker–Weber stage) and all **17 requests**, including their exact coefficients, place conventions, maps and consumers. Read the existing upstream Kronecker–Weber stage and the additional exceptional-character request. Imported owner proofs remain owner obligations. The fact that a supplier plan exists does not mean its declaration is implemented or its complete packet accepted.

A bounded recursive structural traversal found **636 fine nodes, 3,084 distinct edges, 645 baseline leaves and 97 catalogued stage endpoints**. There were no missing IDs, empty statements, conflicting reachable IDs or cycles. Four legacy GeneralAlgebraicKTheory declarations were read in the accepted integrated decomposition; incoming `links` were included for their prerequisites. Packet nodes take priority, with integrated declarations used only for missing IDs. Stop at catalogue stages and baseline references. This is a structural closure check of the fine graph, not an independent audit of all 645 foreign baseline declarations or the mathematics of every foreign proof, and not aggregate-stage acyclicity.

The remaining named gaps are T.5’s independent K₂(ℤ) upper bound, N.8’s independent quadratic generation upper bound, B.5’s classical arbitrary-ramification comparison, and I.10’s modern finite-specialization diagram. None is silently discharged by source citation, characteristic-ideal equality or a numerical check.

## API, tests, planets and validation

The six definitions retain **25 API items and 23 tests**, with test counts **5, 4, 3, 3, 5, 3** in packet order. The tests detect wrong sign/twist/object, inverted Euler factors, omitted degree-dependent two factors, incorrect H¹ ranks/torsion, missing leading terms and loss of integral lattice information. These are predicates and adapters on owner objects; inventing additional carriers or unrelated universal properties would duplicate their owners. Every consumed API identified in the root proof sketches is now an explicit node or an existing theorem node.

All **15 planets** remain key definitions or central named results, within each stage’s limit. The three promoted bookkeeping lemmas have no planets. Every node’s declaration name, all 25 API names and all 23 test names are represented in the suggested file. Higher signatures remain visibly commented prototypes on actual supplier objects; no stand-in `Prop` field or fake carrier is added.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SpecialValuesBirchTate.json --json`: **0 errors, 0 warnings**. Unlike the revision’s form-only run, the existing baseline declaration index was present and all 78 cited names were found. This index check supplements the independent statement reads.
- `lean-check research/blueprint/suggested/SpecialValuesBirchTate.lean`: **exit 0, exactly three warnings, all uses of `sorry`**. Available memory was 103 GB before the run. The shared Mathlib checkout matches the exact pin.
- Lean covers the **16 active imports, two named declarations and seven examples**. It does not elaborate the commented K/cohomology/Iwasawa/motivic interfaces or build the three cited Tau Ceti modules. All Tau Ceti citations were checked at the pin in source, not compiled here.
- Reader/packet consistency was checked for all statements, hypotheses, proof steps, APIs, tests, direct dependencies, sources, requests, source verdicts and coverage counts. `git diff --check` passes.

## Questions for the orchestrator and handoff

No new clarification is needed to accept this target-level pass. Keep the four named owner-side gaps and seventeen precise requests visible in downstream implementation work, especially the B.5 inverse second-kind convention/exceptional branch and I.10’s finite/Tor diagram. Do not interpret acceptance as closing these stages or proving the two independent tame-kernel upper bounds.

The review job is complete. Its own handoff records the same verdict and exact remaining owner work; no checkpoint is requested. This session opens one PR for #7094, then stops without claiming another issue.

## Node-by-node verdicts

The following is also recorded in the packet’s top-level `review.checked` array.

| Node suffix | Verdict | Independent check |
| --- | --- | --- |
| `B.1/birch-tate-formula` | corrected | K-book VI.8.6 and Kolster Conj. 3.5 support the predicate on continued ζ and imported finite K₂/W₂. N.3 and N.4 supply positivity, resolving RT/10. Reclassified the wrong-field test as a non-example; five tests discriminate sign, twist and object. |
| `B.1/birch-tate-iff-mul` | added | Promoted the consumed API to a lemma under §4. Multiplication by the nonzero complex cast of N.4’s positive w₂ is reversible; this is a formula adapter, with no new arithmetic construction. |
| `B.1/formula-implies-zeta-nonzero` | added | Promoted the consumed nonvanishing API to a lemma. N.3 finiteness and the group identity give a positive K₂ order; N.4 gives a positive denominator. Their signed ratio is nonzero for any number field. |
| `B.2/gamma-factor-values` | verified | Read the pinned Deligne normalization and Gamma recurrence hypotheses. Γℝ(−1)=−2π and Γℝ(2)=1/π are regular-value calculations; the totalized nonpositive integral Gamma values are not analytic pole values. |
| `B.2/dedekind-zeta-real-positive` | verified | The native convergent L-series at real σ>1 has nonnegative coefficients and a norm-one ideal contribution 1. Its n=0 slot is omitted, so the Tau Ceti coefficient convention there is harmless. |
| `B.2/zeta-via-reciprocal-gamma` | verified | The R.5 continuation/completion contract and entire reciprocal Gamma factors give the identity away from the completed poles. Direct discriminant nonvanishing justifies the complex-power factor; raw divergent LSeries is never used as continuation. |
| `B.2/zeta-minus-one-sign` | verified | For a totally real field the functional equation gives the positive magnitude ∣d∣^(3/2)ζ(2)/(2π²)^[F:ℚ], with sign (−1)^[F:ℚ]. Discriminant positivity and the preceding Gamma/positive-series inputs are explicit. |
| `B.2/formula-fails-with-complex-place` | corrected | A complex place contributes a reciprocal Γℂ zero at −1 while the completed function is regular. Added the promoted B.1 nonvanishing lemma as a direct dependency and used it to contradict the formula. |
| `B.2/positive-rational-from-valuations` | verified | Positive nonzero rationals with the same prime valuations agree by numerator/denominator factorization. The positivity hypothesis is necessary: q and −q have identical valuations. Pinned native valuation conventions agree. |
| `B.2/birch-tate-iff-absolute-value` | verified | The sign theorem recovers the signed identity from its absolute value. Finiteness and positivity of the imported K₂/W₂ ratio provide the needed nonzero magnitude. |
| `B.2/birch-tate-iff-valuations` | verified | The explicit independent rationality node and sign/positivity inputs allow positive rational reconstruction from all prime valuations. This does not use the conditional denominator consequence to establish rationality. |
| `B.2/denominator-consequence` | corrected | Added B.1/birch-tate-iff-mul directly. Once Birch–Tate is assumed, the multiplied value is an integer and Rat.den_dvd gives the reduced-denominator divisibility. This remains separate from independent integrality. |
| `B.3/dedekind-zeta-of-the-rationals` | verified | Native rational ideal coefficients and convergence identify the two L-series on Re s>1; the R.5 analytic continuation and pinned identity principle extend that equality. Native negative-value formulas are reused. |
| `B.3/zeta-of-the-rationals-at-minus-one` | verified | The pinned Bernoulli theorem with k=1 and B₂=1/6 gives ζ(−1)=−1/12. Its nonzero-index condition and the sign convention were checked. |
| `B.3/k2-of-the-rationals-ring-of-integers` | verified | The native integral-ring equivalence transports T.5’s K₂(ℤ) target. The sign symbol proves a lower bound only; the independent upper bound remains the exact recorded supplier gap. |
| `B.3/birch-tate-for-the-rationals` | verified | The separate values −1/12, 2 and 24 give the rational check. It retains T.5’s independent K₂ upper-bound gap; no general Birch–Tate theorem certifies its input. |
| `B.3/sqrt-five-ideal-count` | verified | Read all native no-index, inertia-degree, ramification-multiplicity and prime-norm statements. The monogenic ω=(1+√5)/2 has polynomial X²−X−1 and exponent one; split/inert/ramified prime-power counts give the χ₅ convolution. |
| `B.3/sqrt-five-zeta-factorisation` | verified | Cohen Prop. 10.5.5 checks every prime Euler factor. Native convolution requires both summability hypotheses; analytic uniqueness then extends the convergent identity with the stated differentiability/continuation inputs. |
| `B.3/sqrt-five-zeta-at-minus-one` | verified | Cohen Thm. 10.3.1/Cor. 10.3.3 and the pinned Hurwitz value theorem, with its interval/nonzero-index hypotheses, give L(χ₅,−1)=−2/5. Multiplying by −1/12 gives 1/30. |
| `B.3/sqrt-five-w2` | verified | N.4’s cyclotomic exponent criterion with the pinned Galois/restriction statements gives primary orders 8,3,5. The field intersections at levels 5/25, 3/9 and 8/16 exclude higher factors; √5 and √2 are distinguished. |
| `B.3/sqrt-five-birch-tate-check` | verified | The check 4/120=1/30 consumes N.8’s independent quadratic certificate. RT/11 ownership and its generation upper-bound gap are preserved; the abelian theorem cannot discharge that independent test. |
| `B.7/s-modified-dedekind-zeta` | verified | Finite Euler-factor removal matches the native restrictAway data on Re s>1. The continued function is imported. Five API items and four tests distinguish empty S, sign, inverse factors and residue norms. |
| `B.7/euler-factors-at-minus-one` | verified | For every nonzero finite prime Nv>1. Therefore the finite product of 1−Nv is (−1)^∣S∣ times the positive product of Nv−1; no rational-prime substitution is made for an inertia norm. |
| `B.7/k2-order-of-s-integers` | corrected | Replaced the unrelated Euler-factor locator with K-book V.6.8, p. 412. The relative T.5 sequence has residues at primes IN S and injective inclusion; finite exact-sequence cardinalities give the product order. |
| `B.7/birch-tate-for-s-integers` | verified | The preceding two identities supply the same positive product in zeta and K₂ orders, with sign shift ∣S∣. All factors are nonzero, so the reverse implication also follows. |
| `B.5/federer-main-conjecture` | corrected | Verified Kolster’s covariant dual and norm-kernel convention. Corrected generator transport: old T maps to (1+T′)^(c⁻¹)−1; the numerator acquires a pole-clearing unit. The packet, API, I.2 request and commented prototype agree. |
| `B.5/tame-kernel-two-part-via-iwasawa` | corrected | Kolster Thm. 1 uses the exact N.6 finite sequence and I.2 unit cohomology, retaining the 2^[F:ℚ] factor. Expanded its source matches to identify these inputs rather than merely repeat theorem numbers. |
| `B.5/minus-module-coinvariant-order` | verified | Kolster Lemma 2 evaluates at u⁻¹−1 for the covariant action. E2 corrects the no-finite-submodule hypothesis to the compact dual. The strengthened L2 request distinguishes this action from the ordinary contragredient twist. |
| `B.5/federer-implies-two-primary-birch-tate` | corrected | Kolster Thm. 5 evaluates the pole-cleared numerator, with w₂^(2)=2^(e+1) and odd dyadic residue factors. Expanded the source anchors; the normalization and pole valuation are retained. |
| `B.5/federer-conjecture-for-abelian-fields` | verified | The revised target now explicitly conditions its comparison on the inverse second-kind substitution, actual minus maps and exceptional χ=ω export. Greither and the full Appendix A induction support this planned route. The arbitrary-ramification comparison remains a named gap, not an established equivalence. |
| `B.5/two-part-birch-tate-abelian` | corrected | The source-supported target composes the conditional abelian Federer comparison with Kolster Thm. 5. Its expanded source matches identify that implication; all comparison gates remain inherited. |
| `B.5/birch-tate-for-real-abelian-fields` | verified | K-book Thm. 8.7 and Greither’s concluding application support the full real-abelian endpoint. Odd and 2-primary identities reconstruct it with sign and rationality; the classical comparison gap is not removed. |
| `B.4/k2-ell-part-unchanged-by-inverting-ell` | verified | T.5’s relative sequence and the native positive inertia degree give Nv=ℓ^f with f>0, so Nv−1 is prime to ℓ. The result is an order-valuation statement at every prime, including two. |
| `B.4/k2-ell-part-as-etale-cohomology` | verified | The actual M.3 Tate map, coefficient compatibility and inverse limit are imported. The natural relative-S injection has prime-to-ℓ residue cokernel; tensoring with flat ℤ_ℓ gives the needed map-level equivalence, beyond a valuation equality. |
| `B.4/w2-ell-part-as-etale-cohomology` | verified | At nonzero twist the coefficient sequence identifies H¹ torsion with finite H⁰. At totally real weight two, the free rank is zero, so the whole H¹ order is the W₂ primary order. Odd-prime restrictions remain explicit. |
| `B.4/etale-euler-characteristic-and-zeta` | verified | Kolster Thm. 3.3 at χ=1, n=2 uses ψ=ω². The revised proof retains the numerator/pole factor when ψ=1; Proposition 3.2 is used directly only when ψ≠1. The H⁰ factor cancels the trivial-character correction. |
| `B.4/odd-primary-birch-tate` | verified | Substitute the actual K₂ and W₂ comparisons into the odd-prime Euler characteristic. This is Wiles’s odd-primary consequence and does not plan a second Tate or higher norm-residue theory. |
| `B.8/cohomological-h2-model` | verified | The actual integral H²/H¹ and lattice are imported from M.8/PS.3, rather than selected from completions. N.6 supplies finite primary factors and correct ranks/torsion; the actual degree-two Tate map at two justifies h₂=∣K₂∣. |
| `B.8/h-invariant-primary-valuation` | added | Promoted the consumed API to a lemma under §4. The imported integral H² has finitely many nontrivial primary factors; product cardinalities and vanishing of other-prime valuations isolate its arithmetic étale ℓ-factor. |
| `B.8/lichtenbaum-formula-statements` | corrected | Verified Kolster Conjs. 3.6–3.7 as separate predicates with fixed leading-term/regulator inputs. Added N.5/e-invariant-kernel-cokernel directly for the weight-two API reduction from K₃ torsion to W₂. Clarified the source matches; five tests retain parity and powers of two. |
| `B.8/odd-primary-even-weight-euler-characteristic` | corrected | Totally real F, even n≥2 and odd ℓ are kept exactly. Added the primary-order API lemma and N.4 directly for the final h_n/w_n rewrite. Its trivial-character branch retains the H⁰ pole denominator; L2 states the ordinary twist action precisely. |
| `B.8/odd-primary-lichtenbaum-totally-real` | verified | Rank-zero Borel covolume, the odd-primary cohomological Euler characteristic and the higher K/cohomology comparisons give the even-weight totally-real predicate. The theorem is not extended to arbitrary parity or complex places. |
| `B.6/kurihara-kolster-series-dictionary` | verified | The two interpolation conventions give the exact unit factor G=−(1+T)ι_u((γ−1)g). The source locators distinguish the §4.1 statement from its §4.2 proof, and I.10 owns the analytic/module comparison. |
| `B.6/kurihara-main-conjecture-over-f` | verified | Kurihara Thm. 4.1 allows p=2. The imported I.9 output is untwisted, includes H³=ℤ₂ and the augmentation factor, and is not confused with the odd-prime-only Proposition 4.4. |
| `B.6/kolster-kurihara-comparison-table` | verified | All nine finite-sensitive entries are explicit; (a),(b),(f),(i) remain the exact I.10 gap. Lemma 4.2’s order-two cokernel, real places and Tor/finite specialization are retained. Height-one ideal equality alone is insufficient. |
| `B.6/federer-conjecture-all-totally-real` | verified | This is a proof target conditional on the exact I.10 comparison and I.9 determinant theorem. The finite descent is not inferred from a pseudo-isomorphism or discarded finite module. |
| `B.6/birch-tate-all-totally-real` | verified | The planned endpoint combines that conditional Federer implication with Kolster’s 2-part, the odd-primary theorem, sign and rational reconstruction. Its recorded modern finite-descent gap remains necessary. |
| `B.2/zeta-minus-one-rationality` | verified | Cohen Thm. 10.5.3 and R.5’s Borel rank-zero normalization give rationality independently of Birch–Tate. The sign theorem supplies nonzero value; no independent-integrality circularity is introduced. |
| `B.2/independent-denominator-integrality` | verified | The L3 request is the untruncated trivial-extension Deligne–Ribet statement w₂ζ(−1)∈ℤ. It names the independent input and does not replace it by the conditional denominator consequence. |
| `B.7/enlarging-s` | verified | Finite Euler-factor cancellation and T.5 order ratios give the enlargement formulas. Canonical inclusions compose for nested finite sets; nonzero-prime norms permit cancellation. |
| `B.7/localisation-comparison-naturality` | verified | M.3’s signed residue identity ∂h=−κ tame is distinguished from the M.8-normalized Chern map. Quillen’s exact finite-field table gives the integral torsion-free higher-odd localization isomorphism and regulator compatibility; higher real and compact-support maps stay requested. |
| `B.8/real-place-two-correction` | verified | Rognes–Weibel Thm. 0.6 gives the two even congruence classes and the factor 2^r₁. The revised numerical checks use local K₃/K₇ primary orders 16, not full orders 48/240, and preserve the real restriction map requirement. |
| `B.8/higher-values-real-abelian` | verified | The complete Kolster Appendix A induction/root argument gives the classical even-weight abelian theorem with real correction. It is not obtained by extrapolating modern degree-two finite descent; the exceptional-character and second-kind conventions remain supplier obligations. |
| `B.8/integral-equivariant-tate-statement` | verified | Burns–Flach §3.4 Lemmas 5–6 and §§4.2–4.3 give the intrinsic corrected class, plus sign and componentwise leading terms. Rationality precedes the local equivalence; Coherence, the integral lattice and class equality are explicit. The ℚ(i) test has Artin orders (0,1). |
