# Nikolaus–Scholze (2018): On topological cyclic homology, extraction and routing

Issue [#2192](https://github.com/CBirkbeck/tauceti-explorer/issues/2192). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Written by Claude Code, session cc-442dc5, on 23 September 2026.
- **The paper.** T. Nikolaus and P. Scholze, *On topological cyclic homology*, Acta Math. 221 (2018), 203–409, DOI 10.4310/ACTA.2018.v221.n2.a1; correction in Acta Math. 222 (2019), 215–218.
- **Items.** The result has **162 items: 0 library, 32 planned and 130 missing**. Every definition, construction, theorem, proposition, lemma and corollary is an item, with closely linked statements merged (the note names them). Every missing item is routed exactly once.
- **Mistakes.** 25 findings are recorded under `sourceIssues`: 19 new and 6 from the Acta correction.
  - **The one reaching a stated result.** Proposition II.3.4 identifies Cyc Sp with a fibre product over the p-cyclotomic categories. That is false in general, because the fibre product only asks each Frobenius to be C_{p^∞}-equivariant; KU with trivial action is a counterexample. The functor the proposition is used for exists (§II.6 builds it another way), and on bounded below objects the two notions agree.
  - **A gap in the proof of Theorem B.3.** The half-open cover of Δ/T does not cover it, and some intersections are empty. The theorem is true: closed intervals added in increasing order repair the argument.
  - **Misprints that matter to a formaliser.** The Steenrod degree shifts in Theorem IV.1.15 lack a factor 2: P^i lands in HF_p[2i(p−1)]. The p-series in Example I.2.3 should be (1 + x)^p − 1. The Dundas–Goodwillie–McCarthy statement (Theorem 1.2) omits "surjective".

## The version read

- **The published text, corrected.** The open-access Acta PDF from International Press (207 pages, created 31 March 2019, SHA-256 `8b1856fa…`) was read in full. It already contains the corrections of the 2019 Acta correction, which was also read in full. Locators and page numbers are the published ones.
- **arXiv v2 compared.** arXiv v2 (7 September 2018, the latest version) was compared at every finding. All nineteen new findings are also in arXiv v2.
- **The homepage copy.** Scholze's homepage copy is the July 2017 arXiv v1 text, so there is no later corrected version.

## What the paper proves

**The main results.**
- **Theorem II.6.9 (Theorem 1.4).** Say a cyclotomic spectrum is a spectrum with T-action and T ≅ T/C_p-equivariant maps φ_p: X → X^{tC_p} for every prime p. On bounded below spectra, the ∞-category of these is equivalent to the classical ∞-category of genuine cyclotomic spectra (built from orthogonal T-spectra and geometric fixed points).
- **Theorems II.4.10–II.4.11 and Corollary 1.5.** For bounded below X, TC(X) = fib(X^{hT} → ∏_p (X^{tC_p})^{hT}), with components φ_p^{hT} − can, recovering Bökstedt–Hsiang–Madsen's and Goodwillie's TC.
- **Theorem 1.7 (Proposition III.3.1 and Theorem III.1.7).** There is a unique lax symmetric monoidal Tate diagonal Δ_p: X → (X ⊗ … ⊗ X)^{tC_p}. For bounded below X it is a p-completion, which generalises the Segal conjecture for C_p.
- **The Frobenius on THH.** The Tate diagonal gives the Frobenius on THH(A) for every E_1-ring A without any point-set model. §III.6 proves it agrees with the classical one.

**The method.**
- **Tate constructions (Chapter I).** The main tools are:
  - the Tate orbit and fixpoint lemmas;
  - a multiplicative structure on −^{tG} that is unique, proved through Verdier quotients of stable ∞-categories;
  - a Farrell–Tate construction for the circle, built from Klein's dualizing spectrum.
- **Coalgebras for endofunctors (§II.5).** A general coreflection formula for coalgebras of endofunctors, applied to Φ^{C_p} with the Tate orbit lemma, proves the equivalence of Theorem II.6.9.
- **The appendices.** They develop symmetric monoidal Dwyer–Kan localisation of model categories, the cyclic and paracyclic categories with their realisations (Theorem B.3: Δ^op → Λ_∞^op is cofinal), and Bousfield–Kan homotopy colimits.

**Chapter IV.**
- **The Tate-valued Frobenius R → R^{tC_p} of an E_∞-ring.** It is the total Steenrod operation on HF_p and the Adams operation ψ^p on KU.
- **E_∞-rings.** For an E_∞-ring A, the Frobenius of THH(A) is characterised by McClure–Schwänzl–Vogt's universal property.
- **Loop spaces.** THH(S[ΩY]) ≃ Σ^∞_+LY, with Bökstedt–Hsiang–Madsen's formula for TC and a Segal conjecture for LY.
- **Characteristic p.** TC(F_p) follows from Bökstedt periodicity alone, and THH(F_p) ≃ sh_p(HZ_p^triv) as an E_∞-cyclotomic spectrum.

## What the atlas has

**Where the pieces live.**
- **RefinedTraceMethods RT.2 (proposed) plans this paper's subject almost word for word.** It plans:
  - THH by cyclic realisation, with the circle action as coherent data;
  - Tate constructions with the norm sequence and multiplicative structure;
  - cyclotomic spectra as Frobenius maps to Tate constructions;
  - TC, TC⁻ and TP with the bounded-below formula;
  - agreement with the classical genuine-equivariant TR/TC.
- **Other layers of RefinedTraceMethods.** RT.1 plans algebraic Hochschild homology and smooth characteristic-0 HKR, and RT.3 the trace and the Dundas–Goodwillie–McCarthy theorem.
- **EnhancedDerivedSheaves E5.** E5:abstract plans symmetric monoidal ∞-categories and stable categories, and E5:presentability Ind-completion and homotopy fixed points of group actions.
- **StableHomotopyKTheory.** H.1–H.2 plan nerves, realisations and Quillen's theorems, and H.5–H.6 spectra, p-completion and spectral sequences.
- **KTheoryFiniteLocalFields L.5.** It plans THH, TR and TC of perfect fields.
- **Not planned anywhere.** The Steenrod algebra, the Adams spectral sequence, power operations and the Segal conjecture.

**The libraries.** Neither library has spectra (the audit of H.5:spectra), ∞-categorical limits, stable ∞-categories or the cyclic category, so no item is `library`. The nearest declarations are:
- **Classical Tate cohomology.** Mathlib's `tateCohomology` for finite groups, and Tau Ceti's two-periodicity for cyclic groups (`Rep.FiniteCyclicGroup.periodicIso`).
- **Categorical foundations.** Mathlib's quasicategories and Kan complexes, model categories, and the 1-categorical monoidal localisation `CategoryTheory.Localization.Monoidal`.
- **Frobenius.** Mathlib's ring and Witt-vector Frobenius.

## Routes

- **RT.2, the main source.** Most of the paper, 107 items, is a source for RT.2. They include the planned items for which it is the canonical source, and what RT.2 needs but does not name:
  - the Tate orbit lemma and the uniqueness of the multiplicative structure;
  - the Farrell–Tate construction and the Tate diagonal;
  - the genuine-equivariant background for the classical comparison;
  - the coalgebra argument;
  - the Bökstedt construction;
  - the cyclic category;
  - the E_∞ and loop-space examples.
- **General foundations go to their owners.**
  - The ∞-categorical appendix, the Verdier quotients and the envelope statement go to EnhancedDerivedSheaves E5.
  - Realisations and homotopy colimits of spaces go to StableHomotopyKTheory H.1–H.2.
  - The HKR filtration and HH(F_p) go to RT.1.
  - §IV.4's computations for F_p go to KTheoryFiniteLocalFields L.5.
- **A Part II of StableHomotopyKTheory.** The Segal conjecture (for C_p, for bounded below spectra and for free loop spaces) and the power-operation identifications of §IV.1 need the Steenrod algebra and Adams spectral sequences, which nothing in the atlas plans. RT.2 does not need them, so they go to a Part II, PowerOperationsAndSegalConjecture, with a brief.

### Route 1: source of RefinedTraceMethods:RT.2

RT.2 plans exactly this paper's subject: THH of E_1-algebras by cyclic realisation with the circle action as coherent data, homotopy orbits, homotopy fixed points and Tate constructions with the norm sequence and multiplicative structure, cyclotomic spectra as Frobenius maps to Tate constructions, TC, TC⁻ and TP with the bounded-below fixed-point formula, and agreement with the classical genuine-equivariant TR/TC. The paper is the canonical source for all of it and more than RT.2 names: the Tate orbit and fixpoint lemmas, the uniqueness of the multiplicative structure, the Farrell–Tate construction for the circle, the lax equalizer, the Tate diagonal, the genuine-equivariant background needed for the classical comparison (orthogonal G-spectra, geometric fixed points, Borel completion, isotropy separation), the coalgebra argument behind Theorem II.6.9, the Bökstedt construction and the comparison of the two THH, the cyclic and paracyclic categories with their realisations, and the E_∞ and loop-space examples. The planned items included (Corollary 1.5, Definitions II.1.1, II.1.6, II.1.8, Theorems II.4.10–II.4.11 and others) are ones for which this paper is the source RT.2's design should follow.

**Missing items taken (92).** Tate spectra of Eilenberg–MacLane spectra (/11); Tate orbit lemma (/12); Tate fixpoint lemma (/13); Postnikov pieces of HF_p (/16); A non-split two-stage complex has vanishing Tate construction (/17); Postnikov convergence of orbits, fixed points and Tate (/18); Eilenberg–MacLane spectra satisfy both lemmas (/19); Tate vanishing when p is invertible (/20); Tate spectra of bounded below spectra are p-complete (/21); Multiplicativity of the Tate construction, with uniqueness (/22); Induced spectra with G-action (/27); Properties of induced spectra (/28); The Tate construction for a Kan complex (Farrell–Tate) (/30); The Spivak–Klein dualizing spectrum (/31); Integral T-Tate modulo n (/33); Lax equalizers (/36); Properties of lax equalizers (/37); Cyc Sp is presentable stable (/39); Orthogonal spectra (/42); Orthogonal G-spectra and geometric fixed points (/43); Genuine G-spectra (/44); Borel-complete genuine spectra (/45); Complete universes and the point-set geometric fixed points (/46); Geometric fixed points compose (/47); Isotropy separation for cyclic p-groups (/48); Geometric fixed points as a localisation (/49); Genuine C_{p^∞}- and F-genuine T-spectra (/50); Fixed points of R_{C_p} (/51); Genuine p-cyclotomic spectra (/52); Genuine cyclotomic spectra (/53); The forgetful functor from genuine to cyclotomic spectra (/54); Orthogonal cyclotomic spectra (/55); Orthogonal cyclotomic spectra model genuine ones (cited) (/56); Tate construction of C_{p^n} via C_p (/58); T-Tate and C_p-Tate (/59); The restriction pullback (/61); Fixed points of bounded below genuine C_{p^n}-spectra (/62); Iterated pullback for genuine fixed points (/63); Segal-conjecture reduction from C_{p^n} to C_p (/64); Coalgebras and fixed points of endofunctors (/67); The shifted coalgebra and its right adjoint (/68); The coreflection onto fixed points (/69); Formula for R_F (/70); Genuine p-cyclotomic spectra coreflect (/71); Coalgebras for endofunctors with terminal composites (/72); Fixed points of commuting endofunctors (/73); Coreflection one prime at a time (/74); Geometric fixed points commute with R_{C_q} (/75); Genuine cyclotomic spectra coreflect (/76); Φ^{C_p} preserves Borel-completeness (bounded below) (/77); The right adjoint on bounded below p-cyclotomic spectra (/78); Genuine and naive p-cyclotomic spectra agree (bounded below) (/79); Borel completeness for F-genuine T-spectra (/80); The right adjoint on bounded below cyclotomic spectra (/81); Main theorem: genuine and naive cyclotomic spectra agree (bounded below) (/82); T_p is exact (/83); Transformations out of the identity of Sp (/84); The Tate diagonal (/85); No Tate diagonal in D(Z) (/90); The Tate diagonal is uniquely lax symmetric monoidal (/94); The C_p-equivariant p-fold tensor functor (/96); Initiality of the tensor functor (/97); Bökstedt's category I and the approximation lemma (/98); The Bökstedt construction (/99); B preserves stable equivalences (Shipley) (/100); The Bökstedt construction models the tensor product (/101); Geometric fixed points of the Bökstedt construction (/102); Classical THH of an orthogonal ring spectrum (/103); Classical THH is an orthogonal cyclotomic spectrum (/104); Comparison of the two THH (/105); Models of geometric fixed points (/106); Uniqueness for the comparison of Frobenii (/107); The two cyclotomic structures agree (/108); The Tate-valued Frobenius (/109); Symmetric monoidal structure on cyclotomic spectra (/119); THH of an E_∞-ring is the tensor with the circle (McClure–Schwänzl–Vogt) (/120); The Frobenius of an E_∞-ring (/121); Cyclotomic structure on cyclic bar constructions (/122); Cyclic bar construction of a loop space (/123); TC with a Frobenius lift (/124); TC of spherical group rings (Bökstedt–Hsiang–Madsen) (/125); T-equivariant chain complexes and Tate constructions (/134); Trivial cyclotomic structures are left adjoint to TC (/136); The paracyclic and cyclic categories (/148); The cyclic category over Ass^⊗_act, and Δ as a slice (/149); Δ^op → Λ_∞^op is cofinal (/150); Geometric realisation of simplicial and paracyclic spaces (/152); Realisation of proper paracyclic and cyclic spaces and spectra (/154); Edgewise subdivision (/155); Tate construction and realisation (/156); Homotopy colimits of orthogonal spectra (/161); Fixed points commute with realisations and hocolims (/162).

**Planned items the paper is a good source for (15).** TC of a connective ring spectrum (Corollary 1.5) (/3); Residual Tate constructions are lax symmetric monoidal (/29); The circle norm and T-Tate construction (/32); Cyclotomic and p-cyclotomic spectra (/34); The cyclotomic sphere (/35); The ∞-categories of cyclotomic spectra (/38); TC as a mapping spectrum (/40); The fibre sequence for TC (/41); Genuine and naive TC agree; the main equivalence (/57); TR and genuine TC (Bökstedt–Hsiang–Madsen) (/60); Genuine p-typical TC is the modern one (/65); Genuine integral TC is the modern one (/66); THH of an E_1-ring (/92); The cyclotomic Frobenius of THH (/93); Realisation of cyclic objects carries a circle action (/151).

### Route 2: source of RefinedTraceMethods:RT.1

RT.1 owns algebraic Hochschild homology and plans HKR only for smooth algebras in characteristic 0. Proposition IV.4.1 is the derived HKR filtration for every commutative ring, built from the cotangent complex and derived exterior powers of DerivedDeRhamCohomology DD.0; Proposition IV.4.3, HH(F_p) as a divided power algebra, follows from it.

**Missing items taken (2).** The HKR filtration (/127); Hochschild homology of F_p (/129).

### Route 3: source of EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability

E5:abstract plans symmetric monoidal ∞-categories as cocartesian fibrations over Fin_*, operadic algebras, monoidal functors and stable categories, and E5:presentability Ind-completion; StableHomotopyKTheory, GeneralAlgebraicKTheory and RefinedTraceMethods all draw on this single supplier. The paper's Appendix A (Hinich's symmetric monoidal Dwyer–Kan localisation, symmetric monoidal model categories, left derivable cocartesian fibrations), the Verdier quotients of §I.3 with their symmetric monoidal version, and the envelope Fun_⊗(C^⊗_act, D) ≃ Fun_lax(C, D) of Proposition III.3.2 are general ∞-categorical statements that belong there, not in a trace roadmap.

**Missing items taken (12).** Stable subcategories and ⊗-ideals (/23); Verdier quotients of stable ∞-categories (/24); Ind-categories of Verdier quotients (/25); Symmetric monoidal Verdier quotients (/26); Lax functors and the active part (/95); Symmetric monoidal Dwyer–Kan localisation (/140); Hinich's theorem (/141); Symmetric monoidal model categories give symmetric monoidal ∞-categories (/142); Left derivable cocartesian fibrations (/143); Localising left derivable cocartesian fibrations (/144); Descent for cocartesian fibrations (/145); Cat_∞ is generated by Δ⁰ and Δ¹ (/146).

**Planned items the paper is a good source for (3).** E_1-algebras and the Segal description (/91); Symmetric monoidal ∞-categories and (lax) symmetric monoidal functors (/139); Ass^⊗, cuts and Δ^op → Ass^⊗ (/147).

### Route 4: source of StableHomotopyKTheory:H.1, StableHomotopyKTheory:H.2

H.1 plans nerves and their geometric realisation, and H.2 the levelwise-equivalence theorem and bisimplicial realisation under cofibrancy hypotheses. The paper's facts about geometric realisation of proper simplicial spaces in compactly generated weak Hausdorff spaces (commuting with finite limits, the gluing lemma, homotopy invariance, agreement with the ∞-categorical colimit) and the Bousfield–Kan homotopy colimit of spaces are these layers' concerns; the spectrum-level and equivariant versions stay with RT.2, which alone needs them.

**Missing items taken (4).** Proper simplicial spaces realise to colimits (/153); Geometric realisation preserves finite limits (/157); Gluing lemma for spaces (/158); Bousfield–Kan homotopy colimits of spaces (/160).

**Planned items the paper is a good source for (1).** Realisation of proper simplicial spaces is homotopical (/159).

### Route 5: source of KTheoryFiniteLocalFields:L.5

L.5 plans THH, TR and TC of perfect fields. §IV.4 computes THH(F_p)^{hT}, THH(F_p)^{tT}, the Frobenius and TC(F_p) from Bökstedt periodicity alone, identifies THH(F_p) as the E_∞-cyclotomic spectrum sh_p(HZ_p^triv), and gives the characteristic-p fibre sequence; these are sources for L.5's calculation, and Bökstedt periodicity and the TC(F_p) computation, already planned there, are included.

**Missing items taken (4).** THH and HH agree in low degrees (/128); THH(F_p) as a cyclotomic E_∞-ring (/135); THH(F_p) ≃ sh_p(HZ_p^triv) (/137); TC of rings of characteristic p (/138).

**Planned items the paper is a good source for (4).** Bökstedt periodicity (cited) (/130); Negative topological cyclic homology of F_p (/131); Periodic topological cyclic homology of F_p and its Frobenius (/132); TC of F_p (/133).

### Route 6: Part II — Homotopy foundations for algebraic K-theory, Part II: power operations and the Segal conjecture for C_p (PowerOperationsAndSegalConjecture, area topology)

The paper's generalised Segal conjecture (Theorem III.1.7) rests on the Segal conjecture for C_p and the Lunøe-Nielsen–Rognes computation for HF_p, both Adams-spectral-sequence calculations; §IV.1 identifies the Tate-valued Frobenius with Steenrod and Adams operations through power operations. Nothing in the atlas plans the Steenrod algebra, the Adams spectral sequence, extended powers or power operations, and RT.2 needs none of them to construct cyclotomic spectra or TC. StableHomotopyKTheory owns spectra, p-completion and spectral sequences (H.5, H.6), so these computations extend it in its own direction; its summary disclaims 'all of stable homotopy theory', hence a Part II rather than new layers in it.

**Brief for the design job.** Design PowerOperationsAndSegalConjecture, the Part II of Homotopy foundations for algebraic K-theory (StableHomotopyKTheory), following Nikolaus–Scholze, On topological cyclic homology (Acta Math. 221 (2018)), §§III.1 and IV.1, and the classical inputs they cite. Final theorems, as the paper states them (with its misprints corrected): Theorem III.1.7 — for every bounded below spectrum X, the Tate diagonal Δ_p: X → (X ⊗ … ⊗ X)^{tC_p} exhibits the target as the p-completion of X, which fails without the bounded below hypothesis ((KU ⊗ KU)^{tC_2} is rational); Theorem IV.1.15 with Proposition IV.1.16 — the Tate-valued Frobenius HF_p → (HF_p^{tC_p})^{hF_p^×} is the product of the Steenrod squares Sq^i: HF_2 → HF_2[i] for p = 2, and of P^i: HF_p → HF_p[2i(p−1)] and βP^i: HF_p → HF_p[2i(p−1)+1] for odd p (the printed shifts [i(p−1)] are misprints), with the HZ variant through reduction; Theorem IV.1.21 — postcomposition with Σ^nφ_R is Rezk's degree-n power operation R^n(X) → R^{n·ρ}(BΣ_p × X) followed by can; Proposition IV.1.12 — the Tate-valued Frobenius of KU is the Adams operation ψ^p on KU⁰(X) ⊗ Q_p and, as a map KU → KU_p^∧[1/p] ≃ (KU^{tC_p})^{hF_p^×}, the stable ψ^p followed by completion (β ↦ pβ); Theorem IV.3.7 — for simply connected Y the Frobenius of THH(S[ΩY]) = Σ^∞_+LY is a p-completion and (Σ^∞_+LY)^{C_{p^n}} → (Σ^∞_+LY)^{hC_{p^n}} is a p-adic equivalence. Cover: the Segal conjecture for C_p (S → S^{tC_p} is a p-completion; Lin for p = 2, Gunawardena for odd p), with what it needs — the mod p Steenrod algebra, the Adams spectral sequence for inverse limits of spectra, Lin's Ext computation or the Singer construction; the HF_p case HF_p ≃ (HF_p^{⊗p})^{tC_p} (Lunøe-Nielsen–Rognes, the topological Singer construction); the reduction from HF_p to all bounded below X (Postnikov truncation, Lemma I.2.6, the pro-isomorphism Lemma III.1.8); extended powers and twisted cohomology R^{n·ρ}(X × BΣ_p) through Thom spectra of parametrised spectra (Lemma IV.1.19), Rezk's power operations and Lemmas IV.1.3, IV.1.7, IV.1.17–IV.1.20 with Corollaries IV.1.8–IV.1.10; the Steenrod operations as the components of the power operation of HF_p ([BMMS, VIII.2]); Atiyah's cyclic power operation in K-theory; the examples S^{hC_p} and KU of Example I.2.3 and the spherical Witt vectors of Example IV.1.2; and Kuhn's convergence for Σ^∞_+ of the cosimplicial model of LY, Y simply connected. Import rather than re-plan: from Hochschild, cyclotomic and refined trace methods (RefinedTraceMethods) RT.2, the Tate construction and its multiplicativity, the Tate diagonal with its uniqueness and lax symmetric monoidal structure, the Tate-valued Frobenius, cyclotomic spectra and THH(S[ΩY]) ≃ Σ^∞_+LY, and from RT.4:topological the spectrum KU and Bott periodicity; from this roadmap's H.5 and H.6, spectra, p-completion, Postnikov towers and spectral sequences with their convergence; from Enhanced derived categories of sheaves (EnhancedDerivedSheaves) E5:abstract, symmetric monoidal ∞-categories and E_∞-rings; from the Tau Ceti roadmap Algebraic topology of spaces and manifolds (tauceti:TauCetiRoadmap/AlgebraicTopology, stage 6) singular cohomology with cup products. Keep the bounded below hypothesis of Theorem III.1.7 visible, and state the Segal conjecture only for C_p: the paper claims nothing for other finite groups.

**Missing items taken (16).** The sphere violates the Tate fixpoint lemma (/14); KU violates the Tate orbit lemma (/15); The Segal conjecture for C_p (cited) (/86); The base case HF_p (cited) (/87); The generalised Segal conjecture for C_p (/88); Pro-isomorphism for finite towers (/89); The Tate-valued Frobenius on π_0 and for spherical Witt vectors (/110); Refinements of the Tate diagonal (/111); The space-level diagonal factors the Tate diagonal (/112); Homotopy fixed points of p-th tensor powers (/113); The Tate-valued Frobenius is a power operation (/114); The Tate-valued Frobenius of KU is the Adams operation (/115); The Tate-valued Frobenius of HF_p is the total Steenrod operation (/116); Suspensions of the Tate construction (/117); Power operations in positive degree (/118); The Segal conjecture for free loop spaces (/126).

## Prerequisite papers the atlas does not cover

- J. Lurie, Higher Topos Theory, Annals of Mathematics Studies 170, Princeton University Press, 2009 (arXiv:math/0608040). [69]: presentable ∞-categories, Kan extensions, localisations, Quillen's Theorem A and siftedness, used throughout.
- J. Lurie, Higher Algebra (2017) (https://www.math.ias.edu/~lurie/papers/HA.pdf). [71]: stable and symmetric monoidal ∞-categories, ∞-operads, E_1- and E_∞-algebras, ambidexterity (6.1.6.7, 6.1.6.12), the Ass^⊗ and Fin_* formalism of Appendix A.
- T. Nikolaus, Stable ∞-operads and the multiplicative Yoneda lemma (2016) (arXiv:1608.02901). [81, Corollaries 6.8–6.9]: initiality of id_Sp, Ω^∞ and Σ^∞_+ among lax symmetric monoidal functors; the uniqueness behind Proposition III.3.1, Theorem III.4.5 and Lemmas III.3.7, IV.1.3, IV.1.7.
- S. Lunøe-Nielsen and J. Rognes, The topological Singer construction, Doc. Math. 17 (2012), 861–909 (https://doi.org/10.4171/dm/384). [80]: HF_p → (HF_p^{⊗p})^{tC_p} is an equivalence, the base case of Theorem III.1.7.
- W. H. Lin, On conjectures of Mahowald, Segal and Sullivan, Math. Proc. Cambridge Philos. Soc. 87 (1980), 449–458 (https://doi.org/10.1017/s0305004100056887). [66]: the Segal conjecture for C_2 (Remark III.1.6); J. H. C. Gunawardena's 1980 Knight prize essay [44] gives odd p and is not publicly available.
- G. Carlsson, Equivariant stable homotopy and Segal's Burnside ring conjecture, Ann. of Math. 120 (1984), 189–224 (https://doi.org/10.2307/2006940). [25]: the reduction of the Segal conjecture to C_p, cited in Remark III.1.6.
- L. Hesselholt and I. Madsen, On the K-theory of finite algebras over Witt vectors of perfect fields, Topology 36 (1997), 29–101 (https://doi.org/10.1016/0040-9383(96)00003-1). [47]: the classical orthogonal cyclotomic spectrum THH, Proposition 2.5 behind Theorem III.4.7, and the constants λ_n of Proposition 5.4 that Corollary IV.4.16 sets to 1.
- M. Bökstedt, W. C. Hsiang and I. Madsen, The cyclotomic trace and algebraic K-theory of spaces, Invent. Math. 111 (1993), 465–539 (https://doi.org/10.1007/bf01231296). [23]: genuine TC, TR and the restriction and Frobenius maps (Definition II.4.4), and TC(S[ΩY]) (Theorem IV.3.6).
- A. J. Blumberg and M. A. Mandell, The homotopy theory of cyclotomic spectra, Geom. Topol. 19 (2015), 3105–3147 (https://doi.org/10.2140/gt.2015.19.3105). [19]: the model-∗-category of cyclotomic spectra compared in Remarks II.6.4 and II.6.10.
- C. Barwick and S. Glasman, Cyclonic spectra, cyclotomic spectra, and a conjecture of Kaledin (2016) (arXiv:1602.02163). [11]: Theorem II.3.7, orthogonal cyclotomic spectra present Cyc Sp^gen.
- V. Hinich, Dwyer–Kan localization revisited, Homology Homotopy Appl. 18 (2016), 27–48 (https://doi.org/10.4310/hha.2016.v18.n1.a3). [50]: Proposition A.5.
- J. R. Klein, The dualizing spectrum of a topological group, Math. Ann. 319 (2001), 421–456 (https://doi.org/10.1007/pl00004441). [59]: D_{BG} and the vanishing of the circle Tate construction on induced objects (Corollary I.4.3).
- S. Schwede, Lectures on equivariant stable homotopy theory (2016) (http://www.math.uni-bonn.de/people/schwede/equivariant.pdf). [85]: orthogonal (G-)spectra, geometric fixed points and π_*-isomorphisms (Definitions II.2.1–II.2.3, Proposition II.2.4).
- M. A. Mandell and J. P. May, Equivariant orthogonal spectra and S-modules, Mem. Amer. Math. Soc. 159 (2002) (https://doi.org/10.1090/memo/0755). [74]: the gluing lemma for orthogonal G-spectra (Lemma C.8, Proposition C.14).
- B. Shipley, Symmetric spectra and topological Hochschild homology, K-Theory 19 (2000), 155–183 (https://doi.org/10.1023/a:1007892801533). [87]: the Bökstedt construction preserves stable equivalences and models the smash product (Theorems III.4.4–III.4.5).
- J. McClure, R. Schwänzl and R. Vogt, THH(R) ≅ R ⊗ S¹ for E_∞ ring spectra, J. Pure Appl. Algebra 121 (1997), 137–159 (https://doi.org/10.1016/s0022-4049(97)00118-7). [79]: Proposition IV.2.2.
- M. F. Atiyah, Power operations in K-theory, Quart. J. Math. Oxford 17 (1966), 165–193 (https://doi.org/10.1093/qmath/17.1.165). [7]: the cyclic power operation and θ^p with ψ^p = V^p − pθ^p (Proposition IV.1.12).
- R. R. Bruner, J. P. May, J. E. McClure and M. Steinberger, H_∞ Ring Spectra and their Applications, Lecture Notes in Math. 1176, Springer, 1986 (https://doi.org/10.1007/bfb0075405). [24, VIII.2]: Steenrod operations as power operations (proof of Proposition IV.1.16).
- N. J. Kuhn, The McCord model for the tensor product of a space and a commutative ring spectrum, Progr. Math. 215 (2004), 213–236 (https://doi.org/10.1007/978-3-0348-7863-0_13). [63]: convergence of Σ^∞_+LY ≃ lim_Δ (Σ^∞_+Y)^{⊗(n+1)} for simply connected Y (Theorem IV.3.7).
- B. I. Dundas, T. G. Goodwillie and R. McCarthy, The Local Structure of Algebraic K-Theory, Springer, 2013 (https://doi.org/10.1007/978-1-4471-4393-2). [32]: Theorem 1.2 and Bökstedt's approximation lemma (Lemma III.4.2).

## Mistakes found (`sourceIssues`)

Locators are in the corrected published text; every new finding is also in arXiv v2. The last six entries are the Acta correction's, recorded as known so that formalisers work from the corrected statements. Where each was searched for an existing correction is recorded in the result.

- **E1** (error; affects a stated result), Proposition II.3.4 and its proof, p. 259 (also arXiv v2).
  - *Printed:* There is a natural functor Cyc Sp^gen → Cyc Sp = Sp^{BT} ×_{∏_{p∈P} Sp^{BC_{p^∞}}} ∏_{p∈P} Cyc Sp_p. … The induced functor Cyc Sp^gen → ∏_{p∈P} Sp^{BC_{p^∞}} lifts to a functor Cyc Sp^gen → Sp^{BT} by looking at the underlying spectrum with T-action
  - *Correction:* Drop the identification. Cyc Sp (Definition II.1.6(i)) asks each φ_p to be T ≅ T/C_p-equivariant, while the fibre product only records φ_p as a C_{p^∞}-equivariant map. The natural functor Cyc Sp^gen → Cyc Sp does exist: it is the one of §II.6, Cyc Sp^gen ⊆ CoAlg_{(Φ^{C_p})}(TSp_F) → CoAlg_{(−^{tC_p})}(Sp^{BT}) ≃ Cyc Sp (Lemma II.5.8), where the residual T/C_p-action on Φ^{C_p}X makes each Frobenius T-equivariant. On bounded below objects X^{tC_p} is p-complete (Lemma I.2.9) and C_{p^∞} → T is a p-adic equivalence, as the proof of Theorem II.4.11 uses, so there the two notions of Frobenius agree.
  - *Why:* Both sides are categorical fibrations over Sp^{BT}, so an equivalence would give equivalences of fibres. Over X = KU with trivial T-action the fibres are ∏_p Ω^∞W_p^{hT} and ∏_p Ω^∞W_p^{hC_{p^∞}}, with W_p = map(KU, KU^{tC_p}). W_p is a rational KU-module, as KU^{tC_p} is rational (Example I.2.3(iii)), so W_p^{hC_{p^∞}} ≃ W_p, BC_{p^∞} being rationally a point. The fibre of W_p^{hT} → W_p is Σ^{−2}W_p^{hT} (Gysin sequence; W_p is complex oriented), and W_p^{hT} ≠ 0 because the non-zero map KU → KU^{hC_p} → KU^{tC_p} is T-equivariant (as in Example II.1.2(ii)). Being 2-periodic, Σ^{−2}W_p^{hT} has non-zero homotopy in non-negative degrees, so Ω^∞W_p^{hT} → Ω^∞W_p is not an equivalence. The authors' Remark II.1.3 notes the same difference between T- and C_{p^∞}-equivariant Frobenius maps outside the p-complete bounded below case.
- **E2** (gap; affects the proof), Proof of Theorem B.3, p. 383 (also arXiv v2).
  - *Printed:* We now apply this criterion to the ∞-category C = Δ/T = Δ ×_{Λ∞} Λ∞/T with the 'covering' given by U_t := C[t, t+1), t ∈ T, where C[a, b) … consists of pairs (S, ϕ) … such that ϕ(S) ⊆ [a, b) ⊆ T. … Finite intersections of U_t's are always also of the form C[a, b), where b ⩽ a+1. … It follows that U1 ∪...∪Un is also weakly contractible
  - *Correction:* Use closed intervals U_t = C[t, t+1], which do cover C: a simplex (S_0, ϕ_0) → … → (S_k, ϕ_k) has all ϕ_i(S_i) inside ϕ_k(S_k) ⊆ [ϕ_k(min), ϕ_k(min) + 1]. For a ≤ b ≤ a + 1, C[a, b] ≅ Δ/[k] (k + 1 the number of points of T in [a, b]) has a terminal object. Add the U_t for consecutive t_0 < t_1 < … of T ∩ [−N, N] in increasing order: (U_{t_0} ∪ … ∪ U_{t_{n−1}}) ∩ U_{t_n} = C[t_n, t_{n−1} + 1] is contractible, so each window is weakly contractible by the pushout step, and C is the filtered union of the windows. The last line of the induction should read U_0 ∪ … ∪ U_n.
  - *Why:* The half-open U_t do not cover C: for T = Z (n = 1) and S = [1], ϕ(k, 0) = k, ϕ(k, 1) = k + 1 is non-decreasing and Z-equivariant on Z × [1], but ϕ({0} × S) = {0, 1} lies in no [t, t + 1). And the criterion needs every finite intersection weakly contractible, while U_0 ∩ U_1 = C[1, 1) is empty (so is any C[a, b) with b ≤ a, which the reduction to Δ/[k−1] with k ≥ 1 silently excludes). The theorem is true, by the argument above.
- **E3** (misprint; affects nothing), Theorem 1.2, p. 208 (also arXiv v2).
  - *Printed:* If A → Ā is a map of connective associative and unital algebras in Sp such that π0 A → π0 Ā has nilpotent kernel, then [the square K(A) → TC(A) over K(Ā) → TC(Ā)] is homotopy cartesian.
  - *Correction:* … such that π_0A → π_0Ā is surjective with nilpotent kernel …
  - *Why:* The Dundas–Goodwillie–McCarthy theorem is for nilpotent extensions; the notation Ā and Theorem 1.1 ('a surjection … with nilpotent kernel') show the intent. Without surjectivity the statement fails for HZ → HQ (kernel zero): the fibre of K(Z) → K(Q) is ⊕_p K(F_p), which is connective, while TC(Z) is (−2)-connective and TC(Q) = HQ^{hT} (all Tate constructions vanish rationally) has π_{−2} = Q, so the fibre of TC(Z) → TC(Q) has π_{−3} ⊇ Q.
- **E4** (misprint; affects nothing), Example I.2.3(iii), p. 220 (also arXiv v2).
  - *Printed:* π∗(KU^{tCp}) ≅ KU∗((x))/[p](x) ≅ KU∗((x))/((x−1)^p − 1) … The p²-series of the multiplicative group law is given by [p²](x) = (x−1)^{p²} − 1
  - *Correction:* [p](x) = (1 + x)^p − 1 and [p²](x) = (1 + x)^{p²} − 1, the series of the multiplicative formal group law x + y + xy (or ±((1 − x)^p − 1) for x + y − xy).
  - *Why:* A p-series has zero constant term, but for odd p, (x − 1)^p − 1 has constant term −2, so it is no p-series (for p = 2 it is (1 − x)² − 1, a unit multiple of [2](x) for x + y − xy, so harmless). The paper itself writes π_*KU^{tC_p} ≅ π_*KU((t))/((t+1)^p − 1) on p. 329.
- **E5** (misprint; affects nothing), Displays before Theorem IV.1.15 and Theorem IV.1.15, p. 332 (also arXiv v2).
  - *Printed:* (HF_p^{tC_p})^{hF_p^×} = ∏_{n∈Z} (HF_p[n(p−1)] ⊕ HF_p[n(p−1)+1]) … (HZ^{tC_p})^{F_p^×} = ∏_{n∈Z} HF_p[n(p−1)] … P^i: HF_p → HF_p[i(p−1)], i ⩾ 0 and βP^i: HF_p → HF_p[i(p−1)+1]
  - *Correction:* HF_p[2n(p−1)] ⊕ HF_p[2n(p−1)+1]; (HZ^{tC_p})^{hF_p^×} = ∏_n HF_p[2n(p−1)]; P^i: HF_p → HF_p[2i(p−1)] and βP^i: HF_p → HF_p[2i(p−1)+1].
  - *Why:* P^i raises degree by 2i(p−1). The paper's own computation agrees: F_p^× acts on t by a character of order p − 1 and trivially on e, so the invariant classes t^{(p−1)n} and t^{(p−1)n}e sit in cohomological degrees −2(p−1)n and −2(p−1)n − 1, and Proposition IV.1.16 uses |t^{p−1}| = −2(p−1). Checked on the page image of p. 332.
- **E6** (misprint; affects nothing), Proof of Lemma II.2.11, p. 252 (also arXiv v2).
  - *Printed:* Φ̃^G_U X := hocolim_{V∈U, V^H=0} X(R^n ⊗ ρ_G ⊕ V)^G, and the maps into hocolim_{V∈U, V^H=0}
  - *Correction:* V^G = 0 in all three homotopy colimits.
  - *Why:* H does not occur in Lemma II.2.11; the comparison is with Φ^G_U of Definition II.2.10 for H = G, indexed by V with V^G = 0.
- **E7** (misprint; affects nothing), §II.5, before Lemma II.5.10, p. 275 (also arXiv v2).
  - *Printed:* since it is a limit of presentable ∞-categories along left adjoint funtors, by Proposition II.5.9
  - *Correction:* by Lemma II.5.9
  - *Why:* There is no Proposition II.5.9; Lemma II.5.9 (Fix_{(F_i)}(C) ≃ C^{hN_{>0}}) is meant.
- **E8** (misprint; affects nothing), Proof of Theorem II.5.13, p. 278 (also arXiv v2).
  - *Printed:* specializing the formula above to r=0 and m=0
  - *Correction:* r = 1 and m = 0
  - *Why:* r runs over integers prime to p indexing C_{p^m} × C_r ⊆ T; the trivial subgroup is m = 0, r = 1 (C_0 is undefined).
- **E9** (misprint; affects nothing), Remark IV.1.11, p. 328 (also arXiv v2).
  - *Printed:* taking the quotient of the ring R0 (BΣp ) by the transfer ideal I ⊆R0 (X ×BΣp )
  - *Correction:* the quotient of R⁰(X × BΣ_p) by the transfer ideal I
  - *Why:* I is an ideal of R⁰(X × BΣ_p), and the diagram that follows uses R⁰(X × BΣ_p)/I.
- **E10** (misprint; affects nothing), Proofs of Lemma IV.1.18, p. 335, and Lemma IV.1.20, p. 339 (also arXiv v2).
  - *Printed:* can ∘ P^n_k : Ω^∞Σ^nR → Ω^∞((Σ^{n·ρ}R)^{tC_p})^{hF_p^×} … is given by the power operation P^k_p
  - *Correction:* P^n_p in both places
  - *Why:* The degree-n power operation is P^n_p throughout §IV.1 ((12) and Lemma IV.1.20); k is undefined.
- **E11** (misprint; affects nothing), Proposition IV.4.6, p. 358 (also arXiv v2).
  - *Printed:* one can choose ũ and V, so that ũv=p
  - *Correction:* ũ and v
  - *Why:* V is not defined; v ∈ π_{−2}THH(HF_p)^{hT} is.
- **E12** (misprint; affects nothing), Proof of Theorem A.7, p. 374 (also arXiv v2).
  - *Printed:* Assertions (3) and (4) of Theorem A.7 immediately follow from (2) of Proposition A.15 and (1) of Corollary A.14.
  - *Correction:* (2) of Proposition A.14 and (1) of Corollary A.15
  - *Why:* Proposition A.14 and Corollary A.15 are the other way round.
- **E13** (misprint; affects nothing), Proof of Lemma A.16(2), p. 375 (also arXiv v2).
  - *Printed:* such that the pullback of Fj along Si → Sj is given by Fj
  - *Correction:* … is given by F_i
  - *Why:* The gluing condition compares F_j pulled back to S_i with F_i.
- **E14** (misprint; affects nothing), Example A.10, p. 371 (also arXiv v2).
  - *Printed:* on the subcategory Fun′(N(M), D) the endofunctor G defines a colocalization
  - *Correction:* the endofunctor R defines a colocalization
  - *Why:* G is an object of Fun′(N(M), D); the endofunctor is R, R(G)(X) = G(X_c).
- **E15** (misprint; affects nothing), Proof of Proposition A.14, p. 379 (also arXiv v2).
  - *Printed:* by assumption (3) in Definition A.14 of a left derivable cocartesian fibration
  - *Correction:* Definition A.8
  - *Why:* Left derivable cocartesian fibrations are defined in Definition A.8.
- **E16** (gap; affects the proof), Proof of Proposition B.15, p. 392 (also arXiv v2).
  - *Printed:* we use the fact that filtered colimits of pointed spaces are computed as the colimit of the underlying diagram of spaces
  - *Correction:* The colimits in question are indexed by N(Λ_∞^op), which is sifted (Corollary B.4), not filtered; use that colimits over weakly contractible (in particular sifted) diagrams in S_* are computed in S.
  - *Why:* The fact as stated covers only filtered colimits and does not apply to geometric realisations; the correct one is equally standard.
- **E17** (misprint; affects nothing), Proof of Lemma B.12, display (20), p. 389 (also arXiv v2).
  - *Printed:* |Δ^n| × Hom^surj_{Λ∞}(j∞[n], T) → |j*Λ^T_∞| is surjective, where Hom^inj_{Λ∞}(j∞[n], T) denotes the set of those maps
  - *Correction:* Use one name, Hom^inj, in (20) and after.
  - *Why:* The set defined, and used again in the next paragraph and in the essential-simplex argument, is Hom^inj.
- **E18** (misprint; affects nothing), Definition C.4, p. 400 (also arXiv v2).
  - *Printed:* hocolim_I X := |∐_{i_0→...→i_n} X(i_n)|
  - *Correction:* ∐_{i_0→…→i_n} X(i_0) (or strings i_0 ← … ← i_n with X(i_n), as in Bousfield–Kan)
  - *Why:* With the standard face maps, deleting i_n needs a map X(i_n) → X(i_{n−1}), which a covariant X does not supply; the value at the source of the string is the one that is functorial. Checked on the page image.
- **E19** (misprint; affects nothing), Proof of Proposition C.3, p. 400 (also arXiv v2).
  - *Printed:* the result follows by passing to the limit. This does not create problems, since all maps involved in this filtered limit are h-cofibrations
  - *Correction:* passing to the colimit … in this filtered colimit
  - *Why:* |X_•| is the union (colimit) of its skeleta, as the next sentence says.
- **E20** (misprint; affects nothing), pp. 204, 205 and 207 of the printed version (four displayed formulas of the introduction).
  - *Printed:* HC(A) (p. 204, twice) and TC(A) (pp. 205, 207)
  - *Correction:* HC⁻(A) and TC⁻(A)
  - *Why:* Typesetting losses of the superscript minus, listed by the Acta correction. *Known:* Correction to 'On topological cyclic homology', Acta Math. 222 (2019), 215–218 (DOI 10.4310/ACTA.2019.v222.n1.a2); the online version is corrected.
- **E21** (misprint; affects nothing), pp. 215–218 of the printed version (six displays of §I.1).
  - *Printed:* Nm
  - *Correction:* Nm_G, Nm_δ, Nm_f, Nm_f, Nm_G, Nm_f (in the order listed by the correction)
  - *Why:* Lost subscripts, listed by the Acta correction. *Known:* Correction to 'On topological cyclic homology', Acta Math. 222 (2019), 215–218 (DOI 10.4310/ACTA.2019.v222.n1.a2); the online version is corrected.
- **E22** (misprint; affects nothing), pp. 240, 260 (four times), 281, 284 and the bibliography of the printed version.
  - *Printed:* [?]
  - *Correction:* [91] Blumberg–Mandell, The homotopy theory of cyclotomic spectra, Geom. Topol. 19 (2015), 3105–3147 (reference [19] in the renumbered online version)
  - *Why:* A missing bibliography entry, listed by the Acta correction. *Known:* Correction to 'On topological cyclic homology', Acta Math. 222 (2019), 215–218 (DOI 10.4310/ACTA.2019.v222.n1.a2); the online version is corrected.
- **E23** (misprint; affects nothing), Printed version: p. 270 (Lemma II.5.4 square), p. 290 (diagram (5)), p. 325 (second diagram of Lemma IV.1.3), p. 377 (diagram in the proof of Proposition A.14).
  - *Printed:* four commutative diagrams with misplaced arrows and labels
  - *Correction:* the diagrams as reprinted in the correction
  - *Why:* Typesetting, listed by the Acta correction. *Known:* Correction to 'On topological cyclic homology', Acta Math. 222 (2019), 215–218 (DOI 10.4310/ACTA.2019.v222.n1.a2); the online version is corrected.
- **E24** (error; affects the proof), Proof of Proposition III.3.6, p. 301, lines 7–8 of the printed version (and arXiv v2).
  - *Printed:* here, applied to E = Sp⊗act … Fun⊗(E, E) is itself symmetric monoidal (using the Day convolution)
  - *Correction:* E = C⊗act, and Fun_⊗(E, E) with the pointwise tensor product
  - *Why:* The functor from the envelope N(Fin)^≃ must send a finite set I to the tensor power X ↦ X^{⊗I} of the identity, a pointwise tensor product of symmetric monoidal functors; and E is the envelope of the given C, not of Sp. Corrected by the Acta correction. *Known:* Correction to 'On topological cyclic homology', Acta Math. 222 (2019), 215–218 (DOI 10.4310/ACTA.2019.v222.n1.a2); the online version is corrected.
- **E25** (misprint; affects nothing), Printed version: p. 291 line −9, p. 361 (last display), p. 364 line −9, p. 365 (fourth display), pp. 388 and 398.
  - *Printed:* namley; F_p (three times); HẐ_p; Fin; mySet
  - *Correction:* namely; HF_p; HZ_p; Fin_*; Set
  - *Why:* Symbol and spelling slips, listed by the Acta correction. *Known:* Correction to 'On topological cyclic homology', Acta Math. 222 (2019), 215–218 (DOI 10.4310/ACTA.2019.v222.n1.a2); the online version is corrected.

## Gaps

- **G-inputs** (deferred). Cited theorems — the Segal conjecture for C_p (Lin, Gunawardena), Lunøe-Nielsen–Rognes's HF_p computation, Bökstedt periodicity, Hinich's Proposition A.5, Barwick–Glasman's Theorem II.3.7, Shipley's Theorems III.4.4–III.4.5, Klein's dualizing spectrum — were read only as the paper states them. Suppliers named in the routes; prerequisites list the sources.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NIKOLAUS-SCHOLZE-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-NIKOLAUS-SCHOLZE-18.result.json research/blueprint/papers/PAPER-NIKOLAUS-SCHOLZE-18.md`: ok.
- **Library checks.** Mathlib 082e2d3 and Tau Ceti f790474 were searched (git grep) for quasicategories, Kan complexes, spectra, Tate cohomology, group cohomology, cyclic categories and Connes's Λ, the simplex category, nerves, stable and triangulated categories, monoidal localisation, model categories, Hochschild homology, cyclotomic spectra, Tate constructions, ∞-categories, Dwyer–Kan, Steenrod, power and Adams operations, the Segal conjecture, free loop spaces, orthogonal spectra, Witt-vector Frobenius and Bökstedt. There are no spectra and no ∞-categorical limits, so nothing is `library`. The near misses are recorded in item notes: Mathlib's tateCohomology and Tau Ceti's Rep.FiniteCyclicGroup.periodicIso (classical Tate cohomology), CategoryTheory.Localization.Monoidal (1-categorical), HomotopicalAlgebra.ModelCategory, frobenius and WittVector.frobenius. Steenrod appears only as the Eilenberg–Steenrod axioms. The library audit lists RT.1, RT.2, E5:abstract, E5:presentability, H.5:spectra and H.6 as not built and L.5 as partly built (Witt vectors only).
- **Checked by cc-442dc5.**
  - The KU counterexample to Proposition II.3.4's identification (E1).
  - The failure of the half-open cover in Theorem B.3 and the closed-interval repair (E2).
  - The HZ → HQ counterexample to Theorem 1.2 without surjectivity (E3), and the p-series of Example I.2.3 against the paper's own p. 329 (E4).
  - The F_p^×-invariants of Ĥ^*(C_p; F_p) behind the Steenrod shifts (E5), on the page image of p. 332; Definition C.4 on the page image of p. 400.

## Item index

| Item | Kind | Name | Locator | Status | Layers or declarations |
|---|---|---|---|---|---|
| /1 | theorem | Goodwillie's rational comparison (cited) | Introduction, Theorem 1.1, p. 204 | planned | RefinedTraceMethods:RT.3 |
| /2 | theorem | Dundas–Goodwillie–McCarthy (cited) | Introduction, Theorem 1.2, p. 208 | planned | RefinedTraceMethods:RT.3 |
| /3 | theorem | TC of a connective ring spectrum (Corollary 1.5) | Introduction, Corollary 1.5, p. 209 | planned | RefinedTraceMethods:RT.2 |
| /4 | definition | Pointed, preadditive, additive and stable ∞-categories | §I.1, Definition I.1.1, p. 214 | planned | EnhancedDerivedSheaves:E5:abstract |
| /5 | definition | G-equivariant objects | §I.1, Definition I.1.2, p. 214 | planned | EnhancedDerivedSheaves:E5:presentability, RefinedTraceMethods:RT.2 |
| /6 | definition | Homotopy orbits and homotopy fixed points | §I.1, Definition I.1.5, p. 215 | planned | EnhancedDerivedSheaves:E5:presentability, RefinedTraceMethods:RT.2 |
| /7 | theorem | Norms for truncated maps (cited from Higher Algebra) | §I.1, Lemma I.1.8, p. 216 | planned | RefinedTraceMethods:RT.2 |
| /8 | construction | The norm map of a relative finite groupoid | §I.1, Definition I.1.10, p. 217 | planned | RefinedTraceMethods:RT.2 |
| /9 | theorem | Equivariance of the norm for a normal subgroup | §I.1, Example I.1.12, p. 217 | planned | RefinedTraceMethods:RT.2 |
| /10 | definition | The Tate construction | §I.1, Definition I.1.13, p. 218 | planned | RefinedTraceMethods:RT.2 |
| /11 | theorem | Tate spectra of Eilenberg–MacLane spectra | §I.1, Definition I.1.13 (the paragraph after), p. 218 | missing | routed: RefinedTraceMethods:RT.2 |
| /12 | theorem | Tate orbit lemma | §I.2, Lemma I.2.1, p. 218 | missing | routed: RefinedTraceMethods:RT.2 |
| /13 | theorem | Tate fixpoint lemma | §I.2, Lemma I.2.2, p. 219 | missing | routed: RefinedTraceMethods:RT.2 |
| /14 | theorem | The sphere violates the Tate fixpoint lemma | §I.2, Example I.2.3, p. 219 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /15 | theorem | KU violates the Tate orbit lemma | §I.2, Example I.2.3, p. 219 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /16 | theorem | Postnikov pieces of HF_p | §I.2, Lemma I.2.4, p. 221 | missing | routed: RefinedTraceMethods:RT.2 |
| /17 | theorem | A non-split two-stage complex has vanishing Tate construction | §I.2, Lemma I.2.5, p. 221 | missing | routed: RefinedTraceMethods:RT.2 |
| /18 | theorem | Postnikov convergence of orbits, fixed points and Tate | §I.2, Lemma I.2.6, p. 222 | missing | routed: RefinedTraceMethods:RT.2 |
| /19 | theorem | Eilenberg–MacLane spectra satisfy both lemmas | §I.2, Lemma I.2.7, p. 223 | missing | routed: RefinedTraceMethods:RT.2 |
| /20 | theorem | Tate vanishing when p is invertible | §I.2, Lemma I.2.8, p. 223 | missing | routed: RefinedTraceMethods:RT.2 |
| /21 | theorem | Tate spectra of bounded below spectra are p-complete | §I.2, Lemma I.2.9, p. 224 | missing | routed: RefinedTraceMethods:RT.2 |
| /22 | theorem | Multiplicativity of the Tate construction, with uniqueness | §I.3, Theorem I.3.1, p. 225 | missing | routed: RefinedTraceMethods:RT.2 |
| /23 | definition | Stable subcategories and ⊗-ideals | §I.3, Definition I.3.2, p. 225 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /24 | theorem | Verdier quotients of stable ∞-categories | §I.3, Theorem I.3.3, p. 225 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /25 | theorem | Ind-categories of Verdier quotients | §I.3, Proposition I.3.5, p. 228 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /26 | theorem | Symmetric monoidal Verdier quotients | §I.3, Theorem I.3.6, p. 230 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /27 | definition | Induced spectra with G-action | §I.3, Definition I.3.7, p. 231 | missing | routed: RefinedTraceMethods:RT.2 |
| /28 | theorem | Properties of induced spectra | §I.3, Lemma I.3.8, p. 231 | missing | routed: RefinedTraceMethods:RT.2 |
| /29 | theorem | Residual Tate constructions are lax symmetric monoidal | §I.3, Corollary I.3.9, p. 233 | planned | RefinedTraceMethods:RT.2 |
| /30 | theorem | The Tate construction for a Kan complex (Farrell–Tate) | §I.4, Theorem I.4.1, p. 235 | missing | routed: RefinedTraceMethods:RT.2 |
| /31 | definition | The Spivak–Klein dualizing spectrum | §I.4, Definition I.4.2, p. 235 | missing | routed: RefinedTraceMethods:RT.2 |
| /32 | theorem | The circle norm and T-Tate construction | §I.4, Corollary I.4.3, p. 238 | planned | RefinedTraceMethods:RT.2 |
| /33 | theorem | Integral T-Tate modulo n | §I.4, Lemma I.4.4, p. 239 | missing | routed: RefinedTraceMethods:RT.2 |
| /34 | definition | Cyclotomic and p-cyclotomic spectra | §II.1, Definition II.1.1, p. 240 | planned | RefinedTraceMethods:RT.2 |
| /35 | theorem | The cyclotomic sphere | §II.1, Example II.1.2, p. 240 | planned | RefinedTraceMethods:RT.2 |
| /36 | definition | Lax equalizers | §II.1, Definition II.1.4, p. 241 | missing | routed: RefinedTraceMethods:RT.2 |
| /37 | theorem | Properties of lax equalizers | §II.1, Proposition II.1.5, p. 241 | missing | routed: RefinedTraceMethods:RT.2 |
| /38 | definition | The ∞-categories of cyclotomic spectra | §II.1, Definition II.1.6, p. 244 | planned | RefinedTraceMethods:RT.2 |
| /39 | theorem | Cyc Sp is presentable stable | §II.1, Corollary II.1.7, p. 244 | missing | routed: RefinedTraceMethods:RT.2 |
| /40 | definition | TC as a mapping spectrum | §II.1, Definition II.1.8, p. 245 | planned | RefinedTraceMethods:RT.2 |
| /41 | theorem | The fibre sequence for TC | §II.1, Proposition II.1.9, p. 245 | planned | RefinedTraceMethods:RT.2 |
| /42 | definition | Orthogonal spectra | §II.2, Definition II.2.1, p. 246 | missing | routed: RefinedTraceMethods:RT.2 |
| /43 | definition | Orthogonal G-spectra and geometric fixed points | §II.2, Definition II.2.3, p. 248 | missing | routed: RefinedTraceMethods:RT.2 |
| /44 | definition | Genuine G-spectra | §II.2, Definition II.2.5, p. 248 | missing | routed: RefinedTraceMethods:RT.2 |
| /45 | theorem | Borel-complete genuine spectra | §II.2, Theorem II.2.7, p. 250 | missing | routed: RefinedTraceMethods:RT.2 |
| /46 | definition | Complete universes and the point-set geometric fixed points | §II.2, Definition II.2.10, p. 252 | missing | routed: RefinedTraceMethods:RT.2 |
| /47 | theorem | Geometric fixed points compose | §II.2, Proposition II.2.12, p. 253 | missing | routed: RefinedTraceMethods:RT.2 |
| /48 | theorem | Isotropy separation for cyclic p-groups | §II.2, Proposition II.2.13, p. 254 | missing | routed: RefinedTraceMethods:RT.2 |
| /49 | theorem | Geometric fixed points as a localisation | §II.2, Proposition II.2.14, p. 255 | missing | routed: RefinedTraceMethods:RT.2 |
| /50 | definition | Genuine C_{p^∞}- and F-genuine T-spectra | §II.2, Definition II.2.15, p. 256 | missing | routed: RefinedTraceMethods:RT.2 |
| /51 | theorem | Fixed points of R_{C_p} | §II.2, Corollary II.2.16, p. 256 | missing | routed: RefinedTraceMethods:RT.2 |
| /52 | definition | Genuine p-cyclotomic spectra | §II.3, Definition II.3.1, p. 257 | missing | routed: RefinedTraceMethods:RT.2 |
| /53 | definition | Genuine cyclotomic spectra | §II.3, Definition II.3.3, p. 259 | missing | routed: RefinedTraceMethods:RT.2 |
| /54 | construction | The forgetful functor from genuine to cyclotomic spectra | §II.3, Proposition II.3.4, p. 259 | missing | routed: RefinedTraceMethods:RT.2 |
| /55 | definition | Orthogonal cyclotomic spectra | §II.3, Definition II.3.6, p. 259 | missing | routed: RefinedTraceMethods:RT.2 |
| /56 | theorem | Orthogonal cyclotomic spectra model genuine ones (cited) | §II.3, Theorem II.3.7, p. 260 | missing | routed: RefinedTraceMethods:RT.2 |
| /57 | theorem | Genuine and naive TC agree; the main equivalence | §II.3, Theorem II.3.8, p. 260 | planned | RefinedTraceMethods:RT.2 |
| /58 | theorem | Tate construction of C_{p^n} via C_p | §II.4, Lemma II.4.1, p. 261 | missing | routed: RefinedTraceMethods:RT.2 |
| /59 | theorem | T-Tate and C_p-Tate | §II.4, Lemma II.4.2, p. 262 | missing | routed: RefinedTraceMethods:RT.2 |
| /60 | definition | TR and genuine TC (Bökstedt–Hsiang–Madsen) | §II.4, Definition II.4.4, p. 263 | planned | RefinedTraceMethods:RT.2 |
| /61 | theorem | The restriction pullback | §II.4, Lemma II.4.5, p. 263 | missing | routed: RefinedTraceMethods:RT.2 |
| /62 | theorem | Fixed points of bounded below genuine C_{p^n}-spectra | §II.4, Proposition II.4.6, p. 263 | missing | routed: RefinedTraceMethods:RT.2 |
| /63 | theorem | Iterated pullback for genuine fixed points | §II.4, Corollary II.4.7, p. 263 | missing | routed: RefinedTraceMethods:RT.2 |
| /64 | theorem | Segal-conjecture reduction from C_{p^n} to C_p | §II.4, Corollary II.4.9, p. 265 | missing | routed: RefinedTraceMethods:RT.2 |
| /65 | theorem | Genuine p-typical TC is the modern one | §II.4, Theorem II.4.10, p. 265 | planned | RefinedTraceMethods:RT.2 |
| /66 | theorem | Genuine integral TC is the modern one | §II.4, Theorem II.4.11, p. 267 | planned | RefinedTraceMethods:RT.2 |
| /67 | definition | Coalgebras and fixed points of endofunctors | §II.5, Definition II.5.1, p. 267 | missing | routed: RefinedTraceMethods:RT.2 |
| /68 | construction | The shifted coalgebra and its right adjoint | §II.5, Construction II.5.2, p. 268 | missing | routed: RefinedTraceMethods:RT.2 |
| /69 | theorem | The coreflection onto fixed points | §II.5, Proposition II.5.3, p. 269 | missing | routed: RefinedTraceMethods:RT.2 |
| /70 | theorem | Formula for R_F | §II.5, Lemma II.5.4, p. 270 | missing | routed: RefinedTraceMethods:RT.2 |
| /71 | theorem | Genuine p-cyclotomic spectra coreflect | §II.5, Theorem II.5.6, p. 271 | missing | routed: RefinedTraceMethods:RT.2 |
| /72 | theorem | Coalgebras for endofunctors with terminal composites | §II.5, Lemma II.5.8, p. 273 | missing | routed: RefinedTraceMethods:RT.2 |
| /73 | theorem | Fixed points of commuting endofunctors | §II.5, Lemma II.5.9, p. 275 | missing | routed: RefinedTraceMethods:RT.2 |
| /74 | theorem | Coreflection one prime at a time | §II.5, Lemma II.5.10, p. 276 | missing | routed: RefinedTraceMethods:RT.2 |
| /75 | theorem | Geometric fixed points commute with R_{C_q} | §II.5, Lemma II.5.12, p. 277 | missing | routed: RefinedTraceMethods:RT.2 |
| /76 | theorem | Genuine cyclotomic spectra coreflect | §II.5, Theorem II.5.13, p. 277 | missing | routed: RefinedTraceMethods:RT.2 |
| /77 | theorem | Φ^{C_p} preserves Borel-completeness (bounded below) | §II.6, Lemma II.6.1, p. 279 | missing | routed: RefinedTraceMethods:RT.2 |
| /78 | theorem | The right adjoint on bounded below p-cyclotomic spectra | §II.6, Lemma II.6.2, p. 279 | missing | routed: RefinedTraceMethods:RT.2 |
| /79 | theorem | Genuine and naive p-cyclotomic spectra agree (bounded below) | §II.6, Theorem II.6.3, p. 280 | missing | routed: RefinedTraceMethods:RT.2 |
| /80 | theorem | Borel completeness for F-genuine T-spectra | §II.6, Lemma II.6.6, p. 281 | missing | routed: RefinedTraceMethods:RT.2 |
| /81 | theorem | The right adjoint on bounded below cyclotomic spectra | §II.6, Lemma II.6.8, p. 283 | missing | routed: RefinedTraceMethods:RT.2 |
| /82 | theorem | Main theorem: genuine and naive cyclotomic spectra agree (bounded below) | §II.6, Theorem II.6.9, p. 283 | missing | routed: RefinedTraceMethods:RT.2 |
| /83 | theorem | T_p is exact | §III.1, Proposition III.1.1, p. 285 | missing | routed: RefinedTraceMethods:RT.2 |
| /84 | theorem | Transformations out of the identity of Sp | §III.1, Proposition III.1.2, p. 286 | missing | routed: RefinedTraceMethods:RT.2 |
| /85 | definition | The Tate diagonal | §III.1, Definition III.1.4, p. 286 | missing | routed: RefinedTraceMethods:RT.2 |
| /86 | theorem | The Segal conjecture for C_p (cited) | §III.1, Remark III.1.6, p. 287 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /87 | theorem | The base case HF_p (cited) | §III.1, Theorem III.1.7 (proof), p. 289 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /88 | theorem | The generalised Segal conjecture for C_p | §III.1, Theorem III.1.7, p. 287 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /89 | theorem | Pro-isomorphism for finite towers | §III.1, Lemma III.1.8, p. 289 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /90 | theorem | No Tate diagonal in D(Z) | §III.1, Theorem III.1.10, p. 290 | missing | routed: RefinedTraceMethods:RT.2 |
| /91 | definition | E_1-algebras and the Segal description | §III.2, Definition III.2.1, p. 292 | planned | EnhancedDerivedSheaves:E5:abstract |
| /92 | definition | THH of an E_1-ring | §III.2, Definition III.2.3, p. 293 | planned | RefinedTraceMethods:RT.2 |
| /93 | construction | The cyclotomic Frobenius of THH | §III.2, §III.2 (construction of φ_p), p. 294 | planned | RefinedTraceMethods:RT.2 |
| /94 | theorem | The Tate diagonal is uniquely lax symmetric monoidal | §III.3, Proposition III.3.1, p. 296 | missing | routed: RefinedTraceMethods:RT.2 |
| /95 | theorem | Lax functors and the active part | §III.3, Proposition III.3.2, p. 297 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /96 | construction | The C_p-equivariant p-fold tensor functor | §III.3, Proposition III.3.6, p. 300 | missing | routed: RefinedTraceMethods:RT.2 |
| /97 | theorem | Initiality of the tensor functor | §III.3, Lemma III.3.7, p. 302 | missing | routed: RefinedTraceMethods:RT.2 |
| /98 | definition | Bökstedt's category I and the approximation lemma | §III.4, Lemma III.4.2, p. 303 | missing | routed: RefinedTraceMethods:RT.2 |
| /99 | definition | The Bökstedt construction | §III.4, Definition III.4.3, p. 304 | missing | routed: RefinedTraceMethods:RT.2 |
| /100 | theorem | B preserves stable equivalences (Shipley) | §III.4, Theorem III.4.4, p. 305 | missing | routed: RefinedTraceMethods:RT.2 |
| /101 | theorem | The Bökstedt construction models the tensor product | §III.4, Theorem III.4.5, p. 306 | missing | routed: RefinedTraceMethods:RT.2 |
| /102 | theorem | Geometric fixed points of the Bökstedt construction | §III.4, Theorem III.4.7, p. 308 | missing | routed: RefinedTraceMethods:RT.2 |
| /103 | definition | Classical THH of an orthogonal ring spectrum | §III.5, Definition III.5.1, p. 311 | missing | routed: RefinedTraceMethods:RT.2 |
| /104 | theorem | Classical THH is an orthogonal cyclotomic spectrum | §III.5, Proposition III.5.4, p. 314 | missing | routed: RefinedTraceMethods:RT.2 |
| /105 | theorem | Comparison of the two THH | §III.6, Theorem III.6.1, p. 316 | missing | routed: RefinedTraceMethods:RT.2 |
| /106 | construction | Models of geometric fixed points | §III.6, Proposition III.6.6, p. 320 | missing | routed: RefinedTraceMethods:RT.2 |
| /107 | theorem | Uniqueness for the comparison of Frobenii | §III.6, Theorem III.6.7, p. 322 | missing | routed: RefinedTraceMethods:RT.2 |
| /108 | theorem | The two cyclotomic structures agree | §III.6, Corollary III.6.8, p. 324 | missing | routed: RefinedTraceMethods:RT.2 |
| /109 | definition | The Tate-valued Frobenius | §IV.1, Definition IV.1.1, p. 324 | missing | routed: RefinedTraceMethods:RT.2 |
| /110 | theorem | The Tate-valued Frobenius on π_0 and for spherical Witt vectors | §IV.1, Example IV.1.2, p. 324 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /111 | theorem | Refinements of the Tate diagonal | §IV.1, Lemma IV.1.3, p. 325 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /112 | theorem | The space-level diagonal factors the Tate diagonal | §IV.1, Lemma IV.1.7, p. 327 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /113 | theorem | Homotopy fixed points of p-th tensor powers | §IV.1, Corollary IV.1.8, p. 327 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /114 | theorem | The Tate-valued Frobenius is a power operation | §IV.1, Corollary IV.1.10, p. 328 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /115 | theorem | The Tate-valued Frobenius of KU is the Adams operation | §IV.1, Proposition IV.1.12, p. 329 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /116 | theorem | The Tate-valued Frobenius of HF_p is the total Steenrod operation | §IV.1, Theorem IV.1.15, p. 332 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /117 | theorem | Suspensions of the Tate construction | §IV.1, Lemma IV.1.17, p. 334 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /118 | theorem | Power operations in positive degree | §IV.1, Theorem IV.1.21, p. 339 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /119 | construction | Symmetric monoidal structure on cyclotomic spectra | §IV.2, Construction IV.2.1, p. 341 | missing | routed: RefinedTraceMethods:RT.2 |
| /120 | theorem | THH of an E_∞-ring is the tensor with the circle (McClure–Schwänzl–Vogt) | §IV.2, Proposition IV.2.2, p. 342 | missing | routed: RefinedTraceMethods:RT.2 |
| /121 | theorem | The Frobenius of an E_∞-ring | §IV.2, Corollary IV.2.3, p. 343 | missing | routed: RefinedTraceMethods:RT.2 |
| /122 | theorem | Cyclotomic structure on cyclic bar constructions | §IV.3, Lemma IV.3.1, p. 345 | missing | routed: RefinedTraceMethods:RT.2 |
| /123 | theorem | Cyclic bar construction of a loop space | §IV.3, Proposition IV.3.2, p. 347 | missing | routed: RefinedTraceMethods:RT.2 |
| /124 | theorem | TC with a Frobenius lift | §IV.3, Proposition IV.3.4, p. 352 | missing | routed: RefinedTraceMethods:RT.2 |
| /125 | theorem | TC of spherical group rings (Bökstedt–Hsiang–Madsen) | §IV.3, Theorem IV.3.6, p. 354 | missing | routed: RefinedTraceMethods:RT.2 |
| /126 | theorem | The Segal conjecture for free loop spaces | §IV.3, Theorem IV.3.7, p. 354 | missing | routed: part-ii PowerOperationsAndSegalConjecture |
| /127 | theorem | The HKR filtration | §IV.4, Proposition IV.4.1, p. 356 | missing | routed: RefinedTraceMethods:RT.1 |
| /128 | theorem | THH and HH agree in low degrees | §IV.4, Proposition IV.4.2, p. 356 | missing | routed: KTheoryFiniteLocalFields:L.5 |
| /129 | theorem | Hochschild homology of F_p | §IV.4, Proposition IV.4.3, p. 357 | missing | routed: RefinedTraceMethods:RT.1 |
| /130 | theorem | Bökstedt periodicity (cited) | §IV.4, Theorem IV.4.4, p. 357 | planned | KTheoryFiniteLocalFields:L.5, RefinedTraceMethods:RT.2 |
| /131 | theorem | Negative topological cyclic homology of F_p | §IV.4, Proposition IV.4.6, p. 358 | planned | KTheoryFiniteLocalFields:L.5 |
| /132 | theorem | Periodic topological cyclic homology of F_p and its Frobenius | §IV.4, Corollary IV.4.8, p. 360 | planned | KTheoryFiniteLocalFields:L.5 |
| /133 | theorem | TC of F_p | §IV.4, Corollary IV.4.10, p. 361 | planned | KTheoryFiniteLocalFields:L.5 |
| /134 | theorem | T-equivariant chain complexes and Tate constructions | §IV.4, Lemma IV.4.12, p. 362 | missing | routed: RefinedTraceMethods:RT.2 |
| /135 | theorem | THH(F_p) as a cyclotomic E_∞-ring | §IV.4, Corollary IV.4.13, p. 362 | missing | routed: KTheoryFiniteLocalFields:L.5 |
| /136 | theorem | Trivial cyclotomic structures are left adjoint to TC | §IV.4, Proposition IV.4.14, p. 363 | missing | routed: RefinedTraceMethods:RT.2 |
| /137 | theorem | THH(F_p) ≃ sh_p(HZ_p^triv) | §IV.4, Corollary IV.4.16, p. 364 | missing | routed: KTheoryFiniteLocalFields:L.5 |
| /138 | theorem | TC of rings of characteristic p | §IV.4, §IV.4 (end), p. 364 | missing | routed: KTheoryFiniteLocalFields:L.5 |
| /139 | definition | Symmetric monoidal ∞-categories and (lax) symmetric monoidal functors | Appendix A, Definition A.1, p. 365 | planned | EnhancedDerivedSheaves:E5:abstract |
| /140 | definition | Symmetric monoidal Dwyer–Kan localisation | Appendix A, Definition A.4, p. 367 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /141 | theorem | Hinich's theorem | Appendix A, Proposition A.5, p. 367 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /142 | theorem | Symmetric monoidal model categories give symmetric monoidal ∞-categories | Appendix A, Theorem A.7, p. 368 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /143 | definition | Left derivable cocartesian fibrations | Appendix A, Definition A.8, p. 369 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /144 | theorem | Localising left derivable cocartesian fibrations | Appendix A, Proposition A.14, p. 372 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /145 | theorem | Descent for cocartesian fibrations | Appendix A, Lemma A.16, p. 375 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /146 | theorem | Cat_∞ is generated by Δ⁰ and Δ¹ | Appendix A, Lemma A.17, p. 376 | missing | routed: EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability |
| /147 | definition | Ass^⊗, cuts and Δ^op → Ass^⊗ | Appendix B, Appendix B (Ass^⊗ and cuts), p. 379 | planned | EnhancedDerivedSheaves:E5:abstract |
| /148 | definition | The paracyclic and cyclic categories | Appendix B, Appendix B (Λ_∞, Λ_p, Λ), p. 380 | missing | routed: RefinedTraceMethods:RT.2 |
| /149 | theorem | The cyclic category over Ass^⊗_act, and Δ as a slice | Appendix B, Proposition B.1, p. 381 | missing | routed: RefinedTraceMethods:RT.2 |
| /150 | theorem | Δ^op → Λ_∞^op is cofinal | Appendix B, Theorem B.3, p. 382 | missing | routed: RefinedTraceMethods:RT.2 |
| /151 | theorem | Realisation of cyclic objects carries a circle action | Appendix B, Proposition B.5, p. 384 | planned | RefinedTraceMethods:RT.2 |
| /152 | construction | Geometric realisation of simplicial and paracyclic spaces | Appendix B, Construction B.9, p. 387 | missing | routed: RefinedTraceMethods:RT.2 |
| /153 | theorem | Proper simplicial spaces realise to colimits | Appendix B, Lemma B.7, p. 386 | missing | routed: StableHomotopyKTheory:H.1, StableHomotopyKTheory:H.2 |
| /154 | theorem | Realisation of proper paracyclic and cyclic spaces and spectra | Appendix B, Proposition B.13, p. 390 | missing | routed: RefinedTraceMethods:RT.2 |
| /155 | theorem | Edgewise subdivision | Appendix B, Proposition B.19, p. 394 | missing | routed: RefinedTraceMethods:RT.2 |
| /156 | theorem | Tate construction and realisation | Appendix B, Proposition B.20, p. 395 | missing | routed: RefinedTraceMethods:RT.2 |
| /157 | theorem | Geometric realisation preserves finite limits | Appendix C, Proposition C.1, p. 398 | missing | routed: StableHomotopyKTheory:H.1, StableHomotopyKTheory:H.2 |
| /158 | theorem | Gluing lemma for spaces | Appendix C, Lemma C.2, p. 399 | missing | routed: StableHomotopyKTheory:H.1, StableHomotopyKTheory:H.2 |
| /159 | theorem | Realisation of proper simplicial spaces is homotopical | Appendix C, Proposition C.3, p. 399 | planned | StableHomotopyKTheory:H.2 |
| /160 | definition | Bousfield–Kan homotopy colimits of spaces | Appendix C, Definition C.4, p. 400 | missing | routed: StableHomotopyKTheory:H.1, StableHomotopyKTheory:H.2 |
| /161 | theorem | Homotopy colimits of orthogonal spectra | Appendix C, Proposition C.11, p. 403 | missing | routed: RefinedTraceMethods:RT.2 |
| /162 | theorem | Fixed points commute with realisations and hocolims | Appendix C, Lemma C.13, p. 404 | missing | routed: RefinedTraceMethods:RT.2 |
