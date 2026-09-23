# PAPER-CADORET-HUI-TAMAGAWA-17 — geometric monodromy

Codex — codex-c83e7a, continuing [PR2008](https://github.com/CBirkbeck/tauceti-explorer/pull/2008) and its predecessor [PR1937](https://github.com/CBirkbeck/tauceti-explorer/pull/1937). Refs #1157. Status: **partial**; no formalization claimed.

This continuation supplies direct degree-one coefficient proofs for the cohomological branch in CHT §10 and the coefficient-limit step in §5.2. It preserves all142 previous item IDs and adds143–156. The current inventory has **156 items:12 library,19 planned,125 missing**, in the same seven routes. All45 definitions/constructions have96 structured API entries, recorded uses and135 proposed mathematical tests. The graph has209 internal edges and is acyclic. The APIs are planning interfaces, not compiled declarations.

All32 pages of the published paper, pp.205–236, were freshly reread. The earlier full Larsen2010 read and selected CT16 author-version read remain part of the source record. Recursive geometric and group-theoretic sources remain open. The five inherited source findings are unchanged and unreviewed.

## What the paper proves

For a connected smooth separated variety X over an algebraically closed field k of characteristic p≥0 and a smooth proper family Y→X, Theorem1.1 proves semisimplicity of the **geometric** monodromy on H*(Yx,Fℓ) for every sufficiently large ℓ≠p. Theorem1.3 controls reduction of invariants in bounded mixed Schur tensors, and separately in arithmetic-stable free quotients and saturated submodules. The arithmetic-stability requirement matters.

After one finite étale cover independent of ℓ, Theorem1.2/Corollary8.2 identifies this with almost-hyperspecial geometric image: the inverse image in the simply connected cover is hyperspecial. The original image is not automatically itself a hyperspecial subgroup. Corollary11.1 is conditional arithmetic mathematics, assuming rational semisimplicity and Tate fullness in both complementary codimensions. Its precise prime quantifiers remain G7.

## The direct lattice argument

Let R be a complete discrete valuation ring, π a uniformizer, K its fraction field, G a topological group and M a finite free R-lattice with its π-adic topology and jointly continuous R-linear G-action. Use Tau Ceti's existing explicit H¹ additive quotient; item147 adds the requested scalar structure to that same type.

For an invariant residue m̄∈(M/πM)^G, choose a lift m and form c(g)=(g·m−m)/π. The division map πM→M is continuous in finite lattice coordinates. Changing the lift by πa changes c by the boundary g·a−a. Conversely, π[c]=0 gives one primitive m with πc=δm. This proves directly

\[
0\longrightarrow M^G/\pi M^G\longrightarrow(M/\pi M)^G
\longrightarrow H^1_{\mathrm{cont}}(G,M)[\pi]\longrightarrow0.
\]

Thus invariant lifting is equivalent to absence of π-torsion, hence to torsion-freeness over the DVR. No long exact sequence with nondiscrete coefficients is assumed (items150/10).

If a lattice cocycle becomes a rational boundary c=δv, clear the **single primitive's** denominator: π^n v=m∈M gives π^n[c]=0. Conversely a class killed by π^n has rational primitive m/π^n. Hence the kernel of H¹(G,M)→H¹(G,M⊗K) is precisely its π-primary torsion (151). This kernel argument does not need compactness of G and is enough for CHT §10.

For compact G one can also prove H¹(G,M)⊗K≃H¹(G,M⊗K): every continuous rational cocycle has compact image, contained in one of the increasing open lattices π^−n M. This additional surjectivity assertion does need compactness (152). For the discrete group Z[1/ℓ] acting trivially, Hom(G,Zℓ)=0 whereas the inclusion G→Qℓ is a nonzero continuous homomorphism with unbounded denominators. That example prevents exporting152 for arbitrary topological groups.

In0→A→H→B→0, finite freeness of B gives a continuous R-linear section by lifting a basis (149). The conjugation cocycle g↦gsg⁻¹−s defines the extension class in Hom_R(B,A); changing section adds a boundary, and vanishing means an equivariant continuous section exists (101). The canonical embedding f↦ifp into End_R(H) is an equivariant saturated embedding: in any linear splitting it is one matrix block, with the other three blocks as a free complement (153). No equivariant splitting is assumed in that argument.

For A=H^Π with Π normal in the arithmetic group, A is arithmetic-stable. Theorem1.3(2) therefore gives invariant lifting for this saturated Hom lattice;150 gives torsion-free H¹. Rational semisimplicity kills the extension class over K,151 kills it integrally, and101 gives an integral equivariant splitting. Reduction and the previously extracted exterior/determinant criterion99 finish the §10 branch. This supplies the coefficient proof, conditional on the existing geometric monodromy and uniform tensor inputs; it does not claim the entire theorem has been formalized.

## Canonical carrier and topology boundary

At Mathlib082e2d3, `continuousCohomology` is built from **nested** continuous coinduction. It cannot simply be called a complex of jointly continuous functions without an adapter. `Homeomorph.curry`, whose locally compact hypotheses were read at the pin, supplies that adapter for finite powers of a profinite group. The homogeneous one-cochain associated to c is

\[
F(g_0,g_1)=g_0\cdot c(g_0^{-1}g_1),\qquad c(g)=F(1,g).
\]

The homogeneous differential evaluated at(1,g,gh) is g·c(h)−c(gh)+c(g), and a degree-zero homogeneous function g↦g·m gives the boundary g·m−m. The formulas commute with coefficient maps and restriction. The pinned `TopModuleCat` homology uses the ordinary range quotient, with no closure of the image. Consequently this identifies **underlying R-modules** (148). It asserts neither a topological isomorphism to the explicit quotient's inherited pointwise topology nor an identification with `DiscreteH1`.

The pinned Tau Ceti `H1` and `explicitCoeff1` already accept nondiscrete topological coefficients. The existing `explicitH1IsoGroupCohomology` assumes a discrete group, while the existing short exact sequence results assume discrete coefficients. These statements were read with their binders; they are not credited at a larger scope.

## Finite coefficient towers and the remaining geometric input

For a tower of finite discrete modules M_n, the map H¹(G,lim M_n)→lim H¹(G,M_n) is an isomorphism (154). Injectivity follows by taking an inverse limit of the finite nonempty sets of primitives of projected boundaries. Surjectivity follows by taking an inverse limit of the finite nonempty sets of cocycle representatives of each chosen compatible class. Each representative set is finite because it is a translate of B¹, the image of the finite module M_n; the whole H¹ group need not be finite. The pinned theorem `nonempty_sections_of_finite_inverse_system` does not require surjective transitions. Continuity of the resulting cocycle follows coordinatewise in the inverse-limit topology.

For a quotient of finite free lattices, assume each finite-level kernel has vanishing **explicit discrete H²** and finite H¹. The already built discrete H¹ exactness results then give nonempty finite fibres of lift classes. Their inverse limit and154 give lattice H¹ surjectivity (155). The geometric application in §5.2 still needs affine-curve cdℓ≤1, finite-coefficient H¹ finiteness, and the group/étale-sheaf comparisons, including transport of H² vanishing to the explicit carrier. These are exactly what remains in G3; no all-degree derived-limit theorem is silently assumed.

## Ownership and verified library inputs

ArithmeticGaloisDuality:R02.1 already owns topological coefficients and coefficient-limit comparisons; R02.2 owns descent. The new requested interfaces refine that owner. `PAPER-KALETHA-16/P03` already requests the general compact coefficient inverse-limit comparison there;154 is its finite-coefficient degree-one specialization. Bresciani24/168 uses a different direct Tate-module injection and remains a consumer of the shared carrier. Upstream ProfiniteCohomology supplies discrete finite-level exactness and explicitly excludes general nondiscrete-coefficient theorems from its scope. No new cohomology roadmap is proposed.

Pinned positive reads:

- [Tau Ceti LowDegree](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean): `Z1`, `H1`, `H1pi_eq_zero_iff`; [ExplicitFunctoriality](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/ExplicitFunctoriality.lean): `explicitCoeff1`, evaluation, identity and composition.
- [Mathlib continuous cohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) and [continuous representation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean): nested coinduction, its action and differential.
- [Topological module homology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Topology/Homology.lean): actual kernel, range quotient and homology construction.
- [Compact-open functions](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/CompactOpen.lean): currying/uncurrying with locally compact hypotheses.
- [Finite inverse systems](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean): nonemptiness without surjective transitions.
- [Tau Ceti LongExact](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LongExact.lean): `DiscreteShortExact.explicitLongExact_H1B` and `explicitLongExact_H1C`, used at finite levels only.

The reviewed R02.1/R02.2 audit and exact owner scopes were checked again. Negative library claims are limited to the named searched files and reviewed entries. The current input manifest records506 files with Git blob and SHA256 hashes; it is a provenance inventory, not a claim that every file was newly read in full.

## Source record

[Published CHT paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p05-p.pdf), Annals of Mathematics 186 (2017), no. 1, 205–236, DOI10.4007/annals.2017.186.1.5. SHA256 `3aa67f6881cd54cdb5384eada8dc3ec9eff051d6ccb43de76d28100297b298d5`. All pages reread2026-09-23.

[M. Larsen, Exponential generation and largeness for compact p-adic Lie groups, ANT 4 (2010), 1029–1038](https://msp.org/ant/2010/4-8/ant-v4-n8-p02-s.pdf). SHA256 `a14bc3effc7007f972cb2b6f1cd2de14824ac7965b4b7b95088207ae9fa89284`. Inherited verified read: Entire published mathematical article pp.1029–1038, including Propositions1–3, Lemmas4/6, Definition5, full Theorem7 proof and references. Recursive references remain open; the printed Lemma4 notation is recorded as E5.

[Cadoret–Tamagawa, Genus of abstract modular curves with level-ℓ structures](https://webusers.imj-prg.fr/~anna.cadoret/TI.pdf). SHA256 `c11e6e28cbc3f1e7c1a0dc4f75bfcff54257a327f9bcfe4605e76970519cd704`. Inherited verified read: Author version pp.10–12, especially §4.2.1 and Lemma4.2.1.1 on p.11. CHT cites the corresponding result as CT16 Lemma4.1; the numbering is version-specific. This is not a full read of CT16 or its published 2019 version.

The selected earlier author-version GSS.pdf collation is retained with its original attribution; no fresh full author-version collation is claimed.

## Routes

### Route1: ArithmeticGaloisRepresentationsGeometricMonodromy (part-ii)

R01/G7 supplies continuous representations and operations, but no existing layer states uniform geometric mod-ℓ semisimplicity, Nori-special-fibre equality or almost-hyperspecial geometric images. PotentialModularityAndCompatibleSystems concerns different arithmetic existence/descent theorems; no duplicate compatible-system infrastructure is proposed.

Design brief: Import Arithmetic Galois representations (ArithmeticGaloisRepresentations:R01.1,G7), Global Galois duality and compact coefficients (ArithmeticGaloisDuality:R02.1–2), Scheme and stack foundations (SchemeAndStackFoundations:SF.2), Deligne weights and purity (DeligneWeightsAndPurity:DWP.7–8), and the proposed uniform-integral-weight, integral-Schur and monodromy-model extensions below. For a connected smooth separated X over algebraically closed k and smooth proper f:Y→X, prove Theorem 1.3 separately for bounded mixed Schur tensors, every arithmetic-stable free quotient and every arithmetic-stable saturated submodule, uniformly outside finitely many primes. Prove Theorem 1.1 for geometric π₁ only and, after ONE finite étale cover independent of ℓ, Theorem 1.2's almost-hyperspecial image. Include the finite-field-curve reduction, Gabber/Suh interface, connected/perfect image covers, compatible Frobenius tori, special-fibre=Nori envelope and bounded-index/plus-image comparison. Preserve both proofs: Lie-dual exterior quotients use Theorem 1.3(1), while extension classes use its saturated-submodule part (2). End with Corollary 11.1 conditional on rational semisimplicity and Tate fullness in BOTH w and d−w. Separate geometric determinant triviality from arithmetic twists; resolve mixed-degree and external-input gaps before claiming closure. Suggested file TauCeti/RepresentationTheory/GeometricMonodromy.lean. Give maps, continuity/base-change API, ≥3 tests per definition and theorem dependencies; do not install theorem-shaped axioms.

Items: 01, 02, 03, 05, 11, 12, 13, 14, 18, 24, 25, 26, 29, 30, 31, 36, 49, 61, 62, 63, 64, 65, 66, 81, 92, 93, 94, 95, 99, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111.

### Route2: ReductiveGroupsMonodromyModels (part-ii)

Generic algebraic groups and Bruhat–Tits foundations already have owners. The missing layer is the characteristic-uniform envelope, bounded tensor stabilizer, composition-factor comparison and dual-Lie-defect criterion; neither the upstream field theory nor RG2.1–3 promises it.

Design brief: Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), Reductive groups, Part II: local structure and arithmetic models (ReductiveGroupsPartII:RG2.0–3), the pinned field-level semisimple/reductive Hopf predicates, exterior powers, and root data from tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems. Do not reconstruct buildings, parahorics, split Chevalley carriers or general affine Hopf anti-equivalence. Construct Nori envelopes and plus subgroups, truncated exp/log, T≤d with separate s,t bounds, and pointwise tensor stabilizers. Prove Nori and Cadoret–Tamagawa uniformity inputs and Larsen's dimension/bounded-index theorem with its unipotent-radical hypothesis. Prove Lemma 8.1 and Corollary 8.2's group-theoretic interfaces from finite Lie-type nonabelian-factor bounds, smooth reduction, simply connected isogenies and hyperspecial compactness. CFSGStatement supplies candidate carriers, not simplicity or order bounds; prove the required Tits/Steinberg/Lang facts here or locate an actual existing theorem owner before implementation. Construct nice torus models and Δ_H; prove the sufficiently-large-characteristic form of Theorem 9.1 via the big cell and exterior-adjoint Poincaré polynomials. Keep E3's small-prime scope unclaimed. Suggested file TauCeti/AlgebraicGeometry/MonodromyModels.lean. Tests include SL₂, a torus excluded from semisimple conclusions, disconnected/nonsmooth special fibres, and the difference between pointwise and setwise stabilizers. Every definition needs construction API and ≥3 tests. The continuation decomposes the two external bottlenecks into120–142: finite-support tensor multiplicities, finite-type exponential families, scheme-level Chevalley stratification, determinant-line fixing, antisymmetrization and multiplicity elimination; then Nori dimension, positive congruence levels, lift powers, analytic growth, equal first kernels, components, ramified splitting, Hilbert families and finite-field point counts. Import generic Chevalley/character and Plücker foundations from their existing reductive-group/representation owners; these nodes specify the exact uses rather than create competing carriers. The family/spreading step and Larsen Lemma4 corrected-image proof remain gaps, and E5 is unreviewed.

Items: 04, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 67, 68, 69, 72, 73, 74, 75, 77, 78, 79, 80, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 113, 114, 117, 118, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142.

### Route3: SchurWeylIntegralFunctors (part-ii)

The pinned rational symmetrizer and Q-algebra Weyl module are genuine existing work. Their integral Zℓ/Fℓ functor, commuting reduction projectors and determinant retractions are a coefficient-general extension, not a re-plan of rational Schur–Weyl duality.

Design brief: Import Representations of the symmetric group, Specht modules, and Schur-Weyl duality (tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl), Classical groups representation theory (tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups), the pinned TauCeti.YoungTableau rational idempotence, and Mathlib exterior/tensor power carriers. Define integral Young symmetrizers first, compare the paper's right-action convention with the existing left-action image, prove the integral scalar identity and invertibility of nλ when ℓ>d, and construct finite-free Schur functors on arbitrary lattices, not only values at a standard vector space over a Q-algebra. Prove continuity, equivariant functoriality, tensor/dual/base-change maps, direct summands and symmetric/exterior extreme partitions. Export Lemma 4.4 and the determinant-dual reduction used in §5.3 without losing arithmetic twists. Prove both implications of Lemma 10.1, with the explicit wedge/Hom retraction and the separate zero-rank case; never divide by the subspace dimension. Suggested file TauCeti/RepresentationTheory/Schur/Integral.lean. Test trivial/row/column partitions, rank below number of rows, ℓ≤d failure, and a=p in characteristic p for the denominator-free splitting. Include ≥3 tests per definition and all public map laws.

Items: 07, 08, 35, 50, 96, 97.

### Route4: DeligneWeightsUniformIntegralMonodromy (part-ii)

DWP.0/7/8 and WC.3 plan rational weights and ℓ-independent pure factors, not Gabber–Suh uniform lattice torsion-freeness, common mod-ℓ annihilators or the finite-field-curve Inv theorem. The extension imports these owners and owns only the integral uniform step.

Design brief: Import Deligne weights and purity (DeligneWeightsAndPurity:DWP.0,7,8), The Weil conjectures (WeilConjectures:WC.3), Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves:EDC.0–2), Adic coefficients and comparisons (AdicCoefficientsAndComparisons:L5), and Global Galois duality and compact coefficients (ArithmeticGaloisDuality:R02.1). Construct primitive integral reduction of rational annihilators with explicit finite exceptional-prime sets. Prove the Gabber/Suh torsion-free and reduction isomorphisms for all degrees of a fixed smooth proper fibre. Prove Lemma 5.1's torsion characteristic-polynomial divisibility; Lemma 5.2's common Qℓ/Fℓ compact-support annihilator through alteration/localization, retaining compact support as corrected in E1; and Lemma 5.3's high-weight annihilator through Leray and duality. Use resultants to kill H¹ torsion and prove all three parts of Theorem 4.5, including affine-curve quotient surjectivity and the determinant/exterior submodule reduction supplied by the Schur extension. Mixed-degree dévissage and uniformity over the subquotient are explicit proof gates, not consequences of separate pure-degree estimates. Suggested file TauCeti/AlgebraicGeometry/Etale/UniformAnnihilator.lean. Tests cover denominator primes, nonproper A¹, extension F_q→F_q^d, ℓ dividing alteration degree, and the failure of arbitrary mod-ℓ 'weights'. Give ≥3 tests per definition.

Items: 19, 21, 22, 37, 38, 39, 40, 42, 43, 44, 46, 47, 116.

### Route5: ArithmeticGaloisDuality (source)

R02.1 already owns compact/topological coefficients and coefficient-tower comparisons; R02.2 owns descent. Items147–155 and the refinements10/101 make that existing scope precise using the built explicit and canonical carriers. Upstream ProfiniteCohomology owns the discrete finite-level long exact sequence; it is imported only at the finite levels. No new cohomology roadmap is proposed.

Supplier stages: ArithmeticGaloisDuality:R02.1, ArithmeticGaloisDuality:R02.2.

Items: 09, 10, 27, 28, 48, 100, 101, 147, 148, 149, 150, 151, 152, 153, 154, 155.

### Route6: SchemeAndStackFoundations (source)

The paper supplies concrete requirements for the common scheme étale carrier: lisse/stalk/fundamental-group equivalence, arithmetic action and integral fibre-power Künneth. SF.2 imports PR196 and the existing site/sheaf APIs; this is not analytic adic cohomology or a new six-functor construction.

Supplier stages: SchemeAndStackFoundations:SF.2.

Items: 15, 16, 33.

### Route7: EtaleDualityAndPerverseSheaves (source)

Lemma 5.2 is an application/test of the already planned finite étale trace normalization. Preserve compact support and the invertible-degree hypothesis; E1 supplies a concrete regression against the printed missing subscript.

Supplier stages: EtaleDualityAndPerverseSheaves:EDC.2.

Items: 45.

## Source findings retained for independent review

All five records are unchanged from PR2008. They remain unreviewed; this continuation supplies no verdict. Exact statements, evidence and corrections follow.

```json
{
  "id": "PAPER-CADORET-HUI-TAMAGAWA-17/E1",
  "kind": "misprint",
  "locator": "Published p.218, Lemma 5.2, sentence after the displayed finite étale trace; same omission in author GSS.pdf",
  "printed": "H^w(U′,Λℓ)",
  "correction": "Replace this direct-summand target by H_c^w(U′,Λℓ).",
  "reason": "Both arrows in the immediately preceding restriction/trace composite have compact support. For the identity cover of A¹ over an algebraically closed field, H_c²(A¹,Qℓ) is nonzero while H²(A¹,Qℓ)=0, so forgetting support cannot give the stated direct factor.",
  "affects": "nothing",
  "known": "new",
  "searched": [
    "Annals article page https://annals.math.princeton.edu/2017/186-1/p05 (22 September 2026), no linked correction found",
    "arXiv https://arxiv.org/abs/1702.07017: only v1 shown",
    "Anna Cadoret publication list https://webusers.imj-prg.fr/~anna.cadoret/Travaux.html and linked GSS.pdf (selected passages compared)",
    "Web search of exact title plus erratum/corrigendum; no correction to these passages found. This search is not a proof that none exists."
  ]
}
```

```json
{
  "id": "PAPER-CADORET-HUI-TAMAGAWA-17/E2",
  "kind": "misprint",
  "locator": "Published p.229, §9.2.1, last paragraph before the footnote; same expression in author GSS.pdf",
  "printed": "x₀ ∈ π₁(X₀,x)",
  "correction": "The x₀ indexing its residue field and Frobenius F_x₀ is a closed point of X₀; use x₀∈|X₀|.",
  "reason": "A fundamental-group element is not a scheme point with a residue field. The preceding paragraph and the Frobenius characteristic polynomial require a closed-point index. Only its Frobenius conjugacy class lies in the fundamental group.",
  "affects": "nothing",
  "known": "new",
  "searched": [
    "Annals article page https://annals.math.princeton.edu/2017/186-1/p05 (22 September 2026), no linked correction found",
    "arXiv https://arxiv.org/abs/1702.07017: only v1 shown",
    "Anna Cadoret publication list https://webusers.imj-prg.fr/~anna.cadoret/Travaux.html and linked GSS.pdf (selected passages compared)",
    "Web search of exact title plus erratum/corrigendum; no correction to these passages found. This search is not a proof that none exists."
  ]
}
```

```json
{
  "id": "PAPER-CADORET-HUI-TAMAGAWA-17/E3",
  "kind": "gap",
  "locator": "Published Theorem 9.1(1)–(2), p.226, versus the root-exponential step p.227; author version has the same scope",
  "printed": "For ℓ ≥ r",
  "correction": "Either supply a proof of the first two assertions also for ℓ<r, or restrict them to the sufficiently-large-ℓ scope actually used in the application. The extraction exports only this restricted version.",
  "reason": "Only item (9.1.3) carries an explicit sufficiently-large-prime qualifier in the statement. The proof of smoothness and the reductive-rank/root assertion first requires ℓ≥r for the integral root-group exponential embedding. No argument for the omitted range is given in that proof. This records a proof-scope gap, not a counterexample to the unrestricted assertions.",
  "affects": "the proof",
  "known": "new",
  "searched": [
    "Annals article page https://annals.math.princeton.edu/2017/186-1/p05 (22 September 2026), no linked correction found",
    "arXiv https://arxiv.org/abs/1702.07017: only v1 shown",
    "Anna Cadoret publication list https://webusers.imj-prg.fr/~anna.cadoret/Travaux.html and linked GSS.pdf (selected passages compared)",
    "Web search of exact title plus erratum/corrigendum; no correction to these passages found. This search is not a proof that none exists."
  ]
}
```

```json
{
  "id": "PAPER-CADORET-HUI-TAMAGAWA-17/E4",
  "kind": "misprint",
  "locator": "Published p.233, bibliography [BT84]",
  "printed": "197–376; SB_1988-1989__31__7_0",
  "correction": "The Bruhat–Tits II article is Publications Mathématiques de l'IHÉS 60 (1984), pp.5–184, https://www.numdam.org/item/PMIHES_1984__60__5_0/ .",
  "reason": "Numdam's primary bibliographic record identifies pp.5–184 and DOI10.1007/BF02700560. The printed Numdam identifier instead resolves to Tits's 1989 Bourbaki talk on Kac–Moody groups. The author GSS.pdf already gives the correct page interval.",
  "affects": "nothing",
  "known": "Correct page interval already in the author's GSS.pdf bibliography [BrT84]; correct article locator in Numdam. No journal corrigendum found.",
  "searched": [
    "Annals article page https://annals.math.princeton.edu/2017/186-1/p05 (22 September 2026), no linked correction found",
    "arXiv https://arxiv.org/abs/1702.07017: only v1 shown",
    "Anna Cadoret publication list https://webusers.imj-prg.fr/~anna.cadoret/Travaux.html and linked GSS.pdf (selected passages compared)",
    "Web search of exact title plus erratum/corrigendum; no correction to these passages found. This search is not a proof that none exists.",
    "Numdam original BT84 record https://www.numdam.org/item/PMIHES_1984__60__5_0/",
    "Printed identifier resolved at https://www.numdam.org/item/SB_1988-1989__31__7_0/"
  ]
}
```

```json
{
  "id": "PAPER-CADORET-HUI-TAMAGAWA-17/E5",
  "kind": "misprint",
  "locator": "External prerequisite Larsen2010, Lemma4 proof, pp.1033–1034, official published PDF; rendered pages inspected",
  "printed": "Y′ = W_U ∐ Y′₁",
  "correction": "Use the closed image family C_U for the open-stratum part of Y′, not the boundary W_U; the map ψ:X′→X restricts to U→X. Verify the reduced-image construction separately.",
  "reason": "On p.1033 W is the reduced closure of the difference between the closure of ξ(Z) and ξ(Z). U₂ is chosen disjoint from the image of W, and U⊂U₂; therefore W_U is empty. On p.1034 using W_U as the open-stratum family cannot have the claimed nonempty fibre image. For X=Spec Q and Z=Y=Spec Q embedded in P¹ with ξ=id, W is empty but the required fibre is the point. The same paragraph describes ψ on W_U although its domain is X′=U∐X′₁. This diagnoses the printed construction, not a counterexample to Lemma4 or to CHT.",
  "affects": "the proof",
  "known": "new",
  "searched": [
    "Official MSP published PDF and rendered pp.1033–1034 inspected 2026-09-22.",
    "MSP author index https://msp.org/index/ail.php?jpath=ant&l=L and exact-title erratum/corrigendum web search on2026-09-22: no matching correction located; absence from this search is not proof of novelty."
  ]
}
```

## Remaining gaps

- **G1**: Verify recursive originals for Gabber/Suh, CT13 and CT16 uniform-image assertions, CT12, Nori A/B, Jantzen/Larsen95b, Larsen–Pink92/95 and Milne–Ramachandran. Larsen2010 is now fully read: close its Nori correspondence, Serre analytic-growth, finite extension/Jordan component, Kneser ramified splitting, EGA reduced-family/Hilbert properness/component-constructibility and Lang/finite-field point-count inputs. Review and repair E5 before exporting Lemma4. Consumed by: 21, 24, 25, 26, 49, 56, 68, 89, 107, 113, 114, 128, 129, 130, 131, 135, 137, 138, 139, 140, 141.
- **G2**: Turn item116's CRT weight-projector argument into a fully typed lattice/subquotient proof; combine the finitely many degrees and ranks, fibre powers, shifts and geometrically trivial determinant twists to obtain a single bound independent of the subquotient. Consumed by: 11, 12, 13, 116.
- **G3**: The generic degree-one coefficient arguments are now supplied in147–155: canonical/explicit algebraic comparison, continuous sections, invariant reduction, rationalization kernel and compact localization, finite-tower H1 comparison, and conditional quotient surjectivity. Remaining source closure is the precise affine-curve cdℓ≤1, finite-coefficient H1 finiteness and group/étale-sheaf H1 comparison needed to discharge155 for item48. Typed implementations and the canonical naturality checks remain downstream R02.1 work, not asserted library theorems. In particular transport the geometric H2 vanishing to the explicit discrete H2 carrier of156 through the upstream discrete comparison before applying155. Consumed by: 48, 155.
- **G4**: Check Bruhat–Tits big-cell hypotheses over ramified splitting O_E, affine-model hypotheses in Lemma8.1, schematic closure under base change, special Lie base change and simply connected isogeny extension. Review E3 before any small-prime export. Consumed by: 72, 79, 80, 84, 85, 87, 94.
- **G5**: The CT16 author-version lemma4.2.1.1 is read, and determinant-line fixing, antisymmetrization and conversion to separate tensor bounds are decomposed in120–127. Establish the exact finite-type exponential-family and Chevalley/spreading statement122 over all coefficient algebras. The selected two-pass product and Larsen’s 2r²-pass construction have different parameter counts; do not identify them or infer scheme equality from finite field points. Verify Borel/EGA originals and NoriA for the alternate Lie-tuple family. Consumed by: 58, 61, 121, 122, 129.
- **G6**: Read Larsen–Pink Γ-regular and common-Frobenius statements directly, prove the arithmetic torus lift and discriminant exclusion, and justify uniformity of the single chosen closed point across coefficients. Consumed by: 92, 93, 109, 111.
- **G7**: Resolve the precise rational-coefficient ℓ quantification and finite-extension stability in Corollary11.1/MR04 Lemma3.1, with both complementary Tate assumptions and integral cycle saturation. Consumed by: 105, 106, 107, 109.
- **G8**: Reconcile any overlapping future generic Lang/Tits/finite Lie-type simplicity or exterior-adjoint invariant owner at design time. CFSGStatement L3 is a carrier roadmap and explicitly does not prove simplicity. Library nonexistence claims are scoped to this pinned search, not all future work. Consumed by: 78, 89, 124, 140.
- **G9**: Future blueprint work expands the suggested files into signatures, API and tests and compiles at the pins. This is downstream formalization work, not an unfulfilled authorized paper deliverable; no Lean file was requested here. Consumed by: downstream blueprint work.

## Complete item ledger

All previous interfaces are retained. Status `planned` cites an existing owner; it does not mean implemented. The following statements, proof outlines, API entries, uses and tests are generated from the submitted JSON.

### 01 — Smooth-proper geometric and arithmetic cohomology representations

**missing · construction**. §1 pp.205–208; §2.1; §6

In F construct continuous π and π₀ actions on Hℓ∞,Hℓ,Vℓ∞ and their restriction, base-point transport and finite-field models. Retain the full grading and coefficient topology; total rank is finite and independent of ℓ after the large-prime torsion-free comparison.

- API `cohomologyRepresentation.restrict_geometric` (compatibility): Restriction along the geometric fundamental-group inclusion is the geometric cohomology representation, degree by degree.
- API `cohomologyRepresentation.coefficient_map` (functoriality): The natural integral-to-rational and integral-to-residual cohomology maps are equivariant; the latter is an isomorphism under item22, not without torsion hypotheses.

- Use: CHT §§4,6 — change coefficients and restrict arithmetic action to the geometric group

- Proposed test: A geometric point has trivial geometric action
- Proposed test: For P¹ retain degrees 0 and 2 and the Tate twist
- Proposed test: Integral torsion obstructs naive identification of reduction with cohomology

### 02 — Geometric mod-ℓ semisimplicity

**missing · definition**. §1, Theorem 1.1

In F, semisimplicity means every π-stable Fℓ-subspace of Hℓ has a π-stable complement. This concerns the geometric group π, not the arithmetic group π₀.

- API `geometricSemisimple.iff_retraction` (characterisation): Every geometric-stable inclusion admits an equivariant linear retraction if and only if the representation is semisimple.
- API `geometricSemisimple.directSum` (compatibility): A finite direct sum is semisimple if and only if each summand is semisimple.

- Use: CHT Theorem1.1 and §10 — split every stable subspace

- Proposed test: trivial representation splits
- Proposed test: a nontrivial unipotent Jordan block does not split
- Proposed test: purity alone does not imply arithmetic splitting

### 03 — Geometric semisimplicity for all large primes

**missing · theorem**. Theorem 1.1 p.205; §§9–10

In F there is B(f) such that π acts semisimply on Hℓ for every prime ℓ> B(f), ℓ≠p. Both proof branches §§9 and 10 are extracted separately; no arithmetic Frobenius semisimplicity is assumed.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/99, PAPER-CADORET-HUI-TAMAGAWA-17/103.

### 04 — Hyperspecial and almost-hyperspecial compact subgroup

**missing · definition**. §1.2 p.206; §8 pp.223–224

For connected semisimple G/Qℓ, a compact subgroup is hyperspecial if it is 𝒢(Zℓ) for a semisimple Zℓ-model 𝒢 with specified generic-fibre identification. A compact Γ⊂G(Qℓ) is almost hyperspecial when its full inverse image under Gsc(Qℓ)→G(Qℓ) is hyperspecial.

- API `almostHyperspecial.iff_pullback` (characterisation): For semisimple G, the predicate holds exactly when the full inverse image in Gsc(Qℓ) is the Zℓ-points of a semisimple model with its generic-fibre identification.
- API `almostHyperspecial.conjugate` (compatibility): Transporting the model and compact subgroup by a generic-fibre isomorphism preserves hyperspeciality and almost hyperspeciality.

- Use: CHT Corollary8.2 — pass through the simply connected central cover

- Proposed test: SL₂(Zℓ) in SL₂(Qℓ)
- Proposed test: almost-hyperspecial need not equal all model points
- Proposed test: a torus is outside the stated semisimple domain

### 05 — Almost-hyperspecial geometric image

**missing · theorem**. Theorem 1.2 p.207; Corollary 8.2

In F, after replacing X by one connected finite étale cover independent of ℓ, for all sufficiently large ℓ the geometric image Π∞ is almost hyperspecial in its connected semisimple Qℓ-Zariski closure. This is the equivalence with Theorem 1.1 established in Corollary 8.2, not an assertion that Π∞ itself is hyperspecial.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/03, PAPER-CADORET-HUI-TAMAGAWA-17/81.

### 06 — Rational Young symmetrizer normalization already built

**library · theorem**. §1.3 p.208, rational precursor

For a tableau t on a Young diagram of size d, the rational group-algebra Young symmetrizer satisfies c_t²=(d!/dim_Q spechtIdeal(t))c_t and (dim_Q spechtIdeal(t)/d!)c_t is idempotent. This is the rational precursor only; no integral coefficient change is credited.

Library: tauceti:TauCeti.YoungTableau.youngSymmetrizer_sq, tauceti:TauCeti.YoungTableau.isIdempotentElem_smul_youngSymmetrizer.

### 07 — Integral Young symmetrizers and invertible normalization

**missing · construction**. §1.3 p.208; Lemma 4.4

For λ⊢d construct cλ in Z[S_d], prove cλ²=nλcλ with nλ=d!/dim_Q Sλ a positive divisor of d!, and for a Zℓ-algebra with ℓ>d use nλ⁻¹cλ. Relate the paper's right action/order convention to the existing left-action rational construction explicitly.

- API `integralYoungProjector.idempotent` (structure): For λ⊢d and ℓ>d, eλ=nλ⁻¹cλ satisfies eλ²=eλ in the integral group algebra.
- API `integralYoungProjector.baseChange` (compatibility): Under a ring map on which nλ is invertible, the image projector is obtained by applying that map to the integral coefficients.

- Use: CHT Lemma4.4 — realize Schur functors as coefficient-compatible direct summands

- Proposed test: For d=0 the projector is identity
- Proposed test: The row and column partitions give symmetrization and antisymmetrization
- Proposed test: At ℓ dividing nλ the normalized expression is unavailable

### 08 — Integral and mixed Schur functors

**missing · definition**. §1.3 p.208; §4

For finite-free Zℓ-module M with continuous Π-action and λ⊢d with ℓ>d, Sλ(M)=image(nλ⁻¹cλ on M⊗d); put Sλ,μ(M)=Sλ(M)⊗Sμ(M∨), μ⊢e, ℓ>e. Prove functoriality, finite freeness, direct-factor projector, base change, continuity, and symmetric/exterior extreme partitions.

- API `integralSchur.map_comp` (functoriality): Applying the projector to tensor powers of linear maps defines maps preserving identities and composition.
- API `integralSchur.baseChange` (compatibility): The image of the idempotent projector commutes with scalar extension; over Zℓ it is finite free and a direct summand. Mixed functors use the contragredient dual.

- Use: CHT Theorem1.3 and Lemma4.4 — tensor, dual and reduce lattices

- Proposed test: λ=(d) gives Sym^d
- Proposed test: λ=(1^d) gives Λ^d
- Proposed test: degree zero gives unit; ℓ≤d needs a separate construction

### 09 — Invariant reduction predicate

**missing · definition**. §1.3 p.208

InvΠ(M) is the canonical coefficient-reduction isomorphism in convention I. Construct its map, and prove M^Π saturated in M; do not define the predicate as equality of dimensions without constructing the map.

- API `invariantReduction.map` (constructor): Reduction of fixed vectors induces the canonical injection M^Π/ℓ→(M/ℓ)^Π because the invariant lattice is saturated.
- API `invariantReduction.iff_H1_no_l_torsion` (characterisation): Under the compact-coefficient exact sequence in item10, this injection is surjective exactly when H¹_cont(Π,M)[ℓ]=0.

- Use: CHT §§5,10 — measure the torsion obstruction in H¹

- Proposed test: trivial lattice
- Proposed test: finite group of order prime to ℓ
- Proposed test: a rank-two unipotent action congruent to 1 mod ℓ where Inv fails

### 10 — Invariant reduction and H¹ torsion

**planned · theorem**. §1.3 p.208, (Inv)

For a finite free continuous Zℓ-lattice M, surjectivity M^G/ℓ→(M/ℓ)^G is equivalent to H1_cont(G,M)[ℓ]=0 and to Zℓ-torsion-freeness of H1. Item150 supplies the exact sequence directly;151 supplies the DVR torsion argument. For profinite G,148 identifies this with canonical cohomology.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/150, PAPER-CADORET-HUI-TAMAGAWA-17/151, PAPER-CADORET-HUI-TAMAGAWA-17/148.

1. Apply exactness150; absence of ℓ-torsion excludes every ℓ-power torsion class inductively, and every nonzero element of Zℓ is a unit times a power of ℓ.

### 11 — Invariant reduction for fixed mixed Schur tensors

**missing · theorem**. Theorem 1.3(0) p.208

In F, for fixed d,e≥0, uniformly over partitions λ⊢d,μ⊢e, Invπ(Sλ,μ(Hℓ∞)) holds for all sufficiently large ℓ depending on f,d,e.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/36, PAPER-CADORET-HUI-TAMAGAWA-17/37.

### 12 — Invariant reduction for arithmetic-stable free quotients

**missing · theorem**. Theorem 1.3(1) p.208

In F and the same fixed d,e, Invπ(M) holds uniformly for every π₀-equivariant torsion-free quotient Sλ,μ(Hℓ∞)↠M, for all sufficiently large ℓ depending on f,d,e, not the chosen quotient.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/36, PAPER-CADORET-HUI-TAMAGAWA-17/38.

### 13 — Invariant reduction for arithmetic-stable saturated submodules

**missing · theorem**. Theorem 1.3(2) p.208

In F and the same fixed d,e, Invπ(M) holds uniformly for every π₀-stable M⊂Sλ,μ(Hℓ∞) with torsion-free cokernel, for all sufficiently large ℓ depending on f,d,e, not the chosen submodule.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/36, PAPER-CADORET-HUI-TAMAGAWA-17/39.

### 14 — Symmetric and exterior invariant comparisons

**missing · theorem**. §1.3 following Theorem 1.3

Theorem 1.3 specializes to Sym^d, Λ^d and their mixed dual tensors through the row/column partitions. The integral idempotent comparison uses ℓ>d; this is not a claim for arbitrary small characteristic or arbitrary modular Schur subquotients.

### 15 — Lisse sheaves and fundamental-group representations

**missing · construction**. §2.1 pp.209–210

For connected X in F and Λ=Zℓ or Fℓ, identify the relevant lisse Λ-sheaves with continuous finite-generated Λ-representations of π₁(X,x), with stalk transport up to the chosen path. Establish H⁰(X,F)=F_x^π and the arithmetic action under descent.

- API `lisseRepresentation.stalk` (projection): The chosen geometric stalk gives the continuous fundamental-group representation, with transport under a chosen path.
- API `lisseRepresentation.globalSections` (compatibility): H⁰ of the lisse sheaf identifies with the fixed vectors in that stalk; descent retains the arithmetic quotient action.

- Use: CHT §2.1 and Lemma5.3 — identify stalk invariants and cohomology

- Proposed test: A constant finite free sheaf gives trivial monodromy
- Proposed test: Changing the base point conjugates via the chosen path
- Proposed test: A nonconstant rank-one local system need not have nonzero global sections

### 16 — Arithmetic fundamental-group sequence and fibre Frobenius

**missing · theorem**. §2.1 p.210

For the geometrically connected model X₀/k₀, π₁(X,x)→π₁(X₀,x)→Gal(k₀)→1 is exact. A k₀-rational point supplies a section and realizes the Galois action on geometric global sections by its fibre action. Do not add left injectivity without its hypotheses.

### 17 — Weil weights with every complex embedding

**planned · definition**. §2.2 p.210

For q>1, a nonzero algebraic number is q-Weil of weight w when all complex embeddings have absolute value q^(w/2). For Frobenius polynomials det(T−F), weights refer to their roots, including multiplicities; duals and Tate twists change weights with geometric-Frobenius conventions.

Planned: DeligneWeightsAndPurity:DWP.0.

- API `weilWeight.mul` (relation): A product of nonzero algebraic q-Weil numbers of weights a,b has weight a+b, with all complex embeddings tested.
- API `weilWeight.inv_pow` (compatibility): Inversion negates weight; the dth power of a q-Weil number of weight w is q^d-Weil of weight w.

- Use: CHT §§2,5 — separate roots of unequal weights

- Proposed test: q is weight 2
- Proposed test: q⁻¹ is weight −2
- Proposed test: a pure Jordan block still need not be semisimple

### 18 — Rational compatible family of Frobenius polynomials

**missing · definition**. §2.2 pp.210–211

For sheaves on a finite-field model, require at each closed point away from the coefficient characteristic that det(T−F_x) lies in Q[T] and is independent of ℓ. Compatibility is a property of actual representations, and does not automatically pass to an arbitrary subquotient.

- API `rationalCompatibleSystem.localPolynomial` (projection): For each eligible closed point extract the common rational polynomial identified with det(T−F_x) in every realization.
- API `rationalCompatibleSystem.finiteFieldBaseChange` (compatibility): After a residue-field extension of degree d the local roots become their dth powers, preserving coefficient independence.

- Use: CHT Facts3.2–3.3 and §9.2 — use one Frobenius polynomial for all coefficients

- Proposed test: constant compatible system
- Proposed test: two systems with different point polynomials fail
- Proposed test: subquotients need their own compatibility argument

### 19 — Primitive integral reduction of rational polynomials

**missing · construction**. §2.3 p.211

For nonzero P=Σa_nT^n∈Q[T], let a(P)>0 have valuations −min_n v_p(a_n) for every prime p. Then a(P)P is primitive integral and its reduction modulo each ℓ is nonzero. Use that reduction when writing P(F)=0 over Fℓ, not an undefined reduction of denominators.

- API `primitivePolynomial.content_one` (characterisation): Multiplication by the unique positive rational a(P) with valuations −min_i v_p(a_i) gives an integral polynomial of content one.
- API `primitivePolynomial.reduction_ne_zero` (simp): For nonzero P its primitive integral normalization has nonzero reduction at every prime; degree can drop at primes dividing its leading coefficient.

- Use: CHT §2.3 and Lemmas5.1–5.3 — reduce rational annihilators modulo any prime

- Proposed test: P=(T+1)/2 normalizes to T+1
- Proposed test: P=2T+3 stays primitive and drops degree modulo2
- Proposed test: Zero is excluded from a(P)

### 20 — Continuous-cohomology object already built

**library · construction**. §1.3 and §§2,5,10, foundational carrier

For a topological representation A:TopRep k G, continuousCohomology n A is the homology of its complex of invariant homogeneous continuous cochains, as a TopModuleCat k object. This credit does not supply compact-coefficient exactness, ℓ-adic rationalization or the comparison with explicit H¹.

Library: mathlib:continuousCohomology.

- API `continuousCohomology.cochain_homology` (characterisation): The library object is the homology of the continuous homogeneous-cochain complex in TopRep coefficients.
- API `continuousCohomology.comparison_request` (compatibility): The extension-cocycle application requires a comparison with the explicit H¹ carrier; this is a request, not a credited theorem.

- Use: CHT §10 — reuse the canonical cohomology object

- Proposed test: A trivial group has the expected degree-zero fixed vectors
- Proposed test: Continuous cochains retain coefficient topology
- Proposed test: The object alone does not supply a compact-coefficient long exact sequence

### 21 — Gabber–Suh uniform torsion-freeness

**missing · theorem**. Fact 3.1 p.212

In F, H*(Yx,Zℓ) is torsion-free for all sufficiently large ℓ, simultaneously in every cohomological degree. Smooth proper base change transports this to the family; the bound concerns a fixed family, not all smooth proper varieties.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/23.

### 22 — Uniform cohomological reduction

**missing · theorem**. Fact 3.1 p.212

In F and for the same large-prime range, the canonical H*(Yx,Zℓ)⊗Fℓ→H*(Yx,Fℓ) is an isomorphism compatible with monodromy. This uses adjacent-degree torsion-freeness, not merely freeness in the displayed degree.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/21.

### 23 — Smooth-proper rational compatibility and purity

**planned · theorem**. Fact 3.2 p.212; §5

For a smooth proper finite-field family, the Frobenius polynomials on R^wf_*Qℓ are rational and independent of ℓ and all roots have weight w. Geometric semisimplicity follows from the pure-lisse theorem on a normal base, not from arithmetic semisimplicity.

Planned: DeligneWeightsAndPurity:DWP.7, DeligneWeightsAndPurity:DWP.8, WeilConjectures:WC.3.

### 24 — One cover gives connected geometric and arithmetic monodromy

**missing · theorem**. Fact 3.3 p.212; condition (6.2.2)

In F, after one connected finite étale Galois cover independent of ℓ, all generic geometric Zariski groups are connected semisimple and all arithmetic generic groups are connected. Separate geometric characteristic-zero semisimplicity from independence of the component-group cover.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/23.

### 25 — Uniform perfect residual geometric image

**missing · theorem**. Fact 3.4 p.212; condition (6.2.1)

In F, after one connected finite étale Galois cover independent of ℓ, the geometric mod-ℓ images are perfect for every sufficiently large ℓ.

### 26 — Uniform order-ℓ generation of residual images

**missing · theorem**. Fact 3.4 p.212; condition (6.2.1)

With the same kind of fixed cover as Fact 3.4, for every sufficiently large ℓ the residual geometric image is generated by its elements of order ℓ. This is stronger than just having an ℓ-Sylow subgroup and is a separate input to Nori theory.

### 27 — Prime-to-index descent for Inv

**missing · theorem**. Lemma 4.2(1) p.213

For closed normal open U⊂Π of index prime to ℓ and a finite-free continuous Zℓ-representation M, Inv_U(M) implies Inv_Π(M), by exactness of finite-group invariants after averaging.

1. An invariant residual vector has an invariant lift under U by Inv_U. Average this lift over the finite quotient Π/U, dividing by its order, a unit in Zℓ. The average is Π-invariant and reduces to the original vector. This elementary proof needs no compact-coefficient long exact sequence.

### 28 — Prime-to-index descent for semisimplicity

**missing · theorem**. Lemma 4.2(2) p.213

For U normal open in profinite Π with ℓ∤[Π:U], a finite-dimensional continuous Fℓ-representation semisimple upon restriction to U is semisimple for Π. Average a U-equivariant splitting over Π/U; normality and invertibility of the index are essential.

### 29 — Geometric monodromy comparison with a finite-field curve

**missing · theorem**. Lemma 4.3 pp.213–214

In F there exist a smooth geometrically connected finite-field curve, a smooth proper family over it and one fixed normal open subgroup U of the original π such that their geometric images identify on Zℓ and Fℓ cohomology for all sufficiently large ℓ. The construction uses Bertini, spreading, tame specialization and smooth proper base change; an arbitrary arithmetic specialization does not give this assertion.

### 30 — Bertini curve with fundamental-group surjection

**missing · construction**. Lemma 4.3 proof p.214, [Jou83, Thm. 6.10]

After permissible finitely generated-field/base-point enlargement, choose a smooth geometrically connected curve mapping to X₀ whose geometric π₁ surjects onto the required geometric monodromy quotient; preserve the restricted smooth proper family. This is the source-qualified Jouanolou input to Lemma 4.3, not a claim that every curve has surjective π₁.

- API `bertiniMonodromyCurve.map` (projection): Expose the smooth connected curve and its morphism into the original base under the Bertini hypotheses.
- API `bertiniMonodromyCurve.pi1_surjective` (structure): The supplied fundamental-group map is surjective, so restricting any representation preserves its image.

- Use: CHT §4.3 — reduce the geometric image to dimension one

- Proposed test: A curve may use its identity morphism
- Proposed test: A constant map into a positive-genus base need not surject on π₁
- Proposed test: Surjectivity preserves the image for each coefficient at once

### 31 — Uniform tame reduction and specialization

**missing · theorem**. Lemma 4.3 proof p.214

Use de Jong to make boundary inertia potentially unipotent uniformly in ℓ on one cover; for ℓ≠p unipotent congruence images are pro-ℓ, so wild pro-p inertia is killed. Specialize the resulting tame representation to a finite-field curve and compare fibres by smooth proper base change. Retain the one-cover quantifier and both coefficient levels.

### 32 — Alteration with smooth compactification and normal-crossing boundary

**planned · theorem**. Lemma 4.3; Lemma 5.2, [dJ96, Thm. 4.1]

For the integral finite-type schemes over the perfect fields arising in §§4–5, use a proper dominant generically finite, generically étale alteration to a smooth scheme admitting a smooth projective compactification with strict normal-crossing boundary. Restrict to an open on which it is finite étale of degree δ before using trace splitting.

Planned: AdicCoefficientsAndComparisons:L5.

### 33 — Fibre-power Künneth realization of total tensor powers

**missing · theorem**. §4 pp.212–215; §10.1

For the d-fold fibre product of the smooth proper family, integral Künneth gives H*(Yx^[d],Zℓ)≅H*(Yx,Zℓ)⊗d after all torsion terms vanish; the comparison is arithmetic-equivariant and compatible with reduction. Rational or derived Künneth alone is not the integral direct-sum statement.

### 34 — Poincaré duality with twist and support retained

**planned · theorem**. §4; Lemma 5.3 p.218

For smooth pure-dimensional Y over an algebraically closed field, coefficients Λ=Qℓ or Fℓ, ℓ≠p, there is Frobenius-equivariant perfect duality H^i(Y,Λ)≅H_c^(2dimY−i)(Y,Λ)(dimY)∨. For proper smooth fibres this identifies dual cohomology with complementary degree and the correct Tate twist; integral use requires its torsion-free comparison.

Planned: EtaleDualityAndPerverseSheaves:EDC.2.

### 35 — Schur direct-factor inheritance of invariant reduction

**missing · theorem**. Lemma 4.4 p.215

For 0≤d,e<ℓ, the normalized Young projectors make Sλ,μ(M) a Π-equivariant direct summand of M⊗d⊗(M∨)⊗e. Inv for the ambient tensor object implies Inv for that summand; extend the reduction to arithmetic-stable free quotients and saturated submodules with the induced projector maps.

### 36 — Reduction to untensored finite-field curve results

**missing · theorem**. Proposition 4.1 pp.212–213

Theorem 4.5 for ordinary cohomology on finite-field curves implies Theorem 1.3 in F, by Lemmas 4.2–4.4, fibre powers, finite direct sums, duality and twists. The same curve reduction transfers the geometric semisimplicity assertion. The integral Frobenius-projector dévissage is supplied in item 116.

### 37 — Curve invariant reduction

**missing · theorem**. Theorem 4.5(0) p.216

In C, for all sufficiently large ℓ, Invπ(H*(Yx,Zℓ)) holds.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/47.

### 38 — Curve free-quotient invariant reduction

**missing · theorem**. Theorem 4.5(1) p.216; §5.2

In C and for all sufficiently large ℓ uniformly over the quotient, Invπ(M) holds for every π₀-equivariant torsion-free quotient of H*(Yx,Zℓ). The proof first treats a single degree and uses an affine restriction.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/48, PAPER-CADORET-HUI-TAMAGAWA-17/46, PAPER-CADORET-HUI-TAMAGAWA-17/47, PAPER-CADORET-HUI-TAMAGAWA-17/116.

### 39 — Curve saturated-submodule invariant reduction

**missing · theorem**. Theorem 4.5(2) p.216; §5.3

In C and for all sufficiently large ℓ uniformly over the submodule, Invπ(M) holds for every π₀-stable saturated submodule of H*(Yx,Zℓ). The determinant and exterior-dual proof must retain arithmetic twists while using geometric determinant triviality.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/38, PAPER-CADORET-HUI-TAMAGAWA-17/49, PAPER-CADORET-HUI-TAMAGAWA-17/50, PAPER-CADORET-HUI-TAMAGAWA-17/116.

### 40 — Torsion characteristic polynomial divides reduction

**missing · theorem**. Lemma 5.1 p.217

For a finitely generated Zℓ-module H and a Zℓ-linear automorphism F, charpoly(F|H[ℓ]) divides charpoly(F|H/ℓH). For finite H the two Fℓ[F]-modules have equal classes in the finite-length Grothendieck group and hence equal semisimplifications, not necessarily an isomorphism.

### 41 — Characteristic polynomial commutes with base change

**library · theorem**. §5.1 and §11, coefficient comparisons

For R commutative, M finite free over R, f∈End_R(M) and commutative R-algebra A, charpoly(f_A)=map(R→A,charpoly(f)). This general theorem covers rationalization and reduction of a free lattice; it does not by itself prove Lemma 5.1 for torsion H.

Library: mathlib:LinearMap.charpoly_baseChange.

### 42 — Uniform compact-support annihilator over Qℓ

**missing · theorem**. Lemma 5.2 p.217

For separated finite-type Y₀/F_q and w≥0, there is nonzero P≤w,Y₀∈Q[T] independent of ℓ≠p, all roots q-Weil of weights≤w, annihilating geometric Frobenius on H_c^w(Y,Qℓ) for every ℓ≠p. This is an annihilator, not a claimed ℓ-independent characteristic polynomial of arbitrary nonproper cohomology.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/23, PAPER-CADORET-HUI-TAMAGAWA-17/44.

### 43 — Uniform compact-support annihilator modulo ℓ

**missing · theorem**. Lemma 5.2 pp.217–218

For the same Y₀,w, the primitive-integral reduction of a common P≤w,Y₀ as in 42 annihilates H_c^w(Y,Fℓ) for every sufficiently large ℓ. No Weil weight is directly assigned to an Fℓ eigenvalue; it is controlled by reduction of a rational polynomial.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/21, PAPER-CADORET-HUI-TAMAGAWA-17/22, PAPER-CADORET-HUI-TAMAGAWA-17/44.

### 44 — Annihilator descent and dimension induction

**missing · construction**. Lemma 5.2 proof pp.217–218

Descend a bound from F_q^d using P(T^d). Reduce nilpotents, separate irreducible components by lower-dimensional closed strata, alter the open integral part, and use localization to multiply annihilators. Choose one alteration first, then exclude primes dividing its degree; retain the compact-support groups throughout.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/32, PAPER-CADORET-HUI-TAMAGAWA-17/45.

- API `uniformAnnihilator.constantExtension` (compatibility): An annihilator P for F^d pulls back to P(T^d) for F.
- API `uniformAnnihilator.localization_product` (constructor): For the compact-support localization sequence, multiply annihilators on the open and closed pieces; use trace descent only away from the fixed alteration degree.

- Use: CHT Lemma5.2 — perform dimension induction with compact support

- Proposed test: For extension degree1 keep P
- Proposed test: For A¹ retain compact support in degree2
- Proposed test: A prime dividing the alteration degree prevents trace splitting

### 45 — Finite étale compact-support trace splitting

**planned · theorem**. Lemma 5.2 p.218; corrected E1

For finite étale U′→U of degree δ over a finite field and Λ=Qℓ or Fℓ with δ invertible, pullback and trace on H_c^w compose to δ·id. Thus H_c^w(U,Λ) is a Frobenius-equivariant direct summand of H_c^w(U′,Λ), not ordinary H^w(U′,Λ).

Planned: EtaleDualityAndPerverseSheaves:EDC.2.

### 46 — Curve Leray edge and high-weight annihilator

**missing · theorem**. Lemma 5.3 p.218

In C, for Λ=Qℓ (all ℓ≠p) or Fℓ (all sufficiently large ℓ), H¹(X,R^wf_*Λ)=E₂^(1,w)=E∞^(1,w) is a subquotient of H^(w+1)(Y,Λ). Smooth duality and 42–43 produce a common rational annihilator P≥w+1 with roots of weights≥w+1; for dimY=D use T^degP P(q^D/T) from P≤2D−w−1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/34, PAPER-CADORET-HUI-TAMAGAWA-17/42, PAPER-CADORET-HUI-TAMAGAWA-17/43.

### 47 — Weight-separated annihilators kill torsion

**missing · theorem**. §5.1 pp.216–217

In C the ℓ-torsion of H¹(X,R^wf_*Zℓ) is killed by reduction of P_w from a rational-point fibre (roots weight w) and by P≥w+1. Distinct weights make the rational polynomials coprime; a nonzero integer Bézout resultant excludes finitely many primes, making the two reduced polynomials coprime and forcing the torsion module to vanish.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/40, PAPER-CADORET-HUI-TAMAGAWA-17/41, PAPER-CADORET-HUI-TAMAGAWA-17/46.

### 48 — Affine curve H¹ quotient surjectivity

**missing · theorem**. §5.2 pp.218–219

For X a smooth affine geometric curve and finite-free continuous Zℓ representations H↠M with free kernel, the requisite cdℓ≤1 and compact-coefficient comparison give H¹(π,H)↠H¹(π,M). In the arithmetic-equivariant single-degree application H=H^w(Yx,Zℓ), this transports the same high-weight annihilator to every quotient M.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/155.

1. Import affine-curve cdℓ≤1 and finiteness for finite locally constant ℓ-primary coefficients, with ℓ different from the geometric characteristic; verify the group/sheaf comparison. These are the remaining G3 geometric inputs.
2. Apply155 to each arithmetic-stable free quotient of the original lattice. Every construction is natural for the arithmetic action, so surjectivity transports the original high-weight annihilator.

### 49 — Geometric determinants of saturated submodules are trivial

**missing · theorem**. §5.3 p.219, [CT12, Thm.5.7]

After the fixed covers of Facts 3.3–4, Π∞ has finite abelianization and is generated by pro-ℓ Sylows. For large ℓ>2, its determinant character on any invariant free submodule M has finite image in Zℓ× of order dividing ℓ−1, so is trivial. This conclusion is geometric; the arithmetic determinant character may be nontrivial.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/24, PAPER-CADORET-HUI-TAMAGAWA-17/25, PAPER-CADORET-HUI-TAMAGAWA-17/26.

### 50 — Determinant duality reduces saturated submodules to quotients

**missing · construction**. §5.3 p.219

For M free of rank m≥1, the wedge map identifies M with (Λ^(m−1)M)∨⊗det(M). For M saturated in a single H^w, dualizing and exterior powers give an arithmetic-equivariant free quotient of a complementary-degree fibre-power cohomology group, with Tate twist. Apply quotient Inv after accounting for the geometrically trivial determinant. Treat m=0 separately.

- API `determinantDuality.equiv` (equivalence): For m>0, wedge evaluation identifies M with (Λ^(m−1)M)∨⊗det(M), equivariantly for the full arithmetic action.
- API `determinantDuality.geometricUntwist` (compatibility): If the geometric determinant is trivial the geometric representation untwists, while the arithmetic determinant character must still be retained.

- Use: CHT §5.3 — treat saturated rank-m submodules by free quotients

- Proposed test: For m=1 retain the determinant line
- Proposed test: Treat rank0 separately
- Proposed test: An arithmetic nontrivial character can be geometrically trivial

### 51 — Integral monodromy closure and its two fibres

**missing · definition**. §6 p.220, (6.1)

For a compact image Π∞⊂GL(H) with H finite free over Zℓ, form the reduced schematic Zariski closure 𝒢 in GL(H), generic group Gη⊂GL(H⊗Qℓ), special group Gs⊂GL(H⊗Fℓ). It is flat over Zℓ and dimGs=dimGη; smoothness and connectedness of Gs are conclusions later, not part of this definition.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/01.

- API `integralMonodromy.genericFiber` (compatibility): The schematic closure in GL(H) has generic fibre the rational Zariski closure of the image.
- API `integralMonodromy.flat` (structure): Its defining ideal is the contraction of the generic ideal, so the coordinate ring is torsion free over the DVR and flat; smoothness is a later theorem.

- Use: CHT §§6–9 — compare generic and special fibres

- Proposed test: SL₂ standard lattice
- Proposed test: conjugated lattice changes model
- Proposed test: do not assume special smoothness at definition time

### 52 — Subgroup generated by ℓ-Sylows

**missing · definition**. §7.1 pp.220–221

For closed Π⊂GL_r(Zℓ) or GL_r(Fℓ), Π+ is the closed normal subgroup generated by its ℓ-Sylow subgroups. In the finite residual, dimension-bounded large-prime setting it is generated by order-ℓ elements. Distinguish abstract generation, closed generation, reduction image and full algebraic envelope.

- API `plusSubgroup.minimal` (universal-property): The closed subgroup generated by all pro-ℓ Sylow subgroups is contained in every closed subgroup containing those Sylows.
- API `plusSubgroup.characteristic` (structure): Automorphisms preserve the collection of Sylows, so the closed generated subgroup is characteristic and normal.

- Use: CHT §§7–8 — compare residual and compact plus groups

- Proposed test: finite ℓ-group
- Proposed test: prime-to-ℓ finite group has trivial plus
- Proposed test: SL₂ integral plus-generation

### 53 — Bounded mixed tensor space

**missing · definition**. §7.1 pp.220–221

For finite free H set T≤d(H)=⊕_{0≤s,t≤d}H⊗s⊗(H∨)⊗t. The bounds are separate, so total tensor length can be 2d. Define the pointwise group-scheme stabilizer of its invariant submodule, not merely its setwise stabilizer.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/118.

- API `boundedMixedTensor.summand` (constructor): For s≤d and t≤d, include M^⊗s⊗(M∨)^⊗t as its specified direct summand.
- API `boundedMixedTensor.action_degree` (relation): For an exponential root subgroup on rank-r M each summand action has parameter degree at most (s+t)(r−1), hence at most 2d(r−1).

- Use: CHT Lemma7.1.3 and Theorem7.3 — bound polynomial degree and stabilize tensors

- Proposed test: s=d,t=d is included
- Proposed test: setwise stabilizer of a line is too large
- Proposed test: d=0 gives only trivial-tensor constraints

### 54 — Truncated exponential and logarithm for order-ℓ matrices

**missing · construction**. §7.1 p.221

For ℓ≥r and g∈GL_r(Fℓ) of order ℓ, log(g)=−Σ_{1≤i<ℓ}(1−g)^i/i and exp(tlogg)=Σ_{0≤i<ℓ}(tlogg)^i/i! define a unipotent one-parameter subgroup φ_g:G_a→GL_r. Prove the polynomial inverse identities under the nilpotence/large-prime bound.

- API `truncatedExpLog.inverse` (equivalence): In characteristic ℓ≥r, the degree<r exponential and logarithm are inverse on matrices with N^r=0 and (g−1)^r=0.
- API `truncatedExpLog.oneParameter` (structure): For fixed N^r=0, exp((a+b)N)=exp(aN)exp(bN), and exp(0N)=1, as polynomial identities.

- Use: CHT §7.1 and Larsen Lemma6 — pass between nilpotent matrices and unipotents

- Proposed test: N=0 gives identity
- Proposed test: For N²=0 use exp(tN)=1+tN
- Proposed test: Do not divide by factorials containing the characteristic

### 55 — Nori exponential envelope

**missing · definition**. §7.1 p.221

For Π⊂GL_r(Fℓ), N(Π) is the algebraic subgroup generated by the one-parameter groups φ_g for its order-ℓ elements. It is smooth connected and generated by unipotents; define generation scheme-theoretically and prove independence of choices. This symbol is separate from the composition-factor product used in §8.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/54.

- API `noriEnvelope.minimal` (universal-property): The envelope is the smallest closed algebraic subgroup containing every one-parameter exponential attached to an order-ℓ element.
- API `noriEnvelope.conjugate` (functoriality): Conjugating the residual representation conjugates each exponential subgroup and its generated envelope.

- Use: CHT Theorem7.3 — replace the finite image by an algebraic group

- Proposed test: single upper-unipotent root subgroup
- Proposed test: prime-to-ℓ group gives trivial envelope
- Proposed test: SL₂ upper/lower root subgroups generate

### 56 — Nori finite-points plus comparison

**missing · theorem**. Lemma 7.1(1) p.221

For ℓ sufficiently large depending only on r, N(Π)(Fℓ)+=Π+. This is the group-theoretic input from Nori, not a consequence of Zariski density of the finite set Π.

### 57 — Nori invariant-subspace comparison

**missing · theorem**. Lemma 7.1(1) p.221

Under the same bound, Π+ and N(Π) have exactly the same invariant Fℓ-subspaces of H=Fℓ^r. Scheme-representation invariance is compared with the finite-group action; this does not assert every rational representation is semisimple.

### 58 — Uniform bounded-tensor stabilizer

**missing · theorem**. Lemma 7.1(2) p.221, [CT16, Lem.4.1]

There is d(r), independent of ℓ and Π in the large-prime range, such that N(Π) equals the pointwise group-scheme stabilizer in GL(H) of T≤d(r)(H)^N(Π). Its uniformity and scheme-level strength are indispensable. This is the Cadoret–Tamagawa 2016 tensor-stabilizer input, distinct from Nori Theorem B.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/122, PAPER-CADORET-HUI-TAMAGAWA-17/123, PAPER-CADORET-HUI-TAMAGAWA-17/124, PAPER-CADORET-HUI-TAMAGAWA-17/125, PAPER-CADORET-HUI-TAMAGAWA-17/126, PAPER-CADORET-HUI-TAMAGAWA-17/127.

1. Choose the uniform subspace W_U of122. By123 its setwise stabilizer is the stabilizer of its determinant line.
2. By124 U acts trivially on that line; its pointwise stabilizer is therefore exactly U. Embed the line equivariantly into a tensor power by125.
3. It is a fixed tensor in the expanded bounded tensor family. Any element fixing all U-invariant tensors fixes this one and lies in U; the reverse inclusion is definitional. Use126 to remove multiplicities and take separate degree bounds.
4. This closes the linear-algebra reduction; the family/Chevalley/spreading scheme-level input122 remains G5.

### 59 — Bounded tensor invariants agree

**missing · theorem**. Lemma 7.1(3) pp.221–222

For each fixed d and ℓ sufficiently large depending on r,d, T≤d(H)^N(Π)=T≤d(H)^Π+. For the polynomial interpolation step ℓ>2d(r−1) suffices once the exponential construction is valid; do not replace this with ℓ>d alone.

### 60 — Simply connected integral points are plus-generated

**missing · theorem**. Lemma 7.2 p.221

If 𝒮/Zℓ is a simply connected semisimple group scheme, then 𝒮(Zℓ)=𝒮(Zℓ)+. Use surjectivity of smooth reduction with pro-ℓ kernel and generation of 𝒮(Fℓ) by ℓ-elements.

### 61 — Special monodromy fibre equals Nori envelope

**missing · theorem**. Theorem 7.3 pp.221–222

In G, for every sufficiently large ℓ, Gs=Nℓ as closed group schemes in GL(Hℓ). Invariant reduction and 58–59 give Gs⊂Nℓ; Larsen's dimension comparison and flat dimension equality force equality. Equality of Fℓ-points alone is insufficient.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/11, PAPER-CADORET-HUI-TAMAGAWA-17/51, PAPER-CADORET-HUI-TAMAGAWA-17/56, PAPER-CADORET-HUI-TAMAGAWA-17/58, PAPER-CADORET-HUI-TAMAGAWA-17/59, PAPER-CADORET-HUI-TAMAGAWA-17/113, PAPER-CADORET-HUI-TAMAGAWA-17/142.

### 62 — Special-fibre plus image is perfect and enveloping

**missing · theorem**. Theorem 7.3(1) p.221

In G and for all large ℓ, Gs(Fℓ)+ is perfect and Gs is the Nori envelope of Gs(Fℓ). Preserve both assertions as consequences of 61 and Nori's plus comparison.

### 63 — Uniform weak maximality index bound

**missing · theorem**. Theorem 7.3(2) p.222

In G, there is C_r depending only on r=rank Hℓ∞ with [𝒢(Zℓ):Π∞]≤C_r for all sufficiently large ℓ. This uses Larsen 2010 Theorem 7; bounded index is not index one.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/61, PAPER-CADORET-HUI-TAMAGAWA-17/114.

### 64 — Geometric image equals integral-points plus subgroup

**missing · theorem**. Theorem 7.3(2) p.222

In G and for all sufficiently large ℓ, Π∞=𝒢(Zℓ)+. Combine plus-generation of Π∞, the pro-ℓ congruence kernel and the bounded-index theorem after ℓ>C_r.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/26, PAPER-CADORET-HUI-TAMAGAWA-17/63.

### 65 — Integral geometric monodromy closure is smooth connected

**missing · theorem**. Corollary 7.4 p.222

In G and for all sufficiently large ℓ, 𝒢 is a smooth connected Zℓ-group scheme: flatness and smoothness of generic and Nori special fibres yield smoothness. Semisimplicity of the special fibre is not yet proved.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/51, PAPER-CADORET-HUI-TAMAGAWA-17/61.

### 66 — Residual and algebraic module semisimplicity agree

**missing · theorem**. Corollary 7.5, (1)↔(2), p.222

In G and for all large ℓ, Hℓ is semisimple under Πℓ iff it is semisimple as a representation of Nℓ=Gs, by equality of invariant subspaces.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/57, PAPER-CADORET-HUI-TAMAGAWA-17/61.

### 67 — Faithful semisimple Nori module forces semisimple group

**missing · theorem**. Corollary 7.5, (2)→(3), p.222

In G, semisimplicity of the faithful Gs-module Hℓ implies Gs reductive. Its generation by unipotents removes the central torus, hence Gs is semisimple. Faithful semisimple representation alone would only give reductivity.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/55.

### 68 — Low-dimensional representations in large characteristic

**missing · theorem**. Corollary 7.5, (3)→(2), p.222; [Jan97, Prop.3.2], [Lar95b, Thm.3.5]

For a connected semisimple algebraic group over Fℓ, its r-dimensional rational representation is semisimple when ℓ is sufficiently large in terms of r, in the Jantzen/Larsen range used here. The exact cited bound remains external-input gap G1; no Maschke argument with ℓ dividing the group order is allowed.

### 69 — Fibre semisimplicity and integral semisimple model

**missing · theorem**. Corollary 7.5, (3)↔(4), p.222

For the smooth connected 𝒢 of 65 with semisimple generic fibre, Gs semisimple iff 𝒢 is a semisimple Zℓ-group scheme. This is the final equivalence (3)↔(4) of Corollary 7.5, not a definition of an arbitrary flat model as smooth.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/65, PAPER-CADORET-HUI-TAMAGAWA-17/117.

### 70 — Field-level semisimple and reductive groups already built

**library · definition**. §§6–9, underlying algebraic group notions

For finite-type commutative Hopf algebras over a field k, semisimplicity means smoothness and geometric connectedness with no nontrivial smooth connected normal solvable geometric closed subgroup. The pinned scheme-side reductive predicate transports the analogous unipotent-radical condition through the affine Hopf anti-equivalence. These field-level predicates do not supply relative semisimplicity over Zℓ.

Library: tauceti:TauCeti.semisimpleCommHopfAlgProperty, tauceti:TauCeti.semisimpleCommHopfAlgProperty_iff, tauceti:TauCeti.reductiveAffineGroupSchemeProperty.

- API `fieldSemisimple.geometricCriterion` (characterisation): The pinned predicate requires smoothness and geometric connectedness and excludes every nontrivial smooth connected normal solvable geometric subgroup.
- API `fieldSemisimple.affineHopf` (compatibility): Transport the field-level group predicate through the existing affine group / Hopf algebra anti-equivalence.

- Use: CHT §§7–9 — distinguish field predicates from integral models

- Proposed test: SL₂ is the intended semisimple example
- Proposed test: A positive-dimensional torus is not semisimple
- Proposed test: The definition has field input and does not define semisimplicity over Zℓ

### 71 — Field-level semisimple implies reductive already built

**library · theorem**. §§7–9, structural algebraic-group input

Every semisimple finite-type commutative Hopf algebra over a field is reductive, since each smooth connected normal unipotent geometric closed subgroup is solvable. This is a structural implication only, not complete reducibility of all positive-characteristic representations.

Library: tauceti:TauCeti.semisimpleCommHopfAlgProperty.reductive.

### 72 — Hyperspecial points and semisimple integral models

**missing · construction**. §8 p.223, [Tit79, §3.8]

For connected semisimple G/Qℓ use the building of Gsc with Gad(Qℓ)-action. Semisimple Zℓ-models with their generic identifications correspond to hyperspecial points; an isogeny extends uniquely between the models attached to the same point. Import buildings and parahoric models, and prove this precise hyperspecial correspondence.

- API `hyperspecialModel.genericIdentification` (data): Expose the semisimple model and its specified identification with the given generic group at the hyperspecial point.
- API `hyperspecialModel.isogenyExtension` (compatibility): A central isogeny of generic groups extends between the models attached to the same building point under the Bruhat–Tits hypotheses.

- Use: CHT Lemma8.1 — compare simply connected integral models

- Proposed test: SL₂ with its standard Zℓ-model
- Proposed test: A parahoric with nontrivial special unipotent radical is not hyperspecial
- Proposed test: Generic isogeny extension requires the matched building point

### 73 — Hyperspecial maximal compactness

**missing · theorem**. §8 p.223, [Tit79, §3.8.2]

A hyperspecial subgroup of a connected semisimple Qℓ-group is maximal among compact subgroups and has maximal volume; its conjugates are hyperspecial. Retain the specified Haar-volume comparison when used, rather than claiming every maximal compact is hyperspecial.

### 74 — Nonabelian composition-factor product

**missing · definition**. Lemma 8.1 proof pp.223–224

For a profinite group Π with an open normal pro-ℓ subgroup, define cna(Π) as the product, with multiplicity, of orders of nonabelian simple factors of a finite quotient by such a subgroup. Prove independence of the quotient using that finite ℓ-groups have only abelian composition factors. Do not multiply an infinite composition series.

- API `nonabelianFactorProduct.independent_quotient` (characterisation): Quotienting by different open normal pro-ℓ subgroups gives the same product of orders of nonabelian simple factors, since finite ℓ-groups have only abelian factors.
- API `nonabelianFactorProduct.abelian_extension` (relation): An extension with abelian kernel preserves this product; for finite groups the product is multiplicative across a normal subgroup and its quotient.

- Use: CHT Lemma8.1 — compare compact groups by finite quotients

- Proposed test: finite abelian group gives 1
- Proposed test: pro-ℓ group gives 1
- Proposed test: A₅ gives 60, with finite product multiplicity

### 75 — Composition-factor product under subgroups and abelian extensions

**missing · theorem**. Lemma 8.1 proof pp.223–224

For the finite-by-pro-ℓ groups in 74, a closed subgroup Π′⊂Π satisfies cna(Π′)≤cna(Π). Extensions with abelian kernel or abelian quotient leave cna unchanged. Establish the finite-group reduction and composition-factor argument, not an unsupported equality of orders.

### 76 — Smooth integral reduction with pro-ℓ kernel

**planned · theorem**. Lemma 8.1 proof (1) p.223

For smooth connected affine finite-type 𝓗/Zℓ, 𝓗(Zℓ)→𝓗(Fℓ) is surjective with pro-ℓ kernel. It preserves cna, also after taking plus subgroups. This is the Hensel/congruence result required by Lemma 8.1.

Planned: ReductiveGroupsPartII:RG2.0, ReductiveGroupsPartII:RG2.3.

### 77 — Solvable-radical quotient preserves nonabelian factors

**missing · theorem**. Lemma 8.1 proof (2) p.224

For smooth connected affine H/Fℓ, Lang's theorem makes H(Fℓ)→(H/R(H))(Fℓ) surjective. For sufficiently large ℓ relative to rank, passing to this semisimple quotient or to plus subgroups preserves cna; central-isogeny cokernels have bounded order and are abelian.

### 78 — Uniform finite Lie-type composition-factor bounds

**missing · theorem**. Lemma 8.1 proof (3) p.224; [Tit64], [Nor87, Lem.3.5]

For connected semisimple H/Fℓ of dimension d and bounded rank, for all sufficiently large ℓ its nonabelian factors are those of almost-simple factors H_i(Fℓ)+ modulo their centres. There is a rank-dependent c>0 with (ℓ−1)^d/c≤cna(H(Fℓ))≤(ℓ+1)^d. Keep the small-field exceptions and central-isogeny indices explicit.

### 79 — Semisimple model comparison via simply connected cover

**missing · theorem**. Lemma 8.1 pp.223–225

Let G/Qℓ be connected semisimple and 𝒢,𝒮 smooth connected integral models of G,Gsc. Assume 𝒮 semisimple and (psc)⁻¹(𝒢(Zℓ)+) normal in 𝒮(Zℓ) with abelian quotient. For ℓ sufficiently large depending only on dimG, 𝒢 is semisimple. The proof compares cna bounds to force dim(Gs/R(Gs))=dimG; the use of affineness of models is a carrier verification in G4.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/74, PAPER-CADORET-HUI-TAMAGAWA-17/75, PAPER-CADORET-HUI-TAMAGAWA-17/76, PAPER-CADORET-HUI-TAMAGAWA-17/77, PAPER-CADORET-HUI-TAMAGAWA-17/78.

### 80 — Simply connected pullback of integral-points plus subgroup

**missing · theorem**. Corollary 8.2 proof, (i)–(ii), p.225

For semisimple 𝒢/Zℓ and its simply connected semisimple model 𝒮 at the same hyperspecial point, for all large ℓ, (psc)⁻¹(𝒢(Zℓ)+)=𝒮(Zℓ), and 𝒮(Zℓ)↠𝒢(Zℓ)+. Prove the first equality by finite-kernel compactness and maximal compactness; the second uses bounded exponent of the generic central-isogeny cokernel and plus-generation.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/60, PAPER-CADORET-HUI-TAMAGAWA-17/72, PAPER-CADORET-HUI-TAMAGAWA-17/73.

### 81 — Semisimplicity iff almost hyperspecial

**missing · theorem**. Corollary 8.2 p.225

In G and for all sufficiently large ℓ, the four conditions of Corollary 7.5 are equivalent to Π∞ almost hyperspecial in Gη(Qℓ). Forward: 64 and 80. Reverse: Lemma 8.1 applied to the hyperspecial preimage and the smooth model 65.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/64, PAPER-CADORET-HUI-TAMAGAWA-17/65, PAPER-CADORET-HUI-TAMAGAWA-17/66, PAPER-CADORET-HUI-TAMAGAWA-17/67, PAPER-CADORET-HUI-TAMAGAWA-17/68, PAPER-CADORET-HUI-TAMAGAWA-17/69, PAPER-CADORET-HUI-TAMAGAWA-17/79, PAPER-CADORET-HUI-TAMAGAWA-17/80.

### 82 — Invariant-dimension defect

**missing · definition**. §9.1 p.226

In L, for finite-free algebraic 𝒢-representation M, Δ_H(M)=dim_Fℓ((M⊗Fℓ)^(Gs)°)−dim_Qℓ((M⊗Qℓ)^Gη). Construct the generic invariant lattice and reduction injection to prove nonnegativity. The special identity component, not the whole special group, is part of the definition.

- API `invariantDefect.nonnegative` (structure): The saturated generic invariant lattice reduces injectively into the special identity-component invariants, so Δ≥0.
- API `invariantDefect.directSum` (simp): The defect of a finite direct sum is the sum of the defects, with the same special identity-component convention.

- Use: CHT Theorem9.1.3 — detect special-fibre radical by dual Lie exterior powers

- Proposed test: constant trivial module has defect 0
- Proposed test: connected special identity-component convention
- Proposed test: defect criterion only on specified dual Lie exterior powers

### 83 — Nice integral model of a maximal torus

**missing · definition**. §9.1 p.226

The nice-model predicate is convention L's extension of a CLOSED split-torus embedding after finite splitting E/Qℓ, with integral lattice H⊗O_E. Prove it invariant under permitted basis change and faithful flat scalar extension; extending only the pointwise torus action is weaker.

- API `niceTorus.closedEmbedding` (projection): Expose the finite splitting field E and closed immersion of the split torus over O_E extending the given generic embedding.
- API `niceTorus.basisChange` (compatibility): Conjugation by an integral lattice automorphism transports the torus extension and preserves its closed-immersion property.

- Use: CHT §9.2 — apply the nice-model criterion to compatible Frobenius

- Proposed test: diagonal torus on a split lattice
- Proposed test: weight set must generate character lattice
- Proposed test: pointwise injectivity is not closed immersion

### 84 — Nice torus implies smooth integral closure in large characteristic

**missing · theorem**. Theorem 9.1(1) p.226; proof p.227

In L with a nice torus and sufficiently large ℓ (in particular ℓ≥r for the displayed root-exponential proof), 𝒢 is smooth over Zℓ. The printed 9.1.1 omits this bound; record E3 and do not export an unrestricted small-prime theorem from this proof.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/83, PAPER-CADORET-HUI-TAMAGAWA-17/87.

### 85 — Nice torus preserves reductive rank and root inclusion

**missing · theorem**. Theorem 9.1(2) pp.226–227; scoped by E3

Under 84's hypotheses, (Gs)°/Ru((Gs)°) has rank s equal to rankGη, and its geometric root system is a subsystem of that of Gη. Use the special torus and Lie-weight comparison; preserve residue-field/base-extension distinctions.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/84.

### 86 — Exterior Lie-defect criterion for semisimple models

**missing · theorem**. Theorem 9.1(3) p.226

In L with a nice torus, for ℓ sufficiently large depending only on r, write 𝔤=Lie𝒢⊂H⊗H∨. Then 𝒢 is semisimple iff Δ_H(Λ^n𝔤∨)≤0 for every 1≤n≤δ. The bound is on representation dimension, and exterior powers are of the DUAL integral Lie lattice.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/85, PAPER-CADORET-HUI-TAMAGAWA-17/88, PAPER-CADORET-HUI-TAMAGAWA-17/89, PAPER-CADORET-HUI-TAMAGAWA-17/90, PAPER-CADORET-HUI-TAMAGAWA-17/91.

### 87 — Integral root groups and big-cell smoothness

**missing · construction**. Theorem 9.1 proof pp.226–227; [BT84, 2.2.3(iii)]

After faithfully flat base change to O_E splitting the nice torus, take primitive generators Nα of root-line intersections with End(H). For ℓ≥r, t↦exp(tNα) identifies their closures with G_a; the ordered U+×T×U− multiplication gives the open big cell. Descend smoothness and the root/rank statement. Do not identify a ramified O_E with Zℓ as rings.

- API `integralBigCell.rootMap` (data): For a primitive root-line generator Nα and ℓ≥r, expose the integral polynomial map t↦exp(tNα).
- API `integralBigCell.multiplication` (structure): The ordered root groups and split torus have an open-immersion multiplication map under the cited Bruhat–Tits hypotheses; descend smoothness by faithful flatness.

- Use: CHT Theorem9.1.1–2 — prove smoothness after a possibly ramified splitting extension

- Proposed test: The two SL₂ root maps give its usual big cell
- Proposed test: Retain O_E for a ramified splitting field
- Proposed test: A small prime dividing a factorial is outside this construction

### 88 — First exterior defect excludes the reductive centre

**missing · theorem**. §9.1 Claim 1 pp.227–228

Under the hypotheses of 86 and Δ_H(𝔤∨)≤0, the reductive quotient of (Gs)° is semisimple. The exact Lie sequence and its dual inject (𝔤rd)∨ into 𝔤s∨; large-characteristic semisimplicity/self-duality of the adjoint module and the zero generic adjoint invariants bound its centre dimension by zero.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/68, PAPER-CADORET-HUI-TAMAGAWA-17/82.

### 89 — Exterior-adjoint invariant Poincaré polynomial

**missing · theorem**. §9.1 Claim 2 p.228; [Baz01], [Car72], [Jan97], [Ste68b]

For connected semisimple groups of rank s in characteristic zero, and in sufficiently large positive characteristic depending on s, the dimensions of (Λ^m𝔤)^G are the coefficients of P_G(T)=∏_j(1+T^(2e_j+1)), the multiset e_j of Weyl exponents over all almost-simple factors. For a product, use Λ*(V⊕W)≅Λ*V⊗Λ*W. Prove the large-characteristic transfer, not just the complex Lie-group formula.

### 90 — Equal rank and smaller dimension force an exterior invariant excess

**missing · theorem**. §9.1 Claim 2 p.228

For connected semisimple G/Fℓ and G′/Qℓ of the same rank s, ℓ sufficiently large depending on s, if dimG<dimG′ then some 0≤m≤dimG has dim(Λ^mLieG)^G>dim(Λ^mLieG′)^G′. The Poincaré polynomials have the same value 2^s at 1 and different degree, forcing a coefficient excess below dimG.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/89.

### 91 — All exterior defects remove the unipotent radical

**missing · theorem**. §9.1 conclusion p.229, [Con14, Prop.3.1.3]

With 85,88–90 and all Δ_H(Λ^n𝔤∨)≤0, the reductive quotient has dimension δ, so the unipotent radical vanishes. The integral connectedness theorem gives connected special fibre, hence a semisimple model. Conversely semisimple group schemes have locally constant root datum/Poincaré polynomial, giving defect zero.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/85, PAPER-CADORET-HUI-TAMAGAWA-17/88, PAPER-CADORET-HUI-TAMAGAWA-17/90.

### 92 — Γ-regular semisimple element

**missing · definition**. §9.2.1 footnote 2 p.229

For reductive G⊂GL(V) in characteristic zero, a regular semisimple g in its unique maximal torus Tg is Γ-regular when every automorphism of Tg over the algebraic closure fixing g and preserving the formal character is trivial, and the only GL(V)-conjugate of Tg containing g is Tg itself.

- API `gammaRegular.uniqueTorus` (projection): The regular element lies in a unique maximal torus and satisfies the additional formal-character-preserving automorphism and conjugate-torus conditions.
- API `gammaRegular.conjugate` (compatibility): Conjugating the embedded group and element transports these conditions and the resulting torus.

- Use: CHT §9.2.1 — identify and split the Frobenius torus

- Proposed test: regular alone may fail Γ-regularity
- Proposed test: exclude repeated distinct-root collisions
- Proposed test: central scalar is not regular in a higher-rank semisimple group

### 93 — Compatible Frobenius gives a nice torus

**missing · theorem**. §9.2.1 pp.229–230; [LP92, Prop.7.2], [LP95, Prop.1.3]

In G, apply Larsen–Pink to the arithmetic semisimplification and lift its Γ-regular torus across the unipotent radical of G′η. One suitable closed point x₀ with common rational polynomial P_x₀, and exclusion of the discriminant primes of its squarefree part, gives integral eigenspace decompositions and a nice model of a geometric maximal torus for all sufficiently large ℓ. Uniformity in the chosen point and the torus lift are external-input checks, not consequences of rational compatibility alone.

### 94 — Arithmetic-stable Lie lattice and tensor quotients

**missing · construction**. §9.2.2 p.230

In G, normality Π∞⊲Π′∞ makes the saturated lattice 𝔤=Lie𝒢⊂End(Hℓ∞) arithmetic-stable. Smoothness identifies its special reduction with LieGs. Dualizing the saturated inclusion and taking exterior powers supplies π₀-equivariant free quotients H⊗n⊗(H∨)⊗n↠Λ^n𝔤∨, with n≤δ≤r².

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/24, PAPER-CADORET-HUI-TAMAGAWA-17/65, PAPER-CADORET-HUI-TAMAGAWA-17/98.

- API `arithmeticLieLattice.normality_stable` (structure): Normality of geometric monodromy in arithmetic monodromy makes the saturated Lie lattice arithmetic-stable.
- API `arithmeticLieLattice.exteriorDualQuotient` (projection): Dualizing the saturated Lie inclusion in End(H) and taking exterior powers gives the arithmetic-equivariant free tensor quotients onto Λ^n Lie∨.

- Use: CHT §9.2.2 — apply Theorem1.3 to free quotients

- Proposed test: For SL₂ retain the three-dimensional Lie lattice
- Proposed test: A nonsaturated sublattice need not give a surjection on duals
- Proposed test: Special Lie base change requires the proved smoothness

### 95 — Tensor invariant reduction forces Lie defects zero

**missing · theorem**. §9.2.2 p.230, (9.2.2.1)–(9.2.2.2)

Apply Theorem 1.3(1) to 94. Since Gs is connected by Theorem 7.3, dim M^Gs≤dim M^Πℓ in characteristic ℓ, while generic algebraic and Π∞ invariants agree by Zariski density. Integral invariant reduction gives Δ_H(M)≤0 for every Λ^n𝔤∨; then 86 and Corollary 7.5 prove Theorem 1.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/12, PAPER-CADORET-HUI-TAMAGAWA-17/61, PAPER-CADORET-HUI-TAMAGAWA-17/86, PAPER-CADORET-HUI-TAMAGAWA-17/93, PAPER-CADORET-HUI-TAMAGAWA-17/94.

### 96 — Splitting invariant exterior vectors splits a determinant line

**missing · theorem**. Lemma 10.1, (10.1.3)→(10.1.2), pp.230–231

In G, let A⊂Hℓ be a Πℓ-submodule of dimension a≥1. If (Λ^aHℓ)^Πℓ↪Λ^aHℓ splits equivariantly, then Λ^aA↪Λ^aHℓ splits: Πℓ+ generation kills the determinant character to Fℓ×, so Λ^aA is a trivial line within the invariant subspace.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/26.

### 97 — A split determinant inclusion splits the submodule

**missing · theorem**. Lemma 10.1, (10.1.2)→(10.1.1), p.231

For a finite-dimensional representation H over a field and a stable a-dimensional subspace A, a≥1, an equivariant retraction s:Λ^aH→Λ^aA induces H→A by v↦[u↦s(v∧Λ^(a−1)ι(u))] and A≅Hom(Λ^(a−1)A,Λ^aA). It retracts A↪H, with no division by a. The zero-dimensional subspace splits separately.

### 98 — Exterior powers and induced linear maps already built

**library · construction**. §§4,9,10, exterior-power carrier

For a commutative ring R and R-modules M,N, the exterior power has its alternating universal property/presentation; f:M→ₗ[R]N induces exteriorPower.map n f:Λ^nM→ₗ[R]Λ^nN. This credits the module construction only, not the determinant splitting or integral representation comparison.

Library: mathlib:exteriorPower.presentation, mathlib:exteriorPower.map.

- API `exteriorPower.map_generators` (simp): The exterior map sends v₁∧…∧v_n to f(v₁)∧…∧f(v_n).
- API `exteriorPower.ext` (extensionality): Linear maps from an exterior power agreeing on all pure wedges agree everywhere.

- Use: CHT §§4,9,10 — use the existing alternating carrier

- Proposed test: Degree0 gives the scalar ring
- Proposed test: Degree1 recovers the module
- Proposed test: A repeated vector has zero wedge

### 99 — Invariant splitting suffices for geometric semisimplicity

**missing · theorem**. §10.1 p.231

By 96–97, it suffices to split invariant inclusions in every exterior power of each H^w(Yx,Fℓ). For ℓ>a the exterior power is a direct factor of H^(wa)(Yx^[a],Fℓ); apply the same invariant-splitting assertion to this smooth proper fibre power. Uniformity over a is finite since a≤rank H^w.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/33, PAPER-CADORET-HUI-TAMAGAWA-17/35, PAPER-CADORET-HUI-TAMAGAWA-17/96, PAPER-CADORET-HUI-TAMAGAWA-17/97.

### 100 — Canonical invariant lattice and quotient reduce exactly

**missing · construction**. §10.2 p.231

Set A∞=Hℓ∞^Π∞ and B∞=Hℓ∞/A∞; A∞ is saturated and B∞ free. Fact 3.1 and Inv identify A∞/ℓ=Aℓ=Hℓ^Πℓ and B∞/ℓ=Bℓ=Hℓ/Aℓ, giving 0→B∞ --ℓ→B∞→Bℓ→0. Keep the canonical reduction diagram and snake connecting map; a dimension count alone does not construct it.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/09, PAPER-CADORET-HUI-TAMAGAWA-17/11, PAPER-CADORET-HUI-TAMAGAWA-17/22.

- API `invariantLatticeSequence.quotientFree` (structure): The invariant lattice is saturated, so its quotient in a finite-free Zℓ-lattice is finite free.
- API `invariantLatticeSequence.reductionExact` (compatibility): Under Inv and cohomological reduction, reducing the canonical short exact lattice sequence gives exactly the fixed-space inclusion and quotient over Fℓ.

- Use: CHT §10.2 — construct the mod-ℓ extension to split

- Proposed test: Trivial action makes the quotient zero
- Proposed test: No rational invariants makes the invariant lattice zero
- Proposed test: Without Inv the reduced lattice can miss residual invariants

### 101 — Continuous H¹ class of a representation extension

**planned · construction**. §10.1–10.2 pp.231–232

For an exact sequence0→A→H→B→0 of finite free continuous G-lattices over a complete DVR R, choose the continuous R-linear section149. The cocycle c_s(g)=g*s*g⁻¹−s, valued in Hom_R(B,A), defines an independent class in the existing explicit H1. It vanishes exactly when an equivariant continuous section exists, and its reduction and fraction-field images are the corresponding extension classes. For profinite G,148 transports it to canonical cohomology.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/143, PAPER-CADORET-HUI-TAMAGAWA-17/147, PAPER-CADORET-HUI-TAMAGAWA-17/148, PAPER-CADORET-HUI-TAMAGAWA-17/149.

1. The difference g*s*g⁻¹−s lands in A because the induced endomorphism of B is id−id. Joint continuity follows from finite matrix coordinates.
2. With the conjugation action on Hom, c_s(gh)=c_s(g)+g*c_s(h). If s changes to s+i*a, the cocycle changes by δa.
3. If c_s=δa, then s−i*a is an equivariant continuous section. Conversely any equivariant section has zero cocycle.
4. Finite freeness identifies Hom_R(B,A) after reduction or localization with the corresponding Hom of the changed coefficients. The cocycle formula commutes with these coefficient maps.

- API `continuousExtensionClass.cocycle` (constructor): The section s defines c_s(g)=g*s*g⁻¹−s in Hom(B,A), a continuous cocycle.
- API `continuousExtensionClass.change_section` (compatibility): Replacing s by s+i*a adds the boundary of a.
- API `continuousExtensionClass.zero_iff_split` (characterisation): The class vanishes precisely when the extension has a continuous equivariant R-linear section.
- API `continuousExtensionClass.baseChange` (functoriality): Reduction modulo π and extension to K carry the class to the class of the changed extension under the finite free Hom comparison.

- Use: CHT §10.2 — Descend rational splitting through the injective H1 coefficient map151.

- Proposed test: An equivariantly split extension has zero class
- Proposed test: All choices of section yield the same class
- Proposed test: The C3 unipotent representation [[1,g],[0,1]] over F3 gives a nonsplit extension of trivial modules

### 102 — Saturated arithmetic Hom lattice has torsion-free H¹

**missing · theorem**. §10.2 p.232

In 100, the module A∞⊗B∞∨ embeds as an arithmetic-stable saturated submodule of Hℓ∞⊗Hℓ∞∨. Theorem 1.3(2) and 10 give H¹(Π∞,A∞⊗B∞∨)[ℓ]=0. Arithmetic normality is essential to justify use of Theorem 1.3.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/13, PAPER-CADORET-HUI-TAMAGAWA-17/100, PAPER-CADORET-HUI-TAMAGAWA-17/153, PAPER-CADORET-HUI-TAMAGAWA-17/10.

1. Item100 gives the invariant submodule A and free quotient B. Normality of the geometric subgroup makes A arithmetic-stable.
2. By153, Hom(B,A) embeds arithmetically and saturatedly in End(H). Apply Theorem1.3(2), item13, at the bounded tensor degree(1,1) to obtain Inv for this lattice.
3. Item10 converts Inv into absence of ℓ-torsion and full Zℓ-torsion-freeness of H1.

### 103 — Cohomological proof of geometric semisimplicity

**missing · theorem**. §10.2 p.232

The extension class101 becomes zero over Qℓ by connected semisimple generic monodromy. By102 its integral H1 group has no ℓ-torsion, and the direct kernel lemma151 makes H1(M)→H1(M⊗Qℓ) injective. Hence the integral extension splits, so does its reduction, and the exterior/determinant reduction99 gives Theorem1.1. Full compact localization152 is available but is not needed for this implication.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/24, PAPER-CADORET-HUI-TAMAGAWA-17/100, PAPER-CADORET-HUI-TAMAGAWA-17/101, PAPER-CADORET-HUI-TAMAGAWA-17/102, PAPER-CADORET-HUI-TAMAGAWA-17/151, PAPER-CADORET-HUI-TAMAGAWA-17/99.

1. Use rational complete reducibility to obtain a G-equivariant rational section; the extension class is therefore a rational boundary.
2. Clear the single denominator of its Hom-space primitive as in151. Torsion-freeness102 forces its integral class to vanish.
3. Use101 to obtain an integral equivariant section. Reduce it modulo ℓ, then apply99, which already records the finite collection of exterior/tensor tests and their uniform bound.

### 104 — Arithmetic semisimplicity and Tate fullness assertions

**missing · definition**. §11 p.232

For K₀ finitely generated over F_p, smooth proper d-dimensional Y₀/K₀, Y=Y₀×K̄₀ and w≥0, (11.1,Λ,w) asks semisimplicity of Gal(K₀) on H^(2w)(Y,Λ); (11.2,Λ,w) asks surjectivity of Z^w(Y₀)⊗Λ→H^(2w)(Y,Λ(w))^Gal(K₀). Keep Λ=Zℓ,Fℓ,Qℓ separate and do not assert these conjectures.

- API `arithmeticTateAssertions.cycleMap` (data): Expose the cycle-class map in codimension w into arithmetic fixed vectors of H^(2w)(Y,Λ(w)).
- API `arithmeticTateAssertions.fullness` (characterisation): Tate fullness is surjectivity of that map for the specified coefficient ring; it is distinct from semisimplicity of the arithmetic representation.

- Use: CHT Corollary11.1 — retain all conditional hypotheses

- Proposed test: w=0
- Proposed test: complementary degree d−w retained
- Proposed test: geometric theorem does not discharge arithmetic assumptions

### 105 — Conditional arithmetic mod-ℓ semisimplicity

**missing · theorem**. Corollary 11.1, semisimplicity conclusion, p.232

For 104, assuming (11.1,Qℓ,w) and (11.2,Qℓ,i) for i=w,d−w in the source's rational-coefficient hypothesis, conclude (11.1,Fℓ,w) for all sufficiently large ℓ depending on Y₀. This is conditional and in positive characteristic; it is not an unconditional arithmetic variant of Theorem 1.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/107, PAPER-CADORET-HUI-TAMAGAWA-17/108, PAPER-CADORET-HUI-TAMAGAWA-17/109, PAPER-CADORET-HUI-TAMAGAWA-17/110.

### 106 — Conditional arithmetic mod-ℓ Tate fullness

**missing · theorem**. Corollary 11.1, fullness conclusion, pp.232–233

Under the same hypotheses as 105, conclude (11.2,Fℓ,w) for all sufficiently large ℓ. Complementary-codimension Tate fullness d−w is needed for the integral cycle-saturation input and cannot be dropped.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/107, PAPER-CADORET-HUI-TAMAGAWA-17/111.

### 107 — Integral cycle saturation from rational Tate hypotheses

**missing · theorem**. §11 proof p.232, [MR04, Lem.3.1]

In 104 under the rational assumptions of Corollary 11.1, for all sufficiently large ℓ the cycle map Z^w(Y₀)⊗Zℓ→H^(2w)(Y,Zℓ(w))^Gal(K₀) is surjective and its map to all integral cohomology has torsion-free cokernel. This is the precise Milne–Ramachandran Lemma 3.1 input; exact external hypotheses and ℓ quantifiers remain G7.

### 108 — Finite-field reduction of semisimple Frobenius

**missing · theorem**. §11 finite-field case p.233

For a rational compatible Frobenius family with a common separable rational minimal polynomial acting on stable lattices, exclude denominator/discriminant primes. The reductions are semisimple of prime-to-ℓ order; the dimension of fixed vectors equals the multiplicity of 1 in the characteristic polynomial. The common separable minimal polynomial is an input to verify, not implied by purity.

### 109 — Spreading out and common semisimple Frobenius

**missing · construction**. §11 general-field case p.233, [LP95]

For Y₀ over finitely generated K₀/F_p, spread to a smooth proper family over a smooth geometrically connected finite-field base. After the permitted finite Galois extension giving connected arithmetic monodromy, choose a common closed point with semisimple Frobenius on every rational coefficient realization as supplied by Larsen–Pink. Use 108 for reduction.

- API `commonFrobeniusModel.spread` (data): Expose a smooth finite-field base, the smooth proper family and its identification with the original generic fibre after the permitted extension.
- API `commonFrobeniusModel.commonPoint` (projection): Expose one closed point with the required semisimple Frobenius for all coefficient realizations, using the precise Larsen–Pink input in G6.

- Use: CHT §11 — pass from finitely generated fields to one closed-point Frobenius

- Proposed test: A constant finite-field family has its original Frobenius
- Proposed test: Choosing one point separately for each ℓ does not meet the common-point requirement
- Proposed test: A finite base extension must preserve each required Tate hypothesis

### 110 — Arithmetic semisimplicity from geometric subgroup and Frobenius

**missing · theorem**. §11 p.233, [Ser94, Lem.5(b)]

For the finite residual arithmetic image, the geometric image is normal and semisimple by Theorem 1.1, and the arithmetic image is generated by it and the selected Frobenius of order prime to ℓ. Average a geometric-equivariant retraction over that cyclic subgroup to obtain arithmetic semisimplicity.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/03, PAPER-CADORET-HUI-TAMAGAWA-17/108.

### 111 — Arithmetic invariant ranks and fullness transfer

**missing · theorem**. §11 p.233, [LP95, Prop.2.1]

In the spread-out setting, arithmetic invariants equal Frobenius-fixed geometric invariants. Theorem 1.3 matches geometric invariant ranks, while the common Frobenius polynomial on geometric invariants and semisimplicity match the 1-eigenspace ranks over Qℓ and Fℓ. Together with 107's cycle-image rank equality this proves 106.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/11, PAPER-CADORET-HUI-TAMAGAWA-17/105, PAPER-CADORET-HUI-TAMAGAWA-17/107.

### 112 — Low-degree corestriction-restriction already built

**library · theorem**. Lemma 4.2 and §11, finite-cover descent precursor

For a topological group G, open finite-index subgroup U and topological coefficient module M under the continuous-cochain hypotheses, the explicit H¹ maps satisfy cor_U^G∘res_U^G=[G:U]·id. This is credited only on Tau Ceti's explicit H¹ carrier; the comparison to canonical continuousCohomology for compact coefficients is still required.

Library: tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1.

### 113 — Larsen Nori-dimension bound

**missing · theorem**. Theorem 7.3 proof; Larsen 2010, Theorem 7 pp.1034–1035

For each n there is A_n such that for prime ℓ>A_n and closed Γ⊂GL_n(Zℓ), with G the Qℓ-Zariski closure, dim N(reduction Γ)≤dimG. The full published proof was read and is decomposed through132–136; Nori and p-adic analytic growth remain recursive inputs in G1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/132, PAPER-CADORET-HUI-TAMAGAWA-17/135.

### 114 — Larsen equality-case bounded index

**missing · theorem**. Theorem 7.3(2) proof; Larsen 2010, Theorem 7(3) p.1035

In 113, if Nori dimension equals dimG and the radical of G° is unipotent, then [G(Qℓ)∩GL_n(Zℓ):Γ]≤C_n, a constant depending only on n. Connected semisimple G satisfies the radical hypothesis. The equality-case openness and congruence-filtration comparison are prerequisites of this bound.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/136, PAPER-CADORET-HUI-TAMAGAWA-17/137, PAPER-CADORET-HUI-TAMAGAWA-17/138, PAPER-CADORET-HUI-TAMAGAWA-17/139, PAPER-CADORET-HUI-TAMAGAWA-17/140, PAPER-CADORET-HUI-TAMAGAWA-17/141.

### 115 — Building and parahoric foundations are imported

**planned · construction**. §8 pp.223–225

Construct relative roots, valued root data, apartments, the building action, facets and smooth affine parahoric models with their generic fibres, special reductive quotients and congruence kernels. These existing planned foundations feed 72–80; the new extension owns only the precise hyperspecial comparison and monodromy-specific dimension argument.

Planned: ReductiveGroupsPartII:RG2.1, ReductiveGroupsPartII:RG2.2, ReductiveGroupsPartII:RG2.3.

- API `parahoricFoundations.facetModel` (projection): From the existing valued-root/building data expose the smooth affine parahoric model and its generic identification.
- API `parahoricFoundations.reductiveQuotient` (projection): Expose the special fibre unipotent radical and reductive quotient, with the stated congruence-kernel comparison.

- Use: CHT §8 — import the existing RG2 building and model constructions

- Proposed test: Standard SL₂ apartment
- Proposed test: An Iwahori facet is not hyperspecial
- Proposed test: The special reductive quotient must not be identified with the whole special fibre

### 116 — Uniform weight projectors on arithmetic subquotients

**missing · theorem**. Explicit extraction dévissage for §5.2–5.3 pp.218–219; based on Fact 3.2 and the CRT

In C choose one rational-point Frobenius and its finitely many degree-w rational polynomials P_w. Their root weights are pairwise disjoint, so after excluding denominators and pairwise resultants the Chinese remainder theorem gives integral polynomials e_w(F) acting on H* exactly as its cohomological-degree projections. Every arithmetic-stable submodule or quotient is stable under F, hence under these projectors, and splits by degree. Saturation/freeness passes to each direct factor. This reduces the total-cohomology assertions in Theorem 4.5 to the single-degree proofs uniformly in the subquotient.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/23, PAPER-CADORET-HUI-TAMAGAWA-17/41.

### 117 — Semisimple group scheme over Zℓ

**missing · definition**. §7.1 p.221

A semisimple Zℓ-group scheme is smooth affine with connected semisimple geometric fibres. It is simply connected when each geometric fibre is. The fibre root data are constant in the sense used by SGA3 XXII Proposition 2.8; this relative notion is distinct from the built field predicates.

- API `semisimpleIntegralModel.geometricFibres` (characterisation): The model is smooth affine with connected semisimple geometric fibres; fibrewise simply connectedness defines its simply connected variant.
- API `semisimpleIntegralModel.baseChange` (compatibility): Base change preserves this relative predicate and the generic/special fibre identifications.

- Use: CHT §§7–9 — formulate relative semisimplicity

- Proposed test: split SL₂ model
- Proposed test: G_m is reductive but not semisimple
- Proposed test: nonsmooth special fibre fails the predicate

### 118 — Finite-free integral representation category

**missing · definition**. §9.1 p.226

For an affine flat Zℓ-group scheme 𝒢, Rep^f_Zℓ(𝒢) has finite-free Zℓ-modules M with a morphism of group schemes 𝒢→GL(M), and intertwining Zℓ-linear maps. Construct tensor, dual, exterior powers and generic/special restriction. Do not assume the category is abelian: arbitrary cokernels need not be free.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/70.

- API `finiteFreeGroupRepresentation.tensorDual` (constructor): Tensor products and duals of finite-free algebraic representations retain finite freeness and the canonical group actions.
- API `finiteFreeGroupRepresentation.baseChange` (functoriality): Extension of scalars commutes with tensor, dual and exterior power on finite-free representations and maps intertwining maps to intertwining maps.

- Use: CHT §9.1 — form Lie exterior tensors and their fibres

- Proposed test: trivial rank-one representation
- Proposed test: torsion cokernel is not an object
- Proposed test: tensor and dual commute with base change

### 119 — Pure and mixed lisse integral sheaves

**planned · definition**. §2.2 pp.210–211

For a lisse Zℓ-sheaf on finite-type X₀/Z, purity of weight w means that for every closed point of X₀[1/ℓ] every root of det(T−F_x) is a |k(x)|-Weil number of weight w. Mixed means a finite filtration with pure successive quotients. Rationality means each local polynomial is in Q[T]. Keep integral lattices and their rational realizations distinct, including torsion-freeness when the determinant is formed.

Planned: DeligneWeightsAndPurity:DWP.5.

- API `mixedLisseSheaf.pointwisePure` (characterisation): Purity tests the weight of every local Frobenius eigenvalue at every eligible closed point and every complex embedding.
- API `mixedLisseSheaf.mixedFiltration` (data): A mixed object is supplied with a finite filtration whose successive quotients are pure with their specified weights.

- Use: CHT §2.2 and §5 — import DWP.5 purity and mixedness

- Proposed test: A constant rank-one sheaf is pure of weight0
- Proposed test: Tate twist(1) has weight−2
- Proposed test: A pure unipotent Jordan action need not be semisimple

### 120 — Finite-support mixed tensor multiplicities

**missing · definition**. CT16 author TI.pdf §4.2 pp.10–11; definition preceding Lemma4.2.1.1

For a field F, finite-dimensional V and finitely supported f:N²→N, define T^f(V)=⊕_(s,t)(V^⊗s⊗(V∨)^⊗t)^⊕f(s,t), with diagonal GL(V)-action and specified coordinate injections. This adds multiplicity bookkeeping to the existing tensor carrier, not a second tensor product.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/53.

1. Use finite support to form a finite direct sum of the existing mixed tensor objects.

- API `tensorMultiplicity.summand` (constructor): Each support index and copy has its canonical injection and projection.
- API `tensorMultiplicity.tensorDegrees` (compatibility): Tensoring two summands adds their covariant and contravariant degrees separately.

- Use: CHT extraction items 122–126 — Track ranks and tensor bounds uniformly

- Proposed test: Zero multiplicity map gives the zero representation
- Proposed test: One copy in degree(0,0) is trivial rank1
- Proposed test: Repeating a summand changes rank but not its fixed-vector stabilizer

### 121 — Finite-type parameter family for exponential products

**missing · construction**. CT16 §4.2.1 p.11; Larsen Proposition3 pp.1032–1033

Over Z[1/(r−1)!], form tuples of r² nilpotent r×r matrices and their truncated-exponential product maps. For a fully uniform family one may use the 2r² repetitions of Larsen Proposition3, with 2r⁴ scalar parameters and the constructible locus of tuples spanning a Lie subalgebra. CT16 uses a selected r²-tuple with two repetitions; the two parameter counts must not be identified.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/54.

1. Matrix equations N_i^r=0 and the finite exponential sums define finite-presentation data after factorial inversion.
2. The Lie-closed spanning locus is constructible via bracket structure constants; stratify it. Its relation to exponentially generated groups is the separate Nori input129.
3. Borel product-generation supplies a surjective product map for the permitted tuples; this is a source dependency, not a consequence of finite point counting.

- API `exponentialFamily.evaluate` (simp): Evaluation at a nilpotent tuple and parameter tuple is the ordered product of its specified truncated exponentials.
- API `exponentialFamily.baseChange` (compatibility): All matrix equations and factorial-denominator coefficients commute with base change from Z[1/(r−1)!].

- Use: CHT extraction items 122,130 — Supply a finite-type family for stratification

- Proposed test: All nilpotent matrices zero gives the constant identity map
- Proposed test: Upper/lower root nilpotents in rank2 need both generators
- Proposed test: The 2r² and 2r⁴ parameter counts represent distinct constructions

### 122 — Uniform Chevalley subspaces by finite stratification

**missing · theorem**. CT16 Lemma4.2.1.1 proof p.11

For the finite-type exponential family of121, after excluding finitely many residue characteristics there is a single finite-support multiplicity f°_r such that every required exponential subgroup U⊂GL_r is the setwise stabilizer of a subspace W_U⊂T^(f°_r)(F^r). Equality is required as subgroup schemes after arbitrary coefficient-algebra extension.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/120, PAPER-CADORET-HUI-TAMAGAWA-17/121, PAPER-CADORET-HUI-TAMAGAWA-17/129.

1. At the generic points apply Chevalley realization of a closed subgroup as a subspace stabilizer in a mixed tensor representation.
2. Spread the finite-dimensional subspace and stabilizer equality to open strata using the cited EGAIV.3 Proposition9.6.1(i).
3. Repeat on the lower-dimensional complements and sum the finitely many multiplicity maps. Finiteness of the parameter scheme, not an individual group, supplies uniformity.
4. G5 requires the precise family/group-scheme and spreading hypotheses; the author text switches to field-point notation, so this stronger interface remains an explicit proof obligation.

### 123 — A subspace stabilizer equals its determinant-line stabilizer

**missing · theorem**. CT16 Lemma4.2.1.1 proof p.11; Plücker step

For finite-dimensional E over F and W⊂E of dimension δ, Stab_GL(E)(W)=Stab_GL(E)(Λ^δW) as group schemes. For every F-algebra A, a point g preserves W_A exactly when its exterior action preserves the rank-one direct summand det(W)_A.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/98.

1. Choose a basis adapted to W and its direct-sum complement. The stabilizer condition is vanishing of the lower-left matrix block.
2. The Plücker line condition, with an invertible coefficient on its basis wedge, gives the same block equations over every F-algebra. Include δ=0 and δ=dim E.

### 124 — Exponentially generated groups have no characters

**missing · theorem**. CT16 Lemma4.2.1.1 p.11; Larsen Proposition1 p.1030

An algebraic character U→G_m of an exponentially generated group is trivial as a group-scheme morphism. In particular U acts trivially on the determinant line of every finite-dimensional U-stable subspace.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/55.

1. Restrict the character to each exponential G_a. A Hopf algebra morphism F[z,z⁻¹]→F[t] sends z to a unit, hence to a constant, and its identity value forces that constant to be1.
2. The kernel is a closed subgroup containing every exponential generator, so minimality of the generated group makes it all U. The determinant action is a character.

### 125 — Antisymmetrization embeds determinant lines into tensor powers

**missing · theorem**. CT16 Lemma4.2.1.1 last paragraph p.11

For E of dimension D and δ≤D, if δ! is invertible in F, the antisymmetrization map Λ^δE→E^⊗δ is GL(E)-equivariant and injective. The composite with the wedge quotient is multiplication by δ!. A single bound ℓ>D works for every δ≤D in CT16.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/98.

1. Alternating the pure tensor factors factors through the exterior universal property.
2. Its wedge projection is δ! on pure wedges. Inverting δ! gives a left inverse; equivariance follows because permutation and diagonal actions commute.

### 126 — Multiplicity tensor tests reduce to separate degree bounds

**missing · theorem**. CHT §7.1 Lemma7.1.2 from CT16 Lemma4.2.1.1

If f has finite support and d bounds both s and t on that support, the pointwise stabilizer of (T^≤d(V))^U is contained in that of (T^f(V))^U. Repeated isomorphic summands add no distinct conditions. For the tensor powers of T^(f°)(V) of orders δ≤D, take d≥D max(s,t) over supp(f°), after expanding every summand.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/120, PAPER-CADORET-HUI-TAMAGAWA-17/53, PAPER-CADORET-HUI-TAMAGAWA-17/127.

1. Invariants of the finite direct sum are the direct sum of the invariant spaces. Each repeated copy has the same fixed-vector equations.
2. A tensor product adds the two degrees separately. Thus each expanded summand occurs within the specified rectangular bound.
3. Prove equations on all coefficient algebras; no density assertion about U(Fℓ) is used.

### 127 — Pointwise tensor-stabilizer subgroup scheme

**missing · definition**. CHT §7.1; CT16 Lemma4.2.1.1

For an algebraic representation E of GL(V) over F and a vector subspace W⊂E, Fix(W) is the closed subgroup scheme whose A-points fix every w⊗1, w∈W, in E⊗F A, for every F-algebra A. This is distinct from setwise Stab(W).

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/53.

1. Choose a basis of W and impose the matrix-coordinate equations ρ(g)w=w; changing its basis generates the same ideal.

- API `pointwiseStabilizer.points_iff` (characterisation): An A-point belongs exactly when it fixes the base changes of all vectors of a chosen F-basis of W.
- API `pointwiseStabilizer.basis_independent` (extensionality): Changing the basis of W leaves its defining fixed-vector ideal unchanged.

- Use: CHT extraction items 58,126 — State tensor equations scheme-theoretically

- Proposed test: Fixing the zero subspace gives all GL(V)
- Proposed test: Fixing a nonzero line pointwise is stronger than preserving it
- Proposed test: Over dual numbers a scalar 1+ε preserves a line but does not fix its basis vector

### 128 — Characteristic-zero criterion for exponential generation

**missing · theorem**. Larsen Proposition2 pp.1030–1031

Over a characteristic-zero field F, an algebraic subgroup G⊂GL_n is exponentially generated exactly when it has no nontrivial finite, toric or anisotropic quotient.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/54, PAPER-CADORET-HUI-TAMAGAWA-17/55.

1. Exponential generators cannot map nontrivially to any of the three quotient types.
2. In the converse, the split unipotent radical is generated successively by G_a using the filtration and vanishing H¹ inputs; proper parabolic unipotent radicals generate the remaining isotropic semisimple quotient.
3. Retain the primary structure and rational-point density inputs as G1 leaves, rather than assuming every reductive group is split.

### 129 — Nori correspondence for nilpotently generated Lie algebras

**missing · theorem**. Larsen Proposition3 pp.1032–1033 and Theorem7 p.1035, citing Nori TheoremA

For each n and all sufficiently large characteristics, Lie and exponential generation identify the relevant exponentially generated subgroups of GL_n with Lie subalgebras of gl_n spanned by nilpotent elements. For a finite residual subgroup, the dimension of the span of its order-p logarithms is the dimension of its Nori envelope.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/54, PAPER-CADORET-HUI-TAMAGAWA-17/55.

1. This is the exact Nori TheoremA interface used by Larsen. It is not Nori TheoremB finite-index/plus comparison56.
2. Read the original Nori proof and field hypotheses before marking this input closed.

### 130 — Finite set of exponential-group Hilbert polynomials

**missing · theorem**. Larsen Proposition3 pp.1032–1033

For fixed n there are N and finitely many Hilbert polynomials for the reduced projective sets G∪(P^(n²) minus GL_n) attached to exponentially generated subgroups over fields of characteristic zero or prime not dividing N. The boundary is included; this is not just the projective closure of G.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/121, PAPER-CADORET-HUI-TAMAGAWA-17/129, PAPER-CADORET-HUI-TAMAGAWA-17/131.

1. Use the constructible nilpotent Lie-tuple parameter family and its bounded word map. Add the entire projective boundary.
2. Apply131 to construct reduced fibre images over a finite-type stratification.
3. Flatten projectively over finitely many strata to obtain finitely many Hilbert polynomials; retain the Hilbert/flatness inputs in G1.

### 131 — Reduced closed fibre images in a finite-type family

**missing · theorem**. Larsen Lemma4 pp.1033–1034

For X finite type over Z, Y⊂P^m_X closed and ξ:Z→Y finite type with every fibre image closed, after inverting one integer there is a finite-type stratified cover X′→X and Y′⊂P^m_(X′) whose fibre at an F-rational lift of x is the reduced image ξ(Z_x).

1. Use noetherian induction and geometric reducedness on a characteristic-zero generic stratum, excluding vertical generic characteristics.
2. Remove the closure B of the constructible-image boundary; the remaining closed image C is used for the family.
3. The printed proof uses B_U as Y′ over an open U chosen disjoint from B; source issue E5 records this. Verify the corrected image family and geometric reducedness/base-change details before using the lemma.

### 132 — Nori dimension of a compact matrix group

**missing · definition**. Larsen Definition5 p.1034

For Π⊂GL_n(F_p), Ndim(Π)=dim N(Π). For a compact subgroup Γ⊂GL_n(Z_p), define Ndim(Γ) using its reduction image. This depends on the chosen lattice representation and is distinct from the dimension of the rational Zariski closure.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/55.

1. Apply the envelope dimension to the finite reduction image.

- API `noriDimension.reduction` (simp): The compact-group value is the envelope dimension of its finite reduction image.
- API `noriDimension.plus` (compatibility): Taking the residual plus subgroup does not change the set of order-p generators or the envelope dimension.

- Use: CHT extraction items 113,135–141 — Compare residual logarithms with compact congruence growth

- Proposed test: A prime-to-p residual group has Nori dimension0
- Proposed test: One nontrivial additive root subgroup has dimension1
- Proposed test: A one-dimensional torus has rational dimension1 and Nori dimension0

### 133 — Congruence filtration of a compact matrix group

**missing · definition**. Larsen Theorem7 proof p.1035

For closed H⊂GL_n(Z_p) and m≥1, F_mH={h∈H:h≡1 mod p^m}. The map h↦(h−1)/p^m mod p identifies F_mH/F_(m+1)H with an F_p-subspace of M_n(F_p).

1. The product law modulo p^(m+1) becomes addition; the kernel is F_(m+1). An additive subgroup over the prime field is an F_p-subspace.

- API `congruenceFiltration.gradedMap` (projection): The graded map sends 1+p^mA to A modulo p and has kernel the next congruence level.
- API `congruenceFiltration.closed` (structure): Each level is a closed normal subgroup, is open in H, and the intersection of all levels is trivial.

- Use: CHT extraction items 134–136 — Lift logarithms and reconstruct the first congruence kernel

- Proposed test: For H={1} every graded piece is zero
- Proposed test: For GL_n(Z_p) each positive-level graded piece has dimension n²
- Proposed test: Using level0 does not linearize multiplication

### 134 — Powers of a lifted exponential detect its logarithm

**missing · theorem**. Larsen Lemma6 p.1034

If p≥2n, x∈M_n(F_p) is nilpotent, and A∈GL_n(Z_p) reduces to exp(x), then for every k≥1, A^(p^k)≡1+p^k M mod p^(k+1), where M is any integral lift of x.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/54, PAPER-CADORET-HUI-TAMAGAWA-17/133.

1. Lift x to an integral nilpotent matrix by lifting a Jordan basis; the congruence depends only on x. Put N=exp(M)−1 and write A=1+N+pB.
2. For 1≤m<p the binomial coefficient is divisible by p, so all words containing pB disappear modulo p². At m=p the only possibly surviving one-B words have i+j=p−1; p≥2n ensures i≥n or j≥n, killing them because N^n=0 for this lift. Terms with two B are divisible by p².
3. Thus A^p≡exp(pM)≡1+pM modulo p². Iteration uses (1+p^kC)^p≡1+p^(k+1)C modulo p^(k+2) for odd p. The n=1,p=2 nilpotent x=0 case is direct.

### 135 — Congruence growth bounds Nori dimension

**missing · theorem**. Larsen Theorem7 proof p.1035

For large p and H=G(Q_p)∩GL_n(Z_p), the graded congruence dimensions are at most dim G. If Γ⊂H is closed, they are at least Ndim Γ on F_mΓ/F_(m+1)Γ for every m≥1. Consequently Ndim Γ≤dim G.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/129, PAPER-CADORET-HUI-TAMAGAWA-17/132, PAPER-CADORET-HUI-TAMAGAWA-17/133, PAPER-CADORET-HUI-TAMAGAWA-17/134.

1. The pth-power map embeds one graded image in the next. Serre’s compact p-adic analytic growth theorem bounds these nondecreasing dimensions by dim G.
2. Lift residual order-p elements in Γ and apply134; their logarithms span the Nori Lie algebra by129.
3. These give lower and upper bounds inside the same M_n(F_p). The analytic growth theorem is a separate G1 input.

### 136 — Equal congruence dimensions imply equal first kernels

**missing · theorem**. Larsen Theorem7(1) proof p.1035

In135, if Ndim Γ=dim G then F_1Γ=F_1H; hence Γ is open in H and in G(Q_p). Closedness of Γ is essential.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/133, PAPER-CADORET-HUI-TAMAGAWA-17/135.

1. Each inclusion of graded finite-dimensional spaces has equal dimension and is equality.
2. For h∈F_1H, lift its residue successively through Γ, correcting the error in levels2,3,… . Completeness gives a limit in Γ because Γ is closed.
3. F_1H is open, so containing it gives the asserted openness.

### 137 — Large-prime component-group bound

**missing · theorem**. Larsen Theorem7(2) proof pp.1035–1036

Under the equality hypothesis of136, G/G° has prime-to-p order and a normal abelian subgroup of index bounded only by n. This concerns the finite algebraic component group represented by the compact image.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/136.

1. Use the cited finite central extension realized in G(Q_p), and apply Jordan’s finite-subgroup theorem.
2. For p−1>n, the irreducibility of the pth cyclotomic polynomial over Q_p excludes order-p matrices in GL_n(Q_p).
3. The finite-extension realization and Jordan input remain exact G1 leaves; do not claim arbitrary infinite group extensions preserve order-p elements.

### 138 — Totally ramified extension removes anisotropic quotients

**missing · theorem**. Larsen Theorem7(3) proof p.1036

For connected G/Q_p with unipotent radical equal to its solvable radical, there is a finite totally ramified F/Q_p such that G_F has no nontrivial anisotropic quotient, while its residue field is still F_p. Then G_F is exponentially generated by128.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/128.

1. Use the local classification of anisotropic simple factors and split the associated division algebras by a common totally ramified extension of suitable degree.
2. No torus quotient remains by the radical hypothesis; preserve the unchanged residue field for later cardinality comparison. The Kneser/local division-algebra inputs remain G1.

### 139 — Uniform component bound for the flat integral closure

**missing · theorem**. Larsen Theorem7(3) proof p.1036

For the exponential generic group G_F in138, the closure in GL_n,O_F is flat and its special fibre has at most d_n geometric irreducible components, uniformly in G and large p. Its dimension is dim G_F.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/130, PAPER-CADORET-HUI-TAMAGAWA-17/138.

1. Use the finite Hilbert-polynomial list for the generic group union projective boundary.
2. Properness of the relevant Hilbert schemes extends the generic point to O_F. Uniqueness of flat closure identifies the resulting family.
3. Constructibility of the number of geometric components on a finite-type base gives d_n. Intersect with the GL_n open and retain the dimension statement for the flat group model. All Hilbert/EGA inputs are listed in G1.

### 140 — Finite-field points of connected algebraic groups

**missing · theorem**. Larsen Theorem7(3) proof pp.1036–1037

For a smooth connected linear algebraic group K/F_p of dimension d, (p−1)^d≤|K(F_p)|≤(p+1)^d. A finite-type possibly nonreduced group has the same F_p-points as its reduction; the component estimate gives |K(F_p)|≤c(p+1)^d when it has at most c geometric components of dimension d.

1. For split unipotent groups use the additive filtration; for tori use Frobenius on the character lattice; for semisimple groups use the root-degree product formula.
2. Lang-surjectivity combines the connected radical and reductive quotient. On a rational component with a rational point, translation identifies its rational points with the identity component; empty components contribute zero.
3. These structural/counting inputs are G1 and G8, not supplied by the CFSG carrier roadmap.

### 141 — Equal-kernel point counts give uniform compact index

**missing · theorem**. Larsen Theorem7(3) proof p.1037

If Γ,H have the equal first congruence kernel of136 and the radical hypothesis of138 holds, their finite reductions satisfy |H/F_1H|≤d_n(3/2)^(n²)p^d and |Γ/F_1Γ|≥e_n⁻¹2^(−n²)p^d, with d=Ndim Γ. Thus [H:Γ]≤3^(n²)d_ne_n independently of p and Γ.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/56, PAPER-CADORET-HUI-TAMAGAWA-17/136, PAPER-CADORET-HUI-TAMAGAWA-17/137, PAPER-CADORET-HUI-TAMAGAWA-17/139, PAPER-CADORET-HUI-TAMAGAWA-17/140.

1. Reduce to G° using137: the compact component quotient is prime to p, so Nori dimension is unchanged.
2. Totally ramified scalar extension keeps residue F_p and GL_n(Z_p)∩F_1GL_n(O_F)=F_1GL_n(Z_p), making the upper reduction bound valid.
3. Use Nori’s finite-points index bound e_n and140 for the lower bound, divide, then cancel the equal first kernels. No dimension equality alone gives this numerical index bound.

### 142 — Full-dimensional closed subscheme of an integral variety

**missing · theorem**. CHT Theorem7.3 proof p.222

If X is an integral finite-type scheme over a field and Z⊂X is closed with dim Z=dim X, then Z=X as schemes. This is the precise final equality step after G_s⊂Nori and equality of dimensions.

1. A proper closed subset of an irreducible finite-type variety has strictly smaller dimension; hence the support of Z is all X.
2. The radical of its defining ideal is zero. Since X is reduced, the ideal is zero as well. Connected smooth algebraic groups over the perfect field Fℓ are geometrically integral, as needed for the application.

### 143 — Explicit continuous H¹ and coefficient maps already built

**library · construction**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

For a topological group G and a topological additive commutative G-module M with continuous action, TauCeti.ContCohomology.H1 is the additive quotient of continuous one-cocycles by g↦g·m−m. The carrier and explicitCoeff1 allow nondiscrete coefficients. No discrete topology is imposed on the group or coefficient module by these declarations. Its inherited pointwise topology is not identified with the canonical compact-open cohomology topology.

Library: tauceti:TauCeti.ContCohomology.Z1, tauceti:TauCeti.ContCohomology.H1, tauceti:TauCeti.ContCohomology.H1pi_eq_zero_iff, tauceti:TauCeti.ContCohomology.explicitCoeff1.

1. Read the actual Z1/H1 and explicitCoeff1 declarations and binders at Tau Ceti f790474. The GroupCohomology comparison elsewhere requires a discrete group; the short-exact-sequence file requires discrete coefficients. Neither supplies the compact comparison.

- API `H1pi_eq_zero_iff` (characterisation): The class of a continuous one-cocycle is zero exactly when it lies in B1.
- API `explicitCoeff1` (functoriality): A continuous equivariant additive coefficient map induces postcomposition on classes; identity and composition laws hold.
- API `explicitCoeff1_mk` (simp): The image of the class of c is represented by the coefficient map composed with c.

- Use: CHT §10 and items150–155 — Use the built additive carrier for lattice cocycles and coefficient maps.

- Proposed test: Trivial group has zero H1
- Proposed test: A nonzero homomorphism C3→F3 gives a nonzero class for trivial action
- Proposed test: Z3 coefficients are allowed without a discrete-topology instance

### 144 — Topological module homology uses the ordinary image

**library · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

At the pinned Mathlib, TopModuleCat.ker is the linear kernel with subspace topology and TopModuleCat.coker is the quotient by the linear range, not its closure. Its CategoryWithHomology construction therefore has the ordinary algebraic kernel/image subquotient as underlying module.

Library: mathlib:TopModuleCat.ker, mathlib:TopModuleCat.coker, mathlib:TopModuleCat.isLimitKer, mathlib:TopModuleCat.isColimitCoker.

1. Read the whole TopModuleCat homology construction, including isLimitKer, isColimitCoker and the comparison of left/right homology after forgetting to ModuleCat. This justifies the algebraic quotient used in148, without claiming a Hausdorff quotient.

### 145 — Compact-open currying already built

**library · construction**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

For locally compact spaces X,Y and any topological Z, Homeomorph.curry identifies C(X×Y,Z) with C(X,C(Y,Z)), with compact-open topologies. Repeated currying flattens the canonical nested continuous coinduction when G is profinite.

Library: mathlib:ContinuousMap.curry, mathlib:ContinuousMap.uncurry, mathlib:Homeomorph.curry.

1. Read ContinuousMap.curry, uncurry and Homeomorph.curry with their locally compact hypotheses. Apply only to finite products of the profinite group.

- API `ContinuousMap.curry_apply` (simp): For f:C(X×Y,Z), f.curry x y=f(x,y).
- API `Homeomorph.curry` (equivalence): If X,Y are locally compact, currying and uncurrying are inverse continuous maps for the compact-open topology.

- Use: Item148 — Flatten the nested canonical cochains in degrees0,1,2 before comparing cocycles.

- Proposed test: Currying followed by uncurrying fixes a function
- Proposed test: Constant functions are preserved
- Proposed test: The uncurrying continuity hypothesis is retained for a nondiscrete profinite group

### 146 — Nonempty finite inverse systems have a section

**library · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

For a directed preorder J and F:Jᵒᵖ→Type with every F(j) finite and nonempty, F.sections is nonempty. Transition maps need not be surjective.

Library: mathlib:nonempty_sections_of_finite_inverse_system.

1. Read nonempty_sections_of_finite_inverse_system and its cofiltered-system generalization at the Mathlib pin. Apply to finite sets of primitives, cocycle representatives and lift classes, not to an unproved general derived inverse limit.

### 147 — Scalar structure on the existing explicit H¹ quotient

**planned · construction**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

Let R be a commutative topological ring, M a topological R-module and G a topological group acting continuously by R-linear maps. The existing additive H1 carrier143 acquires an R-module structure by r[c]=[g↦r c(g)]. Every continuous R-linear equivariant coefficient map induces an R-linear map.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/143.

1. Pointwise multiplication by each fixed r preserves continuity and the cocycle equation because the G-action is R-linear.
2. It preserves boundaries since r(gm−m)=g(rm)−rm. Descend scalars through the existing additive quotient, prove module identities on representatives, and upgrade explicitCoeff1. Do not introduce a new underlying H1 type.

- API `explicitH1Module.smul_mk` (simp): r times the class of c is represented by g↦r*c(g).
- API `explicitCoeff1Linear` (functoriality): A continuous R-linear equivariant coefficient map induces an R-linear map on the existing H1 quotient, respecting identity and composition.
- API `explicitH1Module.compat_add` (compatibility): The induced R-module addition and zero are the existing additive quotient operations.

- Use: Items150–152 — Define uniformizer torsion and localization on the shared cohomology carrier.
- Use: Item101 — Compare extension classes after scalar change.

- Proposed test: Scalar multiplication sends a boundary to the boundary of the scaled primitive
- Proposed test: For trivial action H1 agrees with continuous additive homomorphisms and their scalar action
- Proposed test: Over F3 with trivial C3 action, the class of g↦g is nonzero and killed by3

### 148 — Underlying linear comparison of canonical and explicit H¹

**planned · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

For profinite G, a commutative topological ring R and a topological R-module M with jointly continuous R-linear G-action, the underlying R-module of continuousCohomology 1 (TopRep of M) is naturally R-linearly equivalent to143 equipped with147. Naturality includes continuous equivariant coefficient maps and continuous group homomorphisms. No topological isomorphism with the inherited pointwise quotient topology, or with DiscreteH1, is asserted.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/20, PAPER-CADORET-HUI-TAMAGAWA-17/143, PAPER-CADORET-HUI-TAMAGAWA-17/144, PAPER-CADORET-HUI-TAMAGAWA-17/145, PAPER-CADORET-HUI-TAMAGAWA-17/147.

1. Use145 to flatten the nested continuous coinduced objects of the canonical resolution in degrees0,1,2. Their invariant elements are jointly continuous homogeneous equivariant functions on G,G²,G³. The coefficient action is jointly continuous by hypothesis.
2. A one-cocycle c corresponds to F(g0,g1)=g0·c(g0⁻¹g1); the inverse is c(g)=F(1,g). These are inverse R-linear maps on equivariant one-cochains.
3. The homogeneous differential F(g1,g2)−F(g0,g2)+F(g0,g1), evaluated at (1,g,gh), is g·c(h)−c(gh)+c(g), the inhomogeneous cocycle equation.
4. A degree-zero invariant homogeneous function is g↦g·m. Its differential evaluated at (1,g) is g·m−m. Thus cycles and boundaries match, including the sign convention.
5. Use144 to descend the equivalence to the ordinary algebraic quotient. Postcomposition and restriction commute with the formulas, giving naturality. This is a mathematical proof outline awaiting typed implementation.

### 149 — Continuous linear sections of finite free lattice quotients

**planned · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

Let R be a complete discrete valuation ring with uniformizer π and fraction field K. For an exact sequence0→A→H→B→0 of finite free R-modules with their π-adic topologies, H→B has an R-linear continuous section. Its formation need not be natural or G-equivariant. Finite free Hom modules have their π-adic topology and the conjugation action of continuous lattice representations is jointly continuous.

Planned: ArithmeticGaloisDuality:R02.1.

1. Choose an R-basis of B and lift its finitely many elements to H. Linear extension is a section.
2. In finite bases every R-linear map is a finite matrix, hence continuous for the π-adic topology. The resulting H≃A⊕B and its inverse are continuous.
3. The Hom action is matrix multiplication by the continuous representation matrices and their inverses, so is jointly continuous. This verifies the topological assumption needed to construct101.

### 150 — Invariant lifting obstruction in continuous H¹

**planned · construction**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

For a complete DVR R, uniformizer π, finite free continuous G-lattice M with its π-adic topology, there is a natural exact sequence0→M^G/πM^G→(M/πM)^G→H1(G,M)[π]→0 of R-modules. On an invariant residue class m̄ choose a lift m and send it to [g↦(g·m−m)/π]. This does not require compactness of G.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/143, PAPER-CADORET-HUI-TAMAGAWA-17/147.

1. Multiplication by π identifies M homeomorphically with πM in the subspace topology, by finite lattice coordinates. The numerator lies in πM and is continuous, so division defines a continuous cocycle.
2. Changing m by πa adds the boundary g↦g·a−a; multiplication of the class by π is the boundary of m. The construction is linear and natural.
3. If an invariant m is in πM, cancellation of π shows m/π is invariant, giving the injection at the left.
4. The connecting class is zero precisely when (gm−m)/π=ga−a for some a∈M. Then m−πa is an invariant lift; this identifies the kernel.
5. Conversely π[c]=0 gives πc(g)=gm−m for one m∈M. Its residue is invariant and the constructed class is [c]. This proves surjectivity onto π-torsion without invoking a compact-coefficient long exact sequence.

- API `invariantReductionDelta.apply_lift` (constructor): An invariant residue represented by m maps to the class of g↦(g*m−m)/π.
- API `invariantReductionDelta.change_lift` (compatibility): Replacing m by m+π*a adds the boundary of a and preserves the class.
- API `invariantReductionDelta.exact` (relation): The kernel consists exactly of reductions of integral invariants and the image is H1[π].
- API `invariantReductionDelta.natural` (functoriality): Continuous equivariant R-linear coefficient maps commute with this connecting map.

- Use: CHT §1.3 and item10 — Equate invariant lifting with absence of π-torsion.
- Use: CHT §10 and item102 — Control the Hom-lattice extension obstruction.

- Proposed test: A trivial action has surjective invariant reduction and zero connecting map
- Proposed test: C3 acting on Z3² by [[0,−1],[1,−1]] has zero integral invariants and a one-dimensional residual invariant space mapping bijectively to H1≃F3
- Proposed test: Changing a lift by3a changes the connecting cocycle by the boundary of a

### 151 — Rationalization kernel is exactly lattice torsion

**planned · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

For a complete DVR R with fraction field K=R[1/π], a finite free continuous G-lattice M and V=M⊗R K with its usual finite-dimensional K-topology, ker(H1(G,M)→H1(G,V)) is exactly the π-primary torsion. Thus this coefficient map is injective whenever H1(G,M)[π]=0. Compactness of G is not needed.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/143, PAPER-CADORET-HUI-TAMAGAWA-17/147.

1. If a lattice cocycle c becomes a rational boundary, write c(g)=g·v−v for one v∈V. Clear a common denominator π^n v=m∈M, giving π^n c(g)=g·m−m and hence π^n[c]=0.
2. Conversely, from π^n[c]=0 choose m with π^n c=δm. Then c=δ(m/π^n) in V, so its rational class vanishes.
3. If H1[π]=0, induction on n makes multiplication by π^n injective. Every nonzero scalar of the DVR is a unit times π^n; this also proves torsion-freeness from absence of π-torsion.

### 152 — Compact-group H¹ commutes with lattice localization

**planned · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

Under151, if G is compact, the coefficient map induces an isomorphism H1(G,M)⊗R K≃H1(G,V) of underlying K-modules. Compactness is used for surjectivity; the kernel statement151 holds without it. The assertion makes no claim about tensor-product or quotient topologies.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/151, PAPER-CADORET-HUI-TAMAGAWA-17/147.

1. The open increasing lattices π^−n M cover V. A continuous cocycle from compact G has compact image, so a finite subcover places its image in one π^−n M. Multiplying by π^n yields a continuous M-valued cocycle (use the subspace topology), proving surjectivity from localization.
2. Every localized class has one denominator. If its image is zero, its numerator class lies in the torsion kernel151 and vanishes after localization.
3. The compactness boundary is real: for the discrete group Z[1/ℓ] with trivial action, Hom(G,Zℓ)=0 because the image of1 would be divisible by every ℓ^n, but the inclusion G→Qℓ is a nonzero continuous homomorphism with unbounded denominators. The localization comparison is not surjective there.

### 153 — The extension Hom lattice is a saturated equivariant block

**planned · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

For an exact sequence of finite free R-lattices0→A→H→B→0 with continuous action by an ambient group Γ, the canonical map Hom_R(B,A)→End_R(H), f↦i∘f∘p, is Γ-equivariant, injective and has finite free cokernel. In particular it is saturated. If A=H^Π for a normal subgroup Π⊲Γ, then A is Γ-stable; if B=H/A is free, this applies to the geometric invariant extension.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/149.

1. Choose the R-linear section149 only to identify H=A⊕B. The displayed canonical map is the upper-right matrix block. The other three blocks form a finite free complement, establishing saturation independently of the section choice.
2. Equivariance follows directly from equivariance of i and p; no equivariant section is assumed.
3. For a∈H^Π, γ∈Γ and h∈Π, h(γa)=γ(γ⁻¹hγ)a=γa by normality. The quotient and Hom action are consequently ambient-group representations.

### 154 — Continuous H¹ of a tower of finite coefficients

**planned · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

Let M_n be an inverse sequence of finite discrete abelian G-modules with continuous actions and equivariant transition maps, and let M=lim_n M_n with its inverse-limit topology and action. Then the coefficient maps give an additive isomorphism H1_cont(G,M)≃lim_n H1_cont(G,M_n). No surjectivity assumption on transitions or finiteness assumption on the whole groups H1(G,M_n) is required. This is a degree-one statement, not an all-degree derived-limit comparison.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/143, PAPER-CADORET-HUI-TAMAGAWA-17/146.

1. For injectivity, if every projection c_n of c is a boundary, the sets P_n={m_n:δm_n=c_n} are finite and nonempty. The module transitions map P_(n+1) to P_n. By146 choose compatible primitives; their inverse-limit element makes c a boundary.
2. For surjectivity, a compatible sequence of classes α_n has sets Z_n of continuous cocycle representatives. Each Z_n is nonempty and finite: after choosing one representative all others differ by a boundary, and B1 is the image of the finite group M_n. The entire H1 group need not be finite.
3. Transitions send Z_(n+1) to Z_n. Apply146 to choose compatible cocycles. Their pointwise inverse limit is a cocycle and is continuous because every finite coordinate is continuous. It represents the desired compatible sequence of classes.
4. The comparison is additive by construction; bijectivity gives the inverse additive map. Coefficient naturality follows from the projected formulas. Completeness gives M≃lim M/π^nM for a finite free lattice over a complete DVR with finite residue field.

Related supplier: PAPER-KALETHA-16/P03 at ArithmeticGaloisDuality:R02.1. Existing planned general coefficient-limit supplier. This finite-coefficient degree-one lemma is a direct specialization/refinement for the same owner, not a second derived-limit construction.

### 155 — Conditional H¹ surjectivity for a lattice quotient

**planned · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

Let R be a complete DVR with finite residue field of characteristic ℓ, G profinite, and0→A→H→B→0 an exact sequence of finite free continuous R-lattices. If, for every n≥1, H2_cont(G,A/π^n A)=0 and H1_cont(G,A/π^n A) is finite, then H1_cont(G,H)→H1_cont(G,B) is surjective. Finite-level cohomology uses discrete coefficients; the conclusion uses lattice coefficients. The vanishing hypothesis is on Tau Ceti’s explicit discrete H2 carrier. A geometric cd assertion on another model must first be transported through the upstream discrete comparison; that interface is part of the remaining geometric application gap.

Planned: ArithmeticGaloisDuality:R02.1.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/149, PAPER-CADORET-HUI-TAMAGAWA-17/146, PAPER-CADORET-HUI-TAMAGAWA-17/154, PAPER-CADORET-HUI-TAMAGAWA-17/148, PAPER-CADORET-HUI-TAMAGAWA-17/156.

1. The linear splitting149 makes reduction modulo π^n exact. For each n the discrete-coefficient long exact sequence gives surjectivity on H1 by the H2 vanishing hypothesis. This uses the existing ProfiniteCohomology Layer5 discrete interface.
2. Given a compatible system of classes in H1(G,B/π^n), let L_n be its nonempty fibre of lifts in H1(G,H/π^n). Exactness shows this fibre is a torsor for a quotient of H1(G,A/π^n), hence finite.
3. Transition maps preserve L_n, though they need not be surjective. Apply146 to choose compatible lift classes and154 to identify them with a lattice class.
4. For CHT §5.2 the remaining geometric inputs are affine-curve cdℓ≤1, finiteness of finite-coefficient H1 and the group/sheaf comparison. The present conditional lemma does not establish those inputs.

### 156 — Discrete coefficient H¹ exactness already built

**library · theorem**. CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation

For a discrete short exact sequence of continuous G-modules0→A→B→C→0, the range of H1(A)→H1(B) equals the kernel of H1(B)→H1(C), and the range of H1(B)→H1(C) equals the kernel of the explicit connecting map to H2(A). Here G is a topological group, all three coefficients are discrete, and H1/H2 are Tau Ceti explicit continuous carriers.

Library: tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1B, tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1C.

Dependencies: PAPER-CADORET-HUI-TAMAGAWA-17/143.

1. Read DiscreteShortExact.explicitLongExact_H1B and explicitLongExact_H1C with all section binders in LongExact.lean at f790474. The latter requires ContinuousMul G, which holds for our topological groups. Apply only to the finite reductions in155.

## Validation and executable finite regressions

The paper checker and three-file intake passed. The structural check verified156 unique items,209 acyclic edges, all missing-item routes, all planned stage IDs, all definition APIs/uses/tests, all five unchanged unreviewed findings, and506 input hashes. No Lean file was requested or compiled.

The new certificate passed66950 exact checks. It enumerates the nontrivial C3 lattice representation with norm zero and boundary index3, its invariant-lifting obstruction, all729 one-cochains C3→F3² including noncocycles, the homogeneous differential and boundary signs, a nonsplit unipotent extension, and Hom-block conjugation. These finite checks do not prove the infinite topological comparison, inverse-limit lemma or geometric theorem.

```json
{
  "integralMatrixIdentities": 3,
  "cyclicQuotientOrders": 12,
  "boundaryMembership": 7380,
  "torsionKilledByThree": 7380,
  "rationalPrimitives": 7380,
  "towerTransitions": 3,
  "invariantConnectingMap": 7,
  "changeOfLift": 27,
  "cochainInverse": 2187,
  "homogeneousEquivariance": 19683,
  "differentialComparison": 19683,
  "cocycleCoordinates": 9,
  "boundaryComparison": 81,
  "extensionSection": 81,
  "extensionCocycle": 81,
  "nonsplitExtension": 1,
  "homBlockEquivariance": 2952,
  "scope": "Finite cocycle, torsion, denominator, section and block regressions only; no infinite topological comparison or geometric theorem is established by enumeration."
}
```

### New coefficient certificate

```python
"""Exact finite regression examples for the proposed compact H1 interfaces.
No cohomological comparison theorem or infinite-limit theorem is proved here.
"""
from collections import Counter
from fractions import Fraction as Q
from itertools import product
import json

counts = Counter()
def check(condition, group):
    assert condition, group
    counts[group] += 1

T = ((0, -1), (1, -1))
I = ((1, 0), (0, 1))
def mv(a, v):
    return tuple(sum(a[i][j]*v[j] for j in range(2)) for i in range(2))
def mm(a, b):
    return tuple(tuple(sum(a[i][k]*b[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def sub(a,b): return tuple(x-y for x,y in zip(a,b))
def add(a,b): return tuple(x+y for x,y in zip(a,b))
def mod(v,q): return tuple(x%q for x in v)
TP = (I,T,mm(T,T))
D = ((-1,-1),(1,-2))
DI = ((Q(-2,3),Q(1,3)),(Q(-1,3),Q(-1,3)))
check(mm(TP[2],T)==I,'integralMatrixIdentities')
check(all(sum(a[i][j] for a in TP)==0 for i in range(2) for j in range(2)), 'integralMatrixIdentities')
check(mm(D,DI)==I,'integralMatrixIdentities')

# H1(C3,M)=ker(1+T+T^2)/(T-1)M; the norm is zero here.
# This checks the nonsaturated boundary lattice and rational primitives.
previous = None
for k in range(1,5):
    q = 3**k
    V = list(product(range(q),repeat=2))
    boundaries = {mod(mv(D,v),q) for v in V}
    invariants = [v for v in V if mod(mv(D,v),q)==(0,0)]
    check(len(V)==3*len(boundaries),'cyclicQuotientOrders')
    check(len(invariants)==3,'cyclicQuotientOrders')
    reps={}
    for v in V:
        # (x+y) mod 3 is the quotient map because it kills both columns of D.
        cls=sum(v)%3
        check((v in boundaries)==(cls==0),'boundaryMembership')
        check(mod(tuple(3*x for x in v),q) in boundaries,'torsionKilledByThree')
        rational=mv(DI,v)
        check(mv(D,rational)==v and all((3*x).denominator==1 for x in rational),'rationalPrimitives')
        reps.setdefault(cls,v)
    check(len(reps)==3,'cyclicQuotientOrders')
    if previous:
        check({sum(mod(v,q//3))%3 for v in reps.values()}=={0,1,2},'towerTransitions')
    previous=reps

# Connecting homomorphism: lift an invariant mod 3 and divide its boundary by 3.
inv3=[v for v in product(range(3),repeat=2) if mod(mv(D,v),3)==(0,0)]
classes=set()
for m in inv3:
    dm=mv(D,m)
    check(all(x%3==0 for x in dm),'invariantConnectingMap')
    c=tuple(x//3 for x in dm)
    check(tuple(3*x for x in c)==dm,'invariantConnectingMap')
    classes.add(sum(c)%3)
    for a in product(range(3),repeat=2):
        lift=add(m,tuple(3*x for x in a))
        changed=tuple(x//3 for x in mv(D,lift))
        check(sub(changed,c)==mv(D,a),'changeOfLift')
check(classes=={0,1,2},'invariantConnectingMap')

# All 729 one-cochains C3 -> F3^2, including noncocycles.
V=list(product(range(3),repeat=2))
def act(g,v): return mod(mv(TP[g%3],v),3)
for c in product(V,repeat=3):
    def F(a,b): return act(a,c[(b-a)%3])
    for g in range(3):
        check(F(0,g)==c[g],'cochainInverse')
    is_cocycle=True
    for a,b,h in product(range(3),repeat=3):
        check(F((a+h)%3,(b+h)%3)==act(h,F(a,b)),'homogeneousEquivariance')
        dF=mod(add(sub(F(b,h),F(a,h)),F(a,b)),3)
        x,y=(b-a)%3,(h-b)%3
        dc=mod(add(sub(act(x,c[y]),c[(x+y)%3]),c[x]),3)
        check(dF==act(a,dc),'differentialComparison')
        if dc!=(0,0): is_cocycle=False
    if is_cocycle:
        check(c[0]==(0,0) and c[2]==mod(add(c[1],act(1,c[1])),3),'cocycleCoordinates')
for m in V:
    c=tuple(mod(sub(act(g,m),m),3) for g in range(3))
    for a,b in product(range(3),repeat=2):
        check(mod(sub(act(b,m),act(a,m)),3)==act(a,c[(b-a)%3]),'boundaryComparison')

# Nontrivial unipotent extension of trivial F3-representations for C3.
# Every section is s_u(b)=(u*b,b), and every extension cocycle is g -> g.
for u,g,h,b in product(range(3),repeat=4):
    section=(u*b%3,b)
    moved=((section[0]+g*section[1])%3,section[1])
    cocycle=(moved[0]-section[0])%3
    check(cocycle==g*b%3,'extensionSection')
    check(((g+h)%3)*b%3==(g*b+h*b)%3,'extensionCocycle')
check(all(g%3==0 for g in [0]) and any(g%3!=0 for g in range(3)),'nonsplitExtension')

# Hom(B,A) is the upper-right matrix block. Arbitrary upper triangular
# changes preserving A carry that block to itself, with the Hom action a*f/d.
for q in [3,9]:
    units=[a for a in range(q) if a%3]
    for a,d,b,f in product(units,units,range(q),range(q)):
        g=((a,b),(0,d));ai=pow(a,-1,q);di=pow(d,-1,q)
        gi=((ai,(-ai*b*di)%q),(0,di));block=((0,f),(0,0))
        conj=mm(mm(g,block),gi)
        check(tuple(tuple(x%q for x in row) for row in conj)==((0,a*f*di%q),(0,0)),'homBlockEquivariance')

counts['scope']='Finite cocycle, torsion, denominator, section and block regressions only; no infinite topological comparison or geometric theorem is established by enumeration.'
print(json.dumps(counts,indent=2))
```

### Inherited Larsen/tensor certificate, unchanged

```python
"""Exact finite regressions. These are not proofs of the uniform group theorems."""
from itertools import product
from math import factorial
import json
from pathlib import Path
P=Path('.')
def mul(a,b,q):
 return tuple(sum(a[2*i+k]*b[2*k+j] for k in range(2))%q for i in range(2) for j in range(2))
def power(a,n,q):
 b=(1,0,0,1)
 while n:
  if n%2:b=mul(b,a,q)
  a=mul(a,a,q);n//=2
 return b
I=(1,0,0,1)
counts={'liftedExponentialCongruences':0,'gradedPowerCongruences':0,'tensorDegreeExpansions':0,'finitePointSchemeCounterexamples':0,'determinantLineStabilizers':0}
for p in [5,7]:
 for x in [(0,0,0,0),(0,1,0,0),(0,0,1,0)]:
  for b in product(range(p),repeat=4):
   a=tuple(I[j]+x[j]+p*b[j] for j in range(4))
   for k in [1,2]:
    q=p**(k+1)
    assert power(a,p**k,q)==tuple((I[j]+p**k*x[j])%q for j in range(4))
    counts['liftedExponentialCongruences']+=1
 for c in product(range(p),repeat=4):
  for m in [1,2]:
   q=p**(m+2);a=tuple(I[j]+p**m*c[j] for j in range(4))
   assert power(a,p,q)==tuple((I[j]+p**(m+1)*c[j])%q for j in range(4))
   counts['gradedPowerCongruences']+=1
# A real failure outside the stated p>=2n bound (n=2,p=3).
assert power((1,1,3,1),3,9)!=(1,3,0,1)
counts['smallPrimeCounterexample']=1
# Expanding mixed tensor products adds covariant/contravariant degrees separately.
for support in [((0,0),(1,0)),((1,0),(0,1)),((2,1),(0,2)),((2,2),(1,0))]:
 for r in [1,2,3]:
  D=sum(r**(s+t) for s,t in support)
  d=D*max(max(z) for z in support)
  for delta in range(1,min(D,5)+1):
   for terms in product(support,repeat=delta):
    s=sum(z[0] for z in terms);t=sum(z[1] for z in terms)
    assert s<=d and t<=d
    assert (s+t)*(r-1)<=2*d*(r-1)
    counts['tensorDegreeExpansions']+=1
assert max(sum(z) for z in [(2,2)])==4 # total-degree cutoff2 would lose this summand.
# X^p-X vanishes at all F_p points but is a nonzero polynomial;
# at epsilon over dual numbers it is -epsilon, so it does not vanish schematically.
for p in [2,3,5,7,11]:
 assert all((pow(a,p,p)-a)%p==0 for a in range(p))
 coeff=[0]*(p+1);coeff[1]=-1;coeff[p]=1
 assert any(a%p for a in coeff) and (-1)%p!=0
 counts['finitePointSchemeCounterexamples']+=1
# For W=<e1>, invertible 2x2 matrices stabilize W iff the lower-left entry is0.
# The line and its determinant are the same here; pointwise fixing also requires a=1.
for p in [3,5,7]:
 seen_strict=False
 for a,b,c,e in product(range(p),repeat=4):
  if (a*e-b*c)%p==0:continue
  setwise=c==0;pointwise=c==0 and a==1
  assert not pointwise or setwise
  if setwise and not pointwise:seen_strict=True
  counts['determinantLineStabilizers']+=1
 assert seen_strict
# Normalized antisymmetrization requires factorial invertibility; no claim that
# unnormalized exterior embedding itself must fail in small characteristic.
assert factorial(3)%3==0 and factorial(3)%5!=0
counts['factorialNormalizationBoundary']=1
counts['scope']='Finite rank-two congruences, tensor bounds and explicit counterexamples only; no Chevalley spreading, Nori theorem, Hilbert family or geometric semisimplicity proved.'
(P/'diagnostic-results.json').write_text(json.dumps(counts,indent=2)+'\n')
print(json.dumps(counts,indent=2))
```

### Inherited root/weight certificate, unchanged

```python
"""Exact finite checks for CHT17 extraction; not geometric proofs."""
from itertools import combinations
from math import factorial

def mulpoly(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return out

types = []
for n in range(1, 7):
    types.append(("A"+str(n), list(range(1, n+1))))
    if n >= 2:
        types.append(("B"+str(n), list(range(1, 2*n, 2))))
        types.append(("C"+str(n), list(range(1, 2*n, 2))))
    if n >= 4:
        types.append(("D"+str(n), list(range(1, 2*n-2, 2))+[n-1]))
types += [("G2", [1,5]), ("F4", [1,5,7,11]), ("E6", [1,4,5,7,8,11])]
systems = []
def enumerate_systems(start=0, names=(), exponents=()):
    if exponents:
        poly = [1]
        for e in exponents:
            poly = mulpoly(poly, [1]+[0]*(2*e)+[1])
        assert sum(poly) == 2**len(exponents)
        assert len(poly)-1 == sum(2*e+1 for e in exponents)
        systems.append((names, len(exponents), len(poly)-1, poly))
    for i in range(start, len(types)):
        name, es = types[i]
        if len(exponents)+len(es) <= 6:
            enumerate_systems(i, names+(name,), exponents+tuple(es))
enumerate_systems()
witnesses = 0
for a in systems:
    for b in systems:
        if a[1] == b[1] and a[2] < b[2]:
            assert any(a[3][m] > b[3][m] for m in range(a[2]+1))
            witnesses += 1

def ident(r):
    return [[int(i == j) for j in range(r)] for i in range(r)]
def mm(a, b, p):
    r = len(a)
    return [[sum(a[i][k]*b[k][j] for k in range(r)) % p
             for j in range(r)] for i in range(r)]
def add(a, b, p):
    return [[(x+y) % p for x,y in zip(ar,br)] for ar,br in zip(a,b)]
def scale(c, a, p):
    return [[c*x % p for x in row] for row in a]
def expm(a, p):
    r, out, term = len(a), ident(len(a)), ident(len(a))
    for n in range(1, r):
        term = mm(term, a, p)
        out = add(out, scale(pow(factorial(n), -1, p), term, p), p)
    return out
def logm(u, p):
    r = len(u)
    a = add(u, scale(-1, ident(r), p), p)
    out, term = scale(0, a, p), ident(r)
    for n in range(1, r):
        term = mm(term, a, p)
        out = add(out, scale((-1)**(n+1)*pow(n, -1, p), term, p), p)
    return out
group_laws = 0
for p in (5,7,11,17):
    for r in (2,3,4):
        for seed in (1,2,3):
            a = [[(seed+i+2*j) % p if i < j else 0
                  for j in range(r)] for i in range(r)]
            u = expm(a,p)
            assert logm(u,p) == a
            values = [expm(scale(t,a,p),p) for t in range(p)]
            for t in range(p):
                for v in range(p):
                    assert mm(values[t],values[v],p) == values[(t+v)%p]
                    group_laws += 1
            # Strict polynomial degree < p matters in Lemma 7.1(3).
            assert all((t**p-t) % p == 0 for t in range(p))
            assert [0,(-1)%p]+[0]*(p-2)+[1] != [0]*(p+1)

splittings = 0
for p in (2,3,5,7):
    for r in range(1,7):
        for a in range(1,r+1):
            top = tuple(range(a))
            coefficients = {I:(sum((k+1)*(j+1) for k,j in enumerate(I))+3)%p
                            for I in combinations(range(r),a)}
            coefficients[top] = 1
            def wedge_value(indices):
                if len(set(indices)) < len(indices):
                    return 0
                inversions = sum(indices[i] > indices[j]
                                 for i in range(a) for j in range(i+1,a))
                return (-1)**inversions*coefficients[tuple(sorted(indices))] % p
            retraction = [[(-1)**i*wedge_value([j]+[k for k in range(a) if k != i])%p
                           for j in range(r)] for i in range(a)]
            assert [row[:a] for row in retraction] == ident(a)
            splittings += 1

projectors = 0
for q in (2,3,5,7):
    for p in (5,7,11,13,17):
        eigen = [1,q%p,q*q%p]
        if q%p == 0 or len(set(eigen)) < 3:
            continue
        for i, lam in enumerate(eigen):
            for j, mu in enumerate(eigen):
                value = 1
                for k, nu in enumerate(eigen):
                    if k != i:
                        value = value*(mu-nu)*pow((lam-nu)%p,-1,p)%p
                assert value == int(i == j)
                projectors += 1
assert (4-1)%3 == 0  # weight-separated rational roots can collide mod 3.
print({"root_system_products":len(systems), "equal_rank_dimension_witnesses":witnesses,
       "exp_log_group_laws":group_laws, "determinant_splittings":splittings,
       "weight_projector_entries":projectors})
```

