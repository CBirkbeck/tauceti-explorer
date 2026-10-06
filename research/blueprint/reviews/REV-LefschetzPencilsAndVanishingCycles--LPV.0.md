# Independent review: Lefschetz pencils and vanishing cycles, LPV.0–6

**Verdict: needs_changes.** Completed by Codex (GPT-6), session `codex-APiT8E`, on 2026-10-06 for issue #445. The author session was `codex-ijJgIw`; this reviewer did not write the input plan. This is a finished independent review, not an unfinished planning job or checkpoint.

The principal problem is mathematical fidelity of the suggested Lean forms. Essential hypotheses are deliberately omitted and then their conclusions are asserted universally. Several are demonstrably false, even before any proof is considered. Many named unit tests also express a different or much weaker assertion. The packet has useful source work, a substantial target inventory and honest original-source gaps; those existing open gaps alone are **not** the reason for the verdict.

## Inventory and review scope

All 89 nodes were read against their source passages, direct prerequisites, hypotheses and proof outlines. The 19 definition/construction outlines, every packet test and its suggested form, all baseline declarations, supplier requests, planets and source-issue entries were checked. Target-level granularity is retained: no lemma-level expansion or library implementation was attempted.

| Item | Input | After review |
|---|---:|---:|
| Nodes | 89 | 89 |
| Definitions / constructions | 8 / 11 | 8 / 11 |
| Theorems / comparisons / lemmas / applications | 53 / 7 / 6 / 4 | unchanged |
| Planning API items | 92 | 95 |
| Packet unit tests | 76 | 76 |
| Planets | 29 | 29 |
| Baseline declarations | 19 | 19 confirmed, none removed |
| Supplier requests | 21 | 21 (one wrong input removed, excellence request added) |
| Explicit gaps | 7 | 12 |
| Source issues | 23 | 23 independently reviewed; all confirmed with qualifications below |
| Added nodes | 0 | 0 |

Per-node verdicts: **7 verified, 1 corrected, 81 unverifiable**. “Unverifiable” here usually identifies a definite missing or contradictory specification/prototype contract, not an accusation that the cited mathematical theorem is false. The detailed ledger below states the distinction for each node. All nodes keep `implementationStatus: unchecked`.

All seven stages were previously `planned`; each is now `partial`, with precise remaining entries. The packet status is now `partial`: the checker rejects `complete` with partial stages at 89 nodes, below its 300-node budget. This is the status of the reviewed plan; the review job itself is complete.

## Required revision and concrete counterexamples

1. **Restore the mathematical hypotheses of suggested statements.** For example:
   - `geometricQuasiUnipotence` quantifies over arbitrary characteristic-zero representations. Let the integer group act on Q by powers of 2. Every finite-index subgroup contains a nonzero power with eigenvalue different from 1.
   - `normalCrossingsTameRestriction` says every endomorphism family commutes. Two noncommuting matrix units disprove it. The geometric input is a commuting tame Kummer action, not merely a family of matrices.
   - `twistedMonodromyEquivariance` with N=F=id and q=2 asserts id=2id.
   - `semisimpleTrace_refinement` equates arbitrary lists. The empty list has trace 0, whereas one degree-zero trivial line with Frobenius id has trace 1. The lists must be gradings of the same representation with an actual admissible common refinement.
   - `normalizedCanVar` equates the composite of arbitrary can,var with arbitrary N. Zero can and nonzero N disprove it.
   - Quadratic rank-one concentration applies to an arbitrary `Phi`; choose the zero complex. `localPicardLefschetzFormula` with δ=0 would make every representation trivial.
   - `ordinaryAxisOpen` asserts any subset open and nonempty; take the empty subset. The arbitrary-subtype existence constructor has the same defect. Incidence/blowup equivalence cannot hold between arbitrary schemes.
   - `absoluteIrreducibilityOfTheVanishingQuotient` applies to any nonzero representation; a trivial two-dimensional representation has a stable line.
   - `finiteOrthogonalADE` deduces positivity for any integral bilinear form from a finite subgroup; take the zero form and the trivial subgroup in rank one.
   - Arbitrary functors/t-structures in the perverse, duality, j!* and colimit statements do not represent the geometric hypotheses in the packet.

   Data-valued `sorry` constructors are legitimate prototype placeholders. An admitted theorem with an essential hypothesis missing is a different mathematical statement. If the needed condition cannot yet be expressed, record the missing suggested form instead of asserting its conclusion for every object. Do not use an opaque Prop field as a substitute.

2. **Repair definition/construction contracts and tests.** The nineteen-row audit below records the missing interfaces and examples. In particular, the Lean `IsLefschetzPencil` does not require ordinary singularities, smooth total space or axis transversality. A cusp family can satisfy its weak unique-critical-point condition. The quadric and cubic examples quantify over exactly the same arbitrary f and assert that its singular set has cardinality 2 and 12, respectively. These cannot both be faithful tests. Counts of API names and matching doc comments do not establish the mathematical assertions.

3. **Specify the middle reduction.** Weil I §7.1, p. 300 has two genuinely different exact-sequence reductions, according as the vanishing line is in the radical. `pencil-leray-and-middle-reduction` currently names a “relevant kernel/quotient” without specifying it. G-review-middle-filtration now names the required map directions, intermediate sheaf and zero-cycle case. No E₂ degeneration or hard Lefschetz splitting should be assumed.

4. **Separate supplier prefixes and applications.** The wrong DWP.1 input has been removed; DWP.5 consumes LPV local monodromy to prove weight-dependent existence. DWP.4 explicitly consumes LPV.0–5, while LPV.5's late arithmetic/ADE nodes import all of DWP.4. IG.4 consumes LPV.6 while the LPV.6 application imports all of IG.4. Identify an independent geometry/open-image prefix and the exact later output instead of installing those whole-stage cycles. These are reported for integration, not silently fixed upstream.

## Corrections applied in place

- **LPV.0/variation:** added the nonzero pairing condition in the test; exchanged the incorrectly named left/right identities in Lean; restored XIII 1.4.3.4 with Lean’s composition order (the rightmost mathematical variation is the first `≫` map); added E0 to variation and derived cycles, and variation itself to the latter's direct prerequisites. Representative independence still needs its actual enhanced derived form.
- **Normalized/logarithmic monodromy:** replaced nonexistent Illusie §1.2/(1.2.1) locators with §1.5/(1.5.1)–(1.5.4). Normalized can/var cites XIII 1.4.3 together with an explicit finite-polynomial deduction, not a fictitious literal passage. Added conjugation APIs and suggested forms for finiteLog, monodromyFiltration and maximal nilpotence.
- **Primitive decomposition:** lower primitive vectors are killed by N, so powers of N alone cannot raise them. Specified inverse opposite-graded maps before descending by N, and the specific Jordan-block SL₂ supplier extension instead of claiming Layer 0 contains general Jacobson–Morozov.
- **Tame normal crossings:** added Weil II 1.7.8–10, pp. 172–174, corrected 1.9.1–6 to pp. 179–181, and distinguished cofinal-tower independence from dependence on the defining equations. The intrinsic construction uses the normal-bundle torsor.
- **Excellence:** added the exact reserved `SchemeAndStackFoundations:key/excellent-schemes` reference/request to finiteness, geometric realization, the regular two-component trait model and the approximation application. No new excellence predicate is planned here. The two-component purity application now explicitly requires the excellent trait requested from EDC Part II.
- **Odd variation:** corrected the acceptance test's Kummer root from −b to b and removed its stale claim that the δ=0 branch was unplanned.
- **Direct images:** limited use of `LinearEquiv.mem_fixedSubmodule_transvection_iff` to the alternating transvection branch. The even reflection has functional value −2 on δ, so use the direct rank-one fixed-vector calculation.
- **Smooth quadrics:** canonical P(X) is asserted by XII 2.6 for n>0; n=0 is handled as an étale double cover. Corrected the local positive hyperplane bundle from L^n=ω to L^(−n)=ω. The ample inverse claim itself is retained, including the finite n=0 case.
- **Dimension-zero nearby cycles:** corrected the nearby/costalk degree-zero rank from one to two; R⁰Φ is the cokernel of the diagonal Λ→Λ², not the trace-zero kernel. Both are rank one, but identifying them by the anti-diagonal requires invertibility of 2 and does not repair a wrong definition.
- **Composite coefficient normalization:** distinguished geometric generators, reduced with a common sign, replace arbitrary norm-normalized larger-modulus lifts. The new algebraic acceptance/example is 19²=1 modulo 60, reducing to 4 modulo 15. Enlarging the 2-primary modulus does not synchronize independent odd-primary signs.
- **Dual variety:** irreducibility now requires nonemptiness. The conormal/dual is empty for X equal to the ambient projective space; the API already recognized this case.
- **Jet and late-source locators:** added XVII Proposition 4.3, corrected FSY's downloaded reference [30], included its determinant on p. 44, and corrected Weil II 4.2/4.3/4.4/4.5 page ranges as shown in the node ledger.
- **Supplier scopes:** moved the Rees/blowup request from SF.1 descent to an explicit SF.4 Part II request; assigned scheme closed-point/Zariski-lemma geometry to SF.0 and only field/Frobenius arithmetic to FF.0; narrowed PR196 Layer 6 to its actual proper-direct-image finiteness; explicitly requested EDC.5 trait/integral/enlarged extensions and ClassicalGroups Part II over Q_l.
- **Version/erratum records:** ErrTML is one page; FSY is recorded as the downloaded arXiv manuscript, not as an independently matched published text. Normalized author-copy/unread-published version kinds while retaining the explicit unread notices. All 23 issues now have reviewer verdicts; E13 includes p. 22 line −2 and E11's correction is strengthened.
- **Honesty/closure:** added five review gaps, changed all stage coverage to partial with exact remaining work, and withdrew the suggested header’s assurance that matching names mean every test/API is represented correctly.

No node was added, no baseline declaration was removed, no atlas/library file was changed, and nothing was promoted. Only packet, suggested file, review report and this job's handoff are deliverables.

## Sources and versions checked

The twelve URLs in `sources` were downloaded independently and each SHA-256 matched the packet. Original page images were used for all SGA XII/XV alleged misprints, avoiding OCR-only accusations. Other target passages were read from the public texts named below; the packet retains their immutable hashes and precise locators.

| Source | Public text | Independent check |
|---|---|---|
| deligne-weil-i | [public source](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | §§4–5 local/global monodromy through 5.11; §§6–7 finite-field and Leray reductions, especially p. 300. |
| SGA7II-1973 | [public source](https://publications.ias.edu/sites/default/files/Number12.pdf) | Exposés XII, XIII, XV, XVII, XVIII at node locators; XII/XV page images at all E1–E12 locators. |
| deligne-weil-ii | [public source](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | §§1.6–1.9 and 4.2–4.5: filtrations, Kummer coordinates, wild/transverse and orthogonal branches. |
| illusie-1994 | [public source](https://www.numdam.org/item/AST_1994__223__9_0/) | §1.4–1.5 and §§3–4: geometric quasi-unipotence, log, RZ, duality/perversity; originals at ErrTML locators. |
| illusie-1994-errata | [public source](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf) | Entire one-page author errata, including omitted p. 22 line −2. |
| illusie-2021 | [public source](https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf) | §6.1–6.3: transcendental/algebraic distinction, finite logarithm restrictions, two-component grades and N. |
| illusie-2002-erratum | [public source](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf) | Entire author correction |i|>1; original 2002 page unavailable. |
| illusie-2006 | [public source](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf) | Classical/oriented nearby-cycle descriptions and constructibility caveats over general bases. |
| qian-2023 | [public source](https://par.nsf.gov/servlets/purl/10388233) | Published NSF text Definition 3.6; no reliance on the different first-arXiv numbering. |
| fsy-2022 | [public source](https://arxiv.org/pdf/1810.06454) | Downloaded manuscript §5.1.3 pp. 41–44; [30, Cor. 2.10] and p. 44 determinant. |
| kisin-pappas-2018 | [public source](https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf) | §4.7.1 p. 212: semisimple trace used and attributed, not a proof of arbitrary-grading independence. |
| caraiani-scholze | [public source](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf) | §4.6: finite-level formal models, qualified nonconstructible support/costalk criteria and colimit bounds. |

The original [Illusie 2002 proof](https://doi.org/10.2969/aspm/03610249) and [2003 general concentration theorem](https://doi.org/10.1007/s00229-003-0407-z) were not obtained. G-algebraic-PL and G-nonordinary remain; the survey/application and author erratum do not pretend to supply their proof interiors. The unversioned arXiv URL is pinned by the recorded downloaded hash. The first Qian arXiv version listed by the author was not used for the published Definition 3.6.

## Baseline audit at the two pins

Every listed declaration was opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All nineteen names exist. The reviewed library-coverage audit for LPV.0–6 was read; the packet does not newly plan generic derived categories, exponentials, spans or quadratic-form carriers. New nearby/pencil interfaces must continue extending these existing objects, not duplicating them.

| Declaration | Result of statement/convention check |
|---|---|
| `mathlib:LinearEquiv.transvection` | Requires f(v)=0. Supplies an invertible transvection, not the even reflection with f(δ)=−2. |
| `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff` | Same f(v)=0 hypothesis. Reflection fixed spaces need the direct calculation; corrected node 30. |
| `mathlib:LinearMap.BilinForm.orthogonal` | Right orthogonal: B(n,x)=0 for every n in N. B(x,δ) is identified using symmetry/alternation. |
| `mathlib:LinearMap.BilinForm.IsAlt` | Alternating means B(x,x)=0, including characteristic two; not just skew symmetry. |
| `mathlib:skewAdjointLieSubalgebra` | Lie algebra of skew-adjoint endomorphisms; with alternating nondegenerate B it is sp. |
| `mathlib:LieModule.IsIrreducible` | IsSimpleOrder of LieSubmodule includes nontriviality, matching the Lie lemma’s nonzero module. |
| `mathlib:IsNilpotent.exp` | Finite nilpotent exponential in a Q-algebra; not an analytic exponential for arbitrary operators. |
| `mathlib:ValuationSubring.inertiaSubgroup` | Kernel of decomposition action on the residue field. Full henselian specialization surjectivity needs its supplier. |
| `mathlib:QuadraticMap.Nondegenerate` | Quadratic radical zero plus polar-kernel rank at most one; does not incorrectly exclude characteristic-two odd rank. |
| `mathlib:QuadraticMap.polarBilin` | The polar bilinear form. In characteristic two it is alternating and may have a one-dimensional kernel. |
| `mathlib:CliffordAlgebra.even` | Existing even Clifford subalgebra; its centre, discriminant and étaleness are new requested API. |
| `mathlib:HenselianLocalRing` | Henselian simple-root lifting; not by itself Artin approximation or Elkik versality. |
| `tauceti:TauCeti.genericFiber` | Generic fibre is the base-change pullback along R→K; fraction-field identification is an application condition. |
| `tauceti:TauCeti.specialFiber` | Special fibre is the pullback to IsLocalRing.ResidueField R; geometric closure still requires scalar extension. |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | Actual small étale Grothendieck topology; geometric module stalks/continuity are additional interfaces. |
| `mathlib:DerivedCategory` | Localization of cochain complexes for an abelian category with HasDerivedCategory; constructibility is not automatic. |
| `mathlib:Submodule.span` | Smallest submodule containing a set; path-invariant vanishing span extends this existing definition. |
| `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent` | Unipotence of g means nilpotence of g−1; geometric quasi-unipotence is not in this definition. |
| `tauceti:TauCeti.exp_smul_eq_sum_smul_dividedPower` | Literal scalar r is rational in a Q-algebra. Updated provides; arbitrary characteristic-zero scalar identity needs the polynomial calculation. |

## Supplier audit and questions for integration

PR196 was checked at immutable head `4bd72379658126cbe9be935656396f0c9dac4de0`, including ConstructibleEtale 0–3/7–9, EtaleBaseChange 2–8, EllAdicRealization's compatible-system/derived-limit layers, TraceFormula 2–3, and ComplexComparison 8–12. It is an external integration contract, not an already implemented LPV supplier. The merged AdicSpaces and ClassicalGroups roadmaps were read for scope/granularity, with LieHighestWeight’s SL₂ engine for its exact contract.

| Supplier | Conclusion / precise action |
|---|---|
| R01.2 | Valuation inertia carrier is pinned; specialization exactness, continuous actions, tame characters and the **geometric** local-monodromy contract remain explicit imported extensions. Do not infer geometric quasi-unipotence for arbitrary representations. |
| DWP.1 (removed) / DWP.5 (outgoing) | DWP.1 covers curve/abelian Weil estimates. The relative weight-filtration theorem is in DWP.5; it consumes LPV.1. No reverse weight input for finite log or the algebraic prefix. |
| DWP.4 | Consumes LPV.0–5. Separate a geometric LPV.5 prefix from late rational-character/ADE consequences; name the exact needed rationality result. Whole-stage dependency is unresolved. |
| E0 | Coherent functorial cones, filtered totalization and filtered quasi-isomorphisms. Added direct use by variation and derived vanishing triangles. A bare diagram is not that enhancement. |
| E1 | Enlarged colimit category and qualified stalk/costalk maps, with uniform bounds. Existing bounded constructible carriers alone do not suffice. |
| E4 | Derived completion/compatible systems and inverse-limit control; keep derived, not underived, realization. |
| EDC.1:biduality | Constructible duality carrier can be imported; nearby-cycle duality is LPV’s target on its stated domain. |
| EDC.3 | Existing exact smooth-pair-purity is over a field and explicitly excludes general regular trait pairs. The excellent-trait purity/Gysin extension is correctly requested as Part II. |
| EDC.4 | General smooth blowup cohomology and weak Lefschetz remain with EDC, including inverse exceptional minus sign. LPV owns incidence identification and pencil-specific maps. |
| EDC.5 | Existing scope is constructible over fields. Added explicit Part II for rectified trait, p/p+ integral and enlarged colimit conventions. |
| EDC.6 | Derived finite/adic/rational conventions; Huber admissible comparison remains a qualified requested extension with G-adic-comparison. |
| FF.0 | Only finite-field/Frobenius arithmetic. Finite-type closed-point residue geometry is now SF.0. |
| IG.4 | Its formal-model/support geometry was read, but it consumes LPV.6. Split a geometry prefix independent of nearby perversity before LPV.6 imports it. |
| InverseGalois IG.1 | Tame algebraic π₁/Abhyankar contract; the positive-characteristic punctured-line presentation cannot be replaced by complex topology. |
| SF.0 | Existing projective/Veronese carriers, excellent/approximation extensions, plus the specified Zariski-lemma closed-point result. No duplicate projective-geometry plan. |
| SF.1 → SF.4 | SF.1 is descent/stacks. Rees blowup universal property/charts are now explicitly requested as a Part II in SF.4's birational direction; not claimed already supplied. |
| SF.2 / PR196 | Integration owner only. EtaleBaseChange 6 supplies proper Rf* constructibility and dimension bounds, not general nonproper nearby finiteness. TraceFormula 3 requires an actual enhanced filtration. ComplexComparison supplies proper relative Artin comparison and orientations, not the entire topological PL theorem. |
| CharacterTheory 4 | Rational/integral character descent is required for lattice/ADE; finite Q_l image alone does not imply it. |
| ClassicalGroups 0 | Merged roadmap uses C. Added Q_l carrier/topology Part II request; Weil II orthogonal alternatives stay source-specific LPV targets. |
| LieHighestWeight 0 | Characteristic-zero SL₂ classification/symmetric powers/Clebsch–Gordan exist as a plan. Specific nilpotent-Jordan SL₂ realization is Part II, not a supplied general Jacobson–Morozov theorem. |
| RootSystems 5 | ADE classification applies only after the integral, positive-definite, simply-laced root lattice is actually built. |
| key/excellent-schemes (added) | Exact reserved definition in SchemeAndStackFoundations.json was read: excellent affine neighborhoods, with neither regularity nor reducedness part of the predicate. |

**Questions for the orchestrator:** allocate independent prefixes for DWP.4/LPV.5 and IG.4/LPV.6; confirm ownership of the requested SF.4 Rees/blowup extension and Q_l ClassicalGroups extension; provide or route a primary admissible semisimple-trace source; ensure the revision includes the reader file described below. No upstream files or atlas edges were edited here.

## Definition/construction API and unit-test audit

Each row was checked for constructors, extensionality/transport, structure, functoriality, universal properties where appropriate, relations and examples. The three added conjugation interfaces are safe on existing linear carriers. The remaining missing geometry-dependent interfaces belong in G-review-definition-api-tests until their genuine objects and conditions can be represented.

| Node | API and tests |
|---|---|
| `henselian-trait-conventions-and-galois-sheaves` | 5 API items / 3 tests: add full specialization exactness and field/trait transport, not only kernel equality; Puiseux test proves root preservation but not procyclic inertia. |
| `fibre-product-topos-Y-times-S` | 4 / 4: require continuous residue-Galois descent, diagram morphisms/extensionality and pullback identities. Triple diagram tests do not establish a topos equivalence. |
| `functor-psi-and-functorialities` | 4 / 3: functoriality must refer to actual geometric maps; trait test only compares zero objects; add restrictions and qualified exchange map compatibility. |
| `variation-morphism` | 5 / 4: composition corrected; add actual representative-independent derived variation and transport, not just factorization. Nonzero pairing fixed; geometric Var identification still missing. |
| `derived-nearby-cycles-RPsi-and-vanishing-triangle` | 5 / 4: bounded D+ and strict-local stalk comparison needed; trait nearby test repeats smooth RΦ=0 instead of computing RΨ and its action. |
| `finite-monodromy-logarithm` | 6 / 4: finite polynomial tests catch truncation/sign issues; added conjugation. Twisted inertia/generator independence still not expressed by the scalar inverse called finiteLog_twisted. |
| `monodromy-filtration` | 8 / 4: kernel/image and opposite-weight API sound; added conjugation. Lower primitive convention checked; fuller three-block graded vanishing tests would strengthen the present dimension checks. |
| `maximal-unipotence` | 5 / 4: nonzero dimension, nilpotence index, log equivalence and kernel ranks are meaningful; conjugation added. Minimal-polynomial and single-block equivalences should remain visible in the reader. |
| `semisimple-nearby-trace` | 4 / 4: need admissible grading object, exact common refinement and compatibility with cohomology/Frobenius; arbitrary-list equalities are false even though elementary traces are useful. |
| `two-component-semistable-nearby-complex` | 4 / 4: actual filtered total complex, comparison and outer-grade N needed. Grade functor/realize are unrelated in prototypes; diagram labels do not test xy=π. |
| `ordinary-quadratic-form` | 5 / 4: field tests distinguish characteristic-two degenerate and ordinary forms; general scheme fibrewise/extensionality and characteristic-two base change are absent. |
| `discriminant-double-cover-of-an-even-quadric` | 5 / 4: centre-rank check is not finite étaleness. Need discriminant-cover pullback and ruling/idempotent complements; tests omit the nonsquare d and correct cover. |
| `smooth-quadric` | 5 / 4: need isomorphism/base-change invariance and positive relative hyperplane descent; canonical ambient limited to n>0. Segre test only states smooth/proper, real-conic test omits its actual real-point computation. |
| `ordinary-quadratic-point` | 5 / 4: specify actual completed local k-algebra isomorphisms and permitted base change. Generic ring quotient tests do not distinguish cusp/tangent dimension as advertised. |
| `standard-quadratic-degeneration` | 5 / 4: constructor must carry homogeneous/affine equations, geometric fibre hypotheses and coefficients; add model isomorphism/trait-change API. Rank-two/constant-only tests fail to inspect the nearby model. |
| `lefschetz-pencil` | 5 / 4: definition must include embedding/axis/ordinary fibre conditions. Add isomorphism/base-change/Veronese transport. Quadric and cubic tests for arbitrary f contradict each other; Hermitian arithmetic alone does not instantiate tangency. |
| `dual-variety` | 5 / 4: actual conormal and incidence models required; closed-image abstraction okay with closed-map hypotheses. Empty-dual correction applied. Characteristic-two scalar identity does not compute the Gauss degree. |
| `vanishing-subspace` | 5 / 4: span/path algebra is useful; add path-choice independence of the span as a geometric action statement. Concrete conic calculations retained; quadric and transported-cycle tests still lack the geometric model/nonzero local coefficient. |
| `vanishing-quotient-and-its-pairing` | 5 / 4: add quotient projection/universal property and induced-form/representation transport. Current radical test assumes E isotropic rather than computing the stated 3-dimensional E and 2-dimensional quotient; conic needs its actual norm-two pairing. |

## Planets and RT-AREA-etale/18

The 29 planet choices name key definitions, central constructions or named theorems at this target level. No planet was added/renamed and no naming promotion was performed. A good title does not certify its theorem's prerequisites; the unverifiable node contracts remain subject to revision.

RT-AREA-etale/18 was checked against the packet **and** reader. Both now select the algebraic route, cite Illusie 2002 plus the author erratum, and place a two-component filtered RΨ/N prefix in LPV.1 before the odd formula in LPV.2. They do not rely on the downstream general weight spectral sequence in LPV.7. This fixes the original route/ordering omission structurally. It is **not yet source-closed**: G-algebraic-PL explicitly leaves the original sign/blowup calculation unread, and the suggested filtered complex has no actual geometric realization. Preserve that honest gap and complete the prefix; do not resurrect a blanket LPV.7→LPV.2 edge. The complex comparison is a separate comparison target, not an unacknowledged replacement of the chosen all-characteristic algebraic proof.

The reader is outside issue #445's writable deliverables. Its revision must mirror these packet corrections: variation nonzero pairing and order, true Illusie/FSY/Weil II locators, lower-primitive inverse maps, canonical-ambient n>0 and L^(−n), n=0 rank-two nearby/costalk and diagonal cokernel, globally signed coefficient normalization, empty-dual case, excellence key, supplier scopes/cycles and honest stage coverage. The current review cannot call the unchanged reader synchronized with the corrected packet.

## Source-issue verdicts

E1–E12: original SGA XII/XV images read at each recorded locator; the recorded characters, exponents, indexes, map name and paragraph references are genuine printed problems, not OCR artefacts. E11's stronger conclusion is independently disproved by modulo 15 and modulo 60 computations; norm normalization cannot synchronize independent primary signs.

E13–E22: every correction checked against the complete author ErrTML sheet and the corresponding original 1994 passage. E13 now also records p. 22 line −2. The corrected K (not inertia-cohomology L), 1−T upper differential, grade indexes, weights and deleted parenthetical are retained.

E23: confirmed as an explicit author correction in ErrPL to |i|>1. The original 2002 page was not obtained, so the verdict does not pretend to independently inspect that page; it records the author evidence and retains G-algebraic-PL. No additional alleged paper mistake was inferred from an unread original.

## Per-node ledger

IDs below are the final components of `LefschetzPencilsAndVanishingCycles:LPV.k/<id>`. The packet's review object contains all 89 full IDs and the same conclusions. “Verified” means the mathematical planning contract is supported at the stated scope; no implementation or successful elaboration is claimed.

| # | Node | Verdict | Evidence / required revision |
|---:|---|---|---|
| 1 | `henselian-trait-conventions-and-galois-sheaves` | unverifiable | XIII 0.2 supports the trait/valuation convention. The exact-sequence API supplies only the kernel tautology; no residue-Galois surjectivity or continuous descent is represented. |
| 2 | `fibre-product-topos-Y-times-S` | unverifiable | XIII 1.1–1.2 supports the fibre-product description. equivSheavesOnTrait is stated for any henselian trait but discards residue-Galois descent and continuity; a strictly henselian comment does not restrict its argument. |
| 3 | `functor-psi-and-functorialities` | unverifiable | XIII 1.3 supplies Ψ. psi_pushforward compares arbitrary supplied glue functors without a geometric square/properness condition; tests do not instantiate the claimed geometric functor. |
| 4 | `variation-morphism` | unverifiable | XIII 1.4.3 checked. Corrected left/right Lean names, the noncommutative composition order, the nonzero-pairing test condition, and E0 dependency. Representative independence still has only a factorization prototype, and degree-zero cokernel is not the derived construction. |
| 5 | `derived-nearby-cycles-RPsi-and-vanishing-triangle` | unverifiable | XIII 2.1.1–5 checked. Added the variation and E0 prerequisites. RPsi_stalk identifies arbitrary MilnorCohomology with the stalk; boundedness, invertible coefficients and genuine strict localization are absent from the signature. |
| 6 | `derived-functorialities-and-specialization-sequence` | unverifiable | XIII derived exchange/specialization supports the mathematical outline. A distinguished-triangle statement alone does not realize the asserted geometric exchange maps and specialization long exact sequence. |
| 7 | `geometric-fibre-site-morphisms` | unverifiable | Actual site maps belong to PR196. The single geometricFibreSiteMaps functor does not specify the localization/normalization diagram or its exchange maps and identities. |
| 8 | `oriented-product-comparison` | unverifiable | Illusie 2006 distinguishes oriented products and their comparison. The Lean equivalence takes an arbitrary site C,J; no relation to the trait or fibre product forces this equivalence. |
| 9 | `constructibility-and-finite-amplitude` | unverifiable | Excellent finite-type and bounded constructible hypotheses are essential. Added the reserved excellence key. nearbyCyclesConstructible instead asserts boundedness for every unbounded derived K; PR196 Layer 6 covers proper direct images, not all nearby-cycle finiteness. |
| 10 | `coefficient-and-trait-change` | unverifiable | XIII coefficient/trait change is qualified. The Lean isomorphism holds between arbitrary scalar-change functors with no coefficient map or compatible cartesian trait diagram. |
| 11 | `adic-nearby-cycle-realization` | unverifiable | Derived compatible systems and uniform bounds are correctly requested. The arbitrary realizing functor/analytic object isomorphism does not encode that compatible system or its derived limit comparison. |
| 12 | `scheme-adic-trait-comparison` | unverifiable | Admissible scheme/formal/adic comparison remains G-adic-comparison. The proposed analytic nearby object is arbitrary; its relation to the formal completion is not stated. |
| 13 | `normalized-can-var` | unverifiable | Replaced the wrong Illusie 1.2 citation by XIII 1.4.3 plus Illusie 1.5 and the explicit polynomial argument. normalizedCanVar still asserts can≫var=N for three unrelated morphisms. |
| 14 | `finite-monodromy-logarithm` | unverifiable | Corrected logarithm locator to Illusie 1.5 and added conjugation API. Finite polynomial/log-exp signatures are sound; finiteLog_twisted currently expresses a scalar log-exp inverse, not the packet’s twisted inertia/generator-independence interface. |
| 15 | `geometric-quasi-unipotence` | unverifiable | Illusie 1.4 is a geometric cohomology theorem, not a theorem about arbitrary representations. Added excellence ownership. The Lean assertion for every characteristic-zero representation is false (integer group acting by powers of 2). |
| 16 | `finite-extension-and-logarithm-rescaling` | verified | Illusie 1.5 and tame-character restriction give N′=eN. The scalar-invariance prototype correctly requires this equality and nonzero e; it does not claim geometric rescaling for unrelated operators. |
| 17 | `monodromy-filtration` | verified | Weil II 1.6.1–7/14 supports the kernel-image formula, opposite graded isomorphisms, lower primitive convention and bounds. Nilpotence is present in the relevant signatures; added conjugation transport API. |
| 18 | `primitive-decomposition-and-strictness` | corrected | Corrected the lower-primitive decomposition to use inverse opposite-graded maps before powers of N, and replaced the unjustified generic Jacobson–Morozov import by the requested Jordan-block SL₂ extension. The strictness prototype is sound; the new SL₂ realization remains an explicit supplier extension. |
| 19 | `tensor-dual-and-symmetric-monodromy` | verified | Weil II 1.6.8–12 gives characteristic-zero tensor convolution, dual annihilators and symmetric powers. The dual prototype has the correct minus-transpose and index −i−1; the other operations are specified mathematically with the SL₂ supplier. |
| 20 | `relative-monodromy-uniqueness` | verified | Weil II 1.6.13–14 supports uniqueness, not existence. The Lean data include finite increasing W,M,M′, lowering, preserved W and the induced graded conditions, without assuming the desired equality. |
| 21 | `normal-crossings-tame-restriction` | unverifiable | Corrected Kummer/normal-bundle locators and coordinate dependence, removed the wrong DWP.1 input, and routed weight existence downstream to DWP.5. The prototype still says any endomorphism family commutes. |
| 22 | `maximal-unipotence` | verified | Published Qian Definition 3.6 checked. Nonzero dimension, nilpotence index and kernel dimensions characterize a single block; zero dimension is excluded. Added conjugation invariance. Source minimal-polynomial wording and the equivalent nilpotence-index predicate agree. |
| 23 | `semisimple-nearby-trace` | unverifiable | Kisin–Pappas 4.7.1 establishes the use of semisimple trace, not its full construction. Missing primary refinement source recorded. Arbitrary lists in the Lean refinement/additivity statements need actual common grading data. |
| 24 | `two-component-semistable-nearby-complex` | unverifiable | Illusie 2021 6.3 supports the three grades and derived N, using the corrected 1994 K and differential. Added excellent-trait ownership. Arbitrary filtered, graded and realization functors in Lean do not identify a Rapoport–Zink total complex with RΨ. |
| 25 | `twisted-monodromy-equivariance` | unverifiable | Corrected Illusie locator to 1.5.3–4. Geometric Frobenius gives NF=qFN. The prototype asserts this for arbitrary N,F,q, which is false for N=F=id and q=2. |
| 26 | `ordinary-quadratic-point-nearby-cycles-3-1-2` | unverifiable | XV 3.1.2 and the 2021 survey support the ordinary quadratic result with its actual local model. The Lean Phi is an arbitrary complex, so rank-one concentration is false for Phi=0. |
| 27 | `even-relative-dimension-variation-3-2` | unverifiable | XV 3.2 coefficient, parity and discriminant character checked. The arbitrary Var parameter is not connected to an ordinary degeneration; an unrelated endomorphism need not equal the source formula. |
| 28 | `odd-relative-dimension-picard-lefschetz-3-3` | unverifiable | XV 3.3/Illusie 2021 support root of b and the odd sign; corrected acceptance’s root of −b and stale zero-cycle deferral. G-algebraic-PL remains honest. The arbitrary Var prototype has no geometric hypotheses and only rational coefficients. |
| 29 | `lefschetz-degeneration-specialization-sequence` | unverifiable | Weil I 4.3–4 and XIII support the local specialization sequence. Its realization must bind all cohomology objects/maps to the proper family and its vanishing line, rather than unrelated supplied objects. |
| 30 | `local-picard-lefschetz-formula` | unverifiable | Weil I 4.1 sign and tame quadratic geometry checked. An arbitrary representation ρ is not a Picard–Lefschetz action; δ=0 would incorrectly force every such action trivial. |
| 31 | `direct-images-at-a-lefschetz-degeneration` | unverifiable | Weil I 4.4 checked. Corrected misuse of the transvection fixed-space lemma in the reflection branch. The direct-image claim still needs the proper regular ordinary family and actual direct-image sheaves in its suggested form. |
| 32 | `ordinary-quadratic-form` | unverifiable | XII 1.1 and Mathlib quadratic nondegeneracy conventions checked, including characteristic-two odd rank. The scheme/fibrewise definition and arbitrary characteristic-two base change are not represented by the field-only prototype restricted to invertible 2. |
| 33 | `normal-form-of-ordinary-quadratic-forms` | unverifiable | XII 1.2 checked with E2 correction. The field normal forms are legitimate after separable closure; the general scheme/base-change contract and precise basis/isometry data remain to be represented. |
| 34 | `discriminant-double-cover-of-an-even-quadric` | unverifiable | XII 1.3–1.7 supports Clifford-centre discriminant and parity of Lagrangian intersections. The named isEtale prototype proves only vector-space dimension two; tests omit the actual discriminant square class and complementary ruling data. |
| 35 | `smooth-quadric` | unverifiable | XII 2.1–2.6 checked. Corrected n>0 canonical ambient and the negative canonical-bundle power. ambientProjective is merely a form-parameterized scheme, while canonical_iso compares arbitrary sheaves; geometric Segre/real-conic tests are missing. |
| 36 | `cohomology-of-smooth-quadrics` | unverifiable | XII 3.1–3.5 checked against corrected powers, degree-two class and reference E3–E6. Odd-degree vanishing for an arbitrary nearby object does not provide the cohomology module/ruling/Frobenius table. |
| 37 | `cohomology-of-affine-quadrics` | unverifiable | XII 3.6–3.7 trace and primitive generator signs checked. The arbitrary nearby object prototype does not identify the affine quadric or supply its compact supports, generator and trace. |
| 38 | `ordinary-quadratic-point` | unverifiable | XV 1.1 ordinary/nondegenerate distinction checked. Ring-equivalence definition needs the actual completed local k-algebra, and baseChange currently equates ordinarity for unrelated k,A,k′,A′. |
| 39 | `tjurina-module-of-an-ordinary-quadratic-point` | unverifiable | XV Tjurina computation is for the quadratic Jacobian ideal. The prototype’s arbitrary ideal J cannot have the asserted one/two-dimensional quotient without that relationship. |
| 40 | `tougeron-artin-implicit-function-theorem` | unverifiable | XV 1.1.2 supports the Artin application. Added excellence key. General approximation is properly requested as Part II; its Jacobian-square/formal-versus-henselian conditions must constrain the suggested coordinate-change objects. |
| 41 | `elkik-versal-henselian-deformations` | unverifiable | XV 1.3 and Elkik route support one/two parameter models. General henselian/formal versality is requested, but arbitrary supplied rings cannot have the claimed universal deformation isomorphism. |
| 42 | `canonical-form-of-an-ordinary-quadratic-point` | unverifiable | XV 1.2 canonical-form statement checked with E8–E9. The actual local germ and prescribed quadratic part must be tied to the ring-isomorphism prototype; arbitrary rings do not satisfy it. |
| 43 | `local-equation-of-a-family-at-an-ordinary-quadratic-point` | unverifiable | XV 1.3.2–3 checked with missing x₀² correction. Coefficient lifts, complete local family and residue characteristic must be present in the model identification. |
| 44 | `non-smooth-points-near-an-ordinary-quadratic-point` | unverifiable | XV 1.3 Jacobian gives the critical-point classification. A supplied coefficient tuple alone does not assert that the tested critical locus is the family’s nonsmooth locus. |
| 45 | `homotopy-invariance-of-etale-cohomology` | unverifiable | XV 2.1.1 homotopy requires maps joined by a family over a connected parameter scheme. The prototype equates cohomology maps of arbitrary f₀,f₁. |
| 46 | `cohomology-of-a-cone` | unverifiable | XV 2.1.3 cone contraction supports constant-coefficient cohomology. The arbitrary complex cone need not have cohomology concentrated in degree zero. |
| 47 | `cohomology-of-a-punctured-cone` | unverifiable | XV 2.1.4–8 supports the punctured-cone triangle. The suggested arbitrary boundary/hyperplane objects do not represent the open/closed immersion and localization maps. |
| 48 | `boundary-anticommutativity-for-a-cone` | unverifiable | XV 2.1.8 sign checked. Two unrelated morphisms a,b do not satisfy a=−b; the square, orientation and connecting morphisms must be specified. |
| 49 | `standard-quadratic-degeneration` | unverifiable | XV 2.2.1–2 checked with parity E12. StandardQuadraticDegeneration stores unrelated Q/linear/total/f fields without the equations or fibre conditions; node/trivial tests merely inspect rank or constants. |
| 50 | `nearby-cycles-of-a-standard-quadratic-degeneration` | unverifiable | XV 2.2.3–5/XII 3.7 checked. Corrected n=0 nearby/costalk rank two and R⁰Φ as diagonal cokernel. The arbitrary-complex prototype states only a vanishing range and misses these identifications. |
| 51 | `variation-in-a-standard-quadratic-degeneration` | unverifiable | XV 2.2.5.6–9 checked with Var versus D(σ) E10. Geometric Var, character and pairing must constrain the suggested arbitrary endomorphism family. |
| 52 | `local-description-of-the-vanishing-cycle` | unverifiable | XV 2.2.6 and XII 3.7 checked. Replaced the insufficient larger-modulus/primewise norm normalization by globally signed geometric classes; added the modulo-60 acceptance check. Arbitrary B,δ cannot satisfy its Lean norm assertion. |
| 53 | `complex-picard-lefschetz-comparison` | unverifiable | The source explicitly uses transcendental comparison in XV 3.3; PR196 supplies Artin/Riemann-existence orientation compatibility, not the topological Picard–Lefschetz theorem itself. A sign identity alone is not this comparison. |
| 54 | `quadratic-character-in-characteristic-two` | unverifiable | Weil II 4.2.1 and XV 3.2 support the character-two quadratic-character case. A wild geometric action/vanishing cycle is required; the arbitrary representation signature omits them. |
| 55 | `isolated-nonordinary-quadratic-concentration` | unverifiable | Corrected downloaded FSY reference to [30, Cor. 2.10] and literal singularity excerpt. Source application verified; original general 2003 hypotheses remain G-nonordinary. The arbitrary Phi prototype does not enforce the model. |
| 56 | `fsy-discriminant-example` | unverifiable | FSY 5.1.3 determinant is on p. 44; extended locator. The prototype repeats a generic norm equation and does not specify the example’s determinant, coefficient ring or inertia character. |
| 57 | `lefschetz-pencil` | unverifiable | XVII pencil conditions and the quadric/cubic/Hermitian examples checked. IsLefschetzPencil omits ordinary singularities, total-space smoothness and axis transversality; its quadric/cubic tests assert different counts for the very same unrestricted f. |
| 58 | `dual-variety` | unverifiable | XVII conormal geometry checked. Corrected empty-dual irreducibility exception. The closed-image abstraction is sound, but unrelated incidence maps are asserted smooth off the dual and tests omit actual conormal models. |
| 59 | `existence-of-lefschetz-pencils` | unverifiable | XVII 3–4 existence requires the specified embedding/Veronese and good-axis locus. A subtype constructor for arbitrary admissible subsets also produces a point when the subset is empty. |
| 60 | `ordinary-axis-open-and-jet-separation` | unverifiable | Added XVII 4.3’s two-point degree-two jet estimate to the locator. The Lean theorem declares any subset of any axis scheme open and nonempty; it has no jet or tangency conditions. |
| 61 | `incidence-pencil-blowup` | unverifiable | XVII/XVIII incidence and blowup geometry checked. Moved the requested general Rees/blowup contract from SF.1 descent to SF.4 Part II. The prototype still identifies unrelated incidence and blowup schemes. |
| 62 | `finite-field-pencil-descent` | unverifiable | Weil I 7.1 finite-field descent checked. Added SF.0 closed-point residue-field ownership and narrowed FF.0 to field/Frobenius arithmetic; the finite-type finite-field scheme and good-axis model still need to constrain the Lean signature. |
| 63 | `inseparable-gauss-and-low-dimension` | unverifiable | Weil II 4.2 locators corrected to pp. 219–221. The explicit characteristic-two tangent calculation is sound, but it alone does not represent the whole inseparable-Gauss and low-dimension comparison. |
| 64 | `cohomology-sheaves-of-a-lefschetz-pencil` | unverifiable | XVIII 6.3 and Weil I 5.8 give the two direct-image branches. Arbitrary R,J,eta,exceptional,E in the prototype cannot force those lissity and exactness conclusions. |
| 65 | `vanishing-subspace` | unverifiable | Weil I 5.3 and XVIII support path-dependent cycles and stable span. The algebraic span/path API is useful; its geometric quadric and path non-example tests do not instantiate the stated models or nonzero tame coefficient. |
| 66 | `fixed-space-of-the-local-transvections` | verified | Weil I 5.3 fixed-space calculation checked, including δ=0 and reflection branch. B.flip makes the source pairing order correct; symmetry/alternation identifies it with the pinned right-orthogonal submodule. |
| 67 | `vanishing-quotient-and-its-pairing` | unverifiable | Weil I 5.8 and the radical quotient math are sound. The quotient API still needs the projection/universal property and explicit finite-dimensional radical/conic pairing models; current tests assume away the claimed radical computations. |
| 68 | `pencil-restriction-and-gysin` | unverifiable | XVIII 5.1 restriction/Gysin diagrams and exceptional minus sign checked. Actual blowup maps and cup/Gysin realization must constrain the proposed algebraic/derived morphisms. |
| 69 | `pencil-leray-and-middle-reduction` | unverifiable | Weil I 7.1 p. 300 was read: two different radical/nonradical exact-sequence reductions are essential. Recorded a gap with the actual map directions; unspecified relevant kernel/quotient is not a realized middle target. |
| 70 | `global-fixed-and-local-fixed-interface` | unverifiable | Local fixed-space and global invariant-cycle outputs must remain distinct. The interface needs the genuine specialization/restriction maps and qualified supplier invariant-cycle hypotheses; arbitrary linear identifications do not imply it. |
| 71 | `hypersurface-outside-middle` | unverifiable | Weil I hypersurface/weak-Lefschetz reduction supports outside-middle assertions. Specify the smooth hypersurface and hyperplane class objects; arithmetic scalar/count identities alone do not realize cohomology isomorphisms. |
| 72 | `bertini-surjectivity-on-fundamental-groups` | unverifiable | Weil I 5.4 uses Bertini plus the stated tame algebraic fundamental-group supplier. Every subgroup H does not have the same represented image as G; the geometric π₁ surjection is missing. |
| 73 | `vanishing-cycles-are-conjugate` | unverifiable | Weil I 5.4–5.8 gives conjugacy of geometric vanishing cycles. Arbitrary vector families need not lie in a common ±orbit of an arbitrary representation. |
| 74 | `monodromy-generated-by-local-transvections` | unverifiable | Weil I tame local-generation argument checked. The arbitrary span equality ignores conjugates of an arbitrary δ-family; actual tame generators and geometric path transport must be stated. |
| 75 | `absolute-irreducibility-of-the-vanishing-quotient` | unverifiable | Weil I 5.8 gives absolute irreducibility for the nonzero vanishing quotient. An arbitrary positive-dimensional representation can be reducible, including a trivial two-dimensional one. |
| 76 | `symplectic-lie-algebra-generated-by-transvections` | verified | Weil I 5.11 proof read through p. 294. The nonzero simple Lie-module, rank-one generators, alternating nondegenerate form and Lie-span hypotheses are all retained; no general irreducibility theorem is silently substituted. |
| 77 | `lie-algebra-of-a-compact-l-adic-subgroup` | unverifiable | Weil I/Weil II require a sufficiently small p-adic logarithm chart and compact closed subgroup. Arbitrary topology/subgroup data without that chart cannot provide the claimed Lie algebra or exponential membership. |
| 78 | `kazhdan-margulis-open-image` | unverifiable | Weil I 5.9–5.11 open image follows from the geometric transvection-generated Lie algebra. An arbitrary representation has no open-image conclusion. |
| 79 | `characteristic-two-transverse-monodromy` | unverifiable | Weil II 4.2.3–8 locators corrected to pp. 220–221. Source distinguishes tame/transverse characteristic-two branches and connected components; the representation prototype omits their geometric assumptions. |
| 80 | `conditional-orthogonal-open-or-finite` | unverifiable | Weil II 4.4.1–4 locator corrected. Reflection generation, conjugacy and irreducibility are essential; generic compact orthogonal subgroups need not be open or finite. Existing ClassicalGroups is over C; Q_l extension requested explicitly. |
| 81 | `finite-orthogonal-ade` | unverifiable | Weil II 4.4.8–9 locator corrected. Rational character and a positive-definite integral root lattice are not consequences of arbitrary finite orthogonal image. The prototype infers positivity for any bilinear form (zero form disproves it). |
| 82 | `integral-failure-and-arithmetic-routing` | unverifiable | Weil II 4.3.10/4.5 locators corrected. Arbitrary polarization/vanishing/fixed subgroups do not satisfy the asserted kernel identity; DWP.4’s reverse whole-stage dependency also requires prefix separation. |
| 83 | `nearby-perverse-exactness` | unverifiable | Illusie 1994 4.5/2021 supplies nearby perversity with coefficients and rectified dimension function. Arbitrary t-structures and functors do not have shifted t-exactness; EDC trait/integral extension is now explicitly Part II. |
| 84 | `vanishing-perverse-exactness` | unverifiable | Illusie 1994 4.6 and its erratum give vanishing perversity under the same geometric conventions. An arbitrary vanishing functor between arbitrary hearts need not have this property. |
| 85 | `nearby-verdier-duality` | unverifiable | Illusie 1994 4.2–4 gives constructible finite-Tor duality for the actual nearby functor. An isomorphism for unrelated dualX,dualY,nearby functors is not implied. |
| 86 | `intermediate-extension-exchange` | unverifiable | Qualified ! and * exchange maps are necessary for j!* exchange. The prototype supplies arbitrary intermediate-extension functors without an open-immersion square or invertible exchange maps. |
| 87 | `perverse-coefficients-and-comparison` | unverifiable | Finite/adically realized/rational and integral p/p+ coefficient conventions must constrain the comparison. Arbitrary extX,extY,nearby′ functors do not commute. |
| 88 | `filtered-colimit-support-criterion` | unverifiable | Caraiani–Scholze 4.6 supports the qualified stalk/costalk colimit criterion and uniform bounds. A general t-structure need not have a lower half closed under arbitrary existing filtered colimits. |
| 89 | `igusa-semiperversity-interface` | unverifiable | Caraiani–Scholze 4.6 and IG.4 geometry checked. Recorded the LPV.6↔IG.4 stage-order problem. An arbitrary filtered diagram in an arbitrary heart is not the specified formal-model/Igusa interface. |

## Validation and completion

- Initial and final packet structural checks passed. The final run reports 0 errors and 0 warnings. Source-issue and version checks report 0 errors; the review ledger contains 89 distinct node IDs and all 23 source-issue verdicts. git diff --check passes. Structural success does not establish the mathematical truths above.
- Direct `lean-check research/blueprint/suggested/LefschetzPencilsAndVanishingCycles--LPV.0.lean` was attempted with more than 20 GB available. It failed **before elaborating the file** because the shared build lacks `TauCeti.AlgebraicGeometry.Fibers.olean`. Mathlib is at the specified pin; imported Tau Ceti source files were compared with the cited pin. No library build, cache download, dependency update or Lean server was started.
- The author's inlined-source check is not reproduced or adopted as a direct elaboration result. This review writes no Lean outside the permitted suggested file. Other available compiled builds have different Mathlib pins and were not substituted.
- Only the allowed packet/suggested/report and own handoff paths are changed. The completed review requires an author revision, not acceptance or promotion of this packet.
