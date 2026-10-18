# Design handoff: Diophantine approximation and transcendence, Part II

Issue #3465; agent Codex; session codex-AHlGTq; 18 October 2026.

This is a complete target-level planning pass, ready for independent review. It is not a checkpoint and makes no implementation claim. All 20 items routed from the CDT25 extraction are accounted for in the packet's `sourceItemCoverage`. The deliverables are the new roadmap definition, packet, full reader and compact suggested Lean file, together with this note.

## Coverage and ownership

There are 35 nodes: 4 definitions, 21 theorems, 6 lemmas, 2 comparisons, 1 construction and 1 application. Their definitions and construction carry 33 API targets and 20 unit tests. There are 23 planets, at most five per layer, and 20 baseline declaration references. Every node remains `unchecked`.

- AA.0, arithmetic germs and denominators: closed.
- AA.1, auxiliary functions and multiplier estimate: closed.
- AA.2, mean rank, algebraicity and Jensen proof: closed.
- AA.3, circular adapters and Vandermonde proof: closed.
- AA.4, arithmetic holonomic spans and corrected rank bounds: closed.
- AA.5, capacity: planned, with G1 remaining. The centred-disc/circle theorem and the arbitrary-compact counterexample have complete target-level plans.

Here closed means that target-level chains terminate in the pinned libraries or the exact cited supplier interfaces. Supplier acceptance does not claim implementation or resolve the suppliers' own gaps. No new requests, ownership moves or restructuring proposals are made.

The imports are the parent's DT.5 D-finite series, ConformalMappingPartII's O0/U0/L0 interfaces, PM.2's interval discrepancy inequalities, and LP.0–LP.1's general potential theory. Their exact node statements were read. The current upstream roadmaps and current Tau Ceti library were searched, including the nine roadmaps newer than the atlas snapshot. ConformalMapping, ModularForms and completed ContourIntegration provided upstream style and ownership checks. The parent package exists in the atlas; its directory was absent from the current upstream checkout, which is not evidence that its mathematics should be planned again.

## Mathematical points for the reviewer

The arithmetic coordinate χ and analytic uniformizer φ are distinct. Integral p∘χ does not imply integral χ. Every analytic pullback is a germ identity, never evaluation of a formal series outside its convergence disc. The reader specifies closed-disc neighbourhoods, Taylor factorials, Haar normalization, strict derivative threshold and all successive limits.

The auxiliary estimate uses the cofinal dimension range d≥d₁(κ). This makes the Siegel height constant uniform in d and κ: the integer constraint matrix includes dD log(max(1,sup|p|)), and dD/α is uniformly bounded on that range. This sufficient specialization supports all three proof routes. It is not a claim that the source's full auxiliary lemma is false.

The qualitative Eisenstein proof is closed by the elementary tail-series route in BB11 §1, p.1: truncate beyond the order of P_y(x,f), normalize to an implicit equation u+xR(x,u)=0, clear finitely many algebraic coefficients, and use integral coefficient induction. The constant coefficient requires its own scalar unless already integral. No unproved effective p-adic theorem is imported.

Two new source findings await independent review; neither has a self-review verdict:

1. **E1**, CDT25 Definition 2.0.4, p.635, and Corollary 2.0.5, (2.0.7), p.636. The source defines V over ℚ(x) but bounds it over ℚ(p). For p=x+x⁴/32, χ=p⁻¹ and φ=2z, V contains a degree-four extension while the asserted upper bound is smaller than four. The plan instead bounds W=span over ℚ(p) of H. It derives dim over ℚ(x) of V≤B and the degree-factor bound over ℚ(p). Integral χ gives W=V and restores the sharper version. Downstream modular applications must identify their span or verify integral χ; no conclusion about failure of the main modular theorem is drawn.
2. **E2**, CDT25 (2.5.28), p.649. For K=closedDisk(1/2,1/4) and φ(z)=8z exp(−20z), with p=x and χ=t, the proposed numerator is zero and its denominator is log2>0, although the rank is at least one. This is independent of E1. The centred case follows by rescaling; the unrestricted formula is not asserted.

The existing extraction's E15–E16 phase and logarithmic-supremum corrections are inherited through the corrected L0 quotient interface. Circular discrepancy against Haar is weakly continuous even at atomic limits; the finite-mesh argument and empirical diagonal term are explicit.

G1 requires an exact, source-supported arbitrary-compact replacement sensitive to the distinguished base point, with its dependency chain, or a maintainer decision to remove the false general target after independent review. Begin with AA.5/compact-counterexample and E2. Positive capacity and a positive printed denominator alone do not suffice. Resolving G1 is not needed for the centred theorem or qualitative holonomic finiteness.

## Sources and provenance

CDT25 was read in the published author offprint, with journal pagination: §§1.1.1–1.1.3, pp.629–631; §2, pp.634–649; and the application interface in §3, pp.649–651. The disputed definitions and formulas were checked on page images. BB11 was read in §§1 and 6 and the opening of §8; its stronger effective bounds are not targets. URLs, access dates and file hashes are in the packet and reader. The bounded correction search is recorded separately from mathematical reading. No applicable published correction was located; E1 and E2 remain unreviewed findings.

No missing source is needed for AA.0–AA.4. Bombieri–Gubler was not read; the public BB11 source replaces it for the qualitative denominator theorem. Modular λ–theta identities are source benchmark data at CDT25 (1.1.4)–(1.1.5), p.631, with their proofs left to the modular-functions owner. The elementary lacunary-series benchmark independently checks the strict threshold.

## Validation

The 250-line suggested Lean file elaborated through `lean-check` at the pinned Mathlib/Tau Ceti build. Its only warnings were 25 declarations using `sorry`. All data definitions have real bodies. Heavy holonomic and capacity carriers, full APIs and definition tests are reader targets, as required by the current WORKERS roadmap shape.

The blueprint checker reports zero errors and one explained index warning. The native theorem is `MeasureTheory.ProbabilityMeasure.continuous_prod`, in `Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean`, line 144. The supplied declaration index incorrectly retains `FiniteMeasure` after the source's `end FiniteMeasure -- namespace` at line 89. The packet uses the accurate short reference `ProbabilityMeasure.continuous_prod` and records the full native name and discrepancy. No nonexistent fully qualified declaration is cited.

The five deliverables pass intake file checks, the suggested file passes the data-body check, the embedded source findings pass their schema/provenance checks, and whitespace checks pass. The packet and reader were checked for statement, API, test and planet agreement. No generated script, PDF, extracted source text, scratch file or machine path is part of the submission.
