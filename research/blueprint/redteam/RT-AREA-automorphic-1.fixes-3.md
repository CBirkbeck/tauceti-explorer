# FIX-RT-AREA-automorphic-1~3

Codex, session `codex-2k3LL6`, 7 October 2026. Refs #6900.

This round addresses findings **RT-AREA-automorphic-1/1–/31** and the corrections requested by [REV-FIX-RT-AREA-automorphic-1~2](../reviews/REV-FIX-RT-AREA-automorphic-1~2.md). Findings /32–/41 are outside this issue. It changes blueprint deliverables only; the atlas, campaign documents, upstream roadmaps and other jobs' packets are untouched.

The mandatory round-2 reader corrections are applied. This round also makes the generic converse owner explicit, corrects the real-representation and cochain supplier boundaries, proposes the independent real Paley–Wiener prefix, and replaces avoidable whole-stage special-function imports. Existing fixes supplied by later blueprint work are retained and identified below. No independent review verdict or implementation status is promoted. In particular, accepting a Jacobi ownership repair must not accept the entire QSeries packet.

## Changes by finding

### /1 — GL₃ inputs to Langlands–Tunnell

AL.3 now has `gln-converse-full-rank` and `gln-converse-reduced-rank`, with separate twisting families and conclusions. The first applies for n≥2 with twists through n−1; the second applies for n≥3 with twists through n−2. In the latter, twists unramified at nonempty finite S give agreement outside S, whereas empty S gives cuspidal automorphy. Both retain the admissible tensor, central-character, initial convergence and completed analytic hypotheses.

R17.4's `gl3-recognition`, `adjoint-lift` and `cubic-character-induction` import the reduced-rank contract. The recognition reader now agrees with the packet's **unitary cuspidal Rankin–Selberg pole comparison**, rather than its obsolete isobaric-uniqueness claim. The non-normal cubic construction and R17.4a proposal remain; cyclic towers still do not replace them. The R17.4a/AL.3b proposals name the two precise generic contracts. R16.5 retains its separately checked full rank-two twist family.

AL G16 records reduction to generic Π, opposite-mirabolic sums and convergence, spectral inversion, rational generation, local Fourier vanishing, essential vectors and weak approximation. The highly ramified T variant needed by Gelbart–Jacquet remains a distinct original-source obligation. The suggested GL₃ shortcut asserting equality of arbitrary objects from local data is removed; its real signature is explicitly omitted until the analytic carriers exist. These are planned contracts and recorded gaps, not completed JPSS proofs.

### /2 — One archimedean classification owner

The AF packet already has Weil groups, Langlands classification, discrete series, GL₂ real discrete series and archimedean GLₙ LLC; AL and R16 already import that owner. The AF.1b proposal now includes **Casselman embedding and Casselman–Wallach globalization**, rather than leaving globalization in the earlier algebraic prefix. It explicitly supplies AF.2, AF.4, AL.2/3, R16.2/6 and ET.1. AL.1 keeps Tate's rank-one theory; no competing AL.1a classification is introduced.

Globalization now lists its classification/discrete-series inputs. This exposed the circular definition of temperedness through globalization. `tempered-square-integrable` now takes a **supplied continuous SF or unitary Hilbert realization**, using the independent SF interface. Its existence, induction/classification and comparison with the eventual canonical SAF realization are explicit gaps. The reader and suggested omission notes agree. Original classification proofs remain unread under the existing AF source gaps. The compact-Cartan/modulo-centre conventions are preserved.

### /3 — Lazard and Iwasawa dimension theory

No CC or NE packet is a deliverable of this issue. Retain the assigned handoff to `BP-CompletedCohomologyPartII--CC.0`: one foundational NE.0/L1 successor must supply compact p-adic analytic structure, suitable open uniform subgroups and left/right noetherianity. Auslander regularity, grade and descent require their own coefficient and p-torsion hypotheses. The powerful-group cohomology computation is not credited as the general noetherianity proof. No new CC/NE packet or arbitrary-profinite theorem is written here.

### /4 — Local harmonic analysis before invariantization

AS already plans `real-invariant-paley-wiener`, `real-operator-paley-wiener`, `spectral-multiplier`, `mu-function` and `local-normalization`. Its BDK request remains with `SmoothRepresentationsCharactersPartII`.

The new AS.1a proposal names the three real Paley–Wiener/multiplier nodes, their independent AS.0 LF/Schwartz/integration and AS.1 induced-family inputs, and the AF real-representation supplier. It imports no ET.1 or final orbital/trace result. ET.1 and AS.6 consume this prefix; AS.2 keeps the measure-dependent μ/normalization theory. Current ids remain unchanged pending maintainer integration. The reader and suggested boundary note describe the same split; the current whole-stage graph is not certified acyclic.

### /5 — Initial Eisenstein and wave-packet inputs

The AS blueprint already has the convergent intertwiner and Eisenstein constructions, `pseudo-eisenstein`, `pseudo-eisenstein-l2`, `pseudo-eisenstein-inner-product`, the initial spectral decomposition, `eisenstein-wave-packet` and `wave-packet-gram`. They distinguish initial convergence from continuation and integrated wave-packet identities from unrestricted pointwise inner products. Those contracts and their proof gaps are retained; no duplicate spectral pipeline is added. Further source closure remains with `BP-AutomorphicSpectralTheory~2`.

### /6 — Nomizu, Kostant and the cochain owner

ALS.4 retains the characteristic-zero lattice/rational-coefficient Nomizu comparison, normalizer equivariance and transported lattice maps. Its cochain prerequisites and Kostant request are corrected from AF.1 to the unique **AF.1a** owner.

The request and both packets' gaps distinguish the required absolute algebraic complex over E from AF.1a's existing relative complex over ℂ. They require actual Levi representations in Kostant's decomposition and no integral/mod-p comparison. The existing GLₙ boundary formula and general-group splitting gap remain. No unread Kostant scan is claimed as a proof source. `BP-ArithmeticLocallySymmetricSpaces~2` retains the full source/signature revision.

### /7 — Strong approximation and Kneser–Tits

AA.4's existing `strong-approximation-sufficiency` imports RG2.4 and retains the absolutely almost-simple, simply-connected, noncompact-S hypotheses. Its request for the local generation theorem remains separate from the global approximation proof. The verified characteristic-zero isotropic local Kneser–Tits input is not enlarged to an arbitrary field/group theorem. Existing AA source gaps and `BP-AdelicAlgebraicGroups~2` carry the remaining decomposition; no second local owner is added.

### /8 — GLₙ Fourier expansion and mirabolic Eisenstein theory

AL.3 already has `gln-fourier-expansion`, `mirabolic-eisenstein-series`, `mirabolic-eisenstein-functional-equation` and the global Rankin–Selberg pole/functional-equation nodes. Their character and residue hypotheses remain. The new converse contracts explicitly say that this **cuspidal** Fourier expansion does not supply opposite-mirabolic sums for an arbitrary admissible Π. G16 retains that additional input. The larger AL source revision remains `BP-AutomorphicLFunctionsAndLocalFactors~2`.

### /9 — Whittaker construction before multiplicity

R16.4 `global-whittaker-expansion` now imports the exact AL.3 `gln-fourier-expansion` node; `strong-multiplicity-one` imports the exact generic AL.3 theorem. The existing ordinary multiplicity-one argument still follows the Whittaker realization. The R16 reader and suggested supplier note are synchronized. R16.5's full converse hypotheses are retained; reduced-rank GL₃ theory is not used as a rank-two shortcut.

### /10 — AF.3 before global integrals

AL's existing AF.3 request supplies cuspidality, rapid decay with derivatives, admitted global genericity and multiplicity inputs; AL owns Fourier expansion, unfolding and analytic estimates. Its AA/SR requests retain quotient measures, restricted products and local representation carriers. No edge is reversed to make integral theory prove its own automorphic input. This boundary is already explicit; `BP-AutomorphicLFunctionsAndLocalFactors~2` retains its remaining proof obligations.

### /11 — GL₂ dictionaries before transfer and Artin automorphy

R17 already requests R16.4 multiplicity/strong multiplicity and R16.6's characteristic-zero dictionaries. The weight-one limit and totally real weight-one extension remain explicit requested outputs, distinct from the k≥2 discrete-series comparison. Their conductor, central-character and local-factor conventions are retained. This round's converse correction does not weaken those requests or claim the Hilbert weight-one supplier exists.

### /12 — Jacquet–Langlands before Hilbert/quaternionic consumers

R18.3 `definite-jl` and R18.4 `cohomological-eigenspaces`/`definite-indefinite-comparison` already import the precise R17.3 global-JL, infinity and rational-model nodes. The R17.3 request preserves exclusion of norm characters, split Hecke normalization and actual coefficient-field models. These existing imports are retained; no stronger full-module or integral/torsion equivalence is asserted.

### /13 — Critical-value and p-adic L-function ownership

AL.5 already has `critical-value-period-interface`; AL.3's normalized period uses the actual rational Whittaker/cohomological structures and normalization. It requests the appropriate supplier algebraicity rather than reproving all GL₂ critical values. The p-adic consumer correction remains assigned to `BP-AutomorphicPadicLFunctions`; its packet is outside these deliverables. The AL revision retains the general-rank/field source and signature gaps.

### /14 — Schwartz–Bruhat and adelic measure ownership

R16.1's existing imports distinguish AL.0's Fourier/Schwartz–Bruhat theory from AA.0's restricted adelic Haar carrier, AA.1's adelic points and AA.2's quotient measure. They are retained. RS-21's upstream owner entry is not edited here: the maintainer should retain this same split when reconciling that entry. Existing upstream roadmaps are not re-planned.

### /15 — Fixed exponents and Scholze's comparison

The affected CC.8 decomposition and TC.2 are outside the allowed files. Retain the handoffs to `BP-CompletedCohomologyPartII--CC.8` and `BP-TorsionCohomologyInfrastructure`: separate the fixed-exponent coefficient convention from the geometric perfectoid comparison and its almost-𝒪_C statement. Scholze IV.2.1 is not treated as an unrestricted completed-cohomology comparison before geometry. No base decomposition is changed.

### /16 — Generic completed adapters and geometric consumers

Retain `BP-CompletedCohomologyAndLocalGlobalCompatibility` and `BP-CompletedCohomologyPartII--CC.8`. CC.8 supplies the generic adapter; R31 supplies the actual geometric local–global setting and comparison. This issue does not write either packet or reverse that ownership.

### /17 — General compact-group Banach representations

Retain `BP-CompletedCohomologyPartII--CC.0` and `BP-PadicLocalLanglandsForGL2Qp`. The general compact-group Banach/Schikhof duality and compact-open independence belong beside the foundational completed-group-algebra theory, with the appropriate NE input. They must not be planned only for GL₂. No unrelated packet is created here.

### /18 — Finite Hecke factors versus patched towers

IHG.2 already has `finite-hecke-local-factors`: T must be a **finite commutative algebra over a complete noetherian local coefficient ring**. Its localized complexes use the resulting central idempotents. These producer hypotheses are retained.

The CC.8/R31 consumers still belong to `BP-CompletedCohomologyPartII--CC.8` and `BP-CompletedCohomologyAndLocalGlobalCompatibility`; `BP-IntegralHeckeAndGaloisDeterminants~2` retains the producer revision. They must verify the compatible finite-level topology before using GN Definition 2.1.11/Lemma 2.1.14. GN Proposition 3.4.16 is a patched statement, not a theorem for arbitrary towers; the CC.4 gap remains. No such stronger claim is added.

### /19 — Quadratic Siegel–Weil inputs to Waldspurger

The MP.6 `quadratic-quaternionic-norm-instances`, `toric-theta-pairing-interface` and `global-see-saw-and-projection` already supply the intended GZ.5 `coherent-quaternionic-specialization`. They distinguish binary norm and ternary trace-zero data, anisotropic ordinary integrals and split first-/second-term identities, with Haar and splitting factors. The GZ period theorem remains the consumer, never an MP proof input. These corrected contracts are retained. Original constants, source/signature closure and divergent-case regularization remain the MP/GZ revision obligations already recorded in their packets.

### /20 — Jacobi owner and round-2 reader corrections

The QSeries reader now states that MP.6's **four adelic integral-index nodes exist**, while explaining that they do not yet supply the classical contract. Its MP.6 request includes Fourier–Jacobi coefficients and the supplier-state paragraph. Both QM.1 `remaining` copies and the structural proposal match the corrected packet. The four classical growth/cusp definitions already impose their conditions for every permitted multiplier/character and are preserved. The existing half-lattice comparison and odd-theta Lean statements remain.

MP.0 now records the exact missing classical outputs: discrete `J_n(Γ)`, matrix-index slash, typus/cusp Fourier support, half-integral scalar index, elliptic-function theta decomposition and Skoruppa Theorem 5 with dual finite Weil module and finite Γ-image. The unitary contract is retained separately for **AutomorphicCongruences:L2s**; no L2 edge is added. QM's eight MP.6 stage prerequisites are retained until these exact outputs exist. MP.8 remains a genus-two/cover/similitude consumer.

All four MP.7 whole-QM.2 prerequisites are replaced by existing I/J carrier nodes or AS.0 `dit-112` for Whittaker M/W. Three precise requests retain complex-order uniform differentiated bounds and exceptional-parameter continuation. Seven AS nodes now use exact I/J, Kloosterman or raw Laplacian suppliers; AS.0 `dit-113` and `gz-217` retain the QM.2 K-function request. The raw Laplacian is at QM.3, with the GZ sign conversion explicit. The I/J/Whittaker carrier closures reach no QM.1 node. Remaining theta-nonvanishing, K-function and coarse stage-boundary cycles are stated, not declared solved.

The assigned continuations remain `BP-AutomorphicCongruences--L0`, `BP-MetaplecticAutomorphicForms--MP.0~2`, `BP-MetaplecticAutomorphicForms--MP.8~2` and `BP-QSeriesPartitionsAndMockModularForms~2`. This narrow ownership repair leaves the broader failed QSeries blueprint review intact.

### /21 — Cover representation categories

MP.3's existing supplier boundaries retain SR.0's category, SR.2's induction/Jacquet conventions, SR.3's admissibility and AF's real theory. The finite-cover adaptations and actual source range of Howe duality remain MP's responsibility; they are not inferred from linear-group theorems or a universal characteristic-two claim. The MP revision retains its source/carrier gaps. No second generic representation category is introduced.

### /22 — Quadratic invariants

MP.2 already imports the immutable upstream `QuadraticFormInvariants` 6c supplier. Its Weil-index comparisons preserve the dyadic range and separate real/complex cases. The upstream layer is neither renamed nor duplicated. `BP-MetaplecticAutomorphicForms--MP.0~2` retains the detailed source/signature revision.

### /23 — Automorphic growth before theta kernels

MP.5 already imports AA.3's heights/reduction and AF.3's automorphic rapid-decay inputs; theta-specific kernel estimates remain in MP.5. This corrected direction is preserved for MP.6/7 consumers. The MP revision retains convergence and analytic carrier closure; no theta-specific estimate is credited to AA or AF merely from the generic growth input.

### /24 — Ordinary versus weighted orbital integrals

AS.6 `weighted-orbital-integral` imports ET.1's ordinary quotient-centralizer integral and retains its nonconstant weight, centralizer/discriminant and singular/limiting requirements. AS's general Euler–Poincaré construction also remains an ET.1 consumer. Together with /4, the real Paley–Wiener prefix must precede ET.1 while these final AS.6 constructions follow it. A whole-AS.6 import into ET.1 is expressly rejected by the proposal. `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.0` and the AS revision carry the consumer integration.

### /25 — Wigner and Vogan–Zuckerman

AF.4 already has `wigner-lemma`, `vogan-zuckerman` and its tempered cohomology-range contracts. They retain infinitesimal/central-character compatibility, the unitary classification range and the separate Hermitian statement. This round does not promote their unread source proofs or the broader failed AF blueprint review; `BP-AutomorphicFormsOnReductiveGroups~2` retains those obligations.

### /26 — Hyperspecial spherical lines before Flath

AF.2 already has `spherical-dimension-one`, importing SR.4 and AA.1's reductive integral model, and uses it before Flath factorization. The dim≤1 assertion stays at hyperspecial spherical places. It is not extended to every compact open, nor replaced by the narrower unitary tensor theorem. The existing producer/request and AF revision remain.

### /27 — Integral boundary Satake conventions

ALS.4 already imports SR.2 and SR.4 for its boundary parabolic Hecke comparison, with RG2.4's Iwasawa input through the supplier. Its integral transform remains **unnormalized**; the modulus half-character is recorded separately. The characteristic-zero Kostant correction in /6 introduces no integral square root of q or complex-admissibility assumption. `BP-ArithmeticLocallySymmetricSpaces~2` retains the full boundary revision.

### /28 — Neat levels before arithmetic quotients

AA.4 already plans neat elements, representation independence, stability, neat rational intersections, torsion-freeness and normal neat-level existence. Its `neat-level` convention uses **all rational intersections**, not every element of a p-adic compact open. The earlier `AA.4:neat-levels` proposal exports to ALS.0, D5 and V0. Effective-action and central-unit caveats remain. Borel's original proof closure remains with the AA revision; Shimura-specific geometry is not moved into AA.

### /29 — One algebraic cochain prefix

AF.1a already owns compatible pairs/modules, relative cochains and cohomological functoriality. Its proposal exports them to AF.1, AS.5 and BorelRegulators; the late analytic globalization is not made a prerequisite of this algebraic prefix. /6 corrects the actual ALS requests to this owner and records the precise absolute/Kostant extension in AF itself. RS-04's atlas owner reconciliation remains a maintainer action, not an edit of upstream/base data.

### /30 — Local weights before rationality

AF.4 already requests ALS.1, ALS.3, ALS.5 and AS.5 for its torsion eigenclasses and rationality suffix. This round adds an explicit **AF.4:local-weights** proposal with algebraic weights, coefficient lattices, cohomological modules, Wigner and Vogan–Zuckerman. Those fine-node inputs precede comparison and import no ALS/AS.5 theorem. Rationality remains after actual Betti/Hecke comparison, in its GLₙ and explicitly conditional general-group scope.

The proposal coordinates with ALS's existing comparison/application split; the old blanket claim that all added stage edges were acyclic is replaced by the actual ALS.5↔AF.4 boundary caveat. AS.5's current fine-node comparison inputs do not import `clozel-rationality`. No later comparison proof may assume that conclusion. The reader and suggested notes agree; maintainer integration and the AF revision remain.

### /31 — Generic algebraic forms and quaternionic specialization

R18.3 `definite-specialisation` already imports AF.5 `algebraic-modular-forms` and `algebraic-modular-forms-structure`; its additional AF request specifies the adelic central quotient needed for positive-rank units. Hecke and level maps remain generic AF outputs. R18 keeps class-set/effective-stabilizer calculations, integral pairings, Taylor–Wiles freeness, dyadic tests and Jacquet–Langlands. Finite double-coset sets are not treated as a freeness proof. These existing contracts and the assigned AF revision are retained; no generic algebraic-form space is duplicated.

## Source and baseline boundaries

New converse contracts use [Cogdell's public author survey](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §§2–3, pp.5–9, Theorems 3.1–3.3 and their outlines. Read 7 October 2026; SHA-256 `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe`. The author PDF's publication version/date is not established here. Original JPSS/Cogdell–Piatetski-Shapiro proofs and the highly ramified variant remain acquisition/decomposition gaps.

For /20, [Skoruppa, arXiv:0707.0718v1](https://arxiv.org/pdf/0707.0718v1), §4 pp.10–13, including Theorem 5 and its proof, was checked again against the existing request. The file hash agrees with the packet, `a4cc378e16a7dfb361e3914bbaa5e02b10567ced8802267c09fcfa4b368407a0`. This does not claim a fresh full-paper extraction or a published-version collation. The previously confirmed E210–E212 and their version scope are unchanged.

[Duke–İmamoğlu–Tóth 2011](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf), Appendix A, printed p.977, was checked for the M/W integral, ODE and fixed-parameter asymptotic conventions. SHA-256 `8f2b8ed3518fe69f08a72ef0ed3311d30523042335d4bd0e1ffd82d84459a010`. It is not credited with the requested compact-parameter differentiated uniform bounds. No original Kostant proof is claimed read from the textless scan.

Reviewed library-audit entries were consulted before changing ownership. The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The new converse nodes add no baseline declaration. Pinned `Mathlib/Algebra/Lie/Cochain.lean` was read: `LieModule.Cohomology.oneCochain`, `twoCochain`, `d₁₂`, `d₂₃` and `twoCocycle` already provide low-degree absolute cochains; the AF request concerns the full compatible complex and Kostant theorem. No existing low-degree theory is re-planned.

Two inherited source-version categories failed the errata checker: AS's `lecture-notes` is normalized to `author copy`, and AA's publisher correction is normalized to `published`. Their URLs, hashes and inherited reading dates are unchanged. This is metadata normalization, not a new source audit.

## Validation

`python3 scripts/check_blueprint.py <packet>` passes with **0 errors and 0 warnings for all thirteen issue packets**. `scripts/check_errata.py`'s `check()` also passes on each packet's source issues/version ledger, wrapped as `errata-v1`. JSON parses and `git diff --check` pass.

The exact-node closure audit of both converse nodes reaches 197 packet nodes and no GL₂ consumer node. Stage frontiers and original proof gaps remain unresolved; this audit is not a proof of whole-atlas stage acyclicity. The I, J and AS Whittaker carrier nodes each have only their own exact node plus baseline inputs in their closure and reach no QM.1 node. The remaining coarse cycles are recorded in the packets/readers.

All thirteen suggested files were attempted **sequentially** with `lean-check`, checking memory before each call. Nine exit successfully; their warnings are only `sorry` warnings (MP.8 additionally prints existing informational `#check` results):

| Suggested file | `sorry` warnings |
| --- | ---: |
| GL2AutomorphicRepresentationsAndTransfer--R17.3 | 118 |
| AutomorphicFormsOnReductiveGroups | 38 |
| AutomorphicLFunctionsAndLocalFactors | 183 |
| GL2AutomorphicRepresentationsAndTransfer--R16.1 | 140 |
| AdelicAlgebraicGroups | 398 |
| HilbertModularVarietiesAndShimuraCurves--R18.2 | 33 |
| IntegralHeckeAndGaloisDeterminants | 507 |
| MetaplecticAutomorphicForms--MP.8 | 316 |
| QSeriesPartitionsAndMockModularForms | 1469 |

Four attempts exit 1 **before elaboration**, because the shared build lacks the following imported object files:

| Suggested file | First unavailable module |
| --- | --- |
| AutomorphicSpectralTheory | `TauCeti.Analysis.Semigroups.Group.Stone.Unbounded` |
| ArithmeticLocallySymmetricSpaces | `TauCeti.NumberTheory.HeckeRing.Associativity` |
| GrossZagierAndArithmeticHeights--GZ.0 | `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight` |
| MetaplecticAutomorphicForms--MP.0 | `TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension` |

Those four files are **not certified to elaborate**. No build, cache download, Lake update or language server was started. Elaborating a suggested signature proves neither the mathematical plan nor its source/signature completeness. Existing broader `needs_changes` reviews, explicit source gaps, supplier requests and `unchecked` implementation statuses remain for independent review and the named blueprint revisions.
