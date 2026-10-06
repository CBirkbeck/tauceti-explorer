# Independent review: HabiroNahmSeries HB.5

**Verdict: accepted as a complete planning pass, with HB.5 planned and one explicit HB.4 supplier obligation.** This does not certify the missing coefficient-descent proof or any implementation.

Reviewer: Codex, session `codex-ZQU6du`, job `REV-HabiroNahmSeries--HB.5`, issue #6460, 6 October 2026. The original pass was written by session `codex-i4fN7u`; this reviewer did not write it. The binding worker, blueprint, expansion and upstream protocols were read. The nearby upstream documents [Fuchsian orbifolds](../../../content/tau-ceti/FuchsianOrbifolds/README.md) and [Arithmetic Dirichlet series](../../../content/tau-ceti/ArithmeticDirichletSeries/README.md) were read for cusp conventions, growth hypotheses, supplier boundaries and library-facing scope.

The reviewed files are the [packet](../packets/HabiroNahmSeries--HB.5.json) and [suggested file](../suggested/HabiroNahmSeries--HB.5.lean). The original [reader](../readmes/HabiroNahmSeries--HB.5.md), accepted parent, supplier packets and library audit were also read. The reader is outside this review issue’s authorized edit paths; the assembly instructions below identify its required updates.

| Item | Result |
| --- | --- |
| Nodes | 7: one construction, four theorems, two comparisons |
| Node verdicts | 3 verified, 4 corrected; none added or unverifiable |
| Baseline declarations | All 8 confirmed; none removed or replaced |
| Construction API and tests | All 8 API items and 4 tests checked; none added |
| Planets | 2 new and 2 inherited; within the six-per-layer limit |
| Source findings | All 7 independently re-reviewed; no duplicate errata IDs |
| Closure status | One precise gap/request to HB.4; no stage marked closed |
| Packet checker | 0 errors, 0 warnings |
| Lean elaboration | Exit 0; exactly 17 warnings, all for `sorry` |

The stage has a target-level plan for each scoped endpoint. Its `complete` packet status records a finished pass, while `planned` coverage and `remaining` record the outstanding proof obligation. The protocol explicitly permits acceptance on this basis.

## Public sources and collation

The PDF versions and SHA-256 hashes in the packet were verified against the downloaded bytes. Relevant passages were checked in extracted text and, where typography mattered, rendered pages.

| Source | Checked passages |
| --- | --- |
| [CGZ arXiv v3](https://arxiv.org/pdf/1712.04887v3) | Theorem 1.2/Remark 1.4; Lemma 2.4(b); Proposition 2.5/Remark 2.6; Theorem 7.1/Corollary 7.2; Theorem 7.5 and proof |
| [CGZ version of record](https://math.uchicago.edu/~fcale/papers/CGZ.pdf) | Independently obtained complete author-hosted published PDF; corresponding passages, including Theorem 7.1 (45)–(46), p. 419, and the Theorem 7.5 proof (55), p. 423 |
| [Published GZ](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf) | Definitions and Theorem 3.1, pp. 221–224; residue grouping, pp. 225–228; valuation formulas and Proposition 7.1, pp. 233–234 |
| [Zagier’s published chapter](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | II.3B, (28), p. 46 and (29), p. 48; II.3C, general-rank leading coefficient on p. 55, continued on p. 56 |

The published CGZ paper was missing from the original pass. Its complete copy is now recorded as `cgz-published`, with hash `8003ee09bfec725127f4b5c2058c5516834a91a160d9c4428d962b1e5a1f0212`. Original v3 source IDs and locators are retained; published locators are added explicitly. Title-and-erratum searches did not locate a separate correction. This is a record of the searches, not a claim that no correction exists elsewhere.

The seven nodes’ source excerpts and locators were checked. Adapted arguments are labeled as adaptations: the positive majorant, unrestricted root bound and fixed-field regulator descent are not presented as literal statements in the papers. The general-rank Zagier locator was corrected from p. 56 alone to pp. 55–56. The inherited GZ findings now use published equation numbers rather than attaching preprint locators to the published source ID.

## Node-by-node checks

| Node in `HabiroNahmSeries:HB.5` | Verdict and evidence |
| --- | --- |
| `residue-class-majorant` | **Verified.** Coordinatewise division gives `n=mℓ+s`; symmetry gives the stated quadratic split with unchanged A, shifted B `(As+B)/m`, zero shifted constant, and the retained factor `exp(-tQ(s))`. Finite regrouping of convergent positive Nahm series proves summability and positivity. |
| `block-product-lower-bound` | **Verified.** Nontrivial-root logarithmic derivatives are bounded on `[0,1]`. Within block k the radius difference is at most `mt exp(-mkt)`; the total loss is bounded by a constant times `t/(1-exp(-mt))`, uniformly for `0<t≤1`. The root with index m has matching radius and contributes no loss. Remaining nontrivial factors have a positive uniform lower bound. The cyclotomic product supplies the factor at `exp(-m²t)`. For m=1 and m=2, the stated constant 1 is valid. |
| `growth-at-all-roots-of-unity` | **Corrected locator; argument verified.** The block estimate and norm-of-sum inequality give the exact majorization. Every shifted sum has the same A and hence the same rate; the finite positive constants give `O(exp(Λ/(m²t)))`. This upper bound requires neither odd/coprime order nor a nonvanishing root constant. It does not extend the full restricted asymptotic-series theorem. |
| `unrestricted-cusp-valuation-bound` | **Verified.** For a reduced finite cusp `a/c`, the transformed height is `2π/(c²t)`. With valuation normalized as Laurent order divided by width, comparison gives `v_P≥-Λ/(4π²)`. The positive-axis rate gives equality at zero. A positive lower-unipotent power in Γ moves infinity to a finite cusp. Positive definiteness makes Q coercive, so its lattice minimum exists; positive denominator coefficients prevent cancellation of its leading term. Thus `v_∞=min Q(n)` and `C≥C_0`. |
| `fixed-extension-constant-term-lift` | **Corrected normalization; verified conditionally.** Symmetry cancels the integral exterior boundary after adjoining fixed coordinate radicals. The Kummer-lift identification follows from the imported inverse-P class and eigenspace inputs. Added `24|D` and explicit series rescaling; the missing HB.4 proof is still a gap, not inferred from this argument. |
| `bounded-powers-with-the-actual-multiplier` | **Corrected normalization and prerequisites.** Direct matrix algebra verifies ε and the negative phase. The finite Laurent principal part provides complex uniformity. The comparison retains ω and the q^C factor. The stated powers of K and ω lie in F; the elementary Dedekind-sum denominator calculation gives `μ_b^24∈Q(ζ_d)`. Clearing the B, C and λ denominators gives one s independent of d. The old parent fixed-phase comparison is no longer a proof prerequisite. |
| `rational-bloch-arithmetic-bridge` | **Corrected dependency; verified conditionally.** All reductions modulo n use the integral η_E over one fixed E. The parent CGZ/Suslin torsion criterion avoids assuming finite generation of the CGZ convention. Embeddings extend from F to E, and regulator functoriality gives rational descent. The unipotent matrices produce unbounded good orders. Replaced the downstream introductory endpoint with the lower HB.3 algebraically closed target statement. |

The rank-one valuation checks distinguish cusp width from unnormalized Laurent order. For `A=2,B=-3,C=5`, the analytic minimum is 3 at n=1 and n=2, with leading coefficient 2; this is not asserted to be a modular datum. The plan does not adopt an unsupported equivalence between `v_∞=C` and `B=0`.

## Multiplier correction and the exact open obligation

Published GZ (17) uses

\[
\nu_a=e\!\left(\frac{r(n-1)(n-2)a}{24n}\right).
\]

The parent displays its Gauss/product/S expression unchanged while replacing this multiplier by `μ_a=e(r s(a,n)/2)`. The scalars differ in general. The corrected follow-up defines

\[
\Phi_{\mathrm{Ded}}=(\nu_a/\mu_a)\Phi_{\mathrm{GZ}}.
\]

The denominator calculation gives `12n s(a,n)∈ℤ`, so the ratio has order dividing 24n. Choosing a fixed strong denominator D divisible by 24 puts the ratio in `E_n`. Its n-th power is then an n-th power of an `E_n` element and changes no Kummer class. Coefficient descent and the eigenspace property, if established for one normalization, survive this rescaling. Keeping ν throughout would also give the same bounded-power argument.

This repairs the normalization without inventing a proof of HB.4. The one gap/request now asks the existing owner for three precise constant-term inputs in this convention: membership `u^n∈E_n`, inverse-P identity in the Kummer extension, and the `χ^{-1}` eigenspace. It includes rational B, the Gauss factor, root-change cancellation and the rescaling. Conjugating ζ to ζ^c alone does not prove the required power law. The arithmetic branch is explicitly conditional; the positive majorant and all-cusp valuation branch are independent of this obligation.

## Baseline, closure and ownership

Every declaration below was read in its module at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Independent checks were added to the packet.

| Declaration | Module and applicable content |
| --- | --- |
| `Matrix.PosDef` | `LinearAlgebra/Matrix/PosDef.lean`: Hermitian condition and strict positivity of the quadratic form; rational specialization supplies symmetry. |
| `Finset.prod_range_succ` | `Algebra/BigOperators/Group/Finset/Basic.lean`: commutative-monoid finite-product successor identity. |
| `Nat.residueClassesEquiv` | `Data/ZMod/Basic.lean`: nonzero-modulus equivalence with `ZMod m × ℕ`, inverse `s.val+mℓ`; finite remainder representatives give the specified indexing. |
| `norm_tsum_le_tsum_norm` | `Analysis/Normed/Group/InfiniteSum.lean`: summability of norms gives the required norm bound. |
| `norm_image_sub_le_of_norm_deriv_le_segment` | `Analysis/Calculus/MeanValue.lean`: differentiability and bounded derivative on the real interval give the logarithmic-loss estimate. |
| `tsum_geometric_of_lt_one` | `Analysis/SpecificLimits/Basic.lean`: requires `0≤r<1`, satisfied by the exponential ratio. |
| `X_pow_sub_C_eq_prod` | `FieldTheory/KummerExtension.lean`: primitive root, positive order and a chosen root factor the polynomial; specialization and evaluation give the cyclotomic finite product. |
| `IsAlgClosed.surjective_domRestrict_of_isAlgebraic` | `FieldTheory/IsAlgClosed/Basic.lean`: restriction of algebraic embeddings is surjective in an algebraic tower with algebraically closed target. |

Tau Ceti source inspection used the recorded commit `f790474821cf4256814db967cb154e7af3d0c369`, rather than assuming the shared checkout’s current HEAD equals that pin. The scoped source searches agree with the reviewed audit: the required Nahm, Bloch and cyclic-dilogarithm objects are not implemented. The Mathlib q-Pochhammer match is a TODO for the multiplicative q-version, not the additive Pochhammer implementation needed here.

The audit’s HB.5 entry is not built; HB.4 and HB.5a distinguish existing generic machinery from the missing specialized expansions and modular-function carriers. The plan reuses generic products, positivity, calculus, infinite sums and embedding extension. It imports the q-Pochhammer object from QM.0, the Dedekind sum from QM.1, Kummer maps from HabiroNumberFields, Bloch/regulator constructions from the parent and K3BlochGroups, and cusp interfaces from HB.5a. No duplicate owner, new foundational carrier or new roadmap is introduced.

The relevant direct supplier statements were read, including the parent positive-axis expansion, cusp meromorphy and radial-width formula, rational Bloch construction, regulator criterion, CGZ/Suslin torsion criterion and excluded-order statements. The replacement HB.3 target prerequisite is used only for torsion mapping to zero; its inherited assertion that the CGZ group is finitely generated is not used. The arithmetic bridge instead uses the explicit HB.5 Suslin comparison.

The checker resolves every direct prerequisite. An additional traversal of the packet catalog, choosing canonical parent nodes and then this follow-up’s nodes, reached 383 nodes without a dependency cycle. External requested stages remain supplier boundaries; this traversal is not a claim to have independently reviewed every transitive supplier proof.

## API, tests, prototype and planets

The real-valued construction needs evaluation, summability, positivity, the reindexing relation, base cases and compatibility with the existing positive series. The eight API items provide these. An additional functor or universal-property API would not describe this scalar-valued construction and was not invented.

The four mathematical tests were checked independently of their `sorry` prototypes:

- The even-order rank-one case retains base `exp(-4t)` and both shifts `1/2,3/2`, with constants `11/60,131/60`.
- Empty rank with C=7 at `t=log 2` gives `2^-7=1/128`.
- m=1 agrees exactly with the original positive-axis series.
- Increasing C by 1 multiplies the majorant by `exp(-t)`.

Together they catch replacing m² by m, dropping the residue shift, dropping q^C or mishandling empty products. The prototype has the construction, all eight API signatures, all four examples, the finite-product estimates and a literal complex-series norm inequality. Its statements requiring absent Rogers, cusp, Bloch or expansion carriers remain precisely described in comments rather than fabricated as arbitrary proposition fields. The correction updates those comments to specify the multiplier rescaling and lower target dependency.

The two new planets, “Radial asymptotics of Nahm sums” and “Cusp valuation bound”, are central results, not auxiliary bookkeeping. With the inherited conjecture and modularity/torsion endpoint the layer has four planets. Target-level granularity is appropriate; no proof lemma was promoted merely to enlarge the graph.

## Re-review of source findings

Each finding now has a review by `REV-HabiroNahmSeries--HB.5`; its previous review is preserved as `priorReview`.

| Finding | Independent verdict |
| --- | --- |
| E14 | **Confirmed with narrowed justification.** Oddness and the rational-data coefficient field/normalization need explicit treatment. Removed the assertion that a failed numerical `algdep` search proves nonalgebraicity; distinguished source multiplier rescaling from Gauss-field descent. The exact example Gauss value is `(2+ζ_3)/3`. The finding is not an independently proved numerical nonmembership claim. |
| E19 | **Confirmed.** The reciprocal-ε calculation gives the negative phase; both read CGZ versions print the positive phase. |
| E20 | **Confirmed.** The comparison drops ω and the q^C contribution present in the expansions being compared. |
| E21 | **Confirmed as missing justification.** A real radial formula is used at complex ε; the modular Laurent expansion supplies the uniformity. |
| E22 | **Confirmed as missing justification.** Translation invariance alone does not exclude an essential cusp singularity; the Nahm growth bound is needed. Removed the unnecessary unverified approximation-theorem claim. |
| E23 | **Confirmed.** The negative GZ Rogers convention makes the printed sign in published (50) inconsistent with the rate. The corrected constant is `-Λ/(4π²)`. |
| E24 | **Confirmed.** Published Proposition 7.1 invokes a theorem restricted to odd coprime orders to claim every cusp; the unrestricted majorant supplies the missing argument. |

These inherited records were corrected in place, with published collation and own verdicts. No new errata identifier is needed for the normalization clarification within E14 and the existing HB.4 obligation.

## Validation and instructions for assembly

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.5.json` reports **0 errors and 0 warnings**. `lean-check` on the suggested file exits **0**, with **17 `sorry` warnings and no other warnings**. Available memory was checked before compiling. The shared check uses the exact pinned Mathlib; the suggested file imports only Mathlib, so elaboration does not rely on unpinned Tau Ceti modules. This checks signatures, not the mathematical proofs left as `sorry`.

There is no unanswered question blocking this review. The next HB.4/assembly worker must carry forward the revised request and, in its authorized reader/parent edits:

1. Require `24|D` for the chosen fixed extension and state the explicit `Φ_Ded=(ν_a/μ_a)Φ_GZ` normalization.
2. Treat the introductory endpoint as a consequence and cite the lower torsion-free target result for the last step.
3. Replace the reader’s “published Section 7 was not obtained” statement with the obtained public version and its locators; use the published GZ numbering and Zagier pp. 55–56.
4. Retain the open HB.4 proof obligation and reject the old numerical nonalgebraicity justification.

All changes are confined to the issue’s packet, suggested file, this report and the required handoff note. No promotion, endpoint implementation or second job is part of this submission.
