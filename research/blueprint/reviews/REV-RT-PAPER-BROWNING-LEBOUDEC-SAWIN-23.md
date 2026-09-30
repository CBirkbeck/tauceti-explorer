# Verification of RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23

Job REV-RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23, issue #4066.
Codex, session `codex-J6LwjP`, 30 September 2026. Reviewed base `fdcd54e`.

All six findings are confirmed: three medium, three low. Several proposed repairs
need the qualifications below. This is a verification of the six findings, not a
new acceptance audit of all 129 extracted items or all nineteen source issues.
I did none of the extraction, its independent review or this red team. Their
recorded authors are respectively codex-a71f92/cc-442dc5, cc-7b31c4 and cc-f805bf.

## Sources and inspection boundary

Downloaded and read the relevant passages of these public PDFs on 30 September:

| Source | Passages checked | SHA-256 |
| --- | --- | --- |
| [Browning–Le Boudec–Sawin, arXiv v1](https://arxiv.org/pdf/2006.02356v1) | pp.1–5, 12, 20–21, the cited W estimates pp.44,49–52,57, and local-statistics statements pp.50–57 | `210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb` |
| [Poonen–Voloch, author PDF](https://math.mit.edu/~poonen/papers/random.pdf) | pp.1–3, particularly Remark 2.1 and Theorem 3.6 with proof | `e4ec66ff04e6b6bf86f08bd66756e415c6e6be884cf1d49fa36d9428c4199045` |
| [Bhargava, arXiv v1](https://arxiv.org/pdf/1402.1131v1) | pp.2–3,5,8,11: Theorems 2,4,11 and the transfer to regions | `cc7e4d90291c7859c1fb48defd315e8efdf90b39a09677ec1bc76a9ca0bdfd78` |

Visually checked the rendered BLS p.5 bound and PV p.3 codimension inequality.
The [Annals landing page](https://annals.math.princeton.edu/2023/197-3/p03)
identifies the revised 22 July 2022 article, pp.1115–1203. Its article text was
not obtained. Neither this review nor the extraction establishes that the 2020
preprint's source issues survive into that version of record.

Read the extraction, route briefs, source-version information, the red-team
result/report, and the relevant prior review explanations. Compared current
ArithmeticStatistics, GeometryOfNumbersAndQuadraticArithmetic and
FiniteFieldsAndCharacterSums nodes and coverage, the reviewed library audit and
the pending Heights Part II design. The new library dependency used here was
read directly at the pin:
[Nat.primorial_le_four_pow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Primorial.lean#L141).
No broader claim to have revalidated the extraction's six other library citations
is made. The baseline remains Mathlib `082e2d3`, Tau Ceti `f790474`.

## 1. Missing version record — confirmed, medium

An in-memory reproduction using the repository's actual functions gives:

| Input | `versions_checked` | `provenance` | `exposure` for this paper |
| --- | --- | --- | --- |
| Unmodified extraction | missing-sourceVersions error | published | omitted |
| Copy with its actual preprint reading declared | no errors | preprint | one row, E3 |

The existing source metadata explicitly says the published text was not obtained.
E3 is a stated-result finding; its cited logarithmic bounds occur on pp.20–21.
The fallback's publisher-host and `published text` matches lose the negation.
The explicit preprint declaration proposed by the red team repairs this record.
Its 22 September reading date is already recorded in the extraction; this
verification's fresh download is dated 30 September. Keep both facts distinct.

The general free-text classifier defect deserves a separate authorized tooling
fix. I did not mutate the extraction, generated worklist, or classifier while
testing the before/after behavior.

## 2. Duplicate ST.5 carriers — confirmed, medium

The following nodes already plan the claimed mathematics:

| Extracted item | Existing node in ArithmeticStatistics |
| --- | --- |
| `/sigma` | `ST.5/local-density-of-a-form-modulo-q` |
| `/veronese` | `ST.5/coefficient-vector-form` |
| `/veronese-gcd` | `ST.5/veronese-minor-valuation` |

The first normalizes the count of primitive roots modulo Q by Q^n and supplies
coprime CRT multiplicativity. The second uses unweighted degree-d monomials.
The third handles capped valuations at every prime power; for primitive,
independent integral vectors it gives BLS Lemma 3.11. Thus these are substantive
overlaps, not merely similar names. Mark them planned, align owner metadata,
remove the duplicate route-7 assignments and update the pending design brief.

The packet is partial and these are planned results. Keep the Part II's own
norm estimates, primitive-image consequences, specialization at W(B), real
factor and subsequent estimates. Do not interpret the red team's word “only”
as deleting the rest of the 74-item Part II route.

The general rank-k maximal-minor gcd belongs with GN.0's lattice interfaces.
Its extraction entry is still missing; GN.0's existing lattice foundations and
saturated-basis work are not a completed minor-gcd API. Request that supplier
and identify ST.5's rank-two definition with its specialization. Do not invent
a resolved node id or rebuild the audited lattice/covolume foundations.

## 3. Euclidean local-density proof — confirmed, medium

PV orders coefficient vectors by the sup norm. Its proof uses smooth reduction
and Hensel, uniform Lang–Weil, and the codimension-two bound for geometrically
reducible forms. Equivalent norms alone prove neither equality nor existence
of the ball density. The present ball item's short note and ST.2 coverage leave
these proof obligations unassigned.

The existing ST.2 quantitative Ekedahl node applies to any compact coefficient
region. With N coefficients, k=2 and radius A, its normalized tail is
`O(1/(M log M) + 1/A)`. For fixed d,n this supports the required order of limits:
first A tends to infinity, then the cutoff M does. The repair should expose:

1. The real-soluble cone, its null boundary, and its normalized ball measure.
   Its boundary lies in the discriminant locus because a regular real zero
   persists and projective space is compact. Reuse/generalize `/null-singular`
   and its discriminant-nullity obligation; its present n>=3 range is narrower
   than the density family's conic case.
2. Finite local-condition measurability and boundary-nullness, approximation by
   congruence classes, and lattice equidistribution in the ball.
3. Uniform existence of a **smooth** finite-field point: apply the planned
   uniform Lang–Weil bound and subtract a uniformly bounded lower-dimensional
   singular locus, then lift. Counting some point is insufficient for Hensel.
4. The closed geometric-reducibility locus from the multiplication maps on
   projective coefficient spaces. PV's displayed binomial inequality gives
   codimension at least two outside (d,n)=(2,2); retain the finitely many bad
   primes when spreading this model out over the integers.
5. The tail estimate, positivity of the local product, and the passage to
   primitive vectors and the sign quotient. Account for normalization of the
   p-adic factors under scalar multiplication; do not insert a zeta factor
   without the corresponding change of denominator.

The real ball factor need not equal PV's box factor. The conic zero-density
case is separate: bound the bad count in a containing box and compare the
positive leading terms of total primitive counts. This proves zero density
without the unavailable codimension-two estimate.

`FF.2/uniform-lang-weil-estimate` is a legitimate planned supplier, but its own
proof explicitly leaves Betti-number and geometric inputs unresolved. Propagate
those obligations rather than describing it as a closed or formalized theorem.
Add the accepted route to ST.2's remaining coverage at minimum; a fully closed
node requires the above decomposition. Avoid a cycle back from ST.2 into the
consumer Part II when sharing discriminant-nullity helpers.

## 4. The smoothing modulus needs only an elementary bound — confirmed, low

The pinned theorem states `n# <= 4 ^ n` unconditionally. For w>=2, put
`theta(w)=sum_{p<=w} log p`. It yields `theta(w)<=w log 4`, using floor(w).
Splitting the prime count at sqrt(w) gives

```text
pi(w) log w <= sqrt(w) log w + 2 theta(w),
log W <= pi(w) log w + 2 theta(w)
      <= sqrt(w) log w + 4(log 4)w <= 6w eventually.
```

Hence `W <= B^(6/log log B)` for sufficiently large B. This does not prove the
printed constant 4 or the asymptotic `log W ~ 3w`. Preserve the latter as an
optional source statement requiring PNT; separate the weaker bound actually
consumed. Pages 44,49,50,52,57 use subpower growth, so their auxiliary numerical
constants can change without changing the final estimates. In particular,
update the W-squared terms and B-to-A conversions, not just the first display.

## 5. Route explanations — confirmed, low

The review JSON incorrectly connects route 4 to sigma and its convergence.
Route 4 carries PV/Serre local-solubility densities and the Euclidean transfer;
route 5 carries Lemmas 5.4–5.7 and the Browning–Matthiesen Hensel input. Lemma
5.1 is route 7's comparison estimate. Make those distinctions explicit in the
JSON and the report; the report's current broad wording is ambiguous rather
than reproducing every erroneous JSON phrase.

For an independent check of the convergence caveat, setting `f=X_0^d` gives
`sigma(f;p^r)=p^(r-ceil(r/d))*(1-p^(-n))`, by requiring x_0 divisible by
`p^ceil(r/d)` and one other coordinate a unit. For d>=2 it is unbounded.
BLS p.51 explicitly says these limiting assertions are unused. Keep the
accepted route verdicts and the existing E13 qualification.

## 6. Bhargava's region theorem and its inputs — confirmed, low

Bhargava's Theorem 2 covers every compact region described in section 1.1,
including the ten-dimensional Euclidean ball. The extraction's box statement
is a valid specialization, not a false theorem. Record the fuller statement
and the proof dependencies: the Bhargava–Skinner rank-one theorem, 3-Selmer
parametrization/counting, and the fundamental-domain covering argument.
Theorem 11 supplies the positive proportion of soluble generic Selmer elements
used at the end of the proof on p.11.

ST.4 already lists `PAPER-SKINNER-20` route 6/Theorem D as remaining; ST.1/ST.2
and ST.5 already carry Selmer parametrization/counting obligations. Connect
those suppliers and update the source-acquisition note when incorporating this
reading. No new duplicate rank-one owner is needed.

The extraction's `[-A/sqrt(20),A/sqrt(20)]^20` is useful and dimensionally
correct for BLS's **cubic-surface** application on p.3. Restricting a quaternary
cubic to a coordinate hyperplane leaves ten ternary-cubic coefficients and ten
free coefficients. An inscribed product box transfers the positive proportion
to twenty-dimensional surface balls. Alternatively use two ten-dimensional
regions whose product lies in that ball. Justify the primitive/sign passage;
the ten-dimensional theorem alone is not the whole surface argument.

## Validation and limits

Ran the red-team review checker, the submission path check and `git diff --check`.
The before/after provenance experiment changed only an in-memory copy. The two
deliverables contain all verdicts and reproduction details; the reviewed
extraction and packets were not edited. No Lean file was changed or compiled:
no existing build at both pinned commits was available, and none was installed.
