# Review of PAPER-PASKUNAS-QUAST-26

**Job** REV-PAPER-PASKUNAS-QUAST-26 (issue #1345) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All six routes accepted; both `sourceIssues` confirmed; a source
note added and no other correction.

Paper: Vytautas Paškūnas and Julian Quast, *On local Galois deformation rings: generalised reductive
groups*, [Forum of Mathematics, Pi **14** (2026), e15, 96 pp.](https://doi.org/10.1017/fmp.2026.10030).

## Source

The published Cambridge hash does not reproduce and cannot. A fresh download today gave
`b336113ee34901fde3351a622014c63458356d265cce31a313e5b0e54a43383a` against the recorded
`c265f54f…`, and every page of my copy carries *"IP address: 178.33.239.142, on 23 Sep 2026 at
20:59:15"*. A `sha256Note` now records this and names the arXiv e-print as the reproducible pin. This
is the **sixth** instance in the corpus, after `PAPER-HE-18`, `PAPER-HE-21`,
`PAPER-SHANKAR-SHANKAR-TANG-ETAL-22`, `PAPER-BHATT-MATHEW-23` and `PAPER-HACON-WITASZEK-23`.

I read the published PDF (96 pages, printed page = PDF page) and the arXiv e-print
(`05a2306efbfa0dabbc885bb86e23b090e8254c19b244ce1fe9140ffa9637e003`, single source file
`defG_REV.tex`, 6796 lines), which carries both findings verbatim.

## Structure

84 items: 80 missing, 3 planned, 1 library. Six routes — one Part II, five source. Every missing item
is routed exactly once, all seven source stage ids resolve, all three planned ids resolve, and
`check_paper.py` passes.

The Part II parent `LocalGaloisDeformationRings` exists and the proposed title reproduces its atlas
title exactly — *Local Galois deformation rings and their components, Part II: complete intersection,
irreducible components and normality of unrestricted deformation rings* — with area `langlands`, a
galaxy id, and a 458-word brief. Generalised reductive groups, R-parabolics and R-Levis, the
generalised pseudocharacter ring `R^ps_G`, the complete-intersection property and the irreducible
components are the paper's own subject and none of it is in the parent, which owns the `GL_d` theory
the paper generalises. The five source routes send back what belongs elsewhere: `R08.1` for the
parent's own material, `R03.1` and `R03.3` for the commutative algebra, `IHG.0` and `IHG.1` for
determinants and pseudocharacters, `D7` for local duality and `VS2` for the condensed input — which
is also where the single library item lands. Its three declarations resolve: Mathlib's
`CondensedSet`, `Condensed.discrete` and `CondensedSet.isDiscrete_tfae`.

**Locators.** 112 of 114 name-and-page checks land exactly. The two others are right as well: items 1
and 5 give the *introduction's* page for Theorems 1.1 and 1.5–1.6 and then name the body statements
(Theorem 16.2, Remark 13.33) in parentheses, which are on pp. 86–88 and 71. No locator error.

## The two findings

**E2** is confirmed verbatim: `every ρ ∈ X^gen_{GL_d}(A), where A ∈ R^ps_G-alg`, where the functor is
defined on `R^ps_{GL_d}`-algebras, the rest of the same lemma is stated for `R^ps_{GL_d}`, the proof
immediately above works over it, and `R^ps_G` is introduced only in §7.2. A substitution slip.

**E1 is the substantial one, and it is an error in a stated result.** §11 opens

    Let $G$ be a generalised reductive group over an algebraically closed field $\kappa$.

with no condition on the characteristic, and Proposition 11.5 is stated exactly as the finding quotes
it. Its proof turns on

    If $\psi = \omega$ or $\psi = \omega^{-1}$ then $\psi^{p-1} = 1$,

where `ω = χ_cyc ⊗_{Z_p} κ`. That implication holds because the reduction of the cyclotomic character
has order dividing `p − 1` — a statement about characteristic `p`. In characteristic zero `ω = χ_cyc`
has infinite order and the step fails; and Lemma 11.4, to which the rest of the proof reduces, has
`ψ ≠ ω^{±1}` as its **first hypothesis**. So the case the proof disposes of separately is exactly the
case its own lemma excludes, and in characteristic zero nothing covers it.

The recorded counterexample sits in that gap: `G = PGL_2`, `P = B_2`, `L = T_2`, `κ = Q̄_p` and a
non-split `(1 b; 0 χ_cyc)` give `ψ = χ_cyc^{−1} = ω^{−1}`, with (1) holding by non-splitness, (2)
because `ψ` has infinite order while `H_0 = μ_{p−1}`, and (3) vacuously since `G_1` is trivial.

The correction is right and its evidence checks out. The proposition's only application is
Proposition 14.5, whose proof works throughout on the special fibre `X̄^gen_{G,ρ̄^ss}` and with
`φ: G_k → Aut(G⁰_k)`, so `char κ = p` there and nothing downstream is affected — which is why the
grading is an error in a stated result and not in the proof of anything the paper needs.

## One provenance gap, not filled

No `libraryPins` are recorded. This is the **seventh** extraction reviewed today with that gap —
`PAPER-BHATT-MATHEW-23`, `PAPER-WOOD-19`, `PAPER-HACON-WITASZEK-23`,
`PAPER-CANNING-LARSON-PAYNE-24`, `PAPER-IM-KIM-LE-ETAL-24` and `PAPER-FENG-24` are the others —
which confirms it as a queue-level omission rather than a series of oversights.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.review.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this review.
