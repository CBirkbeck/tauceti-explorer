# PKG-PolynomialGaloisGroupsPartII

Completed by Codex, session `codex-37UiPL`, 2026-10-14. Refs #9186.

## Result and where to resume

The three-file package is complete for independent package review:

- [README](../packages/PolynomialGaloisGroupsPartII/README.md): seven layers,
  all 32 accepted target nodes, all 38 definition-API statements, all 34
  accepted Checks, worked examples, exact supplier contracts and source locators.
  The helper tuple-generated field and reciprocal sum have their own API and
  three additional Checks each. All prose is authored in the roadmap's notation.
- [Suggested.lean](../packages/PolynomialGaloisGroupsPartII/Suggested.lean):
  compact representative signatures, real-bodied light definitions, eleven
  milestone/end theorems and 22 examples; no auxiliary proof development or
  admitted data definition.
- [metadata.toml](../packages/PolynomialGaloisGroupsPartII/metadata.toml):
  `topic = "math.NT"`.

The input packet, reader and original suggested file were not changed. No
review verdict is authored here; the next job is the independent package review.
Review can start at the supplier contracts, then Layer 3.4's analytic boundary
and Layer 5.3's five/four-witness argument. No package-writing work remains.

This package does **not** discharge PG2-G1 in the accepted plan. Its exact
supplier is `AnalyticNumberTheory:AN.2/mertens-prime-product`, whose constant
identification and prerequisite first-theorem proof have explicit gaps in the
supplier reader. The package retains that mathematical contract and explains
why an unspecified Euler-product bound would not suffice. The analytic supplier
must finish its own proof; nothing here asserts that the full analytic chain is
already closed or formalized. Upstream sequencing must also respect the
AnalyticNumberTheory dependency. The deterministic merging certificate and group
exclusions have no dependence on the probability estimates' analytic proof.

## Instructions and input read

Read WORKERS.md, PROTOCOL.md (including §§3–5, 12–15 and 20), the expansion
protocol, UPSTREAM_GUIDE.md and PACKAGE_REVIEW.md. Read the accepted 32-node
packet, full 751-line input reader and full 500-line suggested file. The packet's
independent review accepts the plan, with PG2-G1 explicitly inherited.

The style models read in full were current TauCetiRoadmap's
`StandardDistributions/README.md` and `PolynomialGaloisGroups/README.md`.
Their Suggested.lean forms were also inspected. The parent roadmap's equal-block
grid and its source ownership were checked directly. The relevant reviewed
library-coverage entries (parent Layers 0, 1, 5 and AN.2, AN.5), parent link map
and upstream order were used to check the interfaces and boundaries; these audit
records were discovery aids, not substitutes for reading Lean statements.

The pinned supplier signatures were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All 31 accepted baseline references
are represented by their mathematical contracts in the README; the exact
root-multiplicity, primitive recognition, Frobenius-lift and bounded
multiple-transitivity hypotheses were checked. In particular arithmetic
Frobenius existence does not impose unramifiedness, while the orbit/irreducibility
iff requires separability and positive degree.

## Current-upstream duplication pass

Searched current upstream READMEs and Suggested.lean files, including Completed
and the nine roadmaps newer than the atlas snapshot, by objects and hypotheses:
equal-part merging, reduction multiplicity, equivariant cycle fibres, tuple
adjoin/remaining-root quotients, multiple transitivity, partition-law estimates,
orbital distinguishers, minimum support and block-cycle divisibility. Reopened
the relevant parent and current-library matches. The inspected upstream commit
was `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither checkout was modified or built.

No full accepted target was found already supplied. One **partial duplication**
was removed from the proposed ownership:

| Accepted material | Existing supplier | Package treatment |
|---|---|---|
| Single-cycle length and fibre-intersection arithmetic inside `equivariant-cycle-fibres` and `block-orbit-cycle-divisibility` | `TauCeti.GroupTheory.Perm.Semiconj`: `Function.Semiconj.minimalPeriod_dvd`, `setOf_sameCycle_and_eq`, `ncard_sameCycle_and_eq_mul_minimalPeriod`; companion `TauCeti.orbitCount_le_mul_orbitCount_of_semiconj` | Exact current-library contract in the supplier section. §0.4 retains only assembly of the global occurrence-block merging witness. §5.1 retains invariant unions of whole blocks, equal-or-disjoint comparison, and application of the supplied divisibility to every cycle in that union. Each kept variant explicitly states its difference. |

The Semiconj module is newer than the elaboration pin. Suggested.lean needs no
new import of it: its global merging statement can already be stated using the
pinned permutation and multiset carriers. No surrogate data type is introduced.

Other matches were suppliers already recognized by the accepted plan:
`fullCycleType`, `factorDegrees`, simple-root stabilizer and two-transitivity
adapter, primitive transposition/3-cycle recognition and the parent imprimitivity
grid. These remain contracts, not new targets. Current
`NumberField/Frobenius/FiberCount.lean` counts prime ideals carrying an unramified
Frobenius, rather than integral roots reducing to a residue root, so it does not
supply §1.2. No ownership move to a higher roadmap is needed. Concrete coefficient
laws stay with ArithmeticStatisticsPartIIRandomPolynomials as a consumer.

## Source verification

Read the public primary PDFs, rather than relying on the input's summaries.
The downloaded versions matched the packet's source-version hashes. No PDF,
source text, screenshot or passage is submitted. The package has no verbatim
passage or section-by-section source summary. Locators use preprint PDF pages:

| Source | Material checked directly | Package locator treatment |
|---|---|---|
| Bary-Soroker–Koukoulopoulos–Kozma, arXiv:2007.14567v3, June 2023 | Introduction pp.4–5; §11 p.54; Definition 11.2, Lemma 11.3 and Claim 11.4 pp.56–57; §11.3 pp.57–58; Proposition 12.1 and complete Lemmas 12.2–12.9 proof chain pp.59–63 | Precise sections, results and PDF pages throughout Layers 0–3, 5–6; variants are described mathematically, rather than attributed as unchanged printed results. |
| Babai, author notes dated October 21, 2018 | §§2–4 pp.3–5, Definition 6.1 and Theorem 6.6 pp.5–6, full §8 pp.7–9, Exercise 9.5 and Corollary 9.6 p.10 | Direct group-orbital specialization, not a promised heavy coherent-configuration carrier. Visually inspected p.7: Lemma 8.5 asserts diameter two for the **complement**. The PDF text extraction drops the overbar. |
| Schomburg, arXiv:2209.12049v1, September 24, 2022 | Commutator support inclusion (2.1), pp.1–2; Lemmas 2.3–2.5, pp.3–4; Theorem 3.1 and full proof, pp.4–5 | Explicit degree bound `n ≥ 38`; denominators and integer rounding retained. |
| Bary-Soroker–Kozma, arXiv:1710.05165v2, August 8, 2019 | §3.1, Claim 1 and proof, pp.9–10 | Bibliographic version is pinned to v2, the version actually read, rather than an unversioned link. |

The exact AN.2 and AN.5 supplier nodes were read in their existing reader,
including the AN.2 unresolved proof inputs. The package imports those contracts;
it does not newly claim to have verified their external analytic sources.
There are no unverified locators on the package's own primary-source targets.
The journal BSKK text was not used; no claim about a journal correction is made.

## Accepted source repairs retained

These are inherited findings, not new plan errors or a new source-fix job:

1. **E1, Lemma 12.9, p.63:** the original companion part has no established
   `≤ n/4` bound, so the printed invocation of E₁ is not justified. The accepted
   repair chooses five distinct middle-range block unions, removes at most one
   filled union and three containing long output cycles, and obtains a short
   companion. In the largest range four nonfilled unions suffice. The four-part
   nondivisibility event has the original asymptotic failure rate; §3.9 states
   and proves the strengthened lower-tail argument explicitly.
2. **E2, Introduction p.4 and §11 p.54:** the reverse irreducibility/transitivity
   implication uses separability and positive degree. `(X²−2)²` has a transitive
   action on distinct roots while reducible. The package's definitions, adapters,
   arithmetic certificate and negative control retain the needed premises.
3. **E3, Lemma 12.8, p.62:** the cutoff comparison is
   `n^(κα) ≤ n^(1/40) < n^(1/8) < p`. The package uses this direction.
4. **E4, Lemma 12.9, Case 1, p.63:** the invariant-union argument uses the sum
   of the original part values, with its summand present. Occurrence pullback
   provides the required submultiset, rather than just an output sum.

No additional mathematical mistake in the accepted plan was established.
The current-library partial deferral above is the only target-ownership change.

## Adversarial mathematical pass

This pass checked every target and the defining/API claims, independently of
elaboration. The rows identify README subsections so the reviewer can repeat
it without scratch files. The common asymptotic guards are `N ≥ 3`, positive
`t,κ,δ,ε`, `κ ≤ 1`, `δ ≤ 1/10`, `ε < δ/2`, and
`0 ≤ θ ≤ δ/2−ε`; definitions are also checked outside those guards.

| Statements checked | Instances and reasoning tried | Outcome / convention pinned |
|---|---|---|
| §0.1 `EqualPartMerging` and its five APIs | Empty input at every real bound; nonempty input at `y < 1`; singleton blocks at `y < 2`; repeated zero entries in the raw natural multiset; positive repeated-part example and impossible `{2,3,6}` output; successive merging counterexample; repeated output sums in pullback | Empty blocks forbidden, occurrences retained, sum preserved. Reflexivity requires `y ≥ 1`; the raw relation does not require positive parts. Pullback selects occurrence blocks. |
| §0.2 `MergePerms` and five APIs | Empty carrier and degree zero; identity with all fixed-point parts; 5-cycle type `{5}`; independent partition degree differing from carrier; conjugation and arbitrary relabeling | Membership forces matching cardinality. Full cycle type, not support-only cycle type, is used. |
| §0.3 `BadTransitive` and four APIs | All transitive subgroups in degrees 0–3; identity and 5-cycle in regular C₅; conjugated/relabelled witness | The predicate is an existential union of subgroups, not the set of permutations outside Aₙ. Small-degree empty cases hold. |
| §0.4 global cycle witness | Bottom cycle length one, two-point fibre with identity/swap; bottom length three, two-point fibre with return identity/swap; positive `d,m` guards | Return sizes sum to `m`, producing `{3,3}` or `{6}` in the second example. Single-cycle arithmetic is imported; the new conclusion assembles all occurrences. |
| §1.1 maximum factor multiplicity and five APIs | Zero and unit give zero; cube over F₂ gives three; two distinct linear factors over F₃ give one despite equal degrees | The squarefree equivalence has nonzero/nonunit premises. Factor identity, not degree coincidence, is counted. The Lean example tests both repeated and distinct factors. |
| §1.2 fibre/root-multiplicity identity | Empty root set gives product one/multiplicity zero; distinct roots with injective map; `{0,2}` under reduction to F₂ collide | No injectivity premise; mapped linear products are monic/nonzero even with collisions. Multiplicity is fibre cardinality. |
| §1.3 ramified merging | `X²−2` at `p=2`; squarefree reduction with `M=1`; monic constant one excluded by positive degree; reducible separable polynomial allowed | No unramifiedness or irreducibility premise added. Nonzero monic reduction preserves degree. Integral roots give the equivariant residue map. |
| §2.1 tuple field, quotient and three APIs | Empty tuple; rational vs quadratic root-generated field; one root; all roots; nonmonic `2X(X−1)` leaves two | Actual intermediate-field adjoin, injective tuples, and monic divisor. Nonmonic `f` allowed; degree subtraction and separability APIs require separable `f`. Field and quotient Checks separate their failure modes. |
| §2.2 higher irreducibility and three APIs | `k=0`, `k>degree`, separable linear case; Φ₁₁ over ℚ at `k=1,2`; repeated quadratic | Explicit nonvacuous degree/separability guards. Predicate is defined through polynomial quotients, not transitivity. Monotonicity uses `1 ≤ l ≤ k`. |
| §2.3 stabilizer and quotient restriction | Empty tuple gives whole group; one tuple matches simple-root stabilizer; all-root tuple fixes generators; `j<n` ensures nonempty complement | Stabilizer equality needs no separability. The action comparison uses separability and ambient normal extension, not identification with a minimal quotient splitting field. |
| §2.4 multiple-transitivity iff | `k=1`, `k=2`, `k=n`; `k>n` intentionally excluded; repeated polynomial would falsify an unguarded statement | Complement has degree `n−j>0` for every `j<k≤n`. README and Lean both quantify over the same distinct-root tuples and arbitrary base field. |
| §2.5 alternating recognition | Cubic: irreducible image C₃ or S₃; split reducible cubic fails; degree two would give inadmissible `k=0` | Guard `n ≥ 3`. Statement recognizes alternating containment, not equality with alternating; image subgroup uses the faithful root action. |
| §3.1 law, three APIs and harmonic helper | Zero indicator and `m=0`; singleton indicator at two; constant indicator through two; repeated pair diagonal; zero measure vs probability normalization; larger C and smaller positive κ | Reciprocal masses `0,1/2,3/2`; counts are occurrences. Law and `IsProbabilityMeasure` are separate. Lower-tail right sides are nonnegative; weakening κ is monotone because mass is nonnegative. |
| §3.2 five events and three APIs | Repeated `{2,2,4}` fails strict gcd bound at exponent zero; degree one/α=0 passes E₃; degree three fails four-witness E₅; `{3,3}` fails E₂ at δ=2 | Definitions retain total logarithm outside the asymptotic range. E₂ uses divisibility of n and `1≤j<r`; complement sums to `n−U.sum`. E₅ counts four actual occurrences. Lean includes passing and failing event controls. |
| §3.3 uniform harmonic masses | Inclusive endpoints, floor/ceiling equality; r=2 and maximal `r≤n^α`; empty permitted α interval; endpoint α=ε/2 | Multiples are `(1/r)` times a harmonic interval. Positive lower endpoint grows uniformly, so one error bound and threshold suffice. No θ-dependent constants. |
| §3.4 nonsmooth harmonic mass | k=1 belongs to smooth contribution; prime endpoint equality goes to smooth side; coefficient after subtracting exact Mertens mass | `exp γ<2` gives strict coefficient margin above 1/4. An unspecified O(log x) estimate fails to supply the margin. Supplier gap remains explicit. |
| §3.5 large-gcd failure | Pair diagonal; common divisor threshold at least two; equal cutoff endpoint | All pair events are in the law's `k,l≥2` range for sufficiently large n. Reciprocal-square tail and two harmonic sums give the stated bound uniformly. |
| §3.6 subsum failure | r=2, complement j↔r−j; equal upper half endpoint; n positive; divisor constant at small n | The sum is an integer because r divides n, is in the law's range, and has positive denominator. AN.5 constant retained before asymptotic absorption. |
| §3.7 long-part failure | α=ε/2; real upper cutoff converted to integer m; failed count is strict while law threshold is non-strict | Uniform mass lower bound dominates half the leading logarithm. Error factor preserves `(log n)^κ n^(−κα)`. |
| §3.8 large-prime failure | Cutoff √n/3 vs n/log n; exact prime threshold; κ near zero but fixed positive | Starting degree depends on fixed parameters. The inherited analytic input enters only through §3.4; exponent is `−κ/4`. |
| §3.9 four-part failure | r=2; 3≤r≤log n; log n<r≤n^(κα); r≥n^(κα); threshold count≤3 | Lower-tail mass dominates three uniformly. Five E₃ occurrences are distinct by E₁; at most one is divisible by a large r. All three union ranges retain the claimed rate. |
| §4.1 minimum support and four APIs | Trivial group, empty carrier, S₂ swap, A₃ 3-cycle; impossible support one | `none` iff trivial, attained minimum otherwise, always at least two. Both prose and Lean use `Option ℕ`. Identity is excluded from the minimizing set. |
| §4.2 distinguishers and three APIs | Diagonal pair; trivial group on distinct points; full symmetric group in degrees two and three; an actual transporting element fixing z | D(x,x)=∅; trivial distinct D=univ; symmetric distinct D={x,y}. Inverses give symmetry, and D(x,gx) lies in support g. |
| §4.3 orbital connectivity | Empty/singleton carrier cannot supply a distinct pair; regular C₅ off-diagonal orbit; diagonal orbit would not connect | Distinctness excludes singleton components; primitivity includes pretransitivity. Undirected relation includes the inverse orbital. |
| §4.4 Babai bound | Regular C₅ gives D=n; full symmetric group shows why non-two-transitive is required; complete symmetrization vs noncomplete one | Complement diameter two is used correctly. Nonzero valencies justify division. Weighted suborbit tree counts at least n−1 distinguishable color pairs; D²≥2(n−1)/3 handles large diameter. |
| §4.5 Bochert bound | m=n immediate; m≤3 excluded by primitive recognition; m=4,…,9 in `n≤4m+6/(m−3)`; m≥10 integer rounding | `m−3>0`; fixing conjugates nonempty for m<n. The largest finite excluded upper bound is below 38. Fraction `<1` forces integer `n≤4m`. |
| §4.6 primitive minimum theorem | Degrees 5–37 with m≥4; n≥38 branch; alternating or symmetric hypotheses; trivial group excluded by primitive degree guard | Index two excludes all groups containing Aₙ. Small-degree branch avoids using Bochert beyond its source range. All real square-root comparisons hold. |
| §5.1 block-union adapter | Fixed point with singleton cycle; two blocks of size three with within-block swap vs cross-block swaps; distinct cycles sharing or avoiding a block orbit | Uses actual projected orbit, not an arbitrary divisor. Fixed-point length is one despite empty cycleOf support. Whole-block unions are invariant and equal or disjoint. |
| §5.2 primitive exclusion | At most three parts >n/4; prime uniqueness among small parts; bounded merging with p larger than the merge bound; exponent that kills all other cycles | Correct exponent direction retained. Chosen cycle remains unmerged; powering is nonidentity and has support≤√n/3, smaller than primitive minimum for large n. No exceptional long cycle is left with p dividing its length. |
| §5.3 imprimitive exclusion | Small/middle/large r, including equal boundary r=n^(1−α); r,s>1; filled vs nonfilled union; short companion vs uncontrolled companion | E₂ handles small r. Five middle or four large disjoint unions avoid at most three long cycles. Both original parts in the E₁ contradiction are≤n/4; divisibility gives gcd≥r'/m. Strict thresholds and α=δ/4−θ/2 have the correct direction. |
| §6.1 arbitrary-law criterion | θ=0 and θ=δ/2−ε; law varying with n; primitive vs imprimitive subgroup witness | Bad event lies in finite union of five failures. `κα≤δ/4` and `κα≤κ/4` allow rate absorption; one B,N is chosen before ν,θ,n. |
| §6.2 arithmetic certificate/inclusion | Monic unit excluded by irreducibility; M≤y forces y≥1 for positive degree; reducible/repeated quadratic; ramified prime; root carrier vs Fin n | Image group is a transitive witness. Carrier transport preserves cycles and alternating comparisons. Unconditioned coefficient laws need irreducibility/separability failure events; no concrete random-law estimate is silently assumed. |

A scratch finite enumeration additionally checked 32,953 equivariant permutations
with 1–4 blocks and fibre size 1–3. It verified every cycle's equal fibre
intersections, actual projected orbit, period product, invariant block union,
all-cycle divisibility and equal/disjoint unions, including singleton cycles.
When the quotient is one cycle it verified the return sizes sum to the fibre
size. All ten subgroups through degree three were enumerated to check
BadTransitive's empty small-degree cases, minimum support≥2, distinguisher
symmetry, diagonal/trivial/symmetric values and support inclusion. The Bochert
finite endpoints and the primitive small-degree comparison were computed as well.
These finite checks corroborate the conventions; they are not proofs of the
asymptotic results or of the admitted Lean theorems.

## Validation

- `lean-check research/blueprint/packages/PolynomialGaloisGroupsPartII/Suggested.lean`
  exited **0** against the shared pinned build. There were **33 warnings**, all
  exactly declarations using `sorry`, and no other warning or error. Memory
  availability was checked before compiling. No language server or build was run.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PolynomialGaloisGroupsPartII.json`
  reported **0 errors, 0 warnings**. This validates the unchanged input's
  structural closure, not its inherited analytic proof.
- Target/API inventory: all 32 target names and all 38 API names matched the
  authored README; all 34 accepted Checks were read and retained. Every definition
  has at least three discriminating prose Checks. The compact Lean keeps one or
  two examples per retained definition, without mirroring the full API.
- README and Lean generality were compared for all eleven theorems and all
  retained definitions: field/ring hypotheses, separability, monicity, degree
  guards, carrier action, measure normalization, constant dependencies and
  minimum-support conventions agree.
- `python3 research/blueprint/intake.py check-files` on the four deliverables
  reported **4 files, 0 problems**. `git diff --check` is the final whitespace
  check; its result is recorded in the pull request.

Only the issue's four authorized deliverables are submitted. The next worker
needs no scratch artifact: statements, proof repairs, supplier boundaries,
locators, duplication adjustment and repeatable mathematical audit are recorded
above and in the package.
