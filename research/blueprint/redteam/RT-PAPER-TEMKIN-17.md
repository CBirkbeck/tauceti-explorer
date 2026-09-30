# RT-PAPER-TEMKIN-17: red team of the Temkin extraction

Red team: Claude Code, session `cc-f805bf`, 29 September 2026.

Target: `PAPER-TEMKIN-17`, the extraction of M. Temkin, *Tame distillation and desingularization by p-alterations*, Ann. of Math. **186** (2017) 97–126, arXiv:1508.06255. The extraction is by `cc-39fac3`, and it was accepted by `REV-PAPER-TEMKIN-17` (`cc-fb70e5`). I did neither job.

**Result: seventeen findings, ten medium and seven low.** The machine-readable file is [RT-PAPER-TEMKIN-17.result.json](RT-PAPER-TEMKIN-17.result.json).

Much of the extraction holds:

- the statements and locators of all 64 items;
- the four library citations;
- the one-route-per-missing-item bookkeeping;
- the four recorded source issues.

The findings fall into three groups:

- **The paper's mathematics.** The paper has two gaps that neither the extraction nor the review records, and one of the review's own changes is wrong (findings 1–2). There are also three smaller unrecorded mistakes (findings 12–13).
- **Statuses and owners.** Several statuses, and several claims of "no owner", do not survive a search of the atlas (findings 3–8, 17).
- **Omissions.** Some definitions and some log-geometric inputs are missing (findings 9–11).

## Source

On 29 September 2026 I re-fetched both texts:

- the Annals PDF, SHA-256 `1f4ac06f…`;
- [arXiv:1508.06255v2](https://arxiv.org/abs/1508.06255v2), SHA-256 `24f67ac3…`, still the last version.

Both match the record. I read both completely and located every quotation below in both. I checked the misprints of pp. 117 and 123 on page images.

To test Temkin's claims about his sources, I read:

- Illusie–Temkin, Exposé X, in [arXiv:1207.3648v1](https://arxiv.org/abs/1207.3648): §3.3, Theorem 3.4 with its steps, Remark 3.4.1, and Theorem 3.5 with its proof;
- the Cossart–Piltant listing, and its Crossref record.

## What held

- **Items.** Every numbered result from Theorem 1.2.5 to Remark 4.3.4 is an item. Statements and hypotheses match, apart from a notation slip (finding 16). There are 4 library, 5 planned and 55 missing items; routes 1, 2 and 3 carry 26, 27 and 2 of them, each exactly once.
- **Library citations.** I opened each at Mathlib `082e2d3`: `Valuation`, `ValuationRing`, `ValuationSubring`, `Field.exists_primitive_element`, `AlgebraicGeometry.IsProper.eq_valuativeCriterion` and `Algebra.IsEtaleAt.exists_isStandardEtale`. Each exists and gives its item. `IsKrasner` is proved only for complete fields, as the krasner item says.
- **Recorded mistakes.**
  - E1 is a real gap. Take S = Spec ℤ, X = A¹ over ℤ[1/2] and P the odd primes. A separable alteration Spec ℤ[i] → Spec ℤ, which is wild at 2, distils to a {2}-alteration.
  - E2, E3 and E4 are right.
- **Routes.** Route 1 matches the DITTMANN-POP and JANNSEN proposals. Route 2's title reproduces its Tau Ceti parent's. Route 3's stage resolves.

## Findings

### 1. The projectivity in Theorem 1.2.5, and the review's note (medium, error)

Theorem 1.2.5 promises a *projective* char(X)-alteration. §4.3.2 derives it from Theorem 4.3.1(i), that is, from universal P-resolvability. But Temkin's §4.1.4 defines universal P-resolvability without projectivity. The source he adapts, Exposé X §3.3.3, has it: "there exists a surjective projective morphism f : Y′ → Y".

The review noticed that (i) gives no projectivity. It added a note: projectivity "comes from Theorem 4.3.1(ii)". That does not work, because (ii) controls only Z′ = b⁻¹(Z) ∪ f′⁻¹(W′). Here is a counterexample:

- take a regular excellent surface S = X, with f = id and Z a closed point V(x, y);
- take a = b = f′ = id and W′ = Z′ = V(xy).

Every clause of (ii) holds, but b⁻¹(Z) is a point. The fix records the omission as E5, adds projectivity to the item universal-p-resolvability, and rewrites the note.

### 2. The separable case of Theorem 4.2.1 (medium, missing source issue)

In the separable case, Step 4 needs a separable P-alteration. Theorem 3.3.6 gives only a P-alteration. The reason lies in Theorem 3.2.12, which works inside an arbitrary maximal P-extension, and that extension contains K^{1/p^∞} when char K = p ∈ P.

Theorem 4.3.1(iii) needs the separable case: Exposé X's induction applies Theorem 3.4 over a separably resolvable base of characteristic p. Gabber's Sylow quotient never had this problem.

The repair is a separable variant of Theorems 3.2.12 and 3.3.6, taken over a maximal separable P-extension. It rests on one fact: a separably P-closed field is separably P-tame. To see this, pass to the perfection, which is P-closed, and use (K^perf)^t = K^t·K^perf.

### 3. L5's planned items are in the wrong generality (medium, error)

The items flattening, normalization-japanese and semistable-curve-alteration are marked planned at AdicCoefficientsAndComparisons:L5. L5 plans de Jong's field and valuation-base cases for finite-type schemes. Temkin needs more:

- Raynaud–Gruson flattening over arbitrary qcqs schemes, without finite presentation (Stacks 081R);
- normalization over noetherian universally Japanese schemes;
- semistable reduction of multipointed curves over any noetherian qe normal base.

For the last, Exposé X Remark 3.4.1(i) says it needs Temkin's stable modification theorem, not de Jong's result.

### 4. SF.4 already owns flattening and proved resolution settings (medium, duplicate)

Three pieces of accepted work point to SchemeAndStackFoundations:SF.4:

- RS-25 narrowed SF.4 to "source-scoped alterations, modifications and proved resolution settings";
- MotivesAndAlgebraicCycles requests Raynaud–Gruson platification from SF.4;
- PAPER-BHATT-SCHOLZE-17 routes de Jong's alterations there.

The extraction never mentions SF.4. It plans flattening at L5 and sends Cossart–Piltant and Lipman to the new Part II. It also misses Tau Ceti StableReduction Layer 4, which plans Lipman's resolution for arithmetic surfaces, the special case of the Lipman theorem the item cites.

### 5. Wild inertia and the tame quotient already have owners (medium, duplicate)

Route 2 claims the Krull-valued theory "has no owner", and the extraction cites only LocalFieldsRamification Layers 2–3. Three owners exist:

- **ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles.** Its stage text plans the "valuation-theoretic pro-p Sylow/tame comparison". Its draft packet states Temkin's §2.2.6 for strictly henselian valuation rings of any rank, and that the strict henselization of a valuation ring is a valuation ring.
- **Tau Ceti LocalFieldsRamification Layer 4.** It plans wild inertia as the pro-p Sylow subgroup, and the tame quotient.
- **ProfiniteProPGroups Layer 2.** It owns profinite Sylow theory.

### 6. Henselization of local rings (medium, duplicate)

k^h and k^u are defined through henselization and strict henselization of k°, and Lemmas 2.3.2 and 2.3.11 use EGA IV 18.6.8 and 18.6.14. The general strict henselisation API belongs to Tau Ceti ModularCurves Layer 4D. Henselization of pairs is a draft node in PerfectoidSpaces:P3. The brief imports neither.

### 7. Zariski–Riemann spaces (medium, duplicate)

The review said C5's Zariski–Riemann models are only for strictly totally disconnected spaces. In fact two stages plan Huber's Zariski–Riemann limit theorem, Hub93b Lemma 2.1:

- ClassicalAdicEtaleCohomology:H1:henselian, which has a node stating it;
- DiamondEtaleCohomology:C5.

That theorem is Temkin's Lemma 3.1.3 for X = Spec A with a dominant point. The general RZ_K(X) must build on it, as PROTOCOL §15 requires.

### 8. Missing items the libraries partly have (medium, library-claim)

- **absolute-rz.** Val_K is Tau Ceti's `ValuationSpectrum` of the field. Tau Ceti has its spectral instance and `continuous_comap`, and Mathlib has `compactSpace_withConstructibleTopology`. The rz-space note calls Spv "planned"; it is built.
- **composed-valuations.** Mathlib has `ValuationSubring.ofPrime` and the `idealOfLE` bijection.
- **split-towers.** Mathlib has `IntermediateField.LinearDisjoint` and `linearDisjoint_of_isPurelyInseparable_of_isSeparable`.

### 9. Definitions with no item (medium, missing)

The main theorems use these notions without items:

- quasi-excellent schemes, which appear in no stage of the atlas;
- universally Japanese schemes;
- regular schemes, owned by Tau Ceti ModularCurves 4D;
- snc divisors;
- quotients by finite groups, needed for Y/G in §3.3.1 and (X̄, T̄)/G in Step 10. ModularCurves 0C has only the affine and free cases.

### 10. Step 10's log geometry (medium, missing)

Step 10 uses three results that nothing plans:

- Abhyankar's lemma in log form: a tame covering, étale off an snc divisor, is Kummer étale and log regular;
- Kato's Theorem 8.2: log smooth over a log regular base is log regular;
- log smoothness of semistable multipointed curves.

CR.5 plans Kummer and log-smooth morphisms only as definitions.

### 11–17 (low)

- **11. Library inputs without items (missing).** Four inputs of §3 are in Mathlib but are not items: Chevalley's extension theorem (`LocalSubring.exists_le_valuationSubring`), openness of flat, finitely presented morphisms, Chevalley's constructibility theorem, and compactness in the constructible topology.
- **12. Lemma 3.2.10 (missing source issue, with a counterexample).** Chevalley's f need not be the minimal polynomial of a. Take f = t(t − 1) and a = 0 over ℤ_(p); then A → L is not injective. The fix is to use the minimal polynomial.
- **13. Three more unrecorded mistakes (missing source issues).**
  - §3.1.7's "injective if and only if X is separated" is false for non-dominant points. Take the line with doubled origin over F_p, pointed at t = 1.
  - Lemma 3.2.10 says "first part of the theorem". The review noted this but did not register it, although §18 requires it.
  - Step 10 writes "(X′, T′) → (X, S)" for (X′, T′) → (S, W), and calls a composition of morphisms "log regular".
- **14. E1's account of Exposé X (other).** Exposé X defines universal ℓ′-resolvability only for ℓ invertible on the scheme, so Theorem 3.4 there assumes char(S) ⊆ {ℓ}′. This supports E1's first repair.
- **15. Cossart–Piltant is published (error).** It appeared in J. Algebra 529 (2019) 268–535. The item should also state the embedded form that universal resolvability needs.
- **16. Notation in henselian-ramification (other).** "|l^×/k^×|" should read |l^×|/|k^×|.
- **17. Abhyankar's inequality (duplicate).** It is already routed to DiamondEtaleCohomology:C8, through PAPER-SCHOLZE-17 item 503, where it is an open gap. Name one owner.

## Checks

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-TEMKIN-17.result.json` reports `ok`. `python3 research/blueprint/intake.py check-files` reports 0 problems on both files.
