# PKG-ShimuraVarieties — completed package handoff

Codex — `codex-drcLi9`; issue [#9194](https://github.com/CBirkbeck/tauceti-explorer/issues/9194); 2026-10-13. Packaging is complete. The next step is the independent package review, not resumption of an unfinished drafting task. This note is not an independent acceptance verdict.

## Deliverables and completeness

Only the three package files and this handoff are changed. The source packets, assembled reader, reviewed suggested file and supplier roadmaps are unchanged. The authoritative input is the accepted **full 100-target** ShimuraVarieties packet and reader, reviewed in [PR #9463](https://github.com/CBirkbeck/tauceti-explorer/pull/9463) after [PR #9457](https://github.com/CBirkbeck/tauceti-explorer/pull/9457). The job's historical 69+26 split describes 95 inherited targets; the full accepted assembly adds five necessary interfaces. All 100 survive, with their 80 named API entries and 48 named definition checks. All 13 definitions/constructions retain at least three discriminating checks. The inventory remains 77 theorems, seven definitions, six constructions, eight comparisons and two applications.

README uses mathematical layers, prose statements, exact hypotheses, proof routes, source locators, API bullets, Checks, layer examples, supplier contracts and boundaries. It removes catalogue/process scaffolding and planets. Suggested.lean contains only the real-bodied group-action quotient and geometric-Artin specialization, two theorem signatures, eight example signatures and light supporting actions. It declares no analytic-space, Shimura, automorphic, CM, descent or canonical-model data with a sorry body. Eleven remaining definition/construction names appear in the short closing comment and retain their full specifications in README. All declarations lie in `TauCetiRoadmap.ShimuraVarieties`; the README's proposed eventual `TauCeti.Shimura` names identify mathematical targets rather than claiming library implementation. `metadata.toml` is `topic = "math.NT"`.

## Build-order and ownership changes

The following are package reorganizations, not edits to packet IDs or external migration records:

- `minimal-datum-extension`, `codim-one-analytic-extension` and `log-canonical-sections` move from old V2 to README 3.8–3.10, after algebraic maps and finite quotients. This removes two direct later-layer prerequisites and their induced third dependency. The earlier full-ring argument has its own local modular/logarithmic identification on the separating projective realization; it does not invoke the later global log-section embedding.
- `disjoint-special-reflex-fields`, `translation-descent` and `model-uniqueness` move from V8 to README 4.10–4.12. They are conditional on actual canonical models and precede the CM/Hodge/general existence routes. Every normalized internal dependency now points to an earlier subsection. The general-data applications remain last, separate from the abelian-type lane.
- Current Tau Ceti `Geometry/Manifold/Gluing.lean` already supplies `TauCeti.chartedSpaceOfIsOpenEmbedding`, `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`, `TauCeti.contMDiff_chartedSpaceOfIsOpenEmbedding` and `TauCeti.partialDiffeomorphOfIsOpenEmbedding`. These imports replace the **manifold atlas transport** part of the old holomorphic-gluing request. The locally C-ringed analytic category, nilpotents, invariant finite quotients and holomorphic bundle descent remain additional contracts. No complete old target is deleted: the surviving targets need more than this manifold transport.
- Current ClassFieldTheory **Layer 13** already plans `cyclicHasseNorm` and `isGlobalNorm_iff_isLocalNormEverywhere`, with finite and infinite places. The generic cyclic norm request is removed from the proposed CM supplier extension and imported instead. Only Chevalley's global-unit topology and its CM closure deduction remain extra. This is the second partial request removal; no second general Hasse norm theorem is planned.
- Existing restricted products, arithmetic pairwise commensurability, neat levels, finite-Galois-set descent and finite quotient existence remain imports. Their retained specializations state the additional effective-domain, positive rational-component, ample-descent or reciprocal-action requirement.
- Connected canonical symmetry is sharpened from Deligne's primary scan: the component extension pulled back through global reciprocity, continuous semilinear action, special-torus fixed-point map and finite-level induction formula are explicit. Compact-open component orbits are required open. The mixed SVI/1983 appendix citation is split into properly attributed locators.

There are no upward supplier edges to ShimuraCompactifications, no LI/FoundationsAndLibraryIntegration substitutes, no CM.2/CM.4 backedge into the main CM theorem, and no hidden general-existence premise in the abelian-type lane. PELModuli is the declared tier-13 bundle partner. Proposed additions at other owners remain unapplied requests: this package issue does not authorize editing their files.

## Current library and source checks

Read ReductiveGroups and AnalyticToricGeometry README and Suggested.lean in full as upstream shape models. Checked target objects and hypotheses against the current upstream roadmaps (including all nine newer directories named by WORKERS), Completed/RestrictedProducts, the existing audit and current library. Upstream roadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`. Current Tau Ceti library: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Build Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. No lake command was run in either read-only current checkout.

All fifteen baseline bodies/hypotheses were read at the Mathlib pin: orbit relation/quotient/stabilizer; Scheme; Over; Functor; Over.pullback/Id/Comp with pullback assumptions; ordered span/spanCompIso; finite/proper/open-immersion predicates; IntermediateField.LinearDisjoint. They supply only those native interfaces. Current reductive structure theory does not supply arithmetic density/central cohomology; RealAlgebraicGeometry excludes the general o-minimal inputs. The review's 39 cross-roadmap contracts remain represented, with the two current-library request refinements above.

Reobtained fifteen public PDFs and matched their accepted source-version SHA256 values: SVI, CM, 1983 action, descent, BKT, BKT erratum, AGHMP, Milne–Shih Taniyama/conjugation, semistable reduction, Platonov–Rapinchuk, Milne MF, Pink, Deligne 1971 and KUY. This is version identification, not a claim to have independently certified all proofs. Targeted reading reconfirmed more than fifteen locators: SVI 3.14–3.15 (p.39), 5.20–5.21 (pp.60–61), 5.29 (p.65), 14.15–14.16 (p.127); CM 3.6, 3.9–3.12 (pp.21–24); descent 1.1 and 1.2 (pp.1–2); Pink 8.2 (pp.132–133), 12.9–12.10 (pp.200–201), 12.12 (p.202); BKT 4.12–4.13 (p.18) and erratum 1.2–1.5 (pp.2–3); KUY 4.1–4.2 (pp.344–346); AGHMP 3.1 (pp.415–416); Conrad 4.2 (p.9), 5.6 (p.18) and 6.5 (pp.23–24). The inherited independently reviewed source findings are preserved mathematically, including the rejected fat-point objection, product-sign/field corrections, ineffective-action distinction and full-reductive simplicity defect.

Additionally read Deligne 1979's [primary IAS scan](https://www.math.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 2.5.1–2.5.10 and 2.7.1–2.7.13 (relevant page images pp.281–283 and 285–288), to sharpen the connected contract and reconstructive group law. The source explicitly leaves part of the equivalence verification to the reader; that proof is a target, not an existing Lean implementation. The earlier analytic/formal carrier gap therefore remains, while the exact source/formula uncertainty is reduced.

Found [Milne's Kazhdan proof notes](https://www.jmilne.org/math/articles/1984T.pdf), Theorem 0.1 and introduction (pp.1–3), final argument (pp.21–24). This is a useful primary proof route, but its uniform intermediate argument assumes boundary codimension at least three, CM-split compact maximal torus and a Clozel representation input; its passage to unrestricted varieties refers back through marked conjugation. It has not been substituted as a circular black box for Layer 7. No new theorem or assertion of closed exceptional proof is made.

The original Borel metric proof was not obtained from the publisher endpoint; SVI gives the result and describes the Kwack input rather than proving it. A legible primary Baily–Borel convergence copy was not obtained here. No damaged OCR estimate is certified. No private book or passage was copied into the repository.

## Remaining mathematical obligations for implementation

Packaging is complete; these inherited development obligations remain visible in the targets and exact supplier contracts:

1. Nilpotent complex analytic locally ringed spaces, invariant finite analytic quotients, holomorphic bundle descent and quotient charts. Existing manifold gluing resolves only atlas transport.
2. Complete all-type boundary classification/reduction topology, normal-majorant convergence, local normal analyticity, full-ring identification outside BB 10.14's range, Koecher and finite boundary-map integrality.
3. Borel's metric multivariable extension proof and the independent complex cusp-chart/o-minimal/period-map/graph suppliers with the corrected maximal compact.
4. Full product-CM spreading/rigidity, localized good-prime eigensplitting, global-unit topology and its CM norm-kernel consequence. Cyclic norms come from existing CFT Layer 13.
5. Connected completion/Galois-extension carriers, continuous actions, reciprocity-fixed-point maps and induction/coherence proofs, now with Deligne locators and formulas.
6. Serre protorus/Taniyama extension, finite-adelic section and marked pushout at a shared CM extension owner.
7. Exceptional uniformization, ranked S-arithmetic recovery, corrected finite-place centre cohomology (excluding A_n, n≥4), adjoint Hasse and torus norm inputs; the separate central adjustment still needs proof after replacing the false full-reductive simplicity claim with exact semisimple perfection.
8. The A₁ marked CM/Siegel bridge and corrected totally-real extension completion-density argument.
9. Ample-power descent/quasi-projectivity in the finite-quotient supplier and positive rational abelianization/local openness specializations.
10. Pink's broader finite-domain auxiliary models for quotient-by-SL₂ and the GL₂ fibre product in **both** existence lanes. A strict pure-datum theorem does not automatically cover them.

No existence axiom, sorry-defined data carrier or arbitrary scheme theorem hides these obligations. The original twenty-gap inventory is not claimed closed by packaging or by a sorry elaboration.

## Adversarial mathematical pass

Every target was checked for scope, degenerate cases, action direction, normalization and the supplier actually needed. The table records the distinguishing instances and qualifications retained or added. It verifies a planning statement's formulation, not the unproved mathematical development. The checks cover the named API operations as well as the end statement in each definition/construction row; all 80 original API entries and all 48 tests were retained. The already accepted review's eight corrections are preserved, not claimed as new work here.

| README section / target | Instances and scope result |
| --- | --- |
| 0.1 `stabilizer-arithmetic` | GL₂ at principal level; real-quadratic central units fix the domain. Discreteness is asserted for the effective image. |
| 0.2 `stabilizer-commensurable` | Equal levels and representatives give equality; b=qak gives qΓq⁻¹. Arbitrary rational representatives require commensurability, not equality. |
| 0.3 `neat-sublevels` | N=3 principal GL₂ level versus N=2 with −I. Normal cores and rational conjugates are retained. |
| 0.4 `effective-proper-action` | Ineffective central units versus the free effective action at neat level; no rational-group freeness. |
| 0.5 `component-decomposition` | Trivial datum gives one summand; full GL₂ level 3 has two components. Representatives transport by q. |
| 0.6 `simply-connected-components` | For a torus the derived group is trivial and the abelianized finite quotient remains; GL₂ level 3 gives two, not one. |
| 1.1 `analytic-points` | PUnit datum is singleton; trivial Q acting on a two-point X preserves both points. Lean detects discarded X. |
| 1.2 `analytic-structure` | Neat level gives a manifold; a non-neat elliptic stabilizer requires the finite analytic quotient. Nilpotent analytic carriers are explicit suppliers. |
| 1.3 `holomorphic-level-maps` | Torus level 21 to maximal level has six points and regular C₆ action, while all deck permutations give S₆. Only the effective action image is claimed. |
| 1.4 `right-translation` | u=[[1,1],[0,1]], v=[[1,0],[1,1]] give uv≠vu; g=1 gives identity. Source and conjugated target levels are specified. |
| 1.5 `holomorphic-hecke` | g=1 gives identical legs; maximal GL₂ level at diag(2,1) has three sheets. Multiplicities are retained in composition. |
| 1.6 `datum-analytic-map` | Identity datum and a torus inclusion; an arbitrary coarse-level inclusion is not automatically a closed immersion. |
| 1.7 `level-index` | Trivial group gives one object; p²Z_p⊂pZ_p⊂Z_p gives the inclusion direction and intersection. ℝ is open but fails compactness. |
| 2.1 `rational-boundary` | ℍ has rational cusp points; a product permits an interior factor. The boundary normalizer and its pointwise kernel differ. |
| 2.2 `satake-compactness` | Compact quotient has empty boundary; modular cusp neighborhoods retain stratum incidence. Euclidean/bounded-domain topology alone is insufficient. |
| 2.3 `analytic-automorphic-ring` | E₄ at Γ(3) has degree 2 and constant term 1; j has a pole. Genus-two boundary weight is 6 at degree 2, not intrinsic weight 4. |
| 2.4 `poincare-eisenstein` | Degree zero cannot separate a positive-dimensional compactification; weights must be sufficiently divisible and positive. Convergence is a required proof. |
| 2.5 `normal-analytic-compactification` | On a compact quotient the sheaf is ordinary holomorphic functions; at a modular cusp q is regular and j is excluded. Stratum holomorphy alone omits continuity. |
| 2.6 `automorphic-finite-generation` | A finite separating subring is not the full ring. PGL₂ factors fall outside BB 10.14; their local logarithmic/cusp identification is a separate part of this proof. |
| 2.7 `baily-borel` | Modular open has a projective cusp completion; compact quotients have no added strata. Non-neat levels need normal quotient algebraization. |
| 2.8 `koecher` | ℍ/PGL₂ has codimension-one cusps; a real-quadratic Hilbert modular surface has codimension-two point boundary despite rational rank one. |
| 2.9 `minimal-level-extension` | Identity translation extends identically; a neat open covering can ramify at cusps. No boundary étaleness. |
| 3.8 `minimal-datum-extension` | Identity map extends; an inclusion of a lower-dimensional subdatum is not generally finite. Moved after algebraic data maps. |
| 3.9 `codim-one-analytic-extension` | For GL₂ the quotient by SL₂ is the two-point G_m datum; PGL₂ lift and nonlift cases use different constructions. Moved after finite quotients. |
| 3.10 `log-canonical-sections` | At a width-w cusp dq/q=w dq_c/q_c, with w≠0 in characteristic zero. For empty boundary this is the ordinary canonical bundle. Moved after the partial extension. |
| 3.1 `borel-extension` | r=0 is the unpunctured case; a punctured modular cusp extends into the minimal target. Torsion-free effective target is mandatory. |
| 3.2 `borel-algebraicity` | exp:ℂ→Y(1)=𝔸¹ is a counterexample for the torsion coarse target. Smooth sources are treated through quasi-projective opens. |
| 3.3 `unique-algebraization` | Identity analytic comparison forces the unique algebraic identity. A bare isomorphism of complex point sets has insufficient structure. |
| 3.4 `algebraic-data-maps` | Identity and compositions agree after faithful comparison; closed immersion requires suitably small levels. |
| 3.5 `finite-quotient-algebraization` | Trivial quotient action gives the same scheme; nontrivial isotropy prevents an étale torsor assertion. Normalization is componentwise. |
| 3.6 `definable-target-comparison` | Compact target needs restricted analytic charts; a cusp exponential needs R_an,exp and bounded oscillation. Fixed maximal compact/Cartan compatibility is retained. |
| 3.7 `definable-borel` | Constant map has an algebraic graph; unrestricted exp into the coarse j-line does not supply the neat-target hypotheses. Independent comparison is a premise. |
| 4.1 `geometric-artin` | Order-three character sends 1 to 2 under inversion, not 1; identity maps to identity. Norm/restriction compatibility survives inversion. |
| 4.2 `reflex-norm` | G_m cocharacters n=0,1,−1 give 1,s,s⁻¹; a principal idele has rational norm. Products of coordinates, never sums. |
| 4.3 `reciprocity-finite-action` | Same Artin lift acts identically at finite level; nonclosed rational torus points require their closure at the full tower. |
| 4.4 `canonical-model` | Trivial datum gives Spec ℚ; strict G_m at level 5 has the real quadratic cyclotomic model. Two split ℚ-points fail character-2 reciprocity. |
| 4.5 `torus-model` | Maximal G_m level gives one point; principal level 5 has degree two rather than degree four. All levels are finite étale schemes here. |
| 4.6 `aghmp-stack-comparison` | Neat level is a scheme; non-neat finite isotropy remains in the stack quotient. The generic comparison supplies no integral model. |
| 4.7 `special-existence` | Terminal datum has its sole special point; GL₂ gives imaginary-quadratic special tori. Density uses rational real approximation. |
| 4.8 `hecke-density` | Dimension zero requires hitting every finite component; positive dimension uses the real orbit and arithmetic components. Strong approximation on the full reductive group is not substituted. |
| 4.9 `reflex-norm-functoriality` | Identity torus morphism gives equality; cocharacter mapped to zero shrinks its reflex field to ℚ. Norm points from the larger field to the smaller. |
| 5.1 `weight-one-algebraization` | A constant polarized weight-one lattice gives a constant abelian family; a nonpolarizable variation fails the hypotheses. Integral level and homological signs are retained. |
| 5.2 `cm-abelian-variety` | An imaginary-quadratic elliptic curve and a product of two such curves pass; degree-two action on a surface and scalar ℚ-action fail full CM. |
| 5.3 `cm-tate-rank-one` | Elliptic maximal-order CM gives rank one; a nonmaximal order supplies only rational freeness without an invertible-lattice input. |
| 5.4 `cm-number-field-model` | A product CM point with finitely many tensors requires spreading plus rigidity; arbitrary complex abelian varieties are not asserted algebraic over a number field. |
| 5.5 `cm-potential-good-reduction` | In a reduced E⊗ℚ_ℓ, square-zero inertia difference is zero; a Tate curve has unipotent inertia but is not full CM. ℓ differs from residue characteristic. |
| 5.6 `cm-frobenius` | CM elliptic π satisfies ππ̄=q; faithful Hom realization gives injectivity into the centralizer, without Tate-surjectivity. Endomorphisms must be defined over k. |
| 5.7 `shimura-taniyama` | Split elliptic CM has slopes 0 and 1, inert CM has slope 1/2. Ramified primes use normalized valuations; eigensplitting is localized at P. |
| 5.8 `cm-ideal-reciprocity` | m=1 removes the torsion constraint; m>1 distinguishes ray from ordinary ideal classes. The ideal formula uses arithmetic Artin. |
| 5.9 `main-cm` | s=1 gives identity comparison; s′=a s requires α′=αa⁻¹. Product CM components are handled separately; the norm-kernel input cannot be asserted for arbitrary tori. |
| 5.10 `cm-polarization-level` | Principal s=2 in quadratic reflex CM with σ=id gives norm 4, α=1/2 and multiplier 1/4. Tate twist and positivity are retained. |
| 5.11 `siegel-special-cm` | Product CM elliptic curves give a nonsimple special point; a generic elliptic curve with only scalar endomorphisms fails. |
| 5.12 `siegel-canonical` | g=1 includes pairing components over ℚ; g=0 is treated as the terminal datum, separately from positive-dimensional CM. |
| 6.1 `hodge-inheritance` | Identity embedding reproduces the ambient model; subdata may enlarge the reflex field. Conditional uniqueness/descent precedes existence. |
| 6.2 `hodge-canonical` | Siegel datum is its own Hodge embedding; independence of two embeddings uses conditional model uniqueness, not a general-data existence theorem. |
| 6.3 `connected-tower` | Trivial derived group gives a point; GL₂ connected SL₂ tower does not recover the two full level-3 components without the extension. |
| 6.4 `connected-full-equivalence` | A torus has point connected fibre but multiple full components; induction with continuous Galois symmetry reconstructs them. Bare pro-variety fails. |
| 6.5 `connected-products` | Product with terminal datum is unchanged; two different reflex fields require their compositum and diagonal Galois action. |
| 6.6 `central-isogeny-descent` | Identity isogeny has trivial completion kernel; a nontrivial central cover gives a quotient. The source is G₁, preserving the accepted misprint correction. |
| 6.7 `abelian-canonical` | GL₂/Siegel supplies an abelian-type instance; a different central quotient changes completions and full components. This lane uses no Layer 7. |
| 7.1 `simple-connected-reduction` | A torus has no semisimple factor and is handled by reconstruction; an almost-ℚ-simple Hermitian factor uses its totally real restriction-of-scalars field. |
| 7.2 `auxiliary-cm-splitting` | An already imaginary-quadratic split elliptic torus needs no further extension; a general torus requires a finite totally real splitting adjustment. |
| 7.3 `rank-one-subdata` | SL₂ has one noncompact root pair; compact roots do not produce the needed domain. The subgroup contains T and differs from its derived A₁ group. |
| 7.4 `rank-one-central-separation` | In A₁ the root-centre intersection is the full finite centre; adjoining a central torus defeats an assertion of full-reductive simplicity. The rationality comparison remains required. |
| 7.5 `conjugated-datum` | τ=id fixes the datum; complex conjugation changes SL₂ upper to lower marking while the group remains split. Finite-local maps must fix the marked torus. |
| 7.6 `kazhdan-uniformization` | Identity conjugation preserves the cover and lattice; exceptional E₆/E₇/mixed D are explicitly included and require the metric proof. |
| 7.7 `weak-conjugation` | Identity allows G₁=G; rank-one lattices do not meet total-rank≥2 superrigidity hypotheses. The marked twist is not identified at this step. |
| 7.8 `marked-conjugation` | Identity fixes h; a split group after complex conjugation still has changed marking. Rank-one canonical existence alone is not the marked CM bridge. |
| 7.9 `completed-conjugation-equivariance` | An action on G(A_f) alone does not determine completed adjoint rational symmetry. Identity and finite totally real extension maps must agree. |
| 7.10 `special-independence` | h=h′ gives identity transition; a Weyl reflection checks nontrivial marking changes. Triple transitions must be transitive. |
| 7.11 `conjugation-cocycle` | σ=1 gives identity; ordered f_στ=f_σ∘σ(f_τ) distinguishes action order. Set-theoretic cocycles still need continuity. |
| 7.12 `finite-rigidifying-points` | For a finite zero-dimensional level use all points; in positive dimension finiteness of automorphisms plus density gives a finite separating subset. |
| 7.13 `continuous-descent` | A discontinuous finite-automorphism-valued cocycle is a nonexample; finite rigidifying points and a finitely generated field splitting give the required continuity. |
| 7.14 `general-canonical` | Terminal datum is Spec ℚ; exceptional factors require all earlier conjugation inputs. Auxiliary choices are removed through conditional uniqueness. |
| 4.10 `disjoint-special-reflex-fields` | For GL₂ choose an imaginary-quadratic field ramified at an odd prime unramified in the fixed finite extension. Torus-reflex field differs from a level-point residue field. |
| 4.11 `translation-descent` | g=1 gives a forgetful map; general g changes its level and requires g⁻¹Kg⊂L. The theorem assumes actual models and makes no existence deduction. |
| 4.12 `model-uniqueness` | Identical specified comparisons give the identity; an abstract scheme automorphism changing the comparison is excluded. Moved before existence routes. |
| 8.1 `level-tower` | Identity and successive inclusions recover actual maps; GL₂ level-3 j-map has degree 24 and two source components. Constant/arbitrary-map constructors fail. |
| 8.2 `translation-laws` | The two integral unipotents have products [[2,1],[1,1]] and [[1,1],[1,2]]; translations compose with gh, not hg. No all-group action at a fixed level. |
| 8.3 `finite-level-maps` | A torus map is finite étale; full level 3 to j-line ramifies at elliptic points. −1 gives the effective quotient by ±1. |
| 8.4 `hecke-span` | g=1 gives identity legs; p=2 at maximal GL₂ level gives lower-triangular index 3. Distinct legs detect an exchanged WalkingSpan arrow. |
| 8.5 `datum-functoriality` | Identity datum gives identity; constant cocharacter image can shrink the reflex field. Target is base-changed to E(source). |
| 8.6 `zero-dimensional-shimura-variety` | N=1,2 sign quotient has one point; N=3 has two full-domain points but one strict torus point. Archimedean action cannot be discarded. |
| 8.7 `component-reciprocity` | GL₂ level 3 has two cyclotomic components; strict one-point G_m target has one and fails. Component-fibre assertion retains Milne 5.17 hypotheses. |
| 8.8 `abelian-instance` | GL₂ level 3 gives a nonconstant two-component tower; route uses only Hodge/abelian-type existence and conditional functoriality. |
| 8.9 `gl2-moduli-reciprocity` | A character-2 automorphism transports the primitive pairing root; rational full-level canonicity includes every component, not one fibre. |
| 8.10 `gl2-full-level` | N=3 is fine; N=1,2 fail the fine threshold. The comparison is over ℚ with the supplied analytic uniformization. |
| 8.11 `gl2-determinant-pairing` | N=3 gives μ₃^prim with two conjugate points; a constant two-point ℚ-scheme and strict real cyclotomic point both fail. |
| 8.12 `gl2-fixed-pairing-fibre` | At N=3 fixing ζ₃ selects one connected Γ(3) component over ℚ(ζ₃); the full model remains two-component. |
| 8.13 `gl2-row-basis-dictionary` | u sends (P,Q) to (P,P+Q), rotation sends it to (−Q,P); determinant changes the pairing exponent. Nonintegral g uses isogeny legs. |
| 8.14 `gl2-gamma1` | N=4 satisfies the fine threshold; N=3 retains unwanted automorphisms. First-column fixer differs from the upstream second-row fixer outside SL₂. |
| 8.15 `gl2-gamma0` | N=1 is the coarse j-line; nontrivial automorphisms remain. Coarse points over ℚ are not asserted to classify every ℚ-isomorphism class. |
| 8.16 `gl2-compact-model` | Composite N=6 requires generalized-elliptic compactification; a prime-only construction does not supply it. The open comparison fixes the compact extension. |
| 8.17 `codim-one-extension` | Empty codimension-one boundary gives the open model; GL₂ quotient auxiliary domain has two points. Auxiliary models are explicit in both existence lanes. |
| 8.18 `minimal-descent` | A compact datum adds no boundary; a modular curve uses the independent genus-one base case. Projective closure uses algebraic log sections and flat base change. |
| 8.19 `minimal-map-extension` | Identity extends identically; at cusps finite level extensions can ramify. General datum maps are not asserted finite. |
| 8.20 `gl2-cusps-tate` | Width N at infinity gives q=q_c^N; width 1 gives q=q_c. Local residue field and representative roots of unity remain specified. |
| 8.21 `gl2-tower-compatibility` | g=1 gives identity correspondence; maximal T₂ has two degree-three legs. Pull-push and pairing transport retain the ordered moduli normalization. |
| 8.22 `general-tower` | Terminal datum and identity maps agree with the conditional tower; arbitrary data use actual Layer 7 models, not hypothetical schemes. |
| 8.23 `general-minimal` | General strict pure existence alone does not supply noninjective finite-domain auxiliaries. The broader Pink auxiliary-model premise remains explicit. |

The standing conventions were also checked with explicit witnesses: trivial datum and ineffective centre; the two noncommuting integral matrices; arithmetic/geometric order-three inversion; cocharacters 0 and −1; principal CM idele 2 with multiplier 1/4; E₄ versus j and genus-two weight 6; PGL₂ cocharacter without an SL₂ lift; row-basis shear/rotation; and full N=3 versus strict torus N=3, with N=1,2 treated separately. Division by norms is on idele units, cusp width is a positive integer in characteristic zero, and every quotient map has its actual group/level domain. No mixed- or positive-characteristic claim is inferred from characteristic-zero cusp or CM geometry.

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties.json`: 0 errors, 0 warnings (read-only input check).
- Exact inventory comparison: 100 target subsections; all target names, 80 API names, 48 test names and every source locator represented. All thirteen definition/construction check counts are at least three. Internal fragment links resolve; the normalized target prerequisite graph respects the revised build order.
- `lean-check research/blueprint/packages/ShimuraVarieties/Suggested.lean`: exit 0 at the shared pins, exactly ten warnings, all uses of `sorry`; no errors or other warnings. Only the closing explanatory comment changed afterward. The file is well below 5,000 lines. This elaborates the representative signatures and does not prove them or the remaining reader tests.
- `python3 research/blueprint/intake.py check-files` on all four deliverables and `git diff --check`: pass.

Independent package review should start from the full 100-target accepted input, inspect the six reordered targets and the two partial supplier-request removals, repeat Lean/intake validation, and audit the primary-source limits above. Do not edit the old split packets or infer that implementation/source-proof closure is complete. No scratch file is needed to continue: all locators, decisions, limits and target mappings needed for review are in the package and this note.
