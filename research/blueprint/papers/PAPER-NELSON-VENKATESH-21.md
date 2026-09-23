# Nelson–Venkatesh (2021): The orbit method and analysis of automorphic forms, extraction and routing

Issue [#2190](https://github.com/CBirkbeck/tauceti-explorer/issues/2190). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Written by Claude Code, session cc-442dc5, on 23 September 2026.
- **The paper.** P. D. Nelson and A. Venkatesh, *The orbit method and analysis of automorphic forms*, Acta Math. 226 (2021), 1–209, DOI 10.4310/ACTA.2021.v226.n1.a1.
- **Items.** The result has **99 items: 3 library, 3 planned and 93 missing**. Every numbered statement is covered, with closely linked ones merged (the note names them). Every missing item is routed exactly once.
- **Mistakes.** 15 findings are recorded under `sourceIssues`, all new. No erratum exists.
  - **The one reaching a stated result: Lemma 27.3's proof in the smallest orthogonal case.** The proof claims the spinor norm is surjective on SO_{n−1} for n − 1 ≥ 2. That is false for SO_2, whose spinor norms are norms from the quadratic field K.
    - For (G, H) = (SO3, SO2), which §25.7 allows, [H] may then meet only half of the components of [G].
    - Theorem 27.1, and with it the main Theorem 31.11, is therefore unproven when Π is dihedral for K.
    - For every other Π the conclusion survives, by an orthogonality argument given in the finding.
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
- **The average.** With a truncated spectral expansion this gives (1/|F_h|)Σ L(Π, Σ) → 1/τ(G) = 1/2 (Theorem 31.11). Under Ichino–Ikeda/N. Harris this is an average of central Rankin–Selberg L-values in arbitrarily large rank, with a weak subconvex bound.

## What the atlas has

**The libraries.** Neither library has coadjoint orbits, Kirillov's formula, unitary representation calculi, Harish-Chandra characters, Plancherel measures or GGP periods. The three `library` items are general tools the proofs use:
- Mathlib's Schwartz space and Fourier transform;
- Stone–Weierstrass, Urysohn and Tietze;
- Arzelà–Ascoli and Radon–Nikodym.

**Planned elsewhere in the atlas.**
- **The Harish-Chandra isomorphism and infinitesimal characters:** Tau Ceti LieHighestWeight layer 7 and AutomorphicFormsOnReductiveGroups AF.1.
- **The Bernstein centre and supercuspidal support:** SmoothRepresentationsOfLocalGroups SR.3.
- **Strong approximation:** AdelicAlgebraicGroups AA.4.
- **Tamagawa measures:** AdelicAlgebraicGroups AA.2.
- **Spectral machinery:** AutomorphicSpectralTheory AS.0 and AS.4.

**Nothing plans** GGP pairs analytically, relative characters, inverse branching, limit states or Ratner's theorem. A Gan–Gross–Prasad roadmap has been proposed by the Beuzart-Plessis–Chaudouard–Zydor extractions but is not accepted, and it is algebraic.

## Routes

- **The calculus of Parts I–II and Appendix A.1–A.3 (39 items): a Part II of the Tau Ceti roadmap *Lie groups and the Lie algebra correspondence*.**
  - It is general harmonic analysis on Lie group representations. It builds on that roadmap's exponential map, Ad, BCH and KAK layers, and other problems (microlocal lifts, sup-norms, subconvexity) will reuse it.
- **The GGP application of Parts III–V (54 items): a new roadmap, AveragedGanGrossPrasadPeriods.**
  - It imports the Part II calculus and the existing local, adelic and spectral foundations.
  - It coordinates with the proposed GGP roadmap for GGP pairs and the Ichino–Ikeda formula.
  - Ratner's theorem and the other cited inputs with no atlas owner are named in the brief.

### Route 1: Part II — Lie groups and the Lie algebra correspondence, Part II: the orbit method and a microlocal calculus for unitary representations (LieGroupsPartIIOrbitMethodCalculus, area representations)

Parts I–II are general harmonic analysis on unitary representations of Lie groups: a pseudodifferential calculus on g^∧ with the Kirillov formula as its trace formula. They extend the Tau Ceti Lie-groups roadmap (exponential map, Ad, BCH, KAK) in its own direction, and no atlas layer plans coadjoint orbits, Kirillov's formula or such a calculus. Keeping them separate from the automorphic application lets other work (the sequel on the microlocal lift, sup-norm and subconvexity problems) import them.

**Brief for the design job.** Design LieGroupsPartIIOrbitMethodCalculus, the Part II of Lie groups and the Lie algebra correspondence (tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups), following Nelson–Venkatesh, The orbit method and analysis of automorphic forms (Acta Math. 226 (2021)), Parts I–II and Appendix A.1–A.3: a quantitative orbit method, i.e. a microlocal calculus of operators Op_h(a) on unitary representations of a unimodular Lie group attached to symbols on g^∧. Final theorems, as the paper states them: Theorems 5.6 and 5.8 (Op_h(S^m_δ) ⊆ h^{min(0,m)}Ψ^m_δ and the composition formula), Theorems 4.5 and 7.4 (star-product asymptotics, including pairs of subalgebras with g1 + g2 = g), Proposition 8.7 (L² boundedness), Theorem 8.11 and Lemma 8.12, Lemmas 10.1–10.4 (division and localization near a symbol's locus and near infinitesimal characters), Theorem 11.1 and Lemma 11.6 (limit orbits; a fixed tempered π has non-empty limit orbit in N_reg iff it is generic), and Theorem 12.2 (trace and trace-norm estimates h^d tr Op_h(a) = ∫_{hO_π} a dω + …, uniform in tempered π). Cover: symbol classes S^m, S^m_δ and h-dependent families; Sobolev scales π^s and operator classes Ψ^m, Ψ^m_δ with the commutator characterisation (Proposition 8.2); cut-off independence and near-equivariance; polynomial symbols Op(p) = π(sym p); coadjoint orbits, normalized symplectic measures and multiorbits; infinitesimal characters, their behaviour under duality (Lemma 9.2), the temperedness criterion (Lemma 9.4), ∆-eigenvalue bounds (Lemma 9.5) and γ∘sym (Lemma 9.6); K-type and matrix-coefficient bounds and the uniform trace-class property of ∆^{−N} (Lemmas A.1–A.3). Keep the paper's δ < 1/2 (Planck-scale) restriction and its h-dependent conventions (§1.14). Import rather than re-plan: the exponential map, Ad and Baker–Campbell–Hausdorff from this parent's layers 0, 1 and 3 and the KAK decomposition from layer 9; the centre of U(g) and the Harish-Chandra isomorphism from Lie algebras: highest weight theory (tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight, layer 7); (g, K)-modules and infinitesimal characters from Automorphic forms on reductive groups (AutomorphicFormsOnReductiveGroups AF.1); trace-class and Hilbert–Schmidt operators and unbounded self-adjoint operators from Automorphic spectral theory (AutomorphicSpectralTheory AS.0); Schwartz spaces and the Fourier transform from Mathlib. Cited inputs to be planned or taken as theorem boundaries: Harish-Chandra's locally integrable character, Rossmann's Kirillov formula and orbital-limit results, the Langlands classification, Vogan's minimal K-types and Blattner's formula, the Cowling–Haagerup–Howe bound, Kostant and Barbasch–Vogan on generic representations, the Cotlar–Stein lemma and Nelson's analytic-vector theorem.

**Missing items taken (39).** The operator assignment Op and its rescaling Op_h (/2); The star product and the composition formula (/3); Sobolev spaces and operator classes Ψ^m (/4); Composition and basic members of the operator classes (/5); Symbol classes S^m and S^m_δ (/6); Asymptotics of the star product (/7); Polynomial symbols (/8); h-dependent operator classes Ψ^m_δ (/9); Independence of the cut-off (/10); Near-equivariance (/11); Op maps symbols to operators, compatibly with composition (/12); The rescaled calculus (/13); Coadjoint orbits, normalized symplectic measure and multiorbits (/14); The Kirillov character formula (Rossmann; cited) (/15); Trace estimates for the calculus (/16); Star products for pairs of subalgebras (/17); Taylor bound for the BCH phase (/18); Non-stationary phase (/19); Localized symbols and dyadic–Planck partitions (/20); Remainder estimates for localized star products (/21); Asymptotics for convolution with a bump (/22); Fourier transforms of symbols away from the origin (/23); Membership criterion for Ψ^m (/24); L²-boundedness of order-zero operators (/25); The Cotlar–Stein lemma (cited) (/26); Composition across proper subgroups (/27); Infinitesimal characters of duals and conjugates (/29); The Langlands classification (cited) (/30); Infinitesimal criterion for temperedness (/31); Eigenvalues of ∆ and infinitesimal characters (/32); Approximate division (/33); Localizing near the locus of a symbol (/34); Localizing near infinitesimal characters (/35); Topology on regular coadjoint multiorbits (after Rossmann) (/36); Uniform bounds for symplectic measures (/37); Limit orbits of fixed representations (/38); Refined trace estimates (/39); Uniform bounds for K-types and matrix coefficients (/40); Uniform trace-class property of ∆^{−N} (/41).

### Route 2: new roadmap — Averages of Gan–Gross–Prasad periods via the orbit method (after Nelson–Venkatesh) (AveragedGanGrossPrasadPeriods, area automorphic)

Nothing in the atlas studies Gan–Gross–Prasad periods analytically: there is no layer for GGP pairs and their stability, relative characters and their asymptotics, inverse branching, limit states with Ratner-type equidistribution, or averages of branching coefficients. The GGP roadmap proposed by other extractions (not yet accepted) is algebraic (relevant pairs, Vogan packets, trace-formula comparison), so the paper's application is a new roadmap that imports the calculus of the Part II above and the local and adelic foundations that exist.

**Brief for the design job.** Design AveragedGanGrossPrasadPeriods, a new roadmap following Nelson–Venkatesh, The orbit method and analysis of automorphic forms (Acta Math. 226 (2021)), Parts III–V. Final theorem, exactly as the paper states it: Theorem 31.11 — for a GGP pair (G, H) over a number field F with G, H anisotropic ((U_{n+1}, U_n), n ≥ 1, or (SO_{n+1}, SO_n), n ≥ 2), a fixed cuspidal Π unramified outside R, tempered at R, with G quasi-split and Π_q generic at one archimedean place q and G compact at the other archimedean places, and admissible sets U, U′ defining families F_h: (1/|F_h|)Σ_{Σ∈F_h} L(Π, Σ) = 1/τ(G) + o(1), and under the Ichino–Ikeda/N. Harris conjecture the corresponding average of (τ(G)τ(H)/2^β)∆_G^{(R)}L^{(R)}(½, Π×Σ^∨)/L^{(R)}(1, Ad, Π×Σ^∨) is τ(H) + o(1); with Theorem 30.1 (smoothly weighted form), Lemma 31.9 (family size), Lemma 31.10 (conductor ≍ |F_h|⁴) and the weak subconvex bound (1.4). Intermediate theorems to state as printed: Theorems 14.2 and 14.5 (stability ⇔ ev(x) ∩ ev(x_H) = ∅; stable fibres are H-torsors), Lemma 15.4 (stability ⇔ no conductor drop), Theorem 16.7 and Theorem 17.2 (volume forms and disintegration), Lemma 18.1 (relative characters), Theorem 19.3 (asymptotics of relative characters away from the conductor-dropping locus), Theorem 22.2 and Lemma 22.4 (archimedean inverse branching), Theorem 24.5 (cuspidal-type l-components are allowable), Theorems 26.4–26.5 (limit states), Theorem 27.1 (equidistribution on [H], via Ratner) and Theorem 29.1. Keep visible that the proof of Lemma 27.3 fails for (SO3, SO2), where the torus's spinor norms are norms from K = F(√−disc V_H): there Theorem 27.1 needs Π ≇ Π ⊗ (η_{K/F}∘θ) or a new argument. Import rather than re-plan: the orbit-method calculus from Lie groups and the Lie algebra correspondence, Part II (LieGroupsPartIIOrbitMethodCalculus, proposed with this paper); Hecke algebras, induction, Jacquet modules, admissibility and the Bernstein centre from Smooth representations of local groups (SmoothRepresentationsOfLocalGroups SR.1–SR.3); Tamagawa measures and strong approximation from Adelic algebraic groups and arithmetic quotients (AdelicAlgebraicGroups AA.2, AA.4); spectral decomposition and trace-class machinery from Automorphic spectral theory (AutomorphicSpectralTheory AS.0, AS.4); automorphic representations from AutomorphicFormsOnReductiveGroups AF.1–AF.2; Rankin–Selberg local factors from Automorphic L-functions and local factors (AutomorphicLFunctionsAndLocalFactors AL.3). Coordinate with the Gan–Gross–Prasad roadmap proposed by the Beuzart-Plessis–Chaudouard–Zydor extractions (GanGrossPrasadConjecturesForClassicalGroups), which should own GGP pairs, local multiplicity one and the Ichino–Ikeda formulas if accepted. Cited inputs with no atlas owner, to be taken as theorem boundaries or planned separately: Ratner's measure classification (a homogeneous-dynamics roadmap is recommended), Mumford's GIT and the Hilbert–Mumford criterion, Kostant on regular nilpotents, Harish-Chandra's and Waldspurger's Plancherel formulas, Mœglin–Waldspurger and Beuzart-Plessis strong multiplicity one, Sakellaridis–Venkatesh positivity, the Tamagawa numbers τ(SO_n) = τ(U_n) = 2 (Weil, Ono), and the Ichino–Ikeda and N. Harris conjectures with W. Zhang's theorem.

**Missing items taken (54).** Gan–Gross–Prasad pairs (/42); Eigenvalue invariants ev(x) (/43); Eigenvalues and isotropic eigenvectors; a regularity criterion (/44); GGP pairs are spherical (cited) (/45); GIT stability background (cited) (/46); Stability for GGP pairs (/47); Stable fibres are H-torsors (/48); Infinitesimal characters and Langlands parameters (/49); Satake parameters of the Rankin–Selberg L-function (/50); Stability is absence of conductor dropping (/51); Fibral, Haar, symplectic and affine volume forms (/52); The normalized affine form (/53); Compatibility of orbital volume forms (/54); Measure normalizations over R (/55); Stable fibres over R and the disintegration formulas (/56); A Łojasiewicz-type inequality (/57); Plancherel measure and affine measure (/58); Relative characters (/59); Positivity of relative characters (cited; archimedean case expected) (/60); A-priori bounds for relative characters (/61); Asymptotics of relative characters in the stable case (/62); Small, medium and huge elements of S (/63); The Plancherel formula (cited) (/64); Plancherel formula for Ξ-integrable functions (/65); Distinguished duals and the functionals ℓ_σ (/66); Orbit-distinction (/67); Archimedean inverse branching (/68); Test functions for the Weyl law (/69); Good compact open subgroups and invariant vectors (/70); Tempered representations from square-integrable ones (cited) (/72); l-components (/73); Strong multiplicity one (cited) and the structure of Ω (/74); Allowable components and functions (/75); Cuspidal-type components are allowable (/76); Uniform distinction and the Stone–Weierstrass inputs (/77); Global setting, Tamagawa measures and assumptions (/79); The branching coefficient L(Π, Σ) (/80); The Ichino–Ikeda and N. Harris conjectures (conjectural; cited) (/81); Limit states (/82); Disintegration of limit states (/83); Equidistribution of limit states on [H] (/85); Reduction to G∞⁺-invariance (/86); Regular nilpotents (Kostant; cited) (/88); Ratner's measure classification (cited) (/89); Unipotent-invariant measures are G∞⁺-invariant (/90); Reductive subgroups containing a regular nilpotent centralizer (/91); Period formula and Parseval identity (/92); Weak Weyl law and truncated spectral expansion (/93); Smoothly weighted asymptotic formula (/94); Summing against approximable weights and sets (/95); Size of the family (Weyl law) (/96); Analytic conductor (/97); Main theorem: the averaged Gan–Gross–Prasad period (/98); Weak subconvexity (/99).

## Prerequisite papers the atlas does not cover

- W. Rossmann, Kirillov's character formula for reductive Lie groups, Invent. Math. 48 (1978), 207–220; Limit characters of reductive Lie groups, Invent. Math. 61 (1980); Limit orbits in reductive Lie algebras and Tempered representations and orbits, Duke Math. J. 49 (1982) (https://doi.org/10.1007/bf01390244). [Ros1–Ros4]: the Kirillov formula (Theorem 6.1) and the continuity of orbital measures (Theorem 11.1, Lemma 11.2, Lemma 16.4).
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

## Mistakes found (`sourceIssues`)

Locators are in the published text; every finding except the citation (E7) is also in arXiv v3. Where each was searched for an existing correction is recorded in the result.

- **E1** (gap; affects a stated result), Proof of Lemma 27.3, p. 182 (also arXiv v3).
  - *Printed:* G=SOn: in this case, the spinor norm injects G(Fv)/G(Fv)+ into Fv× modulo squares, and our assertion follows from the surjectivity of the spinor norm on SOn−1 (for n−1⩾2).
  - *Correction:* The spinor norm is surjective on SO_{n−1} only when n − 1 ≥ 3 (or the binary space is split). For (G, H) = (SO3, SO2), allowed by §25.7, the claimed surjectivity of H(A) onto ε = G(F)G∞⁺U\G(A) fails for small U, and Theorem 27.1 (hence Lemma 30.4, Theorems 30.1 and 31.11) needs another argument. The argument still works when Π ≇ Π ⊗ (η_{K/F}∘θ), K = F(√−disc V_H): then ∫_{[G]}[a]·(η_{K/F}∘θ) = 0 (multiplication by the automorphic character carries Π into the orthogonal Π ⊗ η∘θ), so the G∞⁺-components that [H] meets carry the average mass. For Π ≅ Π ⊗ (η_{K/F}∘θ) (Π dihedral with respect to K) that integral need not vanish and the proof gives nothing.
  - *Why:* For SO2 = SO(V_H) with V_H an anisotropic plane (as it is here, G being anisotropic), θ(SO2(F_v)) = N(K_v^×)F_v^{×2}, of index 2 in F_v^×/F_v^{×2} wherever K_v is a field. Globally the spinor norms of G(F)H(A)G(A)⁺ lie in F^×N(A_K^×)(A^×)², which is the kernel of η_{K/F} (class field theory), while θ(SO3(F_v)) = F_v^×/F_v^{×2} contains a uniformizer at any inert v. So η_{K/F}∘θ is a non-trivial character of G(A) trivial on G(F)H(A)G(A)⁺, and G(F)H(A) → G(A)/G(A)⁺ is not surjective. It stays non-trivial on ε whenever θ(U) ⊆ ker η_{K/F}, e.g. for U small, and then [H] meets only half of the G∞⁺-orbits. Checked on the page image of p. 182.
- **E2** (gap; affects the proof), Proof of Lemma 7.8, p. 50 (also arXiv v3).
  - *Printed:* Let ∆ denote the multiple of the standard Laplacian for which e^φ=|∂φ|^{−2}∆(e^φ), and set D:=|∂φ|^{−2}∆. Integrating by parts repeatedly, we obtain I = t^{−N}∫ f D^r(e^{tφ}) = t^{−N}∫ D^r(f)e^φ
  - *Correction:* Use the first-order operator L = t^{−1}|∂φ|^{−2}Σ_j (conj ∂_jφ)∂_j, for which L(e^{tφ}) = e^{tφ} because φ is iR-valued, and integrate by parts N times with its transpose L^T; the coefficients of (L^T)^N are polynomials in derivatives of φ and |∂φ|^{−2}, bounded by the lower bound ε and the C^∞ bounds on φ.
  - *Why:* ∆(e^{tφ}) = (t²Σ_j(∂_jφ)² + t∆φ)e^{tφ}, so no multiple of the Laplacian reproduces e^{tφ} unless ∆φ = 0 and |∂φ| is handled separately; also the integration by parts produces the transpose of D, not D. The lemma itself is the standard non-stationary-phase estimate. Checked on the page image of p. 50.
- **E3** (error; affects nothing), Lemma 24.10, the example after it, p. 166 (also arXiv v3).
  - *Printed:* For instance, in the above PGL2(F) example, the conclusion of the lemma holds with f := (α^{−n}+α^{−n+2}+...+α^n)/n for n∈Z⩾1 taken large enough in terms of ε.
  - *Correction:* Drop the example, or replace it by a function bounded on Θ^unit ≅ C^(1) ∪ [q^{−1/2}, q^{1/2}]/∼; the lemma is proved independently by Urysohn and Stone–Weierstrass.
  - *Why:* The first requirement is |f| ≤ 2 on Θ^unit, which contains the real points α ∈ [q^{−1/2}, q^{1/2}] (complementary series, trivial and Steinberg). There f(α) ≥ α^n/n, and at α = q^{1/2} this is q^{n/2}/n → ∞, so f fails the first requirement for n large. It does satisfy the other two: f ≥ (n+1)/n on the real points, and ∫_{C^(1)} f² = (n+1)/n². The bound is needed in Step 5 of §24.4 because the Steinberg representation, in D′, has infinitesimal character α = q^{1/2}. Checked on the page image of p. 166.
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
- **E15** (misprint; affects nothing), p. 109 (§16.4), p. 125 ((19.10)), p. 152 (§23.2), p. 154 (Lemmas 23.3–23.4), p. 202 (proof of Lemma 31.10) (also arXiv v3).
  - *Printed:* generators … for the ring of G-invariant regular functions on h*; Hσ(Oph(a1)…Oph(aj)) = ∫ a1…ak; a maximal compact subgroup K of G for which KP0 = H; σ is a supercuspidal representation of M … subquotient of i^G_M τ; 4dim(B_H) = εn_G n_H
  - *Correction:* H-invariant; a_k; K of H; τ and i^H_M; ε m_G m_H (Table 1)
  - *Why:* Notational slips; the intended meaning is clear from context.

## Gaps

- **G-inputs** (deferred). Cited theorems (Rossmann, Harish-Chandra, Waldspurger, Ratner, Mœglin–Waldspurger, Beuzart-Plessis, Sakellaridis–Venkatesh, Mumford, Kostant, Cowling–Haagerup–Howe) were read only as the paper states them. Named in the briefs as imports or theorem boundaries; prerequisites list the sources.
- **G-SO3** (open). Whether Theorem 31.11 actually fails for (SO3, SO2) with Π dihedral for K was not decided; only that its proof does not cover that case. The design job for AveragedGanGrossPrasadPeriods should either add the hypothesis Π ≇ Π ⊗ (η_{K/F}∘θ) or compute ∫[a]·η∘θ in the dihedral case.

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

## Item index

| Item | Kind | Name | Locator | Status | Layers or declarations |
|---|---|---|---|---|---|
| /1 | theorem | Schwartz spaces and Fourier inversion on the Lie algebra | §2, §2.1, p. 25 | library | mathlib:SchwartzMap, mathlib:SchwartzMap.fourierTransformCLM, mathlib:SchwartzMap.fourierTransformCLE |
| /2 | definition | The operator assignment Op and its rescaling Op_h | §2, §2.2, p. 25 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /3 | construction | The star product and the composition formula | §2, Lemma 2.1, p. 27 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /4 | definition | Sobolev spaces and operator classes Ψ^m | §3, Definition 3.1, p. 29 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /5 | theorem | Composition and basic members of the operator classes | §3, Lemma 3.3, p. 30 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /6 | definition | Symbol classes S^m and S^m_δ | §4, Definition 4.1, p. 33 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /7 | theorem | Asymptotics of the star product | §4, Theorem 4.5, p. 35 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /8 | theorem | Polynomial symbols | §5, Lemma 5.1, p. 37 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /9 | definition | h-dependent operator classes Ψ^m_δ | §5, Definition 5.2, p. 37 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /10 | theorem | Independence of the cut-off | §5, Lemma 5.4, p. 39 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /11 | theorem | Near-equivariance | §5, Lemma 5.5, p. 39 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /12 | theorem | Op maps symbols to operators, compatibly with composition | §5, Theorem 5.6, p. 40 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /13 | theorem | The rescaled calculus | §5, Theorem 5.8, p. 40 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /14 | definition | Coadjoint orbits, normalized symplectic measure and multiorbits | §6, §6.1, p. 41 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /15 | theorem | The Kirillov character formula (Rossmann; cited) | §6, Theorem 6.1, p. 43 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /16 | theorem | Trace estimates for the calculus | §6, Theorem 6.3, p. 44 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /17 | theorem | Star products for pairs of subalgebras | §7, Theorem 7.4, p. 48 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /18 | theorem | Taylor bound for the BCH phase | §7, Lemma 7.6, p. 48 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /19 | theorem | Non-stationary phase | §7, Lemma 7.8, p. 50 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /20 | construction | Localized symbols and dyadic–Planck partitions | §7, Lemma 7.10, p. 51 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /21 | theorem | Remainder estimates for localized star products | §7, Proposition 7.13, p. 53 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /22 | theorem | Asymptotics for convolution with a bump | §7, Lemma 7.14, p. 56 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /23 | theorem | Fourier transforms of symbols away from the origin | §8, Lemma 8.1, p. 57 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /24 | theorem | Membership criterion for Ψ^m | §8, Proposition 8.2, p. 59 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /25 | theorem | L²-boundedness of order-zero operators | §8, Proposition 8.7, p. 61 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /26 | theorem | The Cotlar–Stein lemma (cited) | §8, Lemma 8.10, p. 61 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /27 | theorem | Composition across proper subgroups | §8, Theorem 8.11, p. 71 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /28 | theorem | The GIT quotient [g*_C] and the Harish-Chandra isomorphism | §9, §9.1–§9.5, p. 72 | planned | tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#…, AutomorphicFormsOnReductiveGroups:AF.1 |
| /29 | theorem | Infinitesimal characters of duals and conjugates | §9, Lemma 9.2, p. 75 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /30 | theorem | The Langlands classification (cited) | §9, §9.6, p. 75 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /31 | theorem | Infinitesimal criterion for temperedness | §9, Lemma 9.4, p. 76 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /32 | theorem | Eigenvalues of ∆ and infinitesimal characters | §9, Lemma 9.5, p. 77 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /33 | theorem | Approximate division | §10, Lemma 10.1, p. 79 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /34 | theorem | Localizing near the locus of a symbol | §10, Lemma 10.3, p. 80 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /35 | theorem | Localizing near infinitesimal characters | §10, Lemma 10.4, p. 81 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /36 | theorem | Topology on regular coadjoint multiorbits (after Rossmann) | §11, Theorem 11.1, p. 83 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /37 | theorem | Uniform bounds for symplectic measures | §11, Lemma 11.4, p. 85 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /38 | theorem | Limit orbits of fixed representations | §11, Lemma 11.6, p. 86 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /39 | theorem | Refined trace estimates | §12, Theorem 12.2, p. 88 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /40 | theorem | Uniform bounds for K-types and matrix coefficients | Appendix A, Lemma A.1, p. 137 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /41 | theorem | Uniform trace-class property of ∆^{−N} | Appendix A, Lemma A.3, p. 138 | missing | routed: part-ii LieGroupsPartIIOrbitMethodCalculus |
| /42 | definition | Gan–Gross–Prasad pairs | §13, §13.2, p. 92 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /43 | definition | Eigenvalue invariants ev(x) | §13, §13.4.1, p. 93 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /44 | theorem | Eigenvalues and isotropic eigenvectors; a regularity criterion | §13, Lemma 13.1, p. 93 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /45 | theorem | GGP pairs are spherical (cited) | §13, Lemma 13.3, p. 95 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /46 | theorem | GIT stability background (cited) | §14, Lemma 14.1, p. 96 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /47 | theorem | Stability for GGP pairs | §14, Theorem 14.2, p. 97 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /48 | theorem | Stable fibres are H-torsors | §14, Theorem 14.5, p. 99 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /49 | theorem | Infinitesimal characters and Langlands parameters | §15, Lemma 15.2, p. 104 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /50 | theorem | Satake parameters of the Rankin–Selberg L-function | §15, Lemma 15.3, p. 105 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /51 | theorem | Stability is absence of conductor dropping | §15, Lemma 15.4, p. 107 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /52 | definition | Fibral, Haar, symplectic and affine volume forms | §16, §16.1–§16.4, p. 108 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /53 | theorem | The normalized affine form | §16, Lemma 16.4, p. 110 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /54 | theorem | Compatibility of orbital volume forms | §16, Theorem 16.7, p. 111 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /55 | definition | Measure normalizations over R | §17, §17.1–§17.2, p. 115 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /56 | theorem | Stable fibres over R and the disintegration formulas | §17, Theorem 17.2, p. 118 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /57 | theorem | A Łojasiewicz-type inequality | §17, Lemma 17.3, p. 118 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /58 | theorem | Plancherel measure and affine measure | §17, Lemma 17.4, p. 120 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /59 | theorem | Relative characters | §18, Lemma 18.1, p. 121 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /60 | theorem | Positivity of relative characters (cited; archimedean case expected) | §18, Remark 18.2, p. 122 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /61 | theorem | A-priori bounds for relative characters | §19, Lemma 19.1, p. 123 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /62 | theorem | Asymptotics of relative characters in the stable case | §19, Theorem 19.3, p. 125 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /63 | theorem | Small, medium and huge elements of S | §19, Lemma 19.5, p. 129 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /64 | theorem | The Plancherel formula (cited) | Appendix A, §A.3, p. 138 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /65 | theorem | Plancherel formula for Ξ-integrable functions | Appendix A, Lemma A.4, p. 140 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /66 | definition | Distinguished duals and the functionals ℓ_σ | §20–§22, §20, p. 142 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /67 | definition | Orbit-distinction | §20–§22, §22.2, p. 145 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /68 | theorem | Archimedean inverse branching | §20–§22, Theorem 22.2, p. 146 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /69 | theorem | Test functions for the Weyl law | §20–§22, Lemma 22.4, p. 148 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /70 | theorem | Good compact open subgroups and invariant vectors | §23, Lemma 23.2, p. 153 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /71 | theorem | Supercuspidal support and the Bernstein center | §23, Lemma 23.3, p. 154 | planned | SmoothRepresentationsOfLocalGroups:SR.3, SmoothRepresentationsOfLocalGroups:SR.1 |
| /72 | theorem | Tempered representations from square-integrable ones (cited) | §23, Lemma 23.4, p. 155 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /73 | definition | l-components | §23, §23.7, p. 156 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /74 | theorem | Strong multiplicity one (cited) and the structure of Ω | §24, Lemma 24.1, p. 157 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /75 | definition | Allowable components and functions | §24, Definition 24.3, p. 159 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /76 | theorem | Cuspidal-type components are allowable | §24, Theorem 24.5, p. 160 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /77 | theorem | Uniform distinction and the Stone–Weierstrass inputs | §24, Lemma 24.6, p. 164 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /78 | theorem | Stone–Weierstrass, Urysohn and Tietze (used) | §24, Lemma 24.9 (proof), p. 166 | library | mathlib:ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints, mathlib:exists_continuous_zero_one_of_isClosed, mathlib:ContinuousMap.exists_extension |
| /79 | definition | Global setting, Tamagawa measures and assumptions | §25, §25.7, p. 171 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /80 | definition | The branching coefficient L(Π, Σ) | §25, §25.4, p. 168 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /81 | theorem | The Ichino–Ikeda and N. Harris conjectures (conjectural; cited) | §25, Conjecture 25.1, p. 169 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /82 | construction | Limit states | §26, Theorem 26.4, p. 177 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /83 | theorem | Disintegration of limit states | §26, Theorem 26.5, p. 178 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /84 | theorem | Arzelà–Ascoli and Radon–Nikodym (used) | §26, Theorem 26.4 (proof), p. 177 | library | mathlib:BoundedContinuousFunction.arzela_ascoli₁, mathlib:MeasureTheory.Measure.rnDeriv |
| /85 | theorem | Equidistribution of limit states on [H] | §27, Theorem 27.1, p. 181 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /86 | theorem | Reduction to G∞⁺-invariance | §27, Lemma 27.3, p. 181 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /87 | theorem | Strong approximation (cited) | §27, Lemma 27.4 (proof), p. 181 | planned | AdelicAlgebraicGroups:AA.4 |
| /88 | theorem | Regular nilpotents (Kostant; cited) | §27, Lemma 27.5, p. 183 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /89 | theorem | Ratner's measure classification (cited) | §27, Theorem 27.7 (proof), p. 184 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /90 | theorem | Unipotent-invariant measures are G∞⁺-invariant | §27, Theorem 27.7, p. 183 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /91 | theorem | Reductive subgroups containing a regular nilpotent centralizer | §27, Lemma 27.12, p. 186 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /92 | theorem | Period formula and Parseval identity | §28–§29, §28.1, p. 187 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /93 | theorem | Weak Weyl law and truncated spectral expansion | §28–§29, Theorem 29.1, p. 190 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /94 | theorem | Smoothly weighted asymptotic formula | §30–§31, Theorem 30.1, p. 194 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /95 | theorem | Summing against approximable weights and sets | §30–§31, Corollary 31.8, p. 202 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /96 | theorem | Size of the family (Weyl law) | §30–§31, Lemma 31.9, p. 202 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /97 | theorem | Analytic conductor | §30–§31, Lemma 31.10, p. 202 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /98 | theorem | Main theorem: the averaged Gan–Gross–Prasad period | §30–§31, Theorem 31.11, p. 203 | missing | routed: new AveragedGanGrossPrasadPeriods |
| /99 | theorem | Weak subconvexity | Introduction, §1.1 (1.4), p. 4 | missing | routed: new AveragedGanGrossPrasadPeriods |
