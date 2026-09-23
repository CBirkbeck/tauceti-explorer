# Review of PAPER-SCHOLZE-26

**Job** REV-PAPER-SCHOLZE-26 (issue #1411) · **Date** 2026-09-23 · Claude Code, session `cc-7b31c4` ·
**Verdict: accept.** All six routes accepted; all three `sourceIssues` confirmed; nothing corrected,
rejected or deleted.

Paper: Peter Scholze, *Berkovich motives*,
[J. Amer. Math. Soc. **39** (2026), 697–764](https://doi.org/10.1090/jams/1068); read in arXiv
[2412.03382](https://arxiv.org/abs/2412.03382) v3, whose hash reproduces as
`440b4a82eca992d1b7edb5c608bd7de8c336cce7f623f290aa95002cab57d484`. The JAMS version is paywalled
and was not compared, as the extraction records.

## Structure

55 items: 50 missing, 5 planned. Every missing item is routed exactly once, all seven stage ids
exist, all five planned layer ids exist, and `scripts/check_paper.py` passes.

Two **planned** items, 4 (the Berkovich spectrum and completed residue fields) and 6 (the Berkovich
closed disc), appear in the `TropicalAndBerkovichArithmetic` source route. That is not a defect: it
is the provision in PROTOCOL §16 that "a source route may also name planned items the paper is a
good source for", and TB.0/TB.1 are exactly the stages those two items are planned at.

**Coverage.** 167 numbered environments appear in the text and all but one are carried into items —
Examples 3.5 and 3.7 sit inside item 9 ("Examples 3.4–3.8, Proposition 3.9") and Corollaries 8.1–8.2
inside item 30. The single exception is Remark 1.4, the comparison with the derived category of
v-sheaves in the introduction, which states nothing the roadmap has to plan.

**Locators.** 143 name-and-page checks land on exactly the page given. The apparent misses are my own
parsing of lists like "Definition 2.13, Theorem 2.14, Corollary 2.15", plus E2's locator for the
proof of Theorem 6.3, which is stated on p.35 and proved on p.36.

**Statements.** I sampled them against the paper and they are faithful down to the conventions:
Definition 2.1 does ask only for `|0| = 0`, `|−1| ≤ 1`, submultiplicativity and subadditivity, with
norm-nonincreasing maps, which is what item 1 records, including that `R = 0` is allowed because
`|1| = 1` is not required.

## The Part II route

The title reproduces the parent's atlas title, "Algebraic cycles, pure and mixed motives", exactly,
the area `motives` is a galaxy id, and the brief is 371 words. What makes this route right is that it
opens no roadmap: its first sentence coalesces with `MotivesRigidAnalyticPartII` as proposed by
`PAPER-BINDA-KATO-VEZZANI-25` — same id, same title, same parent, same area, which I checked in that
file — and adds Berkovich motives as a branch reusing the Part II's formal layers. The brief is
explicit that this construction reproves several of the endpoints Part II already plans through
Ayoub's `RigDA`: the motivic Fontaine–Wintenberger equivalence (Propositions 6.8 and 9.7), generation
by motives with good reduction (Proposition 10.1), and motivic nearby cycles with monodromy (Theorem
1.14). A separate roadmap would have duplicated them, which PROTOCOL §15 forbids.

The five source routes each land where the layer description says the material lives: TB.0 for the
Berkovich spectrum of a Banach algebra with its completed residue fields and TB.1 for the point
types on the line; K.5 for Suslin excision for Tor-unital rings; S.3 and S.5 for Thomason–Trobaugh,
cdh and pro-cdh descent and 𝔸¹-invariance; RT.5 for Efimov's K-theory of dualizable categories; and
`E5:presentability` for compactly assembled and dualizable presentable categories.

## The three findings

- **E1.** Page 14 prints "it can be explicitly described as `C⟨(T−a)pm1⟩_{x_a}`, the uniform
  completion of the free seminormed ring `C[(T−a)^{±1}]_{x_a}` with `|T−a| = |(T−a)^{−1}|^{−1} =
  x_a`", so the same ring appears with `±` one clause later: an unescaped `\pm` in the source.
- **E2.** Confirmed in all three places. In the proof of Theorem 6.3 (p.36) the ambient space is the
  Berkovich line `A¹_C` over the algebraically closed field `C`, and the sentence reads "the
  complements of each of `U, U₁, U₂` and `V` in `P¹_A` is a finite disjoint union of closed discs";
  Lemma 6.5 (p.37) says "`U, V ⊂ A¹_C` … whose complements in `P¹_A` are finite disjoint unions of
  closed discs"; and its proof opens "Assume that the complement of `U` in `P¹_A` is the union of
  closed discs `Z₀,…,Z_d`". No Banach ring `A` is in scope in either statement.
- **E3.** Example 3.6 (p.16) prints "Let `A` be any Banach ring. The map `A → B = ∏^Ban_{x∈M(A)}
  K(x)` is an arc-cover. The target is an example of a totally disconnected Banach ring as defined
  below", while Definition 3.10(i) on the same page requires a totally disconnected ring to be
  **analytic**, uniform and to have profinite Berkovich spectrum. For a discrete Banach ring — `Z`
  with the trivial norm — every `K(x)` is discrete and `B` is not analytic. The repair recorded is
  the paper's own Example 3.4, which arc-covers any nonzero Banach ring by `A[T^{±1}]_{1/2}` and
  concludes that "locally in the arc-topology we can assume … that `A` is analytic".

## What this review did not do

I read §§2–3, 6 and 8 around the findings, the statements of every result the routes cite, and the
definitions those depend on — not all 65 pages line by line. I add no finding of my own, and I did
not compare the published JAMS text, which is paywalled.
