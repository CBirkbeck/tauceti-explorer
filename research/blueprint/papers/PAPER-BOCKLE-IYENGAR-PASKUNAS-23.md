# PAPER-BOCKLE-IYENGAR-PASKUNAS-23: extraction and routing

Issue #1382. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Gebhard Böckle, Ashwin Iyengar and Vytautas Paškūnas, *On local Galois deformation rings*, Forum Math. Pi 11 (2023), e30 (doi 10.1017/fmp.2023.25; arXiv 2110.01638); Corrigendum, Forum Math. Pi 12 (2024), e5.

The result has **147 items: 11 planned and 136 missing**. No item is in Mathlib or Tau Ceti. The routes are:

- a **Part II of LocalGaloisDeformationRings** (96 items), for the paper's own theory of the unrestricted framed ring (§§2–5 and the appendix);
- a **Part II of CompletedCohomologyAndLocalGlobalCompatibility** (14 items), for the patching-based density theorem of §6;
- **five source routes**, for general inputs that existing layers own:
  - DeformationAndDerivedPatchingAlgebra R03.1/R03.3 (13 missing and 2 planned items);
  - LocalGaloisDeformationRings R08.1 (9 missing and 1 planned);
  - IntegralHeckeAndGaloisDeterminants IHG.1 (2 missing and 1 planned);
  - ArithmeticGaloisDuality D7 (1 missing and 1 planned);
  - PadicHodgeTheory R06.2 (1 missing).

Seven misprints and two errors are recorded under `sourceIssues`. No stated result is affected.

## What the paper proves

Fix a finite extension F/Q_p and a coefficient field L/Q_p with ring of integers O, uniformiser ϖ and residue field k. Let ρ̄: G_F → GL_d(k) be continuous, with absolutely irreducible irreducible subquotients. The paper studies:

- R^□_ρ̄, the framed deformation ring of ρ̄;
- D̄, the pseudo-character (determinant law) of ρ̄, and R^ps, the universal deformation ring of D̄;
- R_{det ρ̄}, the deformation ring of the character det ρ̄;
- μ = μ_{p^∞}(F).

**The main theorems:**

- **Theorem 1.1.** R^□_ρ̄ is a local complete intersection, flat over O, of relative dimension d² + d²[F:Q_p]. Consequently every ρ̄ lifts to characteristic zero, and the lift can be taken absolutely irreducible (Corollary 3.61).
- **Theorem 1.2.** The map R_{det ρ̄} → R^□_ρ̄ is flat. It induces bijections on irreducible components and on the connected components of the generic fibres.
  - The components are the Spec R^{□,χ}_ρ̄, one for each character χ: μ → O^×.
  - Each R^{□,χ}_ρ̄ and R^{□,χ}_ρ̄/ϖ is a normal domain and a complete intersection.
- **Corollary 1.3.** R^□_ρ̄ is reduced and R^□_ρ̄[1/p] is normal.
- **Theorem 1.4.** For absolutely irreducible ρ̄, the rings R^{□,χ}_ρ̄ and R^{□,χ}_ρ̄/ϖ are factorial, with one exception: d = 2, F = Q_3 and ρ̄ ≅ ρ̄(1).
- **Theorem 1.5.** The fixed-determinant rings R^{□,ψ}_ρ̄ and R^{□,ψ}_ρ̄/ϖ are normal complete-intersection domains.
- **Proposition 1.12.** Absolutely irreducible points are Zariski dense in the generic fibre, and Kummer-irreducible points in the special fibre.
- **Theorem 1.6.** Assume p ∤ 2d. The crystalline points of regular weight are Zariski dense. So are the potentially crystabelline points of fixed regular weight, and the potentially crystalline supercuspidal points of fixed regular weight.

**The method:**

1. **The generic-matrices space (§3.1).** Let E = R^ps⟦G_F⟧/CH(D^u) be the Cayley–Hamilton quotient, a finite R^ps-module. Procesi's generic matrices give A^gen, and with it X^gen = Spec A^gen. X^gen parametrises Cayley–Hamilton representations E → M_d(B).
   - R^□_ρ̄ is a completion of A^gen.
   - X^gen//GL_d → X^ps is an adequate homeomorphism (Wang-Erickson; Alper).
2. **Fibre dimensions (§§2 and 3.2).** GIT over a base (Seshadri) bounds the fibres X^gen_y by a tangent space at the closed orbit (Lemma 2.2). The tangent space is computed with Hom and Ext^1 between the blocks of a parabolic, and with local duality and the Euler characteristic (Proposition 3.11). Those are needed also with coefficients in local fields of characteristic p.
3. **The dimension count (§§3.3–3.4).** A commutative-algebra lemma on Jacobson schemes over a punctured spectrum (Lemma 3.18) turns fibre bounds into dimension bounds. Combined with Böckle–Juschka's equidimensionality of R^ps/ϖ, of dimension 1 + d²[F:Q_p], and summed over the strata of reducible pseudo-characters, this gives dim X̄^gen ≤ d² + d²[F:Q_p] (Theorem 3.31).
4. **Completions (§3.5).** The completion of X^gen at any closed point is a framed deformation ring over a coefficient ring Λ (Proposition 3.34). The residue field there may be finite, p-adic, or a local field of characteristic p, in which case Λ is an O-Cohen ring. Mazur's presentation then turns the dimension bound into complete intersection (Corollaries 3.38–3.45).
5. **Density of irreducible loci (§3.7 and the appendix).** The absolutely irreducible locus (generic fibre) and the Kummer-irreducible locus (special fibre) are dense, with complements of large codimension. Kummer-irreducible points are new; they refine Böckle–Juschka's non-special points, and H^2(G_F, ad^0 ρ_x) = 0 there.
6. **Components and normality (§4).** A presentation over R_{det ρ̄} by a regular sequence (Proposition 4.3) and formal smoothness where H^2(ad^0) = 0 give regularity in codimension 1. Serre's criterion then gives normality, and normality gives the domain property and the components.
   - Special cases need separate arguments: d = 2 with F = Q_p (Lemmas 4.11–4.12, and Corollary 3.49 for F = Q_2), and the factoriality exceptions (Chenevier's computation for Q_2, Böckle's for Q_3).
   - Factoriality in general follows from Grothendieck's parafactoriality theorem.
7. **Fixed determinant (§5).** A twist by d-th roots of characters (Proposition 5.1) relates R^{□,χ} to R^{□,ψ}. The fibrewise flatness criterion gives flatness of R_{det ρ̄} → R^□_ρ̄.
8. **Density of p-adic Hodge theoretic points (§6).** The patched module M_∞ of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin is used. Knowing the components shows that R^□_ρ̄ acts faithfully on M_∞ (Theorem 6.8). The density arguments of Emerton–Paškūnas then apply (Theorem 6.1).

## Sources inspected

- The **published article** is open access (CC BY): [doi 10.1017/fmp.2023.25](https://doi.org/10.1017/fmp.2023.25), 54 pages. It was received 6 December 2021, revised 19 August 2023, accepted 9 September 2023 and published 26 October 2023.
  - PDF SHA-256 `ef8dbe35…9a69`.
  - It was read in full. **Locators give its page numbers first. Equation numbers are the published ones, (1)–(36).**
- **[arXiv 2110.01638v2](https://arxiv.org/abs/2110.01638v2)**, 22 August 2023, 61 pages. Its comment reads: "Revised version after a referee report. Lemma 3.21 has a better proof following a suggestion of the referee, and the appendix on Kummer-irreducible points has been rewritten." v1 is dated 4 October 2021.
  - PDF SHA-256 `b48dad0a…3c4`; source SHA-256 `287a8f27…b6a`.
  - The TeX source (3469 lines) was read in full, and the statement and equation numbering was reconstructed from its environments.
  - Every statement was compared with the published text, and they agree. Locators give the arXiv v2 page second.
- The **[Corrigendum](https://doi.org/10.1017/fmp.2024.3)**, Forum Math. Pi 12 (2024), e5, corrects only the spelling of an affiliation ("Duisberg" to "Duisburg-Essen").
- **Crossref metadata** for the article: its only update relation is that Corrigendum.

All sources were accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

All nine are new, and every one is present in both arXiv v2 and the published article.

**The two errors:**

- **E7 (proof of Lemma 6.5, p. 48).** The proof constructs ψ(x) = σ(xϖ_F^{−v(x)})^a and then asserts "ψκ^{−1} ≡ 1 (mod ϖ)".
  - Since ψ(ϖ_F) = 1, ψκ^{−1}(ϖ_F) = κ(ϖ_F)^{−1}, which need not be ≡ 1. For example, take F = Q_p and κ unramified with κ(p) a Teichmüller lift of some λ ≠ 1; then ψ is trivial.
  - So "ψ lifting κ̄" does not follow as written. Twisting ψ by the unramified character with ϖ_F ↦ κ(ϖ_F) repairs it.
  - The lemma stands. Its use in Theorem 6.8 is unaffected. Reach: "the proof".
- **E9 (Lemma 3.30, Lemmas A.7–A.8, Proposition A.9).** The final numerical steps "≥ 1 + 2[F:Q_p]", "½d²[F:Q_p] ≥ 2" and "d[F:Q_p] ≥ 2" need d ≥ 2, but the paper allows d = 1.
  - For d = 1, the codimension of Y in X̄^gen = X̄^ps is 1 + [F:Q_p].
  - Every consequence drawn from these bounds still holds, since for d = 1 the loci involved are empty. Reach: "nothing".

**Misprints**, all with reach "nothing":

| Id | Where | Printed | Should be |
|---|---|---|---|
| E1 | proof of Lemma 3.1, p. 9 | D^u(t − a) = Σ_{i=0}^{n} (−1)^iΛ_i(a)t^{d−i} | Σ_{i=0}^{d}; n is the number of generators of E |
| E2 | §3.4, p. 19 | X^ps_j := R^ps_j | Spec R^ps_j |
| E3 | §3.6, p. 27 | ρ̄_i: G_F → GL_d(k) | GL_{d_i}(k) |
| E4 | proof of Proposition 3.48, p. 28 | U_max = X^ps ∖ {𝔪} ⊂ X̄^ps | ⊂ X^ps (the TeX has `\Xbar`) |
| E5 | §3.7, p. 31 | image of X^ps inside X^ps_Σ | image of X^ps_Σ inside X^ps |
| E6 | proof of Lemma 4.30, p. 42 | universal deformation ring of R_{ρ_x} | of ρ_x |
| E8 | proofs of Corollaries 3.38, 4.15, Lemmas 4.30, A.3 | "Corollary 3.23", "Proposition 3.37", "Lemma 4.29", "Proposition 3.24" | Lemma 3.23, Lemma 3.37, Corollary 4.29, Lemma 3.24 |

**Leads checked but not recorded:**

- **Not errors:**
  - Proposition 3.11's proof writes d_i d_j where d_{σ(i)}d_{σ(j)} is meant; the sum is the same.
  - The paper cites Böckle–Juschka's equidimensionality as Theorem 5.5.1(a) in Theorem 1.8 and as Theorem 5.4.1(a) in §§3.4 and 3.7. Which number is right was not checked against Böckle–Juschka.
- **Notational slips:**
  - k is used both for the residue field and for the number of twist classes (§3.2);
  - "to G" for "to G_F";
  - M_2(k) for M_2(κ);
  - "quotient quotient";
  - μ is reused for an unramified character in the proof of Lemma 6.4;
  - "a non-zero direct summand 𝒞_δ(K, L)" is missing "of" (proof of Lemma 6.7);
  - R_{det ρ} for R_{det ρ̄} (proof of Corollary 3.38);
  - a dangling `\label{univ_homeo}` after Lemma 5.3.
- **The proof of Lemma 3.18(5)** writes S'_q where S'_{q'} seems to be meant. The published PDF's text layer does not resolve the subscript, so this is not recorded.

## What the atlas and the libraries already have

**Libraries.** At the pinned commits neither Mathlib nor Tau Ceti has any of the following:

- complete-intersection or Cohen–Macaulay predicates, Serre's normality criterion, excellence or catenarity;
- determinant laws or Cayley–Hamilton algebras;
- GIT over a base;
- Galois deformation or pseudodeformation functors;
- local Galois cohomology with the Euler characteristic;
- patched modules.

The reviewed audit of R03.3 in `data/library-coverage.json` agrees for the commutative algebra.

Mathlib has:

- regular sequences (`RingTheory.Sequence.IsRegular`);
- `IsRegularLocalRing`, as a definition only;
- `IsJacobsonRing` with `RingHom.FiniteType.isJacobsonRing`;
- going-down for flat maps (`Algebra.HasGoingDown.of_flat`);
- `PolynomialLaw`, without multiplicative or determinant laws;
- `UniqueFactorizationMonoid`.

Tau Ceti has class formations, Kummer theory and Krull dimension of finite-type algebras over a field. None of these states an item, so **no item is `library`**. The library notions the paper uses are cited in the notes of the relevant items.

**The atlas.**

- **LocalGaloisDeformationRings.**
  - R08.1 plans framed representability, the tangent/obstruction description and "the effect of fixing the determinant". Items 005, 006 and 108 are planned there.
  - R08.3 plans Kisin's potentially semistable rings (item 132).
  - Nothing in L7–L8 or R08.2–R08.6 concerns the unrestricted ring's geometry.
- **DeformationAndDerivedPatchingAlgebra.** R03.3 plans regular sequences, CM rings and "the exact complete-intersection criteria used in patching" (item 007). R03.1 plans completed tensor products.
- **IntegralHeckeAndGaloisDeterminants.** IHG.0 plans determinant laws, and IHG.1 Cayley–Hamilton quotients and reconstruction (items 008, 010, 013). GlobalGaloisDeformations R04.1 plans "a separate determinant/pseudorepresentation deformation functor".
- **Tau Ceti ClassFieldTheory.**
  - Layer 5 plans local duality and the Euler characteristic for finite modules; ArithmeticGaloisDuality D7 plans them for compact coefficients (item 024).
  - Layer 7 plans the absolute local Artin map (item 076).
  - Tau Ceti ModularCurves Layer 4D plans regularity under completion (item 052).
- **Planned nowhere** (searched for "pseudodeformation", "Procesi", "Seshadri", "generic matri", "patched module", "Emerton", "definite unitary"):
  - the generic-matrices space;
  - GIT over a base;
  - Böckle–Juschka's equidimensionality;
  - local duality with coefficients in local fields of characteristic p;
  - every theorem of the paper;
  - the CEGGPS patched module for GL_d(F), and Emerton–Paškūnas's support theorem.
- **Related roadmaps that do not cover this material:**
  - LanglandsParameterStacks LP2/LP3 plan reductive invariant theory only for Weil-group parameters with ℓ ≠ p.
  - CompletedCohomologyAndLocalGlobalCompatibility R31.5 plans the patched completed module for GL_2 over Q.
- **Related extractions on main.**
  - Böckle–Harris–Khare–Thorne routed pseudocharacter theory to IHG.0/IHG.1 and invariant theory to LP2/LP3. This extraction does the same for Chenevier's determinants.
  - Paškūnas–Quast (PAPER-PASKUNAS-QUAST-26, issue #1344, not yet extracted) generalises this paper to generalised reductive groups. It should extend the first Part II below.

## Routes

**1. Source: DeformationAndDerivedPatchingAlgebra R03.1, R03.3** (items 028, 031–033, 049–051, 067, 087, 088, 098, 121, 136; planned 007, 052). These are the paper's general commutative algebra, none of it about Galois representations:

- dominant maps of Jacobson universally catenary schemes (Lemma 3.14);
- residue fields at coheight-one primes (Lemma 3.17);
- the Jacobson and dimension lemma over a punctured spectrum (Lemma 3.18, with the counterexamples of Remarks 3.19–3.20 as tests);
- completion after base change to κ(𝔭) or an O-Cohen ring (Lemmas 3.35–3.37);
- density under flat maps (Lemma 3.54);
- Serre's criterion, excellence and Grothendieck's parafactoriality theorem;
- the fibrewise flatness criterion (Matsumura 23.1);
- minimal primes of completed tensor products (CEGGPS A.2; Hu–Paškūnas A.1, A.5; BLGHT 3.3(5)).

R03.3 asks for exactly this kind of statement: "dimension formulas under the local maps actually used", and catenarity and excellence as hypotheses.

**2. Source: LocalGaloisDeformationRings R08.1** (items 046, 047, 056, 057, 075, 109–112; planned 108). These extend the unrestricted-ring layer in the direction it already names ("residue-field extension", "the effect of fixing the determinant"):

- the coefficient rings Λ for finite, p-adic and characteristic-p local residue fields, and the presentation over Λ (§3.5, Proposition 3.33, Remark 4.4);
- completions of R^□_ρ̄ at points of P_1 (Proposition 3.41, Corollary 3.42);
- the rank-one ring O[μ]⟦y_1, …, y_{[F:Q_p]+1}⟧ (Lemma 4.1);
- the twisting argument between R^{□,χ} and R^{□,ψ} (Proposition 5.1, Corollary 5.2, Lemma 5.3).

**3. Source: IntegralHeckeAndGaloisDeterminants IHG.1** (items 011, 012; planned 010). Two statements about Cayley–Hamilton algebras with no local Galois content:

- E is a finitely generated R^ps-module (Wang-Erickson);
- the generic-matrices algebra A^gen (Procesi; Lemma 3.1).

The Galois-specific Lemmas 3.2–3.4 stay in the Part II.

**4. Source: ArithmeticGaloisDuality D7** (item 025; planned 024). Local Tate duality and the Euler characteristic with coefficients in a local field of characteristic p (Böckle–Juschka Theorem 3.4.1). This is one more coefficient regime for D7's local duality.

**5. Source: PadicHodgeTheory R06.2** (item 139). Conrad's classification of crystalline characters (Proposition B.4). R06.2 plans D_cris, but no layer states this.

**6. Part II: "Local Galois deformation rings and their components, Part II: complete intersection, irreducible components and normality of unrestricted framed deformation rings in every dimension"** (`LocalGaloisDeformationRingsPartIIComponentsAndNormality`, area `langlands`, 96 items). It takes everything in §§2–5 and the appendix that is not a general input.

- **Content:**
  - GIT over a base;
  - the space X^gen;
  - the fibre bounds and the dimension count;
  - completions and complete intersection;
  - density of the irreducible loci and Kummer irreducibility;
  - components, normality and factoriality;
  - the pseudodeformation corollaries;
  - the fixed-determinant theorems.
- **Stated inputs from prerequisite papers:**
  - Seshadri's Theorem 3;
  - Wang-Erickson's adequate homeomorphism;
  - Böckle–Juschka's equidimensionality;
  - Chenevier's Q_2 and Böckle's Q_3 computations;
  - Paškūnas–Tung Theorem A.1.
- **Why a Part II.** LocalGaloisDeformationRings owns the local rings and their components, but it plans them only as needed by Kisin and Khare–Wintenberger. The geometry of the unrestricted ring in all dimensions is new layers in its direction, with the same consumers.
- **Imports** (named in the brief):
  - R08.1 and the R03.x, IHG.x and D7 sources above;
  - GlobalGaloisDeformations R04.1;
  - Tau Ceti ClassFieldTheory Layers 5 and 7;
  - ModularCurves Layer 4D;
  - LanglandsParameterStacks LP3, to be shared where its hypotheses allow.
- **Tests:**
  - d = 1;
  - trivial ρ̄ of dimension 2 (Example 3.22);
  - Remark 4.24's non-factorial ring O⟦x_1, …, x_9⟧/(x_1x_2 − x_3x_4);
  - the Q_3 exception.

**7. Part II: "Completed cohomology and p-adic local–global compatibility over Q, Part II: the patched module for GL_d over p-adic fields and Zariski density of potentially semistable points"** (`CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity`, area `langlands`, 14 items). It takes §6:

- the CEGGPS patched module and its properties;
- Emerton–Gee's potentially diagonalisable lifts, as a source-bound input;
- Emerton–Paškūnas's support theorem;
- the density of locally algebraic vectors (Dospinescu–Paškūnas–Schraen);
- the sets Σ;
- Lemmas 6.3–6.7 and Theorems 6.8 and 6.1.

Why here:

- **The CEGGPS module is R31.5's object generalised.** It is the generalisation to GL_d(F) of the "patched completed module" that R31.5 owns for GL_2 over Q. No layer plans it, since DeformationAndDerivedPatchingAlgebra R03.5 and P8 are abstract.
- **Not in route 6.** Route 6 is purely local, and this route imports it.
- **Not a new roadmap.** R31.5 already owns patched completed modules and their support.

## Judgement calls for the reviewer

- **Two Part IIs rather than one.** §6 could instead be the last layers of route 6, with CEGGPS and Emerton–Paškūnas stated as inputs. It is split off because the CEGGPS module is global infrastructure (definite unitary groups, Taylor–Wiles–Kisin patching) consumed well beyond this paper. Putting it in a local deformation-ring roadmap would make other consumers import from the wrong place.
- **The parent of route 7.** Route 7 extends a roadmap titled "over Q". If the reviewer prefers, it can be a `new` roadmap with the same brief. CompletedCohomologyPartII (completed homology of towers) is imported, not extended, because its summary leaves the local–global applications to R31.
- **Prerequisite theorems routed into the Part IIs.** These are routed there as stated inputs, rather than proposed as their own roadmaps:
  - Böckle–Juschka's equidimensionality (item 009);
  - the CEGGPS module (items 133–134);
  - Emerton–Gee (item 135);
  - Emerton–Paškūnas (item 145).

  Each is a whole paper. The briefs say that the design jobs state them exactly and depend on the prerequisite papers listed below.
- **Theorem 1.1's lifting statement is not planned by R08.1.** Existence of characteristic-zero lifts is also R03.4's subject ("extracting a characteristic-zero point"). Here it follows from R^□_ρ̄[1/p] ≠ 0, so it stays with Theorem 1.1 in route 6.
- **Proposition 4.3 goes to route 6, not R08.1.** Its presentation is R08.1-style, but the regularity of the sequence needs Theorem 1.1.

## Prerequisites not yet covered by the atlas

These are listed in the result with links and reasons:

- **Local theory:**
  - Böckle–Juschka (Forum Math. Sigma 2023; the foundation of §3);
  - Chenevier's determinants (2014);
  - Wang-Erickson (Math. Ann. 2018);
  - Procesi (1987);
  - Seshadri (1977);
  - Alper (2014).
- **Patching and density:**
  - Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin (2016);
  - Emerton–Paškūnas (2020);
  - Emerton–Gee (2023);
  - Dospinescu–Paškūnas–Schraen (2025);
  - the sequel, Böckle–Iyengar–Paškūnas, Zariski density of crystalline points (PNAS 2023).
- **Specific inputs:**
  - Paškūnas–Tung (2021);
  - Hu–Paškūnas (2019);
  - Böckle–Juschka's (p, p)-case paper (2015);
  - Böckle's Q_3 computation (2010);
  - Chenevier's unpublished note on the Q_p character variety (2010);
  - Conrad's lifting preprint (2011);
  - Call–Lyubeznik (1994);
  - Kisin (2003, Proposition 9.5).
