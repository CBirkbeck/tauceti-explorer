# Fix report: Habiro cohomology foundations, Part II

Issue #11429; Codex, session `codex-bP0ZtX`; 2026-10-20.
**Complete fix assessment: accepted.** All four findings of the actual
independent review are resolved in the merged supplier files and this
consumer package. This is a fix assessment, not an independent review or
a claim that the planned mathematics has been formalised.

The requested `REV-PKG-HabiroCohomologyFoundationsPartII~adv.md` does not
exist. The findings are in
`research/blueprint/reviews/REV-PKG-HabiroCohomologyFoundationsPartII~codex1.md`.
That report, the package, its review record, and the previous blocked fix
`FIX-PKG-HabiroCohomologyFoundationsPartII~adv1.md` were read in full.
The previous fix had already repaired the in-scope consumer mathematics;
it could not certify the then-unmerged supplier changes. This run checks
the actual merged files and completes that work. Only the four paths
authorised by #11429 are changed.

## Findings and changes

| Finding | Disposition and evidence in the actual packages | Change in this submission |
| --- | --- | --- |
| R1: Part I imports the trace theory that consumes Part I | Resolved. Part I no longer has the old trace-existence Layer 6, its trace example, or its trace construction/comparison clause as prerequisites. Current Layers 6–8 are analytic questions, algebraic examples and comparison squares. Its references to RT are consumer notes. RT still imports the genuine algebraic inputs I §§4.28 and 5.26. | State the complete five-package supplier order. Repair the now-stale I §§9.18–9.19 reference to §§8.18–8.19. Preserve II's absolute constructor, coherent relative inputs, perfected-lift theorem, framed line example and arithmetic export. |
| R2: HC imports HR's derived completion while HR imports HC | Resolved. HC scope, §5.5, Layer 5 dependencies, §6.4 and Lean now contain only ordinary completion inputs and targets. HR §2.4 receives `ordinaryDerivedComparison`, with arbitrary coefficient modules, finite projections and naturality. HC retains ordinary coefficient-module exactness and its distinct arbitrary-polynomial-module counterexample. The maintainer's #11421 supplied the outgoing-edit authorisation missing from the previous checkpoint. | Name HR §2.4 and its exact generality in the supplier contracts and explain HC's preceding ordinary input. Verify both ends of the relocation against merged main. |
| R2 auxiliary: HR uses higher QSeries for factorial divisibility | Resolved. Current HR §2.14, renumbered from the earlier §2.13, uses HC Layer 1 `qBinomial_factorial` and `qFactorial_pochhammer`. It derives P_(a+b)=P_a P_b [a+b choose a]_q integrally, without cancellation. | Record the actual receiver locator and retain the HC → HR direction. No second Gaussian-polynomial target is introduced. |
| R3: RT refers to obsolete HR.6 cohomological comparison | Resolved. RT scope, exact suppliers and §6.14 use I §4.21, exported by §4.28, for QH Corollary 3.13. HR §§5.8–5.9 supply the coefficient localisation and number-field scalar ring. HR.6 retains scalar extension and transported arithmetic lines. | Preserve II's already-correct I §4.21 references and verify the upstream end of each consumed comparison. |
| R4: two owners of the full framed theorem | Resolved. RT §6.10 owns all dimensions, its prime-two resolution comparison, q-PD diagonal, completed Čech model, pair comparison and multiplicative refinements. II has no duplicate §§3.1–3.2 or diagonal Lean development; §3.3 owns only the canonical comparison on the common domain. | Name the precise RT exports `framedTrace.twoAdic`, `framedTrace_completed`, `framedTrace_pair` and `framedTrace_einfty`. Include the corrected full-diagonal completion and the separate static-commutative totalisation contract. These remain supplier proof targets. |

The previous independent review's other corrections remain present:
global cotangent amplitude in `ofIdentityCover`; the QH Lemma 3.3
obstruction to every pair in the exponent-one example; the h-localisation
and Pochhammer sign/factor warning; Higher Algebra's printed p.1374; and
Stacks Example 60.19.1, Tag 07L7. No hypothesis, API item, Check or worked
example is removed from the README.

The Lean definitions and proofs are unchanged. Their documentation now
distinguishes total arithmetic predicates on natural inputs from their
prime-only spectral applications. The long closing name catalogue is
removed; the module introduction still explains the missing carriers,
and all heavy targets remain in the README. The exponent Checks are
separated into individual tests, retaining every existing boundary case.

## Merged supplier evidence

The clone started at `262793b57bb41c380bc4230122c64b2493aecaf2` and was
fast-forwarded to main `424694e1a` after HC's donor repair merged. The
following are merged commits, whose actual package files were read;
unmerged PR descriptions were not used as supplier implementations.

| Supplier change | Merged PR and commit |
| --- | --- |
| Part I outgoing trace relocation, #11401 | [#11417](https://github.com/CBirkbeck/tauceti-explorer/pull/11417), `3459b154ac96d86599680b20d7978d811e3c3b6a` |
| HR receiver and Gaussian retargeting, #11403 | [#11410](https://github.com/CBirkbeck/tauceti-explorer/pull/11410), `4b18c1d29c8e6b0a3f14b82a0abce44e245327cf` |
| Subsequent HR independent review | [#11420](https://github.com/CBirkbeck/tauceti-explorer/pull/11420), `f0d36af2e5b6bcf65156a12d02fa3a4244667733` |
| RT full framed receiver and étale locator repair, #11406 | [#11412](https://github.com/CBirkbeck/tauceti-explorer/pull/11412), `5707f54710cf515653834a23c2764c75b4db9575` |
| Subsequent RT independent review, #11415 | [#11425](https://github.com/CBirkbeck/tauceti-explorer/pull/11425), `068165cc929e846516dbb4cf7b861b5c54c358ea` |
| HC outgoing derived-comparison removal, #11421 | [#11427](https://github.com/CBirkbeck/tauceti-explorer/pull/11427), `c390dbd26f8862c474801831136af5abca90d6f3` |

Some sibling review records still describe the external blockers at the
time those reviews were written. Their historical status is not used to
infer a present construction edge. No sibling review record is edited.

## Supplier inventory and conservation

Let HC = HabiroCyclotomicCompletions, HR = HabiroRings,
I = HabiroCohomologyFoundations, RT = RefinedTraceMethods and II = this
Part II. The table lists **consumer → supplier** edges. Its supplier-first
order is **HC → HR → I → RT → II**.

| Consumer | All direct suppliers within the five | Contracts |
| --- | --- | --- |
| HC | None | Ordinary polynomial topology/completion, coefficient modules, Taylor maps and rigidity. Its consumer table is outgoing use, not construction input. |
| HR | HC | HC.1 factorial/Gaussian toolkit and cofinal topology; HC §2.3 Laurent comparison; HC.3 Taylor substitution; HC.4 rigidity; HC.5 root/coefficient results and §5.1 ordinary polynomial-module exactness. Derived comparison is now HR §2.4. |
| I | HR; HC | HR.1–HR.5 bases, enhanced scalars, finite reconstruction, degree-zero q-Witt and relative Habiro/Taylor interfaces; HC.3 Taylor re-expansion and Hasse coefficients. No RT or II construction prerequisite remains. |
| RT | HR; I | HR.1/HR.2/HR.5 scalar and coefficient contracts; I Layers 2–4, especially §4.21 étale comparison and §4.28 pairs/descent, and §5.26 finite coefficients. No I trace-existence layer or II construction is imported. |
| II | HR; I; RT | HR.1/HR.2/HR.5/HR.7; I §§1.14/1.16, Layers 2–5; RT §§6.1/6.9–6.14/7.6/8.8. HC §5.3 reaches the localized Taylor example through HR.5. RT §8.12 owns syntomic comparisons. |

The other supplier edges, distinguished from native library inputs and
downstream consumers, remain as follows. This certifies the audited
five-package split, not a global order of every external roadmap. No
numerical tier absent from the ordering file is invented.

| Consumer | Other roadmap suppliers |
| --- | --- |
| HC | None. Its QSeries, HabiroNumberFields, HabiroNahmSeries, ArithmeticQuantumTopology, I and QWittVectors references identify consumers. |
| HR | QWittVectors QW.0–QW.4; PrismaticCohomology PR.0/torsion-free Frobenius; EnhancedDerivedSheaves E0/E1/E3/E5:abstract; StableHomotopyKTheory H.5:spectra/H.5:S-delooping/H.6; DerivedDeRhamCohomology DD.1; SolidAnalyticRings SA.1's conditional full light-solid spectral contract; VStackSheavesAndLisseCategories VS2 abelian framework; HabiroNumberFields HB.6/HB.7 scalar rings and K₃-indexed lines. The higher QSeries input has been removed. |
| I | DerivedDeRhamCohomology DD.0–DD.4; EnhancedDerivedSheaves E0/E1/E2/E5; PrismaticCohomology PR.0–PR.3/PR.6; PerfectoidQuotients Q3; AInfCohomology AI.1/AI.3–AI.5; CrystallineCohomology CR.0/CR.2/CR.4; CohomologyComparisons CP.1/CP.6; AnalyticHabiroStack HS.3 for the open analytic comparison; current upstream AlgebraicVectorBundles L0B/L2B for finite-projective sheaves. |
| RT | EnhancedDerivedSheaves E0/E1/E3/E5; GeneralizedCohomology G2–G3/G5.4; StableHomotopyKTheory Layer 5 and §§7.6–7.34; TopologicalKTheory T1.6/T2.1/T2.3/T2.5/T3/T4/T5.1; CharacteristicClasses C3/C5/C6.2–C6.3; DGAInfinity Layers 6/8/9; GeneralAlgebraicKTheory §§3.2/3.12–3.14, Layers 5–8, §§10.10–10.11/11.15–11.16/12.10/13.1/13.6–13.7; KTheoryLowDegrees §§3.2–3.7/13.2–13.4; K2SymbolsBrauer §§13.1/13.7/13.12/13.13; DerivedDeRhamCohomology Layers 0–5 and PD; BordismFormalGroups F6.1/F6.5; AInfCohomology AI.0/AI.0:integral/AI.1/AI.3/AI.4/AI.7.2; CrystallineCohomology CR.4; PrismaticCohomology Layer 2; PrismaticCohomologyPartII Layers 3–5; PrismaticCohomologyPartIII §§6.8–6.9/6.28/6.31/7.0; VStackSheavesAndLisseCategories VS2; CohomologyComparisons §3.7's normalization through PrismaticCohomologyPartIII §7.0. |
| II | StableHomotopyKTheory §7.32; PrismaticCohomology Layer 0; PrismaticCohomologyPartII §§3.1/3.13–3.16/3.20–3.23; PrismaticCohomologyPartIII §7.0; AInfCohomology AI.7.2. The q-PD inputs of PrismaticCohomologyPartII §§5.7–5.8 are consumed through RT §6.10. |

HR's HB.6/HB.7 scalar contracts must precede their consumers, even though
later trace applications of number-field rings follow II. The conditional
solid spectral contract is still conditional. I's positive-degree
q-Witt/framing interfaces are constructed in its own HQ.4/HQ.1, rather
than creating reverse edges to the external names QW.5/QW.6.

All relocated content has a receiver:

| Material | Current receiver or preserved owner |
| --- | --- |
| Old I §6.1 existence and relative hypotheses | RT §§6.9–6.10; II §§1.1–1.3 supplies the input category and functorial descent. |
| Old I §6.2 ku/image-of-J boundary | II §1.1 `TraceInput.kuLift` and §1.3 `traceHabiro_kuLiftInsufficient`, importing RT §6.1. Only the proved E₁ ku obstruction is asserted. |
| Old I §6.3 identity-cover/E₁ refinement | RT §6.9; II §1.2 coherent Čech descent and §2.3 canonical comparison. |
| Old I §6.4 perfected lift | II §2.2; I §5.19's algebraic square-at-2 proof and §5.20's exponent-one failure are retained. |
| Old I §6.5 arithmetic export | II §§4.1–4.2 after RT §6.14, with genuine fixed points and periodic KU. |
| Old I §8.1 trace example and §9.15 trace comparison direction | II §3.3 line example and Scope's independent-construction boundary; I's trace-free examples/squares remain. |
| Old HC §5.5 derived comparison | HR §2.4; HC §§5.1/5.5 retain ordinary exactness and its arbitrary-module boundary. |
| Former II §§3.1–3.2 framed/q-PD/Čech construction and diagonal signatures | RT §6.10, including normalization Checks, all dimensions, full diagonal completion and prime-two resolution comparison. II §3.3 consumes that theorem. |

The four plan nodes remain covered: `trace-habiro` by §§1.1–1.3,
`perfected-lift-naive` by §2.2, `canonical-framed-trace` by §3.3, and
`number-field-trace-exports` by §§4.1–4.2. Their fourteen API items and
eleven construction tests remain represented. Section 3.3 keeps its
stable consumer locator; no empty sections replace the moved targets.

## Adversarial pass

These are mathematical checks in addition to Lean elaboration. Heavy
carriers remain README targets; no spectrum or enhanced filtration is
encoded by a placeholder proposition. Supplier proof targets are checked
for their required statement and route, not reported as proved theorems.

| Statement or interface | Instances and negative controls tried | Result and change |
| --- | --- | --- |
| Supplier order and completion comparison | M=0, M=𝔽₂, Laurent multiplication by q−1 versus q⁰−1; arbitrary module with q acting as 1 | HR §2.4 applies to polynomial coefficient modules without flatness/torsion assumptions. At positive order multiplication is injective by its highest coefficient; order zero and arbitrary q-torsion modules are excluded. Consumer contract now matches. |
| HC ordinary-module boundary | Family (P_k), modulo P_N; hypothetical preimage (1)_k; old ((q−1)^k) modulo Φ₂ | (P_k) decays and maps to zero in the completed cokernel, but the preimage has infinite support modulo P₁. The old family has nonzero residues (−2)^k and is rejected. Actual donor repair preserves this distinction. |
| Independent Nygaard and trace filtrations | Covers versus global THH; grades n=0,1; Δ versus Nygaard-completed Δ̂ | Keep independent Frobenius-divisibility and Postnikov-descent definitions, twists and completion. No θ/Witt-map equality follows. Only the renumbered I §§8.18–8.19 locator changes. |
| `TraceInput`, forgetful/local data and morphisms | R=A=ℤ, R=0; identity of ℤ[x] across different E₁/E₂ branches; bare ring map | Full lifted augmented diagrams, rational identifications and gluing coherences are required; the bare identity is not a mixed-branch morphism. No weakened constructor introduced. |
| `ofSpherical`, `ofFramed`, `ofEtale`, `ofIdentityCover`, `unit` | ℤ[1/2][x], ℤ[x], d=0/1/2; all p-completions zero for ℚ[u,v]/(u²,uv,v²) | At 2 use the E₁ cover unless completion vanishes. The rational non-lci ring still fails global Tor-amplitude despite its zero local completions. Torsion and étale hypotheses retained. |
| `tracePair` and map/completion/clause laws | Unit, zero ring, polynomial line; filtered mod-β versus degreewise mod-h | Unit quotient is ℤ in nonpositive degrees and zero in positive degrees. Zero ring retains constant uncompleted ℚ[[h]] but has zero filtration completion. Preserve all four clause data and coherent functor laws. |
| `tracePair_multiplicative` | n=2/∞; odd E₂ input; identity and perfect-root Čech covers at 2 | E₂ gives E₁ and E∞ gives E∞. Identity-cover descriptions are applied termwise before coherent descent; no ordinary-preimage formula on a general covered R is asserted. |
| `traceHabiro` and its reductions | Unit, zero, polynomial line, m=1; q=1; exponent-one ku lift | H=lim T_(k!) has the supplied h-completion qHdg, not qdR or qΩ. The polynomial differential is (q^r−1), not [r]_q. Hodge and conjugate reductions remain distinct. QH Lemma 3.3 excludes any pair in the ku nonexample. |
| `E1QuotientExponent` and `quotientLift` | p=2, α=0/1/2/3/4/5/6; p=3, α=0/1/2; empty list of y_i | Even α≥4 at 2, α≥2 at odd primes. S/8 remains outside this sufficient range despite its separate E₁ structure. Empty tensor is T. Split Checks retain all boundaries; spectral applications assume prime p. |
| `E2QuotientExponent` and implication | p=2, α=4/6/7; p=3, α=2/3; arbitrary natural p for E₂⇒E₁ | Even α≥6 at 2, α≥3 at odd primes. Proved arithmetic implication is valid for all natural p; README and Lean now say so explicitly. |
| Quotient consequences and high-powered integers | 1/9/16/64 versus 8/32/12; regular sequence versus spectral cofiber | First group passes, second fails. Framed E₁ input retains p-torsion-freeness; identity-cover construction retains relative perfectness and quasi-lci hypotheses. No arbitrary quotient is identified with its ordinary quotient. |
| `perfectedLiftNaive`, `_qReg` | x² at odd p and at 2, x⁴ at 2, exponent one, toric x−1, rational algebra | A lift after perfection suffices at every prime. Descent uses (p,h)-completed flat base change. The algebraic x²-at-2 theorem remains stronger than this spherical route. For toric x−1 the second generator is (x−1)(x−q)/(1+q), reducing to (x−1)²/2. Rational gluing data remain present. |
| `tracePair_quasiRegular` | Perfect-root quotient by x⁴; x² with 2 inverted; ℤ/m; smooth line | Identity-cover/torsion-free inputs compare with the canonical pair; finite coefficients and the non-semiperfect smooth line are excluded. Local preimages and compatible rational gluing compare completions before pullback. |
| Full framed supplier and its 2-adic comparison | d=0/1/2, p=2, form degrees j=0/1/2, filtration i≤0/1/2 | Powers are h^max(i−j,0), with no dimension-dependent prime inversion for the framed theorem. Name `framedTrace.twoAdic` explicitly; an intrinsic E₂ input at 2 alone does not supply the general pair theorem. |
| q-PD/Čech supplier normalization | δ⁰=1, δ¹=x−y, δ²=(x−y)(x−qy)/(1+q), q=1; degree-two shift | Supplier retains the q-generators, y-derivative shift, h-localisation and Pochhammer sign correction. The classical degree-two numerator leaves residual (q−1)²xy in the shift identity. No duplicate native diagonal is added here. |
| Full diagonal completion in the framed model | d=0, A=ℤ[1/2], S=A[i], cosimplicial degree 1 | Full diagonal completion gives S[[h]]. Coordinate differences alone leave (S×S)[[h]] and compute the wrong totalisation. Exact contract now imports this corrected RT model. |
| Framed multiplicative refinements | x² gives (1+q)x dx versus ordinary Leibniz 2x dx; q=1 | E∞ transport uses the trace lift. The stronger derived commutative refinement separately totalises static filtered commutative rings; it is not deduced from an E∞ structure alone. Both supplier clauses retained. |
| `canonicalFramedTrace`, pair/descent upgrades | d=0/1; ℤ[x,y] versus ℤ[1/2][x,y]; Laurent ℚ-torus; specified counit map versus arbitrary map | Canonical comparison needs primes ≤d inverted. The completed comparison reduces to the identity for the specified counit map, then pulls back to qdR. The Laurent qΩ has H¹ while qdR does not; no equality of the two is claimed. |
| Derived reduction of descended line | M=(ℤ[x][[h]] → ℤ[x][[h]]dx), x^r↦(q^r−1)x^(r−1)dx | H⁰(M/^Lh)=ℤ[x], whereas H⁰(M)/h=ℤ. The Bockstein detects the lost classes. Existing Check prevents exchanging reduction and cohomology. |
| `TraceInversion` and units | ℚ, Δ=6/1/0/−6; ℚ(i), Δ=6/12; cubic discriminant −108 | Positivity, 6-divisibility and discriminant-divisibility are distinct. Δ=6/12 can give the same Gaussian localisation but only 12 satisfies the selected condition. Native rational examples and unit theorem remain proved. |
| `genuineRealisation` | m=1; genuine versus homotopy finite fixed points; ku versus KU; π₀ before versus after limit | Keep genuine C_m-fixed points, residual-circle homotopy fixed points, spectral divisibility limit, then π₀, over periodic KU. No restriction/TR maps or higher-homotopy consequence introduced. |
| `numberFieldTraceExports` and all map laws | m=1; inert 7 in ℚ(i); nonabelian cubic at 5; family (1,0,…); field embedding with common Δ | ρ₁ is reduction of τ₁; τ₁ need not be injective after inverting 6. At 7 Frobenius sends i to −i. Modulo 5, x³−2=(x−3)(x²+3x+4), whose quadratic discriminant 2 is nonsquare. Full tensor coefficients and completed componentwise Frobenius are essential. All naturality laws use the supplied maps and common admissible Δ. |

Every definition family has at least three prose tests in the README;
native definitions retain their proved Lean boundary examples. The
filtered, spectral and q-PD tests remain prose specifications on their
actual intended carriers, not axioms on dummy Lean types.

## Sources and library checks

Read WORKERS, both protocols, PACKAGE_REVIEW, UPSTREAM_GUIDE and the
specified PadicMeasuresIwasawaAlgebras exemplar. Read the relevant current
DGAInfinity and StablePeriodicCurved README and Suggested.lean forms.
Current upstream roadmaps were inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the newer roadmaps
and Completed entries, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used the mathematical
objects—q-de Rham, q-divided powers, spherical lifts, cyclonic actions,
Nygaard filtrations, trace inversion and quotient exponents—as well as
names. No retained target was found already supplied there. The existing
associative divided-power API does not construct the completed q-PD
diagonal. No build was run in either read-only checkout.

The reviewed library audit entries HQ.5-trace, RT.4:q-Hodge,
RT.4:Habiro-comparison and RT.6 were read. Their historical HR.6
attribution is superseded by the actual I §4.21 owner. At the pins,
read the statements of `NumberField.discr`, `Rat.numberField_discr`,
`NumberField.RingOfIntegers`, `IsLocalization.Away.algebraMap_isUnit`,
`map_dvd`, `isUnit_of_dvd_unit`, `Commute.isUnit_mul_iff`,
`Algebra.Etale` and `Algebra.Smooth`. The suggested file uses only these
native arithmetic/localisation carriers, not an enhanced completion or
a spectrum. No Tau Ceti import is needed.

Primary passages were checked directly in these fixed public PDFs,
accessed 2026-10-20. Locators are printed pages. All repository prose is
in our own words; no source passage or section-by-section source summary
was added. No restricted book was needed.

| Source and direct checks | SHA-256 |
| --- | --- |
| [KU, arXiv:2510.06057v1](https://arxiv.org/pdf/2510.06057v1): 3.1–3.2 p.24; Theorem 4.14 p.43; Theorem 4.17 pp.45–46; 4.18/4.18a pp.46,49; 4.26–4.29 pp.50–51; Theorem 5.63 pp.79–80; Examples 6.7–6.9 pp.82–83; Theorem 6.10 and Lemmas 6.11–6.13 pp.83–86; Remark 6.14 and Corollary 6.15 p.86. | `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d` |
| [QH, arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2): Definition 3.2 pp.20–21; Lemma 3.3/Remark 3.6 p.22; Theorem 3.11/Example 3.12 pp.25–26; Corollary 3.13 p.27; Remark 4.4 and Lemmas 4.6–4.7 pp.55–56; Construction 4.21/Theorem 4.22 pp.62–63; Examples 4.24–4.25 pp.63–64; Lemmas 4.26–4.27 and arithmetic gluing through Remark 4.31 pp.64–67. | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| [GSWZ, arXiv:2412.04241v2](https://arxiv.org/pdf/2412.04241v2): Definition 1.1, equations (12)–(15), footnote 1 and Remark 1.2 pp.6–7; full tensor coefficients, Frobenius-twisted gluing and the localization boundary. | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |

The README keeps its other fixed primary references and source-issue
remarks. The supplier's full-diagonal completion and prime-two resolution
agreement are explicit proof obligations extending the cited source
arguments; neither is misrepresented as an additional proved assertion
in KU. No suspicious instruction was encountered in the untrusted data.

## Validation and next step

- `lean-check research/blueprint/packages/HabiroCohomologyFoundationsPartII/Suggested.lean`:
  **exit 0, no errors or warnings**, after the required memory check.
  Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
  The 111-line file has three real-bodied definitions, one proved theorem
  and four proved examples, with no `sorry` or placeholder carrier.
  All eight signatures agree with README §§2.1 and 4.1: the two exponent
  predicates, their three examples including the general implication,
  the inversion predicate, its four-case rational example and its unit theorem.
- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCohomologyFoundationsPartII.json`:
  **0 errors, 0 warnings**; four nodes, fourteen API items and eleven
  tests. The unchanged packet still records three supplier requests and
  zero closed stages. This fix does not change its review or closure metadata.
- Intake `check-files` on the four authorised deliverables: **4 files,
  0 problems**.
- `git diff --check`: **clean**.

No mathematical or supplier-edit blocker from R1–R4 remains. The next
pipeline step is independent review of this fix, with the ordinary
packet-request bookkeeping left to its authorised owner. No second job
was claimed.
