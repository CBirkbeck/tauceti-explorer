# REV-PAPER-FENG-GALATIUS-VENKATESH-22

Independent review of the extraction of Tony Feng, Soren Galatius and Akshay Venkatesh, *The Galois
action on symplectic K-theory*, Inventiones mathematicae **230** (2022), 225–319
(doi 10.1007/s00222-022-01127-8, open access; arXiv 2007.15078).

Issue [#1267](https://github.com/CBirkbeck/tauceti-explorer/issues/1267). Reviewer: Claude Code,
session cc-d67081, 23 September 2026.

**Verdict: accept.** All five routes accepted. No item, status, route, locator or quotation changed.

## The source, with a limitation

The paper is open access and the extraction records the published PDF's SHA-256. As with every
Springer-published paper I have reviewed today, **that hash could not be re-verified here**: the PDF
endpoint returns a JavaScript challenge page to every request. I read the published text through a
rendering proxy instead and rebuilt the journal page map from the running heads — **94 marks running
from p. 226 to p. 319**, consistent with the stated 225–319 — and checked every finding at its
recorded page. Crossref records no correction.

## Mistakes

All **17** findings were checked at their locators. **All 17 are confirmed.** The record is careful:
fifteen are classified as affecting nothing and genuinely do not, one is a gap in a proof, and one
reaches a stated result.

### Settled by the paper against itself

- **E5** is not even well typed as printed. The objects are triples `(V, π, s)` with `π : V → M` and
  `s : M → V`, so "`s ∘ π = id_M`" is an endomorphism of `V`; the short exact sequence displayed
  immediately after draws `s` as a section of `π`, giving `π ∘ s = id_M`.
- **E6**'s exponent is fixed by the line above it, which reads `β^{2k−1}`.
- **E9**'s "Theorem 3.3" does not exist; `(3.3)` is the Betti–Hodge map of Theorem 3.5.
- **E11**'s "integral indecomposables" names a *quotient*, which Example 8.3 itself computes as
  `I/(I² + β₁(I₁²))`.
- **E17**'s Rosati condition is circular as printed — the involution is defined by the polarization.

### E10 — the one that reaches a stated result

Theorem 8.1 claims divisibility for each prime `p ≥ max_j(n_j)`. The argument caps with
`ch_{n_j}(ω) = s_{n_j}/n_j!`, which needs `Z_(p)`-integrality, and that fails exactly at `n_j = p`:
by Theorem 3.5 the Adams summand is a retract of `KSp(Z)^∧_p`, so the class with
`⟨ch_p, b_p⟩ = 1/p!` lifts, and `ch_p` is not `p`-integral on `𝒜_g` for large `g`. The distinguished
index cannot be `p` — `p` never divides the numerator of `B_{p+1}`, by Kummer's congruence — but
another part can be, and **the introduction's one-part version already says "in the range when
p > 2k"** (p. 229). The boundary case `p = max_j n_j` is unproved, not disproved, and the finding
says exactly that.

### E12 — a real gap, honestly reported

The deloop's k-invariant `𝒫¹ : K(Z/p,2) → K(Z/p,2p)` connects `π₁(X)` to `π_{2p−2}(X)`, inside the
truncation range, so `τ_{≤2p−2}X` need not split as a product of Eilenberg–MacLane loop spaces;
`α₁ ∈ π_{2p−3}(S)`, detected by `𝒫¹`, is the standard witness. The finding adds that the conclusion
of Theorem 8.4 is **not** contradicted there — the Hurewicz image of `α₁` survives in the
indecomposables — so what fails is the argument, not the theorem. That distinction is what makes the
record usable.

## Items, statuses, routes

**57 items: 1 library, 15 planned, 41 missing.** Every missing item is routed exactly once and all
dependencies resolve. The seven declarations behind the single library item were opened at the pinned
commits. All **26** stage ids cited by the routes and the planned items exist, including the three
Tau Ceti layer anchors.

Five routes, all accepted. Three source routes place single items with their general owners (`M.7`,
`N.6`, `GN.6`). The **Part II** title is an exact prefix extension of "K-theory of number fields and
S-integers" and its id is free; it adds symplectic K-theory, the CM classes, the exhaustion theorem
and the Galois action, importing the ambient K-theory through route 2 and fifteen planned items
rather than re-planning it. The **new roadmap** `EtaleHomotopyTypes` is co-proposed byte-identically
by `PAPER-SCHMIDT-STIX-16` — the natural partner, that paper being about anabelian geometry with
étale homotopy types — so the two coalesce on one design job. Only two items go there, which is
right: this paper needs the pro-space formalism, not a theory of its own, and the appendix findings
(E14, E16) travel with it.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **4 files, 0 problems**
- **No Lean was written or compiled.**
