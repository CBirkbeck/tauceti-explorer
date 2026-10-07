# Excursion operators and the spectral action

Excursion operators turn the multi-leg Hecke action on lisse sheaves on
\(\mathrm{Bun}_G\) into central operations. Their evaluations on an irreducible
smooth representation determine a continuous semisimple Weil parameter.
The spectral action strengthens those operations to an action of perfect
complexes on the parameter stack. This roadmap develops that passage, its
functorial and duality properties, compatibility with parabolic induction,
and the comparison with the classical correspondence for \(\mathrm{GL}_n\).

The motivating distinction is between a parameter and a category with a
spectral action. A field-valued excursion character gives a conjugacy class
of semisimple parameters. An integral categorical action requires stronger
derived constructions and a different coefficient hypothesis. Neither result
by itself supplies a categorical local Langlands equivalence, a monodromy
operator, a parametrization by representations of the component group, or
independence of the coefficient prime. These conjectural extensions are
boundaries of the roadmap, rather than conclusions of its proved targets.

The development has three parts. ES0–ES4 constructs the enhanced centre,
specializes the abstract excursion algebra to \(\mathrm{Bun}_G\), controls
wild ramification, and builds rational and integral spectral actions and
central support. ES5–ES6 reconstructs parameters and proves their changes
under coefficients, groups, characters and duality. ES7 restricts centres
to strata, proves the parabolic comparison, and compares the semisimple
\(\mathrm{GL}_n\) parameter in both characteristics of the local field.
The equal-characteristic route includes the division-algebra automorphic
and D-elliptic geometry needed for the Drinfeld–Carayol realization.

The mathematical statements, proof routes, APIs and unit tests below form
the specification. All 113 nodes have implementation status **unchecked**.
Sixteen layers have target status **planned**; ES6:functoriality is
**partial**, with the unresolved general-field centre reduction and torus
operator identity stated explicitly. No layer is closed. The suggested
[Lean file](../suggested/ExcursionOperatorsAndSpectralAction.lean) gives
candidate forms and names, with explicit omissions where the enhanced
interfaces are unavailable. Its elaboration does not establish these targets.

## Scope and ownership

The interfaces in this table are imports. Their definitions and general
theory are developed by their owners; this roadmap supplies the indicated
geometric specialization or comparison. Each use below names a supplying
node, or a stage together with an explicit stronger-interface obligation.

| Owner | Imported mathematics and the boundary of this roadmap |
| --- | --- |
| LanglandsParameterStacks (LP0–LP4) | Weil cocycle stacks, semisimple reconstruction, and the abstract integral excursion algebra, all relations and coefficient realizations are owned by LP. ES0 supplies the enhanced Bun specialization and continuity. LP4 retains VIII.5.1 generation and module comparison; the Chapter X universal action, pushout and colimit theorems are owned here by ES2–ES3. |
| GeometricSatake (GS4) and ReductiveGroupsPartII | Pinned dual groups, root data, normalized Satake, cyclotomic conventions, Levi compatibility and group-change naturality are imports. ES7 uses them to compute constant terms and the twisted parameter inclusion. Foundational surjective z-extensions and induced-torus resolutions belong to the proposed RG2.6; injective z-embeddings belong to ES6:functoriality. |
| HeckeStacksAndLocalShtukas (HS0–HS4) | Condensed enrichment, multi-leg Hecke functors, fusion, relative-homology kernels, creation and annihilation, and local-shtuka cohomology interfaces. ES0 constructs their central composites; ES4 compares excursions on cohomology. |
| VStackSheavesAndLisseCategories (VS4–VS5) and EnhancedDerivedSheaves (E5) | Stratum categories and adjunctions, compact generation, enhanced mapping categories, action anima, Ind extension and duality. ES supplies central support and spectral actions using these interfaces. Lisse and general-coefficient duality must be supplied in the stated range; an étale compact theorem alone is insufficient. |
| SmoothRepresentationsOfLocalGroups (SR.0–SR.3 and proposed SR.3b) | Smooth categories, admissibility, induction, contragredients and Bernstein blocks. SR.1 owns the arbitrary-coefficient **abelian** Bernstein centre, pro-p Hecke-corner limit and integral separatedness. ES supplies enhanced restriction to strata and the condensed Schur refinement. Complex block structure does not replace modular admissibility. |
| BunGAndNewtonStrata (BG0–BG2) | Kottwitz classes, centralizer groups, Newton strata, pure inner twisting and uniformization. ES7 proves its centre-factorization application and the z-embedding Bun fibre and centre detection; BG supplies the required Hecke-equivariant twisting and basic-inner-class bridge. |
| Upstream ClassFieldTheory | Arithmetic local reciprocity and its documented field range. The existing [ClassFieldTheory → ES6:functoriality link](../links/tauceti_TauCetiRoadmap_ClassFieldTheory.json) fixes the inversion adapter to geometric Frobenius. Full equal-characteristic wild reciprocity is a requested ClassFieldTheory Part II, not a redefinition of upstream normalization. |
| RelativeFarguesFontaine | Period geometry and line-bundle conventions. Its requested extension supplies the height-one Lubin–Tate torsor and endpoint actions used by the torus calculation. |
| EtaleLocalLanglands (ET.6–ET.6a) | Independent characteristic-zero classical LLC and the action-preserving classical tower/minuscule Hecke-fibre identification. ET.6a is downstream of HS2 and its own classical towers; HS3 supplies the cohomology interface. |
| FunctionFieldArithmetic, AutomorphicAdeles, AutomorphicSpectra | Generic completions, adeles, Haar products, diagonal and central/degree quotients, automorphic definitions and abstract spectral analysis. ES7 adds division-algebra maximal orders, anisotropic compactness, Euler–Poincaré tests and selected simple trace/globalization/transfer arguments. AA.1 needs a function-field extension of its number-field interface. General invariant trace formulas and global Jacquet–Langlands are outside this specialization. |
| ClassicalAdicEtaleCohomology, EtaleDerivedCategories, DeligneWeightsAndPurity, ArithmeticGaloisRepresentations | Rigid compact support, Poincaré duality, correspondences and trace formulas, weights, local monodromy, semisimple recognition and geometric spectral sequences. ES7 supplies the D-elliptic and quotient applications and uses the corrected LRS statements with Kaiser’s erratum. |

Pinned Mathlib already supplies ordinary categories and their centres,
condensed sheaves and algebras, representations and intertwiners, prime spectra
and zero-locus calculus, schemes and several elementary group-theoretic
interfaces. They are reused below. An ordinary centre is not the enhanced
centre, and the finite-group character theorem is not a trace-recognition
theorem for an arbitrary Weil group. The [baseline register](#pinned-library-interfaces)
records the precise supplied scope.

## Conventions

Let \(E\) be a nonarchimedean local field of residue characteristic \(p\)
and residue cardinality \(q\). Its characteristic may be zero or \(p\).
Fix \(\ell\ne p\) and a square root of \(q\) for the normalized Hecke family.
Let \(G/E\) be connected reductive, \(H=\widehat G\) its split pinned dual,
and \(W_E\to Q\) the finite quotient defining the pinned Weil action.
A parameter is a continuous cocycle, equivalently a lift of this prescribed
projection to \(H(L)\rtimes Q\), modulo \(H(L)\)-conjugation. Semisimplicity
means the closed-orbit/complete-reducibility convention of LP2, not that every
individual image matrix is semisimple. Nonsplit formulas retain the Weil
projection and the semidirect product.

Write \(\mathcal D=D_{\mathrm{lis}}(\mathrm{Bun}_G,\Lambda)\), and
\(\mathcal D^\omega\) for its compact objects. The enhanced centre is
\(Z_{\mathrm{enh}}(\mathcal D)=\pi_0\operatorname{End}(\mathrm{id}_{\mathcal D})\)
in the enhanced exact linear functor category, with its induced condensed
structure. Ordinary `CategoryTheory.CatCenter` is the centre of the ordinary
category and receives a comparison map. No universal comparison isomorphism
is asserted. Ind comparisons use colimit-preserving enhanced endofunctors
and their mapping objects. A Schur object has its **specified scalar unit**
\(L\to\operatorname{End}(A)\) invertible as a condensed algebra morphism.
An abstract endomorphism-ring calculation alone is insufficient. The field
\(L\) is relatively discrete as a condensed coefficient algebra.

The coefficient regimes must be kept separate:

| Construction | Coefficients and condition |
| --- | --- |
| Excursion operators, wild cutoffs and the excursion-algebra route | Arbitrary \(\mathbb Z_\ell[\sqrt q]\)-algebras in the indicated enhanced categories; no centre-order condition. |
| Invariant-coordinate spectral-to-geometric centre map and its diagrams | \(\lvert\pi_0Z(G)\rvert\) is invertible in \(\Lambda\), for every group in the diagram. This refers to the original group \(G\), not its dual. |
| Rational categorical spectral action | A field extension of \(\mathbb Q_\ell(\sqrt q)\); no dual-fundamental-group prime restriction. |
| Integral actual \(\operatorname{Perf}\) action | The integers in a finite extension of \(\mathbb Q_\ell(\sqrt q)\), with \(\ell\nmid\lvert\pi_1(H)_{\mathrm{tors}}\rvert\). The approximation action itself does not require this prime condition. |
| Field-valued semisimple parameter assignment | An algebraically closed \(\mathbb Z_\ell[\sqrt q]\)-field \(L\), including characteristic \(\ell\), without ES3’s categorical prime restriction. |
| Classical \(\mathrm{GL}_n\) comparison | \(\overline{\mathbb Q}_\ell\), recovering the semisimplified Weil parameter; no assertion recovering monodromy \(N\). |

At excluded centre primes use integral excursion operators in the same
diagrams. This does not establish the invariant-coordinate identification
without its hypothesis. For a compact object a single open wild subgroup
\(P\) works for all leg sets and Satake representations. It may depend on the
object. Compact objects meet only finitely many parameter components; passing
to Ind changes a direct sum to a product. There is no single global wild
cutoff for an arbitrary Ind object or a whole tower.

The degree map sends **geometric** Frobenius to \(1\), and
\(\lvert w\rvert=q^{-\deg(w)}\). Arithmetic reciprocity sends a uniformizer
to arithmetic Frobenius; \(\mathrm{rec}_{\mathrm{geom}}=
\mathrm{Art}_{\mathrm{arith}}\circ\mathrm{inv}\) sends it to geometric
Frobenius. Here composition with inversion is not the inverse function of
the reciprocity isomorphism. When \(\mathrm{rec}_{\mathrm{geom}}^{-1}\) is
used, it denotes the genuine inverse map. Fargues’ associated-sheaf convention
introduces a further inversion on characters. The torus Hecke-endpoint sign
and the universal-coefficient regular-module operator identity remain named
requirements; tests on scalar characters alone cannot detect nilpotents.

For a pinned dual Levi \(\widehat M\subset H\), put
\(t=(2\rho_H-2\rho_{\widehat M})(\sqrt q)\). The unnormalized parabolic map is
\(c\phi(w)=t^{\deg(w)}j(\phi(w))\). Both Weil invariance of \(t\) and its
centrality in the Levi are necessary for the cocycle equation. Write
\(\mathrm{Ind}_P^G\) for **unnormalized** induction and
\(i_P^G\tau=\mathrm{Ind}_P^G(\delta_P^{1/2}\tau)\) for normalized induction.
The parameter of \(\delta_P^{1/2}\) supplies \(c^{-1}\), cancelling the twist.
For the upper Borel of \(\mathrm{GL}_2\), unnormalized induction of the
trivial torus character has Frobenius \(\operatorname{diag}(\sqrt q,1/\sqrt q)\);
normalized induction has \(1\oplus1\). The Satake complex shift
\((-d/2)[-d]\) is tracked separately.

A z-embedding is an **injective** group morphism with the full Kaletha
cohomological conditions, distinct from a foundational surjective
z-extension. The available construction is p-adic. In equal characteristic
a nonsmooth centre such as \(\mu_p\) prevents the central-surjectivity
argument from extending as written. The smooth-centre extension and an
alternative nonsmooth-centre reduction are explicit requirements; an
arbitrary-local-field connected-centre cover is not assumed.

For the function-field route let \(X/\mathbb F_q\) be smooth, projective and
geometrically connected, \(F=\mathbb F_q(X)\), and \(D/F\) central simple of
dimension \(d^2\). Fix a rational pole \(\infty\) split for the D-elliptic
construction. D-elliptic sheaves have rank \(d^2\), period \(d\), cokernel
rank \(d\), and normalization \(0\le\chi(\mathcal E_0)<d\). Division hypotheses
are retained precisely where compactness or properness uses them. Nonempty
level suffices for the stated representation theorem. Formal extensions at
the ramified place \(o\) use levels disjoint from \(o\); \(o\)-level covers
occur on the generic fibre. The special extension is not claimed smooth.

The uniformizing global inner form \(\overline D\) changes the invariants at
\(o\) and \(\infty\), and its automorphic quotient is used in uniformization.
`Res′` is the \(\mathbb Z\)-indexed coproduct construction, not ordinary
restriction of scalars from an infinite extension. The triple stabilizer is
\(\det(g)\operatorname{Nrd}(b)\mathrm{Cl}(w)^{-1}\in\mathcal O^\times\), with
\(\mathrm{Cl}\) sending geometric Frobenius to a uniformizer. Formal
\(\mathcal O_D\)-module Lie algebras are invertible
\(\mathcal O_d\otimes B\)-modules, not merely vector spaces of dimension \(d\).
The action on the formal Drinfeld space through Frobenius on the unramified
base is distinguished from the unit action on its covers.

Kaiser’s correction to LRS retains both the dual representation and the
\(q^{-1}T^{-1}\) argument. Poincaré duality pairs the \(\Pi\)- and
\(\Pi^\vee\)-isotypes. The graded-chain relation compares orders at the
specified powers of \(q_\infty\); it does not impose self-duality or
integrality. Middle-degree concentration is claimed only for the selected
proved transfer/globalization inputs. Independence of the local parameter
is within the fixed global setup, with no unstated curve-independence result.
The Hochschild–Serre degeneration uses the required injectivity in Ext,
not a projectivity assumption.

## Sources and versions

The main spine is Fargues–Scholze, Chapters VIII–X. Its author-hosted
356-page text has printed page numbers equal to PDF page numbers and SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
Locators below refer to that text, rather than to the separate published
pagination. The packets retain their version-of-record access qualifications.
Kaletha’s preprint pages in ES5 and published pages in ES7 remain distinct.
The bibliography qualifies every source by part, so a shared source ID does
not silently merge different versions. Literal excerpts and full access
records remain in the packets; each declaration below gives its locator and
the mathematical match. Corrected source findings are summarized in the
[source-correction register](#source-corrections).

The remaining sources have specific roles: Lafforgue supplies the
character/reconstruction argument; Fargues supplies the torus torsor and
reciprocity conventions; Kaletha and Kottwitz supply the group reductions;
Scholze–Weinstein supplies the mixed-characteristic tower comparison; and
Laumon–Rapoport–Stuhler, Kaiser and Hausberger supply the equal-characteristic
automorphic and cohomological route. Source claims are limited to their
listed locators; imported proof interiors and unresolved expansions are
identified as supplier obligations.

### Sources for part ES0

<a id="source-es0-fs-geometrization"></a>

**FS-geometrization (ES0).** Laurent Fargues and Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; version is identified here by its SHA-256, not an unverified arXiv byte equivalence. Printed page numbers equal PDF page numbers.

Version fingerprint: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

**Source scope supplied by this part.**

- I.9.5 pp. 35–36 and I.10.2 p. 38: conjectural ell-independence and categorical LLC statements.
- VI.12 pp. 239–241: switching/Chevalley comparison including the inner rho-hat(-1) correction and proof.
- VIII.3.7 pp. 288–290 and VIII.4 pp. 290–293: continuous universal-property qualifications and excursion construction; full abstract ownership imported from LP2.
- VIII.5.1–VIII.5.2 p. 293: integral generation statements read; proof interiors imported from LP3/LP4, not claimed read in this part’s source record.
- IX.1–IX.3 pp. 320–327: condensed enrichment, normalized Hecke family and multi-leg local-shtuka comparison.
- IX.4–IX.5 pp. 327–330: Schur assignment boundary; wild cutoff proof, components, spectral center and duality.
- IX.6 opening p. 330 and IX.7 pp. 334–338: inspected for ownership and parabolic/GL_n returns; ES5–ES7 are imported, not rebuilt.
- X.0–X.3 pp. 339–350: all definitions, universal/action/colimit/free-group/discrete-group proofs, Whittaker sheaf, elliptic context, and conjectural statements.

<a id="source-es0-mathlib-prime-spectrum"></a>

**mathlib-prime-spectrum (ES0).** Mathlib contributors, [Prime spectrum: zero loci and radical ideals](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174

Version fingerprint: `10502028b8117b7fd3b51d741f95b302025790dbc859bdb5c0145ff09fb19b05`.

**Source scope supplied by this part.**

- zeroLocus, mem_zeroLocus, radical, inf and product zero-locus statements; the support plan applies these existing results rather than planning them again.

### Sources for part ES5

<a id="source-es5-fs-geometrization"></a>

**FS-geometrization (ES5).** Laurent Fargues, Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page preprint; locators below use its printed pages, which equal PDF pages. Separately collated with arXiv:2102.13459v4 (27 November 2024); not the 2026 published pagination.

Version fingerprint: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

**Source scope supplied by this part.**

- II.2.1, pp. 58–61: the height-one Lubin–Tate universal cover, O(1) sections and the E-times torsor on Div1.
- VI.12.1 and its complete proof, pp. 239–241: switching, Chevalley and the rho(-1) sign.
- VII.7.1–VII.7.2 and proofs, pp. 271–273; VII.7.9–VII.7.10, pp. 275–276: stratum equivalence, relative-homology left adjoint and exterior Hom comparison.
- VIII.3.7–VIII.3.8 with all three clauses and both relations, pp. 288–290; VIII.4 and VIII.4.3, pp. 290–293.
- IX.1–IX.2, pp. 320–323: condensed enhancement and relative-homology Hecke operators.
- IX.4–IX.6, pp. 327–333, including complete proofs of IX.6.1–IX.6.5. IX.6.2 display visually checked and compared with arXiv v4.
- IX.7.1, p. 334: centre restriction to strata and assertion of embedding independence; IX.7.3, pp. 337–338: the parabolic input to smooth duality.

<a id="source-es5-lafforgue-2018"></a>

**Lafforgue-2018 (ES5).** Vincent Lafforgue, [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10). arXiv:1209.5352v10, 10 January 2018; J. Amer. Math. Soc. 31 (2018), 719–891. Locators are preprint pages.

Version fingerprint: `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`.

**Source scope supplied by this part.**

- Proposition 11.7 and proof, pp. 143–147, including Lemma 11.10: finite anchors, uniqueness, multiplicativity and the characteristic-zero continuity argument. The local general-coefficient character theorem is imported from LP2, not re-planned from the global application.

<a id="source-es5-kaletha-2018"></a>

**Kaletha-2018 (ES5).** Tasho Kaletha, [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2). arXiv:1502.00650v2; published J. Eur. Math. Soc. 20 (2018), 61–101. Locators are preprint pages.

Version fingerprint: `067aa7999a96980da07ebf90ab5cf7b30819a34235460c0818ad6d96dae2cfb3`.

**Source scope supplied by this part.**

- Section 5.1, pp. 16–19: Definition 5.1, Proposition 5.2, Corollary 5.3 and Facts 5.4–5.6, with proofs and representation-extension paragraph. The field here is p-adic.

<a id="source-es5-fargues-abeljacobi"></a>

**Fargues-AbelJacobi (ES5).** Laurent Fargues, [Simple connexité des fibres d’une application d’Abel-Jacobi et corps de classe local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf). Author-hosted preprint cdc.pdf; published Ann. Sci. Éc. Norm. Supér. (4) 53 (2020), 89–124. Proposition numbers and pages below are those of this author copy.

Version fingerprint: `35c7268fd6ce086f1267a00c18e02900c87ed5da65781d3b8695644d6e8fef73`.

**Source scope supplied by this part.**

- Section 2.3 and Proposition 2.16, pp. 8–10: Lubin–Tate torsor and Frobenius descent.
- Propositions 3.1 and 3.3 with proof, pp. 12–13: the Weil dictionary and inverse-character/inverse-Artin normalization.
- Section 5.2, pp. 18–19: geometric reciprocity and equal-characteristic range, used to identify the requested scope.

### Sources for part ES7

<a id="source-es7-fs-geometrization"></a>

**FS-geometrization (ES7).** Laurent Fargues; Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; printed page equals PDF page. Version is identified by this hash, without asserting byte identity with an arXiv version.

Version fingerprint: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

**Source scope supplied by this part.**

- IX.7, pp. 334–338, read in full, including all four proofs/formulas, coefficient and z-embedding reductions and the two-leg trace calculation.
- VI.11 duality, pp. 235–239, and VI.12, p. 239: passages used for the dual-Levi/cyclotomic conventions. The remaining general Satake proof is imported from GS4.
- IX.3/IX.5/IX.6 statements and source locators inspected through the existing HS and ES supplier packets; these sections are not claimed read in full in this part’s source record.
- REV-ExcursionOperatorsAndSpectralAction--ES7 read IX.7 (pp. 334–338) in full, Theorem IX.6.1 (p. 330) and Corollary III.4.3 (p. 101).

<a id="source-es7-hausberger-2005"></a>

**Hausberger-2005 (ES7).** Thomas Hausberger, [Uniformisation des variétés de Laumon–Rapoport–Stuhler et conjecture de Drinfeld–Carayol](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf). Ann. Inst. Fourier 55(4) (2005), 1285–1371; journal PDF with cover. French text layer.

Version fingerprint: `d51dc22168dcd4831726197b1cef252ea784cc9abbce4cf521465423638daf48`.

**Source scope supplied by this part.**

- §§1.1–1.3, pp. 1291–1293: order data, Definition 1.1, normalization/index shift and level structures.
- §3.1, Definition 3.1 and Theorem 3.4, pp. 1302–1304: definition and isogeny classification; the source itself refers out for complete coordinate-module proofs.
- Theorems 6.1/6.4, pp. 1311–1313, §7.2–7.3, pp. 1317–1319, and Theorems 8.1/8.3 with the D̄ double coset setup, pp. 1321–1323: statements and adjacent proof discussion read. The full uniformization proof is not claimed expanded.
- §§9.1–9.3, pp. 1333–1338: local transfer, independent LLC, Res′, triple stabilizer, Definition 9.3, the admissibility caveat and Theorem 9.5.
- §10.1–10.2, pp. 1338–1342, and §§10.3.2–10.3.3, pp. 1352–1356: selected transfers, spectral sequence, Ext finiteness, cuspidal degeneration and final proof.
- Appendix A.9–A.12, pp. 1363–1365: analytic quotient spectral-sequence application. Earlier Berkovich foundational references are not claimed read.

<a id="source-es7-lrs-1993"></a>

**LRS-1993 (ES7).** Gérard Laumon; Michael Rapoport; Ulrich Stuhler, [D-elliptic sheaves and the Langlands correspondence](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf). Invent. Math. 113 (1993), 217–338; published journal scan, 124 PDF pages; printed page = PDF page + 215. OCR used for navigation; crucial displayed formulas checked against page images.

Version fingerprint: `05ea7ab8cb64577f5d421f37255a7cfd58b6fc763294038cd2e87475d80ab87e`.

**Source scope supplied by this part.**

- Introduction pp. 217–218 and statements/proof passages in §§4–6, pp. 236–246: smooth stack, fixed-degree level scheme, division properness. Full Lemma-level moduli closure remains listed.
- §13, pp. 289–293, read throughout: facet sum, EP identities, compact spectrum and trace formula. §13.8’s expressly unproved general assertions are excluded.
- §14, pp. 293–309: cohomology/isotypes, trace 14.9, Corollary 14.11, Theorem 14.12 and its genericity remark, graded local representations 14.13–14.17 and the unpublished ample-class discussion 14.19. Read with Kaiser, not as a self-dual isotype theorem.
- §15.10–15.17, pp. 314–319: selected globalizations/transfer, selected global representation, independence, pair constants and numerical-surjectivity statement. Numerical proof §§15.18–15.20 and quoted Henniart inputs remain a source/proof refinement.

<a id="source-es7-kaiser-erratum"></a>

**Kaiser-erratum (ES7).** Christian Kaiser (as identified by the author-hosted source catalogue), [Errata for [LRS]](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf). Two-page author-hosted erratum; undated. Both pages inspected visually.

Version fingerprint: `6aa9e01d3551e3f0e3d8ca3d98acba98a1e163e723d342f9ccd719ae4dc02c54`.

**Source scope supplied by this part.**

- Both pages in full: Corollary 14.11 replacement (dual AND q^{-1}); Lemma 14.14′, Proposition 14.17′, and induction proof. Neither self-duality nor integrality retained as amended-lemma assumptions.

<a id="source-es7-kaletha-2018"></a>

**Kaletha-2018 (ES7).** Tasho Kaletha, [Rigid inner forms vs isocrystals](https://ems.press/content/serial-article-files/32267). J. Eur. Math. Soc. 20 (2018), 61–101; publisher PDF.

Version fingerprint: `cfd4f90fd84806dcb328840e620d7934772d86439514e73c1bb060c222b6a030`.

**Source scope supplied by this part.**

- §§5.1.1–5.1.2, pp. 78–80: Definition 5.1, Proposition 5.2, Corollary 5.3, Facts 5.4–5.5 and their proofs. The paper’s standing p-adic hypothesis is retained; the equal-characteristic use needs an explicit extension.

<a id="source-es7-kottwitz-2014"></a>

**Kottwitz-2014 (ES7).** Robert E. Kottwitz, [B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728). arXiv:1401.5728 author text; source identified by URL/hash, not an inferred version number.

Version fingerprint: `37c9980b749d315d014c5046f486ea9d8bac1acc3753fe766ae45ac7907f12a4`.

**Source scope supplied by this part.**

- §10.1 and §10.10, Proposition 10.4 and Lemma 10.5, p. 50 (valid for any local or global field); Proposition 13.1, pp. 65–66 (κ on basic classes).

<a id="source-es7-sw20"></a>

**SW20 (ES7).** Peter Scholze; Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). Author copy dated 27 March 2020.

Version fingerprint: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.

**Source scope supplied by this part.**

- Lecture 24: Theorem 24.2.5, p. 227 (p-divisible groups over ℤ_p, E = ℚ_p) and Corollary 24.3.5, p. 231 (EL/PEL data), read by REV-ExcursionOperatorsAndSpectralAction--ES7; the O_E case is the EL instance Res_{E/ℚ_p}GL_n of 24.3.5, requested from ET.6a.

## Layer overview

Part order is the reading order. The exact declaration graph is the implementation order: the ES4 basic decomposition and ES6 smooth-dual theorem are late returns from ES7. Whole-layer contraction can produce apparent cycles; these late nodes do not feed the earlier ES6 functoriality inputs. The characteristic-zero and equal-characteristic realizations are alternatives for the shared abstract trace calculation. They are combined only in the all-field conclusion.

| Part | Layer | Target | Nodes | Status |
| --- | --- | --- | ---: | --- |
| ES0 | [`ES0`](#excursionoperatorsandspectralaction-es0) | Enhanced centres and Bun excursion operators | 6 | planned |
| ES0 | [`ES0:classical-center`](#excursionoperatorsandspectralaction-es0-classical-center) | Restriction to the classical Bernstein centre | 2 | planned |
| ES0 | [`ES1`](#excursionoperatorsandspectralaction-es1) | Spectral and geometric centres | 1 | planned |
| ES0 | [`ES1:finite-ramification`](#excursionoperatorsandspectralaction-es1-finite-ramification) | Uniform wild cutoffs and components | 4 | planned |
| ES0 | [`ES1:spectral-center`](#excursionoperatorsandspectralaction-es1-spectral-center) | The spectral-to-geometric centre map | 3 | planned |
| ES0 | [`ES2`](#excursionoperatorsandspectralaction-es2) | Universal and rational spectral actions | 8 | planned |
| ES0 | [`ES3`](#excursionoperatorsandspectralaction-es3) | Integral approximation and spectral actions | 9 | planned |
| ES0 | [`ES4`](#excursionoperatorsandspectralaction-es4) | Central support, duality and elliptic components | 9 | planned |
| ES5 | [`ES5`](#excursionoperatorsandspectralaction-es5) | Schur objects and semisimple parameters | 8 | planned |
| ES5 | [`ES6`](#excursionoperatorsandspectralaction-es6) | Coefficient policy for centre comparisons | 1 | planned |
| ES5 | [`ES6:functoriality`](#excursionoperatorsandspectralaction-es6-functoriality) | Group changes, torus reciprocity and twists | 10 | partial |
| ES5 | [`ES6:duality`](#excursionoperatorsandspectralaction-es6-duality) | Duality and contragredients | 2 | planned |
| ES7 | [`ES7:parabolic`](#excursionoperatorsandspectralaction-es7-parabolic) | Stratum centres and parabolic induction | 8 | planned |
| ES7 | [`ES7:GLn-comparison`](#excursionoperatorsandspectralaction-es7-gln-comparison) | Characteristic-zero classical comparison | 5 | planned |
| ES7 | [`ES7:function-field-automorphic`](#excursionoperatorsandspectralaction-es7-function-field-automorphic) | Division-algebra automorphic inputs | 12 | planned |
| ES7 | [`ES7:equal-characteristic`](#excursionoperatorsandspectralaction-es7-equal-characteristic) | D-elliptic geometry and the equal-characteristic comparison | 23 | planned |
| ES7 | [`ES7`](#excursionoperatorsandspectralaction-es7) | Classical agreement for every local field | 2 | planned |

## Part I. Centres, excursions, actions and support (ES0–ES4)

<a id="excursionoperatorsandspectralaction-es0"></a>

### ES0. Enhanced centres and Bun excursion operators

Construct the enhanced centre before evaluating any operator. The abstract excursion datum and its relations are imported from LP2. Creation, Weil action and annihilation in the Bun Hecke category give its enhanced specialization; continuity is a condensed statement. The ordinary homotopy centre is a comparison target, so the construction does not replace higher coherence with pointwise endomorphisms.

<a id="excursionoperatorsandspectralaction-es0-bernstein-center-of-a-category"></a>

#### Enhanced Bernstein center

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`. Suggested name: `enhancedCenter`. Planet: **Enhanced Bernstein center**.

For a Lambda-linear stable infinity-category C, define Z_enh(C) = pi_0 Map_Fun^ex_Lambda(C,C)(id_C,id_C), with addition from stability and multiplication from composition. Its E_2 structure makes pi_0 a commutative Lambda-algebra. When C is condensed enriched, retain the induced condensed endomorphism algebra. For D_lis use its given condensed enhancement and identify the center of compact objects with that of Ind(C) through the colimit-preserving extension.

**Hypotheses.**

- C is small and idempotent complete, or presentable and compactly generated with its specified compact subcategory.
- The functor category and mapping object are enhanced; ordinary CatCenter is only an imported comparison target.

**Construction or proof.**

1. Form the enhanced exact endofunctor category and the endomorphisms of its monoidal unit.
2. Use composition and the interchange law to obtain the E_2 structure, then take pi_0 and its scalar map.
3. Use the universal property of Ind to extend exact endofunctors and natural transformations; retain condensed enrichment from HS1.

**Uses determining the interface.**

- **IX.5:** Receives the excursion map and its component idempotents.
- **ES5:** Evaluation at a Schur object supplies an excursion character.

**API.**

- `enhancedCenter_eval` (projection): Each object X has a Lambda-algebra map Z_enh(C) -> pi_0 End_C(X).
- `enhancedCenter_scalars` (structure): The scalar lambda evaluates to lambda times id_X at every X.
- `enhancedCenter_ind` (equivalence): Restriction from colimit-preserving natural endomorphisms on Ind(C) to C is an equivalence of mapping objects, hence of degree-zero centers.
- `enhancedCenter_naturality` (relation): For u:X->Y, u composed with z_X equals z_Y composed with u, with the coherent enhanced naturality inherited from z.

**Unit tests.**

- `center_scalar_eval` (computation): For lambda in Lambda, evaluation of its scalar central class on X is lambda id_X.
- `center_zero_category` (degenerate): For the zero stable category the enhanced center is the zero ring.
- `center_module_category` (characterisation): For C = Perf(A), A an ordinary commutative Lambda-algebra, Z_enh(C) identifies with A through multiplication, and evaluation at A is that identification.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- `EnhancedDerivedSheaves:E5:abstract`
- `EnhancedDerivedSheaves:E5:presentability`
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`
- `mathlib:CategoryTheory.CatCenter`
- `mathlib:CategoryTheory.CatCenter.app`
- `mathlib:CategoryTheory.CatCenter.naturality`
- `mathlib:CategoryTheory.Linear.toCatCenter`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.1 pp. 320–321; IX.5 p. 328; VIII.4.1 p. 291. FS specifies the enhanced center pi_0 End(id). The E_2 and Ind mapping-object facts are requested from E5; the Perf(A) test uses Hochschild cohomology in degree zero, not an asserted comparison with all homotopy-category centers.

<a id="excursionoperatorsandspectralaction-es0-enhanced-to-homotopy-center"></a>

#### Comparison with the homotopy-category center

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES0/enhanced-to-homotopy-center`. Suggested name: `enhanced_to_homotopy_center`.

Evaluation of an enhanced central class on objects induces a natural Lambda-algebra map Z_enh(C) -> CatCenter(hC). It commutes with scalar maps and evaluation. No injectivity or surjectivity is asserted for general stable C.

**Hypotheses.**

- C and hC carry the supplied Lambda-linear enhancement.

**Construction or proof.**

1. Take pi_0 of the coherent natural transformation.
2. Check naturality in hC and the additive/multiplicative identities using the enhanced composition laws.

**Acceptance.**

- Check the square of scalar maps and the square of evaluation maps.
- Do not assert that this comparison is always an isomorphism.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`](#excursionoperatorsandspectralaction-es0-bernstein-center-of-a-category)
- `mathlib:CategoryTheory.CatCenter`
- `mathlib:CategoryTheory.CatCenter.app`
- `mathlib:CategoryTheory.CatCenter.naturality`
- `mathlib:CategoryTheory.Linear.toCatCenter`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 p. 328; Mathlib Center/Basic and Center/Linear at the pins. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es0-excursion-datum-and-operator"></a>

#### Excursion operators on Bun_G

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`. Suggested name: `bunExcursionOperator`. Planet: **Excursion operators**.

Apply the imported LP2 excursion-datum construction to the HS1/HS4 coherent Hecke family. For D=(I,V,alpha,beta,gamma), with alpha:1->V restricted to diagonal H and beta:V restricted to diagonal H->1, define S_D(A)=T_beta(A) composed with gamma acting on T_V(A) composed with T_alpha(A), using fusion and T_1 = id. It is a coherent natural endomorphism of the identity on the relevant finite-wild compact category.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- The matrix-coefficient datum, the invariant function and its abstract relations are imported from LP2. Alpha and beta are arbitrary diagonal-invariant maps, not necessarily adjunction units/counits.

**Construction or proof.**

1. Insert the actual HS kernels and their unit/fusion identifications into LP2’s abstract construction.
2. Use HS1’s condensed Weil action for the middle arrow.
3. Keep creation and annihilation natural at the enhanced level rather than checking only objectwise endomorphisms.

**Uses determining the interface.**

- **ES0 enhanced algebra map:** Supplies each generator of the excursion map.
- **ES4 local shtukas:** Naturality makes the operators commute with smooth group actions.

**API.**

- `bunExcursionOperator_app` (projection): The component on A is T_alpha(A), then gamma, then T_beta(A), with the specified unit identifications.
- `bunExcursionOperator_naturality` (relation): For u:A->B, u followed by S_D(B) equals S_D(A) followed by u.
- `bunExcursionOperator_function` (characterisation): Data with the same invariant function and Weil tuple induce the same operator, by the imported LP2 independence theorem.
- `bunExcursionOperator_fusion` (compatibility): Pulling legs together along a map I->J agrees with HS4 fusion and the LP2 reindexing relation.

**Unit tests.**

- `excursion_trivial_rep` (degenerate): For V=1 and alpha=beta=id, S_D=id for every Weil tuple.
- `excursion_identity_tuple` (computation): If all gamma_i=1 then S_D=T_(beta alpha); in particular a duality coevaluation/evaluation pair gives dim(V) id, rather than automatically id.
- `excursion_two_leg_trace` (computation): For H=GL_n, V=std external tensor std-dual and its usual creation/annihilation maps, evaluation on a parameter phi gives tr(phi(gamma_1) phi(gamma_2)^(-1)).
- `excursion_nonsplit` (compatibility): On a nonsplit torus, the one-cocycle equation is phi(uv)=phi(u) u(phi(v)); the construction uses twisted, rather than ordinary, conjugation.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`
- `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`
- `EnhancedDerivedSheaves:E5:abstract`
- [`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`](#excursionoperatorsandspectralaction-es0-bernstein-center-of-a-category)

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), VIII.4.2 pp. 291–292; IX.2 pp. 321–324. VIII.4.2 defines the abstract datum and operator; IX.2 supplies the normalized enhanced Bun_G Hecke family. Only the specialization is owned here.

<a id="excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center"></a>

#### Enhanced excursion algebra action

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`. Suggested name: `excursion_algebra_to_bernstein_center`. Planet: **Excursion algebra action**.

For a finite-wild compact Hecke category D^P, the LP2 algebra Exc(W,H) tensor Lambda maps naturally to Z_enh(D^P) by f_D,gamma |-> [S_D]. Its projection to CatCenter(hD^P) is the imported VIII.4.1 map. Coherent HS4 comparisons between enhanced natural transformations give equal classes in pi_0, where the excursion algebra relations hold; no Perf action or good-prime hypothesis is needed.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- P is open normal in wild inertia, acts trivially on the pinned H action, and D^P consists of compact A whose entire Hecke family descends to W_E/P.
- W is a dense discrete tame discretization of W_E/P.

**Construction or proof.**

1. Use the LP2 presentation and relations on the coherent HS4 family.
2. Construct the enhanced composites and coherent HS4 comparisons; equality of their classes supplies each relation in the degree-zero center. Strict equality of enhanced morphisms or a map of algebra spectra is not asserted.
3. Take pi_0 to obtain the algebra map and verify its homotopy-center projection.

**Acceptance.**

- Check additivity, multiplication and unit on the LP2 generators.
- For a noninjective leg map check the same HS4 fusion diagram, not a separately assumed relation.
- At a forbidden integral prime retain this algebra map without asserting an invariant-ring isomorphism.
- Use commutativity of finite-set reindexing squares, not the false cartesian assertion in the imported LP2 node; see source issue ExcursionOperatorsAndSpectralAction/E1 and the LP2 refinement request.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`](#excursionoperatorsandspectralaction-es0-excursion-datum-and-operator)
- [`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`](#excursionoperatorsandspectralaction-es0-bernstein-center-of-a-category)
- [`ExcursionOperatorsAndSpectralAction:ES0/enhanced-to-homotopy-center`](#excursionoperatorsandspectralaction-es0-enhanced-to-homotopy-center)
- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`
- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`
- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `EnhancedDerivedSheaves:E5:abstract`
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category`](#excursionoperatorsandspectralaction-es1-finite-ramification-finite-wild-hecke-category)

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), VIII.4.1 pp. 291–293; IX.5 p. 328. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es0-continuity-of-excursion-evaluations"></a>

#### Condensed continuity of excursions

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES0/continuity-of-excursion-evaluations`. Suggested name: `continuity_of_excursion_evaluations`.

For every compact A and each fixed finite-leg invariant coefficient, the map (W_E/P)^I -> pi_0 End(A) given by the creation–Weil–annihilation operator is a map of condensed sets, whenever P is the uniform cutoff of A. Evaluation along a Schur scalar identification is therefore continuous. The full excursion algebra need not be canonically independent of discretization at bad primes.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

**Construction or proof.**

1. Compose the condensed action on T_V(A) with the condensed natural creation and annihilation morphisms.
2. Use the relatively discrete Hom structure from IX.1.2 and the cutoff theorem.
3. For comparisons of presentations invoke LP2’s continuous universal property with its flatness restriction.

**Acceptance.**

- Continuity is on the completed Weil quotient, rather than only its dense subgroup.
- Check a nonsplit torus with its prescribed projection to Q.
- Do not infer a canonical representative of a Schur parameter.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`](#excursionoperatorsandspectralaction-es0-excursion-datum-and-operator)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`](#excursionoperatorsandspectralaction-es1-finite-ramification-uniform-wild-subgroup)
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`
- `HeckeStacksAndLocalShtukas:HS1`
- `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.1.2 pp. 320–321; IX.5.1 pp. 327–328; VIII.3.7 pp. 288–290. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es0-discretisation-of-the-weil-group"></a>

#### Comparison of discretizations

**Comparison.** Node `ExcursionOperatorsAndSpectralAction:ES0/discretisation-of-the-weil-group`. Suggested name: `discretisation_of_the_weil_group`.

Two choices of tame discretization yield canonically identified cocycle schemes by restriction and unique continuous extension. Their excursion evaluations on flat relatively discrete targets agree through the ell-torsion-free quotient of Exc, which is independent of discretization. At good primes (ell not dividing |pi_1(H)_tors|) or after inverting ell, Exc itself identifies with the invariant algebra, so the corresponding comparison is an isomorphism. At other primes full-algebra independence is not asserted; condensed operator evaluation and component idempotents remain intrinsic.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

**Construction or proof.**

1. Identify the two cocycle schemes through W_E/P.
2. Use LP2’s continuous universal property only on flat targets.
3. Use the invariant comparison in its exact coefficient range and the universal homeomorphism for idempotents outside it.

**Acceptance.**

- Retain the ell-torsion-free qualification in the general comparison.
- The change of Frobenius/tame generator composes through the intrinsic cocycle functor.

**Direct prerequisites.**

- `LanglandsParameterStacks:LP0/discretization-and-unique-extension`
- `LanglandsParameterStacks:LP0/change-of-discretization`
- `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), VIII.3.7 pp. 288–290; IX.5 p. 328. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es0-classical-center"></a>

### ES0:classical-center. Restriction to the classical Bernstein centre

Restrict the enhanced action along the trivial-stratum embedding and then to the smooth heart. SR.1 supplies the ring-valued abelian centre and its corner description. Transport to complex coefficients uses a chosen abstract field isomorphism; no topological or condensed coefficient equivalence is inferred.

<a id="excursionoperatorsandspectralaction-es0-classical-center-map-to-the-classical-bernstein-center"></a>

#### Restriction to the smooth Bernstein center

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center`. Suggested name: `map_to_the_classical_bernstein_center`. Planet: **Smooth center comparison**.

For the fully faithful stratum embedding j_!:D(G(E),Lambda)->D_lis(Bun_G,Lambda), restrict an enhanced central class to its essential image and transport it back to the enhanced derived smooth category. Evaluation on degree-zero smooth representations gives a Lambda-algebra map to the ordinary abelian Bernstein center Z(Sm_Lambda(G(E))). This last step uses t-exactness of the identity transformation and SR.1’s abelian center; no general center-of-homotopy-category isomorphism is used.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the specified b=1 stratum embedding and its fully faithful enhanced adjunction.
- SR.1 supplies the abelian center over rings with a cofinal family of compact opens of invertible pro-order.

**Construction or proof.**

1. Restrict along j_! and use full faithfulness on enhanced mapping objects.
2. Take pi_0 and restrict to the heart of the derived smooth category.
3. Compose with the SR.1 abelian center/Hecke-corner dictionary.

**Acceptance.**

- At G=1 the restriction and heart maps give the ordinary scalar action.
- No complex block decomposition is required for the ring-valued comparison.
- General b-stratum spectral composites Psi_G^b remain ES7:parabolic’s constructions.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`](#excursionoperatorsandspectralaction-es0-bernstein-center-of-a-category)
- [`ExcursionOperatorsAndSpectralAction:ES0/enhanced-to-homotopy-center`](#excursionoperatorsandspectralaction-es0-enhanced-to-homotopy-center)
- `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`
- `VStackSheavesAndLisseCategories:VS4`
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`
- `SmoothRepresentationsOfLocalGroups:SR.1`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 p. 329; VII.7.2 pp. 271–273. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es0-classical-center-complex-block-comparison"></a>

#### Characteristic-zero block comparison

**Comparison.** Node `ExcursionOperatorsAndSpectralAction:ES0:classical-center/complex-block-comparison`. Suggested name: `complex_block_comparison`.

Choose an abstract field isomorphism iota:Qbar_ell ≃ C and transport smooth algebraic representations by scalar extension along iota. This gives an equivalence of ordinary smooth representation categories and hence an isomorphism of their CatCenter rings. Composing the Qbar_ell excursion/center action with it gives SR.3’s complex blockwise action. The comparison depends on iota; it does not transport the condensed Weil topology or provide an ell-independent block map.

**Hypotheses.**

- Coefficients are Qbar_ell and C as abstract fields, with a specified isomorphism.
- SR.3 supplies the complex Bernstein decomposition and its identification of the block centers.

**Construction or proof.**

1. Use SR.0’s smooth category and its field-transport equivalence.
2. Transport natural endomorphisms along the equivalence.
3. Apply the SR.3 complex block description to the composite from the preceding node.

**Acceptance.**

- Check that a scalar lambda maps to iota(lambda) on each block.
- State dependence on iota and keep this comparison out of the characteristic-ell ES5 route.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center`](#excursionoperatorsandspectralaction-es0-classical-center-map-to-the-classical-bernstein-center)
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 p. 329; roadmap ES0:classical-center coefficient dictionary. FS supplies the map to the smooth center, not the complex block theorem. SR.3 and the requested coefficient dictionary supply this roadmap-added comparison.

<a id="excursionoperatorsandspectralaction-es1"></a>

### ES1. Spectral and geometric centres

Keep the invariant-coordinate spectral centre, the enhanced geometric centre and its Hecke-compatible subalgebra distinct. Their relation is constructed from excursions in the next two refinements. The stronger general stratum composite belongs to ES7:parabolic.

<a id="excursionoperatorsandspectralaction-es1-spectral-and-geometric-centers"></a>

#### Spectral, geometric and Hecke-compatible centers

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers`. Suggested name: `heckeCenter`. Planet: **Spectral center**.

Write Z_spec = Gamma([Z^1(W_E,H)_Lambda/H],O) and Z_geom = Z_enh(D_lis(Bun_G,Lambda)), using LP’s function ring and ES0’s enhanced center. Define Z_geom,Hecke as the subalgebra of z such that z_(T_V A)=T_V(z_A) for every finite I,V,A. The general geometric center need not satisfy this stronger condition.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the imported global-function ring; do not identify its infinite parameter union with one finite-type affine scheme.

**Construction or proof.**

1. Name the two already supplied algebras.
2. Define the Hecke-compatible subalgebra by the displayed equality.
3. Check closure under addition, multiplication and scalars from the exact Lambda-linear functors.

**Uses determining the interface.**

- **IX.5.2:** Specifies the target of the conditional spectral center map.
- **ES2 center agreement:** Receives degree-zero functions from the categorical action.

**API.**

- `heckeCenter_mem` (characterisation): z lies in the Hecke-compatible subalgebra iff every T_V carries z_A to z_(T_V A).
- `heckeCenter_inclusion` (coercion): The inclusion Z_geom,Hecke -> Z_geom is an injective Lambda-algebra map.
- `heckeCenter_scalars` (structure): Every Lambda scalar lies in Z_geom,Hecke.
- `heckeCenter_comp` (relation): Compatibility with two functors implies compatibility with their composite.

**Unit tests.**

- `heckeCenter_identity` (degenerate): For the family consisting only of the identity, the compatible subalgebra is the whole center.
- `heckeCenter_product_switch` (non-example): For C=Perf(k)×Perf(k) and the switching functor, Z_geom=k×k while Z_geom,Hecke is the diagonal copy of k.
- `heckeCenter_scalar` (computation): A scalar lambda has the same lambda id action before and after every Lambda-linear T_V.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`](#excursionoperatorsandspectralaction-es0-bernstein-center-of-a-category)
- `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 pp. 328–329. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es1-finite-ramification"></a>

### ES1:finite-ramification. Uniform wild cutoffs and components

For each compact object find one wild subgroup that acts trivially for every Hecke representation and leg set. Coherent quotient-equivariant descent gives the finite-wild subcategory. Clopen parameter idempotents decompose compact objects as a direct sum; its Ind category is a product. Ordinary action triviality alone does not supply enhanced descent.

<a id="excursionoperatorsandspectralaction-es1-finite-ramification-uniform-wild-subgroup"></a>

#### Uniform finite wild ramification

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`. Suggested name: `uniform_wild_subgroup`. Planet: **Finite wild ramification**.

For every compact A in D_lis(Bun_G,Lambda), there is an open normal subgroup P of wild inertia, contained in the kernel of W_E->Q, such that for every finite set I and every V in Rep((H semidirect Q)^I), T_V(A) descends to an object equivariant for (W_E/P)^I. The subgroup depends on A and works simultaneously for all I,V.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

**Construction or proof.**

1. Use vanishing of the Lambda-homology of pro-p P^I to prove quotient-equivariant pullback fully faithful.
2. Choose a tensor generator; a relatively discrete condensed endomorphism algebra has compact inertia image inside a finite Z_ell-module, whose automorphism group is locally pro-ell. Shrink P to kill its pro-p image.
3. Tensor/fusion identifies independent leg actions; close under duals, subquotients and extensions as justified by exact representations, then exterior tensors and reindexing.
4. Replace P by its normal core and intersect with the finite pinned-action kernel.

**Acceptance.**

- Quantifiers are for every compact A, there exists P, for all I,V.
- Test a compactly induced representation through its stratum embedding.
- A noncompact sum with unbounded wild conductors need not have any common P.
- The coefficient condition is ell != p, not the integral-action good-prime restriction.

**Direct prerequisites.**

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`
- `HeckeStacksAndLocalShtukas:HS1`
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`
- `LanglandsParameterStacks:LP0`
- `EnhancedDerivedSheaves:E5:abstract`
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category`](#excursionoperatorsandspectralaction-es1-finite-ramification-finite-wild-hecke-category)

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5.1 pp. 327–328. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es1-finite-ramification-component-decomposition"></a>

#### Component decomposition

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`. Suggested name: `component_decomposition`. Planet: **Component decomposition**.

For D^P consisting of compact A with the uniform P-Hecke cutoff, the enhanced excursion map and LP2’s universal homeomorphism identify component idempotents. Splitting them gives D^P = direct sum_c D^c over pi_0 Z^1(W_E/P,H)_Lambda. Taking the union over P gives the direct sum decomposition of D_lis^omega by parameter components; its Ind-category is the product of the Ind(D^c). Every compact has finitely many nonzero components. A Schur object has exactly one nonzero component.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

**Construction or proof.**

1. Use the component idempotents of the invariant quotient and transport them uniquely through the universal homeomorphism.
2. Split finitely many idempotents on each compact object in the idempotent-complete category.
3. Glue as P shrinks using the same continuous excursions and LP’s open-and-closed transition maps.
4. Extend to Ind; the Ind of a sum of small compact categories is the product of their Ind-categories.

**Acceptance.**

- Check finite support of compact objects and the possibility of infinitely supported Ind objects.
- Use ring idempotents for clopen components, not characteristic functions of arbitrary subsets.
- No invariant-algebra isomorphism at bad primes is needed for the idempotents.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`](#excursionoperatorsandspectralaction-es1-finite-ramification-uniform-wild-subgroup)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)
- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`
- `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`
- `EnhancedDerivedSheaves:E5:presentability`
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category`](#excursionoperatorsandspectralaction-es1-finite-ramification-finite-wild-hecke-category)

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 pp. 328–329. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es1-finite-ramification-center-on-finite-wild-pieces"></a>

#### Compatibility of finite-wild centers

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/center-on-finite-wild-pieces`. Suggested name: `center_on_finite_wild_pieces`.

If P′⊂P are eligible wild subgroups, the inclusion D^P⊂D^P′ intertwines the excursion evaluation maps through restriction of the universal parameter and the dense discretizations. In the coefficient range of the invariant-ring comparison it also intertwines the spectral function actions. The component summands consequently glue independently of choices. Every compact is evaluated on some D^P; no common P for all Ind objects is required.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

**Construction or proof.**

1. Compare each excursion coefficient and Weil tuple using HS4.
2. Use LP’s intrinsic cocycle transitions; at bad primes use only idempotents or qualified torsion-free comparisons.
3. Use the generator presentation to identify the ring maps.

**Acceptance.**

- Check the identity transition and composition for P″⊂P′⊂P.
- Retain the qualified comparison at forbidden integral primes.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`](#excursionoperatorsandspectralaction-es1-finite-ramification-uniform-wild-subgroup)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`](#excursionoperatorsandspectralaction-es1-finite-ramification-component-decomposition)
- `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 pp. 328–329; VIII.3.7 pp. 288–290. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es1-finite-ramification-finite-wild-hecke-category"></a>

#### Finite-wild Hecke subcategory

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category`. Suggested name: `finiteWildCategory`.

For eligible P, define D^P as the full subcategory of compact D_lis objects A such that every T_V(A), for every finite I and V, belongs to the fully faithful image of quotient-equivariant objects for (W_E/P)^I. The image condition uses the enhanced equivariant functor category, including its homotopies. If P′⊂P then D^P⊂D^P′.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- P is open normal in wild inertia and lies in the pinned action kernel.

**Construction or proof.**

1. Use quotient-equivariant pullback and its full faithfulness from the IX.5.1 pro-p homology argument.
2. Define the simultaneous full subcategory.
3. Check closure under finite stable operations and retracts because each quotient-equivariant image is stable and idempotent complete.

**Uses determining the interface.**

- **IX.5:** Subject of the enhanced excursion map and component decomposition.
- **X.0.1:** Provides the categorical finite-wild pieces for gluing the action.

**API.**

- `finiteWild_mem` (characterisation): Membership means simultaneous descent of all I,V Hecke images through (W_E/P)^I.
- `finiteWild_inclusion` (functoriality): For P′⊂P the full inclusion D^P->D^P′ is exact and fully faithful.
- `finiteWild_stable` (structure): D^P is closed under zero, shifts, cofibers and retracts.
- `finiteWild_refine_comp` (relation): The inclusions for P″⊂P′⊂P compose to the inclusion for P″⊂P.

**Unit tests.**

- `finiteWild_zero` (degenerate): The zero compact object lies in D^P for every eligible P.
- `finiteWild_tensor_generator` (characterisation): Trivial P action on the single-leg tensor generator implies membership in D^P by the IX.5.1 tensor/exterior-tensor argument.
- `finiteWild_regular_action` (non-example): For a nontrivial finite wild quotient F acting on its regular representation over coefficients with p invertible, an element of P with nontrivial image in F does not act trivially; such an equivariant orbit does not descend through W_E/P.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`
- `EnhancedDerivedSheaves:E5:abstract`
- `EnhancedDerivedSheaves:E5:presentability`
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 pp. 327–328. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es1-spectral-center"></a>

### ES1:spectral-center. The spectral-to-geometric centre map

Use the finite-wild construction and LP’s invariant-function comparison to obtain the centre map in the centre-order coefficient range. Prove change-of-data diagrams within that range and retain the integral excursion-algebra map outside it. Group changes must impose the condition for all groups involved.

<a id="excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map"></a>

#### Spectral center action

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`. Suggested name: `spectral_to_geometric_center_map`. Planet: **Spectral center action**.

Assume |pi_0 Z(G)| is invertible in Lambda. There is a natural Lambda-algebra map Z_spec -> Z_geom,Hecke -> Z_geom, compatible with component decomposition. On each compact A it factors through functions on one sufficiently small finite-wild piece. This is IX.5.2, obtained from the excursion map and the invariant-coordinate comparison. General Psi_G^b composites are imported from ES7:parabolic rather than constructed again here.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the exact center-order condition from IX.5.2; GS supplies its relation to the dual root datum.

**Construction or proof.**

1. Apply the invariant comparison on each eligible finite-wild compact category.
2. Glue via the component decomposition and the finite-wild compatibility.
3. Commute the insertion of a Hecke kernel with the creation–Weil–annihilation composite.

**Acceptance.**

- Check the scalar and component idempotent images.
- Check z_(T_V A)=T_V(z_A).
- The statement stops at the Hecke-compatible center; b-stratum Psi maps are ES7’s.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers`](#excursionoperatorsandspectralaction-es1-spectral-and-geometric-centers)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`](#excursionoperatorsandspectralaction-es1-finite-ramification-component-decomposition)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/center-on-finite-wild-pieces`](#excursionoperatorsandspectralaction-es1-finite-ramification-center-on-finite-wild-pieces)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5.2 p. 329. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es1-spectral-center-center-change-of-data"></a>

#### Center compatibility under change of data

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data`. Suggested name: `center_change_of_data`.

For an extension Lambda->Lambda′ in the eligible IX.5.2 range, the scalar-extended excursion evaluation agrees with evaluation of the same coefficient after derived scalar extension of A and the HS kernels. Therefore the two Z_spec actions agree via the LP coefficient map. A refinement of the finite quotient Q inducing the same pinned W_E action yields the same diagram. Finite-wild transition squares are those of ES1:finite-ramification. This asserts commutativity, not that tensoring with Lambda′ commutes with all invariant rings.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use supplier coefficient-change functors, their normalized kernel comparisons, and the same square root of q.

**Construction or proof.**

1. Compare creation, Weil action and annihilation individually under each comparison functor.
2. Use the excursion generating functions and the conditional invariant comparison to identify the composites.
3. Check identity and composition of each change of data.

**Acceptance.**

- State the necessary supplier comparison functor for derived scalar extension.
- Do not infer base-change isomorphisms of unrestricted invariant rings.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`
- `LanglandsParameterStacks:LP0/functoriality-of-cocycles`
- `HeckeStacksAndLocalShtukas:HS1`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5.2 p. 329; VIII.4.2 pp. 291–293. Roadmap compatibility obligation derived from the shared excursion construction and the imported normalized kernel comparisons, rather than a separately numbered FS theorem.

<a id="excursionoperatorsandspectralaction-es1-spectral-center-excursion-algebra-without-the-coefficient-condition"></a>

#### Excursions at excluded center primes

**Comparison.** Node `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`. Suggested name: `excursion_algebra_without_the_coefficient_condition`.

Without |pi_0 Z(G)| invertible, retain the enhanced excursion action on each D^P and its compatible component idempotents. No Z_spec -> Z_geom map is asserted by this route. These operators suffice for the characteristic-ell Schur parameter theorem of ES5 and for its operator-level compatibility diagrams.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

**Construction or proof.**

1. Keep the excursion construction and universal homeomorphism unchanged.
2. Use idempotents for components and scalar evaluations for Schur objects.
3. Apply the eligible invariant-coordinate map only when its hypotheses hold.

**Acceptance.**

- At a forbidden good-prime/center-order prime, the excursion construction and ES5 route remain available.
- Do not turn a universal homeomorphism into an algebra isomorphism.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)
- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`](#excursionoperatorsandspectralaction-es1-finite-ramification-component-decomposition)

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.6 opening p. 330. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es2"></a>

### ES2. Universal and rational spectral actions

Make the universal-parameter Hecke family from the imported enhanced category. The universal action and affine-quotient pushout/colimit results are targets here, not duplicated in LP4. The rational comparison yields an actual Perf action and identifies its degree-zero centre action; the Whittaker object is defined with its regular compact-induction and support tests.

<a id="excursionoperatorsandspectralaction-es2-compactly-supported-actions"></a>

#### Compactly supported categorical actions

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions`. Suggested name: `compactlySupportedAction`. Planet: **Compactly supported action**.

An action of Perf(Z/H) on a small stable category C is compactly supported if for each X in C, its orbit functor M |-> Act_M(X) factors, up to coherent equivalence, through restriction Perf(Z/H)->Perf(Z^1(W_E/P,H)/H) for some eligible P depending on X. This is a property of the action and its orbit functors, not a choice of one subgroup for the entire category.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the open-and-closed finite-wild exhaustion of the parameter stack.

**Construction or proof.**

1. Form each orbit functor.
2. Require a factorization and coherent comparison on that object.
3. Use the common refinement of finitely many cutoffs to compare choices.

**Uses determining the interface.**

- **X.0.1:** Necessary support condition for the Weil-group universal theorem.
- **X.1.3:** Qualifies the Bun_G rational action.

**API.**

- `compactAction_factor` (characterisation): For each X there exist P, an exact orbit functor from Perf(Z^P/H) and an equivalence of its composite with the original orbit functor.
- `compactAction_refine` (functoriality): A factorization through P induces one through every smaller eligible P′ by restriction to the open-and-closed P piece.
- `compactAction_finite_sum` (compatibility): Finitely many compactly supported orbit functors have a common refined cutoff; in an exact action the direct sum orbit functor has that cutoff.

**Unit tests.**

- `compactAction_zero` (degenerate): The zero object orbit functor factors through every eligible piece.
- `compactAction_single_piece` (characterisation): An action obtained by restriction from a single finite-wild piece has compactly supported orbit functors for all objects.
- `compactAction_unbounded_family` (non-example): For the direct sum of categories Perf(k), indexed by parameters with unbounded wild conductor, finite-support objects have cutoffs but no one cutoff works for every object; its Ind product also has objects with no cutoff.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`
- `EnhancedDerivedSheaves:E5:abstract`
- `EnhancedDerivedSheaves:E5:presentability`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X opening p. 339. The verifier of RT-AREA-geomlanglands/6 assigns Chapter X universal action mathematics to ES2/ES3. The duplicate LP4 compact-support node is proposed for removal, while LP1 retains the geometric exhaustion.

<a id="excursionoperatorsandspectralaction-es2-universal-parameter-hecke-family"></a>

#### Hecke family from the universal parameter

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family`. Suggested name: `universalHeckeFamily`.

For H reductive over a characteristic-zero field L with finite Q action, and an anima S->BQ, evaluation S×Map_(BQ)(S,B(H semidirect Q))->B(H semidirect Q) produces, functorially in finite I, an exact Rep_L(Q^I)-linear monoidal functor Rep_L((H semidirect Q)^I)->Perf(Map_(BQ)(S,B(H semidirect Q)))^(S^I). Composition with an action yields its coherent Hecke family.

**Hypotheses.**

- The target mapping stack and its Perf are the derived stacky constructions supplied by LP1; C is small stable idempotent complete L-linear.
- Use coherent total-space functoriality over Fin, not unrelated functors for each I.

**Construction or proof.**

1. Pull a representation bundle back along universal evaluation.
2. Take the I-fold tensor family and its coCartesian finite-set transport.
3. Compose with the exact monoidal action functor to recover the equivariant endofunctor family.

**Uses determining the interface.**

- **X.1.1:** Defines the forward map from actions to coherent Hecke data.
- **ES2/ES3 center agreement:** Identifies the same excursion matrix coefficients in both constructions.

**API.**

- `universalHecke_eval` (projection): At (s,rho), the representation bundle is V evaluated on rho(s).
- `universalHecke_unit` (simp): The trivial representation produces the monoidal unit family.
- `universalHecke_fusion` (compatibility): The universal evaluation families intertwine tensoring legs along every finite-set map.
- `universalHecke_pullback` (functoriality): For S′->S over BQ the families agree under restriction of the universal parameter.

**Unit tests.**

- `universalHecke_empty` (degenerate): The empty-leg family is the tensor unit.
- `universalHecke_point` (compatibility): For Q=1 and S a point, the family is the tautological representation bundle on BH.
- `universalHecke_free_loop` (computation): For S=BF_1 with generator mapping to sigma in Q, the family on [H/H]_sigma has generator action h sigma on the representation, with twisted conjugation.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- `LanglandsParameterStacks:LP1`
- `LanglandsParameterStacks:LP4/rep-action-on-perf`
- `EnhancedDerivedSheaves:E5:abstract`
- `GeometricSatakeAndFusion:GS4:integral-dual-group`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.1.1 pp. 340–342. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es2-universal-action-theorem"></a>

#### Rational universal action theorem

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`. Suggested name: `universal_action_theorem`. Planet: **Universal action theorem**.

For H reductive over a characteristic-zero field L with finite Q action, S any anima over BQ and C small idempotent-complete stable L-linear, the anima of L-linear actions of Perf(Map_(BQ)(S,B(H semidirect Q))) on C is equivalent to the anima of coherent finite-set exact Rep_L(Q^I)-linear monoidal families Rep_L((H semidirect Q)^I)->End_L(C)^(S^I). The forward map is universal evaluation; both composites are equivalent to the identity as maps of anima.

**Hypotheses.**

- Exact representation categories freely generate their perfect-complex extensions as used in the source.
- Coherence is on the total coCartesian fibrations over Fin.

**Construction or proof.**

1. Both constructions send sifted colimits in S to limits of anima, using the rational colimit lemma.
2. Reduce to finite S and trivialize its Q-torsor to describe Perf(BH^S).
3. Use semisimplicity in characteristic zero and Yoneda to identify monoidal Rep(H^S) functors with the action.
4. Recover unit, tensor, finite-set and higher homotopy coherences by the universal property, then descend the Q-torsor.

**Acceptance.**

- Check S a point, S=BF_1 and a nontrivial Q-torsor.
- Prove equivalence of full coherent-data anima, rather than only their sets of isomorphism classes.
- No integral conclusion follows by inverting ell.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family`](#excursionoperatorsandspectralaction-es2-universal-parameter-hecke-family)
- [`ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits`](#excursionoperatorsandspectralaction-es2-mapping-stack-commutes-with-sifted-colimits)
- `EnhancedDerivedSheaves:E5:abstract`
- `EnhancedDerivedSheaves:E5:presentability`
- `LanglandsParameterStacks:LP1`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.1.1 pp. 340–343. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es2-mapping-stack-commutes-with-sifted-colimits"></a>

#### Colimits of rational mapping-stack Perf

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits`. Suggested name: `mapping_stack_commutes_with_sifted_colimits`. Planet: **Rational colimit theorem**.

For the rational H,Q hypotheses, F(S)=Perf(Map_(BQ)(S,B(H semidirect Q))) preserves sifted colimits as a functor to L-linear small idempotent-complete stable infinity-categories, and preserves all colimits as a functor to symmetric monoidal such categories.

**Hypotheses.**

- L has characteristic zero and H is reductive; pro-reductive quotient presentations are used only in the proof’s affine-quotient comparison.

**Construction or proof.**

1. Reduce to the untwisted Q case by the torsor description.
2. Express the mapping stacks by inverse limits of affine quotients with pro-reductive groups.
3. Use representation generation and vanishing higher cohomology of pro-reductive groups to compare Perf with the filtered colimit.
4. Check finite coproducts and pushouts using the separate affine-quotient pushout theorem.

**Acceptance.**

- Retain the distinction between the two target categories and their two colimit claims.
- The integral analogue for actual Perf(mapping stack) is not asserted.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES2/pushout-of-affine-quotients`](#excursionoperatorsandspectralaction-es2-pushout-of-affine-quotients)
- `LanglandsParameterStacks:LP1`
- `EnhancedDerivedSheaves:E5:presentability`
- `LanglandsParameterStacks:LP3`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.1.2 pp. 342–343. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es2-pushout-of-affine-quotients"></a>

#### Tensor product for affine quotient pushouts

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES2/pushout-of-affine-quotients`. Suggested name: `pushout_of_affine_quotients`. Planet: **Affine quotient pushout**.

Let G be a pro-reductive affine group over a characteristic-zero field L acting on affine derived L-schemes X_0,X_1,X_2, with G-equivariant maps X_1->X_0<-X_2. The natural symmetric monoidal comparison Perf(X_1/G) tensor_(Perf(X_0/G)) Perf(X_2/G) -> Perf((X_1 times^derived_(X_0) X_2)/G) is an equivalence. The tensor product is the pushout in L-linear symmetric monoidal small stable idempotent-complete infinity-categories.

**Hypotheses.**

- Use derived fiber products and the relative tensor product in the named target category.
- Pro-reductivity and characteristic zero supply the representation generation and exact invariants used by the proof.

**Construction or proof.**

1. Pass to Ind module categories over the equivariant coordinate algebras in IndPerf(BG).
2. Compute the relative tensor product by derived tensor product of these algebras.
3. Identify the compact objects using generation by representations; recover the symmetric monoidal equivalence.

**Acceptance.**

- For G=1 this is Perf(A_1) tensor_Perf(A_0) Perf(A_2) = Perf(A_1 tensor^derived_A0 A_2).
- For X_i=Spec L all maps are identities and the comparison is the unit equivalence.

**Direct prerequisites.**

- `EnhancedDerivedSheaves:E5:presentability`
- `LanglandsParameterStacks:LP1`
- `LanglandsParameterStacks:LP4`
- `LanglandsParameterStacks:LP3`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.1.2 proof p. 343. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es2-spectral-action-rational"></a>

#### Rational spectral action on Bun_G

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational`. Suggested name: `spectral_action_rational`. Planet: **Rational spectral action**.

For any field L over Q_ell(sqrt(q)), the coherent HS4 Hecke family gives a natural compactly supported L-linear action of Perf([Z^1(W_E,H)_L/H]) on D_lis(Bun_G,L)^omega, uniquely characterized as coherent data by its restriction along the universal representation families being the HS Hecke action.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- No ell restriction involving pi_1(H)_tors is imposed in this rational theorem.

**Construction or proof.**

1. For each compact A use the uniform wild cutoff, and restrict the family to a dense discrete W.
2. Apply the rational universal theorem and identify its mapping stack with the intrinsic cocycle quotient through LP.
3. Glue the finite-wild action using uniqueness and the open-and-closed transitions.
4. The orbit of each A factors through its cutoff, giving compact support.

**Acceptance.**

- Test the unit representation and a torus character.
- Test the direct sum of two compacts using a common refined cutoff.
- Do not infer full faithfulness of the action functor or categorical LLC.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`](#excursionoperatorsandspectralaction-es2-universal-action-theorem)
- [`ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions`](#excursionoperatorsandspectralaction-es2-compactly-supported-actions)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`](#excursionoperatorsandspectralaction-es1-finite-ramification-uniform-wild-subgroup)
- `LanglandsParameterStacks:LP0/discretization-and-unique-extension`
- `LanglandsParameterStacks:LP1`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `LanglandsParameterStacks:LP4/generation-and-module-comparison`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.1.3 pp. 343–344. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es2-degree-zero-center-agreement"></a>

#### Agreement of action and excursion centers

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES2/degree-zero-center-agreement`. Suggested name: `degree_zero_center_agreement`.

In the rational coefficient range, the map from degree-zero functions on the parameter stack to Z_enh(D_lis) induced by the spectral action equals the IX.5.2 spectral-center map. Pulling representation bundles along universal evaluation recovers exactly the normalized Satake/Hecke operations, including the chosen square root of q.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

**Construction or proof.**

1. On every finite-wild piece compare the action of each universal invariant matrix coefficient with its creation–Weil–annihilation operator.
2. Use the LP invariant presentation to conclude equality of algebra maps.
3. Glue along component and cutoff comparisons and extend to Ind via the enhanced-center restriction equivalence.

**Acceptance.**

- Check the scalar and component idempotent maps.
- Use the ES1:spectral-center prerequisite explicitly.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational`](#excursionoperatorsandspectralaction-es2-spectral-action-rational)
- [`ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family`](#excursionoperatorsandspectralaction-es2-universal-parameter-hecke-family)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- [`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`](#excursionoperatorsandspectralaction-es0-bernstein-center-of-a-category)

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.1.3 p. 344; IX.5.2 p. 329. A roadmap-added comparison deduced from FS’s uniqueness and the two constructions’ shared excursion generators; not a separately numbered assertion in FS.

<a id="excursionoperatorsandspectralaction-es2-whittaker-sheaf"></a>

#### Whittaker sheaf

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES2/whittaker-sheaf`. Suggested name: `whittakerSheaf`. Planet: **Whittaker sheaf**.

For G quasisplit with a specified Whittaker datum (B,U,psi) imported from SR, define W_psi=j_! [c-Ind_(U(E))^(G(E)) psi] in D_lis(Bun_G,Lambda), supported on the open trivial stratum Bun_G^1. Compact induction means support compact modulo the closed unipotent subgroup, not induction from a compact open subgroup. The construction alone does not assert compactness of W_psi or categorical LLC.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use coefficients containing the values of the smooth generic character psi. The rational source uses Qbar_ell; the integral conjectural context uses O_L[1/|pi_0 Z(G)|].

**Construction or proof.**

1. Use SR.2’s compact induction for the closed subgroup U(E).
2. Apply the VS4 stratum equivalence and its j_! embedding.
3. Record its restriction and supported extension; extend the spectral action to W_psi via Ind in its eligible range.

**Uses determining the interface.**

- **X.1.4 and X.3.5 statement register:** Specifies the object on which the conjectural spectral-to-geometric equivalence is based.
- **X.1 pp. 345–346:** The source defines Aut_phi as E_phi acting on this sheaf.

**API.**

- `whittakerSheaf_restrict` (projection): Restriction to Bun_G^1 is c-Ind_U(E)^G(E) psi via the smooth-stratum equivalence.
- `whittakerSheaf_support` (characterisation): Its restriction to the complement of the trivial stratum is zero.
- `whittakerSheaf_datum_iso` (functoriality): An isomorphism of the imported Whittaker data inducing the SR compact-induction intertwiner yields the corresponding sheaf isomorphism.
- `whittakerSheaf_ind_action` (compatibility): The colimit-preserving extension of an eligible compact spectral action acts on W_psi; no compactness assertion is needed.

**Unit tests.**

- `whittakerSheaf_torus` (computation): For a torus U=1 and psi=1, W_psi is extension by zero of the regular compactly supported smooth function representation c-Ind_1^T(E) Lambda, not the one-dimensional trivial representation.
- `whittakerSheaf_trivial_group` (degenerate): For G=1, W_psi is the constant rank-one Lambda object on its unique stratum.
- `whittakerSheaf_stratum` (compatibility): Applying j^* to W_psi returns exactly the SR compact induction, including its right-translation convention.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- `SmoothRepresentationsOfLocalGroups:SR.2`
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`
- `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`
- `VStackSheavesAndLisseCategories:VS4`
- `EnhancedDerivedSheaves:E5:presentability`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.1 pp. 343–344; X.3.5 p. 350. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es3"></a>

### ES3. Integral approximation and spectral actions

First construct the sifted-colimit approximation and its universal action without a good-prime restriction. Free-group and discrete-group comparisons reduce the integral problem to the representation-theoretic comparison supplied by LP. Passing from approximation to actual Perf requires the stated DVR and dual-fundamental-group conditions. Derived scalar extension needs its specified comparison maps.

<a id="excursionoperatorsandspectralaction-es3-sifted-colimit-approximation"></a>

#### Sifted-colimit approximation

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation`. Suggested name: `perfApprox`. Planet: **Sifted-colimit approximation**.

Over a discrete valuation ring R and a split reductive H/R with finite Q action, let F^natural be the sifted-colimit-preserving extension to anima/BQ of the restriction S |-> Perf(Map_(BQ)(S,B(H semidirect Q))) on finite sets with Q-torsors. There is a canonical comparison kappa_S:F^natural(S)->F(S). This is a categorical approximation, not an asserted new mapping scheme, and need not equal F(S) integrally.

**Hypotheses.**

- The animation/Lan construction takes values in R-linear symmetric monoidal small stable idempotent-complete infinity-categories.

**Construction or proof.**

1. Use the free sifted-colimit presentation of anima/BQ by finite Q-torsor sets.
2. Extend the finite-set functor by its sifted left Kan extension.
3. The universal property induces kappa to the actual mapping-stack Perf functor.

**Uses determining the interface.**

- **X.3.1:** The correct universal category for integral coherent Hecke data.
- **X.3.3–X.3.4:** Computed by equivariant coordinate-algebra modules before the good-prime comparison.

**API.**

- `perfApprox_finite` (equivalence): For S a finite Q-torsor set, kappa_S is the prescribed identification with F(S).
- `perfApprox_compare` (projection): kappa is a natural symmetric monoidal comparison to actual mapping-stack Perf.
- `perfApprox_lift` (universal-property): For a sifted-colimit-preserving target functor, transformations out of F^natural are uniquely determined as anima by their restriction to finite Q-torsor sets.
- `perfApprox_evaluation` (compatibility): Universal representation evaluation extends by animation and recovers its finite-set version.

**Unit tests.**

- `perfApprox_empty` (degenerate): At the empty anima, F^natural is Perf(R), the monoidal unit category.
- `perfApprox_point` (compatibility): For Q=1 and S a point, kappa identifies F^natural(S) with Perf(BH).
- `perfApprox_rational` (characterisation): After the valid characteristic-zero scalar extension, the approximation agrees with actual mapping-stack Perf by X.1.2.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- `EnhancedDerivedSheaves:E5:abstract`
- `EnhancedDerivedSheaves:E5:presentability`
- `LanglandsParameterStacks:LP1`
- `EnhancedDerivedSheaves:E5:animation`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.3 pp. 348–349. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es3-integral-universal-action"></a>

#### Integral universal action on the approximation

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`. Suggested name: `integral_universal_action`. Planet: **Integral universal action**.

For the DVR H,Q,S hypotheses of F^natural and C small stable idempotent-complete R-linear, the anima of R-linear F^natural(S)-actions on C is equivalent to the anima of coherent finite-set exact Rep_R(Q^I)-linear monoidal families Rep_R((H semidirect Q)^I)->End_R(C)^(S^I). Evaluation is defined on finite sets and then animated. No good-prime hypothesis is needed for this approximation theorem.

**Hypotheses.**

- Do not replace F^natural by actual Perf(mapping stack) before applying the generation theorem.

**Construction or proof.**

1. Repeat the rational universal argument on finite Q-torsor sets using the exact representation-category perfect extension.
2. Animate both sides; mapping into C turns sifted colimits into limits.
3. Identify the two coherent-data maps and their higher inverse comparisons.

**Acceptance.**

- Compare the point and empty-leg cases.
- At an excluded good-prime the approximation still has this universal property.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation`](#excursionoperatorsandspectralaction-es3-sifted-colimit-approximation)
- `EnhancedDerivedSheaves:E5:abstract`
- `EnhancedDerivedSheaves:E5:presentability`
- `LanglandsParameterStacks:LP3`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.3.1 pp. 348–349. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es3-approximation-commutes-with-colimits"></a>

#### Colimits of the integral approximation

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`. Suggested name: `approximation_commutes_with_colimits`. Planet: **Integral colimit theorem**.

F^natural preserves all colimits from anima/BQ to R-linear symmetric monoidal small stable idempotent-complete infinity-categories. In addition to its defining sifted-colimit property, the required finite coproduct comparison is Perf(BH^S1) tensor_Perf(R) Perf(BH^S2) ≃ Perf(BH^(S1 disjoint union S2)).

**Hypotheses.**

- R is a DVR and H/R split reductive.
- The highest-weight filtration over the DVR is requested from LP3, not inferred from the rational semisimplicity proof.

**Construction or proof.**

1. Use the sifted Kan-extension description.
2. For finite sets prove the disjoint-union tensor identity by the highest-weight filtration of Perf(BH) into copies of Perf(R).
3. Use the animation universal property to deduce all colimits in the symmetric monoidal target.

**Acceptance.**

- The argument uses DVR highest-weight theory without inverting ell.
- At H=1 the functor is constantly Perf(R), the initial symmetric monoidal R-linear category.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation`](#excursionoperatorsandspectralaction-es3-sifted-colimit-approximation)
- `LanglandsParameterStacks:LP3`
- `EnhancedDerivedSheaves:E5:presentability`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.3.2 p. 349. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es3-free-group-case"></a>

#### Free-group comparison

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES3/free-group-case`. Suggested name: `free_group_case`. Planet: **Free-group comparison**.

For S=BF_n->BQ with generator images sigma_1,...,sigma_n, kappa_S is fully faithful with image the thick idempotent-complete stable subcategory generated by Rep_R(H). The actual mapping quotient is [H^n/H] with h acting by (g_i |-> h g_i sigma_i(h)^(-1)); F^natural(BF_n) identifies with compact modules over O(H^n) in IndPerf(BH) with that twisted action. No assertion that this image is all actual Perf is made without the generation input named in its prerequisites.

**Hypotheses.**

- Use the DVR and split reductive hypotheses; n can be zero.

**Construction or proof.**

1. Present BF_n by circles and the all-colimits theorem.
2. For one circle compute the relative tensor of Perf(BH) over Perf(BH^2) along the diagonal and twisted diagonal.
3. Use the supplied module-category/Barr–Beck comparison and extend to n generators.
4. Read off full faithfulness and the representation-generated essential image.

**Acceptance.**

- At n=0 obtain Perf(BH).
- At n=1 with nontrivial sigma check twisted rather than ordinary conjugation.
- Fully faithful comparison here is not full faithfulness of the Bun_G action functor.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`](#excursionoperatorsandspectralaction-es3-approximation-commutes-with-colimits)
- `EnhancedDerivedSheaves:E5:presentability`
- `LanglandsParameterStacks:LP3`
- `LanglandsParameterStacks:LP1`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.3.3 pp. 349–350. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es3-discrete-group-presentation"></a>

#### Discrete-group module presentation

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation`. Suggested name: `discrete_group_presentation`. Planet: **Discrete-group presentation**.

For a discrete group Gamma->Q, present BGamma as the sifted colimit of BF_n over homomorphisms F_n->Gamma in anima/BQ. Then F^natural(BGamma) is the category of compact modules over colim_(n,F_n->Gamma) O(H^n) in IndPerf(BH), with the generator twists induced by Gamma->Q.

**Hypotheses.**

- The colimit algebra is computed in the animated equivariant algebra category; a degree-zero invariant-ring colimit does not substitute for it.

**Construction or proof.**

1. Use the free-group sifted resolution of the group anima.
2. Apply the approximation colimit theorem.
3. Use the free-group module comparison and the compatibility of compact module categories with the filtered/sifted algebra presentation as supplied by E5.

**Acceptance.**

- For Gamma=F_n recover the free-group case.
- For a nontrivial relation use the animated colimit, retaining derived information.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES3/free-group-case`](#excursionoperatorsandspectralaction-es3-free-group-case)
- [`ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`](#excursionoperatorsandspectralaction-es3-approximation-commutes-with-colimits)
- `EnhancedDerivedSheaves:E5:presentability`
- `EnhancedDerivedSheaves:E5:animation`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.3.4 p. 350. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es3-discrete-integral-spectral-action"></a>

#### Integral discrete-group action comparison

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES3/discrete-integral-spectral-action`. Suggested name: `discrete_integral_spectral_action`.

Let Lambda be the integers of a finite extension of Q_ell(sqrt(q)), and ell not divide |pi_1(H)_tors|. For the discrete tame W with its pinned map to Q, kappa_BW identifies F^natural(BW) with Perf([Z^1(W,H)_Lambda/H]). Consequently its action anima is equivalent to the coherent finite-set Hecke-data anima of X.0.2.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- This comparison is the point where the good-prime integral generation input is used.

**Construction or proof.**

1. Identify the animated coordinate colimit in the discrete-group presentation with LP4’s cocycle module algebra.
2. Use VIII.5.1 generation/module comparison to identify all Perf, not just the representation-generated image.
3. Compose with the approximation universal action theorem.

**Acceptance.**

- Record ell not dividing the dual fundamental-group torsion in the theorem signature.
- No proof step rationalizes to establish integral generation.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation`](#excursionoperatorsandspectralaction-es3-discrete-group-presentation)
- [`ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`](#excursionoperatorsandspectralaction-es3-integral-universal-action)
- `LanglandsParameterStacks:LP4/generation-and-module-comparison`
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`
- `LanglandsParameterStacks:LP0/discretization-and-unique-extension`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.0.2 p. 340; X.3 closing p. 350; VIII.5.1 p. 293. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es3-integral-spectral-action"></a>

#### Integral spectral action on Bun_G

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES3/integral-spectral-action`. Suggested name: `integral_spectral_action`. Planet: **Integral spectral action**.

Under the X.0.1 coefficient hypotheses (Lambda the integers of a finite extension of Q_ell(sqrt(q)), ell != p and ell not dividing |pi_1(H)_tors|), the anima of compactly supported Perf([Z^1(W_E,H)_Lambda/H])-actions on a small idempotent-complete stable Lambda-linear C is equivalent to its coherent continuous Weil-equivariant finite-set Hecke-data anima. Applied to HS4 on C=D_lis(Bun_G,Lambda)^omega, it constructs the integral spectral action. The rational variant holds for all ell != p.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- For the general C version, use its relatively discrete condensed enrichment as in the reduction via IX.5.1; E5 must supply the finite-wild factorization of its Hecke orbit data.

**Construction or proof.**

1. Factor each compact Hecke orbit through a uniform finite-wild quotient by the IX.5.1 argument.
2. Choose W and use the discrete integral action comparison.
3. Use intrinsic cocycle restriction/extension and glue over finite-wild pieces with coherent uniqueness.
4. Specialize to the actual HS family and its normalized kernels.

**Acceptance.**

- Give both the abstract equivalence and its Bun_G specialization.
- Test rationalization against X.1.3 using the same Hecke family.
- At an excluded prime retain the approximation and excursions, without asserting this comparison.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES3/discrete-integral-spectral-action`](#excursionoperatorsandspectralaction-es3-discrete-integral-spectral-action)
- [`ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions`](#excursionoperatorsandspectralaction-es2-compactly-supported-actions)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`](#excursionoperatorsandspectralaction-es1-finite-ramification-uniform-wild-subgroup)
- `LanglandsParameterStacks:LP0/discretization-and-unique-extension`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `EnhancedDerivedSheaves:E5:abstract`
- `LanglandsParameterStacks:LP4/generation-and-module-comparison`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.0.1 pp. 339–340; X.3 closing p. 350. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es3-action-change-of-data"></a>

#### Compatibility of integral action comparisons

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES3/action-change-of-data`. Suggested name: `action_change_of_data`.

For the integral action, extension of DVR coefficient rings satisfying X.0.1, refinement of the finite pinned quotient, and shrinking finite-wild cutoffs induce the corresponding comparison functors. Whenever the LP stack/Perf base-change and HS kernel comparison functors are supplied, the two actions are coherently equivalent because their universal representation families coincide. These comparisons satisfy identity, composition and pairwise commutation. The induced degree-zero function action agrees with IX.5.2 in its eligible center range.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Both integral endpoints retain ell not dividing |pi_1(H)_tors|.
- This is a comparison of actions through the supplied base-change functors, not an unrestricted assertion Perf commutes with every scalar tensor product.

**Construction or proof.**

1. Compare the normalized HS kernels and universal evaluation on generators.
2. Apply the equivalence of coherent-data anima to lift that comparison uniquely to the action.
3. Use its functorial inverse to prove coherence of identity and composite comparisons.
4. For degree zero repeat the generator proof of the rational center agreement in the eligible invariant range.

**Acceptance.**

- Check the identity extension, a tower of extensions and changing Q before/after shrinking P.
- Retain the separate center-order hypothesis when comparing centers.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES3/integral-spectral-action`](#excursionoperatorsandspectralaction-es3-integral-spectral-action)
- [`ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`](#excursionoperatorsandspectralaction-es3-integral-universal-action)
- [`ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family`](#excursionoperatorsandspectralaction-es2-universal-parameter-hecke-family)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `LanglandsParameterStacks:LP4/generation-and-module-comparison`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.0.1 pp. 339–340; X.3.1 pp. 348–349. The roadmap asks for these coherence diagrams. FS provides their universal action characterization; the precise LP and HS base-change interfaces are requested.

<a id="excursionoperatorsandspectralaction-es3-derived-reduction-and-rationalization"></a>

#### Derived coefficient reduction and rationalization

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES3/derived-reduction-and-rationalization`. Suggested name: `derived_reduction_and_rationalization`.

Let the integral action be given. For a coefficient map Lambda->B and the supplied relative tensor-product category C_B and pullback functor Perf(Z_Lambda/H)->Perf(Z_B/H), when the stacky Perf scalar-extension comparison is an equivalence, tensoring the action constructs a B-linear action on C_B that induces the scalar-extended HS family. This includes rationalization and, with the supplied derived reduction/Perf comparisons, B=Lambda/ell. It does not assert X.0.1 anew for arbitrary B or identify C_B with the geometric D_lis(Bun_G,B) without its supplier comparison.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use derived tensor products. Identify the scalar-extended geometric category only in the cases established by VS and HS.

**Construction or proof.**

1. Tensor the exact monoidal action as a module-category action.
2. Use the assumed supplier comparison of parameter-stack Perf and universal representations.
3. For rationalization apply uniqueness in X.1.3; for derived reduction identify the restricted Hecke family via the explicit HS comparison.

**Acceptance.**

- Do not substitute ordinary reduction for derived reduction.
- Record precisely the required scalar-extension equivalences before identifying either geometric category.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES3/action-change-of-data`](#excursionoperatorsandspectralaction-es3-action-change-of-data)
- [`ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational`](#excursionoperatorsandspectralaction-es2-spectral-action-rational)
- `EnhancedDerivedSheaves:E5:presentability`
- `LanglandsParameterStacks:LP1`
- `VStackSheavesAndLisseCategories:VS3`
- `HeckeStacksAndLocalShtukas:HS1`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.0.1 pp. 339–340; IX.2 pp. 321–322. A conditional roadmap coefficient-comparison target; the supplied higher-category base-change equivalences are open requests rather than unproved theorem fields.

<a id="excursionoperatorsandspectralaction-es4"></a>

### ES4. Central support, duality and elliptic components

Define support on finite-wild parameter pieces by the annihilator of the evaluated central action, using Mathlib’s prime-spectrum calculus. Exact operations, scalar extension, localization, duality and local-shtuka cohomology are separate targets. Elliptic component categories use deformation and centralizer finiteness. The final basic decomposition returns to ES7’s constant-term and parabolic-induction theorems; it is not an input to those theorems.

<a id="excursionoperatorsandspectralaction-es4-finite-wild-central-support"></a>

#### Finite-wild central support

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support`. Suggested name: `centralSupport`. Planet: **Central support**.

For a compact A with eligible cutoff P in the invariant-coordinate range, let R_P=Gamma([Z^1(W_E/P,H)_Lambda/H],O) act through the center. Define Ann_P(A)={f in R_P : f_A=0 in pi_0 End(A)} and Supp_P(A)=V(Ann_P(A)) in Spec R_P. This is reduced support on the affine invariant quotient, not support in the full derived stack and not nilpotent singular support. A smaller cutoff compares these supports by the open-and-closed parameter embedding and the compatible center action.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- The center-order condition is imposed whenever R_P is used. Without it an analogous support can be formed for the excursion algebra, with comparison of underlying points through the universal homeomorphism.

**Construction or proof.**

1. Evaluate the central ring action on A and take its kernel ideal.
2. Take its zero locus using pinned PrimeSpectrum.
3. Use the LP finite-wild coordinate comparison to transport the underlying closed set between eligible pieces.

**Uses determining the interface.**

- **ES4 support laws:** Defines support for the exact-operation and localization claims.
- **ES1 component decomposition:** Tests support against the already proved component idempotents.

**API.**

- `centralAnnihilator_mem` (characterisation): f belongs to Ann_P(A) iff the central endomorphism f_A is zero.
- `centralSupport_mem` (characterisation): x belongs to Supp_P(A) iff Ann_P(A) is contained in the prime ideal x.
- `centralSupport_iso` (functoriality): Isomorphic objects have the same annihilator ideal and support.
- `centralSupport_idempotent` (compatibility): For an idempotent e, support of the e-summand lies in the clopen locus where e=1, and support of the (1-e)-summand lies where e=0.

**Unit tests.**

- `centralSupport_zero` (degenerate): The zero object has annihilator R_P and empty support.
- `centralSupport_free` (computation): For C=Perf(R_P) with its scalar action, the rank-one module R_P has annihilator zero and support all Spec R_P.
- `centralSupport_nilpotent` (computation): For R=k[epsilon]/(epsilon^2), take C=Perf(k) with its R-linear action through R->k and A=k, which is compact in C. Then Ann_R(A)=(epsilon) but Supp_R(A)=Spec R as an underlying set; the support does not retain the nilpotent thickening. Do not take k to be a perfect R-module.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/center-on-finite-wild-pieces`](#excursionoperatorsandspectralaction-es1-finite-ramification-center-on-finite-wild-pieces)
- `mathlib:Ideal`
- `mathlib:PrimeSpectrum`
- `mathlib:PrimeSpectrum.zeroLocus`
- `mathlib:PrimeSpectrum.mem_zeroLocus`
- `mathlib:RingHom.ker`
- `mathlib:RingHom.mem_ker`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 pp. 328–329; Mathlib RingTheory/Spectrum/Prime/Basic.lean at 082e2d3. This is a roadmap-added central annihilator support built from the FS center action and the pinned zero-locus definition. It is not attributed to FS VIII.2’s singular-support formalism.
- [mathlib-prime-spectrum (ES0)](#source-es0-mathlib-prime-spectrum), zeroLocus, mem_zeroLocus, zeroLocus_mul, zeroLocus_inf, zeroLocus_radical. Supplies the existing closed-set and radical ideal operations used by this central support, not enhanced sheaf geometry.

<a id="excursionoperatorsandspectralaction-es4-support-exact-operations"></a>

#### Support under exact operations

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES4/support-exact-operations`. Suggested name: `support_exact_operations`.

For the fixed central R_P action, support is invariant under isomorphism and shifts, support of a finite direct sum is the union, and a retract has support contained in that of its source. For an exact triangle A->B->C->A[1], Supp(B)⊂Supp(A) union Supp(C), and the cyclic variants hold. Algebraically Ann(A) Ann(C)⊂Ann(B), rather than an assertion that Ann(A) intersect Ann(C) annihilates B.

**Hypotheses.**

- The stable action is exact and the central transformations commute coherently with suspension and triangles.

**Construction or proof.**

1. Use naturality and retract maps for the annihilator comparison.
2. For f annihilating A and g annihilating C, use exactness of Hom and the commuting natural transformations to factor f_B through C; then g_B f_B=0.
3. Pass from the product-ideal containment to zero loci and use the pinned radical/product formulas.
4. Use the biproduct projections/inclusions to identify the direct-sum annihilator intersection.

**Acceptance.**

- For 0->k->k[epsilon]/epsilon^2->k->0 over k[epsilon]/epsilon^2, epsilon kills the endpoints but need not kill the middle; epsilon^2 does.
- Check zero and finite direct sums.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support`](#excursionoperatorsandspectralaction-es4-finite-wild-central-support)
- `EnhancedDerivedSheaves:E5:abstract`
- `mathlib:PrimeSpectrum.zeroLocus_mul`
- `mathlib:PrimeSpectrum.zeroLocus_inf`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 p. 329; Mathlib Prime/Basic zeroLocus_mul and zeroLocus_inf. Elementary consequences of the defined central action, not a separate source theorem. The triangle product-ideal argument is supplied explicitly.
- [mathlib-prime-spectrum (ES0)](#source-es0-mathlib-prime-spectrum), zeroLocus, mem_zeroLocus, zeroLocus_mul, zeroLocus_inf, zeroLocus_radical. Supplies the existing closed-set and radical ideal operations used by this central support, not enhanced sheaf geometry.

<a id="excursionoperatorsandspectralaction-es4-support-coefficient-change"></a>

#### Support under coefficient change

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES4/support-coefficient-change`. Suggested name: `support_coefficient_change`.

Given compatible central actions for a ring map R->S and an exact scalar-extension functor A |-> A_S, the ideal Ann_R(A)S annihilates A_S, hence Supp_S(A_S) is contained in the inverse image of Supp_R(A). If S is flat over R and the natural degree-zero endomorphism base-change map End(A) tensor_R S -> End(A_S) is an isomorphism carrying id_A to id_(A_S), then Ann_S(A_S)=Ann_R(A)S and the support containment is equality. In the derived nonflat case only the compatible-action containment is asserted.

**Hypotheses.**

- The End comparison is an explicit supplier hypothesis, not inferred for every lisse object.

**Construction or proof.**

1. Apply the comparison functor to an annihilating central transformation.
2. For the equality case tensor the kernel sequence R->End(A) with the flat S module.
3. Identify the resulting evaluation map S->End(A_S) and use the inverse-image formula for Spec.

**Acceptance.**

- Keep the flatness and actual endomorphism comparison hypotheses in the equality statement.
- For reduction modulo ell do not assert equality merely from exactness of the categorical action.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support`](#excursionoperatorsandspectralaction-es4-finite-wild-central-support)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data`](#excursionoperatorsandspectralaction-es1-spectral-center-center-change-of-data)
- [`ExcursionOperatorsAndSpectralAction:ES3/derived-reduction-and-rationalization`](#excursionoperatorsandspectralaction-es3-derived-reduction-and-rationalization)
- `EnhancedDerivedSheaves:E5:presentability`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5.2 p. 329; X.0.1 pp. 339–340. Roadmap-added elementary support comparison. The stronger equality is deliberately qualified by the exact algebraic kernel hypotheses.
- [mathlib-prime-spectrum (ES0)](#source-es0-mathlib-prime-spectrum), zeroLocus, mem_zeroLocus, zeroLocus_mul, zeroLocus_inf, zeroLocus_radical. Supplies the existing closed-set and radical ideal operations used by this central support, not enhanced sheaf geometry.

<a id="excursionoperatorsandspectralaction-es4-central-localization"></a>

#### Central localization and component summands

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES4/central-localization`. Suggested name: `central_localization`. Planet: **Central localization**.

For a small idempotent-complete stable R-linear action category C and f in R, localize Ind(C) at the telescope of multiplication by f and take compact objects, with the necessary idempotent completion. A compact A maps to zero iff f^n id_A=0 for some n, equivalently Supp_R(A)⊂V(f). The localized center action sends f to an invertible transformation. For idempotent e the localization is the e-summand already supplied by component decomposition. This does not identify arbitrary closed substacks with a category of sheaves on them.

**Hypotheses.**

- E5 supplies the exact central localization/relative tensor product and telescope mapping formula.

**Construction or proof.**

1. Extend the action to Ind(C), then form the f-inverting localization.
2. Compactness identifies Hom(A,A[f^-1]) with the f-directed colimit, so the image of id vanishes iff some f^n id does.
3. Use the pinned radical zero-locus criterion to identify support in V(f).
4. For e^2=e compare with the split idempotent projector.

**Acceptance.**

- For C=Perf(R), localization agrees with Perf(R[f^-1]).
- For f=1 the kernel is zero; for f=0 every object maps to zero.
- For an idempotent recover the two component factors.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support`](#excursionoperatorsandspectralaction-es4-finite-wild-central-support)
- [`ExcursionOperatorsAndSpectralAction:ES4/support-exact-operations`](#excursionoperatorsandspectralaction-es4-support-exact-operations)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`](#excursionoperatorsandspectralaction-es1-finite-ramification-component-decomposition)
- `EnhancedDerivedSheaves:E5:presentability`
- `mathlib:PrimeSpectrum.zeroLocus_radical`
- `mathlib:PrimeSpectrum.zeroLocus_subset_zeroLocus_iff`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5 pp. 328–329; X.0 p. 339; Mathlib Prime/Basic zero-locus radical criterion. The source supplies the idempotent case; general single-function localization is the explicit E5-backed roadmap obligation.

<a id="excursionoperatorsandspectralaction-es4-duality-and-the-chevalley-involution"></a>

#### Duality of the center action

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution`. Suggested name: `duality_and_the_chevalley_involution`. Planet: **Duality and Chevalley involution**.

In the eligible center range, Bernstein–Zelevinsky duality induces D_geom on the enhanced geometric center. The pinned Chevalley involution induces D_spec on the spectral center. The square D_geom composed with Z_spec->Z_geom equals Z_spec->Z_geom composed with D_spec commutes. The inner correction by rho-hat(-1) in VI.12.1 disappears on the conjugation quotient. This proves the center diagram; general smooth-dual parameter compatibility imports the ES7 parabolic return.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the lisse compact BZ-duality equivalence, not only the etched-sheaf Verdier statements currently written in the supplier packet.

**Construction or proof.**

1. Pull creation, annihilation and the Weil action through BZ duality.
2. Use the geometric Satake switching comparison VI.12.1, retaining the inner correction before taking the quotient.
3. Evaluate invariant coefficients and conclude equality on the spectral generators.

**Acceptance.**

- For GL_n the parameter involution is contragredient.
- Retain the inner correction before quotienting.
- Do not use the unproved general center/homotopy-center isomorphism.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`](#excursionoperatorsandspectralaction-es0-excursion-datum-and-operator)
- `VStackSheavesAndLisseCategories:VS5`
- `GeometricSatakeAndFusion:GS4:integral-dual-group`
- `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.5.3 pp. 329–330; VI.12.1 pp. 239–241. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es4-local-shtuka-excursion-compatibility"></a>

#### Excursions on local shtuka cohomology

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES4/local-shtuka-excursion-compatibility`. Suggested name: `local_shtuka_excursion_compatibility`. Planet: **Local shtuka excursions**.

For HS3’s local-shtuka complex identified as i_b^* T_V(j_! c-Ind_K^G(E) Lambda), with the stated normalization and K pro-p for compactness, transport the ES0 excursion operators through that comparison. At each level they commute with the smooth G_b(E) action, and under the tower’s Hecke transition correspondences they commute with the G(E) action on the tower colimit. Their products commute with each other by the excursion algebra, and their Weil action retains the HS3 continuity. No assertion of one finite-wild cutoff for the noncompact tower colimit is made.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- HS3 supplies the general multi-leg local-shtuka/Hecke comparison IX.3.2, not only the minuscule E=Q_p compactness theorem IX.3.1.

**Construction or proof.**

1. Apply the natural central transformations to the HS compact induced Hecke object.
2. Restrict through the stratum comparison; naturality implies equivariance for the smooth G_b(E) action.
3. Use compatibility of the level/tower correspondences with the HS kernels to obtain the G(E) commutation.
4. Use the algebra map and the condensed enrichment for commuting products and continuity.

**Acceptance.**

- Test the trivial Hecke representation and level transition for a pro-p K.
- State both smooth group actions in their correct level/tower domains.
- No unrestricted compactness or wild cutoff on the whole tower is inferred.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`](#excursionoperatorsandspectralaction-es0-excursion-datum-and-operator)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`](#excursionoperatorsandspectralaction-es1-finite-ramification-uniform-wild-subgroup)
- `HeckeStacksAndLocalShtukas:HS3`
- `HeckeStacksAndLocalShtukas:HS3/compactness-of-shtuka-cohomology`
- `HeckeStacksAndLocalShtukas:HS3/admissibility-duality-and-adjunction`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), IX.3.1–IX.3.2 pp. 324–327; I.9 pp. 35–36. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es4-elliptic-parameters-and-components"></a>

#### Elliptic L-parameters

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components`. Suggested name: `ellipticParameter`. Planet: **Elliptic L-parameters**.

For an algebraically closed characteristic-zero coefficient field L, a continuous parameter phi with the prescribed pinned Weil projection is elliptic if it is semisimple and S_phi/Z(H)^Gamma is finite, where S_phi is the H-centralizer of the full twisted parameter. The centralizer is a group scheme; quotienting the centralizer by the fixed center removes the central stabilizer from the finiteness test. Unramified central twists still vary the parameter in its connected component. The connected-component assertion is a separate theorem.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use LP2’s semisimplicity/G-complete reducibility notion, not merely that Frobenius is diagonalizable.

**Construction or proof.**

1. Form the twisted parameter centralizer supplied by LP.
2. Take its quotient by the Weil-fixed center and require finiteness in addition to semisimplicity.

**Uses determining the interface.**

- **X.2:** Defines the unramified-twist component and its basic-stratum consequences.
- **X.2.2 statement register:** States precisely the conjectural elliptic packet equivalence.

**API.**

- `ellipticParameter_iff` (characterisation): Ellipticity means semisimplicity and finiteness of the specified centralizer quotient.
- `ellipticParameter_conjugate` (functoriality): Conjugation of phi identifies its centralizer quotient and preserves ellipticity.
- `ellipticParameter_central_twist` (compatibility): An eligible unramified central twist has the same centralizer and preserves ellipticity.

**Unit tests.**

- `ellipticParameter_torus` (computation): For a torus with its pinned Weil action, S_phi=H^Gamma, so every semisimple parameter has trivial centralizer quotient and is elliptic.
- `ellipticParameter_GL2_trivial` (non-example): For split GL_2 and the trivial two-dimensional parameter, S_phi/Z(H)=PGL_2 is positive dimensional, so the parameter is not elliptic.
- `ellipticParameter_GLn_irreducible` (characterisation): For split GL_n over L, an irreducible Weil representation has scalar centralizer and is elliptic; a semisimple reducible representation has a positive-dimensional centralizer modulo scalars.

**Acceptance.**

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

**Direct prerequisites.**

- `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`
- `LanglandsParameterStacks:LP1`
- `GeometricSatakeAndFusion:GS4:integral-dual-group`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.2.1 p. 346. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es4-elliptic-parameter-component"></a>

#### Component of an elliptic parameter

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameter-component`. Suggested name: `elliptic_parameter_component`.

For elliptic phi over Qbar_ell, its unramified central twists form the connected component C_phi of the parameter stack. The associated clopen idempotent in the excursion/invariant coordinate ring defines the summand D_lis^(C_phi), on which that idempotent acts as identity. If Z(H)^Gamma is finite then C_phi=BS_phi as a stack, not an ordinary point with trivial stabilizer.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the LP deformation complex and local Tate duality in its exact Weil-group coefficient range.

**Construction or proof.**

1. Show H^2(W_E,ad phi)=0 by Tate duality and ellipticity.
2. Use H^0=Lie Z(H)^Gamma and the unramified-twist tangent calculation to identify the full component; quotient by the centralizer retains stack inertia.
3. Apply the component idempotent theorem and its excursion-only variant.

**Acceptance.**

- For GL_n irreducible phi, retain the scalar unramified-twist direction.
- When the fixed center is finite retain BS_phi, rather than deleting its stabilizer.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components`](#excursionoperatorsandspectralaction-es4-elliptic-parameters-and-components)
- `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`](#excursionoperatorsandspectralaction-es1-finite-ramification-component-decomposition)
- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.2.1 pp. 346–347. The stated source result supplies this target with the hypotheses listed here.

<a id="excursionoperatorsandspectralaction-es4-basic-decomposition-of-an-elliptic-component"></a>

#### Basic decomposition of an elliptic component

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES4/basic-decomposition-of-an-elliptic-component`. Suggested name: `basic_decomposition_of_an_elliptic_component`. Planet: **Basic elliptic decomposition**.

For elliptic phi and A in D_lis^(C_phi), restriction to any nonbasic b is zero. Hence its compact category decomposes over basic b; its smooth representations lie in supercuspidal Bernstein components. If Z(H)^Gamma is finite, the component category is the direct sum of copies of Perf(Qbar_ell), indexed by basic b and supercuspidal pi of G_b(E) with parameter phi. This proved structural description does not establish the conjectural bijection with irreducible S_phi representations.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Import the proved ES7 parabolic parameter compatibility and SR supercuspidal block structure in characteristic zero.

**Construction or proof.**

1. A nonbasic stratum forces the parameter through a proper Levi by ES7; that contradicts ellipticity.
2. Use compact generation/stratum restriction to decompose the remaining basic summands.
3. Apply parabolic compatibility to exclude nonsupercuspidal components.
4. When the fixed center is finite, use the discrete supercuspidal-block Ext calculation to split into finite sums of shifted irreducibles.

**Acceptance.**

- Do not identify the indexing representations with Irr(S_phi) without Conjecture X.2.2.
- The finite-center case retains possible automorphism groups of parameters.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameter-component`](#excursionoperatorsandspectralaction-es4-elliptic-parameter-component)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`](#excursionoperatorsandspectralaction-es7-parabolic-constant-term-computation)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`](#excursionoperatorsandspectralaction-es7-parabolic-parabolic-induction)
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`
- `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`
- `SmoothRepresentationsOfLocalGroups:SR.3`

**Source locators.**

- [FS-geometrization (ES0)](#source-es0-fs-geometrization), X.2 pp. 346–348. The stated source result supplies this target with the hypotheses listed here.

## Part II. Parameters, functoriality and duality (ES5–ES6)

<a id="excursionoperatorsandspectralaction-es5"></a>

### ES5. Schur objects and semisimple parameters

The scalar unit in condensed endomorphism algebras defines Schur irreducibility. Its inverse turns the coherent excursion family into a character, and LP2 reconstructs a continuous semisimple parameter with its prescribed Weil projection. Smooth irreducible representations enter through admissibility, the enriched stratum dictionary and the condensed Schur theorem. Isomorphism, embedding and coefficient comparisons keep those hypotheses explicit.

<a id="excursionoperatorsandspectralaction-es5-schur-irreducible-object"></a>

#### Schur irreducibility in condensed algebras

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`. Suggested name: `IsSchurIrreducible`. Planet: **Condensed Schur irreducibility**.

Fix a nonarchimedean local field E of residue cardinality q and residue characteristic p, a prime ell different from p, a connected reductive E-group G, and an algebraically closed Z_ell[sqrt(q)]-field L. Give L its relatively discrete condensed Z_ell-algebra structure. For A in D_lis(Bun_G,L), write End(A) for the degree-zero algebra in its condensed mapping object. A is Schur-irreducible precisely when the scalar unit L to End(A) is an isomorphism of condensed L-algebras. An abstract scalar endomorphism ring alone is insufficient to establish this definition.

**Hypotheses.**

- End means degree zero, not the whole derived mapping complex.
- The condensed enhancement and its scalar unit are those of HS1/IX.1. Compact-source Hom is relatively discrete by IX.1.2; arbitrary A is handled by the induced enhancement.

**Construction or proof.**

1. Import the enhanced category and unit; take invertibility of that specific unit, using the existing category of condensed algebras.
2. Invert the unit to recover unique scalar sections over every profinite test object, compatibly with restriction.
3. Use the unit-preserving endomorphism isomorphism under a sheaf isomorphism or shift; no t-structure or compactness hypothesis enters this invariance.

**Uses determining the interface.**

- **IX.4.1:** Turn an excursion endomorphism into a scalar while retaining its condensed dependence on Weil elements.
- **ES5 representation assignment:** Prove the definition for the transported representation, rather than replace it by abstract Schur’s lemma.

**API.**

- `IsSchurIrreducible.scalarIso` (constructor): Invert the scalar unit to obtain its canonical condensed algebra isomorphism.
- `IsSchurIrreducible.scalar_unique` (characterisation): For every test object S and endomorphism section e there is exactly one scalar section a whose unit image is e.
- `IsSchurIrreducible.sections_bijective` (structure): The scalar unit is bijective on sections over every S.
- `IsSchurIrreducible.iso_invariant` (functoriality): A scalar-unit-preserving isomorphism of endomorphism algebras preserves and reflects Schur irreducibility.
- `IsSchurIrreducible.shift` (functoriality): The canonical endomorphism isomorphism for a shift, which preserves the unit, carries Schur irreducibility to the shifted object.

**Unit tests.**

- `schur_scalar_identity` (computation): The identity unit on the relatively discrete scalar algebra is Schur.
- `schur_rejects_zero` (degenerate): If a scalar section ring is nonzero and the target section ring has zero equal to one, its scalar unit is not Schur.
- `schur_requires_all_sections` (non-example): Failure of bijectivity on any condensed test object excludes Schur irreducibility, even if a global-section comparison is known.

**Acceptance.**

- The zero object fails: its identity is zero whereas L is nonzero.
- Check all condensed sections, not only global sections.
- A shift of a Schur object remains Schur.

**Direct prerequisites.**

- `mathlib:Condensed`
- `mathlib:AlgCat`
- `mathlib:CategoryTheory.IsIso`
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.4.1, p. 327. The printed Schur condition; the scalar-unit formulation fixes its canonical algebra structure.
- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.1.2, pp. 320–321. Specifies the compact-source enhancement; it does not say every irreducible representation is compact.

<a id="excursionoperatorsandspectralaction-es5-condensed-schur-from-admissibility"></a>

#### The condensed Schur refinement for smooth representations

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`. Suggested name: `condensedSchurOfAdmissible`.

Let pi be an irreducible admissible smooth L-representation of G_b(E). The scalar map L to End_{G_b(E)}(pi) is an isomorphism of abstract L-algebras and, using the relatively discrete representation/sheaf dictionary with its enriched mapping objects, an isomorphism of condensed algebras. Its image under the fully faithful enriched stratum embedding is therefore Schur-irreducible. For all irreducible smooth pi the admissibility input is supplied by the proposed foundational SR.3b; this node owns only the condensed refinement, not Vignéras’ theorem.

**Hypotheses.**

- L is algebraically closed of characteristic different from p.
- Use the actual smooth representation category and its scalar unit.
- Do not assume pi is compact in its derived category.

**Construction or proof.**

1. Choose a nonzero K-fixed vector for an open pro-p K; admissibility makes pi^K finite dimensional and irreducibility makes its G-orbit generate pi.
2. An equivariant endomorphism acts on pi^K and has an eigenvalue over L. Its difference from this scalar has a nonzero invariant kernel, hence vanishes on pi.
3. For a condensed family, evaluate on that vector in the finite-dimensional relatively discrete pi^K and extract a scalar by a linear coordinate. The supplier’s enriched evaluation comparison shows this is a morphism of condensed algebras inverse to the unit.
4. Transport through the enriched fully faithful adjunction, whose unit preserves scalars. The missing enriched fixed-vector comparison and modular admissibility are recorded as supplier gaps.

**Acceptance.**

- This argument works for the countable field Fbar_ell, where an uncountability shortcut is unavailable.
- A characteristic-zero Z_ell-field contains Q_ell and is uncountable; Qbar_ell is not countable.
- Test the trivial one-dimensional representation without asserting that arbitrary irreducibles are compact.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`](#excursionoperatorsandspectralaction-es5-schur-irreducible-object)
- `mathlib:Representation.IntertwiningMap`
- `tauceti:TauCeti.IsSmoothDiscrete`
- `tauceti:TauCeti.SmoothDiscreteTopRep`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `VStackSheavesAndLisseCategories:VS4`
- `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.4.1 and IX.7.1, pp. 327, 334. Motivates application to representations; the fixed-vector proof is a refinement outlined here, with the foundational admissibility theorem requested separately.

<a id="excursionoperatorsandspectralaction-es5-excursion-character-of-a-schur-object"></a>

#### The scalar excursion character

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`. Suggested name: `excursionCharacter`. Planet: **Scalar excursion character**.

For Schur A, evaluate the ES0 excursion action and apply the inverse scalar unit, giving chi_A: Exc(W,Ghat) tensor L to L and the associated family Theta_n: Inv_n to Map(W_E^n,L), n at least one. Here Inv_n is O((Ghat semidirect Q)^n // Ghat), with O(Q^n)-linearity determined by W_E to Q. For g:[m] to [n], the reindexing square commutes. The second square uses ordered fibre multiplication mu_g:H^m to H^n and m_g:W_E^m to W_E^n, and reads Theta_m(mu_g^* f)(gamma)=Theta_n(f)(m_g gamma). Empty fibres contribute the identity. The family is condensed.

**Hypotheses.**

- The pinned Weil action factors through Q.
- Use the universal integral excursion algebra; its flat torsion-free universal property is not applicable to a characteristic-ell field.
- For abstract characters restrict to a suitable discretization; the condensed family itself is expressed on W_E.

**Construction or proof.**

1. Import ES0’s operators and LP2’s presentation, including the coefficient attached to a matrix coefficient.
2. Compose evaluation with the inverse condensed scalar unit, which preserves algebra operations and O(Q^n)-linearity.
3. Apply the two operator relations before scalar extraction; their naturality is unchanged by this composition.
4. Check condensed continuity using the actual inverse unit and the condensed Hecke action, rather than assert continuity from a character of a discrete group.
5. Use the integral relations for characteristic ell. Inversion follows by inserting an inverse pair and multiplying it to the identity; the torsion-free quotient is only used with flat targets.

**Uses determining the interface.**

- **VIII.3.8:** Provides exactly its third datum, with both relations and condensed continuity.
- **IX.6:** Prove operator squares before evaluating chi_A, so constituent statements follow from scalar naturality.

**API.**

- `excursionCharacter.apply` (simp): On an excursion coefficient x, chi_A(x) is the inverse scalar-unit image of its operator.
- `excursionCharacter.scalar_linear` (structure): The map fixes L-scalars; the invariant-ring family is linear over O(Q^n) with its prescribed evaluation.
- `excursionCharacter.family` (data): Postcompose universal invariant-ring evaluation with chi_A to obtain Theta_n.
- `excursionCharacter.pullback` (relation): Theta_n(g^* f)(gamma) equals Theta_m(f)(gamma composed with g).
- `excursionCharacter.multiplication` (relation): Theta_m(mu_g^* f)(gamma) equals Theta_n(f)(ordered fibre products of gamma).
- `excursionCharacter.condensed` (structure): An operator family in a condensed endomorphism algebra has exactly one scalar family whose composition with the scalar unit is that family.
- `excursionCharacter.ext` (extensionality): Agreement on all excursion coefficients generating the algebra implies equality of characters.

**Unit tests.**

- `character_unit` (computation): The unit excursion coefficient has scalar value one.
- `character_inverse_pair` (compatibility): The inverse-pair coefficient identified with the identity coefficient by the universal relations has the same scalar value.
- `character_detects_order` (non-example): If the evaluated operators for two ordered-word coefficients differ, their scalar values differ; a scalar extraction that discards order fails this test.

**Acceptance.**

- Theta sends one to one and evaluates base O(Q^n) functions by the prescribed projection.
- Repeated variables, empty multiplication fibres and an inverse pair satisfy the specified relations.
- Ordering is preserved; not every coefficient distinguishes a reversed word, but those which do retain the distinction.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`](#excursionoperatorsandspectralaction-es5-schur-irreducible-object)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)
- [`ExcursionOperatorsAndSpectralAction:ES0/continuity-of-excursion-evaluations`](#excursionoperatorsandspectralaction-es0-continuity-of-excursion-evaluations)
- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`
- `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`
- `mathlib:AlgHom`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), VIII.3.7, pp. 288–289. The ordered multiplication relation.
- [FS-geometrization (ES5)](#source-es5-fs-geometrization), VIII.3.8 proof, p. 290. The continuity required by the reconstruction theorem, supplied here by the Schur inverse.

<a id="excursionoperatorsandspectralaction-es5-abstract-semisimple-parameter"></a>

#### The abstract scalar-parameter consequence

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`. Suggested name: `abstractSemisimpleParameter`. Planet: **Abstract semisimple parameter**.

Let W be discrete and let an L-linear category C carry the finite-set functorial Rep(Q^I)-linear monoidal Weil-equivariant functors of VIII.4. For X with scalar unit L to End(X) an isomorphism of abstract algebras, there is a unique Ghat(L)-conjugacy class of semisimple sections W to Ghat(L) semidirect W. For every excursion datum its scalar is beta composed with V(phi_X(gamma_i)) composed with alpha. This is the objectwise consequence of the imported excursion action and character classification, not a new construction of those theories.

**Hypotheses.**

- The group W in this statement is discrete.
- Uniqueness is of a conjugacy class, not a preferred representative.
- The arbitrary-discrete-W variants of the abstract LP2 action and character classification are requested explicitly; the existing local-Weil character node alone does not supply this generality.

**Construction or proof.**

1. Evaluate the requested abstract VIII.4.1 excursion algebra action at X, rather than import only the Bun_G finite-wild compact specialization.
2. Apply the requested arbitrary-discrete-W, algebraically closed coefficient version of LP2 character classification to the scalar character; this extension remains a recorded supplier gap.
3. Evaluate its matrix-coefficient character to obtain the displayed identity; uniqueness follows because those coefficients determine the closed orbit.

**Acceptance.**

- No claim of continuity on W_E follows from this discrete statement alone.
- The identity applies to every finite set and matrix coefficient, not merely traces of individual elements.

**Direct prerequisites.**

- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`
- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`
- `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), VIII.4.3, pp. 292–293. The scalar matrix-coefficient characterization in the discrete categorical setting.

<a id="excursionoperatorsandspectralaction-es5-parameter-of-a-schur-irreducible-sheaf"></a>

#### The continuous parameter of a Schur sheaf

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`. Suggested name: `parameterOfSchurSheaf`. Planet: **Continuous semisimple parameter**.

For Schur A in D_lis(Bun_G,L), there is exactly one Ghat(L)-conjugacy class of continuous semisimple L-parameters phi_A:W_E to Ghat(L) semidirect Q lifting the fixed W_E to Q. For every datum (I,V,alpha,beta,gamma), the creation–Weil–annihilation endomorphism equals the scalar beta V(phi_A(gamma_i)) alpha. Continuity means a map of condensed sets into the relatively discrete coefficient object; semisimplicity is the LP2 closed-orbit/G-complete-reducibility convention, not elementwise semisimplicity.

**Hypotheses.**

- L is an arbitrary algebraically closed Z_ell[sqrt(q)]-field.
- No good-prime or centre-component invertibility assumption.
- A is Schur in the condensed sense, without an additional compactness restriction.

**Construction or proof.**

1. Use the scalar excursion family with its exact two relations and prescribed projection.
2. Invoke all three clauses of LP2’s VIII.3.8: semisimple conjugacy classes, coarse-space points, and condensed character families are in bijection.
3. Continuity is the finite-anchor conclusion in VIII.3.8’s proof; LP2 owns its general-coefficient proof. Lafforgue 11.7/11.10 explains the anchor argument in characteristic zero.
4. Read each excursion coefficient via the resulting coarse point, then use the injectivity of classification to obtain uniqueness.

**Acceptance.**

- Reconstruction uses simultaneous tuple invariants; individual traces do not replace the theorem.
- Positive-characteristic continuity must not be justified using characteristic-zero Reynolds exactness.
- The output supplies no nilpotent monodromy operator or full local Langlands packet.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`](#excursionoperatorsandspectralaction-es5-excursion-character-of-a-schur-object)
- [`ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`](#excursionoperatorsandspectralaction-es5-abstract-semisimple-parameter)
- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.4.1, p. 327. Its complete one-line proof, expanded through the existing supplier.
- [FS-geometrization (ES5)](#source-es5-fs-geometrization), VIII.3.8 proof, p. 290. The finite-anchor continuity input; the full proposition was recovered and read.
- [Lafforgue-2018 (ES5)](#source-es5-lafforgue-2018), Proposition 11.7 and Lemma 11.10, pp. 143–147. Characteristic-zero source for the finite-anchor continuity argument, not a blanket proof in characteristic ell.

<a id="excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation"></a>

#### The parameter of an irreducible smooth representation

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`. Suggested name: `parameterOfRepresentation`. Planet: **Parameter of a smooth representation**.

For b in B(G) and irreducible smooth pi of G_b(E), use the VS4 equivalence D(G_b(E),L) with D_lis(Bun_G^b,L) and the fully faithful left adjoint L_b=pi_b-sharp q_b^* to i_b^*. Its unit i_b^* L_b is the identity. The enriched condensed Schur theorem makes L_b(pi) Schur, and define phi_(G,b,pi)=phi_{L_b(pi)} as a conjugacy class. At b=1, L_b is j_! and write phi_pi. The common restricted excursion-centre action makes this independent of eligible embeddings.

**Hypotheses.**

- The sharp symbol denotes relative homology, not ordinary pushforward or a general i_b! functor.
- Admissibility for all irreducible smooth pi needs SR.3b; SR.3/SR.3a are complex-only and SR.6 is downstream of excursions.
- An eligible embedding is an enriched full-faithful stratum extension with the scalar-preserving retraction/comparison described in the next theorem; no claim is made for arbitrary embeddings.

**Construction or proof.**

1. Import VII.7.1–7.2 with their enrichment and invertible adjunction unit from VS4.
2. Apply the condensed Schur refinement on the actual representation category and transport its unit.
3. Apply the Schur-sheaf theorem and characterize the parameter by the restricted excursion character.
4. Use centre independence to compare extensions; the b=1 notation is the j_! special case.

**Uses determining the interface.**

- **IX.7.1–IX.7.3:** Provides phi_(G,b,pi) for comparing strata and parabolic induction.
- **ES6 duality and characters:** Apply the geometric parameter comparisons to the actual smooth representation.

**API.**

- `parameterOfRepresentation.eval` (characterisation): The parameter’s invariant character equals the scalar excursion character of pi.
- `parameterOfRepresentation.defining_identity` (simp): The operator of a coefficient x on pi is scalar multiplication by its excursion character.
- `parameterOfRepresentation.embedding_independent` (compatibility): Equal restricted excursion actions for eligible embeddings yield the same parameter class.
- `parameterOfRepresentation.iso_invariant` (functoriality): A scalar-preserving equivariant representation isomorphism conjugates operators and hence preserves their scalar character and parameter class.
- `parameterOfRepresentation.at_basepoint` (data): At b=1 this is classification of the excursion character evaluated through j_!.

**Unit tests.**

- `representation_basepoint` (compatibility): At the neutral stratum the parameter is reconstruction of the j_!-restricted excursion character.
- `representation_same_centre` (characterisation): Two eligible extensions with the same restricted excursion action give the same parameter class.
- `representation_trivial_group` (degenerate): For the trivial group with Q=1 and its one-dimensional irreducible L, the reconstructed parameter has value one at every Weil element, the unique section to the trivial dual group.

**Acceptance.**

- For a trivial one-dimensional representation the construction still uses its equivariant endomorphism algebra.
- Compare two eligible extensions by equality of their restricted central action.
- All coefficient characteristics different from p are allowed, subject to the recorded supplier inputs.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`](#excursionoperatorsandspectralaction-es5-condensed-schur-from-admissibility)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`](#excursionoperatorsandspectralaction-es5-parameter-of-a-schur-irreducible-sheaf)
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`
- `VStackSheavesAndLisseCategories:VS4`
- `mathlib:Representation.IntertwiningMap`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- [`ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`](#excursionoperatorsandspectralaction-es5-stratum-centre-embedding-independence)

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), VII.7.2, pp. 272–273. The source’s relative-homology left adjoint and unit; not an ordinary shriek pushforward.
- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.7.1, p. 334. The representation parameter is obtained by this stratum extension.

<a id="excursionoperatorsandspectralaction-es5-stratum-centre-embedding-independence"></a>

#### Centre independence of eligible stratum extensions

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`. Suggested name: `stratumCentreEmbeddingIndependence`.

Let R=i_b^* and let L and J be enriched fully faithful left and right stratum extensions with L adjoint to R adjoint to J and unit/counit retractions RL=RJ=id. The canonical comparison tau:L to J restricts to the identity. For any natural endomorphism z of the identity on D_lis(Bun_G,L), naturality along tau gives R(z_L)=R(z_J). The same argument compares extensions carrying such a retraction comparison. Thus all these eligible choices give the same degree-zero centre map, and hence the same excursion character and parameter.

**Hypotheses.**

- The common restriction of tau must be the specified invertible retraction; full faithfulness alone of unrelated functors is insufficient.
- Use the enriched comparison to retain condensed scalar information.
- The existence and lisse preservation of the eligible right extension are VS4 obligations, recorded explicitly.

**Construction or proof.**

1. Construct tau via the left/right adjunctions: L to JR L, identified with J using RL=id.
2. Apply naturality of z to tau and then R.
3. Identify R tau with the identity using the triangle identities; cancel it to identify restricted actions.
4. Apply scalar extraction and LP2 uniqueness to the excursion subalgebra.

**Acceptance.**

- For an open neutral stratum compare j_! and its eligible right extension.
- Do not claim general pullback to a nonbasic stratum intertwines all Hecke functors.

**Direct prerequisites.**

- `mathlib:CategoryTheory.CatCenter`
- `mathlib:CategoryTheory.Adjunction`
- `VStackSheavesAndLisseCategories:VS4`
- [`ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`](#excursionoperatorsandspectralaction-es5-schur-irreducible-object)
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.7.1, p. 334. The assertion is expanded as a formal adjunction/naturality argument; supplier existence is kept separate.

<a id="excursionoperatorsandspectralaction-es5-invariance-and-coefficient-transport"></a>

#### Isomorphism invariance and conditional coefficient transport

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`. Suggested name: `invarianceAndCoefficientTransport`.

Isomorphic Schur sheaves, or isomorphic irreducible smooth representations, have the same semisimple parameter class. If L to Lprime is an extension of eligible algebraically closed coefficient fields, the Hecke/operator base-change comparison holds, and A_Lprime remains Schur-irreducible, then phi_(A_Lprime) is the scalar extension of phi_A. For representations impose the same Schur/irreducibility hypotheses after extension. This proves a comparison conditional on those hypotheses; it does not assert their preservation.

**Hypotheses.**

- Coefficient structures and Q-actions are transported along the specified coefficient map.
- The relatively discrete scalar comparison must commute with the canonical units.

**Construction or proof.**

1. Use naturality to conjugate excursion endomorphisms under an isomorphism and recover equal scalar characters.
2. For coefficient extension use ES1’s operator comparison and HS coefficient-compatible kernels.
3. Use the retained Schur condition and LP0 coefficient functoriality to compare character evaluations, then LP2 uniqueness.

**Acceptance.**

- The identity extension gives the original parameter.
- Two successive eligible extensions give the same comparison as their composite.
- No proof uses commutation of arbitrary base change with all invariant rings.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`](#excursionoperatorsandspectralaction-es5-parameter-of-a-schur-irreducible-sheaf)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- [`ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`](#excursionoperatorsandspectralaction-es5-stratum-centre-embedding-independence)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data`](#excursionoperatorsandspectralaction-es1-spectral-center-center-change-of-data)
- `LanglandsParameterStacks:LP0/functoriality-of-cocycles`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.4.1, p. 327. The characterization forces these transport consequences when operators and scalar units are compatible.

<a id="excursionoperatorsandspectralaction-es6"></a>

### ES6. Coefficient policy for centre comparisons

Establish the coefficient policy used by both children of ES6: invariant-coordinate diagrams are conditional on the centre-order hypothesis, while excursion diagrams remain available without it. This early comparison does not depend on the later smooth-dual theorem.

<a id="excursionoperatorsandspectralaction-es6-coefficient-policy-for-the-functorial-diagrams"></a>

#### The coefficient policy for centre and excursion diagrams

**Comparison.** Node `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`. Suggested name: `coefficientPolicyForFunctorialDiagrams`.

Every centre diagram below uses the existing map Z_spec(G,Lambda) to Z_geom(G,Lambda) under invertibility of |pi_0 Z(G)|, and imposes the analogous condition for every other group in the diagram. Without it, replace the spectral-centre input by the integral excursion algebra and compare excursion operators. Evaluating these diagrams on Schur objects over L gives all field-valued parameter assertions for every ell different from p. There is no appeal to ES3’s categorical spectral-action good-prime condition.

**Hypotheses.**

- Lambda is an eligible Z_ell[sqrt(q)]-algebra.
- An excursion variant is stated at the operator level; it is not an unconditional isomorphism of centres.

**Construction or proof.**

1. Import the IX.5.2 map from its exact ES1 node.
2. At each comparison perform the kernel and operator calculation, before converting it to a centre statement.
3. Use the exact ES1 excursion-only node when the invertibility assumption fails; the scalar-parameter theorem still applies.

**Acceptance.**

- Check a characteristic dividing a centre-component order using operators, without asserting the unavailable centre map.
- No inverse of that component order appears in scalar extraction.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`](#excursionoperatorsandspectralaction-es1-spectral-center-excursion-algebra-without-the-coefficient-condition)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6 introduction, p. 330. The centre hypothesis is distinct from the unrestricted excursion/field conclusion.

<a id="excursionoperatorsandspectralaction-es6-functoriality"></a>

### ES6:functoriality. Group changes, torus reciprocity and twists

Compare adjoint-isomorphism maps, products and restriction of scalars using Hecke and Satake naturality, then compute tori, central characters and abelianized twists. The torus proof requires the regular quotient-group-algebra operator identity, including nilpotent coefficients and endpoint signs. The full Kaletha z-embedding target is p-adic; its equal-characteristic smooth-centre extension and nonsmooth-centre replacement are named open interfaces. This layer remains partial.

<a id="excursionoperatorsandspectralaction-es6-functoriality-isogenies"></a>

#### Compatibility with maps inducing adjoint isomorphisms

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`. Suggested name: `isogenies`. Planet: **Adjoint-isomorphism compatibility**.

For f:Gprime to G inducing an adjoint-group isomorphism, write dual f:Ghat to Gprimehat and pi:Bun_Gprime to Bun_G. For every A the centre action of Z_spec(Gprime) on pi^*A equals pullback of the Z_spec(G) action along the function map induced by dual f. Before scalar evaluation compare Hecke kernels via pi_H-sharp Sprime_Vprime = h_1^* pi-sharp Lambda tensor Sprime_V, where V is the dual pullback of Vprime. This gives pi-sharp T_Vprime(pi^*A)=T_V(A tensor pi-sharp Lambda). Any Schur constituent on which the induced excursion action is inherited has parameter dual f composed with phi_A.

**Hypotheses.**

- For centres use the coefficient policy for both groups; for scalar parameters use its excursion variant.
- Do not require pi^*A itself to be irreducible or Schur.
- A constituent means a subquotient in an eligible heart, or a direct summand with inherited scalar central action; no t-structure is invented on all D_lis.

**Construction or proof.**

1. Import HS4’s Bun/Hecke diagrams and GS4’s exact adjoint-isomorphism Satake naturality.
2. Factor pi_H through Hck_G times Bun_Gprime. Its first relative-homology pushforward sends the Satake kernel to the pulled-back kernel; apply the projection formula to the second map.
3. Compute the displayed functor identity using relative-homology base change. It is over the leg divisor space and natural in Vprime and I.
4. Compare creation, Weil action and annihilation under this identity, giving the algebra square.
5. Restrict the scalar action to the specified constituent and use the parameter characterization.

**Acceptance.**

- The identity map gives the identity parameter comparison.
- Central multiplication Z times G to G has an adjoint isomorphism; Z to G alone generally does not.
- Retain the constituent hypothesis and the sharp functors.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`](#excursionoperatorsandspectralaction-es6-coefficient-policy-for-the-functorial-diagrams)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`](#excursionoperatorsandspectralaction-es5-parameter-of-a-schur-irreducible-sheaf)
- `HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`
- `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality`
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6.1 proof, pp. 330–331. The relative-homology kernel calculation precedes the equality of excursion operators.

<a id="excursionoperatorsandspectralaction-es6-functoriality-products"></a>

#### Product compatibility of centres and parameters

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`. Suggested name: `products`. Planet: **Product parameters**.

For G=G_1 times G_2, Bun_G is the product. The tensor product Z_spec(G_1) tensor Z_spec(G_2) identifies with Z_spec(G), and the corrected square with Z_geom(G_1) tensor Z_geom(G_2) commutes. Over the same divisor-leg base, product Hecke kernels for external product representations are external products of the factor kernels. For Schur A_i and a Schur constituent of A_1 external-tensor A_2 with inherited scalar excursion action, its parameter is (phi_A1,phi_A2), with the common Weil projection.

**Hypotheses.**

- The tensor product of centres need not equal the entire geometric centre.
- Use the coefficient policy for each group.
- Compact exterior generators and their derived Hom comparison are imported from VS5/VII.7.10.

**Construction or proof.**

1. Import the HS4 product diagram and GS4 product naturality over the common leg space.
2. Check external-product kernels and operators on external Satake generators; pass to all representations using their generating operations.
3. Use VII.7.10 for the exterior generators/Hom comparison and LP2 invariant algebra product comparison to identify the spectral source.
4. Apply scalar-character uniqueness on the inherited constituent.

**Acceptance.**

- For G_m times G_m the two factor characters are recovered separately.
- The second top-right centre factor is G_2, not G_1; source finding E2 records the preprint typo.
- The kernel base is the common divisor-leg base, not independently varying leg bases.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`](#excursionoperatorsandspectralaction-es6-coefficient-policy-for-the-functorial-diagrams)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`](#excursionoperatorsandspectralaction-es5-parameter-of-a-schur-irreducible-sheaf)
- `mathlib:TensorProduct`
- `HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/product-naturality`
- `VStackSheavesAndLisseCategories:VS5`
- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6.2 proof, p. 331. Expanded through the owned kernel and exterior-Hom interfaces; the display correction is recorded separately.

<a id="excursionoperatorsandspectralaction-es6-functoriality-weil-restriction"></a>

#### Weil restriction and nonabelian Shapiro comparison

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`. Suggested name: `weilRestriction`. Planet: **Weil restriction of parameters**.

Let Eprime/E be finite separable, fix an embedding Eprime into a separable closure of E and the resulting W_Eprime inside W_E, and let G=Res_(Eprime/E)Gprime. There are compatible identifications of Bun, nonabelian cocycle quotient stacks and excursion algebras, and their centre-action square commutes. Choose a common W_E-normal open wild subgroup P inside W_Eprime so both quotients are defined; let Wprime be the inverse image of W intersected with W_Eprime/P. The parameter of Gprime is projection to the chosen dual factor after restriction of the parameter of G to W_Eprime; equivalently its Shapiro class is the parameter of G.

**Hypotheses.**

- Separable, not arbitrary finite, extension.
- Projection depends on the chosen Weil embedding, and another choice gives the corresponding conjugate comparison.
- The nonabelian comparison is not the pinned abelian Shapiro theorem.

**Construction or proof.**

1. Identify the bundles by extension of coefficient field and restriction of scalars, using the owned torsor geometry.
2. Prove the nonabelian Shapiro comparison on cocycles, not by the abelian baseline theorem. For Wprime inside W and Hprime with Wprime-action, use the coinduced group of f with f(hx)=h(f(x)), with W acting by right translation. Evaluation at 1 restricts a W-cocycle to Wprime. Choose left-coset representatives and write x=h_x r_x. From c on Wprime define a(w)(x)=h_x(c(h_x inverse h_(xw))). The cocycle law telescopes; changing representatives gives the usual coboundary. The two constructions are inverse up to conjugacy and commute with coefficient base change. For finite index this is a finite product of algebraic groups. Apply the natural constructions fppf-locally where torsors are trivial and glue by conjugacy, obtaining the quotient-stack comparison.
3. For each finite free group F_n to W, apply this comparison to F_n times_W Wprime. This subgroup has finite index, is free by the pinned subgroupIsFreeOfIsFree instance and is finitely generated by Subgroup.fg_of_index_ne_zero.
4. Use these finite free sources and their common refinements to obtain the cofinal excursion colimit comparison; no Schreier rank formula is needed.
5. Inflate a representation of the chosen Gprimehat semidirect W_Eprime through the dual-factor projection, then induce to Ghat semidirect W_E.
6. Import the closed Hecke immersion over Divprime to Div from HS4; its pushforward realizes the inflate/induce kernel. Compare the operators and reconstruct parameters.

**Acceptance.**

- The degree-one extension gives identity.
- Different coset representatives give canonically equivalent Shapiro data.
- Specify P normal in the ambient Weil group, not merely open in its subgroup.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`](#excursionoperatorsandspectralaction-es6-coefficient-policy-for-the-functorial-diagrams)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`](#excursionoperatorsandspectralaction-es5-parameter-of-a-schur-irreducible-sheaf)
- `mathlib:IsFreeGroup`
- `mathlib:Subgroup.fg_of_index_ne_zero`
- `mathlib:Subgroup`
- `LanglandsParameterStacks:LP0/functoriality-of-cocycles`
- `HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality`
- `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`
- `mathlib:subgroupIsFreeOfIsFree`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6.3 proof, p. 332. Exactly the baseline input; its rank is irrelevant.
- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6.3 proof, p. 332. The nonabelian finite-free-source excursion-colimit argument.

<a id="excursionoperatorsandspectralaction-es6-functoriality-tori-spectral-center"></a>

#### The spectral centre of a torus

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`. Suggested name: `toriSpectralCenter`.

For an E-torus T, local reciprocity gives a natural isomorphism Z_spec(T,Lambda) with R_T=lim_K Lambda[T(E)/K], over open subgroups K. These quotient groups are discrete and need not be finite: for T=G_m and K=O_E-times they contain the infinite valuation quotient Z. The geometric category decomposes as the product over b in B(T)=pi_1(T)_Gamma of D(T(E),Lambda), and Z_geom(T,Lambda) is the corresponding product of R_T. The classical abelian-category centre description is imported from SR.1, not the complex Bernstein-block theorem.

**Hypotheses.**

- Use full local reciprocity, including wild p-primary equal-characteristic characters.
- The inverse limit is the compatible group-algebra completion, not a finite group-algebra approximation to all T(E).
- Induced-torus resolutions and their exactness belong to the proposed RG2.6 extension.

**Construction or proof.**

1. Use the BG torus classification and VS stratum equivalence for the geometric product.
2. Import SR.1’s centre as the inverse limit of idempotent Hecke corners; for the abelian group T(E) these identify with group algebras of quotients.
3. Resolve T by induced tori using the requested reductive-group input, keeping the exact sequence and dual maps.
4. Use product and Weil restriction to reduce to G_m and apply local reciprocity to the continuous cocycle/character functor.
5. Pass to coordinate algebras and the compatible K-completions. The missing full equal-characteristic reciprocity is a recorded gap, not supplied by a prime-to-p statement.

**Acceptance.**

- For G_m the unramified quotient contributes Lambda[t,t^-1].
- Check norm compatibility for an induced torus and restriction to open K.
- No definition of the general Bernstein centre is duplicated here.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`](#excursionoperatorsandspectralaction-es6-functoriality-weil-restriction)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`](#excursionoperatorsandspectralaction-es6-functoriality-products)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`](#excursionoperatorsandspectralaction-es6-functoriality-isogenies)
- `mathlib:MonoidAlgebra`
- `tauceti:TauCeti.ClassFieldTheory.Formation`
- `SmoothRepresentationsOfLocalGroups:SR.1`
- `BunGAndNewtonStrata:BG1/abelianization-identification`
- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`
- `ReductiveGroupsPartII:RG2.5`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6.4 proof, p. 333. The reduction uses separate reductive-group and reciprocity suppliers.

<a id="excursionoperatorsandspectralaction-es6-functoriality-torus-two-leg-calculation"></a>

#### The normalized two-leg torus excursion

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`. Suggested name: `torusTwoLegCalculation`.

Fix geometric Artin reciprocity rec_geom:E-times to W_E^top-ab, sending a uniformizer to geometric Frobenius; rec_geom(x)=Art_arith(x^-1), precomposition with inversion rather than the inverse function of Art_arith. For a smooth character chi:E-times to L-times, the G_m two-leg datum Std external-tensor Std-dual with its tautological creation and annihilation has scalar chi(rec_geom^-1(gamma_1 gamma_2^-1)). At (gamma,1) it is the usual parameter chi composed with rec_geom^-1. On any degree-b line-bundle stratum the same scalar occurs.

**Hypotheses.**

- Topological abelianization means quotient by the closure of the commutator, not the raw algebraic quotient.
- Track the source/target conventions of the Hecke correspondence and of the associated character sheaf.
- The formula is a planned geometric calculation; the Lean prototype checks only the group-homomorphism identity, with the geometric identification left out.
- The scalar calculation does not establish the integral diagonal-centre theorem. Its required strengthening is an operator identity on the regular smooth modules Lambda[E-times/K], for every compact open pro-p K and every degree stratum: the two-leg operator acts by the group-algebra element of rec_geom^-1(gamma_1 gamma_2^-1), naturally in Lambda and compatible under K-refinement. This strengthening and its endpoint convention remain an explicit gap.

**Construction or proof.**

1. Use the requested Lubin–Tate comparison BC(O(1)) minus zero modulo E-times = Div1 and its explicit torsor.
2. Fargues Proposition 2.16 describes Frobenius descent as pi times the canonical descent. Proposition 3.3 computes the associated E_chi character as chi^-1 composed with arithmetic Artin^-1.
3. Identify the Hecke endpoint actions and the associated sheaf convention so this monodromy is expressed using rec_geom, without silently removing either inversion. This endpoint adapter is recorded as a remaining verification gap.
4. Compose the Std and Std-dual modifications: their two Weil actions produce gamma_1 gamma_2^-1; evaluation cancels the line-bundle degree dependence.
5. Use the matrix coefficient to recover the G_m parameter; a single-leg scalar is the specialization gamma_2=1.

**Acceptance.**

- For an unramified chi with chi(pi)=a, geometric Frobenius at the first leg and identity at the second gives a.
- On the diagonal gamma_1=gamma_2 the scalar is one.
- Switching the legs inverts the scalar.
- The endpoint/character inversion must be checked against the torsor, not inferred from a name for Frobenius.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`](#excursionoperatorsandspectralaction-es6-functoriality-tori-spectral-center)
- `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`
- `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6.5 proof, p. 333. The missing displayed calculation is planned explicitly, rather than treated as a baseline fact.
- [Fargues-AbelJacobi (ES5)](#source-es5-fargues-abeljacobi), Proposition 3.3 proof, p. 13. Arithmetic normalization and the associated-sheaf inversion are read from the proof.

<a id="excursionoperatorsandspectralaction-es6-functoriality-tori-diagonal-embedding"></a>

#### The diagonal torus centre map

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`. Suggested name: `toriDiagonalEmbedding`. Planet: **Diagonal torus centre map**.

Under the spectral isomorphism with R_T and the geometric identification Z_geom(T,Lambda)=product_(b in B(T)) R_T, the map Z_spec(T,Lambda) to Z_geom(T,Lambda) sends r to the constant tuple (r)_b. Consequently phi_chi on every torus stratum is the usual torus parameter with the specified reciprocity normalization. This is an equality of the actual centre actions and their coordinates, not merely agreement on one chosen character.

**Hypotheses.**

- For a torus its centre is connected, so the centre-component hypothesis is automatic.
- The entire B(T) product, not only the neutral stratum, occurs.

**Construction or proof.**

1. Resolve by induced tori and descend the action along the resolution using the adjoint-isomorphism comparison.
2. Apply the product and Weil-restriction comparisons to reduce to G_m.
3. First establish the required universal-coefficient two-leg operator identity on Lambda[E-times/K] for each compact open pro-p K and degree b, using the actual Lubin–Tate kernel and endpoint actions. The scalar theorem currently stated by torus-two-leg-calculation does not supply this identity; it is a recorded gap.
4. Having proved the operator identity, use the compatible K-generators and the regular-module action to identify every completed group-algebra coordinate in R_T, then every B(T) factor. Do not pass from field-valued character evaluations to equality in a possibly nonreduced coefficient algebra.

**Acceptance.**

- For G_m, B(T)=Z, and every degree factor receives the same r.
- Check the full centre action rather than only its evaluation on irreducible characters; characters need not detect all integral nilpotents.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`](#excursionoperatorsandspectralaction-es6-functoriality-tori-spectral-center)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`](#excursionoperatorsandspectralaction-es6-functoriality-torus-two-leg-calculation)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`](#excursionoperatorsandspectralaction-es6-functoriality-isogenies)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`](#excursionoperatorsandspectralaction-es6-functoriality-products)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`](#excursionoperatorsandspectralaction-es6-functoriality-weil-restriction)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- `BunGAndNewtonStrata:BG1/abelianization-identification`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6.5, p. 333. The centre statement is stronger than a scalar pointwise test.

<a id="excursionoperatorsandspectralaction-es6-functoriality-central-characters-and-twisting"></a>

#### Central characters for a connected centre

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`. Suggested name: `centralCharacters`. Planet: **Central-character compatibility**.

If Z=Z(G) is connected, it is a torus. For irreducible smooth pi with central character omega_pi, the composite of phi_pi with the dual map Ghat to Zhat is the usual parameter of omega_pi. The correct adjoint-isomorphism map is multiplication Z times G to G. Pulling pi back along it identifies its scalar central action with omega_pi external-tensor pi; combine this with the product parameter and torus comparison.

**Hypotheses.**

- Z to G by itself does not induce an adjoint-group isomorphism.
- Use the excursion version if ell divides a relevant centre-component order.
- Smooth central characters and the irreducible scalar action are imported from the representation-theoretic supplier.

**Construction or proof.**

1. Use Schur’s lemma to identify the central action with a smooth character.
2. Construct multiplication and its Weil-equivariant dual map through the reductive-group/Satake supplier.
3. Apply adjoint-isomorphism compatibility to multiplication and product compatibility to the external representation.
4. Identify the Z-coordinate using the diagonal torus theorem and cancel the unchanged G-coordinate.

**Acceptance.**

- For G=T the statement is the torus result.
- For a connected-centre group the central dual projection, not restriction of the primal parameter, is used.
- This proof does not depend on the ES7 parabolic theorem.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`](#excursionoperatorsandspectralaction-es6-functoriality-isogenies)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`](#excursionoperatorsandspectralaction-es6-functoriality-products)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-tori-diagonal-embedding)
- `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality`
- `ReductiveGroupsPartII:RG2.5`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6 closing paragraph, p. 333. Specifies the two maps from the centre and the abelianized group.

<a id="excursionoperatorsandspectralaction-es6-functoriality-twisting-by-abelianized-characters"></a>

#### Twisting by characters of the abelianization

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`. Suggested name: `twisting`.

Let a:G to D=G/G_der and chi be a smooth L-times character of D(E). For irreducible smooth pi, phi_(pi tensor chi composed with a) is phi_pi multiplied by the central cocycle dual a composed with phi_chi. In L-group notation multiply only the Ghat-valued cocycle part, retaining the same Weil projection. Equivalently this is composition of the product parameter with the dual of the graph map G to G times D.

**Hypotheses.**

- The dual torus Dhat maps centrally into Ghat.
- The two cocycles share the prescribed Weil projection and use its action; do not multiply their Weil components.

**Construction or proof.**

1. Apply the product theorem to pi external-tensor chi.
2. Apply the adjoint-isomorphism theorem to g mapped to (g,a(g)).
3. Use the torus normalization to identify the twisting cocycle, and centrality to check its cocycle identity.

**Acceptance.**

- The trivial character leaves the parameter unchanged.
- Successive twists compose by multiplying central cocycles.
- No use of ES7 parabolic induction is needed.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`](#excursionoperatorsandspectralaction-es6-functoriality-central-characters-and-twisting)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`](#excursionoperatorsandspectralaction-es6-functoriality-isogenies)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`](#excursionoperatorsandspectralaction-es6-functoriality-products)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-tori-diagonal-embedding)
- `LanglandsParameterStacks:LP0/functoriality-of-cocycles`
- `ReductiveGroupsPartII:RG2.5`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6 closing paragraph, p. 333. The graph map and the central dual twisting cocycle.

<a id="excursionoperatorsandspectralaction-es6-functoriality-z-embedding"></a>

#### Pseudo-z-embeddings and z-embeddings

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`. Suggested name: `ZEmbedding`. Planet: **Z-embeddings**.

Over a p-adic field F, a pseudo-z-embedding is an injective morphism G to Gz of connected reductive F-groups such that C=Gz/G is a torus, H1(F,C)=1 and H1(F,Z(G)) to H1(F,Z(Gz)) is bijective. It is a z-embedding if Z(Gz) is connected and C is an induced torus. Kaletha constructs it by embedding the diagonalizable centre in a torus T with induced quotient and the same H1, then taking Gz=G times_Z T. The injective z-embedding is distinct from a surjective z-extension with induced-torus kernel and simply connected derived group.

**Hypotheses.**

- Kaletha’s source is p-adic; a uniform claim for arbitrary equal-characteristic E is not justified by this citation.
- The cohomological bijection is essential: SL_n to GL_n is not a z-embedding in the cited p-adic setting.
- These definitions and their application-level construction belong here; foundational z-extensions and induced-torus resolutions belong to proposed RG2.6.

**Construction or proof.**

1. Use the existing reductive/multiplicative-type carriers and the requested finite local cohomology input.
2. Embed Z(G) in T0, split the quotient over F1, and choose a finite extension whose norm kills its finite H1 image using local reciprocity.
3. Take the fibre-product torus T and verify the centre H1 bijection; push out G along Z(G) to T.
4. From injectivity on centre H1 prove Z(Gz)(F) to C(F) surjective, hence Gz(F)=Z(Gz)(F)G(F).
5. Given an extension of a smooth central character, define the representation on a product z g by that character times pi(g); prove descent and smoothness using the requested representation dictionary.

**Uses determining the interface.**

- **Kaletha Corollary 5.3 and Fact 5.5:** Reduce central-character questions over p-adic fields to connected centre while retaining rational-point control.
- **ES6 disconnected-centre comparison and ES7 parabolic:** Compare the representation extensions and their parameters; no new general local Langlands theory is assumed.

**API.**

- `ZEmbedding.ofMaps` (constructor): Bundle the injection and torus quotient with the full scheme and cohomological conditions; the prototype bundles only its rational exactness and central lifting.
- `ZEmbedding.quotient_inclusion` (simp): The quotient is one on the included G.
- `ZEmbedding.central_lift` (data): Each c in C(F) has a lift in Z(Gz)(F).
- `ZEmbedding.rational_factorization` (characterisation): Every x in Gz(F) can be written z times i(g) with central z and g in G(F).
- `ZEmbedding.extend_representation` (compatibility): A chosen smooth central-character extension agreeing on the intersection gives a smooth representation of Gz(F) restricting to pi; its formula on z i(g) is the central scalar times pi(g).

**Unit tests.**

- `zembedding_identity` (degenerate): For a connected-centre reductive group, its identity with quotient one is a z-embedding; its rational-point inclusion is the identity.
- `zembedding_product` (computation): For connected-centre G and induced torus C, the inclusion G to G times C and projection to C give a z-embedding and central lifts (1,c).
- `zembedding_requires_central_lifting` (non-example): A proposed rational quotient not surjective on the centre cannot be the rational-point data of a pseudo-z-embedding.

**Acceptance.**

- Check both quotient/cohomology conditions, not merely connected centre and torus quotient.
- Only pseudo-z-embeddings are asserted to be transitive (Fact 5.4).
- An extension of a central character is a choice whose effect must be compared, not declared canonical.

**Direct prerequisites.**

- `ReductiveGroupsPartII:RG2.5`
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `mathlib:MonoidHom`
- `mathlib:Subgroup`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`

**Source locators.**

- [Kaletha-2018 (ES5)](#source-es5-kaletha-2018), Definition 5.1 and Proposition 5.2, p. 17. The full definition includes all preceding pseudo-z conditions.
- [Kaletha-2018 (ES5)](#source-es5-kaletha-2018), Fact 5.5, p. 19. The exact cohomological reason for central rational-point surjectivity.

<a id="excursionoperatorsandspectralaction-es6-functoriality-z-embedding-central-character-comparison"></a>

#### The disconnected-centre reduction and choice comparison

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`. Suggested name: `zEmbeddingCentralCharacterComparison`.

For a p-adic E and a z-embedding G to Gz, and a chosen smooth extension over L of pi’s central character, extend pi to Gz(E). Its connected-centre parameter projects back to the G parameter by the adjoint-isomorphism theorem, and its restriction to the included centre recovers omega_pi. Two such extensions differ by a character of C(E); twisting comparison shows they induce the same descended central data. Common pseudo-z refinements compare choices of embeddings, provided the chosen characters extend smoothly on the refinement. This node proves a conditional p-adic comparison only. The arbitrary-local-field disconnected-centre target remains open; a standard surjective z-extension does not supply a connected-centre cover.

**Hypotheses.**

- Extension of the central character over L, including modular coefficients, must be smooth and is a requested input.
- Disconnected Z(G) is not treated as an E-torus with an ordinary torus L-parameter. Central data means its actual scalar character, compared through the injective p-adic z-embedding.
- Do not deduce a global compatibility from a single chosen extension without the twisting/common-refinement argument.

**Construction or proof.**

1. Use the rational central-factorization lemma to extend pi; irreducibility is preserved because the extra factors act centrally.
2. Apply the connected-centre theorem to Gz and the adjoint-isomorphism theorem to G to Gz.
3. Two central-character extensions differ by a quotient-torus character; apply twisting and restrict back to G to cancel it.
4. Use Kaletha Fact 5.6: the pushout G1 times_Z(G) Z(G2) is a common pseudo-z refinement. Each quotient is the other original quotient torus; Fact 5.5 gives its central rational surjectivity and the required H1 vanishing. Fact 5.4 makes the composite pseudo-z. Apply the two adjoint-isomorphism comparisons and twisting cancellation to identify descended data.
5. For arbitrary E first find and source-check a valid disconnected-centre comparison in its actual cohomological field range. No connected-centre surjective cover with induced-torus kernel is requested: standard z-extensions need not have connected centre and cannot replace Kaletha’s injective construction.

**Acceptance.**

- For connected centre the identity embedding gives the earlier result.
- A quotient character changes the extended parameter but does not change the descended data.
- No general centre-character parameter for a disconnected finite-type group is silently defined.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-z-embedding)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`](#excursionoperatorsandspectralaction-es6-functoriality-central-characters-and-twisting)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`](#excursionoperatorsandspectralaction-es6-functoriality-twisting-by-abelianized-characters)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`](#excursionoperatorsandspectralaction-es6-functoriality-isogenies)
- `ReductiveGroupsPartII:RG2.5`
- `SmoothRepresentationsOfLocalGroups:SR.2`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6 closing paragraph, p. 333. The cited Kaletha section supplies injective p-adic z-embeddings, not a connected-centre surjective cover. The source terminology is recorded in E5; no all-field conclusion is inferred.
- [Kaletha-2018 (ES5)](#source-es5-kaletha-2018), Fact 5.5 and following paragraph, p. 19. The paragraph compares representation extensions by quotient characters; the full passage, not this short fragment, was read.

<a id="excursionoperatorsandspectralaction-es6-duality"></a>

### ES6:duality. Duality and contragredients

Switch Hecke kernels using Chevalley and Bernstein–Zelevinsky duality before scalar evaluation. The smooth-contragredient conclusion returns to ES7’s parabolic theorem for its supercuspidal-support argument. Thus it follows the relevant ES7 nodes in implementation order even though it is described in the second part.

<a id="excursionoperatorsandspectralaction-es6-duality-bernstein-zelevinsky-duals"></a>

#### Chevalley compatibility for Bernstein–Zelevinsky duals

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`. Suggested name: `bernsteinZelevinskyDuals`. Planet: **Chevalley duality of parameters**.

The existing spectral-to-geometric centre map intertwines the spectral involution induced by the pinned Chevalley automorphism with the involution induced by Bernstein–Zelevinsky duality. If both A and D_BZ(A) are Schur and the duality is defined in the required category, phi_(D_BZ A)=theta composed with phi_A up to Ghat-conjugacy. More generally a Schur cohomological constituent with inherited scalar central action has that parameter. On irreducible smooth representations use the classical BZ comparison with its shifts, rather than assume the dual complex is a representation in degree zero.

**Hypotheses.**

- The actual Satake switch is Chevalley up to Ad(rhohat(-1)); the inner automorphism disappears only after conjugacy quotient.
- Use the coefficient policy for the centre square and its excursion variant for unrestricted L.
- Import the compact/reflexive domain and extension of BZ duality on D_lis at the actual coefficients from VS5. Its existing bernstein-zelevinsky-duality node states the étale compact result; the lisse extension and its enriched-centre action are requested separately and remain a gap.

**Construction or proof.**

1. Import ES4’s duality/centre square, HS1’s dual Hecke identity and GS4’s exact Chevalley comparison.
2. Reverse creation and annihilation under duality and compare the Weil action through the switch; this pulls back the invariant coefficient by theta.
3. Keep the rhohat(-1) inner correction until passing to conjugacy classes.
4. Use scalar-character uniqueness for the dual object or inherited Schur constituent.

**Acceptance.**

- For a torus Chevalley is inversion and dual characters invert.
- The compact BZ dual may carry a cohomological shift; it must not be identified with a degree-zero smooth dual without further input.
- The spectral-centre supplier is an explicit prerequisite.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`](#excursionoperatorsandspectralaction-es6-coefficient-policy-for-the-functorial-diagrams)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`](#excursionoperatorsandspectralaction-es5-parameter-of-a-schur-irreducible-sheaf)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- [`ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution`](#excursionoperatorsandspectralaction-es4-duality-and-the-chevalley-involution)
- `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution`
- `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`
- `VStackSheavesAndLisseCategories:VS5/bernstein-zelevinsky-duality`
- `VStackSheavesAndLisseCategories:VS5`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.5.3 proof, p. 330. The centre involutions and parameter consequence.
- [FS-geometrization (ES5)](#source-es5-fs-geometrization), VI.12.1 proof, p. 241. The rank-one sign calculation explains the inner rho(-1) correction.

<a id="excursionoperatorsandspectralaction-es6-duality-smooth-duals"></a>

#### Chevalley compatibility for smooth contragredients

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`. Suggested name: `smoothDuals`. Planet: **Smooth contragredient parameters**.

For every irreducible smooth L-representation pi of G(E), its smooth contragredient pi-vee is irreducible and phi_(pi-vee)=theta composed with phi_pi up to Ghat-conjugacy. For supercuspidals this follows from the BZ comparison (with its shift accounted for). In general it is a late return using ES7’s parabolic-induction parameter theorem and SR.2’s contragredient/induction dictionary. The twist of the Levi inclusion and all modulus conventions are retained.

**Hypotheses.**

- Admissibility is the all-coefficient supplier input, including characteristic ell.
- Use ES7’s unnormalized induction statement with its explicitly twisted Levi inclusion; do not silently replace it by normalized induction.
- This stage is downstream of ES7:parabolic; the early functoriality nodes here never depend on this return.

**Construction or proof.**

1. Apply BZ compatibility in the supercuspidal case, using the supplier’s agreement with the smooth dual up to shift.
2. Use supercuspidal support and realize pi as an irreducible subquotient of an eligible induction.
3. Take smooth duals using the existing induction/duality comparison, tracking the opposite parabolic and modulus factor.
4. Apply ES7’s parameter theorem to both induced sides; use the Chevalley compatibility of the twisted Levi inclusions to identify the two conjugacy classes.

**Acceptance.**

- For a character of G_m, phi_(chi^-1)=phi_chi^-1.
- The duality graph remains acyclic by keeping this result downstream of ES7.
- The proof covers irreducible subquotients, not only a socle or cosocle.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`](#excursionoperatorsandspectralaction-es6-duality-bernstein-zelevinsky-duals)
- [`ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`](#excursionoperatorsandspectralaction-es5-invariance-and-coefficient-transport)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`](#excursionoperatorsandspectralaction-es7-parabolic-parabolic-induction)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`](#excursionoperatorsandspectralaction-es7-parabolic-normalised-induction-dictionary)
- `SmoothRepresentationsOfLocalGroups:SR.2`
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- `VStackSheavesAndLisseCategories:VS5`

**Source locators.**

- [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.5.3 proof, p. 330. The source explicitly requires the ES7 induction theorem.

## Part III. Parabolic compatibility and classical comparison (ES7)

<a id="excursionoperatorsandspectralaction-es7-parabolic"></a>

### ES7:parabolic. Stratum centres and parabolic induction

Restrict centres along the fully faithful stratum embeddings, form the twisted dual-Levi inclusion, and reduce coefficients and group form. Increasing instability and the étale constant-term computation produce the stratum factorization. Unnormalized parabolic induction and the normalized-induction dictionary are distinct conclusions. The group reduction retains its equal-characteristic gap.

<a id="excursionoperatorsandspectralaction-es7-parabolic-stratum-maps"></a>

#### Bernstein maps from strata

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`. Planet: **Bernstein stratum maps**.

For a Z_ℓ[√q]-algebra Λ and reductive G/E, restrict the geometric centre along the fully faithful embedding D(G_b(E),Λ) ≃ D_lis(Bun_G^b,Λ) → D_lis(Bun_G,Λ). Composing with the imported spectral-to-geometric centre map defines Ψ_G^b. At b=1 use j_! and write Ψ_G. The spectral centre formulation requires |π₀Z(G)| invertible in Λ; the excursion algebra formulation has no such condition. The embeddings are those provided by VS4 (e.g. the left adjoint to i_b^*), not an unrestricted shriek functor on lisse categories.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; b ∈ B(G).
- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ).
- Spectral-centre form: |π₀Z(G)| invertible in Λ (the hypothesis of FS IX.5.2); the excursion-algebra form has no condition on Λ.

**Construction or proof.**

1. Use VS4 to identify the stratum category and its fully faithful embedding.
2. Restrict natural endomorphisms of the identity; compose with ES1’s map. Full faithfulness and the adjunction identify the action on objects, so no choice of extension changes it.

**Uses determining the interface.**

- **FS IX.7.2:** The stratum restriction is the left side of the factorization triangle.
- **FS IX.7.3:** Its value at b=1 acts on parabolic induction.

**API.**

- `PsiG` (constructor): The composite of the spectral-to-geometric map with restriction to the trivial stratum.
- `PsiGb` (constructor): The same composite using the b-stratum and its group G_b(E).
- `restrictCentre` (constructor): For a fully faithful additive functor F : A → B of preadditive categories, the ring map Z(B) → Z(A), z ↦ (X ↦ F⁻¹(z_{F X})); Ψ_G^b is restrictCentre of the stratum embedding composed with ES1’s map.
- `restrictCentre_app` (simp): F((restrictCentre z)_X) = z_{F X} for every object X.
- `PsiGb.basepoint` (compatibility): Ψ_G^1=Ψ_G.
- `PsiGb.embedding_independent` (characterisation): Eligible fully faithful stratum embeddings with the specified adjunction induce the same central action.
- `PsiGb.excursion` (compatibility): Restriction of the excursion action defines the analogous map even when ℓ divides |π₀Z(G)|.

**Unit tests.**

- `PsiGb.basepoint_test` (compatibility): At b=1, evaluate Ψ_G^b on any spectral function and obtain Ψ_G.
- `PsiG.one_test` (computation): The spectral constant 1 acts as the identity on every smooth representation.
- `PsiGb.excursion_test` (non-example): For a group with ℓ dividing |π₀Z(G)|, the excursion construction still gives a central action; the spectral-centre identification is not invoked.

**Acceptance.**

- For b=1 the general restriction equals j_!’s map.
- The maps preserve 1, addition and multiplication.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`](#excursionoperatorsandspectralaction-es1-spectral-center-spectral-to-geometric-center-map)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`](#excursionoperatorsandspectralaction-es1-spectral-center-excursion-algebra-without-the-coefficient-condition)
- `VStackSheavesAndLisseCategories:VS4`
- `SmoothRepresentationsOfLocalGroups:SR.1`
- `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`
- `mathlib:CategoryTheory.Adjunction`
- `mathlib:CommRing`
- [`ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`](#excursionoperatorsandspectralaction-es5-stratum-centre-embedding-independence)
- [`ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center`](#excursionoperatorsandspectralaction-es0-classical-center-map-to-the-classical-bernstein-center)
- `mathlib:CategoryTheory.CatCenter`
- `mathlib:CategoryTheory.Functor.FullyFaithful`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Definition IX.7.1, p. 334. Definition IX.7.1 defines the fully faithful stratum restrictions; the excursion replacement is in the proof of IX.7.2.

<a id="excursionoperatorsandspectralaction-es7-parabolic-twisted-levi-inclusion"></a>

#### Twisted inclusion of Levi cocycles

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`. Planet: **Twisted Levi inclusion**.

Write M̂=Ĝ_b⊂Ĝ for the dual Levi and j for its pinned inclusion. Let deg:W_E→ℤ send geometric Frobenius to 1 and let t=(2ρ_Ĝ−2ρ_M̂)(√q). The Satake inclusion sends a continuous cocycle φ to cφ(w)=t^{deg(w)}j(φ(w)), using the fixed usual pinned Weil actions on both sides. The cocharacter difference is Weil invariant and central in M̂; hence t is invariant and centralizes j(M̂). These properties, together with equivariance of j, prove the cocycle identity. The map is conjugation equivariant and induces pullback on invariant functions.

**Hypotheses.**

- G quasi-split-pinned dual data: Ĝ with its pinned Weil action, M̂ = Ĝ_b the dual of the Levi attached to b, j : M̂ → Ĝ the pinned inclusion.
- A a ℤ[√q]-algebra (so (2ρ_Ĝ − 2ρ_M̂)(√q) is defined); deg : W_E → ℤ sends geometric Frobenius to 1.

**Construction or proof.**

1. Import the dual Levi, invariant cocharacter difference and pinned actions from GS4/RG2.5.
2. Expand cφ(wv), use additivity of degree, invariance of t, centrality in the Levi and the cocycle equation for φ.
3. Check continuity on finite-inertia charts and conjugation equivariance using LP0.

**Uses determining the interface.**

- **FS IX.7.2:** Pullback along this map is the arrow between the spectral centres.
- **FS IX.7.3:** This inclusion determines the induced representation’s parameter.

**API.**

- `cocycleMap` (constructor): On A-points, φ ↦ (w ↦ t^{deg(w)}j(φ(w))).
- `cocycleMap.isCocycle` (characterisation): cφ(wv)=cφ(w)·w(cφ(v)), and cφ(1)=1.
- `cocycleMap.degree_zero` (simp): If deg(w)=0, cφ(w)=j(φ(w)).
- `cocycleMap.basicCase` (compatibility): If M̂=Ĝ then cφ=jφ.
- `cocycleMap.conjugation` (functoriality): Conjugating φ by m conjugates cφ by j(m); base change of A commutes with this map.

**Unit tests.**

- `cocycleMap.basic_test` (degenerate): For M̂=Ĝ the cocharacter difference is zero, so the map is the identity inclusion.
- `cocycleMap.GL2_test` (computation): For the upper Borel of GL₂, trivial φ evaluates at geometric Frobenius to diag(√q,1/√q).
- `cocycleMap.inertia_test` (computation): On inertia (degree zero) the twisting factor is 1.

**Acceptance.**

- For a basic stratum, t=1.
- The GL₂ upper-Borel example has t=diag(√q,1/√q).

**Direct prerequisites.**

- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `ReductiveGroupsPartII:RG2.5`
- `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`
- `mathlib:MonoidHom`
- `mathlib:RootPairing`
- `mathlib:Subgroup`
- `mathlib:MulAut`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), §IX.7.1 (Compatibility with G_b), p. 334. The displayed twisted formula uses this degree convention.

<a id="excursionoperatorsandspectralaction-es7-parabolic-coefficient-reduction"></a>

#### Reduction to torsion coefficients

**Lemma.** Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`.

To prove the stratum triangle or the induction square for arbitrary Λ, prove the universal statement over Z_ℓ[√q], reduce modulo ℓ^r, and use ℓ-adic separatedness of the integral Bernstein centre. The centre is lim_K Z(e_KH_Λe_K) over a cofinal system of pro-p compact open K; p is invertible in Λ. Extend scalars from the universal action. Separatedness is asserted for Z_ℓ[√q], not for arbitrary Λ. Replace spectral functions by excursion generators when the centre-order condition fails.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; b ∈ B(G).
- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ); when ℓ divides |π₀Z(Ĝ)| the spectral centre is replaced by the excursion algebra.
- Separatedness is used only for Λ = ℤ_ℓ[√q].

**Construction or proof.**

1. Use the SR.1 corner-centre identification and integral separatedness.
2. Equality modulo every ℓ^r implies equality in the integral centre. Naturality of the universal excursion action gives base change.

**Acceptance.**

- No use of separatedness of a field or of arbitrary torsion coefficients.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`](#excursionoperatorsandspectralaction-es7-parabolic-stratum-maps)
- `SmoothRepresentationsOfLocalGroups:SR.1`
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`](#excursionoperatorsandspectralaction-es1-spectral-center-excursion-algebra-without-the-coefficient-condition)
- `mathlib:MonoidAlgebra`
- `mathlib:Module.End`
- `VStackSheavesAndLisseCategories:VS3/lisse-comparisons`
- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Proof of IX.7.2, p. 335. The proof reduces coefficients to avoid the lisse/étale distinction.

<a id="excursionoperatorsandspectralaction-es7-parabolic-basic-case-and-quasisplit-reduction"></a>

#### Reduction to a quasi-split group

**Lemma.** Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`.

The b-basic triangle follows from the Hecke-equivariant pure-inner-twisting equivalence Bun_G≃Bun_{G_b}. For general G and E p-adic choose a z-embedding G↪G′ (Kaletha, Definition 5.1): C=G′/G an induced torus, H¹(E,C)=1, H¹(E,Z(G))→H¹(E,Z(G′)) bijective, and Z(G′) connected. Prove Bun_G≃Bun_G′×_{Bun_C}{1}, injectivity B(G)→B(G′), surjectivity Z(G′)(E)→C(E), and G′_{b′}(E)=Z(G′)(E)G_b(E). Restrictions from G′_{b′} detect the centre of G_b. Reduce to connected centre using ES6’s functoriality for maps inducing an isomorphism of adjoint groups (FS Theorem IX.6.1, which the z-embedding is, though it is not an isogeny); then choose basic b₀ making G_{b₀} quasi-split using BG1’s basic-inner-class surjectivity, and apply pure inner twisting.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; b ∈ B(G).
- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ).
- A z-embedding G ↪ G′ in the sense of Kaletha, Definition 5.1 (torus quotient C with H¹(E, C) = 1, bijective H¹ on centres, connected Z(G′)); Kaletha states it for p-adic E, and the equal-characteristic case is the gap ES7/gap/z-embedding.

**Construction or proof.**

1. Import a z-embedding with all Kaletha 5.1 conditions (E p-adic), not merely a torus quotient and connected centre; in equal characteristic use ES7/gap/z-embedding.
2. Use the central quotient and the Bun fibre identity to obtain injectivity on classes and detection on representation restrictions.
3. Import the BG1 consequence of Kottwitz 10.4 and the BG0 Hecke-equivariant equivalence. Apply the already proved basic case.

**Acceptance.**

- At b basic this recovers pure-inner-form invariance.
- The Kottwitz citation supplies surjectivity of B under a central extension; the bridge to H¹(E,G_ad) is proved in BG1.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`](#excursionoperatorsandspectralaction-es7-parabolic-stratum-maps)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`](#excursionoperatorsandspectralaction-es7-parabolic-coefficient-reduction)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`](#excursionoperatorsandspectralaction-es6-functoriality-isogenies)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-z-embedding)
- `BunGAndNewtonStrata:BG0/pure-inner-twisting`
- `BunGAndNewtonStrata:BG1`
- `BunGAndNewtonStrata:BG0`
- `BunGAndNewtonStrata:BG2:uniformization/bun-g-as-v-stack`
- `HeckeStacksAndLocalShtukas:HS0/structure-group-and-inner-form`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Proof of Theorem IX.7.2, p. 335. This is the complete reduction in the source.
- [Kaletha-2018 (ES7)](#source-es7-kaletha-2018), §5.1, Definition 5.1 (p. 78) and Fact 5.5 (p. 80). Definition 5.1 (torus quotient, H¹(F, C) = 1, bijective H¹ on centres; z-embedding: also connected Z(G_z) and induced C) and Fact 5.5 (central surjectivity). Kaletha assumes F p-adic (§2, p. 64).
- [Kottwitz-2014 (ES7)](#source-es7-kottwitz-2014), Proposition 10.4, p. 50. Proposition 10.4 holds for any local field (§10.1) and gives B(G)_bsc → B(G_ad)_bsc surjective for connected Z(G); identifying B(G_ad)_bsc with H¹(E, G_ad) uses κ (Proposition 13.1), requested from BG1.

<a id="excursionoperatorsandspectralaction-es7-parabolic-increasingly-unstable-sequence"></a>

#### Increasing instability at a fixed parabolic

**Lemma.** Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`.

For quasi-split G choose the canonical parabolic P_b and a cocharacter μ central in its Levi with dynamical parabolic P_b. Put b_N=bμ(π)^N. Then G_{b_N}=G_b and the stratum maps for b and b_N agree. For each fixed bounded Hecke type V, sufficiently large N makes every self-modification of E_{b_N} of that type preserve its Harder–Narasimhan reduction to P_b.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G quasi-split over E with a fixed Borel; b ∈ B(G) with canonical parabolic P = P_b.
- μ a cocharacter with dynamical parabolic P; V a fixed bounded Hecke type (N is chosen after V).

**Construction or proof.**

1. Use BG1’s canonical Levi and BG4’s bounded-modification slope estimate.
2. The unique modification of type Nμ between the two strata transports the same representation; HS4 compatibility transports central actions.
3. Choose N after fixing V; the HN slope gaps then exceed its bounded possible changes.

**Acceptance.**

- N depends on V; one uniform N for all Hecke types is not asserted.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`](#excursionoperatorsandspectralaction-es7-parabolic-basic-case-and-quasisplit-reduction)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`](#excursionoperatorsandspectralaction-es7-parabolic-twisted-levi-inclusion)
- `BunGAndNewtonStrata:BG1`
- `BunGAndNewtonStrata:BG4`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `tauceti:TauCeti.Cocharacter.parabolic`
- `tauceti:TauCeti.Cocharacter.levi`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`
- `HeckeStacksAndLocalShtukas:HS2/framed-bundle-fibres`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Proof of Theorem IX.7.2, pp. 335–336. The sequence and preservation argument are both used in the proof.

<a id="excursionoperatorsandspectralaction-es7-parabolic-constant-term-computation"></a>

#### Factorization of the stratum centre map

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`. Planet: **Parabolic stratum factorization**.

For every b∈B(G), Ψ_G^b = Ψ_{G_b}∘c_b^*, with c_b the twisted Levi cocycle inclusion. Use spectral centres under the centre-order condition and excursion algebras otherwise. In the proof the HN-preserving Hecke diagram maps through P and its Levi M, with G_b=M_{b_M} for basic b_M. The pushforward of the Satake sheaf is CT_P(S_V), agreeing with dual-Levi restriction with the cyclotomic twist and degree shift [deg_P]. Excursion creation and annihilation meet only the degree-zero component, so this shift disappears there.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; b ∈ B(G).
- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ).
- Spectral centres when |π₀Z(Ĝ)| and |π₀Z(Ĝ_b)| are invertible in Λ; excursion algebras otherwise.

**Construction or proof.**

1. Apply coefficient and group reductions. Replace b by b_N and use the HN-preserving P/Levi diagram.
2. Apply base change and the GS4 constant-term comparison, with the twisted inclusion rather than the ordinary pinned inclusion.
3. Restrict creation/annihilation to degree zero and compare every excursion generator.

**Acceptance.**

- Basic b has untwisted factorization.
- For GL₂’s nonbasic torus stratum the Frobenius factor is diag(√q,1/√q).

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`](#excursionoperatorsandspectralaction-es7-parabolic-stratum-maps)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`](#excursionoperatorsandspectralaction-es7-parabolic-twisted-levi-inclusion)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`](#excursionoperatorsandspectralaction-es7-parabolic-coefficient-reduction)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`](#excursionoperatorsandspectralaction-es7-parabolic-basic-case-and-quasisplit-reduction)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`](#excursionoperatorsandspectralaction-es7-parabolic-increasingly-unstable-sequence)
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `VStackSheavesAndLisseCategories:VS1`
- `VStackSheavesAndLisseCategories:VS4`
- `mathlib:CategoryTheory.MonoidalCategory`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`
- `HeckeStacksAndLocalShtukas:HS4/levi-compatibility`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Theorem IX.7.2 and proof, pp. 335–337. Creation and annihilation force the component on which the constant-term shift vanishes.

<a id="excursionoperatorsandspectralaction-es7-parabolic-parabolic-induction"></a>

#### Unnormalized parabolic induction

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`. Planet: **Parabolic induction compatibility**.

For P⊂G with Levi M and smooth σ of M(E), the spectral/excursion action on unnormalized Ind_P^Gσ is induced by the twisted Levi pullback on the action on σ. If Λ=L is algebraically closed, σ irreducible and π an irreducible subquotient, φ_π is conjugate to c_Mφ_σ. In the geometric proof choose b=μ(π_E^{-1}) for a cocharacter with dynamical parabolic P. For σ=c-Ind_K^{M(E)}Λ, the sheaf A on Bun_G^b satisfies T_{μ^{-1}}(A)|Bun_G^1 = Ind_P^Gσ(−d/2)[−d], d=⟨2ρ,μ⟩.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; P ⊂ G a parabolic with Levi quotient M.
- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ); Ind_P^G is unnormalized smooth induction.
- For the parameter statement: Λ = L an algebraically closed field, σ irreducible and π an irreducible subquotient of Ind_P^G σ.

**Construction or proof.**

1. Use compactly induced pro-p generators and the coefficient reduction.
2. The modification space is G(E)/P(E), of exact type μ; Satake normalization supplies (−d/2)[−d].
3. Hecke/excursion commutation and the stratum factorization give the square. ES5 gives the subquotient statement.

**Acceptance.**

- For P=G the twist and d vanish.
- Reversing both the cocharacter and shift without changing the stratum is rejected.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`](#excursionoperatorsandspectralaction-es7-parabolic-constant-term-computation)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `SmoothRepresentationsOfLocalGroups:SR.1`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `tauceti:TauCeti.Cocharacter.parabolic`
- `HeckeStacksAndLocalShtukas:HS2/framed-bundle-fibres`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Corollary IX.7.3 and proof, pp. 337–338. The source explicitly uses unnormalized induction; its proof has the inverse cocharacter and negative shift.

<a id="excursionoperatorsandspectralaction-es7-parabolic-normalised-induction-dictionary"></a>

#### Normalized induction and the cyclotomic twist

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`. Planet: **Normalized induction dictionary**.

Fix i_P^Gτ=Ind_P^G(δ_P^{1/2}τ), with δ_P(m)=|det(Ad(m)|Lie U_P)|_E and geometric reciprocity sending a uniformizer to geometric Frobenius. Under the torus parameter dictionary the twist by δ_P^{1/2} has cocycle c^{-1}, where c(w)=(2ρ_Ĝ−2ρ_M̂)(√q)^{deg(w)}. Thus c·φ_{δ_P^{1/2}τ}=jφ_τ and normalized induction uses the ordinary Levi inclusion. The geometric (−d/2)[−d] of IX.7.3 is a Satake sheaf normalization, not a second arbitrary modulus factor.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; P = MU a parabolic.
- Coefficients contain √q; δ_P(m) = |det(Ad(m)|Lie U_P)|_E; reciprocity sends a uniformizer to geometric Frobenius.

**Construction or proof.**

1. Compare the roots of U_P with the cocharacter difference on the dual side.
2. Evaluate δ_P^{1/2} on cocharacters at a uniformizer and use geometric reciprocity: its dual character is c^{-1}.
3. Apply the ES6 twisting theorem and the unnormalized result.

**Acceptance.**

- For upper triangular GL₂, δ_B(diag(a,d))=|a/d| and the trivial normalized principal series has parameter 1⊕1.
- The unnormalized principal series of the trivial character has Frobenius diag(√q,1/√q).
- The source shift is (−d/2)[−d], not (+d/2)[+d].

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`](#excursionoperatorsandspectralaction-es7-parabolic-parabolic-induction)
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `ReductiveGroupsPartII:RG2.5`
- `mathlib:MeasureTheory.Measure.modularCharacter`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`](#excursionoperatorsandspectralaction-es6-functoriality-twisting-by-abelianized-characters)

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Corollary IX.7.3, p. 337 (with the twisted formula of §IX.7.1, p. 334). FS state only the unnormalized result with the cyclotomically twisted Levi map. The δ_P^{1/2} ↔ c^{-1} dictionary is this node’s own derivation (checked: δ_P^{1/2}(λ(ϖ)) = (√q)^{-⟨2ρ_N,λ⟩}, dual to (2ρ_Ĝ − 2ρ_M̂)(√q)^{-1} at geometric Frobenius).

<a id="excursionoperatorsandspectralaction-es7-gln-comparison"></a>

### ES7:GLn-comparison. Characteristic-zero classical comparison

ET.6a supplies the characteristic-zero two-tower realization and its Hecke-fibre identification: SW20 24.2.5 for E = Q_p, and the relevant EL instance of Corollary 24.3.5 for other p-adic E. One abstract two-leg trace calculation is shared with the equal-characteristic realization. Trace recognition is imported for arbitrary groups with the specified factorial hypothesis, not from the finite-group character theorem. Supercuspidal agreement and normalized induction give all irreducibles in characteristic zero.

<a id="excursionoperatorsandspectralaction-es7-gln-comparison-two-tower-realisation"></a>

#### Two tower Hecke realization

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`. Planet: **Two tower realization**.

For E/Q_p, π supercuspidal over Q̄_ℓ, σ=JL(π) on D^× with inv(D)=1/n, and b corresponding to O(−1/n), let B be the b-stratum sheaf of σ. ET.6a supplies the tower cohomology and the tower/Hecke-fibre comparison: SW20 Theorem 24.2.5 for E = ℚ_p, and for E ≠ ℚ_p Corollary 24.3.5 for the EL data of Res_{E/ℚ_p}GL_n (Lubin–Tate side) and of D (Drinfeld side), with the identification of Res_{E/ℚ_p}GL_n-shtukas with GL_n/E local shtukas. Then T_std(B) on the trivial stratum is π⊗ρ_π, and the second dual-standard operation returns σ⊗ρ_π^∨. Consequently the two-leg composite restricted to b is σ⊗ρ_π⊗ρ_π^∨ with its two independent Weil actions. The usual [n−1] and ((n−1)/2) are absorbed in Satake normalization.

**Hypotheses.**

- E a finite extension of ℚ_p (characteristic zero); ℓ ≠ p; coefficients Q̄_ℓ.
- π a supercuspidal irreducible smooth representation of GL_n(E); D the central division algebra of invariant 1/n over E; σ = JL(π); b basic with E_b = O(−1/n).

**Construction or proof.**

1. Import classical LLC/JL and both cohomology computations.
2. Use ET.6a’s comparison downstream of its classical tower and HS2; apply HS3’s Hecke-cohomology interface.
3. Match the Satake shift and Tate twist before composing the two operations.

**Acceptance.**

- The two Weil factors act on ρ_π and its dual separately.
- For n=1 all shifts and half twists are zero.

**Direct prerequisites.**

- `EndoscopicTransferAndUnitaryTraceComparison:ET.6`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`
- `HeckeStacksAndLocalShtukas:HS3`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `VStackSheavesAndLisseCategories:VS4`
- `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`
- `mathlib:Representation`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Proof of IX.7.4, p. 338. FS identify the second operation with the Drinfeld-tower isotypic part σ ⊗ ρ_π^*; the tower/Hecke-fibre comparison itself is imported from ET.6a.

<a id="excursionoperatorsandspectralaction-es7-gln-comparison-two-leg-excursion-is-a-trace"></a>

#### Two-leg excursions compute traces

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`. Planet: **Two-leg excursion trace**.

Let k be a field of characteristic zero (k = Q̄_ℓ), ρ an irreducible n-dimensional representation of W_E with n > 0, and B a sheaf on Bun_G^b with T_V(B)|Bun_G^b ≅ σ ⊗ ρ ⊗ ρ^∨ as D^× × W_E × W_E-representation, V = std ⊠ std^∨ (a two-operation realization: two-tower-realisation supplies it for E of characteristic zero, equal-characteristic/hecke-fibre-transport for E of characteristic p). The creation α : σ → σ ⊗ ρ ⊗ ρ^∨ and the annihilation β are scalar multiples a·coev and b·ev. The excursion operator at (γ₁, γ₂) acts on B by ab·tr(ρ(γ₁γ₂^{-1})). At (1, 1) it is the image of the constant excursion function dim std = n, so ab·n = n and ab = 1. This identifies the combined scalar, not each scalar separately.

**Hypotheses.**

- k = Q̄_ℓ (any field of characteristic zero); ρ an irreducible n-dimensional representation of W_E with n > 0.
- B a sheaf on Bun_G^b with T_{std⊠std^∨}(B)|Bun_G^b ≅ σ ⊗ ρ ⊗ ρ^∨ as D^× × W_E × W_E-representation (the package supplied by two-tower-realisation in characteristic zero and by equal-characteristic/hecke-fibre-transport in equal characteristic).

**Construction or proof.**

1. Apply irreducibility of ρ (Schur) to the W_E × W_E-equivariant maps α and β: they are multiples of coevaluation and evaluation.
2. Evaluate coevaluation, then (ρ(γ₁), ρ^∨(γ₂)), then evaluation: the dual action contributes ρ(γ₂^{-1}), giving tr(ρ(γ₁γ₂^{-1})).
3. At (1, 1) the excursion operator is the image of the constant function n (HS4 fusion, ES1 excursion algebra); characteristic zero gives ab = 1.

**Acceptance.**

- At (γ,γ) the result is n.
- For n=1 and character χ the result is χ(γ₁)/χ(γ₂).
- No mod-ℓ scalar cancellation is asserted when ℓ divides n.

**Direct prerequisites.**

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `mathlib:Representation`
- `mathlib:LinearMap.trace`
- `mathlib:Matrix.trace`
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`](#excursionoperatorsandspectralaction-es0-excursion-datum-and-operator)
- `HeckeStacksAndLocalShtukas:HS4/creation-annihilation-and-triangles`
- `mathlib:coevaluation`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Proof of IX.7.4, p. 338. The source determines the composite scalar at the identity tuple.

<a id="excursionoperatorsandspectralaction-es7-gln-comparison-trace-determines-semisimplification"></a>

#### Semisimple determination for GL_n

**Lemma.** Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`.

Finite-dimensional semisimple characteristic-zero representations of W_E with equal traces at every element are isomorphic. This is R01.1/brauer-nesbitt-traces (stated for any group or monoid with d! invertible), applied to W_E. Continuity is inherited from the two input representations; no finite-group assumption on W_E is made.

**Hypotheses.**

- W a group (here W_E, not finite); k a field of characteristic zero; V, V′ finite-dimensional semisimple k-representations of W.

**Construction or proof.**

1. Apply R01.1/brauer-nesbitt-traces (any group, d! invertible): equal traces imply isomorphic semisimplifications, as continuous representations when both are.
2. Feed it the traces tr ρ(γ) obtained from the two-leg identity at (γ, 1).

**Acceptance.**

- A representation with nontrivial unipotent monodromy has the same traces as its semisimplification; N is not determined.

**Direct prerequisites.**

- `mathlib:LinearMap.trace`
- `mathlib:Representation`
- `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Proof of IX.7.4, p. 338. FS use this implication; ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces states it for any group, so no LP2 refinement is needed.

<a id="excursionoperatorsandspectralaction-es7-gln-comparison-supercuspidal-agreement"></a>

#### Supercuspidal classical agreement

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`.

For E of characteristic zero (a finite extension of ℚ_p) and π an irreducible supercuspidal Q̄_ℓ-representation of GL_n(E), φ_π ≅ ρ_π, where ρ_π is the irreducible parameter of the independent classical correspondence (ET.6); in particular φ_π ≅ ρ_π^ss. First two-leg-excursion-is-a-trace, applied to the package of two-tower-realisation, identifies the parameter of σ = JL(π) on the basic stratum. Then the π-stratum sheaf is a direct summand of T_std(B) after forgetting the Weil action, and Hecke compatibility of excursion operators transports the same parameter to π.

**Hypotheses.**

- E a finite extension of ℚ_p (characteristic zero); ℓ ≠ p; coefficients Q̄_ℓ.
- π an irreducible supercuspidal smooth representation of GL_n(E) with classical parameter ρ_π (ET.6).

**Construction or proof.**

1. Use trace determination for the basic-stratum parameter.
2. Forget the Weil multiplicity factor, select a nonzero summand and apply Hecke/excursion commutation.

**Acceptance.**

- Selecting π requires forgetting the Weil action; no invariant vector of irreducible ρ_π is presumed.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`](#excursionoperatorsandspectralaction-es7-gln-comparison-two-tower-realisation)
- [`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`](#excursionoperatorsandspectralaction-es7-gln-comparison-two-leg-excursion-is-a-trace)
- [`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`](#excursionoperatorsandspectralaction-es7-gln-comparison-trace-determines-semisimplification)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- `HeckeStacksAndLocalShtukas:HS3`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `VStackSheavesAndLisseCategories:VS4`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Proof of IX.7.4, p. 338. The direct-summand argument follows the scalar computation.

<a id="excursionoperatorsandspectralaction-es7-gln-comparison-all-irreducible-representations"></a>

#### Classical agreement for every irreducible

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`. Planet: **Classical GLn agreement**.

For E of characteristic zero and every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter φ_π equals the semisimplification of the Weil part of its classical Weil–Deligne parameter (ET.6). Write π as a subquotient of the normalized parabolic induction of a supercuspidal representation of a Levi (supercuspidal support); normalised-induction-dictionary computes φ_π from the supercuspidal factors with the ordinary Levi inclusion, and the classical correspondence satisfies the same segment/direct-sum rule. This is agreement of the semisimple Weil parameter; it does not identify the nilpotent monodromy operator.

**Hypotheses.**

- E a finite extension of ℚ_p (characteristic zero); ℓ ≠ p; coefficients Q̄_ℓ.
- π any irreducible smooth Q̄_ℓ-representation of GL_n(E); classical parameters normalised as in ET.6 (normalized induction, segment rule).

**Construction or proof.**

1. Import the Q̄_ℓ segment and supercuspidal-support statements for GL_n, with normalized induction conventions.
2. Compute the classical semisimple parameter on each segment and its inducing supercuspidal twists.
3. Apply the parabolic theorem to every irreducible subquotient.

**Acceptance.**

- The trivial representation and Steinberg representation have the same semisimple diagonal parameter although their N differ.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`](#excursionoperatorsandspectralaction-es7-gln-comparison-supercuspidal-agreement)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`](#excursionoperatorsandspectralaction-es7-parabolic-normalised-induction-dictionary)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6`
- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`
- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Theorem IX.7.4 and first line of its proof, p. 338. The theorem quantifies over all irreducibles; the proof reduces by IX.7.3.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic"></a>

### ES7:function-field-automorphic. Division-algebra automorphic inputs

Import generic function-field adelic and automorphic definitions and specialize them to central division algebras. Develop maximal-order data, compact quotients and discrete spectrum; the kernel trace and Euler–Poincaré tests feed a selected simple trace comparison. Selected globalization and transfer, with the local character identity and cuspidal selector, supply exactly the automorphic input used by the D-elliptic realization. No general invariant trace formula is asserted.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-maximal-orders"></a>

#### Maximal-order data for the division algebra

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`. Planet: **Maximal orders of the division algebra**.

Let X/F_q be smooth projective geometrically connected, F=F_q(X), d≥1 and D/F central simple of dimension d². The order data impose no split-place condition; D-elliptic consumers additionally choose a rational place ∞ at which D is split. Fix a coherent locally free O_X-algebra 𝒟 of generic fibre D with 𝒟_x a maximal O_x-order in D_x at every closed place x. Maximal means maximal by inclusion among O_x-orders (finite O_x-lattices containing 1 and closed under multiplication); no canonical choice at split places is asserted. Let R={x:D_x is nonsplit}. At x∉R choose (D_x,𝒟_x)≅(M_d(F_x),M_d(O_x)).

**Hypotheses.**

- X a smooth projective geometrically connected curve over F_q with function field F; d ≥ 1.
- D a central simple F-algebra of dimension d²; 𝒟 a locally free O_X-algebra with generic fibre D whose completions are maximal orders.

**Construction or proof.**

1. Use the function-field completions from FA.2; fix the order sheaf as part of the data.
2. Obtain compact open 𝒟_x^× from local integral-point topology; identify it with GL_d(O_x) at a split place. General existence of a glued maximal-order sheaf is a recorded refinement.

**Uses determining the interface.**

- **Hausberger Definition 1.1:** Provides the right algebra action on each vector bundle.
- **LRS §§13,15:** Its compact unit groups define unramified levels and Haar normalization.

**API.**

- `DOrder.local` (projection): The completed local order 𝒟_x⊂D_x and its unit group.
- `DOrder.split_equiv` (compatibility): At x∉R the chosen pair is isomorphic to (M_d(F_x),M_d(O_x)).
- `DOrder.change_lattice` (functoriality): A change of split lattice by g conjugates the endomorphism order by g.
- `DOrder.ramification` (data): The finite set R of nonsplit places; a split pole is chosen outside R in the D-elliptic setup.
- `DOrder.units_isCompactOpen` (structure): Each 𝒟_x^× is a compact open subgroup of D_x^×, equal to GL_d(O_x) under the split identification at x ∉ R.

**Unit tests.**

- `DOrder.rank_one_test` (degenerate): For D=F, 𝒟=O_X and every local maximal order is O_x.
- `DOrder.matrix_test` (compatibility): For the standard lattice O_x^d the order is M_d(O_x), whose units are GL_d(O_x).
- `DOrder.integral_nonunit_test` (non-example): diag(π_x,1,…,1) belongs to the split order and is invertible over F_x but is not a unit of that order.

**Acceptance.**

- Changing a split lattice conjugates its maximal order.

**Direct prerequisites.**

- `FunctionFieldArithmetic:FA.2`
- `AdelicAlgebraicGroups:AA.1`
- `ReductiveGroupsPartII:RG2.0`
- `mathlib:AlgebraicGeometry.Scheme`
- `mathlib:Module.Free`
- `mathlib:CommRing`
- `SchemeAndStackFoundations:SF.2/sheaf-algebra`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.3`
- `mathlib:Algebra.IsCentral`
- `mathlib:Submodule.IsLattice`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), §1.1, p. 1291. The standing global order data and the split-place identification are explicitly specified.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-division-quotient-compactness"></a>

#### Compact division-algebra automorphic quotient

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`. Planet: **Compact division-algebra quotient**.

For any central division algebra D/F (including the inner form D̄ ramified at ∞), the diagonal D^×(F) is discrete in the imported adelic group D^×(A_F). The quotient is compact modulo A_F^×. After quotienting by the central subgroup π_∞^ℤ (degree lattice) and fixing the compatible central-character quotient, D^×(F)\D^×(A_F)/π_∞^ℤ is compact. Finite level further gives a compact quotient with finite stabilizers; do not assert finiteness of the whole adelic quotient as a set.

**Hypotheses.**

- X/F_q as above; D a central DIVISION algebra over F (anisotropic PGL₁(D)); ∞ a rational place.
- Adelic topology and degree lattice ϖ_∞^ℤ imported from FA.2/FA.6/AA.1.

**Construction or proof.**

1. Import the diagonal topology, centre and degree quotient from FA.2/FA.6/AA.1.
2. Use anisotropy of PGL₁(D) and function-field reduction to prove compactness modulo centre; the degree-zero idele class group is compact.
3. Keep the central quotient and finite stabilizers in the measure normalization.

**Acceptance.**

- For d=1 this is idele-class compactness after the degree lattice.
- The analogous GL_d quotient for d>1 is not compact modulo centre.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-maximal-orders)
- `FunctionFieldArithmetic:FA.2`
- `FunctionFieldArithmetic:FA.6`
- `AdelicAlgebraicGroups:AA.1`
- `AdelicAlgebraicGroups:AA.0/restricted-haar-product`
- `ReductiveGroupsPartII:RG2.0`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), §13.3, p. 291. LRS assert compactness of D^×\D_𝔸^×/ϖ_∞^ℤ for their division algebra split at ∞; discreteness and the D̄ case are standard facts this node adds.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-discrete-spectrum"></a>

#### Discrete division-algebra spectrum

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`.

For a unitary central character trivial on the chosen degree lattice, the compact quotient’s L²-space decomposes discretely as a Hilbert sum of irreducible admissible automorphic Π with finite multiplicities m(Π). Its smooth K-finite vectors give the algebraic automorphic space; Π=⊗′_vΠ_v with spherical vectors at almost all places. At a fixed compact open finite level the relevant automorphic space is finite dimensional. This is not a claim that infinitely many tower levels form a finite-dimensional representation.

**Hypotheses.**

- D a central division algebra over F = F_q(X); ∞ rational; a unitary central character trivial on ϖ_∞^ℤ.
- Coefficients ℂ (or Q̄_ℓ via a fixed isomorphism, transported by AS.0's algebraic descent).

**Construction or proof.**

1. Apply AS.0 to the compact quotient and admissible smooth action.
2. Use finite-level compactness to get finite-dimensional invariants and finite multiplicities.
3. Apply the restricted-tensor-product factorization with distinguished unramified vectors. Transfer characteristic-zero coefficient fields only with the supplied algebraic descent.

**Acceptance.**

- At fixed K, a finite sum computes traces; summing the entire tower without a convergence statement is invalid.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-division-quotient-compactness)
- `AutomorphicSpectralTheory:AS.0`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `FunctionFieldArithmetic:FA.6`
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), §13.3, p. 291. LRS give the algebraic decomposition with finite multiplicities; the L² Hilbert-sum form and the restricted-tensor-product factorization are this node’s standard additions.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-kernel-trace-identity"></a>

#### Kernel trace formula for the compact quotient

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`. Planet: **Kernel trace formula**.

For a compactly supported locally constant test function f on the central quotient, biinvariant under a compact open K and with compatible Haar measures, convolution has finite rank on the K-invariant automorphic subspace. Its kernel is K_f(x,y)=Σ_{γ∈D^×(F)}f(x^{-1}γy), locally finite. Integrating the diagonal gives Σ_Πm(Π)trΠ(f)=Σ_[γ]vol(D_γ^×(F)\D_γ^×(A)/π_∞^ℤ)O_γ(f), with all quotient measures fixed. Absolute integrability follows from compactness and local finiteness after passing to K; no unproved interchange of an infinite unbounded tower sum is used.

**Hypotheses.**

- D a central division algebra over F; f locally constant, compactly supported modulo ϖ_∞^ℤ and bi-invariant under a compact open K.
- Haar measures on D^×(A), on centralizers and on ϖ_∞^ℤ fixed compatibly (AA.0).

**Construction or proof.**

1. Construct the locally finite kernel on a finite compact-open cover.
2. Compute its finite-rank diagonal trace and unfold the integral by rational conjugacy classes.
3. Disintegrate using compatible centralizer Haar measures.

**Acceptance.**

- Rescaling a Haar measure rescales its convolution function inversely.
- The identity term contributes the quotient volume times f(1).

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-division-quotient-compactness)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-discrete-spectrum)
- `AdelicAlgebraicGroups:AA.0/restricted-haar-product`
- `SmoothRepresentationsOfLocalGroups:SR.1`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), §13.5, p. 291. LRS derive display (13.5) by integrating the kernel over the diagonal; the local finiteness and integrability argument is this node’s own.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-function"></a>

#### Weakly cuspidal Euler–Poincaré function

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`. Planet: **Euler–Poincaré function**.

At the split rational place ∞ identify D_∞^× with GL_d(F_∞). For simple roots Δ, I⊂Δ, facet normalizer P_I, compact parahoric P_I⁰ and orientation character χ_I extended by zero, define f_∞=Σ_{I⊂Δ} (−1)^{|Δ\I|}χ_I/((|Δ\I|+1)vol(P_I⁰)). It descends to PGL_d(F_∞) and is compactly supported there. It is a finite alternating sum of oriented facet-normalizer functions, not an arbitrary cusp projector.

**Hypotheses.**

- F_∞ a local field of characteristic p (completion at the rational place ∞); G = GL_d(F_∞) with its Bruhat–Tits building; d ≥ 1.
- A Haar measure on G/F_∞^× fixing the volumes vol(P_I⁰).

**Construction or proof.**

1. Import the building facets and their parahoric/normalizer actions.
2. Take each orientation sign extended by zero and sum with the stated denominator.
3. Check central invariance and compact support modulo centre.

**Uses determining the interface.**

- **LRS Theorem 13.2:** Its orbital integrals transfer to the division inner form at ∞.
- **LRS Lemma 15.10:** Its character trace forces the Steinberg component in a cuspidal globalization.

**API.**

- `EulerPoincareFunction` (constructor): The finite facet sum with the specified coefficients and Haar normalization.
- `EulerPoincareFunction.central` (compatibility): Translation by F_∞^× leaves f_∞ unchanged.
- `EulerPoincareFunction.haar_rescale` (functoriality): Replacing dh by a·dh replaces f_∞ by a^{-1}f_∞.
- `EulerPoincareFunction.support` (characterisation): The support modulo centre is contained in the finite union of facet normalizers.

**Unit tests.**

- `EulerPoincareFunction.rank_one_test` (degenerate): For d=1 the building is a point and the resulting function is the normalized constant on GL₁(F_∞)/F_∞^×.
- `EulerPoincareFunction.haar_test` (computation): Doubling the Haar measure halves the EP function and leaves its integrated character trace unchanged.
- `EulerPoincareFunction.orientation_test` (non-example): In the GL₂ tree, a facet-normalizer element interchanging an edge’s two vertices has orientation sign −1, not +1.

**Acceptance.**

- An orientation sign is needed when a normalizer permutes vertices.

**Direct prerequisites.**

- `ReductiveGroupsPartII:RG2.2`
- `ReductiveGroupsPartII:RG2.3`
- `SmoothRepresentationsOfLocalGroups:SR.1`
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-maximal-orders)
- `mathlib:MeasureTheory.Measure.haar`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), §13.1, p. 290. This character and the displayed facet sum define the EP function; the normalizer is distinguished from the pointwise stabilizer.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-orbital-integrals"></a>

#### Euler–Poincaré orbital identities

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`.

For nonelliptic regular elements γ of GL_d(F_∞), O_γ(f_∞)=0. For elliptic regular γ matching γ̄ in the division inner form D̄_∞^×, let f̄_∞=1/vol(D̄_∞^×/π_∞^ℤ). With transferred centralizer measures, O_γ(f_∞)=ε_∞(γ̄)O_γ̄(f̄_∞). The equality uses the Kottwitz sign and matched quotient measures.

**Hypotheses.**

- F_∞ local, G = GL_d(F_∞); D̄_∞ the central division algebra of invariant 1/d over F_∞ (the inner form at ∞).
- γ regular semisimple; Haar measures on centralizers transferred between G and D̄_∞^×.

**Construction or proof.**

1. Apply the building Euler-characteristic orbital calculation, tracking facet orientations.
2. Use the division inner-form centralizer and the transferred Haar measures.

**Acceptance.**

- A split regular nonelliptic element has zero orbital integral.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-function)
- `ReductiveGroupsPartII:RG2.2`
- `mathlib:MeasureTheory.Measure.haar`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), Theorem 13.2(i), p. 290. The theorem gives vanishing on nonelliptic elements and the elliptic inner-form equality.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-character-traces"></a>

#### Euler–Poincaré character identities

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`.

For a unitary irreducible representation of GL_d(F_∞)/π_∞^ℤ, trπ(f_∞)=0 except for the trivial representation (trace 1) and Steinberg (trace (−1)^{d−1}). Nontrivial central character on F_∞^×/π_∞^ℤ gives trace zero because f_∞ is centrally invariant. The characteristic-p application uses the proof identified in LRS 13.2(ii), whose cited blanket characteristic-zero hypothesis is not used in that proof.

**Hypotheses.**

- F_∞ local of characteristic p; π an irreducible unitary representation of GL_d(F_∞) trivial on ϖ_∞^ℤ.

**Construction or proof.**

1. Use the building resolution and the character/Euler characteristic calculation.
2. Reduce from the degree-lattice quotient to the full-centre quotient using central invariance.

**Acceptance.**

- For d=2 the Steinberg trace is −1.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-function)
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `ReductiveGroupsPartII:RG2.2`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), Theorem 13.2(ii), p. 290. Theorem 13.2(ii) gives the two exceptional traces; its proof cites Kottwitz [Kot 2, Theorem 2′], noting in one sentence that the characteristic-zero assumption there is not used.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-simple-trace-comparison"></a>

#### Simple trace comparison in the selected range

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`. Planet: **Simple trace comparison**.

Compare the compact D trace formula with GL_d’s simple cuspidal trace formula for factorizable tests with a supercuspidal selector at an auxiliary split place, an elliptic-regular support condition at a further place, EP at ∞ and matching local functions at the ramified places. The elliptic orbital sides agree with the local transfer signs; the supercuspidal place kills the proper-parabolic terms. This selected identity isolates the prescribed global constituents. It does not construct a general invariant trace formula or arbitrary global Jacquet–Langlands correspondence.

**Hypotheses.**

- D, F as above; a supercuspidal selector at an auxiliary split place, an elliptic-regular support condition at a further place, the EP function at ∞.
- Matching local test functions at the ramified places (local-character-identity); fixed compatible central character.

**Construction or proof.**

1. Build matched factorizable tests with the fixed central character.
2. Use the cusp selector and elliptic support to restrict the GL_d geometric side.
3. Compare elliptic orbital integrals and spectral character traces. The precise Deligne–Kazhdan/Henniart source expansion is recorded as an open gap.

**Acceptance.**

- Removing the auxiliary supercuspidal selector does not preserve the stated comparison.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-kernel-trace-identity)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-orbital-integrals)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-character-traces)
- `FunctionFieldArithmetic:FA.6`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-local-character-identity)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-cuspidal-local-selector)

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), Proof of Lemma 15.10, p. 315. Lemma 15.10 uses only the Deligne–Kazhdan simple trace formula for GL_d with these test functions; the comparison with D^× is quoted in 15.11 from Henniart [He 1, A.4], recorded as ES7/gap/simple-transfer.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-globalisation"></a>

#### Globalization with prescribed cuspidal places

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`. Planet: **Cuspidal globalization**.

Let x₀=o and x₁=o′ be distinct finite places, ∞ rational, and π a supercuspidal representation of GL_d(F_o) with finite-order central character. Choose x₂ outside {o,o′,∞}. There is a cuspidal automorphic Π̃ with Π̃_o=π, Π̃_∞=St, and Π̃_{o′},Π̃_{x₂} supercuspidal, for compatible chosen central character. A further auxiliary place x₃ supports an elliptic-regular test. These are the selected globalizations of LRS 15.10; no general globalization of arbitrary essentially square-integrable data is needed for this packet.

**Hypotheses.**

- F = F_q(X); distinct places o, o′, x₂ and a rational ∞ outside {o, o′, x₂}.
- π an irreducible supercuspidal representation of GL_d(F_o) whose central character has finite order.

**Construction or proof.**

1. Choose matrix-coefficient/pseudo-coefficient selectors at o,o′,x₂ with nonzero value at 1, and EP at ∞.
2. Use the local elliptic germ argument and weak approximation to choose an elliptic rational conjugacy class.
3. Choose support at x₃ and remaining levels so one geometric term survives; spectral nonvanishing produces Π̃.

**Acceptance.**

- The Steinberg component follows after excluding the trivial ∞ component by global cuspidality.
- The central character is compatible globally; it is not assigned independently at every place.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-simple-trace-comparison)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-character-traces)
- `FunctionFieldArithmetic:FA.6`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-cuspidal-local-selector)

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), Lemma 15.10 and proof, pp. 314–316. Nonvanishing of both sides of the simple trace formula yields the selected globalization.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-jacquet-langlands-transfer"></a>

#### Selected global inner-form transfer

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`.

For D with invariants +1/d at o, −1/d at o′ and zero elsewhere, the globalization above transfers to a unique automorphic Π of D^×(A) with Π_v=Π̃_v at split places and Π_v=JL(Π̃_v) at o,o′, of multiplicity one. The broader quoted sufficient condition (Hausberger 10.4(2)) is: Π̃ essentially square-integrable at every ramified place and supercuspidal at some auxiliary place v OUTSIDE S, where S is a finite set of places outside which D is split (S ⊇ Ram(D)). Only the selected proven transfer image is consumed by local cohomology.

**Hypotheses.**

- D with invariants 1/d at o, −1/d at o′ and 0 elsewhere (split at ∞).
- Π̃ the selected globalization: essentially square-integrable at o, o′, Steinberg at ∞, supercuspidal at a place x₂ outside the ramified set.

**Construction or proof.**

1. Apply the selected simple comparison and the local elliptic character identity.
2. Use the independent strong multiplicity-one/transfer input in Henniart A.4 as quoted by LRS 15.11.
3. Retain the outside-S auxiliary supercuspidal component and all central-character conditions.

**Acceptance.**

- Being supercuspidal only at a ramified place does not meet the stated auxiliary hypothesis.
- Multiplicity one is asserted only for this transfer image.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-globalisation)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-simple-trace-comparison)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-local-character-identity)
- `FunctionFieldArithmetic:FA.6`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Lemmas 10.2–10.3 and Theorem 10.4(2), p. 1340. Theorem 10.4(2) (the printed condition reads “v ∉ S”; the text layer renders ∉ as ∈) puts the auxiliary cuspidal place outside S, a finite set outside which D splits; Lemma 10.3 adds Π_v ≃ JL(Π̃_v) at o, o′.
- [LRS-1993 (ES7)](#source-es7-lrs-1993), Lemma 15.11, p. 316. Lemma 15.11 (quoted from [He 1, A.4]) gives the unique D^×-representation with the same components away from x₀, x₁ and multiplicity one. LRS write Π for the GL_d representation and Π̃ for the D^× one; this packet uses the opposite letters.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-local-character-identity"></a>

#### Equal-characteristic local transfer identity

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`.

For a supercuspidal π of GL_d(K) and JL(π) on the division algebra of invariant 1/d, matching regular elliptic g and h with the same characteristic polynomial satisfy Θ_π(g)=(−1)^{d−1}Θ_{JL(π)}(h). The local JL input is independent of the global Galois construction; use the equal-characteristic local character/transfer theorem as quoted in Hausberger 9.1. Match Haar measures when converting the character identity to test-function/orbital identities. This is the required local identity, not a general nonelliptic transfer formula.

**Hypotheses.**

- K a nonarchimedean local field (any characteristic); D_K the division algebra of invariant 1/d; π supercuspidal of GL_d(K) with JL(π) its local Jacquet–Langlands transfer.
- g ∈ GL_d(K), h ∈ D_K^× regular elliptic with the same characteristic polynomial.

**Construction or proof.**

1. Import the local character distribution machinery.
2. Apply the equal-characteristic local transfer theorem (Badulescu), with the elliptic matching and sign.
3. Use compatible Haar normalizations for the global simple-trace tests.

**Acceptance.**

- For d=2 the elliptic character sign is −1.
- No number-field global trace theorem is invoked.

**Direct prerequisites.**

- `SmoothRepresentationsOfLocalGroups:SR.3`
- `ReductiveGroupsPartII:RG2.0`
- `mathlib:MeasureTheory.Measure.haar`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Theorem 9.1, pp. 1333–1334. The local Jacquet–Langlands theorem and its character relation precede the independent LLC statement.

<a id="excursionoperatorsandspectralaction-es7-function-field-automorphic-cuspidal-local-selector"></a>

#### Local supercuspidal selectors

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`.

For a supercuspidal irreducible characteristic-zero GL_d(K) representation π with fixed unitary central character and a compact open K₀ fixing a nonzero vector, form a matrix-coefficient Hecke test f_π (compactly supported modulo the centre for the fixed central character; LRS print 𝒞_c^∞) acting as π(1_{K₀}) on π and as 0 on every other irreducible admissible representation, so trπ(f_π) = dim π^{K₀} ≠ 0 and f_π(1) ≠ 0. Average on both sides over K₀ to make a finite-level selector without changing these nonvanishing properties. The LRS 15.10 construction uses the GL_d × GL_d-equivariant matrix-coefficient map φ : End(V)^∞ → 𝒞_c^∞, φ(A)(g) = tr(π(g^{-1})A), with π∘φ = c ≠ 0, and sets f=c^{-1}φ(π(1_{K₀})); it is not an indicator of K₀.

**Hypotheses.**

- K a nonarchimedean local field; π an irreducible supercuspidal representation of GL_d(K) with unitary central character; K₀ a compact open subgroup with π^{K₀} ≠ 0.

**Construction or proof.**

1. Use compact-mod-centre matrix coefficients and the local Schur-orthogonality normalization.
2. Project to K₀-fixed vectors and scale by the nonzero intertwining scalar.
3. Use the central-character quotient and support to insert the selector in the simple trace formula.

**Uses determining the interface.**

- **LRS Lemma 15.10:** Selectors at three prescribed places force the desired local components.
- **Hausberger Theorem 10.4(2):** The auxiliary split supercuspidal component is retained for transfer.

**API.**

- `CuspidalSelector` (constructor): The normalized bi-K₀-invariant central-character test.
- `CuspidalSelector.value_one` (characterisation): f_π(1)=c^{-1}dimπ^{K₀}≠0 in the source normalization.
- `CuspidalSelector.trace` (compatibility): trπ(f_π) is nonzero, and incompatible supercuspidal traces vanish.
- `CuspidalSelector.support` (data): Its support is compact modulo the centre.

**Unit tests.**

- `CuspidalSelector.value_test` (computation): For dimπ^{K₀}=1 and normalization c=1, f_π(1)=1.
- `CuspidalSelector.central_test` (compatibility): Its central translation law is the inverse of the fixed central character in the convolution convention.
- `CuspidalSelector.indicator_test` (non-example): The characteristic function of K₀ acts on every representation with K₀-invariants, whereas f_π kills incompatible supercuspidals.

**Acceptance.**

- The chosen representation is selected with a nonzero trace.

**Direct prerequisites.**

- `SmoothRepresentationsOfLocalGroups:SR.1`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `mathlib:MeasureTheory.Measure.haar`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), Proof of Lemma 15.10, pp. 314–315. LRS build f from the matrix-coefficient map φ(A)(g) = tr(π(g^{-1})A) [Be-Ze 1, 2.4.2]; f acts by π(1_K) on π and by 0 on every other irreducible admissible representation, and f(1) = c^{-1} dim π^K ≠ 0.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic"></a>

### ES7:equal-characteristic. D-elliptic geometry and the equal-characteristic comparison

Build D-elliptic sheaves, levels, moduli and correspondences, followed by special formal modules, uniformization and the fundamental local representation. Geometric and automorphic traces and the dual-isotypic pairing use Kaiser’s corrected LRS formulas. The selected transfer-image cohomology, geometric Hochschild–Serre sequence and cuspidal degeneration prove the Drinfeld–Carayol realization. Its Hecke-fibre transport then supplies the equal-characteristic input to the shared two-leg trace theorem and gives the separate agreement conclusion.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-d-elliptic-sheaf"></a>

#### D-elliptic sheaves

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`. Planet: **D-elliptic sheaves**.

With the global order data, D split at a chosen rational ∞, and R the ramification set, a normalized D-elliptic sheaf over S/F_q is a chain of right 𝒟-modules E_i on X×S, locally free of O-rank d², with injections j_i:E_i→E_{i+1} and t_i:τE_i→E_{i+1}, τ=(id_X×Frob_S)^*. The squares commute, E_{i+d}=E_i(∞×S) with the d-fold j map the canonical inclusion, E_i/j_{i−1}E_{i−1}=(Γ_∞)_*A_i and E_i/t_{i−1}(τE_{i−1})=(Γ_z)_*B_i with A_i,B_i locally free of rank d, and z:S→X ∖ ({∞}∪R). Require 0≤χ(E_0|X×s)<d. Morphisms are D-linear chain isomorphisms commuting with j,t. This normalization is equivalent to the unnormalized stack modulo index shift.

**Hypotheses.**

- X/F_q smooth projective geometrically connected; D central simple over F = F_q(X) of dimension d² (Hausberger §1.1; D = M_d(F) is allowed), split at a rational place ∞; R the ramification set; 𝒟 a maximal order sheaf.
- S an F_q-scheme; τ = (id_X × Frob_S)^*.

**Construction or proof.**

1. Use the imported coherent vector-bundle and curve sheaf categories; add the right 𝒟 action and the periodic commuting chain.
2. Impose the pole/zero cokernel conditions and normalized Euler characteristic.
3. For D=M_d(F) use Morita equivalence to the DM.7 elliptic-sheaf construction; do not rebuild its matrix case.

**Uses determining the interface.**

- **LRS §§4–6:** The chain defines the moduli functor and its smooth/projective structure.
- **Hausberger §2.2:** Completing at o gives the local divisible/formal module.

**API.**

- `DEllipticSheaf` (constructor): The periodic chain with the specified j,t maps and cokernels.
- `DEllipticSheaf.zero` (projection): The zero morphism z:S→X ∖ ({∞}∪R).
- `DEllipticSheaf.period` (simp): E_{i+d}=E_i(∞×S), compatibly with j and t.
- `DEllipticSheaf.ext` (extensionality): A chain isomorphism commuting with j,t is exactly an isomorphism of D-elliptic sheaves.
- `DEllipticSheaf.pullback` (functoriality): Pullback along S′→S commutes with τ, j,t, zero and the periodicity data.
- `DEllipticSheaf.matrix_case` (equivalence): Morita equivalence identifies D=M_d(F) with rank-d Drinfeld elliptic sheaves of DM.7.

**Unit tests.**

- `DEllipticSheaf.rank_test` (computation): For d=2 each E_i has O-rank 4, while the pole and zero cokernels have rank 2 on S.
- `DEllipticSheaf.frobenius_test` (non-example): Over S=Spec F_{q²}, τ twists the S coefficients by q-Frobenius and leaves the curve X fixed.
- `DEllipticSheaf.matrix_test` (compatibility): For D=M_d(F), the idempotent Morita functor gives DM.7’s rank-d elliptic sheaf, including j,t and its zero.

**Acceptance.**

- The zero avoids R and ∞.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-maximal-orders)
- `AlgebraicModuliForArithmeticGeometry:R09.4`
- `DrinfeldModulesAndTModules:DM.7`
- `mathlib:AlgebraicGeometry.Scheme`
- `mathlib:Module.Free`
- `mathlib:CategoryTheory.Functor`
- `SchemeAndStackFoundations:SF.2/sheaf-algebra`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.3`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Definition 1.1, pp. 1292–1293. The Frobenius is on the base S, and the diagram has t from τE_{i−1} to E_i.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-level-structure"></a>

#### Level structures on D-elliptic sheaves

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`.

For a nonempty finite closed subscheme I⊂X\{∞} disjoint from z(S), the restrictions E_i|I×S identify via j and are denoted E_I. A level-I structure is a right 𝒟_I-linear trivialization ι:𝒟_I⊗O_S≅E_I satisfying t∘τι=ι under the canonical Frobenius identification of the trivial module. Level restriction for I′⊃I is reduction modulo I.

**Hypotheses.**

- A D-elliptic sheaf over S with zero z; I ⊂ X ∖ {∞} a nonempty finite closed subscheme with I ∩ z(S) = ∅.

**Construction or proof.**

1. Use that both pole and zero are disjoint from I to identify all E_i|I.
2. Impose Frobenius compatibility on the right-module trivialization and verify base change/restriction.

**Uses determining the interface.**

- **Hausberger Theorem 6.1:** Nonempty level removes the automorphism obstruction to scheme representability.
- **Hausberger Theorem 8.3:** Level at o becomes a Drinfeld-cover level.

**API.**

- `DEllipticLevel` (constructor): A D_I-linear trivialization satisfying t∘τι=ι.
- `DEllipticLevel.restrict` (functoriality): Reduction along I⊂I′ gives the smaller level, with identity and composition laws.
- `DEllipticLevel.pullback` (functoriality): Base change on S transports the trivialization and the Frobenius square.
- `DEllipticLevel.unitAction` (structure): The finite group 𝒟_I^× = (𝒟 ⊗ O_I)^× acts on level-I structures by ι ↦ ι ∘ (right multiplication by g); its elements are τ-fixed, so t∘τι = ι is preserved (a general unit of 𝒟_I ⊗ O_S is not), and forgetting the level is a torsor under this group.

**Unit tests.**

- `DEllipticLevel.frobenius_test` (characterisation): In rank one over a field, replacing a compatible trivialization by a scalar a preserves compatibility exactly when a^q=a.
- `DEllipticLevel.nested_test` (compatibility): For I⊂I′⊂I″, restricting from I″ to I agrees with the two successive restrictions.
- `DEllipticLevel.zero_test` (non-example): If the zero meets I the t map need not be invertible on I, so the level functor’s stated domain excludes that case.

**Acceptance.**

- A plain bundle trivialization without the t condition is insufficient.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`](#excursionoperatorsandspectralaction-es7-equal-characteristic-d-elliptic-sheaf)
- `AlgebraicModuliForArithmeticGeometry:R09.4`
- `mathlib:CategoryTheory.Functor`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), §1.3, p. 1293. The Frobenius-compatible trivialization is defined there.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-moduli-and-hecke"></a>

#### D-elliptic level moduli

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`. Planet: **D-elliptic level moduli**.

For a nonempty level I, normalized D-elliptic sheaves with level are represented by E_{X,D,I} over U=X ∖ ({∞}∪I∪R), smooth of pure relative dimension d−1 and quasi-projective. If D is division the morphism is projective. The normalization equals LRS’s quotient by the index-shift ℤ. At the distinguished ramified o, for levels disjoint from o, special D-elliptic sheaves (Hausberger §6.2) are represented by Hausberger 6.4’s projective extension over U∪{o}, not smooth at o; levels including o are used only on the generic fibre. The proof uses the chain bundle moduli and the one-step Hecke diagram with Frobenius intersection.

**Hypotheses.**

- D central simple over F, split at ∞ (division for projectivity); I a nonempty level; U = X ∖ ({∞} ∪ I ∪ R).

**Construction or proof.**

1. Use the R09 moduli and quotient machinery for the chain data.
2. Apply the smooth Hecke map and Frobenius-transversality to prove relative dimension d−1.
3. Apply boundedness and the division-algebra properness argument; construct the special extension at o with the stated level exclusion.

**Uses determining the interface.**

- **Hausberger Theorem 8.1:** The away-o extension has the formal completion used for uniformization.
- **LRS §14:** Smooth proper generic fibres provide finite-level cohomology and purity.

**API.**

- `DEllipticModuli` (constructor): The representing level scheme over U.
- `DEllipticModuli.points` (universal-property): For S/U its S-points are level D-elliptic sheaves, functorially in S.
- `DEllipticModuli.level_map` (functoriality): Nested levels give the forgetful morphism with identity/composition laws.
- `DEllipticModuli.dimension` (characterisation): The zero morphism is smooth of relative dimension d−1.
- `DEllipticModuli.projective` (compatibility): For division D it is projective; the distinguished-place extension requires I∩{o}=∅.

**Unit tests.**

- `DEllipticModuli.rank_one_test` (degenerate): At d=1 the zero morphism is smooth of relative dimension 0.
- `DEllipticModuli.shift_test` (compatibility): Choosing χ(E_0) in [0,d) gives the same moduli as dividing the unnormalized chain stack by index shift.
- `DEllipticModuli.level_at_o_test` (non-example): A level including o is not assigned the formal extension asserted for levels away from o.

**Acceptance.**

- For d=1 the smooth relative dimension is zero.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`](#excursionoperatorsandspectralaction-es7-equal-characteristic-d-elliptic-sheaf)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`](#excursionoperatorsandspectralaction-es7-equal-characteristic-level-structure)
- `AlgebraicModuliForArithmeticGeometry:R09.2`
- `AlgebraicModuliForArithmeticGeometry:R09.5`
- `AlgebraicModuliForArithmeticGeometry:R09.6`
- `mathlib:AlgebraicGeometry.Scheme`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Theorem 6.1, proof and Theorem 6.4, pp. 1311–1313. The moduli theorem and the division/projective extension hypotheses are explicit.
- [LRS-1993 (ES7)](#source-es7-lrs-1993), Theorems 4.1, 5.1, 6.1 and Corollary 6.2, pp. 236, 241, 246. Theorem 4.1 (smooth DM stack of relative dimension d − 1), Theorem 5.1 (quasi-projective for I ≠ ∅) and Theorem 6.1 (properness for D division); projectivity with Corollary 6.2.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-frobenius-hecke-correspondences"></a>

#### Frobenius and Hecke correspondences

**Construction.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`.

On the moduli tower the right action of D^×(A_F^∞) is represented by finite-level Hecke correspondences between suitable refinements of levels, not by automorphisms at a fixed arbitrary level. For a good place x and fixed level, geometric Frobenius and the spherical Hecke correspondence commute. The induced left action on cohomology uses pullback/pushforward and the inverse of the right-action convention.

**Hypotheses.**

- Levels I with the D-elliptic moduli E_I; g ∈ D^×(A^∞); x a place of good reduction for the given level.

**Construction or proof.**

1. Choose common refined level on which a given adelic element defines the correspondence.
2. Use EDC.8 composition and trace maps and verify independence of the refinement.
3. Track the inversion from right geometric action to left cohomology action.

**Uses determining the interface.**

- **LRS Theorem 13.6:** Hecke/Frobenius traces enter the geometric trace identity.
- **Hausberger Corollary 10.7:** The spectral sequence must commute with all level and Hecke actions.

**API.**

- `DEllipticHecke` (constructor): The finite correspondence at refined levels associated to g∈D^×(A^∞).
- `DEllipticHecke.mul` (compatibility): Composition on the tower is the right group action law; cohomology receives the corresponding left action.
- `DEllipticHecke.frobenius` (compatibility): At good places the Hecke action commutes with geometric Frobenius.
- `DEllipticHecke.level` (functoriality): Transition maps of levels commute with the correspondences.

**Unit tests.**

- `DEllipticHecke.identity_test` (degenerate): The element 1 gives the identity correspondence at every level.
- `DEllipticHecke.level_test` (characterisation): An element that does not normalize K_I is a correspondence through a refined level, not an automorphism of E_I.
- `DEllipticHecke.right_left_test` (compatibility): The product law of the induced left cohomology action agrees with the inversion convention for the right action.

**Acceptance.**

- The spherical Hecke normalization at a good place matches LRS 14.9.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`](#excursionoperatorsandspectralaction-es7-equal-characteristic-moduli-and-hecke)
- `AdelicAlgebraicGroups:AA.1`
- `SmoothRepresentationsOfLocalGroups:SR.1`
- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`
- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), §6.3, pp. 1315–1316 (right action and Hecke correspondences); §10.1, p. 1338 (induced left action on cohomology). The source converts the right tower action to a commuting left cohomology action.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-module"></a>

#### Special formal O_D-modules

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`. Planet: **Special formal modules**.

Let K=F_q((t)), O=O_K, D_K/K division of invariant 1/d, O_D its maximal order and O_d the integers of the unramified degree-d subfield. Over an O-algebra B on which a power of the uniformizer vanishes, a special formal O_D-module is a smooth formal O-module H with compatible O_D-action for which Lie H is an invertible O_d⊗_O B-module. In the height-d² moduli problem it has O-height d² and dimension d. The tangent condition assigns rank one to each unramified embedding; dimension d alone does not imply it.

**Hypotheses.**

- K = F_q((t)) (equal characteristic), O its ring of integers; D_K the division algebra of invariant 1/d with maximal order O_D; O_d the unramified degree-d subring.
- B an O-algebra on which a power of the uniformizer vanishes.

**Construction or proof.**

1. Import formal O-module and coordinate-module machinery, in equal characteristic.
2. Add the maximal-order action and the tangent-line condition.

**Uses determining the interface.**

- **Hausberger Theorems 3.4,7.2:** Defines the fixed isogeny class and its deformation space.
- **Hausberger §8:** The completed D-elliptic sheaf supplies this local moduli problem.

**API.**

- `SpecialFormalODModule` (constructor): Formal O-module, O_D-action and invertible O_d⊗B tangent module.
- `SpecialFormalODModule.lie` (projection): The tangent module with its O_d action.
- `SpecialFormalODModule.baseChange` (functoriality): Base change transports the action and tangent invertibility.
- `SpecialFormalODModule.dimension` (characterisation): On a splitting base each tangent eigenspace has rank 1, so total dimension is d.

**Unit tests.**

- `SpecialFormalODModule.rank_one_test` (degenerate): For d=1 specialness is a one-dimensional formal O-module tangent line.
- `SpecialFormalODModule.eigenspaces_test` (computation): For d=2 on a splitting base the two tangent eigenspaces each have rank one.
- `SpecialFormalODModule.dimension_only_test` (non-example): A two-dimensional tangent module with O₂ acting entirely through one embedding is not special.

**Acceptance.**

- Over a splitting base there are d one-dimensional tangent eigenspaces.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-maximal-orders)
- `AlgebraicModuliForArithmeticGeometry:R09.6`
- `HeckeStacksAndLocalShtukas:HS2`
- `mathlib:CommRing`
- `mathlib:Module.Invertible`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Definition 3.1, p. 1302. Specialness is the invertibility of the tangent module over O_d⊗B.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-modules"></a>

#### Special-module deformation space

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`.

Height-d² special formal O_D-modules over an algebraically closed residue field are O_D-linearly isogenous and End_D⁰(Φ)=M_d(K) for a framing Φ. The functor of pairs (H,ρ), with ρ:Φ→H a height-zero quasi-isogeny modulo the uniformizer, is represented by Ω̂^d⊗̂_OÔ^nr. The GL_d(K) action changes the framing and combines the Drinfeld-space action with Frobenius descent determined by determinant valuation. D_K^× acts on Ω̂^d⊗̂Ô^nr only through g ↦ Frob^{−v(Nrd g)} on Ô^nr (Hausberger Proposition 7.6), so O_D^× acts trivially on the formal scheme; its nontrivial action lives on the Drinfeld covers Σ_n.

**Hypotheses.**

- K = F_q((t)); special formal O_D-modules of O-height d²; residue field algebraically closed (k̄ = F̄_q).

**Construction or proof.**

1. Use equal-characteristic coordinate/Dieudonné-module classification to identify the framing isogeny class.
2. Apply the formal-moduli representability theorem of Drinfeld/Genestier.
3. Match the framing and semilinear Weil actions; exact source proof expansion remains a geometry gap.

**Acceptance.**

- At d=1 Ω has dimension zero.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`](#excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-module)
- `AlgebraicModuliForArithmeticGeometry:R09.6`
- `HeckeStacksAndLocalShtukas:HS2`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Theorems 3.4,7.2,7.4, §§7.2–7.3, pp. 1303,1317–1319. Theorem 7.2 represents the framed deformation functor by Ω̂^d ⊗̂_O Ô^nr; Propositions 7.5–7.6 give the GL_d(K) and D^× actions (D^× only through Frobenius on Ô^nr).

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-uniformisation"></a>

#### D-elliptic uniformization

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`. Planet: **D-elliptic uniformization**.

Take global D with inv_o(D)=1/d, inv_o′(D)=−1/d and inv_∞(D)=0. Let D̄ have inv_o(D̄)=0, inv_∞(D̄)=1/d and the same other invariants. For level I away from ∞,o set Z_I=D̄^×(F)\D̄^×(A^∞)/K_I^{∞,o}, where D̄_o^×≅GL_d(F_o). The formal completion of the extended E_I along o is ((Ω̂^d⊗̂Ô_o^nr)×Z_I)/GL_d(F_o). At level n at o, the generic analytic fibre is (Σ_n^d×Z_{I^o})/GL_d(F_o), with Weil descent; Theorem 8.3 phrases the covers over F_o by restriction of scalars, and §§9.2, 10 use Res′ (the ℤ-indexed coproduct) for their cohomology. These identifications commute with level restriction, the away-o Hecke action and D_o^×; no formal model with o-level is asserted by 8.1.

**Hypotheses.**

- D with inv_o(D) = 1/d, inv_o′(D) = −1/d, split elsewhere; D̄ with inv_o(D̄) = 0, inv_∞(D̄) = 1/d and the other invariants of D.
- Level I away from ∞ and o; for the generic-fibre statement, additional Drinfeld level n at o.

**Construction or proof.**

1. Complete the D-elliptic sheaf at o and separate its special formal module from the global isogeny data.
2. Identify the global isogeny class with the D̄ double-coset space and the local deformation with Ω̂.
3. Quotient by GL_d(F_o), add generic cover levels, and check all descent and Hecke actions.

**Acceptance.**

- D and D̄ are split at different places.
- The quotient factor has D̄ in it; replacing it by D changes the theorem.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`](#excursionoperatorsandspectralaction-es7-equal-characteristic-moduli-and-hecke)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`](#excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-modules)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-maximal-orders)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`](#excursionoperatorsandspectralaction-es7-equal-characteristic-frobenius-hecke-correspondences)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-division-quotient-compactness)
- `HeckeStacksAndLocalShtukas:HS2`
- `AlgebraicModuliForArithmeticGeometry:R09.6`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), §8.1 (pp. 1319–1321; D̄ defined p. 1319), Theorem 8.1 (p. 1321), Theorem 8.3 (p. 1323). The formal statement uses D̄ and away-o level; Theorem 8.3 adds Drinfeld covers on generic fibres.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-fundamental-local-representation"></a>

#### Fundamental local representation

**Definition.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`. Planet: **Fundamental local representation**.

For ℓ≠p and the equal-characteristic Drinfeld covers, Res′Σ_n^d=⊔_{r∈ℤ}Σ_n^d⊗_{K̂^nr,ϕ_q^r}K̂^nr with its Weil descent; it is not the ordinary restriction of scalars along the infinite unramified extension. Put U_d^i=colim_nH_c^i((Res′Σ_n^d)_K̄,Q̄_ℓ); the fundamental representation is degree i=d−1. It has commuting GL_d(K), D_K^× and W_K actions. The stabilizer of a component is P_d={(g,b,w):det(g)Nrd(b)Cl(w)^{-1}∈O_K^×}, with Cl(geometric Frobenius)=uniformizer, and U_d^i=c-Ind_{P_d}^{GL_d(K)×D_K^××W_K}colim_nH_c^i(Σ_n^d). For finite-order ξ, U_d^i(ξ) is the largest quotient with central action ξ.

**Hypotheses.**

- K = F_q((t)); ℓ ≠ p; Σ_n^d the Drinfeld covers of level n of the Drinfeld upper half space Ω^d over K̂^nr.
- ξ : K^× → Q̄_ℓ^× a character of finite order (for the central quotient).

**Construction or proof.**

1. Use the ℤ-indexed components and geometric reciprocity to define the three commuting actions.
2. Take compact-support cohomology and the colimit over cover levels.
3. Compact support gives compact induction from the component stabilizer, with all three valuation terms.

**Uses determining the interface.**

- **Hausberger Theorem 9.5:** Its supercuspidal isotypic quotient realizes JL and the Weil parameter.
- **Hausberger Proposition 10.6:** Its finite-level cohomology is the source of the quotient spectral sequence.

**API.**

- `FundamentalLocalRepresentation` (constructor): The level colimit of compact-support cohomology of Res′Σ in degree i.
- `FundamentalLocalRepresentation.threeActions` (structure): Commuting GL_d(K), D_K^× and continuous Weil actions on compact-open invariants.
- `FundamentalLocalRepresentation.compactInduction` (equivalence): The induction from P_d identifies the component-colimit description with U_d^i.
- `FundamentalLocalRepresentation.centralQuotient` (constructor): For finite-order ξ the maximal quotient on which the GL_d centre acts by ξ.
- `FundamentalLocalRepresentation.level` (functoriality): Finite-level pullback maps define the direct system and commute with the three actions.

**Unit tests.**

- `FundamentalLocalRepresentation.degree_test` (computation): For d=2 the fundamental representation has degree 1.
- `FundamentalLocalRepresentation.stabilizer_test` (non-example): A g with v(det g)=1 does stabilize a component together with w satisfying v(Cl(w))=1 and b=1; determinant valuation alone is not the stabilizer condition.
- `FundamentalLocalRepresentation.coproduct_test` (characterisation): A class with compact support in Res′ has finite component support; all ℤ-indexed components are present, rather than a product or all unramified Galois automorphisms.

**Acceptance.**

- The middle degree is d−1.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`](#excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-modules)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`](#excursionoperatorsandspectralaction-es7-equal-characteristic-uniformisation)
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `mathlib:Representation`
- `mathlib:DirectSum`
- `mathlib:MonoidHom`
- `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`
- `mathlib:Representation.ind`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), §§9.2–9.3, Definition 9.3, pp. 1335–1337. The ordinary infinite restriction is rejected, and Res′ is explicitly the ℤ-indexed coproduct with the triple-action stabilizer.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-local-cohomology-finiteness"></a>

#### Local cohomology finiteness and continuity

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`.

For 0≤j≤2(d−1), finite cover level n gives smooth GL_d(K)×D_K^× action on H_c^j((Res′Σ_n^d)_K̄,Q̄_ℓ), of finite type as a GL_d(K)-module, with continuous Weil action on compact-open invariants. The claim that the full tower quotient U_d^i(ξ) is GL_d(K)-admissible is an additional Boyer/Faltings input in Hausberger 9.4; it is not needed in the proof of the supercuspidal identity and is not deduced from finite type.

**Hypotheses.**

- K = F_q((t)); ℓ ≠ p; finite cover level n; 0 ≤ j ≤ 2(d − 1).

**Construction or proof.**

1. Use Berkovich finiteness and the locally finite covering by translates of compact analytic domains.
2. Check stabilizers and compatible descent to obtain smoothness and continuity.

**Acceptance.**

- Finite type is not synonymous with admissibility.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`](#excursionoperatorsandspectralaction-es7-equal-characteristic-fundamental-local-representation)
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `tauceti:TauCeti.IsSmoothDiscrete`
- `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Proposition 10.6(i) and Proposition 9.4 caveat, pp. 1341,1337. The finiteness statement is at finite cover level; the source separately flags the full GL_d admissibility import.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-global-cohomology"></a>

#### Global tower cohomology and automorphic isotypes

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`.

For division D and each level I let H_I^i=H^i(E_{I,F̄},Q̄_ℓ), 0≤i≤2(d−1). It is finite dimensional with finite coefficient field and continuous Galois action. H^i=colim_IH_I^i carries commuting D^×(A^∞) and Galois actions, with finite-dimensional K_I-invariants. Decompose the semisimplified tower into automorphic Π^∞⊗V_Π^i with Π_∞=1 or St. This node gives the decomposition and alternating trace; concentration in a single degree and multiplicity one are restricted to the selected transfer image in the separate node below.

**Hypotheses.**

- D a central division algebra over F = F_q(X), split at the rational place ∞; level I; ℓ ≠ p; coefficients Q̄_ℓ.

**Construction or proof.**

1. Use EDC finite-level cohomology, proper base change and the Hecke tower.
2. Use finite compact-open invariants and the discrete spectrum to define isotypes.
3. Apply the alternating trace identity to restrict possible ∞ components; do not use the unpublished ample-class proof for arbitrary Π.

**Acceptance.**

- Full tower cohomology is not asserted finite dimensional.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`](#excursionoperatorsandspectralaction-es7-equal-characteristic-moduli-and-hecke)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`](#excursionoperatorsandspectralaction-es7-equal-characteristic-frobenius-hecke-correspondences)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-discrete-spectrum)
- `EtaleDualityAndPerverseSheaves:EDC.2`
- `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `mathlib:Representation`
- `mathlib:DirectSum`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Theorem 10.1 and its setup, pp. 1338–1339. The cohomology setup restates LRS §14; the packet restricts the stronger concentration assertion to its selected globalizations.
- [LRS-1993 (ES7)](#source-es7-lrs-1993), §§14.1–14.2 and Theorem 14.9, pp. 294, 297–298. The limit cohomology, its admissible (D^∞)^×-action and isotypic decomposition (§§14.1–14.2) precede Theorem 14.9.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-geometric-automorphic-trace"></a>

#### Geometric and automorphic trace identity

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`.

For good place o, r≥1 and a level-compatible away-o Hecke test, the alternating cohomological trace of Frobenius_o^r and the correspondence is the spectral trace Σ_Πm(Π)trΠ(f_∞f_{o,r}f^{∞,o}). The EP traces give coefficients 1 for Π_∞=1 and (−1)^{d−1} for Π_∞=St. For a Steinberg isotype and almost all places o (outside a finite set containing ∞, the bad places and the places where Π_o is ramified; LRS Theorem 14.9(ii)) the alternating trace is (−1)^{d−1}m(Π)q_o^{r(d−1)/2}Σ_{j=1}^dz_j(Π_o)^r. This is an alternating trace statement before proving concentration.

**Hypotheses.**

- Level I; o a place of good reduction for I; r ≥ 1; a level-compatible Hecke test function away from o and ∞.

**Construction or proof.**

1. Use the EDC.8 correspondence trace interface with the isolation/large-power bounds from LRS §§11–12.
2. Apply the compact kernel formula and EP orbital transfer.
3. At an unramified place use the spherical Satake polynomial and its q_o^{(d−1)/2} normalization.

**Acceptance.**

- For d=2 the alternating Steinberg sign is −1, before the middle-degree sign cancels it.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`](#excursionoperatorsandspectralaction-es7-equal-characteristic-global-cohomology)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-kernel-trace-identity)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-orbital-integrals)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-character-traces)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`](#excursionoperatorsandspectralaction-es7-equal-characteristic-frobenius-hecke-correspondences)
- `FunctionFieldArithmetic:FA.6`
- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`
- `EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), Proposition 13.6 and Theorem 14.9(ii), pp. 291, 297. Proposition 13.6 expresses the geometric trace spectrally; Corollary 13.7 and Theorem 14.9(ii) give the coefficients and the Steinberg isotype formula.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-dual-isotypic-pairing"></a>

#### Pairing dual automorphic isotypes

**Lemma.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing`.

At finite proper level with dimension d−1, Poincaré duality pairs H^i[Π] with H^{2(d−1)−i}\([Π^∨](d−1)\); equivalently (H^i[Π])^∨≅H^{2(d−1)−i}\([Π^∨](d−1)\), with the dual automorphic multiplicity factor and inverse central character. The Hecke adjoint is the inverse correspondence. There is no identification with the same Π-isotype unless a compatible self-duality is separately specified.

**Hypotheses.**

- Finite proper level I, so E_I is smooth projective of dimension d − 1 over F; Π automorphic with contragredient Π^∨.

**Construction or proof.**

1. Apply the perfect finite-level pairing and the adjoint correspondence identity.
2. Project onto the two automorphic isotypes, using contragredience on the smooth action and inversion of the central character.
3. Track the grading and twists before forming L-factors.

**Acceptance.**

- For a non-self-dual rank-one Hecke character the paired component has inverse character.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`](#excursionoperatorsandspectralaction-es7-equal-characteristic-global-cohomology)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`](#excursionoperatorsandspectralaction-es7-equal-characteristic-frobenius-hecke-correspondences)
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`

**Source locators.**

- [Kaiser-erratum (ES7)](#source-es7-kaiser-erratum), Opening paragraph and Corollary 14.11 correction, p. 1. Kaiser identifies the false self-duality claim (LRS p. 300 and §14.16, p. 306); the isotypic pairing of Π with Π^∨ is the standard consequence of Poincaré duality that this node states, not printed in the erratum.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-erratum"></a>

#### Corrected L-factor duality

**Comparison.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum`.

Use Kaiser’s correction in Corollary 14.11: replace L_x(V_Π∞^bullet,q_x^{−d}T^{−1}) by L_x((V_Π∞^bullet)^∨,q_x^{−1}T^{−1}) in both statement and proof. Both the dual and the exponent change. The isotypic pairing is the dual-isotype pairing above. Use Lemma 14.14′ and Proposition 14.17′, not their published self-dual hypotheses, in the general proof of 14.12. This packet’s selected generic proof avoids the unpublished invariant-ample-class argument.

**Hypotheses.**

- Π automorphic for D^× with Π_∞ ≅ St_d; x a place of good reduction; V_Π∞^• the graded isotypic Galois representation of LRS 14.11.

**Construction or proof.**

1. Read the published Corollary 14.11 against the erratum.
2. Replace the local factor in both occurrences; pair Π with Π∨ and preserve the chosen graded L-function convention.

**Acceptance.**

- Changing only V to V∨ while keeping q_x^{-d} is not the correction.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing`](#excursionoperatorsandspectralaction-es7-equal-characteristic-dual-isotypic-pairing)
- `EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`

**Source locators.**

- [Kaiser-erratum (ES7)](#source-es7-kaiser-erratum), Corollary 14.11 correction, p. 1. The correction changes the dual representation and q-exponent, not only an informal self-duality warning.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-graded-chain-lemma"></a>

#### Corrected graded chain lemma

**Lemma.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-lemma`.

Let d≥1, m,m′≥0 with m′ dividing m, and let V^bullet be a pure graded Frobenius-semisimple ℓ-adic local Galois representation in the sense of LRS 14.13, degrees 0,…,2d−2. Suppose L_∞(V^bullet,T)/L_∞((V^bullet)^∨,q_∞^{-1}T^{-1}) ~ ((1−q_∞^{-d}T^{-1})/(1−T))^m, where f ~ g means equal orders of zero or pole at T = q_∞^n for every n ∈ ℤ (LRS 14.13; a nonzero Laurent-monomial difference, as in corrected 14.11(iii), is a special case), and each L_∞(V^i,T)^{-1} is an m′-th power in 1+TQ̄_ℓ[T]. Then V has a direct summand ⊕_{a∈A}W_a, each W_a=[⊕_{j=0}^sσ⁰(St_{i_j})(−i_0−⋯−i_{j−1})]^{m′}, with positive i_j summing to d and m=|A|m′. A term σ⁰(St_i)(−j) lies in degree i+2j−1. Self-duality and integrality are not hypotheses of the amended lemma.

**Hypotheses.**

- d ≥ 1; m, m′ ≥ 0 with m′ | m; V^• a pure graded Frobenius-semisimple ℓ-adic representation of the local Weil group at ∞ in degrees 0, …, 2d − 2 (LRS 14.13).
- The ratio and m′-th power conditions on its local L-factors stated in the node.

**Construction or proof.**

1. Extract an indecomposable σ⁰(St_i) from the root 1 of the local factor. Purity determines its degree.
2. Use the m′-power condition to extract m′ copies and the ratio to force the next Tate-shifted term.
3. Continue until the positive chain lengths sum to d, take a complement and induct.

**Acceptance.**

- At d=1 the chain is σ⁰(St₁) in degree 0.
- The conclusion is a direct summand, not that V has no further zero-L-factor summands.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum`](#excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-erratum)
- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`
- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`
- `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`

**Source locators.**

- [Kaiser-erratum (ES7)](#source-es7-kaiser-erratum), Lemma 14.14′ and its proof, pp. 1–2. Lemma 14.14′ drops the integrality and self-duality hypotheses of LRS 14.14 and concludes one-sided chains with m = |A|m′.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-graded-chain-proposition"></a>

#### Corrected automorphic graded chain

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-proposition`.

For an automorphic Π with Π_∞≅St_d, the finite-dimensional graded isotypic representation of LRS 14.17, restricted to the decomposition group at ∞, satisfies (V_Π∞^bullet)^{Frob-ss}≅[⊕_{j=0}^sσ⁰(St_{i_j})(−i_0−⋯−i_{j−1})]^{m(Π)}, for positive i_j with Σi_j=d. Terms have degree i_j+2(i_0+⋯+i_{j−1})−1. This is the amended Proposition 14.17′; it is a chain conclusion, not yet the one-part middle-degree concentration theorem.

**Hypotheses.**

- Π automorphic for D^× with Π_∞ ≅ St_d; V_Π∞^• as in LRS 14.17.

**Construction or proof.**

1. Supply the graded local weight/monodromy and L-factor inputs listed in LRS 14.13–14.17.
2. Apply the amended chain lemma with m′=m(Π) and the dimension constraints.

**Acceptance.**

- A chain with several positive parts cannot simply be identified with St_d in middle degree.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-lemma`](#excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-graded-chain-lemma)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`](#excursionoperatorsandspectralaction-es7-equal-characteristic-geometric-automorphic-trace)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`](#excursionoperatorsandspectralaction-es7-equal-characteristic-global-cohomology)
- `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`
- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`
- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`
- `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`

**Source locators.**

- [Kaiser-erratum (ES7)](#source-es7-kaiser-erratum), Proposition 14.17′, p. 1. Proposition 14.17′ replaces the U′/U″ alternatives of LRS 14.17 by chains of multiplicity m(Π); Kaiser keeps the proof.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-selected-isotypic-cohomology"></a>

#### Selected global middle cohomology

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`.

For Π in the proven transfer image of LRS 15.10–15.11, V_Π^i=0 for i≠d−1, dimV_Π^{d−1}=d and m(Π)=1. At a good o, Frobenius trace is q_o^{r(d−1)/2}Σ_jz_j(Π̃_o)^r. The normalized Σ(Π)=V_Π^{d−1}((d−1)/2) is the selected global Galois representation. The local components of Π̃ at split good places are generic (the independent genericity theorem), so the elementary remark following 14.12, cited explicitly in LRS 15.12, proves concentration using the strict unitary-generic Satake bound and purity. No arbitrary division-algebra isotype concentration is asserted.

**Hypotheses.**

- Π in the proven transfer image of LRS 15.10–15.11 (the selected globalizations); o a good place.

**Construction or proof.**

1. Use multiplicity one only for the selected transfer.
2. Import genericity and the strict Satake bound for its split unramified components. Combine the alternating trace and purity to separate the degrees as in the remark to 14.12.
3. Normalize the weight and use Chebotarev to identify the selected global Galois representation.

**Acceptance.**

- For d=1 the selected representation has degree zero and dimension one.
- Purity alone is not used to deduce arithmetic Frobenius semisimplicity.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-jacquet-langlands-transfer)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`](#excursionoperatorsandspectralaction-es7-equal-characteristic-geometric-automorphic-trace)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum`](#excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-erratum)
- `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `FunctionFieldArithmetic:FA.6`
- `FunctionFieldArithmetic:FA.4`
- `ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), Theorem 15.12 (pp. 316–317) and the Remark following it (p. 317). The selected generic route avoids the more subtle proof of general Theorem 14.12.
- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Proposition 10.5, p. 1341. Proposition 10.5 restricts to the representation obtained from π by Lemmas 10.2–10.3 and gives vanishing outside degree d − 1; the Frobenius trace formula and the genericity/Satake-bound route are LRS’s.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-local-correspondence-independence"></a>

#### Independence of the selected globalization

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`.

For a supercuspidal π of GL_d(K) with finite-order central character, restrict Σ(Π) from each selected globalization to W_K. All resulting semisimple local representations are equal up to isomorphism: within one global setup (curve, x₀ = o, x₁ = o′, ∞ and D fixed), independent of the selected globalization Π ∈ Π(π) and of the auxiliary place x₂ (LRS Corollary 15.14). Independence of the curve and of o′ is not asserted. Their determinants match the central character, contragredients and finite-order twists correspond, and Rankin–Selberg pair L- and ε-factors agree with the Galois tensor-product factors, with the same nontrivial additive character and geometric reciprocity.

**Hypotheses.**

- K a local field of characteristic p; π a supercuspidal representation of GL_d(K) with finite-order central character; the selected globalizations of LRS 15.10–15.11.

**Construction or proof.**

1. Match determinants and twists by the unramified Frobenius data and Chebotarev.
2. Compare global functional equations for selected pairs; control local zeros/poles using purity.
3. Apply the local-constant uniqueness theorem quoted by LRS (Henniart 4.1/4.4/4.5), retaining it as a specific proof/source gap.

**Acceptance.**

- For d=1 the result is local class field theory.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`](#excursionoperatorsandspectralaction-es7-equal-characteristic-selected-isotypic-cohomology)
- `FunctionFieldArithmetic:FA.6`
- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `WeilConjectures:WC.2`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `FunctionFieldArithmetic:FA.4`
- `ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset`

**Source locators.**

- [LRS-1993 (ES7)](#source-es7-lrs-1993), Proposition 15.13 and Corollary 15.14, pp. 317–318. Proposition 15.13 gives determinant, contragredient, twist and pair-factor compatibilities; Corollary 15.14 gives independence over the globalizations Π ∈ Π(π) of one fixed global setup.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-classical-local-correspondence"></a>

#### Independent equal-characteristic classical LLC

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`.

The selected construction π↦σ_d(π)=Σ(Π)|W_K gives a bijection between supercuspidal GL_d(K) representations with finite-order central character and irreducible continuous d-dimensional Weil representations with finite-order determinant, preserving central characters, twists, duals and pair local constants. Surjectivity uses Henniart’s numerical local Langlands theorem (LRS 15.17–15.20); it is not obtained from the excursion parameter. Extend to arbitrary central characters and irreducibles through the independently supplied twisting/segment classification. The full Weil–Deligne correspondence is used only through its semisimple Weil restriction in ES7.

**Hypotheses.**

- K a local field of characteristic p; ℓ ≠ p; supercuspidal representations with finite-order central character and irreducible d-dimensional ℓ-adic Weil representations with finite-order determinant.

**Construction or proof.**

1. Use LRS 15.14 for the injection and local-constant compatibility.
2. Apply the numerical theorem in the exact finite-order/conductor range to obtain surjectivity.
3. Use unramified twists and segment classification with pinned normalization to extend the finite-order supercuspidal correspondence.

**Acceptance.**

- This proof route has no prerequisite on the excursion comparison or ES7:GLn-comparison.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`](#excursionoperatorsandspectralaction-es7-equal-characteristic-local-correspondence-independence)
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`
- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`
- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`
- `FunctionFieldArithmetic:FA.4`
- `ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Theorem 9.2, pp. 1334–1335. Hausberger restates the independently constructed LRS correspondence with its four characterizing properties.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-geometric-hochschild-serre"></a>

#### Hochschild–Serre for the geometric quotient

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`.

For the uniformized finite-level quotient and 0≤j≤2(d−1), there is a convergent spectral sequence E₂^{i,j}=Ext^i_{GL_d(K),sm}(H_c^{2(d−1)−j}((Res′Σ_n^d)_K̄,Q̄_ℓ)(d−1),A_{D̄}^{∞,level})⇒H^{i+j}(E_{I,K̄},Q̄_ℓ). A_{D̄}^{∞,level} is the space of automorphic forms on the D̄ double-coset space Z_{I^o} of uniformization, trivial at ∞ (Hausberger: “formes automorphes sur Z_{I^o} triviales à l’infini”). The system is compatible with levels, original D away-o and D_o^× actions and W_K. Import the general continuous Hochschild–Serre/derived invariants construction from R02.2; the properly discontinuous analytic quotient, compact-support duality and finite stabilizers are proved for this application here.

**Hypotheses.**

- Uniformized finite-level quotient of E_I at o (level away from ∞, cover level n at o); 0 ≤ j ≤ 2(d − 1); ℓ ≠ p.

**Construction or proof.**

1. Use the formal/analytic uniformization and the D̄ double-coset coefficient space.
2. Apply the general derived construction, after checking discontinuity, stabilizers and the analytic/cohomological comparison.
3. Apply Poincaré duality in dimension d−1; verify transition and three-action equivariance, including transpose-inverse conventions in 10.8.

**Acceptance.**

- The duality twist is d−1 and compact cohomological degree is 2(d−1)−j.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`](#excursionoperatorsandspectralaction-es7-equal-characteristic-uniformisation)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`](#excursionoperatorsandspectralaction-es7-equal-characteristic-fundamental-local-representation)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`](#excursionoperatorsandspectralaction-es7-equal-characteristic-local-cohomology-finiteness)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-discrete-spectrum)
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence`
- `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`
- `ClassicalAdicEtaleCohomology:H3/berkovich-derived-duality-interface`
- `mathlib:CategoryTheory.Abelian.Ext`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Proposition 10.6(ii) (p. 1341), Corollary 10.7 and Remark 10.8 (p. 1342), Proposition A.12 (pp. 1364–1365). The displayed E₂ page uses compact-support duality and smooth Ext; Appendix A provides the analytic quotient application.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-hochschild-serre-and-degeneration"></a>

#### Cuspidal degeneration of the quotient spectral sequence

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`.

For a selected global transfer with local π_o supercuspidal, its multiplicity in the E₂^{i,j} page is zero for i>0. Hence the selected cuspidal part degenerates and E₂^{0,j}[Π^{∞,o}]≅(H_o^j)^ss[Π^{∞,o}] with its D_o^× and Weil actions as in Hausberger 10.17. Restrict π_o to GL_d(K)^0={g:v(det g)=0}; its compact matrix coefficients yield an injective object of the smooth characteristic-zero category. Compact induction/Frobenius reciprocity then kills the relevant higher Ext. The finite-type source and finite-level admissibility justify the multiplicity calculation.

**Hypotheses.**

- A selected global transfer whose component at o is supercuspidal; coefficients Q̄_ℓ (characteristic zero).

**Construction or proof.**

1. Apply Frobenius reciprocity from the component stabilizer to GL_d(K)^0.
2. Use compact matrix coefficients and the SR.3 characteristic-zero finite-representation injectivity theorem.
3. Track subquotient multiplicities across the spectral sequence and use the selected cohomology calculation.

**Acceptance.**

- This is not full degeneration for arbitrary automorphic constituents.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`](#excursionoperatorsandspectralaction-es7-equal-characteristic-geometric-hochschild-serre)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`](#excursionoperatorsandspectralaction-es7-equal-characteristic-local-cohomology-finiteness)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`](#excursionoperatorsandspectralaction-es7-equal-characteristic-selected-isotypic-cohomology)
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `mathlib:CategoryTheory.Injective`

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Lemma 10.14, Lemma 10.15, Remark 10.16, Proposition 10.17, pp. 1353–1356. The proof uses the restriction to the determinant-unit subgroup and the finite-representation projective/injective argument.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-drinfeld-carayol"></a>

#### Drinfeld–Carayol supercuspidal realization

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`. Planet: **Drinfeld–Carayol theorem**.

Let ξ:K^×→Q̄_ℓ^× have finite order, and π be supercuspidal of GL_d(K) with central character ξ. Its isotypic quotient in U_d^i(ξ) vanishes for i≠d−1, and Hom_{GL_d(K)}(π,U_d^{d−1}(ξ))≅JL(π)⊗(σ_d(π)⊗|·|^{(1−d)/2}), compatibly with D_K^××W_K. This is the three-action realization. Extension to arbitrary central character requires the twisting comparison; the theorem stated here is precisely the finite-order range of Hausberger 9.5.

**Hypotheses.**

- K = F_q((t)); ℓ ≠ p; ξ : K^× → Q̄_ℓ^× of finite order; π supercuspidal of GL_d(K) with central character ξ.

**Construction or proof.**

1. Choose the selected globalization and transfer for π.
2. Compare its degree-d−1 isotype with the spectral sequence’s Hom term and selected global σ_d.
3. Pass through the cover/level colimits and finite-order central quotient; use the normalization |·|^{(1−d)/2}.

**Acceptance.**

- For d=1 the twist is zero.
- The non-supercuspidal Carayol–Harris formula is a conjecture and is not a target.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`](#excursionoperatorsandspectralaction-es7-equal-characteristic-hochschild-serre-and-degeneration)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`](#excursionoperatorsandspectralaction-es7-equal-characteristic-fundamental-local-representation)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`](#excursionoperatorsandspectralaction-es7-equal-characteristic-classical-local-correspondence)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-local-character-identity)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`](#excursionoperatorsandspectralaction-es7-equal-characteristic-selected-isotypic-cohomology)

**Source locators.**

- [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), §9.3 and Theorem 9.5 (p. 1337); final proof in §10.4 (pp. 1356–1357). The finite-order central character was fixed immediately before the theorem; the isotype is Hom, not an unexplained subspace.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-hecke-fibre-transport"></a>

#### Equal-characteristic Hecke-fibre realization

**Comparison.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`.

Identify the equal-characteristic special formal O_D-module/Drinfeld covers and the dual local formal O-module spaces with the minuscule local-shtuka Hecke fibres for GL_d. Transport Drinfeld–Carayol’s three-action cohomology and its dual realization through HS3, with matching D^×, GL_d(K), two Weil actions, [d−1] and ((d−1)/2) Satake normalization. The output is exactly the two-operation package σ⊗ρ_π⊗ρ_π^∨ used by the single GLn-comparison trace theorem. The mixed-characteristic p-divisible-group theorem alone does not provide this identification.

**Hypotheses.**

- E = K a local field of characteristic p; G = GL_d; π supercuspidal over Q̄_ℓ, σ = JL(π) on D_K^× with D_K of invariant 1/d.

**Construction or proof.**

1. Match the equal-characteristic formal-module moduli with local-shtuka fibres using an O-module coordinate functor.
2. Use the three-action realization and its duality to identify both Hecke operations.
3. Check normalizations and export the package to the shared trace theorem. The exact comparison source and second-operation proof require the named transport refinement.

**Acceptance.**

- All three actions survive the comparison; an isomorphism of underlying spaces alone is insufficient.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`](#excursionoperatorsandspectralaction-es7-equal-characteristic-drinfeld-carayol)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`](#excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-modules)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`](#excursionoperatorsandspectralaction-es7-equal-characteristic-uniformisation)
- `HeckeStacksAndLocalShtukas:HS2`
- `HeckeStacksAndLocalShtukas:HS3`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), §IX.7.3, p. 338 (cf. §IX.3, pp. 324–325). FS use the §IX.3 translation and the Lubin–Tate/Drinfeld description of [SW13], which is mixed characteristic; FS give no equal-characteristic identification, so it is recorded as ES7/gap/equal-transport.

<a id="excursionoperatorsandspectralaction-es7-equal-characteristic-equal-characteristic-agreement"></a>

#### Classical agreement in equal characteristic

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`.

For E a local field of characteristic p and every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter φ_π equals the semisimplification of the Weil part of the classical parameter of π (the LRS correspondence of classical-local-correspondence, extended to all irreducibles by twists and the segment classification). For supercuspidal π: hecke-fibre-transport supplies the two-operation package σ ⊗ ρ_π ⊗ ρ_π^∨ for σ = JL(π); two-leg-excursion-is-a-trace and trace-determines-semisimplification identify the parameter of σ on the basic stratum, and the direct-summand argument of supercuspidal-agreement transports it to π. The general case follows as in all-irreducible-representations from normalised-induction-dictionary. This is the equal-characteristic half of FS Theorem IX.7.4; it does not identify N.

**Hypotheses.**

- E a local field of characteristic p > 0 (E ≅ F_q((t))); ℓ ≠ p; coefficients Q̄_ℓ.
- π any irreducible smooth Q̄_ℓ-representation of GL_n(E); classical parameters from classical-local-correspondence extended by twists and segments.

**Construction or proof.**

1. Apply hecke-fibre-transport to obtain T_V(B)|Bun^b ≅ σ ⊗ ρ_π ⊗ ρ_π^∨ in equal characteristic.
2. Run the shared two-leg trace theorem and trace determination (both characteristic-free statements of ES7:GLn-comparison).
3. Transport to π by the direct-summand argument and Hecke/excursion commutation; extend to all irreducibles by normalized parabolic induction and the classical segment rule.

**Acceptance.**

- For n = 1 this is local class field theory with geometric normalisation.
- The trivial and Steinberg representations of GL₂(E) have the same semisimple parameter (diagonal, Frobenius ↦ diag(q^{1/2}, q^{-1/2})) although their monodromy differs.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`](#excursionoperatorsandspectralaction-es7-equal-characteristic-hecke-fibre-transport)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`](#excursionoperatorsandspectralaction-es7-equal-characteristic-classical-local-correspondence)
- [`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`](#excursionoperatorsandspectralaction-es7-gln-comparison-two-leg-excursion-is-a-trace)
- [`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`](#excursionoperatorsandspectralaction-es7-gln-comparison-trace-determines-semisimplification)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`](#excursionoperatorsandspectralaction-es7-parabolic-normalised-induction-dictionary)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- `HeckeStacksAndLocalShtukas:HS3`
- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`
- `VStackSheavesAndLisseCategories:VS4`
- `SmoothRepresentationsOfLocalGroups:SR.3`
- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Theorem IX.7.4 and proof, p. 338. FS state IX.7.4 for every E and cite [LRS93], [Hau05] and [Boy99] for the equal-characteristic towers; this node is the equal-characteristic half.

<a id="excursionoperatorsandspectralaction-es7"></a>

### ES7. Classical agreement for every local field

Combine the characteristic-zero and equal-characteristic conclusions to obtain the semisimple GL_n agreement for every local field. The classical Bernstein-centre agreement is a consequence of that all-field statement. Integral refinements do not assert an integral categorical LLC or recover a monodromy operator.

<a id="excursionoperatorsandspectralaction-es7-agreement-for-every-local-field"></a>

#### Classical agreement over every local field

**Theorem.** Node `ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field`. Planet: **Classical agreement over local fields**.

For every nonarchimedean local field E with residue characteristic p, ℓ≠p, and every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter is the semisimplified classical parameter. The proof has two independent realization inputs: ET.6/6a in characteristic zero and the D-elliptic/selected-function-field route in equal characteristic. Both feed the same two-leg trace theorem (ES7:GLn-comparison) and normalized-induction extension (ES7:parabolic); the two halves are all-irreducible-representations and equal-characteristic-agreement. This completed target inventory is a plan with explicit proof and supplier gaps; it is not a claim that either geometric realization is already formalized.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime (any characteristic).
- π any irreducible smooth Q̄_ℓ-representation of GL_n(E).

**Construction or proof.**

1. Split by the characteristic of E.
2. Characteristic zero: all-irreducible-representations. Characteristic p: equal-characteristic-agreement.

**Acceptance.**

- No claim of integral/mod-ℓ full LLC agreement or recovery of N.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`](#excursionoperatorsandspectralaction-es7-gln-comparison-all-irreducible-representations)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`](#excursionoperatorsandspectralaction-es7-equal-characteristic-equal-characteristic-agreement)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), Theorem IX.7.4, p. 338. The source theorem is the target over all E; its two independent proof inputs are separated in this packet.

<a id="excursionoperatorsandspectralaction-es7-classical-centre-agreement"></a>

#### Classical Bernstein-centre comparison

**Comparison.** Node `ExcursionOperatorsAndSpectralAction:ES7/classical-centre-agreement`.

For GL_n/Q̄_ℓ the spectral-to-Bernstein map has the same evaluation on every irreducible as the usual classical parameter map. With the characteristic-zero Bernstein-centre separation statement this identifies the maps. The universal Ψ_GL_n over Z_ℓ[√q] also exists as a map to the integral Bernstein centre. This integral existence is not an assertion that integral or mod-ℓ representations have a full classical Weil–Deligne correspondence.

**Hypotheses.**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G = GL_n.
- Coefficients Q̄_ℓ for the comparison; ℤ_ℓ[√q] for the integral refinement.

**Construction or proof.**

1. Evaluate on irreducibles using the comparison theorem and use the supplied centre separation theorem.
2. For the integral map use the integral spectral-to-geometric map and the Λ-linear centre construction; do not infer a stronger integral LLC.

**Acceptance.**

- The integral output is a ring map to a centre, not a reconstructed nilpotent monodromy operator.

**Direct prerequisites.**

- [`ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field`](#excursionoperatorsandspectralaction-es7-agreement-for-every-local-field)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`](#excursionoperatorsandspectralaction-es7-parabolic-stratum-maps)
- `SmoothRepresentationsOfLocalGroups:SR.1`

**Source locators.**

- [FS-geometrization (ES7)](#source-es7-fs-geometrization), After IX.7.4, p. 338. FS records the characteristic-zero agreement and its integral centre refinement.

## Required interfaces and proof refinements

These obligations specify missing signatures, mathematical bridges and source expansions. Their named consumers retain them as requirements. A planned target is not a claim that the interface has been implemented or that the proof chain is closed. Supplier requests and ownership proposals are collected in the [assembly handoff](../handoff/ASM-ExcursionOperatorsAndSpectralAction.md).

### ES0 interfaces

#### Enhanced signatures at the pins

Pinned Mathlib has ordinary categories and quasicategories, but no supplied Lambda-linear stable infinity-category/action anima or condensed enhanced functor mapping objects. The suggested Lean file must identify every unavailable higher signature rather than insert True or arbitrary Prop fields. Compilable ordinary observable signatures are distinguished from the complete mathematical statements. E5 and HS1 must supply the exact enhanced types. In the suggested forms, 35 node names and 16 API names lack actual declarations, and 18 test labels lack an executable example outside the register. These require genuine mathematical signatures; an omission comment does not satisfy signature coverage, and an empty Prop stand-in is not a replacement.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`](#excursionoperatorsandspectralaction-es0-bernstein-center-of-a-category)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)
- [`ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`](#excursionoperatorsandspectralaction-es2-universal-action-theorem)
- [`ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`](#excursionoperatorsandspectralaction-es3-integral-universal-action)

#### DVR representation filtration

X.3.2 invokes highest-weight theory without spelling out the DVR filtration/tensor statement. Its exact export is requested from LP3; field good-filtration statements alone do not close this input. Inspect the integral highest-weight source and prove the displayed finite-set tensor equivalence there.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`](#excursionoperatorsandspectralaction-es3-approximation-commutes-with-colimits)

#### Geometric derived scalar-extension interfaces

Conditional action base-change is stated with the explicit Perf and D_lis comparison equivalences it needs. LP1, VS3, HS1 and E5 must determine the exact derived-reduction range; no unrestricted identification with the geometric coefficient-changed category or equality of supports is asserted.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES3/derived-reduction-and-rationalization`](#excursionoperatorsandspectralaction-es3-derived-reduction-and-rationalization)
- [`ExcursionOperatorsAndSpectralAction:ES4/support-coefficient-change`](#excursionoperatorsandspectralaction-es4-support-coefficient-change)

#### Elliptic component deformation argument

LP1 supplies the deformation complex and local Tate duality statement. The proof-interior identification of the unramified twists with the entire connected component in X.2’s footnote needs expansion, including H^0, H^1 and H^2 calculations and the residual stack stabilizer. It is an explicit refinement of the stated target, not a conjectural packet equivalence.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameter-component`](#excursionoperatorsandspectralaction-es4-elliptic-parameter-component)

#### Supplier lisse duality and multi-leg shtukas

The current VS5 nodes concern etched sheaves, while this target needs VII.7’s lisse BZ duality. HS3’s named nodes give minuscule compactness and adjunction, while the local-shtuka target needs full multi-leg IX.3.2 with tower transition compatibility. Both missing exports are precisely requested.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution`](#excursionoperatorsandspectralaction-es4-duality-and-the-chevalley-involution)
- [`ExcursionOperatorsAndSpectralAction:ES4/local-shtuka-excursion-compatibility`](#excursionoperatorsandspectralaction-es4-local-shtuka-excursion-compatibility)

#### LP2 reindexing supplier correction

The current imported LP2 invariant-function-and-independence node repeats the author manuscript’s false cartesian assertion. Only commutativity is required and used here. Its statement/API/test need correction by the LP2 owner; no duplicate abstract excursion node is introduced in ES. See source issue ExcursionOperatorsAndSpectralAction/E1 and the exact supplier request.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`](#excursionoperatorsandspectralaction-es0-excursion-datum-and-operator)
- [`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`](#excursionoperatorsandspectralaction-es0-excursion-algebra-to-bernstein-center)
- [`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`](#excursionoperatorsandspectralaction-es1-finite-ramification-component-decomposition)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data`](#excursionoperatorsandspectralaction-es1-spectral-center-center-change-of-data)
- [`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`](#excursionoperatorsandspectralaction-es1-spectral-center-excursion-algebra-without-the-coefficient-condition)
- [`ExcursionOperatorsAndSpectralAction:ES2/degree-zero-center-agreement`](#excursionoperatorsandspectralaction-es2-degree-zero-center-agreement)
- [`ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution`](#excursionoperatorsandspectralaction-es4-duality-and-the-chevalley-involution)
- [`ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameter-component`](#excursionoperatorsandspectralaction-es4-elliptic-parameter-component)

**Layer obligations.**

`ExcursionOperatorsAndSpectralAction:ES0`:

- E5/HS1 enhanced center and coherent relation signatures; preserve the qualified comparison to ordinary CatCenter.

`ExcursionOperatorsAndSpectralAction:ES0:classical-center`:

- SR.1 abelian ring-valued center/Hecke-corner export and SR.3 field-transport block dictionary.

`ExcursionOperatorsAndSpectralAction:ES1`:

- Complete the supplier enhanced center and finite-wild coordinate interfaces.

`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`:

- HS1 relatively discrete Hom and quotient-equivariant full faithfulness, and E5 Ind sum/product comparison.

`ExcursionOperatorsAndSpectralAction:ES1:spectral-center`:

- LP and HS coefficient/pinned-quotient comparison interfaces; retain the exact center-order condition.

`ExcursionOperatorsAndSpectralAction:ES2`:

- E5 action anima/relative tensor constructions and LP derived quotient descent; inspect the full higher inverse comparisons.

`ExcursionOperatorsAndSpectralAction:ES3`:

- LP3 DVR highest-weight filtration, E5 animated free-group resolution, and qualified LP/VS/HS derived scalar-extension comparisons.

`ExcursionOperatorsAndSpectralAction:ES4`:

- Lisse VS5 duality, full multi-leg HS3 comparison, elliptic deformation proof refinement and qualified endomorphism base-change.

### ES5 interfaces

#### All-coefficient admissibility supplier

The current SR.0 defines admissibility and SR.3/SR.3a prove complex results; they do not supply the modular theorem. SR.6 is downstream. Create the proposed independent SR.3b and read Vignéras II.2.8 before treating this input as closed. Qbar_ell is uncountable; the countable-field issue is Fbar_ell.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`](#excursionoperatorsandspectralaction-es5-condensed-schur-from-admissibility)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- [`ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`](#excursionoperatorsandspectralaction-es6-duality-smooth-duals)

#### Enriched noncompact Schur and stratum adjunction interfaces

The existing VS4 and HS1 nodes do not explicitly provide the condensed fixed-vector endomorphism comparison, VII.7.2’s enriched relative-homology left adjoint or eligible right-extension comparison. The mathematical proof outline is given, but these exact reusable supplier declarations remain required.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`](#excursionoperatorsandspectralaction-es5-condensed-schur-from-admissibility)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- [`ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`](#excursionoperatorsandspectralaction-es5-stratum-centre-embedding-independence)

#### Pre-evaluation kernel and exterior-generator precision

HS4’s comparison node states the centre diagrams but records only an opening read of IX.6.1; the complete relative-homology kernel formula is requested. VS5 must provide the VII.7.10 exterior Hom formula at the required coefficients. These are supplier refinements, not new local definitions of their geometry.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`](#excursionoperatorsandspectralaction-es6-functoriality-isogenies)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`](#excursionoperatorsandspectralaction-es6-functoriality-products)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`](#excursionoperatorsandspectralaction-es6-functoriality-weil-restriction)

#### Foundational induced-torus and z-extension scope extension

No existing RG2.5 node plans induced-torus resolutions or z-extension existence. Confirmed finding 10 calls for a new foundational RG2.6, with BG/ET consumers outside this issue’s allowed paths. The proposal here routes that need and does not make a nonexistent stage into a prerequisite.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`](#excursionoperatorsandspectralaction-es6-functoriality-tori-spectral-center)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`](#excursionoperatorsandspectralaction-es6-functoriality-central-characters-and-twisting)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`](#excursionoperatorsandspectralaction-es6-functoriality-twisting-by-abelianized-characters)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`](#excursionoperatorsandspectralaction-es6-functoriality-z-embedding-central-character-comparison)

#### Full equal-characteristic reciprocity

The upstream ClassFieldTheory document fixes normalization, but its equal-characteristic endpoint excludes wild p-primary norm/existence theory. The torus theorem for all E needs that full reciprocity interface. Request a Part II for the missing range; retain upstream layer 9 only for the interface it actually states.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`](#excursionoperatorsandspectralaction-es6-functoriality-tori-spectral-center)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`](#excursionoperatorsandspectralaction-es6-functoriality-torus-two-leg-calculation)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-tori-diagonal-embedding)

#### Lubin–Tate torsor and Hecke endpoint inversion adapter

RF3 supplies O(1) and its sign, not II.2.1’s Lubin–Tate torsor. Fargues’ author copy 2.16/3.3 identifies the torsor descent and the inverse-character/inverse-Artin monodromy. The complete endpoint action calculation connecting that convention with this Hecke kernel, including modular/equal-characteristic coefficients, still needs a supplier extension and explicit verification.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`](#excursionoperatorsandspectralaction-es6-functoriality-torus-two-leg-calculation)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-tori-diagonal-embedding)

#### Z-embedding field range and modular extension of characters

Kaletha §5 is p-adic and its representation paragraph uses complex characters. Smooth extension over arbitrary algebraically closed L remains a requested input. A source-backed arbitrary-local-field disconnected-centre comparison is still missing; the proposed connected-centre surjective z-extension cover was removed because standard z-extensions do not have that property. In equal characteristic specify fppf cohomology for nonsmooth centres and check its field range rather than transfer p-adic finiteness of centre H1.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-z-embedding)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`](#excursionoperatorsandspectralaction-es6-functoriality-z-embedding-central-character-comparison)

#### Prototype geometric conditions unavailable at the pins

The suggested file elaborates actual condensed algebra and representation/algebraic interfaces. Animated categories, the geometric kernel identities, semisimplicity, the full prescribed Weil projection, relatively discrete continuity, reductive z-embedding/cohomology conditions and smoothness of extensions are omitted. Its classifier and kernel comparisons are explicit imported maps/equations, not implementations of the full theorems. Replace those fragments with exact owner interfaces when available.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`](#excursionoperatorsandspectralaction-es5-schur-irreducible-object)
- [`ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`](#excursionoperatorsandspectralaction-es5-condensed-schur-from-admissibility)
- [`ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`](#excursionoperatorsandspectralaction-es5-excursion-character-of-a-schur-object)
- [`ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`](#excursionoperatorsandspectralaction-es5-abstract-semisimple-parameter)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`](#excursionoperatorsandspectralaction-es5-parameter-of-a-schur-irreducible-sheaf)
- [`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`](#excursionoperatorsandspectralaction-es5-parameter-of-an-irreducible-smooth-representation)
- [`ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`](#excursionoperatorsandspectralaction-es5-stratum-centre-embedding-independence)
- [`ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`](#excursionoperatorsandspectralaction-es5-invariance-and-coefficient-transport)
- [`ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`](#excursionoperatorsandspectralaction-es6-coefficient-policy-for-the-functorial-diagrams)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`](#excursionoperatorsandspectralaction-es6-functoriality-isogenies)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`](#excursionoperatorsandspectralaction-es6-functoriality-products)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`](#excursionoperatorsandspectralaction-es6-functoriality-weil-restriction)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`](#excursionoperatorsandspectralaction-es6-functoriality-tori-spectral-center)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`](#excursionoperatorsandspectralaction-es6-functoriality-torus-two-leg-calculation)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-tori-diagonal-embedding)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`](#excursionoperatorsandspectralaction-es6-functoriality-central-characters-and-twisting)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`](#excursionoperatorsandspectralaction-es6-functoriality-twisting-by-abelianized-characters)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-z-embedding)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`](#excursionoperatorsandspectralaction-es6-functoriality-z-embedding-central-character-comparison)
- [`ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`](#excursionoperatorsandspectralaction-es6-duality-bernstein-zelevinsky-duals)
- [`ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`](#excursionoperatorsandspectralaction-es6-duality-smooth-duals)

#### Abstract discrete-group supplier generality

The existing LP2 character node is for W_E and ES0 action is for finite-wild compact Bun_G data. The arbitrary-discrete-W variants needed by VIII.4.3 are requested from LP2 with their exact projection and closed-orbit hypotheses.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`](#excursionoperatorsandspectralaction-es5-abstract-semisimple-parameter)

#### Universal-coefficient torus operator identity

The L-valued two-leg formula does not identify the action on regular Lambda[E-times/K] modules. Prove the translation identity at each compact open pro-p K and degree stratum from the Lubin–Tate kernel, naturally in Lambda and K. This preserves nilpotent coefficients and is required before passage to the completed centre. The present sign/endpoint proof does not establish this strengthening.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`](#excursionoperatorsandspectralaction-es6-functoriality-torus-two-leg-calculation)
- [`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`](#excursionoperatorsandspectralaction-es6-functoriality-tori-diagonal-embedding)

#### Lisse Bernstein–Zelevinsky supplier extension

The cited VS5 BZ node is étale compact. The lisse/general-Lambda and condensed enhancement needed by IX.5.3 require the VII.7.4–VII.7.7 interface requested from VS5. The same interface is required by ES4.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`](#excursionoperatorsandspectralaction-es6-duality-bernstein-zelevinsky-duals)
- [`ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`](#excursionoperatorsandspectralaction-es6-duality-smooth-duals)

**Layer obligations.**

`ExcursionOperatorsAndSpectralAction:ES5`:

- Close SR.3b admissibility and the enriched fixed-vector/stratum-adjunction supplier requests.
- Refine the exact LP2 continuity interface and replace omitted geometric prototype conditions.
- State the exact arbitrary-discrete-W abstract LP2 action and classification variants requested by VIII.4.3.

`ExcursionOperatorsAndSpectralAction:ES6`:

- Resolve the requested supplier interfaces used by each excursion/centre comparison.

`ExcursionOperatorsAndSpectralAction:ES6:functoriality`:

- Close HS4/VS5 kernel and exterior-Hom refinements.
- Create the RG2.6 and period-geometry extensions; supply full equal-characteristic reciprocity.
- Verify the torus endpoint inversion and general-field/modular z-comparisons.
- Supply a valid arbitrary-local-field disconnected-centre comparison; the conditional p-adic z-embedding node does not realise this target.
- Prove the universal-coefficient two-leg operator identity on regular quotient group algebras and its Hecke endpoint sign before asserting the integral diagonal-centre proof.

`ExcursionOperatorsAndSpectralAction:ES6:duality`:

- Supply the all-coefficient admissibility and contragredient/induction dictionary, respecting the late ES7 return.
- Replace the prototype duality character equations by the actual enhanced duality interfaces.
- Supply lisse/general-coefficient BZ duality, since the existing VS5 cited node states only the étale compact theorem.

### ES7 interfaces

#### Root/modulus convention comparison

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/normalization`.

The GL₂ calculation fixes the signs, but the full nonsplit/relative-root proof matching SR.2 modulus, Satake Weil action and geometric reciprocity needs a source-qualified expansion. Mathlib’s group modular character is not itself this theorem.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`](#excursionoperatorsandspectralaction-es7-parabolic-normalised-induction-dictionary)

#### Equal-characteristic z-embedding reduction

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/z-embedding`.

Kaletha’s consulted text is p-adic (§2: “F will denote a p-adic field”). For E of characteristic p the construction cannot simply be extended: if Z(G) is not smooth (e.g. G = SL_p, Z(G) = μ_p), then for every embedding G ↪ G′ with torus quotient C and Z(G′) a torus, the cokernel of Z(G′)(E) → C(E) injects into ker(H¹_fppf(E, Z(G)) → H¹(E, Z(G′))), and H¹_fppf(E, μ_p) = E^×/E^{×p} is infinite while H¹(E, Z(G′)) is finite, so Fact 5.5’s surjectivity fails. For smooth Z(G) extend Definition 5.1/Fact 5.5 to equal characteristic; for non-smooth Z(G) a different reduction to quasi-split G (or a different proof of B(G) ↪ B(G′) and of centre detection) is needed. Then prove the Bun fibre identity, B-injectivity and centre detection as in FS. Kottwitz’s B(G_ad)-to-H¹ bridge is a BG1 request. Recorded as source issue ExcursionOperatorsAndSpectralAction/E2. Cross-part interface: ES6:functoriality/isogenies already covers adjoint-isomorphism maps, and ES6:functoriality/z-embedding supplies the full p-adic conditions and central surjectivity. Those exact nodes are prerequisites of the consuming reduction. The remaining equal-characteristic input has no supplying node in ES5; it is this explicit gap, with the residual ES6:functoriality supplier request, rather than a claimed consequence of the whole stage.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`](#excursionoperatorsandspectralaction-es7-parabolic-basic-case-and-quasisplit-reduction)

#### Quantitative modification and constant-term closure

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/HN`.

Expand the BG4 bounded-modification estimate and verify every arrow/support hypothesis of the P/Levi constant-term diagram. For IX.7.3 the Hodge–Newton modification calculation referenced as GI16 Theorem 4.26 remains to be read. Keep b=μ(π^{-1}), T_{μ^{-1}} and (−d/2)[−d].

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`](#excursionoperatorsandspectralaction-es7-parabolic-increasingly-unstable-sequence)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`](#excursionoperatorsandspectralaction-es7-parabolic-constant-term-computation)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`](#excursionoperatorsandspectralaction-es7-parabolic-parabolic-induction)

#### O_E classical tower diamond comparison

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/mixed-tower`.

SW20 Theorem 24.2.5 is printed for p-divisible groups over ℤ_p (E = ℚ_p). For E ≠ ℚ_p, ET.6a must use Corollary 24.3.5 for the EL data of Res_{E/ℚ_p}GL_n and of D, and identify Res_{E/ℚ_p}GL_n-shtukas with GL_n/E local shtukas, with levels, actions and Satake shifts. The full classical tower realization is imported, not source-expanded in ES7.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`](#excursionoperatorsandspectralaction-es7-gln-comparison-two-tower-realisation)

#### Order existence and division compactness proof

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/orders`.

Hausberger fixes the global maximal-order sheaf rather than proving its existence. Read the global-order gluing and function-field anisotropic reduction proofs and specialize them to PGL₁(D). Then expand finite-level kernel local finiteness/integrability and the restricted-tensor-product coefficient descent. AA.1’s current exact node is number-field only.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-maximal-orders)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-division-quotient-compactness)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-discrete-spectrum)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-kernel-trace-identity)

#### Building EP orbital/character proof sources

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/EP`.

LRS 13.2 states the formulas and cites Laumon §5 and Kottwitz Theorem 2′; those primary proofs have not been acquired. Verify the characteristic-p applicability and facet-normalizer orientations from those proofs. Expand the Schur-orthogonality/compact-induction selector normalization used in 15.10.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-function)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-orbital-integrals)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-character-traces)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-cuspidal-local-selector)

#### Simple trace formula and selected transfer proofs

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/simple-transfer`.

Read the precise Deligne–Kazhdan simple trace formula and Henniart appendix A.4 cited by LRS 15.10–15.11, and the germ-expansion/weak-approximation proof inputs. Keep a supercuspidal auxiliary place outside ramified S. No general global JL or arbitrary-isotype multiplicity-one claim fills this gap.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-simple-trace-comparison)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-globalisation)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-jacquet-langlands-transfer)

#### D-elliptic moduli proof expansion

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/moduli`.

The target-level definitions, smoothness/dimension, level rigidification and division properness are sourced, but complete Quot/Hecke transversality and boundary properness proofs of LRS §§4–6 require lemma-level expansion. The DM.7 Morita equivalence and the right-action/cohomological-left-action conventions require explicit proofs.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`](#excursionoperatorsandspectralaction-es7-equal-characteristic-d-elliptic-sheaf)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`](#excursionoperatorsandspectralaction-es7-equal-characteristic-level-structure)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`](#excursionoperatorsandspectralaction-es7-equal-characteristic-moduli-and-hecke)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`](#excursionoperatorsandspectralaction-es7-equal-characteristic-frobenius-hecke-correspondences)

#### Equal-characteristic formal-module and uniformization proof

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/local-geometry`.

Acquire Genestier or Boutot–Carayol/Drinfeld’s precise special formal O_D-module representability proof and expand Hausberger’s coordinate/Dieudonné modules, global isogeny classification and analytic comparisons. The statement’s D̄ and away-o level conditions are already fixed; no formal model at o-level is assumed. No packet owns equal-characteristic formal O-modules and their deformation theory (HS2’s local-shtuka nodes are mixed characteristic); the HS2 request asks for them. Hausberger Proposition 7.6: D_K^× acts on Ω̂^d ⊗̂ Ô^nr only through Frobenius on Ô^nr.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`](#excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-module)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`](#excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-modules)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`](#excursionoperatorsandspectralaction-es7-equal-characteristic-uniformisation)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`](#excursionoperatorsandspectralaction-es7-equal-characteristic-local-cohomology-finiteness)

#### Corrected graded local chain proof closure

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/weights`.

Kaiser’s two pages have been read in full. Connect the amended lemma to the imported Weil–Deligne carrier with geometric Frobenius and DWP.5 local weight theorem; verify the reciprocal L-factor grading and multiplicity-power conditions. For selected concentration expand the independent global genericity/strict Satake bound. Do not use the source’s unpublished invariant ample class argument. The cited R01.2 Weil–Deligne carrier is normalised by arithmetic Frobenius, while LRS and this packet use geometric Frobenius: convert explicitly. The chain lemma’s extraction of summands σ⁰(St_i) uses the classification of Frobenius-semisimple indecomposables r₀ ⊗ Sp(n), which R01.2 records as an open gap.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing`](#excursionoperatorsandspectralaction-es7-equal-characteristic-dual-isotypic-pairing)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum`](#excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-erratum)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-lemma`](#excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-graded-chain-lemma)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-proposition`](#excursionoperatorsandspectralaction-es7-equal-characteristic-kaiser-graded-chain-proposition)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`](#excursionoperatorsandspectralaction-es7-equal-characteristic-geometric-automorphic-trace)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`](#excursionoperatorsandspectralaction-es7-equal-characteristic-selected-isotypic-cohomology)

#### Independent local correspondence and constants

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/classical-local`.

Theorem-level LRS 15.10–15.17 and Hausberger 9.1–9.2 are read. Henniart’s local-constant uniqueness and numerical theorem, LRS 15.18–15.20’s numerical proof and Badulescu’s local character proof remain to be acquired/expanded. The construction stays independent of the excursion parameter. LRS Corollary 15.14 proves independence only over the globalizations of one fixed global setup (curve, x₀, x₁, ∞, D); the pair ε-factor comparison also needs Laumon’s product formula, which WC.2 does not state. Badulescu’s equal-characteristic local Jacquet–Langlands character identity is cited by function-field-automorphic/local-character-identity.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`](#excursionoperatorsandspectralaction-es7-equal-characteristic-local-correspondence-independence)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`](#excursionoperatorsandspectralaction-es7-equal-characteristic-classical-local-correspondence)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-local-character-identity)

#### Analytic quotient spectral sequence and Ext degeneration

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/analytic-HS`.

The profinite discrete-module R02.2 node is insufficient for the locally profinite analytic quotient. Supply the general derived machinery and prove the properly discontinuous Berkovich quotient application using Hausberger Appendix A.12. Expand finite-type/admissibility and the characteristic-zero injective finite-representation proof on GL_d(K)^0; generic module projectivity at the pins is insufficient.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`](#excursionoperatorsandspectralaction-es7-equal-characteristic-geometric-hochschild-serre)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`](#excursionoperatorsandspectralaction-es7-equal-characteristic-hochschild-serre-and-degeneration)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`](#excursionoperatorsandspectralaction-es7-equal-characteristic-drinfeld-carayol)

#### Equal-characteristic transport and second operation

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/equal-transport`.

Hausberger proves the Drinfeld supercuspidal realization, but the exact action-preserving identification with equal-characteristic Hecke fibres and the dual/Lubin–Tate operation need an independently read comparison source. The present HS2/HS3 packet uses mixed characteristic/Q_p. The all-E assertion of FS IX.7.4 is not a proof of these missing interfaces. FS (p. 338) cite [Boy99] (P. Boyer, Mauvaise réduction des variétés de Drinfeld et correspondance de Langlands locale, Invent. Math. 138 (1999)) for the equal-characteristic Lubin–Tate tower and [Hau05] for the Drinfeld tower; Boyer is the source to read for the first operation.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`](#excursionoperatorsandspectralaction-es7-equal-characteristic-hecke-fibre-transport)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`](#excursionoperatorsandspectralaction-es7-equal-characteristic-equal-characteristic-agreement)
- [`ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field`](#excursionoperatorsandspectralaction-es7-agreement-for-every-local-field)

#### Native signatures missing for geometric and smooth objects

Gap identifier: `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

The suggested Lean file states every node over opaque placeholder carriers named for their owning layers (reductive groups and Kottwitz sets, smooth derived categories, D_lis(Bun_G), spectral centres, adelic units of D, vector bundles with right 𝒟-action on X × S, formal O-modules, rigid compact-support cohomology). Conditions that need a missing carrier (cokernel supports and Euler characteristics of D-elliptic chains, gluing of the maximal-order sheaf, analytic properness) are omitted and named in the docstrings. Replace each carrier by its owner’s declaration when it exists.

**Consumers.**

- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`](#excursionoperatorsandspectralaction-es7-parabolic-stratum-maps)
- [`ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`](#excursionoperatorsandspectralaction-es7-parabolic-twisted-levi-inclusion)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-maximal-orders)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-euler-poincare-function)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`](#excursionoperatorsandspectralaction-es7-equal-characteristic-d-elliptic-sheaf)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`](#excursionoperatorsandspectralaction-es7-equal-characteristic-level-structure)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`](#excursionoperatorsandspectralaction-es7-equal-characteristic-moduli-and-hecke)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`](#excursionoperatorsandspectralaction-es7-equal-characteristic-frobenius-hecke-correspondences)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`](#excursionoperatorsandspectralaction-es7-equal-characteristic-special-formal-module)
- [`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`](#excursionoperatorsandspectralaction-es7-equal-characteristic-fundamental-local-representation)
- [`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`](#excursionoperatorsandspectralaction-es7-function-field-automorphic-cuspidal-local-selector)

**Layer obligations.**

`ExcursionOperatorsAndSpectralAction:ES7:parabolic`:

- normalization: Root/modulus convention comparison
- z-embedding: Quasi-split reduction in equal characteristic (no z-embedding when Z(G) is not smooth; the GL_n targets do not use it)
- HN: Quantitative modification and constant-term closure
- prototypes: Native signatures missing for geometric and smooth objects

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`:

- mixed-tower: O_E classical tower diamond comparison

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`:

- orders: Order existence and division compactness proof
- EP: Building EP orbital/character proof sources
- simple-transfer: Simple trace formula and selected transfer proofs
- classical-local: Badulescu’s equal-characteristic local character identity
- prototypes: Native signatures missing for geometric and smooth objects

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic`:

- moduli: D-elliptic moduli proof expansion
- local-geometry: Equal-characteristic formal-module and uniformization proof
- weights: Corrected graded local chain proof closure (Kaiser)
- classical-local: Independent local correspondence and constants
- analytic-HS: Analytic quotient spectral sequence and Ext degeneration
- equal-transport: Equal-characteristic transport and second operation
- prototypes: Native signatures missing for geometric and smooth objects

`ExcursionOperatorsAndSpectralAction:ES7`:

- equal-transport: Equal-characteristic transport and second operation

## Pinned library interfaces

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit is [library-coverage.json](../../../data/library-coverage.json). Existing declarations supply the following interfaces; each part-specific scope qualification is retained when the same declaration has several uses. These are imports, not targets to reimplement.

| Existing declaration | Supplied interface and limitation |
| --- | --- |
| [`mathlib:CategoryTheory.CatCenter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Center/Basic.lean) | The ordinary centre End(id), with component evaluation and naturality. It is a commutative monoid and a ring for a preadditive category. ES0 builds the enhanced degree-zero centre and its comparison; ES7 restricts the action along fully faithful stratum embeddings. The ordinary declaration alone does not supply an enhanced centre. |
| [`mathlib:CategoryTheory.CatCenter.app`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Center/Basic.lean) | **ES0:** Evaluation of a central element at an object. This is the pinned form of the distinction the roadmap insists on, between a natural endomorphism of the identity and an endomorphism of one object. |
| [`mathlib:CategoryTheory.CatCenter.naturality`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Center/Basic.lean) | **ES0:** Naturality of a central element, from which centrality follows. Already proved at the pins, so this packet does not plan it. |
| [`mathlib:CategoryTheory.Linear.toCatCenter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Center/Linear.lean) | **ES0:** `def toCatCenter [Linear R C] : R ->+* CatCenter C`, the scalar structure on the centre of an R-linear category. The Lambda-algebra structure on the Bernstein centre is this map and is not planned again. |
| [`mathlib:CategoryTheory.Functor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Functor/Basic.lean) | **ES0:** Functors. The identity functor of C, whose endomorphisms are the Bernstein centre, and the Hecke functors T_V are objects of this type. **ES7:** Ordinary functors, used for the algebraic moduli functor; no representability follows automatically. |
| [`mathlib:CategoryTheory.NatTrans`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/NatTrans.lean) | **ES0:** Natural transformations. An element of the Bernstein centre is a natural endomorphism of the identity; the pinned definition already carries the naturality that this roadmap insists distinguishes it from an endomorphism of one object. |
| [`mathlib:CategoryTheory.Preadditive`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Preadditive/Basic.lean) | **ES0:** Preadditive categories. End(id_C) is a ring because C is preadditive; the pinned class supplies that structure on hom-sets. |
| [`mathlib:CategoryTheory.CatCenter.ext`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Center/Basic.lean) | **ES0:** Equality from all object components; applies to the ordinary homotopy-category comparison only. |
| [`mathlib:Ideal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Defs.lean) | **ES0:** Left ideals as submodules; in commutative coordinate rings these give annihilator ideals. |
| [`mathlib:PrimeSpectrum`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Defs.lean) | **ES0:** Prime ideals of a commutative ring, used for reduced central support on the invariant quotient. |
| [`mathlib:PrimeSpectrum.zeroLocus`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean) | **ES0:** V(s) is the set of prime ideals containing s. |
| [`mathlib:PrimeSpectrum.mem_zeroLocus`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean) | **ES0:** Membership in V(s) iff s is contained in the prime ideal. |
| [`mathlib:PrimeSpectrum.zeroLocus_radical`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean) | **ES0:** The zero locus of the radical of an ideal equals its zero locus. |
| [`mathlib:PrimeSpectrum.zeroLocus_inf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean) | **ES0:** V(I intersect J)=V(I) union V(J), used for finite direct sums. |
| [`mathlib:PrimeSpectrum.zeroLocus_mul`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean) | **ES0:** V(I J)=V(I) union V(J), used after the exact-triangle product-ideal argument. |
| [`mathlib:RingHom.ker`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean) | **ES0:** The kernel of an evaluated central ring map is an ideal. |
| [`mathlib:RingHom.mem_ker`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean) | **ES0:** Membership in the kernel is equivalent to evaluation being zero. |
| [`mathlib:PrimeSpectrum.zeroLocus_subset_zeroLocus_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean) | **ES0:** V(I) subset V(J) iff J is contained in the radical of I, supplying the principal support/localization criterion. |
| [`mathlib:Representation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | **ES5:** A monoid homomorphism G to the algebra of linear endomorphisms of a module; smoothness, admissibility and irreducibility are additional representation-theoretic inputs. **ES7:** The abbreviation G→* (V→ₗ[R]V), with algebraic action laws; smoothness, admissibility and Weil continuity are additional supplier data. |
| [`mathlib:Representation.IntertwiningMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Intertwining.lean) | **ES5:** Equivariant linear maps between representations, including the endomorphism algebra used in the global-point prototype. This does not prove Schur’s lemma. |
| [`mathlib:MonoidHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean) | **ES5:** Bundled group homomorphisms, their composition, products, kernels and ranges. A parameter also needs the prescribed projection, semisimplicity and condensed continuity from LP0/LP2. **ES7:** Bundled monoid/group homomorphisms. Degree and inclusion are homomorphisms; a nontrivial-action 1-cocycle itself is not a group homomorphism. |
| [`mathlib:AlgHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Hom.lean) | **ES5:** Algebra homomorphisms, for excursion characters and all centre comparison diagrams. |
| [`mathlib:Condensed`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Basic.lean) | **ES5:** C-valued sheaves on CompHaus for its coherent topology. This supplies condensed algebras when C is AlgCat; it supplies neither animated enhancement nor D_lis. |
| [`mathlib:AlgCat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/AlgCat/Basic.lean) | **ES5:** The category of associative R-algebras and algebra homomorphisms, used as values of the actual condensed scalar and endomorphism algebras. |
| [`mathlib:CategoryTheory.IsIso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Iso.lean) | **ES5:** Invertibility of the scalar unit in the category of condensed algebras; Schur irreducibility is this property of a specified unit, not a chosen abstract algebra equivalence. |
| [`mathlib:Module.End`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/End.lean) | **ES5:** Linear endomorphism rings. Equivariant endomorphisms, rather than all linear endomorphisms, enter Schur’s lemma for a representation. **ES7:** The linear endomorphism type M→ₗ[R]M and its composition ring. |
| [`mathlib:CategoryTheory.Adjunction`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Adjunction/Basic.lean) | **ES5:** Unit/counit adjunctions; the enriched stratum adjunction and its invertible unit remain a VS4 input. **ES7:** Adjunctions of ordinary categories; this alone does not supply stable/lisse infinity-categories. |
| [`mathlib:TensorProduct`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean) | **ES5:** Algebraic tensor products; this is the algebraic substrate of the product-centre diagram, not an exterior-product theorem for sheaves. |
| [`mathlib:MonoidAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Defs.lean) | **ES5:** Group algebras of arbitrary discrete quotient groups T(E)/K; no finiteness of those quotients is assumed. **ES7:** Finite-support algebraic convolution on a monoid; it is not the locally profinite Hecke algebra or its completed inverse-limit centre. |
| [`mathlib:Subgroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean) | **ES5:** Subgroups including the finite-index free subgroup in the excursion-colimit comparison. **ES7:** Algebraic subgroups. Compactness, openness and the parabolic algebraic-group interpretation require additional data. |
| [`mathlib:IsFreeGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean) | **ES5:** A group with a free basis. The subgroup instance is supplied by Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean, read together with this definition. |
| [`mathlib:Subgroup.fg_of_index_ne_zero`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Schreier.lean) | **ES5:** A finite-index subgroup of a finitely generated group is finitely generated. Together with Nielsen–Schreier this supplies exactly the finite-generation/freeness input of IX.6.3; no rank formula is needed. |
| [`mathlib:groupCohomology.coindIso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean) | **ES5:** Abelian Shapiro cohomology in all degrees. The nonabelian cocycle/quotient-stack comparison in IX.6.3 is stronger and is planned at its use here, not identified with this declaration. Retained as a background contrast only, not a proof prerequisite of nonabelian Shapiro. |
| [`tauceti:TauCeti.IsSmoothDiscrete`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean) | **ES5:** A TopRep object with discrete module topology and open stabilizers. It does not supply admissibility, scalar endomorphisms or a sheaf equivalence. **ES7:** For a TopRep, discrete topology on the underlying module and open stabilizers. It does not encode continuous ℓ-adic Weil action. |
| [`tauceti:TauCeti.SmoothDiscreteTopRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean) | **ES5:** The full subcategory of smooth discrete TopRep objects. Derived enhancement and the arbitrary-coefficient Bernstein centre are imported from their respective owners. |
| [`tauceti:TauCeti.ClassFieldTheory.Formation`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ClassFieldTheory/Formation/Basic.lean) | **ES5:** The smooth discrete integral coefficient carrier for class formations. This is existing class-field-theory infrastructure, not the local Artin reciprocity isomorphism needed for tori. |
| [`mathlib:subgroupIsFreeOfIsFree`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean) | **ES5:** For a subgroup H of a group G with IsFreeGroup G, gives IsFreeGroup H, with no finite-index hypothesis. Combined with Subgroup.fg_of_index_ne_zero it supplies the finite free subgroup used in IX.6.3. |
| [`mathlib:RootPairing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean) | **ES7:** Root pairing data; it does not construct a pinned dual algebraic group or its Weil action. |
| [`mathlib:CommRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Defs.lean) | **ES7:** Commutative ring structure used for coefficient and central rings. |
| [`mathlib:CategoryTheory.MonoidalCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean) | **ES7:** Ordinary monoidal-category coherence, used as a boundary for Satake/fusion interfaces. |
| [`mathlib:DirectSum`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/DirectSum/Basic.lean) | **ES7:** Algebraic finite-support direct sums, appropriate to the component-indexed cohomology description. |
| [`mathlib:LinearMap.trace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Trace.lean) | **ES7:** Algebraic trace of a linear endomorphism (finite free specialization used here); no infinite-dimensional automorphic trace is inferred. |
| [`mathlib:Module.Free`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean) | **ES7:** Free modules over a ring. Scheme-local freeness and coherent sheaves require the geometric supplier. |
| [`mathlib:AlgebraicGeometry.Scheme`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean) | **ES7:** The native scheme carrier. Formal schemes, diamonds, moduli representability and étale cohomology are not supplied by this definition. |
| [`mathlib:MeasureTheory.Measure.modularCharacter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Group/ModularCharacter.lean) | **ES7:** Locally compact group modular character valued in ℝ≥0; compare its right-translation convention before identifying the parabolic modulus. It supplies no normalized-induction functor. |
| [`tauceti:TauCeti.Cocharacter.parabolic`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean) | **ES7:** The dynamic parabolic attached to a cocharacter in the Hopf-algebra/WithConv formulation, with its stated group-scheme assumptions. |
| [`tauceti:TauCeti.Cocharacter.levi`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean) | **ES7:** The dynamic Levi attached to that cocharacter; it is not already the dual pinned Levi or a constant-term functor. |
| [`mathlib:MulAut`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/End.lean) | **ES7:** Multiplicative automorphisms M≃*M; bundled group actions used to state the twisted cocycle identity. |
| [`mathlib:Matrix.trace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Trace.lean) | **ES7:** For a finite index type, the sum of matrix diagonal entries; this is the finite-dimensional basis form of the two-leg evaluation computation. |
| [`mathlib:CategoryTheory.Functor.FullyFaithful`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Functor/FullyFaithful.lean) | **ES7:** Fully faithful functor data with preimage; restriction of central endomorphisms along the stratum embedding uses the preimage. |
| [`mathlib:coevaluation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Coevaluation.lean) | **ES7:** coevaluation K → V ⊗ Dual V for finite-dimensional V; with LinearMap.trace this gives ev ∘ (ρ(γ₁) ⊗ ρ^∨(γ₂)) ∘ coev = tr ρ(γ₁γ₂^{-1}). |
| [`mathlib:Representation.ind`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Induced.lean) | **ES7:** Algebraic induction along a group homomorphism; for the inclusion of an open subgroup of a locally profinite group it is compact induction c-Ind, as used for P_d ⊂ GL_d(K) × D_K^× × W_K. |
| [`mathlib:Algebra.IsCentral`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Central/Defs.lean) | **ES7:** Central algebras (centre equals the base field); with IsSimpleRing and finite dimension, the central simple algebra D/F of the order data. |
| [`mathlib:Submodule.IsLattice`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Lattice.lean) | **ES7:** R-lattices: finitely generated R-submodules spanning the vector space over Frac R; an O_x-order is a subalgebra whose underlying submodule is a lattice. Mathlib has no named (maximal) order. |
| [`mathlib:Module.Invertible`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean) | **ES7:** Invertible modules (Mᵛ ⊗ M → R bijective): exactly the condition that Lie H is an invertible O_d ⊗_O B-module. |
| [`mathlib:CategoryTheory.Injective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean) | **ES7:** Injective objects of a category; the degeneration argument needs injectivity of finite (compact) representations in the smooth category, not projectivity of modules. |
| [`mathlib:CategoryTheory.Abelian.Ext`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean) | **ES7:** Ext groups in an abelian category with HasExt; the E₂ term Ext^i in the smooth category is an instance once SR.0 supplies the abelian category. |
| [`mathlib:MeasureTheory.Measure.haar`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Basic.lean) | **ES7:** A Haar measure on a locally compact group; the local volumes vol(P_I⁰), formal degrees and orbital-integral measures are normalisations of it. |

## Source corrections

Source-issue IDs are local to their packets. For example, ES0/E1 and ES7/E1 are different findings despite sharing an unqualified ID. This register therefore uses the pair **(part, original ID)** and keeps each source version and locator separate. The packet records contain the original quotations, evidence, correction searches and individual review records. The mathematical statements above use the corrected forms. A source gap is not an assertion that its theorem is false.

### ES0: ExcursionOperatorsAndSpectralAction/E1

**Misprint; affects nothing.** [FS-geometrization (ES0)](#source-es0-fs-geometrization), Author-hosted 356-page manuscript, SHA-256 9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905, printed p. 292, proof of VIII.4.1, reindexing square after VIII.4.2. Published passage unavailable..

**Correct form or missing argument.** The diagram commutes. Do not assert a cartesian square for arbitrary finite-set reindexing.

**Reason.** Take H=Q=1, W=C2, C=Vect_L and the trivial W-equivariant tensor family. End(id_C)=L and every left function ring is L. For I={1,2}, J={1}, g:I->J the fold map, the left vertical arrow is id_L; the right is diagonal restriction Map(W^2,L)->Map(W,L). Both horizontal maps send scalars to constant functions. The pullback consists of (a,f) with f(w,w)=a; off-diagonal values are arbitrary. In particular (0,f) with f(1,t)=1 and f zero elsewhere lies in the pullback but not in the image of L. Thus the square is commutative and not cartesian. Over F2 it has 8 pullback elements versus 2 source elements. The subsequent fusion proof only uses commutativity.

**Existing correction.** new

### ES5: ExcursionOperatorsAndSpectralAction/E2

**Misprint; affects nothing.** [FS-geometrization (ES5)](#source-es5-fs-geometrization), FS author-hosted 356-page PDF and arXiv:2102.13459v4, Proposition IX.6.2 display, p. 331; not checked in the full 2026 published edition..

**Correct form or missing argument.** The second factor is the geometric centre for G2.

**Reason.** The product is G1 times G2. The canonical factor map and the very next parameter sentence distinguish the two factors. Visual examination of the author PDF and separate collation with arXiv v4 show this is present in the display, not an extraction artifact.

**Existing correction.** new

### ES5: ExcursionOperatorsAndSpectralAction/E3

**Misprint; affects nothing.** [FS-geometrization (ES5)](#source-es5-fs-geometrization), FS author-hosted 356-page PDF and arXiv:2102.13459v4, Proposition IX.6.2, parameter consequence, p. 331. Full published passage unavailable..

**Correct form or missing argument.** A_i lies in D_lis(Bun_(G_i),L), for i=1,2.

**Reason.** The external product A1 external-tensor A2 is an object on Bun_(G1) times Bun_(G2)=Bun_G. Both factors on Bun_G would give an object on Bun_G times Bun_G and parameters for the wrong groups. The author PDF was visually checked and arXiv v4 collated.

**Existing correction.** new

### ES5: ExcursionOperatorsAndSpectralAction/E4

**Misprint; affects nothing.** [FS-geometrization (ES5)](#source-es5-fs-geometrization), FS author-hosted 356-page PDF and arXiv:2102.13459v4, proof of IX.6.1, paragraph following the factorization of pi_H, p. 331. Full published passage unavailable..

**Correct form or missing argument.** The group morphism has direction Gprime to G; its dual has direction Ghat to Gprimehat.

**Reason.** The theorem starts with Gprime to G. It induces the printed Grassmannian map Gr_Gprime to Gr_G and the pushforward comparison. The prose reverses that morphism while the displayed geometric maps have the correct direction. Visual inspection and arXiv v4 collation confirm the prose.

**Existing correction.** new

### ES5: ExcursionOperatorsAndSpectralAction/E5

**Misprint; affects nothing.** [FS-geometrization (ES5)](#source-es5-fs-geometrization), IX.6 closing paragraph, author PDF and arXiv v4 p. 333; full published passage not read.

**Correct form or missing argument.** Use injective z-embeddings as defined in Kaletha §5.1, with its p-adic hypotheses.

**Reason.** Kaletha Definition 5.1 and Corollary 5.3 construct an injection into a group with connected centre. A surjective z-extension with torus kernel and simply connected derived group is a different object and does not guarantee connected centre. The citation and intended application identify the nomenclature slip; extension beyond the p-adic field range is a separate blueprint gap.

**Existing correction.** new

### ES5: ExcursionOperatorsAndSpectralAction/E6

**Misprint; affects nothing.** [FS-geometrization (ES5)](#source-es5-fs-geometrization), VII.7.10 compact exterior-product clause, author PDF and arXiv v4 p. 276; full published passage not read.

**Correct form or missing argument.** The compact exterior product and generators are in D_lis(Bun_G,Λ).

**Reason.** The preceding displayed functor has D_lis source and target and the inputs are arbitrary compact lisse objects. The theorem proves compact generation of this lisse category for general Λ; an étale-torsion target cannot replace it. This is the carryover label from the parallel torsion Proposition V.7.2.

**Existing correction.** new

### ES7: ExcursionOperatorsAndSpectralAction/E1

**Error; affects the proof.** [LRS-1993 (ES7)](#source-es7-lrs-1993), Published Corollary 14.11 (p. 299), its proof (pp. 299–300), and the self-duality step in §14.16 (p. 306)..

**Correct form or missing argument.** Pair the Π-isotype with the appropriate Π∨-isotype. In 14.11 replace the second L-factor by L_x((V_Π∞^bullet)^∨,q_x^{-1}T^{-1}); use amended 14.14′ and 14.17′ in the general proof of 14.12.

**Reason.** A duality pairing on total cohomology exchanges contragredient Hecke characters; a non-self-dual automorphic representation does not give a self-dual isotype. Kaiser explicitly corrects both the dual and exponent.

**Existing correction.** Christian Kaiser, Errata for [LRS], both pages, author-hosted correction.

### ES7: ExcursionOperatorsAndSpectralAction/E2

**Gap; affects the proof.** [FS-geometrization (ES7)](#source-es7-fs-geometrization), Proof of Theorem IX.7.2, p. 335, author-hosted manuscript (SHA-256 9ab9efbd…); reduction to quasi-split G.

**Correct form or missing argument.** The step is justified for E of characteristic 0 (Kaletha’s §5 assumes F p-adic). For E of characteristic p and Z(G) not smooth (e.g. G = SL_p), no embedding G ↪ G′ with torus quotient D and Z(G′) a torus has Z(G′)(E) → D(E) surjective, so the deduction of B(G) ↪ B(G′) and of centre detection via [Kal18, Fact 5.5] needs another argument there.

**Reason.** From 1 → Z(G) → Z(G′) → D → 1 (fppf), coker(Z(G′)(E) → D(E)) ≅ ker(H¹_fppf(E, Z(G)) → H¹(E, Z(G′))). For Z(G) = μ_p in characteristic p, H¹_fppf(E, μ_p) = E^×/E^{×p} is infinite, while H¹(E, T) is finite for a torus T over a local field; so the kernel is infinite. Fact 5.5’s proof uses exactly this injectivity. In characteristic p “Z(G′) connected” does not force a torus (μ_p is connected; SL_p ↪ SL_p × G_m has connected centre μ_p × G_m and surjective Z(G′)(E) → D(E)), but the next step, a basic b₀ with G_{b₀} quasi-split via Kottwitz 10.4, needs a central torus, and for SL_p × G_m the inner form SL₁(D) is not reached.

**Existing correction.** new

### ES7: ExcursionOperatorsAndSpectralAction/E3

**Misprint; affects nothing.** [LRS-1993 (ES7)](#source-es7-lrs-1993), §13 (paragraph (13.3)–(13.5)), p. 291, published scan.

**Correct form or missing argument.** The coset space is compact (an extension of a finite group by the compact, infinite group of degree-zero idele classes), not finite.

**Reason.** The degree-zero part F^×\𝔸^1 surjects onto Pic⁰(X)(F_q) with kernel containing ∏_x O_x^×/F_q^×, which is infinite. Compactness is what the admissibility argument uses (LRS p. 299 itself writes “F^×\𝔸^×/F_∞^× is compact”).

**Existing correction.** new

### ES7: ExcursionOperatorsAndSpectralAction/E4

**Misprint; affects nothing.** [LRS-1993 (ES7)](#source-es7-lrs-1993), (14.13) and Lemma (14.14), p. 302, published scan.

**Correct form or missing argument.** The numerator factor is 1 − q_∞^{−d}T^{−1}, as in (14.16) on p. 306 and in Kaiser’s Lemma 14.14′.

**Reason.** For the chain σ⁰(St_d) with L-factor 1/(1 − T) the ratio is (1 − q_∞^{−d}T^{−1})/(1 − T); §14.16 specializes the corrected 14.11(iii) to this form.

**Existing correction.** Kaiser’s Errata for [LRS], Lemma 14.14′, states the T^{−1} form

### ES7: ExcursionOperatorsAndSpectralAction/E5

**Misprint; affects nothing.** [LRS-1993 (ES7)](#source-es7-lrs-1993), (14.16), p. 306, published scan.

**Correct form or missing argument.** The L-factor identity being specialized is Corollary (14.11)(iii).

**Reason.** The displayed ratio L_x(V•,T)/L_x(V•,q_x^{−d}T^{−1}) = A_xT^{B_x}[…]^{m(Π)} is (14.11)(iii) on p. 299; (14.10) concerns the vanishing of V^n.

**Existing correction.** new

### ES7: ExcursionOperatorsAndSpectralAction/E6

**Misprint; affects nothing.** [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Theorem 9.2(ii), p. 1335.

**Correct form or missing argument.** χ ∈ A⁰_1(K) (a character of K^× of finite order), as σ_1(χ) requires.

**Reason.** σ_1 is defined on A⁰_1(K); a twist by an element of A⁰_d(K) is not a twist by a character.

**Existing correction.** new

### ES7: ExcursionOperatorsAndSpectralAction/E7

**Misprint; affects nothing.** [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), Lemma 10.2 and the preceding sentence, pp. 1339–1340.

**Correct form or missing argument.** π ∈ A⁰_d(K): supercuspidal of GL_d(K) with finite-order central character.

**Reason.** The lemma produces Π on GL_d(A) with Π_o ≃ π; n denotes the level at o elsewhere in §10.

**Existing correction.** new

### ES7: ExcursionOperatorsAndSpectralAction/E8

**Misprint; affects nothing.** [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), §10.2, after Theorem 10.4, p. 1340.

**Correct form or missing argument.** The representation is V^{d−1}_{Π^∞} (middle degree d − 1), which has dimension d for the selected Π.

**Reason.** Theorem 10.1 (and LRS 15.12) put the d-dimensional isotypic part in degree d − 1; degree d is not the middle degree of a (d − 1)-dimensional variety.

**Existing correction.** new

### ES7: ExcursionOperatorsAndSpectralAction/E9

**Misprint; affects nothing.** [Hausberger-2005 (ES7)](#source-es7-hausberger-2005), §7.2, p. 1317.

**Correct form or missing argument.** Théorème 3.4.

**Reason.** The isogeny statement is Théorème 3.4 (p. 1303); p. 1321 cites it correctly as “théorème 3.4”.

**Existing correction.** new
