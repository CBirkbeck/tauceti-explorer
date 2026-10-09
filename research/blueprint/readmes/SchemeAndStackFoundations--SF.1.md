# Scheme, stack, cohomology and intersection foundations — Layer SF.1: descent, algebraic spaces and algebraic stacks
This document specifies layer SF.1 of the roadmap `SchemeAndStackFoundations`: effective descent for explicitly listed classes of objects, the general theory of algebraic spaces and algebraic stacks, quotients by groups and groupoids with their stabilizers, the distinction between moduli functors, stacks, fine and coarse moduli spaces, and the algebraic inputs of Galois gerbs. It is the single owner of this general theory in the atlas: the moduli roadmaps (in particular `AlgebraicModuliForArithmeticGeometry` R09.3-R09.5) and the ordinary-stack part of `DiamondsAndVStacks` D0 build on it rather than constructing a second carrier.
## Scope and boundaries
- **Built here.** Fpqc descent of quasi-coherent modules and of affine morphisms over arbitrary bases (as stacks), descent of quasi-projective schemes along finite locally free coverings, gluing of sheaves, fppf descent of separated locally quasi-finite morphisms and of algebraic spaces; the category of algebraic spaces and everything in sub-layer SF.1b; group spaces, actions, groupoids, stabilizers, torsors, H^1, contracted products, twisting, categorical and geometric quotients, finite group quotients and Artin's bootstrap theorem; stacks in groupoids, stackification, 2-fibre products, representable morphisms, algebraic and Deligne-Mumford stacks, inertia, quotient and root stacks, quasi-coherent modules on stacks and properties of morphisms of stacks; moduli functors, fine and coarse moduli spaces, the Keel-Mori theorem and tame stacks; semilinear automorphisms, Galois descent of affine groups, conjugator schemes and crossed modules for Galois gerbs.
- **Imported from Tau Ceti roadmaps.** ModularCurves 0E (effective faithfully flat descent of affine schemes along one faithfully flat morphism, finite locally free schemes, closed subschemes, polarized relative curves, group objects, finite group actions and torsors); ModularCurves 0C (affine quotients by finite groups and the affine case of SGA 3 V 4.1); ModularCurves 9D (coarse schemes of its finite quotient problems); StableReduction Layer 2 (effective etale descent of compatibly polarized schemes). These are cited, compared with, and never reconstructed.
- **Imported from the libraries.** Mathlib's fpqc/fppf/etale topologies with subcanonicity, pseudofunctor descent (DescentData, IsPrestack, IsStack, coalgebra descent data), relative representability with the diagonal criterion, comonadicity of extension of scalars along faithfully flat maps, quasi-coherent sheaves of modules, group and module objects, categorical pullbacks, strong transformations, the Grothendieck construction, nonabelian Cech H^1, Krull topology and group extensions; Tau Ceti's fppf quotients of affine groups by normal subgroups, faithfully flat descent of Hopf-algebra points, line bundles and their classes, constant group schemes, linear reductivity over fields, the scalar Galois action on base changes and semilinear Galois descent of vector spaces.
- **Not in this layer.** Sheaf cohomology, site comparisons and etale cohomology of spaces and stacks (SF.2); Picard schemes (SF.3); formal geometry and deformation theory (SF.4); gerbes with bandings and their H^2 classification (AlgebraicModuliForArithmeticGeometry key/gerbes); perfect-site variants (the perfection owner of GeometricSatakeAndFusion GS0).
## Conventions
- Schemes are Mathlib's `Scheme.{u}` in a fixed universe; the big sites are Mathlib's `Scheme.fppfTopology`, `Scheme.fpqcTopology` and `Scheme.etaleTopology` on the whole category. Presheaves of sets are functors `Scheme.{u}ᵒᵖ ⥤ Type u`. Where the Stacks Project imposes a cardinal bound on its big site (for example the countability condition of Lemma 80.11.3), the universe takes its place and index types range over `Type u`.
- Algebraic spaces over a scheme S are algebraic spaces with a morphism to h_S; this is equivalent to the Stacks Project's definition on the site of S-schemes (SF.1/algebraic-space-category).
- Stacks follow Giraud and Mathlib: a stack is a pseudofunctor with IsStack; fibres need not be groupoids (QCoh is a stack), and stacks in groupoids are required where the Stacks Project requires them. Group actions are on the left. Torsors are fppf torsors unless stated otherwise.
- Representable means representable by schemes for morphisms of presheaves and representable by algebraic spaces for morphisms of stacks.
- A morphism of algebraic spaces or stacks is proper if it is separated, of finite type and universally closed, with universal closedness defined through the underlying topological spaces of SF.1/space-points.
## Sources
- **SP-DESC**: The Stacks Project Authors, *The Stacks Project, Chapter 35 (Descent) and Chapter 34 (Topologies on Schemes)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/0238>. Read: Sections 35.2 (023A), 35.5 (023R, Proposition 35.5.2 = 023T), 35.6 (0CDQ), 35.7 (Lemma 35.7.6 = 05B2), 35.13 (Lemma 35.13.7 = 023Q), 35.37 (0244, Lemma 35.37.1 = 0245), 35.39 (Lemma 35.39.1 = 02W5): statements and displayed proofs.
- **SP-MOD**: The Stacks Project Authors, *The Stacks Project, Chapter 17 (Sheaves of Modules) and Chapter 7 (Sites and Sheaves)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/01AC>. Read: Lemma 17.10.4 (01BG) with proof; Section 7.26 Glueing sheaves (04TP): Lemmas 7.26.1 (04TQ) and 7.26.4 (04TR) with proofs.
- **SP-MOR**: The Stacks Project Authors, *The Stacks Project, Chapter 37 (More on Morphisms)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/02GX>. Read: Section 37.57 Descending separated locally quasi-finite morphisms (02W7), Lemma 37.57.1 (02W8): statement and first part of the proof.
- **SP-GRPD**: The Stacks Project Authors, *The Stacks Project, Chapter 39 (Groupoid Schemes)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/022L>. Read: Definitions 39.3.1 (022P), 39.10.1 (022Z), 39.10.2 (07S1), 39.11.1 (0498), 39.11.3 (049A), 39.13.1 (0231), 39.17.2 (0236), 39.20.1 (02VG); Lemmas 39.20.3 (03C5), 39.20.6 (02VH), 39.24.1 (03JE), 39.25.3 (0CCJ); Proposition 39.23.9 (03BM): statements and displayed proofs.
- **SP-SPACES**: The Stacks Project Authors, *The Stacks Project, Chapters 65 (Algebraic Spaces), 66 (Properties of Algebraic Spaces) and 67 (Morphisms of Algebraic Spaces)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/025R>. Read: 65.6.1 (025Y), 65.7.1 (02X0), 65.7.3 (02X2), 65.9.1 (0262), 65.9.3 (0263), 65.10.4 (0265), 65.10.5 (02WW), 65.13.2 (02X5), Section 65.14 examples 65.14.1 (02Z1), 65.14.2 (03FN), 65.14.7-9 (02Z6, 02Z7, 02Z8); 66.3.1 (03BS), 66.3.2 (03DY), 66.3.3 (0AHR), 66.3.4 (0AHS), 66.4.1 (03BU), 66.4.7 (03BY), 66.4.8 (03BZ), 66.18.1 (03ED), 66.18.2 (03G0), 66.21.2 (03G7), 66.29.1 (03G9), Proposition 66.32.1 (03M3), Lemma 66.34.1 (071S); 67.4.2 (03HL), 67.9.2 (03HI), Lemma 67.22.1 (03MJ), Definition 67.22.2 (04RD), Definition 67.40.1 (03ZM), Section 67.3 (03HA).
- **SP-GRPSP**: The Stacks Project Authors, *The Stacks Project, Chapter 78 (Groupoids in Algebraic Spaces)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/0437>. Read: Definitions 78.5.1 (043H), 78.8.1 (043Q), 78.9.3 (04TY), 78.11.1 (043W), 78.16.2 (0448), 78.19.1 (044J), 78.20.1 (044Q); Lemmas 78.8.3 (06P9), 78.22.2 (04M9), 78.23.2 (044U), 78.26.1 (06PB): statements and displayed proofs.
- **SP-BOOT**: The Stacks Project Authors, *The Stacks Project, Chapter 80 (Bootstrap)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/046A>. Read: Theorem 80.10.1 (04S6); Lemmas 80.11.1 (04SK), 80.11.2 (04U0), 80.11.3 (0ADV), 80.11.4 (0AMP), 80.11.5 (04TB), 80.11.6 (06PG), 80.11.7 (06PH), 80.11.8 (04U1): statements and displayed proofs.
- **SP-STK**: The Stacks Project Authors, *The Stacks Project, Chapter 4 (Categories, Sections 4.31-4.41) and Chapter 8 (Stacks)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/0266>. Read: Definitions 8.4.1 (026F), 8.5.1 (02ZI); Lemmas 8.5.6 (02ZL), 8.6.3 (0432), 8.7.1 (036Y), 8.7.2 (04ZM), 8.9.1 (02ZP): statements and displayed proofs; table of contents of Chapter 4, Sections 4.31-4.42 (2-fibre products, inertia, fibred categories).
- **SP-ALGSTK**: The Stacks Project Authors, *The Stacks Project, Chapters 94 (Algebraic Stacks), 95 (Examples of Stacks), 96 (Sheaves on Algebraic Stacks), 97 (Criteria for Representability)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/026K>. Read: 94.9.1 (02ZW), 94.12.1 (026O), 94.12.2 (03YO), Proposition 94.13.3 (04SZ), Lemma 94.14.3 (04T2), Lemma 94.16.2 (04T5), Theorem 94.17.3 (04TK); 95.4.2 (03YM), 95.7.2 (04UA), 95.14.9 (04US), 95.14.10 (04UT), Proposition 95.15.3 (04WM), Lemma 95.15.2 (0370); 96.11.1 (06WG), Proposition 96.14.3 (06WT); Theorems 97.16.1 (06DC) and 97.17.2 (06FI).
- **SP-MORSTK**: The Stacks Project Authors, *The Stacks Project, Chapters 100 (Properties of Algebraic Stacks), 101 (Morphisms of Algebraic Stacks), 106 (More on Morphisms of Stacks)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/04XM>. Read: 100.4.2 (04XG), 100.4.8 (04Y8); 101.4.1 (04YW), Lemma 101.5.1 (050Q), 101.13.2 (0513), 101.16.2 (06FN), Lemma 101.19.1 (0DTS), Theorem 101.21.6 (06N3), 101.37.1 (0CL5); Section 106.12 Moduli spaces (0DUF): Definition 106.12.1, Lemmas 106.12.2-106.12.4 with proofs.
- **SP-QUOT**: The Stacks Project Authors, *The Stacks Project, Chapter 83 (Quotients of Groupoids)*, Online version, tag pages retrieved 2026-10-09. <https://stacks.math.columbia.edu/tag/048A>. Read: Definitions 83.3.1 (048E), 83.4.1 (048J), 83.10.1 (04AE); comment section of 048J (no comments).
- **POONEN**: Bjorn Poonen, *Rational points on varieties*, Unofficial version for incidental online use (348-page PDF), read 2026-10-09; published as AMS Graduate Studies in Mathematics 186 (2017). <https://math.mit.edu/~poonen/papers/Qpoints.pdf>. Read: Chapter 4: Sections 4.2 (Definition 4.2.1, Theorem 4.2.3), 4.3 (Theorem 4.3.5, Remark 4.3.6), 4.4 (Propositions 4.4.2 and 4.4.4, Corollary 4.4.6, Remarks 4.4.7-4.4.8), 4.5 (Definition 4.5.1, Theorem 4.5.2); Sections 5.11 and 5.12 (Definitions 5.12.1 and 5.12.3, Warning 5.12.6, Proposition 5.12.14, 5.12.5 contracted products); Section 6.5 (Definition 6.5.1, Propositions 6.5.3 and 6.5.9, Theorem 6.5.10, Remark 6.5.11, 6.5.6).
- **CADMAN**: Charles Cadman, *Using stacks to impose tangency conditions on curves*, arXiv:math/0312349v3 (5 July 2005); published Amer. J. Math. 129 (2007), 405-427. <https://arxiv.org/abs/math/0312349v3>. Read: Section 2.1 (Definition 2.1, Theorem 2.2 with proof, Definition 2.3); Section 2.2 (Proposition 2.4, the identification of [A^1/G_m] with pairs (L, s), Definition 2.5).
- **CONRAD-KM**: Brian Conrad, *The Keel-Mori theorem via stacks*, Preprint dated 27 November 2005 (12 pages), read 2026-10-09. <https://math.stanford.edu/~conrad/papers/coarsespace.pdf>. Read: Section 1 (definition of coarse moduli space, Theorem 1.1 and the remarks after it); Section 2 (Lemmas 2.1 and 2.2 with proofs, Remark 2.3).
- **AOV**: Dan Abramovich, Martin Olsson, Angelo Vistoli, *Tame stacks in positive characteristic*, arXiv:math/0703310v1 (11 March 2007); published Ann. Inst. Fourier 58 (2008), 1057-1091. <https://arxiv.org/abs/math/0703310v1>. Read: Section 3: Definition 3.1, Theorem 3.2, Corollaries 3.3-3.5 with proofs, Proposition 3.6 (statement and first steps).
- **KISIN17**: Mark Kisin, *Mod p points on Shimura varieties of abelian type*, Author 99-page PDF, read 2026-10-09; published J. Amer. Math. Soc. 30 (2017), 819-914. <https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf>. Read: Section 3.1.1 (definition of k'/k-Galois gerbs, morphisms, conjugacy, Isom(f1, f2), pro-gerbs, neutral gerbs), pp. 34-35; Lemma 3.1.2 with proof, pp. 35-36; Section 3.2.1 (crossed modules and the strictly monoidal category H/H~), pp. 39-40.

## Planets
The atlas shows four planets for this layer, in addition to the two of the whole-roadmap packet (Algebraic spaces, Galois gerbs): Fpqc descent of quasi-coherent sheaves; Algebraic stacks; Quotient stacks; Coarse moduli spaces.

## SF.1a. Descent
Descent is formulated throughout with Mathlib's Cat-valued pseudofunctors on LocallyDiscrete(Sch^op) and its predicates IsPrestack (morphisms glue) and IsStack (descent data are effective), relative to Mathlib's fpqc, fppf and etale topologies on the category of all schemes. The object classes with effective descent are pinned explicitly: quasi-coherent modules (fpqc), affine morphisms (fpqc; the single-morphism case is Tau Ceti ModularCurves 0E), quasi-projective schemes along finite locally free coverings, sheaves on any site, separated locally quasi-finite morphisms (fppf) and algebraic spaces (fppf). Effectivity for arbitrary schemes is false and is not claimed; polarized etale descent of projective families is the StableReduction Layer 2 owner and is only compared with here.

### The quasi-coherent pullback pseudofunctor (`SF.1/qcoh-pseudofunctor`, construction)
The pseudofunctor QCoh from LocallyDiscrete(Sch^op) to Cat sending a scheme X to the full subcategory QCoh(X) of X.Modules on the modules satisfying SheafOfModules.IsQuasicoherent, sending f : X -> Y to the restriction of the pullback functor f^* : Y.Modules -> X.Modules, and whose unit and composition isomorphisms are the restrictions of those of Mathlib's Scheme.Modules.pseudofunctor (left adjoint parts). Morphisms in QCoh(X) are all O_X-linear maps, so the fibres are not groupoids. The pushforward f_* is not part of this pseudofunctor.

**Hypotheses and conventions.** X, Y range over all schemes in the fixed universe (Mathlib Scheme.{u}); no finiteness or separation hypothesis. The pullback of a quasi-coherent module along any morphism of schemes is quasi-coherent (Stacks 01BG); this is the SF.0 quasi-coherent module interface.

**Construction or proof.**
1. Compose Mathlib's Scheme.Modules.pseudofunctor with the forgetful pseudofunctor from adjunctions to their left adjoints, giving X |-> X.Modules with f |-> f^*.
2. By Stacks Lemma 17.10.4 (01BG) f^* carries quasi-coherent modules to quasi-coherent modules, so f^* restricts to the full subcategories cut out by IsQuasicoherent.
3. Because the subcategories are full, the unit and composition isomorphisms and the three coherence equations restrict verbatim.
4. On affine schemes Spec R the fibre is identified with R-modules by the tilde construction (Mathlib isQuasicoherent_iff_isIso_fromTildeΓ).

**API.**
- `TauCeti.SchemeFoundations.Descent.qcohPseudofunctor_obj` (data): The fibre of QCoh at X is the full subcategory of X.Modules on quasi-coherent modules.
- `TauCeti.SchemeFoundations.Descent.qcohPseudofunctor_map` (functoriality): The functor attached to f : X -> Y is the restriction of Scheme.Modules.pullback f.
- `TauCeti.SchemeFoundations.Descent.qcohPseudofunctor_mapComp` (functoriality): The composition isomorphism (g o f)^* = f^* g^* is the restriction of Scheme.Modules.pullbackComp.
- `TauCeti.SchemeFoundations.Descent.qcohPseudofunctor_forget` (compatibility): The inclusion QCoh(X) -> X.Modules is a strong transformation from QCoh to the left-adjoint part of Scheme.Modules.pseudofunctor.
- `TauCeti.SchemeFoundations.Descent.qcohSpecEquiv` (equivalence): QCoh(Spec R) is equivalent to ModuleCat R, by global sections with quasi-inverse tilde.

**Unit tests.**
- `TauCeti.SchemeFoundations.Descent.QCoh.test_empty` (degenerate): Every quasi-coherent module on the empty scheme is a zero object; QCoh(empty) is equivalent to the terminal category.
- `TauCeti.SchemeFoundations.Descent.QCoh.test_spec` (compatibility): For a commutative ring R, global sections give an equivalence QCoh(Spec R) = ModuleCat R.
- `TauCeti.SchemeFoundations.Descent.QCoh.test_extension_by_zero` (non-example): On X = Spec Z with U = Spec Z[1/2], the extension by zero of O_U is a nonzero O_X-module with zero global sections, hence not quasi-coherent and not an object of QCoh(X).
- `TauCeti.SchemeFoundations.Descent.QCoh.test_pullback_rational` (computation): Pulling back the quasi-coherent module attached to Z/2Z along Spec Q -> Spec Z gives the zero module.

**Uses.** SF.1/qcoh-fpqc-descent: its IsStack property for the fpqc topology is the descent theorem. SF.1/affine-fpqc-descent: quasi-coherent algebras in this pseudofunctor give affine morphisms by relative Spec. SF.1/space-quasi-coherent and SF.1/stack-quasi-coherent: quasi-coherent modules on spaces and stacks are descent data for this pseudofunctor along atlases. AlgebraicModuliForArithmeticGeometry:R09.3 (quasicoherent-pseudofunctor node of the A0-extension packet): the same restriction is planned there; it becomes an import of this node. SchemeAndStackFoundations:SF.2: sheaf cohomology of quasi-coherent modules is computed on these fibres.

**Acceptance.** QCoh(Spec R) is equivalent to the category of R-modules via global sections and tilde. Pullback along an open immersion agrees with Mathlib's restriction functor restricted to quasi-coherent modules.

**Depends on.** libraries: `AlgebraicGeometry.Scheme.Modules.pseudofunctor` (Mathlib), `SheafOfModules.IsQuasicoherent` (Mathlib), `AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ` (Mathlib); layers: `SchemeAndStackFoundations:SF.0`.

**Source.** The Stacks Project — Lemma 17.10.4 (tag 01BG); The Stacks Project — Section 35.2 (tag 023A), Definition 35.2.3; The Stacks Project — Lemma 95.4.2 (tag 03YM).

### Fpqc descent for quasi-coherent sheaves (`SF.1/qcoh-fpqc-descent`, theorem)
The quasi-coherent pullback pseudofunctor QCoh is a stack for Mathlib's fpqc topology on Sch: QCoh.IsStack fpqcTopology. Equivalently, for every scheme S and every fpqc covering family {S_i -> S}, the functor from QCoh(S) to QCoh-descent data relative to the family is an equivalence of categories. Since the fppf, etale and Zariski topologies are coarser, QCoh is a stack for each of them. No finiteness, Noetherian or separation hypothesis is imposed, and all module maps (not only isomorphisms) descend.

**Hypotheses and conventions.** fpqc coverings are those of Mathlib's fpqcPrecoverage: quasi-compact, jointly surjective families of flat morphisms.

**Construction or proof.**
1. Prestack part: morphisms of quasi-coherent modules glue along fpqc coverings; by Mathlib IsStack.of_precoverage it suffices to check IsStackFor for the families in fpqcPrecoverage (which has isos and is stable under base change and composition).
2. Zariski reduction (Stacks 023T proof): quasi-coherent modules and their maps glue along open covers, so one may assume S affine; the fpqc condition then supplies a finite standard refinement by affines, i.e. a single faithfully flat ring map A -> B with B a finite product.
3. Affine case: identify QCoh(Spec A) with A-modules (tilde); descent data along Spec B -> Spec A in Mathlib's coalgebra form are coalgebras for the comonad of the extension-restriction adjunction (Mathlib DescentDataAsCoalgebra.coalgebraEquivalence), and extension of scalars along a faithfully flat map is comonadic (Mathlib comonadicExtendScalars). Hence toDescentDataAsCoalgebra is an equivalence by Mathlib isEquivalence_toDescentDataAsCoalgebra_iff_isEquivalence_comonadComparison.
4. Compare the coalgebra form with Mathlib's DescentData for a single morphism using the base-change isomorphisms B (x)_A B for quasi-coherent pullback (this comparison is the TODO recorded in DescentDataAsCoalgebra.lean and is part of this proof).
5. Effectivity and full faithfulness for the standard covering then give IsStackFor; glue over an affine open cover of S. This is Stacks Proposition 35.5.2 (023T) and Poonen Theorem 4.2.3.

**Uses.** AlgebraicModuliForArithmeticGeometry:R09.3 (fpqc-quasicoherent-descent node): the same theorem is planned there; it moves down to this node.

**Acceptance.** For a finite Galois extension k'/k, k'-vector spaces with a semilinear Gal(k'/k)-action descend to k-vector spaces (Stacks 0CDQ); with k' = Q(i), k = Q, the semilinear action by conjugation on Q(i) itself descends to Q. A quasi-coherent module whose pullback along an fpqc covering is finite locally free is finite locally free (Stacks 05B2). For the p-adic integers Z_p, the family {Spec Z_p -> Spec Z, Spec Z[1/p] -> Spec Z} is an fpqc covering that is not an fppf covering (Z_p is not of finite presentation over Z); quasi-coherent descent along it is effective.

**Depends on.** this layer: `qcoh-pseudofunctor`; libraries: `CategoryTheory.Pseudofunctor.IsStack` (Mathlib), `CategoryTheory.Pseudofunctor.IsStack.of_precoverage` (Mathlib), `CategoryTheory.Pseudofunctor.DescentData` (Mathlib), `CategoryTheory.Pseudofunctor.isEquivalence_toDescentData` (Mathlib), `CategoryTheory.Pseudofunctor.DescentDataAsCoalgebra.coalgebraEquivalence` (Mathlib), `CategoryTheory.Pseudofunctor.isEquivalence_toDescentDataAsCoalgebra_iff_isEquivalence_comonadComparison` (Mathlib), `comonadicExtendScalars` (Mathlib), `AlgebraicGeometry.Scheme.fpqcTopology` (Mathlib), `AlgebraicGeometry.Scheme.fpqcPrecoverage` (Mathlib), `AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ` (Mathlib).

**Source.** The Stacks Project — Proposition 35.5.2 (tag 023T) and its proof; Bjorn Poonen, Rational points on varieties — Theorem 4.2.3, p. 100; The Stacks Project — Lemma 35.7.6 (tag 05B2).

### Fpqc descent of affine morphisms (`SF.1/affine-fpqc-descent`, theorem)
The pseudofunctor Aff sending a scheme S to the category of affine S-schemes (morphisms X -> S with IsAffineHom, and S-morphisms) and f to base change is a stack for the fpqc topology: morphisms between affine S-schemes descend along fpqc coverings, and every descent datum of affine schemes relative to an fpqc covering {S_i -> S} is effective. For a single faithfully flat quasi-compact morphism S' -> S the effectivity statement is the import from Tau Ceti ModularCurves 0E; this node adds the covering-family stack form over arbitrary base schemes.

**Hypotheses and conventions.** Descent data are relative to fpqc coverings in Mathlib's fpqcPrecoverage. Affine means IsAffineHom over the base; X itself need not be an affine scheme.

**Construction or proof.**
1. Morphisms: Aff(S) is a full subcategory of Over S, and the fpqc topology is subcanonical (Mathlib instance), so morphisms of S-schemes glue along fpqc coverings; this is the prestack property.
2. Objects: relative Spec (SF.0 interface) identifies Aff(S) with the opposite of the category of quasi-coherent O_S-algebras, compatibly with pullback.
3. A quasi-coherent algebra is a quasi-coherent module with multiplication and unit maps; by SF.1/qcoh-fpqc-descent the module descends and, because module maps descend and pullback is monoidal, so do the multiplication and unit, with their axioms.
4. For a single faithfully flat morphism this is the effective descent of affine schemes in Tau Ceti ModularCurves 0E (imported, not reproved); Mathlib IsStack.of_precoverage passes from families in fpqcPrecoverage to the generated topology. Stacks Lemma 35.37.1 (0245); Poonen Theorem 4.3.5(ii) and Remark 4.3.6.

**Acceptance.** Torsors under a flat affine group scheme are representable by affine schemes (used in SF.1/torsor-representability). Descent data on non-affine schemes need not be effective: Poonen 4.3.1 records the counterexample of BLR 6.7, so the affine hypothesis cannot be dropped.

**Depends on.** this layer: `qcoh-fpqc-descent`; libraries: `AlgebraicGeometry.IsAffineHom` (Mathlib), `CategoryTheory.Pseudofunctor.IsStack.of_precoverage` (Mathlib), `AlgebraicGeometry.Scheme.fpqcTopology` (Mathlib); layers: `SchemeAndStackFoundations:SF.0`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Source.** The Stacks Project — Lemma 35.37.1 (tag 0245) with proof; Bjorn Poonen, Rational points on varieties — Theorem 4.3.5(i)-(ii) and Remark 4.3.6, p. 101.

### Descent of quasi-projective schemes along finite locally free coverings (`SF.1/galois-descent-quasi-projective`, theorem)
Let p : Y' -> Y be a surjective finite locally free morphism of schemes (for instance Spec k' -> Spec k for a finite Galois extension, or a finite etale Galois covering) and let V -> Y' be a morphism such that V -> Y' is quasi-projective, or V has an ample invertible sheaf, or an Y'-ample invertible sheaf. Then every descent datum on V relative to Y' -> Y is effective. For a finite Galois extension k'/k with group Gamma, giving a descent datum on a quasi-projective k'-scheme X' is the same as giving k'-isomorphisms f_sigma : sigma X' -> X' with f_(sigma tau) = f_sigma . sigma(f_tau), and such data descend to a k-scheme unique up to unique isomorphism. On polarized etale data the descended object agrees with the polarized etale descent of Tau Ceti StableReduction Layer 2.

**Hypotheses and conventions.** p surjective and finite locally free; V quasi-projective over Y' or carrying an ample (or Y'-ample) invertible sheaf. Descent datum in the sense of Stacks Section 35.34 (schemes over schemes) relative to the single covering {Y' -> Y}.

**Construction or proof.**
1. Stacks Lemma 39.25.2 reduces effectivity to: for every y in Y and points v_1,...,v_d of V over y, there is an affine open of V containing them and stable under the descent datum (Stacks Lemma 39.25.3, 0CCJ).
2. An ample invertible sheaf (or quasi-projectivity) gives an affine open containing any finite set of points (Stacks Properties 28.30.5); intersecting its translates under the finitely many sheets of the descent datum gives a stable affine open (Poonen Corollary 4.4.6, hypersurface avoiding an orbit).
3. Descend each stable affine open by SF.1/affine-fpqc-descent (Galois form: Poonen Propositions 4.4.2 and 4.4.4) and glue the descended affines along the descended open immersions, using that morphisms descend (fpqc subcanonical).
4. Compatibility: if V carries a polarization compatible with the descent datum and p is etale, the descended scheme with its descended polarization is the one supplied by Tau Ceti StableReduction Layer 2, by uniqueness of descent (full faithfulness).

**Uses.** FiniteFieldsAndCharacterSums:FF.2 and ShimuraData:D3 (requests to SF.1): effective Galois descent of quasi-projective (projective) schemes along finite separable extensions.

**Acceptance.** The k'-scheme P^1_C with the conjugation semilinear action twisted by z |-> -1/conj(z) descends to the conic x^2 + y^2 + z^2 = 0 over R, a nontrivial R-form of P^1 without real points (Poonen 4.5, twists). Twists of a quasi-projective k-variety X split by k' are classified by H^1(Gal(k'/k), Aut(X_k')) (Poonen Theorem 4.5.2), recovered in SF.1/twisting-bijection.

**Depends on.** this layer: `affine-fpqc-descent`; libraries: `AlgebraicGeometry.Scheme.fpqcTopology` (Mathlib); layers: `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Source.** The Stacks Project — Lemma 39.25.3 (tag 0CCJ) and Lemma 39.25.2; Bjorn Poonen, Rational points on varieties — Propositions 4.4.2 and 4.4.4, Corollary 4.4.6, Remark 4.4.7, pp. 102-105.

### Sheaves on a site form a stack (`SF.1/sheaf-stack`, theorem)
For a site (C, J) and a category A whose sheaf condition is detected by a limit-preserving conservative functor to sets (types, groups, rings, modules), the pseudofunctor X |-> Sheaf(J.over X, A) (Mathlib GrothendieckTopology.pseudofunctorOver) is a stack for J: morphisms of sheaves glue along coverings and gluing data of sheaves are effective. In particular fppf sheaves of sets (and of groups) on Sch/T form an fppf stack in T.

**Hypotheses and conventions.** J a Grothendieck topology on C; the restriction functors are those of Mathlib's J.overMapPullback.

**Construction or proof.**
1. Morphisms: given maps of sheaves on C/U_i agreeing on overlaps, there is a unique glued map (Stacks Lemma 7.26.1, 04TQ); this is IsPrestack.
2. Objects: given gluing data (F_i, phi_ij) satisfying the cocycle condition, define F on C/U by F(V -> U) = compatible families of sections of the F_i over V x_U U_i; it is a sheaf restricting to F_i (Stacks Lemma 7.26.4, 04TR).
3. For A with a conservative limit-preserving forgetful functor, apply the construction to underlying sets and transport the algebraic structure, since the gluing is a limit.
4. Mathlib DescentData is generated by covering sieves, so IsStack follows from the two gluing statements by IsStack.of_isStackFor.

**Acceptance.** Effective descent of sheaves of groups on slice sites with restriction coherence (the A0-extension request to SF.1). Algebraic spaces over T are a full sub-pseudofunctor of fppf sheaves of sets, so their morphisms descend (Stacks Lemma 95.7.2, 04UA).

**Depends on.** libraries: `CategoryTheory.GrothendieckTopology.pseudofunctorOver` (Mathlib), `CategoryTheory.Pseudofunctor.IsStack` (Mathlib), `CategoryTheory.Sheaf` (Mathlib), `CategoryTheory.Pseudofunctor.IsPrestack` (Mathlib).

**Source.** The Stacks Project — Lemmas 7.26.1 (04TQ) and 7.26.4 (04TR), with proofs; The Stacks Project — Lemma 95.7.2 (tag 04UA).

### Fppf descent of separated locally quasi-finite morphisms (`SF.1/quasi-finite-descent`, theorem)
Let {X_i -> S} be an fppf covering of schemes and (V_i/X_i, phi_ij) a descent datum of schemes relative to it. If each V_i -> X_i is separated and locally quasi-finite, the descent datum is effective. Equivalently (Stacks Lemma 35.39.1), an fppf sheaf F on Sch/S such that each F x h_{X_i} is representable by a scheme separated and locally quasi-finite over X_i is representable.

**Hypotheses and conventions.** {X_i -> S} an fppf covering; V_i -> X_i separated and locally quasi-finite.

**Construction or proof.**
1. Separatedness and local quasi-finiteness are stable under base change, so by Stacks Lemma 35.36.2 one reduces to a single flat surjective finitely presented map of affines X = Spec A -> S = Spec R.
2. Cover V by affines W^1 stable under the descent datum after shrinking: the descent datum moves an affine open to finitely many affine opens of V (finite fibres), and their intersection is quasi-affine over X by Zariski's Main Theorem (Mathlib exists_isIso_morphismRestrict_toNormalization: quasi-finite separated maps are open in a finite map).
3. Quasi-affine schemes descend (Poonen Theorem 4.3.5(ii)), using SF.1/affine-fpqc-descent for the ambient affine hull and descent of the open subscheme.
4. Glue the descended pieces along descended open immersions (morphisms descend; fppf is subcanonical). Stacks Lemma 37.57.1 (02W8).

**Acceptance.** An etale equivalence relation with U affine gives a separated locally quasi-finite j : R -> U x U, to which this descent applies in the proof of SF.1/etale-quotient-theorem.

**Depends on.** this layer: `affine-fpqc-descent`; libraries: `AlgebraicGeometry.LocallyQuasiFinite` (Mathlib), `AlgebraicGeometry.IsSeparated` (Mathlib), `AlgebraicGeometry.Scheme.Hom.exists_isIso_morphismRestrict_toNormalization` (Mathlib), `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib).

**Source.** The Stacks Project — Lemma 37.57.1 (tag 02W8); The Stacks Project — Lemma 35.39.1 (tag 02W5); Bjorn Poonen, Rational points on varieties — Theorem 4.3.5(ii), p. 101.

### Fppf descent of algebraic spaces (`SF.1/space-fppf-descent`, theorem)
The pseudofunctor sending a scheme T to the category AlgSp/T of algebraic spaces over T (with base change) is a stack for the fppf topology on Sch: morphisms of algebraic spaces glue along fppf coverings, and every descent datum of algebraic spaces relative to an fppf covering {T_i -> T} indexed by a type in the universe is effective.

**Hypotheses and conventions.** Fppf coverings in Mathlib's fppfPrecoverage; index types in the fixed universe.

**Construction or proof.**
1. AlgSp/T is a full sub-pseudofunctor of fppf sheaves of sets over T, so morphisms glue by SF.1/sheaf-stack (Stacks Lemma 95.7.2, 04UA).
2. A descent datum glues to an fppf sheaf F over T (SF.1/sheaf-stack) with each F x_T T_i an algebraic space.
3. The coproduct of the F x_T T_i is an algebraic space (coproduct of atlases is a scheme for a universe-indexed family) and maps to F representably, surjectively, flatly and locally of finite presentation, so F is an algebraic space by SF.1/artin-bootstrap (Stacks Lemma 80.11.1).
4. Stacks Lemma 80.11.3 (0ADV) imposes countability of the index set or finite type of the pieces only to control the size of its bounded big site; in the universe convention the coproduct step applies to every universe-indexed covering.

**Acceptance.** Descent of the algebraic spaces of torsors (SF.1/torsor-representability (c)). Stacks of algebraic spaces over T are prestacks by Stacks Lemma 95.7.2.

**Depends on.** this layer: `sheaf-stack`, `artin-bootstrap`, `algebraic-space-category`.

**Source.** The Stacks Project — Lemmas 80.11.1 (04SK) and 80.11.3 (0ADV); The Stacks Project — Lemma 95.7.2 (04UA).

## SF.1b. Algebraic spaces
The carrier is the algebraic-space predicate of the whole-roadmap SF.1 nodes (SchemeAndStackFoundations:SF.1/algebraic-space, built from SF.1/representable-diagonal and SF.1/etale-atlas): a presheaf of sets on Sch that is an fppf sheaf, has diagonal relatively representable along the Yoneda embedding (Mathlib relativelyRepresentable), and admits an etale surjective atlas from a scheme. No quasi-separatedness is imposed. This sub-layer turns the predicate into a usable theory: the category, quotients of etale equivalence relations and presentations, points, properties of morphisms, fibre products, the small etale ringed site and quasi-coherent modules, with two explicit non-scheme examples.

### The category of algebraic spaces (`SF.1/algebraic-space-category`, construction)
AlgSp is the full subcategory of presheaves of sets on Sch (Mathlib Scheme.{u}^op => Type u) on the objects satisfying the algebraic-space predicate of SF.1/algebraic-space (fppf sheaf, representable diagonal, etale surjective scheme atlas); morphisms are natural transformations. For a scheme S, the category of algebraic spaces over S is the over category AlgSp/h_S. The Yoneda functor induces a fully faithful functor h : Sch -> AlgSp (and Sch/S -> AlgSp/h_S). Under Mathlib's equivalence between presheaves over yoneda.obj S and presheaves on Over S, AlgSp/h_S corresponds exactly to the algebraic spaces over S of Stacks Definition 65.6.1 on the big fppf site of S-schemes (the induced fppf topology on Over S). Set-theoretic size is governed by the universe of Scheme.{u}, not by a bounded big site.

**Hypotheses and conventions.** Big fppf site: all schemes in Scheme.{u} with Mathlib's fppfTopology, which is subcanonical. No quasi-separatedness, separatedness or finiteness is imposed (SF.1/algebraic-space).

**Construction or proof.**
1. Define the object property 'is an algebraic space' on presheaves and take its full subcategory (Mathlib ObjectProperty.FullSubcategory).
2. Representable presheaves are algebraic spaces (SF.1/algebraic-space-of-scheme in the whole-roadmap packet), so yoneda lifts to h : Sch -> AlgSp; it is fully faithful because yoneda is.
3. Relative comparison: Mathlib overEquivPresheafCostructuredArrow identifies presheaves over h_S with presheaves on Over S; the fppf topology induced on Over S has as coverings the fppf coverings of the underlying schemes, so sheaf conditions, representability of diagonals (fibre products over h_S versus over the terminal presheaf differ by the monomorphism h_S x_{h_S} h_S) and etale atlases correspond. This is Stacks Section 65.16 (change of base scheme).
4. Coproducts indexed by a type in the universe exist: the coproduct of atlases is a scheme (Stacks 65.8.4 with the universe in place of the cardinal bound).

**API.**
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.toPresheaf` (projection): The inclusion functor AlgSp -> (Sch^op => Type u), fully faithful.
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.ofScheme` (constructor): The functor h : Sch -> AlgSp, X |-> yoneda.obj X.
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.ofScheme_fullyFaithful` (characterisation): h is fully faithful: Hom(h_X, h_Y) = Hom(X, Y).
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.overEquiv` (equivalence): AlgSp/h_S is equivalent to the category of algebraic spaces over S on the induced fppf site of Over S.
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.isTerminal_ofScheme_specZ` (example): h_{Spec Z} is a terminal object of AlgSp.
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.isInitial_ofScheme_empty` (example): h_{empty} is an initial object of AlgSp.

**Unit tests.**
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.test_galois_endomorphisms` (computation): In AlgSp/h_{Spec Q}, the object h_{Spec Q(i)} has exactly two endomorphisms, the identity and complex conjugation.
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.test_empty_initial` (degenerate): h of the empty scheme is initial in AlgSp.
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.test_yoneda` (compatibility): For schemes X, Y the map Hom_Sch(X, Y) -> Hom_AlgSp(h_X, h_Y) is a bijection.
- `TauCeti.SchemeFoundations.Spaces.AlgSpace.test_constant_not_space` (non-example): The constant presheaf with value a two-element set is not an algebraic space: on the empty scheme its value is not a singleton, so it is not an fppf sheaf.

**Uses.** all SF.1 algebraic-space nodes: the ambient category in which quotients, fibre products and properties live. AlgebraicModuliForArithmeticGeometry:R09.3 and R09.4 (A0-extension packet): their spaces, Weil restriction and moduli algebraicity statements take values in this category. NeronModelsAndSemistableAbelianVarietiesPartII:G.0 and ShimuraCompactifications:C0 (requests to SF.1): they request the genuine algebraic-space carrier with products over a scheme base. Stacks Section 65.16: algebraic spaces over S are algebraic spaces over Z with a map to S.

**Acceptance.** h is fully faithful and preserves fibre products (SF.1/space-fibre-products). For S = Spec Z the relative and absolute notions coincide.

**Depends on.** whole-roadmap SF.1 nodes: `algebraic-space`; libraries: `CategoryTheory.yoneda` (Mathlib), `CategoryTheory.ObjectProperty.FullSubcategory` (Mathlib), `CategoryTheory.overEquivPresheafCostructuredArrow` (Mathlib), `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib), `CategoryTheory.GrothendieckTopology.Subcanonical` (Mathlib), `CategoryTheory.Presheaf.IsSheaf` (Mathlib).

**Source.** The Stacks Project — Definition 65.6.1 (tag 025Y); The Stacks Project — Lemma 65.7.1 (tag 02X0).

### Etale equivalence relations (`SF.1/etale-equivalence-relation`, definition)
Let U be an algebraic space over a base S (in particular a scheme). A pre-relation on U is a morphism j = (t, s) : R -> U x_S U; it is an equivalence relation if j is a monomorphism and for every scheme T the image of R(T) in U(T) x U(T) is an equivalence relation. It is an etale (respectively fppf) equivalence relation if moreover s and t are etale (respectively flat and locally of finite presentation). Morphisms of pre-relations are pairs of morphisms commuting with j. The restriction of R to g : U' -> U is R' = R x_{U x U} (U' x U').

**Hypotheses and conventions.** U and R algebraic spaces (schemes in the scheme-level statements) over S; j a monomorphism for relations.

**Construction or proof.**
1. Reflexivity, symmetry and transitivity are expressed by the diagonal factoring through j, the swap of U x U preserving the image, and the composite relation factoring through j, all tested on T-points.
2. Etaleness of s and t is the scheme notion when R, U are schemes, and SF.1/etale-local-properties otherwise.
3. Restriction along etale g preserves etale equivalence relations (Stacks Lemma 65.10.1).

**API.**
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.refl` (relation): The diagonal U -> U x_S U factors through j.
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.symm` (relation): The swap of U x_S U carries the image of j to itself, giving an involution of R.
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.trans` (relation): The composite R x_{s,U,t} R -> U x U factors through j.
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.restrict` (functoriality): For an etale g : U' -> U the restriction R' is an etale equivalence relation on U'.
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.ofAtlas` (constructor): For an etale surjective U -> X with X an algebraic space, U x_X U ⇉ U is an etale equivalence relation.

**Unit tests.**
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_diagonal` (degenerate): For any scheme U the diagonal U -> U x_S U is an etale equivalence relation.
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_fold` (computation): For the fold map U ⊔ U -> U, the kernel pair is four copies of U and is an etale equivalence relation on U ⊔ U.
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_folded_line` (computation): For char k ≠ 2, R = Δ ⊔ Γ in A^1_k x A^1_k with Γ = {(x, -x) : x ≠ 0} is an etale equivalence relation.
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_full_relation_not_etale` (non-example): R = A^1_k x_k A^1_k with the two projections is an equivalence relation on A^1_k whose projections are smooth of relative dimension one, not etale.
- `TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_double_diagonal` (non-example): Two copies of the diagonal, Δ ⊔ Δ -> U x U, is not a monomorphism, hence not a relation.

**Uses.** SF.1/etale-quotient-theorem: its quotient sheaf is an algebraic space. SF.1/space-presentation: every algebraic space is the quotient of the kernel pair of an atlas. SF.1/artin-bootstrap: fppf equivalence relations have algebraic-space quotients. Stacks Examples 65.14.1 and 65.14.2: the standard non-scheme algebraic spaces are quotients of explicit etale equivalence relations.

**Acceptance.** The kernel pair U x_X U of an etale surjection from a scheme to an algebraic space is an etale equivalence relation (Stacks 0262).

**Depends on.** whole-roadmap SF.1 nodes: `algebraic-space`; libraries: `AlgebraicGeometry.Etale` (Mathlib).

**Source.** The Stacks Project — Definition 39.3.1 (tag 022P); The Stacks Project — Section 65.10 (tag 0264), Lemma 65.10.1 and Theorem 65.10.5 (02WW).

### The fppf quotient sheaf of a pre-relation (`SF.1/quotient-sheaf`, construction)
For a pre-relation j : R -> U x_S U of algebraic spaces (in particular a groupoid or a group action), the quotient sheaf U/R is the fppf sheafification of the presheaf T |-> U(T)/~ where ~ is the equivalence relation on U(T) generated by the image of R(T). It comes with the projection pi : U -> U/R. For an action of a group space G on X, X/G denotes the quotient by the action pre-relation G x X -> X x X.

**Hypotheses and conventions.** Sheafification is Mathlib's sheafification for the fppf topology on Sch (or on Over S).

**Construction or proof.**
1. Form the presheaf quotient objectwise (a coequalizer of presheaves of sets) and sheafify with Mathlib presheafToSheaf.
2. The universal property of sheafification gives: maps U/R -> F to an fppf sheaf F correspond to R-invariant maps U -> F.
3. If j is an equivalence relation, the induced map R -> U x_{U/R} U is an isomorphism (Stacks Lemma 78.19.5 for groupoids in spaces), and restriction along a covering U' -> U does not change the quotient (Stacks Lemma 39.20.6, 02VH).
4. Representability test: if U -> M equalizes s, t, induces a surjection of sheaves h_U -> h_M and R -> U x_M U is a surjection of sheaves, then M represents U/R (Stacks Lemma 39.20.3, 03C5).

**API.**
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.π` (projection): The projection U -> U/R, an epimorphism of fppf sheaves.
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.desc` (universal-property): An R-invariant map U -> F to an fppf sheaf factors uniquely through U/R.
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.kernelPair` (characterisation): If j is an equivalence relation then R -> U x_{U/R} U is an isomorphism.
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.restrict` (compatibility): For an fppf covering U' -> U the induced map U'/R' -> U/R is an isomorphism.
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.represented_of` (characterisation): Representability criterion of Stacks Lemma 39.20.3 for a scheme M receiving an invariant map from U.

**Unit tests.**
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_diagonal` (degenerate): For the diagonal relation, U/Δ_U is isomorphic to U.
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_swap` (computation): For the swap action of Z/2 on Spec k ⊔ Spec k, the quotient sheaf is Spec k.
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_sheafification_needed` (non-example): For Gal(C/R) acting on Spec C over Spec R, the presheaf quotient has no Spec R-point while the quotient sheaf is Spec R, which has one; omitting sheafification gives the wrong object.
- `TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_hopf_compat` (compatibility): For an affine group G over a ring R and a normal closed subgroup V(I), the quotient sheaf of G by V(I) restricted to affine R-schemes is Tau Ceti's CommHopfAlgCat.fppfQuotientSheaf.

**Uses.** SF.1/etale-quotient-theorem and SF.1/artin-bootstrap: the quotient sheaf is the object shown to be an algebraic space. SF.1/contracted-product: P x^G X is the quotient sheaf of P x X by the antidiagonal action. SF.1/categorical-geometric-quotient: a categorical quotient in algebraic spaces receives a map from U/R. Tau Ceti CommHopfAlgCat.fppfQuotientSheaf: the affine group quotient G/V(I) is a special case of this construction over a ring.

**Acceptance.** U/Δ_U = U, using that the fppf topology is subcanonical.

**Depends on.** this layer: `etale-equivalence-relation`; libraries: `CategoryTheory.presheafToSheaf` (Mathlib), `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib), `CategoryTheory.GrothendieckTopology.Subcanonical` (Mathlib), `CategoryTheory.Presheaf.IsSheaf` (Mathlib), `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` (Tau Ceti).

**Source.** The Stacks Project — Definition 39.20.1 (tag 02VG), Lemmas 39.20.3 (03C5) and 39.20.6 (02VH); The Stacks Project — Definition 78.19.1 (tag 044J).

### Quotients of schemes by etale equivalence relations (`SF.1/etale-quotient-theorem`, theorem)
Let U be a scheme over S and j = (t, s) : R -> U x_S U an etale equivalence relation of schemes. Then the quotient sheaf U/R is an algebraic space, and U -> U/R is etale and surjective with R = U x_{U/R} U; that is, (U, R, U -> U/R) is a presentation of U/R.

**Hypotheses and conventions.** R and U schemes over S; j a monomorphism; s, t etale.

**Construction or proof.**
1. By Stacks Lemma 65.10.3 it suffices to prove that U/R is an algebraic space; then U -> U/R is automatically etale and surjective.
2. Replace U by a disjoint union of affine opens U_i covering U (SF.1/quotient-sheaf restrict: U'/R' = U/R for an etale covering); the restriction R_i of R to U_i is an etale equivalence relation.
3. Each F_i = U_i/R_i -> F = U/R is representable by open immersions (Stacks Lemma 65.10.2).
4. Affine case (Stacks Lemma 65.10.4, 0265): j is a separated, locally quasi-finite monomorphism; for a scheme T -> F x F the fibre product with the diagonal is computed by fppf descent of separated locally quasi-finite morphisms (SF.1/quasi-finite-descent), so the diagonal is representable, and U -> F is the etale atlas.
5. Glue the F_i along the open subspaces F_i x_F F_j (Stacks 65.8.4 for the disjoint union, 65.8 glueing). Theorem 65.10.5 (02WW).

**Acceptance.** Stacks Example 65.14.1: the folded line is such a quotient (SF.1/folded-line-space). If R = Δ_U then U/R = U.

**Depends on.** this layer: `etale-equivalence-relation`, `quotient-sheaf`, `quasi-finite-descent`; whole-roadmap SF.1 nodes: `algebraic-space`, `etale-atlas`; libraries: `CategoryTheory.Functor.relativelyRepresentable.of_diag` (Mathlib), `AlgebraicGeometry.Scheme.LocalRepresentability.isRepresentable` (Mathlib).

**Source.** The Stacks Project — Theorem 65.10.5 (tag 02WW) with proof; Lemma 65.10.4 (tag 0265).

### Presentations of algebraic spaces (`SF.1/space-presentation`, theorem)
Let X be an algebraic space over S and U -> X an etale surjective morphism from a scheme. Then R = U x_X U is a scheme, R ⇉ U is an etale equivalence relation, and the induced map U/R -> X is an isomorphism, so U -> X is the coequalizer of R ⇉ U in fppf sheaves. Combined with SF.1/etale-quotient-theorem: algebraic spaces over S are exactly the quotient sheaves of etale equivalence relations of S-schemes, and two presentations (U, R) and (U', R') of the same space are related by the common refinement U x_X U'.

**Hypotheses and conventions.** U -> X etale and surjective in the sense of SF.1/etale-atlas.

**Construction or proof.**
1. U -> X is representable (Mathlib relativelyRepresentable.of_diag from the representable diagonal of X), so R = U x_X U is a scheme.
2. R(T) = {(a, b) in U(T)^2 : a, b agree in X(T)} is an equivalence relation, and s, t are base changes of U -> X, hence etale.
3. U -> X is an epimorphism of fppf sheaves (etale surjective representable maps are locally surjective), so X is the sheaf coequalizer of R ⇉ U (Stacks Lemma 65.9.1, 0262).
4. For two atlases U, U', the scheme U x_X U' is etale surjective over both, giving refinements of the two presentations.

**Acceptance.** The presentation of a scheme X by an open cover U = ⊔ U_i gives R = ⊔ U_i ∩ U_j and recovers X (Zariski gluing).

**Depends on.** this layer: `etale-equivalence-relation`, `quotient-sheaf`; whole-roadmap SF.1 nodes: `algebraic-space`, `etale-atlas`; libraries: `CategoryTheory.Functor.relativelyRepresentable.of_diag` (Mathlib).

**Source.** The Stacks Project — Lemma 65.9.1 (tag 0262) and Definition 65.9.3 (tag 0263).

### The topological space of an algebraic space or stack (`SF.1/space-points`, construction)
For an algebraic space X (or an algebraic stack), the set |X| of points is the set of equivalence classes of morphisms Spec K -> X from spectra of fields, where two such are equivalent if they agree after passing to a common field extension. It carries the quotient topology from |U| for any etale (for stacks: smooth) surjective U -> X from a scheme; this topology does not depend on U. A morphism f induces a continuous map |f|.

**Hypotheses and conventions.** X an algebraic space (Stacks 66.4) or algebraic stack (Stacks 100.4).

**Construction or proof.**
1. Define the equivalence relation on field-valued points and check it is an equivalence relation using fibre products of field spectra (Stacks Definition 66.4.1).
2. For a presentation (U, R), the map |U| -> |X| is surjective and identifies |X| with the set quotient |U|/|R| (Stacks Lemmas 66.4.3-66.4.6); give |X| the quotient topology.
3. Independence of the presentation: two presentations have a common refinement (SF.1/space-presentation), and |U'| -> |U| is open and surjective for etale surjective maps.
4. Open subspaces of X correspond bijectively to open subsets of |X| (Stacks Lemma 66.4.8, 03BZ); stacks are treated identically with smooth atlases (Stacks 100.4.2, 100.4.8).

**API.**
- `TauCeti.SchemeFoundations.Spaces.points` (data): The topological space |X| of an algebraic space.
- `TauCeti.SchemeFoundations.Spaces.points_map` (functoriality): A morphism f : X -> Y induces a continuous map |f| : |X| -> |Y|, functorially.
- `TauCeti.SchemeFoundations.Spaces.points_ofScheme` (compatibility): For a scheme X, |h_X| is homeomorphic to the underlying space of X.
- `TauCeti.SchemeFoundations.Spaces.points_atlas_surjective` (characterisation): For an etale surjective U -> X, |U| -> |X| is continuous, open and surjective.
- `TauCeti.SchemeFoundations.Spaces.opensEquiv` (equivalence): Open subspaces of X correspond bijectively to open subsets of |X|.

**Unit tests.**
- `TauCeti.SchemeFoundations.Spaces.points.test_field` (degenerate): |h_{Spec k}| is a single point for any field k.
- `TauCeti.SchemeFoundations.Spaces.points.test_galois` (computation): Over Spec R, |h_{Spec C}| is a single point although Spec C has two R-automorphisms.
- `TauCeti.SchemeFoundations.Spaces.points.test_folded_line` (computation): For the folded line X = A^1_k/(Δ ⊔ Γ) (char k ≠ 2), the closed points of |X| over an algebraically closed k are the origin and the pairs {x, -x} with x ≠ 0.
- `TauCeti.SchemeFoundations.Spaces.points.test_no_residue_field` (non-example): For char k = 0, the generic point of X = A^1_k/Z (translation action) is represented by Spec k(x) -> X but by no monomorphism Spec L -> X (Stacks Example 65.14.8), unlike points of schemes.

**Uses.** SF.1/separation-properness-spaces and SF.1/stack-morphism-properties: universally closed morphisms are defined through closedness of |Z x_Y X| -> |Z|. SF.1/coarse-moduli-space and SF.1/keel-mori: coarse moduli maps are homeomorphisms on underlying spaces. Stacks Definition 67.5.2: surjective morphisms of algebraic spaces are those with |f| surjective.

**Acceptance.** For X a scheme, |h_X| is homeomorphic to the underlying topological space of X.

**Depends on.** this layer: `space-presentation`; whole-roadmap SF.1 nodes: `algebraic-space`.

**Source.** The Stacks Project — Definitions 66.4.1 (03BU) and 66.4.7 (03BY), Lemma 66.4.8 (03BZ); The Stacks Project — Definitions 100.4.2 (04XG) and 100.4.8 (04Y8).

### Properties of morphisms of algebraic spaces defined etale locally (`SF.1/etale-local-properties`, definition)
Let P be a property of morphisms of schemes that is etale local on the source-and-target (local at the source and at the target for Mathlib's etale precoverage and stable under precomposition with etale morphisms; Stacks Definition 35.32.1). A morphism f : X -> Y of algebraic spaces has P if for some commutative square with U -> X and V -> Y etale, U, V schemes and U -> X surjective, the morphism U -> V has P; equivalently for every such square. If P is moreover stable under base change and fppf local on the target, a representable morphism of algebraic spaces has P in this sense iff it has P.presheaf (Mathlib MorphismProperty.presheaf). Examples: etale, smooth, flat, locally of finite presentation, locally of finite type, locally quasi-finite, unramified.

**Hypotheses and conventions.** P etale local on the source-and-target; squares with etale vertical maps from schemes and U -> X surjective.

**Construction or proof.**
1. Independence of the square (Stacks Lemma 67.22.1, 03MJ): given two squares, refine both by U'' = U x_X U' and V'' = V x_Y V' (schemes, by representability of maps from schemes), and use locality of P on source and target.
2. For morphisms of schemes, the square with identity vertical maps shows agreement with the scheme notion.
3. For representable f and P stable under base change and fppf local on the target, compare both definitions after base change to an etale atlas of Y (Stacks Lemma 67.22.1, last clause; Section 67.3).
4. Stability under composition and base change follows from the corresponding properties of P on schemes.

**API.**
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.iff_forall_square` (characterisation): f has P iff for every etale square with surjective source chart the chart map has P.
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.ofScheme_iff` (compatibility): For schemes X, Y and f : X -> Y, h_f has P iff f has P.
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.iff_presheaf` (compatibility): For P stable under base change and fppf local on the target and f representable, f has P iff P.presheaf f.
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.comp` (structure): P is stable under composition of morphisms of spaces when it is so for schemes.
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.baseChange` (structure): P is stable under base change of morphisms of spaces when it is so for schemes.

**Unit tests.**
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_identity` (degenerate): The identity of any algebraic space is etale.
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_scheme` (compatibility): A morphism of schemes is smooth as a morphism of algebraic spaces iff it is smooth in Mathlib's sense.
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_atlas` (characterisation): For an etale equivalence relation R on U, the projection U -> U/R is etale.
- `TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_closed_immersion_not_local` (non-example): Closed immersion is not etale local on the source: for the identity of A^1, the square with chart A^1 ⊔ A^1 -> A^1 (fold) has non-closed-immersion top arrow while the identity square has a closed immersion, so the square-independence fails for this property.

**Uses.** SF.1/etale-quotient-theorem: the atlas U -> U/R is etale in this sense. SF.1/stack-morphism-properties: smooth-local properties of morphisms of stacks reduce to this notion for algebraic spaces. SF.1/torsor: flatness and finite presentation of group spaces and torsors. Stacks Section 67.22: uniform definition of etale, smooth, flat and locally finitely presented morphisms of spaces.

**Acceptance.** Etale, smooth and flat morphisms of algebraic spaces are defined this way; surjectivity is not (it uses SF.1/space-points).

**Depends on.** this layer: `space-presentation`; whole-roadmap SF.1 nodes: `etale-atlas`; libraries: `CategoryTheory.MorphismProperty.IsLocalAtSource` (Mathlib), `CategoryTheory.MorphismProperty.IsLocalAtTarget` (Mathlib), `AlgebraicGeometry.Scheme.etalePrecoverage` (Mathlib), `CategoryTheory.MorphismProperty.presheaf` (Mathlib), `AlgebraicGeometry.Flat` (Mathlib), `AlgebraicGeometry.LocallyOfFinitePresentation` (Mathlib), `AlgebraicGeometry.LocallyOfFiniteType` (Mathlib), `AlgebraicGeometry.Smooth` (Mathlib).

**Source.** The Stacks Project — Lemma 67.22.1 (03MJ) and Definition 67.22.2 (04RD); The Stacks Project — Section 35.32 (tag 04QW).

### Separated, quasi-separated and proper morphisms of algebraic spaces (`SF.1/separation-properness-spaces`, definition)
For a morphism f : X -> Y of algebraic spaces, the diagonal Δ_f : X -> X x_Y X is representable by schemes. Then f is separated, locally separated or quasi-separated if Δ_f is a closed immersion, an immersion, or quasi-compact (as a representable morphism, Mathlib relative). f is quasi-compact if |X x_Y V| is quasi-compact for every affine V -> Y; of finite type if locally of finite type and quasi-compact; universally closed if |Z x_Y X| -> |Z| is closed for every morphism Z -> Y of algebraic spaces; proper if separated, of finite type and universally closed. Absolute notions for X are those of X -> Spec Z.

**Hypotheses and conventions.** X, Y algebraic spaces; |.| from SF.1/space-points; locally of finite type from SF.1/etale-local-properties.

**Construction or proof.**
1. The diagonal of f is representable since X has representable diagonal and X x_Y X -> X x X is a monomorphism (Stacks 67.4.1).
2. Closed immersions, immersions and quasi-compactness are stable under base change and fppf local on the target, so they make sense for the representable Δ_f (Mathlib MorphismProperty.relative).
3. Universal closedness is defined through underlying spaces (Stacks Definition 67.9.2), properness by Stacks Definition 67.40.1.
4. For morphisms of schemes all notions agree with Mathlib's IsSeparated, QuasiSeparated, UniversallyClosed and IsProper.

**API.**
- `TauCeti.SchemeFoundations.Spaces.diagonal_representable` (characterisation): The diagonal of a morphism of algebraic spaces is representable by schemes.
- `TauCeti.SchemeFoundations.Spaces.IsSeparated.ofScheme_iff` (compatibility): For schemes, separatedness of h_f agrees with Mathlib IsSeparated f; likewise quasi-separated, universally closed and proper.
- `TauCeti.SchemeFoundations.Spaces.QuasiSeparated.iff_affine_charts` (characterisation): X is quasi-separated iff U x_X V is quasi-compact for all affine schemes U, V mapping to X.
- `TauCeti.SchemeFoundations.Spaces.IsSeparated.iff_affine_charts` (characterisation): X is separated iff U x_X V is affine with O(U) (x) O(V) -> O(U x_X V) surjective for affine U, V over X.
- `TauCeti.SchemeFoundations.Spaces.IsProper.baseChange` (structure): Proper morphisms of algebraic spaces are stable under base change and composition.

**Unit tests.**
- `TauCeti.SchemeFoundations.Spaces.Separated.test_doubled_origin` (compatibility): The affine line with doubled origin is a scheme whose h is a non-separated (but quasi-separated) algebraic space.
- `TauCeti.SchemeFoundations.Spaces.Separated.test_folded_line` (computation): The folded line is quasi-separated and not locally separated.
- `TauCeti.SchemeFoundations.Spaces.Separated.test_translation_quotient` (non-example): In characteristic zero A^1_k/Z is not quasi-separated: A^1 x_X A^1 is a disjoint union of copies of A^1 indexed by Z, which is not quasi-compact.
- `TauCeti.SchemeFoundations.Spaces.Proper.test_affine_line` (non-example): A^1_k -> Spec k is separated and of finite type but not proper (not universally closed), while P^1_k -> Spec k is proper.

**Uses.** SF.1/stack-morphism-properties: separated and proper morphisms of stacks use proper diagonals and these notions for representable morphisms. SF.1/keel-mori: the coarse space is separated when the stack is. ShimuraCompactifications:C0 (request to SF.1): separated/proper algebraic-space criteria. Stacks Section 67.40: proper morphisms of algebraic spaces.

**Acceptance.** The folded line is quasi-separated and not locally separated; A^1/Z in characteristic zero is not quasi-separated (SF.1/translation-quotient-space).

**Depends on.** this layer: `space-points`, `etale-local-properties`; whole-roadmap SF.1 nodes: `representable-diagonal`; libraries: `CategoryTheory.MorphismProperty.relative` (Mathlib), `AlgebraicGeometry.IsClosedImmersion` (Mathlib), `AlgebraicGeometry.IsImmersion` (Mathlib), `AlgebraicGeometry.QuasiCompact` (Mathlib), `AlgebraicGeometry.IsSeparated` (Mathlib), `AlgebraicGeometry.QuasiSeparated` (Mathlib), `AlgebraicGeometry.UniversallyClosed` (Mathlib), `AlgebraicGeometry.IsProper` (Mathlib), `AlgebraicGeometry.LocallyOfFiniteType` (Mathlib).

**Source.** The Stacks Project — Definitions 67.4.2 (03HL), 67.9.2 (03HI), 67.40.1 (03ZM); Definition 65.13.2 (02X5); Lemmas 66.3.3 (0AHR) and 66.3.4 (0AHS).

### Fibre products of algebraic spaces and chart products (`SF.1/space-fibre-products`, theorem)
The category of algebraic spaces has fibre products, computed as fibre products of the underlying fppf sheaves, and h : Sch -> AlgSp preserves fibre products. Every morphism from a scheme to an algebraic space is representable by schemes; in particular for scheme charts U -> X and V -> X of an algebraic space, U x_X V is a scheme (chart fibre product).

**Hypotheses and conventions.** X, Y, Z algebraic spaces over S.

**Construction or proof.**
1. Fibre products of sheaves are sheaves; the diagonal of F x_H G is a base change of the product of the diagonals (Stacks Lemma 65.7.2), hence representable.
2. If U -> F and V -> G are etale atlases, U x_H V maps etale surjectively onto F x_H G (Stacks 65.5.7), so F x_H G is an algebraic space (Stacks Lemma 65.7.3, 02X2).
3. Maps from schemes are representable by Mathlib relativelyRepresentable.of_diag applied to the representable diagonal (whole-roadmap lemma SF.1/representable-diagonal-from-scheme).
4. h preserves fibre products because yoneda preserves limits and fibre products of schemes exist.

**Acceptance.** h_{X x_Z Y} = h_X x_{h_Z} h_Y for schemes. Products F x G over S are algebraic spaces (Stacks 02X0).

**Depends on.** this layer: `algebraic-space-category`; whole-roadmap SF.1 nodes: `algebraic-space`, `representable-diagonal-from-scheme`; libraries: `CategoryTheory.Functor.relativelyRepresentable.of_diag` (Mathlib), `CategoryTheory.Functor.relativelyRepresentable` (Mathlib).

**Source.** The Stacks Project — Lemmas 65.7.1 (02X0) and 65.7.3 (02X2).

### The small etale ringed site of an algebraic space (`SF.1/small-etale-site`, construction)
For an algebraic space X, the small etale site X_et has objects the etale morphisms U -> X from schemes, morphisms the X-morphisms, and coverings the families {U_i -> U} that are etale coverings of schemes. Its structure sheaf O_X sends U -> X to Γ(U, O_U). The site X_spaces,et of algebraic spaces etale over X defines the same topos. A morphism f : X -> Y induces a morphism of ringed topoi. For an etale atlas U -> X, (X_et)/U is equivalent to U_et. For X a scheme, X_et is Mathlib's X.Etale with smallEtaleTopology.

**Hypotheses and conventions.** X an algebraic space; etale morphisms U -> X from schemes as in SF.1/etale-local-properties.

**Construction or proof.**
1. Define the category of etale U -> X with U a scheme, with coverings induced from the big etale site (Stacks Definition 66.18.1, 03ED); fibre products exist by SF.1/space-fibre-products.
2. Compare with X_spaces,et (Stacks Definition 66.18.2, 03G0): every etale space over X is covered by etale schemes, so the topoi agree (Stacks Lemma 66.18.3).
3. The presheaf U |-> Γ(U, O_U) is a sheaf for etale coverings by SF.1/qcoh-fpqc-descent applied to O (Stacks Lemma 66.21.1, Definition 66.21.2).
4. Functoriality f^{-1} by base change of etale maps; localisation at an atlas identifies (X_et)/U with U_et.

**API.**
- `TauCeti.SchemeFoundations.Spaces.smallEtale` (data): The category X_et of etale morphisms from schemes to X, with its Grothendieck topology.
- `TauCeti.SchemeFoundations.Spaces.structureSheaf` (data): The sheaf of rings O_X on X_et, U |-> Γ(U, O_U).
- `TauCeti.SchemeFoundations.Spaces.smallEtale_ofScheme` (compatibility): For a scheme X, X_et with its topology is equivalent to Mathlib's X.Etale with smallEtaleTopology, compatibly with structure sheaves.
- `TauCeti.SchemeFoundations.Spaces.smallEtale_map` (functoriality): A morphism f : X -> Y induces the base-change functor Y_et -> X_et and a morphism of ringed sites.
- `TauCeti.SchemeFoundations.Spaces.smallEtale_localize` (equivalence): For an etale U -> X with U a scheme, (X_et)/U is equivalent to U_et.

**Unit tests.**
- `TauCeti.SchemeFoundations.Spaces.smallEtale.test_spec_global_sections` (computation): For X = h_{Spec R}, the global sections of O_X on X_et are R.
- `TauCeti.SchemeFoundations.Spaces.smallEtale.test_folded_line_functions` (computation): For the folded line X = A^1_k/(Δ ⊔ Γ), char k ≠ 2, the global sections of O_X are k[x^2]: a function f on A^1 descends iff f(x) = f(-x) on G_m.
- `TauCeti.SchemeFoundations.Spaces.smallEtale.test_separably_closed` (degenerate): For k separably closed, every etale covering of Spec k has a section, so sheaves on (Spec k)_et are sets.
- `TauCeti.SchemeFoundations.Spaces.smallEtale.test_not_big_site` (non-example): The small site of Spec k contains no morphism A^1_k -> Spec k (not etale), so the big etale site of k-schemes is not X_et.

**Uses.** SF.1/space-quasi-coherent: quasi-coherent modules are modules on the ringed site (X_et, O_X). AlgebraicModuliForArithmeticGeometry:R09.3 (request to SF.1: small etale ringed site and chart fibre products): the space quasi-coherent and relative Picard constructions are built on this site. SchemeAndStackFoundations:SF.2: etale cohomology of algebraic spaces is cohomology on X_et. NeronModelsAndSemistableAbelianVarietiesPartII:G.0 (request to SF.1): the small etale structure sheaf of the algebraic-space carrier.

**Acceptance.** For X = h_{Spec R}, Γ(X_et, O_X) = R.

**Depends on.** this layer: `space-fibre-products`, `etale-local-properties`, `qcoh-fpqc-descent`; libraries: `AlgebraicGeometry.Scheme.Etale` (Mathlib), `AlgebraicGeometry.Scheme.smallEtaleTopology` (Mathlib), `AlgebraicGeometry.Scheme.etaleTopology` (Mathlib).

**Source.** The Stacks Project — Definitions 66.18.1 (03ED), 66.18.2 (03G0), 66.21.2 (03G7).

### Quasi-coherent modules on algebraic spaces (`SF.1/space-quasi-coherent`, definition)
For an algebraic space X, QCoh(X) is the full subcategory of O_X-modules on the ringed site (X_et, O_X) satisfying Mathlib's SheafOfModules.IsQuasicoherent. Pullback along morphisms of algebraic spaces preserves quasi-coherence. For X a scheme QCoh(X) is equivalent to the Zariski quasi-coherent category of SF.1/qcoh-pseudofunctor. For a presentation (U, R) of X, pullback to U with its canonical isomorphism t^* F = s^* F is an equivalence from QCoh(X) to quasi-coherent modules on the groupoid (U, R). Invertible modules are the quasi-coherent modules etale locally isomorphic to O_X; their automorphism group is Γ(X, O_X)^x.

**Hypotheses and conventions.** X an algebraic space; quasi-coherence in the sense of Modules on Sites 18.23.1 on (X_et, O_X).

**Construction or proof.**
1. Define QCoh(X) via Mathlib's IsQuasicoherent predicate on sheaves of modules over O_X (Stacks Definition 66.29.1, 03G9).
2. Scheme comparison: quasi-coherent modules on the small etale site of a scheme correspond to Zariski quasi-coherent modules (Stacks Descent Sections 35.8-35.10), using SF.1/qcoh-fpqc-descent.
3. Presentation equivalence (Stacks Proposition 66.32.1, 03M3): apply SF.1/qcoh-fpqc-descent to the etale covering U -> X and identify descent data with quasi-coherent modules on (U, R).
4. Invertible modules and units: an automorphism of an invertible module is etale locally multiplication by a unit, and these glue to a global unit.

**API.**
- `TauCeti.SchemeFoundations.Spaces.QCoh` (data): The category QCoh(X) of quasi-coherent O_X-modules on X_et.
- `TauCeti.SchemeFoundations.Spaces.QCoh.pullback` (functoriality): Pullback along f : X -> Y maps QCoh(Y) to QCoh(X), pseudofunctorially.
- `TauCeti.SchemeFoundations.Spaces.QCoh.ofSchemeEquiv` (equivalence): For a scheme Y, QCoh(h_Y) is equivalent to the Zariski category QCoh(Y).
- `TauCeti.SchemeFoundations.Spaces.QCoh.presentationEquiv` (equivalence): For a presentation (U, R), QCoh(X) is equivalent to quasi-coherent modules on the groupoid (U, R).
- `TauCeti.SchemeFoundations.Spaces.QCoh.invertible_aut` (characterisation): For an invertible O_X-module L, Aut(L) = Γ(X, O_X)^x compatibly with pullback.

**Unit tests.**
- `TauCeti.SchemeFoundations.Spaces.QCoh.test_scheme` (compatibility): For a scheme Y, QCoh(h_Y) is equivalent to QCoh(Y).
- `TauCeti.SchemeFoundations.Spaces.QCoh.test_folded_line_structure_sheaf` (computation): For the folded line X (char k ≠ 2), O_X is quasi-coherent with Γ(X, O_X) = k[x^2].
- `TauCeti.SchemeFoundations.Spaces.QCoh.test_empty` (degenerate): QCoh of the empty algebraic space is equivalent to the terminal category.
- `TauCeti.SchemeFoundations.Spaces.QCoh.test_extension_by_zero` (non-example): For Y = Spec Z and U = Spec Z[1/2], the extension by zero of O_U to Y_et is an O-module with zero global sections and nonzero restriction to U, hence not quasi-coherent.

**Uses.** AlgebraicModuliForArithmeticGeometry:R09.3 (space-quasicoherent-modules and space-fpqc-quasicoherent-descent nodes): planned there; they become imports of this node. AlgebraicModuliForArithmeticGeometry:A0-extension (relative Picard requests): invertible sheaves on spaces with tensor, dual and unit automorphisms. AutomorphicBundles:B5 (request to SF.1): effective flat-atlas descent of quasi-coherent coefficient sheaves. SF.1/stack-quasi-coherent: quasi-coherent modules on stacks restrict to this notion on representable stacks.

**Acceptance.** For X = h_Y with Y a scheme, QCoh(X) = QCoh(Y).

**Depends on.** this layer: `small-etale-site`, `qcoh-pseudofunctor`, `qcoh-fpqc-descent`, `space-presentation`; libraries: `SheafOfModules.IsQuasicoherent` (Mathlib).

**Source.** The Stacks Project — Definition 66.29.1 (03G9) and Proposition 66.32.1 (03M3).

### The folded line is an algebraic space that is not a scheme (`SF.1/folded-line-space`, theorem)
Let k be a field of characteristic different from 2, U = A^1_k and R = Δ ⊔ Γ with Γ = {(x, -x) : x ≠ 0} ⊂ U x_k U. Then R is an etale equivalence relation, X = U/R is a quasi-separated algebraic space which is not locally separated; in particular X is not a scheme. Its ring of global functions is k[x^2], and the induced map X -> A^1_k, x |-> x^2, is bijective on geometric points but not an isomorphism.

**Hypotheses and conventions.** char k ≠ 2.

**Construction or proof.**
1. s and t restricted to Γ are the inclusion G_m -> A^1 and its composite with x |-> -x, both open immersions, so R is etale over U; R(T) is an equivalence relation pointwise.
2. X is an algebraic space by SF.1/etale-quotient-theorem; it is quasi-separated since R is quasi-compact (Stacks 0AHR).
3. j : R -> U x U is not an immersion (the closure of Γ meets Δ at the origin), so the diagonal of X is not an immersion: X is not locally separated, whereas every scheme has an immersion diagonal.
4. Global functions (own computation from the presentation): f in k[x] descends iff s^*f = t^*f on R, i.e. f(x) = f(-x) in k[x, x^{-1}], so Γ(X, O_X) = k[x^2]. The map X -> A^1_k induced by x |-> x^2 is invariant, bijective on geometric points (the origin and the pairs {x, -x}), and not an isomorphism because X is not a scheme.

**Acceptance.** Γ(X, O_X) = k[x^2] (test of SF.1/small-etale-site). X is not locally separated (test of SF.1/separation-properness-spaces).

**Depends on.** this layer: `etale-quotient-theorem`, `separation-properness-spaces`, `small-etale-site`; libraries: `AlgebraicGeometry.IsImmersion` (Mathlib).

**Source.** The Stacks Project — Example 65.14.1 (tag 02Z1).

### The quotient of the affine line by translations (`SF.1/translation-quotient-space`, theorem)
Let k be a field of characteristic 0 and let Z act on A^1_k by n.x = x + n. The action is free, the quotient sheaf X = A^1_k/Z is an algebraic space with etale atlas A^1_k -> X and R = ⊔_{n in Z} A^1_k, X is not quasi-separated, and the generic point of A^1 gives a point of X that is not represented by any monomorphism from the spectrum of a field.

**Hypotheses and conventions.** char k = 0, so the translation action is free on T-points for every k-scheme T and faithful on k(x).

**Construction or proof.**
1. A free action of an abstract group on an algebraic space has an algebraic-space quotient (Stacks Lemma 66.34.1, 071S): R = Z x A^1 is an etale equivalence relation, so SF.1/etale-quotient-theorem applies.
2. A^1 x_X A^1 = R is an infinite disjoint union of affine lines, not quasi-compact, so X is not quasi-separated (Stacks Lemma 66.3.3, 0AHR).
3. Z has no nontrivial finite subgroups, so the generic point has no residue field (Stacks Example 65.14.8, 02Z7).

**Acceptance.** X is not quasi-separated (test of SF.1/separation-properness-spaces). Points of X do not have residue fields in general (test of SF.1/space-points).

**Depends on.** this layer: `etale-quotient-theorem`, `separation-properness-spaces`, `space-points`.

**Source.** The Stacks Project — Lemma 66.34.1 (071S), Example 65.14.8 (02Z7), Lemma 66.3.3 (0AHR).

## SF.1c. Group spaces, torsors and quotients
Group algebraic spaces are Mathlib group objects (GrpObj) in the cartesian monoidal category of algebraic spaces over a base, and actions are Mathlib module objects (ModObj) for the self-action of that monoidal category; for schemes these are Mathlib's group objects in Over S. Actions are left actions. Torsors are fppf torsors by default and fpqc torsors for flat affine groups. Quotients come in three strengths, kept apart: the fppf quotient sheaf, categorical quotients and geometric quotients.

### Group algebraic spaces and their actions (`SF.1/group-action`, definition)
Let B be an algebraic space over S (for instance a scheme). A group algebraic space over B is a group object (Mathlib GrpObj) in the cartesian monoidal category AlgSp/B; for schemes it is Mathlib's GrpObj in Over B. An action of G on an algebraic space X over B is a module-object structure (Mathlib ModObj, for the action of AlgSp/B on itself), i.e. a morphism a : G x_B X -> X over B making X(T) a G(T)-set for every T. Equivariant morphisms commute with the actions. The action is free if G(T) acts freely on X(T) for every scheme T; equivalently (a, pr_2) : G x_B X -> X x_B X is a monomorphism.

**Hypotheses and conventions.** Left actions, as in Stacks 39.10 and 78.8; a right action is converted by inversion.

**Construction or proof.**
1. Use the cartesian monoidal structure of AlgSp/B given by fibre products (SF.1/space-fibre-products); for schemes Mathlib provides CartesianMonoidalCategory (Over S).
2. Express the group law and action through Mathlib's GrpObj and ModObj with the self-action of a monoidal category (selfLeftAction); on T-points these become groups and G(T)-sets (Stacks Definitions 78.5.1 and 78.8.1).
3. Freeness is pointwise; the monomorphism criterion is Stacks Lemma 78.8.3 (06P9).

**API.**
- `TauCeti.SchemeFoundations.Groups.GroupSpace` (data): A group algebraic space over B: an object of AlgSp/B with a GrpObj structure.
- `TauCeti.SchemeFoundations.Groups.Action` (data): An action of G on X over B: a ModObj structure, with action map a : G x_B X -> X.
- `TauCeti.SchemeFoundations.Groups.Action.free_iff_mono` (characterisation): The action is free iff (a, pr_2) : G x_B X -> X x_B X is a monomorphism.
- `TauCeti.SchemeFoundations.Groups.Action.baseChange` (functoriality): An action over B pulls back to an action of G_{B'} on X_{B'} for any B' -> B.
- `TauCeti.SchemeFoundations.Groups.Action.constantEquiv` (equivalence): For a finite group Γ, actions of Tau Ceti's constant group scheme Γ_S on X/S correspond to homomorphisms Γ -> Aut_S(X).

**Unit tests.**
- `TauCeti.SchemeFoundations.Groups.Action.test_translation_free` (characterisation): G acting on itself by left translation is free.
- `TauCeti.SchemeFoundations.Groups.Action.test_scaling_not_free` (non-example): G_m acting on A^1 by scaling is not free: the k-point 0 has stabilizer G_m(k).
- `TauCeti.SchemeFoundations.Groups.Action.test_constant_group` (compatibility): The action of the constant group scheme (Z/2)_k on Spec k ⊔ Spec k by swapping corresponds to the nontrivial homomorphism Z/2 -> Aut(Spec k ⊔ Spec k).
- `TauCeti.SchemeFoundations.Groups.Action.test_trivial_group` (degenerate): The trivial group space acts on every X in exactly one way.

**Uses.** SF.1/groupoid-space: the action groupoid (X, G x_B X, s = pr, t = a). SF.1/torsor and SF.1/quotient-stack: torsors and quotient stacks are defined for actions. SF.1/categorical-geometric-quotient: invariant morphisms and quotients of actions. WeilConjectures:WC.0 and LanglandsParameterStacks (requests to SF.1): quotient stacks [Y/G] of actions and their point groupoids.

**Acceptance.** For a finite group Γ, actions of the constant group scheme Γ_S on X over S correspond to group homomorphisms Γ -> Aut_S(X).

**Depends on.** this layer: `space-fibre-products`, `algebraic-space-category`; libraries: `CategoryTheory.GrpObj` (Mathlib), `CategoryTheory.ModObj` (Mathlib), `CategoryTheory.MonoidalCategory.selfLeftAction` (Mathlib), `TauCeti.ConstantGroup.groupScheme` (Tau Ceti), `CategoryTheory.MonObj` (Mathlib), `AlgebraicGeometry.instGrpObjSpecAsOverSpec` (Mathlib).

**Source.** The Stacks Project — Definitions 78.5.1 (043H), 78.8.1 (043Q), 78.8.2 and Lemma 78.8.3 (06P9); The Stacks Project — Definitions 39.10.1 (022Z) and 39.10.2 (07S1).

### Groupoids in algebraic spaces (`SF.1/groupoid-space`, definition)
A groupoid in algebraic spaces over B is a quintuple (U, R, s, t, c) of algebraic spaces and morphisms over B, with c : R x_{s,U,t} R -> R, such that for every scheme T the quintuple (U(T), R(T), s, t, c) is a groupoid; then the identity e : U -> R and inverse i : R -> R exist uniquely. Morphisms of groupoids are pairs of maps inducing functors on T-points. Every group action gives the action groupoid (X, G x_B X, s = pr_2, t = a, c), every equivalence relation j : R -> U x U gives a groupoid, and a groupoid restricts along g : U' -> U to (U', U' x_{U,t} R x_{s,U} U').

**Hypotheses and conventions.** U, R algebraic spaces over B; groupoid axioms tested on T-points.

**Construction or proof.**
1. Define the structure with the composition c and the T-pointwise groupoid condition (Stacks Definition 78.11.1, 043W); deduce e and i by Yoneda.
2. Action groupoid: (g, x) has source x and target gx; composition multiplies group elements (Stacks Lemma 78.15.1).
3. Equivalence relations give groupoids with c induced by transitivity (Stacks Lemma 39.13.3).
4. Restriction along g is computed by fibre products of algebraic spaces (SF.1/space-fibre-products).

**API.**
- `TauCeti.SchemeFoundations.Groups.Groupoid.e` (projection): The identity section e : U -> R with s e = t e = id.
- `TauCeti.SchemeFoundations.Groups.Groupoid.i` (projection): The inverse i : R -> R with s i = t and c(r, i r) = e(t r).
- `TauCeti.SchemeFoundations.Groups.Groupoid.ofAction` (constructor): The action groupoid of an action of a group space.
- `TauCeti.SchemeFoundations.Groups.Groupoid.ofEquivRel` (constructor): The groupoid of an equivalence relation.
- `TauCeti.SchemeFoundations.Groups.Groupoid.restrict` (functoriality): Restriction of a groupoid along g : U' -> U.
- `TauCeti.SchemeFoundations.Groups.Groupoid.toPresheafOfGroupoids` (data): The presheaf of groupoids T |-> (U(T), R(T)) on Sch.

**Unit tests.**
- `TauCeti.SchemeFoundations.Groups.Groupoid.test_trivial` (degenerate): (U, U, id, id, id) is a groupoid: the discrete groupoid on U.
- `TauCeti.SchemeFoundations.Groups.Groupoid.test_action_trivial_group` (compatibility): The action groupoid of the trivial group acting on X is the discrete groupoid on X.
- `TauCeti.SchemeFoundations.Groups.Groupoid.test_indiscrete` (computation): (U, U x_B U, pr_2, pr_1, composition) is a groupoid, the groupoid of the full equivalence relation, with exactly one arrow between any two T-points.
- `TauCeti.SchemeFoundations.Groups.Groupoid.test_monoid_not_groupoid` (non-example): The additive monoid N acting on A^1_k by translation gives (A^1, N x A^1, s, t, c) whose T-points form a category without inverses, so it is not a groupoid.

**Uses.** SF.1/stabilizer: the stabilizer of a groupoid is j^{-1}(Δ_U). SF.1/quotient-stack and SF.1/stack-presentation: [U/R] is the stackification of the groupoid prestack; every algebraic stack is [U/R]. SF.1/categorical-geometric-quotient: R-invariant morphisms and quotients of groupoids. Stacks Chapter 83: quotients of groupoids.

**Acceptance.** The associated presheaf of groupoids T |-> (U(T), R(T)) is the input of SF.1/stackification for quotient stacks.

**Depends on.** this layer: `group-action`, `etale-equivalence-relation`, `space-fibre-products`.

**Source.** The Stacks Project — Definition 78.11.1 (043W); The Stacks Project — Definition 39.13.1 (0231).

### Stabilizer group spaces (`SF.1/stabilizer`, construction)
For a groupoid (U, R, s, t, c) in algebraic spaces over B, the stabilizer is G_U := j^{-1}(Δ_{U/B}) = R x_{(t,s), U x_B U, Δ} U, a group algebraic space over U under c. For an action of G on X over B it is G_X = (G x_B X) x_{X x_B X} X, whose T-points are the pairs (g, x) with g x = x. For a point x : Spec K -> U the stabilizer of x is x^* G_U, a group algebraic space over K.

**Hypotheses and conventions.** (U, R, s, t, c) a groupoid in algebraic spaces; fibre products exist by SF.1/space-fibre-products.

**Construction or proof.**
1. Form the fibre product of j with the diagonal; the composition c restricts to a group law over U (Stacks Lemma 78.16.1, Definition 78.16.2).
2. For an action groupoid the fibre product is computed pointwise as pairs (g, x) with gx = x.
3. Freeness of an action is equivalent to triviality of the stabilizer (unit section an isomorphism), by Stacks Lemma 78.8.3.

**API.**
- `TauCeti.SchemeFoundations.Groups.stabilizer` (data): The stabilizer group space G_U -> U of a groupoid.
- `TauCeti.SchemeFoundations.Groups.stabilizer_points` (simp): For an action, the T-points of G_X are the pairs (g, x) with g x = x.
- `TauCeti.SchemeFoundations.Groups.stabilizer_baseChange` (functoriality): Formation of the stabilizer commutes with base change along B' -> B and with restriction along U' -> U.
- `TauCeti.SchemeFoundations.Groups.free_iff_stabilizer_trivial` (characterisation): An action is free iff its stabilizer is the trivial group space over X.
- `TauCeti.SchemeFoundations.Groups.stabilizerAt` (constructor): The stabilizer x^* G_U of a field-valued point x : Spec K -> U.

**Unit tests.**
- `TauCeti.SchemeFoundations.Groups.stabilizer.test_trivial_action` (degenerate): For the trivial action of G on X, the stabilizer is G x_B X -> X.
- `TauCeti.SchemeFoundations.Groups.stabilizer.test_translation` (computation): For G acting on itself by translation the stabilizer is trivial.
- `TauCeti.SchemeFoundations.Groups.stabilizer.test_scaling` (computation): For G_m acting on A^1_k by scaling, G_X = Spec k[x, λ, λ^{-1}]/((λ - 1)x): its fibre over x = 0 is G_m and over x ≠ 0 is trivial.
- `TauCeti.SchemeFoundations.Groups.stabilizer.test_mu_p_nonreduced` (non-example): In characteristic p, μ_p acting on A^1 by scaling has stabilizer μ_p at the origin, a nonreduced group scheme with one point; the set-theoretic stabilizer of the k-point (the trivial group) is not the stabilizer.

**Uses.** SF.1/quotient-stack-algebraic: stabilizer conditions decide when [X/G] is Deligne-Mumford or an algebraic space. SF.1/inertia: the inertia of [U/R] is computed from the stabilizer. SF.1 stage acceptance: a quotient consumer receives the stabilizer conditions. GlobalShtukasAndFunctionFieldLanglands:GS.2 and DrinfeldModulesAndTModules:DM.3: stabilizer hypotheses in representability and Deligne-Mumford statements.

**Acceptance.** The inertia of a quotient stack [U/R] is the quotient stack of the stabilizer by the conjugation groupoid (Stacks Lemma 78.26.1), used in SF.1/inertia.

**Depends on.** this layer: `groupoid-space`, `group-action`, `space-fibre-products`.

**Source.** The Stacks Project — Definition 78.16.2 (0448); The Stacks Project — Definition 39.17.2 (0236).

### Torsors under group algebraic spaces (`SF.1/torsor`, definition)
Let G be a group algebraic space over B. A pseudo G-torsor is an algebraic space P over B with a G-action such that (a, pr_2) : G x_B P -> P x_B P is an isomorphism. It is a G-torsor in the topology τ (fppf by default; fpqc for G flat and affine over B) if there is a τ-covering {B_i -> B} with P(B_i) nonempty for all i. Morphisms of torsors are G-equivariant morphisms over B; they form the groupoid Tors_τ(B, G). Torsor algebraic spaces correspond to torsor sheaves under the sheaf of groups G (Stacks Lemma 95.14.10).

**Hypotheses and conventions.** G a group algebraic space over B; for the fppf default G is flat and locally of finite presentation over B, for fpqc torsors G is flat and affine over B.

**Construction or proof.**
1. Define pseudo-torsors by the isomorphism condition and torsors by local triviality (Stacks Definitions 78.9.1 and 78.9.3; schemes: 39.11.1 and 39.11.3).
2. A torsor with a section over B is trivial, via g |-> g p (Poonen Proposition 6.5.3).
3. Every morphism of torsors is an isomorphism: fppf locally both are trivial and an equivariant self-map of G is right translation.
4. For a fixed covering, torsors trivialized on it correspond to Cech 1-cocycles modulo coboundaries of the presheaf of groups G (Mathlib PresheafOfGroups.H1), as in Poonen Proposition 6.5.9.
5. Flatness, local finite presentation and smoothness pass from G to P by fpqc descent of properties (Poonen Remark 6.5.2).

**API.**
- `TauCeti.SchemeFoundations.Groups.Torsor.trivial` (constructor): G with left translation is a G-torsor, the trivial torsor.
- `TauCeti.SchemeFoundations.Groups.Torsor.trivial_iff_section` (characterisation): A G-torsor P is isomorphic to the trivial torsor iff P(B) is nonempty.
- `TauCeti.SchemeFoundations.Groups.Torsor.hom_isIso` (characterisation): Every morphism of G-torsors over B is an isomorphism.
- `TauCeti.SchemeFoundations.Groups.Torsor.baseChange` (functoriality): Torsors pull back along B' -> B, giving a pseudofunctor B |-> Tors(B, G_B).
- `TauCeti.SchemeFoundations.Groups.Torsor.cechEquiv` (equivalence): Isomorphism classes of torsors trivialized on a fixed covering U correspond to Mathlib's PresheafOfGroups.H1 of G on U.
- `TauCeti.SchemeFoundations.Groups.Torsor.flat_of_flat` (compatibility): If G -> B is flat (resp. smooth, locally of finite presentation) then so is P -> B.

**Unit tests.**
- `TauCeti.SchemeFoundations.Groups.Torsor.test_trivial` (degenerate): The trivial torsor G is a G-torsor with the identity section.
- `TauCeti.SchemeFoundations.Groups.Torsor.test_frobenius_mu_p` (computation): In characteristic p, G_m with μ_p acting by multiplication and the map s |-> s^p : G_m -> G_m is an fppf μ_p-torsor over G_m that is not trivial on any etale covering.
- `TauCeti.SchemeFoundations.Groups.Torsor.test_frobenius_twisted_action` (non-example): For a smooth group G of positive dimension over F_p, X = G with the action x . g = x F(g) (F the Frobenius) makes X(F_p-bar) a G(F_p-bar)-torsor but X is not a G-torsor (Poonen Warning 5.12.6).
- `TauCeti.SchemeFoundations.Groups.Torsor.test_empty` (non-example): The empty space with the trivial action satisfies G x ∅ = ∅ x ∅ but is not a torsor over a nonempty base, since it has no sections locally.
- `TauCeti.SchemeFoundations.Groups.Torsor.test_galois` (compatibility): Spec Q(i) -> Spec Q with complex conjugation is a (Z/2)_Q-torsor without a Q-point.

**Uses.** SF.1/quotient-stack: objects of [X/G] over T are G-torsors over T with an equivariant map to X. SF.1/torsor-cohomology and SF.1/twisting-bijection: classes of torsors and twisting. PrismaticCohomology:PR.0, FunctionFieldArithmeticPartII and LanglandsParameterStacks (requests to SF.1): representability of fpqc torsors under flat affine groups, μ_n frame torsors, BG. PotentialModularityAndCompatibleSystems:R23.1 (request to SF.1): finite etale Isom torsors of H-torsors. algebraicgeometry/flat-torsors key definition (owner SF.1): the key definition is planned by this node and its companions.

**Acceptance.** Spec Q(i) -> Spec Q with the Galois action is a (Z/2)_Q-torsor (Poonen Example 6.5.4). For an affine group G over a ring R and a closed normal subgroup V(I), G -> G/V(I) is a V(I)-torsor of fppf sheaves: Tau Ceti proves the torsor square G x V(I) -> G over G/V(I) is a pullback (CommHopfAlgCat.isPullback_fppfQuotientTorsor).

**Depends on.** this layer: `group-action`, `etale-local-properties`; libraries: `CategoryTheory.PresheafOfGroups.H1` (Mathlib), `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib), `AlgebraicGeometry.Scheme.fpqcTopology` (Mathlib), `Torsor` (Mathlib), `TauCeti.CommHopfAlgCat.isPullback_fppfQuotientTorsor` (Tau Ceti).

**Source.** The Stacks Project — Definition 78.9.3 (04TY) and Definition 78.9.1; The Stacks Project — Definitions 39.11.1 (0498) and 39.11.3 (049A); Bjorn Poonen, Rational points on varieties — Definition 6.5.1, Proposition 6.5.3, Proposition 6.5.9, Warning 5.12.6, pp. 152-181.

### The pointed set of torsor classes (`SF.1/torsor-cohomology`, construction)
For a group algebraic space G over B and τ in {fppf, fpqc (G flat affine), etale}, H^1_τ(B, G) is the set of isomorphism classes of τ-G-torsors over B, pointed by the class of the trivial torsor. It is contravariant in B (pullback) and covariant in G (pushforward of torsors along homomorphisms by contracted product). It is the colimit over coverings of the Cech sets of Mathlib's PresheafOfGroups.H1. For G commutative it is an abelian group, and H^1_fppf(S, G_m) = Pic(S) via line bundles and their frame torsors.

**Hypotheses and conventions.** G flat and locally of finite presentation (fppf), or flat affine (fpqc), or smooth (etale).

**Construction or proof.**
1. Take isomorphism classes in the groupoid Tors_τ(B, G) of SF.1/torsor; pullback and pushforward descend to classes.
2. Cech comparison: every torsor is trivialized by a covering, and refinements give the colimit description (Poonen Proposition 6.5.9).
3. Commutative G: the contracted product P x^G Q with the diagonal action gives the group law (Poonen Example 5.12.15).
4. Line bundles: a line bundle L gives the G_m-torsor of nowhere vanishing sections of its dual geometric line bundle, and conversely (Poonen Example 6.5.5); compare with Tau Ceti's LineBundleClass.

**API.**
- `TauCeti.SchemeFoundations.Groups.H1` (data): The pointed set H^1_τ(B, G) of isomorphism classes of τ-torsors.
- `TauCeti.SchemeFoundations.Groups.H1.pullback` (functoriality): Pullback H^1(B, G) -> H^1(B', G_{B'}) along B' -> B.
- `TauCeti.SchemeFoundations.Groups.H1.pushforward` (functoriality): Pushforward H^1(B, G) -> H^1(B, H) along a homomorphism G -> H.
- `TauCeti.SchemeFoundations.Groups.H1.cechColimit` (equivalence): H^1_τ(B, G) is the colimit over τ-coverings of Mathlib's Cech PresheafOfGroups.H1.
- `TauCeti.SchemeFoundations.Groups.H1.picEquiv` (equivalence): H^1_fppf(S, G_m) is in bijection with Tau Ceti's LineBundleClass S.

**Unit tests.**
- `TauCeti.SchemeFoundations.Groups.H1.test_trivial_group` (degenerate): H^1(B, 1) is a single point.
- `TauCeti.SchemeFoundations.Groups.H1.test_separably_closed` (computation): For k separably closed and G smooth over k, H^1(Spec k, G) is a single point.
- `TauCeti.SchemeFoundations.Groups.H1.test_kummer` (computation): H^1_fppf(Spec Q, μ_2) is in bijection with Q^x/(Q^x)^2.
- `TauCeti.SchemeFoundations.Groups.H1.test_pic_projective_line` (compatibility): H^1_fppf(P^1_k, G_m) is isomorphic to Z, matching LineBundleClass(P^1_k).
- `TauCeti.SchemeFoundations.Groups.H1.test_not_cech_one_cover` (non-example): H^1 is not the Cech H^1 of a single fixed covering: for the Zariski covering of P^1 by two affine lines the Cech set already gives Z, but for the trivial covering {id} of P^1 the Cech set is a point.

**Uses.** SF.1/twisting-bijection: twisting identifies H^1 of an inner form with H^1 of G. SF.1/moduli-functor: the moduli functor of BG is T |-> H^1(T, G). SF.1/conjugator-representability and the whole-roadmap SF.1/cocycle node: Galois cohomology classes of conjugators. ShimuraCompactifications:C0 (request to SF.1): torus torsors and their classes.

**Acceptance.** H^1(B, G) is trivial when B = Spec k with k separably closed and G smooth.

**Depends on.** this layer: `torsor`, `contracted-product`; libraries: `CategoryTheory.PresheafOfGroups.H1` (Mathlib), `TauCeti.AlgebraicGeometry.LineBundleClass` (Tau Ceti).

**Source.** Bjorn Poonen, Rational points on varieties — Section 5.12.4 (classification of torsors, Proposition 5.12.14) and Proposition 6.5.9, Example 6.5.5, pp. 154-181; The Stacks Project — Section 95.14 (Classifying torsors, tag 036Z), Lemma 95.14.10 (04UT).

### Representability and descent of torsors (`SF.1/torsor-representability`, theorem)
(a) If G is a flat affine group scheme over a scheme S, every fpqc torsor sheaf under G is represented by a scheme affine over S. (b) If G is a group algebraic space flat and locally of finite presentation over B, every fppf torsor sheaf under G is represented by an algebraic space. (c) For such G, fppf G-torsors form a stack in groupoids for the fppf topology: G-torsors given on the members of a covering with equivariant gluing isomorphisms satisfying the cocycle condition descend uniquely.

**Hypotheses and conventions.** (a) G -> S flat and affine; (b), (c) G -> B flat and locally of finite presentation.

**Construction or proof.**
1. (a) A torsor sheaf P becomes isomorphic to G over a covering, giving affine schemes with descent data; SF.1/affine-fpqc-descent makes them effective (Poonen Theorem 6.5.10(i)).
2. (b) The torsor sheaf is fppf locally isomorphic to the algebraic space G; algebraic spaces are fppf local (SF.1/artin-bootstrap, Stacks Lemma 80.11.1; Poonen Remark 6.5.11).
3. (c) Glue the torsors as fppf sheaves (SF.1/sheaf-stack); the glued sheaf is a torsor sheaf, hence an algebraic space by (b) (Stacks Lemma 80.11.8, 04U1; Lemma 95.14.9).

**Acceptance.** The μ_n frame torsor of a line bundle L with L^n = O is a scheme finite over the base. BG is a stack in groupoids (SF.1/quotient-stack).

**Depends on.** this layer: `torsor`, `affine-fpqc-descent`, `artin-bootstrap`, `sheaf-stack`.

**Source.** Bjorn Poonen, Rational points on varieties — Theorem 6.5.10(i) and Remark 6.5.11, pp. 181-182; The Stacks Project — Lemma 80.11.8 (04U1).

### Contracted products and twisting by torsors (`SF.1/contracted-product`, construction)
Let G be a group algebraic space flat and locally of finite presentation over B, P a G-torsor and X an algebraic space with G-action over B. The contracted product P x^G X is the quotient sheaf of P x_B X by the free antidiagonal action g.(p, x) = (p g^{-1}, g x) (P viewed with the right action p g := g^{-1} p). It is an algebraic space, fppf locally isomorphic to X, functorial in P and X, and compatible with base change. The inner form of G twisted by P is G_P := P x^G G for the conjugation action; it is the group space Aut_G(P) of torsor automorphisms. A homomorphism φ : G -> H pushes P forward to the H-torsor P x^G H. If G and X are affine over B, so is P x^G X.

**Hypotheses and conventions.** G flat and locally of finite presentation over B (or flat affine for the fpqc variant with X affine); the antidiagonal action is free because the action on P is.

**Construction or proof.**
1. The antidiagonal action is free, so the quotient is an algebraic space and P x X -> P x^G X is a G-torsor (Stacks Lemma 80.11.7 via SF.1/artin-bootstrap).
2. Over a covering trivializing P, P x^G X becomes G x^G X = X, which gives local triviality and the twist description.
3. Inner forms: G acts on itself by conjugation; P x^G G represents equivariant automorphisms of P (Poonen 5.11, 5.12.5.1, 6.5.6.1).
4. Affine case: the descent datum on X x P is affine, so SF.1/affine-fpqc-descent applies (Poonen 6.5.6.3).

**API.**
- `TauCeti.SchemeFoundations.Groups.contractedProduct` (data): The algebraic space P x^G X.
- `TauCeti.SchemeFoundations.Groups.contractedProduct_trivial` (simp): For the trivial torsor, G x^G X is isomorphic to X naturally in X.
- `TauCeti.SchemeFoundations.Groups.contractedProduct_baseChange` (compatibility): (P x^G X)_{B'} = P_{B'} x^{G_{B'}} X_{B'}.
- `TauCeti.SchemeFoundations.Groups.innerForm` (constructor): The inner form G_P = P x^G G, isomorphic to Aut_G(P).
- `TauCeti.SchemeFoundations.Groups.pushforwardTorsor` (functoriality): A homomorphism G -> H sends a G-torsor P to the H-torsor P x^G H, functorially and compatibly with composition.

**Unit tests.**
- `TauCeti.SchemeFoundations.Groups.contractedProduct.test_trivial` (degenerate): G x^G X is isomorphic to X.
- `TauCeti.SchemeFoundations.Groups.contractedProduct.test_point` (degenerate): For X = B with trivial action, P x^G B = B.
- `TauCeti.SchemeFoundations.Groups.contractedProduct.test_line_bundle` (computation): For the G_m-torsor P of frames of a line bundle L, P x^{G_m} A^1 (scaling action) is the total space of the corresponding geometric line bundle.
- `TauCeti.SchemeFoundations.Groups.contractedProduct.test_needs_sheafification` (non-example): For P = Spec C over Spec R under Z/2 = Gal(C/R) and X = Spec C with the Galois action, P x^G X = Spec((C (x)_R C)^{Z/2}) = Spec R ⊔ Spec R has two R-points, while the presheaf quotient of (P x X)(R) = ∅ is empty; the contracted product must be the sheaf quotient.

**Uses.** SF.1/twisting-bijection: twisting torsors and forms. SF.1/torsor-cohomology: pushforward along homomorphisms and the group law for commutative G. AlgebraicModuliForArithmeticGeometry:R09.4 (torsor-twist-space node): twisting an algebraic space by a torsor under a finite etale group; becomes an import. ShimuraCompactifications:C0 (request to SF.1): character-line gradings of split torus torsors are associated line bundles.

**Acceptance.** Twisting the trivial torsor gives X back.

**Depends on.** this layer: `torsor`, `quotient-sheaf`, `artin-bootstrap`, `affine-fpqc-descent`.

**Source.** Bjorn Poonen, Rational points on varieties — Sections 5.12.5.2 (contracted products) and 6.5.6 (geometric operations over a base), pp. 155-183; The Stacks Project — Lemma 80.11.7 (06PH).

### Twisting torsors and forms (`SF.1/twisting-bijection`, theorem)
Let E be a G-torsor over B (G flat and locally of finite presentation) with inner form G_E = Aut_G(E). Then Q |-> Q x^{G_E} E is an equivalence of groupoids from G_E-torsors to G-torsors carrying the trivial G_E-torsor to E; on classes it is a bijection H^1(B, G_E) -> H^1(B, G) sending the base point to [E]. For a finite Galois extension k'/k (or k' = k_s) and a quasi-projective k-variety X, isomorphism classes of k'/k-twists of X are in bijection with H^1(Gal(k'/k), Aut(X_{k'})).

**Hypotheses and conventions.** G -> B flat and locally of finite presentation; for the Galois statement, X quasi-projective over k.

**Construction or proof.**
1. E is a G_E-G-bitorsor; the inverse equivalence is Z |-> Z x^G E^{-1} where E^{-1} is the inverse bitorsor (Poonen 5.12.5.1 and 6.5.6.4, subtraction of torsors).
2. Both composites are naturally isomorphic to the identity by associativity of contracted products, checked fppf locally where E is trivial.
3. Galois twists: a twist is a descent datum on X_{k'}, i.e. a cocycle Gal(k'/k) -> Aut(X_{k'}) (SF.1/galois-descent-quasi-projective, Poonen Proposition 4.4.4), and isomorphic twists give cohomologous cocycles (Poonen Theorem 4.5.2).

**Acceptance.** The trivial torsor E = G gives the identity map of H^1(B, G). Over R, the twists of P^1 are P^1 and the conic x^2 + y^2 + z^2 = 0, matching H^1(Gal(C/R), PGL_2(C)) of order 2.

**Depends on.** this layer: `contracted-product`, `torsor-cohomology`, `galois-descent-quasi-projective`, `torsor-representability`.

**Source.** Bjorn Poonen, Rational points on varieties — Theorem 4.5.2 with proof, Sections 5.12.5.1 and 6.5.6.4, pp. 105-183.

### Invariant morphisms, categorical and geometric quotients (`SF.1/categorical-geometric-quotient`, definition)
Let j = (t, s) : R -> U x_B U be a pre-relation of algebraic spaces over B (for instance a group action). A morphism φ : U -> X over B is R-invariant if φ s = φ t. It is a categorical quotient if it is R-invariant and every R-invariant ψ : U -> Y to an algebraic space factors as ψ = χ φ for a unique χ : X -> Y; a categorical quotient in a full subcategory C (for example schemes) is defined with Y in C. It is a geometric quotient if it is an orbit space (surjective with fibres over geometric points the R-orbits), universally submersive, and O_X is the sheaf of R-invariant functions: O_X = (φ_* O_U)^R. Uniform (or universal) variants require the property after flat (or arbitrary) base change on X.

**Hypotheses and conventions.** Invariance and quotients are taken in algebraic spaces over B; φ_* O_U and invariants on X_et.

**Construction or proof.**
1. Define R-invariance (Stacks Definition 83.3.1) and categorical quotients by the universal property (Stacks Definition 83.4.1, read with the composition χ φ; see sourceIssues).
2. Geometric quotients by Stacks Definition 83.10.1; for a group action this is Mumford's notion.
3. A geometric quotient is a categorical quotient in algebraic spaces: an invariant map is constant on orbits, submersivity gives continuity, and invariant functions give the sheaf map.

**API.**
- `TauCeti.SchemeFoundations.Groups.IsInvariant` (data): φ : U -> X is R-invariant: φ s = φ t.
- `TauCeti.SchemeFoundations.Groups.IsCategoricalQuotient` (universal-property): φ is R-invariant and initial among R-invariant morphisms to algebraic spaces.
- `TauCeti.SchemeFoundations.Groups.IsCategoricalQuotient.unique` (extensionality): Two categorical quotients are uniquely isomorphic compatibly with the quotient maps.
- `TauCeti.SchemeFoundations.Groups.IsGeometricQuotient` (data): φ is an orbit space, universally submersive, and O_X = (φ_* O_U)^R.
- `TauCeti.SchemeFoundations.Groups.IsGeometricQuotient.isCategoricalQuotient` (relation): Every geometric quotient is a categorical quotient in algebraic spaces.

**Unit tests.**
- `TauCeti.SchemeFoundations.Groups.Quotient.test_finite_affine` (computation): For a finite group G acting on Spec A over Spec A^G, Spec A -> Spec A^G is a geometric quotient (fibres are orbits by Mathlib Algebra.IsInvariant.orbit_eq_primesOver).
- `TauCeti.SchemeFoundations.Groups.Quotient.test_scaling_plane` (non-example): For G_m acting on A^2_k by scaling, A^2 -> Spec k is a categorical quotient but not a geometric quotient: its single fibre contains infinitely many orbits.
- `TauCeti.SchemeFoundations.Groups.Quotient.test_punctured_plane` (computation): For G_m acting on A^2_k minus the origin by scaling, the map to P^1_k is a geometric quotient.
- `TauCeti.SchemeFoundations.Groups.Quotient.test_line_no_geometric` (non-example): G_m acting on A^1_k by scaling has no geometric quotient: the orbits {0} and G_m cannot be separated while invariant functions are constants.

**Uses.** SF.1/coarse-moduli-space: coarse moduli maps of quotient stacks are categorical quotients that are bijective on geometric points. SF.1/finite-group-quotient and SF.1/keel-mori: existence of quotients. algebraicgeometry/geometric-quotients key definition (owner SF.1): the key definition is planned by this node. ShimuraCompactifications:C6 (request to SF.1): finite tame invariant quotients.

**Acceptance.** For a finite group acting on an affine scheme, Spec A -> Spec A^G is a geometric quotient (SF.1/finite-group-quotient).

**Depends on.** this layer: `groupoid-space`, `group-action`, `space-points`, `small-etale-site`, `algebraic-space-category`.

**Source.** The Stacks Project — Definitions 83.3.1 (048E), 83.4.1 (048J), 83.10.1 (04AE); The Stacks Project — Lemmas 106.12.2 and 106.12.3 (Section 106.12, tag 0DUF).

### Quotients by finite groups (`SF.1/finite-group-quotient`, theorem)
Let Γ be a finite group acting on a scheme X over S such that every Γ-orbit of points of X is contained in an affine open (for instance X affine, or X quasi-projective over an affine scheme). Then a geometric quotient π : X -> X/Γ exists in schemes; π is integral and surjective, X/Γ is covered by the spectra of the invariant rings of Γ-stable affine opens, π is a categorical quotient in algebraic spaces, and formation of X/Γ commutes with flat base change on X/Γ. If the action is free, π is a finite etale Γ-torsor and X/Γ represents the fppf quotient sheaf. On affine X = Spec A this is Tau Ceti ModularCurves 0C (imported).

**Hypotheses and conventions.** Γ finite (constant group scheme over S); every orbit in an affine open.

**Construction or proof.**
1. Each point has a Γ-stable affine open neighbourhood: intersect the translates of an affine open containing its orbit and pass to an invariant affine (Stacks Lemma 39.24.1, 03JE).
2. On a Γ-stable affine Spec A, Spec A -> Spec A^Γ is integral, surjective with fibres the orbits (Mathlib Algebra.IsInvariant.isIntegral and orbit_eq_primesOver) and categorical (Tau Ceti ModularCurves 0C, imported).
3. Invariants commute with localisation at invariant elements, so the affine quotients glue to X/Γ; flat base change preserves invariants as a kernel.
4. Free action: the groupoid Γ x X ⇉ X is a finite locally free equivalence relation, so X -> X/Γ is finite locally free with X x_{X/Γ} X = Γ x X (Stacks Proposition 39.23.9, 03BM, the affine case of SGA 3 V 4.1 owned by ModularCurves 0C), hence a finite etale Γ-torsor representing the quotient sheaf (Stacks Lemma 39.20.3).

**Acceptance.** For Z/2 acting on A^1_k by x |-> -x (char k ≠ 2), Spec k[x] -> Spec k[x^2] is a finite flat geometric quotient which is not a torsor, because the origin is fixed. For a free action of Z/2 on Spec k ⊔ Spec k the quotient is Spec k.

**Depends on.** this layer: `categorical-geometric-quotient`, `group-action`, `quotient-sheaf`; libraries: `Algebra.IsInvariant` (Mathlib), `Algebra.IsInvariant.isIntegral` (Mathlib), `Algebra.IsInvariant.orbit_eq_primesOver` (Mathlib); layers: `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`.

**Source.** The Stacks Project — Lemma 39.24.1 (03JE) and Proposition 39.23.9 (03BM).

### Artin's theorem on fppf quotients and fppf-local algebraic spaces (`SF.1/artin-bootstrap`, theorem)
Let F be an fppf sheaf on Sch/S. F is an algebraic space if either (a) F = U/R for a groupoid in algebraic spaces (U, R, s, t, c) with s, t flat and locally of finite presentation and j = (t, s) an equivalence relation, or (b) there is an algebraic space U and a morphism U -> F that is representable by algebraic spaces, surjective, flat and locally of finite presentation. Consequences: in (a), U -> U/R is surjective, flat and locally of finite presentation; a free action of a flat, locally finitely presented group space G on X has algebraic-space quotient X/G with X -> X/G a G-torsor; and being an algebraic space is fppf local on the base.

**Hypotheses and conventions.** Fppf sheaf F; flatness and local finite presentation of s, t (or of U -> F).

**Construction or proof.**
1. Bootstrap the diagonal: a sheaf with an fppf cover by a space whose diagonal is representable by spaces has diagonal representable by spaces (Stacks 80.5).
2. Reduce from flat finitely presented to quasi-finite flat equivalence relations by slicing (Stacks 80.8), then pass to an etale equivalence relation by finding opens and quotienting by a subgroupoid (Stacks 80.7, 80.9).
3. Conclude by SF.1/etale-quotient-theorem (Stacks Theorem 80.10.1, 04S6); deduce the consequences (Stacks Lemmas 80.11.1, 80.11.6, 80.11.7).

**Acceptance.** For G = μ_p acting freely on G_m by multiplication in characteristic p, G_m/μ_p is represented by G_m via s |-> s^p. The fppf quotient of a scheme by a free action of a finite flat group scheme is an algebraic space even when no invariant affine cover exists.

**Depends on.** this layer: `etale-quotient-theorem`, `quotient-sheaf`, `groupoid-space`, `quasi-finite-descent`; whole-roadmap SF.1 nodes: `algebraic-space`; libraries: `AlgebraicGeometry.Flat` (Mathlib), `AlgebraicGeometry.LocallyOfFinitePresentation` (Mathlib).

**Source.** The Stacks Project — Theorem 80.10.1 (04S6); Lemmas 80.11.1 (04SK), 80.11.6 (06PG), 80.11.7 (06PH).

## SF.1d. Algebraic stacks
Stacks in groupoids are Mathlib pseudofunctors LocallyDiscrete(Sch^op) -> Cat with groupoid fibres satisfying IsStack for the fppf topology (Giraud's definition); 1-morphisms are Mathlib strong transformations and 2-morphisms modifications. Through Mathlib's Grothendieck construction they are the stacks in groupoids of the Stacks Project. Representability by algebraic spaces, the algebraic and Deligne-Mumford conditions, separatedness and properness are separate notions with separate proofs; in particular a proper morphism of stacks need not be representable (BG -> S for G finite).

### Stacks in groupoids over the big fppf site (`SF.1/stack-in-groupoids`, definition)
A stack in groupoids over Sch (with the fppf topology) is a pseudofunctor X : LocallyDiscrete(Sch^op) -> Cat whose fibre categories X(T) are groupoids and which is a stack for Mathlib's fppfTopology (Mathlib IsStack: descent of morphisms and effective descent of objects, following Giraud). 1-morphisms are Mathlib strong transformations, 2-morphisms are modifications (all invertible). A stack over a scheme S is a stack with a 1-morphism to the stack represented by S. Every fppf sheaf F gives the stack in setoids T |-> F(T) (discrete groupoids); in particular every algebraic space and every scheme is a stack. Via Mathlib's Grothendieck construction these are the stacks in groupoids of Stacks Definition 8.5.1 (categories fibred in groupoids over Sch).

**Hypotheses and conventions.** Fibre categories in Cat.{u, u+1}; the fppf topology of Mathlib on Scheme.{u}.

**Construction or proof.**
1. Take Mathlib's Pseudofunctor and IsStack, and require IsGroupoid on each fibre.
2. Discrete stacks of sheaves: a presheaf of sets is a stack in setoids iff it is a sheaf (Stacks Lemma 8.6.3, 0432); for representables use subcanonicity.
3. 2-Yoneda: objects of X(T) correspond to 1-morphisms from the stack of T to X (Stacks Section 94.5).
4. Comparison with fibred categories: the projection of Mathlib's CoGrothendieck construction is fibred in groupoids exactly when the fibres are groupoids, and the descent conditions match Stacks Definition 8.5.1 (02ZI).

**API.**
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids` (data): The structure: a pseudofunctor with groupoid fibres satisfying IsStack for the fppf topology.
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.ofSheaf` (constructor): The stack in setoids T |-> F(T) of an fppf sheaf of sets F.
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.yonedaEquiv` (equivalence): 2-Yoneda: X(T) is equivalent to the groupoid of strong transformations from the stack of T to X.
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.isFiberedInGroupoids` (compatibility): The Grothendieck construction of X is fibred in groupoids over Sch and is a stack in groupoids in the sense of Stacks 8.5.1.
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.limit` (structure): 2-limits (in particular 2-fibre products, SF.1/two-fibre-product) of stacks in groupoids are stacks in groupoids.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_scheme` (compatibility): For a scheme X the discrete pseudofunctor T |-> Hom(T, X) is a stack in groupoids, by subcanonicity of the fppf topology.
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_torsors` (characterisation): For G flat and locally of finite presentation, T |-> groupoid of G-torsors over T is a stack in groupoids.
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_qcoh_not_groupoid` (non-example): The quasi-coherent pseudofunctor is a stack but not a stack in groupoids: the zero map O -> O is a non-invertible morphism in QCoh(T).
- `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_trivial_torsor_prestack` (non-example): For G = Z/2 over Spec R, the prestack whose fibre over T is the one-object groupoid with automorphism group G(T) is not a stack: the descent datum along Spec C -> Spec R given by the nontrivial cocycle is not effective in it.

**Uses.** SF.1/algebraic-stack and the other SF.1d stack nodes: the carrier of algebraic stacks and quotient stacks. StableReductionPartII:key/moduli-curves and MC.0 (requests to SF.1): groupoid-valued moduli pseudofunctors with coherent reindexing and the IsStack descent predicate. GlobalShtukasAndFunctionFieldLanglands:GS.0: Bun_G is a stack in groupoids on the global curve's test schemes. PrismaticCohomology:PR.0 (request to SF.1): 2-limits of stacks are stacks; the Cartier-Witt stack is an fpqc stack.

**Acceptance.** The stack of G-torsors is a stack in groupoids (SF.1/torsor-representability (c)).

**Depends on.** libraries: `CategoryTheory.Pseudofunctor` (Mathlib), `CategoryTheory.Pseudofunctor.IsStack` (Mathlib), `CategoryTheory.IsGroupoid` (Mathlib), `CategoryTheory.Pseudofunctor.StrongTrans` (Mathlib), `CategoryTheory.Pseudofunctor.CoGrothendieck` (Mathlib), `CategoryTheory.Functor.IsFibered` (Mathlib), `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib), `CategoryTheory.GrothendieckTopology.Subcanonical` (Mathlib), `CategoryTheory.Pseudofunctor.IsPrestack` (Mathlib).

**Source.** The Stacks Project — Definitions 8.4.1 (026F) and 8.5.1 (02ZI); Lemma 8.6.3 (0432); The Stacks Project — Section 94.4-94.5 (02ZQ, 04SS).

### Stackification of prestacks in groupoids (`SF.1/stackification`, construction)
For a pseudofunctor X in groupoids on Sch (not necessarily a stack), its fppf stackification is a stack in groupoids X^a with a 1-morphism η : X -> X^a such that for all x, y in X(T) the induced map identifies Isom_{X^a}(η x, η y) with the fppf sheafification of Isom_X(x, y), and every object of X^a(T) is fppf locally in the image of η. It is universal: 1-morphisms X^a -> Y to stacks in groupoids correspond, up to unique 2-isomorphism, to 1-morphisms X -> Y. For a presheaf of sets (discrete X) it is the sheafification.

**Hypotheses and conventions.** X a pseudofunctor in groupoids on Sch; fppf topology.

**Construction or proof.**
1. First make the morphism presheaves sheaves (the associated prestack), then add effective descent data: objects of X^a(T) are descent data in the prestack relative to fppf coverings of T, with morphisms compatible after refinement (Stacks Lemma 8.9.1, 02ZP).
2. Check that X^a is a stack in groupoids and that η is fully faithful on sheafified Isom presheaves and locally essentially surjective.
3. Universal property: a 1-morphism X -> Y to a stack extends uniquely along η because Y has effective descent (Stacks Lemma 8.9.2).
4. For discrete X, objects of X^a are sections of the sheafification, recovering Mathlib's presheafToSheaf.

**API.**
- `TauCeti.SchemeFoundations.Stacks.stackification` (data): The stack in groupoids X^a attached to a pseudofunctor in groupoids X.
- `TauCeti.SchemeFoundations.Stacks.stackification.η` (constructor): The canonical 1-morphism η : X -> X^a.
- `TauCeti.SchemeFoundations.Stacks.stackification.lift` (universal-property): A 1-morphism X -> Y to a stack factors through η uniquely up to unique 2-isomorphism.
- `TauCeti.SchemeFoundations.Stacks.stackification.isom_sheafify` (characterisation): Isom_{X^a}(η x, η y) is the fppf sheafification of Isom_X(x, y).
- `TauCeti.SchemeFoundations.Stacks.stackification.locally_essSurj` (characterisation): Every object of X^a(T) is, after an fppf covering of T, isomorphic to the image of an object of X.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.stackification.test_stack` (degenerate): If X is already a stack in groupoids then η : X -> X^a is an equivalence.
- `TauCeti.SchemeFoundations.Stacks.stackification.test_sheafification` (compatibility): For a presheaf of sets F viewed as a discrete prestack, F^a is the discrete stack of Mathlib's fppf sheafification of F.
- `TauCeti.SchemeFoundations.Stacks.stackification.test_real_torsors` (computation): For Z/2 acting trivially on Spec R, the stackification of the one-object prestack with automorphisms Z/2 has two isomorphism classes of objects over Spec R (the trivial torsor and Spec C), matching H^1(R, Z/2) = R^x/(R^x)^2.

**Uses.** SF.1/quotient-stack: [U/R] and [X/G] are stackifications of groupoid prestacks. DiamondsAndVStacks:D0 (ordinary groupoid-valued prestacks): stackification is planned there for ordinary sites; it moves down to this node and D0 imports it. StableReductionPartII:MC.0 (request to SF.1): fppf descent of fibred-groupoid moduli objects. Stacks Definition 78.20.1: quotient stacks are defined by stackification.

**Acceptance.** The quotient stack [U/R] is the stackification of the groupoid prestack (SF.1/quotient-stack).

**Depends on.** this layer: `stack-in-groupoids`; libraries: `CategoryTheory.Pseudofunctor.DescentData` (Mathlib), `CategoryTheory.presheafToSheaf` (Mathlib), `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib).

**Source.** The Stacks Project — Lemma 8.9.1 (02ZP) and Section 8.9 (02ZO).

### 2-fibre products of stacks in groupoids (`SF.1/two-fibre-product`, construction)
For 1-morphisms f : X -> Z and g : Y -> Z of stacks in groupoids, the 2-fibre product X x_Z Y has fibre over T the categorical pullback of f_T and g_T (Mathlib CategoricalPullback: triples (x, y, φ : f x ≅ g y)), with pullbacks induced from those of X, Y, Z. It is a stack in groupoids, comes with projections and a 2-isomorphism f p_1 ≅ g p_2, and is the 2-fibre product in the (2,1)-category of stacks in groupoids. For stacks of sheaves it is the stack of the fibre product of sheaves.

**Hypotheses and conventions.** X, Y, Z stacks in groupoids over Sch; strong transformations f, g.

**Construction or proof.**
1. Fibrewise categorical pullbacks of groupoids are groupoids; the pseudofunctoriality constraints of X, Y, Z induce those of the pullback (Stacks Categories Lemma 4.32.3).
2. Isom presheaves of the pullback are fibre products of sheaves, hence sheaves; effective descent follows componentwise (Stacks Lemma 8.5.6, 02ZL).
3. The universal property is Mathlib's CategoricalPullback.functorEquiv applied fibrewise and natural in T.
4. For discrete stacks the categorical pullback of sets is the set-theoretic fibre product.

**API.**
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct` (data): The stack in groupoids X x_Z Y.
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.fst` (projection): The projection X x_Z Y -> X.
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.snd` (projection): The projection X x_Z Y -> Y.
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.iso` (data): The 2-isomorphism f . fst ≅ g . snd.
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.lift` (universal-property): 1-morphisms W -> X x_Z Y correspond to pairs W -> X, W -> Y with a 2-isomorphism between the composites to Z.
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.ofSheaf` (compatibility): For fppf sheaves, the 2-fibre product of their stacks is the stack of the fibre product of sheaves.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_identity` (degenerate): X x_Z Z (along the identity of Z) is equivalent to X.
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_schemes` (compatibility): For schemes X -> Z <- Y, the 2-fibre product of their stacks is the stack of X x_Z Y.
- `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_classifying` (non-example): For a group space G over S and the trivial torsor S -> BG, S x_{BG} S is (the stack of) G, whereas the strict 1-categorical pullback of the two maps would be S.

**Uses.** SF.1/representable-stack-morphism: representability is tested on 2-fibre products with schemes. SF.1/root-stack: root stacks are 2-fibre products with the n-th power map of [A^1/G_m]. DiamondsAndVStacks:D0: 2-fibre products of ordinary groupoid-valued stacks move down to this node. StableReductionPartII:MC.0 (request to SF.1): representable morphisms of fibred groupoids and their 2-fibre products (universal curve).

**Acceptance.** The diagonal X -> X x_S X and the inertia X x_{X x X} X are formed with this construction (SF.1/inertia).

**Depends on.** this layer: `stack-in-groupoids`; libraries: `CategoryTheory.Limits.CategoricalPullback` (Mathlib).

**Source.** The Stacks Project — Lemma 8.5.6 (02ZL); Chapter 4, Section 4.31 (003O); The Stacks Project — Lemma 94.14.3 (04T2).

### Morphisms representable by algebraic spaces (`SF.1/representable-stack-morphism`, definition)
A 1-morphism f : X -> Y of stacks in groupoids is representable by algebraic spaces if for every scheme T and every object y of Y(T) (a 1-morphism T -> Y) the 2-fibre product T x_Y X is equivalent to the stack of an algebraic space over T. For a property P of morphisms of algebraic spaces stable under base change and local on the target, f has P if every such base change T x_Y X -> T has P. The diagonal of X is representable by algebraic spaces iff every 1-morphism from a scheme to X is, iff all Isom sheaves Isom(x, y) on Sch/T are algebraic spaces.

**Hypotheses and conventions.** X, Y stacks in groupoids; algebraic spaces as in SF.1/algebraic-space-category.

**Construction or proof.**
1. Use SF.1/two-fibre-product to form T x_Y X and SF.1/stack-in-groupoids for the stack of an algebraic space (Stacks Definition 94.9.1, 02ZW).
2. Base change and composition stability follow from pasting 2-fibre products (Stacks Lemmas 94.9.2-94.9.5).
3. Diagonal criterion: T x_{X x X} X for (x, y) : T -> X x X is the sheaf Isom(x, y), and the map from T' x_X T to T' x T is a base change of the diagonal (Stacks 94.10).
4. For morphisms of algebraic spaces every base change to a scheme is an algebraic space, so all morphisms of spaces are representable by algebraic spaces.

**API.**
- `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces` (data): f is representable by algebraic spaces.
- `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces.baseChange` (structure): Representability is stable under base change along any 1-morphism Y' -> Y.
- `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces.comp` (structure): Representability is stable under composition.
- `TauCeti.SchemeFoundations.Stacks.diag_representable_iff` (characterisation): The diagonal of X is representable by algebraic spaces iff every 1-morphism from a scheme to X is, iff all Isom sheaves are algebraic spaces.
- `TauCeti.SchemeFoundations.Stacks.RepresentableProperty` (data): For P stable under base change and local on the target, the property P of a representable f, tested on base changes to schemes.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.Representable.test_identity` (degenerate): The identity of a stack in groupoids is representable by algebraic spaces.
- `TauCeti.SchemeFoundations.Stacks.Representable.test_spaces` (compatibility): Every morphism between (stacks of) algebraic spaces is representable by algebraic spaces.
- `TauCeti.SchemeFoundations.Stacks.Representable.test_point_to_BG` (computation): The morphism S -> BG of the trivial torsor is representable, with T x_{BG} S = P for P -> T the torsor corresponding to T -> BG.
- `TauCeti.SchemeFoundations.Stacks.Representable.test_BG_to_point` (non-example): For a nontrivial finite group G over an algebraically closed field k, BG -> Spec k is not representable by algebraic spaces: its base change to Spec k is BG, whose k-point has automorphism group G.

**Uses.** SF.1/algebraic-stack: the diagonal of an algebraic stack is representable by algebraic spaces. SF.1/stack-morphism-properties: for representable morphisms properties are tested on base changes. StableReductionPartII:MC.0 (request to SF.1): the universal curve over the moduli stack is a representable proper flat morphism. SF.1 stage acceptance: representability is a separate proof from properness.

**Acceptance.** The morphism from a scheme to BG given by the trivial torsor is representable, with fibre over P -> T equal to P.

**Depends on.** this layer: `two-fibre-product`, `stack-in-groupoids`, `algebraic-space-category`, `space-fibre-products`; libraries: `CategoryTheory.Functor.relativelyRepresentable` (Mathlib), `CategoryTheory.Functor.relativelyRepresentable.diag_iff` (Mathlib).

**Source.** The Stacks Project — Definition 94.9.1 (02ZW) and Section 94.10 (03YJ).

### Algebraic stacks (`SF.1/algebraic-stack`, definition)
An algebraic (Artin) stack over S is a stack in groupoids X over Sch/S (fppf) such that the diagonal X -> X x_S X is representable by algebraic spaces and there is a scheme U with a 1-morphism U -> X that is smooth and surjective (as a representable morphism, by SF.1/representable-stack-morphism). No separatedness, quasi-compactness or finiteness is imposed, and stabilizers need not be finite or reduced.

**Hypotheses and conventions.** Stacks over S as in SF.1/stack-in-groupoids; smooth and surjective tested on base changes to schemes.

**Construction or proof.**
1. Stacks Definition 94.12.1 (026O): the three conditions of a stack in groupoids, representable diagonal, and a smooth surjective atlas from a scheme.
2. Algebraic spaces are algebraic stacks: their diagonals are representable by schemes and an etale atlas is smooth (Stacks Lemma 94.13.1).
3. 2-fibre products of algebraic stacks are algebraic stacks (Stacks Lemma 94.14.3, 04T2).
4. Equivalence invariance: all three conditions are invariant under equivalence of stacks.

**API.**
- `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack` (data): The predicate: representable diagonal and a smooth surjective atlas from a scheme.
- `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.diagonal` (projection): The diagonal of an algebraic stack is representable by algebraic spaces.
- `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.atlas` (projection): An algebraic stack has a scheme U and a smooth surjective 1-morphism U -> X.
- `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.ofSpace` (constructor): The stack of an algebraic space is algebraic.
- `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.twoFiberProduct` (structure): 2-fibre products of algebraic stacks are algebraic.
- `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.of_equiv` (compatibility): Algebraicity is invariant under equivalence of stacks.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_scheme` (degenerate): The stack of a scheme is an algebraic stack.
- `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_BGm` (computation): BG_m over Spec Z is an algebraic stack with smooth atlas Spec Z -> BG_m.
- `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_qcoh` (non-example): The quasi-coherent pseudofunctor is not an algebraic stack: it is not a stack in groupoids.
- `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_formal_disc` (non-example): The fppf sheaf Spf k[[t]] (colimit of Spec k[t]/(t^n)) has representable diagonal but is not an algebraic stack: a flat morphism to it from a nonempty scheme would make a nonzero flat module over an Artinian k[t]/(t^m) killed by a nonzero nilpotent ideal.

**Uses.** SF.1/deligne-mumford-stack, SF.1/stack-morphism-properties, SF.1/coarse-moduli-space: the class of stacks on which these notions are defined. AlgebraicModuliForArithmeticGeometry:R09.4: moduli-stack algebraicity for generalised elliptic curves and polarised abelian schemes is proved for this notion (R09.4 narrowed to those results). GlobalShtukasAndFunctionFieldLanglands:GS.0 and GS.2: Bun_G and shtuka stacks are algebraic stacks. algebraicgeometry/quotient-stacks key definition (co-owner SF.1): algebraic and Deligne-Mumford stack conditions defined separately.

**Acceptance.** Quotient stacks [X/G] for G smooth (or flat and locally of finite presentation) are algebraic (SF.1/quotient-stack-algebraic).

**Depends on.** this layer: `stack-in-groupoids`, `representable-stack-morphism`, `two-fibre-product`; whole-roadmap SF.1 nodes: `algebraic-space`; libraries: `AlgebraicGeometry.Smooth` (Mathlib), `AlgebraicGeometry.Surjective` (Mathlib).

**Source.** The Stacks Project — Definition 94.12.1 (026O), Lemma 94.14.3 (04T2).

### Deligne-Mumford stacks (`SF.1/deligne-mumford-stack`, definition)
An algebraic stack X is Deligne-Mumford if there is a scheme W and an etale surjective 1-morphism W -> X. Equivalently (Stacks Theorem 101.21.6) its diagonal is unramified, i.e. X is DM in the sense of Definition 101.4.1. A morphism f : X -> Y of algebraic stacks is DM if its diagonal is unramified.

**Hypotheses and conventions.** X an algebraic stack; unramified = formally unramified and locally of finite type, for representable morphisms.

**Construction or proof.**
1. Definition by an etale atlas (Stacks Definition 94.12.2, 03YO).
2. Etale atlas implies unramified diagonal (Stacks Lemma 101.4.14); the converse uses residual gerbes at finite type points to build etale local charts (Stacks Theorem 101.21.6, 06N3).
3. Algebraic spaces are Deligne-Mumford (etale atlas); 2-fibre products of DM stacks are DM.

**API.**
- `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford` (data): The predicate: an algebraic stack with an etale surjective atlas from a scheme.
- `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.iff_unramified_diagonal` (characterisation): X is Deligne-Mumford iff its diagonal is unramified (Stacks 06N3).
- `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.isAlgebraic` (projection): A Deligne-Mumford stack is algebraic.
- `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.ofSpace` (constructor): Algebraic spaces are Deligne-Mumford stacks.
- `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.twoFiberProduct` (structure): 2-fibre products of Deligne-Mumford stacks are Deligne-Mumford.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.DM.test_space` (degenerate): The stack of an algebraic space is Deligne-Mumford.
- `TauCeti.SchemeFoundations.Stacks.DM.test_finite_etale` (computation): For a finite constant group G over S, BG is Deligne-Mumford with etale atlas S -> BG.
- `TauCeti.SchemeFoundations.Stacks.DM.test_mu_p` (non-example): Over F_p, Bμ_p is algebraic but not Deligne-Mumford: its diagonal has fibre μ_p, which is not unramified.
- `TauCeti.SchemeFoundations.Stacks.DM.test_BGm` (non-example): BG_m is not Deligne-Mumford: the stabilizer G_m is positive dimensional.

**Uses.** SF.1/root-stack: root stacks are Deligne-Mumford exactly when n is invertible along the divisor. SF.1/keel-mori and WeilConjectures:WC.6 (request to SF.1): separated DM stacks of finite type over F_q have proper coarse spaces. DeligneWeightsAndPurity:DWP.7 (request to SF.1): etale cohomology of DM stacks of finite type over F_q is defined on this class. GlobalShtukasAndFunctionFieldLanglands:GS.2: Deligne-Mumford statements for shtuka stacks with stabilizer hypotheses.

**Acceptance.** For G finite etale, [X/G] is Deligne-Mumford (SF.1/quotient-stack-algebraic).

**Depends on.** this layer: `algebraic-stack`, `representable-stack-morphism`; libraries: `AlgebraicGeometry.Etale` (Mathlib), `AlgebraicGeometry.FormallyUnramified` (Mathlib).

**Source.** The Stacks Project — Definition 94.12.2 (03YO); The Stacks Project — Definition 101.4.1 (04YW) and Theorem 101.21.6 (06N3).

### Inertia stacks and automorphism group spaces (`SF.1/inertia`, construction)
For a stack in groupoids X, the inertia stack I_X has fibre over T the groupoid of pairs (x, a) with x in X(T) and a in Aut(x), morphisms (x, a) -> (y, b) the isomorphisms φ with b φ = φ a; it is equivalent to X x_{Δ, X x X, Δ} X. For f : X -> Y the relative inertia I_{X/Y} uses automorphisms mapping to identities in Y. If X is algebraic, I_X -> X is representable by algebraic spaces, locally of finite type and a group algebraic space over X; for x : Spec K -> X the automorphism group space is G_x = x^* I_X.

**Hypotheses and conventions.** X a stack in groupoids (algebraic for the representability statements).

**Construction or proof.**
1. Define the inertia fibred category and identify it with the 2-fibre product of the diagonal with itself (Stacks Categories Lemma 4.34.1); it is a stack (Stacks Lemma 8.7.1, 036Y).
2. For algebraic X, I_X -> X is the base change of the diagonal along the diagonal, hence representable by algebraic spaces and locally of finite type (Stacks Lemma 101.5.1, 050Q).
3. Composition of automorphisms makes I_X a group space over X; automorphism group spaces of field points are its fibres (Stacks Section 101.19, 0DTS).

**API.**
- `TauCeti.SchemeFoundations.Stacks.inertia` (data): The inertia stack I_X with projection to X.
- `TauCeti.SchemeFoundations.Stacks.inertia.equivDiagonal` (equivalence): I_X is equivalent to X x_{Δ, X x X, Δ} X.
- `TauCeti.SchemeFoundations.Stacks.inertia.representable` (characterisation): For algebraic X, I_X -> X is representable by algebraic spaces and locally of finite type.
- `TauCeti.SchemeFoundations.Stacks.relativeInertia` (data): The relative inertia I_{X/Y} of a 1-morphism X -> Y.
- `TauCeti.SchemeFoundations.Stacks.automorphismGroup` (constructor): The automorphism group space G_x = x^* I_X of a field-valued point x.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.inertia.test_space` (degenerate): For an algebraic space X, I_X -> X is an equivalence (all automorphism groups trivial).
- `TauCeti.SchemeFoundations.Stacks.inertia.test_BG` (computation): For a group space G over S, I_{BG} is equivalent to [G/G] for the conjugation action; for G abelian it is G x BG.
- `TauCeti.SchemeFoundations.Stacks.inertia.test_S3` (non-example): For G = S_3 over an algebraically closed field, the geometric points of I_{BG} up to isomorphism are the 3 conjugacy classes of S_3, not its 6 elements.

**Uses.** SF.1/setoid-criterion and SF.1/fine-moduli-space: trivial inertia characterises algebraic spaces. SF.1/keel-mori and SF.1/tame-stack: finite inertia and linearly reductive stabilizers. AlgebraicModuliForArithmeticGeometry:R09.4 (inertia-stack node): planned there for groupoid-valued stacks; moves down to this node. algebraicgeometry/inertia key definition (co-owner SF.1): ordinary and relative inertia.

**Acceptance.** I_{[U/R]} is the quotient stack of the stabilizer of (U, R) by the conjugation groupoid (Stacks Lemma 78.26.1).

**Depends on.** this layer: `two-fibre-product`, `stack-in-groupoids`, `algebraic-stack`, `representable-stack-morphism`, `stabilizer`; libraries: `CategoryTheory.Aut` (Mathlib).

**Source.** The Stacks Project — Section 8.7 (036X), Lemmas 8.7.1 (036Y) and 8.7.2 (04ZM); The Stacks Project — Lemma 101.5.1 (050Q), Lemma 101.19.1 (0DTS); The Stacks Project — Lemma 78.26.1 (06PB).

### Algebraic stacks with trivial inertia are algebraic spaces (`SF.1/setoid-criterion`, theorem)
For an algebraic stack X over S the following are equivalent: (1) X is a stack in setoids; (2) the 1-morphism I_X -> X is an equivalence; (3) X is equivalent to the stack of an algebraic space. In particular, if some object of X over an algebraically closed field has a nontrivial automorphism, X is not an algebraic space.

**Hypotheses and conventions.** X an algebraic stack.

**Construction or proof.**
1. (1) <=> (2): Stacks Lemma 8.7.2 (04ZM).
2. (3) => (1): algebraic spaces are discrete stacks.
3. (1) => (3): a stack in setoids is the stack of its sheaf of isomorphism classes F (Stacks Lemma 8.6.3); the diagonal of F is representable by algebraic spaces and F has a smooth cover, so F is an algebraic space by SF.1/artin-bootstrap (Stacks Proposition 94.13.3, 04SZ).

**Acceptance.** BG for a nontrivial finite group G over an algebraically closed field is not an algebraic space.

**Depends on.** this layer: `inertia`, `algebraic-stack`, `stack-in-groupoids`, `artin-bootstrap`.

**Source.** The Stacks Project — Proposition 94.13.3 (04SZ).

### Properties of morphisms of algebraic stacks (`SF.1/stack-morphism-properties`, definition)
Let f : X -> Y be a morphism of algebraic stacks. (a) For P a property of morphisms of algebraic spaces smooth local on the source-and-target (smooth, flat, locally of finite presentation or type, surjective), f has P if for smooth atlases V -> Y and U -> X x_Y V the composite U -> V has P; this does not depend on the atlases. (b) f is DM, quasi-DM, separated or quasi-separated if its diagonal Δ_f (representable by algebraic spaces) is unramified, locally quasi-finite, proper, or quasi-compact and quasi-separated. (c) f is quasi-compact if X x_Y V is quasi-compact for affine V -> Y, universally closed if |Z x_Y X| -> |Z| is closed for every Z -> Y, of finite type if locally of finite type and quasi-compact, and proper if separated, of finite type and universally closed. For representable f these agree with SF.1/representable-stack-morphism. Representability and properness are independent conditions.

**Hypotheses and conventions.** Algebraic stacks; |.| from SF.1/space-points; properties of morphisms of spaces from SF.1/etale-local-properties and SF.1/separation-properness-spaces.

**Construction or proof.**
1. (a) Independence of atlases: Stacks Lemma 101.16.1 and Definition 101.16.2 (06FN).
2. (b) Stacks Definition 101.4.1 (04YW), using that Δ_f is representable by algebraic spaces.
3. (c) Universally closed via underlying spaces (Stacks Definition 101.13.2, 0513), proper by Stacks Definition 101.37.1 (0CL5).
4. Compatibility with the representable notions by comparing on base changes to schemes.

**API.**
- `TauCeti.SchemeFoundations.Stacks.SmoothLocal` (data): The property P of a morphism of algebraic stacks for P smooth local on source-and-target.
- `TauCeti.SchemeFoundations.Stacks.SmoothLocal.atlas_independent` (characterisation): SmoothLocal P f holds for some pair of atlases iff it holds for every pair.
- `TauCeti.SchemeFoundations.Stacks.IsSeparatedStack` (data): f is separated: Δ_f is proper.
- `TauCeti.SchemeFoundations.Stacks.IsProperStack` (data): f is proper: separated, of finite type and universally closed.
- `TauCeti.SchemeFoundations.Stacks.IsProperStack.of_representable` (compatibility): For representable f, properness agrees with properness of all base changes to schemes.
- `TauCeti.SchemeFoundations.Stacks.IsProperStack.baseChange` (structure): Proper morphisms of algebraic stacks are stable under base change and composition.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.Properties.test_BG_finite` (computation): For a finite constant group G over S, BG -> S is proper and etale but not representable by algebraic spaces (when G is nontrivial).
- `TauCeti.SchemeFoundations.Stacks.Properties.test_BGm` (non-example): BG_m -> Spec Z is smooth and of finite type but not separated: its diagonal has fibres G_m, which are not proper.
- `TauCeti.SchemeFoundations.Stacks.Properties.test_doubled_origin` (non-example): The affine line with doubled origin over k is of finite type and not proper (not separated).
- `TauCeti.SchemeFoundations.Stacks.Properties.test_projective_line` (compatibility): P^1_k -> Spec k is representable and proper, agreeing with Mathlib's IsProper.

**Uses.** SF.1 stage acceptance: representability and properness are separate proofs. SF.1/keel-mori and SF.1/coarse-moduli-space: proper quasi-finite coarse maps; separated stacks have separated coarse spaces. AlgebraicModuliForArithmeticGeometry:A0-extension (request to SF.1): BK -> C is a proper etale non-representable morphism for finite etale K. GlobalShtukasAndFunctionFieldLanglands:GS.0 and DrinfeldModulesAndTModules:DM.3: finite type, separatedness and non-properness of Bun_G and moduli of Drinfeld modules.

**Acceptance.** BG -> S is proper but not representable for G finite etale over S.

**Depends on.** this layer: `algebraic-stack`, `representable-stack-morphism`, `space-points`, `etale-local-properties`, `separation-properness-spaces`.

**Source.** The Stacks Project — Definitions 101.4.1 (04YW), 101.13.2 (0513), 101.16.2 (06FN), 101.37.1 (0CL5).

### Presentations of algebraic stacks and atlas independence (`SF.1/stack-presentation`, theorem)
(a) For a groupoid (U, R, s, t, c) in algebraic spaces with s, t smooth, the quotient stack [U/R] is algebraic, U -> [U/R] is smooth and surjective, and R is equivalent to U x_{[U/R]} U. (b) If s, t are only flat and locally of finite presentation, [U/R] is still algebraic (Artin), with U -> [U/R] flat, surjective and locally of finite presentation. (c) For every algebraic stack X and smooth surjective U -> X from an algebraic space, R = U x_X U is a smooth groupoid and the canonical [U/R] -> X is an equivalence. (d) Properties of algebraic stacks and their morphisms defined through atlases do not depend on the chosen presentation.

**Hypotheses and conventions.** (a) s, t smooth; (b) s, t flat and locally of finite presentation; (c) U -> X smooth surjective.

**Construction or proof.**
1. (a) Stacks Theorem 94.17.3 (04TK): [U/R] is a stack in groupoids by construction, its diagonal is representable by Stacks Lemma 94.17.1, and an etale cover W -> U gives a smooth surjective atlas; R = U x_{[U/R]} U by Stacks Lemma 78.22.2 (04M9).
2. (b) Artin's theorem (Stacks Theorem 97.16.1, 06DC): a stack receiving a flat, locally finitely presented, surjective morphism representable by algebraic spaces from an algebraic space is algebraic; its proof finds a smooth atlas inside the stack of finite locally free subobjects (Stacks 97.14-97.15). Apply it to U -> [U/R] (Stacks Theorem 97.17.2, 06FI).
3. (c) Stacks Lemma 94.16.2 (04T5): s, t are base changes of U -> X, and [U/R] -> X is fully faithful and locally essentially surjective.
4. (d) Two presentations are compared through U x_X U', and smooth-local properties are independent of atlases (Stacks Lemma 101.16.1).

**Acceptance.** [A^1/G_m] is presented by A^1 with R = G_m x A^1. BG for G flat and locally of finite presentation (for instance μ_p) is algebraic.

**Depends on.** this layer: `algebraic-stack`, `groupoid-space`, `stackification`, `two-fibre-product`, `artin-bootstrap`, `stack-morphism-properties`.

**Source.** The Stacks Project — Theorem 94.17.3 (04TK), Lemma 94.16.2 (04T5), Theorems 97.16.1 (06DC) and 97.17.2 (06FI); The Stacks Project — Lemma 78.22.2 (04M9).

### Quotient stacks (`SF.1/quotient-stack`, construction)
For a groupoid (U, R, s, t, c) in algebraic spaces over B, the quotient stack [U/R] is the stackification of the prestack T |-> (U(T), R(T)) (the groupoid on T-points). For an action of a group algebraic space G on X over B, [X/G] := [X/(G x_B X)]; when G is flat and locally of finite presentation its objects over T are equivalent to pairs (P, φ) of an fppf G-torsor P over T (over T x_S B) and a G-equivariant morphism φ : P -> X, with isomorphisms the equivariant isomorphisms of torsors commuting with the maps. BG := [B/G] is the stack of G-torsors. The canonical 1-morphism π : X -> [X/G] sends x : T -> X to the trivial torsor G_T with φ(g) = g x.

**Hypotheses and conventions.** (U, R) a groupoid in algebraic spaces; for the torsor description G -> B flat and locally of finite presentation.

**Construction or proof.**
1. Apply SF.1/stackification to the groupoid prestack (Stacks Definition 78.20.1, 044Q).
2. Torsor description: the stack [[X/G]] of pairs (P, φ) is a stack in groupoids (Stacks Lemma 95.15.2, using SF.1/torsor-representability for descent of torsors), and the canonical map from the groupoid prestack sends x to the trivial torsor; it is fully faithful on sheafified Isom and locally essentially surjective, so it induces [X/G] ≅ [[X/G]] (Stacks Proposition 95.15.3, 04WM).
3. The square formed by π with the action groupoid is 2-cartesian: X x_{[X/G]} X = G x_B X (Stacks Lemma 78.22.2), and [U/R] is the 2-coequalizer of R ⇉ U (Stacks Lemma 78.23.2, 044U).
4. Morphisms [X/G] -> Y to algebraic spaces correspond to G-invariant morphisms X -> Y (Stacks Lemma 106.12.2).

**API.**
- `TauCeti.SchemeFoundations.Stacks.quotientStack` (data): The quotient stack [U/R] of a groupoid in algebraic spaces.
- `TauCeti.SchemeFoundations.Stacks.actionQuotient` (constructor): The quotient stack [X/G] of an action, and BG = [B/G].
- `TauCeti.SchemeFoundations.Stacks.actionQuotient.torsorEquiv` (equivalence): For G flat and locally of finite presentation, [X/G](T) is equivalent to the groupoid of pairs (G-torsor P over T, equivariant P -> X).
- `TauCeti.SchemeFoundations.Stacks.quotientStack.π` (projection): The canonical 1-morphism U -> [U/R].
- `TauCeti.SchemeFoundations.Stacks.quotientStack.isCartesian` (characterisation): U x_{[U/R]} U is equivalent to R, compatibly with s and t.
- `TauCeti.SchemeFoundations.Stacks.quotientStack.desc` (universal-property): [U/R] is the 2-coequalizer of R ⇉ U; morphisms to algebraic spaces correspond to R-invariant morphisms from U.
- `TauCeti.SchemeFoundations.Stacks.quotientStack.torsor` (example): For a G-torsor P -> Y, [P/G] is equivalent to Y.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_trivial_group` (degenerate): [X/1] is equivalent to X.
- `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_BG_points` (computation): For a finite constant group G over an algebraically closed field k, BG has one isomorphism class of k-points, with automorphism group G.
- `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_real_points` (non-example): For Z/2 acting trivially on Spec R, [Spec R/(Z/2)](Spec R) has two isomorphism classes (Spec R ⊔ Spec R and Spec C), while the unstackified action groupoid has one object; omitting stackification is wrong.
- `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_torsor` (characterisation): For the trivial torsor G -> B, [G/G] is equivalent to B.

**Uses.** SF.1/quotient-stack-algebraic and SF.1/root-stack: algebraicity of quotient stacks; [A^1/G_m] in root stacks. WeilConjectures:WC.0 (request to SF.1): quotient stacks [Y/G], their F_q-point torsor/action groupoids, and the equivalence with the action groupoid when H^1(F_q, G) = 1. LanglandsParameterStacks LP1 (request to SF.1): the algebraic quotient-stack interface and smooth charts for parameter stacks. AlgebraicModuliForArithmeticGeometry:R09.4: quotient-stack presentations of moduli stacks (R09.4 keeps only the moduli-specific algebraicity). algebraicgeometry/quotient-stacks key definition (co-owner SF.1): the general quotient stack and its atlas.

**Acceptance.** [X/1] = X; [P/G] = Y for a G-torsor P -> Y.

**Depends on.** this layer: `stackification`, `groupoid-space`, `group-action`, `torsor`, `torsor-representability`, `two-fibre-product`.

**Source.** The Stacks Project — Definition 78.20.1 (044Q), Lemmas 78.22.2 (04M9), 78.23.2 (044U), 78.26.1 (06PB); The Stacks Project — Lemma 95.15.2 (0370) and Proposition 95.15.3 (04WM).

### Algebraicity of quotient stacks and stabilizer conditions (`SF.1/quotient-stack-algebraic`, theorem)
Let G be a group algebraic space over B acting on an algebraic space X over B. (a) If G -> B is flat and locally of finite presentation, [X/G] is an algebraic stack and X -> [X/G] is representable by algebraic spaces, surjective, flat and locally of finite presentation (a G-torsor); if G -> B is smooth, X -> [X/G] is a smooth atlas. (b) [X/G] is Deligne-Mumford iff all stabilizer group spaces G_x of geometric points are unramified (for example if G -> B is etale). (c) [X/G] is equivalent to an algebraic space iff the action is free, and then [X/G] = X/G.

**Hypotheses and conventions.** G -> B flat and locally of finite presentation (smooth for the smooth atlas).

**Construction or proof.**
1. (a) Apply SF.1/stack-presentation (a), (b) to the action groupoid, whose s is a base change of G -> B and t = s composed with the inverse automorphism (Stacks Theorems 94.17.3 and 97.17.2).
2. (b) The inertia of [X/G] is the quotient of the stabilizer (Stacks Lemma 78.26.1), so the diagonal is unramified iff the stabilizers are (Stacks Theorem 101.21.6).
3. (c) Trivial inertia iff trivial stabilizers iff free action (SF.1/stabilizer); then SF.1/setoid-criterion identifies [X/G] with its sheaf of isomorphism classes, which is X/G (SF.1/artin-bootstrap).

**Acceptance.** [A^1/G_m] is algebraic and not Deligne-Mumford. Over F_p, [Spec F_p/μ_p] = Bμ_p is algebraic (μ_p flat of finite presentation) and not Deligne-Mumford. For a finite constant group G, [X/G] is Deligne-Mumford.

**Depends on.** this layer: `stack-presentation`, `quotient-stack`, `deligne-mumford-stack`, `setoid-criterion`, `stabilizer`, `inertia`, `artin-bootstrap`.

**Source.** The Stacks Project — Theorems 94.17.3 (04TK) and 97.17.2 (06FI); The Stacks Project — Theorem 101.21.6 (06N3); The Stacks Project — Lemma 78.26.1 (06PB).

### The stack [A^1/G_m] classifies line bundles with a section (`SF.1/line-bundle-section-stack`, theorem)
Let G_m act on A^1 over Spec Z by scaling. The quotient stack [A^1/G_m] is equivalent to the stack whose objects over T are pairs (L, s) with L an invertible O_T-module (Tau Ceti InvertibleSheaf T) and s in Γ(T, L), with isomorphisms of line bundles carrying sections to sections; BG_m is equivalent to the stack of invertible sheaves. For n >= 1 the n-th power θ_n : (L, s) |-> (L^{(x)n}, s^n) is a 1-morphism [A^1/G_m] -> [A^1/G_m].

**Hypotheses and conventions.** G_m = Spec Z[t, t^{-1}] with the scaling action on A^1.

**Construction or proof.**
1. A G_m-torsor P over T corresponds to the invertible sheaf L of G_m-equivariant functions of weight one (Poonen Example 6.5.5, frames of a line bundle), and an equivariant map P -> A^1 to a section of L (Cadman, Section 2.2).
2. Use the torsor description of [A^1/G_m] from SF.1/quotient-stack; isomorphisms correspond on both sides.
3. θ_n is induced by the homomorphism t |-> t^n and the map x |-> x^n, which are compatible.

**Acceptance.** The isomorphism class of (O_T, 0) is the image of the origin; the open substack s ≠ 0 is equivalent to the point.

**Depends on.** this layer: `quotient-stack`, `torsor`, `torsor-cohomology`; libraries: `TauCeti.AlgebraicGeometry.InvertibleSheaf` (Tau Ceti).

**Source.** Charles Cadman, Using stacks to impose tangency conditions on curves — Section 2.2, p. 6 (identification of the CFG A with [A^1/G_m]); Bjorn Poonen, Rational points on varieties — Example 6.5.5, p. 180.

### Root stacks of line bundles with sections (`SF.1/root-stack`, construction)
Let X be a scheme (or an algebraic stack), L an invertible sheaf on X with a section s, and n >= 1. The root stack X_{(L,s),n} is the 2-fibre product of (L, s) : X -> [A^1/G_m] with θ_n : [A^1/G_m] -> [A^1/G_m]. Its objects over T are quadruples (f : T -> X, M invertible on T, t in Γ(T, M), φ : M^{(x)n} ≅ f^*L with φ(t^n) = f^*s). For an effective Cartier divisor D, X_{D,n} := X_{(O(D), s_D), n}.

**Hypotheses and conventions.** n >= 1 arbitrary; no invertibility of n is assumed in the construction.

**Construction or proof.**
1. Form the 2-fibre product with SF.1/two-fibre-product and SF.1/line-bundle-section-stack; unwinding gives Cadman's description (Definitions 2.1 and 2.5).
2. Base change: for g : Y -> X, Y x_X X_{(L,s),n} = Y_{(g^*L, g^*s),n} (Cadman Proposition 2.4), by pasting 2-fibre products.
3. Local chart: if L = O on an affine Spec R with s = f, then X_{(L,s),n} = [Spec R[t]/(t^n - f)/μ_n], from the presentation of θ_n by the μ_n-torsor x |-> x^n.
4. Algebraicity follows from SF.1/quotient-stack-algebraic with G = μ_n flat of finite presentation; it is Deligne-Mumford iff n is invertible on V(s) (Cadman Theorem 2.2 when n is invertible on X).

**API.**
- `TauCeti.SchemeFoundations.Stacks.rootStack` (data): The root stack X_{(L,s),n} with its projection to X.
- `TauCeti.SchemeFoundations.Stacks.rootStack.baseChange` (compatibility): For g : Y -> X, Y x_X X_{(L,s),n} is equivalent to Y_{(g^*L, g^*s), n}.
- `TauCeti.SchemeFoundations.Stacks.rootStack.one` (simp): X_{(L,s),1} is equivalent to X.
- `TauCeti.SchemeFoundations.Stacks.rootStack.isIso_away` (characterisation): Over X \ V(s) the projection X_{(L,s),n} -> X is an equivalence.
- `TauCeti.SchemeFoundations.Stacks.rootStack.affineChart` (example): For X = Spec R, L = O, s = f: X_{(L,s),n} is equivalent to [Spec R[t]/(t^n - f)/μ_n] with μ_n acting by ζ.t = ζ t.
- `TauCeti.SchemeFoundations.Stacks.rootStack.isDeligneMumford_iff` (characterisation): X_{(L,s),n} is Deligne-Mumford iff n is invertible at every point of V(s).
- `TauCeti.SchemeFoundations.Stacks.rootStack.transition` (functoriality): For m >= 1, (M, t) |-> (M^{(x)m}, t^m) defines X_{(L,s),mn} -> X_{(L,s),n}, compatibly with composition.

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.rootStack.test_n_one` (degenerate): For n = 1 the root stack is X.
- `TauCeti.SchemeFoundations.Stacks.rootStack.test_dvr_chart` (computation): For a discrete valuation ring R with uniformizer π, the n-th root stack of (Spec R, V(π)) is [Spec R[t]/(t^n - π)/μ_n].
- `TauCeti.SchemeFoundations.Stacks.rootStack.test_fibre_nonreduced` (non-example): Over a point x in V(s) with residue field k, the fibre of the root stack is [Spec k[t]/(t^n)/μ_n], which is non-reduced for n >= 2; it is not Bμ_n (only its reduction is).
- `TauCeti.SchemeFoundations.Stacks.rootStack.test_char_p` (non-example): If char k = p divides n and V(s) ≠ ∅, the stabilizer at points of V(s) is μ_n, which is not etale, so the root stack is algebraic but not Deligne-Mumford.

**Uses.** FunctionFieldArithmeticPartII:key/root-stacks (request to SF.1): the root-stack carrier rests on the algebraic-space and quotient-stack interface supplied here. Yun-Zhang, Shtukas and the Taylor expansion of L-functions (II) (routed brief): SF.1 owns quotient and root-stack geometry used in that paper. algebraicgeometry/root-stacks key definition (no owner; planned here): root stacks of line bundles with sections and of Cartier divisors.

**Acceptance.** X_{(L,s),1} = X; X_{(L,s),n} -> X is an isomorphism over X \ V(s).

**Depends on.** this layer: `two-fibre-product`, `line-bundle-section-stack`, `quotient-stack-algebraic`, `deligne-mumford-stack`; libraries: `TauCeti.AlgebraicGeometry.InvertibleSheaf` (Tau Ceti).

**Source.** Charles Cadman, Using stacks to impose tangency conditions on curves — Definitions 2.1, 2.3, 2.5; Theorem 2.2 with proof; Proposition 2.4 (Sections 2.1-2.2, pp. 3-6).

### Quasi-coherent modules on algebraic stacks (`SF.1/stack-quasi-coherent`, definition)
For a stack in groupoids X over Sch, QCoh(X) is the category of quasi-coherent modules on the ringed site (X_fppf, O_X), equivalently compatible families (F_x in QCoh(T) for every x in X(T), with pullback isomorphisms for morphisms of X satisfying the cocycle condition). For X = [U/R] it is equivalent to quasi-coherent modules on the groupoid (U, R). Pullback along 1-morphisms is defined; for a quasi-compact quasi-separated morphism π : X -> M to an algebraic space, the pushforward π_* : QCoh(X) -> QCoh(M) is the right adjoint of pullback.

**Hypotheses and conventions.** X a stack in groupoids (algebraic for the presentation statement); π quasi-compact and quasi-separated for π_*.

**Construction or proof.**
1. Define QCoh(X) as compatible families of quasi-coherent modules over the objects of X, i.e. the pseudo-limit of SF.1/qcoh-pseudofunctor over the Grothendieck construction of X (Stacks Definition 96.11.1, 06WG, and Section 96.11).
2. Presentation equivalence: by SF.1/qcoh-fpqc-descent along the flat covering U -> [U/R], families are determined by their value on U with the descent isomorphism over R (Stacks Proposition 96.14.3, 06WT).
3. Pullback restricts families; pushforward π_* is constructed on a smooth atlas and descended, as in Stacks Section 96.5 (computing pushforward).

**API.**
- `TauCeti.SchemeFoundations.Stacks.QCoh` (data): The category QCoh(X) of quasi-coherent modules on a stack in groupoids X.
- `TauCeti.SchemeFoundations.Stacks.QCoh.pullback` (functoriality): Pullback QCoh(Y) -> QCoh(X) along a 1-morphism X -> Y, pseudofunctorially.
- `TauCeti.SchemeFoundations.Stacks.QCoh.presentationEquiv` (equivalence): QCoh([U/R]) is equivalent to quasi-coherent modules on the groupoid (U, R).
- `TauCeti.SchemeFoundations.Stacks.QCoh.pushforward` (functoriality): For quasi-compact quasi-separated π : X -> M to an algebraic space, π_* is right adjoint to π^*.
- `TauCeti.SchemeFoundations.Stacks.QCoh.ofSpaceEquiv` (compatibility): For an algebraic space Y, QCoh of its stack is SF.1/space-quasi-coherent QCoh(Y).

**Unit tests.**
- `TauCeti.SchemeFoundations.Stacks.QCoh.test_scheme` (compatibility): For a scheme Y, QCoh of the stack of Y is equivalent to QCoh(Y).
- `TauCeti.SchemeFoundations.Stacks.QCoh.test_BG_representations` (computation): For an affine group scheme G over a field k, QCoh(BG) is equivalent to the category of G-representations (comodules over O(G)).
- `TauCeti.SchemeFoundations.Stacks.QCoh.test_pushforward_invariants` (computation): For a finite group G acting on Spec A and π : [Spec A/G] -> Spec A^G, π_* of the structure sheaf is A^G.
- `TauCeti.SchemeFoundations.Stacks.QCoh.test_BG_not_exact` (non-example): For G = Z/p over F_p, π_* : QCoh(BG) -> QCoh(Spec F_p) is taking invariants, which is not exact (H^1(Z/p, F_p) ≠ 0).

**Uses.** SF.1/tame-stack: tameness is exactness of π_* on quasi-coherent modules. StableReductionPartII:MC.3 and MC.5 (requests to SF.1): descending the marking line and the Hodge bundle to the moduli stack. AutomorphicBundles:B5 (request to SF.1): quasi-coherent coefficient sheaves on stacks and flat-atlas descent.

**Acceptance.** For X the stack of a scheme Y, QCoh(X) = QCoh(Y).

**Depends on.** this layer: `qcoh-pseudofunctor`, `qcoh-fpqc-descent`, `stack-in-groupoids`, `quotient-stack`, `space-quasi-coherent`; libraries: `CategoryTheory.Pseudofunctor.CoGrothendieck` (Mathlib).

**Source.** The Stacks Project — Definition 96.11.1 (06WG) and Proposition 96.14.3 (06WT).

## SF.1e. Moduli functors, fine and coarse moduli spaces
A moduli problem is a stack in groupoids. Its moduli functor (isomorphism classes) is a presheaf that is generally not a sheaf; a fine moduli space is an algebraic space equivalent to the stack, which forces trivial automorphisms; a coarse moduli space is initial among maps to algebraic spaces and bijective on geometric isomorphism classes. Coarse spaces exist for finite inertia (Keel-Mori) and commute with arbitrary base change only in the tame case.

### The moduli functor of a stack (`SF.1/moduli-functor`, construction)
For a stack in groupoids X over Sch/S, its moduli functor is the presheaf of sets F_X : T |-> Ob(X(T))/≅ of isomorphism classes, with pullback induced by X, and F_X^sh denotes its fppf sheafification. There is a canonical 1-morphism X -> F_X^sh (to the discrete stack). X is a stack in setoids iff F_X is a sheaf and X -> F_X is an equivalence. F_X is in general not a sheaf and X -> F_X^sh is in general not an equivalence.

**Hypotheses and conventions.** X a stack in groupoids; isomorphism classes in each fibre groupoid.

**Construction or proof.**
1. Define F_X objectwise as the set of isomorphism classes (Mathlib Skeleton of the fibre) with pullback functoriality from the pseudofunctor; pseudofunctor coherence makes it a strict functor on classes.
2. The quotient maps Ob(X(T)) -> F_X(T) assemble to X -> F_X; compose with sheafification.
3. Setoid case: Stacks Lemma 8.6.3 (0432) and Categories Section 4.39: a stack in setoids is equivalent to the discrete stack of the presheaf of isomorphism classes, which is then a sheaf.

**API.**
- `TauCeti.SchemeFoundations.Moduli.moduliFunctor` (data): The presheaf of isomorphism classes F_X : T |-> Ob(X(T))/≅.
- `TauCeti.SchemeFoundations.Moduli.moduliFunctor.map` (functoriality): A 1-morphism X -> Y induces F_X -> F_Y, and 2-isomorphic 1-morphisms induce the same map.
- `TauCeti.SchemeFoundations.Moduli.toModuliSheaf` (projection): The canonical 1-morphism X -> F_X^sh.
- `TauCeti.SchemeFoundations.Moduli.isSetoid_iff_moduliFunctor` (characterisation): X is a stack in setoids iff F_X is a sheaf and X -> F_X is an equivalence.
- `TauCeti.SchemeFoundations.Moduli.moduliFunctor_classifying` (example): F_{BG}(T) is H^1(T, G).

**Unit tests.**
- `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_space` (degenerate): For an algebraic space M, F_{h_M} = h_M and X -> F_X is an equivalence.
- `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_classifying` (computation): For G = Z/2 over Spec R, F_{BG}(Spec R) has two elements (H^1(R, Z/2)), while F_{BG}^sh is the terminal sheaf.
- `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_not_sheaf` (non-example): F_{BG} for G = Z/2 over Spec R is not an fppf sheaf: its two elements over Spec R both restrict to the unique element over Spec C.
- `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_empty` (degenerate): For the empty stack the moduli functor is the empty presheaf.

**Uses.** SF.1 stage text: separate a moduli functor from a stack. SF.1/fine-moduli-space and SF.1/coarse-moduli-space: fine moduli spaces represent the stack; coarse spaces receive the stack and are bijective on geometric classes. DrinfeldModulesAndTModules:DM.3 and AlgebraicModuliForArithmeticGeometry:R09.5: moduli functors of level structures versus moduli stacks.

**Acceptance.** F_{BG}(T) = H^1(T, G) (SF.1/torsor-cohomology).

**Depends on.** this layer: `stack-in-groupoids`; libraries: `CategoryTheory.Skeleton` (Mathlib), `CategoryTheory.presheafToSheaf` (Mathlib).

**Source.** The Stacks Project — Lemma 8.6.3 (0432); Chapter 4, Section 4.39 (04S9).

### Fine moduli spaces (`SF.1/fine-moduli-space`, definition)
A fine moduli space for a stack in groupoids X over S is an algebraic space M over S together with an equivalence of stacks h_M ≃ X; the universal object is the object of X(M) corresponding to id_M. By SF.1/setoid-criterion an algebraic stack has a fine moduli space iff its inertia is trivial, and then M is the sheaf F_X^sh (= F_X). Having F_X^sh representable is strictly weaker than having a fine moduli space.

**Hypotheses and conventions.** X a stack in groupoids over S; M an algebraic space over S.

**Construction or proof.**
1. Define the structure (M, equivalence) and extract the universal object by 2-Yoneda (SF.1/stack-in-groupoids).
2. Uniqueness: two fine moduli spaces are related by a unique isomorphism compatible with the universal objects (Yoneda).
3. Trivial inertia is necessary and, for algebraic X, sufficient (Stacks Proposition 94.13.3, 04SZ).

**API.**
- `TauCeti.SchemeFoundations.Moduli.FineModuliSpace` (data): A fine moduli space: an algebraic space M with an equivalence h_M ≃ X.
- `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.universal` (projection): The universal object of X(M).
- `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.unique` (extensionality): Two fine moduli spaces are uniquely isomorphic compatibly with universal objects.
- `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.inertia_trivial` (characterisation): If X has a fine moduli space, then I_X -> X is an equivalence; for algebraic X the converse holds.
- `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.toCoarse` (relation): A fine moduli space is a coarse moduli space.

**Unit tests.**
- `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_space` (degenerate): An algebraic space M is a fine moduli space for its own stack, with universal object id_M.
- `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_BG` (non-example): For a nontrivial finite group G over an algebraically closed field k, BG has no fine moduli space, although F_{BG}^sh = Spec k is representable.
- `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_torsor_quotient` (computation): For a free action of a finite group G on a quasi-projective X, X/G is a fine moduli space for [X/G].

**Uses.** SF.1 stage text: separate a coarse space from a fine moduli object. DrinfeldModulesAndTModules:DM.3: sufficiently fine level structures give fine moduli schemes. AlgebraicModuliForArithmeticGeometry:R09.5: rigidification by auxiliary level produces fine moduli; forgetting automorphisms of a coarse object does not.

**Acceptance.** A fine moduli space is a coarse moduli space (SF.1/coarse-moduli-space).

**Depends on.** this layer: `moduli-functor`, `setoid-criterion`, `stack-in-groupoids`, `algebraic-space-category`.

**Source.** The Stacks Project — Proposition 94.13.3 (04SZ); The Stacks Project — Lemma 8.6.3 (0432).

### Categorical and coarse moduli spaces (`SF.1/coarse-moduli-space`, definition)
Let X be an algebraic stack. A morphism π : X -> M to an algebraic space is a categorical moduli space if every morphism X -> W to an algebraic space factors uniquely through π; it is uniform if its base change along every flat morphism M' -> M of algebraic spaces is again a categorical moduli space. It is a coarse moduli space if moreover, for every algebraically closed field k, the map from isomorphism classes of X(k) to M(k) is bijective. Coarse moduli spaces are not fine moduli objects, and their formation does not commute with arbitrary base change.

**Hypotheses and conventions.** X an algebraic stack; M an algebraic space; k ranges over algebraically closed fields.

**Construction or proof.**
1. Categorical and uniform categorical moduli spaces: Stacks Definition 106.12.1 (Section 106.12, 0DUF).
2. Coarse moduli spaces add the bijectivity on geometric isomorphism classes (Conrad, Section 1; Keel-Mori).
3. For X = [U/R] with flat locally finitely presented s, t, π is a (uniform) categorical moduli space iff U -> M is a (uniform) categorical quotient (Stacks Lemma 106.12.3); uniformity can be tested on affine flat M' (Lemma 106.12.4).

**API.**
- `TauCeti.SchemeFoundations.Moduli.IsCategoricalModuliSpace` (universal-property): π : X -> M is initial among morphisms to algebraic spaces.
- `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace` (data): π is a categorical moduli space bijective on geometric isomorphism classes.
- `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace.unique` (extensionality): Two coarse moduli spaces are uniquely isomorphic under X.
- `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace.ofFine` (relation): A fine moduli space is a coarse moduli space.
- `TauCeti.SchemeFoundations.Moduli.IsCategoricalModuliSpace.quotient_iff` (equivalence): For [U/R] with flat lfp s, t, categorical moduli spaces correspond to categorical quotients of (U, R).
- `TauCeti.SchemeFoundations.Moduli.IsUniform` (data): Uniform: stable under flat base change on M.

**Unit tests.**
- `TauCeti.SchemeFoundations.Moduli.Coarse.test_space` (degenerate): For an algebraic space X, id : X -> X is a coarse moduli space.
- `TauCeti.SchemeFoundations.Moduli.Coarse.test_BG` (computation): For a finite constant group G over an algebraically closed field k, BG -> Spec k is a coarse moduli space.
- `TauCeti.SchemeFoundations.Moduli.Coarse.test_finite_quotient` (computation): For a finite group G acting on Spec A, [Spec A/G] -> Spec A^G is a coarse moduli space.
- `TauCeti.SchemeFoundations.Moduli.Coarse.test_base_change_fails` (non-example): For Z/2 acting on A^1_Z by x |-> -x, the coarse space of [A^1_Z/(Z/2)] is Spec Z[x^2], whose fibre over F_2 is Spec F_2[x^2]; the fibre stack [A^1_{F_2}/(Z/2)] has trivial action and coarse space Spec F_2[x], and F_2[x^2] -> F_2[x] is not an isomorphism.
- `TauCeti.SchemeFoundations.Moduli.Coarse.test_A1_Gm` (non-example): [A^1/G_m] has no coarse moduli space that is a universal homeomorphism: its k-point classes 0 and 1 specialize one to the other (Conrad, Section 1).

**Uses.** SF.1/keel-mori: existence for finite inertia. AlgebraicModuliForArithmeticGeometry:R09.5: coarse spaces for the particular presentations of the programme; the general definition moves down to this node. WeilConjectures:WC.6 (request to SF.1): proper coarse algebraic spaces of separated DM stacks. algebraicgeometry/coarse-moduli key definition (owner R09.5): the definition and uniqueness are planned here; R09.5 keeps its particular existence statements.

**Acceptance.** The identity of an algebraic space is a coarse moduli space.

**Depends on.** this layer: `algebraic-stack`, `algebraic-space-category`, `categorical-geometric-quotient`, `moduli-functor`.

**Source.** The Stacks Project — Section 106.12 (0DUF): Definition 106.12.1, Lemmas 106.12.2-106.12.4; Brian Conrad, The Keel-Mori theorem via stacks — Section 1, p. 1 (definition of coarse moduli space).

### The Keel-Mori theorem (`SF.1/keel-mori`, theorem)
Let S be a scheme and X an algebraic stack locally of finite presentation over S whose inertia I_X -> X is finite. Then X has a coarse moduli space π : X -> M. Moreover M -> S is separated if X -> S is, M is locally of finite type over S if S is locally Noetherian, π is proper and quasi-finite, the base change of π along any flat morphism M' -> M of algebraic spaces is a coarse moduli space, and O_M -> π_* O_X is an isomorphism.

**Hypotheses and conventions.** X locally of finite presentation over S; I_X -> X finite (stronger than quasi-finite diagonal, weaker than finite diagonal).

**Construction or proof.**
1. Reduce Zariski locally to the case where X has a quasi-finite flat finitely presented cover by a quasi-projective S-scheme (Conrad Lemma 2.1, from SGA 3 V 7.2), using that coarse spaces with flat base change glue.
2. Find a representable etale cover W -> X by stacks admitting finite locally free scheme covers, via the Hilbert stack of the quasi-finite cover and Zariski's Main Theorem (Conrad Lemma 2.2, Remark 2.3).
3. For stacks with a finite locally free scheme cover Z -> W, the quotient of Z by the finite flat groupoid Z x_W Z exists and is a coarse space (SF.1/finite-group-quotient style invariant-ring construction for finite flat groupoids, Conrad Section 3).
4. Descend along the etale cover using that finite inertia makes the cover stabilizer preserving, so the local coarse spaces glue etale locally (Conrad Section 4); remove Noetherian hypotheses by limits (Conrad Section 5).
5. O_M = π_* O_X follows from the universal property applied to maps to A^1 after etale base change (Conrad, after Theorem 1.1).

**Acceptance.** For a finite group G acting on a quasi-projective scheme X over a field, [X/G] satisfies the hypotheses and its coarse space is X/G. For the root stack X_{(L,s),n} with X a scheme, the inertia is finite (μ_n) and the coarse space is X.

**Depends on.** this layer: `coarse-moduli-space`, `inertia`, `stack-morphism-properties`, `algebraic-stack`, `finite-group-quotient`, `stack-presentation`, `separation-properness-spaces`; libraries: `AlgebraicGeometry.Scheme.Hom.exists_isIso_morphismRestrict_toNormalization` (Mathlib).

**Source.** Brian Conrad, The Keel-Mori theorem via stacks — Theorem 1.1 and the paragraph after it (pp. 1-2); Lemmas 2.1-2.2 and Remark 2.3 (pp. 2-3); The Stacks Project — Section 106.12 (0DUF).

### Coarse spaces of finite quotient stacks (`SF.1/finite-quotient-coarse`, theorem)
Let Γ be a finite group acting on a scheme X over S such that every orbit lies in an affine open. Then the geometric quotient X -> X/Γ of SF.1/finite-group-quotient induces a uniform coarse moduli space [X/Γ] -> X/Γ; for X = Spec A it is [Spec A/Γ] -> Spec A^Γ. This agrees with the coarse moduli schemes of finite quotients in Tau Ceti ModularCurves 9D wherever those are defined.

**Hypotheses and conventions.** Γ finite constant; every Γ-orbit in an affine open of X.

**Construction or proof.**
1. Morphisms [X/Γ] -> Y to algebraic spaces are Γ-invariant morphisms X -> Y (Stacks Lemma 106.12.2); X -> X/Γ is a categorical quotient in algebraic spaces (SF.1/finite-group-quotient), so [X/Γ] -> X/Γ is a categorical moduli space (Stacks Lemma 106.12.3).
2. Uniformity: invariants commute with flat base change on X/Γ.
3. Geometric bijectivity: over an algebraically closed field the fibres of X -> X/Γ are single orbits (Mathlib Algebra.IsInvariant.orbit_eq_primesOver), and isomorphism classes of [X/Γ](k) are orbits of X(k) (Γ-torsors over k are trivial).
4. Compatibility with ModularCurves 9D by uniqueness of coarse spaces.

**Acceptance.** [A^1_k/(Z/2)] -> Spec k[x^2] for x |-> -x is a coarse moduli space (char k ≠ 2).

**Depends on.** this layer: `finite-group-quotient`, `coarse-moduli-space`, `quotient-stack`, `categorical-geometric-quotient`; libraries: `Algebra.IsInvariant.orbit_eq_primesOver` (Mathlib); layers: `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.

**Source.** The Stacks Project — Lemmas 106.12.2 and 106.12.3; The Stacks Project — Lemma 39.24.1 (03JE).

### Tame stacks (`SF.1/tame-stack`, definition)
Let M be an algebraic stack locally of finite presentation over S with finite inertia, and ρ : M -> M its coarse moduli space (SF.1/keel-mori). M is tame if ρ_* : QCoh(M) -> QCoh(M) is exact. For a finite flat finitely presented group scheme G over S, BG is tame iff G is linearly reductive (all geometric fibres linearly reductive in Tau Ceti's sense).

**Hypotheses and conventions.** M lfp over S with finite inertia; QCoh and ρ_* from SF.1/stack-quasi-coherent.

**Construction or proof.**
1. Definition: AOV Definition 3.1, using the coarse space of SF.1/keel-mori and pushforward of SF.1/stack-quasi-coherent.
2. For BG -> S the coarse space is S and ρ_* is taking G-invariants, which is exact iff G is linearly reductive (AOV, after Definition 3.1); over a field this is Tau Ceti's linearlyReductiveAffineGroupSchemeProperty.

**API.**
- `TauCeti.SchemeFoundations.Moduli.IsTame` (data): M is tame: ρ_* is exact on quasi-coherent modules.
- `TauCeti.SchemeFoundations.Moduli.IsTame.classifying_iff` (characterisation): For G finite flat of finite presentation over S, BG is tame iff G is linearly reductive.
- `TauCeti.SchemeFoundations.Moduli.IsTame.baseChange` (structure): Tameness is preserved by base change S' -> S (AOV Corollary 3.4).
- `TauCeti.SchemeFoundations.Moduli.IsTame.geometric_fibres` (characterisation): M is tame iff all geometric fibres are tame (AOV Corollary 3.5).

**Unit tests.**
- `TauCeti.SchemeFoundations.Moduli.Tame.test_space` (degenerate): An algebraic space with finite (trivial) inertia is tame: ρ is the identity.
- `TauCeti.SchemeFoundations.Moduli.Tame.test_invertible_order` (computation): For a finite constant group G whose order is invertible on S, BG is tame.
- `TauCeti.SchemeFoundations.Moduli.Tame.test_Z_mod_p` (non-example): For G = Z/p over F_p, BG is not tame: taking Z/p-invariants of F_p-representations is not exact.
- `TauCeti.SchemeFoundations.Moduli.Tame.test_mu_p` (computation): For G = μ_p over F_p, Bμ_p is tame (μ_p is linearly reductive) although it is not Deligne-Mumford.

**Uses.** SF.1/tame-local-structure: the local structure and base-change theorems for tame stacks. ShimuraCompactifications:C6 (request to SF.1): finite tame invariant quotients and their coarse spaces. algebraicgeometry/coarse-moduli key definition: coarse-space formation commutes with arbitrary base change for tame stacks.

**Acceptance.** Deligne-Mumford stacks whose stabilizer orders are invertible on S are tame.

**Depends on.** this layer: `keel-mori`, `stack-quasi-coherent`, `inertia`; libraries: `TauCeti.linearlyReductiveAffineGroupSchemeProperty` (Tau Ceti).

**Source.** Dan Abramovich, Martin Olsson, Angelo Vistoli, Tame stacks in positive characteristic — Definition 3.1 and the remark after it (Section 3).

### Local structure and base change of tame stacks (`SF.1/tame-local-structure`, theorem)
For M locally of finite presentation over S with finite inertia and coarse space ρ : M -> M, the following are equivalent: (a) M is tame; (b) for every algebraically closed field k and ξ in M(k), the automorphism group scheme Aut_k(ξ) is linearly reductive; (c) there is an fppf cover M' -> M, a linearly reductive finite flat group scheme G -> M' acting on a finite finitely presented M'-scheme U, and an equivalence M x_M M' ≃ [U/G]; (d) as (c) with M' -> M etale and surjective. For tame M, formation of the coarse space commutes with arbitrary base change M' -> M, and M is flat over S if M is.

**Hypotheses and conventions.** M lfp over S, finite inertia; linear reductivity of finite flat group schemes fibrewise.

**Construction or proof.**
1. (d) => (c) => (a), (b): invariants under a linearly reductive group are exact and quotients [U/G] have coarse space U/G (AOV, proof of Theorem 3.2).
2. (a) => (b): restrict to the residual gerbe BG at ξ, whose coarse space is a point; exactness of invariants follows from exactness of ρ_*.
3. (b) => (d): AOV Proposition 3.6: over the henselisation at a point, extend the stabilizer to a linearly reductive group scheme and lift a torsor over infinitesimal neighbourhoods (obstructions vanish by linear reductivity), then algebraize.
4. Base change (AOV Corollary 3.3): locally M = [U/G] with U = Spec B finite over M = Spec B^G and (N (x) B)^G = N (x) B^G for every module N by exactness of invariants.

**Acceptance.** A finite group of order invertible on S acting on a quasi-projective scheme gives a tame quotient stack whose coarse space commutes with all base change.

**Depends on.** this layer: `tame-stack`, `keel-mori`, `quotient-stack`, `stack-quasi-coherent`; libraries: `TauCeti.linearlyReductiveAffineGroupSchemeProperty` (Tau Ceti).

**Source.** Dan Abramovich, Martin Olsson, Angelo Vistoli, Tame stacks in positive characteristic — Theorem 3.2, Corollaries 3.3-3.5 with proofs, Proposition 3.6 (Section 3).

## SF.1f. Galois gerbs: missing inputs
The reserved key definition SchemeAndStackFoundations:key/galois-gerbs and its companions (topological extension, local splitting chart, morphisms, conjugacy, neutral gerb, conjugator scheme, pro-gerbs, centralizer, cocycle, field extension) are planned in the whole-roadmap packet. This sub-layer adds the algebraic inputs they assume: semilinear algebraic automorphisms of the kernel, Galois descent of affine groups for possibly infinite Galois extensions, representability of conjugator schemes, and Kisin's crossed-module categories.

### Algebraic semilinear automorphisms of a group over a Galois extension (`SF.1/semilinear-automorphism`, definition)
Let k'/k be a Galois extension with Γ = Gal(k'/k) (Krull topology), H a linear algebraic group over k' (an affine k'-group scheme of finite type, i.e. a finitely generated commutative Hopf k'-algebra O(H)), and σ in Γ. A σ-semilinear algebraic automorphism of H is an isomorphism of k'-group schemes σ^*H -> H, equivalently a σ-semilinear Hopf algebra automorphism φ of O(H) (φ(a f) = σ(a) φ(f)). It induces a group automorphism of H(k'), x |-> φ_*(x). Such automorphisms compose over the multiplication of Γ (a σ- and a τ-semilinear map compose to a στ-semilinear map) and form a group Aut^sl(H) with a homomorphism to Γ. If H = H_0 (x)_k k' then the scalar action of Γ on k' (x)_k O(H_0) gives the standard section Γ -> Aut^sl(H).

**Hypotheses and conventions.** k'/k Galois; H affine of finite type over k'; the semilinear structure is over the fixed embedding k -> k'.

**Construction or proof.**
1. Encode σ^*H by restricting scalars of O(H) along σ; an isomorphism of Hopf algebras O(H) -> σ_*O(H) is a σ-semilinear Hopf automorphism.
2. The induced map on points is precomposition: x : O(H) -> k' goes to σ ∘ x ∘ φ^{-1}, a group automorphism of H(k') because φ respects comultiplication.
3. Composition and inverses are computed on coordinate rings; the scalar action of Tau Ceti's ScalarAut on k' (x)_k O(H_0) supplies the standard semilinear automorphisms of a base change (Kisin 3.1.1(1), condition on conjugation by lifts).

**API.**
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut` (data): The group of pairs (σ, φ) with φ a σ-semilinear Hopf automorphism of O(H), with its projection to Γ.
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.toPointsAut` (projection): The homomorphism SemilinearAut(H) -> Aut(H(k')) to automorphisms of the discrete point group.
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.comp` (relation): A σ-semilinear and a τ-semilinear automorphism compose to a στ-semilinear automorphism.
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.standard` (constructor): For H = H_0 (x)_k k', the section Γ -> SemilinearAut(H) given by the scalar action on k' (x)_k O(H_0).
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.linear_iff` (characterisation): The fibre over σ = 1 is the group of k'-algebraic group automorphisms of H.

**Unit tests.**
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_gm_conjugation` (computation): For k'/k = C/R and H = G_m, the σ-semilinear automorphisms for σ complex conjugation are z |-> conj(z) and z |-> conj(z)^{-1} on points.
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_identity_not_semilinear` (non-example): For C/R, H = G_m and σ complex conjugation, the identity map of C^x is not induced by any σ-semilinear algebraic automorphism (it is induced only by a linear one).
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_trivial_extension` (degenerate): For k' = k, SemilinearAut(H) is the group of algebraic automorphisms of H.
- `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_standard_points` (compatibility): For H = H_0 (x)_k k', the standard σ acts on H(k') = H_0(k') by applying σ to coordinates.

**Uses.** SchemeAndStackFoundations:key/galois-gerbs (whole-roadmap packet): condition (1) of a Galois gerb asks that conjugation by every lift of σ be such an automorphism. SF.1/galois-descent-affine: a continuous homomorphism Γ -> Aut^sl(H) lifting the identity is a Galois descent datum. SF.1/conjugator-representability: the twisted Galois action on transporters uses these automorphisms. whole-roadmap SF.1/morphism node: gerb morphisms must be algebraic on kernels, not merely continuous.

**Acceptance.** The neutral gerb H_0(k') ⋊ Γ of the whole-roadmap SF.1/neutral node uses exactly the standard section, and is Mathlib's SemidirectProduct.toGroupExtension for the induced action of Γ on H_0(k').

**Depends on.** whole-roadmap SF.1 nodes: `key/galois-gerbs`; libraries: `CommHopfAlgCat` (Mathlib), `krullTopology` (Mathlib), `TauCeti.ScalarAut.instMulSemiringAction` (Tau Ceti), `SemidirectProduct.toGroupExtension` (Mathlib).

**Source.** Mark Kisin, Mod p points on Shimura varieties of abelian type — Section 3.1.1, condition (1), pp. 34-35.

### Galois descent for affine schemes and affine group schemes (`SF.1/galois-descent-affine`, theorem)
Let k'/k be a Galois extension (finite or infinite) with group Γ. The functor X_0 |-> (X_0 (x)_k k', standard semilinear action) is an equivalence from affine k-schemes to affine k'-schemes X equipped with a continuous semilinear Γ-action on O(X) (every element has open stabilizer, acting by σ-semilinear algebra automorphisms with the cocycle condition), with quasi-inverse X |-> Spec(O(X)^Γ). The equivalence is compatible with products, so it restricts to affine group schemes (Hopf algebras) and to linear algebraic groups; descended objects of finite type stay of finite type.

**Hypotheses and conventions.** k'/k Galois; the semilinear action on O(X) is continuous (open stabilizers for the Krull topology).

**Construction or proof.**
1. Finite Galois case: V |-> V^Γ and W |-> k' (x)_k W are inverse equivalences between semilinear k'-representations and k-vector spaces (Tau Ceti GaloisDescent span_invariants_eq_top and liftBaseChange_injective_of_invariant; Stacks Section 35.6, 0CDQ; Poonen Proposition 4.4.2). Multiplicative structure descends because invariants of a tensor product are the tensor product of invariants.
2. Infinite case: by continuity every finitely generated sub-k'-algebra is stable under an open normal subgroup Gal(k'/K) with K/k finite Galois; apply the finite case to Gal(K/k) acting on the Gal(k'/K)-invariants and pass to the filtered union.
3. Group schemes: comultiplication, counit and antipode are equivariant maps and descend by full faithfulness; finite generation descends since k'/k is faithfully flat (SF.1/affine-fpqc-descent for Spec k' -> Spec k).
4. Points: for finite k'/k the k-points of the descended group H_0 are the Γ-invariant k'-points of H, by Tau Ceti's faithfully flat descent of Hopf-algebra points (AlgHom.faithfullyFlatDescentMulEquiv for k -> k', with k' (x)_k k' = Π_Γ k').

**Acceptance.** The k-structure on the centralizer I_0 in Kisin Lemma 3.1.2 is the descent of the twisted conjugation action. For C/R, G_m with the action z |-> conj(z)^{-1} descends to the norm-one torus S^1 = {x^2 + y^2 = 1}.

**Depends on.** this layer: `semilinear-automorphism`, `affine-fpqc-descent`; libraries: `TauCeti.GaloisDescent.span_invariants_eq_top` (Tau Ceti), `TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant` (Tau Ceti), `krullTopology` (Mathlib), `CommHopfAlgCat` (Mathlib), `TauCeti.AlgHom.faithfullyFlatDescentMulEquiv` (Tau Ceti).

**Source.** The Stacks Project — Section 35.6 (0CDQ); Bjorn Poonen, Rational points on varieties — Propositions 4.4.2 and 4.4.4, Remark 4.4.8, pp. 102-104; Mark Kisin, Mod p points on Shimura varieties of abelian type — Section 3.1.1 condition (2) and proof of Lemma 3.1.2, pp. 35-36.

### Representability of conjugator schemes of Galois-gerb morphisms (`SF.1/conjugator-representability`, theorem)
Let f_1, f_2 : E -> E' be morphisms of k'/k-Galois gerbs with kernels H and H'. The functor on k-algebras R |-> {h in H'(k' (x)_k R) : Int(h) ∘ f_{1,R} = f_{2,R}} (with f_{i,R} the pushouts along H(k') -> H(k' (x)_k R)) is represented by an affine k-scheme Isom(f_1, f_2) of finite type; for f_1 = f_2 = f it is an affine algebraic k-group I_f. Over k' it is the closed transporter subscheme of H'_{k'} of elements conjugating f_1^alg to f_2^alg on kernels and f_1(ϱ_τ) to f_2(ϱ_τ) on a continuous section ϱ, and its k-structure is the Galois descent of the twisted action h |-> f_2(ϱ_τ) τ(h) f_1(ϱ_τ)^{-1}. In particular Isom(f_1, f_2)(k) is the set of conjugators in H'(k') and is an I_{f_1}-torsor when nonempty.

**Hypotheses and conventions.** Kernels linear algebraic groups over k'; char k = 0 as in the key definition; ϱ a continuous section of E -> Gal(k'/k) over an open subgroup.

**Construction or proof.**
1. Over k', the condition Int(h) ∘ f_1^alg = f_2^alg is an equality of two morphisms H x H'_{k'} -> H' over H'_{k'}; since O(H) is a free k'-module, expanding in a basis gives polynomial equations in O(H'), so the locus is a closed subscheme (transporter).
2. The conditions on the finitely many cosets of an open subgroup over which ϱ is a homomorphism are further closed conditions h f_1(ϱ_τ) h^{-1} = f_2(ϱ_τ), using SF.1/semilinear-automorphism to compare the τ-twisted structures.
3. The twisted action h |-> f_2(ϱ_τ) τ(h) f_1(ϱ_τ)^{-1} is a continuous semilinear action on the closed transporter (it is independent of the choice of ϱ on the kernel because f_1, f_2 agree with their algebraic parts there); descend by SF.1/galois-descent-affine.
4. Points over k are the h in H'(k') fixed by the twisted action, i.e. conjugators; I_{f_1} acts simply transitively when nonempty. For neutral targets this recovers Kisin Lemma 3.1.2 (whole-roadmap SF.1/centralizer).

**Acceptance.** For f_1 = f_2 into the neutral gerb of G, I_f,k' is the centralizer of f^alg(H) in G_{k'} (Kisin Lemma 3.1.2(1)). For the identity of the neutral G_m gerb over C/R, I_id = G_m over R.

**Depends on.** this layer: `semilinear-automorphism`, `galois-descent-affine`; whole-roadmap SF.1 nodes: `key/galois-gerbs`, `conjugator-scheme`, `morphism`, `conjugacy`.

**Source.** Mark Kisin, Mod p points on Shimura varieties of abelian type — Section 3.1.1 (definition of Isom(f_1, f_2) and I_f) and Lemma 3.1.2 with proof, pp. 35-36.

### Crossed modules and their quotient monoidal categories (`SF.1/crossed-module-category`, definition)
A crossed module is a group homomorphism ∂ : H~ -> H together with an action of H on H~ by automorphisms such that ∂(h.x) = h ∂(x) h^{-1} and ∂(x).y = x y x^{-1}. Its quotient category H/H~ has objects the elements of H and morphisms Hom(h_1, h_2) = {x in H~ : h_2 = ∂(x) h_1}, with composition by multiplication in H~; it is a groupoid and a strictly monoidal category with tensor product given by multiplication in H on objects and (x, x') |-> x (h_1.x') on morphisms. Conjugation by h in H is a monoidal auto-equivalence, isomorphic to the identity when h is in the image of ∂. Morphisms of crossed modules induce strict monoidal functors.

**Hypotheses and conventions.** Groups H~ and H; action by group automorphisms; no topology.

**Construction or proof.**
1. Define the structure (H~, H, ∂, action) with the two Peiffer identities (Kisin 3.2.1).
2. Check that composition and the tensor product of morphisms are well defined and associative using the Peiffer identities, giving a strict monoidal groupoid.
3. Isomorphism classes of objects are H/∂(H~) and the automorphism group of every object is ker ∂ (a central subgroup of H~ on which H acts).

**API.**
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule` (data): A crossed module (H~, H, ∂, action) with the two Peiffer identities.
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.quotientCategory` (constructor): The groupoid H/H~ with objects H and morphisms {x : h_2 = ∂(x) h_1}.
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.isGroupoid` (instance): H/H~ is a groupoid.
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.isoClasses` (characterisation): Isomorphism classes of H/H~ are the cosets H/∂(H~).
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.aut` (characterisation): The automorphism group of every object of H/H~ is ker ∂.
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.tensorObj` (structure): The strict monoidal structure: h_1 ⊗ h_2 = h_1 h_2 on objects.

**Unit tests.**
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.test_identity` (computation): For ∂ = id : H -> H with conjugation, H/H~ has exactly one morphism between any two objects.
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.test_trivial` (degenerate): For H~ = 1, H/H~ is the discrete category on H.
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.test_center` (computation): For ∂ : H~ -> H with H~ = SL_2(C), H = PGL_2(C) and ∂ the natural map (H acting by conjugation), every object has automorphism group μ_2 and there is one isomorphism class.
- `TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.test_peiffer_needed` (non-example): For H~ = H = S_3 with the trivial action and ∂ = id, the second Peiffer identity ∂(x).y = x y x^{-1} fails, so this is not a crossed module.

**Uses.** Kisin, Mod p points (routed brief to SF.1): strict monoidal crossed-module categories formulate the Langlands-Rapoport conjecture for groups with nontrivial π_1 of the derived group. SchemeAndStackFoundations:key/galois-gerbs importers (ReductiveGroupsPartIII, EndoscopicTransfer Part II): morphisms of Galois gerbs into crossed-module quotients. SF.1/conjugator-representability: conjugacy versus isomorphism of morphisms into H/H~.

**Acceptance.** For H~ = H with conjugation and ∂ = id, H/H~ has one isomorphism class.

**Depends on.** libraries: `MonoidHom.ker` (Mathlib), `CategoryTheory.IsGroupoid` (Mathlib), `GroupExtension` (Mathlib).

**Source.** Mark Kisin, Mod p points on Shimura varieties of abelian type — Section 3.2.1, pp. 39-40.

## Dependencies on other roadmaps
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`: Effective faithfully flat descent, with cocycle and uniqueness statements, of affine schemes and their morphisms along a single faithfully flat quasi-compact morphism S' -> S of arbitrary schemes (as ModularCurves 0E states for affine schemes, sections and morphisms). SF.1 imports it and adds only the fpqc covering-family stack form. (used by `affine-fpqc-descent`).
- `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`: For a finite group acting on Spec A by algebra automorphisms over an invariant base: Spec A^G with its categorical universal property and integrality of A over A^G; and the affine case of SGA 3 V 4.1 for finite locally free equivalence relations (quotient affine, finite locally free, R = X x_{X/R} X, representing the fppf quotient). SF.1 globalizes these with invariant affine covers. (used by `finite-group-quotient`, `finite-quotient-coarse`).
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`: The coarse moduli schemes of the finite quotient problems of ModularCurves Layer 9, so that SF.1/finite-quotient-coarse can state compatibility by uniqueness of coarse moduli spaces. (used by `finite-quotient-coarse`).
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`: Effective etale descent of compatibly polarized schemes, morphisms, sections and polarization cocycles (the owner fixed by the accepted RS-25), so that SF.1/galois-descent-quasi-projective can state agreement on polarized etale data. (used by `galois-descent-quasi-projective`).
- `SchemeAndStackFoundations:SF.0`: quasi-coherent pullback and relative Spec over arbitrary schemes (used by `qcoh-pseudofunctor` and `affine-fpqc-descent`).

Consumers of this layer: SchemeAndStackFoundations SF.2; DrinfeldModulesAndTModules DM.3; GlobalShtukasAndFunctionFieldLanglands GS.0 and GS.2; LogicAndDefinabilityInNumberTheory LD.3; AlgebraicModuliForArithmeticGeometry R09.3, R09.4 and R09.5; DiamondsAndVStacks D0 (ordinary stacks).

## Ownership
- **rescope (SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry).** Confirmed finding RT-AREA-algebraicgeometry/1: algebraic spaces, representable diagonals, atlases and algebraic stacks were planned both in SF.1 and in R09.3/R09.4, with no stage edge between them. SchemeAndStackFoundations is upstream tier 2 and AlgebraicModuliForArithmeticGeometry tier 4, so the general theory must live in SF.1. This packet now plans it: algebraic spaces as etale-equivalence-relation quotients with morphisms, fibre products, properties, small etale site and quasi-coherent modules; representable diagonals, atlases and their independence; algebraic and Deligne-Mumford stacks; quotient stacks; inertia; coarse and fine moduli; Keel-Mori. Add stage edges SF.1 -> R09.3, SF.1 -> R09.4 and SF.1 -> R09.5. Narrow R09.3 to Weil restriction as an algebraic space (RS-02), the comparison with the ModularCurves finite quotients, and descent of the moduli-specific objects; narrow R09.4 to quotient-stack and moduli-stack algebraicity for generalised elliptic curves and polarised abelian schemes with their DM, separated, proper and tame properties, plus the gerbe theory of its key/gerbes; narrow R09.5 to coarse spaces of the particular presentations and rigidification by level. The A0-extension nodes R09.3/quasicoherent-pseudofunctor, R09.3/fpqc-quasicoherent-descent, R09.3/space-quasicoherent-modules, R09.3/space-fpqc-quasicoherent-descent, R09.4/inertia-stack and R09.4/torsor-twist-space become imports of SF.1/qcoh-pseudofunctor, SF.1/qcoh-fpqc-descent, SF.1/space-quasi-coherent, SF.1/inertia and SF.1/contracted-product. The definition and uniqueness of coarse moduli spaces and the general Keel-Mori theorem move down from R09.5 to SF.1/coarse-moduli-space and SF.1/keel-mori.
- **rescope (SchemeAndStackFoundations, DiamondsAndVStacks).** DiamondsAndVStacks D0 (tier 3) plans ordinary groupoid-valued prestacks: descent data, stackification, 2-fibre products and quotients of groupoids. SF.1 (tier 2) needs exactly these for algebraic stacks and cannot cite D0. SF.1/stackification, SF.1/two-fibre-product, SF.1/quotient-stack and SF.1/sheaf-stack own the ordinary (site-general) constructions; D0 keeps the spectral-space, coherent-topos and size material and imports these nodes for its ordinary stack foundations, via a stage edge SF.1 -> D0.
- **split (SchemeAndStackFoundations).** SF.1 now holds about ninety nodes across six themes (with the whole-roadmap packet's carrier and Galois-gerb nodes), too broad to read as one star with at most six planets. Sub-layers for the atlas: SF.1a Descent (qcoh-pseudofunctor, qcoh-fpqc-descent, affine-fpqc-descent, galois-descent-quasi-projective, sheaf-stack, quasi-finite-descent, space-fppf-descent); SF.1b Algebraic spaces (the whole-roadmap representable-diagonal, etale-atlas, algebraic-space nodes and algebraic-space-category, etale-equivalence-relation, quotient-sheaf, etale-quotient-theorem, space-presentation, space-points, etale-local-properties, separation-properness-spaces, space-fibre-products, small-etale-site, space-quasi-coherent, folded-line-space, translation-quotient-space); SF.1c Groups, torsors and quotients (group-action, groupoid-space, stabilizer, torsor, torsor-cohomology, torsor-representability, contracted-product, twisting-bijection, categorical-geometric-quotient, finite-group-quotient, artin-bootstrap); SF.1d Algebraic stacks (stack-in-groupoids, stackification, two-fibre-product, representable-stack-morphism, algebraic-stack, deligne-mumford-stack, inertia, setoid-criterion, stack-morphism-properties, stack-presentation, quotient-stack, quotient-stack-algebraic, line-bundle-section-stack, root-stack, stack-quasi-coherent); SF.1e Moduli spaces (moduli-functor, fine-moduli-space, coarse-moduli-space, keel-mori, finite-quotient-coarse, tame-stack, tame-local-structure); SF.1f Galois gerbs (the whole-roadmap key/galois-gerbs strand and semilinear-automorphism, galois-descent-affine, conjugator-representability, crossed-module-category).

## Recorded gaps
- **Comparison of Mathlib's coalgebra-form and pullback-form descent data** (`qcoh-fpqc-descent`): Mathlib's DescentDataAsCoalgebra.lean leaves as a TODO the comparison with DescentData when pullbacks exist and base-change maps are isomorphisms. SF.1/qcoh-fpqc-descent uses this comparison for quasi-coherent pullback along a single affine faithfully flat map; it is part of that node's proof, not supplied by the baseline.
- **Hilbert stack of finite locally free subobjects in Artin's flat-presentation theorem** (`stack-presentation`, `quotient-stack-algebraic`): Part (b) of SF.1/stack-presentation (Stacks Theorem 97.16.1) finds a smooth atlas inside the stack H_d(X/Y) of finite locally free closed subobjects (Stacks 97.14-97.15). That stack and its algebraicity are proof-internal at target level and are not separate nodes; a lemma-level pass must add them. Smooth group spaces do not need this step.
- **Quasi-coherent pushforward along stack morphisms** (`stack-quasi-coherent`, `tame-stack`, `tame-local-structure`): The construction of π_* for quasi-compact quasi-separated morphisms from algebraic stacks to algebraic spaces (Stacks Section 96.5) is sketched inside SF.1/stack-quasi-coherent; its base-change properties are only used for the tame statements and are not separately planned.

## Mistakes found in the sources
- **SchemeAndStackFoundations/E101** (misprint, Stacks Project, Definition 83.4.1 (tag 048J), online version retrieved 2026-10-09 (both the definition of categorical quotient and of categorical quotient in a full subcategory)): The factorization of an R-invariant morphism ψ : U -> Y through the quotient φ : U -> X by the unique χ : X -> Y is written as ψ = φ ∘ χ. Correction: ψ = χ ∘ φ (first φ, then χ). Reason: χ has source X and target Y while φ has source U and target X, so φ ∘ χ is not defined; the composite U -> X -> Y is χ ∘ φ. The same slip occurs twice in the definition. Effect: nothing; new.

## Acceptance tests for the layer
- A quotient consumer receives the universal property and the stabilizer conditions: SF.1/quotient-sheaf and SF.1/quotient-stack give the universal properties; SF.1/stabilizer and SF.1/quotient-stack-algebraic give the conditions under which [X/G] is algebraic, Deligne-Mumford or an algebraic space.
- Representability and properness are separate proofs: SF.1/stack-morphism-properties exhibits BG -> S (G finite etale) proper and not representable, and BG_m -> S smooth and not separated.
- A moduli functor is not a stack and a coarse space is not a fine moduli object: SF.1/moduli-functor (F_BG is not a sheaf), SF.1/fine-moduli-space (BG has none although its sheafified moduli functor is representable), SF.1/coarse-moduli-space (formation does not commute with reduction modulo 2 for [A^1_Z/(Z/2)]).
- Atlas independence: SF.1/space-presentation, SF.1/etale-local-properties (square independence) and SF.1/stack-presentation (d).
- Non-scheme algebraic spaces: the folded line (quasi-separated, not locally separated) and A^1/Z in characteristic zero (not quasi-separated).
