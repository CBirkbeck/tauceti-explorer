# Independent package review: PhiGammaModulesAndIwasawaCohomology

Issue: #10908. Reviewer: Codex (GPT-6), session `codex-qIWlAz`. Date: 2026-10-19.
Input: the package submitted for #10776 by Codex session `codex-3xW4w9`, after the independent blueprint review. I did not author that package or its blueprint review. This is a completed fixing review, not a checkpoint.

**Verdict: accepted with the fixes in this submission.** The README specifies the arithmetic constructions; the Lean file checks representative signatures on existing carriers. Acceptance does not assert that the arithmetic results have been formalized. The numerical residue constant remains intentionally unspecified, as permitted by the accepted input.

## What changed

1. **Corrected a false further-pullback assertion in §7.6.** A free image need not remain the image of a pulled-back map. Multiplication by X on E⟨X⟩ has free image and its principal-ideal blowup is the identity; after X↦ε in E[ε]/ε² its image has length one over a local ring of length two and is not flat. The revised assertion requires the generator of the blown-up Fitting ideal to remain a non-zero-divisor. Flat pullbacks and componentwise dominant maps between reduced spaces meet that condition. Successive reduced modifications therefore preserve earlier flat images in the flattening argument. The README now gives the counterexample and the proof condition. Suggested.lean adds the same obstruction for multiplication by 2 after ℤ→ℤ/4ℤ.
2. **Corrected supplier ownership.** AdicSpaces Layer 6 explicitly excludes vector-bundle structure theory and the schematic curve. It supplies the underlying adic curve, while PadicHodgeTheory §7.5 supplies the chartwise bundle/schematic comparison needed here. The de Rham differential-equation contract now points precisely to PadicHodgeTheory §5.1 and its `deRhamDiffEq` API.
3. **Closed an omitted descent interface.** The fixed-basis cocycle uses Mathlib's existing `comonadicExtendScalars`. The finite-projective restriction is a named target in §0.4: descend the dual, evaluation and coevaluation, descend the triangle identities by faithful flatness, and recover a finite dual basis. No duplicate general faithfully flat descent theory is planned. Section 0.3 now expressly lifts a selected fixed basis modulo p^m, rather than merely promising unspecified truncation compatibility.
4. **Restored explicit realization coverage.** Section 1.2 now states full faithfulness and `relativeDrig_hom`, as required by the input, and names determinant and t-localization compatibility. Its dual-number check tests a nonzero infinitesimal map. Section 1.1 specifies that finite projectivity concerns a finite field extension of annuli, not arbitrary radius restriction.
5. **Corrected source labels and pages.** These include CC-1998's propositions/corollaries in §§III.2–III.5, the distinct theorem/lemma/remark labels in KL-I §§8.6–8.7 and 9.5, KPX Definition 2.3.3 (p.21), Lemma 2.3.5 and Proposition 2.3.7 (p.22), KPX §5.2 (pp.48–50), and BHS's localized lattice remark and complexes (pp.342–343). Colmez VI.4.13 and VI.4.15 are propositions, VI.4.14 is a remark, and VI.4.16 is a lemma. The original exponential/localization argument in §VIII.2, pp.502–503, is now cited explicitly.
6. **Made two classification routes precise.** Section 7.1 uses KPX's unit-character realization and unramified cyclic Frobenius module to construct a general character line. Sections 3.5 and 7.2 allow the finite coefficient extension needed for slope twisting and explain descent. Section 7.8 separately states KPX Theorem 6.3.13 for arbitrary rigid X, including nonreduced X; its global coherent-flag predecessor retains reducedness and irreducible connected components. The specialization argument records reduction, normalization and field descent through character Hom spaces and saturation.
7. **Exposed the injectivity hypothesis in the application.** Section 5.7 expressly assumes the associated V is absolutely irreducible. The inclusion tN_rig(V)⊂D_rig(V) and the identification of φ-fixed vectors with V^{H_{ℚ_p}} give the actual argument: that fixed space is a Galois subrepresentation, and if it were all V, V would factor through the abelian Γ quotient. A Tate-line negative control distinguishes H_{ℚ_p} from G_{ℚ_p} invariants. Nontriangulinity remains explicit for the separate annular-generation consequence; it is not inferred merely from the Hodge–Tate weights.

8. **Removed forward proof dependencies.** The uniform-finiteness proof used a pairing constructed only in the following layer and needed field ψ-finiteness before the relative theorem. Section 4.3 now constructs the ψ-zero residue pairing, proves the finite-coefficient/character-fiber comparison independently of relative perfectness, proves the field ψ-finiteness and double-vanishing theorem, and only then proves uniform relative finiteness. The field proof uses the existing general-Frobenius slope supplier, the auxiliary pure extension (Liu Lemma 4.2, p.22), and Colmez I.5.2/V.1.18; its slope sign is stated with the tR witness. Section 5.5 retains the additional comparison with independent Galois Iwasawa cohomology, and §5.6 verifies the nontrianguline hypotheses for the earlier generation theorem. Individual t_σ quotient perfectness has moved from §4.2 to §7.1, after those ideals exist; §7.6 uses that earlier result. The normalization test now computes the residue of the constant analytic function, without confusing raw ψ coordinates with φ-Herr cup coordinates.

The author's earlier correction of ordinary dominant base change in §7.6 is retained: for Y↦XT the pulled-back chart has X(U−T)=0, whereas its dominant transform has U=T. Flat ordinary base change and dominant transforms have different contracts. Both qualifications are needed; correcting the base-change claim alone would not correct the further-pullback claim above.

## Shape, coverage and dependencies

I read the full README and Suggested.lean, the accepted packet, its review, and the package handoff. The writing models included the snapshot AdicSpaces and LocalFieldsRamification roadmaps and the current LocalGaloisGroups and ProfiniteArithmetic roadmaps and their relevant signatures. The package retains upstream form: summary, boundaries, conventions, exact supplier contracts, eight ordered layers, API prose, checks, examples and dependencies. It has 49 numbered mathematical subsections and 206 prose Checks. Each definition has at least three checks with computed, degenerate, compatibility or adverse instances; the signature file contains 16 examples.

The packet has 98 distinct nodes and the author's coverage table has exactly the same 98 identifiers, without omissions or extras. I compared their mathematical statements and API content with the corresponding subsections, including renamed API names. There remain 85 retained or narrowed nodes and 13 imported nodes; this review removes no additional target. The full-faithfulness and selected-basis-lifting clauses were made explicit during that comparison. The 23 retained planets and the three removed Wach planets are unchanged. The packet itself is unchanged.

The 13 imported nodes are individually accounted for below. These are confirmed removals already made by the package author, not new removals claimed by this review.

| Input node | Supplier instead of a package target |
| --- | --- |
| `PG.0/field-of-norms` | PadicHodgeTheory §4.1 |
| `PG.1/fontaine-D` | PadicHodgeTheory §4.3 |
| `PG.1/fontaine-V` | PadicHodgeTheory §4.3 |
| `PG.1/fontaine-equivalence` | PadicHodgeTheory §4.3 |
| `PG.1/perfectoid-integral-local-systems` | PadicHodgeTheory §7.5 |
| `PG.1/pure-local-systems` | VectorBundlesAndIsocrystals VB4 |
| `PG.1/etale-phi-cohomology` | PadicHodgeTheory §7.6 |
| `PG.3/herr-ext` | LocalGaloisDeformationRings §0.4 |
| `PG.6/wach-module` | PadicHodgeTheory §4.4 |
| `PG.6/wach-existence` | PadicHodgeTheory §4.4 |
| `PG.6/wach-height` | PadicHodgeTheory §4.4 |
| `PG.6/wach-dcris` | PadicHodgeTheory §4.4 |
| `PG.6/wach-reconstruction` | PadicHodgeTheory §4.4 |

I searched the current TauCetiRoadmap tree at `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine roadmaps newer than the atlas snapshot and Completed, by the mathematical objects and hypotheses. LocalGaloisGroups supplies the cyclotomic character interface; ProfiniteArithmetic supplies completed-group-algebra arithmetic. AlgebraicVectorBundles supplies schematic finite locally free sheaves, not the analytic blowups used here. The real Frobenius/triangulation matches in other roadmaps do not supply these p-adic assertions. No retained arithmetic target was found already implemented or planned in that current tree.

I also searched current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and read the actual completed-group-algebra and Fitting-ideal interfaces. The README imports their inverse-limit carrier, projections, continuity, minors, arbitrary algebraic base change, free-summand shift and fiber-rank criterion. It does not introduce replacement carriers. All twelve packet baseline declaration statements were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: tensor lift/ext, ModuleCat morphisms, complex constructors, native homotopy/homology, the cyclotomic character and continuous cup/transfer. The latter two allow continuous topological coefficients; their scope is not restricted to discrete coefficients. Mathlib already supplies cyclotomic-character continuity. The additional comonadic descent statement was read in the pinned source.

There is no dedicated reviewed PhiGammaModulesAndIwasawaCohomology entry in `data/library-coverage.json`. I read the adjacent reviewed Coleman, measures, regulator and Selmer audit entries and then made the direct current-tree checks above; I have not treated an unrelated audit or a pending audit as certification of this package.

The current PadicHodgeTheory PR #1062 head `758288ac23a95b4cd0c24d62eaa6d37dc536382a` and LocalGaloisDeformationRings PR #923 head `75c459351afb7877196d3ed6418e4c0dbcacbc05` were read for the actual contracts. In particular, the former supplies N_dR and the nonequivariant period roofs; the latter supplies ordinary Artinian Herr/Ext, not the localized lattice variant retained here. I checked the cited pure-local-system interface in VectorBundlesAndIsocrystals VB4 and the general-Frobenius slope/descent contracts in PadicDifferentialEquationsAndRigidCohomology §§RD.2.6–RD.2.7. The latter is below PadicHodgeTheory in the order, consumes no Herr/ψ theory, and avoids misapplying the standard-Frobenius-only statement of FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.7–R07.4.8. The Caraiani–Newton order does not assign this roadmap a numbered tier. Its actual prerequisite routes do not use its regulator, eigenvariety or GL₂ consumers as suppliers. The local H_e/exponential construction remains here; general regulators do not become an upward dependency. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` identifier remains in the package.

## Source checks

The reproducible random sample uses Python `random.seed(10908)` and 15 numbered subsections. The table records the source locators checked directly in that sample, not a claim that every reference in the bibliography was reread. In addition I checked the sources relevant to all twelve inherited source/proof-route gaps, as recorded below. Manuscripts were read directly; the cleared KL manuscripts were read in place. No cleared file or extracted passage was copied into the repository or scratch. All repository descriptions are in original words with mathematical locators.

| Sample | Direct source check and result |
| --- | --- |
| §0.2 | KL-I Lemma 1.5.2 and Corollary 1.5.3, p.24; KL-II Appendix A, p.189: finite-generated free cover and corrected top-left block, with only underlying projective splitting. |
| §0.5 | KL-I Proposition 3.2.9, pp.74–75: algebraic Lie subalgebra, n bound, Greenberg central filtration and constant-group torsor classification. |
| §1.6 | KL-I Theorem 8.6.2, p.175; Lemma 8.6.3, Theorem 8.6.4 and Remark 8.6.5, p.176; Theorem 8.7.7, p.178; Theorem 9.5.8 and Remark 9.5.9, p.202. Labels corrected. |
| §2.2 | KPX §2.2, pp.17–18: inverse Frobenius linearization and normalized scalar ψ. The algebraic tensor proof needs no missing period carrier. |
| §2.3 | KPX §2.2, pp.17–18: ψ(a⁻¹f), with a a unit; the basis-change formula uses the projection formula. |
| §3.3 | KPX Proposition 2.3.6, p.22, for the ψ-zero kernel route. Recomputed the explicit section and both homotopy identities independently. |
| §3.5 | KPX Theorem 3.1.1, pp.25–28, and Proposition 6.2.8, pp.58–59: arbitrary affinoid ψ-zero invertibility and the earlier field-line calculations remain distinct. |
| §3.6 | Pottharst Theorem 2.8 and Lemma 2.9, pp.1598–1599; KPX Proposition 2.3.7, p.22. Fixed-radius H_K acyclicity and completed tensor arguments have their own hypotheses. |
| §4.2 | KPX Propositions 3.2.4–3.2.5, pp.29–31, and Proposition 3.3.2, pp.31–34: t-quotient resolution, ψ surjectivity and finite cokernel. |
| §4.3 | KPX Hypothesis 5.2.1, p.48; Proposition 5.2.6 and Corollary 5.2.8, p.49; Proposition 5.2.10, Lemma 5.2.11 and Theorem 5.2.12, p.50. Page range corrected. The early pairing, finite coefficient change and field ψ-finiteness were also checked in KPX §§4.2–4.3, pp.36–42, Lemma 5.1.4, p.47, and Lemma 5.2.2, p.48. |
| §5.1 | CC-1999 Theorem II.1.3, p.12, §II.2, pp.13–14, Proposition II.3.1 and Remark II.3.2, pp.14–15: corestriction and the stabilized fixed-submodule argument. |
| §5.2 | The same CC-1999 norm formulas and KPX Corollary 4.4.11, p.46: integral-first rationalization and inverse-character normalization. |
| §5.6 | KPX Hypothesis 4.3.1, p.39, and Proposition 4.3.8, pp.41–42: finite field coefficients, both ψ cokernels zero, and annular scalar extension. This prerequisite theorem is now constructed in §4.3; §5.6 retains its nontrianguline application. |
| §7.1 | KPX Lemma 6.2.3 and Construction 6.2.4, pp.56–57; Notation 6.2.7, p.58: cyclic unramified Frobenius, unit character and embedding-period ideals. Construction clarified. |
| §7.3 | BHS notation, p.308; KPX Lemma 6.2.12, p.60; Ding §2.1, PDF pp.9–10: full Artinian-valued weights, with nilpotents retained. |

The additional original-proof checks give the following dispositions. A proof route in a roadmap specifies work to formalize; it does not mean that an arithmetic proof was executed by Lean.

| Inherited concern | Independent check and disposition |
| --- | --- |
| Integral overconvergent lattice | CC-1998 §§III.2, III.4–III.5: read the trace estimates, correction and final intersection argument. Corrected the labels to Propositions III.2.4, III.2.6–III.2.7, Corollary III.2.8, Lemma III.4.4, Corollary III.4.5, Proposition III.5.1 and Corollary III.5.2. Section 1.3 keeps the integral route separate from rational realization. |
| Small unipotent group | KL-I Proposition 3.2.9 supplies construction and classification; §0.5 includes BCH/Greenberg data and the torsor orientation, not only local solvability. |
| All-module/sheaf descent | KL-I §§8.6 and 9.5 support the decompletion and equivariant adapters. Existing nonequivariant roofs are imported from PadicHodgeTheory §§7.5–7.6. Corrected the AdicSpaces ownership assertion. |
| Coordinate topology | CC's weak-topology qualification and KPX's Frobenius coordinates distinguish actual annular/integral continuity from a formal tensor argument. Section 2.5 retains the qualification. |
| Acyclicity and integral Herr | Pottharst 2.8–2.9 give the Banach route; the CC finite/integral sequence route is separate. Section 3.6 names strictness, completed tensor and compact-limit requirements. |
| Dyadic descent | Section 3.7 uses the alternating C₂ resolution and continuous Hochschild–Serre, with a coherent quotient action; the μ₄ tower is cofinal. No integral averaging by 2 is used. |
| Residue normalization | KPX Remark 2.3.12, p.24, reports a numerical value without establishing it there. Sections 3.8, 4.3 and 5.5 consistently carry the same nonzero C_p; no numerical claim was added. |
| Derived integral Iwasawa | Read CC-1999 II.1.3, II.2, II.3.1 and II.3.2. The derived map, degree-two cokernel, compactness and eventual stabilization of fixed submodules are stated. Eventual triviality of the entire Γ action is not needed. |
| DLB exponential/generation | Read Colmez VI.4.13–VI.4.16, VIII.2 and DLB 8.3/12.1. Added the original localization/exponential locator and explicit irreducibility. Both ψ cokernels are proved zero by the nontrianguline-localized criterion before generation. No GL₂ involution is promised. |
| Wach ψ/good bases | Read Berger-exp Theorem A.3 and proof, pp.26–27; LLZ-2010 Theorem 3.5, pp.10–12, and Lemma 3.15, pp.12–13; LLZ-2011 p.1115 and Remark 2.14, p.1116. Odd p, integral versus rational bases, the twist and no-trivial-quotient condition are retained. |
| Relative realization/uniformity | Read KL-families Theorem 3.11/Definition 3.12, pp.955–956, and Definition 6.7, p.961; KPX §§5.1–5.3, pp.47–53. Explicit full faithfulness restored; preliminary finite coefficient change, pairing construction and field ψ-perfectness now precede the determinant covers, uniform relations and nilpotent dévissage. Read the field proof in KPX 4.3.6–4.3.8, Colmez I.5.2/V.1.18 and Liu 4.2; the latter uses the opposite slope sign. |
| Flattening/rank-one descent | Read KPX §§6.2.13–6.2.20 and 6.3.5–6.3.13, pp.61–72. Corrected arbitrary further pullback, retained the author's dominant-transform correction, and distinguished the general fiber theorem from the reduced global flag theorem. |

## Adversarial mathematics pass

This table covers the statements and named API bundled into every numbered subsection, including its definitions. I checked zero objects, the relevant trivial operators, torsion, nilpotents and rank-one examples before using the arithmetic theorems. Conventions were checked against the displayed two-term and cup witnesses. The Lean signature audit below is separate from these truth checks.

| Statements | Instances and adverse controls | Outcome |
| --- | --- | --- |
| Standing conventions and suppliers | Tate basis e, crystalline t⁻¹e, geometric reciprocity; odd finite torsion and p=2 | φ(e)=e, γ(e)=χe and φ(t⁻¹e)=p⁻¹t⁻¹e. Full finite-factor data retained. Corrected curve supplier. |
| §0.1 | Zero module; σ=id; Frobenius on 𝔽_p[U]; zero F | Invertible linearization does not require surjective F. Zero F fails on nonzero modules. |
| §0.2 | Free and zero modules; F=id; U↦U^p | Cover kernel splits only as a module. F−1 is fixed-scalar linear, not generally S-linear. |
| §0.3 | 𝔽_p and 𝔽_p×𝔽_p; rank variation; zero tuple; selected mod-p basis | Fixed ring is locally constant; determinant-open basis locus is essential. Added selected-basis lifting. |
| §0.4 | n=1,2; a>1 without 𝔽_{p^a}; diagonal action; W₂/p; J=(T) in perfect closure | Constant-coefficient base hypothesis, p-flatness and φ(J)=J are necessary. Added explicit dual-basis descent route. |
| §0.5 | g=0; square-zero upper-triangular matrices; p=2,n=1 versus 2; trivial torsor | BCH reduces to addition in the square-zero case. Correct n bound and h↦ha conjugacy direction retained. |
| §1.1 | A=E; split components; ramified K′/K; Frobenius basis i=0,…,p−1 | Target is free over source via φ. Component and coset degrees both contribute. Clarified finite-field-extension assertion. |
| §1.2 | Rank zero; nonfree projective module; dual numbers; multiplication by ε | Radius descent keeps projectives. Restored full faithfulness and a map-level infinitesimal check. |
| §1.3 | T and pT; finite p-torsion; a φ lattice without Γ stability | Intersection uses D†(V), integral ψ precedes reduction, and Γ stability is extra. |
| §1.4 | Étale line; nonzero-slope line; Γ forgotten | All-module decompletion includes non-étale objects but requires cyclotomic Γ estimates. |
| §1.5 | c=0,d=1; proportional (c,d); pointwise purity without global lattice | Global pure model stays explicit; no pointwise-to-global inference. |
| §1.6 | Unit; Tate twist; nontrivial descent character; finite extension trace | The same localization maps identify both routes and the full degree multiplies the unit. |
| §2.1 | 2⊗3; zero functional; two coordinate projections | Values 6,0 and the selected coordinate distinguish the balanced map. |
| §2.2 | Linearization multiplied by 2; r(1)=0; mod 5; finite continuous coordinates | ψ(6)=3. Left inverse requires r(1)=1. Continuity uses actual coordinate hypotheses. |
| §2.3 | a=2,−1; nonunit a=0; swapped product ring; e′=be | Formula ψ(a⁻¹f) and transformed coefficient φ(b)ab⁻¹ agree; a⁻¹ cannot be pulled through ψ. |
| §2.4 | φ=ψ=id; polynomial φ(U)=U³ with coefficient extraction; γ absent | P(U)=U and P(U³)=0. Splitting holds without φ surjective. No unconditional 1−φ surjectivity. |
| §2.5 | Integral mod p; first/other Frobenius coordinates; nonconstant rank-one a | Zeroth extraction is integral, trace/p is rational, and weak continuity is qualified. |
| §2.6 | ψ=0,id; zero module; composite maps | ψ=0 has zero fixed space and cokernel; ψ=id gives M in both degrees 1,2. |
| §3.1 | φ=2,γ=3; zero/identity operators; composable maps | d⁰(7)=(7,14), d¹(5,11)=−1 and d¹d⁰=0. Wrong plus sign fails. |
| §3.2 | φ=ψ=id; polynomial model; γ=id on nonzero ker ψ | Forward maps are id,diag(−ψ,id),−ψ. Graded surjectivity alone does not give a quasi-isomorphism. |
| §3.3 | q=0; polynomial model with γ=2id; γ=id obstruction | Recomputed S¹, S² and H²: Bq=qB=P, FS=id and id−SF=dH+Hd. The correction −qb is essential. |
| §3.4 | n=0,1,3; G=2; G=id in characteristic 3; odd torsion; dyadic sign | Q₀=0,Q₁=1,Q₃=7; invertibility is explicit. Full pro-order exponents and the generator homotopy have the right direction. |
| §3.5 | Trivial/Tate/x lines; zero ψ kernel; arbitrary γ=id toy model | Field cohomology and arithmetic invertibility are distinguished. Coefficient extension for slope twisting is explicit. |
| §3.6 | Finite torsion; integral lattice limits; nilpotent A; completed tensors | Separate integral and Banach proofs; compact-limit argument does not assert all maps surjective. |
| §3.7 | C₂ over 𝔽₂ and ℤ₂; sign action; K already containing μ₄ | Higher derived invariants survive integrally; trivial quotient case is allowed. No /2. |
| §3.8 | (1,0) cup (0,1) and reverse; χ_ur and κ(p); γ↦γ^u | Cup values −1,+1 fix the sign. logχγ is nonzero and the same C_p follows generator change and pairing. |
| §3.9 | D and t^mD; non-étale localized line; underlying-only lattice | Cofinal colimit is lattice independent. BHS uses the stated degree-two −1 adapter and full torsion comparison. |
| §4.1 | A=E; dyadic components; inverse coordinate near zero; unbounded generator/relation counts | Entire-disc and Robba Γ rings differ. Uniform relations are required as well as generators. |
| §4.2 | Zero M; t quotient; n not zero; nilpotent coefficients | ψ surjectivity and the projective resolution have the stated quotient domains. Individual t_σ perfectness is moved to §7.1 after the ideals are constructed; sharper single-t vanishing is not transferred. |
| §4.3 | Rank zero; determinant not a unit; unbounded fibers; A_red versus A; f=1 residue; d=1 auxiliary extension; finite nonflat quotient | Pairing and field finiteness now precede their uses. The residue computes 1; tR has KPX slope −1 and valuation-positive slope +1. Preliminary derived coefficient change retains Tor. Uniform relations and nilpotent dévissage remain necessary. |
| §4.4 | Unit and Tate lines; zero rank; nonflat H¹ | Euler sign is −[K:ℚ_p]rank. ψ complex perfect amplitude is [0,2], though cohomology lies in degrees 1,2. |
| §4.5 | Multiplication by X specialized at X=0; ℤ --2→ ℤ reduced mod 2; flat maps | Tor creates H⁰; ordinary cohomology base change is restricted appropriately. |
| §5.1 | Zero T; degree-p norm; ψ=id; dyadic μ₄ tower | Corestriction components Q_p,diag(Q_p,id),id have the right direction. Stabilized fixed submodules suffice. |
| §5.2 | Trivial and order>2 characters; field norms; dyadic sign | The inverse character is necessary, Tor retained and full finite component included. |
| §5.3 | Universal character evaluated at 1 and η; dual; finite exhaustion | Diagonal action uses [γ]⁻¹, giving M⊗η⁻¹ and the stated involution. |
| §5.4 | A=E; trivial V; lattice scaled by p | Integral limit is rationalized before analytic extension; no inverse limit of arbitrary rational cochains is substituted. |
| §5.5 | Inverting a character of order>2; γ↦γ^u; residue scalar | The earlier analytic pairing is compared with actual independent Galois integration. Sesquilinearity, logarithm, inverse-generator and C_p factors remain explicit. |
| §5.6 | One versus both cokernels zero; trianguline line; polynomial toy model | The generation theorem has moved to §4.3 before the uniform proof. Field and double-vanishing hypotheses are indispensable; this subsection verifies them for the nontrianguline application, retaining Robba Γ scalar extension. |
| §5.7 | V=0,ℚ_p,ℚ_p(1); nonzero constant de Rham obstruction; reducible V | H_e differs from H_f on ℚ_p. The factor t excludes the constant obstruction. Irreducibility supplies injectivity using the H_K-fixed subspace and abelian quotient; the Tate line prevents replacing H_K by G_K. |
| §6.1 | Identity and tower of unramified extensions; trivial lattice; ramified extension; flat coefficient change | Comparisons compose and commute in the two scalar directions; no ramified or arbitrary nonflat extension asserted. |
| §6.2 | Trivial line; scalar and nonconstant basis changes; p=2; prescribed rational basis | Coordinates use inverse φ(B), not inverse B. Odd p, selected good basis and rational/integral distinction retained. |
| §6.3 | a=0; trivial quotient; positive twist; rationalization | Improved π^a bound requires the excluded quotient; general π^{a−1} bound remains. ψ-stability and N⊂φ*N use the source convention. |
| §7.1 | δ=1,x,x|x|; unramified δ(p)=a; one/two embeddings | φ eigenvalues distinguish Tate and x. Period ideals are multiplied, not added. General-K construction now explicit. Individual t_σ quotient perfectness is stated here, using the earlier relative theorem and the newly constructed ideals. |
| §7.2 | δ=1 and ε; mixed embedding exponents; tR⊂R | Exceptional h⁰/h² conditions are embeddingwise; h¹=[K:ℚ_p]+h⁰+h². Saturation differs from injectivity. |
| §7.3 | x_σ^k; finite-order character; constant x_σ; 1+ε log u | Smooth and constant are distinct. Nilpotent weight ε is not an integer, despite zero residual weight. |
| §7.4 | Field and local Artinian base; nontrivial global coefficient line; ramified finite-order character | Presentation does not choose a global basis. De Rham means locally algebraic, not necessarily crystalline. |
| §7.5 | Rank one/zero; repeated-parameter split rank two; tR inclusion | Strictness requires the H⁰ uniqueness condition and saturation; specified admissible-cover density retained. |
| §7.6 | Unit/invertible ideal; map ×X; dual numbers; ℤ/4ℤ; Y↦XT; zero divisor | Corrected arbitrary pullback. Rees charts remove ideal torsion; dominant transform removes the extra vertical component. Iterative modifications preserve regular minors. |
| §7.7 | Strict rank one; bad point; smooth curve; nonreduced X | Kernel projectivity needs the final flattening. t-power cokernel is allowed; no everywhere-surjective claim. |
| §7.8 | Rank one/zero; repeated parameters; t_σ^m defect; nonreduced base | Coherent global flag and saturated special fibers are distinct. General fiber theorem restored with its descent route. |

## Lean audit and validation

The file has 317 lines, 11 real-bodied definitions/abbreviations, 13 theorem signatures and 16 examples. It introduces no admitted data or unavailable arithmetic carrier. The closing block records the heavy README constructions, including the added descent and realization details through its ASW/relative-realization entries. I checked all light definitions and examples, and spot-checked these ten signature groups against the README:

| Signature | Hypotheses and mathematical check |
| --- | --- |
| `psiOfLinearization_spec` | Actual S-linear equivalence and R-linear functional; pure tensors determine uniqueness. |
| `psiOfLinearization_leftInverse` | The normalization r(1)=1 is present. |
| `psiOfLinearization_natural` | Both realization equivalences and the intertwining tensor square are present. |
| `psiOfLinearization_semilinear` | Scalar endomorphisms, their compatibility and r-equivariance are explicit. |
| `psiOfLinearization_continuous` | Finite continuous coordinate maps and topological additive/scalar hypotheses suffice; no hidden analytic assertion. |
| `rankOnePsi_changeBasis` | a,b are units and the scalar projection formula is assumed; φ(b)ab⁻¹ and b⁻¹ have the right orientation. |
| `psiProjection_uniqueSplit` | ψφ=id gives the unique decomposition even when φ is not onto. |
| `herrDifferentials_sq` | Commutation is present and d¹ uses subtraction in the declared coordinate order. |
| `herrComparisonSection` | Commutation, left inverse, Bq=qB=P, qφ=0 and ψq=0 give both chain squares and FS=id. |
| `herrComparisonHomotopy` | Its weaker listed hypotheses already imply both equations; H²=(q,0) and id−SF have consistent signs. |

Validation on the submitted files:

- `lean-check` on Suggested.lean: exit 0, only declaration-uses-`sorry` warnings. Available memory exceeded 20 GiB before compilation. The build used the required Mathlib and Tau Ceti pins. No lake command was run in the current read-only environment.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PhiGammaModulesAndIwasawaCohomology.json`: 0 errors, 0 warnings; the accepted packet is unchanged.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/PhiGammaModulesAndIwasawaCohomology/Suggested.lean`: exit 0.
- `python3 research/blueprint/intake.py check-files` on the five allowed deliverables: 0 problems.
- `git diff --check`: clean. Changed paths are confined to the package README, Suggested.lean, review.json and this report; metadata remains `topic = "math.NT"`.

## Maintainer handoff

The package is ready for its draft TauCetiRoadmap PR with these fixes. There is no unresolved review blocker. Keep both KPX Corollary 6.3.6 qualifications when porting: ordinary dominant base change requires a dominant transform, and flat image after arbitrary further pullback is false without the regular-minor condition. The explicit counterexamples and the ℤ/4ℤ Lean example must travel with the package. They are source qualifications, not claims about a corrected publication version.

The local H_e/exponential move down into §5.7 should be reflected in higher regulator consumers when those jobs are handled. Preserve the field ψ-finiteness and residue-pairing prerequisites now placed in §4.3, including the slope-sign witness; the relative theorem must not supply its own field base case. Individual embedding-quotient perfectness belongs after the embedding ideals, in §7.1. Preserve the separation of ordinary Artinian Herr/Ext (LocalGaloisDeformationRings), nonequivariant period roofs (PadicHodgeTheory), and the retained localized/equivariant variants. Keep C_p symbolic in the residue and Iwasawa interfaces until an independently established numerical normalization is available. No GL₂ involution, semilinearity or radius-control theorem has been supplied by this package.

The review fixes require no edits to another job. No second issue was claimed. Source downloads and temporary logs are disposable; the report contains all continuation information needed for the port.

## Source-version record

The freely readable PDFs opened for this review are identified below by URL and SHA-256. These hashes identify the checked files, not an assertion that every section was read. No source passage is reproduced.

| File | SHA-256 |
| --- | --- |
| [KPX](https://arxiv.org/pdf/1203.5718v3) | `dfd271fa2ef3f329b717ad02637f77def77295bb9197843eba8851fde9212b8c` |
| [Pottharst](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf) | `41410c5e95be1f5e6db08b3176563b8d3076d3dacdf924ddd9f809b448190f9e` |
| [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf) | `e8c488028a3000313db2fee031506f1bb8414ec71af54b80ca97f01982b6950c` |
| [LLZ2010](https://wrap.warwick.ac.uk/id/eprint/38052/1/WRAP_Loeffler_modularforms.pdf) | `d0ce93d50a6734424baf1360982c7835570b761ed31fb8f0d184778510705dfe` |
| [CC1998](https://webusers.imj-prg.fr/~pierre.colmez/CCinv.pdf) | `cee9e8588ba1042fd0c52edc132eb3476b8ae9b65df6456047306d67118beb3f` |
| [CC1999](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf) | `d8f422d1f02a116ad3387826ec1947f8fa1afcac4ed8b89b6564e0e9f245f395` |
| [BergerExp](https://perso.ens-lyon.fr/laurent.berger/articles/article03.pdf) | `63c3f790eaf3cd3dea7c80c24fc69c51e3408323d39f6cfadd6aabc35520e3a6` |
| [BergerWach](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf) | `52e188211dfba449a92e5a8a66cc65379fe17688e6384a8eb6ece3a19a932110` |
| [BHS](https://numdam.org/item/10.1007/s10240-019-00111-y.pdf) | `34ffd69795468054b4caab7847d5ae90393826c889b187397dbe53e16993967a` |
| [DLB](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf) | `00fb89502da84ea38738734652733ea6487e13686a8e54d32eecf4575d6b0094` |
| [ColmezGL2](https://www.numdam.org/article/AST_2010__330__281_0.pdf) | `ccf1a070d4fd5d8b5aaf14591fd0c7390f4ec048c986b1f88a32e90f8c933568` |
| [KLfamilies](https://msp.org/ant/2010/4-7/ant-v4-n7-p06-s.pdf) | `2cd3c9c936458c8d315bd4f3d77a2783e6d36c6d81c41f1683d64829b720842a` |
| [BergerIntro](https://arxiv.org/pdf/math/0210184) | `fac038cb2e7a3c939f7b0c85d1060985876abc5d55407d7172fc1f6f2cc16ecc` |
| [Ding](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) | `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba` |
| [Liu](https://arxiv.org/pdf/0711.4346v2) | `07ff79cb2cf2e8d41c516c056996eafd1b8bcd877bcd307123f25b34b384ed24` |

The cleared KL-I manuscript is arXiv:1301.0792v5, SHA-256 `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942`; the cleared KL-II manuscript is SHA-256 `97383900492daf1c6778959c37e993f67dd5ad379ac03c31049b870382e5d42c`. Both were read in place from the maintainer's library. The relevant locators and checked results are recorded above.
