# Review of PAPER-BHATT-MATHEW-23

**Job** REV-PAPER-BHATT-MATHEW-23 (issue #1366) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All seven routes accepted; all eight `sourceIssues` confirmed; one
correction made in place; nothing rejected or deleted.

Paper: Bhargav Bhatt and Akhil Mathew, *Syntomic complexes and p-adic étale Tate twists*,
[Forum of Mathematics, Pi **11** (2023), e1](https://doi.org/10.1017/fmp.2022.21), 26 pages, read
against the arXiv v2 e-print [2202.04818](https://arxiv.org/abs/2202.04818).

## Source and hashes

The arXiv v2 e-print hash reproduces byte for byte:
`d1332b570f2338edf59c4c2d578a1db5fe3205db47460342192c1b7fbf525b39`, and the archive contains the
recorded 2418-line `syntomic-etale-final.tex` and its `.bbl`, which I read in full.

The published Cambridge hash does not reproduce and cannot. Two fresh downloads today gave
`96e05343…` and `3bedeca4…` against the recorded `abbfd5b2…`, because Cambridge stamps every download
with a footer carrying the date and the requesting IP. **Correction made:** a `sha256Note` on that
artifact now says so and names the arXiv e-print as the reproducible pin. This is the fourth instance
in the corpus; `PAPER-HE-18`, `PAPER-HE-21` and `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22` carry the same
note.

## Structure

102 items: 74 missing, 27 planned, 1 library. Seven routes — two Part II, five source.

Every missing item is routed exactly once; all six source stage ids exist
(`PrismaticCohomology:PR.4`, `DerivedDeRhamCohomology:DD.0`,
`DeformationAndDerivedPatchingAlgebra:R03.1` and `R03.3`, `SchemeAndStackFoundations:SF.0`,
`RefinedTraceMethods:RT.6`); all 27 planned ids resolve, spread over `PR.0`–`PR.5`, `DD.0`–`DD.5`,
`CrystallineCohomology:CR.4` and `PerfectoidQuotients:Q3`; both Part II parents exist and both titles
reproduce them exactly —

| roadmap id | parent atlas title | area |
| --- | --- | --- |
| `PrismaticCohomologyPartIIFSmoothnessAndEtaleTateTwists` | Prismatic cohomology: relative, absolute, Nygaard and log variants | `padic` |
| `LocalFieldsPartIIKatoSwanConductors` | Local fields and ramification | `padic` |

— both areas are the galaxy id `padic`, and `check_paper.py` and `intake.py check-files` both pass.
The single library item's two declarations resolve: `IsRegularLocalRing` and `IsRegularRing`, both in
Mathlib's `RingTheory/RegularLocalRing/Defs.lean`.

**One provenance gap I did not fill.** The extraction records no `libraryPins`, so there is no commit
against which that library claim was checked. I verified both declarations against the Mathlib index
this lane uses and they are there, but I have not invented a pin the extraction did not use; the
field should be added by whoever next touches the file.

**Locators.** Printed page numbers equal PDF pages. Of 90 name-and-page checks, 87 land exactly. The
three others are right too: item 007 is anchored "before Example 1.6, p. 2" and Example 1.6 opens at
the top of p. 3; Construction 2.7 opens on p. 6 and item 026 cites its "final paragraph, p. 7";
Proposition 3.12 is stated on p. 11 and its proof, with equation (10), runs onto p. 12. No locator
error.

## The eight findings

All are confirmed, in both the published PDF and the arXiv v2 source. Five of them are decided by the
paper contradicting itself, which is the strongest kind of evidence available here.

**E2.** Proposition 3.12 states
`H¹(N^{≥*}Δ̄_{R[x]}) ≅ A^{≥*−1}{−1} ⊕ ⊕_{i=1}^{p−1} A^{≥*−1}/A^{≥*}`, and the first paragraph of its
own proof says the class `dx` "produces a map of `A^{≥*}`-modules
`A^{≥*−1}{−1} → H¹(N^{≥*}Δ̄_{R[x]})`". The display at the end of the proof writes `A^{≥*}{−1}` for
that summand. The weight bookkeeping the proposition records — the generator sits in weight one —
settles which is right.

**E3.** Proposition 4.6 is titled *Stability of F-smoothness under filtered colimits and étale
localization*, and its entire statement is "The property of being F-smooth is stable under filtered
colimits"; its proof is about a filtered diagram only. Definition 4.1 cites it for "F-smoothness is
preserved by Zariski localization", and the proof of Proposition 4.9 is "Combine Proposition 4.8 and
Proposition 4.6". What both need is Proposition 4.7, which ends "In particular, F-smoothness is étale
local and passes to étale algebras" — and which Proposition 4.10 does cite correctly for
localizations. The recorded correction is right; the defect can equally be read as Proposition 4.6's
statement having lost the half its own title promises.

**E1.** "Recall that the latter is defined as an equalizer:
`F_p(i)(A) = eq(N^{≥p−1}Δ_A{p−1}/p ⇉ Δ_A{p−1}/p)`". "The latter" is `F_p(i)(A)`, whose equalizer is
in weight `i` by equation (1) and Construction 2.2; `p − 1` is the weight of `v_1`, which the same
paragraph has just been discussing, and (24) two lines later uses weight `i`.

**E4 and E5 are a swapped pair**, and the record does not say so. On p. 23 the proof of Proposition
5.7 cites "[BS22, Th. 4.1]" for the odd vanishing theorem, while Construction 2.2 cites the same fact
as "[BS22, Th. 14.1]" — in Bhatt–Scholze, 4.1 is the definition of the prismatic site and 14.1 is the
discreteness theorem. One paragraph earlier on the same page, "[BK86, Th. 14.1]" is cited for
surjectivity of the symbol map, and Bloch–Kato's paper has sections 0–9 and no Theorem 14.1; the
statement meant is its Theorem (1.4). The number 14.1 has migrated from one citation to the other.
Each correction is secure on its own; together they are hard to doubt.

**E8.** "by construction, this class is annihilated by `A^{≥1}` since `R/p^{(−1)}[x^{1/p}]` is by
definition, whence we obtain maps in from `A^{≥*−1}/A^{≥*}`" — the subordinate clause has no
predicate. The reason intended is the recorded one, and the fiber sequence displayed immediately
above is what identifies `gr⁰Δ̄_{R[x]} = R/p^{(−1)}[x^{1/p}]`.

**E7.** "Let `X` be a smooth scheme over `O_K` with special fiber `k`", two sentences after `k` was
introduced as the residue field, and display (30) uses `W_nΩ^{i−1}_{X_k,log}`.

### E6 is the substantial one, and it is stronger than recorded

The theorem is the Geisser–Sato–Schneider comparison, stated for `X` a regular scheme of finite type
over a Dedekind domain `A` and **semistable** over the characteristic-`p` points of `Spec(A)`; `R` is
the strict henselization at a characteristic-`p` point and `π` the uniformizer of `A`. The proof
writes

    Since R is a UFD (as a regular local ring), we have R[1/p]^× = π^Z ⊕ R^×.

That identity is not merely unproved; it is false in the stated generality. Take
`X = Spec Z_p[x,y]/(xy − p)`, which is regular and semistable over `Z_p`, and the point `x = y = 0`.
`R` is a regular local ring, hence a UFD — which is the step the proof actually uses — and its
height-one primes containing `p` are `(x)` and `(y)`, so

    R[1/p]^× = R^× × x^Z × y^Z,   π = p = xy.

The valuation vector of `x` is `(1,0)` and that of `p` is `(1,1)`, so `x ∉ π^Z·R^×`. The recorded
correction states the right decomposition, `R[1/p]^× = R^× × t_1^Z × ⋯ × t_r^Z` for the local
equations of the branches, and is candid that the printed reduction to `i = 2` covers only `r = 1`.
The remaining gap — symbols `(1 + πa) ⊗ t_1 ⊗ t_2` with `i ≥ 3` and several `t_k` among the `b_j` —
is real, and `{π, −π} = 0` does not reach them. Grading it as a gap affecting the proof rather than
the stated result is right: the theorem itself is not in doubt, and the `i = 2` case is repaired by
applying the same bilinearity to each `t_k`.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-MATHEW-23.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BHATT-MATHEW-23.result.json research/blueprint/papers/PAPER-BHATT-MATHEW-23.review.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this review.
