# REV-PAPER-BENOIST-19 — review of the extraction of Benoist, "The period-index problem for real surfaces"

Job: #1455. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-BENOIST-19.result.json`, by session cc-442dc5.

**Verdict: accept.** No item, status or route changed. One recorded mistake is rejected,
two are corrected in place, and the remaining eighteen are confirmed.

## What I read

Olivier Benoist, *The period-index problem for real surfaces*, Publ. Math. IHÉS **130**
(2019), 63–110; doi:10.1007/s10240-019-00108-7.

The published version, re-fetched from Numdam, SHA-256
`8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b` — matching the recorded
hash — all 48 pages. Fetched into scratch only. Published page *n* is PDF page *n* − 62.

No later version or erratum corrects anything below: arXiv 1804.03642 stops at v2,
Crossref's DOI record carries no update or relation entry, and the volume lists no
corrigendum (checked 23 September 2026).

## The rejected mistake

**E16 is rejected: the paper does not contain it.** The finding records `kernel` as printed
in the proof of Proposition 7.1 following (7.14), and asks that the argument instead use
torsion-freeness of the **cokernel** of the Picard cycle class map. But p. 103 already
prints exactly that:

> Since the cokernel of Krasnov's cycle class map cl : Pic(U⁰) → H²_G(U⁰(C), Z(1)) is
> torsion-free [9, Proposition 2.9], and since the restriction map Pic(S) → Pic(U⁰) is
> surjective, there exists μ ∈ Pic(S) such that η − p_*γ = cl(μ|_{U⁰}).

I searched every occurrence of "kernel" in the published text. They are the two `Ker[…]`
definitions on pp. 70 and 71, and Assumption 4.1(ii) on p. 80 ("the kernel of the
restriction map H¹(S(R)) → H¹(Ψ)") — none about the cycle class map. Both places where the
paper invokes [9, Proposition 2.9], pp. 85 and 103, say "cokernel" and say "torsion-free".

The finding's own correction is therefore already the printed text. Recording it would have
put a mistake that does not exist into the public errata register. The extraction had
already softened E16 to "affects nothing", noting that "the cited BW1 Proposition 2.9 is
the cokernel statement that the argument uses" — the same observation, stopping one step
short of withdrawal.

## The two corrected in place

**E13's quotation was wrong.** It recorded the printed point as `(0:−1:1:1)`. The paper
prints `[0 : −1 : 1 : 0]`, which I confirmed on the page image; the arithmetic settles it
independently, since `Q = {z² = w² − u² − v²}` contains `[0:−1:1:0]` (0 = 1 − 0 − 1) and
does not contain `[0:−1:1:1]` (1 ≠ 0). Corrected.

With the quotation repaired the finding stands. The proof fixes that one explicit point and
asserts the signs of `f₀, g₀` are constant near it, without checking it avoids the zeros and
poles of the specialised functions — which came from `f, g` chosen earlier and are not
controlled at a pre-selected point. Tellingly, the paper *does* take this care at the second
point a few lines later ("such that x does not belong to any divisor of poles of f₀ or g₀
distinct of D"), which makes the omission at the first point the more clearly an oversight.

**E10's locator was wrong.** It attributed the passage to the proof of Theorem 0.13. The
passage ("To prove the easier inequality u(R(S)) ≥ 4…") is in the proof of Theorem **0.12**,
and no proof of Theorem 0.13 appears on p. 96. Corrected.

## The eighteen confirmed

| id | kind | locator | how confirmed |
|----|------|---------|---------------|
| E1 | error | §3.1, p. 76 | fibre computation + the paper's own p. 77 |
| E2 | gap | Lemma 1.4, p. 70 | two Kummer lifts differ by a Picard class |
| E3 | gap | Prop. 4.4, p. 84 | the printed formula, plus Ψ ⊇ Ξ from p. 79 |
| E4 | gap | Prop. 4.5, p. 84 | coefficient type mismatch |
| E5 | gap | Prop. 4.5, p. 85 | the paper does it correctly on p. 82 |
| E6 | misprint | Lemma 7.3, p. 98; (7.13), p. 103 | composed from Lemma 7.2 and (7.4) |
| E7 | gap | Lemma 7.3 proof, p. 99 | source vs target of the unit map |
| E8 | gap | Prop. 6.7, p. 95 | (n/2)α undefined for odd n |
| E9 | gap | Thm 0.12 proof, p. 95 | K/K₀ need not be algebraic |
| E10 | gap | Thm 0.12 proof, p. 96 | **direct computation in m/m²** |
| E11 | misprint | (2.1), p. 72 | Gysin twist must be geometric |
| E12 | misprint | (5.7), p. 88 | forced by the printed target H² |
| E13 | gap | Prop. 0.7 proof, p. 108 | page image; quotation repaired |
| E14 | misprint | Prop. 0.7 proof, p. 107 | the field is K throughout |
| E15 | misprint | Thm 0.6 proof, p. 107 | p. 106 says "non-zero" |
| E17 | misprint | Thm 1.5 proof, p. 71 | `l` undefined; family is `|dnH|` |
| E18 | misprint | §3.1, p. 77 | r = 0, s a unit ⟹ w = 0 |
| E19 | misprint | (5.5), p. 87 | the graph is v = √a₁ g w |

Four are worth setting out, because I settled them by computation rather than by reading.

### E10, by direct computation

The proof chooses local parameters `z₁, z₂` at `x` "such that neither `z₁` nor `z₂` is
proportional to `w²+1` in `m/m²`", sets `y_j := (1+z_j)² + (w+z_j)²`, and asserts `y₁, y₂`
also form a local system of parameters. Expanding modulo `m²`, and using that `w` is a unit
with `w(x) = √−1`:

    y_j ≡ (w²+1) + 2(1 + √−1) z_j  =:  a + c·z_j,   c = 2(1+√−1) ≠ 0.

Write `a = α z₁ + β z₂` in the basis `(z₁, z₂)` of `m/m²`. The printed hypothesis says
exactly `α ≠ 0` and `β ≠ 0`. But `a + c z₁` and `a + c z₂` are **dependent** precisely when
`α + β = −c`, and that is compatible with the hypothesis: take `α = β = −c/2 = −(1+√−1)`,
both non-zero. So the stated condition does not give the conclusion, and the correction —
choose the parameters jointly so `det(dy₁, dy₂) ≠ 0` — is the right one.

### E1, and why the paper concedes it

§3.1 (p. 76) prints "It is a finite double cover of S ramified over Δ" for
`T := {rv² = sw²} ⊂ X = P_S(O_S ⊕ L)`. Over `x ∈ S` the fibre equation is
`r(x)v² − s(x)w² = 0` on the fibre `P¹`: a non-zero binary quadric, hence finite, **unless**
`r(x) = s(x) = 0`, when it vanishes identically and the whole `P¹` lies in `T`. Since
`D = {s = 0}` meets `R = {r = 0}` by construction, that locus is non-empty in general.

The paper concedes this on the next page, defining "`S⁰ := S ∖ Sing(Δ)` the locus over which
`p` is finite flat", with `Sing(Δ) = Sing(R) ⊔ (R ∩ D)`. Over `Sing(R)` the map is still
finite — there `r = 0` but `s` is a unit, so the equation reads `w² = 0`, the ordinary
double point the paper describes. So the failure is exactly over `R ∩ D`. Nothing downstream
breaks, because §3.2 onwards works over `S*` and `S⁰`.

### E3, and what it does and does not say

Page 84 prints the diagonal arrow of (4.8) as `(a, b, c) ↦ (0, b + a ⌣ [e]₁, …)` and then
concludes `([ζ]₁)|_Ψ = ([e]₁)|_Ψ` "by our hypothesis that `([α̃]₁)|_Ψ = 0`". Feeding
`α̃|_{S*}` through that formula gives

    ([ζ]₁)|_Ψ = ([α̃]₁ + [α̃]₀ ⌣ [e]₁)|_Ψ = ([α̃]₀ ⌣ [e]₁)|_Ψ,

not `[e]₁`. The hypothesis kills `b` and says nothing about `a` — and `a` is not 1: p. 79
defines `Ξ := {x ∈ U(R) : α|_x = 0}` and fixes `Ψ` open and closed **containing Ξ**, while
`[α̃]₀` evaluates `α` at each real point, so `[α̃]₀ = 0` on `Ξ ⊆ Ψ`. The step holds on
`Ψ ∖ Ξ` and fails on `Ξ` whenever `Ξ ≠ ∅` and `[e]₁|_Ξ ≠ 0`. I confirm this as a gap in the
printed justification and, like the extraction, **do not claim Proposition 4.4 false**.

### E5, where the paper contradicts itself

Assumption 4.1(ii) (p. 80) says the kernel of `H¹(S(R)) → H¹(Ψ)` is generated by the image
of `p_*` **and** by Borel–Haefliger classes of curves missing `Ψ`. The proof of Proposition
4.5 (p. 85) uses only the first generator, concluding directly that `δ − cl(θ₂) = p_*γ`. The
proof of Proposition 4.4 (p. 82) does the same step correctly: "there exists `θ ∈ Pic(S)`
such that `[δ]₁ − clR(θ)` is in the image of `p_*`". The repair is what p. 82 already does.

## Items, statuses and routes

- **13 library items**, all read at the pinned commits (Mathlib 082e2d3, Tau Ceti f790474)
  and all saying what the citing item claims. Nothing unresolved.
- **13 planned items**, all naming atlas layers that exist.
- **161 missing items, routed exactly once each.**
- **Run-together numbering repaired in 335 places** (`Proposition4.4`, `item152`,
  `Assumption4.1`, `Layer8`, `pages70`). Restricted to an explicit keyword list followed by
  a digit; the file's many SHA-256 hashes — where hex digits `a`–`f` precede digits — and the
  `§` marks were deliberately untouched, and the file grew by exactly 335 characters.
- **10 routes, all accepted.** Six are source additions to existing owners. The rest:
  - **`RealSurfacePeriodIndex`, new, 89 items** — the route needing most scrutiny, and I
    accept it. Nothing in the atlas owns Benoist's ramified-cover geometry or the
    real-evaluation obstruction, and the reason does not merely assert that: it names the
    near misses and how each differs (RP.2–RP.3 are Brauer–Manin and descent,
    K2SymbolsBrauer is K2 norm symbols, the Charles K3 proposal is different geometry). The
    name is free, unreserved and proposed by no other paper. The brief states the final
    theorems exactly, including the even-`n` criterion, and carries two guards showing the
    extraction understood the paper: "Do not strengthen R to an arbitrary real closed field"
    — which is exactly what Proposition 0.7 shows impossible — and the
    "partial-resolution/Stein-factor distinction", which is finding E1.
  - **Four Part IIs**, each with a title that is an exact prefix extension of its parent's.
    Two of them **join existing proposals** with identical id, parent and title, which is
    what PROTOCOL 15 asks for and what lets the maintainer merge them:
    `DegeneratingHodgeStructures` with PAPER-BAKKER-KLINGLER-TSIMERMAN-20 (46 items) and
    PAPER-GAO-HABEGGER-19 (3 items); `QuadraticFormsRealFunctionFields` with
    PAPER-JANNSEN-16 (1 item). The extraction names only Bakker–Klingler–Tsimerman. Since
    id, parent and title already agree the merge is unaffected, but **the maintainer should
    know all three co-proposers exist.**

A detail worth recording in the extraction's favour: the Part II briefs encode this
review's own findings. Route 6 tells builders to construct the Gysin map "with the dimension
twist M(d′−d), not the degree twist printed in Benoist (2.1)" — that is E11 — and route 8
asks for "a finitely generated descent field enlarged to contain a transcendence basis"
(E9) and for the builder to "verify the simultaneous parameter determinant, not just the two
individual nonproportionality tests" (E10).

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BENOIST-19.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
