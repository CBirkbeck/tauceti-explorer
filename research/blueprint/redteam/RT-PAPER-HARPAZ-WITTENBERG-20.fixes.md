# Harpaz–Wittenberg source-record reconciliation

Job `FIX-RT-PAPER-HARPAZ-WITTENBERG-20`, issue #5006. Codex, session `codex-J6LwjP`, 30 September 2026. Claim comment 5918326524 was confirmed by the bot before work began. The complete red-team finding and independent verification were read.

**Finding 1 is fixed in the assigned extraction and reader.** The extraction now has an empty `sourceIssues` list and a `sourceIssueReferences` pointer to the two entries in the [canonical reviewed errata file](../errata/PAPER-HARPAZ-WITTENBERG-20.json). Read-only register collection returns exactly two HW20 records, each once and each with a valid independent errata-review verdict. The canonical errata file is already correct and is unchanged.

## Mathematics and changes

E1 affects the **proof** of Remark 4.5. Item 75’s theorem statement, status and route are preserved. Its locator and note now identify rational connectedness as a sufficient restricted repair, not a demonstrated necessary hypothesis. The author text’s §4 fixes a rationally connected generic fibre before Theorem 4.2; the remark applies that theorem in greater generality. Proposition 3.3(i) already supplies the geometric section without that hypothesis, and Wit18 Remark 3.9 states the broader implication. Thus no counterexample to the implication has been established. The section-based fibration variant still needs to be stated and justified. Structured gap G1 keeps that obligation open for `HeightsRationalPointsPartIIHomogeneousMassey`; the route’s existing brief already excludes G1 as a closed proof input. The Sko90 acquisition caveat is retained, and this fix does not rely on the historical transcription mentioned in the errata review.

Items 104 and 105 now use **m≥2**, following Demarche’s author §8. Their notes explain that Q₄≅C₄ is the cyclic endpoint and that m≥3 is the non-abelian subfamily. The presentation at m=2 gives x=y² and y⁴=1. Demarche explicitly includes this rational quotient case. No group defined by that presentation at m=1 is asserted. The reader’s introduction, Grunwald discussion, source-finding section and current summary are reconciled with these assessments.

The result retains 150 items: 7 library, 12 planned, 131 missing, all missing items routed once across the same fourteen routes. The stale partial-status prose is replaced by the current distinction: the extraction is complete, but the general proof obligation G1 is open. No library credit, planning status, route or additional roadmap is introduced.

## Verifier corrections and maintainer handoff

The verifier narrowed the generated fix instructions. Accordingly:

- The historical appended paper-review section stays verbatim, and `REV-PAPER-HARPAZ-WITTENBERG-20.md` is not edited. The current reader and source reference explain that REV-RT-PAPER-HARPAZ-WITTENBERG-20 supersedes that review’s conflicting E1/E2 assessments. This worker assigns no new independent verdict.
- The register-writing CLI `scripts/errata.py` is not run. `REGISTER.md`, `data/source-issues.json` and all other generated files are unchanged. Intake’s regeneration after merge should remove the extraction copies, leaving only the errata-file E1 (`the proof`) and E2 (m≥2).
- The maintainer should preserve the superseding-verdict link in any presentation of the old paper review. The verifier also identified wider duplicate-ID collection and the missing paper-level `sourceVersions` check as tooling matters; this job does not change those tools or attempt to certify their current global counts.
- The existing homogeneous-spaces design must justify Remark 4.5’s general section-based argument before treating G1 as closed. This is a request to the already named owner, not a new-roadmap proposal. Its blueprint is not an assigned output of this job.

## Reading boundary

Fresh focused readings on 30 September:

- [HW20 author manuscript](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), pp.4,12–17: the quaternion paragraph, Proposition 3.3(i), §4 assumptions, Theorem 4.2 and Remark 4.5. Read through the web text reader; the direct local download failed DNS resolution. No fresh byte/hash verification is claimed.
- [Demarche author manuscript](https://webusers.imj-prg.fr/~cyril.demarche/articles/BMgroupes.pdf), pp.12 and 26: Corollary 4.5, Remark 4.6, §8’s presentation and cyclic endpoint. Downloaded SHA-256 `3b4b0665958266bf8e79f10989dcc30be1c59c3711201727a380c25877dbe929`, matching the prior review.
- [Wit18](https://www.math.univ-paris13.fr/~wittenberg/slc.pdf), the §3.3.1 hypotheses and Remark 3.9, pp.20–22, through the web text reader. Its direct local download also failed DNS resolution.

The canonical findings remain scoped to the public manuscript versions already identified by the errata reviewer. This fix claims no fresh full-paper reading, arXiv collation, published-version verification, correction-search census or reading of Sko90/Sko96. Current reviewed coverage for RP.3 and IG.4 was inspected; no declaration-level availability assertion changed.

## Validation

- Paper checker and canonical errata checker: pass.
- Intake checks on the three changed assigned files plus the unchanged assigned errata file: pass.
- Staged whitespace check: pass.
- Read-only `errata.collect()` returns exactly E1 and E2 from the canonical errata path, both confirmed by `REV-ERRATA-PAPER-HARPAZ-WITTENBERG-20`; their reaches are `the proof` and `nothing`.
- Exact comparison against the starting revision preserves item 75’s statement, every item ID/status and the complete route list, the canonical errata, the standalone historical paper review and the reader’s appended historical review section.
- The finite model below verifies the generalized-quaternion presentations at m=2,3,4, all 4,672 associativity triples and the explicit m=2 isomorphism to C₄. This verifies the endpoint convention, not the arithmetic weak-approximation theorem.

No Lean file is assigned or compiled. Job scratch is removed after opening the PR.

```python
from itertools import product
triples = 0
for m in (2, 3, 4):
    N = 2**(m-1)
    G = list(product(range(N), range(2)))
    def mul(x, y):
        a, b = x
        c, d = y
        return ((a + (-1)**b*c + (N//2)*b*d) % N, (b+d) % 2)
    def power(x, n):
        r = (0, 0)
        for _ in range(n):
            r = mul(r, x)
        return r
    a, b = (1, 0), (0, 1)
    assert power(a, N) == (0, 0)
    assert power(b, 2) == power(a, N//2)
    assert mul(b, a) == mul(power(a, N-1), b)
    for g, h, k in product(G, repeat=3):
        assert mul(mul(g, h), k) == mul(g, mul(h, k))
        triples += 1
    assert all(any(mul(g, h) == (0, 0) == mul(h, g) for h in G) for g in G)
    if m == 2:
        phi = lambda g: (2*g[0] + g[1]) % 4
        assert len({phi(g) for g in G}) == 4
        assert all(phi(mul(g, h)) == (phi(g)+phi(h)) % 4
                   for g, h in product(G, repeat=2))
    else:
        assert mul(a, b) != mul(b, a)
assert triples == 4672
```
