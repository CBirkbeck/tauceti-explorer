# BP-ArithmeticQuantumTopology — complete target-level pass

Worker: Codex, session `codex-gTkNML`, issue #1024, 6 October 2026.

This continues the existing packet and preserves all 54 previous node identifiers. The accepted `RS-10` restructuring (`independent-review-REV-RS-10~2`, 29 September 2026) keeps QT.0–QT.7; the plan follows its owner split. This is a completed target-level planning pass, ready for independent review, rather than a checkpoint. Every node remains `implementationStatus: unchecked`.

The four deliverables are the packet, the definitive reader, the suggested file and this handoff. The definitive mathematical specification is [the reader](../readmes/ArithmeticQuantumTopology.md), with exact source excerpts and dependency records in [the packet](../packets/ArithmeticQuantumTopology.json). The [suggested file](../suggested/ArithmeticQuantumTopology.lean) contains concrete pinned-library prototypes and an exact name inventory identifying omitted signatures.

## Coverage and counts

106 nodes: 24 definitions, 26 constructions, 27 theorems, 4 lemmas, 24 comparisons and 1 application. The checker counts 206 definition/construction API items and 157 definition/construction tests. Including the API and tests retained on comparison nodes, the complete inventories contain 221 API items and 167 tests. There are 36 planets, 24 cited baseline declarations, 8 recorded gaps and 18 open supplier contracts. Each definition and construction has at least three tests. The reader contains about 38,500 words.

All eight stages are **planned**; zero are closed. No stage is unread. Each coverage record includes its transitive open gaps and supplier contracts. A future stage can become closed only when those obligations are discharged. The general mathematical conjectures remain explicitly conjectural; completion of this planning job is not a proof of them.

| Stage | Status | Main route and remaining work |
| --- | --- | --- |
| QT.0 | planned | Framed geometric carriers and ordinary surgery/Kirby are imports; admissible presentation existence, band-slides and Hoste calculus are specified. G1 remains. |
| QT.1 | planned | Ribbon structures refine the pinned braided/rigid classes; rank-one and general-type quantum PBW, completed integral forms, universal bottom-tangle invariants and cores are specified. G2 and geometric imports remain. |
| QT.2 | planned | Exact color, trace-dual, integral-lattice and even-center conventions, link divisibility, colored Jones and the unified Kashaev element are specified. G2/G3 and imported links/completions remain. |
| QT.3 | planned | The twist theorem and admissible Hoste route define the integral-homology-sphere invariant, with surgery sign and no extra divisor. G1/G2/G3 remain through its prerequisites. |
| QT.4 | planned | Finite WRT with distinct Gauss factors, root-lift comparison, Taylor/Ohtsuki determination and the qualified general Lie-type theorem are specified. G2/G3 and Habiro/Lie imports remain. |
| QT.5 | planned | Ordered cusped geometry, full cut-cover flattenings, lifted five-term and transfer relations, extended classes and regulator comparisons are specified. G4/G5 and geometry/Polylogarithms/K3 contracts remain. |
| QT.6 | planned | Formal GSW invariance, root-refined DG2 arithmetic and the integral Nahm/module bridge; Faddeev and the admissible distribution-valued AK invariant; selected knot convergence/volume targets. G4–G7 and their exact supplier contracts remain. |
| QT.7 | planned | Precise scalar, lifted and matrix conjectures, concrete descendants, corrected half-row coefficient ring, BD proved family and per-output ledger. G3/G6/G7/G8 and the QM.5 matrix/branch extension remain. |

## Validation and the suggested file

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json` reports **0 errors and 0 warnings**. The final suggested file was elaborated with `lean-check` against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with exit status zero and only admitted-proof warnings. Memory availability exceeded 20 GB before each check; one check ran at a time. No language server, library build, dependency update or cache fetch was used.

The packet's Tau Ceti source baseline is `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations were read at that commit. The available shared Tau Ceti build did not match it, so the suggested file imports **individual Mathlib modules only**; this validation does not assert elaboration against imported Tau Ceti modules. The reviewed `data/library-coverage.json` has no QT entry. Two complete upstream readers, GeometricTopology and RepresentationTheory/LieHighestWeight, were read, as were the supplier statements listed in `reviewAudit`.

Concrete prototypes include linking-matrix admissibility/cokernels/slide formulas, the ribbon twist and trace over pinned monoidal classes, Laurent/PBW-color scalar formulas and the color lattice, local shape and logarithmic charts, linear NZ data and Hessian qualifications, actual Bochner contour integrals with integrability hypotheses, charged AK functions and a hyperplane-kernel action on pinned Schwartz test functions, an actual tempered-distribution constructor with explicit continuity/integrability hypotheses, level phases, finite Kashaev/descendant computations, pole-qualified rational and ordered matrix cocycles, and the mixed-status ledger. Final scalar additions cover the factorial-square Kashaev kernel, cyclic dilogarithm and finite root-NZ weight/average.

The full geometric link/manifold, quantum-completion, cut-cover quotient, Bloch, filtered-Gaussian, distribution-composition and generalized asymptotic signatures **are omitted where their exact carrier or condition cannot yet be stated**. Their precise names, mathematical specifications, API and example requirements are all in the file's final inventory, with the gap/import that must supply the missing type or condition. Inventory comments are not elaborated declarations. A local chart is not the full geometric quotient, a matrix is not a triangulation, and a kernel with continuity supplied is not the AK convergence theorem. This follows PROTOCOL section 13's explicit omission rule and never replaces a missing condition with an unconstrained proposition. The compile result covers the concrete interfaces actually stated, not the omitted inventory entries. Full signature coverage is a named follow-up obligation after the suppliers expose their carriers.

Additional audits preserved all original identifiers; checked unchecked status, coverage, API/test/name inventories, planet limits, control characters and absence of private paths or Lean code in the packet/reader; collated every local primary-source excerpt literally; and walked **523 reachable declaration nodes across supplier packets, with no cycle**. The RT1990 excerpts were read in the browser rather than asserted locally hashed. The branch changes only the four authorized deliverables.

## Exact gaps and supplier boundaries

The following eight gaps are substantive proof/import obligations, not instructions to obtain papers that were left unread:

- **ArithmeticQuantumTopology/G1 — Geometric link/surgery contracts:** The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.

- **ArithmeticQuantumTopology/G2 — Complete quantum algebra and integral core:** Mathlib supplies ordinary Hopf/monoidal/rigid structures but no topological ribbon quantum algebra, its completed tensor powers, ribbon twist, quantum PBW basis, tilting quotient or integral clasp/core. The source-decomposed targets and APIs specify these objects; implementing them needs the quantum-specific completed tensor/continuity constructions over the cited pinned base-module completions, and the requested classical highest-weight interfaces.

- **ArithmeticQuantumTopology/G3 — Jones/root convention comparison:** Prove the exact variable/mirror convention linking geometric Jones(t), Habiro J_K(V₁)/[2], MM’s positive-q reduced polynomial and GZ’s negative-q definition. At roots reduce before specializing, retain fourth-root lifts and distinguish strong Kirby admissibility from semisimple/modular alcove hypotheses.

- **ArithmeticQuantumTopology/G4 — Cusped ordered geometry and trace-field descent:** Supplier closed Mostow material alone does not provide complete cusped ideal face-pairings, EP/refinement connectivity, strong ordered hybrid flattenings or geometric NZ local rigidity. A general claim that the signed Bloch class descends to the invariant trace field needs a separate algebraicity/boundary argument; only the explicitly checked figure-eight field example is used without it.

- **ArithmeticQuantumTopology/G5 — Integral and extended Bloch comparisons:** Neumann’s factor-two ordinary boundary, exterior kernel, antisymmetric tensor and published CGZ convention must be compared with the named supplier maps. The full extended group needs its actual cut cover, lifted component, transfer relations and strong normal-path conditions. A Suslin lift retains torsion ambiguity; no canonical lift follows from a B̂(ℂ) class.

- **ArithmeticQuantumTopology/G6 — NZ-to-Habiro normalization:** HB.9 applies to symmetric integral Nahm matrices, not every rational NZ matrix. Verify B unimodular, parity compatibility, isolated nondegenerate shapes, arithmetic R/Δ and the correct Bloch index, then compare GSW unit formal series with the HB.8 collection’s classical exponential, phase and one-loop factor. General module membership remains a comparison obligation. Root-refined DG2 arithmetic must use the filtered diagram definition and actual Kummer translations; reconcile E17–E21 and match the τ factor with the HB.8 normalization before claiming the rootwise Habiro collection comparison.

- **ArithmeticQuantumTopology/G7 — Analytic contour and operator closure:** Prove the prescribed Faddeev strip integral/continuation and large-argument estimates; import the self-adjoint Schrödinger/functional-calculus interface. For AK’s selected n=2,3 contours supply explicit uniform tails, deformation and O(ℏ) estimates: its short steepest-descent argument is not yet a Lean proof. The BD theorem needs its actual reciprocal Pochhammer errors and selected stationary-phase arithmeticity input, not the formal Gaussian theorem alone. For the general AK theorem establish the nuclear-kernel and microlocal contraction interface on pinned TemperedDistribution: wavefront transversality, product and extension to the enlarged Schwartz space before pushforward. Supply the geometric H₂ exclusion and exponential decay estimate rather than treating every distribution product as defined. A general AK/NZ all-orders analytic comparison needs the matched saddle, branch, action and one-loop factor plus uniform remainder estimates; it is not asserted proved.

- **ArithmeticQuantumTopology/G8 — Conjectural knot refinements and normalization discrepancies:** General GQMC, lifts, quadratic/coefficient relations, matrix RQMC, invertibility and analytic cocycle extensions remain conjectural. Resolve the scalar-versus-matrix weight sign and the large-order coefficient phase in the fixed GZ source before a normalized matrix theorem. Conditional algebraic cocycle composition is proved independently of these conjectures.

The eighteen contracts below spell out the required mathematics and route absent upstream material to Part II. Fine supplier node IDs are used directly wherever their existing statement suffices. The owning packets and upstream roadmaps were not edited by this job.

- **tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here:** Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.

- **tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery:** Import oriented surgery with slope fμ+λ, H₁≅coker linking matrix, IHS iff det=±1, and ordinary Kirby/Fenn–Rourke presentation calculus. Supply stable diagonalization of the integral unimodular form and its realization by ordinary moves used in admissible-presentation existence. QT proves only the admissible band-slide/Hoste refinements.

- **tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group:** Oriented manifold gluing, connected sum and orientation reversal with the surgery split-union comparison; the topological operation is imported before proving quantum multiplicativity. Supply the finite ordered oriented pseudo-3-manifold CW face-pairing carrier, punctured (co)homology, normal curves/relative chains and their Mayer–Vietoris gluing used in AK’s H₂ admissibility proof. These are GeometricTopology, Part II inputs; QT adds the charged positive angles, levels and analytic invariant.

- **tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume:** Extend the closed geometric/Mostow material to ideal ordered face-pairing triangulations of complete finite-volume cusped hyperbolic 3-manifolds: developing maps, peripheral completeness, Mostow–Prasad rigidity, ordered hybrid refinements, Epstein–Penner canonical cell decompositions, connectivity of their regular refinements (allowing flat nondegenerate tetrahedra), and geometric local rigidity/nonzero NZ Hessian. Keep this distinct from a bare matrix gluing solution or the closed-only Mostow theorem.

- **Polylogarithms:P.2:** Supply the oriented ideal-tetrahedron identity Vol(z)=D(z), its ordering/sign convention and comparison with the weight-two regulator on the field Bloch class. QT imports that identity and assembles the flattened signed sum; it does not reprove tetrahedron volume.

- **K3BlochGroups:V.3:** Compare Neumann’s ker(2z∧(1−z)) convention with the supplier exterior kernel, antisymmetric-tensor Bloch group and published CGZ convention, retaining integral two-torsion. Supply the exact map for the verified geometric Σ ε[z] over a number field; do not identify all conventions integrally.

- **K3BlochGroups:V.4:** Use the precise Suslin exact sequence to compare a verified ordinary geometric Bloch class with K₃^ind; identify the torsion ambiguity. The extended group H₃(PSL₂(ℂ)^δ) and complex regulator are QT-owned and do not follow merely from ordinary Suslin.

- **K3BlochGroups:V.6:** Import the Suslin lift fibre and torsion bookkeeping for a field-valued geometric Bloch class. A canonical K₃ lift is not inferred from numerical shapes or a unique B̂(ℂ) manifold class.

- **HabiroNahmSeries:HB.4:** Import the filtered formal Gaussian bracket and its finiteness/valuation hypotheses. Extend the analytic toolkit, where absent, with source-level finite Pochhammer reciprocity (BD §2), prescribed branches and holomorphic error uniform on the domains used in BD §3, plus uniform steepest-descent/tail/deformation estimates for AK’s selected contours. No analytic remainder follows from the formal bracket.

- **HabiroNahmSeries:HB.8:** Use the corrected reviewed refined Gaussian collection and normalization, including its classical logarithmic term, shift convention and phase. Supply the precise comparison needed to strip the NZ classical exponential/one-loop factors in the qualified integral-Nahm bridge.

- **HabiroNumberFields:HB.6:** Supply the early Frobenius coefficient ring R with its nondegeneracy/unit/bad-prime conditions in the integral-NZ example, using the HB.6 stage’s exact arithmetic scope.

- **HabiroNumberFields:HB.7:** Supply the K₃-indexed twisted Habiro module over R[δ⁻¹/²], roots of order prime to Δ, and its index in the checked Bloch convention. Do not substitute the untwisted ordinary ring.

- **QSeriesPartitionsAndMockModularForms:QM.0:** Supply Bernoulli/Pochhammer and convergent infinite-product identities with their convergence/branch domains for the formal vertex series, Faddeev product and finite reciprocal knot sums.

- **QSeriesPartitionsAndMockModularForms:QM.5:** Extend the scalar period-cocycle interface to matrix-valued multiplicative cocycles on common pole-free domains, with branch-aware weights and smooth/holomorphic extension criteria. QT owns only its knot matrices and comparisons. Generic formal/noncommutative q-dilogarithm pentagon remains HC.1; no dependency from QM.5 back to QT.7 is needed.

- **AutomorphicSpectralTheory:AS.0:** Supply the general unbounded self-adjoint spectral calculus, Schrödinger position/momentum on L²(ℝ), their common Schwartz core and the self-adjoint closure of p+q, including the extension from core equalities to bounded unitary functional-calculus operators. QT proves the Faddeev operator identity on that imported interface. Also supply the nuclear Schwartz-kernel theorem for continuous maps S(ℝⁿ)→S′(ℝᵐ), partial Fourier/polarization transforms and their action on kernels. Generic wavefront pullback/product and the enlarged-test-space pushforward extension are an additional microlocal distribution input, proposed as PDE, Part II in upstreamNotes; AS.0 is not claimed to contain them already.

- **Polylogarithms:P.1:** Import the actual dilogarithm branch/continuation, Bloch–Wigner function and nonpositive polylogarithm rational functions needed by the Rogers and formal vertex formulas; exact branch conventions are part of the interface.

- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ:** Import the classical enveloping algebra/PBW, highest-weight modules and rank-one calculations; root-space/root-datum inputs are the upstream layers 1–2. QT constructs the quantized Drinfeld–Jimbo algebra, its integral form and quantum PBW/core, rather than re-plan the classical theory.

- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition:** Import the fixed simple-root datum, root-space decomposition and coroot sl₂ triples, with upstream RootSystems providing root/weight lattices and Weyl action. QT uses these as the Cartan/root input for its quantized presentation, not a second root-system development.

The general microlocal wavefront/pullback/product/enlarged-Schwartz pushforward input is additionally recorded in `upstreamNotes` as **PDE, Part II**. Pinned Schwartz spaces, tempered distributions, Dirac and Fourier are reused; AS.0's separate nuclear-kernel/polarization contract does not falsely claim that its current statement already exports wavefront calculus. Ordinary Kirby/surgery and framed geometric carriers extend GeometricTopology in its own direction.

## Assigned confirmed findings

All seventeen assigned findings were read at their original claim/fix loci. The mappings below state the remedy in these deliverables; they do not edit the other owners.

| Finding | Handling |
| --- | --- |
| RT-AREA-topology/1 | QT.0 imports GeometricTopology layers 1/4/5. Ordinary framed geometric presentations, surgery and Kirby are explicit contracts; single-knot Gauss codes and unframed Markov moves are not represented as a full framed-link theorem. |
| RT-AREA-topology/2 | Admissible ±1-framed algebraically split presentations, their existence, band-slide theorem and Hoste calculus are named. QT.3 chooses Habiro's twisting/refined-calculus proof; ordinary Kirby moves are not asserted to stay admissible. |
| RT-AREA-topology/3 | Ribbon, h-adic rank-one quantum group, even integral form/completion, bottom-tangle invariant, even center, P-color lattice/completion, trace pairing, twist elements and integral link theorem are explicit. Pinned braided/rigid/Hopf infrastructure is reused. Bottom and center sources are catalogued. |
| RT-AREA-topology/4 | QT.1 owns general Drinfeld–Jimbo/PBW/integral-core constructions using LieHighestWeight/RootSystems imports; QT.4 has exact root-lift, parity, order and nonzero-Gauss qualifications from Habiro–Lê. |
| RT-AREA-topology/5 | Fundamental colored-Jones comparison imports GeometricTopology's Jones carrier. Reduced/unreduced and dimension conventions are fixed; the exact supplier mirror/variable substitution is G3, not guessed. |
| RT-AREA-topology/6 | QT.5 is independent of QT.0 and V.5. It imports K3 V.3/V.4/V.6, Polylogarithms P.1/P.2 and the required geometric complement/hyperbolic layers. |
| RT-AREA-topology/7 | P.2 alone owns ideal-tetrahedron volume = Bloch–Wigner. QT.5 imports it and assembles the signed manifold sum. |
| RT-AREA-topology/8 | Finite-volume complete cusped geometry, oriented ideal triangulations, peripheral completeness and cusped Chern–Simons/volume normalization are exact geometric contracts. Positive shape data or arbitrary matrices do not supply them. |
| RT-AREA-topology/9 | The full extended cut-cover group, lifted relations/transfer, strong flattenings, extended Rogers descent and Neumann homology/Cheeger–Chern–Simons theorem are explicit. Ordinary Suslin K₃ and its integral-lift obstruction remain distinguished. |
| RT-AREA-topology/10 | NZ geometric datum, GSW formal invariance, DG/DG2 root-refined series/arithmetic, unimodular/parity NZ–Nahm conversion and qualified HB.8/HB.9/HNF module comparison are named. Root averaging and one-loop normalization are explicit; the figure-eight Bloch index is 2[ζ₆]. |
| RT-AREA-topology/11 | Generic Gaussian/asymptotic tools are imported from HB.4/HB.8. Knot/triangulation invariance belongs to QT.6. No dependency on HB.10 is added that would close a cycle. |
| RT-AREA-topology/12 | Kashaev values, MM comparison for N≥2, the unified Habiro element, exact growth-volume conjecture and BD's proved ten-knot family are explicit. The original R-matrix carrier is an excluded alternative; order one is a separate extension. |
| RT-AREA-topology/13 | QM.5 owns generic scalar quantum modular forms and its strange/WRT examples; QT.7 imports it, requests the matrix/branch Part II extension and owns the knot-specific conjectures/BD cases. |
| RT-AREA-topology/14 | Faddeev's strip/meromorphic definition, functional/inversion/product/asymptotic identities and operator pentagon are explicit. Charged AK kernels, positive leveled shapes, admissibility, partial distributional composition and its level-normalized invariant are named. Formal cyclotomic pentagon stays with HC; AK/NZ analytic comparison is qualified. |
| RT-AREA-topology/15 | General resurgence, Gevrey/Borel/Stokes infrastructure is explicitly outside the scoped targets. No undefined resurgence conjecture is asserted. |
| RT-AREA-topology/16 | A named ArithmeticQuantumTopology Part II covers two-variable colored Jones, MMR/Alexander and Wheeler's relative-Habiro lift, requiring QT.2, geometric Alexander and relative-completion owners. Bouis–Gazda is explicitly outside scope. |
| RT-AREA-ktheory-2/25 | The P.2 tetrahedron-volume theorem and its GeometricTopology metric/volume input are imported once. QT keeps flattenings, triangulations and the Chern–Simons comparison. |

## Sources and correction register

Sixteen fixed arXiv source downloads and the browser-read published RT1990 source support this pass. Nineteen `sourceVersions` also record the collated GZ and DG2 published PDFs. The following full hashes are reproducible download hashes, not claims about a different PDF or edition. Locators and actually-read sections are in `sources`; published-version hashes and scope are in `sourceVersions`.

| Source | Fixed public URL | SHA-256 |
| --- | --- | --- |
| A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres | https://arxiv.org/abs/math/0605314v1 | `79069d6aa22d8c0b439e79db3348184c6c089336c64f804ded6a99162a72c136` |
| Extended Bloch group and the Cheeger-Chern-Simons class | https://arxiv.org/abs/math/0307092v2 | `0553bc88d84bedfeb05a86e28a3c03ea57fb855e5fad1033d28f1eeeca715889` |
| Unified quantum invariants for integral homology spheres associated with simple Lie algebras | https://arxiv.org/abs/1503.03549v2 | `26e864007db4145e1a58374432c5eb52901c02cfe47f36194f60a8b7d1292dfd` |
| Knots, perturbative series and quantum modularity | https://arxiv.org/abs/2111.06645v3 | `e923db265b5ee7a5f97ad132c715b6b3688de56ab68cc225a1e3f46666e199ce` |
| Perturbative invariants of cusped hyperbolic 3-manifolds | https://arxiv.org/abs/2305.14884v2 | `419c23ec08742107393e1240793fc1a3ab9b2a11c42e5a89658442dd249cb22d` |
| The Habiro ring of a number field | https://arxiv.org/abs/2412.04241v2 | `b93170cf809075112bd80fb4e0df299baf96d3dc3eb0c79f37aa60b1a0d8fd66` |
| A TQFT from quantum Teichmüller theory | https://arxiv.org/abs/1109.6295v2 | `c77c8050459fb78d7b82d8f19ffe6fe44b33fafb500c800e221cffdfa4c921a5` |
| Modularity and value distribution of quantum invariants of hyperbolic knots | https://arxiv.org/abs/1905.02045v2 | `12b5aba4519d26f5a97f1e1a1e766e8e912cff1f8b98da3fcdb6461e5664a240` |
| Bottom tangles and universal invariants | https://arxiv.org/abs/math/0505219v2 | `687c7e56ad7fa5a9eb1dff14e9ea17d9c8df3bece26169bc710ab3ca05b9f06b` |
| An integral form of the quantized enveloping algebra of sl2 and its completions | https://arxiv.org/abs/math/0605313v1 | `74867203519e9d2a0c4169c909b0564ddae61c464a9e4d320d6eea45d1aa11e3` |
| Refined Kirby calculus for integral homology spheres | https://arxiv.org/abs/math/0509039v2 | `4d5bd3bfa8b3dd982f09638515dd78c57dddbaaf76f5dfb565ef299ff289d208` |
| The colored Jones polynomials and the simplicial volume of a knot | https://arxiv.org/abs/math/9905075v1 | `f6d950a39802a41555a1bb4985925a6d9350fba4210ae474e69383b784f375e1` |
| Quantum knot invariants and the Habiro ring | https://arxiv.org/abs/2603.01619v1 | `28db73fb6dc465ded7038fa328aaac410e8858adf5f8648eb19abc7cd7ef7dab` |
| Quantum groups at roots of unity and modularity | https://arxiv.org/abs/math/0308281v2 | `05e7638ebefe517a94f3e1ff82624bde45c961f96bec5a912cb6ae64ab8f856f` |
| Ribbon graphs and their invariants derived from quantum groups | https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf | Browser-read; no local hash asserted |
| The quantum content of the gluing equations | https://arxiv.org/abs/1202.6268v2 | `1b55aeb941d883a64c6bc905aad9082ee0264912a311e29ec16591d1c1f9b519` |
| Quantum modularity and complex Chern–Simons theory | https://arxiv.org/abs/1511.05628v1 | `06a7f8d12dcb712cd5a1c6ca46e85f7160f83e2c5983619d1699e782efbf6709` |

Twenty-one `sourceIssues` record printed passages, version scope, correction/reason, effects and correction searches. They await independent verification; the worker supplies no review verdict. Preprint findings do not accuse an unread published text. GZ's correction loci and DG2 pp. 5–16 were collated with their published texts. Important boundaries include distinct Gauss factors, corrected quantum/color indices, the finite-free/abelian category overstatement, matrix/scalar weight and large-order phase discrepancies, AK contour estimates, AK charged-kernel angle indices, DG2's actual Kummer group, its degree-filtered diagram definition and cyclic/parity slips.

A notable arithmetic correction is the GZ half-row Q₂: only **2Q₂** is asserted in the integral ℤ-Habiro ring. Q₂ has coefficient −1/2 at Taylor degree two, so its own scalar coefficient ring is localized at 2. No nonexistent parity theorem is used to conceal this obstruction.

## Where the next work starts

Independent review checks this whole target-level pass, particularly source corrections, exact normalization domains and section-13 omission boundaries. After acceptance, each open stage gets a follow-up using its existing coverage `remaining` list; preserve stable node IDs and the owner split. The highest-impact input work is GeometricTopology's exact link/surgery carrier, the complete quantum PBW/core proof, ordered cusped geometry and integral Bloch conventions, and the generic analytic/distribution machinery. QT.6's follow-up must reconcile the root-refined DG2/HB.8 prefactors before making a Habiro module assertion about the geometric series, and prove uniform tails/steepest-contour estimates before any analytic limit or error theorem. QT.7 must retain the distinction between BD's proved positive-q family and general matrix conjectures.

The named two-variable Part II follows the relative-Habiro/Alexander boundary already recorded in `restructure`. Its inputs and the Bouis–Gazda exclusion survive scratch cleanup in these deliverables. No further job is claimed by this session.
