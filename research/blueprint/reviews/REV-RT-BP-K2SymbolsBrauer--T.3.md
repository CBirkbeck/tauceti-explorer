# Verification of RT-BP-K2SymbolsBrauer--T.3

Job `REV-RT-BP-K2SymbolsBrauer--T.3`, issue #4451. Verifier: Codex,
session `codex-J6LwjP`, 30 September 2026. All five findings are **confirmed**:
three high, one medium and one low. Finding /4 needs the additional repair
qualification below. This verifies the findings; it neither fixes nor accepts
the whole blueprint.

## Independence and scope

The red-team author was Codex `codex-rtOQ9t`; the blueprint author was Claude
Code `cc-7b31c4`, and its previous reviewer was Claude Code `cc-38267a`. I did
none of those jobs. I read the complete red-team result and report, the affected
packet nodes, source issue E10, the corresponding suggested Lean declarations,
and the relevant convention and correction passages in the previous review.

Verification used repository revision `31176e3`, including the later
K-theory-area fix `c0d6e82`. All five defects remain in that revision. The
original report's line numbers and packet totals precede those changes; current
declaration names and node IDs identify the objects checked below. The current
packet has 62 nodes, 113 API items, 64 tests and 75 baseline declarations. I did
not independently review all of them, the other parts of this roadmap, or all
of its open requests. The seven affected layers' AUDIT-29 library-coverage
entries were consulted; this verification adds no new planned definitions.

## Sources and pinned declarations actually read

The public source was Weibel's [author-hosted K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
dated 29 August 2013, downloaded for this verification: 576 PDF pages,
SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
I read the relevant passages on PDF pages 234–235, 237, 240–242, 244, 254,
256 and 265–266, and viewed rendered pages 235 and 237 to check the relative
relations and tensor formula. Locators below are PDF page numbers; the printed
pagination is eight less. I did not read the published edition or recheck its
separate errata. These are blueprint errors, not newly asserted published-source
errors.

At Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read:

- [`rootsOfUnity_one` and the `Subsingleton (rootsOfUnity 1 M)` instance](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean#L78).
- [The unconditional `HasEnoughRootsOfUnity M 1` instance](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/EnoughRootsOfUnity.lean#L113).
- [`ValuationSubring.surjective_unitGroupToResidueFieldUnits`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/ValuationSubring.lean#L739).

At Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`, I read
[`Valuation.exists_eq_zpow_mul_unit_of_surjective`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Valuation/Discrete/Order.lean#L252)
and the immediately preceding unit criterion. These supply elementary valuation
facts, not a pre-existing higher Milnor residue or transfer theorem.

## /1 — high, confirmed: the relative quotient imposes false relations

Current suggested Lean lines 2348–2388 define `RelDSGen`, `relDSRel`, the
quotient, its prescribed map to relative K₂ and `relative_presentation`. The
third relation admits a triple whenever its three symbol pairs have an entry
in I. The packet's `T.6/relative-presentation` and source III.5.11.1(b), p.235,
require an entry of the original triple itself to lie in I. Those conditions
are different.

Here is a direct check of the reported obstruction. In
R = F₃[x,y]/(x²,y²), put z = xy and I = (z). Then I² = 0 and I is contained in
the Jacobson radical (x,y). For (r,s,t) = (x,y,x+y), all three entries lie
outside I, but rs = st = tr = z. Thus the current quotient kills

`q = ⟨x,z⟩ − ⟨z,x+y⟩ − ⟨z,y⟩`.

Exercise III.5.14(a), p.237, gives the detector from relative K₂ to
I ⊗_R Ω¹_(R/I)/Z with ⟨u,a⟩ mapping to u ⊗ dā for u in I. Here I is a
one-dimensional residue-field module, and tensoring kills the coefficients of
the differential relations x² = xy = y² = 0. The target therefore has basis
z ⊗ dx, z ⊗ dy over F₃. Using D1 for the first term, the three term images
are (2,0), (1,1), (0,1); their signed sum is (1,1), which is nonzero. The
packet's own `relative_square_zero_kaehler` prescribes the same detector.
Consequently the claimed map cannot descend with the specified generator
images; this is not merely a missing proof.

I inspected and reran the report's exact Python reproducer. It enumerated all
81 ring elements and found zero detector values on 477 D1, 20,385 D2 and
56,889 source-permitted D3 relations. Of 13,824 additionally admitted D3
triples, 12,960 had nonzero detector values. This is a reproduction of the
red-teamer's program, accompanied by the independent tensor calculation above,
not a separate implementation of the exhaustive enumeration.

**Required repair:** explicitly require `r ∈ I ∨ s ∈ I ∨ t ∈ I` in relative
D3; retain or derive the pair-admissibility witnesses. Recheck quotient descent
and presentation, synchronize the API/tests, and retain this counterexample as
a non-example. Absolute Dennis–Stein D3 is not a replacement for relative D3.

## /2 — high, confirmed: the global product fails for m = 1

`T.7/global-reciprocity` and current Lean `global_reciprocity` at line 2786
admit m = 1 and multiply by the quadratic real sign independently of m. Set
F = Q and a = b = −1. The pinned roots-of-unity statements show that all
roots hypotheses hold for m = 1 and every finite factor must be 1. The
invertibility hypothesis is just invertibility of 1. Q has one real place;
its factor is −1 by III.6.2.1, p.240, and the packet's
`realSignSymbol_symbol`, `realSignSymbol_neg_one_neg_one` and `signSymbolAt_rat`.
The asserted product is therefore −1 = 1 in Qˣ. Choosing a different finite
local normalization cannot change a value in the singleton μ₁.

**Required repair:** the real factor is 1 when m = 1 and the quadratic sign
when m = 2. Under the primitive-root hypothesis a real place cannot exist for
m > 2. Alternatively require 2 ≤ m and give the trivial m = 1 theorem
separately. Align the theorem, prose and global comparison proof; test
Q, m = 1, a = b = −1 and retain the m = 2 real/dyadic cancellation test.

## /3 — high, confirmed: the real conic test includes zero inputs

`conicSymbol` at line 2582 is defined on arbitrary field elements by solvability
of rx² + sy² = 1. Its real compatibility test at line 2659 quantifies over
arbitrary r,s : R. At r = s = 0, solvability is false, so the symbol is −1,
whereas the strict-negative conjunction is false. This counterexample is
independent of every `sorry`-defined K₂ operation. The source's Steinberg
symbol domain is a pair of units (III.6.2–6.2.2, pp.240–241), and the nearby
`hilbertK2_real` correctly uses that domain.

**Required repair:** use real units or explicit nonzero hypotheses in the test
and its packet description; make this domain explicit in the real comparison
proof as well. If retaining the total auxiliary conic function, include its
zero-input non-example. On all real inputs its negative-value criterion would
instead be r ≤ 0 and s ≤ 0: positive coefficients give a solution, and two
nonpositive coefficients cannot represent 1. That total-function fact must not
be confused with the Hilbert-symbol domain.

## /4 — medium, confirmed, with a qualification to the repair

`T.4/transfer-base-change` allows arbitrary F′/F, but proof step 2 cites
`T.3/higher-ramification-formula`, which assumes a finite extension. Current
Lean lines 956 and 1516 reproduce this mismatch: the supplier has
`[FiniteDimensional F E]` and the consumer has no finite-dimensionality
assumption on F′. Taking F′ = F(u) already prevents that instantiation.
Exercises III.7.7–7.9, pp.265–266, and the packet's E10 confirm why restricting
the consumer back to finite extensions is not adequate for its completion use.

The proposed generalization is valid for normalized surjective valuations with
`ord_w|F = e · ord_v` and e > 0. For units the residue vanishes; writing a
uniformizer of v as a unit times an e-th power of a uniformizer of w gives the
factor e. The unit/uniformizer generators reduce the formula to these cases.
The pinned decomposition and residue-unit surjectivity statements do not need
a finite field extension. This supplies the proposed mathematical proof, not
a claim of Lean elaboration.

**Required repair and qualification:** generalize that supplier, update the
dependency/proof and add an infinite-extension or completion test. Keep e > 0
explicit throughout the induced residue-field map: current `residueFieldMap`
(line 448) does not take positivity and asserts localness under a `sorry`.
For e = 0, a nonunit of the first valuation ring can become a unit in the
second, so that localness does not follow. Propagate the positive-index
hypothesis through this helper when making the generalized comparison usable.

An arbitrary constant extension also introduces places whose restriction to
F(t) is trivial. For F = Q, F′ = Q(u), the finite place t − u is an example:
every nonzero polynomial over Q evaluates nontrivially at the transcendental
u, hence every element of Q(t)ˣ has order zero there. These places do not have
an e > 0 comparison with a discrete valuation of F(t). Prove their residues
vanish separately because every imported symbol entry is a valuation unit.
Use the generalized positive-index formula at the remaining finite places and
the index-one comparison at infinity. Merely deleting `FiniteDimensional`
does not finish the arbitrary-base-change proof. This is a qualification of
the same missing proof step, not a sixth finding or permission to replan
another roadmap.

## /5 — low, confirmed: two stale inverse comparisons

`T.4/projective-line-reciprocity`, proof step 3, and
`T.4/weil-reciprocity-symbol-form`, proof step 2, still describe the packet's
degree-two Milnor residue as the inverse of its tame symbol. But
`T.3/higher-milnor-residues` and current `milnorResidue_two` at line 869 use
the uniformizer-last convention and state equality. At Q's 5-adic valuation,
both send {2,5} to 2; inversion would give 3 in F₅ˣ.

The opposite convention genuinely belongs to Weibel's III.6.3 and III.7.3
(pp.242, 254), and is separately recorded by `milnorResidue_kbook`. I also
checked the reciprocity statements III.6.5.3 and III.7.5.1 (pp.244, 256).
Inverting every factor preserves a product-one statement, so this remains a
low-severity explanatory inconsistency rather than a counterexample to
reciprocity.

**Required repair:** use equality in the two internal comparisons, explicitly
label any comparison with Weibel's opposite convention, and retain the
Q-at-5 test distinguishing 2 and 3.

## Validation and handoff

- The finite-ring reproduction completed with the counts above.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-BP-K2SymbolsBrauer--T.3.review.json`: passed.
- Read-only `check_blueprint.py` on the target packet, using the pinned
  declaration index: 0 errors, 0 warnings. The packet remains partial with
  11 gaps, 29 requests and no closed stages.
- `research/blueprint/intake.py check-files` on the two deliverables: passed.
- `git diff --check`: passed.

Only the verification JSON and this report are changed. The suggested Lean
file was inspected, not edited or compiled; no existing build at both pinned
commits was available. Its earlier review's elaboration claim is not new
validation here. A follow-up fix should apply /1–/4 and may clean up /5 in the
same packet, reader document and suggested file, preserving the later
K-theory-area changes.
