# REV-AdditiveCombinatorics

Refs #545. Independent review by **Codex, codex-A7zu36**, 11 October 2026.
The reviewed blueprint was submitted by codex-3CsULk; this session contributed
none of its input. The bot confirmed the claim before review began.

## Verdict and scope

**Accepted as a complete target-level planning pass.** All 100 node verdicts
are recorded in the packet: **73 verified, 27 corrected, 0 added, 0
unverifiable**. All 51 baseline entries were checked against actual declarations
at the two pinned commits. No unresolved contradiction remains in the stated
targets. Acceptance does not certify the unfinished proofs or the omitted
prototype conditions.

All six stages remain **planned**, with precise `remaining` lists; none is
closed. The eight proof/supplier gaps and fourteen supplier requests are
retained. This is the meaning of `complete` and `planned` in PROTOCOL §0:
prerequisite chains may end in an explicit request or recorded gap. It is not a
claim that the mathematics has been formalized or that a gap-free upstream
package is ready.

The binding deliverables of the live issue name the packet, suggested file and
this report. The existing reader was inspected but is outside that list. Its
necessary synchronization is specified below and in the handoff. No atlas,
downstream packet or upstream roadmap was changed.

| Stage | Nodes | API items | Planned tests | Planets | Coverage |
| --- | ---: | ---: | ---: | ---: | --- |
| AC.0 | 10 | 36 | 14 | 5 | planned |
| AC.1 | 31 | 68 | 28 | 6 | planned |
| AC.2 | 11 | 25 | 12 | 4 | planned |
| AC.3 | 19 | 88 | 41 | 4 | planned |
| AC.4 | 15 | 38 | 20 | 6 | planned |
| AC.5 | 14 | 31 | 16 | 6 | planned |
| Total | 100 | 286 | 131 | 31 | 0 closed |

The node kinds are 27 definitions, 4 constructions, 56 theorems and 13 lemmas.
Every definition/construction has an API and at least three discriminating
tests. The 131 tests are planned statements and suggested examples, not 131
proved regression tests. The planets name mathematical objects and milestones.

## Corrections made in place

The following table accounts for all 27 corrected node verdicts. Smaller proof
steps stay inside their targets, as required by target-level granularity.

| Nodes | Correction and evidence |
| --- | --- |
| AC.0/fourier-transform | Replace the real point-mass reflection example by an imaginary point mass on `ZMod 4`. At the standard character the conjugate-reflection transform is 1/4; plain reflection gives −1/4. Add existing finite character-column orthogonality and Haar/counting comparison prerequisites. |
| AC.0/fourier-parseval | Add the existing Tau Ceti Peter–Weyl norm-square theorem as a comparison ingredient. Its one-dimensional coefficient identification and probability/counting conversion remain explicit adapter obligations. |
| AC.1/tau-functional, first-estimate, second-estimate, endgame-lemma, tau-decrement | Make the two reference distributions probability measures. The suggested minimizer-existence, conditional comparison, estimates and decrement interfaces now carry both probability assumptions. The bare functional can still be defined for arbitrary measures. GGMT accepted manuscript §§3–7, pp. 10–25, supplies the probability-law setting. |
| AC.1/balog-szemeredi-gowers | Replace the incorrect theorem labels by Tao Notes 3, Theorem 1.1, pp. 3–6, and quantitative Theorem 2.2, p. 7; physical compilation pp. 53–57. |
| AC.1/freiman-torsion-free | Remove a duplicate properization prerequisite. Keep the torsion-free hypothesis and proper-progression conclusion. |
| AC.3/gowers-inner-product-and-uniformity-norm | Require positive order for complex scalar homogeneity. Order zero is the real part of the average and does not satisfy that formula. Add the test that the constant 3i has U¹-norm 3. |
| AC.3/polynomial-sequence-calculus | Locate integer-binomial Taylor calculus at LSS inverse §2.3, Lemma 2.12 and proof, pp. 8–9. The deeper equivalence and coordinate contracts remain a gap. |
| AC.3/rational-malcev-basis | Correct the locator to LSS inverse Definitions 3.1–3.5, pp. 11–12. Do not silently fill the prototype's omitted Lie-ideal and global coordinate conditions. |
| AC.3/malcev-metric-nilsequence, efficient-equidistribution; AC.5/mobius-equidistributed | Add an explicit finite nonnegative Lipschitz constant for the quotient metric. A real-valued infimum over an empty set can be zero, so the previous norm inequality alone admitted bounded non-Lipschitz observables. Add a failure-witness test and a corresponding suggested example. The norm bound is meaningful on bounded observables with finite Lipschitz constant. |
| AC.2/uniform-factor-approximation | Restore the sufficiently-large-N hypothesis in LSS Szemerédi Lemma 3.8, pp. 9–10. The enlarged constant and truncated-log convention give the stated exp(C log*(1/η)^C) threshold. Add it to the Lean signature. |
| AC.2/progression-density-increment | Regularize by shifting the factor at a fixed resolution, using LSS Fact 3.6, p. 9. Account for the factor-approximation size threshold in the large-N branch of Lemma 3.7. |
| AC.4/ap-linear-forms-condition | Correct CFZ's locator to Definition 4.2, p. 8. |
| AC.4/cut-discrepancy | Correct CFZ's locator to equations (8)–(9), pp. 9–10, and Lemma 5.2, p. 10. |
| AC.4/dense-model | Correct CFZ's locator to Theorem 5.1 and proof, pp. 9–11. |
| AC.4/relative-counting | Use CFZ Theorem 6.5, p. 15, and general discussion pp. 15–16. Theorem 6.2, pp. 12–15, is the triangle case. The general proof acquisition gap stays open. |
| AC.4/linear-forms-relative-szemeredi | Use CFZ Theorem 4.3, p. 8, and its §7 deduction, pp. 16–17. |
| AC.4/smooth-sieve-majorant | Use CFZ Proposition 8.1, p. 17, Definition 8.2, p. 18, and Proposition 8.4, pp. 19–20. |
| AC.4/smooth-majorant-linear-forms | Use CFZ Proposition 8.4, pp. 19–20. On bad boxes expand the product of 1 plus each squared weight into the already supplied distinct-form subproducts. Do not assume unrequested higher moments with repeated forms. |
| AC.5/number-field-prime-uniformity | Correct the signs in Kai's preliminary conductor and Fourier reductions, §9.4, p. 40; see E16–E17. The ideal Type I/II gap remains. |
| AC.5/localized-prime-uniformity | Correct the S-unit error sign and use one ambient enlarged box consistently when converting normalized Gowers norms; Kai Appendix E, pp. 79–81, E19–E20. |
| AC.5/localized-prime-patterns | Correct the boundary-extension locator to Kai Remark D.12, p. 78. Keep Theorem 13.1, pp. 56–57, and the complete Appendix E deduction, pp. 78–83. |

Other edits correct the ES.0 recurrence request to LSS Szemerédi **Proposition
2.2**, the source edition dates, the GGMT accepted-manuscript access record,
baseline metadata, E14's theorem locator and the source-finding reviews. The
suggested-file header now identifies the corrected packet/report contracts and
the reader synchronization still needed. No target node was added or removed.

## Baseline and duplication audit

The pinned commits are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All 48 inherited entries exist after
the module correction below, and their actual types support their stated
uses. Three existing comparison ingredients were added, giving **51 confirmed
entries; none removed**.

| Entries | What was checked |
| --- | --- |
| 1–10 | Native cyclic groups, finite expectation, additive characters and character basis, weighted inner product, cyclic DFT, both convolution conventions and Haar probability. Counting versus probability normalization, conjugation of the first inner-product argument and dual indexing are explicit. |
| 11–21 | Energy counts and inequalities, sumset cardinalities, Plünnecke–Ruzsa and covering. The generated additive companions of the cited multiplicative declarations are read and used; the existing theory is imported. |
| 22–29 | Finite entropy summands/concavity, conditional measures, independence, uniform laws, pushforward/product measures and Freiman isomorphisms. General conditional-distribution identities remain planned targets. |
| 30–38 | Native nilpotency, Lie groups, simple connectivity and invariant derivations; finite partitions; qualitative Roth and Behrend; quiver data. A quiver does not supply directed removal. Qualitative Roth does not supply Rahman's numerical threshold. |
| 39–48 | Möbius, totient, the zeta pole estimate, affine/linear algebra, von Mangoldt, number-field integers and fractional-ideal bases, and absolute ideal norm. The pole estimate gives no zero-free region. Absolute norm is used under its Dedekind-domain and infinite-ring assumptions. |
| 49 | `CommGroup.sum_monoidHom_apply_eq_ite`, TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104. Finite commutative group, domain codomain with enough roots of the group exponent; the sum over unit-valued monoid characters is the character-column identity. Additive/multiplicative and unit/complex conversion are required; it does not identify the dual with the original group. |
| 50 | `TauCeti.haarProb_eq_smul_count`, TauCeti/RepresentationTheory/Compact/Finite.lean:212. Finite discrete Borel group; Haar probability is inverse cardinality times counting measure. |
| 51 | `TauCeti.hasSum_norm_sq_peterWeylCoeff`, TauCeti/RepresentationTheory/Compact/PeterWeyl.lean:599. Compact topological Borel group, algebraically closed RCLike field and an irreducible skeleton; squared coefficient norms sum to the squared L² norm. The finite abelian specialization needs its one-dimensional comparison. |

`Behrend.roth_lower_bound` is in
**Mathlib/Combinatorics/Additive/AP/Three/Behrend.lean:481**; the inherited module
omitted `Additive`. `Ideal.absNorm` metadata now states its hypotheses and its
monoid-with-zero-hom codomain. `ZMod` metadata now describes cyclic
specializations rather than claiming that every interval, box or lattice is a
cyclic quotient.

The accepted library audit for all six layers was read. Its existing energy,
sumset, qualitative Roth, character-basis and cyclic-transform material is
consumed rather than replanned. The two elementary missing upper energy bounds
are still legitimate targets. Current read-only TauCetiRoadmap main
`070dc2becd74419e76303ede84b465ed4a69461f` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also screened, including the nine
roadmaps absent from the atlas snapshot and the four named Completed roadmaps.
IntegralLattices' reduced-Gram work does not replace the needed successive-minima
bound. The current entropy development does not supply the finite entropic
Ruzsa/Marton chain. LieGroups and CompactGroups were read as upstream examples.
No build command was run in either read-only checkout.

## Sources and independently checked source findings

All sixteen primary public PDFs were retrieved and their hashes matched the
packet. The Oxford accepted GGMT manuscript was retrieved, hash-checked and read
through §§1–7 and Appendices A–B. Its earlier access failure is removed. Source
results and corrections are expressed in our own words; no source passage is
copied into this review or the revised packet.

The packet retains exact URLs, hashes, edition identifiers and bounded reading
records. This review does not claim complete reading of every paper: the LSS
inverse internal proof, Leng step reduction, general relative counting, GT
sharp moments and Kai ideal Type I/II proofs are among the named gaps.

The corrected dates are GT Möbius v4 **29 May 2011**, GT Linear equations in
primes v2 **22 April 2008**, and Kai v5 **submitted 12 March 2026, PDF dated
13 March 2026**. Published GGMT was not acquired; its accepted manuscript and
arXiv v2 are separate texts. E15 occurs in arXiv v2 and is already corrected in
the accepted manuscript. No priority claim is made for E16–E20; the recorded
search did not establish a separate published correction.

Each E1–E14 entry now has an independent `confirmed` verdict with a reason.
E15–E20 were added with the same independently checked verdict. The table gives
the scope and correction; the packet has the individual counterexamples and
search/version records.

| Finding | Source locator | Independently verified conclusion |
| --- | --- | --- |
| E1 | Tao Notes 2 §6, p. 11, after (9) | Selected-frequency mass was replaced by total mass. The two 3/4 factors give 9/16; the complementary-tail bound still proves nonvanishing. |
| E2 | Tao Notes 2 §7, p. 11 | Phase distance is dimensionless and quantified over the selected frequencies. |
| E3 | Tao Notes 2 §7, p. 12 | Phase radius 1/20 does not ensure chord radius 1/4; 1/32 is safe. |
| E4 | Tao Notes 2 §6, p. 9 | A duplicated word has no mathematical effect. |
| E5 | GGMT Corollary 4.2 proof, AAM p. 17; arXiv v2 §4 | The projected variable uses subtraction in the general abelian-group identity. Characteristic two hides the sign error. |
| E6 | GGMT Lemma 7.2, (7.5), AAM p. 25 | The mutual-information delimiter is inconsistent; the intended pair is fixed by the surrounding identity. |
| E7 | LSS Szemerédi v2, p. 9 before Fact 3.6 | A concentrated atom defeats the asserted strong L¹ maximal bound. Weak (1,1) control still supplies the required regular shift. |
| E8 | LSS Szemerédi v2, p. 12 | The extracted progression-length exponent must be positive. |
| E9 | Schoen–Shkredov v1, Definition 4.2, p. 5 | Strict regularity fails at zero perturbation. The non-strict endpoint convention repairs it. |
| E10 | Tao Notes 2 §7, pp. 12–13 | Character coordinates alone need not be injective. Keeping the integer point coordinate gives the stated rank d+1 lattice. |
| E11 | Kai v5 §12, p. 54 | The recalled weighted difference omits the outer weight present in Theorem 9.1. |
| E12 | Kai v5 Theorem D.3, p. 71 | Arbitrary scaling of another factor defeats the displayed bound. Restore 1-boundedness of all other factors and retain the enlarged box. |
| E13 | Kai v5 Theorem A.1, pp. 59–60 | Scaling a point mass defeats the unbounded inverse claim. The selected box inverse restores 1-boundedness and the source's size restrictions. |
| E14 | GT orbits v4 Theorem 8.6, p. 47; erratum pp. 1–3 | The published unequal-box correction is confirmed. Correct the inherited theorem labels; the single-parameter factorization is unaffected. |
| E15, new | GGMT arXiv v2 Appendix A, (A.22), p. 29; AAM p. 32 | Joint entropy is bounded by the sum of the two marginal entropies. A constant variable paired with a uniform two-point variable defeats the minus sign; the AAM already has the plus sign. |
| E16, new | Kai v5 §9.4, p. 40 | The large-conductor upper bound needs a negative exponent to contradict the lower bound in (9.3). Progression density dominates the smaller complexity losses. |
| E17, new | Kai v5 §9.4, p. 40; Proposition C.6, p. 69 | Fourier resolution must grow with a positive exponent. The printed negative exponent gives parameters below 1 and violates C.6. Round the corrected growing parameters to integers. |
| E18, new | Kai v5 Lemma C.5 proof, p. 68 | The product norm is not convex. Concavity of its logarithm proves convexity of the positive superlevel sets; coordinate-zero boundary pieces are treated separately. This repairs the reasoning, not a counterexample to the boundary result. |
| E19, new | Kai v5 Lemma E.2, (E.3), p. 79 and proof p. 80 | The exceptional S-unit term has negative sign. For K=Q, S={(2)}, a=Z and x=2 it must cancel log 2. Its magnitude/support estimates remain valid. |
| E20, new | Kai v5 Proposition E.3 proof, p. 81 | Converting normalized and unnormalized cube norms must use the indicator norm of the same full enlarged ambient box. Zero extension preserves the numerator; the corrected factor has the required growth. |

Public texts supporting the findings are
[Tao's compilation](https://www.math.cmu.edu/users/af1p/Teaching/AdditiveCombinatorics/Tao.pdf),
[GGMT arXiv v2](https://arxiv.org/pdf/2311.05762v2),
[GGMT accepted manuscript](https://ora.ox.ac.uk/objects/uuid:b9008ecd-9716-491e-9365-eee8d47d12e7/files/sdr26z060n),
[LSS Szemerédi v2](https://arxiv.org/pdf/2402.17995v2),
[Schoen–Shkredov v1](https://arxiv.org/pdf/1106.1601v1),
[Kai v5](https://arxiv.org/pdf/2306.16983v5),
[GT orbits v4](https://arxiv.org/pdf/0709.3562v4) and its
[erratum v3](https://arxiv.org/pdf/1311.6170v3).

## Supplier closure and assigned findings

The exact external theorem statements were read, not inferred from their
names. GN.1's Minkowski-second upper bound has the full lattice and symmetric
convex-body hypotheses the Bohr consumer needs. FF.2's multiplicative Weil bound
retains the non-power condition over the algebraic closure and distinct-root
count. The ES.4 classical Waring asymptotic and ES.3 absolute-convergence nodes
apply in degree at least three with their stated variable thresholds; the
quadratic case is separately requested. AN.2's fixed-progression prime theorem
has a fixed modulus and supports the slow-W diagonal argument. It supplies no
uniform theorem for all growing moduli.

All fourteen requests specify the consumer contracts. In particular AN.3's
Möbius-character estimates are not replaced by von Mangoldt estimates; AN.4's
Hecke/Siegel data and SV.2's distinct integer and ideal Type I/II decompositions
are not treated as already available. AC.2 consumes AC.3's inverse target,
while AC.3 does not consume AC.2's factor or density-increment theorem. No cycle
through the requested quadratic power-sum estimate was found.

| Assigned input | Review result |
| --- | --- |
| RT-AREA-combinatorics/2 | KSV Theorem 2, pp. 2 and 4–6, gives ordered one-equation removal in arbitrary finite groups. The layered directed graph preserves the order. Current Regularity Part II's three-vertex targets do not give arbitrary directed-cycle removal; the extension request remains. |
| /4 | The finite LSS/Leng quantitative source route is explicit; dimension, rational height, Lipschitz and correlation losses remain separate. No ultralimit route is substituted. |
| /5 and PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26 route 3, item /35 | Kai Theorem 13.1 and Appendix E provide the localized linear-prime-pattern endpoint. Fractional modules, a common local witness, retained normalization multiplier and torsion restrictions are present. This does not itself prove the paper's Hasse-fibration endpoint. |
| /7 | AC.5 consumes AC.3 and its direct arithmetic suppliers. An AC.4-only stage dependency would not supply Möbius or number-field uniformity. The packet's edge corrections are proposals for the orchestrator. |
| /8; three decomposition gaps; RS-07 AN.2 link | The selected smooth linear-forms-only route uses fixed-modulus prime mass with a diagonal choice. The original sharp route separately requests a classical zero-free region, growing-modulus Siegel–Walfisz and maximal divisor order; the zeta pole asymptotic supplies none of these. |
| /9; SV.3 → AC.4 | No selected target consumes Bombieri–Vinogradov or SV.3. The unused edge is proposed for removal, while the properly qualified RS-07 input is retained. |
| /12 | Bohr sets distinguish phase and chord radii and include nonfaithful characters. Proper progression rank, volume, injectivity and containment are separate assertions. GN.1 supplies the precise geometry-of-numbers theorem. |
| /13; ALS.2; LieGroups layers 0, 2, 3, 5 | AC.3 owns the filtered nilmanifold/nilsequence carrier; ALS.2 imports it. Native Lie objects and the upstream programme are reused. Missing global nilpotent exponential, finite rational BCH and smooth homogeneous-quotient specializations belong to LieGroups Part II. |
| /14; ER.4; AlgebraicCodingTheory layer 3; ModularForms layer 0; RS-03 | AC.0 owns the missing arbitrary finite-abelian normalization/comparison interface. Existing character theory, cyclic DFT, Haar and Peter–Weyl results are imports. Coding and modular specializations retain their owners; ER.4 is an importing consumer. |

The packet's ownership and edge proposals were checked against the reader and
the assigned findings. Applying them to other files is the orchestrator's job.
No change was made to those files here.

## Work remaining and reader synchronization

The eight gaps remain: regular Bohr/lattice bookkeeping; the original Rahman
numerical proof; directed ordered-cycle removal; quantitative inverse internal
proof; nilsequence calculus/efficient reduction; general relative counting and
smooth analysis; original sharp-cutoff moments; ideal Type I/II and vector
counting. The exact Rahman threshold is sourced from Bennett–Siksek §8,
Theorem 8, equation (36), p. 381; its original proof is still unavailable.

The suggested file retains six explicitly described families of prototype
limitations. These include omitted smooth layer structures, global exponential
and Lie-ideal identities, full metric comparison constants, stronger vertical
rank and rational factorization conditions, uniform arithmetic model/basis
conditions, and the proof that a sharp weight satisfies its analytic
hypotheses. A compiled `sorry` signature does not discharge any of them.

During packaging, synchronize the reader with the corrected packet:

1. Add the reference-probability assumptions, the factor-approximation size
   threshold, positive-order scalar homogeneity, fixed-resolution shift and
   explicit finite Lipschitz condition.
2. Update all node locators listed above, the ES.0 request, the three source
   edition dates and the GGMT access/version distinction.
3. Add the three existing Fourier comparison citations and the imaginary
   point-mass, imaginary-constant and non-Lipschitz regression descriptions.
4. Preserve the corrected selected-subproduct argument, Kai preliminary and
   localized proof corrections, all twenty finding verdicts, the eight gaps,
   fourteen requests and prototype limitations.

Questions for the orchestrator: can the package job's deliverables include the
reader synchronization above? Which supplier job will own the arbitrary
directed-cycle removal extension? Which cleared or public primary source can
establish Rahman's exact numerical constant? These questions do not prevent
acceptance of this bounded planning pass and do not authorize edits to other
jobs' files.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdditiveCombinatorics.json`:
  **0 errors, 0 warnings**, with the counts above.
- Source-finding schema checks (`check_issues` and `versions_checked`): **0 problems**.
- `lean-check research/blueprint/suggested/AdditiveCombinatorics.lean`:
  **exit 0, 0 errors, 470 warnings, all declaration-uses-sorry warnings**;
  no other warning. This checks expressibility at the pins, not proof validity.
- Intake `check-files` on the four submitted deliverables: **0 problems**.
- `git diff --check`: **passed**.

See [the handoff](../handoff/REV-AdditiveCombinatorics.md) for the complete-job
result and the next worker's starting points.
