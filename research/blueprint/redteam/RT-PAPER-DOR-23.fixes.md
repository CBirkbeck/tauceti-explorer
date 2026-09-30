# RT-PAPER-DOR-23: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5001, job FIX-RT-PAPER-DOR-23).

**Scope.**
- **Findings:** `RT-PAPER-DOR-23.result.json`, by cc-f805bf.
- **Verdicts:** `RT-PAPER-DOR-23.review.json` and `reviews/REV-RT-PAPER-DOR-23.md`, by Codex session codex-J6LwjP.
  Ten findings are confirmed and one (/7) is rejected.
- **This job:** the issue lists the six medium findings (/1–/6), and this job applies them. The low findings (/8–/11)
  are not part of it.
- **Corrections:** where the verifier qualified a fix, I applied its version. Each section says how.

**Files changed.**
- `papers/PAPER-DOR-23.result.json`, edited by a script that asserts each replaced string occurs once. The JSON keeps
  the file's own format (indent 1, UTF-8).
- `papers/PAPER-DOR-23.md`, which gets a closing section.

**Result.** Before and after:

| | Before | After |
|---|---|---|
| Items | 59 (1 library, 7 planned, 51 missing) | 65 (2 library, 8 planned, 55 missing) |
| Routes | 1 (the new roadmap, 51 items) | 5 (47, 1, 2, 3 and 2 items) |
| Prerequisites | 9 | 10 |
| Source issues | 7 | 8 |

**Independence.** I did none of:
- the extraction (cc-442dc5);
- its review (cc-39fac3);
- the red team (cc-f805bf);
- the verification (codex-J6LwjP).

**What I read, on 30 September 2026.**
- **The published PDF** (a fresh Cambridge Core download, 52 pages): Remark 3.47 (p. 33), Construction 3.44 and the
  paragraph after Remark 3.43 (pp. 31–32), Remark 2.18 (p. 15) and the definition of Hom̲ (p. 27).
- **In the pinned Mathlib:** the three coinvariant declarations, in `Mathlib/RepresentationTheory/Coinvariants.lean`.
- **In the atlas:** R16.2, MP.0, SR.3, and the SR and MP stage lists.
- **In other extractions:** the parahoric-centres Part II routes of Kisin–Pappas, He, Zhu and Clozel–Thorne; the
  Metaplectic Part II routes; and Dospinescu–Le Bras's route 9.
- **Metadata:** Crossref and the arXiv API.

## /1 (medium, error): Remark 3.47's condition on h

**The check.** The published p. 33 reads "any matrix h ∈ GL_2(F) satisfying hKh^{−1} ∩ U = ker(θ) would have worked
after appropriate modifications".
- hKh^{−1} ∩ U is compact.
- ker θ is not compact when [F : Q_p] ≥ 2, since it contains the hyperplane Tr(cx) = 0. It is not compact when F =
  F_q((t)) either, since it contains c^{−1}t^{−n} for n ≥ 2.
- For h = diag(1, d), h·u(x)·h^{−1} = u(x/d). With d = −π^ν this gives u(π^{−ν}O), the conductor lattice that
  Construction 3.44 defines through ν(e).

**Changes.**
- **E8** is new: a misprint that affects the proof, with the finding's locator, a quotation of the printed sentence, the
  lattice as correction and the argument above as reason. Following the verifier:
  - the version of record is named in the locator;
  - the erratum search was refreshed: Crossref has no update relations and no updating work; arXiv has v1 and v2 only;
    the published p. 33 prints the condition as quoted.
- **Items 027 and 050 and E7's correction** use the conductor lattice in place of ker θ.
- **E7** also requires, as the finding asked, that h_v carry Λ_v to M_2(O_v) under the middle action.
- **The verifier's qualification.** A sentence at the end of E7's correction says that the corrected condition does not
  by itself give the global counit or its match with Λ, and that the matching, counit and restricted-product checks
  remain obligations. Item 027 says that a general h needs the counit and Claim 3.49 re-checked.
- **Route 1's brief** points to E8 where it describes the global counit.

## /2 (medium, duplicate): the Kirillov model goes to R16.2

- **R16.2's text** says "There is no second Whittaker model or local-factor carrier".
- **Item 003** leaves route 1 for a new source route 2 to R16.2. Following the verifier, it stays missing: Dospinescu–Le
  Bras's supercuspidal item at R16.2 is a narrower case, and R16.2 does not yet state the general embedding and image.
  The note and the route reason pin every non-archimedean local field of characteristic ≠ 2, equal characteristic
  included, and say that the exotic roadmap imports that interface.
- **Route 1's reason** no longer says the Kirillov model is planned, and its brief imports it from R16.2.

## /3 (medium, missing): three facts about the spherical generator

**The check.** The paragraph after Remark 3.43 (p. 31) reads: "It is clear that E is projective, that its restriction
to each component is compact and that Z_sph → Hom̲(E, E) is an isomorphism." Hom̲ (p. 27) is the morphisms supported on
finitely many Bernstein components.

Following the verifier, the finding's single item is split in three.

**Item 060:** E is projective in Mod(G) and finitely generated on each component. It is routed to SR.2 (compact
induction) by the new source route 4.

**Item 061:** End_G(cInd_K^G(η∘det)) is the η-twisted spherical Hecke algebra, commutative, and the Bernstein centre of
its block maps isomorphically onto it.
- The item says that the Satake isomorphism alone does not give this: it needs Bernstein's Iwahori centre and its map
  to H(G//K).
- It records the reduction cInd_K^G(η∘det) ≅ cInd_K^G(1) ⊗ (η̃∘det).
- It joins SmoothRepresentationsPartIIParahoricCenters (new route 3) with that Part II's id, title, parent and area,
  stating that its brief is kept. That Part II owns the Haines 2009 centre-to-spherical isomorphism.
- R16.2 is named for the GL_2 specialisation.

**Item 062:** Hom vanishes between different twists, hence Z_sph ≅ Hom̲(E, E). As the verifier required, the underline
is kept: the unrestricted End_G(E) is the product over components, not Z_sph. The item is routed with item 061.

**Route 1's brief** imports all three. Complex coefficients and the blockwise hypotheses are stated in each item.

## /4 (medium, error): the centre as invariant distributions

**Item 053** loses its last sentence, the two clauses SR.3 does not plan, and stays planned at SR.3 and R16.2 for the
rest. Its note says why.

**Item 063** (missing) states:
- Z(Mod GL_2(F)), for F non-archimedean of any characteristic with complex coefficients, is the algebra of
  conjugation-invariant essentially compact distributions acting on S(G);
- (i) the left and right actions agree, with Dor's transpose convention for right modules, as the verifier asked;
- (ii) the centre is fixed by g ↦ g^T.

As the verifier required, it says that the pointwise conjugacy of g and g^T is not by itself a proof. It names
Bernstein–Zelevinsky 1976, §7.3, pp. 57–58 (the criterion of §6.13 and constructibility) as the input. That paper is
already a prerequisite.

**Routing.** Item 063 is requested from SR.3 by route 4. Its note records that the GS.7 node is an equal-characteristic,
Q_ℓ-valued interface needing a coefficient and generalisation bridge.

**Consumers.** Items 013 (Lemma 2.17) and 017 (Definition 3.2) name it in their notes; this extraction has no
`dependsOn` fields.

## /5 (medium, error): the function-field Weil representation

**The new route 5**, a Part II of MetaplecticAutomorphicForms, uses the finding's id and title. I checked that no
extraction had already proposed a matching Part II; the existing ones are finite Weil representations,
Shimura–Waldspurger and anomaly splittings.

- **Its brief** follows Weil (Acta Math. 111 (1964), doi:10.1007/BF02391012, added to the prerequisites). It imports
  MP.0–MP.5 in their actual ranges and FA.2.
- **The verifier's requirements, in the brief:** the comparison of Dor's scalar C^×-extension with the metaplectic
  model, the rational splitting, self-dual measures and distinguished vectors, and the warning against inferring
  invariance under the whole central extension from rationality.

**Items.**
- **Item 059** moves to route 5.
- **Item 006 is split**, as the verifier asked:
  - the ordinary Poisson summation on M_2(A) is the new item 064, planned at FunctionFieldArithmetic FA.2 (the review
    had already found that FA.2 plans it);
  - item 006 keeps the metaplectic invariance and moves to route 5.

**Route 1's brief** imports the Part II. The words "the function-field versions are built here" are removed.

## /6 (medium, library-claim): the relative tensor product

**The check.** In the pinned Mathlib (`Coinvariants.lean`):
- `Rep.coinvariantsTensor` (line 410) is (A, B) ↦ (A ⊗_k B)_G, and its docstring identifies it with A ⊗_{k[G]} B;
- `Rep.coinvariantsAdjunction` (line 386) makes coinvariants a left adjoint;
- `Representation.coinvariantsTprodLeftRegularLEquiv` (line 283) is (V ⊗ k[G])_G ≅ V.

**Item 056** is narrowed to the algebraic construction and marked library with those three declarations. Following the
verifier:
- it says that Dor's left modules enter through I_RL, so the library functor is applied to g ↦ π_L(g^{−T}), not to V
  unchanged;
- its note says that only the algebraic part is library, that the tensor product's colimit preservation is a separate
  input, and that k[G] is not S(G).

**Item 065** (missing) takes the smooth statements: smoothness of the bimodule and trimodule versions, colimits, S(G)
⊗_G N ≅ N, and smooth Tor with the spectral sequence of Lemma 2.20 (p. 17). It is requested from SR.2, SR.1 and
SR.0:derived-extension by route 4.

**Routes.** Item 056 leaves route 1, since a library item is not routed. Route 1's brief cites Mathlib for ⊗_G.

## Not applied, and why

- **The low findings (/8–/11)** are outside this issue. /11 asks for the report's counts to be reconciled; the closing
  section of the reader document gives the counts recomputed from the JSON.
- **/7 was rejected** by the verifier.

## For the maintainer

- **Verdicts.** Record verdicts in `PAPER-DOR-23.review.json` for the four new routes:
  - 2: R16.2 source;
  - 3: the parahoric-centres Part II;
  - 4: the SmoothRepresentationsOfLocalGroups source;
  - 5: the new Metaplectic Part II.

  Route 1 lost items 003, 006, 056 and 059.
- **The design job for the parahoric-centres Part II** gains Dor's GL_2 twisted spherical case (items 061–062).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/*.result.json`: every extraction ok.
- `source_issues.check_issues` and `check_errata.versions_checked`: no errors.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- Every missing item is routed exactly once. Route 3 matches the existing SmoothRepresentationsPartIIParahoricCenters id,
  title, parent and area.
