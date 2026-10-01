# RT-PAPER-BOCKLE-IYENGAR-PASKUNAS-23

Codex, session `codex-rtOQ9t`, 1 October 2026. Refs #4236.

The audit is complete with **five findings: two high and three medium**. The two high findings are false statements copied from the published paper. They require corrections in the extraction and additional version-scoped source-issue records. They do not invalidate the paper’s main deformation-ring theorems.

The extraction and accepted review were written by Claude Code sessions `cc-442dc5` and `cc-fb70e5`. This session did neither. The repository base audited was `6613ed8d1e3731718da1f17704005a40a21e6f0d`.

## Sources and scope

I read the complete [published article](https://doi.org/10.1017/fmp.2023.25), Gebhard Böckle, Ashwin Iyengar and Vytautas Paškūnas, *On local Galois deformation rings*, Forum of Mathematics, Pi 11 (2023), e30, pp. 1–54, including proofs and references. Page numbers below are the published page numbers. Pages 8 and 24 were also rendered and inspected visually. The source is distributed under CC BY 4.0.

I read the complete [2024 corrigendum](https://doi.org/10.1017/fmp.2024.3); it only corrects the university affiliation. For the completion finding, I also read pp. 16–19 of [Böckle–Juschka, *Equidimensionality of universal pseudodeformation rings in characteristic p for absolute Galois groups of p-adic fields*](https://doi.org/10.1017/fms.2023.82), including Corollary 3.3.4 and Lemma 3.3.5 with their proofs. I did not audit that entire supplier paper.

The result JSON records URLs, read date and SHA-256 hashes. Cambridge stamps downloads, so the hashes need not reproduce those in the original extraction. I checked the [arXiv version history](https://arxiv.org/abs/2110.01638) and [Iyengar’s publication list](https://ashwiniyengar.github.io/papers/), together with title/erratum and Lemma-3.35 searches. The latest listed arXiv version is v2, 22 August 2023. Those searches found no mathematical correction to the two passages below. I have not claimed a fresh line-by-line comparison with the arXiv PDF or source: these findings are against the version of record actually read.

All 148 extraction items, seven routes, briefs, prerequisites, nine sourceIssues and accepted review were read. The already recorded E1–E9 corrections are not new findings here. The report’s opening count of 147 predates the review’s addition of item 148; the actual inventory used for this audit has 148 items, 137 missing and 11 planned.

## 1. A geometric fibre is not closed in the original scheme — high

**Target:** item `/001`, with the GIT portion of route 6.

Between Lemmas 2.1 and 2.2 on p. 8 the source says:

> We may identify the fibre X_y with a closed G-invariant subscheme of X.

The item repeats this for an arbitrary geometric point `y = Spec κ` of `X//G`.

Take an algebraically closed field `k`, `S = Spec k`, `X = A¹_k`, and the trivial action of the reductive group `G_m`. Its quotient is `X` itself. Take the geometric generic point with field `κ = overline{k(t)}`. Then `X_y = Spec κ`, and its projection to `X` has image the generic point. That image is not closed, so the projection cannot be a closed immersion.

The correct ambient scheme is `X ×_S Spec κ`. The geometric point determines a **κ-rational closed point** of `(X//G) ×_S Spec κ`; its inverse image is a closed `G_κ`-invariant subscheme of `X ×_S Spec κ`.

Correct `/001` and use this base-changed action in the application of Lemma 2.1. Lemma 2.2’s tangent bound is preserved: the irreducible components are closed in the geometric fibre, and its closed-orbit argument takes place over κ. Record the source sentence and this correction in `sourceIssues`, scoped to published p. 8. This is high severity because the extracted assertion, literally stated, is false.

## 2. Lemma 3.35 needs a finite residue-field extension — high

**Target:** item `/049`, route 1 and its reader explanation.

The published Lemma 3.35 on p. 24 assumes that `R` is a complete local Noetherian `k`-algebra with residue field `k`, `A` is a finitely generated `R`-algebra, and `𝔭 ∩ R` has coheight one. It claims

`completion((κ(𝔭) ⊗_k A)_𝔮) ≅ completion(A_𝔭)[[T]]`,

where `𝔮` is the diagonal residue kernel. The proof infers that `κ(𝔭)` is finite over `κ(𝔭 ∩ R)` from finite generation of the algebra. That inference needs the point to be closed in the fibre.

An explicit counterexample satisfies all of the printed hypotheses:

- `k = F_p`, `R = k[[t]]`, `A = R[x]`, `𝔭 = (0)`;
- `dim R/(𝔭 ∩ R) = 1`;
- `K = κ(𝔭) = k((t))(x)`, a transcendental extension of `k((t))`;
- `A_𝔭 = K`, so the asserted right-hand side is `K[[T]]`.

To distinguish the completed rings, put `B = K ⊗_k A`, and let `μ : B → K` be multiplication. The derivations

`D_t(a ⊗ f) = a · ∂f/∂t`, `D_x(a ⊗ f) = a · ∂f/∂x`

are `K`-linear derivations at μ. Differentiation in `t` is the usual formal derivative on `k[[t]]`, and differentiation in `x` is the polynomial derivative. They extend through localization at `𝔮 = ker μ` and annihilate `𝔮²`. On

`u = 1 ⊗ t − t ⊗ 1`, `v = 1 ⊗ x − x ⊗ 1`,

their values are respectively `(1,0)` and `(0,1)`. The maps to the dual numbers factor through the second infinitesimal quotient and therefore extend to the completion. They remain independent on its cotangent space. Its embedding dimension is at least two, whereas the embedding dimension of `K[[T]]` is one.

**Correction:** require `κ(𝔭)/κ(𝔭 ∩ R)` finite. A sufficient geometric formulation is that `𝔭` is closed in the inverse image of the punctured spectrum. Then the residue field is a characteristic-p local field, and the diagonal completion argument of Böckle–Juschka, Corollary 3.3.4 and Lemma 3.3.5, applies. The local-field hypothesis is explicit in their proof. This also explains why there is one new variable in the intended application.

The applications in Corollary 3.38 and Proposition 4.9 use closed points; Lemma 3.18(3) supplies the missing finiteness. The separate assumptions of Lemmas 3.36 and 3.37 should be retained. Add a source issue classified as an **error affecting a stated result**, namely the overbroad Lemma 3.35. Update `/049` and the source-route explanation; do not claim that the main theorems fail.

## 3. The Hochschild–Ext supplier is missing — medium

**Target:** `/026`, its suppliers and route 6.

Equation (11), p. 14, computes the block tangent space through Hochschild cocycles. For the relevant modules `U,V` over `E_y`, it uses

`HH⁰(E_y, Hom_κ(U,V)) ≅ Hom_{E_y}(U,V)`,

`HH¹(E_y, Hom_κ(U,V)) ≅ Ext¹_{E_y}(U,V)`,

and the dimension identity obtained by taking cocycles modulo coboundaries. The paragraph names Cartan–Eilenberg, Proposition IX.4.4.1 and Corollary IX.4.4.4. Item `/026` records the final formula and local Galois duality, but the inventory and prerequisites contain neither the Hochschild object nor this comparison.

Add the cited supplier item with its Hom-bimodule and degrees explicit, and make it an explicit input to `/026` in the local Part II. Reuse upstream **DGAInfinity Layer 8** for the cochain framework. Its reviewed audit says that the Hochschild carrier is not yet built; searches of both pinned trees agree. **RefinedTraceMethods RT.1** plans the chain and cyclic theory, which does not itself provide this cohomology-with-coefficients comparison. Identify any required general extension with the DGAInfinity owner rather than duplicate the carrier inside a Galois roadmap.

This asks for an extracted supplier statement, status and route. It does not ask the paper extractor to prove Cartan–Eilenberg or close that supplier’s dependencies.

## 4. The derived-deformation consequence is absent — medium

**Target:** `/059`, the main-results reader, prerequisites and route 6.

After Theorem 1.1, published p. 2 explicitly deduces that the derived deformation ring is **homotopy discrete**, citing Galatius–Venkatesh Lemma 7.5 and referring also to Cai. That mathematical consequence is absent from the items and design brief. Recording the underived complete-intersection and lifting theorems does not record the comparison with derived deformation theory.

Add the source-bound derived deformation object and the cited criterion, preserving their actual local and framing conventions. State the consequence as vanishing of positive homotopy groups and recovery of the ordinary deformation ring in degree zero. Route the local application to `LocalGaloisDeformationRingsPartIIComponentsAndNormality`, with the Galatius–Venkatesh supplier explicitly listed.

The checked `DeformationAndDerivedPatchingAlgebra` P7–P9 layers concern perfect complexes, coefficient change and patching; they do not construct this derived deformation functor. They must not be cited as though they already cover the missing consequence. The supplier’s model and proof closure remain blueprint work.

## 5. Remark 6.2 is cited but its stronger targets are absent — medium

**Target:** `/147`, the density reader and route 7.

Published Remark 6.2, p. 46, allows additional benign conditions on the crystalline representations, mentions a fixed inertial type, and allows ramified extensions in the supercuspidal construction. It points to Emerton–Paškūnas Definition 6.8 and §5.3. The extraction includes the remark in a locator, but `/131`, `/147` and the route-7 brief only state the original three sets, with an unramified extension in the supercuspidal case.

Add separate source-bound items for these refinements and their defining conditions, and route them to `CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity`. Preserve `p ∤ 2d`, the regular-weight condition and the precise type/extension hypotheses of the referenced supplier. In particular, the shorthand remark is not a license to assert density for an arbitrary fixed type without those hypotheses. Counting covered numbered locators does not resolve this omission.

## Routing, library checks and validation

All **137 missing items have exactly one route**, no item is assigned twice, and all **13 explicit planned/source destination IDs resolve** in the freshly assembled atlas. The distinction between unrestricted rings, fixed determinant, determinant fixed only on p-power torsion, and the separate patched-module Part II is retained. The checked invariant-theory layers LP2–LP3 do not by themselves supply all of this paper’s general-base GIT.

I read the relevant source-layer descriptions and reviewed coverage where available. Missing coverage records for several layers were not interpreted as library absence. The seven cited Mathlib declarations were opened at `082e2d37e8b0463410cdb532e111cd43d5a66174`; their stated scopes match the extraction’s basic-ingredient references. The Tau Ceti tree at `f790474821cf4256814db967cb154e7af3d0c369` was searched, and its finite-type Krull-dimension results were inspected. Neither a matrix Cayley–Hamilton theorem nor a Krull-dimension theorem supplies the determinant-law or complete-intersection targets.

Checks run:

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BOCKLE-IYENGAR-PASKUNAS-23.result.json`
- `python3 research/blueprint/intake.py check-files` on the two deliverables
- `git diff --cached --check`

No Lean file is a deliverable. No Lean compilation, Lake setup/cache operation or language server was run. Supplier proofs were not claimed audited merely because their statements are cited by this paper.
