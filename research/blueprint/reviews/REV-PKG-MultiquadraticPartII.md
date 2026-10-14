# REV-PKG-MultiquadraticPartII — independent package review

Job #9227. Reviewer: Claude (Opus 5.5), session `claude-zHOUHT`, 2026-10-14.
Package under review: `research/blueprint/packages/MultiquadraticPartII/`
(README.md, Suggested.lean, metadata.toml), written by Codex (`codex-sjtWGe`,
PKG job #9183), against the accepted plan `packets/MultiquadraticPartII.json`.

**Verdict: accepted, with the corrections below applied in place.**

## Summary of what changed

| Item | Finding | Action |
| --- | --- | --- |
| D1 (supplier gap, Layer 3) | The comparison target relied on two supplier contracts in GeometryOfNumbersAndQuadraticArithmetic: "GN.2" for the genus character of a binary form (with its zero branch, independence of the represented value and proper invariance), and "GN.3" for maximal-order, convention and norm-witness adapters. The GN package, which is now TauCetiRoadmap PR #851 with an authoritative README, plans neither. Its only binary-form material is positive definite forms of negative discriminant (its 4.3, `PositiveBinaryForm`, `binaryFormIdealCorrespondence`). IntegralLattices Layer B has no genus character on forms either. The planned notion (atlas GN.2 node `BinaryForm.genusChar`) therefore had no owner. | Restated here as Layer 3.1, the one definition the roadmap owns: `binaryFormGenusChar`, in the generality of Gross–Kohnen–Zagier Ch. I §2 and Duke–Imamoḡlu–Tóth §9, with its zero branch. It comes with an API (evaluation law, zero law, empty factor, scaling, GL₂(ℤ)-invariance, sign law), proof sketches and six discriminating Checks. The GN.2/GN.3 supplier sections are removed. The adapter work they described is now the proof of 3.2. IntegralLattices B and GlobalNumberFields 11 move from "suppliers" to "boundaries" in Scope and ownership. |
| D2 (Lean signature, Layer 3) | `formCharacter_eq_idealCharacter` took a `QuadraticForm`, its coefficients, discriminant and content, an arbitrary function `formChar` with a represented-value law, a class `A` and an ideal of norm `m` in `A⁻¹`. Nothing tied the form to `A` except the shared integer `m`. The form, its coefficients, the discriminant and the content hypotheses were decorative, and the statement reduced to the library's coprime-ideal evaluation law. It was not the comparison, so the README's generality and the Lean signature's differed. | Replaced by a statement on pinned carriers that *is* the comparison. Take the form `[a,b,c]` of discriminant `D`, an `ω : K` with `ω² = D`, and an invertible fractional ideal `𝔞` whose elements are exactly `u·a + v·(−b+ω)/2` (`u, v ∈ ℤ`). Then `binaryFormGenusChar t a b c = χ_t(if 0 < a then [𝔞]⁺ else J·[𝔞]⁺)`, which is the oriented class of IntegralLattices B2 taken in `NumberField.NarrowClassGroup`. No hypothesis contains the conclusion. The README 3.2 states the same two clauses, with a proof covering all four sign cases of `a` and the represented value. |
| D3 (Downstream consumers) | It named GeometryOfNumbersAndQuadraticArithmetic GN.4 as a consumer. GN is a lower-tier roadmap already upstream and cannot consume this one, and its package does not mention the genus normalization. | Rewritten: AnalyticNumberTheory AN.4 (Hecke periods, genus Euler factorization), the proposed Fuchsian orbifolds Part II (Nielsen cores), and the Duke–Imamoḡlu–Tóth genus averages and twisted traces. These consumers are taken from the paper routing PAPER-DUKE-IMAMOGLU-TOTH-16. |
| D4 (notation) | Duke–Imamoḡlu–Tóth write `h(D)` for the **narrow** class number (§2, p.950), while the README uses `h(D)` for the wide one. The (4.2) locator in Layer 1 could be misread. | Added a sentence to Conventions. |
| D5 (locator wording, 2.2) | The sign-of-prime-discriminants lemma was cited to DIT p.960 as if DIT stated it. DIT state the prime-divisor criterion for `J` in the principal genus there, citing [24, Prop. 3.1]. | Reworded: 2.2 is the elementary step that turns Tau Ceti's sign criterion into DIT's prime-divisor form. The locator is kept for that criterion. |
| D6 (Lean examples) | All 18 examples were `sorry`, including pure arithmetic ones. The D=48 zero test could not be stated without a form character. | The file now has 25 examples. Twenty are proved (by `norm_num`, `decide`, `simp` or short proofs): the two descent examples, the two-torsion count, the D=1 boundary, the four two-square instances (5, 8 and 136 as sums, 12 not), the nonfundamental 9, the four dyadic and empty signs at −1, the sign difference at D<0, the empty-factor form character, the **D=48 imprimitive zero test** (`binaryFormGenusChar {-4} 2 0 (-6) = 0`), the |m| trap at −3, the x²+2y² negative control for the δ′ hypothesis, (5/2) = −1 at discriminant −15, and the nonfundamentality of 48. Five are statement-only (`sorry`): the cyclic-eight genus fibre, ¬IsSquare J for ℚ(√3), IsSquare J for ℚ(√34), and the two D=12 form-character values. |
| Wording | "There are no new definition or construction targets"; the "witness version"; the `QuadraticForm ℤ (Fin 2 → ℤ)` carrier. | Updated: one light definition on integer triples. `QuadraticForm` is not used, since its discriminant needs 2 invertible, which is the same reason the current Tau Ceti `BinaryQuadraticForm` file gives. |

Layers 0–2 (eight theorem targets) are mathematically unchanged; their statements, Checks and Lean
signatures were verified as below.

## Checks performed

### 1. Upstream form
Compared with `Completed/Multiquadratic/README.md`, `TauCetiRoadmap/IntegralLattices/README.md`
(Layer B) and `TauCetiRoadmap/GlobalNumberFields/README.md` (Layer 11) at TauCetiRoadmap
`0d144d04`. The package has the upstream shape: title, **Summary.**, Scope and ownership,
Conventions, Exact supplier contracts (Mathlib, Tau Ceti), How to read the build, Layers 0–3
with `### k.n` prose subsections, `**Checks.**` lists, `### Examples`, `### Dependencies`,
Downstream consumers and References. No target tables or field lists. Both internal anchor links
to upstream READMEs were checked (`#layer-b-binary-lattices-and-quadratic-orders`,
`#layer-11-orders-and-picard-groups`).

### 2. Fidelity to the plan
All nine plan targets (RQ.0–RQ.3) are in the README with their hypotheses. RQ.3's plan node is
`formCharacter-eq-idealCharacter`, with a recorded gap and two supplier requests to GN.2/GN.3.
The gap is now closed inside this roadmap (D1). The comparison is the plan's statement, and its
"Prove/acceptance" items (D=12 orientation pair, D=5 principal form, D=48 zero branch, coefficient
table) are all kept as Checks. The one addition is the form character the plan expected from
GN.2. It is the definition the plan's request describes (content-zero branch, represented-value
evaluation, independence, proper invariance, χ(−Q) = sign(δ)χ(Q)), in the same generality.

### 3. Sources (all locators opened)
Duke–Imamoḡlu–Tóth, Ann. Math. 184 (2016), final public PDF (sha256 `a67de715…f35f61`,
identical to the packet's). Every locator in the README was read at its printed page:

| Locator | Used for | Result |
| --- | --- | --- |
| §2 pp.950–951, narrow/wide classes | 0.1 | matches (Cl = Cl⁺/J; J ≠ I iff no unit of norm −1) |
| §2 p.951, before minus continued fractions | 2.5 | matches (p ≡ 3 mod 4 dividing D forces J ≠ I) |
| §2 p.951, all forms primitive for fundamental D | 3.2 | matches |
| §2 p.952, norm form, w = (−b+√D)/(2a), (2.3)–(2.5) | 3.2 and its Checks | matches; table labels A⁻¹, JA, JA⁻¹ as stated |
| §4 p.959, (4.1)–(4.2) | 1.1 | matches; h(D) there is narrow (D4) |
| §4 p.960, after (4.4) | 2.2–2.4 | matches (J in principal genus iff no p ≡ 3 (4) divides D iff D is a sum of two squares) |
| §7 p.971, after (7.7) | 0.2 | matches (χ(J)=1 gives descent to Cl) |
| §7 p.971, genus characters, before (7.8) | 2.1, misprint E1 | matches; the unqualified χ(J)=sign d=sign d′ is the packet's confirmed source issue E1, used with D>0 |
| §9 p.978, definition before Proposition 5 | 3.1, 3.2 | matches (χ(Q) = (d/m) or 0; χ(Q) = χ(A) for D>0 fundamental) |

Gross–Kohnen–Zagier, Math. Ann. 278 (1987), author-hosted copy on Zagier's MPIM page, Ch. I §2:
p.508 (classical genus character for a fundamental divisor, existence and independence of a
coprime represented value, extension to imprimitive forms) and p.509 (proof: the
prime-by-prime comparison, the representation fact, the role of Δ/D₀ ≡ 0,1 mod 4). Both match
3.1. The dyadic case of the evaluation law was also checked by hand for P = −4, 8, −8: with
e = disc/P ≡ 0,1 (mod 4), the odd value a·Q lies in 1 mod 4, ±1 mod 8 and {1,3} mod 8
respectively. The x²+2y² example shows that e ≡ 2 breaks it. No source was quoted. Every
statement is in the reviewer's own words.

### 4. Gaps and citations
Prerequisites now end in Mathlib and Tau Ceti at the pins, or in an earlier layer. Layer 3 no
longer cites GN, IntegralLattices or GlobalNumberFields as suppliers; they appear only as
boundaries. There are no upward citations, no `FoundationsAndLibraryIntegration` and no
`UPSTREAM:` ids. GN (tier 3) is lower, and nothing is cited from it now.

### 5. Unit tests
The one definition (`binaryFormGenusChar`) has six Checks: the |m| trap at −3, the sign law at
−Q, the D=48 zero branch, the x²+2y² congruence trap, the discriminant −15 separation, and
δ = 1. Seven of these assertions are Lean examples, five of them proved. Every theorem subsection
keeps its Checks. The D=12/D=5/D=48/coefficient-table checks of the comparison are retained.

### 6. Lean
`lean-check research/blueprint/packages/MultiquadraticPartII/Suggested.lean`:

- before: exit 0, 27 warnings, all `declaration uses sorry`;
- after: **exit 0, 16 warnings, all `declaration uses sorry`**, with no errors and no other
  warnings (360 lines). The 16 are the 11 theorem signatures and 5 statement-only examples.

Shape: one real-bodied light definition (choice inside a `dite` over `genusCharFun`; no sorry'd
data), 11 theorem signatures, examples. No `True`, no `Prop := sorry`, no `#eval`, `#print` or
`#synth`, and no process comments. The module docstring follows the upstream form. All 12
declarations are named in the README. Every library name cited by the README was pinned with `#check` in
scratch files at Mathlib 082e2d3 / Tau Ceti f790474. One name,
`prod_primeDiscriminant_mod_four_eq_one`, lives in a module the file does not import, and it
exists at the pin. Ten signatures were spot-checked against the README statements: all of Layers
0–2 and the three Layer 3 theorems. Hypotheses are present, nothing is vacuous, and the
generality is stated in the README where the Lean is more general (0.1, 0.2, 1.1 hold for either
signature).

### 7. Own words, no process
No verbatim passages and no section-by-section summary. Process words were removed with the
supplier sections ("canonical supplier test", "witness version"). `intake.py check-files` on the
three package files: 0 problems. There are no local paths.

### 8. metadata.toml
`topic = "math.NT"`, a single line and fitting. Unchanged.

## Adversarial mathematics pass

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| 0.1 kernel = {1, J} | D=8 (J=1 via 1+√2), D=12 (J≠1), imaginary d<0 (J=1) | holds; coincident entries allowed |
| 0.2 descent ⟺ χ(J)=1 | trivial χ, χ(J)=−1, J a nontrivial square (D=136) | holds; both descent examples proved |
| 1.1 2^{r−1}·#fibre = h⁺ | r=1 (D=5,8), D=12, D=60, cyclic group of order 8 | holds; fibre vs two-torsion distinguished (two-torsion count proved) |
| 2.1 χ_t(J) = sign δ = sign δ′ | t=∅, t=s, D=24 with −8, D=−4 (fails, D>0 needed) | holds with D>0 |
| 2.2 all P>0 ⟺ no p≡3 | D=1 (∅), 12, 24, 8, 136; s={−4,−4} (excluded by "one even"); D=−4 | holds; both hypotheses needed |
| 2.3 two squares | 1, 5, 8, 136 (no primitive representation), 12 (proved impossible), 9 (not fundamental) | holds |
| 2.4, 2.5 | D=12, 28 (p≡3), D=136 (square but J≠1) | hold; converse of 2.5 fails as stated |
| 3.1 evaluation law | negative values (−3 for [1,0,−3]), imprimitive [2,0,−6], δ=1, square discriminants (x²+5xy), x²+2y² with δ′=2 | holds exactly under δ′ ≡ 0,1 (mod 4); the x²+2y² failure is a recorded negative control |
| 3.2 comparison | a>0 and a<0 at D=12 ([1,0,−3], [3,0,−1], [−1,0,3]); D=8 [−1,0,2]; D=5; t=∅; t=s; ω ↦ −ω | holds in all four sign cases of (a, m); orientation is essential at [−1,0,3] |

Instances that made an earlier statement false: only the D<0 case of 2.1, which was already
excluded and recorded as source issue E1. No statement was weakened.

## Duplication against current Tau Ceti and TauCetiRoadmap

Checked TauCetiRoadmap at `0d144d04`: the nine newer roadmaps, Completed/*, IntegralLattices,
GlobalNumberFields and Completed/Multiquadratic. Also checked the Tau Ceti library at `a91d3aaf`,
searching by object (narrow class group kernels, genus fibres, two-square criteria,
prime-discriminant signs, genus characters on forms, binary-form carriers). Findings:

- Current Tau Ceti adds the ambiguous class number formulas
  (`natCard_narrowClassGroup_sq_eq_one_eq_two_pow` and relatives). They count **two-torsion**,
  not genus fibres, so 1.1 is not duplicated; the cyclic-eight check already separates the two.
- Current Tau Ceti adds `TauCeti.BinaryQuadraticForm` (coefficient carrier, `eval`, `discrim`,
  SL₂ action, positive definite reduction and Hurwitz class numbers). It has no genus character on
  forms. The README now tells a formalizer at a later pin to define `binaryFormGenusChar` on that
  carrier. The atlas pin has no such carrier, so the Lean uses triples.
- `ker_toClassGroup_le_square_iff` (at the pin) is the kernel-in-squares form of the sign
  criterion. 2.4 is its arithmetic translation, not a duplicate.
- No target was removed.

## Questions for the orchestrator

1. **Ownership move.** The binary-form genus character planned by the atlas GN.2 node
   `TauCeti.GeometryOfNumbersPlan.BinaryForm.genusChar` (packet
   `GeometryOfNumbersAndQuadraticArithmetic--GN.2`, citing GKZ Ch. I §2 Prop. 1) did not reach
   the GN package or its upstream PR. It is now owned by MultiquadraticPartII Layer 3.1. The
   paper routing PAPER-DUKE-IMAMOGLU-TOTH-16 (items 101–102: "owned at GN.2") and any atlas link
   from MetaplecticAutomorphicForms MP.7 or the Bruinier–Ehlen–Yang direction to GN.2 should be
   pointed here. GN itself does not need the character.
2. The accepted packet still records the RQ.3 gap and two GN requests. The package resolves them
   internally, so the packet's `gaps`/`requests` are stale. A packet edit is outside this job.

## Files changed

- `research/blueprint/packages/MultiquadraticPartII/README.md` (Summary, Scope and ownership,
  Conventions, supplier contracts, How to read the build, 2.2 locator wording, Layer 3 rewritten,
  Downstream consumers, References).
- `research/blueprint/packages/MultiquadraticPartII/Suggested.lean` (module docstring, Layer 3,
  examples).
- `research/blueprint/packages/MultiquadraticPartII/review.json` (new).
- `research/blueprint/reviews/REV-PKG-MultiquadraticPartII.md` (this report).
- `research/blueprint/handoff/REV-PKG-MultiquadraticPartII.md` (handoff).
