# Independent package review, round 2: PrismaticCohomology

**Verdict: needs_changes.** The package is mathematically careful, and the
two arguments added in the second packaging round (§1.24 and §8.76a) survived
an independent check. It fails both of the manager's requirements for this
review:

1. **Size.** The README is 1.58 MB after this review's mechanical compaction
   (1.64 MB as submitted), about eight times the 50–200 KB package band.
2. **Order.** The package cited PadicHodgeTheory as a supplier, and three
   roadmaps that come before it in the settled order as consumers. Every one of
   these citations is retargeted in place (§2 below).

It also plans again a substantial part of what the open upstream pull
requests PerfectoidSpaces (#818), PadicPeriodRings (#940) and
FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) already state. Part of its
PerfectoidQuotients contract is stale against that package's accepted fix.
Section 9 gives the concrete compaction plan and the worklist for the fix
round.

Reviewer: Claude (Opus), session `claude-Pb2mL7`, issue #9879, 2026-10-17.
The package was written by Codex sessions `codex-r34hIf` (#9189),
`codex-TrnTU4` (checkpoint #9948) and `codex-2fDWWk` (#10016, PR #10032), and
reviewed in round 1 by `codex-6c8mLq` (#9233). This reviewer took part in none
of those jobs. The packets were read and not edited.

## 1. Size (manager requirement 1)

| Part of the README | As submitted | After this review |
| --- | ---: | ---: |
| Scope, Conventions, How to read | 9 KB | 9 KB |
| Exact supplier contracts | 127 KB | 120 KB |
| Layer 0 (92 subsections, 54 under 2 KB) | 189 KB | 182 KB |
| Layers 1–7 | 1,020 KB | 960 KB |
| Layer 8 (86 subsections, 26 under 2 KB) | 279 KB | 272 KB |
| References and consumers | 13 KB | 13 KB |
| **Total** | **1,638 KB** | **1,576 KB** |

Inside the layers, statements and hypotheses take 38%, proof paragraphs 22%,
*Needs* lists 11% (before this review's change), API lists 8%, "For example"
paragraphs 7.5%, Checks 7% and locators 3%. The 425 subsections are
target-catalogue granularity: 123 open with "Construct this notion.", 238 with
"Prove the following assertions.", 364 carry a "For the proof," paragraph and
366 a "For example," paragraph.

The package does not fit the band, and compaction alone cannot make it fit
without dropping hypotheses, APIs or Checks. Estimates from the measured
composition:

| Step | What to do | Saving |
| --- | --- | ---: |
| A. Delete duplicates | §3 tables: PerfectoidSpaces P4.15, PadicPeriodRings, FiniteFlatGroups, PerfectoidQuotients after #10202 | ~110 KB |
| B. Contracts as a table | One row per supplier and layer with the exact interface, as in PadicPeriodRings #940; drop the 119 "Consumed by" lines (41 KB; they can be derived from *Needs*) | ~95 KB |
| C. Proof routes | Each "For the proof" paragraph becomes at most three sentences with its locator. Keep in full (≤4 KB each) only the arguments original to this roadmap: §1.24, §2.14, §8.40's negative controls, §§8.76a–8.77 | ~195 KB |
| D. Examples into Checks | Delete "For example" paragraphs that repeat a Check; turn the discriminating ones into Checks; move worked examples to each layer's `### Examples` | ~75 KB |
| E. Conventions once | State the standing hypotheses once in Conventions (p prime, unital commutative rings, bounded prism, derived completions) instead of a hypothesis line in every subsection; delete the template openers | ~55 KB |
| F. Merge micro-targets | Layer 0: §§0.1–0.21 → 3 subsections, §§0.22–0.46 → 3, §§0.47–0.54 → 1, §§0.62–0.67 and 0.87–0.92 → 2. Layer 8: fold §§8.4–8.6, 8.12–8.13, 8.16–8.17, 8.22–8.26, 8.28–8.29, 8.31–8.35, 8.38–8.39, 8.45, 8.47–8.50, 8.53–8.57, 8.61, 8.67–8.68, 8.72 and 8.75 into the subsections of the constructions they serve. Every API name and Check is kept | ~30 KB |

Steps A–F take the README to roughly 1.0 MB. Reaching the 50–200 KB band
therefore needs a split into Parts along the existing layer boundaries, which
is a restructure for the maintainer:

| Part | Layers | Estimated size after A–F |
| --- | --- | ---: |
| I. Delta rings, prisms, relative and derived prismatic cohomology | 0–2 | ~205 KB |
| II. Nygaard filtration, absolute prismatic cohomology and Cartier–Witt stack, q-de Rham | 3–5 | ~260 KB |
| III. Étale and syntomic comparisons, prismatic F-crystals | 6–7 | ~180 KB |
| IV. Logarithmic prismatic cohomology | 8 | ~170 KB |

The Parts form a chain I → II → III → IV, all after AInfCohomology and
before PadicHodgeTheory. The order file records that Caraiani–Newton needs
only 3 of the 9 layers, so the Parts off that path can follow later. The
alternative is to keep one roadmap and accept a size above the band after
A–F; upstream PR #818 (PerfectoidSpaces) is itself 1.44 MB. Either way the
decision is the maintainer's. Steps A–F are needed in both cases.

This review applied the mechanical part of the compaction, with no change to
the content. The 2,024 title-text links in *Needs* and "Consumed by" lists now
read `[§k.n](#anchor)`, 148 "target ⟨title⟩" references read "§k.n", and the
490 internal slug references of the form "Layer 3/breuil-kisin-twist" are
§-numbers. Every slug and every anchor resolved; no link is broken.

## 2. Order (manager requirement 2)

Settled order: PerfectoidQuotients → AInfCohomology → PrismaticCohomology →
PadicHodgeTheory. Every PadicHodgeTheory id and mention was searched for, and
every supplier, consumer and *Needs* citation of the four bundle roadmaps was
read.

| Violation | Where | Disposition |
| --- | --- | --- |
| `PadicHodgeTheory:R06.1` as supplier (period rings) | contract block; §§7.0, 7.0a, 7.13, 7.14, 7.16, 7.18; Layer 7 Dependencies | **Fixed.** Now `TauCetiRoadmap.PadicPeriodRings` §3 (principal Fontaine envelope, θ_cris, log[ε]), §1.5 and §4.1 (B_cris⁺, B_cris, B_dR⁺, B_dR, Frobenius, Galois action, A_cris → B_dR⁺), for an arbitrary perfect residue field, read at PR #940 head `ef7f47c`. The θ̃ dictionary stays in the contract |
| `PadicHodgeTheory:R06.2` as supplier (period functors, weak admissibility, full faithfulness) | contract block; Conventions; additional inputs; §§7.0, 7.0a, 7.14, 7.15, 7.17, 7.20, 7.22, 7.24; Layer 7 Dependencies | **Fixed.** Now PadicPeriodRings §§4.2–4.3 (D_crys, D_st, D_dR, crystalline and de Rham predicates, fixed fields, regularity, fundamental sequence) and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1–R07.3.3 (filtered (φ,N)-modules, t_H, t_N, weak admissibility, Fontaine's theorem that D_crys(V) is weakly admissible and D_crys fully faithful), read at PR #879 head `f86591e` |
| `PadicHodgeTheory:P7:annulus-foundations` and `P7/extended-robba-ring-with-galois-action` | contract block; §§7.20, 7.23; Layer 7 Dependencies | **Fixed.** Robba rings from FiniteFlatGroups §R07.4.7 (built on Kedlaya 2005, Definition 2.2.13). The extended Robba rings over C^♭ come from AInfCohomology §AI.2.3, with the Galois action by functoriality. The analytic-continuation lemma (Kedlaya, Lemma 2.3.5 and Remark 2.3.8, as used for the F-crystals paper's Lemma 7.7) is not stated by any supplier, so it is declared a local step of §7.23 |
| PadicHodgeTheory listed as a supplier | Scope and ownership | **Fixed.** It is now named only as a consumer |
| AInfCohomology, PerfectoidQuotients and FiniteFlatGroups as consumers | Downstream consumers | **Fixed.** All three come earlier; they are removed. The Kisin sentence now says Layer 7 builds on FiniteFlatGroups' Kisin modules |
| PerfectoidQuotients consumes §0.85 (perfectoid Tor-independence) and §0.59 (δ-étale extension) | PerfectoidQuotients' accepted package | Consumer side; #10202 moves both lemmas into PerfectoidQuotients. **Remaining here:** once that lands, delete §§0.59 and 0.85 and import them |
| AInfCohomology citing this roadmap as supplier | AInfCohomology's package | Consumer side, handled by #10201 under the same order |

After the fix no PadicHodgeTheory id remains in the package. Every other
supplier is at tier 13 or below; CohomologyComparisons (tier 14) and
HodgeTateAndCanonicalSubgroups (tier 16) appear only as consumers. The
package uses no `FoundationsAndLibraryIntegration` or `UPSTREAM:` id.

## 3. Duplication against Tau Ceti and the upstream roadmaps

The pinned Mathlib (`082e2d3`) and the current Tau Ceti library (`a91d3aaf`)
were searched by object. Neither has δ-structures, prisms, Nygaard
filtrations, q-integers or Breuil–Kisin data. The only "prism" in TauCetiRoadmap
main (`0d144d0`) is the prism operator of AlgebraicTopology, which is
unrelated. The open upstream pull requests are a different matter.

**PerfectoidSpaces #818, head `3a308c7`, §§P4.15.1–P4.15.5.** PerfectoidQuotients
already consumes these as the single owner. They define δ-rings,
distinguished elements, prisms (bounded, perfect), rigidity, prismatic
envelopes of regular sequences, perfection of prisms, the equivalence between
perfect prisms and integral perfectoid rings, the initiality of A_inf, affine
prismatic cohomology over bounded oriented prisms by Čech–Alexander
complexes, the affine Hodge–Tate comparison and base change, the derived
extension with its conjugate filtration (BS22 Construction 7.6), the QRSP
prism, the André cover and the surjectivity of perfectoidization. A Sonnet
cross-check of all 152 subsections of Layers 0–2, with every SAME verdict
read against the P4.15.2–P4.15.3 text by this reviewer, gives:

| Verdict | Subsections | Fix |
| --- | --- | --- |
| Same result | §§0.72, 0.83, 0.84, 0.86, 1.25, 2.11, 2.15 | Delete; cite P4.15.2 or P4.15.3 under Scope and ownership |
| Special case upstream (oriented, affine or semiperfectoid only) or only named there | §§0.55, 0.61, 0.68, 0.70, 0.73, 0.75, 0.79, 0.82, 1.7, 1.8, 1.10, 1.11, 1.13, 1.16, 1.18, 1.20, 1.21, 2.1, 2.2, 2.3, 2.7, 2.8, 2.12, 2.13, 2.16, 2.27, 2.30 | Consume P4.15; keep only the extension (all bounded prisms with Breuil–Kisin twists, formal schemes, non-semiperfectoid inputs), with one clause saying how it differs |
| Not stated upstream | the other 118 | Keep |

**PadicPeriodRings #940 and FiniteFlatGroupsAndIntegralPadicHodgeTheory #879.**

- §7.0a's three assertions are stated upstream for an arbitrary perfect
  residue field: the fixed fields (PadicPeriodRings §4.3), and full
  faithfulness and weak admissibility of D_crys (FiniteFlatGroups §R07.3.3).
  §7.0a should be deleted and cited.
- §7.17 builds Kisin's 𝓜(D) over the open unit disc, which is
  FiniteFlatGroups §R07.4.6. Consume it and keep only the F-crystal
  statement.
- §7.0's filtered Frobenius bundle dictionary constructs the schematic
  Fargues–Fontaine curve, GAGA, the Robba-window equivalence and the
  slope-zero results. Slope zero over the Robba ring and its relation to weak
  admissibility are FiniteFlatGroups §§R07.4.7–R07.4.9, and the Fargues
  classification is AInfCohomology §AI.2.3. FarguesFontaineDiamonds (#964)
  excludes vector-bundle classification, so the curve itself is not
  duplicated upstream. Still, §7.0 should consume those two suppliers and
  keep only the statement §7.20 needs.
- The trace square in §7.0 is used by §§7.18–7.19 and stays, compacted.

**Stale PerfectoidQuotients contracts (about 70 citations).** PerfectoidQuotients'
accepted fix deleted its own integral-perfectoid predicate and its
semiperfectoid constructions in favour of PerfectoidSpaces. The contracts
here still cite the old atlas stages:

| Cited here | Owner now |
| --- | --- |
| `PerfectoidQuotients:Q0:integral-algebra` (integral perfectoid rings, A_inf, θ, ξ) | PerfectoidSpaces §§P1.16–P1.18 and P1.24–P1.25. The cotangent and Witt-torsion consequences stay with PerfectoidQuotients Layer 0 |
| `PerfectoidQuotients:Q1`, `Q2` (universal perfectoid quotient; Δ_{R,perf} = A_inf(R_perfd)) | PerfectoidSpaces §§P4.15.2–P4.15.3 |
| `PerfectoidQuotients:Q3` (André's lemma) | PerfectoidSpaces §P4.15.4 |
| `PerfectoidQuotients:Q4` (surjectivity of S → S_perfd) | PerfectoidSpaces §P4.15.5 |

These were not retargeted here, because the Layer 0–2 rewrite against P4.15
will touch every one of them.

**Open ownership question.** PerfectoidQuotients' package assigns general
perfectoidization of animated rings, arc descent and J-almost purity to a
future PerfectoidQuotients Part II, whose design job is pending. This package
states the same material in §§2.0 and 2.22–2.31. One owner must be chosen; if
it is this roadmap, PerfectoidQuotients' sentence must point here.

## 4. Sources

A pseudorandom sample (seed 9879) of 15 targets not in round 1's sample was
checked against the arXiv versions the README cites (BS22 v4, BL22 v1, ALB23
v4, FCRYS v2, K1 v3, KatoII). Haiku agents located the 41 numbered items;
every flagged item and every changed locator was read by this reviewer.

| Section | Locators | Result |
| --- | --- | --- |
| §0.31 | BS22 Lemma 2.17, p.17 | Found. The README states a sharper form (no finite generation; δ(I^{n+1}) ⊂ I^n); checked true by induction |
| §0.80 | BS22 Lemma 3.6, p.29 | Matches, including triviality of φ*I and I^p |
| §0.89 | ALB23 Example A.4, p.95 | Matches |
| §1.1 | BS22 Corollary 3.12 and proof, p.33 | Matches |
| §1.16 | BS22 §5 introduction; Corollary 5.5 and proof | **Corrected:** introduction p.45 (cited p.49); proof p.50 (cited p.49) |
| §3.19 | BL22 Construction 5.2.1, Propositions 5.2.2–5.2.3, Corollaries 5.2.8, 5.2.9 and 5.2.15, pp.119–123 | Match |
| §3.20 | BS22 Theorem 13.1 and proof of Lemma 13.2, pp.94–95 | Match |
| §4.12 | BL22 Definition 3.4.1, Remark 3.4.2, Construction 3.4.4 (p.45); Theorem 3.4.13, Remark 3.4.14, Corollary 3.4.16 (p.48) | Match |
| §5.12 | BS22 Theorem 16.17 and proof, p.113 | Matches |
| §6.28 | BS22 Theorem 14.1, Lemmas 14.4–14.5 | **Corrected:** the proof of Theorem 14.1 is on p.100 (cited p.97) |
| §6.30 | BL22 Construction 8.4.1 to Proposition 8.4.14, pp.196–201 | Match (BM23 not checked) |
| §7.6 | FCRYS Definition 3.2 (p.9), Remark 3.9 (p.11) | Match |
| §8.1 | K1 Definition 2.2 (pp.6–7), Remark 2.5 (p.8) | Match; the README's axioms and the Lean structure agree with the definition |
| §8.42 | K1 Theorem 8.5, p.49 | Matches (CK not checked) |
| §8.59 | KatoII Definitions 2.1 and 2.3, pp.6–7 | Match (KY not checked) |

ALB23 Lemma 5.1.6 (p.76) was also read. It is printed without the extra
hypothesis of §1.24, and its proof treats the Čech–Alexander term as
p-completely flat. §5 records the check of the counterexample.

## 5. Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Suggested.lean δ API: `correction_identity`, `correction_two`, `delta_prime`, `no_delta_structure`, `reconstruction`, `quotient_structure_iff`, `idealClosure_prime`, `distinguished_prime_mem`, `integerDelta_structure` | p = 2, 3; zero ring; ℤ; nontrivial characteristic p; p-torsion | True as stated. Recomputed δ(2) = −1 and δ(4) = −6 at p = 2, δ(2) = −2 at p = 3, δ(p) = 1 − p^{p−1}; in characteristic p, δ(p) = δ(0) forces 0 = 1 | None |
| §0.31 congruence bound | non-finitely-generated I; n = 0; 0 versus 2 at p = 2 | δ(I^{k+1}) ⊂ I^k by induction on products and sums | None |
| §§0.61, 0.66 | δ([p]_q) modulo the δ-ideal (q − 1); p = 2 value −q; p² not distinguished; ℚ[x^{1/p^∞}] (not p-separated); q of rank one without p-th roots | True | None |
| §§0.72, 0.76, 0.77 | (ℤ_p,(p²)), (ℤ_p[[q−1]],(q−1)), (ℤ,(p)); E = u − p with δ(−2) = −3 at p = 2 | True | None |
| §1.24 positive theorem | bounded d-torsion of A/p versus pro-zero (A/Iⁿ)[p], both directions (via Tor₁ and stabilisation of M[d^k]); transversal ⇒ d regular on A/p; perfect base (reduced A/p, bound one) | True | None |
| §1.24 counterexample | δ on the square-zero ring (A p-torsion-free); δ_A(d) = 1; J_n/dJ_n ≅ ℤ_p ⊕ 𝔽_p; d-torsion of e_n has order exactly n; tʳe_n ∉ pM; compatibility of z_n; degree −1 Milnor sequence; initiality of B in (S/A)_Δ | Every step verified. The unrestricted ALB23 Lemma 5.1.6 is false | None; see §8 |
| §3.10 divided Frobenius | unit rescaling u^{−i}; perfect and crystalline prisms | True | None |
| §4.13 Sen operator | Θ = +n on O{n}, −n on conjugate gr_n; (1 + [ε])V(y) = V(y) uses ε^p = 0 | True | None |
| §5.1 γ | δ([p]_q) ≡ 1 mod [p]_q; γ(x + y) and γ(fx) recomputed | True | None |
| §6.24 weights 0 and 1 | Z_p(1)(ℤ_p): H⁰ = 0, H¹ = 1 + pℤ_p for odd p; p = 2 keeps {±1} | True | None |
| §8.1 δ_log | p = 2 witness δ_log(n) = (3ⁿ − 1)/2 on the prelog structure α(n) = 0 for n > 0; units; divisibility criterion | True | None |
| §8.76a contraction | v_p((pⁿr)!) − v_p(r!) = r·e(n) by Legendre; p = 2: valuations 1 and 3 for 2! and 4!; rank-one homogeneous pieces from a positive height | True | Lean example now pins these valuations |
| Koszul sign convention | d¹d⁰ = 0 for commuting operators; the plus sign gives 12 on ℤ with 2 and 3 | True | Lean example now states it over arbitrary modules |
| Generality, README against Lean | Lean δ and δ_log structures over arbitrary rings; README δ_log over ℤ_(p) | The difference is declared in Conventions | None |

The round-1 review recorded its own whole-package pass. This round covered
the sampled targets, the conventions, every Lean declaration and the two new
arguments.

## 6. Suggested.lean

`lean-check` was run on the submitted file and on the final file at the
pinned Mathlib. Both exit 0 with 26 warnings, all `declaration uses sorry`,
and nothing else. The file is 454 lines, with light real-bodied definitions
over existing carriers, `theorem` statements, `example`s, one module
docstring and one namespace. It has no sorry'd data, `True`, `#print`, `#eval`
or `lemma`, and develops no theory.

Fixes:

- Deleted four examples that tested no declaration: the Layer 4 integer
  arithmetic, the Layer 7 degree arithmetic, and two Layer 8 numeral and
  field facts.
- Restated the Koszul sign example over linear maps of an arbitrary module.
- Turned the factorial example into divisibility witnesses for the two
  2-adic valuations of §8.76a.
- Removed from the closing comment the objects that the file does introduce
  (addition correction, `Structure`, `FrobeniusLift`, associated Frobenius,
  reconstruction, integer δ, δ-stabilisation, distinguished elements, [p]_q,
  δ_log-rings).

**Remaining:** Lean names should equal the README's API names. The README
§8.1 API is `DeltaLogRing.*` (`frobenius_alpha`, `unitFactor_mul`), while the
file uses `Log.DeltaLogStructure`, `Log.unitFactor_mul` and
`Log.frobenius_chart`. The README §5.1 prefix is `Prismatic.QCrys.*`, while
the file uses `QCrys.*` inside the roadmap namespace.

## 7. Form and own words

No source passage or section-by-section summary was found. Fixed in place:

- 490 internal slug references are now §-numbers.
- "Acceptance example" labels (22) are removed.
- Residue phrases are replaced: "lemma nodes", "previous nodes", "earlier
  nodes … acceptance tests", "requested extension", "requests the general
  carrier", "the D0 request", "rather than requests to the later
  PerfectoidQuotients Part II", "assembly".

The template prose is what remains (§1, step E).

## 8. Notes for the maintainer

- **Errata candidate.** ALB23 (Prismatic Dieudonné theory, arXiv
  1907.10525v4) Lemma 5.1.6, p.76, is false as stated. §1.24 gives the
  counterexample (a completed localisation of a square-zero bounded prism with
  ℤ_p-torsion-free A, whose prismatic H⁰ over a p-completely étale A/I-algebra
  has p-torsion), and this review verified it. The statement holds under the
  extra hypothesis that A/p has bounded I-power torsion, which covers the
  perfect bases used in ALB23's applications. This belongs in an errata job.
- The Part split (§1) and the owner of general perfectoidization (§3) are
  planning decisions.

## 9. Worklist for the fix round, in order

1. Delete or reduce the duplicates of §3 (PerfectoidSpaces P4.15; §§7.0a,
   7.17, 7.0 against PadicPeriodRings and FiniteFlatGroups), and retarget the
   stale PerfectoidQuotients contracts by the mapping table.
2. After #10202 lands, delete §§0.59 and 0.85 and import them from
   PerfectoidQuotients.
3. Apply compaction steps B–F of §1. Then split into Parts I–IV if the
   maintainer chooses the split.
4. Align the Lean names with the README API (§6).
5. Re-run `lean-check` and the intake file check.

## Checks run

- `lean-check` on the package Suggested.lean, before and after: exit 0,
  26 `sorry` warnings only.
- `python3 research/blueprint/intake.py check-files` on README.md,
  Suggested.lean and metadata.toml: 3 files, 0 problems.
- Anchor integrity after the link changes: 2,094 internal links, none broken.
- metadata.toml is the single line `topic = "math.AG"`, which fits; unchanged.
- No language server, Lake build, cache fetch or update was started, and
  nothing was run in the read-only TauCetiRoadmap or Tau Ceti checkouts. The
  upstream pull-request heads were read through the GitHub API.
