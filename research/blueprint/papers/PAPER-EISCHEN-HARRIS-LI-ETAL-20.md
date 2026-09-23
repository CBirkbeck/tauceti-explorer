# PAPER-EISCHEN-HARRIS-LI-ETAL-20: p-adic L-functions for unitary groups

Ellen Eischen, Michael Harris, Jianshu Li and Christopher Skinner, *p-adic L-functions for unitary groups*, [Forum of Mathematics, Pi 8 (2020), e9, 160 pages](https://doi.org/10.1017/fmp.2020.4); arXiv [1602.01776](https://arxiv.org/abs/1602.01776) (v5).

Extraction by Claude Code, session `cc-d67081`, 23 September 2026 (issue #1400). Status: **partial** — the main results and the principal definitions are items; the remaining numbered statements are listed in the handoff. Every missing item is routed exactly once. The machine-readable extraction is [PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json](PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json):

- 56 items: 0 in the libraries, 43 planned, 13 missing;
- 1 route: a Part II of Automorphic L-functions and local factors;
- 15 prerequisite entries;
- no `sourceIssues` field, because the proofs were not read.

**Source.** arXiv v5 (6 March 2020, 152 pages, SHA-256 `881a496a…b9569`), the accepted version, read on 2026-09-23. The published article is **CC-BY**, but `www.cambridge.org` returned HTML rather than the PDF to every request made here — the article page is JS-driven and carries no `citation_pdf_url` — so the journal's text was not read and its 160-page pagination is not used. **All locators are to v5.**

## What the paper proves

Let K/F be a CM field with F totally real, V a hermitian space over K, and π a cuspidal anti-holomorphic automorphic representation of U(V), ordinary of type (κ, K), with T_π the corresponding connected component of Hida's ordinary Hecke algebra.

**Main Theorem 9.2.2.** Under three hypotheses on that component — **Gorenstein** (7.3.2), **global multiplicity one** (7.3.3) and **minimality** (7.3.5) — there is a unique element L(Eis, φ ⊗ φ^♭) ∈ Λ_{X_p,R} ⊗̂ T_π whose specialization at each classical point (χ, λ_{π′}) is

> c(π′, χ) · Ω_{π′,χ}(φ, φ^♭) · I_∞(χ, κ_1) · I_S · L_p(m, ord, π′, χ_u) · L^S(m + 1/2, π′, χ_u)/P_{π′,χ},

with Ω_{π′,χ} independent of the level, p-integral, and a p-unit for suitable φ, φ^♭. This is the automorphic form of the interpolation property (2) of the introduction, and completes the project begun in Harris–Li–Skinner (2006).

**The method.** With W = V ⊕ (−V), U(W) has a maximal parabolic P with Levi GL(n)_K; a Hecke character χ gives the degenerate principal series I(χ, s) and the Siegel Eisenstein series E(χ, s, f, g). The doubling method says that the integral of E against φ ∈ π on U(V) and φ′ on U(−V) vanishes unless φ′ ∈ π^∨, and otherwise factors into an Euler product whose unramified terms give L(s + 1/2, π, χ). Equivalently the **Garrett map** carries π on U(V) to π on U(−V), and Theorem 9.1.3 shows it preserves π.

**The two contributions.**

- **Part II (§4), the local zeta integrals.** Theorem 4.3.10 computes the integral at a place w | p: after Proposition 4.3.7 restricts the support of the product of Siegel–Weil sections and Corollary 4.3.8 factors the integral, the two factors are Godement–Jacquet integrals, and the Godement–Jacquet local functional equation turns them into an explicit ratio of L- and ε-factors times a volume and a local inner product. The denominator of the local factor arises exactly from that functional equation — the step the authors say owes the most to adelic representation theory. Theorem 4.6.1 assembles all the local factors into the global identity. The archimedean factor is shown nonzero (Proposition 4.5.5) but is **not evaluated**.
- **Part III (§7), the formalism.** Theorems 7.1.1, 7.2.1 and 7.3.1 give the independence of the weight and the control theorems for the ordinary Hecke algebras, and Proposition 7.4.13 attaches an **abstract p-adic L-function** to any measure satisfying stated axioms. Section 8 then constructs the Eisenstein measure (Theorem 8.2.2) and verifies the axioms (Corollary 8.2.4), and §9 pairs the two.

**What it does not settle (§9.3).** The Gorenstein hypothesis is not valid in general — it can often be checked by Taylor–Wiles methods, and can be avoided by passing to the fraction fields of the irreducible components; the multiplicity one hypothesis follows from Mok and Kaletha–Minguez–Shin–White when the base change to GL(n) is cuspidal, and §9.3 sketches its removal; and the archimedean zeta integral is known only for scalar weight (Shimura) and half-scalar weight (Garrett).

## What the libraries and the atlas already have

**The libraries have nothing of this.** There are no library items. Neither Mathlib at 082e2d3 nor Tau Ceti at f790474 has unitary groups of hermitian spaces over a CM field, PEL data, Shimura varieties, automorphic forms, Hecke algebras acting on them, Igusa towers, or measures valued in p-adic modular forms. The nearest things, recorded as notes on the items that would need them, are Mathlib's abstract Hecke rings of a Hecke pair (`HeckeRing`, `HeckeCoset`, Mathlib/NumberTheory/HeckeRing/Defs.lean), its matrix unitary group `Matrix.unitaryGroup` of a ⋆-ring, its classical Eisenstein series for SL₂(**Z**), and Tau Ceti's abelian varieties with their endomorphisms, homomorphisms, isogenies and tangent spaces.

**The atlas, by contrast, plans this paper by name.** `AutomorphicPadicLFunctions:L4`, "Ordinary unitary groups and the doubling method", asks for the PEL/unitary Shimura varieties, automorphic bundles, integral toroidal compactifications and ordinary Igusa towers "in the exact setting of EHLS", the ordinary Hecke modules, pairings, differential operators and Eisenstein measures, the doubling embedding and the global zeta integral identity from local integrals including the ramified and p-adic calculations, and **EHLS Main Theorem 9.2.2 itself**, with Hypotheses 7.3.2, 7.3.3 and Proposition-Hypothesis 7.3.5 "kept visible".

So 43 of the 56 items are planned: at L4, and at the stages L4 imports from — `PELModuli` M0, M1 and M5 (PEL data, the moduli functor, a unitary CM example), `ShimuraCompactifications` C4–C5 (the Lan compactifications), `AutomorphicBundles` B2–B4 (ω^κ, canonical extensions, the unitary Hodge summands), `PadicFamilies` L0a and L0 (the profinite ordinary projector, control), `PadicMeasuresIwasawaAlgebras` L0 (bounded measures on a profinite set), `AutomorphicPadicLFunctions` L0 and L3 (ray-class character spaces, Katz, CM periods, differential operators) and `AutomorphicLFunctionsAndLocalFactors` AL.2 and AL.4 (the Godement–Jacquet local functional equation for GL_n, the unramified Euler polynomial).

No decomposition file exists for `AutomorphicPadicLFunctions`, so L4 is entirely un-decomposed: the plan exists, the proof graph does not.

## Routes

**A Part II: `AutomorphicLFunctionsAndLocalFactorsPartIIDoublingForUnitaryGroups` (13 items).** Title: "Automorphic L-functions and local factors, Part II: the doubling method and the standard L-function of a unitary group"; area `automorphic`.

The thirteen missing items are exactly the representation-theoretic machinery the doubling method rests on, and a search of the atlas finds no stage naming any of it: the degenerate principal series I(χ, s), the Siegel–Weil sections, the Siegel Eisenstein series, the doubling integral and the Garrett map with Theorem 9.1.3, the doubling method itself (vanishing off π^∨ and the Euler factorization), the unramified local computation, the (anti-)ordinary test vectors at p, the holomorphic and anti-holomorphic modules with Corollary 4.4.9, the archimedean non-vanishing 4.5.5, the local L- and ε-factors in which Theorem 4.3.10 is expressed, and the continuation and functional equation of L(s, π, χ).

It is a Part II of `AutomorphicLFunctionsAndLocalFactors` rather than a new roadmap because this is precisely Part I's declared boundary: AL.1–AL.3 give L-, ε- and γ-factors and local functional equations for GL₁, GL_n and GL_n × GL_m; AL.4 gives the unramified Euler polynomial for a representation of an L-group; and the roadmap states that it does not assert meromorphic continuation or a functional equation for a general reductive group and a general r. The Part II supplies exactly that for U(V) × GL(1)_K, and `AutomorphicPadicLFunctions:L4` becomes its consumer. The brief keeps the division sharp: L4 owns the doubling embedding of Shimura varieties and the global zeta integral identity in the p-adic setting; the Part II owns the doubling identity as representation theory and the local factors. It also forbids claiming an evaluation of the archimedean integral, which EHLS leaves open.

A reviewer might instead prefer a new roadmap for the doubling method, on the ground that it is a method rather than a family of local factors; the brief is written so that it could be lifted out unchanged.

## Prerequisites not yet covered

**The project's own earlier parts:** Harris–Li–Skinner (2006), and Eischen's Eisenstein measure and p-adic differential operators.

**The models and the machinery:** Katz's p-adic L-functions for CM fields; Hida's control theorems for coherent sheaves on PEL Shimura varieties, his book on p-adic automorphic forms (Chapter 8), and his Asian J. Math. paper behind Theorem 6.6.9; Lan's arithmetic compactifications.

**The doubling method and its local factors:** Piatetski-Shapiro–Rallis; Jacquet's principal L-functions, for the Godement–Jacquet functional equation; Shimura's *Euler Products and Eisenstein Series* and Garrett's archimedean zeta integrals, the only cases where the archimedean factor is known.

**The hypotheses:** Mok and Kaletha–Minguez–Shin–White for multiplicity one; Harris's Taylor–Wiles method for coherent cohomology for the Gorenstein hypothesis.

Every DOI was resolved on Crossref; Kaletha–Minguez–Shin–White links to arXiv, and Hida's book links to its Chapter 8, the volume having no separate Crossref DOI.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 3 files, 0 problems.
- Lean: none. Nothing here is formalised, and no Lean file was written or built.
- The library survey was run against the declaration index of the pinned commits, Mathlib 082e2d3 and Tau Ceti f790474; the four declarations cited in notes were read there.
- The atlas was surveyed across all roadmaps, stages and the 51 decomposition files before concluding that L4 plans the construction and that nothing plans the doubling machinery.
- Every prerequisite DOI was resolved on Crossref.
- The published version could not be fetched (see **Source**); the version, hash and page count recorded are those of the arXiv file actually read.
