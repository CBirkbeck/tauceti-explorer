# Independent review of HodgeStructuresPartII H.5

**Accepted as a complete target-level planning pass.** H.5 remains planned, with thirteen explicit gaps and sixteen open supplier requests. It is neither closed nor formalised.

Reviewer: Codex, session `codex-t2B5Hc`, 8 October 2026. Review job `REV-HodgeStructuresPartII--H.5`, [issue #7062](https://github.com/CBirkbeck/tauceti-explorer/issues/7062), of [BP #6943](https://github.com/CBirkbeck/tauceti-explorer/issues/6943). The blueprint author was Claude Code, session `claude-6aEErt`; this reviewer did not author the input.

The review covers the packet, reader and suggested Lean file named in the issue. All source excerpts were removed under the maintainer’s standing rule. The report and corrected statements paraphrase the mathematics and give locators. Public primary sources were read in scratch only; no book or source PDF was copied into the repository.

## Counts and scope

| Item | Input | Reviewed |
|---|---:|---:|
| Nodes | 54 | 73 |
| Definitions / constructions | 13 / 6 | 13 / 6 |
| Theorems / comparisons / applications | 30 / 3 / 1 | 30 / 3 / 1 |
| Lemmas | 1 | 20 |
| API items | 141 | 141 |
| Test specifications | 84 | 86 |
| Planets | 6 | 6 |
| Baseline references | 22 | 22 |
| Source issues | 6 | 7 |
| Gaps / requests | 10 / 15 | 13 / 16 |

Original-node verdicts: 18 verified and 36 corrected. The nineteen added nodes are justified consumed API facts, marked with this review’s job ID. No node is marked unverifiable. A verified source statement with an honestly missing proof input remains a planning node with a gap; the verdict does not assert a completed formal proof.

## Main corrections

The native rigidity predicate now includes irreducibility. The trivial rank-two representation of the trivial group distinguishes this from merely being an isolated point of the semistable quotient. The system-of-Hodge-bundles module chart now requires a finite free cotangent module: dual contractions cannot detect integrability for arbitrary modules, as the explicit torsion example in the packet demonstrates.

Integral realizations now use the base change of the fixed ℤ-group model. Principal-open localization replaces the false assertion that arbitrary nonempty opens of an affine arithmetic base are equivalent to one localization. The full differential-operator algebra is generated in order one but contains operators of every order. The elementary pullback argument for geometric origin now states density of the inverse image of its witness open.

The projective/fixed-determinant rigidity comparison uses a complete DVR, Hensel determinant roots and finite μ_r-twisting fibres. An irreducible Q₈ representation has a nontrivial self-twist with identical traces, so the printed trace inference cannot trivialize the character. This does not refute the comparison theorem. The arithmetic exhaustion proof removes the image of the closure of the complement, justified using horizontal section components and vertical remaining components.

H.2 and H.4 stage references became the matching existing fine nodes. Schmid extension is a separate gap. The geometric-origin proof chooses a variation on each isotypic support; an arbitrary local-system summand need not preserve the family’s original Hodge filtration. Haar averaging belongs to the existing CompactGroups roadmap, which supplies it through a precise request. The additional arithmetic-lattice gap records finite-extension principalization, lattice gluing and the reductive strong-approximation input.

LL24 Notation 1.10.2 is on preprint p.11, and S94II’s introductory isosingularity discussion is on printed p.8. The hypergeometric calculation is a dimension equation. The integrality planet now names cohomological rigidity, avoiding the stronger unresolved ordinary-rigidity conjecture.

## Coverage, structure and closure

The H.5 brief in the roadmap definition has the following coverage. Multi-part target results remain intact at target level; the added API nodes satisfy §4 and do not split their proofs into lemma-sized steps.

| Target | Nodes supplying it |
|---|---|
| Fixed-determinant rigidity and trace-free tangent conventions | trace-free-adjoint, betti-tangent, rigid-representation, cohomological-rigidity, prescribed-monodromy-tangent, derham-betti-tangent |
| Rigid loci and their finite sets | rigid-locus, rigid-finite, rigid-number-field, prescribed-monodromy-moduli |
| Higgs nilpotence and variations | rigid-higgs-gm-fixed, rigid-higgs-nilpotent, system-of-hodge-bundles, rigid-underlies-cvhs |
| Equivariant Hodge splitting | hodge-rigid-locus, rigid-hodge-splitting; Tannakian input remains a gap |
| Smooth arithmetic and nice models | smooth-arithmetic-model through nice-hodge-models |
| Zero graded field and unitarity | unitary-representation, zero-higgs-unitary |
| Integrality with finite determinant and boundary conditions | integral-representation, integrality-local-criterion, integrality-EG18, integrality-KP |
| Strong integrality and infinite-image unitary examples | strongly-integral, strong-integral-unitary-finite, unitary-embeddings-finite, infinite-image-unitary-example |
| Geometric and low-rank consequences | geometric-origin through rigid-sl3-geometric, fibrewise-h1-vanishing, versal-unitary-rigidity |

The local checker resolves every prerequisite. An additional recursive traversal through the other blueprint packets reached 196 nodes with no fine-node ID missing and no cycle. Terminal supplier stages remain requests or gaps, including inputs inherited from H.1/H.2/H.4. Every new API node lists its parent and the extra inputs it actually uses. Consumers now refer to those lemma IDs.

The reviewed library audit has no H.5-specific entry. Its pure Hodge layers L0, L1 and L3 are built and L2 is partly built; these finite-dimensional pure/mixed carriers do not provide variations, moduli or geometric rigidity. They are reused through the existing H.2 supplier rather than replanned. The quasi-finite scheme carrier and number-field finiteness results are reused directly. The two upstream documents consulted were HodgeStructures and RepresentationTheory/CompactGroups, with the representation-theory family index for ownership.

## Baseline statements

All entries exist at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their actual declarations and surrounding hypotheses were read at those pins. No reference was removed. Two descriptions were corrected: the nilpotence/characteristic-polynomial equivalence requires an integral domain, and the affine-transition limit lemma requires a quasi-compact diagram and supplies equality of already given maps rather than existence of descent.

| Reference | Confirmed provision / limitation |
|---|---|
| `mathlib:AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` | A proper, locally quasi-finite morphism (separated, finite type) is finite. |
| `mathlib:AlgebraicGeometry.LocallyQuasiFinite` | Morphisms whose affine-local ring maps are quasi-finite; discrete finite fibres for quasi-compact morphisms. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt` | If f is locally of finite type, {x \| f.QuasiFiniteAt x} is open (consequence of Zariski's main theorem). |
| `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteAt_iff_isOpen_singleton_asFiber` | For f locally of finite type, f is quasi-finite at x iff {x} is open in its fibre. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus` | For f: X ⟶ Y locally of finite type, the open subscheme of points at which f is quasi-finite: Esnault–Groechenig's X^rig. |
| `mathlib:AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType` | Equality descends to a later stage for two already given maps from one object of a cofiltered diagram of quasi-compact schemes with affine transition maps into a scheme locally of finite type over the base, when their composites with the limit projection agree. This declaration supplies equality only, not existence of a descended map or spreading of a family. |
| `mathlib:LieAlgebra.SpecialLinear.sl` | The special linear Lie subalgebra of Matrix n n R: the kernel of the trace. |
| `mathlib:LinearMap.isNilpotent_iff_charpoly` | For a finite free module over a commutative integral domain, an endomorphism is nilpotent iff its characteristic polynomial is X^(finrank). The domain hypothesis is essential; the complex-field consumers satisfy it. |
| `mathlib:Matrix.GeneralLinearGroup` | GL n R := (Matrix n n R)ˣ. |
| `mathlib:Matrix.trace` | The trace of a square matrix: the sum of its diagonal entries. |
| `mathlib:Matrix.unitaryGroup` | The submonoid unitary (Matrix n n α) of matrices whose star-transpose is the inverse. |
| `mathlib:NumberField.Embeddings.finite_of_norm_le` | For a number field K, the set of algebraic integers x ∈ K with ‖φ x‖ ≤ B for every embedding φ: K →+* A is finite. |
| `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one` | Kronecker: an algebraic integer all of whose conjugates have norm one is a root of unity. |
| `mathlib:Representation` | Representation k G V := G →* V →ₗ[k] V. |
| `mathlib:Representation.IsIrreducible` | A representation is irreducible if its lattice of subrepresentations is a simple order (nontrivial, no proper nonzero subrepresentation). |
| `mathlib:entry_norm_bound_of_unitary` | Every entry of a unitary matrix over an RCLike field has norm at most 1 (root namespace). |
| `mathlib:groupCohomology.H1` | H¹(G, A) := groupCohomology A 1 for A : Rep k G, computed by inhomogeneous cocycles modulo coboundaries. |
| `mathlib:groupCohomology.H1InfRes` | For a normal subgroup S ≤ G, the short complex H¹(G ⧸ S, A^S) ⟶ H¹(G, A) ⟶ H¹(S, A) (inflation and restriction), with the inflation a monomorphism. |
| `mathlib:groupCohomology.H1InfRes_exact` | The inflation–restriction short complex for H¹ is exact. |
| `tauceti:TauCeti.LocalCoefficientSystem` | A module-valued local coefficient system on a topological space: a functor from its fundamental groupoid to ModuleCat R. |
| `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation` | The monodromy representation of a local coefficient system at a base point, a Representation of the fundamental group on the fibre. |
| `tauceti:TauCeti.Matrix.isCompact_unitaryGroup` | The unitary group Matrix.unitaryGroup n 𝕜 over ℝ or ℂ is a compact subset of Matrix n n 𝕜. |

## Source verification

All twelve original PDF hashes reproduced. EG20’s publisher PDF was obtained through a public mirror with the exact recorded SHA-256; the sourceVersion identifies the published edition. The reviewer read the mathematical locators relevant to every original node, including the original six source issues, and compared the added finding with the latest public preprint. Reading statements and reductions does not mean reconstructing all deep proofs.

| Source | Independent reading relevant to this review |
|---|---|
| EG20, published Acta | Printed pp.103–109, 121–125, 131–134, 138–141, 145–146, 148, 151–153: hypotheses and reductions for the H.5 targets and source findings. |
| EG18 arXiv v3 | Mathematical text pp.1–12: moduli, tangent calculation, integrality statement and proof route. |
| EG18 published author offprint | Proposition 2.1 proof pp.4282–4283 and end of Theorem 1.1 proof p.4291; the two recorded slips persist. Only these published passages were checked. |
| EG20 arXiv v4 | Selected pp.18–19, 24, 29–30 compared for exhaustion, splitting and projective-rigidity proof findings. |
| LL24 arXiv v4 | §1.10 p.11; §4.3 p.27; §8 pp.38–41 and §9.1 pp.45–46: conventions, variation, rigidity, integrality and geometric consequences. |
| KP20 arXiv v2 | Definition 1.1 p.2; Proposition 3.1 p.5; §4 pp.8–10: reductive moduli/tangents and the local-to-global route. Later companion proofs were not reconstructed. |
| S92, published | §4 pp.44–45, 51–52, 56: Hodge systems, fixed points, rigid variations and coefficient descent. |
| S94II, published | Introduction pp.7–9 and §10 pp.67–68: completed local moduli and isosingularity. |
| S96 arXiv v1 | Lemma 7.2 p.33 and §9 pp.39–40: Rees correspondence and local-product limits. |
| LL22 arXiv v2 | §1.2 pp.3–5 and §7 pp.49–52: semistable parabolic PVHS, all-embedding finiteness and very-general rank arguments. The isomonodromy proof input remains a gap. |
| Langer14 arXiv v2 | §1 pp.2–4: operator-moduli hypotheses and base-change statement. Mixed-characteristic boundedness is not proved in this packet. |
| LS18 arXiv v3 | Introduction pp.1–4: Theorem 1.3, Corollary 1.4 and scope of the rank-three geometric construction; its long proof remains an input gap. |
| BKT13 arXiv v3 | Introduction pp.1–2 and §4 pp.9–10: all-fields finiteness, unfixed-determinant rigidity and reductions. Positivity/harmonic-map inputs remain gaps. |
| Z15 arXiv v4 | Theorem 1.3 p.2: splitting hypothesis used in the conditional Tannakian repair. The filtered-functor dictionary and theorem proof are not developed here. |

The exact URLs, full SHA-256 values and reading dates are in the corrected packet and reader. No cleared library book was needed. Bass, Platonov–Rapinchuk and other inaccessible books cited by the papers were not obtained or read; their required mathematics is recorded as missing input.

### Source-issue verdicts

- **HodgeStructuresPartII/E-H5-1: confirmed.** Proposition 4.10(c) and the two displays after it, published p.133; proof of Proposition 3.3, p.124. Confirmed the missing determinant powers, affine-line parameter in the section domain, duplicate determinant endpoint and part-label mismatch at published p.133 and p.124. These are transcription errors; the corrected mathematical statements are retained.
- **HodgeStructuresPartII/E-H5-2: confirmed.** Lemma 4.9 and its proof, published p.132. Confirmed a proof gap at published p.132: Simpson §9 gives an étale local product, which does not alone provide the global equivariant trivialization including nilpotents. The packet explicitly retains the filtered-fibre-functor/Ziegler input as a gap; this verdict does not claim a counterexample to the lemma.
- **HodgeStructuresPartII/E-H5-3: confirmed.** §1, last display of the introduction, published p.106; compare §7 p.148. Confirmed at published p.106 by comparison with §7 p.148. The scalar summand contributes H¹(X,ℂ); fixed-determinant tangent coefficients must be End⁰.
- **HodgeStructuresPartII/E-H5-4: confirmed.** §3, proof of Theorem 1.1, arXiv v3 p.12; published p.4291. Confirmed in arXiv v3 p.12 and in the author-hosted published Selecta text p.4291. The preceding transport is for End⁰, while the final displayed comparison drops the superscript.
- **HodgeStructuresPartII/E-H5-6: confirmed.** Proof of Proposition 3.3(e), published pp.124–125. Confirmed at published pp.124–125 and arXiv v4 pp.18–19. A finite map is closed on closed subsets, not arbitrary open subsets. For example Spec k[u,v,x]/(ux,x(x−v)) → Spec k[u,v] is finite, and the complement of the x=0 section has image {u=0,v≠0}, which is not closed. The horizontal/vertical component argument proves the closure avoids the generic fibre.
- **HodgeStructuresPartII/E-H5-5: confirmed.** §2, proof of Proposition 2.1, arXiv v3 pp.4–5; published pp.4282–4283. Confirmed all three slips in arXiv v3 pp.4–5 and published Selecta pp.4282–4283. Zero and full Grassmannian fibres are invariant; determinant values have order dividing d rather than r; generator j must use its own determinant value L_j.
- **HodgeStructuresPartII/E-H5-7: confirmed.** Lemma 5.5, proof, published p.140; arXiv:1707.00752v4 p.30. The printed inference fails on the explicit irreducible Q₈ self-twist above. This is a gap in the given argument; the fixed-determinant/projective rigidity equivalence is retained with a repaired proof sketch.

The published EG18 PDF has SHA-256 `19f8cea47acd6c6762e1a53e67ac58fa2be3fa70a768ec3dd547cc77826ba129` and the latest EG20 v4 PDF has SHA-256 `bcc435b58bb2b1c06869413c1cd96018676d15da8003d21e5b507b114a63c4eb`. Author publication pages and arXiv abstract pages were checked on the review date; no linked erratum was found. This search does not assert that no correction exists elsewhere.

## API, tests, suggested signatures and planets

Every definition/construction retains at least three discriminating test specifications. Rank-one, scalar-trace, characteristic-two, reducible, unipotent, boundary, determinant, nonunitary-conjugate and S-integral examples test different plausible wrong definitions. The two added tests check reducible isolated points and nontrivial self-twists. The former is an actual native example; the latter is explicitly in the omission inventory under the projective-representation specification.

The nineteen API nodes below are the consumed facts promoted under PROTOCOL §4. Their names reuse existing signatures where present, and omit the geometric cases honestly.

- `HodgeStructuresPartII:H.5/trace-splitting`: If (r : K) ≠ 0, the Γ-representation M_r(K) by conjugation is isomorphic to rep ρ ⊕ (trivial K), via A ↦ (A − (tr A / r)·1, tr A / r).
- `HodgeStructuresPartII:H.5/adjoint-projectivization`: rep ρ depends only on the composite Γ → PGL_r(K) and, when r ∈ K^×, agrees with the adjoint representation on Lie(PGL_r) = pgl_r(K).
- `HodgeStructuresPartII:H.5/adjoint-no-invariants`: If ρ is absolutely irreducible and r ∈ K^×, then the Γ-invariants of rep ρ are zero (Schur's lemma: commuting matrices are scalars, and the only trace-zero scalar is 0).
- `HodgeStructuresPartII:H.5/adjoint-base-change`: For a field embedding σ: K → L, rep (σ ∘ ρ) ≅ (rep ρ) ⊗_{K,σ} L, compatibly with the matrix entries.
- `HodgeStructuresPartII:H.5/adjoint-h1-base-change`: For finitely generated Γ and a field embedding σ: K → L, H¹(Γ, rep(σ∘ρ)) ≅ H¹(Γ, rep ρ) ⊗_{K,σ} L, in particular the dimensions agree (the cocycle space is cut out by K-linear equations in finitely many generator values).
- `HodgeStructuresPartII:H.5/rigid-locus-field-clopen`: If S = Spec K for a field K and M is of finite type, RigidLocus f is closed and open, finite over K, and its complement has no isolated points.
- `HodgeStructuresPartII:H.5/rigid-locus-fibre`: For s ∈ S, the fibre of RigidLocus f over s is the rigid locus of the fibre M_s → Spec κ(s), i.e. the isolated points of M_s.
- `HodgeStructuresPartII:H.5/rigid-locus-equivariant`: If a group acts on M and S compatibly with f, the action preserves RigidLocus f.
- `HodgeStructuresPartII:H.5/hodge-system-scaling`: For t ∈ ℂ^×, the isomorphism (E,tθ) → (E,θ) acting by t^p on E^p, i.e. (φ ⊗ id)(tθ(e)) = θ(φ(e)).
- `HodgeStructuresPartII:H.5/hodge-system-nilpotent`: θ is nilpotent with joint bound the number of nonzero degrees (HodgeStructuresPartII:H.0/joint-nilpotence).
- `HodgeStructuresPartII:H.5/unitary-conjugation`: IsUnitaryRepresentation ρ ↔ ∃ P ∈ GL_r(ℂ), ∀ γ, P ρ(γ) P⁻¹ ∈ Matrix.unitaryGroup (Fin r) ℂ.
- `HodgeStructuresPartII:H.5/unitary-invariant-form`: IsUnitaryRepresentation ρ ↔ ρ preserves a positive-definite Hermitian form on ℂ^r.
- `HodgeStructuresPartII:H.5/unitary-semisimple`: A unitary representation is semisimple (orthogonal complements of subrepresentations are subrepresentations).
- `HodgeStructuresPartII:H.5/rigid-hodge-nonzero`: M^rig_Hod ×_{𝔸¹} 𝔾_m ≅ M^rig_dR × 𝔾_m over 𝔾_m, (λ, E, D) ↦ ((E, λ⁻¹D), λ).
- `HodgeStructuresPartII:H.5/arithmetic-spread-morphisms`: Morphisms, sections and isomorphisms of finitely presented objects over X extend over some restriction of S, uniquely after further shrinking (EGA IV 8.8.2(i), Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).
- `HodgeStructuresPartII:H.5/relative-stable-complex-fibre`: The stable open base-changes to the stable moduli of HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse, HodgeStructuresPartII:H.1/hodge-coarse over ℂ.
- `HodgeStructuresPartII:H.5/integral-projective-lattice`: For G = GL_r, integral ↔ the local system comes by extension of scalars from a local system of finitely generated projective 𝒪_K-modules.
- `HodgeStructuresPartII:H.5/geometric-origin-summand`: Equivalent with 'direct summand' in place of 'subquotient' (semisimplicity).
- `HodgeStructuresPartII:H.5/geometric-origin-boundary`: Local systems of geometric origin have quasi-unipotent local monodromy at infinity (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).

H.1’s consumed Hitchin scaling and nilpotent-fibre API still needs promotion at its owner, recorded as a precise gap because this review may not edit H.1. The six planets remain key definitions or central named results; the integrality name now includes the theorem’s cohomological assumption.

Signature coverage has 15 native rows, 15 partial rows and 43 omitted rows after promotion. Those rows reuse names: there are 121 distinct native names/examples and 139 distinct omissions. The native arithmetic carrier does not supply projectivity or determinant data, and the native trace-free coefficient-change helper does not supply the full representation tensor isomorphism. These limitations are stated in all three deliverables. Promoted projectivization, no-invariants and Hodge-system facts also mark their narrower native special cases as partial.

The final, actual suggested Lean file was elaborated with `lean-check research/blueprint/suggested/HodgeStructuresPartII--H.5.lean`, after checking available memory. It exited 0 with 109 warnings, all for admitted proofs. There were no unused-variable, deprecation or other warnings. Two unused Tau Ceti imports were removed: no Tau Ceti theorem is needed to elaborate these native signatures. The shared Mathlib build matches the recorded pin; its Tau Ceti checkout differs and no Tau Ceti module is imported by this file. Thus compilation certifies the pinned Mathlib portion only. The 22 mathematical baseline citations were checked separately at both exact source commits.

## Per-node review

| Node (H.5 suffix) | Verdict | Check |
|---|---|---|
| `trace-free-adjoint` | corrected | Checked sl versus pgl and the invertible-r trace splitting; general G uses the derived Lie algebra. The native coefficient-change formula is a pointwise helper, while the full coefficient tensor equivalence remains omitted. |
| `betti-tangent` | verified | Fixed determinant and prescribed boundary classes give trace-free H¹, with the scalar stabilizer condition for the coarse GL_r tangent. |
| `rigid-representation` | corrected | Stable irreducible orbit isolation is the intended condition. The native predicate now excludes reducible isolated semistable points. |
| `projective-rigidity` | corrected | Absolute irreducibility is geometric; fixed-determinant/projective rigidity uses finite μ_r-twisting fibres and complete-DVR lifting, with no finite-determinant assumption on the comparison. |
| `cohomological-rigidity` | corrected | The compactification kernel and a_* trace-free H¹ retain the boundary restrictions; the hypergeometric computation now states a dimension. |
| `strong-cohomological-rigidity` | corrected | Ordinary group H¹ vanishing is stronger than the boundary-kernel vanishing; projective and punctured examples separate them. |
| `coh-rigid-reduced-isolated` | corrected | The reduced isolated coarse-point equivalence uses GL_r scalar inertia; general reductive G keeps the stack tangent implication. |
| `strong-implies-cohomological` | verified | A zero domain gives an injective boundary restriction. No converse is asserted for an open variety. |
| `rigid-connection` | verified | The determinant is fixed as a flat line bundle and the Higgs determinant has zero field; fixing only its underlying line bundle would change the problem. |
| `derham-betti-tangent` | corrected | The cohomological tangent comparison is natural; the Goldman–Millson/isosingularity comparison is a completed-local statement with the harmonic and stable hypotheses. |
| `rigid-correspondence` | verified | Riemann–Hilbert and the non-abelian Hodge homeomorphism preserve isolation; the Dolbeault correspondence is not claimed to be an analytic isomorphism. |
| `rigid-locus` | verified | Reuses the pinned quasi-finite open subscheme, retaining nilpotents. Closedness is asserted over a field of finite type, not in an arbitrary family. |
| `rigid-finite` | corrected | The stable finite-type moduli has finitely many isolated points. The result concerns isomorphism classes with the fixed determinant and, where needed, fixed boundary data. |
| `rigidity-conjugate` | corrected | The fixed-boundary algebraic problem and trace-free H¹ transport along field automorphisms. This statement does not transport unitarity. |
| `rigid-number-field` | verified | Finite-type algebraic representation data plus an isolated moduli class descend to a number field, allowing a finite extension to choose a representation of that class. |
| `boundary-monodromy-data` | verified | Good compactifications, conjugacy of boundary loops and quasi-unipotence are distinguished from actual finite-order or trivial boundary matrices. |
| `prescribed-monodromy-moduli` | verified | The irreducible open is tested on proper nonzero Grassmannians. Determinant generator values lie in μ_d and use the matching generator index. |
| `prescribed-monodromy-tangent` | verified | The first-order deformation condition is the kernel of restriction to the boundary cyclic groups, with trace-free coefficients and the stack/coarse distinction. |
| `intermediate-extension-h1` | verified | The a_* and intermediate-extension degree-one comparison has the specified shifts; the complex-analytic carrier remains a gap separate from étale EDC.5. |
| `rigid-higgs-gm-fixed` | corrected | A connected scaling orbit through an isolated stable point is constant; only nonzero scaling is used. |
| `rigid-higgs-nilpotent` | corrected | Positive-weight Hitchin invariants of a fixed point vanish in characteristic zero. The pinned characteristic-polynomial lemma requires an integral domain. |
| `system-of-hodge-bundles` | corrected | The finite grading lowers by one and the sheaf field satisfies actual integrability. The contraction-based module prototype now requires a finite free cotangent module. |
| `gm-fixed-hodge-bundles` | corrected | A stable scaling-fixed object gives the Hodge grading up to an overall shift; this is the projective Simpson setting. |
| `cvhs-hodge-bundles` | corrected | Complex polarized variations carry the signed Hermitian form, with no built-in real or integral lattice. The stable/semisimple Hodge correspondence retains its projective setting. |
| `rigid-underlies-cvhs` | verified | Rigid stable projective local systems are scaling fixed and hence underlie complex polarized variations; this is not an integrality assertion. |
| `deformation-to-cvhs` | verified | The projective Hitchin-limit argument and the quasi-projective tame route remain distinguished; Mochizuki is a recorded missing input. |
| `coh-rigid-semisimple-cvhs` | corrected | Strong trace-free H¹ vanishing and semisimplicity give the variation conclusion; determinant and boundary refinements keep the hypotheses of LL24. |
| `unitary-representation` | corrected | Compact closure, invariant positive form and conjugacy into U(r) agree. Haar averaging is imported from CompactGroups, and field-automorphism invariance is explicitly false. |
| `zero-higgs-unitary` | corrected | The graded Higgs field of a polarized complex variation vanishes exactly in the unitary case, via its definite form and harmonic decomposition. |
| `hodge-rigid-locus` | corrected | The quasi-finite locus is relative to the λ-line. Its nonzero trivialization uses H.1 scaling; its zero and one fibres are the rigid Dolbeault and de Rham loci. |
| `rigid-hodge-splitting` | corrected | Rees sections, finiteness and local Artinian fibres are separated from the global equivariant product. The latter has an explicit Tannakian/Ziegler gap. |
| `smooth-arithmetic-model` | corrected | Smooth arithmetic coefficients, torsion determinant and pointed projective geometry are retained in the specification. Restrictions are principal affine opens; the native carrier is only smooth proper data. |
| `relative-moduli` | corrected | Langer’s universally Japanese-base, Hilbert-polynomial and stable-open hypotheses are retained. Differential operators form the full filtered algebra, not an order-one truncation. |
| `simultaneous-spreading` | corrected | Finitely many rigid objects and all their finite-presentation data spread after enlarging and localizing a common coefficient ring; limit equality alone does not prove existence. |
| `nilpotent-rigid-models` | corrected | Spread Higgs fields retain a bounded nilpotence exponent after shrinking, and relative rigidity is the quasi-finite locus of the stable moduli. |
| `rigid-locus-exhaustion` | corrected | The finite reduced compactification separates horizontal section components from vertical components. The image of the closure of the remaining locus can be removed. |
| `nice-hodge-models` | corrected | All determinant powers use a=0,…,d−1 and sections of the Hodge locus have domain S×𝔸¹. Nilpotence, disjointness and exhaustion retain the intended rank bounds. |
| `integral-representation` | corrected | The integral model is the fixed ℤ-group base changed to 𝒪_K. Full rings of integers, inverses and stable projective lattices distinguish integrality from S-integrality. |
| `strongly-integral` | verified | A ℤ-lattice is stronger than an 𝒪_K-lattice; restriction of scalars changes rank and does not make the original single embedding strongly integral. |
| `strong-integral-unitary-finite` | corrected | A conjugate of the discrete GL_r(ℤ) image has compact closure and hence is finite; the definition is basis independent. |
| `unitary-embeddings-finite` | corrected | Separate conjugators at finitely many embeddings yield a uniform bound on the original integral matrix entries. The pinned bounded-conjugate finiteness theorem applies. |
| `infinite-image-unitary-example` | verified | The Salem unit-circle conjugate is integral, unitary and not a root of unity; another embedding is nonunitary, so it does not contradict all-embedding finiteness. |
| `integrality-local-criterion` | corrected | Local integral lattices glue in GL_r, and the reductive route uses simply connected lifting and strong approximation. Those arithmetic inputs are now explicit gaps. |
| `integrality-EG18` | corrected | Irreducibility, finite determinant, quasi-unipotent boundary and cohomological rigidity are all retained. Higher-dimensional companions are not silently supplied by the curve Langlands stage. |
| `integrality-KP` | verified | General reductive G uses g^der and the stated finite abelianized monodromy conditions. Companion and specialization inputs remain recorded. |
| `geometric-origin` | corrected | The witness is over a dense open with a smooth projective family. The simple pullback API requires a dense inverse image; regular singularities are needed to compare connection witnesses. |
| `integral-pvhs` | corrected | A projective 𝒪_K-lattice with a polarizable complex variation at every embedding is required, not merely one variation with integral monodromy. |
| `geometric-origin-integral-pvhs` | corrected | Semisimple geometric summands have number-field lattices and chosen variations via isotypic support. A summand need not preserve the original filtration, and Schmid extension is separate. |
| `low-rank-pvhs-unitary` | corrected | Analytically general isomonodromic deformations and the strict 2√(g+1) bound are retained. Parabolic Hodge and isomonodromy inputs are explicitly open. |
| `very-general-rank-bound` | verified | Countability of integral representations and the analytic Hodge loci give the very-general qualifier; finiteness uses variations at all embeddings. |
| `rigid-sl3-geometric` | verified | Langer–Simpson requires rigid integral irreducible SL₃; the cohomologically rigid consequence uses integrality first. Its geometric construction is recorded as an input gap. |
| `no-symmetric-differentials` | verified | The all-fields finite-image theorem has the full vanishing for every symmetric power. Arapura’s unfixed-determinant rigidity and fixed-determinant nilpotence are distinguished. |
| `fibrewise-h1-vanishing` | corrected | Inflation–restriction/Leray in degree one uses vanishing fibre invariants and base-invariant H¹, with the local-coefficient topology input requested from its owner. |
| `versal-unitary-rigidity` | corrected | The fibre adjoint has no invariants and rank r²−1<g. The H.4 Artinian theorem is used with A=ℂ; unitarity of the total-space representation is not assumed. |
| `trace-splitting` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Split the trace by A ↦ (A − (tr A/r)1, tr A/r); trace invariance proves equivariance. |
| `adjoint-projectivization` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Scalar matrices act trivially by conjugation; identify sl_r with pgl_r when r is invertible. |
| `adjoint-no-invariants` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Schur identifies the centralizer with scalars; invertibility of r kills a trace-zero scalar. |
| `adjoint-base-change` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. The trace kernel commutes with flat extension of fields, and the matrix conjugation action commutes with applying the embedding entry by entry. |
| `adjoint-h1-base-change` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Choose finitely many generators. Cocycle values lie in a finite-dimensional vector space and the relations impose linear equations. Their span has a finite basis even if the list of relations is infinite. Flat field extension preserves this kernel and the coboundary image; quotienting gives the tensor-product isomorphism. |
| `rigid-locus-field-clopen` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. For a finite-type scheme over a field, isolated points form its finitely many zero-dimensional irreducible components; each is open and closed, with its local scheme structure. |
| `rigid-locus-fibre` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Use the baseline characterization by an open singleton in a fibre; over a geometric field quasi-finiteness is exactly isolation. Retain the open subscheme structure. |
| `rigid-locus-equivariant` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. An equivariant automorphism identifies the relevant fibres and preserves isolation, hence preserves the quasi-finite open subscheme. |
| `hodge-system-scaling` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. On degree p multiply by t^p. Since θ lowers degree by one, this intertwines tθ with θ; inverse multiplication gives an isomorphism. |
| `hodge-system-nilpotent` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Each application lowers the degree. Beyond the finite support interval every iterated component vanishes. |
| `unitary-conjugation` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Import compact-group unitarizability from CompactGroups layer 1 and choose an orthonormal basis; conversely use compactness of U(r) and conjugation as a homeomorphism. |
| `unitary-invariant-form` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. The compact-group owner supplies an invariant positive form. Conversely a preserved positive form gives conjugacy into U(r), hence compact closure. |
| `unitary-semisimple` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. The orthogonal complement of every invariant subspace for an invariant positive form is invariant, yielding complete reducibility. |
| `rigid-hodge-nonzero` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Restrict the H.1 scaling trivialization of the Hodge moduli over 𝔾_m to the quasi-finite locus; equivariance identifies the rigid fibres. |
| `arithmetic-spread-morphisms` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Import finite-presentation existence of descent from SF.0. For equalities between already descended maps use the pinned affine-transition equality theorem, verifying quasi-compactness; invert one nonzero element to make finitely many data and equalities hold simultaneously. |
| `relative-stable-complex-fibre` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Universal corepresentation of the geometrically stable family functor is compatible with base change; identify the complex fibre with the H.1 stable coarse moduli using uniqueness of corepresenting objects. |
| `integral-projective-lattice` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. An integral matrix realization gives a free lattice. Conversely a finite projective lattice over 𝒪_K becomes free after a finite extension that principalizes its Steinitz class; its stable action then gives an integral matrix realization. The finite-extension principalization input is explicitly recorded in the arithmetic lattice gap. |
| `geometric-origin-summand` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. The smooth projective cohomology variation from H.2 is semisimple. Its subquotients are therefore direct summands as local systems. |
| `geometric-origin-boundary` | added | Promoted the consumed API fact under PROTOCOL §4; justified by the parent and the listed inputs. Apply the local monodromy theorem from LPV.1 to the smooth projective family over the witness open, then pass to the subquotient. At divisors where the given local system extends, the monodromy is trivial. |

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.5.json`: zero errors and warnings.
- Final `lean-check`: exit 0, 109 admitted-proof warnings only, as scoped above.
- Cross-packet traversal: 196 reachable nodes, no unresolved fine-node IDs or cycles.
- Packet/reader/API/test and signature-inventory consistency checked; all source excerpt fields and reader source-passage blocks removed.
- Every node remains implementation unchecked; planned coverage and the remaining work are synchronized.

The orchestrator can accept this completed independent review. Follow-ups are the thirteen named gaps, the sixteen supplier requests and eventual lemma-level refinement of the multi-part targets. In particular, preserve the Schmid, Tannakian, arithmetic lattice and isomonodromy qualifications when assembling the roadmap. The additional source finding E-H5-7 is already known in the paper extraction; it should not be presented as a newly discovered erratum.

No review task remains. The durable handoff is `research/blueprint/handoff/REV-HodgeStructuresPartII--H.5.md`.
