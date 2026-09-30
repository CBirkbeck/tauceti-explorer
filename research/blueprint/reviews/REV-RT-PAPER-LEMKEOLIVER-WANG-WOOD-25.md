# REV-RT-PAPER-LEMKEOLIVER-WANG-WOOD-25

Issue #4209 · Codex · session `codex-J6LwjP` · 2026-09-30 · complete.

Independent verification of the single finding in
`RT-PAPER-LEMKEOLIVER-WANG-WOOD-25`. I did neither that red team nor the
extraction or its review. The review base is `1098723`; I also inspected the
extraction at the red team's stated base `c9e1212bfcbe14236ed26e6895958f905424729c`.

**Verdict: confirmed with substantial qualifications.** There are three
missing local prerequisite records, not four. The proposed correction also
needs to reuse existing work and replace an incorrect DOI. The finding
remains low severity; this review does not turn it into a new mathematical
or routing finding.

## What the evidence actually supports

| Work | Extraction's prerequisite list | Verified use and correction |
| --- | --- | --- |
| Klüners–Malle 2004 | Already present in record 11, after Klüners 2012 | Preserve it, or split the compound record for separate links. Do not add a second copy. |
| Bhargava–Shankar–Wang 2015 | Absent locally; already a source in the partial ArithmeticStatistics packet | Add the precise §8 application and cross-reference the existing source/nodes and proof gaps. |
| Ellenberg–Venkatesh 2006 | Absent locally; already a prerequisite in two other extractions | Add the Proposition 1.3 use, preserving its degree restriction and avoiding a duplicate paper request. |
| Alberts 2020 | Absent locally | Add Corollary 1.8 with the correct DOI, `10.1007/s40993-019-0185-7`. |

The omission of Klüners–Malle was not fixed between the red team and this
review: the compound record was already present at the red team's own
base. A search of `papers.json` alone cannot establish absence from the
extraction's prerequisite list or from blueprint packets.

The [published LOW article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf)
cites KM04 twice in the proof of Theorem 6.2 on **p. 30**, not p. 31.
Its use is real; the claim that it is missing from the prerequisites is not.
Theorem 8.1 and its examples on pp. 40–41 consume the other named works.

I checked the four outside statements rather than relying only on LOW's
reference labels:

- [Klüners–Malle, Corollary 7.3](https://arxiv.org/pdf/math/0112318), author
  preprint p. 14, gives the discriminant-count upper bound for a transitive
  prime-power group in any permutation representation. It does not by itself
  assert the arbitrary nilpotent permutation-group generality of Alberts.
- [BSW v1, Theorem 2](https://arxiv.org/pdf/1512.03035v1), pp. 2–3, counts
  `S_n` extensions for `n=2,3,4,5` with acceptable local specifications.
  LOW applies the counting input to a relative 3-torsion weighted sum,
  using the class-field/cubic-count comparison in its setup. The local
  conditions force a small contribution from fields with smaller Galois
  group. A prerequisite description should preserve this application rather
  than identify weighted class-group averaging with the bare quadratic count.
- [EV06, Proposition 1.3](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n2-p11.pdf),
  published p. 725, gives the `X^(3/8+epsilon)` bound for Galois extensions
  of degree greater than four. This supports the large-degree regular-group
  example; the small regular groups need their separate elementary/abelian
  bounds. Do not rewrite Proposition 1.3 without its degree restriction.
- [Alberts v3, Corollary 1.8](https://arxiv.org/pdf/1804.11318v3), p. 6,
  gives the upper bound for any nilpotent transitive group. The
  [publisher's record](https://link.springer.com/article/10.1007/s40993-019-0185-7)
  verifies volume 6, article 10 (2020), and the corrected DOI. The DOI in
  the proposed fix is not the one for this paper.

The BSW packet source is `bhargava-global-fields-2015`. In particular,
`ArithmeticStatistics:ST.3/bhargava-shankar-wang-counts-over-number-fields`
already states a global-field counting theorem and retains an undecomposed
proof gap. This is not a claim that all of LOW's local weighted application
is completed. It is enough to refute the blanket statement that BSW is
absent everywhere and to require reuse of the existing source work.
That packet uses v2 of March 2026, while LOW's 2025 citation is to v1;
keep the versions explicit.

EV06 is already in the prerequisites of `PAPER-BHARGAVA-25` for
Proposition 2.8 and `PAPER-BHARGAVA-SHANKAR-WANG-22` for other counting
results. Those different uses do not replace the local citation here, but
they do rule out treating the paper as a wholly new atlas discovery.

## Corrected action

Add BSW15, EV06 and Alberts to this extraction's prerequisites with exact
locators, public links and descriptions of their use in Theorem 8.1.
Cross-reference the existing BSW supplier and EV06 prerequisite requests.
Keep or split the existing KM04/Klüners compound record; if split, attach
[KM04's DOI](https://doi.org/10.1515/crll.2004.050) or its public arXiv version.
Use the corrected Alberts DOI. No additional roadmap, changed theorem or
duplicate paper job follows from this bibliographic correction.

## Scope and source record

I read the red-team result/report, all fifteen prerequisite records, items
24 and 35, and the corresponding passages and bibliography of the published
article. I searched the paper queue, other extraction prerequisites,
roadmap texts and blueprint packets, and inspected the BSW packet source,
its relevant nodes and its proof gaps. I read the four external statements
at the locators listed above. I did not reread the complete 43-page LOW
paper, independently certify its sixteen source issues, or endorse the
red team's broader clean assessment of the atlas.

All public sources were accessed on 2026-09-30. The fetched PDF hashes are:

| PDF | SHA256 |
| --- | --- |
| LOW published article | `124175dd2a45767e014e41e6bace0235f79726b6e71a8fccd824768c338b22c6` |
| KM04 arXiv author version | `f93212dc09eb846bcd7bb578a907a487a0317cdeecd10ae260cc63dba1b65bec` |
| BSW arXiv v1 | `3206b7049cfdfcb2ce33e8cc8ada0f86fad2be3fb4141d08f06c0fbc234c1201` |
| EV06 published article | `3af8ff4cbb5e590498be44d168cd0a1404e5d48a5a55298edbd7529174b772f2` |
| Alberts arXiv v3 | `b59341a66f667eb76811166662d0ac5721e83dfefce9e6123fd16683a18b649a` |

The Cambridge PDF carries a download stamp, so its hash identifies this
retrieval rather than an immutable publisher artifact. Failed DOI fetches
were not treated as proof of an incorrect citation; the Alberts correction
was checked against the successful publisher record.

No finding cites a Lean declaration. The three library items discussed in
the red team's background are outside this finding, and I do not claim to
have rechecked them. No Lean file is a deliverable and no compilation,
dependency installation or cache download was performed.

## Validation

Passed: the red-team review checker, swarm intake file check,
JSON parsing and `git diff --cached --check`. These check structure and scope,
not the mathematics. Only the two assigned review deliverables are changed.
