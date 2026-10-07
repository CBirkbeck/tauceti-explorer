# Independent review of the arithmetic K-theory fixes, round two

Refs #5714. Codex — `codex-Xjl89s`, 7 October 2026.
Reviewed Claude — `claude-UNu5Ve`, [PR #6707](https://github.com/CBirkbeck/tauceti-explorer/pull/6707),
and the current packet, including the subsequent area reconciliation in
[PR #6749](https://github.com/CBirkbeck/tauceti-explorer/pull/6749).
This session wrote none of those fixes. Claim comment 6038806762 was confirmed
by the bot (6038809235) before work began; the complete issue was reread.

**Verdict: `needs_changes`. This is a completed independent review.**
Both original findings remain repaired. The Gaussian generation proof now
supplies the previously missing span. The real quadratic transfer and
symbol-reduction argument is correct conditional on cyclotomic vanishing,
but that vanishing's representative selection and finite generation checks
are not sufficiently established in the packet or independently verified
from its public source. The earlier review is preserved in `reviewHistory`.

## Finding /1: honest suggested declarations — addressed, with corrections

Read the original finding and verifier, both fix rounds and the preceding
independent review. The suggested file has no `True` theorem, unnamed
proposition standing for an unavailable condition, arbitrary eigenspace
carrier or dummy certificate record. It keeps the genuine residue quotient
and its unit order under primality alone, including the prime two. The new
Tate filtration, K₂ and transfer statements correctly remain mathematical
comments naming their suppliers; neither pinned library supplies their
carriers. The S-unit subgroup and arithmetic inputs have genuine signatures.

I corrected further expressible API and test discrepancies:

- `bernoulliArith` is an alias of the imported convention; `bernoulli_one_arith`
  uses the pinned theorem. The conversion, positivity and denominator tests
  now match the packet, including denominator 2730 and the distinction
  between divisibility of B₁₀ and B₁₀/5 by five.
- Added the positive-index evenness API for `wInvariant`, its Gaussian,
  odd-index and prime-divisibility examples. Prime divisibility is stated
  for every positive index, rather than unnecessarily assuming evenness.
- Used the packet's `IsRegularPrime.iff_not_dvd_classNumber`, `.iwasawa` and
  `.decidable` names; supplied its small-prime, 37, decidability and real
  versus full class-number examples. The last is a numerical test at 37
  covered by the historical verification in the inspected source, not an
  assumption of the global Vandiver conjecture.
- Replaced the arithmetic-data comment with a concrete `ArithmeticData`
  record: degree, real and complex place counts, class number, unit rank,
  and positive-index w-values, each with an equality to its actual supplier.
  Its library-data example states real equalities. `CertifiedExample` still
  needs N.6's certificate engine and K₂, so its unavailable interface remains
  an explicit comment rather than a fabricated record.
- Removed the trailing list that merely repeated expressible names without
  stating their API. All packet API and test names now occur as declarations,
  examples or precise supplier-labelled comments.

These are signature suggestions with `sorry`; elaboration checks their types,
not the mathematical proofs or the completion of a certificate.

## Finding /2: Vandiver ownership — addressed

IntegralIwasawaTheory L3 remains the sole owner of the predicate, explicitly
requested and required by `vandiver-separation`. N.7 keeps the comparison
with odd characters and the global K-theoretic consequence. The suggested
file introduces no second predicate. Its class-number example at 37 does
not alter this ownership or the existing historical qualifications.

A further duplication was clearly fixable: the N.1–N.6 packet already owns
`ArithmeticKTheory:N.4/the-w-invariant` and its finiteness. N.7 now imports
those nodes and the cyclotomic-character computation. Its proof outline
no longer defines the invariant or proves its existence again. The twist
supplier is MotivicEtaleKTheory M.1, also imported by K2SymbolsBrauer T.7.
N.7 keeps the Bernoulli-denominator comparison and numerical API; its node
and planet now name that formula. The local
Lean prototype is explicitly identified as the unavailable N.4 import.
Corrected the acceptance formula from arithmetic B₁/8 to `bernoulli 2 / 4`.

N.6 still owns the certificate engine; T.5 and V.5 own the imported low-degree
computations; SpecialValuesBirchTate B.3 consumes N.8's independently obtained
certificate and cannot supply its upper bound. The reachable packet-declaration
graph, including the new N.4 imports and L3 ownership, has 272 nodes and no cycles.

## The previous review's Gaussian span objection — resolved

Read all five added nodes, the three certificate nodes they modify, and their
sources, prerequisites, API and tests. The Tate filtration exhausts K₂(F):
each element is a finite sum of symbols, and each symbol's entries have finite
prime support. At a principal localized prime, the map α from earlier S-units
onto the graded group satisfies ∂α = β and kills U₁ by the Steinberg relation.

The criterion has a valid elementary proof, with two corrections made here.
First, use **positive words** in β(G), replacing inverses by powers in the
finite residue group. Condition (2) only concerns multiplication by G;
it cannot be applied directly to inverses. This proves injectivity on C̄;
finiteness then makes multiplication by each g a permutation, so C̄ is the
subgroup generated by Ḡ and contains the generators W̄ of U/U₁.

Second, π generates the prime after localization and need not be globally
integral. For a ≠ b use the integral ideal J = (a−b)v⁻¹, of norm less than Nv.
All prime factors of J precede v. Valuations of π show d = (a−b)/π belongs to
U, although d need not be integral. Consequently a/b = 1 + π(d/b) belongs to
U₁. The identity case a = b is separate. This corrects the old assertion
that d was automatically integral with norm |N(a−b)|/Nv.

In the Gaussian case the integral global generators do exist. Rounding
supplies representatives C = G with 2N(c) ≤ Nv; their prime factors all have
norm strictly less than Nv, so they belong to the earlier S-unit group.
The three displayed inequalities hold for Nv ≥ 5 and verify the criterion
by the norm lemma. Equal-norm ordering causes no problem because the relevant
bounds are strict. At Nv = 2, take C = G = {1}, with
`i = 1 + (1+i)i` in U₁. Finally step zero is generated by {i,i};
{ i,i } = { i,−1 } = { i,i }² forces that symbol to be the identity.
Thus the empty Gaussian presentation has its independent span proof.

## Real quadratic upper bound — valid reduction, unresolved input

For F = ℚ(√5) and E = ℚ(ζ₅), restriction carries an unramified class into
K₂(𝓞_E). If that group vanishes, transfer after restriction gives 2x = 0.
Tate's Theorem 6.1 then represents x by {−1,b}. Unramifiedness at odd primes
forces even valuations of b there. Class number one, inertness of two and
units ±εⁿ give b = ±εⁿ2ᵏc²; squares and {−1,2} = 1 leave the two claimed
generators. Their orders divide two, giving upper bound four, while the two
real sign symbols give the independent lower bound four. No step uses a
zeta value or Birch–Tate. The missing cyclotomic input cannot be supplied
by this lower bound or by the numerical equality 1/30 = 4/120.

The packet reports a cyclotomic coordinate-rounding bound
N(c) ≤ (25/16)Nv. It then applies Tate's criterion, which additionally
requires **C ⊆ U**, the earlier S-units. This implication is missing:
25/16 exceeds one, allowing support at a later prime.

There is a concrete diagnostic even with the recorded archimedean bounds.
Write ζ = exp(2πi/5), ξ = 1+ζ+ζ² and φ = (1+√5)/2. Then
ξ⁻¹ = 1+ζ³ and α = (1+2ζ)/ξ = −1−2ζ²−ζ³ has norm 11.
Its two squared absolute values are (7−√5)/2 and (7+√5)/2; their ratio
satisfies the recorded balancing interval [φ⁻¹,φ]. The element c = 2 has
norm 16 ≤ 275/16 and satisfies both size bounds, since
φ²|α|² = 4+√5 > 4 and φ²|σ(α)|² = (13+5√5)/2 > 4.
Yet two is inert in E, giving a prime of norm 16 after every prime of norm
11; thus c is not in the earlier S-unit group. Exact arithmetic in
ℚ[z]/(z⁴+z³+z²+z+1) independently checks the inverse, norm 11 and norm 16;
the order of two modulo five is four.

This diagnoses an insufficient bound, **not a counterexample to Zhang–Xu's
published vanishing theorem or to the existence of a suitable selection**.
The next fix must specify U-compatible representatives meeting every nonzero
residue class, equal-norm ordering, condition (3), and the finite data and
checks used for conditions (1) and (2). The public full text could not be
obtained in this review, so its quoted tables and detailed locators remain
inherited fixer evidence. The separate Skalba-source gap also remains.
An alternative direct real quadratic route survives at
[commit 52d782e2](https://github.com/CBirkbeck/tauceti-explorer/commit/52d782e2),
as the area fix report notes; this review does not adopt or certify it.

I added this precise gap, made the generation and certificate assertions
conditional in the affected nodes and suggested comments, removed contradictory
completion prose, and changed N.8 coverage to `planned` with the required
refinement. The packet remains `complete` as a reviewable planning submission;
this does not mean that its negative review is an accepted decomposition.

## Public sources and pinned evidence

Fresh downloads on 7 October 2026:

| Source | Reading used in this review | SHA-256 |
| --- | --- | --- |
| [Weibel, combined K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), 29 August 2013 | III.5.2.2, III.6.8, VI.2.4, VI.8.3.2, VI.9.1–9.2, VI.10.1 and VI.10.4–10.8.2; PDF pp. 226, 247, 480, 522–523, 530–531, 535, 538–540 | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| [Tate, Relations between K₂ and Galois cohomology (1976)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf) | Printed pp. 270–271, Theorems 6.1–6.2 and their proofs; inspected page images because the PDF lacks usable text | `5d1ee68e3f9cc49ba6cac8269e1c9ca510411c6a154f36b559290849a72db7b7` |
| [Browkin, Tame kernels of quadratic fields (2000)](https://ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf) | §§1–2, §3 Theorem 1 and §3.2 Lemma 4/Remark 1; criterion and localized-generator hypotheses | `99001ec60a5df5be749f6122877f944545b24e00513051f6dd8b2ddc2e2f7028` |
| [Zhang–Xu, later imaginary cyclic quartic paper](https://arxiv.org/pdf/1612.09362), v2, 14 November 2018 | pp. 1–3 and §3.2, pp. 14–15; corroborates the earlier vanishing result and explicitly requires C ⊆ U | `ab9c46afc901d6267344afa59a722920de6618911213b8c4c2cc8dfc995acb27` |

The [2016 Zhang–Xu publisher PDF](https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf)
and alternative public routes returned HTTP 403. No matching full text was
obtained. Its fixer-recorded hash was not reproduced. The later arXiv paper
is corroboration only, not a substitute for inspecting the 2016 finite tables.
The original Bass–Tate appendix was not obtained; the criterion and Gaussian
proof above are independently reconstructed from the stated hypotheses.
Washington, Herbrand–Ribet and Skalba proof-source gaps are retained honestly.

Read the reviewed AUDIT-27 for these layers and the upstream Multiquadratic
and IntegralLattices documents for granularity. Personally read the statements
of all 44 packet baseline references at
[Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174),
including the seven round-one residue inputs and seven new arithmetic inputs.
For the new generation route also read the relevant proofs: Gaussian rounding
(the factor one half), `five_pid`, the Minkowski PID criterion, and S-unit
valuation semantics. The cyclotomic finrank theorem requires the stated
irreducibility input; class-number and quotient-cardinality citations have
the required number-field and ideal hypotheses. The suggested file imports
Mathlib only; no compilation of Tau Ceti at a different commit is being used
as evidence for the pinned Tau Ceti baseline f790474.

## Validation and next work

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.7.json`
  and its pinned-index variant: **0 errors, 0 warnings**; 20 nodes, 44 baseline
  references, 34 API items, 25 tests, 10 planets and four recorded gaps.
- Reachable packet-declaration prerequisite graph: **acyclic**, 272 nodes.
- Exact cyclotomic diagnostic: **passed**, as described above.
- `lean-check research/blueprint/suggested/ArithmeticKTheory--N.7.lean`:
  **exit 0**, with **45 `sorry` warnings only**, at pinned Mathlib. Memory was
  checked before compilation; no language server or library build was started.
- Submission file checks and `git diff --check`: **passed**.

Only the three issue deliverables change. The reader document is not authorized
for this review; the next fix must synchronize its Tate norm-lemma proof,
N.4 invariant ownership, cyclotomic representative obligations, real quadratic
certificate qualification and coverage prose with this packet. Resume at the
new gap before accepting the real quadratic upper bound. This completed
negative review requires a further fix and independent review, not a checkpoint
or a second job in this session.
