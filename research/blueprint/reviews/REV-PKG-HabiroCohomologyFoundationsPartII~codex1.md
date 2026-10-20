# Independent package review: HabiroCohomologyFoundationsPartII

Issue #11390; reviewer Codex, session `codex-e84W4H`; 2026-10-20.
**Verdict: needs_changes.** The suggested Lean elaborates without warnings or
errors, and the in-scope mathematical corrections below are applied. The
five-roadmap dependency split is not complete in the checked-in packages.
Required supplier edits and an ownership discrepancy cannot be repaired by
editing Part II alone. This is a completed review, not a checkpoint.

The baseline is atlas commit `58774f79cc53d15cb47c827b58bdb7f37e010785`,
including package PR #11385. The package author was Claude, session
`claude-vCmoOI`; the design author was a different Codex session,
`codex-y8e6bP`. Neither was this reviewer. The issue's Mordell-conjecture title
and revision-round boilerplate do not describe the actual files: the named
earlier review and package `review.json` were absent. The supplied plan is
`complete`, but has no independent `review` object and retains three supplier
requests. I reviewed the actual Habiro package and plan without inventing a
previous acceptance or rejection.

## Dependency audit: the actual split

Here an arrow is **consumer → supplier**. The inventory distinguishes
construction inputs from downstream applications and source citations.
Abbreviations: I = HabiroCohomologyFoundations, II = this Part II,
HR = HabiroRings, HC = HabiroCyclotomicCompletions, RT = RefinedTraceMethods.
Section references below are to the packages at the baseline, except that
II includes the corrections in this review.

| Consumer | Every direct supplier among the five | Contract consumed |
| --- | --- | --- |
| I | HR | HR.1 arithmetic Λ-bases; HR.2 enhanced completion/tensor; HR.3 coherent finite cyclotomic reconstruction; HR.4 relative q-Witt rings; HR.5 relative Habiro rings and Taylor maps. |
| I | HC | HC.3 convergent Taylor re-expansion and Hasse coefficients. |
| I | RT | Layer 6 §§6.1–6.5: RT.4:q-Hodge, RT.4:Habiro-comparison and RT.6; §8.1 trace example; §9.15 trace-construction comparison. These edges remain in the actual file. |
| HR | HC | HC.1 q-factorials/topology, HC.3 Taylor substitution, HC.4 rigidity, HC.5 root-adjoining/coefficient results. |
| HC | HR | §5.5 `ordinaryDerivedComparison` consumes HR Layer 2's derived completion, also listed in its scope and aggregate dependencies. |
| RT | HR | HR.1, HR.2, HR.5 and the obsolete HR.6 étale Habiro–Hodge contract; the last is a broken locator, not a construction still owned by current HR.6. |
| RT | I | Layers 2–4, especially §4.28, and §5.26. RT explicitly excludes I's trace-existence Layer 6 from its inputs. |
| II | I | Layers 1–5: filtered/enhanced conventions, qdR, pairs, coordinate and canonical pairs, §4.21 étale identification, §4.28 descent interface, quasi-regular naive filtration and §5.26 finite-coefficient pairs. |
| II | HR | HR.1, HR.2, HR.5 and HR.7. The stale HR.6 citations have been removed in this review. |
| II | RT | §§6.1, 6.9–6.14, 7.6 and 8.8: structured lifts, comparisons, cyclonic coefficients, arithmetic realisation and the high-powered range. |

For completeness, these are the other supplier edges of each of the five
packages; each semicolon separates a distinct supplier. Native carriers are
listed separately rather than counted as roadmap edges.

| Consumer | Other suppliers and exact layers/sections |
| --- | --- |
| I | DerivedDeRhamCohomology DD.0–DD.4; EnhancedDerivedSheaves E0/E1/E2/E5, with its enhanced monoidal framework also named in aggregate dependencies; PrismaticCohomology PR.0–PR.3/PR.6; PerfectoidQuotients Q3; AInfCohomology AI.1/AI.3–AI.5; CrystallineCohomology CR.0/CR.2/CR.4; CohomologyComparisons CP.1/CP.6; AnalyticHabiroStack HS.3 solely for the open analytic comparison; current upstream AlgebraicVectorBundles L0B/L2B for the finite-projective/sheaf dictionary in the lattice application. |
| HR | QWittVectors QW.0–QW.4, including generic Λ/big Witt inputs; PrismaticCohomology PR.0/torsionfree-frobenius-equivalence; EnhancedDerivedSheaves E0/E1/E3/E5:abstract; StableHomotopyKTheory H.5:spectra/H.5:S-delooping/H.6; DerivedDeRhamCohomology DD.1; SolidAnalyticRings SA.1's explicitly conditional full light-solid spectral contract; VStackSheavesAndLisseCategories VS2's abelian framework; HabiroNumberFields HB.6/HB.7 for actual scalar rings and K₃-indexed lines; QSeriesPartitionsAndMockModularForms QM.0/q-binomial-coefficient in §2.13. |
| HC | No other roadmap construction input. Its QSeries, HabiroNumberFields, HabiroNahmSeries, ArithmeticQuantumTopology, I and QWittVectors table lists consumers of its classical toolkit. |
| RT | EnhancedDerivedSheaves E0/E1/E3/E5; GeneralizedCohomology G2–G3/G5.4; StableHomotopyKTheory Layer 5 and §§7.6–7.34; TopologicalKTheory T1.6/T2.1/T2.3/T2.5/T3/T4/T5.1; CharacteristicClasses C3/C5/C6.2–C6.3; DGAInfinity Layers 6/8/9; GeneralAlgebraicKTheory §§3.2/3.12–3.14, Layers 5–8, §§10.10–10.11/11.15–11.16/12.10/13.1/13.6–13.7; KTheoryLowDegrees §§3.2–3.7/13.2–13.4; K2SymbolsBrauer §§13.1/13.7/13.12/13.13; DerivedDeRhamCohomology Layers 0–5 and PD; BordismFormalGroups F6.1/F6.5; AInfCohomology AI.0/AI.0:integral/AI.1/AI.3/AI.4/AI.7.2; CrystallineCohomology CR.4; PrismaticCohomology Layer 2; PrismaticCohomologyPartII Layers 3–5; PrismaticCohomologyPartIII §§6.8–6.9/6.28/6.31/7.0; VStackSheavesAndLisseCategories VS2. CohomologyComparisons §3.7 records the graded Beilinson normalization supplied through PrismaticCohomologyPartIII §7.0, and is also named as a preceding comparison supplier in RT's scope. |
| II | StableHomotopyKTheory §7.32; PrismaticCohomology Layer 0; PrismaticCohomologyPartII §§3.1/3.13–3.16/3.20–3.23/5.7–5.8; PrismaticCohomologyPartIII §7.0; AInfCohomology AI.7.2. HC §5.3 is used through HR.5 for the localized Taylor-factor example, not as an additional prerequisite for trace constructions. |

I's q-de Rham–Witt/framed constructions are owned in its own HQ.4/HQ.1,
not external QW.5/QW.6 suppliers. HR's mention of HabiroRingsPartII after I
is a downstream assignment, not an HR → I input. Likewise HR's references
to RT as a consumer add no HR → RT edge. The former three-cycle through
HR → I has therefore been removed from the scalar HR package. It would be
incorrect to report that old edge as still present.

Native inputs throughout include polynomial and power-series rings,
cyclotomic polynomials, modules, finite projectivity, ordinary diagrams,
étale/smooth algebras, Witt vectors, divided powers and ordinary adic
completion. I additionally consumes Tau Ceti's diagonal-torus character API;
HR its all-conjugates cyclotomic maps; RT its finite-cyclic algebraic Tate
parity comparisons. II uses only Mathlib's arithmetic, polynomial,
number-field discriminant and localization carriers. These native inputs do
not supply enhanced completion, trace spectra or chosen q-Hodge pairs.

### Required repairs outside this job's editable scope

**R1 — I still imports RT.** The design relocation manifest has not been
applied to I. Move/remove its Layer 6 §§6.1–6.5 in accordance with that
manifest: trace existence and local/identity-cover comparisons are imported
from RT; the perfected-lift criterion is II §2.2; the arithmetic export is
II Layer 4. Move the trace clause of §8.1 to II §3.3. Move §9.15's trace
comparison clause to II's independent-construction boundary, retaining the
trace-free PR.3/AI.1/HQ.4 construction directions in I. Remove RT from I's
remaining scope, contracts and aggregate dependency lists, and redirect
downstream mentions of the former Layer 6 in §§4.28 and 5.26. Preserve
I's algebraic higher-power theorem, exponent-one failure and finite-
coefficient rational corner. **Do not remove RT → I §4.28/§5.26:** those
are genuine prerequisites. The actual I ↔ RT cycle remains until this move.

**R2 — HC §5.5 points back to HR.** HR consumes HC's classical completion
toolkit, whereas HC §5.5 imports HR Layer 2's derived completion. Move
`ordinaryDerivedComparison` and its derived checks to HR Layer 2, after
the derived completion and its static-module comparison. HC keeps its
ordinary polynomial-module exactness and the arbitrary-module nonexactness
example. Update HC's scope and Layer 5/§6.4 summaries accordingly. At the
target level one can already stage HC's classical core → HR.2 → HC §5.5,
but that is not an acyclic order of the five whole packages.

HR §2.13 also cites the higher QSeries QM.0 for
`CountableSolidHabiroTensor.factorial_mul_dvd`. Replace this supplier by
HC Layer 1's `qBinomial_factorial` and `qFactorial_pochhammer`: they give
P_a P_b ∣ P_(a+b) in ℤ[q]. QSeries already consumes this classical toolkit;
no additional Gaussian-polynomial target is needed in either package.

**R3 — RT still cites the former HR.6 comparison.** Current HR.6 is scalar
extension and transported number-field lines. Retarget RT's étale
Habiro–Hodge input in its scope, supplier contract and §6.14 to I §4.21
(QH Corollary 3.13, p.27). This adds no reverse dependency: RT already
imports I Layer 4. Part II's analogous references are repaired here.

**R4 — the full framed theorem has two incompatible ownership records.**
The plan's `HT-RT-framed` request explicitly assigns full KU Theorem 6.10
and its prime-two resolution comparison to RT. The package instead owns
`framedTrace`, `framedTrace_einfty`, `qPDDiagonal` and `framedCech` in
§§3.1–3.2, while RT §6.10 supplies only the ℤ[x] example. The expanded
statements have a source-based proof route, but this does not close the
plan's ownership request automatically. To preserve the plan, move those
full framed targets and their checks to RT §6.10, and make II §3.3 consume
that exact contract. Alternatively the maintainer must explicitly reassign
the request and its consumer edges to II, keeping RT's one-variable result
as a specialization. No second general construction should be introduced.
This review edits neither packet nor RT and does not claim that request
closed.

After R1–R3 and the QSeries retargeting, a supplier-first order for the
five packages is **HC → HR → I → RT → II**, with HC §5.5 now in HR.
R4 can follow the plan in that order. External arithmetic, enhanced,
spectral and prismatic contracts must precede their consumers; in
particular HR's HB.6/HB.7 inputs precede HR, while later trace applications
remain downstream. This is a conditional order for this audited family,
not certification of every external roadmap's entire dependency graph.
The Caraiani–Newton list does not assign these Habiro packages an owned
numerical tier; none is invented here. **There is no such order for the
five packages as currently checked in**, because both I ↔ RT and HC ↔ HR
remain.

## Corrections applied to Part II

1. `TraceInput.ofIdentityCover` now requires the global cotangent complex
   to have Tor-amplitude [0,1], as its ambient category and KU 4.18(R),
   p.46, require. Local hypotheses alone do not imply this: the new check
   R = ℚ[u,v]/(u²,uv,v²) has zero completion at every prime, but is not
   quasi-lci. Its local defining ideal has height two and three minimal
   generators. This prevents an invalid constructor even though all local
   spectral inputs are zero.
2. Removed obsolete HR.6 étale-comparison references from the scope,
   contracts, target prerequisites and checks. The comparison now comes
   from I §4.21; scalar maps remain HR.5. The noninjectivity of the
   order-one Taylor map after inverting 6 is sourced to HC §5.3 through
   HR.5 and GSWZ Remark 1.2, p.7.
3. Strengthened the justification of `traceHabiro_kuLiftInsufficient`:
   QH Lemma 3.3, p.22, excludes any q-Hodge pair on the exponent-one
   perfected quotient. Merely showing that an identity-cover spherical
   lift fails would not exclude all possible trace inputs and covers.
4. The diagonal λ-expression explicitly inverts h as well as the
   q-factorials. Read Pridham Remark 1.2 and Lemma 1.3, §1.1, p.3,
   directly and added their primary reference. Corrected the sign check
   to compare **h^d times** the Pochhammer-normalized generators with
   the chosen δ-generators. The package already recorded the source's
   sign/normalization slip; the short check had lost this factor.
5. Added the printed page 1374 to Higher Algebra Theorem 7.5.0.6 and
   the exact Stacks Example 60.19.1 locator to Tag 07L7.

No target, API item or test was dropped for size. Suggested.lean and
metadata.toml are unchanged. No supplier package or packet was edited.

## Mathematical and plan coverage

All four plan nodes are represented: HT.1 `trace-habiro` in §§1.1–1.3;
HT.1 `perfected-lift-naive` in §2.2; HT.2 `canonical-framed-trace` in
§3.3; HT.2 `number-field-trace-exports` in §§4.1–4.2. Their 14 API items,
11 construction checks and theorem acceptance conditions are retained.
§2.1 makes the structured quotient ranges explicit and §2.3 states the
global quasi-regular comparison as an assembled theorem rather than
misattributing that exact global statement to a source. R4 records the
additional framed ownership discrepancy.

The trace boundary request is supported by RT §6.1's explicit ku-lift
counterexample; quotient ranges are supplied here over the imported
Burklund towers. Independent Nygaard construction is provided precisely
by PrismaticCohomologyPartII §§3.1, 3.13–3.16, 3.20–3.23, while the
trace comparison belongs to Part III §7.0 and AInf AI.7.2. The package
does not define either filtration by their comparison theorem. It retains
the Frobenius twist and Breuil–Kisin twists, and distinguishes prismatic
cohomology from its Nygaard completion.

The following adversarial checks cover every definition/construction
family, including definitions absent from Lean because their carriers
do not exist at the pins. Each family has at least three discriminating
README checks; the rows summarize the mathematical checks made here.

| Target family | Checked boundary cases and plausible wrong alternatives excluded |
| --- | --- |
| `TraceInput` and constructors | E₁ data at 2 unless completion is zero; full augmented Čech coherence rather than a ring map; ℤ[x] needs the perfect-root cover at 2; branch changes are not morphisms; rational non-lci counterexample to the old constructor. |
| `tracePair` | Four pair clauses, including separate p-adic rational data; zero ring has a nonzero constant rational uncompleted filtration but zero completion; q^r−1 differs from [r]_q; multiplicative level follows Eₙ₋₁ rather than automatically E∞. |
| `traceHabiro` | Étale H and q-Witt reductions; unit's filtered β-quotient rather than a degreewise h-quotient; polynomial h-completion has the q-Hodge differential; conjugate and Hodge filtrations live on different reductions; zero output despite the uncompleted rational corner; genuine ku-lift nonexample. |
| Exponent predicates and `quotientLift` | At 2, E₁ exponents 2/3/5 fail and 4/6 pass; E₂ starts at even 6. At 3, E₁ starts at 2 and E₂ at 3. S/8 lies outside this sufficient criterion despite admitting E₁ structure. Empty tensor and regular-sequence versus spectral-cofiber roles are distinct. High-powered 1/9/16/64 pass; 8/32/12 fail. |
| `perfectedLiftNaive`, `_qReg` | Lift is after perfection, at every required prime; completion is (p,h)-completion; toric x−1 quotient contrasts with the free-δ exponent-one failure; p=2 algebraic square criterion is stronger than this spherical route; rational gluing corner retained. |
| `tracePair_quasiRegular` | Identity-cover, torsion-free domain; finite coefficients excluded; local naive comparisons glue with the rational comparison and ψ⁰ maps; lift independence concerns those pairs, not arbitrary spherical input choices. |
| `framedTrace`, `_einfty` | Dimensions 0/1/2 and no unnecessary prime inversion for framed existence; explicit perfectoid-versus-polynomial resolution comparison at 2 is a target, not a theorem claimed proved in KU Remark 3.10; q-Leibniz on x² differs from ordinary Leibniz. |
| `qPDDiagonal`, `diagonalNumerator` | δ⁰=1, δ¹=x−y, δ²=(x−y)(x−qy)/(1+q); q=1 yields ordinary divided powers; q-shift identity and the y-derivative shift; h-localization and Pochhammer sign checked against Pri. Classical numerator has residual (q−1)²xy in the degree-two shift identity. |
| `framedCech` | Degree zero is S[[h]]; regular diagonal and q-PD base change retain their hypotheses; identity-cover inputs over every P^n are explicitly part of the proof target; positive-degree cosimplicial acyclicity uses the specified Stacks model. |
| `canonicalFramedTrace` | d=0/1 versus d=2 requiring 2 inverted for the canonical construction; fixed counit-induced map and mod-β identity, not arbitrary uniqueness; ℚ[x±¹] distinguishes qdR from qΩ; H⁰(M/^Lh)=ℤ[x] differs from H⁰(M)/h=ℤ. |
| `TraceInversion`, `genuineRealisation` | ℚ with Δ=6 passes and Δ=1 fails; ℚ(i) needs Δ=12 rather than 6 under the chosen discriminant-divisibility convention; cubic discriminant −108; Δ positive; units 2 and 3; periodic KU; genuine fixed points, residual-circle fixed points, spectral divisibility limit, then π₀. |
| `numberFieldTraceExports` | m=1 quotient is R and completion is R[[h]], without claiming Taylor injectivity after localization; constant i fails at inert 7 while its Frobenius-twisted family glues; nonabelian cubic at 5 requires completed componentwise Frobenius; full coefficient tensor algebra retained; independent Taylor families fail prime-edge gluing; naturality uses a common admissible Δ; no K₃/module or higher-homotopy conclusion. |

The cubic computation is explicit: x³−2=(x−3)(x²+3x+4) modulo 5,
and the quadratic discriminant is 2, a nonsquare modulo 5. At 7 in
ℚ(i), Frobenius sends i to −i. These tests prevent a false global
Frobenius endomorphism for a nonabelian field and a false untwisted
Taylor equalizer. The localized components indexed by the 2- and 3-adic
valuations of root orders explain why the order-one Taylor map is not
injective for ℤ[1/6].

## Primary-source verification

All versions below were accessed on 2026-10-20. No uncleared book was
used. Public PDFs were read in scratch only; no source text is included
in the repository. The package does not directly replan a classical
Habiro theorem or cite a Wang–Scholze theorem: classical results are
imports from HC/HR. GSWZ's actual definition and coefficient conventions
were read directly rather than treating those roadmap imports as source
verification.

| Source | Fixed public version | SHA-256 |
| --- | --- | --- |
| QH | [2510.04782v2](https://arxiv.org/pdf/2510.04782v2) | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| KU | [2510.06057v1](https://arxiv.org/pdf/2510.06057v1) | `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d` |
| TC | [2410.23115v4](https://arxiv.org/pdf/2410.23115v4) | `4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4` |
| GSWZ | [2412.04241v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| Bu | [2203.14787v2](https://arxiv.org/pdf/2203.14787v2) | `22970ed6b856ce523e6682cc00c14f4875145b19c2923a2dbffff937f4eaf181` |
| BS | [1905.08229v4](https://arxiv.org/pdf/1905.08229v4) | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |
| BMS2 | [1802.03261v2](https://arxiv.org/pdf/1802.03261v2) | `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038` |
| Pri | [1608.07142v4](https://arxiv.org/pdf/1608.07142v4) | `f00412c88e3713dab6089c4e470e2af42ee04cdfbf151a9ea8b800ce3cc4f62f` |
| HA | [Higher Algebra, September 2017](https://www.math.ias.edu/~lurie/papers/HA.pdf) | `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3` |

The mandatory random sample was chosen reproducibly with seed 11390
before the supplemental checks. All fifteen locators were inspected in
the above primary texts; page numbers below are printed pages.

| Sample | Locator | Check |
| --- | --- | --- |
| 1 | QH Lemma 3.3, p.22 | Excludes any pair for the exponent-one perfected quotient. |
| 2 | Bu Remark 5.5, p.12 | Squared elements have the required unital multiplication at 2. |
| 3 | QH Examples 4.24–4.25, pp.63–64 | Free-δ failure versus toric x−1 lift example. |
| 4 | KU Remark 3.10 / Proposition 3.11, p.27 | Perfectoid replacement is indicated; polynomial resolution has the proved proposition. |
| 5 | QH Definition 3.2, pp.20–21 | All four pair clauses and their compatibilities retained. |
| 6 | QH Example 3.12, pp.25–26 | Framed coordinate filtration and initial E₀ level. |
| 7 | KU Remark 4.28 / Lemma 4.29, pp.50–51 | Eₙ₋₁ structure and glued ψ⁰ compatibility, including the 2-adic condition. |
| 8 | KU 4.18 / 4.18a, pp.46,49 | Global cotangent/torsion hypotheses and the E₁ addendum at 2. |
| 9 | QH Remark 4.4, p.55 | Specific counit-induced comparison, not unrestricted uniqueness. |
| 10 | QH Construction 4.28 / Theorem 4.29, p.66 | Arithmetic gluing of the quasi-regular section. |
| 11 | Bu Theorems 1.4–1.5, p.2 | Right-unitality and v-compatible Eₙ quotient towers with exponent q>n. |
| 12 | KU Examples 6.8–6.9, pp.82–83 | E₁/E₂ ranges, even exponents at 2, and identity-cover hypotheses. |
| 13 | BMS2 Theorem 1.12, pp.6–7 | Quasisyntomic motivic filtration, Nygaard completion and twists. |
| 14 | QH Lemmas 4.6–4.7, pp.55–56 | Canonical smooth pair has dimension and small-prime-inversion conditions. |
| 15 | QH Theorem 4.22(b), pp.62–63, proof pp.65–66 | Spherical E₁ lift of the perfected base change suffices. |

Supplemental checks covered KU 1.9–1.11 (p.5), 3.1–3.2 (p.24),
4.17 (p.45), 4.25–4.27 (pp.49–50), 5.43 (p.70), 5.62–5.63
(pp.79–80), 6.7–6.15 (pp.82–86); QH 3.5–3.6 (p.22), 3.11–3.13
(pp.25–27), 4.21 (p.62), 4.26–4.27 (pp.64–65); TC 3.3–3.8
(pp.30–32); Bu 1.1 (p.1), 5.7 (p.12); BS 15.3 (pp.103–104),
15.7 (p.105), 16.10 (pp.110–111), 16.22 (p.115); GSWZ Definition
1.1, equations (12)–(15), footnote 1 and Remark 1.2 (pp.6–7), with
the all-components Frobenius construction in §5.3 (p.65); Pri Remark
1.2/Lemma 1.3 (p.3); HA Theorem 7.5.0.6 (p.1374); and
[Stacks Example 60.19.1, Tag 07L7](https://stacks.math.columbia.edu/tag/07L7).

The package already identifies three source issues, independently
checked here: KU 6.15's proof points to QH 3.12 instead of Corollary
3.13; TC 3.5/3.7 omit the nonzero rational corner of the uncompleted
finite-coefficient pair; KU 6.11's Pochhammer convention needs the
displayed normalization correction. The zero-algebra de Rham rational
corner is verified using its derived presentation by the disjoint
fibers y=0 and y=1 over ℚ[y] and the uncompleted Poincaré lemma.
Completing the constant filtration kills that corner; the completed
trace comparison is unaffected. None of these source slips is silently
promoted to a theorem in the package.

## Library, form and Lean checks

Read the library audit entries for I, HR and RT, then checked the actual
carriers and declarations rather than relying on the audit's older HR.6
ownership. Current upstream was inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine roadmaps
newer than the atlas snapshot and Completed roadmaps. Current Tau Ceti
was inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Searches included mathematical terms for filtered pairs, spherical
lifts, cyclonic actions, q-divided powers and Nygaard/trace objects,
not just proposed declaration names. No retained target was found
already implemented there, and no target was removed as a duplicate.
Ordinary associative divided powers do not construct this completed
q-PD diagonal. The upstream DGAInfinity and StablePeriodicCurved READMEs
and suggested-file forms were read as nearby models. No build was run
in the read-only current upstream/library checkout.

Pinned Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`, with
Tau Ceti baseline `f790474821cf4256814db967cb154e7af3d0c369`.
Read the statements of `NumberField.discr`, `Rat.numberField_discr`,
`IsLocalization.Away.algebraMap_isUnit`, `map_dvd`,
`isUnit_of_dvd_unit`, `Commute.isUnit_mul_iff` and the polynomial
evaluation API used by the suggested file. In particular the localization
theorem uses only 6 ∣ Δ to obtain units 2 and 3; positivity and the
discriminant condition have their separate arithmetic roles.

`lean-check` on this package's absolute Suggested.lean path returned
**exit 0, no errors and no warnings**, after the required memory check.
The 156-line file has one `import Mathlib`, four real-bodied light
definitions, three proved theorems and four proved examples. It has no
`sorry`, sorry'd data, `set_option`, placeholder conclusion or invented
enhanced carrier. The polynomial identities are headline checks on an
existing polynomial ring, not an auxiliary theory development.

All eleven signatures were compared with the README (exceeding the
required ten):

| Declaration or example | README agreement |
| --- | --- |
| `E1QuotientExponent` | §2.1 sufficient primewise range, with the standing prime convention. |
| `E2QuotientExponent` | §2.1 even ≥6 at 2, ≥3 at odd primes. |
| First exponent example | §2.1 rejects 2/5 at prime 2, accepts 4 there and 2 at prime 3. |
| E₂-implies-E₁ example | §2.1 inclusion holds on the defined predicates. |
| `diagonalNumerator` | §3.2 variables ordered x,y,q and factors indexed 0,…,d−1. |
| `diagonalNumerator_shift` | §3.2 shift of x, coefficient q^(d+1)−1 and the extra x. |
| Degree-two shift example | §3.2 nontrivial normalization control. |
| `diagonalNumerator_one` | §3.2 q=1 numerator is (x−y)^d. |
| `TraceInversion` | §4.1 positive integer, 6-divisibility and discriminant-divisibility as separate conjuncts. |
| Rational inversion example | §4.1 ℚ/6 admissible, ℚ/1 inadmissible. |
| `TraceInversion.isUnit_two_three` | §4.1 units in exactly Localization.Away (Δ : 𝓞 F). |

The closing comment lists every heavy README definition/construction
family intentionally absent from Lean. Elaboration proves the compact
native statements only; it does not formalize the spectral or enhanced
targets in the README.

The README has the summary, scope, conventions, exact contracts, four
ordered layers, APIs, discriminating checks, examples, dependencies and
references required by the upstream form. It remains below the issue's
200 KB limit, uses mathematical prose in our own words, and contains no
job/review/packet narrative. Metadata is the single fitting line
`topic = "math.AT"`.

Validation: `scripts/check_blueprint.py` on the unchanged supplied plan
returned 0 errors and 0 warnings (four nodes, three requests, zero closed
stages). `research/blueprint/intake.py check-files` on all four changed
deliverables and `git diff --check` passed. The handoff records the exact
out-of-scope repair locations; no private path or source passage is
included in any deliverable.
