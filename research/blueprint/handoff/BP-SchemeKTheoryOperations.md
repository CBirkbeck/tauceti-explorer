# Handoff: BP-SchemeKTheoryOperations (issue #987)

The blueprint of *K-theory of schemes, localisation and operations*, stages S.1–S.7, by Claude Code, session cc-38267a. The coordinator wrote the briefs, quoting the accepted restructuring RS-18's keeps and owner entries for each layer. Four authoring agents wrote one stage group each (S.1–S.2, S.3–S.4, S.5, S.6–S.7); the coordinator merged the fragments, resolved their cross-references and checked the whole.

## Files

- `research/blueprint/packets/SchemeKTheoryOperations.json` (status `partial`, part `null`)
- `research/blueprint/readmes/SchemeKTheoryOperations.md`, generated from the packet so that the two agree
- `research/blueprint/suggested/SchemeKTheoryOperations.lean`
- `research/blueprint/handoff/BP-SchemeKTheoryOperations.md` (this note)

## What is closed

- **253 nodes:** 16 applications, 16 comparisons, 34 constructions, 26 definitions, 82 lemmas, 79 theorems.
  - By stage: S.1 30, S.2 31, S.3 43, S.4 43, S.5 34, S.6 53, S.7 19.
  - 432 API items and 260 unit tests, all with a §12 kind.
  - 42 planets, at most six per layer.
- **Baseline:** 135 declarations, each read at its file and line at the pins.
- **RS-18.** Each layer is planned within its `keeps`, and the owners RS-18 names are imported. Where the current stage graph blocks an import (the tame symbol of K2SymbolsBrauer T.3), the packet records a gap and a restructure proposal instead of planning the owner's content.
- **Coverage of the stage texts.** Every target of every stage text is realised by a node, imported through a request, or recorded as a gap; the coverage note of each stage maps its targets to its nodes.
- **Consumer requests.** Every request other packets make of these stages is supplied or answered:
  - EllipticKTheory E.2–E.8;
  - EllipticRegulators ER.6 (by S.4);
  - KTheoryFiniteLocalFields L.1 (Adams operations);
  - Polylogarithms P.3–P.5;
  - KTheoryLowDegrees U.5/U.6: the DVR boundary, S.3/dvr-boundary-unit-valuation, in the form U.5 imports. A follow-up correction of KTheoryLowDegrees--U.1 can cite these node ids in place of the stage.
- **Checks.**
  - `check_blueprint.py --index`: 0 errors, 0 warnings.
  - `tests/test_blueprints.py`, `test_check_blueprint.py`, `test_errata.py`, `test_source_issues.py`, `test_promote.py`: 49 passed.
  - Stage cycles: none on a freshly pulled main. The check covers atlas `requires` and `stageEdges` plus the node prerequisites of every packet and decomposition.
  - The open GeneralAlgebraicKTheory K.6/K.7 blueprints cite S.5 and S.6. With them included, many edges lie on cycles, because the atlas makes S.2 require K.6 and S.6 require K.7 (restructure).
  - Excerpts were checked against the text layers, and against rendered pages for the scans:
    - OCR, checked on rendered pages: Thomason–Trobaugh and Quillen.
    - No usable text layer: Thomason 1993 and Gillet–Soulé.
    - None exceeds 300 characters.
  - The packet and the document contain no "sorry", Lean code, private paths or the words the brief forbids.
- **Source issues:** 31 mistakes are recorded, with corrections, and the nodes use the corrected statements. Three findings already in the register were not recorded again: KTheoryLowDegrees/E3, E12 and E109.

## What remains, precisely

**S.1** (partial):

- Obtain a source-backed proof that restriction Vect(X) → Vect(A^n) is an equivalence for the affine n-space X with doubled origin, n ≥ 2 (EGA IV 5.9–5.10, cited by TT Ex. 8.6 and K-book Ex. V.6.8) (gap 'Vector bundles on affine space with doubled origin').
- Receive absolute noetherian approximation from AdicCoefficientsAndComparisons L2 (request), used by resolution-property-affine-diagonal for non-noetherian qcqs X; the descent step Stacks 0F8C omits is written out in that node.
- Receive from SchemeAndStackFoundations SF.2 the quasi-coherent cohomology inputs (Serre vanishing on affines, the uniform bound for qcqs morphisms, cohomology and direct sums) used by affine-derived-equivalence, coherator and resolution-property-affine-diagonal (request).

**S.2** (partial):

- Grothendieck's coherence theorem for proper morphisms over a noetherian base is imported without an owner (gap 'Grothendieck's coherence theorem for proper morphisms'); proper-pushforward-coherent and everything downstream of it (G- and K-pushforward, base change, projection formula, perfect pushforward) rest on it.
- Receive from GeneralAlgebraicKTheory K.4 the derived-invariance theorem for complicial biWaldhausen categories (TT 1.9.8, K-book V.3.9 and Ex. V.3.12) and the homotopy invariance of K under natural weak equivalences (TT 1.5.4) (request).
- Receive from GeneralAlgebraicKTheory K.7 the homotopy invariance of biexact pairings under natural weak equivalence of biexact functors (request).
- Receive from SchemeAndStackFoundations SF.2 the quasi-coherent cohomology inputs of total-direct-image-qcqs and derived-tor-independent-base-change (request).

**S.3** (partial):

- Connect S.3/dvr-boundary-on-unit-products to K2SymbolsBrauer T.3/localization-boundary and T.3/tame-symbol once the stage cycle recorded in restructure is removed; until then the identification of ∂_S on all of K_2(L) (including {π, π} = {π, −1}) is a gap.
- Requests to GeneralAlgebraicKTheory K.3 (K-book Ex. V.5.1 boundary formula), K.2:plus (Ex. IV.7.9(c) comparison of automorphism classes), K.7 (boundary linearity for biexact pairings), AdicCoefficientsAndComparisons L2 (EGA IV 8.5 approximation of coherent sheaves) and SchemeAndStackFoundations SF.2 (Čech–Koszul computation, Stacks 08DD and 09IR) are open.
- SchemeKTheoryOperations S.1 is cited as a stage for 'perfect objects of D_QCoh(O_X) are compact' (Stacks 09M1) in S.3/killing-morphisms-into-supported; the coordinator should resolve it to an S.1 node or S.1 should add one.
- K-book Corollary V.6.6.2 (semilocal Dedekind: K_3(F) → ⊕ K_2(R/p) onto) is not planned: its proof lifts Steinberg symbols and needs Matsumoto's theorem (K2SymbolsBrauer T.2, downstream of S.3).
- The proofs of S.3/divisor-support-comparison (TT Exercise 5.7, K-book Ex. V.3.16) and of the K-book's boundary formula Ex. V.5.1 are exercises with hints in the sources read.

**S.4** (partial):

- Requests to StableHomotopyKTheory H.5:spectra (homotopy limits of cosimplicial spectra and the Bousfield–Kan spectral sequence), SchemeAndStackFoundations SF.2 (Grothendieck vanishing, the SGA 4 inputs for Nisnevich cohomological dimension) and SF.5 (Fulton's comparison of the two definitions of rational equivalence) are open.
- Cited without a proof read: Gillet–Levine (K-book 9.7), Panin 2003 (equicharacteristic Gersten via Popescu), Gillet–Soulé's isomorphism of descent and coniveau spectral sequences, the n-variable Weierstrass preparation used in S.4/gersten-power-series, and MVW 12.7 (generation of the Nisnevich topology by distinguished squares; Mathlib MayerVietorisSquare compatibility).
- K-book 6.7 and 6.7.2 assert without proof the existence of a finite extension whose integral closure contains the residue field, and of a subfield over which the residue field is algebraic (gaps recorded).
- Gersten's DVR conjecture with finite residue field or finite coefficients (K-book 6.9.1, 6.9.2, Ex. 6.11) is not planned here: it needs K_*(𝔽_q), Gabber rigidity and Geisser–Levine, and KTheoryFiniteLocalFields L.2 (even-k-field-splitting, henselian-dvr-mod-m-splitting) plans it on top of S.3's DVR sequence.
- K-book Corollary V.6.7.1 (split Gersten sequence for k[t] ⊂ k(t)) needs K_n(k) ≅ K_n(k[t]) (S.5/homotopy-invariance-regular), downstream of S.4; it is proposed for S.5 (restructure).
- Polylogarithms P.5's request (the last two cohomology groups of the Gersten complex agree with those of Bloch's cycle complex) needs higher Chow groups, which are MotivicEtaleKTheory M.4's; S.4 supplies only the Gersten complex (S.4/gersten-conditions-equivalent, S.4/gersten-resolution).

**S.5** (partial):

- Continuity of K under affine inverse limits and absolute noetherian approximation (Thomason–Trobaugh 3.20, C.9) for the qcqs projective-bundle theorem: to be planned in S.2 (gap).
- Additivity of S.2's non-connective K for cofibration sequences of exact functors, in negative degrees: import from GeneralAlgebraicKTheory K.6 (request).
- Compatibility of products with Mayer–Vietoris and localisation boundaries: import from GeneralAlgebraicKTheory K.7 (request); the universal sign ε = ∂_T(T) is left as a constant whose value 1 is asserted, not proved, by Thomason–Trobaugh (gap).
- The exact-sequence form of the blow-up formula (Thomason 1993 Remarque 2.2) needs the K-theoretic excess intersection formula, which S.7 owns downstream (gap and restructure).
- Graded Quillen lemma (K-book Ex. V.3.3) and the Rees dehomogenisation equivalence are exercise- or assertion-level in the K-book; their proof steps are written here but not taken from a source proof (gaps).
- Relative Serre vanishing and p_*O_{X′}(n) = J^n for n ≫ 0, and the regular embedding X′ ⊂ P^{d−1}_X, are cited by Thomason from EGA and SGA 6, not read (gap).
- The Nil-category description of NK for non-affine schemes (Thomason–Trobaugh Ex. 9.13) has no proof in the sources read; only the affine Nil terms are imported from K.6 (gap).

**S.6** (partial):

- Quillen's homology isomorphism for block-triangular groups (Characteristic classes of representations, LNM 551), used for the additivity of q on non-split exact sequences (gap).
- Proof of Serre's Théorème 4 (representation ring of a split reductive group over a field); the ℂ case is requested from Tau Ceti RepresentationTheory/ClassicalGroups layers 3–4 (gap and request).
- Hiller's obstruction-theoretic proof of the universality of q (gap), on which the multiplicativity of ψ^k for Loday's product rests.
- Suslin's stability theorems (surjective stability for Volodin's model; stability for local rings) and Serre's splitting theorem, used for the γ-length bounds (gaps).
- The Brown–Gersten closed model structure on simplicial sheaves (gap), and the global comparison of the sheaf-level tensor pairing with Waldhausen's product (gap; Riou Proposition 3.2.1 covers smooth schemes over a regular base).
- Grothendieck's integrality of the twisted λ-operations (SGA 6 V §5) and SGA 6 VI 6.6 (F^{d+1}_γK_0 = 0) — SGA 6 not obtained (gaps).
- Fulton's factorisation lemma for embeddings of singular quasi-projective schemes (gap), and the A¹-homotopy input of Riou's uniqueness (gap).
- Soulé's Théorème 2 (top weight of K_m of a field is Milnor K-theory modulo torsion) is not planned (gap).

**S.7** (partial):

- Jussila's F^p_γK_0 ⊆ F^p_cod K_0 for arbitrary noetherian X (SGA 6 X, not obtained) and Gillet–Soulé's Brown-filtration comparison (their §§1–3, Theorem 2), recorded as gaps behind S.7/gamma-in-coniveau.
- Grothendieck–Riemann–Roch with values in Chow groups over a Dedekind or regular arithmetic base (needed for regular arithmetic surfaces by EllipticKTheory E.6 and EllipticRegulators ER.6) is not supplied by SF.5's source scope (Borel–Serre, Fulton 15.2 over a field); S.7 supplies Soulé's γ-graded Riemann–Roch over a regular base instead, and the Chow-valued arithmetic version remains a gap.
- Manin's identity k^r ch^{−1}(ψ^k Td(P^r)^{−1}) ch(Td(P^r))^{−1} = θ^k(P^r) (Lectures on the K-functor, Lemma 18.4), cited in the proof of S.7/adams-riemann-roch (gap).
- The requests to SF.5 and to JacobianChallenge layers A and B must be answered by those owners.

## Gaps

- **Grothendieck's coherence theorem for proper morphisms.** Needed by `S.2/proper-pushforward-coherent`, `S.2/proper-perfect-pushforward-perfect`, `S.2/g-theory-proper-pushforward`, `S.2/k-theory-proper-pushforward`.
- **Vector bundles on affine space with doubled origin.** Needed by `S.1/doubled-plane-counterexample`.
- **Tame-symbol identification of the DVR boundary on K_2 cannot be imported.** Needed by `S.3/dvr-boundary-on-unit-products`, `S.3/dvr-boundary`, `S.3/vertical-residue-compatibility`.
- **The boundary formula for an automorphism class (K-book Ex. V.5.1) and the comparison of automorphism classes (Ex. IV.7.9(c)) are exercises.** Needed by `S.3/boundary-of-a-nonzerodivisor`, `S.3/dvr-boundary-unit-valuation`, `S.3/unit-boundary-is-divisor`.
- **Exercise-level proofs of the divisor comparison.** Needed by `S.3/divisor-support-comparison`.
- **Reduction steps asserted without proof in K-book 6.7 and 6.7.2.** Needed by `S.4/gersten-dvr-split`, `S.4/gersten-dvr-equicharacteristic`.
- **Gillet–Levine's theorem not read.** Needed by `S.4/gillet-levine-smooth-over-dvr`, `S.4/mixed-char-higher-effacement`, `S.4/mixed-char-k0-generation`, `S.4/mixed-char-gersten-partial-exactness`, `S.4/mixed-char-gersten-from-dvr`.
- **Panin's equicharacteristic Gersten theorem not read.** Needed by `S.4/panin-equicharacteristic-gersten`.
- **Weierstrass preparation in several variables.** Needed by `S.4/gersten-power-series`.
- **Gillet–Soulé comparison of the descent and coniveau spectral sequences.** Needed by `S.4/descent-coniveau-e2-comparison`.
- **Nisnevich site inputs cited from SGA 4, EGA IV and MVW.** Needed by `S.4/nisnevich-site`, `S.4/nisnevich-cohomological-dimension`, `S.4/nisnevich-descent`.
- **Proper pushforward on the coniveau spectral sequence.** Needed by `S.4/g-coniveau-spectral-sequence`.
- **Graded Quillen lemma is an exercise in the K-book.** Needed by `S.5/graded-quillen-lemma`.
- **Rees dehomogenisation equivalence is asserted without proof.** Needed by `S.5/rees-dehomogenisation`, `S.5/g-theory-homotopy-invariance-affine`.
- **Sign of the boundary of the unit T.** Needed by `S.5/bass-boundary-splitting`, `S.5/punctured-line-localisation-test`.
- **Exact-sequence form of the blow-up formula needs K-theoretic excess intersection.** Needed by `S.5/blowup-formula`.
- **EGA and SGA 6 inputs of Thomason's blow-up lemmas.** Needed by `S.5/regular-blowup-geometry`, `S.5/blowup-adjunction-lemma`, `S.5/blowup-acyclicity-criterion`, `S.5/projective-bundle-cohomology`.
- **Nil description of NK for non-affine schemes.** Needed by `S.5/nk-decomposition`, `S.5/affine-fundamental-theorem-comparison`.
- **Quillen's homology isomorphism for block-triangular linear groups.** Needed by `S.6/representation-classifying-map`, `S.6/soule-scheme-operations`.
- **Serre's theorem on representation rings of split reductive groups.** Needed by `S.6/serre-representation-ring-theorem`.
- **Hiller's universality of the classifying map.** Needed by `S.6/hiller-universality`, `S.6/adams-product-compatibility`, `S.6/scheme-adams-multiplicative`.
- **Suslin's stability theorems and Serre's splitting theorem.** Needed by `S.6/soule-gamma-bound`, `S.6/scheme-gamma-bound`, `S.6/sheaf-level-k-theory-model`.
- **The homotopy theory of simplicial sheaves on a noetherian scheme.** Needed by `S.6/simplicial-sheaf-hypercohomology`, `S.6/soule-scheme-operations`.
- **Products at the sheaf level and the Loday–Waldhausen comparison.** Needed by `S.6/product-low-degree-comparison`, `S.6/soule-scheme-operations`, `S.6/scheme-adams-multiplicative`.
- **SGA 6 inputs: twisted λ-operations, the γ-length of K_0 and Jussila's inclusion.** Needed by `S.6/twisted-lambda-ring`, `S.6/scheme-gamma-bound`, `S.7/gamma-in-coniveau`.
- **Gillet–Soulé's comparison of the Brown and coniveau filtrations.** Needed by `S.7/gamma-in-coniveau`.
- **Fulton's factorisation lemma for singular quasi-projective schemes.** Needed by `S.6/singular-scheme-operations`.
- **Representability of K-theory in the A¹-homotopy category.** Needed by `S.6/riou-motivic-uniqueness`.
- **Swan's theorem that R_A(G) is a special λ-ring.** Needed by `S.6/representation-ring`.
- **Manin's identity for the Bott class of projective space.** Needed by `S.7/adams-riemann-roch`.
- **Soulé's Théorème 2 and the Beilinson–Soulé conjecture.** Needed by `S.6/field-weight-decomposition`.
- **Chow-valued Riemann–Roch over arithmetic bases.** Needed by `S.7/grothendieck-riemann-roch`, `S.7/adams-riemann-roch`.
- **Exterior powers of sheaves of modules.** Needed by `S.6/vector-bundle-lambda-ring`, `S.7/gamma-first-graded-pieces`.

## Requests made

- **GeneralAlgebraicKTheory:K.4** (16 nodes): K.4's text: 'Prove approximation and the comparison with the Q-construction for exact categories' and 'For bounded complexes of projectives, use quasi-isomorphisms ... Prove the Gillet–Waldhausen comparison'. S.1–S.2 need, besides the existing K.4 nodes (S-construction, approximation, Gillet–Waldhausen, delooping): (a) a natural transformation of exact functors that is objectwise a weak equivalenc…
- **GeneralAlgebraicKTheory:K.7** (5 nodes): K.7's text: 'Construct external products from biexact functors and their associativity, unit and symmetry homotopies.' S.2 needs, for Waldhausen categories of complexes: the pairing K(A) ∧ K(B) → K(C) of a biexact functor (K.7/biexact-pairings-and-products), natural in exact functors of each variable, and homotopy invariance: two biexact functors related by a natural transformation that is objectw…
- **SchemeAndStackFoundations:SF.2** (10 nodes): SF.2's text: 'construct sheaf cohomology, localization, proper/smooth base change'. S.1–S.2 need the quasi-coherent cohomology of schemes: Serre's vanishing H^p(Spec A, M~) = 0 for p > 0 (Stacks Cohomology of Schemes 2.2); for f : X → Y quasi-compact quasi-separated with Y quasi-compact, R^pf_*F is quasi-coherent for quasi-coherent F and vanishes for p ≥ N(X, Y, f), uniformly after base change (Co…
- **AdicCoefficientsAndComparisons:L2** (3 nodes): L2's text: 'First develop noetherian approximation: limits of schemes with affine transition maps, finite-presentation descent of morphisms and diagrams, eventual recognition of the relevant properties'. S.1 (and S.5's projective-bundle theorem for qcqs schemes) need absolute noetherian approximation as a declaration: every quasi-compact quasi-separated scheme X is the limit of a directed inverse …
- **tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map** (2 nodes): RS-18's supplier of the degree-zero categorical Cartan map: 'the Cartan map K₀(proj A) → G₀(mod A) and its inverse under finite projective resolutions', already built in the pinned Tau Ceti as TauCeti.cartanMap, TauCeti.cartanEquiv and TauCeti.cartanMap_bijective (cited as baseline). S.2 imports it, proves that π_0 of the scheme-level Cartan map on Spec R is this map, and supplies the regular-ring…
- **GeneralAlgebraicKTheory:K.3** (2 nodes): The boundary of Quillen's localisation for a Serre subcategory B ⊆ A sends the class [α] ∈ K_1(A/B) of an endomorphism α: A → A in A that is an isomorphism in A/B to [coker α] − [ker α] ∈ K_0(B) (K-book Ex. V.5.1), and the universal property of Gabriel's Serre quotient A → A/B for exact functors killing B. K.3's text: 'Prove Quillen localisation for a Serre subcategory of a small abelian category …
- **GeneralAlgebraicKTheory:K.2:plus** (6 nodes): Under the + = Q equivalence of GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q, the class of g ∈ GL_n(R) in π_1BGL(R)^+ corresponds to the class [g] ∈ π_2BQP(R) of the automorphism g of R^n represented by the square of K-book Ex. IV.7.9 (part (c) of that exercise). K.2:plus's text: 'identify its zero component naturally with BGL(A)⁺'. The plus-construction model K(A) ≃ K_0(A) × BGL(A)^+ with its bl…
- **SchemeAndStackFoundations:SF.5** (9 nodes): Chow groups CH^p(X) of cycles modulo rational equivalence with the equality of the two descriptions of rational equivalence (divisors div_Y(f) of rational functions on codimension-(p − 1) subvarieties, with orders by length, versus the X × P¹ definition; Fulton Proposition 1.6), which K-book Lemma V.9.4.1 uses to identify E_2^{p,−p} with Fulton's Chow group. SF.5's text: 'Construct Chow groups, ra…
- **StableHomotopyKTheory:H.5:spectra** (6 nodes): Homotopy limits of cosimplicial fibrant spectra (Bousfield–Kan) with their spectral sequence E_2^{p,q} = π^pπ_q ⇒ π_{q−p} holim and Thomason's convergence criteria (Thomason 1985 §5.13, 5.31, 5.44-5.48), Postnikov towers of spectra, filtered homotopy colimits, and presheaves of spectra with objectwise fibrant replacement. H.5:spectra's text: 'Construct suspension spectra, loop and shift, stable ho…
- **AlgebraicModuliForArithmeticGeometry:R09.1** (8 nodes): The projective bundle P(E) = Proj_X(Sym E) of a finite locally free O_X-module of constant rank r over an arbitrary scheme, with O(n), the tautological surjection π^*E → O(1), the standard affine cover when E is free, base change along any morphism and along inverse limits of schemes, and relative (very) ampleness of O(1) with Serre vanishing R^qπ_*(F(n)) = 0 for n ≫ 0 and F coherent over a noethe…
- **AlgebraicModuliForArithmeticGeometry:R09.7a** (1 nodes): The blow-up X′ = Proj_X(⊕_{n≥0} J^n) of a quasi-coherent ideal of finite type, with O_{X′}(1), its universal property, the affine charts, compatibility with flat base change, the isomorphism away from the centre and the exceptional divisor as an effective Cartier divisor with ideal O_{X′}(1). R09.7a: 'Construct blowups by the Rees algebra with their projective universal property, affine charts, st…
- **tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces** (1 nodes): The general blow-up of a quasi-coherent finite-type ideal as a relative Proj, which this Tau Ceti layer constructs ('Construct the Rees algebra and the blowup of a quasi-coherent finite-type ideal as a relative Proj. Prove the universal property, properness/projectivity, compatibility with flat base change, behaviour away from the centre, exceptional divisor, strict transform, and affine chart des…
- **GeneralAlgebraicKTheory:K.6** (4 nodes): (1) The ring fundamental theorem with Nil terms in every degree (K-book V.8.1–V.8.2, III.3.6–3.7, III.4.1): 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t, t⁻¹]) → K_{n−1}(R) → 0 split by multiplication by t ∈ K_1(ℤ[t, t⁻¹]), Nil_n(R) ≅ NK_{n+1}(R), and in particular for R = ℤ that K_1(ℤ[T, T⁻¹]) is generated by the images of K_1(ℤ[T^{±1}]) and T·K_0(ℤ); K.6: 'Prove localisation in the nonconnecti…
- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree** (2 nodes): Invertible sheaves and Pic X under ⊗, Weil and Cartier divisors with Cl(X) ≅ Pic X on a smooth curve, and the degree deg L = χ(L) − χ(O_X) with deg O(D) = Σ[κ(x):k]ord_x (layer A: 'Invertible sheaves on a scheme; the Picard group Pic X under ⊗ … Define deg L := χ(L) − χ(O_X) … prove agreement'), used for F^1_γ/F^2_γ ≅ Pic(X) and for Hirzebruch–Riemann–Roch on curves. RS-18 names this layer as S.7'…
- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality** (1 nodes): Coherent cohomology of a smooth projective curve over k, its genus, Riemann–Roch and Serre duality (layer B's title), in the form dim H^0(X, O(D)) = ℓ(D), dim H^1(X, O(D)) = ℓ(W − D) and agreement of the genus with Tau Ceti's function-field genus, used to compare S.7's Hirzebruch–Riemann–Roch with TauCeti.exists_isRiemannRochDivisor.
- **tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-4-characters-and-schur-polynomials** (1 nodes): The torus character of a rational GL_n(ℂ)-representation is a symmetric Laurent polynomial, the characters of the irreducibles are det-twisted Schur polynomials, and (with layer 3's highest-weight classification) the character map from the representation ring of GL_n(ℂ) to ℤ[X_1^{±1}, …, X_n^{±1}]^{S_n} is an isomorphism (layer 4: 'Characters are Schur polynomials … The rational character is Laure…

## Structural proposals

- **Quasi-coherent and coherent cohomology of morphisms needs a stated owner** (rescope).
- **Derived invariance of Waldhausen K-theory (TT 1.9.8) as an explicit K.4 node** (rescope).
- **The tensor-product pairings are constructed in S.2 and extended in S.6** (boundary).
- **Nonconnective K-theory of a scheme placed in S.2** (rescope).
- **Absolute noetherian approximation belongs in the scheme foundations** (rescope).
- **S.2's Cartan equivalence does not need finite dimension** (rescope).
- **S.3 cannot import the tame-symbol owners RS-18 assigns to it** (cycle).
- **K-book Corollary V.6.7.1 belongs to S.5** (move).
- **Gersten's DVR conjecture for finite residue fields and finite coefficients is KTheoryFiniteLocalFields L.2's** (ownership).
- **ER.6's residue-composite request is supplied by S.4, not S.3** (routing).
- **Proposed sub-layers of S.3** (sub-layers).
- **Proposed sub-layers of S.4** (sub-layers).
- **The exact-sequence form of the blow-up formula and the K-theoretic excess intersection formula** (rescope).
- **The codimension-one triangle is the base case of S.7's self-intersection formula** (build-on).
- **The scheme clause of K.6's agreement with Thomason's K^B rests on S.5** (cycle).
- **K.6's open blueprint cites S.5 for the scheme fundamental theorem** (cycle).
- **Blow-ups have two planned owners** (duplicate-owner).
- **Proposed sub-layers of S.5 for the atlas** (sub-layers).
- **The K-theoretic splitting principle is planned in S.6, not S.7** (ordering).
- **The abstract λ-ring algebra should be owned by KTheoryLowDegrees Z.3** (ownership).
- **GeneralAlgebraicKTheory K.7's product node mentions schemes** (overlap).
- **Chow-valued Riemann–Roch over arithmetic bases has no owner** (boundary).
- **The open K.6/K.7 blueprint cites S.5 and S.6 and would close cycles** (cycle).
- **No cycle through the tame symbol is needed by S.6** (cycle).
- **KTheoryLowDegrees U.5 and U.6 should cite S.3's DVR-boundary nodes** (interface).
- **ER.6's residue-composite request is supplied by S.4/residue-composite-vanishes** (interface).
- **P.5's Gersten–Bloch comparison needs higher Chow groups, which are MotivicEtaleKTheory's** (interface).
- **Boundary conventions: S.3's right-linear boundary against L.2's left-linear one** (interface).

## Suggested Lean file

`research/blueprint/suggested/SchemeKTheoryOperations.lean` (5392 lines) **compiles**: exit code 0 against Mathlib `082e2d3` and Tau Ceti `f790474`, with 302 warnings, all "declaration uses `sorry`". The same holds with `autoImplicit` and `relaxedAutoImplicit` off. There is no `set_option`, and no statement or carrier is `True`, `Unit`, `PUnit` or an opaque `sorry` type.

- **How it was compiled.** The imported Tau Ceti modules were compiled from the pinned sources with `lean -o` into a directory first on `LEAN_PATH`, beside a Lake project with Mathlib `082e2d3`.
- **Coverage.** All 253 nodes and every packet name appear in the file.
  - 162 of the 432 API items are declarations under the packet names.
  - 104 of the 260 tests are `example`s under `-- test <name> (<kind>)`.
  - 42 of the 193 theorem-type nodes are stated.
  - The rest are comments of the form "not stated here; needs <carrier> (supplier: …)". The missing carriers are mainly K-theory spectra and their maps, spectral sequences, P(E) and O(n), Chow groups, simplicial sheaves and BGL⁺.
- **Real definitions.**
  - Strictly perfect, pseudo-coherent, tor-amplitude and perfect complexes on schemes, and perfect module complexes.
  - The resolution property.
  - Support subcategories and coherent supports, the Nisnevich topology and its distinguished squares, and the codimension filtration.
  - Grothendieck's universal polynomials, special λ-rings, Adams operations, the γ-filtration, representation rings, the Bott class and the twisted λ-ring.
  - The degree-zero groups K₀, G₀ and K₀(Vect) through Tau Ceti's triangulated and exact K₀, and the degree-zero Cartan map.
- **Packet corrections from the formalisation** (applied before this commit):
  - the api name IsPerfectModule;
  - the formal definition of tor-amplitude by flat representatives;
  - the span statement of the γ-filtration for a general binomial base;
  - the nil-augmentation hypothesis of the Bott exponential;
  - the expansion in the γ-Chern test;
  - ψ⁰ = ι ∘ ε;
  - the rank argument of the twisted λ-ring;
  - the comparison with Tau Ceti's repRing;
  - three library placements;
  - a new gap for exterior powers of sheaves of modules.

## Sources

Read (versions and SHA-256 in the packet):

- The K-book: an introduction to algebraic K-theory, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- Corrections to “The K-book: an introduction to algebraic K-theory”, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf).
- Higher algebraic K-theory of schemes and of derived categories, R. W. Thomason and Thomas Trobaugh (https://gwern.net/doc/math/1990-thomason.pdf).
- The Stacks Project, Chapter Cohomology of Sheaves (tag 01DW), The Stacks Project Authors (https://stacks.math.columbia.edu/download/cohomology.pdf).
- The Stacks Project, Chapter Derived Categories of Schemes (tag 08CU), The Stacks Project Authors (https://stacks.math.columbia.edu/download/perfect.pdf).
- The Stacks Project, Chapter More on Algebra (tag 05E3), The Stacks Project Authors (https://stacks.math.columbia.edu/download/more-algebra.pdf).
- The Stacks Project, Chapter Derived Categories (tag 05QI), The Stacks Project Authors (https://stacks.math.columbia.edu/download/derived.pdf).
- Negative K-theory of derived categories, Marco Schlichting (https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf).
- The resolution property for schemes and stacks, Burt Totaro (https://arxiv.org/pdf/math/0207210).
- Higher algebraic K-theory: I, Daniel Quillen (https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf).
- Algebraic K-theory and étale cohomology, R. W. Thomason (http://www.numdam.org/item/10.24033/asens.1495.pdf).
- The Stacks Project, Chapter 28: Properties of Schemes, The Stacks Project Authors (https://stacks.math.columbia.edu/download/properties.pdf).
- A survey of Gersten's conjecture, Satoshi Mochizuki (https://arxiv.org/abs/1608.08114).
- Les K-groupes d'un schéma éclaté et une formule d'intersection excédentaire, R. W. Thomason (https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf).
- The Stacks project, The Stacks project authors (https://stacks.math.columbia.edu).
- Opérations en K-théorie algébrique, Christophe Soulé (https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427).
- Filtrations on higher algebraic K-theory, Henri Gillet and Christophe Soulé (http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf).
- Groupes de Grothendieck des schémas en groupes réductifs déployés, Jean-Pierre Serre (http://www.numdam.org/item/10.1007/BF02684589.pdf).
- λ-Structure en K-théorie algébrique, Christian Kratzer (https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0055/LOG_0018.pdf).
- Algebraic K-theory, A¹-homotopy and Riemann–Roch theorems, Joël Riou (https://arxiv.org/pdf/0907.2710).
- Le théorème de Riemann-Roch, Armand Borel and Jean-Pierre Serre (http://www.numdam.org/item/10.24033/bsmf.1500.pdf).

Thomason–Trobaugh was read from a scan of the published article (the gwern.net copy; the Ranicki archive link returns 404). Quillen 1973 was read from a scan on the Rochester archive, and Gillet–Soulé from the Wayback copy of the K-theory preprint archive.

Not obtained, and cited only through the sources above (each such step is a gap): SGA 6, Fulton–Lang, Fulton's Intersection Theory, Hiller 1981, Quillen 1976, Suslin 1982, Swan, Gillet–Levine 1987 (publisher 403) and Panin 2003.

## For a continuation

- **Close the gaps** from those sources as they become available, and replace the stage-level requests by node ids once the supplier blueprints exist: GeneralAlgebraicKTheory K.3–K.7, SchemeAndStackFoundations SF.2/SF.5, and AdicCoefficientsAndComparisons L2.
- **Break the tame-symbol cycle** (restructure): K2SymbolsBrauer T.1:classical should cite K.2:plus rather than the combined stage K.2, and K3BlochGroups V.2 should not feed T.2:graded-map. Then connect S.3's boundary to T.3's tame symbol.
- **Ownership, via the restructure entries.** The abstract λ-ring algebra (proposed for Z.3), noetherian approximation (proposed for SchemeAndStackFoundations), blow-ups (two planned owners) and Chow-valued arithmetic Riemann–Roch (no owner).
