# Koymans–Milovic: short-character-sum ownership and source provenance

**Job:** FIX-RT-PAPER-KOYMANS-MILOVIC-21, issue #5000.
**Agent/session:** Codex / codex-rtOQ9t. **Date:** 2026-09-30.
**Base:** 4e4b814. Both confirmed findings in the
[verification](RT-PAPER-KOYMANS-MILOVIC-21.review.json) are applied, including
its corrected destination and low-severity provenance addition.

## /1 — route the hypothesis to its mathematical owner

Route 5 now sends items /11 (Conjecture C_n) and /12 (its conditional
arithmetic-progression corollary) to **ExponentialSumsAndCircleMethod:ES.0**.
It stays at position 5 and retains exactly those two items. The two item notes,
route-5 reason and the paper report's matching paragraph are corrected.
Route 1 gains the explicit ES.0 import for the SV.5 consumers; its item list
is unchanged. Neither conjecture nor conditional corollary becomes an
unconditional theorem, and both retain status `missing`.

This follows the verifier's correction, rather than the older issue text's
suggestion to move the items into SV.5. RS-07 drops AN.6 as a separate register
and assigns hypotheses to the owners of their underlying mathematics. ES.0
already owns short-character-sum work: the accepted Bennett–Siksek extraction
routes its Graham–Ringrose input there. Its current partial packet carries
conductor, completion and differencing work while explicitly leaving the full
Graham–Ringrose analytic proof open. That evidence establishes the owner; it
does not prove the conjecture or close an analytic gap.

The conditional consumers remain distinct:

- SV.5 items /14, /23 and /24: the type I estimate and Theorems 1–2, using
  C_{|S|n} or C_{tn} as stated;
- ST.3 item /28: Theorem 3, assuming C_n for all n.

The unconditional n=3 remark is retained in item /11's note and route 5:
FIMR Corollary 9.1 takes r=6 in Burgess, giving
N^(5/6) q^(7/144+ε). For N≤Q^(1/3), q≤Q, the exponent is
5/18+7/144=47/144=(1−1/48)/3, so δ(3)=1/48.
The n≥4 general-modulus bounds remain named conjectural inputs here; this fix
makes no claim to survey subsequent progress on short character sums.

For Corollary 2.2, let d=gcd(q,k)<q. Squarefreeness gives
gcd(q/d,k)=1 and q/d>1. On m≡l (mod k), χ_d(m)=χ_d(l); parametrizing the
progression turns χ_{q/d}(m) into χ_{q/d}(k) times a translated nonprincipal
character sum. For negative k one can use |k|; k=0 is excluded by q∤k.
The new interval has at most N terms, so C_n with Q=q applies. This explains
why /12 is a character-sum consequence owned with /11. The existing E2
correction, including +ε, is unchanged.

The reviewed AUDIT-07 entry for ES.0 remains `not built`; it distinguishes the
existing finite Fourier/Gauss-sum ingredients from the missing incomplete-sum
bounds. No library status or pinned declaration claim is changed by this fix.

## /2 — record only the version actually read

Added one `sourceVersions` entry: the completely read arXiv v1, dated
2026-09-22, with its existing PDF URL and hash. This records the original
extractor's full reading, not a claim that this fixer reread the whole paper.
The citation explicitly says the Duke version was inaccessible and that
locators/source issues belong to v1. `source.readSections` is unchanged.

There is **no** `kind: published` entry for the unread publication.
`scripts/collation.py` treats that kind as a declared publication reading
regardless of words such as “not read” in the citation. The actual helper
continues to classify this extraction as `preprint`.

## Evidence and scope

The following public PDFs were fetched and the selected passages read on
2026-09-30; both hashes match the extraction/verifier's records:

- [Koymans–Milovic, arXiv:1809.09597v1](https://arxiv.org/pdf/1809.09597v1),
  23 pages, SHA256 `d56a738ae1b1487dd01b92b7084dd6bd4b9a041a85efdd2fac66b86afd8af433`.
  Read Theorems 1–3 on pp.2–3, §2.5 and Corollary 2.2 on pp.6–7, the sieve
  inputs on p.7 and the use of Corollary 2.2 at (3.6), p.9.
- [FIMR, arXiv:1110.6331v2](https://arxiv.org/pdf/1110.6331v2), 50 pages,
  SHA256 `b51c25e1d9e7aea35e3d7a92d8f7e80eb8237775daef98e30740115767e71b44`.
  Read the n=3 remark on p.2 and §9, equations (9.2)–(9.4) and Corollary 9.1
  on p.39. No new reading of either published version is claimed.

The local PDF downloads used the already-established public-source TLS
fallback with certificate verification disabled; the independent previously
recorded hashes matched. No new source-error verdict is made.

Also read: the verified findings; RS-07's AN.6 drop and SV.5 scope; the
accepted Bennett–Siksek ES.0 route; the ES packet's current nodes and analytic
gaps; reviewed AUDIT-07; and the actual `accepted_routes`, `provenance` and
`versions_checked` helpers. `accepted_routes` matches existing review verdicts
to route numbers, which is why route 5 must not be removed or reordered.

The verifier explicitly excludes the old review Markdown/JSON from this fix.
Its verdict supersedes the historical “AN.6: accept” rationale; no independent
review text or verdict is forged. Maintainer follow-ups from that verifier
remain outside these three deliverables: refresh the stale AN.6 atlas extract;
inspect the Chenevier–Taïbi and Harpaz–Wittenberg extractions' AN.6 routes; and
make the publication-reading convention robust against “published, not read”
entries elsewhere. No other extraction, atlas data or blueprint is edited.

## Validation

The paper checker passes; intake reports three files and zero problems;
`git diff --check` is clean. Focused preservation, positional-route, provenance
and source-version guards pass, as does the exact rational Burgess exponent
calculation above. All 28 item IDs, kinds,
statements, statuses and locators, all eight source issues and their review
records, the summary and original source record are preserved. The five
routes still assign all 21 missing items exactly once. Only /11 and /12's
notes, route 1's reason, route 5's destination/reason, the matching report
paragraph and structured source provenance change.

No Lean file is involved or compiled. No build, cache download or language
server was started. No mathematical extraction or source collation beyond
the verified fixes is claimed.
