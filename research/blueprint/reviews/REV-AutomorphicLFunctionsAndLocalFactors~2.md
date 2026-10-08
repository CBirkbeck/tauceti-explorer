# Independent review — Automorphic L-functions and local factors, round two

Job `REV-AutomorphicLFunctionsAndLocalFactors~2`; issue #7030.
Reviewer: Codex, session `codex-8NVOhA`, 8 October 2026.

**Accepted after corrections.** The packet is a complete target-level planning
pass through AL.0–AL.5. All six stages are planned; none is closed. The 16 named
proof-source and supplier refinements remain open, with 36 precise requests.
Acceptance certifies the plan and its scoped source statements, not implemented
proofs or complete inspection of the original proof interiors.

## Counts and disposition

| Item | Count |
| --- | ---: |
| Nodes | 124 |
| Verified existing nodes | 95 |
| Corrected existing nodes | 28 |
| Added nodes | 1 |
| Definitions / constructions | 29 / 2 |
| Theorems / lemmas / comparisons | 71 / 14 / 8 |
| Definition/construction API items | 137 |
| Definition/construction unit tests | 118 |
| API items / tests including theorem interfaces | 143 / 128 |
| Planets | 29 |
| Confirmed pinned baseline declarations | 68 |
| Baseline declarations removed / replaced | 0 / 0 |
| Public source versions | 33 |
| Independently confirmed source issues | 6 |
| Gaps / supplier requests | 16 / 36 |

| Layer | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| AL.0 | 31 | 6 | planned |
| AL.1 | 28 | 6 | planned |
| AL.2 | 15 | 6 | planned |
| AL.3 | 39 | 6 | planned |
| AL.4 | 5 | 2 | planned |
| AL.5 | 6 | 3 | planned |

The packet's `review.checked` ledger contains exactly one specific verdict for
every node. All implementation statuses remain `unchecked`. Every definition
and construction has at least three discriminating tests, recorded uses and an
API using existing carriers. Tests distinguish Fourier signs, lattice levels,
ramification, parity, Haar scaling, exceptional Euler zeros and refinement roots.
The new theorem does not create a new definition or change the planet selection.

## Corrections in this review

1. **Poisson and duality.** Tate Theorem4.1.4, original physical p.40, uses a
   finite-cardinality annihilator quotient. Finite vector-space dimension does
   not force zero. The corrected argument combines discreteness/compactness
   with the infinite number field. CompactGroups Layer6 supplies character
   completeness; AL derives pointwise summable Fourier reconstruction from
   Hilbert-basis uniqueness, uniform convergence and Haar full support.
   G2 explicitly retains the adelic topological-duality transport. No second
   Peter–Weyl theory is planned.
2. **Tate local calculations.** The Gauss-sum proof now includes the previously
   omitted high-frequency range by additive cosets modulo P^c and character
   orthogonality (Kudla Proposition3.8 proof, printed p.124). At real infinity
   the inverse character is ω times the norm power2a, including a=0. The norm
   coordinate in the idele-volume decomposition uses dt/t.
3. **Exact finite induction products.** Added
   `AL.3/rs-induced-factor-product`, marked with this review's `addedBy`.
   Humphries, Archimedean newform theory, §2.2 p.4 and §2.4.1 formulas(2.4)–(2.6)
   p.6, states the exact factor products; his nonarchimedean test-vector note
   §5 p.6 uses them in the newform cancellation. This target is restricted to
   irreducible generic normalized inductions of essentially square-integrable
   blocks over a finite local field. It supplies the exact common shifted
   standard factor needed by the GJ newform proof. Cogdell Proposition6.6's
   gamma multiplicativity and L-divisibility alone do not supply that equality.
   Original JPSS §9.5 and standard-factor proof interiors remain G5/G6.
4. **Unitary local convergence.** Cogdell Propositions6.2(i) and8.2, printed
   pp.47 and63, give Re(s)≥1 convergence for unitary generic inputs. This
   refinement and local minimality are now direct inputs to strong
   multiplicity one. Finite derivatives belong to SR.5's complex specialization,
   not to a falsely credited SR.3 derivative theorem. The finite minimality
   citation is Proposition6.3/Corollary6.3.1, printed p.48.
5. **Mirabolic norm twists.** For η=|·|^(−inσ), the zero modes retain
   denominators n(s−iσ) and n(s−1−iσ), with determinant exponents s and s−1.
   They vanish only when η restricts nontrivially to the norm-one quotient.
   Cogdell's integral notes §1.1.3 pp.4–5 and Fields Proposition5.4, printed
   pp.41–42, support the distinction. The σ=1 regression is recorded in the
   packet and the named Lean omission.
6. **Field and Fourier scope.** The global RS unfolding, pole criterion, FE,
   mirabolic theorem, strip bound and number-field SMO/isobaric arguments now
   say which field their inspected sources cover. The function-field formal
   rational and periodic-pole branch remains separate. Global RS pole/FE
   citations identify Theorems9.1–9.2, printed pp.74–75. Humphries formula(2.15),
   p.7, uses inverse-character transpose Fourier pairing and a transpose-inverse
   coefficient. Inverting the character and substituting transpose yields the
   packet positive plain-trace pairing and inverse coefficient; this conversion
   is now explicit, including its rank-one i-power convention.
7. **Direct inputs and ownership.** Added the missing GNF Layers0/5/6/9/10,
   ADS Layer3, restricted-Haar, Gaussian, gamma and FA.2 routes where the proof
   uses them. New requests name CompactGroups Layer6 character completeness
   and SR.2 normalized induction. Removed inaccurate request consumers for
   finite SR.3 versus archimedean estimates, FA.2 versus the abstract function-field
   Euler product, and AN.2 Hadamard versus the order-one bound. The WD and
   classical/Hilbert GL₂ fine-node imports retain geometric Frobenius, monodromy,
   characteristic-zero and coefficient-prime restrictions, together with the
   classical dual representation and Hilbert half-power twist. General finite GL_n
   and equal-characteristic epsilon compatibility remain conditional in G13.
   Ordinary Euler corrections now use the existing fine stabilization and
   twisted-series comparison nodes.
8. **Bessel and metadata.** The K_(1/2) API value has its Gaussian-substitution
   proof leaf, and the Laplace–Mellin proof records gamma hypotheses and an
   absolutely convergent two-gamma derivation of beta. No routine lemma nodes
   were added. Corrected Gan–Ichino's almost-tempered page to17 and Calegari–
   Geraghty's AppendixA theorem kind to LemmaA.5. Every public source has a
   scoped independent-read record; no full-book or full-original-proof read is
   inferred from checking a survey's target statement.

The complete list of changed existing nodes and the reasons follows. Reader
statements, direct inputs, acceptance checks, source locators, all gap/request
appendices and coverage counts were reconciled. Its introduction now uses the
current supplier names. The suggested file's named omissions carry the same
field restrictions and the new product target.

| Existing node | Recorded correction |
| --- | --- |
| AL.1/local-quasicharacter-conductor | Added direct prerequisites: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic. |
| AL.0/adelic-schwartz-bruhat-space | Added direct prerequisites: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient, AdelicAlgebraicGroups:AA.0/restricted-haar-product, AdelicAlgebraicGroups:AA.0/restricted-haar-split. |
| AL.0/adelic-poisson-summation | Added direct prerequisites: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups, AutomorphicLFunctionsAndLocalFactors:AL.0/local-additive-self-duality, AdelicAlgebraicGroups:AA.0/restricted-haar-product. Repaired the finite-cardinality argument and supplied compact character completeness explicitly. Separated the annihilator and Poisson locators. |
| AL.1/local-gauss-sum | Supplied the missing high-frequency vanishing case. |
| AL.1/explicit-epsilon-factors | Corrected the inverse real character for both a=0 and a=1. |
| AL.1/global-eigendistributions | Added direct prerequisites: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters. |
| AL.1/global-zeta-integral | Added direct prerequisites: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters. Added direct prerequisites: tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products. Added direct prerequisites: AdelicAlgebraicGroups:AA.0/restricted-haar-split. |
| AL.1/completed-hecke-l-function | Added direct prerequisites: tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products. |
| AL.1/idele-class-volume | Added direct prerequisites: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles. Used multiplicative dt/t for the positive norm coordinate. |
| AL.0/self-dual-haar | Added direct prerequisites: mathlib:fourierIntegral_gaussian. |
| AL.0/bessel-k | Explained the half-order API evaluation. Added direct prerequisites: mathlib:Complex.integral_cpow_mul_exp_neg_mul_Ioi. |
| AL.0/bessel-laplace-mellin | Added direct prerequisites: mathlib:Complex.integral_cpow_mul_exp_neg_mul_Ioi. Made the gamma and beta evaluation route explicit with its hypotheses. |
| AL.2/godement-jacquet-functional-equation | Documented the character and transpose conversion instead of identifying the source conventions silently. Corrected the functional-equation source comparison. |
| AL.2/godement-jacquet-newform-test | Added direct prerequisites: AutomorphicLFunctionsAndLocalFactors:AL.3/rs-induced-factor-product. |
| AL.3/rs-local-factor | Added direct prerequisites: SmoothRepresentationsOfLocalGroups:SR.5. Assigned the derivative filtration to its actual SR.5 owner. Added the finite-place minimality locator; Jacquet covers infinity. |
| AL.3/rs-unramified-test | Added direct prerequisites: SmoothRepresentationsOfLocalGroups:SR.4. |
| AL.3/whittaker-conductor-shift | Added direct prerequisites: FunctionFieldArithmetic:FA.2. |
| AL.3/rs-local-convergence | Added the unitary boundary convergence refinement used by strong multiplicity one. Pinned both finite and infinite unitary estimates. |
| AL.3/strong-multiplicity-one | Added direct prerequisites: AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-convergence, AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor. Made the source-supported number-field scope explicit in this downstream signature. |
| AL.3/global-rs-unfolding | Restricted the global integral/pole theorem to its read number-field source. |
| AL.3/rs-global-poles | Restricted the global integral/pole theorem to its read number-field source. Corrected the named global-pole theorem locator. |
| AL.3/rs-global-functional-equation | Restricted the global integral/pole theorem to its read number-field source. Corrected the theorem versus proof locators. |
| AL.3/mirabolic-eisenstein-functional-equation | Retained shifted zero-mode denominators for every norm twist. Distinguished norm twists from characters with nontrivial norm-one restriction. |
| AL.4/local-parameter-comparison | Added direct prerequisites: ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation, ArithmeticGaloisRepresentations:R01.2/local-euler-factor, ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility. Pinned the precise WD and GL₂ arithmetic supplier scopes, including the classical dual and Hilbert half-power dictionary. |
| AL.5/ordinary-gl2-euler-factor | Added direct prerequisites: ModularSymbolsPadicLFunctions:L1/p-stabilised-euler-factors, ModularSymbolsPadicLFunctions:L2/p-stabilisation. |
| AL.3/mirabolic-eisenstein-series | Made the source-supported number-field scope explicit in this downstream signature. |
| AL.3/rs-vertical-strip-bounds | Made the source-supported number-field scope explicit in this downstream signature. |
| AL.3/isobaric-strong-multiplicity-one | Made the source-supported number-field scope explicit in this downstream signature. |

## Prior review and confirmed red-team findings

Every correction in the original
[round-one review](REV-AutomorphicLFunctionsAndLocalFactors.md) was checked
against the revised packet, reader and suggested file. The three intervening
ordinary-multiplicity/converse nodes were reviewed in full. The narrow
[fix review](REV-FIX-RT-AREA-automorphic-1~4.md) is retained in `reviewHistory`;
its refusal to promote a packet awaiting this independent blueprint review is
resolved by the present full review.

- **RT-AREA-automorphic-1/2:** the full- and reduced-rank converse theorems keep
  their distinct twist ranks, completed dual niceness, rank-two boundary and
  finite exceptional-set conclusion. G16 preserves original proof interiors.
- **/8:** Fourier reconstruction proves global genericity before factorization;
  AF.3 supplies the cuspidal/rapid-decay carrier, and AF.2 supplies completed
  Flath. Ordinary global multiplicity one is derived here, not imported from AF.
- **/10:** the character-dependent mirabolic poles and global RS pole criterion
  are retained, with the norm-twist zero-mode refinement above. No unconditional
  entirety claim remains.
- **/13:** the modular-symbol algebraicity/character dictionary is GL₂/Q. BSW
  number-field algebraicity retains its own owner and range. Semilinear Whittaker
  rational structure, signature, Gauss twisting and higher-rank periods remain
  the separately identified AL work in G12.

Also verified the original review's Jacquet growth-space restriction, completed
versus algebraic tensors, multiplicative Haar scaling of both z and z/L,
noncircular Taylor continuation and finite Fourier inversion, inverse-different
trace input, distinct diagonal period multiplicity, arbitrary-r Satake bound
request, degree twists reaching GS.6's finite-order scope and provisional AN.2
Hadamard extension. Every requested correction survives in the main text rather
than only in an appendix.

## Baseline, audit and suppliers

All 68 actual declaration statements were opened at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Names, modules, hypotheses and
consumer conventions agree; no baseline citation was removed or replaced.
The packet records this independent verification per declaration. New direct
edges reuse its already confirmed Gaussian and gamma declarations.

The important near misses remain explicit: native Fourier has the negative
kernel; complex trace adds scale2; nonzero-modulus hypotheses accompany ZMod
Fourier characters; Schwartz Fourier is archimedean; IsHaarMeasure is not
invariant continuous-distribution uniqueness; native Dedekind residue is real
one-sided; meromorphic order is not evaluation at a totalized pole; classical
CuspForm continuation has its positive-weight hypotheses. The nodes extend or
compare these precise statements without crediting a broader native theorem.

Read the reviewed AL.0–AL.5 library-coverage rows and the accepted RS-13
ownership result, report and review. General Schwartz/representation/Haar,
Satake, arithmetic WD, function-field cohomology and entire-function carriers
remain with their owners. Fine AA, AF, R01.2, R19.4, ALS.5, GS.6, IHG.3 and
ModularSymbols statements were checked against their actual consumers. Coarse
SR, FA, GNF, CFT, ADS, CompactGroups and reductive-group exports were checked
against their stated contracts, retaining precise requests for near misses.
CompactGroups and InductionRestriction were the two upstream reference readers.
No upstream or atlas-data files were edited.

## Source issues and reading limits

The 33 public PDFs match the packet's recorded hashes. Each source's
`independentReviewChecked.scope` gives the pages inspected. All six source
issues now have this review's confirmed verdict and preserve earlier reviews:

| Issue | Independent check |
| --- | --- |
| E1 | Published Kudla p.110: conductor divides inducing modulus; primitive mod3 pulled back to mod6 disproves the reversed direction. |
| E2 | Lecture preprint p.1 versus published p.110: the author placeholder is repaired in the published version. |
| E3 | Published p.128 versus pp.123–124: the local FE is(3.23), and explicit epsilon values are Proposition3.8. |
| E4 | Published pp.121–122: Γ_R(s) in the x^(−a) convention has even negative poles and residue derivative order a+r. |
| E5 | Original Tate physical pp.24,26: the inverse-different volume gives the positive half-discriminant exponent; the 1967 reprint remains uncollated. |
| E6 | Published Kudla p.126: a rank-two sum of independent evaluation tensors refutes the unrestricted decomposability converse. |

No new source error was inferred from a convention change. G1–G16 retain exact
carrier, topology, original-proof and owner-extension refinements. In particular
restricted monographs, original JPSS denominator/product interiors, remaining
Jacquet induction, Gelbart–Shahidi/Shahidi, original period comparisons and
converse spectral inversion are not claimed read or proved. All repository
source accounts are our own mathematical statements with locators, without
verbatim source passages or section-by-section source summaries.

## Checks and remaining orchestration

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicLFunctionsAndLocalFactors.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/AutomorphicLFunctionsAndLocalFactors.lean`: exit0 at the pinned Mathlib build; 183 warnings, all declaration uses of `sorry`, with no errors or other warning classes.
- `git diff --check`: clean. Deliverable scope, exhaustive verdict coverage,
  implementation statuses, API/test preservation, internal acyclicity and
  reader/omission consistency checked.

No unresolved contradiction or blocking question remains. The orchestrator
still needs to assign the explicitly recorded original-proof refinements and
owner extensions, particularly G13 finite parameter compatibility, G14 general
Hadamard placement, G15 measure/Satake/period contracts and G16 converse proof
interiors. The late rational-period suffix must preserve the analytic-prefix
ordering proposed by RS-13. These are follow-up refinements of an accepted
planning pass, not a claim that any stage is closed.
