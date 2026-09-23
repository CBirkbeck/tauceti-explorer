# PAPER-EISCHEN-HARRIS-LI-ETAL-20: p-adic L-functions for unitary groups

Ellen Eischen, Michael Harris, Jianshu Li and Christopher Skinner, *p-adic L-functions for unitary groups*, [Forum of Mathematics, Pi 8 (2020), e9, 160 pages](https://doi.org/10.1017/fmp.2020.4); arXiv [1602.01776](https://arxiv.org/abs/1602.01776) (v5).

The extraction was done by Claude Code, session `cc-2aeb03`, on 23 September 2026 (issue #1400). It continues the first extraction by session `cc-d67081`. Status: **complete**. The machine-readable extraction is [PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json](PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json), and it contains:

- **458 items:** 182 definitions, 64 constructions and 212 theorems. Of these, 1 is in the libraries, 417 are planned and 40 are missing.
- **1 route:** all 40 missing items go to a Part II of *Automorphic L-functions and local factors*. It is the same Part II that the Cai–Friedberg–Kaplan extraction proposes for the doubling method.
- **40 prerequisite papers** that the atlas does not yet cover.
- **160 mistakes in the paper** (`sourceIssues`): 101 misprints, 27 errors and 32 gaps. 30 of them reach a stated result and 12 reach a proof. None has been corrected in print.

**Source.** I read the whole paper in arXiv v5 (6 March 2020, 152 pages, SHA-256 `881a496a…b9569`), the version accepted by the journal, on rendered page images. This covered every statement and every proof. I consulted v1–v4 wherever a mistake is recorded, to date it. The published article is CC-BY, but `www.cambridge.org` returned HTTP 404 or an HTML page for the PDF on 23 September 2026, so **all locators are to v5**.

## What the paper proves

Let 𝒦/𝒦⁺ be a CM field, V a hermitian space over 𝒦, p a prime unramified in 𝒦 with every place above p in 𝒦⁺ split, and π a cuspidal anti-holomorphic automorphic representation of U(V). Assume π is ordinary of type (κ, K) at p (in the paper's language, anti-ordinary). Let 𝕋_π be the localization of Hida's big ordinary Hecke algebra at π.

**Main Theorem 9.2.2** assumes three hypotheses:

- the **Gorenstein hypothesis 7.3.2**: 𝕋_π is Gorenstein and the dual of the ordinary forms is free over it;
- the **global multiplicity one hypothesis 7.3.3**;
- the **minimality hypothesis 7.3.5**.

Under these, there is a unique element L(Eis, φ ⊗ φ^♭) of Λ_{X_p,R} ⊗̂ 𝕋_π whose specialization at every classical point (χ, λ_{π′}) is

> c(π′, χ) · Ω_{π′,χ}(φ, φ^♭) · I_∞ · I_S · L_p(·, ord, π′, χ_u) · L^S(m + 1/2, π′, χ_u) / P_{π′,χ}.

The factors are:

- **L^S(m + 1/2, π′, χ_u):** a critical value of the standard L-function of U(V) × GL(1)_𝒦.
- **P_{π′,χ}:** a normalized Petersson period.
- **c(π′, χ):** a generator of the congruence ideal of π′.
- **L_p(·, ord, …):** the p-adic Euler factor. It is a ratio of L- and ε-factors of the GL-pieces of π_w at the places above p.
- **I_∞:** the archimedean zeta integral. It is proved nonzero but is not evaluated.
- **I_S:** volume and Euler factors at the remaining bad places.

When n = 1 this recovers Katz's p-adic L-functions of CM fields.

**The method** is the doubling method of Garrett and Piatetski-Shapiro–Rallis. Set W = V ⊕ (−V). The Siegel Eisenstein series of U(W), built from the degenerate principal series I(χ, s), is restricted to U(V) × U(−V) and paired with π ⊗ π^♭. The resulting integral unfolds into an Euler product of local zeta integrals. The paper's own contributions are:

- **Part II (§4): the local zeta integrals.**
  - The unramified and ramified computations are in §4.2.
  - Above all, the calculation at p is in §4.3. Siegel–Weil sections are built from partial Fourier transforms, and (anti-)ordinary test vectors are chosen. Theorem 4.3.10 then identifies the integral with two Godement–Jacquet integrals, and the Godement–Jacquet functional equation produces the denominator of the Euler factor.
  - The archimedean integral is shown nonzero in Proposition 4.5.5.
  - Theorem 4.6.1 assembles these into the global formula.
- **Part III (§§5–9): the formalism.** Section 7 turns any measure satisfying the axioms of Definition 5.3.2 into an element of Λ ⊗̂ 𝕋_π. It does this through Hida's control theorems (7.1.1, 7.2.1, 7.3.1), the three hypotheses, and Serre duality between holomorphic and anti-holomorphic forms (§6). Section 8 checks that Eischen's Eisenstein measure (Theorem 8.2.2, Corollary 8.2.4) satisfies these axioms, and develops the local theory of ordinary and anti-ordinary vectors. Section 9 pairs the measure with the family.

**What it does not settle (§§1.1.2, 9.3).**

- The archimedean factor is known only in special cases:
  - scalar weight (Shimura);
  - weight half-scalar at every place (Garrett);
  - general vector weight, only in later work of Eischen and Liu (J. reine angew. Math. 2024).
- The Gorenstein hypothesis is not automatic. Atanasov and Harris later showed that it holds rather generally ("The Taylor–Wiles method for coherent cohomology II", Amer. J. Math. 147 (2025), per its zbMATH summary).
- Multiplicity one follows from Mok and from Kaletha–Minguez–Shin–White when the base change of π to GL(n) is cuspidal.
- The comparison with the Coates–Perrin-Riou conjectures is not attempted.

## What the libraries and the atlas have

**The libraries.** One item is in the libraries: the definition of M-valued measures on a compact totally disconnected space (§5.1). This is Mathlib's `AbstractMeasure X R E := C(X, R) →L[R] E` (Mathlib/NumberTheory/Padics/Measure/Basic.lean at 082e2d3), with Dirac measures, pushforward and product measures. The reviewed library audit records the same, under PadicMeasuresIwasawaAlgebras L0. Neither library has anything else in the paper. The nearest declarations are recorded in the notes of the items that would use them:

- `Matrix.unitaryGroup`: only the standard form, not a hermitian space over a CM field;
- `NumberField.IdeleClassGroup` and the adele rings;
- Mathlib's abstract Hecke rings (`HeckeRing`, `IsHeckeTriple`);
- the Amice transform on ℤ_p;
- Tau Ceti's `AbelianVariety`.

The libraries have no PEL data or Shimura varieties, no automorphic forms or Hecke characters, no completed group rings, no Gorenstein rings and no Serre duality in higher dimension.

**The atlas plans this paper by name.** `AutomorphicPadicLFunctions:L4`, "Ordinary unitary groups and the doubling method", asks for EHLS "in the exact setting of EHLS". It covers:

- the unitary Shimura varieties, bundles, compactifications and Igusa towers;
- the ordinary Hecke modules, pairings, differential operators and Eisenstein measures;
- the doubling embedding and "the global zeta integral identity from local integrals, including ramified and p-adic local calculations";
- Main Theorem 9.2.2, with Hypotheses 7.3.2, 7.3.3 and 7.3.5 kept visible.

So 341 of the 417 planned items are planned at L4. The other 76 are planned only at the layers L4 imports from, and some L4 items are also planned there (counts are items, an item may name several layers):

- **PELModuli M0–M5** (22 items): PEL data, the moduli functor, representability, the ker¹ decomposition, the unitary example.
- **ShimuraCompactifications C3–C5** (11): Lan's compactifications and their refinements.
- **AutomorphicBundles B1–B5** (18): the automorphic sheaves ω_κ, Köcher's principle, Hecke operators away from p.
- **PadicMeasuresIwasawaAlgebras L0–L1**, **PadicFamilies L0a and L1** (13): measures, completed group rings, the ordinary projector, congruence modules.
- **AutomorphicPadicLFunctions L0 and L3** (8): the ray class tower X_p, Katz's differential operators.
- **AutomorphicLFunctionsAndLocalFactors AL.2 and AL.4** (5): the Godement–Jacquet functional equation, local factors, the unramified Euler polynomial.
- **SmoothRepresentationsOfLocalGroups SR.2–SR.3** (6): induction, Frobenius reciprocity, Jacquet modules, contragredients.
- **AdelicAlgebraicGroups AA.2** and **AutomorphicFormsOnReductiveGroups AF.1, AF.2, AF.4** (9): measure normalizations, automorphic representations and their factorization.
- **ModularityAndLanglandsExtensions ML.4** and **EndoscopicTransferAndUnitaryTraceComparison ET.7a** (5): Mok and KMSW multiplicity one, base change.
- A few items each at ShimuraData D2 and D4, ShimuraVarieties V1 and V8, AbelianSchemesAndArithmeticModuli A4, ReductiveGroupsPartII RG2.3, PeriodsAndSpecialValues PS.1, and Tau Ceti's GlobalNumberFields (infinity types) and ClassicalGroups (highest weights).

**A lead for the maintainer.** No decomposition of AutomorphicPadicLFunctions exists yet, and L4 carries 341 items of this paper. Those items span moduli, p-adic modular forms, the local theory at p, Hida theory in families and the construction itself. L4 is a whole roadmap's worth of layers, and its blueprint job will need to divide it (PROTOCOL.md section 14). That is a restructuring question about the atlas, not something this extraction can change.

## The route: the doubling Part II

The 40 missing items are the general machinery of the doubling method that L4 applies. No layer of the atlas plans any of it:

- **The Siegel parabolic and its Eisenstein series:** the doubled space and the Siegel parabolic; the degenerate principal series I(χ, s) and the Godement sections f^Φ; the Siegel Eisenstein series and its meromorphic continuation.
- **The global doubling identity:** the doubling integral, its unfolding along the open orbit, and its vanishing unless π^♭ ≅ π^∨; the factorization (51).
- **The unramified computation:** the unramified computation and the normalizing factor d_{n,v}.
- **The Garrett map:** the Garrett map with Theorem 9.1.3, and the Mœglin–Vignéras–Waldspurger involution that makes it land in π.
- **Consequences for L(s, π, χ):** the continuation and functional equation of L(s, π, χ).
- **The archimedean local theory (§§4.4–4.5):**
  - holomorphic and anti-holomorphic modules, and canonical automorphy factors;
  - the module D²(χ_σ) and its branching;
  - the GL(u) × GL(u) invariant theory of Lemma 4.4.8;
  - the archimedean section, and the non-vanishing and algebraicity of the archimedean integral (Propositions 4.5.5 and 4.5.6).

AutomorphicSpectralTheory AS.1–AS.2 plans Eisenstein series induced from cuspidal data. The Siegel series is induced from a character of GL_n, so it is not covered there.

**Why it is a Part II of *Automorphic L-functions and local factors*.** Part I of that roadmap stops exactly short of this material. It covers L-, ε- and γ-factors for GL_1, GL_n and GL_n × GL_m, and the unramified Euler polynomial. It explicitly disclaims continuation and functional equations for other groups.

**Why it shares the Cai–Friedberg–Kaplan roadmap id.** PAPER-CAI-FRIEDBERG-KAPLAN-24 already routes the *generalized* doubling method of Cai, Friedberg, Ginzburg and Kaplan to a Part II of the same roadmap, `AutomorphicLFunctionsAndLocalFactorsPartIIDoubling`. The first extraction of this paper proposed a second, separate Part II (`…PartIIDoublingForUnitaryGroups`). That would plan the doubling method twice, contrary to PROTOCOL.md section 15. So this route uses the same roadmap id, and its brief:

- says that it is the same Part II;
- adds the classical doubling method for unitary groups as EHLS uses it;
- asks the design job to cover both briefs in one roadmap.

**The boundary with L4.** EHLS's specific choices stay with L4, which imports the Part II. These are:

- the ramified sections and Lemma 4.2.3;
- the Siegel–Weil sections at p, the (anti-)ordinary test vectors and Theorem 4.3.10;
- the global formula (Theorem 4.6.1);
- the Eisenstein measure and everything p-adic.

This differs from the first extraction in three places. There, the Siegel–Weil sections at p, the (anti-)ordinary test vectors and the local factor at p were missing. They are now planned at L4, because L4 asks in so many words for "ramified and p-adic local calculations". Three other extractions already read L4 the same way: Li–Liu 2021, Disegni–Liu and Ichino–Prasanna.

**One overlap outside this file.** PAPER-LI-LIU-22 routes the unitary doubling zeta integrals to the Part II `UnitaryArithmeticInnerProductFormula` of Gross–Zagier formulas. That is the same local theory. The brief says it belongs in the doubling Part II and should be imported there. The maintainer should reconcile the two routes when both are accepted.

## Mistakes in the paper

I read every proof line by line. Every claimed error, and every claimed mistake reaching a proof or a stated result (61 in all), was then checked a second time, independently and adversarially, at its locator on the page image. Of those 61, 52 were confirmed, 8 reclassified and 1 rejected. The rejected one is not recorded.

I searched for existing corrections in:

- Crossref;
- the Cambridge Core article page;
- Harris's annotated errata list (December 2021);
- zbMATH;
- later work that builds on the paper: Marcil 2023, Eischen–Liu, Z. Liu, Wan, and Eischen–Fintzen–Mantovan–Varma.

No correction exists, so every mistake is recorded as new. Almost all of them are already present in v4; the few introduced in v4 or v5 are dated in their entries. The ones that matter most:

**The local theory at p, on which the p-adic factor of the Main Theorem rests.**

- **E52 (error).** The Schwartz function (58) defines the section at p. It is given in the polarization coordinates W = V_d ⊕ V^d as Φ₁(−X₁)Φ₂(2X₂). On p. 59 it is evaluated as Φ₁(Y₁)Φ₂(Y₂) in the coordinates W = V ⊕ V. In those coordinates it is actually Φ₁((Y₂ − Y₁)/2)Φ₂(Y₁ + Y₂).
  - So Theorem 4.3.10 computes the zeta integral of a *translate* of the section the paper defines.
  - In a ramified case with n = 1, the section as defined has zeta integral 0, while the theorem gives a nonzero ε-factor. In an unramified case the two integrals differ by an extra pole; this was checked by exact enumeration.
  - v1 put the change-of-basis matrix into the translation explicitly; v2 dropped it.
  - Whether the Main Theorem's p-adic factor is affected depends on which section the Eisenstein measure of [Eis15] is built from. The paper does not say.
- **E57 (error).** In Theorem 4.3.10, I₂ is off by the sign ω_{π_a ⊗ χ₁}(−1).
- **E58 (error).** (83) counts the local pairing ⟨φ_w, φ̃_w⟩ twice. By (51), I_w = Z_w/⟨φ_w, φ̃_w⟩.
  - This carries into Theorem 4.6.1 and Corollaries 9.1.8 and 9.2.1. As printed, these depend on the auxiliary level r.
  - The Main Theorem has the right form.
- **E73.** The p-adic factor should be L_p(s + 1/2, ord), not L_p(s, ord), in both Theorem 4.6.1 and the Main Theorem.
- **E74 (error).** Theorem 4.6.1 holds only at s = m, and it mishandles the places above p. D(χ) includes D_v for v | p, and L^S keeps the Euler factors at p.
- **E53 (error).** The pointwise factorization (77) in Proposition 4.3.7 is false as stated. Corollary 4.3.8 survives.
- **E60 (error).** Remark 4.3.12's volume identity is not independent of r.
- **E41 (error).** Under the paper's own normalization of I(χ, s), the unramified identity holds with χ_v^{−1} in place of χ_v.
- **E42 (gap).** Lemma 4.2.3's value at the ramified places needs L_v smaller than the paper requires.
- **E44 (gap).** Inequality (56) must also bound the conductor of χ at the conjugate place.

**Hecke algebras and families.**

- **E106 (error).** Theorem 6.6.9 needs π_p irreducible and κ satisfying (166).
- **E110 (error).** The pairing of Lemma 6.6.12(iii) is not perfect. Its image is the congruence ideal, as Lemma 7.5.2 itself shows.
- **E117 (error).** The control theorems 7.2.1(ii) and 7.3.1(ii) are misstated at level r > 1.
- **E115 (error).** Theorem 7.1.1 omits "sufficiently regular".
- **E119 (gap).** Proposition 7.3.5 is proved only for regular weights.
- **E103 (error).** In Lemma 6.6.5(ii), eigenspace and generalized eigenspace are confused.
- **E149 (misprint).** §6.7 drops the superscript 0 in the volumes. This changes the periods by a power of p.
- **E112 (misprint).** In Lemma 6.7.6, the twist by χ is missing.
- **E113 (gap).** The independence of C(π, χ) from χ is asserted without proof.

**The measure and the Main Theorem.**

- **E130 (gap).** Theorem 8.2.2, the Eisenstein measure, is not proved. The paper points to a "similar" result of Eischen–Fintzen–Mantovan–Varma, and the sections at p are not matched with it.
- **E132 (gap).** The proof of Corollary 8.2.4 checks only part of Definition 5.3.2.
- **E85 (error).** (113) drops the archimedean scalar B(χ_σ, κ_σ).
- **E82 (gap).** Normalizing by the Euler factors at S can give a pseudo-measure rather than a measure.
- **E155 (gap).** The Main Theorem omits conditions under which it is proved: m ≥ n, κ¹ sufficiently regular, and (χ, ψρ^υ) ∈ Y^class_H.

**Foundations.**

- **E9 (gap).** The positivity condition on δ that makes the unitary PEL datum of §2.3 a PEL datum is never stated.
- **E32 (gap).** p must be odd in §2.10.2.
- **E89 (error).** The canonical-bundle characters of §6.1.3 have exponents ±2a_σ where ±a_σ is right.
- **E22 (error).** The property claimed for the U_p-elements t⁺ is false. t⁺ contracts N⁺; it does not normalize the Iwahori.
- **E31 (error).** "Frac(O⁺) is a number field" is false as defined.

## Prerequisites not yet covered

None of the papers EHLS rests on is in the paper registry. The list in the result file has 40 entries, each with its DOI or a stable URL, checked on Crossref or zbMATH:

- **Earlier parts of the project and their inputs:** Harris–Li–Skinner (2005, 2006); Eischen's Eisenstein measures and p-adic differential operators (2012, 2014, 2015, 2016); Eischen–Fintzen–Mantovan–Varma; Caraiani–Eischen–Fintzen–Mantovan–Varma.
- **The geometric inputs:** Katz (1978); Hida's control theorems and his book; Hida (1998); Lan's compactifications (2012, 2013, 2016, 2018); Kottwitz (1992); Wedhorn (1999); Moonen (2004); Harris on functorial toroidal compactifications, ∂̄-cohomology and arithmetic vector bundles.
- **The doubling method:** Garrett (1984); Piatetski-Shapiro–Rallis; Li (1992); Jacquet (1979); Mœglin–Vignéras–Waldspurger; Harris (1997, 2008); Shimura; Garrett (2008); Z. Liu.
- **The hypotheses:** Mok; Kaletha–Minguez–Shin–White; Labesse; Harris's Taylor–Wiles method for coherent cohomology.
- **The conjectural framework:** Coates–Perrin-Riou; Panchishkin.

## Judgement calls for the reviewer

1. **The planned/missing line follows L4's wording.** L4 plans the p-adic and ramified local calculations, so these are planned there: §4.3 in full (sections, test vectors, Theorem 4.3.10) and Lemma 4.2.3. The general doubling identity, the unramified computation and the archimedean theory are routed. A reviewer who reads "from local integrals" in L4 as covering the archimedean integral too could move the §4.4–4.5 items to planned at L4. The brief would then drop its archimedean part.
2. **One Part II, shared with Cai–Friedberg–Kaplan.** The alternative is a separate Part II for unitary groups, which the first extraction proposed. It would duplicate the doubling method.
3. **Items not extracted.**
   - Pure notation: Remark 1.4.2, the list of embeddings, Z(1), the places above p, the convention on sheaves over towers.
   - Three conjectural expectations the paper neither uses nor proves: that c(π) specializes a p-adic adjoint L-function (§1.1.2, Remark 6.7.12), and Remark 9.3.5.
   - The introduction's restatements of the §4.1 objects are merged into the §4.1 items.
4. **Two mistakes affect the stated Main Theorem only through a normalization:** E73 and E155. E52 is the one whose effect on the Main Theorem cannot be settled from this paper alone.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the changed files: 0 problems.
- Every missing item is routed exactly once.
- Every planned layer id exists in data/atlas.json.
- The library claim was read in the source file at Mathlib 082e2d3. The library survey used the pinned declaration index, and the reviewed audit (data/library-coverage.json) of every layer cited was read.
- Lean: none. Nothing here is formalised, and no Lean file was written or built.
