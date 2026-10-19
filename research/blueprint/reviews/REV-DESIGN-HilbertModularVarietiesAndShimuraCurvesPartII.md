# Independent review: Hilbert modular varieties and Shimura curves, Part II

**Accepted after correction.** Issue #3546; reviewer Codex, session `codex-4F8teW`; 19 October 2026. This session did not write the design being reviewed. The packet records `independent-review-REV-DESIGN-HilbertModularVarietiesAndShimuraCurvesPartII` and an individual verdict with evidence for every target.

The corrected plan covers the global patching and Gelfand–Kirillov route of BHHMS §8. Its status `complete` means a finished planning pass under PROTOCOL §0. It does not mean formalisation or closure of its four explicitly recorded dependency gaps. GK.2 is closed; GK.0, GK.1 and GK.3–GK.5 are planned with precise remaining work. Every target of the six stages is realised. No unresolved contradiction remains in the planned statements.

| Item | Reviewed result |
|---|---:|
| Targets | 40: 25 verified, 15 corrected, 0 added, 0 unverifiable |
| Definitions / constructions / theorems | 5 / 7 / 28 |
| API items | 80 |
| Definition and construction checks | 54, including one added boundary check |
| Pinned baseline declarations | 18 confirmed, 0 removed |
| Foreign prerequisite contracts | 79: 77 nodes and 2 requested stages |
| Planets | 19 |
| Explicit gaps / supplier requests | 4 / 3 |
| Source findings | 6: 5 confirmed, 1 rejected |
| Suggested Lean file | Elaborates; eight `sorry` warnings, no other warnings or errors |

All twelve definitions and constructions have at least three discriminating checks; their individual counts are 5, 6, 4, 4, 4, 4, 4, 4, 4, 6, 5 and 4 in packet order. The checked examples include degenerate, boundary and non-example cases. The 19 planets identify central mathematical objects and named results, rather than paper numbering.

## Corrections made

1. **BDJ weights, GK.0/bdj-weight-set.** The fundamental characters in BDJ/BHHMS and EGS are inverses. With the specified embedding convention the comparison is W(ρ) = D_EGS(ρ∨), not D_EGS(ρ). Checked BDJ §§3.1–3.2, pp. 18–26 and EGS §2.1, pp. 10–11. Removed `AlgebraicModularFormsAndSerreWeights:R15.4/recipe-well-definedness-and-twisting`: its statement concerns G_Qp and cannot supply the unramified degree-f recipe. Its stage and roadmap dependency were removed as well. Restricted the two-weight reducible test to 0 < s < p−3, and added p = 5, s = 2, where the weights are Sym², det³ and det³ Sym⁴. Corrected the comparison test too.
2. **Coefficient spaces, GK.0/residual-eigenspaces.** S uses the dual coefficient system and is contravariant; its extra dual M is covariant. Corrected the API and proof variance. The trivial-coefficient example now requires compatible trivial central character and the central quotient of the curve. Replaced the insufficient nonzero-H² explanation of failure before localisation by the augmentation sequence of a connected étale C_p-cover: the norm induces multiplication by p on H⁰, producing a nonzero connecting class. References: EGS §6.2, pp. 34–35; BHHMS Remark 8.1.3 and (64), pp. 88–89.
3. **Finite deck groups, GK.0/non-eisenstein-freeness.** Retitled the target to projectivity and injectivity. After non-Eisenstein localisation the perfect complex has cohomology in a single degree. Finite projective dimension over the self-injective finite group algebra gives projectivity; freeness follows for p-groups. The original arbitrary-finite-group freeness assertion was too strong. Added the prime-to-p direct-summand counterexample to the acceptance evidence. Checked the W(𝔽)/pⁿ variant by the same Frobenius-ring argument. References: BHHMS (64), p. 89 and Corollary 8.4.6(i), p. 107; EGS §6.2, p. 35.
4. **Twists, GK.0/infinite-level-representation.** Twisting r̄ by χ changes ψ to ψχ², so π twists by χ⁻¹ composed with determinant. Corrected the sign in its test. Infinite-dimensionality is a consequence to check after GK.5, not an assumption used to describe π. References: BHHMS (65)–(68), pp. 89–90.
5. **Cancellation, GK.1/power-series-cancellation.** A[[x]] ≅ B[[x]] with B ≅ W[[n]] gives A ≅ W[[n]]. The n−1 conclusion belongs to A[[x]] ≅ W[[n]], n ≥ 1. Corrected the false corollary and retained the valid general theorem. Read Hamann, Theorem 4 and proof, printed p. 155, directly; corrected its previously wrong source URL. The suggested Lean statement was already correct.
6. **Determinants and type loci, GK.1/patched-deformation-ring and type-quotients.** Restricted the one-variable determinant comparison to a fixed Hodge/inertial-type locus; unrestricted local characters have f+1 directions. A non-Barsotti–Tate example now assumes a nonzero characteristic-zero point and uses its incompatible Hodge–Tate weights, rather than treating a potentially zero quotient as a counterexample. References: GK14 Remark 5.2.2, p. 26; BHHMS (63), (69), pp. 88–91.
7. **Patching augmentation, GK.1/shimura-curve-patching-functor.** Preserved the module comparison but changed the premature ring isomorphism to a surjection R∞/(x) onto the global ring with the selected local conditions. Neither R = T nor an unrestricted global-ring identification is available here. Corrected the exactness argument's variance. References: GK14 §5.4.1, pp. 30–31; EGS §§6.2–6.4, pp. 34–37.
8. **Fibre nonvanishing, GK.1/patched-fibre-identity.** For an integral lattice the Jordan–Hölder factors belong to σ/pσ. Added the reduction and Nakayama steps to the proof. References: BHHMS (64)–(68), pp. 89–90.
9. **Miracle flatness, GK.2/iwasawa-miracle-flatness.** Adic separation must be applied to I tensor M for every ideal I of the base, not just to M. These modules are finite over the larger Noetherian algebra, and the central adic ideal lies in its Jacobson radical. References: GN22 Proposition A.30, pp. 49–50; Stacks Tags 00MK and 090V.
10. **Projective lifts, GK.3/projective-lift-freeness.** An upper embedding W ↪ D₀^r that is an isomorphism on socles does not establish W ≅ D₀^r. Kept the intended isomorphism and supplied an independent reverse embedding using Breuil, Lemma 9.2 and proof, author-copy pp. 54–55. Non-Eisenstein localisation makes Hom into finite-level automorphic cohomology exact; the quotient D₀^r/soc has no modular constituent. Its residual Hom vanishes, hence so does its localisation. Restriction to the socle is therefore an isomorphism on Hom, preserved by taking the Hecke eigenspace, Galois multiplicity and fixed weights elsewhere. The socle embedding extends injectively because the socle is essential. This uses GK.0, not later GK.4–GK.5 conclusions, so introduces no cycle. Added the two direct GK.0 prerequisites, removed a duplicate hypothesis, and added the public Breuil source. References also include BHHMS Proposition 8.2.6, pp. 93–94; LMS22 Lemma 4.5 and Proposition 4.6, pp. 14–15.
11. **Glued-lattice induction, GK.4/glued-lattice-freeness.** Restored the full norm character N_(k/Fp) composed with det⁻¹, and retained its negative sign in the type-to-prime indexing bijection. The displayed positive sign is recorded as E6. Also corrected the multi-type gap: BHHMS Proposition 4.3.1 gives R[[2f variables]] ≅ S[[4 variables]], not an unconditional unstabilised presentation of R. Increasing the patching parameter q and applying cancellation gives the asserted presentation of the patched ring. Made the embedding reversal and the 3-to-1 relabelling of prime indices explicit. References: BHHMS §4.3, pp. 34–40 and Theorem 8.3.9, pp. 101–103.
12. **Banach admissibility, GK.5/banach-lifts.** The open ideal for topological Nakayama is ker(x̄ : R∞ → 𝔽′). The characteristic-zero point's kernel generally is not open. References: BHHMS Corollary 8.4.4, p. 106; CEGGPS Proposition 2.13 and Remark 2.14, p. 34.
13. **Unweighted GK dimension, GK.5/shimura-curve-gk-dimension.** For the lower bound, enlarge the other levels V_w contained in K₁,w to K₁,w; nonzero smooth representations of compact pro-p groups have nonzero invariants. The resulting modular weighted representation embeds at enlarged level and then at the original level. Corrected the reversed shrinking argument and retained the nonvanishing and level hypotheses in the larger-S variant. References: BHHMS Corollary 8.4.6, pp. 106–107 and Remark 8.4.7, p. 108.
14. **Hecke carrier, GK.5/completed-cohomology-and-big-hecke.** Explained how the imported derived Hecke-image construction in CC.8 becomes the image on H¹ after non-Eisenstein H⁰/H² vanishing (degree zero in the definite case). References: BHHMS §8.5, pp. 108–109 and the cited CC.8 supplier contracts.

The 14 entries above cover 15 corrected nodes because item 6 corrects two. No node was added. Every changed target block, its incoming reader links, the supplier inventory, source inventory and upstream notes were synchronized in the reader. The single-type gap now distinguishes weight-isolating power-series rings from the more general regular case. The GK.1 remaining list no longer presumes an assigned owner for Breuil–Mézard. All edits are within the issue's deliverables and this review's handoff.

## Per-target evidence

Locations below use the exact public editions in the packet's source inventory. Full statements, hypotheses, proof outlines and direct supplier contracts were read; these are conclusions about the planned targets, not summaries of sections of the sources.

| Target | Verdict | Evidence and reasoning |
|---|---|---|
| `GK.0/generic-global-datum` | verified | Checked both inertial boxes, the dual representation, the prescribed modular level V, the auxiliary place and the two quaternionic cases. The prime-29 consequence is derived arithmetic, not an attributed theorem. BHHMS23 §8.1, pp. 86–88; EGS15 Definition 2.1.1, p. 10 and §6.2, pp. 34–35. |
| `GK.0/bdj-weight-set` | corrected | Matched the subset recipes, antisymmetry and exceptional extension-class conditions. The comparison is W(ρ) = D_EGS(ρ^∨); the p = 5 boundary has three weights. BDJ10 §§3.1–3.2, pp. 18–26; EGS15 §2.1, pp. 10–11. |
| `GK.0/residual-eigenspaces` | corrected | Checked the centre quotient and ψ⁻¹, the contravariance of S and covariance of its dual M, and the augmentation counterexample before non-Eisenstein localisation. EGS15 §6.2, pp. 34–35; BHHMS23 Remark 8.1.3 and (64), pp. 88–89. |
| `GK.0/non-eisenstein-freeness` | corrected | The perfect localized complex gives a projective and injective module for any finite deck group. Freeness needs a p-group; a prime-to-p direct summand need not be free. BHHMS23 (64), p. 89 and Corollary 8.4.6(i), p. 107; EGS15 §6.2, p. 35. |
| `GK.0/infinite-level-representation` | corrected | Checked the infinite-level multiplicity carrier, fixed away-from-v weights, admissibility and ψ⁻¹ central character. Twisting r̄ by χ twists π by χ⁻¹ composed with determinant. BHHMS23 (65)–(68), pp. 89–90; DL21 §6.2, pp. 54–55. |
| `GK.0/bdj-weight-theorem` | verified | Checked the global irreducibility and small-prime conditions and the unramified weight identification. Nonvanishing for precisely the modular weights still depends on the explicit Breuil–Mézard gap. GK14 Theorem B, p. 3, Corollary 5.4.5, p. 33 and Corollaries 5.5.4, 5.5.7, pp. 34–36. |
| `GK.0/ihara-at-auxiliary-place` | verified | The auxiliary-place eigenvalue exclusions make the degeneracy Gram determinant a unit. Localized non-Eisenstein control supplies the doubling, so GK dimension is unchanged. BHHMS23 Corollary 8.4.6(ii), p. 107; EGS15 §6.2, p. 35. |
| `GK.1/power-series-cancellation` | corrected | Read Hamann directly and corrected the variable count: A[[x]] ≅ B[[x]] with B ≅ W[[n]] gives A ≅ W[[n]], whereas A[[x]] ≅ W[[n]] gives n−1 variables. HAM75 Theorem 4, printed p. 155; BHHMS23 Lemma 8.1.2, p. 88. |
| `GK.1/patched-deformation-ring` | corrected | Checked the dimensions of R∞ and S∞. The one-variable fixed/unfixed determinant comparison concerns fixed-Hodge/inertial-type loci; unrestricted local determinant characters have f+1 parameters. BHHMS23 (63), pp. 88–89; GK14 Remark 5.2.2, p. 26. |
| `GK.1/type-quotients` | corrected | Checked the type and Hodge quotient conventions and domain assumptions. A non-Barsotti–Tate quotient example requires a nonzero characteristic-zero point with different Hodge–Tate weights. BHHMS23 (69), pp. 90–91; EGS15 Theorems 7.1.1–7.2.1, pp. 42–43. |
| `GK.1/fixed-determinant-patching-functor` | verified | Checked exactness, maximal Cohen–Macaulay conditions on the weight and type supports, covariant variance, reduction compatibility and the separate rank-one minimality condition. EGS15 Definitions 6.1.1, 6.1.3 and Lemma 6.1.4, pp. 32–34. |
| `GK.1/shimura-curve-patching-functor` | corrected | The augmentation gives the module comparison and a ring surjection to the locally constrained global ring. An isomorphism or the unrestricted global ring is not supplied at this stage. EGS15 §§6.2–6.4, pp. 34–37; GK14 §5.4.1, pp. 30–31; BHHMS23 (62)–(64), pp. 88–89. |
| `GK.1/patched-fibre-identity` | corrected | Checked the Pontryagin dual of Hom at the patched fibre and exactness. For an integral lattice, the relevant Jordan–Hölder constituents are those of σ/pσ, with Nakayama used afterwards. BHHMS23 (64)–(68), pp. 89–90. |
| `GK.1/big-patched-module` | verified | Checked the compact-module GL₂ action and S∞[[K₁/Z₁]] freeness. No finiteness over R∞ is asserted; the completed-cohomology fibre needs p inert. DL21 Theorem 6.2 and §6.2, pp. 53–55; BHHMS23 Theorem 8.4.1(ii), p. 104 and (84), p. 108. |
| `GK.2/iwasawa-cohen-macaulay` | verified | Checked Ext grade, the convention for the zero module, depth and canonical dimension. Auslander regularity and the local GK carrier remain imports, rather than duplicate targets. GN22 Definitions A.2, A.5, Proposition A.4 and Lemmas A.7–A.9, pp. 42–44. |
| `GK.2/freeness-from-extension` | verified | Checked r ≥ 1, the annihilator-quotient isomorphism and generation by r elements. The kernel argument needs surjective endomorphisms of finite modules to be injective; no Noetherian hypothesis is smuggled in. BHHMS23 Lemma 8.2.1, pp. 90–91; Stacks Tag 05G8. |
| `GK.2/fibre-product-freeness` | verified | Checked both surjections, nonzero finite free modules of a common rank over their supports, the intersection annihilator and the equivalent sum-ideal criterion. Bases can be aligned over the local quotient. BHHMS23 Lemma 8.3.8, p. 101. |
| `GK.2/iwasawa-grade-and-power-series` | verified | Checked each grade identity and inequality with its finiteness hypotheses over the smaller and larger algebras; the central power-series and regular-sequence cases have different shifts. GN22 Proposition A.13 and Lemmas A.15–A.19, pp. 45–47. |
| `GK.2/iwasawa-cohen-macaulay-transfer` | verified | Checked central regular-sequence grade transfer, finite projective dimension and purity. The conclusion transfers Cohen–Macaulayness without assuming the flatness that the next target will prove. GN22 Lemmas A.21–A.28 and Corollary A.29, pp. 47–49. |
| `GK.2/iwasawa-miracle-flatness` | corrected | Checked Noetherian local base, central ideal, depth and grade bounds. The lifting argument requires adic separation of every I tensor M; finiteness over the larger Noetherian algebra supplies it. GN22 Proposition A.30, pp. 49–50; Stacks Tags 00MK and 090V. |
| `GK.3/patched-maximal-cohen-macaulay` | verified | Checked that finite S∞-freeness and the support dimension force depth to equal dimension for finite-length coefficients; deeper rings and modules remain README targets. BHHMS23 Lemma 8.2.2, p. 91. |
| `GK.3/weight-and-type-freeness` | verified | Checked the weight-isolating types, the lattice comparisons and propagation of a single positive rank r across all modular weights and tame types. Local ring inputs are explicitly gaps. BHHMS23 Proposition 8.2.3, pp. 91–92; EGS15 Proposition 10.1.11 and proof, pp. 63–65. |
| `GK.3/locally-algebraic-lattices` | verified | Checked the reduced support, maximal Cohen–Macaulay assertion and regular characteristic-zero loci. The imported potential-diagonalisability argument supplies local freeness without forcing r = 1. BHHMS23 Corollary 8.2.4 and Remark 8.2.5, pp. 92–93; CEGGPS16 Lemmas 4.17–4.18, pp. 62–66. |
| `GK.3/projective-lift-freeness` | corrected | Separated the upper embedding into D₀^r from its reverse. Breuil’s localized extension argument gives the reverse embedding using essential socle and absence of modular constituents in the quotient; neither the GK bound nor GK.4 is used. BHHMS23 Proposition 8.2.6, pp. 93–94; LMS22 Lemma 4.5 and Proposition 4.6, pp. 14–15; BRE14 Lemma 9.2, pp. 54–55. |
| `GK.4/glued-lattices` | verified | Checked the integral pullbacks defining L_j and N_j, the maps to P, the comparison lattices and the unique τ₀ with all modular constituents. The endpoint lattice R is imported from MP.8. BHHMS23 §8.3, pp. 95, 98–99 and 101. |
| `GK.4/loewy-length-three` | verified | Checked all four distinct conditions on the quotient and its socle, the K₁-invariance statement and the extra hypotheses for Loewy length at most three. None is silently implied by a shared socle. BHHMS23 Lemma 8.3.1, pp. 94–95. |
| `GK.4/adjoint-lattice-generation` | verified | Checked the mod-radical relations in the projective presentation and the minimal-generator count. The patched multiplicity is the common r, not an assumed multiplicity one. BHHMS23 Lemma 8.3.2, pp. 95–96; LE19 Lemma 4.5, p. 16. |
| `GK.4/adjoint-type-lattices` | verified | Checked the characteristic-zero type decomposition, the nonmodular constituents killed by exact patching and the special-fibre comparison M∞(T′/p) ≅ M∞(Y). BHHMS23 Proposition 8.3.3, pp. 96–98 and Lemma 8.3.5, p. 99. |
| `GK.4/adjoint-lattice-freeness` | verified | Checked the support prime intersection, the adjoint-type lattice decomposition and the use of the extension freeness criterion. Its generation prerequisite is the preceding target, not the later glued-lattice theorem. BHHMS23 Theorem 8.3.4, p. 98. |
| `GK.4/comparison-lattice-truncation` | verified | Checked the comparison of L_j and N_j modulo the third radical and its relative-projectivity input from MP.9. It identifies this truncation, not the whole lattices. BHHMS23 Lemma 8.3.6, pp. 99–100. |
| `GK.4/generation-transfer` | verified | Checked the contradiction via a Loewy-length-three quotient, relative projectivity and the repaired D₀ identification. The needed Hom dimension is r; the source’s occurrence of f is recorded as E1. BHHMS23 Proposition 8.3.7, pp. 100–101. |
| `GK.4/glued-lattice-freeness` | corrected | Checked the full norm-determinant twist, prime relabelling and fibre-product induction. Only a stabilized bare-local-ring presentation is imported; increasing q and cancellation give the patched power-series presentation. BHHMS23 Theorem 8.3.9, pp. 101–103 and Proposition 4.3.1, pp. 34–38. |
| `GK.4/second-truncation-multiplicity` | verified | Checked the endpoint L_{f−1}, its imported projective-envelope reduction and the fibre multiplicity isomorphism. The isomorphism is after quotienting by 𝔪∞ and does not assert equality before the fibre. BHHMS23 Corollary 8.3.10, Theorem 8.3.11 and Remark 8.3.12, p. 103. |
| `GK.5/patched-gk-dimension` | verified | Checked all three hypotheses of the imported local GK bound, including second-truncation multiplicity, and the independent lower bound from the S∞-free big module and grade inequalities. BHHMS23 Theorem 8.4.1, pp. 104–105. |
| `GK.5/second-congruence-invariants` | verified | Checked the enlarged socle construction and the multiplicities furnished by the second-truncation theorem. The structural identification uses MP.6 and does not assume faithful flatness. BHHMS23 Theorem 8.4.2, p. 105. |
| `GK.5/patched-faithful-flatness` | verified | Checked the Cohen–Macaulay transfer and grade 2f, the miracle-flatness hypotheses and nonzero residual fibre for faithfulness. Finiteness is over the larger Iwasawa algebra. BHHMS23 Theorem 8.4.3, pp. 105–106; GN22 Corollary A.29 and Proposition A.30, pp. 49–50. |
| `GK.5/banach-lifts` | corrected | Checked the integral specialization, nonzero residual fibre and the bounded dual Banach construction. Topological Nakayama uses the open residual kernel of x̄, not the kernel of the characteristic-zero point. BHHMS23 Corollary 8.4.4, p. 106; CEGGPS16 Proposition 2.13 and Remark 2.14, p. 34. |
| `GK.5/shimura-curve-gk-dimension` | corrected | Checked finite-level dévissage and auxiliary-place doubling. For the lower bound, enlarge the other pro-p levels to K₁ and take nonzero invariants; the larger-S variant retains nonvanishing and level hypotheses. BHHMS23 Corollary 8.4.6, pp. 106–107 and Remark 8.4.7, p. 108. |
| `GK.5/completed-cohomology-and-big-hecke` | corrected | Checked the inverse-limit central-character cohomology and Hecke carrier. Non-Eisenstein H⁰ and H² vanishing identifies the imported derived Hecke image with the H¹-image definition used here. BHHMS23 §8.5, pp. 108–109; CompletedCohomologyPartII CC.8. |
| `GK.5/big-r-equals-big-t` | verified | Checked p inert, the completed-cohomology fibre and the chain of surjections. Faithful flatness kills its kernels and descends the regular patching sequence, giving the complete intersection conclusion. BHHMS23 Corollary 8.5.1, p. 109; GN22 Proposition 4.3.1, pp. 31–32. |

## Baseline and ownership

All 18 cited declarations were read in their Lean source modules at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, including surrounding hypotheses. The pinned Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. No baseline name was missing and none was removed. The following table gives declaration lines; the packet and reader give module paths and the restricted mathematical use of each item.

| Declaration | Declaration line | Result |
|---|---:|---|
| `CategoryTheory.Abelian.Ext` | 118 | Confirmed. |
| `IsLocalRing` | 30 | Confirmed. |
| `IsNoetherianRing` | 196 | Confirmed. |
| `IsRegularLocalRing` | 51 | Confirmed. |
| `LinearMap.ker` | 60 | Confirmed. |
| `Matrix.GeneralLinearGroup` | 43 | Confirmed. |
| `Module.FaithfullyFlat` | 63 | Confirmed. |
| `Module.Finite` | 117 | Confirmed. |
| `Module.Flat` | 113 | Confirmed. |
| `Module.Free` | 43 | Confirmed. |
| `Module.annihilator` | 860 | Confirmed. |
| `Module.support` | 49 | Confirmed. |
| `MvPowerSeries` | 86 | Confirmed. |
| `Nat.Prime` | 42 | Confirmed. |
| `PowerSeries` | 60 | Confirmed. |
| `Representation` | 49 | Confirmed. |
| `Submodule.spanFinrank` | 67 | Confirmed; minimal-generator interpretation requires finiteness. |
| `WittVector` | 52 | Confirmed. |

`Submodule.spanFinrank` uses cardinal-to-natural conversion, so the packet and reader now explicitly restrict its minimal-generator interpretation to finite generation. This was a qualification of a valid citation, not replacement by a new target. Ext requires the ambient HasExt hypotheses; representation, flatness, annihilator and support declarations supply their foundational notions, not the deeper theorems planned here.

The reviewed `data/library-coverage.json` was checked. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were consulted read-only, including the nine post-snapshot roadmaps and neighbouring RepresentationTheory, ModularInduction and completed-group-algebra material. In particular `TauCeti.completedGroupAlgebra R Γ` already exists at `TauCeti/Algebra/CompletedGroupAlgebra/Basic.lean`; the older upstream note gave the wrong location. It is imported current-library content, not a newly planned construction or a carrier assumed at the older pin. No build was run in either current tree.

Every foreign prerequisite statement was read. The retained 79 distinct contracts comprise 77 nodes and the two requested existing stages L1 and SR.0; 80 contracts were initially inspected, including the removed Q_p-only recipe. Existing local mod p results, curves and cohomology, Taylor–Wiles machinery, Auslander regularity and derived Hecke constructions remain with their suppliers. The three requests distinguish two existing carriers from one genuine extension: definite quaternionic forms with arbitrary permitted finite ramification, beyond the parent's restricted Khare–Wintenberger setting.

The stage order remains acyclic. GK.2 develops the additional Gee–Newton grade/transfer/flatness results, while importing the existing Auslander-regular carrier. The reverse D₀ embedding was deliberately proved from GK.0 to avoid a cycle through the later GK criterion. The two proposed scope splits are honest exclusions from this route, rather than targets claimed completed here.

## Source findings and versions

Only public sources were used. The packet and reader record URLs, exact versions, pages read, download hashes and the review of each finding. The bibliography now includes Breuil's public author copy and the correct Hamann PDF. BHHMS references use arXiv v7; the public author copy was separately checked where indicated.

| Finding | Verdict | Scope of the verification |
|---|---|---|
| E1 | Confirmed | BHHMS Proposition 8.3.7 proof, arXiv p. 100 and author-copy p. 104: the Hom dimension is the patched rank r, not the local degree f. The target already used r. |
| E2 | Confirmed | EGS §6.2, p. 35: central character ψ⁻¹, the correction explicitly recorded by BHHMS Remark 8.1.3(i). |
| E3 | Confirmed | EGS §6.2, p. 35: central quotient of the curve, the correction explicitly recorded by BHHMS Remark 8.1.3(iii). |
| E4 | Confirmed with limited scope | BHHMS cites Corollary A.30; GN arXiv v5, pp. 49–50 labels it Proposition A.30. This is a cross-version label discrepancy, not a mathematical error or a checked journal misprint. |
| E5 | Rejected | EGS §6.4, p. 37 cites the 2012 Gee–Kisin preprint. Different numbering in the later v5 is insufficient evidence of an erroneous reference. The useful version map is retained. |
| E6 | Confirmed, added by this review | BHHMS Theorem 8.3.9 proof, arXiv pp. 101–102 and author-copy p. 105: the type-to-prime bijection must use the same negative norm-determinant twist as the two preceding index sets and §4.3, p. 34. |

The [BHHMS publisher landing page](https://link.springer.com/article/10.1007/s00222-023-01202-8) was checked for publication metadata; its full PDF requires a subscription. E1 and E6 persist in the accessible [author copy](https://www.math.toronto.edu/~herzig/GK.pdf), but this review makes no claim to have verified the version of record. Herzig's publication page linked no correction for this paper on the review date. Stacks Tags [05G8](https://stacks.math.columbia.edu/tag/05G8), [00MK](https://stacks.math.columbia.edu/tag/00MK) and [090V](https://stacks.math.columbia.edu/tag/090V) were read directly. Neither a source passage nor a section-by-section source summary has been added to the repository.

## Remaining dependencies and questions for the orchestrator

The four gaps remain precise and open: tame types and their integral lattices; single-type potentially Barsotti–Tate and (2,−1) deformation rings; the multi-type presentation and p-membership; and the general potentially Barsotti–Tate Breuil–Mézard/weight input. The first three refer to the pending LocalGaloisDeformationRingsPartII design, issue #3432. The last has no assigned atlas owner: the Q_p-only p-adic Langlands roadmap is insufficient.

The orchestrator should resolve the two proposed splits (the Ichino–Prasanna quaternionic continuation and Hilbert–Siegel varieties), assign the Gee–Kisin/Gee–Liu–Savitt Breuil–Mézard route, and retain the parent's definite-forms extension request. These are ownership actions, not reasons to reject the corrected global plan. No second job was claimed and no other roadmap's files were edited.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HilbertModularVarietiesAndShimuraCurvesPartII.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/HilbertModularVarietiesAndShimuraCurvesPartII.lean`: exit 0 at the pinned Mathlib commit. Only eight permitted `sorry` warnings, at lines 134, 156, 182, 189, 200, 208, 211 and 215. The suggested file required no edit; heavy carriers remain README targets.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/HilbertModularVarietiesAndShimuraCurvesPartII.lean`: no sorry-bodied data.
- Submission file checking: all five changed deliverables, including this report and the handoff, pass `research/blueprint/intake.py check-files`.
- Independently compared all 40 reader target blocks with the corrected packet, verified all 40 review verdicts are present exactly once, and checked target counts, API/test counts, planet counts, source inventory and the internal dependency graph. `git diff --check` passes.
