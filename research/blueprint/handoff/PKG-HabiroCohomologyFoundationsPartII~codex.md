# PKG-HabiroCohomologyFoundationsPartII~codex

Issue #11358. Agent: Claude (Opus 5.5), session `claude-vCmoOI`, branch `claude-vCmoOI-pkg-habiro-partii`.
Claim confirmed by the bot on 2026-10-20 11:20 UTC. This is the complete package job, not a checkpoint.

## Deliverables

- `research/blueprint/packages/HabiroCohomologyFoundationsPartII/README.md` (≈87 KB): four layers —
  trace pairs and their Habiro descent; quasi-regular quotients; framed smooth algebras; number-field
  trace specialisations — with supplier contracts, Checks, Examples and Dependencies per layer,
  Downstream consumers, Remarks on the sources and References.
- `research/blueprint/packages/HabiroCohomologyFoundationsPartII/Suggested.lean` (156 lines).
- `research/blueprint/packages/HabiroCohomologyFoundationsPartII/metadata.toml`: `topic = "math.AT"`
  (the trace sources KU and TC are math.AT).

## Plan targets and where they are

| Plan target | README |
| --- | --- |
| `traceHabiro` with its 7 API items and 5 Checks | §1.3 (all API and Checks kept; `traceHabiro_zero`, `_smooth`, `_periodic`, `_cyclonic` added) |
| `perfectedLiftNaive` with its 4 acceptance Checks | §2.2 (plus the global corollary `perfectedLiftNaive_qReg`) |
| `canonicalFramedTrace` with its 5 Checks | §3.3 (the ℤ[1/2][x] Check is stated for ℤ[x] and ℤ[1/2][x]) |
| `numberFieldTraceExports` with its 7 API items and 6 Checks | §4.2 (plus `_nonabelian`; the twisted Check now has a computed witness) |
| Structured trace input paragraph | §1.1 (`TraceInput`), §1.2 (`tracePair`) |
| Independent prismatic and trace constructions | Scope and ownership, last paragraphs; supplier contracts |

## Supplier requests of the plan and how the package meets them

- **HT-RT-framed** (KU Theorem 6.10 for every framed smooth algebra). The RefinedTraceMethods package
  §6.10 states only the ℤ[x] case (KU Theorem 1.4) and mentions 6.10 in passing. Since this roadmap
  comes after RefinedTraceMethods and works in its direction, the theorem is owned here: §3.1
  `framedTrace`, `framedTrace_einfty` (KU Remark 6.14) and §3.2 `qPDDiagonal` (KU Lemma 6.11),
  `framedCech` (KU 6.12–6.13). The RefinedTraceMethods packet request HT-RT-framed should be
  closed and pointed at these sections.
- **HT-RT-boundary**. The trace side of KU 1.11 is RefinedTraceMethods §6.1 Check
  `SphericalLift.ku_not_enough`; the structured quotient ranges are owned here as §2.1
  `quotientLift` with `E1QuotientExponent`/`E2QuotientExponent`, on top of StableHomotopyKTheory
  §7.32 (Burklund Theorem 1.5) and the right-unitality inputs of Burklund Theorem 1.4 with footnote 4
  and Remark 5.5. The request can be closed.
- **HT-PR-independent**. Met by PrismaticCohomologyPartII §§3.1, 3.13–3.16, 3.20–3.23 (TCR PR #1065):
  Frobenius-divisibility Nygaard on QRSP prisms, the relative filtration on φ_A^*Δ with BS
  Theorems 15.2–15.3 and the Lη_I factorisation, Nygaard completion. No new target.
- The plan's `RefinedTraceMethods:RT.6/trace-prismatic-comparison` and `/motivic-filtrations` are,
  per the RefinedTraceMethods package scope, now owned upstream by PrismaticCohomologyPartIII §7.0
  (TCR PR #1070) and AInfCohomology §AI.7.2 (TCR PR #1044); the README cites those.

## Targets added beyond the plan (each sourced; reviewer please check)

- §1.1 `TraceInput` with morphisms (same branch at every prime, maps of lifted diagrams), and the
  requirement that the 2-adic branch be (E₁) unless R̂₂ = 0: this is how KU's addendum (R₂) enters
  (KU Theorem 4.14 is the only comparison at 2; proof of Lemma 4.29 with footnote (4.6), p.51).
- §1.2 functoriality of the trace pair along morphisms of inputs (KU states the construction
  objectwise).
- §2.1 `quotientLift` and its four consequences (KU Examples 6.8–6.9, QH Remark 4.23, TC 3.4/3.6).
- §2.3 `tracePair_quasiRegular`: with identity-cover data at every prime the trace pair equals the
  canonical quasi-regular pair of HabiroCohomologyFoundations §5.22, hence is lift independent and
  derived commutative. **Neither source states the global statement**; the README says so and gives
  the proof route (KU Theorem 4.17 locally, KU 4.21–4.26 and Lemma 4.29 against QH Construction 4.28).
- §3.1 `framedTrace_einfty`: HabiroCohomologyFoundations §4.8 gives the coordinate pair only an
  E₀-structure and QH Example 3.12 defers the E∞ refinement to KU Remark 6.14; owned here.
- §4.1 `TraceInversion` (light predicate, in Lean) and `genuineRealisation`; §4.2 naturality of ε_R
  in field embeddings (stated as part of the target; KU states Corollary 6.15 objectwise).

Proof steps the sources leave implicit, stated as parts of targets: functoriality of `tracePair`;
agreement of the polynomial and perfectoid resolutions at p = 2 (KU Remark 3.10, p.27, indicates it
without proof) needed to apply KU 6.10 to the input `ofFramed`; the hypotheses of KU Theorem 4.27 for
S over the Čech nerve P^n in Lemma 6.13; the global comparison of §2.3; naturality of ε_R.

## Moved-down notions and order

The Habiro roadmaps are outside the Caraiani–Newton order, so no tier move applies. The de-cycling
order is respected: suppliers are HabiroCohomologyFoundations Layers 1–5, RefinedTraceMethods,
HabiroRings, StableHomotopyKTheory, PrismaticCohomology/PartII/PartIII and AInfCohomology; none of
their cited sections uses this roadmap. Nothing is cited from HabiroNumberFields or HabiroNahmSeries
(they are consumers only).

## Duplication

- Current TauCetiRoadmap main (0d144d044dacebca17b654695b6f1ad58f159b27, nine post-snapshot roadmaps
  and Completed/*) and current Tau Ceti (a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039): searched for
  Habiro, q-Hodge/qHodge, q-de Rham, spherical lift, THH, Nygaard; nothing relevant. No removal.
- Mathlib at the pin: the only native facts used are number-field discriminants, localisation units,
  `Commute.isUnit_mul_iff`, `MvPolynomial`; none of the package's objects exists there.
- **Still to be done by the maintainer's integration (not this job's files):** the
  HabiroCohomologyFoundations package still contains Layer 6 (§§6.1–6.5), the trace clause of §8.1
  and §9.15, which this package now owns (§§1.1–1.3, 2.2, 3.3, 4.1–4.2 and the Scope paragraph on
  independent constructions). Apply the relocation manifest of
  `handoff/DESIGN-HabiroCohomologyFoundationsPartII.md` to that package; its Scope table row for
  RefinedTraceMethods and its Downstream consumers paragraph should point here.

## Sources (read 2026-10-20; fetched to scratch, not committed)

| Source | URL | SHA-256 |
| --- | --- | --- |
| QH v2 | https://arxiv.org/pdf/2510.04782v2 | 591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b |
| KU v1 | https://arxiv.org/pdf/2510.06057v1 | fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d |
| TC v4 | https://arxiv.org/pdf/2410.23115v4 | 4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4 |
| GSWZ v2 | https://arxiv.org/pdf/2412.04241v2 | 308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9 |
| Burklund v2 | https://arxiv.org/pdf/2203.14787v2 | 22970ed6b856ce523e6682cc00c14f4875145b19c2923a2dbffff937f4eaf181 |
| BS v4 | https://arxiv.org/pdf/1905.08229v4 | 1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a |
| BMS2 v2 | https://arxiv.org/pdf/1802.03261v2 | b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038 |

Page conventions checked: KU printed page = PDF page − 5 in §6 and Appendix A (PDF 87 = p.82), equal
in §§1–5; QH §4 printed = PDF − 45 (PDF 107 = p.62), §§1–3 equal; Burklund, BS, BMS2, TC, GSWZ printed
= PDF. Every locator in the README was read at its page.

## Source findings

- **E1 (known):** KU proof of Corollary 6.15 (p.86) cites QH 3.12 for QH Corollary 3.13 (p.27).
  Recorded already as HabiroCohomologyFoundations/E304, RefinedTraceMethods/E12, PartII/E1.
- **E2 (known):** TC 3.5/Lemma 3.7 (pp.31–32) drop the rational corner ℚ[[h]] of the uncompleted
  finite-coefficient pair. Recorded in Part I §5.26 and PartII/E2; the README Check
  `tracePair_zero` exhibits m = 1 on the trace side.
- **E3 (new, misprint, affects nothing):** KU Lemma 6.11 (p.84) and the proof of Theorem 6.10
  (p.86) write γ̃^d_q(x−y) = ∏_{i<d}(x−q^iy)/(q;q)_d and assert λ^d((x−y)/(q−1)) = γ̃^d and
  q-∂_xγ̃^d = γ̃^{d−1}. With the q-Pochhammer symbol (q;q)_d = ∏_{k≤d}(1−q^k) that QH uses
  (QH Appendix B, p.77, where (a;q)_n = (1−a)(1−aq)⋯(1−aq^{n−1}); the standard convention), (q−1)^dγ̃^d = (−1)^d·∏_{i<d}(x−q^iy)/[d]_q!, so the λ identity
  holds up to (−1)^d (already at d = 1: λ¹ = (x−y)/(q−1) while γ̃¹ = (x−y)/(1−q)), and the
  derivative identity holds for δ^{(d)} = ∏(x−q^iy)/[d]_q! with the q-derivative ∇_q, while for γ̃^d
  one gets ∇_{q,x}γ̃^d = −(q−1)^{−1}γ̃^{d−1}. The ideals generated and the lemma's use are unchanged.
  Searched: arXiv listing of 2510.06057 (v1 only, accessed 2026-10-20); existing sourceIssues in all
  packets (only E304/E12 on KU). Verified by hand for d = 1, 2 and in general by the q-shift identity,
  which `Suggested.lean` proves (`diagonalNumerator_shift`). Suggested errata entry:
  HabiroCohomologyFoundationsPartII/E3, kind misprint, affects nothing.
- **Packet locator error (not a source error):** the plan and packet call BS 15.7 "Theorem 15.7";
  it is Proposition 15.7 (p.105). Fixed in the README; the packet is not edited by this job.

## Adversarial pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `TraceInput`, branch at 2 | (E₂) at 2 for ℤ[x]; R = ℤ[1/2]; R = ℤ | KU proves no comparison at 2 in case (E₂) | 2-adic branch required to be (E₁) unless R̂₂ = 0; Checks `invertTwo`, `polynomial` |
| `TraceInput.ofEtale` | étale R over A with torsion | identity cover needs p-torsion-freeness at every p | hypothesis "torsion free" (was only 2-torsion free) |
| `tracePair`, degenerate | R = 0; R = A = ℤ | R = 0 gives the constant filtration on ℚ[[h]], completion 0, clause (b) holds since dR_{0/ℤ} = ℚ with constant Hodge filtration | Check `tracePair_zero`; `tracePair_unit` with filtered vs degreewise quotient at i = 1 |
| `tracePair_multiplicative` | E₂ lift at an odd prime; E∞ lift S[x]; (E₁) primes | E_{n−1}; (E₁) primes upgraded a posteriori by KU 4.17 | stated with KU Remarks 4.9, 4.28; Check `tracePair_einfty` |
| `traceHabiro` | étale; unit; ℤ[x] at r = 2; m = 1; R = 0 | coefficients q²−1 vs 1+q differ at q = 1 (0 vs 2); H¹ of reduction ℤ[x]dx vs ⊕ℤ/r | Checks kept and computed; `traceHabiro_zero` added |
| `traceHabiro_cyclonic` | R = ℤ | KU 5.63 needs 2 ∈ R^×, stronger than (R₂) | hypothesis kept explicitly |
| `E1/E2QuotientExponent` | p = 2: α = 2,3,4,5,6; p = 3: α = 1,2,3; S/8; m = 1,8,9,12,16,32,64 | ranges match Bu Thm 1.4/Rem 5.5, KU 6.8–6.9, TC 3.6, RTM HighPowered; S/8 shows non-optimality | Lean examples (decide), E₂ ⇒ E₁ proved |
| `quotientLift` at odd p | 2 ∈ π₀T for p-complete T, p odd | Q₁(y) killed by 2 ⇒ unital T/y | proof route states it |
| `perfectedLiftNaive` | p = 2; A = ℤ₂{x}, R = A/x²; R = A/x; toric x−1, n = 2; ℚ-algebra | x² at 2 not via this route (Part I §5.19 covers it); exponent one ⇒ ℤ_p{x}_∞/x has no spherical E₁-lift; (x−1)(x−q)/(1+q) ↦ (x−1)²/2 | Checks added/computed |
| `tracePair_quasiRegular` | ℤ/m; B/x⁴, B/x² with B = ℤ[x^{1/∞}]; ℤ[x]; R = ℤ over toric ℤ[x] | ℤ/m excluded (torsion); B/x² only at odd primes; ℤ[x] not identity-cover | stated as assembled target with honest provenance |
| `framedTrace` | d = 0, 1, 2 with no prime inverted; ∇_q(x²) | q-Leibniz gives (1+q)x dx ≠ 2x dx; resolution comparison at 2 unproved in source | Checks; 2-adic comparison made part of the target |
| `qPDDiagonal` | d = 1 sign; d = 2 shift; classical numerator; δ^{(p)} mod [p]_q; cosimplicial degree 0 | found normalisation slip E3; (x−y)² fails shift by (q−1)²xy | stated with [d]_q!; Lean `diagonalNumerator_shift` and `_one` proved |
| `canonicalFramedTrace` | d = 0, 1, 2; ℤ[x,y] over ℤ; ℚ[x^{±1}]; H⁰(M/^Lh) vs H⁰(M)/h | ℤ[x,y] outside canonical domain over ℤ; trace applies | Checks |
| `TraceInversion` | ℚ with Δ = 6, 1; ℚ(i) with 6, 12; ℚ(∛2) with 108 | condition is on Δ, not on the ring | Lean examples and `TraceInversion.isUnit_two_three` proved |
| `numberFieldTraceExports_twisted` | first draft used p = 3 with Δ = 12 | wrong: 3 \| Δ so R̂₃ = 0 and the relation is empty | corrected to p = 7 (inert): φ₇(i) = −i; twisted family checked |
| `numberFieldTraceExports` other | ℚ(∛2) at 5; (1,0,0,…) at p = 5; τ₁ on ℤ[1/6]; Δ = 1 | x³−2 ≡ (x−3)(x²+3x+4) mod 5 irreducible quadratic; τ₁ not injective | Checks computed |
| Generality README vs Lean | exponent predicates; TraceInversion; diagonalNumerator | Lean predicates take p : ℕ (README: p prime; harmless, more general); Δ : ℤ in both; ℤ[x,y,q] in both | none |
| Locators | all 70 | BS "Theorem 15.7" is Proposition 15.7 | fixed |

## Checks run

- `lean-check research/blueprint/packages/HabiroCohomologyFoundationsPartII/Suggested.lean`: exit 0,
  **no warnings and no `sorry`** (every theorem and example is proved). Declarations: `E1QuotientExponent`,
  `E2QuotientExponent`, `diagonalNumerator`, `diagonalNumerator_shift`, `diagonalNumerator_one`,
  `TraceInversion`, `TraceInversion.isUnit_two_three`; four examples. No sorry'd data, no `set_option`.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- `scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- The gate's `mech_check.py` (run from scratch with `python3 -I`): 0 README identifiers missing from
  Lean, 0 empty sections, 0 round labels.
- `git diff --check` clean.

## Untrusted text

No issue comments other than the claim and the bot's confirmation. Nothing instruction-like was found
in other authors' files or in the fetched papers.
