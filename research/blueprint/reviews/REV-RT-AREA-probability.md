# REV-RT-AREA-probability

Independent verification of the red-team findings `RT-AREA-probability` on the
**Probability** area — the Tau Ceti roadmaps `Exchangeability` (9 layers) and
`StandardDistributions` (7 layers). I did not write the red team.

**22 findings, all 22 confirmed**, with one correction to finding 10 and one remark on the
grading of finding 19.

## How I checked

I did not take the report's own counts or citations. The checks below were run against the
pinned libraries (Mathlib `082e2d3`, Tau Ceti `f790474`) and the repository.

**Every declaration citation.** I parsed all 165 declaration citations out of the 22
evidence fields and resolved each against the pinned index. All resolve, at the cited file
and line. The only apparent exceptions are artefacts of my own parser: where the evidence
writes `name (:NNN)` continuing a path from earlier prose, my carried-forward filename was
sometimes wrong — and in every such case the index's line number equals `NNN` exactly, so
the citation is right and my attribution was not.

**The atlas record.** All nine Exchangeability stages and all seven StandardDistributions
stages carry `status: "unknown"`. Every stage's `requires` is empty and both roadmaps have
zero `stageEdges`.

**The coverage record.** `data/library-coverage.json` holds 1316 layer entries and **not
one** is for either roadmap. `AUDIT-40` appears only in its `pendingReview` list, and
`REV-AUDIT-40.md` opens "**Verdict: accepted.**" — so the report's "accepted library audit
AUDIT-40, pending merge" is exactly right.

**The name-level claims.** The five identifiers the findings say are absent —
`contractable_of_exchangeable`, `exists_perm_extending_strictMono`,
`exchangeable_of_mixedIID`, `charFun_wishartGramMeasure`, `LDL.lowerInv_triangular` — return
no hits at the pin. The three declarations two findings call private are each `private
theorem` at the cited file and line: `measure_eq_of_forall_prod_univ_pi`
(ConditionalCommonEnding.lean:62), `measure_inter_blockCylinder_eq_setLIntegral`
(JointRectangle.lean:94), `measurable_tailFamily_blockAverage` (L2/TailMeasurability.lean:69).

**The roadmap quotations.** Every quotation I spot-checked is verbatim, including
DenseGraphLimits Layer 9b's assignment of the generic infrastructure to "the
**Exchangeability roadmap**", `AdditiveCombinatorics:AC.2`'s "include ergodic/combinatorial
infrastructure as owned prerequisites", and both sides of the Gaussian-pushforward pair.

**The Mathlib deprecations** behind finding 18, read in the source rather than assumed:
`@[deprecated StdSimplex (since := "2026-08-29")] def stdSimplex`,
`@[deprecated StdSimplex.map (since := "2026-08-29")] noncomputable def map`, and
`@[deprecated poissonMeasure (since := "2026-03-08")] noncomputable def poissonPMF`.

## The two findings that needed real mathematics

**Finding 19 — the Wishart congruence target is false as stated.** Confirmed. The roadmap
defines the family "When `S.PosDef` and `(p : ℝ) - 1 < n`" and adds "Define this measure to
be zero when either parameter hypothesis fails"; item 4 then states the congruence
pushforward for `M.rank = q` with no hypothesis beyond full row rank. At p = 2, q = 1,
M = (1 0), S = 1, n = 1/2 the source fails its own hypothesis (1 < 1/2 is false), so it is
the zero measure and its pushforward is zero; the target is one-dimensional, where
0 < 1/2 holds and `M S Mᵀ = (1)` is positive definite, so it is a probability measure. Zero
is not a probability measure. The repair is the two hypotheses the finding names.

*A remark on grading, for the maintainer.* Section 17 reserves low for presentation, and
this is a statement false as written, so medium would be defensible. Against that: nothing
is built on it — there is no `nonsingularWishart` declaration at `f790474` — and the repair
adds hypotheses the author plainly intended.

**Finding 20 — the inverse-Wishart mean has no planned input.** Confirmed. `Bartlett`,
`nonsingularWishart` and `inverseWishart` return no hits at the pin, while every input the
finding offers is present. I also checked the route it proposes, and it is correct: with
a = (n − p + 1)/2 and r = 1/2, the inverse-gamma mean r/(a − 1) is 1/(n − p − 1), and
integrability holds exactly when 1 < a, i.e. n > p + 1 — precisely the mean and threshold
item 6 asks for.

## The correction

**Finding 10** claims, among other things, that "The roadmap's References list no array
source (Aldous 1981, Hoover 1979)". That clause is wrong. The References section does list
an array source:

> * David Aldous, *Exchangeability and related topics*, École d'Été de Probabilités de
>   Saint-Flour XIII, 1983.

which is the standard exposition of exchangeable arrays and the Aldous–Hoover
representation, alongside Kallenberg's *Probabilistic Symmetries and Invariance Principles*,
whose Chapter 7 is the modern treatment — though it is cited there only at Chapter 1,
Theorem 1.1.

What is true, and is what the fix actually needs, is that **no source is attached to the
Layer 8 target** and those specific papers are not listed. The Markov-exchangeability half
of the clause is right: the only Diaconis–Freedman entry is "Finite exchangeable
sequences". The rest of finding 10 I verified and it stands — the whole specification of
the target is one bullet, with no statement, hypotheses or prerequisites, while the library
has the forward direction and not the coding converse. Confirmed with that clause reworded.

## A note on fairness

Finding 11 could have looked like an overclaim — AUDIT-40 *does* record the Exchangeability
Layer 8 / DenseGraphLimits 9b pair as a duplicate. It is not: the finding says so itself,
naming the link map's overlap `EXCH-DGL-01` with recommendation "keep" and review pending,
and confines its claim to the narrower and correct one, that no owner is assigned to the
compatibility theorem or the symmetric-array law type.

## What I did not do

No Lean was compiled. Declarations were read at the pinned commits through the index and,
where a claim turned on the exact text, in the source files. I verified the 22 findings and
the claims they rest on; I did not re-audit AUDIT-40 itself, nor re-derive the mathematics
of layers whose targets the findings simply locate in the library.
