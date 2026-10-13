# REV-LocallyAnalyticDistributions--L2 — completed review

Codex, session codex-Z8YZBz; issue #9250; 13 October 2026.
The input was Claude Opus's BP-LocallyAnalyticDistributions--L2 (PR #9342).
Only this review job was claimed.

## Done

Accepted all 38 targets after correcting 17; 21 are verified without changes.
The packet has 61 API entries, 35 discriminating tests, three planets, 18
retained pinned Mathlib citations, no mathematical gaps and no requests.
The reader matches the corrected packet, and the suggested file follows the
current compact shape. Nothing was promoted or edited outside these
deliverables and this handoff. The full per-node audit and every correction
are in reviews/REV-LocallyAnalyticDistributions--L2.md and the packet review.

Key corrections: finite moments on arbitrary analytic distributions do not
certify order; finite coefficient extensions vary with the conductor; unit
restriction preserves membership rather than minimal order; zero indices
and zero valuations need their own cases; isotropic density follows from the
basis proof; explicit tensor constants use the Mahler projective norm.
Admissibility is defined for every nonnegative r, including the degree-0
Haar test at r = 1; N ≥ [r] belongs to the extension isomorphism.
Raw ball moments now have a constructor and extensionality contract.
The block distinction test is an actual continuous separating series.

Colmez's freely readable published PDF is on Numdam, with hash and precise
locators in sources. E7–E11 were confirmed; E12 (coefficient index range),
E13 (norm-constant sign) and E14 (De Ieso derivative-only Lipschitz estimate)
were added and repaired in the relevant outlines. Source statements are
written in our own words; no source passages or restricted books were copied.

## Validation

check_blueprint: zero errors and warnings.
lean-check at Mathlib 082e2d3: compiled; only seventeen sorry warnings.
Suggested file: 390 lines, 15 light definitions, seven end theorems,
sixteen examples, no sorry'd data. All API/test names also have a README-only
inventory. Reader/packet consistency, JSON, scope and diff checks passed.
These are planning signatures, not a formalisation.

The reviewed library audit and current read-only upstream roadmaps/library
were checked. No higher-growth target was found already upstream.
No ownership move or upstream note is needed; the sole cross-roadmap
supplier is PadicMeasuresIwasawaAlgebras L2/residue-fiber-clopen.

## What remains and where to resume

No review work remains. The next worker packages the accepted predecessor
and this L2 continuation, carrying the corrections and norm conventions
above. It must not treat the heavy README targets as absent mathematics or
reintroduce proxy carriers/data sorries into Suggested.lean.

The sole remaining source check is Loeffler's published Springer chapter
(Iwasawa 2012, 2014, pp. 357–378), to compare E3/E11 if a readable copy becomes
available. All three arXiv versions have been independently checked; no
assertion about the unread version of record is made. This is recorded in
coverage.remaining and does not leave a mathematical gap in the planned
targets. The report and packet contain all information needed after scratch
is deleted; no successor needs a local scratch file.
