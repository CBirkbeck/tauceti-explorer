# LLHLM23 — current handoff

Claude Code — cc-58621d; issue 1254; 29 September 2026 (G-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 118 findings,
12 gaps. No Lean deliverable or compilation. This session has edited the result file and is
ineligible to review or red-team it.

## Completed here

- **The G queue is done.** The 39 §7 theorem items without an outline now carry `proofSteps`,
  `prerequisites` and `proofProvenance`, read from the published PDF132–162 with the recorded §7
  findings applied. There are 127 new internal edges, and the graph stays acyclic at 1,568 edges.
- §7 was re-read in full; no new finding.
- Two implicit steps are recorded in the steps:
  - Theorem 7.3.2(2)'s polynomial condition on μ, which must absorb the choice of presentation
    (Lemma 7.3.1);
  - Remark 7.4.3(2)'s use of h ≥ n − 1.

## Resume from here

1. **The last no-outline queue:** the A (56) theorem items without `proofSteps` (Appendix A and its
   global inputs: Thorne, CHT, Labesse and the base-change suppliers). The L items (138) are library
   citations.
2. **The remaining gaps**, as listed in the Q03 step below.
3. **External inputs** noted in the B step (B20, B31, B32), plus §7's imports: Kisin [48], [49];
   Emerton–Gee [22] Theorems 4.8.12 and 4.8.14 and Proposition 4.8.10; and [56, Proposition 3.1.2].

---

# Previous checkpoint (cc-58621d, B-outline step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (B-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 118 findings
(E117 and E118 are new), 12 gaps. No Lean deliverable or compilation. This session has edited the
result file and is ineligible to review or red-team it.

## Completed here

- **The B queue is done.** The 28 §8 theorem items without an outline now carry `proofSteps`,
  `prerequisites` and `proofProvenance`. They were read from the published PDF163–180, with E21, E41
  and E75–E83 applied. There are 147 new internal edges, and the graph stays acyclic at 1,441 edges.
- **E117.** The last paragraph of the proof of Corollary 8.5.2 applies Lemma 8.5.1 at points of P_ss,
  which do not satisfy its hypothesis. The repair works at ρ̄^ss through the patching functor's
  support axiom. B31's steps use it.
- **E118.** Lemma 8.4.9 cites Remark 7.4.3(3), whose depth condition S_{Λ,t} does not give when
  h_{λ+η} > 6n−4. The first sentence follows from the second by semisimplification. B40's steps use
  this.
- Both findings were checked against arXiv v2 and Crossref.

## Resume from here

1. **The remaining no-outline queues:** the A (56) and G (39) theorem items without `proofSteps`. The
   L items (138) are library citations.
2. **The remaining gaps**, as listed in the Q03 step below.
3. **External inputs.** B20 ([56, Corollary 4.2.4]), B31 (the strengthening of [29, Proposition 7])
   and B32 ([56, Theorem 3.4.1]) rest on cited proofs that the paper does not reproduce. They belong
   with the other supplier boundaries.

---

# Previous checkpoint (cc-58621d, K/P/Z-outline step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (K/P/Z-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 116 findings,
12 gaps. No Lean deliverable or compilation. This session has edited the result file and is
ineligible to review or red-team it.

## Completed here

- K45–K48, P17 and Z01 now carry `proofSteps`, `prerequisites` and `proofProvenance`. There are four
  new internal edges, and the graph stays acyclic at 1,294 edges.
- K45 has a direct proof from (2.12); K47 descends semisimplicity by the Jacobson radical.
- Z01 is outlined from its source's main text only; Appendix B was not read in detail.

## Resume from here

1. **The remaining no-outline queues:** A (56), G (39) and B (28) theorem items without `proofSteps`.
2. **The remaining gaps**, as listed in the Q03 step below.

---

# Previous checkpoint (cc-58621d, U-outline step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (U-outline step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 116 findings,
12 gaps. No Lean deliverable or compilation. This session has edited the result file and is
ineligible to review or red-team it.

## Completed here

- **The U queue of the no-outline families is done.** The 26 §3 theorem items (U05–U45) now carry
  source-level `proofSteps`, `prerequisites` (60 new internal edges; the graph stays acyclic at
  1,290 edges) and `proofProvenance`. They were read from the published PDF55–80 with E7–E12 applied.
- §3 was re-read in full; no new finding.

## Resume from here

1. **The other no-outline queues.** These theorem items have no `proofSteps`: A (56), G (39), B (28),
   K (4), P (1) and Z (1). The L items (138) are library citations and need none.
2. **The remaining gaps**, as listed in the Q03 step below: rank-one downstream boundaries,
   Section 2 suppliers, regularity and analytic suppliers, closure-external inputs, global descent
   atoms and the auxiliary projector input.

---

# Previous checkpoint (cc-58621d, Q03 step)

Claude Code — cc-58621d; issue 1254; 29 September 2026 (Q03 step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes,
116 findings (E114–E116 are new), 12 gaps (`appendix-certificates` closed). No Lean deliverable or
compilation. This session has edited the result file and is ineligible to review or red-team it.

## Completed here

- **Q03 (Proposition B.0.1(1)) is settled; this was resume item 1 below.** F1–F3 are the chart's
  equations when the monodromy term of (3.1) is g·Diag(−a, −b, 0)·g^{−1}. The appendix says
  a = (a, b, 0), and (3.1) has + g·Diag(a)·g^{−1}, so the appendix's parameter is the negative of
  (3.1)'s (**E114**). With that sign, the λ-component's elimination ideal equals (F1, F2, F3)
  exactly at five sample points. With the printed sign, none of F1–F3 holds.
- The previous attempt's set-up is the one used here: the chart with c12, the λ-condition, and
  (3.1) mod (v − t)^3 saturated in t. With the parameter Diag(−a, −b, 0) it reproduces F1–F3
  exactly. That note also records an unsuccessful search over signs and orderings, but not in
  enough detail to say why the search missed.
- **The six eliminated coefficients are explicit** (`sourceData.appendixB.q03Resolution.solvedForms`).
  A cofactor certificate shows that they satisfy all 41 chart equations modulo (F1, F2, F3) over
  Z[a, b][1/(aP)]. (F1, F2, F3) is prime over Q(a, b). With Q05's flatness and Proposition 3.3.4,
  this proves B.0.1(1) over Z[1/7!][a, b][1/(aP)].
- **E115.** The formulas for c21 and c31 have the pole a = 0, and at a = 0 the presentation is false:
  E111's point satisfies F1–F3 but is not on the chart for any values of the six coefficients.
- **E116.** The displayed matrix has vc12 for the constant c12; arXiv v2 prints c12.
- The `appendix-certificates` gap is removed. Every Appendix B claim is now certified over
  Z[a, b][1/(aP)] or corrected (E111–E116).
- **Tooling.** Singular via `uv run --with passagemath-singular` worked in this session; each
  computation took seconds. Over a transcendental field Q(a, b), saturating the 13-variable chart
  ideal did not finish in 10 minutes. Work at sample points, or through the rational
  parametrization of V(F1, F2, F3), as in q03Resolution.

## Resume from here

1. **The remaining gaps and the Codex resume items 1–5 below**, which are the non-computational bulk:
   - `rank-one-downstream-boundaries` through §§7.3–9;
   - `section2-source-suppliers` (Jantzen, Deligne–Lusztig, Haines–Ngô, Schneider–Zink, Pyvovarov);
   - the regularity and analytic suppliers (`analytic-regularity-suppliers`,
     `approximation-and-tensor-adapter-closure`);
   - `closure-external-inputs`;
   - `global-descent-supplier-atoms` and `auxiliary-projector-global-input`;
   - the U/G/B/Z/P outline queues.
2. **Optional.** A symbolic recheck of the Q03 cofactor identities outside Singular. Here they were
   rechecked only at 37 random rational points with exact fractions, because a SymPy expansion with
   rational-function coefficients did not finish in 25 minutes. Clearing the denominators
   a(a − 1)^3(a − 2)^2(b − 1)(a − b)^2(a − b − 2)^2 first should make it fast.

---

# Previous checkpoint (cc-e94dc5, Z143 source step)

Claude Code — cc-e94dc5; issue 1254; 29 September 2026 (Z143 source step).
**Partial checkpoint, continuing the checkpoints below.** Census unchanged: 779 items, 26 routes,
113 findings, 13 gaps; one prerequisite added (19). No Lean deliverable or compilation. This session
has edited the result file and is ineligible to review or red-team it.

## Completed here

- **Z143's source is confirmed at the original** (the previous step's resume item 3). Lemma 5.1.2 is
  in Liu, *On lattices in semi-stable representations: a proof of a conjecture of Breuil*, Compositio
  Math. 144 (2008), 61–88, printed pp. 82–83. This is the "[Liu07a]" of the note arXiv:0709.4523v1.
  It is **not** in Liu's 2007 Annales paper, which the previous locator named; that paper only cites
  it (Ann. Sci. ÉNS 40 (2007), p. 658, "Lemma 5.1.2 in [18]").
- The lemma states exactly Z143's three assertions for p ≥ 3: K_{p^∞} ∩ K_∞ = K; the two Galois groups
  H_K and Z_p(1); the semidirect product with H_K acting by the cyclotomic character. Its proof uses
  p > 2 through 1 + pZ_p ≅ Z_p. Remark 5.1.3 gives the p = 2 failure (K = Q_2, π = 2) and the
  survival when Q_2(ζ_4) ⊂ K; the Annales paper's Lemma 8.0.4 extends the p = 2 case to every K
  containing a quadratic subfield of Q_2(ζ_8).
- Z143's locator and note are corrected, both readings are recorded in
  `source.continuationReadings`, the Compositio paper is added to `prerequisites`, and
  `validation.ccE94dc5KummerTowerSource` records the step. No item id, status, route or finding
  changed.

## Resume from here

1. **Q03** is unchanged; see the fourth checkpoint below for the leads (the (1,2) entry is c12; the
   remaining suspects are the monodromy normalization, the identification of a with (a, b, 0), and
   the printed F1–F3). Singular was not available in this session's environment, so no new
   computation was attempted.
2. **The remaining gaps and the Codex resume items 1–5**, as listed below.

---

# Previous checkpoint (cc-39fac3, Kummer-tower step)

Claude Code — cc-39fac3; issue 1254; 29 September 2026 (Kummer-tower step).
**Partial checkpoint, continuing the checkpoints below.** Census: 779 items, 26 routes, 113 findings,
13 gaps. No Lean deliverable or compilation. This session has edited the result file and is
ineligible to review or red-team it.

## Completed here

- The gap `kummer-tower-field-inputs` is resolved and removed.
- New items Z143 (Galois closure; K∞ ∩ K(μ_{p^∞}) = K; G_0 ⋊ H_K with G_0 ≅ Z_p(1)), Z144
  (Gal(K(μ_{p^∞})/K(μ_p)) ≅ Z_p) and Z145 (no degree-p Galois subextension of K∞ without ζ_p), all
  for p > 2.
- Sources: Liu's 2007 note (arXiv:0709.4523v1), EGS 7.4.3 and GLS 5.4.2 (arXiv:1309.0527v2).
- A new source route sends them to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, and G68
  imports them.

## Resume from here

1. **Q03** (see the previous checkpoint below): the monodromy-condition conventions.
2. **The remaining gaps**, notably `rank-one-downstream-boundaries`, `section2-source-suppliers` and
   the regularity/analytic supplier gaps, together with the Codex resume items below.
3. **Z143's intersection statement** is taken from Liu's recollection of his 2007 Lemma 5.1.2. A future
   reading of that Annales paper should confirm its exact hypotheses.

---

# Previous checkpoint (cc-39fac3, fourth, with Q03 notes)

Claude Code — cc-39fac3; issue 1254; 29 September 2026 (fourth checkpoint).
**Partial checkpoint, continuing the checkpoints below.** Census: 776 items, 25 routes, 113 findings.
No Lean deliverable or compilation. This session has edited the result file and is ineligible to
review or red-team it.

## Completed here

Table 1 (Q09) is certified at every point of V off a·(a(b−1)−b)·((a−b)(a−1)−1) = 0, in every
characteristic > 7. The certificate is containment lifts plus radical membership of the products
of the listed ideals' Gröbner elements (powers ≤ 2), over `Z[1/7!][a,b][1/(P·a·M·L8)]`. Primality,
dimensions and the extra components follow from the explicit forms. The data is in
`sourceData.appendixB.table1Rederivation.uniform`.

## Q03 attempt (cc-39fac3, after the fourth checkpoint): not reproduced; leads for the next worker

I tried to re-derive B.0.1(1)'s three equations with Singular, at (a,b) = (5,−4) over Q. The
setup was:
- the chart matrix of PDF202;
- det A = −(v−t)⁴;
- the λ = (3,1,0) condition, rank A(v=t) ≤ 1, from the 2×2 minors;
- the monodromy condition (3.1) read with L⁺ = R[[v−t]], namely
  (v·A′ + A·Diag(a,b,0))·adj A ≡ 0 mod (v−t)³;
- saturation by t, since M_X(λ,∇) is the closure of the t ≠ 0 open-cell part (Definition 3.3.6).

**This did not reproduce the printed F1–F3**, so none of them is certified.

1. **Entry (1,2).** PDF202 prints the (1,2) entry of A as v·c12. Proposition 3.2.8's own formula
   (PDF60, checked on the page image) gives the constant c12 there, since δ_{1>2} = 0 and the degree
   bound is ν₂ − δ_{1<w(2)} = 1 − 1 = 0 for z̃ = (23)t^(2,1,1). The other eight entries agree with
   the formula.
2. **With v·c12** as printed, the saturated ideal has only 3-dimensional components. The chart over
   fixed (a,b) must be 4-dimensional (flat, with 3-dimensional fibres over the t-line), so these
   conditions over-constrain.
3. **With c12**, there is a 4-dimensional component, and on it five of the six coefficients are
   linear in the other variables. At (5,−4), for example, d11 = c12·d31 − t/6 and
   c23 = (11·c22·d33 − 9t)/7. But c33 only satisfies c33·c12 = t·c13, and the three relations
   among t, c12, c13, d21, c22, d31, d33 differ from the printed F1–F3.
4. **A search over Diag(a) conventions** did not reproduce them either: all orderings and signs of
   (a, b, 0), with A·D or D·A.

**Follow-up from reading §3.1–3.2 (cc-39fac3, later the same day).**
- **The (1,2) entry is c12.** U(z̃)'s definition (PDF59) requires A·(v−t)^(−ν)·w^(−1) to be
  unipotent lower triangular mod 1/(v−t). For z̃ = (23)t^(2,1,1) its (1,3) entry is A12/(v−t), so a
  (1,2) entry v·c12 = (v−t)·c12 + t·c12 would force c12 = 0. Hence the chart has the constant c12,
  as Proposition 3.2.8's formula says, and the printed v·c12 on PDF202 is a display slip. The paper's
  own computation presumably used c12, so it should not be recorded as an error in the equations.
- **The Iwahori condition does not help over X⁰.** L⁺M(R) (PDF56) also asks for upper triangularity
  mod v. But after inverting t, v = (v−t) + t is a unit in R[[v−t]], so this condition is vacuous on
  the saturated ideal and cannot explain the mismatch.
- **The λ condition is not the cause.** With c12, det and the monodromy condition alone, saturated
  in t, the ideal again has exactly one 4-dimensional component. On it, rank A(v=t) ≤ 1 holds
  automatically, and F1–F3 still do not vanish. The same run with the printed v·c12 did not finish
  within 21 minutes.

The remaining suspects are the sign or normalization of the monodromy term, the identification
of a with the Appendix B coordinates (a, b, 0), and the printed F1–F3 themselves.

So either the authors' conventions differ from this reading of (3.1), for example L⁺ in terms of v,
another normalization of A, or a different Schubert condition, or the display has a misprint. Pin
the conventions of §3.1–3.3 down before recording any finding. No finding was recorded, because
which side is wrong is not established.

## Resume from here

1. **Q03 (B.0.1(1)), the last Appendix B item.** Set up the universal matrix A of Proposition 3.2.8
   (PDF202). Impose det A = −(v−t)⁴, the λ = (3,1,0) minor-divisibility conditions (all 2×2 minors
   divisible by v − t), and the monodromy condition (3.1) with a = (a, b, 0): that is,
   (v A′ + A·Diag(a))·adj A ≡ 0 mod (v−t)³ after clearing det A. Then solve c11, d11, c21, c23, c31
   and c33 over `Z[a,b][1/P]` after saturating by t, and certify with Singular as in the previous
   checkpoints. Check the exact form of the conditions on PDF202 and in §3.2–3.3 first.
2. **The Codex resume items 1–5 below**, which remain in force; they are the non-computational
   bulk of the job.

---

# Previous checkpoint (cc-39fac3, third)

Claude Code — cc-39fac3; issue 1254; 29 September 2026 (third checkpoint).
**Partial checkpoint, continuing the checkpoints below.** Census: 776 items, 25 routes, 113 findings.
No Lean deliverable or compilation. This session has edited the result file and is ineligible to
review or red-team it.

## Completed here

1. **Q05 flatness, directly.** The chart's Gröbner basis is monic over `Z[1/7!][a,b][1/P][t]`, so R
   is free over X × V. Every fibre is a complete intersection of dimension 3 and degree 12.
2. **Q04 minimal primes, uniformly.** The seven listed primes are exactly the minimal primes at every
   point of V. The multiplicity is 2 along (c22, c13, c12) and 1 elsewhere, so the chart's special
   fibre is not reduced. The argument is the degree 12 count, together with a unit minor showing
   e ≥ 2.
3. **Q13 reducedness, uniformly.** U^nm_F is reduced at every point of V: the degrees 13 = Σ of the
   seven PDF206 pieces, together with Cohen–Macaulayness.

The data is in `sourceData.appendixB.q04q05Certificate` and `q13Reducedness`.

## Resume from here

1. **Table 1 for every specialization** (B.0.2(3), Q09). Rows 2, 5 and 7 need cells for a(b−1) = b and
   (a−b)(a−1) = 1, and row 4 for a = 0 (E113). The generic rows can be certified like Q04: show
   containment over the base, then run a degree count of Ī + P_k against the Table 1 ideals, using a
   multiplicity bound where needed.
2. **Appendix B is otherwise certified**, except Q06's use of Proposition 3.3.8 and the regularity of
   R[1/t] (Proposition 3.3.4). The remaining work is in the Codex resume items 1–5 below, which remain
   in force.

---

# Previous checkpoint (cc-39fac3, second)

Claude Code — cc-39fac3; issue 1254; 29 September 2026 (second checkpoint).
**Partial checkpoint, continuing the checkpoints below.** Census: 776 items, 25 routes, 113 findings
(E112 and E113 are new). No Lean deliverable or compilation. This session has edited the result file
and is ineligible to review or red-team it.

## Completed here

1. **Q13 Gröbner basis, uniformly (previous resume item 1).**
   - The order is degrevlex.
   - The printed basis is a Gröbner basis in two cells, (a−b)(a−1) ≠ 1 and = 1, with unit leading
     coefficients over `Z[1/7!][a,b][1/(P·L8)]` and over the curve's ring. All 55 S-pairs reduce to
     zero, and membership holds both ways.
   - Both leading-term ideals are Cohen–Macaulay over every field: the integral upper Koszul homology
     over their lcm lattices has no torsion.
   - E112: the printed exception "(a−b)((a−1)−1)" should be "(a−b)(a−1)−1".
   - The data is in `sourceData.appendixB.q13ComprehensiveGroebner`.
2. **Table 1 and the PDF206 components (the generic half of previous resume item 2).**
   - Everything re-derives over Q(a,b).
   - E113: it fails on a = 0 (row 4 and the 7th component split), on a(b−1) = b (rows 2 and 5 lose
     their extra) and on (a−b)(a−1) = 1 (row 7). This is confirmed over Q and F₁₀₁.
   - Consumers are unaffected: Q10 uses only row 4, and a is a unit downstream. Q10's quadric step now
     covers a = 0.
   - The data is in `sourceData.appendixB.table1Rederivation`.

**Tooling.** Singular: `uv run --with passagemath-singular`, then
`from sage.all__sagemath_singular import *`. Use `PolynomialRing(FractionField(QQ['a,b']), …)` for
parameters, `.minimal_associated_primes()`, `.lift()` and `.groebner_basis()`. Every call here took
seconds. For uniformity, divide only by leading coefficients and check that every denominator's
factors are units.

## Resume from here

1. **Reducedness and Table 1 for every specialization.** Both are so far checked at generic points and
   sample points only. A route: comprehensive primary decomposition. Alternatively, generic reducedness
   from the degree identity deg(S/in I) = Σ deg(components), with the components' degrees computed
   uniformly per cell, and the extra loci of E113 as their own cells.
2. **Q04 minimal primes (Proposition B.0.1(2)) over `Z[a,b][1/P]`**, in the same style.
3. **Codex resume items 1–5 below** remain in force.

---

# Previous checkpoint (cc-39fac3, first)

Claude Code — cc-39fac3; issue 1254; 29 September 2026.
**Partial checkpoint, continuing the cc-fb70e5, cc-d67081 and Codex checkpoints below.** Census
unchanged: 776 items, 25 routes, 111 findings. No Lean deliverable or compilation. This session has
edited the result file and is ineligible to review or red-team it.

## Completed here — cc-fb70e5 resume items 1 and 2

1. **Downstream of E111: settled, and E111 does not propagate.** The Appendix B coordinates are
   a = a₁ − a₃ and b = a₂ − a₃ (Remark 3.3.2, PDF62). At the specialization of Theorem 7.3.2,
   `a_τ ≡ s⁻¹(μ+η) mod ϖ` (Lemma 7.3.1, PDF150). So a, b and a − b are ≡ ±⟨μ+η, α∨⟩ for positive
   roots, and they are units whenever μ is m-deep in C₀ with m ≥ 0 (Definition 2.1.10, PDF33).
   - All of P is a unit from 2-depth on.
   - Corollary B.0.5 (5-generic, μ 10-deep) lives in `V_a = Spec Z[a,b][1/(aP)]`.
   - Proposition 3.3.9's proof only uses `t^r ∈ H + J` after base change along g, so it applies over
     X × V_a with r = 3.
2. **Q06 certified over `Z[a,b][1/(aP)]`.**
   - Over Q the denominator ideal is exactly `(H + (F) : t³) ∩ Q[a,b] = (a(a−2)²(a−b)(b−1))`
     (Singular, all twenty minors).
   - Lifting against F1–F3 and the six minors gives
     `2·a·(a−2)²·(a−b)·(b−1)·t³ = Σ h_g·g` with integer cofactors, rechecked in SymPy.
   - It is stored as `sourceData.appendixB.q06CertificateAP`; the old record is marked superseded.
   - `t² ∉ H` over `Q[a,b][1/(aP)]`.

**Tooling note.** Singular runs on this kind of server via `uv run --with passagemath-singular`
(10.8.12; `from sage.all__sagemath_singular import *`). The Q06 Gröbner computations each take under
three seconds. This makes the remaining Appendix B certificates practical.

## Resume from here

1. **Q13's Gröbner basis (proof of Proposition B.0.2(2), PDF205), uniformly.** Show that the eleven
   printed polynomials form a Gröbner basis of the reduced normalization ideal for every field of
   characteristic > 7 and every (a,b) with P ≠ 0, for the order W > c12 > c13 > d21 > c22 > d31 > d33.
   This is a parametric (comprehensive) Gröbner computation. Its steps:
   - membership of each listed polynomial, with cofactors over Z[a,b][1/P];
   - reduction of the seven generators to zero;
   - S-pairs reducing to zero with unit leading coefficients.

   Mind the 8th generator. Its first coefficient is `b((a−b)(a−1)−1)`, which is not a factor of P
   and can vanish on V. The paper's exception "(a−b)((a−1)−1)" (PDF205) should be compared with this
   on the page image before anything is recorded. Then comes the Cohen–Macaulay claim for the monomial
   scheme. Preserve E91.
2. **Q04 minimal primes (B.0.1(2)) and Q09's Table 1 rows, uniformly over V.** Singular's
   `minAssGTZ` or primary decomposition over Q(a,b), then a specialization analysis of the
   denominators, in the same style as the Q06 denominator ideal.
3. **Codex resume items 1–5 below** remain in force as written.

---

# Previous checkpoint (cc-fb70e5)

Claude Code — cc-fb70e5; issue 1254; 29 September 2026.
**Partial checkpoint, continuing the cc-d67081 and Codex checkpoints below.** Census 776 items,
25 routes, 111 findings (E111 is new). No Lean deliverable or compilation. This session has edited
the result file and is ineligible to review or red-team it.

## Completed here — resume item 6, the Q06 half

Q06 is Proposition B.0.1(4): the ideal `H` of 3×3 minors of the Jacobian of the three chart
equations (Q03), taken relative to `Z[t,a,b][1/P]`, contains `t³`. The paper's proof is one sentence
citing Macaulay 2. The three equations were re-read against the page image of PDF202 before any
computation.

- **An exact certificate now exists, with its denominators named.** Buchberger's algorithm with
  cofactor tracking over `Q(a,b)` (SymPy, grevlex, 76 tracked basis elements) writes
  `t³ = Σ h_g·g` with `g` running over `F1, F2, F3` and the six minors
  `M123, M124, M125, M136, M145, M234` (columns in the order c12, c13, d21, c22, d31, d33). The
  identity was checked by exact expansion. Every numerator has integer coefficients, and the lcm of
  the denominators is
  `2·a·(a−2)⁶(a−1)³(a−b)⁶(b−1)⁶(a−b−2)³(a+b−1)⁶·C³` with `C = a³−4a²−ab²+ab+4a+b²`.
  So `t³ ∈ H` over `Z[a,b][1/(aP·(a+b−1)·C)]`. The cofactors are in
  `sourceData.appendixB.q06Certificate`.
- **The exponent 3 is sharp.** `t² ∉ H + (F)` over `Q(a,b)` and at (a,b) = (11,5), (5,−4), (7,−6).
- **The factors a+b−1 and C look like artefacts of the elimination path.** `t³ ∈ H + (F)` holds at
  (5,−4) and (7,−6), both on a+b = 1, and at points of C = 0 over F₁₁, F₁₃ and F₁₇ with P ≠ 0.
  These are sample points, not a proof over those curves.
- **The factor a is not an artefact: E111.** On a = 0, which meets V, the point t = 1,
  c12 = c13 = c22 = d21 = d33 = 1, d31 = (b−1)/(b+1) satisfies all three equations. The six-column
  Jacobian has rank 2 there, so no power of t lies in H and the printed (4) fails. This was checked
  for symbolic b and at b = 5, −3, 7; no power t^k with k ≤ 6 lies in H + (F) at b = 5 or b = −3.
  With the a and b columns included the rank is 3, so `R ⊗ Q` is regular at the witness. The
  regularity step in the proof of (3) is therefore not contradicted by this point; only (4), and
  smoothness of the fibres over V at a = 0, fail.

Q06's statement and proof steps, `validation.appendixChecks`, the `appendix-certificates` gap and
the summary are updated. Q06 stays `missing`: the certificate is a computation recorded in data,
not a formal proof.

## Resume from here

1. **Downstream of E111.** Proposition 3.3.9 and Corollary B.0.5 (Q11) consume r = 3 at a
   specialization `(−p, a, b)`. Check whether the parameters used there can have a = 0, or a ≡ 0 in
   the relevant sense, under 5-genericity and 10-depth. Neither this checkpoint nor the source
   settles this.
2. **A certificate over `Z[a,b][1/(aP)]` alone.** Candidates: rerun the tracked Buchberger with
   other monomial orders or generator subsets. Two certificates whose extra denominators have no
   common zero on `V ∩ {a ≠ 0}` would combine into one over `aP`. The q06Certificate record fixes
   the generator naming to reuse.
3. **Codex resume items 1–5 and the rest of 6** (Q08's uniform Gröbner certificate over
   `Z[a,b][1/P]`, Q09's Table 1 row derivation, preserving E91/Q13) remain in force as written
   below.

---

# Previous checkpoint (cc-d67081)

Claude Code — cc-d67081; issue 1254; confirmed claim 5806326967; 24 September 2026.
**Partial checkpoint, continuing the cc-d67081 and Codex checkpoints below.** Census unchanged at
776 items, 25 routes, 110 findings. One citation corrected, three notes rewritten. No Lean
deliverable or compilation. This session has edited the result file and is ineligible to review or
red-team it.

## Completed here — resume item 7, the fine-ownership half

The preceding checkpoint verified that every library citation *resolves*. This one asks whether each
cited declaration **provides** its item's statement. All 146 library items and their 224 citations
were re-resolved to a file and line at the pins, and each declaration was read together with every
`variable` line in scope at that line, because in Mathlib the hypotheses usually live in the section
variables rather than the declaration.

- **143 of 146 hold as stated.**
- **One real defect, corrected: L75.** It cited `IsGδ.baireSpace_of_t2Space_locallyCompactSpace`
  (LocallyCompactRegular.lean:62), which says a Gδ **subset** is Baire, for an item stating that the
  **space** is Baire. The declaration that provides the item is the instance
  `BaireSpace.of_t2Space_locallyCompactSpace` at line 23 of the same file — the Gδ lemma's own proof
  invokes it at line 64. Replaced. Status unaffected; the fact is in Mathlib under another name.
- **Two stale warnings discharged: L55 and L77.** Both carried notes calling correct citations
  unverified and telling a blueprint author to distrust them. Opened at the pin and all three
  confirmed: `Module.Flat.instTensorProduct` is the anonymous instance at Flat/Basic.lean:232 (with
  Mathlib's own `example ... := inferInstance` at line 242 and the Stability.lean:91 comment naming
  it); `HenselianRing.is_henselian` is the class field at Henselian.lean:96 and
  `IsAdicComplete.henselianRing` the instance at line 170. Absent from the index only because
  anonymous instances and structure fields are not indexed. **Do not re-open these three as
  suspicious, and do not "fix" them.**
- **Planned half: all 48 routings hold**, checked against the full stage text rather than the
  truncated extract. Z23/Z28/Z96 → ModularCurves 4D, which owns "preservation and reflection of
  regularity and dimension under completion of noetherian local rings"; Z49/Z80 → AdicSpaces
  Layer 0, whose 0.5 names Weierstrass division and Noetherianity of `K⟨X₁,…,Xₙ⟩` as milestones.
- **Contract tests Z106/Z111/Z120 are done** — all three carry `api` and `unitTests`. That sub-item
  of resume item 7 is closed.

## Resume from here

Resume items 1 to 6 of the Codex note below are untouched and remain in force. **Resume item 7 is
now closed**: the library citations resolve, they own their statements, the planned routings hold,
and the three named contract tests exist.

What it leaves behind is a measured, named surface rather than an open-ended audit. Of the 174
definition and construction items, 90 carry the api/unitTests contract (9 in the item, 84 through
`definitionApiGroups`) and the following **84 carry `api` with no `unitTests` and belong to no
group**:

N22, N32, N49, N50, U01, U03, U06, U13, U17, U25, U27, U39, M01, M06, M12, M40, M24, M27, M28, K01, K06, K14, K21, K26, K32, P01, P02, P03, G01, G04, G07, G08, G12, G13, G17, G26, G27, G32, B01, B03, B05, B06, B18, B19, B27, B36, V03, V06, V14, V08, V10, A06, A08, A09, A10, A15, A16, A18, A19, A20, A22, A23, Q01, Q07, Z02, L05, Z52, A26, Z66, A34, A35, A46, A60, A66, L70, L71, L80, A90, A94, A95, Z67, N82, L142, Z134

PROTOCOL section 16 imposes no api-or-tests requirement on paper items — that requirement governs
blueprint nodes under sections 3–4 and 12 — so this is this extraction's own convention and neither
the checker nor the protocol will flag it. Treat it as optional polish with a known boundary, not as
a defect, and do not let it displace resume items 1 to 6, which are where the mathematics is.

---


Claude Code — cc-d67081; issue 1254; confirmed claim 5806242520; 24 September 2026. **Partial checkpoint, continuing the Codex checkpoint below.** Census unchanged at 776 items, 25 routes, 110 findings; five library citations corrected. No Lean deliverable or compilation. This session did not author the extraction's mathematics and has touched only the `library` citations of five items; it is nonetheless ineligible to review or red-team the result.

## Completed here — the per-item library audit (resume item 7, library half)

Every `library` and `planned` item was checked against the pinned commits: 146 library items carrying 224 citations over 219 distinct declarations, and 48 planned items.

- **Five citations were wrong and are corrected.** Four dropped the `CategoryTheory.` namespace — L134's `ShortComplex.moduleCat_exact_iff` and `ShortComplex.moduleCat_exact_iff_range_eq_ker`, L135's `ShortComplex.moduleCatHomologyIso` and `ShortComplex.π_moduleCatCyclesIso_hom` — and L141 carried a spurious `Algebra.` prefix on `IsSeparable.of_integral`, which is at Mathlib/FieldTheory/Separable.lean:658. All five now resolve; no statement, status or route changed.
- **Three apparent misses are not errors, and should not be "corrected" by a later worker.** L55's `Module.Flat.instTensorProduct` is an auto-named instance that Mathlib's own Flat/Stability.lean:91 refers to by that name; L77's `IsAdicComplete.henselianRing` is a named instance at RingTheory/Henselian.lean:170; and `HenselianRing.is_henselian` is a structure field, declared at Henselian.lean:96. The declarations index carries none of the three, which is an index limitation, not a citation error.
- **Clean on every other axis.** No cited declaration is private, none is deprecated (two that a mechanical window flags — `Ideal.exists_minimalPrimes_le` and `IsLocalization.AtPrime.ringKrullDim_eq_height` — carry no attribute themselves; the `@[deprecated]` above each belongs to the preceding declaration), no citation is tagged to the wrong library, no `library` item lacks a citation, and all 48 planned items' stage references resolve.
- The weakest name-to-statement overlaps were read rather than trusted: L24 cites `MvPolynomial.pderiv_mul` for the Leibniz rule and L36 cites `Submodule.le_of_le_smul_of_le_jacobson_bot` for Nakayama, both correct despite sharing no vocabulary with the item names.

## Resume from here

Resume items 1 to 6 of the Codex note below are untouched and remain in force. Item 7 is now half done: the library citations are audited and correct, so what remains of it is the **fine ownership** half — whether each cited declaration actually *provides* its item's statement, rather than merely existing — together with the contract tests Z106/Z111/Z120. A mechanical overlap screen is not enough for that half; it produced only naming-style false positives here, and the work needs the statements read at the pin against the item text.

---


Codex — codex-c83e7a; issue1254; confirmed claim5805811150; 24 September2026. **Partial checkpoint.** Current census:776 items,146 library/48 planned/582 missing,25 routes,110 unreviewed source findings,174 definitions/constructions,1,226 acyclic internal edges. No Lean deliverable or compilation. This session authored the extraction and is ineligible to review/red-team it.

## Completed here

- E101 is the corrected K31 statement and nilpotent proof. E102 guards are propagated through K10–K12/K49, K29–K31, the Kisin diagram and direct Section7.2 consumers. K55 supplies unrestricted rank-one scalar contraction, avoiding a false blanket height bound on the gauge arguments.
- K56–K58 give an acyclic semisimplicity repair for E103: unramified repetition; universal-torus projections onto split rank-one lattices; monomial normalization; gauge descent. It adapts **WE19 Theorem3.2.26**, not3.2.20. K43 degenerates over A1 using the whole G_m and applies K58 at0. The actual lattice and Hodge bound are retained. No path from K58 to K41/K43/K44/K47/K48.
- L143 is the exact pinned proper-monomorphism scheme theorem. Z142 is the SF.1/SF.4 algebraic-space/formal adapter; its recursively cited finite étale quotient input remains planned.
- E110 records the rank-one p=2 counterexample to Lemma7.2.10(2). G49 supplies the all-rank digit proof, with p>n from2-depth, and the valid odd-prime rank-one branch.
- G67–G68 supply the finite-length coefficient induction for E65/G50, importing upstream discrete cohomology exactness and transfer. G23/G51/G52/G66 and G18/G21/G24/G25/G62 now have explicit relevant proof steps and bounds. The Kummer-tower field inputs remain a named gap.
- All inherited IDs/statuses and sourceData preserved. Only E65/E101/E102/E103 among inherited findings are refined; no independent verdict added. New item IDs:K55–K58,L143,Z142,G67–G68. New finding:E110. No new routes.

## Resume in depth

1. Follow `rank-one-downstream-boundaries` through Sections7.3–9. The sufficient extracted Section7.2 range is n≥2 or p>h+2. Distinguish actual P_m factorial factors from vacuous GL1 root-depth. Supply scalar proofs or explicit prime assumptions; do not claim all unrestricted main statements follow from these local repairs.
2. Decompose `kummer-tower-field-inputs`: Galois closure K∞(μ_p∞), the Z_p(1) subgroup and conjugation action, and no cyclic degree-p subextension of K∞ when ζ_p is absent. GLS5.4.2 and EGS7.4.3 outer proofs are freshly read. Import field theory from its owner; G67's finite-length diagram chase and upstream ProfiniteCohomology layers5–6 are already identified.
3. Continue no-outline theorem families: **counts** U26,G32,B28,Z1,L137,P1. This is a field census, not a proof-closure claim. Kisin projectivity in G21 still imports Kisin[48] and [2]; G62 still imports the filtered comparison [22,§4.7]. Do not treat explicit outer proof steps as reading every supplier.
4. Preserve the Section2 frontier: E92's exact recurrence stalls (p,n)=(2,5),(2,6),(3,6), Jantzen/DL/Haines–Ngô and SZ/Pyvovarov/depth-zero suppliers. V15 assembly is already explicit through N71 and corrected B28: central c=−η−w0η and P_new=P_old·P_3hη·H_{0,η,e}(X+c). Do not reopen it as an unspecified polynomial.
5. Continue regularity at Z102 standard-smooth/cotangent dimensions, then07PR/07PU, p-basis/formal smoothness and Cohen032D behind Z79. Preserve the DD.1 finite Koszul/minor precursor. Z129 is library; Z130 uses L89/L137.
6. AppendixB: integral t³-in-Jacobian certificate Q06 with denominator locus; uniform Gröbner certificate Q08 over Z[a,b,1/P]; Table1 row derivation Q09. Preserve E91/Q13. Earlier rational generic CAS checks are not uniform integral certificates.
7. Finish contract tests Z106/Z111/Z120 and per-item library/fine ownership audits. Preserve the valid normalized Speh/Whittaker/Galois branch and its A104–A107 analytic suppliers; withdrawn White1106.1127v8 is not a replacement for the read Labesse5.3 branch under F+≠Q.

## Evidence and checks

Fresh main readings:PDF24,99–100,105–125,129,131–132,142–149; main SHA256 e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd. Selected WE19, Shapes and shadows, GLS and EGS readings/versions/hashes are recorded in the JSON and report. No fresh full212-page reading is claimed. E110 correction search is bounded and has no arXiv passage comparison or independent verdict.

Paper checker and structural/finite diagnostics pass. Exact finite checks cover the two Laurent counterexamples, scalar Lang products through v^96 (including nonreduced Z/4), and92,864 digit cases. The425-file refreshed input manifest is pinned in validation; all421 original input blobs were unchanged. Three-file intake validation and publication checks are recorded with submission. No formal proof is inferred from these checks.
