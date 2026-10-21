# Independent review of revision 5: QSeriesPartitionsAndMockModularForms

**Verdict: accepted, with in-place corrections.** Codex, session `codex-dLlf3q`, reviewed [issue #11526](https://github.com/CBirkbeck/tauceti-explorer/issues/11526). This session wrote none of the blueprint revisions. The reviewed fifth revision is Claude's `claude-NX1bCW`, [#11524](https://github.com/CBirkbeck/tauceti-explorer/issues/11524), merged in `d040d951145c8d4729cadcb19b4bfcd2f5934cd9`.

The input checkout was `7328be79fe1fedf2cbbcd0fad34f98a8adba3fd4`; the input packet SHA-256 was `6b85b0b650efe63bdd05efa396b92b1dd6f99eb9bc16586cc96f3d99e3374e97`. The comparison base is the accepted revision-4 review, `1ebf966d4`. This is a delta review: all eight changed node records were independently checked, while the 529 unchanged records retain the prior reviews' evidence and verdicts. The old revision-4 review object is preserved in `reviewHistory`. This report does not claim a fresh reading of the unchanged contracts' sources or all inherited baseline declarations.

WORKERS.md, the blueprint protocol, the expansion protocol and UPSTREAM_GUIDE.md were read. The reviewed library audit was consulted. The current read-only upstream checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The ModularForms and IntegralLattices introductions and ownership boundaries were read alongside their relevant supplier statements. These current contracts remain separate from the historical Mathlib `082e2d37` and Tau Ceti `f7904748` baseline.

| Checked item | Result |
| --- | --- |
| Changed node records | Eight: six verified, two corrected; details below. |
| API and tests | Every changed definition/construction API and test read: 39 API items and 24 tests across five records, including their unchanged clauses and consumer requirements. The three theorem records' acceptance checks were also read. |
| Baseline | The added `Complex.Gamma_ne_zero` statement was read at pinned `Beta.lean:427`, including its exclusion of nonpositive integers. The two removed records have no remaining consumer; the other 418 records retain prior review evidence. |
| Requests | All 30 request statements are unchanged. The three changed Habiro supplier annotations were compared with the actual upstream contracts. |
| Upstream imports | C7, the Gamma supplier and Habiro compared at their recorded PR heads; no open roadmap target is asserted to be implemented. |
| Source findings | E633–E637 confirmed at their printed locators; 95 confirmed and three rejected findings in total. Earlier verdicts retained. |
| Structure | 537 nodes, 781 API items, 519 tests, 42 planets, 419 baseline records, 30 requests and one explicit gap. No nodes added; no layer closed. |

## Mathematical checks and corrections

**Seventh-order functions and identities.** The Eulerian definitions in `QM.4/seventh-order-mock-theta-functions` agree with Hickerson's definitions (0.5)–(0.7), printed pp.661–662. The zero constant term of F₁, its sum starting at one, and the n=0 contributions to F₀ and F₂ were checked separately. Formal coefficientwise finiteness and compact-subdisc analytic convergence use the quadratic numerator orders and the positive lower bound for the product of `1−r^k`, with `r<1`. The vector's fractional powers use e(rτ), as required by Zwegers §4.3, p.67.

For `QM.4/seventh-order-indefinite-theta-identities`, the inversion formula, auxiliary polynomials, three Bailey pairs and corrected Hecke-type expansions were compared with Andrews (2.7), p.115, Lemmas10–12, pp.128–132, and Theorem13, pp.132–133. Substitution into the k=1 Bailey limit yields the stated three expansions. Hickerson's Theorem2.0 and proof, pp.666–667, give the cone reindexing and the corrected expansions. The characteristic shifts, signs and phases in Zwegers §4.3, p.67, were checked directly using `B(ν,c₁)=7ν₁` and `B(ν,c₂)=−7ν₂`. The positive quadratic growth on each cone justifies the analytic rearrangements.

Two boundary details were corrected in place:

- The expression defining V_n and its three recurrence identities require n≥1. W₀=1 is now stated separately, with no V₀ or negative-index U used.
- Bailey inversion now treats the coefficient of β₀ separately. The matrix identity is first established over ℤ[A]⟦q⟧; the general unit-pair expression cancels `(A;q)_r/(1−A)` before specialization. For j≥1, `1−Aq^{2j}` is a q-adic unit and cancels the prefactor legitimately. Continuous substitution A↦a then includes a=1 over arbitrary commutative coefficient rings. The earlier description could have cancelled 1−a after setting a=1 and used a negative-index Pochhammer factor at j=0.

The Hickerson proof locator now includes p.667. The key inputs still occupy one large node because this packet already exceeds the node budget; QM.4's remaining list now explicitly requests the inversion, polynomial recurrence, Bailey-pair, Hecke-expansion and cone-comparison target split. Their mathematical routes are recorded; this is a granularity refinement.

**Gamma estimate.** `QM.5/gamma-vertical-decay` consumes ZerosOfLFunctions Layer1, items1–3, at PR[#253](https://github.com/TauCetiProject/TauCetiRoadmap/pull/253), head `cce2e04188a559be9a16037d0d65e00a815fcecc`. Its additive log-norm estimate is uniform on compact real strips. Exponentiating an error bounded by C/|t| gives the claimed relative error using the mean-value bound for the real exponential. Gamma continuity and nonvanishing handle the remaining compact range with |t|≥1. Pinned `Gamma_ne_zero` applies because the imaginary part is nonzero. The stronger relative estimate is a local adapter; the Stirling remainder is imported.

The supplier table in AnalyticNumberTheoryPartI ([#1126](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1126), `23d3de1c`) and PartII §4.3b ([#1167](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1167), `abee65e6`) were also read. The latter supplies the weaker two-sided estimate and balanced Gamma quotients; it does not replace the stronger relative-error contract.

**Vertex and lattice comparisons.** The four changed QM.6 records were compared with C7's README and relevant `Suggested.lean` declarations at AffineLieAlgebras PR[#1201](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1201), head `1b96abb516967c63e48631d99d70876e1bdce2f1`:

- `vertex-algebra`: the coefficient convention is Mathlib's `ncoeff n`, which extracts exponent −n−1. The Borcherds and creation identities give the translation/locality structure needed for C7's complex `FormalVertexAxioms`; its converse retains all hypotheses. The arbitrary commutative-ring contract is a required extension.
- `vertex-algebra-existence-theorem`: the creative, pairwise-local, translation-covariant generating fields have the stated reconstruction and uniqueness over a characteristic-zero field. The field generality is required by the real framed model; C7 is the complex specialization.
- `even-lattice-double-cover`: let d_i=B_ii/2. The proposed exponent of f is `Q(α)+Σd_i binom(α_i,2)`. Its polarization is `B(α,β)+Σd_iα_iβ_i`, exactly the difference between the two ordered cocycles modulo two. This calculation is valid for negative integral coordinates as well. It proves the stated sign coboundary and the A₁ normalization.
- `lattice-vertex-algebra`: the basis rescaling by f intertwines twisted multiplication and charge fields, and hence the Heisenberg action, translation and, when defined, conformal structures. C7 owns the positive-definite complex VOA. The characteristic-zero field and arbitrary-signature extension remains local for the real model and II₁,₁; the positive case is compared rather than planned again.

Mathlib's VertexOperator coefficient API, the PowerSeries unit and coefficientwise-topology statements and Tannery's summable-majorant theorem were read at the pin for the changed proof routes. The current Tau Ceti lattice carrier was read and the relevant library areas searched; no new replacement carrier or upstream file was written.

**Fifth order and Habiro.** The eight definitions in `QM.4/fifth-order-mock-theta-functions` match Zwegers §4.4's corrected displays on printed pp.72–73, and Andrews Theorem9, pp.124–127, after the two recorded corrections. The locator incorrectly said pp.71–72 and is fixed. Agreement with the Eulerian series does not discharge the gap: the one-parameter Bailey lemma, limiting Watson transformation and limiting Sears transformation still need their own target contracts. QM.0's remaining text no longer incorrectly places their generic rational expressions in ℤ[a,b][q,q⁻¹]; it now requires the appropriate localized identities, explicit invertibility hypotheses, cancellation before singular specialization and justified q-adic limits.

HabiroCyclotomicCompletions PR[#1314](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1314), head `bf8812fbc41f0e74dca5b0ed5ae5a87c936707b4`, supplies the completion/convergence contract in §§1.4 and2.1, root evaluation and Taylor maps in §3.1, naturality in §3.2, and uniqueness in §4.4. The HC.3 locator omitted §3.2, which is needed for Galois compatibility; it is now included in the packet and reader.

## Source findings and independent diagnostics

All findings were checked on the publisher scan of Andrews, *The fifth and seventh order mock theta functions*, Trans. AMS293 (1986), pp.113–134, [PDF](https://www.ams.org/journals/tran/1986-293-01/S0002-9947-1986-0814916-2/S0002-9947-1986-0814916-2.pdf). Its SHA-256 is `5d91d479a67b8a5e1c10121e8619111592bf5bad238c9f8b736e120c71388998`, matching the packet. Hickerson was read through the [GDZ journal scan](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0094), printed pp.661,662,665–667; the packet's p.666 image hash matches, and p.667 provenance was added. Zwegers was read in [arXiv:0807.4834v1](https://arxiv.org/pdf/0807.4834v1), SHA-256 `ca2b841ad716a16eb380893e6686f67f65e5506a9375de7a3c8f96ec58e8280d`, also matching. Only the relevant passages are claimed as independently checked, not a full collation of these papers.

| Finding | Verdict and distinguishing witness |
| --- | --- |
| E633, Andrews (7.22), p.132 | Confirmed. The printed right side has q coefficient −2, while the Eulerian product has 0. The correction follows from the odd Bailey coefficients and appears in Hickerson (2.3), p.666. |
| E634, Andrews (7.24) and proof, p.133 | Confirmed. The printed q² coefficient is −2 rather than0. The a=q pair gives the corrected formula, also Hickerson (2.5), p.666. The proof must cite (7.20)–(7.21). |
| E635, Andrews (3.1), p.116 | Confirmed. On the unit Bailey pair the weighted alpha sum is Euler's product P and the beta sum is1. The printed multiplier P would give P²; the required factor is 1/P. The later proofs already use the reciprocal. No exhaustive priority claim is inferred from the recorded search. |
| E636, Andrews (6.3), p.125 | Confirmed. The printed q² coefficient is1 instead of0. The boundary term on p.127 has the wrong exponent; (5.10)'s derivation on p.123 and Zwegers pp.72–73 determine the correction. |
| E637, Andrews (6.8), p.125 | Confirmed. The printed constant term is1 while φ₁ has constant term0. The overall q and corrected minus factor agree with Zwegers' eighth identity, pp.72–73. |

Independent scratch computations used exact truncated integer power series modulo q²²⁰. All three seventh-order Eulerian products agree with both the corrected Theorem13 expressions and Hickerson's cones through degree219. All eight corrected fifth-order formulas agree with their Eulerian forms through degree219. The printed variants fail at the coefficients above. No finite calculation is used as a proof of an identity.

At q=2/5, exact rational computations checked U_n against its closed forms for n<25, V_n/W_n for 1≤n≤12, the three Bailey relations for 0≤n≤8, and generic inversion for a=1,q,2/3. Independently generated even symmetric integral Gram matrices, ranks1–5 and signed coordinates from −4 to4, satisfied the C7 coboundary identity in 2,500 trials with seed11526. The algebraic polarization calculation, not those trials, proves the comparison.

## Validation and remaining boundary

- `check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**.
- `check_sorry_data.py`: passes; no admitted data definitions.
- Source-issue and source-version validators: **0 errors**. Invoking the errata-only command on this blueprint additionally reports its expected file-type mismatch, `protocol must be errata-v1`; the packet correctly remains `blueprint-v1`.
- `lean-check research/blueprint/suggested/QSeriesPartitionsAndMockModularForms.lean`: **exit0**, exactly ten `declaration uses sorry` warnings and no other diagnostics. Seven light definitions and thirteen proved examples remain; the new seventh-order signature has the correct integer cone exponent and signs. The suggested file needed no edit in this review.
- Reader agreement: all537 statements, hypotheses, proof steps, acceptance clauses, relevant API/test fields and source locators were checked as literal packet text (5,866 fields); all30 request needs and every coverage remaining item agree.
- `git diff --check`: passes.

Acceptance is under the protocol's budgeted complete-packet rule, not a claim of closure. The fifth-order identification is the one remaining mathematical gap. QM.4 is planned with that gap; the other six layers are partial, each with its precise remaining list. The new seventh-order target split and inherited moonshine split remain refinements. No planet or scope was broadened, and no library implementation is claimed. No restricted source was used, and no suspicious instructions were found in the fetched data.
