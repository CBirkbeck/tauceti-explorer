# RT-AREA-pde: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #3986, job FIX-RT-AREA-pde).
- Findings: `RT-AREA-pde.result.json`: 39 findings (6 high, 24 medium, 9 low), by `cc-39fac3` (three sub-teams: Lanes A–B, C–D, E–F).
- Verdicts: `RT-AREA-pde.review.json` and `research/blueprint/reviews/REV-RT-AREA-pde.md`, by `cc-d67081`. All 39 are confirmed.
- In scope: the 30 findings of high or medium severity that the issue lists (/1–/9, /11, /12, /17–/24, /26–/32, /34, /35, /37, /38). The nine low findings (/10, /13–/16, /25, /33, /36, /39) are out of scope and only noted at the end.
- Everything below was checked at origin/main `59da8e9a`.
  - The graph checks use the atlas as `scripts/build.py` assembles it at that commit (function `assemble`, run in scratch; 2840 stages, 7792 stage edges): accepted restructurings, promoted blueprints, decompositions, promoted link packets and new roadmaps included.
  - Every edge this report adds was tested for a reverse path in that graph, cumulatively (each edge is added to the graph before the next is tested). "Acyclic" means no path from the target back to the source.

## How to read this report

This report is the job's only deliverable, and the intake accepts no other file for it. Every finding concerns the Tau Ceti roadmap `PDE` (`content/tau-ceti/PDE/README.md`, atlas stages `tauceti:TauCetiRoadmap/PDE#…`), its accepted but unmerged library audit AUDIT-40, or its consumers. Under PROTOCOL.md section 15 the atlas never re-plans a Tau Ceti roadmap. So, as in the other area fixes (`RT-AREA-analysis.fixes.md`, `RT-AREA-diffgeom.fixes.md`), each fix is written as an exact edit for whoever owns the file:
- **Roadmap prose** (a note for the Tau Ceti maintainer): the old text is quoted, ignoring line wrapping, and the replacement is given in full. Each quotation occurs exactly once in its file (checked by script). The snapshot, the atlas stage descriptions and the extract `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_PDE.json` are regenerated from upstream; a generated extract alone is not the repair.
- **AUDIT-40** (`research/blueprint/audit/AUDIT-40.result.json`, still in `pendingReview` of `data/library-coverage.json`): the layer, the target, the field, old → new. PROTOCOL section 17: a fix to an audit is merged into the library audit by the orchestrator.
- **Stage edges**: link entries (source → target, confidence, a verbatim quote from each side with its locator) for the pending job `LINK-tauceti_TauCetiRoadmap_PDE`, through the link workflow and its review, never by editing the raw atlas. The pending HeegaardFloer and OptimalTransport link jobs list the cross-roadmap ones under `alreadyRecorded`. All 74 entries are in the table of section /26.
- **Roadmap-level prerequisites** of Tau Ceti roadmaps come from the `declarations` list in `scripts/snapshot/build_data.py`; the one needed (/11) is given as a tuple for that list.
- **Tau Ceti library docstrings**: a note for the library maintainers.
- No paper item or route changes, so no review verdict is needed anywhere.

The "When" column of the summary says when an edit takes effect:
- **now:** the Tau Ceti maintainer can apply the README edit upstream;
- **audit:** the orchestrator applies it when it merges AUDIT-40;
- **link:** it enters with `LINK-tauceti_TauCetiRoadmap_PDE` after that job's review;
- **snapshot:** a one-line addition to `scripts/snapshot/build_data.py`;
- **library:** a docstring change in Tau Ceti.

**The binding rule is the verifier's.** A confirmation authorizes only the corrected scope in the verifier's reason. REV-RT-AREA-pde settled the six high findings (/1, /4, /17, /27, /32, /37) and the two dependency findings (/11, /26) in mathematics. For the other medium findings it checked the evidence (all 53 file-and-line citations, all quotations) and left the mathematical judgement to the red team; it asks the fixer to "read each milestone before rewriting it". I have checked the mathematics of every fix below myself. Where a fix was incomplete or wrong in detail I say so and give the corrected text:
- /20: the formal adjoint was written in Hunter's index convention, which is the transpose of this README's.
- /26: four of the proposed edges are not dependencies and are replaced or dropped.
- /30: the article cited as "Bramanti–Zhu" is Bramanti–Toschi.
- /32: the right-hand side needs `f ∈ L^q`, `q > n/2`; `f ∈ L²` is not enough.
- /38: the generator of the `Lᵖ` heat semigroup is not `Δ` on `W^{2,p}` without item 21.
- /6: the boundary measure should use Mathlib's normalized `euclideanHausdorffMeasure`.
- /12: of the two owners the finding allows for VMO, I take PDE B.11 and give the reasons.

**Library checks.** Every declaration cited below was looked up in the pinned declaration index (Mathlib `082e2d3`, Tau Ceti `f790474`), and its statement was read at the cited file and line. Absence claims were re-tested over the whole Tau Ceti tree (case-insensitive `git grep`), not only the PDE directories.

**Other work touching these stages.**
- No packet, integrated decomposition or restructuring proposal (RS-*) mentions the PDE roadmap.
- Paper routes name PDE stages in four extractions, none as a supplier this report changes:
  - DEMARCO-MAVRAKI-YE-26, route 4, builds its pluripotential theory on "the harmonic and subharmonic functions and Perron's method of Tau Ceti PDE (TauCetiRoadmap/PDE), Lane C". This is a consumer of C.12–C.15, which /17, /18 and /22–/24 sharpen but do not remove.
  - BINDA-KATO-VEZZANI-25, BRUINIER-EHLEN-YANG-21 and BINYAMINI-22 list A.5 or D.19 only as keyword candidates.
- The OneParameterSemigroups link map (`research/blueprint/links/tauceti_TauCetiRoadmap_OneParameterSemigroups.json`, reviewed and promoted) already records two links into F.26 and recommends rescoping F.26 to concrete heat carriers (/37 and /38 follow it). Its red team, `RT-LINK-tauceti_TauCetiRoadmap_OneParameterSemigroups`, is pending.
- `RT-AREA-analysis.fixes.md` corrected OneParameterSemigroups' Hille–Yosida and Lumer–Phillips text. /37 and /38 cite the built theorems it names and are consistent with it.
- Pending jobs that will touch the same files:
  - `LINK-tauceti_TauCetiRoadmap_PDE`, `LINK-tauceti_TauCetiRoadmap_HeegaardFloer` and `LINK-tauceti_TauCetiRoadmap_OptimalTransport` (all pending), which carry the edges of /11, /12 and /26;
  - `ATT-PDE` (attribution), which will add sources to the PDE layers; the references of /32 and the Hunter locators used here are available to it.
- Nothing the findings cite has changed since the red team:
  - the PDE, OptimalTransport, HeegaardFloer and OneParameterSemigroups snapshots and AUDIT-40 have no commit after 24 September;
  - `content/tau-ceti/PDE/README.md` (SHA-256 `ed2de35c…`) is byte-identical to upstream `TauCetiRoadmap/PDE/README.md` (read 29 September 2026; last upstream change 5 July 2026).

**Disclosure.** This session did not write the red team, its verification, AUDIT-40 or any of the roadmaps. None of its earlier work (paper extractions and audit fixes) touches these findings.

## Summary

| # | Finding | Fix | When |
|---|---|---|---|
| /1 | high, error | Poincaré–Wirtinger split: bounded convex `Ω` with the explicit constant `(ω_n/\|Ω\|)^{1−1/n}(diam Ω)^n`, and bounded **connected** Lipschitz `Ω` by compactness; two-ball regression test. The side condition "bounded / finite measure / bounded in one direction" stays with `W^{1,p}_0`. Edges E7, E8. | now; audit; link |
| /2 | medium, error | `W^{1,p}(Ω)` forms of Morrey, GNS and Rellich get a Lipschitz-boundary hypothesis; the `W^{1,p}_0` forms hold on every open (Rellich: bounded) `Ω`; local Hölder continuity on any `Ω`. Three regression domains. Edge E9. | now; audit; link |
| /3 | medium, error | `1 ≤ p < ∞` on Meyers–Serrin, `W^{k,p}_0(ℝⁿ) = W^{k,p}(ℝⁿ)` and `ker(trace) = W^{1,p}_0`, with the three `p = ∞` counterexamples. | now; audit |
| /4 | high, error | B.10 builds the `L²` multiplier `T_m` (`m ∈ L^∞`, via `Lp.fourierTransformₗᵢ`) and proves Mihlin–Hörmander for it; Mathlib's `FourierMultiplier` is the zero operator on Mihlin symbols and is only a compatibility target. | now; audit |
| /5 | medium, error | The CZ theorem assumes `L²` boundedness; `\|x\|^{−n}` is the regression example. | now; audit |
| /6 | medium, missing | A.6 owns the boundary calculus: Lipschitz/`C^k` domains, `σ = μHE[n−1]⌊∂Ω` (Mathlib's normalized Euclidean Hausdorff measure), Gauss–Green, bi-Lipschitz invariance. Edges E20, E63. | now; audit; link |
| /7 | medium, missing | A.3 gets the four bridge nodes (complexification, weak = distributional derivative, tempered derivative on `ℝⁿ`, `μ = volume`). Edges E2, E12. | now; audit; link |
| /8 | medium, missing | A.7 owns the Campanato spaces and `L^{p,n+pα} ≅ C^{0,α}(Ω̄)` under the measure-density hypothesis; BMO endpoint from B.11. Edges E13, E44. | now; audit; link |
| /9 | medium, missing | A.7 adds `C^{k,α}_loc(Ω)` and the domain spaces `C^{k,α}(Ω̄)`, `k ≥ 1`. Edge E70. | now; audit; link |
| /11 | medium, missing | Eight consumer edges into HeegaardFloer F1 and OptimalTransport 5, 6B, 6C (E62–E70); PDE becomes a HeegaardFloer prerequisite. | link; snapshot |
| /12 | medium, duplicate | One VMO owner: PDE B.11 (the finding's permitted alternative). OT 6B builds only its section-local modulus on it. Edges E43, E69. | now; audit; link |
| /17 | high, error | The end-to-end check compares with the **Green's-function** solution, not the Newtonian potential (`(1−\|x\|²)/6` vs `(3−\|x\|²)/6`); library docstring corrected. | now; library; audit |
| /18 | medium, library-claim | C.15's audit target split: the kernel (`n ≥ 3`, built), `−ΔΦ₂ = δ₀` (absent), the Newtonian potential and Poisson's equation (absent); summary corrected. | audit |
| /19 | medium, missing | D.17 states the nonhomogeneous problem `u − w ∈ H¹_0`; D.17 and Lane D regraded "partly built". Edge E28. | now; audit; link |
| /20 | medium, missing | D.18 gets the Gårding packaging, the formal adjoint (index convention corrected), equal kernel dimensions and the solvability condition; regraded. | now; audit |
| /21 | medium, missing | D.19 gets the eigenvalue sequence `λ_k → ∞` with an `ℕ`-indexed basis, and the Sturm–Liouville example; regraded. | now; audit |
| /22 | medium, error | Strong maximum principle and Hopf lemma with `c ≥ 0` need a nonnegative maximum; `−cosh x₁` regression test. | now; audit |
| /23 | medium, error | C.13 split into classical non-divergence principles and the weak principle for `H¹` subsolutions; the strong principle for `W^{1,2}` subsolutions moves to E.23. Edges E21, E22. | now; audit; link |
| /24 | medium, duplicate | C.14 narrowed to harmonic Harnack from C.12; the divergence-form Harnack is E.23's; "feeds De Giorgi–Nash–Moser" deleted. Edge E17. | now; audit; link |
| /26 | medium, error | 74 link entries (59 internal to PDE, 15 cross-roadmap), all acyclic; four proposed edges corrected; "How to drive it" and the B.9 audit note qualified. | link; now; audit |
| /27 | high, error | E.20's interior `H²` theorem requires Lipschitz `aⁱʲ`; a `C¹`/Lipschitz tier is added to the coefficient dial; the 1-D two-phase counterexample becomes an acceptance test. | now; audit |
| /28 | medium, missing | A.1 owns the difference-quotient characterization, A.4 the local `W^{k,p} ⊂ C^m`; post-pin Tau Ceti PRs noted. Edges E37, E38. | now; audit; link |
| /29 | medium, missing | E.20 gets the boundary `H²`/`H^{k+2}` theorems; E.21 is stated interior-only and the inventory says so. Edge E39. | now; audit; link |
| /30 | medium, missing | Variable-kernel CZ operators in B.10, the Coifman–Rochberg–Weiss commutator in B.11, VMO from B.11; E.21 lists them. | now; audit |
| /31 | medium, error | E.22 split into (a)–(e): non-divergence `C^{2,α}`, divergence `C^{1,α}` (1-D counterexample), global estimate, method of continuity, classical solvability with `c ≥ 0`. Edges E44, E45, E71. | now; audit; link |
| /32 | high, error | E.23 becomes a vendoring target for Armstrong–Kempe (arXiv:2604.05984, `scottnarmstrong/DeGiorgi` at `4c1b3077`), with five nodes; right-hand side `f ∈ L^q`, `q > n/2` (corrected). | now; audit |
| /34 | medium, library-claim | `L²(0,T;V)` is Mathlib's `Lp`; `H¹(0,T;V*)` uses `TauCeti.HasWeakLineDerivOn` with `F = StrongDual ℝ V`; "Bochner spaces" leaves the build list. Edge E52. | now; audit; link |
| /35 | medium, missing | F.25 gets the linear Carathéodory ODE node (Hunter Prop. 6.5), Hunter's Assumption 6.1, the solution concept, and a hypothesized parabolic maximum principle. | now; audit |
| /37 | high, duplicate | F.26 imports the built OneParameterSemigroups theory; "Hille–Yosida" leaves the build list. Edges E60, E61 (two more already recorded). | now; link |
| /38 | medium, missing | F.26 builds the form operator, the Dirichlet heat semigroup, the Gaussian semigroup on `Lᵖ` (generator corrected), smoothing estimates and agreement with F.25. Edges E57–E59. | now; audit; link |

## Coordination between the edits

Several findings edit the same README item. Each merged replacement is given once, in the section named here; the other sections refer to it.
- **Lane A.4:** /2 and /28. Merged text in /2.
- **Lane A.6:** /2, /3, /6 and /29. Merged text in /6.
- **Lane A.7:** /8 and /9. Merged text in /8.
- **Lane B.10:** /4, /5 and /30. Merged text in /4.
- **Lane B.11:** /12 and /30. Merged text in /12.
- **Lane C.13 and the maximum-principle bullet:** /22 and /23. Merged text in /22.
- **Lane E.20:** /27, /28 and /29. Merged text in /27.
- **Lane E.21:** /29, /30 and /31. Merged text in /30.
- **Lane E.22:** /8 and /31. Merged text in /31.
- **Lane E.23:** /23, /24 and /32. Merged text in /32.
- **Lane F.26 and the parabolic inventory line:** /34, /37 and /38. Merged text in /38 (item) and /34 (inventory).
- **Acceptance criteria:** /1, /3, /17, /22 and /27 each change one bullet; the bullets are independent.

Apply the prose edits before the link job quotes them. The link entries of /26 quote the README as it is now, and their quotes are chosen from sentences these edits keep. The one exception is E69, whose OptimalTransport quote the /12 edit keeps verbatim.

## /1 (high, error): Poincaré–Wirtinger needs connectedness and boundary regularity

### What the verifier corrected
- **Connectedness is essential.** On two disjoint balls, a bounded open set, take `u` equal to different constants on the two components with mean zero. Then `∇u = 0` and `u ≠ 0`, so no `‖u‖ ≤ C‖∇u‖` holds.
- **High severity is right:** the statement is false as written, and the roadmap would build it.
- Everything else is the red team's: the convex route with an explicit constant, the Lipschitz route by compactness, and the regression test.

### What main says now
- README, "Getting the statements right", lines 94–97: "`‖u‖ ≤ C‖∇u‖` holds on `W^{1,p}_0(Ω)` (zero trace) or modulo constants (Poincaré–Wirtinger, zero mean), for `Ω` bounded (or of finite measure, or bounded in one direction)."
- README, A.5, lines 230–231: "**Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean), with explicit constant dependence."
- AUDIT-40, `PDE#milestone-a-5`, target "Poincaré–Wirtinger inequality (zero mean) with explicit constant dependence", library `partial`.

### Checked
- `TauCeti.enorm_sub_setAverage_le_of_convex` (`TauCeti/Analysis/Sobolev/Poincare/Potential.lean:257`) is Gilbarg–Trudinger Lemma 7.16. It assumes `IsOpen Ω`, `Convex ℝ Ω`, `Bornology.IsBounded Ω`, `ContDiffOn ℝ 1 u Ω`, `x ∈ Ω`, `S ⊆ Ω`. It bounds `‖u x − ⨍_S u‖` by `(diam Ω)^n/(n μ S)` times the Riesz potential of `‖Du‖`. `Poincare/W1p0.lean:20` says "Poincaré--Wirtinger is not proved here."
- **The explicit constant.** Take `S = Ω` and bound the Riesz potential in `Lᵖ` by Schur's test. For every `x`, `∫_Ω |x−y|^{1−n} dy ≤ ∫_{B(x,R)} |x−y|^{1−n} dy = n ω_n R` with `ω_n R^n = |Ω|`, that is `n ω_n^{1−1/n} |Ω|^{1/n}`. Hence, for `1 ≤ p < ∞`,
  `‖u − ⨍_Ω u‖_{Lᵖ(Ω)} ≤ (ω_n/|Ω|)^{1−1/n} (diam Ω)^n ‖∇u‖_{Lᵖ(Ω)}`.
  This is the classical bound (Gilbarg–Trudinger (7.45), cited, not read).
- **Passing to `W^{1,p}(Ω)`.** The lemma is for `C¹(Ω)` functions, so the passage uses the density of `C^∞(Ω) ∩ W^{1,p}(Ω)` (Meyers–Serrin, A.2, `p < ∞`) and an a.e.-convergent subsequence. That is edge E7.
- **The Lipschitz case.** The usual proof is by contradiction through the compact embedding `W^{1,p}(Ω) ↪↪ Lᵖ(Ω)` of a bounded Lipschitz domain (A.6, edge E8). Connectedness enters when `∇u = 0` forces `u` to be constant.
- **The `W_0` side condition is right as stated.** Tau Ceti proves the slab form with constant `b − a` (`Poincare/W1p0.lean:92`) and the counterexample on `ℝⁿ` (`Poincare/WholeSpace.lean:106`). The finite-measure form holds by symmetrization and is not built.

### The fix

**Note for the Tau Ceti maintainer, README.**
1. "Getting the statements right", lines 94–97. Replace the bullet
   > - **Carry Poincaré's normalization.** `‖u‖ ≤ C‖∇u‖` holds on `W^{1,p}_0(Ω)` (zero trace) or modulo constants (Poincaré–Wirtinger, zero mean), for `Ω` bounded (or of finite measure, or bounded in one direction). State that side condition explicitly; it is the load-bearing hypothesis (the inequality fails outright on `ℝⁿ`).

   with
   > - **Carry Poincaré's normalization.** There are two inequalities, with different side conditions.
   >   - On `W^{1,p}_0(Ω)` (zero trace), `‖u‖_p ≤ C‖∇u‖_p` holds for `Ω` bounded, or of finite measure, or bounded in one direction. It fails outright on `ℝⁿ`.
   >   - Modulo constants (Poincaré–Wirtinger, `‖u − ⨍_Ω u‖_p ≤ C‖∇u‖_p` on `W^{1,p}(Ω)`, `1 ≤ p < ∞`), `Ω` must be **connected** and regular. It holds for a bounded convex `Ω` with `C = (ω_n/|Ω|)^{1−1/n}(diam Ω)^n`, and for a bounded connected Lipschitz domain with a constant `C(Ω, p)` from compactness. It fails on two disjoint balls, a bounded open set.
   >
   >   State each side condition explicitly; they are the load-bearing hypotheses.
2. Lane A, item 5, lines 230–231. Replace
   > 5. **Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean), with explicit constant dependence.

   with
   > 5. **Poincaré** on `W^{1,p}_0(Ω)` (`Ω` bounded, or bounded in one direction), with explicit constant (built). **Poincaré–Wirtinger** (zero mean) on `W^{1,p}(Ω)`, `1 ≤ p < ∞`:
   >    - for bounded convex `Ω`, with the explicit constant `(ω_n/|Ω|)^{1−1/n}(diam Ω)^n`: Gilbarg–Trudinger Lemma 7.16 (built: `TauCeti.enorm_sub_setAverage_le_of_convex`), Schur's bound for the Riesz potential, and density (item 2);
   >    - for bounded **connected** Lipschitz `Ω`, with a constant `C(Ω, p)`, by compactness (item 6).
   >
   >    ⚠ Connectedness is load-bearing: on two disjoint balls, a function equal to different constants on the two balls, with mean zero, has zero gradient.
3. Acceptance criteria, lines 345–347. After "Formalize both directions so the hypothesis is known to be load-bearing." add
   > Likewise Poincaré–Wirtinger: finite on a ball, and false on two disjoint balls.

**AUDIT-40, layer `PDE#milestone-a-5`.** Replace the target "Poincaré–Wirtinger inequality (zero mean) with explicit constant dependence" by two targets:
- (a) "Poincaré–Wirtinger on a bounded convex open `Ω`, `1 ≤ p < ∞`, with constant `(ω_n/|Ω|)^{1−1/n}(diam Ω)^n`": library `partial`.
  - Declarations: `TauCeti.enorm_sub_setAverage_le_of_convex` (`Poincare/Potential.lean:257`, fit related), plus the two starConvex lemmas already cited.
  - Note: "the pointwise potential estimate is built for `C¹(Ω)` functions; the `Lᵖ` (Schur) bound for the Riesz potential and the passage to `W^{1,p}(Ω)` by density are not."
- (b) "Poincaré–Wirtinger on a bounded connected Lipschitz domain, with a constant `C(Ω,p)`": library `absent`.
  - Note: "needs Rellich for `W^{1,p}(Ω)` (layer a-6), itself absent. Connectedness is necessary (two disjoint balls)."

Layer `PDE#lane-a-…`, target "Poincaré and Poincaré–Wirtinger (item 5)", note: add "Poincaré–Wirtinger needs `Ω` connected." The layer verdicts are unchanged.

**Edges.** E7 (A.2 → A.5) and E8 (A.6 → A.5), in the table of /26.

## /2 (medium, error): the embeddings of `W^{1,p}(Ω)` need boundary regularity

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
I checked the three counterexamples.
- **Morrey.** The indicator of one of two disjoint balls lies in `W^{1,p}` with zero gradient. Points `(∓ε, 0)` are `2ε` apart with values differing by `1`, so the indicator is not uniformly Hölder.
- **Rellich.** Take disjoint balls `B_k` in the unit ball. The functions `|B_k|^{−1/p} 𝟙_{B_k}` have norm `1` and are pairwise `2^{1/p}` apart.
- **GNS.** Take `u = Σ c_k 𝟙_{B_k}` with `c_k^p |B_k| = k^{−2}`. Then `‖u‖_p^p = Σ k^{−2} < ∞`, but `Σ c_k^{p*}|B_k| = Σ k^{−2p*/p} |B_k|^{1 − p*/p} = ∞`, because `1 − p*/p < 0` and `|B_k|` decays geometrically.

The `W^{1,p}_0` forms hold on every open `Ω` after extension by zero (`TauCeti.W1p0.extendByZeroL`, `W1p/Extension.lean:220`). Rellich needs `Ω` bounded (`TauCeti.W1p0.isCompactOperator_valueL`, `RellichKondrachov.lean:141`: `hp : p ≠ ∞`, `IsBounded Ω`, "No boundary regularity is assumed"). The Tau Ceti headers already say that the `W^{1,p}(Ω)` forms need an extension operator (`RellichKondrachov.lean:30–31`, `CompactSupport.lean:32–33`).

### What main says now
- README lines 57–59: "*Trace*, *extension*, and *Rellich–Kondrachov* additionally need boundary regularity (Lipschitz, or `C¹`, or the cone/segment condition)." Morrey and GNS are not in this list.
- README lines 105–107: "**Rellich–Kondrachov**: `W^{1,p}(Ω) ↪↪ L^p(Ω)` is compact for bounded `Ω`".
- A.4 (lines 227–229) and A.6 (lines 232–236) are quoted below.
- AUDIT-40 copies the Morrey and Rellich targets verbatim.

### The fix

**Note for the Tau Ceti maintainer, README.**
1. "Standing hypotheses", lines 57–60. Replace
   > Most of the theory needs a bounded open `Ω`. *Trace*, *extension*, and *Rellich–Kondrachov* additionally need boundary regularity (Lipschitz, or `C¹`, or the cone/segment condition).

   with
   > Most of the theory needs a bounded open `Ω`. *Trace*, *extension*, and, on the full space `W^{1,p}(Ω)`, *Rellich–Kondrachov*, *Morrey* and *Gagliardo–Nirenberg–Sobolev* additionally need boundary regularity (Lipschitz, or `C¹`, or the cone/segment condition). On `W^{1,p}_0(Ω)`, extension by zero gives GNS and Morrey on every open `Ω` and Rellich on every bounded `Ω`, with no boundary hypothesis.
2. "Getting the statements right", lines 103–107. Replace
   > Norm compactness comes from one place, **Rellich–Kondrachov**: `W^{1,p}(Ω) ↪↪ L^p(Ω)` is compact for bounded `Ω`, the embedding that powers the Fredholm alternative and the eigenvalue expansions.

   with
   > Norm compactness comes from one place, **Rellich–Kondrachov**: `W^{1,p}_0(Ω) ↪↪ L^p(Ω)` is compact for every bounded `Ω` (`1 ≤ p < ∞`), the embedding that powers the Fredholm alternative and the eigenvalue expansions. The same holds for `W^{1,p}(Ω)` when `Ω` is also a Lipschitz domain. It fails for a bounded `Ω` made of infinitely many disjoint balls.
3. Lane A, item 4, lines 227–229 (merged with /28). Replace
   > 4. **Embeddings.** *Consume* Gagliardo–Nirenberg–Sobolev for `p<n`; **build** the Morrey embedding `W^{1,p}(Ω) ↪ C^{0,1−n/p}(Ω)` for `p>n`, and state (then prove) the borderline `p=n`.

   with
   > 4. **Embeddings.** Keep `W^{1,p}_0(Ω)` and `W^{1,p}(Ω)` apart.
   >    - *`W^{1,p}_0(Ω)`, any open `Ω`* (extension by zero, `TauCeti.W1p0.extendByZeroL`). *Consume* Gagliardo–Nirenberg–Sobolev for `p<n` (built: `TauCeti.W1p0.sobolevEmbeddingL`). **Build** Morrey for `p>n`: every `u` has a representative with `[u]_{C^{0,1−n/p}} ≤ C(n,p)‖∇u‖_p`.
   >    - *`W^{1,p}(Ω)`, `Ω` bounded with Lipschitz boundary.* GNS `W^{1,p}(Ω) ↪ L^{p*}(Ω)` and Morrey `W^{1,p}(Ω) ↪ C^{0,1−n/p}(Ω̄)`, through item 6's extension operator.
   >    - *`W^{1,p}(Ω)`, any open `Ω`.* Local Hölder continuity: `u ∈ C^{0,1−n/p}_loc(Ω)` for `p>n`. Iterating on derivatives with cutoffs, `W^{k,p}_loc(Ω) ⊂ C^m(Ω)` when `k − n/p > m`; this is the embedding the `C^∞` bootstrap of item 20 needs.
   >    - State (then prove) the borderline `p=n` (BMO, item 11).
   >
   >    ⚠ Without boundary regularity the `W^{1,p}(Ω)` forms fail even for bounded `Ω`:
   >    - on two disjoint balls, the indicator of one ball has zero gradient and is not uniformly Hölder;
   >    - on infinitely many disjoint balls `B_k` in the unit ball, `Σ c_k 𝟙_{B_k}` with `c_k^p|B_k| = k^{−2}` lies in `W^{1,p}` and not in `L^{p*}`.
4. Lane A, item 6: see the merged text in /6.

**AUDIT-40.**
- **Layer `PDE#milestone-a-4`.** Replace the target "Morrey embedding `W^{1,p}(Ω) ↪ C^{0,1−n/p}(Ω)` for `p > n`" (absent) by three targets, all `absent`:
  - (a) "Morrey on `W^{1,p}_0(Ω)`, any open `Ω`, `p > n`": note "whole-space Morrey composed with `TauCeti.W1p0.extendByZeroL` (`W1p/Extension.lean:220`)".
  - (b) "Morrey `W^{1,p}(Ω) → C^{0,1−n/p}(Ω̄)` for bounded Lipschitz `Ω`": note "needs the extension operator of layer a-6".
  - (c) "Local Hölder continuity of `W^{1,p}(Ω)`, any open `Ω`, `p > n`".
- **Same layer, new target.** "GNS `W^{1,p}(Ω) ↪ L^{p*}(Ω)` for bounded Lipschitz `Ω`": `absent`, note "fails without boundary regularity (infinitely many disjoint balls)".
- **Layer `PDE#milestone-a-6`.** The target "Rellich–Kondrachov: `W^{1,p}(Ω) ↪↪ L^p(Ω)` compact for bounded `Ω`" becomes "Rellich–Kondrachov: `W^{1,p}_0(Ω) ↪↪ Lᵖ(Ω)` for bounded `Ω`, and `W^{1,p}(Ω) ↪↪ Lᵖ(Ω)` for bounded Lipschitz `Ω`". Library, declarations and note are unchanged.
- **Layer `PDE#lane-a-…`.** The notes of items 4 and 6 name the same split.

**Regression tests**, recorded in the A.4 and A.6 text above: the two-ball domain, and the domain of infinitely many disjoint balls.

**Edge.** E9 (A.6 → A.4).

## /3 (medium, error): Meyers–Serrin, `W_0 = W` on `ℝⁿ` and `ker(trace) = W_0` need `p < ∞`

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
I checked the three counterexamples.
- **(a) Meyers–Serrin.** `|x|` on `(−1,1)`: a smooth `v` with `‖u′ − v′‖_∞ < 1/2` would need `v′ > 1/2` on `(0,1)` and `v′ < −1/2` on `(−1,0)`, which contradicts continuity of `v′` at `0`.
- **(b) `W_0 = W` on `ℝⁿ`.** Every test function `φ` has `‖1 − φ‖_∞ ≥ 1`.
- **(c) `ker(trace) = W_0`.** A `W^{1,∞}`-limit of test functions on `(0,1)` has a continuous derivative vanishing at `0` and `1`, which `u = x(1−x)` does not; yet `u` has zero boundary values.

`Wkp` admits `p = ∞` (`TauCeti/Analysis/Sobolev/Wkp/Basic.lean:76`: `{p : ENNReal} [Fact (1 <= p)]`). `TauCeti.w1p0Submodule_top_eq_top` (`W1p/Density.lean:293`) has `hp : p ≠ ∞`, and its docstring gives example (b).

### What main says now
README A.2, lines 220–223: "gives `C^∞ ∩ W^{k,p}` dense (**Meyers–Serrin**, `H = W`) … `W^{k,p}_0 = W^{k,p}` for `Ω = ℝⁿ` but **not** for bounded `Ω`." A.6: "with `ker = W^{1,p}_0` (Lipschitz `∂Ω`)". Acceptance, line 344: "`ker(trace) = W^{1,p}_0` (Lane A.6)".

### The fix

**Note for the Tau Ceti maintainer, README.**
1. Lane A, item 2, lines 220–223. Replace
   > 2. **Density and `W^{k,p}_0`.** Mollification (consume `BumpFunction/Convolution`) gives `C^∞ ∩ W^{k,p}` dense (**Meyers–Serrin**, `H = W`); define `W^{k,p}_0(Ω)` as the `C_c^∞(Ω)`-closure. ⚠ `H = W` needs no boundary regularity; `W^{k,p}_0 = W^{k,p}` for `Ω = ℝⁿ` but **not** for bounded `Ω`.

   with
   > 2. **Density and `W^{k,p}_0`.** Mollification (consume `BumpFunction/Convolution`) gives `C^∞(Ω) ∩ W^{k,p}(Ω)` dense in `W^{k,p}(Ω)` for `1 ≤ p < ∞` (**Meyers–Serrin**, `H = W`); define `W^{k,p}_0(Ω)` as the `C_c^∞(Ω)`-closure. ⚠ `H = W` needs no boundary regularity. `W^{k,p}_0 = W^{k,p}` for `Ω = ℝⁿ` and `1 ≤ p < ∞` (built for `k = 1`: `TauCeti.w1p0Submodule_top_eq_top`), but **not** for bounded `Ω`. ⚠ Both fail at `p = ∞`: `|x|` on `(−1,1)` is not a `W^{1,∞}`-limit of smooth functions, and the constant `1` on `ℝⁿ` is not a `W^{1,∞}`-limit of test functions.
2. Lane A, item 6: `ker = W^{1,p}_0` for `1 ≤ p < ∞`, with the example `x(1−x)` on `(0,1)`. This is in the merged text of /6.
3. Acceptance criteria, lines 343–344. Replace "`ker(trace) = W^{1,p}_0` (Lane A.6)." with "`ker(trace) = W^{1,p}_0` for `1 ≤ p < ∞` (Lane A.6)."

**AUDIT-40.**
- **Layer `PDE#milestone-a-2`.** The target "Meyers–Serrin `H = W`: `C^∞ ∩ W^{k,p}(Ω)` is dense in `W^{k,p}(Ω)` for an arbitrary open `Ω`" gains "`1 ≤ p < ∞`". Its note gains: "`W^{k,p}_0(ℝⁿ) = W^{k,p}(ℝⁿ)` is proved only for `k = 1` (`w1p0Submodule_top_eq_top`, `hp : p ≠ ∞`). All three statements fail at `p = ∞` (`|x|` on `(−1,1)`; the constant `1` on `ℝⁿ`)."
- **Layer `PDE#milestone-a-6`.** The target "`ker(trace) = W^{1,p}_0(Ω)`" becomes "`ker(trace) = W^{1,p}_0(Ω)`, `1 ≤ p < ∞`". Its note gains: "false at `p = ∞`: `x(1−x)` on `(0,1)`".

## /4 (high, error): Mihlin–Hörmander cannot consume Mathlib's `FourierMultiplier`

### What the verifier corrected
- **The verifier settled this one in the Mathlib source.** At the pin, `SchwartzMap.fourierMultiplierCLM` is `𝓕⁻¹ ∘ smulLeftCLM ∘ 𝓕`, and `SchwartzMap.smulLeftCLM` is `if hg : g.HasTemperateGrowth then … else 0`.
- **So the multiplier vanishes on the Mihlin symbols.** `HasTemperateGrowth` requires smoothness. The Mihlin symbols (`ξⱼ/|ξ|`, `|ξ|^{iτ}`) are singular at `0`, so for them the multiplier is the zero operator, and a theorem proved through it would be vacuous.
- **High severity is right.**

### Read at the pin
- `SchwartzMap.smulLeftCLM` (`Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:737–740`): `if hg : g.HasTemperateGrowth then SchwartzMap.bilinLeftCLM (ContinuousLinearMap.lsmul 𝕜 𝕜).flip hg else 0`.
- `Function.HasTemperateGrowth` (`Mathlib/Analysis/Distribution/TemperateGrowth.lean:40`): `ContDiff ℝ ∞ f ∧ ∀ n, ∃ k C, ∀ x, ‖iteratedFDeriv ℝ n f x‖ ≤ C * (1 + ‖x‖) ^ k`.
- `SchwartzMap.fourierMultiplierCLM` (`Mathlib/Analysis/Distribution/FourierMultiplier.lean:50`) and `TemperedDistribution.fourierMultiplierCLM` (`:143`), which goes through `TemperedDistribution.smulLeftCLM` (`TemperedDistribution.lean:248`).
- `MeasureTheory.Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean:52`): the `L²` Fourier transform as a linear isometric equivalence.

### What main says now
README B.10, lines 250–255: "the **Mihlin–Hörmander multiplier theorem** (consume Mathlib's `FourierMultiplier`)". AUDIT-40, `PDE#milestone-b-10`, target "The Mihlin–Hörmander multiplier theorem": `absent`, citing `SchwartzMap.fourierMultiplierCLM` as `related`, with the note "Mathlib has the `FourierMultiplier` machinery the layer says to consume".

### The fix

**Note for the Tau Ceti maintainer, README Lane B, item 10, lines 250–255** (merged with /5 and /30). Replace
> 10. **Calderón–Zygmund.** The **CZ decomposition** of an `L¹` function at height `t`; the **CZ singular integral operators** (standard kernel bounds) bounded on `Lᵖ`, `1<p<∞`, and weak-`(1,1)`; the **Mihlin–Hörmander multiplier theorem** (consume Mathlib's `FourierMultiplier`). ⚠ A CZ operator is **not** bounded on `L¹` or `L^∞`; the endpoints are weak-`(1,1)` and `L^∞ → BMO`, and stating an `L¹`/`L^∞` bound is the classic error.

with
> 10. **Calderón–Zygmund.**
>     - The **CZ decomposition** of an `L¹` function at height `t`.
>     - **The CZ theorem.** A linear operator `T` **bounded on `L²(ℝⁿ)`** whose kernel satisfies the size bound `|K(x,y)| ≤ A|x−y|^{−n}` and the Hörmander (or standard smoothness) condition is weak-`(1,1)` and bounded on `Lᵖ`, `1<p<∞`. The constants depend on `n`, `A` and `‖T‖_{L²→L²}`.
>       - ⚠ The kernel bounds alone are not enough. `K(x) = |x|^{−n}` satisfies both, and its truncations applied to `𝟙_{B(0,2)}` are at least `σ_{n−1} log(1/ε)` on `B(0,1)`.
>       - The `L²` bounds of the concrete operators are separate nodes: the Riesz transforms and `∂ᵢ∂ⱼΔ^{−1}` through the `L²` multipliers below, and homogeneous kernels `Ω(x/|x|)/|x|ⁿ` with `Ω` of mean zero on the sphere.
>     - **`L²` Fourier multipliers.** For `m ∈ L^∞(ℝⁿ; ℂ)`, `T_m f = 𝓕^{−1}(m · 𝓕f)`, defined through `MeasureTheory.Lp.fourierTransformₗᵢ`, with `‖T_m‖_{L²→L²} = ‖m‖_∞`. Prove that it agrees with Mathlib's `SchwartzMap.fourierMultiplierCLM` on `𝓢` when `m` has temperate growth.
>     - **The Mihlin–Hörmander multiplier theorem** for these `T_m`. If `m ∈ C^{⌊n/2⌋+1}(ℝⁿ∖{0})` and `|∂^α m(ξ)| ≤ A|ξ|^{−|α|}` for `|α| ≤ ⌊n/2⌋+1`, then `T_m` extends from `L² ∩ Lᵖ` to a bounded operator on `Lᵖ`, `1<p<∞`. Name the Riesz transforms (symbols multiples of `ξⱼ/|ξ|`) and `∂ᵢ∂ⱼΔ^{−1}` (symbol `ξᵢξⱼ/|ξ|²`) as examples.
>       - ⚠ Do **not** build it on Mathlib's `FourierMultiplier`. `SchwartzMap.smulLeftCLM g` is defined to be `0` unless `g` has temperate growth, so for the Mihlin symbols, which are singular at `ξ = 0`, Mathlib's multiplier is the zero operator. A Mihlin multiplier does not preserve `𝓢` in any case.
>     - **CZ operators with variable kernels** `K(x, z)`: homogeneous of degree `−n` in `z`, of mean zero on the unit sphere in `z` for each `x`, and smooth in `z` uniformly in `x`. These carry the Chiarenza–Frasca–Longo representation of `D²u` for item 21's VMO case.
>
>     ⚠ A CZ operator is **not** bounded on `L¹` or `L^∞`; the endpoints are weak-`(1,1)` and `L^∞ → BMO`, and stating an `L¹`/`L^∞` bound is the classic error.

The "Inventory: what Mathlib master gives us" line 127 lists `FourierMultiplier` among the distribution files. It stays, since the file exists; the B.10 text now says what it can and cannot be used for.

**AUDIT-40, layer `PDE#milestone-b-10`.**
- **Target "The Mihlin–Hörmander multiplier theorem".** The note becomes: "Absent. Mathlib's `SchwartzMap.fourierMultiplierCLM` (`FourierMultiplier.lean:50`) is `𝓕⁻¹ ∘ smulLeftCLM g ∘ 𝓕`, and `smulLeftCLM g` is `0` unless `g` has temperate growth (`SchwartzSpace/Basic.lean:737–740`). It is therefore the zero operator for the non-smooth Mihlin symbols, and serves only as the compatibility target for smooth symbols. The `L²` multiplier `T_m`, `m ∈ L^∞`, must be built from `MeasureTheory.Lp.fourierTransformₗᵢ` (`Fourier/LpSpace.lean:52`)." Add `MeasureTheory.Lp.fourierTransformₗᵢ` (fit related).
- **New target.** "The `L²` Fourier multiplier `T_m` for `m ∈ L^∞`, with `‖T_m‖ = ‖m‖_∞`": `absent`.

## /5 (medium, error): the CZ theorem needs the `L²` bound

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The counterexample.** `K = |x|^{−n}` has `|∇K| ≤ n|x|^{−n−1}`. For `|x| < 1`, `T_ε 𝟙_{B(0,2)}(x) ≥ ∫_{ε<|y|<1} |y|^{−n} dy = σ_{n−1} log(1/ε)`, so no principal value exists.
- **The standard theorem assumes `T` bounded on `L²`.** The Carleson project's weak-`(1,1)` theorem does too (`czOperator_weak_1_1`, with hypothesis `hT : HasBoundedStrongType (czOperator K r) 2 2 …`, as the red team read it at Carleson commit `d966776f`; not re-read here).

### What main says now
B.10: "the **CZ singular integral operators** (standard kernel bounds) bounded on `Lᵖ`, `1<p<∞`, and weak-`(1,1)`". AUDIT-40 B.10 target "Calderón–Zygmund singular integral operators with standard kernel bounds, bounded on `Lᵖ` for `1 < p < ∞` and weak-`(1,1)`".

### The fix
- **README:** in the merged B.10 text of /4 (the CZ theorem, its hypothesis and the `|x|^{−n}` regression example).
- **AUDIT-40, layer `PDE#milestone-b-10`:** the target becomes "Calderón–Zygmund theorem: an operator bounded on `L²(ℝⁿ)` whose kernel satisfies the size and Hörmander conditions is weak-`(1,1)` and bounded on `Lᵖ`, `1 < p < ∞`". It stays `absent`. Its note adds: "the `L²` hypothesis is load-bearing (`|x|^{−n}`); the `L²` bounds of concrete operators are separate targets".

## /6 (medium, missing): the boundary calculus that trace, extension and Green's functions need

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **Mathlib's divergence theorem is for boxes only.** `Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean:17–18` and the Henstock–Kurzweil version in `Mathlib/Analysis/BoxIntegral/DivergenceTheorem.lean`. No Lipschitz-domain notion exists in either library.
- **The area formula is missing too.** Mathlib has the equidimensional change of variables (`lintegral_image_eq_lintegral_abs_det_fderiv_mul`, `Mathlib/MeasureTheory/Function/Jacobian.lean`), but no codimension-one area formula for graphs. Tau Ceti's "area formula" (`TauCeti/Analysis/Complex/Conformal/Area.lean`) is for holomorphic maps of the plane.
- **Tau Ceti has no Lipschitz domain, Gauss–Green or boundary measure.** The whole-tree searches for "lipschitz domain", "gauss.green" and "divergence theorem" find only the prose at `Sobolev/CompactSupport.lean:33`. The only surface measure used is Mathlib's `volume.toSphere` for spheres (`PDE/FundamentalSolution/Euclidean/Flux.lean:22`).
- **A library claim the red team missed.** The boundary measure should not be the raw `μH[n−1]`.
  - Mathlib's `μH[d]` is the unnormalized Hausdorff measure (covers weighted by `diam^d`). On `EuclideanSpace ℝ (Fin n)`, `n ≥ 2`, `μH[n]` is a constant multiple of Lebesgue measure, not Lebesgue measure itself.
  - Mathlib has the normalized version `MeasureTheory.Measure.euclideanHausdorffMeasure`, notation `μHE[d]` (`Mathlib/Geometry/Euclidean/Volume/Measure.lean:65`). It agrees with `volume` in full dimension (`EuclideanSpace.euclideanHausdorffMeasure_eq_volume`, `:184`; `InnerProductSpace.euclideanHausdorffMeasure_eq_volume`, `:188`) and is preserved by affine-subspace inclusion (`AffineSubspace.euclideanHausdorffMeasure_coe_image`, `:221`).
  - So `σ := μHE[n−1]` restricted to `∂Ω` is the surface measure whose graph formula is `√(1+|∇γ|²) dx′`.
- **Owner.** The finding lets the maintainer choose between A.6 and a new "Part II" roadmap.
  - I take A.6. The README's standing hypotheses already name Lipschitz and `C¹` boundaries, and A.6's trace needs all four pieces first.
  - /29 also sends `C^k` domains, flattening and partitions of unity to A.6.
  - A new roadmap would be a separate proposal (PROTOCOL section 7), not a fix.
- **Consumers.**
  - C.15's Green's representation on the ball and half-space uses Gauss–Green (edge E20).
  - HeegaardFloer F1.1's trace uses the trace operator (E63).
  - C.13 does not need the boundary calculus: its Hopf lemma needs only an interior ball at the boundary point, and Tau Ceti's is stated on balls (`HopfLemma.lean:129`). So I add no A.6 → C.13 edge, although the finding names C.13.

### What main says now
A.6, lines 232–236: "The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with `ker = W^{1,p}_0` (Lipschitz `∂Ω`), an **extension operator** `W^{1,p}(Ω) → W^{1,p}(ℝⁿ)`, and **Rellich–Kondrachov** …". No stage defines a Lipschitz domain, a boundary measure or Gauss–Green. AUDIT-40 A.6 trace target: "Nothing in either tree".

### The fix

**Note for the Tau Ceti maintainer, README Lane A, item 6, lines 232–236** (merged with /2, /3 and /29). Replace
> 6. **Trace, extension, Rellich.** The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with `ker = W^{1,p}_0` (Lipschitz `∂Ω`), an **extension operator** `W^{1,p}(Ω) → W^{1,p}(ℝⁿ)`, and **Rellich–Kondrachov**: `W^{1,p}(Ω) ↪↪ L^p(Ω)` **compact** for bounded `Ω` (via Fréchet–Kolmogorov / Arzelà–Ascoli). This is the keystone for Lane D and the eigenvalue theory.

with
> 6. **Domains and boundary calculus; trace, extension, Rellich.**
>    - **Domains.** `Ω` is a Lipschitz (resp. `C^k`, `C^{k,α}`) domain if, near each boundary point and after a rigid motion, it is the region above the graph of a Lipschitz (resp. `C^k`, `C^{k,α}`) function, with uniform constants when `Ω` is bounded. Build the local flattening maps and a partition of unity subordinate to the boundary charts.
>    - **Boundary measure.** `σ = μHE[n−1]` restricted to `∂Ω`. Consume Mathlib's `MeasureTheory.Measure.euclideanHausdorffMeasure`, which is normalized to agree with Lebesgue measure on hyperplanes; the unnormalized `μH[n−1]` differs from it by a constant. Prove the local graph formula `dσ = √(1+|∇γ|²) dx′`.
>    - **Gauss–Green.** `∫_Ω ∂ᵢu = ∫_{∂Ω} u νᵢ dσ` on bounded Lipschitz domains, with the `σ`-a.e. outward normal: first for `u ∈ C¹(Ω̄)`, then for `W^{1,1}` fields. Mathlib has the divergence theorem on boxes only.
>    - **Bi-Lipschitz invariance** of `W^{1,p}` under the flattening maps.
>    - **The trace operator** `W^{1,p}(Ω) → L^p(∂Ω, σ)` (Lipschitz `∂Ω`), with `ker = W^{1,p}_0` for `1 ≤ p < ∞`. At `p = ∞` the kernel is larger: `x(1−x)` on `(0,1)` has zero trace and is not a `W^{1,∞}`-limit of test functions.
>    - **An extension operator** `W^{1,p}(Ω) → W^{1,p}(ℝⁿ)` for bounded Lipschitz `Ω`.
>    - **Rellich–Kondrachov**, `1 ≤ p < ∞`.
>      - `W^{1,p}_0(Ω) ↪↪ L^p(Ω)` is **compact** for every bounded `Ω`, with no boundary hypothesis (built: `TauCeti.W1p0.isCompactOperator_valueL`, via Fréchet–Kolmogorov).
>      - `W^{1,p}(Ω) ↪↪ L^p(Ω)` for bounded Lipschitz `Ω`, through the extension operator.
>      - ⚠ The second fails for a bounded `Ω` made of infinitely many disjoint balls: the normalized indicators of the balls have zero gradient and stay `2^{1/p}` apart.
>
>    The `W^{1,2}_0` form of Rellich is the keystone for Lane D and the eigenvalue theory. The boundary calculus also serves Lane C's Green's functions and Poisson kernels (item 15) and the boundary estimates of item 20.

**AUDIT-40, layer `PDE#milestone-a-6`.** Add four targets, all `absent`:
- "Lipschitz and `C^k` domains (local graph charts, flattening, partitions of unity)";
- "The boundary measure `σ = μHE[n−1]⌊∂Ω` with its local graph formula": declaration `MeasureTheory.Measure.euclideanHausdorffMeasure` (`Mathlib/Geometry/Euclidean/Volume/Measure.lean:65`, fit related), note "the normalized Hausdorff measure exists; the codimension-one area formula for Lipschitz graphs does not";
- "Gauss–Green on bounded Lipschitz domains": note "Mathlib proves the divergence theorem on boxes only (`MeasureTheory/Integral/DivergenceTheorem.lean`)";
- "Bi-Lipschitz invariance of `W^{1,p}`".

The layer verdict stays "partly built".

**Edges.** E20 (A.6 → C.15) and E63 (A.6 → HeegaardFloer F1.1). E39 (A.6 → E.20) is /29's.

## /7 (medium, missing): the bridge between `Wkp` and Mathlib's Bessel scale

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **Tau Ceti's `Wkp` is real-valued.** Order `0` is `Lp ℝ p (mu.restrict Omega)` (`Wkp/Basic.lean:229`), and the weak derivative is tested against `𝓓(Ω, ℝ)` (`WeakDeriv.lean:200–202`).
- **Mathlib's `TemperedDistribution.MemSobolev` needs a complex codomain.** It is at `Mathlib/Analysis/Distribution/Sobolev.lean:149`, needs `[NormedSpace ℂ F]` and uses `Lp F p volume`.
- **The distribution API exists in Mathlib:** `Distribution.ofFun` (`Distribution.lean:302`), `Distribution.lineDerivCLM` (`:234`), `MeasureTheory.Lp.toTemperedDistribution` (`TemperedDistribution.lean:160`) and `HasCompactSupport.toSchwartzMap` (`SchwartzSpace/Basic.lean:554`).
- **Nothing connects the two.** No Tau Ceti file mentions `MemSobolev` or `besselPotential`.

The four bridge nodes are exactly what is needed to state the agreement at all.

### What main says now
A.3, lines 224–226: "Prove `W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)` (and the `1<p<∞` integer-order Calderón agreement) so the two definitions are known to coincide where both make sense". AUDIT-40 A.3: "the two theories are exactly the unrelated pair the layer warns against".

### The fix

**Note for the Tau Ceti maintainer, README Lane A, item 3, lines 224–226.** After "*do not* leave them as unrelated theories." add
> The two sides live over different scalars and measures. Tau Ceti's `Wkp` is real-valued over an additive Haar measure and tested against `𝓓(Ω, ℝ)`; Mathlib's `TemperedDistribution.MemSobolev` needs a complex normed codomain and uses `volume`. So first build the bridge:
> 1. a complexification of `Wkp` (or a vector-valued `Wkp`), which HeegaardFloer's maps into `ℂⁿ` also need;
> 2. in item 1: `HasWeakLineDerivOn μ Ω u u′ v` holds iff Mathlib's `Distribution.lineDerivCLM` of `Distribution.ofFun Ω u μ` is `Distribution.ofFun Ω u′ μ` (the weak derivative is the distributional one);
> 3. on `Ω = ℝⁿ`, for `u, u′ ∈ Lᵖ`, the weak derivative equals the tempered derivative of `Lp.toTemperedDistribution u` (by density of test functions in `𝓢`, or a cutoff argument);
> 4. the case `μ = volume` on `EuclideanSpace ℝ (Fin n)`.
>
> State the agreement through 1–4. The `p ≠ 2` half also consumes item 10 (Mihlin–Hörmander).

**AUDIT-40, layer `PDE#milestone-a-3`.** The note of the target "`W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)`: agreement of the weak-derivative scale with Mathlib's Bessel-potential scale" adds: "Before the theorem can be stated, four bridge nodes are needed: complexification; the equivalence of `HasWeakLineDerivOn` with `Distribution.lineDerivCLM` of `Distribution.ofFun` (`Distribution.lean:234`, `:302`); weak = tempered derivative on `ℝⁿ` (`Lp.toTemperedDistribution`, `TemperedDistribution.lean:160`); `μ = volume`."

**Edges.** E2 (A.1 → A.3) and E12 (B.10 → A.3).

## /8 (medium, missing): the Campanato characterization has no owner

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The theorem.** `L^{p,λ}(Ω) = C^{0,α}(Ω̄)` with equivalent seminorms for `λ = n + pα`, `0 < α ≤ 1`, `1 ≤ p < ∞`, on domains with `|Ω ∩ B(x,r)| ≥ A rⁿ` for `x ∈ Ω`, `0 < r ≤ diam Ω`. This is Campanato's theorem (as the finding states it). The endpoint `λ = n` gives BMO.
- **A ready formalization on balls.** Armstrong–Kempe's `DeGiorgi/Oscillation/Campanato.lean` at commit `4c1b3077` (read 29 September 2026 through the GitHub API) has `campanato_implies_holder` (line 1025: a Campanato bound on `B(x₀,R)` gives a Hölder representative on `B(x₀,R/2)`) and `holder_implies_campanato` (line 1215).
- **Whole-tree searches for "campanato" find nothing in either pinned library.**

### What main says now
README inventory, lines 182–183: "**Hölder spaces `C^{k,α}`** as Banach spaces (for Schauder), and the Campanato/Morrey space characterization." A.7, line 237: "**Hölder spaces `C^{k,α}(Ω)`** as Banach spaces, the target spaces for Schauder." E.22, line 306: "(Lane B / Campanato approach)". AUDIT-40 files "Campanato/Morrey space characterization" (absent) under E.22.

### The fix

**Note for the Tau Ceti maintainer, README Lane A, item 7, line 237** (merged with /9). Replace
> 7. **Hölder spaces `C^{k,α}(Ω)`** as Banach spaces, the target spaces for Schauder.

with
> 7. **Hölder spaces `C^{k,α}(Ω̄)`** as Banach spaces, the target spaces for Schauder, and the classes around them.
>    - **Domain spaces.** The bounded, uniformly Hölder spaces on a domain. Order `0` is `TauCeti.HolderSpace α ↥Ω Y` (built). Build orders `k ≥ 1` on `Ω̄`: Tau Ceti's `C1HolderSpace` lives on a whole normed space.
>    - **Local classes.** `C^{k,α}_loc(Ω) = {u ∈ C^k(Ω) : Dᵏu is α-Hölder on every compact K ⊆ Ω}`, through Mathlib's `HolderOnWith` on compact subsets. Prove restriction and monotonicity lemmas, and the inclusion of `HolderSpace α ↥Ω` into `C^{0,α}_loc(Ω)`. OptimalTransport 6C states its bootstrap in these classes.
>    - **Campanato spaces** `L^{p,λ}(Ω)`, with seminorm `sup_{x∈Ω, 0<r≤diam Ω} (r^{−λ} ∫_{Ω∩B(x,r)} |u − u_{x,r}|^p)^{1/p}`, and the isomorphism `L^{p,n+pα}(Ω) ≅ C^{0,α}(Ω̄)` (`0 < α ≤ 1`, `1 ≤ p < ∞`) for `Ω` with `|Ω ∩ B(x,r)| ≥ A rⁿ` (`x ∈ Ω`, `0 < r ≤ diam Ω`). That hypothesis is explicit.
>      - The endpoint `λ = n` is item 11's BMO, imported from there.
>      - Armstrong–Kempe's `DeGiorgi/Oscillation/Campanato.lean` (`campanato_implies_holder`, `holder_implies_campanato`, on balls) is the vendoring source.

E.22's "(Lane B / Campanato approach)" becomes "(Campanato approach, item 7)"; see the merged text in /31.

**AUDIT-40.**
- **Layer `PDE#milestone-a-7`.** New target "Campanato spaces `L^{p,λ}(Ω)` and `L^{p,n+pα} ≅ C^{0,α}(Ω̄)` under `|Ω ∩ B(x,r)| ≥ A rⁿ`": `absent`, note "an external Lean source exists (Armstrong–Kempe, `DeGiorgi/Oscillation/Campanato.lean`, on balls); not in either pinned library". The verdict stays "partly built".
- **Layer `PDE#milestone-e-22`.** Target "Campanato/Morrey space characterization": the note becomes "owned by layer a-7 and consumed here; absent".

**Edges.** E13 (B.11 → A.7, the BMO endpoint) and E44 (A.7 → E.22).

## /9 (medium, missing): local Hölder classes and domain spaces

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **Tau Ceti's Hölder spaces.** `TauCeti.HolderSpace α X Y` takes any `[MetricSpace X]` (`Holder/Normed.lean:48–54`). `TauCeti.C1HolderSpace` requires `HasFDerivAt` at every point of a normed space `E` (`Holder/One.lean:71–73`).
- **No local class in either library.** The whole-tree search for `HolderOnWith`, "LocallyHolder" or a `_loc` Hölder class finds none in Tau Ceti's analysis files. Mathlib has the predicate `HolderOnWith`.
- **The consumer.** OptimalTransport, 6C, item 9 (lines 838–846): "such a solution with `f ∈ C^{k,α}_loc` lies in `C^{k+2,α}_loc`".

### What main says now
A.7, line 237 (quoted in /8). AUDIT-40 A.7 target "The whole scale `C^{k,α}(Ω)` as Banach spaces, in particular `C^{2,α}` (the Schauder target)": `partial`.

### The fix
- **README:** the merged A.7 text of /8 (domain spaces for `k ≥ 1`, local classes, inclusion).
- **AUDIT-40, layer `PDE#milestone-a-7`:**
  - new target "Local Hölder classes `C^{k,α}_loc(Ω)` with restriction, monotonicity and the inclusion of `HolderSpace α ↥Ω`": `absent`, declaration `HolderOnWith` (Mathlib, fit related);
  - the note of the target "The whole scale `C^{k,α}(Ω)` as Banach spaces, in particular `C^{2,α}` (the Schauder target)" adds "domain spaces `C^{k,α}(Ω̄)` for `k ≥ 1` are also absent".
- **Edge.** E70 (A.7 → OptimalTransport 6C).

## /11 (medium, missing): HeegaardFloer and OptimalTransport consume Lanes A/B, and nothing records it

### What the verifier corrected
- **Both quotations are verbatim, and neither dependency is recorded.** No link map exists for PDE, HeegaardFloer or OptimalTransport.
- **One discrepancy.** The verifier writes that HeegaardFloer's prerequisites are "CombinatorialHeegaardFloer and GeometricTopology". At `59da8e9a`, `data/atlas.json` gives `['tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer']` only, as the red team says. Either way PDE is absent, which is the point.

### Checked
- **HeegaardFloer README, lines 171–174:** "The PDE roadmap's Lane A/B builds `W^{k,p}(Ω)`, embeddings, Rellich, and Calderón–Zygmund in general; this lane needs only the **2-dimensional, first-order-elliptic-system slice** (McDuff–Salamon, Appendix B), and should consume the shared spine rather than duplicate it".
- **OptimalTransport README:**
  - line 730, Layer 5 item 9: "First consume PDE Lane A.1's weak derivatives to define the weighted space `W¹,p(Ω,P)`";
  - lines 751–752: "the compact-embedding hypothesis follows by bridging PDE Lane A.6's Rellich--Kondrachov theorem" (for smooth bounded `Ω`, consistent with /2);
  - lines 820–824, in 6B: "The regularity sublayers consume the [PDE roadmap](../PDE/README.md), Lane A.1, … and Lane A.7 for Hölder spaces. Build the missing local vanishing-mean-oscillation (VMO) … with a bridge to PDE's bounded-mean-oscillation API";
  - 6C (lines 838–846) uses `C^{k,α}_loc`.
- **Stage ids.** The red team's `OptimalTransport#layer-5` is the stage `tauceti:TauCetiRoadmap/OptimalTransport#layer-5-convex-analysis-brenier-and-polar-factorization`. All eight endpoints exist in `data/atlas.json`.

### What main says now
`data/atlas.json` has no stage edge with a PDE endpoint. Its roadmap edges touching PDE are OneParameterSemigroups → PDE and PDE → OptimalTransport (both `declared`, `stageCount` 0). HeegaardFloer's `prerequisites` are `['tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer']`. `research/blueprint/links/` has no file for PDE, HeegaardFloer or OptimalTransport.

### The fix

**Link entries** E62–E70 (table in /26): A.1 → HF F1.1, A.6 → HF F1.1, B.10 → HF F1.2, A.1 → OT layer 5, A.6 → OT layer 5, A.1 → OT 6B, A.7 → OT 6B, B.11 → OT 6B, A.7 → OT 6C. These are the finding's eight listed edges; its "A-1 and A-7 → 6B" is two entries, so there are nine. All nine are acyclic.

**HeegaardFloer's prerequisite (snapshot).** Add to the `declarations` list of `scripts/snapshot/build_data.py`, beside the existing `('PDE','OptimalTransport','OptimalTransport','The regularity sublayers consume the [PDE roadmap]')`:
```python
('PDE','HeegaardFloer','HeegaardFloer','should consume the shared spine rather than duplicate it'),
```
The needle occurs verbatim in `content/tau-ceti/HeegaardFloer/README.md`, lines 173–174. The roadmap edge PDE → HeegaardFloer then puts PDE in HeegaardFloer's `prerequisites` and HeegaardFloer in PDE's `consumers`.

**Link jobs.** The finding asks for link-map jobs for the three roadmaps. They are already queued: `LINK-tauceti_TauCetiRoadmap_PDE`, `…_HeegaardFloer` and `…_OptimalTransport` are all pending. The HeegaardFloer and OptimalTransport packets list E62–E74 under `alreadyRecorded` if the PDE packet lands first.

## /12 (medium, duplicate): one owner for VMO

### What the verifier corrected
Nothing beyond confirming the quotations and citations. The finding lets the maintainer choose the owner, OptimalTransport 6B or PDE B.11, provided exactly one stage owns VMO.

### Choice of owner: PDE B.11
I take the finding's permitted alternative, B.11, for three reasons.
1. **The roadmap-level edge runs PDE → OptimalTransport.** It is declared, with evidence "The regularity sublayers consume the [PDE roadmap]". With 6B as owner, the stage edge OT 6B → PDE E.21 reverses it, and the two roadmaps depend on each other. With B.11 as owner, every stage edge between them runs PDE → OT (E65–E74).
2. **/30 also needs VMO in B.11.** It places the Coifman–Rochberg–Weiss commutator theorem and its VMO small-ball corollary in B.11. With VMO in 6B, that corollary would need an edge 6B → B.11 while 6B needs BMO from B.11 (E69). The cycle test confirms that 6B → B.11 closes a cycle; 6B → E.21 alone would not.
3. **VMO is a subspace of BMO.** Sarason's VMO is the closure in BMO of the uniformly continuous functions in BMO, with the modulus `η(r) = sup_{ρ≤r} sup_x ⨍_{B_ρ(x)} |a − a_{B_ρ(x)}|`. OT 6B's section-local oscillation modulus is built on convex sections, not balls; it derives from Sarason's modulus rather than replacing it.

### What main says now
- PDE README line 67: "*continuous / VMO* `aⁱʲ` gives **Calderón–Zygmund** `W^{2,p}` estimates"; E.21, lines 303–304: "then variable continuous/VMO coefficients".
- B.11, lines 256–257, plans BMO only.
- OptimalTransport README, lines 821–824: "Build the missing local vanishing-mean-oscillation (VMO) and quantitative oscillation-modulus API here, with a bridge to PDE's bounded-mean-oscillation API, before using those notions in section-local estimates."
- AUDIT-40 E.21: "VMO does not exist in either library". Whole-tree searches for "vanishing mean" and `VMO` find nothing relevant in either pinned library.

### The fix

**Note for the Tau Ceti maintainer, PDE README Lane B, item 11, lines 256–257** (merged with /30). Replace
> 11. **BMO and John–Nirenberg** (sub-lane): `BMO(ℝⁿ)`, the John–Nirenberg inequality, and the `L^∞ → BMO` endpoint for CZ operators.

with
> 11. **BMO and John–Nirenberg** (sub-lane): `BMO(ℝⁿ)`, the John–Nirenberg inequality, and the `L^∞ → BMO` endpoint for CZ operators. Also:
>     - **VMO**: Sarason's vanishing mean oscillation, on `ℝⁿ` and on a domain, with its modulus `η(r) = sup_{ρ≤r} sup_x ⨍_{B_ρ(x)} |a − a_{B_ρ(x)}|`. This item is its single owner: OptimalTransport 6B builds its section-local oscillation modulus on it, and item 21 consumes it.
>     - **The Coifman–Rochberg–Weiss commutator theorem**: `‖[b,T]‖_{Lᵖ→Lᵖ} ≤ C‖b‖_{BMO}`, `1<p<∞`, for the CZ operators of item 10, including the variable-kernel ones. Its corollary: for `b ∈ VMO`, the commutator has small norm on small balls, controlled by `η`.
>
>     Armstrong–Kempe's `DeGiorgi/Oscillation/BMO.lean` and `LocalJohnNirenberg.lean` (local BMO and John–Nirenberg on balls) are a vendoring source.

**Note for the Tau Ceti maintainer, OptimalTransport README, 6B, lines 821–824.** Replace
> Build the missing local vanishing-mean-oscillation (VMO) and quantitative oscillation-modulus API here, with a bridge to PDE's bounded-mean-oscillation API, before using those notions in section-local estimates.

with
> Import BMO and Sarason's VMO on balls, with its modulus, from the PDE roadmap's Lane B.11 (their single owner), and build here only the quantitative section-local oscillation-modulus API, with a bridge to PDE's bounded-mean-oscillation API, before using those notions in section-local estimates.

The clause quoted by E69 ("with a bridge to PDE's bounded-mean-oscillation API") is kept verbatim.

**AUDIT-40.**
- **Layer `PDE#milestone-b-11`.** New target "VMO (Sarason) and its modulus of oscillation": `absent`, note "single owner; OptimalTransport 6B and PDE E.21 import it".
- **Layer `PDE#milestone-e-21`.** The note of the target "`W^{2,p}` estimates for variable continuous/VMO coefficients" adds "VMO is imported from layer b-11". Its duplicate entry for `OptimalTransport#layer-6-…` (item 9) stays as the audit's review recorded it; /33, which re-reads it as a consumer relation, is out of scope.

**Edges.** E43 (B.11 → E.21) and E69 (B.11 → OT 6B). No OT 6B → E.21 edge.

## /17 (high, error): the end-to-end check names the wrong solution

### What the verifier corrected
- **The Newtonian potential is not the Dirichlet solution.** `Φ*f` solves `−Δw = f` on `ℝⁿ` but does not vanish on `∂B`. The zero-boundary solution is `Φ*f` corrected by the harmonic function agreeing with it on `∂B`, which is the Green's-function solution.
- **High severity is right** for an acceptance criterion.

### Checked
- **The example, for `n = 3`, `f = 1`, `B` the unit ball.** The Dirichlet solution is `(1 − |x|²)/6`: its Laplacian is `−1` and it vanishes on `∂B`. The Newtonian potential of `𝟙_B` is `(3 − |x|²)/6` on `B̄`: its Laplacian is `−1`, and its value at `|x| = 1` is `|B|/(4π) = 1/3`. They differ by the harmonic constant `1/3`.
- **Positivity.** `TauCeti.newtonianKernel_pos` (`FundamentalSolution/Euclidean/Basic.lean:108`) gives `Φ > 0` off the pole for `n ≥ 3`, so `Φ*f > 0` everywhere when `0 ≤ f ≢ 0`.
- **The Green's function.** `G(x,y) = Φ(y − x) − Φ(|x|(y − x̃))`, `x̃ = x/|x|²` (extended by continuity at `x = 0`), is the Green's function of the unit ball. It is the standard formula (Evans §2.2.4, cited, not read). Symmetry and the boundary values are immediate: `|x||y − x̃| = |y − x|` for `|y| = 1`.
- **The same error in the library.** `TauCeti/Analysis/PDE/DirichletProblem.lean:57–59`: "the smoothness half is Lane E and the identification with the Newtonian potential is Lane C."

### What main says now
README acceptance criteria, lines 348–351: "and it equals the **Newtonian-potential** solution (Lane C.15): three lanes meeting on one example."

### The fix

**Note for the Tau Ceti maintainer, README, acceptance criteria, lines 348–351.** Replace
> - **End-to-end existence:** the Dirichlet problem `−Δu = f` in a ball, `u = 0` on the boundary, has a unique weak solution (Lane D.17), it is **smooth** for smooth `f` (Lane E.20), and it equals the **Newtonian-potential** solution (Lane C.15): three lanes meeting on one example.

with
> - **End-to-end existence:** the Dirichlet problem `−Δu = f` in a ball, `u = 0` on the boundary, has a unique weak solution (Lane D.17). It is **smooth** in the open ball for smooth `f` (Lane E.20). It equals the **Green's-function** solution `u(x) = ∫_B G(x,y) f(y) dy` (Lane C.15), where for the unit ball `G(x,y) = Φ(y − x) − Φ(|x|(y − x̃))`, `x̃ = x/|x|²`, and `Φ` is the fundamental solution. Equivalently, `u = Φ*(f𝟙_B) − h` with `h` harmonic in `B` and equal to `Φ*(f𝟙_B)` on `∂B`. Three lanes meet on one example.
>
>   ⚠ The solution is **not** the Newtonian potential `Φ*(f𝟙_B)`, which does not vanish on `∂B`. For `n = 3` and `f = 1`, the Dirichlet solution is `(1 − |x|²)/6` and the Newtonian potential is `(3 − |x|²)/6` on `B̄`. For `n = 2` the check also needs the planar identity `−ΔΦ₂ = δ₀` (/18).

**Note for the Tau Ceti library maintainers**, `TauCeti/Analysis/PDE/DirichletProblem.lean:57–59`. Replace "and the identification with the Newtonian potential is Lane C." with "and the identification with the Green's-function solution (the Newtonian potential minus its harmonic boundary correction) is Lane C."

**AUDIT-40, layer `PDE#milestone-c-15`.** New target "The zero-boundary weak solution of `−Δu = f` on a ball equals its Green's-function representation": `absent`, note "needs the Green's function of the ball (absent) and the Newtonian potential (absent; see /18)".

## /18 (medium, library-claim): only the kernel of the Newtonian potential is built

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Read at the pin
- `TauCeti.newtonianKernel` (`FundamentalSolution/Euclidean/Basic.lean:55`) and `TauCeti.laplacian_newtonianKernel` (`:204`).
- `TauCeti.integral_laplacian_mul_newtonianKernel` (`Euclidean/DistributionalLaplacian.lean:261`): for `3 ≤ n` and `f` of class `C²` with compact support, `∫ Δf · Gₙ = −f 0`. Its translate is `…_sub` (`:284`).
- `TauCeti.planarNewtonianKernel` (`FundamentalSolution/Planar.lean:47`) is `−(2π)⁻¹ log‖z‖`; its distributional identity is not proved.
- No Newtonian potential. The whole-tree search for "newtonian potential" finds only three docstrings: `DirichletProblem.lean:59`, `FundamentalSolution/Gradient.lean:21` and `Planar.lean:24`, the last two saying the kernel is "input for forming … planar Newtonian potentials". No file under `TauCeti/Analysis/PDE` forms a convolution with the kernel.
- The target the layer names: Hunter, Theorem 2.25 (`ch2.pdf`, p. 34, read 29 September 2026): "Suppose that f ∈ C_c^∞(ℝⁿ), and let u = Γ ∗ f … Then u ∈ C^∞(ℝⁿ) and −Δu = f."

### What main says now
AUDIT-40, `PDE#milestone-c-15`, target "The fundamental solution / Newtonian potential of `Δ` on `ℝⁿ`": library `tauceti`, all five declarations fit `exact` or `special case`. The lane-c and summary entries say the Newtonian fundamental solution is "done".

### The fix
**AUDIT-40.**
- **Layer `PDE#milestone-c-15`.** Replace the target "The fundamental solution / Newtonian potential of `Δ` on `ℝⁿ`" by three targets:
  - (i) "The fundamental solution `Φₙ` and `−ΔΦₙ = δ₀`, `n ≥ 3`": library `tauceti`; `newtonianKernel`, `laplacian_newtonianKernel`, `integral_laplacian_mul_newtonianKernel`, `integral_laplacian_mul_newtonianKernel_sub`, fit exact.
  - (ii) "`−ΔΦ₂ = δ₀` for the planar kernel": `absent`; `planarNewtonianKernel` (`Planar.lean:47`), fit related.
  - (iii) "The Newtonian potential `w = Φₙ * f`, with `w ∈ C²(ℝⁿ)` and `−Δw = f` for `f ∈ C_c²(ℝⁿ)`, `n ≥ 2`": `absent`.
- **Layer `PDE#lane-c-…`.** The note of target "Fundamental solution, Green's function, Poisson kernel, Perron's method (item 15)" becomes "The Newtonian kernel with `−ΔG = δ₀` is done for `n ≥ 3`; the planar identity, the Newtonian potential `Φ * f`, Green's function, the `ℝⁿ` Poisson kernel and Perron's method are absent."
- **The roadmap summary.** Its sentence "and the `ℝⁿ` Newtonian fundamental solution with `-ΔG = δ₀` are done too" is replaced in /21 by one that says "for `n ≥ 3`". In addition, after "What is genuinely missing is", insert "the Newtonian potential `Φ * f` and Poisson's equation on `ℝⁿ`, the planar identity `-ΔΦ₂ = δ₀`,".

Owner: `tauceti:TauCetiRoadmap/PDE#milestone-c-15`, unchanged. No README change is needed: item 15 already names the Newtonian potential.

## /19 (medium, missing): nonhomogeneous boundary data

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The weak form of the nonhomogeneous problem.** Hunter §4.2 (`ch4.pdf`, pp. 92–93): "If Ω is smooth and g : ∂Ω → R is a function on the boundary that is in the range of the trace map T : H¹(Ω) → L²(∂Ω), say g = Tw, then we obtain a weak formulation of the nonhomogeneous Dirichet problem … by replacing (a) in Definition 4.2 with the condition that u − w ∈ H¹₀(Ω)."
- **The proof is Lax–Milgram for `z = u − w`,** with the functional `v ↦ ∫ f v − a(w, v)`. It is bounded on `H¹_0` because the form is bounded on `H¹ × H¹_0` for bounded coefficients.
  - `TauCeti.PDE.norm_energyFormH1_le_of_bounds` (`EnergyForm/Sobolev.lean:511`) bounds the form on `H¹`.
  - `IsCoercive.existsUnique_forall_eq` (`TauCeti/Analysis/InnerProductSpace/LaxMilgram.lean:152`) accepts any continuous functional.
- **The solution depends on `w` only modulo `H¹_0`:** two choices of `w` in the same class give the same affine space `w + H¹_0`.
- **What is built.** `TauCeti.PDE.IsWeakSolutionDirichlet` (`DirichletProblem.lean:165–169`) takes `u : W1p0 mu Omega 2`, so the datum is `0`. No declaration takes a boundary datum.

### What main says now
README line 20: "the Dirichlet problem `L u = f` in `Ω`, `u = g` on `∂Ω`"; line 39: "(Dirichlet, homogeneous BC)"; D.16: "on `H¹_0(Ω) × H¹_0(Ω)`"; D.17, lines 285–287. AUDIT-40 D.17 and Lane D: "built".

### The fix
**Note for the Tau Ceti maintainer, README Lane D, item 17, lines 285–287.** After "This is the first end-to-end PDE theorem and should land early." add
> Also state the **nonhomogeneous** problem that the end goal names. Let `w ∈ H¹(Ω)` and `f ∈ L²(Ω)` (or `f ∈ H^{−1}(Ω)`), and let the form be coercive on `H¹_0(Ω)`. Then there is a unique `u ∈ H¹(Ω)` with `u − w ∈ H¹_0(Ω)` and `a(u,v) = ∫_Ω f v` for all `v ∈ H¹_0(Ω)`, and `u` depends on `w` only through its class modulo `H¹_0(Ω)`.
>
> Proof: Lax–Milgram for `u − w`, with forcing `v ↦ ∫ f v − a(w, v)`, which is bounded because the form is bounded on `H¹(Ω) × H¹_0(Ω)`. Boundary data `g` enter as `g = Tw` through item 6's trace.

**AUDIT-40.**
- **Layer `PDE#milestone-d-17`.** Verdict `built` → `partly built`. New target "The nonhomogeneous Dirichlet problem: `u − w ∈ H¹_0(Ω)`, `a(u,v) = ∫ f v` for `v ∈ H¹_0(Ω)`": `absent`, declarations `IsCoercive.existsUnique_forall_eq` (`LaxMilgram.lean:152`) and `TauCeti.PDE.norm_energyFormH1_le_of_bounds` (`EnergyForm/Sobolev.lean:511`), both fit related, note "the inputs exist; no declaration takes a boundary datum".
- **Layer `PDE#lane-d-…`.** Verdict `built` → `partly built`, with the same target added.

**Edge.** E28 (A.6 → D.17, through the trace).

## /20 (medium, missing): the Fredholm alternative's adjoint half and its general form

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The source theorem.** Hunter, Theorem 4.24 (`ch4.pdf`, p. 107), alternative (2): "The equation L∗v − λv = 0 has a nonzero weak solution v. The solution spaces of Lu − λu = 0 and L∗v − λv = 0 are finite-dimensional and have the same dimension. For f ∈ L²(Ω), the equation Lu − λu = f has a weak solution u ∈ H¹₀(Ω) if and only if (f, v) = 0 for every v ∈ H¹₀(Ω) such that L∗v − λv = 0".
- **What is built.** `TauCeti.PDE.fredholmAlternative_isWeakSolutionDirichletMassShift` (`FredholmAlternative.lean:182–189`) assumes `hcoercive : IsCoercive (energyFormH1L0 hcoeff)` for the unshifted coefficients. It concludes only the dichotomy. The whole-tree search for "adjoint" in `TauCeti/Analysis/PDE` finds only self-adjointness docstrings.
- **The Gårding input exists.** `garding_energyFormIntegral_self_of_mass_lower_bound_on` (`EnergyForm/Integrated/Basic.lean:509`) gives `∫(λ/2‖∇u‖² + (μ − β²/(2λ))u²) ≤ a(u,u)` from `μ ≤ c` a.e. and `‖b‖ ≤ β`. So with `c ≥ −c₋`, the form of `L + γ` is coercive on `H¹_0` for `γ > β²/(2λ) + c₋`.
- **The abstract inputs exist.** `ContinuousLinearMap.index_one_sub_eq_zero` (`TauCeti/Analysis/Fredholm/CompactPerturbation.lean:151`: a compact perturbation of the identity has index 0) and `ContinuousLinearMap.orthogonal_range` (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean:201`: `T.rangeᗮ = T†.ker`).
- **Correction: the adjoint's index convention.** The finding writes `L*v = −∂ᵢ(aʲⁱ∂ⱼv) − ∂ᵢ(bⁱv) + cv`. That is Hunter's formula (4.22), but Hunter's operator (4.16) is `−∂ᵢ(aⁱʲ∂ⱼu)` with `aⁱʲ = aʲⁱ`. This README's operator is `−∂ⱼ(aⁱʲ∂ᵢu)`, with form `a(u,v) = ∫ aⁱʲ∂ᵢu ∂ⱼv` (line 282; Tau Ceti's `energyIntegrand` is `⟨a∇u, ∇v⟩`, `EnergyForm/Basic.lean:83–96`), and `aⁱʲ` need not be symmetric.
  - Define the adjoint by its form, `a*(v,w) := a(w,v)`.
  - Integrating by parts, `a(w,v) = ∫ w · (−∂ᵢ(aⁱʲ∂ⱼv) − ∂ᵢ(bⁱv) + cv)`.
  - So `L*v = −∂ᵢ(aⁱʲ∂ⱼv) − ∂ᵢ(bⁱv) + cv`, which is the finding's formula with the principal matrix transposed. With a nonsymmetric `a`, the finding's formula would give `L`'s own principal part.

### What main says now
D.18, lines 288–290: "*consume* `FredholmAlternative` to get the "either-unique-solution-or-finite-dim-kernel" dichotomy for `Lu = f`." AUDIT-40 D.18: "built".

### The fix
**Note for the Tau Ceti maintainer, README Lane D, item 18, lines 288–290.** Replace
> 18. **The Fredholm alternative (non-coercive case).** Using Rellich (Lane A.6) to make the resolvent compact, *consume* `FredholmAlternative` to get the "either-unique-solution-or-finite-dim-kernel" dichotomy for `Lu = f`.

with
> 18. **The Fredholm alternative (non-coercive case).** Using Rellich (Lane A.6) to make the resolvent compact, *consume* `FredholmAlternative` to get the "either-unique-solution-or-finite-dim-kernel" dichotomy for `Lu = f`, in full:
>     - **Gårding packaging.** For bounded measurable `a, b, c` with ellipticity constant `λ`, `‖b‖ ≤ β` and `c ≥ −c₋` a.e., the form of `L + γ` is coercive on `H¹_0(Ω)` for every `γ > β²/(2λ) + c₋`. So the dichotomy holds for every such `L`, not only for one whose unshifted form is already coercive.
>     - **The formal adjoint**, defined by its form: `a*(v,w) := a(w,v)` on `H¹_0 × H¹_0`, that is `L*v = −∂ᵢ(aⁱʲ∂ⱼv) − ∂ᵢ(bⁱv) + cv` in this document's index convention (the principal matrix is transposed).
>     - **The adjoint half.** `dim ker(L − λ) = dim ker(L* − λ) < ∞`, and `Lu − λu = f` is solvable if and only if `(f, v)_{L²} = 0` for every `v ∈ ker(L* − λ)` (Hunter, *Notes on PDEs*, Theorem 4.24). Abstractly this is `ContinuousLinearMap.index_one_sub_eq_zero` and `ContinuousLinearMap.orthogonal_range`.

**AUDIT-40, layer `PDE#milestone-d-18`.** Verdict `built` → `partly built`. Four new targets, all `absent`:
- "The formal adjoint `L*` and its weak form `a*(v,w) = a(w,v)` on `H¹_0`";
- "`dim ker(L − λ) = dim ker(L* − λ) < ∞`": declaration `ContinuousLinearMap.index_one_sub_eq_zero` (`Fredholm/CompactPerturbation.lean:151`), fit related;
- "`Lu − λu = f` is solvable iff `f ⊥ ker(L* − λ)` in `L²`": declaration `ContinuousLinearMap.orthogonal_range` (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean:201`), fit related;
- "Coercivity of `L + γ` on `H¹_0` for `γ > β²/(2λ) + c₋`, giving the dichotomy for every bounded measurable `L`": declaration `garding_energyFormIntegral_self_of_mass_lower_bound_on` (`EnergyForm/Integrated/Basic.lean:509`), fit related, note "the built dichotomy assumes the unshifted form coercive (`FredholmAlternative.lean:184`)".

The lane-D verdict is changed in /19.

## /21 (medium, missing): the eigenvalue sequence and the Sturm–Liouville example

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The source theorem.** Hunter, Theorem 4.25 (`ch4.pdf`, p. 109): "The operator L has an increasing sequence of real eigenvalues of finite multiplicity … such that λn → ∞. There is an orthonormal basis {φn : n ∈ N} of L²(Ω) consisting of eigenfunctions".
- **What is built.** `TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue` (`Spectrum.lean:533`) gives a basis indexed by a set: "`L²(Ω)` is not assumed separable, so the basis is indexed by a set of functions" (`:532`).
- **The accumulation theorem is absent.** I searched the whole trees:
  - Mathlib's compact-operator spectral files (`InnerProductSpace/Spectrum.lean:433,463`; `Normed/Operator/Compact/FredholmAlternative.lean:54,164,221`);
  - Tau Ceti's `Normed/Operator/Compact/{Basic,Eigenspace,RieszTheory}.lean`, `InnerProductSpace/Spectrum.lean` and `InnerProductSpace/Variational/{Spectrum,Rayleigh}.lean`.

  They give finite-dimensional eigenspaces, the Fredholm alternative, Hilbert bases and the Rayleigh quotient, but no finiteness of the eigenvalues above `ε` and no accumulation at `0`. "sturm" occurs in neither tree.
- **The mathematics.** For compact self-adjoint `T` and `ε > 0`, the eigenvalues with `|μ| ≥ ε` are finitely many, each of finite multiplicity; otherwise an orthonormal sequence `eₖ` would have `‖Teₖ − Teⱼ‖² ≥ 2ε²`.
  - The Dirichlet solution operator is compact, self-adjoint and injective. Its eigenvalues `1/λ` therefore give `λ_k → ∞`.
  - `L²(Ω)` is separable (Mathlib `MeasureTheory.Lp.SecondCountableTopology`, `SeparableMeasure.lean:427`) and infinite-dimensional for nonempty open `Ω`, so the basis can be indexed by `ℕ`.
- **The Sturm–Liouville example.** `−u″ = λu` on `(0,ℓ)`, `u(0) = u(ℓ) = 0`: the eigenvalues are `(kπ/ℓ)²`, `k ≥ 1`, and `√(2/ℓ) sin(kπx/ℓ)` is orthonormal and complete in `L²(0,ℓ)`.

### What main says now
D.19, lines 291–294: "then the eigenfunction basis from `InnerProductSpace/Spectrum`. The model **Sturm–Liouville** / separation-of-variables payoff." AUDIT-40 D.19: "built", with the note "The parenthetical 'Sturm–Liouville / separation-of-variables payoff' is not itself formalised".

### The fix
**Note for the Tau Ceti maintainer, README Lane D, item 19, lines 291–294.** Replace
> then the eigenfunction basis from `InnerProductSpace/Spectrum`. The model **Sturm–Liouville** / separation-of-variables payoff.

with
> then the eigenfunction basis from `InnerProductSpace/Spectrum`.
> - **The eigenvalue sequence.** For a compact self-adjoint operator on a real Hilbert space and `ε > 0`, the eigenspaces with `|μ| ≥ ε` span a finite-dimensional space. Hence, on a nonempty bounded `Ω` with a symmetric coercive form, only finitely many Dirichlet eigenvalues lie below any bound. They can be listed with multiplicity as `0 < λ₁ ≤ λ₂ ≤ ⋯ → ∞`, with an orthonormal eigenbasis `(φ_k)_{k∈ℕ}` of `L²(Ω)` (Hunter, Theorem 4.25; `L²(Ω)` is separable by Mathlib's `Lp.SecondCountableTopology`).
> - **The model Sturm–Liouville / separation-of-variables payoff**, as a worked instance: `−u″ = λu` on `(0, ℓ)` with `u(0) = u(ℓ) = 0` has the eigenvalues `(kπ/ℓ)²`, `k ≥ 1`, and the functions `√(2/ℓ) sin(kπx/ℓ)` form an orthonormal basis of `L²(0, ℓ)`.

**AUDIT-40.**
- **Layer `PDE#milestone-d-19`.** Verdict `built` → `partly built`. Two new targets, both `absent`:
  - "Eigenvalues of a compact self-adjoint operator above `ε > 0` are finitely many; the Dirichlet eigenvalues form a sequence `0 < λ₁ ≤ λ₂ ≤ ⋯ → ∞` with an `ℕ`-indexed orthonormal eigenbasis": declarations `TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue` (`Spectrum.lean:533`, fit related) and `MeasureTheory.Lp.SecondCountableTopology` (fit related);
  - "The Dirichlet problem for `−u″ = λu` on `(0,ℓ)`: eigenvalues `(kπ/ℓ)²` and the sine basis".
- **Layer `PDE#lane-d-…`.** Its target "Spectrum of `−Δ` (item 19)" becomes `partial`, with the note "no ordered eigenvalue sequence; no Sturm–Liouville example".
- **The roadmap summary** (with /18 and /22). Replace
  > Lane D is complete end to end — energy form, Gårding, Lax–Milgram existence and uniqueness, the Fredholm alternative, and the Dirichlet spectrum with an eigenfunction Hilbert basis and the Rayleigh principle — and Lane C's maximum principles (weak, strong, Hopf, comparison, and the `c ≥ 0` and bounded-drift extensions) and the `ℝⁿ` Newtonian fundamental solution with `-ΔG = δ₀` are done too;

  with
  > Lane D's core is done — energy form, Gårding, Lax–Milgram existence and uniqueness for zero boundary data, the Fredholm dichotomy for a coercive base form, and the Dirichlet spectrum with an eigenfunction Hilbert basis and the Rayleigh principle — while nonhomogeneous boundary data, the adjoint half of the Fredholm alternative, the ordered eigenvalue sequence and the Sturm–Liouville example are missing; Lane C's maximum principles for `Δ` (weak, strong, Hopf, comparison), the weak principle for `-Δ - b·∇ + c` with `c ≥ 0`, and the Newtonian kernel with `-ΔG = δ₀` for `n ≥ 3` are done too;

## /22 (medium, error): the strong maximum principle with `c ≥ 0` needs a nonnegative maximum

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The counterexample.** `L = −Δ + 1` on the unit ball of `ℝⁿ`, `u = −cosh x₁`. Then `Δu = −cosh x₁`, so `Lu = cosh x₁ − cosh x₁ = 0`. The maximum `−1` over the closed ball is attained on the interior hyperplane `x₁ = 0`, and `u` is not constant.
- **The correct forms are standard.**
  - Strong principle, `c ≥ 0`: if `Ω` is connected, `Lu ≤ 0`, and `u` attains a nonnegative maximum over `Ω̄` at an interior point, then `u` is constant.
  - Hopf, `c ≥ 0`: it needs `u(x⁰) ≥ 0`.
  - With `c ≡ 0`, no sign is needed.
  - Evans §6.4.2, Theorems 3–4, cited, not read.
- **What is built.** Tau Ceti's weak principle for `−Δ + c` carries `hm : 0 ≤ m`, with the docstring "The nonnegativity of `m` cannot be dropped once `c ≠ 0`" (`TauCeti.le_of_mul_le_laplacian_le_frontier`, `ZerothOrderMaximumPrinciple.lean:75`). No strong principle or Hopf lemma with `c` exists.

### What main says now
README lines 108–111: "the strong principle additionally needs `Ω` connected and rests on the **Hopf boundary-point lemma**". C.13, lines 266–267: "for general elliptic `L` (sign condition `c ≥ 0`)".

### The fix
**Note for the Tau Ceti maintainer, README.**
1. "Getting the statements right", lines 108–111 (merged with /23). Replace
   > - **State maximum principles with their hypotheses.** The weak maximum principle for `Lu = -∂ⱼ(aⁱʲ∂ᵢu) + cu` needs `c ≥ 0` (or `Lu ≤ 0` with the right structure); the strong principle additionally needs `Ω` connected and rests on the **Hopf boundary-point lemma**; Harnack is for nonnegative solutions. Make each of these a named hypothesis.

   with
   > - **State maximum principles with their hypotheses.**
   >   - The weak maximum principle for `Lu = -∂ⱼ(aⁱʲ∂ᵢu) + cu` needs `c ≥ 0`, and then bounds `u` by `sup_{∂Ω} u⁺`, not by `sup_{∂Ω} u`.
   >   - The strong principle additionally needs `Ω` connected and, when `c ≢ 0`, a **nonnegative** interior maximum. The **Hopf boundary-point lemma** needs the same sign (`u(x⁰) ≥ 0`).
   >   - The Hopf route is a `C²` argument for classical solutions. For weak (`H¹`) solutions of divergence-form equations with bounded measurable coefficients, the strong principle comes from the weak Harnack inequality (item 23).
   >   - Harnack is for nonnegative solutions.
   >
   >   Make each of these a named hypothesis.
2. Lane C, item 13, lines 266–267 (merged with /23). Replace
   > 13. **The weak and strong maximum principles** for `Δ` and then for general elliptic `L` (sign condition `c ≥ 0`); the **Hopf boundary-point lemma**; the comparison principle.

   with
   > 13. **The weak and strong maximum principles** for `Δ`; the **Hopf boundary-point lemma**; the comparison principle. Then, keeping the two forms of `L` apart:
   >     - (a) **Classical.** For the non-divergence operator `L = −aⁱʲ∂ᵢⱼ + bⁱ∂ᵢ + c`, with bounded, uniformly elliptic coefficients, on `u ∈ C²(Ω) ∩ C(Ω̄)`:
   >       - the weak principle: `c ≥ 0` and `Lu ≤ 0` give `max_{Ω̄} u ≤ max_{∂Ω} u⁺`; with `c ≡ 0`, `max_{Ω̄} u = max_{∂Ω} u`;
   >       - the **Hopf lemma** at a boundary point with an interior ball; for `c ≥ 0` it needs `u(x⁰) ≥ 0`;
   >       - the strong principle: if `Ω` is connected, `Lu ≤ 0`, and `u` attains a **nonnegative** maximum over `Ω̄` at an interior point, then `u` is constant. With `c ≡ 0` no sign is needed.
   >
   >       ⚠ The sign is load-bearing: for `L = −Δ + 1` on the unit ball, `u = −cosh x₁` has `Lu = 0` and an interior maximum `−1`, and is not constant.
   >     - (b) **Weak.** For the divergence-form operator of the end goal, with bounded measurable coefficients and `c ≥ 0`: the weak maximum principle for `H¹` subsolutions, `sup_Ω u ≤ sup_{∂Ω} u⁺` in the `H¹` sense (`(u − k)⁺ ∈ H¹_0(Ω)` for `k ≥ sup_{∂Ω} u⁺`).
   >
   >     The strong maximum principle for `W^{1,2}` subsolutions of divergence-form equations is not a Hopf-lemma argument. It is a corollary of the weak Harnack inequality and belongs to item 23.
3. Acceptance criteria, lines 356–357. After "with a counterexample showing the sign condition is necessary" add
   > , and `−cosh x₁` for `−Δ + 1` on the unit ball, showing that the strong principle with `c ≥ 0` needs a nonnegative maximum

**AUDIT-40, layer `PDE#milestone-c-13`.**
- The target "The maximum principle for a general elliptic `L` with sign condition `c ≥ 0`" keeps its status (`partial`) and declarations.
- New target "Strong maximum principle and Hopf lemma for `L` with `c ≥ 0` (nonnegative maximum)": `absent`, note "no strong principle or Hopf lemma with a zeroth-order term exists; `le_of_mul_le_laplacian_le_frontier` carries `hm : 0 ≤ m`".

The summary sentence on Lane C is corrected in /21.

## /23 (medium, error): "general elliptic `L`" mixes two theories

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The Hopf route is a `C²` argument.** Tau Ceti's Hopf lemma requires `huinterior : ∀ x ∈ ball y R, ContDiffAt ℝ 2 u x` (`HopfLemma.lean:129–137`), and the strong principle requires `C²` too (`StrongMaximumPrinciple.lean:174`). The divergence-form operator with bounded measurable coefficients has `H¹` solutions that are not `C²`: E.23's own subject is their Hölder continuity.
- **The two forms differ.** Hunter, *Notes on PDEs* (full notes `pde_notes.pdf`, revised 6/18/2014), Appendix 4.A, p. 120: "These forms need not be equivalent if the coefficients aij are not smooth."
- **The weak principle for `H¹` subsolutions** (Gilbarg–Trudinger Theorem 8.1, cited, not read) tests the inequality with `(u − k)⁺ ∈ H¹_0`, `k ≥ sup_{∂Ω} u⁺`. So it uses the lattice property of `H¹_0` (A.2) and the energy form (D.16).
- **The strong principle for `W^{1,2}` subsolutions** follows from the weak Harnack inequality (Gilbarg–Trudinger Theorems 8.18–8.19, cited, not read). The weak Harnack inequality is in Armstrong–Kempe (`weak_harnack`), so it lives with E.23.

### What main says now
README lines 17–19 fix the operator as "`L u = -∂ⱼ(aⁱʲ ∂ᵢ u) + bⁱ ∂ᵢ u + c u` with bounded measurable coefficients"; lines 108–111 attach the strong principle and the Hopf lemma to `Lu = -∂ⱼ(aⁱʲ∂ᵢu) + cu`; C.13 asks for the principles "for general elliptic `L`". No layer plans the weak maximum principle for `H¹` subsolutions.

### The fix
- **README:** items (a) and (b) and the E.23 pointer in the merged C.13 text of /22; the strong principle for `W^{1,2}` subsolutions in the merged E.23 text of /32.
- **AUDIT-40.**
  - Layer `PDE#milestone-c-13`: new target "(b) The weak maximum principle for `H¹` subsolutions of divergence-form `L` with bounded measurable coefficients, `c ≥ 0`": `absent`.
  - Layer `PDE#milestone-e-23`: new target "The strong maximum principle for `W^{1,2}` subsolutions, from the weak Harnack inequality": `absent`.
  - The existing C.13 target "The maximum principle for a general elliptic `L` with sign condition `c ≥ 0`" keeps its declarations (the classical `−Δ − b·∇ + c` files), which are part (a).
- **Edges.** E21 (A.2 → C.13) and E22 (D.16 → C.13). The finding's "C.13 → E.23 edge removed if one is ever added" needs no action: no such edge exists or is proposed.

## /24 (medium, duplicate): the general-`L` Harnack inequality belongs to E.23

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The divergence-form Harnack is proved inside Moser's theory.** For nonnegative weak solutions with bounded measurable coefficients it comes from Moser's iteration inside E.23 (Hunter §4.13, p. 117: "Moser also obtained a Harnack inequality for weak solutions which is a crucial ingredient of the regularity theory"). The harmonic Harnack inequality is not an input to it.
- **Nor is Harnack an input to De Giorgi–Nash.** Fernández-Real–Ros-Oton, Remark 3.18 (arXiv:2301.01564v1, read 29 September 2026): "Even though it is not needed to prove Theorem 3.17, … one can also prove Harnack's inequality for operators of the form div(A(x)∇v)".
- **The harmonic case follows from the mean-value property (C.12).** Hunter, Theorem 2.22 (`ch2.pdf`, p. 31) states it "for a non-negative function with the mean value property".

### What main says now
C.14, lines 268–269: "then for general elliptic `L` (this feeds De Giorgi–Nash–Moser in Lane E)". AUDIT-40 C.14 lists E.23 as a duplicate, with no owner.

### The fix
**Note for the Tau Ceti maintainer, README Lane C, item 14, lines 268–269.** Replace
> 14. **The Harnack inequality** for nonnegative harmonic functions, then for general elliptic `L` (this feeds De Giorgi–Nash–Moser in Lane E).

with
> 14. **The Harnack inequality** for nonnegative harmonic functions on a connected open `Ω ⊆ ℝⁿ`: for each connected open `V ⋐ Ω` there is `C(V, Ω)` with `sup_V u ≤ C inf_V u`, from the mean-value property of item 12. The Harnack inequality for nonnegative weak solutions of divergence-form equations with bounded measurable coefficients belongs to item 23 (Moser), which does not use this one.

**AUDIT-40.**
- **Layer `PDE#milestone-c-14`:**
  - remove the target "The Harnack inequality for a general elliptic `L`";
  - replace the duplicate entry for `PDE#milestone-e-23` by the note "the divergence-form Harnack inequality is owned by E.23";
  - the verdict stays "partly built" (the harmonic target is planar only).
- **Layer `PDE#milestone-e-23`:**
  - the target "The elliptic Harnack inequality for bounded measurable coefficients" stays;
  - its duplicate entry for `PDE#milestone-c-14` is removed (the overlap is resolved in E.23's favour).

**Edge.** E17 (C.12 → C.14). No C.14 → E.23 edge is recorded.

## /26 (medium, error): the atlas records no dependency for PDE

### What the verifier corrected
- **The bare fact is the upstream convention.** "32 stages, no stage edges" is not itself a defect: only 4 of 656 upstream stages populate `requires`, in ConformalMapping and OneParameterSemigroups.
- **The claim is narrower and right.** No link map exists for PDE, so the dependencies its own document states have no machine-readable record by the mechanism upstream roadmaps use. The fix is to write one.

The corrected scope is therefore: link entries for `LINK-tauceti_TauCetiRoadmap_PDE`, with quoted evidence on both sides. This is not an edit of the extract or of `requires` lists, which are regenerated from the atlas.

### What main says now
- `data/atlas.json` at `59da8e9a` has 3,508 stage edges, none with a PDE endpoint. Every PDE stage has `requires: []` and `consumers: []`, and the extract's `stageEdges` is empty.
- The assembled atlas (7,792 stage edges) does contain the two OneParameterSemigroups links into F.26 (Part A → F.26 and Hille–Yosida → F.26), from the promoted link map `data/links/tauceti_TauCetiRoadmap_OneParameterSemigroups.json`. The red team's statement that they "appear in neither data/atlas.json nor the extract" is true of the raw file only.

### Mathematical check of the proposed edges
I checked each proposed edge against what the consumer's statement uses. I keep every edge of classes (I)–(III), except four, and add the edges that the other fixes create:
- **`lane-b → e-22` is not recorded.** The "Lane B / Campanato approach" attribution does not survive /8. Campanato's route to Schauder uses Campanato spaces and Caccioppoli-type energy estimates, not maximal functions or singular integrals; after /8 the Campanato input is A.7 (E44). E.21's dependence on Lane B is recorded by E36 and E42.
- **`e-20 → HeegaardFloer F1.2` is not recorded.** HeegaardFloer names only "Lane A/B" as its shared spine. E.20's theorem, `H²` regularity for second-order scalar equations, does not apply to the first-order `∂̄` system of F1.2. Its shared input would be A.1's difference quotients, which HeegaardFloer does not name.
- **`a-2 → f-24` becomes `a-1 → f-24` (E52) plus `a-2 → f-25` (E54).** F.24 is the abstract Gelfand triple; it needs A.1's weak derivative for `H¹(0,T;V*)` (/34). `V = H¹_0(Ω)` enters only in F.25.
- **`VMO owner → e-21` is `b-11 → e-21` (E43),** since /12 makes B.11 the owner.
- **Not recorded, as the finding says:** `c-14 → e-23` (wrong direction, /24) and `lane-e → lane-f` (scheduling).
- **Edges the other fixes add:**
  - E7 (A.2 → A.5), E8 (A.6 → A.5) and E9 (A.6 → A.4), from /1 and /2;
  - E13 (B.11 → A.7), from /8;
  - E20 (A.6 → C.15), E21 and E22 (→ C.13), from /6 and /23;
  - E28 (A.6 → D.17), from /19;
  - E39 (A.6 → E.20), from /29;
  - E46 (A.1 → E.23), from /32;
  - E59 (F.25 → F.26), from /38;
  - E60 and E61 (OneParameterSemigroups → F.26), from /37.

### Checks
- **Quotes and cycles.** All 74 entries were put in a scratch `links-v1` packet. `python3 scripts/check_links.py` on it reports 0 errors and 59 warnings. All 59 warnings are "both stages belong to tauceti:TauCetiRoadmap/PDE", which the checker allows. Every quote was found verbatim.
- **Negative control.** A deliberately corrupted quote was rejected.
- **Cumulative cycle test on the assembled graph** (2840 stages, 7792 edges): none of the 74 edges was already present, and none closes a cycle.
- **Negative controls for the cycle test.**
  - D.19 → A.6 and F.26 → OneParameterSemigroups Hille–Yosida are reported as cycles.
  - OptimalTransport 6B → B.11 is also reported as a cycle; /12 relies on this.
  - OptimalTransport 6B → E.21, the edge that /12's other permitted choice of VMO owner would add, is reported acyclic. So that choice was not ruled out by the graph.

### The fix

**Link entries** for `LINK-tauceti_TauCetiRoadmap_PDE`, in the order tested:
- **Endpoints.** In the "Edge" column, `PDE x-n` is `tauceti:TauCetiRoadmap/PDE#milestone-x-n`; the lanes are `…#lane-a-function-spaces-on-a-domain-the-universal-prerequisite`, `…#lane-b-harmonic-analysis-estimates`, `…#lane-d-linear-elliptic-existence-the-energy-method`, `…#lane-e-elliptic-regularity` and `…#lane-f-parabolic-and-evolution-equations`.
- **Other roadmaps.**
  - HeegaardFloer: `HF f1-n` is `tauceti:TauCetiRoadmap/HeegaardFloer#milestone-f1-n`.
  - OptimalTransport:
    - `OT layer-5` is `…/OptimalTransport#layer-5-convex-analysis-brenier-and-polar-factorization`;
    - `OT layer-11` is `…#layer-11-entropy-wasserstein-differential-calculus-jko-and-pde-flows`;
    - `OT 6b-…`, `OT 6c-…` and `OT 13c-…` are the stage anchors as written.
  - OneParameterSemigroups: `OPS x` is `tauceti:TauCetiRoadmap/OneParameterSemigroups#milestone-milestone--x`.
- **Evidence.** The first quote is the supplier's and the second the consumer's. A PDE quote is from `content/tau-ceti/PDE/README.md`; the others are from `content/tau-ceti/<Roadmap>/README.md` of the named roadmap. Locators are lines of that document.
- **Confidence.** "explicit" means the consumer's text names the supplier (or both texts name the dependency); "inferred" means the consumer states the use and the supplier the output.
- **Reasons.** The "Reason" column is the entry's `reason`; the "From" column names the findings that justify it.

| # | Edge | From | Conf. | Reason | Supplier quote (locator) | Consumer quote (locator) |
|---|---|---|---|---|---|---|
| E1 | PDE a-1 → PDE a-2 | /26 | inferred | W^{k,p}_0 and Meyers-Serrin density are statements about A.1's weak-derivative space W^{k,p}(Ω). | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “define `W^{k,p}_0(Ω)` as the `C_c^∞(Ω)`-closure” (lines 221-222) |
| E2 | PDE a-1 → PDE a-3 | /7 /26 | inferred | The agreement W^{k,2}(ℝⁿ)=H^{k,2}(ℝⁿ) compares A.1's weak-derivative space with Mathlib's Bessel scale; A.1 owns the bridge HasWeakLineDerivOn ↔ Distribution.lineDerivOp (/7 node 2). | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “Prove `W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)` (and the `1<p<∞` integer-order Calderón agreement)” (lines 224-225) |
| E3 | PDE a-1 → PDE a-4 | /26 | inferred | Morrey and the borderline embedding are statements about W^{1,p}(Ω). | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “the Morrey embedding `W^{1,p}(Ω) ↪ C^{0,1−n/p}(Ω)` for `p>n`” (lines 227-228) |
| E4 | PDE a-1 → PDE a-5 | /26 | inferred | Poincaré and Poincaré-Wirtinger bound u by its weak gradient. | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “**Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean)” (line 230) |
| E5 | PDE a-1 → PDE a-6 | /26 | inferred | Trace, extension and Rellich act on W^{1,p}(Ω). | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with `ker = W^{1,p}_0` (Lipschitz `∂Ω`)” (lines 232-233) |
| E6 | PDE a-2 → PDE a-6 | /26 | inferred | ker(trace) = W^{1,p}_0 needs A.2's W^{1,p}_0 (1 ≤ p < ∞, /3). | “define `W^{k,p}_0(Ω)` as the `C_c^∞(Ω)`-closure” (lines 221-222) | “The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with `ker = W^{1,p}_0` (Lipschitz `∂Ω`)” (lines 232-233) |
| E7 | PDE a-2 → PDE a-5 | /1 | inferred | The convex Poincaré-Wirtinger target is proved for C¹(Ω) functions (TauCeti.enorm_sub_setAverage_le_of_convex takes ContDiffOn ℝ 1 u Ω) and passes to W^{1,p}(Ω), p < ∞, by Meyers-Serrin density. | “Mollification (consume `BumpFunction/Convolution`) gives `C^∞ ∩ W^{k,p}` dense” (lines 220-221) | “**Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean)” (line 230) |
| E8 | PDE a-6 → PDE a-5 | /1 /26 | inferred | Poincaré-Wirtinger on a bounded connected Lipschitz domain is proved by compactness (Rellich for W^{1,p}(Ω)) or through the extension operator. | “an **extension operator** `W^{1,p}(Ω) → W^{1,p}(ℝⁿ)`” (line 233) | “**Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean)” (line 230) |
| E9 | PDE a-6 → PDE a-4 | /2 | inferred | Morrey on W^{1,p}(Ω) for a bounded Lipschitz Ω applies whole-space Morrey to the extension. | “an **extension operator** `W^{1,p}(Ω) → W^{1,p}(ℝⁿ)`” (line 233) | “the Morrey embedding `W^{1,p}(Ω) ↪ C^{0,1−n/p}(Ω)` for `p>n`” (lines 227-228) |
| E10 | PDE a-7 → PDE a-4 | /26 | inferred | Morrey's target space is A.7's Hölder space. | “**Hölder spaces `C^{k,α}(Ω)`** as Banach spaces, the target spaces for Schauder.” (line 237) | “the Morrey embedding `W^{1,p}(Ω) ↪ C^{0,1−n/p}(Ω)` for `p>n`” (lines 227-228) |
| E11 | PDE b-11 → PDE a-4 | /26 | inferred | The borderline p = n embedding lands in B.11's BMO. | “**BMO and John–Nirenberg** (sub-lane): `BMO(ℝⁿ)`, the John–Nirenberg inequality, and the `L^∞ → BMO` endpoint for CZ operators.” (lines 256-257) | “state (then prove) the borderline `p=n`” (lines 228-229) |
| E12 | PDE b-10 → PDE a-3 | /7 /26 | inferred | The 1<p<∞ Calderón agreement needs L^p-bounded Riesz transforms / Mihlin multipliers. | “the **Mihlin–Hörmander multiplier theorem**” (line 187) | “Prove `W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)` (and the `1<p<∞` integer-order Calderón agreement)” (lines 224-225) |
| E13 | PDE b-11 → PDE a-7 | /8 | inferred | A.7 owns the Campanato spaces L^{p,λ}; the endpoint λ = n is identified with B.11's BMO. | “**BMO and John–Nirenberg** (sub-lane): `BMO(ℝⁿ)`, the John–Nirenberg inequality, and the `L^∞ → BMO` endpoint for CZ operators.” (lines 256-257) | “**Hölder spaces `C^{k,α}(Ω)`** as Banach spaces, the target spaces for Schauder.” (line 237) |
| E14 | PDE b-8 → PDE b-10 | /26 | inferred | The CZ decomposition and the weak (1,1) bound of CZ operators run on the maximal function and Vitali covering. | “**Hardy–Littlewood maximal function** `Mf` and the **maximal inequality**” (line 244) | “The **CZ decomposition** of an `L¹` function at height `t`” (line 250) |
| E15 | PDE b-9 → PDE b-10 | /26 | inferred | L^p bounds for 1<p<2 interpolate the weak (1,1) and L² bounds (Marcinkiewicz, the (1,1)-(2,2) case). | “**Marcinkiewicz** (real, weak-type to strong-type)” (line 247) | “**CZ singular integral operators** (standard kernel bounds) bounded on `Lᵖ`, `1<p<∞`, and weak-`(1,1)`” (lines 251-252) |
| E16 | PDE b-10 → PDE b-11 | /26 | inferred | The L^∞ → BMO endpoint is a statement about B.10's operators, and John-Nirenberg is proved by a CZ decomposition. | “**CZ singular integral operators** (standard kernel bounds) bounded on `Lᵖ`, `1<p<∞`, and weak-`(1,1)`” (lines 251-252) | “the `L^∞ → BMO` endpoint for CZ operators” (line 257) |
| E17 | PDE c-12 → PDE c-14 | /24 /26 | inferred | The ℝⁿ Harnack inequality for nonnegative harmonic functions is proved from the mean-value property. | “**Mean-value property and smoothness of harmonic functions** on `ℝⁿ`” (line 264) | “**The Harnack inequality** for nonnegative harmonic functions” (line 268) |
| E18 | PDE c-12 → PDE c-15 | /26 | inferred | Perron's method uses the mean-value characterisation of (sub)harmonic functions. | “**Mean-value property and smoothness of harmonic functions** on `ℝⁿ`” (line 264) | “via subharmonic barriers” (lines 272-273) |
| E19 | PDE c-13 → PDE c-15 | /26 | inferred | Perron's method and barriers use the maximum and comparison principles. | “**The weak and strong maximum principles** for `Δ` and then for general elliptic `L`” (line 266) | “via subharmonic barriers” (lines 272-273) |
| E20 | PDE a-6 → PDE c-15 | /6 | inferred | Green's representation formula on the ball/half-space uses the Gauss-Green formula and the boundary measure that /6 assigns to A.6. | “The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with `ker = W^{1,p}_0` (Lipschitz `∂Ω`)” (lines 232-233) | “the **Green's function** and **Poisson kernel** on the ball/half-space, and **Perron's method**” (lines 270-271) |
| E21 | PDE a-2 → PDE c-13 | /23 | inferred | The weak maximum principle for H¹ subsolutions (/23 b) tests with (u - k)⁺ ∈ H¹_0. | “define `W^{k,p}_0(Ω)` as the `C_c^∞(Ω)`-closure” (lines 221-222) | “**The weak and strong maximum principles** for `Δ` and then for general elliptic `L`” (line 266) |
| E22 | PDE d-16 → PDE c-13 | /23 | inferred | The weak maximum principle for H¹ subsolutions is stated with D.16's energy form. | “The energy bilinear form `a(u,v) = ∫ aⁱʲ ∂ᵢu ∂ⱼv + …` on `H¹_0(Ω) × H¹_0(Ω)`” (lines 282-283) | “**The weak and strong maximum principles** for `Δ` and then for general elliptic `L`” (line 266) |
| E23 | PDE lane-a → PDE lane-d | /26 | explicit | Lane D assembles Lane A's Sobolev spaces, Poincaré and Rellich. | “Almost everything downstream waits on this, so do it first and do it right.” (line 214) | “This lane mostly assembles Lane A and Mathlib.” (line 280) |
| E24 | PDE a-2 → PDE d-16 | /26 | inferred | The energy form lives on A.2's H¹_0 × H¹_0. | “define `W^{k,p}_0(Ω)` as the `C_c^∞(Ω)`-closure” (lines 221-222) | “The energy bilinear form `a(u,v) = ∫ aⁱʲ ∂ᵢu ∂ⱼv + …` on `H¹_0(Ω) × H¹_0(Ω)`” (lines 282-283) |
| E25 | PDE d-16 → PDE d-17 | /26 | inferred | Lax-Milgram is applied to D.16's energy form. | “The energy bilinear form `a(u,v) = ∫ aⁱʲ ∂ᵢu ∂ⱼv + …` on `H¹_0(Ω) × H¹_0(Ω)`” (lines 282-283) | “*consume* Lax–Milgram (`continuousLinearEquivOfBilin`) for the unique weak solution of the Dirichlet problem” (lines 285-286) |
| E26 | PDE a-2 → PDE d-17 | /26 | inferred | The weak Dirichlet problem is posed in H¹_0. | “define `W^{k,p}_0(Ω)` as the `C_c^∞(Ω)`-closure” (lines 221-222) | “*consume* Lax–Milgram (`continuousLinearEquivOfBilin`) for the unique weak solution of the Dirichlet problem” (lines 285-286) |
| E27 | PDE a-5 → PDE d-17 | /26 | inferred | Coercivity of the form on H¹_0 comes from Poincaré on W^{1,2}_0. | “**Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean)” (line 230) | “*consume* Lax–Milgram (`continuousLinearEquivOfBilin`) for the unique weak solution of the Dirichlet problem” (lines 285-286) |
| E28 | PDE a-6 → PDE d-17 | /19 | inferred | Nonhomogeneous data g = Tw on ∂Ω enter the weak problem u - w ∈ H¹_0 through A.6's trace. | “The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with `ker = W^{1,p}_0` (Lipschitz `∂Ω`)” (lines 232-233) | “for the Dirichlet problem `L u = f` in `Ω`, `u = g` on `∂Ω`” (line 20) |
| E29 | PDE d-17 → PDE d-18 | /26 | inferred | The Fredholm alternative is run relative to D.17's coercive solution operator. | “*consume* Lax–Milgram (`continuousLinearEquivOfBilin`) for the unique weak solution of the Dirichlet problem” (lines 285-286) | “"either-unique-solution-or-finite-dim-kernel" dichotomy for `Lu = f`” (line 290) |
| E30 | PDE a-6 → PDE d-18 | /26 | explicit | Rellich for W^{1,2}_0 on bounded Ω, no boundary regularity (TauCeti.W1p0.isCompactOperator_valueL). | “This is the keystone for Lane D and the eigenvalue theory.” (lines 235-236) | “Using Rellich (Lane A.6) to make the resolvent compact” (lines 288-289) |
| E31 | PDE d-18 → PDE d-19 | /26 | inferred | Tau Ceti's Spectrum.lean builds on FredholmAlternative.lean's compact solution operators. | “"either-unique-solution-or-finite-dim-kernel" dichotomy for `Lu = f`” (line 290) | “then the eigenfunction basis from `InnerProductSpace/Spectrum`” (lines 292-293) |
| E32 | PDE d-17 → PDE d-19 | /26 | inferred | The compact self-adjoint inverse is D.17's Lax-Milgram solution operator. | “*consume* Lax–Milgram (`continuousLinearEquivOfBilin`) for the unique weak solution of the Dirichlet problem” (lines 285-286) | “a compact self-adjoint inverse (Rellich plus Lax–Milgram)” (line 292) |
| E33 | PDE a-6 → PDE d-19 | /26 | explicit | Rellich for W^{1,2}_0 makes the inverse compact. | “This is the keystone for Lane D and the eigenvalue theory.” (lines 235-236) | “a compact self-adjoint inverse (Rellich plus Lax–Milgram)” (line 292) |
| E34 | PDE a-5 → PDE d-19 | /26 | explicit | Positivity of the first eigenvalue of -Δ is the Poincaré inequality on W^{1,2}_0. | “**Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean)” (line 230) | “positive (Lane D.19), matching the Poincaré constant” (line 353) |
| E35 | PDE lane-a → PDE lane-e | /26 | explicit | Regularity is stated in W^{k,p}(Ω). | “almost everything downstream needs `W^{k,p}(Ω)` and Rellich” (lines 380-381) | “The deepest lane, and the route from weak to classical solutions” (line 298) |
| E36 | PDE lane-b → PDE lane-e | /26 | explicit | W^{2,p} and the BMO inputs of Lane E come from Lane B. | “Lane B (harmonic analysis) is the long pole that Lane E's regularity depends on” (lines 384-385) | “The deepest lane, and the route from weak to classical solutions” (line 298) |
| E37 | PDE a-1 → PDE e-20 | /28 | inferred | Difference-quotient characterisation of W^{1,p} (owned by A.1 after /28). | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “**Interior `H²`/`Hᵏ` estimates** via difference quotients” (line 301) |
| E38 | PDE a-4 → PDE e-20 | /28 | inferred | The C^∞ bootstrap needs H^k_loc ⊂ C^m for k > m + n/2 (owned by A.4 after /28). | “the Morrey embedding `W^{1,p}(Ω) ↪ C^{0,1−n/p}(Ω)` for `p>n`” (lines 227-228) | “**Interior `H²`/`Hᵏ` estimates** via difference quotients” (line 301) |
| E39 | PDE a-6 → PDE e-20 | /29 | inferred | The boundary H² theorem added by /29 uses C^k domains, flattening and partitions of unity (A.6 after /6). | “The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with `ker = W^{1,p}_0` (Lipschitz `∂Ω`)” (lines 232-233) | “a weak `H¹` solution with `L²` data is locally `H²`” (lines 301-302) |
| E40 | PDE d-16 → PDE e-20 | /26 | inferred | A weak H¹ solution is defined by D.16's energy form. | “The energy bilinear form `a(u,v) = ∫ aⁱʲ ∂ᵢu ∂ⱼv + …` on `H¹_0(Ω) × H¹_0(Ω)`” (lines 282-283) | “a weak `H¹` solution with `L²` data is locally `H²`” (lines 301-302) |
| E41 | PDE d-17 → PDE e-20 | /26 | explicit | The end-to-end check applies E.20 to D.17's solution. | “has a unique weak solution (Lane D.17), it is **smooth** for smooth `f` (Lane E.20)” (lines 349-350) | “a weak `H¹` solution with `L²` data is locally `H²`” (lines 301-302) |
| E42 | PDE b-10 → PDE e-21 | /26 /30 | explicit | The L^p theory of D²u uses B.10's CZ operators (constant and, for VMO coefficients, variable kernels). | “**CZ singular integral operators** (standard kernel bounds) bounded on `Lᵖ`, `1<p<∞`, and weak-`(1,1)`” (lines 251-252) | “**Calderón–Zygmund `W^{2,p}` estimates** for strong solutions (consume Lane B)” (line 303) |
| E43 | PDE b-11 → PDE e-21 | /12 /30 | inferred | VMO (owner B.11 after /12) and the Coifman-Rochberg-Weiss commutator bound feed the VMO-coefficient case. | “**BMO and John–Nirenberg** (sub-lane): `BMO(ℝⁿ)`, the John–Nirenberg inequality, and the `L^∞ → BMO` endpoint for CZ operators.” (lines 256-257) | “then variable continuous/VMO coefficients” (line 304) |
| E44 | PDE a-7 → PDE e-22 | /8 /26 /31 | explicit | Schauder estimates are stated in A.7's Hölder spaces and proved with A.7's Campanato characterisation. | “**Hölder spaces `C^{k,α}(Ω)`** as Banach spaces, the target spaces for Schauder.” (line 237) | “Interior and global `C^{2,α}` estimates for `C^{0,α}` coefficients” (lines 305-306) |
| E45 | PDE c-13 → PDE e-22 | /26 /31 | inferred | Classical solvability needs the maximum-principle bound and uniqueness (sign condition on c). | “**The weak and strong maximum principles** for `Δ` and then for general elliptic `L`” (line 266) | “giving classical solvability of the Dirichlet problem in `C^{2,α}`” (lines 306-307) |
| E46 | PDE a-1 → PDE e-23 | /32 | inferred | The De Giorgi-Nash-Moser port is re-based on Tau Ceti's W^{1,2} (/32 node 1). | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “Local boundedness and **Hölder continuity** of weak solutions of divergence-form equations” (lines 308-309) |
| E47 | PDE d-16 → PDE e-23 | /26 /32 | inferred | Weak (sub/super)solutions are defined by the energy form. | “The energy bilinear form `a(u,v) = ∫ aⁱʲ ∂ᵢu ∂ⱼv + …` on `H¹_0(Ω) × H¹_0(Ω)`” (lines 282-283) | “Local boundedness and **Hölder continuity** of weak solutions of divergence-form equations” (lines 308-309) |
| E48 | PDE a-4 → PDE e-23 | /26 | inferred | The De Giorgi and Moser iterations use the Sobolev inequality. | “*Consume* Gagliardo–Nirenberg–Sobolev for `p<n`” (line 227) | “Local boundedness and **Hölder continuity** of weak solutions of divergence-form equations” (lines 308-309) |
| E49 | PDE a-5 → PDE e-23 | /26 | inferred | They use Poincaré-Wirtinger on balls (the convex case of /1). | “**Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean)” (line 230) | “Local boundedness and **Hölder continuity** of weak solutions of divergence-form equations” (lines 308-309) |
| E50 | PDE b-11 → PDE e-23 | /26 | inferred | Moser's crossover uses John-Nirenberg. | “**BMO and John–Nirenberg** (sub-lane): `BMO(ℝⁿ)`, the John–Nirenberg inequality, and the `L^∞ → BMO` endpoint for CZ operators.” (lines 256-257) | “Local boundedness and **Hölder continuity** of weak solutions of divergence-form equations” (lines 308-309) |
| E51 | PDE lane-a → PDE lane-f | /26 | explicit | The parabolic theory is posed in H¹_0 and its dual. | “almost everything downstream needs `W^{k,p}(Ω)` and Rellich” (lines 380-381) | “Lane F: parabolic and evolution equations” (line 315) |
| E52 | PDE a-1 → PDE f-24 | /34 | inferred | H¹(0,T;V*) is defined with TauCeti.HasWeakLineDerivOn on E = ℝ, F = StrongDual ℝ V (/34). | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “`L²(0,T;V)`, `H¹(0,T;V*)`, the triple `V ↪ H ↪ V*`” (lines 317-318) |
| E53 | PDE f-24 → PDE f-25 | /26 | inferred | The solution space and the energy identity of F.24 carry F.25's weak solutions. | “the integration-by-parts/embedding `L²(V) ∩ H¹(V*) ↪ C([0,T];H)`” (lines 318-319) | “giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`” (line 322) |
| E54 | PDE a-2 → PDE f-25 | /26 /35 | inferred | V = H¹_0(Ω), H = L²(Ω) in the Dirichlet parabolic problem. | “define `W^{k,p}_0(Ω)` as the `C_c^∞(Ω)`-closure” (lines 221-222) | “giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`” (line 322) |
| E55 | PDE d-16 → PDE f-25 | /26 | inferred | The Galerkin energy estimates use D.16's form and Gårding. | “The energy bilinear form `a(u,v) = ∫ aⁱʲ ∂ᵢu ∂ⱼv + …` on `H¹_0(Ω) × H¹_0(Ω)`” (lines 282-283) | “The **Galerkin method**: finite-dimensional approximation (consume ODE existence), energy estimates” (lines 320-321) |
| E56 | PDE d-19 → PDE f-25 | /26 | inferred | The Galerkin spaces are spanned by Dirichlet eigenfunctions. | “then the eigenfunction basis from `InnerProductSpace/Spectrum`” (lines 292-293) | “The **Galerkin method**: finite-dimensional approximation (consume ODE existence), energy estimates” (lines 320-321) |
| E57 | PDE d-17 → PDE f-26 | /26 /38 | inferred | The range condition for the Dirichlet realisation is Lax-Milgram for the shifted form. | “*consume* Lax–Milgram (`continuousLinearEquivOfBilin`) for the unique weak solution of the Dirichlet problem” (lines 285-286) | “The **heat semigroup**, generators, and **Hille–Yosida**” (line 324) |
| E58 | PDE d-19 → PDE f-26 | /26 /38 | inferred | Eigenfunction expansion of the Dirichlet heat semigroup. | “then the eigenfunction basis from `InnerProductSpace/Spectrum`” (lines 292-293) | “The **heat semigroup**, generators, and **Hille–Yosida**” (line 324) |
| E59 | PDE f-25 → PDE f-26 | /38 | inferred | The mild solution given by the semigroup agrees with F.25's weak solution (/38 e). | “giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`” (line 322) | “The **heat semigroup**, generators, and **Hille–Yosida**” (line 324) |
| E60 | OPS lumerphillips-theorem → PDE f-26 | /37 /38 | inferred | The Dirichlet heat semigroup is generated through Lumer-Phillips (TauCeti.Semigroups.IsMDissipative.exists_contractionSemigroup_generator_eq). | “A densely-defined **dissipative** operator with a **range condition** (`∃ λ₀ > 0` with `λ₀ − A` surjective) generates a **contraction** semigroup.” (lines 125-127) | “The **heat semigroup**, generators, and **Hille–Yosida**” (line 324) |
| E61 | OPS abstract-cauchy-problem → PDE f-26 | /37 | inferred | Classical and mild solutions of u' = Au are imported (StronglyContinuousSemigroup.isClassicalSolution_realOperator, isMildSolution_realOperator). | “`u(t) = S(t)x` is the solution of `u' = A u`, `u(0) = x`” (lines 137-138) | “The **heat semigroup**, generators, and **Hille–Yosida**” (line 324) |
| E62 | PDE a-1 → HF f1-1 | /11 | explicit | W^{k,p} of maps of surfaces and strips is the 2-dimensional slice of A.1. | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “`W^{k,p}` of maps of surfaces/strips, Sobolev multiplication (`kp > 2`), trace.” (line 176) |
| E63 | PDE a-6 → HF f1-1 | /6 /11 | explicit | The trace of F1.1 is A.6's trace operator. | “The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with `ker = W^{1,p}_0` (Lipschitz `∂Ω`)” (lines 232-233) | “`W^{k,p}` of maps of surfaces/strips, Sobolev multiplication (`kp > 2`), trace.” (line 176) |
| E64 | PDE b-10 → HF f1-2 | /11 | explicit | The ∂̄ Calderón-Zygmund inequality is a case of B.10. | “**CZ singular integral operators** (standard kernel bounds) bounded on `Lᵖ`, `1<p<∞`, and weak-`(1,1)`” (lines 251-252) | “The Calderón–Zygmund inequality `‖u‖_{W^{1,p}} ≤ C‖∂̄u‖_{L^p}` via the Cauchy kernel” (lines 177-178) |
| E65 | PDE a-1 → OT layer-5 | /11 | explicit | Weighted W^{1,p}(Ω,P) is built on A.1's weak derivatives. | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “First consume PDE Lane A.1's weak derivatives to define the weighted space `W¹,p(Ω,P)`” (lines 730-731) |
| E66 | PDE a-6 → OT layer-5 | /11 | explicit | Rellich for smooth bounded Ω feeds the weighted compact embedding. | “This is the keystone for Lane D and the eigenvalue theory.” (lines 235-236) | “the compact-embedding hypothesis follows by bridging PDE Lane A.6's Rellich--Kondrachov theorem” (lines 751-752) |
| E67 | PDE a-1 → OT 6b-the-transport-equation | /11 | explicit | The Monge-Ampère regularity sublayers consume A.1's Sobolev API. | “Define the weak (distributional) derivative of a locally integrable function” (lines 216-217) | “The regularity sublayers consume the [PDE roadmap](../PDE/README.md), Lane A.1, for the weak-derivative Sobolev API and Lane A.7 for Hölder spaces.” (lines 820-821) |
| E68 | PDE a-7 → OT 6b-the-transport-equation | /11 | explicit | They consume A.7's Hölder spaces. | “**Hölder spaces `C^{k,α}(Ω)`** as Banach spaces, the target spaces for Schauder.” (line 237) | “The regularity sublayers consume the [PDE roadmap](../PDE/README.md), Lane A.1, for the weak-derivative Sobolev API and Lane A.7 for Hölder spaces.” (lines 820-821) |
| E69 | PDE b-11 → OT 6b-the-transport-equation | /11 /12 | explicit | The section-local oscillation modulus is built on B.11's BMO and VMO. | “**BMO and John–Nirenberg** (sub-lane): `BMO(ℝⁿ)`, the John–Nirenberg inequality, and the `L^∞ → BMO` endpoint for CZ operators.” (lines 256-257) | “with a bridge to PDE's bounded-mean-oscillation API” (lines 822-823) |
| E70 | PDE a-7 → OT 6c-quadratic-caffarelli-theory | /9 /11 | inferred | C^{k,α}_loc classes (A.7 after /9). | “**Hölder spaces `C^{k,α}(Ω)`** as Banach spaces, the target spaces for Schauder.” (line 237) | “such a solution with `f ∈ C^{k,α}_loc` lies in `C^{k+2,α}_loc`” (lines 842-843) |
| E71 | PDE e-22 → OT 6c-quadratic-caffarelli-theory | /31 | inferred | The interior Schauder bootstrap for k ≥ 1. | “Interior and global `C^{2,α}` estimates for `C^{0,α}` coefficients” (lines 305-306) | “for `k ≥ 1` use the ordinary interior Schauder bootstrap on relatively compact subdomains” (lines 844-845) |
| E72 | PDE f-25 → OT layer-11 | /26 | explicit | Weak parabolic solution theory. | “giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`” (line 322) | “This layer consumes Layers 8--10 and the weak PDE infrastructure in the [PDE roadmap](../PDE/README.md).” (lines 1222-1223) |
| E73 | PDE f-26 → OT layer-11 | /26 | explicit | The concrete heat semigroup. | “The **heat semigroup**, generators, and **Hille–Yosida**” (line 324) | “prove that the entropy flow agrees with the concrete heat semigroup built in the [PDE roadmap](../PDE/README.md), Lane F.” (lines 1306-1308) |
| E74 | PDE f-26 → OT 13c-dynamic-schrödinger-theory | /26 | inferred | P^ε_t = e^{(εt/2)Δ} is F.26's heat semigroup at rescaled time. | “The **heat semigroup**, generators, and **Hille–Yosida**” (line 324) | “With the heat semigroup `P^ε_t`, set `f_t=P^ε_t f`” (lines 1556-1557) |

**Note for the Tau Ceti maintainer, README "How to drive it", lines 380–381.** After "because almost everything downstream needs `W^{k,p}(Ω)` and Rellich." add
> Within Lane A, item 3 (for `p ≠ 2`) and item 4 (for `p = n`) wait for Lane B (items 10 and 11), and the Lipschitz-domain parts of items 4–6 wait for item 6's boundary calculus.

This is the Lanes A/B part of the fix: "Lane A comes first" holds for A.1, A.2, A.7 and the `W_0` parts of A.5 and A.6, not for A.3 or A.4.

**AUDIT-40, layer `PDE#milestone-b-9`.** The note of the target "Marcinkiewicz interpolation (weak type to strong type)" adds: "The built case assumes an `L^∞` bound (`hinfty`, `Marcinkiewicz.lean:401–410`), which CZ operators lack. So it does not serve B.10, which needs the `(1,1)`–`(2,2)` case or the general theorem."

## /27 (high, error): interior `H²` regularity needs Lipschitz coefficients

### What the verifier corrected
- **The qualifier attaches only to the bootstrap.** E.20 reads "a weak `H¹` solution with `L²` data is locally `H²`, bootstrapping to `C^∞` for smooth coefficients and data", so the `H²` claim carries no coefficient hypothesis.
- **The standing operator has bounded measurable coefficients** (README line 19). In that class interior `H²` is false: De Giorgi–Nash–Moser gives Hölder continuity and no more, and the difference-quotient proof needs Lipschitz coefficients.
- **The finding's added hypothesis is the right repair.**

### Checked
- **The counterexample.** `a = 1` on `x < 0`, `a = 2` on `x > 0`; `u = x` for `x ≤ 0`, `u = x/2` for `x ≥ 0`. Then `a u′ ≡ 1`, so `∫ a u′ φ′ = ∫ φ′ = 0` for every test function, and `u` is a weak solution of `−(a u′)′ = 0`. But `u′` jumps from `1` to `1/2`, so `u ∉ H²_loc`. The laminar `u(x) = x₁/a(x₁)` does the same in every dimension.
- **The sources.** Hunter (`ch4.pdf`, read 29 September 2026):
  - Theorem 4.27 (p. 112): "Assume that aij ∈ C¹(Ω) and f ∈ L²(Ω). If u ∈ H¹(Ω) is a weak solution …, then u ∈ H²(Ω′) for every Ω′ ⋐ Ω", with `‖u‖_{H²(Ω′)} ≤ C(‖f‖_{L²(Ω)} + ‖u‖_{L²(Ω)})`;
  - Theorem 4.28: `aij ∈ C^{k+1}`, `f ∈ Hᵏ` give `H^{k+2}(Ω′)`;
  - Corollary 4.29: the `C^∞` case.
- **Hunter's operator has no lower-order terms.** With `bⁱ, c ∈ L^∞` the `H²` statement is unchanged (Evans §6.3.1, Theorem 1, cited, not read), and `H^{k+2}` needs `bⁱ, c ∈ C^{k+1}` as well.
- **Only local Lipschitz regularity of `a` is used.** The difference-quotient proof uses `a` only through its Lipschitz bound on a neighbourhood of `Ω′`.

### What main says now
E.20, lines 301–302 (quoted below). The coefficient dial, lines 64–69, has no tier between bounded measurable and Hölder. AUDIT-40 E.20 states the targets without coefficient hypotheses.

### The fix
**Note for the Tau Ceti maintainer, README.**
1. The coefficient dial, lines 64–67. After
   > - *bounded measurable* `aⁱʲ` gives **divergence form**, **weak** solutions, De Giorgi–Nash–Moser;

   insert
   > - *Lipschitz* (for instance `C¹`) `aⁱʲ` gives **`H²`** regularity of weak solutions, interior and, on `C²` domains, global (difference quotients); `C^{k+1}` coefficients give `H^{k+2}`;
2. Lane E, item 20, lines 301–302 (merged with /28 and /29). Replace
   > 20. **Interior `H²`/`Hᵏ` estimates** via difference quotients: a weak `H¹` solution with `L²` data is locally `H²`, bootstrapping to `C^∞` for smooth coefficients and data.

   with
   > 20. **`H²`/`Hᵏ` estimates** via difference quotients. Consume item 1's difference-quotient characterization of `W^{1,p}` and item 4's `W^{k,2}_loc ⊂ C^m`.
   >     - *Interior `H²`.* Take `Ω` open, `aⁱʲ` Lipschitz on `Ω` (`C¹(Ω̄)` suffices), `bⁱ, c ∈ L^∞(Ω)`, uniform ellipticity with `λ, Λ`, and `f ∈ L²(Ω)`. If `u ∈ H¹(Ω)` is a weak solution, then `u ∈ H²(Ω′)` for every `Ω′ ⋐ Ω`, and `‖u‖_{H²(Ω′)} ≤ C(‖f‖_{L²(Ω)} + ‖u‖_{L²(Ω)})`, with `C` depending on `n, λ, Λ`, the Lipschitz bound of `a`, `‖b‖_∞, ‖c‖_∞, Ω′` and `Ω`.
   >     - *Interior `H^{k+2}`.* If `aⁱʲ, bⁱ, c ∈ C^{k+1}(Ω̄)` and `f ∈ Hᵏ(Ω)`, then `u ∈ H^{k+2}(Ω′)`. Corollary: `C^∞` for smooth coefficients and data.
   >     - *Boundary `H²`/`H^{k+2}`.* Take `Ω` bounded with `C²` (resp. `C^{k+2}`) boundary, `u ∈ H¹_0(Ω)` a weak solution, and the same coefficient hypotheses on `Ω̄`. Then `u ∈ H²(Ω)` (resp. `H^{k+2}(Ω)`), with `‖u‖_{H^{k+2}(Ω)} ≤ C(‖f‖_{Hᵏ(Ω)} + ‖u‖_{L²(Ω)})`. The proof flattens the boundary and uses a partition of unity (item 6).
   >
   >     ⚠ The coefficient hypothesis is load-bearing. In dimension one, take `a = 1` on `x < 0` and `a = 2` on `x > 0`, and `u = x` for `x ≤ 0`, `u = x/2` for `x ≥ 0`. Then `a u′ ≡ 1`, so `u` is a weak solution of `−(a u′)′ = 0`, but `u′` jumps and `u ∉ H²_loc`. With merely bounded measurable coefficients the regularity is item 23's Hölder continuity, and no more.
3. Acceptance criteria, after the "Regularity actually upgrades" bullet (lines 354–355), add
   > - **Regularity needs its coefficient tier:** the one-dimensional two-phase solution (`a = 1, 2` on either side of `0`, `u = x` and `x/2`) is a weak solution that is not locally `H²` (Lane E.20).

**AUDIT-40, layer `PDE#milestone-e-20`.**
- The target "Interior `H²` regularity: a weak `H¹` solution with `L²` data is locally `H²`" becomes "Interior `H²` regularity for Lipschitz `aⁱʲ` and bounded `bⁱ, c`: a weak `H¹` solution with `L²` data is locally `H²`, with the estimate". It stays `absent`, and its note adds "false for bounded measurable coefficients (one-dimensional two-phase example)".
- The target "`Hᵏ` bootstrapping to `C^∞` for smooth coefficients and data" becomes "`H^{k+2}_loc` for `C^{k+1}` coefficients and `Hᵏ` data, and `C^∞` for smooth coefficients and data". It stays `absent`.

## /28 (medium, missing): difference quotients and the higher-order local embedding

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **What is built.** `TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient` (`TauCeti/Analysis/Sobolev/Translation.lean:132`) is only the direct estimate `‖u(·+h) − u‖_p ≤ ‖h‖‖∇u‖_p`. The converse, that uniformly bounded difference quotients give a weak derivative in `Lᵖ`, is absent.
  - The whole-tree search for "difference quotient" finds only generator difference quotients of semigroups and `dslope`.
  - It holds for `1 < p ≤ ∞` and fails for `p = 1`, where one gets BV (Evans §5.8.2, Theorem 3, cited, not read).
  - Hunter's proof of Theorem 4.27 uses exactly this step: "an L²(Ω′)-bound for the difference quotients … that is uniform in h, which implies that u ∈ H²(Ω′)".
- **The higher-order local embedding.** After Theorem 4.28, Hunter notes that "if the above conditions hold with k > n/2, then f ∈ C(Ω) and u ∈ C²(Ω)". That needs `W^{k,2}_loc ⊂ C^m` for `k > m + n/2`, or in general `W^{k,p}_loc ⊂ C^m` for `k − n/p > m`. A.4 plans only first-order embeddings.
- **After the pin.** Four Tau Ceti pull requests merged after `f790474`, checked through the GitHub API on 29 September 2026. They are not baseline evidence; the audit should be refreshed at the next baseline.
  - #6737 "bounded difference quotients give an L² weak derivative" (16 September);
  - #7354 "difference quotients of W^{1,p}(Ω) functions are bounded by the directional derivative" (18 September);
  - #7677 "translate weak derivatives and Sobolev difference quotients" (20 September);
  - #7834 "H² regularity of whole-space weak solutions by difference quotients" (21 September).

### What main says now
E.20, lines 301–302: "**Interior `H²`/`Hᵏ` estimates** via difference quotients … bootstrapping to `C^∞`". A.4, lines 227–229, plans only first-order embeddings. AUDIT-40 E.20: "No difference-quotient characterization of Sobolev membership exists".

### The fix
**Note for the Tau Ceti maintainer, README.**
1. Lane A, item 1, lines 216–219. After "(`∫ u ∂^α φ = (−1)^{|α|} ∫ (D^α u) φ` for all test `φ`)." add
   > Also the **difference-quotient characterization**, in the interior form. For `V ⋐ W`, `u ∈ Lᵖ(W)` with `1 < p ≤ ∞`, and `‖D_k^h u‖_{Lᵖ(V)} ≤ C` for `0 < |h| < dist(V, ∂W)/2`, the weak derivative `∂_k u` exists in `Lᵖ(V)` with `‖∂_k u‖_{Lᵖ(V)} ≤ C`. Conversely, `‖D_k^h u‖_{Lᵖ(V)} ≤ ‖∂_k u‖_{Lᵖ(W)}` for `1 ≤ p ≤ ∞`. The converse fails at `p = 1`.
2. Lane A, item 4: the `W^{k,p}_loc(Ω) ⊂ C^m(Ω)` bullet of the merged text in /2.
3. Lane E, item 20: "Consume item 1's difference-quotient characterization … and item 4's `W^{k,2}_loc ⊂ C^m`", in the merged text of /27.

**AUDIT-40.**
- Layer `PDE#milestone-e-20`: the target "Difference-quotient machinery for weak derivatives" gets the note "owned by layer a-1 (both directions, `1 < p ≤ ∞` for the converse); post-pin Tau Ceti PRs #6737, #7354, #7677 and #7834 add parts of it and whole-space `H²` regularity; refresh at the next baseline".
- Layer `PDE#milestone-a-1`: new target "Difference-quotient characterization of `W^{1,p}`, `1 < p ≤ ∞`, interior form": `absent`; declaration `TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient` (`Translation.lean:132`), fit related (direct direction only).
- Layer `PDE#milestone-a-4`: new target "`W^{k,p}_loc(Ω) ⊂ C^m(Ω)` for `k − n/p > m`": `absent`.

**Edges.** E37 (A.1 → E.20) and E38 (A.4 → E.20).

## /29 (medium, missing): boundary regularity is in the inventory but no stage plans it

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The sources.** Hunter, Theorem 4.30 (`ch4.pdf`, p. 115): "Suppose that Ω is a bounded open set in Rⁿ with C²-boundary. Assume that aij ∈ C¹(Ω̄) and f ∈ L²(Ω). If u ∈ H¹₀(Ω) is a weak solution …, then u ∈ H²(Ω)", "By use of a partition of unity and a flattening of the boundary". Theorem 4.31: `C^{k+2}` boundary, `aij ∈ C^{k+1}`, `f ∈ Hᵏ` give `H^{k+2}(Ω)`.
- **Nothing is built.** No boundary-regularity declaration exists at the pins.
- **The finding's two options for E.21.**
  - (i) Add the global `W^{2,p}` estimate on `C^{1,1}` domains. Its standard source is Gilbarg–Trudinger Theorem 9.15, which is not public, and it adds a large theorem to a roadmap whose owner has not asked for it.
  - (ii) State E.21 as interior-only and correct the inventory. I take (ii).

### What main says now
Inventory, lines 194–196: "interior and boundary `Hᵏ`/`Lᵖ` estimates (difference quotients, Calderón–Zygmund)". E.20: "**Interior `H²`/`Hᵏ` estimates**". E.21 states no boundary result.

### The fix
**Note for the Tau Ceti maintainer, README.**
1. Lane E, item 20: the boundary bullet of the merged text in /27.
2. Lane E, item 21: "interior estimates only", in the merged text of /30.
3. Inventory, lines 194–196. Replace "interior and boundary `Hᵏ`/`Lᵖ` estimates (difference quotients, Calderón–Zygmund);" with "interior and boundary `Hᵏ` estimates (difference quotients) and interior `Lᵖ` estimates (Calderón–Zygmund);".
4. `C^k` domains, local flattening and partitions of unity are in item 6 (merged text of /6).

**AUDIT-40, layer `PDE#milestone-e-20`.** New target "Boundary `H²`/`H^{k+2}` regularity for `u ∈ H¹_0(Ω)` on `C²`/`C^{k+2}` domains": `absent`.

**Edge.** E39 (A.6 → E.20).

## /30 (medium, missing): what E.21's VMO case needs

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The source.** arXiv:1511.03536, introduction (PDF, read 29 September 2026): "in 1993 Chiarenza-Frasca-Longo [9] proved W^{2,p} estimates under the mere assumption aij ∈ L^∞ ∩ VMO … Their technique is based on representation formulas of u_{xi xj} by means of singular integrals with variable kernels, and commutators of these singular integrals with BMO functions. Thanks to a deep real analysis theorem by Coifman-Rochberg-Weiss [10], these commutators have small operator norm on small balls".
  - **Attribution corrected.** The finding calls this article "Bramanti–Zhu". Its authors are Marco Bramanti and Marisa Toschi, *The sharp maximal function approach to Lᵖ estimates for operators structured on Hörmander's vector fields* (arXiv abstract page and PDF title page).
- **Uniformly continuous coefficients need none of the three inputs.** They are handled by freezing coefficients with the constant-kernel operators of B.10.
- **Placement.** The variable kernels belong with the CZ operators (B.10). The commutator theorem for BMO belongs with BMO (B.11). Its VMO small-ball corollary needs VMO, whose owner is B.11 after /12; so it sits in B.11 too, with no cycle.
- **No such declaration exists.** Whole-tree searches for "coifman", "commutator.*BMO" and "calder" find nothing relevant in either library.

### What main says now
E.21, lines 303–304: "then variable continuous/VMO coefficients"; B.10 and B.11 as quoted in /4 and /12.

### The fix
**Note for the Tau Ceti maintainer, README.**
1. B.10 (variable kernels) and B.11 (Coifman–Rochberg–Weiss, the VMO small-ball corollary): in the merged texts of /4 and /12.
2. Lane E, item 21, lines 303–304 (merged with /29 and /31). Replace
   > 21. **Calderón–Zygmund `W^{2,p}` estimates** for strong solutions (consume Lane B): the `Lᵖ` theory of `D²u` for `Δu = f`, then variable continuous/VMO coefficients.

   with
   > 21. **Calderón–Zygmund `W^{2,p}` estimates** for strong solutions of **non-divergence** equations (consume Lane B). Interior estimates only.
   >     - The `Lᵖ` theory of `D²u` for `Δu = f`.
   >     - Uniformly continuous `aⁱʲ`, by freezing coefficients; this needs only item 10's constant-kernel operators.
   >     - `aⁱʲ ∈ L^∞ ∩ VMO` (Chiarenza–Frasca–Longo). This consumes item 10's variable-kernel operators, and item 11's VMO and commutator theorem.
   >
   >     For divergence-form equations, continuous coefficients give `W^{1,p}`, not `W^{2,p}`. A global `W^{2,p}` estimate on `C^{1,1}` domains is not planned here.

**AUDIT-40.**
- Layer `PDE#milestone-b-10`: new target "CZ operators with variable kernels (homogeneous of degree `−n`, mean zero on spheres, smooth in `z` uniformly in `x`)": `absent`.
- Layer `PDE#milestone-b-11`: new target "The Coifman–Rochberg–Weiss commutator bound `‖[b,T]‖ ≤ C‖b‖_{BMO}` and its VMO small-ball corollary": `absent`.
- Layer `PDE#milestone-e-21`: the note of the VMO target adds "needs the variable-kernel operators (b-10), VMO and the commutator theorem (b-11)".

**Edges.** E42 (B.10 → E.21) and E43 (B.11 → E.21).

## /31 (medium, error): Schauder estimates without form, boundary or sign hypotheses

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **The counterexample.** `a(x) = 2 + |x|^{1/2}` on `[−1,1]` is `C^{0,1/2}` with `2 ≤ a ≤ 3`, and `u(x) = ∫₀ˣ ds/a(s)` satisfies `a u′ ≡ 1`, so `−(a u′)′ = 0`. But `(u′(h) − u′(0))/h = −|h|^{1/2}/(2h(2 + |h|^{1/2}))`, which tends to `∓∞` as `h → 0±`. So `u ∉ C²`; it is `C^{1,1/2}`.
- **The sources.** Fernández-Real and Ros-Oton, *Regularity Theory for Elliptic PDE*, arXiv:2301.01564v1 (PDF, read 29 September 2026):
  - **Theorem 2.20** (non-divergence): "aij(x) ∈ C^{0,α}(B1) … ‖u‖_{C^{2,α}(B1/2)} ≤ C(‖u‖_{L∞(B1)} + ‖f‖_{C^{0,α}(B1)})".
  - **Corollary 2.21:** `C^{k,α}` data and coefficients give `C^{k+2,α}`.
  - **Theorem 2.28** (divergence form): `aij ∈ C^{0,α}` and `f ∈ L^q`, `q ≥ n/(1−α)`, give a `C^{1,α}(B1/2)` estimate. **Corollary 2.29:** `C^{k,α}` coefficients give `C^{k+1,α}`.
  - **Theorem 2.35** (boundary regularity, for `Δ`): "let Ω be a bounded C^{k,α} domain", and Remark 2.36, "thanks to the maximum principle".
  - Ch. 4: "The continuity method is reasonably easy to use, but we need C^{2,α} estimates for solutions up to the boundary."
- **Classical solvability needs the sign condition.** It needs `c ≥ 0` in the form `Lu = −aⁱʲ∂ᵢⱼu + bⁱ∂ᵢu + cu` (Gilbarg–Trudinger's `c ≤ 0` in their sign, Theorem 6.14, cited, not read), because uniqueness and the a-priori `C⁰` bound come from the maximum principle.
- **The consumer.** OptimalTransport 6C (lines 842–846) uses the interior non-divergence bootstrap for `k ≥ 1`.

### What main says now
E.22, lines 305–307: "Interior and global `C^{2,α}` estimates for `C^{0,α}` coefficients (Lane B / Campanato approach), giving classical solvability of the Dirichlet problem in `C^{2,α}`." The standing rule (lines 58–59): "interior estimates do **not** need it, global ones do."

### The fix
**Note for the Tau Ceti maintainer, README Lane E, item 22, lines 305–307** (merged with /8). Replace
> 22. **Schauder estimates.** Interior and global `C^{2,α}` estimates for `C^{0,α}` coefficients (Lane B / Campanato approach), giving classical solvability of the Dirichlet problem in `C^{2,α}`.

with
> 22. **Schauder estimates** (Campanato approach, item 7). Constants depend visibly on `n, α, λ, Λ` and the coefficient norms.
>     - (a) *Interior, non-divergence form.* If `aⁱʲ, f ∈ C^{0,α}`, then `‖u‖_{C^{2,α}(B_{1/2})} ≤ C(‖u‖_{L^∞(B_1)} + ‖f‖_{C^{0,α}(B_1)})`. `C^{k,α}` data and coefficients give `C^{k+2,α}`; this is the bootstrap OptimalTransport 6C consumes.
>     - (b) *Interior, divergence form.* If `aⁱʲ ∈ C^{0,α}` and `f ∈ L^q`, `q ≥ n/(1−α)`, then `u ∈ C^{1,α}`; `C^{k,α}` coefficients give `C^{k+1,α}`. The result is **not** `C^{2,α}`: in dimension one, `a = 2 + |x|^{1/2}` and `u(x) = ∫₀ˣ ds/a(s)` solve `−(a u′)′ = 0`, and `u ∉ C²`.
>     - (c) *Global.* The `C^{2,α}(Ω̄)` estimate for `∂Ω ∈ C^{2,α}` and boundary data in `C^{2,α}(Ω̄)`.
>     - (d) *The method of continuity*, as its own functional-analytic node.
>     - (e) *Classical solvability* of the Dirichlet problem in `C^{2,α}(Ω̄)` for `Lu = −aⁱʲ∂ᵢⱼu + bⁱ∂ᵢu + cu` with `c ≥ 0`, from (c), (d) and item 13's maximum principle.

**AUDIT-40, layer `PDE#milestone-e-22`.**
- The target "Interior and global `C^{2,α}` Schauder estimates for `C^{0,α}` coefficients" becomes four targets, all `absent`: (a) interior non-divergence, with its higher-order form; (b) interior divergence form, `C^{1,α}`; (c) the global `C^{2,α}(Ω̄)` estimate on `C^{2,α}` domains; (d) the method of continuity.
- The target "Classical solvability of the Dirichlet problem in `C^{2,α}`" adds "with `c ≥ 0`, from (c), (d) and the maximum principle".

**E.21.** Its form discipline (`W^{2,p}` for non-divergence strong solutions; divergence form with continuous coefficients gives `W^{1,p}`) is in the merged text of /30.

**Edges.** E44 (A.7 → E.22), E45 (C.13 → E.22) and E71 (E.22 → OptimalTransport 6C).

## /32 (high, error): De Giorgi–Nash–Moser already has a Lean formalization

### What the verifier corrected
- **The roadmap side holds.**
  - E.23 is planned as a build from scratch.
  - The References name the Carleson project only.
  - A search of the README for DeGiorgi, Armstrong or Kempe finds nothing.
  - The Acknowledgements credit a Zulip experiment.
- **Tau Ceti itself adapts that code.** `TauCeti/Analysis/Calculus/SegmentIncrement.lean:87–89` and `TauCeti/MeasureTheory/Integral/NormRpow.lean:38–40` cite "Scott Armstrong and Julia Kempe's Apache-2.0 `scottnarmstrong/DeGiorgi/DeGiorgi/Poincare.lean`, commit `4c1b3077d3782b24065184df4ba59501b2e56fc7`".
- **The verifier did not reach the network.** I did.

### Read for this fix (29 September 2026)
- **The paper.** arXiv:2604.05984, S. Armstrong and J. Kempe, *Formalization of De Giorgi–Nash–Moser Theory in Lean*, v1, submitted 7 April 2026. Abstract: "The formalized results include local boundedness of weak subsolutions, the weak Harnack inequality for positive weak supersolutions, Moser's Harnack inequality for positive weak solutions, and interior Hölder regularity."
- **The repository.** `github.com/scottnarmstrong/DeGiorgi` at commit `4c1b3077d3782b24065184df4ba59501b2e56fc7` (committed 8 April 2026; licence Apache-2.0, read through the GitHub API):
  - `README.md`: "fully formalized, sorry-free, and axiom-free beyond Lean and Mathlib"; "in dimension `d ≥ 3`, with the formal statements presented in the normalized and rescaled forms"; headline theorems `linfty_subsolution_DeGiorgi_normalized`, `weak_harnack`, `weak_harnack_on_ball`, `harnack`, `harnack_of_homogeneousWeakSolution`, `holder_Moser`, `holder_Moser_of_homogeneousWeakSolution`.
  - `DeGiorgi/Holder/PublicEstimate.lean:21–27`: `holder_Moser (hd : 2 < (d : ℝ)) (A : NormalizedEllipticCoeff d (Metric.ball (0 : E) 1)) … (hsol : IsSolution A.1 u)`.
  - `DeGiorgi/EllipticCoefficients.lean:73–74`: `NormalizedEllipticCoeff d Ω := {A : EllipticCoeff d Ω // A.lam = 1}`.
  - `DeGiorgi/WeakFormulation/SolutionInterfaces.lean:38–56`: `IsSolution A u := IsSubsolution A u ∧ IsSupersolution A u`, for the homogeneous equation `−div(A∇u) = 0`. (A `WeakProblem` with a right-hand side exists at `:31`, but the headline estimates take `IsSolution`.)
  - `DeGiorgi/Oscillation/{Campanato, BMO, LocalJohnNirenberg}.lean`; `campanato_implies_holder` is at `Campanato.lean:1025`.

So the finding's scope statement holds: `d ≥ 3`, `λ = 1`, the unit ball, and the homogeneous principal-part equation.

### A correction to the fix: the right-hand side
The finding's node 5 adds "`bⁱ, c ∈ L^∞` and a right-hand side `f`, as the v1 `IsWeakSolution L u f` requires". That is not enough: Hölder continuity needs integrability of `f` above `L^{n/2}`, and `f ∈ L²` fails once `n ≥ 5`.
- **The counterexample.** Take `0 < β < n/2 − 2` and `u = |x|^{−β}` on the unit ball.
  - `−Δu = β(n − 2 − β)|x|^{−β−2}`, which is in `L²` because `2(β + 2) < n`.
  - `∇u` is in `L²`, because `2(β + 1) < n`.
  - Since `β + 1 < n`, the distributional Laplacian has no mass at `0`, so `u` is a weak solution.
  - Yet `u` is unbounded.
- **The standard hypothesis** for a zero-order datum is `f ∈ L^q` with `q > n/2` (Gilbarg–Trudinger, Theorems 8.17 and 8.22–8.24, cited, not read).
- **The README's own sketch** (lines 44–46, `weakSolution_holderOn (hu : IsWeakSolution L u f)`) inherits the same gap.

**Dimensions 1 and 2** need no new theory: for a solution in `d = 2`, `U(x, x₃) = u(x)` solves the equation with coefficients `diag(A, 1)` in `d = 3`, and Hölder continuity passes back.

### What main says now
E.23, lines 308–313: "⚠ This is *the* hard theorem of the lane, so budget for it accordingly". References, lines 374–376: the Carleson project only. AUDIT-40 E.23: "`grep -rn -i 'de giorgi\|moser iteration\|nash.moser'` over both trees returns nothing". That pattern, with a space, misses the two `DeGiorgi` citations at the pin.

### The fix
**Note for the Tau Ceti maintainer, README.**
1. Lane E, item 23, lines 308–313 (merged with /23 and /24). After "note it is **divergence-form/weak**, whereas the non-divergence analogue is Krylov–Safonov." add
   > **Vendor rather than build.** Armstrong–Kempe (arXiv:2604.05984; `scottnarmstrong/DeGiorgi`, Apache-2.0, commit `4c1b3077`) formalize, sorry-free, local boundedness, weak Harnack, Harnack and interior Hölder regularity (`linfty_subsolution_DeGiorgi_normalized`, `weak_harnack`, `harnack`, `holder_Moser`). Their scope: dimension `d ≥ 3`, `λ = 1`, the unit ball, and the homogeneous principal-part equation. Tau Ceti already adapts code from its `DeGiorgi/Poincare.lean` in two files. Nodes:
   > 1. port its Sobolev and weak-solution layer onto Tau Ceti's `W1p`/`HasWeakFDerivOn` and the energy form of Lane D, proving that its `IsSolution` agrees with the Tau Ceti weak-solution predicate;
   > 2. import the four theorems;
   > 3. extend to general `0 < λ ≤ Λ`, balls `B_R(x₀)` and compact `K ⊂ Ω`, by scaling, translation and covering;
   > 4. extend to dimensions `1` and `2`, for instance by adding dummy variables, which keeps divergence form and ellipticity;
   > 5. add lower-order terms `bⁱ, c ∈ L^∞` and a right-hand side `f ∈ L^q(Ω)` with `q > n/2`.
   >
   > ⚠ `f ∈ L²` is not enough once `n ≥ 5`: for `0 < β < n/2 − 2`, `u = |x|^{−β}` solves `−Δu = f` weakly on the unit ball with `f = β(n−2−β)|x|^{−β−2} ∈ L²`, and is unbounded.
   >
   > This item also owns the Harnack inequality for nonnegative weak solutions of divergence-form equations (not item 14's), and the strong maximum principle for `W^{1,2}` subsolutions, as a corollary of the weak Harnack inequality (item 13).
2. The v1 sketch, lines 45–46. Replace
   > -- theorem weakSolution_holderOn (hu : IsWeakSolution L u f) (hcompact : K ⊆ Ω) (hK : IsCompact K) :

   with
   > -- theorem weakSolution_holderOn (hu : IsWeakSolution L u f) (hf : MemLp f q) (hq : n / 2 < q)
   > --     (hcompact : K ⊆ Ω) (hK : IsCompact K) :
3. References, after the Carleson-project bullet (lines 374–376), add
   > - S. Armstrong, J. Kempe, *Formalization of De Giorgi–Nash–Moser Theory in Lean*, arXiv:2604.05984 (2026), and the Lean project <https://github.com/scottnarmstrong/DeGiorgi> (Apache-2.0): the source to vendor Lane E.23 from, together with the local Campanato, BMO and John–Nirenberg files (items 7 and 11).

**AUDIT-40, layer `PDE#milestone-e-23`.**
- The note of the target "Local boundedness of weak solutions of divergence-form equations with bounded measurable coefficients" becomes: "Absent from both pinned libraries. The search pattern 'de giorgi' misses the two Tau Ceti citations of the external supplier (`Calculus/SegmentIncrement.lean:87–89`, `MeasureTheory/Integral/NormRpow.lean:38–40`, adapted from `scottnarmstrong/DeGiorgi` at `4c1b3077`). That Apache-2.0 Lean project (arXiv:2604.05984) proves local boundedness, weak Harnack, Harnack and interior Hölder regularity, for `d ≥ 3`, `λ = 1`, the unit ball and homogeneous equations."
- The same supplier note goes on the Hölder-continuity and Harnack targets.
- The verdict stays "not built": the pinned libraries do not contain it.

## /34 (medium, library-claim): Bochner spaces are Mathlib's, and the time derivative is Tau Ceti's

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Read at the pin
- **Mathlib:**
  - `MeasureTheory.Lp` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89`), for any `NormedAddCommGroup E`;
  - `MeasureTheory.Lp.instCompleteSpace` (`LpSpace/Complete.lean:378`);
  - `MeasureTheory.L2.innerProductSpace` (`Mathlib/MeasureTheory/Function/L2Space.lean:190`);
  - `MeasureTheory.Lp.SecondCountableTopology` (`Mathlib/MeasureTheory/Measure/SeparableMeasure.lean:427`: `[IsSeparable μ] [SeparableSpace E]`, `1 ≤ p < ∞`).
- **Tau Ceti.** `TauCeti.HasWeakLineDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv.lean:200`), with `E, F` any real normed spaces (`:159`), is `CompleteSpace F ∧ LocallyIntegrableOn u Ω μ ∧ LocallyIntegrableOn u′ Ω μ ∧ ∀ φ : 𝓓(Ω, ℝ), ∫ lineDeriv ℝ φ x v • u x ∂μ = −∫ φ x • u′ x ∂μ`.
  - With `E = ℝ`, `Ω = (0,T)`, `v = 1` and `F = StrongDual ℝ V` (complete), this is exactly "`u′` is the weak time derivative of `u`".
  - `HasWeakLineDerivOn.ae_eq` (`:601`) gives uniqueness a.e., under `[FiniteDimensional ℝ E]` for the domain `E = ℝ` only.
- **The consumer.** Hunter §6.3 (`ch6.pdf`, p. 180, (6.14)) defines the weak time derivative the same way ("a direct generalization of the notion of the weak derivative of a real-valued function").
- **One detail the finding leaves implicit.** For `u ∈ L²(0,T;V)`, the derivative is taken of `ι ∘ u` with `ι : V ↪ H ↪ V*` the Gelfand embedding, which is injective because `V` is dense in `H`.

### What main says now
Inventory, lines 199–201: "Bochner spaces `L²(0,T;H)`, the Gelfand triple …". F.24, lines 317–319 (quoted below). AUDIT-40 F.24: `H¹(0,T;V*)` "Absent. Tau Ceti's `Wkp` is a scalar-valued space …; there is no Banach-valued Sobolev space in one time variable."

### The fix
**Note for the Tau Ceti maintainer, README.**
1. Lane F, item 24, lines 317–319. Replace
   > 24. **Bochner spaces and the Gelfand triple.** `L²(0,T;V)`, `H¹(0,T;V*)`, the triple `V ↪ H ↪ V*` (consume the Bochner integral), and the integration-by-parts/embedding `L²(V) ∩ H¹(V*) ↪ C([0,T];H)`.

   with
   > 24. **Bochner spaces and the Gelfand triple.**
   >     - `L²(0,T;V)` is Mathlib's `MeasureTheory.Lp V 2 (volume.restrict (Set.Ioo 0 T))`: complete for complete `V`, a Hilbert space for an inner-product `V` (`MeasureTheory.L2.innerProductSpace`), separable for separable `V` (`Lp.SecondCountableTopology`). Consume it; build nothing.
   >     - `H¹(0,T;V*)` and `W(0,T) = {u ∈ L²(0,T;V) : u′ ∈ L²(0,T;V*)}` use item 1's weak derivative with `E = ℝ`, `Ω = (0,T)`, `F = StrongDual ℝ V` and `v = 1` (`TauCeti.HasWeakLineDerivOn`, unique a.e. by `HasWeakLineDerivOn.ae_eq`), applied to `u` composed with `V ↪ V*`. Define no new time-derivative notion.
   >     - The triple `V ↪ H ↪ V*`, with `V ↪ H` continuous, injective and dense.
   >     - Build the embedding `W(0,T) ↪ C([0,T];H)` and the energy identity `d/dt ‖u‖²_H = 2⟨u′, u⟩`.
2. Inventory, lines 199–201 (merged with /37). Replace
   > - **Parabolic & evolution equations:** Bochner spaces `L²(0,T;H)`, the Gelfand triple `V ↪ H ↪ V*`, the **Galerkin method**, existence for linear parabolic equations, the parabolic maximum principle, the **heat semigroup** and **Hille–Yosida**.

   with
   > - **Parabolic & evolution equations:** the Gelfand triple `V ↪ H ↪ V*` and the time-interval API over Mathlib's Bochner `Lp` (the spaces themselves are Mathlib's), the **Galerkin method**, existence for linear parabolic equations, the parabolic maximum principle, and the concrete **heat semigroups**. The abstract semigroup theory, Hille–Yosida and Lumer–Phillips are imported from the [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md).

**AUDIT-40, layer `PDE#milestone-f-24`.**
- Target "Bochner spaces `L²(0,T;V)` for a Banach space `V`": add `MeasureTheory.L2.innerProductSpace` (`L2Space.lean:190`) and `MeasureTheory.Lp.SecondCountableTopology` (`SeparableMeasure.lean:427`), fit related.
- Target "`H¹(0,T;V*)`, the vector-valued Sobolev space in time": add `TauCeti.HasWeakLineDerivOn` (`WeakDeriv.lean:200`) and `TauCeti.HasWeakLineDerivOn.ae_eq` (`:601`), fit related. Its note becomes: "The weak time derivative is `HasWeakLineDerivOn` with `E = ℝ` and `F = StrongDual ℝ V`; the space `W(0,T)` and its API are absent."

**Edge.** E52 (A.1 → F.24).

## /35 (medium, missing): the Galerkin ODE has measurable coefficients

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **Mathlib's `IsPicardLindelof` needs continuity in time.** Field `continuousOn : ∀ x ∈ closedBall x₀ a, ContinuousOn (f · x) (Icc tmin tmax)` (`Mathlib/Analysis/ODE/PicardLindelof.lean:79–84`). AUDIT-40 cites `IsPicardLindelof.exists_eq_forall_mem_Icc_eq_picard` (`:720`) as the input, which does not apply.
- **Tau Ceti's ODE files do not help.** `TauCeti/Analysis/ODE/` has seven files: exponential dichotomy, globally Lipschitz autonomous solutions, initial-condition dependence, flows of bounded linear operators, regularity, smooth parameter dependence and uniform time. None treats a vector field measurable in time.
- **Hunter (`ch6.pdf`, read 29 September 2026).**
  - Assumption 6.1 (p. 179): "Ω ⊂ Rⁿ is bounded and open, T > 0, and: (1) … aij, bj, c ∈ L∞(Ω × (0, T)); (2) aij = aji … and the uniform ellipticity condition (6.6) holds …; (3) f ∈ L²(0, T; H⁻¹(Ω)) and g ∈ L²(Ω)".
  - Definition 6.2 gives the solution concept.
  - Proposition 6.5 (p. 184): "We give the proof since the coefficient functions in (6.21) are bounded but not necessarily continuous functions of t. This is, however, sufficient since the ODE is linear." (6.22): `A ∈ L∞(0,T; R^{N×N})`, `f ∈ L²(0,T; R^N)`. The proof is a contraction on `C([0,T*]; R^N)` when `M T* < 1`.
- **A small inconsistency in the source.** Hunter's Theorem 6.3 writes "g ∈ H¹₀(Ω)", while his Assumption 6.1 and the theorem's own estimate use only `‖g‖_{L²}`. I follow the Assumption: `u₀ ∈ L²(Ω)` suffices.
- **The parabolic maximum principle** (Evans §7.1.4, cited, not read):
  - for `u ∈ C²₁(Ω_T) ∩ C(Ω̄_T)` with `u_t + Lu ≤ 0`, `L` in non-divergence form, the maximum over `Ω̄_T` is attained on the parabolic boundary `Γ_T` when `c ≡ 0`;
  - `max_{Ω̄_T} u ≤ max_{Γ_T} u⁺` when `c ≥ 0`;
  - Hunter's introduction to Ch. 6 (p. 177) gives the heat-equation case `max u ≤ max{0, max g}` for `f ≤ 0`.

### What main says now
F.25, lines 320–323: "The **Galerkin method**: finite-dimensional approximation (consume ODE existence), energy estimates, weak-compactness passage to the limit, giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`. The parabolic maximum principle."

### The fix
**Note for the Tau Ceti maintainer, README Lane F, item 25, lines 320–323.** Replace
> 25. **Linear parabolic existence.** The **Galerkin method**: finite-dimensional approximation (consume ODE existence), energy estimates, weak-compactness passage to the limit, giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`. The parabolic maximum principle.

with
> 25. **Linear parabolic existence.**
>     - **Hypotheses** (Hunter, *Notes on PDEs*, Assumption 6.1): `Ω` bounded open, `T > 0`; `aⁱʲ, bⁱ, c ∈ L^∞(Ω × (0,T))`, `aⁱʲ = aʲⁱ`, uniformly elliptic; `f ∈ L²(0,T; H^{−1}(Ω))`, `u₀ ∈ L²(Ω)`; `u = 0` on `∂Ω × (0,T)`.
>     - **Solution concept.** `u ∈ L²(0,T; H¹_0(Ω))` with `u′ ∈ L²(0,T; H^{−1}(Ω))`, `⟨u′, v⟩ + a(u, v; t) = ⟨f, v⟩` for all `v ∈ H¹_0(Ω)` and a.e. `t`, and `u(0) = u₀` in the `C([0,T]; L²)` sense of item 24.
>     - **The Galerkin method**: finite-dimensional approximation, energy estimates, and the weak-compactness passage to the limit, giving existence and uniqueness.
>     - **Its ODE step is not Picard–Lindelöf**, because Mathlib's `IsPicardLindelof` needs continuity in time. Build the linear Carathéodory theorem: for `A ∈ L^∞(0,T; ℝ^{N×N})` and `F ∈ L¹(0,T; ℝᴺ)`, the equation `x(t) = x₀ − ∫₀ᵗ A x + ∫₀ᵗ F` has a unique continuous solution, which is absolutely continuous with `x′ = −Ax + F` a.e. The proof is a contraction on `C([0,T*]; ℝᴺ)` when `T*‖A‖_∞ < 1`, repeated (Hunter, Proposition 6.5).
>     - **The parabolic maximum principle**, for classical subsolutions `u ∈ C²₁(Ω_T) ∩ C(Ω̄_T)` of `u_t + Lu ≤ 0` with `L` in non-divergence form. The maximum over `Ω̄_T` is attained on the parabolic boundary `Γ_T` when `c ≡ 0`, and `max_{Ω̄_T} u ≤ max_{Γ_T} u⁺` when `c ≥ 0`. A weak-solution version is a separate node.

**AUDIT-40, layer `PDE#milestone-f-25`.**
- Target "The Galerkin method: finite-dimensional approximation, energy estimates, weak-compactness limit": the declaration `IsPicardLindelof.exists_eq_forall_mem_Icc_eq_picard` keeps fit related, and the note adds "it does not apply: the Galerkin system has coefficients only `L^∞` in time, and `IsPicardLindelof` requires continuity in time (`PicardLindelof.lean:79–84`)".
- New target "Linear ODE `x′ = −A(t)x + F(t)` with `A ∈ L^∞`, `F ∈ L¹`: unique absolutely continuous solution": `absent`.

(The separability of `H¹_0(Ω)`, the `ℕ`-indexed Galerkin basis and weak sequential compactness in a separable Hilbert space are the low finding /36, out of scope; /21 supplies the `ℕ`-indexed basis.)

## /37 (high, duplicate): F.26 re-plans the built semigroup theory

### What the verifier corrected
- **The duplication is real.** PDE's declared prerequisite is `tauceti:TauCetiRoadmap/OneParameterSemigroups`, which carries a stage "Milestone — Hille–Yosida generation theorem". The PDE document never mentions it, yet lists "the **heat semigroup** and **Hille–Yosida**" as build-here.
- **High severity is right.**

### Read at the pin
- `TauCeti.Semigroups.StronglyContinuousSemigroup` (`TauCeti/Analysis/Semigroups/Basic.lean:41`) and its `generator` (`Generator/Basic.lean:113`).
- `hilleYosida_generation` (`Generation/HilleYosida/Generation.lean:205`) and `hilleYosida_generation_iff` (`:217`).
- `IsMDissipative.exists_contractionSemigroup_generator_eq` (`Generation/LumerPhillips.lean:86`): "A densely defined m-dissipative operator on a real Banach space generates a strongly continuous contraction semigroup" (`[NormedSpace ℝ X] [CompleteSpace X]`, `:52`).
- `StronglyContinuousSemigroup.isClassicalSolution_realOperator` (`CauchyProblem.lean:132`) and `isMildSolution_realOperator` (`:149`).
- `isDissipative_iff_real_inner_nonpos` (`Dissipative/Hilbert.lean:53`).
- Mathlib has no C₀-semigroup.
- The reviewed OneParameterSemigroups link map already recommends: "Rescope PDE F.26 to concrete heat carriers, dense domains/cores, resolvent estimates, boundary conditions, kernels and smoothing." So does OptimalTransport, lines 1972–1974: "PDE Lane F.26 should consume that theorem for its concrete heat realization rather than build a competing abstract API".

### What main says now
F.26, lines 324–325: "The **heat semigroup**, generators, and **Hille–Yosida**". Inventory, line 201: "the **heat semigroup** and **Hille–Yosida**". The README never mentions OneParameterSemigroups.

### The fix
- **README:** F.26 in the merged text of /38 (import list, then the concrete heat semigroups); the inventory line in /34.
- **AUDIT-40:** no change; layer F.26 already marks C₀-semigroups and Hille–Yosida built and lists both OneParameterSemigroups stages as duplicates.
- **Edges.**
  - Part A → F.26 and Hille–Yosida → F.26 are already recorded, in the promoted OneParameterSemigroups link map and the assembled atlas.
  - Add E60 (Lumer–Phillips → F.26) and E61 (abstract Cauchy problem → F.26).

## /38 (medium, missing): the concrete heat semigroups

### What the verifier corrected
Nothing beyond confirming the quotations and citations.

### Checked
- **Nothing concrete is built.** No `LinearPMap` occurs in `TauCeti/Analysis/PDE` or `TauCeti/Analysis/Sobolev`. `dirichletSolutionOperator` (`Spectrum.lean:146`) is the bounded compact inverse only. The whole-tree search for heat kernel or heat semigroup finds nothing. Mathlib has `fourier_gaussian_innerProductSpace` (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:352`).
- **(a) The form operator.** The operator associated with a bounded form satisfying Gårding's inequality on `V ↪ H` has domain `{u ∈ V : ∃ g ∈ H, a(u,v) = ⟨g,v⟩ ∀ v}` and `Au := −g`, and that domain is dense.
  - `A − γ` is dissipative when `a(u,u) + γ‖u‖² ≥ 0`.
  - `λ − (A − γ)` is onto for `λ > 0` by Lax–Milgram for the coercive form `a + (λ + γ)⟨·,·⟩`.
  - So Lumer–Phillips (real Hilbert space) gives `‖e^{tA}‖ ≤ e^{γt}`.
- **Correction: the generator on `Lᵖ(ℝⁿ)`.** The finding says the Gaussian semigroup on `Lᵖ(ℝⁿ)`, `1 ≤ p < ∞`, comes "and its generator".
  - The generator is the closure of `Δ` on `𝓢(ℝⁿ)`: `𝓢` is dense and invariant, so it is a core.
  - Its domain is `H²(ℝⁿ)` for `p = 2` (Fourier).
  - It is `W^{2,p}` for `1 < p < ∞` only through the Calderón–Zygmund estimate (item 21).
  - For `p = 1` it is strictly larger than `W^{2,1}`.
  - So the domain identification must not be stated without E.21.
- **Strong continuity.** The semigroup is not strongly continuous on `L^∞`.
- **Smoothing.** `‖∇ᵏ(Φ_t * f)‖_q ≤ C t^{−k/2 − (n/2)(1/p − 1/q)}‖f‖_p` for `1 ≤ p ≤ q ≤ ∞` follows from Young's inequality with `‖∇ᵏΦ_t‖_r = C t^{−k/2 − (n/2)(1 − 1/r)}`, `1 + 1/q = 1/p + 1/r`.

### What main says now
F.26, lines 324–325: "The **heat semigroup**, generators, and **Hille–Yosida**; the heat kernel on `ℝⁿ` (consume the Fourier transform) and the smoothing estimates." No carrier space, realization or boundary condition is named.

### The fix
**Note for the Tau Ceti maintainer, README Lane F, item 26, lines 324–325** (merged with /37). Replace
> 26. **Semigroups.** The **heat semigroup**, generators, and **Hille–Yosida**; the heat kernel on `ℝⁿ` (consume the Fourier transform) and the smoothing estimates.

with
> 26. **Heat semigroups** (concrete realizations).
>
>     The abstract theory is **built** in the [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md). Import `StronglyContinuousSemigroup` and its `generator`, Hille–Yosida (`hilleYosida_generation`, `hilleYosida_generation_iff`), Lumer–Phillips (`IsMDissipative.exists_contractionSemigroup_generator_eq`) and the abstract Cauchy problem (`isClassicalSolution_realOperator`, `isMildSolution_realOperator`). Build no competing API.
>
>     Build here:
>     - (a) **The form operator.** The operator associated with a bounded form on `V ↪ H` satisfying Gårding's inequality (item 16), as a `LinearPMap` with the dense domain `{u ∈ V : ∃ g ∈ H, a(u,v) = ⟨g,v⟩ ∀ v ∈ V}`, `Au = −g`. Prove dissipativity of the shifted operator, and the range condition by Lax–Milgram (item 17).
>     - (b) **The Dirichlet heat semigroup** on `L²(Ω)`, through Lumer–Phillips (`‖e^{tA}‖ ≤ e^{γt}`), with the eigenfunction expansion `e^{tA_D}f = Σ_k e^{−λ_k t}⟨f, φ_k⟩φ_k` for a symmetric form (item 19).
>     - (c) **The Gaussian semigroup.** The heat kernel `Φ_t(x) = (4πt)^{−n/2} e^{−|x|²/(4t)}` and the semigroup `f ↦ Φ_t * f` on `Lᵖ(ℝⁿ)`, `1 ≤ p < ∞` (it is not strongly continuous on `L^∞`), consuming Mathlib's `fourier_gaussian_innerProductSpace`. Its generator is the closure of `Δ` on `𝓢(ℝⁿ)`, with domain `H²(ℝⁿ)` for `p = 2`; the domain is `W^{2,p}` for `1 < p < ∞` only after item 21.
>     - (d) **The smoothing estimates** `‖∇ᵏ(Φ_t * f)‖_{L^q} ≤ C t^{−k/2 − (n/2)(1/p − 1/q)} ‖f‖_{L^p}`, `1 ≤ p ≤ q ≤ ∞`.
>     - (e) **Agreement** of the semigroup (mild) solution with item 25's weak solution for `f = 0`.

**AUDIT-40, layer `PDE#milestone-f-26`.** Replace the target "The heat semigroup and the heat kernel on `ℝⁿ`, with smoothing estimates" (absent) by five targets, all `absent`:
- (a) the form operator as a `LinearPMap`, with dissipativity and the range condition;
- (b) the Dirichlet heat semigroup on `L²(Ω)` and its eigenfunction expansion;
- (c) the Gaussian semigroup on `Lᵖ(ℝⁿ)`, `1 ≤ p < ∞`, and its generator (declaration `fourier_gaussian_innerProductSpace`, `Gaussian/FourierTransform.lean:352`, fit related);
- (d) the smoothing estimates;
- (e) agreement with the weak parabolic solution.

**Edges.** E57 (D.17 → F.26), E58 (D.19 → F.26) and E59 (F.25 → F.26). The OptimalTransport consumers are E72–E74.

## Findings out of scope (noted only)

The issue lists the high and medium findings only. These nine low findings are confirmed but not in scope, and nothing above applies them:
- **/10**: AUDIT-40's `C1HolderSpace` fit, and its domain-relativity note on `HolderSpace`. /9's A.7 text agrees with the finding's facts.
- **/13**: FoundationsAndLibraryIntegration:LI.2 lists Sobolev spaces.
- **/14**: the potential estimate as a Morrey input in AUDIT-40 A.4.
- **/15**: the stale names `memSobolev` and `memSobolev_two_iff_fourier`, README lines 91 and 131. The real declarations are `TemperedDistribution.MemSobolev` (`Sobolev.lean:149`) and `memSobolev_iff_exists_smulLeftCLM_fourier` (`:218`); /7's text uses the real names.
- **/16**: one weak-type vocabulary shared with the Carleson project.
- **/25**: a private Mathlib lemma cited in AUDIT-40 C.15.
- **/33**: AUDIT-40's duplicate entries on E.21 and E.22 read as consumer relations. E71 records the E.22 → OptimalTransport 6C relation as an edge, for /31.
- **/36**: the separability of `H¹_0`, the `ℕ`-indexed Galerkin basis, and weak compactness in separable Hilbert spaces.
- **/39**: OptimalTransport 13C's own heat kernel. E74 records F.26 → 13C for /26.

## Sources read
- **Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`** (the pinned baseline trees and their declaration index), read 29 September 2026. Every file and line cited above, with the hypotheses in scope.
- **J. K. Hunter**, *Notes on Partial Differential Equations*, UC Davis, revised 6/18/2014, read 29 September 2026 (text extracted with pdftotext):
  - https://www.math.ucdavis.edu/~hunter/pdes/ch2.pdf (Theorems 2.22, 2.25);
  - https://www.math.ucdavis.edu/~hunter/pdes/ch4.pdf (§4.2, Theorems 4.24, 4.25, 4.27, 4.28, 4.30, 4.31, §4.13);
  - https://www.math.ucdavis.edu/~hunter/pdes/ch6.pdf (Assumption 6.1, Definition 6.2, Theorem 6.3, Proposition 6.5, (6.14)–(6.16));
  - https://www.math.ucdavis.edu/~hunter/pdes/pde_notes.pdf (Appendix 4.A, p. 120).
- **X. Fernández-Real and X. Ros-Oton**, *Regularity Theory for Elliptic PDE*, arXiv:2301.01564v1, https://arxiv.org/abs/2301.01564, PDF read 29 September 2026 (Theorems 2.20, 2.28, 2.35, Corollaries 2.21, 2.29, Remarks 2.36, 3.18, Ch. 4 on the continuity method).
- **M. Bramanti and M. Toschi**, *The sharp maximal function approach to Lᵖ estimates for operators structured on Hörmander's vector fields*, arXiv:1511.03536v1, https://arxiv.org/abs/1511.03536, PDF read 29 September 2026 (introduction).
- **S. Armstrong and J. Kempe**, *Formalization of De Giorgi–Nash–Moser Theory in Lean*, arXiv:2604.05984v1, https://arxiv.org/abs/2604.05984 (abstract and submission history), read 29 September 2026.
- **The Lean project** https://github.com/scottnarmstrong/DeGiorgi at commit `4c1b3077d3782b24065184df4ba59501b2e56fc7` (via the GitHub API, 29 September 2026): `README.md`, `DeGiorgi/Holder/PublicEstimate.lean`, `DeGiorgi/EllipticCoefficients.lean`, `DeGiorgi/Oscillation/Campanato.lean`, `DeGiorgi/WeakFormulation/SolutionInterfaces.lean`, and the file tree.
- **Upstream `TauCetiProject/TauCetiRoadmap`**, `TauCetiRoadmap/PDE/README.md` and its commit history (GitHub API, 29 September 2026). **Tau Ceti pull requests #6737, #7354, #7677 and #7834** (GitHub API, 29 September 2026; after the pin, not used as baseline evidence).
- **Cited but not read here** (not public, or not needed beyond the statements given): Evans, *Partial Differential Equations* (§§2.2.4, 5.8.2, 6.3.1, 6.4.2, 7.1); Gilbarg–Trudinger (Lemma 7.16, (7.45), Theorems 6.14, 8.1, 8.17–8.24, 9.15); the Carleson project's `czOperator_weak_1_1`, as the red team read it.
