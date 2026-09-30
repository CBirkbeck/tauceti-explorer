# Review of the Koymans–Pagano fixes

**Accepted with the corrections below.** Job
`REV-FIX-RT-PAPER-KOYMANS-PAGANO`, issue #5145. Codex — `codex-J6LwjP`,
30 September 2026; reviewed base `3408ded`.

The fixer was Claude Code `cc-f805bf`, whose work I did not write. This follows
the independent verification by `cc-58621d` in
`redteam/RT-PAPER-KOYMANS-PAGANO.review.json`. I read all thirteen findings,
their qualified verdicts and the fix report. The fix selected the five medium
findings /1–/5; the eight low findings remain outside that selection.

The assigned packets are ArithmeticStatistics and ClassicalArithmeticCompletion.
The associated extraction, report and historical route review were inspected
read-only. Acceptance here does not supply a missing extraction-route verdict.
ArithmeticStatistics previously carried my review of the separate BLS fix,
`independent-review-REV-FIX-RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23`. Those edits
are retained; I am not reviewing my own BLS work again. ClassicalArithmeticCompletion
had no top-level review object. Both objects now record this scoped review,
as this issue requires.

Neither packet becomes proof-closed. ArithmeticStatistics remains partial with
415 nodes, 47 gaps, 53 requests and no closed stages; ClassicalArithmeticCompletion
remains partial with 333 nodes, 9 gaps, 45 requests and one previously closed
stage. This is not a fresh audit of every node or baseline declaration.

## Finding decisions

### /1 — accepted, with the verifier's distinctions preserved

Items 28, 36 and 52 are library. Item 28 now states the maximal pro-2 quotient
as the quotient by `proPKernel`; the closed-normal-subgroup Galois equivalence
supplies the fixed-field interpretation. Item 36 uses the actual continuous
1-cochains, cocycles and differential; its twisted coefficient module is still
separately missing. Item 52 correctly uses Mathlib's all-degree
`inhomogeneousCochains.d` on `Rep.trivial`, not only Tau Ceti's degree-one
differential. Over F₂ its signs disappear, matching the source's formula.

Items 21 and 83 properly remain planned. The existing Kummer map does not by
itself supply the missing μ₂-to-F₂ coefficient adapter. The existing transfer
operators supply the index-two computation, but no cited declaration states
the complete criterion. For coset representatives 1 and σ the transversal
words give σ² and 1 on σ, and τ and σ⁻¹τσ on τ. A character of the subgroup
identifies the latter conjugate with στσ⁻¹, since σ² lies in the subgroup.
This checks the proposed use of (3.1)–(3.2), including their quantifiers.

The extraction's totals are 9 library, 14 planned and 242 missing items.
Its report and route-1 import paragraph agree with these qualifications.
No packet correction was needed for /1.

### /2 — accepted; built genus theory is distinguished from its adapter

Item 227 stays planned and now names the built ramified-prime generation,
genus-character injection, image characterization, two-rank formula and Artin
bridge. I checked the actual statements and their presentation,
prime-discriminant and indexing hypotheses. Those results support the fix's
remaining tasks: turning generation into the stated surjection, transposing
the injective character map by finite duality, identifying Galois and ideal
characters, and reconciling the prime-discriminant conventions. In particular,
the factor at 2 is 8 in the relevant discriminant, while χ₈=χ₂.

Item 5 correctly cites `NumberField.card_ker_toClassGroup_le_two` for the
kernel of the narrow-to-ordinary class-group map. It remains missing because
the order/unit converse and the stated assembly are not one existing theorem.
No second genus-theory owner is created. No packet correction was needed for /2.

### /3 — accepted; the variable ordering matters

Item 189, the extraction summary, route-1 brief, route 5, prerequisites and
reader report now attribute the bilinear estimate to Smith's Proposition 6.6
through Jutila's Lemma 3. I read Smith's proof and the KP applications; this is
not a claim to have freshly read Jutila's entire original article.

After quadratic reciprocity on residue classes modulo 4, use the larger
variable x_i in the outer sum. Cauchy–Schwarz and the mean-value bound yield

`t_i*t_1^(1/2) + t_i^(3/4)*t_1*log(t_1)^3`,

which is `O_epsilon(t_i*t_1^(3/4+epsilon))` when t_i>t_1. Reversing the
variables leaves a logarithm of t_i that the allowed range does not absorb
with an arbitrarily small epsilon. The fix records this distinction.
The verifier correctly found no applicable Heath-Brown claim in item 263;
its unchanged note is not a missed fix. No packet correction was needed for /3.

### /4 — accepted after correcting the consumed identity's proof

Item 211 now contains the D_{k,n} sets; the matrix kernel law is item 265 on
route 3. The Part II imports ST.5's existing
`matrix-kernel-law-over-a-finite-field`, with its general finite-field
definition, API and tests. The right-kernel convention matches the source:
an m-by-n matrix acts from F^n to F^m. The split leaves 219 Part-II items and
six items on route 3. I did not create another definition or general owner.

Checking its consumed node `ST.5/koymans-pagano-rank-identity` exposed an
additional clear error: its proof copied the invalid conditioning in
*Higher Rédei reciprocity*, Appendix A.1, p.48. I inspected the page image,
not just its extracted text. In the printed uniform space of independent
pairs (T,U), the events A_{n,x} cover only U(x)=0, of probability 2^(−m).
Their conditional-probability sum therefore equals
P(x∈ker T)*2^(−m), not P(x∈ker T). Already at m=1 the two sides are 1/6 and
1/3. The subsequent decomposition also omits the possibility that T(ker U)
has dimension n+1.

The identity itself is correct. I replaced the proof by this finite argument:

1. Choose U:F₂^(m+1)→F₂^m uniformly. Its kernel K is nonzero.
2. For each nonzero x put w_x(U)=1/(#K−1) if x∈K, and 0 otherwise. For
   every U, the sum of these weights is 1.
3. Precomposition by an invertible map permutes U uniformly. Transitivity
   on nonzero vectors shows all averages E[w_x] are equal, hence each is
   1/(2^(m+1)−1).
4. Fix x and choose a basis starting with x. The event U(x)=0 has probability
   2^(−m); conditional on it, the remaining m-by-m block is uniform. Its
   nullity n means dim K=n+1. Partitioning E[w_x] by n yields
   `sum_n P(m,m,n)/(2^m*(2^(n+1)-1)) = 1/(2^(m+1)-1)`.

This uses a uniform U followed by a uniform nonzero kernel vector. Uniform
sampling of all admissible pairs (U,x) would be a different measure.
The packet now includes this proof, a named API statement, tests at m=0 and
m=3, and the old proof's m=1 counterexample. I recorded the source discrepancy
as `ArithmeticStatistics/E675`, affecting the proof, with the repair and the
dated correction search. The source URL is pinned to v2, its existing hash
is unchanged, and a selective preprint `sourceVersions` record states exactly
what was read. No published-version collation is claimed.

### /5 — accepted after API and direct-supplier corrections

Routes 2 and 7 separate CA.4's elementary Pell statements from CA.5's
order/unit comparison. Appending route 7 preserves the six historical route
positions; it avoids treating a CA.4-only verdict as acceptance of CA.5.
Items 5, 9 and 12 point to this new route. Their historical review still has
only six verdicts and must not be read as approving route 7.

The new CA.5 node assumes squarefree d>1 and d≡1 modulo 4. For a unit
u=(a+b√d)/2 of norm ν=±1, the parity condition and a²−db²=4ν show that
odd a,b are impossible when d≡1 modulo 8. When d≡5 modulo 8, the identity

`u^3 = [a*(a^2-3*nu) + b*(a^2-nu)*sqrt(d)]/2`

has integral coordinates, and its norm is ν³=ν. This proves the missing
converse to the already built integral-solution-to-unit theorem. It does not
claim that every half-integral unit itself lies in the smaller order.
Together with the retained d≢1 modulo 4 node, it covers every squarefree d>1.
Conrad supplies the ring-of-integers and Pell background; the modulo-8
calculation is the fix's elementary argument, independently checked here.

I added four named API entries, two explicit uses and four unit tests to the
new node. They distinguish d=5 and d=13 (cubing necessary), d=17 (units
already integral in the order), and d=21 (a norm-one unit does not imply
negative Pell, which fails modulo 3).

I also corrected its direct supplier `CA.5/zsqrtd-into-the-ring-of-integers`.
The map exists for any θ²=d, but the field-norm comparison and stated
bijectivity criterion need a genuine quadratic field. Those clauses now
assume squarefree d≠0,1 and K=Q(θ). At d=1, θ=1, K=Q, the map has a
kernel and sends 2 to an element of field norm 2, whereas `Zsqrtd.norm 2=4`.
That is now an explicit non-example. I retained the unrestricted map itself.

### /6–/13 — confirmed low findings, outside the selected fix scope

These remain recorded obligations, not rejected findings or completed fixes:

| Finding | Remaining work identified by the verifier |
| --- | --- |
| /6 | Restore the ramification bound at most 2 for zero raw cocycles, including the d=65 counterexample; reconcile E12, item 104 and the old review/report. Applications need the upper bound, not universal equality. |
| /7 | Correct item 69: the Artin-pairing kernel dimension is the next 2-power rank; its rank is the difference of successive ranks. |
| /8 | Put a>1 into the profitable-triple setup used for a nonzero expansion-map pointer, and record the omitted hypothesis. |
| /9 | Correct Smith's Proposition 4.1 citation, state r≥2, and retain the verifier's qualification on Proposition 4.4 at p.40 and the empty-S failure. |
| /10 | Supply the effective 8-rank input, including the required box form, using the qualified Watkins pointer. |
| /11 | Complete the prerequisite bibliography with the individually justified Rédei, Heilbronn, MacWilliams and Watkins inputs. Jutila was added as part of /3. |
| /12 | Resolve the dangling issue tags individually; record the projection-index slip, remove the notation-overload complaint, and correct the norm-transitivity argument. |
| /13 | Add honest preprint provenance to the extraction and later collate stated-result issues against an actually read published text. The new packet record for the separate Rédei source does not resolve this finding. |

## Source reading and pinned declarations

Fresh selective reading on 30 September 2026; these are not full-paper rereads:

| Public source | Passages inspected | SHA-256 |
| --- | --- | --- |
| [On Stevenhagen's conjecture, arXiv v1](https://arxiv.org/pdf/2201.13424v1) | pp.2,7,9,14,18,22–23,63,75–76,80,105 | `c7a93ffea06491d824d900fe067f6768246e84555fa8da8282833caac7850cbd` |
| [Higher Rédei reciprocity, arXiv v2](https://arxiv.org/pdf/2005.14157v2) | p.30 and Appendix A.1, pp.47–49; p.48 page image | `0846df8149196dc7f778d92ed04fae453293fbb99ad38e534bda8bbc2f167528` |
| [Smith, arXiv v2](https://arxiv.org/pdf/1702.02325v2) | Proposition 6.6 and proof, p.62; Jutila bibliography entry, p.84 | `e768b5ada1b9854b00692f0e60770b27b3346d7a041432eca3eb7b4bfa08a59e` |
| [Conrad, Factoring in quadratic fields](https://kconrad.math.uconn.edu/blurbs/gradnumthy/quadraticgrad.pdf) | pp.1–3, including Theorem 3.4 and proof | `521796e04af9775bf0abd1872d54dab41aed56a86f93a20c4192fb16bee91a51` |
| [Conrad, Pell's equation I](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf) | pp.12–13, Theorem 7.5 and proof | `69c8b41949356fa19e4cd4b74b523e016cc5a1fe6e70357c94168641da9da7a5` |

The new E675 search checked the arXiv version history and the authors' public
publication pages, plus title/Appendix A/A.7 correction searches. No correction
was located. The 2024 preprint is partly superseded by the 2022 Stevenhagen
preprint, whose p.76 uses the identity without reproducing this proof. This
is limited public evidence, not a claim that no correction can exist.

I consulted the reviewed library coverage for the affected quadratic,
multiquadratic, continuous-cohomology and maximal-pro-p suppliers. The
following are actual statement readings, not declaration-name matches:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:
  `inhomogeneousCochains.d`, `Rep.trivial`,
  `InfiniteGalois.normalAutEquivQuotient`, `LinearMap.ker`, `Module.finrank`,
  `Matrix.mulVecLin`, `Matrix.card_matrix`, `Matrix.card_GL_field`,
  `Zsqrtd.norm`, its multiplicativity and integer-cast formula, and
  `Zsqrtd.norm_eq_one_iff` (absolute norm one, not norm one alone).
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:
  continuous `C1`, `Z1`, `d1`, `d2`, their application/cocycle statements,
  `H1EquivOfSmulEqSelf`; `cochainsCor1` and its trivial-action formula,
  `explicitCor1Transversal`, its class formula and independence;
  `TauCeti.lWord`; `kummerMap` and its cocycle-class identification;
  `proPKernel`, `maximalProPQuotient`, closedness, pro-p property and lift
  universal property.
- At the same Tau Ceti pin, the quadratic declarations in
  `Quadratic/Conjugation/Ambiguous/Narrow.lean`,
  `Multiquadratic/Quadratic/GenusCharacter/PrincipalGenus.lean`,
  `Quadratic/TwoRank.lean`, and
  `Multiquadratic/CandidateGenusField/Relative/Artin.lean` cited by item 227;
  `NumberField.card_ker_toClassGroup_le_two` and
  `NumberField.NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one`;
  `NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`; and
  `NumberField.exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one`.

The positive-d, minimal-polynomial, generating-element, finrank-two and
prime-discriminant assumptions remain necessary when specializing these
statements. I did not certify every unrelated declaration in either packet.

## Validation and handoff

Both stock blueprint checks, using the pinned declaration index, report
zero errors and zero warnings. Intake file validation and `git diff --check`
pass. No link map or restructuring proposal is under review.

Independent exact-rational finite checks enumerated all m-by-m matrices over
F₂ for m=0,1,2,3, giving nullity counts respectively `(1)`, `(1,1)`,
`(6,9,1)`, `(168,294,49,1)`. The identity gives 1, 1/3, 1/7, 1/15.
Enumerating all m-by-(m+1) matrices also gives that same average for every
nonzero kernel-vector weight. All 12 independent (T,U) pairs at m=1 give
the printed-conditioning counterexample 1/3 versus 1/6.

For reproducibility, encode a row by its binary integer r; a vector v is in
the kernel exactly when `(v & r).bit_count() % 2 == 0` for every row.
Enumerate the row tuples, count kernels and average the indicated rational
weights. These finite checks supplement the general proof; they do not prove
it for all m. The older packet's m≤11 check is retained as historical evidence,
not represented as a new computation by this reviewer.

The Pell diagnostic enumerated squarefree d from 5 through 499 with d≡1
modulo 4, b from 0 through 100, ν=±1, and nonnegative a with
a²=db²+4ν and a≡b modulo 2. All 201 unit instances had integral cubed
coordinates and norm ν; every d≡1 modulo 8 instance had even a,b.
The general parity and polynomial arguments above provide the proof outline.

No Lean file was assigned or compiled; these are still unchecked plans, and
no pinned build was set up. A later implementation must formalize the finite
weight argument and the order comparison. The issue permits only the two
packets and this report, so no reader document, suggested Lean file,
extraction or old independent review was rewritten. Their next authorized
maintenance should propagate these packet corrections and review route 7.
The eight low findings remain for a separately scoped fix. There is no
remaining correction needed to accept the five selected fixes in these packets.
