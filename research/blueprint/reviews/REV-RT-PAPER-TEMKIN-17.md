# REV-RT-PAPER-TEMKIN-17 — verification of the red-team findings on PAPER-TEMKIN-17

**Verdict: all seventeen findings are confirmed, at the severities the red team gave: ten medium and seven low.**

Eight fixes need adjusting: /1, /3, /4, /6, /7, /8, /9 and /15. Each reason in `RT-PAPER-TEMKIN-17.review.json` states the corrected fix.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4520).
- **Independence.** This verifier took no part in any of the three jobs:
  - the red team, RT-PAPER-TEMKIN-17 (Claude Code, `cc-f805bf`, #4697);
  - the extraction, PAPER-TEMKIN-17 (#4290);
  - its review, REV-PAPER-TEMKIN-17 (#4464).
- **Related work.** This session reviewed PAPER-BHATT-18. This verification cites that paper's accepted route 6 for /3 and /4, but it is not one of the jobs under verification.

**What was checked.**

- **The sources**, all with the red team's hashes:
  - Temkin, *Tame distillation and desingularization by p-alterations*, Ann. of Math. 186 (2017) 97–126, publisher PDF (`1f4ac06f…fba4`); printed page = PDF page + 96.
  - arXiv:1508.06255v2 (`24f67ac3…a435`).
  - *Travaux de Gabber*, arXiv:1207.3648 (`18a6193d…44a6`), for Exposé X §§3.3–3.5.
  - Page images were used where a finding turns on a formula (pp. 117 and 123).
- **The records.**
  - The extraction and its review.
  - The extractions and reviews the findings cite: PAPER-BHATT-SCHOLZE-17 and PAPER-SCHOLZE-17.
  - PAPER-BHATT-18, which bears on /3 and /4.
  - RS-25 and its review.
  - The ClassicalAdicEtaleCohomology, MotivesAndAlgebraicCycles and PerfectoidSpaces packets.
  - The AdicCoefficientsAndComparisons decomposition.
- **The atlas.** Every stage a finding cites, on the atlas `scripts/build.py` assembles, with the graph paths each fix depends on.
- **Library claims.** Read at Mathlib `082e2d3` and Tau Ceti `f790474`.

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-TEMKIN-17.review.json` reports `ok`.

## The two findings about the paper's mathematics

**/1: confirmed; the new source issue must claim less.**
- Temkin's §4.1.4 asks only for "a P-alteration f : Y′ → Y such that Y′ is regular and f⁻¹(Z) is an snc divisor", and his alterations (§4.1.2) are proper, not projective.
- His source, Exposé X §3.3.3, asks for "a surjective projective morphism f".
- So §4.3.2, which takes the first claim of Theorem 1.2.5 (a *projective* char(X)-alteration) from Theorem 4.3.1(i), gives no projectivity.

The review's note derives projectivity from 4.3.1(ii), and the red team's counterexample refutes that. Take S = X = Spec of a regular two-dimensional excellent local ring, Z its closed point, a = b = f′ = id and W′ = Z′ = V(xy). These satisfy every conclusion of (ii), yet b⁻¹(Z) is a point.

The same issue affects the step "(i) follows from (ii)" that Temkin copies from Exposé X. So the source issue should state the projective form of §4.1.4 and say that b⁻¹(Z) snc must come from the construction behind (ii). It should not say that the printed proof already delivers it.

**/2: confirmed; the fix works.** In the separable case of Theorem 4.2.1, Step 4 takes a from Theorem 3.3.6, which works inside a maximal P-extension. That extension is perfect when p ∈ P, so the alteration may be inseparable, and Theorem 4.3.1(iii) needs it separable.

The red team's repair holds. A separably P-closed field has P-closed perfection and the same inertia groups, so the argument runs with a maximal *separable* P-extension. An equivalent, shorter repair replaces K′ by its maximal separable subextension.

## Statuses, owners and duplication

- **/3 (planned at L5): confirmed, with two refinements.** L5 plans de Jong's field and valuation-base cases only. Temkin needs more in three places:
  - flattening of non-finitely-presented morphisms over qcqs bases (Stacks 081R);
  - normalization over universally Japanese schemes;
  - quasi-projective relative curves over qe bases, which Exposé X Remark 3.4.1(i) says need the stable modification theorem.

  The refinements:
  - The same 081R statement is PAPER-BHATT-18's missing item `flatten-finite-type-scheme`, which that paper's accepted route 6 sends to SchemeAndStackFoundations SF.4. Temkin's flattening item should coalesce with it there.
  - L5's node `de-jong-5-8-curve-fibration-alteration` is the base case for the curve item.
- **/4 (SF.4 duplicate): confirmed.**
  - RS-25 keeps "proved resolution settings" in SF.4.
  - The Motives packet requests Raynaud–Gruson from SF.4.
  - PAPER-BHATT-18 routes 081R there.

  Apply it with /3, and send Cossart–Piltant to SF.4 too, citing StableReduction layer 4 for Lipman's case.
- **/5: confirmed.** ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles plans the pro-p Sylow/tame comparison in any rank, LocalFieldsRamification layer 4 plans wild inertia as pro-p Sylow, and ProfiniteProPGroups layer 2 owns Sylow theory.
- **/6: confirmed.** Tau Ceti ModularCurves 4D "owns … strict henselisation", and neither library has a henselization. For the orchestrator: the draft H1 packet also requests it from SF.2, a third claim to consolidate.
- **/7: confirmed; the link direction matters.** H1:henselian and C5 plan Huber's Zariski–Riemann limit, and PAPER-SCHOLZE-17's accepted item 442 plans it there. The link must run H1:henselian → the Part II: H1:henselian → L5 is an edge and the Part II imports L5, so the reverse closes a cycle.
- **/17: confirmed.** PAPER-SCHOLZE-17's item 503 plans Abhyankar's inequality at C8. The general-valued-fields Part II is the natural owner, with C8 importing it, since C8's node covers only complete algebraically closed fields.

## Library claims and missing items

- **/8: confirmed; the status change is wrong.** Every cited declaration exists:
  - Tau Ceti's `ValuationSpectrum`, with its spectral instance, patch compactness and `continuous_comap`;
  - Mathlib's `compactSpace_withConstructibleTopology`, `ValuationSubring.ofPrime`/`idealOfLE` and `linearDisjoint_of_isPurelyInseparable_of_isSeparable`.

  But absolute-rz, composed-valuations and split-towers each state more than the libraries give, so they stay missing and cite these declarations in their notes. Alternatively the fixer splits each item into a library part and a missing part. The correction of the rz-space note and route 1's brief ("planned" where built) stands.
- **/9: confirmed, with two corrections.**
  - Mathlib *does* have `IsRegularLocalRing` and `IsRegularRing` (RegularLocalRing/Defs.lean:51, 92). So the regular-scheme item is planned at ModularCurves 4D on that base.
  - AlgebraicModuliForArithmeticGeometry R09.7a already defines snc boundary divisors, and only their extension to regular noetherian schemes is new.

  The rest holds: nothing plans quasi-excellence or general Japaneseness, and non-free quotients have no owner.
- **/10: confirmed.** Step 10 uses the log Abhyankar lemma, Kato's log-smooth-over-log-regular theorem and log smoothness of semistable curves, and none has an item or an owner. Only Grothendieck–Murre (or SGA 1 XIII §5) needs adding to the prerequisites, since Kato 1994 is already there.
- **/11: confirmed.** The four Mathlib results exist and are used:
  - `LocalSubring.exists_le_valuationSubring`;
  - `Flat.generalizingMap` with `isOpenMap_of_generalizingMap`;
  - `Scheme.Hom.isConstructible_image`;
  - constructible compactness.
- **/15: confirmed.** Cossart–Piltant is J. Algebra 529 (2019) 268–535 (Crossref), and §4.3.2 uses universal resolvability. The restated item should say "projective" only if the design confirms that their resolution is projective (compare /1).

## Other mistakes

- **/12: confirmed.** The proof of Lemma 3.2.10 takes Chevalley's polynomial to be the minimal polynomial. The counterexample t(t − 1) over Z_(p) holds, and passing to the minimal polynomial (Gauss's lemma) repairs it.
- **/13: confirmed.** All three passages are also in arXiv v2:
  - §3.1.7's "only if" fails for the affine line with doubled origin over F_p at a rational point;
  - "first part of the theorem" should say "lemma";
  - Step 10 prints "log regular" and "(X, S)" where log smooth and (S, W) are meant, and T̄ is undefined.
- **/14: confirmed.** Exposé X defines universal l′-resolvability only for l invertible on the scheme, so E1's review reason misstates its hypothesis.
- **/16: confirmed.** The paper's G = |l^×|/|k^×| is a quotient of value groups.

## What becomes a fix job

The ten medium findings (/1–/10) will be queued as FIX-RT-PAPER-TEMKIN-17, with the adjustments above:
- **/1:** narrower source-issue wording;
- **/3–/4:** coalescing with PAPER-BHATT-18's SF.4 item, and Cossart–Piltant to SF.4;
- **/6:** the SF.2 claim to consolidate;
- **/7:** the link direction;
- **/8:** items kept missing;
- **/9:** Mathlib's regular rings and R09.7a.

No Lean file is a deliverable, and no Lean was run.
