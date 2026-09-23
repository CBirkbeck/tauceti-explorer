# PAPER-LANDESMAN-LITT-24 — Canonical representations of surface groups

Claude Code — session `cc-7b31c4`; issue #1077; read on 22 September 2026.

The 62-page paper has been extracted into 111 items. Four are in the pinned libraries, eleven are planned by existing
layers of the atlas, and the remaining 96 each have exactly one route: 49 form a new roadmap, **Mapping class groups and
canonical representations of surface groups** (`MappingClassGroupsAndCanonicalRepresentations`), 37 go to a **Part II**
of the Tau Ceti roadmap *Hodge structures (pure, mixed, and polarized)*, 3 become sources for
`InverseGaloisAndArithmeticFundamentalGroups:IG.0` and `IG.1`, 5 for `GlobalGaloisDeformations:R04.1` and `R04.2`, and 2
for `AlgebraicModuliForArithmeticGeometry:R09.4`, `R09.5` and `R09.7`. This is a paper inventory and routing proposal,
not a proof blueprint: the results quoted from Mochizuki, Mehta–Seshadri, Steenbrink–Zucker, Saito, Timmerscheidt,
Esnault–Groechenig, Klevdal–Patrikis, Wewers, Aramayona–Souto, Cousin–Heu and the authors' own earlier work are recorded
as items with their own prerequisite entries and are not decomposed here.

## What the paper proves

Let `Σ_{g,n}` be an orientable surface of genus `g` with `n` punctures. The mapping class group `Mod_{g,n}` acts on
conjugacy classes of representations `π₁(Σ_{g,n}) → GL_r(ℂ)`, and a representation is **MCG-finite** when its conjugacy
class has finite orbit. Any representation constructed without naming a specific curve is MCG-finite, so these are the
*canonical* representations of a surface group; equivalently, by Cousin–Heu, the semisimple ones correspond to algebraic
solutions of isomonodromy differential equations, and in the case `g = 0`, `n = 4`, `r = 2` with trivial determinant to
algebraic solutions of Painlevé VI, whose classification took a century.

* **The main theorem (1.2.1).** If `ρ : π₁(Σ_{g,n}) → GL_r(ℂ)` is MCG-finite and `r < √(g+1)`, then `ρ` has finite
  image. This answers a question of Whang and answers Kisin's question affirmatively in the range `g > r² − 1`; Kisin's
  question has negative answers in general. Equivalently (Corollary 1.6.1), a representation of the free group `F_N`,
  `N = 2g` or `2g + 1`, of rank `r < √(g+1)` whose conjugacy class has finite `Out(F_N)`-orbit has finite image — a
  statement Remark 1.6.3 makes completely elementary in terms of Nielsen's four operations on `N`-tuples of matrices.
  The bound is sharp for `g = 1` and not sharp for `g = 2, 3`; since Example 10.1.6(3) produces MCG-finite
  representations of `π₁(Σ_g)` of rank `2g + 1` with infinite image, it cannot be improved beyond linear in `g`.
* **The engine (Theorem 1.7.1).** For `π° : C° → M` a punctured versal family of genus `g` curves and `V` a unitary
  local system on the total space, every nonzero sub-local system of `R¹π°_*V` has rank at least `2g − 2 rk V`. The
  proof identifies the derivative of the period map of the variation of mixed Hodge structure on `R¹π°_*V` with the
  multiplication map `H⁰(E ⊗ ω_C(D)) ⊗ H⁰(E^∨ ⊗ ω_C) → H⁰(ω_C^{⊗2}(D))` (Theorem 5.1.6, proved in Appendix A), where
  `E` is the parabolic bundle attached to `V` by Mehta–Seshadri, and then applies a Clifford-type estimate for
  parabolic bundles (Propositions 5.2.3 and 5.2.4). Its Artinian consequence, Theorem 6.2.1, needs unitarity only on
  fibres and is what makes deformation-theoretic vanishing available.
* **The Putman–Wieland conjecture (Theorem 7.2.1).** For a finite `H`-cover `Σ_{g',b',p'} → Σ_{g,b,p}` with stabiliser
  `Γ ⊂ PMod_{g,b,p+1}` and `ρ` an irreducible `H`-representation, the `ρ`-isotypic component of `H¹(Σ_{g',b',p'}, ℂ)`
  has no nonzero `Γ'`-invariant subrepresentation of dimension less than `2g − 2 dim ρ`, for every finite-index
  `Γ' ⊆ Γ`. Hence the Putman–Wieland conjecture holds whenever every irreducible representation of `H` has dimension
  less than `g`, and in particular whenever `#H < g²`. This is an asymptotic form of a conjecture that is false as
  stated for `g = 2`.
* **The proof, in three steps.** *Unitary:* associate to an irreducible unitary MCG-finite `ρ` a projective local
  system on a punctured versal family (Lemmas 2.2.2, 2.2.3 and Proposition 2.3.4), show it is strongly cohomologically
  rigid by Theorem 6.2.1 (Proposition 8.2.1), conclude integrality by Klevdal–Patrikis, and then make every Galois
  conjugate unitary by Mochizuki's non-abelian Hodge theory, so the image is finite. *Semisimple:* deform to a complex
  variation of Hodge structure, use the authors' earlier low-rank result to make it fibrewise unitary, apply the
  unitary case, and show with Lemma 8.5.2 that the deformation did not move the restriction to a fibre. *General:*
  induct on the socle filtration; the extension class of a low-rank extension gives a small `Γ`-stable subspace of an
  isotypic component of `H¹` of a finite cover, which Theorem 7.2.1 forbids (Lemma 8.6.1).
* **Arithmetic consequences (§9).** On a curve whose moduli point is the generic point of `M_{g,n,ℚ̄}`, every continuous
  *arithmetic* representation `π₁^ét(C_{K̄} \ {x_i}) → GL_r(ℚ̄_ℓ)` with `r < √(g+1)` has finite image (Theorem 9.1.2),
  verifying a prediction of the relative Fontaine–Mazur conjecture and answering a question of Esnault–Kerz negatively.
  Corollary 9.1.4 gives a four-way equivalence between finiteness, arithmeticity, geometric origin and underlying an
  integral variation, with the last three equivalent in the wider range `r < 2√(g+1)`. Corollary 9.2.2 and
  Example 9.2.3 then produce surjective residual representations onto `GL_r(𝔽_p)` with no arithmetic lift — to the
  authors' knowledge the first residual representations of a geometric fundamental group not of geometric origin — and
  so deformation rings of absolutely irreducible residual representations of arithmetic fundamental groups of generic
  curves need not be complete intersections, answering a question of Flach negatively in this setting.

## The source actually read

`arXiv:2205.15352v4`, posted 23 February 2025, 62 pages, SHA-256
`4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`, downloaded from
<https://arxiv.org/pdf/2205.15352v4> on 22 September 2026 and read completely: the introduction, §§2–10, Appendix A and
the bibliography. The published article — *Annals of Mathematics* **199** (2024), no. 2,
[DOI 10.4007/annals.2024.199.2.6](https://doi.org/10.4007/annals.2024.199.2.6) — is paywalled and was not consulted, so
every locator names a section, theorem, lemma or equation number together with the page of the arXiv v4 PDF, and the
three findings below are recorded against that version. Version v1 is from 30 May 2022; the author comment on v4 reads
"Updated to fix improperly rendered figure", so v4 is the published text with a corrected figure. Neither the arXiv
abstract page nor Crossref lists an erratum or corrigendum.

One reading point is worth stating, because it is easy to get wrong from a text extraction: the rank bound throughout
the paper is `r < √(g+1)`, with the radical over `g + 1`, **not** `√g + 1`.

## Checks run on the paper's claims

The paper contains no tables or numerical experiments, so the checking was of its arithmetic, its internal consistency
and its cross-references.

* **The rank bound.** The reading `r < √(g+1)` is confirmed three independent ways: Remark 1.8.2 states the range as
  `g > r² − 1`, which is exactly `r² < g + 1`; the proof of Proposition 8.2.1 uses `rk ad V = r² − 1 < g`; and the
  proof of Lemma 8.5.1 writes `rk ad(γ) = r² − 1 < g as r < √(g+1)`. The reading `√g + 1` is inconsistent with all
  three.
* **Lemma 8.6.1.** With `dim ρ₁ + dim ρ₂ < √(g+1)`, AM–GM gives
  `dim ρ₁ · dim ρ₂ ≤ ((dim ρ₁ + dim ρ₂)/2)² < (√(g+1)/2)² = (g+1)/4`, as printed; and the chain
  `2g − 2 dim σ_i > 2g − (g+1)/2 = 3g/2 − 1/2 > (g+1)/4` holds for every `g ≥ 1`, since `6g − 2 > g + 1` for `g ≥ 1`.
  The degenerate case `g = 0` is handled separately, correctly: `r < √1 = 1` forces `ρ = 0`.
* **Corollaries 7.2.3 and 7.2.4.** If `dim ρ < g` then `2g − 2 dim ρ ≥ 2 > 1`, so Theorem 7.2.1 rules out invariant
  lines, which is what the proof needs. If `#H < g²` then no irreducible degree `d` can satisfy `d ≥ g`, since
  `#H = Σ d_i² ≥ d² ≥ g²`.
* **Sharpness.** For `g = 1` the bound admits only `r = 1`, and the two-dimensional special dihedral representations of
  [BGMW17] have infinite image, so Remark 10.2.1's sharpness claim is consistent. For `g = 2` and `g = 3` the bound
  again admits only `r = 1`, and Remark 10.2.2 shows rank two also works there, so the bound is not sharp — consistent.
* **Cross-references.** Every theorem of the introduction was matched to its proof: Theorem 1.2.1 to §8.7, Corollary
  1.2.3 to [CH19, Theorem A], Corollary 1.3.1 to Proposition 2.1.3, Theorem 1.4.1 to Corollary 7.2.4, Theorem 1.4.2 to
  Theorem 7.2.1, Theorem 1.7.1 to §6.1, and the dependency diagram of Figure 2 to the actual statements it names.

Three misprints were found; they are recorded in `sourceIssues` and discussed below. Nothing else was found, and the
scope of that statement is exactly the checks above: the proofs were read for their structure and their inputs, not
verified line by line.

## What the libraries and the atlas already have

Four items are in the pinned libraries. Mathlib has the fundamental groupoid and fundamental group
(`mathlib:FundamentalGroup`) and covering maps (`mathlib:IsCoveringMap`), with Tau Ceti adding basepoint change and the
covering theory of aspherical spaces; Mathlib has free groups (`mathlib:FreeGroup`) with their universal property and
group cohomology in low degrees (`mathlib:groupCohomology.H1`); and Tau Ceti proves that the sum of the squares of the
degrees of the irreducible characters is the order of the group (`tauceti:TauCeti.sum_characterDegree_sq_eq_card`,
read in `TauCeti/RepresentationTheory/CharacterTable/Table.lean` at `f790474`), which is exactly what Corollary 7.2.4
needs.

Eleven items are planned by existing layers and are imported, not re-planned: Schur's lemma and isotypic components
(`tauceti:…/SemisimpleAlgebras` layer 1 and `…/CharacterTheory` layer 2); unitary groups, averaging and unitarizability
(`…/CompactGroups` layers 0 and 1); Riemann–Roch and Serre duality on a curve (`SchemeAndStackFoundations:SF.3` and the
Tau Ceti Jacobian-challenge layer B); Clifford's theorem (`tauceti:…/AlgebraicCurves` layer 5); Poincaré duality and the
intersection pairing on a surface (`tauceti:…/AlgebraicTopology` stage 6); the Leray spectral sequence
(`tauceti:…/AlgebraicTopology` stage 5 and `ClassicalAdicEtaleCohomology:H0`); Grassmannians and their tangent bundles
(`AlgebraicModuliForArithmeticGeometry:R09.1`, `R09.2`); Galois categories and the étale fundamental group
(`InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `IG.1`); profinite completion
(`tauceti:…/ProfiniteProPGroups` layer 0); Lafforgue's correspondence and Deligne's companions
(`GlobalShtukasAndFunctionFieldLanglands:GS.6`, `DeligneWeightsAndPurity:DWP.7`); and deformation functors with their
representability (`GlobalGaloisDeformations:R04.1`, `R04.2`).

Three searches came back empty and determined the routing. A text search of every stage description in the atlas
extracts for **"mapping class"** returns only the use of surface mapping classes in Heegaard splittings; for
**"Teichmüller"** only Teichmüller lifts of Witt vectors and Kantorovich duality; and for **"non-abelian Hodge"**,
**"parabolic bundle"**, **"character variety"**, **"Simpson"**, **"rigid local system"**, **"Putman"**, **"Mehta"** and
**"isomonodromy"** nothing at all. The outer automorphism group `Out(G)` is in neither library — Mathlib has `MulAut`
but no quotient by the inner automorphisms — and no layer plans it. The moduli stack `M_{g,n}` itself is not planned:
`AlgebraicModuliForArithmeticGeometry:R09.4` names generalised elliptic curves and polarised abelian schemes as its
targets.

## The routes, and why each goes where it goes

**1. New roadmap `MappingClassGroupsAndCanonicalRepresentations` — 49 items** (`topology`). The whole topological half
of the paper, together with the background it assumes: the surface and its fundamental group, Dehn twists, `Mod_{g,n}`
and `PMod_{g,n}`, the Birman exact sequence and the point-pushing subgroup, the identification `π₁(M_{g,n}) ≅
PMod_{g,n}`, versal and punctured versal families, MCG-finite representations with their closure properties and the
projective representation `ρ̃`, higher Prym representations and the Putman–Wieland results, the three steps of the main
proof, the arithmetic theorems of §9 that are deduced from it, and §10's examples and questions. Nothing in the atlas
goes in this direction and there is no parent roadmap a Part II could extend: the Tau Ceti roadmap on Fuchsian groups
and orbifold Riemann surfaces stops at the compactified quotient and the level-one modular quotient, and the Hurwitz
spaces of `InverseGaloisAndArithmeticFundamentalGroups:IG.5` are about branch cycles and Nielsen classes, not about the
mapping class group. The subject has its own targets — canonical representations of surface and free groups, the
Putman–Wieland conjecture, Ivanov's conjecture — and its own literature.

**2. Part II of `tauceti:TauCetiRoadmap/HodgeStructures` — 37 items** (`algebraicgeometry`), titled *Hodge structures
(pure, mixed, and polarized), Part II: variations, period maps and non-abelian Hodge theory*. The parent plans pure
Hodge structures and the Hodge decomposition (L0), polarization and Hodge–Riemann (L1), mixed Hodge structures and
strictness (L2) and the points of a period domain with its symmetry group (L3) — and its L3 milestone says in so many
words that *"the period domain's manifold structure is the successor roadmap, not this milestone"*. That successor is
exactly what this paper needs: variations of pure and mixed Hodge structure with graded-polarizability and
admissibility, the theorem of the fixed part, the Deligne canonical extension, the period map and its derivative
through Appendix A, parabolic bundles and Mehta–Seshadri, the non-abelian Hodge theory of Simpson and Mochizuki, and
the cohomological rigidity and integrality package. A Tau Ceti roadmap is never re-planned, so this is a Part II rather
than a source; a new roadmap was rejected because every layer continues L0–L3 and consumes them. Theorems 1.7.1 and
6.2.1 are kept here rather than with the mapping class groups because they are theorems about period maps and parabolic
bundles whose statements happen to be made over a family of curves.

**3. Source for `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `IG.1` — 3 items.** IG.0 constructs Galois
categories and the étale fundamental group, IG.1 the arithmetic exact sequences and specialization. The three items are
general facts of exactly that kind: the definition of an arithmetic representation through the outer Galois action on
`π₁^ét(X_{K̄})`, the exactness of `1 → π₁^ét(C°_{K̄}) → π₁^ét(C°) → Gal(K̄/K) → 1` with the compatibility of the two
induced outer actions, and the density of the topological fundamental group of a punctured Riemann surface in its
profinite completion. The paper's own finiteness theorems for arithmetic representations are not routed here; they
belong with the main theorem they are deduced from.

**4. Source for `GlobalGaloisDeformations:R04.1`, `R04.2` — 5 items.** §3's three lemmas are ordinary deformation
theory of representations of an abstract group — first-order deformations with constant determinant are classified by
`H¹(G, ad ρ)`, a deformation is constant on a normal subgroup when `H⁰(Q, H¹(N, ad))` vanishes, and a `ℂ[[t]]`-family
with that vanishing is conjugate to a constant family on the normal subgroup — and belong in the layer that owns
deformation functors. With them go the definition of a residual representation of geometric origin and the paper's
explicit failure of flatness over `ℤ_p`, which is a statement about universal deformation rings and hence about R04.2.

**5. Source for `AlgebraicModuliForArithmeticGeometry:R09.4`, `R09.5`, `R09.7` — 2 items.** The algebraicity of
`M_{g,n}` as a smooth Deligne–Mumford stack with its Deligne–Mumford compactification and finite étale covers that are
schemes, and the construction of a strict normal crossings compactification of `M_{g,n+1}` by blowing up boundary
strata, whose boundary monodromy is generated by products of commuting Dehn twists. These are the same kind of
statement R09.4, R09.5 and R09.7 already plan for other moduli problems, and PROTOCOL.md §15 asks that a general
missing notion be planned once in the layer that owns it. The *topological* facts about `M_{g,n}` — contractibility of
its universal cover and `π₁(M_{g,n}) ≅ PMod_{g,n}` — stay with the new roadmap.

## Prerequisite papers the atlas does not yet cover

Seventeen entries. The one that carries the most weight is the authors' own companion paper, *Geometric local systems
on very general curves and isomonodromy* (JAMS 2024), which supplies the low-rank unitarity theorem for complex
variations of Hodge structure, the finiteness of integral variations, the finiteness of representations into
`GL_r(O_K)` unitary at every embedding, and the parabolic estimate of Proposition 5.2.4. Mehta–Seshadri supplies the
correspondence between parabolically stable bundles and unitary local systems; Mochizuki supplies non-abelian Hodge
theory for quasi-projective varieties; Esnault–Groechenig and Klevdal–Patrikis supply the integrality of
cohomologically rigid local systems, through which Lafforgue's work over function fields enters; Steenbrink–Zucker and
Peters–Steenbrink supply variations of mixed Hodge structure and the theorem of the fixed part, with Saito and Schnell
for admissibility and Timmerscheidt for the unitary case on curves; Deligne supplies the canonical extension.
Putman–Wieland state the conjecture, Cousin–Heu the isomonodromy dictionary, Wewers the versal families of `ϕ`-covers,
Farb–Margalit the mapping class group background, Aramayona–Souto and Li–Litt–Salter–Srinivasan the quasi-unipotence of
boundary monodromy, Voisin the model computation of the derivative of a period map, and Sikora the closedness of
semisimple orbits in the representation variety.

## Mistakes found in the source

Three misprints, none of which affects a proof.

* **E1** (Notation 7.1.1, p. 35). After defining the isotypic component `H₁(Σ_{g′,b′,p′}, ℂ)_ρ`, the next sentence
  speaks of *"the characteristic subrepresentation `H¹(Σ_{g′,b′,p′}, ℂ)_ρ`"* — a superscript where the object just
  defined, and the object the sentence is about, carries a subscript. The cohomological isotypic component that then
  appears in Theorem 7.2.1 is never defined.
* **E2** (proof of Theorem 7.2.1, §7.3, p. 37, twice). The proof writes `H¹(Σ_{g′,0,p′}, ℚ)_ρ` where the statement,
  Notation 7.1.1 and Remark 7.1.4 all use `ℂ`. The isotypic component for an irreducible complex representation is not
  defined over `ℚ`, and the proof itself works with the complex local systems `U_ρ`.
* **E3** (§1.3, p. 4). Recalling versality before Corollary 1.3.1, the paper writes *"is versal if the corresponding map
  `M → M_{g,n}` is dominant"*, omitting "and étale". Notation 1.10.1, to which the sentence explicitly defers, requires
  both, and étaleness is used essentially in Lemma 2.1.4 and in the hypothesis of Theorem 1.7.1.

Each finding is recorded in `sourceIssues` with its quotation, correction, reason and the places checked for a
published correction: the arXiv abstract page and version history for 2205.15352 (whose only v4 comment is a figure
fix) and the Crossref record for DOI 10.4007/annals.2024.199.2.6. The items above use the corrected statements.

## What this extraction does not claim

Nothing here is formalised, and nothing is claimed to be. The items record what the paper uses and proves, with a
locator for each; they are not proof blueprints, and the design jobs that follow the two briefs will have to do the
backward chaining. Four boundaries are worth naming. First, the quoted results were checked against the statements
given in this paper, but their own proofs were not read, which is why they are recorded as prerequisites. Second, the
open questions of §10 — the rigidity of representations of finite-index subgroups of `Mod_{g,n}`, the minimal rank of
an MCG-finite representation with infinite image, Conjecture 10.2.8 for free groups — are recorded as targets, not as
theorems, and the routing does not commit the atlas to answering them. Third, the parabolic estimate Proposition 5.2.4
is taken from the companion paper as a black box, so the roadmap that receives it will need that paper's §6 as a
source. Fourth, the claim that only three misprints exist means only that the checks listed above found only those.

## Review (REV-PAPER-LANDESMAN-LITT-24, 23 September 2026)

The review, by Claude Code (session cc-39fac3), accepted the extraction and all five routes after corrections made in place. The full record is `research/blueprint/reviews/REV-PAPER-LANDESMAN-LITT-24.md`. The review read arXiv v4 and its TeX again; the published version is paywalled.

- **Statements:** 30 corrected. Among them:
  - M_{g,n,ℚ} in item 77;
  - the arithmetic fundamental group in item 83;
  - the algebraic closures in item 80;
  - Klevdal–Patrikis's hypotheses in item 63;
  - the split of item 72;
  - the total-space/fibre conflation in nine items.
- **Locators:** 9 corrected.
- **Library citations:** item 94 no longer claims the homotopy long exact sequence of a fibration, which neither library has. Items 94 and 100 now cite the Tau Ceti classification of covers and Mathlib's inflation–restriction sequence.
- **New items:** 28, all missing: 18 to the new roadmap, 9 to the Hodge Part II and 1 to IG.
- **Briefs:** both now record the corrections their layers must respect.
- **Source issues:** E1–E3 are confirmed. E4–E22 are new:
  - gaps in the proofs of Lemma 8.6.1 (the choice of Γ never uses MCG-finiteness) and Lemma 8.3.3, and in the g = 0 case of Lemma 2.4.2;
  - Lemmas 2.2.2 (uniqueness) and 6.1.1, which are false as stated;
  - misprints.

  None affects the main theorems.
