# Nelson–Venkatesh (2021): The orbit method and analysis of automorphic forms, extraction and routing

Issue [#2190](https://github.com/CBirkbeck/tauceti-explorer/issues/2190). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Written by Claude Code, session cc-442dc5, on 23 September 2026.
  - It continues and supersedes the partial checkpoint of Claude Code session cc-d67081 (#2214). That checkpoint read arXiv v3's theorem statements only.
  - Its route ids and scope are kept. Each item's note gives the arXiv v3 theorem number and the checkpoint item it supersedes.
- **The paper.** P. D. Nelson and A. Venkatesh, *The orbit method and analysis of automorphic forms*, Acta Math. 226 (2021), 1–209, DOI 10.4310/ACTA.2021.v226.n1.a1.
- **Items.** The result has **113 items: 4 library, 5 planned and 104 missing** (99 before the red-team fixes; see "Fixes after the red team"). Every numbered statement is covered, with closely linked ones merged (the note names them). Every missing item is routed exactly once.
- **Mistakes.** 33 findings are recorded under `sourceIssues`, all new (E16–E33 were added by the red-team fixes). No erratum exists.
  - **A false main theorem in the smallest orthogonal case (E1).** The proof of Lemma 27.3 claims the spinor norm is surjective on SO_{n−1} for n − 1 ≥ 2. That is false for SO_2, whose spinor norms are norms from the quadratic field K.
    - For (G, H) = (SO3, SO2), which §25.7 allows, [H] may then meet only half of the components of [G].
    - When Π is dihedral for K, Theorem 27.1, Theorem 30.1, Corollaries 31.4 and 31.8 and the main Theorem 31.11 are false: the H-period vanishes for every Σ whose weight at q has one sign, so a one-sided family averages 0, not 1/2 (the red team's counterexample, RT-PAPER-NELSON-VENKATESH-21/1).
    - For every other Π the conclusion survives, by an orthogonality argument given in the finding, and the weak subconvex bound (1.4) holds in all cases.
  - **A gap reaching a stated result (E21).** The exact inequality (22.10) of Theorem 22.2(iii) is not proved outside U0; it holds with an added O(h^N), which is enough for the main theorems.
  - **A gap in a proof: Lemma 7.8.** The non-stationary-phase proof uses a second-order operator that does not reproduce e^{tφ}. The lemma is standard, and a first-order operator repairs the proof.
  - **A false example: after Lemma 24.10.** The example function is unbounded on the complementary series, although the lemma requires |f| ≤ 2 there.
  - **A wrong citation.** For the orthogonal non-vanishing of relative characters, the published text cites Wallach's book where arXiv v3 cites Waldspurger (Astérisque 346). That paper is missing from the published bibliography.
  - **The rest.** A normalisation slip that cancels (19.21), a missing h^j in (19.16), and misprints.

## The version read

- **The published text.** The open-access International Press PDF (209 pages, created 30 March 2021, SHA-256 `85e14654…`) was read in full. Locators and page numbers are the published ones.
- **arXiv v3.** arXiv v3 (7 January 2021, the latest version) was compared at every finding. All findings except the citation (which arose in typesetting) are also in v3.
- **Page images.** Pages 42, 50, 128, 130, 166 and 182 were checked on page images.

## What the paper proves

**Part I–II: a quantitative orbit method.** The paper builds, for any unitary representation π of a unimodular Lie group, an operator calculus Op_h(a) from symbols on g^∧. Its ingredients are:
- symbol classes S^m_δ and Sobolev-scale operator classes Ψ^m;
- star-product asymptotics, including for pairs of subalgebras;
- composition, near-equivariance and division;
- localisation near infinitesimal characters.

For tempered π of a reductive group, Rossmann's Kirillov formula turns this into trace estimates h^d tr Op_h(a) = ∫_{hO_π} a dω + … (Theorem 12.2), uniformly in π. Limit orbits of h-dependent π are controlled by Rossmann's continuity results.

**Part III: Gan–Gross–Prasad pairs.**
- **Stability.** For the orthogonal and unitary GGP pairs, x ∈ g is H-stable exactly when ev(x) ∩ ev(x_H) = ∅. Stable fibres are H-torsors (Theorems 14.2 and 14.5), and stability is the absence of conductor dropping for the Rankin–Selberg L-function (Lemma 15.4).
- **Measures.** Exact identities between volume forms (Theorem 16.7) yield disintegrations of orbital measures.
- **Relative characters.** Asymptotically, the relative character of a microlocalised operator is the integral of its symbol over O_{π,σ} (Theorem 19.3).

**Part IV: inverse branching.**
- **Archimedean places.** At the distinguished archimedean place there are families of vectors whose relative characters approximate any smooth weight on the stable tempered dual. Their contribution from non-tempered σ is small (Theorem 22.2).
- **p-adic places.** The same holds for "allowable" l-components, which include every cuspidal-type component (Theorem 24.5).

**Part V: the main theorem.**
- **Limit states.** For a fixed generic tempered Π on an anisotropic GGP pair, limit states of microlocalised vectors are invariant under unipotent centralisers of regular nilpotents.
- **Equidistribution.** Ratner's theorem makes them equidistributed on [H] (Theorem 27.1).
- **The average.** With a truncated spectral expansion this gives (1/|F_h|)Σ L(Π, Σ) → 1/τ(G) = 1/2 (Theorem 31.11), except for (SO3, SO2) with Π dihedral for K, where it is false (E1). Under Ichino–Ikeda/N. Harris this is an average of central Rankin–Selberg L-values in arbitrarily large rank, with a weak subconvex bound.

## What the atlas has

**The libraries.** Neither library has coadjoint orbits, Kirillov's formula, unitary representation calculi, Harish-Chandra characters, Plancherel measures or GGP periods. The four `library` items are general tools the proofs use:
- Mathlib's Schwartz space and Fourier transform;
- Stone–Weierstrass, Urysohn and Tietze;
- Arzelà–Ascoli and Radon–Nikodym;
- the Riesz–Markov–Kakutani theorem, `RealRMK.rieszMeasure` with `RealRMK.integral_rieszMeasure` (/106).

Tau Ceti has the spinor norm and its kernel (`CliffordAlgebra.spinorNorm`, `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm`), cited by /107; the local images it needs are missing.

**Planned elsewhere in the atlas.**
- **The Harish-Chandra isomorphism for semisimple Lie algebras:** Tau Ceti LieHighestWeight layer 7 (/28). Chevalley's restriction theorem and the reductive isomorphism are not planned anywhere (/102).
- **The Bernstein centre and supercuspidal support:** SmoothRepresentationsOfLocalGroups SR.3.
- **Strong approximation:** AdelicAlgebraicGroups AA.4.
- **The compactness criterion for anisotropic groups:** AdelicAlgebraicGroups AA.3 (/108).
- **Uniform admissibility:** SmoothRepresentationsOfLocalGroups SR.3a (/111).
- **Tamagawa measures:** AdelicAlgebraicGroups AA.2.
- **Spectral machinery:** AutomorphicSpectralTheory AS.0 and AS.4.

**Nothing plans** GGP pairs analytically, relative characters, inverse branching or limit states.
- **Ratner's theorem** is scheduled only generically, among the unipotent-flow proofs of GeometryOfNumbersAndQuadraticArithmetic GN.4, so /89 is missing and routed there (route 7).
- **A Gan–Gross–Prasad roadmap** has been proposed by six extractions but is not yet accepted, and it is algebraic.

## Routes

The routes keep cc-d67081's structure.

- **The machinery (76 items): a new roadmap, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.**
  - It takes the calculus of Parts I–II and Appendix A, the GGP stability geometry and volume forms, the relative-character asymptotics, inverse branching, and the limit states with the truncated spectral expansion.
  - It is new rather than a Part II of the Tau Ceti Lie-groups roadmap, because that representation-theory family explicitly excludes unitary duals of noncompact groups, Plancherel theory and the tempered spectrum.
  - Parts I–II come first in the brief and could be split off.
- **The automorphic statements (20 items): the proposed GanGrossPrasadConjecturesForClassicalGroups.** Six extractions already propose this roadmap. The items are:
  - GGP pairs and their eigenvalue invariants;
  - their L-functions and conductor dropping;
  - positivity, non-vanishing and multiplicity one for relative characters;
  - the branching coefficient and the Ichino–Ikeda/N. Harris conjecture;
  - Theorem 31.11 with the family size, the conductor and weak subconvexity.
- **Routes 3–9, added by the red-team fixes** after the review, as the last routes. The review has no verdict for them, so they are not applied until the next review of the extraction accepts them.
  - Route 3: the real Langlands classification (/30) to AutomorphicFormsOnReductiveGroups AF.1 (AF.1b once the RT-AREA-automorphic-1 fixes are applied).
  - Route 4: Harish-Chandra's real Plancherel formula (/64) to the AutomorphicSpectralTheory Part II that BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 proposes.
  - Route 5: Harish-Chandra's classification of tempered p-adic representations (/72) to SmoothRepresentationsOfLocalGroups SR.3, next to GAN-SAVIN-23.
  - Route 6: affine GIT and the Hilbert–Mumford criterion (/46) to the Reductive algebraic groups Part II that FINTZEN-21 proposes.
  - Route 7: Ratner's measure classification with the ergodic decomposition (/89) and Borel's density theorem (/113) to GeometryOfNumbersAndQuadraticArithmetic GN.4.
  - Route 8: Chevalley's restriction theorem and the reductive Harish-Chandra isomorphism (/102) to a LieHighestWeight Part II.
  - Route 9: the Schwartz kernel theorem (/105) to AutomorphicSpectralTheory AS.0.

### Route 1: new roadmap — The orbit method in quantitative form: microlocal analysis on representations of reductive groups (QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, area representations)

The id, title and scope are those of cc-d67081's checkpoint (#2214), extended to the whole paper. Nothing in the atlas plans coadjoint orbits, the Kirillov formula, a symbol calculus on unitary representations, relative characters, inverse branching or limit states, and the Tau Ceti representation-theory family explicitly excludes unitary duals of noncompact groups, Plancherel theory and the tempered spectrum (content/tau-ceti/RepresentationTheory/README.md), so a Part II there would be outside its direction. Parts I–II are the reusable core and come first in the brief; a reviewer may split them from Parts III–V. After RT-PAPER-NELSON-VENKATESH-21 (findings /5–/11), items /30, /46, /64 and /72 left this route for routes 3–6, and /100, /103, /107, /109, /110 and /112 joined it; its target is unchanged.

**Brief for the design job.** A new roadmap for the local and analytic machinery of Nelson–Venkatesh, The orbit method and analysis of automorphic forms (Acta Math. 226 (2021), 1–209; arXiv:1805.07750): a pseudodifferential calculus for unitary representations of Lie groups in which symbols on g^∧ are quantized to operators Op_h(a) and traces are integrals over coadjoint orbits, applied to Gan–Gross–Prasad restriction problems. Final theorems, as the paper states them (published numbering; arXiv v3 numbers the same theorems 1–24 consecutively): Theorems 4.5, 5.6, 5.8, 7.4, 8.11 (star product, Op(S^m) ⊆ Ψ^m, Op_h(S^m_δ) ⊆ h^{min(0,m)}Ψ^m_δ and the composition expansions, also for pairs g1 + g2 = g); Theorem 6.1 (Rossmann's Kirillov formula, cited) and Theorems 6.3, 12.2 (trace and trace-norm estimates uniform in tempered π); Theorem 11.1 and Lemma 11.6 (limit orbits; a fixed tempered π has non-empty limit orbit in N_reg iff it is generic); Theorems 14.2 and 14.5 (for a GGP pair, H-stability ⇔ ev(x) ∩ ev(x_H) = ∅; stable fibres O^{λ,µ} are H-torsors over an algebraically closed field, and empty or H-torsors over R); Theorems 16.7, 17.2 (compatibility of volume forms and disintegration of orbital measures); Theorem 19.3 (H_σ(Op_h(a)) = Σ_{j<J} h^j ∫_{hO_{π,σ}} D_j a + O(h^{(1−2δ)J}) on compact sets of H-stable elements); Theorem 22.2 and Theorem 24.5 (inverse branching at the distinguished archimedean place and at p-adic places, cuspidal-type l-components being allowable); Theorems 26.4–26.5, 27.1, 27.7 (limit states, their disintegration and equidistribution on [H]); Theorems 29.1 and 30.1 (truncated spectral expansion and the smoothly weighted formula (τ(H)/τ(G))∫k∫k′). Cover in this order: (1) symbol classes, operator classes, the star product and the composition, division and localization lemmas (Parts I–II); (2) coadjoint orbits, infinitesimal characters, the temperedness criterion (Lemma 9.4), limit orbits and trace estimates, with the K-type and Plancherel technicalities of Appendix A; (3) GIT stability for GGP pairs, volume forms and disintegration (§§14, 16–17); (4) relative characters and their stable asymptotics (§§18–19); (5) inverse branching (§§20–24); (6) limit states, Ratner-based equidistribution and the truncated spectral expansion (§§26–30). Keep δ < 1/2 (the Planck scale) and the h-dependent conventions of §1.14 visible. Theorem 27.1 (and Theorems 30.1 and 31.11) is false for (SO3, SO2) with Π dihedral for K = F(√−disc V_H), since the torus's spinor norms are norms from K (sourceIssues E1): state it with the hypothesis Π ≇ Π ⊗ (η_{K/F}∘θ) in that case. Import rather than re-plan: the exponential map, Ad, BCH and KAK from Lie groups and the Lie algebra correspondence (tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups, layers 0, 1, 3, 9), whose representation-theory family excludes unitary duals of noncompact groups; the Harish-Chandra isomorphism for semisimple Lie algebras from LieHighestWeight layer 7, and Chevalley's restriction theorem with the Harish-Chandra isomorphism for reductive g_C from the LieHighestWeight Part II proposed in route 8 (the real form [ig*] and λ_π are planned here); (g, K)-modules and infinitesimal characters from AutomorphicFormsOnReductiveGroups AF.1–AF.2; trace-class, Hilbert–Schmidt and spectral decomposition from AutomorphicSpectralTheory AS.0 and AS.4; Hecke algebras, induction, admissibility, uniform admissibility (SR.3a), the Bernstein centre and Harish-Chandra's classification of tempered representations (Lemma 23.4, route 5) from SmoothRepresentationsOfLocalGroups SR.1–SR.3 (and the proposed SmoothRepresentations Part II roadmaps for characters and the unitary dual, where accepted); Tamagawa measures, the compactness criterion for anisotropic groups and strong approximation from AdelicAlgebraicGroups AA.2, AA.3 and AA.4; Ratner's measure classification, the ergodic decomposition and Borel's density theorem from GeometryOfNumbersAndQuadraticArithmetic GN.4 (route 7); GGP pairs, local multiplicity one, the local period ∫_H⟨sv1, v2⟩⟨u1, su2⟩ with its convergence (18.1) and positivity, and the branching coefficient from GanGrossPrasadConjecturesForClassicalGroups (this roadmap keeps H_σ as the sum over B(σ), with Lemma 18.1(i)–(iii), because its proof uses Appendix A); the Langlands classification for real reductive groups from AutomorphicFormsOnReductiveGroups AF.1 (AF.1b once the RT-AREA-automorphic-1 fixes are applied; route 3); Harish-Chandra's Plancherel formula for real reductive groups from the Part II of AutomorphicSpectralTheory (route 4), which owns it; affine GIT quotients, the stable locus, the principal-bundle statement [MFK, Proposition 0.9] and the Hilbert–Mumford criterion in its stability form from the Part II of Tau Ceti's Reductive algebraic groups (route 6); the Schwartz kernel theorem from AutomorphicSpectralTheory AS.0 (route 9); the Riesz–Markov–Kakutani theorem from Mathlib (RealRMK.rieszMeasure, RealRMK.integral_rieszMeasure); the spinor norm and its kernel from Tau Ceti (CliffordAlgebra.spinorNorm, CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm). Cited inputs to plan here: Harish-Chandra's character theory, Rossmann's orbital results, Vogan and Blattner, Cowling–Haagerup–Howe, Kostant and Barbasch–Vogan on generic representations, Waldspurger's p-adic Plancherel formula with ∫ dim π^U < ∞ (no other owner), E. Nelson's and Nelson–Stinespring's theorems on ∆ (π^∞ = ∩D(∆^n)), Ranga Rao's local finiteness of orbital measures, Cartan's connectedness of simply connected real groups, the local images of the spinor norm and of det on unitary groups, and the Cotlar–Stein lemma (strong convergence).

**Missing items taken (76).** The operator assignment Op and its rescaling Op_h (/2); The star product and the composition formula (/3); Sobolev spaces and operator classes Ψ^m (/4); Composition and basic members of the operator classes (/5); Symbol classes S^m and S^m_δ (/6); Asymptotics of the star product (/7); Polynomial symbols (/8); h-dependent operator classes Ψ^m_δ (/9); Independence of the cut-off (/10); Near-equivariance (/11); Op maps symbols to operators, compatibly with composition (/12); The rescaled calculus (/13); Coadjoint orbits, normalized symplectic measure and multiorbits (/14); The Kirillov character formula (Rossmann; cited) (/15); Trace estimates for the calculus (/16); Star products for pairs of subalgebras (/17); Taylor bound for the BCH phase (/18); Non-stationary phase (/19); Localized symbols and dyadic–Planck partitions (/20); Remainder estimates for localized star products (/21); Asymptotics for convolution with a bump (/22); Fourier transforms of symbols away from the origin (/23); Membership criterion for Ψ^m (/24); L²-boundedness of order-zero operators (/25); The Cotlar–Stein lemma (cited) (/26); Composition across proper subgroups (/27); Infinitesimal characters of duals and conjugates (/29); Infinitesimal criterion for temperedness (/31); Eigenvalues of ∆ and infinitesimal characters (/32); Approximate division (/33); Localizing near the locus of a symbol (/34); Localizing near infinitesimal characters (/35); Topology on regular coadjoint multiorbits (after Rossmann) (/36); Uniform bounds for symplectic measures (/37); Limit orbits of fixed representations (/38); Refined trace estimates (/39); Uniform bounds for K-types and matrix coefficients (/40); Uniform trace-class property of ∆^{−N} (/41); Stability for GGP pairs (/47); Stable fibres are H-torsors (/48); Fibral, Haar, symplectic and affine volume forms (/52); The normalized affine form (/53); Compatibility of orbital volume forms (/54); Measure normalizations over R (/55); Stable fibres over R and the disintegration formulas (/56); A Łojasiewicz-type inequality (/57); Plancherel measure and affine measure (/58); Relative characters (/59); A-priori bounds for relative characters (/61); Asymptotics of relative characters in the stable case (/62); Small, medium and huge elements of S (/63); Plancherel formula for Ξ-integrable functions (/65); Orbit-distinction (/67); Archimedean inverse branching (/68); Test functions for the Weyl law (/69); Good compact open subgroups and invariant vectors (/70); l-components (/73); Allowable components and functions (/75); Cuspidal-type components are allowable (/76); Uniform distinction and the Stone–Weierstrass inputs (/77); Limit states (/82); Disintegration of limit states (/83); Equidistribution of limit states on [H] (/85); Reduction to G∞⁺-invariance (/86); Regular nilpotents (Kostant; cited) (/88); Unipotent-invariant measures are G∞⁺-invariant (/90); Reductive subgroups containing a regular nilpotent centralizer (/91); Period formula and Parseval identity (/92); Weak Weyl law and truncated spectral expansion (/93); Smoothly weighted asymptotic formula (/94); The p-adic Plancherel formula (Waldspurger; cited) and finiteness of ∫ dim π^U (/100); The real form [ig*] and the infinitesimal character λ_π (/103); Spinor norms, determinants and G(F_v)/G(F_v)⁺ (/107); Nelson's theorems on ∆ (cited) (/109); Local finiteness of orbital measures (Ranga Rao; cited) (/110); Connectedness of simply connected real groups (É. Cartan; cited) (/112).

### Route 2: new roadmap — The Gan–Gross–Prasad conjectures for classical groups: relevant pairs, Vogan packets, Bessel models and periods (GanGrossPrasadConjecturesForClassicalGroups, area automorphic)

The automorphic statements — GGP pairs, their L-functions and conductor dropping, positivity, non-vanishing and multiplicity one for relative characters, the branching coefficient, the Ichino–Ikeda and N. Harris conjecture, and the averaged-period theorem with its family size, conductor and weak subconvexity — belong with the Gan–Gross–Prasad roadmap that six extractions propose and the atlas does not yet contain; this follows cc-d67081's checkpoint. After RT-PAPER-NELSON-VENKATESH-21 (findings /8 and /11(a)) it also takes /101 (the local period and (18.1)) and /104 (local multiplicity one); its target is unchanged.

**Brief for the design job.** This route coalesces with GanGrossPrasadConjecturesForClassicalGroups, proposed by PAPER-JIANG-ZHANG-20 and extended by PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22, PAPER-BEUZARTPLESSIS-CHAUDOUARD-25, PAPER-LESLIE-25 and PAPER-LIU-ETAL-22; keep its id, title, area and brief. Nelson–Venkatesh add: GGP pairs in the k1-form of §13 (G = Aut(V, ⟨,⟩)⁰ ⊇ H = Aut(e^⊥)⁰, orthogonal, unitary and general linear), the eigenvalue invariants ev(x) and the isotropic-eigenvector criteria (Lemmas 13.1–13.2), sphericity of H ⊂ G × H (Lemma 13.3); the archimedean Satake parameters of the Rankin–Selberg L-function of a GGP pair, ev(A′) + ev(B′) (× {±1} in the unitary case), and the equivalence of stability with the absence of conductor dropping (Lemmas 15.2–15.4); the local period ∫_H⟨sv1, v2⟩⟨u1, su2⟩ of a GGP pair with its absolute convergence (18.1) (Ichino–Ikeda, N. Harris) for orthogonal, unitary and general linear pairs, extending the local normalised period of PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 (its item /4); local multiplicity one dim Hom_H(π, σ) ≤ 1 (the case ℓ = 0 of PAPER-JIANG-ZHANG-20's bessel-uniqueness, with Aizenbud–Gourevitch–Rallis–Schiffmann and Sun–Zhu for the general linear pairs); the positivity of the local period, and hence of relative characters (Remark 18.2, known non-archimedeanly by Sakellaridis–Venkatesh) and their non-vanishing exactly on the distinguished tempered dual (§20, Beuzart-Plessis; Waldspurger, Astérisque 346, Proposition 5.7); strong multiplicity one (Lemma 24.1, Mœglin–Waldspurger, Beuzart-Plessis); the global branching coefficient L(Π, Σ) defined by P = L(Π, Σ)·H (§25.4); the Ichino–Ikeda and N. Harris conjecture (Conjecture 25.1), which stays a conjecture except where W. Zhang proves it; and the main theorem (Theorem 31.11): under §25.7 (G, H anisotropic, (U_{n+1}, U_n) with n ≥ 1 or (SO_{n+1}, SO_n) with n ≥ 2, Π tempered at R, G quasi-split and Π generic at q, compact at the other archimedean places), (1/|F_h|)Σ_{Σ∈F_h} L(Π, Σ) = 1/τ(G) + o(1) = ½ + o(1), with the L-value form under Conjecture 25.1, the family size h^d|F_h| → τ(H)vol(U)vol(U′), C(Π, Σ) ≍ |F_h|⁴ and the weak subconvex bound L(Π, Σ) = o(C^{1/4}). Theorem 31.11 (and Theorem 27.1) is false for (SO3, SO2) with Π dihedral for K = F(√−disc V_H): state it with the hypothesis Π ≇ Π ⊗ (η_{K/F}∘θ) in that case (sourceIssues E1). The weak subconvex bound (1.4) holds in all cases. The machinery behind the theorem is routed by this extraction to QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups; keep this route to the automorphic statements and their consequences. That roadmap keeps the relative character H_σ as a sum over B(σ) (Lemma 18.1) and imports the local period from here.

**Missing items taken (20).** Gan–Gross–Prasad pairs (/42); Eigenvalue invariants ev(x) (/43); Eigenvalues and isotropic eigenvectors; a regularity criterion (/44); GGP pairs are spherical (cited) (/45); Infinitesimal characters and Langlands parameters (/49); Satake parameters of the Rankin–Selberg L-function (/50); Stability is absence of conductor dropping (/51); Positivity of relative characters (cited; archimedean case expected) (/60); Distinguished duals and the functionals ℓ_σ (/66); Strong multiplicity one (cited) and the structure of Ω (/74); Global setting, Tamagawa measures and assumptions (/79); The branching coefficient L(Π, Σ) (/80); The Ichino–Ikeda and N. Harris conjectures (conjectural; cited) (/81); Summing against approximable weights and sets (/95); Size of the family (Weyl law) (/96); Analytic conductor (/97); Main theorem: the averaged Gan–Gross–Prasad period (/98); Weak subconvexity (/99); The local period of a GGP pair and its convergence (18.1) (/101); Local multiplicity one for GGP pairs (cited) (/104).

### Route 3: source — AutomorphicFormsOnReductiveGroups (AutomorphicFormsOnReductiveGroups:AF.1)

Item /30, the Langlands classification for real reductive groups ([Kn, Theorem 8.54]), belongs to AutomorphicFormsOnReductiveGroups AF.1, 'Real reductive representation foundations', which owns real reductive representation theory. The RT-AREA-automorphic-1 fixes create AF.1b for the real Langlands classification; once they are applied this route's stage becomes AF.1b, as their §7 does for the AF.1 routes of CHENEVIER-TAIBI-20 and GAN-ICHINO-18. A source route rather than 'planned', because AF.1's text does not name the classification and AF.1b is not yet in data/atlas.json (RT-PAPER-NELSON-VENKATESH-21/5). PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/20(b) plans the same theorem and should import it. Route 1 imports it. Added by FIX-RT-PAPER-NELSON-VENKATESH-21 after the extraction's review, as the last route: PAPER-NELSON-VENKATESH-21.review.json has no verdict for it, so it is not applied until the next review of the extraction accepts it.

**Missing items taken (1).** The Langlands classification (cited) (/30).

### Route 4: Part II of AutomorphicSpectralTheory — Automorphic spectral theory and trace distributions, Part II: Schwartz multipliers and the isolation of cuspidal spectrum (AutomorphicSpectralTheoryPartIISchwartzMultipliers, area automorphic)

The real half of item /64 is the theorem that PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21's accepted Part II route already plans; routing it to the new orbit-method roadmap would plan it twice (RT-PAPER-NELSON-VENKATESH-21/5). The queue merges Part II proposals by parent, and that design comes first in the queue. The p-adic half is /100, which nothing else plans, and stays in route 1. Added by FIX-RT-PAPER-NELSON-VENKATESH-21 after the extraction's review, as the last route: PAPER-NELSON-VENKATESH-21.review.json has no verdict for it, so it is not applied until the next review of the extraction accepts it.

**Brief for the design job.** This route coalesces with the Part II of AutomorphicSpectralTheory proposed by PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 (its route 1, accepted; pending as DESIGN-AutomorphicSpectralTheoryPartII); keep its id, title, area and brief. That design already schedules Harish-Chandra's Plancherel formula for real reductive groups (its item /25, the L² form on the Schwartz algebra S(G)), and it is the single owner of that theorem. Nelson–Venkatesh (Appendix A, §A.3, p. 138) use it in this form: for a real reductive group G (complex groups included by restriction of scalars) and f ∈ C_c^∞(G), f(1) = ∫_{Ĝ_temp} χ_π(f) for the Plancherel measure dual to dg, extended by continuity to n-fold differentiable compactly supported f for n large in terms of G. State this form as well, deriving it from the L² form by polarisation ((f₂* ∗ f₁)(1) = ⟨f₁, f₂⟩) and the Dixmier–Malliavin theorem, and conversely by applying it to f* ∗ f. QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups imports it; the extension to Ξ-integrable functions (Lemma A.4) and Waldspurger's p-adic Plancherel formula stay there.

**Missing items taken (1).** The Plancherel formula for real reductive groups (Harish-Chandra; cited) (/64).

### Route 5: source — SmoothRepresentationsOfLocalGroups (SmoothRepresentationsOfLocalGroups:SR.3)

Item /72 (Lemma 23.4, p. 155: every tempered irreducible representation of a p-adic reductive group is a submodule of i_M σ with σ square-integrable, for a unique class (M, σ); [Wld, Proposition III.4.1]) belongs with SR.3's matrix-coefficient criteria for temperedness. PAPER-GAN-SAVIN-23 routes the same theorem to SR.3 (its item rev-langlands-classification-and-harish-chandra (b), route 3), so this route joins that one (RT-PAPER-NELSON-VENKATESH-21/6). SR.3 does not plan Waldspurger's p-adic Plancherel formula, which stays in route 1 (/100). Route 1 imports /72. Added by FIX-RT-PAPER-NELSON-VENKATESH-21 after the extraction's review, as the last route: PAPER-NELSON-VENKATESH-21.review.json has no verdict for it, so it is not applied until the next review of the extraction accepts it.

**Missing items taken (1).** Tempered representations from square-integrable ones (cited) (/72).

### Route 6: Part II of tauceti:TauCetiRoadmap/ReductiveGroups — Reductive algebraic groups, Part II: good characteristic and coadjoint invariant theory (ReductiveCoadjointInvariantTheoryPartII, area representations)

Affine GIT, the stable locus and the Hilbert–Mumford criterion are foundational invariant theory of reductive groups, not orbit-method material; FINTZEN-21's accepted Part II already plans semistability and Kempf's theorem in this direction, so /46 goes there rather than into the new roadmap (RT-PAPER-NELSON-VENKATESH-21/7). The queue merges Part II proposals by parent. Added by FIX-RT-PAPER-NELSON-VENKATESH-21 after the extraction's review, as the last route: PAPER-NELSON-VENKATESH-21.review.json has no verdict for it, so it is not applied until the next review of the extraction accepts it.

**Brief for the design job.** This route coalesces with the Part II of Tau Ceti's Reductive algebraic groups proposed by PAPER-FINTZEN-21 (its route 4, accepted), pending as DESIGN-ReductiveGroupsPartIII because ReductiveGroupsPartII exists; keep its id, title, area and brief. That design plans orbit closures, affine semistability and closed orbits (FINTZEN-21 /32) and Kempf's rational destabilising cocharacter (/32a). Nelson–Venkatesh (§14, Lemma 14.1, p. 96, and before (14.2), p. 97) need, for a reductive group H acting on an affine variety M over an algebraically closed field of characteristic 0: (1) the categorical quotient φ: M → M//H = Spec k[M]^H, affine, surjective and universal; (2) openness of the stable locus M^s (closed orbit, finite stabiliser) and of φ(M^s); (3) if stabilisers on M^s are trivial, M^s → φ(M^s) is a principal H-bundle, locally trivial in the étale topology [MFK, Proposition 0.9]; (4) the Hilbert–Mumford criterion in its stability form: x is not H-stable iff lim_{t→0} λ(t)x exists for some non-trivial cocharacter λ (for a linear action: λ has only non-negative weights on x). (4) follows from the closed-orbit form (Richardson, Kempf) with Matsushima's theorem (a closed orbit has reductive stabiliser, and an infinite reductive stabiliser contains a non-trivial torus); the null-cone form of /32a does not give it alone. The categorical quotient and Hilbert–Mumford are also sent to LanglandsParameterStacks LP2/LP3 by PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 (route 2, item /4) and PAPER-LAFFORGUE-18 (route 3, item /35): choose one owner with the maintainer, and let the other import. QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups imports (1)–(4), applied to H acting linearly on g (Theorem 14.2) and on m (Lemmas 19.7–19.8).

**Missing items taken (1).** GIT stability background (cited) (/46).

### Route 7: source — GeometryOfNumbersAndQuadraticArithmetic (GeometryOfNumbersAndQuadraticArithmetic:GN.4)

Ratner's measure classification in the generality of Theorem 27.7 (a connected real Lie group, a lattice, a subgroup generated by Ad-unipotent one-parameter subgroups), the ergodic decomposition [EW, §8.7] (both /89) and Borel's density theorem [Mo, Proposition 4.7.1] (/113, Lemma 27.8) go to GeometryOfNumbersAndQuadraticArithmetic GN.4, which owns unipotent-flow theorems: the merged RT-AREA-iwasawa-1 fixes keep the real case there and put the p-adic and S-arithmetic case at a suffix stage GN.4:padic-unipotent-flows. GN.4's text schedules unipotent-flow proofs only for Oppenheim/Duke-type applications and its packet has no Ratner node, so /89 is missing rather than planned; a request asking GN.4 to plan these theorems in this generality is recorded for the maintainer (RT-PAPER-NELSON-VENKATESH-21/9). Route 1 imports them. Added by FIX-RT-PAPER-NELSON-VENKATESH-21 after the extraction's review, as the last route: PAPER-NELSON-VENKATESH-21.review.json has no verdict for it, so it is not applied until the next review of the extraction accepts it.

**Missing items taken (2).** Ratner's measure classification (cited) (/89); Borel's density theorem (cited) (/113).

### Route 8: Part II of tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight — Representations of semisimple Lie algebras, highest weight theory, and the Weyl formulas, Part II: Chevalley restriction and the Harish-Chandra isomorphism for reductive Lie algebras (LieHighestWeightPartIIReductiveHarishChandraIsomorphism, area representations)

Chevalley's restriction theorem and the reductive Harish-Chandra isomorphism extend LieHighestWeight in its own direction, so under PROTOCOL §15 they form a Part II of it, the most foundational owner, rather than part of the orbit-method roadmap (RT-PAPER-NELSON-VENKATESH-21/10). Added by FIX-RT-PAPER-NELSON-VENKATESH-21 after the extraction's review, as the last route: PAPER-NELSON-VENKATESH-21.review.json has no verdict for it, so it is not applied until the next review of the extraction accepts it.

**Brief for the design job.** The queue merges this route with the other LieHighestWeight Part II proposals (PAPER-BOXER-CALEGARI-GEE-PILLONI-25, routes 3 and 19) into DESIGN-LieHighestWeightPartII. LieHighestWeight layer 7 builds the Harish-Chandra isomorphism Z(U(L)) ≅ S(H)^{W·} only for a Killing-semisimple split L over an algebraically closed field of characteristic 0; layer 9 treats reductive Lie algebras and gl_n but not the centre of U(gl_n); no layer states Chevalley's restriction theorem. Plan, for a reductive Lie algebra g_C = z ⊕ [g_C, g_C] over an algebraically closed field of characteristic 0 with Cartan subalgebra t_C and Weyl group W: (1) Chevalley's restriction theorem: restriction C[g*_C]^G → C[t*_C]^W is an isomorphism and C[t*_C]^W is a polynomial ring, so [g*_C] := Spec Sym(g_C)^G ≅ t*_C/W is an affine space; (2) the Harish-Chandra isomorphism γ: Z(U(g_C)) ≅ S(t_C)^W ≅ C[[g*_C]] for reductive g_C, deduced from layer 7 on the derived algebra and from the centre; (3) for gl_n, [g*_C] as the space of characteristic polynomials (Nelson–Venkatesh, Example 9.1). Nelson–Venkatesh §§9.1–9.4 (pp. 72–74) use these for U(n), SO(n) and GL_n. Other extractions treat the reductive isomorphism as planned (PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/16, PAPER-PILLONI-20/harish-chandra-isomorphism-infinitesimal-character, and PAPER-BOXER-CALEGARI-GEE-PILLONI-25/2.3.9-HC, which uses it for split reductive G); this is its single owner, and they import it. QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups imports (1)–(3) and keeps the real form [ig*] and λ_π.

**Missing items taken (1).** Chevalley's restriction theorem and the Harish-Chandra isomorphism for reductive g_C (/102).

### Route 9: source — AutomorphicSpectralTheory (AutomorphicSpectralTheory:AS.0)

The Schwartz kernel theorem (proof of Theorem 26.5, p. 179) is general functional analysis that neither library has. AutomorphicSpectralTheory AS.0 plans nuclear Fréchet test-function spaces and is its most foundational owner (PROTOCOL §15; RT-PAPER-NELSON-VENKATESH-21/11(b)). Route 1 imports it. Added by FIX-RT-PAPER-NELSON-VENKATESH-21 after the extraction's review, as the last route: PAPER-NELSON-VENKATESH-21.review.json has no verdict for it, so it is not applied until the next review of the extraction accepts it.

**Missing items taken (1).** The Schwartz kernel theorem (cited) (/105).

## Prerequisite papers the atlas does not cover

- W. Rossmann, Kirillov's character formula for reductive Lie groups, Invent. Math. 48 (1978), 207–220 (https://doi.org/10.1007/bf01390244). [Ros1] (with [Ros4], Duke Math. J. 49 (1982), 231–247): the Kirillov formula for tempered representations (Theorem 6.1).
- M. Ratner, On Raghunathan's measure conjecture, Ann. of Math. 134 (1991), 545–607 (https://doi.org/10.2307/2944357). [Rat]: measure classification behind Theorem 27.7.
- A. Ichino and T. Ikeda, On the periods of automorphic forms on special orthogonal groups and the Gross–Prasad conjecture, Geom. Funct. Anal. 19 (2010), 1378–1425 (https://doi.org/10.1007/s00039-009-0040-4). [II]: Conjecture 25.1 (orthogonal case), the integrability (18.1) and the local integral formula of §1.2.
- R. N. Harris, The refined Gross–Prasad conjecture for unitary groups, Int. Math. Res. Not. 2014, 303–389 (https://doi.org/10.1093/imrn/rns219). [HarN]: Conjecture 25.1 (unitary case), (18.1).
- W. Zhang, Fourier transform and the global Gan–Gross–Prasad conjecture for unitary groups, Ann. of Math. 180 (2014), 971–1049 (https://doi.org/10.4007/annals.2014.180.3.4). [Z1]: Conjecture 25.1 proved in unitary cases under local conditions, making (31.4) unconditional there.
- Y. Sakellaridis and A. Venkatesh, Periods and harmonic analysis on spherical varieties, Astérisque 396 (2017) (arXiv:1203.0039). [SVe]: positivity (18.7) of H_σ in the non-archimedean case, used in §24.4.
- C. Mœglin and J.-L. Waldspurger, Sur les conjectures de Gross et Prasad. II, Astérisque 347 (2012); R. Beuzart-Plessis, Compos. Math. 151 (2015), 1309–1371 and Mém. Soc. Math. Fr. 149 (2016) (arXiv:1001.0826). [MW, BP1, BP2]: strong multiplicity one (Lemma 24.1).
- J.-L. Waldspurger, Une formule intégrale reliée à la conjecture locale de Gross–Prasad, 2e partie: extension aux représentations tempérées, Astérisque 346 (2012), 171–312 (arXiv:0904.0314). Proposition 5.7: H_σ ≠ 0 exactly on the distinguished tempered dual (§20, orthogonal case); cited in arXiv v3 but missing from the published bibliography (sourceIssues).
- J.-L. Waldspurger, La formule de Plancherel pour les groupes p-adiques (d'après Harish-Chandra), J. Inst. Math. Jussieu 2 (2003), 235–333 (https://doi.org/10.1017/s1474748003000082). [Wld]: p-adic Plancherel formula and the tempered classification (Lemma 23.4).
- R. Beuzart-Plessis, A local trace formula for the Gan–Gross–Prasad conjecture for unitary groups: the archimedean case, Astérisque 418 (2020) (arXiv:1506.01452). [BP3]: spherical property (Lemma 13.3), non-vanishing of H_σ (§20), archimedean multiplicity one.
- F. Sauvageot, Principe de densité pour les groupes réductifs, Compositio Math. 108 (1997), 151–184 (https://doi.org/10.1023/a:1000216412619). [Sau]: the density principle behind allowable functions (§24.2); the authors flag a step there they do not follow (footnote 7).
- M. Cowling, U. Haagerup and R. Howe, Almost L² matrix coefficients, J. Reine Angew. Math. 387 (1988), 97–110 (https://doi.org/10.1515/crll.1988.387.97). [CHH]: the bound (A.1) for tempered matrix coefficients.
- B. Kostant, Lie group representations on polynomial rings, Amer. J. Math. 85 (1963); On Whittaker vectors and representation theory, Invent. Math. 48 (1978); D. Barbasch and D. Vogan, The local structure of characters, J. Funct. Anal. 37 (1980) (https://doi.org/10.2307/2373130). [Kos2, Kos3, BV]: regular orbits in fibres (Lemma 16.2) and generic ⇔ maximal GK dimension (Lemma 11.6).
- D. Mumford, J. Fogarty and F. Kirwan, Geometric Invariant Theory, 3rd ed., Springer, 1994 (https://doi.org/10.1007/978-3-642-57916-5). [MFK]: Lemma 14.1 and the Hilbert–Mumford criterion.
- B. H. Gross and D. Prasad, On the decomposition of a representation of SO_n when restricted to SO_{n−1}, Canad. J. Math. 44 (1992), 974–1002 (https://doi.org/10.4153/cjm-1992-060-8). The branching problem itself, and the Gan–Gross–Prasad pairs of §13.
- B. H. Gross, On the motive of a reductive group, Invent. Math. 130 (1997), 287–313 (https://doi.org/10.1007/s002220050186). The L-function Δ_G appearing in the interpolation formula (1.1).
- A. A. Kirillov, Merits and demerits of the orbit method, Bull. Amer. Math. Soc. 36 (1999), 433–488 (https://doi.org/10.1090/S0273-0979-99-00849-6). The orbit method as a philosophy, and the Kirillov character formula that Theorem 4 makes quantitative.
- D. A. Vogan, Jr., The method of coadjoint orbits for real reductive groups, in Representation Theory of Lie Groups, IAS/Park City Math. Ser. 8 (2000), 179–238 (https://doi.org/10.1090/pcms/008/05). The orbit method for real reductive groups; the framework for the coadjoint multiorbits of §§6 and 11.
- W. Rossmann, Limit characters of reductive Lie groups, Invent. Math. 61 (1980), 53–66 (https://doi.org/10.1007/BF01389894). Limit characters, from which Theorem 8 on the topology of regular coadjoint multiorbits follows.
- W. Rossmann, Limit orbits in reductive Lie algebras, Duke Math. J. 49 (1982), 215–229 (https://doi.org/10.1215/S0012-7094-82-04914-6). Limit orbits and the characterization of when the limit set is nonempty, also used for Theorem 8.
- B. Sun and C.-B. Zhu, Multiplicity one theorems: the Archimedean case, Ann. of Math. 175 (2012), 23–44 (https://doi.org/10.4007/annals.2012.175.1.2). The multiplicity one property of the Gan–Gross–Prasad pairs that makes the branching coefficient well defined at the archimedean places.
- N. M. Katz and P. Sarnak, Zeroes of zeta functions and symmetry, Bull. Amer. Math. Soc. 36 (1999), 1–26 (https://doi.org/10.1090/S0273-0979-99-00766-1). The symmetry types of families of L-functions, against which §1.2 checks the main theorem: the family here is orthogonal with positive root numbers.
- K. Soundararajan, Weak subconvexity for central values of L-functions, Ann. of Math. 172 (2010), 1469–1498 (https://doi.org/10.4007/annals.2010.172.1469). The weak subconvexity to which the bound (1.4) is compared.

## Mistakes found (`sourceIssues`)

Locators are in the published text; every finding except the citation (E7) and E26 is also in arXiv v3. Where each was searched for an existing correction is recorded in the result.

- **E1** (error; affects a stated result), Proof of Lemma 27.3, p. 182 (also arXiv v3).
  - *Printed:* G=SOn: in this case, the spinor norm injects G(Fv)/G(Fv)+ into Fv× modulo squares, and our assertion follows from the surjectivity of the spinor norm on SOn−1 (for n−1⩾2).
  - *Correction:* For (G, H) = (SO3, SO2) and Π ≅ Π ⊗ χ, where χ := η_{K/F}∘θ, K = F(√−disc V_H) and θ is the spinor norm, Theorem 27.1 and (31.3) of Theorem 31.11 are false, and with them Theorem 30.1 and Corollaries 31.4 and 31.8: with the components σ′ at the places of R∖{q} fixed, the H-period of Π against Σ vanishes identically for every Σ whose archimedean weight at q has one sign (when K_q = C), so a one-sided admissible U gives average 0, not 1/τ(G) = 1/2; and (27.1) fails for suitable a. They fail whenever Π ≅ Π ⊗ χ, also when K splits at q: then the sign depends on σ′ alone, and a suitable singleton U′ gives average 0 or 1. The weak subconvex bound (1.4) still holds, losing at most a factor 2. With the added hypothesis 'if (G, H) = (SO3, SO2), then Π ≇ Π ⊗ χ' the statements hold: χ is then the only character of ε trivial on the image of H(A), and ∫_{[G]}[a]χ = 0 because multiplication by χ carries Π into the orthogonal Π ⊗ χ. Remark: the same sentence also asserts local surjectivity of the spinor norm on SO_{n−1} at every place. That is false at a real place where V_H is definite and V is not (θ(H_q) = 1 while θ(G_q) = {±1}; at q this happens for (SO(2,1), SO(2)) and (SO(3,1), SO(3)), both quasi-split), even when n − 1 ≥ 3. For dim V_H ≥ 3 the conclusion is recovered globally (Kneser: θ(G(F)) = F^× ∩ θ(G(A))), so there only the proof is affected.
  - *Why:* (a) Images. For SO2 = SO(V_H) with V_H an anisotropic plane, θ(SO2(F_v)) = N(K_v^×)F_v^{×2}, of index 2 in F_v^×/F_v^{×2} wherever K_v is a field. The spinor norms of G(F)H(A)G(A)⁺ lie in F^×N(A_K^×)(A^×)² = ker η_{K/F}, while θ(SO3(F_v)) = F_v^×/F_v^{×2}. So χ is a non-trivial automorphic character of G(A), trivial on G(F), H(A) and G(A)⁺, and non-trivial on ε = G(F)G∞⁺U\G(A) once θ(U) ⊆ ker η_{K/F}. Then the image of H(A) in ε is ker χ, of index 2, and (27.1) ⟺ ∫_{[G]}[a]χ = 0. (b) Example. F = Q, D an indefinite quaternion division algebra, G = PD^× = SO(D⁰, Nrd), K ⊂ D imaginary quadratic, H = K^×/Q^× = SO(K^⊥ ∩ D⁰), so χ = η_K∘Nrd. Π = JL(π(ψ)) for a Hecke character ψ of K with ψ|_{A^×} = η_K (trivial central character), D ramified only at primes where π(ψ) is supercuspidal (these are non-split in K, so K embeds in D), and Π_∞ = D_k with k even, tempered and generic as §25.7 requires. Then Π ⊗ χ ≅ Π. (c) Vanishing. χ is trivial on H(A), so ∫_{[H]}φΣ̄ = ∫_{[H]}(χφ)Σ̄. By multiplicity one, multiplication by χ is an involution M = ⊗M_v of Π. M_∞ commutes with PGL₂(R)⁺ and anticommutes with diag(1, −1), which swaps D_k^±, so M_∞ = c·sgn(n) on SO(2)-weight n; at finite v toric multiplicity one (Tunnell–Saito) gives ℓ_v∘M_v = ±ℓ_v, with a sign independent of Σ outside R (at split v, χ_v = 1; at inert v, Σ_v is trivial). Hence, with σ′ fixed, the global H-period vanishes for every Σ of one sign of weight at q, and L(Π, Σ) = 0 by (25.1). Taking the finite places of R non-split in K (single supercuspidal points, allowable by Theorem 24.5) and U a nice interval on the vanishing side of [h^∧] ∩ image(O_stab) = R∖{0}, F_h is non-empty (Lemma 31.9) and every term of (31.3) is 0. Directly, with T′ = u ⊗ ū for an M′-eigenvector u, ∫_{[G]}[a]χ = ±c(∫_{O⁺}a − ∫_{O⁻}a), non-zero for a supported near one sheet of the nilcone. This matches the root numbers: flipping the sign of the weight multiplies the archimedean root number of L(½, ψΩ)L(½, ψ^cΩ) by −1. (d) (1.4). [a] ⩾ 0 and ε/im H(A) injects into A^×/Q^×N(A_K^×) ≅ Z/2 (Kneser for dim V = 3), so the left side of (27.1) is at most twice the right, and the upper-bound half of the argument gives L(Π, Σ) = o(C^{1/4}). The counterexample is RT-PAPER-NELSON-VENKATESH-21/1, checked step by step in its verification (RT-PAPER-NELSON-VENKATESH-21.review.json). The extraction checked p. 182 on the page image; the fixer re-read pp. 180–182 and 202–204 of the published text and the proof of Lemma 27.3 in arXiv v3, which is identical.
- **E2** (gap; affects the proof), Proof of Lemma 7.8, p. 50 (also arXiv v3).
  - *Printed:* Let ∆ denote the multiple of the standard Laplacian for which e^φ=|∂φ|^{−2}∆(e^φ), and set D:=|∂φ|^{−2}∆. Integrating by parts repeatedly, we obtain I = t^{−N}∫ f D^r(e^{tφ}) = t^{−N}∫ D^r(f)e^φ
  - *Correction:* Use the first-order operator L = t^{−1}|∂φ|^{−2}Σ_j (conj ∂_jφ)∂_j, for which L(e^{tφ}) = e^{tφ} because φ is iR-valued, and integrate by parts N times with its transpose L^T; the coefficients of (L^T)^N are polynomials in derivatives of φ and |∂φ|^{−2}, bounded by the lower bound ε and the C^∞ bounds on φ.
  - *Why:* ∆(e^{tφ}) = (t²Σ_j(∂_jφ)² + t∆φ)e^{tφ}, so no multiple of the Laplacian reproduces e^{tφ} unless ∆φ = 0 and |∂φ| is handled separately; also the integration by parts produces the transpose of D, not D. The lemma itself is the standard non-stationary-phase estimate. Checked on the page image of p. 50.
- **E3** (error; affects nothing), Lemma 24.10, the example after it, p. 166, and Example 24.7, p. 165 (also arXiv v3).
  - *Printed:* For instance, in the above PGL2(F) example, the conclusion of the lemma holds with f := (α^{−n}+α^{−n+2}+...+α^n)/n for n∈Z⩾1 taken large enough in terms of ε. Example 24.7: Θ^unit ≅ C^(1) ∪ [q^{−1/2}, q^{1/2}]/∼; Θ^nt ≅ (q^{−1/2}, 1) ∪ (1, q^{1/2})/∼.
  - *Correction:* Drop the example, or replace it by a function bounded on Θ^unit ≅ C^(1) ∪ ([q^{−1/2}, q^{1/2}] ∪ [−q^{1/2}, −q^{−1/2}])/∼; the lemma is proved independently by Urysohn and Stone–Weierstrass. Example 24.7 itself omits the negative real interval: Θ^unit is as just stated, and Θ^nt ≅ ([q^{−1/2}, 1) ∪ (1, q^{1/2}] ∪ [−q^{1/2}, −1) ∪ (−1, −q^{−1/2}])/∼, which also includes the endpoints q^{±1/2}. For odd n the example function also fails f ⩾ 1 on the negative part of Θ^nt.
  - *Why:* The first requirement is |f| ≤ 2 on Θ^unit, which contains the real points α ∈ [q^{−1/2}, q^{1/2}] (complementary series, trivial and Steinberg). There f(α) ≥ α^n/n, and at α = q^{1/2} this is q^{n/2}/n → ∞, so f fails the first requirement for n large. It does satisfy the other two: f ≥ (n+1)/n on the real points, and ∫_{C^(1)} f² = (n+1)/n². The bound is needed in Step 5 of §24.4 because the Steinberg representation, in D′, has infinitesimal character α = q^{1/2}. Checked on the page image of p. 166. Amended after RT-PAPER-NELSON-VENKATESH-21/12(iii): for η the unramified quadratic character, η∘det (α = −q^{−1/2}), St ⊗ η∘det and the twisted complementary series π(η|·|^s, η|·|^{−s}), 0 < s < ½, are unitary with trivial central character and lie in the unramified principal-series component, so α = −q^{±s}, 0 ⩽ s ⩽ ½, lies in Θ^unit; and f(−α) = −f(α) for odd n. The closure of Θ^nt still meets Θ⁰ only in {±1}, a null set, so Lemmas 24.8 and 24.10 survive.
- **E4** (error; affects the proof), Proof of Lemma 7.6, display (7.4), p. 49 (also arXiv v3).
  - *Printed:* ∂_ζ^δ x^α y^β ζ^γ ≪ (|x| |y|)^{|δ|} ρ^j ≪ ρ^j.   (7.4)
  - *Correction:* ∂_ζ^δ x^α y^β ζ^γ ≪ (|x||y|)^{|δ|}ρ^{j−|δ|} ≪ ρ^j (using |x||y| ≤ ρ² and |x|, |y| ≪ 1).
  - *Why:* Differentiating in ζ lowers the ζ-degree: for α = β = γ = δ = (1) (j = 1), ∂_ζ(xyζ) = xy, and |xy| > |x||y|ρ whenever ρ < 1. The final bound ≪ ρ^j, which is all that is used, is true.
- **E5** (misprint; affects nothing), Theorem 19.4, (19.16), p. 128 (also arXiv v3).
  - *Printed:* H(Oph(a)) = Σ_{0⩽j<J} ∫_{h Oπ∩s⊥} D_j a + O(h^{(1−2δ)J}).
  - *Correction:* H(Op_h(a)) = Σ_{j<J} h^j ∫_{hO_π∩s⊥} D_j a + O(h^{(1−2δ)J}).
  - *Why:* Theorem 19.4 is Theorem 19.3 transported to M = G × H, whose expansion (19.8) has the factor h^j; so do (19.17) and (19.18). Checked on the page image of p. 128.
- **E6** (misprint; affects nothing), Proof of Lemma 19.5, (19.20)–(19.21), p. 130 (also arXiv v3).
  - *Printed:* b(h η) = h^{δ′ dim(s)} Θ^∨(h^{δ′} η) … ∫_{η∈s^∧} η^α b(η) = 1_{α=0}
  - *Correction:* ∫ η^α b(η) = h^{dim s}1_{α=0}; correspondingly the Kirillov expansion (12.4) enters with its factor h^{−d}.
  - *Why:* From the displayed formula b(ζ) = h^{δ′ dim s}Θ^∨(h^{δ′−1}ζ), so ∫ b = h^{δ′ dim s}·h^{(1−δ′)dim s}∫Θ^∨ = h^{dim s}. The proof also drops the h^{−d} of (12.4) when passing to (19.22). The two factors cancel because d = dim S = dim H (H has an open orbit with trivial stabilizer on the flag variety of G × H, Lemma 13.3), so (19.18) is right. Checked on the page image of p. 130.
- **E7** (misprint; affects nothing), §20, p. 142 (citation; also the bibliography).
  - *Printed:* (see [BP3, Theorem 5] in the unitary case and [Wll, Proposition 5.7] in the special orthogonal case)
  - *Correction:* [Wal2, Proposition 5.7] as in arXiv v3: J.-L. Waldspurger, Une formule intégrale reliée à la conjecture locale de Gross–Prasad, 2e partie, Astérisque 346 (2012), 171–312, which should be added to the bibliography.
  - *Why:* The published [Wll] is Wallach, Real Reductive Groups I (correctly cited for Lemma 2.A.2.4 at (19.31)), which does not treat Gan–Gross–Prasad periods; arXiv v3 cites Waldspurger's paper here, and it is absent from the published bibliography.
- **E8** (misprint; affects nothing), §6.1, before (6.1), p. 42 (also arXiv v3).
  - *Printed:* if t∈R×+ and f∈C_c^∞(g), then ∫_{x∈O} f(x)dω_O(x) = …
  - *Correction:* f ∈ C_c^∞(g^∧)
  - *Why:* O ⊆ g^∧, and f is integrated against measures on coadjoint orbits. Checked on the page image of p. 42.
- **E9** (misprint; affects nothing), §4.4, after Definition 4.3, p. 34 (also arXiv v3).
  - *Printed:* |∂^α a(ξ)| ⩽ h^η C_α h^{−δ|α|} ⟨ξ⟩^{m−α}
  - *Correction:* ⟨ξ⟩^{m−|α|}
  - *Why:* α is a multi-index; (4.8) has m − |α|.
- **E10** (misprint; affects nothing), Lemma 7.11, p. 51, and (7.10), p. 51 (also arXiv v3).
  - *Printed:* Lemma 7.11. Fix δ∈(0, 1]. … (7.10) ∫_{x∈g} |a_h^∨(x)| |x|^n ≪ A^{−n}
  - *Correction:* δ ∈ [0, 1); and (7.10) for a ∈ S^m_δ reads ≪ ⟨ω⟩^m A^{−n} (as printed it is the case m = 0).
  - *Why:* Lemma 7.12 and the proof of Theorem 7.4 apply the partition to S^m_δ with δ ∈ [0, 1), including the main case δ = 0; the construction works verbatim there. (7.9) carries the factor ⟨ω⟩^m, and (7.10) is only used with m = 0 (Proposition 7.13).
- **E11** (misprint; affects nothing), §8.7, p. 63 (also arXiv v3).
  - *Printed:* the corresponding operator Op(p) acts both on π^∞ and on π^{−∞}. This observation is a consequence of §5.5.
  - *Correction:* a consequence of §5.2 (Lemma 5.1: Op(p) = π(sym p))
  - *Why:* §5.5 is near-equivariance; the fact used is Lemma 5.1.
- **E12** (misprint; affects nothing), §8.8.2, p. 65 (also arXiv v3).
  - *Printed:* ‖v‖²_{π^s} = ∫_ξ |v^∧(ξ)|² ⟨ξ⟩^m dξ
  - *Correction:* ⟨ξ⟩^{2s}
  - *Why:* For π = L²(R^n), ∆ acts as multiplication by ⟨ξ⟩² and ‖v‖²_{π^s} = ⟨∆^s v, v⟩; with this weight the next line ‖Op(b)‖_{π^s→π^{s−m}} = sup |b|/⟨ξ⟩^m follows.
- **E13** (misprint; affects nothing), Proof of Lemma 10.4, (10.12) and (10.14), p. 82 (also arXiv v3).
  - *Printed:* Op_h(p′) acts by the scalar p_h(λσ) = p(hλσ). … H(Op_h(p′)T) = p(hλσ)H(T)
  - *Correction:* p(hλ_π) for p = p_G (acting on π) and p(hλ_σ) for p = p_H (acting through σ)
  - *Why:* p ∈ Sym(ig)^G acts on π through λ_π (10.10); only the H-invariants act through σ. The estimates that follow use both.
- **E14** (misprint; affects nothing), Appendix A, p. 136 (also arXiv v3).
  - *Printed:* π(f) := ∫_{g∈G} π(f)f(g) dg
  - *Correction:* π(g)f(g) dg
  - *Why:* The definition of π(f) for f ∈ L¹(G).
- **E15** (misprint; affects nothing), p. 109 (§16.4), p. 125 ((19.10)), p. 152 (§§23.1–23.2), pp. 153–154 (proof of Lemma 23.2), p. 154 (Lemma 23.3), p. 155 (Lemma 23.4), p. 202 (proof of Lemma 31.10) (also arXiv v3).
  - *Printed:* generators … for the ring of G-invariant regular functions on h*; Hσ(Oph(a1)…Oph(aj)) = ∫ a1…ak; a maximal compact subgroup K of G for which KP0 = H; σ is a supercuspidal representation of M … subquotient of i^G_M τ; 4dim(B_H) = εn_G n_H; i^G_M = Ind^G_P from smooth representations of M to smooth representations of G … irreducible subquotients of i^G_M τ (§23.1); an element of g … π ↪ i^G_M(wτ) … π → i^G_P τ (proof of Lemma 23.2); π is a subquotient (equivalently, submodule) of i^G_M σ (Lemma 23.4)
  - *Correction:* H-invariant; a_k; K of H; τ and i^H_M; ε m_G m_H (Table 1); in §23 the group is H throughout: i^H_M = Ind^H_P, representations of H, h, i^H_M(wτ), i^H_P τ, i^H_M σ
  - *Why:* Notational slips; the intended meaning is clear from context.
- **E16** (error; affects nothing), Lemma 8.10 (Cotlar–Stein), pp. 61–62 (also arXiv v3).
  - *Printed:* Then, the series T := Σ_j T_j converges in the Banach space of bounded linear operators from V1 to V2, and has operator norm ‖T‖⩽C.
  - *Correction:* The series converges strongly (in the strong operator topology) to T, with ‖T‖ ⩽ C, as in [Hör, Lemma 18.6.5].
  - *Why:* Take T_j the orthogonal projection onto Ce_j for an orthonormal sequence (e_j). Then T_j*T_k = T_jT_k* = δ_{jk}T_j, so both sums in (8.19) equal 1, but ‖Σ_{j⩽n}T_j − Σ_{j⩽m}T_j‖ = 1 for n ≠ m, so the partial sums are not norm-Cauchy. The only use (proof of Proposition 8.7(ii), p. 62) needs just strong convergence and the norm bound. RT-PAPER-NELSON-VENKATESH-21/3(a).
- **E17** (error; affects nothing), Lemma 8.1(ii), (8.3), p. 57 (also arXiv v3).
  - *Printed:* More generally, for a∈S^m_δ, ∂^α a_h^∨(x) ≪ h^{−dim(g)} |x/h^{1−δ}|^{−N}. (8.3)
  - *Correction:* ∂^α a_h^∨(x) ≪ h^{−dim(g)−|α|} |x/h^{1−δ}|^{−N}
  - *Why:* With n = dim g, a_h^∨(x) = h^{−n}a^∨(x/h), so ∂^α a_h^∨(x) = h^{−n−|α|}(∂^α a^∨)(x/h). For a fixed Schwartz a (in every S^m, δ = 0) and x = hu with ∂^α a^∨(u) ≠ 0, the left side is ≍ h^{−n−|α|} and the right side ≍ h^{−n}, so (8.3) fails for |α| ⩾ 1. Integration by parts with (∂^α a)^∨ = x^α a^∨ (4.1) gives the corrected bound. The only use (proof of Lemma 5.4, p. 57) is at |x| > ε, where the extra h^{−|α|} is absorbed by taking N larger. RT-PAPER-NELSON-VENKATESH-21/3(b).
- **E18** (misprint; affects nothing), §2.5, p. 28, and proof of Proposition 8.7, p. 62 (also arXiv v3).
  - *Printed:* Op_h(a, χ)Op_h(b, χ) = Op(a⋆_h b, χ′) … Op(a_ω1)*Op(a_ω2) = Op(ā_ω1 ⋆_h a_ω2, χ′)
  - *Correction:* Op_h(a⋆_h b, χ′); likewise on p. 62, Op_h on both sides (or ⋆ in place of ⋆_h).
  - *Why:* By (2.2), Op_h(a, χ) := Op(a_h, χ), and by Lemma 2.1, Op_h(a)Op_h(b) = Op(a_h ⋆ b_h, χ′) = Op((a⋆_h b)_h, χ′) = Op_h(a⋆_h b, χ′). Theorem 5.8 (p. 40) has the correct form. RT-PAPER-NELSON-VENKATESH-21/3(c).
- **E19** (misprint; affects nothing), Lemma 7.14, p. 56 (also arXiv v3).
  - *Printed:* b ≡ Σ_{0⩽j<J} (−h)^j Σ_{|α|=j} (∂^αψ(0)/α!) ∂^α a mod h^{(1−δ)J} S^{m−J}_δ
  - *Correction:* b ≡ Σ_{j<J} h^j Σ_{|α|=j} (∂^αψ(0)/α!) ∂^α a (or keep (−h)^j and replace ∂^αψ(0) by ∂^α[ψ(−·)](0))
  - *Why:* With a^∨(x) = ∫a(ξ)e^{−xξ}dξ (§2.1) and (∂^α a)^∨ = x^α a^∨ (4.1), Taylor expansion of ψ gives b_h^∨ = ψa_h^∨ ∼ Σ(∂^αψ(0)/α!)x^α a_h^∨ = Σ(∂^αψ(0)/α!)(∂^α(a_h))^∨, and ∂^α(a_h) = h^{|α|}(∂^α a)_h. The uses (§12.1, and §19.5 around (19.24)) keep only the leading term or the shape of the terms. RT-PAPER-NELSON-VENKATESH-21/3(d).
- **E20** (misprint; affects nothing), End of §19 (§19.8), p. 136 (also arXiv v3).
  - *Printed:* H(Op_h(a)) = ∫_{s∈S: ‖s−1‖⩾h^{1/2−η}} tr(π(s)Op_h(a)) + O(h^∞).
  - *Correction:* ‖s − 1‖ ⩽ h^{1/2−η}
  - *Why:* Lemma 19.8 (p. 133) makes the integral over ‖s − 1‖ ⩾ h^{1/2−η} O(h^∞), and the next sentence ('We now write s = exp(y), pull the integral back to the Lie algebra') needs the complementary small region. RT-PAPER-NELSON-VENKATESH-21/12(i).
- **E21** (gap; affects a stated result), Proof of Theorem 22.2(iii), (22.10), pp. 146–147 (also arXiv v3).
  - *Printed:* choose a2 as indicated so that ∫_{O(µ)} a2² ⩾ 2ε1 for µ∈U0 and ∫_O a2² dω ⩽ ε. Choose a as indicated so that |k(µ) − ∫_{O(µ)} a²| ⩽ ε1 for µ∈U.
  - *Correction:* Theorem 22.2(iii) should read |k_h(σ) − H_σ(Op_h(a)²)| ⩽ |H_σ(Op_h(a2)²)| + O(h^N) in (22.10), and the proof should also choose a with the image of its support in [h^∧] compact in U0 (or a2 large on that image). The O(h^N) is absorbed in Lemma 30.6 by the weak Weyl law (29.2), so Theorem 30.1 and the main theorems are unaffected.
  - *Why:* For hλ_σ ∈ U∖U0, H_σ(Op_h(a)²) ≈ ∫_{O(µ)} a² may be as large as ε1 while ∫_{O(µ)} a2² may vanish, so (22.10) is not proved there. Where both sides are O(h^∞) an exact inequality cannot be expected, so an additive O(h^N) is needed even with the support condition. RT-PAPER-NELSON-VENKATESH-21/12(ii), with the refinement of its verification.
- **E22** (misprint; affects nothing), Proof of Lemma 27.10, p. 185 (also arXiv v3).
  - *Printed:* we must have J =I, i.e., h=g. This implies s⩽g as desired.
  - *Correction:* s ⩾ g (s contains g)
  - *Why:* The proof opens 'We must show that s contains g', and h := s ∩ g = g gives g ⊆ s. RT-PAPER-NELSON-VENKATESH-21/12(iv).
- **E23** (misprint; affects nothing), §1.1, p. 4 (also arXiv v3).
  - *Printed:* the size of the family F_h is roughly the fourth power of the analytic conductor of the relevant L-function.
  - *Correction:* the analytic conductor is roughly the fourth power of the size of the family: C(Π, Σ) ≍ |F_h|⁴
  - *Why:* Lemma 31.10 (p. 202) gives C(Π, Σ) ≍ |F_h|⁴, which is what makes one term of the average o(C^{1/4}) in (1.4). RT-PAPER-NELSON-VENKATESH-21/12(v).
- **E24** (error; affects nothing), Appendix A, §A.1, p. 136 (also arXiv v3).
  - *Printed:* (Explicitly, one may take κ = −c Σ_{x∈B(Lie(K))} x² for large enough c>0.)
  - *Correction:* κ = (1 − Σ_{x∈B(Lie(K))} x²)^N for N large in terms of K, or no explicit choice ([Kn, Lemma 10.4] supplies κ).
  - *Why:* −cΣx² acts by 0 on the trivial K-type, contradicting (ii) dim(τ) ⩽ κ_τ^{1/2} and Lemma A.1(ii) (π(κ) invertible). Even 1 − cΣx² fails (ii) and (iii) once K has rank ⩾ 2: for SO(4), dim τ grows like |λ|² while the Casimir eigenvalue grows like |λ|², and Σ_τ κ_τ^{−1} diverges. A power (1 − Σx²)^N with N large satisfies (i)–(iii). RT-PAPER-NELSON-VENKATESH-21/12(vi).
- **E25** (misprint; affects nothing), §16.5, p. 110 (also arXiv v3).
  - *Printed:* for each stable element (λ, µ)∈[g*]×[h*], the corresponding fiber O^{λ,µ} of the map g*×h* → [g*]×[h*]
  - *Correction:* of the map g* → [g*]×[h*], ξ ↦ ([ξ], [ξ|_h])
  - *Why:* The fibre of g*×h* → [g*]×[h*] over (λ, µ) is O^λ × O^µ, of dimension 2 dim H, and is not an H-torsor; Theorem 14.5 and the bottom row of (16.4) concern ξ ↦ ([ξ], [ξ|_h]) on g*. RT-PAPER-NELSON-VENKATESH-21/12(vii).
- **E26** (misprint; affects nothing), Proof of Lemma 13.2, p. 95 (published text only; arXiv v3 has y).
  - *Printed:* x, x³, ..., x^{dim(U)−2}, if dim(U′) = 1,
  - *Correction:* x, x³, ..., x^{dim(U)−2}, y, if dim(U′) = 1
  - *Why:* The next sentence defines y ('where y is a skew-symmetric transformation sending a generator of U′ to a non-zero highest weight vector in U'), and the dimension count needs it. The published text of p. 95 prints both lines of the list without y (the verification checked the page image); the arXiv v3 text has ', y'. RT-PAPER-NELSON-VENKATESH-21/12(viii).
- **E27** (misprint; affects nothing), Proof of Lemma 19.8, p. 134 (also arXiv v3).
  - *Printed:* ψ≡1 on B(ω, 2h^δ), and ψ≡0 on B(ω, 3h^δ).
  - *Correction:* ψ ≡ 0 outside B(ω, 3h^δ)
  - *Why:* As printed the two conditions contradict each other on B(ω, 2h^δ); the rest of the proof uses ψ supported in B(ω, 3h^δ). RT-PAPER-NELSON-VENKATESH-21/12(ix).
- **E28** (misprint; affects nothing), Proof of Lemma 10.1, p. 79 (also arXiv v3).
  - *Printed:* b0 := a/q, b1 := −q⋆1b0/q, b2 := (−q⋆2b0 + q⋆1b1)/q
  - *Correction:* b2 := −(q⋆2b0 + q⋆1b1)/q
  - *Why:* The h² coefficient of q⋆_h Σ_j h^j b_j is qb2 + q⋆1b1 + q⋆2b0, which must vanish; the printed sign of q⋆1b1 is wrong (b1 is right). RT-PAPER-NELSON-VENKATESH-21/12(x).
- **E29** (misprint; affects nothing), §8.8.6, p. 69 (also arXiv v3).
  - *Printed:* q0 := b/z^{s+2k}, q1 := −b⋆1q0/z^{s+2k} and q2 := (−b⋆2q0 + b⋆1q1)/z^{s+2k}
  - *Correction:* With Z = z^{s+2k}: q0 = b/Z and q_j = −(Σ_{l<j} q_l ⋆_{j−l} Z)/Z, so q1 = −(q0⋆1Z)/Z and q2 = −(q0⋆2Z + q1⋆1Z)/Z.
  - *Why:* b ≡ q⋆_h Z with q = Σ h^j q_j requires, at order h^j, q_jZ + Σ_{l<j} q_l⋆_{j−l}Z = 0. Since ⋆1 is a multiple of the Poisson bracket, b⋆1q0 = (q0Z)⋆1q0 = −q0(q0⋆1Z), so the printed q1 is −q0 times the correct one; q2 is wrong likewise. The induction q_j ∈ h^{−δj}S^{−(s+2k)j}_δ is unaffected. RT-PAPER-NELSON-VENKATESH-21/12(xi), with the whole recursion as its verification asks.
- **E30** (misprint; affects nothing), §6.1, p. 43 (also arXiv v3).
  - *Printed:* We henceforth denote by d the maximal dimension of any coadjoint orbit, so that for each π as above, every orbit in O_π is 2d-dimensional.
  - *Correction:* d is half the maximal dimension of a coadjoint orbit (as §26.4 has it)
  - *Why:* As printed the sentence is inconsistent (an orbit of maximal dimension d cannot be 2d-dimensional); the normalisations h^d, as in (12.3), use dim O = 2d. RT-PAPER-NELSON-VENKATESH-21/12(xii).
- **E31** (misprint; affects nothing), (12.3), p. 88, and §26.4, p. 176 (also arXiv v3).
  - *Printed:* if a is h-independent and π admits the limit orbit (O, π), then … (12.3); … a regular limit coadjoint orbit (O, π)
  - *Correction:* (O, ω)
  - *Why:* A limit orbit is a pair (O, ω) of a multiorbit and its measure (§11); π is the representation. RT-PAPER-NELSON-VENKATESH-21/12(xiii), with p. 176 added by its verification.
- **E32** (misprint; affects nothing), §29, proof of Theorem 29.1, p. 191 (also arXiv v3).
  - *Printed:* |tr(T1T2)|² ⩽ tr(T1*T2)tr(T2*T2)
  - *Correction:* |tr(T1T2)|² ⩽ tr(T1*T1)tr(T2*T2)
  - *Why:* Cauchy–Schwarz for the Hilbert–Schmidt inner product; the next sentence uses tr(T1*T1) ≪ h^∞. RT-PAPER-NELSON-VENKATESH-21/12(xiv).
- **E33** (misprint; affects nothing), §1.1, p. 3, and §31, p. 204 (the citation [Z1]); also arXiv v3, where the same paper is [Z2].
  - *Printed:* The formula (1.1) has been proved in the unitary case, under local assumptions which allow one to use a simple form of the trace formula, by W. Zhang [Z1]
  - *Correction:* [Z1] (W. Zhang, Ann. of Math. 180 (2014), 971–1049) proves the global Gan–Gross–Prasad conjecture (L(½) ≠ 0 ⟺ distinction) under local conditions: every archimedean place split in E/F, and two split supercuspidal places. The refined formula (1.1) is Zhang's subsequent paper, Automorphic period and the central value of Rankin–Selberg L-function, J. Amer. Math. Soc. 27 (2014), 541–612, which is not cited. Within §25.7 these conditions leave essentially (U2, U1).
  - *Why:* [Z1]'s introduction says that a subsequent paper is devoted to the refined conjecture for unitary groups (checked by the verification on the author's copy). Split archimedean places make G_p = GL_{n+1}, so §25.7(3) allows a single archimedean place, and a hermitian space of dimension ⩾ 3 split at every archimedean place is isotropic (Hasse–Minkowski for its trace form), so anisotropy forces dim V = 2. RT-PAPER-NELSON-VENKATESH-21/12(xv).

## Gaps

- **G-inputs** (deferred). Cited theorems (Rossmann, Harish-Chandra, Waldspurger, Ratner, Mœglin–Waldspurger, Beuzart-Plessis, Sakellaridis–Venkatesh, Mumford, Kostant, Cowling–Haagerup–Howe) were read only as the paper states them. Named in the briefs as imports or theorem boundaries; prerequisites list the sources.
- **G-SO3** (resolved). Whether Theorem 31.11 actually fails for (SO3, SO2) with Π dihedral for K was not decided; only that its proof does not cover that case. Resolved by RT-PAPER-NELSON-VENKATESH-21/1: the theorems fail in the dihedral case. For (SO3, SO2) and Π ≅ Π ⊗ (η_{K/F}∘θ), Theorem 27.1, Theorem 30.1, Corollaries 31.4 and 31.8 and Theorem 31.11 are false (sourceIssues PAPER-NELSON-VENKATESH-21/E1). Items /85, /86, /94, /95 and /98 carry the hypothesis Π ≇ Π ⊗ (η_{K/F}∘θ) in that case; (1.4) (/99) holds in all cases.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NELSON-VENKATESH-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-NELSON-VENKATESH-21.result.json research/blueprint/papers/PAPER-NELSON-VENKATESH-21.md`: ok.
- **Library checks.** Mathlib 082e2d3 and Tau Ceti f790474 were searched (git grep) for coadjoint orbits, Kirillov, unitary representations, Plancherel, Harish-Chandra, Ratner, spinor norms, Hilbert–Mumford, Baker–Campbell–Hausdorff, Tamagawa, strong approximation, Gelfand pairs and Cotlar–Stein, and for the general tools the proofs use. Only the general tools are present: Mathlib's SchwartzMap with its Fourier transform, Stone–Weierstrass, Urysohn, Tietze, Arzelà–Ascoli and Radon–Nikodym, all read at 082e2d3. Tau Ceti has spinor norms for Clifford groups and Tate cohomology but nothing on unitary representations. The library audit rows for AF.1, SR.3, AA.2, AA.4 and AS.0 were read for the planned items.
- **Checked by cc-442dc5.**
  - The spinor-norm computation behind E1: local and global (class field theory) images for SO2.
  - The orthogonality argument that rescues Theorem 27.1 when Π is not dihedral for K.
  - The Laplacian identity in E2, the example in E3 (f(q^{1/2}) ≥ q^{n/2}/n, ∫_{C^(1)} f² = (n+1)/n²), and the counterexample to (7.4) in E4.
  - The normalisation in E6 via d = dim H (Lemma 13.3), the arXiv v3 citation in E7, and the measure normalisations of §17.
  - Table 1's numerology, the Cramer identity (14.8), and the signatures in Example 25.3.

## Fixes after the red team

FIX-RT-PAPER-NELSON-VENKATESH-21 (Claude Code, session cc-f805bf, 30 September 2026) applied the confirmed high and medium findings of RT-PAPER-NELSON-VENKATESH-21 (/1–/12), as its verification amended them. The report is `research/blueprint/redteam/RT-PAPER-NELSON-VENKATESH-21.fixes.md`.

- **E1 is an error, not a gap (/1).** For (SO3, SO2) with Π dihedral for K, Theorems 27.1, 30.1 and 31.11 and Corollaries 31.4 and 31.8 are false. Items /85, /86, /94, /95 and /98 carry the hypothesis Π ≇ Π ⊗ (η_{K/F}∘θ) in that case. /99 records that (1.4) holds in all cases. G-SO3 is resolved.
- **Dropped hypotheses restored (/2, /4).**
  - /48: k algebraically closed.
  - /56: O_{π,σ} non-empty.
  - /75: φ₊ positive definite.
  - /68: the normalisation (22.8) and the uniformity of the constants.
  - /40: τ-isotypic v.
  - /49–/51: over R, and tempered for the Γ_R product.
  - /61–/62: an archimedean GGP pair.
  - /99: Σ traverses a sequence.
- **Slips copied from the paper corrected (/3), with new source issues E16–E19.**
  - /26: strong convergence.
  - /23: h^{−|α|}.
  - /3: Op_h.
  - /22: h^j.
- **New source issues E20–E33 (/12).** E3 and E15 are amended, and /81's note is corrected (E33). E21 affects a stated result: /68 now carries the + O(h^N).
- **Owners (/5–/10).** Seven routes were appended, and none of them has a review verdict yet:
  - route 3: /30 to AF.1;
  - route 4: the real half of /64 to the AutomorphicSpectralTheory Part II;
  - route 5: /72 to SR.3;
  - route 6: /46 to the Reductive algebraic groups Part II;
  - route 7: /89 and the new /113 (Borel density) to GN.4;
  - route 8: the new /102 (Chevalley restriction and the reductive Harish-Chandra isomorphism) to a LieHighestWeight Part II;
  - route 9: the new /105 (Schwartz kernel theorem) to AS.0.
- **Items split.**
  - /100 (Waldspurger's p-adic Plancherel formula) was split from /64 and stays in route 1.
  - /101 (the local period and (18.1)) was split from /59 into route 2.
  - /103 (the real form [ig*] and λ_π) was split from /28 into route 1.
- **New cited inputs (/11).** Each is listed with its status:
  - /104, local multiplicity one: route 2;
  - /106, Riesz–Markov–Kakutani: library;
  - /107, spinor norms: route 1, citing Tau Ceti's spinor norm;
  - /108, compactness: planned at AA.3;
  - /109, Nelson's theorems on ∆: route 1;
  - /110, Ranga Rao: route 1;
  - /111, uniform admissibility: planned at SR.3a;
  - /112, Cartan: route 1.
- **Not applied.** The low findings /13 (the list of GGP proposers, and "six extractions") and /14 (`sourceVersions` and review blocks) are recorded in the fixes report only.

## Item index

| Item | Kind | Name | Locator | Status | Layers or declarations |
|---|---|---|---|---|---|
| /1 | theorem | Schwartz spaces and Fourier inversion on the Lie algebra | §2, §2.1, p. 25 | library | mathlib:SchwartzMap, mathlib:SchwartzMap.fourierTransformCLM, mathlib:SchwartzMap.instFourierTransform, mathlib:Continuous.fourierInv_fourier_eq |
| /2 | definition | The operator assignment Op and its rescaling Op_h | §2, §2.2, p. 25 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /3 | construction | The star product and the composition formula | §2, Lemma 2.1, p. 27 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /4 | definition | Sobolev spaces and operator classes Ψ^m | §3, Definition 3.1, p. 29 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /5 | theorem | Composition and basic members of the operator classes | §3, Lemma 3.3, p. 30 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /6 | definition | Symbol classes S^m and S^m_δ | §4, Definition 4.1, p. 33 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /7 | theorem | Asymptotics of the star product | §4, Theorem 4.5, p. 35 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /8 | theorem | Polynomial symbols | §5, Lemma 5.1, p. 37 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /9 | definition | h-dependent operator classes Ψ^m_δ | §5, Definition 5.2, p. 37 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /10 | theorem | Independence of the cut-off | §5, Lemma 5.4, p. 39 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /11 | theorem | Near-equivariance | §5, Lemma 5.5, p. 39 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /12 | theorem | Op maps symbols to operators, compatibly with composition | §5, Theorem 5.6, p. 40 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /13 | theorem | The rescaled calculus | §5, Theorem 5.8, p. 40 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /14 | definition | Coadjoint orbits, normalized symplectic measure and multiorbits | §6, §6.1, p. 41 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /15 | theorem | The Kirillov character formula (Rossmann; cited) | §6, Theorem 6.1, p. 43 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /16 | theorem | Trace estimates for the calculus | §6, Theorem 6.3, p. 44 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /17 | theorem | Star products for pairs of subalgebras | §7, Theorem 7.4, p. 48 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /18 | theorem | Taylor bound for the BCH phase | §7, Lemma 7.6, p. 48 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /19 | theorem | Non-stationary phase | §7, Lemma 7.8, p. 50 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /20 | construction | Localized symbols and dyadic–Planck partitions | §7, Lemma 7.10, p. 51 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /21 | theorem | Remainder estimates for localized star products | §7, Proposition 7.13, p. 53 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /22 | theorem | Asymptotics for convolution with a bump | §7, Lemma 7.14, p. 56 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /23 | theorem | Fourier transforms of symbols away from the origin | §8, Lemma 8.1, p. 57 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /24 | theorem | Membership criterion for Ψ^m | §8, Proposition 8.2, p. 59 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /25 | theorem | L²-boundedness of order-zero operators | §8, Proposition 8.7, p. 61 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /26 | theorem | The Cotlar–Stein lemma (cited) | §8, Lemma 8.10, p. 61 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /27 | theorem | Composition across proper subgroups | §8, Theorem 8.11, p. 71 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /28 | theorem | The Harish-Chandra isomorphism for semisimple g_C | §9, §9.1 and §9.4, pp. 72–74 | planned | tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#… |
| /29 | theorem | Infinitesimal characters of duals and conjugates | §9, Lemma 9.2, p. 75 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /30 | theorem | The Langlands classification (cited) | §9, §9.6, p. 75 | missing | routed: source AutomorphicFormsOnReductiveGroups (AF.1) |
| /31 | theorem | Infinitesimal criterion for temperedness | §9, Lemma 9.4, p. 76 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /32 | theorem | Eigenvalues of ∆ and infinitesimal characters | §9, Lemma 9.5, p. 77 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /33 | theorem | Approximate division | §10, Lemma 10.1, p. 79 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /34 | theorem | Localizing near the locus of a symbol | §10, Lemma 10.3, p. 80 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /35 | theorem | Localizing near infinitesimal characters | §10, Lemma 10.4, p. 81 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /36 | theorem | Topology on regular coadjoint multiorbits (after Rossmann) | §11, Theorem 11.1, p. 83 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /37 | theorem | Uniform bounds for symplectic measures | §11, Lemma 11.4, p. 85 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /38 | theorem | Limit orbits of fixed representations | §11, Lemma 11.6, p. 86 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /39 | theorem | Refined trace estimates | §12, Theorem 12.2, p. 88 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /40 | theorem | Uniform bounds for K-types and matrix coefficients | Appendix A, Lemma A.1, p. 137 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /41 | theorem | Uniform trace-class property of ∆^{−N} | Appendix A, Lemma A.3, p. 138 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /42 | definition | Gan–Gross–Prasad pairs | §13, §13.2, p. 92 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /43 | definition | Eigenvalue invariants ev(x) | §13, §13.4.1, p. 93 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /44 | theorem | Eigenvalues and isotropic eigenvectors; a regularity criterion | §13, Lemma 13.1, p. 93 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /45 | theorem | GGP pairs are spherical (cited) | §13, Lemma 13.3, p. 95 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /46 | theorem | GIT stability background (cited) | §14, Lemma 14.1, p. 96 | missing | routed: part-ii ReductiveCoadjointInvariantTheoryPartII |
| /47 | theorem | Stability for GGP pairs | §14, Theorem 14.2, p. 97 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /48 | theorem | Stable fibres are H-torsors | §14, Theorem 14.5, p. 99 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /49 | theorem | Infinitesimal characters and Langlands parameters | §15, Lemma 15.2, p. 104 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /50 | theorem | Satake parameters of the Rankin–Selberg L-function | §15, Lemma 15.3, p. 105 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /51 | theorem | Stability is absence of conductor dropping | §15, Lemma 15.4, p. 107 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /52 | definition | Fibral, Haar, symplectic and affine volume forms | §16, §16.1–§16.4, p. 108 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /53 | theorem | The normalized affine form | §16, Lemma 16.4, p. 110 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /54 | theorem | Compatibility of orbital volume forms | §16, Theorem 16.7, p. 111 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /55 | definition | Measure normalizations over R | §17, §17.1–§17.2, p. 115 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /56 | theorem | Stable fibres over R and the disintegration formulas | §17, Theorem 17.2, p. 118 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /57 | theorem | A Łojasiewicz-type inequality | §17, Lemma 17.3, p. 118 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /58 | theorem | Plancherel measure and affine measure | §17, Lemma 17.4, p. 120 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /59 | theorem | Relative characters | §18, Lemma 18.1, p. 121 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /60 | theorem | Positivity of relative characters (cited; archimedean case expected) | §18, Remark 18.2, p. 122 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /61 | theorem | A-priori bounds for relative characters | §19, Lemma 19.1, p. 123 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /62 | theorem | Asymptotics of relative characters in the stable case | §19, Theorem 19.3, p. 125 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /63 | theorem | Small, medium and huge elements of S | §19, Lemma 19.5, p. 129 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /64 | theorem | The Plancherel formula for real reductive groups (Harish-Chandra; cited) | Appendix A, §A.3, p. 138 | missing | routed: part-ii AutomorphicSpectralTheoryPartIISchwartzMultipliers |
| /65 | theorem | Plancherel formula for Ξ-integrable functions | Appendix A, Lemma A.4, p. 140 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /66 | definition | Distinguished duals and the functionals ℓ_σ | §20–§22, §20, p. 142 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /67 | definition | Orbit-distinction | §20–§22, §22.2, p. 145 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /68 | theorem | Archimedean inverse branching | §20–§22, Theorem 22.2, p. 146 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /69 | theorem | Test functions for the Weyl law | §20–§22, Lemma 22.4, p. 148 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /70 | theorem | Good compact open subgroups and invariant vectors | §23, Lemma 23.2, p. 153 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /71 | theorem | Supercuspidal support and the Bernstein center | §23, Lemma 23.3, p. 154 | planned | SmoothRepresentationsOfLocalGroups:SR.3, SmoothRepresentationsOfLocalGroups:SR.1 |
| /72 | theorem | Tempered representations from square-integrable ones (cited) | §23, Lemma 23.4, p. 155 | missing | routed: source SmoothRepresentationsOfLocalGroups (SR.3) |
| /73 | definition | l-components | §23, §23.7, p. 156 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /74 | theorem | Strong multiplicity one (cited) and the structure of Ω | §24, Lemma 24.1, p. 157 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /75 | definition | Allowable components and functions | §24, Definition 24.3, p. 159 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /76 | theorem | Cuspidal-type components are allowable | §24, Theorem 24.5, p. 160 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /77 | theorem | Uniform distinction and the Stone–Weierstrass inputs | §24, Lemma 24.6, p. 164 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /78 | theorem | Stone–Weierstrass, Urysohn and Tietze (used) | §24, Lemma 24.9 (proof), p. 166 | library | mathlib:ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints, mathlib:exists_continuous_zero_one_of_isClosed, mathlib:ContinuousMap.exists_extension |
| /79 | definition | Global setting, Tamagawa measures and assumptions | §25, §25.7, p. 171 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /80 | definition | The branching coefficient L(Π, Σ) | §25, §25.4, p. 168 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /81 | theorem | The Ichino–Ikeda and N. Harris conjectures (conjectural; cited) | §25, Conjecture 25.1, p. 169 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /82 | construction | Limit states | §26, Theorem 26.4, p. 177 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /83 | theorem | Disintegration of limit states | §26, Theorem 26.5, p. 178 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /84 | theorem | Arzelà–Ascoli and Radon–Nikodym (used) | §26, Theorem 26.4 (proof), p. 177 | library | mathlib:BoundedContinuousFunction.arzela_ascoli₁, mathlib:MeasureTheory.Measure.rnDeriv |
| /85 | theorem | Equidistribution of limit states on [H] | §27, Theorem 27.1, p. 181 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /86 | theorem | Reduction to G∞⁺-invariance | §27, Lemma 27.3, p. 181 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /87 | theorem | Strong approximation (cited) | §27, Lemma 27.4 (proof), p. 181 | planned | AdelicAlgebraicGroups:AA.4 |
| /88 | theorem | Regular nilpotents (Kostant; cited) | §27, Lemma 27.5, p. 183 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /89 | theorem | Ratner's measure classification (cited) | §27, Theorem 27.7 (proof), p. 184 | missing | routed: source GeometryOfNumbersAndQuadraticArithmetic (GN.4) |
| /90 | theorem | Unipotent-invariant measures are G∞⁺-invariant | §27, Theorem 27.7, p. 183 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /91 | theorem | Reductive subgroups containing a regular nilpotent centralizer | §27, Lemma 27.12, p. 186 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /92 | theorem | Period formula and Parseval identity | §28–§29, §28.1, p. 187 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /93 | theorem | Weak Weyl law and truncated spectral expansion | §28–§29, Theorem 29.1, p. 190 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /94 | theorem | Smoothly weighted asymptotic formula | §30–§31, Theorem 30.1, p. 194 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /95 | theorem | Summing against approximable weights and sets | §30–§31, Corollary 31.8, p. 202 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /96 | theorem | Size of the family (Weyl law) | §30–§31, Lemma 31.9, p. 202 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /97 | theorem | Analytic conductor | §30–§31, Lemma 31.10, p. 202 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /98 | theorem | Main theorem: the averaged Gan–Gross–Prasad period | §30–§31, Theorem 31.11, p. 203 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /99 | theorem | Weak subconvexity | Introduction, §1.1 (1.4), p. 4 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /100 | theorem | The p-adic Plancherel formula (Waldspurger; cited) and finiteness of ∫ dim π^U | Appendix A, §A.3 and §A.4.1, p. 138 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /101 | theorem | The local period of a GGP pair and its convergence (18.1) | §18, (18.1) and (18.2), p. 121 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /102 | theorem | Chevalley's restriction theorem and the Harish-Chandra isomorphism for reductive g_C | §9, §9.1–§9.2 and §9.4, pp. 72–74 | missing | routed: part-ii LieHighestWeightPartIIReductiveHarishChandraIsomorphism |
| /103 | definition | The real form [ig*] and the infinitesimal character λ_π | §9, §9.3–§9.5, pp. 73–75 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /104 | theorem | Local multiplicity one for GGP pairs (cited) | §18, Remark 18.2, p. 122; §20, p. 142; §25.4, p. 168 | missing | routed: new GanGrossPrasadConjecturesForClassicalGroups |
| /105 | theorem | The Schwartz kernel theorem (cited) | §26, proof of Theorem 26.5, p. 179 | missing | routed: source AutomorphicSpectralTheory (AS.0) |
| /106 | theorem | The Riesz–Markov–Kakutani representation theorem (cited) | §26, proof of Theorem 26.5, p. 179 | library | mathlib:RealRMK.rieszMeasure, mathlib:RealRMK.integral_rieszMeasure |
| /107 | theorem | Spinor norms, determinants and G(F_v)/G(F_v)⁺ | §27, proof of Lemma 27.3, p. 182 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /108 | theorem | The compactness criterion for anisotropic groups (cited) | §25.7(2), p. 172; proof of Lemma 27.8, p. 185 | planned | AdelicAlgebraicGroups:AA.3 |
| /109 | theorem | Nelson's theorems on ∆ (cited) | §3, p. 28 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /110 | theorem | Local finiteness of orbital measures (Ranga Rao; cited) | §6.1, p. 42; §11, p. 83 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /111 | theorem | Uniform admissibility (cited) | §24.4, Step 6, p. 163 | planned | SmoothRepresentationsOfLocalGroups:SR.3a |
| /112 | theorem | Connectedness of simply connected real groups (É. Cartan; cited) | §27, proof of Lemma 27.11, p. 185 | missing | routed: new QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups |
| /113 | theorem | Borel's density theorem (cited) | §27, proof of Lemma 27.8, p. 184 | missing | routed: source GeometryOfNumbersAndQuadraticArithmetic (GN.4) |
