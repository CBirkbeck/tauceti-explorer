# REV-DESIGN-ModularFormsPartII

Independent review of Codex's DESIGN-ModularFormsPartII (session `codex-ceFtgT`, PR #10481), issue #3573.
Reviewer: Claude (session `claude-HAvIjQ`), 19 October 2026.
Verdict: **accepted**, after in-place corrections.

The design is careful about the mathematics of Calegari–Dimitrov–Tang (CDT25). Its signed-level bookkeeping, the
unsigned-domain repair of the reduction kernel, and the effective-span reading of Mason's corollary are all right.
Its main defects concern ownership. The design re-planned mathematics that three other atlas roadmaps already plan,
and it recorded as missing two suppliers that already existed under other identifiers. Both kinds of defect were
corrected here rather than sent back.

## What was read

- CDT25, the published author offprint (SHA-256 `867026fb…`, matching the packet). Read: pp.627–632; Proposition 3.0.1
  pp.649–651; §4 in full, pp.652–666; the statements of Theorem 5.1.4 (pp.667–668) and Example 5.1.22 (p.673); §6.3,
  pp.685–686; §7 in full, pp.686–697. The latest arXiv version (2109.09040, SHA-256 `9bffb129…`) was compared at the
  same locators.
- KSV10 (arXiv:0905.4798v4, SHA-256 matching): Lemma 7, the proof of Proposition 3 and Remark 8, pp.4–6.
- Upstream READMEs at their pull-request heads, for every supplier that has gone to TauCetiRoadmap:
  - ModularCurvesPartII #913 (2f3a763), Layers 5, 6, 8, 11 and 15;
  - DiophantineApproximationAndTranscendence #855 (0d1c47b, merged), §§5.2–5.3;
  - AlgebraicModularFormsAndSerreWeights #928;
  - ArithmeticGaloisDuality #858;
  - ArithmeticGaloisRepresentations #856, §7.7;
  - InverseGaloisAndArithmeticFundamentalGroups #850;
  - AutomorphicGaloisRepresentations #1007, §4.2.
- TauCetiRoadmap main at 0d144d0: ModularForms, FuchsianOrbifolds, ConformalMapping and BelyiMaps.
- Atlas packets read: ModularCurvesPartII (R12.1, R13.3, R13.4a, R14.3 files), DiophantineApproximationAndTranscendencePartII,
  ConformalMappingPartII and QSeriesPartitionsAndMockModularForms.
- All 28 baseline declarations were read in the pinned Mathlib 082e2d3 and Tau Ceti f790474 sources.
- Every explicit identity was recomputed with exact rational q-series arithmetic:
  - the expansions of λ/16 and of its inverse, including the coefficient 12514;
  - K₀(λ/16)=θ₃²;
  - the E–K relation, the q-series of E₀ and its theta quotient;
  - Zudilin's Catalan identity, through q¹¹;
  - the product formula for h, and the denominators of h^{1/5} and h^{1/24};
  - the Kummer coordinate x₃;
  - the 2-adic and 3-adic Fermat valuations;
  - the matrices of the invisible-summand example;
  - the N=2 and N=3 conformal radii.

  All agree with the packet.

## Counts

| | Design | After review |
| --- | ---: | ---: |
| Nodes | 82 | 63 (19 removed as owned elsewhere, 3 moved from W5 to W4, none added) |
| Definitions / constructions / theorems | 12 / 3 / 67 | 9 / 2 / 52 |
| API items / unit tests | 63 / 59 | 47 / 45 (one API item and one test added to W1/bounded-denominators) |
| Planets | 42 | 35 |
| Baseline declarations | 28 | 26 (two no longer cited by any node) |
| Gaps | 13 | 5 (MODEL, NF, GLOCAL, LOCALGLOBAL, NERON) |
| Requests | 16 | 14 |
| Source findings | 15 | 18, all confirmed |

Checked list: 37 nodes verified, 26 corrected. `check_blueprint.py` with the shared declaration index reports 0
errors and 0 warnings. The suggested file elaborates at the pins with placeholder-proof warnings only (30).

## Corrections

### 1. Duplication with ModularCurvesPartII R14.4

ModularCurvesPartII R14.4 was planned and accepted on 2026-10-11 (packet `ModularCurvesPartII--R14.3.json`). It is now
TauCetiRoadmap pull request #913, Layer 15, and its README cites CDT directly. It already owns:

| Owned by R14.4 | Upstream § | What the design had |
| --- | --- | --- |
| congruence classes | §15.5 | W4/congruence-class |
| principal-level SL₂ amalgam | §15.2 | gap CSP |
| congruence subgroup property of SL₂(ℤ[1/p]) | §15.3 | gap CSP |
| abelian Ihara lemma | §15.6 | W5/abelian-ihara |
| congruence-invariance criterion (CDT Thm 4.5.2, Cor 4.5.3), with the whole §4.5 calculation as its stated proof | §15.9 | W4 (seventeen nodes) |
| enhanced Ihara lemma | §15.10 | W5/enhanced-ihara |

PROTOCOL §15 forbids planning this again. The changes:

- **Removed:** the seventeen W4 nodes and W5/abelian-ihara and W5/enhanced-ihara. The owner of each is recorded in the
  review notes and in the `sourceRoute`.
- **Imported:** ModularCurvesPartII:R14.4/{congruence-classes, modular-amalgam, congruence-subgroup-property,
  enhanced-ihara}.
- **New W4 (CDT §4.4):** nonabelian-ihara, triple-surjectivity and generation, moved from W5.
- **W5 (§4.3):** keeps the leveraging argument.
- **Gaps closed:** CSP, FIN and COEFF.
- **nonabelian-ihara:**
  - now states N≥3, the range of the upstream amalgam;
  - its proof is rewritten on the unsigned domain, where Wohlfahrt and −I∉Γ(N) finish the argument;
  - the leveraging argument only needs levels 2N≥4, and scaling-separation already passes from level 2 to level 4.
- **Lemma 4.5.12 is not planned.** No target here uses the final p-adic SL₂ cohomology, and its proof would rerun the
  calculation owned by §15.9.

### 2. The ALG and UNI gaps had owners

The design said that no roadmap, packet or reserved stage existed for the arithmetic holonomy bound or for the
uniformization of ℂ∖μ_N. Both exist, with accepted packets that predate the design:

- **DiophantineApproximationAndTranscendencePartII (AA.0–AA.5)** plans:
  - the integral holonomic ring H (CDT Definition 2.0.4);
  - the spans W and V;
  - the corrected rank bound (CDT Corollary 2.0.5);
  - algebraicity from a disc map with derivative greater than one.
- **ConformalMappingPartII** plans:
  - the normalized covering F_N;
  - the explicit radius γ_N with its positive N⁻³ expansion (CDT Theorem 5.1.4);
  - uniform mean growth (CDT Theorem 6.0.1);
  - the meromorphic-basis convention for trivial local monodromy.

The following nodes now cite these supplier nodes directly, and both gaps are closed:

- W2/small-uniformizations;
- W3/holonomy-embedding, W3/finite-rank and W3/quantitative-rank;
- W6/field-equality;
- W7/ode-algebraicity.

DiophantineApproximationAndTranscendencePartII/E1 shows that the printed V bound of Corollary 2.0.5 fails for a
nonintegral coordinate. The λ-root x_N=(λ/16)^{1/N} is nonintegral (x₃=t−(8/3)t⁴+⋯). W3/holonomy-embedding therefore now
places R₂N in the ℚ(λ)-span W, where the corrected bound holds. It holds there because the generators enter H after
multiplication by integers and powers of λ/16, which lie in ℚ(λ). The same slip in CDT's proof of Proposition 3.0.1 is
recorded as the new finding E24. Had the bound been taken for V, the [ℚ(x):ℚ(p)] factor would have cost N, and the
N³log N estimate would no longer have been good enough.

### 3. Weakly holomorphic forms are owned by QSeries QM.3

QSeriesPartitionsAndMockModularForms:QM.3/weakly-holomorphic-modular-form plans M^!_k(Γ) for Γ≤GL₂(ℝ), together with
its Laurent expansion. That packet is still under revision (`needs_changes`). W1/weak-form defined the same notion again.
It is now the theorem that, for finite-index Γ≤SL₂(ℤ), QM.3's exponential-growth condition is equivalent to meromorphic
cusp germs at every cusp, with restriction and products. This keeps CDT's convention in one place. The Lean predicate
`IsWeaklyHolomorphic` stays as a light stand-in, because QM.3 is not at the pins; its comment says so.

### 4. Gaps closed by short arguments

The arguments below are now in the proof steps.

- **ROOT** (W6/h-root-test). If a series with constant term 1 has bounded denominators and an integral n-th power, it is
  integral: reduce ℓ^c·a modulo ℓ in the domain 𝔽_ℓ[[q]]. So the linear coefficient −24/n of
  u^{1/n}=∏_{m odd}(1+q^m)^{−24/n} must be an integer. The congruence abelianization of Γ₀(2) is not needed.
- **SZ** (W7/stiller-zagier). The continuations of a weight-k form h are (cτ+d)^k h. Since Γ′ is Zariski dense, these
  span {P(τ)h : deg P≤k}, so the minimal operator has order exactly k+1. The Wronskian
  h^{k+1}(dτ/dx)^{k(k+1)/2} locates the apparent singularities at the zeros of h.
- **ARITH** (W7/regular-singular-component, W7/arithmetic-component):
  - The Wronskian operator of the continuation space W_j has coefficients that are single-valued on Y(2) and of moderate
    growth at the cusps. So they are rational on X(2)≅ℙ¹, and the operator is the minimal operator of the germ.
  - Aut(ℂ/ℚ) fixes the minimal operator of a rational series, so it lies in ℚ(x)[∂].
  - Chudnovsky's theorem (DT.5, cited as it stands) then applies to the companion system of that operator.

### 5. Requests to roadmaps that are now Tau Ceti pull requests

These were rewritten in the format of the SheafConvolution precedent: what the upstream README states is cited as it
stands, and what is missing is requested from a Part II that is not yet designed. Two `part-ii` entries were added to
`restructure`.

- **MODEL**, narrowed (R11 to ModularCurvesPartII:R12.6). Upstream already has the twisted model X(V) (R13.4a, §5.14),
  its analytic comparison and irreducibility (R12.4), cusp fields (R12.3) and q-expansion descent (R12.6). Only the
  explicit statement is missing: for V=ℤ/m⊕μ_m the cusp ∞ is ℚ-rational and split, with parameter q^{1/m}. The descent
  from ℂ to ℚ in W5/field-base-change is formal, because ℚ((t)) and ℂ are linearly disjoint over ℚ, so that proof step
  was rewritten.
- **NERON** (R12 to R13.5). Upstream §11 covers Γ₀, mixed and Cartan levels, not X(N) at every prime.
- **GLOCAL**, narrowed (R13 to DT.5). The merged DT README (#855) has G-functions and Chudnovsky's Galochkin theorem, but
  not Bombieri–André or Katz's local monodromy theorem. The designed DiophantineApproximationAndTranscendencePartII
  covers arithmetic algebraization, so a separate Part II in the G-function direction is requested.
- **Tau Ceti stage requests** are rewritten as "cited as it stands", saying exactly what each layer provides:
  - FuchsianOrbifolds Layer 2 has the (2,3,∞) triangle-group presentation, but no Γ(N) Schreier ranks;
  - FuchsianOrbifolds Layer 5 has degree theory, but no X(2) identification, which is W2's own target.

  The ProfiniteCohomology Layer 10 request lost its consumers and was dropped.

### 6. Other corrections

- W8/deficient-places: CDT's version of the definition is over ℚ, not ℚ̄.
- W8/noncongruence-witness now records the counterexample to CDT's unrestricted converse (E19).
- W7/effective-mason gains the τ↦Mτ induction step needed when components have fractional exponents.
- W1/bounded-denominators gains the integral-root relation used by W6, with a test: (1−16t)^{1/16} has t²-coefficient
  −15/2.
- W5 nodes lost irrelevant Γ₀/Γ₁ baseline citations.
- The roadmap definition was updated:
  - W4 is retitled "The nonabelian Ihara lemma and the generation identity", and W5 "Leveraging and degree doubling";
  - stage `requires` are recomputed from the node prerequisites;
  - the roadmap prerequisites are updated: added DiophantineApproximationAndTranscendencePartII and
    ConformalMappingPartII; dropped ArithmeticGaloisDuality, ArithmeticGaloisRepresentations,
    NoncommutativeAndEquivariantIwasawa and ProfiniteCohomology, which no remaining node uses.
- The reader document was regenerated from the corrected packet. Its node sections were first checked to round-trip
  exactly against the original. Packet-derived text is now escaped for the site's markdown renderer: the original had
  42 spans that `src/markdown.js` would have turned into stray emphasis, such as θ_q…θ_ and O_K…O_.

## Source findings

| Finding | Verdict and change |
| --- | --- |
| E1 | Confirmed, but relocated. The F₃-for-F₅ slip is in Lemma 4.5.11 on p.663, not in the proof of Lemma 4.5.6. Over 𝔽₃ the printed dimension zero is false: inflation–restriction injects H¹(SL₂(ℤ),𝔽₃)=𝔽₃ into the invariants, because SL₂(𝔽₅) is perfect. |
| E4, E5, E6, E7, E10, E11, E12, E13, E14, E17, E18, E20, E21 | Confirmed at their locators. E10 and E14 were also confirmed by computation; E21 was checked in KSV10 v4, p.6. |
| E19 | Confirmed and strengthened from a gap to an error. For ρ=1⊕σ, every cuspidal form with rational Puiseux expansion has zero σ-part, since σ(T)^M−1 is invertible. So the deficient set is empty although ker ρ is not congruence. |
| E22 (new) | h=λ(1−λ)/16 is invariant under the theta group ⟨Γ(2),S⟩, a conjugate of Γ₀(2), and not under Γ₀(2) itself: with q=e^{πiτ}, T sends h=q+⋯ to −q+⋯. Affects nothing. |
| E23 (new) | The bound C N³ log N is zero at N=1, so the hypothesis of Proposition 4.3.5, read for all N, can never hold. Use log(2N). Affects nothing. |
| E24 (new) | The proof of Proposition 3.0.1 bounds V rather than W. Affects the proof; the stated result survives with W. |

## Baseline citations

All 28 declarations exist at the pins with the stated content. Notes:

- `Chebyshev.theta_ge` gives n log 2 − log(n+1) − 2√n log n ≤ θ(n).
- `Derivative.serreDerivativeMF` needs Γ≤SL₂(ℤ) inside GL₂(ℝ).
- `TauCeti.Subgroup.integerCuspWidth` is the strict width at ∞.

`TauCeti.ModularForm.valence_formula_finiteIndex` and `SlashInvariantForm` are no longer cited by any node and were
dropped from `baseline.declarations`; W1/weak-form now reaches the slash-invariant carrier through QM.3. The valence
formula is still named in the reader as a parent-library input.
No citation was found wrong.

## Questions for the orchestrator

1. **QM.3 ownership.** Confirm that QSeriesPartitionsAndMockModularForms QM.3 owns weakly holomorphic modular forms. Its
   plan has been in revision since 2026-10-05. If its next revision renames the node, W1/weak-form must be repointed;
   the alternative is to move ownership here, as a ModularForms Part II, with QSeries importing it.
2. **Part II design jobs.** Two Part IIs are requested but not yet designed:
   - ModularCurvesPartII, Part II: rational cusps of twisted models and all-prime cuspal models (requests R11 and R12;
     gaps MODEL and NERON);
   - DiophantineApproximationAndTranscendence, Part II: G-operators, global nilpotence and Katz's theorem (request R13;
     gap GLOCAL).
3. **Paper routes and aliases.** The paper extraction's route 2 (ArithmeticAlgebraizationAndHolonomyBounds) and route 3
   (PuncturedPlaneUniformizationAndValueDistribution) were realized as DiophantineApproximationAndTranscendencePartII
   and ConformalMappingPartII. Recording these aliases would prevent the next design from treating them as missing.
   Route 4 (the source of DT.5) only partly reached upstream: Chudnovsky did, Bombieri–André and Katz did not.
4. **CDT Lemma 4.5.12** (low-degree cohomology of SL₂(ℤ_p), including H₂(SL₂(ℤ_p),ℤ)=0 in a coefficient convention the
   paper leaves implicit) is now planned nowhere. If wanted, it belongs beside ModularCurvesPartII §15.9.
