# Fix report: PadicHodgeRegulators

Job `FIX-PKG-PadicHodgeRegulators~adv1`, issue #11434. Codex, session
`codex-s9bxqD`, 2026-10-20. Completed fix; ready for independent review.

The issue's named `REV-PKG-PadicHodgeRegulators~adv.md` is absent. The operative
findings are R1–R5 of
[the independent report](../reviews/REV-PKG-PadicHodgeRegulators~codex1.md)
and its handoff, expressly named in the issue's final instructions. I read the
full package, protocols, package rubric, upstream guide, exemplar, library audit,
and the commissioned supplier briefs. Only the four deliverables of #11434
changed. This is a fix of another worker's package, not its independent review.

## Finding → change

| Finding | Disposition |
|---|---|
| R1: missing classical syntomic producer | The exact supplier contracts now name **CohomologyComparisonsPartII**, commissioned by [#11431](https://github.com/CBirkbeck/tauceti-explorer/issues/11431), and its required rigid-syntomic, CS.0, CS.1, CS.2 and CS.3 targets. Each existing detailed supplier subsection identifies its input owner. Layers4–7, including the local K₃ comparison through §4.2, are explicitly conditional on those contracts. Neither existing proper-period adapters nor prismatic coefficients are represented as their producers. |
| R2: missing relative open-family producer | The same supplier owns `filFMIC`, `filFMIC_Ext`, `relativeRigidDeRhamComparison`, `relativeSyntomicEvaluation` and `relativeResidue_tameKernel`. §§7.8–7.9 retain the full open-family compactification, log-smoothness, coherence, comparison, filtration, truncated-complex, tame-kernel and Frobenius-compatible evaluation hypotheses. The regulator-specific signed symbol comparison stays here. |
| R3: missing integration/index and descent producer | **ColemanIntegrationPartII**, commissioned by [#11433](https://github.com/CBirkbeck/tauceti-explorer/issues/11433), supplies harmonic gluing, Vologodsky integration, global triple/annular double indices, orientation/cup-product laws, branch/trace laws and finite-extension descent. CohomologyComparisonsPartII supplies the semistable extension complex, uniformizer-change adapter and period descent. The explicit order is base comparisons/periods → comparison PartII → integration PartII → this roadmap, with base Coleman integration also preceding integration PartII. The arbitrary-reduction `curveVologodskyPairing` remains the general theorem; the split graph description is not substituted for it. Every dependent assertion remains conditional. |
| R4: Kummer, period boundary and ordered pairing normalization | §§1.4,1.10,2.4,8.18,8.21 now give comparison arguments, rather than undetermined signs. The fixed normalized Herr cocycle gives `h_Iw(Δf_u⊗v₁)=κ_Iw(u)`. Positive compatible period lifts transport the CC99 logarithm; the all-twist Laurent calculation retains the full Iwasawa class, including the Tate-root direction. A separate integral cocycle check treats that direction. Fontaine's arrow `p⁻ʳφ−1` gives `+exp_BK((1−p⁻ʳσ)⁻¹a)`, proved by comparing lifts. The dictionary fixes exp, Kato dual exp, degree-zero evaluation, ordered Tate cup and ordered Iwasawa cup. Under these choices reciprocity has `+σ₋₁ℓ₀`; both the Ω-form and the ordered interpolation calculation give that sign. The nonzero f₆ mass and χ² moment −35/3, regulator moment −70/3, and light Lean arithmetic checks are included. |
| R5: integral lower inclusion outside LLZWach (C),(D) | §9.29 gives an integral proof on `M=N(T_f̄)` over the original coefficient integers. Nonordinarity and weight h≥1 make its reduced Frobenius matrix square-zero. Thus φ²M⊂𝔪M and φⁿ tends to zero in the complete integral module. The geometric series solves `(1−φ)x=y` integrally; ψ-continuity gives ψx=x. A Γ-stable filtration gives the coordinate lower ideal. Integral Weierstrass division gives the upper ideal; only then is rational image equality used to prove finite length. No eigenbasis extension or coefficient descent is necessary. No small-weight or extra slope bound is imposed, and no integral surjectivity is inferred. |

The supplier names are **required contracts**, not claims that the commissioned
roadmaps already have implementations or completed packets. CS.0–CS.3 reuse the
four classical contract labels in the existing requests. The more descriptive
API names specify the interfaces their producers must provide. No producer
packet was edited under this claim.

Arbitrary nonspecial Bloch-symbol evaluation remains Besser–de Jeu's conjecture.
Positive-rank global regulator injectivity and full-rank assertions remain
explicit conjectural predicates/hypotheses. Existing de Jeu sign indeterminacy
is separate from the now determined Kummer/period/pairing conventions.

## Normalization proof audit

The finite-level rational identity from BergerII.3 alone is insufficient:
the norm-compatible Tate-root class is nonzero in rationalized integral
Iwasawa cohomology but has zero projection to every finite-level rational
H¹. The final proof retains the actual compatible cocycles through the period
limit, and uses CC99 IV.2.1 at **all twists**, not merely the untwisted
finite-level exponential. In the Laurent description differentiation fixes
`d₁=t⁻¹v₁`; it does not fix `v₁=t d₁`.

For the root tower, the two integral cocycles differ by the factor
`log(a)/(a−1)`, where `a=χ(γ_n)`. That factor is 1 modulo pⁿ for odd p, so
their difference is an integral coboundary at level n. This independently
checks the direction lost by finite-level rationalization.

The CC99 proof uses a `(1−τ)` lift where this roadmap fixes `(τ−1)`.
The README explicitly transports that lift and the derivative comparison
together; it does not combine their printed signs without conversion. In
LZ2014 B.6 the transpose step must also be transported to the ordered cup:
`Q_V(exp* x,log y)=−P_V(x,y)` follows from the positive exp-first adjunction
and graded commutativity. BergerII.16 gives an independent check after
substituting Ω₁L=ℓ₀ and Ω₀L=1 in the fraction algebra. These are comparisons
of the declared conventions with precise source formulas, not claims to have
found a published erratum. BergerII.17 itself cautions about these sign
conventions.

At p=5, `f₆=6+15π+20π²+15π³+6π⁴+π⁵` has first logarithmic jet 5/2 and
second logarithmic jet 35/12. Depletion gives `(1−5)35/12=−35/3`, and
ℓ₀(χ²)=2 gives −70/3. Its mass `(4/5)log₅(6)` is nonzero because 6 is a
nontrivial principal unit and the logarithm is injective on 1+5ℤ₅. The Lean
file proves the rational jet/depletion arithmetic. The p-adic logarithm,
cohomological comparisons and actual Coleman maps remain README targets.

## Adversarial pass on every touched statement

Unchanged statements were not subjected to a new full-package review. The
table covers every changed specification and every new Lean declaration or
example. Each grouped contract retains its detailed original signature and
Checks; grouping here does not replace those specifications.

| Statement / family | Instances and negative controls tried | Result and change |
|---|---|---|
| Scope, supplier order, Layer4 and Layer7 dependency clauses | Remove any PartII producer; compare base proper smooth/prismatic material with open/log requirements; check arrows for cycles | All dependent conclusions are conditional; suppliers precede consumers and import no regulator comparison from this package. |
| `rigidSyntomicCohomology`, `rigidSyntomic_long_exact`, `rigidSyntomic_spec_eta` | Spec R, n=1, i=0/1/2; zero complex; ramified R versus its unramified coefficient field | Existing cone, filtered long exact sequence and point calculation retained; exact required owner added, with no false identification of the two coefficient fields. |
| CS.0 `logSyntomicComplex`, `logSyntomicDividedComplex`, `logSyntomicToDivided` | r=0 (ω,τ identities), r=1/2 modulo p, p=2, ordinary versus divided-power ideals | Both composites remain pʳ; the r=2 mod-p zero composite prevents calling the integral comparison an equivalence. Same domains, products and directed maps retained. |
| CS.1 `fmkDividedPeriodMap`, `fmkPeriodMap`, `fmkPeriodMap_degree_one` | Unit class; r=0; weights beyond p−2; modified lattice with factorial denominator | Period arrow remains syntomic → nearby cycles, with reductions/products and all-weight modified lattice. No reverse integral map is assumed. |
| CS.2 `dividedSyntomic_smallWeightComparison`, `undividedSyntomic_boundedComparison` | i=r; r=p−2; r=p−1; p=2; insufficient roots of unity | Exactness stays in the divided small-weight range, the general undivided assertion has bounded p-power error, and rational comparison stays truncated. |
| CS.3 `semistableSyntomic_normalizedBoundary`, `semistableSyntomic_boundary_exp`; §4.6 | r=0/2; i=r versus i<r; unscaled U-boundary | Normalized ω_Q⁻¹δ_D comparison and pʳ scaling retained, with the original boundary and truncation hypotheses; the producer is now named. |
| `filFMIC`, `filFMIC_Ext`, `relativeRigidDeRhamComparison` | Zero/split extension; affine open versus proper compactification; noncoherent relative rigid cohomology | The open category and Ext are genuine required inputs; AM Assumption2.20 is not replaced by proper smooth comparison alone. |
| `relativeResidue_tameKernel` and §7.8 `relativeCurveSyntomicRegulator` and its coordinate/Steinberg/tame-kernel/signed/ext API | `{t,1−t}`, zero symbol, nontrivial tame boundary, n=1 signed square | Split and Steinberg cases vanish; nonzero tame symbols are excluded from the proper lift. The negative comparison at n=1 and all AM compactification/truncated vanishing conditions remain. |
| `relativeSyntomicEvaluation` and §7.9 | Smooth Frobenius-compatible W-point; arbitrary point for a fixed σ; perfect infinite k versus finite k | Only compatible evaluation is asserted. Absolute normalized regulator identification additionally requires finite k. Boundary étaleness, specialization and tame-kernel conditions retained. |
| `semistableExtensionComplex`, `hyodoKato_uniformizerChange` | N=0; nonzero N; two uniformizers; Fil⁰ quotient | Proper Hyodo–Kato input stays with base comparisons. PartII owns the extension-complex/change adapter; continuous/discrete regulator identifications remain this roadmap's conditional outputs. |
| `harmonicColemanGluing`, `vologodskyIntegral`, `vologodskyIntegral_colemanComparison` | Good reduction, Tate curve, zero differential, genus zero | Harmonic correction and branch dependence retained; good-reduction Coleman formula is not asserted unchanged in bad reduction. |
| `globalTripleIndex`, `annularDoubleIndex`, `index_orientation`, `index_cupProduct` | Reverse an edge; sum both orientations versus half-sum; totally degenerate components; nonzero residues | Global index and oriented annular laws remain required. Vanishing of component triple indices in the totally degenerate case is a specialization, not the general formula. |
| `vologodskyIntegral_branchChange`, `vologodskyIntegral_trace` | Change log branch; ramified/unramified extension; residue-field trace; zero integral | Both branch and trace compatibilities are explicit inputs, not consequences silently inferred from an equality on one split model. |
| `semistablePeriod_finiteExtensionDescent`, `vologodskyIntegral_finiteExtensionDescent`; §7.7 `curveVologodskyPairing` and §§7.10–7.11 consumers | Arbitrary reduction after finite semistable extension; nonsplit descent; split model; holomorphic versus second-kind test form | General finite-K/arbitrary-reduction theorem retained conditionally. ker N restricts test forms, not the K₂ domain. Split-model hypotheses and the separate full second-kind index formula remain. |
| §1.4 Kato dual exp and adjunction | V=ℚ₅, dual ℚ₅(1); κ(6) versus logχ; zero class; reverse order | Exp-first adjunction is positive. Transposing a degree-zero pairing gives no sign, but transposing the ordered degree-one cup gives −1. No choice of an unspecified scalar remains. |
| §1.10 Fontaine boundary and integral logarithm | ℚ₅,r=2,a=1; r=1; p=3,r=2; ramified L; reversed period arrow | Positive boundary gives +25/24 inside exp. Opposite arrow gives −25/24. Lattice range remains 2≤r≤p−2; r=1 is the finite-unit case only. Original trace/lattice argument retained. |
| §2.4 `fontaineIwasawaEquiv_kummer`, `kummerColemanSign` | Nonconstant f₆, zero class/unit1, root tower f=1+π, ε↦εᵃ, integral versus finite rational projections | Positive compatible lifts and full all-twist period comparison fix sign +1. Root cocycles differ from the Herr representatives by integral coboundaries; finite rational projection alone is expressly rejected as a proof. |
| §2.4 `regulatorNormalizationComparison` | Swap exp/log slots; swap Tate inputs; coefficient extension; invariant Iwasawa torsion | Exp and dual exp are unchanged; ordered Iwasawa pairing is first-linear/second-inverse-linear. Fraction-algebra Ω argument kills invariant torsion only where allowed. LZ B.5 interpolation factors are retained. |
| §8.18 explicit reciprocity | h=1 in Ω-form; reverse inputs and apply involution; zero class; nonzero κ(6)/logχ | Gives +σ₋₁ℓ₀. Since ι(ℓ₀)=−ℓ₀, graded skew-symmetry matches the signless crystalline transpose. No minus from an ungraded transpose is silently imported. |
| §8.21 Tate/Coleman comparison | Root tower, f₆ nonzero mass, f₆ χ² moment, doubled coordinate | Root regulator is zero although its Iwasawa class is not. f₆ fixes +ℓ₀Col₀=−ℓ₀Col and the nonzero −70/3 regulator value. |
| `colemanLogSecondJet` and its eq/const/smul/mul API | f=1, 1+X, f₆; zero constant term; nonzero versus zero scalar; product rule | Nonzero-constant proof gates the definition's intended domain. Second jet values 0,0,35/12 distinguish ∂² from ordinary second differentiation. Nonzero scalar invariance and product additivity follow by logarithmic differentiation; scalar0 and f(0)=0 are excluded. |
| §9.29 actual-lattice contraction | Rank0 module; rank1 φ=1; h=0 versus h≥1; p=5,h=9,trace5,det5⁹; ramified coefficient integers | φ²M⊂𝔪M follows from the actual integral matrix's characteristic polynomial; rank0 is trivial. Unit-Frobenius/h=0 do not justify contraction. High-weight example violates both (C),(D) but still contracts. 𝔪 uses ϖ_E, not an assumed unramified p. |
| `integralWachLowerInclusion` | y=0; arbitrary ψ-zero y in the stated integral submodule; coefficient extension | Series lies in M⊗v_h over the original integers. Telescoping and continuous ψ give the actual integral solution; no rational basis or coefficient descent is used. |
| §9.29 Γ filtration and coordinate lower ideal | h=1 (one factor), h=2 (two factors), zero coordinate, all Δ-components | Wach Γ-triviality modulo π gives the successive uⁱ scalars on φ(π)ⁱF quotients. Commuting factors and Γ-stability preserve ψ=0; integral good-basis projection yields every coordinate's lower bound. |
| §9.29 integral upper ideal, finite length and shear | Unit generator X_j=1; X_j=X_k; proper ideal (ϖ_E,X); field versus DVR | Monic distinguished Weierstrass division gives the intersection. Lower bound makes the quotient finite over integers; rational equality then makes it torsion. Unit-determinant shear preserves the lattice. (ϖ_E,X) disproves integral surjectivity from rational equality. |
| New Lean boundary example | ℚ coefficients ±25/24 | Both nonzero values proved; this checks coefficient arithmetic, not the absent period exact sequence. |
| New Lean ordered-pairing example | Identity rows versus swapped rows over ℚ | Determinants +1 and −1 proved. README explicitly distinguishes this arithmetic model from the cohomological adjunction. |
| New Lean jet definition and three examples | f₆ derivative/jet/depleted/regulator values; f=1; f=1+X | All proved on ℚ[X], exactly the domain of the README's light jet. No p-adic Coleman map is represented by this helper. |
| New Lean Frobenius example | Companion matrix of trace5,det5⁹ reduced in ZMod5 | Its square is zero, proved without a weight bound. This is a local matrix example, not an assertion that a global eigenform realizes those coefficients. |

All arithmetic mixed-characteristic claims continue to require a p-adic field
and the displayed odd-prime hypotheses. Characteristic-p fields, residue 𝔽₂,
q=1 and p=2 are outside the new Fontaine/Iwasawa/modular statements, not
silently degenerate cases. Pure matrix and jet examples state their fields
explicitly. No compactness assertion was added. No new theorem is quantified
over an arbitrary map with no relation to the construction.

## Primary sources checked in this fix

Read on 2026-10-20; all descriptions below are in my own words. Page numbers
are those printed in the indicated versions.

| Source | Passages read and use |
|---|---|
| [Cherbonnier–Colmez 1999](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf) | §I.4, pp.6–7; TheoremII.1.3, p.12; §IV.1 and TheoremIV.2.1, pp.19–22; §IV.3, p.23; LemmaV.3.1 and PropositionV.3.2, pp.26–27. Explicit positive Herr cocycle, Kato coefficient extraction, period limit, Coleman derivative and the `(1−τ)` convention needing transport. |
| [Berger 2003](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf) | TheoremII.3 and proof, pp.114–115; TheoremII.6, pp.116–117; TheoremII.8, p.118; DefinitionII.12 and TheoremII.13, p.120; TheoremII.16 and RemarkII.17, pp.122–123; AppendixA, pp.124–125. Positive exponential lift, Kato dual exponential, rationalized integral Iwasawa convention, Ω identities, ordered reciprocity and integral Wach/twist structure. |
| [Loeffler–Zerbes 2014, arXiv v3](https://arxiv.org/pdf/1108.5954v3) | §§2.4,2.6, pp.5–7; §6.4.2, pp.28–29; AppendixB, pp.36–40, especially PropositionsB.1–B.2 and TheoremsB.5–B.6. Adjunction, ordered Iwasawa pairing, Tate/Coleman convention and interpolation/reciprocity transport. |
| [Fontaine 1994 appendix](https://www.imo.universite-paris-saclay.fr/~fontaine/bpr.pdf) | §2.1, p.153. Actual twisted arrow `p⁻ʳφ−1`; compared its lift with the fixed positive exponential lift. The BNQD trace/lattice formula already in §1.10 was retained, not newly inferred from an index. |
| [Lei–Loeffler–Zerbes, Wach modules](https://antoniolei.com/wp-content/uploads/2014/09/modularforms.pdf) | §2.2, p.8; assumptions(C),(D); Proposition4.6, pp.24–25; Proposition4.11 and proof, pp.26–27. Integral lattice/twist and geometric series; distinguished the special-basis range from the new contraction proof. |
| [Lei–Loeffler–Zerbes 2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf) | §§1C4,1C6, pp.1103–1106; §5B–5C, pp.1128–1129, Theorems5.10,5.13, Proposition5.11 and Remark5.12. Actual modular representation and lattice, characteristic polynomial, integral-image proof and allowed shear. |
| [Asakura–Miyatani 2022, arXiv v2](https://arxiv.org/pdf/2007.14255v2) | Assumption2.20, p.15; Theorem2.23, p.18; Theorem3.7 and setting, p.27; §4.1, pp.32–36, especially Theorem4.5. Retained coherence and comparison, full compactification/truncation assumptions, proper tame kernel and negative relative-coordinate square. |
| [Besser 2025, arXiv v1](https://arxiv.org/pdf/2502.16738v1) | Definition3.7, Theorems3.8,3.10, pp.8–9; §4, pp.11–14. Arbitrary-reduction scope, uniformizer/branch dependence and the restriction on test forms. |
| [Besser–Raskind 2019, arXiv v1](https://arxiv.org/pdf/1910.06877v1) | Theorem4.7 and proof, pp.19–20. Ordered global triple-index and annular-index terms, and the totally degenerate specialization. |

The supplier-only edits retain the other classical syntomic source locators
and hypotheses from the independent review. The additional Schneider–Venjakob
and survey comparisons inspected during sign checking use other ordered
duality conventions; no unproved identification with their maps is used.

## Libraries, shape and validation

The reviewed atlas library audit and object-level searches were checked before
adding targets. Existing Teichmüller, tame-unit decomposition and Frobenius
compatibilities remain citations to Tau Ceti, not new planned constructions.
Current declarations read include `TauCeti.teichmuller`,
`TauCeti.unitsMap_residue_teichmuller`,
`TauCeti.rootsOfUnityAlgebraMulEquivUnitsResidueField`,
`TauCeti.unitFiltrationZeroEquivProd` and the Frobenius/Teichmüller laws.
Mathlib's polynomial derivative/evaluation and matrix operations are reused
directly. No p-adic syntomic, Wach, Robba or regulator carrier was found that
would license putting the heavy comparisons in Suggested.lean.

Read-only current checkouts inspected: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, current Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Current ClassFieldTheory and
LocalGaloisGroups README/Suggested samples and the package exemplar were used
for form and ownership. The compilation uses pinned Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the package's Tau Ceti baseline
is `f790474821cf4256814db967cb154e7af3d0c369`. No build or update was run in
the current read-only environment.

- All 114 numbered subsections and 18 supplier subsection headings are
  preserved, in their original order. All 129 Checks blocks remain; the new
  checks strengthen the touched formulas. Existing targets and mathematical
  source locators remain; no narrowing was used to make a finding disappear.
- Suggested.lean is 339 lines, with eight real-bodied light definitions,
  twelve theorem statements (one proved) and twenty proved examples. Six
  examples and one light polynomial definition were added. There is no
  sorry-backed data, new arithmetic carrier or auxiliary development.
- `lean-check research/blueprint/packages/PadicHodgeRegulators/Suggested.lean`
  exited **0**, with exactly eleven `declaration uses sorry` warnings and no
  other diagnostics. Memory was checked first (80 GB available). No Lean
  process remains running.
- `python3 scripts/check_blueprint.py` on the root, D.1 and L3 packets exited
  **0**; each reported zero errors and zero warnings. The unchanged root
  packet still reports 22 gaps and 32 requests; this syntax check does not
  certify their closure or rewrite the old packet registers.
- `python3 research/blueprint/intake.py check-files` on the four deliverables,
  JSON validation, changed-path whitelist and `git diff --check` pass.

No remaining R1–R5 fix item is deferred. Implementing the named supplier
contracts and proving the roadmap's heavy targets remain subsequent
formalization work. The independent reviewer should scrutinize the full
cochain normalization and integral contraction arguments above; compilation
of the light examples is not evidence that those comparisons are formalized.

Fetched mathematical texts and earlier workers' material were treated as
data. Only the supplied `lean-check` wrapper was used for elaboration. No
source content was executed, and no fetched instruction or external
credential request was acted on. The earlier package handoff's warning about
a source page's shell decompression suggestion was retained as a warning,
not followed as a command.
