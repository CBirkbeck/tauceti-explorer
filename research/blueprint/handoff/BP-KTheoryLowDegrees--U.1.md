# Handoff: BP-KTheoryLowDegrees--U.1 (issue #764)

Part U.1 of *Explicit K₀: projectives, rank and determinant* (roadmap KTheoryLowDegrees), stages Z.1, Z.2 and U.1–U.6, by Claude Code, session cc-38267a. The companion part KTheoryLowDegrees--Z.3 (Z.3–Z.6) was already blueprinted. The coordinator wrote the briefs; three authoring agents wrote one stage group each (Z.1–Z.2, U.1–U.3, U.4–U.6); the coordinator merged the fragments, resolved their cross-references and checked the whole.

## Files

- `research/blueprint/packets/KTheoryLowDegrees--U.1.json` (status `partial`, part `U.1`)
- `research/blueprint/readmes/KTheoryLowDegrees--U.1.md`, generated from the packet so that the two agree
- `research/blueprint/suggested/KTheoryLowDegrees--U.1.lean`
- `research/blueprint/handoff/BP-KTheoryLowDegrees--U.1.md` (this note)

## What is closed

- **184 nodes:** 10 applications, 8 comparisons, 30 constructions, 16 definitions, 68 lemmas, 52 theorems.
  - By stage: Z.1 24, Z.2 24, U.1 25, U.2 18, U.3 27, U.4 30, U.5 22, U.6 14.
  - 379 API items and 200 unit tests, all with a §12 kind.
  - 44 planets, at most six per layer.
- **Baseline:** 380 declarations, each read at its file and line at the pins.
- **Coverage of the stage texts.** Every target of every stage text is realised by a node, imported through a request, or recorded as a gap. The coverage note of each stage maps its targets to its nodes. Z.2, U.1 and U.2 are source-decomposed.
- **Consumer requests.** Every request that other packets make of these stages is supplied:
  - ArithmeticKTheory N.1/N.2/N.5 (U.3, U.4, U.5);
  - K2SymbolsBrauer T.5/T.6 (U.4, U.5), K3BlochGroups V.1/V.2 (U.1, U.3), EllipticKTheory E.3/E.4 (U.3);
  - ClassicalArithmeticCompletion CA.7 (Z.1);
  - the Z.2 references of the companion packet, mapped to node ids in a restructure entry.
- **Checks.**
  - `check_blueprint.py --index`: 0 errors, 0 warnings; `tests/test_blueprints.py`, `test_check_blueprint.py`, `test_errata.py`, `test_source_issues.py`, `test_promote.py`: 49 passed.
  - Stage cycles: none on a freshly pulled main. The check covers atlas `requires` and `stageEdges` plus the node prerequisites of every packet and decomposition. With the open pull requests that change packets, the edges into K.5 and S.3 lie on the cycles through K.5's citation of the combined stage K.2 (see the correction section).
  - Every excerpt was checked against the source text layers or, for the numdam scans (Bass 1964, Dieudonné 1943, BMS 1967), against their OCR and rendered pages; none exceeds 300 characters.
  - The packet and the document contain no "sorry", Lean code or private paths.
- **Source issues:** 10 mistakes are recorded (ids E101–E110, numbered clear of the companion part's E1–E12), with corrections; the nodes use the corrected statements.
  - K-book Theorem III.2.5(2) is wrong as printed: the minimum runs over the primes above p (BMS (3.3), Corollary 4.3(c)), and the totally imaginary case needs the full ring of integers. SK₁(ℤ[i], 3ℤ[i]) = 0, not ℤ/4.
  - K-book Lemma II.2.1(2) needs "the map ℤ → K₀(R) is an isomorphism": M₂(F) has K₀ ≅ ℤ and a non-stably-free projective.
  - K-book III.1.2.4 attaches Dieudonné's exception (n = 2, D = 𝔽₂) to the wrong statement.
  - Misprints in the K-book (Ex. I.2.4(iii), II.2, III.1.3.3, III.1.8, V.6.9.1), Bass 1964 § 4 and BMS Theorem 3.5.

## Correction to the accepted RS-18

The first checkpoint did not follow two decisions of the accepted restructuring RS-18, which binds this job. This correction restores them:
- **The DVR boundary (RS-18 owner 13).** SchemeKTheoryOperations S.3 owns the localisation boundary and its unit-valuation normalisation. U.5 keeps its explicit cokernel-length boundary on the classical K₁, now the planet "Explicit valuation boundary". The new node U.5/dvr-boundary-localisation-comparison proves that this boundary equals S.3's composed with the loop map λ : K₁(L) → π₁K(L), which needs only the functoriality of BGL(−)⁺, not U.6. S.3 is imported through a request, and the restructure entry that gave the boundary to U.5 is withdrawn.
- **The relative fibre (RS-18 owner 35).** U.6/relative-K1-homotopy-comparison cites GeneralAlgebraicKTheory K.5's fibre again. The comparison stays a U.6 node realising U.5, because it needs U.6's π₁BGL(A)⁺ = K₁(A).
- **A pending cycle outside this packet.** Open blueprint pull requests make K.5 cite a node of the combined stage GeneralAlgebraicKTheory:K.2, which requires K.2:low-degree-comparisons, downstream of U.6. That would put K.5 and, through K.6, SchemeKTheoryOperations S.2 and S.3 downstream of U.6, against RS-18. The restructure entry asks K.5 to cite K.2:plus nodes instead. On main there is no cycle.

## Conventions fixed here

- K₀ is of left modules (Mathlib, Tau Ceti); the K₁ class of an automorphism is of right modules and column vectors (the K-book and Bass; modules over Aᵐᵒᵖ in Mathlib). The two agree for commutative rings. The row-vector convention would transpose matrices, which inverts Mennicke symbols and so changes SK₁ classes.
- S is a finite set of finite places, O_{F,S} is Mathlib's `Set.integer`, and the unit rank is r₁ + r₂ + |S| − 1.
- The degree-one DVR boundary is the cokernel length, with ∂(π) = [k].

## What remains, precisely

**Z.1** (partial):

- Check the categorical proof of Z.1/equivalence-preserves-finite-projective (compact elements of subobject lattices and projective objects) against a readable source, or read Bass, Algebraic K-theory, II.3, which the K-book cites for Theorem II.2.7(a) (gaps).
- Once GrothendieckEulerForms layer 4 exists, state and prove that Z.1/ring-k0-morita restricted to finite-dimensional algebras equals that layer’s Morita isomorphism on the common carrier (requests).

**Z.2** (source_decomposed):

- Nothing.

**U.1** (source_decomposed):

- Nothing.

**U.2** (source_decomposed):

- Nothing.

**U.3** (partial):

- Obtain the topological inputs of U.3/SK1-real-circle-nonzero (gap: E_n(R) is the identity component of SL_n(R) for a commutative Banach algebra R, and π₁(SO_2) ≅ ℤ → π₁(SO_n) ≅ ℤ/2 is onto for n ≥ 3), or an algebraic proof through Mennicke symbols (K-book Ex. III.1.10 gives only the statement SK₁ ≅ ℤ/2).

**U.4** (partial):

- Import the tame formula (A.16), the degree-m product formula (A.19) and the reciprocity law (A.21) once the CA.1 → K2SymbolsBrauer:T.7 cycle is removed (gap; restructure).
- Source and plan BMS (A.17)–(A.18) (Serre, Corps locaux XIV) for the totally imaginary case (gap).
- Receive the requested Tau Ceti inputs: ClassFieldTheory Layers 5, 12, 13; Chebotarev Layers 4, 10; GlobalNumberFields Layers 6, 7.

**U.5** (partial):

- Milnor patching and the K₀ Mayer–Vietoris sequence for U.5/ideal-sequence-degree-zero (gap; proposed for Z.1).
- The homotopy-fibre comparison (U.6/relative-K1-homotopy-comparison) awaits K2SymbolsBrauer T.1:plus and T.6, blocked by the T.1 → GeneralAlgebraicKTheory:K.2 dependency (gap; restructure).
- Receive SchemeKTheoryOperations S.3's DVR localisation boundary and its unit-valuation normalisation (request).

**U.6** (partial):

- Complete U.6/relative-K1-homotopy-comparison (gap: K-book Ex. IV.1.15 is a hint; needs K2SymbolsBrauer T.1:plus and T.6).
- StableHomotopyKTheory H.3/plus-construction-universal-property records an unread proof boundary (obstruction theory); the naturality statements of U.6 rest on it.

## Gaps

- **Source for Theorem II.2.7(a): Morita functors preserve finitely generated projectives.** Needed by `Z.1/equivalence-preserves-finite-projective`, `Z.1/ring-k0-morita`, `Z.1/ring-k0-matrix`, `Z.2/matrix-division-ring-k0`.
- **Topological inputs for SK₁ of the real circle ring.** Needed by `U.3/SK1-real-circle-nonzero`.
- **The tame formula, the degree-m Hilbert product formula and the power reciprocity law (BMS (A.16), (A.19)–(A.21)).** Needed by `U.4/power-reduction-non-totally-imaginary`, `U.4/power-reduction-totally-imaginary`.
- **Hilbert symbols on higher unit groups at primes above p (BMS (A.17)–(A.18)).** Needed by `U.4/power-reduction-totally-imaginary`.
- **Milnor patching and the K₀ Mayer–Vietoris sequence (K-book I.2.7, II.2.9).** Needed by `U.5/ideal-sequence-degree-zero`.
- **Comparison of classical relative K₁ with π₁ of the homotopy fibre (K-book IV.1.11, Ex. IV.1.15).** Needed by `U.6/relative-K1-homotopy-comparison`.

## Requests made

- **tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map** (1 nodes): Layer 4’s “Define K₀(proj A) and G₀(mod A) through Layers 2--3. Prove Morita and algebra-equivalence invariance.” for a finite-dimensional algebra A over a field, stated on the existing carrier ExactK0 (finiteProjectiveModulesExactStructure A) (Tau Ceti’s CartanMap.lean), so that KTheoryLowDegrees Z.1 can prove that its general-ring Morita isomorphism RingK0.moritaEquiv (Z.1/ring-k0-morita), trans…
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality** (2 nodes): For a local field k (finite over ℚ_p, and the archimedean fields through the archimedean package of Layers 10–11) containing μ_m: the degree-m local Hilbert symbol localSymbol at the named pairing kummerCupPairing ζ, with bilinearity, the Steinberg relation (a, 1 − a) = 1, antisymmetry, nondegeneracy on k^×/k^{×m} × k^×/k^{×m} (from tateDualityPairing_perfect_mixed), and the fact that k^{×m} is an…
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence** (1 nodes): The ray-class factorisation of the global Artin map for number fields, with its splitting law (the Artin symbol of an unramified prime 𝔭 ∤ 𝔪 is the image of the ray class of 𝔭) and surjectivity for admissible moduli — BMS (A.5) in ray-class form. Layer 12's text: 'The ray-class factorization of the global Artin map, rayClassArtinMap, takes the admissibility proof as an argument, and its splitting …
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields** (1 nodes): rayClassField 𝔪 and gal_rayClassField_equiv_rayClassGroup: the ray class field is abelian, unramified outside 𝔪, with Galois group the ray class group via the Artin map. Layer 13's text: 'define rayClassField 𝔪 as its class field' and 'The Galois/class-group isomorphisms (gal_rayClassField_equiv_rayClassGroup, …) are then the composite of galClassFieldEquiv, globalClassFieldGaloisEquiv and GlobalN…
- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev** (2 nodes): For a finite Galois (here abelian) extension L/K of number fields and σ ∈ Gal(L/K), infinitely many primes of K unramified in L with Frobenius σ — BMS (A.6). Layer 10's text: 'Derive, rather than reprove, the density of split-completely primes, the non-Galois statement via a Galois closure, infinitude of every Frobenius class, and the rational arithmetic-progression case.'
- **tauceti:TauCetiRoadmap/Chebotarev#layer-4-cyclotomic-galois-characters** (1 nodes): For K(ζ_m)/K and 𝔭 ∤ m, the arithmetic Frobenius sends ζ_m to ζ_m^{N𝔭}. Layer 4's text: 'Prove that for 𝔭 ∤ m the arithmetic Frobenius sends ζ_m to ζ_m ^ 𝔑𝔭'.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary** (2 nodes): Every open subgroup of IdeleClassGroup K contains RaySubgroup 𝔪 for some modulus 𝔪; rayClassQuotient : IdeleClassGroup K →* RayClassGroup 𝔪 is surjective with kernel RaySubgroup 𝔪; and the class of a prime idèle at 𝔭 ∤ 𝔪 maps to the ray class of 𝔭. Layer 7's text: 'Prove openness, antitonicity, and rayClassQuotient … with surjectivity and kernel RaySubgroup 𝔪 … Prove that every open subgroup of th…
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles** (2 nodes): The idèle norm on Mathlib's NumberField.IdeleClassGroup and the compactness of its norm-one subgroup IdeleClassGroup.normOne (the idèle group and idèle class group themselves are in Mathlib 082e2d3) — BMS (A.4) 'C⁰ is compact'. Layer 6's text: 'define the closed norm-one subgroup IdeleClassGroup.normOne. Prove its compactness'.
- **SchemeKTheoryOperations:S.3** (2 nodes): For a discrete valuation ring O with fraction field L and residue field k: the boundary ∂_S : K₁(L) → K₀(k) of the localisation sequence K(k) → K(O) → K(L), and its unit-valuation normalisation ∂_S(λ(u)) = v(u)·[k] for u ∈ L^×, with λ : L^× → π₁K(L) the loop of a 1 × 1 matrix. RS-18 gives this boundary to S.3 (owner 13: 'DVR unit boundary equals valuation with the uniformizer normalization'), and …

## Structural proposals

- **Z.1 owns ring-level scalar extension, complements and degree-zero Morita invariance** (ownership).
- **Extension of scalars along noncommutative ring homomorphisms is planned in Z.1** (ownership).
- **Resolution of the companion packet’s references to KTheoryLowDegrees:Z.2** (interface).
- **The rank is a ring homomorphism only once Z.3 has the ring structure** (ownership).
- **Finite-product formula and the finite-field case** (ownership).
- **E(A), elementary matrices over any ring and their commutator identities are U.1's; K2SymbolsBrauer T.1 should import them** (ownership).
- **Left or right modules for K₁ classes of automorphisms** (convention).
- **Break the stage cycle that blocks the power reciprocity law for U.4** (rescope).
- **ClassFieldTheory, Part II: explicit local symbols at p** (rescope).
- **Classical K₂ should not depend on the late K.2 layer** (rescope).
- **Ownership of the relative-K₁ comparison with the homotopy fibre** (rescope).
- **Presentation of the S-integers as a localisation belongs upstream of U.4** (rescope).
- **Milnor patching for Z.1** (rescope).

## Suggested Lean file

`research/blueprint/suggested/KTheoryLowDegrees--U.1.lean` (6811 lines) **compiles**: exit code 0 against Mathlib `082e2d3` and Tau Ceti `f790474`, with 628 warnings, all "declaration uses `sorry`". The same holds with `autoImplicit` off and Mathlib's standard linter set on. There is no `set_option`, and no statement or carrier is `True`, `Unit`, `PUnit` or an opaque `sorry` type.

- **How it was compiled.** Imported Tau Ceti modules were compiled from the pinned sources with `lean -o` into a directory first on `LEAN_PATH`, beside a Lake project with Mathlib `082e2d3`.
- **Coverage.**
  - 378 of the 379 API items are declarations under the packet names. `K1.module` is a comment: it needs the ring structure on K₀ from Z.3/finite-projective-monoidal.
  - All 200 tests are `example`s under `-- test <name> (<kind>)`. 53 of them close without `sorry`, a dozen as real computations over `ZMod 2`, `ZMod 3` and ℤ.
  - 133 of the 138 theorem-type nodes are theorems with docstrings naming the node. Five are comments, because they need BGL(A)⁺, K-theory spaces and homotopy fibres (supplied by StableHomotopyKTheory H.1–H.3, GeneralAlgebraicKTheory K.2:plus and K.5, and SchemeKTheoryOperations S.3): the four U.6 homotopy nodes and U.5/dvr-boundary-localisation-comparison.
- **Carriers are real definitions.**
  - GL(A) is Mathlib's `DirectLimit`; E_n(A) and E(A) are subgroup closures; K₁ is a quotient group; SK₁ is the kernel of the stable determinant.
  - Ring K₀ is `SplitK0` of `finiteProjectiveModules`, as in the Z.3 file; the rank lands in `LocallyConstant (PrimeSpectrum A) ℤ`.
  - The Mennicke group is a `PresentedGroup`, and GL(I), E(A, I) and K₁(A, I) are relative groups.
- **Packet corrections from the formalisation.** Eleven findings were applied to the packet before this commit:
  - two-sided ideals as `Ideal A` with `[I.IsTwoSided]`, since `TwoSidedIdeal` has no quotient ring;
  - the idèle class group cited from Mathlib, and the GlobalNumberFields request narrowed;
  - the namespace of 22 U.5/U.6 nodes moved to `TauCeti.KTheory`, beside the K₁ type;
  - one home for `HasStableRange`, and library fields for twelve U.4 nodes;
  - the Euclidean-generation theorem stated for a Prop-valued Euclidean division, so that it applies to ℤ[1/p];
  - three test renames;
  - the ring map to the completion named in U.4/K1-S-integers-residue-and-local;
  - commutative-base and multiplicative-notation fixes in the transfer API;
  - five namespaces that repeated the first component of their API names.

## Sources

Read (versions and SHA-256 in the packet):

- The K-book: An Introduction to Algebraic K-theory, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- Algebraic Number Theory, J. S. Milne (https://www.jmilne.org/math/CourseNotes/ANT.pdf).
- Ideal factorization, Keith Conrad (https://kconrad.math.uconn.edu/blurbs/gradnumthy/idealfactor.pdf).
- K-theory and stable algebra, Hyman Bass (http://www.numdam.org/item/10.1007/BF02684689.pdf).
- Les déterminants sur un corps non commutatif, Jean Dieudonné (https://www.numdam.org/item/10.24033/bsmf.1345.pdf).
- Solution of the congruence subgroup problem for SL_n (n ≥ 3) and Sp_2n (n ≥ 2), Hyman Bass, John Milnor, Jean-Pierre Serre (http://www.numdam.org/item/10.1007/BF02684586.pdf).

Not obtained, and cited only through the sources above (each such step is a gap):

- Bass, *Algebraic K-theory* (1968), II.3, for Morita preservation of projectives.
- Serre, *Corps locaux*, XIV, for the local symbols on higher unit groups (BMS (A.17)–(A.18)).

## For a continuation

- **Close the gaps** from those sources, and replace the Tau Ceti layer requests of U.4 by declarations once those layers are built.
- **Break the two blocking cycles** named in the restructure entries: ClassicalArithmeticCompletion CA.1's dependence on K2SymbolsBrauer T.7 (which blocks the reciprocity inputs of U.4), and K2SymbolsBrauer T.1's citation of the combined stage GeneralAlgebraicKTheory:K.2 (which blocks the relative homotopy comparison).
- **Ownership, via the restructure entries.** Z.1 owns ring-level scalar extension, complements and degree-zero Morita invariance; U.1/U.2 own E(A), the Steinberg commutator identities and K₁, which K2SymbolsBrauer T.1 should import; U.6 owns the relative-K₁ comparison with the homotopy fibre.
