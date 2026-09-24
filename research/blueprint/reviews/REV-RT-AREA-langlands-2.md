# REV-RT-AREA-langlands-2

**Job** REV-RT-AREA-langlands-2 (issue #1502) · **Date** 24 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: all 40 findings confirmed, none rejected.** Red team by Claude Code, session
`cc-39fac3` (issue #1503, PR #2755); a different session, as the job requires. I did no part of
`RT-AREA-langlands-2`.

Repository baseline `45707f47`. Library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Three high, thirty-two medium and five low findings on seven roadmaps and 71 stages. I checked every
finding at its own evidence: the stage text or node it names, the graph property it asserts, the
restructuring or audit record it quotes, and the page of the source it cites. Two findings, 16 and 27,
are confirmed with a correction to the scope of their reasoning, stated in their verdicts and repeated
below; in both the defect and the fix survive the correction. Confirmation is of the finding as its
verdict states it, not of every alternative a fix mentions.

## What was checked, and how

**Every quoted repository string.** Fifty-six stage-text quotations, every quotation from the two
integrated decompositions, the `keeps` and `owners` records of RS-06 and RS-08 the report cites,
REV-RS-08's first question for the orchestrator, the `data/library-coverage.json` duplicate notes, the
AUDIT-31 to AUDIT-34 entries, the ten paper-extraction items and routes, and the README sentences of
`ClassicalSerreModularity`, `PotentialAutomorphyInfrastructure`, `GL2ModularityLifting` and Tau Ceti's
`ClassFieldTheory` are verbatim where the report says they are. Nothing was paraphrased into the
evidence.

**Every graph claim, recomputed.** I rebuilt the atlas three ways — the raw `data/atlas.json`
stage edges, those plus the links of the accepted proposals in `data/restructure` applied through the
repository's own `scripts/restructure.py`, and those plus the accepted link maps in `data/links` that
`scripts/build.py` merges — and recomputed every ancestor closure, consumer list and acyclicity claim
in the report. Edge counts: 3508, 6116, 6650. Every ancestor claim holds in the graph the finding
names; the two that do not survive the third graph are findings 16 and 27, below. **Every one of the
twenty-odd edges the fixes propose is acyclic**, as each fix asserts; I tested each against the fullest
graph.

**The mechanism behind finding 1.** `apply_restructurings` only appends links — `link()` adds to
`requires` and `consumers` and nothing in the file removes an edge — so a narrowed layer keeps every
prerequisite it had. That is why RS-06's prefix scoping of R27.1 is unrepresentable, and why the fix
correctly says this needs an atlas stage edit or a revised proposal rather than a new link. Deleting
the single edge `R26.6 → R27.1` from the graph leaves no R26.x stage among the ancestors of
R33.1–R33.5, while R33.6 keeps them through R27.4 and R27.6 — exactly the acceptance test the fix
states.

**The pinned libraries.** I read the declaration index and grepped both pinned source trees for every
library claim: no local Tate duality and no `tateDualityPairing_perfect_mixed`,
`eulerCharacteristic_finrank_fp` (finding 16, and Tau Ceti's ClassFieldTheory README lists them as
Layer 5/7 *targets*); no Chebotarev density theorem, only
`NumberField.Chebotarev.frobeniusPrimeSet` at `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93`
(27); no `grunwald` (26); no `washington` (32); no `breuil` or `kisinModule` (7); and every `dickson`
match is `Polynomial.dickson`, the Dickson polynomials, not the classification of subgroups of PGL₂
(15). `Nat.exists_prime_lt_and_le_two_mul` (`Mathlib/NumberTheory/Bertrand.lean:222`) and
`Chebyshev.theta_le_log4_mul_x` (`Mathlib/NumberTheory/Chebyshev.lean:194`) are where the report says,
and neither gives a prime ratio below 3/2 (11).

**The sources.** I re-downloaded each and reproduced its hash where the report records one: the
Khare–Wintenberger preprints (`results.pdf`, sha256 `3c389dc3…`; `proofs.pdf`, `53f45f8b…`), the
Annals paper (`154c0c2a…`), Carayol on Numdam (`d4a5fb6b…`) and Deligne's Bourbaki exposé 355
(`19509c19…`). For the arXiv sources I took the LaTeX e-prints rather than the PDFs — Chenevier
(0809.0415v2), Qian (2104.09761), Boxer–Calegari–Gee–Pilloni (1812.09269v3), Dieulefait–Pacetti
(2108.07577v2) and Khare (math/0504080v1) — and read the statements in the authors' own source. Kisin's
JAMS 21 (2008) and Skinner's Documenta 14 (2009) were read in their published PDFs.

## The findings that carry the most weight

**Finding 12, the KW I Theorem 4.1 ordering.** The sharpest of the thirty-two medium findings, and the
source settles it outright. KW II §10.2 (p. 92) reads "Thus we need only prove 4.1(1) and 4.1 (2)(i),
and the latter only when k = p. … We are assuming that ρ̄ is modular, and thus the assumptions (α) and
(β) are fulfilled … At this point we are done by invoking Theorem 9.7." Theorem 9.7 is stated on p. 89
under §8.2's assumptions and its proof ends on p. 90 "At this point we are done by Propositions 9.2 and
9.3, and solvable base change results of Langlands" — no Theorem 6.1, no Theorem 10.1. Theorem 10.1 is
introduced on the same p. 90 as "the following corollary of Theorem 8.2, Theorem 6.1 and Propositions
9.2 and 9.3", and it is §10.3.1, the proof of Theorem **5.1**, that uses it: "The finiteness of R̄_S as
an O-module follows from Theorem 10.1." So the circularity R22.5 guards against does not exist, and
R24.4's placement after R24.1–R24.3 delays every consumer of Theorem 4.1 for nothing.

**Finding 14, Kisin's corollary.** Kisin's Corollary (JAMS 21 (2008), p. 514) is stated for *any*
Hilbert modular eigenform of weight k with kᵢ ≥ 2 of the same parity and ρ̄_π absolutely irreducible —
no discrete-series hypothesis — and the paragraph after it explains that the even-degree case comes
from Taylor's interpolation together with Theorem (2.7.6). KW II Lemma 7.7 (p. 67) is likewise stated
with no such hypothesis. The R19.5 node covers only Saito's theorem under Carayol's parity hypothesis,
so the general case has no owner.

**Finding 30, the almost-strict limitation.** I read Skinner's paper itself, which is open access. Its
Theorem 1 gives potential semistability and the Weil–Deligne comparison at every v | p for π of motivic
weight with **no** residual hypothesis, and its introduction says in terms that Kisin's route needs
ρ̄_π residually irreducible and that this paper proceeds differently. That is exactly the statement KW
II p. 93 says would upgrade the Brauer-induced systems to strictly compatible ones. The atlas records
only Saito, and only under Carayol's hypothesis.

**Finding 36, the wrong section number.** The Annals PDF is RC4-encrypted and carries no ToUnicode
maps, so I decrypted it with the standard security handler and decoded the TeX text encodings to read
it. Its headings are 1.1 Notation and terminology, 1.2 Acknowledgements, 3.1 Minimal lifts, 3.2
Flatness of minimal deformation ring, 5 Low levels and weights, 6.2 Killing ramification. §5 has
Theorems 5.2, 5.4, Corollary 5.5 and Theorem 5.6 and no subsections; killing ramification is §6.2,
opening on p. 250. The only "§5.2" in the paper is p. 231's citation of Khare–Ramakrishna. R26.1 and
R24.3 both carry the preprint number.

**Finding 5, the ordinary fibre.** I recomputed the counterexample independently: for y² = x³ + 3x + 2
over F₅, 4a³ + 27b² = 216 ≡ 1 (mod 5) so the curve is smooth, the affine points are (1, ±1) and
(2, ±1), hence #E(F₅) = 5, a₅ = 1, E is ordinary and E(F₅) ≅ Z/5 is an étale subgroup scheme of order 5
distinct from ker F. The node's sentence is false as written, and the hypothesis and acceptance item it
carries rest on it.

**Finding 6, Chenevier.** Theorem 2.22(i) in Chenevier's own source assumes only that the determinant
is Cayley–Hamilton and A henselian, with D̄ split and absolutely irreducible; Definition 2.19 is as
quoted. The lemma the fix adds is correct: an absolutely irreducible D̄ makes R̄/ker(D̄) a central
simple algebra of degree d over the residue field, and over a finite field Wedderburn's theorem makes
that M_d(k). So the descent the decomposition keeps open as a gap is not needed.

## Two corrections to the scope of a finding's reasoning

Both findings are confirmed; in each the sentence quoted below is true of the graph the finding names
and false of the graph that also carries the accepted link maps, and in each the layer the finding
actually indicts is unaffected.

- **Finding 16** says "No LocalGaloisDeformationRings stage has the owner, Tau Ceti ClassFieldTheory
  Layer 5, as an ancestor. This holds for the atlas graph and for the graph with all accepted
  restructuring links." Both of those are right. But the accepted link map
  `data/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json` adds Layer 5 → `ArithmeticGaloisDuality:D7`,
  and with the link maps applied R08.3, R08.4, R08.5, R08.6, L7 and L8 do acquire Layer 5 as an
  ancestor — not through D7 at all, but through Layer 5 → `VectorBundlesAndIsocrystals:VB0` →
  `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` → R08.3, an isocrystal route that supplies no
  duality. **R08.1 and R08.2, where the tangent, dimension and smoothness calculations sit and where
  the finding locates the defect, have no Layer 5 ancestor in any of the three graphs.** The fix, the
  edge Layer 5 → R08.1, is acyclic and is still the missing one.

- **Finding 27** says the ancestor closures of R23.1, R23.5, R24.1 and R24.5 contain no Chebotarev
  layer. That is right for the atlas with the accepted restructuring links, which I reproduced. With
  the accepted link map CH-L12 (Chebotarev Layer 10 → `GlobalGaloisDeformations:R04.5`) — which the red
  team's own `checked` list records as accepted — R23.5, R24.1 and R24.5 do acquire it, by
  R04.5 → R04.6 → R24.1 and R04.5 → R21.4 → R22.6 → R23.4 → R23.5. **R23.1, the finding's locus and the
  layer that applies Moret-Bailly, has no Chebotarev ancestor in any of the three graphs**, so the fix
  — add Chebotarev Layer 10 as a prerequisite of R23.1, which is acyclic — is exactly the edge still
  missing.

## Limits of this check

**Three sources are page images here.** The Numdam scans of Deligne's Bourbaki exposé 355 (finding 5),
Carayol's Annales ENS paper (finding 4) and Skinner–Wiles, Publ. IHÉS 89 (findings 32 and 33) are
CCITT-fax page images with no text layer, and this environment has no renderer or OCR; Springer, the
alternative for Skinner–Wiles, is unreachable from here, as an earlier review of mine recorded. For
those four findings the quotations are the red team's reading, not mine, and each verdict says so. In
every case I verified the rest independently: the atlas and library facts, the bibliographic
identifications, and the mathematics. Finding 5's substance does not depend on the quotation at all —
the node's statement is false however Deligne phrased his; only the `sourceIssue` the fix proposes
turns on whose slip it is, and the fixer will see that on reading p. 157.

**Bracketed references in the Khare–Wintenberger PDFs.** The text layer of both author preprints drops
whole sentences that carry bracketed reference numbers — for instance KW II p. 93's "…, see [61] and
[6], such that each member is irreducible, see [62]", p. 67's "The following result is the corollary in
the introduction to [39]…", p. 22's "The second part is a result of [3]" and KW I p. 21's "It provides a
converse to the theorem of Deligne and Serre in [10]". In each case the surrounding text is verbatim as
the report gives it and settles the mathematics; the reference *keys* come from the red team's reading.
Where a reference matters I checked it another way: the bibliography entry "Invent. Math., 98(2):265–280,
1989" is Taylor's construction paper (finding 2), "Journal 128 (2005), no. 1, 141-197" is Savitt's
(finding 7), and Khare's own arXiv source names `[Savitt1]` as "On a Conjecture of Conrad, Diamond, and
Taylor".

**What I did not do.** I did not read the seven roadmaps' stage texts in full, only the stages the
findings name and their neighbours; I did not re-derive the red team's corpus-wide duplication searches,
only the ones a finding rests on; and I add no finding of my own. AUDIT-32, AUDIT-33 and AUDIT-34 are
pending review, and the report is right to use them, as its `checked` list says, only for library
absence and duplicate leads; I treated them the same way.

## Checks

    python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-langlands-2.result.json \
                                     research/blueprint/redteam/RT-AREA-langlands-2.review.json

Both report no errors. Thirty-five confirmed findings are of high or medium severity and become
`FIX-RT-AREA-langlands-2`. Findings 17 and 31 should be fixed together, as the report says, and so
should the two halves of finding 7 and of finding 12, which two sub-teams found independently.
