# Review: HabiroCyclotomicCompletions (Cyclotomic completions and classical Habiro rings), stages HC.1–HC.6

Job `REV-HabiroCyclotomicCompletions` (issue #145), by Claude Code, session `cc-442dc5`, 25 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-HabiroCyclotomicCompletions`, issue #554, PR #2889). I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`: HC.1, HC.2, HC.3 and HC.5 are `source_decomposed`, HC.4 and HC.6 are `partial`, and the open points are recorded as 2 gaps and 6 restructure entries.

## What was checked

- **Sources.**
  - **Habiro, *Cyclotomic Completions of Polynomial Rings*, Publ. RIMS 40 (2004) 1127–1146.** The recorded DOI 10.2977/prims/1145475444 resolves to the article on EMS Press, and the recorded SHA-256 (f5609467…) is that of the publisher's PDF. The other DOI mentioned in the handoff, …/1145475493, belongs to a different article (heat kernels on graphs). The checkers read the whole paper, pp. 1127–1146, with page images wherever the text layer drops ε, ∉ and ≠. The packet had not read §3.2, the proofs of §§5–6, §7.1, §7.2 and §7.5, and it cited a §3.3 and a §6.2 that do not exist.
  - **Habiro's arXiv preprint math/0209324v1** (ae2ea502…), added as a second source. It numbers results with one counter per section, and its proof of Lemma 3.1 contains the unique degree-normalised expansion along a cofinal chain of monic polynomials. The published version dropped that expansion, and the packet had called it "the packet's own".
  - Also added: Garoufalidis–Scholze–Wheeler–Zagier, *The Habiro ring of a number field* (arXiv 2412.04241v2, §§1.3–1.4, 5.1–5.2); Apostol, *Resultants of cyclotomic polynomials* (Proc. AMS 1970); Wagner, *q-Witt vectors* (arXiv 2410.23078v5, §2.1); OEIS A022493.
- **Checkers.** Three checkers worked in parallel. Each compared locators and excerpts with the source pages, opened every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474, read the atlas, AUDIT-17, RS-10, PLAN-HABIRO and the sibling packets, and computed in PARI/GP:

  | Checker | Scope |
  |---|---|
  | A | HC.1–HC.2 (6 nodes), the 16 baseline declarations, the library audit, the Lean file |
  | B | HC.3–HC.4 (8 nodes), Habiro §§3–6 |
  | C | HC.5–HC.6 (7 nodes), Habiro §7, the packet-level fields, cycles and consumers |

- **What I checked myself (PARI/GP).**
  - Values of the Kontsevich series F = Σ(q; q)_n: F(ω) = 5 − ω, F(i) = 8 − 3i, F(ζ_5) = 9 − 5ζ_5 − 3ζ_5², F(ζ_6) = 17 − 13ζ_6.
  - Taylor coefficients of F at q = 1: 1, −1, 2, −5, 15, −53, 217, −1014, 5335 (signed Fishburn numbers). At q = −1: 3, 11, 72, 635, 7085, 95911.
  - The factorial products: (q; q)_N has leading coefficient (−1)^N, and (−1)^N (q; q)_N = ∏_{d≤N} Φ_d^{⌊N/d⌋} for N ≤ 20.
  - The inverse of q: q·Σ_{n<N} q^n(q; q)_n = 1 − (q; q)_N for N ≤ 10, and q⁻¹ ≡ 1 + q − q³ − q⁴ + q⁵ mod P_3.
  - Normalised digits modulo P_4: F² has digits (1, 3 − q, 6 − 3q − q², 7 − 4q − 4q² + 2q³), with the carry q³ − 1 at index 2; F·q⁻¹ has (1, 2q, 3q², 4q³); q⁻¹ has (1, q, q², q³); q has (1, −1, 0).
  - Φ_6 − qΦ_1 = 1. Res(Φ_12, Φ_3) = 4, Res(Φ_9, Φ_3) = 9, and Res(Φ_1, Φ_6) = 1.
  - C's idempotents over ℚ and ℤ[1/2] modulo P_3, and the element t = (q − 1)e_1.
  - The mod-2 idempotent q⁵ + q + 1.
  - C's instance for Remark 7.1: (1 − q + q²)(1 + 2q + 2q² + q³) = 1 + qΦ_5.
  - Φ_2 ≡ Φ_1 mod 2, which settles Wagner's exponent.
  - By hand: q is a unit of ℤ[q]^{2} = ℤ[[q + 1]] (q = −1 + (q + 1)), and e^{2πi/6} − e^{2πi/3} = 1.
- **Ownership and cycles.**
  - The corrected packet follows RS-10's owners: HC.1 owns the ordinary completion and cofinal indexing; HC.2 the normalised expansions and ordinary invertibility of q; HC.3 the p-adic re-expansion; HC.4 adjacency, resultants and rigidity.
  - The derived completion is HabiroRings HR.2's. The F = ℚ comparison is HabiroNumberFields HB.6's.
  - The only cross-roadmap prerequisite is the node HabiroRings:HR.2/habiro-complete-modules. Its closure contains HC.1 only.
  - A validator checks that every prerequisite resolves, that every gap names nodes, and that the node graph is acyclic and follows the stage order. It also checks that no path leads from a cross-roadmap prerequisite back to an HC stage at or after the citing one; the paths it follows are node prerequisites, the atlas `requires` and every restructure link. It finds no cycle.
  - No consumer packet cites an HC node id, so the deleted node breaks no citation.
- **Checks.**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/HabiroCyclotomicCompletions.json` reports 0 errors and 0 warnings. The original packet also passed, because the checker does not test statement truth, test kinds, excerpt length, locators or cycles.
  - The source issues pass `scripts/check_errata.py` on a copy of the list.
  - `research/blueprint/intake.py check-files` passes on the three deliverables.

## Counts

| | before | after |
|---|---|---|
| nodes | 21 | 48 (20 corrected, 28 added, 1 deleted) |
| API items | 45 | 111 |
| unit tests | 32 (none with a kind) | 67 (all with a kind) |
| planets | 9 | 13 (at most 5 per layer) |
| sources | 1 | 6 |
| baseline declarations | 16 | 76 (61 added, 1 removed; all with `kind` and `checked`) |
| requests | 5 (consumers named as suppliers; no `neededBy`) | 0 |
| gaps | 4 (stage ids as `neededBy`) | 2 (node ids) |
| source issues | none | 18 |
| restructure entries | 3 (not in the protocol format) | 6 |

Added nodes by stage: HC.1 7, HC.2 1, HC.3 3, HC.4 10, HC.5 6, HC.6 1.

## The main corrections

**Statements that were false.**
- **q is a unit of R[q]^S for every S.** HC.2/invertibility-of-q assumed "1 ∈ S". Every f ∈ Φ*_S has constant term ±1 (Habiro §7.1); for S = {2} the completion is ℤ[[q + 1]]. The node now cites §7.1 and Proposition 7.1, q⁻¹ = Σ q^n(q)_n, instead of the §2 conventions. The Laurent comparison holds for every S, and Conjecture 7.1 on the unit group is recorded as open.
- **The factorial products are not monic.** (q; q)_N has leading coefficient (−1)^N, so Mathlib's `%ₘ` by P_N does not apply. The digits come from successive division by the monic q^{n+1} − 1, with deg a_n ≤ n. That bound, the whole normalisation, was never stated. The same error was in the Lean header, the readme and AUDIT-17.
- **ι : R[q] → R[q]^S is injective exactly when S ≠ ∅ or R = 0.** The packet had denied injectivity and deferred it to HC.4.
- **Adjacency is reflexive.** The packet dropped Habiro's clause c_{n,n} = 0, which made the relation empty over ℚ and broke Lemma 4.2(2) for m = n. The Lean file's `adjacent_over_Q_empty` was false. "The prime ideal pR" was also wrong: 2ℤ[i] is not prime.
- **Taylor maps.**
  - The test "fails over ℤ in degree two" was false: over ℤ, k!·D_k is the k-th derivative (`factorial_smul_hasseDeriv`). The identification fails only where k! is a zero-divisor, as over F_2.
  - The Hasse statement is now made precise through representatives modulo Φ_n^{k+1}.
- **Module completion.** The completion of a polynomial module is exact for every R and S: R[q]/(f) is R-free for monic f, and a cofinal chain makes M[q]^S a countable product of copies of M. So the "derived-limit correction" and the test `not_exact` were false. Non-exactness concerns R[q]-modules with torsion, which is HR.2's derived completion; HC.5/ordinary-versus-derived-completion compares the two.
- **"Non-adjacent, so comaximal" is false.** For R = ℤ × ℚ and S = {1, 2}, the orders 1 and 2 are not adjacent but Φ_1 and Φ_2 are not comaximal. The Chinese remainder node is restated under comaximality, with the exact criterion; this agrees with adjacency for Noetherian domains.
- **Other misstatements.**
  - HC.6/the-acceptance-examples computed nothing.
  - HC.4/non-surjectivity claimed that §7.4 treats the Taylor maps.
  - HC.1's non-example ("neither q-adic nor (q − 1)-adic") was false for R = 0 and for finite S; R[q]^{1} = R[[q − 1]].

**Library (the baseline and AUDIT-17).**
- **`PowerSeries.subst` needs a nilpotent constant coefficient** (`HasSubst`, Substitution.lean:40), not a topologically nilpotent one, so it cannot build the p-adic re-expansion. The re-expansion is now HC.3/p-adic-re-expansion, built from `PowerSeries.eval₂Hom` with `HasEval`. `subst` is kept for q ↦ q^a and q = ζe^{−t}. The same error is in HabiroNumberFields HB.6/the-substitution-exists (restructure entry).
- **Completeness.** `IsPrecomplete` concerns one ideal and does not fit infinite S. Completeness comes from Tau Ceti's `IsCompleteSeparated.pi` and `.of_isClosedEmbedding`. The universal property is Mathlib's `UniformSpace.Completion.extensionHom` with Tau Ceti's `ringHom_ext_of_continuous`, which closes the packet's gap 4.
- **Near misses.**
  - `Polynomial.taylor` is only linear; the ring map is `taylorAlgHom`.
  - `AdjoinRoot Φ_n` is not R[ζ] when Φ_n splits over Frac R.
  - `TauCeti.TopCommRingCat.IsCompleteSeparated` is a predicate, not a category.
  - Habiro's (4.1) is in Mathlib in characteristic p (`cyclotomic_mul_prime_pow_eq`, `cyclotomic_mul_prime_dvd_eq_pow`).
  - Tau Ceti's executable synthetic division (`CoeffList`) was described but not cited.

**Closure.**
- **HC.1.** The node HC.1/the-cyclotomic-completion is split into the index monoid, the completion, its finite quotients (ker π_f = f·R[q]^S, which Theorem 6.1's proof uses) and the topology. New nodes: the factorial polynomials; the completion along a cofinal family; the non-adic theorem with Proposition 6.1; and Habiro's Lemma 3.1. Lemma 3.1 is used by Theorem 5.2, §7.5 and the module exactness, and no node had carried it.
- **HC.2.** Factorial series with arbitrary coefficients, which QSeries QM.5 requests, are split off.
- **HC.3.** Three re-expansion nodes:
  - which roots are p-adically close: the ratio must have p-power order, and orders differing by a prime is not enough, since e^{2πi/6} − e^{2πi/3} = 1;
  - the construction;
  - the comparison of Taylor maps at close roots, which is the square QT.4 needs.
- **HC.4.** The proof of Theorem 4.1 did not close. Habiro's §3 is now three nodes (the radical relation, Proposition 3.1, Theorem 3.1 with Corollary 3.1), and Lemmas 4.1 and 4.2 are nodes too. Also added:
  - Lemma 5.1 with Theorem 5.1;
  - Corollary 5.1, corrected;
  - Theorem 6.2, separated from Theorem 6.1, with Conjecture 6.1 recorded as open;
  - the non-surjectivity of the Taylor maps;
  - Apostol's resultants, and Wagner's Lemma 2.1 for α ≠ 0.
- **HC.5.** New nodes:
  - Theorem 7.1, whose excerpt had been misquoted so that it was vacuous;
  - the ring ℚ[q]^S from §7.5;
  - the rings ℤ[1/Δ][q]^N as products of domains, on which evaluation at all roots stays injective while each Taylor map does not;
  - Propositions 7.2 and 7.3 (§7.2);
  - the comparison with HR.2.
- **HC.6.** Every acceptance value is computed. A new node gives the inverted-prime, rational and mod-2 examples.

**Deleted.** HC.6/the-comparison-with-the-number-field-case had three faults:
- It misidentified its target: Habiro's ℚ[q]^ℕ is not GSWZ's ring of the rational field, which for Δ = 1 is ℤ[q]^ℕ itself.
- It cited HabiroNumberFields HB.1 (Bloch conventions).
- Correcting the supplier to HB.6 would close the cycle HC.6 → HB.6 → HC.6.

The comparison moves to HB.6 by restructure entry, as RS-10 proposes.

**Packet-level fields.**
- The five requests named consumers and are removed.
- The gaps cited non-existent sections; the two that remain are B's: Theorem 5.2 for non-Noetherian rings, and Theorem 6.2 when Frac R meets the cyclotomic fields.
- The restructure entries now follow the protocol format:
  - the F = ℚ comparison belongs to HB.6;
  - derived-limit corrections belong to HR.2;
  - the q-toolkit has two planned owners (HC.1 by PLAN-HABIRO D11, and QSeries QM.0);
  - the HC.4 stage text lags the accepted PLAN-HABIRO (GSWZ §5.1 is not yet planned);
  - the HC.2 source boundary;
  - two consumer statements: AQT's "limit point" hypothesis asks for Conjecture 6.1, and HB.6 cites `PowerSeries.subst`.

## Mistakes in the sources

There are 18 entries, all with `review.verdict = confirmed`. Six were found by two checkers independently and merged. No erratum was found on the EMS Press page, and arXiv has a single version.

- **Stated results.**
  - **E15:** Corollary 5.1's "in particular" drops connectedness. ℤ[q]^{1,6} ≅ ℤ[[q − 1]] × ℤ[q]^{6} is not a domain.
  - **E16:** Theorem 6.2 lacks the connectedness hypothesis its proof uses. Counterexample: S = {2^k} ∪ {15}.
  - **E14:** Wagner's Lemma 2.1 is false for α = 0. This was already recorded by PLAN-HABIRO and RS-10.
- **Proofs.**
  - **E11:** in Theorem 6.2, the γ step fails for R = ℤ[i].
  - E3: Proposition 6.1 (I^j ⊂ R, and the case I = 0).
  - E4: Remark 7.1 (1 + vΦ_n need not be a unit).
  - E5: Proposition 3.1 needs I finitely generated.
  - E9: Theorem 5.2's transfer of the hypotheses to R[ζ].
  - E10: Theorem 6.1's divisibility at every primitive root.
  - E12: the introduction's reference to §7.4 for σ_ζ.
  - E18: §7.5 for S = ∅.
- **Misprints and slips.**
  - E1, E2 (Proposition 5.1 for Corollary 5.1), E6 (preprint), E17 (σ for ε).
  - E7 and E8: m = n omitted in Lemma 5.1 and in §7.3's ⇔_A.
  - E13: Wagner's exponent (p − 1)p^α for (p − 1)p^{α−1}.

## Lean

`research/blueprint/suggested/HabiroCyclotomicCompletions.lean` was rewritten against the final packet: 1525 lines, importing only individual Mathlib modules. The original stated nothing: 87 of its 95 declarations had type `True`, it had two `def … : Prop := by sorry`, and it contained none of the packet's test names. I elaborated the new file with the Lean toolchain of Mathlib 082e2d3 (v4.34.0-rc2), with `LEAN_PATH` pointing at a prebuilt Mathlib; nothing was built. The result was exit 0 with 230 warnings, all "declaration uses `sorry`".

**Coverage.** A scripted check finds every node id, API item and test of the packet in the file.

**Objects stated concretely:**
- the index monoid as a `Submonoid`;
- the monic and cyclotomic completions as the `R[X]`-subalgebra of compatible families, with the inverse-limit topology induced from discrete quotients;
- the factorial polynomials and the digit recursion by division by X^{n+1} − 1;
- factorial series and the Kontsevich series;
- evaluation through `R[X] ⧸ (Φ_n)`, and the Taylor map into `PowerSeries A`;
- the re-expansion over a p-adically complete ring;
- Habiro's c_{m,n} with adjacency via `IsHausdorff`, and the radical relation with its chain relation;
- the module completion as a submodule of ∏ M[q]/fM[q] (`PolynomialModule`).

**Inputs owned elsewhere.** Tau Ceti's `IsCompleteSeparated` and `CoeffList` are named in comments. Completeness is stated through Mathlib's uniformity. HR.2's derived completion and the bookkeeping interface node are comments.

No statement is `True`, and `sorry` appears only in declaration bodies and proof obligations.

## Questions for the orchestrator

1. **The q-toolkit's owner.** PLAN-HABIRO D11 puts q-integers, q-binomials and the Pochhammer symbols in HC.1, while the QSeries packet plans them in QM.0 and HabiroNahmSeries requests them from HC.1. This should be settled once. The HC packet defines only the polynomial P_N named by its stage text.
2. **HB.6.** Its node HB.6/ring-operations-and-the-classical-comparison should cite the HC node ids in place of the stage HC.6, and perform the F = ℚ comparison. Its node HB.6/the-substitution-exists should use the re-expansion node instead of `PowerSeries.subst`.
3. **The HC.4 stage text** lags the accepted PLAN-HABIRO. GSWZ §5.1, the naive ring H_R, is recorded as remaining.
4. **ArithmeticQuantumTopology QT.4.** "A set with a limit point" asks for Habiro's open Conjecture 6.1, not Theorem 6.1 or 6.2. Its statement should carry Habiro's adjacency condition.

## Summary

The review accepted the packet after correcting it in place: 20 nodes corrected, 28 added and 1 deleted. False statements corrected:
- q needs no "1 ∈ S" to be invertible;
- (q; q)_N is not monic (leading coefficient (−1)^N);
- ι is injective exactly when S ≠ ∅ or R = 0;
- adjacency is reflexive;
- a Taylor test was wrong;
- polynomial module completion is exact;
- non-adjacency does not imply comaximality.

`PowerSeries.subst` cannot build the p-adic re-expansion; `eval₂Hom` does. Habiro's §3, Lemmas 3.1 and 4.2, Theorems 5.1, 6.2 and 7.1, and §§7.2 and 7.5 are decomposed, so the proof of Theorem 4.1 closes. The HC.6 number-field comparison moves to HB.6, and the derived completion stays with HR.2. There are 18 source mistakes, two in stated results of Habiro's paper. The Lean file elaborates with `sorry` as its only warning.
