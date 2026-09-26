# Handoff: BP-KTheoryLowDegrees--Z.3 (issue #765)

Continuation of the merged checkpoint by Codex (codex-hjdg0j, #2772), by Claude Code, session cc-38267a. All 50 of the checkpoint's node ids are kept; its nodes were corrected where needed (literal excerpts, Z.2 stage citations replaced by node ids, the γ-filtration as an ideal) and extended. The coordinator wrote the briefs, quoting RS-18's decisions for each layer. Three authoring agents continued one stage group each (Z.3, Z.4, Z.5–Z.6); the coordinator merged the fragments, resolved their cross-references and checked the whole.

## Files

- `research/blueprint/packets/KTheoryLowDegrees--Z.3.json` (status `partial`, part `Z.3`)
- `research/blueprint/readmes/KTheoryLowDegrees--Z.3.md`, generated from the packet so that the two agree
- `research/blueprint/suggested/KTheoryLowDegrees--Z.3.lean`, extending the checkpoint's file
- `research/blueprint/handoff/BP-KTheoryLowDegrees--Z.3.md` (this note)

## What is closed

- **172 nodes:** 12 applications, 8 comparisons, 24 constructions, 12 definitions, 86 lemmas, 30 theorems.
  - By stage: Z.3 91, Z.4 36, Z.5 31, Z.6 14.
  - 260 API items and 157 unit tests, all with a §12 kind.
  - 18 planets, at most six per layer.
- **Baseline:** 314 declarations, each read at its file and line at the pins.
- **The special-λ question** (the checkpoint's open item). It is decided by Serre's representation-ring route.
  - R_ℤ(∏ GL_N) is special through its injective character map.
  - Projectives of constant rank give pre-λ-maps into K₀ by patching associated modules.
  - Its one gap is Serre's classification input.
  - Weibel's flag-bundle proof would need SchemeKTheoryOperations S.5, which is downstream of Z.3.
- **The abstract λ-ring algebra** now lives in Z.3. The restructure entry lists the SchemeKTheoryOperations S.6 nodes it replaces, and S.6's continuation should cite these ids.
- **Coverage of the stage texts.** Every target is realised by a node, imported through a request, or recorded as a gap. The checkpoint's four gaps are resolved or narrowed: S-integer localisation and transfer (Z.4), the regular-curve resolution and divisor dictionary (Z.5) and the agreement of the γ-filtration with the additive form (Z.3) are decomposed, and the special-λ splitting gap is narrowed to Serre's classification input.
- **Consumer requests.** Supplied:
  - ArithmeticKTheory N.1–N.3, ClassicalArithmeticCompletion CA.7 and SchemeKTheoryOperations S.3 (Z.4/rank-pic-equivalence);
  - SchemeKTheoryOperations S.2/S.6/S.7 and KTheoryLowDegrees U.5 (the Z.3 ids);
  - EllipticKTheory E.2/E.5 (Z.5 and Z.6).
- **Checks.**
  - `check_blueprint.py --index`: 0 errors, 0 warnings; the five blueprint test files: 49 passed.
  - Stage cycles: none. The check covers atlas `requires` and `stageEdges` plus the node prerequisites of every packet and decomposition on a freshly pulled main.
  - Excerpts: 246 of 248 match the text layers letter for letter; the two Serre 1968 excerpts were checked on the page image (garbled text layer). None exceeds 300 characters.
  - The packet and the document contain no "sorry", Lean code, private paths or the words the brief forbids.
- **Source issues:** 19 (the checkpoint's E1–E12 and new E13–E19).
  - A finding on K-book V.3.4.2 was not recorded again: it is SchemeKTheoryOperations/E1.
  - Two authors could not confirm the "known" field of E4: the Wayback copy of Weibel's errata (SHA-256 ef7ed6…) has no p. 80 entry, and its first entry is p. 101. An independent review should decide it.

## What remains, precisely

**Z.3** (partial):

- Close the gap 'Serre's classification input for R_ℤ(GL_{N₁} × ⋯ × GL_{N_r})': the highest-weight classification of simple modules of GL_N over ℚ and over 𝔽_p (Serre's Lemma 5, cited to Chevalley's seminar) and Serre §2 (decomposition homomorphisms, Théorème 3), which Z.3/serre-representation-ring-theorem uses and on which Z.3/ring-k0-special rests; the characteristic-zero part is requested from Tau Ceti RepresentationTheory/ClassicalGroups layers 3–4, the positive-characteristic and ℤ-form parts have no planned supplier.

**Z.4** (source_decomposed):

- Nothing.

**Z.5** (partial):

- Find a source proof for the two exercise-level statements used as lemmas, Weibel Ex. I.5.4 (the exterior filtration of an extension, exterior-power-extension-filtration) and Ex. II.8.5 (det(E ⊗ F), determinant-bundle-tensor), or accept the local-computation proofs given (gap).
- The group structure of Pic(X) for a general scheme (inverse by the dual) is requested from JacobianChallenge layer A; on regular curves line-bundle-divisorial supplies it independently.
- The atlas places SchemeKTheoryOperations S.2, S.6 and S.7 upstream of Z.5 although their nodes use K₀(Vect X), Λᵏ and det of vector bundles planned here; the restructure entry proposes the sub-layer Z.5:vector-bundles upstream of them.

**Z.6** (source_decomposed):

- Nothing.

## Gaps

- **Serre's classification input for R_ℤ(GL_{N₁} × ⋯ × GL_{N_r}).** Needed by `Z.3/serre-representation-ring-theorem`, `Z.3/ring-k0-special`.
- **Exercise-level lemmas without a source proof.** Needed by `Z.5/exterior-power-extension-filtration`, `Z.5/determinant-bundle-tensor`, `Z.5/rank-determinant-surjective`, `Z.5/curve-k-zero-ring`, `Z.3/exterior-extension-filtration`, `Z.3/exterior-extension-graded`, `Z.3/determinant-tensor`.
- **Locally constant tensor powers of line bundles.** Needed by `Z.5/rank-determinant-surjective`.

## Requests made

- **tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-4-characters-and-schur-polynomials** (1 nodes): Layer 4 ('Characters and Schur polynomials'), with layer 3's highest-weight classification: the torus character of a rational representation of GL_n(ℂ) is a symmetric Laurent polynomial, the characters of the irreducibles are det-twisted Schur polynomials, and the character map from the Grothendieck group of rational representations of GL_n(ℂ) (and of products GL_{n₁} × ⋯ × GL_{n_r}) to ℤ[X^{±1}]^…
- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree** (3 nodes): Layer A: 'Invertible sheaves on a scheme; the Picard group Pic X under ⊗' — the group structure on Tau Ceti's commutative monoid LineBundleClass X, the inverse of [L] being [Hom(L, O_X)] with L ⊗ Hom(L, O_X) ≅ O_X (Stacks 01CT), so that the determinant K₀(Vect X) → Pic(X) of KTheoryLowDegrees:Z.5/vector-bundle-determinant is a homomorphism of groups for every scheme; and the smooth-curve 'Cl(X) ≅ …
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts** (2 nodes): Layer 12D: 'Weil divisors on X_F ≅ Divisor k F, matching degrees, principal divisors, and linear equivalence — so Pic-style class groups agree with Cl(F)', used only for the compatibility items of KTheoryLowDegrees:Z.5/point-class-map and Z.5/line-bundle-divisorial on a regular projective curve over a field (RS-18: 'on regular projective function-field models reuse Algebraic Curves 12'); nothing o…
- **tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map** (1 nodes): RS-18's owner of 'the existing categorical Cartan map': TauCeti.cartanMap, TauCeti.cartanMap_of and TauCeti.cartanEquiv, already built at the pin and cited as baseline; Z.6 proves that the vector-bundle Cartan map of Z.5 and π₀ of SchemeKTheoryOperations S.2's Cartan map are this map, and defines no second one.
- **tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-3-finite-resolutions-and-the-resolution-theorem** (1 nodes): RS-18's supplier of the finite-resolution Euler class ('Euler class of a resolution ... independent of its length, zero padding, and choice of resolution'), built at the pin in the projective case as TauCeti.ExactStructure.eulerClassOf / TauCeti.moduleEulerClassOf with TauCeti.ExactStructure.eulerClassOf_eq and cited as baseline; Z.6 identifies it with the class of a perfect complex in π₀K.
- **AlgebraicModuliForArithmeticGeometry:R09.1** (1 nodes): R09.1: 'Construct projective bundles, Grassmannians and flag schemes with their quotient/subbundle universal properties, universal sheaves and base-change laws' — here only P¹_F = P(O^{⊕2}) = Proj F[T₀, T₁] over Spec F with its twisting sheaves O(m) and the standard affine cover, the convention SchemeKTheoryOperations S.5 uses.

## Structural proposals

- **The special-λ question: Serre's representation-ring route, with the classification step as the only gap** (decision).
- **The abstract λ-ring algebra moves from SchemeKTheoryOperations S.6 to KTheoryLowDegrees Z.3: node replacement list** (ownership).
- **What S.6, S.7 and the companion packet should cite in Z.3** (interface).
- **Ring-level determinant inputs for KTheoryLowDegrees Z.4** (interface).
- **Corrections to the checkpoint's Z.3 nodes** (correction).
- **Z.4 ids for the requests of ArithmeticKTheory N.1–N.3, ClassicalArithmeticCompletion CA.7 and SchemeKTheoryOperations S.3** (interface).
- **Localisations are S-integer rings: a Z.4 lemma that ArithmeticKTheory N.1 can cite** (interface).
- **The Dedekind ring structure is the Dedekind case of Z.3's rank ⊕ det** (ownership).
- **The nonprincipal-ideal test of Z.6 imports Z.4/nonprincipal-ideal-class** (interface).
- **The checkpoint's request to KTheoryLowDegrees:Z.2 is withdrawn for Z.4** (interface).
- **Split Z.5 into Z.5:vector-bundles (upstream of SchemeKTheoryOperations S.1, S.2, S.6, S.7) and Z.5:curves** (sub-layer).
- **EllipticKTheory E.2 and E.5 should cite the Z.5 and Z.6 node ids** (interface).

## Suggested Lean file

`research/blueprint/suggested/KTheoryLowDegrees--Z.3.lean` (5,311 lines) **compiles**: exit code 0 against Mathlib `082e2d3` and Tau Ceti `f790474`, with 507 warnings, all "declaration uses `sorry`". There is no `set_option`, no line over 100 characters, and no statement or carrier is `True`, `Unit`, `PUnit` or an opaque `sorry` type. It extends the checkpoint's file, keeping its carriers FP, K0 and cls in `TauCeti.RingK0`.

- **How it was compiled.** The imported Tau Ceti modules were compiled from the pinned sources with `lean -o` into a directory first on `LEAN_PATH`, beside a Lake project with Mathlib `082e2d3`.
- **Coverage.** Every node, API item and test name of the packet appears in the file.
  - 256 of the 260 API items and 152 of the 157 tests are declarations or `example`s.
  - 127 of the 136 theorem-type nodes are stated. The rest are comments naming their suppliers: the π₀K and D_perf comparisons, P¹, the elliptic curve, the real conic and the doubled line.
- **Real definitions.**
  - The pre-λ and special λ-ring classes, `lambdaTotal`, `gamma`, `adams`, the augmentation, the γ-filtration as an ideal, and the binomial and monoid λ-structures.
  - The componentwise determinant into `Additive (CommRing.Pic R)`, rank ⊕ det, `rankPicEquiv` and `rankClassGroupEquiv`, and the relative norm on Pic.
  - `VectorBundleK0` as `ExactK0` of the vector bundles with its pullback, product, rank and determinant; the point class.
- **Proved outright.** λ, γ and ψ values in ℤ, the ideal (2, 1 + √−5)² = (2), N(1 + √−5) = 6, P₁ = a₁b₁, and the (r, d) ↦ (r + d, −d) change of basis.
- **Packet corrections from the formalisation** (applied before this commit):
  - quotientSpecial for the special quotient instance;
  - λ⁰ = 1 and λ¹ = id as separate simp lemmas;
  - the binomial structure on H⁰(X, ℤ) as the node's own;
  - the augmentation of K₀ as a definition;
  - ψ⁰ as a definition;
  - a redundant hypothesis of the γ-filtration removed;
  - Pic X read as the units of Tau Ceti's LineBundleClass monoid;
  - G₀ through the induced exact structure on coherent sheaves;
  - the skyscraper as a cokernel;
  - S finite for the S-integers;
  - a new gap for locally constant tensor powers of line bundles.

## Sources

Read (versions and SHA-256 in the packet):

- The K-book, Chapter I: Projective Modules and Vector Bundles, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf).
- The K-book, Chapter II: The Grothendieck group K₀, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf).
- Advanced Topics in Computational Number Theory, Henri Cohen (https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf).
- The K-book: an introduction to algebraic K-theory, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- Algebraic K-theory of rings of integers, in Handbook of K-theory, Charles A. Weibel (https://www.maths.ed.ac.uk/~v1ranick/papers/handktheory.pdf).
- Errata et Addenda to the First Printing of Advanced Topics in Computational Number Theory, Henri Cohen (https://www.math.u-bordeaux.fr/~hecohen/errataadv1.dvi).
- Groupes de Grothendieck des schémas en groupes réductifs déployés, Jean-Pierre Serre (http://www.numdam.org/item/10.1007/BF02684589.pdf).
- Opérations en K-théorie algébrique, Christophe Soulé (https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427).
- Algebraic Number Theory, J. S. Milne (https://www.jmilne.org/math/CourseNotes/ANT.pdf).
- The K-book: an introduction to algebraic K-theory, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- The Stacks project, The Stacks project authors (https://stacks.math.columbia.edu).
- The resolution property for schemes and stacks, Burt Totaro (https://arxiv.org/pdf/math/0207210).

Not obtained: Chevalley's seminar (Serre's Lemma 5), SGA 6, and the Akin–Buchsbaum–Weyman papers on Schur functors.
