# PAPER-KEDLAYA-LIU-15 — extraction and routing (checkpoint 2: chapters 1–7)

Agent: Claude Code. Sessions: cc-58621d (checkpoint 1, chapters 1–3) and cc-fb70e5 (checkpoint 2,
chapters 4–7). Issue: #4546. Status: **partial**. The two checkpoints cover the introduction and
chapters 1–7; chapters 8–9 follow. The handoff note is
`research/blueprint/handoff/PAPER-KEDLAYA-LIU-15.md`.

## Source

The text read is arXiv 1301.0792v5 (9 May 2015; the PDF is dated 2 May 2015), which its comment
line describes as the version to appear in Astérisque. Its PDF SHA-256 is `a6a11742…e7377d`, and its
LaTeX source was used to number and locate every statement. Page and statement numbers in the
result refer to v5.

- **The published version.** Astérisque 371 (2015) was not obtained: the SMF text is paywalled and
  the eScholarship copy refused the download (HTTP 403). The findings are therefore scoped to v5.
- **The authors' errata.** Kedlaya's papers page says the errata for this paper are recorded in part
  II. They are Appendix A of Kedlaya–Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*
  (arXiv 1602.06899v3, 2019). Every finding below was compared with that list.

## What the paper does

Kedlaya and Liu develop relative p-adic Hodge theory from Witt vectors and nonarchimedean geometry:

- the Gel'fand spectra of Banach rings, compared with Huber adic spectra;
- a perfectoid correspondence between perfect uniform Banach F_p-algebras (with a primitive ideal of
  W) and perfectoid algebras, compatible with rational localizations and finite étale covers;
- slope theory for ϕ-modules over relative Robba rings;
- vector bundles on relative Fargues–Fontaine curves;
- descriptions of étale Z_p- and Q_p-local systems, and of their pro-étale cohomology, on perfectoid
  and analytic spaces through ϕ-modules.

Checkpoint 1 extracted the three foundational chapters:

- **Chapter 1 (commutative algebra and descent).** It covers:
  - finite projective and faithfully flat modules;
  - finite étale algebras and henselian pairs (Gabber's equivalence);
  - descent and glueing formalism, including Beauville–Laszlo;
  - étale Z_p- and Q_p-local systems on schemes and their descent along finite étale covers;
  - Bhatt–Scholze's pro-étale description of local systems;
  - basic ϕ-module algebra.
- **Chapter 2 (spectra of nonarchimedean Banach rings).** It covers:
  - seminorms, Banach rings and modules, and the open mapping theorem;
  - the Gel'fand spectrum and Berkovich's theorems;
  - adic spectra, rational localizations and Tate acyclicity for sheafy rings;
  - adic affinoids over an analytic field (Tate, Kiehl, Gerritzen–Grauert);
  - affinoid systems approximating any adic Banach algebra, and finite étale descent along rational
    coverings;
  - glueing squares and Kiehl glueing of vector bundles on any sheafy ring;
  - uniform and stably uniform Banach rings (Buzzard–Verberkmoes), uniformization, and finite étale
    algebras over it.
- **Chapter 3 (the perfectoid correspondence).** It covers:
  - perfect uniform Banach F_p-algebras: stable uniformity, sheafiness, and invariance of FÉt under
    perfection;
  - strict p-rings and Witt vectors, and Katz's correspondence between lisse Z/p^n-sheaves on a
    perfect ring R and ϕ-modules over W_n(R);
  - the Gauss norms λ(α) on W(R), primitive elements of degree 1, and the quotient norm modulo such
    an element;
  - inverse perfection and Fontaine's θ;
  - perfectoid fields and algebras, the tilting equivalence and its compatibility with strict
    maps, tensor products, rational localizations (with the homeomorphism of adic spectra) and
    finite étale algebras;
  - descent of the perfectoid property, and preperfectoid algebras.

Checkpoint 2 extracts chapters 4–7:

- **Chapter 4 (slope theory over an analytic field).** A review, mostly with proofs by reference to
  Kedlaya's earlier papers:
  - the Robba ring ℛ_K and its bounded and integral subrings over a discretely valued field;
  - Kedlaya's slope filtration theorem;
  - the extended Robba rings ℛ̃_L of a perfect analytic field L: they are Bézout, with Newton
    polygons of elements and Frobenius invariants;
  - the slope filtration and Dieudonné–Manin classification over ℛ̃_L;
  - the embedding ℛ_K → ℛ̃_L.

  Remarks 4.2.19 and 4.3.6 correct two of Kedlaya's earlier papers, not this one.
- **Chapter 5 (relative Robba rings).** For a perfect uniform Banach F_p-algebra R:
  - the rings ℛ̃^{int,r}_R, ℛ̃^{bd,r}_R, ℛ̃^{[s,r]}_R, ℛ̃^r_R, ℛ̃_R and ℛ̃⁺_R, cut out of W(R) by
    the norms λ(α^r);
  - their topologies, units, intersections and splittings;
  - their sheaf property and Kiehl glueing over Spa(R, R⁺) and over covers of the interval;
  - Rodriguez's theorem that they are relatively perfectoid;
  - the maps between their Gel'fand spectra and that of R, and the radius fibration;
  - finite étale algebras over them, and almost purity proved through Witt vectors.
- **Chapter 6 (ϕ-modules and vector bundles).**
  - ϕ^a-modules over these rings, and ϕ^a-bundles glued over annuli;
  - ampleness of 𝒪(1): large twists are globally generated with surjective ϕ^a − 1;
  - the graded ring P of Frobenius eigenvectors, and the equivalence between ϕ^a-modules and
    vector bundles on Proj(P), the relative Fargues–Fontaine curve;
  - the Prüfer property over a field;
  - ϕ-cohomology computed on an annulus.
- **Chapter 7 (slopes in families).**
  - rank, degree and slope as functions on ℳ(R);
  - pure models, the openness of the pure and étale loci, and the equivalence of pointwise purity
    with purity;
  - semicontinuity and boundedness of the slope polygon;
  - splitting off a constant vertex, and the slope filtration where the polygon is constant;
  - pointwise detection of H^1 for negative slopes.

## What the libraries and the atlas already have

The 172 items of checkpoint 1 are 18 library, 80 planned and 74 missing. The 56 items of checkpoint
2 (items 173–228) are 28 planned and 28 missing, so the result has 228 items: 18 library, 108
planned and 102 missing.

- **Mathlib** has much of the commutative algebra: finite projective and faithfully flat modules,
  étale algebras and FÉt(R), henselian pairs in the root-lifting form, and effective faithfully flat
  descent for modules. It has nonarchimedean seminorms, the spectral (smoothing) seminorm and the
  uniqueness of the power-multiplicative extension to a finite extension (Lemma 2.2.5). For chapter
  3 it has perfect rings and perfect closures, Witt vectors of perfect rings with their Teichmüller
  expansions and Frobenius, inverse perfection (`Perfection`, `PreTilt`) and Fontaine's θ. It has no
  perfectoid rings or fields, no norms on Witt vectors and no Katz correspondence.
- **Tau Ceti's analytic side is topological**: Huber and Tate rings, Spa and rational subsets. It has
  no Banach rings, Gel'fand spectra or perfectoid theory.
- The individual citations are in the items. Two audits checked every cited name against the pinned
  declaration index and its source line.

- **The Tau Ceti AdicSpaces roadmap** plans the Huber side in its layers 0–4:
  - Huber rings, Tate algebras and Henkel's open mapping theorem;
  - valuation spectra and rational subsets;
  - rational localization and the structure presheaf;
  - sheafiness for strongly noetherian rings, the Laurent-covering reductions, and stable uniformity
    with Buzzard–Verberkmoes.

  Its Part II (AdicSpacesPartII) plans completed tensor products (R0) and coherent sheaves on
  noetherian adic spaces (R3).
- **PerfectoidSpaces** names Kedlaya–Liu among its primary sources and plans most of chapter 3:
  - P1: perfectoid rings and fields, tilts, θ and its kernel, primitive degree-one ideals and the
    correspondence;
  - P2: the tilting homeomorphism of adic spectra, perfectoid rational localizations and
    sheafiness, and fibre products;
  - P3: finite étale algebras over perfectoid rings and the étale tilting equivalence.
- **Other layers:**
  - TropicalAndBerkovichArithmetic TB.0 plans the Berkovich spectrum.
  - PerfectoidSpaces P5 plans Gabber's henselian-pair equivalence (through Gabber–Ramero 5.4.53).
  - RelativeFarguesFontaine RF4 plans Beauville–Laszlo patching for nonnoetherian rings; RF0 plans
    the universal property of W(R) for a perfect ring R.
  - PrismaticCohomology PR.0 plans the direct perfection of a Frobenius lift.
  - VectorBundlesAndIsocrystals VB0 and PhiGammaModulesAndIwasawaCohomology PG.0 plan semilinear
    ϕ-actions.

For chapters 4–7:

- **Libraries.** Neither library has Robba rings, ϕ-modules over them or slope theory, so none of
  these items is `library`.
- **PadicDifferentialEquationsAndRigidCohomology RD.0–RD.2** plans all fifteen items of chapter 4:
  - RD.0 plans the rings: Robba rings, extended Robba rings, Bézout and Newton polygons;
  - RD.1 and RD.2 plan the slope theory: HN polygons, the slope filtration theorem,
    Dieudonné–Manin, special and generic polygons, and descent to the bounded ring.

  The RD packet already records the corrections of Remark 4.2.19 among its findings on *Slope
  filtrations revisited*.
- **RelativeFarguesFontaine RF0:integral-Y** plans the lifting of rational localizations of the base
  (Fargues–Scholze II.1.3).
- **PerfectoidSpaces** plans almost mathematics (P0) and almost purity (P3).
- **VectorBundlesAndIsocrystals VB1 and VB2:ampleness, with RelativeFarguesFontaine RF1 and RF3,**
  plan most of chapter 6:
  - ϕ-bundles as vector bundles on X_S;
  - ampleness;
  - the graded ring and the comparison with the Proj curve;
  - ϕ-cohomology on annuli.

  They do this for a perfectoid S; the paper does it for any perfect uniform R.
- **VB4** plans semicontinuity of the HN polygon (Theorem 7.4.5) and the filtration on
  constant-polygon loci (Corollary 7.4.10), from Fargues–Scholze II.2.19. **VB1** and VB4 give
  rank, degree and slope. **RD.2** gives the special-above-generic comparison (Proposition 7.4.3),
  which the paper cites from *Slope filtrations revisited*.

## Why these routes

Every missing item extends a layer that exists, so all nineteen routes are `source` routes. Because
the Tau Ceti AdicSpaces roadmap cannot be re-planned, adic-space additions go to its campaign Part
II and to AdicEtaleGeometry.

Chapters 1–2:

1. **InverseGaloisAndArithmeticFundamentalGroups IG.0** receives the étale local systems on schemes
   of §1.4. IG.0 builds the fundamental group of the finite étale site; Z_p-, isogeny Z_p- and
   Q_p-local systems, their representation-theoretic description, the examples that separate them,
   and descent of isogeny local systems along finite étale covers (Lemma 1.4.8) are the next step on
   the same objects. No layer plans local systems on schemes. The route also takes Lemma 1.2.3
   (maps out of a finite étale algebra as idempotents of the tensor product), the representability
   behind FÉt(R) being a Galois category.
2. **EnhancedDerivedSheaves E2** receives the pro-étale site of a scheme and Bhatt–Scholze's
   Theorem 1.4.11. E2 already imports the replete-topos part of the same paper.
3. **PhiGammaModulesAndIwasawaCohomology PG.0** receives the general ϕ-module conventions and Lemma
   1.5.2 (every finitely generated ϕ-module is a quotient of a free one), which the later chapters
   use throughout.
4. **TropicalAndBerkovichArithmetic TB.0** receives the comparison between Gel'fand and adic spectra
   for any Banach ring with a uniform unit:
   - the retraction Spa → M exhibiting M(A) as the maximal Hausdorff quotient;
   - rational subspaces of M(A) and encircling neighbourhoods, and Hausdorff localizations;
   - the surjectivity statements;
   - the uniform-unit hierarchy.

   TB.0 plans this comparison only for strictly affinoid algebras.
5. **AdicSpacesPartII R0/R3** receives the non-noetherian adic geometry:
   - norms on finite projective modules and completed tensor products over analytic fields;
   - the dictionary between adic and rigid affinoids (Gerritzen–Grauert, coverings detected on
     classical points, Corollary 2.5.13 corrected);
   - affinoid systems and idempotents of clopen sets;
   - glueing squares and Kiehl glueing of vector bundles on arbitrary sheafy rings (Theorem 2.7.7);
   - projectivity over uniform rings;
   - the functional-analysis basics of §§2.1–2.2 that neither library has: strict and optimal
     homomorphisms, the unit-ball subring o_A, and canonical norms on finite modules.

   R3 plans only coherent sheaves on noetherian spaces; the relative Fargues–Fontaine curve needs the
   non-noetherian vector-bundle theory.
6. **AdicEtaleGeometry A1** receives finite étale algebras over arbitrary adic Banach algebras:
   - henselian pairs from direct limits of Banach rings, and FÉt over completions;
   - FÉt over completed direct limits of affinoid systems and over the uniformization;
   - effective descent of finite étale algebras and étale Z_p-local systems along rational coverings
     (Theorem 2.6.9 and Corollary 2.6.10).

Additions for chapters 1–2 that the library audit made necessary:

7. **FoundationsAndLibraryIntegration LI.1** receives five commutative-algebra facts missing from
   Mathlib. LI.1 owns general commutative algebra and lists Fitting ideals among its areas.
   - For finitely generated modules, finite projective is equivalent to pointwise free of locally
     constant rank and to Zariski-locally free.
   - Fitting ideals characterize finite projective modules of constant rank.
   - The trace-pairing criterion for finite étale algebras.
   - Distinct idempotents are not congruent modulo the Jacobson radical.
   - Finite projectivity descends along faithfully flat maps. Mathlib's own descent file records
     this as missing.
8. **FoundationsAndLibraryIntegration LI.2** receives the inverse-limit facts of Remark
   2.3.15(c)–(e) for compact Hausdorff spaces. Mathlib has the clopen statement only for profinite
   limits.
9. **PerfectoidSpaces P5** receives the equivalence of the factorization-lifting and root-lifting
   definitions of henselian pairs, which P5's use of Gabber–Ramero needs. Mathlib proves it only for
   local rings.

Chapter 3:

10. **PerfectoidSpaces P1** receives the functoriality of the correspondence that its equivalence of
   categories needs in the Banach setting: strict maps, completed tensor products and quotients of
   perfect uniform algebras (Remark 3.1.6); density and strictness under tilting (Lemma 3.4.7,
   Proposition 3.6.9, Theorem 3.6.17); completion along an ideal containing p (Proposition 3.6.19).
   The route also names P1's planned correspondence theorems, for which the paper is a primary
   source.
11. **PerfectoidSpaces P2** receives Proposition 3.1.16: a sheafy F_p-algebra covered by perfect
   uniform ones is perfect. This is the positive half of the question whether being perfectoid is
   local; the general covering conjecture fails.
12. **PerfectoidSpaces P3** receives the finite étale inputs:
   - the characteristic-p side (finite étale algebras over a perfect ring are perfect, and FÉt is
     unchanged by perfection);
   - the descent direction (Proposition 3.5.9 with Lemma 3.5.8, and Proposition 3.6.22);
   - Ω_{o_L/o_K} = 0 over a perfectoid field.

   Checkpoint 2 adds the period-ring side from §5.5: finite étale algebras over R, W(R), ℛ̃^int_R
   and the ϕ^{−1}-equivariant ones over ℛ̃^{int,r}_R correspond, compatibly with the untilt. The
   route also names P3's almost purity theorem, which the paper proves from this comparison
   (Theorem 5.5.9).
13. **PhiGammaModulesAndIwasawaCohomology PG.1** receives Katz's correspondence over a perfect ring,
    with its lemmas and the Lang-torsor variant. PG.1 proves Fontaine's étale equivalence over a
    field; §3.2 is the same equivalence over any perfect F_p-algebra, which the later chapters use
    for local systems on perfectoid spaces.
14. **RelativeFarguesFontaine RF0** receives the Gauss norms λ(α) on W(R) and the maps λ, μ between
    Gel'fand spectra. RF0 builds W(R) with its topology and the relative period annuli, which these
    norms cut out. The route also names the universal property of W(R), which RF0 plans.
15. **AdicEtaleGeometry A4** receives Lemma 3.6.26, an explicit perfectoid Kummer cover of any
    uniform Banach Q_p-algebra with surjective map of spectra. A4 constructs a perfectoid
    pro-finite-étale cover for diamondification.
16. **AdicSpacesPartII R5** receives the preperfectoid algebras of §3.7: their stable uniformity,
    sheafiness, finite étale extensions and tensor products. R5 builds sousperfectoid spaces, the
    later class with the same purpose.

Chapters 5–7 (checkpoint 2):

17. **RelativeFarguesFontaine RF0:annuli and RF1** receive the relative extended Robba rings of
    chapter 5: seventeen items, and one planned item named as a source.
    - RF0:annuli builds the annulus rings of a perfectoid S as rational localizations of
      Spa W(R⁺). RF1 glues Y_S and forms X_S.
    - The paper builds the same rings for any perfect uniform R from the norms of route 14. It
      proves what the curve needs from them: topologies and units, intersections and splittings,
      the sheaf and Kiehl-glueing properties, relative perfectoidness (Rodriguez), the maps of
      Gel'fand spectra and the radius fibration, finite étale functoriality, and reduction modulo
      a primitive element.
    - Lemma 6.1.4 (generation of the global sections of a ϕ-bundle) belongs with the glueing.
    - The layers state none of this for a general perfect uniform R.
18. **VectorBundlesAndIsocrystals VB2:ampleness** receives two facts about the Proj description
    that the layer does not state:
    - for an analytic field the rings P[f^{−1}]_0 are Prüfer, so coherent sheaves correspond to
      finitely presented ϕ-modules (Theorem 6.3.14);
    - the norms on twisted invariants, which define continuous group actions (Lemma 6.3.17,
      Definition 6.3.18), used in §9.
19. **VectorBundlesAndIsocrystals VB4** receives the eight missing items of chapter 7.
    - VB4 proves semicontinuity and the constant-polygon filtration for perfectoid S through
      Banach–Colmez spaces.
    - The paper proves them for any perfect uniform R by spreading a good basis from a point of
      ℳ(R). That needs the approximation lemmas, pure models and the openness of the pure locus,
      the boundedness of the polygon, the splitting at a constant vertex of a varying polygon, and
      the pointwise detection of H^1.
    - The route also names the two planned items (Theorem 7.4.5, Corollary 7.4.10).

**Prerequisites.** Three works the paper builds on are not cited by the atlas:

- Kedlaya, *Nonarchimedean geometry of Witt vectors* (arXiv:1004.0466);
- Kedlaya, *Slope filtrations for relative Frobenius* (Astérisque 319, arXiv:math/0609272), cited
  fourteen times in chapters 4–7;
- R. Rodriguez's thesis *Preperfectoid algebras* (UC San Diego, 2014), the source of Theorem 5.3.9.
  Its eScholarship PDF refused the download (HTTP 403), so it was not read.

The other works these chapters rely on are already cited in the atlas: Bhatt–Scholze, Henkel,
Buzzard–Verberkmoes, Mihara, Berkovich, Bosch–Güntzer–Remmert, Gabber–Ramero, Katz (p-adic
properties of modular schemes), Scholze, Scholze–Weinstein, Kedlaya (*Slope filtrations revisited*
and the local monodromy paper), Fargues–Fontaine, Hartl–Pink and Kiehl.

## Mistakes

Thirty-eight are recorded for chapters 1–3. Twenty are new; the other eighteen are in the authors'
errata (part II, Appendix A), and the items use their corrections.

**Chapters 1–2.** Four known: Lemma 1.5.2 ("top left block"); Definition 2.4.11 (the point given by
K^+ is the unique closed point of Spa(K, K^+), not the generic point); Remark 2.5.3 (a citation);
Definition 2.8.1 (condition (d), A° bounded, does not imply the other three, so the stated
equivalence is false). Fifteen new:

- **Corollary 2.5.13 is false as stated.** It says that for reduced A, rational subspaces of
  Spa(A, A^+) are determined by their classical points. The paper's own Remark 2.4.9 gives two
  distinct rational subspaces of Spa(K{T}, o_K + m_K o_K{T}) with the same classical points. The
  hypothesis must be A^+ = A°: the proof's reduction to A^+ = A° through Corollary 2.5.6 is not
  available, and the only later use (Remark 8.1.9) assumes A^+ = A°.
- **Remark 2.3.15(e).** The argument says the images of the two halves of a disconnection are
  disjoint at every stage of the inverse system. They are not at small stages, where two distinct
  points can map to one. A compactness argument chooses a large stage, and the conclusion stands.
- **Proof of Proposition 2.4.24.** It states V_0 ⊆ V where V ⊆ V_0 is needed and true.
- **Proof of Proposition 2.4.20, step (iv).** It cites Lemma 2.4.19(b) and step (i) where (a) and
  (iii) are meant.
- **Proof of Corollary 2.8.9.** It cites the corollary itself instead of Mihara's Lemma 2.8.8; the
  source uses the corollary's label.
- **Proof of Lemma 2.7.2.** It bounds the quadratic error by d|U − 1|²; the correct bound is
  d²|U − 1|², and the constant c = d^{−2} still stands.
- **Proof of Lemma 2.6.2.** It needs the plus rings to be integrally closed.
- **Notational slips:**
  - Lemmas 1.3.9, 1.4.8, 2.8.6 and 2.8.14, and Proposition 2.8.16: wrong or missing indices, "c" for
    |b|, "S" for B, "∈" for "=";
  - Remark 1.5.6: R for S;
  - Definition 2.4.3: Spv for Spa;
  - Lemma 2.8.15: A for A_i.

**Chapter 3.** Fourteen known, each checked against the v5 text:

- the representing ring in the proof of Lemma 3.2.6 (invariant n-tuples, not invariant bases);
- the inverse functor in the proof of Proposition 3.2.7;
- faithfulness before Artin's lemma in Lemma 3.5.4;
- from §3.6 on, a primitive element must have a unit reduction;
- the ring of integral elements in Definition 3.6.4;
- the statement of Proposition 3.6.9(a) and a bound in the proof of (d);
- the incomplete proofs of Propositions 3.6.11 and 3.6.19 (corrected in part II, Theorems 3.3.13
  and 3.3.18(v));
- three slips in the proofs of Theorems 3.6.14, 3.6.15 and 3.6.17;
- the citations in Proposition 3.6.22 and Remark 3.6.27.

Five are new:

- **Remark 3.1.17** cites the covering conjecture as [112, Conjecture 2.16], *Perfectoid spaces*.
  That paper's only numbered conjecture is 1.13; the conjecture is 2.16 of Scholze's survey. The
  authors correct the same citation in Remark 3.6.27 but not here.
- **Proof of Proposition 3.5.9.** The Witt vectors are those of the tilt L, not of E (three
  places). The cocycle to be trivialized takes values in the kernel of W(o_L)^× → W(κ_L)^×, not in
  1 + m_L, so Lemma 3.5.8 does not apply as cited. A filtration by powers of p reduces it to Lemma
  3.5.8 and to H^1(G, m_L) = 0, which the lemma's proof also gives. The conclusion stands.
- **Definition 3.7.1** calls C relatively perfectoid; it means A.
- **Proof of Theorem 3.7.4.** It proves stable uniformity only. The first assertion, that rational
  localizations of a preperfectoid algebra are preperfectoid, needs one more step: base change to K
  commutes with rational localization, and Theorem 3.6.14(c) applies.

**Chapters 4–7.** Fifteen are recorded (E39–E53). Four are in the authors' errata: the proof of
Corollary 5.2.12 (an index), the proof of Lemma 5.5.5 (ȳ_0 for x̄_0), the matrix 1 + X in the proof
of Proposition 6.2.4, and H^1(M(−n)) for H^1(M(n)) in Remark 7.4.12. Eleven are new:

- **Lemma 4.2.10 is false for general a and L.** It says that the ϕ^a-invariants of ℰ̃_L and ℛ̃_L
  are the unramified extension of Q_p with residue field F_{p^a}. They are W(L^{ϕ^a})[p^{−1}]. For
  L the completed perfection of F_p((t)) and a = 2 this is Q_p, since the solutions of x^{p²} = x
  in L are 0 and roots of unity of order prime to p, which inject into the residue field F_p. The
  uses of the lemma take a = 1 or L algebraically closed, so no other result is affected.
- **Proof of Proposition 6.2.4.** The exponent s, which already names the endpoint rq^{−1/2} of the
  interval, is used where the exponent u of the chosen element [π̄^u] is meant. So w_j = [π̄^u]v_j
  + Σ X_{ij}v_i with error bound ε α(π̄)^{ut}. This compounds the known erratum in the same proof.
- **Proofs of Lemmas 5.2.8 and 5.2.10.** Reversed signs: z = y − x and y = z − x where x − y and
  x − z are meant.
- **Proofs of Propositions 5.5.3 and 5.5.4.** A module over FÉt(ℛ̃^{int,r}_R) where a module over
  ℛ̃^{int,r}_R is meant; a case list repeats ℛ̃^bd in place of ℛ̃^{bd,r}.
- **Proof of Lemma 5.5.5.** ℛ̃^I_{R^+}/(z) for ℛ̃^I_R/(z), and x ∈ W(R^+)[p^{−1}] for x ∈ W(R^+).
- **Remark 5.1.6.** The lift should lie in ℛ̃^{int,r}_R, not ℛ̃^{int,r}_S.
- **Chapter 7:**
  - Lemma 7.1.1 lets ϕ act where ϕ^a is meant;
  - the proof of Lemma 7.1.2 defines F_{l+1} = U_{l+1}^{−1}Fϕ^a(U_l) where ϕ^a(U_{l+1}) is meant (the
    second expression on the same line is right);
  - the proof of Corollary 7.4.11 writes H^1_ϕ(M) for H^1_{ϕ^a}(M).

## Checks

- `python3 scripts/check_paper.py` and `python3 research/blueprint/intake.py check-files` pass on
  the result.
- A local check confirms that every missing item is taken by exactly one route.
- Statement numbers were recomputed from the LaTeX source (the theorem counter is shared within each
  subsection) and matched against the paper's own cross-references.
- The self-citation in Corollary 2.8.9, the labels in Proposition 2.4.20 and the symbols in
  Proposition 3.6.9 and Theorem 3.6.17 were read in the source.
- Library statuses come from two audits of the pinned Mathlib and Tau Ceti. They cite only
  declarations present in the pinned index, and each citation was read at its file and line.
- The Remark 3.1.17 finding was checked against arXiv:1111.4914 (*Perfectoid spaces*) and
  arXiv:1303.5948 (the survey).
- For checkpoint 2, chapters 4–7 were read in the LaTeX source, with every finding's printed text
  compared with the v5 PDF page it cites.
- Planned statuses come from every packet in `research/blueprint/packets/` and every decomposition
  in `data/decompositions/`. A node counts as planning an item only if it states it; a node that
  imports or requests it does not count.
- The arXiv id of *Slope filtrations for relative Frobenius* was taken from the arXiv API.
- Nothing was compiled; a paper job has no Lean file.
