# Independent verification: Liu–Wood–Zureick-Brown paper red team

Job: REV-RT-PAPER-LIU-WOOD-ZUREICKBROWN-24; issue #4135.
Reviewer: Codex — codex-a71f92; 2026-09-30.
Status: complete verification of the four reported findings.
Audit revision: a442192b3863affa81c169792053a27d1940a992.
Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

All four findings are confirmed, retaining their reported low severity.
Two qualifications are essential: finding /3's repository-wide absence claim
is outdated, and finding /4's proposed unread-published metadata entry would
defeat the collation safeguard. The JSON reasons give the corrected fixes.

## Scope, independence and sources

This verifies the existing four findings under PROTOCOL §17; it is not another
whole-paper extraction, a proof-closure audit, or a re-verification of its six
stated-result source issues. Only the verification JSON and this report change.
No mathematical target, upstream roadmap, extraction or source-issue verdict
is edited.

The original review identifies extraction session cc-39fac3 and reviewer
cc-442dc5. The red-team result identifies cc-c2c06b. This session did none of
those jobs. I read the current red-team result in full, the relevant extraction
items and all its prerequisites, source metadata and stated-result locators,
the original review's authorship record, the named packet nodes, and the
upstream supplier passages myself.

I downloaded [LWZ arXiv v2](https://arxiv.org/pdf/1907.05002v2) on 2026-09-30.
It has 58 pages and SHA-256
`7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9`,
matching the extraction and red team's version. The
[version record](https://arxiv.org/abs/1907.05002v2) identifies the July 2022
revision. I read the focused PDF text at pp.13, 15–17, 26–29, 36–37, 41, 44
and the relevant bibliography entries at pp.55 and 58; this is not a claim
to have read all 58 pages. Formula (3.11) and the p-class definition are legible
in the text extraction. Journal article DOI 10.1007/s00222-024-01257-1 was
not acquired or read by this verifier.

Primary bibliographic checks: [Numdam's BR11 record](https://numdam.org/issues/MSMF_2011_2_125-126__1_0/)
and [SMF's RW06 record](https://smf.emath.fr/publications/espaces-de-hurwitz).
The public [RW06 author PDF](https://perso.univ-rennes1.fr/matthieu.romagny/articles/hurwitz_spaces.pdf)
was located; I did not undertake a fresh proof audit of BR11 or RW06.
Their relevance here is the actual LWZ citation and the omitted prerequisite.

## /1: solvability and Schur–Zassenhaus — confirmed

Extraction item /10 correctly distinguishes existence from general conjugacy
until its final dependency sentence. A pro-odd normal group has odd-order
finite quotients; concluding those quotients are solvable invokes the
odd-order theorem unless solvability has already been obtained independently.
Thus pro-oddness is not a reason to omit that dependency.

The remark at LWZ v2 p.17, end of §3.2, does not supply a
solvability-free proof: when |Γ| is odd, the prime-to-|Γ| category can contain
even-order nonsolvable groups. For even |Γ|, its finite quotients have odd
order. The parity hypotheses in item /4 force odd |H|, but do not by themselves
provide an independently formalised solvability proof for arbitrary H.

I read [Mathlib's pinned SchurZassenhaus.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SchurZassenhaus.lean#L277):
`Subgroup.exists_right_complement'_of_coprime` gives a complement from normality
and coprime cardinal/index. In the nonzero-cardinality/index case its proof
reduces to finite G; it is not a theorem about arbitrary supernatural orders.
At line 103, `Subgroup.exists_smul_eq` gives transitivity of H's action on
`H.QuotientDiff`, with standing `IsMulCommutative H`, `FiniteIndex H` and
`Normal H`. It is not a general nonabelian complement-conjugacy theorem.

The ArithmeticStatistics packet's
ST.5/complements-of-a-coprime-abelian-normal-subgroup-are-conjugate is explicitly
abelian. Its counting-unramified-h-extensions-via-semidirect-extensions and
liu-wood-zureick-brown-function-field-moments nodes explicitly assume (SZ).
That corroborates the recorded dependency boundary; it does not establish
general Schur–Zassenhaus from the pinned library.

Correct the note to allow independently solvable normal finite quotients or
solvable quotient Γ. Abelian/nilpotent finite groups and finite p-groups give
restricted cases. Preserve the general theorem's random-group Part II owner
and retain (SZ) until supplied. Do not assert that every conceivable proof
must use Feit–Thompson: the defect concerns the dependency of this plan.

## /2: two different pro-C completions — confirmed

At LWZ v2 p.15, (3.11) uses Γ-equivariant quotients and closure under finite
products, Γ-subgroups and Γ-quotients. At p.27, §5.2 uses the order-bounded
family C_ℓ; at p.36, §7.2.2 uses p-Γ-groups of bounded p-class and explicitly
lists the same three closure operations.

I read the current [upstream Layer 4 contract](https://github.com/CBirkbeck/tauceti-explorer/blob/a442192b3863affa81c169792053a27d1940a992/content/tau-ceti/ProfiniteProPGroups/README.md#L367).
Its `FiniteGroupClass` is extension-closed and has ordinary finite groups,
not finite groups with a specified Γ-action, as its members. All its
`proCCompletion` statements use that structure. Its nilpotent warning gives
the C₃–S₃–C₂ extension as a test. Layers 4–5 also supply the free objects and
pro-p presentation/rank interfaces cited by item /43.

A concrete distinction: with trivial Γ-action and p-class bound 1, C_p is in
the family, while the extension C_{p²} is not. Products, subgroups and quotients
of exponent-p abelian groups remain exponent-p abelian. Similarly an
order-bound ℓ=p includes C_p but not the order-p² extension. These families
cannot simply instantiate the upstream extension-closed class.

The prime-to-|Γ| class and the full finite-p-group class can supply the
underlying free carriers; the action permuting the finite set of generators
is induced functorially, as LWZ p.13 describes. General equivariant
level-C completion is already missing item /1, route 7,
ArithmeticStatisticsPartIIRandomGammaGroups. Narrow /43 to the supplied
free carriers and pro-p presentations and refer its level-C completion to /1.
This fixes a supplier description without creating another owner or
editing Tau Ceti's roadmap.

## /3: two prerequisite sources — confirmed with qualified evidence

LWZ v2 p.41 uses BR11 for Hurwitz-space foundations and specifically its
Proposition 3.1.1 for étaleness of the branch locus. Page 44, §11.3, identifies
RW06 §3 as the model for its topological construction. Its bibliography at
pp.55 and 58 identifies:

- José Bertin and Matthieu Romagny, *Champs de Hurwitz*, Mém. SMF (N.S.)
  125–126 (2011), DOI 10.24033/msmf.437.
- Matthieu Romagny and Stefan Wewers, *Hurwitz spaces*, Séminaires et Congrès
  13 (2006), pp.313–341.

Neither is in this extraction's prerequisites; add BR11 with the branch-locus
and Hurwitz-stack use for /30 and RW06 §3 with the topological use for /31.

The red team's stronger claim that no extraction mentions Romagny is **not**
true at the audited revision. A focused search of current paper, packet and
new-roadmap files found BR11 already in CHEN-24's prerequisites and RW06 in
EVW16's and WOOD-19's prerequisites. EVW16 records a partial reading of
RW06 §§4.1–4.5, not the §3 passage used here. These records establish useful
shared supplier references, not complete independent inventories of the two
papers. Neither work has an entry in papers.json; no packet or new-roadmap
file in that focused search cites it. Do not claim global mathematical absence.
Coalesce later source acquisition/extraction with the existing references.

## /4: reading provenance — confirmed, proposed fix corrected

The extraction has no top-level sourceVersions. Its source.readSections
records a full historical reading of v2 on 2026-09-22, an unread main journal
article, and a separately read Publisher Correction. Its six
`affects: a stated result` entries are E5, E6, E7, E8, E12 and E25.

I executed the actual current `scripts/collation.py` provenance and exposure
functions in memory, using this extraction and its papers.json entry:

| Metadata | Provenance | Exposed stated findings |
| --- | --- | --- |
| Current record | preprint | 6 |
| Explicit preprint reading only | preprint | 6 |
| Proposed unread published entry added | published | 0 |

The classifier currently takes any declared `kind: published` as sufficient.
A citation containing a not-read disclaimer is not filtered. Consequently,
the red team's suggested unread-published entry would conceal the exposure
rather than accurately record it. An optional published entry for the
Publisher Correction would have the same main-paper ambiguity.

Correct fix: list only the actually read main-paper preprint in sourceVersions,
with the version-specific URL, historical reading date 2026-09-22, and matching
PDF hash above. Keep the main journal article's unread status and the separate
Publisher Correction in explicit descriptive provenance, not as a published
main-paper reading. The six findings remain scoped to v2 and remain on the
collation worklist until the main published paper is acquired and collated.
This verification checks provenance bookkeeping, not whether those six
mathematical objections survive publication. No publication-wide erratum
claim is made.

## Validation and handoff

The mandatory `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-LIU-WOOD-ZUREICKBROWN-24.review.json`
passes using the unchanged current-main checker in isolated scratch, beside
the actual red-team result. Intake reports two files and zero problems.
Exact finding linkage was checked separately: four unique IDs, matching the
reported four IDs, each with a verdict and reason. `git diff --check` passes.

No Lean change, compilation, library build, or formalisation claim.
The deliverables are the entire handoff: four low-severity confirmations and
the precise qualified corrections above. No new mathematical findings were
added and no automatic high/medium fix is asserted.
