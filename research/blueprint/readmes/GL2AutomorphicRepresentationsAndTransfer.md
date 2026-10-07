# Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer

**Roadmap `GL2AutomorphicRepresentationsAndTransfer` (atlas title “GL₂ Automorphic Representations And Transfer”), assembled from its two parts:** part R16.1 (layers R16.1–R16.6, R17.1 and R17.2; packet `research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R16.1.json`, 55 nodes) and part R17.3 (layers R17.3–R17.6; packet `research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json`, 57 nodes). The document has 112 nodes, 81 API items, 66 unit tests and 62 planets. It cites 21 declarations of the pinned libraries and 31 sources, and records 59 requests to other roadmaps, 14 gaps and 15 mistakes in the sources. Its node entries are generated from the two packets, so the document and the packets agree node for node. The suggested Lean file is `research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer.lean`. This is a plan: nothing in it is claimed to be formalised.

## Purpose

This roadmap plans the representation theory of GL₂ over local fields and number fields that modularity, transfer and potential modularity use, from what Mathlib and Tau Ceti contain to the transfer theorems its twelve layers state. It is a Part II of Tau Ceti’s ModularForms roadmap (`tauceti:TauCetiRoadmap/ModularForms`). Classical modular forms, Hecke operators, newforms and their L-functions come from there; this roadmap adds their local and adelic representation theory, and the transfers between GL₂ over different number fields and between GL₂ and quaternion algebras. Classical modular forms are one specialisation (R16.6), not the definition of an automorphic representation over a number field.

The order is the order of the arguments.
- **R16.1** fixes the congruence subgroups, compact subgroups, Haar measures and finite-level automorphic functions of GL₂.
- **R16.2** classifies the irreducible smooth representations of GL₂ over a p-adic field and proves Casselman’s newvector theorem, with types, Kirillov models and Iwahori–Hecke algebras.
- **R16.3** computes the local Langlands correspondence in these coordinates, with monodromy, conductors, ε-factors and the archimedean factors.
- **R16.4** proves the global factorization, multiplicity one and strong multiplicity one over a number field, and specialises rationality fields.
- **R16.5** proves the integral representation of the standard L-function and the converse theorem for GL₂.
- **R16.6** compares with classical and Hilbert modular forms: newforms, weights, Hecke parameters and weight one.
- **R17.1** makes the local Jacquet–Langlands correspondence explicit for quaternion algebras, at p-adic and real places.
- **R17.2** computes the GL₂ test functions, orbital-integral matchings and spectral terms that the trace-formula comparisons use.
- **R17.3** proves the global Jacquet–Langlands correspondence with its local, Hecke and rationality compatibilities.
- **R17.4** proves cyclic and solvable base change and descent, and plans the GL₃ inputs of the Artin bridge: the adjoint lift, cubic induction and non-normal cubic base change.
- **R17.5** proves automorphic induction and the Langlands–Tunnell theorem with its weight-one interpretations.
- **R17.6** treats residual representations in characteristic two with solvable image (Rohrlich–Tunnell, Wiese) and exports the transfer interfaces used by potential modularity.

## Scope, granularity and status

The scope is the twelve stages `GL2AutomorphicRepresentationsAndTransfer:R16.1` to `:R17.6` of the roadmap’s document (`content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md`). The roadmap is planned at target level (PROTOCOL.md section 2): one node for each target a stage states and for each definition or key theorem a target needs on the way, with its exact statement and hypotheses, a proof outline citing the source, and its direct prerequisites. Every definition and construction carries the uses it serves, an API outline and at least three unit tests chosen so that a plausible wrong definition fails one of them.

The two parts were planned separately and each was reviewed independently: part R16.1 by `independent-review-REV-GL2AutomorphicRepresentationsAndTransfer--R16.1` (2026-10-07), part R17.3 by `independent-review-REV-GL2AutomorphicRepresentationsAndTransfer--R17.3` (2026-10-06). Both reviews corrected their packet in place and accepted it; both packets are `complete`. All twelve layers are `planned` and none is `closed`: the supplier requests and gaps listed under Records remain. The reviews’ notes are reproduced under “Records of the parts”.

Part R17.3’s nodes cite layers R16.1–R17.2 by stage id. Each such citation is followed at its node by an *Assembly note* naming the nodes of part R16.1 that supply what is used, and the eight requests that part R17.3 addressed to its own roadmap carry an *Assembly status* line (“Requests inside the roadmap”). Part R16.1 records most of its source excerpts as one to three words. Its node entries print them as recorded, and an *Assembly note* under each citation gives the passage at the locator, read in the source.

## Boundaries with other roadmaps

Each piece of mathematics has one owner (PROTOCOL.md section 15). What another roadmap owns is imported by citing its node, or its stage together with a request that states what is needed. The accepted restructuring RS-21 (“Smooth local representations and GL₂ automorphic representations”, `data/restructure/RS-21.result.json`, accepted 29 September 2026) fixes this roadmap’s place. It extends `tauceti:TauCetiRoadmap/ModularForms` under the title above: “Start with its existing classical forms, Hecke algebra, primitive forms, multiplicity and L-functions; add the number-field automorphic realization, explicit local formulas and global transfer. Preserve every R16/R17 stage ID and all other prerequisites.” RS-21 narrows ten layers to their explicit GL₂ content, names the generic owners that supply the rest, and keeps R17.2 and R17.4 whole. A revised RS-21 (`research/blueprint/restructure/RS-21.result.json`, whose review is pending) changes two things here: R16.5 specialises AutomorphicLFunctionsAndLocalFactors AL.3’s general GL_n Fourier–Whittaker expansion instead of proving one, and a link R16.2 → AutomorphicCongruences L3 exports the field-valued GL₂ newvector theorem. Part R16.1 already places the GL₂ expansion in R16.4, specialising AL.3 (`R16.4/global-whittaker-expansion`).

### Where this roadmap starts

Tau Ceti’s ModularForms roadmap hands off to this one in its Layer 2, “(a′) The hand-off to the automorphic-representations roadmap”: “Its adelic reformulation is **out of scope** here: the automorphic-representations roadmap consumes the `GL_n` ring of (a)/(a′) and builds the convolution comparison on its own side.” Everything classical stays upstream and is imported, not planned again: newforms, primitive forms and the conductor (Layer 4), strong multiplicity one at fixed level (Layer 5), Atkin–Lehner operators (Layer 6), L-functions (Layer 7), coefficient fields (Layers 8 and 8G). The pinned Tau Ceti declarations `HeckeRing.GL2.Newform`, `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` and `CuspForm.LSeries_qExpansion_coeff_eq` are cited where R16.4–R16.6 compare with them. R17.2’s adelic trace formula is distinct from the level-one Eichler–Selberg formula of Layer 11.

### What this roadmap imports

| Roadmap | Layers cited | What is imported | Used in |
|---|---|---|---|
| SmoothRepresentationsOfLocalGroups | SR.0:abelian-category, SR.1–SR.5 | the fixed-central-character category, smooth Hecke algebras, normalized induction and Jacquet modules, admissibility and contragredients, Satake and Iwahori–Bernstein presentations, the Whittaker and Kirillov functors | R16.1, R16.2, R16.4, R17.2 |
| AutomorphicFormsOnReductiveGroups | AF.1–AF.5 | archimedean (g, K)-modules and the archimedean classification (the proposed AF.1b), automorphic representations and their restricted tensor factorization, cuspidal multiplicity inputs, rationality fields and Clozel’s rational models, the GL₂/ℚ classical dictionary | R16.1–R16.6, R17.1, R17.3–R17.5 |
| AutomorphicLFunctionsAndLocalFactors | AL.0–AL.3 | Schwartz–Bruhat functions and Fourier analysis, Tate integrals and Hecke L-functions, Godement–Jacquet factors, Rankin–Selberg theory with the GL_n Whittaker expansion, and the GL₃ and GL₂×GL₃ factors with the Jacquet–Shalika pole criterion | R16.1–R16.6, R17.4, R17.5 |
| AutomorphicSpectralTheory | AS.2, AS.4, AS.6 | normalized intertwining operators, the cuspidal spectral decomposition, the invariant trace formula | R16.4, R17.2, R17.3 |
| EndoscopicTransferAndUnitaryTraceComparison | ET.1, ET.3, ET.4, ET.6 | transfer factors, local transfer and the fundamental lemma, the simple cyclic trace comparison, the local Langlands and local Jacquet–Langlands correspondences | R16.2, R16.3, R17.1, R17.2, R17.4 |
| AdelicAlgebraicGroups | AA.0–AA.2 | restricted Haar products, adelic points and their topology, quotient measures and central-character L² spaces | R16.1, R16.4, R17.2 |
| ReductiveGroupsPartII | RG2.0, RG2.4 | topology of integral points, the Iwasawa and Cartan decompositions | R16.1 |
| ArithmeticGaloisRepresentations | R01.1–R01.5, G7 | finite-image and residual representations with lattices and reductions, Weil–Deligne parameters, Artin conductors, the classification of finite subgroups of GL₂ and PGL₂, recognition by Frobenius polynomials, the adjoint representation | R16.2, R16.3, R16.6, R17.1, R17.4–R17.6 |
| AlgebraicModularFormsAndSerreWeights | R15.1–R15.3, R15.5, R15.6 | mod p and Katz modular forms, weight change by the Hasse invariant, Deligne–Serre lifting of residual eigensystems, the residual modularity witness | R17.6 |
| AutomorphicGaloisRepresentations | R19.1, R19.4 | the residual representations of newforms and their conductors | R17.6 |
| MetaplecticAutomorphicForms | MP.5 | theta series and Eisenstein series on the metaplectic cover, for the Gelbart–Jacquet Shimura integral | R17.4 |
| Tau Ceti ModularForms | Layers 4, 6, 7, 8, 8G | newforms and conductors, Atkin–Lehner operators, L-functions, coefficient fields and Galois stability | R16.4–R16.6, R17.5, R17.6 |
| Tau Ceti ClassFieldTheory | Layers 5, 6, 7, 9, 10, 11, 14 | local Brauer groups and reciprocity, the local Artin map and the Weil group, global reciprocity, the Brauer–Hasse–Noether sequence, Hilbert reciprocity and the parity of quaternion ramification | R16.3, R17.1, R17.3–R17.6 |
| Tau Ceti GlobalNumberFields | Layers 1, 7, 8, 9, 10 | weak approximation, idele class groups and ray classes, norms of Hecke characters, Hecke characters and their infinity types | R17.4–R17.6 |
| Tau Ceti QuadraticFormInvariants | Layers 2, 6D | quaternion algebras, reduced norms and the local classification | R17.1 |
| Tau Ceti InductionRestriction, Chebotarev, NumberFieldArithmetic, ProfiniteCohomology | Layers 3 and 7; 10; 5; 10 | the Mackey formula and Schur multipliers; the Chebotarev density theorem; completions and the splitting of places; continuous cohomology | R17.5, R17.6 |

Every request is listed in full under “Requests to other roadmaps”. Several imported layers are named only in text because they are not yet in the atlas: AutomorphicFormsOnReductiveGroups AF.1b (archimedean classification and the archimedean correspondence, RT-AREA-automorphic-1/2), AutomorphicLFunctionsAndLocalFactors AL.3b (the GL_n converse theorem, RT-AREA-automorphic-1/1) and this roadmap’s proposed layer R17.4a. Until they exist, the current layers carry the requests.

### What other roadmaps take from this one

The atlas draws stage edges from this roadmap to AutomorphicGaloisRepresentations R19.1 (from R16.6) and R19.2 (from R17.3), ClassicalSerreModularity R26.1, R27.1 and R33.1 (from R17.6), GrossZagierAndArithmeticHeights GZ.3 (R17.3) and GZ.4 (R16.2), HeegnerPointEulerSystems HE.6 (R17.5), HilbertModularVarietiesAndShimuraCurves R18.3 (R16.2), PadicLocalLanglandsForGL2Qp R30.1 (R16.3), PotentialModularityAndCompatibleSystems R23.3 (R17.5) and R24.1 (R17.6), and SerreWeightAndLevelOptimisation R20.1 (R17.6). RS-21 adds links to AutomorphicLFunctionsAndLocalFactors AL.5 and GrossZagierAndArithmeticHeights GZ.4 (from R16.2), HilbertModularVarietiesAndShimuraCurves R18.3 (R17.3), EndoscopicTransferAndUnitaryTraceComparison ET.7a and ModularityAndLanglandsExtensions ML.1 and ML.5 (from R17.4 and R17.5), and ClassicalSerreModularity R33.5 (R17.6); RS-06 adds R17.6 → ClassicalSerreModularity R26.4 and R26.5.

Twenty-one packets of other roadmaps cite this roadmap, and every id they cite exists in the two parts. Three cite nodes: HeegnerPointEulerSystems HE.0 (`R17.3/global-jl`, `R17.3/multiplicity-one`), HilbertModularVarietiesAndShimuraCurves R18.2 (`R17.3/definite-infinity`, `global-jl`, `invariant-exchange`, `rational-models`, `split-hecke`) and AutomorphicGaloisRepresentations (`R17.4/adjoint-lift`, `R17.4/nonnormal-cubic-base-change`); the others cite layers with requests. The heaviest consumers are the modularity roadmaps (GL2ModularityLifting, PotentialModularityAndCompatibleSystems, ClassicalSerreModularity, SerreWeightAndLevelOptimisation, OrdinaryAutomorphicFormsAndModularityLifting, SmallRamificationAndAbelianVarietyBaseCases), which take Jacquet–Langlands, solvable base change and descent, and the solvable residual cases; and AutomorphicGaloisRepresentations, which takes base change of degree at most three, the Artin cases and Tunnell’s globalisation. Part R17.3 records these exports under “Layer links and interface exports”. GL2ModularityLifting’s request to R17.4 for Gee’s Proposition 4.25 corresponds to `R17.6/compatible-descent` and `R17.6/potential-modularity-interface`.

### Red-team findings

The parts record how they handled the confirmed findings handed to them: RT-AREA-automorphic-1/2, /9 and /14 (part R16.1: archimedean owner AF.1b, the Whittaker expansion before multiplicity one, AL.0 as owner of Schwartz–Bruhat functions), and RT-AREA-automorphic-1/1, /11, /12, RT-AREA-langlands-1/1 and RT-AREA-langlands-2/4 (part R17.3: the GL₃ inputs and R17.4a, the edges from R16.4–R16.6 into R17, the export to R18, cyclic base change in ET.4b, and the R17.4/R17.5 → R19.2 exports). Other confirmed findings name this roadmap but concern other owners or the pending RS-21 revision; the ones that bear on its boundaries are these.
- **RT-AREA-langlands-2/33**, handed to part R17.3’s job, asks for an edge R17.4 → OrdinaryAutomorphicFormsAndModularityLifting R21.4 (Skinner–Wiles descent uses solvable base change). Neither part records it; the edge appears when the OrdinaryAutomorphicFormsAndModularityLifting packet, which cites R17.4 from R21.4 and R21.5, is promoted.
- **RT-RS-21/1** and **/2** (R16.2’s field-valued newvector theorem as AutomorphicCongruences L3’s supplier; one general Whittaker expansion in AL.3) are fixed in the revised RS-21, whose review is pending. Part R16.1 already plans the expansion as a specialisation of AL.3.
- **RT-AREA-iwasawa-1/8** removes the stage edge R17.5 → HeegnerPointEulerSystems HE.6, since Zhang’s argument uses Jacquet–Langlands, not Langlands–Tunnell; `data/atlas.json` still has the edge.
- **RT-AREA-langlands-2/24**, **RT-RS-06/1** and **RT-PAPER-KHARE-WINTENBERGER-09-I/6** make R17.4–R17.6 the owners of base change and descent and of the dihedral and solvable residual cases that PotentialModularityAndCompatibleSystems R23.5 and ClassicalSerreModularity R27.1 use.
- **RT-PAPER-DOR-23/2–/4, /8**, **RT-PAPER-KHARE-WINTENBERGER-09-II/13** and **RT-PAPER-YUN-ZHANG-19/19** route GL₂ facts of papers to R16.2: the Kirillov model, the spherical generator of the Iwahori–Hecke algebra, the contragredient as transpose, newvectors and normalized local period values. Part R16.1 plans the Kirillov model of a supercuspidal, the Iwahori centre and newvectors; it has no node for the contragredient-to-transpose identification or the local period values.
- **RT-PAPER-NEWTON-THORNE-21-B/2** keeps R16.6 as owner of twists of eigenforms with their algebraic twisting character, and **RT-PAPER-BURUNGALE-TIAN-26/6** asks where CM newforms (self-twists, CM L-functions, induction from Hecke characters) are compared; `R16.4/non-cm-self-twists` and `R17.5/quadratic-induction` are the nodes nearest to them.

### The libraries

The reviewed library audit is AUDIT-14 (`research/blueprint/audit/AUDIT-14.result.json`, accepted by REV-AUDIT-14; `data/library-coverage.json` agrees). It records all twelve layers as not built: “Everything the roadmap actually targets is missing: GL₂(𝔸_F) and automorphic representations, smooth admissible representations of GL₂ over local fields and their classification, local newvectors, local Langlands and Weil–Deligne data, the converse theorem, local and global Jacquet–Langlands, Hilbert symbols and Hasse invariants, trace formulas, base change, automorphic induction and Langlands–Tunnell.” What exists is the input the layers are matched against: Mathlib’s matrix groups, representations, invariants, induced representations and Haar measures, and Tau Ceti’s classical newforms, symmetric powers, finite-group Mackey and Clifford theory, projective representations and the non-solvability of GL₂. The node entries cite the declarations they use, listed under “The pinned libraries”.

### Ownership inside the neighbourhood

- **Generic local and automorphic theory** belongs to SmoothRepresentationsOfLocalGroups, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory and AdelicAlgebraicGroups. This roadmap specialises them to GL₂ and proves the explicit GL₂ statements: the classification, newvectors, the converse theorem, multiplicity one, the trace-formula test functions.
- **Local Langlands and local Jacquet–Langlands** belong to EndoscopicTransferAndUnitaryTraceComparison ET.6; R16.3 and R17.1 compute them in rank two and do not construct them again. Generic cyclic base change and automorphic induction for GL_n belong to the proposed ET.4b (RT-AREA-langlands-1/1); R17.4 and R17.5 specialise it.
- **Owned here** (RS-21): local GL₂ conductor and newvector dimensions and twist formulas (R16.2); GL₂ cyclic and solvable automorphic base change and descent (R17.4); rank-two monomial automorphic induction and soluble Artin modularity (R17.5); the characteristic-two soluble residual modularity witness (R17.6).
- **Geometry and Galois representations** belong to HilbertModularVarietiesAndShimuraCurves R18 and AutomorphicGaloisRepresentations R19. R17.3 supplies the analytic transfer that R18.3 and R18.4 realise geometrically; Carayol’s comparison for extraordinary dyadic parameters under cubic base change is AutomorphicGaloisRepresentations R19.2’s, and this roadmap supplies its inputs (`R17.4/nonnormal-cubic-base-change`, `R17.5/tunnell-primitive-globalization`, `R17.5/prescribed-local-induction`).
- **Inputs with no owner** are recorded as gaps, with their exact statements and the nodes that need them (Gaps). Part R16.1 records eight, among them the global existence of a quaternion algebra with prescribed ramification. Part R17.3 records six: the GL₃ converse theorem and pole inputs (AL.3b), the original JPSS non-normal cubic transfer, Clozel’s limit multiplicities, the reduction-compatible lift of a finite solvable projective image for p > 2, the local–global extension of characters, and the all-place upgrade of tetrahedral and octahedral automorphy.

## Conventions

- **Fields.** Global statements are over a number field F with adele ring 𝔸 = 𝔸_F; layers R17.5–R17.6 specialise to ℚ or to totally real fields where their sources do. Locally, F is a nonarchimedean local field of characteristic zero with integers O, maximal ideal p, uniformizer ϖ and residue cardinality q, or ℝ or ℂ. The normalized absolute value ν = |·|_F has ν(ϖ) = q⁻¹, and |z|_ℂ = |z|².
- **The group.** GL₂ is Mathlib’s `Matrix.GeneralLinearGroup (Fin 2)`; no second carrier is introduced. B is the upper triangular Borel subgroup, n(x) = (1 x; 0 1), and δ_B(diag(a, d)) = |a/d|. Normalized induction I(χ₁, χ₂) includes δ_B^{1/2}, so the ratio χ₁χ₂⁻¹ = ν gives the Steinberg subrepresentation and the one-dimensional quotient, and reversing the order reverses them.
- **Congruence subgroups.** K₀(pⁿ) is cut out by g₂₁ ∈ pⁿ and K₁(pⁿ) by g₂₁ ∈ pⁿ, g₂₂ − 1 ∈ pⁿ (last-row convention); at n = 0 both are GL₂(O). Casselman prints a top-left convention, and his theorem is transported through π∨ ≅ π ⊗ ω_π⁻¹∘det (R16.2).
- **Whittaker models and additive characters.** Locally ψ is trivial on O and nontrivial on ϖ⁻¹O; W(1) = 1 normalizes a newvector only after ψ and the Whittaker functional are fixed. Globally ψ is the standard character of ℚ composed with the trace from F, with self-dual local measures and vol(F\𝔸) = 1.
- **Reciprocity and Frobenius.** Local class field theory is normalized by Art_F(ϖ) = Φ, a geometric Frobenius, so ν_W(Φ) = q⁻¹; an arithmetic Frobenius is Φ⁻¹. rec is the local Langlands correspondence of ET.6 in the unitary normalization, with values in Frobenius-semisimple Weil–Deligne representations; recᵀ(π) = rec(π) ⊗ ν_W^{−1/2} is the Tate normalization (R16.3). Monodromy is never discarded: L-factors use (ker N)^I.
- **Satake parameters and Hecke operators.** For an unramified π, α = χ₁(ϖ) and β = χ₂(ϖ) are its unitary-normalized Satake parameters. T₁ = [K diag(ϖ,1) K] and T₀ = [K diag(ϖ,ϖ) K] are unnormalized double cosets, with eigenvalues √q(α+β) and αβ on the spherical vector (R16.4/cohomological-rationality). Part R17.3 writes the same operators T_v and S_v, with eigenvalues t_v and s_v, and the arithmetic Euler polynomial 1 − a_vX + b_vX² with a_v = t_v and b_v = q_v s_v (R17.3/split-hecke). For a newform of weight k, π_alg = π ⊗ |det|^{−(k−2)/2} makes T₁ act by a_p, and the arithmetic Hecke parameters are A_p = p^{(k−1)/2}α_p and B_p = p^{(k−1)/2}β_p (R16.6).
- **Archimedean places.** Real places use the full O(2) modules. For k ≥ 2, D_k is the discrete series whose restriction to the identity component has lowest weights ±k; for k = 1 the full-O(2) limit D₁(0) has Weil parameter 1 ⊕ sgn. Complex places have no discrete series modulo the centre. Γ_ℝ(s) = π^{−s/2}Γ(s/2) and Γ_ℂ(s) = 2(2π)^{−s}Γ(s), so Γ_ℝ(s)Γ_ℝ(s+1) = Γ_ℂ(s). The archimedean classification is requested from AutomorphicFormsOnReductiveGroups AF.1.
- **L-functions.** L-functions are in the unitary variable s. For a newform of weight k over ℚ the classical variable is t = s + (k−1)/2, and the functional equations exchange s ↔ 1 − s and t ↔ k − t. In rank two the analytic conductor of the completed L-function is |Disc F|²·N(𝔣_π).
- **Measures and function spaces.** AdelicAlgebraicGroups AA.0 owns restricted Haar products, AA.1 adelic points and AA.2 quotient measures and the central-character L² space; AutomorphicLFunctionsAndLocalFactors AL.0 owns Schwartz–Bruhat functions and Fourier analysis; SmoothRepresentationsOfLocalGroups SR.1 owns the smooth Hecke algebras. Orbital-integral matchings fix centralizer measures as well as ambient Haar measures (R17.2).
- **Automorphic representations.** An automorphic representation is an isomorphism class in the supplier’s carrier (AF.2), irreducible or isobaric (χ₁ ⊞ χ₂); a symbol for a representation never defines a second carrier. Cuspidal means in the cuspidal spectrum with the stated central character.
- **Quaternion algebras.** D/F is a quaternion algebra with ramification set S, a set of finite and real places of even cardinality, with fixed isomorphisms D ⊗ F_v ≅ M₂(F_v) for v ∉ S. Nrd is the reduced norm. A one-dimensional χ∘Nrd is excluded from the cuspidal Jacquet–Langlands correspondence (R17.3/norm-exception); local characters of a division algebra are allowed as components.
- **Residual representations.** A residual representation comes with a coefficient place λ, a residue-field embedding and a stable lattice, and comparisons are of semisimplifications. In characteristic two the oddness of the determinant is vacuous and full Frobenius characteristic polynomials are kept.
- **Corrected statements.** Statements of the sources that the register of mistakes corrects are used in corrected form, and the node says so. The ids are `GL2AutomorphicRepresentationsAndTransfer/E1`–`E11` (part R17.3) and `E12`–`E15` (part R16.1).

**How the parts were reconciled.** The parts use the same notation for groups, local fields, central characters, induction, Steinberg twists and Satake parameters. Three differences remain, and the dictionary below fixes them.
- *Arithmetic normalization.* Part R17.3 speaks of the “arithmetic normalisation” of Hecke eigenvalues and Satake classes, and writes rec^{arith} for “the arithmetic-normalised rank-two local Langlands correspondence” of R16.3. Part R16.1 defines rec (unitary) and recᵀ (Tate), both read at a geometric Frobenius Φ. In part R17.3’s Hecke statements the arithmetic normalization is a_v = t_v, b_v = q_v s_v (R17.3/split-hecke); since T₁ and T₀ act on the spherical vector of a unitary π by √q(α+β) and αβ, its Satake class has eigenvalues √q·α and √q·β, the eigenvalues of recᵀ(π_v)(Φ) (R16.3/tate-unitary-normalization). Where part R17.3 compares with Galois representations at an arithmetic Frobenius, in Artin’s convention (R17.5/q-weight-one, R17.6/compatible-base-change), part R16.1’s rule applies: the Frobenius is inverted on the whole Weil–Deligne datum, which is not the half-twist recᵀ, and weight k uses the algebraic normalization π_alg (R16.3/tate-unitary-normalization, R16.6/weight-k-parameter-conversion). The rules that R17.4 uses, Satake powers A ↦ A^f and restriction of parameters to W_E, hold in each of these normalizations. No node of R16.3 states a correspondence named rec^{arith}.
- *Hecke operators.* Part R16.1’s T₁, T₀ are part R17.3’s T_v, S_v; part R17.3’s arithmetic eigenvalues are a_v = t_v and b_v = q_v s_v.
- *Source ids.* Both parts use the ids `jl70`, `cdn20`, `cdn23`, `pan26`, `converse`, `langlands80`, `ac89` and `bcgp21`. For `jl70` the parts recorded two different IAS files (part R16.1 the retypeset editorial PDF `automorphic-forms-on-gl2_rpl_9.pdf`; part R17.3 `automorphic-forms-on-gl2_rpl.pdf`, whose node locators also use the printed pages of the IAS retypeset edition). For `cdn20`, part R16.1 cites the published JAMS pagination and part R17.3 the author’s file GPW5 with its own pagination. Each node entry links the file its part used; the source ledger gives both records.

Proposed declarations live in two namespaces: `TauCeti.GL2Blueprint` (layers R16.1–R17.2) and `TauCeti.GL2Transfer` (layers R17.3–R17.6). Their names are the packets’ names.

## Sources

The principal sources, by id; the source ledger under Records gives editions, addresses, hashes and the sections read.
- **jl70**: H. Jacquet, R. P. Langlands, *Automorphic forms on GL(2)*, LNM 114 (1970), IAS edition. Local theory, Kirillov and Whittaker models, the converse theorem (Theorem 11.3), quaternion algebras (§§14–16, Theorem 16.1).
- **casselman73**: W. Casselman, *On some results of Atkin and Lehner*, Math. Ann. 201 (1973). Newvectors and the conductor; strong multiplicity one with a finite exceptional set.
- **langlands80**: R. P. Langlands, *Base change for GL(2)*, Annals of Math. Studies 96 (1980), Digital Math Archive typescript. Cyclic base change, the tetrahedral case.
- **ac89**: J. Arthur, L. Clozel, *Simple algebras, base change, and the advanced theory of the trace formula*, Annals of Math. Studies 120 (1989). Base change and descent for GL_n, cuspidality criteria, measure conventions.
- **br10**: A. I. Badulescu, D. Renard, *Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*, Compositio Math. 146 (2010). The global correspondence and its inverse.
- **gj78**, **jpss79**, **tunnell81**, **tunnell78**, **carayol86**: Gelbart–Jacquet (adjoint lift), Jacquet–Piatetski-Shapiro–Shalika (*Automorphic forms on GL(3) II*), Tunnell (octahedral Artin conjecture; local Langlands for GL(2)), Carayol (Hilbert modular forms, §§11–12).
- **ds74**, **rt83**, **rt97**, **wiese04**, **patrikis**, **ddt**: Deligne–Serre (weight one), Rogawski–Tunnell (Hilbert weight one), Rohrlich–Tunnell (an elementary case of Serre’s conjecture), Wiese (dihedral Katz forms), Patrikis (variations on a theorem of Tate), Darmon–Diamond–Taylor (*Fermat’s Last Theorem*).
- **converse**, **cogdell-fields**: J. W. Cogdell, *Piatetski-Shapiro’s work on converse theorems* and *Lectures on L-functions, converse theorems, and functoriality for GL(n)*.
- **getz15**: J. Getz, *An introduction to automorphic representations* (notes). Archimedean conventions and the Casimir.
- Sources of single nodes: Newton–Thorne (**nt26**, tamely dihedral representations and normalizations), Dospinescu–Le Bras (**dlb17**), Henniart’s appendix to Breuil–Mézard (**bm02**), Conrad–Diamond–Taylor (**cdt99**), Calegari–Geraghty (**cg18**, **cg20**), Boxer–Calegari–Gee–Pilloni (**bcgp21**), Haines–Kottwitz–Prasad (**hkp10**), Atobe–Kondo–Yasuda (**aky22**), Colmez–Dospinescu–Nizioł (**cdn20**, **cdn23**) and Pan (**pan26**).

All sources are publicly readable. Locators give printed pages where the source distinguishes them from PDF pages, and say so otherwise.

## Layer overview

| Layer | Title | Part | Nodes | Planets | Coverage |
|---|---|---|---|---|---|
| [R16.1](#layer-R16-1) | Locally compact groups and automorphic functions | R16.1 | 6 | Congruence subgroups, Newform subgroup, Maximal compact subgroups, Iwasawa decomposition, Central character quotient, Finite-level automorphic forms | planned |
| [R16.2](#layer-R16-2) | Local smooth representation theory | R16.1 | 13 | Principal series and Steinberg, Newvector theorem, Kirillov model, Unicity of types, Iwahori center, Archimedean classification | planned |
| [R16.3](#layer-R16-3) | Local Langlands for GL₂ | R16.1 | 9 | Principal-series parameters, Steinberg monodromy, Local normalization bridge, Archimedean local factors, Tamely dihedral representations, CDT local multiplicity one | planned |
| [R16.4](#layer-R16-4) | Global cuspidal decomposition and multiplicity | R16.1 | 6 | Cuspidal tensor factorization, Global Whittaker expansion, Global multiplicity one, Strong multiplicity one, Cohomological rationality, Non-CM self-twists | planned |
| [R16.5](#layer-R16-5) | Integral formulas and converse-theorem prerequisites | R16.1 | 4 | Whittaker Mellin comparison, GL₂ converse theorem, Classical L-function comparison | planned |
| [R16.6](#layer-R16-6) | Classical and cohomological specialisations | R16.1 | 6 | Primitive adelization, Hecke and level dictionary, Hilbert algebraic weights, Weight normalization, Weight-one forms | planned |
| [R17.1](#layer-R17-1) | Quaternionic local transfer | R16.1 | 5 | Local Jacquet–Langlands, Norm characters and Steinberg, Real quaternionic transfer, Swapped quaternion invariants | planned |
| [R17.2](#layer-R17-2) | Trace-formula prerequisites and matching | R16.1 | 6 | Steinberg projector, Quaternionic orbital matching, Cyclic norm matching, Spectral term comparison, Cuspidal trace vanishing, Specialized trace comparison | planned |
| [R17.3](#layer-R17-3) | Global Jacquet–Langlands | R17.3 | 12 | Global Jacquet–Langlands correspondence, Quaternionic strong multiplicity one, Definite quaternionic transfer, Supercuspidal globalization | planned |
| [R17.4](#layer-R17-4) | Cyclic and solvable base change | R17.3 | 15 | Cyclic base change, Cyclic automorphic descent, Cyclic cuspidality criterion, Solvable base change, Gelbart–Jacquet adjoint lift, Non-normal cubic base change | planned |
| [R17.5](#layer-R17-5) | Automorphic induction and Langlands–Tunnell | R17.3 | 15 | Quadratic automorphic induction, Tate’s vanishing theorem, Tetrahedral Artin automorphy, Octahedral Artin automorphy, Langlands–Tunnell theorem | planned |
| [R17.6](#layer-R17-6) | Characteristic-two soluble cases and transfer interfaces | R17.3 | 15 | Rohrlich–Tunnell weight and level lemma, Rohrlich–Tunnell theorem, Wiese’s dihedral lifting lemma, Dihedral Katz weight-one theorem, Characteristic-two solvable modularity | planned |

## Dependencies between the layers

The table lists, for each layer, the layers of this roadmap its stage text requires (`data/atlas.json`), the layers of this roadmap its nodes cite, and the other roadmaps’ layers its nodes cite. Cited layers come from node prerequisites, whether a prerequisite is a node or a layer.

| Layer | Requires (atlas) | Layers of this roadmap cited by its nodes | Other roadmaps’ layers cited |
|---|---|---|---|
| R16.1 | — | — | AdelicAlgebraicGroups AA.0, AA.1, AA.2; AutomorphicFormsOnReductiveGroups AF.1, AF.2; AutomorphicLFunctionsAndLocalFactors AL.0; ReductiveGroupsPartII RG2.0, RG2.4; SmoothRepresentationsOfLocalGroups SR.1 |
| R16.2 | R16.1 | R16.1 | ArithmeticGaloisRepresentations R01.1; AutomorphicFormsOnReductiveGroups AF.1; AutomorphicLFunctionsAndLocalFactors AL.0, AL.2; EndoscopicTransferAndUnitaryTraceComparison ET.6; SmoothRepresentationsOfLocalGroups SR.0:abelian-category, SR.1, SR.2, SR.3, SR.4, SR.5 |
| R16.3 | R16.2 | R16.2 | ArithmeticGaloisRepresentations R01.2, R01.3; AutomorphicFormsOnReductiveGroups AF.1; AutomorphicLFunctionsAndLocalFactors AL.1, AL.2; EndoscopicTransferAndUnitaryTraceComparison ET.6; Tau Ceti ClassFieldTheory Layer 7, Layer 9 |
| R16.4 | R16.1, R16.2 | R16.1, R16.2 | AdelicAlgebraicGroups AA.2; AutomorphicFormsOnReductiveGroups AF.2, AF.4; AutomorphicLFunctionsAndLocalFactors AL.0, AL.3; AutomorphicSpectralTheory AS.4; SmoothRepresentationsOfLocalGroups SR.5; Tau Ceti ModularForms Layer 8, Layer 8G |
| R16.5 | R16.4 | R16.2, R16.3, R16.4 | AutomorphicFormsOnReductiveGroups AF.1, AF.2, AF.5; AutomorphicLFunctionsAndLocalFactors AL.0, AL.1, AL.2, AL.3; Tau Ceti ModularForms Layer 4, Layer 7 |
| R16.6 | R16.3, R16.5 | R16.2, R16.3, R16.4, R16.5 | ArithmeticGaloisRepresentations R01.2; AutomorphicFormsOnReductiveGroups AF.1, AF.4, AF.5; AutomorphicLFunctionsAndLocalFactors AL.1; Tau Ceti ModularForms Layer 4 |
| R17.1 | R16.3 | R16.2, R16.3, R16.6 | ArithmeticGaloisRepresentations R01.3; AutomorphicFormsOnReductiveGroups AF.1; EndoscopicTransferAndUnitaryTraceComparison ET.6; Tau Ceti ClassFieldTheory Layer 14; Tau Ceti QuadraticFormInvariants 6D, Layer 2 |
| R17.2 | R17.1 | R16.1, R16.2, R16.3, R17.1 | AdelicAlgebraicGroups AA.2; AutomorphicSpectralTheory AS.2, AS.4, AS.6; EndoscopicTransferAndUnitaryTraceComparison ET.1, ET.3, ET.4, ET.6; SmoothRepresentationsOfLocalGroups SR.1, SR.2, SR.3, SR.4 |
| R17.3 | R17.2 | R16.1, R16.2, R16.3, R16.4, R16.5, R16.6, R17.1, R17.2 | AutomorphicFormsOnReductiveGroups AF.2, AF.3, AF.4; AutomorphicSpectralTheory AS.6; Tau Ceti ClassFieldTheory Layer 14 |
| R17.4 | R17.3 | R16.3, R16.4, R16.5, R17.2 | ArithmeticGaloisRepresentations G7; AutomorphicFormsOnReductiveGroups AF.2, AF.3; AutomorphicLFunctionsAndLocalFactors AL.1, AL.3; EndoscopicTransferAndUnitaryTraceComparison ET.6; MetaplecticAutomorphicForms MP.5; Tau Ceti ClassFieldTheory Layer 11; Tau Ceti GlobalNumberFields Layer 8, Layer 9 |
| R17.5 | R17.4 | R16.2, R16.3, R16.4, R16.5, R16.6, R17.4 | ArithmeticGaloisRepresentations R01.1, R01.3, R01.4, R01.5; AutomorphicFormsOnReductiveGroups AF.5; AutomorphicLFunctionsAndLocalFactors AL.1; Tau Ceti ClassFieldTheory Layer 10, Layer 11, Layer 5, Layer 6; Tau Ceti GlobalNumberFields Layer 1, Layer 10, Layer 7, Layer 9; Tau Ceti ModularForms Layer 4; Tau Ceti NumberFieldArithmetic Layer 5; Tau Ceti ProfiniteCohomology Layer 10; Tau Ceti RepresentationTheory/InductionRestriction Layer 7 |
| R17.6 | R17.5 | R16.4, R16.6, R17.4, R17.5 | AlgebraicModularFormsAndSerreWeights R15.1, R15.2, R15.3, R15.5, R15.6; ArithmeticGaloisRepresentations R01.1, R01.3, R01.4, R01.5; AutomorphicGaloisRepresentations R19.1, R19.4; Tau Ceti Chebotarev Layer 10; Tau Ceti ClassFieldTheory Layer 11; Tau Ceti GlobalNumberFields Layer 7, Layer 9; Tau Ceti ModularForms Layer 4, Layer 6; Tau Ceti RepresentationTheory/InductionRestriction Layer 3 |

**Layer edges the nodes use but the atlas does not declare.** The atlas declares thirteen edges between this roadmap’s layers, the `requires` column above. The nodes use forty. Of the twenty-eight used edges that are not declared, sixteen follow from the declared ones (for example R16.3 → R17.4 through R17.1, R17.2 and R17.3), and four of the others are RS-21 links (R16.2 → R16.6, R16.4 → R17.3, R16.5 → R17.5, R16.6 → R17.5), which also cover R16.4 → R17.4, R16.4 → R17.5, R16.4 → R17.6 and R16.6 → R17.6. Five are covered by neither: R16.3 → R16.5 (`R16.5/classical-l-function-comparison` and `R16.5/global-epsilon-normalization` use R16.3’s factors), R16.5 → R17.3 (`R17.3/local-factors` uses R16.5’s Godement–Jacquet factors), R16.5 → R17.4 (`R17.4/nonnormal-cubic-base-change` uses the converse theorem), R16.6 → R17.1 (`R17.1/real-quaternionic-comparison` uses `R16.6/hilbert-algebraic-weights`) and R16.6 → R17.3 (`R17.3/definite-infinity` uses the Hilbert weights). Declaring R16.3 → R16.5 and R16.6 → R17.1 makes all five follow, with the RS-21 links. Promotion draws no stage edge between two layers of one roadmap (`scripts/blueprints.py`), so these edges have to be declared in the stages’ `requires`. The declared edge R17.3 → R17.4 is used by no node: R17.4 cites R17.2, R16.3, R16.4 and R16.5 directly.

**Cycles.** The stage graph of `data/atlas.json`, with its links and accepted restructurings, stays acyclic when the 121 cross-roadmap edges that the two parts induce and the twenty-eight undeclared layer edges are added. Edges induced by other roadmaps’ packets do close cycles through this roadmap, through the requirement AutomorphicGaloisRepresentationsPartII AG2.1a → EndoscopicTransferAndUnitaryTraceComparison ET.6. Two such edges each close one: the AutomorphicGaloisRepresentationsPartII AG2.0 packet cites AutomorphicGaloisRepresentations R19.1, which closes R16.6 → R19.1 → AG2.0 → AG2.1a → ET.6 → R16.6; and the AutomorphicGaloisRepresentations packet’s `R19.3/skinner-density-one-ordinary-primes` cites SerreWeightAndLevelOptimisation R20.2, which closes R19.4 → R17.6 → R20.1 → R20.2 → R19.3 → R19.4 (R17.6 enters through `R17.6/rt-technical-lemma`, which cites `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`). Both are findings for those packets’ owners; the handoff note lists them.

## How to read a node entry

Each node has a heading with its id (without the roadmap prefix) and title, marked ★ when it is a planet of the atlas. The line under it gives its kind, its full id, its proposed Lean declaration, the proposed module and namespace, and its planet name. Then come the statement, the hypotheses, the construction or proof outline, the uses that determine the API (definitions and constructions), the API table, the unit tests, the acceptance checks, the prerequisites and the sources. Prerequisites inside the roadmap are links; `mathlib:` and `tauceti:` prerequisites are declarations of the pinned libraries (see “The pinned libraries”); other ids are nodes or stages of other roadmaps, listed with their requests under “Requests to other roadmaps”. Each source citation gives the source id, the locator, the excerpt and the match as the packet records them.

*Assembly notes* are not part of the packets. They record what the assembly checked: for a layer citation, the nodes of the other part that supply what is used; for a part R16.1 citation, the passage at the locator.

## The suggested Lean file

`research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer.lean` joins the two parts’ files under one standard note and one import block of 29 Mathlib modules; it imports no Tau Ceti module. The declarations of layers R16.1–R17.2 are in `TauCeti.GL2Blueprint` and those of layers R17.3–R17.6 in `TauCeti.GL2Transfer`, under the names the packets give them: every node declaration and every API and test name of both packets (112 declarations, 81 API names, 66 test names) occurs in the file, each test name as a comment directly before its `example`. In the R17.3–R17.6 sections, comment lines headed *Layer inputs* name the `TauCeti.GL2Blueprint` declarations that stand for the inputs those sections take as parameters. A node index at the end lists, layer by layer, the Lean names typed for each node. At the pinned Mathlib the file elaborates, and its only warnings are the 259 placeholder-proof warnings.

The pinned libraries have the matrix groups GL₂ and PGL₂, representations with their invariants, induced and irreducible representations, Haar measures and absolute Galois groups. They have none of the supplier carriers this roadmap builds on: smooth irreducible local representations, automorphic representations, Weil–Deligne parameters, test functions and trace distributions. The file therefore takes those carriers and the operations on them (local components, twists, Satake classes, local correspondences) as parameters, and names the conditions it cannot state in `Missing:` comments beside each signature, never as `Prop`-valued fields. A signature with omitted conditions is a proposed name and shape, not a theorem: many of these signatures are false for arbitrary values of their parameters (for example `IsCompact K` for an arbitrary set K, or an equivalence `DClass ≃ FClass` between arbitrary types), and become true only when the parameters are the suppliers’ objects. The node entries above state the complete mathematics. Where a Tau Ceti declaration cited by a packet enters (the primitive `Newform` carrier, `symPowerRep`, the Schur-multiplier lifting theorem), the file takes a parameter for it, because the shared build’s Tau Ceti is not at the pinned commit.

<a id="layer-R16-1"></a>

# Layer R16.1. Locally compact groups and automorphic functions

This layer fixes the groups, compact subgroups and measures on which the rest of the roadmap computes. `k0` and `k1` define K₀(I) and K₁(I) for any commutative ring R and ideal I as subgroups of Mathlib's `Matrix.GeneralLinearGroup (Fin 2) R`, by the condition g₂₁ ∈ I and by the conditions g₂₁ ∈ I, g₂₂ − 1 ∈ I on the last row; over the integers O of a nonarchimedean local field, K₀(p) is the Iwahori subgroup and the K₁(pⁿ) are the newform subgroups of Casselman's theory.

The other four nodes specialise generic owners to GL₂ over a number field F, without defining a second carrier. `local-adelic-compact-comparison` identifies the maximal compact subgroups GL₂(O_v), O(2) and U(2) and the adelic compact (integral-point topology from ReductiveGroupsPartII RG2.0, the restricted product from AdelicAlgebraicGroups AA.1, archimedean compacts from AutomorphicFormsOnReductiveGroups AF.1). `iwasawa-cartan` gives the Iwasawa and Cartan decompositions with the modulus δ_B(diag(a,d)) = |a/d|. `haar-quotient-comparison` fixes the Haar measures and the central-character L² space on Z(𝔸)GL₂(F)\GL₂(𝔸) (AA.0, AA.2). `finite-level-comparison` writes the automorphic forms of a compact open level as a sum of classical spaces on arithmetic quotients (AF.2).

**Nodes:** 6. **Planets:** Congruence subgroups, Newform subgroup, Maximal compact subgroups, Iwasawa decomposition, Central character quotient, Finite-level automorphic forms.

<a id="R16-1-k0"></a>

### `R16.1/k0` — The lower-left congruence subgroup ★

*Definition* · node `GL2AutomorphicRepresentationsAndTransfer:R16.1/k0` · declaration `TauCeti.GL2Blueprint.k0` · proposed module `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint` · planet **Congruence subgroups**

For a commutative valuation ring O, maximal ideal p and n≥0, K₀(pⁿ) is the subgroup of the existing GL₂(O) consisting of matrices g with g₂₁∈pⁿ. For a general commutative ring R and ideal I the same formula defines K₀(I). Its image in GL₂(F) uses the existing coefficient map. At n=0 this is all GL₂(O).

**Hypotheses.**

- O is the ring of integers of a nonarchimedean local field F; the algebraic subgroup definition works for any commutative ring.

**Construction.**

1. Use multiplication and the two-by-two inverse formula to preserve the ideal condition.
2. Map GL₂(O) injectively to GL₂(F); compactness/openness is supplied by the local-field and reductive-group owners.

**Uses that determine the API.**

- *Casselman §1*: Defines the central-character isotypic newvector line.
- *R17.2*: Fixes the Iwahori idempotent and its Haar normalization.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.k0_mem` | characterisation | g∈K₀(I) iff g₂₁∈I. |
| `TauCeti.GL2Blueprint.k0_mono` | functoriality | I⊆J implies K₀(I)⊆K₀(J). |
| `TauCeti.GL2Blueprint.k0_top` | compatibility | K₀(R)=GL₂(R), expressed as the top subgroup. |
| `TauCeti.GL2Blueprint.k0_scalar` | simp | Every scalar unit matrix belongs to K₀(I). |

**Unit tests.**

- `TauCeti.GL2Blueprint.k0_identity` (computation): The identity matrix is in K₀(I).
- `TauCeti.GL2Blueprint.k0_level_zero` (degenerate): K₀(p⁰) is the full group, including the Weyl matrix.
- `TauCeti.GL2Blueprint.k0_wrong_entry` (non-example): Over ℤ/5ℤ and I=0, (1 1;0 1) belongs, whereas (1 0;1 1) does not.

**Acceptance.**

- K₀(p) is the upper Iwahori; the name refers to the lower-left entry.

**Prerequisites.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.map`.

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), p. 301, §1 definition of Γ₀(b). Excerpt: “let Γ₀(b)”. Match: The passage supplies the the lower-left congruence subgroup input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 301 = PDF p. 2 (PDF p. 1 is the Göttingen cover sheet; PDF = printed − 299); transcribed from the page image; exact): “In this section, let k be a locally compact non-archimedean field, 𝔬ₖ its ring of integers, 𝔭 its prime ideal, and π a generator of 𝔭. Further, for any ideal 𝔟 of 𝔬ₖ, let Γ₀(𝔟) = {(a b; c d) ∈ GL₂(𝔬ₖ) | c ≡ 0 (mod 𝔟)}.” Casselman's Γ₀(𝔟) is the node's K₀(𝔭ⁿ) for 𝔟 = 𝔭ⁿ (lower-left entry in the ideal, matrix written row-wise as (a b; c d)); the extension to an arbitrary commutative ring R and ideal I is not in the source, and Casselman's k is any locally compact non-archimedean field.

<a id="R16-1-k1"></a>

### `R16.1/k1` — The last-row congruence subgroup ★

*Definition* · node `GL2AutomorphicRepresentationsAndTransfer:R16.1/k1` · declaration `TauCeti.GL2Blueprint.k1` · proposed module `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint` · planet **Newform subgroup**

K₁(pⁿ)={g∈GL₂(O): g₂₁∈pⁿ and g₂₂−1∈pⁿ}; over R write K₁(I). It is the inverse image of the stabilizer of row (0,1) under reduction modulo I, not the full principal congruence subgroup. K₁(p⁰)=GL₂(O).

**Hypotheses.**

- Commutative ring R and ideal I; use O,p for local compactness.

**Construction.**

1. Reduce matrices modulo I and take the stabilizer of the last row.
2. Compare entry conditions to AKY K(2,(0,n)); the first row has depth zero.

**Uses that determine the API.**

- *AKY §1.2*: The rank-two conductor vector is (0,cπ).
- *R16.6*: The primitive level is the product of the local K₁ conductor levels.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.k1_mem` | characterisation | g∈K₁(I) iff g₂₁∈I and g₂₂−1∈I. |
| `TauCeti.GL2Blueprint.k1_le_k0` | compatibility | K₁(I)⊆K₀(I). |
| `TauCeti.GL2Blueprint.k1_mono` | functoriality | I⊆J implies K₁(I)⊆K₁(J); in particular K₁(pⁿ⁺¹)⊆K₁(pⁿ). |
| `TauCeti.GL2Blueprint.k1_top` | simp | K₁(R) is the full matrix unit group. |
| `TauCeti.GL2Blueprint.k1_scalar` | characterisation | Scalar u belongs to K₁(I) iff u−1∈I. |

**Unit tests.**

- `TauCeti.GL2Blueprint.k1_identity` (computation): The identity belongs to K₁(I).
- `TauCeti.GL2Blueprint.k1_level_zero` (degenerate): K₁(p⁰)=GL₂(O).
- `TauCeti.GL2Blueprint.k1_not_principal` (non-example): Over ℤ/5ℤ, (2 0;0 1) lies in K₁(0), although it is not the identity modulo 5.

**Acceptance.**

- At n≥1 the scalar intersection consists of units congruent to one modulo pⁿ.

**Prerequisites.** [`R16.1/k0`](#R16-1-k0), `mathlib:Matrix.GeneralLinearGroup`.

**Sources.**

- **aky22** (Hiraku Atobe, Satoshi Kondo and Seidai Yasuda, [*Local newforms for the general linear groups over a non-archimedean local field*](https://arxiv.org/pdf/2110.09070v4)), §1.2, pp. 3–4, K(n,λ) and generic λπ. Excerpt: “Kn,λ”. Match: The passage supplies the the last-row congruence subgroup input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 3 = PDF p. 3 (arXiv v4, printed and PDF pages coincide); the generic case λπ = (0, . . . , 0, cπ) is on printed p. 4 = PDF p. 4; checked against the text layer; specialisation): “For λ = (λ1 , . . . , λn ) ∈ Λn , we define a subgroup Kn,λ of GLn (o) by Kn,λ = {(ki,j ) ∈ GLn (o) | ki,j ≡ δi,j mod pλi , 1 ≤ i, j ≤ n}, where δi,j is the Kronecker delta.” AKY define K(n,λ) by k_ij ≡ δ_ij mod p^{λ_i} (superscripts flattened in the text layer); with n = 2 and λ = (0, n) this is exactly g21 ∈ pⁿ, g22 − 1 ∈ pⁿ with no condition on the first row, i.e. the node's K₁(pⁿ), and p. 4 notes that for generic π, λπ = (0,…,0,cπ) recovers the Jacquet–Piatetski-Shapiro–Shalika group; the node's general-ring version K₁(I) is not in AKY.

<a id="R16-1-local-adelic-compact-comparison"></a>

### `R16.1/local-adelic-compact-comparison` — GL₂ local and adelic compact subgroups ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.1/local-adelic-compact-comparison` · declaration `TauCeti.GL2Blueprint.compactComparison` · proposed module `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint` · planet **Maximal compact subgroups**

For any number field F, identify the generic reductive group GL₂(Fv) with existing matrix units. At finite v the standard maximal compact is GL₂(Ov); at real v it is O(2); at complex v it is U(2). The adelic compact is their product, and its finite part is compact open in the restricted product with respect to GL₂(Ov). K₀(pvⁿ), K₁(pvⁿ) and finite products of these are compact open at finite places. All topology and restricted-product identifications are those of AA.1.

**Hypotheses.**

- F a number field; chosen place completions and valuation rings.

**Proof outline.**

1. Apply AA.1 restricted-product comparison to the integral GL₂ model.
2. Use compactness of Ov and the nonvanishing unit determinant condition in GL₂(Ov); reductions have open kernels.
3. Identify real/complex maximal compacts by the transpose/conjugate-transpose equations.

**Acceptance.**

- Includes a dyadic completion and both real and complex places.

**Prerequisites.** [`R16.1/k0`](#R16-1-k0), [`R16.1/k1`](#R16-1-k1), `mathlib:Matrix.GeneralLinearGroup`, `AdelicAlgebraicGroups:AA.1/adelic-points`, `AdelicAlgebraicGroups:AA.1/adelic-points-locally-compact`, `ReductiveGroupsPartII:RG2.0`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §2 printed p. 12, compact-subgroup and Haar convention. Excerpt: “GL(2,”. Match: The passage supplies the gl₂ local and adelic compact subgroups input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 12 = PDF p. 18; checked against the text layer; supporting): “Let dg be that Haar measure on GF which assigns the measure 1 to GL(2, OF ).” JL fix GL(2,O_F) as the compact open subgroup at a non-archimedean place and normalise Haar measure to give it volume 1 (condition (2.2) on the same page uses open subgroups of GL(2,O_F)); O(2,R) is named as the standard maximal compact at printed p. 77 and U(2,C) at printed p. 110, while the adelic product compact, its openness in the restricted product and K0/K1 are not stated here.

<a id="R16-1-iwasawa-cartan"></a>

### `R16.1/iwasawa-cartan` — Rank-two Iwasawa and Cartan coordinates ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan` · declaration `TauCeti.GL2Blueprint.iwasawaCartan` · proposed module `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint` · planet **Iwasawa decomposition**

Specialize RG2.4 at finite places and AF.1 at infinity: GL₂(Fv)=B(Fv)K_v. At a finite place every double coset K_v g K_v has a unique representative diag(ϖᵃ,ϖᵇ) with a≥b integers. With upper triangular B and normalized induction, δB(diag(a,d))=|a/d|v. At infinity use positive singular values and O(2)/U(2).

**Hypotheses.**

- Chosen uniformizer at finite v; upper triangular B.

**Proof outline.**

1. Apply RG2.4 finite-place Cartan/Iwasawa and the requested AF.1 real/complex Iwasawa and singular-value decompositions.
2. Compute the unique positive root a/d and hence the modulus; uniqueness at finite places follows from invariant factors.

**Acceptance.**

- The identity has exponents (0,0); diag(ϖ,1) has (1,0); scalar ϖ has (1,1).

**Prerequisites.** [`R16.1/local-adelic-compact-comparison`](#R16-1-local-adelic-compact-comparison), `ReductiveGroupsPartII:RG2.4`, `mathlib:Matrix.GeneralLinearGroup.det`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §3 formula (3.1) and following compact realization, printed p. 46. Excerpt: “restrictions”. Match: The compact realization uses G=BK and formula (3.1) has the square-root modulus |a/d|¹ᐟ². Cartan uniqueness and archimedean decompositions are the separately requested supplier results.
  - *Assembly note, passage at this locator* (printed p. 46 = PDF p. 52; checked against the text layer; supporting): “Because of the Iwasawa decomposition GF = PF GL(2, OF ) the functions in B(µ1 , µ2 ) are determined by their restrictions to GL(2, OF ).” States the non-archimedean Iwasawa decomposition G = PK, and formula (3.1) just above carries the factor |a1/a2|^{1/2}, the square root of the node's modulus; the Cartan decomposition is only used in passing (GF = GL(2,OF)AF GL(2,OF), printed p. 60; the union over diag(ϖ^-n,1), printed p. 250) and the archimedean decompositions are not in this passage.

<a id="R16-1-haar-quotient-comparison"></a>

### `R16.1/haar-quotient-comparison` — Haar and central-character quotient comparison ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.1/haar-quotient-comparison` · declaration `TauCeti.GL2Blueprint.haarComparison` · proposed module `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint` · planet **Central character quotient**

Fix local measures dg_v on GL₂(Fv), vol(GL₂(Ov))=1 at finite places outside a specified finite set; form AA.0’s restricted Haar product. GL₂ is unimodular. For a continuous unitary idele-class character ω use AA.2’s quotient measure and central-character L² space on Z(𝔸)GL₂(F)\GL₂(𝔸): f(zγg)=ω(z)f(g), with finite integral of |f|². The matrix realization is an isometric right-translation-equivariant identification with AA.2/central-character-l2. Measures on elliptic centralizers are fixed separately, not inferred from dg_v.

**Hypotheses.**

- ω unitary and trivial on F×; quotient is formed by the closed subgroup specified by AA.2.

**Proof outline.**

1. Use AA.0 product and rescaling law and AA.2 quotient integration.
2. Compute the root characters in inverse pairs to get GL₂ unimodularity.
3. Transport the central-character transformation rule and norm under the matrix/adelic identification.

**Acceptance.**

- Rescaling one local dg rescales the product and quotient norms by the same stated positive factor.

**Prerequisites.** [`R16.1/local-adelic-compact-comparison`](#R16-1-local-adelic-compact-comparison), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, `AdelicAlgebraicGroups:AA.2/central-character-l2`, `mathlib:MeasureTheory.Measure.haarMeasure`, `mathlib:MeasureTheory.Measure.haarMeasure_self`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §10 and §16 fixed central character. Excerpt: “η(a)I”. Match: The passage supplies the haar and central-character quotient comparison input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 264 = PDF p. 270; checked against the text layer; supporting): “If F is a global field, A is the adele ring of F , G = GL(2), and η is a character of the idele class group F × \I the space A(η) of all measurable functions ϕ on GF \GA that satisfy” The sentence continues past a display ϕ(diag(a,a)g) = η(a)ϕ(g) with 'for all a in I and whose absolute values are square-integrable on GF ZA \GA is a Hilbert space', which is the node's central-character L² space; printed p. 262 adds the unimodular group G, the space L1(η) on Z\G and π(a) = η(a)I, and §10 (printed p. 168) shows ZA GF\GA has finite measure, but the restricted Haar product normalisation and the isometric identification are not stated; the packet locator gives no page.

<a id="R16-1-finite-level-comparison"></a>

### `R16.1/finite-level-comparison` — Finite-level automorphic functions ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.1/finite-level-comparison` · declaration `TauCeti.GL2Blueprint.finiteLevelComparison` · proposed module `TauCeti/RepresentationTheory/GL2/R161`, namespace `TauCeti.GL2Blueprint` · planet **Finite-level automorphic forms**

At compact open Kf, the GL₂ finite-level space is the Kf-fixed subspace of AF.2’s automorphic forms with chosen central character, finite K∞ types and infinitesimal-character ideal. Using the finite double-coset decomposition GL₂(𝔸)=⊔GL₂(F)tᵢGL₂(F∞)Kf, restriction identifies it with the direct sum of classical spaces on Γᵢ\GL₂(F∞), with Γᵢ the corresponding arithmetic stabilizer. The central character, growth, differential and right-translation conditions are transported, not redefined. AL.0 owns additive Schwartz–Bruhat/Fourier theory; SR.1 owns the compactly supported smooth Hecke carrier.

**Hypotheses.**

- Kf compact open; finite type and finite-codimension annihilator data as in AF.2.

**Proof outline.**

1. Apply AF.2/adelic-classical-bijection and compute Γᵢ from tᵢKftᵢ⁻¹.
2. Transport matrix determinant/central scalars; cite AL.0 for every Fourier input.

**Acceptance.**

- For F=ℚ, compare the chosen K₀(N) character convention with AF.5; no claim that all finite-level spaces are spherical.

**Prerequisites.** [`R16.1/haar-quotient-comparison`](#R16-1-haar-quotient-comparison), `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-form`, `AutomorphicFormsOnReductiveGroups:AF.2/adelic-classical-bijection`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `SmoothRepresentationsOfLocalGroups:SR.1`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), Definition 10.2 and following cusp-form definition. Excerpt: “automorphic”. Match: The passage supplies the finite-level automorphic functions input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 169 = PDF p. 175; checked against the text layer; supporting): “Definition 10.2. A continuous function ϕ on GF \GA is said to be an automorphic form if (i) It is K-finite on the right.” Definition 10.2 continues with (ii) finite-dimensionality of ρ(ξ*f)ϕ for elementary idempotents ξ and (iii) slow increase (misprinted in this edition as 'ξ is slowly increasing' where ϕ is meant), and the cuspidality condition follows on the same page; JL define the adelic automorphic and cusp forms but do not state the Kf-fixed finite-level space or its double-coset identification with classical spaces on Γi\GL2(F∞).

<a id="layer-R16-2"></a>

# Layer R16.2. Local smooth representation theory

The local theory of GL₂(F), for F nonarchimedean of characteristic zero and complex coefficients, specialising SmoothRepresentationsOfLocalGroups SR.2–SR.5. `local-classification` lists the irreducible admissible representations: irreducible normalized principal series I(χ₁, χ₂) with χ₁χ₂⁻¹ ≠ ν^{±1}, twists St ⊗ χ∘det of the Steinberg representation, characters χ∘det and supercuspidals.

Casselman's newvector theory comes next. A nonzero K₁(pⁿ)-fixed vector exists for some n (`newvector-level-exists`); the conductor exponent c(π) is the least such n (`newvector-conductor`); dim π^{K₁(pⁿ)} = max(0, n − c(π) + 1) (`casselman-newvector`); the newvector is normalized by W(1) = 1 in the Whittaker model (`normalized-newvector`), and the spherical Whittaker function is computed by a recurrence in the Satake parameters (`spherical-whittaker-values`). The layer then treats Iwahori oldforms (`iwahori-oldforms`), the Kirillov model of a supercuspidal (`supercuspidal-kirillov`), Henniart's unicity of types (`henniart-unicity`), projectivity of supercuspidals among smooth representations with a fixed central character (`supercuspidal-projective`), the Conrad–Diamond–Taylor type at a vexing prime (`cdt-vexing-type`), the centre of the Iwahori–Hecke algebra (`iwahori-center`) and the explicit archimedean cases (`archimedean-classification`), whose classification is imported from AF.1. Residue characteristic two is included.

**Nodes:** 13. **Planets:** Principal series and Steinberg, Newvector theorem, Kirillov model, Unicity of types, Iwahori center, Archimedean classification.

<a id="R16-2-local-classification"></a>

### `R16.2/local-classification` — Explicit nonarchimedean classification ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification` · declaration `TauCeti.GL2Blueprint.localClassification` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint` · planet **Principal series and Steinberg**

Over any nonarchimedean characteristic-zero local field F, with ν=|·|F and complex coefficients, normalized induction I(χ₁,χ₂)=Ind_B^G(χ₁⊗χ₂) is irreducible iff χ₁χ₂⁻¹≠ν,ν⁻¹. Its central character is χ₁χ₂. If χ₁=χν¹ᐟ², χ₂=χν⁻¹ᐟ², it has the essentially Steinberg subrepresentation St⊗χdet and one-dimensional quotient χdet; reversing the order reverses the sub/quotient. Every irreducible admissible representation is a character of determinant, irreducible principal series, essentially Steinberg, or supercuspidal. Infinite-dimensional irreducibles are generic; one-dimensional characters are not. These are explicit calculations in the SR.2 induction/Jacquet carriers and ET.6 classification, including residue characteristic two.

**Hypotheses.**

- Smooth, irreducible, admissible complex representations; χᵢ smooth quasicharacters.

**Proof outline.**

1. Compute the standard intertwining operator in the compact realization and its exceptional ratios (Casselman p. 305; JL §3).
2. Identify the length-two exceptional composition series; use ET.6 for exhaustion including wild supercuspidals.
3. Use SR.5 local Whittaker uniqueness and derivatives to identify genericity.

**Acceptance.**

- At χ₁=χ₂=1 the normalized principal series is irreducible; χdet is a different one-dimensional quotient at ratio ν.

**Prerequisites.** [`R16.1/iwasawa-cartan`](#R16-1-iwasawa-cartan), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), p. 305, principal/special classification. Excerpt: “equivalences”. Match: The passage supplies the explicit nonarchimedean classification input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 305 = PDF p. 6; transcribed from the page image; supporting): “These are the only equivalences among these representations, and they, together with the absolutely cuspidal ones, exhaust the admissible representations of GL₂(k).” The paragraph quotes from Jacquet–Langlands [4] the irreducibility criterion μ₁·μ₂⁻¹ ≠ αₖ^{±1}, the infinite-dimensional special subspace 𝔅ₛ(μ₁,μ₂) with one-dimensional quotient μ(det g) for μ₁ = μαₖ^{1/2}, μ₂ = μαₖ^{−1/2} (same sub/quotient order as the node) and exhaustion with the absolutely cuspidal representations, without proof; the central character ε = μ₁μ₂ is in the next paragraph, genericity is not stated, and 'admissible' here means irreducible admissible.

<a id="R16-2-newvector-level-exists"></a>

### `R16.2/newvector-level-exists` — Existence of a nonzero newvector level

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-level-exists` · declaration `TauCeti.GL2Blueprint.newvectorLevelExists` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`

For an irreducible admissible infinite-dimensional complex smooth representation π of GL₂(F), with F a nonarchimedean local field of characteristic zero, there is n≥0 and a nonzero vector fixed by the last-row K₁(pⁿ). This assertion neither uses a conductor exponent nor asserts the dimension formula; it supplies the nonempty level set before its minimum is defined.

**Hypotheses.**

- Irreducible admissible infinite-dimensional complex smooth π; K₁ is the last-row subgroup over the valuation ring.

**Proof outline.**

1. Use SR.5 genericity/Kirillov realization of π∨ with ψ of conductor O. Choose the nonzero compactly supported function f(u)=ωπ∨(u) on O×, extended by zero. The Borel action gives the top-left character on upper triangular matrices in GL₂(O); smoothness gives invariance under a sufficiently small lower unipotent subgroup.
2. Use the elementary K₀ decomposition into upper-triangular and lower-unipotent factors (Casselman p.303) to obtain Casselman’s top-left ωπ∨(a) transformation law at some level, enlarging the level to contain the central-character conductor.
3. Apply SR.3’s π∨≅π⊗ωπ⁻¹det and twist back. Since det(g)≡ad modulo pⁿ and ωπ is trivial on 1+pⁿ, the resulting law is ωπ(d); restriction to last-row K₁(pⁿ) is trivial.

**Acceptance.**

- The existence proof never takes the minimum of an unproved nonempty set or invokes the subsequent Casselman dimension theorem.

**Prerequisites.** [`R16.1/k1`](#R16-1-k1), [`R16.2/local-classification`](#R16-2-local-classification), `mathlib:Representation.invariants`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.5`.

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), §1 Theorem1 and Kirillov setup, printed p.302; elementary subgroup decomposition, printed p.303. Excerpt: “Kirillov realization”. Match: The Kirillov realization and smoothness give existence at some level independently of the least-level/dimension calculation; the stated contragredient translation converts the paper’s top-left character convention to last-row invariants.
  - *Assembly note, passage at this locator* (printed p. 302 = PDF p. 3 (decomposition: printed p. 303 = PDF p. 4); transcribed from the page image; supporting): “Recall that an admissible representation of GL₂(k) is one such that (i) every vector is GL₂(𝔬ₖ)-finite and (ii) the set of vectors fixed by any open subgroup of GL₂(𝔬ₖ) has finite dimension. The existence of 𝔠(ϱ) is an immediate consequence of this definition.” Casselman asserts existence of a nonzero vector with ϱ(g)v = ε(a)v on some Γ₀(𝔠) (top-left character convention) as immediate from admissibility; the node's last-row K₁(𝔭ⁿ) form needs the contragredient/twist translation it describes. The p. 303 decomposition is printed with lower-left entry dc⁻¹, a misprint for d⁻¹c (the H-conjugate form on the next line gives d⁻¹c).

<a id="R16-2-newvector-conductor"></a>

### `R16.2/newvector-conductor` — The newvector conductor exponent

*Definition* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/newvector-conductor` · declaration `TauCeti.GL2Blueprint.conductorExponent` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`

For irreducible admissible infinite-dimensional π of GL₂(F), c(π) is the least n≥0 for which π^{K₁(pⁿ)} is nonzero. Define the ideal conductor p^{c(π)}. The same least-level construction is available for an existing representation with an explicit nonempty level set. Existence for the stated π is the preceding newvectorLevelExists theorem, not a field stored in a replacement representation. This is a specialization of fixed vectors, not a new admissibility predicate.

**Hypotheses.**

- π generic, equivalently infinite-dimensional irreducible in characteristic zero; O,p and K₁ fixed.

**Construction.**

1. Restrict the existing representation to K₁(pⁿ) and use Representation.invariants.
2. Apply newvectorLevelExists to make the subset of ℕ nonempty, then take its least member; this does not depend on the subsequent Casselman dimension formula.

**Uses that determine the API.**

- *Casselman Theorem 1*: Supplies the unique primitive fixed line.
- *R16.3 and R16.6*: Compares the Artin conductor and the global primitive level.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.conductor_min` | characterisation | π^{K₁(p^{c(π)})}≠0 and π^{K₁(pⁿ)}=0 for n<c(π). |
| `TauCeti.GL2Blueprint.conductor_iso` | functoriality | Isomorphic local representations have equal conductor exponent. |
| `TauCeti.GL2Blueprint.conductor_unramified_twist` | compatibility | An unramified χ has c(π⊗χdet)=c(π), since χdet is trivial on GL₂(O). |

**Unit tests.**

- `TauCeti.GL2Blueprint.conductor_unramified` (computation): An irreducible unramified generic principal series has conductor zero.
- `TauCeti.GL2Blueprint.conductor_steinberg` (computation): An unramified Steinberg twist has conductor one.
- `TauCeti.GL2Blueprint.conductor_ramified_steinberg` (non-example): For χ of conductor a≥2, c(St⊗χdet)=2a≠1+a. At a=1 both formulas give2, so that case alone would not detect the incorrect rule.

**Acceptance.**

- Compare to the epsilon exponent with additive character conductor O.

**Prerequisites.** [`R16.1/k1`](#R16-1-k1), [`R16.2/local-classification`](#R16-2-local-classification), `mathlib:Representation`, `mathlib:Representation.invariants`, `SmoothRepresentationsOfLocalGroups:SR.3`, [`R16.2/newvector-level-exists`](#R16-2-newvector-level-exists).

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), Theorem 1 p. 302 and epsilon remark p. 307. Excerpt: “conductor”. Match: The passage supplies the the newvector conductor exponent input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 302 = PDF p. 3 (Remark: printed pp. 306–307 = PDF pp. 7–8); transcribed from the page image; supporting): “Let 𝔠(ϱ) be the largest ideal of 𝔬ₖ such that the space of all vectors v with ϱ(a b; c d)v = ε(a)v for all (a b; c d) ∈ Γ₀(𝔠(ϱ)) (1.1) is not empty. Then this space has dimension one. (As we shall see, the ideal 𝔠(ϱ) may reasonably be called the conductor of ϱ.)” Theorem 1 defines the conductor as the largest ideal with a nonzero ε(a)-eigenvector for Γ₀ (top-left convention); this is the node's least n with nonzero K₁(𝔭ⁿ)-invariants only after the contragredient/twist translation. The epsilon Remark starts at the foot of p. 306 and its statement 𝔭^δ = 𝔠(ϱ) is on p. 307.

<a id="R16-2-casselman-newvector"></a>

### `R16.2/casselman-newvector` — Casselman’s newvector theorem ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector` · declaration `TauCeti.GL2Blueprint.casselmanNewvector` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint` · planet **Newvector theorem**

For π as above and every n≥0, dimℂ π^{K₁(pⁿ)}=max(0,n−c(π)+1). The minimal fixed space is a line. In the lower-last-row convention it is the ωπ(d)-isotypic line for K₀(p^{c(π)}), with ωπ the central character, when c>0; at c=0 it is the spherical line. With ψ trivial on O but nontrivial on ϖ⁻¹O, Whittaker evaluation W↦W(1) is nonzero on this line. Casselman’s printed top-left central-character convention is transported through the dual/twist convention; it is not silently identified with the lower-last-row subgroup. The theorem has no odd-residue-characteristic restriction.

**Hypotheses.**

- Irreducible admissible infinite-dimensional complex π; ψ of conductor O; n natural.

**Proof outline.**

1. Use the Kirillov proof for supercuspidals (Casselman pp. 302–304).
2. Use B(O) double cosets for principal series and subtract the determinant-character constituent for special representations (pp. 305–306).
3. Apply the Corollary to the Proof for all n and translate the printed character convention; apply SR.5 Whittaker realization for evaluation.

**Acceptance.**

- c=0 gives dimensions 1,2,3 at n=0,1,2; c=1 gives 0,1,2; a one-dimensional character is excluded.

**Prerequisites.** [`R16.2/newvector-conductor`](#R16-2-newvector-conductor), [`R16.2/local-classification`](#R16-2-local-classification), [`R16.1/k0`](#R16-1-k0), [`R16.1/k1`](#R16-1-k1), `SmoothRepresentationsOfLocalGroups:SR.5`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), Theorem 1; Corollary to the Proof pp. 302–307. Excerpt: “dimension”. Match: The passage supplies the casselman’s newvector theorem input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 306 = PDF p. 7 (Theorem 1: printed p. 302 = PDF p. 3); transcribed from the page image; supporting): “Corollary to the Proof. If in condition (1.1) of Theorem 1 we replace 𝔠(ϱ) by an ideal 𝔠(ϱ)·𝔭ⁱ contained in it, then the dimension of the space satisfying the new condition is (i + 1).” The Corollary (p. 306) with Theorem 1 (p. 302) and the maximality of 𝔠(ϱ) gives dimension max(0, n − c + 1) in Casselman's ε(a)-under-Γ₀ convention; the last-row K₁ form, the ωπ(d)-isotypic description and the Whittaker nonvanishing W(1) ≠ 0 are not in the passage.

<a id="R16-2-normalized-newvector"></a>

### `R16.2/normalized-newvector` — The normalized Whittaker newvector

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector` · declaration `TauCeti.GL2Blueprint.normalizedNewvector` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`

For generic irreducible π and the chosen conductor-O ψ, take the unique K₁(p^{c(π)})-fixed vector in SR.5’s Whittaker model with W(1)=1. Equivalently, in the existing fixed line and its Whittaker functional λ, choose the unique v with λ(v)=1. No arbitrary vector is made canonical before fixing ψ and λ. For an unramified determinant twist χ, Wχ(g)=χ(det g)W(g) under the corresponding Whittaker identification.

**Hypotheses.**

- The fixed line is one-dimensional and λ restricts nontrivially; the Whittaker model and functional are supplied by SR.5.

**Construction.**

1. Use the fixed-line theorem, divide a nonzero fixed vector by its nonzero λ-value and prove uniqueness.
2. Transport through the supplier’s Whittaker realization and unramified twist isomorphism.

**Uses that determine the API.**

- *R16.4*: Normalizes the restricted tensor product of Whittaker factors.
- *R16.6*: Identifies q-expansion normalization a₁=1 with local vector normalization.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.normalizedNewvector_fixed` | data | vnew is fixed by K₁(p^{c(π)}). |
| `TauCeti.GL2Blueprint.normalizedNewvector_eval` | simp | λ(vnew)=1. |
| `TauCeti.GL2Blueprint.normalizedNewvector_unique` | universal-property | Every fixed v with λ(v)=1 equals vnew. |
| `TauCeti.GL2Blueprint.normalizedNewvector_twist` | functoriality | An unramified twist identifies Wnew with χ(det g)Wnew(g). |

**Unit tests.**

- `TauCeti.GL2Blueprint.normalizedNewvector_line` (computation): For V=ℂ and λ(z)=2z the normalized vector is 1/2.
- `TauCeti.GL2Blueprint.normalizedNewvector_rescale` (compatibility): Replacing λ by aλ with a≠0 changes vnew to a⁻¹vnew.
- `TauCeti.GL2Blueprint.normalizedNewvector_zero_functional` (non-example): The zero functional admits no vector of value one; it fails the input hypothesis.

**Acceptance.**

- Changing λ to aλ rescales v by a⁻¹; the scalar ambiguity is visible.

**Prerequisites.** [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), `mathlib:Representation.invariants`, `SmoothRepresentationsOfLocalGroups:SR.5`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §11 following Proposition 11.1.1, printed p. 183; normalize the spherical local function at e. Excerpt: “almost”. Match: The passage supplies the the normalized whittaker newvector input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 183 = PDF p. 189; checked against the text layer; specialisation): “For almost all v there is in W (πv , ψv ) a function ϕ0v such that ϕ0v (gv kv ) = ϕ0v (gv ) for all kv in Kv while ϕ0v (e) = 1.” Gives the spherical (conductor-zero) case of the normalised Whittaker vector, fixed by Kv and equal to 1 at e (uniqueness is in Proposition 3.5, printed p. 53); the ramified K1(p^c) newvector, the λ-normalisation and the twist statement of the node are not in JL.

<a id="R16-2-spherical-whittaker-values"></a>

### `R16.2/spherical-whittaker-values` — The spherical Whittaker values

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values` · declaration `TauCeti.GL2Blueprint.sphericalValues` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`

For an unramified generic principal series with unitary-normalized Satake parameters α=χ₁(ϖ), β=χ₂(ϖ), define h₀=1, h₁=α+β and hₘ₊₂=(α+β)hₘ₊₁−αβhₘ. The normalized spherical Whittaker function has W(diag(ϖᵐ,1))=q^{-m/2}hₘ for m≥0 and zero for m<0. This polynomial recurrence includes α=β; the expression (α^{m+1}−β^{m+1})/(α−β) is used only when α≠β.

**Hypotheses.**

- Unramified generic π and ψ conductor O; q the residue cardinality.

**Construction.**

1. Specialize SR.4 Satake and SR.5 Casselman–Shalika to the rank-two diagonal.
2. Use the complete symmetric polynomial recurrence to remove the apparent equal-parameter singularity.

**Uses that determine the API.**

- *R16.5*: Evaluates the unramified local Mellin integral.
- *CG20 §1.3*: Controls the characteristic-zero oldform recurrence.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.sphericalValues_zero` | simp | h₀(α,β)=1. |
| `TauCeti.GL2Blueprint.sphericalValues_recurrence` | relation | hₘ₊₂=(α+β)hₘ₊₁−αβhₘ. |
| `TauCeti.GL2Blueprint.sphericalValues_swap` | compatibility | hₘ(α,β)=hₘ(β,α). |
| `TauCeti.GL2Blueprint.sphericalValues_equal` | characterisation | hₘ(α,α)=(m+1)αᵐ. |

**Unit tests.**

- `TauCeti.GL2Blueprint.sphericalValues_one` (computation): h₁=α+β.
- `TauCeti.GL2Blueprint.sphericalValues_two` (computation): h₂=α²+αβ+β².
- `TauCeti.GL2Blueprint.sphericalValues_collision` (degenerate): h₂(1,1)=3, not an undefined quotient.

**Acceptance.**

- Equal parameters give hₘ=(m+1)αᵐ.

**Prerequisites.** [`R16.2/normalized-newvector`](#R16-2-normalized-newvector), `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroups:SR.5`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §3 spherical functions and unramified zeta calculation. Excerpt: “µ₁”. Match: The passage supplies the the spherical whittaker values input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 53 = PDF p. 59; checked against the text layer; supporting): “If µ1 and µ2 are unramified and OF is the largest ideal of F on which ψ is trivial there is a unique function W0 in W (π, ψ) which is invariant under GL(2, OF ) and assumes the value 1 at the identity.” Proposition 3.5 (printed pp. 52–53) gives the unique normalised spherical W0 and Φ(e,s,W0) = 1, i.e. its Mellin integral equals L(s,µ1)L(s,µ2), and the proof of Lemma 3.11 (printed p. 61) writes W0(diag(a,1)) as an integral over F×; the values q^{-m/2}h_m follow by comparing coefficients but JL never display h_m or the recurrence; the packet locator gives no page.

<a id="R16-2-iwahori-oldforms"></a>

### `R16.2/iwahori-oldforms` — The characteristic-zero Iwahori oldforms

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-oldforms` · declaration `TauCeti.GL2Blueprint.iwahoriOldforms` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`

Let π be an irreducible admissible infinite-dimensional unramified representation of GL₂(F). Then dim π^{K₀(p)}=2 and dim π^{GL₂(O)}=1. With vol(K₀(p))=1, U=[K₀(p)diag(ϖ,1)K₀(p)], the spherical vector v generates the Iwahori fixed space under ℂ[U], even if the Satake parameters coincide. The U polynomial is X²−q^{1/2}(α+β)X+qαβ in this unnormalized double-coset convention. A nontrivial unramified χdet has dimensions 1 and 1, so the printed CG20 condition “not trivial” must be replaced by infinite-dimensional.

**Hypotheses.**

- Complex characteristic zero; π unramified and infinite-dimensional, not just nontrivial.

**Proof outline.**

1. Use Casselman with c=0 and trivial restriction of the central character to O units.
2. Evaluate U in the two oldvector basis using the spherical recurrence; the off-diagonal coefficient ensures cyclicity even at a repeated root.

**Acceptance.**

- Repeated Satake eigenvalues do not imply a semisimple U action; integral doubling is routed to the defect-one roadmap.

**Prerequisites.** [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.2/spherical-whittaker-values`](#R16-2-spherical-whittaker-values), `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Sources.**

- **cg20** (Frank Calegari and David Geraghty, [*Modularity lifting for non-regular symplectic representations*](https://math.uchicago.edu/~fcale/papers/Siegel.pdf)), §1.3 printed pp. 805–806. Excerpt: “not trivial”. Match: The passage supplies the the characteristic-zero iwahori oldforms input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (PDF pp. 5–6, which print running page numbers 5–6 (Duke advance-publication file, pages 1–96, 'final volume, issue, and page numbers to be assigned'); the packet's pp. 805–806 is consistent with the final Duke 169 (2020) no. 5 pagination (final p. = PDF p. + 800); transcribed from the page image; supporting): “Let πₚ be a smooth admissible irreducible unramified representation of GL₂(ℚₚ) (over ℂ) which is not trivial. […] dim πₚ^{Iw} = 2 = 2 · dim πₚ^{Sph} and the characteristic 0 version of doubling is the statement that the span of the spherical vector v under the operator Uₚ is all of πₚ^{Iw}.” The passage is at §1.3, pp. 5–6 of the cited advance-publication PDF (pp. 805–806 only in the final Duke issue pagination, which this file does not print). Transcribed from the page images because the text layer encodes π as a control character and parentheses as '.'/'/'; CG20 remark (no proof) gives dim π^Iw = 2 = 2·dim π^Sph and U_p-cyclicity of the spherical vector for F = ℚp, under the hypothesis 'not trivial', which the node rightly strengthens to infinite-dimensional (an unramified χ∘det has both dimensions 1); the U polynomial and the repeated-root case are not in the passage.

<a id="R16-2-supercuspidal-kirillov"></a>

### `R16.2/supercuspidal-kirillov` — The supercuspidal Kirillov comparison ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov` · declaration `TauCeti.GL2Blueprint.supercuspidalKirillov` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint` · planet **Kirillov model**

For irreducible supercuspidal π with central character ω and nontrivial ψ, restricting the imported Whittaker function W to diag(x,1), x∈F×, identifies its Kirillov realization with C_c^∞(F×,ℂ). For b=(a u;0 d), the action is (π(b)f)(x)=ω(d)ψ(xu/d)f(xa/d). The Weyl action is the supplier local functional equation; it is not a freely chosen transform. For π over a finite extension L/ℚp, DLB’s scalar extension with L∞ and Γ descent is requested from SR.5; locally analytic Kirillov–Colmez theory belongs to R30.

**Hypotheses.**

- Smooth characteristic-zero supercuspidal; additive-character and central-character choices visible.

**Proof outline.**

1. Use JL §2 restriction to the mirabolic and the supercuspidal compact-support characterization.
2. Compute the Borel action by multiplication of n(xu/d) and diag(xa/d,1).
3. Import the gamma-factor Weyl operator and request the coefficient-descent variant for the DLB consumer.

**Acceptance.**

- For a=d the action is ω(d); for u=0,a/d=1 it does not translate the argument.

**Prerequisites.** [`R16.2/local-classification`](#R16-2-local-classification), `SmoothRepresentationsOfLocalGroups:SR.5`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), p. 302, equation (1.2). Excerpt: “Kirillov realization”. Match: The passage supplies the the supercuspidal kirillov comparison input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 302 = PDF p. 3; transcribed from the page image; exact): “First assume ϱ to be absolutely cuspidal. Then associated to any additive character ψ of k is a unique realization (the Kirillov realization) of ϱ on the space 𝔖(k^×) of Schwarz-Bruhat functions on the multiplicative group such that (ϱ(a x; 0 b)f)(α) = ε(b) ψ(αb⁻¹x) f(ab⁻¹α) (1.2)” Equation (1.2) is the node's Borel action ω(d)ψ(xu/d)f(xa/d) for b = (a u; 0 d) on C_c^∞(F^×); the action of w is described on pp. 302–303 through the formal Fourier transform and the factor C(ν,t) from [4], while the Whittaker-restriction construction and the coefficient-descent request are not in the passage.

<a id="R16-2-henniart-unicity"></a>

### `R16.2/henniart-unicity` — Henniart’s unicity of supercuspidal types ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity` · declaration `TauCeti.GL2Blueprint.henniartUnicity` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint` · planet **Unicity of types**

For the inertial class s of an irreducible supercuspidal π of GL₂(F), there is a unique isomorphism class of irreducible GL₂(O)-representation σ typical for s. It occurs with multiplicity one in every π⊗χdet with χ unramified. If σ occurs in an irreducible admissible π′, then π′≅π⊗χdet for an unramified χ. The type carrier and Bernstein inertial equivalence belong to SR.3/ET.6. No uniqueness is asserted for an arbitrary nonminimal K-constituent.

**Hypotheses.**

- Characteristic-zero algebraically closed coefficients; nonarchimedean F, including dyadic fields.

**Proof outline.**

1. Apply Henniart Appendix A.1.5(1) and A.3; transport the unique typical K-type through unramified twists.
2. Use the characterization of the supercuspidal Bernstein component to deduce the DLB minimal-type conclusion.

**Acceptance.**

- An occurrence in π′ determines the inertial class, not the individual unramified twist.

**Prerequisites.** [`R16.2/local-classification`](#R16-2-local-classification), `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Sources.**

- **bm02** (Christophe Breuil, Ariane Mézard; appendix by Guy Henniart, [*Multiplicités modulaires et représentations de GL₂(ℤp) et de Gal(Q̄p/Qp), Appendix: Sur l’unicité des types pour GL₂*](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf)), Appendix A.1.4–A.1.5(1), pp. 75–76; A.3. Excerpt: “unique à isomorphisme près”. Match: The passage supplies the henniart’s unicity of supercuspidal types input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 75 = PDF p. 75 (author manuscript, printed and PDF pages coincide); Definition A.1.4.1 of 'typique' and the description of supercuspidal components are on the same page; checked against the text layer; exact): “1) Si s est une composante supercuspidale, alors il existe une représentation lisse irréductible de K typique pour s, unique à isomorphisme près. C’est un type pour s, et elle intervient avec multiplicité 1 dans tout élément de s.” Henniart A.1.5(1): for a supercuspidal component s (by A.1.3, the unramified twists (η∘det)⊗π) there is a unique typical irreducible K = GL₂(O_F)-representation, it is a type and occurs with multiplicity one in every member; with Definition A.1.4.1(i) this is exactly the node over ℂ for every non-archimedean F, residue characteristic 2 included; the proof is in A.3.

<a id="R16-2-supercuspidal-projective"></a>

### `R16.2/supercuspidal-projective` — Supercuspidals in a fixed central-character category

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-projective` · declaration `TauCeti.GL2Blueprint.supercuspidalProjective` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`

A supercuspidal complex representation of GL₂(F) with fixed smooth central character ω is projective in the abelian category of smooth representations on which the center acts by ω. The DLB application is F=ℚp, ω=1, and characteristic-zero L coefficients with the required scalar extension. This does not assert projectivity in the unrestricted smooth category or in a mod-p category.

**Hypotheses.**

- Fixed central character; characteristic zero; the category is SR.0’s fixed-character subcategory.

**Proof outline.**

1. Use compact-mod-center induction/type description and exactness of invariants of compact open subgroups in characteristic zero.
2. Apply the block decomposition within the fixed-character category; request this general categorical input from SR.0:abelian-category.

**Acceptance.**

- The claimed splitting is valid only inside the specified fixed-central-character category.

**Prerequisites.** [`R16.2/henniart-unicity`](#R16-2-henniart-unicity), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Sources.**

- **dlb17** (Gabriel Dospinescu and Arthur-César Le Bras, [*Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*](https://arxiv.org/pdf/1509.00606v2)), p. 64, footnote 52. Excerpt: “à caractère central trivial”. Match: The passage supplies the supercuspidals in a fixed central-character category input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 64 = PDF p. 64 (arXiv v2, printed and PDF pages coincide), footnote 52; checked against the text layer; supporting): “Le théorème 4.1 dit exactement cela, avec sous-objet remplacé par quotient ; mais cela suffit, puisque π est supercuspidale, donc est un objet projectif de la catégorie des représentations lisses de G à caractère central trivial.” Footnote 52 asserts, without proof, that a supercuspidal π of G = GL₂(ℚp) is projective in the category of smooth representations with trivial central character, i.e. only the special case F = ℚp, ω = 1 of the node; the general-ω statement and its proof come from elsewhere, as the node's proof steps say.

<a id="R16-2-cdt-vexing-type"></a>

### `R16.2/cdt-vexing-type` — The Conrad–Diamond–Taylor vexing type

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type` · declaration `TauCeti.GL2Blueprint.cdtVexingType` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint`

Let x≠ℓ be a vexing prime: x≡−1 mod ℓ, residual local rank-two representation irreducible but its inertia restriction reducible; its conductor c_x=2n. From CDT’s regular character θ of the unramified quadratic extension with conductor xⁿ construct Θ(θ), an existing finite-group representation of GL₂(ℤ/xⁿℤ), and choose a stable O-lattice for a characteristic-zero coefficient field containing its values. The local selector σ_x is Θ(θ) restricted to the exact U_x/V_x used by CDT §5 (U₀(x)/U(xⁿ) in the vexing case), not an arbitrary type on that quotient. The larger GL₂ quotient representation Wσx in CG18 restricts to this selector.

**Hypotheses.**

- x and ℓ distinct primes; regular θ, θ≠θ^Frob; coefficient field contains values; choose an invariant lattice.

**Construction.**

1. Import the finite-group Θ construction from ET.6/SR.3 and its lattice from R01.1.
2. Use CDT §5 definitions to restrict Θ to U₀(x); retain both the full K-type and selector restriction.
3. Use CG18 §3.9.2 to identify its Wσx convention.

**Uses that determine the API.**

- *CG18 §3.9.2*: Cuts out the minimal vexing-prime lifts in the coefficient sheaf.
- *R16.3/CDT multiplicity comparison*: Identifies the selected local factor with its inertia parameter.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.cdtVexingType_restrict` | compatibility | The selector is the restriction of Θ(θ) to U₀(x)/U(xⁿ). |
| `TauCeti.GL2Blueprint.cdtVexingType_lattice` | structure | The chosen O-lattice is stable and scalar extension recovers Θ(θ). |
| `TauCeti.GL2Blueprint.cdtVexingType_unramified` | functoriality | An unramified twist leaves the compact type and its selector unchanged. |

**Unit tests.**

- `TauCeti.GL2Blueprint.cdtVexingType_scalar_extension` (compatibility): The lattice tensored with the coefficient field is isomorphic to Θ(θ).
- `TauCeti.GL2Blueprint.cdtVexingType_distinct_inertia` (non-example): A local representation with inertial characters not θ,θ^Frob has no occurrence of the full Θ(θ) type.
- `TauCeti.GL2Blueprint.cdtVexingType_unramified_twist` (characterisation): π and π⊗ξdet for unramified ξ have equal Θ(θ) occurrence multiplicity.

**Acceptance.**

- The selector detects the minimal inertial lift, not all representations of conductor c_x.

**Prerequisites.** [`R16.2/henniart-unicity`](#R16-2-henniart-unicity), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`.

**Sources.**

- **cg18** (Frank Calegari and David Geraghty, [*Modularity lifting beyond the Taylor–Wiles method*](https://math.uchicago.edu/~fcale/papers/CG.pdf)), §3.9.2 construction Wσx; CDT §5.1 p. 18. Excerpt: “the representation σx”. Match: The passage supplies the the conrad–diamond–taylor vexing type input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (PDF p. 54 (the Springer online-first file prints no page numbers; in Invent. Math. 211 (2018) pp. 297–433 this is p. 350, i.e. journal p. = PDF p. + 296); §3.9.2, first paragraph; checked against the text layer; supporting): “For vexing primes x, let cx denote the conductor of ρ (which is necessarily even). We define a O-representation Wσx of GL2 (Z/x cx /2 Z) to be the representation σx as in Sect. 5 of [15].” The passage is at §3.9.2, first paragraph (PDF p. 54 = Invent. Math. 211 p. 350); the CDT definition of σ_{S,p} that it points to is CDT §5.1 p. 19 (§5.1 only begins on p. 18) and should be a separate cdt99 citation. CG18 §3.9.2 defines Wσx as a representation of GL₂(ℤ/x^{c_x/2}ℤ) equal to CDT's σx ([15] = CDT); the Θ(θ) construction and the restriction to U₀(x)/U(x^{c_x/2}) are only in CDT §5.1, which starts on CDT p. 18 but defines σ_{S,p} on p. 19 and uses U₀(p) only for p ∈ T(ρ) ∩ S (for p ∈ T(ρ) − S it takes all of GL₂(ℤp) with σ = Θ(χp)), so the node's 'U₀(x)/U(xⁿ) in the vexing case' needs that S-qualification; the 'CDT §5.1 p. 18' part of the locator belongs to a cdt99 citation.

<a id="R16-2-iwahori-center"></a>

### `R16.2/iwahori-center` — The GL₂ Iwahori center ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/iwahori-center` · declaration `TauCeti.GL2Blueprint.iwahoriCenter` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint` · planet **Iwahori center**

For the upper Iwahori I and a characteristic-zero coefficient ring in which q and q+1 are invertible, normalize vol(I)=1 and eK=1_K/vol(K). Put U₀=1_{I diag(ϖ,ϖ) I} and U₁=1_{I diag(ϖ,1) I}. The center of H(G,I) is the Laurent polynomial algebra in U₀^{±1} and z₁=U₁+qU₀U₁⁻¹. Multiplication by eK identifies it with the spherical algebra H(G,K), sending U₀ to T₀ and z₁ to T₁, with normalized spherical identity eK. Coefficient extensions used in BCGP invert p and the required idempotent denominators. The rank-independent Bernstein center belongs to SmoothRepresentationsPartIIParahoricCenters; until that proposed roadmap exists, SR.4 supplies the requested contract.

**Hypotheses.**

- q is a unit; eK requires the I-index q+1 to be a unit; U₁ has its usual invertibility in the affine Hecke algebra.

**Proof outline.**

1. Import the Bernstein presentation and HKP §4.6 compatibility.
2. Compute the two symmetric Laurent generators in rank two; keep U₀ inverse in the algebra.
3. Evaluate eK on them, correcting the GSp₄ symbol in BCGP’s second identity.

**Acceptance.**

- The sphere map has unit eK, not 1_I; the central determinant generator is invertible.

**Prerequisites.** [`R16.1/k0`](#R16-1-k0), `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Sources.**

- **bcgp21** (George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf)), Lemma 2.4.15, pp. 178–179; HKP §4.6 (4.6.1). Excerpt: “the centre”. Match: The passage supplies the the gl₂ iwahori center input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 178 = PDF p. 26 (printed = PDF + 152); the identities (1)–(2) and the proof are on printed p. 179 = PDF p. 27; transcribed from the page image; exact): “The centre Z(ℋ_{Iw(v)′}[1/p]) of the Iwahori Hecke algebra is generated by U^{GL₂}_{v,0} and q_v U^{GL₂}_{v,0}(U^{GL₂}_{v,1})^{−1} + U^{GL₂}_{v,1}, the map e^{GL₂}_{Sph} : Z(ℋ_{Iw(v)′}[1/p]) → ℋ_{Sph}[1/p] is an isomorphism” Transcribed from the page image because the text layer scatters the GL₂ superscripts and drops the prime on Iw(v)′ (the opening words 'The centre ... is generated' do match the text layer); Lemma 2.4.15 gives the centre's generators U₀ and q U₀U₁⁻¹ + U₁, the isomorphism onto the spherical algebra, and identities (1) e U₀ = T^{GL₂}_{v,0} and (2) e(qU₀U₁⁻¹ + U₁) = T_{v,1}, where (2) prints the GSp₄ symbol T_{v,1} for T^{GL₂}_{v,1} as the node says; BCGP states 'generated by' (not the Laurent-polynomial presentation), uses the unnormalised e_Sph = [GL₂(O)], and proves it only by citing HKP10 §§1, 2, 4.6.
- **hkp10** (Thomas Haines, Robert Kottwitz and Amritanshu Prasad, [*Iwahori–Hecke algebras*](https://www.math.umd.edu/~tjh/IHA.apr.09.pdf)), §2.3 Lemma 2.3.1; §4.6 equation (4.6.1). Excerpt: “center”. Match: The Bernstein center is the Weyl-invariant Laurent algebra, and h=e_K z identifies its spherical projection. BCGP supplies the concrete rank-two generators in the convention used here.
  - *Assembly note, passage at this locator* (printed p. 12 = PDF p. 12 (author April 2009 version, printed and PDF pages coincide); Lemma 2.3.1 ('The center of H is RW') is on printed p. 10 = PDF p. 10, and eK = 1K/meas(K) is defined in §4.1 on p. 11; checked against the text layer; supporting): “We now have canonical isomorphisms (Satake and Bernstein) HK ≃ RW ≃ Z(H), where Z(H) denotes the center of H. Let h ∈ HK , r ∈ RW , z ∈ Z(H) be elements that correspond to each other under these isomorphisms. We have mh = meK h = rmeK = meK z for all m ∈ M . It follows that (4.6.1) h = eK z,” HKP prove, for a general split group, that the centre of the Iwahori–Hecke algebra is R^W (Lemma 2.3.1, R the Laurent algebra of the coweight lattice) and that the Bernstein and Satake isomorphisms are compatible via h = eK z with the node's idempotent eK = 1K/meas(K); the explicit GL₂ generators U₀^{±1}, z₁ = U₁ + qU₀U₁⁻¹ and their images T₀, T₁ are not in HKP and come from the rank-two computation (BCGP Lemma 2.4.15).

<a id="R16-2-archimedean-classification"></a>

### `R16.2/archimedean-classification` — The explicit archimedean GL₂ cases ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.2/archimedean-classification` · declaration `TauCeti.GL2Blueprint.archimedeanClassification` · proposed module `TauCeti/RepresentationTheory/GL2/R162`, namespace `TauCeti.GL2Blueprint` · planet **Archimedean classification**

Import archimedean Weil groups, Langlands classification and globalizations from the proposed AF.1b owner (requested through current AF.1). For GL₂(ℝ), real reducible parameters χ₁⊕χ₂ correspond to the appropriate Langlands quotient of normalized induction, including its finite-dimensional exceptional quotients. An irreducible parameter Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), integer m≥1, corresponds to D_{m+1}⊗|det|^t, the full O(2) representation whose positive-determinant restriction has holomorphic and antiholomorphic pieces. For m=0 the parameter splits and one obtains the limit boundary; it is not an irreducible Weil parameter. For GL₂(ℂ), every parameter is a pair of continuous quasicharacters and the representation is the corresponding Langlands quotient; GL₂(ℂ) has no discrete series modulo center.

**Hypotheses.**

- Admissible irreducible Harish–Chandra modules with their Casselman–Wallach globalizations; explicit chamber/order in a Langlands quotient.

**Proof outline.**

1. Specialize AF.1b Langlands classification and Wℝ/Wℂ classification to rank two.
2. Compare the lowest SO(2) weights with JL §5 and the complex principal-series coordinates with JL §6.
3. Keep full O(2), connected-group constituents, finite-dimensional quotients and limit cases distinct.

**Acceptance.**

- D₂ has weights ±2,±4,…; a full GL₂(ℝ) holomorphic representation is not just one connected-group constituent.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.1/weil-group-real`, `AutomorphicFormsOnReductiveGroups:AF.1/gl2-real-discrete-series`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §5 Lemmas 5.6–5.7; §6 Lemma 6.1, beginning printed p. 110. Excerpt: “Representations”. Match: JL §5–§6 give the concrete real/complex modules and boundary cases. Modern archimedean Weil parametrization and globalization are imported through the AF.1/AF.1b request, not asserted to be proved by these passages.
  - *Assembly note, passage at this locator* (printed p. 84 = PDF p. 90 (Lemma 5.7 begins printed p. 83 = PDF p. 89; Lemma 6.1 printed p. 110 = PDF p. 116); checked against the text layer; supporting): “(ii) If s − m is an odd integer and s ⩾ 0 the only proper subspaces of B(µ1 , µ2 ) invariant under g are X B1 (µ1 , µ2 ) = Cϕn n⩾s+1 n≡s+1 (mod 2) X B2 (µ1 , µ2 ) = Cϕn n⩽−s−1 n≡s+1 (mod 2) and, when it is different from B(µ1 , µ2 ), Bs (µ1 , µ2 ) = B1 (µ1 , µ2 ) + B2 (µ1 , µ2 ).” Lemma 5.7(ii) ('X' is the text-layer summation sign) gives the two SO(2)-weight pieces B1 (weights ≥ s+1) and B2 (weights ≤ −s−1) whose sum carries σ(µ1,µ2), the holomorphic and antiholomorphic halves of the node's D_{m+1}, and (iii) gives the finite-dimensional piece; Theorem 5.11 (printed pp. 85–86) states the real classification, printed p. 90 identifies each σ(µ1,µ2) with π(ω), and Theorem 6.2(vi) (printed p. 111) shows complex σ(µ1,µ2) ≅ π(ν1,ν2), but JL do not use Weil-group parameters or Langlands-quotient language.

<a id="layer-R16-3"></a>

# Layer R16.3. Local Langlands for GL₂

The local Langlands correspondence for GL₂ is imported from EndoscopicTransferAndUnitaryTraceComparison ET.6. This layer computes it in the coordinates of R16.2, with Art_F(ϖ) = Φ a geometric Frobenius. Principal series go to sums of two characters with N = 0 (`principal-series-parameter`); Steinberg twists go to the rank-two parameter with nonzero monodromy (`steinberg-monodromy`); supercuspidals go to irreducible two-dimensional Weil representations, wild dyadic ones included (`supercuspidal-parameter`).

`tate-unitary-normalization` relates the unitary normalization rec to the Tate normalization recᵀ = rec ⊗ ν_W^{−1/2}. `conductor-epsilon-comparison` proves c(π) = a(rec π) and computes ε under a change of additive character and under twists, and `archimedean-factor-comparison` computes the archimedean factors with Γ_ℝ and Γ_ℂ. The layer ends with the tamely dihedral representations of odd prime order used by Newton–Thorne, which are supercuspidal (`tamely-dihedral`, `tamely-dihedral-supercuspidal`), and with the Conrad–Diamond–Taylor inertial comparison and its multiplicity one (`cdt-inertia-multiplicity`).

**Nodes:** 9. **Planets:** Principal-series parameters, Steinberg monodromy, Local normalization bridge, Archimedean local factors, Tamely dihedral representations, CDT local multiplicity one.

<a id="R16-3-principal-series-parameter"></a>

### `R16.3/principal-series-parameter` — Principal-series parameters and factors ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter` · declaration `TauCeti.GL2Blueprint.principalParameter` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint` · planet **Principal-series parameters**

For F/ℚp finite, with Art_F:F×≃W_Fᵃᵇ the topological Weil-group reciprocity isomorphism normalized by Art_F(ϖ)=Φ geometric and ν(ϖ)=q⁻¹, rec(I(χ₁,χ₂))=(χ₁∘Art_F⁻¹)⊕(χ₂∘Art_F⁻¹), N=0, for an irreducible normalized principal series. Thus det rec=ωπ∘Art_F⁻¹ and L(s,π)=L(s,χ₁)L(s,χ₂). A ramified character contributes 1. At the reducible ratio ν^{±1}, this is the parameter of the one-dimensional Langlands quotient; the generic Steinberg constituent instead has nonzero N as below. The statement uses Frobenius-semisimple Weil–Deligne parameters, not semisimplification that discards N.

**Hypotheses.**

- Characteristic-zero nonarchimedean F; χ₁χ₂⁻¹≠ν^{±1} in the principal-series assertion.
- Art_F⁻¹ is evaluated on the topological Weil abelianization supplied by CFT Layer9, not on the absolute Galois abelianization of Layer7.

**Proof outline.**

1. Apply ET.6 compatibility with normalized induction and AL.1 character factors.
2. Evaluate on Φ using the geometric local Artin map; take determinant and inertia-invariant characteristic polynomial.

**Acceptance.**

- For unramified χᵢ, L(s)=((1−χ₁(ϖ)q⁻ˢ)(1−χ₂(ϖ)q⁻ˢ))⁻¹; no factor is manufactured for a ramified character.

**Prerequisites.** [`R16.2/local-classification`](#R16-2-local-classification), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), §1.2 printed p. 8, ArtK and recK. Excerpt: “Frobenius”. Match: NT §1.2 pins geometric Artin reciprocity and the rec convention. The normalized principal-series parameter calculation is an ET.6 specialization, with its explicit local character factors in JL §3 and AL.1.
  - *Assembly note, passage at this locator* (printed p. 8 = PDF p. 8; checked against the text layer; supporting): “We use the cohomological normalization of class field theory: it is the isomorphism ArtK : K × → WK ab which sends uniformizers to geometric Frobenius elements. When Ω = C, we have the local Langlands correspondence recK for GLn (K)” NT fixes Art_K sending uniformizers to geometric Frobenius and rec_K onto Frobenius-semisimple Weil–Deligne representations, the conventions the node uses; the principal-series formula rec(I(χ₁,χ₂)) = χ₁∘Art⁻¹ ⊕ χ₂∘Art⁻¹, the L-factor and the reducible case are not in NT.

<a id="R16-3-steinberg-monodromy"></a>

### `R16.3/steinberg-monodromy` — Steinberg monodromy and its factors ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy` · declaration `TauCeti.GL2Blueprint.steinbergParameter` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint` · planet **Steinberg monodromy**

For π=St⊗χdet, choose a basis e₁,e₂ of the existing rank-two parameter with Ne₂=e₁, Ne₁=0 and r(Φ)=diag(αq⁻¹ᐟ²,αq¹ᐟ²), α=χ(ϖ). For general w the diagonal characters are χ_Wν_W^{1/2},χ_Wν_W^{−1/2}, so r(w)Nr(w)⁻¹=ν_W(w)N. This gives det r=χ_W², L(s,π)=L(s+1/2,χ), and a(π)=1 when χ is unramified, 2a(χ) otherwise. In particular the invariant kernel of N, not all inertia invariants of r, defines L. An unramified twist preserves N and the conductor.

**Hypotheses.**

- Geometric Frobenius convention; choose the positive real square root of q for unitary normalization.

**Proof outline.**

1. Specialize ET.6 segment correspondence and translate R01.2’s Sp(2) coordinates by reversing the basis and twisting by ν^{-1/2}.
2. Compute r(Φ)N=q⁻¹Nr(Φ) and ker N, then apply the R01.3 conductor formula Sw(r)+dim V−dim(ker N)^I.
3. Use AL.2 compatibility of the representation factors with the parameter.

**Acceptance.**

- N²=0 but N≠0; at χ=1 the parameter has L=(1−q^{−s−1/2})⁻¹ and conductor one.

**Prerequisites.** [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), p. 307 epsilon remark and special-representation calculation. Excerpt: “conductor”. Match: The passage supplies the steinberg monodromy and its factors input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 306 = PDF p. 7; transcribed from the page image; supporting): “we see immediately that the theorem is true with 𝔠 = (conductor of μ)² unless the space we seek is the one which continues to the one-dimensional complement of the special representation.” The passage is at p. 306, paragraph on special representations before the Corollary to the Proof; Remark on ε-factors pp. 306–307. The special-representation calculation is on p. 306, not p. 307: for σ(μα^{1/2}, μα^{−1/2}) the conductor is (conductor of μ)² when μ is ramified and 𝔭 when μ is trivial on 𝔬ₖ^× (next sentences), matching the node's a(π) = 2a(χ) or 1; monodromy N, Frobenius eigenvalues, determinant and L-factor are not in Casselman.

<a id="R16-3-supercuspidal-parameter"></a>

### `R16.3/supercuspidal-parameter` — Supercuspidal parameters including wild cases

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter` · declaration `TauCeti.GL2Blueprint.supercuspidalParameter` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`

rec identifies supercuspidal GL₂(F) representations with irreducible two-dimensional Weil representations, with N=0; determinants, character twists, conductors and L/epsilon factors agree with the existing parameter conventions. Such a parameter has no inertia-fixed vector, hence its standard L-factor is 1. A quadratic induction gives a dihedral example when θ≠θ^σ, but this is not an exhaustive description at dyadic places: primitive wild parameters remain in the ET.6 carrier and use the full Swan conductor. R30’s p-adic Banach correspondence is a separate consumer.

**Hypotheses.**

- All finite extensions of ℚp, including p=2; smooth characteristic-zero correspondence.

**Proof outline.**

1. Import the supercuspidal/irreducible-parameter part of ET.6.
2. An inertia-fixed subspace would be Weil-stable; irreducibility would force trivial inertia and a rank-two irreducible representation of a cyclic quotient, a contradiction.
3. Use parameter compatibility and R01.3, without replacing a wild parameter by a tame quadratic character.

**Acceptance.**

- L(s)=1 for every supercuspidal, but its conductor can be wild and is not fixed at two.

**Prerequisites.** [`R16.2/supercuspidal-kirillov`](#R16-2-supercuspidal-kirillov), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), §2 after Definition 2.4, printed p. 11. Excerpt: “supercuspidal”. Match: The passage supplies the supercuspidal parameters including wild cases input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 11 = PDF p. 11; checked against the text layer; supporting): “Note in particular that if πv is tamely dihedral of order p, then recFv (πv ) is irreducible and hence πv is supercuspidal.” NT uses 'irreducible parameter implies supercuspidal' only for tamely dihedral π_v; the general identification of supercuspidals with irreducible two-dimensional Weil representations, N = 0, L = 1 and the wild dyadic cases are not in the passage.

<a id="R16-3-tate-unitary-normalization"></a>

### `R16.3/tate-unitary-normalization` — The Tate and unitary normalization bridge ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization` · declaration `TauCeti.GL2Blueprint.normalizationBridge` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint` · planet **Local normalization bridge**

For rank two, recᵀ_F(π)=rec_F(π⊗ν^{-1/2})=rec_F(π)⊗ν_W^{-1/2}. At geometric Φ this multiplies Frobenius by q^{1/2}, multiplies determinant by ν_W^{-1}, preserves N and Artin conductor, and shifts standard factors by L(s,recᵀπ)=L(s−1/2,rec π), likewise epsilon factors with fixed ψ and Haar choices. The rank-two Tate normalization therefore has determinant ωπ·ν_W^{-1}, not ωπ. Frobenius inversion in an arithmetic convention must be applied to the entire WD datum, including the relation for N; it is not this half-twist.

**Hypotheses.**

- Fixed rec convention compatible with character Artin reciprocity; nonarchimedean ν_W(Φ)=q⁻¹.

**Proof outline.**

1. Use NT §1.2 definition of recᵀ and ET.6 character-twist compatibility.
2. Compute scalar multiplication on the inertia-fixed kernel of N; invoke AL.2 twist/shift compatibility.
3. Compare the geometric versus arithmetic presentation of R01.2 without discarding monodromy.

**Acceptance.**

- For unramified St the Tate-normalized Frobenius is diag(α,αq), with N e₂=e₁ and determinant α²q.

**Prerequisites.** [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), §1.2 printed p. 8, normalization identity. Excerpt: “normalization”. Match: The passage supplies the the tate and unitary normalization bridge input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 8 = PDF p. 8; checked against the text layer; specialisation): “In general, we have the Tate normalization of the local Langlands correspondence for GLn as described in [CT14, §2.1]. When Ω = C, we have recTK (π) = recK (π ⊗ | · |(1−n)/2 ).” At n = 2 NT's identity rec^T_K(π) = rec_K(π ⊗ |·|^{(1−n)/2}) is the node's rec^T(π) = rec(π ⊗ ν^{−1/2}); the effects on Frobenius, determinant, N, conductor and L/ε factors are derivations not stated in NT.

<a id="R16-3-conductor-epsilon-comparison"></a>

### `R16.3/conductor-epsilon-comparison` — Conductor, twists and additive-character change

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison` · declaration `TauCeti.GL2Blueprint.conductorEpsilon` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`

For every generic irreducible π, c(π)=a(rec π), with the same value for recᵀ. With ψ of conductor O and self-dual additive measure, ε(s,π,ψ)=ε(1/2,π,ψ)q^{-c(π)(s−1/2)}. For ψ_a(x)=ψ(ax), ε(s,π,ψ_a)=ωπ(a)|a|^{2s−1}ε(s,π,ψ); the measure is changed to the corresponding self-dual one. An unramified twist by ν^t replaces s by s+t and leaves c unchanged. For a ramified χ, one uses the full tensor-parameter conductor; c(π⊗χdet) is not generally c(π)+2a(χ).

**Hypotheses.**

- Use normalized AL.2 epsilon factors, not an unnormalized Fourier measure; π generic and characteristic zero.

**Proof outline.**

1. Compare Casselman’s minimal congruence level with the epsilon exponent, using ET.6 factor compatibility.
2. Specialize AL.1/AL.2 additive-character and tensor-twist formulas to dimension two.
3. Check principal, special and supercuspidal parameters using the kernel-of-N conductor.

**Acceptance.**

- Ramified St⊗χ has conductor 2a(χ), whereas its untwisted conductor is one; this refutes the naive additive rule.

**Prerequisites.** [`R16.2/newvector-conductor`](#R16-2-newvector-conductor), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization), `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), p. 307 remark following the Corollary to the Proof. Excerpt: “conductor”. Match: The passage supplies the conductor, twists and additive-character change input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 307 = PDF p. 8; transcribed from the page image; supporting): “On p. 76 of [4] is defined a factor ε(s, ϱ, ψ) associated to ϱ and each additive character ψ. As a function of s, this factor will have the form ε(ϱ, ψ)·N𝔭^{(2c(ψ)−δ)s} where ε(ϱ, ψ) is independent of s and c(ψ) is the exponent of the conductor of ψ. The ideal 𝔭^δ is the same as our 𝔠(ϱ).” The Remark (starting at the foot of p. 306) identifies the ε-factor exponent with Casselman's conductor, proof only sketched; with c(ψ) = 0 it gives the node's ε(s) = ε(1/2)q^{−c(s−1/2)}, but c(π) = a(rec π), the ψ_a change, the twist statements and the measure normalization are not in the passage.

<a id="R16-3-archimedean-factor-comparison"></a>

### `R16.3/archimedean-factor-comparison` — The archimedean GL₂ factors ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison` · declaration `TauCeti.GL2Blueprint.archimedeanFactors` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint` · planet **Archimedean local factors**

Use Γℝ(s)=π^{−s/2}Γ(s/2), Γℂ(s)=2(2π)^{−s}Γ(s). For a real character sign^ε|·|^u the factor is Γℝ(s+u+ε). For Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}), m≥1, the factor is Γℂ(s+t+m/2); thus L(s,D_k)=Γℂ(s+(k−1)/2) for k≥2. At m=0 its split parameter has Γℝ(s+t)Γℝ(s+t+1)=Γℂ(s+t), without making it an irreducible Weil representation. Over ℂ, a character (z/|z|)^m|z|^{2t} has Γℂ(s+t+|m|/2), and the rank-two factor is the product. With ψℝ(x)=exp(2πix), the real-character epsilon is i^ε and the induced epsilon is i^{m+1}; complex places use ψℂ=ψℝ∘Trℂ/ℝ and AL.1’s convention.

**Hypotheses.**

- Archimedean local reciprocity, absolute value |z|ℂ=|z|², gamma and additive-character conventions fixed.

**Proof outline.**

1. Import AF.1b archimedean LLC and AL.1 archimedean character factors via the current AF.1 request.
2. Decompose the Weil parameter into its real one-dimensional or induced two-dimensional summands.
3. Apply the gamma duplication formula for the m=0 boundary and compare D_k lowest weights.

**Acceptance.**

- D₂ contributes Γℂ(s+1/2); the complex angular exponent is absolute-valued.

**Prerequisites.** [`R16.2/archimedean-classification`](#R16-2-archimedean-classification), `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §5 printed pp. 96–97, explicit character L/epsilon formulas and induced-real factor. Excerpt: “Γ”. Match: JL pp. 96–97 state the real/complex character factors and the real induced factor. The modern parameter classification is a separate AF.1b input; AL.1 fixes the gamma/epsilon conventions.
  - *Assembly note, passage at this locator* (printed p. 96 = PDF p. 102 (continues printed p. 97 = PDF p. 103); checked against the text layer; exact): “If F = C and ω(x) = |x|rC xm xn where m and n are non-negative integers, one of which is 0, then L(s, ω) = 2(2π)−(s+r+m+n) Γ(s + r + m + n).” The same page gives the real character factor π^{-(s+r+m)/2}Γ((s+r+m)/2) with ε = (i sgn u)^m|u|^{s+r−1/2} and the complex ε = i^{m+n}ω(w)|w|^{s−1/2}, and printed p. 97 sets L(s,π(ω)) = L(s,ω), ε(s,π(ω),ψR) = λ(C/R,ψR)ε(s,ω,ψC/R); these are the node's Γℝ/Γℂ formulas in JL's parametrisation ω(x) = |x|_C^r x^m x̄^n (the bar on x̄ is lost in the text layer), so the node's (z/|z|)^m|z|^{2t} corresponds to r = t − m/2.

<a id="R16-3-tamely-dihedral"></a>

### `R16.3/tamely-dihedral` — Tamely dihedral representations of prime order ★

*Definition* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral` · declaration `TauCeti.GL2Blueprint.tamelyDihedral` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint` · planet **Tamely dihedral representations**

For odd prime ℓ with q≡−1 mod ℓ, an irreducible admissible π is tamely dihedral of order ℓ precisely when rec π=(Ind_{W_{F′}}^{W_F}θ,0), where F′/F is unramified quadratic and θ|I has exact order ℓ. Use the supplier’s induced Weil representation and class of π; no second automorphic or WD carrier is defined. The induction direction corrects the reversed indices in NT Definition 2.4. Since ℓ is prime to the residue characteristic, the inertia character is tame.

**Hypotheses.**

- ℓ odd prime, q residue cardinality and q≡−1 mod ℓ; θ continuous with open kernel on inertia.

**Construction.**

1. Express the property on ET.6’s isomorphism classes using its existing induction functor.
2. Conjugation by a lift of Frobenius raises the tame inertia character to q, hence θ^σ|I=θ^{-1}|I≠θ|I.
3. Reduce the index-two irreducibility calculation to the finite inertia quotient, keeping the unramified character twist; the finite-group baseline alone does not identify the full Weil representation.

**Uses that determine the API.**

- *NT §2 Definition 2.4*: Supplies explicitly forced supercuspidal local components.
- *NT residual-image applications*: Keeps the prime order of tame inertia visible for the separate large-image theorem.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.tamelyDihedral_parameter` | characterisation | Membership is equivalent to the stated induced parameter with exact inertia order ℓ and N=0. |
| `TauCeti.GL2Blueprint.tamelyDihedral_unramified_twist` | functoriality | An unramified determinant twist preserves tamely-dihedral order ℓ. |
| `TauCeti.GL2Blueprint.tamelyDihedral_conjugate` | compatibility | Replacing θ by θ^σ gives the same induced parameter. |

**Unit tests.**

- `TauCeti.GL2Blueprint.tamelyDihedral_order_three` (computation): At q=2, ℓ=3, an inertia character of order three satisfies θ^q=θ^{-1}≠θ.
- `TauCeti.GL2Blueprint.tamelyDihedral_order_two_excluded` (non-example): ℓ=2 fails oddness and θ^{-1}=θ for order-two inertia, so this irreducibility argument fails.
- `TauCeti.GL2Blueprint.tamelyDihedral_unramified_character` (non-example): An unramified θ has inertia order one and is not tamely dihedral of order ℓ>2.

**Acceptance.**

- The definition fixes the exact order, not just an order divisible by ℓ.

**Prerequisites.** [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), Definition 2.4 and following paragraph, printed p. 11. Excerpt: “dihedral”. Match: Definition 2.4 gives the exact prime-order inertia and unramified quadratic induction property. Its induction indices are corrected as recorded in E12.
  - *Assembly note, passage at this locator* (printed p. 11 = PDF p. 11; checked against the text layer; exact): “Let F be a number field, let v be a finite place of F , and let p be an odd prime such that qv ≡ −1 mod p. We say that an irreducible admissible C[GL2 (Fv )]-representation πv is tamely dihedral of order p” Definition 2.4 (prime p in place of ℓ) is printed rec_{F_v}(π_v) ≅ Ind^{W_{F'_v}}_{W_{F_v}} χ_v with χ_v : W_{F'_v} → C^× and χ_v|_{I_{F'_v}} of order p, so the induction indices are reversed as the node says; the text layer scrambles this formula, so the excerpt stops before it.

<a id="R16-3-tamely-dihedral-supercuspidal"></a>

### `R16.3/tamely-dihedral-supercuspidal` — The tamely dihedral supercuspidality consequence

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral-supercuspidal` · declaration `TauCeti.GL2Blueprint.tamelyDihedralSupercuspidal` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint`

Every tamely dihedral π of odd prime order ℓ is supercuspidal. Its parameter is irreducible, has N=0 and Swan conductor zero; since inertia has no fixed vector, a(rec π)=2 and L(s,π)=1. The exact-order argument works also at residue characteristic two, because ℓ is odd and prime to q.

**Hypotheses.**

- The complete hypotheses of tamelyDihedral, including q≡−1 mod ℓ.

**Proof outline.**

1. Use θ^σ|I=θ^{-1}|I≠θ|I to prove irreducibility of the index-two induction.
2. Apply supercuspidalParameter and the R01.3 conductor formula; tame inertia removes Swan.

**Acceptance.**

- q=2, ℓ=3 is included; nothing here treats all dyadic supercuspidals as dihedral.

**Prerequisites.** [`R16.3/tamely-dihedral`](#R16-3-tamely-dihedral), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), Paragraph immediately after Definition 2.4. Excerpt: “irreducible”. Match: The following paragraph proves supercuspidality from irreducibility. The conductor-two/L=1 calculation is a stated application of the imported tame parameter conductor formula.
  - *Assembly note, passage at this locator* (printed p. 11 = PDF p. 11; checked against the text layer; exact): “Note in particular that if πv is tamely dihedral of order p, then recFv (πv ) is irreducible and hence πv is supercuspidal.” NT states, without further argument, that the parameter is irreducible and hence π_v is supercuspidal; the N = 0, Swan-zero, a(rec π) = 2 and L = 1 consequences are the node's own calculation and are not in NT.

<a id="R16-3-cdt-inertia-multiplicity"></a>

### `R16.3/cdt-inertia-multiplicity` — The CDT inertial comparison and multiplicity one ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity` · declaration `TauCeti.GL2Blueprint.cdtInertiaMultiplicity` · proposed module `TauCeti/RepresentationTheory/GL2/R163`, namespace `TauCeti.GL2Blueprint` · planet **CDT local multiplicity one**

For CDT’s regular θ of conductor xⁿ, write Θ(θ) for its full GL₂(ℤ/xⁿℤ) type. For infinite-dimensional irreducible admissible Π of GL₂(ℚx), Hom_K(Θ(θ),Π^{U(xⁿ)})≠0 iff rec Π|I≅θ∘η_{x²} ⊕ θ∘Frob∘η_{x²} in CDT’s reciprocity convention. In that case Π^{U(xⁿ)}≅Θ(θ) and the type multiplicity is one. Translate the Artin convention to R16.3. This comparison concerns the full K-type; its U₀(x) restriction used as a vexing selector can identify more than one finite-character twist. The special case in CDT’s surrounding discussion is translated with N retained, not as an N=0 parameter.

**Hypotheses.**

- x≠ℓ; regular θ and coefficient field containing its values; principal congruence U(xⁿ), full compact type.
- Use CFT Layer9 Weil reciprocity for ℚx and its unramified quadratic extension; Layer7 supplies the compatible absolute/finite-quotient map, not an inverse on all of G_Fᵃᵇ.

**Proof outline.**

1. Apply CDT Lemma 4.2.4(3) in both directions and compare the inertial characters through the local Artin map.
2. Use the irreducibility of Θ to turn the displayed full fixed-space identification into Hom multiplicity one.
3. Restrict to the selector only after retaining the full-type statement; keep the nilpotent operator in any surrounding Steinberg comparison.

**Acceptance.**

- A different inertial pair has multiplicity zero for the full type; an unramified twist has multiplicity one.

**Prerequisites.** [`R16.2/cdt-vexing-type`](#R16-2-cdt-vexing-type), [`R16.2/henniart-unicity`](#R16-2-henniart-unicity), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Sources.**

- **cdt99** (Brian Conrad, Fred Diamond and Richard Taylor, [*Modularity of certain potentially Barsotti–Tate Galois representations*](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf)), Lemma 4.2.4(3), printed pp. 17–18. Excerpt: “Conversely”. Match: The passage supplies the the cdt inertial comparison and multiplicity one input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 18 = PDF p. 18 (author manuscript, printed and PDF pages coincide); U(pⁿ) is defined in §4.2 on printed p. 17 = PDF p. 17; transcribed from the page image; exact): “(3) Suppose that χ : A^× = W(F_{p²})^× → Q̄^× is as in §3.2 with conductor pⁿA. If ⟨Θ(χ), Π^{U(pⁿ)}⟩_{GL₂(Z/pⁿZ)} ≠ 0, then WD(Π)|_{I_p} ≅ (χ∘η_{p,2})⊕(χ∘Frob_p∘η_{p,2}). Conversely if WD(Π)|_{I_p} ≅ (χ∘η_{p,2})⊕(χ∘Frob_p∘η_{p,2}), then Π^{U(pⁿ)} ≅ Θ(χ).” Transcribed from the page image because the text layer splits the superscripts and renders ≠ as '6=' and the pairing brackets as 'h i'; Lemma 4.2.4(3) gives both directions of the node's equivalence for the irreducible admissible infinite-dimensional Π of §4.1 and the conclusion Π^{U(pⁿ)} ≅ Θ(χ) (hence multiplicity one, Θ(χ) being irreducible), in CDT's WD/reciprocity convention; CDT gives no proof, citing [24, §3], and the lemma itself sits entirely on p. 18.

<a id="layer-R16-4"></a>

# Layer R16.4. Global cuspidal decomposition and multiplicity

Global theory over a number field F. The cuspidal spectrum with a unitary central character is a discrete sum with finite multiplicities, and each constituent factors as a restricted tensor product (`cuspidal-tensor-factorization`, from AutomorphicSpectralTheory AS.4 and AF.2). The Whittaker expansion φ(g) = Σ_{a∈F×} W_φ(diag(a,1)g) comes first (`global-whittaker-expansion`, specialising AutomorphicLFunctionsAndLocalFactors AL.3) and gives multiplicity one (`global-multiplicity-one`).

`strong-multiplicity-one` assumes isomorphic components at all finite places outside a finite set and concludes a global isomorphism, at the infinite places too. `cohomological-rationality` specialises AF.4's rationality field and Clozel's rational models to cohomological GL₂ representations, in the algebraic normalization π_alg = π ⊗ |det|^{−(k−2)/2}. `non-cm-self-twists` defines the non-CM condition: π ⊗ χ∘det ≅ π only for χ = 1.

**Nodes:** 6. **Planets:** Cuspidal tensor factorization, Global Whittaker expansion, Global multiplicity one, Strong multiplicity one, Cohomological rationality, Non-CM self-twists.

<a id="R16-4-cuspidal-tensor-factorization"></a>

### `R16.4/cuspidal-tensor-factorization` — The cuspidal restricted tensor factorization ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization` · declaration `TauCeti.GL2Blueprint.cuspidalTensor` · proposed module `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint` · planet **Cuspidal tensor factorization**

For unitary central character ω trivial on F×, the smooth K∞-finite cuspidal spectrum in AA.2’s L² space is AS.4’s algebraic Hilbert-direct-sum decomposition with finite multiplicities. Every irreducible constituent has the AF.2 restricted tensor factorization ⊗′vπv, with spherical distinguished vectors at almost all finite v. Identify this algebraic factorization with the corresponding smooth vectors of its Hilbert completion and with the Whittaker tensor model. Multiplicity one is proved below; it is not assumed in this comparison. Nonunitary cuspidal representations are handled after an explicitly recorded norm twist.

**Hypotheses.**

- F number field; central character unitary for L²; admissible local factors and AF.2 distinguished-vector data.

**Proof outline.**

1. Apply AS.4 cuspidal discreteness/admissibility and AF.2 restricted tensor product.
2. Use local Whittaker uniqueness to compare tensor factors; keep the algebraic colimit and Hilbert completion distinct.

**Acceptance.**

- Changing finitely many spherical vector normalizations gives the canonical restricted tensor isomorphism, not a new automorphic class.

**Prerequisites.** [`R16.1/finite-level-comparison`](#R16-1-finite-level-comparison), [`R16.2/normalized-newvector`](#R16-2-normalized-newvector), `AutomorphicFormsOnReductiveGroups:AF.2/restricted-tensor-product`, `AutomorphicSpectralTheory:AS.4`, `AdelicAlgebraicGroups:AA.2/central-character-l2`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §11 product formula (11.1.2), printed p. 183. Excerpt: “spanned”. Match: The passage supplies the the cuspidal restricted tensor factorization input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 183 = PDF p. 189; checked against the text layer; supporting): “The space W (π, ψ) is spanned by functions of the form (11.1.2) Y ϕ1 (g) = ϕv (gv ) v where ϕv is in W (πv , ψv ) for all v and equal to ϕ0v for almost all v.” Formula (11.1.2) ('Y' is the text-layer product sign) states that the global Whittaker space of π = ⊗πv is spanned by factorisable products with the spherical ϕ0v at almost all v; the decomposition of A0(η) into irreducibles is used on printed p. 182 and the restricted tensor product π = ⊗πv is taken from §9, so the Hilbert-direct-sum discreteness with finite multiplicities and the colimit/completion comparison of the node are not proved here.

<a id="R16-4-global-whittaker-expansion"></a>

### `R16.4/global-whittaker-expansion` — The global GL₂ Whittaker expansion ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion` · declaration `TauCeti.GL2Blueprint.globalWhittakerExpansion` · proposed module `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint` · planet **Global Whittaker expansion**

Fix nontrivial ψ:F\𝔸→ℂ× and additive Haar mass vol(F\𝔸)=1. For a smooth K∞-finite cuspidal φ, Wφ(g)=∫_{F\𝔸}φ(n(x)g)ψ(−x)dx and φ(g)=Σ_{a∈F×}Wφ(diag(a,1)g), with the convergence appropriate to smooth cusp forms, locally uniform after the stated differentiability/growth estimates. The coefficient map is injective and equivariant. Specialize AL.3’s general GLn Fourier–Whittaker expansion; the GL₂ unipotent has a single additive coordinate. This declaration is in R16.4, upstream of both multiplicity and the integral comparison.

**Hypotheses.**

- Cuspidality supplies zero constant term; smooth automorphic form with supplier growth estimates; global ψ and compatible self-dual local measures.

**Proof outline.**

1. Apply AL.0 adelic Fourier theory on the compact additive quotient.
2. Cuspidality removes the zero coefficient; conjugation by diag(a,1) identifies the remaining coefficients.
3. Use AL.3 convergence/injectivity theorem and local uniqueness SR.5 for factorization.

**Acceptance.**

- If Wφ=0, then φ=0; the constant term cannot be retained for a cusp form.

**Prerequisites.** [`R16.4/cuspidal-tensor-factorization`](#R16-4-cuspidal-tensor-factorization), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `SmoothRepresentationsOfLocalGroups:SR.5`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), Proposition 11.1.1 proof, printed pp. 182–183. Excerpt: “Fourier”. Match: The passage supplies the the global gl₂ whittaker expansion input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 182 = PDF p. 188; checked against the text layer; supporting): “Since ϕg is continuous it is determined by its Fourier series.” On printed p. 182 JL expand ϕ(n(x)g) in its Fourier series, note the constant term is 0 because ϕ is a cusp form, define ϕ1 with ψ(−x), and obtain ϕ(g) = Σ_{α∈F×} ϕ1(diag(α,1)g) 'formally at least' with ϕ1 ≠ 0 unless ϕ = 0; the absolute and locally uniform convergence the node asserts is proved in Lemma 11.4(i), printed p. 193 (announced on printed p. 191), outside the cited pages.

<a id="R16-4-global-multiplicity-one"></a>

### `R16.4/global-multiplicity-one` — GL₂ global multiplicity one ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one` · declaration `TauCeti.GL2Blueprint.globalMultiplicityOne` · proposed module `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint` · planet **Global multiplicity one**

Every irreducible cuspidal automorphic GL₂(𝔸F) representation occurs with multiplicity one in the smooth cuspidal spectrum with its central character. The Whittaker coefficient identifies its realization with the restricted tensor product of the local Whittaker models, uniquely once ψ and almost-all spherical normalizations are fixed. Equivalently, two equivariant embeddings of the same irreducible representation into the cusp space are scalar multiples.

**Hypotheses.**

- Number field F; characteristic-zero automorphic forms; unitary twist when working inside L².

**Proof outline.**

1. Use injectivity of globalWhittakerExpansion.
2. Apply SR.5 local Whittaker uniqueness and the restricted tensor factorization to bound the dimension of the global Whittaker functional by one.
3. Transport this bound through the coefficient map to automorphic multiplicity.

**Acceptance.**

- Two copies of the same cuspidal local tensor cannot give a two-dimensional automorphic multiplicity space.

**Prerequisites.** [`R16.4/global-whittaker-expansion`](#R16-4-global-whittaker-expansion), [`R16.4/cuspidal-tensor-factorization`](#R16-4-cuspidal-tensor-factorization), `SmoothRepresentationsOfLocalGroups:SR.5`, `AutomorphicSpectralTheory:AS.4`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), Proposition 11.1.1, printed p. 183. Excerpt: “multiplicity one”. Match: The passage supplies the gl₂ global multiplicity one input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 183 = PDF p. 189; checked against the text layer; exact): “Proposition 11.1.1. If an irreducible representation of H is contained in A0 (η) it is contained with multiplicity one.” This is the node's multiplicity-one statement for cusp forms with central character η; its proof on printed p. 182 shows the Whittaker image U1 equals W(π,ψ), so the realisation is determined by π and ψ, matching the node's Whittaker-coefficient identification.

<a id="R16-4-strong-multiplicity-one"></a>

### `R16.4/strong-multiplicity-one` — GL₂ strong multiplicity one ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one` · declaration `TauCeti.GL2Blueprint.strongMultiplicityOne` · proposed module `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint` · planet **Strong multiplicity one**

Let π,π′ be cuspidal automorphic representations of GL₂(𝔸F). If there is a finite set S of finite places containing their ramification and πv≅π′v for every finite v outside S, then π≅π′ globally, including every v in S and every infinite place. Equality at a density-one subset is not substituted for this cofinite condition. At an unramified place, equality means the unordered Satake pair, equivalently both standard Hecke trace and determinant data, not a single incomplete eigenvalue without central character.

**Hypotheses.**

- Cuspidal GL₂ over a number field; isomorphism at all finite places outside one finite set.

**Proof outline.**

1. Apply AL.3’s Rankin–Selberg pole criterion: L(s,π×π̃) has a simple pole at one, while the corresponding mixed factor has one only for π≅π′.
2. Cancel equal cofinite Euler factors; import nonvanishing and absence of poles at s=1 for every omitted finite AND archimedean Rankin–Selberg factor, as in Cogdell Theorem9.3. Infinite-place equality is a conclusion, not an input.
3. Compare the classical fixed-level baseline after the AF.5 dictionary; Casselman Theorem 2 supplies a parallel local-converse proof when the infinite-place factors are already identified.

**Acceptance.**

- The theorem recovers the infinite-place factors; the pinned classical theorem alone does not prove this number-field statement.

**Prerequisites.** [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`.

**Sources.**

- **cogdell-fields** (James W. Cogdell, [*Lectures on L-functions, converse theorems, and functoriality for GL(n)*](https://people.math.osu.edu/cogdell.1/fields-www.pdf)), Theorem9.3 and proof, printed pp.74–75 (PDF pp.78–79). Excerpt: “Strong Multiplicity One”. Match: The finite exceptional set may contain all archimedean places. The Rankin–Selberg pole criterion together with zero/pole-free omitted local factors recovers the whole cuspidal representation from cofinite finite-place agreement. Casselman supplies only the weaker parallel statement assuming the archimedean factors already agree.
  - *Assembly note, passage at this locator* (printed p. 74 = PDF p. 78 (PDF = printed + 4); the proof continues on printed p. 75 = PDF p. 79; checked against the text layer; specialisation): “Theorem 9.3 (Strong Multiplicity One) Let (π1 , Vπ1 ) and (π2 , Vπ2 ) be two cuspidal representations of GLn (A). Decompose them as π1 ≃ ⊗′ π1,v and π1 ≃ ⊗′ π2,v . Suppose that there is a finite set of places S such that π1,v ≃ π2,v for all v ∈ / S. Then (π1 , Vπ1 ) = (π2 , Vπ2 ).” Cogdell's Theorem 9.3 is strong multiplicity one for cuspidal representations of GLn(A) with S any finite set of places (archimedean ones allowed), so the node is its n = 2 case; the proof on pp. 74–75 is the Rankin–Selberg pole argument with the omitted finite (P_v(q^{-s})^{-1}) and archimedean (Γ-factor) local factors shown zero- and pole-free in Re(s) ≥ 1; '∈ /' is the text layer's rendering of ∉, and the source's second 'π1 ≃ ⊗′ π2,v' is a misprint for π2.
- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), §2 Theorem 2 and proof, printed pp. 307–308. Excerpt: “Theorem 2”. Match: Casselman Theorem 2 proves the fixed-classical comparison using all twists and local converse. The statement recovering arbitrary infinite-place factors from cofinite finite-place data uses the explicitly requested AL.3 Rankin–Selberg pole criterion, not the pinned classical theorem alone.
  - *Assembly note, passage at this locator* (printed p. 307 = PDF p. 8 (proof continues on printed p. 308 = PDF p. 9); transcribed from the page image; supporting): “Theorem 2. Suppose ϱ = ⊗̂ϱ_v and σ = ⊗̂σ_v are two representations of ℋ_A occurring in 𝒜 and assume there exists a finite set S of finite valuations of k such that ϱ_v = σ_v for all v ∉ S. Then this holds for all v ∈ S as well, and ϱ = σ.” Since S contains only finite valuations, Theorem 2 assumes agreement at every infinite place and is weaker than the node, which derives the infinite-place agreement; the proof uses the local converse criterion (2.11) of [4] and the global functional equation, over any global field k.

<a id="R16-4-cohomological-rationality"></a>

### `R16.4/cohomological-rationality` — Cohomological rationality and coefficient fields ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality` · declaration `TauCeti.GL2Blueprint.cohomologicalRationality` · proposed module `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint` · planet **Cohomological rationality**

For regular algebraic cuspidal GL₂ representations, import AF.4’s rationality field Q(π), the fixed field of automorphisms preserving the finite-part isomorphism class, and Clozel’s finite-part Q(π)-model. Specialize its semilinear Galois conjugation to the GL₂ Hecke operators and algebraic infinitesimal character. For a holomorphic newform f of weight k≥2 over ℚ, make this comparison for π_alg=π_f⊗|det|^{−(k−2)/2}, where π_f is unitary: the unnormalized spherical T₁ eigenvalue is a_p and T₀ eigenvalue is χ(p)p^{k−2}. Then Q(π_alg) is the field generated by the normalized newform coefficients and compatible nebentypus values. A claim about the field generated by raw unitary Satake roots is not this rationality theorem. Neither periods nor an integral lattice are canonical. Étale/cohomological rationality and Galois realization required by R19 belong to that geometric owner.

**Hypotheses.**

- Regular algebraic cuspidal π; distinguish field of rationality from a field of definition before invoking AF.4.
- Use the algebraic determinant twist just displayed in the holomorphic comparison; regular algebraicity is not inferred from arbitrary unitary normalization.

**Proof outline.**

1. Use AF.4/rationality-field and AF.4/clozel-rationality.
2. Apply strongMultiplicityOne to compare Galois-conjugate finite Hecke systems, with the algebraic normalization of eigenvalues.
3. Use upstream ModularForms Layer 8 and 8g for the coefficient-field description; export the comparison to R19 without replanning its geometry.
4. Compute T₁=√p(α+β) and T₀=αβ, apply the twist p^{(k−2)/2}, and compare the upstream primitive coefficient field. Use strong multiplicity one to identify the field from cofinite eigenvalues.

**Acceptance.**

- An arbitrary noncohomological cusp representation is not asserted to have a number-field model.

**Prerequisites.** [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one), `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), §1.2 printed pp. 8–9, regular algebraic weights and conjugation. Excerpt: “algebraic”. Match: The passage supplies the cohomological rationality and coefficient fields input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 8 = PDF p. 8; checked against the text layer; supporting): “If F is a totally real or CM number field and π is an automorphic representation of GLn (AF ), we say that π is regular algebraic if π∞ has the same infinitesimal character as an irreducible algebraic representation W of (ResF/Q GLn )C .” The passage is at §1.2, printed p. 8 (regular algebraic, weight λ); Aut(C)-conjugation σΠ appears only in the proof of Lemma 2.1 (§2, printed p. 9) and in Lemma 5.2 (printed p. 38). NT only defines regular algebraic and weight λ (and notes on p. 9 that cuspidal regular algebraic GL₂ representations are RAESDC); it says nothing about the rationality field Q(π), Clozel's rational model or newform coefficient fields, so the rationality claim needs another source.

<a id="R16-4-non-cm-self-twists"></a>

### `R16.4/non-cm-self-twists` — The non-CM self-twist condition ★

*Definition* · node `GL2AutomorphicRepresentationsAndTransfer:R16.4/non-cm-self-twists` · declaration `TauCeti.GL2Blueprint.nonCM` · proposed module `TauCeti/RepresentationTheory/GL2/R164`, namespace `TauCeti.GL2Blueprint` · planet **Non-CM self-twists**

On the existing cuspidal GL₂ isomorphism classes, non-CM means that π⊗χdet≅π implies χ=1 for every Hecke character χ of F×\𝔸×. This is the self-twist formulation used by NT; it defines a subset of the AF.2 carrier rather than a second automorphic representation. Central characters imply any self-twist has χ²=1. Any specified nontrivial quadratic stabilizer excludes the class. R17.4’s automorphic-induction comparison consumes this self-twist definition; no automorphic-induction theorem is required to define it.

**Hypotheses.**

- Cuspidal GL₂ class and the supplier determinant-twist action; all Hecke characters, not only unramified ones.

**Construction.**

1. Express triviality of the stabilizer of the determinant-twist action on isomorphism classes.
2. Compare central characters to obtain χ²=1; the non-CM property is exactly trivial stabilizer, including all ramified characters.

**Uses that determine the API.**

- *NT Lemma 2.1*: Provides irreducibility of the symmetric-power Galois representations under the theorem’s separate algebraicity hypotheses.
- *R17.4 quadratic base change*: Distinguishes the quadratic automorphic-induction exception to cuspidality.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.nonCM_iff` | characterisation | π is non-CM iff every character fixing its isomorphism class is trivial. |
| `TauCeti.GL2Blueprint.nonCM_twist` | functoriality | Twisting π by any Hecke character preserves non-CM. |
| `TauCeti.GL2Blueprint.nonCM_self_twist_square` | compatibility | Every self-twist χ of a rank-two π satisfies χ²=1 by comparison of central characters. |

**Unit tests.**

- `TauCeti.GL2Blueprint.nonCM_free_action` (computation): For the multiplication action of a group on itself every stabilizer is trivial.
- `TauCeti.GL2Blueprint.nonCM_trivial_character` (degenerate): The character χ=1 does not violate non-CM.
- `TauCeti.GL2Blueprint.nonCM_quadratic_stabilizer` (non-example): A class fixed by a specified nonidentity quadratic character is not non-CM.

**Acceptance.**

- The trivial character is allowed; a nontrivial quadratic stabilizer violates the definition.

**Prerequisites.** [`R16.4/cuspidal-tensor-factorization`](#R16-4-cuspidal-tensor-factorization), `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), Lemma 2.1 introductory hypothesis, printed p. 9. Excerpt: “non-trivial”. Match: The passage supplies the the non-cm self-twist condition input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 9 = PDF p. 9; checked against the text layer; exact): “Let F be a totally real field, and let π be a RAESDC automorphic representation of GL2 (AF ) that is non-CM, in the sense that for any non-trivial character χ” The printed condition is π ≇ π ⊗ (χ ∘ det) for every non-trivial χ : F^×\A_F^× → C^× (the text layer garbles ≇ as '6=', so the excerpt stops before it); this is the node's self-twist condition, though NT states it only for RAESDC π over totally real F and does not make the χ² = 1 remark.

<a id="layer-R16-5"></a>

# Layer R16.5. Integral formulas and converse-theorem prerequisites

Integral representations and the converse theorem. The global Mellin integral of a cusp form unfolds through the Whittaker expansion of R16.4 and factors into the local zeta integrals of AL.2 (`whittaker-integral-comparison`). `full-gl2-converse` is the converse theorem for GL₂ over any number field, with the full family of Hecke-character twists, entireness, boundedness in vertical strips, the functional equations and the archimedean hypotheses.

`classical-l-function-comparison` compares the unitary L-function of the adelization of a newform of weight k ≥ 2 with its classical Dirichlet series, L(s, π_f) = L_f(s + (k−1)/2), and `global-epsilon-normalization` fixes the completed L-function, the analytic conductor |Disc F|²·N(𝔣_π) and the functional equation.

**Nodes:** 4. **Planets:** Whittaker Mellin comparison, GL₂ converse theorem, Classical L-function comparison.

<a id="R16-5-whittaker-integral-comparison"></a>

### `R16.5/whittaker-integral-comparison` — The GL₂ Whittaker Mellin comparison ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison` · declaration `TauCeti.GL2Blueprint.whittakerIntegral` · proposed module `TauCeti/RepresentationTheory/GL2/R165`, namespace `TauCeti.GL2Blueprint` · planet **Whittaker Mellin comparison**

For factorizable cusp φ and Wφ=⊗vWv, the integral ∫_{F×\𝔸×}φ(diag(a,1))χ(a)|a|^{s−1/2}d×a unfolds to ∫_{𝔸×}Wφ(diag(a,1))χ(a)|a|^{s−1/2}d×a and factors into the AL.2 local Whittaker zeta integrals in a common right half-plane. At unramified places with normalized spherical Wv the factor is L(s,πv⊗χv); at ramified places a supplier test vector realizes the L-factor, rather than every newvector doing so for every ramified twist. Compare this integral with AL.2’s Godement–Jacquet standard factor and AL.3’s GL₂×GL₁ Rankin–Selberg integral, using their shared LLC normalization.

**Hypotheses.**

- Cuspidal φ, Hecke character χ; factorizable measures with standard unit volume at almost all finite places; absolute convergence first.

**Proof outline.**

1. Use globalWhittakerExpansion to unfold the multiplicative quotient and AL.0 estimates to justify exchange of sum and integral.
2. Apply restricted tensor factorization and sphericalValues for the good-place geometric series.
3. Import AL.2/AL.3 local fractional-ideal and functional-equation comparisons, then their global analytic continuation.

**Acceptance.**

- For α=β the recurrence still gives the squared unramified Euler denominator; ramified test-vector choice is explicit.

**Prerequisites.** [`R16.4/global-whittaker-expansion`](#R16-4-global-whittaker-expansion), [`R16.2/spherical-whittaker-values`](#R16-2-spherical-whittaker-values), [`R16.2/normalized-newvector`](#R16-2-normalized-newvector), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), Theorem11.1 printed p.180; formula (11.1.2) and its Euler product, printed pp.183–184; Lemma11.1.3 printed p.184. Excerpt: “L(s,”. Match: Formula (11.1.2) unfolds the multiplicative quotient integral to the global Whittaker integral; its factorizable Euler product is on p.184. Lemma11.1.3 supplies the right-half-plane estimate. AL.2/AL.3 supply the local test-vector and integral comparisons.
  - *Assembly note, passage at this locator* (printed p. 184 = PDF p. 190 (with printed p. 183 = PDF p. 189); checked against the text layer; specialisation): “Since Φ(gv , s, ϕv ) is, by Proposition 3.5, equal to 1 for almost all v we can set Y Φ(g, s, ϕ1 ) = Φ(gv , s, ϕv ) v so that Ψ(g, s, ϕ1 ) = L(s, π)Φ(g, s, ϕ1 ).” For ϕ1 of the form (11.1.2) the adelic Whittaker integral is the Euler product of local integrals and equals L(s,π) times a product of normalised factors that is 1 at almost all v; the unfolding of the F×\I integral of ϕ to this Whittaker integral is on the same page after Lemma 11.1.3 (not in formula (11.1.2) itself, as the packet match text says), it is done for the untwisted integral (twists via ω⊗π, Corollary 11.2) and printed p. 185 chooses ramified ϕv with exponential Φ(e,s,ϕv) instead of a named test vector.

<a id="R16-5-full-gl2-converse"></a>

### `R16.5/full-gl2-converse` — The GL₂ converse theorem with all twists ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.5/full-gl2-converse` · declaration `TauCeti.GL2Blueprint.gl2Converse` · proposed module `TauCeti/RepresentationTheory/GL2/R165`, namespace `TauCeti.GL2Blueprint` · planet **GL₂ converse theorem**

Let Π=⊗′vΠv be an irreducible admissible generic GL₂(𝔸F) tensor, with central character trivial on F×, spherical almost everywhere and the JL uniform exponent bound at the unramified principal-series places so its standard and dual Euler products converge absolutely in a right half-plane. At infinity use genuine irreducible admissible Harish–Chandra modules and their Casselman–Wallach globalizations. Suppose for EVERY Hecke quasicharacter χ, the completed L(s,Π⊗χdet) and L(s,Π̃⊗χ⁻¹det) extend to entire functions, are bounded in every vertical strip outside the standard excluded neighborhoods (here there are no poles), and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ,ψ)L(1−s,Π̃⊗χ⁻¹). Then Π is cuspidal automorphic. Finite-order, unramified-only or one fixed-conductor twists are not substituted for this family. One-dimensional local constituents are excluded by genericity/infinite-dimensionality.

**Hypotheses.**

- Number field F; uniform bound |χᵢ,v(ϖv)| between qv^{−r} and qv^r for a common r at principal-series unramified places; all local constituents infinite-dimensional/generic; full archimedean and analytic conditions above.

**Proof outline.**

1. Use JL Theorem 11.3/Cogdell Theorem 3.1 with n=2 and all GL₁ cuspidal twists, i.e. all Hecke characters.
2. Construct the Whittaker sum; Mellin inversion and every character functional equation prove Weyl invariance and the growth estimates.
3. Entireness removes constant terms/pole obstructions; the constructed nonzero tensor is a cusp form.

**Acceptance.**

- A tensor whose twisted completed L-function has a pole fails the theorem; analytic continuation by itself does not meet the hypotheses.

**Prerequisites.** [`R16.5/whittaker-integral-comparison`](#R16-5-whittaker-integral-comparison), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification), `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.2`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), Theorem 11.3, printed p. 186. Excerpt: “entire”. Match: The passage supplies the the gl₂ converse theorem with all twists input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 186 = PDF p. 192; checked against the text layer; exact): “Suppose L(s, ω⊗π) and L(s, ω −1 ⊗e π) are, for all ω, entire functions of s which are bounded in vertical strips and satisfy the functional equation L(s, ω ⊗ π) = ε(s, ω ⊗ π)L(1 − s, ω −1 ⊗ π e) If the πv are all infinite-dimensional π is a constituent of A0 .” Theorem 11.3 (central character trivial on F×, uniform bound |ϖv|^{-r} ≤ |µv(ϖv)|,|νv(ϖv)| ≤ |ϖv|^r, all quasi-characters ω of F×\I, entire, bounded in vertical strips, functional equation, all πv infinite-dimensional ⇒ cuspidal) is the node's statement; in the text layer ε is the glyph U+000F (read as ε for verification) and 'ω −1 ⊗e π', 'π e' render ω⁻¹⊗π̃.
- **converse** (James W. Cogdell, [*Piatetski-Shapiro’s work on converse theorems*](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf)), §2 pp. 5–6; §3 Theorem 3.1, p. 6, n=2. Excerpt: “nice”. Match: For n=2 the full twist family T(n−1) is the Hecke-character family. The survey explicitly lists entire continuation, bounded vertical strips and the functional equation, as well as convergence and automorphic central character.
  - *Assembly note, passage at this locator* (printed p. 6 = PDF p. 6 (printed and PDF pages coincide); the §2 hypotheses (Euler product convergent in a right half-plane, automorphic central character, definition of 'nice') are on printed pp. 5–6 = PDF pp. 5–6; transcribed from the page image; specialisation): “The most basic converse theorem is the following. The notation and assumptions are as in the previous section. Theorem 3.1. Suppose L(s, π × π′) are nice for all π′ ∈ 𝒯(n − 1). Then π is a cuspidal automorphic representation of GLn(𝔸).” Transcribed from the page image because the text layer renders the prime in π′ as '0' (reading 'π 0'); Theorem 3.1 with the §2 hypotheses (π irreducible admissible, Euler product convergent for Re(s) ≫ 0, idele-class central character, nice = entire, bounded in vertical strips, functional equation) gives the node at n = 2, where 𝒯(1) is the set of all Hecke characters; the survey only sketches the proof (spectral inversion, reduction to generic π) and does not spell out the node's uniform exponent bound or archimedean globalization conventions.

<a id="R16-5-classical-l-function-comparison"></a>

### `R16.5/classical-l-function-comparison` — Classical and unitary L-function normalization ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison` · declaration `TauCeti.GL2Blueprint.classicalLFunction` · proposed module `TauCeti/RepresentationTheory/GL2/R165`, namespace `TauCeti.GL2Blueprint` · planet **Classical L-function comparison**

For a normalized primitive holomorphic newform f of weight k≥2, let πf be the AF.5 unitary adelization. With Lf(s)=Σ_{n≥1}a_n n^{−s}, L(s,πf)=Lf(s+(k−1)/2), including the bad-prime factors supplied by upstream newform theory. Its infinite factor is Γℂ(s+(k−1)/2). The factor 2 in Γℂ distinguishes this completion from the common classical (2π)^{−s}Γ(s)Lf(s); record the scalar and the conductor power rather than asserting equality of differently normalized completed functions. At width one the pinned CuspForm L-series theorem supplies the convergent-domain Mellin comparison; the global continuation is imported.

**Hypotheses.**

- f in the existing Γ₁(N) normalized newform carrier, nebentypus compatible with weight; AF.5 unitary normalization.

**Proof outline.**

1. Apply AF.5’s classical-to-adelic map and upstream Hecke Euler factors to identify good eigenvalues a_p p^{−(k−1)/2}.
2. Compare the local Mellin integral and archimedean factor, then the pinned convergent-domain LSeries identity.
3. Transport the equality by AL.3 continuation and include the upstream primitive bad-prime factors.

**Acceptance.**

- Weight two shifts the Dirichlet variable by 1/2; the classical a_p is not the unitary Hecke eigenvalue.

**Prerequisites.** [`R16.5/whittaker-integral-comparison`](#R16-5-whittaker-integral-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:CuspForm.LSeries_qExpansion_coeff_eq`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §11 classical specialization of standard factors. Excerpt: “functional”. Match: The passage supplies the classical and unitary l-function normalization input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 180 = PDF p. 186; checked against the text layer; does not support): “Finally they satisfy the functional equation L(s, π) = ε(s, π)L(1 − s, π e).” The passage is at No classical specialisation exists in JL §11 (no holomorphic newform, Σ a_n n^{-s}, weight shift or Γℂ comparison anywhere in the text layer of the book); the nearest passages are Theorem 11.1, printed p. 180 (general standard functional equation) and §5, printed pp. 96–97 (archimedean factors); the classical normalisation needs another source.. Theorem 11.1 only gives the general functional equation L(s,π) = ε(s,π)L(1−s,π̃) for automorphic π (ε is the U+000F glyph, 'π e' is π̃); the node's claim L(s,πf) = Lf(s+(k−1)/2) with its Γℂ and conductor bookkeeping is not stated or proved in JL.

<a id="R16-5-global-epsilon-normalization"></a>

### `R16.5/global-epsilon-normalization` — Global functional equation and conductor normalization

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R16.5/global-epsilon-normalization` · declaration `TauCeti.GL2Blueprint.globalEpsilon` · proposed module `TauCeti/RepresentationTheory/GL2/R165`, namespace `TauCeti.GL2Blueprint`

For the standard global additive character obtained from the trace F/ℚ and compatible self-dual local measures, put A(π)=|Disc(F)|²·N(𝔣π) in rank two. In the unitary variable, Λ(s,π)=A(π)^{s/2}L_f(s,π)L_∞(s,π). Its functional equation is Λ(s,π)=ε(1/2,π)Λ(1−s,π̃), with ε(1/2,π) the product of the local root numbers in AL.1/AL.3’s convention. For a weight-k form over ℚ and t=s+(k−1)/2, the exchange is t↔k−t. Changing local ψ_v by a global a∈F× multiplies each local epsilon by ω_v(a)|a|_v^{2s−1}; their product is one by central-character automorphy and the product formula. The discriminant square is the rank-two conductor contribution; for F=ℚ it is one.

**Hypotheses.**

- Use AL.3 global completion, the trace-normalized global ψ and self-dual measures; finite conductor from conductorEpsilon.

**Proof outline.**

1. Multiply the local epsilon-change formula and apply the product formula.
2. Apply the unitary/classical variable substitution and upstream classical completion over ℚ.
3. Import global discriminant bookkeeping from AL.1 rather than choose inconsistent local measures.

**Acceptance.**

- For k=2, t↔2−t; changing the global additive character leaves the global epsilon factor unchanged.

**Prerequisites.** [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.5/classical-l-function-comparison`](#R16-5-classical-l-function-comparison), `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), Theorem 11.1, printed p. 180. Excerpt: “equation”. Match: The passage supplies the global functional equation and conductor normalization input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 180 = PDF p. 186; checked against the text layer; supporting): “If ψ is replaced by the character x → ψ(αx) with α in F × then ε(s, πv , ψv ) is multiplied by ηv (α)|α|2s−1 v so that ε(s, π) is multiplied by” Just before Theorem 11.1 JL show the product of local ε factors is independent of ψ (the following display gives Π ηv(α)|α|v^{2s−1} = η(α)|α|^{2s−1} = 1), and Theorem 11.1 gives L(s,π) = ε(s,π)L(1−s,π̃); the node's completed Λ(s,π) with A(π) = |Disc F|²N(fπ), the root-number form and the classical t ↔ k−t exchange are not in JL (ε is the U+000F glyph; 'ηv (α)|α|2s−1 v' renders ηv(α)|α|v^{2s−1}).

<a id="layer-R16-6"></a>

# Layer R16.6. Classical and cohomological specialisations

The bridge to classical modular forms. Normalized primitive newforms of weight k ≥ 2 in Tau Ceti's `HeckeRing.GL2.Newform` correspond to cuspidal automorphic representations of GL₂(𝔸_ℚ) with infinite component D_k (`primitive-classical-bijection`), with the full level and Hecke dictionary (`classical-hecke-and-level`) and the conversion between unitary Satake parameters and arithmetic Hecke parameters (`weight-k-parameter-conversion`). Weight one is separate: its infinite component is the limit of discrete series D₁(0), whose parameter is 1 ⊕ sgn (`weight-one-classical-comparison`).

`hilbert-algebraic-weights` defines the algebraic representations ⊗_τ Sym^{k_τ−2} ⊗ det^{m_τ} of Hilbert modular forms from Tau Ceti's `symPowerRep`. `geometry-and-galois-exports` records what HilbertModularVarietiesAndShimuraCurves R18 and AutomorphicGaloisRepresentations R19 take from this roadmap.

**Nodes:** 6. **Planets:** Primitive adelization, Hecke and level dictionary, Hilbert algebraic weights, Weight normalization, Weight-one forms.

<a id="R16-6-primitive-classical-bijection"></a>

### `R16.6/primitive-classical-bijection` — Primitive newforms and holomorphic cuspidal classes ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection` · declaration `TauCeti.GL2Blueprint.primitiveBijection` · proposed module `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint` · planet **Primitive adelization**

For fixed k≥2 and nebentypus χ with χ(−1)=(−1)^k, identify normalized primitive Γ₁(N) newforms in the existing HeckeRing.GL2.Newform carrier with cuspidal automorphic GL₂(𝔸ℚ) isomorphism classes of conductor N, central character determined by χ via AF.5, and infinite component D_k in unitary normalization. On the automorphic side take the finite newvector tensor and the holomorphic lowest-weight vector in the positive-determinant constituent; the full GL₂(ℝ) representation still contains both O(2) signs. Normalize its first Fourier coefficient to one. The all-bad-prime eigenproperty needed on the classical side is supplied by upstream primitive newform theory, not assumed to be a field of the pinned Newform structure.

**Hypotheses.**

- N>0, k≥2; primitive at exact conductor, existing newspace and AF.5 dictionary; chosen additive character for the vector comparison.

**Construction.**

1. Apply AF.5 gl2-classical-to-adelic and gl2-dictionary to the existing form carrier.
2. Use casselmanNewvector and normalizedNewvector to recover the primitive line at every finite place; use a₁=1 to fix the global scalar.
3. Use globalMultiplicityOne and strongMultiplicityOne to prove the maps inverse and verify exact conductor with upstream Layer 4.

**Uses that determine the API.**

- *R19.1*: Supplies automorphic normalization for the Galois representation attached to an existing newform.
- *R18 Hilbert/Shimura geometry*: Provides the primitive finite-level comparison used to locate Hecke eigensystems.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.primitiveBijection_conductor` | compatibility | The product of the local conductor ideals is exactly N. |
| `TauCeti.GL2Blueprint.primitiveBijection_weight_character` | compatibility | π∞=D_k and the central character is the AF.5 character attached to χ. |
| `TauCeti.GL2Blueprint.primitiveBijection_hecke` | characterisation | For p∤N, α_p+β_p=a_p p^{−(k−1)/2} and α_pβ_p=χ(p). |
| `TauCeti.GL2Blueprint.primitiveBijection_normalized` | simp | The recovered holomorphic newform has first q-coefficient one. |
| `TauCeti.GL2Blueprint.primitiveBijection_inverse` | universal-property | The two maps are inverse on primitive forms and compatible automorphic classes. |

**Unit tests.**

- `TauCeti.GL2Blueprint.primitiveBijection_weight_two` (computation): At k=2 the infinite component is D₂ and the good trace is a_p/√p.
- `TauCeti.GL2Blueprint.primitiveBijection_old_level` (non-example): A primitive form of level M properly dividing N is not primitive of conductor N after the oldform inclusion.
- `TauCeti.GL2Blueprint.primitiveBijection_scalar_normalization` (characterisation): For a normalized eigenform with a₁=1, multiplying by a scalar c≠1 changes a₁ to c and fails normalization. Every nonzero c yields the same primitive class after renormalization; c=0 is excluded from the eigenform carrier.

**Acceptance.**

- A newform at lower conductor embedded as an oldform at N is not sent to a class of conductor N.

**Prerequisites.** [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.2/normalized-newvector`](#R16-2-normalized-newvector), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification), [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one), [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one), `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:HeckeRing.GL2.Newform`, `tauceti:HeckeRing.GL2.Newform.qExpansion_coeff_one`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §11 holomorphic specialization and §5 real lowest-weight modules. Excerpt: “holomorphic”. Match: The passage supplies the primitive newforms and holomorphic cuspidal classes input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 84 = PDF p. 90; checked against the text layer; supporting): “(ii) If s − m is an odd integer and s ⩾ 0 the only proper subspaces of B(µ1 , µ2 ) invariant under g are X B1 (µ1 , µ2 ) = Cϕn n⩾s+1 n≡s+1 (mod 2) X B2 (µ1 , µ2 ) = Cϕn n⩽−s−1 n≡s+1 (mod 2) and, when it is different from B(µ1 , µ2 ), Bs (µ1 , µ2 ) = B1 (µ1 , µ2 ) + B2 (µ1 , µ2 ).” The passage is at §5 Lemma 5.7, printed pp. 83–84 (lowest-weight piece B1), with Theorem 5.11, printed pp. 85–86; JL §11 contains no holomorphic or classical specialisation, so that half of the locator points to nothing.. Lemma 5.7(ii) gives the lowest-weight g-module B1 spanned by weights n ≥ s+1 (lowest weight k when s = k−1) and its antiholomorphic partner B2, which supports only the node's description of the holomorphic vector in D_k; the bijection between primitive newforms and cuspidal automorphic classes of conductor N is not in JL.

<a id="R16-6-classical-hecke-and-level"></a>

### `R16.6/classical-hecke-and-level` — The complete level and Hecke dictionary ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.6/classical-hecke-and-level` · declaration `TauCeti.GL2Blueprint.classicalHeckeLevel` · proposed module `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint` · planet **Hecke and level dictionary**

For primitiveBijection, at p∤N the unitary Satake polynomial is X²−a_p p^{−(k−1)/2}X+χ(p), while the arithmetic Hecke polynomial is X²−a_pX+χ(p)p^{k−1}. The primitive level is ∏p p^{c(πp)}. At a ramified p the local standard factor has degree zero, one or two according to (ker N)^I in rec πp, and its coefficients match the upstream primitive U_p factor after the same variable shift; do not impose a degree-two good-prime polynomial there. The finite-unit central character is χ^{-1} in the AF.5 right-equivariance convention, whereas its value on a good local uniformizer is χ(p) after global rational invariance.

**Hypotheses.**

- Γ₁(N), weight k, nebentypus and primitive hypotheses of primitiveBijection.

**Proof outline.**

1. Compare the AF.5 finite right-equivariance formula with global central invariance.
2. Apply principalParameter, steinbergParameter and supercuspidalParameter for the good and bad local factors.
3. Use upstream primitive Hecke/newform theory for the bad U_p eigenproperty absent from the pinned bundle.

**Acceptance.**

- For an unramified Steinberg local factor the standard Euler polynomial has degree one, although the WD representation has dimension two.

**Prerequisites.** [`R16.6/primitive-classical-bijection`](#R16-6-primitive-classical-bijection), [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.5/classical-l-function-comparison`](#R16-5-classical-l-function-comparison), `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`.

**Sources.**

- **casselman73** (William Casselman, [*On some results of Atkin and Lehner*](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf)), §3 start, printed p. 308; §1 local conductor theorem. Excerpt: “Atkin and Lehner”. Match: The passage supplies the the complete level and hecke dictionary input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 313 = PDF p. 14; transcribed from the page image; supporting): “In particular, if N = 𝔠(π), then the dimension is exactly one, and the corresponding modular form is what Atkin and Lehner call a newform. All newforms arise in this way” The passage is at §3, Theorem 4 and the following paragraph, printed p. 313 (§3 begins on p. 308 with only an announcement); local input Theorem 1, p. 302. The start of §3 on p. 308 only says a rough indication will be given; the level statement is Theorem 4 (𝔠(π) has divisor 𝔠(π_p) at p, dimension ∏(nᵢ + 1) at level 𝔠(π)∏pᵢ^{nᵢ}) and this paragraph, which supports the primitive level ∏p^{c(π_p)}; the Satake and Hecke polynomials, the ramified local factor and the central-character convention are not in Casselman.

<a id="R16-6-hilbert-algebraic-weights"></a>

### `R16.6/hilbert-algebraic-weights` — Hilbert cohomological algebraic weights ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights` · declaration `TauCeti.GL2Blueprint.hilbertWeightRepresentation` · proposed module `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint` · planet **Hilbert algebraic weights**

For totally real F, embeddings Σ=Hom(F,ℝ), integers k_τ≥2 and m_τ with k_τ+2m_τ=w independent of τ, define the local algebraic representation V_τ=Sym^{k_τ−2}(standard₂)⊗det^{m_τ}, using TauCeti.symPowerRep and the existing determinant character, and V=⊗_{τ∈Σ}V_τ on (Res_{F/ℚ}GL₂)_ℂ. Its scalar action at τ is z^{k_τ−2+2m_τ}=z^{w−2}; its dimension is ∏τ(k_τ−1). The dual V∨ is used when the cohomological/local-system convention requires it; the choice is stated in the AF.4 comparison rather than silently interchanged. Parallel parity of k_τ follows from the existence of the integer m_τ.

**Hypotheses.**

- Finite embedding set of a totally real number field; k_τ≥2, m_τ∈ℤ, k_τ+2m_τ=w; characteristic-zero coefficients.

**Construction.**

1. Use the existing symmetric-power standard representation and determinant z-power character.
2. Tensor over the finite embedding set; compute dimension and scalar character factorwise.
3. Apply AF.4 relative Lie algebra cohomology with its precise dual convention to the D_{k_τ} factors.

**Uses that determine the API.**

- *R18 cohomological coefficient systems*: Defines the algebraic coefficients imported into Hilbert and quaternionic geometry.
- *R19 Hodge–Tate comparisons*: Pins the weight/dual normalization used to compare automorphic and Galois parameters.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.hilbertWeightRepresentation_scalar` | characterisation | A scalar at τ acts by z^{k_τ−2+2m_τ}; for cohomological weight this is z^{w−2}. |
| `TauCeti.GL2Blueprint.hilbertWeightRepresentation_dimension` | data | dim V=∏τ(k_τ−1). |
| `TauCeti.GL2Blueprint.hilbertWeightRepresentation_dual` | compatibility | Dualizing inverts the scalar central character and agrees with the AF.4 local-system convention. |
| `TauCeti.GL2Blueprint.hilbertWeightRepresentation_base_change` | functoriality | Extension of characteristic-zero coefficients commutes with the tensor construction. |

**Unit tests.**

- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_two` (degenerate): For one embedding, k=2,m=0 gives the trivial one-dimensional representation.
- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_weight_three` (computation): For one embedding, k=3,m=1 gives standard₂⊗det, dimension two and scalar exponent three.
- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_mixed_parity` (non-example): Weights (2,3) cannot satisfy k_τ+2m_τ=w for integer m_τ and one common w.

**Acceptance.**

- Mixed parity k_τ admits no common integer w and m_τ.

**Prerequisites.** `tauceti:TauCeti.symPowerRep`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Representation`, `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), §1.2 regular algebraic highest-weight convention, printed p. 8. Excerpt: “highest”. Match: The passage supplies the hilbert cohomological algebraic weights input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 8 = PDF p. 8; checked against the text layer; supporting): “We identify X ∗ (Tn ) with Zn in the usual way, and write Zn+ ⊂ Zn for the subset of weights which are Bn -dominant. If W ∨ has highest weight λ = (λτ )τ ∈Hom(F,C) ∈ (Zn+ )Hom(F,C) , then we say that π has weight λ.” NT says π has weight λ when the dual W^∨ has highest weight λ, and further down the same page that for n = 2 weight λ = 0 comes from parallel weight 2 Hilbert modular forms; the node's Sym^{k_τ−2} ⊗ det^{m_τ} construction, parity condition and dimension count are not in NT.

<a id="R16-6-weight-k-parameter-conversion"></a>

### `R16.6/weight-k-parameter-conversion` — The weight-k arithmetic parameter conversion ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-k-parameter-conversion` · declaration `TauCeti.GL2Blueprint.weightKParameterConversion` · proposed module `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint` · planet **Weight normalization**

At p∤N, put A_p=p^{(k−1)/2}α_p and B_p=p^{(k−1)/2}β_p for the unitary Satake pair. Then A_p+B_p=a_p and A_pB_p=χ(p)p^{k−1}. In the geometric-Artin WD carrier this arithmetic Hecke parameter is rec(πf,p)⊗ν_W^{−(k−1)/2}=recᵀ(πf,p)⊗ν_W^{−(k−2)/2}. To compare to the classical Galois representation whose determinant is ε·χ_cyc^{k−1} and whose ARITHMETIC Frobenius polynomial is the arithmetic Hecke polynomial, convert the Frobenius and dual conventions explicitly: that Galois representation on geometric Frobenius has the inverse eigenpair (A_p^{-1},B_p^{-1}). Its contragredient has the Hecke eigenpair at geometric Frobenius. A nebentypus/Galois reciprocity convention must be matched before identifying this dual with the Tate-normalized construction. R19 owns the actual Galois attachment and the equality of WD data at ramified places.

**Hypotheses.**

- Classical arithmetic Frobenius convention stated; χ_cyc(arithmetic Frob_p)=p; unitary AF.5 πf, integer k≥2.

**Proof outline.**

1. Compute the two scalar twists on the unramified matrix and its trace/determinant.
2. Use normalizationBridge for the Tate half-twist and invert eigenvalues when changing arithmetic to geometric Frobenius.
3. Request R19.1’s explicit dual/nebentypus normalization and ramified local-global comparison, keeping N for special places.

**Acceptance.**

- At k=2 the Hecke parameter equals recᵀπ; its determinant on geometric Φ is χ(p)p, so it cannot be identified unchanged with a Galois representation having determinant χ_cyc at geometric Φ.

**Prerequisites.** [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization), [`R16.6/classical-hecke-and-level`](#R16-6-classical-hecke-and-level), [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights), `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

**Sources.**

- **nt26** (James Newton and Jack A. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2)), §1.2 recᵀ and Hodge–Tate conventions, printed p. 8. Excerpt: “cyclotomic”. Match: The passage supplies the the weight-k arithmetic parameter conversion input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 8 = PDF p. 8; checked against the text layer; supporting): “such that for each finite place v of F , WD(rπ,ι |GFv )F −ss ∼= recTFv (ι−1 πv ) (see e.g. [Car14]). (When n = 1, this is compatible with our existing notation.) We use the convention that the Hodge–Tate weight of the cyclotomic character is −1.” NT normalizes r_{π,ι} by WD(r_{π,ι}|G_{F_v})^{F-ss} ≅ rec^T_{F_v}(ι⁻¹π_v), with geometric-Frobenius Art and cyclotomic Hodge–Tate weight −1, the conventions the node converts; the A_p, B_p computation and the arithmetic-Frobenius and dual comparison are not in NT.

<a id="R16-6-geometry-and-galois-exports"></a>

### `R16.6/geometry-and-galois-exports` — Newvector and multiplicity exports

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R16.6/geometry-and-galois-exports` · declaration `TauCeti.GL2Blueprint.geometricExports` · proposed module `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint`

Export the exact local conductor dimensions, normalized Whittaker line, primitive classical comparison, coefficient field and Hilbert algebraic representation to R18’s automorphic cohomology and R19’s Galois construction. Each consumer records its central character, archimedean dual convention, local compact subgroup, Hecke normalization and coefficient lattice. The finite-part multiplicity remains one for a fixed compatible infinite type; no new claim of integral multiplicity one, torsion-freeness or Galois existence is made by this export.

**Hypotheses.**

- Consumer coefficient field, local level and infinite type fixed; geometric statements imported from their owners.

**Proof outline.**

1. Use newvector and globalMultiplicityOne to identify the characteristic-zero automorphic multiplicity factors.
2. Transport primitiveBijection and hilbertWeightRepresentation to the consumer’s existing local system.
3. Use cohomologicalRationality and weightKParameterConversion to state the exact normalization expected of the geometric construction.

**Acceptance.**

- An integral congruence between eigensystems does not imply the characteristic-zero multiplicity statement integrally.

**Prerequisites.** [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one), [`R16.4/cohomological-rationality`](#R16-4-cohomological-rationality), [`R16.6/primitive-classical-bijection`](#R16-6-primitive-classical-bijection), [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights), [`R16.6/weight-k-parameter-conversion`](#R16-6-weight-k-parameter-conversion).

**Sources.**

- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf)), §5.2.1 printed pp. 347–348, archimedean weight two. Excerpt: “poids 2”. Match: The passage supplies the newvector and multiplicity exports input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 347 = PDF p. 37 (JAMS 33 (2020) pp. 311–362, printed = PDF + 310); §5.2.1 continues on printed p. 348 = PDF p. 38; transcribed from the page image; supporting): “Soit SD₂(𝔾̌) l’ensemble des représentations automorphes π = π_∞ ⊗ π_f de 𝔾̌(𝐀) telles que Hom_{B̌*_∞}(σ₂, π_∞) ≠ 0, où σ₂ est la représentation de 𝔾̌(𝐑 ⊗_𝐐 E) = ∏_{v|∞} 𝔾̌(E_v) triviale aux places v ≠ ∞₀ et série discrète holomorphe de poids 2 et de caractère central trivial en la place ∞₀.” Transcribed from the page image because the text layer drops both ≠ signs (printing '= 0' and 'v = ∞0'); the passage is one consumer's fixed infinite type (weight-two holomorphic discrete series with trivial central character at ∞₀, trivial at the other real places, where B̌ is compact), which illustrates the node's requirement that consumers record their central character and archimedean convention, but it states none of the node's exported multiplicity or conductor claims.

<a id="R16-6-weight-one-classical-comparison"></a>

### `R16.6/weight-one-classical-comparison` — Primitive weight-one comparison ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison` · declaration `TauCeti.GL2Blueprint.weightOneClassicalComparison` · proposed module `TauCeti/RepresentationTheory/GL2/R166`, namespace `TauCeti.GL2Blueprint` · planet **Weight-one forms**

For N>0 and odd nebentypus χ, the existing primitive normalized weight-one cusp forms at conductor N correspond to cuspidal GL₂(𝔸ℚ) classes of exact conductor N and central character ω_χ whose unitary infinite component is the full-O(2) limit D₁(0). Its positive-determinant restriction has holomorphic and antiholomorphic limits of lowest weights ±1. Its real Weil parameter is 1⊕sgn, not an irreducible induction from ℂ×; its standard infinite factor is Γℝ(s)Γℝ(s+1)=Γℂ(s). Use AF.5’s k≥1 function dictionary, finite newvector normalization and global multiplicity. This comparison does not give a regular algebraic Hilbert coefficient Sym^{−1} or a weight-one Galois construction. The Casimir is −1/4 at k=1 in the convention Δ=(H²+2XY+2YX)/4.

**Hypotheses.**

- N>0; χ(−1)=−1; existing primitive newform carrier with k=1 and exact conductor; chosen AF.1 limit globalization and AF.5 dictionary.

**Proof outline.**

1. Apply the existing AF.5 adelic/classical holomorphic dictionary at k=1, retaining the full O(2) extension and its lowering-operator condition.
2. Use the newvector line and global multiplicity one as in primitiveBijection to isolate the primitive normalized eigenform.
3. Use AF.1’s m=0 limit parameter and AL.1 gamma duplication to obtain the infinite factor; retain the corrected Casimir from AF.5/E1.

**Acceptance.**

- At k=1 the Casimir is −1/4 and the Weil parameter splits; do not call it a discrete series with irreducible parameter.
- Odd nebentypus is required, and no negative symmetric power is defined.

**Prerequisites.** [`R16.2/archimedean-classification`](#R16-2-archimedean-classification), [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one), `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.2/normalized-newvector`](#R16-2-normalized-newvector).

**Sources.**

- **getz15** (Jayce R. Getz, [*An introduction to automorphic representations*](https://sites.math.duke.edu/~jgetz/aut_reps.pdf)), §6.4 Lemma 6.19, p. 33, corrected as AF/E1; §6.5 limit module, p. 34. Excerpt: “limit of discrete”. Match: The notes explicitly include k=1 and give the full O(2) module whose connected constituents are the two limits. The displayed Casimir ideal in §6.4 is corrected using the notes’ §6.5 computation, as independently confirmed in the AF packet. The Weil/gamma and primitive comparisons import the listed owners.
  - *Assembly note, passage at this locator* (printed p. 34 = PDF p. 34 (author notes, printed and PDF pages coincide); Lemma 6.19 is on printed p. 33 = PDF p. 33; checked against the text layer; supporting): “Then πk is an irreducible admissible (g, K∞ )-module. If k ≥ 2 then these modules are known as the discrete series of weight k and when k = 1 they are known as the limit of discrete series.” §6.5 builds the full O(2) (g, K∞)-module πk on v_ℓ, |ℓ| ≥ k, ℓ ≡ k mod 2, with diag(1,−1) swapping v_ℓ and v_−ℓ and ∆ = k(k−2)/4 (so −1/4 at k = 1), and names the k = 1 case the limit of discrete series, while Lemma 6.19 (p. 33) gives S_k(Γ) ≅ A0(Γ, ξk, ⟨∆ − ¼(k² − 1), Z⟩) for all k ≥ 1, whose Casimir value (0 at k = 1) contradicts §6.5, as the node's AF/E1 correction says; the primitive/exact-conductor bijection, the Weil parameter 1 ⊕ sgn and the Γ-factor are not in Getz.

<a id="layer-R17-1"></a>

# Layer R17.1. Quaternionic local transfer

Local Jacquet–Langlands for a quaternion division algebra D over a nonarchimedean field is imported from ET.6; this layer makes it explicit in rank two. `local-quaternionic-comparison` states the character relation Θ_{JL(ρ)}(g) = −Θ_ρ(d) on matching regular elliptic elements and the compatibility with central characters and twists. A character χ∘Nrd goes to St ⊗ χ∘det (`norm-character-steinberg`). At a real place Hamilton's quaternions give Sym^{k−2} ↔ D_k with the elliptic sign (`real-quaternionic-comparison`). Wild dyadic parameters are included (`wild-dyadic-transfer`). `swapped-quaternion-invariants` does the parity bookkeeping when the invariants of a quaternion algebra are exchanged at a p-adic place and a real place; the global algebras are given as data.

**Nodes:** 5. **Planets:** Local Jacquet–Langlands, Norm characters and Steinberg, Real quaternionic transfer, Swapped quaternion invariants.

<a id="R17-1-local-quaternionic-comparison"></a>

### `R17.1/local-quaternionic-comparison` — Quaternionic local Jacquet–Langlands ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison` · declaration `TauCeti.GL2Blueprint.localQuaternionic` · proposed module `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint` · planet **Local Jacquet–Langlands**

For a nonarchimedean F and quaternion division algebra D/F from the upstream quaternion carrier, ET.6 local Jacquet–Langlands identifies irreducible smooth D× representations with essentially square-integrable GL₂(F) representations. On corresponding regular elliptic d,g having the same reduced characteristic polynomial, Θ_JL(ρ)(g)=−Θ_ρ(d). Determinants/central characters and χ∘Nrd versus χ∘det twists agree. At a split place D=M₂(F) the comparison is the chosen algebra isomorphism and has sign +1. A principal series has no division-algebra preimage. This is a specialization of the general correspondence, not a second existence/bijectivity proof.

**Hypotheses.**

- Characteristic-zero smooth representations; compare matching elliptic conjugacy classes; square-integrability is essential.

**Proof outline.**

1. Apply ET.6 inner-form LLC/JL, and identify its regular-elliptic character identity with JL Theorem 15.1.
2. Compute the rank-two sign (−1)^{2−1} and transport scalar centers and reduced norm through the upstream splitting comparison.

**Acceptance.**

- At a division place a nontrivial χ∘Nrd transfers to Steinberg, not χ∘det.

**Prerequisites.** [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), Theorem 15.1 and following orthogonality discussion, printed pp. 249–250. Excerpt: “absolutely”. Match: The passage supplies the quaternionic local jacquet–langlands input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 249 = PDF p. 255; checked against the text layer; exact): “Theorem 15.1. Suppose F is non-archimedean. Then the map π 0 → π is injective and its image is the collection of special representations together with the absolutely cuspidal representations.” Theorem 15.1 ('π 0' is π′) is the node's bijection between irreducible D× representations and the essentially square-integrable (special or absolutely cuspidal) GL2 representations; the sign identity χπ′(b) = −χπ(b) on regular elliptic elements is Proposition 15.5, printed p. 256, outside the cited pp. 249–250.

<a id="R17-1-norm-character-steinberg"></a>

### `R17.1/norm-character-steinberg` — Norm characters and Steinberg twists ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.1/norm-character-steinberg` · declaration `TauCeti.GL2Blueprint.normCharacterSteinberg` · proposed module `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint` · planet **Norm characters and Steinberg**

Under localQuaternionic, χ∘Nrd on D× transfers to St⊗χdet. Its central character is χ², its WD parameter is steinbergParameter with N≠0, and its standard conductor is 1 for unramified χ or 2a(χ) for ramified χ. The corresponding local L/epsilon factors are exactly those of that parameter; the one-dimensional D× dimension does not make the GL₂ WD parameter monodromy-free. The trivial D× representation is the unramified St case, used by the definite-quaternion applications.

**Hypotheses.**

- Nonarchimedean quaternion division algebra; smooth characteristic-zero χ.

**Proof outline.**

1. Apply ET.6’s segment of length two for the norm character and JL §15 special correspondence.
2. Insert steinbergParameter and conductorEpsilon; compare the central scalar reduced norm z².

**Acceptance.**

- χ=1 gives conductor one and N rank one; it does not give an unramified principal series.

**Prerequisites.** [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §15 special/norm-character correspondence; §16 p. 269. Excerpt: “χv”. Match: The passage supplies the norm characters and steinberg twists input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 256 = PDF p. 262 (also printed p. 269 = PDF p. 275); checked against the text layer; supporting): “If π 0 is the one-dimensional representation g → χ ν(g) of G0F then π = π(π 0 ).” Here π is the special representation σ(χαF^{1/2}, χαF^{-1/2}) = St⊗χ and ν is the reduced norm, so the sentence states χ∘Nrd ↦ St⊗χ∘det ('π 0' is π′, 'G0F' is G′F); the next sentence records χπ = −χπ′, and printed p. 269 treats the case σ′v = χv∘ν, but the central character χ², the WD parameter with N ≠ 0, the conductor and the L/ε factors of the node are not stated in these passages.

<a id="R17-1-real-quaternionic-comparison"></a>

### `R17.1/real-quaternionic-comparison` — The real quaternionic coefficient comparison ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison` · declaration `TauCeti.GL2Blueprint.realQuaternionic` · proposed module `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint` · planet **Real quaternionic transfer**

For D=Hamilton quaternions at a real place, an irreducible algebraic D× representation restricts to SU(2) as Sym^{k−2} for k≥2, with its specified positive-real central character. Its local JL image is D_k with the norm twist that gives the same central character. Under the complex splitting, the algebraic representation Sym^{k−2}⊗det^m has scalar action z^{k−2+2m}; comparison with the unitary D_k therefore includes the explicit |det|^{(k−2+2m)/2} twist and the same sign^k on ℝ×. For k=2,m=0 the trivial quaternionic representation transfers to D₂. One does not assert that an arbitrary unitary D_k is itself a finite-dimensional algebraic representation.

**Hypotheses.**

- Real place, k≥2 and m integer; AF.1b supplies full O(2) representation and archimedean LLC.

**Proof outline.**

1. Use AF.1’s requested SU(2) highest-weight and GL₂(ℝ) Harish–Chandra character interfaces. Compare the characters on matching regular elliptic elements with the rank-two minus sign to characterize the real local JL image; the current ET.6 theorem covers finite extensions of ℚp only.
2. Compare SU(2) highest weight k−2, SO(2) lowest weight k, and the scalar characters; apply the determinant/norm twist.
3. Match the weight-two convention of CDN20 with the general Hilbert algebraic weight construction.

**Acceptance.**

- k=2,m=0 has Γℂ(s+1/2); no limit k=1 representation comes from a finite-dimensional quaternionic highest weight −1.

**Prerequisites.** [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights), `AutomorphicFormsOnReductiveGroups:AF.1`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`.

**Sources.**

- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf)), §5.2.1 printed pp. 347–348. Excerpt: “triviale”. Match: CDN20 fixes the weight-two trivial quaternionic/holomorphic discrete-series convention in its global application. The general weight/central-character comparison uses the requested AF.1 archimedean character interfaces; finite-place ET.6 is not a real-place proof.
  - *Assembly note, passage at this locator* (printed p. 347 = PDF p. 37 (JAMS 33 (2020) pp. 311–362, printed = PDF + 310); §5.2.1 continues on printed p. 348 = PDF p. 38; transcribed from the page image; supporting): “Soit SD₂(𝔾̌) l’ensemble des représentations automorphes π = π_∞ ⊗ π_f de 𝔾̌(𝐀) telles que Hom_{B̌*_∞}(σ₂, π_∞) ≠ 0, où σ₂ est la représentation de 𝔾̌(𝐑 ⊗_𝐐 E) = ∏_{v|∞} 𝔾̌(E_v) triviale aux places v ≠ ∞₀ et série discrète holomorphe de poids 2 et de caractère central trivial en la place ∞₀.” Transcribed from the page image because the text layer drops both ≠ signs; CDN20 takes σ₂ trivial at the real places where B̌ is compact and weight-two holomorphic discrete series with trivial central character at ∞₀, and (same page) B compact at ∞₀ with Π matched to Π̌ by global Jacquet–Langlands, so it fixes only the k = 2, m = 0 convention 'trivial quaternionic ↔ D₂' and gives no general Sym^{k−2}/D_k or central-character twist comparison.

<a id="R17-1-wild-dyadic-transfer"></a>

### `R17.1/wild-dyadic-transfer` — Wild and dyadic quaternionic compatibility

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R17.1/wild-dyadic-transfer` · declaration `TauCeti.GL2Blueprint.wildDyadicTransfer` · proposed module `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint`

For every essentially square-integrable GL₂(F) parameter, including primitive wild rank-two Weil representations at dyadic places, the ET.6 quaternionic preimage has the same central character and LLC parameter as GL₂, with the same standard factors and Artin conductor in R16.3’s convention. For a supercuspidal it has N=0; for a special representation it has rank-one N. Dihedral/tamely-dihedral examples are checks within this statement, not a replacement for primitive wild cases. No naive level exponent of a chosen order in D is equated to the GL₂ conductor without a separate comparison.

**Hypotheses.**

- ET.6 canonical inner-form correspondence at every finite extension of ℚp; characteristic zero.

**Proof outline.**

1. Specialize parameter compatibility from ET.6 and apply supercuspidalParameter/steinbergParameter.
2. Retain the full Swan term from R01.3 and the geometric/Tate bridge.
3. Use CDN23 and DLB as consumers; request an explicit primitive dyadic worked example and its matching function if absent from the supplier.

**Acceptance.**

- A primitive wild example must not be claimed to arise from a character of the unramified quadratic extension.

**Prerequisites.** [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization), [`R16.3/tamely-dihedral-supercuspidal`](#R16-3-tamely-dihedral-supercuspidal), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`.

**Sources.**

- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.2, printed p. 38, local division/split identification. Excerpt: “non déployée”. Match: The passage supplies the wild and dyadic quaternionic compatibility input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 38 = PDF p. 38 (Forum Math. Pi 11 (2023) e16, article pages 1–62, printed and PDF pages coincide); checked against the text layer; does not support): “En particulier G(𝐸𝔭 ) ≃ 𝐺 = GL2 (Q 𝑝 ) et Ǧ(𝐸𝔭 ) ≃ 𝐺ˇ où 𝐺ˇ est le groupe des unités de l’algèbre de quaternions non déployée sur Q 𝑝 .” The passage only identifies the local groups at 𝔭 (G split, GL₂(ℚp); Ǧ the units of the non-split quaternion algebra over ℚp) under Chapter 4's standing assumption p > 2 (p. 37, footnote 23), so it says nothing about Jacquet–Langlands parameter, central character, L-factor or conductor compatibility and nothing about wild or dyadic places; CDN23 is a consumer here, and the node's content must come from ET.6.

<a id="R17-1-swapped-quaternion-invariants"></a>

### `R17.1/swapped-quaternion-invariants` — Swapped quaternion invariants in arithmetic applications ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.1/swapped-quaternion-invariants` · declaration `TauCeti.GL2Blueprint.quaternionSwap` · proposed module `TauCeti/RepresentationTheory/GL2/R171`, namespace `TauCeti.GL2Blueprint` · planet **Swapped quaternion invariants**

Import upstream LOCAL quaternion classification and Hilbert reciprocity. Assume global quaternion algebras D₀,D with the prescribed ramification have been chosen; their global existence is a separate R17.3 construction, not a consequence of QFI Layer6D. In CDN23’s totally real F of even degree, D₀ ramifies at all real places and splits at all finite places. Interchange invariants at one chosen v₀|p and one real place τ₀: D ramifies at v₀ and all real places except τ₀, and has the same local algebra as D₀ away from {v₀,τ₀}. The ramified-place count stays even. Record chosen local splitting isomorphisms for Hecke comparison. Existence/globalization, auxiliary prime, small level and the resulting global spectral statement belong to R17.3/R18.3; here the local transfer at the two changed places is normCharacterSteinberg/realQuaternionic or the specified square-integrable type.

**Hypotheses.**

- Totally real F of even degree for this exact D₀ example; chosen v₀ and τ₀; general parity supplied upstream.
- Chosen global D₀,D with the displayed local invariants; this node proves their local comparisons and parity, conditional on that choice.

**Proof outline.**

1. For the chosen global algebras, use the local split/division classification from QFI Layer6D at every finite place and the real split/Hamilton classification. Verify the invariant sum/parity by CFT Layer14; neither local uniqueness nor parity alone constructs a global quaternion algebra.
2. At finite places outside the swap use QFI Layer6D local uniqueness, and at real places use the split/Hamilton classification, to choose equal-local-algebra identifications.
3. Apply the two local JL comparisons and route the auxiliary/global geometric work to its owners.

**Acceptance.**

- Removing one real ramification without adding v₀ would violate parity.

**Prerequisites.** [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.1/norm-character-steinberg`](#R17-1-norm-character-steinberg), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`.

**Sources.**

- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.2 and equation (4.6), printed pp. 38–39. Excerpt: “en échangeant les invariants”. Match: The passage supplies the swapped quaternion invariants in arithmetic applications input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 38 = PDF p. 38 (printed and PDF pages coincide); the use of (4.6) for G(A𝔭_f) ≃ Ǧ(A𝔭_f) is on printed p. 39 = PDF p. 39, and 'E totalement réel de degré pair' is Proposition 4.5 on p. 37; checked against the text layer; exact): “Soit D l’algèbre de quaternions sur E obtenue à partir de 𝐷 0 en échangeant les invariants en 𝔭 et ∞0 . On fixe un isomorphisme 𝐷 0 ⊗𝐸 A𝔭,∞0 ≃ 𝐷 ⊗𝐸 A𝔭,∞0 (4.6)” The sentence just before defines D₀ as 'compacte (modulo le centre) en toute place infinie de E et déployée en toute place finie de E', E being the even-degree totally real field of Prop. 4.5; D is obtained by swapping the invariants at 𝔭 and ∞₀ with the identification (4.6) away from {𝔭, ∞₀}, exactly the node's chosen-algebra setup, and CDN23 takes the existence of D (parity) for granted, matching the node's hypothesis that the global algebras are chosen.

<a id="layer-R17-2"></a>

# Layer R17.2. Trace-formula prerequisites and matching

The GL₂ test functions of the trace formula. The invariant trace formula comes from AutomorphicSpectralTheory AS.6 and the transfer machinery from ET.1, ET.3 and ET.4; this layer computes their GL₂ instances. `steinberg-projector-difference` is a test function whose trace isolates St ⊗ χ∘det. `quaternionic-orbital-matching` matches orbital integrals on D× and GL₂ with the sign −1 at elliptic elements and a common torus measure, and `cyclic-local-matching` matches twisted orbital integrals for a cyclic extension E/F.

On the spectral side, `continuous-residual-ledger` lists the continuous and residual terms, and `strong-cuspidal-vanishing` shows that a local factor whose integrals along the unipotent radical vanish kills them. `specialized-trace-comparison` puts these together into the comparisons used for global Jacquet–Langlands and cyclic base change.

**Nodes:** 6. **Planets:** Steinberg projector, Quaternionic orbital matching, Cyclic norm matching, Spectral term comparison, Cuspidal trace vanishing, Specialized trace comparison.

<a id="R17-2-steinberg-projector-difference"></a>

### `R17.2/steinberg-projector-difference` — The Steinberg projector difference ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R17.2/steinberg-projector-difference` · declaration `TauCeti.GL2Blueprint.steinbergProjectorDifference` · proposed module `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint` · planet **Steinberg projector**

At a nonarchimedean place, for unitary χ and ω=χ², work in SR.1’s compact-mod-center, ω⁻¹-equivariant Hecke space with AA.2 quotient measure. Put K=GL₂(O), I=K₀(p), and H=⟨Z,I,w⟩ where w=(0 1;ϖ 0). Let ξ(a)=(−1)^{v_F(a)}χ(a). Set e_K^χ(g)=χ(det g)⁻¹/vol(Z\ZK) on ZK and zero elsewhere, e_H^ξ(g)=ξ(det g)⁻¹/vol(Z\H) on H and zero elsewhere, and ζχ=e_H^ξ−e_K^χ. Then trace(St⊗χdet)(ζχ)=1, every other unitary infinite-dimensional irreducible with central character ω has trace zero, and trace(χdet)(ζχ)=−1; the other determinant characters with central character ω have trace zero. The construction is compact modulo Z, not necessarily compact in G. It is a trace projector, not an assertion that its operator is zero on every induced representation.

**Hypotheses.**

- χ unitary; nonarchimedean F; fixed central quotient measure, matching ω⁻¹ equivariance; exact extended-Iwahori H and ξ above.

**Construction.**

1. Use JL §16’s explicit ζ″−ζ′ formula on printed p. 269 and the preceding projection statements.
2. Compare the K and H character-isotypic idempotents and use the local classification/oldvector calculation.
3. Compute the determinant-character trace separately; it supplies the residual correction in the global ledger.

**Uses that determine the API.**

- *JL §16 global JL comparison*: Matches the division-place norm character while retaining its residual correction.
- *R17.2 spectral ledger*: Provides the explicit test against a determinant residual constituent.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.steinbergProjectorDifference_eval` | data | ζχ(g)=e_H^ξ(g)−e_K^χ(g) with the stated support and quotient volumes. |
| `TauCeti.GL2Blueprint.steinbergProjectorDifference_central` | compatibility | ζχ(zg)=ω(z)⁻¹ζχ(g). |
| `TauCeti.GL2Blueprint.steinbergProjectorDifference_steinberg` | characterisation | The corresponding Steinberg trace is one and all other unitary infinite-dimensional traces are zero. |
| `TauCeti.GL2Blueprint.steinbergProjectorDifference_character` | characterisation | The corresponding determinant-character trace is minus one. |
| `TauCeti.GL2Blueprint.steinbergProjectorDifference_twist` | functoriality | Replacing χ by χη multiplies ζχ(g) by η(det g)⁻¹ with the compatible central character. |

**Unit tests.**

- `TauCeti.GL2Blueprint.steinbergProjectorDifference_trivial_norm` (computation): For χ=1, the St trace is 1 and the trivial GL₂-character trace is −1.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_unramified_principal` (non-example): An irreducible unitary unramified principal series has trace zero, even though its Iwahori fixed space has dimension two.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_outside_support` (computation): At g outside H∪ZK, ζχ(g)=0.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_scalar_twist` (compatibility): A determinant-character twist multiplies both local idempotents by the same inverse character.

**Acceptance.**

- Its corresponding determinant-character trace is −1, so it cannot annihilate the whole residual spectrum.

**Prerequisites.** [`R16.1/k0`](#R16-1-k0), [`R16.2/iwahori-center`](#R16-2-iwahori-center), [`R17.1/norm-character-steinberg`](#R17-1-norm-character-steinberg), [`R16.1/haar-quotient-comparison`](#R16-1-haar-quotient-comparison), `SmoothRepresentationsOfLocalGroups:SR.1`, `AdelicAlgebraicGroups:AA.2`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §16 printed pp. 268–269, properties (i)–(iv) and ζ″−ζ′. Excerpt: “ζv”. Match: JL §16 explicitly constructs ζ=ζ″−ζ′ with the stated H and determinant characters and gives the Steinberg trace 1 and matching determinant-character trace −1.
  - *Assembly note, passage at this locator* (printed p. 268 = PDF p. 274 (construction on printed p. 269 = PDF p. 275); checked against the text layer; exact): “(ii) For a suitable choice of uv the operator σv (ζv ) is the orthogonal projection on the space Cuv . (iii) If χv is a character of Fv× such that χ2v = ηv then Z χv (det g)ζv (g)ω0 (v) Zv \Gv is −1 if σv0 (h) = χv ν(h) for all h in G0v and is 0 otherwise.” Properties (ii)–(iii) give Steinberg trace 1 and determinant-character trace −1 (other characters 0), (i) the ηv⁻¹ central behaviour and (iv) trace 0 on the other unitary infinite-dimensional representations, and printed p. 269 builds ζv = ζ″v − ζ′v from χv⁻¹(det g)/measure(Zv\ZvKv) on ZvKv and ωv⁻¹(det g)/measure(Zv\Hv) on Hv = ⟨Zv, Iwahori, (0 1; ϖv 0)⟩ with ωv(a) = (−1)^n χv(a), exactly the node's construction ('σv0' is σ′v, 'Z ... Zv \Gv' is the integral over Zv\Gv).

<a id="R17-2-quaternionic-orbital-matching"></a>

### `R17.2/quaternionic-orbital-matching` — Quaternionic orbital integrals and the sign ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching` · declaration `TauCeti.GL2Blueprint.quaternionicOrbitalMatching` · proposed module `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint` · planet **Quaternionic orbital matching**

For matching regular elliptic d∈D× and g∈GL₂(F) with the same reduced polynomial, identify their centralizer torus and choose the same torus measure; specify each ambient quotient Haar measure. ET.3/ET.6 transfer supplies test functions f_D,f_G with O_g(f_G)=−O_d(f_D) and O_g(f_G)=0 at split regular semisimple g. With the matching rank-two character identity Θ_GL₂=−Θ_D this gives trace JL(ρ)(f_G)=trace ρ(f_D). For a chosen D× matrix coefficient the transferred f_G is the JL §16 elliptic character function; in the norm-character case use steinbergProjectorDifference. Compare formal degrees and the identity orbital term using the actual quotient-volume ratio; do not infer equality of formal degrees under unrelated ambient measures.

**Hypotheses.**

- Fixed unitary central character; compact modulo center functions; regular elliptic correspondence and common centralizer measure.

**Proof outline.**

1. Apply ET.3 local smooth transfer and ET.6 character identity to the common torus.
2. Use the local Weyl integration formula, including its Weyl denominator and rank-two sign.
3. For norm characters insert the explicit projector difference; for supercuspidals use compact-mod-center matrix coefficients and the formal-degree normalization.

**Acceptance.**

- Changing one torus measure requires the corresponding orbital-integral scalar; it cannot preserve the displayed matching identity unchanged.

**Prerequisites.** [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.2/steinberg-projector-difference`](#R17-2-steinberg-projector-difference), [`R16.1/haar-quotient-comparison`](#R16-1-haar-quotient-comparison), `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §16 character orthogonality and regular-elliptic orbital-integral identity, printed pp.269–270. Excerpt: “orthogonality”. Match: The identity on p.270 gives the negative GL₂ character divided by the common torus quotient volume. The unrelated averaged constant-term equation (16.1.7) is on p.277. General matching existence and singular terms are requested from ET.3.
  - *Assembly note, passage at this locator* (printed p. 270 = PDF p. 276; checked against the text layer; supporting): “Since trace πv (ζv ) is 1 if πv is equivalent to σv and 0 otherwise the orthogonality relations imply that −1 Z ζv (g −1 bg)ωB (v) = χσ (b−1 ) Bv \Gv measure Zv \Bv v for all regular b and therefore, by continuity, for all b whose eigenvalues do not lie in Fv .” The display (checked on the page image) reads ∫_{Bv\Gv} ζv(g⁻¹bg)ωB(v) = −χσv(b⁻¹)/measure(Zv\Bv), the elliptic orbital integral of the projector as minus the GL2 character over the torus quotient volume, and printed p. 268 gives the analogous evaluation of (16.1.5)–(16.1.6) for the matrix coefficients ξv; this supports the norm-character and matrix-coefficient cases only, while general transfer, split-element vanishing and formal-degree comparison come from ET.3/ET.6.

<a id="R17-2-cyclic-local-matching"></a>

### `R17.2/cyclic-local-matching` — Concrete cyclic norm matching ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching` · declaration `TauCeti.GL2Blueprint.cyclicMatching` · proposed module `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint` · planet **Cyclic norm matching**

Let E/F be a cyclic extension of nonarchimedean local fields with generator σ, and use the ET.3/ET.4 twisted orbital integrals. For φ∈C_c^∞(GL₂(E)), choose f∈C_c^∞(GL₂(F)) with O_γ(f)=TO_{δ,σ}(φ) whenever γ is a regular norm of δ, and O_γ(f)=0 for regular nonnorm classes, with centralizer measures identified as in AC89 Chapter 1 §3. A matching central character on E is pulled back from F by N_{E/F}; central equivariance must use this norm, not the raw same character. At an unramified place with unit volumes, choose the spherical transfer: 1_{GL₂(O_E)} maps to 1_{GL₂(O_F)}, and Satake transforms are related by (α,β)↦(α^d,β^d), d=[E:F]. At a completely split global place use the product norm δ₁…δ_d and the corresponding convolution of local functions. The function choice is unique only modulo the kernel of regular orbital integrals.

**Hypotheses.**

- Cyclic local extension and generator; compatible centralizer Haar measures; unramified spherical assertion requires unramified E/F.

**Construction.**

1. Specialize AC89 Proposition 3.1 transfer existence to rank two via ET.3.
2. Apply ET.4 unramified fundamental lemma and compute the Satake norm power rule.
3. Compute the split-place twisted norm by cycling the d factors; record central character pullback and the convolution measure.

**Uses that determine the API.**

- *R17.4 cyclic base change*: Supplies actual local matching and the Satake norm normalization.
- *R17.2 twisted trace comparison*: Provides the chosen local functions and measure/central-character ledger.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Blueprint.cyclicMatching_norm` | characterisation | Matching regular norm classes have equal ordinary and twisted orbital integrals with identified centralizer measures. |
| `TauCeti.GL2Blueprint.cyclicMatching_non_norm` | characterisation | The ordinary orbital integral vanishes on regular classes that are not norms. |
| `TauCeti.GL2Blueprint.cyclicMatching_unit` | compatibility | Unramified hyperspecial units match with hyperspecial volumes one. |
| `TauCeti.GL2Blueprint.cyclicMatching_satake` | data | On an unramified Satake pair the norm rule sends (α,β) to (α^d,β^d). |
| `TauCeti.GL2Blueprint.cyclicMatching_central` | functoriality | The E central character is ω_F∘N_{E/F}; test functions use its inverse. |

**Unit tests.**

- `TauCeti.GL2Blueprint.cyclicMatching_degree_one` (degenerate): For E=F and σ=1 choose f=φ; ordinary and twisted orbital integrals agree.
- `TauCeti.GL2Blueprint.cyclicMatching_quadratic_satake` (computation): At an unramified quadratic place the pair (2,3) maps to (4,9), trace 13 and determinant 36.
- `TauCeti.GL2Blueprint.cyclicMatching_non_norm_test` (non-example): For E/F unramified quadratic, a regular γ with odd valuation of det γ cannot be a norm and its matching ordinary orbital integral is zero.

**Acceptance.**

- Residue degree one gives identity Satake transfer; determinant pulls back by norm.

**Prerequisites.** [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization), [`R17.2/quaternionic-orbital-matching`](#R17-2-quaternionic-orbital-matching), `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 1 §3 Proposition 3.1 pp. 20–22; §4 p. 32. Excerpt: “is a norm”. Match: The passage supplies the concrete cyclic norm matching input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 20 = PDF p. 36 (Clay scan, printed = PDF − 16); the proof runs to printed p. 22 = PDF p. 38, and the §4 opening is printed p. 32 = PDF p. 48; transcribed from the page image; specialisation): “we will always assume that the choice of measures dt is the same on G_γ(F) and G_{δ,σ}(F). We will prove: PROPOSITION 3.1: (i) Assume φ ∈ C_c^∞(G(E)). Then there exists f ∈ C_c^∞(G(F)) such that, for regular γ ∈ G(F): (*) Φ_f(γ) = 0 if γ is not a norm, Φ_{φ,σ}(δ) if γ = Nδ, δ ∈ G(E).” Transcribed from the page image (scan; its OCR layer is noisy); for E/F cyclic non-archimedean of characteristic 0 and G = GL(n), Proposition 3.1(i) gives f with Φ_f(γ) = Φ_{φ,σ}(δ) at regular norms γ = Nδ and 0 at non-norms, with the same measure dt on G_γ(F) and G_{δ,σ}(F), so the node's existence statement is its n = 2 case, and §4 (p. 32) states that for unramified E/F, φ ∈ ℋ_E and its base change image bφ are associated (the Hecke-function fundamental lemma); the explicit Satake rule (α,β) ↦ (α^d,β^d), the central-character pullback by the norm and the split-place product norm are not stated in these passages.

<a id="R17-2-continuous-residual-ledger"></a>

### `R17.2/continuous-residual-ledger` — The continuous and residual spectral ledger ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.2/continuous-residual-ledger` · declaration `TauCeti.GL2Blueprint.spectralLedger` · proposed module `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint` · planet **Spectral term comparison**

In the fixed-unitary-central-character GL₂ L² spectrum, identify AS.2, AS.4 and AS.6’s cuspidal terms, residual determinant characters χdet with χ²=ω, and continuous families of normalized inductions I(μ,ωμ⁻¹). The invariant trace formula includes the continuous integrals of normalized intertwining operators and their logarithmic derivatives, together with the residual/exceptional contributions prescribed by AS.6. On the anisotropic quaternion side identify norm characters χNrd and the non-norm cuspidal/discrete spectrum. For steinbergProjectorDifference, a matching χdet has trace −1; hence compare its residual term against the quaternion norm-character term rather than declaring both absent. In a cyclic quadratic comparison retain the σ-invariant induced families and their exceptional automorphic-induction terms, including the one-half Weyl weights, until the ET.4/AS.6 identities identify them. Local regular-elliptic matching alone does not remove the identity or continuous distributions.

**Hypotheses.**

- Use the same global Haar, central quotient and normalized intertwining conventions throughout; generic spectral carriers belong to AS.2, AS.4 and AS.6.

**Proof outline.**

1. Import AS.4 discrete/residual classification and AS.6 invariant distributions.
2. Insert the local projector’s traces into each part, including determinant residual constituents.
3. Apply ET.4 cyclic spectral comparison, explicitly separating induced, exceptional and cuspidal terms rather than comparing just the cuspidal sums.

**Acceptance.**

- The χdet residual trace is −1 for the norm-character projector; a trace-zero assertion on every infinite-dimensional irreducible does not prove this term vanishes.

**Prerequisites.** [`R17.2/steinberg-projector-difference`](#R17-2-steinberg-projector-difference), [`R17.2/quaternionic-orbital-matching`](#R17-2-quaternionic-orbital-matching), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching), `AutomorphicSpectralTheory:AS.4`, `AutomorphicSpectralTheory:AS.2`, `AutomorphicSpectralTheory:AS.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `AdelicAlgebraicGroups:AA.2`.

**Sources.**

- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §10 opening spectral decomposition; §11 opening comparison. Excerpt: “scamped”. Match: The passage supplies the the continuous and residual spectral ledger input or motivating calculation. The statement explicitly separates the supplier-owned general theorem from the GL₂ calculation; any unverified extension is in gaps.
  - *Assembly note, passage at this locator* (printed p. 112 = PDF p. 115 (Digital Math Archive pagination, printed = PDF − 3); the §11 opening is printed p. 129 = PDF p. 132; checked against the text layer; supporting): “The space Ls (ξ) is the direct sum of three mutually orthogonal subspaces, Lsp (ξ), L0se (ξ), and L1se (ξ), all defined in §2. The representation of G(A) on Lsp (ξ) + L0se (ξ) is denoted r.” §10 splits L_s(ξ) into the cusp forms L_sp, the span L⁰_se of the one-dimensional invariant subspaces (the residual χ∘det) and the continuous part L¹_se (defined in §2, PDF p. 14) and computes the trace of r on L_sp + L⁰_se, warning that 'the analytical aspects of the proof will be scamped'; §11 adds the quadratic exceptional term τ = ½ ⊕_S τ(η) for η^σ = η̃ ≠ η (nonzero only for ℓ = 2); the quaternion-side norm characters and the Steinberg-projector comparison of the node are not in Langlands.

<a id="R17-2-strong-cuspidal-vanishing"></a>

### `R17.2/strong-cuspidal-vanishing` — Vanishing with a strongly cuspidal local factor ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.2/strong-cuspidal-vanishing` · declaration `TauCeti.GL2Blueprint.strongCuspidalVanishing` · proposed module `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint` · planet **Cuspidal trace vanishing**

If a finite local factor f_v satisfies ∫_{N(Fv)}f_v(xny)dn=0 for every x,y∈GL₂(Fv), then its operator on every representation parabolically induced from the proper Borel is zero. Consequently the induced continuous terms and their intertwining-derivative contributions vanish for the factorizable global test function; the same operator identity kills any residual determinant character arising as a subquotient of such an induction. A supercuspidal matrix coefficient compact modulo center supplies this condition. The K-averaged constant-term identity printed for the Steinberg projector is weaker and is not substituted for this all-x,y condition.

**Hypotheses.**

- Compact-mod-center smooth test function, suitable integrability and fixed unitary central character; strong cuspidal constant-term condition for all x,y.

**Proof outline.**

1. Use the induced-model kernel formula and the all-x,y constant term to prove the induced operator is zero before taking its trace.
2. Apply AS.6’s induced/intertwining terms and pass the operator identity to residual subquotients.
3. Use SR.2/SR.3 supercuspidal matrix-coefficient cuspidality; compare JL §16’s merely K-averaged identity.

**Acceptance.**

- A Steinberg projector gives trace −1 on χdet and therefore cannot satisfy the stated all-x,y hypothesis.

**Prerequisites.** [`R16.2/supercuspidal-kirillov`](#R16-2-supercuspidal-kirillov), [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicSpectralTheory:AS.6`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), §16 equation (16.1.7), printed p.277; preceding Steinberg averaged constant term, printed p.269. Excerpt: “0”. Match: Equation (16.1.7) is K-averaged and yields induced traces zero. The stronger all-x,y condition stated here kills the whole induced operator by the requested SR.2 kernel formula; it is not attributed to the Steinberg projector. AS.6 supplies the resulting distributional vanishing.
  - *Assembly note, passage at this locator* (printed p. 277 = PDF p. 283 (and printed p. 269 = PDF p. 275); checked against the text layer; supporting): “for all a in Av = AFv then ω(γ, fv ) = 0 for all γ, θ(0, fv ) = 0, and trace ρ(fv , µv , νv , s) = 0 for all µv , νv , and s.” The sentence completes 'If ∫Kv∫Nv fv(k⁻¹ank) dn dk = 0 (16.1.7)': the K-averaged condition makes the terms ω(γ,fv) and θ(0,fv) and every induced trace vanish, and printed pp. 269–270 show ζv and ξv satisfy it; JL never state the node's stronger all-x,y condition or that the induced operator itself is zero, so the passage supports only the trace-level weaker version the node explicitly separates.

<a id="R17-2-specialized-trace-comparison"></a>

### `R17.2/specialized-trace-comparison` — The concrete quaternionic and cyclic trace comparisons ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison` · declaration `TauCeti.GL2Blueprint.specializedTraceComparison` · proposed module `TauCeti/RepresentationTheory/GL2/R172`, namespace `TauCeti.GL2Blueprint` · planet **Specialized trace comparison**

For factorizable test functions with the local matching, central-character and Haar conventions above, specialize AS.6’s invariant trace identities to GL₂/quaternion and GL₂ cyclic base change. Every regular geometric term matches with the stated sign/norm, and the identity, singular/unipotent, residual and continuous terms are compared using the full spectralLedger. Under the all-x,y local cuspidality hypothesis use strongCuspidalVanishing for precisely the indicated terms; in the Steinberg/norm-character case retain the residual correction and match its norm-character contribution. The resulting equality of distributions is the prerequisite exported to R17.3 and R17.4. Its proof requires the complete AS.6/ET.4 singular and intertwining-term comparison; the sketch in JL §16 is not accepted as that verification.

**Hypotheses.**

- Supplier invariant trace formula and local transfer valid for the stated test-function space; compatible measures, central characters, cyclic generator and full spectral-term comparisons.

**Proof outline.**

1. Match regular semisimple geometric distributions via quaternionicOrbitalMatching/cyclicMatching.
2. Compare the identity/formal-degree and singular/unipotent distributions from AS.6/ET.3 with the same measures.
3. Apply spectralLedger and only the proved cancellation hypotheses; import ET.4 for cyclic exceptional/intertwining contributions.
4. Use the resulting distribution equality downstream; record the explicit term calculations not yet verified as gaps.

**Acceptance.**

- A comparison dropping all residual terms for a Steinberg local factor is rejected; every such term must appear in the ledger.

**Prerequisites.** [`R17.2/quaternionic-orbital-matching`](#R17-2-quaternionic-orbital-matching), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching), [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger), [`R17.2/strong-cuspidal-vanishing`](#R17-2-strong-cuspidal-vanishing), `AutomorphicSpectralTheory:AS.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf)), Introduction printed p. vi and §16 opening printed p. 262. Excerpt: “not verified”. Match: The introduction explicitly warns that §16 is a sketch with unverified details. This motivates the recorded analytical gap; AS.6/ET.4, not this sketch, must supply the complete specialized trace proof.
  - *Assembly note, passage at this locator* (printed p. vi = PDF p. 6 (and printed p. 262 = PDF p. 268); checked against the text layer; supporting): “Both §15 and §16 are afterthoughts; we did not discover the results in them until the rest of the notes were almost complete. The arguments of §16 are only sketched and we ourselves have not verified all the details.” The introduction (and printed p. 262: 'a large number of analytical facts need to be verified. We have not yet verified them' and 'the theorem must remain, for the moment, conjectural') warns that §16 is a sketch, which supports the node's refusal to accept the JL sketch as the trace comparison proof; the comparison itself must come from AS.6/ET.4.

<a id="layer-R17-3"></a>

# Layer R17.3. Global Jacquet–Langlands

Global Jacquet–Langlands over a number field F. For a quaternion algebra D with ramification set S and a unitary character ω, `global-jl` is the bijection from the discrete spectrum of D×(𝔸_F) with central character ω, minus its one-dimensional members, onto the cuspidal representations of GL₂(𝔸_F) that are square-integrable at every place of S, preserving the components outside S. The one-dimensional representations χ∘Nrd are excluded (`norm-exception`).

The layer proves Hecke compatibility at split places (`split-hecke`), equality of the local factors of all twists (`local-factors`), multiplicity one and strong multiplicity one on the quaternion side (`multiplicity-one`, `strong-multiplicity-one`), and compatibility with Aut(ℂ)-conjugation and with rational models for cohomological representations (`coefficient-conjugation`, `rational-models`). It then treats the definite case with algebraic weights at infinity (`definite-infinity`), the parity of the ramification set in the indefinite case (`indefinite-parity`), the exchange of two invariants used by Colmez–Dospinescu–Nizioł (`invariant-exchange`) and the globalization of a supercuspidal through a quaternion algebra (`supercuspidal-globalization`).

**Nodes:** 12. **Planets:** Global Jacquet–Langlands correspondence, Quaternionic strong multiplicity one, Definite quaternionic transfer, Supercuspidal globalization.

<a id="R17-3-global-jl"></a>

### `R17.3/global-jl` — Global Jacquet–Langlands correspondence ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl` · declaration `TauCeti.GL2Transfer.globalJL` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Global Jacquet–Langlands correspondence**

Let F be a number field, D/F a quaternion algebra with ramification set S (finite and real places; complex places are split), fixed isomorphisms D⊗F_v ≅ M₂(F_v) for v ∉ S, and ω a unitary character of F^×\A_F^×. Let DS_D(ω) be the set of isomorphism classes of irreducible subrepresentations of the right regular representation of D×(A_F) on L²(D×(F)A_F^×\D×(A_F), ω). For nonsplit D the quotient is compact and DS_D(ω) consists of all irreducible automorphic representations with central character ω. For D = M₂(F) it consists of the cuspidal representations and the characters χ∘det with χ² = ω. There is a bijection JL_D from the members of DS_D(ω) that are not one-dimensional (not of the form χ∘Nrd) onto the cuspidal automorphic representations π of GL₂(A_F) with central character ω such that π_v is square-integrable modulo the centre at every v ∈ S. At a finite v ∈ S this means a Steinberg twist or a supercuspidal representation; at a real v ∈ S, a discrete series D_k⊗χ (k ≥ 2), whose partner is the algebraic D_v× type of dimension k−1. At v ∉ S the components agree via the fixed isomorphisms; at v ∈ S they match by the R17.1 correspondence JL_v. For D = M₂(F) it is the identity on cuspidal classes. The inverse is part of the assertion. For a non-unitary central quasi-character, twist by a real power of |Nrd| (resp. |det|); the correspondence commutes with such twists. For split D the restriction to the discrete spectrum is essential: Eisenstein constituents are automorphic, do not factor through det, and are not in the domain.

**Hypotheses.**

- F is a number field.
- D is a quaternion algebra over F with ramification set S (finite and real places, |S| even; complex places split); S = ∅ (D = M₂(F)) is allowed.
- Isomorphisms D ⊗_F F_v ≅ M₂(F_v) are fixed for every v ∉ S.
- ω is a unitary character of F^×\A_F^×, identified with the central characters on D×(A_F) and GL₂(A_F); a non-unitary quasi-character is reduced to this case by twisting with |Nrd|^s and |det|^s.
- Domain: the irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) that are not one-dimensional (not of the form χ∘Nrd).
- Codomain: cuspidal automorphic representations π of GL₂(A_F) with central character ω and π_v square-integrable modulo the centre at every v ∈ S.
- At v ∈ S the local matching is the R17.1 correspondence JL_v; at v ∉ S it is the fixed isomorphism.

**Construction.**

1. D → GL₂: the R17.2 comparison of the discrete parts of the trace formulas of D× and GL₂ gives, for π′ ∈ DS_D(ω), a D-compatible discrete series π = G(π′) of GL₂(A_F). It satisfies π_v ≅ π′_v at v ∉ S and |LJ_v|(π_v) = π′_v at v ∈ S (Badulescu–Renard Theorem 18.1(a), n = 1, d = 2). JL70 Theorem 14.4 obtains this direction through the converse theorem instead; that route is not used here.
2. Cuspidality: if π = χ∘det, then π′_v = χ_v∘det at v ∉ S and π′_v = |LJ_v|(χ_v∘det) = χ_v∘Nrd at v ∈ S, so π′ = χ∘Nrd by injectivity of G. Hence for non-one-dimensional π′, π is not one-dimensional and therefore cuspidal, by the R16.4 description of the discrete spectrum of GL₂ (cuspidal or one-dimensional).
3. Local matching at v ∈ S: π_v is a generic unitary component of a cuspidal representation. Its character does not vanish on the elliptic regular set, so it is square-integrable (R16.2 classification: principal and complementary series characters vanish there). On square-integrable representations |LJ_v| is the R17.1 correspondence JL_v (character relation with sign −1).
4. GL₂ → D: a cuspidal π with π_v square-integrable for all v ∈ S is D-compatible. By Theorem 18.1(a) it equals G(π′) for a unique π′, and π′ is not one-dimensional because G(χ∘Nrd) = χ∘det is not cuspidal. Uniqueness also follows from R16.4 strong multiplicity one and injectivity of JL_v. JL70 Theorem 16.1 states this direction but only sketches its proof.
5. For D = M₂(F), S = ∅ and G is the identity on discrete series; restricting to non-one-dimensional members gives the identity on cuspidal classes.

**Uses that determine the API.**

- *CDN20 §5.2.1 and Proposition 5.2*: Move a prescribed supercuspidal type between the two quaternionic globalizations.
- *CDN23 §4.1.2; Pan §5.5.5; HilbertModularVarietiesAndShimuraCurves R18.3–R18.4*: Identify cuspidal Hecke spectra through the common GL₂ representation, preserving local types.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Transfer.globalJL_local` | compatibility | For every place v, local(GL₂,JL_D π′,v) equals the R17.1 local transfer of local(D,π′,v), using the split-place identification at split v. |
| `TauCeti.GL2Transfer.globalJL_central` | projection | The central character of JL_D π′ is the central character of π′. |
| `TauCeti.GL2Transfer.globalJL_inverse` | equivalence | The inverse of JL_D recovers every non-one-dimensional discrete series π′ of D×(A_F). JL_D of the inverse recovers every cuspidal π with π_v square-integrable at all v ∈ S. |
| `TauCeti.GL2Transfer.globalJL_twist` | functoriality | For a unitary Hecke character χ of F, JL_D(π′⊗χ∘Nrd) = JL_D(π′)⊗χ∘det; the central character becomes ωχ². For a non-unitary χ this holds after the twist reduction to unitary central character. |
| `TauCeti.GL2Transfer.globalJL_split` | simp | For D=M₂(F), using the identity identifications, JL_D is the identity equivalence on cuspidal classes. |

**Unit tests.**

- `TauCeti.GL2Transfer.jl_split_test` (degenerate): For D=M₂(Q), JL_D fixes every cuspidal isomorphism class.
- `TauCeti.GL2Transfer.jl_steinberg_test` (compatibility): For D/Q ramified at {p,∞} and an allowed weight-two cuspidal π with π_p=St⊗χ_p, local(JL_D inverse π,p)=χ_p∘Nrd under R17.1; local characters are not discarded.
- `TauCeti.GL2Transfer.jl_inverse_test` (characterisation): For every D-compatible cuspidal π, JL_D(JL_D inverse π)=π, and the split-place components of its inverse equal π_v.
- `TauCeti.GL2Transfer.jl_eisenstein_excluded_test` (non-example): For D = M₂(Q) and unitary Hecke characters μ, ν of Q, the irreducible automorphic representation π(μ,ν) induced from μ⊗ν is not one-dimensional and does not factor through det. It is not in the domain of JL_D, because it does not occur in L²_disc(GL₂(Q)A^×\GL₂(A), μν).

**Acceptance.**

- For D/Q ramified at {p,∞}, a cuspidal π with π_p a Steinberg twist and π_∞ weight-two discrete series transfers to a quaternionic representation with one-dimensional local types at p and ∞.
- A cuspidal π whose component at a finite place of S is an unramified principal series is not in the image of JL_D.
- A local one-dimensional D_v× character is allowed; a global reduced-norm character is excluded.
- For D = M₂(Q) and unitary Hecke characters μ, ν, the irreducible Eisenstein representation π(μ,ν) is automorphic and not one-dimensional, but it is not in the domain because it does not occur in the discrete spectrum.

**Prerequisites.** `R16.1`, `R16.4`, `R17.1`, `R17.2`, `R16.2`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `AutomorphicFormsOnReductiveGroups:AF.2/flath-factorization`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`.

*Assembly note: the layer citations above, by node.*

- `R16.1` → [`R16.1/haar-quotient-comparison`](#R16-1-haar-quotient-comparison) (clear). global-jl takes from R16.1 only the GL₂ side of its spectral carrier, the space L²(GL₂(F)A_F^×\GL₂(A_F), ω) for unitary ω trivial on F^×, which haar-quotient-comparison states over a number field with the same hypotheses. The D×(A_F) analogue is not a GL₂ specialisation and should be cited from AA.2/central-character-l2 directly.
- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one), [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger) (probable). Cuspidal strong multiplicity one (agreement at finite places outside a finite set, all places recovered) is stated by R16.4/strong-multiplicity-one exactly as used in the uniqueness remark. The other input, that L²_disc(GL₂(F)A_F^×\GL₂(A_F), ω) consists of the cuspidal representations and the χ∘det with χ²=ω, is stated by no R16.4 node; the closest statement is in a different stage, R17.2/continuous-residual-ledger, which identifies the residual part of the fixed-central-character spectrum as the χdet with χ²=ω (from AS.4).
- `R17.1` → [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison), [`R17.1/norm-character-steinberg`](#R17-1-norm-character-steinberg) (probable). At finite v∈S, local-quaternionic-comparison supplies JL_v (irreducibles of D_v× ↔ essentially square-integrable representations of GL₂(F_v), character relation with sign −1) and norm-character-steinberg the case χ_v∘Nrd ↔ St⊗χ_v used in the tests. At real v∈S, real-quaternionic-comparison treats only the algebraic types Sym^{k−2}⊗det^m (m∈ℤ) ↔ D_k with the matching |det| twist, whereas global-jl allows D_k⊗χ for an arbitrary character χ, whose partner is a twist of Sym^{k−2} by χ∘Nrd and is not algebraic unless χ is.
- `R17.2` → [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison) (probable). global-jl uses the identity of the discrete parts of the GL₂ and D× trace formulas (Badulescu–Renard Theorem 18.1(a)); specialized-trace-comparison states the full GL₂/quaternion equality of distributions with the residual χdet ↔ χ∘Nrd ledger, from which that identity follows. Its local matching (quaternionic-orbital-matching) is obtained from ET.3/ET.6, which part R16.1 itself notes covers only p-adic fields, so matching functions at real places of S (Hamilton quaternions against GL₂(ℝ) discrete-series pseudo-coefficients) are not stated.
- `R16.2` → [`R16.2/local-classification`](#R16-2-local-classification), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (probable). local-classification and archimedean-classification give the lists of irreducible representations at finite and real places that global-jl uses to describe square-integrable components (Steinberg twists and supercuspidals; D_k⊗χ). Neither states the fact the proof step invokes, that characters of irreducible principal series (including complementary series) vanish on the regular elliptic set, nor identifies the square-integrable classes at finite places, so that must be added to R16.2 or requested from the induction supplier.

**Sources.**

- **br10** (Alexandru Ioan Badulescu, with an appendix by David Renard, [*Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf)), §1.5, definition of discrete series, p. 5 (preprint page = PDF page). Excerpt: “A discrete series of G0 (A) is the equivalence class of an irreducible subrepresentation of Rω0 for some smooth unitary character ω of Z(A) trivial on Z(F).”. Match: Definition used for the domain: irreducible subrepresentations of L²(G′(F)Z(A)\G′(A); ω) with ω unitary. With n = 1, d = 2 (G′ = D×) this is the whole automorphic spectrum when D is division (compact quotient); for D = M₂(F) (BR10's d = 1) it is cuspidal plus one-dimensional, hence the cuspidal restriction.
- **br10** (Alexandru Ioan Badulescu, with an appendix by David Renard, [*Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf)), §18.1, Theorem 18.1(a), p. 44 (same statement as Theorem 1.4(a), p. 6). Excerpt: “such that G(π 0 ) = π implies |LJ|v (πv ) = πv0 for all places v ∈ V , and πv = πv0 for all places v ∈ / V . The map G is injective and onto the set of D-compatible discrete series of G(A).”. Match: Specialisation n = 1, d = 2 over a number field (BR10 assumes a global field of characteristic zero). BR10's map covers all discrete series, including χ∘Nrd ↦ χ∘det; the node removes that one-dimensional branch and uses that on square-integrable representations |LJ_v| is the classical JL_v. Both directions, injectivity and the image come from here.
- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §14, Theorem 14.4, printed p. 247 of the IAS retypeset edition (PDF p. 253); printed pages of that edition, not the Springer LNM 114 pagination. Excerpt: “Theorem 14.4. If π ′ is a constituent of A′ and πv′ is infinite-dimensional at any place where M ′ splits then π is a constituent of A0 .”. Match: Classical D→GL₂ direction for M′ division (§14 assumes the quotient compact), proved through Corollary 14.3 and the converse theorem. JL70 assumes π′_v infinite-dimensional at every split place rather than 'not χ∘ν'. JL70's §16 introduction restates it as 'not of the form χ∘ν'.
- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §16, Theorem 16.1, printed p. 261 of the IAS retypeset edition (PDF p. 267); printed pages of that edition, not the Springer LNM 114 pagination. Excerpt: “If for every v in S the representation πv is special or absolutely cuspidal then for every v there is a representation πv′ such that πv = π(πv′ ) and π ′ =”. Match: The inverse direction, with the source's local condition: π_v special (Steinberg twist; at real places JL70's 'special' σ(µ₁,µ₂) is the discrete series) or absolutely cuspidal at each v in the non-split set S. The text layer drops the tensor sign in 'π′ = ⊗π′_v'.
- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §16, paragraph after Theorem 16.1, printed p. 261 of the IAS retypeset edition (PDF p. 267); printed pages of that edition, not the Springer LNM 114 pagination. Excerpt: “We must stress that the sketch is merely a formal argument so that the theorem must remain, for the moment, conjectural.”. Match: Proof status: JL70 only sketches Theorem 16.1. The unconditional inverse used here is BR10 Theorem 18.1(a), which rests on the Arthur–Clozel trace comparison (the R17.2 input).

<a id="R17-3-norm-exception"></a>

### `R17.3/norm-exception` — The reduced-norm character exception

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception` · declaration `TauCeti.GL2Transfer.norm_exception` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let D/F be a nonsplit quaternion algebra with ramification set S and χ a Hecke character of F^×\A_F^×. The one-dimensional automorphic representation χ∘Nrd of D×(A_F) is not in the domain of the cuspidal JL bijection. Its classical local transfers are: St_v⊗χ_v at finite v ∈ S, the weight-two discrete series twisted by χ_v at real v ∈ S, and the one-dimensional χ_v∘det at v ∉ S. Their restricted tensor product therefore has one-dimensional components at almost all places and is not cuspidal. JL70 notes that it acts on no subspace of the automorphic forms on GL₂(A_F), and leaves open whether it is a constituent. In Badulescu–Renard's extended discrete-spectrum correspondence (χ unitary), χ∘Nrd corresponds instead to the residual one-dimensional discrete series χ∘det of GL₂(A_F). There the local map |LJ_v| sends χ_v∘det to χ_v∘Nrd. So |LJ_v| agrees with classical JL_v on square-integrable representations but is not injective on all compatible unitary ones, since both χ_v∘det and St_v⊗χ_v go to χ_v∘Nrd. The two branches must not be identified.

**Hypotheses.**

- D/F is a nonsplit quaternion algebra over a number field F, with ramification set S ≠ ∅.
- χ is a Hecke character of F^×\A_F^×; for the Badulescu–Renard comparison χ is unitary.
- Local transfers at v ∈ S are the R17.1 correspondence; at v ∉ S the fixed isomorphisms are used.

**Proof outline.**

1. Compute the components of χ∘Nrd: χ_v∘det at v ∉ S, and JL_v(χ_v∘Nrd) = St_v⊗χ_v (finite v) or the twisted weight-two discrete series (real v) at v ∈ S, by the explicit R17.1 character/Steinberg calculation.
2. Local components of a cuspidal representation of GL₂(A_F) are generic, hence infinite-dimensional (R16.4 Whittaker model, R16.2 classification). Since almost all components above are one-dimensional, the product is not cuspidal.
3. For the extended branch, read off from Badulescu–Renard Proposition 15.3(a) and Theorem 18.1(a) that G(χ∘Nrd) = χ∘det. This branch is kept separate from global-jl.

**Acceptance.**

- A global norm character is excluded even though every division-place character has a valid local transfer.
- For D/Q ramified at {p,∞} and χ trivial, the classical local transfers are St_p and the weight-two discrete series at ∞, with trivial components elsewhere: not cuspidal. The extended transfer of the trivial character is the trivial representation of GL₂(A_Q).

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), `R16.2`, `R17.1`, `R16.4`.

*Assembly note: the layer citations above, by node.*

- `R16.2` → [`R16.2/local-classification`](#R16-2-local-classification) (clear). norm-exception needs that, at finite places, components of a cuspidal representation are generic and hence not one-dimensional; local-classification states that infinite-dimensional irreducibles are generic and one-dimensional characters are not, over every characteristic-zero nonarchimedean local field, which covers every finite completion.
- `R17.1` → [`R17.1/norm-character-steinberg`](#R17-1-norm-character-steinberg), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison) (probable). At finite v∈S, norm-character-steinberg states JL_v(χ_v∘Nrd)=St⊗χ_v with its parameter and factors, exactly as used. At real v∈S the node needs χ_v∘Nrd ↦ D₂⊗χ_v for an arbitrary Hecke character χ, but real-quaternionic-comparison covers only algebraic types (trivial ↦ D₂ and det^m twists with m∈ℤ), so the twist by |Nrd|^s with non-integral s is not stated.
- `R16.4` → [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one) (clear). The fact used is that every local component of a cuspidal π has a Whittaker model; global-multiplicity-one states that the Whittaker coefficient realizes π as the restricted tensor product of the local Whittaker models, over any number field, so each π_v is generic.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §14, paragraph after Theorem 14.4, printed p. 247 of the IAS retypeset edition (PDF p. 253); printed pages of that edition, not the Springer LNM 114 pagination. Excerpt: “If π ′ is of this form then all but a finite number of the representations πv are one-dimensional. But if M ′ does not split at v the representation πv is infinite-dimensional. Thus π cannot act on a subspace of A.”. Match: Exact for the classical branch: for π′ = χ∘ν, ⊗_v π(π′_v) has one-dimensional components at split places and infinite-dimensional ones at nonsplit places, so it is not cuspidal. JL70 leaves open whether it is a constituent of A ('we prefer to leave the question unsettled'); the node does not claim either way.
- **br10** (Alexandru Ioan Badulescu, with an appendix by David Renard, [*Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf)), §15, Proposition 15.3(a), p. 39, with Theorem 18.1(a), p. 44. Excerpt: “u(δ, k) is d-compatible if and only if either d| deg(δ) or d|k deg(δ)”. Match: Take d = 2, δ = χ_v (deg = l = 1), k = 2: u(χ_v,2) = χ_v∘det is compatible, so the residual χ∘det is D-compatible and, by Thm 18.1(a), equals G(χ∘Nrd). In the extended transfer, |LJ_v| sends χ_v∘det (not St⊗χ_v) to χ_v∘Nrd. The text layer drops the denominator l(δ) of the second condition.

<a id="R17-3-split-hecke"></a>

### `R17.3/split-hecke` — Split-place Hecke compatibility

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke` · declaration `TauCeti.GL2Transfer.split_hecke` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let π′ and π = JL_D π′ be as in global-jl. At every finite v ∉ S the fixed algebra identification identifies their local representations, hence their K_v-invariant modules for every compact open K_v and the action of the local Hecke algebra on them. In particular, at a spherical v the eigenvalues t_v of T_v = [K_v diag(ϖ_v,1)K_v] and s_v of S_v = [K_v diag(ϖ_v,ϖ_v)K_v] agree. Consequently the arithmetic degree-two Euler polynomial 1 − a_v X + b_v X², with a_v = t_v and b_v = q_v s_v, agrees; its reciprocal is the polynomial X² − T_vX + N(v)S_v of CDN23. This does not assert an integral global Hecke-module isomorphism, equality of multiplicities at unrelated levels, or spherical vectors at division places.

**Hypotheses.**

- π′ is in the domain of global-jl and π = JL_D π′.
- v is a finite place of F not in the ramification set S, with D⊗F_v ≅ M₂(F_v) fixed, and K_v ⊂ D_v× corresponds to GL₂(O_{F_v}) (or any compact open subgroup transported by the same isomorphism).
- Hecke operators are the unnormalized double cosets T_v = [K_v diag(ϖ_v,1)K_v] and S_v = [K_v diag(ϖ_v,ϖ_v)K_v] (R16.2 arithmetic normalization); q_v is the residue cardinality.

**Proof outline.**

1. Use globalJL_local with the split identification, then functoriality of the supplied local invariant-vector/Hecke action.
2. Read off both arithmetic generators, using the R16.2 normalization rather than an unrecorded unitary scaling.

**Acceptance.**

- Keep the determinant coefficient b_v, not only the trace a_v.
- A ramified-place U_v comparison requires a separate local-type calculation.

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), `R16.2`.

*Assembly note: the layer citations above, by node.*

- `R16.2` → [`R16.2/iwahori-center`](#R16-2-iwahori-center) (probable). split-hecke needs the unnormalized spherical coset operators T_v=[K_v diag(ϖ_v,1)K_v] and S_v=[K_v diag(ϖ_v,ϖ_v)K_v]; the only R16.2 node naming spherical generators is iwahori-center, which obtains T₁, T₀ as e_K-images of z₁, U₀ under the normalization vol(I)=1, without defining them as these coset operators or giving their spherical eigenvalues q_v^{1/2}(α+β) and αβ. Part R16.1 states those eigenvalues only over ℚ (in R16.4/cohomological-rationality), so the arithmetic Hecke normalization over a general number field is not stated as such.

**Sources.**

- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.3, p. 39 (journal page = PDF page). Excerpt: “induit un morphisme Tuniv 𝑆 → 𝑘 𝐿 envoyant 𝑇𝑣 (respectivement 𝑆 𝑣 ) sur tr( ¯𝜌(Frob 𝑣 )) (respectivement N(𝑣) −1 det( ¯𝜌(Frob 𝑣 ))).”. Match: Consumer statement only. CDN23 uses both arithmetic generators, T_v = [U_v diag(ϖ_v,1)U_v] and S_v = [U_v diag(ϖ_v,ϖ_v)U_v] (footnote 27), with S_v ↦ N(v)^{-1}det. The node's b_v = q_v s_v is this normalization. The equality of eigenvalues across the transfer is not stated in CDN23.
- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.4, p. 41. Excerpt: “telle que le polynôme caractéristique de 𝜌𝔪 (Frob 𝑣 ) soit 𝑋 2 − 𝑇𝑣 𝑋 + 𝑁 (𝑣)𝑆 𝑣 pour 𝑣 ∉ 𝑆”. Match: Consumer use: the degree-two polynomial X² − T_vX + N(v)S_v, the reciprocal of the node's 1 − a_vX + b_vX², with the same T^univ_S acting on the Shimura-curve side through the identification (4.6).
- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.2, p. 39. Excerpt: “que l’on identiﬁe aussi à un sous-groupe ouvert compact de Ǧ(A𝔭𝑓 ) par l’isomorphisme G(A𝔭𝑓 ) ≃ Ǧ(A𝔭𝑓 ) induit par (4.6).”. Match: The fixed away-place identification through which the same level and Hecke operators act on both quaternionic groups; in the node this is the fixed split-place isomorphism.

<a id="R17-3-local-factors"></a>

### `R17.3/local-factors` — Local factors of quaternionic transfer

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors` · declaration `TauCeti.GL2Transfer.local_factors` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For π′ in the domain of global-jl, π = JL_D π′, a fixed nontrivial additive character ψ = ⊗ψ_v of F\A_F, every place v and every quasi-character ω_v of F_v^×: L(s, ω_v⊗π_v) = L(s, ω_v⊗π′_v), L(s, ω_v^{-1}⊗π̃_v) = L(s, ω_v^{-1}⊗π̃′_v) and ε(s, ω_v⊗π_v, ψ_v) = ε(s, ω_v⊗π′_v, ψ_v). Here, at v ∈ S, the factors of π′_v are JL70's and the GL₂ factors are in the R16.3 normalization; at v ∉ S the equalities are the fixed identification. In this normalization the local functional equation of the zeta integrals on D_v carries the extra sign h_v = −1 for v ∈ S. If instead the constant of that functional equation is taken as the ε-factor of π′_v, then ε(s, ω_v⊗π′_v, ψ_v) = −ε(s, ω_v⊗π_v, ψ_v) at each v ∈ S, and the global product of these signs is (−1)^{|S|} = 1. Hence for every Hecke character ω the completed L-functions agree, L(s, ω⊗π′) = L(s, ω⊗π), as do the global ε-factors and the functional equations, with compatible measures and the same ψ.

**Hypotheses.**

- π′ is in the domain of global-jl and π = JL_D π′; S is the ramification set of D.
- ψ = ⊗ψ_v is a fixed nontrivial additive character of F\A_F, and the same ψ_v is used on D_v× and on GL₂(F_v).
- ω_v ranges over all quasi-characters of F_v^×, and ω over all Hecke characters of F.
- At v ∈ S the factors of π′_v are JL70's; at v ∉ S they are those of the GL₂-representation via the fixed isomorphism; the GL₂ factors are in the R16.3 normalization.

**Proof outline.**

1. At v ∈ S apply the R17.1 local-factor compatibility of JL_v for all character twists (JL70 characterises π_v by these equalities); at v ∉ S use the fixed identification.
2. Take products over all places. The GL₂ standard L-functions of twists, their continuation and functional equations come from the R16.5 integral models; the signs h_v cancel because |S| is even (ClassFieldTheory parity, as in JL70 §14).

**Acceptance.**

- A character on D_v× matches the L-factor of a Steinberg twist, not the two-factor spherical polynomial of χ_v∘det.
- With the Godement–Jacquet constant on D_v, ε(s, χ_v∘Nrd, ψ_v) = −ε(s, St_v⊗χ_v, ψ_v) at v ∈ S; the signs cancel in the global ε-factor because |S| is even.

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), `R16.3`, `R17.1`, `R16.5`.

*Assembly note: the layer citations above, by node.*

- `R16.3` → [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison) (clear). local-factors uses the GL₂ local L- and ε-factors of every twist of a square-integrable π_v at v∈S: Steinberg twists (steinberg-monodromy), supercuspidals including wild dyadic ones (supercuspidal-parameter), the ε conductor and additive-character rules (conductor-epsilon-comparison) and real discrete series D_k⊗|·|^t (archimedean-factor-comparison). These are stated in the unitary rec normalization, the one matching JL70's factors; the citing node should name it rather than leave the Tate normalization recᵀ possible.
- `R17.1` → [`R17.1/wild-dyadic-transfer`](#R17-1-wild-dyadic-transfer), [`R17.1/norm-character-steinberg`](#R17-1-norm-character-steinberg), [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison) (probable). local-factors needs that JL_v preserves L and ε for every character twist, with the factors of π′_v in JL70's Godement–Jacquet normalization on D_v× (sign h_v=−1). wild-dyadic-transfer states that the D_v× preimage has the same parameter and standard factors at every finite place (norm-character-steinberg for χ∘Nrd, local-quaternionic-comparison for twist compatibility), but no R17.1 node identifies these with JL70's zeta-integral factors on D_v× or states h_v=−1, and at real places of S only the GL₂-side factor is given (real-quaternionic-comparison).
- `R16.5` → [`R16.5/whittaker-integral-comparison`](#R16-5-whittaker-integral-comparison), [`R16.5/global-epsilon-normalization`](#R16-5-global-epsilon-normalization) (clear). The GL₂ side needs the completed L(s,ω⊗π) of a cuspidal π for every Hecke character ω, with continuation and functional equation for fixed ψ; whittaker-integral-comparison factors the twisted Mellin integral into the AL.2 local factors and imports continuation, and global-epsilon-normalization states the functional equation with ε the product of local root numbers, independent of ψ, applied to the cuspidal twist π⊗ω.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §14, before Theorem 14.4, printed p. 247 of the IAS retypeset edition (PDF p. 253); printed pages of that edition, not the Springer LNM 114 pagination. Excerpt: “In both cases πv is defined unambiguously by the following relations L(s, ωv ⊗ πv ) = L(s, ωv ⊗ πv′ )”. Match: Exact for the local statement: JL70 defines π_v = π(π′_v) by equality of the L-factors of all twists, of the contragredients' L-factors and of the ε-factors (next lines). The ε on D_v is JL70's constant, whose local functional equation carries the extra sign h_v.
- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §14, before Theorem 14.4, printed p. 247 of the IAS retypeset edition (PDF p. 253); printed pages of that edition, not the Springer LNM 114 pagination. Excerpt: “ε(s, ωv ⊗ πv , ψv ) = ε(s, ωv ⊗ πv′ , ψv ) which holds for all quasi-characters ωv of Fv× .”. Match: The ε-equality and the quantifier over all local quasi-characters ω_v: this supports 'including after every local character twist'.
- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §14, proof of Theorem 14.2, printed p. 241 (PDF p. 247). Excerpt: “The factor hv is 1 of G′Fv is isomorphic to GL(2, Fv ) and is −1 otherwise.”. Match: Normalization: the zeta-integral functional equation on D_v involves h_v ε(s, π′_v, ψ_v), with h_v = −1 at nonsplit v. On printed p. 247 the product of the h_v is shown to be 1. ('of' is a misprint for 'if' in this edition.)

<a id="R17-3-strong-multiplicity-one"></a>

### `R17.3/strong-multiplicity-one` — Quaternionic strong multiplicity one ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one` · declaration `TauCeti.GL2Transfer.strong_multiplicity_one` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Quaternionic strong multiplicity one**

Let π′ and σ′ be discrete series of D×(A_F): irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) for a unitary ω. For nonsplit D these are, up to a twist by |Nrd|^s, all irreducible automorphic representations. Assume they are not one-dimensional. If π′_v ≅ σ′_v for all finite v outside a finite set, then π′ ≅ σ′. In particular their components away from a finite set of places determine the components in that set, for example at a distinguished ramified place. This is a theorem about global representations, not a statement that one local Hecke scalar determines a local type.

**Hypotheses.**

- F is a number field and D/F a quaternion algebra.
- π′ and σ′ are discrete series of D×(A_F) (irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) for unitary ω), not one-dimensional; for nonsplit D this covers every irreducible automorphic representation up to a twist by |Nrd|^s.
- π′_v ≅ σ′_v for all finite places v outside a finite set.

**Proof outline.**

1. Agreement of the central characters at almost all places forces the same ω. Transfer both to cuspidal GL₂ by global-jl; the transfers agree at almost all split places, so they are isomorphic by R16.4 strong multiplicity one.
2. Use injectivity of global JL (equivalently of each JL_v) to return to D× (Badulescu–Renard Theorem 18.1(b) states the result directly).

**Acceptance.**

- CDN20 Proposition 5.2: the representation away from 𝔭 determines the component at 𝔭.
- For D = M₂(Q), the constituents of the representation induced from χ|·|^{1/2}⊗χ|·|^{-1/2} with Steinberg components exactly at {p}, resp. exactly at {q}, agree at almost all places but are not isomorphic. They are not discrete series, so the discrete-series hypothesis cannot be dropped.

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), `R16.4`.

*Assembly note: the layer citations above, by node.*

- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (clear). The node transfers π′ and σ′ to cuspidal GL₂ representations that agree at almost all finite places; R16.4/strong-multiplicity-one states that cuspidal π, π′ over a number field isomorphic at all finite places outside a finite set are isomorphic, with the same hypotheses.

**Sources.**

- **br10** (Alexandru Ioan Badulescu, with an appendix by David Renard, [*Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf)), §1.5, Theorem 1.4(c), p. 6 (preprint page = PDF page). Excerpt: “(c) If π 0 , π 00 ∈ DS 0 , if πv0 ≃ πv00 for almost all v, then π 0 = π 00 (Strong Multiplicity One Theorem).”. Match: Specialisation n = 1, d = 2 (D division quaternion, F a number field) of SMO for discrete series of G′(A) = GL_n(D)(A). The node adds 'not one-dimensional' only to align with global-jl (BR10 needs no such restriction).
- **br10** (Alexandru Ioan Badulescu, with an appendix by David Renard, [*Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf)), §18.1, Theorem 18.1(b), second sentence, p. 44. Excerpt: “If two discrete series of G0 (A) have isomorphic local component at almost every place, then they are equal.”. Match: Same statement in §18 (without the condition on archimedean places that Badulescu 2008 needed); the first sentence of 18.1(b) is multiplicity one, the second is strong multiplicity one.
- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)), §5.2.1, proof of Proposition 5.2, author p. 45 (author pagination = PDF page). Excerpt: “Πpf détermine Πp (théorème de multiplicité 1 fort)”. Match: Consumer use: the away-𝔭 finite part determines the 𝔭-component (CDN20 writes p for 𝔭).

<a id="R17-3-multiplicity-one"></a>

### `R17.3/multiplicity-one` — Multiplicity one in the non-norm spectrum

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one` · declaration `TauCeti.GL2Transfer.multiplicity_one` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For a fixed unitary central character ω, every non-one-dimensional discrete series π′ of D×(A_F) occurs with multiplicity exactly one in L²_disc(D×(F)A_F^×\D×(A_F), ω). Together with local invariant-vector dimensions this computes its contribution at any fixed finite level; it does not say that the full level space is one-dimensional.

**Hypotheses.**

- F is a number field and D/F a quaternion algebra.
- ω is a fixed unitary character of F^×\A_F^× and the spectrum is L²_disc(D×(F)A_F^×\D×(A_F), ω).
- π′ is a discrete series of D×(A_F) with central character ω, not one-dimensional.

**Proof outline.**

1. The R17.2 comparison of discrete spectra gives m_D(π′) = m_{GL₂}(JL_D π′) for π′ in the domain of global-jl (Badulescu–Renard Theorem 18.1(b) for n = 1, d = 2).
2. R16.4 GL₂ multiplicity one gives m_{GL₂}(JL_D π′) = 1; work with the fixed central character ω rather than counting twists together.

**Acceptance.**

- An old level can have an invariant-vector space of dimension greater than one while global spectral multiplicity remains one.
- For D = M₂(F) the statement is GL₂ cuspidal multiplicity one.

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), `R17.2`, `R16.4`.

*Assembly note: the layer citations above, by node.*

- `R17.2` → [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison) (probable). The node uses m_D(π′)=m_{GL₂}(JL_D π′), obtained from the GL₂/D× comparison of discrete spectra with multiplicities; specialized-trace-comparison states the full equality of distributions with the residual ledger, from which this follows by separating representations, but the multiplicity identity itself is not stated. As for global-jl, its local matching rests on ET.3/ET.6 (p-adic), so the real places of S are not covered.
- `R16.4` → [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one) (clear). global-multiplicity-one states multiplicity one for every cuspidal representation of GL₂(A_F) in the cuspidal spectrum with fixed central character; for non-one-dimensional π this is its multiplicity in L²_disc, and R16.4/cuspidal-tensor-factorization (a prerequisite of that node) identifies the smooth and Hilbert-space multiplicities.

**Sources.**

- **br10** (Alexandru Ioan Badulescu, with an appendix by David Renard, [*Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf)), §1.5, Theorem 1.4(b), p. 6 (preprint page = PDF page). Excerpt: “(b) If π 0 ∈ DS 0 , then the multiplicity of π 0 in the discrete spectrum is one (Multiplicity One Theorem).”. Match: Specialisation n = 1, d = 2 of multiplicity one for all discrete series of G′(A); the node restates it for the non-one-dimensional ones (the one-dimensional case is elementary).
- **br10** (Alexandru Ioan Badulescu, with an appendix by David Renard, [*Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf)), §18.1, Theorem 18.1(b), first sentence, p. 44. Excerpt: “The multiplicity of every discrete series of G0 (A) in the discrete spectrum is 1.”. Match: Same statement in §18; BR10 notes that multiplicity one for GL_n itself is due to Shalika and Piatetski-Shapiro.

<a id="R17-3-coefficient-conjugation"></a>

### `R17.3/coefficient-conjugation` — Coefficient conjugation of global transfer

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation` · declaration `TauCeti.GL2Transfer.coefficient_conjugation` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let F be totally real, D/F a quaternion algebra with ramification set S, and π = JL_D π′ cohomological: π_v is a discrete series of weight k_v ≥ 2 at every real place, all k_v of the same parity. Suppose, by the R16.4 rationality interface, that for σ ∈ Aut(C) the conjugate σπ_f is the finite part of a cuspidal cohomological π^σ, whose weights are those of π permuted by σ acting on the real embeddings. Then π^σ is again D-compatible: square-integrability at finite places of S is preserved by σ, and all real components are discrete series. Its inverse transfer π′^σ := JL_D^{-1}(π^σ) has finite part σπ′_f, the σ-conjugated algebraic infinity type, and central character with finite part σ∘ω_f. Hence Q(π′_f) = Q(π_f), and both equal the field generated by the arithmetic away-S Hecke eigenvalues (a_v, b_v). This holds only in the cohomological setting supplied by R16.4; it is not a claim of rationality for Maass forms or weight-one Artin forms.

**Hypotheses.**

- F is a totally real number field, D/F a quaternion algebra with ramification set S.
- π = JL_D π′ is cohomological: at every real place v, π_v is a discrete series of weight k_v ≥ 2, all k_v of the same parity; at real v ∈ S, π′_v is the matching algebraic D_v× type.
- The R16.4 rationality interface: for σ ∈ Aut(C), σπ_f is the finite part of a cuspidal cohomological π^σ with weights permuted by σ.
- Hecke eigenvalues are in the arithmetic normalization of split-hecke (a_v = t_v, b_v = q_v s_v), v ∉ S finite.

**Proof outline.**

1. σ maps Steinberg twists and supercuspidals of GL₂(F_v) to representations of the same kind, so π^σ is D-compatible and π′^σ = JL_D^{-1}(π^σ) exists by global-jl.
2. At finite v ∈ S, JL_v(σπ′_v) = σJL_v(π′_v), since the defining character relation Θ_{π_v} = −Θ_{π′_v} is preserved by σ (Aut(C)-equivariance of the R17.1 correspondence). At split finite v, π′^σ_v = π^σ_v = σπ_v = σπ′_v. Hence π′^σ_f ≅ σπ′_f.
3. By split-hecke, the split Hecke eigenvalues of π′ and π coincide and conjugate coefficientwise. By strong multiplicity one (R16.4 and strong-multiplicity-one), σπ_f ≅ π_f iff σ fixes these eigenvalues; the same holds on the D side. This gives the equality of fields.

**Acceptance.**

- Changing the arithmetic normalization changes the determinant scalar; state the normalization before comparing coefficient fields.
- For D/Q ramified at {p,∞} and π attached to a weight-two newform f of trivial character with π_p Steinberg, the field generated by the quaternionic away-pN Hecke eigenvalues is the Hecke field Q(a_ℓ(f) : ℓ ∤ pN) of f.

**Prerequisites.** [`R17.3/split-hecke`](#R17-3-split-hecke), [`R17.3/strong-multiplicity-one`](#R17-3-strong-multiplicity-one), `R16.4`, [`R17.3/global-jl`](#R17-3-global-jl), `R17.1`, `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`.

*Assembly note: the layer citations above, by node.*

- `R16.4` → [`R16.4/cohomological-rationality`](#R16-4-cohomological-rationality), [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (probable). The node uses Clozel's theorem that σπ_f is the finite part of a cuspidal cohomological π^σ with weights permuted by σ, and strong multiplicity one to identify Q(π_f) with the field of the away-S eigenvalues (a_v,b_v). cohomological-rationality imports Clozel rationality for regular algebraic cuspidal GL₂ and uses strong-multiplicity-one for the Hecke-field identification, but states the existence of π^σ only implicitly (by specializing the semilinear Galois conjugation) and describes the eigenvalue field only for holomorphic newforms over ℚ, not for (a_v,b_v) over a totally real F.
- `R17.1` → [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison) (probable). The node uses JL_v(σρ)=σJL_v(ρ) for σ∈Aut(ℂ) at finite v∈S, deduced from the character relation Θ_{JL(ρ)}=−Θ_ρ, which local-quaternionic-comparison states. No R17.1 node states Aut(ℂ)-equivariance or the identity Θ_{σπ}=σ∘Θ_π that the deduction needs, so that step rests on the citing node; the real-place algebraic types come from real-quaternionic-comparison through global-jl.

**Sources.**

- **pan26** (Lue Pan, [*On locally analytic vectors of the completed cohomology of modular curves II*](https://arxiv.org/pdf/2209.06366v1)), §5.5.5, p. 75 (arXiv v1 page = PDF page). Excerpt: “By the Jacquet-Langlands correspondence, this action is semi-simple, and moreover for k ≥ 1, there is a natural decomposition into eigenspaces”. Match: Consumer statement only. Pan uses global JL to identify the Hecke eigensystems λ: T_S → C on quaternionic forms with those of classical cusp forms. This implies the eigenvalue fields agree but says nothing about σ ∈ Aut(C) or models. The Aut(C) assertion is a standard consequence of R16.4 rationality, Aut(C)-equivariance of JL_v and strong multiplicity one, and is not in this source.

<a id="R17-3-rational-models"></a>

### `R17.3/rational-models` — Rational-model comparison under transfer

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models` · declaration `TauCeti.GL2Transfer.rational_models` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let (π′, π) be the cohomological JL pair of coefficient-conjugation, and L ⊂ C a field containing Q(π_f) = Q(π′_f). A p-adic coefficient field such as CDN20's is used through a fixed isomorphism C ≅ Q̄_p. (i) If π′_f and π_f have L-models, then at every finite v ∉ S the fixed identification gives an L-linear isomorphism of the L-models of π′_v and π_v, hence of their K_v-invariants with Hecke actions; the arithmetic Hecke eigensystems agree in L and after every extension of L. The models are absolutely irreducible, so isomorphism over C descends to L. (ii) Equality of the fields of rationality does not by itself give an L-model of π′_f: a Schur/descent obstruction at places of S may force a finite extension of L. Consumers therefore fix L large enough. CDN20 §5.2.1 requires the Shimura-curve representation to be defined over its coefficient field L and allows a finite extension of L (footnote 21).

**Hypotheses.**

- (π′, π) is a cohomological JL pair as in coefficient-conjugation.
- L ⊂ C is a field containing Q(π_f) = Q(π′_f); a p-adic coefficient field is reached through a fixed isomorphism C ≅ Q̄_p.
- Models: L-structures on π′_f and π_f stable under the group actions, when they exist; for GL₂ they are supplied, with any descent condition, by the R16.4 interface.
- Hecke eigenvalues are in the arithmetic normalization of split-hecke.

**Proof outline.**

1. Apply split-hecke and coefficient-conjugation to the common arithmetic Hecke eigencharacter. At v ∉ S, Hom_L(π′_{v,L}, π_{v,L}) ⊗_L C = Hom_C(π′_v, π_v) ≠ 0 for finitely generated admissible models, so the C-isomorphism descends.
2. Take GL₂-side models from R16.4 and retain, rather than silently erase, any descent obstruction on the D× side.

**Acceptance.**

- Over CDN20's coefficient field L (a finite extension of Q_p), a comparison that keeps L fixed without permitting the finite extension of footnote 21 is stronger than the source.
- At a split place, isomorphism of L-models follows from isomorphism over C; no further descent datum is needed there.

**Prerequisites.** [`R17.3/coefficient-conjugation`](#R17-3-coefficient-conjugation), `R16.4`, [`R17.3/split-hecke`](#R17-3-split-hecke), `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`.

*Assembly note: the layer citations above, by node.*

- `R16.4` → [`R16.4/cohomological-rationality`](#R16-4-cohomological-rationality) (clear). The GL₂-side L-models of π_f are the Q(π)-models of Clozel imported in cohomological-rationality for regular algebraic cuspidal GL₂ over a number field, which includes the cohomological totally real case; extending scalars from Q(π) gives L-models for every L⊇Q(π_f).

**Sources.**

- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)), §5.2.1, author p. 44 (author pagination = PDF page). Excerpt: “Π̌ ∈ SD2,n définie (21) sur L et telle que Π̌p = JL(M).”. Match: Consumer statement only. CDN20 requires the Shimura-curve automorphic representation to be defined over L, a finite extension of Q_p (complex representations are viewed over Q̄_p through a fixed isomorphism, footnote 24). CDN20 does not compare rational models across the transfer; 'p' is 𝔭 in the text layer.
- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)), §5.2.1, footnote 21, author p. 44. Excerpt: “21. Pour pouvoir globaliser [9] il faut ajuster le caractère central, et donc on peut être amené à tordre tout par un caractère (et donc à changer $) ; cela peut aussi demander de remplacer L par une extension finie.”. Match: Consumer: the finite extension of L is permitted for the globalization (Clozel [9]). The node uses only that consumers fix L large enough. The text layer renders ϖ as '$'.

<a id="R17-3-definite-infinity"></a>

### `R17.3/definite-infinity` — Definite quaternionic weights and cuspidal transfer ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity` · declaration `TauCeti.GL2Transfer.definite_infinity` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Definite quaternionic transfer**

Let F be totally real and D ramified at every real place. A representation π′ in the domain of global-jl whose real components are irreducible algebraic representations of D_v× ≅ H× (of the highest weights normalized by R17.1) transfers to a cuspidal π whose real components are discrete series with the same infinitesimal characters (Sym^{k−2} ↔ D_k). Over Q with D ramified exactly at {p,∞}, take Pan's space A_{(k,0)} = A_{D,−χ}, χ = (−k,0), of W^{(k,0)}-valued quaternionic forms. Here W^{(k,0)} has highest weight (k,0) and is the dual of the irreducible algebraic D_p×-representation of highest weight (0,−k). For k ≥ 1, A_{(k,0)} decomposes under T_S into eigenspaces indexed by cuspidal π of GL₂(A_Q) such that π_∞ has the infinitesimal character of the algebraic GL₂-representation of highest weight (0,−k), (π^∞)^{K^p} ≠ 0, and π_p is special or supercuspidal. So the spectrum lies in σ^{K^p}_{k+2,1}, the T_S-spectrum on M_{k+2}(K^p)·t, where GL₂(A_f) acts on t through the cyclotomic character. For k = 0, A_{(0,0)} = A^c ⊕ A^1 with A^1 the forms factoring through Nrd: norm-factor eigenforms have weight-zero spectrum σ_0^{K^p}, and the weight-two cuspidal branch σ^{K^p}_{2,1} lives on A^c. So the norm-factor subspace must be removed to get the weight-two cuspidal branch. Construction of the algebraic form space and its identification with automorphic representations of D×(A_Q) remain the R18.3 owner's work.

**Hypotheses.**

- F is totally real and D/F is ramified at every real place.
- π′ is in the domain of global-jl and its real components are irreducible algebraic representations of D_v× ≅ H× (up to the fixed twist), with highest weights normalized by R17.1.
- For the Pan specialisation: F = Q, D ramified exactly at {p,∞}, χ = (−k,0) with k ≥ 0, K^p ⊂ GL₂(A_f^p) ≅ (D⊗A_f^p)× via Pan's identification (main involution), and T_S = Z_p[T_ℓ, S_ℓ : ℓ ∉ S].
- Pan's coefficient field is the p-adic C (completion of Q̄_p); the algebraic form space and its comparison with complex automorphic forms are supplied by R18.3.

**Proof outline.**

1. Apply global JL to the non-norm automorphic spectrum and translate the real type with the R17.1 normalization.
2. Track Pan's dual highest-weight convention (W^{(−n₁,−n₂)} dual to highest weight (n₂,n₁)) and the t-power twist before identifying classical arithmetic Hecke generators. At k = 0, separate A^1 (Definition 5.4.11(2)–(3)), whose eigenforms are the norm characters.
3. Export this representation-theoretic comparison to R18.3, which constructs the actual algebraic form space.

**Acceptance.**

- For k=0, treating all quaternionic forms as weight-two cusp forms gives a false result.
- The statement exports spectral data; it does not import R18.3 back into R17.3.
- For k ≥ 1, A^1_{D,(k,0)} = 0, since norm-factor forms exist only when n₁ = n₂.

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/split-hecke`](#R17-3-split-hecke), `R17.1`, `R16.6`.

*Assembly note: the layer citations above, by node.*

- `R17.1` → [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison) (clear). The node transfers algebraic real types of H× to discrete series with Sym^{k−2} ↔ D_k; real-quaternionic-comparison states this for Sym^{k−2}⊗det^m with k≥2 and m∈ℤ, with the explicit |det| twist (trivial ↦ D₂ at k=2), which is the algebraic setting the node assumes.
- `R16.6` → [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights), [`R16.6/primitive-classical-bijection`](#R16-6-primitive-classical-bijection), [`R16.6/classical-hecke-and-level`](#R16-6-classical-hecke-and-level) (probable). hilbert-algebraic-weights fixes the weight Sym^{k_τ−2}⊗det^{m_τ} but leaves the dual convention to AF.4, whereas the node needs Pan's convention (W^{(k,0)} dual to highest weight (0,−k)) and the t-twist; primitive-classical-bijection and classical-hecke-and-level give the weight-k≥2 dictionary and arithmetic Hecke polynomial only for primitive Γ₁(N) newforms with complex coefficients. Pan's spaces M_{k+2}(K^p) at arbitrary tame level, the p-adic coefficient field and the weight-zero space of the k=0 branch are not stated in part R16.1.

**Sources.**

- **pan26** (Lue Pan, [*On locally analytic vectors of the completed cohomology of modular curves II*](https://arxiv.org/pdf/2209.06366v1)), §5.4.10, before Definition 5.4.11, p. 71 (arXiv v1 page = PDF page). Excerpt: “We denote the dual of this irreducible representation by W(−n1 ,−n2 ) which has highest weight (−n1 , −n2 ).”. Match: Convention: W^{(−n₁,−n₂)} is the dual of the D_p×-representation of highest weight (n₂,n₁). For Pan's χ = (n₁,n₂) = (−k,0) this is W^{(k,0)}, of highest weight (k,0); the packet's 'W^{(−k,0)}' was wrong.
- **pan26** (Lue Pan, [*On locally analytic vectors of the completed cohomology of modular curves II*](https://arxiv.org/pdf/2209.06366v1)), Definition 5.4.11(2), p. 71. Excerpt: “A1D,−χ ⊆ AD,−χ denotes the subset of maps which factor through the reduced norm map. Clearly this is non-zero only when n1 = n2 .”. Match: Exact: the norm-factor subspace A^1, nonzero only for k = 0; Definition 5.4.11(3) splits A = A^c ⊕ A^1 Hecke-equivariantly. Pan's quaternionic forms are W-valued functions on D×\(D⊗A_f)× with the weight acting at p.
- **pan26** (Lue Pan, [*On locally analytic vectors of the completed cohomology of modular curves II*](https://arxiv.org/pdf/2209.06366v1)), §5.5.5, p. 75. Excerpt: “where λ : TS → C runs over cuspidal automorphic representations π of GL2 (A) such that π∞ has the same infinitesimal character as the irreducible algebraic representation of GL2”. Match: Exact for k ≥ 1, continued on p. 76: 'with highest weight (0, −k) and such that (π^∞)^{K^p} ≠ 0 and π_p is special or supercuspidal. In particular, the spectrum is a subset of σ^{K^p}_{k+2,1}', the T_S-spectrum on M_{k+2}(K^p)·t, where GL₂(A_f) acts on t by the cyclotomic character.
- **pan26** (Lue Pan, [*On locally analytic vectors of the completed cohomology of modular curves II*](https://arxiv.org/pdf/2209.06366v1)), §5.5.5, p. 76. Excerpt: “When k = 0, for a Hecke-eigenform, either it is contained in A(0,0) , i.e. (as a function on (D ⊗ Af )× ) it factors through the reduced norm 1 map, hence transfers to an eigenform in M0 (K p ), or it transfers to a cuspidal eigenform of weight 2 as in the higher weight case.”. Match: Exact for k = 0: norm-factor eigenforms go to weight-zero spectrum σ_0^{K^p}, the rest to weight two σ_{2,1}^{K^p}. The stray '1' in the excerpt is the displaced superscript of A^1_{(0,0)} in the text layer.

<a id="R17-3-indefinite-parity"></a>

### `R17.3/indefinite-parity` — Indefinite transfer and the parity input

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/indefinite-parity` · declaration `TauCeti.GL2Transfer.indefinite_parity` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For totally real F of degree d, a quaternion algebra B split at exactly one real place and ramified at the other d−1 has a ramification set of even cardinality, so its number of ramified finite places has the parity of d−1. In CDN20 §5.2.1, B̌ is split at ∞₀, compact modulo the centre at the other real places and ramified at 𝔭; CDN20 puts no degree condition on F, and the parity of the remaining finite ramification is forced by the product formula. Given such B and a cuspidal π of GL₂(A_F) that is square-integrable at every place of Ram(B), the inverse transfer JL_B^{-1}(π) is the automorphic representation used on the associated Shimura curve. It has the same components, hence the same Hecke data, at every split finite place. The geometry and integral/cohomological realization belong to R18/R22. Parity is applied from ClassFieldTheory Layer 14, not reproved.

**Hypotheses.**

- F is totally real of degree d.
- B/F is a quaternion algebra split at exactly one real place and ramified at the other d−1 real places (d = 1 allowed: B split at the real place of Q).
- B is given by the quaternion/class-field suppliers; the parity is applied from ClassFieldTheory Layer 14.
- π is a cuspidal representation of GL₂(A_F) with π_v square-integrable at every place of Ram(B), including the d−1 ramified real places.

**Proof outline.**

1. Apply the supplied Hilbert product formula to the prescribed local invariants.
2. Apply global JL only after checking the essentially discrete-series conditions at every ramified place.

**Acceptance.**

- Over Q, ramification at ∞ alone is impossible; {p,∞} is valid.
- A quaternion algebra split at the single real place of Q needs an even number of ramified finite places.

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/split-hecke`](#R17-3-split-hecke), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`.

**Sources.**

- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)), §5.2.1, author p. 43 (author pagination = PDF page). Excerpt: “une algèbre de quaternions B̌ déployée en ∞0 , compacte (modulo le centre) aux autres places infinies de E et ramifiée en p.”. Match: Consumer setting only: CDN20 chooses this indefinite algebra over a totally real E with E_𝔭 = F (text layer writes p for 𝔭). It states no parity count and no degree condition on E; the parity is the Hilbert product formula. The JL use is on p. 44 ('par la correspondance de Jacquet-Langlands globale').

<a id="R17-3-invariant-exchange"></a>

### `R17.3/invariant-exchange` — Transfer after exchanging two quaternion invariants

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange` · declaration `TauCeti.GL2Transfer.invariant_exchange` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

In CDN23 §4.1 (F = Q_p, p > 2), E is a totally real field of even degree in which p splits completely, supplied by a globalization (Prop. 4.5), with a place 𝔭 | p (so E_𝔭 = Q_p) and a real place ∞₀. D⁰ is a quaternion algebra over E ramified exactly at the real places. D has the invariants of D⁰ exchanged at {𝔭,∞₀}: it is ramified at 𝔭 and at the real places other than ∞₀, and split at ∞₀. Both ramification sets have [E:Q] elements. The algebras are identified away from {𝔭,∞₀} by the fixed isomorphism (4.6). Any cuspidal π of GL₂(A_E) that is square-integrable at all real places and at 𝔭 lies in the image of both global-jl correspondences. This gives π⁰ = JL_{D⁰}^{-1}(π) and π^D = JL_D^{-1}(π), whose components away from {𝔭,∞₀} correspond under (4.6), with equal Hecke actions on invariants under any compact open U^𝔭 transported by (4.6). At 𝔭, π⁰_𝔭 is the special or supercuspidal π_𝔭 (via the fixed identification) and π^D_𝔭 = JL_𝔭^{-1}(π_𝔭). At ∞₀, π⁰_{∞₀} is the algebraic type matching the discrete series π_{∞₀} = π^D_{∞₀}. In particular CDN23's tame level U^𝔭, with U_v = GL₂(O_{E_v}) for v ≠ w₁ and U_{w₁} = {g ≡ (1 *; 0 1) mod ϖ_{w₁}}, is carried to D× through (4.6). Here w₁ is CDN23's auxiliary place: N(w₁) is prime to 2Np and not ≡ 1 mod p, and the ratio of the eigenvalues of ρ̄(Frob_{w₁}) is not 1 or N(w₁)^{±1}. N is the product of the orders of the finite groups (U_max A_f^× ∩ t_iG(E)t_i^{-1})/E^×. Existence of w₁ and the small-level geometry are separate supplied inputs, not consequences of JL.

**Hypotheses.**

- Setting of CDN23 §4: F = Q_p with p > 2; E totally real of even degree in which p splits completely (Prop. 4.5), with a place 𝔭 | p (E_𝔭 = Q_p) and a real place ∞₀.
- D⁰ and D are given quaternion algebras over E: D⁰ ramified exactly at the real places, and D ramified at 𝔭 and at the real places other than ∞₀. Both ramification sets have [E:Q] elements, which is even (consistency by ClassFieldTheory Layer 14).
- The isomorphism (4.6) D⁰⊗A^{𝔭,∞₀} ≅ D⊗A^{𝔭,∞₀} and the maximal-order identifications (O_{D⁰})_v ≅ M₂(O_{E_v}) are fixed.
- π is a cuspidal representation of GL₂(A_E) that is square-integrable at every real place and at 𝔭.
- w₁ and the level U are CDN23's (existence of w₁ is a supplied input, [25, Lemma 8.2]).

**Proof outline.**

1. Check with the Hilbert product formula (ClassFieldTheory Layer 14) that both invariant sets have the even cardinality [E:Q]; D⁰, D and (4.6) are given data of CDN23.
2. Apply global-jl to D⁰ and to D and compare through the common cuspidal π, using the fixed identifications composed with (4.6) at the other places and R17.1 at 𝔭 and ∞₀. Away-place equality identifies the transported tame Hecke actions (split-hecke).

**Acceptance.**

- The two changed places give an even invariant change.
- At the other places above p the split identifications remain those fixed in the paper.
- If π_𝔭 is an unramified principal series, π gives a D⁰-representation but no D-partner.

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/split-hecke`](#R17-3-split-hecke), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`, `R17.1`.

*Assembly note: the layer citations above, by node.*

- `R17.1` → [`R17.1/swapped-quaternion-invariants`](#R17-1-swapped-quaternion-invariants), [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison) (probable). swapped-quaternion-invariants is exactly CDN23's exchange of invariants at {v₀,τ₀} over a totally real field of even degree with recorded local identifications, and local-quaternionic-comparison and real-quaternionic-comparison give the transfers at 𝔭 and at the real places. The real-place comparison covers only algebraic types Sym^{k−2}⊗det^m, so the node's claim that π⁰_{∞₀} is an algebraic type needs π cohomological (D_k with an algebraic twist at every real place), which its hypotheses do not impose.

**Sources.**

- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.1, Proposition 4.5, p. 37 (journal page = PDF page). Excerpt: “Il existe un corps totalement réel E, de degré pair sur Q, dans lequel p est totalement décomposé”. Match: Exact for the field: E has even degree and p splits completely, so E_𝔭 = Q_p (§4 assumes F = Q_p, p > 2). E is supplied by this globalization ([25, prop. 8.1]).
- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.2, p. 38. Excerpt: “Soit 𝐷 0 une algèbre de quaternions sur E, compacte (modulo le centre) en toute place inﬁnie de E et déployée en toute place ﬁnie de E.”. Match: Exact: D⁰ is ramified exactly at the real places (possible because [E:Q] is even).
- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.2, equation (4.6), p. 38. Excerpt: “Soit D l’algèbre de quaternions sur E obtenue à partir de 𝐷 0 en échangeant les invariants en 𝔭 et ∞0 . On ﬁxe un isomorphisme 𝐷 0 ⊗𝐸 A𝔭,∞0 ≃ 𝐷 ⊗𝐸 A𝔭,∞0”. Match: Exact for the invariant exchange and the fixed away-{𝔭,∞₀} identification. Setting only: CDN23 compares D⁰ and D through Scholze's functor (Prop. 4.11), not through global JL. The JL pairing is the node's consequence of global-jl in this setting.
- **cdn23** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf)), §4.1.2, p. 38. Excerpt: “telle que N(𝑤 1 ) soit premier avec 2𝑁 𝑝 et non congru à 1 modulo p, et telle que le quotient des valeurs propres de ¯𝜌(Frob 𝑤1 ) ne soit pas 1 ou N(𝑤 1 ) ±1 .”. Match: Exact conditions on w₁ (existence from [25, Lemma 8.2]). N is the product of the orders of the finite groups (U_max A_f^× ∩ t_iG(E)t_i^{-1})/E^×, and ρ̄ is the residual representation of the globalization. U_{w₁} = {g ≡ (1 *; 0 1) mod ϖ_{w₁}}.

<a id="R17-3-supercuspidal-globalization"></a>

### `R17.3/supercuspidal-globalization` — Quaternionic globalization of a supercuspidal type ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization` · declaration `TauCeti.GL2Transfer.supercuspidal_globalization` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Supercuspidal globalization**

Let F₀ be a finite extension of Q_p, L a finite extension of Q_p (CDN20's coefficient field; complex representations are viewed over Q̄_p through a fixed isomorphism C ≅ Q̄_p), and τ = LL(M) an irreducible supercuspidal representation of GL₂(F₀) whose central character is trivial on a fixed uniformizer ϖ. The setting is CDN20 §5.2.1: E totally real with a place 𝔭 | p and E_𝔭 = F₀, a real place ∞₀, B̌ split at ∞₀, compact modulo the centre at the other real places and ramified at 𝔭, and B with the invariants of B̌ exchanged at {𝔭,∞₀}. The globalization sought is an automorphic Π̌ of B̌×(A_E), defined over L, with Π̌_∞ containing σ₂ and Π̌_𝔭 ≅ JL(τ). Here σ₂ is trivial at the real places other than ∞₀ and is the holomorphic discrete series of weight 2 with trivial central character at ∞₀. By footnote 21 this may require adjusting the central character, hence twisting everything by a character: τ by η∘det and JL(τ) by η∘Nrd for a character η of F₀^×, which changes ϖ. It may also require replacing L by a finite extension. The result is stated for the twisted data over the extended field. Given Π̌, global JL through GL₂ gives Π on B×(A_E) with Π^𝔭_f ≅ Π̌^𝔭_f under the fixed identifications and Π_𝔭 ≅ τ (twisted as above). Π̌^𝔭_f determines Π̌_𝔭 by quaternionic strong multiplicity one. The existence of Π̌ (Clozel's limit multiplicities, CDN20's [9]) is an explicit unresolved supplier gap, not a consequence of local transfer.

**Hypotheses.**

- F₀ is a finite extension of Q_p and τ = LL(M) is an irreducible supercuspidal representation of GL₂(F₀) whose central character is trivial on a fixed uniformizer ϖ (CDN20's ϖ-compatibility).
- L is a finite extension of Q_p (CDN20's coefficient field), with complex representations viewed over Q̄_p through a fixed isomorphism C ≅ Q̄_p.
- E, 𝔭 (E_𝔭 = F₀), ∞₀, B̌ and B are chosen as in CDN20 §5.2.1 and are given data.
- The existence of the globalization Π̌ (Clozel's limit-multiplicity theorem) is the recorded gap 'Clozel prescribed-supercuspidal globalization'.
- Twisting τ by a character of F₀^× and finitely extending L are allowed, as footnote 21 permits.

**Proof outline.**

1. Use Clozel's prescribed-discrete-series globalization/limit-multiplicity input for B̌× with σ₂ at infinity and the twisted JL(τ) at 𝔭, after adjusting the central character and enlarging L as footnote 21 allows. This input is recorded as a gap, not inferred from local transfer.
2. Apply global-jl twice (B̌× → GL₂ → B×) to get Π with Π_𝔭 ≅ τ; use strong multiplicity one for determination by the away-𝔭 spectrum.

**Acceptance.**

- A statement over the original L without permitting the footnote’s coefficient extension is stronger than the source.
- A statement that globalizes τ itself, without allowing the central-character twist of footnote 21 (which changes ϖ), is stronger than the source.

**Prerequisites.** [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/strong-multiplicity-one`](#R17-3-strong-multiplicity-one), `AutomorphicSpectralTheory:AS.6`.

**Sources.**

- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)), §5.2.1, footnote 21, author p. 44 (author pagination = PDF page). Excerpt: “21. Pour pouvoir globaliser [9] il faut ajuster le caractère central, et donc on peut être amené à tordre tout par un caractère (et donc à changer $) ; cela peut aussi demander de remplacer L par une extension finie.”. Match: Exact for the permitted modifications. The twist is of everything, including the local type at 𝔭 (it changes the uniformizer ϖ acting trivially, rendered '$' in the text layer), not only a global twist. L is CDN20's p-adic coefficient field. [9] is Clozel, limit multiplicities of discrete series: the recorded gap.
- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)), §5.2.1, author p. 44. Excerpt: “Π la représentation automorphe de G(A) qui correspond à Π̌ par la correspondance de Jacquet-Langlands globale ; on a donc Πpf = Π̌pf et Πp = LL(M).”. Match: Consumer of global-jl: from Π̌ on the indefinite B̌× to Π on the definite B× (split at 𝔭), through GL₂. This gives Π^𝔭_f = Π̌^𝔭_f and Π_𝔭 = LL(M) = τ (text layer: p for 𝔭).
- **cdn20** (Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [*Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)), §5.2.1, author p. 43. Excerpt: “B l’algèbre de quaternions ayant mêmes invariants que B̌ en dehors de ∞0 et p, compacte modulo le centre en ∞0 (et donc en toutes les places infinies de E) et déployée en p.”. Match: Exact description of the definite partner B (invariants of B̌ exchanged at {𝔭,∞₀}). σ₂ (trivial at real places ≠ ∞₀; weight-two holomorphic discrete series with trivial central character at ∞₀) is defined on the same page.

<a id="layer-R17-4"></a>

# Layer R17.4. Cyclic and solvable base change

Base change. `unramified-base-change` is the Satake rule A_v ↦ A_v^f for an unramified extension of residue degree f. For a cyclic extension E/F of prime degree ℓ, `cyclic-base-change` is Langlands' base change on isobaric GL₂ classes, compatible with restriction of parameters at every place (`local-compatibility`). `cyclic-descent` characterises its image among cuspidal representations by Galois invariance. `cuspidality` shows that BC(π) is noncuspidal exactly when π ≅ π ⊗ η, which happens only for ℓ = 2, and `cyclic-descent-fibers` and `isobaric-fibers` describe the fibres. Composing along a subnormal tower gives solvable base change (`solvable-base-change`), independent of the tower (`tower-independence`), with descent along a tower (`solvable-descent`) and the prescribed local splitting that potential modularity uses (`prescribed-local-base-change`).

The last four nodes go beyond Galois base change: the Gelbart–Jacquet adjoint lift to GL₃ (`adjoint-lift`), automorphic induction from a cyclic cubic extension (`cubic-character-induction`), the GL₃ converse theorem with the Jacquet–Shalika pole criterion (`gl3-recognition`) and the non-normal cubic base change of Jacquet, Piatetski-Shapiro and Shalika (`nonnormal-cubic-base-change`). Part R17.3 proposes a separate layer R17.4a for these four (Structural proposals).

**Nodes:** 15. **Planets:** Cyclic base change, Cyclic automorphic descent, Cyclic cuspidality criterion, Solvable base change, Gelbart–Jacquet adjoint lift, Non-normal cubic base change.

<a id="R17-4-unramified-base-change"></a>

### `R17.4/unramified-base-change` — Unramified base-change Satake rule

*Definition* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change` · declaration `TauCeti.GL2Transfer.unramifiedBaseChange` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Use the existing arithmetic Satake conjugacy class A_v∈GL₂(C) at an unramified finite v. For an unramified local extension E_w/F_v of residue degree f≥1, define its base-change representative to be A_v^f; the conjugacy class is independent of the chosen representative. This is the transfer-specific rule, not a new Satake carrier. Its determinant is det(A_v)^f and its local Euler polynomial is det(1−A_v^f X). For a split global place each local degree is one. The formal degree-zero extension of the matrix-power function is the identity matrix and is not a degree-zero field extension.

**Hypotheses.**

- K is a field (ℂ in the application) and A ∈ GL₂(K) represents the arithmetic-normalised Satake class A_v of a representation π_v unramified at a finite place v (R16.3 normalisation).
- f ≥ 1 is the residue degree of an unramified local extension E_w/F_v; f = 1 at split places.
- f = 0 is only the formal value of the matrix-power function and corresponds to no field extension.
- Coefficient maps are ring homomorphisms K → L acting entrywise on GL₂.

**Construction.**

1. Implement the rule by power in Mathlib’s existing GL(Fin 2,K); use the existing multiplicative determinant and coefficient-map homomorphisms.
2. Compare to restriction of arithmetic Frobenius: Frob_w maps to Frob_v^f in the unramified quotient.

**Uses that determine the API.**

- *Langlands §1 formula (1.1) and §2 local criterion (i); Arthur–Clozel Chapter 3 formula (1.1) and Definition 1.1*: Specify the almost-everywhere local data that determine global base change.
- *R17.6 compatible-system export*: Match the characteristic polynomial of restricted Frobenius to the transferred Hecke polynomial.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Transfer.unramifiedBaseChange_one` | simp | The degree-one rule fixes A. |
| `TauCeti.GL2Transfer.unramifiedBaseChange_tower` | functoriality | Applying residue degrees f and then g gives A^{fg}. |
| `TauCeti.GL2Transfer.unramifiedBaseChange_conjugate` | compatibility | For P∈GL₂(K), the rule sends P A P^{-1} to P A^f P^{-1}. |
| `TauCeti.GL2Transfer.unramifiedBaseChange_det` | projection | The determinant of the output is det(A)^f. |
| `TauCeti.GL2Transfer.unramifiedBaseChange_map` | functoriality | Every coefficient ring map commutes with the power rule. |

**Unit tests.**

- `TauCeti.GL2Transfer.bc_degree_one_test` (degenerate): Degree one returns every A∈GL₂(K).
- `TauCeti.GL2Transfer.bc_identity_test` (degenerate): The identity matrix stays the identity for every f, including the formal f=0 case.
- `TauCeti.GL2Transfer.bc_diagonal_square_test` (computation): For A=diag(2,3)∈GL₂(Q), degree two gives the matrix diag(4,9), trace 13 and determinant 36.
- `TauCeti.GL2Transfer.bc_not_identity_test` (non-example): For that A, degree two is different from degree one.
- `TauCeti.GL2Transfer.bc_tower_test` (compatibility): Residue degrees two then three give diag(64,729), agreeing with degree six.

**Acceptance.**

- For diagonal eigenvalues (2,3) over Q and residue degree two, the output eigenvalues are (4,9), not (2,3).

**Prerequisites.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Matrix.GeneralLinearGroup.map`, `R16.3`.

*Assembly note: the layer citations above, by node.*

- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization) (probable). The class A_v is rec(π_v)(Φ) for unramified π_v (principal-series-parameter, unitary normalization) scaled by q_v^{1/2}, which is the Tate normalization recᵀ of tate-unitary-normalization at geometric Frobenius. Part R16.1 has no R16.3 normalization called arithmetic (R16.6 uses that word for the q^{(k−1)/2} Hecke scaling) and uses geometric rather than arithmetic Frobenius; the f-th power rule is insensitive to both choices, but the name should be aligned.

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §1, formula (1.1) and Definition 1.1, printed p. 199 (PDF p. 215). Excerpt: “In terms of Hecke eigenvalues (cf. e.g. §6.3) the correspondence is described as follows: if f, is the residual degree of E above an unramified v, then for any wlv:”. Match: Exact source of the power rule: the formula (1.1) displayed after this sentence is (t_{π,v})^{f_v} = t_{Π,w} for every w|v, in the unitary normalisation of Hecke matrices. OCR shows f_v as 'f,' and w|v as 'wlv'; the formula itself is garbled in the OCR and was read from the page image. The node uses the R16.3 arithmetic normalisation. That normalisation differs by the scalar q_v^{1/2}, and q_w^{1/2} = (q_v^{1/2})^f, so the rule A ↦ A^f is the same. The matrix-level API and the formal f = 0 case are the node's own.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, local lifting criterion (i), Digital Math Archive typescript p. 9 (PDF p. 12); compare §1 formula (1.1), p. 2. Excerpt: “(i) Π is π(µ0 , ν 0 ), π is π(µ, ν), and µ0 (x) = µ(NE/F x), ν 0 (x) = ν(NE/F x) for x ∈ E × .”. Match: Specialisation. For unramified μ, ν and E_w/F_v unramified of degree f, the rule μ′ = μ∘N gives μ′(ϖ_E) = μ(ϖ_F)^f, and likewise for ν. This is the power rule on Satake eigenvalues ('µ0, ν 0' in the text layer are μ′, ν′). Langlands states criterion (i) for cyclic E/F of prime degree ℓ. §1 (1.1) gives the same rule for any unramified degree via the L-group homomorphism. 'p.' is the typescript running-head page, not the printed Annals volume page.

<a id="R17-4-cyclic-base-change"></a>

### `R17.4/cyclic-base-change` — Prime-cyclic base change for GL₂ ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change` · declaration `TauCeti.GL2Transfer.cyclicBaseChange` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Cyclic base change**

For a cyclic extension E/F of prime degree ℓ of number fields, there is a uniquely determined strong base-change map BC_{E/F} from isobaric automorphic GL₂ classes over F to isobaric automorphic GL₂ classes over E. BC(π) is the unique isobaric Π such that, at every place w|v, Π_w is the local base-change lift of π_v (Langlands §2, criteria (i)/(ii)). At an unramified w|v its Satake class is unramifiedBaseChange(A_v, f(w/v)); when v splits, Π_w ≅ π_v. A cuspidal input has a cuspidal output or, only for ℓ = 2, an output θ⊞θ^σ for a Hecke character θ of E. The central character is ω_π∘N_{E/F}. The output is invariant under Gal(E/F), and the map does not depend on the chosen generator σ. Neither cuspidality nor injectivity is automatic. The theorem local-compatibility identifies BC(π)_w with the restriction to W_{E_w} of the arithmetic-normalised LLC parameter of π_v.

**Hypotheses.**

- F is a number field and E/F is cyclic of prime degree ℓ; σ is a generator of Gal(E/F). The resulting map does not depend on σ.
- π is an isobaric automorphic representation of GL₂(A_F): cuspidal, or χ₁⊞χ₂ with idele class characters χ₁, χ₂.
- Local lifting is the Langlands–Shintani local base change (Langlands §2 criteria (i)/(ii); Arthur–Clozel Ch. 1 Definition 6.1). Unramified Satake classes use the R16.3 arithmetic normalisation.
- Arthur–Clozel's theorems assume representations induced from unitary cuspidal ones; Langlands's GL₂ theorems have no unitarity assumption.

**Construction.**

1. Use the R17.2 prime-cyclic trace comparison to produce a weak base change (quasi-lifting) and the spectral alternatives: Langlands Lemma 11.3, or Arthur–Clozel Ch. 3 Theorem 4.2 with n = 2. Noncuspidal π(μ,ν) lifts directly to π(μ∘N, ν∘N).
2. Upgrade weak to strong with Langlands Proposition 11.4 (a quasi-lifting is a lifting), or with Arthur–Clozel Ch. 3 Theorem 5.1 using the supplied rank-two local comparison. R16.4 isobaric strong multiplicity one fixes the class. At split places the local lift is π_v (Langlands §8).

**Uses that determine the API.**

- *Langlands §3; R17.5 tetrahedral and octahedral arguments*: Restrict the automorphic realization along the cyclic normal subextensions.
- *Carayol §12.3; PotentialModularityAndCompatibleSystems R23.5*: Preserve specified local components at split places and restrict local parameters at other places.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Transfer.cyclicBaseChange_local` | compatibility | At w\|v, BC(π)_w is the local base-change lift of π_v in the sense of Langlands §2 (criteria (i)/(ii)); at split v it is π_v. Its description as the restriction of the normalised local parameter to W_{E_w} is the theorem local-compatibility. |
| `TauCeti.GL2Transfer.cyclicBaseChange_unramified` | simp | At unramified w\|v, Satake equals unramifiedBaseChange(A_v,f(w/v)). |
| `TauCeti.GL2Transfer.cyclicBaseChange_central` | projection | The central character is pullback along the idele norm. |
| `TauCeti.GL2Transfer.cyclicBaseChange_twist` | functoriality | BC(π⊗χ)=BC(π)⊗(χ∘N_{E/F}). |
| `TauCeti.GL2Transfer.cyclicBaseChange_galois` | characterisation | Every output is Gal(E/F)-invariant; every invariant cuspidal class occurs, with the fibers described in cyclic-descent-fibers. |
| `TauCeti.GL2Transfer.cyclicBaseChange_coefficients` | compatibility | In the supplied rational/cohomological regime, coefficient conjugation commutes with BC after the recorded normalization. |

**Unit tests.**

- `TauCeti.GL2Transfer.cyclic_split_test` (compatibility): At a completely split v each local output equals the original component and its Satake representative A_v.
- `TauCeti.GL2Transfer.cyclic_inert_test` (computation): At an inert unramified place of a quadratic extension, diag(2,3) becomes diag(4,9).
- `TauCeti.GL2Transfer.cyclic_induced_test` (non-example): For π=AI_{E/F}(θ) with θ≠θ^σ in a quadratic extension, BC(π)=θ⊞θ^σ and is not cuspidal.
- `TauCeti.GL2Transfer.cyclic_odd_degree_test` (characterisation): For prime ℓ>2, every cuspidal GL₂ input remains cuspidal.

**Acceptance.**

- A quadratic dihedral representation induced from E can lose cuspidality under this map.

**Prerequisites.** [`R17.4/unramified-base-change`](#R17-4-unramified-base-change), `R17.2`, `R16.3`, `R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`.

*Assembly note: the layer citations above, by node.*

- `R17.2` → [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching) (probable). The weak lift comes from the prime-cyclic twisted trace comparison, which specialized-trace-comparison states as an equality of distributions built on cyclic-local-matching. cyclic-local-matching is stated only for nonarchimedean E_w/F_v and split places, so for ℓ=2 the matching at real places of F that become complex in E is not stated.
- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization) (probable). The R16.3 input is the normalization of unramified Satake classes: rec(π_v)(Φ) from principal-series-parameter scaled by q_v^{1/2} as in tate-unitary-normalization, which part R17.3 calls arithmetic though part R16.1 uses no such name and works with geometric Frobenius. The Langlands–Shintani local lift itself is taken from Langlands §2 and Arthur–Clozel and is not stated in part R16.1.
- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (none). The node needs isobaric strong multiplicity one (Langlands Lemma 3.1, Jacquet–Shalika) to fix BC(π) among isobaric classes, including outputs θ⊞θ^σ and (μ∘N)⊞(ν∘N). R16.4/strong-multiplicity-one is stated for cuspidal π, π′ only, and no part-R16.1 node states it for isobaric χ₁⊞χ₂.

**Sources.**

- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, global properties (A),(B), Digital Math Archive typescript p. 14 (PDF p. 17); proof in §11, Lemma 11.3 and Proposition 11.4, pp. 140–145. Excerpt: “A) Every π has a unique lifting. B) If Π is isobaric in the sense of [24], in particular cuspidal, then Π is a lifting if and only if Πτ ∼ Π for all τ ∈ G(E/F ).”. Match: Exact for GL₂ and E/F cyclic of prime degree: existence, uniqueness and Galois invariance of the global lift. In Langlands's definition (p. 13), Π lifts π when Π_w is a local lift of π_v at every place. The central character is property (E), p. 14. The cuspidal or θ⊞θ^σ alternatives are Lemma 11.3. Langlands has no unitarity restriction.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §8, split places, Digital Math Archive typescript p. 93 (PDF p. 96). Excerpt: “The correct notion of the lifting of an irreducible admissible representation of G(F ) to G(E) = G(F ) × · · · × G(F ) is patent: the representation π lifts to Π = π ⊗ · · · ⊗ π .”. Match: Exact for the split-place clause: when v splits, the local lift of π_v is π_v ⊗ ⋯ ⊗ π_v, so BC(π)_w ≅ π_v for every w|v.
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3, Theorem 5.1 (with Theorem 4.2(a)–(c)), printed pp. 202 and 212 (PDF pp. 218, 228). Excerpt: “THEOREM 5.1: (STRONG LIFTING). Assume ir, II are representations induced from cuspidal of G(A), G(AE) respectively. If I is a weak lifting of r, then II is in fact a strong lifting of r.”. Match: GL(n) generalisation, used for the weak-to-strong step. A weak lift, defined by the almost-everywhere formula (1.1), between representations induced from unitary cuspidal ones is a strong lift, i.e. a local base-change lift at every place (Definition 1.2). Theorem 4.2(a)–(c) gives existence and uniqueness of the σ-stable lift. OCR: 'ir', 'r' = π; 'II', 'I' = Π. The node specialises to n = 2; non-unitary inputs reduce to this by twisting with |det|^s.

<a id="R17-4-local-compatibility"></a>

### `R17.4/local-compatibility` — All-place compatibility of cyclic base change

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility` · declaration `TauCeti.GL2Transfer.local_compatibility` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For the strong cyclic BC pair and every place w|v, rec^{arith}_{E_w}(BC(π)_w) equals rec^{arith}_{F_v}(π_v) restricted to W_{E_w}, including the monodromy operator and the normalization twist specified by R16.3. For a principal series restrict both characters; for a Steinberg twist retain nonzero monodromy; for a supercuspidal the restricted parameter may become reducible. At real-to-complex places restrict the real Weil parameter. A merely almost-everywhere Satake match is not this all-place statement. The global input gives only that BC(π)_w is the local Shintani lift of π_v (character identities). The passage to restricted parameters is local: Langlands covers reducible, special, dihedral and tetrahedral parameters; R16.3 supplies the octahedral (extraordinary) dyadic case for every ℓ. Carayol proves the case [E_w:F_v] ≤ 3 in the Proposition of his §12.2.2, but that Proposition belongs to AutomorphicGaloisRepresentations R19.2, downstream of this stage, so it is not used here.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ. π is an isobaric automorphic representation of GL₂(A_F) and BC(π) is its strong cyclic base change (cyclic-base-change).
- w|v is any place, archimedean or not, split, inert or ramified. E_w/F_v is trivial or cyclic of degree ℓ.
- rec^{arith} is the R16.3 arithmetic-normalised rank-two local Langlands correspondence with values in Frobenius-semisimple Weil–Deligne representations (monodromy included).
- Comparing the local Shintani lift with restriction of parameters for octahedral (extraordinary) π_v at p = 2, for every ℓ, is an R16.3 input; Carayol's proof of the degree ≤ 3 cases lives downstream in AutomorphicGaloisRepresentations R19.2.

**Proof outline.**

1. Strong lifting: Langlands §2 (A) with Proposition 11.4, or Arthur–Clozel Ch. 3 Definition 1.2 and Theorem 5.1. At every place w|v, BC(π)_w is the local base-change lift of π_v (Shintani character identities; at split places π_v itself, Langlands §8).
2. Turn local lifts into restricted parameters case by case. Principal series: Langlands criterion (i), restricting both characters. Special: Lemma 7.6 (special lifts to special, so monodromy is kept). Dihedral and archimedean: §2(e). Tetrahedral: Lemma 11.8. Octahedral (extraordinary) at p = 2, every ℓ: the R16.3 characterisation. Carayol's §12.2.2 Proposition covers degree ≤ 3 downstream, in AutomorphicGaloisRepresentations R19.2, and is not imported, which keeps the stage graph acyclic. Twisting by |·|^s commutes with restriction because |·|_{F_v}∘N = |·|_{E_w}, so the R16.3 arithmetic normalisation is respected.

**Acceptance.**

- Steinberg monodromy does not vanish just because the extension is unramified.
- Carayol's extraordinary comparison for non-Galois cubic extensions (AutomorphicGaloisRepresentations R19.2/carayol-cubic-base-change-of-extraordinary) is a separate theorem, not an instance of cyclic restriction.

**Prerequisites.** [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), `R16.3`.

*Assembly note: the layer citations above, by node.*

- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (none). The rank-two LLC with monodromy in R16.3's normalizations is supplied by principal-series-parameter, steinberg-monodromy, supercuspidal-parameter and tate-unitary-normalization, and the archimedean parameters by R16.2/archimedean-classification (a different stage). The key input attributed to R16.3, that the Langlands–Shintani local lift corresponds to restriction of the parameter for primitive octahedral dyadic π_v and every prime ℓ, is stated by no part-R16.1 node.

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3, Definition 1.2 and Theorem 5.1, printed pp. 199, 212–213 (PDF pp. 215, 228–229). Excerpt: “DEFINITION 1.2.: We say that II is a strong base change lift of xr if, for any (finite or infinite) wjv, the component II is a base change lift of tr.”. Match: Proof step only: the strong lift has Π_w a local base-change lift of π_v at every place. OCR: 'II' = Π_w, 'xr'/'tr' = π/π_v, 'wjv' = w|v. Here local lifting is the Shintani character identity of Arthur–Clozel Ch. 1 Definition 6.1. Arthur–Clozel do not compare it with restriction of Langlands parameters; that comparison comes from the sources below and R16.3.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, local result (e), Digital Math Archive typescript p. 10 (PDF p. 13). Excerpt: “e) If ρ is reducible or dihedral and π = π(ρ) then the lifting of π is π(P ) if P is the restriction of ρ to WK/E .”. Match: Exact for reducible (principal-series) and dihedral parameters, which includes every archimedean case since irreducible two-dimensional representations of W_ℝ are dihedral. The remark after (e) says the methods reach tetrahedral ρ but not octahedral ρ.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §7, Lemma 7.6, Digital Math Archive typescript p. 68 (PDF p. 71). Excerpt: “We see that σ(µ, ν) is a lifting of σ(µ0 , ν 0 ).”. Match: Exact for special representations: the lift of the special representation σ(μ′,ν′) of GL₂(F_v) is the special representation σ(μ,ν) of GL₂(E_w), so Steinberg twists stay Steinberg and the monodromy stays nonzero ('µ0, ν 0' are μ′, ν′).
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11, Lemma 11.8, Digital Math Archive typescript p. 151 (PDF p. 154). Excerpt: “If ρv is dihedral or tetrahedral then π(ρv ) exists and the lifting of π(ρv ) is π(Pv ) if Pv is the restriction of ρv to the Weil group of Ev .”. Match: Exact for dihedral and tetrahedral local parameters and every prime ℓ.
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), §12.2.2, printed p. 457 (PDF p. 50). Excerpt: “on le vérifie aussi sans trop de mal dans le cas d'une représentation spéciale ou cuspidale ordinaire. Le cas qui nous intéresse ici est le cas cuspidal extraordinaire”. Match: Carayol states the principle (Σ is the restriction of σ to W′_L) and says he knows no reference for it. He says it follows from the definitions for principal series and is checked without much difficulty for special and ordinary cuspidal representations. He then proves the extraordinary cuspidal case (the Proposition of §12.2.2, proof §12.2.3) for p-adic L/F of degree ≤ 3. This covers ℓ = 2, 3. No source read here covers octahedral parameters at p = 2 with ℓ ≥ 5; that case comes from R16.3.

<a id="R17-4-cyclic-descent"></a>

### `R17.4/cyclic-descent` — Prime-cyclic automorphic descent ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent` · declaration `TauCeti.GL2Transfer.cyclic_descent` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Cyclic automorphic descent**

For cyclic E/F of prime degree ℓ, a cuspidal automorphic GL₂ representation Π over E has a cuspidal descent over F if and only if Π^σ≅Π for a generator σ of Gal(E/F). The resulting descents are determined up to twisting by the ℓ characters of F×N_{E/F}(A_E×)\A_F×. This is descent of an automorphic representation, proved by the twisted trace formula comparison, not descent of a Galois representation. Invariant noncuspidal isobaric classes also have isobaric descents, with the two-character ambiguity described separately.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ, with σ a generator of Gal(E/F).
- Π is a cuspidal automorphic representation of GL₂(A_E); in the last clause, Π is isobaric.
- A descent of Π is an automorphic π over F with BC_{E/F}(π) ≅ Π (strong base change).
- η runs over the ℓ Hecke characters of F trivial on F^×N_{E/F}(A_E^×) (global class field theory).

**Proof outline.**

1. Use the prime-cyclic invariant-spectrum comparison from R17.2 and Langlands properties (B), (C): Lemma 11.3(c) and Proposition 11.4 show that an invariant cuspidal Π is a lifting, and Lemma 11.6(b) counts the descents.
2. Use R16.4 uniqueness and the cyclic character group supplied by class field theory.

**Acceptance.**

- Non-invariant Π has no cyclic descent.
- Invariant Π can have several distinct cuspidal descents.

**Prerequisites.** [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), `R17.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

*Assembly note: the layer citations above, by node.*

- `R17.2` → [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching) (probable). The descent uses the σ-invariant spectral side of the prime-cyclic twisted trace comparison, stated by specialized-trace-comparison together with the induced and exceptional terms of its ledger (continuous-residual-ledger). As for cyclic-base-change, cyclic-local-matching covers only nonarchimedean and split places, so for ℓ=2 the archimedean matching at real places that become complex is not stated.

**Sources.**

- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11, Lemma 11.6(b), Digital Math Archive typescript p. 151 (PDF p. 154). Excerpt: “(b) Suppose E is cyclic of prime degree ` and Π is a cuspidal automorphic representation of G(AE ) with Πσ ≃ Π. Then Π is the lifting of ` cuspidal automorphic representations π .”. Match: Exact: an invariant cuspidal Π is the lift of exactly ℓ cuspidal π (the text layer prints ℓ as a backquote). Property (B) (p. 14: an isobaric Π is a lifting iff Π^τ ≅ Π for all τ) supplies the converse, and with it the 'if and only if'. Arthur–Clozel Ch. 3 Theorem 4.2(d) is the GL(n) version.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, global property (C), Digital Math Archive typescript p. 14 (PDF p. 17). Excerpt: “If π is cuspidal then π 0 lifts to Π if and only if π0 = ω ⊗ π where ω is again a character of F × NE/F IE .”. Match: Exact for the twist ambiguity ('π 0' is π′). The group is F^×N_{E/F}I_E\I_F, written out in the sentence before; this sentence omits '\I_F'. Class field theory gives it order ℓ.

<a id="R17-4-cuspidality"></a>

### `R17.4/cuspidality` — The exact prime-cyclic cuspidality criterion ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality` · declaration `TauCeti.GL2Transfer.cuspidality` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Cyclic cuspidality criterion**

Let π be cuspidal GL₂ over F and E/F cyclic of prime degree ℓ; let η be a generator of the order-ℓ group of Hecke characters of F trivial on F^×N_{E/F}(A_E^×). Then BC_{E/F}(π) is noncuspidal if and only if π≅π⊗η. This can occur only for ℓ=2. In that case BC(π)=θ⊞θ^σ for a Hecke character θ with θ≠θ^σ. The identification of π with quadratic automorphic induction is provided by R17.5/quadratic-induction, after this base-change criterion. For prime ℓ>2 the output is always cuspidal. For composite cyclic extensions test each prime step; an odd prime criterion is not a criterion for every composite degree.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ, and π is a cuspidal automorphic representation of GL₂(A_F).
- η is a generator of the order-ℓ group of Hecke characters of F trivial on F^×N_{E/F}(A_E^×). The condition π ≅ π⊗η does not depend on which generator is chosen.
- BC_{E/F} is the strong cyclic base change of cyclic-base-change.
- AC89 Theorem 4.2 is stated for unitary π; the general case follows by twisting with |det|^s. Langlands has no unitarity restriction.

**Proof outline.**

1. Arthur–Clozel Ch. 3 Theorem 4.2(a),(b) with n = 2. If π≇π⊗η, the lift is cuspidal. If π≅π⊗η, the only lift is Π₁×Π₁^σ×⋯×Π₁^{σ^{ℓ−1}} with Π₁ cuspidal on GL(2/ℓ) and Π₁≇Π₁^σ; so ℓ = 2 and Π₁ = θ is a Hecke character of E with θ≠θ^σ.
2. Taking central characters in π≅π⊗η gives η²=1; since η has prime order ℓ, ℓ=2. This is why Langlands calls Lemma 11.7 trivial for odd ℓ.
3. For GL₂ the same criterion also follows from Langlands Lemma 11.3(a),(b) and Lemma 11.7. Lemma 11.3(a): π(Ind θ) lifts to π(θ,θ^σ); Lemma 11.3(b): every other cuspidal π has a cuspidal lift. Lemma 11.7: π≅η⊗π iff ℓ=2 and π is induced from E. The named quadratic induction construction is not an input to this criterion.

**Acceptance.**

- A quadratic dihedral π with inducing field different from E need not lose cuspidality under E/F.

**Prerequisites.** [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), [`R17.4/cyclic-descent`](#R17-4-cyclic-descent), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3, Theorem 4.2(a),(b), printed p. 202 (PDF p. 218). Excerpt: “(a) Assume 7ris cuspidal, ir .7r r00. Then there is a unique a-stable representation II of G(AE) lifting 7r; II is cuspidal. (b) Assume 7r- 7rl, 'r cuspidal. Then there is a cuspidal representation Hi of GL(n/l, AE), with Hi j IIy, such that II = ll x x 1 is the only lift of r.”. Match: Exact criterion for GL(n), specialised to n = 2. (a) If π ≇ π⊗η, the unique σ-stable lift is cuspidal. (b) If π ≅ π⊗η, the only lift is Π₁×Π₁^σ×⋯ with Π₁ cuspidal on GL(n/ℓ) and Π₁ ≇ Π₁^σ; for n = 2 this forces ℓ = 2 and Π = θ⊞θ^σ with θ ≠ θ^σ. OCR glyphs, read from the page image: '7r', 'ir', 'r' = π; 'II', 'Hi', 'll' = Π, Π₁; 'a-stable' = σ-stable. The theorem is stated for unitary cuspidal π.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11, Lemma 11.7, Digital Math Archive typescript p. 151 (PDF p. 154). Excerpt: “Then π ≃ ω ⊗ π if and only if ` = 2 and there is a character θ of E × \IE such that π = π(τ ) with τ = Ind(WE/F , WE/E , θ).”. Match: Self-twist criterion, not itself a base-change statement: for ω a nontrivial character of F^×N I_E\I_F and π cuspidal, π ≅ ω⊗π iff ℓ = 2 and π = π(Ind θ). With Lemma 11.3(a),(b) it gives the node's criterion for GL₂. Langlands calls the lemma trivial for odd ℓ and omits the proof for ℓ = 2, deferring it to Labesse–Langlands [18].
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11, Lemma 11.3(b), Digital Math Archive typescript p. 141 (PDF p. 144); Lemma 11.3(a) on p. 140. Excerpt: “(b) If π is a cuspidal automorphic representation and π is not a π(ρ) with ρ dihedral and induced from an idèle class character of the given E then there is a cuspidal automorphic representation Π of G(AE ) which is a quasi-lifting of π .”. Match: Exact for the cuspidal direction: a cuspidal π that is not π(ρ) with ρ induced from a character of the given E has a cuspidal quasi-lifting, and hence a cuspidal lifting by Proposition 11.4. Lemma 11.3(a) gives the noncuspidal lift π(μ,μ^σ) of π(Ind μ).

<a id="R17-4-cyclic-descent-fibers"></a>

### `R17.4/cyclic-descent-fibers` — Cuspidal fibers and quadratic self-twists

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers` · declaration `TauCeti.GL2Transfer.cyclic_descent_fibers` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

If Π is a Gal(E/F)-invariant cuspidal GL₂ representation and π is one of its cyclic descents, then its cyclic descents are precisely π⊗η^i, 0≤i<ℓ; these ℓ classes are distinct and all cuspidal. If E/F is quadratic and the common output is noncuspidal θ⊞θ^σ with θ≠θ^σ, its descent is unique (and cuspidal): π⊗η≅π. Thus the phrase “the fiber consists of ℓ distinct descents” must be restricted to cuspidal outputs.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ, and η is a generator of the Hecke characters of F trivial on F^×N_{E/F}(A_E^×).
- First clause: Π is a cuspidal automorphic representation of GL₂(A_E) with Π^σ ≅ Π, and π is one of its descents.
- Second clause: ℓ = 2 and Π = θ⊞θ^σ for a Hecke character θ of E with θ ≠ θ^σ.

**Proof outline.**

1. Apply Langlands Lemma 11.6(a),(b) for the fiber counts, as recorded in property (C); equivalently, Arthur–Clozel Ch. 3 Theorem 4.2(d),(e) with n = 2.
2. Use the exact cuspidality criterion to rule out η-self-twists when Π is cuspidal, so the ℓ twists are distinct. A noncuspidal π(μ,ν) cannot be a descent in either case, since its lift π(μ∘N,ν∘N) has σ-invariant characters.

**Acceptance.**

- For a quadratic induced π, the two nominal twists coincide; for a cuspidal quadratic output they are distinct.

**Prerequisites.** [`R17.4/cyclic-descent`](#R17-4-cyclic-descent), [`R17.4/cuspidality`](#R17-4-cuspidality).

**Sources.**

- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11, Lemma 11.6(a), Digital Math Archive typescript p. 150 (PDF p. 153); (b) on p. 151. Excerpt: “Lemma 11.6 (a) Suppose E is a quadratic extension of the global field F and Π = π(µ, µσ ) with µσ 6= µ. Then Π is the lifting of a unique π .”. Match: Exact for the noncuspidal case ('6=' is the text layer's ≠): π(μ,μ^σ) with μ^σ ≠ μ has exactly one preimage among all automorphic π, so in particular a unique cuspidal descent. Lemma 11.6(b), on p. 151, gives the ℓ descents of an invariant cuspidal Π.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, global property (C), Digital Math Archive typescript p. 14 (PDF p. 17). Excerpt: “The number of such π 0 is ` unless ` = 2 and π = π(τ ) where τ is a two-dimensional representation of WE/F induced by a character of E × \IE , when it is one, for π ∼ ω ⊗ π in this case.”. Match: Exact for both counts. A cuspidal π not induced from E has ℓ distinct descents. When ℓ = 2 and π is induced from E there is one descent, and π ≅ ω⊗π. Arthur–Clozel Ch. 3 Theorem 4.2(d),(e) is the GL(n) version.

<a id="R17-4-isobaric-fibers"></a>

### `R17.4/isobaric-fibers` — Isobaric character fibers

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers` · declaration `TauCeti.GL2Transfer.isobaric_fibers` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For π=χ₁⊞χ₂ over F, its cyclic base change is (χ₁∘N_{E/F})⊞(χ₂∘N_{E/F}). Equality of two such outputs is equality of the unordered pairs of pulled-back characters. The two characters can be twisted independently by characters trivial on the norm subgroup; the ambiguity is not in general a simultaneous twist of the whole rank-two representation. When an invariant pair over E is exchanged by σ (possible only for ℓ=2), it has the quadratic cuspidal descent of the exchanged character pair described above.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ; N = N_{E/F} on ideles.
- π = χ₁⊞χ₂ with χ₁, χ₂ idele class characters of F, not necessarily unitary.
- The twisting characters run over the Hecke characters of F trivial on F^×N_{E/F}(A_E^×).
- The exchanged case θ⊞θ^σ with θ ≠ θ^σ occurs only for ℓ = 2.

**Proof outline.**

1. Pull back the two characters individually along the idele norm (Langlands §11, verification of (A)).
2. Use the rank-one class-field norm-kernel description and the prime-cyclic exchanged-character descent case (Langlands property (C) and the verification of (B)). Compare unordered pairs rather than ordered Satake eigenvalues, using isobaric strong multiplicity one (R16.4).

**Acceptance.**

- Twisting only χ₁ by η already gives the same base change; this need not be a simultaneous twist of χ₁⊞χ₂.

**Prerequisites.** [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), [`R17.4/cyclic-descent-fibers`](#R17-4-cyclic-descent-fibers), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `R16.4`.

*Assembly note: the layer citations above, by node.*

- `R16.4` → no node (none). The node compares the outputs (χ₁∘N)⊞(χ₂∘N) as unordered pairs using isobaric strong multiplicity one for sums of two Hecke characters. No part-R16.1 node states this; R16.4/strong-multiplicity-one is for cuspidal representations only and does not apply to these outputs.

**Sources.**

- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, global property (C), first sentence, Digital Math Archive typescript p. 14 (PDF p. 17). Excerpt: “C) Suppose π lifts to Π. If π = π(µ, ν) with two characters of the idèle class group ([14]), then the only other automorphic representations lifting to Π are π(µ1 µ, ν1 ν), where µ1 , ν1 are characters of F × NE/F IE \IF .”. Match: Exact for the fibre: the descents of BC(π(μ,ν)) are the π(μ₁μ, ν₁ν), with μ₁, ν₁ independent characters of F^×N_{E/F}I_E\I_F. Langlands's π(μ,ν) is the node's μ⊞ν.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11, verification of (A)–(G), Digital Math Archive typescript p. 151 (PDF p. 154). Excerpt: “If π is not cuspidal then it is a constituent of ρ(µ, ν), for some pair of idèle-class characters. Its lifting is then a constituent of ρ(µ0 , ν 0 ), with µ0 = µ ◦ NE/F , ν 0 = ν ◦ NE/F , and, by [25], is also automorphic.”. Match: Exact for BC(χ₁⊞χ₂) = (χ₁∘N)⊞(χ₂∘N) ('µ0, ν 0' are μ′, ν′).
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11, verification of (B), Digital Math Archive typescript p. 151 (PDF p. 154). Excerpt: “If Π is isobaric and not cuspidal then Π = π(µ, ν) and Πσ ∼ Π if and only if µσ ∼ µ and ν σ ∼ ν or µσ ∼ ν, ν σ ∼ µ.”. Match: Exact for the invariance condition. The exchanged case μ^σ = ν ≠ μ forces ℓ = 2, and its descent is Lemma 11.6(a) (cyclic-descent-fibers). Equality of outputs as unordered pairs uses isobaric strong multiplicity one (§3 Lemma 3.1; R16.4).

<a id="R17-4-solvable-base-change"></a>

### `R17.4/solvable-base-change` — Base change along a solvable normal tower ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change` · declaration `TauCeti.GL2Transfer.solvableBaseChange` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Solvable base change**

Let E/F be a finite Galois extension with solvable Galois group. Choose a subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each step cyclic of prime degree and define BC_{E/F} by composing the prime-cyclic maps on isobaric GL₂ classes. At every local place the normalized parameter is restricted from F to E; the map is independent of the chosen prime-cyclic tower by almost-everywhere Satake comparison and isobaric strong multiplicity one. It preserves twists through the total norm and preserves cuspidality exactly when no intermediate step meets its quadratic self-twist exception. A non-Galois cubic extension has no such prime-cyclic tower from F; it is not constructed here.

**Hypotheses.**

- E/F is a finite Galois extension of number fields with solvable Galois group.
- A chosen subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E in which each F_i/F_{i−1} is cyclic of prime degree ℓ_i (F_i need not be normal over F), with compatible embeddings and places.
- π is an isobaric automorphic representation of GL₂(A_F).
- Non-Galois extensions, such as non-normal cubic fields, are excluded.

**Construction.**

1. Choose a subnormal series of the finite solvable group and pass to fixed fields.
2. Compose prime-cyclic base change, retaining every local restriction (local-compatibility at each step and transitivity of restriction) and central-character norm.
3. Independence of the tower is proved directly, without assuming every intermediate field is normal over F. At almost every place, unramified in E and for π, two composites have Satake class A_v^{f(w/v)}, since residue degrees multiply and unramified-base-change composes. Hence they are isomorphic by R16.4 isobaric strong multiplicity one. The theorem tower-independence records this.

**Uses that determine the API.**

- *PotentialModularityAndCompatibleSystems R23.5; R17.6 exports*: Restrict automorphic data through a chosen solvable extension with local splitting retained.
- *Langlands §3*: Use the normal cyclic subextensions for the solvable Artin argument, separate from nonnormal cubic transfer.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Transfer.solvableBaseChange_refl` | simp | For E=F and the empty tower the map is identity. |
| `TauCeti.GL2Transfer.solvableBaseChange_tower` | functoriality | For a nested pair of solvable normal extensions the map agrees with composition, with the chosen compatible embeddings. |
| `TauCeti.GL2Transfer.solvableBaseChange_local` | compatibility | Every local parameter is restriction along the total local extension, and at completely split places it is unchanged. |
| `TauCeti.GL2Transfer.solvableBaseChange_twist` | functoriality | Twisting by χ before BC equals twisting after BC by χ∘N_{E/F}. |

**Unit tests.**

- `TauCeti.GL2Transfer.solvable_empty_test` (degenerate): The empty tower fixes every isobaric class.
- `TauCeti.GL2Transfer.solvable_two_towers_test` (characterisation): For a biquadratic E/F, the towers through two different quadratic subfields give equal isobaric output.
- `TauCeti.GL2Transfer.solvable_degree_six_test` (computation): At a place with local residue degrees two then three, diag(2,3) becomes diag(64,729).
- `TauCeti.GL2Transfer.solvable_cuspidality_test` (non-example): A cuspidal input induced from the first quadratic step is already noncuspidal there, so no blanket solvable cuspidality theorem is asserted.

**Acceptance.**

- For a non-normal cubic field K/F with S₃ normal closure, its own K/F transfer requires the separate cubic node.

**Prerequisites.** [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), [`R17.4/cuspidality`](#R17-4-cuspidality), `R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, [`R17.4/unramified-base-change`](#R17-4-unramified-base-change), [`R17.4/local-compatibility`](#R17-4-local-compatibility).

*Assembly note: the layer citations above, by node.*

- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (none). Independence of the tower is deduced from isobaric strong multiplicity one over E, applied to composite outputs that may be non-cuspidal. R16.4/strong-multiplicity-one covers only pairs of cuspidal representations, and isobaric χ₁⊞χ₂ strong multiplicity one is stated by no part-R16.1 node.

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238). Excerpt: “Consider the representation r7F of Gm(AF0) obtained from r by repeated base change in the tower”. Match: Closest source passage. Arthur–Clozel define ρ_{F→F₀}(τ) by repeated prime-cyclic base change along a tower F = F_r ⊂ F_{r−1} ⊂ ⋯ ⊂ F₀ attached to a subnormal series with cyclic quotients of prime order. OCR: 'r7F' = τ_{F₀}, 'Gm(AF0)' = G_m(A_{F₀}), 'r' = τ. This is a step in a GL(m) proof, not a stated theorem; the node specialises to m = 2 with E/F Galois.
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238). Excerpt: “its uniqueness follows from the fact that the operations involved in IoF and PF--Fo preserve the category of representations induced from cuspidal: these are determined by their Hecke eigenvalues almost everywhere.”. Match: Proof step: the composed lifts preserve representations induced from cuspidal, and these are determined by almost all Hecke eigenvalues (OCR 'IoF', 'PF--Fo' = ι^F_{F₀}, ρ_{F→F₀}). This is the node's tower-independence argument.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3, Lemma 3.1, Digital Math Archive typescript p. 15 (PDF p. 18). Excerpt: “Lemma 3.1 Suppose π and π 0 are two isobaric automorphic representations of GL(2, A). If πv ∼ πv0 for almost all v then π ∼ π 0 .”. Match: Exact GL₂ isobaric strong multiplicity one, used for independence of the tower (credited by Langlands to Callahan). In the packet this input comes from R16.4.

<a id="R17-4-tower-independence"></a>

### `R17.4/tower-independence` — Independence of the solvable tower

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence` · declaration `TauCeti.GL2Transfer.tower_independence` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For two prime-cyclic subnormal towers from F to the same solvable Galois extension E, the composed GL₂ isobaric base changes coincide. At all places unramified in the towers and in π, both Satake classes are A_v^{f(w/v)}, because residue degrees multiply along each tower. Isobaric strong multiplicity one therefore gives an isomorphism of the two global outputs, hence equality of every local component. Strong local compatibility is not needed for independence; it describes each common component as the restriction of the parameter of π_v. No chosen ordered diagonalization or chosen generator of a cyclic Galois group survives in the output.

**Hypotheses.**

- E/F is a finite Galois extension of number fields with solvable Galois group, and two subnormal towers from F to E have prime-cyclic steps.
- π is an isobaric automorphic representation of GL₂(A_F).
- Isobaric strong multiplicity one over E holds (R16.4; Langlands Lemma 3.1).

**Proof outline.**

1. Multiply local residue degrees and use the power rule in a tower.
2. Apply the isobaric R16.4 multiplicity-one input to get the global isomorphism. Local restriction transitivity, via local-compatibility, then describes the common local components. Generator independence at each step is Langlands p. 151 / Arthur–Clozel Ch. 3 Proposition 4.4(i).

**Acceptance.**

- The biquadratic two-tower test has the same arithmetic determinant coefficient along both routes.

**Prerequisites.** [`R17.4/solvable-base-change`](#R17-4-solvable-base-change), [`R17.4/unramified-base-change`](#R17-4-unramified-base-change), [`R17.4/local-compatibility`](#R17-4-local-compatibility), `R16.4`.

*Assembly note: the layer citations above, by node.*

- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (none). The node's hypothesis is isobaric strong multiplicity one over E (Langlands Lemma 3.1), applied to composite outputs that may be θ⊞θ^σ or (χ₁∘N)⊞(χ₂∘N). R16.4/strong-multiplicity-one is stated for cuspidal π only, so the isobaric case is missing from part R16.1.

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238). Excerpt: “its uniqueness follows from the fact that the operations involved in IoF and PF--Fo preserve the category of representations induced from cuspidal: these are determined by their Hecke eigenvalues almost everywhere.”. Match: Closest passage, a proof step only. No source states tower independence for GL₂; the node is the packet's own argument, modelled on this remark that composed tower lifts are determined by almost-all Hecke eigenvalues (OCR 'IoF', 'PF--Fo' = ι^F_{F₀}, ρ_{F→F₀}).
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3, Lemma 3.1, Digital Math Archive typescript p. 15 (PDF p. 18). Excerpt: “Lemma 3.1 Suppose π and π 0 are two isobaric automorphic representations of GL(2, A). If πv ∼ πv0 for almost all v then π ∼ π 0 .”. Match: Exact statement of the key input: two isobaric GL₂ representations that agree at almost all places are isomorphic. The packet supplies it through R16.4.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11, verification of (A)–(G), Digital Math Archive typescript p. 151 (PDF p. 154). Excerpt: “We observe also that, since the notion of a quasi-lifting is independent of σ , the notion of a global lifting is independent of σ .”. Match: Exact only for independence of the generator σ within one prime-cyclic step (the packet's 'verification of generator independence'), not of the tower. Arthur–Clozel Ch. 3 Proposition 4.4(i) is the GL(n) analogue.

<a id="R17-4-solvable-descent"></a>

### `R17.4/solvable-descent` — Descent along a solvable tower with character choices

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent` · declaration `TauCeti.GL2Transfer.solvable_descent` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Fix a prime-cyclic subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E and an isobaric automorphic GL₂ representation Π over E. Then Π is the composed base change of an isobaric π over F along this tower if and only if there is a chain Π_r=Π, Π_{r−1}, …, Π₀=π in which each Π_{i−1} is a cyclic descent of Π_i along F_i/F_{i−1} and, for i≥2, Π_{i−1} is invariant under Gal(F_{i−1}/F_{i−2}). At each step the possible Π_{i−1} are given by the cyclic fibre theorems. If Π_i is cuspidal there are ℓ_i distinct twists. If ℓ_i=2 and Π_i=θ⊞θ^σ with θ≠θ^σ, there is a unique cuspidal descent. If Π_i=(χ₁∘N)⊞(χ₂∘N), the two characters can be twisted independently by norm-kernel characters. The theorem supplies descent once these stepwise choices exist and records their ambiguities. It does not assert that Gal(E/F)-invariance of Π alone yields a descent to F: an invariant choice at each step, and compatibility with prescribed central characters, is a hypothesis, not a conclusion.

**Hypotheses.**

- A fixed subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each F_i/F_{i−1} cyclic of prime degree ℓ_i, and a generator σ_i of each Gal(F_i/F_{i−1}).
- Π is an isobaric automorphic representation of GL₂(A_E).
- Descent along the tower means preimage under the composed base change of solvable-base-change along this tower.
- Gal(E/F)-invariance of Π alone is not assumed to give a descent; the stepwise invariant choices are hypotheses.

**Proof outline.**

1. Apply cyclic descent from the top down (Langlands property (B); Arthur–Clozel Ch. 3 Theorem 4.2(d),(f)) and enumerate its fibers at each step (cyclic-descent-fibers, isobaric-fibers; Arthur–Clozel Ch. 3 Theorem 3.1).
2. Before continuing, check invariance under the next generator and any prescribed central-character restrictions. Use the isobaric fiber theorem once cuspidality has been lost. The converse direction is the definition of the composed base change (solvable-base-change).

**Acceptance.**

- For a quadratic step the central character does not distinguish π and π⊗η, since η²=1.
- The theorem does not silently turn a Galois descent into an automorphic descent.

**Prerequisites.** [`R17.4/cyclic-descent`](#R17-4-cyclic-descent), [`R17.4/cyclic-descent-fibers`](#R17-4-cyclic-descent-fibers), [`R17.4/isobaric-fibers`](#R17-4-isobaric-fibers), [`R17.4/solvable-base-change`](#R17-4-solvable-base-change).

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §3, Theorem 3.1 and its introduction, printed p. 201 (PDF p. 217). Excerpt: “In this paragraph we prove a result which in essence describes the fibers of the global base change correspondence”. Match: Stepwise fibre input. Theorem 3.1: cuspidal π, π′ with (t_{π,v})^{f_v} = (t_{π′,v})^{f_v} almost everywhere satisfy π′ = π⊗χ with χ trivial on F^*N(A_E^*), for cyclic E/F not necessarily of prime degree. Neither source treats descent along a solvable tower; the node iterates the cyclic results.
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3, Theorem 4.2(f) (and (d)), printed p. 203 (PDF p. 219). Excerpt: “(f) Assume II is induced from cuspidal and a-stable. Then II lifts at least one ir; ir is then induced from cuspidal.”. Match: Exact for one cyclic step (OCR 'II' = Π, 'a-stable' = σ-stable, 'ir' = π): a σ-stable Π induced from unitary cuspidal ones descends. Theorem 4.2(d), p. 202, gives the twist fibre for cuspidal Π.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, global properties (A),(B), Digital Math Archive typescript p. 14 (PDF p. 17). Excerpt: “A) Every π has a unique lifting. B) If Π is isobaric in the sense of [24], in particular cuspidal, then Π is a lifting if and only if Πτ ∼ Π for all τ ∈ G(E/F ).”. Match: Exact GL₂ criterion for one step, with no unitarity assumption: an isobaric Π over F_i is a lifting from F_{i−1} iff it is Gal(F_i/F_{i−1})-invariant.

<a id="R17-4-prescribed-local-base-change"></a>

### `R17.4/prescribed-local-base-change` — Base change with prescribed local splitting

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change` · declaration `TauCeti.GL2Transfer.prescribed_local_base_change` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Suppose a solvable normal extension E/F has already been produced by the arithmetic/potential-modularity owner with chosen completions and splitting at a finite set T. Then BC_{E/F}(π)_w≅π_v at every w|v with v∈T completely split; elsewhere its parameter is the restriction to the prescribed completion. If cuspidality is required, check the quadratic self-twist criterion at every tower step. For potentially unramified or ordinary conditions stated by the consuming local owner, export only the consequences of this precise local restriction and normalization. The construction of the extension with prescribed points/splitting is not replanned here.

**Hypotheses.**

- E/F is a solvable Galois extension of number fields with a chosen prime-cyclic tower, supplied by the consumer together with chosen places and completions.
- T is a finite set of places of F that split completely in E.
- π is an isobaric (in applications, cuspidal) automorphic representation of GL₂(A_F); local parameters use the R16.3 arithmetic normalisation.
- The existence of E with the prescribed splitting is supplied by the consumer and not proved here.

**Proof outline.**

1. At each tower step apply the split-place case of local base change (Langlands §8: π_v lifts to π_v ⊗ ⋯ ⊗ π_v), so BC(π)_w≅π_v for v∈T. At the other places apply strong local compatibility step by step.
2. Check cuspidality stepwise with the cuspidality criterion, and pass the local parameter restriction to the consumer's own local-condition comparison. Carayol §12.3.1–12.3.2 is a model consumer.

**Acceptance.**

- A place completely split in E/F cannot acquire a new conductor or a different local type through BC.

**Prerequisites.** [`R17.4/solvable-base-change`](#R17-4-solvable-base-change), [`R17.4/local-compatibility`](#R17-4-local-compatibility), [`R17.4/cuspidality`](#R17-4-cuspidality).

**Sources.**

- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), §12.3.2, printed p. 459 (PDF p. 52). Excerpt: “Pour traiter ce dernier cas, on considère alors une extension quadratique totalement réelle L/F décomposée en v. Le théorème (A) étant maintenant valide pour le relèvement n de n à L - lequel admet deux composantes locales finies essentiellement de carré intégrable”. Match: Consumer use. OCR 'relèvement n de n' is 'relèvement Π de π', read from the page image. Carayol takes a totally real quadratic L/F split at v, so the lift has two essentially square-integrable finite components; that is, π_v is kept at both places above v. The split-place identity is used without comment.
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), §12.3.1, printed pp. 458–459 (PDF pp. 51–52). Excerpt: “C'est une représentation automorphe parabolique du type considéré dans l'énoncé du théorème (B) (avec v l'une des trois places au-dessus de Vo).”. Match: Consumer use (OCR 'Vo' = v₀). Carayol takes a global cubic L/F, totally real and split above v₀ (conditions (a),(b), p. 458), with a single place above p realising a prescribed local cubic extension. The lift then has the type of Theorem (B) at the three places above v₀. In the octahedral case this L/F is non-Galois and uses the separate JPSS cubic lift, outside this node; only the quadratic and cyclic-cubic (tetrahedral) cases are instances.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §8, split places, Digital Math Archive typescript p. 93 (PDF p. 96). Excerpt: “The correct notion of the lifting of an irreducible admissible representation of G(F ) to G(E) = G(F ) × · · · × G(F ) is patent: the representation π lifts to Π = π ⊗ · · · ⊗ π .”. Match: Exact for the split-place clause: at a place split in a cyclic step, the local lift of π_v is π_v at each place above. Iterating along the tower gives BC(π)_w ≅ π_v for v completely split in E.

<a id="R17-4-adjoint-lift"></a>

### `R17.4/adjoint-lift` — The Gelbart–Jacquet adjoint lift ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift` · declaration `TauCeti.GL2Transfer.adjointLift` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Gelbart–Jacquet adjoint lift**

For a unitary cuspidal GL₂ automorphic representation π over a number field F, the adjoint lift Ad(π)=Sym²(π)⊗ω_π^{-1} (the Gelbart–Jacquet lift) is an isobaric automorphic GL₃ representation with trivial central character, self-dual, whose component at every place is the Gelbart–Jacquet local lift: L(s,Ad(π)_v⊗χ_v)=L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v), with the matching ε-factors, for every character χ_v. Through the GL₂ local Langlands correspondence and its pair-factor compatibility these are the factors of the adjoint of the rank-two LLC parameter. At an unramified v with eigenvalues α,β its eigenvalues are α/β,1,β/α. It is invariant under character twist of π. It is cuspidal exactly when π has no nontrivial self-twist (GJ78 Theorem 9.3 and Remark 9.9). If π≅π⊗η with η≠1, then η=η_{E/F} is quadratic, π=AI_{E/F}(θ), and Ad(π)=η_{E/F}⊞AI_{E/F}(θ/θ^σ), with the rank-two induction interpreted isobarically if its character is invariant. The adjoint of a Galois or Weil–Deligne parameter is taken from ArithmeticGaloisRepresentations G7.

**Hypotheses.**

- F is a number field (§9 and Theorem 9.3 are stated for number fields).
- π is a unitary cuspidal automorphic representation of GL₂(A_F).
- Cuspidal branch: π⊗χ≇π for every Hecke character χ≠1 (GJ78 Theorem 9.3).
- Self-twist branch: π≅π⊗η with η≠1; then η=η_{E/F} is quadratic and π=AI_{E/F}(θ) (GJ78 §3.7, Remark 9.9).
- Normalisation: Ad(π)=Sym²(π)⊗ω_π^{-1} is the GJ78 lift, characterised at every place by trivial central character, self-duality and L(s,Ad(π)_v⊗χ_v)=L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v) with matching ε; unitary normalisation.
- The identification of local components with the adjoint of the rank-two LLC parameter uses the GL₂ LLC with pair-factor compatibility (R16.3, ET.6) and the GL₃ local converse theorem; GJ78 does not prove it for extraordinary π_v.

**Construction.**

1. Define the local lift by GJ78 Definition 3.1.3 (trivial central character, self-duality, GL₁-twisted L- and ε-factors equal to L₂ and ε₂); uniqueness is JPSS Lemma (7.5.3), quoted in GJ78 Proposition 3.3(1); for non-extraordinary π_v the lift is the explicit induced or special representation of GJ78 §3.2–3.3.
2. Import GJ78 Theorem 8.1: for highly ramified χ, L₂(s,π,χ) is entire and bounded in vertical strips (Shimura's metaplectic integral). This input is not part of AL.3 Rankin–Selberg theory and is recorded with the GL₃ converse gap.
3. Apply the GL₃ converse theorem in the form of GJ78 §9.2 (functional equations for twists highly ramified at a finite set T) and exclude the non-cuspidal cases (iii)–(v) by poles of L(s,(π⊗μ^{-1})×π̃) and the Jacquet–Shalika nonvanishing on Re s=1 (GJ78 §§9.4–9.8). This gives Theorem 9.3 when π has no self-twist.
4. Self-twist case: GJ78 §3.7 and Remark 9.9 give Ad(π)=Ind(G₃,P;π(θθ'^{-1}),η), automorphic (isobaric) and not cuspidal because L(s,Ad(π)⊗η) has a pole.
5. Compare each local lift with the adjoint of the supplied LLC parameter by equality of GL₁-twisted L- and ε-factors and the GL₃ local converse theorem, using that the GL₂ LLC preserves pair factors (R16.3); this construction does not rebuild general GL₃ automorphic carriers.

**Uses that determine the API.**

- *Langlands §3 tetrahedral argument*: Compare Ad(π) with the cubic monomial representation Ad(ρ) to remove the cyclic descent ambiguity.
- *R16.4 non-CM/self-twist interface*: Identify the automorphic adjoint cuspidality criterion with the source’s no-self-twist condition.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Transfer.adjointLift_local` | compatibility | Each local component of Ad(π) is the Gelbart–Jacquet local lift of π_v; under the GL₂ LLC its parameter is the adjoint of the local parameter of π. |
| `TauCeti.GL2Transfer.adjointLift_unramified` | simp | Satake eigenvalues (α,β) become (α/β,1,β/α). |
| `TauCeti.GL2Transfer.adjointLift_twist` | functoriality | Ad(π⊗χ)=Ad(π) for every Hecke character χ. |
| `TauCeti.GL2Transfer.adjointLift_central` | projection | The central character of Ad(π) is trivial. |

**Unit tests.**

- `TauCeti.GL2Transfer.adjoint_diagonal_test` (computation): The Satake class diag(2,3) gives diag(2/3,1,3/2) in GL₃(Q).
- `TauCeti.GL2Transfer.adjoint_scalar_test` (degenerate): Scalar Satake input diag(a,a), a≠0, gives the identity class.
- `TauCeti.GL2Transfer.adjoint_twist_test` (compatibility): Multiplying both input eigenvalues by any u≠0 does not change the three adjoint eigenvalues.
- `TauCeti.GL2Transfer.adjoint_not_sym_square_test` (non-example): For diag(2,3), the adjoint output differs from diag(4,6,9); forgetting ω^{-1} gives the wrong lift.

**Acceptance.**

- For diag(2,3), unramified adjoint eigenvalues are 2/3,1,3/2, with product one.
- For a nontrivial quadratic self-twist the output is not cuspidal.
- When π has no nontrivial self-twist, L(s,Ad(π)⊗χ) is entire for every Hecke character χ (GJ78 Theorem 9.3(1)).

**Prerequisites.** `R16.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `ArithmeticGaloisRepresentations:G7`, `MetaplecticAutomorphicForms:MP.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`.

*Assembly note: the layer citations above, by node.*

- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter) (none). Identifying Ad(π)_v with the adjoint of the rank-two parameter needs the LLC to preserve the GL₂×GL₂ pair factors L(s,(π_v⊗χ_v)×π̃_v) and their ε-factors, including extraordinary dyadic π_v. principal-series-parameter, steinberg-monodromy and supercuspidal-parameter supply the parameters and the standard twisted (GL₂×GL₁) factors only; pair-factor compatibility is stated by no part-R16.1 node.

**Sources.**

- **gj78** (Stephen Gelbart and Hervé Jacquet, [*A relation between automorphic representations of GL(2) and GL(3)*](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf)), Introduction, printed p. 472 (PDF p. 3). Excerpt: “determined by the adjoint action of PGL (2, C), then (according to Langland's general philosophy) the resulting three dimensional representation”. Match: Normalisation: GJ78 define the lift through the adjoint map GL(2,C)→PGL(2,C)→GL(3,C), i.e. Satake classes diag(α/β,1,β/α); they say the local match with Ad∘φ_v holds 'sometimes only conjecturally'. The identification with the adjoint of the modern LLC parameter is imported (R16.3/ET.6), not in GJ78.
- **gj78** (Stephen Gelbart and Hervé Jacquet, [*A relation between automorphic representations of GL(2) and GL(3)*](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf)), §3.1, Definition 3.1.3 and the remark after it, printed p. 485 (PDF p. 16). Excerpt: “Moreover if n is a lift of a, it is also a lift of CT ® % f^ any 7 and, in particular, o f G ^ a ^ c o " 1 , ® denoting the central quasi-character of a.”. Match: Exact for twist invariance (OCR: n=π, a/CT=σ, %/7=χ; the tail reads 'of σ̃≅σ⊗ω^{-1}'). Definition 3.1.3 itself gives trivial central character, self-duality and L(s,π⊗χ)=L(s,(σ⊗χ)×σ̃)/L(s,χ) with matching ε at each place.
- **gj78** (Stephen Gelbart and Hervé Jacquet, [*A relation between automorphic representations of GL(2) and GL(3)*](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf)), §3.6, printed p. 491 (PDF p. 22). Excerpt: “One of the purposes of this paper is to show that if a is automorphic cuspidal then a admits a lift n and n is automorphic (although perhaps not cuspidal).”. Match: Exact for the output type: the lift exists and is automorphic but not always cuspidal (OCR: a=σ, n=π).
- **gj78** (Stephen Gelbart and Hervé Jacquet, [*A relation between automorphic representations of GL(2) and GL(3)*](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf)), §9, Theorem 9.3, printed p. 534 (PDF p. 65). Excerpt: “(9.3) THEOREM. — Let a be a unitary irreducible representation ofG^ (A) which is automorphic cuspidal.”. Match: Specialisation: Theorem 9.3 assumes σ unitary cuspidal with σ⊗χ≇σ for χ≠1 and gives the local lift at every place and a cuspidal global lift (parts 2–3); this is the cuspidal branch of the node. OCR: a=σ, G^=G₂.
- **gj78** (Stephen Gelbart and Hervé Jacquet, [*A relation between automorphic representations of GL(2) and GL(3)*](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf)), Remark 9.9, printed p. 541 (PDF p. 72); with §3.7, printed p. 491. Excerpt: “Recall that n is automorphic. On the other hand, L(s,n ® %) has some pole (for % = T| for instance), so 7C is ^ cuspidal.”. Match: Exact for the self-twist branch: σ≅σ⊗η, η≠1 forces η²=1, σ=π(θ) on the quadratic field H, lift Ind(G₃,P;π(θθ'^{-1}),η), automorphic by §3.7 and not cuspidal (OCR: n/7C=π, %=χ, T|=η, '^ cuspidal'='not cuspidal').
- **gj78** (Stephen Gelbart and Hervé Jacquet, [*A relation between automorphic representations of GL(2) and GL(3)*](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf)), §5 lead-in, Theorem 8.1, printed p. 496 (PDF p. 27); proof in §§5–8. Excerpt: “THEOREM 8.1. — Suppose a is cuspidal representation of GL(2, A) and % is a "highly ramified" character of F^F^ (see (5.3) below).”. Match: Proof step only: holomorphy and vertical-strip bounds of L₂(s,σ,χ) for highly ramified χ, proved by Shimura's metaplectic integral, feed the GL₃ converse theorem in §9. AL.3 Rankin–Selberg theory does not supply this input.

<a id="R17-4-cubic-character-induction"></a>

### `R17.4/cubic-character-induction` — Cyclic cubic induction of a character

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction` · declaration `TauCeti.GL2Transfer.cubic_character_induction` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For a cyclic cubic extension E/F of number fields and a unitary Hecke character θ of E, there is an isobaric automorphic GL₃ representation AI_{E/F}(θ) whose local parameter at every place is Ind_{W_{E_w}}^{W_{F_v}}(θ_w) (the direct sum over w|v at a split place), in the sense of equal GL₁-twisted L- and ε-factors, and whose standard L-function is L_E(s,θ). It is cuspidal if and only if θ,θ^σ,θ^{σ²} are pairwise distinct, i.e. θ≠θ^σ. If θ=χ∘N_{E/F}, the output is χ⊞χη⊞χη² for the order-three character η associated to E/F. This rank-three character case is the exact monomial input to the tetrahedral proof; the general GL_n automorphic-induction theory is not redeveloped here.

**Hypotheses.**

- F is a number field and E/F a cyclic cubic extension whose Galois group is generated by σ.
- θ is a unitary Hecke character of E (a quasi-character is reduced to this by a twist by |·|^s); JPSS Theorem (14.2) assumes unitarity.
- Cuspidal branch: θ≠θ^σ, which is equivalent to irreducibility of Ind_{W_E}^{W_F}θ (Mackey).
- Invariant branch: θ=θ^σ; then θ=χ∘N_{E/F} by class field theory for the cyclic extension, and η generates the characters of A_F^×/F^×N_{E/F}(A_E^×).
- Unitary normalisation; at finite places the local component is characterised by GL₁-twisted L- and ε-factors equal to those of Ind θ_w.

**Proof outline.**

1. If θ≠θ^σ: Ind θ is irreducible (Mackey), and L(s,Ind θ⊗χ)=L_E(s,θ·(χ∘N_{E/F})) is entire and bounded in vertical strips for every χ, since θ·(χ∘N_{E/F}) is not Galois-invariant and so is never |·|^{it}. Apply JPSS 1979 Theorem (14.2) and the remark on monomial representations; its proof rests on the GL₃ converse theorem (13.6), recorded in the GL₃ supplier gap.
2. If θ=θ^σ: write θ=χ∘N_{E/F} (class field theory for the cyclic extension) and take the isobaric sum χ⊞χη⊞χη²; Ind(χ∘N_{E/F})=χ⊕χη⊕χη² gives the local parameters.
3. Arthur–Clozel Chapter 3 Theorem 6.2 with n=1, ℓ=3 and Theorem 4.2(d),(e) gives the same dichotomy, but only almost everywhere and through GL(3) cyclic base change.

**Acceptance.**

- An invariant character gives three rank-one summands, not a cuspidal GL₃ output.
- The three nontrivial V₄ characters in the tetrahedral adjoint form one cyclic orbit.

**Prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`, `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Sources.**

- **jpss79** (Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, [*Automorphic forms on GL(3). II*](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf)), Automorphic forms on GL(3) II, §14.2, Theorem (14.2), printed pp. 253–254 (PDF pp. 42–43 of the author-site scan; visual transcription). Excerpt: “THEOREM (14.2). Assume that σ is of degree 3 and that, for any character χ of F_A^×/F^×, the function L(s, σ ⊗ χ) is entire, bounded in vertical strips if F is a number field.”. Match: Exact for the cuspidal branch at every place: for an irreducible unitary 3-dimensional σ of W_F with all L(s,σ⊗χ) entire and bounded in vertical strips, ⊗π_v is cuspidal, with π_v fixed by GL₁-twisted L- and ε-factors at finite v and π_v=π(σ_v) at infinite v.
- **jpss79** (Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, [*Automorphic forms on GL(3). II*](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf)), §14.2, remark on monomial representations after the proof, printed p. 255 (PDF p. 44). Excerpt: “We remark that if K/F is normal σ is either irreducible or a direct sum of three one-dimensional representations.”. Match: Specialisation to σ=Ind_{W_E}^{W_F}θ with E/F cyclic cubic: σ is irreducible exactly when θ≠θ^σ (cuspidal branch); otherwise it is a sum of three characters (invariant branch).
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §6, Definition 6.1 and Theorem 6.2, printed p. 215 (PDF p. 231). Excerpt: “there exists one, and only one, representation irF of GL(n, AF) automorphically induced from WrE. Moreover wF is induced from cuspidal.”. Match: Specialisation n=1, ℓ=3, almost everywhere only: Definition 6.1 matches Hecke eigenvalues at almost all places. OCR: irF/wF=π_F, WrE=π_E. The printed 'GL(n, A_F)' is a misprint for GL(nℓ, A_F) (source issue).
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §6, Lemmas 6.3–6.4 and Corollary 6.5, printed pp. 217–218 (PDF pp. 233–234). Excerpt: “Proof. Of course if I is prime this is part of Theorem 4.2. We reduce to the prime case.”. Match: Proof step only: for prime ℓ (here 3) the invariant/non-invariant dichotomy is Theorem 4.2(d),(e), i.e. GL(3) cyclic base change. The composite-degree reduction in this proof is the known gap and is not used. OCR 'I'=ℓ.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3(i), DMA text p. 17 (PDF p. 20). Excerpt: “The following instance of the principle of functoriality is due to Piatetskii-Shapiro ([16]):”. Match: Consumer statement: Langlands's tetrahedral argument takes this cyclic cubic induction (cuspidal π¹ with π¹_v=π(σ_v) for almost all v) from JPSS [16].

<a id="R17-4-gl3-recognition"></a>

### `R17.4/gl3-recognition` — GL₃ analytic recognition for the Artin bridge

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition` · declaration `TauCeti.GL2Transfer.gl3_recognition` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let F be a number field. (i) GL₃ converse theorem (Jacquet–Piatetski-Shapiro–Shalika; Cogdell Theorem 3.3 with n=3, twists of rank n−2=1): let Π=⊗Π_v be an irreducible admissible representation of GL₃(A_F) whose central character is an idele class character and whose Euler product converges in a right half-plane. If for every idele class character χ the functions L(s,Π⊗χ) and L(s,Π̃⊗χ^{-1}) extend to entire functions bounded in vertical strips and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ)L(1−s,Π̃⊗χ^{-1}), then Π is cuspidal automorphic. If this is required only for χ unramified at a finite set S of finite places (or, as in Gelbart–Jacquet §9.2, highly ramified at a finite set T), Π agrees outside that set with an automorphic representation. (ii) Jacquet–Shalika pole criterion: if π¹,π² are unitary cuspidal automorphic representations of GL₃(A_F) with L(s,π²_v×π̃¹_v)=L(s,π¹_v×π̃¹_v) for almost all v, then π²≅π¹, because L^S(s,π¹×π̃¹) has a pole at s=1 and L^S(s,π²×π̃¹) has one only if π²≅π¹. These inputs recognise the adjoint lift (via (i)) and identify it with the cyclic cubic induction of Ad(ρ) in Langlands's tetrahedral argument (via (ii)). In that application both representations are cuspidal, so no GL₃ isobaric strong multiplicity one is used. GL₂ strong multiplicity one and an untwisted L-function alone do not supply these results. The generic proofs belong in the proposed AL extension, not in R16.5 a second time.

**Hypotheses.**

- F is a number field.
- (i): Π is an irreducible admissible representation of GL₃(A_F) with automorphic central character and an Euler product absolutely convergent in a right half-plane.
- (i): for every idele class character χ (or every χ unramified at a fixed finite set S, or highly ramified there as in GJ78 §9.2), L(s,Π⊗χ) and L(s,Π̃⊗χ^{-1}) are entire, bounded in vertical strips, and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ)L(1−s,Π̃⊗χ^{-1}).
- (ii): π¹,π² are unitary cuspidal automorphic representations of GL₃(A_F) whose Rankin–Selberg local factors against π̃¹ agree at almost all places.

**Proof outline.**

1. Route the GL₃ converse theorem (JPSS 1979 (13.6); Cogdell Theorem 3.3) and the Jacquet–Shalika Rankin–Selberg pole and nonvanishing results to the single AL extension after AL.3. These generic proofs stay in the recorded gap until that supplier is written.
2. In the tetrahedral application, take π¹ to be the cubic induction of the V₄ character (cubic-character-induction) and π² to be Ad(π_ps(ρ)) (adjoint-lift). At places inert in E the Rankin–Selberg factors agree because both depend only on cubes of Satake classes (Langlands (3.1)–(3.2)), so (ii) gives π¹≅π² without comparing the Satake classes themselves.

**Acceptance.**

- Meromorphic continuation with an unchecked pole does not meet an entire converse hypothesis.
- At a place inert in the cyclic cubic field only the cubes of the two GL₃ Satake classes are known to agree; (ii) consumes equality of the Rankin–Selberg factors there, not of the Satake classes.

**Prerequisites.** [`R17.4/adjoint-lift`](#R17-4-adjoint-lift), [`R17.4/cubic-character-induction`](#R17-4-cubic-character-induction), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Sources.**

- **converse** (James W. Cogdell, [*Piatetski-Shapiro’s work on converse theorems*](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf)), §3, sentence before Theorem 3.3 and Theorem 3.3, p. 9. Excerpt: “We also have versions of the above theorems when n ≥ 3 and we allow twists only up to rank n − 2 [33, 19].”. Match: Exact for (i) with n=3: twists by GL₁ cuspidal representations (idele class characters) suffice; 'nice' means entire, bounded in vertical strips, with functional equation (pp. 5–6). This is a survey statement; the proof is JPSS 1979 (13.6), not reproduced.
- **converse** (James W. Cogdell, [*Piatetski-Shapiro’s work on converse theorems*](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf)), §3, applications (iv)–(v), p. 10. Excerpt: “(iv) Automorphy of monomial representations of GL3 [33] and non-normal cubic base change for GL2 obtained by Jacquet, Piatetski-Shapiro and Shalika [36], used by Langlands and Tunnel in their work on the automorphy of tetrahedral and octahedral Galois representations [46, 69]”. Match: Consumer statement: the converse theorem with twists of rank n−2 is the input for monomial GL₃ representations and JPSS non-normal cubic base change, used by Langlands and Tunnell, and for the Gelbart–Jacquet lift (item (v)).
- **gj78** (Stephen Gelbart and Hervé Jacquet, [*A relation between automorphic representations of GL(2) and GL(3)*](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf)), Introduction, printed p. 473 (PDF p. 4); §9.2, printed pp. 532–534. Excerpt: “Our main theorem then results from the converse theorem for GL (3) already alluded to.”. Match: Consumer statement: GJ78 use the converse theorem in the JPSS form of §9.2 (functional equation only for twists highly ramified at a finite set T), followed by the case analysis 9.2(i)–(v).
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3(i), DMA text p. 18 (PDF p. 21), with (3.1)–(3.2). Excerpt: “It is to be expected that π 1 and π2 are equivalent, and this can indeed be established, using a criterion of Jacquet–Shalika ([15]).”. Match: Exact for (ii): Langlands checks L(s,π¹_v×π̃¹_v)=L(s,π²_v×π̃¹_v) for almost all v and concludes π¹≅π² by the Jacquet–Shalika criterion ([15], C. R. 284 (1977)). Superscripts are flattened in the text layer.

<a id="R17-4-nonnormal-cubic-base-change"></a>

### `R17.4/nonnormal-cubic-base-change` — Non-normal cubic base change ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change` · declaration `TauCeti.GL2Transfer.cubicBaseChange` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Non-normal cubic base change**

Let K/F be a separable non-Galois cubic extension of number fields, with S₃ normal closure. The Jacquet–Piatetski-Shapiro–Shalika cubic transfer associates to a cuspidal GL₂ automorphic π over F an automorphic GL₂ representation BC_{K/F}(π) over K, taken isobaric, whose Satake class at almost every w|v is A_v^{f(w/v)}. In Tunnell's statement of [JPSS], Π_w=π(Res ρ_v) whenever π_v=π(ρ_v), for almost all v. For an isobaric π=π(μ,ν) the transfer is π(μ∘N_{K/F},ν∘N_{K/F}). This stage constructs only this weak transfer. Carayol §12.2.1 also records local lifts for extensions of degree at most three (for non-Galois cubic extensions defined by L- and ε-factors) and states that the global lift has these local lifts as components at every place. That all-place statement, which Carayol's extraordinary comparison (AutomorphicGaloisRepresentations R19.2/carayol-cubic-base-change-of-extraordinary) needs, together with the correspondence of the local lift of a principal series, special or ordinary cuspidal π_v with the restriction of its Weil–Deligne parameter (asserted by Carayol §12.2.2 without reference), is an explicit source-proof gap and not part of these construction steps. The transfer respects twists via the norm and preserves the central character by norm pullback. A cuspidal input can cease to be cuspidal; for the primitive tetrahedral/octahedral dyadic parameters of Carayol §12.2.2, the restricted local parameter is irreducible. The original JPSS note and its GL₃/GL₂×GL₃ proof have not been obtained: the theorem rests on Tunnell's and Carayol's consumer statements.

**Hypotheses.**

- K/F is a separable cubic extension of number fields that is not Galois (normal closure with group S₃); the source theorem also covers Galois K/F.
- The input π is a cuspidal automorphic representation of GL₂(A_F) (both sources). The isobaric input π(μ,ν) is handled by composing the characters with N_{K/F}.
- Compatibility is asserted only at almost all places (unramified v with π_v=π(ρ_v)); the output is determined up to isomorphism among isobaric representations.
- Unitary normalisation; A_v is the Satake class of π_v and the output class at w|v is A_v^{f(w/v)}.

**Construction.**

1. Use the JPSS construction through automorphic forms on GL(3) and GL(2)×GL(3) (Tunnell p. 173), not a fictitious cyclic tower from F to K. Its details are in the unread CRAS note and remain a source gap.
2. Identify good-place powers: for unramified π_v=π(ρ_v) and w|v, Res ρ_v has Frobenius ρ_v(Frob_v)^{f(w/v)}. Use isobaric strong multiplicity one over K (R16.4) to fix the global candidate and to derive the twist and central-character identities.
3. These steps establish only weak transfer. The all-place compatibility with the JPSS local lift (Carayol §12.2.1(a)–(b)) awaits the original JPSS source or a supplier proof (for example Mao–Rallis, Canad. J. Math. 52 (2000), relative trace formula). Carayol's extraordinary local comparison, owned by AutomorphicGaloisRepresentations R19.2, consumes that all-place statement.

**Uses that determine the API.**

- *Tunnell’s octahedral argument, cited in Carayol §12.2*: Restrict an S₄ projective Artin representation to the index-three Sylow-2 preimage field.
- *Carayol Proposition 12.2.2; AutomorphicGaloisRepresentations R19.2, R19.4–R19.5*: Resolve extraordinary dyadic local parameters by a cubic extension, then compare restrictions and determinants.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Transfer.cubicBaseChange_unramified` | simp | At unramified w\|v the output Satake class is the f(w/v)-power of the input class. |
| `TauCeti.GL2Transfer.cubicBaseChange_twist` | functoriality | BC_{K/F}(π⊗χ)=BC_{K/F}(π)⊗(χ∘N_{K/F}). |
| `TauCeti.GL2Transfer.cubicBaseChange_central` | projection | The central character is ω_π∘N_{K/F}. |
| `TauCeti.GL2Transfer.cubicBaseChange_unique` | characterisation | The isobaric global output is uniquely determined by its almost-everywhere local Satake powers. |

**Unit tests.**

- `TauCeti.GL2Transfer.cubic_split_test` (compatibility): At a completely split place the three outputs are all the original Satake class A.
- `TauCeti.GL2Transfer.cubic_one_two_test` (computation): For splitting type (1,2) and A=diag(2,3), the two outputs are diag(2,3) and diag(4,9).
- `TauCeti.GL2Transfer.cubic_inert_test` (computation): For residue degree three and A=diag(2,3), the output is diag(8,27).
- `TauCeti.GL2Transfer.cubic_not_three_test` (non-example): At splitting type (1,2), replacing every output by A³ gives the wrong local components.

**Acceptance.**

- A nonnormal cubic field has no degree-three cyclic intermediate extension from F.
- For a place of splitting type (1,2), the two output local Satake classes are A and A².

**Prerequisites.** [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), [`R17.4/gl3-recognition`](#R17-4-gl3-recognition), `R16.3`, `R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `R16.5`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

*Assembly note: the layer citations above, by node.*

- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter) (clear). The node uses the unramified LLC in the unitary normalization, π_v=π(ρ_v) with Satake class ρ_v(Frob_v), to compute the good-place powers A_v^{f(w/v)}; principal-series-parameter states this for unramified principal series over every finite extension of ℚ_p (with geometric Frobenius, which does not affect the power rule).
- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (none). The node fixes the isobaric candidate over K, and derives the twist and central-character identities, by isobaric strong multiplicity one over K, since the output may be non-cuspidal (for instance π(μ∘N,ν∘N)). R16.4/strong-multiplicity-one is for cuspidal π only; the isobaric case is stated by no part-R16.1 node.
- `R16.5` → [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse) (probable). full-gl2-converse is the GL₂ converse theorem over an arbitrary number field (here K) with every Hecke-character twist entire and bounded in vertical strips, the form requested for the JPSS construction. It yields only cuspidal outputs, so it cannot by itself cover the node's non-cuspidal outcomes, and the form of converse theorem used in the unread JPSS note is not confirmed.

**Sources.**

- **tunnell81** (Jerrold Tunnell, [*Artin's conjecture for representations of octahedral type*](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf)), Theorem [4] (Tunnell's statement of JPSS), printed p. 173. Excerpt: “Let K be a cubic extension of F (not necessarily Galois). For each automorphic cuspidal representation n of GL(29 AF) there exists an automorphic representation U = BCK,F(TT) ofGL(2, AK) such that for almost all places v of F, and each place w of K dividing v,”. Match: Exact for the weak theorem: K/F cubic, not necessarily Galois; cuspidal π; automorphic Π with Π_w=π(Res ρ_v) whenever π_v=π(ρ_v), at almost all places. OCR: n/TT=π, U=Π, GL(29 AF)=GL(2,A_F). The node adds only the elementary isobaric extension.
- **tunnell81** (Jerrold Tunnell, [*Artin's conjecture for representations of octahedral type*](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf)), paragraph after Theorem [4], printed p. 173. Excerpt: “This theorem is proved using the theory of automorphic forms on GL(3) and GL(2) x GL(3). The basic concept is similar to that of the example of quadratic base change given in [3, §20].”. Match: Proof only announced: Tunnell gives no proof, only the GL(3) and GL(2)×GL(3) method and the analogy with Jacquet LNM 278 §20.
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), §12.2.1, printed p. 457 (PDF p. 50). Excerpt: “Cependant, des arguments fondés sur la théorie des fonctions L ont permis à Jacquet, Piatetskii-Shapiro et Shalika [J.P.S.S.] de définir aussi un tel changement de base dans le cas d'une extension cubique non galoisienne.”. Match: Consumer statement attributing the non-Galois cubic base change to [J.P.S.S.] (C. R. 292 (1981), p. 567).
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), §12.2.1(b), printed p. 457 (PDF p. 50). Excerpt: “Alors il existe une représentation automorphe n = ® n ^ du groupe GL^ (AJ, telle que pour chaque place w de L au-dessus d'une place v de F, la composante locale n^ soit le relèvement (pour l'extension L^/Fy) de la composante locale n^.”. Match: Stronger consumer statement: for extensions of degree at most three, the global lift has the local lift (defined for non-Galois cubic extensions by L- and ε-factors) as component at every w|v. OCR: n/n^=π or Π components, GL^ (AJ=GL₂(A_L). Carayol gives no proof; the node keeps only the weak part and records the all-place part as a gap.

<a id="layer-R17-5"></a>

# Layer R17.5. Automorphic induction and Langlands–Tunnell

Automorphic induction and the Langlands–Tunnell theorem. Quadratic automorphic induction (`quadratic-induction`) gives dihedral Artin automorphy (`dihedral-artin`). Projective lifting follows Tate: H²(G_F, ℚ/ℤ) = 0 (`tate-vanishing`), the extension of characters of μ_n(F)\μ_n(𝔸_F) to the idele class group (`finite-hecke-extension`) and lifts of finite projective images (`finite-projective-lift`). Tetrahedral automorphy uses base change to a cyclic cubic field and descent (`tetrahedral-artin`); octahedral automorphy uses Tunnell's argument with non-normal cubic base change (`octahedral-artin`). Together they give the strong Artin conjecture for solvable image (`solvable-artin`).

Weight one follows over ℚ (`q-weight-one`, Deligne–Serre) and over totally real fields (`tr-weight-one`, Rogawski–Tunnell). For p > 2, a residual representation with solvable image lifts and is modular (`odd-residual-lift`, `residual-lt-application`). The layer also plans Tunnell's globalisation of a local Weil representation (`tunnell-primitive-globalization`), automorphic induction with prescribed local components (`prescribed-local-induction`) and the octahedral mod-3 application (`octahedral-mod-three-application`).

**Nodes:** 15. **Planets:** Quadratic automorphic induction, Tate’s vanishing theorem, Tetrahedral Artin automorphy, Octahedral Artin automorphy, Langlands–Tunnell theorem.

<a id="R17-5-quadratic-induction"></a>

### `R17.5/quadratic-induction` — Quadratic automorphic induction ★

*Construction* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction` · declaration `TauCeti.GL2Transfer.quadraticInduction` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Quadratic automorphic induction**

Let K/F be a quadratic extension of number fields, σ its nontrivial automorphism and θ a Hecke character of K. Quadratic automorphic induction AI_{K/F}(θ) is an isobaric GL₂ automorphic representation with local parameter Ind_{W_{K_w}}^{W_{F_v}}(θ_w), interpreted as the direct sum over w|v at a split place. It is cuspidal exactly when θ≠θ^σ. Its central character is η_{K/F}·θ|_{A_F×}, and L_F(s,AI θ)=L_K(s,θ). Its quadratic base change is θ⊞θ^σ. It commutes with twisting by χ of F using θ·(χ∘N_{K/F}); if θ=χ∘N, it is χ⊞χη, not cuspidal. The finite-group induction carrier and Mackey formulas are imported, not defined here.

**Hypotheses.**

- K/F is a separable quadratic extension of number fields (JL70 allows global fields), σ its nontrivial automorphism and η=η_{K/F}.
- θ is a Hecke character (quasi-character of A_K^×/K^×).
- Cuspidal branch: θ≠θ^σ, equivalently θ does not factor through N_{K/F} (class field theory).
- Unitary normalisation: at inert or ramified v the local component is π(Ind θ_w); at split v it is π(θ_w,θ_{w′}).

**Construction.**

1. For θ not factoring through the norm, apply Jacquet–Langlands Proposition 12.1: L(s,ω⊗Ind θ)=L_K(s,θ·(ω∘N_{K/F})) and its dual are entire and bounded in vertical strips for every ω, so the GL₂ converse theorem (JL70 Theorem 11.3, R16.5) gives the cuspidal ⊗_vπ(σ_v).
2. For θ=χ∘N_{K/F}, Ind θ=χ⊕χη and the output is the isobaric π(χ,χη). θ=θ^σ exactly when θ factors through the norm (class field theory).
3. Compare determinants of induced local parameters for the central character η_{K/F}·θ|_{A_F^×}. The split-place direct-sum formula and the conjugation orbit give BC_{K/F}(AI θ)=θ⊞θ^σ (Langlands §2 property (e)).
4. Arthur–Clozel Chapter 3 Theorem 6.2 with n=1 and ℓ=2 gives the same result almost everywhere and may replace step 1 for existence.

**Uses that determine the API.**

- *Langlands §3; R17.5 dihedral case; Rohrlich–Tunnell §2; Wiese Lemmas 2–3*: Automorphy of finite dihedral Artin parameters, including the auxiliary odd characteristic-zero lifts of mod-two representations.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.GL2Transfer.quadraticInduction_local` | compatibility | Local LLC of AI θ is local induction of θ, with a direct sum at a split place. |
| `TauCeti.GL2Transfer.quadraticInduction_central` | projection | ω(AI θ)=η_{K/F}·θ\|_{A_F×}. |
| `TauCeti.GL2Transfer.quadraticInduction_baseChange` | characterisation | BC_{K/F}(AI θ)=θ⊞θ^σ. |
| `TauCeti.GL2Transfer.quadraticInduction_twist` | functoriality | AI(θ·χ∘N)=AI(θ)⊗χ. |
| `TauCeti.GL2Transfer.quadraticInduction_cuspidal` | characterisation | AI θ is cuspidal if and only if θ≠θ^σ. |

**Unit tests.**

- `TauCeti.GL2Transfer.induction_invariant_test` (degenerate): θ=χ∘N has output χ⊞χη and is not cuspidal.
- `TauCeti.GL2Transfer.induction_split_test` (compatibility): At v split as w,w′ the local parameter is θ_w⊕θ_w′.
- `TauCeti.GL2Transfer.induction_determinant_test` (computation): For a coset element with induced matrix [[0,a],[b,0]], its determinant is −ab, accounting for the quadratic character.
- `TauCeti.GL2Transfer.induction_noninvariant_test` (non-example): When θ≠θ^σ, replacing AI θ by two F-characters contradicts cuspidality.

**Acceptance.**

- An invariant character gives χ⊞χη; a non-invariant character gives a cuspidal representation.
- At a split place the two local characters, rather than an irreducible local induction, are the output.

**Prerequisites.** [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), `R16.3`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `R16.5`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

*Assembly note: the layer citations above, by node.*

- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (probable). Uses the local component π(Ind θ_w) at every place: principal series π(θ_w,θ_w′) at split v and π(χ_w,χ_wη_w) when θ_w factors through the norm (principal-series-parameter); a supercuspidal when θ_w≠θ_w^σ (supercuspidal-parameter, which names quadratic induction as 'a dihedral example when θ≠θ^σ'); the archimedean induced parameter Ind_{ℂ×}^{Wℝ} and the split complex places (archimedean-classification, archimedean-factor-comparison); determinants, twists and conductors (conductor-epsilon-comparison). Differences: Normalization: part R16.1's rec is fixed by Art_F(ϖ)=geometric Frobenius (principal-series-parameter), whereas part R17.3's R16.3 request and R17.4/local-compatibility ask for the arithmetic-normalized rec; the two differ by π↦π∨ (Frobenius inversion of the whole Weil–Deligne datum, flagged only as a caution in tate-unitary-normalization), and no part-R16.1 node states the arithmetic version or this conversion. Proof step 1 (JL70 §12) needs ε(s,π_v⊗ω_v,ψ_v)=ε(s,Ind θ_w⊗ω_v,ψ_v) for every twist; part R16.1 states twisted ε only for supercuspidals, and for principal series only L(s,π)=L(s,χ₁)L(s,χ₂).
- `R16.5` → [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse) (clear). Proof step 1 applies JL70 Theorem 11.3 to ⊗_vπ(Ind θ_v) over a number field with the full Hecke-character twist family. full-gl2-converse states exactly this: number field F, irreducible admissible generic tensor with central character trivial on F×, spherical almost everywhere with a uniform exponent bound, and for every Hecke quasicharacter χ the completed L(s,Π⊗χ), L(s,Π̃⊗χ⁻¹) entire, bounded in vertical strips and satisfying the functional equation, giving cuspidality. The local components here are irreducible generic (θ_w/θ_w′ is never ν^{±1}), and the entire L-functions are the Hecke L-functions L_K(s,θ·(ω∘N)).

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §12, Proposition 12.1, printed p. 206 (PDF p. 212 of the IAS scan). Excerpt: “quasi-character µ of CF such that χ(α) = µ(NK/F α) for all α in CK the representation v π(σv ) is a constituent of A0 .”. Match: Exact for the cuspidal branch at every place: if χ does not factor through N_{K/F}, ⊗_vπ(σ_v) is cuspidal (A₀ = cusp forms; 'v' is the subscript of the lost ⊗). Proof by the GL₂ converse theorem (Theorem 11.3) with L(s,ω⊗σ)=L(s,ω_{K/F}χ).
- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §12, paragraph before Proposition 12.1, printed p. 206. Excerpt: “If K/F is a separable quadratic extension, χ is a quasi-character of CK = WK/K , and σ = Ind(WK/F , WK/K , χ) then π(σ) = π(χ).”. Match: Exact for the local parameter: the Weil-representation constituent π(χ) is π(Ind χ) in the §12 sense (twisted L- and ε-factors, central character det σ); at split v, σ_v is a sum of two characters.
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §6, Theorem 6.2, printed p. 215; Lemmas 6.3–6.4 and Corollary 6.5, printed pp. 217–218. Excerpt: “Let E/F be a cyclic extension of global fields of degree 1 (prime or not).”. Match: Alternative source, specialisation n=1, ℓ=2: existence and the orbit criterion, but only almost everywhere (Definition 6.1) and via GL(2) cyclic base change. OCR '1'=ℓ.

<a id="R17-5-dihedral-artin"></a>

### `R17.5/dihedral-artin` — Dihedral Artin automorphy

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin` · declaration `TauCeti.GL2Transfer.dihedral_artin` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let ρ:G_F→GL₂(C) be continuous, irreducible and finite-image, with dihedral projective image. The imported classification gives a quadratic K/F and a finite-order character θ of G_K with ρ≅Ind_{G_K}^{G_F} θ. Reciprocity identifies θ with a finite-order Hecke character, and quadraticInduction(θ) is the unique cuspidal GL₂ automorphic representation whose normalized local parameter is ρ|_{W_{F_v}} at every place. Over totally real F, total oddness makes the infinite components the holomorphic parallel-weight-one parameters; this archimedean consequence is separate from finite-place automorphy.

**Hypotheses.**

- F is a number field.
- ρ:G_F→GL₂(C) is continuous, irreducible and has finite image.
- The projective image is dihedral D_n with n≥2 (including V₄), so ρ≅Ind_{G_K}^{G_F}θ for a quadratic K/F and a finite-order character θ≠θ^σ of G_K.
- Local parameters are normalised (unitary); holomorphic weight one needs F totally real and ρ totally odd.

**Proof outline.**

1. Use the finite-image induction criterion from R01.4 and the imported Mackey/Clifford theory.
2. Apply finite-order reciprocity and quadratic automorphic induction.
3. Local induction commutes with the reciprocity dictionary; use strong multiplicity one for uniqueness.

**Acceptance.**

- A reducible induction of an invariant character is excluded by irreducibility.
- Oddness is needed for holomorphic weight one, not for the all-number-field automorphic assertion.

**Prerequisites.** [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `R16.4`.

*Assembly note: the layer citations above, by node.*

- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (clear). Used only in proof step 3 for uniqueness of the cuspidal π whose local parameter is ρ|W_{F_v} at every place. strong-multiplicity-one is stated for cuspidal π,π′ over any number field with isomorphic components at all finite places outside a finite set, and concludes isomorphism at every place, which covers this use; no isobaric case is needed.

**Sources.**

- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §12, Proposition 12.1, printed p. 206 (PDF p. 212). Excerpt: “quasi-character µ of CF such that χ(α) = µ(NK/F α) for all α in CK the representation v π(σv ) is a constituent of A0 .”. Match: Exact at every place once ρ=Ind θ with θ a finite-order character that does not factor through the norm (equivalently ρ irreducible). 'v' is the subscript of the lost ⊗; A₀ denotes cusp forms.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), Introduction, DMA text p. 4 (PDF p. 7). Excerpt: “If ρ is dihedral, by which I shall mean, in spite of justified reproofs, induced from a quasi-character of the Weil group of a quadratic extension, the existence of π(ρ) is implicit in the work of Hecke and of Maass.”. Match: Consumer statement for the dihedral case. Langlands §3 itself (DMA p. 16) only assumes ρ 'neither reducible nor dihedral'.

<a id="R17-5-finite-hecke-extension"></a>

### `R17.5/finite-hecke-extension` — Extension of finite-order idele-torsion characters

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension` · declaration `TauCeti.GL2Transfer.finite_hecke_extension` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let F be a number field, n≥1, and ω:μ_n(F)\μ_n(A_F)→S¹ a continuous character, where μ_n(F)\μ_n(A_F) is viewed inside the idele class group C_F. Then ω extends to a finite-order continuous character of C_F if and only if its component ω_v on μ_n(F_v) is trivial at every complex place v; real places impose no condition. In particular the obstruction vanishes when F has no complex place, e.g. for totally real F. Extensions are not unique. In the Grunwald–Wang special case the cokernel of μ_n(F)\μ_n(A_F)→C_F[n] has order two, so one first chooses one of two extensions of ω to C_F[n]; either choice admits a finite-order extension when the condition holds, and the case affects only uniqueness. This is an arithmetic extension theorem on the canonical GlobalNumberFields Hecke-character carrier, not a new character group.

**Hypotheses.**

- F is a number field and n ≥ 1; C_F = F^×\A_F^× is the idele class group, into which μ_n(F)\μ_n(A_F) embeds as a closed subgroup.
- ω: μ_n(F)\μ_n(A_F) → S¹ is a continuous character (automatically of order dividing n).
- An extension means a continuous character ω̃: C_F → S¹ restricting to ω; finite order means ω̃ has finite image.
- The criterion concerns only the complex places: ω_v = ω|μ_n(F_v) must be trivial for every complex v; no condition is imposed at real places.

**Proof outline.**

1. Necessity: a continuous finite-order character of C_F has open kernel, so it is trivial on the identity component D_F; the image of the connected group F_v^×≅C^× at a complex place lies in D_F, so the extension, and hence ω_v, is trivial on μ_n(C).
2. Sufficiency, following Patrikis Lemma 2.3.6: extend ω to the closed subgroup C_F[n] (one of two choices in the Grunwald–Wang special case), then by Pontryagin duality to a continuous character ω̃ of C_F; its archimedean component has the form ∏_v (x_v/|x_v|)^{m_v}|x_v|^{it_v}, and the hypothesis gives m_v≡0 mod n at every complex v.
3. By Weil's criterion for Hecke characters with prescribed archimedean component (Patrikis Lemma 2.3.1), choose a Hecke character ψ with ψ^n equal to ω̃ on the identity component of F_∞^×. Then ω̃ψ^{−n} still extends ω, since ψ^n is trivial on C_F[n]. It is trivial on that identity component and, by continuity, on an open subgroup of the finite unit ideles, so it factors through a ray class group and has finite order.

**Acceptance.**

- Over a totally real field the complex-place obstruction is vacuous.
- A nontrivial character on a connected complex-place component cannot have a finite-order extension.
- Real places impose no condition: for F=Q and n=2, the character of μ_2(Q)\μ_2(A_Q) that is nontrivial exactly at ∞ and at 2 is the restriction of the quadratic Hecke character of Q(i)/Q.

**Prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Sources.**

- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), §2.3, Lemma 2.3.6, first bullet, printed p. 30 (PDF p. 34). Excerpt: “There exists a finite-order extension ω̃ if and only if for all complex v|∞, the classes mv ∈ Z/nZ are all zero.”. Match: Exact for the finite-order clause: Patrikis writes ω_∞ = ∏ι_v(x_v)^{m_v} with m_v ∈ Z/nZ, and m_v = 0 at a complex v means ω_v is trivial on μ_n(C). The node omits his type A clauses. His proof gives only sufficiency ('a simple variant'); necessity is the node's identity-component step.
- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), proof of Lemma 2.3.6, printed pp. 30–31 (PDF pp. 34–35). Excerpt: “The cokernel of µn (F)\µn (A) → C F [n] is either trivial or order 2, the latter case being the Grunwald-Wang special case”. Match: Proof step: in the Grunwald–Wang special case one first chooses one of two extensions ω_0 to C_F[n]; the existence argument works for either choice (second bullet: the case only affects uniqueness). The old node wording 'one with the required finite-order property' is corrected.

<a id="R17-5-tate-vanishing"></a>

### `R17.5/tate-vanishing` — Tate’s arithmetic obstruction vanishing ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing` · declaration `TauCeti.GL2Transfer.tate_vanishing` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Tate’s vanishing theorem**

For any number field F, H²_cont(G_F,Q/Z)=0, where Q/Z is discrete with trivial G_F-action. Consequently a continuous finite-image projective representation over C has zero obstruction after enlarging its finite root-of-unity coefficient group. This does not assert H²(G_F,μ_n)=0 for fixed n, nor use Q/Z with cyclotomic action. Continuous cochains and connecting maps are supplied by ProfiniteCohomology; the arithmetic vanishing is proved here.

**Hypotheses.**

- F is a number field and G_F its absolute Galois group with the Krull topology.
- Q/Z is a discrete G_F-module with trivial action; cohomology is continuous cochain cohomology.
- The consequence for projective representations concerns continuous finite-image homomorphisms G_F→PGL_n(C) and uses obstruction classes with trivial μ_m coefficients.

**Proof outline.**

1. Reduce to H²(G_F,Q_p/Z_p)=0 for each prime p, using Q/Z=⊕_p Q_p/Z_p and compatibility of continuous cohomology with this sum; by restriction–corestriction along F(μ_p)/F, of degree prime to p, assume μ_p⊂F (Patrikis Theorem 2.1.1).
2. H²(G_F,Q_p/Z_p) is p-primary, so it suffices that the connecting map δ:H¹(G_F,Q_p/Z_p)→H²(G_F,Z/p)≅Br(F)[p] is surjective; the identification uses μ_p⊂F and Hilbert 90.
3. Locally, via local reciprocity, a character of F_v^× is a p-th power iff it is trivial on μ_p(F_v), so δ_v(φ_v) depends only on φ_v|μ_p(F_v) and δ_v maps onto Br(F_v)[p]. For a global α∈Br(F)[p] choose φ_v with δ_v(φ_v)=α_v. The restrictions form a character of μ_p(F)\μ_p(A_F), since α is global and its invariants sum to zero, and it is trivial at complex places.
4. Extend that character to a finite-order Hecke character by finite-hecke-extension, read it as an element of H¹(G_F,Q/Z) by global reciprocity and project to Q_p/Z_p; its image under δ has local components α_v, hence equals α because Br(F)→⊕_v Br(F_v) is injective.

**Acceptance.**

- A nonzero fixed-coefficient H² class may become zero only after increasing the root-of-unity group.
- The theorem does not imply the vanishing of the Brauer group of F.
- With the cyclotomic action the analogous group H²(G_F,Q/Z(1)) is Br(F)≠0, so the trivial-action hypothesis cannot be dropped.

**Prerequisites.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, [`R17.5/finite-hecke-extension`](#R17-5-finite-hecke-extension), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`.

**Sources.**

- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), §2.1, Theorem 2.1.1 and first line of proof, printed p. 17 (PDF p. 21). Excerpt: “Theorem 2.1.1 (Tate; see [Ser77, Theorem 4]). Let F be a number field. Then H 2 (ΓF , Q/Z) = 0. Proof. It suffices to prove H 2 (ΓF , Q p /Z p ) = 0 for all primes p,”. Match: Exact statement; Q/Z has trivial action and continuous cohomology of Γ_F is meant. Patrikis gives Tate's classical proof in a variant routed through his Lemma 2.3.6, as in the node.
- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), proof of Theorem 2.1.1, printed p. 18 (PDF p. 22). Excerpt: “and we need only produce a finite-order extension to a Hecke character φ̃ : C F → Q/Z. The archimedean classes αv are trivial for v complex, so Lemma 2.3.6 implies the existence of such an extension”. Match: Proof step: the local choices for a global p-torsion Brauer class give a character of μ_p(F)\μ_p(A_F), trivial at complex places, extended by finite-hecke-extension.
- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), §2.1, proof of Proposition 2.1.4, printed p. 19 (PDF p. 23). Excerpt: “These isogenies yield obstruction classes cn ∈ H 2 (ΓF , Z/n) (as ΓF -module, the µn ⊂ S ∨ [n] is of course trivial) that are compatible under the natural maps Z/n → Z/n0 for n|n0 .”. Match: Supports the 'consequently' sentence: obstruction classes with trivial μ_n coefficients die in the colimit H²(Γ_F,Q/Z)=0, so they vanish after enlarging n; the lifting itself is finite-projective-lift.

<a id="R17-5-finite-projective-lift"></a>

### `R17.5/finite-projective-lift` — Continuous finite-image arithmetic projective lifting

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift` · declaration `TauCeti.GL2Transfer.finite_projective_lift` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let F be a number field and r:G_F→PGL₂(C) a continuous finite-image homomorphism. There exist a continuous finite-image ρ:G_F→GL₂(C) and an identification of its projectivization with r. Choose representatives in SL₂(C) of the finite projective image, so the factor set takes values in μ₂. By tate-vanishing its class dies in H²(G_F,μ_M) for some even M, giving a continuous cochain with values in the finite group μ_M. Correcting the representatives by this cochain gives a homomorphism whose image lies in μ_M times the preimage in SL₂(C) of r(G_F), a finite group; continuity holds because both factors are locally constant. Any two continuous finite-image lifts of the same identified projective homomorphism differ by a continuous finite-order scalar character. At a real place where r(c) is a nontrivial involution, every linear lift is odd (eigenvalues +1,−1); trivial projective r(c) cannot give an odd two-dimensional lift. No determinant-one or prescribed residual reduction is asserted.

**Hypotheses.**

- F is a number field and r: G_F→PGL₂(C) is a continuous homomorphism with finite image (equivalently with open kernel).
- The lift is a continuous homomorphism ρ: G_F→GL₂(C) with finite image whose composite with GL₂(C)→PGL₂(C) is r.
- For the archimedean clause: v is a real place, c_v∈G_F a complex conjugation at v, and r(c_v)≠1.

**Proof outline.**

1. Apply the imported factor-set interface and pinned zero-class lifting theorem after tate-vanishing; do not redefine projective representations.
2. Prove continuity and finite image from the trivializing cochain, which takes values in a finite group μ_M of roots of unity and is continuous; the algebraic library theorem alone supplies neither property. This is the specialisation to GL₂→PGL₂ of Patrikis Proposition 2.1.4 (lift to μ_n·SL₂ for large n).
3. Scalar ratios are multiplicative; their continuity and finite image give the finite-order twist ambiguity.
4. At c²=1: ρ(c)²=1, so ρ(c) is diagonalizable with eigenvalues ±1. It is scalar exactly when r(c)=1, so a nontrivial r(c) forces eigenvalues +1 and −1 and det ρ(c)=−1.

**Acceptance.**

- Enlarging the scalar root-of-unity group is allowed; insisting on μ_n may leave an obstruction.
- This lifting theorem alone does not prove that a prescribed mod-p representation is the reduction of the lift.

**Prerequisites.** [`R17.5/tate-vanishing`](#R17-5-tate-vanishing), `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`, `tauceti:TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero`, `mathlib:Matrix.ProjGenLinGroup`, `mathlib:Matrix.ProjGenLinGroup.mk`, `ArithmeticGaloisRepresentations:R01.1`.

**Sources.**

- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), §2.1, Proposition 2.1.4, printed p. 19 (PDF p. 23). Excerpt: “Then any continuous representation ρ : ΓF → H(Q` ) lifts to”. Match: Specialisation: Patrikis (after Conrad, Prop. 5.3) lifts continuous ρ:Γ_F→H(Q̄_ℓ) through H̃→H with central torus kernel (OCR 'Q`' is Q̄_ℓ). The node takes GL₂→PGL₂ (kernel G_m) and finite-image r over C, where the same argument applies after viewing the finite image over Q̄.
- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), proof of Proposition 2.1.4, printed p. 19 (PDF p. 23). Excerpt: “These isogenies yield obstruction classes cn ∈ H 2 (ΓF , Z/n) (as ΓF -module, the µn ⊂ S ∨ [n] is of course trivial) that are compatible under the natural maps Z/n → Z/n0 for n|n0 .”. Match: Proof step: for GL₂ the isogeny complement is SL₂ and H̃_n=μ_n·SL₂; Tate's theorem kills c_n for large n. The kernel μ_n of H̃_n→PGL₂ is finite, which gives the finite image of the lift.
- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), Remark 2.1.5, printed p. 19 (PDF p. 23). Excerpt: “For example (and similarly in general; compare Lemma 3.2.2), in the case of GLn → PGLn , this proof produces lifts with finite-order determinant.”. Match: Supports the finite-order determinant (hence finite image) and, with the first bullet, the need to enlarge coefficients. The twist ambiguity and the archimedean oddness clause are routine and not stated in the source.

<a id="R17-5-tetrahedral-artin"></a>

### `R17.5/tetrahedral-artin` — Tetrahedral Artin automorphy ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin` · declaration `TauCeti.GL2Transfer.tetrahedral_artin` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Tetrahedral Artin automorphy**

Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with projective image A₄. There is a unique cuspidal GL₂ automorphic representation π with normalized all-place local parameters ρ. Over the cyclic cubic field E fixed by the preimage of the normal V₄, the restriction P is dihedral and therefore automorphic. Its automorphic representation is Galois-stable, and cyclic descent gives a finite twist fiber over F. Matching the determinant removes the cubic twist ambiguity, giving π_ps(ρ). The adjoint Ad(π_ps) is cuspidal because π_ps has no self-twist, and it is identified with the cyclic cubic induction of the V₄ character θ (Ad ρ=Ind θ) by the Jacquet–Shalika Rankin–Selberg pole criterion. At places inert in E this leaves A(π_v)=diag(ξa,ξ²b) with ξ³=1, and ξ≠1 would give an element of order 6 in A₄. Langlands proves π_v=π(ρ_v) for almost all v (Theorem 3.3 records the consequence that L(s,ρ) is entire); the all-place statement uses his equivalence of the two definitions of π(ρ), whose proof he only sketches. The GL₃ inputs are recorded in the GL₃ supplier gap.

**Hypotheses.**

- F is a number field.
- ρ:G_F→GL₂(C) is continuous, irreducible and has finite image with projective image A₄ (Langlands allows any Weil-group representation of tetrahedral type).
- E/F is the cyclic cubic extension cut out by the preimage of V₄, P=ρ|_{W_E}, and θ is the character of the Galois group over E with Ad ρ=Ind θ.
- Normalisation: π_ps(ρ) is chosen with ω_π=det ρ; local parameters are in the unitary normalisation.

**Proof outline.**

1. Apply the imported A₄/V₄ classification to construct the cyclic cubic extension and the dihedral restriction.
2. Descend its quadratic induction using cyclic descent and its precise twist fiber; choose the descent with ω_π=det ρ.
3. Show that π_ps has no nontrivial self-twist: a quadratic self-twist would give a Gal(E/F)-invariant quadratic self-twist of π(P), but the three self-twists of P are permuted cyclically. Hence Ad(π_ps) is cuspidal (adjoint-lift). Compare it with the cubic induction of θ by gl3-recognition (ii); the Rankin–Selberg factors agree at all good places, including those inert in E.
4. With equal determinants, A(π_v)=diag(ξa,ξ²b) at places inert in E. Equality of adjoints forces ξ=1 or a=±ξ²b, and the minus sign with ξ≠1 gives an element of order 6 in the projective image, which A₄ does not contain.
5. Get uniqueness from isobaric strong multiplicity one (Langlands Lemma 3.1, R16.4). Pass from almost-everywhere equality to all places with the supplied LLC interfaces, the Artin L-function functional equation and the Jacquet–Langlands §12 method (Langlands §3, pp. 15–16, proof only sketched). Record this normalization, not just equality at good primes.

**Acceptance.**

- For order-three η, equality of determinants of π and π⊗η^i forces η^{2i}=1 and hence i=0.
- Without the GL₃ analytic comparison, the existence of some cyclic descent does not identify the desired Artin parameter.

**Prerequisites.** [`R17.5/dihedral-artin`](#R17-5-dihedral-artin), [`R17.4/cyclic-descent`](#R17-4-cyclic-descent), [`R17.4/cyclic-descent-fibers`](#R17-4-cyclic-descent-fibers), [`R17.4/adjoint-lift`](#R17-4-adjoint-lift), [`R17.4/cubic-character-induction`](#R17-4-cubic-character-induction), [`R17.4/gl3-recognition`](#R17-4-gl3-recognition), `ArithmeticGaloisRepresentations:R01.4`, `R16.5`, `R16.4`, `R16.3`.

*Assembly note: the layer citations above, by node.*

- `R16.5` → [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse), [`R16.5/global-epsilon-normalization`](#R16-5-global-epsilon-normalization) (probable). R16.5 enters only through the all-place upgrade by the JL70 §12 method (proof step 5): JL70 Theorem 12.2 is the converse theorem applied to ⊗π(ρ_v) (full-gl2-converse, all twists, number field), and the comparison of functional equations of L(s,π⊗ω) uses the completed GL₂ functional equation, which global-epsilon-normalization states for a cuspidal π in untwisted form (to be applied to each π⊗ω, a cuspidal representation). Difference: the twisted family is not written out; and the upgrade also needs the GL₂ local converse theorem, ε-stability under highly ramified twists and the Artin-side functional equation, none of which is a part-R16.1 node (the upgrade itself is part R17.3's gap 'All-place upgrade of tetrahedral and octahedral Artin automorphy').
- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one), [`R16.4/non-cm-self-twists`](#R16-4-non-cm-self-twists) (probable). Uniqueness of π_ps (proof step 5) compares two cuspidal representations agreeing at almost all places, which strong-multiplicity-one covers (cuspidal, number field, all finite places outside a finite set). Difference: proof step 5 cites 'isobaric strong multiplicity one (Langlands Lemma 3.1, R16.4)', and part R16.1 states strong multiplicity one only for two cuspidal representations, nothing for isobaric sums χ₁⊞χ₂; for this node the cuspidal statement suffices, so the wording should be narrowed or the isobaric form requested. Proof step 3 (π_ps has no nontrivial self-twist; a self-twist is quadratic) uses the non-CM self-twist definition and the property that every self-twist χ satisfies χ²=1 (non-cm-self-twists, api nonCM_self_twist_square).
- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (probable). Uses the all-place rank-two LLC for finite-image parameters (N=0): unramified Satake classes A(π_v)=diag(ξa,ξ²b) at places inert in E (principal-series-parameter), dihedral or primitive dyadic supercuspidal components (supercuspidal-parameter, which covers p=2 but leaves primitive wild parameters in the ET.6 carrier), archimedean components (archimedean-classification, archimedean-factor-comparison), and conductors and ε-shifts (conductor-epsilon-comparison). Differences: Normalization: part R16.1's rec is fixed by Art_F(ϖ)=geometric Frobenius (principal-series-parameter), whereas part R17.3's R16.3 request and R17.4/local-compatibility ask for the arithmetic-normalized rec; the two differ by π↦π∨ (Frobenius inversion of the whole Weil–Deligne datum, flagged only as a caution in tate-unitary-normalization), and no part-R16.1 node states the arithmetic version or this conversion. No part-R16.1 node states the GL₂ local converse theorem (π_v determined by the twisted γ/ε-factors) or the stability of ε under highly ramified twists, which the all-place upgrade uses; ε of every twist is stated only for supercuspidals (supercuspidal-parameter), while principal-series-parameter and steinberg-monodromy state L-factors and conductors only.

**Sources.**

- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3(i), Theorem 3.3, DMA text p. 19 (PDF p. 22). Excerpt: “Theorem 3.3 If F is a number field and ρ a two-dimensional representation of the Weil group of F of tetrahedral type then the L-function L(s, ρ) is entire.”. Match: Specialisation: stated for any number field and any two-dimensional Weil-group representation of tetrahedral type. The theorem records only entireness of L(s,ρ); the proof shows π_ps(ρ)=π(ρ) at almost all places.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3(i), DMA text pp. 16–17 (PDF pp. 19–20). Excerpt: “Replacing π by ω ⊗ π , we can arrange that ωρ = ωπ and that π lifts to π(P ). This determines π uniquely.”. Match: Exact for the determinant normalisation that fixes the cyclic descent π_ps(ρ) among its cubic twists.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3(i), DMA text p. 18 (PDF p. 21). Excerpt: “It is to be expected that π 1 and π2 are equivalent, and this can indeed be established, using a criterion of Jacquet–Shalika ([15]).”. Match: Proof step: π¹ (Piatetski-Shapiro's cubic induction of σ=Ad ρ=Ind θ) and π² (Gelbart–Jacquet lift of π_ps) are identified by the Jacquet–Shalika criterion; no GL₃ strong multiplicity one is used.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3(i), DMA text p. 19 (PDF p. 22). Excerpt: “which implies that ϕ(ρv (Φ)) has order 6 if ξ is not 1. Since the tetrahedral group contains no element of order 6, the last possibility is precluded.”. Match: Exact for the final Frobenius comparison at places not split in E.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3 opening, DMA text p. 15 (PDF p. 18). Excerpt: “It will be useful to know that they are equivalent. The first condition is easily seen to imply the second. To show that the second implies the first, we use improved forms of results of [5] and [14] which were communicated to me by T. Callahan.”. Match: All-place clause: Langlands asserts that the almost-everywhere and the all-place (JL70 §12) definitions of π(ρ) are equivalent, using results communicated by Callahan and Lemma 3.2, whose proof is not given. This is the only read support for the all-place clause.

<a id="R17-5-octahedral-artin"></a>

### `R17.5/octahedral-artin` — Octahedral Artin automorphy ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin` · declaration `TauCeti.GL2Transfer.octahedral_artin` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Octahedral Artin automorphy**

For a number field F and a continuous irreducible finite-image ρ:G_F→GL₂(C) with projective image S₄, there is a unique cuspidal automorphic π with π_v≅π(ρ_v) for almost all v (Tunnell). By the same all-place upgrade as in the tetrahedral case, π has normalized local parameter ρ|_{W_{F_v}} at every place. Let E/F be the quadratic field cut out by the preimage of A₄, K/F the non-Galois cubic field cut out by the preimage of a Sylow-2 subgroup, and M=EK. The tetrahedral theorem over E gives π(ρ_E), which is the base change of exactly two cuspidal π₁ and π₂=π₁⊗ω_{E/F}. These have the same central character, so determinant matching cannot choose between them. Tunnell's lemma: exactly one i has BC_{K/F}(π_i)≅π(ρ_K), where ρ_K is monomial. Both BC_{K/F}(π_i) base change to π(ρ_M); they differ by ω_{M/K}=ω_{E/F}∘N_{K/F} and are distinct because ρ_M is irreducible, so they are the two quadratic descents of π(ρ_M), one of which is π(ρ_K). For this π, a place w|v of K with [K_w:F_v]∈{1,3} shows that the Satake class of π_v is that of ρ_v: the only alternative gives an element of order 6 in S₄. GL₃ and GL₂×GL₃ theory enters only through the JPSS cubic transfer, which Tunnell quotes without proof. Langlands's earlier octahedral results (Theorems 3.4–3.5, over Q with conditions on complex conjugation) are not substituted for Tunnell's theorem.

**Hypotheses.**

- F is a number field.
- ρ:G_F→GL₂(C) is continuous, irreducible and has finite image with projective image S₄.
- E/F is the quadratic extension cut out by the preimage of A₄, K/F the non-Galois cubic extension cut out by the preimage of a Sylow-2 subgroup (dihedral of order 8), and M=EK.
- Tunnell's conclusion holds almost everywhere (π(ρ) in the JL70 §12 sense at almost all v); the all-place clause needs the separate upgrade.
- Inputs: the tetrahedral theorem over E, quadratic descent and its fibers, the dihedral theorem over K and M, and the weak JPSS cubic transfer.

**Proof outline.**

1. Use the A₄ normal subgroup: the tetrahedral theorem over E and quadratic cyclic descent give the two candidates π₁ and π₂=π₁⊗ω_{E/F} (Langlands §3(ii)); retain both.
2. Apply the JPSS cubic transfer to π₁ and π₂. By transitivity of base change (almost-everywhere Satake classes and isobaric strong multiplicity one), both BC_{K/F}(π_i) base change over M to π(ρ_M). BC_{K/F}(π₂)≅BC_{K/F}(π₁)⊗ω_{M/K}, and equality would make π(ρ_M) non-cuspidal (quadratic cuspidality criterion), contradicting irreducibility of ρ_M.
3. By the quadratic descent fibers for M/K, BC_{K/F}(π₁) and BC_{K/F}(π₂) are the two descents of π(ρ_M). The dihedral theorem gives π(ρ_K), which is also a descent, so π(ρ_K)=BC_{K/F}(π_i) for a unique i; call this π.
4. Central character: ω_π∘N_{K/F}=det ρ∘N_{K/F} and ω_{E/F}∘N_{K/F}=ω_{M/K}≠1 give ω_π=det ρ. With BC_{E/F}(π)=π(ρ_E) this gives the Satake class diag(a_vω,b_vω), ω²=1, at good v (Tunnell leaves the central-character step implicit).
5. Choose w|v in K with [K_w:F_v]∈{1,3}. Degree 1 gives ω=1 directly. Degree 3 forces ω=1 or a_v=b_vηω with η³=1, and η≠1 with ω=−1 would give an element of order 6 in S₄. Hence π_v≅π(ρ_v) almost everywhere.
6. Use R16.4 uniqueness and the all-place upgrade (as in tetrahedral-artin; Langlands §3, pp. 15–16) in the completed theorem. The JPSS analytic transfer remains a source gap; Tunnell's comparison itself is now read.

**Acceptance.**

- For quadratic η, det(π⊗η)=det π, so determinant alone leaves both descents.
- The cubic subgroup is not normal in S₄; prime-cyclic descent cannot replace its transfer.
- Tunnell's choice between π₁ and π₂ uses only almost-everywhere Satake classes and descent fibers; no GL₃ Rankin–Selberg comparison is applied to the two candidates.

**Prerequisites.** [`R17.5/tetrahedral-artin`](#R17-5-tetrahedral-artin), [`R17.5/dihedral-artin`](#R17-5-dihedral-artin), [`R17.4/cyclic-descent-fibers`](#R17-4-cyclic-descent-fibers), [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change), `R16.5`, `ArithmeticGaloisRepresentations:R01.4`, [`R17.4/cyclic-descent`](#R17-4-cyclic-descent), [`R17.4/cuspidality`](#R17-4-cuspidality), `R16.4`, `R16.3`.

*Assembly note: the layer citations above, by node.*

- `R16.5` → [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse), [`R16.5/global-epsilon-normalization`](#R16-5-global-epsilon-normalization) (probable). Same use as tetrahedral-artin: the all-place upgrade of proof step 6 by the JL70 §12 method uses the converse theorem (full-gl2-converse) and the completed functional equation of each cuspidal π⊗ω (global-epsilon-normalization, stated untwisted for a cuspidal π). The converse theorem also enters through the JPSS cubic transfer, but that use belongs to the separate prerequisite R17.4/nonnormal-cubic-base-change. Difference: the twisted family is not written out, and the GL₂ local converse theorem and ε-stability under highly ramified twists needed by the upgrade are in no part-R16.1 node (part R17.3 gap 'All-place upgrade of tetrahedral and octahedral Artin automorphy').
- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (probable). Uniqueness of the cuspidal π (proof step 6) is covered by strong-multiplicity-one. Difference: proof step 2 ('transitivity of base change (almost-everywhere Satake classes and isobaric strong multiplicity one)') compares BC_{M/K}(BC_{K/F}(π_i)), a priori only isobaric, with the cuspidal π(ρ_M), which needs strong multiplicity one between a cuspidal and an isobaric representation (Jacquet–Shalika). Part R16.1 states strong multiplicity one only for two cuspidal representations over a number field.
- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (probable). Uses the unramified Satake classes at places v having a place w of K with [K_w:F_v]∈{1,3} (principal-series-parameter), dyadic S₄-type supercuspidal components (supercuspidal-parameter, via the ET.6 carrier, without a worked primitive example: part R16.1 gap 'Primitive wild dyadic worked example'), archimedean components and conductors. Differences: Normalization: part R16.1's rec is fixed by Art_F(ϖ)=geometric Frobenius (principal-series-parameter), whereas part R17.3's R16.3 request and R17.4/local-compatibility ask for the arithmetic-normalized rec; the two differ by π↦π∨ (Frobenius inversion of the whole Weil–Deligne datum, flagged only as a caution in tate-unitary-normalization), and no part-R16.1 node states the arithmetic version or this conversion. No part-R16.1 node states the GL₂ local converse theorem (π_v determined by the twisted γ/ε-factors) or the stability of ε under highly ramified twists, which the all-place upgrade uses; ε of every twist is stated only for supercuspidals (supercuspidal-parameter), while principal-series-parameter and steinberg-monodromy state L-factors and conductors only. The Langlands–Shintani compatibility for octahedral dyadic parameters in part R17.3's R16.3 request is in no part-R16.1 node.

**Sources.**

- **tunnell81** (Jerrold Tunnell, [*Artin's conjecture for representations of octahedral type*](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf)), p. 173, first paragraph. Excerpt: “The purpose of this note is to prove the conjecture for all octahedral representations by using the methods of Langlands and an analytic result of Jacquet, Piatetskii-Shapiro and Shalika.”. Match: Exact for scope: all octahedral representations over any number field, by Langlands's methods plus the JPSS theorem.
- **tunnell81** (Jerrold Tunnell, [*Artin's conjecture for representations of octahedral type*](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf)), p. 173, definition of π(ρ). Excerpt: “We say that a cuspidal automorphic representation TT of GL(2, AF) equals 7r(p) if n =®TTV with irv = ir(pv) in the sense of [2, §12] for almost all places v of F.”. Match: Normalisation: Tunnell's π(ρ) means π_v=π(ρ_v) in the JL70 §12 sense for almost all v only; the node's all-place clause is an added upgrade. OCR: TT/n=π, 7r(p)=π(ρ), irv=π_v.
- **tunnell81** (Jerrold Tunnell, [*Artin's conjecture for representations of octahedral type*](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf)), Lemma and its proof, p. 174. Excerpt: “But pM is irreducible, so this does not occur. By the descent theory for base change,”. Match: Exact for the descent comparison (OCR pM=ρ_M). The proof is complete given the JPSS theorem, transitivity of base change, and quadratic descent for M/K.
- **tunnell81** (Jerrold Tunnell, [*Artin's conjecture for representations of octahedral type*](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf)), Theorem and its proof, pp. 174–175. Excerpt: “But the octahedral group contains no elements of order 6, so this is impossible.”. Match: Exact for the final Satake comparison at a place of K of local degree 1 or 3.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3(ii), DMA text p. 19 (PDF p. 22). Excerpt: “Hence Π is the lifting of exactly two automorphic representations π, π 0 of G(A), one of which can be obtained from the other by tensoring with the non-trivial character ω of F × N IE \IF .”. Match: Exact for the two quadratic descents π and π′=π⊗ω (the text layer writes 'π 0' for π′).

<a id="R17-5-solvable-artin"></a>

### `R17.5/solvable-artin` — Langlands–Tunnell strong Artin theorem ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin` · declaration `TauCeti.GL2Transfer.solvable_artin` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Langlands–Tunnell theorem**

Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with solvable projective image. There is a unique cuspidal GL₂ automorphic representation π such that, in the fixed Artin/LLC normalization, rec_Fv(π_v)≅ρ|_{W_Fv} for every place v. Equivalently (Jacquet–Langlands §12), the L- and ε-factors of all character twists agree at every place, so L(s,π)=L(s,ρ). The finite-image projective classification leaves dihedral, A₄ and S₄; a cyclic projective image would make the representation reducible. Solvability of linear and projective finite images is equivalent because their scalar kernel is abelian. Over totally real F, total oddness gives holomorphic parallel weight one; automorphy itself has no oddness requirement. This is the strong rank-two theorem, not merely holomorphy of the Artin L-function. Rogawski–Tunnell §4 state it as the strong Artin conjecture (cuspidal π(σ) with L(s,π(σ))=L(s,σ)), known for solvable image by Langlands and Tunnell. The published proofs give almost-everywhere equality; the all-place and ε-factor clause rests on Langlands's equivalence of the two definitions of π(ρ) (§3, proof sketched).

**Hypotheses.**

- F is a number field.
- ρ:G_F→GL₂(C) is continuous, irreducible and has finite solvable image, so its projective image is dihedral, A₄ or S₄.
- Unitary normalisation of local parameters; uniqueness is up to isomorphism.
- For the weight-one clause, F is totally real and ρ is totally odd (det ρ(c_v)=−1 at every real place).

**Proof outline.**

1. Import the finite subgroup classification and apply the dihedral, tetrahedral or octahedral theorem.
2. Upgrade almost-everywhere equality to all places (Langlands §3, pp. 15–16; Jacquet–Langlands §12). Compare the global functional equations of L(s,π⊗ω) and L(s,ρ⊗ω), isolate one bad place by taking ω highly ramified at the others, and use the GL₂ local converse theorem with the LLC characterisation by twisted factors. Archimedean places use Langlands's archimedean analogue.
3. Record uniqueness (strong multiplicity one) in the common normalization. Use the GL₂ dictionary to get weight-one consequences only under the stated infinity condition (Rogawski–Tunnell §4: σ odd implies π(σ) holomorphic of weight one).

**Acceptance.**

- Over Q an odd irreducible S₄ representation gives a holomorphic weight-one newform.
- GL₂(F₉) itself is not a solvable-image hypothesis; the pinned nonsolvability theorem prevents this false shortcut.

**Prerequisites.** [`R17.5/dihedral-artin`](#R17-5-dihedral-artin), [`R17.5/tetrahedral-artin`](#R17-5-tetrahedral-artin), [`R17.5/octahedral-artin`](#R17-5-octahedral-artin), `R16.5`, `R16.6`, `ArithmeticGaloisRepresentations:R01.4`, `R16.3`, `tauceti:TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

*Assembly note: the layer citations above, by node.*

- `R16.5` → [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse), [`R16.5/global-epsilon-normalization`](#R16-5-global-epsilon-normalization) (probable). Proof step 2 compares the global functional equations of L(s,π⊗ω) and L(s,ρ⊗ω) and isolates one bad place by highly ramified ω; global-epsilon-normalization states the completed GL₂ functional equation Λ(s,π)=ε(1/2,π)Λ(1−s,π̃) with ε the product of local root numbers (for a cuspidal π, to be applied to each π⊗ω); full-gl2-converse is the converse theorem of the alternative JL70 Theorem 12.2 route. Difference: the twisted family is not written out, and the GL₂ local converse theorem and ε-stability under highly ramified twists that the step needs are in no part-R16.1 node.
- `R16.6` → [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (probable). Used for the weight-one clause (proof step 3, acceptance 'Over Q an odd irreducible S₄ representation gives a holomorphic weight-one newform'). Over Q, weight-one-classical-comparison states it: primitive weight-one forms of conductor N and odd χ correspond to cuspidal classes of exact conductor N, central character ω_χ and infinite component the full-O(2) limit D₁(0) with real parameter 1⊕sgn; archimedean-classification (m=0 case) identifies the parameter 1⊕sgn at each real place. Difference: the node states the clause for totally real F and totally odd ρ (parallel weight one); no part-R16.1 node states the totally real parallel-weight-one dictionary (part R17.3 request 5(b)); hilbert-algebraic-weights requires k_τ≥2.
- `R16.3` → [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (probable). Uses the rank-two LLC at every place, including archimedean places, for finite-image parameters (N=0): principal series, dihedral and primitive dyadic supercuspidals, real and complex components; and the identification of rec(π_v)≅ρ|W_{F_v} with the equality of L- and ε-factors of all twists (the 'Equivalently (Jacquet–Langlands §12)' clause). Differences: Normalization: part R16.1's rec is fixed by Art_F(ϖ)=geometric Frobenius (principal-series-parameter), whereas part R17.3's R16.3 request and R17.4/local-compatibility ask for the arithmetic-normalized rec; the two differ by π↦π∨ (Frobenius inversion of the whole Weil–Deligne datum, flagged only as a caution in tate-unitary-normalization), and no part-R16.1 node states the arithmetic version or this conversion. No part-R16.1 node states the GL₂ local converse theorem (π_v determined by the twisted γ/ε-factors) or the stability of ε under highly ramified twists, which the all-place upgrade uses; ε of every twist is stated only for supercuspidals (supercuspidal-parameter), while principal-series-parameter and steinberg-monodromy state L-factors and conductors only.

**Sources.**

- **rt83** (Jonathan D. Rogawski and Jerrold B. Tunnell, [*On Artin L-functions associated to Hilbert modular forms of weight one*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf)), §4, proof of Proposition 4.3, printed p. 41. Excerpt: “fact that the strong Artin conjecture is known for representations with solvable image ( [ 28 , 32 ] )”. Match: Consumer statement: the strong Artin conjecture, defined on p. 40 as existence of cuspidal π(σ) with L(s,π(σ))=L(s,σ), is known for solvable image by [28] (Langlands 1980) and [32] (Tunnell 1981). RT83 does not mention ε-factors or all-place parameters.
- **rt83** (Jonathan D. Rogawski and Jerrold B. Tunnell, [*On Artin L-functions associated to Hilbert modular forms of weight one*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf)), §4, printed p. 40. Excerpt: “If a is odd , 7i { a ) lies m Л1 , as a comparison of L - senes shows”. Match: Exact for the weight-one consequence over totally real F: σ odd implies π(σ)∈A₁ (holomorphic weight one). OCR: a=σ, 7i=π, m=in, Л1=A₁, senes=series.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3 opening, DMA text p. 15 (PDF p. 18). Excerpt: “It will be useful to know that they are equivalent. The first condition is easily seen to imply the second. To show that the second implies the first, we use improved forms of results of [5] and [14] which were communicated to me by T. Callahan.”. Match: All-place and ε-factor clause: Langlands asserts that the two definitions of π(ρ) are equivalent (all places with the JL70 §12 characterisation by twisted L and ε, or isobaric with equality at almost all places); the proof is only sketched (Callahan).
- **tunnell81** (Jerrold Tunnell, [*Artin's conjecture for representations of octahedral type*](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf)), p. 173, first paragraph. Excerpt: “The purpose of this note is to prove the conjecture for all octahedral representations by using the methods of Langlands and an analytic result of Jacquet, Piatetskii-Shapiro and Shalika.”. Match: Exact for the octahedral case over every number field (almost everywhere).

<a id="R17-5-q-weight-one"></a>

### `R17.5/q-weight-one` — Odd Artin representations and classical weight one

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one` · declaration `TauCeti.GL2Transfer.q_weight_one` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For ρ as in solvable-artin over Q with det ρ(c)=−1, the R16.6 dictionary yields a normalized holomorphic cuspidal weight-one newform f with exact Artin conductor N(ρ), nebentypus det ρ under reciprocity, L(s,f)=L(s,ρ), and, for ℓ∤N(ρ) and arithmetic Frobenius, characteristic polynomial X²−a_ℓ(f)X+det ρ(Frob_ℓ) of ρ(Frob_ℓ). This is the Weil–Langlands theorem (Deligne–Serre Théorème 4.10); its hypothesis that every L(s,ρ⊗χ) is entire follows here from cuspidality of the Langlands–Tunnell representation. Its coefficients lie in a number field. To reduce modulo p choose a place λ above p, an embedding of its residue field into a common algebraic closure, and a stable lattice in a coefficient realization of ρ. Weight one here is not the weight≥2 cohomological construction used in Hilbert varieties.

**Hypotheses.**

- ρ: G_Q→GL₂(C) is continuous, irreducible and of finite image with solvable projective image, so solvable-artin supplies a cuspidal π with π_v matching ρ at every place.
- ρ is odd: det ρ(c)=−1 for complex conjugation c.
- Frobenius normalization is arithmetic (Artin's convention, as in Deligne–Serre), and det ρ is identified with a Dirichlet character by class field theory.
- For reduction: a number field E realizing ρ, a place λ of E above p, an embedding of its residue field into F̄_p, and a G_Q-stable O_{E,λ}-lattice.

**Proof outline.**

1. Apply the odd archimedean local dictionary to solvable-artin; use R16.2 newvectors for conductor and R16.6 normalization.
2. Use finite-image coefficient realization and stable-lattice data from R01.1; compare full Frobenius polynomials with R01.5.

**Acceptance.**

- A chosen λ is necessary: the rational prime p alone does not identify a reduction.
- An even irreducible finite-image representation does not give this holomorphic weight-one conclusion.
- The nebentypus ε of f is odd, ε(−1)=−1, matching det ρ(c)=−1 (Deligne–Serre 4.4–4.5).

**Prerequisites.** [`R17.5/solvable-artin`](#R17-5-solvable-artin), `R16.2`, `R16.6`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

*Assembly note: the layer citations above, by node.*

- `R16.2` → [`R16.2/newvector-conductor`](#R16-2-newvector-conductor), [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.2/normalized-newvector`](#R16-2-normalized-newvector), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison) (clear). Proof step 1 uses R16.2 newvectors for the conductor: the level is ∏p^{c(π_p)} with c the least last-row K₁ level (newvector-conductor; casselman-newvector gives the line of newvectors and the dimension formula, with no restriction on the residue characteristic) and the normalized newform is the newvector with W(1)=1 (normalized-newvector). The identification of c(π_p) with the Artin conductor a(ρ_p) is conductor-epsilon-comparison (c(π)=a(rec π)), which does not depend on the Frobenius convention. Same hypotheses: irreducible infinite-dimensional local components over finite extensions of ℚ_p, including p=2.
- `R16.6` → [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison) (probable). weight-one-classical-comparison states the Q weight-one dictionary the node needs: for N>0 and odd χ, primitive normalized weight-one forms of conductor N correspond to cuspidal GL₂(𝔸_ℚ) classes of exact conductor N, central character ω_χ and infinite component D₁(0) with parameter 1⊕sgn. Differences: for k=1 part R16.1 states neither the good-prime Hecke dictionary (α_ℓ+β_ℓ=a_ℓ, α_ℓβ_ℓ=χ(ℓ)) nor L(s,π_f)=L(s,f); these are stated only for k≥2 (primitive-classical-bijection, classical-hecke-and-level, classical-l-function-comparison). Nor does it convert its geometric-Frobenius rec to the arithmetic (Deligne–Serre) convention of the node, which part R16.1 does only for k≥2 (weight-k-parameter-conversion): with geometric rec, rec(π_ℓ)≅ρ|W gives tr ρ(arithmetic Frob_ℓ)=ā_ℓ, so the characteristic polynomial and nebentypus clauses need π replaced by π∨ or the convention converted.

**Sources.**

- **ds74** (Pierre Deligne and Jean-Pierre Serre, [*Formes modulaires de poids 1*](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf)), §4(c), Théorème 4.10 (Weil–Langlands), printed p. 516 (PDF p. 11); with Remarques 4.4–4.5 and Théorème 4.6, pp. 514–515. Excerpt: “Alors f est une forme parabolique primitive de type (1, s) sur ro(N), et p est la représentation attachée à /.”. Match: Exact classical statement (OCR read against the page image: 's' is ε=det ρ, 'ro(N)' is Γ₀(N), 'p' is ρ, '/' is f). For ρ irreducible, odd and with every L(s,ρ⊗χ) entire, f=Σa_n q^n with L(s,ρ)=Σa_n n^{-s} is a weight-one newform of level N = conductor of ρ and character det ρ. Entireness comes here from cuspidality of the Langlands–Tunnell π.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §3, octahedral case before Theorem 3.4, p. 20 of the Digital Math Archive text (PDF p. 23). Excerpt: “This is the condition that guarantees that the tensor product of π with some idèle class character is the automorphic representation defined by a holomorphic form of weight one.”. Match: Archimedean criterion only, over Q: π_∞=π(μ⊕ν) with μ=ν·sgn. For odd finite-image ρ the parameter is 1⊕sgn and no twist is needed; Langlands then applies Deligne–Serre.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, proof of the Theorem (case D<0), printed p. 307 (PDF p. 9). Excerpt: “Then g ∈ Prim1 (2ν N, χ), where χ is the Kronecker symbol at D viewed as a Dirichlet character modulo 2ν N .”. Match: Consumer use only, in the dihedral case: the theta series of an odd-order character of an imaginary quadratic field is a weight-one newform whose level is the Artin conductor and whose character is the Kronecker symbol (the determinant of the induced representation). RT97 does not state the general dictionary.

<a id="R17-5-tr-weight-one"></a>

### `R17.5/tr-weight-one` — Totally odd Artin representations and Hilbert weight one

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one` · declaration `TauCeti.GL2Transfer.tr_weight_one` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For F totally real and ρ as in solvable-artin with det ρ(c_v)=−1 at every real place, the automorphic π is holomorphic parallel-weight-one Hilbert cuspidal in the R16.6 extended dictionary. At every real place π_v is Rogawski–Tunnell's π₁, the representation of GL₂(R) unitarily induced from the Borel character (a b;0 d)↦sign(a) (isomorphic to π(1,sign)), whose parameter is 1⊕sign; it is a limit of discrete series, not a cohomological weight≥2 discrete-series representation. The finite conductor, central character and local Artin factors are those of ρ. This node exports the weight-one input to residual modularity arguments, without duplicating Hilbert Shimura-variety geometry or claiming a missing weight-one cohomological Galois construction.

**Hypotheses.**

- F is a totally real number field.
- ρ: G_F→GL₂(C) is continuous, irreducible and of finite image with solvable projective image, and π is the cuspidal representation given by solvable-artin, with rec(π_v)≅ρ|W_{F_v} at every place.
- ρ is totally odd: det ρ(c_v)=−1 for every real place v.
- Weight one is meant in Rogawski–Tunnell's sense for GL₂ (D=M₂(F)): π_v≅π₁ at every real place v.

**Proof outline.**

1. At each real place, solvable-artin gives rec(π_v)≅ρ|W_{F_v}; this factors through Gal(C/R) and sends c_v to an involution with eigenvalues +1,−1, so the parameter is 1⊕sign and π_v≅π(1,sign)≅π₁ by the archimedean correspondence for reducible parameters.
2. Request the exact weight-one adelic/holomorphic extension of R16.6; the existing cohomological-only wording does not suffice.
3. Retain coefficient realization and the chosen residual place when this form is used modulo p.

**Acceptance.**

- Total oddness must hold at every real place, not just one.
- The infinity type is not silently replaced by weight-two discrete series.
- π₁ has central character sign on R^×, matching det ρ(c_v)=−1 under the determinant/central-character normalization.

**Prerequisites.** [`R17.5/solvable-artin`](#R17-5-solvable-artin), `R16.6`, `ArithmeticGaloisRepresentations:R01.1`.

*Assembly note: the layer citations above, by node.*

- `R16.6` → [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (none). The key input is the totally real holomorphic parallel-weight-one extension of the R16.6 dictionary (part R17.3 request 5(b)); the node's own proof step 2 says the cohomological wording does not suffice. No part-R16.1 node states it: weight-one-classical-comparison is for GL₂(𝔸_ℚ) only, and hilbert-algebraic-weights and the Hilbert exports require k_τ≥2. What part R16.1 does state is the local real-place step used in proof step 1, that the parameter 1⊕sgn corresponds to the full-O(2) limit of discrete series π(1,sgn) (archimedean-classification, m=0 case; weight-one-classical-comparison over Q); the listed nodes cover only that step.

**Sources.**

- **rt83** (Jonathan D. Rogawski and Jerrold B. Tunnell, [*On Artin L-functions associated to Hilbert modular forms of weight one*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf)), §1, definitions (ii) of π₁ and of 'holomorphic of weight k', printed p. 4 (rt83.txt page 4; article PDF p. 5). Excerpt: “ii ) For / c = l , let TTj be the representation of GLjiR ) which is unitarily induced from the character”. Match: Definition only. OCR read against the page image: '/ c = l' is k=1, 'TTj' is π₁, 'GLjiR )' is GL₂(R), and the character is (a b;0 d)↦sign(a). With D=M₂(F), 'holomorphic of weight k' means π_v≅π_k at every real place, so weight is parallel. π₁≅π(1,sgn) has parameter 1⊕sgn.
- **rt83** (Jonathan D. Rogawski and Jerrold B. Tunnell, [*On Artin L-functions associated to Hilbert modular forms of weight one*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf)), Introduction, printed p. 1. Excerpt: “Hence the strong form of Artin's conjecture for degree two representations of C5 ( F / F ) with odd determinant and our results imply that there is a bijection between the set of holomorphic n of weight one and degree two a with odd determinant”. Match: Context statement (OCR: 'C5 ( F / F )' is Gal(F̄/F), 'n' is π, 'a' is σ). RT83 prove weight-one π gives odd σ(π). The node's direction (odd ρ with automorphic π gives π_v≅π₁) follows from all-place compatibility and the real parameter 1⊕sgn.

<a id="R17-5-odd-residual-lift"></a>

### `R17.5/odd-residual-lift` — Solvable residual lifting in odd characteristic

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift` · declaration `TauCeti.GL2Transfer.odd_residual_lift` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let F be totally real, p>2, and r̄:G_F→GL₂(F̄_p) be continuous, absolutely irreducible and totally odd with solvable image. There is a totally odd continuous finite-image characteristic-zero lift ρ over a number field, a place λ above p and a stable lattice whose semisimplified reduction is r̄ after a specified residue-field embedding. The proof uses the finite-subgroup classification (projective image dihedral, A₄ or S₄), a reduction-compatible lift of that finite projective image to characteristic zero, Tate's theorem (finite-projective-lift) and a Teichmüller twist; Tate alone only lifts a projective homomorphism and does not ensure the prescribed residual reduction. Coefficient enlargement is allowed. BCGP state this lift citing only the classification [SD73] and Tate's theorem [Ser77, Theorem 4]; the reduction-compatible lift of the projective image and the final twist are not written out there and remain an explicit source-proof gap in this packet.

**Hypotheses.**

- F is a totally real number field and p>2 is prime.
- r̄: G_F→GL₂(F̄_p) is continuous and absolutely irreducible.
- r̄ is totally odd: det r̄(c_v)=−1 for every real place v.
- r̄ has solvable image (equivalently, solvable projective image).
- The output records a number field E of coefficients, a place λ of E above p, an embedding of the residue field of λ into F̄_p and a stable lattice; coefficient enlargement is allowed.

**Proof outline.**

1. By the imported classification of finite subgroups of PGL₂(F̄_p), absolute irreducibility and solvability leave a projective image G that is dihedral of order prime to p, A₄ or S₄; BCGP cite Swinnerton-Dyer [SD73] for this.
2. Lift G to a finite subgroup of PGL₂ over the integers of a finite extension of Q_p that maps isomorphically onto G under reduction. If p∤|G|, lift the two-dimensional representation of the preimage of G in SL₂(F̄_p), whose order is prime to p. If p=3 and G is A₄ or S₄, use an embedding of GL₂(F₃) into GL₂ over Z[√−2] that reduces to the identity. BCGP leave this step implicit; it is the recorded gap.
3. Apply finite-projective-lift (Tate) to the resulting finite-image projective representation, viewed over C through a fixed field isomorphism. This gives a finite-image linear ρ₀ whose reduction has the projectivization of r̄, so equals r̄⊗χ̄ for a character χ̄; twist ρ₀ by the Teichmüller lift of χ̄^{-1}. Retain the coefficient field, λ and lattice in the output.
4. At p>2, det ρ(c_v)∈{±1} reduces to det r̄(c_v)=−1, so it equals −1 at every real place; equivalently the non-scalar residual involution forces eigenvalues +1,−1.

**Acceptance.**

- The result includes p=3 but is not limited to that prime.
- A random characteristic-zero projective lift with the correct projectivization need not reduce to the specified r̄.
- The lift ρ is irreducible, because its reduction r̄ is absolutely irreducible.

**Prerequisites.** [`R17.5/finite-projective-lift`](#R17-5-finite-projective-lift), `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`.

**Sources.**

- **bcgp21** (George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf)), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). Excerpt: “either A4 , S4 , or dihedral, and is in particular a subgroup of PGL2 (C). By a theorem of Tate (see [Ser77, Theorem 4]), this implies that there exists a characteristic zero lift of”. Match: Proof step only, in BCGP's setting: ϱ̄:G_E→GL₂(F̄_p), E/F a totally real quadratic extension, p∈{3,5}, det ϱ̄=ε̄^{-1} (so totally odd), absolutely irreducible. The node generalises to any totally real F and p>2. The reduction-compatible lift of the projective image and the twist fixing the reduction are left implicit (gap).

<a id="R17-5-residual-lt-application"></a>

### `R17.5/residual-lt-application` — Solvable residual modularity over totally real fields

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application` · declaration `TauCeti.GL2Transfer.residual_lt_application` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For F,p,r̄ as in odd-residual-lift, apply Langlands–Tunnell to its totally odd finite-image lift and obtain a parallel-weight-one Hilbert cuspidal form whose chosen λ-adic reduction realizes r̄. This is the qualitative residual modularity input of the solvable case in the proof of BCGP Proposition 10.1.3 (there over a totally real quadratic extension E of the base field, with p=3 or 5). The proof of Theorem 10.2.6 uses it only through Proposition 10.1.3(1). Subsequent ordinary weight-two lifts, auxiliary solvable extensions and GSp₄ transfer in those arguments require their own lifting/weight-change owners and are not consequences of Langlands–Tunnell alone. No unchanged conductor or ordinary local condition is promised by this application.

**Hypotheses.**

- F, p, r̄ as in odd-residual-lift: F totally real, p>2, r̄:G_F→GL₂(F̄_p) continuous, absolutely irreducible, totally odd, with solvable image.
- The characteristic-zero lift ρ, the place λ above p, the residue-field embedding and the stable lattice are those produced by odd-residual-lift.
- The output form is holomorphic of parallel weight one in the sense of tr-weight-one; no level, conductor or ordinarity condition is claimed.

**Proof outline.**

1. The lift ρ from odd-residual-lift is irreducible (its reduction is absolutely irreducible), has finite image and solvable projective image, so solvable-artin gives a cuspidal π with all-place parameters ρ; tr-weight-one makes π holomorphic of parallel weight one. Retain the exact residue-field/lattice identification.
2. Pass the witness, with its actual weight, level and place, to downstream modularity-lifting and symplectic-transfer owners.
3. Keep the BLGG ordinary-weight-two adjustment cited by BCGP separate from the weight-one theorem.

**Acceptance.**

- The output includes a chosen place above p and a stable lattice.
- Solvable-image modularity does not supply an ordinary weight-two automorphic lift without a separate theorem.
- In the proof of BCGP Theorem 10.2.6 the input ρ̄_{E,3} has image GL₂(F₃) and projective image S₄≅PGL₂(F₃), so the octahedral branch at p=3 is the one used.

**Prerequisites.** [`R17.5/odd-residual-lift`](#R17-5-odd-residual-lift), [`R17.5/tr-weight-one`](#R17-5-tr-weight-one), `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`, [`R17.5/solvable-artin`](#R17-5-solvable-artin).

**Sources.**

- **bcgp21** (George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf)), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). Excerpt: “which is totally odd with finite solvable image, and the result follows from an application of the theorems of Langlands and Tunnell ([Lan80, Tun81]) as in §5 of [Wil95].”. Match: Consumer statement: BCGP apply Langlands–Tunnell over the totally real quadratic E to get modularity of ϱ̄, then separately use [BLGG13, Thm A] for the ordinary parallel-weight-two form. The node records only the weight-one step, over a general totally real field.
- **bcgp21** (George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf)), Theorem 10.2.6, proof, printed p. 481 (PDF p. 329). Excerpt: “ordinary. It follows from Proposition 10.1.3 that ρ is ordinarily modular.”. Match: Indirect consumer via Proposition 10.1.3(1), with ϱ̄=ρ̄_{E,3}:G_H→GL₂(F₃) surjective (solvable, projective image S₄, p=3). BCGP's proof omits that H must be totally real for 10.1.3(1); this is register entry PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E150.

<a id="R17-5-tunnell-primitive-globalization"></a>

### `R17.5/tunnell-primitive-globalization` — Tunnell's globalisation of a local two-dimensional Weil representation (Tunnell 1978, Theorem 1.3)

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization` · declaration `TauCeti.GL2Transfer.tunnell_primitive_globalization` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Tunnell, Invent. Math. 46 (1978), Theorem 1.3, for a p-adic field. Let K be a finite extension of Q_p and σ: W_K → GL₂(C) a continuous two-dimensional representation. There exist a number field F, a finite place v of F with an isomorphism F_v ≅ K, and a continuous representation ρ: W_F → GL₂(C) whose restriction ρ_v to W_{F_v} is isomorphic to σ. If σ is reducible, induced from a proper subgroup, of A₄-type or of S₄-type (the type is the image in PGL₂(C)), then ρ can be chosen of the same type. If K = Q₂ and σ is of S₄-type, one can take F = Q and ρ with det ρ(c) = −1 for complex conjugation c. In the primitive case (A₄- or S₄-type, which forces p = 2) the proof gives ρ = ρ₀ ⊗ χ̃, where ρ₀: G_F → GL₂(C) has finite image and the same projective image as σ, χ̃ is a Hecke quasi-character of F, and in the S₄ case det ρ₀(c) = −1 at every real place. Finite-image form, as Carayol 12.2.3 uses it: if σ is primitive with finite image, ρ can be taken to be a continuous representation of G_F with finite image, tetrahedral or octahedral as σ is. This form needs χ̃ of finite order, i.e. the local–global extension of finite-order characters recorded as a gap. For automorphy the quasi-character form suffices, because ρ is then a twist of the finite-image ρ₀. Tunnell states the theorem for every nonarchimedean local field and a global field F; positive characteristic is not planned here.

**Hypotheses.**

- K is a finite extension of Q_p and W_K its Weil group with the Weil topology. Tunnell's K is any nonarchimedean local field (§1); the node treats characteristic zero only, so F is a number field.
- σ: W_K → GL₂(C) is continuous. No irreducibility is assumed for the existence clause.
- The type of a two-dimensional representation is its image in PGL₂(C) (Tunnell, p. 182). The A₄- and S₄-type representations of W_K are the primitive irreducible ones (Tunnell cites Weil, Exercices dyadiques §13); they occur only for p = 2.
- ρ_v is the restriction along the embedding W_{F_v} → W_F given by a place of F̄ above v; its isomorphism class does not depend on that choice.
- Finite-image form: σ is primitive with finite image, and the local–global extension of finite-order characters (packet gap) is available.

**Proof outline.**

1. Choose F and v: let g ∈ Q_p[x] be the minimal polynomial of a primitive element of K/Q_p and approximate it by a monic f ∈ Q[x] of the same degree; by Krasner's lemma f is irreducible over Q_p with Q_p[x]/(f) ≅ K, so F = Q[x]/(f) has a place v with F_v ≅ K (global–local dictionary). For K = Q₂ take F = Q.
2. σ reducible, σ ≅ μ ⊕ ν: extend μ and ν to quasi-characters of the idele class group C_F (Tunnell: 'well known'; F_v^× is a closed subgroup of C_F, so the unitary part extends by Pontryagin duality and |·|_v^s extends as |·|_A^s), and let ρ be their sum via global reciprocity.
3. σ ≅ Ind_{W_E}^{W_K} θ with E/K quadratic: choose a quadratic extension L/F with a single place w over v and L_w ≅ E over K (weak approximation on a Kummer generator; squares are open in K^×). Extend θ to a quasi-character θ̃ of C_L and put ρ = Ind_{W_L}^{W_F} θ̃; Mackey's formula with the single place w gives ρ_v ≅ σ.
4. σ primitive: it is of A₄- or S₄-type and p = 2 (R16.3, R01.4). Twist σ by an unramified quasi-character so that it has finite image; the twist is undone at the end by a power of the idele norm. Let K(σ) be the field cut out by the projective representation, the splitting field of a quartic P ∈ K[x] on whose roots Gal(K(σ)/K) ≅ A₄ or S₄ acts. Approximate P by Q ∈ F[x] (weak approximation at v and at the real places) so closely that, by Krasner's lemma, the splitting field of Q over K is K(σ), and in the S₄ case Q has exactly two real roots at every real place. Let L be the splitting field of Q over F; Gal(L/F) ⊆ S₄ contains the decomposition group Gal(L_w/K) ≅ Gal(K(σ)/K).
5. A₄ case: if Gal(L/F) ≅ S₄, replace F by the quadratic subfield of L. The decomposition group lies in A₄, so v splits there and a place above v still has completion K. In both cases Gal(L/F) equals the decomposition group, and transporting the projective representation of σ along Gal(L_w/K) ≅ Gal(L/F) gives r: G_F → PGL₂(C). finite-projective-lift gives ρ₀: G_F → GL₂(C) of finite image with projectivization r.
6. ρ₀|_{W_{F_v}} and σ have the same projectivization, so ρ₀|_{W_{F_v}} ≅ σ ⊗ χ with χ of finite order (χ² = det ρ₀,v / det σ). Tunnell leaves this twist implicit (he cites Serre [11]). Put ρ = ρ₀ ⊗ χ̃⁻¹ for a global extension χ̃ of χ: a quasi-character gives Tunnell's statement, a finite-order χ̃ (packet gap) gives the finite-image form. For F = Q the finite-order extension is elementary (Dirichlet characters).
7. Real places in the S₄ case: complex conjugation permutes the roots of Q as a transposition, so r(c) is a nontrivial involution and det ρ₀(c) = −1 by the archimedean clause of finite-projective-lift. A finite-order χ̃ has χ̃(c)² = 1, so det ρ(c) = −1 is kept. With K = Q₂ and F = Q this is the last clause of the theorem.

**Uses that determine the API.**

- *AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary; GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility*: Carayol 12.2.3: globalise a primitive (extraordinary dyadic) σ of finite image to a tetrahedral or octahedral representation over a number field before applying the Artin conjecture and base change.

**Acceptance.**

- Type is preserved: a dihedral σ = Ind θ is globalised as an induced representation, and a primitive σ is never globalised by an induced one.
- In the A₄ case the approximating quartic can have Galois group S₄ over F. Keeping F would give an S₄-type ρ; Tunnell therefore passes to the quadratic subfield of L, in which v splits.
- The final twist cannot be omitted: two linear lifts of the same projective representation differ by a character, so the Tate lift ρ₀ restricted to W_{F_v} is σ only up to a twist.
- F_v ≅ K forces [F:Q] ≥ [K:Q_p], so F = Q is possible only for K = Q_p, as in the Q₂ clause.

*Assembly note.* The first use names `GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility`, which is not a node of this roadmap: Carayol’s comparison for extraordinary parameters under cubic base change is planned as `AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary`, the other node the use names.

**Prerequisites.** [`R17.5/finite-projective-lift`](#R17-5-finite-projective-lift), `R16.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

*Assembly note: the layer citations above, by node.*

- `R16.3` → no node (none). The node uses R16.3 only for the Galois-side fact (proof step 4 and the statement) that a primitive irreducible two-dimensional representation of W_K is of A₄- or S₄-type and occurs only for p=2, together with the twist of σ by an unramified quasi-character to finite image. No part-R16.1 node states this classification: supercuspidal-parameter says only that primitive wild parameters occur at dyadic places and stay in the ET.6 carrier, and tamely-dihedral concerns odd ℓ. The node never uses rec, so no R16.3 node should replace the citation; the input belongs with the existing prerequisite ArithmeticGaloisRepresentations:R01.4 (finite subgroups of PGL₂(ℂ)) or a request for Weil's dyadic classification.

**Sources.**

- **tunnell78** (Jerrold B. Tunnell, [*On the local Langlands conjecture for GL(2)*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf)), §1, Theorem 1.3, printed p. 182 (GDZ article PDF p. 5; page 4 of the OCR text). Excerpt: “Theorem 1.3. Let a be a continuous two-dimensional representation of Wj^ There exists a global field F, a place v of F such that F^ ^ K, and a representation p of Wp such that the restriction p^ of p to Wp^ is isomorphic to о”. Match: Exact first sentence, read against the page image (OCR: 'a'/'о' = σ, 'Wj^' = W_K, 'F^ ^ K' = F_v ≈ K, 'p' = ρ, 'Wp' = W_F, 'p^' = ρ_v, 'Wp^' = W_{F_v}). Tunnell's K is any nonarchimedean local field and F a global field; the node specialises to p-adic K and number fields F.
- **tunnell78** (Jerrold B. Tunnell, [*On the local Langlands conjecture for GL(2)*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf)), §1, Theorem 1.3, second and third sentences, printed p. 182 (GDZ PDF p. 5). Excerpt: “If a is reducible, induced from a proper subgroup, of A^-type or S^-type respectively, then p can be chosen to be of the same type If i^ = Q2 (^^d a is of S4 type we can choose F = (i^ and p such that p (complex conjugation) has determinant —1”. Match: Exact for the type clause and the Q₂ clause (OCR: 'A^-type'/'S^-type' = A₄-/S₄-type, 'i^ = Q2 (^^d a' = 'K = Q₂ and σ', 'F = (i^' = 'F = Q', '—1' = −1).
- **tunnell78** (Jerrold B. Tunnell, [*On the local Langlands conjecture for GL(2)*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf)), proof of Theorem 1.3, first paragraph, printed p. 182 (GDZ PDF p. 5). Excerpt: “Proof Choose a global field F such that there is a place i; of F with F^^K (if К = Q2? choose F = Q) It is well known that a 1-dimensional representation of Wp^ extends to a 1-dimensional representation of Wp”. Match: Proof step: choice of F, and the 'well known' extension of quasi-characters from W_{F_v} to W_F (OCR 'i;' = v, 'F^^K' = F_v ≈ K). The node makes this extension explicit and records its finite-order form as a gap.
- **tunnell78** (Jerrold B. Tunnell, [*On the local Langlands conjecture for GL(2)*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf)), proof of Theorem 1.3, primitive case, printed p. 183 (GDZ PDF p. 6). Excerpt: “Approximate P{x) by a quartic polynomial Q{x) with coefficients in F so closely that the splitting field of Q{x) over К is К (a), and such that at all real places of F the polynomial Q{x) has precisely two real roots.”. Match: Proof step: the quartic approximation (OCR 'P{x)' = P(x), 'К (a)' = K(σ)); two real roots at each real place give oddness in the S₄ case.
- **tunnell78** (Jerrold B. Tunnell, [*On the local Langlands conjecture for GL(2)*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf)), proof of Theorem 1.3, S₄ case, printed p. 183 (GDZ PDF p. 6). Excerpt: “Similarly, if a is of S4 type, the two-dimensional projective representation of Gal (L/F) ^^^4 lifts to a two-dimensional representation p of Gp such that p^^o. Moreover, for all real places of F, p (complex conjugation) has determinant — 1.”. Match: Proof step: Tate's lifting (Tunnell cites Serre [11]), with ρ_v ≅ σ asserted directly (OCR '^^^4' = ≅ S₄, 'Gp' = G_F, 'p^^o' = ρ_v ≅ σ). The twist that matches the restriction to σ is implicit; the node's proof spells it out.
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), 12.2.3, proof of Proposition 12.2.2, printed p. 458 (PDF p. 51). Excerpt: “D'après ([Tu. l], th. 1.3) il existe un corps de nombres g, une place VQ de g, un isomorphisme entre le complété g^ et F, et une représentation <r du groupe Gai (e^/^), d'image finie, de type tétraédral ou octaédral, telle que sa restriction a^ au groupe Gal(^^/^^) soit isomorphe à a.”. Match: Consumer use: after an unramified twist making σ of finite image (preceding sentence), Carayol takes a number field 𝔈, a place v₀ with 𝔈_{v₀} ≅ F and a finite-image tetrahedral or octahedral σ̃ of Gal(𝔈̄/𝔈) with σ̃_{v₀} ≅ σ. This is the node's finite-image form; Tunnell states only a W_F-representation (OCR: 'g' = 𝔈, 'VQ' = v₀, '<r' = σ̃, 'a' = σ, 'Gai' = Gal).

<a id="R17-5-prescribed-local-induction"></a>

### `R17.5/prescribed-local-induction` — Automorphic induction with prescribed local and archimedean components (Carayol 11.2)

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction` · declaration `TauCeti.GL2Transfer.prescribed_local_induction` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Carayol 1986, 11.2, with the global Weil construction of Jacquet–Langlands §12. Let F be a totally real field of degree d with real places τ₁,…,τ_d, let k₁,…,k_d ≥ 2 and w be integers of the same parity, and let D_{k,w} be the essentially square-integrable representation of GL₂(R) of Carayol 0.2 (central character t ↦ t^{−w}), so that D_{k,w} ≅ 𝒲(C, ζ_{k,w}) with ζ_{k,w}(z) = (z z̄)^{(−w−k+1)/2} z^{k−1}. Let 𝔭 ≠ v be finite places of F, L_𝔭/F_𝔭 a quadratic field extension and ξ_𝔭 a quasi-character of L_𝔭^× that does not factor through the norm, with ξ_𝔭·|·|^{w/2} of finite order; so 𝒲(L_𝔭, ξ_𝔭) is ordinary cuspidal. Then there exist a totally imaginary quadratic extension L/F and a quasi-character ξ of 𝔸_L^×/L^× such that (a) L ⊗_F F_𝔭 ≅ L_𝔭 and the 𝔭-component of ξ is ξ_𝔭; (b) at the complex place of L above τ_i, ξ is ζ_{k_i,w}; (c) L/F is not split at v and ξ_v does not factor through the norm L_v^× → F_v^×. The automorphic induction π′ = 𝒲(L, ξ) = quadraticInduction(ξ) is cuspidal, with π′_u ≅ 𝒲(L_u, ξ_u) at every place u; in particular π′_{τ_i} ≅ D_{k_i,w}, π′_𝔭 ≅ 𝒲(L_𝔭, ξ_𝔭) and π′_v is supercuspidal. Hence, when 𝒲(L_𝔭, ξ_𝔭) is the component π_𝔭 of a π as in Carayol (0.3) and v is the place fixed in Theorem (B), π′ satisfies the hypotheses of Theorem (B) and has the same 𝔭-component as π. Carayol calls the existence of (L, ξ) standard and gives no proof. The finite-order condition, automatic for such π_𝔭, cannot be dropped, and the proof uses the local–global extension of finite-order characters recorded as a gap.

**Hypotheses.**

- F is totally real of degree d with real places τ₁,…,τ_d; k₁,…,k_d ≥ 2 and w are integers of the same parity (Carayol 0.3); D_{k,w} is as in Carayol 0.2, with central character t ↦ t^{−w}.
- 𝔭 is a finite place, L_𝔭/F_𝔭 a quadratic field extension and ξ_𝔭 a quasi-character of L_𝔭^× not factoring through N_{L_𝔭/F_𝔭}, so 𝒲(L_𝔭, ξ_𝔭) is supercuspidal and ordinary (Carayol 0.9; JL70 Theorem 4.6(iii)).
- ξ_𝔭·|·|_{L_𝔭}^{w/2} has finite order. Equivalently, the central character of 𝒲(L_𝔭, ξ_𝔭) is |·|^{−w} times a finite-order character; this holds when 𝒲(L_𝔭, ξ_𝔭) ≅ π_𝔭 for π as in Carayol (0.3), whose central character is |·|_𝔸^{−w} times a finite-order character because F is totally real.
- v is a finite place different from 𝔭: Carayol's fixed place of Theorem (B) when d is even, an arbitrary auxiliary place when d is odd.
- 𝒲(E, θ) is the Weil representation π(θ) of JL70 §1 (Theorem 4.6) for a quadratic extension E of a local field and a quasi-character θ of E^×, the principal series π(θ₁, θ₂) when E is split, and 𝒲(C, ·) at a real place; in the packet's normalisation its parameter is Ind θ (quadratic-induction).

**Proof outline.**

1. Choose L = F(√α) by weak approximation: α negative at every τ_i, α ∈ α_𝔭·(F_𝔭^×)² where L_𝔭 = F_𝔭(√α_𝔭), and α a non-square in F_v (squares are open in F_𝔭^× and F_v^×). Then L is CM, L ⊗_F F_𝔭 ≅ L_𝔭 and L_v is a field; the places 𝔓 above 𝔭 and 𝔙 above v are unique, hence stable under the nontrivial automorphism σ of L/F.
2. Archimedean part: by Weil's criterion for CM fields (Patrikis Lemma 2.3.1) there is a unitary Hecke character ψ₀ of L with component (z/|z|)^{k_i−1} at the complex place above τ_i. Put ψ = ψ₀·|·|_{𝔸_L}^{−w/2}. Since ζ_{k,w}(z) = (z/|z|)^{k−1}|z|^{−w}, ψ satisfies (b).
3. ψ₀ has finite order at 𝔓: take π ∈ L^× with (π) = 𝔓^h. As 𝔓 is σ-stable, π̄/π is a unit of absolute value 1 at every complex place, hence a root of unity (Kronecker), so ψ₀,∞(π) is a root of unity. The components of ψ₀ at its other ramified places have finite order on units, so ψ₀,𝔓(π) is a root of unity, and ψ₀,𝔓 has finite order on the finite-index subgroup π^Z·O_𝔓^×. With the finite-order hypothesis, μ = ξ_𝔭·ψ_𝔓^{−1} = (ξ_𝔭|·|^{w/2})·ψ₀,𝔓^{−1} is a finite-order character of L_𝔓^×.
4. Choose a finite-order character θ of L_𝔙^× with ψ_𝔙θ not σ-invariant: θ = 1 if ψ_𝔙 is not σ-invariant, otherwise any θ with θ ≠ θ∘σ. A character of L_𝔙^× factors through the norm exactly when it is σ-invariant (Hilbert 90 and the index-two norm subgroup).
5. By the local–global extension of finite-order characters (packet gap), take a finite-order Hecke character χ of L with χ_𝔓 = μ and χ_𝔙 = θ; it is trivial at the archimedean places, which are complex. Put ξ = ψχ; then (a), (b) and (c) hold.
6. ξ_𝔓 = ξ_𝔭 does not factor through the norm, so ξ ≠ ξ∘σ and quadraticInduction(ξ) is cuspidal (JL70 Proposition 12.1), with local components 𝒲(L_u, ξ_u). At v, L_v is a field and ξ_v does not factor through the norm, so 𝒲(L_v, ξ_v) is supercuspidal (JL70 Theorem 4.6(iii)). At τ_i the component is 𝒲(C, ζ_{k_i,w}) ≅ D_{k_i,w}, and the central characters match: sgn·sgn^{k_i−1}|t|^{−w} = t^{−w} since k_i ≡ w mod 2.

**Uses that determine the API.**

- *AutomorphicGaloisRepresentations:R19.2/carayol-ordinary-cuspidal-places*: Carayol 11.2–11.3: replace π by a CM form π′ with the same ordinary cuspidal component at 𝔭, so σ_𝔭(π) = σ_𝔭(π′) is an induced character.

**Acceptance.**

- Cuspidality of π′ already follows from (a), because ξ_𝔭 does not factor through the norm. Condition (c) only makes π′_v square-integrable, which Theorem (B) needs at its fixed place when d is even.
- If L were split at v, π′_v would be a principal series π(ξ_{v′}, ξ_{v″}), not square-integrable.
- A real place of F split in L would give a principal series there instead of D_{k_i,w}; this is why L must be totally imaginary.
- The finite-order hypothesis cannot be dropped: ξ(π) = 1 for π generating 𝔓^h forces (ξ_𝔭|·|^{w/2})(π) to be a root of unity. If ξ_𝔭 is replaced by ξ_𝔭·|·|^{it} with |·|^{it} of infinite order on L_𝔭^×, no ξ satisfies (a) and (b).

**Prerequisites.** [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), `R16.2`, `R16.3`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

*Assembly note: the layer citations above, by node.*

- `R16.2` → [`R16.2/local-classification`](#R16-2-local-classification), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification) (probable). Uses the distinction between principal series and supercuspidals at finite places (π′_v supercuspidal; a split v would give a principal series π(ξ_{v′},ξ_{v″})) and the archimedean identification D_{k,w}≅𝒲(ℂ,ζ_{k,w}). Differences: local-classification lists the four classes but does not state which are essentially square-integrable, whereas the node uses 'supercuspidal ⇒ square-integrable, irreducible principal series not' (acceptance 1–2); archimedean-classification states Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t}) ↔ D_{m+1}⊗|det|^t in the unitary normalization, which is Carayol's D_{k,w} after m=k−1, t=−w/2 (central character t^{−w} because k≡w mod 2); that reparametrization is not written in part R16.1.
- `R16.3` → [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison) (probable). Uses that the JL70 Weil representation 𝒲(E,θ) has parameter Ind θ: supercuspidal when θ does not factor through the norm (used at 𝔭 and at v), principal series π(θ₁,θ₂) for split E, the archimedean 𝒲(ℂ,ζ), and central character det Ind θ. supercuspidal-parameter states that a quadratic induction with θ≠θ^σ gives a (dihedral) supercuspidal and that determinants and factors agree; principal-series-parameter covers the split case. Differences: no part-R16.1 node identifies JL70's π(θ) with the rec-preimage of Ind θ in part R16.1's geometric-Frobenius normalization (part R17.3 fixes 'parameter Ind θ' in its own arithmetic normalization), nor states JL70 Theorem 4.6(iii) ('π(θ) supercuspidal iff θ does not factor through the norm') in that form.

**Sources.**

- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), 11.2, printed p. 450 (PDF p. 43). Excerpt: “Il est standard de vérifier qu'il existe un couple (L, Ç) formé d'une extension quadratique imaginaire L de F et d'un grôssencharakter Ç de A^, vérifiant les propriétés suivantes:”. Match: Exact existence claim, without proof (OCR: 'Ç' = ζ, 'A^' = 𝔸_L^*). Carayol's (L, ζ) is the node's (L, ξ); 'quadratique imaginaire' over the totally real F means totally imaginary (CM). The node adds the finite-order hypothesis on ξ_𝔭·|·|^{w/2}, automatic in Carayol's setting, and proves the claim.
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), 11.2, condition (a), printed p. 450 (PDF p. 43). Excerpt: “(a) L (g) Fp^Lp, et la composante locale de Ç en p est égale à Çp.”. Match: Condition (a), exact (OCR: '(g) Fp^Lp' = ⊗_F F_𝔭 ≅ L_𝔭, 'Ç' = ζ, 'p' = 𝔭). Condition (b), ζ_{τ_i} ≅ ζ_{k_i,w}, is unreadable in the OCR and was read from the page image.
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), 11.2, condition (c), printed p. 450 (PDF p. 43). Excerpt: “(c) L'extension L/F n'est pas décomposée en u, et ^ ne se factorise pas à travers la norme de L^ à F^.”. Match: Condition (c), exact (OCR: 'u' = v, '^' = ζ_v, 'L^ à F^' = L_v^* à F_v^*).
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), 11.2, conclusion, printed p. 450 (PDF p. 43). Excerpt: “Il correspond alors à Ç, par la construction de Weil globale, une représentation automorphe TI'=^(L,O du groupe GL^ (Ap), vérifiant les hypothèses du théorème (B), et admettant la même composante locale en p que 7t.”. Match: Exact for the conclusion: the global Weil construction gives π′ = 𝒲(L, ζ), satisfying the hypotheses of Theorem (B), with π′_𝔭 ≅ π_𝔭 (OCR: 'TI'=^(L,O' = π′ = 𝒲(L, ζ), 'GL^ (Ap)' = GL₂(𝔸_F), '7t' = π).
- **carayol86** (Henri Carayol, [*Sur les représentations l-adiques associées aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)), 11.2, archimedean components, printed p. 450 (PDF p. 43). Excerpt: “D'autre part, la représentation D^ ^ s'obtient par la représentation de Weil archimédienne, comme la représentation 'W (C,Ç^), où ^ ^ désigne le caractère suivant de C*”. Match: Exact for D_{k,w} ≅ 𝒲(C, ζ_{k,w}) (OCR: 'D^ ^' = D_{k,w}, ''W (C,Ç^)' = 𝒲(C, ζ_{k,w})). The displayed formula, garbled in the OCR, was read from the page image: ζ_{k,w}(z) = (z z̄)^{(−w−k+1)/2} z^{k−1}.
- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §12, Proposition 12.1, printed p. 206 (PDF p. 212). Excerpt: “no quasi-character µ of CF such that χ(α) = µ(NK/F α) for all α in CK the representation”. Match: Proof step: the global Weil construction. If χ does not factor through the norm, ⊗_v π(σ_v) with σ = Ind χ is a constituent of A₀, i.e. cuspidal; the words 'If there is' and the conclusion 'is a constituent of A₀' surround the excerpt, where a tensor sign breaks the text layer.
- **jl70** (Hervé Jacquet and Robert P. Langlands, [*Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf)), §4, Theorem 4.6(iii), printed p. 71 (PDF p. 77). Excerpt: “If there is no quasi-character χ of F × such that ω = χ0 ν the representation π(ω) is absolutely cuspidal.”. Match: Proof step: the local Weil representation π(ω) is supercuspidal when ω does not factor through the norm ν (OCR 'χ0 ν' = χ∘ν). Used at v, and for the hypothesis that 𝒲(L_𝔭, ξ_𝔭) is cuspidal.
- **patrikis** (Stefan Patrikis, [*Variations on a theorem of Tate*](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)), §2.3, Lemma 2.3.1 and the sentence after it, printed p. 28 (PDF p. 32). Excerpt: “It follows that if F is a CM field, and {mv }v|∞ is a set of integers indexed by the archimedean places of F , then there is a unitary Hecke character ψ of F with archimedean components given by ψv (xv ) = (ιv (xv )/|ιv (xv )|)mv , for all v|∞.”. Match: Proof step: a unitary Hecke character of the CM field L with archimedean components (ι(z)/|ι(z)|)^{k_i−1}. Twisting by |·|^{−w/2} gives ζ_{k_i,w}. Patrikis's F is the node's L.

<a id="R17-5-octahedral-mod-three-application"></a>

### `R17.5/octahedral-mod-three-application` — The octahedral mod-3 application: odd mod-3 representations come from weight-one forms

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-mod-three-application` · declaration `TauCeti.GL2Transfer.octahedral_mod_three_application` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let ρ̄: G_Q → GL₂(F₃) be continuous, absolutely irreducible and odd (det ρ̄(c) = −1). Let λ = (1+√−2), so that Z[√−2]/λ ≅ F₃ with √−2 ↦ −1, and let s: GL₂(F₃) → GL₂(Z[√−2]) be an injective homomorphism with s(x) ≡ x mod λ. For example, s is determined by s([[1,1],[0,1]]) = [[−2, −1+√−2],[1+√−2, 1]] and s([[0,1],[1,0]]) = [[−1−√−2, −2],[−1+√−2, 1+√−2]]: these generate a group of order 48 that reduction maps bijectively onto GL₂(F₃). Fix Q(√−2) ⊂ C and put ρ = s∘ρ̄: G_Q → GL₂(C). Then ρ is continuous, irreducible and odd, with finite image isomorphic to that of ρ̄; det ρ is the ±1-valued lift of det ρ̄; and the projective image of ρ is isomorphic to the image of ρ̄ in PGL₂(F₃) ≅ S₄, so it is solvable (S₄, octahedral, exactly when ρ̄ is surjective). By solvable-artin and q-weight-one there is a normalized weight-one newform g of level N(ρ), the Artin conductor of s∘ρ̄, and odd quadratic nebentypus ε = det ρ, with ρ_g ≅ ρ. For every prime ℓ ∤ N(ρ), a_ℓ(g) = tr s(ρ̄(Frob_ℓ)) ∈ Z[√−2], a_ℓ(g) ≡ tr ρ̄(Frob_ℓ) and ε(ℓ) ≡ det ρ̄(Frob_ℓ) mod λ. Reducing ρ_g along the stable lattice Z[√−2]_λ² gives exactly ρ̄, so ρ̄_{g,λ} ≅ ρ̄. No general reduction-preserving lifting (the odd-residual-lift gap) is used. The level N(ρ) can exceed Serre's conductor of ρ̄. Darmon–Diamond–Taylor, Theorem 3.14(a), state the conclusion as modularity in weight two (their Definition 3.12) and pass from g to a weight-two form by Remark 3.6; that step is not part of this node.

**Hypotheses.**

- ρ̄: G_Q → GL₂(F₃) is continuous, absolutely irreducible and odd: det ρ̄(c) = −1 for complex conjugation c.
- λ = (1+√−2) is the prime of Z[√−2] above 3 (norm 3); reduction modulo λ identifies Z[√−2]/λ with F₃, √−2 ↦ −1.
- s: GL₂(F₃) → GL₂(Z[√−2]) is an injective group homomorphism with red_λ∘s = id (DDT's 'section'). The explicit s of the statement is one choice, checked by enumerating the 48 elements.
- A fixed embedding Q(√−2) → C; Frobenius is arithmetic and det ρ is read as a Dirichlet character by reciprocity, as in q-weight-one.

**Proof outline.**

1. ρ = s∘ρ̄ is continuous with finite image, and s restricts to an isomorphism im ρ̄ ≅ im ρ; in particular ker ρ = ker ρ̄.
2. Irreducible: if ρ were reducible over C, its finite image would be abelian (a sum of two characters), hence so would im ρ̄; an abelian group cannot act absolutely irreducibly in dimension two.
3. Odd: ρ(c)² = 1, so det ρ(c) = ±1, and it reduces to det ρ̄(c) = −1 ≠ 1 in F₃; hence det ρ(c) = −1. Likewise det s(x) ∈ Z[√−2]^× = {±1} reduces to det x, so det ρ is the ±1-valued lift of det ρ̄.
4. Projective image: s(GL₂(F₃)) is nonabelian, so it acts irreducibly on C², and by Schur s(−1) is a scalar of order two, namely −1. Conversely, if s(x) is scalar then x = red s(x) is scalar. So s induces an isomorphism between the images in PGL₂(F₃) ≅ S₄ and in PGL₂(C), and the projective image of ρ is solvable (R01.4).
5. Apply solvable-artin and q-weight-one to ρ: a normalized weight-one newform g of level N(ρ) and nebentypus det ρ, whose Frobenius polynomials are X² − a_ℓ(g)X + det ρ(Frob_ℓ) for ℓ ∤ N(ρ).
6. Reduction: the lattice Z[√−2]_λ² is stable under s(GL₂(F₃)) and its reduction is red∘s∘ρ̄ = ρ̄. Since ρ̄ is absolutely irreducible, every stable lattice gives the same reduction up to isomorphism (Brauer–Nesbitt, R01.5), so ρ̄_{g,λ} ≅ ρ̄. All a_n(g) lie in Z[√−2]: at p | N(ρ), a_p is 0 or the eigenvalue of Frob_p on the inertia invariants, a line defined over Q(√−2).

**Acceptance.**

- The section must be a homomorphism: the entrywise lift [[1,1],[0,1]] of an element of order 3 has infinite order in GL₂(Z[√−2]), whereas s([[1,1],[0,1]]) has order 3, trace −1, and the primitive cube roots of unity as eigenvalues.
- The level of g is not Serre's conductor: at ℓ ≠ 3 where ρ̄(I_ℓ) is generated by a unipotent element of order 3, ρ̄ has conductor exponent 1, but s of that element has no fixed vector, so s∘ρ̄ has conductor exponent 2 at ℓ.
- For ρ̄ = ρ̄_{E,3} of an elliptic curve E/Q with surjective mod-3 representation, det ρ̄ is the mod-3 cyclotomic character, so ε is the quadratic character of Q(√−3) and 3 divides N(ρ).
- The construction is special to F₃. For surjective ρ̄: G_Q → GL₂(F₉), GL₂(F₉) is not solvable (pinned baseline: F₉ has a nonzero a with a² ≠ 1), and every lift with finite image surjects onto im ρ̄, so solvable-artin applies to no such lift. In F₃ every nonzero a has a² = 1, consistent with GL₂(F₃), of order 48, being solvable.
- Only weight one is produced. The weight-two form in DDT Theorem 3.14 needs Remark 3.6, a separate step.

**Prerequisites.** [`R17.5/solvable-artin`](#R17-5-solvable-artin), [`R17.5/q-weight-one`](#R17-5-q-weight-one), `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.5`, `mathlib:Matrix.GeneralLinearGroup.map`, `tauceti:TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

**Sources.**

- **ddt** (Henri Darmon, Fred Diamond and Richard Taylor, [*Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf)), §3.2, Theorem 3.14(a), p. 90. Excerpt: “Theorem 3.14 Let ρ̄ : GQ → GL2 (k) be a continuous absolutely irreducible representation with det(ρ̄(c)) = −1. Suppose that one of the following holds: (a) k = F3 ;”. Match: Exact hypotheses for k = F₃. DDT's conclusion 'ρ̄ is modular' means weight two (Definition 3.12); the node stops at weight one.
- **ddt** (Henri Darmon, Fred Diamond and Richard Taylor, [*Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf)), §3.2, sketch of proof of Theorem 3.14, case (a), p. 90. Excerpt: “One checks that there is a section s : GL2 (F3 ) → GL2 (Z[ −2]) and applies theorem 3.9 to s ◦ ρ̄. The resulting representation arises from a weight one newform, and hence its reduction ρ̄ is equivalent to ρ̄f for some f (see remark 3.6).”. Match: Exact for the proof, with the map GL₂(Z[√−2]) → GL₂(F₃) defined in the preceding line as reduction modulo (1+√−2) (the '√' is lost in the text layer: 'Z[ −2]' = Z[√−2]). DDT do not give s; the node gives an explicit one. The passage to weight two by Remark 3.6 is outside the node.
- **ddt** (Henri Darmon, Fred Diamond and Richard Taylor, [*Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf)), §3.2, Theorem 3.9, p. 89. Excerpt: “Theorem 3.9 Let ρ : GQ → GL2 (C) be a continuous irreducible representation such that ρ(GQ ) is solvable and det(ρ(c)) = −1. Then ρ is equivalent to ρg for some newform g of weight one.”. Match: The Langlands–Tunnell input over Q in the odd case, which the node takes from solvable-artin and q-weight-one.
- **ddt** (Henri Darmon, Fred Diamond and Richard Taylor, [*Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf)), §3.2, Definition 3.12, p. 89. Excerpt: “We say that a representation ρ̄ : GQ → GL2 (k) is modular (of level N ) if for some newform f of weight 2 (and level N ), ρ̄ is equivalent over kf to ρ̄f .”. Match: Normalisation: DDT's 'modular' is weight two, so Theorem 3.14 is a weight-two statement. This node records only the weight-one step.

<a id="layer-R17-6"></a>

# Layer R17.6. Characteristic-two soluble cases and transfer interfaces

Characteristic two and the interfaces of transfer. A residual r̄ : G_ℚ → GL₂(F̄₂) with solvable projective image has dihedral projective image D_n with n odd (`solvable-dihedral`). After the determinant is removed (`determinant-untwist`) it is induced from a quadratic field, and its Teichmüller lift falls in one of four dyadic conductor cases (`teichmuller-conductor`). Rohrlich and Tunnell's lemma and theorem (`rt-technical-lemma`, `serre-odd-trick`, `rohrlich-tunnell`) and Wiese's lifting lemma and Katz-form theorem (`wiese-odd-lift`, `unramified-katz`) give modularity (`qualitative-residual-modularity`), and `weight-two-witness` passes to a witness of weight at least two.

The interfaces exported to potential modularity close the layer: irreducibility under linearly disjoint base change (`disjoint-irreducibility`), the restriction criterion for induced representations (`quadratic-restriction`), base change and descent of compatible systems (`compatible-base-change`, `compatible-descent`) and the conditional transfer interface (`potential-modularity-interface`).

**Nodes:** 15. **Planets:** Rohrlich–Tunnell weight and level lemma, Rohrlich–Tunnell theorem, Wiese’s dihedral lifting lemma, Dihedral Katz weight-one theorem, Characteristic-two solvable modularity.

<a id="R17-6-determinant-untwist"></a>

### `R17.6/determinant-untwist` — Removing the characteristic-two scalar character

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist` · declaration `TauCeti.GL2Transfer.determinant_untwist` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with dihedral projective image D_n, n odd ≥3, the determinant character det r̄ has odd order and a unique square root ξ:G_Q→F̄₂^× (unique among all characters, since a²=1 forces a=1 in characteristic two); ξ has odd order and is unramified at 2. The twist r̄₀=r̄⊗ξ^{-1} has determinant one and its image maps isomorphically onto the projective image, so it is dihedral of order 2n: a finite scalar in SL₂(F̄₂) is trivial. Conversely, a projective-dihedral r̄ has linear-dihedral image exactly when det r̄=1, because D_n (n odd) is generated by involutions and involutions in GL₂(F̄₂) are unipotent. Twisting a residual modular form for r̄₀ back by ξ (via reciprocity, a Teichmüller lift of ξ and a finite coefficient extension) recovers r̄; level and nebentypus are then recomputed using the actual twist, not held fixed.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous and absolutely irreducible, so it has finite image.
- The projective image of r̄ is dihedral D_n with n odd ≥3 (the output of solvable-dihedral).
- Characters G_Q→F̄₂^× are identified with odd-order Dirichlet characters by global reciprocity (ClassFieldTheory layer 11, GlobalNumberFields layer 9); twisting a residual form uses a Teichmüller lift of ξ and a finite coefficient extension.

**Proof outline.**

1. Every finite subgroup of F̄₂^× is cyclic of odd order; squaring is an automorphism of the value group of det r̄, giving ξ=(det r̄)^{(m+1)/2} with m the order of det r̄. An odd-order Dirichlet character is trivial on the 2-part, so ξ is unramified at 2.
2. The central kernel after determinant normalization consists of scalars a with a²=1 and is trivial in characteristic two, so the image of r̄₀ is isomorphic to D_n.
3. For the converse use that involutions in GL₂(F̄₂) are unipotent, hence of determinant one, and that D_n is generated by involutions.
4. Use the supplied twist and conductor interfaces to return to the original representation.

**Acceptance.**

- For a nontrivial scalar twist the original determinant need not be one.
- Correcting the determinant can change conductor; an exact original-level claim requires a separate twist conductor calculation.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Sources.**

- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), §4, proof of Theorem 10, printed p. 131 (PDF p. 9). Excerpt: “be the character such that φ2 = det ◦ρ. As φ has odd order, it is unramified at 2 because of the Kronecker-Weber theorem.”. Match: Proof step only: Wiese takes the square root φ of det ρ and notes it has odd order and is unramified at 2 (text layer writes φ2 for φ²). The untwist to determinant one and the injectivity of SL₂(F̄₂)→PGL₂(F̄₂) are the packet's own.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Introduction, printed p. 125 (PDF p. 3). Excerpt: “with the more restrictive definition of a dihedral representation to be such that its image in GL2 (F2 ), and not in PGL2 (F2 ), is isomorphic to a dihedral group.”. Match: Scope comparison only: RT's 'dihedral' means linear-dihedral image, Wiese's means projective-dihedral; this node is the bridge between the two (text layer drops the overlines on F̄₂).
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), Introduction, printed p. 300 (PDF p. 2). Excerpt: “It should be added, however, that while Serre’s example involves a representation of dihedral type (in the sense that the associated projective representation has dihedral image) the representation itself is not in fact dihedral.”. Match: Supporting passage: RT separate projective-dihedral 'dihedral type' from linear-dihedral and note Serre's example is only the former. RT contain no untwisting argument.

<a id="R17-6-solvable-dihedral"></a>

### `R17.6/solvable-dihedral` — Solvable characteristic-two images are dihedral

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral` · declaration `TauCeti.GL2Transfer.solvable_dihedral` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let r̄:G_Q→GL₂(F̄₂) be continuous and absolutely irreducible, with solvable projective image. Then its projective image is a dihedral group D_n of order 2n with n odd ≥3. Reason, from the R01.4 classification in characteristic two: PGL₂(F̄₂)=PSL₂(F̄₂)≅SL₂(F̄₂); every 2-subgroup of SL₂(F̄₂) is elementary abelian and unipotent, so it fixes a unique line; hence a finite subgroup with a nontrivial normal 2-subgroup (every Borel-type group, the Klein four group, and A₄, which here is the Borel subgroup of SL₂(F₄)) fixes a point of P¹, as does a cyclic group of odd order, and makes r̄ reducible; S₄ does not embed because its Sylow 2-subgroup is nonabelian; an even-order element of a dihedral subgroup is an involution, so n is odd. After removing a scalar character (determinant-untwist), the linear image is dihedral of order 2n. This is a Galois application of the existing finite-group classification, not a second classification proof. In characteristic two the determinant condition at complex conjugation is vacuous, so it cannot be used to deduce that a naive complex lift is odd.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous for the discrete topology on F̄₂, hence has finite image.
- r̄ is absolutely irreducible (over F̄₂ the same as irreducible).
- The image of r̄ in PGL₂(F̄₂) is solvable.
- The finite-subgroup classification of PGL₂(F̄₂)=PSL₂(F̄₂)≅SL₂(F̄₂) is imported from R01.4, specialised to characteristic two.

**Proof outline.**

1. Use continuity and the discrete residual coefficient field to obtain a finite image in some GL₂(F_{2^f}), hence a finite projective image G.
2. Identify PGL₂(F̄₂) with SL₂(F̄₂) (the centre of SL₂ is trivial in characteristic two and every determinant is a square) and apply the imported classification: Borel-type groups, cyclic groups of odd order, dihedral groups of order 2n with n odd, and the non-solvable SL₂(F_{2^k}), k≥2 (A₅≅SL₂(F₄)).
3. Exclude line-preserving cases by absolute irreducibility: a nontrivial normal 2-subgroup is unipotent and fixes a unique line, which is then G-stable; a cyclic odd-order group is diagonalizable. A₄ occurs only as a Borel subgroup and S₄ does not occur. What remains is D_n, n odd ≥3.
4. Use determinant-untwist to pass to the linear-dihedral hypothesis of Rohrlich–Tunnell; retain the scalar character for twisting back.

**Acceptance.**

- A reducible upper-triangular residual representation is not included.
- The classical Rohrlich–Tunnell theorem assumes linear-dihedral image; a scalar twist is recorded explicitly.
- A projective image A₄ in characteristic two is the Borel subgroup of SL₂(F₄), with a normal Klein four group of unipotents; it forces a fixed line and is not an irreducible case.
- A projective image D_n with n even, including the Klein four group D₂, does not occur for irreducible r̄ in characteristic two.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`, [`R17.6/determinant-untwist`](#R17-6-determinant-untwist).

**Sources.**

- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Introduction, printed p. 123 (PDF p. 1). Excerpt: “We define those to be the continuous irreducible Galois representations that are induced from a character of the absolute Galois group of a quadratic number field. Let us mention that this is equivalent to imposing that the projective image is isomorphic to a dihedral group Dn with n ≥ 3.”. Match: Supporting passage, not a proof: Wiese's definition of dihedral (induced from a quadratic field) and the asserted equivalence with projective image D_n. For p=2 this is exactly the node's conclusion (n odd ≥3); for odd p the printed equivalence omits n=2 and irreducibility (sourceIssues). The solvable⇒dihedral reduction through the finite-subgroup classification is the packet's own.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, first paragraph, printed p. 306 (PDF p. 8). Excerpt: “A consideration of Jordan normal forms shows that an element of even order in GL(2, F2 ) is the product of an involution and an element of the center, the latter necessarily of odd order.”. Match: Proof step only: the characteristic-two Jordan-form fact used to see that 2-elements are unipotent (text layer writes F2 for F̄₂). RT apply it only to linear-dihedral images.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, first paragraph, printed p. 306 (PDF p. 8). Excerpt: “On the other hand, a dihedral group contains no nontrivial central elements of odd order. Thus an element of even order in a dihedral subgroup of GL(2, F2 ) is an involution, and therefore the order of such a subgroup, if at least 6, is twice an odd integer.”. Match: Proof step only: a dihedral subgroup of GL₂(F̄₂) of order ≥6 has order twice an odd number, which gives n odd in the node.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), Introduction, printed p. 299 (PDF p. 1). Excerpt: “One curious feature of Serre’s conjecture is that when ` = 2 the requirement that ρ have odd determinant is vacuous, because det ρ(σ∞ ) is equal to ±1 in any case, hence equal to −1 if ` = 2.”. Match: Exact source for the node's last sentence: oddness is vacuous in characteristic two (text layer renders ℓ as `).

<a id="R17-6-teichmuller-conductor"></a>

### `R17.6/teichmuller-conductor` — Teichmüller lift and the four dyadic conductor cases

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor` · declaration `TauCeti.GL2Transfer.teichmuller_conductor` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let r̄₀:G_Q→GL₂(F̄₂) be irreducible with linear-dihedral image of order 2n, n odd ≥3. Then r̄₀=Ind_{G_K}^{G_Q}φ for the uniquely determined quadratic field K and a character φ:G_K→F̄₂^× of odd order. Let φ̃ be the unique complex character of G_K of the same order with φ̃≡φ modulo the fixed prime l|2 (the place λ), and ρ̃=Ind φ̃. For every σ the 1-eigenspaces of ρ̃(σ) and r̄₀(σ) have equal dimension: rotations have eigenvalues φ̃(σ)^{±1}, odd-order roots of unity on which reduction is injective; a reflection has complex eigenvalues 1,−1 and its residual image is a nontrivial unipotent involution, never semisimple. Every subgroup of D_n is cyclic or contains a nontrivial rotation, so the invariants of all ramification groups at odd primes agree and the prime-to-two Artin conductor of ρ̃ is N=N(r̄₀): |D|·N_{K/Q}f(φ̃)=2^νN, D=disc K. If 2 splits or ramifies in K then N f(φ̃) is odd; if 2 is inert it is odd or an odd multiple of 4. The four cases are: (i) D and N f(φ̃) odd, ν=0; (ii) D≡5 mod 8 (printed 'D≡±5 (mod 8)'; −5≡3 mod 8 is not a discriminant) and N f(φ̃)≡4 mod 8, ν=2; (iii) D≡4 mod 8 and N f(φ̃) odd, ν=2; (iv) D≡0 mod 8 and N f(φ̃) odd, ν=3. The printed 'ν=3 in case (iii)' is the misprint corrected in sourceIssues E1.

**Hypotheses.**

- r̄₀:G_Q→GL₂(F̄₂) is continuous and irreducible, with linear image a dihedral group of order 2n, n odd ≥3 (not merely projective-dihedral).
- A fixed embedding of Q̄ in C and a fixed prime ideal l of the algebraic integers above 2 (the coefficient place λ) define φ̃ and all reductions.
- N(r̄₀) is the prime-to-2 Artin conductor in RT's normalisation (the contribution at ℓ=2 is omitted).
- D is the discriminant of K and f(φ̃) the finite conductor of φ̃ viewed as an odd-order ray class character of K.

**Proof outline.**

1. RT §2 Jordan-form argument with R01.4: the index-two cyclic subgroup of the image has odd order and is diagonalised by two distinct mutually inverse characters; K is its fixed field, unique because D_n (n odd ≥3) has a unique cyclic subgroup of index two.
2. Lift: reduction mod l is an isomorphism μ_m(C)→μ_m(F̄₂) for m odd, giving φ̃ of the order of φ; φ̃^σ=φ̃^{-1}, so ρ̃ has dihedral image mapping isomorphically onto that of r̄₀.
3. Compare fixed-space dimensions element by element, then for every subgroup H of D_n (cyclic: use a generator; containing a nontrivial rotation: no invariants on either side), hence the Artin exponents at every odd prime agree (R01.3).
4. Apply the imported induction-conductor formula f(Ind φ̃)=|D|·N_{K/Q}f(φ̃). At a dyadic prime an odd-order local character is trivial on the pro-2 group 1+𝔭, so it is unramified when the residue field is F₂ (2 split or ramified) and has exponent at most 1 at the inert prime (residue field F₄).
5. Read off ν from v₂(D)∈{0,2,3} and v₂(N f(φ̃))∈{0,2}: ν=0,2,2,3 in cases (i)–(iv).
6. Retain the reflection fixed line when reducing the involution in characteristic two; semisimplicity of individual matrices is not assumed.

**Acceptance.**

- For a reflection, the induced integral matrix [[0,1],[1,0]] has complex eigenvalues 1,−1 and reduces to a nontrivial unipotent matrix; both fixed spaces have dimension one.
- D≡4 mod 8 has ν=2, not ν=3.
- D≡5 mod 8 with φ̃ unramified at 2O_K is case (i), not (ii); D≡1 mod 8 always gives case (i).
- No fundamental discriminant is ≡3 mod 8, so the printed alternative −5 in case (ii) is vacuous.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Sources.**

- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, first paragraph, printed p. 306 (PDF p. 8). Excerpt: “Let ϕ̃ be the unique complex-valued character of Gal(Q/K) which has the same order as ϕ and satisfies ϕ(σ) = ϕ̃(σ) mod l for σ ∈ Gal(Q/K).”. Match: Exact: the same-order lift φ̃ of φ at the fixed prime l above 2 (the node's 'Teichmüller lift' at λ).
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, first paragraph, printed p. 306 (PDF p. 8). Excerpt: “The complex representation ρ̃ = indK/Q ϕ̃ is a lift of ρ which preserves the dimension of the 1-eigenspace of ρ(σ) for each σ ∈ Gal(Q/Q). Hence the parameter N = N (ρ) in Serre’s conjecture is simply the Artin conductor of ρ̃ with the factor at 2 omitted.”. Match: Exact for the conductor comparison; the node adds the subgroup-by-subgroup justification (cyclic subgroups, or a nontrivial rotation with no invariants) that RT leave implicit.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, second paragraph, printed p. 306 (PDF p. 8). Excerpt: “Viewing ϕ̃ as a ray class character of odd order, one finds that if 2 splits or ramifies in K then Nf(ϕ̃) is odd, while if 2 remains prime in K then Nf(ϕ̃) is either odd or an odd multiple of 4.”. Match: Exact: the dyadic class-field-theory step behind the four cases.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, second paragraph, list (i)–(iv), printed p. 306 (PDF p. 8). Excerpt: “Hence there are four possibilities: (i) D and Nf(ϕ̃) are both odd. (ii) D ≡ ±5 (mod 8) and Nf(ϕ̃) ≡ 4 (mod 8). (iii) D ≡ 4 (mod 8) and Nf(ϕ̃) is odd. (iv) D ≡ 0 (mod 8) and Nf(ϕ̃) is odd.”. Match: Exact case list. The node rewrites case (ii) as D≡5 mod 8, which is equivalent because odd fundamental discriminants are ≡1 mod 4.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, sentence after the list, printed p. 307 (PDF p. 9). Excerpt: “We see that ν = 0 in case (i), ν = 2 in cases (ii) and (iii), and ν = 3 in case (iii).”. Match: Exact except the misprint E1: the printed 'ν = 3 in case (iii)' must read case (iv); the node states the corrected value.

<a id="R17-6-rt-technical-lemma"></a>

### `R17.6/rt-technical-lemma` — Rohrlich–Tunnell’s weight and level lemma ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma` · declaration `TauCeti.GL2Transfer.rt_technical_lemma` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Rohrlich–Tunnell weight and level lemma**

Fix Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the coefficient place λ). Let g=Σb(n)q^n∈Prim₁(2^νNr,χ), a normalized newform of weight one, exact level 2^νNr and character χ with χ²=1, where ν∈{0,2,3}, N is odd and r is either 1 or an odd prime not dividing N. Assume N=N(ρ_g); if r≠1 assume b(r)≢1 mod l; if ν=2 assume b(n)=0 whenever n is even; if ν=3 assume b(2)≢0 mod l. Put k=2 if ν∈{0,2} and k=4 if ν=3. Then there is f∈Prim_k(N), a normalized newform of weight k, exact level N and trivial character, with ρ_f≅ρ_g. The Fourier conditions are used in the proof (RT Remark 2: without b(n)=0 for even n, formula (3) in Case 2 is false); the source does not show they are necessary. The theorem is a specialized arithmetic application of the imported Deligne–Serre lifting and old/newform theory, not a replacement for them.

**Hypotheses.**

- A fixed embedding Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the place λ); ρ_h denotes the semisimple mod-l representation attached to an eigenform h by traces and determinants at good primes.
- g=Σb(n)q^n is a normalized newform of weight one, exact level 2^νNr and character χ with χ²=1 (necessarily odd in weight one).
- ν∈{0,2,3}; N is odd; r is 1 or an odd prime not dividing N.
- N=N(ρ_g), the prime-to-2 Artin conductor of ρ_g.
- If r≠1 then b(r)≢1 mod l.
- If ν=2 then b(n)=0 for every even n.
- If ν=3 then b(2)≢0 mod l.
- Conclusion weight k=2 for ν∈{0,2} and k=4 for ν=3.

**Proof outline.**

1. Reduce to step (i): a divisor M of N and f∈Prim_k(M) with a(p)≡b(p) mod l for all p∤2Nr. Step (ii): for p∤2Nr traces agree and det ρ_f(σ_p)=p^{k−1}≡1≡χ(p) mod l, so ρ_f≅ρ_g by Chebotarev and Brauer–Nesbitt (R01.5). Step (iii): N(ρ_f) divides M (conductor of ρ_{f,λ} away from 2 equals the odd level M, R19.4, and reduction does not increase it, R01.3); with N(ρ_f)=N and M|N, M=N.
2. Preliminary remark (r≠1): for a T_p-eigenvector f₀∈S₂(N′r), p≠2, N′∈{N,2N}, with λ_r≠±1, the attached primitive form has conductor dividing N′; otherwise r exactly divides its conductor, f₀ is a combination of f(dz) with d prime to r, λ_r=a(r), and a(r)=±1 by the Atkin–Lehner sign. Since λ_r≡b(r)≢1 and −1≡1 mod l, λ_r≠±1.
3. ν=0: h=g²∈S₂(Nr); with τ the inverse of a Frobenius at l, h^τ≡Σb(n)q^{2n} mod l is a mod-l eigenvector of T_p (p≠2) with eigenvalues b(p); apply the Deligne–Serre lifting lemma, then the preliminary remark with N′=N.
4. ν=2: b(n)=0 for even n makes g|W odd in q, so g|C=−g and g²∈S₂(2Nr); b(2)=0 forces χ to have odd conductor, so the Atkin–Li operator J at 2 is an involution and g|J=±g; the trace W′(A+B+C)W″ gives h∈S₂(Nr) with h^τ≡Σb(n)q^n mod l; apply Deligne–Serre and the preliminary remark with N′=N.
5. ν=3: h=Σc(4n)q^n∈S₂(2Nr) (Li), h^τ≡Σb(2n)q^n, nonzero mod l since b(2)≢0; Deligne–Serre gives a primitive weight-two g₁ of conductor N₁|2N (preliminary remark with N′=2N). If N₁|N, square g₁ into S₄(N₁); if N₁=2L, use the Atkin–Lehner involution at 2 and the trace W′(A+B+C)W″ to get h₁∈S₄(L) with h₁^τ≡g₁ mod l; apply Deligne–Serre in weight four.
6. In every case pass from the characteristic-zero eigenvector to a primitive form f of level M|N with a(p)≡b(p) for p∤2Nr by old/newform theory (R16.6, Tau Ceti ModularForms layers 4 and 6).

**Acceptance.**

- In dyadic case (iii), b(2)≠0 violates the ν=2 hypothesis; this lemma gives no exact-level conclusion.
- The exact conductor equality follows after recognition, not from the existence of an old eigenform.
- The output f has trivial character although χ is odd; this is consistent because χ(p)≡1≡p^{k−1} mod l for odd p.
- If r≠1 and b(r)≡1 mod l the lemma does not apply: an eigenvalue λ_r=±1 cannot be excluded and r may remain in the level.

**Prerequisites.** `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`, `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform`.

**Sources.**

- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §1, Lemma, printed p. 302 (PDF p. 4). Excerpt: “be an element of Prim1 (2ν N r, χ), where ν ∈ {0, 2, 3}, N is odd, r is either 1 or an odd prime not dividing N , and χ2 = 1. Assume that N = N (ρg ). Also, if r 6= 1 assume that b(r) 6≡ 1 (mod l); if ν = 2 assume that b(n) = 0 whenever n is even; and if ν = 3 assume that b(2) 6≡ 0 (mod l).”. Match: Exact hypotheses (text layer renders ≠, ≢ as '6=', '6≡', superscripts flattened: 2ν N r is 2^νNr, χ2 is χ²).
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §1, Lemma, printed p. 302 (PDF p. 4). Excerpt: “Put k = 2 if ν ∈ {0, 2} and k = 4 if ν = 3. Then there exists an element f ∈ Primk (N ) such that ρf ∼  = ρg .”. Match: Exact conclusion: f in Prim_k(N), weight k=2 or 4, with ρ_f≅ρ_g.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §1, printed p. 301 (PDF p. 3). Excerpt: “The subset of Sk (N, χ) consisting of primitive forms of conductor N (i.e. “normalized new forms of level N ”) will be denoted Primk (N, χ), or simply Primk (N ) if χ is trivial.”. Match: Exact definition of Prim: normalized newforms of exact level N, trivial character when χ is omitted; this is the node's 'exact level N and trivial character'.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §1, proof of the Lemma, step (iii), printed p. 302 (PDF p. 4). Excerpt: “As for (iii), a theorem of Carayol [3] implies that N (ρf ) ⩽ M (see Carayol [4] or Livné [9]). Since N (ρf ) = N (ρg ) by (ii) and N (ρg ) = N by assumption, it follows that N ⩽ M , whence M = N because M divides N .”. Match: Proof step: RT print N(ρ_f)≤M; the cited Carayol–Livné result gives divisibility, which the node uses; either suffices since M|N.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §1, preliminary remark, printed p. 302 (PDF p. 4). Excerpt: “This is a contradiction, because −a(r) is the eigenvalue of an involution on S2 (N 0 r), namely the Atkin-Lehner involution at the prime r ([1], p. 147, Thm. 3(iii)).”. Match: Proof step: removal of the auxiliary prime r via the Atkin–Lehner sign (N 0 r is N′r in the text layer).
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §1, Case 2 (ν=2), printed p. 304 (PDF p. 6). Excerpt: “The conductor of χ is either odd or an odd multiple of 4, and in the latter case |b(2)| = 1 ([10], p. 170, Thm. 4.6.17(1)). Since b(2) = 0 by assumption we deduce that χ has odd conductor.”. Match: Proof step: where b(2)=0 is used to make the Atkin–Li operator at 2 an involution fixing g.

<a id="R17-6-serre-odd-trick"></a>

### `R17.6/serre-odd-trick` — The real-quadratic odd-lift trick

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick` · declaration `TauCeti.GL2Transfer.serre_odd_trick` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let r̄₀=Ind_{G_K}^{G_Q}φ, φ̃, N and ν be as in teichmuller-conductor with K real quadratic (D>0) and D odd or divisible by 8; let ∞₁,∞₂ be the real places of K. There exist a prime ideal 𝔯 of K of degree one, prime to 2N, and a quadratic Hecke character ξ of K ramified precisely at ∞₁ and 𝔯, with φ̃(𝔯)≠1. Put r=N𝔯, an odd prime not dividing N and split in K, and g=Σb(n)q^n where L(s,φ̃ξ)=Σb(n)n^{−s}. Then Ind(φ̃ξ) is odd because ξ has mixed signature, its Artin conductor is 2^νN·r, and g∈Prim₁(2^νNr,χ) with χ the product of the Kronecker symbol at D and the (odd) Legendre symbol at r. Since ξ≡1 mod l, ρ_g≅r̄₀ and N(ρ_g)=N. Moreover b(r)≡φ̃(𝔯′)=φ̃(𝔯)^{−1}≢1 mod l, in case (ii) b(n)=0 for even n, and in case (iv) b(2)≢0 mod l. Thus g satisfies every hypothesis of rt-technical-lemma. This controlled auxiliary ramification is the Serre trick used by Rohrlich–Tunnell, distinct from Wiese's trace-zero choice of auxiliary primes.

**Hypotheses.**

- r̄₀=Ind_{G_K}^{G_Q}φ is irreducible with linear-dihedral image; φ̃, N, ν are as in teichmuller-conductor, at the fixed prime l above 2.
- K is real quadratic (D>0), with real places ∞₁, ∞₂.
- D is odd or divisible by 8, so the dyadic case is (i), (ii) or (iv).
- Degree-one primes are taken in a prescribed narrow ray class modulo 4f(φ̃) (Chebotarev).

**Proof outline.**

1. Let C be the narrow ray class group of K modulo 4f(φ̃) and c∈C the class of principal (γ) with γ negative at ∞₁, positive at ∞₂ and γ≡1 mod 4f(φ̃); c has order 1 or 2.
2. In the wide ray class group C′ modulo f(φ̃) choose an odd-order class b′ with φ̃(b′)≠1 and an odd-order preimage b∈C; by Chebotarev choose a degree-one prime 𝔯∈bc prime to 2N. Then 𝔯²∈b², so φ̃(𝔯)²=φ̃(b′)²≠1 and φ̃(𝔯)≠1.
3. With n the odd order of b, 𝔯^n∈c has a generator ρ negative at ∞₁, positive at ∞₂ and ≡1 mod 4f(φ̃); the quadratic character ξ of K(√ρ)/K is unramified above 2 (ρ≡1 mod 4), ramified at 𝔯 (v_𝔯(ρ)=n odd) and at ∞₁ only. N(ρ)=−r^n≡1 mod 4 gives r≡3 mod 4.
4. f(φ̃ξ)=f(φ̃)𝔯, so the Artin conductor is 2^νN·r; the determinant is the Kronecker character of D times ξ restricted to Q, the odd Legendre character at r. Apply dihedral-artin, quadratic-induction (L(s,AIθ)=L_K(s,θ)) and q-weight-one to obtain g with these coefficients.
5. b(r)=(φ̃ξ)(𝔯′) because ξ is ramified at 𝔯; ξ(𝔯′)=±1≡1 mod l and φ̃(𝔯′)=φ̃(𝔯)^{−1} is a nontrivial odd-order root of unity, not ≡1 mod l. The dyadic conditions hold as for D<0 because ξ is unramified above 2.

**Acceptance.**

- The untwisted real-quadratic complex induction is even and does not give a holomorphic weight-one form.
- The quadratic ξ disappears modulo two but its auxiliary characteristic-zero conductor is retained.
- The mixed-signature generator ≡1 mod 4 is produced for 𝔯^n with n odd, not for 𝔯 itself.
- The auxiliary prime satisfies r≡3 mod 4, so the nebentypus of g is odd as weight one requires.

**Prerequisites.** [`R17.6/teichmuller-conductor`](#R17-6-teichmuller-conductor), [`R17.5/dihedral-artin`](#R17-5-dihedral-artin), [`R17.5/q-weight-one`](#R17-5-q-weight-one), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `ArithmeticGaloisRepresentations:R01.3`, [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Sources.**

- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9). Excerpt: “We claim that there is a prime ideal r of K, relatively prime to 2N and of degree one, together with a quadratic Hecke character ξ of K, ramified precisely at ∞1 and r, such that ϕ̃(r) 6= 1.”. Match: Exact claim (text layer renders 𝔯 as r and ≠ as '6=').
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9). Excerpt: “Then g ∈ Prim1 (2ν N r, χ), where χ is the product of the Kronecker symbol at D and the Legendre symbol at r, viewed as a Dirichlet character modulo 2ν N r.”. Match: Exact level and character of g; the node adds that the Legendre character at r is odd (r≡3 mod 4).
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9). Excerpt: “on the other hand, ϕ̃(r) is a nontrivial root of unity of odd order and is therefore not congruent to 1 modulo l. Hence b(r) 6≡ 1 (mod l).”. Match: Exact: the condition b(r)≢1 mod l.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, construction of 𝔯 and ξ, printed p. 308 (PDF p. 10). Excerpt: “If n is the order of b then rn belongs to the ray class c and therefore has a generator ρ which is negative at ∞1 , positive at ∞2 , and congruent to 1 modulo 4. The quadratic Hecke character ξ associated to the extension”. Match: Exact: the mixed-signature generator is for 𝔯^n with n the odd order of b (text layer 'rn'), not for 𝔯.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), Remark 1, printed p. 308 (PDF p. 10). Excerpt: “Since ξ is chosen to have mixed signature the representation indK/Q ϕ̃ξ has odd determinant and so corresponds to a modular form of weight one rather than to a Maass form.”. Match: Exact: why the twisted induction is odd and gives weight one.

<a id="R17-6-rohrlich-tunnell"></a>

### `R17.6/rohrlich-tunnell` — Rohrlich–Tunnell characteristic-two modularity ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/rohrlich-tunnell` · declaration `TauCeti.GL2Transfer.rohrlich_tunnell` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Rohrlich–Tunnell theorem**

Fix Q̄⊂C and a prime ideal l above 2 (the coefficient place λ). Let r̄₀:G_Q→GL₂(F̄₂) be continuous and irreducible with linear-dihedral image (so det r̄₀=1), K the uniquely determined quadratic field with r̄₀=Ind_{G_K}^{G_Q}φ, D its discriminant, N=N(r̄₀) the (odd) prime-to-two conductor, ν defined by |D|·N_{K/Q}f(φ̃)=2^νN, and k=2 if ν∈{0,2}, k=4 if ν=3 (Serre's weight, which RT cite from Serre 1987, p. 188). If D is odd or divisible by 8, that is in cases (i), (ii) and (iv) of teichmuller-conductor, there is f∈Prim_k(N), a normalized newform of exact level N, trivial character and weight k, with ρ_f≅r̄₀ at l. Thus odd D gives weight 2 (ν=0 or 2) and 8|D gives weight 4 (ν=3). For D<0 use the odd induction of φ̃; for D>0 use serre-odd-trick and remove its auxiliary prime with the technical lemma. The theorem makes no assertion when D≡4 mod 8 (case (iii)); the authors know neither examples nor counterexamples there. A projective-dihedral r̄ with nontrivial determinant is outside the theorem and is reached only through determinant-untwist, with recomputed level and character.

**Hypotheses.**

- A fixed embedding Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the coefficient place λ).
- r̄₀:G_Q→GL₂(F̄₂) is continuous and irreducible, and its linear image is a dihedral group (this forces det r̄₀=1).
- K is the uniquely determined quadratic field with r̄₀=Ind_{G_K}^{G_Q}φ and D is its discriminant; D is odd or divisible by 8.
- N=N(r̄₀) is the prime-to-2 Artin conductor; ν is defined by |D|·N_{K/Q}f(φ̃)=2^νN; k=2 if ν∈{0,2} and k=4 if ν=3.

**Proof outline.**

1. Apply teichmuller-conductor: D odd or 8|D means case (i), (ii) or (iv), so ν=2 forces case (ii) and ν=3 forces case (iv).
2. D<0: Ind φ̃ is odd; dihedral-artin, quadratic-induction and q-weight-one give g=Σb(n)q^n with L(s,φ̃)=Σb(n)n^{−s} in Prim₁(2^νN,χ_D), χ_D the Kronecker symbol at D, and ρ_g≅r̄₀, so N(ρ_g)=N. In case (ii) φ̃ is ramified at the inert prime above 2, so b(n)=0 for even n; in case (iv) b(2)=φ̃(𝔭) is a root of unity, nonzero mod l. Apply rt-technical-lemma with r=1.
3. D>0: serre-odd-trick supplies g∈Prim₁(2^νNr,χ) satisfying every hypothesis of rt-technical-lemma; apply it.
4. Keep case (iii) out: φ̃ is unramified at the prime above 2, so b(2)≠0 violates the ν=2 hypothesis and formula (3) in the proof of the lemma fails, exactly as the source explains.

**Acceptance.**

- Odd D gives weight two in both odd cases: case (i) with ν=0, and case (ii) (D≡5 mod 8, φ̃ ramified at the inert prime 2O_K) with ν=2.
- For 8|D the prescribed weight is four; D≡4 mod 8 is not smuggled into the theorem.
- The node asserts neither the conclusion nor its failure for D≡4 mod 8 (source Remark 3).
- The trivial-character conclusion matches det r̄₀=1; a twist r̄₀⊗ξ with ξ≠1 is not covered.

**Prerequisites.** [`R17.6/teichmuller-conductor`](#R17-6-teichmuller-conductor), [`R17.6/serre-odd-trick`](#R17-6-serre-odd-trick), [`R17.6/rt-technical-lemma`](#R17-6-rt-technical-lemma), [`R17.5/q-weight-one`](#R17-5-q-weight-one), [`R17.5/dihedral-artin`](#R17-5-dihedral-artin), [`R17.5/quadratic-induction`](#R17-5-quadratic-induction).

**Sources.**

- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, Theorem, printed p. 307 (PDF p. 9). Excerpt: “We shall verify Serre’s conjecture in cases (i), (ii), and (iv): Theorem. Suppose that D is either odd or divisible by 8. Then there exists f ∈ Primk (N ) such that ρ ∼ = ρf .”. Match: Exact theorem; ρ is RT's linear-dihedral representation and Prim_k(N) means exact level N and trivial character.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, paragraph before the Theorem, printed p. 307 (PDF p. 9). Excerpt: “is the trivial character in all cases and k is 2 or 4 according as ν ∈ {0, 2} or ν = 3 (cf. [12], p. 188).”. Match: Exact definition of k by ν and trivial character, cited by RT from Serre 1987 p. 188 (the preceding ε is lost in the text layer).
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), §2, proof, case D<0, printed p. 307 (PDF p. 9). Excerpt: “Now if ν = 2 then we are in case (ii) above, so that ϕ̃ is ramified at the unique prime of K above 2. Therefore b(n) = 0 for n even. On the other hand, if ν = 3 then we are in case (iv) above, so that ϕ̃ is unramified at the unique prime p of K above 2.”. Match: Proof step: the dyadic Fourier conditions in cases (ii) and (iv).
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), Remark 2, printed p. 308 (PDF p. 10). Excerpt: “In this case ϕ̃ is unramified at the unique prime ideal of K above 2, and consequently the Fourier coefficient b(2) of g is nonzero. This violates a hypothesis of the technical lemma, namely that when ν = 2 the Fourier coefficients b(n) are zero for even n.”. Match: Exact reason case (iii) is excluded.
- **rt97** (David E. Rohrlich and Jerrold B. Tunnell, [*An elementary case of Serre’s conjecture*](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf)), Remark 3, printed p. 308 (PDF p. 10). Excerpt: “We lack examples or counterexamples bearing on the possible validity of our theorem in case (iii).”. Match: Exact: the theorem's status in case (iii) is open; the node asserts nothing there.

<a id="R17-6-wiese-odd-lift"></a>

### `R17.6/wiese-odd-lift` — Odd characteristic-zero lifts of mod-two dihedral representations ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift` · declaration `TauCeti.GL2Transfer.wiese_odd_lift` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Wiese’s dihedral lifting lemma**

Let r̄:G_Q→GL₂(F̄₂) be continuous and dihedral in Wiese's sense: r̄≅Ind_{G_K}^{G_Q}χ for a quadratic field K and a character χ:G_K→F̄₂^× with χ≠χ^σ (equivalently r̄ is irreducible with projective image D_n, n≥3; n is odd in characteristic two). Wiese's oddness hypothesis is vacuous in characteristic two. Let m be the order of r̄(G_Q), ζ_m a primitive m-th root of unity and P any prime of Q(ζ_m) above 2. (Wiese Lemma 3) There is an odd dihedral r̂:G_Q→GL₂(Z[ζ_m]) whose reduction modulo P is isomorphic to r̄: r̂=Ind χ̃ for the same-order lift χ̃ of χ when this is odd, and otherwise (which forces K real quadratic) r̂=Ind(χ̃ξ) with ξ the quadratic character of K(√λ)/K for some λ∈O_K of negative norm. No conductor is controlled in this general case. (Wiese Lemma 2) If moreover r̄ is unramified at 2 with conductor N, then either (a) some such r̂ has Artin conductor N, or (b) K is real quadratic and there is an infinite set S of primes ℓ, which may be taken odd, split in K and prime to N, with tr r̄(Frob_ℓ)=0, such that for each ℓ∈S some odd dihedral r̂_ℓ:G_Q→GL₂(Z[ζ_m]) of Artin conductor Nℓ reduces to r̄ modulo P. The result covers projective-dihedral images (scalar twists of linear-dihedral ones), not only the linear-dihedral images of Rohrlich–Tunnell.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous and dihedral in Wiese's sense: irreducible and induced from a character χ:G_K→F̄₂^× of a quadratic field K with χ≠χ^σ (equivalently, projective image D_n with n≥3; n is odd in characteristic two).
- Wiese's oddness hypothesis is vacuous in characteristic two (det r̄(c)=1=−1); the source lemmas hold for every prime p and are specialised here to p=2.
- Coefficients: m is the order of r̄(G_Q), the lift takes values in GL₂(Z[ζ_m]), P is any prime of Q(ζ_m) above 2, and Z[ζ_m]/P is embedded in F̄₂ compatibly with the values of χ.
- For the Lemma 2 refinement r̄ is unramified at 2 and N is its conductor (prime-to-2 Artin conductor).
- Lemma 3 assumes nothing at 2 and gives no control of the Artin conductor of the lift.

**Proof outline.**

1. Lift χ to the unique character χ̃:G_K→Z[ζ_m]^× of the same order reducing to χ modulo P. Then r̃=Ind χ̃ reduces to r̄; when r̄ is unramified at 2, r̃ has Artin conductor N, because χ and χ̃ have the same conductor f and f(Ind)=Norm(f)·|D|. If r̃ is odd this gives Lemma 3 and Lemma 2(a).
2. If r̃ is even then K is real: for K imaginary a complex conjugation lies outside G_K and has determinant −1. The kernel field of χ̃ is then totally real. For Lemma 3 take λ∈O_K with Norm(λ)<0. The character ξ of K(√λ)/K satisfies ξ(c)ξ^σ(c)=−1, so Ind(χ̃ξ) is odd, and it reduces to r̄ because ξ≡1 modulo P.
3. For Lemma 2(b) take degree-one primes Λ=(λ) with Norm(λ)<0 and λ≡1 modulo 4D·f·σ(f). Chebotarev in the narrow ray class group gives infinitely many. Then χ(Λ)=χ(σΛ)=1, so r̄(Frob_ℓ)=1 and its trace is 0 in characteristic two. K(√λ)/K is unramified at 2 and at the primes dividing Df and is tamely ramified at Λ, so Ind(χ̃ξ) is odd of Artin conductor Nℓ. Wiese imposes λ≡1 only modulo 4Df; when f≠σ(f) that does not force χ(σΛ)=1, so the σ-stable modulus is used here.

**Acceptance.**

- Even real-quadratic induction is repaired by a character trivial modulo two.
- The general Lemma 3 does not promise the conductor of Lemma 2.
- If χ is ramified at Q but not at σ(Q), an auxiliary prime chosen only with λ≡1 mod 4Df can have r̄(Frob_ℓ)=diag(1,ζ) with ζ≠1, whose trace 1+ζ is nonzero in characteristic two; the σ-stable congruence excludes this.

**Prerequisites.** [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.**

- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Lemma 2, printed p. 126 (PDF p. 4). Excerpt: “Lemma 2 Let ρ : GQ → GL2 (Fp ) be an odd dihedral representation that is unramified at p. Define K, χ, σ and m as above. Let N be the conductor of ρ.”. Match: Hypotheses of Lemma 2, specialised to p=2 (oddness is then vacuous). 'Fp' is the text layer's rendering of F̄_p; N is Serre's prime-to-p conductor and m the order of the image.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Lemma 2(b), printed p. 126 (PDF p. 4). Excerpt: “(b) One has that p = 2 and K is real quadratic. Moreover, there is an infinite set S of primes such that for each l ∈ S the trace of ρ(Frobl ) is zero, and there exists an odd dihedral representation ρb : GQ → GL2 (Z[ζm ]), which has Artin conductor N l and reduces to ρ modulo P.”. Match: Exact source for alternative (b); alternative (a) is the preceding item of the same lemma (lift of Artin conductor N). 'ρb' is the text layer's ρ̂. The node adds that ℓ can be taken odd, split in K and prime to N, which the proof gives once the modulus is corrected.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Lemma 3 and proof, printed p. 127 (PDF p. 5). Excerpt: “Lemma 3 Let ρ : GQ → GL2 (Fp ) be an odd dihedral representation. Define K, χ, m, ζm and P as in the previous lemma. There exists an odd dihedral representation ρb : GQ → GL2 (Z[ζm ]), whose reduction modulo P is isomorphic to ρ.”. Match: Exact source for the general lift, specialised to p=2; the source says just before it that the Artin conductor is not controlled.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), proof of Lemma 2, printed p. 127 (PDF p. 5). Excerpt: “Moreover, as l splits in K, one has that ρ(Frobl ) is the identity matrix, so that the trace of ρ(Frobl ) is zero.”. Match: Proof step only. With Wiese's congruence λ≡1 mod 4Df this needs χ(σΛ)=1, which holds only if λ≡1 mod σ(f) as well; the node uses the σ-stable modulus 4D·f·σ(f) (source issue recorded).

<a id="R17-6-unramified-katz"></a>

### `R17.6/unramified-katz` — Unramified mod-two dihedral Katz weight one ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz` · declaration `TauCeti.GL2Transfer.unramified_katz` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Dihedral Katz weight-one theorem**

Let r̄:G_Q→GL₂(F̄₂) be continuous and dihedral in Wiese's sense, unramified at 2, with conductor N=N(r̄) (the prime-to-2 Artin conductor, an odd integer) and ε=det r̄ viewed as a character of (Z/NZ)^×. Then there is a cuspidal Katz eigenform f∈S₁(Γ₁(N),ε,F̄₂)_Katz for all Hecke operators, which may be normalised (a₁=1), whose associated Galois representation is isomorphic to r̄: a_ℓ(f)=tr r̄(Frob_ℓ) and ε(ℓ)=det r̄(Frob_ℓ) for primes ℓ∤2N. This is Wiese Theorem 9 for p=2: the level is the conductor of r̄ and the character is det r̄. No condition at 2 beyond unramifiedness is imposed, so representations exceptional at 2 (restriction to a decomposition group at 2 a sum of two copies of one unramified character, for example K=Q(√229) with 2 inert) are included. The theorem does not assert a characteristic-zero weight-one form of level N reducing to r̄. Wiese's Introduction states, without proof, that none exists when K is real quadratic of discriminant N with fundamental units of norm −1 (example Q(√229)). The oldform and descent inputs (Wiese Proposition 4, Corollary 5, Proposition 7, Corollary 8) are imported through the R15.2 request; the new arithmetic combination is this theorem.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous and dihedral in Wiese's sense (irreducible, induced from a character of a quadratic field); oddness is vacuous in characteristic two.
- r̄ is unramified at 2 (equivalently, its minimal weight k(r̄) is one).
- N=N(r̄) is the prime-to-2 Artin conductor (odd); ε=det r̄ is viewed as a character of (Z/NZ)^×, which here equals the prime-to-2 part of det r̄.
- Katz cusp forms are taken in Wiese's non-compactified Γ₁(N) sense over F̄₂, with N invertible.
- The source theorem holds for every prime p; only p=2 is used here, where alternative (b) of Lemma 2 can occur.

**Proof outline.**

1. If Wiese Lemma 2(a) applies, R17.5/q-weight-one gives a weight-one newform of level N and character det r̂ with Galois representation r̂. Its reduction modulo P is the required eigenform; Katz forms are not needed in this case.
2. Otherwise Lemma 2(b) applies. For ℓ∈S, take the weight-one newform f^{(ℓ)} of level Nℓ attached to r̂_ℓ; a_q(f^{(ℓ)})≡0 mod P for q∈S∖{ℓ}. Corollary 5 gives an eigenform of level Nℓ³ with a_ℓ=0 and the same a_q for q≠ℓ. Its reduction g^{(ℓ)}∈S₁(Γ₁(Nℓ³),ε,F̄₂)_Katz has a_q=0 for all q∈S and Galois representation r̄.
3. For q|N the coefficients a_q(f^{(ℓ)}) lie in a finite set independent of ℓ: they are traces on inertia invariants of representations with image in a fixed finite group. Choose ℓ₁≠ℓ₂ in S whose reductions g₁,g₂ agree at every q|N. At q∤Nℓ₁ℓ₂ (including q=2) the coefficients agree by congruence of traces; at q=ℓ₁,ℓ₂ both vanish. Hence g₁ and g₂ have equal q-expansions.
4. Map g₁ and g₂ to level Nℓ₁³ℓ₂³ by the map of Proposition 7. By the q-expansion principle they give one form h, which is independent of the ℓ₁³- and the ℓ₂³-level structure, hence of m=ℓ₁³ℓ₂³. Proposition 7 and Corollary 8 (2∤Nm) descend h to an eigenform of level Γ₁(N) and character ε. R01.5 identifies its Galois representation with r̄ from full characteristic polynomials; trace alone is insufficient in characteristic two.

**Acceptance.**

- An exceptional Frobenius at two (e.g. K=Q(√229), 2 inert) is included; distinguish this from the excluded characteristic-zero same-level lift.
- Ramified-at-two minimal-weight modularity uses Wiese Theorem 10’s deep weight/level lowering, outside this elementary interface.
- Two arbitrary auxiliary primes need not give equal q-expansions; the pigeonhole on the coefficients at q|N is required before Proposition 7 applies.

**Prerequisites.** [`R17.6/wiese-odd-lift`](#R17-6-wiese-odd-lift), [`R17.5/q-weight-one`](#R17-5-q-weight-one), `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`, `AlgebraicModularFormsAndSerreWeights:R15.1/cusp-ideal-section-forms`, `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `R16.6`, `ArithmeticGaloisRepresentations:R01.5`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`, `AlgebraicModularFormsAndSerreWeights:R15.6/modularity-formulations-and-determinant`.

*Assembly note: the layer citations above, by node.*

- `R16.6` → [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison) (probable). Uses the Q weight-one dictionary for the newforms f^{(ℓ)} of level Nℓ attached to r̂_ℓ (level = exact conductor, nebentypus = central character), which weight-one-classical-comparison states. Differences: proof step 3 also uses that for q|N the coefficient a_q of a weight-one newform is the trace of Frobenius on the inertia invariants of its local parameter, which part R16.1 states only for k≥2 (classical-hecke-and-level: degree of the ramified factor from (ker N)^I); and the matching of Hecke eigenvalues with arithmetic Frobenius traces, which part R16.1 converts only for k≥2 (weight-k-parameter-conversion).

**Sources.**

- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Theorem 9, printed p. 130 (PDF p. 8). Excerpt: “Theorem 9 Let p be a prime and ρ : GQ → GL2 (Fp ) an odd dihedral representation of conductor N , which is unramified at p. Let ² denote the character det ◦ρ. Then there exists a Katz eigenform f in S1 (Γ1 (N ), ², Fp )Katz , whose associated Galois representation is isomorphic to ρ.”. Match: Exact for p=2 ('²' is the text layer's ε, 'Fp' is F̄_p): level Γ₁(N) with N the conductor, character det r̄, weight one. Normalisation a₁=1 is from Theorem 1 (p. 124).
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), proof of Theorem 9, printed p. 131 (PDF p. 9). Excerpt: “In the next step we embed g1 and g2 into S1 (Γ1 (N l13 l23 ), ², Fp )Katz via the method in the statement of Proposition 7. As the q-expansions coincide, g1 and g2 are mapped to the same form h.”. Match: Proof step: q-expansion comparison at the common level Nℓ₁³ℓ₂³, after the pigeonhole choice of ℓ₁,ℓ₂ on the same page ('two forms ... have the same coefficients at all primes q | N'); then Corollary 8.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Proposition 7, printed p. 129 (PDF p. 7). Excerpt: “A Katz modular form f ∈ Sk (Γ1 (N m), R)Katz is independent of m if and only if there exists a Katz modular form g ∈ Sk (Γ1 (N ), R)Katz such that”. Match: Descent criterion used in the last proof step, imported through the R15.2 request; hypotheses there: N, m coprime and R containing the Nm-th roots of unity and 1/(Nm).
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Introduction, printed p. 124 (PDF p. 2). Excerpt: “if p = 2 and the dihedral representation in question has odd conductor N and is induced from a real quadratic field K of discriminant N , whose fundamental units have norm −1, then there does not exist an odd characteristic zero representation with conductor dividing √ N that reduces to ρ.”. Match: Supports the non-liftability remark: the source then names Q(√229) as an example and gives no proof. The stray '√' comes from the Q(√229) on the next line of the text layer.

<a id="R17-6-qualitative-residual-modularity"></a>

### `R17.6/qualitative-residual-modularity` — Characteristic-two solvable residual modularity ★

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity` · declaration `TauCeti.GL2Transfer.qualitative_residual_modularity` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer` · planet **Characteristic-two solvable modularity**

Every continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with solvable projective image is realized by a holomorphic cuspidal weight-one newform, after choosing a coefficient number field, λ|2, a residue-field embedding and a stable lattice. The newform's level is the Artin conductor of the chosen odd lift and is not controlled in general. The qualitative proof applies the finite classification (such an r̄ has projective image D_n with n odd ≥3, so it is dihedral in Wiese's sense), Wiese’s odd lift (Lemma 3), and then dihedral Artin weight-one automorphy (Weil–Langlands, as in Wiese's proof of Theorem 1). If one wants a weight≥2 witness, apply the existing R15.5 reduction/true-eigenform result: Eisenstein multiplication for the reduction of a characteristic-zero form, and Hasse powers only when a Katz form is the input and the integral lifting criterion has been met. This broad existence theorem does not claim the exact minimal weight, level or trivial character of the restricted Rohrlich–Tunnell theorem.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous and absolutely irreducible with solvable projective image; in characteristic two this forces projective image D_n with n odd ≥3.
- No oddness or determinant hypothesis is needed: oddness is vacuous in characteristic two.
- The witness data are chosen: coefficient number field, place λ|2, residue-field embedding into F̄₂ and a stable lattice; the comparison is with the semisimplified reduction.
- The level of the weight-one witness is the Artin conductor of the chosen odd lift and is not controlled; weight and character are not minimised.

**Proof outline.**

1. Apply solvable-dihedral; use either its explicit scalar untwist and twist back or Wiese’s projective-dihedral odd lift directly.
2. Use the odd complex induction and the weight-one newform dictionary, retaining all coefficient/lattice data.
3. Pass to the existing R15.6 residual-modularity witness; its generic carrier is not rebuilt here.

**Acceptance.**

- All solvable projective images in characteristic two are covered without an odd determinant assumption.
- The produced witness may have auxiliary level or weight; those are recorded rather than silently minimized.

**Prerequisites.** [`R17.6/solvable-dihedral`](#R17-6-solvable-dihedral), [`R17.6/wiese-odd-lift`](#R17-6-wiese-odd-lift), [`R17.5/q-weight-one`](#R17-5-q-weight-one), `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`.

**Sources.**

- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), proof of Theorem 1, printed p. 131 (PDF p. 9). Excerpt: “If ρ is ramified at p, then let ρb be a characteristic zero representation lifting ρ, as provided by Lemma 3. The theorem by Weil-Langlands already used above (Theorem 1 of [S2]) implies the existence of a newform in weight one and characteristic zero giving rise to ρb.”. Match: Exact qualitative step: odd lift (Lemma 3) then weight-one newform. The source uses it only in the ramified case; the argument does not use ramification, so the node applies it to every dihedral r̄.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Introduction, printed p. 123 (PDF p. 1). Excerpt: “We define those to be the continuous irreducible Galois representations that are induced from a character of the absolute Galois group of a quadratic number field. Let us mention that this is equivalent to imposing that the projective image is isomorphic to a dihedral group Dn with n ≥ 3.”. Match: Definition of dihedral used. The step from 'solvable projective image' to 'dihedral' in characteristic two is the finite classification of R17.6/solvable-dihedral and R01.4, not in this source.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Lemma 3, printed p. 127 (PDF p. 5). Excerpt: “There exists an odd dihedral representation ρb : GQ → GL2 (Z[ζm ]), whose reduction modulo P is isomorphic to ρ.”. Match: The odd characteristic-zero lift consumed from wiese-odd-lift; no conductor control.

<a id="R17-6-weight-two-witness"></a>

### `R17.6/weight-two-witness` — Transfer to the weight-at-least-two residual witness

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/weight-two-witness` · declaration `TauCeti.GL2Transfer.weight_two_witness` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Given either an odd complex weight-one dihedral form reducing to r̄ or the preceding unramified Katz form, obtain the R15.6 residual-modularity witness with some weight k≥2 and its actual primitive level. For the reduction of a characteristic-zero weight-one form, use R15.5's Eisenstein multiplication (E₄≡1 mod 2). For a Katz input in characteristic two, the Hasse invariant has weight one and q-expansion one, so multiplying by a power of it preserves the q-expansion and the residual away-two eigencharacter. Wiese's Introduction uses a single factor (weight 2, which is Serre's weight for r̄ unramified at 2), together with the classicality of Katz forms of weight ≥2 on Γ₁(N). That classicality holds for N≥5, which covers N(r̄) here: an irreducible dihedral r̄ unramified at 2 has N(r̄)≥5. In this blueprint the lifting comes from R15.5’s finite-free integral realization and cohomological lifting criterion, with R15.2's base change (stated at full level n≥3, weight ≥2), so choose the weight and an auxiliary level satisfying that criterion. Multiplication alone does not produce a characteristic-zero eigenform. Apply the DS lemma to the commuting Hecke action over a dominating DVR, then the true-eigenform/old-newform reduction. Record K_f, λ|2, common residue-field embeddings and a stable lattice realizing r̄ semisimply. The character of the witness lifts det r̄ but need not be its Teichmüller lift. This application imports Hasse, DS and the witness definition unchanged.

**Hypotheses.**

- Input: either the reduction modulo λ|2 of an odd characteristic-zero weight-one dihedral newform realising r̄, or the Katz eigenform of unramified-katz in S₁(Γ₁(N),det r̄,F̄₂)_Katz.
- Characteristic two: the Hasse invariant A has weight p−1=1 and q-expansion 1, and Hecke eigenvalues at odd ℓ are unchanged by multiplication by A (ℓ^{k−1}≡1 mod 2).
- Characteristic-zero lifting of the shifted form uses R15.5's finite-free integral realization and cusp-sheaf H¹ criterion, with R15.2's base change, currently stated at full level n≥3 and weight ≥2. The weight and an auxiliary level must be chosen to satisfy it.
- Output: an R15.6 witness of some weight k≥2 with its actual level and a character lifting det r̄ (not necessarily its Teichmüller lift); minimal weight and level are not claimed.

**Proof outline.**

1. Use the Hasse invariant (R15.3) and the weight-shift lemma (R15.5) for the weight and integral-lifting conditions. k≥2 alone is not the geometric criterion: R15.2's base change is stated at full level n≥3, so pass to an auxiliary full level if needed and record the resulting level.
2. Use DS to lift the residual eigencharacter after finite coefficient extension, without claiming a prescribed eigenvector lift.
3. Use the existing true-eigenform reduction and R01.5 to recognize r̄ from good-prime characteristic polynomials; keep the actual level divisor and all places/embeddings.

**Acceptance.**

- At p=2 multiplying weight one by H raises weight by one and preserves q-expansion, but does not alone prove characteristic-zero lifting.
- Reduction is compared at the chosen λ; weight one and a generic weight≥2 witness are distinct outputs.

**Prerequisites.** [`R17.6/qualitative-residual-modularity`](#R17-6-qualitative-residual-modularity), [`R17.6/unramified-katz`](#R17-6-unramified-katz), `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`, `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`, `ArithmeticGaloisRepresentations:R01.5`, `AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`, `AlgebraicModularFormsAndSerreWeights:R15.6/modularity-formulations-and-determinant`, `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform`.

**Sources.**

- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Introduction, printed p. 124 (PDF p. 2). Excerpt: “Hence multiplying by the Hasse invariant, if necessary, it follows from Theorem 1 that every odd dihedral representation as above also comes from a classical modular form of level Nρ and Serre’s weight kρ .”. Match: Supports the Hasse-invariant transition from a Katz weight-one form to a classical form of weight ≥2. The source states it at level N_ρ with Serre's weight (2 for r̄ unramified at 2); the node only asks for some weight ≥2 and records the level obtained.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), Introduction, printed p. 124 (PDF p. 2). Excerpt: “Let us recall that in weight at least 2 every Katz modular form on Γ1 is classical, i.e. a reduction from a characteristic zero form of the same level and weight.”. Match: Lifting input, stated in the source without a level hypothesis. It holds for Γ₁(N) with N≥5 (author's thesis, Ch. I, footnote 3), which covers N(r̄)≥5 here. In this blueprint it is supplied by R15.2/R15.5's criterion, not taken from this sentence.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), proof of Lemma 11, printed p. 132 (PDF p. 10). Excerpt: “By multiplying with the Hasse invariant, if necessary, we can assume that the weight is at least 2. Hence the form f can be lifted to characteristic zero (see e.g. [D-I], Theorem 12.3.2) in the same level.”. Match: The same Hasse-then-lift pattern for a Katz eigenform, used by the source in another proof; it is a proof step, not a stated theorem.

<a id="R17-6-disjoint-irreducibility"></a>

### `R17.6/disjoint-irreducibility` — Residual irreducibility under disjoint base change

*Theorem* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility` · declaration `TauCeti.GL2Transfer.disjoint_irreducibility` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let F be a number field and r̄:G_F→GL₂(k̄) be continuous and absolutely irreducible with finite projective image, k̄ algebraically closed. Let M/F be the finite Galois extension fixed by the projective kernel. For any finite E/F linearly disjoint from M over F, the projective image of r̄|_{G_E} equals that of r̄, and the restriction is absolutely irreducible. Since M is contained in the field L fixed by ker r̄, linear disjointness from L (a stronger hypothesis) also suffices. Solvability of E/F by itself does not preserve irreducibility. This is the exact finite-image application exported to Moret–Bailly/potential modularity; the construction of E with prescribed local conditions and disjointness belongs to R23.1.

**Hypotheses.**

- F is a number field and r̄:G_F→GL₂(k̄) is continuous and absolutely irreducible, with k̄ algebraically closed of any characteristic and finite projective image.
- M/F is the finite Galois extension cut out by the kernel of the projective representation; L⊇M is the field cut out by ker r̄.
- E/F is a finite extension, not necessarily Galois or solvable, linearly disjoint from M over F (equivalently E∩M=F, since M/F is Galois).
- Extensions E with prescribed local conditions and disjointness are constructed downstream (PotentialModularityAndCompatibleSystems R23.1), not here.

**Proof outline.**

1. Use E∩M=F and Galois restriction to see that G_E surjects to Gal(M/F).
2. A line stabilized by the restricted representation would then be stabilized by every projective image element, hence by r̄ itself.
3. Export the sufficient disjointness condition; do not import the downstream extension-construction theorem into this packet.

**Acceptance.**

- An extension containing the quadratic induction field can make a dihedral representation reducible.
- Disjointness from the projective-kernel field suffices even when the scalar image changes.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`.

**Sources.**

- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, Digital Math Archive text p. 13 (PDF p. 16). Excerpt: “For example, ρ can be irreducible but its restriction to W E will be reducible. If F is global this means that the cuspidal representation π(ρ) becomes Eisensteinian upon lifting, and this complicates the proofs.”. Match: Supporting passage only: shows that a quadratic (solvable) base change alone can destroy irreducibility. The disjointness lemma itself is elementary Galois/group theory proved in the proof steps; no source in the packet states it.
- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), §2, printed p. 125 (PDF p. 3). Excerpt: “Let ρ be a dihedral representation. Then ρ is induced from a character χ : GK → k ∗ for a quadratic number field K”. Match: Supporting passage for the acceptance example only: a dihedral r̄ restricted to G_K is the sum of χ and χ^σ, so E⊇K makes it reducible.

<a id="R17-6-quadratic-restriction"></a>

### `R17.6/quadratic-restriction` — The bad-dihedral quadratic restriction condition

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction` · declaration `TauCeti.GL2Transfer.quadratic_restriction` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

For a finite-image irreducible rank-two r=Ind_{G_K}^{G_F}θ, with K/F quadratic and coefficients in an algebraically closed field of any characteristic, and a finite E/F: r|_{G_E} is irreducible exactly when G_E is not contained in G_K and θ|_{G_{EK}}≠θ^σ|_{G_{EK}}. If E contains K, the restriction is reducible: it is the sum of the two restricted characters. When K⊄E, the restriction is Ind_{G_{EK}}^{G_E}(θ|_{G_{EK}}), since G_EG_K=G_F, and conjugation by any element of G_E∖G_{EK} acts on θ|_{G_{EK}} as σ does. The index-two irreducibility criterion holds in every characteristic. Restricted to G_{EK} the representation is the sum of the two distinct characters θ and θ^σ, which an element of G_E∖G_{EK} swaps. If they coincide, θ extends to G_E and Frobenius reciprocity gives a one-dimensional quotient. Quadratic or solvable base changes must be checked against this criterion; the same loss of cuspidality occurs in quadratic automorphic induction/base change. Generic induction and Clifford theory remain with InductionRestriction/R01.4; the Layer 4 Mackey criterion there assumes the group order invertible, so it is not used in characteristic two.

**Hypotheses.**

- K/F is quadratic, σ∈G_F∖G_K, and θ:G_K→k̄^× is a continuous character with finite image and θ≠θ^σ, so r=Ind_{G_K}^{G_F}θ is irreducible.
- k̄ is algebraically closed of any characteristic, including F̄₂ for residual representations.
- E/F is a finite extension (not necessarily Galois); EK denotes the compositum; G_E⊄G_K exactly when K⊄E.
- In characteristic zero, or when the image order is invertible in k̄, the criterion is the Tau Ceti Layer 4 Mackey criterion. In residual characteristic two (image of even order) it is proved directly, because Layer 4 assumes |G| invertible.

**Proof outline.**

1. Apply the representation-level Mackey decomposition (InductionRestriction Layer 3, valid over any commutative ring) to G_E and the normal index-two subgroup G_K. One double coset gives Ind_{G_{EK}}^{G_E}θ when K⊄E; two give θ⊕θ^σ restricted to G_E when K⊆E.
2. Prove the index-two criterion directly. In characteristic zero it also follows from the Layer 4 normal-subgroup corollary; in characteristic two use the eigenline-swapping argument and, for the converse, the extension of a σ-invariant character.
3. Compare the criterion with quadraticInduction_baseChange and the cyclic self-twist cuspidality node; pass the actual criterion to compatible-system and potential-modularity applications, not a blanket solvable-extension assertion.

**Acceptance.**

- Restriction to K of an irreducible quadratic induction is reducible.
- Even E not containing K can identify the two restricted characters; exclude that case explicitly.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.4`, [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), [`R17.4/cuspidality`](#R17-4-cuspidality), `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`, `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Sources.**

- **wiese04** (Gabor Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf)), §2, printed p. 125 (PDF p. 3). Excerpt: “Then ρ is induced from a character χ : GK → k ∗ for a quadratic number field K such that χ 6= χσ , with χσ (g) = χ(σ −1 gσ) for all g ∈ GK , where σ is a lift to GQ of the non-trivial element of GK|Q .”. Match: Supporting passage: the dihedral form Ind χ with χ≠χ^σ ('6=' is the text layer's ≠), over an algebraically closed k of any characteristic. The restriction criterion itself is not stated in the source.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2, Digital Math Archive text p. 13 (PDF p. 16). Excerpt: “For example, ρ can be irreducible but its restriction to W E will be reducible. If F is global this means that the cuspidal representation π(ρ) becomes Eisensteinian upon lifting, and this complicates the proofs.”. Match: Supports the E⊇K case and the matching loss of cuspidality under quadratic base change; the general criterion is the Mackey argument in the proof steps.

<a id="R17-6-compatible-base-change"></a>

### `R17.6/compatible-base-change` — Base change of a supplied compatible system

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change` · declaration `TauCeti.GL2Transfer.compatible_base_change` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let {ρ_λ} be a compatible family over F with a common coefficient field and good-place characteristic polynomials P_v, and π a GL₂ automorphic representation matching those polynomials in the fixed arithmetic normalization. For a finite solvable Galois E/F, restriction to G_E matches BC_{E/F}(π) at every good w|v (π_v and ρ_λ unramified at v, v prime to the residue characteristic of λ) by the Frobenius power formula: if P_v has roots α,β, the new polynomial has roots α^{f(w/v)},β^{f(w/v)}. On the automorphic side this is the unramified local lifting π(µ,ν)↦π(µ∘N,ν∘N) at each prime-cyclic step; on the Galois side it is Frob_w↦Frob_v^{f(w/v)}. Keep the residual cuspidality/irreducibility conditions from cyclic-base-change and disjoint-irreducibility; apply quadratic-restriction for dihedral exceptions. This theorem takes the compatible system as data. Existence of an attached family, its integral lattices and the geometric realization belong to R19/R24 and are not proved here.

**Hypotheses.**

- {ρ_λ} is a supplied family of continuous semisimple representations G_F→GL₂(M̄_λ) over a common coefficient field M, with good-place characteristic polynomials P_v in M[X] independent of λ.
- π is an automorphic GL₂ representation over F whose unramified Satake data at good v match P_v in the fixed arithmetic normalisation (arithmetic Frobenius, R16.2/R16.3 scaling); twists by powers of q_v^{1/2} are compatible with f-th powers since q_w=q_v^{f}.
- E/F is finite solvable Galois, and BC_{E/F} is defined along a prime-cyclic tower (R17.4/solvable-base-change), independently of the tower.
- Good w|v means π_v and ρ_λ are unramified at v and v does not divide the residue characteristic of λ; v may ramify in E.
- Existence of the family, lattices and geometric realisation is not part of the node.

**Proof outline.**

1. Use arithmetic Frobenius restriction Frob_w→Frob_v^{f(w/v)} and the local cyclic/tower transfer formulas.
2. Compare full characteristic polynomials for every coefficient place, preserving the common coefficient field and normalization.
3. Apply the disjointness or bad-dihedral criterion before passing a cuspidal/irreducible claim downstream.

**Acceptance.**

- For α=2,β=3,f=2 the new trace is 13 and determinant is 36, not the square of trace 5.
- At residue degree one the good polynomial is unchanged.

**Prerequisites.** [`R17.4/solvable-base-change`](#R17-4-solvable-base-change), [`R17.4/local-compatibility`](#R17-4-local-compatibility), [`R17.6/disjoint-irreducibility`](#R17-6-disjoint-irreducibility), [`R17.6/quadratic-restriction`](#R17-6-quadratic-restriction), `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`.

**Sources.**

- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2 local lifting, condition (i), Digital Math Archive text p. 9 (PDF p. 12). Excerpt: “(i) Π is π(µ0 , ν 0 ), π is π(µ, ν), and µ0 (x) = µ(NE/F x), ν 0 (x) = ν(NE/F x) for x ∈ E × .”. Match: Gives the unramified case: for unramified µ,ν, µ∘N_{E_w/F_v}(ϖ_w)=µ(ϖ_v)^{f(w/v)}, so Satake roots are raised to the f-th power ('µ0' is the text layer's µ′). Prime-degree cyclic steps; solvable towers come from R17.4.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §2 after properties (A)–(F), Digital Math Archive text p. 14 (PDF p. 17). Excerpt: “It is worthwhile to remark, and easy to verify, that the first five of these properties have analogues for two-dimensional representations of the Weil group WF of F if lifting is replaced by restriction to WE . The central character is replaced by the determinant.”. Match: Supporting passage: base change corresponds to restriction on the Galois/Weil side, with central character ↔ determinant. Langlands' compatibility statement (G), text p. 16, concerns Artin-type Weil-group representations; the ℓ-adic family comparison at good places is the node's application.
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 §1 before Definition 1.1, eq. (1.1), printed p. 199 (PDF p. 215). Excerpt: “In terms of Hecke eigenvalues (cf. e.g. §6.3) the correspondence is described as follows: if f, is the residual degree of E above an unramified v, then for any wlv:”. Match: OCR text ('f,'=f_v, 'wlv'=w|v; the hyphenated 'de-scribed' joined). The display that follows, (t_{π,v})^{f_v}=t_{Π,w}, is the Frobenius power formula used, for GL(n) and cyclic E/F.

<a id="R17-6-compatible-descent"></a>

### `R17.6/compatible-descent` — Automorphic descent with a consistent compatible-system twist

*Comparison* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent` · declaration `TauCeti.GL2Transfer.compatible_descent` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let E/F be cyclic of prime degree ℓ, η a character of F^×N(A_E^×)\A_F^× of order ℓ, and Π cuspidal over E with Π^σ≅Π. By AC89 Theorem 4.2(d) (Langlands Lemma 11.6(b) for GL₂), the cuspidal descents of Π are exactly π⊗η^i, 0≤i<ℓ, pairwise non-isomorphic, for one chosen descent π. Let {r_λ} be supplied semisimple representations of G_F over a common coefficient field whose restrictions to G_E match the family attached to Π. A matching descent is a single index i, independent of λ, such that the good-place characteristic polynomials of π⊗η^i agree with those of every r_λ. Under that equality, R01.5 identifies each r_λ with the corresponding member attached to π⊗η^i, and i is unique. Suppose each r_λ|_{G_E} is absolutely irreducible and a family {ρ_{π,λ}} attached to π is supplied. Then for each λ, r_λ≅ρ_{π,λ}⊗η^{i(λ)} for some i(λ) (Schur's lemma on the cyclic step). If {r_λ} is compatible, a match at one λ forces the same i at every λ, because both families have λ-independent polynomials. Galois descents chosen independently at different λ, without this common index, do not give one automorphic descent matching the family. In a solvable tower impose this condition at each prime-cyclic step, with its actual descent fiber and local data.

**Hypotheses.**

- E/F is cyclic of prime degree ℓ with generator σ, and η is a character of A_F^×/F^×N(A_E^×) of order ℓ, identified with a character of Gal(E/F) by class field theory.
- Π is a cuspidal automorphic GL₂ representation over E with Π^σ≅Π.
- {r_λ} are continuous semisimple representations G_F→GL₂(M̄_λ) over a common coefficient field M, and r_λ|_{G_E} matches the family attached to Π at good places.
- For the Galois-side twist statement, r_λ|_{G_E} is absolutely irreducible and a family {ρ_{π,λ}} attached to a descent π is supplied as data (its existence belongs to R19/R24).
- Good places exclude ramification of π, of η, of r_λ and the residue characteristic of λ.

**Proof outline.**

1. Use cyclic-descent (AC89 Thm 4.2(d)/Langlands Lemma 11.6(b)) to obtain π, and cyclic-descent-fibers (AC89 Thm 3.1) to enumerate its ambiguity π⊗η^i.
2. Use the common polynomial data to choose and check one index across the entire family; neither arbitrary character choices nor determinant alone at degree two suffice. With r_λ|_{G_E} absolutely irreducible, Hom_{G_E}(ρ_{π,λ},r_λ) is a line on which G_F acts through Gal(E/F), which gives the twist.
3. Apply full-polynomial recognition (R01.5) to identify each member, and iterate only after the stepwise matching condition is met.

**Acceptance.**

- A quadratic determinant does not distinguish π from π⊗η.
- Two different choices at two coefficient places do not constitute a compatible descent over a common coefficient field.

**Prerequisites.** [`R17.4/cyclic-descent`](#R17-4-cyclic-descent), [`R17.4/cyclic-descent-fibers`](#R17-4-cyclic-descent-fibers), [`R17.4/solvable-descent`](#R17-4-solvable-descent), `ArithmeticGaloisRepresentations:R01.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 Theorem 4.2(d), printed p. 202 (PDF p. 218). Excerpt: “(d) Assume I is cuspidal, II I o a. Then there is ir cuspidal lifting to H; all such ir are conjugate by tensor product by a power ofrl; they satisfy”. Match: OCR text, read on the page image as: '(d) Assume Π is cuspidal, Π≅Π∘σ. Then there is π cuspidal lifting to Π; all such π are conjugate by tensor product by a power of η; they satisfy π≇π⊗η.' Exact source for the descent and its fibre (GL(n), cyclic of prime degree).
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 Theorem 3.1, printed p. 201 (PDF p. 217). Excerpt: “Then r' = r0 X, for some character X of F*N(A*)\A*.”. Match: OCR of 'Then π′=π⊗χ, for some character χ of F^×N(A_E^×)\A^×', the conclusion of the fibre theorem for cuspidal π,π′ with (t_{π,v})^{f_v}=(t_{π′,v})^{f_v} almost everywhere.
- **langlands80** (Robert P. Langlands, [*Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf)), §11 Lemma 11.6(b), Digital Math Archive text p. 151 (PDF p. 154). Excerpt: “(b) Suppose E is cyclic of prime degree ` and Π is a cuspidal automorphic representation of G(AE ) with Πσ ≃ Π. Then Π is the lifting of ` cuspidal automorphic representations π .”. Match: GL₂ form of the same descent: exactly ℓ descents ('`' is the text layer's ℓ); property (C) on text p. 14 identifies them as π⊗ω.
- **bcgp21** (George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf)), proof of Lemma 8.3.2, printed p. 452 (PDF p. 300). Excerpt: “differs from ρ by a twist by a character of Gal(”. Match: Consumer pattern (GSp₄/GL₄): after automorphic descent by AC89 Thm 4.2, the attached Galois representation is twisted by a character of the cyclic step to match ρ, using irreducibility of the restriction. The node is the GL₂ family version.

<a id="R17-6-potential-modularity-interface"></a>

### `R17.6/potential-modularity-interface` — Transfer interface for potential modularity

*Application* · node `GL2AutomorphicRepresentationsAndTransfer:R17.6/potential-modularity-interface` · declaration `TauCeti.GL2Transfer.potential_modularity_interface` · proposed module `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`

Let E/F be a finite solvable Galois extension with the prescribed local completions and disjointness hypotheses supplied by potential modularity, ρ a rank-two Galois representation of G_F, and Π a cuspidal automorphic representation over E matching ρ|_{G_E} at almost all places. Export the following conditional interface. Irreducibility survives under the disjointness criterion. Local transfer uses the exact completion-wise restriction (strong lifting at each prime-cyclic step). Descent to F goes through a prime-cyclic tower. At each step, once the cuspidal representation over the upper field matches the restriction of ρ there, its invariance under the cyclic step is automatic: for Π, Π^τ matches (ρ|_{G_E})^τ≅ρ|_{G_E}, so Π^τ≅Π by strong multiplicity one. AC89 Theorem 4.2(d) then gives a cuspidal descent with its ℓ twists. What is not automatic is the stepwise consistent character matching of compatible-descent. It needs absolute irreducibility of the restriction and representations attached to the intermediate descents; without them, Galois descent of ρ does not identify which automorphic twist matches. Extension construction, potential automorphy and compatible-family existence stay with R23/R24.

**Hypotheses.**

- E/F is a finite solvable Galois extension with a chosen prime-cyclic subnormal tower, and the prescribed local completions/splitting and disjointness are supplied by the potential-modularity owner (R23).
- ρ is a continuous rank-two representation of G_F, Π is a cuspidal automorphic GL₂ representation over E matching ρ|_{G_E} at almost all places, and ρ|_{G_E} is absolutely irreducible (for example by disjoint-irreducibility).
- Representations attached to the intermediate descents are supplied as data when the twist is matched (R19/R24); compatible-descent's common-index condition is checked at each step.
- Non-Galois (e.g. non-normal cubic) extensions are outside this interface.

**Proof outline.**

1. Consume the extension/local/disjointness data as hypotheses rather than reconstructing the downstream geometric theorem.
2. Apply prescribed-local-base-change and disjoint-irreducibility; derive invariance of Π under each cyclic step from matching with ρ|_{G_E} and R16.4 strong multiplicity one.
3. Apply compatible-descent step by step, after its common-index condition has been checked with the supplied attached representations.

**Acceptance.**

- A non-Galois cubic extension uses cubicBaseChange, not the solvable-Galois tower interface.
- The interface exports sufficient conditions; Galois descent of ρ gives automorphic invariance and existence of some descent, but not by itself the matching twist.

**Prerequisites.** [`R17.4/prescribed-local-base-change`](#R17-4-prescribed-local-base-change), [`R17.6/disjoint-irreducibility`](#R17-6-disjoint-irreducibility), [`R17.6/compatible-base-change`](#R17-6-compatible-base-change), [`R17.6/compatible-descent`](#R17-6-compatible-descent), `R16.4`.

*Assembly note: the layer citations above, by node.*

- `R16.4` → [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one) (clear). Proof step 2 derives Π^τ≅Π: both are cuspidal over the number field E and match ρ|_{G_E}, hence have equal unordered Satake pairs at all finite places outside a finite set. strong-multiplicity-one states exactly this for cuspidal representations over a number field, including the requirement that the full Satake pair (trace and determinant), not one eigenvalue, is compared.

**Sources.**

- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 Theorem 4.2, printed p. 202 (PDF p. 218). Excerpt: “THEOREM 4.2: (WEAK LIFTING). All representations are induced from cuspidal; ElF is cyclic of prime degree 1.”. Match: OCR ('ElF'=E/F, '1'=l). Heading of the cyclic prime-degree base change/descent theorem whose part (d) is the automorphic descent consumed stepwise; the tower, disjointness and potential-modularity data are the node's interface hypotheses.
- **ac89** (James Arthur and Laurent Clozel, [*Simple algebras, base change, and the advanced theory of the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/30.pdf)), Chapter 3 Theorem 5.1, printed p. 212 (PDF p. 228). Excerpt: “THEOREM 5.1: (STRONG LIFTING). Assume ir, II are representations induced from cuspidal of G(A), G(AE) respectively. If I is a weak lifting of r, then II is in fact a strong lifting of r.”. Match: OCR ('ir'=π, 'II'/'I'=Π, 'r'=π). Supplies the all-place local compatibility used for completion-wise restriction at each prime-cyclic step.
- **bcgp21** (George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf)), proof of Lemma 8.3.2, printed p. 452 (PDF p. 300). Excerpt: “in which case it follows from [AC89, Thm. 4.2 of §3] that there is an automorphic representation”. Match: Consumer statement showing how potential-modularity arguments use AC89 stepwise along a solvable tower (GSp₄/GL₄ there; GL₂ here).

# Records

The records below are generated from the two packets: requests, gaps, mistakes in the sources, coverage, structural proposals, layer links and exports, the pinned declarations, the source ledger and the records of the parts.

## Requests to other roadmaps

Each request names the supplier layer, the exact statement needed and the nodes that consume it. They are grouped by supplier roadmap; within a roadmap, part R16.1’s requests come first. A request is answered when the supplier’s packet has a node stating what is asked; the consuming node then cites that node instead of the layer.

### AdelicAlgebraicGroups

- **`AdelicAlgebraicGroups:AA.2`** (part R16.1, request 3). Import quotient measures for Z(Fv)\G(Fv), central-character L² and compatible torus quotient measures; AL.0 alone owns Schwartz–Bruhat/Fourier theory. *Needed by:* [`R17.2/steinberg-projector-difference`](#R17-2-steinberg-projector-difference), [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger).

### AlgebraicModularFormsAndSerreWeights

- **`AlgebraicModularFormsAndSerreWeights:R15.2`** (part R17.3, request 9). Wiese Proposition 7/Corollary 8 (descent of a Katz form from Γ₁(Nm) to Γ₁(N), for coprime N, m and a ring containing 1/(Nm) and the (Nm)-th roots of unity, iff it is independent of the m-level structure; same q-expansion) and Wiese Proposition 4/Corollary 5 (U_ℓ at auxiliary primes, degeneracy maps, stabilization with the companion matrices and repeated-root cases). T_ℓ for ℓ prime to the level is the existing node R15.2/integral-hecke-operators-from-q-expansions. Optionally, base change for Γ₁(N) cusp forms with N ≥ 5 and k ≥ 2, so that weight-two-witness can stay at level Γ₁(N). *Needed by:* [`R17.6/unramified-katz`](#R17-6-unramified-katz).

### ArithmeticGaloisRepresentations

- **`ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`** (part R16.1, request 2). Use the existing compact-subgroup stable-lattice theorem for the finite CDT type over a finite nonarchimedean coefficient field; choose an invariant O-lattice and preserve coefficient extension, without asserting canonicity. *Needed by:* [`R16.2/cdt-vexing-type`](#R16-2-cdt-vexing-type).
- **`ArithmeticGaloisRepresentations:G7`** (part R17.3, request 10). The canonical adjoint representation and its scalar-quotient/traceless comparison in characteristic zero, restriction, determinant and coefficient-map operations; do not confuse the two carriers in characteristic dividing the rank. The adjoint of a local Weil–Deligne parameter, used by adjointLift_local, is taken on the R01.2/ET.6 Weil–Deligne carrier. *Needed by:* [`R17.4/adjoint-lift`](#R17-4-adjoint-lift).
- **`ArithmeticGaloisRepresentations:R01.1`** (part R17.3, request 11). Continuous finite-coefficient and finite-image characteristic-zero rank-two representations, coefficient extensions, stable lattices, semisimplified reduction, restriction and character twisting on the canonical carrier. *Needed by:* [`R17.5/finite-projective-lift`](#R17-5-finite-projective-lift), [`R17.5/octahedral-mod-three-application`](#R17-5-octahedral-mod-three-application), [`R17.5/odd-residual-lift`](#R17-5-odd-residual-lift), [`R17.5/q-weight-one`](#R17-5-q-weight-one), [`R17.5/residual-lt-application`](#R17-5-residual-lt-application), [`R17.5/tr-weight-one`](#R17-5-tr-weight-one), [`R17.6/compatible-base-change`](#R17-6-compatible-base-change), [`R17.6/determinant-untwist`](#R17-6-determinant-untwist), [`R17.6/disjoint-irreducibility`](#R17-6-disjoint-irreducibility), [`R17.6/solvable-dihedral`](#R17-6-solvable-dihedral), [`R17.6/wiese-odd-lift`](#R17-6-wiese-odd-lift).
- **`ArithmeticGaloisRepresentations:R01.3`** (part R17.3, request 12). Artin conductors, their induction formula, invariance dimensions, prime-to-p conductor of reduction and ramification under twists. *Needed by:* [`R17.5/q-weight-one`](#R17-5-q-weight-one), [`R17.6/determinant-untwist`](#R17-6-determinant-untwist), [`R17.6/rt-technical-lemma`](#R17-6-rt-technical-lemma), [`R17.6/serre-odd-trick`](#R17-6-serre-odd-trick), [`R17.6/teichmuller-conductor`](#R17-6-teichmuller-conductor), [`R17.6/wiese-odd-lift`](#R17-6-wiese-odd-lift).
- **`ArithmeticGaloisRepresentations:R01.4`** (part R17.3, request 13). Finite GL₂/PGL₂ classification over algebraically closed fields, solvable images and irreducibility, characteristic-two odd-order dihedral case, and bad-dihedral restriction criterion; apply it to finite Galois images here. *Needed by:* [`R17.5/dihedral-artin`](#R17-5-dihedral-artin), [`R17.5/octahedral-artin`](#R17-5-octahedral-artin), [`R17.5/octahedral-mod-three-application`](#R17-5-octahedral-mod-three-application), [`R17.5/odd-residual-lift`](#R17-5-odd-residual-lift), [`R17.5/solvable-artin`](#R17-5-solvable-artin), [`R17.5/tetrahedral-artin`](#R17-5-tetrahedral-artin), [`R17.5/tunnell-primitive-globalization`](#R17-5-tunnell-primitive-globalization), [`R17.6/determinant-untwist`](#R17-6-determinant-untwist), [`R17.6/disjoint-irreducibility`](#R17-6-disjoint-irreducibility), [`R17.6/quadratic-restriction`](#R17-6-quadratic-restriction), [`R17.6/solvable-dihedral`](#R17-6-solvable-dihedral), [`R17.6/teichmuller-conductor`](#R17-6-teichmuller-conductor), [`R17.6/wiese-odd-lift`](#R17-6-wiese-odd-lift).
- **`ArithmeticGaloisRepresentations:R01.5`** (part R17.3, request 14). Recognition of semisimple representations by full Frobenius characteristic polynomials, coefficient descent and Brauer–Nesbitt; trace alone is insufficient in characteristic two. *Needed by:* [`R17.5/octahedral-mod-three-application`](#R17-5-octahedral-mod-three-application), [`R17.5/q-weight-one`](#R17-5-q-weight-one), [`R17.5/residual-lt-application`](#R17-5-residual-lt-application), [`R17.6/compatible-base-change`](#R17-6-compatible-base-change), [`R17.6/compatible-descent`](#R17-6-compatible-descent), [`R17.6/rt-technical-lemma`](#R17-6-rt-technical-lemma), [`R17.6/unramified-katz`](#R17-6-unramified-katz), [`R17.6/weight-two-witness`](#R17-6-weight-two-witness).

### AutomorphicFormsOnReductiveGroups

- **`AutomorphicFormsOnReductiveGroups:AF.1`** (part R16.1, request 10). Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6. *Needed by:* [`R16.2/archimedean-classification`](#R16-2-archimedean-classification), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse), [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison), [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison), [`R16.1/local-adelic-compact-comparison`](#R16-1-local-adelic-compact-comparison), [`R16.1/iwasawa-cartan`](#R16-1-iwasawa-cartan).
- **`AutomorphicFormsOnReductiveGroups:AF.2`** (part R16.1, request 11). The existing smooth automorphic/cuspidal isomorphism classes, determinant-twist action and Hecke-character classes, so non-CM is a subset of this carrier. Supply classical/adelic finite-level comparison and growth conditions; do not create another representation structure. *Needed by:* [`R16.4/non-cm-self-twists`](#R16-4-non-cm-self-twists), [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse).
- **`AutomorphicFormsOnReductiveGroups:AF.4`** (part R16.1, request 12). The relative-Lie-algebra-cohomological criterion for Sym^{kτ−2}⊗det^{mτ} at real GL₂, with explicit coefficient-dual and central-character convention, and compatibility under coefficient extension. Use existing rationality-field/clozel-rationality nodes for the general number-field model. *Needed by:* [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights).

### AutomorphicLFunctionsAndLocalFactors

- **`AutomorphicLFunctionsAndLocalFactors:AL.1`** (part R16.1, request 13). Character L/epsilon factors over nonarchimedean and archimedean fields, ψ/measure change, ν-shifts and the discriminant convention in global products. Fix Γℝ,Γℂ, |z|ℂ and geometric Artin conventions explicitly. *Needed by:* [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R16.5/whittaker-integral-comparison`](#R16-5-whittaker-integral-comparison), [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse), [`R16.5/global-epsilon-normalization`](#R16-5-global-epsilon-normalization), [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison).
- **`AutomorphicLFunctionsAndLocalFactors:AL.2`** (part R16.1, request 14). The sole local standard-factor and Whittaker zeta-integral carrier, compatibility with LLC, local fractional ideal/test-vector theorem, epsilon shifts/conductor exponents, and archimedean gamma conventions. A normalized newvector realizes the untwisted standard L-factor; arbitrary ramified twists require their own test-vector statement. *Needed by:* [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.2/supercuspidal-kirillov`](#R16-2-supercuspidal-kirillov), [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R16.5/whittaker-integral-comparison`](#R16-5-whittaker-integral-comparison), [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse).
- **`AutomorphicLFunctionsAndLocalFactors:AL.3`** (part R16.1, request 15). General GLn global Fourier–Whittaker expansion (including convergence/injectivity) BEFORE multiplicity applications; GL₂×GL₁ integral comparison, full Hecke-character twisted functional equations and Mellin-inversion estimates; Rankin–Selberg pole criterion for π×π̃, nonvanishing and absence of poles at s=1 for omitted finite and archimedean Rankin–Selberg factors for cofinite strong multiplicity one. No second GL₂ carrier is created. *Needed by:* [`R16.4/global-whittaker-expansion`](#R16-4-global-whittaker-expansion), [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one), [`R16.4/non-cm-self-twists`](#R16-4-non-cm-self-twists), [`R16.5/whittaker-integral-comparison`](#R16-5-whittaker-integral-comparison), [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse), [`R16.5/global-epsilon-normalization`](#R16-5-global-epsilon-normalization).
- **`AutomorphicLFunctionsAndLocalFactors:AL.3`** (part R17.3, request 15). GL₃ and GL₂×GL₃ Rankin–Selberg local and global factors, all-place functional equations, vertical-strip bounds, the Jacquet–Shalika pole criterion and nonvanishing on Re s=1 for GL₃. The GL_n converse theorem is the proposed AL.3b and is recorded as a gap. *Needed by:* [`R17.4/adjoint-lift`](#R17-4-adjoint-lift), [`R17.4/cubic-character-induction`](#R17-4-cubic-character-induction), [`R17.4/gl3-recognition`](#R17-4-gl3-recognition), [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change).

### AutomorphicSpectralTheory

- **`AutomorphicSpectralTheory:AS.4`** (part R16.1, request 16). Cuspidal Hilbert decomposition with finite multiplicity, algebraic smooth restricted-tensor realization and its relation to the completion. Supply GL₂ discrete residual determinant-character identification from the generic spectral carrier; multiplicity one is not presupposed. *Needed by:* [`R16.4/cuspidal-tensor-factorization`](#R16-4-cuspidal-tensor-factorization), [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one), [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger).
- **`AutomorphicSpectralTheory:AS.2`** (part R16.1, request 17). Import normalized global/local intertwining operators, their factorization, meromorphic continuation and residues from AS.2; AS.6 supplies their operator-valued derivative distributions in the trace formula. Use the same ψ/Haar and normalization. AS.5 weighted cohomology supplies none of this. *Needed by:* [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger).
- **`AutomorphicSpectralTheory:AS.6`** (part R16.1, request 18). The invariant trace formula on compact-mod-center test functions, all identity/elliptic/unipotent terms, residual characters, continuous intertwining-derivative distributions and their measure normalization. Its specialization must expose every term needed by the concrete quaternionic/cyclic ledger. *Needed by:* [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger), [`R17.2/strong-cuspidal-vanishing`](#R17-2-strong-cuspidal-vanishing), [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison).
- **`AutomorphicSpectralTheory:AS.6`** (part R17.3, request 16). The invariant trace formula for GL₂ and D× over a totally real field with test functions whose component at one finite place is a pseudo-coefficient of a supercuspidal representation, with its convergence and summation conditions, as the input to Clozel's limit-multiplicity globalization; that globalization itself is a recorded gap. *Needed by:* [`R17.3/supercuspidal-globalization`](#R17-3-supercuspidal-globalization).

### EndoscopicTransferAndUnitaryTraceComparison

- **`EndoscopicTransferAndUnitaryTraceComparison:ET.1`** (part R16.1, request 19). The transfer-factor and norm conventions, regular centralizer identifications and measure factors for GL₂ ordinary, inner-form and cyclic twisted transfer. Provide archimedean input through the proposed AF.1b, not a second LLC classification. *Needed by:* [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching), [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison).
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.3`** (part R16.1, request 20). Local transfer on the existing smooth test-function carriers, quaternionic matching with rank-two sign and common torus measure, cyclic ordinary/twisted orbital-integral transfer, and identity/singular-term compatibility. General transfer existence remains here. *Needed by:* [`R17.2/quaternionic-orbital-matching`](#R17-2-quaternionic-orbital-matching), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching), [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison).
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.4`** (part R16.1, request 21). The unramified spherical fundamental lemma and simple cyclic trace comparison with normalized norm/central-character pullback. Include quadratic exceptional induced and residual terms with their one-half Weyl weights, and the exact continuous/intertwining identities used in the GL₂ specialization. *Needed by:* [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching), [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger), [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison).
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.6`** (part R16.1, request 22). The canonical characteristic-zero GLn local LLC and GLr(D) inner-form/JL carrier, including normalized induction/segments, twisting, determinant, Artin conductor and L/epsilon compatibility. Supply all finite extensions of ℚp including dyadic primitive wild parameters, index-two Weil induction, Henniart typical-type interface and CDT Θ(θ) inertial comparison; no dependence on this GL₂ specialization. *Needed by:* [`R16.2/local-classification`](#R16-2-local-classification), [`R16.2/henniart-unicity`](#R16-2-henniart-unicity), [`R16.2/cdt-vexing-type`](#R16-2-cdt-vexing-type), [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization), [`R16.3/tamely-dihedral`](#R16-3-tamely-dihedral), [`R16.3/tamely-dihedral-supercuspidal`](#R16-3-tamely-dihedral-supercuspidal), [`R16.3/cdt-inertia-multiplicity`](#R16-3-cdt-inertia-multiplicity), [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.1/norm-character-steinberg`](#R17-1-norm-character-steinberg), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison), [`R17.1/wild-dyadic-transfer`](#R17-1-wild-dyadic-transfer), [`R17.2/quaternionic-orbital-matching`](#R17-2-quaternionic-orbital-matching).
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.6`** (part R17.3, request 17). The characteristic-zero local Langlands correspondence for GL₃ (and GL₁) over p-adic fields with L- and ε-factors of pairs, to identify the local components of Ad(π) and of AI_{E/F}(θ) with Ad(rec π_v) and Ind θ_w. *Needed by:* [`R17.4/adjoint-lift`](#R17-4-adjoint-lift), [`R17.4/cubic-character-induction`](#R17-4-cubic-character-induction).

### MetaplecticAutomorphicForms

- **`MetaplecticAutomorphicForms:MP.5`** (part R17.3, request 18). The theta series on Mp(A) attached to a quadratic character and the genuine Eisenstein series on the metaplectic cover of SL₂ over a number field, with constant terms and continuation, used in Shimura's integral (Gelbart–Jacquet 1978 §§5–8, Theorem 8.1) to prove L(s,π,Ad⊗χ) entire. *Needed by:* [`R17.4/adjoint-lift`](#R17-4-adjoint-lift).

### ReductiveGroupsPartII

- **`ReductiveGroupsPartII:RG2.4`** (part R16.1, request 1). Import finite-place Iwasawa/Cartan decompositions with the local integral maximal compact and dominant invariant factors; RG2.0 supplies integral-point topology, while AF.1 supplies real/complex decompositions. *Needed by:* [`R16.1/local-adelic-compact-comparison`](#R16-1-local-adelic-compact-comparison), [`R16.1/iwasawa-cartan`](#R16-1-iwasawa-cartan).
- **`ReductiveGroupsPartII:RG2.0`** (part R16.1, request 30). Import topology and compactness of integral GL₂ points and openness of congruence kernels; use determinant a unit, not merely nonzero. AA.1 then supplies the adelic restricted-product identification. *Needed by:* [`R16.1/local-adelic-compact-comparison`](#R16-1-local-adelic-compact-comparison).

### SmoothRepresentationsOfLocalGroups

- **`SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`** (part R16.1, request 4). The fixed-smooth-central-character abelian category in characteristic zero, exact compact-open invariants and projectivity of supercuspidal blocks. Include the L/ℚp scalar-extension case used by Dospinescu–Le Bras. No unrestricted-category or mod-p projectivity claim. *Needed by:* [`R16.2/supercuspidal-projective`](#R16-2-supercuspidal-projective).
- **`SmoothRepresentationsOfLocalGroups:SR.1`** (part R16.1, request 5). Use the existing C_c^∞ Hecke convolution carrier and its compact-mod-center ω⁻¹-equivariant variant, quotient Haar measure, character-isotypic compact-mod-center idempotents, double-coset operators, scalar extension and integrated representation. Keep 1_I and normalized e_K distinct. *Needed by:* [`R16.1/finite-level-comparison`](#R16-1-finite-level-comparison), [`R16.2/iwahori-oldforms`](#R16-2-iwahori-oldforms), [`R16.2/iwahori-center`](#R16-2-iwahori-center), [`R17.2/steinberg-projector-difference`](#R17-2-steinberg-projector-difference).
- **`SmoothRepresentationsOfLocalGroups:SR.2`** (part R16.1, request 6). Normalized induction with δ_B^{1/2}, its compact and Jacquet models, contragredients, finite-length exceptional principal series and induced-operator kernels. Supply the all-x,y constant-term criterion that makes an induced operator zero. *Needed by:* [`R16.2/local-classification`](#R16-2-local-classification), [`R17.2/strong-cuspidal-vanishing`](#R17-2-strong-cuspidal-vanishing).
- **`SmoothRepresentationsOfLocalGroups:SR.3`** (part R16.1, request 7). Admissibility, contragredient identity π∨≅π⊗ωπ⁻¹det for GL₂, compact-mod-center supercuspidal matrix coefficients, Bernstein inertial equivalence and typical K-types. Include characteristic-zero stable lattices for CDT finite-group types without declaring every integral realization canonical. *Needed by:* [`R16.2/local-classification`](#R16-2-local-classification), [`R16.2/newvector-conductor`](#R16-2-newvector-conductor), [`R16.2/henniart-unicity`](#R16-2-henniart-unicity), [`R16.2/supercuspidal-projective`](#R16-2-supercuspidal-projective), [`R17.2/strong-cuspidal-vanishing`](#R17-2-strong-cuspidal-vanishing), [`R16.2/newvector-level-exists`](#R16-2-newvector-level-exists).
- **`SmoothRepresentationsOfLocalGroups:SR.4`** (part R16.1, request 8). Normalized Satake coordinates and the Bernstein/Iwahori presentation, center≅spherical via e_K, scalar-extension hypotheses and GL₂ generator conventions U₀,U₁,T₀,T₁. The general parahoric-center extension is the proposed SmoothRepresentationsPartIIParahoricCenters owner; use SR.4 until that roadmap is installed. *Needed by:* [`R16.2/spherical-whittaker-values`](#R16-2-spherical-whittaker-values), [`R16.2/iwahori-oldforms`](#R16-2-iwahori-oldforms), [`R16.2/iwahori-center`](#R16-2-iwahori-center), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching).
- **`SmoothRepresentationsOfLocalGroups:SR.5`** (part R16.1, request 9). The single local Whittaker/Kirillov functor, uniqueness, explicit Borel action, genericity, nonzero newvector evaluation for conductor-O ψ, spherical Whittaker values and Weyl operator from the gamma factor. Supply the finite L/ℚp Kirillov scalar extension/Γ descent used by Dospinescu–Le Bras; locally analytic theory remains R30. *Needed by:* [`R16.2/local-classification`](#R16-2-local-classification), [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.2/normalized-newvector`](#R16-2-normalized-newvector), [`R16.2/spherical-whittaker-values`](#R16-2-spherical-whittaker-values), [`R16.2/supercuspidal-kirillov`](#R16-2-supercuspidal-kirillov), [`R16.4/global-whittaker-expansion`](#R16-4-global-whittaker-expansion), [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one), [`R16.2/newvector-level-exists`](#R16-2-newvector-level-exists).

### tauceti:TauCetiRoadmap/Chebotarev

- **`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`** (part R17.3, request 19). Dirichlet-density Chebotarev and the infinitude of every Frobenius class, applied to ray class fields of a quadratic field and to the splitting field of a residual representation, to choose auxiliary primes. *Needed by:* [`R17.6/serre-odd-trick`](#R17-6-serre-odd-trick), [`R17.6/wiese-odd-lift`](#R17-6-wiese-odd-lift).

### tauceti:TauCetiRoadmap/ClassFieldTheory

- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`** (part R16.1, request 25). Import the absolute Artin homomorphism with dense image, finite-quotient reciprocity, arithmetic/geometric Frobenius conversion and character conductors. This is NOT an isomorphism F×→G_Fᵃᵇ; inverse character transport uses Layer9 topological Weil-group reciprocity for F/ℚp finite. *Needed by:* [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/cdt-inertia-multiplicity`](#R16-3-cdt-inertia-multiplicity).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`** (part R16.1, request 29). Import upstream reciprocity/parity of quaternion ramification for the swapped-invariant example; this is not a new global existence proof. *Needed by:* [`R17.1/swapped-quaternion-invariants`](#R17-1-swapped-quaternion-invariants).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`** (part R16.1, request 31). Use localWeilArtinEquiv:F×≃ₜ*W_Fᵃᵇ onto the topological abelianization, with the Layer7 absolute-map compatibility and inversion for geometric Frobenius. This reciprocity export is available here only for finite extensions of ℚp. *Needed by:* [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/cdt-inertia-multiplicity`](#R16-3-cdt-inertia-multiplicity).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`** (part R17.3, request 20). Brauer–Hasse–Noether exact sequence and local invariants for number fields, including the archimedean terms; combined with local reciprocity in Tate’s vanishing proof. *Needed by:* [`R17.5/tate-vanishing`](#R17-5-tate-vanishing).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`** (part R17.3, request 21). Global Artin reciprocity matching finite-order Galois characters with finite-order Hecke characters and local characters. *Needed by:* [`R17.4/cubic-character-induction`](#R17-4-cubic-character-induction), [`R17.4/cyclic-descent`](#R17-4-cyclic-descent), [`R17.4/isobaric-fibers`](#R17-4-isobaric-fibers), [`R17.5/dihedral-artin`](#R17-5-dihedral-artin), [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), [`R17.5/tate-vanishing`](#R17-5-tate-vanishing), [`R17.5/tunnell-primitive-globalization`](#R17-5-tunnell-primitive-globalization), [`R17.6/compatible-descent`](#R17-6-compatible-descent), [`R17.6/determinant-untwist`](#R17-6-determinant-untwist), [`R17.6/serre-odd-trick`](#R17-6-serre-odd-trick), [`R17.6/teichmuller-conductor`](#R17-6-teichmuller-conductor), [`R17.6/wiese-odd-lift`](#R17-6-wiese-odd-lift).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`** (part R17.3, request 22). Hilbert product formula: quaternionic local invariants have even total ramification cardinality; apply this result rather than constructing it again. *Needed by:* [`R17.3/indefinite-parity`](#R17-3-indefinite-parity), [`R17.3/invariant-exchange`](#R17-3-invariant-exchange).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`** (part R17.3, request 23). The local Brauer group, the local invariant and Br(F_v)[p] ≅ H²(G_{F_v}, μ_p), used at each place in the proof of Tate's vanishing theorem. *Needed by:* [`R17.5/tate-vanishing`](#R17-5-tate-vanishing).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`** (part R17.3, request 24). Local reciprocity, used to show that a character of F_v^× is a p-th power exactly when it is trivial on μ_p(F_v), so that the local connecting map onto Br(F_v)[p] is surjective. *Needed by:* [`R17.5/tate-vanishing`](#R17-5-tate-vanishing).

### tauceti:TauCetiRoadmap/GlobalNumberFields

- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`** (part R17.3, request 25). Artin–Whaples weak approximation in the mixed finite/real form, with sign conditions at real places, and openness of the squares in F_v^× at finite places: used to choose a quadratic generator with prescribed local square classes and signs, and the coefficients of a quartic close to a given local quartic. *Needed by:* [`R17.5/prescribed-local-induction`](#R17-5-prescribed-local-induction), [`R17.5/tunnell-primitive-globalization`](#R17-5-tunnell-primitive-globalization).
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`** (part R17.3, request 26). Archimedean components and infinity types of Hecke characters, and Weil's criterion for a Hecke character with prescribed archimedean component (Patrikis Lemma 2.3.1), used to make an extension of an idele-torsion character finite order. *Needed by:* [`R17.5/finite-hecke-extension`](#R17-5-finite-hecke-extension), [`R17.5/prescribed-local-induction`](#R17-5-prescribed-local-induction).
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`** (part R17.3, request 27). Identity component of the idele class group, ray quotient and profinite quotient; use for extending finite-order characters of idele torsion. *Needed by:* [`R17.5/finite-hecke-extension`](#R17-5-finite-hecke-extension), [`R17.5/prescribed-local-induction`](#R17-5-prescribed-local-induction), [`R17.6/serre-odd-trick`](#R17-6-serre-odd-trick), [`R17.6/teichmuller-conductor`](#R17-6-teichmuller-conductor), [`R17.6/wiese-odd-lift`](#R17-6-wiese-odd-lift).
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`** (part R17.3, request 28). Norm pullback of Hecke characters with the placewise local norm and composition in finite towers. *Needed by:* [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), [`R17.4/isobaric-fibers`](#R17-4-isobaric-fibers), [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change), [`R17.4/solvable-base-change`](#R17-4-solvable-base-change).
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`** (part R17.3, request 29). The canonical continuous Hecke-character carrier, conductor, finite-order/ray-class dictionary and the Q Dirichlet-character parity dictionary. *Needed by:* [`R17.4/cubic-character-induction`](#R17-4-cubic-character-induction), [`R17.4/cuspidality`](#R17-4-cuspidality), [`R17.5/finite-hecke-extension`](#R17-5-finite-hecke-extension), [`R17.5/prescribed-local-induction`](#R17-5-prescribed-local-induction), [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), [`R17.5/tunnell-primitive-globalization`](#R17-5-tunnell-primitive-globalization), [`R17.6/determinant-untwist`](#R17-6-determinant-untwist), [`R17.6/serre-odd-trick`](#R17-6-serre-odd-trick), [`R17.6/teichmuller-conductor`](#R17-6-teichmuller-conductor).

### tauceti:TauCetiRoadmap/ModularForms

- **`tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`** (part R16.1, request 26). Import existing primitive newform/newspace and exact conductor theory, including bad-prime Hecke eigenproperties beyond the pinned Newform fields and their classical Euler factors. *Needed by:* [`R16.5/classical-l-function-comparison`](#R16-5-classical-l-function-comparison), [`R16.6/primitive-classical-bijection`](#R16-6-primitive-classical-bijection), [`R16.6/classical-hecke-and-level`](#R16-6-classical-hecke-and-level), [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison).
- **`tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`** (part R16.1, request 27). Import the upstream coefficient-field theorem for primitive normalized forms and its compatibility with algebraic Hecke eigenvalues. *Needed by:* [`R16.4/cohomological-rationality`](#R16-4-cohomological-rationality).
- **`tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`** (part R16.1, request 28). Import the upstream primitive classical finite Euler factors, Mellin completion and functional equation, with exact width, conductor, nebentypus and weight normalization. *Needed by:* [`R16.5/classical-l-function-comparison`](#R16-5-classical-l-function-comparison).
- **`tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`** (part R16.1, request 32). Import Galois stability/conjugate primitive newforms, CharacterField χ≤CoefficientField f, and rationality of the Hecke characteristic polynomials. Layer8 alone gives coefficient-field algebraicity and does not justify Galois conjugation of analytic forms. *Needed by:* [`R16.4/cohomological-rationality`](#R16-4-cohomological-rationality).
- **`tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`** (part R17.3, request 30). Classical newform theory over Q in every weight including one: newform decomposition, bad-prime eigenvalues (Atkin–Lehner–Li), primitive forms and their conductor. *Needed by:* [`R17.5/q-weight-one`](#R17-5-q-weight-one), [`R17.6/rt-technical-lemma`](#R17-6-rt-technical-lemma).
- **`tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`** (part R17.3, request 31). Atkin–Lehner and Fricke operators W_Q for exact divisors Q‖N and their relations with T_n, including the Atkin–Li operators on forms with nontrivial character that Rohrlich–Tunnell use at Q = 2^ν (their §1, Case 2). *Needed by:* [`R17.6/rt-technical-lemma`](#R17-6-rt-technical-lemma).

### tauceti:TauCetiRoadmap/NumberFieldArithmetic

- **`tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`** (part R17.3, request 32). Completions of a number field at finite places as local fields, and the dictionary between the places of F[x]/(f) above v and the irreducible factors of f over F_v (completionFactorsEquivPlaces), with Krasner's lemma from Mathlib: used to realise a given p-adic field K as a completion F_v and the splitting field of an approximating quartic as a completion L_w ≅ K(σ). *Needed by:* [`R17.5/tunnell-primitive-globalization`](#R17-5-tunnell-primitive-globalization).

### tauceti:TauCetiRoadmap/ProfiniteCohomology

- **`tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`** (part R17.3, request 33). Continuous cohomology with discrete trivial Q/Z coefficients, filtered-colimit compatibility, inflation/restriction and connecting homomorphisms; Q/Z has trivial action, not the cyclotomic action. *Needed by:* [`R17.5/tate-vanishing`](#R17-5-tate-vanishing).

### tauceti:TauCetiRoadmap/QuadraticFormInvariants

- **`tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`** (part R16.1, request 23). Import the upstream quaternion algebra/reduced norm, local split/division classification and chosen splitting isomorphisms. This packet only applies these objects. *Needed by:* [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.1/norm-character-steinberg`](#R17-1-norm-character-steinberg), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison).
- **`tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`** (part R16.1, request 24). Import the LOCAL uniqueness of the quaternion division algebra over a nonarchimedean local field and the split/division comparison. This layer supplies no global prescribed-ramification existence theorem; the swapped global example assumes chosen algebras and records that missing realization separately. *Needed by:* [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.1/swapped-quaternion-invariants`](#R17-1-swapped-quaternion-invariants).

### tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction

- **`tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`** (part R17.3, request 34). The Mackey decomposition formula over any commutative coefficient ring, for Res_{G_E} Ind_{G_K}^{G_F} θ with K/F quadratic, including residual characteristic two where the Layer 4 irreducibility criterion (|G| invertible) does not apply. *Needed by:* [`R17.6/quadratic-restriction`](#R17-6-quadratic-restriction).
- **`tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`** (part R17.3, request 35). The existing factor-set and Schur-multiplier interface and character ambiguity of linear lifts; the arithmetic continuous finite-image step is new here. *Needed by:* [`R17.5/finite-projective-lift`](#R17-5-finite-projective-lift), [`R17.5/odd-residual-lift`](#R17-5-odd-residual-lift).

## Requests inside the roadmap

Part R17.3 addresses eight requests to layers R16.1–R17.2, which part R16.1 plans. Each request is printed as the part records it, followed by an *Assembly status* line naming the nodes of part R16.1 that answer it and any clause that no node states.

- **`R16.1`** (part R17.3, request 1). The GL₂ specialisation over number fields of the generic carriers: chosen compact subgroups, Haar and quotient measures, the central-character quotient and finite-level function-space identifications, agreeing with AutomorphicFormsOnReductiveGroups AF.2. Generic automorphic representations and the restricted-tensor (Flath) factorization are imported from AF.2/automorphic-representation and AF.2/flath-factorization. *Needed by:* [`R17.3/global-jl`](#R17-3-global-jl).
  - *Assembly status: answered.* Answered by [`R16.1/local-adelic-compact-comparison`](#R16-1-local-adelic-compact-comparison), [`R16.1/haar-quotient-comparison`](#R16-1-haar-quotient-comparison), [`R16.1/finite-level-comparison`](#R16-1-finite-level-comparison). Compact subgroups at all places (local-adelic-compact-comparison), Haar measures with the central-character quotient and its L² space (haar-quotient-comparison) and the finite-level identification agreeing with AF.2 (finite-level-comparison) are stated for any number field. The Flath factorization is imported from AF.2 as the request says; its GL₂ specialization is R16.4/cuspidal-tensor-factorization. The request is GL₂-only: the D×(𝔸_F) quotient measures and L² space that global-jl also uses are not asked for and are not in part R16.1.
- **`R16.2`** (part R17.3, request 2). Rank-two local classification, newvectors, arithmetic Hecke normalization and the distinction between principal series, twists of Steinberg and supercuspidal representations. *Needed by:* [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/norm-exception`](#R17-3-norm-exception), [`R17.3/split-hecke`](#R17-3-split-hecke), [`R17.5/prescribed-local-induction`](#R17-5-prescribed-local-induction), [`R17.5/q-weight-one`](#R17-5-q-weight-one).
  - *Assembly status: partly answered.* Answered by [`R16.2/local-classification`](#R16-2-local-classification), [`R16.2/archimedean-classification`](#R16-2-archimedean-classification), [`R16.2/newvector-level-exists`](#R16-2-newvector-level-exists), [`R16.2/newvector-conductor`](#R16-2-newvector-conductor), [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.2/normalized-newvector`](#R16-2-normalized-newvector), [`R16.2/spherical-whittaker-values`](#R16-2-spherical-whittaker-values), [`R16.2/iwahori-oldforms`](#R16-2-iwahori-oldforms), [`R16.2/iwahori-center`](#R16-2-iwahori-center). Not stated by any node of part R16.1: (1) Arithmetic Hecke normalization at a finite place of a general number field: no part-R16.1 node states the eigenvalues t_v=q_v^{1/2}(α_v+β_v) and s_v=α_vβ_v of the unnormalized spherical operators T_v=[K_v diag(ϖ_v,1)K_v], S_v=[K_v diag(ϖ_v,ϖ_v)K_v] on the spherical line (the normalization a_v=t_v, b_v=q_v s_v of split-hecke); part R16.1 gives the operators (iwahori-center: U₀,U₁ ↦ T₀,T₁; iwahori-oldforms: Iwahori U polynomial X²−q^{1/2}(α+β)X+qαβ) and the eigenvalue dictionary only for classical newforms over ℚ (R16.4/cohomological-rationality, R16.6/classical-hecke-and-level). (2) The character form of the distinction used by global-jl proof step 3 (characters of irreducible principal and complementary series vanish on the regular elliptic set, so a unitary generic π_v with nonvanishing elliptic character is essentially square-integrable): local-classification lists the four classes without characters or square-integrability. Local classification (including residue characteristic two), the archimedean cases, and the complete newvector theory (existence, conductor, Casselman dimension formula, normalized Whittaker newvector) are stated, as is the principal-series / Steinberg-twist / supercuspidal distinction as a classification. The Hecke normalization is stated only through Iwahori/spherical generators and the ℚ-newform dictionary, and the character-theoretic square-integrability criterion is absent.
- **`R16.3`** (part R17.3, request 3). Arithmetic-normalized rank-two LLC, compatibility of twists, determinants, local factors and Weil–Deligne restriction, including extraordinary dyadic parameters. Also: preservation of L- and ε-factors (fixed ψ, every character twist) by the arithmetic rank-two LLC, and compatibility of the Langlands–Shintani local cyclic base change with restriction of the parameter for octahedral dyadic parameters and every prime degree ℓ. *Needed by:* [`R17.3/local-factors`](#R17-3-local-factors), [`R17.4/adjoint-lift`](#R17-4-adjoint-lift), [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), [`R17.4/local-compatibility`](#R17-4-local-compatibility), [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change), [`R17.4/unramified-base-change`](#R17-4-unramified-base-change), [`R17.5/octahedral-artin`](#R17-5-octahedral-artin), [`R17.5/prescribed-local-induction`](#R17-5-prescribed-local-induction), [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), [`R17.5/solvable-artin`](#R17-5-solvable-artin), [`R17.5/tetrahedral-artin`](#R17-5-tetrahedral-artin), [`R17.5/tunnell-primitive-globalization`](#R17-5-tunnell-primitive-globalization).
  - *Assembly status: partly answered.* Answered by [`R16.3/principal-series-parameter`](#R16-3-principal-series-parameter), [`R16.3/steinberg-monodromy`](#R16-3-steinberg-monodromy), [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R16.3/tate-unitary-normalization`](#R16-3-tate-unitary-normalization), [`R16.3/conductor-epsilon-comparison`](#R16-3-conductor-epsilon-comparison), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching). Not stated by any node of part R16.1: (1) The arithmetic normalization: part R16.1's rec is fixed by Art_F(ϖ)=geometric Frobenius and no node states rec^{arith} or the conversion rec^{arith}(π)=rec(π)∨. (2) Weil–Deligne restriction, i.e. rec(BC(π)_w)=rec(π_v)|W_{E_w}: stated only for unramified Satake parameters ((α,β)↦(α^d,β^d) in R17.2/cyclic-local-matching). (3) Preservation of ε-factors for every character twist with fixed ψ: stated only for supercuspidals (supercuspidal-parameter); principal-series-parameter and steinberg-monodromy state L-factors and conductors, not ε(s,π⊗χ,ψ)=ε(s,rec(π)⊗χ,ψ). (4) Compatibility of the Langlands–Shintani local cyclic base change with restriction of the parameter for octahedral dyadic parameters and every prime ℓ: in no part-R16.1 node. Determinants, twist compatibility, L-factors, conductors, the Tate half-twist and the archimedean factors are stated, and dyadic (including primitive wild) parameters are covered as members of the ET.6 carrier, without a worked primitive example (part R16.1 gap 'Primitive wild dyadic worked example'). The normalization requested differs from part R16.1's geometric one, and the base-change restriction and octahedral Langlands–Shintani clauses are missing; these are what R17.4/local-compatibility, the Artin nodes and q-weight-one rely on.
- **`R16.4`** (part R17.3, request 4). GL₂ multiplicity one and strong multiplicity one over number fields for cuspidal and isobaric (χ₁⊞χ₂) representations, with the exact set of places where equality is required; and the GL₂/Hilbert-cohomological specialisation of AF.4/clozel-rationality (conjugate representations and models over a finite extension of the rationality field). The generic rationality definitions are AF.4/rationality-field. *Needed by:* [`R17.3/coefficient-conjugation`](#R17-3-coefficient-conjugation), [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/multiplicity-one`](#R17-3-multiplicity-one), [`R17.3/norm-exception`](#R17-3-norm-exception), [`R17.3/rational-models`](#R17-3-rational-models), [`R17.3/strong-multiplicity-one`](#R17-3-strong-multiplicity-one), [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), [`R17.4/isobaric-fibers`](#R17-4-isobaric-fibers), [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change), [`R17.4/solvable-base-change`](#R17-4-solvable-base-change), [`R17.4/tower-independence`](#R17-4-tower-independence), [`R17.5/dihedral-artin`](#R17-5-dihedral-artin), [`R17.5/octahedral-artin`](#R17-5-octahedral-artin), [`R17.5/tetrahedral-artin`](#R17-5-tetrahedral-artin), [`R17.6/potential-modularity-interface`](#R17-6-potential-modularity-interface).
  - *Assembly status: partly answered.* Answered by [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one), [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one), [`R16.4/cohomological-rationality`](#R16-4-cohomological-rationality). Not stated by any node of part R16.1: Multiplicity one and strong multiplicity one for isobaric representations χ₁⊞χ₂: no part-R16.1 node states the classification of isobaric sums by their components at almost all places, nor that a cuspidal and an isobaric representation cannot agree at almost all places (Jacquet–Shalika); global-multiplicity-one and strong-multiplicity-one are for cuspidal representations only. Cuspidal multiplicity one and cuspidal strong multiplicity one with the exact place set (all finite places outside one finite set; density one is not substituted) are stated over any number field. The rationality clause is answered by cohomological-rationality (AF.4 rationality field, Clozel's finite-part model over Q(π) itself, Galois conjugation of Hecke operators and algebraic infinitesimal character), which is stronger than a model over a finite extension. The isobaric clause, cited by R17.4/cyclic-base-change, isobaric-fibers, solvable-base-change, nonnormal-cubic-base-change and by octahedral-artin's base-change transitivity, is missing.
- **`R16.5`** (part R17.3, request 5). The GL₂ converse theorem over an arbitrary number field with the full Hecke-character twist family, growth, entireness/pole and functional-equation hypotheses, retaining all-place local factors (the n=2 instance of AL.3b, stated with its own hypotheses), as used by JL70 §12 for quadratic induction and inside the JPSS cubic construction; and the Godement–Jacquet standard factors of GL₂ and their twists with continuation and functional equation, imported from AL.2, for local-factors. *Needed by:* [`R17.3/local-factors`](#R17-3-local-factors), [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change), [`R17.5/octahedral-artin`](#R17-5-octahedral-artin), [`R17.5/quadratic-induction`](#R17-5-quadratic-induction), [`R17.5/solvable-artin`](#R17-5-solvable-artin), [`R17.5/tetrahedral-artin`](#R17-5-tetrahedral-artin).
  - *Assembly status: answered.* Answered by [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse), [`R16.5/whittaker-integral-comparison`](#R16-5-whittaker-integral-comparison), [`R16.5/global-epsilon-normalization`](#R16-5-global-epsilon-normalization). full-gl2-converse is the n=2 converse theorem over any number field with every Hecke quasicharacter twist, growth, entireness and functional-equation hypotheses and all-place local factors, stated on its own hypotheses as the request asks; part R16.1 explicitly refuses restricted twist families, so any S-variant used inside the JPSS cubic construction would need its own statement. whittaker-integral-comparison compares the twisted GL₂×GL₁ integral with AL.2's Godement–Jacquet factors and global-epsilon-normalization gives the completed functional equation (untwisted, applied to each twist π⊗ω), which is what R17.3/local-factors uses; continuation and the local Godement–Jacquet functional equations stay AL.2/AL.3 imports, as the request says.
- **`R16.6`** (part R17.3, request 6). (a) Over Q: π_∞ is the weight-one limit of discrete series (parameter 1⊕sign) exactly for holomorphic weight-one newforms (AF.5/gl2-dictionary gives the adelization for k ≥ 1 but identifies π_∞ only for k ≥ 2); newform level equals the conductor of π and nebentypus equals the central character, compared with Tau Ceti ModularForms Layer 4. (b) The totally real holomorphic parallel-weight-one extension. (c) The Hilbert cohomological weight conventions used by definite-infinity. *Needed by:* [`R17.3/definite-infinity`](#R17-3-definite-infinity), [`R17.5/q-weight-one`](#R17-5-q-weight-one), [`R17.5/solvable-artin`](#R17-5-solvable-artin), [`R17.5/tr-weight-one`](#R17-5-tr-weight-one), [`R17.6/unramified-katz`](#R17-6-unramified-katz).
  - *Assembly status: partly answered.* Answered by [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison), [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison). Not stated by any node of part R16.1: Clause (b), the totally real holomorphic parallel-weight-one extension: no part-R16.1 node (weight-one-classical-comparison is over ℚ only; hilbert-algebraic-weights requires k_τ≥2). In clause (a), the k=1 good-prime Hecke/L-function dictionary and the conversion to the arithmetic-Frobenius convention that q-weight-one and unramified-katz use are stated only for k≥2 (classical-hecke-and-level, classical-l-function-comparison, weight-k-parameter-conversion). Clause (a) is stated by weight-one-classical-comparison: over ℚ, primitive weight-one forms with odd χ correspond to cuspidal classes of exact conductor N, central character ω_χ and infinite component D₁(0) with parameter 1⊕sgn, against ModularForms Layer 4. Clause (c) is hilbert-algebraic-weights (Sym^{k_τ−2}⊗det^{m_τ}, k_τ+2m_τ=w, explicit dual convention) with R17.1/real-quaternionic-comparison (Sym^{k−2} ↔ D_k with the |det| twist), the translation into Pan's dual (k,0) convention staying with definite-infinity. Clause (b), needed by tr-weight-one and by the totally real clause of solvable-artin, is missing.
- **`R17.1`** (part R17.3, request 7). Quaternionic local JL: division places correspond to essentially discrete series; local characters correspond to Steinberg twists; real algebraic weights and split-place identifications use the fixed normalization. Also: local JL preserves L- and ε-factors (fixed ψ) after every character twist, with the sign h_v = −1 of JL70 at division places (a character χ∘Nrd of D_v× has the factors of St⊗χ), and JL_v is Aut(C)-equivariant on algebraic types. *Needed by:* [`R17.3/coefficient-conjugation`](#R17-3-coefficient-conjugation), [`R17.3/definite-infinity`](#R17-3-definite-infinity), [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/invariant-exchange`](#R17-3-invariant-exchange), [`R17.3/local-factors`](#R17-3-local-factors), [`R17.3/norm-exception`](#R17-3-norm-exception).
  - *Assembly status: partly answered.* Answered by [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.1/norm-character-steinberg`](#R17-1-norm-character-steinberg), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison), [`R17.1/wild-dyadic-transfer`](#R17-1-wild-dyadic-transfer). Not stated by any node of part R16.1: (1) The JL70 sign h_v=−1: no part-R16.1 node relates the Godement–Jacquet (zeta-integral) ε-factor of a D_v× representation to the ε-factor of its GL₂ transfer; part R16.1 only says the D_v× side has the factors of the common parameter. (2) Aut(ℂ)-equivariance of JL_v on algebraic types (σ∘JL_v=JL_v∘σ at finite division places and for the real algebraic types): in no part-R16.1 node. Division places ↔ essentially square-integrable representations with Θ_JL(ρ)=−Θ_ρ and χ∘Nrd ↔ χ∘det twist compatibility (local-quaternionic-comparison), characters ↔ Steinberg twists with that parameter's L/ε (norm-character-steinberg), real algebraic weights (real-quaternionic-comparison), split places through the chosen isomorphism with sign +1, and equality of central character, parameter, standard factors and conductor for every square-integrable parameter including dyadic ones (wild-dyadic-transfer) are stated; twisted factors follow from twist compatibility. The h_v sign used by R17.3/local-factors and the Aut(ℂ)-equivariance used by R17.3/coefficient-conjugation are missing.
- **`R17.2`** (part R17.3, request 8). The actual GL₂/quaternion and prime-cyclic trace comparisons with matching test functions, Haar measures, central characters and every continuous/residual cancellation; this is the engine used below. *Needed by:* [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/multiplicity-one`](#R17-3-multiplicity-one), [`R17.4/cyclic-base-change`](#R17-4-cyclic-base-change), [`R17.4/cyclic-descent`](#R17-4-cyclic-descent).
  - *Assembly status: answered.* Answered by [`R17.2/steinberg-projector-difference`](#R17-2-steinberg-projector-difference), [`R17.2/quaternionic-orbital-matching`](#R17-2-quaternionic-orbital-matching), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching), [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger), [`R17.2/strong-cuspidal-vanishing`](#R17-2-strong-cuspidal-vanishing), [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison), [`R16.1/haar-quotient-comparison`](#R16-1-haar-quotient-comparison). Matching test functions with the quaternionic sign and common torus measures (quaternionic-orbital-matching, steinberg-projector-difference), cyclic norm matching with the norm-pullback central character for any cyclic E/F (cyclic-local-matching), the continuous/residual ledger and strong cuspidal vanishing, and the specialized GL₂/quaternion and cyclic comparisons exported to R17.3 and R17.4 (specialized-trace-comparison) are stated, with measures from haar-quotient-comparison. Part R16.1's gap 'Concrete singular and continuous trace-term calculations' records that the identity, unipotent and intertwining terms still have to be computed from AS.6/ET.4, so the cancellation clause is planned but rests on that open gap.

## Gaps

A gap names an input that no library declaration, node or supplier layer provides yet, with the nodes that need it. Nothing that depends on a gap is claimed.

### Gaps recorded by part R16.1

1. **Archimedean owner and complete comparison signatures.** AF.1b is proposed by the verified RT finding but not installed in the current atlas. Current AF.1 nodes provide Wℝ and D_k fragments, not the full classification/factor contract. Obtain the complete real/complex chamber, limit and epsilon signature from that supplier before closing these nodes; the suggested file marks unavailable conditions beside provisional carrier parameters. In particular, prove the real quaternionic comparison through the SU(2)/GL₂(ℝ) character interfaces; current finite-place ET.6 does not provide it. *Needed by:* [`R16.2/archimedean-classification`](#R16-2-archimedean-classification), [`R16.3/archimedean-factor-comparison`](#R16-3-archimedean-factor-comparison), [`R17.1/real-quaternionic-comparison`](#R17-1-real-quaternionic-comparison), [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights), [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison).
2. **Supplier test-function and automorphic carriers in Lean.** The pins lack the supplier smooth/automorphic isomorphism-class, analytic test-function, quotient-measure, LLC and trace-distribution interfaces. Provisional Lean signatures use explicit carrier/operation parameters with the unavailable mathematical hypotheses identified in comments. They are signature checks only, not theorems for arbitrary parameters or functions. Replace them by the actual supplier declarations before implementation. *Needed by:* [`R16.1/finite-level-comparison`](#R16-1-finite-level-comparison), [`R16.4/cuspidal-tensor-factorization`](#R16-4-cuspidal-tensor-factorization), [`R16.4/global-whittaker-expansion`](#R16-4-global-whittaker-expansion), [`R16.4/global-multiplicity-one`](#R16-4-global-multiplicity-one), [`R16.4/strong-multiplicity-one`](#R16-4-strong-multiplicity-one), [`R16.4/cohomological-rationality`](#R16-4-cohomological-rationality), [`R16.4/non-cm-self-twists`](#R16-4-non-cm-self-twists), [`R16.5/whittaker-integral-comparison`](#R16-5-whittaker-integral-comparison), [`R16.5/full-gl2-converse`](#R16-5-full-gl2-converse), [`R16.6/primitive-classical-bijection`](#R16-6-primitive-classical-bijection), [`R16.6/geometry-and-galois-exports`](#R16-6-geometry-and-galois-exports), [`R17.1/local-quaternionic-comparison`](#R17-1-local-quaternionic-comparison), [`R17.2/steinberg-projector-difference`](#R17-2-steinberg-projector-difference), [`R17.2/quaternionic-orbital-matching`](#R17-2-quaternionic-orbital-matching), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching), [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger), [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison), [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison).
3. **Full newvector and ramified factor interface.** Translate Casselman’s top-left ω(a) convention by applying the theorem to π∨≅π⊗ω⁻¹det and twisting back, giving ω(d), hence last-row K₁ invariants. Verify the exact newvector Whittaker evaluation and ramified primitive U_p factor in SR.5/AL.2/upstream Layer 4. The public scan was read; it does not by itself provide the complete modern supplier signature. *Needed by:* [`R16.2/casselman-newvector`](#R16-2-casselman-newvector), [`R16.2/normalized-newvector`](#R16-2-normalized-newvector), [`R16.2/cdt-vexing-type`](#R16-2-cdt-vexing-type), [`R16.3/cdt-inertia-multiplicity`](#R16-3-cdt-inertia-multiplicity), [`R16.6/classical-hecke-and-level`](#R16-6-classical-hecke-and-level), [`R16.6/weight-one-classical-comparison`](#R16-6-weight-one-classical-comparison).
4. **Primitive wild dyadic worked example.** The all-field theorem is imported from ET.6, but no explicit primitive dyadic parameter together with its Swan computation and quaternion matching function was verified in the source passages read. Add a worked primitive example, not a tame quadratic replacement, and compute a(r), L=1 and its matching function in the supplier normalization. *Needed by:* [`R16.3/supercuspidal-parameter`](#R16-3-supercuspidal-parameter), [`R17.1/wild-dyadic-transfer`](#R17-1-wild-dyadic-transfer), [`R17.2/quaternionic-orbital-matching`](#R17-2-quaternionic-orbital-matching).
5. **Geometric versus arithmetic Galois normalization handoff.** The algebraic Satake half-twist and Frobenius inversion are specified. R19.1 must match its nebentypus reciprocity and dual convention to the Galois representation with determinant ε·χ_cyc^{k−1}, and prove ramified WD compatibility with N preserved. This is a downstream interface requirement, not a prerequisite edge from R19 back to R16. *Needed by:* [`R16.6/weight-k-parameter-conversion`](#R16-6-weight-k-parameter-conversion), [`R16.6/geometry-and-galois-exports`](#R16-6-geometry-and-galois-exports).
6. **Concrete singular and continuous trace-term calculations.** JL §16 explicitly supplies a formal sketch; it does not verify all analytic details. Langlands §10 also says its analytical proof is scamped. Read and specialize the complete AS.6/ET.4 identity, unipotent, intertwining-derivative and quadratic exceptional terms with the exact measure convention; compute the norm-character/residual correction and one-half Weyl weights rather than claim generic cancellation. *Needed by:* [`R17.2/continuous-residual-ledger`](#R17-2-continuous-residual-ledger), [`R17.2/specialized-trace-comparison`](#R17-2-specialized-trace-comparison).
7. **Suggested-file supplier conditions and full tensor coefficient types.** The suggested file prototypes the actual algebraic pieces and explicitly lists omitted supplier conditions. The full Weil-induction property, geometric Hilbert tensor representation, primitive cusp subtype, compact-mod-center supports/volumes and orbital integrals cannot be stated at the pins. Replace the parameters by supplier carriers and add their conditions; do not interpret provisional statements as unconditional mathematics. *Needed by:* [`R16.3/tamely-dihedral`](#R16-3-tamely-dihedral), [`R16.6/hilbert-algebraic-weights`](#R16-6-hilbert-algebraic-weights), [`R16.6/primitive-classical-bijection`](#R16-6-primitive-classical-bijection), [`R17.2/steinberg-projector-difference`](#R17-2-steinberg-projector-difference), [`R17.2/cyclic-local-matching`](#R17-2-cyclic-local-matching).
8. **Global realization of prescribed quaternion ramification.** QFI Layer6D proves only local classification. CFT Layer14 proves reciprocity/parity, which is necessary but alone does not construct a global algebra. The present local swap/parity comparison assumes chosen D₀,D as in CDN23. Before the R17.3 global transfer application, identify the owner and prove the global prescribed-ramification existence/uniqueness theorem on the existing QuaternionAlgebra carrier (with the global Brauer/degree-index comparison); do not infer it from local classification or add a second carrier. *Needed by:* [`R17.1/swapped-quaternion-invariants`](#R17-1-swapped-quaternion-invariants).

### Gaps recorded by part R17.3

1. **GL₃ converse theorem and Rankin–Selberg pole inputs (AL.3b).** Missing supplier: AutomorphicLFunctionsAndLocalFactors:AL.3b, the GL_n converse theorem for all n proposed by the accepted RT-AREA-automorphic-1/1 fix (requires AL.3; consumers R17.4a and R16.5). R17.4a uses its n=3 instance with twists by idele class characters (JPSS, Automorphic forms on GL(3) I–II, Theorem (13.6); Cogdell's survey Theorem 3.3), including the S- and T-variants of Gelbart–Jacquet §9.2. R16.5 states the n=2 instance separately with its own twist family, growth, pole and archimedean hypotheses; it is not a specialisation of the GL₃ statement. The tetrahedral argument also needs the Jacquet–Shalika Rankin–Selberg pole criterion for GL₃ (L^S(s,π¹×π̃²) has a pole at s=1 iff π¹≅π²) and nonvanishing on Re s=1, from AL.3. GL₃ isobaric strong multiplicity one is not used. *Needed by:* [`R17.4/adjoint-lift`](#R17-4-adjoint-lift), [`R17.4/cubic-character-induction`](#R17-4-cubic-character-induction), [`R17.4/gl3-recognition`](#R17-4-gl3-recognition), [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change).
2. **Original JPSS nonnormal cubic transfer proof.** Obtain Jacquet–Piatetski-Shapiro–Shalika, Relèvement cubique non normal, C. R. Acad. Sci. Paris Sér. I Math. 292 (1981), no. 12, 567–571, and the GL₃/GL₂×GL₃ proof it invokes (or a later complete proof, e.g. Mao–Rallis, Canad. J. Math. 52 (2000)). Tunnell (Bull. AMS 5 (1981), p. 173) states only the weak form: cuspidal input and Π_w=π(Res ρ_v) for almost all v. Carayol §12.2.1(b) states the all-place form against the JPSS local lift, without proof. Also missing: for lifts of degree at most three, the correspondence of the local lift of a principal series, special or ordinary cuspidal representation with the restriction of its Weil–Deligne representation, which Carayol asserts without reference and which AutomorphicGaloisRepresentations requests from R17.4 for R19.2/carayol-cubic-base-change-of-extraordinary and Carayol's Theorem (A). Do not infer any of this from cyclic towers. *Needed by:* [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change), [`R17.5/octahedral-artin`](#R17-5-octahedral-artin).
3. **Clozel prescribed-supercuspidal globalization.** Missing input: L. Clozel, On limit multiplicities of discrete series representations in spaces of automorphic forms, Invent. Math. 83 (1986), cited as [9] in CDN20 §5.2.1 footnote 21 (author p. 44): existence of a global automorphic representation of the definite quaternion algebra with prescribed supercuspidal component at 𝔭 and prescribed archimedean type, after the central-character adjustment the footnote allows (twist by a character, changing ϖ) and a finite extension of the p-adic coefficient field. AS.6's trace-formula engine alone does not give this statement; the AS.6 request names the trace-formula input it needs. *Needed by:* [`R17.3/supercuspidal-globalization`](#R17-3-supercuspidal-globalization).
4. **Reduction-compatible lift of a finite solvable projective image (p>2).** BCGP (proof of Proposition 10.1.3, p. 474) cite only the classification [SD73] and Tate's theorem ([Ser77, Theorem 4] is Tate's H²(G_F,Q/Z)=0, the tate-vanishing node). The step they leave implicit is a lift of the finite projective image G ⊂ PGL₂(F̄_p) (dihedral of order prime to p, A₄ or S₄) to a finite subgroup of PGL₂ over the integers of a finite extension of Q_p that reduces isomorphically onto G: for p∤|G| by lifting the prime-to-p preimage in SL₂(F̄_p), and for p=3 with G=A₄ or S₄ through an embedding GL₂(F₃)→GL₂(Z[√−2]) reducing to the identity, followed by a Teichmüller twist to match r̄. No read source writes this out in the generality of odd-residual-lift; the p=3 octahedral case over Q is node R17.5/octahedral-mod-three-application when that node is present. *Needed by:* [`R17.5/odd-residual-lift`](#R17-5-odd-residual-lift), [`R17.5/residual-lt-application`](#R17-5-residual-lt-application).
5. **Local–global extension of characters (Chevalley's congruence theorem for S-units).** Needed: for a number field M, a finite set S of finite places and finite-order characters χ_u of M_u^× (u ∈ S), a finite-order Hecke character of M with these components; and, in Tunnell's 'well known' form, the extension of a quasi-character of one M_u^× to the idele class group. The finite-order form follows from Chevalley's theorem (1951): every finite-index subgroup of the S-unit group contains the S-units congruent to 1 modulo some modulus prime to S. One defines the character on the open finite-index subgroup M^×·(M_∞^{×,0}·∏_{u∈S}M_u^×·∏_{w∉S}U_w) and extends it. The quasi-character form is the closed-subgroup extension F_v^× ⊂ C_F. No Atlas stage owns either. Tau Ceti ClassFieldTheory §1 excludes Grunwald–Wang and prescribed local abelian extensions; GlobalNumberFields layers 9–10 have no existence theorem with prescribed finite components; InverseGaloisAndArithmeticFundamentalGroups IG.4 records its Grunwald–Wang input as an open gap. Weil's criterion (Patrikis Lemma 2.3.1), used by finite-hecke-extension and by prescribed-local-induction, rests on the same congruence property for units. Proposed owner: a node after GlobalNumberFields layer 9, proved from Kummer theory over M(μ_n) (the S-unit Kummer layer of ClassFieldTheory layer 12) and Chebotarev (layer 10, already a supplier of this packet). Over Q, the case used in Tunnell's Q₂ clause is elementary. *Needed by:* [`R17.5/tunnell-primitive-globalization`](#R17-5-tunnell-primitive-globalization), [`R17.5/prescribed-local-induction`](#R17-5-prescribed-local-induction).
6. **All-place upgrade of tetrahedral and octahedral Artin automorphy.** Langlands (§3, Theorem 3.3) and Tunnell (1981) prove π_v≅π(ρ_v) for almost all v. The all-place statement (rec(π_v)≅ρ|W_{F_v} with equal L- and ε-factors of every twist) rests on Langlands's equivalence of the two definitions of π(ρ) (§3, p. 15, using results of Callahan and a Lemma 3.2 whose proof is not given) or on Jacquet–Langlands Theorem 12.2, which needs every twisted Artin L-function L(s,ρ⊗χ) entire and bounded in vertical strips, with the Artin functional equation and Langlands–Deligne local constants. No read source proves the upgrade in full; plan it from JL70 §12 and the R16.3 local factors. *Needed by:* [`R17.5/tetrahedral-artin`](#R17-5-tetrahedral-artin), [`R17.5/octahedral-artin`](#R17-5-octahedral-artin), [`R17.5/solvable-artin`](#R17-5-solvable-artin).

## Mistakes in the sources

These are the mistakes in published sources that the parts found or reused (PROTOCOL.md section 18). The ids are unique across the two parts: E1–E11 belong to part R17.3 and E12–E15 to part R16.1. Every entry carries the verdict of an independent check. Statements in the node entries use the corrected form.

### `GL2AutomorphicRepresentationsAndTransfer/E1` (rt97, misprint)

- **Locator.** Published MSP PDF, p. 307, first paragraph of §2 following cases (i)–(iv)
- **Printed.** ν = 3 in case (iii)
- **Correction.** The ν=3 case is (iv), not (iii).
- **Reason.** Case (iii) has discriminant valuation two and odd character conductor, so ν=2; case (iv) has discriminant valuation three and odd character conductor, so ν=3. The subsequent proof explicitly uses case (iv) when ν=3.
- **Affects.** nothing
- **Known.** new
- **Searched.** MSP published article page and PDF on 2026-10-06; no linked corrigendum was found. Web search for Rohrlich–Tunnell elementary case Serre conjecture erratum/corrigendum on 2026-10-06; no correction located.
- **Check.** confirmed: Page image of printed p. 307 (PDF p. 9) reads 'We see that ν = 0 in case (i), ν = 2 in cases (ii) and (iii), and ν = 3 in case (iii).' From |D|Nf(φ̃)=2^νN: case (iii) has v₂(D)=2 and Nf odd, so ν=2 (already listed); case (iv) has v₂(D)=3, so ν=3. The same paragraph says the theorem covers (i), (ii), (iv), and the proof says 'if ν = 3 then we are in case (iv)'. Locator refinement: the sentence opens p. 307 right after the list (i)–(iv) ending on p. 306, in the second paragraph of §2, not the first. Affects nothing.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E2` (jl70, misprint)

- **Locator.** §14, proof of Theorem 14.2, printed p. 247 of the IAS retypeset edition (PDF p. 253), just before Corollary 14.3; the Springer LNM 114 original was not collated
- **Printed.** Since, by a well-known theorem, the algebra M′ is split at an even number of places the product ∏_v h_v equals 1.
- **Correction.** Since the algebra M′ does not split (is ramified) at an even number of places, the product ∏_v h_v equals 1.
- **Reason.** h_v = −1 exactly at the places where G′_{F_v} is not isomorphic to GL(2,F_v) (printed p. 241), so ∏ h_v = (−1)^{#nonsplit places}. A quaternion algebra splits at all but finitely many places, so 'split at an even number of places' is false. The well-known theorem (Hilbert reciprocity) says the number of non-split places is even.
- **Affects.** nothing
- **Known.** new
- **Searched.** The IAS retypeset edition read (publications.ias.edu, sha256 bfd16d25…, compiled 19 July 2023), §14 and the Chapter III references: no correction. Web search on 2026-10-06 for the phrase together with Jacquet–Langlands LNM 114: no erratum found. Tau Ceti errata register (research/errata/REGISTER.md) on 2026-10-06: no JL70 entry.
- **Check.** confirmed: Checked at the locator: the sign h_v is −1 at non-split places, and the product formula needs an even number of non-split places, not split ones.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E3` (wiese04, error)

- **Locator.** Introduction, printed p. 123 (PDF p. 1), published Documenta Math. 9 version (same text in arXiv:math/0402163v1)
- **Printed.** Let us mention that this is equivalent to imposing that the projective image is isomorphic to a dihedral group Dn with n ≥ 3.
- **Correction.** Being induced from a quadratic field (and irreducible) is equivalent to: ρ irreducible with projective image dihedral D_n for some n≥2, where D₂ is the Klein four group. For p=2 the printed form is right, since then n is odd ≥3.
- **Reason.** For odd p an irreducible induced representation can have projective image D₂: e.g. K=Q(√−17) has cyclic class group of order 4, Gal(H/Q)≅D₄ for its Hilbert class field H, and the faithful 2-dimensional representation of D₄ reduced mod 3 is odd, irreducible, induced from K, with projective image D₄/{±1}≅D₂. Also projective image D_n with p|n can be reducible, so irreducibility must be imposed.
- **Affects.** nothing
- **Known.** known: corrected by the author in his PhD thesis (Leiden 2005), Chapter I, footnote 1 on p. 2 (PDF p. 14), 'A small mistake concerning n = 2 has been corrected (pointed out by K. Buzzard)'; the corrected sentence reads 'the representation is irreducible and its projective image is isomorphic to a dihedral group Dn for some n'.
- **Searched.** Web search 'Wiese Dihedral Galois representations and Katz modular forms erratum OR corrigendum' on 2026-10-06: no journal erratum found. arXiv:math/0402163v1 checked: same sentence. Wiese thesis https://math.uni.lu/wiese/thesis/Thesis.pdf (sha256 734c874da641853d3af02f085dd6432b79e46bdfe52f77ee27f981010a070027) checked: corrected, footnote 1.
- **Check.** confirmed: The counterexample is a group of order 8 prime to 3, so reduction preserves irreducibility; complex conjugation maps to a reflection of determinant −1. The author's own thesis records the correction.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E4` (ac89, misprint)

- **Locator.** Introduction, printed p. xi (PDF p. 13), paragraph on base change for GL(n)
- **Printed.** Our main result is Theorem 3.5.2, and applies to representations induced from cuspidal.
- **Correction.** Theorem 3.5.1, i.e. Chapter 3, Theorem 5.1 ('Strong lifting'), the only theorem of Chapter 3 §5; its weak form is Theorem 3.4.2. Chapter 3 contains no Theorem 5.2.
- **Reason.** Chapter 3 §5 (printed pp. 212–213) contains one theorem, Theorem 5.1, and §6 begins with Definition 6.1 and Theorem 6.2 on automorphic induction. The assertions (i)–(ii) summarised next in the introduction are Theorem 4.2(c),(f) with Theorem 5.1. Confirmed on the page image.
- **Affects.** nothing
- **Known.** new
- **Searched.** data/source-issues.json and research/errata/REGISTER.md in the repository: no entry for Arthur–Clozel AC89 table of contents (PDF p. 8) and Chapter 3 §§4–6 (PDF pp. 218–232) for any Theorem 5.2
- **Check.** confirmed: Page image PDF p. 13 (printed p. xi) reads 'Our main result is Theorem 3.5.2'. Chapter 3 §5 (printed pp. 212–213) states only Theorem 5.1, the strong lifting theorem the sentence describes; the main-text cross-references cite Theorem 4.2 and Theorem 5.1. Checked by the reviewer on the page image.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E5` (langlands80, misprint)

- **Locator.** §11, verification of properties (A)–(G), Digital Math Archive typescript p. 151 (PDF p. 154)
- **Printed.** If π is cuspidal, then by Lemmas 11.3 and 11.4 it has a lifting. … Thus (B) too follows from Lemmas 11.3 and 11.4.
- **Correction.** Lemma 11.3 and Proposition 11.4: Lemma 11.3(b),(c) gives a quasi-lifting, and Proposition 11.4 says a quasi-lifting is a lifting.
- **Reason.** Langlands has no Lemma 11.4. The result numbered 11.4 is 'Proposition 11.4 A quasi-lifting is a lifting' (typescript p. 145), and the numbered results of §11 are Theorem 11.1, Lemmas 11.2–11.3, Propositions 11.4–11.5 and Lemmas 11.6–11.8.
- **Affects.** nothing
- **Known.** new
- **Searched.** data/source-issues.json and research/errata/REGISTER.md: no entry for Langlands, Base change for GL(2) All 'Lemma 11.' and 'Proposition 11.' occurrences in the typescript text (PDF pp. 132–154)
- **Check.** confirmed: Only the Digital Math Archive typescript was read, so whether the printed Annals volume has the same wording is unchecked; the misreference is in the version read.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E6` (wiese04, gap)

- **Locator.** Proof of Lemma 2, printed pp. 126–127 (PDF pp. 4–5): definition of the class c and the sentence 'Moreover, as l splits in K, one has that ρ(Frobl) is the identity matrix'
- **Printed.** c = [{(λ) ∈ CL_K^{4Df∞1∞2} | Norm(λ) < 0, λ ≡ 1 mod 4Df}] ... as l splits in K, one has that ρ(Frob_l) is the identity matrix, so that the trace of ρ(Frob_l) is zero.
- **Correction.** Impose λ ≡ 1 modulo 4D·f·σ(f) (a σ-stable modulus, e.g. 4D·Norm(f)·O_K). Then χ(Λ)=χ(σΛ)=1, ρ(Frob_l)=1 and the trace is zero; ℓ is also prime to N, as Corollary 8 needs in Theorem 9.
- **Reason.** ρ(Frob_l)=diag(χ(Λ),χ(σΛ)). The congruence λ≡1 mod f gives χ(Λ)=1, but χ(σΛ)=1 needs σλ≡1 mod f, i.e. λ≡1 mod σ(f). If χ is ramified at a prime Q with σ(Q) not dividing f, the class c does not constrain λ modulo σ(Q), and Chebotarev produces Λ in c with χ(σΛ)≠1. Then the trace 1+χ(σΛ) is nonzero in characteristic two. Lemma 2 remains true with the corrected modulus.
- **Affects.** the proof
- **Known.** new
- **Searched.** Published Documenta PDF (EMIS copy used by the packet), pp. 126–127. arXiv math/0402163 v1 (only version; sha256 944c1b1d6c086699ce3eb42eba473da68da1c8f77bbdada5f35b2ac8ceba4e42): same modulus 4Df. G. Wiese, PhD thesis, Leiden 2005 (https://math.uni.lu/wiese/thesis/Thesis.pdf, sha256 734c874da641853d3af02f085dd6432b79e46bdfe52f77ee27f981010a070027), Lemma 1.2.1: same modulus and sentence. Web search 2026-10-06 for an erratum/corrigendum to Wiese, Dihedral Galois representations and Katz modular forms: none found.
- **Check.** confirmed: Checked from the explicit matrix description in Wiese §2 (p. 125): χ^σ(Frob_Λ)=χ(Frob_{σΛ}) needs the congruence modulo σ(f).
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E7` (wiese04, error)

- **Locator.** Introduction, printed p. 124 (PDF p. 2); used again in the proof of Lemma 11, printed p. 132
- **Printed.** Let us recall that in weight at least 2 every Katz modular form on Γ1 is classical, i.e. a reduction from a characteristic zero form of the same level and weight.
- **Correction.** Add the level hypothesis: on Γ1(N) with N ≥ 5 (and N invertible in the coefficients).
- **Reason.** At level 1 and p=2, A·Δ (Hasse invariant times Δ) is a nonzero Katz cusp form of weight 13 over F_2 while S_13(SL_2(Z),C)=0; Katz 1973, Remark 1.8.2.2, records the failure of level-one base change when 2 and 3 are not inverted. All of Wiese's results survive. For a dihedral ρ unramified at 2 one has N(ρ) ≥ 5. Lemma 11 follows for small M by adding an auxiliary prime q ≥ 5 to the level, for two different q.
- **Affects.** nothing
- **Known.** corrected by the author: Wiese's 2005 Leiden thesis, Chapter I, repeats the sentence with footnote 3 'More precisely: Γ1(N) with N ≥ 5.'
- **Searched.** Wiese thesis (https://math.uni.lu/wiese/thesis/Thesis.pdf), Chapter I §1.1 footnote 3. arXiv math/0402163 v1: sentence without the footnote. Web search 2026-10-06 for an erratum to the Documenta paper: none found.
- **Check.** confirmed: Explicit counterexample at level one in characteristic two; the author's thesis adds the N ≥ 5 hypothesis.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E8` (ac89, misprint)

- **Locator.** Chapter 3, Theorem 6.2, printed p. 215 (PDF p. 231 of the Clay scan)
- **Printed.** there exists one, and only one, representation π_F of GL(n, A_F) automorphically induced from π_E
- **Correction.** π_F is a representation of GL(nl, A_F), where l=[E:F].
- **Reason.** Definition 6.1 on the same page defines automorphic induction from GL(n, A_E) to GL(nl, A_F), and the proof (formulas (6.1)–(6.2), π_F=π_n⊞(π_n⊗η)⊞…) produces a representation of GL(nl, A_F).
- **Affects.** nothing
- **Known.** new
- **Searched.** Page image of the Clay scan, p. 215: the misprint is in the printed text, not an OCR error. Web search on 2026-10-06 for Arthur–Clozel errata or corrigendum on Theorem 6.2: none found (only the separate known issue in Lemma 6.3 surfaced).
- **Check.** confirmed: Checked against the page image and Definition 6.1 on the same page.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E9` (ac89, gap)

- **Locator.** Chapter 3, proof of Lemma 6.3 (used again in Lemma 6.4 and Corollary 6.5), printed p. 217
- **Printed.** We reduce to the prime case. Let E/E1/F be a composite extension, with [E : E1] prime. Given π_E, we obtain π_{E1} lifted by π_E (Theorem 4.2), then π_F lifted by π_{E1} using Lemma 6.3 inductively.
- **Correction.** For composite [E:F] the descent π_{E1} need not be Gal(E1/F)-stable, so the inductive step is not justified as written. The composite cyclic case is proved by Henniart (Bull. SMF 140 (2012), Théorèmes 1–2), using Lapid–Rogawski (Forum Math. 10 (1998)). The prime-degree case is part of Theorem 4.2 and is unaffected.
- **Reason.** Henniart §1.6 records that the prime-degree results of AC89 Chapter III do not reach the general cyclic case by successive prime-degree descents without additional work, citing Lapid–Rogawski. The nodes of this group use only ℓ=2,3.
- **Affects.** the proof
- **Known.** Lapid–Rogawski, On twists of cuspidal representations of GL(2), Forum Math. 10 (1998) 175–197; Henniart, Induction automorphe globale pour les corps de nombres, Bull. SMF 140 (2012) 1–17, §1.6
- **Searched.** Henniart 2012, Numdam PDF (sha256 a81b55ae0d096f52e83743058a9198fc3351a6e2bcda96b57233ea7b4ccd74f3), §1.6 read Web search on 2026-10-06 for Arthur–Clozel Lemma 6.3 mistake
- **Check.** confirmed: AC89 p. 217 proof read; Henniart 2012 §1.6 read. The issue is already known and is recorded so that composite-tower nodes are checked.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E10` (tunnell81, misprint)

- **Locator.** References, item 4, p. 175
- **Printed.** Relèvement cubique non normal, C. R. Acad. Sci. Paris 292 (1981), 567-579.
- **Correction.** C. R. Acad. Sci. Paris Sér. I Math. 292 (1981), no. 12, 567–571.
- **Reason.** Cogdell's survey (reference [36]) and bibliographic records give pp. 567–571; Carayol's [J.P.S.S.] gives the start page 567.
- **Affects.** nothing
- **Known.** new
- **Searched.** Cogdell, Piatetski-Shapiro's work on converse theorems, reference [36] Carayol 1986 bibliography, [J.P.S.S.] Web search on 2026-10-06 for the JPSS CRAS note (result: 292 (1981), no. 12, 567–571) AMS article landing page (redirected; no erratum found)
- **Check.** confirmed: Two independent sources give 567–571.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E11` (tunnell81, gap)

- **Locator.** Proof of the Theorem, p. 175, first paragraph
- **Printed.** Since BC_{E/F}(π) = π(ρ_E) we see that diag(a'_v, b'_v) is conjugate to diag(a_vω, b_vω) with ω² = 1.
- **Correction.** At places v inert in E, BC_{E/F}(π)=π(ρ_E) only gives that the squares agree, which allows (a'_v,b'_v)=(a_v,−b_v). The claim also needs ω_π=det ρ. This follows from the Lemma: BC_{K/F}(π)=π(ρ_K) gives (ω_π/det ρ)∘N_{K/F}=1, while ω_{E/F}∘N_{K/F}=ω_{M/K}≠1. With it the claim and the rest of the proof hold.
- **Reason.** ω_π∘N_{E/F}=det ρ∘N_{E/F} leaves ω_π∈{det ρ, det ρ·ω_{E/F}}. In the second case the displayed form fails at inert places, so the stated justification is incomplete although the conclusion is correct.
- **Affects.** the proof
- **Known.** new
- **Searched.** Tunnell 1981 note itself (no correction) Carayol 1986 §12.2.3 and Rogawski–Tunnell 1983 §4 cite the theorem without comment AMS article landing page (no erratum found)
- **Check.** confirmed: Checked by direct computation of Satake classes at places inert in E; repaired by the central-character identity from the Lemma.
- **Part.** R17.3

### `GL2AutomorphicRepresentationsAndTransfer/E12` (nt26, misprint)

- **Locator.** Definition 2.4, arXiv v2 p. 11; the same slip in the proof of Lemma 3.1, p. 14
- **Printed.** rec_{F_v}(π_v) ≅ Ind^{W_{F′_v}}_{W_{F_v}} χ_v
- **Correction.** Ind_{W_{F′_v}}^{W_{F_v}} χ_v and Ind_{G_{F′_{v₀}}}^{G_{F_{v₀}}} ψ̄.
- **Reason.** The character is on W_{F′}, so induction runs to W_F.
- **Affects.** nothing
- **Known.** Previously recorded and confirmed as PAPER-NEWTON-THORNE-26/E3 by REV-PAPER-NEWTON-THORNE-26
- **Searched.** Read the accepted extraction and its independently confirmed correction; compared the exact cited passage of the version downloaded for this packet. Crossref record of doi:10.4007/annals.2026.203.1.4, 23 September 2026: no update-to, updated-by or relation entries
- **Check.** confirmed: Confirmed in arXiv2212.03595v2 pp.11,14: the character lives on the extension subgroup, so induction runs from that subgroup to the base group.
- **Part.** R16.1

### `GL2AutomorphicRepresentationsAndTransfer/E13` (cg20, misprint)

- **Locator.** §1.3 (speculative remarks on geometric doubling), p. 805, last paragraph and display at the foot of the page. arXiv:1907.08691v1 has the same wording and display: the sentence starts on p. 4 and the display is on p. 5.
- **Printed.** which is not trivial
- **Correction.** Replace "which is not trivial" with "which is not one-dimensional" (equivalently "infinite-dimensional" or "generic"). Then π_p is an irreducible unramified principal series Ind_B^G(χ1⊗χ2), with χ1, χ2 unramified and χ1χ2^{-1} ≠ |·|^{±1}, and the display holds. This one-word change is the minimal fix.
- **Reason.** A nontrivial unramified χ∘det satisfies the printed hypothesis and has both fixed spaces of dimension one.
- **Affects.** nothing
- **Known.** Previously recorded and confirmed as PAPER-CALEGARI-GERAGHTY-20/E8 by REV-PAPER-CALEGARI-GERAGHTY-20
- **Searched.** Read the accepted extraction and its independently confirmed correction; compared the exact cited passage of the version downloaded for this packet. The published article as typeset by Duke (the advance-publication PDF hosted on F. Calegari's page, math.uchicago.edu/~fcale/papers/Siegel.pdf, 96 pages, SHA-256 fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5; its page n is published page 800 + n) and the arXiv preprints at the same place: arXiv:1907.08691v1 (main text) and arXiv:1907.08694v1 (appendix), the only versions
- **Check.** confirmed: Confirmed in the author-hosted published Duke PDF p.805: a nontrivial unramified determinant character is one-dimensional and has both fixed spaces of dimension1. The generic/infinite-dimensional restriction is necessary.
- **Part.** R16.1

### `GL2AutomorphicRepresentationsAndTransfer/E14` (bcgp21, misprint)

- **Locator.** Published §2.4.15, printed p. 179, second spherical projection identity
- **Printed.** T_{v,1}
- **Correction.** T^{GL₂}_{v,1} in the second identity, matching the rank-two algebra on both sides.
- **Reason.** The entire lemma concerns GL₂; the final right-hand symbol is the GSp₄ notation whereas the preceding definitions supply T^{GL₂}_{v,1}.
- **Affects.** nothing
- **Known.** Already noted in accepted PAPER-BOXER-CALEGARI-GEE-PILLONI-21/20 and in the job routing brief
- **Searched.** Read the accepted paper extraction item 20 and this job’s source-routing correction; compared §2.4.15 in the published Centre Mersenne PDF.
- **Check.** confirmed: Confirmed in the published IHÉS PDF p.179: the second equality is in the GL₂ Hecke algebra; its right-hand T₁ must carry the same GL₂ superscript as the preceding definitions.
- **Part.** R16.1

### `GL2AutomorphicRepresentationsAndTransfer/E15` (getz15, error)

- **Locator.** §6.4, Lemma 6.19 and Remark 6.20 (p. 33), repeated in §6.5 (p. 34); notes version of 13 March 2015
- **Printed.** ∆φ = (1/4)(k²−1)φ
- **Correction.** With ∆ = (1/4)(H² + 2XY + 2YX), a weight-k form φ_f killed by the lowering operator satisfies ∆φ_f = (k(k−2)/4)φ_f; the ideal is ⟨∆ − k(k−2)/4, Z⟩.
- **Reason.** The notes' own §6.5 gives ∆v_ℓ = (k(k−2)/4)v_ℓ on the discrete series π_k generated by such forms. Check at k = 2: weight-2 holomorphic forms have the infinitesimal character of the trivial representation, on which ∆ acts by 0, whereas (k²−1)/4 = 3/4. With the printed ideal the target space of Lemma 6.19 is 0 for k ≥ 2, so the stated isomorphism is false as printed.
- **Affects.** a stated result
- **Known.** Previously independently confirmed as AutomorphicFormsOnReductiveGroups/E1 by REV-AutomorphicFormsOnReductiveGroups; this packet uses that correction.
- **Searched.** Read the exact 2015 author PDF and the supplier’s independently reviewed source issue; the notes’ §6.5 computes the corrected Casimir. Jayce Getz's web page (sites.math.duke.edu/~jgetz), the 2015 PDF read and the published book Getz–Hahn, An Introduction to Automorphic Representations (Springer GTM 300, 2024) table of contents; no erratum list found for the 2015 notes
- **Check.** confirmed: Confirmed in the 13 March2015 notes pp.33–34: the displayed Lie action on the generated module gives k(k−2)/4. At k=2 the stated (k²−1)/4 ideal has the wrong infinitesimal character.
- **Part.** R16.1

## Coverage of the layers

Every layer is `planned`: each target it states is a node whose prerequisite chains end in the libraries, in another roadmap’s node or layer, or in a recorded gap. None is `closed`. The remaining work of each layer is listed as its part records it.

### R16.1: planned (part R16.1)

- Supplier test-function and automorphic carriers in Lean: The pins lack the supplier smooth/automorphic isomorphism-class, analytic test-function, quotient-measure, LLC and trace-distribution interfaces. Provisional Lean signatures use explicit carrier/operation parameters with the unavailable mathematical hypotheses identified in comments. They are signature checks only, not theorems for arbitrary parameters or functions. Replace them by the actual supplier declarations before implementation.
- Supplier ReductiveGroupsPartII:RG2.4: Import finite-place Iwasawa/Cartan decompositions with the local integral maximal compact and dominant invariant factors; RG2.0 supplies integral-point topology, while AF.1 supplies real/complex decompositions.
- Supplier SmoothRepresentationsOfLocalGroups:SR.1: Use the existing C_c^∞ Hecke convolution carrier and its compact-mod-center ω⁻¹-equivariant variant, quotient Haar measure, character-isotypic compact-mod-center idempotents, double-coset operators, scalar extension and integrated representation. Keep 1_I and normalized e_K distinct.
- Supplier AutomorphicFormsOnReductiveGroups:AF.1: Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6.
- Supplier ReductiveGroupsPartII:RG2.0: Import topology and compactness of integral GL₂ points and openness of congruence kernels; use determinant a unit, not merely nonzero. AA.1 then supplies the adelic restricted-product identification.

### R16.2: planned (part R16.1)

- Archimedean owner and complete comparison signatures: AF.1b is proposed by the verified RT finding but not installed in the current atlas. Current AF.1 nodes provide Wℝ and D_k fragments, not the full classification/factor contract. Obtain the complete real/complex chamber, limit and epsilon signature from that supplier before closing these nodes; the suggested file marks unavailable conditions beside provisional carrier parameters. In particular, prove the real quaternionic comparison through the SU(2)/GL₂(ℝ) character interfaces; current finite-place ET.6 does not provide it.
- Full newvector and ramified factor interface: Translate Casselman’s top-left ω(a) convention by applying the theorem to π∨≅π⊗ω⁻¹det and twisting back, giving ω(d), hence last-row K₁ invariants. Verify the exact newvector Whittaker evaluation and ramified primitive U_p factor in SR.5/AL.2/upstream Layer 4. The public scan was read; it does not by itself provide the complete modern supplier signature.
- Supplier ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices: Use the existing compact-subgroup stable-lattice theorem for the finite CDT type over a finite nonarchimedean coefficient field; choose an invariant O-lattice and preserve coefficient extension, without asserting canonicity.
- Supplier SmoothRepresentationsOfLocalGroups:SR.0:abelian-category: The fixed-smooth-central-character abelian category in characteristic zero, exact compact-open invariants and projectivity of supercuspidal blocks. Include the L/ℚp scalar-extension case used by Dospinescu–Le Bras. No unrestricted-category or mod-p projectivity claim.
- Supplier SmoothRepresentationsOfLocalGroups:SR.1: Use the existing C_c^∞ Hecke convolution carrier and its compact-mod-center ω⁻¹-equivariant variant, quotient Haar measure, character-isotypic compact-mod-center idempotents, double-coset operators, scalar extension and integrated representation. Keep 1_I and normalized e_K distinct.
- Supplier SmoothRepresentationsOfLocalGroups:SR.2: Normalized induction with δ_B^{1/2}, its compact and Jacquet models, contragredients, finite-length exceptional principal series and induced-operator kernels. Supply the all-x,y constant-term criterion that makes an induced operator zero.
- Supplier SmoothRepresentationsOfLocalGroups:SR.3: Admissibility, contragredient identity π∨≅π⊗ωπ⁻¹det for GL₂, compact-mod-center supercuspidal matrix coefficients, Bernstein inertial equivalence and typical K-types. Include characteristic-zero stable lattices for CDT finite-group types without declaring every integral realization canonical.
- Supplier SmoothRepresentationsOfLocalGroups:SR.4: Normalized Satake coordinates and the Bernstein/Iwahori presentation, center≅spherical via e_K, scalar-extension hypotheses and GL₂ generator conventions U₀,U₁,T₀,T₁. The general parahoric-center extension is the proposed SmoothRepresentationsPartIIParahoricCenters owner; use SR.4 until that roadmap is installed.
- Supplier SmoothRepresentationsOfLocalGroups:SR.5: The single local Whittaker/Kirillov functor, uniqueness, explicit Borel action, genericity, nonzero newvector evaluation for conductor-O ψ, spherical Whittaker values and Weyl operator from the gamma factor. Supply the finite L/ℚp Kirillov scalar extension/Γ descent used by Dospinescu–Le Bras; locally analytic theory remains R30.
- Supplier AutomorphicFormsOnReductiveGroups:AF.1: Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6.
- Supplier AutomorphicLFunctionsAndLocalFactors:AL.2: The sole local standard-factor and Whittaker zeta-integral carrier, compatibility with LLC, local fractional ideal/test-vector theorem, epsilon shifts/conductor exponents, and archimedean gamma conventions. A normalized newvector realizes the untwisted standard L-factor; arbitrary ramified twists require their own test-vector statement.
- Supplier EndoscopicTransferAndUnitaryTraceComparison:ET.6: The canonical characteristic-zero GLn local LLC and GLr(D) inner-form/JL carrier, including normalized induction/segments, twisting, determinant, Artin conductor and L/epsilon compatibility. Supply all finite extensions of ℚp including dyadic primitive wild parameters, index-two Weil induction, Henniart typical-type interface and CDT Θ(θ) inertial comparison; no dependence on this GL₂ specialization.

### R16.3: planned (part R16.1)

- Archimedean owner and complete comparison signatures: AF.1b is proposed by the verified RT finding but not installed in the current atlas. Current AF.1 nodes provide Wℝ and D_k fragments, not the full classification/factor contract. Obtain the complete real/complex chamber, limit and epsilon signature from that supplier before closing these nodes; the suggested file marks unavailable conditions beside provisional carrier parameters. In particular, prove the real quaternionic comparison through the SU(2)/GL₂(ℝ) character interfaces; current finite-place ET.6 does not provide it.
- Full newvector and ramified factor interface: Translate Casselman’s top-left ω(a) convention by applying the theorem to π∨≅π⊗ω⁻¹det and twisting back, giving ω(d), hence last-row K₁ invariants. Verify the exact newvector Whittaker evaluation and ramified primitive U_p factor in SR.5/AL.2/upstream Layer 4. The public scan was read; it does not by itself provide the complete modern supplier signature.
- Primitive wild dyadic worked example: The all-field theorem is imported from ET.6, but no explicit primitive dyadic parameter together with its Swan computation and quaternion matching function was verified in the source passages read. Add a worked primitive example, not a tame quadratic replacement, and compute a(r), L=1 and its matching function in the supplier normalization.
- Suggested-file supplier conditions and full tensor coefficient types: The suggested file prototypes the actual algebraic pieces and explicitly lists omitted supplier conditions. The full Weil-induction property, geometric Hilbert tensor representation, primitive cusp subtype, compact-mod-center supports/volumes and orbital integrals cannot be stated at the pins. Replace the parameters by supplier carriers and add their conditions; do not interpret provisional statements as unconditional mathematics.
- Supplier AutomorphicFormsOnReductiveGroups:AF.1: Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6.
- Supplier AutomorphicLFunctionsAndLocalFactors:AL.1: Character L/epsilon factors over nonarchimedean and archimedean fields, ψ/measure change, ν-shifts and the discriminant convention in global products. Fix Γℝ,Γℂ, |z|ℂ and geometric Artin conventions explicitly.
- Supplier AutomorphicLFunctionsAndLocalFactors:AL.2: The sole local standard-factor and Whittaker zeta-integral carrier, compatibility with LLC, local fractional ideal/test-vector theorem, epsilon shifts/conductor exponents, and archimedean gamma conventions. A normalized newvector realizes the untwisted standard L-factor; arbitrary ramified twists require their own test-vector statement.
- Supplier EndoscopicTransferAndUnitaryTraceComparison:ET.6: The canonical characteristic-zero GLn local LLC and GLr(D) inner-form/JL carrier, including normalized induction/segments, twisting, determinant, Artin conductor and L/epsilon compatibility. Supply all finite extensions of ℚp including dyadic primitive wild parameters, index-two Weil induction, Henniart typical-type interface and CDT Θ(θ) inertial comparison; no dependence on this GL₂ specialization.
- Supplier tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors: Import the absolute Artin homomorphism with dense image, finite-quotient reciprocity, arithmetic/geometric Frobenius conversion and character conductors. This is NOT an isomorphism F×→G_Fᵃᵇ; inverse character transport uses Layer9 topological Weil-group reciprocity for F/ℚp finite.
- Supplier tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group: Use localWeilArtinEquiv:F×≃ₜ*W_Fᵃᵇ onto the topological abelianization, with the Layer7 absolute-map compatibility and inversion for geometric Frobenius. This reciprocity export is available here only for finite extensions of ℚp.

### R16.4: planned (part R16.1)

- Supplier test-function and automorphic carriers in Lean: The pins lack the supplier smooth/automorphic isomorphism-class, analytic test-function, quotient-measure, LLC and trace-distribution interfaces. Provisional Lean signatures use explicit carrier/operation parameters with the unavailable mathematical hypotheses identified in comments. They are signature checks only, not theorems for arbitrary parameters or functions. Replace them by the actual supplier declarations before implementation.
- Supplier SmoothRepresentationsOfLocalGroups:SR.5: The single local Whittaker/Kirillov functor, uniqueness, explicit Borel action, genericity, nonzero newvector evaluation for conductor-O ψ, spherical Whittaker values and Weyl operator from the gamma factor. Supply the finite L/ℚp Kirillov scalar extension/Γ descent used by Dospinescu–Le Bras; locally analytic theory remains R30.
- Supplier AutomorphicFormsOnReductiveGroups:AF.2: The existing smooth automorphic/cuspidal isomorphism classes, determinant-twist action and Hecke-character classes, so non-CM is a subset of this carrier. Supply classical/adelic finite-level comparison and growth conditions; do not create another representation structure.
- Supplier AutomorphicLFunctionsAndLocalFactors:AL.3: General GLn global Fourier–Whittaker expansion (including convergence/injectivity) BEFORE multiplicity applications; GL₂×GL₁ integral comparison, full Hecke-character twisted functional equations and Mellin-inversion estimates; Rankin–Selberg pole criterion for π×π̃, nonvanishing and absence of poles at s=1 for omitted finite and archimedean Rankin–Selberg factors for cofinite strong multiplicity one. No second GL₂ carrier is created.
- Supplier AutomorphicSpectralTheory:AS.4: Cuspidal Hilbert decomposition with finite multiplicity, algebraic smooth restricted-tensor realization and its relation to the completion. Supply GL₂ discrete residual determinant-character identification from the generic spectral carrier; multiplicity one is not presupposed.
- Supplier tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields: Import the upstream coefficient-field theorem for primitive normalized forms and its compatibility with algebraic Hecke eigenvalues.
- Supplier tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality: Import Galois stability/conjugate primitive newforms, CharacterField χ≤CoefficientField f, and rationality of the Hecke characteristic polynomials. Layer8 alone gives coefficient-field algebraicity and does not justify Galois conjugation of analytic forms.

### R16.5: planned (part R16.1)

- Supplier test-function and automorphic carriers in Lean: The pins lack the supplier smooth/automorphic isomorphism-class, analytic test-function, quotient-measure, LLC and trace-distribution interfaces. Provisional Lean signatures use explicit carrier/operation parameters with the unavailable mathematical hypotheses identified in comments. They are signature checks only, not theorems for arbitrary parameters or functions. Replace them by the actual supplier declarations before implementation.
- Supplier AutomorphicFormsOnReductiveGroups:AF.1: Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6.
- Supplier AutomorphicFormsOnReductiveGroups:AF.2: The existing smooth automorphic/cuspidal isomorphism classes, determinant-twist action and Hecke-character classes, so non-CM is a subset of this carrier. Supply classical/adelic finite-level comparison and growth conditions; do not create another representation structure.
- Supplier AutomorphicLFunctionsAndLocalFactors:AL.1: Character L/epsilon factors over nonarchimedean and archimedean fields, ψ/measure change, ν-shifts and the discriminant convention in global products. Fix Γℝ,Γℂ, |z|ℂ and geometric Artin conventions explicitly.
- Supplier AutomorphicLFunctionsAndLocalFactors:AL.2: The sole local standard-factor and Whittaker zeta-integral carrier, compatibility with LLC, local fractional ideal/test-vector theorem, epsilon shifts/conductor exponents, and archimedean gamma conventions. A normalized newvector realizes the untwisted standard L-factor; arbitrary ramified twists require their own test-vector statement.
- Supplier AutomorphicLFunctionsAndLocalFactors:AL.3: General GLn global Fourier–Whittaker expansion (including convergence/injectivity) BEFORE multiplicity applications; GL₂×GL₁ integral comparison, full Hecke-character twisted functional equations and Mellin-inversion estimates; Rankin–Selberg pole criterion for π×π̃, nonvanishing and absence of poles at s=1 for omitted finite and archimedean Rankin–Selberg factors for cofinite strong multiplicity one. No second GL₂ carrier is created.
- Supplier tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor: Import existing primitive newform/newspace and exact conductor theory, including bad-prime Hecke eigenproperties beyond the pinned Newform fields and their classical Euler factors.
- Supplier tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions: Import the upstream primitive classical finite Euler factors, Mellin completion and functional equation, with exact width, conductor, nebentypus and weight normalization.

### R16.6: planned (part R16.1)

- Archimedean owner and complete comparison signatures: AF.1b is proposed by the verified RT finding but not installed in the current atlas. Current AF.1 nodes provide Wℝ and D_k fragments, not the full classification/factor contract. Obtain the complete real/complex chamber, limit and epsilon signature from that supplier before closing these nodes; the suggested file marks unavailable conditions beside provisional carrier parameters. In particular, prove the real quaternionic comparison through the SU(2)/GL₂(ℝ) character interfaces; current finite-place ET.6 does not provide it.
- Supplier test-function and automorphic carriers in Lean: The pins lack the supplier smooth/automorphic isomorphism-class, analytic test-function, quotient-measure, LLC and trace-distribution interfaces. Provisional Lean signatures use explicit carrier/operation parameters with the unavailable mathematical hypotheses identified in comments. They are signature checks only, not theorems for arbitrary parameters or functions. Replace them by the actual supplier declarations before implementation.
- Full newvector and ramified factor interface: Translate Casselman’s top-left ω(a) convention by applying the theorem to π∨≅π⊗ω⁻¹det and twisting back, giving ω(d), hence last-row K₁ invariants. Verify the exact newvector Whittaker evaluation and ramified primitive U_p factor in SR.5/AL.2/upstream Layer 4. The public scan was read; it does not by itself provide the complete modern supplier signature.
- Geometric versus arithmetic Galois normalization handoff: The algebraic Satake half-twist and Frobenius inversion are specified. R19.1 must match its nebentypus reciprocity and dual convention to the Galois representation with determinant ε·χ_cyc^{k−1}, and prove ramified WD compatibility with N preserved. This is a downstream interface requirement, not a prerequisite edge from R19 back to R16.
- Suggested-file supplier conditions and full tensor coefficient types: The suggested file prototypes the actual algebraic pieces and explicitly lists omitted supplier conditions. The full Weil-induction property, geometric Hilbert tensor representation, primitive cusp subtype, compact-mod-center supports/volumes and orbital integrals cannot be stated at the pins. Replace the parameters by supplier carriers and add their conditions; do not interpret provisional statements as unconditional mathematics.
- Supplier AutomorphicFormsOnReductiveGroups:AF.1: Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6.
- Supplier AutomorphicFormsOnReductiveGroups:AF.4: The relative-Lie-algebra-cohomological criterion for Sym^{kτ−2}⊗det^{mτ} at real GL₂, with explicit coefficient-dual and central-character convention, and compatibility under coefficient extension. Use existing rationality-field/clozel-rationality nodes for the general number-field model.
- Supplier AutomorphicLFunctionsAndLocalFactors:AL.1: Character L/epsilon factors over nonarchimedean and archimedean fields, ψ/measure change, ν-shifts and the discriminant convention in global products. Fix Γℝ,Γℂ, |z|ℂ and geometric Artin conventions explicitly.
- Supplier tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor: Import existing primitive newform/newspace and exact conductor theory, including bad-prime Hecke eigenproperties beyond the pinned Newform fields and their classical Euler factors.

### R17.1: planned (part R16.1)

- Archimedean owner and complete comparison signatures: AF.1b is proposed by the verified RT finding but not installed in the current atlas. Current AF.1 nodes provide Wℝ and D_k fragments, not the full classification/factor contract. Obtain the complete real/complex chamber, limit and epsilon signature from that supplier before closing these nodes; the suggested file marks unavailable conditions beside provisional carrier parameters. In particular, prove the real quaternionic comparison through the SU(2)/GL₂(ℝ) character interfaces; current finite-place ET.6 does not provide it.
- Supplier test-function and automorphic carriers in Lean: The pins lack the supplier smooth/automorphic isomorphism-class, analytic test-function, quotient-measure, LLC and trace-distribution interfaces. Provisional Lean signatures use explicit carrier/operation parameters with the unavailable mathematical hypotheses identified in comments. They are signature checks only, not theorems for arbitrary parameters or functions. Replace them by the actual supplier declarations before implementation.
- Primitive wild dyadic worked example: The all-field theorem is imported from ET.6, but no explicit primitive dyadic parameter together with its Swan computation and quaternion matching function was verified in the source passages read. Add a worked primitive example, not a tame quadratic replacement, and compute a(r), L=1 and its matching function in the supplier normalization.
- Global realization of prescribed quaternion ramification: QFI Layer6D proves only local classification. CFT Layer14 proves reciprocity/parity, which is necessary but alone does not construct a global algebra. The present local swap/parity comparison assumes chosen D₀,D as in CDN23. Before the R17.3 global transfer application, identify the owner and prove the global prescribed-ramification existence/uniqueness theorem on the existing QuaternionAlgebra carrier (with the global Brauer/degree-index comparison); do not infer it from local classification or add a second carrier.
- Supplier AutomorphicFormsOnReductiveGroups:AF.1: Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6.
- Supplier EndoscopicTransferAndUnitaryTraceComparison:ET.6: The canonical characteristic-zero GLn local LLC and GLr(D) inner-form/JL carrier, including normalized induction/segments, twisting, determinant, Artin conductor and L/epsilon compatibility. Supply all finite extensions of ℚp including dyadic primitive wild parameters, index-two Weil induction, Henniart typical-type interface and CDT Θ(θ) inertial comparison; no dependence on this GL₂ specialization.
- Supplier tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion: Import the upstream quaternion algebra/reduced norm, local split/division classification and chosen splitting isomorphisms. This packet only applies these objects.
- Supplier tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries: Import the LOCAL uniqueness of the quaternion division algebra over a nonarchimedean local field and the split/division comparison. This layer supplies no global prescribed-ramification existence theorem; the swapped global example assumes chosen algebras and records that missing realization separately.
- Supplier tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity: Import upstream reciprocity/parity of quaternion ramification for the swapped-invariant example; this is not a new global existence proof.

### R17.2: planned (part R16.1)

- Supplier test-function and automorphic carriers in Lean: The pins lack the supplier smooth/automorphic isomorphism-class, analytic test-function, quotient-measure, LLC and trace-distribution interfaces. Provisional Lean signatures use explicit carrier/operation parameters with the unavailable mathematical hypotheses identified in comments. They are signature checks only, not theorems for arbitrary parameters or functions. Replace them by the actual supplier declarations before implementation.
- Primitive wild dyadic worked example: The all-field theorem is imported from ET.6, but no explicit primitive dyadic parameter together with its Swan computation and quaternion matching function was verified in the source passages read. Add a worked primitive example, not a tame quadratic replacement, and compute a(r), L=1 and its matching function in the supplier normalization.
- Concrete singular and continuous trace-term calculations: JL §16 explicitly supplies a formal sketch; it does not verify all analytic details. Langlands §10 also says its analytical proof is scamped. Read and specialize the complete AS.6/ET.4 identity, unipotent, intertwining-derivative and quadratic exceptional terms with the exact measure convention; compute the norm-character/residual correction and one-half Weyl weights rather than claim generic cancellation.
- Suggested-file supplier conditions and full tensor coefficient types: The suggested file prototypes the actual algebraic pieces and explicitly lists omitted supplier conditions. The full Weil-induction property, geometric Hilbert tensor representation, primitive cusp subtype, compact-mod-center supports/volumes and orbital integrals cannot be stated at the pins. Replace the parameters by supplier carriers and add their conditions; do not interpret provisional statements as unconditional mathematics.
- Supplier AdelicAlgebraicGroups:AA.2: Import quotient measures for Z(Fv)\G(Fv), central-character L² and compatible torus quotient measures; AL.0 alone owns Schwartz–Bruhat/Fourier theory.
- Supplier SmoothRepresentationsOfLocalGroups:SR.1: Use the existing C_c^∞ Hecke convolution carrier and its compact-mod-center ω⁻¹-equivariant variant, quotient Haar measure, character-isotypic compact-mod-center idempotents, double-coset operators, scalar extension and integrated representation. Keep 1_I and normalized e_K distinct.
- Supplier SmoothRepresentationsOfLocalGroups:SR.2: Normalized induction with δ_B^{1/2}, its compact and Jacquet models, contragredients, finite-length exceptional principal series and induced-operator kernels. Supply the all-x,y constant-term criterion that makes an induced operator zero.
- Supplier SmoothRepresentationsOfLocalGroups:SR.3: Admissibility, contragredient identity π∨≅π⊗ωπ⁻¹det for GL₂, compact-mod-center supercuspidal matrix coefficients, Bernstein inertial equivalence and typical K-types. Include characteristic-zero stable lattices for CDT finite-group types without declaring every integral realization canonical.
- Supplier SmoothRepresentationsOfLocalGroups:SR.4: Normalized Satake coordinates and the Bernstein/Iwahori presentation, center≅spherical via e_K, scalar-extension hypotheses and GL₂ generator conventions U₀,U₁,T₀,T₁. The general parahoric-center extension is the proposed SmoothRepresentationsPartIIParahoricCenters owner; use SR.4 until that roadmap is installed.
- Supplier AutomorphicSpectralTheory:AS.4: Cuspidal Hilbert decomposition with finite multiplicity, algebraic smooth restricted-tensor realization and its relation to the completion. Supply GL₂ discrete residual determinant-character identification from the generic spectral carrier; multiplicity one is not presupposed.
- Supplier AutomorphicSpectralTheory:AS.2: Import normalized global/local intertwining operators, their factorization, meromorphic continuation and residues from AS.2; AS.6 supplies their operator-valued derivative distributions in the trace formula. Use the same ψ/Haar and normalization. AS.5 weighted cohomology supplies none of this.
- Supplier AutomorphicSpectralTheory:AS.6: The invariant trace formula on compact-mod-center test functions, all identity/elliptic/unipotent terms, residual characters, continuous intertwining-derivative distributions and their measure normalization. Its specialization must expose every term needed by the concrete quaternionic/cyclic ledger.
- Supplier EndoscopicTransferAndUnitaryTraceComparison:ET.1: The transfer-factor and norm conventions, regular centralizer identifications and measure factors for GL₂ ordinary, inner-form and cyclic twisted transfer. Provide archimedean input through the proposed AF.1b, not a second LLC classification.
- Supplier EndoscopicTransferAndUnitaryTraceComparison:ET.3: Local transfer on the existing smooth test-function carriers, quaternionic matching with rank-two sign and common torus measure, cyclic ordinary/twisted orbital-integral transfer, and identity/singular-term compatibility. General transfer existence remains here.
- Supplier EndoscopicTransferAndUnitaryTraceComparison:ET.4: The unramified spherical fundamental lemma and simple cyclic trace comparison with normalized norm/central-character pullback. Include quadratic exceptional induced and residual terms with their one-half Weyl weights, and the exact continuous/intertwining identities used in the GL₂ specialization.
- Supplier EndoscopicTransferAndUnitaryTraceComparison:ET.6: The canonical characteristic-zero GLn local LLC and GLr(D) inner-form/JL carrier, including normalized induction/segments, twisting, determinant, Artin conductor and L/epsilon compatibility. Supply all finite extensions of ℚp including dyadic primitive wild parameters, index-two Weil induction, Henniart typical-type interface and CDT Θ(θ) inertial comparison; no dependence on this GL₂ specialization.

### R17.3: planned (part R17.3)

Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

- Decompose the trace-formula inverse, coefficient-model descent and source-specific spectral comparison proofs after the R16/R17.1–R17.2 supplier interfaces exist.
- Obtain Clozel, Invent. Math. 83 (1986) (limit multiplicities) and plan its prescribed-local-type statement with AutomorphicSpectralTheory; keep the central-character twist and coefficient extension of CDN20 footnote 21.

### R17.4: planned (part R17.3)

Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

- Decompose prime-cyclic transfer/descent and tower-independence below target level once R17.2 and ET.4/ET.4b exist; cyclic base change and AC89 Chapter 3 automorphic induction import the proposed ET.4b (RT-AREA-langlands-1/1) when it is live.
- R17.4a (adjoint-lift, cubic-character-induction, gl3-recognition, nonnormal-cubic-base-change) awaits the restructure; its inputs are AL.3, AL.3b and MetaplecticAutomorphicForms MP.5 (Gelbart–Jacquet's Shimura integral, GJ78 §§5–8 and Theorem 8.1).
- Obtain JPSS (C. R. Acad. Sci. 292 (1981)) and plan the non-Galois cubic local compatibility (principal series, special, ordinary cuspidal) that AutomorphicGaloisRepresentations requests for R19.2.

### R17.5: planned (part R17.3)

Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

- Plan the all-place upgrade of tetrahedral and octahedral Artin automorphy from Jacquet–Langlands §12 (gap).
- Write out the reduction-compatible lift of a finite solvable projective image for general p>2 (gap); complete the totally real weight-one extension of R16.6 (request).

### R17.6: planned (part R17.3)

Every stage target has a node whose prerequisite chains end in a read baseline/supplier node, an explicit request or a named gap. Carayol's extraordinary dyadic comparison is not an R17.6 target (accepted RS-21 boundary and RT-AREA-langlands-2/4 fix): it is planned in AutomorphicGaloisRepresentations R19.2.

- Write the requested Wiese Proposition 7/Corollary 8 and Proposition 4/Corollary 5 statements in R15.2.
- Refine Rohrlich–Tunnell's three dyadic computations and the conditional compatible-system interfaces once the supplier carriers exist; no general minimal-weight level lowering is claimed.

## Structural proposals of the parts

The parts record these proposals for the maintainer (PROTOCOL.md section 9). They change no node of this document: the nodes stay in the layers named by their ids until a proposal is applied.

### Part R16.1, proposal 1: rescope

- **Targets.** `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`
- **Reason.** RT-AREA-automorphic-1/9: the GL₂ global Whittaker expansion is a comparison node in R16.4 before multiplicity, importing the general expansion from AL.3. R16.5 uses it only for its integral comparison, keeping the graph acyclic.
- **Proposal.** Move the expansion target from R16.5 to R16.4; retain R16.4 → R16.5. Add the explicit AL.3 expansion and AL.0 Fourier prerequisites.

### Part R16.1, proposal 2: rescope

- **Targets.** `GL2AutomorphicRepresentationsAndTransfer:R16.1`
- **Reason.** RT-AREA-automorphic-1/14: Schwartz–Bruhat/Fourier theory belongs solely to AL.0. AA.0 owns restricted Haar products, AA.1 owns adelic points and AA.2 owns quotient measures.
- **Proposal.** Add AL.0 → R16.1, retain AA.2 only for quotient/central-character L². No source or carrier is duplicated.

### Part R16.1, proposal 3: split

- **Targets.** `AutomorphicFormsOnReductiveGroups:AF.1`
- **Reason.** RT-AREA-automorphic-1/2: archimedean classification/LLC is a generic supplier rather than a GL₂ construction.
- **Proposal.** Implement the verified AF.1 → AF.1b split: AF.1 retains algebraic (g,K) theory; AF.1b owns real reductive classification, discrete/limit series, GLn archimedean LLC and globalization. Until installed, the current AF.1 request carries the exact contract; no fictitious AF.1b dependency is used.

### Part R17.3, proposal 1: split

- **Roadmaps.** `GL2AutomorphicRepresentationsAndTransfer`, `AutomorphicLFunctionsAndLocalFactors`
- **Detail.** RT-AREA-automorphic-1/1 (accepted fix, RT-AREA-automorphic-1.fixes.md /1): cyclic/solvable Galois base change cannot supply a non-normal cubic extension, and rank-two converse theory cannot supply the GL₃ inputs of tetrahedral and octahedral Artin automorphy.
- **Proposal.** Add GL2AutomorphicRepresentationsAndTransfer:R17.4a 'Non-normal cubic base change and the Gelbart–Jacquet lift' between R17.4 and R17.5, holding adjoint-lift, cubic-character-induction, gl3-recognition and nonnormal-cubic-base-change. Its requires are R17.4, AutomorphicLFunctionsAndLocalFactors:AL.3, AutomorphicLFunctionsAndLocalFactors:AL.3b and MetaplecticAutomorphicForms:MP.5 (Gelbart–Jacquet's Shimura integral on the metaplectic cover); its consumer is R17.5. Until the stage exists these nodes realise R17.4. AL.3b is the GL_n converse theorem for all n (requires AL.3; consumers R17.4a and R16.5); R16.5 states its n=2 instance separately with its own hypotheses. After the split the non-normal cubic part of the R17.4 → AutomorphicGaloisRepresentations:R19.2 export becomes R17.4a → R19.2. Carayol's extraordinary dyadic comparison (his §12.2.2 Proposition) is owned by AutomorphicGaloisRepresentations R19.2, which imports R17.4/R17.4a and R17.5 (accepted RT-AREA-langlands-2/4 fix); this packet does not plan it.

## Layer links and interface exports recorded by part R17.3

Part R17.3 records the layer links its nodes use, and the node sets it exports to named consumers. Promotion draws cross-roadmap stage edges from node prerequisites; these records document the intent.

| Source layer | Target layer | Reason |
|---|---|---|
| `GL2AutomorphicRepresentationsAndTransfer:R16.4` | `GL2AutomorphicRepresentationsAndTransfer:R17.3` | RT-AREA-automorphic-1/11: JL uniqueness and rational Hecke comparison. |
| `GL2AutomorphicRepresentationsAndTransfer:R16.5` | `GL2AutomorphicRepresentationsAndTransfer:R17.5` | RT-AREA-automorphic-1/11: full GL₂ converse specialization used by the Artin proof. |
| `GL2AutomorphicRepresentationsAndTransfer:R16.6` | `GL2AutomorphicRepresentationsAndTransfer:R17.5` | RT-AREA-automorphic-1/11: Q and totally real weight-one dictionary. |
| `GL2AutomorphicRepresentationsAndTransfer:R17.3` | `HilbertModularVarietiesAndShimuraCurves:R18.3` | RT-AREA-automorphic-1/12: export transfer to quaternionic/Hilbert forms, then R18.4; no reverse geometric dependency. |
| `GL2AutomorphicRepresentationsAndTransfer:R17.4` | `AutomorphicGaloisRepresentations:R19.2` | RT-AREA-langlands-2/4: cyclic and non-normal cubic transfer for Carayol/Saito; R19.4–R19.5 consume through R19.2. After the R17.4a split the non-normal cubic part becomes R17.4a → R19.2. |
| `GL2AutomorphicRepresentationsAndTransfer:R17.5` | `AutomorphicGaloisRepresentations:R19.2` | RT-AREA-langlands-2/4 (accepted fix, item 1): Carayol §12.2.3 and §11.2 import tetrahedral and octahedral Artin automorphy, Tunnell's globalisation of primitive local representations and automorphic induction with prescribed local components from R17.5. AutomorphicGaloisRepresentations R19.2 owns the extraordinary comparison itself. |

- **To HilbertModularVarietiesAndShimuraCurves:R18.3–R18.4.** Analytic transfer and spectra here; integral Hecke modules, level geometry and cohomology there. Nodes: [`R17.3/global-jl`](#R17-3-global-jl), [`R17.3/split-hecke`](#R17-3-split-hecke), [`R17.3/definite-infinity`](#R17-3-definite-infinity), [`R17.3/indefinite-parity`](#R17-3-indefinite-parity), [`R17.3/invariant-exchange`](#R17-3-invariant-exchange).
- **To AutomorphicGaloisRepresentations:R19.2, R19.4–R19.5.** Cyclic and non-normal cubic transfer, Artin automorphy, Tunnell's globalisation and prescribed-local induction here; Carayol's extraordinary comparison (R19.2/carayol-cubic-base-change-of-extraordinary), attached Galois representations and the Carayol/Saito theorems there. Nodes: [`R17.4/local-compatibility`](#R17-4-local-compatibility), [`R17.4/nonnormal-cubic-base-change`](#R17-4-nonnormal-cubic-base-change), [`R17.5/tetrahedral-artin`](#R17-5-tetrahedral-artin), [`R17.5/octahedral-artin`](#R17-5-octahedral-artin), [`R17.5/tunnell-primitive-globalization`](#R17-5-tunnell-primitive-globalization), [`R17.5/prescribed-local-induction`](#R17-5-prescribed-local-induction).
- **To PotentialModularityAndCompatibleSystems:R23–R24; ClassicalSerreModularity:R33.5.** Exact conditional transfer and residual solvable cases here; geometric existence, weight lowering and general modularity lifting there. Nodes: [`R17.6/qualitative-residual-modularity`](#R17-6-qualitative-residual-modularity), [`R17.6/weight-two-witness`](#R17-6-weight-two-witness), [`R17.6/disjoint-irreducibility`](#R17-6-disjoint-irreducibility), [`R17.6/compatible-base-change`](#R17-6-compatible-base-change), [`R17.6/compatible-descent`](#R17-6-compatible-descent).

## The pinned libraries

Both parts were checked against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration below was read in its source file at those commits. The table merges the two parts’ lists; where both parts cite a declaration, both descriptions are given.

| Declaration | Kind | Module | What it provides | Checked |
|---|---|---|---|---|
| `mathlib:Matrix.GeneralLinearGroup` | abbrev | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | (R16.1) Existing unit group of square matrices over a semiring; GL₂ uses Fin 2, without a second group carrier. (R17.3) GL(n,R) is the existing unit group of square matrices; the Satake computation uses GL(Fin 2,K), not a new matrix group. | (R16.1) Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. (R17.3) Full statement read in the pinned source tree on 2026-10-06. |
| `mathlib:Matrix.GeneralLinearGroup.det` | def | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | (R16.1) Multiplicative determinant to R units over a commutative ring. (R17.3) Multiplicative determinant GL(n,R) → R units, for a commutative ring. | (R16.1) Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. (R17.3) Full statement read in the pinned source tree on 2026-10-06. |
| `mathlib:Matrix.GeneralLinearGroup.scalar` | def | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | Scalar matrices form a monoid homomorphism R units → GL(n,R). | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `mathlib:Matrix.GeneralLinearGroup.det_scalar` | theorem | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | The determinant of scalar u is u to the cardinality of n; in rank two it is u squared. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `mathlib:Matrix.GeneralLinearGroup.map` | def | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | (R16.1) A ring homomorphism induces the coefficient map on GL(n,R). (R17.3) Coefficient ring maps induce multiplicative maps of existing general linear groups. | (R16.1) Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. (R17.3) Full statement read in the pinned source tree on 2026-10-06. |
| `mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero` | def | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | Builds a matrix unit over a field from a nonzero determinant; used for explicit unipotents and diagonals. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `mathlib:Representation` | abbrev | `Mathlib/RepresentationTheory/Basic.lean` | A representation is a monoid homomorphism into linear endomorphisms, over a semiring and module. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `mathlib:Representation.invariants` | def | `Mathlib/RepresentationTheory/Invariants.lean` | The submodule of vectors fixed by every element of a group; subgroup invariants are restriction to that subgroup. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `mathlib:Representation.mem_invariants` | theorem | `Mathlib/RepresentationTheory/Invariants.lean` | Membership is equivalent to the pointwise fixed-vector equations, with CommRing coefficients and group action. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `mathlib:MeasureTheory.Measure.haarMeasure` | def | `Mathlib/MeasureTheory/Measure/Haar/Basic.lean` | Existing Haar measure normalized on a positive compact; does not provide an automorphic quotient measure. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `mathlib:MeasureTheory.Measure.haarMeasure_self` | theorem | `Mathlib/MeasureTheory/Measure/Haar/Basic.lean` | The chosen positive compact has Haar mass one. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `tauceti:HeckeRing.GL2.Newform` | structure | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` | Existing normalized new cusp form at Γ₁(N), nebentypus and eigenvalues only away from level, new subspace membership and first Fourier coefficient one. Bad-prime eigenconditions are not fields. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `tauceti:HeckeRing.GL2.Newform.qExpansion_coeff_one` | theorem | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` | The first q-expansion coefficient of a bundled newform equals one. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` | theorem | `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean` | At fixed positive level, weight and nebentypus, equality of every good-index eigenvalue outside a finite set gives equality of newforms. This is a classical fixed-level result, not number-field adelic multiplicity one. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `tauceti:CuspForm.LSeries_qExpansion_coeff_eq` | theorem | `TauCeti/NumberTheory/ModularForms/LFunction.lean` | For positive weight and Re(s)>k/2+1 the q-coefficient Dirichlet series equals strict cusp width to −s times ModularForm.L; width one gives direct equality. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `tauceti:TauCeti.symPowerRep` | abbrev | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean` | Existing d-th symmetric power of the standard GL(n,k) representation on Sym[k]^d(k^n), over a commutative ring. | Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. |
| `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff` | theorem | `TauCeti/RepresentationTheory/Induction/Mackey/LinearCharacter.lean` | (R16.1) For a finite group, normal subgroup and algebraically closed characteristic-zero coefficients, a linear character induces simply iff each element outside the subgroup changes it under conjugation. The arbitrary Weil-character reduction is requested separately. (R17.3) For a finite group G, a normal subgroup N and a linear character χ of N over an algebraically closed field of characteristic zero, the induced representation Ind_N^G χ is simple iff for every s ∉ N some x ∈ N has χ(sxs⁻¹) ≠ χ(x). On a finite Galois quotient with N of index two this is the criterion θ ≠ θ^σ. It needs characteristic zero, so it does not cover residual characteristic two. | (R16.1) Full declaration and section hypotheses read at the pinned commit on 2026-10-07. Tau Ceti statements read with git show; Mathlib source tree is at the exact pin. Independently reread and scope-confirmed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1. (R17.3) Statement and section hypotheses ([Finite G] [IsAlgClosed k] [CharZero k]) read at the pinned commit f790474 on 2026-10-06 by the review. |
| `mathlib:Matrix.ProjGenLinGroup` | def | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean` | PGL(n,R) is the existing quotient of GL(n,R) by its center, with its group instance; no replacement projective matrix group. | Full statement read in the pinned source tree on 2026-10-06. |
| `mathlib:Matrix.ProjGenLinGroup.mk` | def | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean` | The canonical group homomorphism GL(n,R) → PGL(n,R), used to state arithmetic lifting on the existing carrier. | Full statement read in the pinned source tree on 2026-10-06. |
| `tauceti:TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` | theorem | `TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean` | A projective action with zero factor-set cohomology class is a scalar rescaling of a linear homomorphism. This does not assert arithmetic obstruction vanishing or continuity. | Full statement read in the pinned source tree on 2026-10-06. |
| `tauceti:TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two` | theorem | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Solvable.lean` | GL₂(F) is not solvable if F contains a nonzero a with a²≠1; it does not prove an Artin modularity theorem. | Full statement read in the pinned source tree on 2026-10-06. |

## Source ledger

The source records of both parts, with editions, addresses, SHA-256 hashes and the sections read. Where the parts recorded the same source id with different files, both records are kept and the node entries link the file their part used.

### `jl70`

- Part R16.1: Hervé Jacquet and Robert P. Langlands, *Automorphic forms on GL(2)*. LNM 114 (1970), IAS retypeset editorial PDF (2026); locators use printed section pagination in this PDF. <https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf> SHA-256 `ede21b1b303d3a398eb0b9057716c4b293bafe39eba118fd9b6a871eab6f2dcf`. Accessed 2026-10-07.
  - Read: §2 Kirillov theory and Corollary 2.19 (printed p. 40); §3 principal-series/spherical formulas.
  - Read: §5 Lemmas 5.6–5.7, real modules and archimedean character factors on printed pp. 96–97; §6 Lemma 6.1 and complex classification discussion.
  - Read: §10 Definition 10.2 and cuspidality; §11 Theorem 11.1, Proposition 11.1.1 and Theorem 11.3, pp. 180–187
  - Read: §15 Theorem 15.1 and character discussion; §16 Theorem 16.1 and local functions on pp. 268–270. The introductory warning that §16 is a sketch is retained.
- Part R17.3: Hervé Jacquet and Robert P. Langlands, *Automorphic forms on GL(2)*. Lecture Notes in Mathematics 114 (1970), author scan. <https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf> SHA-256 `bfd16d259d2816210cff67aa835b8f1fe886d3716ad909ca221d8b2686c379f3`. Accessed 2026-10-06.
  - Read: §12, Proposition 12.1 and Theorem 12.2 with the preceding local discussion, pp. 205–207
  - Read: §14, Theorems 14.2 and 14.4; §15, Theorem 15.1; §16, Theorem 16.1 and the paragraph following it

### `casselman73`

- Part R16.1: William Casselman, *On some results of Atkin and Lehner*. Math. Ann. 201 (1973), 301–314, public Göttingen scan. <https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf> SHA-256 `7f91ebae1a8f5e695800f4afb9fc06d0e2ea0b3a476751a31a7c8c3f38ad537d`. Accessed 2026-10-07.
  - Read: Printed pp. 301–308 viewed as images: §1 Theorem 1, proof in supercuspidal/principal/special cases, Corollary to the Proof and epsilon remark; §2 Theorem 2 and proof; start of §3.

### `nt26`

- Part R16.1: James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*. Annals 203 (2026); arXiv 2212.03595v2 author version. <https://arxiv.org/pdf/2212.03595v2> SHA-256 `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c`. Accessed 2026-10-07.
  - Read: §1.2 pp. 7–8, geometric Artin convention and rec versus recᵀ
  - Read: §2 Lemma 2.1 non-CM hypothesis (p. 9), Definition 2.4 and following supercuspidality paragraph (p. 11).

### `dlb17`

- Part R16.1: Gabriel Dospinescu and Arthur-César Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*. Annals 186 (2017); arXiv 1509.00606v2. <https://arxiv.org/pdf/1509.00606v2> SHA-256 `bdf8f14fb4bfb4fe43980fdbff088b33469a16a9c0260616a0630de48de8cd68`. Accessed 2026-10-07.
  - Read: §5 proof of Theorem 5.5, minimal type and Henniart invocation, pp. 26–27
  - Read: §12 pp. 61–64 classical scalar-extension Kirillov model and footnote 52 fixed-central-character projectivity.

### `bm02`

- Part R16.1: Christophe Breuil, Ariane Mézard; appendix by Guy Henniart, *Multiplicités modulaires et représentations de GL₂(ℤp) et de Gal(Q̄p/Qp), Appendix: Sur l’unicité des types pour GL₂*. Duke 115 (2002), author manuscript. <https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf> SHA-256 `ec42c9a450a7f7368a72670a3e9c54b75cad77802f18ac08d4dac6078bf7fa02`. Accessed 2026-10-07.
  - Read: Henniart Appendix A.1.3–A.1.6 pp. 74–76 and A.3 supercuspidal cases, including minimal/twisted types.

### `cdt99`

- Part R16.1: Brian Conrad, Fred Diamond and Richard Taylor, *Modularity of certain potentially Barsotti–Tate Galois representations*. JAMS 12 (1999), author manuscript. <https://math.stanford.edu/~conrad/papers/cdtmaster.pdf> SHA-256 `e9dac063b9db6fd7b34e79907ce09095688b1fd8b1ea48c8527797b6090ae91c`. Accessed 2026-10-07.
  - Read: §4.2 pp. 16–18, Lemma 4.2.4(3); §5.1 pp. 18–19, σS,p and Lemma 5.1.1.

### `cg18`

- Part R16.1: Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*. Inventiones (2018), author PDF. <https://math.uchicago.edu/~fcale/papers/CG.pdf> SHA-256 `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5`. Accessed 2026-10-07.
  - Read: §3.9.2 construction of Wσx from CDT §5 and final multiplicity-one remark using CDT Lemma 4.2.4(3).

### `cg20`

- Part R16.1: Frank Calegari and David Geraghty, *Modularity lifting for non-regular symplectic representations*. Duke (2020), author published PDF. <https://math.uchicago.edu/~fcale/papers/Siegel.pdf> SHA-256 `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5`. Accessed 2026-10-07.
  - Read: §1.3 printed pp. 805–806: GL₂ characteristic-zero oldform remark and integral contrast.

### `bcgp21`

- Part R16.1: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. Publ. Math. IHÉS (2021), published PDF. <https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf> SHA-256 `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`. Accessed 2026-10-07.
  - Read: §2.4.14–2.4.15 printed pp. 178–179, GL₂ Hecke operators, center and spherical projection.
- Part R17.3: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. Publications Mathématiques de l’IHÉS 134 (2021), published PDF. <https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf> SHA-256 `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`. Accessed 2026-10-06.
  - Read: Proposition 10.1.3 and proof pp. 473–475; Theorem 10.2.6 and proof pp. 480–481

### `hkp10`

- Part R16.1: Thomas Haines, Robert Kottwitz and Amritanshu Prasad, *Iwahori–Hecke algebras*. J. Ramanujan Math. Soc. 25 (2010), author April 2009 version. <https://www.math.umd.edu/~tjh/IHA.apr.09.pdf> SHA-256 `2b098f6145e8e990778a7a59791a2616bf531ae35ced2f25a156fca735502ffe`. Accessed 2026-10-07.
  - Read: §1–2 Bernstein algebra conventions and §4.6, equation (4.6.1), center/Satake compatibility.

### `aky22`

- Part R16.1: Hiraku Atobe, Satoshi Kondo and Seidai Yasuda, *Local newforms for the general linear groups over a non-archimedean local field*. Forum Math. Pi (2022); arXiv 2110.09070v4. <https://arxiv.org/pdf/2110.09070v4> SHA-256 `32326ab828c5cfb524cfb479e337fdd9834496cd9ec39409266c281c49883a6c`. Accessed 2026-10-07.
  - Read: §1.2 printed pp. 3–4: K(n,λ), conductor and generic λ=(0,…,0,cπ); rank-two comparison.

### `cdn20`

- Part R16.1: Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*. JAMS 33 (2020), published PDF. <https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf> SHA-256 `db810ee0b4017eba2f30801c8cc76df6d61f3b32a6ef07cb891586e4121f0a16`. Accessed 2026-10-07.
  - Read: §5.2.1 printed pp. 347–348: quaternion pair, local identifications and weight-two archimedean representation.
- Part R17.3: Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*. Author final GPW5; published JAMS 33 (2020), 311–362; locators below use author pagination. <https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf> SHA-256 `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776`. Accessed 2026-10-06.
  - Read: §5.2.1 pp. 43–44 (setting of E, ∞₀, B̌, B; σ₂; Π̌ ∈ SD_{2,n}; footnote 21); Proposition 5.2 and its proof pp. 44–45

### `cdn23`

- Part R16.1: Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*. Forum Math. Pi (2023), published PDF. <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf> SHA-256 `b007a4e37b824ca5986ac6152ed9fabcf38dde97e16d8f5f7f60756fe77d3418`. Accessed 2026-10-07.
  - Read: §4.1.2–4.1.3 printed pp. 38–40: swapped invariants, equation (4.6), auxiliary place and level.
- Part R17.3: Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*. Forum of Mathematics, Pi 11 (2023), e16, published PDF with download stamp. <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf> SHA-256 `b007a4e37b824ca5986ac6152ed9fabcf38dde97e16d8f5f7f60756fe77d3418`. Accessed 2026-10-06.
  - Read: §4.1.1–4.1.2 pp. 37–39, hypotheses on E, invariant exchange and auxiliary place; §4.1.3 only the away-place Hecke convention

### `pan26`

- Part R16.1: Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*. Annals 203 (2026); arXiv 2209.06366 public version accessed 2026-10-07. <https://arxiv.org/pdf/2209.06366> SHA-256 `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`. Accessed 2026-10-07.
  - Read: §5.4.11 p. 71: quaternionic coefficients and norm quotient; §5.5.5 pp. 75–76: Hecke spectrum and Jacquet–Langlands.
- Part R17.3: Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*. arXiv:2209.06366v1; published Annals 203 (2026), 121–281; only v1 used for locators. <https://arxiv.org/pdf/2209.06366v1> SHA-256 `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`. Accessed 2026-10-06.
  - Read: Definition 5.4.11 and its paragraph on norm-factor forms; §5.5.5 pp. 75–76, quaternionic/classical Hecke spectra and k=0 exception

### `converse`

- Part R16.1: James W. Cogdell, *Piatetski-Shapiro’s work on converse theorems*. Author survey, 2013. <https://people.math.osu.edu/cogdell.1/PSCT-www.pdf> SHA-256 `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe`. Accessed 2026-10-07.
  - Read: §2 pp. 5–6 convergence, central character and nice twists; §3 Theorem 3.1 and spectral inversion.
- Part R17.3: James W. Cogdell, *Piatetski-Shapiro’s work on converse theorems*. Author survey (2013), by a coauthor of the converse theorems. <https://people.math.osu.edu/cogdell.1/PSCT-www.pdf> SHA-256 `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe`. Accessed 2026-10-06.
  - Read: §1 Theorem 1.1 and §2 hypotheses and twisting sets pp. 5–6
  - Read: §3 Theorems 3.1–3.3 pp. 6–9 and list of applications (iv)–(v) p. 10
  - Read: References [24], [33], [36] p. 19

### `langlands80`

- Part R16.1: Robert P. Langlands, *Base change for GL(2)*. Annals Studies 96 (1980), author Digital Math Archive version. <https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf> SHA-256 `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab`. Accessed 2026-10-07.
  - Read: §4 Lemmas 4.5–4.8 and split-place norm, pp. 24–25
  - Read: §10 opening spectral decomposition and analytical caveat; §11 opening comparison and quadratic exceptional principal-series contribution.
- Part R17.3: Robert P. Langlands, *Base change for GL(2)*. Annals of Mathematics Studies 96 (1980), Digital Math Archive text. <https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf> SHA-256 `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab`. Accessed 2026-10-06.
  - Read: Introduction p. 4 (dihedral case)
  - Read: §2 properties (A)–(G)
  - Read: §3 pp. 15–20: definitions of π(ρ), Lemmas 3.1–3.2, tetrahedral argument and Theorem 3.3, octahedral discussion and Theorems 3.4–3.5
  - Read: §11, Propositions 11.4–11.5, Lemmas 11.6–11.8 and verification of (A)–(G), text pp. 144–152

### `ac89`

- Part R16.1: James Arthur and Laurent Clozel, *Simple algebras, base change, and the advanced theory of the trace formula*. Annals Studies 120 (1989), public Clay scan. <https://www.claymath.org/library/cw/arthur/pdf/30.pdf> SHA-256 `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737`. Accessed 2026-10-07.
  - Read: Chapter 1 §3 Proposition 3.1 and measure conventions, pp. 20–22
  - Read: Chapter 1 §4 opening unramified spherical transfer statement p. 32.
- Part R17.3: James Arthur and Laurent Clozel, *Simple algebras, base change, and the advanced theory of the trace formula*. Annals of Mathematics Studies 120 (1989), Clay scan. <https://www.claymath.org/library/cw/arthur/pdf/30.pdf> SHA-256 `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737`. Accessed 2026-10-06.
  - Read: Chapter 3 §1 Definitions 1.1–1.2 and (1.1); §3 Theorem 3.1; §4 Theorem 4.2 and Proposition 4.4; §5 Theorem 5.1; §6 Definition 6.1 and Theorem 6.2, printed pp. 199–216

### `getz15`

- Part R16.1: Jayce R. Getz, *An introduction to automorphic representations*. Author-hosted course notes, 13 March 2015 (89 pages). <https://sites.math.duke.edu/~jgetz/aut_reps.pdf> SHA-256 `e52f7da0685c7e330f096b3f23beaf8832972067d191f77e3c05ac3113fff0ac`. Accessed 2026-10-07.
  - Read: §6.4–6.5, printed pp. 32–34: holomorphic adelization for k≥1, corrected Casimir and full-O(2) limit module at k=1.

### `cogdell-fields`

- Part R16.1: James W. Cogdell, *Lectures on L-functions, converse theorems, and functoriality for GL(n)*. Fields Institute lecture notes, author-hosted PDF; printed pagination retained. <https://people.math.osu.edu/cogdell.1/fields-www.pdf> SHA-256 `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7`. Accessed 2026-10-07.
  - Read: Theorem9.3 and proof, printed pp.74–75 (PDF pp.78–79), including the omitted finite and archimedean factors and the Rankin–Selberg pole criterion.

### `br10`

- Part R17.3: Alexandru Ioan Badulescu, with an appendix by David Renard, *Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence*. Author preprint of Compositio Math. 146 (2010), 1115–1164; preprint page = PDF page. <https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf> SHA-256 `dc3aad1d249fda35f40f33f7b688537f226e509ed6879fe36dd5d07a15839c88`. Accessed 2026-10-06.
  - Read: §1.5 pp. 5–7; §18.1 pp. 44–45, including the trace-comparison proof reduction

### `gj78`

- Part R17.3: Stephen Gelbart and Hervé Jacquet, *A relation between automorphic representations of GL(2) and GL(3)*. Ann. Sci. ÉNS (4) 11 (1978), 471–542, published Numdam scan. <https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf> SHA-256 `319347503f91fe22bec22ce7519b9ebaf09921ec4de8756c51d155864b4fc16a`. Accessed 2026-10-06.
  - Read: Introduction pp. 471–473
  - Read: §3.1–3.7 pp. 485–491 (Definition 3.1.3, Propositions 3.2–3.3, §3.6–3.7)
  - Read: Theorem 8.1 p. 496
  - Read: §9.1–9.8 and Theorem 9.3 pp. 531–541
  - Read: Remark 9.9 p. 541

### `patrikis`

- Part R17.3: Stefan Patrikis, *Variations on a theorem of Tate*. Author revision, 31 July 2016, submitted memoir version. <https://people.math.osu.edu/patrikis.1/variationsrevision.pdf> SHA-256 `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81`. Accessed 2026-10-06.
  - Read: §2.1 Theorem 2.1.1 and proof, printed pp. 17–18; Proposition 2.1.4, its proof and Remark 2.1.5, printed p. 19; §2.3 Lemmas 2.3.1 and 2.3.6 and the proof of 2.3.6, printed pp. 28–31 (PDF page = printed page + 4)

### `carayol86`

- Part R17.3: Henri Carayol, *Sur les représentations l-adiques associées aux formes modulaires de Hilbert*. Ann. Sci. ÉNS (4) 19 (1986), 409–468, published Numdam scan. <https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf> SHA-256 `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8`. Accessed 2026-10-06.
  - Read: §12.1.1–12.1.4 pp. 454–457 (finite subgroups, Sylow-2 subgroups, Lemma 12.1.3 and proof)
  - Read: §12.2.1–12.2.3 pp. 457–458 (cubic base change recollection (a)–(b), Proposition 12.2.2, Remark, proof)
  - Read: §12.3.1–12.3.2 pp. 458–459
  - Read: Bibliography p. 468 ([J.P.S.S.], [Ku], [L.2], [Tu.1], [Tu.2])

### `rt97`

- Part R17.3: David E. Rohrlich and Jerrold B. Tunnell, *An elementary case of Serre’s conjecture*. Pacific J. Math. 181, special issue (1997), 299–309, published PDF. <https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf> SHA-256 `fe131f6cff026c25c65727d6675d1bea9233f91bd1d0d7947587b491cf22d3b9`. Accessed 2026-10-06.
  - Read: Entire paper, printed pp. 299–309 (PDF pp. 1–11, PDF page k = printed page 298+k): introduction pp. 299–300; §1 notation, Deligne–Serre application and conductor pp. 300–301, Lemma p. 302, proof pp. 302–306; §2 dihedral representations and cases (i)–(iv) p. 306, ν and Theorem p. 307, proof pp. 307–308, Remarks 1–3 p. 308

### `wiese04`

- Part R17.3: Gabor Wiese, *Dihedral Galois representations and Katz modular forms*. Documenta Mathematica 9 (2004), 123–133, published PDF. <https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf> SHA-256 `1dcd4bb30b64a19cb1335a7442b6704ff9c0a3dd0ad96d97d6b37a04d0aa3b06`. Accessed 2026-10-06.
  - Read: Whole paper read (printed pp. 123–133 = PDF pp. 1–11): Introduction and Theorem 1, pp. 123–125; §2 Lemmas 2–3 and proofs, pp. 125–127; §3 Proposition 4, Corollary 5, Definition 6, Proposition 7, Corollary 8, pp. 127–130; §4 Theorems 9–10 and proof of Theorem 1, pp. 130–132; §5 Lemma 11 and Proposition 12, p. 132

### `rt83`

- Part R17.3: Jonathan D. Rogawski and Jerrold B. Tunnell, *On Artin L-functions associated to Hilbert modular forms of weight one*. Invent. Math. 74 (1983), 1–42, GDZ article scan (43 PDF pages: cover + pp. 1–42), read through the GDZ OCR pages gdzocr/PPN356556735_0074/00000007–00000048 and page images. <https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf> SHA-256 `6a020942a4a0acfb5e2301de3bfd75f3ac9d05c21c8960c706c94a1e81d9c8b1`. Accessed 2026-10-06.
  - Read: Introduction pp. 1–3; §1 definitions of π_k and of holomorphic weight k, p. 4; §4 strong Artin conjecture and its solvable case, pp. 40–41

### `ds74`

- Part R17.3: Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*. Ann. Sci. École Norm. Sup. (4) 7 (1974), 507–530, published Numdam scan. <https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf> SHA-256 `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc`. Accessed 2026-10-06.
  - Read: §4(a)–(c): Théorème 4.1, Remarques 4.3–4.5, Théorème 4.6 and proof, Théorème 4.10 (Weil–Langlands) and Remarques 4.11–4.13, printed pp. 513–517

### `tunnell81`

- Part R17.3: Jerrold Tunnell, *Artin's conjecture for representations of octahedral type*. Bull. Amer. Math. Soc. (N.S.) 5 (1981), no. 2, 173–175 (research announcement); AMS PDF with OCR text layer. <https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf> SHA-256 `fc276270d09ea11b98d750deeba26193e07d5aac2d30ffe16dbf0f7f576ffc5c`. Accessed 2026-10-06.
  - Read: Whole note, pp. 173–175: definition of π(ρ), statement of the JPSS theorem [4], field diagram, Lemma with proof, Theorem with proof, references; page images checked against the OCR text

### `jpss79`

- Part R17.3: Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, *Automorphic forms on GL(3). II*. Ann. of Math. (2) 109 (1979), 213–258; scan on H. Jacquet's Columbia page without text layer (visual transcription of pp. 253–255 kept as scratch/src/jpss79/jpss79.txt). <https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf> SHA-256 `0cf1baf41a6279cd1f78b44b0e6d3ff0ed71f7b9b54b55de28210b9f02a293f7`. Accessed 2026-10-06.
  - Read: §14.2, Theorem (14.2), its proof and the remark on monomial representations, printed pp. 253–255 (visual reading); Part I, Introduction pp. 169–172, for the location of (13.6) and (14.2)

### `tunnell78`

- Part R17.3: Jerrold B. Tunnell, *On the local Langlands conjecture for GL(2)*. Inventiones Mathematicae 46 (1978), 179–200; GDZ scan of the article (LOG_0017 of PPN356556735_0046, 23 pages including a GDZ cover sheet, so PDF page = printed page − 177), read with the GDZ OCR pages 00000185–00000206 and against the page images of pp. 182–183. <https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf> SHA-256 `9f3e94853253589ac99f0b8ba5e67e90b6f33a581857a4f6083f92d6375ce066`. Accessed 2026-10-06.
  - Read: Introduction (property (*), Theorems A–C), printed pp. 179–180; §1, Theorems 1.1–1.3, the proof of Theorem 1.3 and of Theorem A, pp. 181–183; §2 opening (property (*), base-change facts (2.1.1)–(2.1.2)), p. 183; references, p. 200

### `ddt`

- Part R17.3: Henri Darmon, Fred Diamond and Richard Taylor, *Fermat's Last Theorem*. Author version dated September 9, 2007 (167 pp., printed page = PDF page) of the article in Elliptic Curves, Modular Forms & Fermat's Last Theorem (Hong Kong, 1993), International Press, 1997, 2–140; theorem numbers as in this version. <https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf> SHA-256 `254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3`. Accessed 2026-10-06.
  - Read: Introduction, pp. 11–12 (Artin representations and the Langlands–Tunnell theorem; mod ℓ representations); §3.1, Theorem 3.3 and Remarks 3.4–3.6, pp. 87–88; §3.2, Conjecture 3.7 to Theorem 3.14 with the sketch of proof, pp. 88–90

### Recorded source versions

- Part R16.1: Symmetric power functoriality for Hilbert modular forms; Annals 203 (2026); arXiv 2212.03595v2 author version (preprint), <https://arxiv.org/pdf/2212.03595v2>, read 2026-10-07, SHA-256 `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c`.
- Part R16.1: Modularity lifting for non-regular symplectic representations; Duke (2020), author published PDF (published), <https://math.uchicago.edu/~fcale/papers/Siegel.pdf>, read 2026-10-07, SHA-256 `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5`.
- Part R16.1: Abelian surfaces over totally real fields are potentially modular; Publ. Math. IHÉS (2021), published PDF (published), <https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf>, read 2026-10-07, SHA-256 `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`.
- Part R16.1: Author-hosted course notes, 13 March 2015 (89 pages) (author copy), <https://sites.math.duke.edu/~jgetz/aut_reps.pdf>, read 2026-10-07, SHA-256 `e52f7da0685c7e330f096b3f23beaf8832972067d191f77e3c05ac3113fff0ac`.
- Part R17.3: Rohrlich–Tunnell, Pacific J. Math. 181 special issue (1997), 299–309. (published), <https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf>, read 2026-10-06, SHA-256 `fe131f6cff026c25c65727d6675d1bea9233f91bd1d0d7947587b491cf22d3b9`.
- Part R17.3: Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2). IAS retypeset edition of LNM 114 (compiled 19 July 2023); printed pages differ from the Springer volume, which was not collated. (author copy), <https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf>, read 2026-10-06, SHA-256 `bfd16d259d2816210cff67aa835b8f1fe886d3716ad909ca221d8b2686c379f3`.
- Part R17.3: James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula. Annals of Math. Studies 120 (1989), Clay Mathematics Institute scan of the published book; theorem statements checked on page images. (published), <https://www.claymath.org/library/cw/arthur/pdf/30.pdf>, read 2026-10-06, SHA-256 `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737`.
- Part R17.3: Robert P. Langlands, Base change for GL(2). Digital Math Archive retypeset text of Annals of Math. Studies 96 (1980); its running-head pages are not those of the printed volume. (author copy), <https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf>, read 2026-10-06, SHA-256 `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab`.
- Part R17.3: Gabor Wiese, Dihedral Galois representations and Katz modular forms. Documenta Math. 9 (2004), 123–133, EMIS mirror of the published article; compared with arXiv:math/0402163v1 and the author's 2005 thesis. (published), <https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf>, read 2026-10-06, SHA-256 `1dcd4bb30b64a19cb1335a7442b6704ff9c0a3dd0ad96d97d6b37a04d0aa3b06`.
- Part R17.3: Jerrold Tunnell, Artin's conjecture for representations of octahedral type. Bull. Amer. Math. Soc. (N.S.) 5 (1981), 173–175, AMS PDF of the published note. (published), <https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf>, read 2026-10-06, SHA-256 `fc276270d09ea11b98d750deeba26193e07d5aac2d30ffe16dbf0f7f576ffc5c`.

## Records of the parts

### Part R16.1

- **Packet.** `research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R16.1.json`, status `complete`, scope `R16.1`, `R16.2`, `R16.3`, `R16.4`, `R16.5`, `R16.6`, `R17.1`, `R17.2`, 55 nodes.
- **Summary.** Target-level plan for the GL₂ local formulas, global multiplicity and analytic recognition, classical/cohomological comparisons, quaternionic local transfer and concrete trace matching. Extends the upstream modular-forms roadmap through generic supplier interfaces. All eight stages are covered; source and signature gaps are recorded, and no implementation is claimed.
- **Extension.** Parent `tauceti:TauCetiRoadmap/ModularForms`, title “Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer”. Classical primitive forms, Hecke theory and their L-functions are imported from upstream. The added material is the local/global representation and transfer extension, not a second classical roadmap.
- **Independent review.** `independent-review-REV-GL2AutomorphicRepresentationsAndTransfer--R16.1`, 2026-10-07, verdict **accepted**. Independent target-level review of all 55 nodes, 17 pinned baseline declarations, 48 API items, 37 tests, 42 planets, 19 public sources, eight stage targets and RT-AREA-automorphic-1/2, /9, /14 with accepted RS-21 ownership. Corrected 16 nodes, added an independent newvector-level existence theorem, corrected source locators, supplier scopes and discriminating tests; confirmed all four source issues. Eight honest gaps remain; no stage is closed and no implementation is claimed. See the review report for the complete changes and required orchestrator reader synchronization.

### Part R17.3

- **Packet.** `research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json`, status `complete`, scope `R17.3`, `R17.4`, `R17.5`, `R17.6`, 57 nodes.
- **Summary.** Rank-two global quaternionic transfer, cyclic and solvable base change, the cubic/adjoint bridge for Langlands–Tunnell, arithmetic projective lifting, and characteristic-two residual modularity. Uses the accepted RS-21 ownership boundaries; every imported prerequisite has an exact request or a read supplier node. Source and Lean-interface gaps remain explicit.
- **Title.** Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer (extends `tauceti:TauCetiRoadmap/ModularForms`).
- **Restructuring basis.** RS-21, `data/restructure/RS-21.result.json`, independent-review-REV-RS-21, accepted 2026-09-29. The live accepted version supplies the title/base and ownership boundaries. The later research proposal has a pending fix review; it does not replace this accepted version.
- **Library audit.** data/library-coverage.json, reviewed AUDIT14 R16/R17 entries: Global JL, cyclic/cubic base change, automorphic induction, strong Artin automorphy and characteristic-two modularity were not built at the pins. Matrix and generic projective-lifting declarations are imported. No library result is claimed implemented by this plan.
- **Independent review.** `independent-review-REV-GL2AutomorphicRepresentationsAndTransfer--R17.3`, 2026-10-06, verdict **accepted**. Independent review by Claude (session claude-QIk6wX) of the Codex planning pass (codex-CcaPB4, PR #6723). All 15 cited sources were downloaded and their SHA-256 values matched; Rogawski–Tunnell 1983 was read through the GDZ OCR. Five public sources were added: Deligne–Serre 1974, Tunnell 1981, JPSS 1979 II, Tunnell 1978 and Darmon–Diamond–Taylor. Every node was checked against its source by stage-group checkers and merged by the reviewer. Systemic correction: 54 of the 55 excerpts were one- or two-word placeholders, and every match and hypotheses field was the same boilerplate sentence. Every node now has literal excerpts verified against the source text, a specific match and its actual hypotheses. Mathematical corrections include: the global JL domain (false for split D) restated on the discrete spectrum; Pan's weight convention; the cyclic base change statement made non-circular (local-compatibility owns the parameter restriction); the cuspidality criterion sourced to AC89 Thm 4.2(a),(b); tower independence and solvable descent marked as the packet's own arguments; Tunnell's octahedral argument (read: no GL₃ comparison beyond JPSS); Rohrlich–Tunnell's lemma, cases and theorem copied exactly; Wiese's Lemmas 2–3 and Theorem 9; BCGP's [Ser77, Thm 4] identified as Tate's theorem. Structure: R17.6/extraordinary-cubic-compatibility was removed because it duplicated AutomorphicGaloisRepresentations R19.2/carayol-cubic-base-change-of-extraordinary, which the accepted RT-AREA-langlands-2/4 fix assigns to R19.2. The link R17.6 → R19.2 was replaced by R17.5 → R19.2. Three R17.5 nodes were added: Tunnell's globalisation, prescribed-local induction (Carayol 11.2) and the octahedral mod-3 application, a required check that no node had realised. The R17.4a proposal now matches the accepted RT-AREA-automorphic-1/1 fix (AL.3, AL.3b, MP.5). Exact supplier nodes from the AF, AGR and R15 packets replace stage citations where they match, and the pinned TauCeti.simple_indFDRep_ofLinearCharacter_iff replaces InductionRestriction Layer 4. Requests were rebuilt from the prerequisites. The gaps were narrowed to exact inputs: one closed, one non-mathematical gap dropped and one added (the all-place upgrade of Artin automorphy). Ten source issues were added and E1 confirmed. Baseline: all eight declarations were read at the pins. The suggested file was revised: unramifiedBaseChange is now defined as A ^ f, every test evaluates a packet declaration, statable conditions were restored on Field.absoluteGaloisGroup, and Mackey is stated on Mathlib's Representation.ind. It elaborates with lean-check, with placeholder warnings only. The reader document is not a deliverable of this review and must be regenerated from this packet.

## What this blueprint does not claim

Every node keeps `implementationStatus: unchecked`. The suggested Lean file elaborates proposed signatures with placeholder proofs; it proves nothing, and its signatures omit the conditions that the pinned libraries cannot state, as its comments say. No layer is closed: each depends on the supplier requests and gaps listed above. Where a source’s argument is sketched or conditional (Jacquet–Langlands §16, Langlands’ analytic caveats), the node says so.
