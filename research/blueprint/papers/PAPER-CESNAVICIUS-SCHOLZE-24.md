# PAPER-CESNAVICIUS-SCHOLZE-24: extraction and routing

Issue #1071. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Kęstutis Česnavičius and Peter Scholze, *Purity for flat cohomology*, Ann. of Math. 199 (2024), no. 1, 51–180 (doi 10.4007/annals.2024.199.1.2; arXiv 1912.10932).

The result has **143 items**:

- 3 library items: regular sequences and regular local rings (Mathlib), and the tilt with Fontaine's θ (Mathlib's `PreTilt` and `WittVector.fontaineTheta`);
- 16 planned items, which the atlas plans in its perfectoid, prismatic, derived-algebra, scheme-foundation and étale-duality roadmaps;
- 124 missing items, routed as follows:
  - 39 to a **new roadmap**, *Purity for flat cohomology and the conjectures of Gabber* (`PurityForFlatCohomology`, area `algebraicgeometry`);
  - 45 to a **Part II of SchemeAndStackFoundations**, *flat cohomology with finite locally free coefficients over animated rings*;
  - 16 to a **Part II of PerfectoidQuotients**, *structure of integral perfectoid rings and the ind-syntomic André lemma*;
  - 6 to a **Part II of EtaleDualityAndPerverseSheaves**, *absolute cohomological purity and Gabber's local theorems*;
  - 11 to **ArcTopologyAndDescent**, the new roadmap already proposed by four other extractions;
  - 6 to **PrismaticCohomologyPartIIPrismaticDieudonneTheory**, the Part II proposed by the Anschütz–Le Bras extraction;
  - 1, the Cohen structure theorem, as a **source** of DeformationAndDerivedPatchingAlgebra R03.1.

Fourteen mistakes are recorded under `sourceIssues`: thirteen misprints, and an error in Theorem 7.1.2, which is false in the edge case d = 1.

## What the paper proves

1. **Purity for flat cohomology.**
   - Theorem 6.2.3 (= Theorem 1.1.1): for a Noetherian local complete intersection (R, 𝔪) and a commutative, finite, flat R-group G, H^i_𝔪(R, G) = 0 for i < dim(R).
   - Theorem 6.2.7 sharpens this to i ≤ dim(R) when R is regular and not a field.
   - Theorem 7.1.2 globalizes it: flat cohomology classes extend uniquely across closed subsets of large enough codimension in schemes with complete intersection singularities.
2. **Gabber's conjectures.**
   - Pic(U_R)_tors = 0 for complete intersections of dimension ≥ 3 (Theorem 7.2.1).
   - Br(R) ≅ Br(U_R) for complete intersections of dimension ≥ 4 or regular rings of dimension ≥ 2 (Theorem 7.2.5).
   - Hence purity for the Brauer group of schemes with complete intersection singularities (Theorem 7.2.8). This reproves Česnavičius's regular case without treating dimension 3 separately.
3. **Étale coefficients.**
   - A third proof of Gabber–Thomason absolute purity (Theorem 3.1.3). It passes to a perfectoid tower and tilts étale cohomology algebraically by arc descent (Theorem 2.2.7), without adic spaces or almost purity.
   - For finite étale G, purity holds in degrees below the virtual dimension of any Noetherian local ring (Theorems 3.2.4 and 6.2.4).
   - Zariski–Nagata purity holds for virtual dimension ≥ 3 (Theorem 3.3.1).
4. **The key formula (Theorem 6.1.1).** For perfectoid A and G of p-power order, RΓ_Z(A, G) ≅ RΓ_Z(A_inf(A), 𝕄(G))^{V=1} through prismatic Dieudonné modules.
   - Both sides satisfy p-complete arc hyperdescent, and they agree on products of valuation rings.
   - It yields purity for perfectoid rings (Theorem 6.1.2): depth_Z(A) ≥ d implies depth_Z(A_inf) ≥ d + 1.
5. **Flat cohomology of animated rings (Section 5).** These results are new already for ordinary rings:
   - fppf hyperdescent and Postnikov convergence;
   - a deformation triangle;
   - the p-adic continuity formula (Theorem 5.3.5);
   - excision (Theorem 5.4.4);
   - fpqc hyperdescent (Theorem 5.5.2);
   - general continuity for derived-complete rings (Theorem 5.6.6);
   - invariance under Henselian pairs in degrees ≥ 2 (Corollary 5.6.9);
   - algebraization, and adically faithfully flat descent with supports (Theorem 5.7.2).

   The engine is the positive-characteristic key formula (Theorem 4.1.8) through crystalline Dieudonné theory over perfect bases.
6. **An ind-syntomic André lemma (Theorem 2.3.4).** It is used to adjoin p-power roots of the equations of a complete intersection. Killing them costs nothing in low degrees because the square-zero ideals are free (Lemma 4.1.11). This is the only place the complete intersection hypothesis enters. The paper shows that Cohen–Macaulay rings do not suffice (Remark 7.2.2).

## Sources inspected

- **arXiv 1912.10932v3** (26 April 2023, "final version, to appear in Annals of Mathematics") was read in full, both its TeX source (SHA-256 `10bb01b0…81d03e2c`) and its PDF (97 pages, SHA-256 `2f9d3ee8…15cd6ed4`).
  - Statement numbers were simulated from the TeX counters and matched against every numbered heading of the PDF. **Locators give arXiv v3 numbering and pages.**
- **The published article** (Annals 199 (2024) 51–180) could not be read. Its PDF is behind the Annals subscription.
  - The Annals page gives: received 7 January 2020, revised 27 February 2023, accepted 21 April 2023.
- **The authors' revision of 27 February 2023** is posted on the first author's homepage (88 pages, SHA-256 `863f0cc6…f8179cd8`). It was compared with v3 by a word-level diff.
  - The two versions differ in some section titles and small wordings, with the same numbering.
  - Misprints E4 and E8 occur only in v3.
- **Crossref** has no correction or update relation for the DOI, and the homepage lists no erratum.

All sources were accessed on 23 September 2026.

## Mistakes found (`sourceIssues`)

**An error in a stated result (E1):**

- **Where.** Theorem 7.1.2 (p. 87) allows each 𝒪_{X,z}, z ∈ Z, to be "regular of dimension ≥ d − 1".
- **Why it is false.** For d = 1 this admits fields. Take X = Z = Spec(k): then H^0(X, G) = G(k) → H^0(∅, G) = 0 is not injective. The proof invokes Theorem 6.2.7, which excludes fields.
- **The correction.** Require dimension ≥ max(d − 1, 1). Every use in the paper has d ≥ 3.

**Misprints (E2–E14), each with reach "nothing":**

- **E2 (proof of Proposition 2.1.8).** "A_2 ⊂ A" should be A_2 ⊂ Ã.
- **E3 (proof of Theorem 2.3.4).** "p-this integral closure" should be "this p-integral closure".
- **E4 (proof of Theorem 3.3.1(b)).** "vdim(Rd)" should be vdim(R). This one is only in v3.
- **E5 (5.2.1).** "π_*(M' ⊗^L M) ≅ π_i(M') ⊗ π_0(M)" should have π_* on the right.
- **E6 (proof of Lemma 5.4.2, step (3)).** "A⟨a^∞⟩ ≅ (π_0(A))⟨a^∞⟩" should be π_0(A')⟨a^∞⟩.
- **E7 (Example 5.6.7).** A stray "for i ≥ 2" contradicts the range "surjective for i ≥ 1".
- **E8, E9 and E10 (proof of Theorem 5.7.2).** They are:
  - the equation list repeats (5.7.2.2) instead of ending with (5.7.2.3) (only in v3);
  - "τ_{≤n} ⊗^L A^•" should be τ_{≤n}(A) ⊗^L A^•;
  - "(a_1, …, a_n)" should be (a_1, …, a_r).
- **E11 (proof of Theorem 6.2.7).** "(p, x_1, …, x_n)²" should be (p, x_1, …, x_d)².
- **E12 and E13 (proofs of Theorems 7.2.1 and 7.2.5).** "n ≥ 0" for μ_n should be n ≥ 1.
- **E14 (Section 5.6).** "Akhil Matthew" should be Mathew.

**Checked and found correct:**

- **Remark 6.2.6.** xy is killed by z and t (xz = yt with x² = y² = 0), and vdim = 4 − 3 = 1.
- **Remark 7.2.2.** It is a genuine counterexample for n ≥ 3. The remark's "n ≥ 2" is still true as a statement about Pic(U_R)[2], so this is only noted on the item.
- **The hypersurface reduction in Theorem 3.2.4.** Each R_* has vdim ≥ vdim(R) + 1.
- **The claim computation in Proposition 4.2.10.** The equation is y^p − ξy + b = 0.
- **The Dieudonné normalizations of Examples 4.1.2 and 4.2.2.** They satisfy FV = Frob(ξ) and VF = ξ.
- **The degree ranges in Corollaries 5.2.9 and 5.2.10.**

## What the atlas and the libraries already have

**Libraries.**

- Mathlib has:
  - regular sequences in the EGA convention (`RingTheory.Sequence.IsWeaklyRegular`);
  - `IsRegularLocalRing`;
  - the tilt of a p-adically complete ring with Fontaine's θ and its surjectivity (`PreTilt`, `WittVector.fontaineTheta`, `surjective_fontaineTheta`);
  - Henselian pairs, `localCohomology`, `CommRing.Pic`, Azumaya algebras, ultrafilters and the Stone–Čech compactification, and the fppf topology on schemes.
- Tau Ceti has Cartier duality for finite locally free commutative affine group schemes (`FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual`).
- Neither library has flat or étale cohomology of schemes, perfectoid rings as such, animated rings, Dieudonné theory or the arc-topology.

**The atlas plans the surrounding foundations (16 items):**

- **Perfectoid and prismatic:**
  - integral perfectoid rings with A_inf and θ: PerfectoidQuotients Q0;
  - the tilting equivalence through perfect prisms: PrismaticCohomology PR.0;
  - André's lemma in its Bhatt–Scholze form: Q3.
- **Derived algebra:**
  - animation and 1-sifted colimits: EnhancedDerivedSheaves E5;
  - the cotangent complex and square-zero extensions: DerivedDeRhamCohomology DD.0;
  - derived completion and Yekutieli-type complete flatness: DD.1;
  - descent and hyperdescent: E2 and SF.1.
- **Scheme foundations:**
  - the fppf–étale comparison: SchemeAndStackFoundations SF.2;
  - formal algebraization: SF.4;
  - fundamental groups: InverseGaloisAndArithmeticFundamentalGroups IG.0.
- **Commutative algebra:** complete intersections, depth and the vanishing of local cohomology along a regular sequence: DeformationAndDerivedPatchingAlgebra R03.3.
- **Étale inputs:**
  - cohomology with supports: EtaleDualityAndPerverseSheaves EDC.0;
  - finite flat traces and smooth purity, which give Artin's positive-characteristic purity: EDC.1 and EDC.2.

**The atlas has none of the rest:**

- flat cohomology beyond the site;
- Brauer groups of schemes;
- local Picard groups;
- the SGA 2 purity theorems;
- absolute purity, which EDC.2 explicitly excludes;
- Dieudonné theory beyond perfect fields;
- the arc-topology.

## Routes

1. **New roadmap: "Purity for flat cohomology and the conjectures of Gabber"** (39 items).
   - **Final theorems:** Theorems 6.2.3, 6.2.7, 6.1.1, 6.1.2, 6.2.4, 3.3.1, 7.1.2 (with the corrected hypothesis), 7.1.3, 7.2.1, 7.2.3, 7.2.5, 7.2.8 and 7.2.9.
   - **Layers, in order:**
     - virtual dimension and étale depth;
     - Zariski–Nagata for virtual dimension ≥ 3;
     - positive-characteristic purity;
     - the perfectoid Dieudonné analysis;
     - the key formula and perfectoid purity;
     - the main theorems;
     - the global, Picard and Brauer consequences, with the SGA 2 inputs and the sharpness examples as tests.
   - **Why new.** No roadmap goes in this direction. The pending Česnavičius *Purity for the Brauer group* extraction (#1328) should route there too.
2. **Part II of SchemeAndStackFoundations: "flat cohomology with finite locally free coefficients over animated rings"** (45 items).
   - **Contents:**
     - the positive-characteristic key formula (Section 4.1 through Corollary 4.1.9) and all of Section 5 except Theorem 5.5.1;
     - the Bégueri resolution, ind-fppf and ind-syntomic maps, and the pro-fppf site;
     - the Brauer group of a scheme with Gabber's theorem Br = H^2(𝔾_m)_tors.
   - **Why a Part II.** SF.2 owns the fppf site and its cohomology. These are general properties with many potential consumers.
3. **Part II of PerfectoidQuotients: "structure of integral perfectoid rings and the ind-syntomic André lemma"** (16 items).
   - **Contents:** the canonical decomposition, fibre products, p-integral closures, stability properties, torsion-free covers, the approximation and nilpotence lemmas, the André lemma, semiperfectoid covers, and perfectoid towers over complete regular local rings.
4. **Part II of EtaleDualityAndPerverseSheaves: "absolute cohomological purity and Gabber's local theorems"** (6 items).
   - **Contents:** Theorem 3.1.3 with its perfectoid proof, the reduction of full purity (Remark 3.1.4), algebraic tilting (Theorem 2.2.7), the local Lefschetz lemma, Gabber's affine Lefschetz theorem, and dualizing complexes with local duality from ILO14.
5. **ArcTopologyAndDescent (consumer route)** (11 items).
   - **Contents:** I-complete arc covers and their examples, the base of products of valuation rings, ultraproduct components, arc hyperdescent for étale cohomology, the Henselization and completion comparisons, formal glueing, Gabber's affine proper base change, tilting of arc covers, and Bhatt–Scholze Proposition 8.10.
   - **Why join it.** The route follows the brief of the Bhatt–Mathew extraction, as the Guo–Reinecke and Clausen–Mathew–Morrow extractions did.
6. **PrismaticCohomologyPartIIPrismaticDieudonneTheory (consumer route)** (6 items).
   - **Contents:** the torsion classification over perfectoid rings, its exactness and examples, and the crystalline classification over perfect bases (Berthelot, Gabber, Lau), which is its perfect-ring case.
7. **Source route to DeformationAndDerivedPatchingAlgebra R03.1:** the Cohen structure theorem, which R03.1's presentations of complete local rings rest on.

## Judgement calls for the reviewer

- **Where the positive-characteristic key formula lives.** Theorem 4.1.8 and its companions are in the SchemeAndStackFoundations Part II, not the new roadmap, because excision (Lemma 5.4.2) and fpqc descent (Theorem 5.5.2) use it. This keeps the dependencies acyclic: the new roadmap imports the Part II, not the reverse. Theorem 5.5.1, which uses the perfectoid Dieudonné analysis, stays in the new roadmap.
- **Algebraic tilting and absolute purity are an EDC Part II.** They are not in the purity roadmap because EDC.2 names absolute purity as outside its scope. The Part II imports the perfectoid towers from the PerfectoidQuotients Part II.
- **Brauer groups of schemes** (the definition and Gabber–de Jong) are placed in the flat-cohomology Part II. They could instead be their own Part II of SchemeAndStackFoundations.
- **Consumer routes onto proposals still under review.** Two routes join proposals made by other extractions: ArcTopologyAndDescent and the Anschütz–Le Bras prismatic Dieudonné Part II. If either proposal is rejected, those items need new homes.
  - Corollary 2.1.6 (completed ind-étale algebras over a perfectoid are perfectoid) duplicates the Anschütz–Le Bras extraction's item 13.
  - The crystalline classification over perfect bases is added to the prismatic Part II rather than to a FiniteFlatGroupsAndIntegralPadicHodgeTheory Part II. R07.2 there covers only perfect fields.
- **The source route to R03.1 for the Cohen structure theorem** assumes R03.1's "presentation as inverse limits" is the natural owner; R03.3 is the alternative.
- **Theorem 7.1.2 is recorded in its corrected form** (regular local rings of dimension ≥ max(d − 1, 1)). A reviewer with access to the published version should check whether the edge case was fixed there.

## Prerequisites not yet covered by the atlas

These are listed in the result with links:

- **Brauer purity:** Česnavičius, *Purity for the Brauer group* (Duke 2019). It is in `papers.json` but not yet extracted.
- **Dieudonné theory:**
  - Lau (JAMS 2013; Compositio 2018);
  - Berthelot (Ann. ÉNS 1980) and Berthelot–Breen–Messing (LNM 930);
  - Kato–Trihan (Invent. 2003).
- **Henselian pairs and étale cohomology:**
  - Bouthier–Česnavičius (Ann. ÉNS 2022);
  - Gabber, *Affine analog of the proper base change theorem* (Israel J. 1994).
- **Gabber's local theorems:**
  - Illusie–Laszlo–Orgogozo, *Travaux de Gabber* (Astérisque 363–364);
  - Fujiwara, *absolute purity after Gabber* (2002).
- **Purity and Brauer groups:**
  - SGA 2;
  - Gabber, *Some theorems on Azumaya algebras* (LNM 844), and de Jong, *A result of Gabber*;
  - Gabber, *On purity for the Brauer group* (Oberwolfach 2004).
- **Group schemes and torsors:**
  - Bégueri (Mém. SMF 1980);
  - Auslander (AJM 1962) and Moret-Bailly (CRAS 1985).
- **Commutative algebra:**
  - Yekutieli (Algebr. Represent. Theory 2018);
  - Avramov (Math. Ann. 1977);
  - Gabber–Ramero, *Foundations for almost ring theory*.
- **Higher categories:** Lurie, HTT, HA and SAG.
