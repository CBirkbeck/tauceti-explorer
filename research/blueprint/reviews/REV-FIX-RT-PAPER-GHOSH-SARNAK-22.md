# Independent review of the Ghosh–Sarnak fixes

Job `REV-FIX-RT-PAPER-GHOSH-SARNAK-22`, issue #5136. Codex,
`codex-5ebb6f`, 2026-09-30. Reviewed FIX #4999 / PR #5217, commit
`8fa893e`, by Codex `codex-J6LwjP`. This session did none of that fix.
The shared GitHub submission account does not establish account independence.
Review base `0b41721`. Scope: the assigned ClassicalArithmeticCompletion packet;
the extraction and its reader are read-only evidence.

**Verdict: accepted after corrections**, as a partial packet. The three new
nodes state the corrected exceptional inequality and its root-orbit lemma,
and the integral zero-fibre comparison. The general level-k source work is
explicitly unfinished. This does not certify all 333 nodes afresh, source
closure, Lean elaboration or implementation. The most recent independent
review, `independent-review-REV-FIX-RT-PAPER-KOYMANS-PAGANO`, is archived verbatim;
its unrelated corrections remain unchanged.

## The nine confirmed findings

I read every finding and matching verifier reason, the complete fix report,
the three new nodes and their actual imported statements, and the pending
source contracts. No confirmed finding is silently treated as fully repaired
by the packet where its remaining owner is a different job.

| Finding | Review verdict and evidence |
| --- | --- |
| /1 | **Accepted.** The correct statement for exceptional k≥5 is h_M(k)≥|F⁺_k|+1. The two new nodes separate injectivity from the extra small-coordinate orbit. The argument extends (4.1) on the invariant large-coordinate component without assuming genericity. E507 has a fresh independent `confirmed` verdict; no old verdict is copied. |
| /2 | **Accepted packet correction, with the descent-contract clarification below.** CA.4 is partial, not source-decomposed, and all 25 missing CA.4 items have exact item-tagged requests. The general carrier, group, Δ, finite class number and fundamental sets remain explicit gaps, so the Part II cannot treat them as completed imports. Live issue prompts now mention the paper, but still need the corrected route/scope refresh noted below. |
| /3 | **Accepted.** CA.4 owns the level-k elementary arithmetic. The FF.1 request carries character normalization and the comparison with `gaussSum_sq`; CA.1 is not made a second Gauss-sum owner. The actual theorem requires a finite field and an integral domain of values, plus nontrivial quadratic and primitive additive characters. A prime-power density formula is not inferred from it. |
| /4 | **Accepted owner boundary.** BelyiMaps states the real Fricke identity and cannot supply the arbitrary-ring result needed modulo pⁿ. The pending NonabelianLevelStructures proposal coalesces with Chen /78, with an early trace prefix before CA.4 and a later character-variety consumer. No nonexistent stage is marked as supplying it. Direct substitution proves Corollary 6.3's point without that general trace theorem. |
| /5 | **Accepted version correction in the read-only evidence.** The old blanket persistence assertion is removed. Theorem 1.2(i) has exponent −1/4 in v1 PDF p.5 and v2 p.6; v3 p.5 has −1/2. Loughran–Mitankin v3 pp.2–3 identifies the earlier exponent problem. That is distinct from E11's constant-1 issue. E24's correction has the right two-sided order; `≍` is not an asymptotic-equivalence theorem. |
| /6 | **Accepted provenance.** The packet records the exact v3 source/hash and focused fix reading. The extraction distinguishes the original full reading from focused v1/v2/v3 and Loughran–Mitankin checks. No unread publisher text is entered as a published reading. This review also reads only the identified preprints. |
| /7 | **Accepted reuse.** The zero-fibre node correctly treats both mod-3 cases, divides only after proving divisibility over ℤ, normalizes signs for the nonzero point, and invokes the existing positive coefficient-three root theorem. It intertwines the moves, permutations and double sign changes. Carrier/descent requests coalesce the n=3,a=1 GMR specialization; no mod-3 rescaling equivalence or duplicate carrier is asserted. |
| /8 | **Accepted disposition in the read-only evidence.** GS v3 p.34 has the two cross-reference slips; the fixes refer to the Hasse-failure construction and admissibility in their actual sections. Proposition 8.1(ii)'s prime-factor condition excludes 3, so the listed ν residues 0,±3 modulo 9 are redundant, not false. The eligible positive ν<50 are 23,31,41,49; k=1062 is a generic Hasse failure. |
| /9 | **Accepted synchronization in the read-only evidence.** The extraction/reader give 64 items, 4 library/2 planned/58 missing, six routes and 24 source issues. All missing items route exactly once. The former Markoff design key is coalesced into #3367, with the general level-k imports conditional in the current extraction. |

## Mathematical checks and corrections

For a positive sorted point a≤b≤c with a≥3 and k≥5, the disputed descent sign
is elementary: if c≤ab/2, then the quadratic
`f(t)=t²-abt+a²+b²-k` decreases from b to c. Thus
`0=f(c)≤f(b)=a²-(a-2)b²-k≤(3-a)a²-k<0`, a contradiction.
Made this algebra explicit in `markoff-positive-root-orbits`; it is the same
source argument, not a new theorem assumed as an input.

Each bracket in (4.1) is positive on |x_j|≥3 and k≥5. A negative root has three
increasing neighbours, all still large. A positive point has one decreasing
neighbour, while its increasing neighbours stay large. Starting at a negative
root, that decreasing neighbour is the previously constructed parent. A finite
path between two roots would have a maximal-Δ point with two decreasing
neighbours, impossible. This proves the injection and separation from all
small-coordinate exceptional orbits. F⁺ is bounded directly by its positive
polynomial; finiteness of the full orbit count remains a requested input, not
a consequence of the erroneous printed inequality. At k=5, (0,1,2) is a point
and F⁺ is empty because its polynomial is at least 54.

**Pending descent contract corrected.** The copied item-7 request should not
say that S⁺ and points with a coordinate 0 or 1 exhaust every exceptional orbit.
It now explicitly requires the coordinate-two branch. For example,
`M(-2,2,3)=29`, outside S⁺ (whose minimum is 54). On the entire locus k=29,
|x_j|≥2, the (4.1) brackets are at least `2(29-5)>0`. Negative-root moves stay
in that locus; positive increasing moves do too. If the least coordinate is 2,
then `k=4+(b-c)²`, so c>b at k=29 and the largest-coordinate move is the unique
decreasing one. For least coordinate ≥3 the preceding quadratic argument
applies. The same unique-parent argument therefore keeps this root's orbit
away from coordinates 0 or ±1. The pending general descent must account for
it rather than substitute the generic fundamental-domain theorem.

This correction concerns the packet's copied consumer contract; it is not an
independent published-paper erratum verdict. Updated its existing source-
decomposition gap and retained the source-completion obligation. It changes
neither the large-coordinate-at-least-3 lemma nor the corrected class-number
inequality. A bounded search of that k=29 component found 107 points with
maximum absolute coordinate ≤250; that experiment is not the proof of the
unbounded statement. Its proof is the strict-Δ/unique-parent argument above.

The zero-fibre comparison has the right integral scope. Modulo 3, three units
have square sum zero and nonzero product; if a coordinate vanishes, the other
two squares must vanish. Thus all coordinates of an integer solution are
multiples of 3. Dividing by 3 gives the existing coefficient-three equation;
for nonzero points double sign changes make it positive before the root theorem
is used. It does not identify the two surfaces over characteristic 3.

For the local point put `f=e⁻¹`, `d=e-f`, `c=d⁻²`,
`X=2-(k-4)c`, `Y=e+f`, `Z=d+fX`. Expanding with ef=1 gives
`M(X,Y,Z)=(2-X)d²+4=k`. Choosing e=2 makes d=3/2 a unit modulo pⁿ
for p≥5. This is a proof by substitution; it requires neither a completed
character variety nor an inference from finitely many numerical cases.

## Sources and baseline

Fresh PDFs accessed 2026-09-30; each hash agrees with the fix's record.

| Public source | Focused reading | SHA-256 |
| --- | --- | --- |
| [GS v3](https://arxiv.org/pdf/1706.06712v3) | pp.3,5,7,9–14,19–20,23,34; rendered pp.5,13 | `e4ddc7a115ad4afd61f0063d0b931baf85792eee2267d1d5c232bece11d3163d` |
| [GS v1](https://arxiv.org/pdf/1706.06712v1) | p.5, including the rendered inequality/exponent | `c40c3ab2c4e135134ece520a9ab16d51c4fc2d09d18bfea0b06f4365127993b6` |
| [GS v2](https://arxiv.org/pdf/1706.06712v2) | pp.3,6; rendered p.6 | `e4b2089d52504ad050660b757f7f567122bdd7c015fa4cd4b93d571769ae05a6` |
| [Loughran–Mitankin v3](https://arxiv.org/pdf/1807.10223v3) | pp.2–3, including rendered Theorem 1.4 | `a8ff60af529dbfa32884818b33846d32d07277707404960561b34444a31f7036` |

No whole-paper, publisher-PDF or fresh Appendix B reading is claimed. Existing
E1–E20 verdicts are retained as earlier evidence; this is not a fresh audit of
all the density formulas. E507 is scoped to the identified GS preprint. The
version checks pass for both packet and extraction.

Read AUDIT-18 CA.4, AUDIT-19 FF.1 and RS-03's actual CA.1 owner contract.
Read `Mathlib/NumberTheory/GaussSum.lean` at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, including section variables and
`gaussSum_sq`: the result has exactly the hypotheses stated above. Tau Ceti pin
remains `f790474821cf4256814db967cb154e7af3d0c369`. No baseline declaration
is newly cited, and no unchanged claim among the other 604 references is
recertified merely from its name being present in the declaration index.

## Checks and remaining owners

- Indexed packet checker: **0 errors, 0 warnings**; 333 nodes, 501 API items,
  280 unit tests, 45 requests, 9 gaps, partial. No new definition or
  construction is added by this review. The three fix nodes have source
  locators, prerequisites, hypotheses and discriminating acceptance cases.
- Paper checker passes on the unchanged extraction. Its 58 missing items route
  exactly once; the 25 CA.4 source requests match route 1 exactly.
- Independent exact arithmetic enumeration gives 7105 exceptional k≥5 with
  empty F⁺ through 100800 (largest 100792), 7630 generic Hasse failures, and
  58800 admissible positive levels. Checks at 5,58,100792 and 1062 pass.
- All three Δ-difference identities and the strict sign/large-coordinate
  conditions pass on **4132** signed triples in [-12,12]³ with k≥5 and
  |x_j|≥3. All 27 mod-3 triples, 41 integer zero-fibre points in [-30,30]³
  with their three move identities, and 720 local substitutions pass. These
  are finite regressions; the unbounded arguments are given separately above.
- Recursive current packet prerequisites: **1173 vertices, 1847 edges,
  acyclic**. The CA.4 stage remains an exposed leaf for the requested general
  source inputs. This does not discharge that gap. Read-only production
  assembly: **2907 stages, 8322 edges, acyclic**. No atlas write/promotion runs.
- Intake checks on the two exact deliverables and whitespace checks pass.
  No link map or restructuring result is a deliverable here, so their
  validators do not apply.
- All other node payloads, baseline, status, coverage, source/version metadata
  and old source-issue verdicts remain unchanged. Only E507 gains this review's
  confirmed verdict. Unrelated Koymans–Pagano changes and its review provenance
  are preserved.

Fresh issue reads show that #1025, #1040, #1030, #1021 and #1022 now include the
paper, unlike the fix's earlier access snapshot. Some prompts still describe
pre-fix routes: #1025 includes CA.1, and #3367's displayed summary presents the
general CA.4 imports unconditionally. The full extraction brief now narrows
those statements correctly. The maintainer's next refresh must use those
corrected routes, coalesced with the existing Chen/GMR refresh task. No issue
body, queue or old review report is edited by this worker.

The blueprint/source-completion owner must finish the general level-k source
contracts and synchronize the three fix nodes, corrected item-7 branch and
gap into its reader/suggested file. The extraction's item 7 should inherit the
same descent clarification; E24's explanatory prose should say two-sided order,
not asymptotic equivalence. These files are outside #5136's two deliverables.
They are not treated as completed by acceptance of this partial packet.

No Lean file is a deliverable and none was compiled. No matching pre-existing
built pins are available; no Lake bootstrap/cache/build or language server was
started. Nothing is claimed formalized.
