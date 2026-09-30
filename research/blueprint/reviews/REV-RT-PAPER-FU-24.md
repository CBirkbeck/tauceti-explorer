# REV-RT-PAPER-FU-24

Independent verification of issue #4053 by Codex, session `codex-5ebb6f`, 30 September 2026. All seventeen findings are confirmed **within the qualifications and corrected fixes in the companion review JSON**. Seven are medium and ten low. Several component allegations or proposed status changes are too broad; confirmation does not endorse those components.

This session did not write or review PAPER-FU-24, REV-PAPER-FU-24, ERRATA-PAPER-FU-24, REV-ERRATA-PAPER-FU-24 or RT-PAPER-FU-24. The red team's disclosed authorship of the two area fix proposals is recorded and checked as a proposal overlap, rather than mistaken for implemented coverage. This is a verification of its seventeen findings, not a new exhaustive extraction or certification of all seven inherited source issues.

## Evidence and scope

The repository was inspected at `81057a7276655282914bba3ef1fb2e669c343651`. I read every finding, the affected extraction items and briefs, the overlapping distribution/Banach proposals, the relevant NE.0, PMIA L1, CC.4/CC.6, ALS.1/2/4/5 contracts, the LieHighestWeight conventions and Layers3/7, and ProfiniteProPGroups Layer9. I checked the canonical source-issue entries and both existing review reports. The current library audits and packets distinguish supplied prefixes from outstanding proof requests. A word search was used to locate evidence, not as a proof that a broad field has no owner.

Fresh primary-source downloads, SHA-256 values and selected readings:

| Source | SHA-256 | Pages read for this verification |
|---|---|---|
| [Fu, arXiv 2201.11190v2](https://arxiv.org/pdf/2201.11190v2) | `d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614` | PDF pp.1–5,7–17,19–24; not a full-paper reading |
| [Schneider–Teitelbaum, math/0206056v1](https://arxiv.org/pdf/math/0206056v1) | `e8a60a25f246692b048789235fb8efaf6d44ae65fdbb7cc738c8caeae67efcd5` | PDF p.22, Theorem4.5, Remark4.6, Proposition4.7; selected later passages |
| [Schneider–Teitelbaum, math/0005066v1](https://arxiv.org/pdf/math/0005066v1) | `28dfe78dc1fcbe908641523a17ee1fdec5f330494dfdd5e4a48ac7b181c78747` | PDF pp.14–15, Lemma3.4/Theorem3.5 and proofs; selected later passages |
| [Marshall, Annals 175 (2012)](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n3-p13-p.pdf) | `0f7afc3733020661ff2efbd38a87067ce2687ef8c76bdf4e667425d8ecd55081` | Published p.1632, section2.1/equation(4), and pp.1647–1648, equations(34)–(36) |

The three arXiv files were fetched on 30 September at 10:16 UTC; Marshall at 10:35 UTC. Fu's 25-page v2 and these source hashes match the corresponding inherited source records. The [NSF published-copy URL](https://par.nsf.gov/servlets/purl/10625156) timed out in this verification. Its inherited hash `a6a158565c556286deac651198771ab241c9c5c15021b783bfdcd5f3afa7fd80`, physical page count and full collation were **not** freshly established.

The [Annals article page](https://annals.math.princeton.edu/2024/200-1/p03), [arXiv version history](https://arxiv.org/abs/2201.11190) and [Crossref DOI record](https://api.crossref.org/works/10.4007/annals.2024.200.1.3) were inspected on 30 September. No correction was found in those locations; arXiv remains at v2 and Crossref returned no update relation. This is a bounded search, not proof that no correction exists anywhere. Findings15–17 are against the downloaded v2 only. They must be collated before being attributed to the version of record.

Pinned declaration statements and surrounding assumptions were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- Mathlib: `IsNoetherianRing.strongRankCondition`; `nonempty_oreSet_of_strongRankCondition`; the division-ring instance in `RingTheory/OreLocalization/Ring.lean`; `Rep.Tor`, `groupHomology`, `groupHomologyIsoTor`.
- Tau Ceti: `UniversalEnvelopingAlgebra.span_orderedPBWMonomials_eq_pbwFiltration`, `pbwAssociatedGradedMap_surjective`, `glCasimir`, `glCasimir_mem_center`.

The discrete group-homology declarations do not establish continuous completed-Iwasawa homology. The general PBW spanning theorem does not establish ordered independence. No compiled Lean result is claimed.

## Findings and corrections to the proposed fixes

| Finding | Verdict | Checked conclusion |
|---|---|---|
| 1 | Confirmed | The pending Fu, DL17 and Ding analytic proposals overlap; BCGP directs a common algebra supplier. Reconcile both briefs and representation consumers. |
| 2 | Confirmed | NE.0 overlaps with Fu's group/Iwasawa foundations. Coordinates, valuation, analytic comparisons and rational/Auslander conclusions remain explicit missing contracts. |
| 3 | Confirmed, narrowed | Add the shared duality and automorphic-comparison supplier agreement. The boundary item **already imports ALS.2/4**. |
| 4 | Confirmed | The noetherian-domain Ore/division-ring prefix is library, including application to the opposite ring. Flatness, opposite identification and rank adapters remain. |
| 5 | Confirmed | PBW spanning, graded surjectivity and the gl Casimir are existing inputs. Centrality transport and the remaining PBW/central-quotient contracts still need proofs. |
| 6 | Confirmed | The completed-Iwasawa Tor, continuous-lattice comparison and diagonal twist require an explicit construction and API. |
| 7 | Confirmed | Add the same-degree universal-coefficient dimension comparison and coefficient self-duality to the global bound's dependencies. |
| 8 | Confirmed | Generic PBW is already general. The split-Q_p triangular/Harish-Chandra comparison needs an explicit extension/descent contract. |
| 9 | Confirmed, narrowed | Cite the canonical Tau Ceti completed-group-algebra anchor directly; PMIA L1 already warns against a second carrier. |
| 10 | Confirmed | CC.4's derived coinvariants must supply the homological form. CC.6 already requests algebraic-coefficient comparison, but its cohomological node alone is insufficient. |
| 11 | Confirmed | Fourteen active entries duplicate seven IDs, with conflicting classifications and reach. Reconcile records while preserving version/history scope. |
| 12 | Confirmed | Missing sourceVersions reproduces the checker failure; published provenance and contradictory page-count claims need correction. |
| 13 | Confirmed | The errata reviewer's denial of extraction participation contradicts the extraction's completion records. Correct the disclosure. |
| 14 | Confirmed | The PMIA Banach proposal and Fu item overlap, but the proposed sub-stage is still unapplied. |
| 15 | Confirmed, narrowed | ST03 does not establish noetherianity at every real radius. Multiplicative norms already imply the domain property at interior radii. |
| 16 | Confirmed | The v2 proof omits the small-coordinate strips; the extraction already supplies their elementary majorant. |
| 17 | Confirmed | The v2 argument omits its passage from arbitrary level to the split-prime congruence level; the extraction already supplies an adapter. |

The machine-readable reasons give the exact corrections for the fixer. In particular, findings2,8,10 and14 must not turn an outstanding request into an unconditional `planned` assertion. The NE.0 integral global dimension `d+1` is not Fu's rational global dimension `d`; a definition of a uniform group is not its coordinate or p-valuation theorem. Likewise, CC.4's generic derived-coinvariant contract needs the actual lattice/tensor comparison that equation(38) uses.

For finding3, the shared supplier is a staged dependency: early ALS finite-level duality supplies the topological input; the automorphic comparison consumes ALS.5/AS.5 later. The unapplied GL2 request is not automatically Fu's SL2 dimension formula. Keep Fu's factor `2^r1`, coefficient restrictions, cusp Koszul calculation and support distinctions as explicit applications. Marshall's published p.1632 gives an interior-cohomology identity, rather than an identity for the full compact-support group.

For finding11, deduplication is semantic and version-aware. An error in the compact-support identity and an omission in the boundary argument can coexist; one should not erase the former by classifying the whole entry merely as a gap. A separation/ideal-contraction gap is also not a proof that the theorem is false. Keep the independently reviewed AW14 route and both historical review attributions visible. This review does not re-certify every inherited E3–E7 calculation or the version-of-record wording.

The small-strip completion in finding16 can be checked directly. Put `D(k)=product_j(k_j+1)`. A cyclic source gives `H^0(k)<=D(k)`. If `k_i<alpha_i`, then `D(k)<=alpha_i product_(j!=i)(k_j+1)`. Thus the existing polynomial `2 sum_i alpha_i product_(j!=i)(k_j+1)` controls all such strips and the large-coordinate estimate. Its degree is at most `m-1`. The strips are generally infinite, so a finite-exception argument would be insufficient.

For finding17, cusp-form pullback gives the required injection after choosing the auxiliary split prime outside the bad-level set. A topological transfer argument additionally needs neatness or characteristic-zero finite-stabilizer handling. The downloaded v2 already qualifies Corollary1.3 by sufficiently small level; this review does not repeat the inherited assertion that the qualifier first appeared in print.

## Validation

- `scripts/check_errata.py` on the existing Fu errata file reproduces exactly one error: required `sourceVersions` is absent. This is evidence for finding12, not a new deliverable failure.
- `scripts/check_redteam.py` on the red-team result and this review: passed.
- `research/blueprint/intake.py check-files` on the two permitted deliverables: passed.
- Exact one-to-one coverage of all seventeen finding IDs, valid JSON and staged whitespace: passed.

Only the two issue-authorized verification deliverables changed. No Lean file was requested or compiled, and no Lake project, library build or language server was started.
