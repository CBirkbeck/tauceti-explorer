# Arithmetic quantum topology, Habiro invariants and regulators

This roadmap constructs integral quantum invariants of links and integral homology spheres, then relates selected hyperbolic knot invariants to Bloch classes, perturbative series and quantum modular transformations. Its central objects are the even integral quantum group, Habiro’s cyclotomic color lattice, the unified invariant, geometric extended Bloch classes and triangulation-derived formal state integrals. Analytic knot integrals and quantum modular conjectures have their own hypotheses and normalization data.

The accepted RS-10 restructuring keeps QT.0–QT.7. This is the definitive reader for the complete **target-level planning pass**: all eight stages are planned, with eight explicit gaps and eighteen open supplier contracts. Every declaration remains implementation-unchecked. A source theorem, a concrete computation and a conjecture are mathematical statuses, not claims that a library implementation exists. The suggested file elaborates concrete interfaces against Mathlib; the absent carriers and conditions are identified there by name.

The packet retains all 54 identifiers of the preceding pass and contains 106 nodes, 206 definition/construction API items, 158 definition/construction unit tests and 36 planets. The older Kashaev identifier beginning QT.6 is retained for compatibility but its parent is QT.2, where the colored-Jones evaluation is constructed. Stage order is dependency order where appropriate: the cusped geometry of QT.5 starts independently of closed surgery in QT.0–QT.4.

## Conventions and ownership

For rank one, q=exp(h), v=exp(h/2), K=exp(hH/2), e=(v−v⁻¹)E, and F̃⁽ⁿ⁾=FⁿKⁿ/[n]q!. The integral ground ring is ℤ[q±1]; the ambient representation algebra uses ℚ(v), with q=v². Positive framing acts by the inverse ribbon element r⁻¹. Vₙ has dimension n+1, whereas the reduced colored-Jones dimension index N uses Vₙ₋₁. The unreduced unknot value is [n+1]; division defining a reduced polynomial takes place before root evaluation. General Lie type retains the root lattice, symmetrizers, root lift and parity grading rather than borrowing rank-one formulas without their hypotheses.

The scalar Habiro ring is imported from HabiroCyclotomicCompletions: the inverse limit of ℤ[q] modulo the cyclotomic factorial ideals. Neither the completion of the integral quantum group nor the color-lattice completion is silently identified with that scalar ring. The former is an image of an inverse limit in the ambient h-adic quantum algebra. Quantum-specific completed tensor multiplication, PBW forms and continuity are QT.1 work over the pinned base-module completions. A general inverse-limit map is not asserted injective.

GeometricTopology owns framed links, their ordinary diagram and braid relations, linking matrices, surgery, Kirby calculus, manifold carriers and hyperbolic geometry. Tau Ceti’s based Gauss codes and writhe are single-knot interfaces; its unframed Markov equivalence does not prove a framed link theorem. QT.0 imports these carriers and adds the refined admissible calculus needed by the integral invariant. LieHighestWeight and its RootSystems inputs own the classical Lie, root, weight and PBW theory. QT.1 owns the quantum presentations and integral ribbon/core structures.

K3BlochGroups owns ordinary pre-Bloch and Bloch groups, their boundary conventions, Suslin fibres and K₃ interfaces. Polylogarithms owns dilogarithm branches, Bloch–Wigner and regulator machinery. QT.5 supplies geometric flattenings, the full extended group needed by these manifolds, and the normalization comparisons. Neumann’s regulator is iVol−CS in ℂ/π²ℤ; GZ’s complex volume is iVol+CS, so the comparison is −complex conjugation with the period and lift recorded. A trace-field class needs verified algebraicity and boundary cancellation; a diagram alone does not supply it.

HabiroNahmSeries owns formal Gaussian contraction and the integral Nahm/module theorem. HabiroNumberFields supplies the early Frobenius coefficient ring and the twisted K₃-indexed module. The NZ bridge requires a symmetric **integral** Nahm matrix, parity compatibility, nondegenerate shapes and the exact arithmetic coefficient ring; invertibility of B alone gives a rational matrix and is insufficient. QT.6 contributes the geometric series and the comparison of its classical, one-loop and phase factors. Generic operator functional calculus comes from AutomorphicSpectralTheory; the analytic Faddeev pentagon differs from the formal noncommutative pentagon already owned by the cyclotomic-completion roadmap.

QSeriesPartitionsAndMockModularForms owns generic scalar quantum modular and cocycle theory. Its matrix multiplicative and branch-aware extension is requested as Part II. QT.7 owns the selected knot rows, matrices and comparisons. Its algebraic cocycle identity is conditional on invertibility and the automorphy-factor identity; real analyticity is a separate conjecture. A general resurgence or Borel-summation framework is outside this roadmap. Wheeler’s two-variable knot invariant and its MMR/Alexander and relative-Habiro comparison are routed to ArithmeticQuantumTopology, Part II, using HabiroRings HR.1/HR.5 for the generic relative-completion interfaces.

## Baseline and sources

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library-coverage catalogue has no QT row. The twenty-four cited declarations were checked by reading their actual statements at these pins. Braided and rigid monoidal categories and ordinary Hopf algebras exist; the needed ribbon twist and topological quantum algebra do not follow merely from those class names. Mathlib’s Bochner integral is total, so an integrability theorem is required before it represents a convergent contour integral. Its rectangle Cauchy–Goursat theorem supplies finite contour deformation; unbounded tails require estimates.

Two complete upstream readers, GeometricTopology and RepresentationTheory/LieHighestWeight, determine the level of definitions, interfaces and boundaries used here. Each item below records its direct prerequisites, proof route, source locator, API, tests and acceptance conditions. The packet and reader give own-word mathematical specifications, numbered source results and page locators. Source hashes identify the versions checked. All twenty-two source findings carry their retained independent verdicts and version limits.

## QT.0 — Framed links, surgery and normalization

A framed link has an ordered oriented component set and a symmetric integral linking matrix: diagonal entries are framings relative to Seifert longitude, and off-diagonal entries are linking numbers. Ordinary surgery and its homology comparison are imports. An admissible link is algebraically split and unit-framed. In matrix language its diagonal entries are ±1; a zero-framed unknot therefore fails admissibility despite being algebraically split.

The refined calculus works with admissible presentations. A band-slide is an algebraically canceling pair of handle slides; it preserves the linking matrix. The matrix image of a slide is a unimodular congruence, with the diagonal formula requiring symmetry. Habiro’s main lemma reduces a sequence with identity matrix image to band-slides. Stabilization and this lemma give the admissible calculus, then Hoste moves give the presentation-independence route. The existence theorem also needs stable classification of unimodular forms; naming the refined theorem does not replace that input.

**Coverage: planned.** Refined admissible band-slide and Hoste calculus, existence and source proof routes; ordinary links/surgery/Kirby are supplier imports. The precise open obligations are the gaps and supplier contracts referenced below; no stage is claimed closed.

**Remaining obligations:**

- ArithmeticQuantumTopology/G1: Geometric link/surgery contracts — The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here: Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery: Import oriented surgery with slope fμ+λ, H₁≅coker linking matrix, IHS iff det=±1, and ordinary Kirby/Fenn–Rourke presentation calculus. Supply stable diagonalization of the integral unimodular form and its realization by ordinary moves used in admissible-presentation existence. QT proves only the admissible band-slide/Hoste refinements.

**Planets:** Admissible framed link, Hoste move, Refined Kirby calculus, Admissible band-slide calculus.

### Framed oriented links and their linking matrix

**Identifier:** `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`. **Kind:** comparison. **Mathematical status:** imported.

Import the framed oriented multi-component link carrier from GeometricTopology layer 4. Relative to its Seifert longitude, integer framings f_i and the pairwise linking numbers give the symmetric matrix A with A_ii=f_i and A_ij=lk(L_i,L_j) for i≠j. QT uses this interface, including crossing-sign/writhe compatibility. Tau Ceti FramedOrientedGaussCode describes one knot; FramedMarkovBraid has component framings but MarkovEquiv alone is unframed and supplies no framed link-type quotient.

**Proof/construction route:**

1. Use the supplier link type, its component set and oriented linking number.
2. Transport to Matrix (Fin m) (Fin m) ℤ after choosing component enumeration; changes of enumeration act by permutation congruence.
3. Import invariance and the Seifert-versus-blackboard framing comparison; do not interpret one Gauss code as a link.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`, `tauceti:TauCeti.FramedMarkovBraid`, `tauceti:TauCeti.MarkovEquiv`, `tauceti:TauCeti.BasedOrientedGaussCode.writhe`.

**Uses:**

- `ArithmeticQuantumTopology:QT.0/admissible-framed-link`: Admissibility is a condition on the linking matrix: zero off the diagonal and plus or minus one on it.
- `ArithmeticQuantumTopology:QT.0/surgery-presentation`: The first homology of the surgered manifold is the cokernel of the linking matrix, so the matrix decides when the result is an integral homology sphere.
- `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`: The integrality theorem is stated for algebraically split 0-framed links, a condition on this matrix.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `linkingMatrix` | data | linkingMatrix L is a symmetric integer matrix indexed by the components of L. |
| `linkingMatrix_symm` | characterisation | linkingMatrix L is symmetric: its (i,j) and (j,i) entries agree. |
| `linkingMatrix_diag` | projection | The (i,i) entry of linkingMatrix L is the framing of the i-th component. |
| `IsAlgebraicallySplit` | structure | IsAlgebraicallySplit L holds when every off-diagonal entry of linkingMatrix L vanishes. |
| `linkingMatrix_of_move` | compatibility | The linking matrix is unchanged by the moves of the chosen carrier, so it is an invariant of the framed link type. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `linkingMatrix_unknot` | degenerate | The linking matrix of the 0-framed unknot is the 1-by-1 zero matrix. |
| `linkingMatrix_hopf` | computation | The linking matrix of the 0-framed Hopf link is [[0,1],[1,0]], which is not diagonal, so the Hopf link is not algebraically split. |
| `linkingMatrix_blackboard` | compatibility | For a diagram with the blackboard framing, the diagonal entry of the linking matrix is the writhe of that component; this distinguishes the Seifert normalisation from the blackboard one. |
| `not_algebraicallySplit_of_det_ne` | non-example | A two-component link whose linking matrix has a nonzero off-diagonal entry is not algebraically split; in particular the Hopf link is a non-example. |

**Acceptance:**

- The 0-framed unknot has the 1-by-1 zero matrix; the (+1)-framed unknot has the matrix (1).
- The 0-framed Hopf link has matrix [[0,1],[1,0]] and determinant −1. Its nonzero off-diagonal linking numbers show it is not algebraically split; determinant −1 alone does not imply this.
- The Borromean rings with all framings 0 are algebraically split: every pairwise linking number is 0 while the link is not trivial.

**Sources:**

- [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2), §2.3, pp. 1290–1291 (PDF pp. 6–7), linking matrices. This fixed-version locus supplies framed oriented links and their linking matrix. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Surgery on a framed link and the homology of the result

**Identifier:** `ArithmeticQuantumTopology:QT.0/surgery-presentation`. **Kind:** comparison. **Mathematical status:** imported.

Import integral Dehn surgery on a framed link L in oriented S³: the meridian of the attached solid torus maps to f_i μ_i+λ_i, with λ_i the Seifert longitude. The oriented result has H₁≅coker(A:ℤ^m→ℤ^m); it is an integral homology sphere iff det A=±1. Empty surgery is S³; split union gives connected sum. The ordinary construction and Mayer–Vietoris calculation belong to GeometricTopology, Part II where its layer 5 lacks this exact interface.

**Proof/construction route:**

1. Import the exterior, slopes and orientation-preserving classification interface from the supplier.
2. Use its meridian-basis presentation of H₁ and the cokernel formula.
3. Check empty, ±1-unknot and integer p-unknot against that interface.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`, `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`, `mathlib:Matrix.det`.

**Uses:**

- `ArithmeticQuantumTopology:QT.3/definition-of-JM`: The unified invariant is defined from a surgery presentation of the manifold and must be shown independent of it.
- `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`: The move theorem is a statement about when two framed links have orientation-preserving homeomorphic surgeries.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `surgery` | constructor | surgery L is the closed oriented 3-manifold obtained by surgery on the framed link L. |
| `surgery_empty` | example | Surgery on the empty framed link is the 3-sphere. |
| `homology_surgery` | characterisation | The first homology of surgery L is the cokernel of linkingMatrix L. |
| `isIntegralHomologySphere_iff` | characterisation | surgery L is an integral homology sphere if and only if the determinant of linkingMatrix L is a unit. |
| `surgery_disjoint_union` | functoriality | Surgery on a split union of framed links is the connected sum of the surgeries. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `surgery_empty_eq_sphere` | degenerate | Surgery on the empty link is the 3-sphere, so the invariant of the empty presentation must be the invariant of the 3-sphere. |
| `surgery_unknot_pm_one` | computation | Surgery on the plus-one-framed unknot is again the 3-sphere: a definition that gave a different manifold here would be wrong. |
| `homology_surgery_unknot_p` | computation | Surgery on the p-framed unknot has first homology cyclic of order the absolute value of p; for p = 0 this is infinite cyclic, so that presentation is not an integral homology sphere. |

**Acceptance:**

- The empty link presents the 3-sphere.
- Surgery on the (plus or minus 1)-framed unknot gives the 3-sphere again; this is the blow-up and blow-down move.
- For a nonzero integer p, surgery on the p-framed unknot has first homology ℤ/|p|ℤ, the cokernel of (p), and is the lens space L(p,1) in the supplier orientation convention. For p=0 it is S¹×S² with first homology ℤ.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §10.1, pp. 34–35, surgery presentation recalled before Theorem 10.2. This fixed-version locus supplies surgery on a framed link and the homology of the result. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Admissible framed links

**Identifier:** `ArithmeticQuantumTopology:QT.0/admissible-framed-link`. **Kind:** definition. **Mathematical status:** proved-source.

L is admissible iff its linking matrix is diagonal with diagonal entries in {1,−1}. Equivalently L is algebraically split and unit-framed. This is a predicate on the imported link type; existence of an admissible presentation is a separate theorem. Surgery on an admissible L is an integral homology sphere.

**Proof/construction route:**

1. Define the matrix predicate; use symmetry for the link interface.
2. Compute det as the product of unit diagonal entries.
3. Invoke the imported homology-cokernel comparison.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`, `ArithmeticQuantumTopology:QT.0/surgery-presentation`.

**Uses:**

- `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`: The refined move theorem is a statement about admissible links only.
- `ArithmeticQuantumTopology:QT.3/definition-of-JM`: The surgery formula for the unified invariant is evaluated on an admissible presentation, where the twist element can be inserted componentwise.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `IsAdmissible` | structure | IsAdmissible L holds when L is algebraically split and every framing is plus or minus one. |
| `isAdmissible_iff` | characterisation | IsAdmissible L holds if and only if linkingMatrix L is diagonal with all diagonal entries of absolute value one. |
| `isIntegralHomologySphere_of_isAdmissible` | compatibility | If L is admissible then surgery L is an integral homology sphere. |
| `isAdmissible_empty` | example | The empty framed link is admissible. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `isAdmissible_unknot_one` | computation | The plus-one-framed unknot is admissible. |
| `not_isAdmissible_unknot_zero` | non-example | The 0-framed unknot is not admissible; this is the case that separates admissibility from the algebraically split condition alone. |
| `not_isAdmissible_hopf` | non-example | The unit-framed Hopf link is not admissible, since its off-diagonal linking number is 1. |

**Acceptance:**

- The empty link is admissible and presents the 3-sphere.
- The (plus 1)-framed unknot is admissible; the 0-framed unknot is not, since its framing is not a unit.
- The 0-framed Hopf link is not admissible, since its linking number is 1.

**Sources:**

- [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2), §1, p. 1286 (PDF p. 2), admissible links. This fixed-version locus supplies admissible framed links. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Kirby moves and the Fenn-Rourke move

**Identifier:** `ArithmeticQuantumTopology:QT.0/kirby-and-fenn-rourke-moves`. **Kind:** comparison. **Mathematical status:** imported.

Import Kirby equivalence (isotopy, split ±1-unknot stabilization and handle slides) and the equivalent Fenn–Rourke ±1-unknot local twisting calculus. On a symmetric linking matrix a slide is PᵀAP with P=I+E_ji; for i≠j its new ii-entry is A_ii+A_jj+2A_ij. Ordinary moves and their surgery theorem are requested from GeometricTopology, Part II, rather than duplicated in QT.

**Proof/construction route:**

1. Import the geometric move definitions and classical move theorem.
2. At matrix level compute the integral elementary congruence and its determinant.
3. Use the ordinary theorem only as input to the admissible refinement.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`, `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`, `ArithmeticQuantumTopology:QT.0/surgery-presentation`.

**Uses:**

- `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`: The refined theorem is stated for the sub-relation generated by the Fenn-Rourke moves that stay inside the admissible class.
- `ArithmeticQuantumTopology:QT.3/JM-well-defined`: Independence of the unified invariant is proved against this move relation.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `IsKirbyMove` | structure | IsKirbyMove L L' holds when L' is obtained from L by one blow-up, blow-down or handle slide. |
| `IsFennRourkeMove` | structure | IsFennRourkeMove L L' holds when L' is obtained from L by one Fenn-Rourke twist. |
| `surgery_eq_of_isKirbyMove` | compatibility | A Kirby move does not change the surgered manifold up to orientation-preserving homeomorphism. |
| `linkingMatrix_congr_of_handleSlide` | compatibility | A handle slide changes the linking matrix by congruence with a unimodular matrix. |
| `kirbyEquiv` | relation | kirbyEquiv is the equivalence relation generated by isotopy and Kirby moves. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `kirbyEquiv_empty_unknot_one` | computation | The empty link and the plus-one-framed unknot are Kirby equivalent, since one blow-down relates them. |
| `framing_of_handleSlide` | computation | Sliding L_1 over L_2 in the 0-framed Hopf link changes the framing of the first component by f_2 + 2 lk = 0 + 2, which pins the sign convention. |
| `not_kirbyEquiv_of_ne_homology` | non-example | Two framed links whose cokernels are non-isomorphic groups are not Kirby equivalent, since surgery is invariant; the 0-framed and 3-framed unknots are a non-example pair. |

**Acceptance:**

- A blow-up changes the linking matrix by a diagonal summand of plus or minus one and does not change the surgered manifold.
- A handle slide changes the linking matrix by a unimodular congruence, so it preserves the isomorphism class of the cokernel.
- The Fenn-Rourke move applied to an unknotted plus-one-framed component of a two-component link reproduces the twisting formula on the linking matrix.

**Sources:**

- [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2), §5, p. 1309 (PDF p. 25), Kirby and Fenn–Rourke calculus. This fixed-version locus supplies kirby moves and the fenn-rourke move. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Hoste moves between admissible links

**Identifier:** `ArithmeticQuantumTopology:QT.0/hoste-move`. **Kind:** definition. **Mathematical status:** proved-source.

A Hoste move is a Fenn–Rourke move between admissible framed links, including its inverse. The component removed is an unknotted ±1-framed component algebraically unlinked from every remaining component; deletion gives a ∓1 full twist of the strands through its spanning disc. hosteEquiv is the equivalence closure together with ambient isotopy. Both endpoint conditions are explicit; no claim is made that a move on an admissible source generally destroys admissibility.

**Proof/construction route:**

1. Restrict the imported local twisting relation to admissible endpoints.
2. Use the disc description to fix the opposite twist sign.
3. Take the symmetric, reflexive, transitive closure with isotopy.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.0/admissible-framed-link`, `ArithmeticQuantumTopology:QT.0/kirby-and-fenn-rourke-moves`.

**Uses:**

- `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`: The refined calculus says exactly that Hoste equivalence detects orientation-preserving homeomorphism of the surgeries.
- `ArithmeticQuantumTopology:QT.3/JM-well-defined`: Well-definedness is proved by checking invariance of the surgery formula under a single Hoste move.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `IsHosteMove` | structure | IsHosteMove L L' holds when L and L' are admissible and related by one Fenn-Rourke move. |
| `hosteEquiv` | relation | hosteEquiv is the equivalence relation on admissible framed links generated by isotopy and Hoste moves. |
| `isFennRourkeMove_of_isHosteMove` | compatibility | Every Hoste move is a Fenn-Rourke move. |
| `hosteEquiv_refl` | relation | hosteEquiv is reflexive on admissible links. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `isHosteMove_blowdown_unknot` | computation | Deleting a split plus-one-framed unknot from an admissible link is a Hoste move. |
| `not_isHosteMove_of_framing_two` | non-example | Removing a 2-framed unknot is not a Hoste move: its source is not unit-framed. |
| `hosteEquiv_of_isotopy` | degenerate | Isotopic admissible links are Hoste equivalent. |

**Acceptance:**

- Isotopy of admissible links is a Hoste equivalence.
- A Fenn-Rourke move whose target has a non-unit framing is not a Hoste move, although it is a Fenn-Rourke move.
- The empty link and the plus-one-framed unknot are Hoste equivalent.

**Sources:**

- [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2), §5, p. 1309 (PDF p. 25), Hoste moves. This fixed-version locus supplies hoste moves between admissible links. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Refined Kirby calculus for admissible links (Hoste's conjecture)

**Identifier:** `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`. **Kind:** theorem. **Mathematical status:** proved-source.

Two admissible framed links in S³ have orientation-preserving homeomorphic surgery results iff they are related by isotopy and Hoste moves. Labels/orientations used in the proof are auxiliary; the theorem is on unoriented unordered surgery links. It proves invariance using admissible intermediate presentations, without denying the ordinary Kirby-equivalence characterization.

**Proof/construction route:**

1. Habiro Main Lemma replaces a sequence with identity matrix by band slides.
2. Stabilize the ordinary Kirby sequence to reduce the matrix in O(p,q;ℤ), then use the band-slide calculus.
3. The Hoste corollary unknots the sliding component by Hoste moves and replaces a band slide by two local twists; remove auxiliary components.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.0/hoste-move`, `ArithmeticQuantumTopology:QT.0/admissible-band-slide-calculus`.

**Acceptance:**

- Applied to the empty link and a plus-one-framed unknot, the theorem gives a Hoste move, which it must, since both present the 3-sphere.
- Any invariant of admissible links that is unchanged by a single Hoste move descends to an invariant of integral homology spheres.
- Ordinary Kirby equivalence also characterizes the same surgery relation for admissible endpoints, but its intermediate links need not be admissible. Hoste equivalence supplies the stronger intermediate-admissibility condition.

**Sources:**

- [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2), Corollary 5.1, §5, pp. 1309–1310 (PDF pp. 25–26). This fixed-version locus supplies refined kirby calculus for admissible links (hoste's conjecture). The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Every integral homology sphere has an admissible surgery presentation

**Identifier:** `ArithmeticQuantumTopology:QT.0/refined-presentation-existence`. **Kind:** theorem. **Mathematical status:** proved-source.

Every closed connected oriented integral homology 3-sphere admits surgery on an algebraically split ±1-framed link in S³.

**Proof/construction route:**

1. Import Lickorish–Wallace and the integral homology-cokernel presentation.
2. Stabilize the unimodular integral surgery form by ±1 summands, diagonalize the stabilized odd indefinite form integrally, and realize elementary congruences by handle slides.
3. The required stable integral-form theorem is a precise supplier request; Habiro recalls this existence result rather than proving that algebraic step.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.0/admissible-framed-link`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`.

**Acceptance:**

- The 3-sphere has the empty admissible presentation.
- Every one-component integer ±1 surgery presentation is admissible and gives an integral homology sphere. This test does not identify the two surgery signs on a fixed handed trefoil with the same named manifold.
- A manifold with non-trivial first homology has no admissible presentation, since the linking matrix of an admissible link is unimodular.

**Sources:**

- [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2), §1, p. 1286 (PDF p. 2), admissible-presentation existence. This fixed-version locus supplies every integral homology sphere has an admissible surgery presentation. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Admissible band-slide theorem

**Identifier:** `ArithmeticQuantumTopology:QT.0/admissible-band-slide-calculus`. **Kind:** theorem. **Mathematical status:** proved-source.

A band slide is an algebraically cancelling pair of handle slides and preserves the linking matrix. Two admissible links with the same oriented surgery result become related by band slides and isotopy after split ±1 stabilizations. This is Habiro theorem t1; its Main Lemma applies to an oriented ordered move sequence with φ(S)=I.

**Proof/construction route:**

1. Track elementary slide, reversal and permutation matrices functorially.
2. Use the Main Lemma for the identity-matrix remainder after realizing O(p,q;ℤ) generators on stabilized unlinks.
3. Forget ordering/orientation; all band-slide intermediate matrices remain diagonal ±1.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.0/kirby-and-fenn-rourke-moves`, `ArithmeticQuantumTopology:QT.0/admissible-framed-link`.

**Acceptance:**

- A band slide is an algebraically cancelling pair of handle slides and preserves the linking matrix. Two admissible links with the same oriented surgery result become related by band slides and isotopy after split ±1 stabilizations. This is Habiro theorem t1; its Main Lemma applies to an oriented ordered move sequence with φ(S)=I.

**Sources:**

- [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2), Theorem 1.1, §1, p. 1287 (PDF p. 3); Main Lemma, Theorem 2.1, §2.2, p. 1290 (PDF p. 6); proof in §4, pp. 1300–1309 (PDF pp. 16–25). This fixed-version locus supplies admissible band-slide theorem. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

## QT.1 — Ribbon categories and quantum group invariants

A ribbon category refines the pinned braided rigid monoidal structure by a natural twist satisfying the tensor-unit, double-braiding and duality equations. The Reshetikhin–Turaev functor is defined on imported colored ribbon graphs by its values on crossings, turns and coupons. In the h-adic case use finite-rank topologically free modules with continuous maps; infinite-rank free modules are not asserted rigid.

The rank-one integral form has the exact tilde divided powers and ℤ[q±1] PBW basis. Its even part uses even K powers and is adjoint-stable; the transmuted braided Hopf maps preserve its specified image completion. The universal bottom-tangle invariant is a bead-reading tensor invariant, compatible with juxtaposition and category-B actions. Two all-bottom tangles do not have an arbitrary vertical composition. Its integral theorem requires algebraically split **and** zero-framed tangles.

The abstract topological core has two zero-convergent clasp bases, a continuous pairing and twist forms sending the unit to one. The general Lie core and integral filtration are concrete quantum PBW constructions. Specialized tilting modules and the negligible quotient form a separate root-dependent category; negligibility tests every composite quantum trace. The quotient and its permitted alcove do not establish modularity at every strong-Kirby root. The source’s finite-free category is not asserted abelian over a nonfield coefficient ring.

**Coverage: planned.** Ribbon category/RT, h-adic and integral quantum groups, tilting quotient, quantum PBW core and complete-tensor contracts. The precise open obligations are the gaps and supplier contracts referenced below; no stage is claimed closed.

**Remaining obligations:**

- ArithmeticQuantumTopology/G1: Geometric link/surgery contracts — The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.
- ArithmeticQuantumTopology/G2: Complete quantum algebra and integral core — Mathlib supplies ordinary Hopf/monoidal/rigid structures but no topological ribbon quantum algebra, its completed tensor powers, ribbon twist, quantum PBW basis, tilting quotient or integral clasp/core. The source-decomposed targets and APIs specify these objects; implementing them needs the quantum-specific completed tensor/continuity constructions over the cited pinned base-module completions, and the requested classical highest-weight interfaces. In particular, Habiro–Le §2.7’s universal J_T for arbitrary topological ribbon H and its finite-color trace compatibility are needed by general-core-filtration and general-wrt-comparison; the rank-one universal-sl2-invariant is insufficient. Construct the generic finite highest-weight colors V_λ and their quantum dimensions/traces from §3 and §8.2 before strong-kirby-colors; rank-one coloured-jones does not supply them.
- ArithmeticQuantumTopology/G3: Jones/root convention comparison — Prove the exact variable/mirror convention linking geometric Jones(t), Habiro J_K(V₁)/[2], MM’s positive-q reduced polynomial and GZ’s negative-q definition. At roots reduce before specializing, retain fourth-root lifts and distinguish strong Kirby admissibility from semisimple/modular alcove hypotheses.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here: Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.
- Import contract tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ: Import the classical enveloping algebra/PBW, highest-weight modules and rank-one calculations; root-space/root-datum inputs are the upstream layers 1–2. QT constructs the quantized Drinfeld–Jimbo algebra, its integral form and quantum PBW/core, rather than re-plan the classical theory.
- Import contract tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition: Import the fixed simple-root datum, root-space decomposition and coroot sl₂ triples, with upstream RootSystems providing root/weight lattices and Weyl action. QT uses these as the Cartan/root input for its quantized presentation, not a second root-system development.

**Planets:** Bottom tangle, Universal quantum invariant, Ribbon category, Reshetikhin–Turaev functor, Integral quantum core.

### The h-adic quantized enveloping algebra of sl(2) and its integral forms

**Identifier:** `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`. **Kind:** definition. **Mathematical status:** proved-source.

Over ℚ[[h]] put q=exp(h), v=exp(h/2), K=exp(hH/2). U_h(sl₂) is the h-adically complete algebra with [H,E]=2E, [H,F]=−2F, [E,F]=(K−K⁻¹)/(v−v⁻¹), interpreted by its h-adic expansion. Set e=(v−v⁻¹)E and F̃^(n)=F^nK^n/[n]_q!=v^(−n(n−1)/2)F^(n)K^n. Habiro U_q is the ℤ[q±1]-subalgebra generated by K±1,e,F̃^(n); U_q^ev uses K±2. Their PBW bases are F̃^(i)K^je^k and F̃^(i)K^(2j)e^k. U_q=U_q^ev⊕K U_q^ev. For F_p=U_q e^p U_q take the image of lim U_q/F_p in U_h and the induced tensor-power completion; do not assert injectivity of the preimage completion.

**Proof/construction route:**

1. Use the imported classical sl₂/root datum and the h-adic power-series division.
2. Establish the ordered PBW basis using Habiro §2.1 commutation rules.
3. Identify the even direct summand and the ad-stable e-power filtration; form the image in U_h as in §2.2.

**Direct prerequisites:** `mathlib:HopfAlgebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `mathlib:AdicCompletion`, `mathlib:UniformSpace.Completion`.

**Uses:**

- `ArithmeticQuantumTopology:QT.1/braided-hopf-structure`: The braided Hopf algebra structure is carried by the completed even integral form.
- `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`: The universal invariant of a bottom tangle takes values in completed tensor powers of these forms.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `Uq` | data | The ℤ[q±1]-subalgebra generated by e=(v−v⁻¹)E, K±1 and F̃^(n)=F^nK^n/[n]_q!. |
| `Uqev` | data | The ℤ[q±1]-subalgebra generated by e, K±2 and F̃^(n); q=v². |
| `basis_Uq` | characterisation | The ordered F̃^(i)K^je^k form a free ℤ[q±1]-basis; replace j by 2j for the even form. |
| `Uqev_le_Uq` | structure | Uqev is a subalgebra of Uq stable under Uq’s adjoint action. |
| `completion` | constructor | The completed integral form is the image of the inverse limit for F_p=Uq e^p Uq in U_h; its tensor-power image completions are algebras. No injectivity of the inverse-limit map is presumed. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `basis_freeness` | characterisation | The ordered F̃^(i)K^je^k are linearly independent over ℤ[q±1], with the stated K factors and q-divided-power normalization. |
| `Uqev_ne_Uq` | non-example | K itself lies in Uq and not in Uqev, so the two forms are different. |
| `classical_limit` | compatibility | U_h/hU_h is the classical ℚ-enveloping algebra of sl₂; h is a parameter of the ambient complete algebra, not an element asserted in the integral coefficient ring ℤ[q±1]. |

**Acceptance:**

- The stated monomials form a free basis of each integral form, so a coefficient comparison is available.
- The even form is a subalgebra of the odd one, and the odd one is a subalgebra of U_h.
- Setting h = 0 recovers the classical universal enveloping algebra of sl(2) over the rationals.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §§2.1–2.6, pp. 7–11, quantum algebra, integral forms and completions. This fixed-version locus supplies the h-adic quantized enveloping algebra of sl(2) and its integral forms. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The ribbon structure of U_h(sl(2))

**Identifier:** `ArithmeticQuantumTopology:QT.1/ribbon-structure`. **Kind:** construction. **Mathematical status:** proved-source.

U_h(sl₂) has ΔH=H⊗1+1⊗H, ΔE=E⊗1+K⊗E, ΔF=F⊗K⁻¹+1⊗F, S(H)=−H, S(E)=−K⁻¹E, S(F)=−FK. With D=exp(hH⊗H/4), R=D Σ_n v^(n(n−1)/2)(v−v⁻¹)^n/[n]! F^n⊗E^n. If R=Σ α⊗β, the ribbon element is r=Σ S(α)K⁻¹β and the pivotal element is κ=K⁻¹. Positive framing acts by r⁻¹, with scalar q^(n(n+2)/4) on V_n. All infinite sums live in specified h-adic completed tensor products.

**Proof/construction route:**

1. Check Hopf and quasitriangular identities from the ordered formulas in Habiro §3.1.
2. Construct r and prove centrality, S(r)=r, ε(r)=1 and Δr=(R₂₁R)⁻¹(r⊗r).
3. On finite free modules use R for braiding and r⁻¹ for the twist; compare the duality with Mathlib ExactPairing.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.1/ribbon-category`.

**Uses:**

- `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`: The universal invariant of a tangle is built from the R-matrix, the duality maps and the ribbon element.
- `ArithmeticQuantumTopology:QT.2/coloured-jones`: Colouring by finite-dimensional modules and taking quantum traces turns the universal invariant into the coloured Jones polynomials.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `universalR` | data | The universal R-matrix of U_h, an invertible element of the completed tensor square. |
| `yangBaxter` | relation | The universal R-matrix satisfies the Yang-Baxter equation. |
| `ribbonElement` | data | The ribbon element is a central invertible element with the standard compatibility with the coproduct and antipode. |
| `braidedCategory_modules` | instance | The category of finite-rank topologically free U_h-modules is braided, with braiding given by the R-matrix. |
| `rigidCategory_modules` | instance | The same category is rigid, with duals given by the antipode and the grouplike element. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `ribbon_unknot_framing` | computation | A positive unit framing acts by r⁻¹, hence by q^(n(n+2)/4) on V_n. Using r instead reverses the anomaly. |
| `R_matrix_classical_limit` | compatibility | Modulo h the R-matrix is the identity, so the braiding degenerates to the symmetry of the classical category. |
| `quantum_dimension_V1` | computation | The quantum dimension of the 2-dimensional module is the quantum integer [2], not 2; a definition returning the ordinary dimension is wrong. |

**Acceptance:**

- The R-matrix satisfies the Yang-Baxter equation, which is what makes the braiding a braiding.
- The inverse ribbon element r⁻¹ acts on the (n+1)-dimensional module by the positive-framing scalar used to normalise surgery formulas.
- The invariant of the 0-framed unknot coloured by the (n+1)-dimensional module is the quantum integer [n+1], not 1; this pins the normalisation.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §3.1, pp. 11–12, ribbon structure. This fixed-version locus supplies the ribbon structure of u_h(sl(2)). The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Braided Hopf algebra structure on the completed even integral form

**Identifier:** `ArithmeticQuantumTopology:QT.1/braided-hopf-structure`. **Kind:** theorem. **Mathematical status:** proved-source.

The braided Hopf algebra structure of the braided transmutation of U_h induces a braided Hopf algebra structure with invertible antipode on the h-adic completion of the even integral form; that is, each of the braided structure maps, and the inverses of the braiding and the antipode, carries the completed even form into the appropriate completed tensor power.

**Hypotheses:**

- the completed even integral form is the one of the definition node
- the braided Hopf structure on U_h is the transmutation of its ribbon Hopf structure

**Proof/construction route:**

1. Recall the braided transmutation of U_h: the same algebra with the braided coproduct and antipode built from the R-matrix.
2. Check on the free basis of the even form that each structure map has image in the completed tensor power of the even form.
3. Extend to the completion by continuity, using that each structure map respects the defining filtration.
4. Record that the same holds for the odd form and for the Z/2-grading, which is the variant used for bottom knots.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.1/ribbon-structure`.

**Acceptance:**

- Each of the braided product, unit, coproduct, counit, antipode and its inverse preserves the integral form.
- A structure map that left the integral form would break the integrality of the universal invariant, which is the point of the theorem.
- The statement fails for the non-completed form, so the completion is not cosmetic.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Theorem 3.1, §3.3, pp. 13–14, integral braided structure. This fixed-version locus supplies braided hopf algebra structure on the completed even integral form. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Bottom tangles and their closure

**Identifier:** `ArithmeticQuantumTopology:QT.1/bottom-tangle`. **Kind:** definition. **Mathematical status:** proved-source.

An n-component bottom tangle is a framed oriented union of n arcs in the cube with the i-th arc from bottom endpoint 2i to 2i−1 and no closed component. Closure by exterior arcs gives a framed link; every framed link has such a presentation. Juxtaposition tensors bottom tangles. Composition is the action of Habiro’s category B (objects b^m, suitable tangle morphisms b^m→b^n) on bottom tangles, rather than arbitrary vertical stacking of two all-bottom tangles.

**Proof/construction route:**

1. Import the framed tangle isotopy carrier.
2. Impose the endpoint ordering and orientation convention.
3. Build closure and the category B action; distinguish its vertical composition from tensoring bottom tangles.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`, `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`.

**Uses:**

- `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`: The universal invariant is defined on bottom tangles, where the algebra structure of the target matches the stacking.
- `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`: The cyclotomic expansion of a knot is stated for a bottom knot and transported to its closure.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `BottomTangle` | structure | BottomTangle n is the type of n-component bottom tangles up to isotopy. |
| `closure` | constructor | closure sends a bottom tangle to a framed oriented link with the same number of components. |
| `closure_surjective` | characterisation | Every framed oriented link is the closure of some bottom tangle. |
| `bottomTangleAction` | functoriality | A B-morphism b^m→b^n acts on an m-component bottom tangle to give an n-component bottom tangle. |
| `tensor` | functoriality | Juxtaposition gives BT_m×BT_n→BT_(m+n). |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `closure_trivial` | degenerate | The closure of the trivial bottom tangle is the zero-framed unlink. |
| `closure_of_bottom_knot` | computation | A one-component bottom tangle closes to a knot; the number of components is preserved. |
| `bottomTangle_not_closed` | non-example | A tangle with a closed component is not a bottom tangle; this excludes the degenerate case where the universal invariant would already be a trace. |

**Acceptance:**

- The closure of the trivial n-component bottom tangle is the n-component unlink with zero framings.
- The closure of a bottom knot is a knot, and every knot arises this way.
- Composition of compatible morphisms in Habiro’s category B is associative and its action on bottom tangles is functorial. Juxtaposition is tensor product; two arbitrary all-bottom tangles have no vertical stacking composition.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §4.1, pp. 14–15, bottom tangles and their closure. This fixed-version locus supplies bottom tangles and their closure. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The universal sl(2) invariant of a bottom tangle

**Identifier:** `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`. **Kind:** construction. **Mathematical status:** proved-source.

For T∈BT_n the bead-reading rule gives J_T∈U_h completed⊗n, invariant under framed tangle isotopy and in the diagonal adjoint-invariant submodule. Crossings use R±1, local turns use the pivotal data, and products are read from right to left along the oriented components. J of the trivial bottom tangle is 1⊗⋯⊗1; tensor is juxtaposition and B-actions are represented by the corresponding braided structure maps.

**Proof/construction route:**

1. Assign the local bead rules, using the stated order and pivotal element.
2. Verify the local isotopy relations from the ribbon axioms.
3. Compare the B action with braided multiplication/comultiplication and diagonal adjoint invariance.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/bottom-tangle`, `ArithmeticQuantumTopology:QT.1/ribbon-structure`, `ArithmeticQuantumTopology:QT.1/reshetikhin-turaev-functor`.

**Uses:**

- `ArithmeticQuantumTopology:QT.2/coloured-jones`: Applying quantum traces in finite-dimensional modules turns the universal invariant into the coloured Jones polynomials.
- `ArithmeticQuantumTopology:QT.3/definition-of-JM`: The surgery formula pairs the universal invariant of a bottom tangle with copies of the twist element.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `J` | data | J T is the universal invariant of the bottom tangle T, an element of the completed n-fold tensor power. |
| `J_trivial` | example | The universal invariant of the trivial bottom tangle is the unit. |
| `J_bottomTangleAction` | functoriality | J intertwines the category B action with the specified braided Hopf maps, where that action is defined. |
| `J_tensor` | functoriality | The universal invariant of a juxtaposition is the tensor product of the invariants. |
| `J_mem_invariants` | characterisation | The universal invariant lies in the adjoint-invariant part of the completed tensor power. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `J_unknot_zero_framed` | degenerate | The universal invariant of the 0-framed unknotted bottom tangle is the unit. |
| `J_framing_change` | computation | Adding a positive kink inserts r⁻¹ in the bead product; invariance under an unframed Reidemeister-I move would lose the framing. |
| `J_hopf_nontrivial` | non-example | The universal invariant of the bottom tangle closing to the Hopf link is not the unit, so the invariant sees linking. |

**Acceptance:**

- The invariant of the trivial bottom tangle is the unit of the tensor power.
- A positive framing change on a bottom knot inserts r⁻¹, and a negative change inserts r, in the fixed Habiro convention.
- A positive kink followed by a negative kink cancels. A single framing-changing Reidemeister-I curl multiplies by r⁻¹ or r and is not asserted to preserve the framed invariant.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §4.2, pp. 15–16, universal invariant. This fixed-version locus supplies the universal sl(2) invariant of a bottom tangle. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Integrality of the universal invariant on 0-framed bottom tangles

**Identifier:** `ArithmeticQuantumTopology:QT.1/universal-invariant-integrality`. **Kind:** theorem. **Mathematical status:** proved-source.

For an algebraically split AND 0-framed n-component bottom tangle T, J_T lies in Inv((completed U_q^ev) completed⊗n), where completion means the image of the e-power tensor filtration in U_h completed⊗n. No conclusion of this form is claimed for every 0-framed link.

**Proof/construction route:**

1. Generate algebraically split 0-framed bottom tangles using the Borromean bottom tangle and category B operations.
2. Compute integral even Borromean coefficients.
3. Use closure under ψ±1, μ, braided Δ and braided S±1 and the diagonal adjoint action.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`, `ArithmeticQuantumTopology:QT.1/braided-hopf-structure`, `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`.

**Acceptance:**

- The invariant of the 0-framed unknotted bottom tangle lies in the integral submodule, being the unit.
- The theorem fails for non-zero framings, where the ribbon element contributes denominators; this is why the framing hypothesis is present.
- Integrality is what makes the coloured Jones polynomials Laurent polynomials rather than rational functions.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Theorem 4.1, p. 16; proof in §4.3, pp. 16–17. This fixed-version locus supplies integrality of the universal invariant on 0-framed bottom tangles. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Ribbon Hopf algebras over a formal power series ring, and the category they present

**Identifier:** `ArithmeticQuantumTopology:QT.1/topological-ribbon-hopf-algebras`. **Kind:** definition. **Mathematical status:** proved-source.

A topological ribbon Hopf algebra over ℂ[[h]] is topologically free of countable topological rank, with invertible antipode and continuous Hopf structure maps into h-adic completed tensor products, a quasitriangular R and a central invertible ribbon r. A sequence is zero-convergent when each fixed h-adic quotient has only finitely many nonzero terms. The completed tensor product, dual maps and ribbon/pivotal identities are part of the structure. This is the ambient object in Habiro–Le, not an assumption that arbitrary integral subalgebras inherit its completion. Explicitly, Δ^op(a)=RΔ(a)R⁻¹, (Δ⊗id)R=R₁₃R₂₃, (id⊗Δ)R=R₁₃R₁₂, and the normalized counit identities hold. If u=μ(S⊗id)(R₂₁), then r²=uS(u), S(r)=r, ε(r)=1 and Δ(r)=(R₂₁R)⁻¹(r⊗r). All products and maps here use the specified completed tensor topology.

**Proof/construction route:**

1. Use the general complete-module and tensor-product supplier request.
2. State each ribbon identity in the completed tensor square or cube.
3. Use zero-convergence to justify continuous sums in the clasp and twist forms.

**Direct prerequisites:** `mathlib:HopfAlgebra`, `ArithmeticQuantumTopology:QT.1/ribbon-category`, `mathlib:AdicCompletion`, `mathlib:UniformSpace.Completion`.

**Uses:**

- `ArithmeticQuantumTopology:QT.1`: The universal invariant of a bottom tangle takes values in completed tensor powers of the algebra and is defined from the R-matrix and the ribbon element.
- `ArithmeticQuantumTopology:QT.2`: Colored link invariants are obtained by applying finite-dimensional representations and quantum traces in this category.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `TopologicalRibbonHopfAlgebra` | structure | A countable-rank topologically free Hopf algebra over ℂ[[h]] with continuous completed-tensor maps, R and r satisfying the displayed ribbon identities. |
| `TopologicalRibbonHopfAlgebra.R` | data | The invertible element of the completed tensor square, with the quasi-triangularity identities. |
| `TopologicalRibbonHopfAlgebra.ribbon` | data | The central invertible element with its coproduct and antipode axioms. |
| `TopologicalRibbonHopfAlgebra.moduleCategory` | equivalence | Finite-rank topologically free continuous modules form a ribbon category, with braiding from R and positive twist from r⁻¹. |
| `TopologicalRibbonHopfAlgebra.duals` | structure | Finite-rank topologically free modules have continuous left/right duals and evaluation/coevaluation. No rigidity of all infinite-rank topologically free modules is asserted. |
| `ZeroConvergent` | characterisation | Zero-convergent families and the sums they define, which is what makes infinite expansions meaningful. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `trivialRibbonHopf` | degenerate | The ground ring itself, with trivial R-matrix and ribbon element, is a topological ribbon Hopf algebra whose universal invariant is constant; this is the degenerate case. |
| `twist_unit` | computation | The twist on the tensor unit is the identity, which is the statement that the ribbon element acts trivially on the trivial module. |
| `braiding_not_symmetric` | non-example | For the quantised enveloping algebra the braiding is not a symmetry: its square on a two-dimensional module is not the identity, which is exactly what makes the invariant see the knotting. |
| `groupAlgebra_symmetric` | non-example | The completed group algebra of an abelian group with trivial R-matrix gives a symmetric, not merely braided, category; its universal invariant cannot distinguish a knot from the unknot. |

**Acceptance:**

- The axioms of the R-matrix and the ribbon element are listed in full.
- The topological hypotheses are stated where they are used, in particular for duality.
- The boundary with the pinned libraries is recorded.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), §§2.1–2.3, pp. 12–16; ribbon axioms in §2.2, pp. 14–15. This fixed-version locus supplies ribbon hopf algebras over a formal power series ring, and the category they present. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The abstract data that turns a ribbon Hopf algebra into an invariant of homology spheres

**Identifier:** `ArithmeticQuantumTopology:QT.1/core-subalgebras-and-twist-forms`. **Kind:** definition. **Mathematical status:** proved-source.

A core subalgebra X of a topological ribbon Hopf algebra is topologically free with continuous Δ(X)⊂completed X⊗X, S±1(X)⊂X, adjoint stability, and R and the pivotal element in the appropriate closures. For the clasp c=Σ c′_i⊗c″_i, both families are zero-convergent topological bases of X. If x=Σ x″_ic″_i lies in its ambient closure and y=Σ y′_ic′_i lies in X, define ⟨x,y⟩=Σ x″_iy′_i; its convergence follows from these basis conditions. Twist forms are T±(y)=⟨r±1,y⟩. Their normalization is T±(1)=1. Construction of an integral invariant also needs the integral K_n stability conditions, separately planned. No arbitrary scalar Gauss denominator is inserted.

**Proof/construction route:**

1. Use both clasp bases, their uniqueness of coordinates and zero-convergence.
2. Prove continuity and define pairing and twist forms by the displayed sum.
3. Use the clasp normalization for T±(1); retain the distinct integral K_n conditions for a Habiro-valued invariant.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/topological-ribbon-hopf-algebras`.

**Uses:**

- `ArithmeticQuantumTopology:QT.4/general-simple-lie-type`: The integral K_n conditions upgrade the abstract pairing to a unified invariant.
- `ArithmeticQuantumTopology:QT.1/general-integral-core`: The PBW core provides the two zero-convergent clasp bases.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `CoreSubalgebra` | structure | Topological core with both clasp basis conditions and stability. |
| `claspForm` | constructor | Continuous pairing between the closure and the core with the coordinate formula above. |
| `CoreSubalgebra.twistForm` | constructor | T±(y)=⟨r±1,y⟩. |
| `CoreSubalgebra.twistForm_one` | simp | Both twist forms send 1 to 1. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `claspForm_dualBasis` | computation | The two clasp basis families pair as Kronecker delta. |
| `coreInvariant_empty` | degenerate | The empty surgery presentation gives 1, without a denominator. |
| `core_pairing_no_arbitrary_dual` | non-example | A one-sided basis without the other topological basis does not satisfy CoreSubalgebra; it cannot define the coordinate pairing. |

**Acceptance:**

- The two clasp basis families pair as Kronecker delta.
- The empty surgery presentation gives 1, without a denominator.
- A one-sided basis without the other topological basis does not satisfy CoreSubalgebra; it cannot define the coordinate pairing.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), §§2.14–2.16, pp. 28–35, core and twist systems. This fixed-version locus supplies the abstract data that turns a ribbon hopf algebra into an invariant of homology spheres. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### What specialising at a root of unity does and does not give

**Identifier:** `ArithmeticQuantumTopology:QT.1/root-of-unity-categories-are-not-generically-semisimple`. **Kind:** comparison. **Mathematical status:** proved-source.

Keep three settings distinct: generic h-adic finite free modules; integral PBW forms and their image completions; and specialized tilting modules at a specified root. The last category is not generically semisimple. Negligibility means every composite endomorphism has zero quantum trace, not merely that an arbitrary object has zero quantum dimension. The negligible quotient and its allowed alcove are separate constructions. Modularity needs extra root/type restrictions; general Lie-type strong Kirby colors in QT.4 do not imply a modular category at every admissible root.

**Proof/construction route:**

1. Read specialized tilting and negligible definitions before using the semisimplification.
2. Separate integral maps from base change to a field.
3. Apply only Sawin’s stated root bounds and modularity restrictions.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.1/tilting-negligible-quotient`, `ArithmeticQuantumTopology:QT.4/strong-kirby-colors`.

**Acceptance:**

- The three settings are named and separated.
- Each passage between them is identified with a named statement elsewhere in the packet.
- The absence of a semisimplicity claim is checkable against the other nodes.

**Sources:**

- [Quantum groups at roots of unity and modularity](https://arxiv.org/abs/math/0308281v2), §4, pp. 18–22, tilting modules; §6, Theorem 5, pp. 24–26, negligible quotient. This fixed-version locus supplies what specialising at a root of unity does and does not give. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Ribbon category

**Identifier:** `ArithmeticQuantumTopology:QT.1/ribbon-category`. **Kind:** definition. **Mathematical status:** proved-source.

A ribbon category is a braided rigid monoidal category with a natural automorphism θ of the identity satisfying θ₁=id, θ_(X⊗Y)=(θ_X⊗θ_Y) followed by the double braiding, and θ_(X*)=(θ_X)* for the chosen rigid duality. All associators/unitors and the dual comparison are retained; no symmetric-braiding axiom is imposed. Its pivotal trace is the ribbon graphical closure of an endomorphism.

**Proof/construction route:**

1. Extend the existing braided and rigid structures by the balanced natural twist.
2. Use the dual-compatibility equation to make left/right graphical traces agree.
3. Compare the module instance with κ=K⁻¹ and θ=r⁻¹.

**Direct prerequisites:** `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.BraidedCategory`, `mathlib:CategoryTheory.RigidCategory`, `mathlib:CategoryTheory.ExactPairing`.

**Uses:**

- `ArithmeticQuantumTopology:QT.1/ribbon-structure`: Produces the category of finite free quantum-group modules.
- `ArithmeticQuantumTopology:QT.1/reshetikhin-turaev-functor`: Supplies the local diagram relations.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `RibbonCategory` | structure | The pinned braided rigid category together with the natural twist and the three equations above. |
| `ribbonTwist_tensor` | compatibility | The twist of a tensor product is the double braiding composed with the tensor of twists. |
| `ribbonTwist_dual` | compatibility | Dualizing θ_X gives θ_(X*). |
| `ribbonTrace` | constructor | Graphical closure gives an endomorphism of the tensor unit; compare with the pivotal quantum trace. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `ribbonTwist_unit` | degenerate | The twist on the tensor unit is the identity. |
| `ribbonTrace_vectorSpace` | compatibility | For finite-dimensional vector spaces with flip braiding and trivial twist the ribbon trace is the ordinary trace. |
| `ribbonTwist_sl2_V1` | computation | In the generic sl₂ instance a positive twist on V₁ acts as q^(3/4), so θ is not the identity. |

**Acceptance:**

- The twist on the tensor unit is the identity.
- For finite-dimensional vector spaces with flip braiding and trivial twist the ribbon trace is the ordinary trace.
- In the generic sl₂ instance a positive twist on V₁ acts as q^(3/4), so θ is not the identity.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §3.1, pp. 11–12; §5.2, pp. 19–20. This fixed-version locus supplies ribbon category. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.
- [Ribbon graphs and their invariants derived from quantum groups](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf), §§2.1–2.2, pp. 2–4; §§3.1–3.3, pp. 4–7; Theorem 5.1, pp. 12–13. Published theorem 5.1 specifies the colored ribbon-graph functor; categorical compatibility uses the definitions in §§2–3.

### Reshetikhin–Turaev functor

**Identifier:** `ArithmeticQuantumTopology:QT.1/reshetikhin-turaev-functor`. **Kind:** construction. **Mathematical status:** proved-source.

For a ribbon Hopf algebra (A,R,r) over a field, the finite-dimensional module category admits the unique tensor functor from homogeneous colored directed ribbon graphs that sends signed colors to V or V*, coupons to their A-linear maps, crossings to flip∘R and turns to the evaluation/coevaluation with pivotal u r⁻¹. Its value on a closed colored framed link is a scalar invariant under framed isotopy. For U_h use finite free modules over the complete base and continuous structure maps. The geometric ribbon-graph presentation is imported, not a new link carrier.

**Proof/construction route:**

1. Use the supplier diagram generators and isotopy relations (RT Lemmas 5.2–5.3).
2. Assign R, pivotal duality and coupons; verify the relations by the ribbon identities.
3. Uniqueness follows from generation; compare the h-adic assignment with Habiro’s bead reading.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/ribbon-category`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`, `mathlib:HopfAlgebra`, `ArithmeticQuantumTopology:QT.1/topological-ribbon-hopf-algebras`.

**Uses:**

- `ArithmeticQuantumTopology:QT.2/coloured-jones`: Proves presentation independence of the trace construction.
- `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`: Identifies the scalar closure of the bead invariant.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `RTFunctor` | constructor | Tensor functor with the specified generators and color duality. |
| `RTFunctor_coupon` | simp | The image of an A-linear coupon is its label. |
| `RTFunctor_tensor` | functoriality | Juxtaposition maps to the tensor product of maps. |
| `RTFunctor_closed` | compatibility | Closing a component is pivotal quantum trace. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `RTFunctor_empty` | degenerate | The empty closed graph evaluates to 1. |
| `RTFunctor_straight` | computation | The straight colored strand evaluates to id_V. |
| `RTFunctor_crossing_inverse` | non-example | A crossing followed by its inverse is the identity; a positive crossing alone is not assumed involutive. |

**Acceptance:**

- The empty closed graph evaluates to 1.
- The straight colored strand evaluates to id_V.
- A crossing followed by its inverse is the identity; a positive crossing alone is not assumed involutive.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §5.2, pp. 19–20. This fixed-version locus supplies reshetikhin–turaev functor. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.
- [Ribbon graphs and their invariants derived from quantum groups](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf), Theorem 5.1, §5.1, pp. 12–13; proof in §5.4, pp. 15–16; ribbon structure in §3.3, p. 7. Published theorem 5.1 specifies the colored ribbon-graph functor; categorical compatibility uses the definitions in §§2–3.

### Tilting semisimplification

**Identifier:** `ArithmeticQuantumTopology:QT.1/tilting-negligible-quotient`. **Kind:** construction. **Mathematical status:** proved-source.

Specialize the Lusztig divided-power quantum group at the source root: q=s^L, s of order lL, l′=l for odd l and l/2 for even l. For types with d_max|l′ require l′≥d_max h∨; otherwise l′>h. The tilting category consists of modules with Weyl and dual Weyl filtrations. Quotient Hom(V,W) by maps f with qtr(hf)=0 for every h:W→V. Sawin’s full ribbon functor yields a semisimple ribbon category with simples in the open affine alcove ⟨λ+ρ,θ₀⟩<l′. For sl₂ in Habiro variables v of order 2r, r≥2, the admissible colors are V₀,…,V_(r−2); the source root-lattice scaling must be compared before using this specialization. General-type modularity is not asserted.

**Proof/construction route:**

1. Construct specialized Lusztig modules and Weyl filtrations using the supplier algebraic representation theory.
2. Prove the negligible maps form a tensor ideal, then use Sawin’s alcove and tilting decomposition theorem.
3. Descend ribbon evaluation through the full quotient functor and compare the sl₂ root convention.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/reshetikhin-turaev-functor`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `ArithmeticQuantumTopology:QT.1/general-drinfeld-jimbo-algebra`.

**Uses:**

- `ArithmeticQuantumTopology:QT.4/WRT-invariant-at-a-root`: Supplies the admissible sl₂ color range.
- `ArithmeticQuantumTopology:QT.1/root-of-unity-categories-are-not-generically-semisimple`: Prevents a blanket root semisimplicity assertion.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `TiltingModule` | structure | Module with both Weyl and dual Weyl filtrations. |
| `IsNegligibleMorphism` | relation | f:V→W is negligible iff qtr(hf)=0 for all h:W→V. |
| `TiltingSemisimplification` | constructor | The quotient ribbon category by the negligible tensor ideal. |
| `tiltingSimple_alcove` | characterisation | Simples are labelled by the stated open affine alcove under the root bounds. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `negligible_identity_outside_alcove` | non-example | An indecomposable tilting module outside the alcove has negligible identity under the root bounds. |
| `tilting_unit_not_negligible` | degenerate | The unit has quantum trace 1 and survives. |
| `sl2_alcove_rank` | computation | For r=3 the two retained sl₂ labels are 0 and 1; the weight r−1=2 does not survive as a simple. |

**Acceptance:**

- An indecomposable tilting module outside the alcove has negligible identity under the root bounds.
- The unit has quantum trace 1 and survives.
- For r=3 the two retained sl₂ labels are 0 and 1; the weight r−1=2 does not survive as a simple.

**Sources:**

- [Quantum groups at roots of unity and modularity](https://arxiv.org/abs/math/0308281v2), §4, pp. 18–22; §6, Theorem 5, pp. 24–26. This fixed-version locus supplies tilting semisimplification. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Drinfeld–Jimbo algebra

**Identifier:** `ArithmeticQuantumTopology:QT.1/general-drinfeld-jimbo-algebra`. **Kind:** definition. **Mathematical status:** proved-source.

For a finite-dimensional simple complex Lie algebra with normalized short-root length²=2, put d_i=(α_i,α_i)/2∈{1,2,3}, v_i=v^d_i, q=v², and use root lattice Y⊂weight lattice X with D=|X/Y|. U_h(g) has Cartan-root commutators, [E_i,F_j]=δ_ij(K_i−K_i⁻¹)/(v_i−v_i⁻¹), and quantum Serre relations of degree 1−a_ij, with K_i=exp(hH_i/2) in the source convention. The generic U_q(g) over ℂ(v) embeds in U_h(g); its PBW root-vector and Lusztig divided-power integral forms are distinguished. Classical root data and ordinary PBW are imported from LieHighestWeight.

**Proof/construction route:**

1. Import the simple root datum and ordered positive roots.
2. Construct the quantum Serre quotient and its topological Hopf maps, using the corrected F_i weight relation.
3. Use quantum root vectors for the PBW basis and define the distinct Lusztig and dual integral lattices.

**Direct prerequisites:** `mathlib:HopfAlgebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `ArithmeticQuantumTopology:QT.1/topological-ribbon-hopf-algebras`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`.

**Uses:**

- `ArithmeticQuantumTopology:QT.1/general-integral-core`: Provides the PBW basis and integral forms needed for the core.
- `ArithmeticQuantumTopology:QT.4/strong-kirby-colors`: Fixes root orders and lattice scaling.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `DrinfeldJimboDatum` | structure | Root/weight lattices, d_i,D and the chosen root ordering. |
| `DrinfeldJimboAlgebra` | constructor | The topological quantum Serre algebra for that datum. |
| `quantumPBWBasis` | data | Ordered root-vector divided powers and Cartan factors form the specified PBW basis. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `DJ_sl2_relations` | compatibility | For rank one the relations reduce to QT.1 U_h(sl₂), including the correct F weight sign. |
| `DJ_serre_commuting_roots` | computation | For a_ij=0 the quantum Serre relation is E_iE_j=E_jE_i. |
| `DJ_root_lengths_G2` | non-example | In G₂ the long-root d_i is 3; replacing every v_i by v loses the Serre coefficients. |

**Acceptance:**

- For rank one the relations reduce to QT.1 U_h(sl₂), including the correct F weight sign.
- For a_ij=0 the quantum Serre relation is E_iE_j=E_jE_i.
- In G₂ the long-root d_i is 3; replacing every v_i by v loses the Serre coefficients.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), §§3.1–3.4, pp. 36–40, quantum presentations, gradings and triangular forms. This fixed-version locus supplies drinfeld–jimbo algebra. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Integral core subalgebra

**Identifier:** `ArithmeticQuantumTopology:QT.1/general-integral-core`. **Kind:** construction. **Mathematical status:** proved-source.

For the ordered PBW data of U_h(g), the h-adic core X_h over ℂ[[√h]] has weighted basis h^(||n||/2)b_h. Over A=ℤ[v±1] adjoin the square roots √Φ_k(q) to form Ã. The integral core X_ℤ is the Ã-span of √((q;q)_n)b^Lusztig_n with the multi-index factorial and PBW ordering of Habiro–Le §5. It is free with those two-sided clasp bases and is stable under the coproduct, antipode, adjoint action, braiding, bar and mirror operations. These weighted lattices are separate from U_A and from the eventual ℤ[q±1] coefficient ring.

**Proof/construction route:**

1. Use §3 PBW and the dual PBW form to factor the clasp.
2. Insert h^(||n||/2) weights to build the topological core; verify both clasp bases (§4).
3. Use the cyclotomic square-root weights and divisibility to prove integral stability and T±(X_ℤ)⊂Ã (§5).

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/general-drinfeld-jimbo-algebra`, `ArithmeticQuantumTopology:QT.1/core-subalgebras-and-twist-forms`, `mathlib:Polynomial.cyclotomic`.

**Uses:**

- `ArithmeticQuantumTopology:QT.4/general-core-filtration`: The even part and graded intersection produce K_n.
- `ArithmeticQuantumTopology:QT.4/general-simple-lie-type`: Provides a concrete core, not only an abstract existence assumption.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `weightedPBWCore` | constructor | The √h-adic core with the displayed weighted PBW basis. |
| `integralQuantumCore` | constructor | The Ã-lattice with cyclotomic square-root PBW weights. |
| `integralCore_twist` | compatibility | The clasp twist forms take the integral core to Ã. |
| `integralCore_stable` | structure | The specified Hopf, adjoint, braiding, bar and mirror maps preserve the core. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `integralCore_unit` | degenerate | The zero PBW index has weight 1 and contains the unit. |
| `integralCore_sl2` | compatibility | Under the rank-one identification the core construction yields the sl₂ integral image used for unified invariants, with its own coefficient comparison. |
| `integralCore_weights_essential` | non-example | The n-th positive-root basis weight contains √((q;q)_n), rather than an unweighted Lusztig basis; omitting that weight is a different lattice. |

**Acceptance:**

- The zero PBW index has weight 1 and contains the unit.
- Under the rank-one identification the core construction yields the sl₂ integral image used for unified invariants, with its own coefficient comparison.
- The n-th positive-root basis weight contains √((q;q)_n), rather than an unweighted Lusztig basis; omitting that weight is a different lattice.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), §§4–5, pp. 46–67, h-adic and integral cores. This fixed-version locus supplies integral core subalgebra. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

## QT.2 — Colored Jones polynomials and cyclotomic expansions

The quantum trace in Vₙ is the trace of K⁻¹, with [n+1] on the zero-framed unknot. Multilinearity takes place in the character algebra, identified with a polynomial algebra in V₁; Chebyshev S gives its rank-one character recursion. Crossings and framings can produce quarter-power q factors. The geometric Jones comparison must fix mirror, variable and unknot normalization before it can be imported.

The monic colors Pₙ, trace-dual colors P″ₙ, divided colors P′ₙ and tilde integral colors P̃′ₙ have different denominators. The integral color lattice is the ℤ[q±1]-span of P̃′ₙ, with its tail ideals. The even center has the explicit Casimir polynomial basis σₙ. Trace duality extracts the coefficients aₙ(K); finite ordinary colors see only finitely many σₙ. This triangular theorem explains cyclotomic expansion and colored-Jones determination. It does not mean any root-evaluable series is a knot invariant.

For an algebraically split zero-framed link, the maximal filtration index gives the explicit strengthened divisibility ideal, which tends to zero in the scalar Habiro topology. That permits the multilinear completed trace used by QT.3. Central σ-truncation, a fixed-color trace truncation and a scalar factorial-series truncation remain distinct. The scalar unified Kashaev element is the factorial-square series H_K extracted at C²=4 from the central expansion. Its primitive-root evaluation gives the reduced dimension-N colored Jones polynomial. MM compares it to the original Kashaev R-matrix invariant for N≥2, and the order-one extension is 1; the original R-matrix construction is not a second planned carrier. GZ’s rational function evaluates at exp(−2πiα); it is periodic and Galois equivariant, with order-five figure-eight conjugates showing that values are not pointwise Galois fixed.

**Coverage: planned.** Finite-free colors, center, P bases, exact cyclotomic coefficients/divisibility/truncations and Jones/Kashaev convention comparisons. The precise open obligations are the gaps and supplier contracts referenced below; no stage is claimed closed.

**Remaining obligations:**

- ArithmeticQuantumTopology/G1: Geometric link/surgery contracts — The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.
- ArithmeticQuantumTopology/G2: Complete quantum algebra and integral core — Mathlib supplies ordinary Hopf/monoidal/rigid structures but no topological ribbon quantum algebra, its completed tensor powers, ribbon twist, quantum PBW basis, tilting quotient or integral clasp/core. The source-decomposed targets and APIs specify these objects; implementing them needs the quantum-specific completed tensor/continuity constructions over the cited pinned base-module completions, and the requested classical highest-weight interfaces. In particular, Habiro–Le §2.7’s universal J_T for arbitrary topological ribbon H and its finite-color trace compatibility are needed by general-core-filtration and general-wrt-comparison; the rank-one universal-sl2-invariant is insufficient. Construct the generic finite highest-weight colors V_λ and their quantum dimensions/traces from §3 and §8.2 before strong-kirby-colors; rank-one coloured-jones does not supply them.
- ArithmeticQuantumTopology/G3: Jones/root convention comparison — Prove the exact variable/mirror convention linking geometric Jones(t), Habiro J_K(V₁)/[2], MM’s positive-q reduced polynomial and GZ’s negative-q definition. At roots reduce before specializing, retain fourth-root lifts and distinguish strong Kirby admissibility from semisimple/modular alcove hypotheses.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here: Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.
- Import contract tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ: Import the classical enveloping algebra/PBW, highest-weight modules and rank-one calculations; root-space/root-datum inputs are the upstream layers 1–2. QT constructs the quantized Drinfeld–Jimbo algebra, its integral form and quantum PBW/core, rather than re-plan the classical theory.

**Planets:** Cyclotomic color basis, Cyclotomic Jones expansion, Finite free quantum colors, Completed even quantum center.

### Coloured Jones polynomials from the universal invariant

**Identifier:** `ArithmeticQuantumTopology:QT.2/coloured-jones`. **Kind:** construction. **Mathematical status:** proved-source.

For a framed m-component oriented link presented as closure of T, put J_L(V_(n₁),…,V_(n_m))=(tr_q^(V_n₁)⊗⋯⊗tr_q^(V_nm))(J_T). This is independent of T and multilinear in virtual colors. The empty link has value 1; the zero-framed unknot has [n+1]. Generic framed values may need ℤ[q^(±1/4)]; even framings give ℤ[v±1], and algebraically split zero-framed links give ℤ[q±1]. Positive framing on a V_n component multiplies by q^(n(n+2)/4). For a zero-framed knot define J^red_(K,N)=J_K(V_(N−1))/[N] as a Laurent polynomial by the divisibility theorem before root evaluation, N≥1.

**Proof/construction route:**

1. Use RT graphical closure to prove isotopy and closure independence.
2. Extend traces linearly to virtual colors.
3. Distinguish scalar-field targets and reduced division before specialization; quantum dimension vanishes at some roots.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/universal-sl2-invariant`, `ArithmeticQuantumTopology:QT.1/reshetikhin-turaev-functor`, `ArithmeticQuantumTopology:QT.2/finite-free-colors`.

**Uses:**

- `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`: The cyclotomic expansion is an expansion of the reduced coloured Jones polynomials of a knot.
- `ArithmeticQuantumTopology:QT.3/definition-of-JM`: The surgery formula is a pairing of these invariants, extended to the completion, with the twist element.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `colouredJones` | data | colouredJones L n is the coloured Jones polynomial of the framed link L with the given colours. |
| `colouredJones_unknot` | example | The 0-framed unknot coloured by V_n has value the quantum integer [n+1]. |
| `colouredJones_multilinear` | functoriality | The coloured Jones invariant is multilinear in the colours, hence extends to the representation ring. |
| `reducedJones` | data | The reduced coloured Jones polynomial is the quotient by the value of the unknot with the same colour. |
| `colouredJones_framing_change` | compatibility | Changing the framing of a component multiplies the invariant by the ribbon scalar of its colour. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `colouredJones_unknot_V1` | computation | The 0-framed unknot coloured by the 2-dimensional module has value the quantum integer [2], not 1; a definition returning 1 is the reduced one. |
| `colouredJones_positive_framing` | compatibility | The +1-framed unknot in color V₁ has q^(3/4)(v+v⁻¹), not merely [2]. |
| `colouredJones_split_union` | characterisation | For a split union the invariant is the product of the invariants, so a definition that failed multiplicativity would be wrong. |

**Acceptance:**

- The 0-framed unknot coloured by V_n has coloured Jones the quantum integer [n+1]; the reduced value is 1.
- The trefoil coloured by V_1 recovers the Jones polynomial in the fixed variable convention.
- The invariant is multilinear in the colours, so it extends to the representation ring.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §§5.2–5.3, pp. 19–20; §6.2, pp. 21–22. This fixed-version locus supplies coloured jones polynomials from the universal invariant. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The elements P_n and the cyclotomic basis of the representation ring

**Identifier:** `ArithmeticQuantumTopology:QT.2/p-basis`. **Kind:** definition. **Mathematical status:** proved-source.

In ℚ(v)[X]=R_ℚ(v), X=V₁, define {a}=v^a−v⁻a, {n}!=∏_(j=1)^n{j}, {a}_b=∏_(j=0)^(b−1){a−j}. Set P_n=∏_(i=0)^(n−1)(X−v^(2i+1)−v^(−2i−1)), P′_n=P_n/{n}!, P″_n=P_n/{2n+1}_(2n), and P̃′_n=v^(−n(n−1)/2)P′_n. P_n is monic and forms a triangular basis over ℤ[v±1]; the three rescalings are distinct elements in the fraction-field representation algebra.

**Proof/construction route:**

1. Define the products including the empty product.
2. Use monicity to prove triangular basis comparison with the V_n.
3. Specify the nonzero denominators in ℚ(v), rather than claiming the normalized colors lie in ℤ[v±1][X].

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/finite-free-colors`.

**Uses:**

- `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`: P″ gives dual trace coefficients.
- `ArithmeticQuantumTopology:QT.3/twist-element`: P′ and P̃′ give convergent twist coordinates.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `P` | constructor | The exact monic product P_n in R_A. |
| `P_prime` | constructor | P′_n=P_n/{n}! in R_ℚ(v). |
| `P_doublePrime` | constructor | P″_n=P_n/{2n+1}_(2n). |
| `P_tildePrime` | constructor | P̃′_n=v^(−n(n−1)/2)P′_n. |
| `P_basis` | characterisation | The P_n form a monic triangular A-basis. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `P_zero_eq_one` | degenerate | P₀=P′₀=P″₀=1. |
| `P_one` | computation | P₁=X−v−v⁻¹. |
| `P_rescalings_distinct` | non-example | P″₁=P₁/({3}{2}) whereas P′₁=P₁/{1}; the denominators are different. |

**Acceptance:**

- P₀=P′₀=P″₀=1.
- P₁=X−v−v⁻¹.
- P″₁=P₁/({3}{2}) whereas P′₁=P₁/{1}; the denominators are different.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §6.1, p. 21, P and P″; §8.1, p. 28, P′ and P̃′. This fixed-version locus supplies the elements p_n and the cyclotomic basis of the representation ring. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The quantum trace pairing is dual to the cyclotomic basis

**Identifier:** `ArithmeticQuantumTopology:QT.2/dual-basis-pairing`. **Kind:** lemma. **Mathematical status:** proved-source.

For m,n≥0, tr_q^(P″_m)(σ_n)=δ_mn, where the trace is linearly extended over ℚ(v) and σ_n has the Casimir normalization above.

**Proof/construction route:**

1. Compute the trace of σ_n on V_j from its Casimir eigenvalue and [j+1].
2. Insert the triangular formula for P″_m.
3. Use the resulting q-binomial cancellation; check m=n=0 gives tr_V0(1)=1.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/p-basis`, `ArithmeticQuantumTopology:QT.2/completed-even-center`, `ArithmeticQuantumTopology:QT.2/finite-free-colors`.

**Acceptance:**

- The pairing of P''_0 with sigma_0 is 1 and with sigma_1 is 0.
- Duality forces the coefficients in the cyclotomic expansion to be the reduced coloured Jones values at the colours P''_n.
- Without the rescaling the pairing is the stated quantum binomial rather than 1, so the normalisation is not cosmetic.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Proposition 6.3, §6.2, p. 21; proof in §6.3, pp. 22–24. This fixed-version locus supplies the quantum trace pairing is dual to the cyclotomic basis. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Cyclotomic expansion of the universal invariant of a bottom knot

**Identifier:** `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`. **Kind:** theorem. **Mathematical status:** proved-source.

For a zero-framed bottom knot T with closure K there are unique a_i(K)∈ℤ[q±1], a₀=1, with J_T=Σ_i a_i(K)σ_i and a_i(K)=J_K(P″_i). In ordinary colors J_K(V_n)=Σ_(i=0)^n ({n+1+i}_(2i+1)/{1}) a_i(K). The reduced polynomial J^red_(K,N) is obtained by dividing this identity by [N] before evaluation; Habiro’s name “reduced Jones polynomial” a_i is a different normalization from J^red_(K,N).

**Proof/construction route:**

1. Use bottom-knot integrality and adjoint invariance to place J_T in the completed even center.
2. Take quantum trace against the P″ dual basis to extract a_i.
3. Trace in V_n; σ_i vanishes for i>n, giving the finite ordinary-color formula.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/dual-basis-pairing`, `ArithmeticQuantumTopology:QT.2/completed-even-center`, `ArithmeticQuantumTopology:QT.1/universal-invariant-integrality`, `ArithmeticQuantumTopology:QT.2/coloured-jones`.

**Acceptance:**

- For the unknot the expansion is the single term sigma_0, so all higher coefficients vanish.
- The coefficients are Laurent polynomials, by the integrality theorem, which is the point of the expansion.
- Summing the expansion against the change-of-basis formula recovers the ordinary coloured Jones polynomials.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Theorem 6.4, §6.2, pp. 21–22. This fixed-version locus supplies cyclotomic expansion of the universal invariant of a bottom knot. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The algebra spanned by the cyclotomic elements and its completion

**Identifier:** `ArithmeticQuantumTopology:QT.2/algebra-P-and-completion`. **Kind:** definition. **Mathematical status:** proved-source.

Let P be the ℤ[q±1]-span of P̃′_n in R_ℚ(v), q=v²; it is a subalgebra, not the ℤ[v±1]-span of unnormalized P_n. P_k=span_(ℤ[q±1]){P̃′_n:n≥k} is an ideal and P̂=lim P/P_k, with unique formal coordinates in P̃′_n. In the P′ basis P′_m P′_n=Σ_(i=0)^min(m,n) {m+n}!/({i}!{m−i}!{n−i}!) P′_(m+n−i); rescaling gives integral ℤ[q±1] structure coefficients for P̃′.

**Proof/construction route:**

1. Use Habiro §8.1 multiplication formula in the fraction representation algebra.
2. Rewrite in the tilde basis and verify the coefficients lie in ℤ[q±1].
3. Indices of all products are at least max(m,n), proving the filtration ideals; take their inverse limit.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/p-basis`, `mathlib:UniformSpace.Completion`.

**Uses:**

- `ArithmeticQuantumTopology:QT.3/twist-element`: The twist element is an infinite sum of the P_n, so it lives in this completion and not in the algebra itself.
- `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`: The integrality theorem is stated for colours taken in the filtration steps of this algebra.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `algebraP` | data | The ℤ[q±1]-linear span of P̃′_n=v^(−n(n−1)/2)P_n/{n}! in ℚ(v)[V₁], with q=v². |
| `mul_P` | characterisation | The displayed P′ multiplication rule, transported to the integral tilde basis. |
| `algebraP_isSubalgebra` | structure | The span of P̃′_n is closed under products and contains 1, so is a ℤ[q±1]-subalgebra of ℚ(v)[V₁]. |
| `filtration` | data | P_k is the ℤ[q±1]-span of P̃′_n for n≥k; it is an ideal of P and P_kP_l⊂P_max(k,l). |
| `completion` | constructor | The inverse limit P̂=lim P/P_k has unique convergent coordinates in P̃′_n, with coefficients in ℤ[q±1]. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `P_zero_eq_one` | degenerate | P 0 is the unit of the algebra. |
| `mul_P_one_one` | computation | P′₁P′₁=({2}!/{1}!²)P′₂+({2}!/{1}!)P′₁; the coefficients change upon tilde rescaling. |
| `twistElement_not_mem` | non-example | The twist element lies in the completion and not in the algebra, so the completion step is necessary. |

**Acceptance:**

- P_0 is the unit, so P contains the coefficient ring.
- The structure constants are Laurent polynomials, so P is an algebra over the Laurent polynomial ring and not merely over its fraction field.
- The completion contains elements that are infinite sums, such as the twist element, which do not lie in P itself.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §8.1, p. 28, color algebra and its completion. This fixed-version locus supplies the algebra spanned by the cyclotomic elements and its completion. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Integrality and divisibility for algebraically split 0-framed links

**Identifier:** `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`. **Kind:** theorem. **Mathematical status:** proved-source.

For an m-component algebraically split zero-framed L, colors x_i∈P_(k_i), and k=max_i k_i, J_L(x₁,…,x_m) belongs to ({2k+1}_(q,k+1)/{1}_q)ℤ[q±1], where {a}_q=q^a−1 and {a}_(q,b)=∏_(j=0)^(b−1){a−j}_q. The empty link has value 1 separately. Consequently the multilinear map extends continuously P̂^m→ℤ[q]^ℕ, the Habiro ring.

**Proof/construction route:**

1. Apply universal even integrality and the strengthened quantum-trace divisibility to the largest filtration index.
2. Use Habiro Theorem 8.2’s explicit ideal, not merely unspecified Laurent integrality.
3. Show its generators are cofinal with cyclotomic factorial ideals, giving the continuous extension (Corollary 8.3).

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/algebra-P-and-completion`, `ArithmeticQuantumTopology:QT.1/universal-invariant-integrality`, `ArithmeticQuantumTopology:QT.2/quantum-trace-integrality`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`.

**Acceptance:**

- For the unknot with colour in the k-th step the value is divisible by the stated factor, which is the one-component case.
- The divisibility fails for links that are not algebraically split, which is why the hypothesis is present.
- The theorem gives the convergence of the surgery sum used to define the unified invariant.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Theorem 8.2 and Corollary 8.3, §8.2, p. 29. This fixed-version locus supplies integrality and divisibility for algebraically split 0-framed links. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Quantum traces of the integral form in cyclotomic colours are integral

**Identifier:** `ArithmeticQuantumTopology:QT.2/quantum-trace-integrality`. **Kind:** lemma. **Mathematical status:** proved-source.

For x∈U_q^ev and y∈P, tr_q^y(x) lies in ℤ[q±1]. Both the even form and the tilde-normalized ℤ[q±1] color lattice are necessary hypotheses of the stated theorem.

**Proof/construction route:**

1. Compute on PBW x and the tilde P′ basis.
2. Use the divided-power action and q-binomial integrality.
3. Extend linearly over the actual ground ring ℤ[q±1].

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.2/algebra-P-and-completion`, `ArithmeticQuantumTopology:QT.2/finite-free-colors`.

**Acceptance:**

- The trace of the unit in the colour P_0 is 1.
- The trace of a basis monomial with mismatched degrees vanishes, which is the vanishing that makes the computation finite.
- The lemma fails for colours outside the algebra P, where denominators appear, so the restriction on colours is necessary.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Lemma 8.5, §8.3, p. 29; proof in §8.4, pp. 30–31. This fixed-version locus supplies quantum traces of the integral form in cyclotomic colours are integral. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Each coloured Jones polynomial is determined modulo an explicit ideal by the earlier ones

**Identifier:** `ArithmeticQuantumTopology:QT.2/coloured-jones-determination`. **Kind:** theorem. **Mathematical status:** proved-source.

For a zero-framed knot and n≥1, the values J_K(V₀),…,J_K(V_(n−1)) determine a₀,…,a_(n−1) exactly and determine J_K(V_n) modulo ({2n+1}_(2n)) in ℤ[v±1]. The new term has coefficient {2n+1}_(2n+1)/{1}={2n+1}_(2n). This is a finite triangular consequence, not reconstruction of a knot from its invariants.

**Proof/construction route:**

1. Solve the triangular color system successively in ℚ(v).
2. Use integrality of the extracted a_i.
3. For V_n reduce the last summand modulo its explicit integral factor.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`.

**Acceptance:**

- For n=1 the earlier value J_K(V₀)=1 determines a₀=1 and gives the stated congruence for J_K(V₁). The node’s domain is n≥1.
- The ideal is not the zero ideal, so the statement is a congruence and not an equality; a stronger reading would be false.
- The result is a consequence of integrality and not of the definition, so it fails for invariants without the cyclotomic expansion.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Proposition 6.5, §6.2, p. 22. This fixed-version locus supplies each coloured jones polynomial is determined modulo an explicit ideal by the earlier ones. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Finite truncations, integrality of coefficients, and the order of operations

**Identifier:** `ArithmeticQuantumTopology:QT.2/truncations-and-what-may-be-done-before-completion`. **Kind:** construction. **Mathematical status:** proved-source.

For N≥0 define Z_K,<N=Σ_(i<N)a_iσ_i in the polynomial center and, for a fixed ordinary color n, T_(K,n,N)=Σ_(i<min(N,n+1)) ({n+1+i}_(2i+1)/{1})a_i∈ℤ[v±1]. If N>n then T=J_K(V_n). Central truncations differ by a multiple of σ_N. They are not one scalar Laurent polynomial equal to every color. Evaluation of Habiro factorial-series truncations is instead the imported HC.2/HC.3 statement and must be applied to an element of that completion; no generic root cutoff for an unspecified Jones truncation is asserted.

**Proof/construction route:**

1. Truncate the unique central expansion.
2. Trace σ_i in the fixed V_n to obtain the finite sum and its exact range.
3. Keep the central σ-filtration and the scalar Habiro factorial filtration distinct.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`, `ArithmeticQuantumTopology:QT.2/completed-even-center`, `HabiroCyclotomicCompletions:HC.2/factorial-series`, `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Uses:**

- `ArithmeticQuantumTopology:QT.2/coloured-jones-determination`: Gives finite precision and exact small-color computations.
- `ArithmeticQuantumTopology:QT.7/the-example-ledger`: Separates computed color values from formal completion membership.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `cyclotomicTruncation` | constructor | Z_K,<N in the polynomial center. |
| `colorTruncation` | constructor | The finite scalar sum T_(K,n,N). |
| `cyclotomicTruncation_trunc` | compatibility | Z_K,<M−Z_K,<N is divisible by σ_N for M≥N. |
| `colorTruncation_exact` | compatibility | For N>n the trace truncation equals J_K(V_n). |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `cyclotomicTruncation_zero` | degenerate | At N=0 the truncation is 0, whereas the V₀ value becomes 1 at N=1. |
| `colorTruncation_V1` | computation | At N=2 the V₁ value is [2]+{3}{2}a₁. |
| `cyclotomicTruncation_compat` | compatibility | Increasing N changes only terms divisible by σ_N. |

**Acceptance:**

- At N=0 the truncation is 0, whereas the V₀ value becomes 1 at N=1.
- At N=2 the V₁ value is [2]+{3}{2}a₁.
- Increasing N changes only terms divisible by σ_N.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §6.2, pp. 21–22, finite color traces. This fixed-version locus supplies finite truncations, integrality of coefficients, and the order of operations. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### What a cyclotomic expansion is not

**Identifier:** `ArithmeticQuantumTopology:QT.2/an-expansion-is-a-theorem-about-an-invariant`. **Kind:** comparison. **Mathematical status:** proved-source.

HC.2 supplies generic factorial-series representations of elements of the completion. QT.2 proves a different theorem: the integral central σ-expansion of the universal invariant of a zero-framed knot, with uniquely characterized coefficients a_i=J_K(P″_i). A completion element need not be a knot invariant; evaluation at roots alone supplies neither these coefficients nor knot presentation independence. Link divisibility is the algebraically split zero-framed multilinear theorem, not a blanket knot-basis formula for all links.

**Proof/construction route:**

1. Compare the domains, bases and uniqueness statements.
2. Keep conventional reduced color polynomials distinct from Habiro’s a_i.
3. Use an explicit invariant comparison before attaching a generic completion element to a knot.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`, `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`, `HabiroCyclotomicCompletions:HC.2/factorial-series`.

**Acceptance:**

- The three points are stated and each is checkable against the other nodes.
- The distinction between the knot and the link statements is explicit.
- No node of this packet violates the third point.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §6.2, pp. 21–22; §8.2, p. 29. This fixed-version locus supplies what a cyclotomic expansion is not. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The Kashaev invariant, its identification with a colored Jones evaluation, and the periodic function it defines

**Identifier:** `ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals`. **Kind:** definition. **Mathematical status:** proved-source.

For N≥2 the Murakami–Murakami theorem identifies Kashaev ⟨K⟩_N with J^red_(K,N)(exp(2πi/N)), where color N means dimension N and the reduced polynomial is formed before specialization. For α=a/c in lowest terms, c>0, set 𝒥_K(α)=J^red_(K,c)(exp(−2πiα)); then 𝒥_K(−1/N)=⟨K⟩_N. It is one-periodic and Galois equivariant: σ_b𝒥_K(a/c)=𝒥_K(ba/c), gcd(b,c)=1. This does not mean that every value is fixed by every Galois automorphism. For 4₁, ⟨4₁⟩_N=Σ_(j=0)^(N−1)|(ζ_N;ζ_N)_j|² and the first six values are 1,5,13,27,46+2√5,89. The order-one extension is defined to be 1. Its root values come from the unified integral Habiro element H_K. The original Kashaev R-matrix presentation is used only by the MM comparison, not replanned as an additional carrier here.

**Proof/construction route:**

1. Use the reduced colored-Jones polynomial with dimension index N and MM’s R-matrix comparison.
2. Apply the cyclotomic field action to define the function at any primitive root.
3. Compute the figure-eight finite product formula, fixing the GZ minus sign in the rational argument.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/coloured-jones`, `ArithmeticQuantumTopology:QT.2/truncations-and-what-may-be-done-before-completion`, `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`, `ArithmeticQuantumTopology:QT.2/unified-kashaev-invariant`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6`: The asymptotic expansion is an expansion of this function along a sequence of rationals.
- `ArithmeticQuantumTopology:QT.7`: The quantum modularity conjecture is a statement about the behaviour of this function under the modular group.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `kashaevInvariant` | constructor | The element of the ring of integers with a root of unity adjoined attached to a knot and a positive integer. |
| `kashaevInvariant_eq_colouredJones` | equivalence | Its identification with the evaluation of the colored Jones polynomial in the corresponding colour. |
| `kashaevFunction` | constructor | 𝒥_K(a/c)=J^red_(K,c)(exp(−2πia/c)), c>0, is one-periodic and Galois equivariant; 𝒥_K(−1/N)=⟨K⟩_N. |
| `kashaevFunction_unique` | characterisation | The values at −1/N, periodicity and σ_b𝒥(a/c)=𝒥(ba/c) uniquely determine the rational function. Values need not be pointwise Galois fixed. |
| `figureEightKashaev` | example | The closed form and the first values for the figure-eight knot. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `kashaev_unknot` | degenerate | For the unknot the Kashaev invariant is one for every order, and the periodic function is constant. |
| `figureEightKashaev_small` | computation | The first six values for the figure-eight knot are one, five, thirteen, twenty-seven, forty-six plus twice the square root of five, and eighty-nine; a wrong normalisation would not reproduce them. |
| `kashaevFunction_periodic` | characterisation | The function satisfies that its value at an argument plus one equals its value at the argument; this is what makes the statement at minus one over the integer meaningful. |
| `kashaev_Galois_equivariance` | non-example | At order 5, the automorphism sending ζ₅ to ζ₅² changes 46+2√5 to 46−2√5; equivariance is not pointwise Galois invariance. |

**Acceptance:**

- The value ring is recorded.
- The uniqueness of the periodic function is proved from the Galois requirement.
- The standing example is given with explicit values.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §1, equations (1.1)–(1.2), p. 9, and rational extension on p. 10. This fixed-version locus supplies the kashaev invariant, its identification with a colored jones evaluation, and the periodic function it defines. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.
- [The colored Jones polynomials and the simplicial volume of a knot](https://arxiv.org/abs/math/9905075v1), Theorem 4.9, §4, p. 15. The final theorem directly compares Kashaev and colored Jones; the earlier Alexander=Jones theorem compares ADO instead.

### Finite free sl₂ colors

**Identifier:** `ArithmeticQuantumTopology:QT.2/finite-free-colors`. **Kind:** construction. **Mathematical status:** proved-source.

For n≥0, V_n is the rank n+1 finite free ℚ[[h]] highest-weight U_h-module of weight n, with basis F̃^(i)v₀, 0≤i≤n, and actions as in Habiro §5.1. For a finite free module V define tr_q^V(x)=Tr(ρ_V(K⁻¹x)). The representation algebra R_A=A[V₁] has V_m V_n=Σ_(j=0)^min(m,n) V_(m+n−2j); equivalently V_n=S_n(V₁) with Mathlib’s second-kind Chebyshev S₀=1,S₁=X,S_(n+2)=XS_(n+1)−S_n. Quantum dimension is [n+1], with [n]=(v^n−v⁻n)/(v−v⁻¹).

**Proof/construction route:**

1. Construct the highest-weight action in the ordered basis and check the algebra relations.
2. Use the pivotal closure to identify the quantum trace.
3. Prove the Clebsch–Gordan rule and compare the resulting monic recursion with Chebyshev.S.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.1/ribbon-structure`, `mathlib:Polynomial.Chebyshev.S`.

**Uses:**

- `ArithmeticQuantumTopology:QT.2/coloured-jones`: Provides colors and the trace used in the closure.
- `ArithmeticQuantumTopology:QT.2/p-basis`: Identifies the polynomial representation algebra.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `sl2Color` | constructor | V_n with rank n+1 and the fixed highest-weight basis. |
| `quantumTrace` | constructor | Tr(ρ(K⁻¹x)) on a finite free color. |
| `sl2RepRing` | constructor | R_A=A[X], X representing V₁. |
| `qInt` | data | The balanced Laurent quantum integer [n]. |
| `color_Chebyshev` | compatibility | V_n equals Chebyshev.S n evaluated at V₁. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `quantum_dimension_V0` | degenerate | qdim V₀=1. |
| `quantum_dimension_V1` | computation | qdim V₁=v+v⁻¹, not the constant 2. |
| `color_tensor_V1` | compatibility | V₁⊗V₁=V₂+V₀, so V₂=X²−1 rather than X². |

**Acceptance:**

- qdim V₀=1.
- qdim V₁=v+v⁻¹, not the constant 2.
- V₁⊗V₁=V₂+V₀, so V₂=X²−1 rather than X².

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §5.1, p. 18; §§5.3–5.4, pp. 19–20. This fixed-version locus supplies finite free sl₂ colors. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Completed even center

**Identifier:** `ArithmeticQuantumTopology:QT.2/completed-even-center`. **Kind:** construction. **Mathematical status:** proved-source.

Set C=(v−v⁻¹)²FE+vK+v⁻¹K⁻¹ and σ_n=∏_(i=1)^n(C²−q^i−2−q⁻i), σ₀=1. The center of the completed even image integral form is lim_n ℤ[q±1][C²]/(σ_n); every element has a unique expansion Σ a_n σ_n, a_n∈ℤ[q±1]. This is the even statement in the companion center theorem, distinct from the full center with coefficients in A+AC. It identifies the topology on the center used in the knot expansion.

**Proof/construction route:**

1. Compute the polynomial center from PBW and the quantum Casimir.
2. Use the induced e-power ideals and the monic σ_n basis to identify the completed center.
3. Restrict the graded q-form to its even part; use center theorem thm:38.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.1/universal-invariant-integrality`.

**Uses:**

- `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`: Identifies integral expansion coefficients of a bottom knot.
- `ArithmeticQuantumTopology:QT.2/dual-basis-pairing`: Supplies the central dual basis.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `quantumCasimir` | constructor | C with the stated normalization. |
| `sigma` | constructor | The monic central polynomial σ_n. |
| `evenCenterExpansion` | equivalence | An element of the completed even center has unique coefficients a_n∈ℤ[q±1]. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `sigma_zero` | degenerate | σ₀=1. |
| `sigma_one` | computation | σ₁=C²−q−2−q⁻¹. |
| `sigma_Vn_vanish` | compatibility | σ_i acts by zero on V_n when i>n, since C acts by v^(n+1)+v^(−n−1). |

**Acceptance:**

- σ₀=1.
- σ₁=C²−q−2−q⁻¹.
- σ_i acts by zero on V_n when i>n, since C acts by v^(n+1)+v^(−n−1).

**Sources:**

- [An integral form of the quantized enveloping algebra of sl2 and its completions](https://arxiv.org/abs/math/0605313v1), Theorem 11.2, §11, p. 31, even q-form center. This fixed-version locus supplies completed even center. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Jones normalization comparison

**Identifier:** `ArithmeticQuantumTopology:QT.2/jones-normalization-comparison`. **Kind:** comparison. **Mathematical status:** comparison-obligation.

For a zero-framed knot, the fundamental-color quantum invariant is unreduced: J_K(V₁)=[2]J^red_(K,2). Compare J^red_(K,2) to the GeometricTopology Jones V_K(t), V_U=1, t=A⁻⁴, using an explicitly fixed mirror/crossing convention and a proven substitution t=q or q⁻¹. The existence of such a comparison is a planned target; the source conventions read here do not fix which supplier crossing matches Habiro’s positive crossing, so the exact sign is a recorded gap, not silently selected.

**Proof/construction route:**

1. Import the bracket skein relation and writhe correction.
2. Compute the V₁ crossing eigenvalues and match the oriented skein normalization.
3. Check unknot, oriented trefoil/mirror and framing twist; this determines the substitution uniquely.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/coloured-jones`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`.

**Acceptance:**

- For a zero-framed knot, the fundamental-color quantum invariant is unreduced: J_K(V₁)=[2]J^red_(K,2). Compare J^red_(K,2) to the GeometricTopology Jones V_K(t), V_U=1, t=A⁻⁴, using an explicitly fixed mirror/crossing convention and a proven substitution t=q or q⁻¹. The existence of such a comparison is a planned target; the source conventions read here do not fix which supplier crossing matches Habiro’s positive crossing, so the exact sign is a recorded gap, not silently selected.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §5.2, pp. 19–20; §6.2, pp. 21–22; RT §6.1, p. 17. This fixed-version locus supplies jones normalization comparison. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Unified Kashaev invariant

**Identifier:** `ArithmeticQuantumTopology:QT.2/unified-kashaev-invariant`. **Kind:** construction. **Mathematical status:** proved-source.

For a zero-framed knot K with integral cyclotomic coefficients a_n(K)=J_K(P″_n), define H_K(q)=Σ_(n≥0) a_n(K)∏_(i=1)^n(2−q^i−q⁻ⁱ)=Σ a_n(K)(q;q)_n(q⁻¹;q⁻¹)_n in the scalar integral Habiro ring. This is evaluation C²↦4 of the central σ_n expansion; each product is (−1)^n q^(−n(n+1)/2)(q;q)_n², so the series converges in that ring. At a primitive root ζ of order N, evaluation equals the reduced dimension-N colored Jones polynomial J^red_(K,N)(ζ), and terms n≥N vanish. The unknot gives 1 and the order-one value is 1. This construction gives the unified Kashaev element without introducing the entire two-variable completion; that extension belongs to the recorded Part II.

**Proof/construction route:**

1. Apply the central coefficient theorem to evaluate σ_n at C²=4.
2. Factor the product as a Laurent unit times the square of the cyclotomic factorial; use the imported completion.
3. At ζ^N=1 compare C²=4 with the normalized V_(N−1) trace and use Habiro §7.1, e51; form the reduced polynomial before evaluation.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`, `ArithmeticQuantumTopology:QT.2/completed-even-center`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Uses:**

- `ArithmeticQuantumTopology:QT.7`: Supplies the specified knot arithmetic and modular comparisons.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `unifiedKashaevInvariant` | constructor | The displayed factorial-square series in the imported integral Habiro ring. |
| `unifiedKashaevInvariant_eval` | compatibility | At primitive order N its evaluation is J^red_(K,N)(ζ). |
| `unifiedKashaevInvariant_truncate` | compatibility | At order N only terms n<N contribute. |
| `unifiedKashaevInvariant_unknot` | simp | The unified unknot invariant equals 1. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `unifiedKashaev_unknot` | degenerate | The unknot gives the constant element 1. |
| `unifiedKashaev_order_one` | computation | At q=1 only a₀(K)=1 remains. |
| `unifiedKashaev_factorial_square` | compatibility | The n-th product equals (−1)^n q^(−n(n+1)/2)(q;q)_n², hence has at least twice the factorial divisibility. |

**Acceptance:**

- The unknot gives the constant element 1.
- At q=1 only a₀(K)=1 remains.
- The n-th product equals (−1)^n q^(−n(n+1)/2)(q;q)_n², hence has at least twice the factorial divisibility.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §7.1, pp. 24–26, θ₀ specialization. The scalar θ₀ specialization of the central expansion is the unified element, with the preceding displayed root comparison.

## QT.3 — Unified invariants of integral homology spheres

The twist element ω± is an integral series in the completed color lattice and its inverse is ω∓. Its unknot-pairing characterization is on the even representation subalgebra. Inserting ω^(−ε) in the zero-framed algebraically split link performs the ε-surgery twist; the opposite exponent pins the surgery sign.

For an admissible presentation with framings fᵢ, the invariant is the completed colored evaluation of the underlying zero-framed link at ω^(−fᵢ). No Gauss-sum denominator is added to this formula. The explicit divisibility and the refined calculus prove convergence and well-definedness. Split union gives connected-sum multiplicativity. Mirroring and negating framings reverses the ambient manifold orientation and sends q to q⁻¹; reversing component orientations alone is not that operation. The rational homology-sphere extension has a different surgery and coefficient problem, exhibited by the p-framed unknot.

**Coverage: planned.** Twist forms, exact surgery color, integral convergence, presentation independence and manifold operations. The precise open obligations are the gaps and supplier contracts referenced below; no stage is claimed closed.

**Remaining obligations:**

- ArithmeticQuantumTopology/G1: Geometric link/surgery contracts — The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.
- ArithmeticQuantumTopology/G2: Complete quantum algebra and integral core — Mathlib supplies ordinary Hopf/monoidal/rigid structures but no topological ribbon quantum algebra, its completed tensor powers, ribbon twist, quantum PBW basis, tilting quotient or integral clasp/core. The source-decomposed targets and APIs specify these objects; implementing them needs the quantum-specific completed tensor/continuity constructions over the cited pinned base-module completions, and the requested classical highest-weight interfaces. In particular, Habiro–Le §2.7’s universal J_T for arbitrary topological ribbon H and its finite-color trace compatibility are needed by general-core-filtration and general-wrt-comparison; the rank-one universal-sl2-invariant is insufficient. Construct the generic finite highest-weight colors V_λ and their quantum dimensions/traces from §3 and §8.2 before strong-kirby-colors; rank-one coloured-jones does not supply them.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here: Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery: Import oriented surgery with slope fμ+λ, H₁≅coker linking matrix, IHS iff det=±1, and ordinary Kirby/Fenn–Rourke presentation calculus. Supply stable diagonalization of the integral unimodular form and its realization by ordinary moves used in admissible-presentation existence. QT proves only the admissible band-slide/Hoste refinements.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group: Oriented manifold gluing, connected sum and orientation reversal with the surgery split-union comparison; the topological operation is imported before proving quantum multiplicativity. Supply the finite ordered oriented pseudo-3-manifold CW face-pairing carrier, punctured (co)homology, normal curves/relative chains and their Mayer–Vietoris gluing used in AK’s H₂ admissibility proof. These are GeometricTopology, Part II inputs; QT adds the charged positive angles, levels and analytic invariant.
- Import contract tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ: Import the classical enveloping algebra/PBW, highest-weight modules and rank-one calculations; root-space/root-datum inputs are the upstream layers 1–2. QT constructs the quantized Drinfeld–Jimbo algebra, its integral form and quantum PBW/core, rather than re-plan the classical theory.

**Planets:** Universal twist element, Unified homology-sphere invariant, Unified invariant well-definedness.

### The twist element in the completed cyclotomic algebra

**Identifier:** `ArithmeticQuantumTopology:QT.3/twist-element`. **Kind:** construction. **Mathematical status:** proved-source.

In P̂ define ω±=Σ_(n≥0)(±1)^n v^(±n(n+3)/2)P′_n, equivalently an integral ℤ[q±1] series in P̃′_n. These satisfy ω+ω−=1. For the Hopf pairing with the even representation subalgebra S_ℚ(v)=span{V_(2j)}, ⟨ω±,x⟩=J_(U±)(x). This characterization is only on even colors, not every element of the full representation algebra. In particular ⟨ω±,V₀⟩=1.

**Proof/construction route:**

1. Check integral coefficients after tilde rescaling and convergence in P̂.
2. Use the Hopf-link pairing formula on even colors to characterize ω±.
3. Prove their product is 1 by pairing with a separating family of even colors.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/algebra-P-and-completion`, `ArithmeticQuantumTopology:QT.2/coloured-jones`, `ArithmeticQuantumTopology:QT.2/finite-free-colors`.

**Uses:**

- `ArithmeticQuantumTopology:QT.3/twisting-theorem`: The twisting theorem computes the effect of a plus or minus one surgery as insertion of the twist element.
- `ArithmeticQuantumTopology:QT.3/definition-of-JM`: The surgery formula inserts one twist element for each component of the admissible presentation.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `omega` | data | omega is the twist element of the completed cyclotomic algebra, in the two sign variants. |
| `pairing_omega` | characterisation | The equality with the ±1-framed unknot pairing holds on S_ℚ(v), the even-color subalgebra. |
| `omega_mul_inv` | relation | The two twist elements are mutually inverse in the completed algebra. |
| `omega_mem_completion` | structure | The twist element lies in the completion of the cyclotomic algebra and not in the algebra itself. |
| `omega_coeff` | projection | The coefficients of the twist element in the cyclotomic basis are explicit Laurent polynomials. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `pairing_omega_V0` | computation | ⟨ω±,V₀⟩=1. |
| `omega_plus_mul_omega_minus` | characterisation | The product of the two twist elements is 1, which is the algebraic shadow of blowing up and then blowing down. |
| `omega_not_finite` | non-example | The twist element has infinitely many non-zero cyclotomic coefficients, so it is not an element of the uncompleted algebra. |

**Acceptance:**

- Pairing the twist element with the colour V_0 gives the value of the unknot with framing plus or minus one, which fixes the normalisation.
- The element is not a finite sum, so it genuinely lives in the completion.
- The two twist elements are inverse to each other in the completed algebra.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §9.1, Propositions 9.1–9.2, p. 33. This fixed-version locus supplies the twist element in the completed cyclotomic algebra. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Twisting theorem: surgery along a unit-framed unknotted component

**Identifier:** `ArithmeticQuantumTopology:QT.3/twisting-theorem`. **Kind:** theorem. **Mathematical status:** proved-source.

For algebraically split zero-framed L=L₁∪⋯∪L_m∪K with K unknotted and colors x_i∈P̂, surgery of sign ε=±1 along K satisfies J_(L_(K,ε))(x₁,…,x_m)=J_L(x₁,…,x_m,ω^(−ε)). The remaining link stays zero-framed in this algebraically split setting; the opposite exponent is essential.

**Proof/construction route:**

1. Use the paired-strand local twist formula and the even-color pairing of ω.
2. Track the convention that ±1 surgery gives a ∓1 geometric full twist.
3. Extend from finite colors by the continuous P̂ multilinear invariant.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.3/twist-element`, `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`, `ArithmeticQuantumTopology:QT.0/hoste-move`.

**Acceptance:**

- With no remaining components, surgery on the isolated ±1-framed unknot gives S³ and the formula specializes to J_U(ω^(−ε))=1.
- Applying the theorem twice with opposite signs returns the original invariant, matching that the two twist elements are inverse.
- The identity is an identity in the completed algebra and requires the divisibility theorem for convergence.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Theorem 9.4, §9.2, p. 34. This fixed-version locus supplies twisting theorem: surgery along a unit-framed unknotted component. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The unified invariant of an integral homology sphere

**Identifier:** `ArithmeticQuantumTopology:QT.3/definition-of-JM`. **Kind:** construction. **Mathematical status:** proved-source.

For an integral homology sphere M with admissible presentation L of component framings f_i=±1, let L⁰ be the underlying zero-framed link and set J_M=J_(L⁰)(ω^(−f₁),…,ω^(−f_m))∈ℤ[q]^ℕ. There is no product of unknot denominators in this formula. Convergence comes from QT.2’s algebraically split zero-framed multilinear extension, whose filtration generator at maximal color index tends to zero in the Habiro topology. Empty surgery gives 1.

**Proof/construction route:**

1. Choose an admissible presentation and erase its component framings.
2. Insert the inverse-sign twists in its finite approximants.
3. Use the continuous P̂^m→Habiro map to define the limit; normalize the empty link as 1.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.3/twisting-theorem`, `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`, `ArithmeticQuantumTopology:QT.0/admissible-framed-link`, `ArithmeticQuantumTopology:QT.0/refined-presentation-existence`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`.

**Uses:**

- `ArithmeticQuantumTopology:QT.3/JM-well-defined`: Well-definedness is the statement that this element does not depend on the admissible presentation.
- `ArithmeticQuantumTopology:QT.4/evaluation-theorem`: Evaluating the element at a root of unity gives the Witten-Reshetikhin-Turaev invariant.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `unifiedInvariantOfPresentation` | constructor | The exact formula J_(L⁰)(ω^(−f_i)) in the Habiro ring, with no division. |
| `unifiedInvariant_empty` | example | The empty admissible link gives the element 1. |
| `summable` | characterisation | The defining sum converges in the Habiro ring, by the divisibility theorem. |
| `unifiedInvariant_mirror` | compatibility | Reverse the orientation of the surgered 3-manifold by mirroring the surgery link and negating its framings: J_(−M)(q)=J_M(q⁻¹). Reversing component orientations alone is not this operation. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `unified_empty` | degenerate | The empty presentation gives 1, so the invariant of the 3-sphere is 1. |
| `unified_unknot_pm_one` | computation | The plus-one-framed unknot also presents the 3-sphere and must give 1; this is the first non-trivial instance of independence. |
| `unified_converges` | characterisation | The defining sum has terms divisible by higher and higher q-shifted factorials, so it converges in the Habiro ring; a formula without that divisibility would not define an element. |

**Acceptance:**

- The empty presentation gives the element 1, so the invariant of the 3-sphere is 1.
- The completion provides limits for the infinite series; individual invariants may already be Laurent polynomials, as J_(S³)=1 shows.
- The construction and its convergence guarantee have the stated algebraically split ±1-framed domain. Arbitrary framed links need a separately proved surgery formula and coefficient target; universal divergence outside this domain is not claimed.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §10.2, Theorem 10.2, p. 35. This fixed-version locus supplies the unified invariant of an integral homology sphere. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The unified invariant does not depend on the admissible presentation

**Identifier:** `ArithmeticQuantumTopology:QT.3/JM-well-defined`. **Kind:** theorem. **Mathematical status:** proved-source.

For an integral homology sphere M the element of the Habiro ring defined by the surgery formula does not depend on the choice of admissible framed link presenting M. Hence the assignment of that element to M is an invariant of integral homology spheres with values in the Habiro ring.

**Hypotheses:**

- M is an integral homology sphere
- the presentations compared are admissible

**Proof/construction route:**

1. By the refined Kirby calculus any two admissible presentations of M are related by isotopies and Hoste moves.
2. Check invariance of the surgery formula under an isotopy, which is immediate from invariance of the coloured invariant.
3. Check invariance under a single Hoste move, using the twisting theorem to compare the two sides.
4. Conclude by induction along the sequence of moves.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.3/definition-of-JM`, `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`, `ArithmeticQuantumTopology:QT.3/twisting-theorem`.

**Acceptance:**

- The empty link and the plus-one-framed unknot both give 1, matching that both present the 3-sphere.
- The proof uses the refined calculus and not the classical one, since the intermediate links of a classical sequence need not be admissible.
- The invariant of a connected sum is the product of the invariants, which is a consistency check on the normalisation.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Theorem 10.2, §10.2, p. 35; refined calculus in §10.1, pp. 34–35. This fixed-version locus supplies the unified invariant does not depend on the admissible presentation. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### First divisibility of the unified invariant

**Identifier:** `ArithmeticQuantumTopology:QT.3/JM-divisibility`. **Kind:** lemma. **Mathematical status:** proved-source.

For every integral homology sphere M the element J_M minus 1 is divisible in the Habiro ring by the product of the second and third cyclotomic-type factors, namely by (q squared minus 1)(q cubed minus 1) divided by (q minus 1).

**Hypotheses:**

- M is an integral homology sphere

**Proof/construction route:**

1. Expand the surgery formula and isolate the constant term, which is 1.
2. Bound the remaining terms by the divisibility theorem for algebraically split 0-framed links with colours in the first filtration step.
3. Combine the resulting factors and identify the product as the displayed one.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.3/JM-well-defined`, `ArithmeticQuantumTopology:QT.2/integrality-algebraically-split`.

**Acceptance:**

- For the 3-sphere the statement is trivial, since the difference is 0.
- Expanding the divisor at q=1 begins with 6(q−1), hence the coefficient of q−1 in J_M−1 is divisible by 6. Integrality of all Taylor coefficients instead follows from the integral Habiro Taylor map.
- The target here is exactly Lemma 10.3’s divisor. Habiro Proposition 12.14’s stronger q⁶−1 divisibility needs the additional order-six WRT input and is not claimed as an already recorded node.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Lemma 10.3, §10.3, p. 36; stronger Proposition 12.14, §12.4.2, p. 44. Lemma 10.3 states precisely the displayed first divisor. Proposition 12.14 adds q⁶−1 using an extra root-value argument.

### Multiplicativity under connected sum and behaviour under orientation reversal

**Identifier:** `ArithmeticQuantumTopology:QT.3/JM-connected-sum-and-orientation`. **Kind:** theorem. **Mathematical status:** proved-source.

The unified invariant is multiplicative under connected sum, so that the invariant of a connected sum is the product of the invariants, and the invariant of the 3-sphere is 1. Reversing the orientation of an integral homology sphere replaces the invariant by the image of the invariant under the ring involution sending q to its inverse.

**Hypotheses:**

- M and the second manifold are integral homology spheres

**Proof/construction route:**

1. Present the connected sum by the split union of admissible presentations of the two summands.
2. Use multiplicativity of the coloured invariant on split unions to factor the surgery formula.
3. For orientation reversal, take the mirror image of the presentation and track the effect on the twist elements and on the coloured invariant.
4. Identify the result with the ring involution of the Habiro ring.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.3/JM-well-defined`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`.

**Acceptance:**

- The invariant of the 3-sphere is 1, which is the empty case of multiplicativity.
- The invariant of the connected sum of a manifold with its own orientation reversal is the norm of the invariant under the involution.
- An invariant that failed multiplicativity would not evaluate to the Witten-Reshetikhin-Turaev invariants, which are multiplicative.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Proposition 12.1, §12.1, p. 39. This fixed-version locus supplies multiplicativity under connected sum and behaviour under orientation reversal. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The domain of the invariant, and what a larger domain would require

**Identifier:** `ArithmeticQuantumTopology:QT.3/rational-homology-spheres-are-not-in-this-domain`. **Kind:** comparison. **Mathematical status:** proved-source.

QT.3 defines J only for integral homology spheres. For the p-framed unknot with |p|>1, H₁≅ℤ/|p| and its link is not admissible. Rational homology-sphere extensions require separate localization/coefficient and surgery theorems; neither the integral target nor the present convergence proof transfers automatically. Dependence on root lifts for general WRT manifolds is a separate qualification, not an assertion that it persists for every non-integral example.

**Proof/construction route:**

1. Check the determinant obstruction in the explicit lens-space case.
2. Separate the source domain from the domain of conventional WRT.
3. Route extensions as separate coefficient theorems outside the present eight-stage scope.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.3/definition-of-JM`, `ArithmeticQuantumTopology:QT.0/surgery-presentation`, `ArithmeticQuantumTopology:QT.4/WRT-invariant-at-a-root`.

**Acceptance:**

- All three reasons are recorded.
- The extensions are attributed and their changed targets are stated.
- No node of this packet applies the invariant outside the domain.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §16.3, pp. 62–63, rational homology spheres. This paragraph discusses extensions with changed completion/coefficient targets; §10.3 only discusses the IHS formula.

## QT.4 — WRT values, Ohtsuki series and general Lie type

The sl₂ Kirby color is the finite sum over labels 0 through r−2. With a chosen primitive fourth-root lift, its surgery normalization divides by the **distinct** positive and negative unknot Gauss factors. At integral homology spheres the Habiro evaluation equals the WRT invariant and removes the lift ambiguity in the qualified theorem. Order one has the separate value one. Integrality and Galois equivariance follow from the integral coefficient ring, not from a rational replacement.

Determination uses the imported injective Taylor/evaluation statements with their limit-point hypotheses. It does not assert an unsupported converse for every arbitrary root set. Taylor expansion at one agrees with the Ohtsuki series through its odd-prime characterization and congruences. General Lie type adds weighted integral PBW/core data, the central order-two parity group and its amalgamated tensor grading, then strong Kirby colors at roots satisfying the stated order and nonzero-Gauss conditions. Full and projective WRT comparisons are qualified by this admissible set. Values at all other roots remain evaluations of the unified invariant; the existing WRT comparison does not automatically extend there.

**Coverage: planned.** Exact finite root colors/Gauss normalization, Ohtsuki characterization and concrete general Lie parity/core/filter/root comparison. The precise open obligations are the gaps and supplier contracts referenced below; no stage is claimed closed.

**Remaining obligations:**

- ArithmeticQuantumTopology/G1: Geometric link/surgery contracts — The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.
- ArithmeticQuantumTopology/G2: Complete quantum algebra and integral core — Mathlib supplies ordinary Hopf/monoidal/rigid structures but no topological ribbon quantum algebra, its completed tensor powers, ribbon twist, quantum PBW basis, tilting quotient or integral clasp/core. The source-decomposed targets and APIs specify these objects; implementing them needs the quantum-specific completed tensor/continuity constructions over the cited pinned base-module completions, and the requested classical highest-weight interfaces. In particular, Habiro–Le §2.7’s universal J_T for arbitrary topological ribbon H and its finite-color trace compatibility are needed by general-core-filtration and general-wrt-comparison; the rank-one universal-sl2-invariant is insufficient. Construct the generic finite highest-weight colors V_λ and their quantum dimensions/traces from §3 and §8.2 before strong-kirby-colors; rank-one coloured-jones does not supply them.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here: Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery: Import oriented surgery with slope fμ+λ, H₁≅coker linking matrix, IHS iff det=±1, and ordinary Kirby/Fenn–Rourke presentation calculus. Supply stable diagonalization of the integral unimodular form and its realization by ordinary moves used in admissible-presentation existence. QT proves only the admissible band-slide/Hoste refinements.
- Import contract tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ: Import the classical enveloping algebra/PBW, highest-weight modules and rank-one calculations; root-space/root-datum inputs are the upstream layers 1–2. QT constructs the quantized Drinfeld–Jimbo algebra, its integral form and quantum PBW/core, rather than re-plan the classical theory.
- Import contract tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition: Import the fixed simple-root datum, root-space decomposition and coroot sl₂ triples, with upstream RootSystems providing root/weight lattices and Weyl action. QT uses these as the Cartan/root input for its quantized presentation, not a second root-system development.

**Planets:** WRT evaluation theorem, Ohtsuki series, Unified Lie-type invariant, Strong Kirby color.

### The Witten-Reshetikhin-Turaev invariant at a root of unity

**Identifier:** `ArithmeticQuantumTopology:QT.4/WRT-invariant-at-a-root`. **Kind:** definition. **Mathematical status:** proved-source.

For r≥2 choose ξ primitive of order 4r and ζ=ξ⁴. Evaluate q^(1/4) at ξ. Let Ω_r=Σ_(i=0)^(r−2)[i+1]V_i and I_ζ(L)=ev_ξ J_L(Ω_r,…,Ω_r). For a surgery matrix with positive/negative inertia σ± define τ_(ζ,ξ)(M)=I_ζ(L)/(I_ζ(U+)^σ+ I_ζ(U−)^σ−), with both Gauss values nonzero. It is invariant under ordinary Kirby moves. For an integral homology sphere it is independent of ξ and written τ_ζ(M); for general closed M retain ξ. At ζ=1 the source defines τ₁(M)=1 by convention.

**Proof/construction route:**

1. Use Ω_r’s root-level handle-slide identity.
2. Check the two nonzero Gauss sums and use the signature correction for ±1 stabilization.
3. Descend through the imported surgery calculus; prove lift-independence only for integral homology spheres.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/coloured-jones`, `ArithmeticQuantumTopology:QT.1/tilting-negligible-quotient`, `ArithmeticQuantumTopology:QT.0/kirby-and-fenn-rourke-moves`, `ArithmeticQuantumTopology:QT.4/sl2-kirby-color`, `mathlib:IsPrimitiveRoot`.

**Uses:**

- `ArithmeticQuantumTopology:QT.4/evaluation-theorem`: Identifies root evaluations of J_M.
- `ArithmeticQuantumTopology:QT.7/the-example-ledger`: Records WRT values of explicitly named IHS surgeries.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `wrtWithLift` | constructor | The normalized surgery quotient retaining ζ and ξ. |
| `wrt` | constructor | The IHS invariant after lift-independence, and the ζ=1 convention. |
| `wrt_sphere` | simp | τ(S³)=1. |
| `wrt_kirby_invariant` | compatibility | Ω_r handles slides and the two Gauss factors cancel stabilizations. |
| `wrt_connected_sum` | functoriality | The normalized invariant is multiplicative under connected sum in the source normalization. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `wrt_sphere_one` | degenerate | Empty surgery gives 1. |
| `wrt_root_one` | computation | At ζ=1 the invariant is 1 by the declared convention, including r=1. |
| `wrt_stabilization_sign` | compatibility | A split +1 unknot cancels the positive Gauss factor and a −1 unknot cancels the negative factor; interchanging the two fails this test. |

**Acceptance:**

- Empty surgery gives 1.
- At ζ=1 the invariant is 1 by the declared convention, including r=1.
- A split +1 unknot cancels the positive Gauss factor and a −1 unknot cancels the negative factor; interchanging the two fails this test.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §11.1, equation (11.2), pp. 36–37. This fixed-version locus supplies the witten-reshetikhin-turaev invariant at a root of unity. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Evaluation of the unified invariant at a root of unity

**Identifier:** `ArithmeticQuantumTopology:QT.4/evaluation-theorem`. **Kind:** theorem. **Mathematical status:** proved-source.

Let M be an integral homology sphere and zeta a primitive r-th root of unity. Then the evaluation at zeta of the unified invariant of M equals the sl(2) Witten-Reshetikhin-Turaev invariant of M at zeta.

**Hypotheses:**

- M is an integral homology sphere
- zeta is a primitive root of unity of any order

**Proof/construction route:**

1. Evaluate the surgery formula for the unified invariant at the root, using that evaluation is a ring homomorphism from the Habiro ring to the ring of integers of the cyclotomic field.
2. Identify the evaluated twist elements with the finite Gauss sums appearing in the state sum.
3. Match the normalisations, using the auxiliary lemma on coloured invariants with colours in the representation ring at the root.
4. Conclude the equality for every root of unity, without restriction on the order.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.3/JM-well-defined`, `ArithmeticQuantumTopology:QT.4/WRT-invariant-at-a-root`, `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Acceptance:**

- Both sides are 1 on the 3-sphere.
- The theorem holds for every root of unity, including those of even and of non-prime-power order, which the earlier literature had excluded.
- As a corollary the Witten-Reshetikhin-Turaev invariant of an integral homology sphere is an algebraic integer in the cyclotomic field, and the family is Galois equivariant.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Theorem 11.1, §11.1, p. 36; proof in §11.3, pp. 37–38. This fixed-version locus supplies evaluation of the unified invariant at a root of unity. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Integrality and Galois equivariance of the quantum invariants

**Identifier:** `ArithmeticQuantumTopology:QT.4/integrality-and-galois`. **Kind:** theorem. **Mathematical status:** proved-source.

For every integral homology sphere M and every root of unity zeta, the Witten-Reshetikhin-Turaev invariant of M at zeta lies in the ring of integers generated by zeta, and for every field automorphism alpha of the cyclotomic field the invariant at the image of zeta is the image of the invariant.

**Hypotheses:**

- M is an integral homology sphere

**Proof/construction route:**

1. Apply the evaluation theorem to write the invariant as the image of an element of the Habiro ring.
2. Observe that the Habiro ring has coefficients in the integers, so evaluation lands in the ring of integers generated by the root.
3. For equivariance, note that an automorphism of the cyclotomic field commutes with evaluation of a fixed element of the Habiro ring.
4. Conclude both statements.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.4/evaluation-theorem`, `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Acceptance:**

- The invariant is an algebraic integer, not merely an algebraic number; this is a strictly stronger statement than the state sum gives directly.
- Galois equivariance relates the values at all primitive roots of the same order, so one value determines the others in that orbit.
- Outside the integral-homology-sphere domain these exact coefficient and root-lift conclusions require separately stated extension theorems. They are not asserted to fail for every rational homology sphere.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §1.3, pp. 3–4, integrality and Galois consequences. This fixed-version locus supplies integrality and galois equivariance of the quantum invariants. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The unified invariant is determined by the family of quantum invariants

**Identifier:** `ArithmeticQuantumTopology:QT.4/determination-by-WRT`. **Kind:** theorem. **Mathematical status:** proved-source.

For IHS M the root-value function τ_ζ(M) and J_M determine each other, by evaluation and Habiro injectivity. A subset Z of roots suffices when it has a Habiro limit point: some root has prime-power-order ratio with infinitely many members of Z. Over ℤ this is a sufficient injectivity condition; no converse is claimed for arbitrary infinite sets without that property. A finite set cannot suffice for generic Habiro elements: the product of its cyclotomic polynomials is a nonzero element killed by all its evaluations. A single rootwise Taylor expansion also determines J_M.

**Proof/construction route:**

1. Transport HC.4 injectivity along ev_ζ(J_M)=τ_ζ(M).
2. Use the exact limit-point condition, not Euclidean convergence of complex roots.
3. For the negative test use only the explicit finite cyclotomic-product kernel.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.4/evaluation-theorem`, `HabiroCyclotomicCompletions:HC.4/evaluation-at-individual-roots`, `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`.

**Acceptance:**

- Two integral homology spheres with the same quantum invariants at all roots have the same unified invariant.
- A finite set of roots does not determine a generic Habiro element: the nonzero product of its cyclotomic polynomials evaluates to zero there. No noninjectivity assertion for arbitrary infinite sets is part of this node.
- The statement is about the evaluation map on the Habiro ring, not about the manifolds, so it needs the ring-theoretic injectivity input.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Proposition 1.1, §1.2, p. 3; Propositions 12.2–12.3, §12.2, pp. 39–40. This fixed-version locus supplies the unified invariant is determined by the family of quantum invariants. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Taylor expansion at q equal to 1 is the Ohtsuki series

**Identifier:** `ArithmeticQuantumTopology:QT.4/ohtsuki-series`. **Kind:** theorem. **Mathematical status:** proved-source.

For IHS M, σ₁(J_M)∈ℤ[[q−1]] is the Ohtsuki series, characterized by its convergent p-adic evaluations equal to τ_ζ(M) at all odd prime-power roots. The identity uses the imported HC.3 re-expansion square and Habiro’s uniqueness lemma for the product of odd-prime evaluations of ℤ[[q−1]]. This is not convergence as a complex analytic power series.

**Proof/construction route:**

1. Apply the re-expansion square at ζ of odd prime-power order.
2. Substitute the WRT evaluation theorem.
3. Use the integral formal-series uniqueness characterization.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.4/evaluation-theorem`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`, `ArithmeticQuantumTopology:QT.4/ohtsuki-characterization`.

**Acceptance:**

- The constant term is 1, matching that the Ohtsuki series begins with 1.
- The coefficient of q−1 is 6λ(M), with λ the Casson invariant in Habiro §12.3.3’s orientation convention.
- The theorem identifies two objects defined by different means, so it is a comparison and not a definition.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Theorem 12.6, §12.3.2, p. 41; Casson normalization in §12.4.2, p. 44. This fixed-version locus supplies taylor expansion at q equal to 1 is the ohtsuki series. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The same theorem for every simple Lie algebra, with the restrictions it carries

**Identifier:** `ArithmeticQuantumTopology:QT.4/general-simple-lie-type`. **Kind:** theorem. **Mathematical status:** proved-source.

For each finite-dimensional simple complex g there is a unique invariant J_M^g∈ℤ[q]^ℕ of oriented integral homology spheres such that ev_ξ J_M^g=τ_M^g(ξ) for ξ∈Z_g and ev_ξ J_M^g=τ_M^(Pg)(ξ) for ξ∈Z_Pg. At any other root evaluation remains defined; using it to extend the conventional invariant is a definition. At ξ=1 it is 1. Uniqueness and rootwise Taylor determination use the integral Habiro rigidity theorem. The construction uses the concrete integral core and its degree-one K_n filtration, not only an unspecified abstract core.

**Proof/construction route:**

1. Build the abstract Hoste-invariant core formula using T_(−f_i).
2. Apply AL1/AL2 to place it in K̃₀=Habiro.
3. Use the admissible WRT comparison and an injective infinite family of root evaluations for uniqueness.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.4/general-core-filtration`, `ArithmeticQuantumTopology:QT.4/general-wrt-comparison`, `ArithmeticQuantumTopology:QT.0/refined-presentation-existence`, `HabiroCyclotomicCompletions:HC.4/evaluation-at-individual-roots`, `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`.

**Acceptance:**

- The admissible sets are named and the restriction on the order is recorded as a hypothesis.
- Evaluation at roots outside Z_g∪Z_Pg defines an extension of the root-value function; it is not asserted to be analytic continuation.
- The proof is identified with the abstract theorem of the ribbon layer.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), Theorem 8.1, §8.1, p. 90; Theorem 8.8, §8.5, p. 94. This fixed-version locus supplies the same theorem for every simple lie algebra, with the restrictions it carries. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Why the determination theorems do not transfer to other completions

**Identifier:** `ArithmeticQuantumTopology:QT.4/the-coefficient-ring-may-not-be-changed`. **Kind:** comparison. **Mathematical status:** proved-source.

The determination and integrality statements are over ℤ. Over ℚ the all-order cyclotomic completion is a product of rootwise completions, so its Taylor map at one root is not injective. QT does not transfer integral rigidity, Galois/integer target statements, or IHS coefficient results to localized, twisted or rational-homology-sphere completions without a comparison theorem.

**Proof/construction route:**

1. Import the coefficient-sensitive completion statements.
2. Compare the domains before transporting WRT evaluation or Taylor rigidity.
3. Use only the integral target of the general core construction.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.4/integrality-and-galois`, `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`.

**Acceptance:**

- The contrast with the rational completion is stated with both failures.
- The three prohibitions are stated and checkable.
- No node of this packet quotes a determination statement outside the integral completion.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §1.2, pp. 2–3, integral cyclotomic completion. This fixed-version locus supplies why the determination theorems do not transfer to other completions. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### sl₂ Kirby color

**Identifier:** `ArithmeticQuantumTopology:QT.4/sl2-kirby-color`. **Kind:** construction. **Mathematical status:** proved-source.

For the primitive 4r-th root ξ, r≥2, Ω_r=Σ_(i=0)^(r−2)[i+1]V_i is the sl₂ Kirby color. Its specialized link evaluations satisfy the handle-slide identity, and its ±1-unknot values are nonzero quadratic Gauss sums. The admissible range r−2 and the choice q^(1/4)=ξ are retained together; specializing an infinite generic representation sum is not this construction.

**Proof/construction route:**

1. Evaluate the finite pivotal color sum in the semisimple sl₂ quotient.
2. Use fusion/orthogonality to prove the slide identity.
3. Compute the two Gauss values, with their root lift, to prove nonvanishing.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/finite-free-colors`, `ArithmeticQuantumTopology:QT.2/coloured-jones`, `ArithmeticQuantumTopology:QT.1/tilting-negligible-quotient`, `mathlib:IsPrimitiveRoot`.

**Uses:**

- `ArithmeticQuantumTopology:QT.4/WRT-invariant-at-a-root`: Supplies surgery invariance and normalization.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `sl2KirbyColor` | constructor | The finite weighted color sum Ω_r. |
| `sl2KirbyColor_handleSlide` | compatibility | The colored surgery link value is unchanged by a handle slide. |
| `sl2KirbyColor_gauss_ne_zero` | characterisation | Both ±1 unknot values are nonzero at the specified lift. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `kirbyColor_r2` | degenerate | At r=2 the color is V₀. |
| `kirbyColor_r3` | computation | At r=3 the labels are V₀ and V₁ with the quantum-dimension coefficients. |
| `kirbyColor_no_top_weight` | non-example | The weight V_(r−1) is absent; its vanishing quantum dimension does not supply an extra simple color. |

**Acceptance:**

- At r=2 the color is V₀.
- At r=3 the labels are V₀ and V₁ with the quantum-dimension coefficients.
- The weight V_(r−1) is absent; its vanishing quantum dimension does not supply an extra simple color.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §11.1, pp. 36–37, colors and nonzero unknot normalizations. This fixed-version locus supplies sl₂ kirby color. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Ohtsuki characterization

**Identifier:** `ArithmeticQuantumTopology:QT.4/ohtsuki-characterization`. **Kind:** theorem. **Mathematical status:** proved-source.

The homomorphism ℤ[[q−1]]→∏_(p odd prime)ℤ_p[ζ_p] obtained by convergent evaluation q=ζ_p is injective. Consequently there is at most one integral formal series with a prescribed collection of these values; existence for WRT values follows from σ₁(J_M).

**Proof/construction route:**

1. For a series killed by every evaluation, induct on its first possible nonzero coefficient x_n.
2. Reduce modulo (ζ_p−1)^(n+1) to show p|x_n for every odd prime p.
3. An integer divisible by every odd prime is zero; repeat the induction.

**Direct prerequisites:** `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`.

**Acceptance:**

- The homomorphism ℤ[[q−1]]→∏_(p odd prime)ℤ_p[ζ_p] obtained by convergent evaluation q=ζ_p is injective. Consequently there is at most one integral formal series with a prescribed collection of these values; existence for WRT values follows from σ₁(J_M).

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), Lemma 12.7, §12.3.2, p. 42. This fixed-version locus supplies ohtsuki characterization. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Integral core filtration

**Identifier:** `ArithmeticQuantumTopology:QT.4/general-core-filtration`. **Kind:** construction. **Mathematical status:** proved-source.

Let G be the Habiro–Le central parity extension of Y×Y/2Y, retaining its central element v̇ of order two and tensor products over that element. On U_q, deg_G(v)=v̇, deg_G(K_α)=K̇_α, deg_G(E_α)=v̇^d_α ė_α and deg_G(F_α)=ė_α⁻¹K̇_α; use the exact §6 relations rather than an abelian root grading. Set K_n=(X_ℤ^ev)^⊗n∩[(U_A^ev)^⊗n]_1, F_kK_n=(q;q)_k K_n and K̃_n its image completion inside U_h completed⊗n. Then K₀=ℤ[q±1], K̃₀=Habiro; J_T∈K̃_n for zero-linking-matrix bottom tangles and tensor twist forms map K̃_n to K̃₀.

**Proof/construction route:**

1. Before AL1, construct the generic J_T from the topological ribbon Hopf bead rules (Habiro–Le §2.7) and its finite-color trace compatibility; this missing general-type interface is explicitly G2, not supplied by universal-sl2-invariant.
2. Use the even core and degree-one intersection to exclude unwanted square roots.
3. Stability and the integral Borromean computation establish AL1.
4. Twist images lie in Ã∩ℚ(q)=ℤ[q±1]; continuity gives AL2 and K̃₀.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/general-integral-core`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `ArithmeticQuantumTopology:QT.4/general-parity-grading`, `ArithmeticQuantumTopology:QT.1/topological-ribbon-hopf-algebras`, `ArithmeticQuantumTopology:QT.1/bottom-tangle`.

**Uses:**

- `ArithmeticQuantumTopology:QT.4/general-simple-lie-type`: Makes the abstract core invariant integral.
- `ArithmeticQuantumTopology:QT.4/general-wrt-comparison`: Provides finite approximants for root evaluation.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `generalIntegralKn` | constructor | The displayed graded intersection K_n. |
| `generalKnFiltration` | constructor | F_k=(q;q)_kK_n. |
| `generalCompletedKn` | constructor | Image completion inside the h-adic ambient tensor power. |
| `generalKn_twist` | compatibility | The tensor product of sign twist forms maps K̃_n to the ordinary integral Habiro ring. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `generalKn_zero` | degenerate | K₀=ℤ[q±1] and K̃₀=Habiro. |
| `generalKn_degree_one` | non-example | An odd power of v alone has central degree v̇ and is excluded from K₀. |
| `generalKn_filtration_vanishes` | compatibility | At a q-root of order r, (q;q)_k vanishes for k≥r, compatible with the Habiro completion. |

**Acceptance:**

- K₀=ℤ[q±1] and K̃₀=Habiro.
- An odd power of v alone has central degree v̇ and is excluded from K₀.
- At a q-root of order r, (q;q)_k vanishes for k≥r, compatible with the Habiro completion.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), §§7.1–7.3, pp. 75–77; Proposition 7.1 and Theorem 7.3. This fixed-version locus supplies integral core filtration. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Quantum parity grading

**Identifier:** `ArithmeticQuantumTopology:QT.4/general-parity-grading`. **Kind:** definition. **Mathematical status:** proved-source.

G is generated by a central v̇ of order two, commuting K̇_α of order two and invertible ė_α, with K̇_α ė_β=v̇^((α,β))ė_βK̇_α and ė_αė_β=v̇^((α,β))ė_βė_α. Its quotient by ⟨v̇⟩ is Y×Y/2Y. The tensor grading amalgamates the central v̇ in all factors; G^⊗0=⟨v̇⟩. The generator degrees are deg(v)=v̇, deg(K_±α)=K̇_α, deg(E_α)=v̇^(d_α)ė_α and deg(F_α)=ė_α⁻¹K̇_α. These define the grading over ℂ(q); the even subalgebra is the sum over G^ev. This carries integral square-root cancellation information unavailable from ordinary Y-grading.

**Proof/construction route:**

1. Present G with the central commutator relations.
2. Check the quantum relations are homogeneous with the source generator degrees.
3. Use the amalgamated tensor grading and degree-one part in K_n.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/general-drinfeld-jimbo-algebra`.

**Uses:**

- `ArithmeticQuantumTopology:QT.4/general-core-filtration`: The degree-one intersection ensures integral q-coefficients.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `QuantumParityGroup` | constructor | The central parity extension with the displayed presentation. |
| `quantumParityDegree` | data | The source G-degree on PBW generators. |
| `tensorParityGroup` | constructor | G^⊗n with the central order-two elements identified. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `parity_v_square` | computation | The degree of v²=q is 1. |
| `parity_K_square` | computation | The degree of K_α² is 1. |
| `parity_tensor_zero` | degenerate | G^⊗0 is the two-element central group, not a trivial group. |

**Acceptance:**

- The degree of v²=q is 1.
- The degree of K_α² is 1.
- G^⊗0 is the two-element central group, not a trivial group.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), §§6.1–6.3, pp. 68–70, noncommutative grading. This fixed-version locus supplies quantum parity grading. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Strong Kirby colors

**Identifier:** `ArithmeticQuantumTopology:QT.4/strong-kirby-colors`. **Kind:** definition. **Mathematical status:** proved-source.

For g, let D=|X/Y|, d=d_max, r=ord ξ, and choose ζ with ζ^(2D)=ξ (ζ evaluates v^(1/D)). The half-open weight box P_ζ consists of λ=Σ k_iω_i, 0≤k_i<2rD. Ω^g_ζ=Σ_(λ∈Pζ)qdim(V_λ)V_λ; Ω^(Pg)_ζ restricts λ to Y. A strong Kirby color satisfies the source strong handle-slide condition, nonzero ±1 Gauss values, and r>d(h∨−1). Define Z′_g,Z′_Pg as admissible lifts, and Z_g,Z_Pg as their images ξ. Odd r supplies projective admissibility and even r supplies full admissibility under that bound; individual lifts with the same ξ can differ. No semisimplicity at all these roots is asserted.

**Proof/construction route:**

1. Construct the finite weight box in the weight lattice.
2. Use the general finite highest-weight quantum colors and traces (§§3,8.2), then the strong sliding identities of §8.4. The color construction/trace interface is explicitly G2, not the rank-one colored-Jones construction.
3. Check the nonzero Gauss sums before taking the root image; use Appendix C’s corrected complement of the vanishing table.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.1/general-drinfeld-jimbo-algebra`, `mathlib:IsPrimitiveRoot`, `ArithmeticQuantumTopology:QT.1/reshetikhin-turaev-functor`, `ArithmeticQuantumTopology:QT.1/topological-ribbon-hopf-algebras`.

**Uses:**

- `ArithmeticQuantumTopology:QT.4/general-simple-lie-type`: Specifies exactly which conventional RT values are unified.
- `ArithmeticQuantumTopology:QT.4/general-wrt-comparison`: Provides the admissible finite colors.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `StrongKirbyColor` | structure | The finite color with root bound, sliding condition and nonzero Gauss factors. |
| `admissibleRootLifts` | constructor | Z′_g and Z′_Pg retain the root lift ζ. |
| `admissibleQRoots` | constructor | Images under ζ↦ζ^(2D). |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `kirby_root_bound` | non-example | A root with r≤d(h∨−1) does not meet the declared strong-color bound. |
| `kirby_gauss_vanishing_Aodd` | non-example | For A_ℓ, ℓ odd, ord ζ≡2 mod4 gives a vanishing full Gauss sum, so this lift is excluded. |
| `kirby_root_one_convention` | degenerate | At ξ=1 τ is defined as 1 separately; the strong-color root bound does not silently include it. |

**Acceptance:**

- A root with r≤d(h∨−1) does not meet the declared strong-color bound.
- For A_ℓ, ℓ odd, ord ζ≡2 mod4 gives a vanishing full Gauss sum, so this lift is excluded.
- At ξ=1 τ is defined as 1 separately; the strong-color root bound does not silently include it.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), §§8.4–8.5, pp. 92–94; Appendix C, pp. 112–117, with E5 correction. This fixed-version locus supplies strong kirby colors. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### General Lie-type WRT comparison

**Identifier:** `ArithmeticQuantumTopology:QT.4/general-wrt-comparison`. **Kind:** theorem. **Mathematical status:** proved-source.

At each ξ∈Z_g or Z_Pg, choose a corresponding strong Kirby lift ζ. On IHS surgery links the normalized finite color quotient using Ω^g_ζ or Ω^(Pg)_ζ is independent of the admissible lift and equals ev_ξ J_M^g. The quotient divides by separate J_(U+)(Ω)^σ+ and J_(U−)(Ω)^σ−, both nonzero. Equality outside these admissible sets is not claimed for an existing conventional RT invariant.

**Proof/construction route:**

1. Approximate the integral core twists in the cyclotomic filtration.
2. Use the root-annihilating ideals and the specialized quantum traces to compare with the finite strong Kirby colors.
3. Cancel the distinct sign Gauss factors and prove lift-independence on IHS presentations.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.4/strong-kirby-colors`, `ArithmeticQuantumTopology:QT.4/general-core-filtration`, `ArithmeticQuantumTopology:QT.0/refined-kirby-calculus`, `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Acceptance:**

- At each ξ∈Z_g or Z_Pg, choose a corresponding strong Kirby lift ζ. On IHS surgery links the normalized finite color quotient using Ω^g_ζ or Ω^(Pg)_ζ is independent of the admissible lift and equals ev_ξ J_M^g. The quotient divides by separate J_(U+)(Ω)^σ+ and J_(U−)(Ω)^σ−, both nonzero. Equality outside these admissible sets is not claimed for an existing conventional RT invariant.

**Sources:**

- [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2), Theorem 8.8, §8.5, p. 94; comparison to Theorem 8.1, p. 90. This fixed-version locus supplies general lie-type wrt comparison. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

## QT.5 — Hyperbolic geometry, Bloch classes and regulators

An ordered ideal tetrahedron uses Neumann’s cross-ratio convention and the three shapes z, 1/(1−z), 1−1/z, whose product is −1. A complete cusped triangulation has actual oriented face pairings, edge incidences and peripheral completeness equations. Arbitrary incidence matrices or a positive shape assignment do not supply that geometric carrier.

Flattenings live on the cut ℤ²-cover, with p and q shifts by two across the cuts and four parity components. Both logarithmic parameters are needed to recover the shape. The extended pre-Bloch group imposes the distinguished lifted five-term component and transfer relations; deleting transfer retains extra two-torsion. The extended Bloch group is the logarithmic wedge kernel. Strong flattenings also impose parity and normal-path conditions, including vertex-star conditions. They give a choice-independent geometric class for the ordered triangulation; the unordered variant can lose C₆ information.

The extended Rogers map descends to ℂ/π²ℤ and computes iVol−CS. Its comparison with other complex-volume conventions retains conjugation, signs and periods. Forgetting to an ordinary Bloch class uses the exact boundary convention supplied by K3BlochGroups. A verified algebraic shape field allows a field-valued class after boundary cancellation. The figure-eight ordinary class is 2[exp(πi/3)]; it is not a claim that twice the principal flattening is the full extended class.

**Coverage: planned.** Cut cover, lifted five-term and transfer quotient, extended kernel, strong ordered flattenings, Rogers class, complex volume and number-field comparison. The precise open obligations are the gaps and supplier contracts referenced below; no stage is claimed closed.

**Remaining obligations:**

- ArithmeticQuantumTopology/G4: Cusped ordered geometry and trace-field descent — Supplier closed Mostow material alone does not provide complete cusped ideal face-pairings, EP/refinement connectivity, strong ordered hybrid flattenings or geometric NZ local rigidity. A general claim that the signed Bloch class descends to the invariant trace field needs a separate algebraicity/boundary argument; only the explicitly checked figure-eight field example is used without it.
- ArithmeticQuantumTopology/G5: Integral and extended Bloch comparisons — Neumann’s factor-two ordinary boundary, exterior kernel, antisymmetric tensor and published CGZ convention must be compared with the named supplier maps. The full extended group needs its actual cut cover, lifted component, transfer relations and strong normal-path conditions. A Suslin lift retains torsion ambiguity; no canonical lift follows from a B̂(ℂ) class.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume: Extend the closed geometric/Mostow material to ideal ordered face-pairing triangulations of complete finite-volume cusped hyperbolic 3-manifolds: developing maps, peripheral completeness, Mostow–Prasad rigidity, ordered hybrid refinements, Epstein–Penner canonical cell decompositions, connectivity of their regular refinements (allowing flat nondegenerate tetrahedra), and geometric local rigidity/nonzero NZ Hessian. Keep this distinct from a bare matrix gluing solution or the closed-only Mostow theorem.
- Import contract Polylogarithms:P.2: Supply the oriented ideal-tetrahedron identity Vol(z)=D(z), its ordering/sign convention and comparison with the weight-two regulator on the field Bloch class. QT imports that identity and assembles the flattened signed sum; it does not reprove tetrahedron volume.
- Import contract K3BlochGroups:V.3: Compare Neumann’s ker(2z∧(1−z)) convention with the supplier exterior kernel, antisymmetric-tensor Bloch group and published CGZ convention, retaining integral two-torsion. Supply the exact map for the verified geometric Σ ε[z] over a number field; do not identify all conventions integrally.
- Import contract K3BlochGroups:V.4: Use the precise Suslin exact sequence to compare a verified ordinary geometric Bloch class with K₃^ind; identify the torsion ambiguity. The extended group H₃(PSL₂(ℂ)^δ) and complex regulator are QT-owned and do not follow merely from ordinary Suslin.
- Import contract K3BlochGroups:V.6: Import the Suslin lift fibre and torsion bookkeeping for a field-valued geometric Bloch class. A canonical K₃ lift is not inferred from numerical shapes or a unique B̂(ℂ) manifold class.

**Planets:** Complex-volume regulator, Extended pre-Bloch group, Extended Bloch group, Strong flattening, Extended Rogers regulator.

### Oriented ideal tetrahedra and their shape parameters

**Identifier:** `ArithmeticQuantumTopology:QT.5/ideal-tetrahedron-and-shape`. **Kind:** definition. **Mathematical status:** proved-source.

The supplier’s ordered ideal hyperbolic tetrahedron with four distinct boundary vertices has cross-ratio z∈ℂ∖{0,1}, with ordering normalized by (∞,0,1,z)↦z. Its companions are z′=1/(1−z), z″=1−1/z and zz′z″=−1. Im z>0 is positive orientation; real nondegenerate shapes are flat and may occur in refinement arguments. QT records the shape coordinate interface and imports the geometric carrier/isometry classification; it does not construct hyperbolic space again.

**Proof/construction route:**

1. Use the ordered supplier carrier and Möbius normalization.
2. Compute the companion coordinate changes and orientation sign.
3. Keep flat nondegenerate simplices available for the Neumann/EP refinement route.

**Direct prerequisites:** `mathlib:Complex.log`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`.

**Uses:**

- `ArithmeticQuantumTopology:QT.5/combinatorial-flattening`: A flattening is a choice of logarithms of the three shape parameters with a linear condition.
- `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`: The gluing equations are polynomial equations in the shapes of the tetrahedra of a triangulation.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `IdealTetrahedron` | structure | An ordered oriented ideal tetrahedron, recorded by its shape parameter in the complement of 0 and 1. |
| `shape` | data | shape T is the cross-ratio of the four ideal vertices in the chosen order. |
| `shape_companions` | characterisation | The three edge parameters are z, 1/(1-z) and 1-1/z, and their product is minus 1. |
| `isometry_iff_shape_eq` | characterisation | Two ordered ideal tetrahedra are orientation-preserving isometric if and only if their shapes agree. |
| `positively_oriented` | relation | A tetrahedron is positively oriented exactly when the imaginary part of its shape is positive. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `shape_regular` | computation | The regular ideal tetrahedron has shape the primitive sixth root of unity; a convention giving a different value is a different cross-ratio ordering. |
| `shape_product` | computation | The product of the three edge parameters is minus 1, not 1; this pins the convention. |
| `shape_excludes_degenerate` | non-example | Shapes 0 and 1 are excluded, so a degenerate configuration is not an ideal tetrahedron. |

**Acceptance:**

- The regular ideal tetrahedron has shape the primitive sixth root of unity, and its three parameters coincide.
- An even permutation of the vertices permutes the three parameters cyclically, and an odd one inverts them.
- The shape 0 or 1 corresponds to a degenerate tetrahedron and is excluded.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), §3, pp. 420–421 (PDF pp. 8–9), ideal simplex parameters. This fixed-version locus supplies oriented ideal tetrahedra and their shape parameters. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Gluing and completeness equations of an ideal triangulation

**Identifier:** `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`. **Kind:** definition. **Mathematical status:** proved-source.

For an actual ideal face-pairing triangulation of the interior of a compact oriented 3-manifold with torus boundary, shapes give edge products and peripheral products from the incidence data. A positive geometric solution has every z_j in the upper half-plane, each edge product 1 with total dihedral angle 2π, and peripheral similarity multiplier 1 for both generators of each cusp (parabolic/unipotent cusp holonomy in the developing representation, whose translational part is generally nontrivial). Edge products alone are insufficient. Geometric realization, ideal triangulation existence and finite-volume cusped rigidity are requested from GeometricTopology, Part II. A matrix equation alone is called linear gluing data, not an ideal triangulation.

**Proof/construction route:**

1. Import the face pairings, manifold/cusp recognition and peripheral curves.
2. Extract shape incidences and logarithmic angle equations.
3. Use the supplier developing-map and completeness theorem; then compute signed simplex volume using the imported tetrahedron formula.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/ideal-tetrahedron-and-shape`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`.

**Uses:**

- `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`: The Bloch element is the sum of the shapes of a solution, and its well-definedness rests on the edge equations.
- `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`: The comparison of the regulator with volume and Chern-Simons is stated for a solution of these equations.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `IdealTriangulation` | structure | Import an actual oriented cusped-manifold ideal face-pairing triangulation, with peripheral curves and nondegenerate shapes satisfying all edge and completeness equations; an arbitrary matrix equation is not this carrier. |
| `edgeEquation` | relation | At each edge, the product of the incident edge parameters is 1 and the sum of their logarithms is two pi i. |
| `cuspEquation` | relation | At each cusp, each generator has similarity multiplier 1; its parabolic translation need not vanish. |
| `isGeometricSolution` | characterisation | The conjunction includes positive shapes, edge angle equations and both peripheral completeness equations. |
| `volume_eq_sum` | compatibility | The volume of the structure is the sum of the volumes of its tetrahedra. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `figure_eight_solution` | computation | The two-tetrahedron triangulation of the figure-eight knot complement has the solution with both shapes the primitive sixth root of unity; this is the running example. |
| `edge_equation_log_form` | characterisation | The logarithmic edge equation fixes the branch: the product form alone does not, and the two differ by multiples of two pi i. |
| `not_geometric_of_negative_imaginary` | non-example | A solution with a shape of negative imaginary part is not geometric, so the positivity condition is not redundant. |
| `complete_cusp_nonidentity_translation` | non-example | The map w↦w+1 is a nonidentity parabolic with multiplier 1. Completeness may admit this holonomy; a test requiring the identity transformation rejects a complete cusp. |

**Acceptance:**

- For the figure-eight knot complement with its two-tetrahedron triangulation the equations have the solution with both shapes the primitive sixth root of unity.
- A shape with negative imaginary part fails the declared positive-geometric-solution predicate. Signed or flat refinement triangulations of a complete oriented manifold are outside this positivity test and are not ruled out.
- The volume of the resulting structure is the sum of the volumes of the ideal tetrahedra, which is the identity the regulator comparison uses.

**Sources:**

- [Perturbative invariants of cusped hyperbolic 3-manifolds](https://arxiv.org/abs/2305.14884v2), §2.3, pp. 8–9, regular geometric triangulations. This fixed-version locus supplies gluing and completeness equations of an ideal triangulation. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Combinatorial flattenings and the extended pre-Bloch group

**Identifier:** `ArithmeticQuantumTopology:QT.5/combinatorial-flattening`. **Kind:** definition. **Mathematical status:** proved-source.

On Neumann’s cut-plane ℤ²-cover of ℂ∖{0,1}, a point (z;p,q) determines (w₀,w₁,w₂)=(log z+pπi,−log(1−z)+qπi,log(1−z)−log z−(p+q)πi). Their sum is zero. Crossing the negative-real cut changes p by 2 and crossing the >1 cut changes q by 2; the cover has four parity components. The triple determines the point of the cover using both w₀ and w₁, not w₀ alone. Strong flattenings of triangulations impose additional parity and normal-path conditions, separately planned.

**Proof/construction route:**

1. Construct the cut cover with its boundary-side identifications.
2. Define the log parameters and compare the three-edge convention.
3. Recover z from e^w₀ and e^(−w₁) up to sign simultaneously, then recover the sheet.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/ideal-tetrahedron-and-shape`, `mathlib:Complex.log`.

**Uses:**

- `ArithmeticQuantumTopology:QT.5/extended-pre-bloch`: Supplies the generators of the extended group.
- `ArithmeticQuantumTopology:QT.5/strong-flattening`: Supplies the simplex log/parity data.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `Flattening` | structure | A point on the cut ℤ²-cover and its log parameters. |
| `flattening_sum_zero` | simp | w₀+w₁+w₂=0. |
| `flatteningEquiv` | equivalence | The cover is in bijection with combinatorial flattening triples. |
| `flattening_cover_transition` | compatibility | Cut transitions shift p or q by two, preserving the appropriate logarithmic parameters. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `flattening_zero_zero` | degenerate | On the chosen cut-plane chart p=q=0 gives (log z,−log(1−z),log(1−z)−log z). |
| `flattening_determines_shape` | characterisation | Equality of the full w-triples determines z; equality of w₀ alone is insufficient. |
| `flattening_regular` | computation | For z=exp(πi/3) and p=q=0 the log parameters are (πi/3,πi/3,−2πi/3), summing to zero. |

**Acceptance:**

- On the chosen cut-plane chart p=q=0 gives (log z,−log(1−z),log(1−z)−log z).
- Equality of the full w-triples determines z; equality of w₀ alone is insufficient.
- For z=exp(πi/3) and p=q=0 the log parameters are (πi/3,πi/3,−2πi/3), summing to zero.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), Definition 3.1 and Lemma 3.2, §3, pp. 421–422 (PDF pp. 9–10). This fixed-version locus supplies combinatorial flattenings and the extended pre-bloch group. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The flattening condition makes a two-three move an instance of the lifted five-term relation

**Identifier:** `ArithmeticQuantumTopology:QT.5/five-term-and-pachner`. **Kind:** lemma. **Mathematical status:** proved-source.

For five distinct ideal vertices, the alternating lifted five-shape relation is permitted iff the alternating sum of log parameters about each of their ten edges is zero. Consequently a compatible 2–3 Pachner move preserves the signed flattened-shape sum in P̂(ℂ); sheet changes also use the transfer relation. Nondegenerate vertices and the full log-edge compatibility are retained.

**Proof/construction route:**

1. Use the geometric edge-sum interpretation of Neumann’s lifted relation.
2. For the FT⁺ chart solve the integer sheet equations; extend along the distinguished lifted components.
3. Interpret the two/three tetrahedra as the two sides of the alternating boundary.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/extended-pre-bloch`, `ArithmeticQuantumTopology:QT.5/combinatorial-flattening`.

**Acceptance:**

- The classical five-term relation is recovered by forgetting the flattenings.
- Without the flattening condition the lifted relation fails, so the condition is not automatic.
- The lemma is what makes a two-three Pachner move on an ideal triangulation act trivially on the Bloch element.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), Definition 3.3 and Lemma 3.4, §3, pp. 423–424 (PDF pp. 11–12). This fixed-version locus supplies the flattening condition makes a two-three move an instance of the lifted five-term relation. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The extended Bloch element of a hyperbolic 3-manifold

**Identifier:** `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`. **Kind:** construction. **Mathematical status:** proved-source.

For an oriented complete finite-volume hyperbolic 3-manifold M with the ordered hybrid refinement and strong flattening specified above, β̂(M)=Σ_j ε_j[z_j;p_j,q_j] belongs to B̂(ℂ) and depends only on M. More generally the labelled ordered-cycle construction gives λ:H₃(PSL₂(ℂ)^δ;ℤ)→B̂(ℂ), and the signed sum depends only on the represented homology class. Changes of strong flattening, developing points and compatible refinement do not change the class. The ordinary β_F requires the separate verified field/boundary comparison; it is not produced by a diagram or numerical shapes alone.

**Proof/construction route:**

1. Use cancellation of logarithmic wedges from the edge and normal-path conditions.
2. Use lifted five-term, transfer and cycle relations to prove independence of flattening and representative.
3. For cusps use Neumann’s relative parabolic fundamental-class construction and ordered hybrid refinements.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/strong-flattening`, `ArithmeticQuantumTopology:QT.5/extended-bloch-kernel`, `ArithmeticQuantumTopology:QT.5/five-term-and-pachner`.

**Uses:**

- `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`: The volume and Chern-Simons invariant are read off from the Rogers dilogarithm of this element.
- `ArithmeticQuantumTopology:QT.6`: The arithmetic of the shape field of the triangulation and the regulator of this element are the inputs to the asymptotic statements planned in the next stage.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `blochElement` | constructor | blochElement M is the class in the extended Bloch group attached to a flattened ideal triangulation of M. |
| `blochElement_exists` | structure | A flattening of the triangulation exists, so the element is defined. |
| `blochElement_indep` | characterisation | The element does not depend on the chosen flattening, only on the homology class. |
| `blochElement_mem_extendedBloch` | compatibility | The element lies in the extended Bloch group, the kernel of the map to the exterior square. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `blochElement_figure_eight_volume` | computation | The projected figure-eight class is 2[z₆], z₆=exp(πi/3); its Bloch–Wigner value is 2D(z₆). The full extended class must use the cusp-compatible flattening, rather than assume twice the principal lift. |
| `blochElement_flattening_independent` | characterisation | Changing the flattening by an admissible amount does not change the class. |
| `blochElement_not_in_prebloch_kernel` | non-example | The element is non-zero for a hyperbolic manifold, since its Rogers dilogarithm has non-zero imaginary part equal to the volume. |

**Acceptance:**

- A flattening of the triangulation exists, so the element is always defined.
- The element does not depend on the flattening, which is the content of the invariance statement.
- For the figure-eight knot complement the element is the class attached to the two regular ideal tetrahedra, which is the running example.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), Theorems 4.5–4.6, §4.2, p. 429 (PDF p. 17); Theorem 14.2, p. 465 (PDF p. 53). This fixed-version locus supplies the extended bloch element of a hyperbolic 3-manifold. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The Rogers dilogarithm computes volume and Chern-Simons

**Identifier:** `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`. **Kind:** theorem. **Mathematical status:** proved-source.

Neumann’s λ:H₃(PSL₂(ℂ)^δ;ℤ)≅B̂(ℂ) is an isomorphism and R∘λ is the Cheeger–Chern–Simons class i(Vol+i CS)=i Vol−CS modulo π²ℤ. For a complete finite-volume hyperbolic manifold R(β̂(M)) has imaginary part Vol(M). The tetrahedron identity Vol(z)=D(z) is imported from Polylogarithms P.2; QT assembles the signed sum and compares the Chern–Simons normalization. GZ uses V=i Vol+CS, so V=−conj(R) modulo the corresponding period and with a chosen representative for exponentials. This is not the ordinary K₃ Suslin isomorphism.

**Proof/construction route:**

1. Use Neumann’s exact sequence and λ to compare the group-homology class with the extended Bloch class.
2. Identify the Rogers class with the Cheeger–Chern–Simons cocycle.
3. Import Vol(z)=D(z) for the signed volume sum and explicitly convert the real CS sign for GZ asymptotics.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`, `ArithmeticQuantumTopology:QT.5/extended-rogers-regulator`, `Polylogarithms:P.2/bloch-wigner-descent`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.6/suslin-lift-fibre`.

**Acceptance:**

- The imaginary part of R(β̂(M)) is Vol(M); the real-valued Bloch–Wigner regulator computes the same volume.
- The real part of R(β̂(M)) is −CS(M) modulo π²ℤ in Neumann’s convention, since R=i(Vol+i CS)=i Vol−CS.
- For the figure-eight knot complement the imaginary part is twice the volume of the regular ideal tetrahedron.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), Theorem 2.6, p. 420 (PDF p. 8); §12, Theorem 12.1, p. 459 (PDF p. 47); Theorem 14.2, p. 465 (PDF p. 53). This fixed-version locus supplies the rogers dilogarithm computes volume and chern-simons. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The four proof obligations between a knot diagram and a number-field Bloch class

**Identifier:** `ArithmeticQuantumTopology:QT.5/a-diagram-does-not-produce-a-bloch-class`. **Kind:** comparison. **Mathematical status:** proved-source.

A knot diagram does not automatically give β_F. Required witnesses are: a complete finite-volume hyperbolic complement; genuine face-pairing and peripheral data; an ordered hybrid refinement with a strong flattening; and an algebraic shape field with the required boundary/convention comparison. Once supplied, β̂(M) is independent of permissible flattening choices. Neumann’s warning about non-manifold underlying complexes applies to Dehn-filling triangulations, not all software triangulations of cusped complements. QT.5 imports geometric existence/rigidity from GeometricTopology Part II and tetrahedron volume from Polylogarithms; it has no dependency on QT.0 surgery.

**Proof/construction route:**

1. Check each geometric, arithmetic and ordering hypothesis at the source boundary.
2. Apply the manifold theorem only after those conditions are established.
3. Record a numerical solution in the ledger as numerical until exact equations and field comparison are proved.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/strong-flattening`, `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`, `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`, `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`.

**Acceptance:**

- All four obligations are named with the statement that discharges each.
- The status of software-produced triangulations is recorded.
- No node of this packet produces a Bloch class from a diagram.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), §14, pp. 464–465 (PDF pp. 52–53), complete cusped geometry and fillings. This fixed-version locus supplies the four proof obligations between a knot diagram and a number-field bloch class. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Extended pre-Bloch group

**Identifier:** `ArithmeticQuantumTopology:QT.5/extended-pre-bloch`. **Kind:** definition. **Mathematical status:** proved-source.

Let FT be the five-shape locus (x,y,y/x,(1−1/x)/(1−1/y),(1−x)/(1−y)), x,y∉{0,1},x≠y. In the fivefold Neumann cover, choose the component FT̂₀ containing the all-principal lifts when all five shapes are in the upper half-plane; put FT̂=FT̂₀+V, where V consists of sheet pairs ((p₀,q₀),(p₁,q₁),(p₁−p₀,q₂),(p₁−p₀+q₁−q₀,q₂−q₁),(q₁−q₀,q₂−q₁−p₀)). P̂(ℂ) is the free abelian group on the cover modulo the alternating lifted five-term relations AND [z;p,q]+[z;p′,q′]=[z;p,q′]+[z;p′,q]. The second relation is the transfer relation; omitting it retains an extra ℤ/2.

**Proof/construction route:**

1. Use the distinguished lifted component and the explicit integer sublattice V.
2. Form the relation subgroup generated by both families, then take its quotient.
3. Descend forgetting sheets to the imported ordinary pre-Bloch group and track the transfer torsion.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/combinatorial-flattening`, `K3BlochGroups:V.3/pre-bloch-group`.

**Uses:**

- `ArithmeticQuantumTopology:QT.5/five-term-and-pachner`: Translates a 2–3 move into a quotient relation.
- `ArithmeticQuantumTopology:QT.5/extended-bloch-kernel`: The log wedge descends through both relations.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `LiftedFiveTerm` | relation | Membership in FT̂₀+V, not every unrestricted tuple of lifts. |
| `transferRelation` | relation | The four-term sheet interchange relation. |
| `extendedPreBloch` | constructor | The quotient by lifted five-term and transfer relations. |
| `forget` | functoriality | The homomorphism forgetting sheet coordinates to P(ℂ). |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `lifted_five_term_general` | compatibility | Forgetting a permitted lifted relation gives the ordinary five-term relation. |
| `transfer_zero` | computation | [z;1,1]+[z;0,0]−[z;1,0]−[z;0,1]=0 in this quotient. |
| `lift_sheet_constraint` | non-example | For shapes in FT⁺, arbitrary sheet choices violating p₂=p₁−p₀ are not the specified lifted relation. |

**Acceptance:**

- Forgetting a permitted lifted relation gives the ordinary five-term relation.
- [z;1,1]+[z;0,0]−[z;1,0]−[z;0,1]=0 in this quotient.
- For shapes in FT⁺, arbitrary sheet choices violating p₂=p₁−p₀ are not the specified lifted relation.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), Definition 2.2, §2, pp. 417–418 (PDF pp. 5–6). This fixed-version locus supplies extended pre-bloch group. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Extended Bloch group

**Identifier:** `ArithmeticQuantumTopology:QT.5/extended-bloch-kernel`. **Kind:** definition. **Mathematical status:** proved-source.

The homomorphism ν:P̂(ℂ)→ℂ∧_ℤℂ is ν[z;p,q]=(log z+pπi)∧(−log(1−z)+qπi). Define B̂(ℂ)=ker ν, a subgroup of P̂. Forgetting gives the Neumann ordinary Bloch convention ker([z]↦2z∧(1−z)); its comparison with the K3 supplier’s antisymmetric-tensor and exterior-kernel conventions must use the named comparison, not an integral equality of all those groups.

**Proof/construction route:**

1. Verify ν kills transfer relations bilinearly and the permitted five-term relation using the sheet lattice V.
2. Take the kernel subgroup.
3. Track the forgetful boundary and Neumann’s factor-two convention before applying a K₃ regulator comparison.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/extended-pre-bloch`, `K3BlochGroups:V.3/exterior-kernel-bloch-group`, `K3BlochGroups:V.4/suslin-exact-sequence`.

**Uses:**

- `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`: The signed manifold sum lies in this kernel.
- `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`: The regulator is evaluated on this precise group.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `extendedDehn` | constructor | The displayed logarithmic wedge homomorphism. |
| `extendedBloch` | constructor | Its kernel subgroup. |
| `extendedBloch_forget` | functoriality | Forgetting gives an ordinary Bloch class in the explicitly stated convention. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `extendedBloch_zero` | degenerate | The zero class is in the kernel. |
| `extendedDehn_transfer` | compatibility | The four sheet-interchange terms have wedge sum zero. |
| `extendedDehn_sheet_change` | non-example | Changing p by 1 changes ν by πi∧(−log(1−z)+qπi); individual generators are not automatically in the kernel. |

**Acceptance:**

- The zero class is in the kernel.
- The four sheet-interchange terms have wedge sum zero.
- Changing p by 1 changes ν by πi∧(−log(1−z)+qπi); individual generators are not automatically in the kernel.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), Lemma 2.3 and Definition 2.4, §2, p. 418 (PDF p. 6). This fixed-version locus supplies extended bloch group. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Strong flattening theorem

**Identifier:** `ArithmeticQuantumTopology:QT.5/strong-flattening`. **Kind:** construction. **Mathematical status:** proved-source.

For a G-labelled ordered 3-cycle K, G=PSL₂(ℂ) with discrete topology, choose developing boundary points giving nondegenerate simplex shapes. A flattening has zero parity on every normal path and zero log-parameter sum about every edge; it is strong if the log parameter also vanishes on normal paths in each vertex star. Neumann proves existence of a strong flattening. For complete finite-volume hyperbolic M use an ordered hybrid ideal/ordinary refinement with compatible face orderings; an unordered ideal triangulation alone may give only B̂/C₆. Existence of that geometric refinement is imported from the cusped GeometricTopology Part II request.

**Proof/construction route:**

1. Use the log/parity chain complex in Neumann §9 to solve the flattening obstructions.
2. Impose vertex-star normal-path conditions for a strong flattening.
3. Apply the ordered hybrid refinement theorem for cusped manifolds, retaining the ordering condition.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`, `ArithmeticQuantumTopology:QT.5/combinatorial-flattening`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`.

**Uses:**

- `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`: Provides the input whose sum is a manifold invariant.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `StrongFlattening` | structure | Simplex flattenings satisfying edge, parity and vertex-star normal-path equations. |
| `strongFlattening_exists` | constructor | Existence for the stated labelled ordered nondegenerate 3-cycle. |
| `strongFlattening_refinement` | compatibility | Compatible ordered geometric refinements preserve the resulting class. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `strongFlattening_edge` | compatibility | Every edge has log-parameter sum zero. |
| `strongFlattening_parity` | non-example | An edge-log solution with an odd normal-path parity is not a strong flattening. |
| `strongFlattening_ordering` | non-example | An un-ordered ideal triangulation is not the input of the full B̂-class theorem; its unordered invariant can lose C₆ information. |

**Acceptance:**

- Every edge has log-parameter sum zero.
- An edge-log solution with an odd normal-path parity is not a strong flattening.
- An un-ordered ideal triangulation is not the input of the full B̂-class theorem; its unordered invariant can lose C₆ information.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), Definition 4.4 and Theorem 4.5, §4.2, p. 429 (PDF p. 17); Theorem 14.2, p. 465 (PDF p. 53). This fixed-version locus supplies strong flattening theorem. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Extended Rogers regulator

**Identifier:** `ArithmeticQuantumTopology:QT.5/extended-rogers-regulator`. **Kind:** construction. **Mathematical status:** proved-source.

On the cut-cover chart put R(z;p,q)=Li₂(z)+½log z log(1−z)+(πi/2)(p log(1−z)+q log z)−π²/6 modulo π²ℤ. The cover transition and both relation families make R:P̂(ℂ)→ℂ/π²ℤ an additive homomorphism. Restrict to B̂(ℂ). The Li₂ branch and ordinary Bloch–Wigner descent are imported from Polylogarithms; the π² quotient and sheet terms are QT’s extra geometric data.

**Proof/construction route:**

1. Use the supplier dilogarithm branch and analytic continuation.
2. Check cover transitions change the expression by integral π² periods.
3. Verify the lifted five-term and transfer relations and descend the additive map.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/extended-pre-bloch`, `ArithmeticQuantumTopology:QT.5/extended-bloch-kernel`, `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.2/bloch-wigner-descent`.

**Uses:**

- `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`: Computes the complete complex manifold invariant.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `extendedRogers` | constructor | The normalized expression in ℂ/π²ℤ. |
| `extendedRogers_transfer` | compatibility | The four-term transfer relation maps to zero. |
| `extendedRogers_liftedFiveTerm` | compatibility | A permitted lifted five-term relation maps to zero modulo π². |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `rogers_normalizing_constant` | computation | At p=q=0 the value includes −π²/6; omitting it changes this normalization. |
| `rogers_sheet_p` | computation | Changing p by 2 adds πi log(1−z) before reducing periods. |
| `rogers_not_plain_BlochWigner` | non-example | The complex regulator retains a real Chern–Simons term modulo π²; its target is not just ℝ. |

**Acceptance:**

- At p=q=0 the value includes −π²/6; omitting it changes this normalization.
- Changing p by 2 adds πi log(1−z) before reducing periods.
- The complex regulator retains a real Chern–Simons term modulo π²; its target is not just ℝ.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), Proposition 2.5, §2, pp. 419–420 (PDF pp. 7–8). This fixed-version locus supplies extended rogers regulator. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Geometric number-field Bloch class

**Identifier:** `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`. **Kind:** comparison. **Mathematical status:** comparison-obligation.

For a chosen algebraic nondegenerate complete gluing solution with all shapes in a number field F, the signed symbol sum is first an element of P(F). To place it in the selected Bloch group one must prove the appropriate exterior/antisymmetric boundary vanishes and compare Neumann’s factor-two convention with K3BlochGroups. The trace-field realization must also identify the chosen embedding and any necessary field extension. For the standard figure-eight solution z₆²−z₆+1=0, F=ℚ(√−3), the ordinary class 2[z₆] has zero exterior boundary since 1−z₆=z₆⁻¹ and regulator 2D(z₆). No unverified general integral trace-field descent is asserted.

**Proof/construction route:**

1. Prove the solution is algebraic, specifying the field rather than rounding numerical shapes.
2. Compute the boundary from the incidence and cusp data.
3. Invoke the requested convention/trace-field comparison, retaining torsion qualifications.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`, `ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation`, `K3BlochGroups:V.3/exterior-kernel-bloch-group`, `K3BlochGroups:V.3/bloch-group`, `Polylogarithms:P.2/bloch-wigner-descent`.

**Acceptance:**

- For a chosen algebraic nondegenerate complete gluing solution with all shapes in a number field F, the signed symbol sum is first an element of P(F). To place it in the selected Bloch group one must prove the appropriate exterior/antisymmetric boundary vanishes and compare Neumann’s factor-two convention with K3BlochGroups. The trace-field realization must also identify the chosen embedding and any necessary field extension. For the standard figure-eight solution z₆²−z₆+1=0, F=ℚ(√−3), the ordinary class 2[z₆] has zero exterior boundary since 1−z₆=z₆⁻¹ and regulator 2D(z₆). No unverified general integral trace-field descent is asserted.

**Sources:**

- [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2), §15, pp. 470–471 (PDF pp. 58–59); §16, p. 472 (PDF p. 60). This fixed-version locus supplies geometric number-field bloch class. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

## QT.6 — State integrals, Nahm series and arithmetic asymptotics

The NZ datum comes from selected edge and peripheral equations of an actual triangulation, with an integral symplectic half, shapes and integer flattenings. The Gaussian formula requires invertible B and invertible symmetric Hessian Λ=−B⁻¹A+diag(1/(1−z)). Formal Gaussian contraction constructs a unit series over the shape field from the Bernoulli/polylogarithm vertex expansion. Its move theorem uses nondegenerate quadratic 2–3 moves; the geometric invariance route uses the connected regular refinements of the geometric decomposition. This theorem has no analytic remainder.

The conversion to Nahm coordinates gives I−B⁻¹A. B unimodular and the stated parity relation are needed for the integral Nahm/module theorem. Its coefficient ring, discriminant exclusions, square roots and Bloch index come from the Habiro owners. Removing the classical exponential and one-loop/phase factors is a separate normalization comparison. At every primitive root the DG2 construction uses a finite cyclic weighted average, a root-dependent one-loop scalar and a filtered vertex series. Its arithmetic descent is proved; its general choice and Kashaev asymptotic comparisons remain conjectural. The actual Kummer group respects shape relations. Formal series, twisted module membership and analytic asymptotics are different outputs.

For analytic work, Faddeev’s dilogarithm starts with a strip integral passing **above** zero, then meromorphic continuation. Its zero and pole lattices, inversion constant, self-duality and functional equations fix conventions. The operator pentagon uses the Schrödinger self-adjoint functional calculus, not the formal algebraic pentagon. AK’s selected g₂ and g₃ use horizontal contours below zero with 0<ε<π and ℏ=(b+b⁻¹)⁻². They have a decay-volume limit for 4₁ and 5₂. Their phase comparison with χ retains the inversion constant. The general AK invariant uses positive leveled shapes on ordered pseudo-3-manifolds with H₂ of the complement of vertices vanishing. Charged kernels are tempered distributions with a hyperplane Dirac factor. Tensor contraction admits only wavefront-transverse products with the required enlarged-Schwartz extension; the level phase cancels the charged pentagon scalar. Shaped equivalence uses vertex-preserving moves and preserves positivity. Generic distribution kernels are supplier contracts, not functions silently multiplied pointwise. Uniform tails and steepest-contour deformation are explicit proof obligations; a pointwise dilogarithm expansion does not justify the integral limit.

**Coverage: planned.** NZ datum/Hessian, formal Gaussian invariant, qualified integral-Nahm/module bridge, Faddeev operator and selected analytic knot integrals. The precise open obligations are the gaps and supplier contracts referenced below; no stage is claimed closed.

**Remaining obligations:**

- ArithmeticQuantumTopology/G1: Geometric link/surgery contracts — The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.
- ArithmeticQuantumTopology/G2: Complete quantum algebra and integral core — Mathlib supplies ordinary Hopf/monoidal/rigid structures but no topological ribbon quantum algebra, its completed tensor powers, ribbon twist, quantum PBW basis, tilting quotient or integral clasp/core. The source-decomposed targets and APIs specify these objects; implementing them needs the quantum-specific completed tensor/continuity constructions over the cited pinned base-module completions, and the requested classical highest-weight interfaces. In particular, Habiro–Le §2.7’s universal J_T for arbitrary topological ribbon H and its finite-color trace compatibility are needed by general-core-filtration and general-wrt-comparison; the rank-one universal-sl2-invariant is insufficient. Construct the generic finite highest-weight colors V_λ and their quantum dimensions/traces from §3 and §8.2 before strong-kirby-colors; rank-one coloured-jones does not supply them.
- ArithmeticQuantumTopology/G3: Jones/root convention comparison — Prove the exact variable/mirror convention linking geometric Jones(t), Habiro J_K(V₁)/[2], MM’s positive-q reduced polynomial and GZ’s negative-q definition. At roots reduce before specializing, retain fourth-root lifts and distinguish strong Kirby admissibility from semisimple/modular alcove hypotheses.
- ArithmeticQuantumTopology/G4: Cusped ordered geometry and trace-field descent — Supplier closed Mostow material alone does not provide complete cusped ideal face-pairings, EP/refinement connectivity, strong ordered hybrid flattenings or geometric NZ local rigidity. A general claim that the signed Bloch class descends to the invariant trace field needs a separate algebraicity/boundary argument; only the explicitly checked figure-eight field example is used without it.
- ArithmeticQuantumTopology/G5: Integral and extended Bloch comparisons — Neumann’s factor-two ordinary boundary, exterior kernel, antisymmetric tensor and published CGZ convention must be compared with the named supplier maps. The full extended group needs its actual cut cover, lifted component, transfer relations and strong normal-path conditions. A Suslin lift retains torsion ambiguity; no canonical lift follows from a B̂(ℂ) class.
- ArithmeticQuantumTopology/G6: NZ-to-Habiro normalization — HB.9 applies to symmetric integral Nahm matrices, not every rational NZ matrix. Verify B unimodular, parity compatibility, isolated nondegenerate shapes, arithmetic R/Δ and the correct Bloch index, then compare GSW unit formal series with the HB.8 collection’s classical exponential, phase and one-loop factor. General module membership remains a comparison obligation. Root-refined DG2 arithmetic must use the filtered diagram definition and actual Kummer translations; reconcile E17–E21 and match the τ factor with the HB.8 normalization before claiming the rootwise Habiro collection comparison. The imported HB.8 refinement-gaussian-identification is conditional on its own G1 global-prefactor and G2 regularity gaps and the coprime auxiliary order; those conditions must be retained. Also compare the full cyclotomic coefficient tensor algebra with the chosen F(ζ) component before identifying collections.
- ArithmeticQuantumTopology/G7: Analytic contour and operator closure — Prove the prescribed Faddeev strip integral/continuation and large-argument estimates; import the self-adjoint Schrödinger/functional-calculus interface. For AK’s selected n=2,3 contours supply explicit uniform tails, deformation and O(ℏ) estimates: its short steepest-descent argument is not yet a Lean proof. The BD theorem needs its actual reciprocal Pochhammer errors and selected stationary-phase arithmeticity input, not the formal Gaussian theorem alone. For the general AK theorem establish the nuclear-kernel and microlocal contraction interface on pinned TemperedDistribution: wavefront transversality, product and extension to the enlarged Schwartz space before pushforward. Supply the geometric H₂ exclusion and exponential decay estimate rather than treating every distribution product as defined. A general AK/NZ all-orders analytic comparison needs the matched saddle, branch, action and one-loop factor plus uniform remainder estimates; it is not asserted proved.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here: Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery: Import oriented surgery with slope fμ+λ, H₁≅coker linking matrix, IHS iff det=±1, and ordinary Kirby/Fenn–Rourke presentation calculus. Supply stable diagonalization of the integral unimodular form and its realization by ordinary moves used in admissible-presentation existence. QT proves only the admissible band-slide/Hoste refinements.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group: Oriented manifold gluing, connected sum and orientation reversal with the surgery split-union comparison; the topological operation is imported before proving quantum multiplicativity. Supply the finite ordered oriented pseudo-3-manifold CW face-pairing carrier, punctured (co)homology, normal curves/relative chains and their Mayer–Vietoris gluing used in AK’s H₂ admissibility proof. These are GeometricTopology, Part II inputs; QT adds the charged positive angles, levels and analytic invariant.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume: Extend the closed geometric/Mostow material to ideal ordered face-pairing triangulations of complete finite-volume cusped hyperbolic 3-manifolds: developing maps, peripheral completeness, Mostow–Prasad rigidity, ordered hybrid refinements, Epstein–Penner canonical cell decompositions, connectivity of their regular refinements (allowing flat nondegenerate tetrahedra), and geometric local rigidity/nonzero NZ Hessian. Keep this distinct from a bare matrix gluing solution or the closed-only Mostow theorem.
- Import contract Polylogarithms:P.2: Supply the oriented ideal-tetrahedron identity Vol(z)=D(z), its ordering/sign convention and comparison with the weight-two regulator on the field Bloch class. QT imports that identity and assembles the flattened signed sum; it does not reprove tetrahedron volume.
- Import contract K3BlochGroups:V.3: Compare Neumann’s ker(2z∧(1−z)) convention with the supplier exterior kernel, antisymmetric-tensor Bloch group and published CGZ convention, retaining integral two-torsion. Supply the exact map for the verified geometric Σ ε[z] over a number field; do not identify all conventions integrally.
- Import contract K3BlochGroups:V.4: Use the precise Suslin exact sequence to compare a verified ordinary geometric Bloch class with K₃^ind; identify the torsion ambiguity. The extended group H₃(PSL₂(ℂ)^δ) and complex regulator are QT-owned and do not follow merely from ordinary Suslin.
- Import contract K3BlochGroups:V.6: Import the Suslin lift fibre and torsion bookkeeping for a field-valued geometric Bloch class. A canonical K₃ lift is not inferred from numerical shapes or a unique B̂(ℂ) manifold class.
- Import contract HabiroNahmSeries:HB.4: Import the filtered formal Gaussian bracket and its finiteness/valuation hypotheses. Extend the analytic toolkit, where absent, with source-level finite Pochhammer reciprocity (BD §2), prescribed branches and holomorphic error uniform on the domains used in BD §3, plus uniform steepest-descent/tail/deformation estimates for AK’s selected contours. No analytic remainder follows from the formal bracket.
- Import contract HabiroNahmSeries:HB.8: Use the corrected reviewed refined Gaussian collection and normalization, including its classical logarithmic term, shift convention and phase. Supply the precise comparison needed to strip the NZ classical exponential/one-loop factors in the qualified integral-Nahm bridge.
- Import contract HabiroNumberFields:HB.6: Supply the early Frobenius coefficient ring R with its nondegeneracy/unit/bad-prime conditions in the integral-NZ example, using the HB.6 stage’s exact arithmetic scope.
- Import contract HabiroNumberFields:HB.7: Supply the K₃-indexed twisted Habiro module over R[δ⁻¹/²], roots of order prime to Δ, and its index in the checked Bloch convention. Do not substitute the untwisted ordinary ring.
- Import contract QSeriesPartitionsAndMockModularForms:QM.0: Supply Bernoulli/Pochhammer and convergent infinite-product identities with their convergence/branch domains for the formal vertex series, Faddeev product and finite reciprocal knot sums.
- Import contract AutomorphicSpectralTheory:AS.0: Supply the general unbounded self-adjoint spectral calculus, Schrödinger position/momentum on L²(ℝ), their common Schwartz core and the self-adjoint closure of p+q, including the extension from core equalities to bounded unitary functional-calculus operators. QT proves the Faddeev operator identity on that imported interface. Also supply the nuclear Schwartz-kernel theorem for continuous maps S(ℝⁿ)→S′(ℝᵐ), partial Fourier/polarization transforms and their action on kernels. Generic wavefront pullback/product and the enlarged-test-space pushforward extension are an additional microlocal distribution input, proposed as PDE, Part II in upstreamNotes; AS.0 is not claimed to contain them already.
- Import contract Polylogarithms:P.1: Import the actual dilogarithm branch/continuation, Bloch–Wigner function and nonpositive polylogarithm rational functions needed by the Rogers and formal vertex formulas; exact branch conventions are part of the interface.
- Import contract tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ: Import the classical enveloping algebra/PBW, highest-weight modules and rank-one calculations; root-space/root-datum inputs are the upstream layers 1–2. QT constructs the quantized Drinfeld–Jimbo algebra, its integral form and quantum PBW/core, rather than re-plan the classical theory.

**Planets:** Neumann–Zagier datum, Formal state integral, Formal state-integral invariance, Faddeev quantum dilogarithm, Quantum dilogarithm pentagon, Knot state integral.

### The conjectural asymptotic expansion, its normalisation, and the field its coefficients lie in

**Identifier:** `ArithmeticQuantumTopology:QT.6/the-asymptotic-series-and-its-arithmetic`. **Kind:** comparison. **Mathematical status:** mixed: formal arithmetic proved-source; general analytic comparison conjectural.

The formal GSW geometric NZ series exists and is invariant under its hypotheses, with coefficients in the invariant trace field. A normalized GZ perturbative series additionally includes a one-loop square root, an eighth-root phase and the complex-volume exponential; the normalization comparison is explicit. The Kashaev all-orders analytic expansion is conjectural in general and proved only in the separately cited families. For 4₁ the GZ series begins 3^(−1/4)(1+11h/(72√−3)+697h²/(2(72√−3)²)+⋯). For 5₂ use ξ³−ξ²+1=0 with Im ξ<0 and the prefactor ζ₈/√(3ξ−2). These formal coefficients do not supply an error bound by themselves. At primitive order k the geometric input is the root-refined DG2 series, with the finite cyclic average and one-loop factor above. Its matching with HB.8’s refined Gaussian collection is a normalization obligation under the integral/parity hypotheses, not mere evaluation of the k=1 series.

**Proof/construction route:**

1. Construct the formal coefficients via GSW with its own unit constant term.
2. Record the GZ normalized one-loop prefactors and fix a lift of complex volume.
3. For an analytic conclusion use only a separately scoped proved theorem or explicitly mark the conjecture.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance`, `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`, `ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison`, `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`, `ArithmeticQuantumTopology:QT.6/root-series-arithmetic`.

**Acceptance:**

- Every prefactor of the expansion is written out.
- The conjecture about the coefficients is stated separately from the existence conjecture.
- The conjectural status is recorded on each clause.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §1, equations (1.3)–(1.4), p. 10; §2.2, pp. 12–14. This fixed-version locus supplies the conjectural asymptotic expansion, its normalisation, and the field its coefficients lie in. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The comparisons with the Habiro ring that are actually proved, and the ones that are not

**Identifier:** `ArithmeticQuantumTopology:QT.6/what-is-exported-to-the-habiro-roadmaps`. **Kind:** comparison. **Mathematical status:** proved-source.

Three precise interfaces connect QT to the Habiro family: integral knot coefficients and IHS unified invariants consume HC.1–HC.4; the explicit figure-eight descendant H_m supplies new elements of the ordinary Habiro ring via HC.2; and qualified integral-NZ Nahm data consume HB.8/HB.9 and HNF HB.6/HB.7 for a K₃-indexed module. The knot-specific construction/topological comparison stays in QT. Neither formal asymptotics nor root values alone prove completion membership. Wheeler’s two-variable relative-Habiro theorem is routed as a named QT Part II after QT.2, with HR.1/HR.5 coefficient suppliers and GeometricTopology’s Alexander polynomial; it is not absorbed into the current stages.

**Proof/construction route:**

1. Distinguish the ordinary ring, relative ring and K₃-indexed module targets.
2. Import generic completion and formal Gaussian theory unchanged.
3. Keep the exact topological identification and example descendants in their QT owner.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.2/cyclotomic-expansion`, `ArithmeticQuantumTopology:QT.3/JM-well-defined`, `ArithmeticQuantumTopology:QT.7/figure-eight-habiro-descendants`, `ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `HabiroCyclotomicCompletions:HC.2/factorial-series`.

**Acceptance:**

- Both export points are named.
- The source status of the second is recorded.
- The two prohibitions are checkable.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §7.1, pp. 52–56, descendant Habiro-like functions. This fixed-version locus supplies the comparisons with the habiro ring that are actually proved, and the ones that are not. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### What a formal expansion establishes and what it does not

**Identifier:** `ArithmeticQuantumTopology:QT.6/formal-and-analytic-asymptotics-are-different-outputs`. **Kind:** comparison. **Mathematical status:** proved-source.

A formal series is an element of a coefficient ring [[h]], with no domain or error estimate. Analytic all-orders asymptotics requires a limit domain, a branch and, for every truncation M, an O(h^M) remainder with the stated uniformity. GSW supplies formal invariance; AK supplies the selected analytic leading limits; Bettin–Drappeau supplies bounded-denominator all-orders modular asymptotics for its named knot family. General GZ refinements remain conjectural. No number of computed coefficients or saddle-point equations upgrades a formal series to such a theorem.

**Proof/construction route:**

1. Compare the actual source conclusions and remainder hypotheses.
2. Expose the contour, branch and uniformity whenever an analytic statement is used.
3. Label coefficient computations and conjectural identifications independently in the ledger.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/formal-nz-state-integral`, `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`, `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`.

**Acceptance:**

- The two kinds are defined and every statement of the layer is classified.
- The prohibitions are stated and checkable.
- The status of numerical agreement is recorded.

**Sources:**

- [Perturbative invariants of cusped hyperbolic 3-manifolds](https://arxiv.org/abs/2305.14884v2), §1, pp. 2–5; Theorem 1.1, p. 4. This fixed-version locus supplies what a formal expansion establishes and what it does not. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Neumann–Zagier datum

**Identifier:** `ArithmeticQuantumTopology:QT.6/neumann-zagier-datum`. **Kind:** definition. **Mathematical status:** proved-source.

An NZ datum Ξ=(A,B,ν,z,f,f″) comes from an actual ideal triangulation with a selected edge equation removed and a peripheral equation added. (A|B) is an integral upper symplectic half, hence ABᵀ=BAᵀ and rank(A|B)=N. Shapes z_j∉{0,1} solve ∏_j z_j^A_ij(1−1/z_j)^B_ij=(−1)^ν_i. Integer flattening vectors satisfy Af+Bf″=ν (and f′=1−f−f″ with the full incidence equations). For the formal Gaussian route impose det B≠0 and det Λ≠0, Λ=−B⁻¹A+diag(1/(1−z_j)). Λ is symmetric over ℚ(z). This is more than arbitrary integer matrices.

**Proof/construction route:**

1. Extract the matrices and ν from the imported edge/peripheral incidence system.
2. Use symplectic completion to establish ABᵀ symmetry and full rank.
3. Check the chosen flattening and both determinant conditions before defining Gaussian coefficients.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`, `ArithmeticQuantumTopology:QT.5/strong-flattening`, `mathlib:Matrix.det`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6/formal-nz-state-integral`: Fixes all parameters and normalization of the formal integral.
- `ArithmeticQuantumTopology:QT.6/nz-to-integral-nahm`: Determines the symmetric Nahm matrix and its integrality restriction.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `NZDatum` | structure | The triangulation-derived matrices, shapes and flattening satisfying the stated equations. |
| `NZHessian` | constructor | Λ=−B⁻¹A+diag(1/(1−z)). |
| `NZHessian_symmetric` | compatibility | ABᵀ=BAᵀ and invertible B imply symmetry of Λ. |
| `NZDatum_nonDegenerate` | characterisation | Both B and Λ are invertible and all shapes avoid 0 and 1. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `NZ_singular_B` | non-example | A datum with det B=0 is excluded from this coordinate Gaussian formula. |
| `NZ_degenerate_shape` | non-example | A shape 1 makes the Hessian and gluing coordinates invalid. |
| `NZ_hessian_one_variable` | computation | For A=0,B=1,z=1/2 the algebraic Hessian equals 2; this matrix computation alone does not certify a manifold datum. |

**Acceptance:**

- A datum with det B=0 is excluded from this coordinate Gaussian formula.
- A shape 1 makes the Hessian and gluing coordinates invalid.
- For A=0,B=1,z=1/2 the algebraic Hessian equals 2; this matrix computation alone does not certify a manifold datum.

**Sources:**

- [Perturbative invariants of cusped hyperbolic 3-manifolds](https://arxiv.org/abs/2305.14884v2), §§2.1–2.2, pp. 5–8, NZ matrices and formal series. This fixed-version locus supplies neumann–zagier datum. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.
- [The quantum content of the gluing equations](https://arxiv.org/abs/1202.6268v2), §1.2, pp. 4–5; §§2.1–2.3, pp. 11–13. DG defines the geometric datum and one-loop normalization underlying the root construction; the GSW notation is retained in the formal unit-series node.

### Formal NZ state integral

**Identifier:** `ArithmeticQuantumTopology:QT.6/formal-nz-state-integral`. **Kind:** construction. **Mathematical status:** proved-source.

For nondegenerate Ξ define ψ_h(x,z)=exp(−Σ_(k,ℓ≥0;k+ℓ/2>1) B_k x^ℓ h^(k+ℓ/2−1) Li_(2−k−ℓ)(z)/(k!ℓ!)). These nonpositive-index polylogarithms are rational functions of z. Put F_h^Ξ=exp(√h xᵀ(1−B⁻¹ν)/2+h fᵀB⁻¹Af/8)∏_jψ_h(x_j,z_j). Define Φ^Ξ(h)=⟨F_h^Ξ⟩_Λ using the imported formal Gaussian bracket at covariance Λ⁻¹. The result lies in ℚ(z)[[h]] with constant 1: Gaussian parity removes half-integral powers. This is a formal construction with no analytic contour or error assertion. It differs from the DG ψ normalization by the stated exp(h/12−x√h/2) factor.

**Proof/construction route:**

1. Use the source filtered polynomial-series algebra to justify coefficientwise exponentiation.
2. Apply HB.4’s Gaussian differential operator, not a new Gaussian theory.
3. Check odd-polynomial parity and finite contributions to each h coefficient; retain the source prefactor.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/neumann-zagier-datum`, `HabiroNahmSeries:HB.4/formal-gaussian-integration`, `Polylogarithms:P.1`, `QSeriesPartitionsAndMockModularForms:QM.0`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance`: Proves choice and triangulation invariance.
- `ArithmeticQuantumTopology:QT.6/the-asymptotic-series-and-its-arithmetic`: Supplies a formal perturbative series with coefficients in the shape field.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `NZVertexSeries` | constructor | The normalized ψ_h series with Bernoulli coefficients. |
| `NZFormalIntegrand` | constructor | F_h^Ξ including its flattening exponential. |
| `formalNZStateIntegral` | constructor | The imported Gaussian bracket of F_h^Ξ. |
| `formalNZStateIntegral_constant` | simp | Its constant coefficient is 1. |
| `formalNZStateIntegral_integralPowers` | compatibility | The resulting half-variable series descends to integer h powers. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `formalNZ_constant` | degenerate | At h=0 Φ^Ξ=1. |
| `formalNZ_odd_moment` | compatibility | The √h coefficient vanishes by Gaussian parity. |
| `formalNZ_normalization` | non-example | Replacing GSW ψ by DG ψ without its exp(h/12−x√h/2) correction changes the resulting coefficients. |

**Acceptance:**

- At h=0 Φ^Ξ=1.
- The √h coefficient vanishes by Gaussian parity.
- Replacing GSW ψ by DG ψ without its exp(h/12−x√h/2) correction changes the resulting coefficients.

**Sources:**

- [Perturbative invariants of cusped hyperbolic 3-manifolds](https://arxiv.org/abs/2305.14884v2), §§2.1–2.2, pp. 5–8, equations (2.1)–(2.6); Gaussian evaluation in §3.1, pp. 9–10. This fixed-version locus supplies formal nz state integral. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Formal state-integral invariance

**Identifier:** `ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance`. **Kind:** theorem. **Mathematical status:** proved-source.

Φ^Ξ is invariant under the GSW changes of quad, edge/peripheral choice and integer flattening and under a nondegenerate 2–3 Pachner move, with the normalization above. For the geometric discrete-faithful solution of a complete finite-volume cusped hyperbolic M the canonical Epstein–Penner cell decomposition and connected regular refinements give a topological invariant Φ_M∈k_M[[h]], k_M the invariant trace field. This does not assert connectivity of all ideal triangulations seeing an arbitrary representation.

**Proof/construction route:**

1. Use formal Fourier and formal pentagon identities of GSW §§3–4 for local moves.
2. For the geometric solution import regular-refinement connectivity of the canonical EP decomposition, permitting flat nondegenerate tetrahedra.
3. Use local rigidity/nonzero one-loop Hessian to meet the determinant hypotheses; each geometric input is a Part II supplier request.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/formal-nz-state-integral`, `ArithmeticQuantumTopology:QT.5/five-term-and-pachner`, `HabiroNahmSeries:HB.4/formal-gaussian-integration`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`.

**Acceptance:**

- Φ^Ξ is invariant under the GSW changes of quad, edge/peripheral choice and integer flattening and under a nondegenerate 2–3 Pachner move, with the normalization above. For the geometric discrete-faithful solution of a complete finite-volume cusped hyperbolic M the canonical Epstein–Penner cell decomposition and connected regular refinements give a topological invariant Φ_M∈k_M[[h]], k_M the invariant trace field. This does not assert connectivity of all ideal triangulations seeing an arbitrary representation.

**Sources:**

- [Perturbative invariants of cusped hyperbolic 3-manifolds](https://arxiv.org/abs/2305.14884v2), Theorem 1.1, p. 4; §2.3, pp. 8–9; quad and Pachner proofs in §§5–6, pp. 19–38. This fixed-version locus supplies formal state-integral invariance. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### NZ–Nahm comparison

**Identifier:** `ArithmeticQuantumTopology:QT.6/nz-to-integral-nahm`. **Kind:** comparison. **Mathematical status:** comparison-obligation.

If B is unimodular over ℤ, N=I−B⁻¹A is symmetric integral. If additionally B⁻¹ν≡diag(N)+1 mod2, the NZ gluing equations are exactly 1−z_j=(−1)^N_jj∏_i z_i^N_ij. The Gaussian Hessian is Λ=N+diag(z_j/(1−z_j)); its determinant agrees with the Nahm discriminant δ=∏_j z_j^(−N_jj)det(diag(1−z)N+diag z) after the indicated nonzero monomial factors. If det B≠0 but B is not unimodular, N can be rational and this is not an input to the symmetric-integral HB.9 theorem. For the standard figure-eight comparison the Bloch index is 2[z₆] over ℚ(√−3).

**Proof/construction route:**

1. Invert B integrally under unimodularity and use ABᵀ symmetry.
2. Rewrite z″=−(1−z)/z and check the parity vector explicitly.
3. Compare the two Hessians/discriminants and the signed Bloch convention using the supplier map.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/neumann-zagier-datum`, `HabiroNahmSeries:HB.8`, `K3BlochGroups:V.3/cgz-published-bloch-group`, `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`.

**Acceptance:**

- If B is unimodular over ℤ, N=I−B⁻¹A is symmetric integral. If additionally B⁻¹ν≡diag(N)+1 mod2, the NZ gluing equations are exactly 1−z_j=(−1)^N_jj∏_i z_i^N_ij. The Gaussian Hessian is Λ=N+diag(z_j/(1−z_j)); its determinant agrees with the Nahm discriminant δ=∏_j z_j^(−N_jj)det(diag(1−z)N+diag z) after the indicated nonzero monomial factors. If det B≠0 but B is not unimodular, N can be rational and this is not an input to the symmetric-integral HB.9 theorem. For the standard figure-eight comparison the Bloch index is 2[z₆] over ℚ(√−3).

**Sources:**

- [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2), §1.8, pp. 15–17, NZ-to-Nahm comparison and figure-eight example. This fixed-version locus supplies nz–nahm comparison. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Topological Habiro-module comparison

**Identifier:** `ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison`. **Kind:** comparison. **Mathematical status:** comparison-obligation.

For a nondegenerate isolated solution of the symmetric integral N Nahm equations obtained by the preceding qualified bridge, import the HB.8 refined Gaussian collection only after its G1 global-prefactor and G2 regularity conditions are discharged (and retaining its coprime auxiliary root-order condition) and HB.9 theorem giving Φ_(N,z)∈H_(R[δ^(−1/2)],ξ) at root orders prime to Δ, where ξ=Σ_j[z_j] in the checked CGZ convention. The coefficient ring R is the arithmetic ring of the chosen number field with the required units and bad-prime localization; HNF HB.6/HB.7 supply the Frobenius ring and K₃-indexed module. Identifying this collection with the normalized geometric NZ series requires the explicit phase/one-loop and classical-exponential comparison. It is a separate obligation, not an automatic assertion that every formal NZ series is in that module. At primitive order k the geometric input is the root-refined DG2 series, with the finite cyclic average and one-loop factor above. Its matching with HB.8’s refined Gaussian collection is a normalization obligation under the integral/parity hypotheses, not mere evaluation of the k=1 series.

**Proof/construction route:**

1. Verify symmetry/integrality, nondegeneracy and the coefficient localization.
2. Import the generic collection, its exact module index and root-order restriction unchanged.
3. Compare the geometric normalization with the supplied collection, stripping the principal logarithmic part exactly as HB.9; record any unmatched phase as a gap.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/nz-to-integral-nahm`, `HabiroNahmSeries:HB.8/refinement-gaussian-identification`, `HabiroNahmSeries:HB.9/module-membership`, `HabiroNumberFields:HB.6`, `HabiroNumberFields:HB.7`, `K3BlochGroups:V.3/cgz-published-bloch-group`, `ArithmeticQuantumTopology:QT.6/root-series-arithmetic`.

**Acceptance:**

- For a nondegenerate isolated solution of the symmetric integral N Nahm equations obtained by the preceding qualified bridge, import the HB.8 refined Gaussian collection only after its G1 global-prefactor and G2 regularity conditions are discharged (and retaining its coprime auxiliary root-order condition) and HB.9 theorem giving Φ_(N,z)∈H_(R[δ^(−1/2)],ξ) at root orders prime to Δ, where ξ=Σ_j[z_j] in the checked CGZ convention. The coefficient ring R is the arithmetic ring of the chosen number field with the required units and bad-prime localization; HNF HB.6/HB.7 supply the Frobenius ring and K₃-indexed module. Identifying this collection with the normalized geometric NZ series requires the explicit phase/one-loop and classical-exponential comparison. It is a separate obligation, not an automatic assertion that every formal NZ series is in that module. At primitive order k the geometric input is the root-refined DG2 series, with the finite cyclic average and one-loop factor above. Its matching with HB.8’s refined Gaussian collection is a normalization obligation under the integral/parity hypotheses, not mere evaluation of the k=1 series.

**Sources:**

- [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2), Theorem 5, §1.7, p. 14; §1.8, pp. 15–17. This fixed-version locus supplies topological habiro-module comparison. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Faddeev quantum dilogarithm

**Identifier:** `ArithmeticQuantumTopology:QT.6/faddeev-quantum-dilogarithm`. **Kind:** definition. **Mathematical status:** proved-source.

For Re b>0, Im b≥0 put c_b=i(b+b⁻¹)/2. In |Im z|<|Im c_b| define Φ_b(z)=exp(∫_(ℝ+i0) e^(−2izw)/(4 sinh(bw)sinh(w/b)w) dw), with the prescribed contour passing above w=0, and extend meromorphically. Zeros are −c_b−mib−nib⁻¹ and poles are c_b+mib+nib⁻¹, m,n≥0, with multiplicities when the lattice points coincide. b↦b⁻¹ is its self-duality. An arbitrary ordinary real-axis integral through w=0 is not this definition.

**Proof/construction route:**

1. Use the contour integral and strip convergence in AK Appendix A.
2. Continue using the functional equations and track its zero/pole lattice.
3. Prove self-duality directly from the symmetric b and b⁻¹ integrand.

**Direct prerequisites:** `Polylogarithms:P.1`, `mathlib:MeasureTheory.integral`, `mathlib:Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6/faddeev-functional-inversion`: Fixes the shifts and scalar inversion factor.
- `ArithmeticQuantumTopology:QT.6/selected-analytic-state-integrals`: Defines the selected convergent contour integrands.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `faddeevPhi` | constructor | The strip integral with the above-zero contour prescription and meromorphic continuation. |
| `faddeevPhi_selfDual` | compatibility | Φ_b(z)=Φ_(1/b)(z). |
| `faddeevPhi_divisor` | characterisation | The stated zeros/poles with their multiplicities. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `faddeevPhi_zero_pole` | non-example | −c_b is a zero and +c_b is a pole; exchanging them reverses the convention. |
| `faddeevPhi_selfDual_b1` | degenerate | At b=1 the self-duality fixes the parameter. |
| `faddeevPhi_contour_prescription` | non-example | The defining integrand has a singularity at w=0; the unsubtracted ordinary integral over ℝ is not the above-zero contour definition. |

**Acceptance:**

- −c_b is a zero and +c_b is a pole; exchanging them reverses the convention.
- At b=1 the self-duality fixes the parameter.
- The defining integrand has a singularity at w=0; the unsubtracted ordinary integral over ℝ is not the above-zero contour definition.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Definition 15, §1.7, p. 9; Appendix A, §13, pp. 34–37. This fixed-version locus supplies faddeev quantum dilogarithm. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Faddeev functional equations

**Identifier:** `ArithmeticQuantumTopology:QT.6/faddeev-functional-inversion`. **Kind:** theorem. **Mathematical status:** proved-source.

As meromorphic identities, Φ_b(z−i b^(±1)/2)=(1+exp(2π b^(±1)z))Φ_b(z+i b^(±1)/2), and Φ_b(z)Φ_b(−z)=ζ_inv⁻¹exp(iπz²), ζ_inv=exp(iπ(1+2c_b²)/6). Where Im b²>0 the product formula is (exp(2πb(z+c_b));exp(2πib²))_∞/(exp(2πb⁻¹(z−c_b));exp(−2πib⁻²))_∞. Equalities at poles are understood meromorphically, not as ordinary finite complex values.

**Proof/construction route:**

1. Shift the contour in the defining strip and compute residues.
2. Use the two shift equations for meromorphic continuation.
3. Check the inversion constant at the source normalization; compare the product representation in its convergence domain.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/faddeev-quantum-dilogarithm`, `QSeriesPartitionsAndMockModularForms:QM.0`.

**Acceptance:**

- As meromorphic identities, Φ_b(z−i b^(±1)/2)=(1+exp(2π b^(±1)z))Φ_b(z+i b^(±1)/2), and Φ_b(z)Φ_b(−z)=ζ_inv⁻¹exp(iπz²), ζ_inv=exp(iπ(1+2c_b²)/6). Where Im b²>0 the product formula is (exp(2πb(z+c_b));exp(2πib²))_∞/(exp(2πb⁻¹(z−c_b));exp(−2πib⁻²))_∞. Equalities at poles are understood meromorphically, not as ordinary finite complex values.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Appendix A, §13, equations (47)–(49), pp. 34–35. This fixed-version locus supplies faddeev functional equations. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Faddeev operator pentagon

**Identifier:** `ArithmeticQuantumTopology:QT.6/faddeev-operator-pentagon`. **Kind:** theorem. **Mathematical status:** proved-source.

On the standard Schrödinger Hilbert space L²(ℝ), for self-adjoint position and momentum p,q with [p,q]=1/(2πi) on the common invariant Schwartz core and b>0, the bounded unitary functional-calculus operators satisfy Φ_b(p)Φ_b(q)=Φ_b(q)Φ_b(p+q)Φ_b(p). The closure of p+q and the functional calculus are supplier analytic inputs. This operator identity is distinct from the formal noncommutative q-dilogarithm pentagon owned by HC.1.

**Proof/construction route:**

1. Use the spectral calculus and the canonical commutation realization supplied by HilbertSpectral.
2. Apply AK Appendix A’s integral Fourier identities on the invariant core.
3. Extend to bounded operators and use the charged identity for admissible analytic Pachner moves.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/faddeev-functional-inversion`, `AutomorphicSpectralTheory:AS.0`.

**Acceptance:**

- On the standard Schrödinger Hilbert space L²(ℝ), for self-adjoint position and momentum p,q with [p,q]=1/(2πi) on the common invariant Schwartz core and b>0, the bounded unitary functional-calculus operators satisfy Φ_b(p)Φ_b(q)=Φ_b(q)Φ_b(p+q)Φ_b(p). The closure of p+q and the functional calculus are supplier analytic inputs. This operator identity is distinct from the formal noncommutative q-dilogarithm pentagon owned by HC.1.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Appendix A, §13, equation (50), p. 35. This fixed-version locus supplies faddeev operator pentagon. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Selected analytic state integrals

**Identifier:** `ArithmeticQuantumTopology:QT.6/selected-analytic-state-integrals`. **Kind:** construction. **Mathematical status:** proved-source.

Choose b∈(0,1], ℏ=(b+b⁻¹)⁻², and n=2 or 3. For ε∈(0,π) define g_n(ℏ)=(2π√ℏ)⁻¹∫_(ℝ−iε) Φ_b(z/(2π√ℏ))^(−n)exp(iz²/(4πℏ)) dz, oriented left to right. The strip avoids poles of Φ_b⁻¹ (nearest is at Im z=−π); its tails decay on both ends for n>1. Cauchy deformation identifies permitted ε, defining the ℝ−i0 boundary value. AK’s figure-eight and 5₂ examples identify the absolute values of g₂ and g₃ with their selected knot state integrals after explicit unit-modulus phase correction; the exact phases are tracked in sourceIssues. General contour/analytic gluing invariance is not inferred from the formal NZ theorem.

**Proof/construction route:**

1. Use the pole lattice and large-real-argument estimates to justify the horizontal contour and absolute convergence.
2. Prove contour independence by rectangular deformation and vanishing vertical edges.
3. Compare AK’s χ₄₁(0) and χ₅₂(0) with g₂,g₃ including the inversion and exp(−iπ/3) phases.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/faddeev-functional-inversion`, `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`, `mathlib:MeasureTheory.integral`, `mathlib:Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`: Provides concrete analytic outputs for 4₁ and 5₂.
- `ArithmeticQuantumTopology:QT.7/the-example-ledger`: Keeps these proved state-integral limits separate from Kashaev conjectures.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `analyticStateIntegral` | constructor | The displayed g_n with its b,ℏ and horizontal contour. |
| `analyticStateIntegral_contour` | compatibility | Permitted ε in the pole-free strip give the same value. |
| `analyticStateIntegral_knotExamples` | compatibility | The selected AK knot kernels at x=0 agree in absolute value after the explicit phases. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `stateIntegral_pole_boundary` | non-example | The line Im z=−π reaches a pole of the inverse Φ integrand and is excluded. |
| `stateIntegral_hbar_b1` | computation | At b=1 the declared parameter is ℏ=1/4. |
| `stateIntegral_phase_52` | compatibility | χ₅₂(0)=exp(−iπ/3)g₃, so absolute values agree but exact complex values require that phase. |

**Acceptance:**

- The line Im z=−π reaches a pole of the inverse Φ integrand and is excluded.
- At b=1 the declared parameter is ℏ=1/4.
- χ₅₂(0)=exp(−iπ/3)g₃, so absolute values agree but exact complex values require that phase.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), §§11.4–11.7, pp. 28–32; §12, pp. 32–34. This fixed-version locus supplies selected analytic state integrals. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Selected state-integral volume theorem

**Identifier:** `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`. **Kind:** theorem. **Mathematical status:** proved-source.

For the AK selected n=2,3 integrals, as ℏ→0+ on the b→0+ branch, v_n(z)=−nLi₂(−e^z)−z²/2 has v′_n(z)=n log(1+e^z)−z. The source’s contour-selected critical point z_n minimizes Im v_n in the stated strip. Its steepest-descent expansion has leading exp(v_n(z_n)/(2πiℏ)) g(z_n)^(−n)/√(i v″_n(z_n)) (1+O(ℏ)). Thus lim_(ℏ→0+)2πℏ log|g₂|=−Vol(S³∖4₁) and similarly g₃ gives −Vol(S³∖5₂). These are decay limits for AK integrals; they are not Kashaev growth theorems. Uniform deformation/error details at the Lean proof boundary are recorded as an analytic gap.

**Proof/construction route:**

1. Use the quantum-dilogarithm small-b expansion on a pole-free strip.
2. Identify the contour-selected nondegenerate critical points and relate their dilogarithm action to the complete gluing shapes.
3. Use the source steepest-descent contour and O(ℏ) formula, recording uniform-tail/phase estimates required from the analytic supplier.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/selected-analytic-state-integrals`, `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`, `Polylogarithms:P.1`, `HabiroNahmSeries:HB.4`.

**Acceptance:**

- For the AK selected n=2,3 integrals, as ℏ→0+ on the b→0+ branch, v_n(z)=−nLi₂(−e^z)−z²/2 has v′_n(z)=n log(1+e^z)−z. The source’s contour-selected critical point z_n minimizes Im v_n in the stated strip. Its steepest-descent expansion has leading exp(v_n(z_n)/(2πiℏ)) g(z_n)^(−n)/√(i v″_n(z_n)) (1+O(ℏ)). Thus lim_(ℏ→0+)2πℏ log|g₂|=−Vol(S³∖4₁) and similarly g₃ gives −Vol(S³∖5₂). These are decay limits for AK integrals; they are not Kashaev growth theorems. Uniform deformation/error details at the Lean proof boundary are recorded as an analytic gap.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Theorem 5, §1.9, p. 11; §12, pp. 32–34, with E8/E9 boundaries. This fixed-version locus supplies selected state-integral volume theorem. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Leveled positive shapes

**Identifier:** `ArithmeticQuantumTopology:QT.6/ak-leveled-positive-shapes`. **Kind:** definition. **Mathematical status:** proved-source.

On an imported finite ordered oriented pseudo-3-manifold X with orientation-reversing order-preserving face pairings, a shape assigns α>0 to each local edge, with the three angles at every tetrahedron vertex summing to π. Opposite edges have equal angles. The weight ω(e) is the sum of local angles over each global edge. Balanced means internal and ω=2π; fully balanced means every edge is balanced, hence the face boundary is empty. A level is ℓ∈ℝ. With p sending a local edge to its opposite-edge pair and ε the orientation-induced cyclic antisymmetric incidence, a boundary-zero gauge g shifts α(a) by πΣ_b ε_(p(a),p(b))g(edge(b)), and shifts ℓ by Σ_e g(e)Σ_(a over e)(1/3−α(a)/π), retaining positivity. Leveled shaped equivalence uses gauge equivalence after common vertex-preserving shaped 3↔2 refinements. The inverse 2→3 move requires existence of positive new angles; it is not automatically allowed. The AK admissibility condition is H₂(X∖vertices;ℤ)=0, and composition is allowed only if the glued result remains admissible.

**Proof/construction route:**

1. Import the finite CW face-pairing carrier and its punctured homology. Add the angle inequalities and linear vertex sums, rather than substituting a gluing matrix.
2. Use AK Introduction, gaugeeq and 3-2PM for the gauge/level and shaped-move equivalence; positivity is preserved only within its admitted domain.
3. Use the actual H₂ vanishing test on each glued composite.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance`: The general AK invariant uses this precisely qualified input.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `AKShape.weight` | projection | ω(e)=Σ_(local a over e)α(a). |
| `AKShape.charge` | data | c(a)=α(a)/(2π); each tetrahedron has three opposite-edge charges summing to 1/2. |
| `AKShape.gauge` | functoriality | The stated gauge action and level shift on the domain retaining positive angles; boundary gauges vanish. |
| `AKShape.admissible` | characterisation | Admissibility is H₂ of the complement of vertices equal to zero; it is checked again after gluing. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `ak_regular_charges` | computation | The regular tetrahedron has all local angles π/3 and all three charges 1/6. |
| `ak_fullyBalanced_boundary` | characterisation | A shape with a boundary edge cannot be fully balanced under AK’s definition. |
| `ak_positive_inverse_move` | non-example | A proposed 2→3 move without positive new angles is excluded, even if its formal linear angle equations have a real solution. |

**Acceptance:**

- The regular tetrahedron has all local angles π/3 and all three charges 1/6.
- A shape with a boundary edge cannot be fully balanced under AK’s definition.
- A proposed 2→3 move without positive new angles is excluded, even if its formal linear angle equations have a real solution.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Definitions 1–11, §§1.2–1.6, pp. 2–8. This is the homological admissibility condition of the AK construction; the surrounding definitions fix shapes, levels and allowed moves.

### Charged tetrahedron kernel

**Identifier:** `ArithmeticQuantumTopology:QT.6/ak-charged-tetrahedron-kernel`. **Kind:** construction. **Mathematical status:** proved-source.

For λ with ℏ=(λ+λ⁻¹)⁻²>0 and the AK quantum-dilogarithm parameter domain, put c_λ=i(λ+λ⁻¹)/2. Charges a,c>0 and b=1/2−a−c>0 define ψ_(a,c)(x)=Φ_λ(x−2c_λ(a+c))⁻¹ exp(−4πi c_λ a(x−c_λ(a+c))) exp(−πi c_λ²(4(a−c)+1)/6). Its Fourier transform is ψ̃_(a,c)(x)=∫ℝ ψ_(a,c)(y)exp(−2πixy)dy, absolutely convergent, and ψ̃′_(a,c)(x)=exp(−πix²)ψ̃_(a,c)(x)=exp(−πi/12)ψ_(c,b)(x). The positive charged kernel is the tempered distribution δ(x₀+x₂−x₁)ψ̃′_(a,c)(x₃−x₂)exp(2πix₀(x₃−x₂)); the negative kernel is its conjugate transpose. For an ordered tetrahedron, a=α(v₀v₁)/(2π) and c=α(v₀v₃)/(2π). The Dirac factor is a distribution supported on a hyperplane, never an ordinary complex-valued function.

**Proof/construction route:**

1. Use AK §CTO to prove charged Fourier convergence and the cyclic Fourier identity from Appendix A.
2. Interpret the hyperplane Dirac kernel by its action on Schwartz test functions; prove continuity with the imported nuclear-kernel interface.
3. Apply conjugate transpose for orientation reversal and retain the exp(−πi/12) phase.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/ak-leveled-positive-shapes`, `ArithmeticQuantumTopology:QT.6/faddeev-functional-inversion`, `mathlib:SchwartzMap`, `mathlib:TemperedDistribution`, `mathlib:TemperedDistribution.delta`, `mathlib:SchwartzMap.fourierTransformCLM`, `AutomorphicSpectralTheory:AS.0`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance`: The general AK invariant uses this precisely qualified input.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `chargedPsi` | constructor | The displayed charged scalar function with all three charges positive. |
| `chargedPsi_fourier` | compatibility | exp(−πix²) times its Fourier transform equals exp(−πi/12)ψ_(c,b)(x). |
| `chargedTetrahedronKernel` | constructor | The specified distribution on four real face coordinates. |
| `chargedTetrahedronKernel_adjoint` | compatibility | Orientation reversal gives the conjugate transpose with incoming and outgoing face coordinates exchanged. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `chargedPsi_regular` | computation | At a=c=1/6 the third charge is b=1/6; the Fourier transform cycles the same charge triple with the specified phase. |
| `chargedKernel_hyperplane` | characterisation | The kernel pairs to zero against any test function supported away from x₀+x₂−x₁=0. |
| `chargedKernel_zero_charge` | non-example | The charge boundary a=0 is outside the strictly positive construction; a limiting or residue invariant requires a separate theorem. |

**Acceptance:**

- At a=c=1/6 the third charge is b=1/6; the Fourier transform cycles the same charge triple with the specified phase.
- The kernel pairs to zero against any test function supported away from x₀+x₂−x₁=0.
- The charge boundary a=0 is outside the strictly positive construction; a limiting or residue invariant requires a separate theorem.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), §4, pp. 15–16, charged kernels and Fourier identities. The displayed distributional kernel and the following Fourier identity specify the charged tetrahedron, including its phase.

### Charged pentagon theorem

**Identifier:** `ArithmeticQuantumTopology:QT.6/ak-charged-pentagon`. **Kind:** theorem. **Mathematical status:** proved-source.

For positive charge pairs (a_j,c_j), b_j=1/2−a_j−c_j>0, satisfying a₁=a₀+a₂, a₃=a₂+a₄, c₁=c₀+a₄, c₃=a₀+c₄, c₂=c₁+c₃, the charged operators satisfy T₁₂(a₄,c₄)T₁₃(a₂,c₂)T₂₃(a₀,c₀)=exp(πi c_λ²P_e/3)T₂₃(a₁,c₁)T₁₂(a₃,c₃), where P_e=2(c₀+a₂+c₄)−1/2. This is an equality of the admitted continuous Schwartz/distribution kernels. Products and contractions are defined only with the necessary generic analytic extension conditions. The scalar is part of the equality and is canceled by the AK level shift under the corresponding shaped Pachner move.

**Proof/construction route:**

1. Insert the charge conjugations around the uncharged tetrahedral operator.
2. Use AK §CPI’s Heisenberg relations, the five linear charge equations and the uncharged pentagon.
3. Evaluate the ratio of the five ν charge phases; it is precisely exp(πi c_λ²P_e/3), not 1.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/ak-charged-tetrahedron-kernel`, `ArithmeticQuantumTopology:QT.6/faddeev-operator-pentagon`, `AutomorphicSpectralTheory:AS.0`.

**Acceptance:**

- For positive charge pairs (a_j,c_j), b_j=1/2−a_j−c_j>0, satisfying a₁=a₀+a₂, a₃=a₂+a₄, c₁=c₀+a₄, c₃=a₀+c₄, c₂=c₁+c₃, the charged operators satisfy T₁₂(a₄,c₄)T₁₃(a₂,c₂)T₂₃(a₀,c₀)=exp(πi c_λ²P_e/3)T₂₃(a₁,c₁)T₁₂(a₃,c₃), where P_e=2(c₀+a₂+c₄)−1/2. This is an equality of the admitted continuous Schwartz/distribution kernels. Products and contractions are defined only with the necessary generic analytic extension conditions. The scalar is part of the equality and is canceled by the AK level shift under the corresponding shaped Pachner move.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Proposition 2, §5, pp. 16–17. The source gives the exact charged operator ordering and phase, with the five displayed charge equations.

### Leveled AK state integral

**Identifier:** `ArithmeticQuantumTopology:QT.6/ak-leveled-state-integral`. **Kind:** construction. **Mathematical status:** proved-source.

For ℏ>0, the AK state integral F_ℏ(X,ℓ)=Z_ℏ(X)exp(iπℓ/(4ℏ)) is obtained by tensoring the signed charged tetrahedron kernels and contracting each identified face variable over ℝ. Its objects are finite face sets, and the morphism associated to X is in S′(ℝ^(boundary faces)). Generic contraction A:n→m, B:m→l is (π_(n,l))_*(π_(n,m)^*A·π_(m,l)^*B), admitted only when the two pulled-back wavefront sets have no opposite covectors at a common base point and their product extends continuously to the enlarged Schwartz test space S(ℝ^(n⊔m⊔l))_m of AK Appendix B. It is a partial composition, not unrestricted multiplication of distributions. On the shape/gauge/Pachner domain above this gives the stated level-normalized construction; convergence and well-definedness are the separate following theorem. Empty face boundary gives a complex scalar.

**Proof/construction route:**

1. Tensor the kernels on independent variables; pull them back along the actual face incidence maps.
2. Check wavefront transversality and the enlarged-test-space extension before pushforward along internal variables.
3. Multiply by the exact level phase. Separate generic nuclear/microlocal inputs from the AK-specific homological convergence theorem.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/ak-leveled-positive-shapes`, `ArithmeticQuantumTopology:QT.6/ak-charged-tetrahedron-kernel`, `mathlib:TemperedDistribution`, `AutomorphicSpectralTheory:AS.0`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance`: The general AK invariant uses this precisely qualified input.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `akStateIntegral` | constructor | The tensor contraction of signed charged kernels with exp(iπℓ/(4ℏ)), only on the admitted contraction domain. |
| `akStateIntegral_levelShift` | simp | Adding u to ℓ multiplies F by exp(iπu/(4ℏ)). |
| `akStateIntegral_glue` | functoriality | The distributional composition equality for a glued admissible composite, with transversality and extension discharged by the convergence theorem. |
| `akStateIntegral_closed` | compatibility | No boundary face variables identify the output distribution with a complex scalar. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `ak_level_shift` | computation | At ℏ>0 a level increase of 8ℏ leaves F unchanged because its phase is exp(2πi). |
| `ak_bad_distribution_product` | non-example | δ₀·δ₀ on the same coordinate has opposite wavefront covectors and is excluded from this composition rule. |
| `ak_closed_output` | characterisation | The output for an empty face boundary has no free face-coordinate dependence; cusp links at deleted vertices do not add boundary-face variables. |

**Acceptance:**

- At ℏ>0 a level increase of 8ℏ leaves F unchanged because its phase is exp(2πi).
- δ₀·δ₀ on the same coordinate has opposite wavefront covectors and is excluded from this composition rule.
- The output for an empty face boundary has no free face-coordinate dependence; cusp links at deleted vertices do not add boundary-face variables.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Theorem 4, §1.7, pp. 9–10; Appendix B, §14, pp. 37–39. The level-normalized distribution-valued invariant is stated here; the preceding composition definition retains wavefront and extension hypotheses.

### AK convergence and invariance theorem

**Identifier:** `ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance`. **Kind:** theorem. **Mathematical status:** proved-source.

For every positively shaped pseudo-3-manifold X satisfying H₂(X∖vertices;ℤ)=0, Z_ℏ(X) is a well-defined tempered distribution. Thus F_ℏ is the AK unique *-functor on the admissible leveled shaped cobordism categroid: it respects composition exactly when the composite is admissible, orientation reversal by adjoint, and the gauge/common vertex-preserving shaped-Pachner equivalence defined above. The level compensates the charged pentagon and gauge phases. Fully balanced admissible leveled objects have empty face boundary and give scalar invariants of this qualified equivalence class. This does not assert invariance under arbitrary moves that add/remove vertices, or convergence for every shape or homology type.

**Proof/construction route:**

1. Use AK’s Fundamental Lemma: the three adjacent vertex exchanges conjugate the charged kernel by its A/B boundary distributions, with charge permutations and orientation change.
2. Use the operator-valued boundary cohomology class θ_X and its annihilation on the kernel of H₁(boundary∖vertices)→H₁(X∖vertices). In the polarization of §Convergence the kernel is ψ_X(η) times a product of independent Dirac factors.
3. A forbidden repeated Dirac constraint under gluing would yield a nonzero H₂ class. Admissibility rules it out; exponential decay of ψ_X supplies the required pushforward extension.
4. Apply the charged pentagon, gauge-trans phase and level shift to prove independence of the admitted refinements and gauge representatives; use conjugate transpose for the * law.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/ak-leveled-state-integral`, `ArithmeticQuantumTopology:QT.6/ak-charged-pentagon`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`, `AutomorphicSpectralTheory:AS.0`.

**Acceptance:**

- For every positively shaped pseudo-3-manifold X satisfying H₂(X∖vertices;ℤ)=0, Z_ℏ(X) is a well-defined tempered distribution. Thus F_ℏ is the AK unique *-functor on the admissible leveled shaped cobordism categroid: it respects composition exactly when the composite is admissible, orientation reversal by adjoint, and the gauge/common vertex-preserving shaped-Pachner equivalence defined above. The level compensates the charged pentagon and gauge phases. Fully balanced admissible leveled objects have empty face boundary and give scalar invariants of this qualified equivalence class. This does not assert invariance under arbitrary moves that add/remove vertices, or convergence for every shape or homology type.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Theorem 4, §1.7, pp. 9–10; Theorem 7 and proof of Theorem 4, §10, pp. 24–25. This is the source convergence statement. Its proof uses the H₂ condition to exclude the forbidden wavefront product; Main adds the level-normalized invariance.

### Root-refined NZ data

**Identifier:** `ArithmeticQuantumTopology:QT.6/root-nz-data`. **Kind:** definition. **Mathematical status:** proved-source.

Fix a geometric NZ datum Ξ with B∈GL_N(ℤ), symmetric Q=B⁻¹A, nonzero determinant of Λ=−Q+diag(z′), a primitive k-th root ζ, k>0, and choices θ_i^k=z_i. Put F=ℚ(z), F_k=F(ζ), E=F_k(θ); the actual Kummer Galois group embeds into (ℤ/kℤ)^N and need not be the whole product. For m represented by integers 0≤m_i<k, put a_m(θ)=exp(−πi mᵀQm) exp(πi(mᵀQm+mᵀB⁻¹ν)/k) ∏_i θ_i^(−(Qm)_i)/(ζθ_i⁻¹;ζ)_(m_i). These denominators are nonzero since z_i≠1. Assume S=Σ_m a_m≠0 and set Av(g)=Σ_m a_m g(m)/S. Put D*_k(x)=∏_(s=1)^(k−1)(1−ζ⁻ˢx)^s. With chosen roots, τ_(Ξ,k)=k^(−N/2)[det(A diag(z″)+B diag(z⁻¹)) z^(f″/k)(z″)^(−f/k)]^(−1/2)∏_i D*_k(θ_i⁻¹)^(1/k) S. The displayed fractional monomials use the chosen θ_i and roots of z″_i, not unspecified powers. The invariant scalar is qualified modulo its 2k-th-root ambiguity; it is not canonically an element of F_k.

**Proof/construction route:**

1. Use the integer unimodular B and invertible Hessian domain, and representatives for m before proving k-periodicity.
2. Define the finite weights, cyclic products and nonzero weighted-average denominator.
3. Retain each root choice in τ. Use the root-independence theorem for powers rather than asserting a canonical scalar.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/neumann-zagier-datum`, `HabiroNahmSeries:HB.4/formal-gaussian-integration`, `QSeriesPartitionsAndMockModularForms:QM.0`.

**Uses:**

- `ArithmeticQuantumTopology:QT.7`: Supplies the specified knot arithmetic and modular comparisons.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `RootNZDatum.weights` | projection | The explicit a_m on (ZMod k)^N with stated integral and root choices. |
| `RootNZDatum.average` | constructor | Σa_m g(m)/Σa_m, only with nonzero denominator. |
| `cyclicDilogarithmStar` | constructor | The finite product D*_k(x). |
| `RootNZDatum.oneLoop` | constructor | The exact τ formula with chosen square and k-th roots. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `rootNZ_k_one` | degenerate | For k=1, the finite average has one summand, D*₁=1 and θ=z. |
| `rootNZ_denominator` | non-example | If the weighted sum S is zero, the normalized average is outside the constructor’s domain. |
| `rootNZ_kummer_relations` | non-example | Repeated shapes θ₁=θ₂ cannot admit an independent automorphism rotating only θ₁ in their actual splitting field. |

**Acceptance:**

- For k=1, the finite average has one summand, D*₁=1 and θ=z.
- If the weighted sum S is zero, the normalized average is outside the constructor’s domain.
- Repeated shapes θ₁=θ₂ cannot admit an independent automorphism rotating only θ₁ in their actual splitting field.

**Sources:**

- [Quantum modularity and complex Chern–Simons theory](https://arxiv.org/abs/1511.05628v1), §§2.1–2.2, pp. 4–6, root data and Definition 2.1. The finite weights and one-loop formula occur immediately before this root-ambiguity qualification; the Kummer overstatement is corrected in E18.

### Root-refined perturbative series

**Identifier:** `ArithmeticQuantumTopology:QT.6/root-refined-nz-series`. **Kind:** construction. **Mathematical status:** proved-source.

On RootNZDatum, define the filtered vertex series Ψ_(k,h)(x,θ,m)=exp(Σ_(n,j≥0;n+j/2>1) h^(n+j/2−1)(−1)^j/(n!j!k^j) Σ_(s=1)^k B_n(s/k)Li_(2−n−j)(ζ^(m+s)θ⁻¹)x^j). All polylogarithm indices here are nonpositive; each coefficient is rational in the indicated algebraic arguments. Define F_(k,h)(x;m)=exp(−√h xᵀB⁻¹ν/(2k)+h fᵀB⁻¹ν/(8k))∏_iΨ_(k,h)(x_i,θ_i,m_i). The Gaussian bracket has Hessian Λ/k, hence covariance kΛ⁻¹. Put φ⁺_(Ξ,ζ)(h)=Av(⟨F_(k,h)⟩) and φ_(Ξ,ζ)=τ_(Ξ,k)φ⁺_(Ξ,ζ). Wick parity and coefficientwise finiteness give φ⁺∈1+hE[[h]]. This filtered definition is the rescaled form of DG2’s explicit §2.4 diagram rules: Π=hkΛ⁻¹, valence-zero vertices start at n=2, valence-one/two at n=1 and valence≥3 at n=0. It corrects the unfiltered printed block (E19). It is not obtained by substituting a root into the k=1 series. Choice/topological invariance and identification with Kashaev asymptotics are DG2’s qualified conjecture, modulo ζ^(1/12)exp(h/(24k)); GSW’s k=1 theorem alone proves neither at all roots.

**Proof/construction route:**

1. Use DG2 §2.4’s propagator and rational diagonal vertex factors, translated by x↦√h x to the displayed filtered series.
2. Import Gaussian moments from HB.4; pair indices and divide each finite diagram by its automorphism count. The degree bound in LD makes every fixed h coefficient finite.
3. Average coefficientwise over the finite m-set; multiply by the separately chosen one-loop factor. Keep the general conjectures separate.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/root-nz-data`, `HabiroNahmSeries:HB.4/formal-gaussian-integration`, `Polylogarithms:P.1`.

**Uses:**

- `ArithmeticQuantumTopology:QT.7`: Supplies the specified knot arithmetic and modular comparisons.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `rootNZVertexSeries` | constructor | The displayed degree-filtered Bernoulli-polynomial vertex expansion. |
| `rootNZFormalSeries` | constructor | The normalized finite average of Gaussian brackets, with Hessian Λ/k. |
| `rootNZFormalSeries_constant` | simp | The constant coefficient of φ⁺ equals 1. |
| `rootNZFormalSeries_descent` | compatibility | Its coefficients lie in F(ζ), independently of the k-th shape-root choices, by the following arithmetic theorem. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `rootNZ_constant` | degenerate | φ⁺(0)=1 whenever S≠0. |
| `rootNZ_odd_moment` | compatibility | Wick parity removes all odd √h powers. |
| `rootNZ_valence_three` | non-example | The n=0, j=3 vertex is necessary: two such vertices with three propagators contribute at h¹; the printed n≥1 block omits this two-loop term. |

**Acceptance:**

- φ⁺(0)=1 whenever S≠0.
- Wick parity removes all odd √h powers.
- The n=0, j=3 vertex is necessary: two such vertices with three propagators contribute at h¹; the printed n≥1 block omits this two-loop term.

**Sources:**

- [Quantum modularity and complex Chern–Simons theory](https://arxiv.org/abs/1511.05628v1), Definition 2.5, §2.3, p. 7; diagrams in §2.4, equations (24)–(28) and Lemma 2.8, pp. 8–9. The diagram definition supplies a filtered finite-coefficient construction; the preceding four valence rules determine the corrected vertex series.
- [Quantum modularity and complex Chern–Simons theory](https://arxiv.org/abs/1511.05628v1), Conjecture 2.9, §2.8, pp. 11–12. The full topological and analytic comparison is a conjecture, with the preceding ζ^(1/12) and exp(h/(24k)) ambiguities.

### Root-series arithmetic theorem

**Identifier:** `ArithmeticQuantumTopology:QT.6/root-series-arithmetic`. **Kind:** theorem. **Mathematical status:** proved-source.

For the admitted RootNZDatum with nonzero S, every coefficient of φ⁺_(Ξ,ζ) lies in F(ζ) and is independent of choices θ_i^k=z_i; moreover τ_(Ξ,k)^(2k)∈F(ζ). This proves arithmetic descent of the defined formal series, not its identification with analytic Kashaev asymptotics. The proof uses the actual Kummer subgroup (or universal finite étale root algebra), allowing multiplicative relations among shapes; independent coordinate rotations are not assumed to exist as automorphisms of every selected field component.

**Proof/construction route:**

1. Prove k-periodicity of a_m and the simultaneous root-rotation/index-translation identities as rational identities in the universal root algebra.
2. For any actual automorphism with θ_i↦ζ^(−r_i)θ_i, translate all m by r. Both weighted sums transform by the same nonzero factor, so the normalized average is fixed.
3. Use the cyclic-product shift to compensate the one-loop sum; raising to 2k removes root/square-root ambiguities. Correct the cyclic and parity slips E20/E21 in this computation.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/root-refined-nz-series`.

**Acceptance:**

- For the admitted RootNZDatum with nonzero S, every coefficient of φ⁺_(Ξ,ζ) lies in F(ζ) and is independent of choices θ_i^k=z_i; moreover τ_(Ξ,k)^(2k)∈F(ζ). This proves arithmetic descent of the defined formal series, not its identification with analytic Kashaev asymptotics. The proof uses the actual Kummer subgroup (or universal finite étale root algebra), allowing multiplicative relations among shapes; independent coordinate rotations are not assumed to exist as automorphisms of every selected field component.

**Sources:**

- [Quantum modularity and complex Chern–Simons theory](https://arxiv.org/abs/1511.05628v1), Theorems 2.2 and 2.6, §§2.2–2.3, pp. 6–8; proofs in §3, pp. 12–16. This is the coefficient-field theorem; the one-loop power theorem precedes it. The proof’s overly large Kummer group is replaced by the actual simultaneous root translations.

## QT.7 — Quantum modularity and arithmetic research statements

The selected perturbative family is indexed by isolated boundary-parabolic representations, including the trivial, geometric and conjugate-geometric representations. The trivial representation has weight 3/2; the nontrivial ones have weight zero. A denominator/volume cocycle has an exact additive identity on the common pole-free rational domain. These domains and branch-aware weight factors are part of every modular formula.

Generalized quantum modularity, its coefficientwise lift, quadratic relations, coefficient asymptotics and matrix RQMC remain conjectural in their stated generality. The matrix and scalar weight conventions and the large-order phase have source discrepancies to reconcile. The lift uses x=X−h/(2πi) and the exact transformed h*. Matrix inversion is an explicit qualification. Once the matrices and automorphy factors are invertible and satisfy the factor identity, the ordered cocycle composition is algebraic. Smoothness, real analyticity and the two holomorphic cut-plane extensions are separate conjectures.

There are concrete outputs here. Integral figure-eight descendants Hₘ satisfy an inhomogeneous three-term recurrence and finite root evaluation. The first row’s half-difference lies in ½ times the integral ring and has Taylor coefficient −½ at degree two; only its double belongs to the integral ℤ-Habiro ring. Bettin–Drappeau proves the positive-q quantum modular theorem for the specified hyperbolic knots with at most seven crossings except 7₂. Comparing that theorem to GZ’s negative-q convention remains necessary. The general AK knot comparison has three conjectural clauses: an ideal-triangulation integral, a normalized H-triangulation limit and a negative decay-volume limit. Its theorem proves exactly the selected 4₁/5₂ cases. The usual Kashaev growth-volume conjecture is separate and is the leading assertion of the qualified S specialization of QMC. The ledger records a producing node and a separate status for each output: formal invariance and selected analytic theorems coexist with conjectural matrix refinements in the same examples.

**Coverage: planned.** Representation-indexed scalar lifts, quadratic/coefficient/matrix conjectures, conditional knot cocycle, concrete Habiro descendants and scoped proved BD family. The precise open obligations are the gaps and supplier contracts referenced below; no stage is claimed closed.

**Remaining obligations:**

- ArithmeticQuantumTopology/G1: Geometric link/surgery contracts — The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.
- ArithmeticQuantumTopology/G2: Complete quantum algebra and integral core — Mathlib supplies ordinary Hopf/monoidal/rigid structures but no topological ribbon quantum algebra, its completed tensor powers, ribbon twist, quantum PBW basis, tilting quotient or integral clasp/core. The source-decomposed targets and APIs specify these objects; implementing them needs the quantum-specific completed tensor/continuity constructions over the cited pinned base-module completions, and the requested classical highest-weight interfaces. In particular, Habiro–Le §2.7’s universal J_T for arbitrary topological ribbon H and its finite-color trace compatibility are needed by general-core-filtration and general-wrt-comparison; the rank-one universal-sl2-invariant is insufficient. Construct the generic finite highest-weight colors V_λ and their quantum dimensions/traces from §3 and §8.2 before strong-kirby-colors; rank-one coloured-jones does not supply them.
- ArithmeticQuantumTopology/G3: Jones/root convention comparison — Prove the exact variable/mirror convention linking geometric Jones(t), Habiro J_K(V₁)/[2], MM’s positive-q reduced polynomial and GZ’s negative-q definition. At roots reduce before specializing, retain fourth-root lifts and distinguish strong Kirby admissibility from semisimple/modular alcove hypotheses.
- ArithmeticQuantumTopology/G4: Cusped ordered geometry and trace-field descent — Supplier closed Mostow material alone does not provide complete cusped ideal face-pairings, EP/refinement connectivity, strong ordered hybrid flattenings or geometric NZ local rigidity. A general claim that the signed Bloch class descends to the invariant trace field needs a separate algebraicity/boundary argument; only the explicitly checked figure-eight field example is used without it.
- ArithmeticQuantumTopology/G5: Integral and extended Bloch comparisons — Neumann’s factor-two ordinary boundary, exterior kernel, antisymmetric tensor and published CGZ convention must be compared with the named supplier maps. The full extended group needs its actual cut cover, lifted component, transfer relations and strong normal-path conditions. A Suslin lift retains torsion ambiguity; no canonical lift follows from a B̂(ℂ) class.
- ArithmeticQuantumTopology/G6: NZ-to-Habiro normalization — HB.9 applies to symmetric integral Nahm matrices, not every rational NZ matrix. Verify B unimodular, parity compatibility, isolated nondegenerate shapes, arithmetic R/Δ and the correct Bloch index, then compare GSW unit formal series with the HB.8 collection’s classical exponential, phase and one-loop factor. General module membership remains a comparison obligation. Root-refined DG2 arithmetic must use the filtered diagram definition and actual Kummer translations; reconcile E17–E21 and match the τ factor with the HB.8 normalization before claiming the rootwise Habiro collection comparison. The imported HB.8 refinement-gaussian-identification is conditional on its own G1 global-prefactor and G2 regularity gaps and the coprime auxiliary order; those conditions must be retained. Also compare the full cyclotomic coefficient tensor algebra with the chosen F(ζ) component before identifying collections.
- ArithmeticQuantumTopology/G7: Analytic contour and operator closure — Prove the prescribed Faddeev strip integral/continuation and large-argument estimates; import the self-adjoint Schrödinger/functional-calculus interface. For AK’s selected n=2,3 contours supply explicit uniform tails, deformation and O(ℏ) estimates: its short steepest-descent argument is not yet a Lean proof. The BD theorem needs its actual reciprocal Pochhammer errors and selected stationary-phase arithmeticity input, not the formal Gaussian theorem alone. For the general AK theorem establish the nuclear-kernel and microlocal contraction interface on pinned TemperedDistribution: wavefront transversality, product and extension to the enlarged Schwartz space before pushforward. Supply the geometric H₂ exclusion and exponential decay estimate rather than treating every distribution product as defined. A general AK/NZ all-orders analytic comparison needs the matched saddle, branch, action and one-loop factor plus uniform remainder estimates; it is not asserted proved.
- ArithmeticQuantumTopology/G8: Conjectural knot refinements and normalization discrepancies — General GQMC, lifts, quadratic/coefficient relations, matrix RQMC, invertibility and analytic cocycle extensions remain conjectural. Resolve the scalar-versus-matrix weight sign and the large-order coefficient phase in the fixed GZ source before a normalized matrix theorem. Conditional algebraic cocycle composition is proved independently of these conjectures.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here: Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery: Import oriented surgery with slope fμ+λ, H₁≅coker linking matrix, IHS iff det=±1, and ordinary Kirby/Fenn–Rourke presentation calculus. Supply stable diagonalization of the integral unimodular form and its realization by ordinary moves used in admissible-presentation existence. QT proves only the admissible band-slide/Hoste refinements.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group: Oriented manifold gluing, connected sum and orientation reversal with the surgery split-union comparison; the topological operation is imported before proving quantum multiplicativity. Supply the finite ordered oriented pseudo-3-manifold CW face-pairing carrier, punctured (co)homology, normal curves/relative chains and their Mayer–Vietoris gluing used in AK’s H₂ admissibility proof. These are GeometricTopology, Part II inputs; QT adds the charged positive angles, levels and analytic invariant.
- Import contract tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume: Extend the closed geometric/Mostow material to ideal ordered face-pairing triangulations of complete finite-volume cusped hyperbolic 3-manifolds: developing maps, peripheral completeness, Mostow–Prasad rigidity, ordered hybrid refinements, Epstein–Penner canonical cell decompositions, connectivity of their regular refinements (allowing flat nondegenerate tetrahedra), and geometric local rigidity/nonzero NZ Hessian. Keep this distinct from a bare matrix gluing solution or the closed-only Mostow theorem.
- Import contract Polylogarithms:P.2: Supply the oriented ideal-tetrahedron identity Vol(z)=D(z), its ordering/sign convention and comparison with the weight-two regulator on the field Bloch class. QT imports that identity and assembles the flattened signed sum; it does not reprove tetrahedron volume.
- Import contract K3BlochGroups:V.3: Compare Neumann’s ker(2z∧(1−z)) convention with the supplier exterior kernel, antisymmetric-tensor Bloch group and published CGZ convention, retaining integral two-torsion. Supply the exact map for the verified geometric Σ ε[z] over a number field; do not identify all conventions integrally.
- Import contract K3BlochGroups:V.4: Use the precise Suslin exact sequence to compare a verified ordinary geometric Bloch class with K₃^ind; identify the torsion ambiguity. The extended group H₃(PSL₂(ℂ)^δ) and complex regulator are QT-owned and do not follow merely from ordinary Suslin.
- Import contract K3BlochGroups:V.6: Import the Suslin lift fibre and torsion bookkeeping for a field-valued geometric Bloch class. A canonical K₃ lift is not inferred from numerical shapes or a unique B̂(ℂ) manifold class.
- Import contract HabiroNahmSeries:HB.4: Import the filtered formal Gaussian bracket and its finiteness/valuation hypotheses. Extend the analytic toolkit, where absent, with source-level finite Pochhammer reciprocity (BD §2), prescribed branches and holomorphic error uniform on the domains used in BD §3, plus uniform steepest-descent/tail/deformation estimates for AK’s selected contours. No analytic remainder follows from the formal bracket.
- Import contract HabiroNahmSeries:HB.8: Use the corrected reviewed refined Gaussian collection and normalization, including its classical logarithmic term, shift convention and phase. Supply the precise comparison needed to strip the NZ classical exponential/one-loop factors in the qualified integral-Nahm bridge.
- Import contract HabiroNumberFields:HB.6: Supply the early Frobenius coefficient ring R with its nondegeneracy/unit/bad-prime conditions in the integral-NZ example, using the HB.6 stage’s exact arithmetic scope.
- Import contract HabiroNumberFields:HB.7: Supply the K₃-indexed twisted Habiro module over R[δ⁻¹/²], roots of order prime to Δ, and its index in the checked Bloch convention. Do not substitute the untwisted ordinary ring.
- Import contract QSeriesPartitionsAndMockModularForms:QM.0: Supply Bernoulli/Pochhammer and convergent infinite-product identities with their convergence/branch domains for the formal vertex series, Faddeev product and finite reciprocal knot sums.
- Import contract QSeriesPartitionsAndMockModularForms:QM.5: Extend the scalar period-cocycle interface to matrix-valued multiplicative cocycles on common pole-free domains, with branch-aware weights and smooth/holomorphic extension criteria. QT owns only its knot matrices and comparisons. Generic formal/noncommutative q-dilogarithm pentagon remains HC.1; no dependency from QM.5 back to QT.7 is needed.
- Import contract AutomorphicSpectralTheory:AS.0: Supply the general unbounded self-adjoint spectral calculus, Schrödinger position/momentum on L²(ℝ), their common Schwartz core and the self-adjoint closure of p+q, including the extension from core equalities to bounded unitary functional-calculus operators. QT proves the Faddeev operator identity on that imported interface. Also supply the nuclear Schwartz-kernel theorem for continuous maps S(ℝⁿ)→S′(ℝᵐ), partial Fourier/polarization transforms and their action on kernels. Generic wavefront pullback/product and the enlarged-test-space pushforward extension are an additional microlocal distribution input, proposed as PDE, Part II in upstreamNotes; AS.0 is not claimed to contain them already.
- Import contract Polylogarithms:P.1: Import the actual dilogarithm branch/continuation, Bloch–Wigner function and nonpositive polylogarithm rational functions needed by the Rogers and formal vertex formulas; exact branch conventions are part of the interface.
- Import contract tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ: Import the classical enveloping algebra/PBW, highest-weight modules and rank-one calculations; root-space/root-datum inputs are the upstream layers 1–2. QT constructs the quantized Drinfeld–Jimbo algebra, its integral form and quantum PBW/core, rather than re-plan the classical theory.

**Planets:** Knot perturbative series, Denominator cocycle, Knot matrix cocycle, Figure-eight descendants, Proved quantum modularity.

### The conjecture, with its exact normalisation and its domain

**Identifier:** `ArithmeticQuantumTopology:QT.7/the-quantum-modularity-conjecture`. **Kind:** comparison. **Mathematical status:** conjectural.

Conjecture (GZ QMC): for γ=(a b;c d)∈SL₂(ℤ), c>0, X→+∞ through rationals with bounded denominator, J_K(γX)∼(cX+d)^(3/2) J_K(X) Φ̂_(a/c)^geo(2πi/[c(cX+d)]). Here the completed geometric series is exp(Vgeo/[den(α)²h])Φ_α^geo(h), with the specified volume representative, one-loop phase and q convention. The relation means an all-orders asymptotic expansion, not equality of rational functions or pointwise convergence of the formal series. The positive-q Bettin–Drappeau theorem is a separately normalized proved specialization for its ten knots, requiring the explicit q-conjugation comparison.

**Proof/construction route:**

1. Fix the GZ q and complex-volume conventions and the positive-c transformation.
2. Define each truncation and its bounded-denominator O-error criterion.
3. Record the conjecture with the source’s domain; separate the independent positive-q proved cases.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals`, `ArithmeticQuantumTopology:QT.7/representation-indexed-perturbative-family`, `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`.

**Acceptance:**

- Every prefactor and the argument of the series are written out.
- The specialisation to the previous layer's expansion is recorded.
- The conjectural status of the statement and of each refinement is recorded.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §1, equations (1.5)–(1.6), pp. 10–11. This fixed-version locus supplies the conjecture, with its exact normalisation and its domain. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### A reproducible ledger linking the four kinds of data, for two knots

**Identifier:** `ArithmeticQuantumTopology:QT.7/the-example-ledger`. **Kind:** construction. **Mathematical status:** construction.

The ledger records exact knot/root/normalization/representation/shape-field data and mathematical status separately for each output. 4₁: ζ₆=e^(πi/3), ordinary Bloch class 2[ζ₆], field ℚ(√−3), exact Kashaev values 1,5,13,27,46+2√5,89 in orders 1–6 (the other primitive order-five embedding gives 46−2√5), AK decay-volume theorem for g₂, positive-q BD modular theorem, and conjectural matrix refinements. 5₂: the GZ branch ξ³−ξ²+1=0, Im ξ<0; AK g₃ decay theorem and its explicit phase; positive-q BD modular theorem; conjectural quadratic/matrix extensions. Numerical shapes/coefficients have numerical status. Neither a torus knot nor a singular gluing solution satisfies the hyperbolic/nondegenerate hypotheses of these selected theorems.

**Proof/construction route:**

1. Use exact arithmetic and the source branches for the finite values and shape fields.
2. Record independently which source proves which analytic output.
3. Treat failed geometric/root-domain hypotheses as nonexamples rather than false theorem instances.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals`, `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`, `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`, `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`, `ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity`.

**Uses:**

- `ArithmeticQuantumTopology:QT.7`: The labelling discipline is checked against the ledger, entry by entry.
- `QSeriesPartitionsAndMockModularForms:QM.5`: The ledger is what is exported to the consuming roadmap, with the labels attached.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `Ledger` | structure | The table with one row per example and one column per kind of datum. |
| `LedgerColumn` | data | The six columns: cyclotomic coefficients, Kashaev values, invariants at roots of unity, trace field and Bloch classes, volume and Chern-Simons, asymptotic series. |
| `LedgerEntry.node` | data | For each entry, the node that produces it. |
| `LedgerEntry.status` | data | For each entry, one of the five labels: proved, imported, computed, numerical, conjectural. |
| `ledgerRows` | example | The two rows, for the figure-eight knot and for the knot five two. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `ledger_figureEight_row` | computation | Every entry of the figure-eight row is filled, and the Kashaev column reproduces the six values of the source. |
| `ledger_status_consistent` | characterisation | Each output has its own status: the selected nondegenerate formal geometric series has a source theorem, AK and BD have selected analytic theorems, while general matrix RQMC and cocycle analyticity remain conjectural. No producing conjectural statement is marked proved. |
| `ledger_traceField` | computation | The trace field of the figure-eight knot is the rationals with the square root of minus three adjoined, and of the knot five two the cubic field of the displayed polynomial. |
| `ledger_empty_column` | non-example | A column that cannot be filled for a row is recorded as empty and not as agreement; this is the discipline the ledger exists to enforce. |

**Acceptance:**

- Every entry names its node and its status.
- The labelling discipline is stated and applied.
- No entry is labelled proved whose node is conjectural.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §1, equations (1.3)–(1.4), p. 10; producing nodes cite the selected proved cases. This fixed-version locus supplies a reproducible ledger linking the four kinds of data, for two knots. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### The labelling discipline, and what the suggested Lean file contains

**Identifier:** `ArithmeticQuantumTopology:QT.7/proved-cases-conjectures-and-the-executable-boundary`. **Kind:** application. **Mathematical status:** planning-boundary.

All eight accepted QT stages are decomposed here. The suggested Lean file states concrete algebraic linking-matrix predicates, Laurent-polynomial colored-Jones interfaces, flattening charts, qualified linear NZ equations/Hessians, a prescribed-contour Faddeev strip integral, figure-eight root descendants and the conditional matrix-cocycle identity. It does not encode an arbitrary relation quotient as the extended Bloch group, arbitrary matrices as ideal triangulations, or arbitrary functions as quantum invariants. Missing geometric/ribbon/complete-integral structures are named in the omission inventory with the corresponding gap/request. Generic completions, Gaussian theory, K₃/Bloch theory, quantum modularity and cusped geometry remain supplier-owned. QT Part II’s two-variable/MMR/relative-Habiro route follows QT.2 under the accepted split.

**Proof/construction route:**

1. State each checked concrete interface at the pinned Mathlib.
2. Name each unavailable supplier object and associate it with an explicit contract.
3. Keep source theorem, conjecture, planning status and Lean implementation status independent.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/what-is-exported-to-the-habiro-roadmaps`, `ArithmeticQuantumTopology:QT.7/the-example-ledger`.

**Acceptance:**

- The five labels are defined and the classification is checkable.
- The executable content is small and named exactly.
- For each signature the missing machinery is named.

**Sources:**

- [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1), §7.1, pp. 24–26, two-variable invariant and unified Kashaev specialization. This fixed-version locus supplies the labelling discipline, and what the suggested lean file contains. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Representation-indexed knot series

**Identifier:** `ArithmeticQuantumTopology:QT.7/representation-indexed-perturbative-family`. **Kind:** construction. **Mathematical status:** comparison-obligation.

For a knot with a finite set P_K of isolated boundary-parabolic SL₂(ℂ) representations (including the trivial σ₀), fix their branches, complex-volume representatives Vσ and perturbative normalizations. The geometric σ₁ and conjugate geometric representation are distinguished. Define κσ₀=3/2 and κσ=0 otherwise, and the selected series Φ_ασ(h), with Jσ(α)=Φ_ασ(0), α∈ℚ/ℤ. The trivial series is the rootwise Taylor series of the knot Habiro element in the chosen q=e(α)e^(−h) convention; nontrivial series use a qualified formal NZ datum and its one-loop normalization. For 4₁ |P|=3 and for 5₂ |P|=4. General well-definedness for all representations/triangulations is a comparison obligation, not the geometric GSW theorem.

**Proof/construction route:**

1. Import rootwise Taylor maps for the trivial branch.
2. Extract the selected nontrivial stationary points and finite representation index from the knot data.
3. Compare each formal NZ normalization and field; require isolated nondegenerate input rather than a bare representation label.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals`, `ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance`, `ArithmeticQuantumTopology:QT.6/the-asymptotic-series-and-its-arithmetic`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`.

**Uses:**

- `ArithmeticQuantumTopology:QT.7/generalized-quantum-modularity`: Provides the index, weights and exact Jσ.
- `ArithmeticQuantumTopology:QT.7/quadratic-relations`: Specifies which nontrivial representations are summed.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `KnotPerturbativeFamily` | structure | The finite representation index, volumes, weights, branches and normalized series. |
| `representationWeight` | constructor | 3/2 on the trivial representation and zero elsewhere. |
| `generalizedKashaev` | constructor | The constant term Jσ(α) of a supplied normalized series. |
| `trivialSeries_Taylor` | compatibility | The trivial series uses the exact rootwise Habiro Taylor convention. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `representationWeight_trivial` | degenerate | κσ₀=3/2 and Vσ₀=0. |
| `representationIndex_41` | computation | The selected figure-eight family has three representations. |
| `representationIndex_52` | computation | The selected 5₂ family has four representations. |
| `nonisolated_representation` | non-example | A nonisolated or degenerate stationary point is not an input to the declared one-loop formal formula. |

**Acceptance:**

- κσ₀=3/2 and Vσ₀=0.
- The selected figure-eight family has three representations.
- The selected 5₂ family has four representations.
- A nonisolated or degenerate stationary point is not an input to the declared one-loop formal formula.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §§2.1–2.2, pp. 11–15; §3.1, pp. 15–16. This fixed-version locus supplies representation-indexed knot series. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Denominator cocycle

**Identifier:** `ArithmeticQuantumTopology:QT.7/denominator-volume-cocycle`. **Kind:** definition. **Mathematical status:** proved-source.

For γ=(a b;c d)∈PSL₂(ℤ), x=r/s∈ℚ in lowest terms with s>0 and cr+ds≠0, set λγ(x)=c/[s(cr+ds)]. It is independent of the sign of the matrix representative. Whenever γ′x and γγ′x are finite, λ_(γγ′)(x)=λγ(γ′x)+λγ′(x). The corresponding diagonal twist exp(Ṽσ λγ(x)), Ṽσ=Vσ/(2πi), combines with |cx+d|^κσ to give the GZ tweaked automorphy factor. The rational pole exclusions are part of the domain.

**Proof/construction route:**

1. Use the determinant-one relation to compute reduced numerator/denominator under γ.
2. Prove the displayed rational identity by clearing its nonzero denominators.
3. In the source proof of Lemma lem.lambda subtract the second fraction, rather than its printed plus sign (E11), before composing the diagonal factors.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.7/representation-indexed-perturbative-family`, `QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-cocycle`.

**Uses:**

- `ArithmeticQuantumTopology:QT.7/generalized-quantum-modularity`: Supplies the exponential twist.
- `ArithmeticQuantumTopology:QT.7/knot-matrix-cocycle`: Makes the diagonal factor a cocycle.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `denominatorCocycle` | constructor | λγ(x) on the declared pole-free rational domain. |
| `denominatorCocycle_comp` | compatibility | The additive composition identity with both pole exclusions. |
| `tweakedAutomorphy` | constructor | The diagonal exp(Ṽσλγ)\|cx+d\|^κσ. |
| `tweakedAutomorphy_comp` | compatibility | The factors compose on the common pole-free domain. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `lambda_T` | degenerate | For T=(1 1;0 1), λ_T(x)=0. |
| `lambda_S_one` | computation | For S=(0 −1;1 0), λ_S(1)=1. |
| `lambda_S_zero` | non-example | x=0 is excluded from λ_S because Sx is infinite. |
| `lambda_sign` | compatibility | γ and −γ give the same λ. |

**Acceptance:**

- For T=(1 1;0 1), λ_T(x)=0.
- For S=(0 −1;1 0), λ_S(1)=1.
- x=0 is excluded from λ_S because Sx is infinite.
- γ and −γ give the same λ.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §3.1, equation (3.5) and Lemma 3.1, p. 16; use E11 correction. This fixed-version locus supplies denominator cocycle. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Generalized quantum modularity

**Identifier:** `ArithmeticQuantumTopology:QT.7/generalized-quantum-modularity`. **Kind:** comparison. **Mathematical status:** conjectural.

Conjecture (GZ GQMC): for every supplied representation σ, γ=(a b;c d), c>0, and rational X→+∞ with bounded denominator, (cX+d)^(−κσ) exp(−Ṽσλγ(X))Jσ(γX)∼Jσ(X)Φ̂_(a/c)^geo(2πi/[c(cX+d)]). The trivial σ reduces to the original QMC; nontrivial σ has weight zero but retains its complex-volume twist. All-orders error statements are analytic conjectures; neither the formal series nor the cocycle identity proves them.

**Proof/construction route:**

1. Substitute the exact index, weight and denominator twist.
2. Check σ₀ reduction before allowing any nontrivial representation.
3. Keep the all-orders remainder as the precise conjectural acceptance criterion.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.7/the-quantum-modularity-conjecture`, `ArithmeticQuantumTopology:QT.7/denominator-volume-cocycle`.

**Acceptance:**

- Conjecture (GZ GQMC): for every supplied representation σ, γ=(a b;c d), c>0, and rational X→+∞ with bounded denominator, (cX+d)^(−κσ) exp(−Ṽσλγ(X))Jσ(γX)∼Jσ(X)Φ̂_(a/c)^geo(2πi/[c(cX+d)]). The trivial σ reduces to the original QMC; nontrivial σ has weight zero but retains its complex-volume twist. All-orders error statements are analytic conjectures; neither the formal series nor the cocycle identity proves them.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §3.1, equation (3.6), p. 16. This fixed-version locus supplies generalized quantum modularity. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Lift to knot power series

**Identifier:** `ArithmeticQuantumTopology:QT.7/lift-from-values-to-series`. **Kind:** comparison. **Mathematical status:** conjectural.

Conjecture (GZ §§3.2): put ℏ=h/(2πi), x=X−ℏ and h*=h/[(cx+d)(cX+d)]. The generalized value relation lifts coefficientwise to (cX+d)^(−κσ)exp(−Ṽσλγ(X))Φ_(γX)^σ(h*)∼Φ_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). In completed scalar normalization this is Φ̂_(γX)^σ(h*)∼(cx+d)^(−κσ)Φ̂_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). Formal coefficients in h each have their own all-orders 1/X assertion; one must not differentiate a rational-point asymptotic statement as if it were a smooth function.

**Proof/construction route:**

1. Compute γx=γX−h*/(2πi) exactly.
2. Expand the transformed infinitesimal coordinate coefficientwise.
3. Cancel the denominator/volume factors and recover the value statement at h=0; compare the conflicting matrix weight sign recorded in sourceIssues.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.7/generalized-quantum-modularity`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`.

**Acceptance:**

- Conjecture (GZ §§3.2): put ℏ=h/(2πi), x=X−ℏ and h*=h/[(cx+d)(cX+d)]. The generalized value relation lifts coefficientwise to (cX+d)^(−κσ)exp(−Ṽσλγ(X))Φ_(γX)^σ(h*)∼Φ_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). In completed scalar normalization this is Φ̂_(γX)^σ(h*)∼(cx+d)^(−κσ)Φ̂_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). Formal coefficients in h each have their own all-orders 1/X assertion; one must not differentiate a rational-point asymptotic statement as if it were a smooth function.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §3.2, equations (3.9)–(3.10), pp. 17–18. This fixed-version locus supplies lift to knot power series. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Quadratic relations of knot series

**Identifier:** `ArithmeticQuantumTopology:QT.7/quadratic-relations`. **Kind:** comparison. **Mathematical status:** conjectural.

Conjecture (GZ): Σ_(σ∈P_K∖{σ₀})Φ_ασ(h)Φ_(−α)^σ(−h)=0, with the chosen phases and representation index. It excludes the trivial representation. For 4₁ the identity follows formally from Φ_α^anti(h)=iΦ_(−α)^geo(−h). For 5₂ the nontrivial relation is supported by source computations, not a general theorem; its arithmetic trace interpretation must use the same embeddings and phase.

**Proof/construction route:**

1. Form the coefficientwise quadratic expression with the actual field embeddings.
2. Prove the selected 4₁ cancellation using i²=−1.
3. State the 5₂ and general relation as conjectural, recording finite coefficient checks only as experiments.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.7/representation-indexed-perturbative-family`.

**Acceptance:**

- Conjecture (GZ): Σ_(σ∈P_K∖{σ₀})Φ_ασ(h)Φ_(−α)^σ(−h)=0, with the chosen phases and representation index. It excludes the trivial representation. For 4₁ the identity follows formally from Φ_α^anti(h)=iΦ_(−α)^geo(−h). For 5₂ the nontrivial relation is supported by source computations, not a general theorem; its arithmetic trace interpretation must use the same embeddings and phase.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §3.3, equations (3.11)–(3.14), pp. 18–20. This fixed-version locus supplies quadratic relations of knot series. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Knot coefficient asymptotics

**Identifier:** `ArithmeticQuantumTopology:QT.7/coefficient-asymptotics`. **Kind:** comparison. **Mathematical status:** conjectural.

GZ’s experimental large-n expansion couples A_ασ(n)=[h^n]Φ_ασ to all other representations through Γ(n−ℓ+κσ)/(Vσ−Vσ′)^(n−ℓ+κσ), an integer matrix M_K and a phase-dependent prefactor. The printed CoeffAsymp uses (2π)^(κσ−1) and M₄₁=((0,1,−1),(0,0,−3),(0,3,0)); its phase must be reconciled with the adjacent coupled formulas containing 1/(2πi), as recorded in sourceIssues. A verified figure-eight target is AnFirst: A(n)∼(3/(2π))Σ_ℓ(−1)^ℓ A(ℓ)(n−ℓ−1)!/(2Vgeo)^(n−ℓ). Distinct action differences, branches and truncation meanings are required. These are conjectural knot statements; general resurgence/Borel summation theory is outside QT.

**Proof/construction route:**

1. Separate the observed finite coefficients from a large-n theorem.
2. Fix action branches and inspect the phase against the explicit coupled figure-eight equations.
3. For each truncation state the error criterion; do not infer a theorem from numerical agreement.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.7/representation-indexed-perturbative-family`, `ArithmeticQuantumTopology:QT.7/quadratic-relations`.

**Acceptance:**

- GZ’s experimental large-n expansion couples A_ασ(n)=[h^n]Φ_ασ to all other representations through Γ(n−ℓ+κσ)/(Vσ−Vσ′)^(n−ℓ+κσ), an integer matrix M_K and a phase-dependent prefactor. The printed CoeffAsymp uses (2π)^(κσ−1) and M₄₁=((0,1,−1),(0,0,−3),(0,3,0)); its phase must be reconciled with the adjacent coupled formulas containing 1/(2πi), as recorded in sourceIssues. A verified figure-eight target is AnFirst: A(n)∼(3/(2π))Σ_ℓ(−1)^ℓ A(ℓ)(n−ℓ−1)!/(2Vgeo)^(n−ℓ). Distinct action differences, branches and truncation meanings are required. These are conjectural knot statements; general resurgence/Borel summation theory is outside QT.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §3.4, equations (3.16)–(3.18), pp. 20–22; E12 records the phase discrepancy. This fixed-version locus supplies knot coefficient asymptotics. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Matrix refined quantum modularity

**Identifier:** `ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity`. **Kind:** comparison. **Mathematical status:** conjectural.

GZ supplies selected square matrices Φ_α^(σ,σ′)(h) and J(α)=Φ_α(0), indexed by P_K, with row-wise completions (den(α)h/(2πi))^κσ exp(Vσ/[den(α)²h]). Its matrix RQMC asserts Φ̂_(γX)(h*)≈jγ(x)Φ̂_X(h)Φ̂_(a/c)(2πi/[c(cx+d)]), x=X−h/(2πi), h*=h/[(cx+d)(cX+d)], for bounded-denominator X→+∞ and c>0. This is conjectural and also has a normalization obligation: the printed positive row-weight factor must be reconciled with the scalar completed negative factor in GQMChhh, before transporting a single convention. General matrix invertibility, topological well-definedness and analytic completion are not assumptions silently discharged by GSW’s geometric scalar theorem.

**Proof/construction route:**

1. Use the selected 4₁ and 5₂ descendant rows to specify the entries, rather than posit an arbitrary matrix invariant.
2. Test the trivial/geometric entry against the scalar lift and resolve its recorded sign discrepancy.
3. Expose invertibility, exponential ordering and all-orders coefficientwise errors as separate conjectural targets.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.7/lift-from-values-to-series`, `ArithmeticQuantumTopology:QT.7/quadratic-relations`, `ArithmeticQuantumTopology:QT.7/coefficient-asymptotics`.

**Acceptance:**

- GZ supplies selected square matrices Φ_α^(σ,σ′)(h) and J(α)=Φ_α(0), indexed by P_K, with row-wise completions (den(α)h/(2πi))^κσ exp(Vσ/[den(α)²h]). Its matrix RQMC asserts Φ̂_(γX)(h*)≈jγ(x)Φ̂_X(h)Φ̂_(a/c)(2πi/[c(cx+d)]), x=X−h/(2πi), h*=h/[(cx+d)(cX+d)], for bounded-denominator X→+∞ and c>0. This is conjectural and also has a normalization obligation: the printed positive row-weight factor must be reconciled with the scalar completed negative factor in GQMChhh, before transporting a single convention. General matrix invertibility, topological well-definedness and analytic completion are not assumptions silently discharged by GSW’s geometric scalar theorem.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §4.5, equations (4.12)–(4.14), pp. 28–30; E13 records the weight discrepancy. This fixed-version locus supplies matrix refined quantum modularity. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Knot matrix cocycle

**Identifier:** `ArithmeticQuantumTopology:QT.7/knot-matrix-cocycle`. **Kind:** construction. **Mathematical status:** comparison-obligation.

Given the selected knot matrix J(x) with invertible values and a diagonal tweaked factor j̃ satisfying j̃_(γγ′)(x)=j̃γ(γ′x)j̃γ′(x), set Wγ(x)=J(γx)⁻¹j̃γ(x)J(x) on the common rational pole-free domain. Then W_(γγ′)(x)=Wγ(γ′x)Wγ′(x) is a proved algebraic identity under these explicit hypotheses. GZ’s general invertibility/unimodularity assertion is conjectural, so the unconditional knot theorem requires that separate comparison. QT owns the selected knot matrix and this comparison; the general quantum modular/cocycle framework is imported from QM.5.

**Proof/construction route:**

1. Use the supplier matrix-valued cocycle interface.
2. Multiply the matrices in order and cancel J(γ′x)J(γ′x)⁻¹.
3. For a knot-specific application establish J invertibility first; diagonal commutation justifies reversing the source’s order for j̃.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.7/denominator-volume-cocycle`, `ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity`, `QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-cocycle`.

**Uses:**

- `ArithmeticQuantumTopology:QT.7/cocycle-analytic-extension`: Defines the rational cocycle whose extension is conjectured.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `knotMatrixCocycle` | constructor | The stated conjugated automorphy factor on its domain. |
| `knotMatrixCocycle_comp` | compatibility | The ordered multiplicative cocycle identity under invertibility. |
| `knotMatrixCocycle_id` | simp | The identity group element gives the identity matrix. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `matrixCocycle_constant` | degenerate | J=I and j̃=I give W=I. |
| `matrixCocycle_noncommutative_order` | compatibility | The composition multiplies Wγ(γ′x) before Wγ′(x). |
| `matrixCocycle_singular_J` | non-example | A singular J(x) does not define a GL-valued W by this formula. |

**Acceptance:**

- J=I and j̃=I give W=I.
- The composition multiplies Wγ(γ′x) before Wγ′(x).
- A singular J(x) does not define a GL-valued W by this formula.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §5.1, equations (5.1)–(5.3), pp. 31–33. This fixed-version locus supplies knot matrix cocycle. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Analytic extension of the knot cocycle

**Identifier:** `ArithmeticQuantumTopology:QT.7/cocycle-analytic-extension`. **Kind:** comparison. **Mathematical status:** conjectural.

GZ conjectures that Wγ on ℚ∖{γ⁻¹(∞)} extends real analytically to ℝ∖{γ⁻¹(∞)}. For c≠0 the exceptional point is −d/c. The restriction to (−d/c,∞) extends holomorphically to ℂ∖(−∞,−d/c], and the restriction to (−∞,−d/c) extends holomorphically to ℂ∖[−d/c,∞). For c=0 there is no finite exceptional point. RQMC further predicts Wγ(X)≈Φ̂_(a/c)(2πi/[c(cX+d)])⁻¹ for c>0. Algebraic composition and formal inverses do not prove any analytic extension. Generic smooth/holomorphic quantum modular criteria are requested from QM.5, Part II; QT supplies the knot matrices.

**Proof/construction route:**

1. Specify the exceptional point and the exact source cut for each transformation.
2. Prove continuity and analyticity for the selected knot kernels if available; otherwise retain the conjecture.
3. Only after extension transport the rational composition identity by continuity.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.7/knot-matrix-cocycle`, `ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity`, `QSeriesPartitionsAndMockModularForms:QM.5`, `mathlib:MeasureTheory.integral`, `mathlib:Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

**Acceptance:**

- GZ conjectures that Wγ on ℚ∖{γ⁻¹(∞)} extends real analytically to ℝ∖{γ⁻¹(∞)}. For c≠0 the exceptional point is −d/c. The restriction to (−d/c,∞) extends holomorphically to ℂ∖(−∞,−d/c], and the restriction to (−∞,−d/c) extends holomorphically to ℂ∖[−d/c,∞). For c=0 there is no finite exceptional point. RQMC further predicts Wγ(X)≈Φ̂_(a/c)(2πi/[c(cX+d)])⁻¹ for c>0. Algebraic composition and formal inverses do not prove any analytic extension. Generic smooth/holomorphic quantum modular criteria are requested from QM.5, Part II; QT supplies the knot matrices.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §5.2, Conjecture 5.1 and conditional Proposition 5.2, pp. 34–37; §5.4, pp. 40–42; both cut planes specified on p. 7. This fixed-version locus supplies analytic extension of the knot cocycle. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Figure-eight Habiro descendants

**Identifier:** `ArithmeticQuantumTopology:QT.7/figure-eight-habiro-descendants`. **Kind:** construction. **Mathematical status:** proved-source.

For m∈ℤ define H_m(q)=Σ_(n≥0)(q;q)_n(q⁻¹;q⁻¹)_n q^(mn) in the integral ordinary Habiro ring. Laurent monomials q^(mn) cause no denominator problem because q is a unit; the summands are cofinally factorial-divisible. The exact recurrence is q^(m+1)H_(m+1)+(1−2q^m)H_m+q^(m−1)H_(m−1)=1. H₀ is the figure-eight Kashaev element, and the first descendant matrix row is (1,H₀,½(qH₁−q⁻¹H₋₁)); the last entry is in ½ times the integral Habiro ring. Its Taylor coefficient of (q−1)² is −½, so it is not an element of the integral ℤ-Habiro ring. The source explicitly only asserts visible integral membership after multiplying this entry by 2. Nontrivial matrix rows involve the selected shape-field branches and are not ordinary integral Habiro elements by this formula alone.

**Proof/construction route:**

1. Construct the sum using the imported factorial-series convergence and q-unit theorem.
2. Telescope the shifted summands to prove the inhomogeneous recurrence in every finite quotient, then pass to the inverse limit.
3. Specialize at roots by truncating at their order. For Q₂=½(qH₁−q⁻¹H₋₁), the n=0 summand is (q−q⁻¹)/2=(q−1)−(q−1)²/2+⋯; every n≥1 summand has order at least 3. This detects its coefficient-ring localization.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `HabiroCyclotomicCompletions:HC.2/factorial-series`, `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Uses:**

- `ArithmeticQuantumTopology:QT.6/what-is-exported-to-the-habiro-roadmaps`: Gives a concrete topological ordinary-ring input.
- `ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity`: Supplies the selected figure-eight trivial descendant row.

**API outline**

| Declaration | Role | Specification |
| --- | --- | --- |
| `figureEightDescendant` | constructor | The integral Habiro series H_m for every integer m. |
| `figureEightDescendant_recurrence` | compatibility | The displayed inhomogeneous three-term recurrence. |
| `figureEightDescendant_eval` | compatibility | At a root of order N only n<N contribute. |
| `figureEightDescendant_firstRow` | compatibility | The trivial row (1,H₀,Q₂) in the scalar extension by ½, with 2Q₂ integral; Q₂ is not in the integral ℤ-Habiro ring. |

**Unit tests**

| Test | Kind | Required result |
| --- | --- | --- |
| `descendant_root_one` | degenerate | ev₁H_m=1 for every m. |
| `descendant_root_minus_one` | computation | ev₋₁H_m=1+4(−1)^m. |
| `descendant_root_three` | computation | For a primitive cube root ζ, evζH₀=13. |
| `descendant_recurrence_root_one` | compatibility | At q=1 the recurrence gives 1−1+1=1. |
| `descendant_half_row_not_integral` | non-example | The Taylor coefficient of (q−1)² in Q₂ is −½; an implementation placing this matrix entry in the integral ℤ-Habiro ring contradicts its Taylor map. |

**Acceptance:**

- ev₁H_m=1 for every m.
- ev₋₁H_m=1+4(−1)^m.
- For a primitive cube root ζ, evζH₀=13.
- At q=1 the recurrence gives 1−1+1=1.

**Sources:**

- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §7.1, pp. 52–56, descendant sums and recurrence. This fixed-version locus supplies figure-eight habiro descendants. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### Proved quantum modularity cases

**Identifier:** `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`. **Kind:** theorem. **Mathematical status:** proved-source.

Bettin–Drappeau prove positive-q modular asymptotics for the ten hyperbolic knots 4₁,5₂,6₁,6₂,6₃,7₃,7₄,7₅,7₆,7₇ (7₂ is excluded). Write J⁺_K(x)=J^red_(K,c)(exp(2πix)), c=den(x). For γ with α=γ∞∈ℚ and h=2πi/(x−γ⁻¹∞), for every M and rational x→+∞ of bounded denominator: J⁺_K(γx)/J⁺_K(x)=(2π/h)^(3/2)exp(i(Vol−iCS)/h)C_K(α)(Σ_(0≤n<M)D_(K,n)(α)h^n+O(h^M)). The error constant depends on α, the denominator bound and M; D_(K,n)∈F_K(e(α)); C=e(ν_K s(α)/2)c^(ν_K/2)Λ_(K,α)^(1/c)δ_K^(−1/2), with Λ in that field and δ in F_K. Branches follow the source. Its positive-q convention is compared explicitly with GZ’s negative-q colored-Jones definition before identifying phases; the general matrix refinements are not proved by this theorem.

**Proof/construction route:**

1. Use the source’s exact finite Pochhammer reciprocity formula with holomorphic error and prescribed branches.
2. Insert each of the ten explicit knot sums, and use the selected all-orders stationary-phase arithmeticity theorem; demand a source-level proof and uniform error estimates at the supplier boundary.
3. Identify the field and the Dedekind/Gauss constants; correct the source table’s 5₁ label to the hyperbolic 5₂.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals`, `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`, `Polylogarithms:P.1`, `HabiroNahmSeries:HB.4`, `QSeriesPartitionsAndMockModularForms:QM.0`.

**Acceptance:**

- Bettin–Drappeau prove positive-q modular asymptotics for the ten hyperbolic knots 4₁,5₂,6₁,6₂,6₃,7₃,7₄,7₅,7₆,7₇ (7₂ is excluded). Write J⁺_K(x)=J^red_(K,c)(exp(2πix)), c=den(x). For γ with α=γ∞∈ℚ and h=2πi/(x−γ⁻¹∞), for every M and rational x→+∞ of bounded denominator: J⁺_K(γx)/J⁺_K(x)=(2π/h)^(3/2)exp(i(Vol−iCS)/h)C_K(α)(Σ_(0≤n<M)D_(K,n)(α)h^n+O(h^M)). The error constant depends on α, the denominator bound and M; D_(K,n)∈F_K(e(α)); C=e(ν_K s(α)/2)c^(ν_K/2)Λ_(K,α)^(1/c)δ_K^(−1/2), with Λ in that field and δ in F_K. Branches follow the source. Its positive-q convention is compared explicitly with GZ’s negative-q colored-Jones definition before identifying phases; the general matrix refinements are not proved by this theorem.

**Sources:**

- [Modularity and value distribution of quantum invariants of hyperbolic knots](https://arxiv.org/abs/1905.02045v2), Theorem 1, §1, p. 2; reciprocal Pochhammer and knot proofs in §§2–3, pp. 8–30. This fixed-version locus supplies proved quantum modularity cases. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

### AK knot comparison conjecture

**Identifier:** `ArithmeticQuantumTopology:QT.7/ak-knot-comparison-conjecture`. **Kind:** comparison. **Mathematical status:** conjectural.

Conjecture (AK, for a hyperbolic knot K in a closed oriented compact 3-manifold M): there is a smooth J_(M,K)(ℏ,x) on ℝ_>0×ℝ. (1) Every fully balanced positive ideal triangulation X of M∖K has a gauge-invariant real linear angle form λ and a real quadratic angle form φ with Z_ℏ(X)=exp(iφ/ℏ)∫ℝ J_(M,K)(ℏ,x)exp(−xλ/√ℏ)dx. (2) For any positive one-vertex H-triangulation Y approachable by weights tending to τ(K)=0 and τ(other edges)=2π, there is a real quadratic angle form ϕ such that lim_(ω→τ) Φ_b((π−ω(K))/(2πi√ℏ))Z_ℏ(Y)=exp(iϕ/ℏ−iπ/12)J_(M,K)(ℏ,0). (3) lim_(ℏ→0+)2πℏ log|J_(M,K)(ℏ,0)|=−Vol(M∖K). All relevant existence, convergence and limiting conditions are part of the conjecture. AK’s Theorem th:4-1--5-2 proves its three parts for (S³,4₁) and (S³,5₂), using χ₄₁ and χ₅₂. The general analytic/formal NZ identification additionally needs matched saddle, logarithmic branches, classical action, one-loop determinant and all-orders error estimates; no such universal comparison follows from formal Pachner invariance.

**Proof/construction route:**

1. State AK’s three conjectural comparisons separately from the general invariant’s proved admissible invariance.
2. For the selected two knots import the explicit χ calculation and the qualified steepest-descent target, keeping its unit-modulus phase.
3. For any proposed NZ comparison match the actual contour-selected saddle and classical/one-loop normalization before claiming agreement, then require uniform all-orders asymptotic control.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance`, `ArithmeticQuantumTopology:QT.6/selected-analytic-state-integrals`, `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`, `ArithmeticQuantumTopology:QT.6/formal-nz-state-integral`.

**Acceptance:**

- Conjecture (AK, for a hyperbolic knot K in a closed oriented compact 3-manifold M): there is a smooth J_(M,K)(ℏ,x) on ℝ_>0×ℝ. (1) Every fully balanced positive ideal triangulation X of M∖K has a gauge-invariant real linear angle form λ and a real quadratic angle form φ with Z_ℏ(X)=exp(iφ/ℏ)∫ℝ J_(M,K)(ℏ,x)exp(−xλ/√ℏ)dx. (2) For any positive one-vertex H-triangulation Y approachable by weights tending to τ(K)=0 and τ(other edges)=2π, there is a real quadratic angle form ϕ such that lim_(ω→τ) Φ_b((π−ω(K))/(2πi√ℏ))Z_ℏ(Y)=exp(iϕ/ℏ−iπ/12)J_(M,K)(ℏ,0). (3) lim_(ℏ→0+)2πℏ log|J_(M,K)(ℏ,0)|=−Vol(M∖K). All relevant existence, convergence and limiting conditions are part of the conjecture. AK’s Theorem th:4-1--5-2 proves its three parts for (S³,4₁) and (S³,5₂), using χ₄₁ and χ₅₂. The general analytic/formal NZ identification additionally needs matched saddle, logarithmic branches, classical action, one-loop determinant and all-orders error estimates; no such universal comparison follows from formal Pachner invariance.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), Conjecture 1 and Theorem 5, §1.9, p. 11. The AK general knot comparison and negative decay-volume limit are conjectural; the following theorem supplies exactly the two stated knot cases.

### Kashaev volume conjecture

**Identifier:** `ArithmeticQuantumTopology:QT.7/kashaev-volume-conjecture`. **Kind:** comparison. **Mathematical status:** conjectural.

For a hyperbolic knot K⊂S³, put ⟨K⟩_N=J^red_(K,N)(exp(2πi/N)), with dimension N and zero framing, reduced before root evaluation. The volume conjecture is lim_(N→∞)(2π/N)log|⟨K⟩_N|=Vol(S³∖K). It is conjectural for general K. With the unknot/reduced and negative-q conventions compared, γ=S sends X=N to −1/N in the quantum modular conjecture and recovers this leading exponential assertion. The volume assertion is weaker than an all-orders QMC expansion. AK’s negative decay-volume limit concerns a different analytic invariant and is not a proof of this growth statement. The separate BD theorem supplies its specified family and stronger QMC asymptotics with the positive-q normalization.

**Proof/construction route:**

1. Use the Kashaev/colored-Jones comparison to fix the finite-N invariant.
2. Formulate the logarithmic limit with the positive primitive root and complete volume.
3. Take the leading exponential of the S specialization only after checking the rational q and mirror/conjugation comparison.

**Direct prerequisites:** `ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals`, `ArithmeticQuantumTopology:QT.7/the-quantum-modularity-conjecture`.

**Acceptance:**

- For a hyperbolic knot K⊂S³, put ⟨K⟩_N=J^red_(K,N)(exp(2πi/N)), with dimension N and zero framing, reduced before root evaluation. The volume conjecture is lim_(N→∞)(2π/N)log|⟨K⟩_N|=Vol(S³∖K). It is conjectural for general K. With the unknot/reduced and negative-q conventions compared, γ=S sends X=N to −1/N in the quantum modular conjecture and recovers this leading exponential assertion. The volume assertion is weaker than an all-orders QMC expansion. AK’s negative decay-volume limit concerns a different analytic invariant and is not a proof of this growth statement. The separate BD theorem supplies its specified family and stronger QMC asymptotics with the positive-q normalization.

**Sources:**

- [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2), §1.9, p. 11, volume-conjecture qualification following Conjecture 1. This source explicitly distinguishes its decay conjecture from the usual Kashaev growth conjecture; the GZ QMC source supplies the S specialization.
- [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3), §1, equations (1.1), (1.5)–(1.6), pp. 9–11. This fixed-version locus supplies the conjecture, with its exact normalisation and its domain. The node states the conventions and any extra hypotheses explicitly; its proofSteps give the source-to-interface route.

## Exact supplier contracts

A fine supplier node is cited directly when its statement matches. These eighteen open contracts retain the exact requested scope and route.

### tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here

Import the framed oriented multi-component link/tangle carrier, finite component set, pairwise linking number, integer Seifert framing, diagram/braid comparison and framed isotopy. Supply the exact normalized Jones polynomial (unknot 1, t=A⁻⁴) and prove its relation to J_K(V₁)/[2], including q versus q⁻¹ and mirror/orientation conventions. Tau Gauss codes describe one knot; unframed MarkovEquiv does not discharge framed links.

**Consumers:** `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`, `ArithmeticQuantumTopology:QT.1/bottom-tangle`, `ArithmeticQuantumTopology:QT.1/reshetikhin-turaev-functor`, `ArithmeticQuantumTopology:QT.2/jones-normalization-comparison`.

**Status:** open. **Route:** GeometricTopology, Part II for any missing link/tangle/framing comparison.

### tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery

Import oriented surgery with slope fμ+λ, H₁≅coker linking matrix, IHS iff det=±1, and ordinary Kirby/Fenn–Rourke presentation calculus. Supply stable diagonalization of the integral unimodular form and its realization by ordinary moves used in admissible-presentation existence. QT proves only the admissible band-slide/Hoste refinements.

**Consumers:** `ArithmeticQuantumTopology:QT.0/surgery-presentation`, `ArithmeticQuantumTopology:QT.0/kirby-and-fenn-rourke-moves`, `ArithmeticQuantumTopology:QT.0/refined-presentation-existence`.

**Status:** open. **Route:** GeometricTopology, Part II.

### tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group

Oriented manifold gluing, connected sum and orientation reversal with the surgery split-union comparison; the topological operation is imported before proving quantum multiplicativity. Supply the finite ordered oriented pseudo-3-manifold CW face-pairing carrier, punctured (co)homology, normal curves/relative chains and their Mayer–Vietoris gluing used in AK’s H₂ admissibility proof. These are GeometricTopology, Part II inputs; QT adds the charged positive angles, levels and analytic invariant.

**Consumers:** `ArithmeticQuantumTopology:QT.3/JM-connected-sum-and-orientation`, `ArithmeticQuantumTopology:QT.6/ak-leveled-positive-shapes`, `ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance`.

**Status:** open. **Route:** GeometricTopology, Part II where the exact oriented interface is absent.

### tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume

Extend the closed geometric/Mostow material to ideal ordered face-pairing triangulations of complete finite-volume cusped hyperbolic 3-manifolds: developing maps, peripheral completeness, Mostow–Prasad rigidity, ordered hybrid refinements, Epstein–Penner canonical cell decompositions, connectivity of their regular refinements (allowing flat nondegenerate tetrahedra), and geometric local rigidity/nonzero NZ Hessian. Keep this distinct from a bare matrix gluing solution or the closed-only Mostow theorem.

**Consumers:** `ArithmeticQuantumTopology:QT.5/ideal-tetrahedron-and-shape`, `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`, `ArithmeticQuantumTopology:QT.5/strong-flattening`, `ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance`.

**Status:** open. **Route:** GeometricTopology, Part II.

### Polylogarithms:P.2

Supply the oriented ideal-tetrahedron identity Vol(z)=D(z), its ordering/sign convention and comparison with the weight-two regulator on the field Bloch class. QT imports that identity and assembles the flattened signed sum; it does not reprove tetrahedron volume.

**Consumers:** `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`, `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`.

**Status:** open. **Route:** Polylogarithms, Part II only for the geometric comparison not already in P.2.

### K3BlochGroups:V.3

Compare Neumann’s ker(2z∧(1−z)) convention with the supplier exterior kernel, antisymmetric-tensor Bloch group and published CGZ convention, retaining integral two-torsion. Supply the exact map for the verified geometric Σ ε[z] over a number field; do not identify all conventions integrally.

**Consumers:** `ArithmeticQuantumTopology:QT.5/extended-bloch-kernel`, `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`, `ArithmeticQuantumTopology:QT.6/nz-to-integral-nahm`.

**Status:** open. **Route:** Stage-level supplier contract.

### K3BlochGroups:V.4

Use the precise Suslin exact sequence to compare a verified ordinary geometric Bloch class with K₃^ind; identify the torsion ambiguity. The extended group H₃(PSL₂(ℂ)^δ) and complex regulator are QT-owned and do not follow merely from ordinary Suslin.

**Consumers:** `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`, `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`.

**Status:** open. **Route:** Stage-level supplier contract.

### K3BlochGroups:V.6

Import the Suslin lift fibre and torsion bookkeeping for a field-valued geometric Bloch class. A canonical K₃ lift is not inferred from numerical shapes or a unique B̂(ℂ) manifold class.

**Consumers:** `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`, `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`.

**Status:** open. **Route:** Stage-level supplier contract.

### HabiroNahmSeries:HB.4

Import the filtered formal Gaussian bracket and its finiteness/valuation hypotheses. Extend the analytic toolkit, where absent, with source-level finite Pochhammer reciprocity (BD §2), prescribed branches and holomorphic error uniform on the domains used in BD §3, plus uniform steepest-descent/tail/deformation estimates for AK’s selected contours. No analytic remainder follows from the formal bracket.

**Consumers:** `ArithmeticQuantumTopology:QT.6/formal-nz-state-integral`, `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`, `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`.

**Status:** open. **Route:** Stage-level supplier contract.

### HabiroNahmSeries:HB.8

Use the corrected reviewed refined Gaussian collection and normalization, including its classical logarithmic term, shift convention and phase. Supply the precise comparison needed to strip the NZ classical exponential/one-loop factors in the qualified integral-Nahm bridge.

**Consumers:** `ArithmeticQuantumTopology:QT.6/nz-to-integral-nahm`, `ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison`.

**Status:** open. **Route:** Stage-level supplier contract.

### HabiroNumberFields:HB.6

Supply the early Frobenius coefficient ring R with its nondegeneracy/unit/bad-prime conditions in the integral-NZ example, using the HB.6 stage’s exact arithmetic scope.

**Consumers:** `ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison`.

**Status:** open. **Route:** Stage-level supplier contract.

### HabiroNumberFields:HB.7

Supply the K₃-indexed twisted Habiro module over R[δ⁻¹/²], roots of order prime to Δ, and its index in the checked Bloch convention. Do not substitute the untwisted ordinary ring.

**Consumers:** `ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison`.

**Status:** open. **Route:** Stage-level supplier contract.

### QSeriesPartitionsAndMockModularForms:QM.0

Supply Bernoulli/Pochhammer and convergent infinite-product identities with their convergence/branch domains for the formal vertex series, Faddeev product and finite reciprocal knot sums.

**Consumers:** `ArithmeticQuantumTopology:QT.6/formal-nz-state-integral`, `ArithmeticQuantumTopology:QT.6/faddeev-functional-inversion`, `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`.

**Status:** open. **Route:** Stage-level supplier contract.

### QSeriesPartitionsAndMockModularForms:QM.5

Extend the scalar period-cocycle interface to matrix-valued multiplicative cocycles on common pole-free domains, with branch-aware weights and smooth/holomorphic extension criteria. QT owns only its knot matrices and comparisons. Generic formal/noncommutative q-dilogarithm pentagon remains HC.1; no dependency from QM.5 back to QT.7 is needed.

**Consumers:** `ArithmeticQuantumTopology:QT.7/denominator-volume-cocycle`, `ArithmeticQuantumTopology:QT.7/knot-matrix-cocycle`, `ArithmeticQuantumTopology:QT.7/cocycle-analytic-extension`.

**Status:** open. **Route:** QSeriesPartitionsAndMockModularForms, Part II where this general interface is absent.

### AutomorphicSpectralTheory:AS.0

Supply the general unbounded self-adjoint spectral calculus, Schrödinger position/momentum on L²(ℝ), their common Schwartz core and the self-adjoint closure of p+q, including the extension from core equalities to bounded unitary functional-calculus operators. QT proves the Faddeev operator identity on that imported interface. Also supply the nuclear Schwartz-kernel theorem for continuous maps S(ℝⁿ)→S′(ℝᵐ), partial Fourier/polarization transforms and their action on kernels. Generic wavefront pullback/product and the enlarged-test-space pushforward extension are an additional microlocal distribution input, proposed as PDE, Part II in upstreamNotes; AS.0 is not claimed to contain them already.

**Consumers:** `ArithmeticQuantumTopology:QT.6/faddeev-operator-pentagon`, `ArithmeticQuantumTopology:QT.6/ak-charged-tetrahedron-kernel`, `ArithmeticQuantumTopology:QT.6/ak-charged-pentagon`, `ArithmeticQuantumTopology:QT.6/ak-leveled-state-integral`, `ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance`.

**Status:** open. **Route:** AutomorphicSpectralTheory, Part II for the missing generic operator interface.

### Polylogarithms:P.1

Import the actual dilogarithm branch/continuation, Bloch–Wigner function and nonpositive polylogarithm rational functions needed by the Rogers and formal vertex formulas; exact branch conventions are part of the interface.

**Consumers:** `ArithmeticQuantumTopology:QT.6/formal-nz-state-integral`, `ArithmeticQuantumTopology:QT.6/faddeev-quantum-dilogarithm`, `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`, `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`.

**Status:** open. **Route:** Stage-level supplier contract.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ

Import the classical enveloping algebra/PBW, highest-weight modules and rank-one calculations; root-space/root-datum inputs are the upstream layers 1–2. QT constructs the quantized Drinfeld–Jimbo algebra, its integral form and quantum PBW/core, rather than re-plan the classical theory.

**Consumers:** `ArithmeticQuantumTopology:QT.1/general-drinfeld-jimbo-algebra`, `ArithmeticQuantumTopology:QT.2/finite-free-colors`.

**Status:** open. **Route:** Stage-level supplier contract.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition

Import the fixed simple-root datum, root-space decomposition and coroot sl₂ triples, with upstream RootSystems providing root/weight lattices and Weyl action. QT uses these as the Cartan/root input for its quantized presentation, not a second root-system development.

**Consumers:** `ArithmeticQuantumTopology:QT.1/general-drinfeld-jimbo-algebra`.

**Status:** open. **Route:** Stage-level supplier contract.

## Recorded gaps

### ArithmeticQuantumTopology/G1 — Geometric link/surgery contracts

The pinned presentations do not supply a framed multi-link quotient, linking number/surgery carrier or ordinary Kirby theorem. The exact GeometricTopology Part II contracts, including stable unimodular-form realization, precede the QT refined calculus and JM proof. No alternate carrier is defined here.

**Consumers:** `ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix`, `ArithmeticQuantumTopology:QT.0/surgery-presentation`, `ArithmeticQuantumTopology:QT.0/refined-presentation-existence`, `ArithmeticQuantumTopology:QT.3/JM-well-defined`.

### ArithmeticQuantumTopology/G2 — Complete quantum algebra and integral core

Mathlib supplies ordinary Hopf/monoidal/rigid structures but no topological ribbon quantum algebra, its completed tensor powers, ribbon twist, quantum PBW basis, tilting quotient or integral clasp/core. The source-decomposed targets and APIs specify these objects; implementing them needs the quantum-specific completed tensor/continuity constructions over the cited pinned base-module completions, and the requested classical highest-weight interfaces. In particular, Habiro–Le §2.7’s universal J_T for arbitrary topological ribbon H and its finite-color trace compatibility are needed by general-core-filtration and general-wrt-comparison; the rank-one universal-sl2-invariant is insufficient. Construct the generic finite highest-weight colors V_λ and their quantum dimensions/traces from §3 and §8.2 before strong-kirby-colors; rank-one coloured-jones does not supply them.

**Consumers:** `ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra`, `ArithmeticQuantumTopology:QT.1/ribbon-category`, `ArithmeticQuantumTopology:QT.1/general-integral-core`, `ArithmeticQuantumTopology:QT.2/completed-even-center`, `ArithmeticQuantumTopology:QT.4/general-core-filtration`, `ArithmeticQuantumTopology:QT.4/general-wrt-comparison`, `ArithmeticQuantumTopology:QT.4/strong-kirby-colors`.

### ArithmeticQuantumTopology/G3 — Jones/root convention comparison

Prove the exact variable/mirror convention linking geometric Jones(t), Habiro J_K(V₁)/[2], MM’s positive-q reduced polynomial and GZ’s negative-q definition. At roots reduce before specializing, retain fourth-root lifts and distinguish strong Kirby admissibility from semisimple/modular alcove hypotheses.

**Consumers:** `ArithmeticQuantumTopology:QT.2/jones-normalization-comparison`, `ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals`, `ArithmeticQuantumTopology:QT.1/root-of-unity-categories-are-not-generically-semisimple`, `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`.

### ArithmeticQuantumTopology/G4 — Cusped ordered geometry and trace-field descent

Supplier closed Mostow material alone does not provide complete cusped ideal face-pairings, EP/refinement connectivity, strong ordered hybrid flattenings or geometric NZ local rigidity. A general claim that the signed Bloch class descends to the invariant trace field needs a separate algebraicity/boundary argument; only the explicitly checked figure-eight field example is used without it.

**Consumers:** `ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations`, `ArithmeticQuantumTopology:QT.5/strong-flattening`, `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`, `ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance`.

### ArithmeticQuantumTopology/G5 — Integral and extended Bloch comparisons

Neumann’s factor-two ordinary boundary, exterior kernel, antisymmetric tensor and published CGZ convention must be compared with the named supplier maps. The full extended group needs its actual cut cover, lifted component, transfer relations and strong normal-path conditions. A Suslin lift retains torsion ambiguity; no canonical lift follows from a B̂(ℂ) class.

**Consumers:** `ArithmeticQuantumTopology:QT.5/extended-pre-bloch`, `ArithmeticQuantumTopology:QT.5/extended-bloch-kernel`, `ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class`, `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`.

### ArithmeticQuantumTopology/G6 — NZ-to-Habiro normalization

HB.9 applies to symmetric integral Nahm matrices, not every rational NZ matrix. Verify B unimodular, parity compatibility, isolated nondegenerate shapes, arithmetic R/Δ and the correct Bloch index, then compare GSW unit formal series with the HB.8 collection’s classical exponential, phase and one-loop factor. General module membership remains a comparison obligation. Root-refined DG2 arithmetic must use the filtered diagram definition and actual Kummer translations; reconcile E17–E21 and match the τ factor with the HB.8 normalization before claiming the rootwise Habiro collection comparison. The imported HB.8 refinement-gaussian-identification is conditional on its own G1 global-prefactor and G2 regularity gaps and the coprime auxiliary order; those conditions must be retained. Also compare the full cyclotomic coefficient tensor algebra with the chosen F(ζ) component before identifying collections.

**Consumers:** `ArithmeticQuantumTopology:QT.6/nz-to-integral-nahm`, `ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison`, `ArithmeticQuantumTopology:QT.6/root-nz-data`, `ArithmeticQuantumTopology:QT.6/root-refined-nz-series`, `ArithmeticQuantumTopology:QT.6/root-series-arithmetic`.

### ArithmeticQuantumTopology/G7 — Analytic contour and operator closure

Prove the prescribed Faddeev strip integral/continuation and large-argument estimates; import the self-adjoint Schrödinger/functional-calculus interface. For AK’s selected n=2,3 contours supply explicit uniform tails, deformation and O(ℏ) estimates: its short steepest-descent argument is not yet a Lean proof. The BD theorem needs its actual reciprocal Pochhammer errors and selected stationary-phase arithmeticity input, not the formal Gaussian theorem alone. For the general AK theorem establish the nuclear-kernel and microlocal contraction interface on pinned TemperedDistribution: wavefront transversality, product and extension to the enlarged Schwartz space before pushforward. Supply the geometric H₂ exclusion and exponential decay estimate rather than treating every distribution product as defined. A general AK/NZ all-orders analytic comparison needs the matched saddle, branch, action and one-loop factor plus uniform remainder estimates; it is not asserted proved.

**Consumers:** `ArithmeticQuantumTopology:QT.6/faddeev-quantum-dilogarithm`, `ArithmeticQuantumTopology:QT.6/faddeev-operator-pentagon`, `ArithmeticQuantumTopology:QT.6/selected-state-integral-volume`, `ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases`, `ArithmeticQuantumTopology:QT.6/ak-charged-tetrahedron-kernel`, `ArithmeticQuantumTopology:QT.6/ak-charged-pentagon`, `ArithmeticQuantumTopology:QT.6/ak-leveled-state-integral`, `ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance`, `ArithmeticQuantumTopology:QT.7/ak-knot-comparison-conjecture`.

### ArithmeticQuantumTopology/G8 — Conjectural knot refinements and normalization discrepancies

General GQMC, lifts, quadratic/coefficient relations, matrix RQMC, invertibility and analytic cocycle extensions remain conjectural. Resolve the scalar-versus-matrix weight sign and the large-order coefficient phase in the fixed GZ source before a normalized matrix theorem. Conditional algebraic cocycle composition is proved independently of these conjectures.

**Consumers:** `ArithmeticQuantumTopology:QT.7/lift-from-values-to-series`, `ArithmeticQuantumTopology:QT.7/coefficient-asymptotics`, `ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity`, `ArithmeticQuantumTopology:QT.7/cocycle-analytic-extension`.

## Pinned declaration audit

- [`mathlib:CategoryTheory.MonoidalCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean): Monoidal categories with associators and unitors; the ambient structure a ribbon category refines.

- [`mathlib:CategoryTheory.BraidedCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean): Braided monoidal categories with the hexagon axioms; the braiding of a ribbon category is one of these.

- [`mathlib:CategoryTheory.ExactPairing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean): Duality data (evaluation and coevaluation with the triangle identities) for a single pair of objects.

- [`mathlib:CategoryTheory.RigidCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean): Left and right duals for every object; the duality half of a ribbon category.

- [`mathlib:HopfAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/HopfAlgebra/Basic.lean): Hopf algebras over a commutative ring, with antipode; the ordinary (non-braided) case of the structures used here.

- [`mathlib:Polynomial.cyclotomic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): The cyclotomic polynomials over a ring, which cut out the evaluation ideals of the Habiro ring.

- [`mathlib:IsPrimitiveRoot`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean): Primitive roots of unity and their order; the evaluation points of the quantum invariants.

- [`mathlib:Complex.log`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Complex/Log.lean): The principal logarithm Real.log(norm z)+arg(z)i, including log 0=0. QT excludes 0 and 1 and keeps cut-side transitions separately.

- [`mathlib:Matrix.det`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): Determinants, used for the linking matrix conditions on an admissible framed link.

- [`tauceti:TauCeti.BasedOrientedGaussCode.writhe`](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/GaussCode/Basic.lean): The writhe of a based oriented Gauss code, the blackboard framing comparison used to normalise framings.

- [`tauceti:TauCeti.FramedMarkovBraid`](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/Markov.lean): A Markov braid together with integer framing on each closure component (cycles of its permutation). It is presentation data, not a framed Markov quotient.

- [`tauceti:TauCeti.MarkovEquiv`](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/Markov.lean): The equivalence closure of the unframed Markov moves on MarkovBraid. It does not by itself identify framed link types.

- [`mathlib:CategoryTheory.LeftRigidCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean): Left duals with their evaluation and coevaluation; the duality the quantum trace is built from.

- [`mathlib:CategoryTheory.RightRigidCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean): Right duals, the other half of the duality a ribbon category needs.

- [`mathlib:Polynomial.Chebyshev.S`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Chebyshev.lean): Second-kind polynomials S₀=1, S₁=X, S_(n+2)=XS_(n+1)−S_n. QT identifies V_n with S_n(V₁); these polynomials are not by themselves colored unknot values.

- [`mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): For n>0 the product of cyclotomic polynomials over divisors of n equals X^n−1. The positivity hypothesis is retained.

- [`mathlib:AdicCompletion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean): For a commutative base ring R, ideal I and R-module M, the compatible inverse-limit family M/(I^n M). It is Hausdorff; completeness requires additional hypotheses, e.g. finite generation of I. This supplies base-module h-adic completion, not completed noncommutative tensor multiplication.

- [`mathlib:UniformSpace.Completion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/Completion.lean): The Hausdorff uniform completion as the separation quotient of Cauchy filters, with its complete-space structure; continuity/uniform-continuity hypotheses must be supplied for extending operations.

- [`mathlib:MeasureTheory.integral`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Bochner/Basic.lean): The Bochner integral into a complete real normed space, specialized to ℂ along real horizontal contour parameters. It is total and returns zero for nonintegrable functions, so an Integrable theorem is essential.

- [`mathlib:Complex.integral_boundary_rect_eq_zero_of_differentiableOn`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/CauchyIntegral.lean): Cauchy–Goursat on a closed complex rectangle for a complex-differentiable function, with the four oriented boundary interval integrals. Sending vertical sides to infinity still needs explicit tail estimates.

- [`mathlib:SchwartzMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean): Smooth maps between real normed spaces with every iterated derivative bounded after multiplication by every norm power; the locally convex Schwartz test space.

- [`mathlib:TemperedDistribution`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TemperedDistribution.lean): The complex continuous-linear dual of SchwartzMap, with topology of pointwise convergence. It supplies the distribution carrier, not the strong-dual topology, wavefront theory or arbitrary products.

- [`mathlib:TemperedDistribution.delta`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TemperedDistribution.lean): Point evaluation as a complex tempered distribution; delta x applied to a Schwartz test f is f(x). A hyperplane delta kernel additionally needs pullback/extension.

- [`mathlib:SchwartzMap.fourierTransformCLM`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean): The Fourier transform as a continuous linear map on Schwartz functions on a finite-dimensional real inner-product space, with the complex scalar-action and completeness hypotheses of its source. Nuclear kernel and wavefront product results do not follow from this map.

## Primary-source register

The inherited source-package records below describe the earlier planning pass. Separately labelled PDF checks on 2026-10-08 verify the cited target and correction loci, rather than a whole-paper re-extraction. Page numbers refer to the fixed PDF’s printed numbering; PDF leaf numbers are added where these differ. No source passages are stored here.

### A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres

Kazuo Habiro. Public arXiv math/0605314v1 (version explicitly fixed). [Public source](https://arxiv.org/abs/math/0605314v1).

**Planning-pass coverage:** 1 Introduction (1.1-1.4); 2 The algebra U_h(sl_2) and its subalgebras; 3 Braided Hopf algebra structure; 4 Universal sl_2 invariant of bottom tangles; 5 Colored Jones polynomials; 6 Knots; 8 Algebraically-split links; 9 Twists; 10 The invariant J_M; 11 Specializations at roots of unity; 12 Some properties of J_M (12.1-12.6); 7.1 Two-variable colored Jones and θ₀ unified Kashaev specialization; the full relative construction is routed to Part II

**Inherited SHA-256:** `79069d6aa22d8c0b439e79db3348184c6c089336c64f804ded6a99162a72c136` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/math/0605314v1), 2026-10-08. SHA-256: `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Extended Bloch group and the Cheeger-Chern-Simons class

Walter D. Neumann. Public arXiv math/0307092v2 (version explicitly fixed). [Public source](https://arxiv.org/abs/math/0307092v2).

**Planning-pass coverage:** §§1–4 extended group, cut cover, lifted five-term and transfer relations, strong flattening and labelled cycles; §§5–9 developing map, class invariance, exact sequence and λ theorem proof route; §14 complete finite-volume cusped manifolds, ordered hybrid refinements and Dehn-filling qualification

**Inherited SHA-256:** `0553bc88d84bedfeb05a86e28a3c03ea57fb855e5fad1033d28f1eeeca715889` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/math/0307092v2), 2026-10-08. SHA-256: `de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Unified quantum invariants for integral homology spheres associated with simple Lie algebras

Kazuo Habiro and Thang T. Q. Le. Public arXiv 1503.03549v2 (version explicitly fixed). [Public source](https://arxiv.org/abs/1503.03549v2).

**Planning-pass coverage:** §§1–2 core framework, exact invariance assumptions and twist normalization; §§3–5 quantum PBW/core and parity degree construction; §§6–7 K_n, integral subalgebra and AL1/AL2 route; §8.1–8.7 strong Kirby colors and WRT comparison; Appendix C admissibility/Gauss table; Appendices A/B/D consulted at the needed basis/duality proof references; not an assertion that each auxiliary lemma is decomposed.

**Inherited SHA-256:** `26e864007db4145e1a58374432c5eb52901c02cfe47f36194f60a8b7d1292dfd` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/1503.03549v2), 2026-10-08. SHA-256: `234eae71d85a7b282e9b197ae505edb804d631fe6c33b3d641425de0dc9ae490`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; E3/E4/E5/E14 also independently collated with the published Geometry & Topology version recorded below.

### Knots, perturbative series and quantum modularity

Stavros Garoufalidis and Don Zagier. Public arXiv 2111.06645v3 (version explicitly fixed). [Public source](https://arxiv.org/abs/2111.06645v3).

**Planning-pass coverage:** §1 colored-Jones/Kashaev and volume conventions; §§2–3 representation families, scalar lifts, quadratic and coefficient-asymptotic refinements; §§4–5 matrix RQMC and conditional cocycle, analytic-extension conjecture; §7.1 descendant Habiro elements and recurrence; selected NZ/shape comparison passages; Remaining generic resurgence, summation and new number-field completion machinery is supplier-owned or an explicit non-goal.

**Inherited SHA-256:** `e923db265b5ee7a5f97ad132c715b6b3688de56ab68cc225a1e3f46666e199ce` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/2111.06645v3), 2026-10-08. SHA-256: `2a4826bd1c2f0823c99f8e3cccfd835c5044d70d30eb20b36fea38dcb8dd83de`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Perturbative invariants of cusped hyperbolic 3-manifolds

Stavros Garoufalidis, Matthias Storzer, Campbell Wheeler. Public arXiv 2305.14884v2. [Public source](https://arxiv.org/abs/2305.14884v2).

**Planning-pass coverage:** Introduction; §§2–3; geometric invariance route

**Inherited SHA-256:** `419c23ec08742107393e1240793fc1a3ab9b2a11c42e5a89658442dd249cb22d` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/2305.14884v2), 2026-10-08. SHA-256: `ebc8e64d901c9e4f397ece6170c92d5d65045ef7fbb15d251a268327acf7e1fb`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### The Habiro ring of a number field

Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier. Public arXiv 2412.04241v2. [Public source](https://arxiv.org/abs/2412.04241v2).

**Planning-pass coverage:** §§1.7–1.8; integral Nahm matrix, NZ bridge, Theorem 5 used through reviewed suppliers

**Inherited SHA-256:** `b93170cf809075112bd80fb4e0df299baf96d3dc3eb0c79f37aa60b1a0d8fd66` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/2412.04241v2), 2026-10-08. SHA-256: `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### A TQFT from quantum Teichmüller theory

Jørgen Ellegaard Andersen, Rinat Kashaev. Public arXiv 1109.6295v2. [Public source](https://arxiv.org/abs/1109.6295v2).

**Planning-pass coverage:** Introduction: shapes, gauges, leveled Pachner equivalence, admissibility, distributional composition, Main and knot Conjecture; §§2–8: reduction, tetrahedral operators, charged pentagon, Fundamental Lemma, gauge, geometric constraints and convergence; selected knot examples and steepest descent; Appendices A–C

**Inherited SHA-256:** `c77c8050459fb78d7b82d8f19ffe6fe44b33fafb500c800e221cffdfa4c921a5` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/1109.6295v2), 2026-10-08. SHA-256: `cbbac2dcec624a2a541fb770f312a5bd2a6051fe79f3ae7cd02a7d19ab9ba24d`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Modularity and value distribution of quantum invariants of hyperbolic knots

Sandro Bettin, Sary Drappeau. Public arXiv 1905.02045v2. [Public source](https://arxiv.org/abs/1905.02045v2).

**Planning-pass coverage:** Introduction and Theorem 1; §2 reciprocal Pochhammer formulas; §3 proof route

**Inherited SHA-256:** `12b5aba4519d26f5a97f1e1a1e766e8e912cff1f8b98da3fcdb6461e5664a240` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/1905.02045v2), 2026-10-08. SHA-256: `b4445e018b072843481b6e3756071920ae78e4c5f511c5807c59dabe2ab2be43`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Bottom tangles and universal invariants

Kazuo Habiro. Public arXiv math/0505219v2. [Public source](https://arxiv.org/abs/math/0505219v2).

**Planning-pass coverage:** Bottom-tangle category, local moves, universal invariant and integral-image results

**Inherited SHA-256:** `687c7e56ad7fa5a9eb1dff14e9ea17d9c8df3bece26169bc710ab3ca05b9f06b` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/math/0505219v2), 2026-10-08. SHA-256: `ed52afc409ae4c20186c4fcd2bc286effaf0cd5aaa5a787663592f577f3adfd1`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### An integral form of the quantized enveloping algebra of sl2 and its completions

Kazuo Habiro. Public arXiv math/0605313v1. [Public source](https://arxiv.org/abs/math/0605313v1).

**Planning-pass coverage:** Integral forms/completions; Theorems labelled thm:27 and thm:38

**Inherited SHA-256:** `74867203519e9d2a0c4169c909b0564ddae61c464a9e4d320d6eea45d1aa11e3` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/math/0605313v1), 2026-10-08. SHA-256: `b466d7d47865e3a4e7ef4a7363646cd119ff640785b3ec0423365666ed069c7e`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Refined Kirby calculus for integral homology spheres

Kazuo Habiro. Public arXiv math/0509039v2. [Public source](https://arxiv.org/abs/math/0509039v2).

**Planning-pass coverage:** Introduction; Main Lemma; admissible calculus and Hoste corollary proofs

**Inherited SHA-256:** `4d5bd3bfa8b3dd982f09638515dd78c57dddbaaf76f5dfb565ef299ff289d208` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/math/0509039v2), 2026-10-08. SHA-256: `d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### The colored Jones polynomials and the simplicial volume of a knot

Hitoshi Murakami, Jun Murakami. Public arXiv math/9905075v1. [Public source](https://arxiv.org/abs/math/9905075v1).

**Planning-pass coverage:** Colored Jones/Kashaev comparison theorem and normalization

**Inherited SHA-256:** `f6d950a39802a41555a1bb4985925a6d9350fba4210ae474e69383b784f375e1` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/math/9905075v1), 2026-10-08. SHA-256: `1c44f987c72009deae98c9506c8d4f4e487c19488ae3ac51735f422724b1a5da`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Quantum knot invariants and the Habiro ring

Campbell Wheeler. Public arXiv 2603.01619v1. [Public source](https://arxiv.org/abs/2603.01619v1).

**Planning-pass coverage:** §1.3, Theorem 1.3 and Corollary 1.5, pp. 3–4, knot-specific relative-Habiro routing; the generic relative rings are imported from HabiroRings HR.1/HR.5.

**Inherited SHA-256:** `28db73fb6dc465ded7038fa328aaac410e8858adf5f8648eb19abc7cd7ef7dab` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/2603.01619v1), 2026-10-08. SHA-256: `5118504bb5d9d4b9bcda509e08ce85f5b29361df5d249b3017c33d56847605c8`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Quantum groups at roots of unity and modularity

Stephen F. Sawin. Public arXiv math/0308281v2. [Public source](https://arxiv.org/abs/math/0308281v2).

**Planning-pass coverage:** Root conventions and alcove; tilting modules; negligible quotient; modularity restrictions

**Inherited SHA-256:** `05e7638ebefe517a94f3e1ff82624bde45c961f96bec5a912cb6ae64ab8f856f` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/math/0308281v2), 2026-10-08. SHA-256: `c3d929cbbc920627e53dbba011dbc86bf361d4ec6401cf8143ba9fbf0b7556ab`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Fixed public arXiv version; no claim of collation with the published version.

### Ribbon graphs and their invariants derived from quantum groups

N. Yu. Reshetikhin, V. G. Turaev. Communications in Mathematical Physics 127 (1990), 1–26. [Public source](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf).

**Planning-pass coverage:** §§2–5; §6.1

**Locus check:** 2026-10-08. Read §§2–5 and §6.1 through the public author PDF; ribbon definitions are in §3.3, p. 7. No downloaded-PDF checksum is asserted.

**Version scope:** §§2–5 and §6.1 read in browser; no local hash asserted.

### The quantum content of the gluing equations

Tudor Dimofte and Stavros Garoufalidis. Public arXiv 1202.6268v2 (fixed version). [Public source](https://arxiv.org/abs/1202.6268v2).

**Planning-pass coverage:** §§1–3 NZ datum, one-loop and formal perturbation; conventions compared with GSW

**Inherited SHA-256:** `1b55aeb941d883a64c6bc905aad9082ee0264912a311e29ec16591d1c1f9b519` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/1202.6268v2), 2026-10-08. SHA-256: `209af6ae25439050acd32974f2c6eeb4d407661c14b064472346b33807ae019f`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Read sections listed in sources; hash is of source download.

### Quantum modularity and complex Chern–Simons theory

Tudor Dimofte and Stavros Garoufalidis. Public arXiv 1511.05628v1 (fixed version). [Public source](https://arxiv.org/abs/1511.05628v1).

**Planning-pass coverage:** §1 QMC and volume specialization; §2.1–2.4 root data, one-loop, diagrams; §2.8 invariance conjecture; §3 arithmetic descent and cyclic identities; Published pp. 5–16 corresponding loci collated

**Inherited SHA-256:** `06a7f8d12dcb712cd5a1c6ca46e85f7160f83e2c5983619d1699e782efbf6709` (arXiv source download, not the PDF). Earlier access: 2026-10-06.

**PDF locus check:** [Fixed PDF](https://arxiv.org/pdf/1511.05628v1), 2026-10-08. SHA-256: `3b9da2994233882bdb242798fd1a5f85e53f1d0fd66410809de751d056a07d3a`. Checked the target loci and numbered/page locators cited by this packet; this is a PDF hash, distinct from the retained source-package hash.

**Version scope:** Read sections listed in sources; hash is of source download.

### Additional version-of-record records

These three published-version records bring the packet’s source-version inventory to twenty. Their scopes are the specific collation loci stated below; preprint-only corrections retain their stated version limits.

- [SIGMA 20 (2024), 055, 87 pages](https://www.imath.kiev.ua/~sigma/2024/055/sigma24-055.pdf). Read 2026-10-06. GZ correction loci in §§3.1–3.4 and 4.5 checked against the journal PDF; other node statements and correction loci use the fixed TeX version.

- [Reshetikhin–Turaev, CMP 127 (1990), 1–26](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf). Read 2026-10-06. §§2–5 and §6.1 read in browser; no local hash asserted.

- [Dimofte–Garoufalidis, CNTP 12(1) (2018), 1–52](https://people.mpim-bonn.mpg.de/stavros/publications/printed/quantum_modularity_and_complex_chern_simons_theory.pdf). Read 2026-10-06. SHA-256: `93708694a71286338539c7696e884b211bb6a773be29c91c79e0f77e3bca5b0f`. Published pp. 5–16 collated for NZ, Kummer, root-series and cyclic formulas.

- [Habiro–Le, Geometry & Topology 20 (2016), 2687–2835, DOI 10.2140/gt.2016.20.2687](https://msp.org/gt/2016/20-5/gt-v20-n5-p04-s.pdf). Read 2026-10-06. SHA-256: `f86c3f0565b7ccbfe36c72289e2376170bcb604b990bf4bb879990f747665a3e`. Independent collation of E3, E4, E5 and E14: (54), p. 2728; (177), p. 2797; Corollaries C.6/C.8, p. 2828; §8C2, p. 2796. These slips remain in this published text.
  Rechecked 2026-10-08: Rechecked (54), p. 2728; (177), p. 2797; Corollaries C.6/C.8, p. 2828; §8C2, p. 2796. All four reviewed corrections remain necessary.

## Source corrections and proof boundaries

The packet records twenty-two independently confirmed findings. Each entry describes the defect in our own words and gives its correction, reason, affected scope, verification verdict and correction-search history. The independent verdicts are retained; this author revision does not issue a new independent errata review. The four Habiro–Le published loci were rechecked in this run, and the GZ record is scoped to the fixed SIGMA text.

### ArithmeticQuantumTopology/E1 — misprint

**Source/locus:** habiro2008, §6.2, p. 21, final coefficient equality in the proof of Theorem 6.4, using Proposition 6.3; fixed arXiv math/0605314v1.

**Defect described:** The coefficient-duality calculation ends with the summed index p in its output coefficient.

**Correction:** Replace the final a_p(T) with a_m(T). **Reason:** The preceding sum is Σ_p a_p(T)δ_mp, whose value is a_m(T); p is bound. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed in the coefficient-duality calculation: the Kronecker delta leaves the free m-index, not the summed p-index.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Publisher/author-copy access search; no version-of-record collation established, so the finding is scoped to the fixed public preprint only.

### ArithmeticQuantumTopology/E2 — misprint

**Source/locus:** habiro2008, §12.1, p. 39, proof of Proposition 12.1; fixed arXiv math/0605314v1.

**Defect described:** The connected-sum calculation repeats the M factor and loses the M′ factor.

**Correction:** The second factor is τζ(M′). **Reason:** The surgery split-union calculation and the immediately stated JM formula have the distinct two manifolds. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed: the split-union calculation has M and M′; repeating M in the WRT factor is a transcription slip.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Publisher/author-copy access search; no version-of-record collation established, so the finding is scoped to the fixed public preprint only.

### ArithmeticQuantumTopology/E3 — misprint

**Source/locus:** habiro-le-unified-simple-lie, §3.1, equation (54), p. 37, fixed arXiv 1503.03549v2; published (54), p. 2728.

**Defect described:** The relation for commuting Kβ past Fα instead has Eα on its right side.

**Correction:** The right-hand side is v^(−(β,α))FαKβ. **Reason:** The stated weight of Fα and the neighboring Eα relation require Fα; the printed relation collapses the intended triangular algebra. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed in arXiv v2 and published (54), p. 2728: the lowering generator must remain Fα. The neighboring weight relations and triangular PBW decomposition rule out Eα.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Geometry & Topology version of record and author copy accessed on 2026-10-06; same slip persists at the published locator.

### ArithmeticQuantumTopology/E4 — misprint

**Source/locus:** habiro-le-unified-simple-lie, §8.4.2, equation (177), p. 92, fixed arXiv 1503.03549v2; published (177), p. 2797.

**Defect described:** The surgery normalization leaves both unknot signs ambiguous, despite separate positive and negative signatures.

**Correction:** Use (J_U+(Ω))^σ+ (J_U−(Ω))^σ−. **Reason:** Adding a +1 or −1 isolated unknot must cancel the corresponding distinct Gauss factor, respectively. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed in arXiv v2 and published (177), p. 2797: positive and negative surgery stabilizations require their respective nonzero Gauss factors, not an undifferentiated ± in both factors.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Geometry & Topology version of record and author copy accessed on 2026-10-06; same slip persists at the published locator.

### ArithmeticQuantumTopology/E5 — error

**Source/locus:** habiro-le-unified-simple-lie, Appendix C, Corollaries C.6/C.8, p. 117, fixed arXiv 1503.03549v2; published p. 2828.

**Defect described:** The two Gauss-sum corollaries select the listed vanishing conditions as admissible conditions.

**Correction:** In both corollaries use the complement of the listed vanishing conditions. **Reason:** The preceding propositions characterize exactly Gauss=0, while admissible strong Kirby colors require nonzero Gauss. For A₁ an order congruent to 2 modulo 4 is on the vanishing list and cannot be admitted. **Affects:** a stated result.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed in the version of record, Corollaries C.6/C.8, p. 2828: Propositions C.5(a)/C.7(a) list precisely the zero Gauss sums, whereas the defining Kirby condition (176) requires nonzero sums. The complement is required. The A₁ order-2-mod-4 example gives a direct failure.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Geometry & Topology version of record and author copy accessed on 2026-10-06; same slip persists at the published locator.

### ArithmeticQuantumTopology/E6 — misprint

**Source/locus:** gswz, §1.7, equations (34)–(35), p. 13, fixed arXiv 2412.04241v2.

**Defect described:** Each product repeats the fixed j-coordinate rather than using its varying i-coordinate.

**Correction:** The product factor is z_i(t)^(A_ij), and likewise z_i in the undeformed equation. **Reason:** A Nahm equation uses every coordinate. The source’s own subsequent displayed rational P_i(z) and potential derivative use z_j under the other fixed index, confirming the intended matrix coupling. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed: a coupled matrix Nahm equation varies the product index i. The source potential derivative and subsequent P_i display agree with the corrected z_i factor.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Publisher/author-copy access search; no version-of-record collation established, so the finding is scoped to the fixed public preprint only.

### ArithmeticQuantumTopology/E7 — misprint

**Source/locus:** bd, §1, Figure 1, p. 2, fixed arXiv 1905.02045v2.

**Defect described:** The hyperbolic ten-knot table names the five-crossing torus knot 5₁.

**Correction:** The hyperbolic five-crossing entry is 5₂. **Reason:** The theorem requires hyperbolicity and the surrounding explicit five-crossing calculation is for 5₂; 5₁ is the torus knot T(2,5). **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed: the listed five-crossing hyperbolic case and surrounding computations are 5₂; the printed 5₁ is the torus-knot entry and does not satisfy the theorem’s domain.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Publisher/author-copy access search; no version-of-record collation established, so the finding is scoped to the fixed public preprint only.

### ArithmeticQuantumTopology/E8 — misprint

**Source/locus:** ak, §12, p. 32, χ-to-g identifications; fixed arXiv 1109.6295v2.

**Defect described:** The identifications of the two χ-values with g₂ and g₃ omit their unit complex phases.

**Correction:** Use χ₄₁(0)=ζ_inv⁻¹g₂(ℏ) and χ₅₂(0)=exp(−iπ/3)g₃(ℏ), in the source inversion convention. **Reason:** At x=0 inversion Φ(−y)Φ(y)=ζ_inv⁻¹exp(iπy²) converts χ₄₁’s ratio to ζ_inv⁻¹Φ(y)⁻²exp(iπy²). The defining χ₅₂ formula already has exp(−iπ/3). Both factors have modulus one for real b, leaving the volume limits unchanged. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed by substituting the source inversion identity into χ₄₁ at zero and the explicit χ₅₂ definition. The omitted factors have absolute value one for real b, so the selected volume limit is unaffected.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Publisher/author-copy access search; no version-of-record collation established, so the finding is scoped to the fixed public preprint only.

### ArithmeticQuantumTopology/E9 — gap

**Source/locus:** ak, §12, pp. 32–34, contour deformation and steepest-descent argument; fixed arXiv 1109.6295v2.

**Defect described:** The limiting contour deformation is asserted without the uniform end and tail estimates needed for the integral comparison.

**Correction:** Supply pole-free deformation, the vanishing estimates on connecting ends, uniform small-b convergence near the selected saddle, and uniform tail bounds justifying the O(ℏ) expansion. **Reason:** Pointwise quantum-dilogarithm asymptotics do not justify interchange with an unbounded contour integral or prove that a limiting steepest contour has the same integral. The packet retains the source theorem as a target with this explicit proof boundary. **Affects:** the proof.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed as a proof gap rather than disproof of the theorem: the asserted unbounded-contour deformation needs pole exclusion, decay of connecting segments and uniform saddle/tail estimates. Pointwise asymptotics alone do not supply these; G7 retains them.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Publisher/author-copy access search; no version-of-record collation established, so the finding is scoped to the fixed public preprint only.

### ArithmeticQuantumTopology/E10 — error

**Source/locus:** sawin, §6, Theorem 3, p. 24, fixed arXiv math/0308281v2.

**Defect described:** The finite-free ribbon carrier over A′ is also asserted to be abelian.

**Correction:** The finite-free category is a ribbon category; the stated abelian assertion over A′ needs an enlarged carrier or different hypotheses. **Reason:** For the trivial action on the rank-one free A′-module, multiplication by a nonzero nonunit has zero categorical kernel and cokernel within finite-free modules, but is not an isomorphism. Equivalently its module cokernel has torsion and leaves the carrier. The root-of-unity quotient over a field is not affected by this objection. **Affects:** a stated result.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed for the integral finite-free carrier: multiplication by 2 on the trivial rank-one A′-module is both monic and epic in that carrier but has no inverse. An abelian category would force an isomorphism. This does not object to the specialized field-valued tilting quotient.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- Publisher/author-copy access search; no version-of-record collation established, so the finding is scoped to the fixed public preprint only.

### ArithmeticQuantumTopology/E11 — misprint

**Source/locus:** garoufalidis-zagier-quantum-modularity, §3.1, Lemma 3.1 proof, p. 16, fixed arXiv 2111.06645v3 (SIGMA text).

**Defect described:** The rational calculation for the difference of two λ-values adds its second fraction.

**Correction:** The second fraction is subtracted. **Reason:** The left-hand side is λ_(γγ′)−λγ′. Taking γ=identity already contradicts the printed plus sign when λγ′≠0. The lemma itself uses the correct sum formula. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed by setting γ to the identity in the printed difference calculation; the plus sign leaves twice the nonzero λγ′. Subtraction gives the lemma’s correct additive cocycle formula.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- SIGMA version-of-record PDF and journal article page, read 2026-10-06.

### ArithmeticQuantumTopology/E12 — error

**Source/locus:** garoufalidis-zagier-quantum-modularity, §3.4, equation (3.18) versus the coupled formulas (3.15)–(3.16), pp. 20–21, fixed arXiv 2111.06645v3 (SIGMA text).

**Defect described:** The general coefficient-asymptotic prefactor has a phase inconsistent with the neighboring coupled figure-eight formulas.

**Correction:** Resolve the phase normalization in the general conjectural display before applying it. Keep AnFirst and the explicit coupled formulas as separate normalization tests; do not silently transport the printed general prefactor. **Reason:** For κσ=0 the preceding coupled formula has 3/(2πi), whereas the printed matrix M₄₁ has entry −3 and the general prefactor is 1/(2π). With the stated same Aσ and Vσ conventions these are different phases. **Affects:** a stated result.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed against both fixed preprint and published SIGMA text: at κ=0 the coupled 4₁ formula has the phase 3/(2πi), while the cited general matrix display supplies −3/(2π). This is a normalization obstruction in a conjectural display, not a disproved theorem.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- SIGMA version-of-record PDF and journal article page, read 2026-10-06.

### ArithmeticQuantumTopology/E13 — error

**Source/locus:** garoufalidis-zagier-quantum-modularity, §4.5, equations (4.12)–(4.13), p. 30, versus §3.2, equation (3.10), p. 18, fixed arXiv 2111.06645v3 (SIGMA text).

**Defect described:** The matrix completion uses a positive row weight while the scalar completed lift uses its negative.

**Correction:** Reconcile the matrix completion/weight convention with the scalar completed formula’s negative exponent before claiming a normalized entrywise lift. **Reason:** The printed scalar completed lift has (cx+d)^(−κσ), while MatQMC0/MatQMC uses the positive row-weight automorphy factor on the same completed scalar entry. Substitution of h*=h/((cx+d)(cX+d)) and den(γX)=den(X)|cX+d| gives the negative scalar power. This is a normalization obstruction to importing both displays unchanged. **Affects:** a stated result.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed against both fixed preprint and published SIGMA text: substitution of h* and the denominator transformation into the completed scalar formula produces the negative row weight. The matrix display prints the positive weight on the same completed entry. G8 retains the necessary reconciliation; no normalized matrix theorem is imported.

**Correction-search record:** new.

- The fixed arXiv source and its correction/erratum references.
- arXiv version page and title/author erratum searches on 2026-10-06; no identified correction.
- SIGMA version-of-record PDF and journal article page, read 2026-10-06.

### ArithmeticQuantumTopology/E14 — misprint

**Source/locus:** habiro-le-unified-simple-lie, §8.3.2, p. 91, fixed arXiv 1503.03549v2; published §8C2, p. 2796.

**Defect described:** The evaluation discussion uses the half-sized root-lift exponent, inconsistent with its specified q-value.

**Correction:** The exponent is 1/D: v^(1/D)=ζ implies q=v²=ζ^(2D)=ξ. **Reason:** The evaluation map in the preceding sentence and ξ=ζ^(2D) fix this lift. With the printed exponent q would instead be ζ^(4D). **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed in arXiv v2 and published §8C2, p. 2796: q=v² and ξ=ζ^(2D) require v^(1/D)=ζ. The printed 1/(2D) gives q=ζ^(4D).

**Correction-search record:** new.

- The fixed source and its correction references.
- arXiv version page and title/author erratum search on 2026-10-06; no identified correction.
- Earlier search record (superseded by the published collation below): No version-of-record collation established; finding scoped to the fixed public preprint.
- Geometry & Topology version of record and author copy accessed on 2026-10-06; same slip persists at the published locator.

### ArithmeticQuantumTopology/E15 — misprint

**Source/locus:** ak, §1.7, Theorem 4, equation (4), p. 9, fixed arXiv 1109.6295v2.

**Defect described:** The main tetrahedron display uses an undefined α₃ and the wrong denominator angle index.

**Correction:** Use α₂ in the numerator’s linear term and α₀ in the denominator shift, with the printed α_i=α(∂i∂₀T)/π, i=0,1,2. The packet uses the unambiguous charged-T and tet-fun kernel instead. **Reason:** For a=α₀/2, c=α₂/2 and b=α₁/2, ψ̃′_(a,c)=exp(−πi/12)ψ_(c,b). This gives linear term α₂ and denominator shift 1−α₀; its constant equals the printed φ_T. α₃ is undefined in Main. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed by the charged-T identity ψ̃′_(a,c)=exp(−πi/12)ψ_(c,b), with a=α₀/2,c=α₂/2,b=α₁/2. The numerator uses α₂ and denominator 1−α₀; α₃ is undefined in the printed angle assignment. The packet uses the unambiguous charged kernel.

**Correction-search record:** new.

- Fixed source and its correction/erratum references.
- arXiv history and publisher article page read on 2026-10-06; v2 is the latest public source. Title/author erratum searches found no identified correction.
- No version-of-record formula collation established; the finding is scoped to the fixed public preprint.

### ArithmeticQuantumTopology/E16 — misprint

**Source/locus:** murakami, §5, p. 15, connected-sum formula; fixed arXiv math/9905075v1.

**Defect described:** The connected-sum product has an unspecified K where its first summand is K₁.

**Correction:** Replace K by K₁ in the first factor. **Reason:** The displayed left side is K₁♯K₂ and K has not been specified. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed: the connected-sum input is K₁#K₂ and the first right-hand factor must use K₁; the bare K has no antecedent.

**Correction-search record:** new.

- Fixed arXiv version/history, title/author erratum search and author publication list checked on 2026-10-06; no identified correction.
- No version-of-record collation established; finding scoped to the fixed preprint only.

### ArithmeticQuantumTopology/E17 — misprint

**Source/locus:** dg2, §2.1(a), p. 5, fixed arXiv 1511.05628v1; published p. 5(a).

**Defect described:** Both Neumann–Zagier blocks are required to be invertible integer matrices in the initial datum description.

**Correction:** Use integer matrices A,B with (A|B) full rank and ABᵀ symmetric; B invertibility is an extra restriction, and integer invertibility is imposed for the selected root construction. **Reason:** Gluing matrices need not both be unimodular; the same text separately defines ℤ-nondegeneracy by invertibility of B. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed against the published p. 5 statement: the subsequent separate definition of Z-nondegeneracy of B and general gluing linear algebra do not justify A,B∈GL(N,Z). The packet restricts B explicitly for the selected construction.

**Correction-search record:** new.

- Fixed arXiv version/history, title/author erratum search and author publication list checked on 2026-10-06; no identified correction.
- Corresponding printed locus collated against CNTP 12(1) (2018) PDF; same mathematical issue remains. The PDF hash and URL are in sourceVersions.

### ArithmeticQuantumTopology/E18 — error

**Source/locus:** dg2, §2.1, p. 5, Kummer group after root rotations; fixed arXiv 1511.05628v1; published p. 6.

**Defect described:** Independent rotations of all chosen shape roots are asserted to generate the full product Kummer Galois group.

**Correction:** The actual Kummer Galois group is a subgroup of (ℤ/kℤ)^N; shape multiplicative relations constrain rotations. Carry simultaneous admissible root rotations, or work in the universal finite étale root algebra before specialization. **Reason:** For repeated shapes and choices θ₁=θ₂, no field automorphism can rotate only θ₁. The arithmetic proof can be repaired by simultaneous translations of m, but the asserted independent generators do not always exist. **Affects:** the proof.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed against the published p. 6 statement: repeated shapes with equal chosen roots prohibit an automorphism rotating only one root. The actual Galois group is a subgroup. Simultaneous index translations in the universal root algebra repair the descent argument.

**Correction-search record:** new.

- Fixed arXiv version/history, title/author erratum search and author publication list checked on 2026-10-06; no identified correction.
- Corresponding printed locus collated against CNTP 12(1) (2018) PDF; same mathematical issue remains. The PDF hash and URL are in sourceVersions.

### ArithmeticQuantumTopology/E19 — error

**Source/locus:** dg2, §2.3, equations (19)–(21), pp. 6–7, fixed arXiv 1511.05628v1; published pp. 9–10; compare §2.4, pp. 8–9, and Lemma 2.8.

**Defect described:** The unscaled formal block has a nonunit constant contribution and omits the cubic vertices required by the diagram expansion.

**Correction:** The unit-series construction needs the degree-filtered rescaling specified in root-refined-nz-series: h^(n+j/2−1), n+j/2>1, n≥0. Equivalently use the source’s explicit diagram rules with Π=hkΛ⁻¹ and the four Γ valence ranges. **Reason:** As printed the n=1,j=0 term already gives a nontrivial h⁰ exponential; n=0 cubic vertices are missing, and fixed-degree Gaussian evaluation is not finite with the unscaled x-series. This contradicts the stated constant 1 and the subsequent diagram rules. **Affects:** a stated result.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed against published (19)–(21): the literal unscaled block has a nontrivial h⁰ term at n=1,j=0 and misses n=0 cubic interactions. The degree-filtered expansion h^(n+j/2−1) with n+j/2>1 agrees with the source’s later valence rules and makes every Gaussian coefficient finite.

**Correction-search record:** new.

- Fixed arXiv version/history, title/author erratum search and author publication list checked on 2026-10-06; no identified correction.
- Corresponding printed locus collated against CNTP 12(1) (2018) PDF; same mathematical issue remains. The PDF hash and URL are in sourceVersions.

### ArithmeticQuantumTopology/E20 — misprint

**Source/locus:** dg2, §3.2, Lemma 3.3(d) and proof, p. 14, fixed arXiv 1511.05628v1; published Lemma 3.3(d).

**Defect described:** The fourth cyclic identity uses a primitive-root prefactor inconsistent with the product of its leading coefficients.

**Correction:** Use the exact prefactor (−1)^(k(k−1)/2)ζ^(k(k−1)(2k−1)/6)x^(k(k−1)/2). In the proof, each (−ζx)^s is (−ζ^s x)^s. The other three cyclic identities are unchanged. **Reason:** At k=3 and ζ=exp(2πi/3), the product of leading coefficients is −ζ^5=exp(πi/3), whereas the printed prefactor is exp(4πi/3). Factoring each (1−ζ^s x)^s proves the exact product for every primitive ζ. **Affects:** a stated result.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed against published Lemma 3.3(d) by factoring the k−1 leading terms. For k=3 the exact coefficient −ζ^5 is exp(πi/3), rather than the printed exp(4πi/3). The packet uses the exact ζ-dependent product.

**Correction-search record:** new.

- Fixed arXiv version/history, title/author erratum search and author publication list checked on 2026-10-06; no identified correction.
- Corresponding printed locus collated against CNTP 12(1) (2018) PDF; same mathematical issue remains. The PDF hash and URL are in sourceVersions.

### ArithmeticQuantumTopology/E21 — misprint

**Source/locus:** dg2, §3.3, proof of Theorem 2.2, pp. 14–16, fixed arXiv 1511.05628v1; published p. 16.

**Defect described:** The coordinate Neumann–Zagier formula drops the parity sign present in the preceding vector identity.

**Correction:** Retain (−1)^((B⁻¹ν)_j) in the coordinate formula, as in the immediately preceding vector equation. **Reason:** Taking the j-th coordinate of z″=(−1)^(B⁻¹ν) z^(−B⁻¹A) retains the sign. It enters ε_j^k in the compensation identity; odd parity cannot be discarded. **Affects:** the proof.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. Confirmed against published p. 16: the coordinate formula must retain (−1)^((B⁻¹ν)_j). With it the one-loop compensation has a residual sign killed by the stated 2k power; the final arithmetic target remains sound.

**Correction-search record:** new.

- Fixed arXiv version/history, title/author erratum search and author publication list checked on 2026-10-06; no identified correction.
- Corresponding printed locus collated against CNTP 12(1) (2018) PDF; same mathematical issue remains. The PDF hash and URL are in sourceVersions.

### ArithmeticQuantumTopology/E22 — misprint

**Source/locus:** habiro2008, §12.2, Proposition 12.3 proof, p. 40, congruence before f_i; fixed arXiv math/0605314v1.

**Defect described:** The Bézout congruence uses the index q where the construction requires the coefficient indexed by i.

**Correction:** Replace u_q(q) by u_i(q). **Reason:** The preceding sentence chooses the polynomial u_i(q); the subsequent definition of f_i uses that same polynomial. No u_q is defined. **Affects:** nothing.

**Independent verdict:** confirmed by REV-ArithmeticQuantumTopology. The index i labels the Bezout inverse for the i-th cyclotomic polynomial throughout the immediately surrounding argument. The isolated q-subscript is a typographical slip; no change to Proposition 12.3 is needed.

**Correction-search record:** new.

- Fixed arXiv math/0605314v1 source and version page.
- Title/author erratum searches on 2026-10-06; no identified correction.
- Publisher/author-copy access search did not establish version-of-record collation for this paper; this finding is scoped to the fixed preprint.

## Follow-up boundaries and acceptance

A follow-up discharges the exact gaps and supplier contracts for its stage, using the declaration APIs and tests above. It preserves the source hypotheses, the distinction between geometric and algebraic data, the integral coefficient rings and the mathematical statuses. It can mark a stage closed only after its dependency chains have no recorded gaps or open imports. The source conjectures remain conjectures unless a proof is supplied for their precise scope.

ArithmeticQuantumTopology, Part II: the two-variable colored Jones invariant, MMR/Alexander comparison and Wheeler’s J_K(t,q) relative-Habiro theorem. Inputs: QT.2, GeometricTopology layer 4 Alexander polynomial, HabiroRings HR.1 early relative λ/Frobenius coefficient interface and HabiroRings HR.5 relative inverse-limit construction. Preserve Wheeler’s t=q^(n−1) convention; q=1 gives 1/Δ_K(t). Plan the knot-specific identification once; import generic relative rings and coefficient localization.

A general resurgence/Borel-summation framework is outside QT. Only the named knot coefficient-asymptotic conjecture and its normalization tests are retained; source computations are not proof certificates.

Bouis–Gazda, arXiv:2602.21894, the other relative-Habiro direction in the confirmed finding, is outside QT’s target scope. QT, Part II owns only the Wheeler knot-specific identification and imports the generic relative-completion owners; it does not add a second generic relative-ring development.
