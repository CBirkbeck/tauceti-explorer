# REV-PAPER-YUAN-26

Independent review of the extraction of Xinyi Yuan, *Arithmetic bigness and a uniform
Bogomolov-type result*, Annals of Mathematics **203** (2026), no. 1, 15–119
(doi 10.4007/annals.2026.203.1.2; arXiv 2108.05625).

Issue [#1051](https://github.com/CBirkbeck/tauceti-explorer/issues/1051). Reviewer: Claude Code,
session cc-d67081, 23 September 2026.

**Verdict: accept.** All twelve routes accepted. One clause of a `correction` was fixed in place;
one naming question is referred upward rather than edited.

## The source

The author manuscript of 21 August 2024 was re-downloaded from the author's page and hashes to
`b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e` — **the recorded hash, byte for
byte**. 126 pages; **printed page = PDF page**.

The published Annals version is subscription-only and this review did not obtain it either. The
extraction is explicit about that in its own `gaps` field, and says a design job must check the
printed wording of Theorem 4.19 before planning its function-field case. That is the right way to
record it, and I have not weakened it.

## Mistakes

All **30** findings were checked at their locators. **All 30 are confirmed.** Every `printed` field
is a real quotation, and most findings are settled by the paper contradicting itself:

| id | what settles it |
|----|-----------------|
| **E3** | the two halves of one sentence force `δ(C) = δ(C)/f`, i.e. `δ(C) = 0` for every curve with split semistable reduction |
| **E5** | three slips in one transplanted sentence, including the self-referential "`v ∈ S^an_v`" |
| **E8** | p. 40 says in terms: "we require g > 1 in this section, while we only require g > 0 in the previous section" |
| **E12** | the parallel display four lines above carries the `π*` |
| **E14** | Theorem 2.10(2) states the identity `in Pic(X ×_S X)_Q`; the recall drops it to `Pic(X)_Q` |
| **E22** | Lemma 4.3 assumes the finiteness that its application concludes |
| **E25** | the announcement drops the `c(g)` that the proof and the next paragraph both carry |
| **E29** | the closing sentence contradicts the plan three pages earlier |
| **E30** | p. 89 defines `λ_{O_K}`; p. 93 writes `λ̄_K` (read on page images — the text layer does not resolve the subscript) |

### E1 is the one that matters, and it is decisive

Theorem 4.19 (p. 101) covers "a number field **or a function field of one variable**" and a
quasi-projective `S` over `K`, with "maximal variation"; §1.6 (p. 16) defines that relative to the
base ring, which here is `K`, as generic finiteness of `S → M_{g,R}`, "i.e. there is an open and
dense subscheme U of S such that the induced morphism U → M_{g,R} is quasi-finite".

Take `K = k(t)` and `S = Spec K`. The hypothesis holds **vacuously** — `S` is its own dense open and
a morphism from a point is quasi-finite — and `m = 1 ≥ dim S + 1` is allowed. But for a constant
family `X = C ×_k K` of genus ≥ 2 the points of `C(k̄)` are constant sections of canonical height 0
and are Zariski dense in `X_{K̄}`, so the relative Bogomolov conclusion fails. This is the familiar
reason function-field Bogomolov statements exclude isotrivial families, and the paper's own proof
says what was meant, in the same paragraph:

> Similar to Proposition 4.18, we need the bigness of the adelic line bundles **over k instead of
> over K**, where k = ℤ if K is a number field and k is the field of constants if K is a function
> field of one variable.

## Corrected in place

One clause of **E1's** correction asserted that generic finiteness of the moduli morphism on a
`k`-model is *equivalent* to non-isotriviality over `k`. That overstates. It implies
non-isotriviality, but is strictly stronger once `dim S > 0` — a family over a surface whose moduli
image is a curve is non-isotrivial and not maximally varying — and the two coincide only in the
`dim S = 0` case of the counterexample. What the proof needs is the bigness input of Theorem 4.5
over `k`, for which maximal variation over `k` is a *sufficient* hypothesis; the paper does not prove
it necessary.

This matters beyond the wording. **The open handoff PR #2299 raises the same objection against the
parallel clause in the errata register's own E1 for this paper**, and the two should be reconciled
together.

### A second point for that reconciliation

The extraction's **E7** gives the *correct* form of the stable-curve correction — "any SMOOTH
(nonsingular) rational irreducible component, as in Deligne–Mumford Definition 1.1(iii)" — and its
counterexample is right: an irreducible rational curve with two self-nodes is reduced with ordinary
double points, has arithmetic genus 2, is stable in the Deligne–Mumford sense (its only component is
singular, so the condition is vacuous for it), and meets other components in 0 < 3 points, so the
printed definition on p. 16 excludes a genuine boundary point of `M̄₂`.

The **errata register's E4** for this paper instead adds the clause "a rational component with a
self-node meets them in at least one", which that very curve refutes — and which PR #2299 objects to
on exactly that ground. For a connected curve of arithmetic genus ≥ 2 the Deligne–Mumford condition
is equivalent to the branch count `2s + r ≥ 3` on each rational component, which is the handoff's
formulation. **I recommend the maintainer prefer the extraction's E7 wording.**

## Referred upward, not edited

Route 9's Part II title, "The Jacobian challenge, Part II: relative Jacobians and theta identities",
is **not** an exact prefix extension of its parent's atlas title, "The Jacobian challenge (Christian
Merten's AG version)", as PROTOCOL §15 requires.

I did not fix it. `PAPER-DIMITROV-GAO-HABEGGER-21` carries the same id, parent and title
byte-identically, and its review has already accepted that route — indeed it says "Relative Jacobians
of the universal curve go to YUAN-26's JacobianChallengePartII" — so editing one copy would break the
coalescence the queue depends on. The maintainer should normalise both together, or record that the
parenthetical is a disambiguator of the upstream document rather than part of the roadmap title.

The other three Part II titles are exact prefix extensions, and all four proposed ids are free.

## Items, statuses, routes

**281 items: 5 library, 31 planned, 245 missing.** Every missing item is routed exactly once, all
dependencies resolve, and nothing is routed twice. The five library declarations were opened at the
pinned commits and each says what its item claims. All thirteen cited stage ids and all seventeen
planned targets exist in the atlas index.

Twelve routes, all accepted: seven source routes into GZ.2, TB.2/3/6, R35.2/3, A1, C5, RP.0 and
R11.3/4, a further source route into R35.5/6, and four Part IIs. The findings distribute sensibly
across them — the appendix findings (E24, E28, E29) travel with the Gross–Zagier route, the
non-archimedean ones (E3, E4) with the Berkovich route, and the Bogomolov ones (E1, E20, E21, E22)
with the Heights Part II, whose brief must state Theorem 4.19 with maximal variation over the field
of constants.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **4 files, 0 problems**
- **No Lean was written or compiled.**
