# Independent review: q-Hodge and Habiro supplier exports

**Verdict: accepted with the corrections below.** Reviewer: Codex, session
`codex-6ExbHH`, 2026-10-20. Refs #11318.

The reviewed input is the supplier-export round merged in #11316, commit
`57983086a00caba36ff9aa088cee139d8882c31d`. The baseline is its first parent,
whose package had already passed independent review
[`REV-PKG-HabiroCohomologyFoundations~3.md`](REV-PKG-HabiroCohomologyFoundations~3.md).
This review follows the final, narrower instruction on #11318: check the new
chosen-pair exports, their sources and usability before trace comparisons,
and preservation of the accepted mathematics. It does not repeat the earlier
review of every unrelated target. The new finite-coefficient construction in
§5.26 is checked because §4.28 expressly exports those pairs to the consumer.
The fix worker's self-assessment supplies no independent verdict.

## Corrections

1. **Divisor coherence, §4.28.** The record promised all cyclotomic
   completions while expressly requiring only individual factorial maps and
   disclaiming further coherence. This was insufficient as the advertised
   interface for a consumer's divisibility-indexed limit. The export now
   requires enhanced divisor diagrams, natural quotient/completion
   comparisons, identity and composition homotopies and higher coherence,
   compatible with multiplication and the specified base change. Named
   targets `HabiroHodgeDescent.transition` and `.transition_comp` expose the
   maps and laws. The construction route uses common arithmetic fracture
   diagrams, their projections and relative Frobenius maps, compatible
   refinements, and enhanced pullback followed by completed modification.
   Factorial cofinality remains available to compute the limit.

   This is deliberately identified as an additional construction to supply:
   Wagner's [QH v2](https://arxiv.org/pdf/2510.04782v2), Paragraph 3.41,
   §§3.5–3.6, pp.44–45, constructs the individual natural transformations
   and explicitly omits full functoriality in the indices. Paragraph 3.38,
   pp.42–44, provides the compatible fracture/refinement construction, and
   Proposition 3.43, pp.45–46, gives the completion equivalences. The README
   no longer attributes a fully written coherent construction to that paper.

2. **Grading and completion, §4.28.** Inverting `t` gives the graded object
   `qdR[t^{±1}]`; its degree-zero part is `qdR`. The export previously
   identified the entire localisation with `qdR`. The corrected
   `qHodge.periodic_t` specifies the graded object and the extraction of
   degree zero before completion. All periodic completion statements now
   explicitly use derived completion degreewise in graded modules. After
   inverting β, the relation `t=(q−1)β^{−1}` identifies this with
   `(q−1)`-completion in each degree. There is no exchange of completion
   with an ungraded infinite Laurent direct sum.

3. **Hypotheses remain attached to upgrades, §4.28.** An E_n-upgrade
   transports compatible E_n-structure already given on the pair and its
   comparisons. A derived commutative upgrade requires the filtered lift
   from §4.23. The export no longer reads as supplying these structures
   unconditionally on an arbitrary module-valued pair. Likewise, the
   finite-projective base-change clause now explicitly retains the relative
   Frobenius/Nygaard and filtered décalage supplier obligations of
   §§4.25–4.27. These are conditional targets already present in the accepted
   package, not new arbitrary-flat-base-change assertions.

4. **Actual rational overlap, §5.26.** The new construction correctly
   retained the global constant rational corner but incorrectly replaced
   each local overlap `C_p=(dR_local)[1/p]` by ℚ_p. Turning each finite
   divided-power polynomial into a scalar does not justify that replacement
   after p-completion. The corrected construction keeps `C_p` itself with
   its canonical maps and constant filtration.

   The added negative control works even for α≥2: translate the integral
   PD coordinate to `z=y−p^α`. In the completed cokernel of multiplication
   by `z`, the sum with coefficient `p^{floor(r/2)}` on `γ_{p^r}(z)`
   converges, has scalar evaluation zero and survives inversion of p.
   Multiples of `z` have coefficient divisible by `p^r` in that coordinate,
   whereas no fixed power of p makes all these coefficients divisible.
   Thus the overlap has information beyond its scalar quotient.

   The repaired proof of staticity keeps this information. Modulo `q−1`,
   multiplication by `y−p^α` on the completed PD polynomial algebra is
   injective by coefficient recursion. Approximation modulo `p^k` by a
   finite PD polynomial shows that a class in `C_p` is an integral local
   class plus a scalar in ℚ_p. Finite-prime approximation then makes the
   arithmetic pullback map surjective. Derived `(q−1)`-completeness lifts
   staticity and regularity. The constant overlap disappears from the
   completed filtration and q-Hodge modification as before. No periodic,
   cyclotomic or finite-coefficient API name was removed. Divisibility
   functoriality for quotient pairs is now explicitly contravariant.

   [Bhatt v1](https://arxiv.org/pdf/1204.6560v1), §8, Proposition 8.5,
   p.32, supplies the completed PD presentation; Remark 8.7, p.33, warns
   against discarding the rational contribution of completed torsion. The
   coordinate witness and arithmetic argument above are spelled out in the
   README, rather than asserted as the statement of those results.

5. **Preserved boundary name, §2.1.** Restored the name
   `derived_quotient_torsion_witness` on its unchanged two-term computation.
   The fix round had retained the mathematics in prose but dropped this
   identifier when removing the library-only Lean milestone. The witness
   remains a README computation: both H⁻¹ and H⁰ of the zero-map cone are
   ℤ/2. No enhanced completion is encoded by that example.

## Sources and generality

The public versions checked were QH v2, [Pridham v4](https://arxiv.org/pdf/1608.07142v4),
[GSWZ v2](https://arxiv.org/pdf/2412.04241v2),
[TC v4](https://arxiv.org/pdf/2410.23115v4), and Bhatt v1. All source discussion
and new README text is in our own words; no source passages are stored here.

The primary export is for every chosen q-Hodge pair over a perfectly covered
Λ-base. It neither chooses a filtration on every animated algebra nor imposes
a spherical lift on that category. Pridham's comparison in §4.8 retains
ℤ-flatness, a formally étale Λ-framing and rank-one variables (Theorems 1.17
and 1.23, §§1.2–1.3, pp.7 and 9–10). Its Λ-map functoriality is not promoted
to a canonical filtration on all smooth algebras. The étale number-field
identification retains discriminant inversion and imports the coefficient
ring from HabiroRings; GSWZ Definition 1.1, §1.4, pp.6–7, and §5.2, pp.64–65,
support the Frobenius-glued description. No K₃-indexed module comparison is
inferred from it.

Besides the new export locators and their proof passages, a reproducible
random sample of fifteen existing citation-bearing subsections was checked
in §§2.1–2.7 and Layer 4 (seed 11318 applied to the document-order list). These checks
found no incorrect locator. Page numbers below are printed pages of QH v2.

| README subsection | Source checked | Point checked |
| --- | --- | --- |
| 4.19 | Theorems 3.11(a), p.25; 1.11(a), p.7 | Factorisation on chosen pairs |
| 2.7 | Definition 3.2(c), p.21; Proposition 3.47(a), p.48 | Combined filtration and completion |
| 4.21 | Corollary 3.13, p.27 | Étale degree-zero comparison |
| 4.14 | Paragraphs 3.42, p.45; 3.45, p.47 | Completed modification and limit |
| 4.26 | Construction 3.38, pp.42–44 | Twisted construction; base change remains conditional |
| 2.1 | Paragraph 1.22(a,c,d), pp.10–12 | Filtered shifts, cofibres, derived completion |
| 4.13 | Proposition 3.39; Remark 3.40, p.44 | Filtered β-quotient and multiplication |
| 4.7 | Lemma 3.10, p.24 | Ascending filtration and graded pieces |
| 4.24 | Corollary 3.54(a–c), p.51 | Smooth cohomology; E₁ qualification; Bockstein |
| 4.27 | Paragraph 3.45; Lemma 3.46, p.47; Theorem 3.11(b), p.25 | Descent inputs; no arbitrary base-change theorem |
| 4.3 | Lemma 3.3, p.22; Example 4.24, pp.63–64 | Failure of a universal section |
| 4.6 | Paragraph 3.8; Lemma 3.9, pp.23–24 | Conjugate filtration and β/t convention |
| 4.15 | Lemma 3.44, p.46; Proposition 3.43, p.45 | Distinct Nygaard denominators |
| 4.1 | Definition 3.2, pp.20–21; Remark 1.8, p.5 | All four clauses and comparison data |
| 4.11 | Lemma 3.37, p.42 | Lower cyclotomic-point equivalence |

Further checks covered QH Remark 3.6, pp.22–23; Paragraphs 3.38–3.41,
pp.42–45; Proposition 3.47, pp.48–49; and §3.8, pp.50–51. TC Paragraphs
3.3 and 3.5, pp.30–31, and Lemmas 3.16–3.17, pp.38–40, distinguish the
algebraic higher-power construction from its more restrictive spectral
applications. The prior correction of TC Lemma 3.7's rational-vanishing
argument is retained; the additional local-overlap correction above is
essential for that replacement construction.

## Consumer and preservation audit

RefinedTraceMethods §§6.10, 6.13 and 7.6 were read as consumers, without
editing them. They use the chosen filtration, its completion and periodic
modification, the cyclotomic partial objects, and the Habiro limit. Their
spherical-lift, resolution, prime-inversion and multiplicative hypotheses
stay on their trace theorems. Construction of the supplier objects in
Layers 1–5 does not use those theorems; Layer 6 consumes them subsequently.
The mutual roadmap references therefore do not introduce a stage-level
cycle. Finite-coefficient pairs and higher-power lifts have algebraic
constructions here before any trace identification.

Comparison with the accepted baseline retains all 151 numbered subsections
and every API bullet name; there are now 153 numbered subsections. After
restoring the boundary witness name, no old backtick identifier is missing.
The base-general scheme target in §5.13 retains its old ℤ-case and the
small-prime condition. The more explicit monoidality argument and source
corrections in the fix do not weaken existing statements. Library-only
examples removed from Suggested.lean in that round remain computations in
the README. The suggested file's other old milestone statements retain
their hypotheses. No source excerpt, truncated target or process paragraph
was introduced into the roadmap.

The reviewed library audit is AUDIT-19 in `data/library-coverage.json`.
Current upstream was checked at roadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including current and completed
roadmaps. Searches included mathematical structures and operations:
Λ-structures, Nygaard/Frobenius twists, derived filtered completion,
q-de Rham, q-Hodge and Habiro objects. The potentially related
`reesAlgebra.grade` and `reesAlgebra.mem_grade_iff` were read in Tau Ceti's
`RingTheory/ReesAlgebra/Grading.lean`: they concern the ordinary ideal Rees
algebra, not the enhanced filtered-module equivalence or the new exports.
No duplicate new target was found, and no target was removed for duplication.
The upstream HodgeStructures and UniversalCovers READMEs supplied the prose
models; ClassFieldTheory and LocalGaloisGroups supplied signature-form checks.

## Adversarial instances and validation

| Statement/interface | Instance or negative control | Result |
| --- | --- | --- |
| β versus t localisation | Unit pair and coordinate A[x] | q-Hodge has differential `(q^r−1)x^{r−1}dx`; t-localisation has `[r]_q x^{r−1}dx` |
| Completion changes the underlying complex | ℚ[x^{±1}], class dx/x | Completed qdR differs; qHdg is unchanged |
| Coherent descent | Unit pair, divisor diamond 6→2,3→1 | Canonical paths agree; negating one module edge fails |
| Periodic completion | Each β-degree of the unit object | Degreewise completion is explicit; no infinite-sum exchange |
| Base change | A→A×A and ℤ→ℚ | Two components retained; flatness counterexample retained |
| Étale descent | Empty frame | Positive q-Witt degrees vanish |
| Finite coefficients | m=1, m=4, m=12 | Rational corner retained; powerful versus spectral range distinguished; exponent one excluded |
| Completed PD overlap | α≥2, translated PD coordinate | Explicit convergent non-torsion class prevents replacement by ℚ_p |
| Higher-power signs | p=2, n=1 | `P_1=−1`, `Q_1=1` gives the required correction |

`lean-check` on the unchanged Suggested.lean exited **0** at Mathlib
`082e2d37e8` and Tau Ceti `f790474`. Its only warnings are the seven
expected `sorry` warnings: `jackson_calculus`, `uniformDenominator_pos`,
`torusScaleHom_action`, `torusScale_exists_unique`,
`coefficientRelation_eval`, `qHodge_polynomial`, and
`cyclotomic_prime_decomposition`. Five real-bodied definitions, ten proved
examples and seven milestone signatures were checked against their README
statements, including ten definition/theorem signatures. No Lean file change
was needed; the new enhanced carriers remain in the closing README-target
comment and the detailed roadmap. Metadata is the single fitting line
`topic = "math.AG"`.

The sorry-data checker passed. The main packet and its four split packets
passed `scripts/check_blueprint.py`, each with zero errors and warnings;
they were not edited. `intake.py check-files` on all four changed files
reported zero problems, and `git diff --check` passed. Exact rational
arithmetic also checked p-integrality of the PD translation coefficients for
p=2,3,5, α=2,3 through degree 64 and the witness inequality for twenty
powers; the README gives the general arguments, not a numerical substitute.

There is no unresolved defect in this export round. Existing explicitly
open comparison problems and conditional enhanced supplier targets remain
as such; this verdict does not claim that those targets or the cohomology
theories have been formalised.
