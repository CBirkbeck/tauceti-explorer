# Handoff: independent BSTTTZ errata review

Job: REV-ERRATA-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20
Issue: #1869
Worker: Codex — codex-a71f92
Date: 23 September 2026
Status: partial checkpoint; published-version review NOT complete.

## Claim and independence

The queue had no available restructure, naming, paper, fix or errata issue when this review was selected. The complete issue was read before claiming. Claim comment 5794444810 was posted at 12:02:47Z; bot confirmation 5794447082 at 12:02:57Z explicitly cited it. The whole issue was then reread. The reviewed errata were authored by Claude Code, cc-442dc5, not this session.

Baseline for this continuation: main 04918904d32af6b0d6d10660079d189df5f5d555. WORKERS, both protocols and UPSTREAM_GUIDE were checked unchanged from the previously read versions; blueprint Protocol §18 and the completion/intake rules were reread.

## What is saved

The errata JSON preserves all seven IDs, extraction links and printed quotations. It adds six scoped review verdicts (E1–E4, E6, E7), while E5 has an explicit unresolved independentCheck and no verdict. None of these verdicts certifies that the inaccessible JAMS article has the same wording. The errata Markdown now gives the independent calculations and version limitations.

Refinements:

- E2 uses proved fixed-degree magnitude bounds, not unproved constants 1. Negation alone does not change the quadratic coefficient's sign.
- E5 fixes e=max(t,1), checks the strong-induction replacement and leaves the alleged source gap undecided.
- E6 checks Kane's published hypotheses and positive-density conclusion, separates Selmer size from Mordell–Weil rank, and does not certify the inherited all-degree repair.
- E7 distinguishes Sedunova's *printed* q-independent constant from a valid q-dependent correction; a direct graph example shows the uniform full-range estimate fails. The verdict concerns the missing deduction, not falsity of the target theorem.

No new sourceIssue is added. Four inherited corrections are retained as previousCorrection for traceability; previousReason is retained for E5–E7. Original prose for E1, E3 and E4 is retained in JSON. No extraction, roadmap, library baseline, registry or queue file was edited. No Lean file is part of this job or claimed to compile.

## Why the final review report is not submitted

The queue's deliverables_complete function treats an ordinary review as complete once *all named output files exist*, regardless of a prose partial label. Therefore this checkpoint deliberately does NOT create

research/blueprint/reviews/REV-ERRATA-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.md

on the publication branch. All current review evidence is in the errata Markdown and this handoff instead. This is an honest incomplete submission, not an accepted final review. The finished-job gate in scripts/errata.py must keep these entries awaiting review until a later worker finishes the job. Do not add a token/stub final report merely to satisfy file existence.

## Fresh source provenance

All sources were fetched into scratch space, not committed. No restricted source was accessed.

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| BSTTTZ author copy, dated 18 February 2017 | https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf | bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec |
| BSTTTZ arXiv v1 | https://arxiv.org/pdf/1701.02458v1 | 99ee35275ecb42c52cd8bbc615538dbe6094326fb72894e88ef82c0b89286871 |
| MPG public *preprint* | https://pure.mpg.de/rest/items/item_3277755_1/component/file_3277756/content | 04e4e52e2e7d2902cfe6ef7c37793650b5a7c3128554cdc3a7a577fb176deb9d |
| Klüners–Wang v2 | https://arxiv.org/pdf/2003.12161v2 | 007024624493c279c954492a8e56d65e32883694499989f31faa0266803b6d04 |
| Kane author copy | https://cseweb.ucsd.edu/~dakane/selmer.pdf | 52ce7335c68f1af4500c5c6a1a9e818e15b35b789c2bda59a68c35231a71a644 |
| Kane published, ANT 7 (2013), 1253–1279 | https://msp.org/ant/2013/7-5/ant-v7-n5-p09-p.pdf | 4e99bad37d914680bd247498f6ccdcdd8dcda465e90ad19e7dd99f94ed95fe10 |
| Sedunova v1 | https://arxiv.org/pdf/1506.08757v1 | 7b7117e414c126f41cb3b5fe22044034652e0b97d2e12660b0afdc7b5228b3f0 |
| Sedunova published, Acta Arith. 181.4 (2017), 321–331 | https://www.impan.pl/shop/publication/transaction/download/product/111360 | b1737ef1b1b7f8893c73f94bb32936c4d328c102b33b96ba429ea61cd2c72774 |

Reading scope: the complete 13-page BSTTTZ author copy; BSTTTZ v1 pp.1–4, 6–7 and 10–12; MPG first page and metadata (not a fresh full reading); Klüners–Wang v2 pp.1–5, including the relative-torsion proof; Kane author pp.1–3 and published pp.1253–1255; Sedunova v1 pp.1–6 and published pp.321–322. Key page images: BSTTTZ author pp.2 and 4, v1 p.10, Sedunova published p.321. Supplier-theorem verification is not a claim to have checked all of Kane's analytic proof.

Version/erratum search on 23 September 2026: AMS public article and accepted/published PDF URLs failed/403; JSTOR exposed no text. MPG metadata says public file_3277756 is a preprint and publisher file_3277757 is audience-restricted. The November 2020 date on the public PDF is not evidence of a later author revision. ArXiv lists only v1; Crossref has no update-to and an empty relation; author pages (Taniguchi, Thorne, Tsimerman) and title+erratum/corrigendum searches revealed no correction. Do not turn this limited search into an exhaustive claim.

## Resume here

1. Obtain an authorized public/maintainer-provided published or accepted JAMS text. Collate each locator; if corrected there, record that version in known instead of labeling it a new published error.
2. E5: check the intended relative-genus estimate, including arbitrary base 2-class groups, ambiguous versus full 2-torsion, ramified infinite places and unramified extensions. A weaker theorem by itself is not a counterexample. Keep or reject the finding only with a specific argument.
3. E6: fix a discriminant convention for arbitrary integral hyperelliptic models and verify the corresponding descent bound in both odd and even degree. The false Selmer-only-in-D_K assertion is already refuted; the rank assertion is not independently refuted.
4. Reassess E7 after final-version collation. Its Sedunova supplier statement is epsilon-lossy in the published source too; do not discard losses or assume uniformity without proof.
5. Only then write the named final review report, retain/correct every verdict with reasons, run checks, and let intake record completion.

## Reproducible diagnostic checks

The following Python-standard-library program was run successfully. It provides finite checks of the elementary identities/counterexamples, not a proof of class-group bounds, Selmer distributions or an endpoint estimate. Output:

    volume_checks=27; coefficient_checks=343; residue_checks=840
    char_two_point_counts={2:3,4:9,8:9,16:9}
    graph_counts=5; induction_exponents=48
    split_cubic_discriminants=100; Kane_square_tests=[-1,2,2]

The characteristic-two proof over the algebraic closure is the inversion argument in the errata report, not inference from these four finite fields. The graph counterexample holds for every q by degree counting, not just the five prime fields checked.

```python
"""Independent finite diagnostics; not proofs of Selmer distribution or genus bounds."""
from fractions import Fraction as Q
from itertools import product
from math import pi, prod, sqrt

volume_checks = 0
for r, s in product(range(7), range(4)):
    if r + 2 * s:
        assert 2**r * pi**s >= 2**(r+s) - 1e-12
        volume_checks += 1
assert sqrt(2*pi) < 4 < 2*pi

coefficient_checks = 0
for roots in product(range(-3, 4), repeat=3):
    x, y, z = roots
    radius = max(map(abs, roots))
    a, b, c = -(x+y+z), x*y+x*z+y*z, -x*y*z
    assert abs(a) <= 3*radius
    assert abs(b) <= 3*radius**2
    assert abs(c) <= radius**3
    delta = a*a*b*b - 4*b**3 - 4*a**3*c - 27*c*c + 18*a*b*c
    assert delta == (x-y)**2*(x-z)**2*(y-z)**2
    assert abs(delta) <= 486*radius**6
    coefficient_checks += 1

residue_checks = 0
for q, genus, a in product(range(2, 30), range(6), range(-2, 3)):
    p_one = (1+a+q)**genus
    p_reciprocal = (1 + Q(a,q) + Q(1,q))**genus
    assert p_reciprocal == Q(p_one,q**genus)
    residue_times_log_q = p_reciprocal / (1-Q(1,q))
    assert q**genus*(1-Q(1,q))*residue_times_log_q == p_one
    assert q**genus*residue_times_log_q != p_one
    residue_checks += 1

def mul(a, b, modulus):
    out = 0
    degree = modulus.bit_length()-1
    while b:
        if b & 1:
            out ^= a
        a <<= 1
        if a & (1 << degree):
            a ^= modulus
        b >>= 1
    return out

char_two_counts = {}
for modulus in (0b11, 0b111, 0b1011, 0b10011):
    size = 1 << (modulus.bit_length()-1)
    points = [(x,y) for x,y in product(range(size), repeat=2)
              if (mul(y,y,modulus)^y) == mul(mul(x,x,modulus),x,modulus)]
    assert all((x,y^1) in points and (y^1) != y for x,y in points)
    char_two_counts[size] = len(points)+1

def poly_mul(a,b,q):
    out = [0]*(len(a)+len(b)-1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] = (out[i+j]+x*y)%q
    return tuple(out)

graph_checks = 0
for q in (2,3,5,7,11):
    count = 0
    for x in product(range(q), repeat=3):
        y = poly_mul(x,x,q)
        if not any(y[3:]):
            count += 1
    assert count == q**2
    graph_checks += 1

exponent_checks = 0
for n in range(6,102,2):
    m = n//2
    base_exp = Q(1,2)-Q(1,2*m)
    assert base_exp == Q(1,2)-Q(1,n)
    assert base_exp < Q(1,2)-Q(1,2*n)
    exponent_checks += 1

assert [prod(c-d for d in (0,1,-1) if d != c) for c in (0,1,-1)] == [-1,2,2]
for N in range(1,101):
    roots = (0,N,-N)
    assert prod((roots[i]-roots[j])**2 for i in range(3) for j in range(i+1,3)) == 4*N**6
print({"volume_checks": volume_checks, "coefficient_checks": coefficient_checks,
       "residue_checks": residue_checks, "char_two_point_counts": char_two_counts,
       "graph_counts": graph_checks, "induction_exponents": exponent_checks,
       "split_cubic_discriminants": 100, "Kane_square_tests": [-1,2,2]})
```

## Repository checks

Passed:
- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.json`.
- Three-file intake path/content check: zero problems.
- 65 repository tests: check_errata 3, errata 4, source_issues 7, intake 29, issues 22.
- Preservation check: all seven IDs, extraction links, printed quotations, kinds, reach/known labels and inherited search entries retained.
- Completion-gate check: the review is incomplete; all seven entries remain "awaiting review" in the collector.
- Fresh-main comparison at b99c6bdc153f167f88cfd11cc639353dd430480b: the two original errata files, WORKERS and blueprint PROTOCOL were unchanged before overlaying this checkpoint.

Only the errata JSON, its Markdown, and this handoff are submitted. Source PDFs and the scratch diagnostic script are not submitted; the script is reproduced above.
