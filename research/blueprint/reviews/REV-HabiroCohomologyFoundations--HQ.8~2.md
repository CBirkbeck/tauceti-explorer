# REV-HabiroCohomologyFoundations--HQ.8~2 — independent revision review

**Verdict: accepted.** This is a complete planning pass with HQ.8 **planned**, not
closed. All stage targets have nodes, and the five remaining gaps are explicit.
Acceptance certifies the plan and its reading boundaries; no cohomology theory
or comparison theorem is claimed to be formalized.

Reviewer: Codex (GPT-6), session `codex-9zWvth`, issue #6444, 6 October 2026.
This session did none of the original blueprint, its revision, or the earlier
review. The input revision is `BP-HabiroCohomologyFoundations--HQ.8~2` (#6492).

## Earlier review and reader agreement

Read the complete report `REV-HabiroCohomologyFoundations--HQ.8.md` and checked
all its corrections. Its sole blocking condition was regeneration of the
reader. The revised reader now agrees mathematically with the packet, including:

- the distinction between the q-PD ideal `(q−1)` and prism ideal `[p]_q`, the
  perfectoid root conventions and the imported ownership of both bases;
- the bounded-prism route to AΩ, its Frobenius pullback and completion, rather
  than an unsupported application of Λ-ring base change to `q ↦ [ε]`;
- separate décalage squares at `q−1` and `[p]_q`, their precise hypotheses,
  and the obstruction to gluing the canonical filtrations;
- the Nygaard quotient by `q^{p^α}−1`, PR.3's independent construction before
  RT.6, the ordinary-to-q-Witt map without an inverse or restriction maps,
  and the torsion correction at `q = 1`;
- all eight square records, the loss ledger, 17 API items, six unit tests,
  six planets, 19 node specifications and both new CP.1 target obligations.

Compared the reader's embedded node fields with the packet, checking formatting
changes separately from mathematical content. The two CP.1 targets are named
map equalities with exact composites and a gap; they are excluded from the
eight-square conjunction justified by imported comparisons. No edit to the reader was required.
The request corrections below clarify suppliers already named in its proofs
and prerequisites.

## Counts and corrections in this review

| Item | Input | Reviewed |
|---|---:|---:|
| Nodes | 19 | 19: 16 verified, 3 corrected interfaces/requests |
| Definition / lemma / comparison / theorem / application | 1 / 1 / 6 / 9 / 2 | unchanged |
| Baseline citations | 11 | 11 confirmed; 0 fixed, removed or added |
| API items / unit tests / planets | 17 / 6 / 6 | unchanged |
| Sources / node source passages | 7 / 72 | all checked |
| Gaps / supplier requests | 5 / 14 | unchanged counts |
| Source issues | 6 | all independently confirmed |
| Nodes added or removed | — | 0 |

Three concrete corrections were made:

1. Strengthened the suggested `deRhamSquare.torsionSequence` conclusion with
   exactness at the middle term of the quotient sequence. The old signature
   asserted injectivity and the image of the outgoing map, but omitted middle
   exactness despite assuming it for the original sequence. The corrected
   signature matches the short exact sequence already stated in the packet and
   reader. It retains its honest `sorry` proof.
2. Extended the DD.1 request to specify transitivity of derived completed tensor
   products along θ and Witt reduction, with `(p, ξ)` completion before
   specialization and p-completion afterwards. Both target proofs already
   requested this operation from DD.1.
3. Added the Witt/crystalline target to CR.4's `neededBy` list. That node already
   directly imported CR.4 and explicitly used its classical crystalline
   comparison; the request's consumer list omitted it.

Replaced the stale top-level review by this verdict and a check of every node.
Added this reviewer's confirmation to each of E801–E806. No mathematical
statement, direct prerequisite, API item, test, planet or gap was changed.
Every node retains `implementationStatus: unchecked`.

## Sources and scope of the reading

Re-fetched the seven public source archives on 6 October 2026. Their full
SHA-256 hashes match the packet, and all 72 node excerpts are literal source
passages. Checked their locators, hypotheses, match descriptions and surrounding
arguments. These are exact version checks, with no assertion about later
versions. Hashes describe the gzipped source archives, not the PDFs.

| Public version | Passages checked |
|---|---|
| [Wagner, q-Hodge complexes over the Habiro ring, v2](https://arxiv.org/abs/2510.04782v2) | A.1 and its comparison construction, A.10 and its compatibility proof, A.12–14; 1.17; the q-Hodge, twisted, Nygaard and specialization statements in §3, especially 3.20–22 and 3.47–49 |
| [Wagner, q-Witt vectors and q-Hodge complexes, v5](https://arxiv.org/abs/2410.23078v5) | §3's operator and relative-map conventions, Remark 3.18, Proposition 4.2 and the cited fracture comparison |
| [Wagner, q-de Rham cohomology and topological Hochschild homology over ku, v1](https://arxiv.org/abs/2510.06057v1) | Theorem 1.2 and the cited comparison hypotheses; the 2-invertibility and E₂ enhancement boundary |
| [Bhatt–Scholze, Prisms and prismatic cohomology, v4](https://arxiv.org/abs/1905.08229v4) | Bounded-prism base change; 15.2–3; 16.1–2, 16.10, 16.18–22; 17.1–3 and the explicit comparison models; all of §18 and Remark 2.13 |
| [Bhatt–Morrow–Scholze, Integral p-adic Hodge theory, v3](https://arxiv.org/abs/1602.03148v3) | The cited classical comparisons; §6's cohomology, non-exactness and same-ideal completion results; 10.10; Theorem 14.1 and its full proof |
| [Bhatt–Morrow–Scholze, Topological Hochschild homology and integral p-adic Hodge theory, v2](https://arxiv.org/abs/1802.03261v2) | The cited filtration statements and Proposition 5.8 with its Beilinson/Cartier-ideal proof |
| [Scholze, Canonical q-deformations in arithmetic geometry, v1](https://arxiv.org/abs/1606.01796v1) | The polynomial/Laurent examples, q = 1 torsion sequence, perfectoid coefficient conventions and Conjecture 4.3 |

Also compared Bhatt–Scholze v1–v3 for E801, E803 and E804, Wagner's first
q-Hodge version for E805, and the
[author's Prisms PDF](https://people.mpim-bonn.mpg.de/scholze/prisms.pdf) for E806.
The published version of record was not obtained. The packet's original reading
provenance is retained; this report records the independent recheck.

This review checks the imported theorems' statements and the arguments used by
HQ.8. It does not certify the unread internal trace, relative de Rham–Witt or
prismatic comparison proofs. Those reading limits are already gaps with named
owners and next source actions.

## Baseline, closure and ownership

Read all eleven declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The recorded Tau Ceti baseline is
`f790474821cf4256814db967cb154e7af3d0c369`. All citations provide the stated
arithmetic or coefficient input; none supplies the missing prism structures or
cohomology theories.

| Declaration | Verified scope |
|---|---|
| `IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime` | Primitive p-th root in a field, p prime; associated elements in its ring of integers. The cyclotomic-extension hypothesis is absent. Application to the completed coefficient ring still uses base change and supplier input. |
| `Polynomial.cyclotomic_prime` | Ring coefficients, prime p; cyclotomic polynomial equals the geometric sum. |
| `Polynomial.cyclotomic_prime_mul_X_sub_one` | Ring coefficients, prime p; multiplication by `X−1` gives `X^p−1`. |
| `Polynomial.cyclotomic_three` | Ring coefficients; the explicit `X²+X+1` identity. |
| `Polynomial.eval_one_cyclotomic_prime` | Commutative-ring coefficients, prime p; evaluation gives p. |
| `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` | Commutative-ring coefficients and positive n, as used for positive Habiro indices. |
| `PreTilt` | Perfection of the mod-p ring; the commutative-ring/characteristic-p hypotheses are prime p and p nonunit, without a perfectoid assumption. |
| `WittVector.fontaineTheta` | Prime p, p nonunit, p-adically complete commutative target ring. This citation does not assert a principal kernel or surjectivity. |
| `WittVector.fontaineTheta_teichmuller` | Under those hypotheses, θ on a Teichmüller element is its untilt. |
| `WittVector.teichmuller` | Multiplicative map into Witt vectors, with no claim of additivity. |
| `geom_sum_mul` | Ring identity, without a primality requirement. |

Read the reviewed HQ.8 library audit, accepted RS-10 ownership, the companion
HQ.1–HQ.7 imports and the statements of all 14 requested supplier stages.
Checked the relevant finer AI.1 and DD.2 nodes as well. The requested packages
include operations beyond those individual nodes, so the stage requests remain
necessary. Read the upstream AdicSpaces and HodgeStructures documents for the
required roadmap standard.

There is no new planning of baseline declarations, q-Witt constructors, trace
infrastructure, prism objects or classical comparison theories. HQ.8 imports
those owners and plans its records, local squares and compatibilities. CP.1's
existing packet does not prove the required map diagram. DD.1 transitivity and
CR.4's omitted consumer were the only request precision corrections. The
prerequisite graph contains no trace-to-Nygaard cycle.

## Every node

The packet's `review.checked` gives the complete node ids and detailed notes.
The following table records the independent checks at target granularity.

| Node suffix | Verdict | Check |
|---|---|---|
| `what-an-atlas-square-records` | verified | Verified the seven record fields and the loss item against all eight squares. The 17 API items serve the recorded uses; six tests discriminate prism versus q-PD bases, A_inf coefficient reduction, q = 1 filtrations and completion/inversion order. The Lean structure is explicitly metadata, not a formalized comparison diagram. |
| `the-q-de-rham-prism-and-its-perfectoid-base` | verified | Verified the q-PD/prism ideal distinction, radical comparisons, root conventions and θ([ε]) = 1 against BS16.1–2 and 17.1 and the eleven pinned Mathlib declarations. Prism construction, flatness and kernel principality remain PR.0/PR.6 inputs; the baseline does not claim to supply them. |
| `what-this-atlas-does-not-prove` | verified | Verified the limited smooth-pair q-Hodge comparison and analytic boundary against Wagner 1.17 and 3.47–49 and BS17.2. No universal integral equivalence or general non-gluing theorem is asserted. |
| `the-local-prismatic-square` | verified | Verified the p-torsion-free Λ-ring and smooth-algebra hypotheses, the S^(p)[ζ_p] input, completion and Frobenius pullback via Wagner A.1(b), A.12–14 and BS16.18. Its record asserts no filtered comparison. |
| `the-q-crystalline-square` | verified | Verified D-flatness over ℤ_p⟦q−1⟧, framed q-PD input and the route through BS16.19–22. Wagner A.10 and the imported HQ.1 compatibility square justify the rationalized, (q−1)-completed diagram; completion order is retained. |
| `the-a-infinity-square` | verified | Verified the route through A.1(b), bounded-prism base change, BS16.18 and 17.2–3, including the E∞ and Frobenius conventions. It does not apply Λ-ring base change to q ↦ [ε]. Classical θ and Witt map compatibilities are separate targets with a gap. |
| `the-decalage-squares` | verified | Verified the smooth-pair Lη_{q−1} comparison and the chosen q-Hodge filtration. BMS1 6.4 and 6.20 and BMS2 5.8 retain the same rank-one ideal, replete-topos and completion hypotheses; Lη is not treated as exact or as commuting with every completion. |
| `the-nygaard-square` | verified | Verified BS15.2–3 and Wagner 3.20–22. PR.3 supplies Frobenius-divisibility/descent independently of RT.6; the filtered quotient is by q^{p^α}−1, not [p^α]_q. Degree conventions and the fixed degree-zero normalization agree with the reader. |
| `the-crystalline-and-de-rham-witt-square` | verified | Verified the ordinary W_{α+1}Ω → qW_{p^α}Ω map, absence of restriction maps, p-completion and smooth perfectly-covered base hypotheses against Wagner q-Hodge 3.11(b) and 3.19, q-Witt 3.18 and 4.2, and the latter source’s no-restriction conventions. Relative factorization and the classical crystalline comparison remain named HQ.4/CR.4 obligations, not invented equivalences. |
| `the-de-rham-square` | corrected | Verified the q = 1 specialization, Hodge and conjugate filtrations, and cofiber torsion sequence. Corrected the suggested deRhamSquare.torsionSequence signature to include exactness at the middle term as well as injectivity and the torsion image, matching the unchanged packet and reader. |
| `the-commutation-theorem` | verified | Verified that the conjunction contains exactly the eight recorded squares on their common hypotheses. It imports the global/Habiro compatibility and smooth-pair q-Hodge comparisons; it does not prove the two new CP.1 target equalities. |
| `what-each-square-loses` | verified | Verified each loss entry and the order of rationalization, completion and coefficient reduction. The μ-inverted proper-smooth étale boundary is explicitly a gap; no conservativity, analytic Habiro comparison or unrecorded Frobenius erasure is asserted. |
| `the-staging-rule` | verified | Verified the PR.3-before-RT.6 dependency direction against BS15.2–3, BMS2 1.12 and ku Theorem 1.2. The ku enhancement is E₂ under quasi-syntomic and 2-invertibility hypotheses; the source-reading and syntomic export limits are recorded. |
| `the-acceptance-tests` | verified | Verified the ℤ and ℤ[T] witnesses, ordinary-to-q-Witt scope checks and Nygaard-degree tests. The corrected polynomial H¹ has no Laurent free summand; (q−1)-torsion-freeness follows by constant terms and cancellation, not by comaximality. |
| `the-executable-boundary` | verified | Verified the suggested file’s actual declaration names, six tests and owner contracts. Arithmetic and metadata lemmas elaborate; advanced comparison objects are supplier structures or mathematical comments, and every packet node stays unchecked. |
| `the-decalage-square-at-the-prism-ideal` | verified | Verified BS15.3: the map factors as φ_A^*Δ ≃ Lη_{[p]_q}Δ. It is separate from the q−1 smooth-pair square and does not replace the Frobenius pullback by untwisted Δ. |
| `the-decalage-filtrations-do-not-glue` | verified | Verified Wagner Remarks 3.18 and 3.49 and the m = p illustration. The obstruction concerns the canonical décalage filtrations; a chosen q-Hodge filtration is extra datum. No universal nonexistence assertion is made. |
| `compatibility-with-the-theta-de-rham-row` | corrected | Verified the exact β_S and canonical BMS14.1(ii) composites, completion order, θ rather than θ̃, differential and full-functor/Hodge–Tate conditions of BS18.2. Clarified the DD.1 request to supply completed tensor transitivity already named in the proof. Equality and sheaf descent remain explicit CP.1 gap obligations. |
| `compatibility-with-the-witt-crystalline-row` | corrected | Verified w(q) = 1, the BMS14.1(i) route, CR.2’s inverse PD Poincaré map and Frobenius normalization. Added this already-declared CR.4 consumer to its request and clarified DD.1 transitivity. Neither the ordinary-to-q-Witt map nor a restricted-domain uniqueness assertion supplies an inverse or a proof of the target equality. |

## Source mistakes

All six are confirmed independently and receive `by:
REV-HabiroCohomologyFoundations--HQ.8~2` in the packet:

- **E801:** BS v4 Notation 16.1 repeats the same completion ideal. V1–v3
  correctly compare `(p, [p]_q)` with `(p, q−1)`; their radicals agree.
- **E802:** Scholze §3 prints the Laurent H¹ for the polynomial example.
  The corrected polynomial quotient sum has no free `T⁻¹dT` summand.
- **E803:** BS Construction 16.19 writes differentials relative to the
  coordinate index set S. The coefficient base is D.
- **E804:** BS Construction 16.20 refers to a construction where the labelled
  environment is Lemma 16.10.
- **E805:** Wagner A.1 cites BS Definition 16.1; q-PD pairs are Definition 16.2.
- **E806:** In the proof of BS Lemma 18.3, the first two exponents in the
  formula for `φ^{n+1}(x)` are shifted. Remark 2.13 gives
  `φ^{n+1}(x) = ∑ p^j δ_j(x)^{p^{n+1−j}}`. At n = 0 this must recover
  `φ(x) = x^p + pδ(x)`. The corrected powers preserve the kernel induction.
  This confirmation concerns arXiv v4 and the author copy, not the unaccessed
  version of record.

These are misprints or cross-reference errors; the corrected readings do not
invalidate the comparisons. No further source issue was found in this pass.

## Validation and executable boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCohomologyFoundations--HQ.8.json`:
  **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/HabiroCohomologyFoundations--HQ.8.lean`:
  **exit 0**, with only three `declaration uses 'sorry'` warnings, for the two
  completion tests and the torsion-sequence theorem. The existing shared build
  uses exactly the pinned Mathlib; its Tau Ceti checkout is newer, but this file
  imports no Tau Ceti module. No library was built or updated.
- All 17 planned API declarations and six named test examples are present in the suggested file. The six unit tests catch
  record errors and completion-order errors. Small arithmetic identities are
  proved. Advanced supplier structures and comments are explicitly planning
  interfaces; compilation supplies no proof of the ∞-categorical comparisons.
- The six planet names identify central comparisons rather than source
  locators. The reader and packet agree, and `git diff --check` passes.

## Questions and follow-up for the orchestrator

There is no acceptance blocker. The five gaps prevent closed coverage and
specify the next work:

1. Route the two CP.1 target equalities to AI.4/CP.1/PR.6, comparing explicit
   q-PD/Koszul maps with the canonical θ and Witt maps and their differentials.
   A BS18.2 uniqueness route first needs full symmetric monoidal functors on
   all p-completely smooth algebras and their Hodge–Tate structure maps.
   CR.2 supplies the PD Poincaré map; proper smooth globalization needs sheaf
   compatibility and descent.
2. Have HQ.4/CR.4 check the relative ordinary-to-q-Witt factorization and
   classical crystalline inputs, without manufacturing q-Witt restriction maps
   or an inverse to the ordinary-to-q-Witt comparison.
3. Have RT.6 export its syntomic squares with atlas records after PR.3's
   independent Nygaard construction; PR.3/PR.6 retain responsibility for the
   imported comparison proofs. CP/AI must decide and specify the proper-smooth
   μ-inverted étale composite and its information loss.

The existing coverage and gap entries already carry these obligations. This
review does not add an upstream correction request or promote atlas data.
