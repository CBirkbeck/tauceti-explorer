# DESIGN-ModularFormsPartII handoff

Refs #3464. Agent: Codex (GPT-6), session `codex-ceFtgT`. The bot confirmed [the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/3464#issuecomment-6257451377). This is the session's only claimed job. The branch is `codex-ceFtgT-modular-forms-part-ii`.

## Result

The target-level design pass is complete. The new roadmap definition, packet, full reader document and compact suggested Lean file agree. All 60 items of the paper extraction's `NoncongruenceModularForms` route have explicit target mappings in the packet's `sourceRoute` and the reader's route inventory. The issue names the same continuation `ModularFormsPartII`; no second roadmap or duplicate definition was created for the alias.

There are 82 nodes: 12 definitions, 3 constructions and 67 theorems. The 15 definitions/constructions have 63 API items and 59 unit tests; each has uses, at least three API items and at least three discriminating tests. There are 42 planets, with no layer above six, and 28 pinned baseline declaration citations. There are 13 exact gaps and 16 supplier requests. All nodes remain `implementationStatus: unchecked`. There is no independent-review verdict in these files.

The packet is `complete`, not closed: every layer has all its target-level prerequisite chains ending at an identified library declaration, exact supplier node, requested supplier stage, or recorded gap. No layer is partial or unread. The remaining inputs prevent closure, not completion of this design pass.

| Layer | Nodes | Coverage | Main remaining contracts |
| --- | ---: | --- | --- |
| W1 — Weak forms and geometric levels | 8 | planned | Stated imported stage contracts; no separate gap |
| W2 — The modular λ coordinate | 7 | planned | UNI |
| W3 — Bounded-denominator fields and holonomy rank | 8 | planned | ALG, UNI |
| W4 — Congruence cohomology and invariant vectors | 17 | planned | FIN, COEFF |
| W5 — Ihara generation and leveraging | 10 | planned | CSP, MODEL |
| W6 — The unbounded denominators theorem | 8 | planned | MODEL, NF, ROOT |
| W7 — Differential equations and vector-valued forms | 14 | planned | ALG, UNI, NF, ARITH, GLOCAL, SZ |
| W8 — Quasimodular and arithmetic growth applications | 7 | planned | LOCALGLOBAL |
| W9 — The arithmetic fundamental-group application | 3 | planned | MODEL, NF, NERON |

W4 precedes W5 to avoid a cohomology/Ihara cycle. The extraction's broad application direction becomes W7, W8 and W9, with explicit internal dependencies. The packet proposes ownership of generic analytic tools in the existing DiophantineApproximationAndTranscendence and ConformalMapping families as their Part II continuations; no absent stage ids are invented.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularFormsPartII.json`: exit 0, zero errors and zero warnings. The configured shared declaration index exists and was used; this is not merely reference-format validation. All 28 cited declaration statements were also read in source at the exact pins.
- `lean-check research/blueprint/suggested/ModularFormsPartII.lean`: exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the only warnings are the expected unfinished proof declarations. Available memory was checked first; one compiler ran at a time and finished normally. No language server or library build was started.
- The suggested file is 201 lines, with five real-bodied light definitions over pinned carriers, selected milestones and examples. It contains no unimplemented data, auxiliary theory development, fake proposition placeholders or copied source passages. Heavy definitions, their full APIs and tests are specified in the reader document as WORKERS.md's 2026-10-12 shape requires.
- JSON parsing, node/reader/source-route agreement, the stage DAG, target API/test minima, planet limits and compact-file checks are included in the local final checks. The final submission also runs the deliverable-path/local-path intake check and `git diff --check`.

## Ownership and current upstream audit

The existing parent is the first roadmap prerequisite and `parent`: `tauceti:TauCetiRoadmap/ModularForms`. Current TauCetiRoadmap main was read at `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was searched at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These trees were read only. No build command was run there.

The parent ModularForms README was read in full (including its finite-index valence and 8G/10 boundaries), with the Suggested opening and relevant carrier interfaces. FuchsianOrbifolds and ConformalMapping READMEs were read in full, with the relevant quotient, cusp and reflection interfaces; the current ProfiniteArithmetic ownership boundary and relevant source were checked. Searches also covered the additional current upstream directions relevant to congruence, local/profinite groups and arithmetic fundamental groups. The reviewed library coverage was used as a lead and actual pinned declarations were checked. The ordinary holomorphic carrier, strict cusp width, parity, general finite-index valence formula, Serre derivative and E₂ derivative identity are baseline citations, never new targets.

Exact supplier node statements were read for all-prime congruence bounded denominators, all-weight analytic comparison, Hochschild–Serre, profinite product Künneth, finite UCT/Sylow detection, Lazard exterior cohomology, adjoint H¹, theta products and transformations, eta multipliers, G-functions/Galochkin, étale π₁, and Ramanujan–Petersson. ModularCurvesPartII's R12.4/R13.5/R14.4 stage contracts were read; their additional model/CSP requirements are requests and gaps rather than claims about their existing scope. Current ProfiniteArithmetic does not supply the special arithmetic SL₂ completion and CSP argument used here.

## Exact gaps and where to resume

Discharge the following contracts in their owners and replace the gap with a verified node or requested-stage dependency. Do not expand the packet into auxiliary lemma nodes: its target pass is finished.

**ModularFormsPartII:gap/ALG — Unregistered arithmetic holonomy supplier.** The extraction proposes ArithmeticAlgebraizationAndHolonomyBounds, but no roadmap, packet or reserved stage exists at this baseline. Needed: Definition 2.0.4 H/V including meromorphic trivial-monodromy singularities, and Corollary 2.0.5 with p nonconstant, p(u(t)) integral, φ holomorphic near the closed disc, |φ′(0)|>1 and its mean-log dimension bound over ℚ(p). This is the exact external input to W3 and W7; no fictitious supplier id is used. Register the proposed Part II of DiophantineApproximationAndTranscendence and import its final layer.

Consumers: `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W3/finite-rank`, `ModularFormsPartII:W3/quantitative-rank`, `ModularFormsPartII:W7/ode-algebraicity`.

**ModularFormsPartII:gap/UNI — Unregistered punctured-plane supplier.** The extraction proposes PuncturedPlaneUniformizationAndValueDistribution, but it has no registered roadmap or packet here. Needed: complex ODE continuation and regular singularities; normalized universal covers F_N for N≥2; Theorem 5.1.4 gamma formula and positive N⁻³ derivative boost; Theorem 6.0.1 mean log⁺|F_N^N|≪log(N/(1−r)); Schwarz equality and holomorphic uniformization radius. Own the generic results there as Part II of ConformalMapping. N=1 is treated by a small-level embedding, not the hyperbolic formula.

Consumers: `ModularFormsPartII:W2/small-uniformizations`, `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W3/finite-rank`, `ModularFormsPartII:W3/quantitative-rank`, `ModularFormsPartII:W7/ode-algebraicity`, `ModularFormsPartII:W7/regular-singular-component`.

**ModularFormsPartII:gap/FIN — Finite periodic and amalgam cohomology inputs.** The finite UCT/Sylow supplier supplies detection, but not the integral H₂ computations for cyclic and generalized-quaternion groups, their primary Sylow classification inside SL₂(𝔽_p), or the C₄ *_{C₂} C₆ cohomology sequence. Plan these as a ProfiniteCohomology extension, with the finite S₃ case separate. The special SL₂ calculations stay here.

Consumers: `ModularFormsPartII:W4/finite-schur`, `ModularFormsPartII:W4/sl2z-cohom`.

**ModularFormsPartII:gap/COEFF — Continuous integral homology conventions.** Specify and supply the completed-bar compact ℤ̂ coefficient theory, UCT with finite discrete coefficients, primary finite generation, and Nakayama used to pass from zero mod-ℓ H₂ quotients to zero compact H₂. CDT25 p.665 does not spell out this interface. Do not read it as a proof of abstract-group integral homology vanishing.

Consumers: `ModularFormsPartII:W4/integral-local-h2`.

**ModularFormsPartII:gap/CSP — The arithmetic amalgam and congruence subgroup property.** ModularCurvesPartII:R14.4 owns an Ihara application but not the exact group-theoretic input used here. Required: the two level-N copies of SL₂(ℤ) in SL₂(ℤ[1/p]) form the stated amalgam over Γ₀(p), and every finite quotient of the relevant arithmetic subgroup is congruence away from p, with central signs and N≥3 variants. Supply a read primary proof (CDT25 cites Berger, Serre and Mennicke) and extend that owner. This is not generic Goursat and is not supplied by a cohomological Ihara injectivity theorem alone.

Consumers: `ModularFormsPartII:W5/abelian-ihara`, `ModularFormsPartII:W5/nonabelian-ihara`.

**ModularFormsPartII:gap/MODEL — Rational cusp models and geometric degree descent.** Supply the specific geometrically connected ℚ-model of Y(m) classifying an elliptic curve with symplectic identification E[m]≃ℤ/m⊕μ_m, its rational ∞ cusp, and coefficientwise Galois-compatible Fourier germ. The existing ModularCurvesPartII:R12.4 fixed-pairing model and R13.5 level-raising contracts do not explicitly give this twist and cusp. Prove the geometric Galois base-change step for R₂N M₂Np; field intersection alone is not enough.

Consumers: `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W5/congruence-degree`, `ModularFormsPartII:W6/number-field-variant`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

**ModularFormsPartII:gap/NF — Arithmetic descent of noncongruence Fourier germs.** Supply a number-field model and q-germ for an arbitrary finite-index modular function with algebraic coefficients; show all coefficients lie in one number field, and coefficientwise Galois conjugation produces finite-index weak modular functions with compatible cusp parameters. Reduce arbitrary weight via the explicit congruence factor. Belyi existence alone does not identify its distinguished Fourier germ, and the congruence q-expansion comparison alone does not cover a noncongruence group. This is the precise missing bridge in the short trace proof of Remark 6.3.2.

Consumers: `ModularFormsPartII:W6/number-field-variant`, `ModularFormsPartII:W7/arithmetic-component`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

**ModularFormsPartII:gap/ROOT — Special congruence abelianization for Γ₀(2).** The h-root example can be completed by an explicit denominator calculation, or by proving that the congruence completion of Γ₀(2) has abelianization ℤ/24⊕ℤ/2 and identifying the h-cover character. CDT25 p.629 states this computation without proof. Supply the local elementary-matrix computation and identify the order-2 factor, rather than confusing it with SL₂(ℤ_p)^ab.

Consumers: `ModularFormsPartII:W6/h-root-test`.

**ModularFormsPartII:gap/ARITH — Arithmetic equation for the actual selected component.** Prove that the regular-singular complex realization of W_j with its chosen integral germ descends to ℚ̄(x), and that the minimal arithmetic scalar operator realizes precisely this continuation module, including reducible cases and apparent poles. A rank-n complex local system, rational Taylor coefficients, or a bare Riemann–Hilbert existence assertion alone does not prove this. This special modular bridge belongs to W7; the generic arithmetic G-function theory remains in DT.5.

Consumers: `ModularFormsPartII:W7/arithmetic-component`.

**ModularFormsPartII:gap/GLOCAL — Exact G-operator local-monodromy input.** DT.5 supplies the definition of a G-function and a Chudnovsky–Galochkin condition for a linearly independent system, but its regular-singularity node only controls the specified point. Needed here: the minimal operator of one G-function, compatibility with the descended possibly reducible cyclic module, and the global nilpotence/quasi-unipotence theorem at every singularity. Request this precise extension of DT.5; semisimplicity then yields finite order.

Consumers: `ModularFormsPartII:W7/arithmetic-component`.

**ModularFormsPartII:gap/SZ — Primary Stiller–Zagier differential-equation proof.** CDT25 Remark 7.2.3 cites the positive-weight differential equation without proving its scalar order and singularity claims. Read the primary Stiller (1984) or Zagier (2008), §5.4 proof, and pin the finite cover, cyclic order, apparent poles and symmetric-power identification. The target uses order at most k+1 until those hypotheses are supplied.

Consumers: `ModularFormsPartII:W7/stiller-zagier`.

**ModularFormsPartII:gap/LOCALGLOBAL — Deficient-place converse needs an arithmetic witness.** The unconditional ambient converse asserted on CDT25 p.695 requires (i) noncongruence to be detected by an actual arithmetic cuspidal component and (ii) a theorem converting the relevant all-place local bounds into one global common denominator. Neither follows merely from the component theorem or from noncongruence of an invisible summand. W8 proves the precise finite-denominator-support witness version. The unrestricted archimedean and finiteness questions remain questions, not roadmap theorem targets. Selberg’s asserted bound also needs its primary hypothesis/normalization check before use.

Consumers: `ModularFormsPartII:W8/noncongruence-witness`.

**ModularFormsPartII:gap/NERON — All-prime cuspal-model cover descent.** The source gives only a sketch referring to Ihara (1994), Horizontal divisors on arithmetic surfaces associated with Belyi uniformizations, Theorem 1 pp.248–249 and §4 p.252 (DOI 10.1017/CBO9780511569302.011). No lawful full text was available from the cleared library or official publisher/author endpoints checked. Supply and read that proof, fix the fibrewise connected-model convention, verify the smooth cusp section and regular-model hypotheses for every N and all bad primes, and prove the λ(τ/N)/16 formal-coordinate/level-doubling descent. The existing modular-curve and étale π₁ suppliers do not state this arithmetic criterion.

Consumers: `ModularFormsPartII:W9/cuspal-model`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

## Supplier requests

1. `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`: Retain the parent character eigenspace and χ(−I)=(−1)^k parity convention; use the existing modular-form graded ring rather than rebuilding it.
2. `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`: Supply the parent’s lower level-one j/E₄/Δ identity and q normalization used by the cube-root example; its normalized j inputs are separate from the higher dimension-formula module.
3. `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`: Supply finite polygon/Schreier presentations and torsion-free freeness for Γ(N), N≥3, with its S,T coset action and rank; no arithmetic congruence subgroup property is assumed.
4. `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`: Supply finite rational cusp representatives, scaling charts, strict translation widths and order comparison with boundedness; irregular cusp signs remain visible.
5. `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`: Supply the compactified analytic quotient X(Γ), cusp local charts and extension of cusp-meromorphic functions.
6. `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`: Supply degree/index and ramification for finite holomorphic maps of compactified quotients, including projective stabilizers and X(2) degree-one identification.
7. `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`: Supply Schwarz reflection and monodromy continuation to identify the λ fundamental-domain map, not an already constructed λ function.
8. `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`: Supply universal-cover lifting and the covering/monodromy correspondence, with effective deck group; holomorphic descent and local systems use its analytic refinement.
9. `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`: Supply algebraicity and number-field models for finite three-point covers. The distinguished Fourier-germ descent is the additional NF gap.
10. `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`: Supply finite-cover and function-field correspondence for three-point covers, including compactification and meromorphic branching.
11. `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`: Supply continuous finite-coefficient cohomology, filtered-colimit comparisons and smooth actions. FIN and COEFF separately identify periodic/amalgam and compact-integral extensions not already in this stage.
12. `ModularCurvesPartII:R12.4`: Supply the specific geometrically connected symplectic-twist modular curve over ℚ with E[m]≃ℤ/m⊕μ_m and a rational ∞ cusp, as an extension of the fixed-pairing contract; see MODEL.
13. `ModularCurvesPartII:R13.5`: Supply regular models and smooth cuspal sections at all levels and all finite primes, plus base-change compatibility needed by the connected cuspal model. NERON records what the present level-raising contract does not cover.
14. `ModularCurvesPartII:R14.4`: Extend the Ihara owner with the level-N arithmetic amalgam in SL₂(ℤ[1/p]) and its precise congruence subgroup property, including signs; see CSP.
15. `DiophantineApproximationAndTranscendence:DT.5`: Supply the minimal G-operator/global nilpotence/quasi-unipotence theorem at every singularity, for the actual descended possibly reducible cyclic component module; see GLOCAL.
16. `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`: Supply character decomposition at principal level, an eigenform/newform basis and oldform reindexing, including coefficient recurrences needed to extend Deligne’s prime bound to all cusp coefficients.

These are packet requests, not unsolicited messages to other workers or maintainers. No supplier packet, reserved id, existing roadmap, application file or atlas data was edited.

## Sources read and source limits

CDT25 is Calegari–Dimitrov–Tang, *The unbounded denominators conjecture*, JAMS 38 (2025), 627–702, [published author offprint](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), read 2026-10-19. SHA-256 `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`. Reading covered the introductory theorem/examples pp.627–632; the precise Definition 2.0.4/Corollary 2.0.5 contract pp.635–636; §§3–4.6 pp.649–666; Theorem 5.1.4 pp.667–668 and Example 5.1.22 p.673; §6.3 pp.685–686; and §§7.2–7.4.9 plus Theorem 7.4.10 pp.687–696. The generic analytic proofs of §§2, 5 and 6 were not reconstructed or claimed read in full; their exact necessary outputs are ALG/UNI supplier contracts.

KSV10 is Kiming–Schütt–Verrill, *Lifts of projective congruence groups*, [arXiv:0905.4798v4](https://arxiv.org/pdf/0905.4798), 20 July 2010; §3 Lemma 7, Proposition 3 proof, equation (1) and Remark 8 pp.4–6 were read. SHA-256 `47b1b84db45e4e774a8705d75df323558352885c7a81e3f786b9cd0168d55ef6`. This discharges the primary-proof input for the signed Wohlfahrt theorem. The proof can use a finite CRT avoidance argument instead of Dirichlet to arrange coprimality.

Ihara (1994), *Horizontal divisors on arithmetic surfaces associated with Belyi uniformizations*, [DOI 10.1017/CBO9780511569302.011](https://doi.org/10.1017/CBO9780511569302.011), Theorem 1 pp.248–249 and §4 p.252, was not available in lawful full text through the checked official endpoints or the cleared reference index. It was not read and is the explicit NERON source gap. The maintainer's cleared-library index was checked, no book file was copied, and no uncleared copy was used.

All repository prose states mathematical results in our own words with locators. There are no source excerpts, source files or section-by-section summaries. The packet contains 15 source findings, with paraphrases even in the legacy `printed` field (`printedIsParaphrase: true`). Fourteen concern CDT25; E21 concerns the KSV10 factorization. No published correction is asserted absent beyond the bounded author/publisher/arXiv queries actually recorded. Historical extraction checks are attributed rather than presented as repeated verification. The extraction's generic analytic findings E2/E3/E8/E9/E15/E16 belong with the imported analytic theories and were not re-certified by this modular design pass.

## Mathematical points for independent review

- Signed level is not strict level, and Wohlfahrt into the unsigned subgroup needs E. The kernel H′ in Γ(2) exercises both distinctions.
- The Kummer coordinate need only have integral N-th power. The normal stabilizer must include a signed principal-group intersection before taking its core.
- In W5 conjugation by diag(p,1) maps Γ₀(p) to an upper-right divisibility condition inside the full level-N group. Reduction kernels are computed on the unsigned domain first. The generation formula uses G∩Γ(Np) and A⁻¹GA∩Γ₀(p).
- Field intersection and degree-preserving base change are distinct assertions. The rational symplectic-twist cusp model and geometric Galois descent are explicit MODEL work.
- At p=2 the local abelianization is proved directly before H²; the final H² result does not enter the all-level invariant argument. Small-level invariants require verifiable finite certificates. Compact continuous integral homology has a separate coefficient-theory contract.
- Integral vector components do not supply an integral rank-6n bundle, an irreducible system or a congruence kernel for an invisible ambient summand. The explicit 1⊕σ example tests these errors. Arithmetic descent and the exact minimal G-operator theorem are ARITH/GLOCAL.
- The elliptic integral sign and θ_qΔ factor are fixed. Γ(12) is checked for the actual theta quotients and is not a universal level for all even-degree theta Laurent monomials.
- Deficient finite places require an actual arithmetic component plus finite denominator support or LOCALGLOBAL; global unbounded denominators alone do not choose one place. The open questions in §7.4 are not theorem targets.
- The arithmetic π₁ target concerns the smooth fibrewise cuspal component at all bad primes. Its λ(τ/N)/16 coordinate needs level doubling/formal descent before comparison with the usual width-N cusp parameter.

The next work is independent review of this complete target design and discharge of the listed supplier inputs. No further job is claimed in this run. Scratch research, source downloads and compiler logs are deleted after submission; this note and the packet retain the necessary locators, hashes, boundaries and resumption instructions.
