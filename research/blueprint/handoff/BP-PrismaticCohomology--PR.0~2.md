# BP-PrismaticCohomology--PR.0~2: revision handoff

Issue #7001. Worker Codex, session `codex-qwp93b`, model GPT-6. This is the completed target-level revision pass, submitted for independent review. It claims no implementation or new review verdict. The packet status is complete; all eight stages are planned and none is closed. The 278 preceding node IDs and the entire top-level historical review object are preserved.

The latest RS-01 proposal is marked pending (7 October 2026); its accepted first-revision review remains historical. As the issue instructs, this pass uses the current stage structure. Ownership changes needing an accepted supplier extension, especially the QW.6 prefix, stay explicit proposals and gaps. No other packet, stage text, atlas data or upstream roadmap was edited.

## Deliverables and size

- [Packet](../packets/PrismaticCohomology--PR.0.json): exact statements, dependency closure to baseline/request/gap, API and tests, coverage and provenance.
- [Reader](../readmes/PrismaticCohomology--PR.0.md): all 290 declarations, their API/tests and acceptance conditions, with full request and gap registers. Order PR.0, PR.1, PR.2, PR.3, PR.5, PR.6, PR.4, PR.7 respects the internal stage dependencies.
- [Suggested file](../suggested/PrismaticCohomology--PR.0.lean): corrected typed forms and explicit construction contracts for unavailable supplier carriers.

| Item | Count |
| --- | ---: |
| Definitions | 24 |
| Lemmas | 57 |
| Constructions | 69 |
| Theorems | 118 |
| Comparisons | 12 |
| Applications | 10 |
| Nodes | 290 |
| API items | 604 |
| Unit tests | 357 |
| Planets | 48 |
| Baseline declarations | 138 |
| Requests | 104 |
| Gaps | 24 |
| Source-issue descriptions | 80 |

## Decisions on the 29 open review nodes

The entries below record changes, not acceptance of our own work. The reader and packet retain the mathematical specification when its full carrier is not yet available in Lean. The next reviewer should check the construction boundaries as well as the typed signatures.

- **`PR.0/delta-ring-category`:** Added δ-compatibility of the cofree unit and its unique factorization property; corrected the Remark 2.22 consumer to include φ. The Joyal/cofree proof input stays an explicit gap.

- **`PR.0/perfect-delta-rings`:** Requested the vanishing of the cotangent complex and uniqueness of perfect F_p-algebra deformations from DD.0, under the exact perfectness hypothesis.

- **`PR.0/prism`:** Kept precisely the three defining axioms. Principalization of φ(I) is a consequence owned by prism-frobenius-ideal-principal. Lean now records actual derived completeness.

- **`PR.0/ainf-prism`:** Added the Q0 request for a regular θ-kernel generator whose first Teichmüller coefficient is a unit, with completeness and torsion conditions.

- **`PR.0/universal-oriented-prism`:** Specified unique lifts of chosen distinguished generators and the universal oriented map; the universal generator has a test rejecting the assumption that it lies in pA.

- **`PR.1/prismatic-structure-sheaf`:** Finite jointly complete-flat families replace single-map coverage; product projections and the zero-prism empty cover are tests. Lean complete flatness includes Tor vanishing.

- **`PR.2/derived-prismatic-cohomology`:** Added the animated unit, completed-realization characterization and constant-input Hodge–Tate adapter. Replaced the identity-naturality test by the base Frobenius value and added boundedness to mathematical statements.

- **`PR.2/conjugate-filtration`:** Added functoriality, cofibre and multiplicative maps, with graded index and completed tensor conventions.

- **`PR.2/perfection-of-prismatic-cohomology`:** Added perfection and perfectoidization functoriality and reduction. Retained a fixed perfect base; downstream base independence belongs to its single proposed owner.

- **`PR.3/divided-frobenius`:** Added the derived divided Frobenius API with its twisted target; the oriented formula has the correct unit change.

- **`PR.3/breuil-kisin-twist-transversal`:** Added divided cotangent transitions, projections and the projected Frobenius contract. Finite-projective effectivity and the semilinear projection coherence remain explicit inputs.

- **`PR.3/breuil-kisin-twist`:** Added Frobenius and base-change compatibility for every integer tensor power, including negative powers.

- **`PR.3/relative-nygaard-filtration`:** Added filtered Frobenius and the canonical map v, with complete base change and exact Hodge-triangle use.

- **`PR.3/nygaard-completion`:** Added divided Frobenius on completion and a separate joint Nygaard/(p,I)-adic δ-continuity node.

- **`PR.3/nygaard-filtration-in-coordinates`:** Requested the smooth, étale-local Cartier isomorphism from DD.3, rather than treating the polynomial case as sufficient.

- **`PR.4/syntomic-complex`:** Added multiplication and unit at all integer weights; the completed datum is fixed by the ring and twist. The orientation formula still requires an adapted twist trivialization.

- **`PR.4/log-de-rham-witt-comparison`:** Replaced the insufficient inverse-limit argument by the finite-level exact-sequence contract requested from CR.4.

- **`PR.4/syntomic-etale-comparison`:** Restricted the direct animated comparison to p-complete rings; moved the arbitrary animated scheme form to syntomic-cohomology-schemes, breaking the construction cycle.

- **`PR.5/absolute-prismatic-site`:** Added the category of triples, functoriality and the explicit opposite convention, with actual completeness in Lean prisms.

- **`PR.5/cartier-witt-stack`:** Moved local principalization into cartier-witt-divisor and imported it from both the stack and its quotient presentation. The full Zariski-local signature requires SF.2.

- **`PR.5/absolute-crystalline-comparison`:** Used relative crystalline-base Frobenius transported through the relative/absolute comparison, and added its PR.1 prerequisite.

- **`PR.5/absolute-de-rham-comparison`:** Moved the identity involving absolute Frobenius to absolute-frobenius. The fixed de Rham and crystalline carriers no longer quantify over arbitrary comparison objects.

- **`PR.5/absolute-nygaard-filtration`:** Added completion, multiplication, functoriality and the canonical e^n in graded degree zero for every integer n, with graded periodicity. No canonical lift to Δ_R{1} is claimed.

- **`PR.5/absolute-frobenius`:** Added BL Remark 5.7.10: completion factorization and the polynomial Beilinson characterization, with ideal filtration •−n.

- **`PR.6/q-pd-envelope`:** Completed the universal property: the lift is a δ-map, preserves q and carries the q-PD ideal into the target ideal. Added the complete-flat and relative-regular hypotheses to its typed forms.

- **`PR.6/framed-q-pd-datum`:** Added regularity of (q−1)X_s on the actual envelope; the framing interface is a conditional QW.6 import, not a second owner. The required split/generalization is a gap.

- **`PR.6/q-de-rham-comparison`:** Recorded E₁ multiplicativity as an exact proof gap, with the Čech–Koszul product route. Added q-Poincaré as a separate key theorem.

- **`PR.6/ainf-omega-comparison-map`:** Restricted chart naturality to injective coordinate/unit maps. The universal-envelope map is typed; identification with the actual all-coordinates A_inf tower and its Frobenius is an AI.3/AI.4 construction contract.

- **`PR.7/filtered-phi-module-to-crystal`:** Defined the modification for all filtered φ-modules, fixed the geometric data, retained the jump −1 test and the existence-only weakly admissible extension.

## Additional mathematical repairs and new nodes

The review’s in-place corrections were retained and checked against the cited PDF versions. The raw-perfection counterexample remains distinct from completed prism perfection. The unbounded-torsion construction uses a square-zero ideal. The crystalline comparison uses the actual derived crystalline complex. The q-PD diagrams have injective coordinate maps, and the low-weight Picard identification is restricted to perfectoid rings. No step reinstates the false generalities corrected by the review.

- `PrismaticCohomology:PR.0/frobenius-fpqc-local-surjectivity` — Fpqc local surjectivity of Frobenius.

- `PrismaticCohomology:PR.0/delta-prime-power-valuation` — δ and prime power nilpotence.

- `PrismaticCohomology:PR.1/prismatic-hyperdescent` — Prismatic hyperdescent.

- `PrismaticCohomology:PR.3/delta-nygaard-continuity` — δ on the Nygaard completion.

- `PrismaticCohomology:PR.4/etale-comparison-scalar-extension` — Étale comparison after perfecting the base.

- `PrismaticCohomology:PR.4/crystalline-logarithm-exact-sequence` — Crystalline logarithmic exact sequence.

- `PrismaticCohomology:PR.4/crystalline-first-chern-class` — Crystalline first Chern class as a syntomic fibre.

- `PrismaticCohomology:PR.0/joyal-delta-operations` — Joyal operations and Witt-coordinate identities.

- `PrismaticCohomology:PR.5/cyclotomic-hodge-tate-chart` — Cyclotomic chart and its Hodge–Tate torsor.

- `PrismaticCohomology:PR.5/perfect-prism-sen-calculation` — Sen calculation over the cyclotomic chart.

- `PrismaticCohomology:PR.5/derived-fp-conjugate-descent` — Derived reduction descent for conjugate pieces.

- `PrismaticCohomology:PR.6/q-poincare-lemma` — q-Poincaré comparison of the Čech–Koszul bicomplex.

The non-perfect-base target of PR.4 is now the precise comparison after extension P→P_∞ and completed animated scalar extension R→R_∞. Its generic fibre is R_∞[1/p]; no comparison with R[1/p] is asserted without an additional invariance theorem. This fills the target that made PR.4 partial. The crystalline logarithm and first Chern class have their own detailed proof routes, with BL Theorems 7.1.1 and 7.3.5, pp.167–170 and 176–177. The perfect-prism Nygaard proof names the cyclotomic chart, triangular Sen calculation (BL Lemma 5.6.14, pp.142–144) and derived mod-p descent instead of invoking them anonymously.

## Supplier decisions and red-team repairs

The 104 requests name 42 supplier stages, with the exact statement and every consumer recorded in the reader. DD.0 owns cotangent/deformation algebra; DD.1 owns completion, tensor and filtered completion; DD.2/DD.3 own de Rham and smooth Cartier; DD.5 owns the quasisyntomic site and chosen semiperfectoid covers. DD.4 is asked only for BMS2 Proposition 8.12; CR.4 is asked for LWΩ and Propositions 8.13/8.14. E5’s ambient stable category is not taken as descendability. SF.4 is explicitly requested for bounded formal-scheme globalization, while SF.2 supplies the special-fibre étale site. LP1/SF.1 and D0 have separate formal-QCoh and group-stack roles. C2/P3 and R06/VB2/R07.4 supply the precise realization and period interfaces.

The ten handed-over red-team findings are retained with these boundaries: arbitrary p-adic étale comparison is affine without the pre-adic-site input; arc/arc_p and perfectoidization consequences each have one proposed owner; DD.3 supplies the Hodge–Tate Cartier input; PR.1’s de Rham comparison keeps its Witt torsion-freeness and PR.3 supplies the general theorem; PR.5 precedes PR.4 for syntomic constructions; stacks and F-crystal realizations have explicit supplier edges. Framed q-differences are conditional imports from the proposed QW.6 split, and cannot be treated as complete until that split and its A_inf-base generalization are accepted. All proposed links merge without a cycle, including PR.6→PR.4 and PR.4→RT.6. PR.4 has no trace-theoretic prerequisite.

Upstream and other-roadmap files must remain with their owners. The handoffs include Q3 importing the PR.2 cover-lifting theorem, RT.6 importing the prismatic Nygaard and syntomic outputs, HQ.1 importing the shared QW framing prefix, AI.7 using the comparison uniqueness theorem, and reconciliation of the two R07.4 full-faithfulness overlaps. The four restructure entries are proposals, not implemented changes.

## Exact remaining work by stage


### PrismaticCohomology:PR.0: planned

- Refine the target-level prism and envelope proofs to the density of the retained lemma-level δ-ring prefix; the specified cofree Witt proof and étale algebraization inputs remain explicit gaps.
- Prove regularity of f in the square-zero unbounded-torsion example and the derived-completion consequences stated in its acceptance checks.
- The complete derived-Frobenius classification of Remark 2.5 and perfectoid covers of regular local rings of Remark 3.11 have no consumer among these targets; the W₂ pullback square used by PR.2 is already included.

### PrismaticCohomology:PR.1: planned

- Produce global formal-scheme signatures from the requested SF.4 carrier, with SF.2 identifying X_ét through its special fibre; hyperdescent is a separate planned theorem.
- Refine the compatibility of the two crystalline comparison maps for general PD ideals in BS22 Theorem 5.2 and the calculation of Lemma 5.4.
- Resolve the recorded p-torsion-freeness gap for complete-flat modules over a general p-torsion-free bounded prism.

### PrismaticCohomology:PR.2: planned

- Refine the functorial simplicial cosimplicial δ-algebra model of Lemma 7.7, including its normalized derived carrier and geometric-realization coherence.
- Calculate the map J/I→gr₁ of the conjugate filtration in BS22 Example 7.9 using a free resolution.
- The fixed-base perfection is planned here; base independence, the perfect-prismatic-site comparison and arc consequences belong to the proposed PerfectoidQuotients Part II, with arc topology supplied once by ArcTopologyAndDescent.
- Resolve the recorded P⁰, descendability, scheme-deformation and finite-projective-effectivity inputs.

### PrismaticCohomology:PR.3: planned

- Refine the E∞ enhancement of the filtered Frobenius, Bockstein comparison and Hodge triangle using the stated monoidal DD.1 and AI.1 extensions.
- Identify the two de Rham comparison maps when the PR.1 Witt torsion-freeness hypothesis holds; no source identification is silently assumed.
- Refine the q-factorial computations and transversal twist proofs. The joint Nygaard and (p,I)-adic continuity estimate is now a separate node.
- Export the π₀TC⁻ and π₀TP identifications to RT.6; their trace-theoretic statements remain outside the prismatic prerequisite graph.

### PrismaticCohomology:PR.4: planned

- Supply the recorded algebraic connectivity and continuity argument for syntomic complexes without importing trace theory into PR.4.
- Resolve the arc/perfectoidization, arbitrary generic-fibre site and flat Gₘ continuity gaps. The non-perfect-base comparison is planned after scalar extension and compares the resulting generic fibre.
- Refine finite-level logarithmic de Rham–Witt exactness and the long crystalline logarithm proof; the latter and the crystalline first Chern class now have their own nodes.
- The mixed-characteristic Fontaine–Messing comparison requires an owner downstream of PR.4 and RT.3b, as recorded in restructure. F-smooth integral comparison and purity refinements have no target consumer in this part; the required Bhatt–Mathew input is connectivity and left Kan extension.

### PrismaticCohomology:PR.5: planned

- Resolve formal QCoh, infinite-group BG and formal-scheme globalization inputs with their stated owners.
- Refine the cyclotomic Hodge–Tate chart and triangular Sen calculation; both are now explicit prerequisites of the perfect-prism Nygaard comparison.
- Derive the Beilinson connective-cover and completion universal properties from the stated DD.1 extension. Completed Frobenius and its sifted-colimit characterization are included.
- The Galois interpretation of Sen theory, integral uncompleted diffracted Hodge theory and exponentiation of the Sen operator have no consumer in these targets; twists are imported from PR.3 and syntomic complexes are owned by PR.4.

### PrismaticCohomology:PR.6: planned

- Obtain acceptance of the QW.6 framing-prefix split and its extension to general complete δ-bases, including A_inf; this dependency is conditional and remains explicit.
- Prove the E₁ multiplicativity of the toric q-de Rham comparison through the Čech–Koszul product; Remark 17.3 supplies an assertion, not the missing proof.
- Refine the q-PD envelope, q-Poincaré and uniqueness proofs. Joyal’s Witt-coordinate operations and their triangular generator change are included.
- Globalize the ringed q-crystalline site for non-affine formal schemes; give the explicit one-variable q-PD envelope presentation with its completeness hypotheses.

### PrismaticCohomology:PR.7: planned

- Resolve the exact arbitrary-localization Artin–Schreier, almost product, affinoid lisse comparison, filtered-bundle matching and arbitrary-perfect-residue-field period inputs recorded in gaps.
- Refine the analytic continuation, bounded descent data and Breuil–Kisin realization proofs; preserve the existence-only weakly admissible extension and the negative-one filtration jump.
- Reconcile the two overlapping R07.4 full-faithfulness statements under the recorded ownership proposal, with no duplicate implementation.
- Gauss–Manin compatibility, derived Laurent crystal realization and logarithmic connections remain consistency checks or applications unless a new target requires their declaration-level expansion.

## Gaps to discharge

These are the 24 mathematical gaps, not a claim that the job stopped. The target-level pass ends at the recorded requests/gaps under the issue’s stopping rule. Resume proof closure from the stated consumers in the reader; avoid creating a second owner.

1. **Joyal's theorem: Witt vectors are the cofree δ-ring.** Bhatt–Scholze Remark 2.7 cites Joyal for the statement that the right adjoint of the forgetful functor from δ-rings to rings is the p-typical Witt vector functor. Mathlib has Witt vectors with Frobenius and ghost components but not this universal property, and no layer of the atlas plans its proof. The node states the adjunction and the unit w_A; a lemma-level proof (construction of the δ-structure on W(R) for R with p-torsion, and of the counit) is still to be planned in this layer.

2. **Remark 2.5: derived Frobenius lifts.** The source's characterisation of δ-structures on a Z_(p)-algebra as derived Frobenius lifts (a lift of Frobenius together with a homotopy on R ⊗^L F_p) is not planned: no target of PR.0–PR.7 uses it. The pullback square for W_2 of a simplicial commutative ring, which the same remark states and which the proof of BS22 Lemma 7.7 (1) does use, is planned as PrismaticCohomology:PR.0/witt2-derived-pullback-square. The gap is recorded so that the ordinary Frobenius congruence is never mistaken for the derived datum.

3. **p-torsion-freeness of completely flat modules over a general p-torsion-free bounded prism.** Needed: for a bounded prism (A,I) with A p-torsion-free and a derived (p,I)-complete, (p,I)-completely flat A-module B, B is p-torsion-free. Established here: B[p] ≅ lim_n B ⊗_A (A/I^n)[p], which vanishes when the pro-system ((A/I^n)[p])_n is pro-zero, in particular for crystalline prisms and for prisms in which (p,d) is a regular sequence. Not established for arbitrary p-torsion-free bounded prisms; Anschütz–Le Bras Lemma 5.1.6 asserts it by calling the first term of the Čech–Alexander complex p-completely flat over A, which Bhatt–Scholze Proposition 3.13 does not state. A proof, or the restriction of the lemma to prisms with A/p of bounded I^∞-torsion, closes the gap; the application in Anschütz–Le Bras (A = A_inf) is covered.

4. **The operation P^0 on E_∞-F_p-algebras.** Missing input of BS22 Lemma 8.4: for an E_∞-algebra over F_p the operation P^0 on homotopy groups (Lurie, Rational and p-adic homotopy theory, §2.2), with two properties: (i) for the realisation of a simplicial cosimplicial commutative F_p-algebra, P^0 is induced by the levelwise Frobenius; (ii) P^0 annihilates every homotopy class of positive degree (Remark 2.2.7 there). No atlas stage plans power operations on E_∞-F_p-algebras; the natural owner is the E_∞-algebra layer EnhancedDerivedSheaves E5:abstract or the stable homotopy roadmap that supplies concrete spectra. Until it is supplied, node perfectoidization-coconnective and its consumer rest on this gap.

5. **A proof of rigidity of syntomic complexes without topological Hochschild homology.** Antieau–Mathew–Morrow–Nikolaus prove Theorem 5.2 (rigidity for henselian pairs) through Propositions 5.36, 5.38, 5.41 and Lemma 5.42, which describe Nygaard graded pieces as gr^n THH, use relative THH over S[z] and THH of graded rings. PR.4 may not depend on RefinedTraceMethods. Missing input: the same statements in prismatic terms, namely (i) continuity of R ↦ gr^m_N Δ_R{n} along I-adic completion for noetherian F-finite R, from the fibre sequence for Nygaard graded pieces (Bhatt–Lurie Remark 5.5.8) and continuity of wedge powers of the cotangent complex; (ii) for a graded ring A ⊕ N, the internal grading on N^{≥•}Δ{i} (Bhatt–Mathew Remark 3.8 and Construction 3.9) and the statement that φ_i multiplies internal degrees by p. Parts (1), (2) of the node (left Kan extension and the bound D^{≤ i+1}) do not depend on this gap.

6. **Bounded p-adic formal schemes as a category with étale and p-quasisyntomic topologies.** SF.4 is the owner of formal schemes, but its present carrier contracts do not establish the full category of bounded p-adic formal schemes needed here. Exact input: affine objects Spf R for p-complete R of bounded p-power torsion, fibre products, étale and p-quasisyntomic covers, and right Kan extension of derived-p-complete étale sheaves from affines. SF.2 supplies the étale site of the special fibre; DD.5 supplies the affine quasisyntomic and quasiregular semiperfectoid basis. Their combination on formal schemes requires this stated extension of SF.4. The affine constructions do not depend on the missing globalization.

7. **Almost description of the perfection of the prism of O_C ⊗̂_{O_K} O_C.** Step 3 of the construction uses: for R = O_C ⊗̂_{O_K} O_C the map R_perfd → Cont(G_K, O_C), x ⊗ y ↦ (g ↦ x·g(y)), is an almost isomorphism, hence Δ_{R,perf} = A_inf(R_perfd) → Cont(G_K, A_inf) is an almost isomorphism, and it becomes an isomorphism after inverting I and p-completing. The proof of BS23 Proposition 6.4 invokes the two almost comparisons through generic-fibre A_inf-cohomology without identifying a supplier for their composite. The first almost isomorphism is the identification of perfectoidization with arc-cohomology of the structure sheaf (BS22 Corollary 8.11), whose proposed owner is PerfectoidQuotientsPartIIIntegralPerfectoidization with the arc-topology of ArcTopologyAndDescent, neither yet in the atlas; the second is the computation of the v-cohomology of O^+ on the diamond Spa(C) ×_{Spa(K)} Spa(C) = G_K × Spa(C), which needs the almost acyclicity of O^+ on affinoid perfectoids (PerfectoidSpaces:P3/etale-almost-acyclicity states the étale case). No atlas node states the composite.

8. **Matching of the Fargues–Fontaine bundle of a filtered φ-module with M(D)(Y).** The source deduces semistability of slope 0 from Fargues–Fontaine Proposition 10.5.6 together with an identification of the two bundle constructions: the vector bundle on X_FF corresponding (Corollary 11.2.22) to the φ-module M(D)(Y)_ℛ must be identified with the bundle E(D, φ_D, Fil^•) of Fargues–Fontaine §10.5, including the Frobenius twist in the filtration and the sign of slopes. The identification is planned as the first proof step of the node, but it can only be written once VectorBundlesAndIsocrystals:VB2:classification supplies the dictionary of Corollary 11.2.22 and the construction of E(D, φ_D, Fil^•), which its packets do not yet state (see the request).

9. **Period rings and Fontaine's functors for infinite perfect residue fields.** The main theorem is stated for every complete discretely valued K of mixed characteristic with perfect residue field. The existing nodes of PadicHodgeTheory R06.1–R06.2 (for example R06.2/filtered-phi-n-modules, R06.1/ax-sen-tate-invariants) are stated for K finite over Q_p. Until R06 extends them (request above), the chain of the main theorem closes only for K finite over Q_p.

10. **Derived crystalline cohomology of quasiregular semiperfect rings (BMS2 Propositions 8.12–8.13, Theorem 8.14).** For quasiregular semiperfect F_p-algebras S, PR.2 needs the p-completed polynomial left Kan extension of crystalline cohomology over W(k), identified with the discrete p-torsion-free A_crys(S), compatibly with Frobenius. Request DD.4 only for A_crys(S)/p≃LΩ_(S/F_p), the completed unfiltered de Rham complex of BMS2 Proposition 8.12. Request CR.4 for derived de Rham–Witt cohomology LWΩ_S, its base change of Proposition 8.13 and the identification of Theorem 8.14. PR.3 then owns the prismatic Nygaard comparison. Neither derived de Rham over W(k) nor the lci comparison alone supplies this crystalline complex.

11. **Étale site of the pre-adic generic fibre of an arbitrary p-adic formal scheme, and Rμ_*.** The nearby-cycle form of Bhatt–Scholze Theorem 9.1 uses the étale site of the generic fibre X_η of an arbitrary p-adic formal scheme X over a perfectoid ring, 'as a (pre-)adic space', and μ : X_{η,ét} → X_ét. ClassicalAdicEtaleCohomology:H0 covers sheaves on analytic adic étale sites, and H1:formal-adic-comparison constructs the specialisation morphism λ_X : d(X)_ét → X_ét only for formal schemes of Huber's type (S); for X = Spf S with S a general p-complete algebra, Spa(S[1/p], S) need not be an adic space and no stage supplies X_η or Huber's Spec/Spa comparison in that generality. Until one does, the sheaf form is established as: the étale sheafification on X_ét of S ↦ RΓ_ét(Spec S[1/p], Z/p^n) is (Δ_{X/A}[1/d]/p^n)^{φ=1}, identified with Rμ_*Z/p^n when X is locally of type (S). The affine form of the theorem does not depend on this gap.

12. **p-adic continuity and derived descent for flat cohomology of G_m (Bhatt–Lurie Propositions 7.2.13 and 7.2.15).** Needed and supplied by no stage: (i) Bhatt–Lurie Proposition 7.2.13 = Česnavičius–Scholze, Purity for flat cohomology, Theorem 5.3.4 (p-adic continuity of fppf cohomology of finite locally free commutative group schemes), whose proof uses arc_p-descent, the Fujiwara–Gabber theorem and Beauville–Laszlo glueing; (ii) Bhatt–Lurie Proposition 7.2.15: derived descent of RΓ_ét(Spec −, G_m)^∧ along R → R ⊗^L F_p^{⊗(•+1)} for p-complete animated R, and Remark 7.2.8 (G_m is left Kan extended from Laurent polynomial rings); (iii) the glueing square RΓ_ét(Spec R, G_m)^∧ → RΓ_ét(Spec R[1/p], G_m)^∧, RΓ_ét(Spec R̂, G_m)^∧ → RΓ_ét(Spec R̂[1/p], G_m)^∧ is cartesian for every animated ring R (Česnavičius–Scholze, Lemma 5.4.2). (i) and (ii) enter the weight-one theorem Z_p(1) ≃ RΓ(−, G_m)^∧[−1] (PR.4/syntomic-low-weights (3)); (iii) enters property (g) of PR.4/syntomic-cohomology-schemes. Natural owners: SchemeAndStackFoundations:SF.2 for flat cohomology, with the proposed ArcTopologyAndDescent for the descent input.

13. **Lisse sheaves on an affinoid perfectoid space and on the spectrum of its ring.** The passage from the Artin–Schreier–Riemann–Hilbert statement on the scheme Spec(R^♭[1/I]) (source Proposition 3.4) to D^b_lisse of the adic space Spa(R[1/p], R) (BS23 Example 3.5) needs, for an affinoid perfectoid space Spa(S, S^+): every Z/p^n-local system is split by a finite étale cover, finite étale covers are finite étale S-algebras, and RΓ_ét(Spa(S, S^+), Z/p^n) = RΓ_ét(Spec S, Z/p^n); so that D^b_lisse(Spa(S, S^+), Z/p^n) ≃ D^b_lisse(Spec S, Z/p^n). PerfectoidSpaces:P3 states the tilting equivalence of finite étale covers and the almost acyclicity of O^+, and the request to DiamondEtaleCohomology:C2 covers v-descent of lisse sheaves; neither states this comparison, and no stage says that the generic fibre of a bounded p-adic formal scheme is a locally spatial diamond. Natural owners: PerfectoidSpaces:P3 for the comparison, DiamondsAndVStacks for X_η.

14. **Invertible modules from complete systems.** The construction of the transversal twist uses effectivity for an inverse system of invertible modules over A/p^n, where A is p-complete and p-torsion-free: its inverse limit is invertible and reduces to the given modules. Stacks Tag 0D4B supplies classical finite-projective effectivity, but DD.1 does not name this theorem and neither pinned library supplies it. This includes the effectivity input to PR.2 finite-projective descent; no unconditional citation to DD.1 discharges it.

15. **Multiplicativity of the toric q-de Rham comparison.** Needed by the AΩ comparison: the Theorem 16.22 map on a toric framed q-PD datum must be an equivalence of E_1-algebras, compatible with cup products and Frobenius. BS22 Remark 17.3 asserts this without a proof. A proof must construct the product on the completed Čech–Koszul bicomplex, show the augmentation is multiplicative and identify its framed Koszul product; an additive quasi-isomorphism alone does not supply it. Proposed owner: PR.6/q-de-rham-comparison, using the QW.6 product and AI.1 Koszul product.

16. **Artin–Schreier descent for arbitrary principal localisation.** The p^n Artin–Schreier descent statement applies to every t in an integral perfectoid S, including zero divisors and t=0. P3/tilting-finite-etale-localisation is stated only for nonzerodivisors. The variable trick must first replace S by S⟨T^(1/p^∞)⟩, use the regular element T, and descend through the completed derived specialisation T↦t; neither the arbitrary-specialisation base-change equivalence nor its Frobenius compatibility is currently supplied. The theorem is retained at target level, with this exact boundary and no universal Lean statement relying on the narrower P3 result.

17. **Algebraization and Witt functor on étale maps.** The proof of BS22 Lemma 2.18 needs algebraization of I-completely étale algebras over an I-complete base and van der Kallen’s theorem that W_2 carries étale maps to étale maps with the required base-change square. DD.1 covers completion and flatness, not these two results. Until an étale commutative-algebra supplier states them, delta-structure-etale-extension inherits this exact input; neither a completion criterion nor ordinary formal smoothness replaces it.

18. **Scheme lifting obstruction for conjugate splitting.** Conjugate-splitting-and-lifting uses the obstruction in Ext²(L_(X/(S/I)),I/I²⊗O_X) to a flat lift of X over S/I² (Illusie III.2.1.2.3). DD.0 supplies square-zero extensions of rings, not the global scheme obstruction theorem. The full scheme claim needs a deformation-theory-of-schemes stage; the affine extension classification is already DD.0.

19. **Descendability of perfection.** Mathew's descendability for a map B → C of commutative algebras in a stable presentably symmetric monoidal ∞-category, here D_comp(A): definition and index; the criterion that B → C is descendable of index ≤ m when every map F^{⊗m} → B from the m-th tensor power of the fibre F is null; stability under base change, composition and tensor products; the consequence B ≃ lim C^{⊗_B(•+1)} and descent for modules; and Bhatt–Scholze, Projectivity of the Witt vector affine Grassmannian, Lemma 11.22: if B → C is descendable of index ≤ n and B, C carry compatible endomorphisms φ, then colim_φ B → colim_φ C is descendable of index ≤ 2n. E5:abstract supplies the ambient stable monoidal category, but its accepted stage does not define descendability. This exact criterion and Frobenius-colimit lemma need a supplier extension or a separate descent stage.

20. **Beilinson filtered t-structure and E_∞ décalage.** Missing: the Beilinson t-structure on DF(A), its heart, connective cover, Day-convolution compatibility (BMS2 Definition 5.3, Theorem 5.4(1),(3), Corollary 5.10). Its Lη characterization uses the full Z-indexed filtration i↦I^(⊗i)⊗K, including negative tensor powers; the underlying complex is colim_(i→−∞). For I-torsion-free dga representatives use BMS1 Lemma 6.13; the E_∞ Bockstein enhancement needs the lax monoidal connective cover of BMS2. DD.1 names filtered completion but not this t-structure; AI.1 names décalage but not this enhancement. Proposed owner: an extension of DD.1, consumed by AI.1 and PR.3/PR.5, pending accepted scope change.

21. **Formal QCoh and infinite-group classifying stacks.** LP1 names generic derived affine stacks and QCoh descent, but does not currently supply D(Spf A)=derived (p,I)-complete complexes for bounded prisms, affine pushforward/base change/projection formulas in that setting, or D(BG) as derived comodules for G=W^× or G_m^♯. Its reductive-parameter packet is not evidence for these infinite-group and formal-completion contracts. Extend the generic QCoh owner once and import it here; D0 owns the groupoid stack carrier.

22. **QW.6 framing prefix requires an accepted split and generalization.** The request to QW.6 is conditional: the accepted/draft Λ-base A[[q−1]] formulation does not supply A_inf(O_C), q=[ε], nor a prefix independent of QW.5. Adopt the recorded split and extend to general complete δ-bases D and étale/toric framed D-algebras, with γ_s(X_t)=q^(δ_st)X_t and coordinate-injective naturality. Until those changes are accepted, the PR.6 interface is an adapter to a requested supplier, not a completed dependency. The QW reader’s claim that PR.6 constructs the machinery without QW must be corrected by its owner; this issue authorizes no edits to QW files.

23. **ArcTopologyAndDescent: topology and étale descent.** Single proposed owner ArcTopologyAndDescent, not yet an atlas roadmap: arc and arc_p topologies and equivalences (BM Definitions 1.2,6.14,6.19); torsion étale arc-descent (Theorem 5.4) and S↦RΓ(Spec Ŝ[1/p],F) arc_p descent (Corollary 6.17); formal gluing (Theorems 5.13,6.4); Fujiwara–Gabber for a henselian pair with finitely generated ideal (Theorem 6.11, not 6.10). Also the formal arc topology, perfectoid basis and higher-cohomology vanishing of its structure sheaf (BS22 Definition 8.7, Lemma 8.8, Remark 8.9, Proposition 8.10). PR.2’s fixed-base construction does not use these; its downstream arc formulation does.

24. **PerfectoidQuotientsPartIIIntegralPerfectoidization: comparison and arc consequences.** Single proposed owner, not yet an atlas roadmap: BS22 Proposition 8.5 identifies completed perfection with the perfect-prismatic-site limit, giving base independence and dependence only on π_0; Corollaries 8.11–8.12 identify S_perfd with arc structure-sheaf cohomology and give excision. Theorem 10.11 gives discreteness/perfectoidness for completed integral maps. It imports the topology and acyclicity from ArcTopologyAndDescent and the André/perfectoidization results from Q3/Q4. Each statement is recorded once here, with all consumers, rather than duplicated among arc gaps.

## Lean validation and its limits

The suggested file **compiled with `lean-check`** in the shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: zero errors and 997 warnings, all for proof placeholders. It has 7121 lines and SHA-256 `e6ab81a2b0a202c3a261de891f79048b8e6ab2bcb1c8fda34a5469cc311e0bc8`. Available memory exceeded 20 GB before the final run. Individual Mathlib modules are imported; there are no Tau Ceti imports. No Lake project, library rebuild, cache download or language server was started.

The old theorems about arbitrary crystalline objects, arbitrary imported functors, unrelated AΩ complexes and freely chosen geometric data were removed or replaced by constructions fixed by their geometric parameters. Prism completeness and complete flatness are actual predicates. Every API and test name appears in the suggested file. Twenty-five names need an unavailable exact supplier carrier and are full construction-contract comments, not executable declarations. Examples of the latter are the q-crystalline small presentation, actual AΩ tower actions, stack effectivity, animated geometric realizations and the Beilinson polynomial characterization. The reader’s general animated, formal-scheme, filtered and E∞ specification is definitive; the typed ordinary-category forms are suggestions. No arbitrary `Prop` field, axiom or assumed comparison isomorphism certifies a missing condition.

All 588 executable API names also passed fully qualified Lean name checks. Checks: `scripts/check_blueprint.py` with the pinned declaration index, zero errors and warnings; four-file intake validation, zero problems; internal prerequisite DAG, no cycle; read-only atlas merge, successful with 171 added stage edges, no cycle and no skipped new link; all original IDs and the historical review preserved; API/test/reader parity and three tests per definition/construction checked; own-word source descriptions and numbered-page locators checked. The next reviewer must assess mathematical adequacy; these mechanical checks do not prove the planned theorems.

## Source reading, missing sources and provenance

The eight public PDF versions were fetched and read at the cited statements and proof portions on 9 October 2026. The current PDF hashes and scoped reading records are in `sources.revisionReading` and `sourceVersions`; earlier TeX archive records remain historical. PDF heading indexing matched 512 numbered citations with no unmatched number, and the long newly expanded arguments carry proof pages. The 138 baseline statements were read at Mathlib’s pinned commit; general descent APIs include comonadic scalar extension, `Pseudofunctor.IsStack` and `DescentData`.

- [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4): Numbered statements and proof portions used by the corrections across §§2–18 and Appendix A; in particular §§2–3, 5–8, 12–15, Theorem 16.22 and §§17–18. Scoped reading of cited arguments, not a certification of every passage or the publisher version. SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.

- [Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120v1): Cited relative twists, Cartier–Witt constructions, absolute comparisons, Nygaard and syntomic arguments; new detailed reads of §§3.8, 4.2, Lemma 5.6.14 and the related perfect-prism proof, and Theorems 7.1.1 and 7.3.5, pp.167–170 and 176–177. SHA-256 `0b1beeb20c29424ed8e330c14a66b36c0edcc84255edf5caa0ff9e235139a269`.

- [Prismatic F-crystals and crystalline Galois representations](https://arxiv.org/pdf/2106.14735v2): The crystal/site definitions and cited proof steps in §§2–7, including Construction 6.5, Remark 6.6 and the Breuil–Kisin realization argument. Period and Fargues–Fontaine inputs are recorded through their owners. SHA-256 `4cbfb297a15347c978f590cfc7b7dab3ab771509c588dc8fd928cff8b067ff59`.

- [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2): Quasisyntomic definitions, filtered completion and Nygaard/crystalline/logarithmic de Rham–Witt comparisons cited in §§4–5 and 7–10. Trace interpretations are supplier inputs rather than PR.4 proofs. SHA-256 `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038`.

- [Prismatic Dieudonné theory](https://arxiv.org/pdf/1907.10525v4): The cited prism, comparison, derived/prismatic and descent statements in §§2–3, §6 and Appendix A; the p-torsion-free complete-flat argument retains its identified gap. SHA-256 `6eb02c16c525360141b1c5d118ae04db070f3c0e9cb9fff0f1598fc889b50aec`.

- [Syntomic complexes and p-adic étale Tate twists](https://arxiv.org/pdf/2202.04818v2): Examples and conventions of §1, pp.1–3; the connectivity/left Kan extension use and its AMMN source. F-smoothness machinery is not claimed as read or planned by this part. SHA-256 `12eb19e417531addbcf70d85facf33b1649ba5d8845c31ade9128c6000032955`.

- [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3): A_inf prism and θ-kernel statements in §3, décalage and the very-small-chart/Koszul comparisons used in §§9 and 12; pinned passages used in the corrections. SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`.

- [On the Beilinson fiber square](https://arxiv.org/pdf/2003.12541v2): Theorems 5.1–5.2, pp.25–26; the Nygaard, continuity and connectivity arguments of pp.33–39; Theorem 6.17 and the first part of its proof on p.44 as the exact RT.3b supplier contract. No claim of a trace-free proof follows from this reading. SHA-256 `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd`.

No restricted reference file or book was read or copied. Huber, Fargues–Fontaine, Kisin and the published versions not listed as actually acquired remain indirect source leads through their owning roadmaps; this pass does not assert direct verification of those books or editions. The four source findings against statements in a version of record still require edition collation. E33 remains rejected. Existing novelty labels are historical and no new novelty claim is made. Source excerpt fields were removed outside the immutable top-level review; source-issue descriptions and inherited close wording were paraphrased. No source passage is newly stored in the repository.

The handoff contains all completion information needed for a fresh process. No scratch source, log or script is required to resume; the run’s scratch directory is removed after opening the pull request. Take no second issue in this run.
