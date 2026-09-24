# Handoff — BP-ExcursionOperatorsAndSpectralAction--ES0 (issue #726)

Agent: Claude Code, session `cc-7b31c4`. Branches `cc-7b31c4-bp-es0` (pull request
#2862, merged) and `cc-7b31c4-bp-es0-audit` (this correction).

## Correction, 24 September 2026

The first version of this job said there is "no reviewed audit in
`data/library-coverage.json`" for this roadmap. **That is wrong.** `AUDIT-20`, reviewed
as `REV-AUDIT-20` on 17 September 2026 with 240 targets checked and 89 corrections,
covers all seventeen layers and returns **not built** for every one. The verdicts
overturn nothing planned here, but two of the audit's target notes do change the packet,
and both corrections are applied:

- **`ES0` was recorded as *partial*, not absent.** Mathlib at the pinned commit already
  has `CategoryTheory.CatCenter C = End (𝟭 C)`, with `CatCenter.app`,
  `CatCenter.naturality`, `CatCenter.ext`, `CatCenter.mul_app` and
  `Linear.toCatCenter : R →+* CatCenter C`. The node
  `ES0/bernstein-center-of-a-category` re-planned that. It now **cites** those five
  declarations and owns only what the audit says is missing: the degree-zero centre
  `π₀ End(id)` of a *stable* Λ-linear enhancement, with its condensed structure — the
  object the proof of IX.5.1 actually names. The suggested Lean file now abbreviates
  `centre := CatCenter` and proves the naturality and scalar items by citation.
- **`ES3`'s coefficient hypothesis is statable at the pins.** The audit records that,
  although the dual group is absent as a group scheme, `π₁(Ĝ)` is the quotient of the
  character lattice by the root lattice and `RootPairing.flip` expresses it. That
  declaration is now cited.
- **`ES0` duplicates `GlobalShtukasAndFunctionFieldLanglands:GS.5`**, which builds the
  same excursion operators with the same relations globally over a function field. A
  request to it is added, with a note that a restructuring job should decide which layer
  owns the shared algebra.

Everything else in the packet is unchanged: 26 nodes, 23 planets, the same sources and
the same locators.

## Deliverables

- `research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES0.json` — 26 nodes
  (6 definitions, 1 construction, 16 theorems, 1 lemma, 2 comparisons), 40 API items,
  28 unit tests, 23 planets, 26 baseline declarations, 11 gaps, 17 requests, 3
  structural findings. `"part": "ES0"`, `"status": "partial"`.
- `research/blueprint/readmes/ExcursionOperatorsAndSpectralAction--ES0.md` — the roadmap
  document, 2265 lines, one section per layer with every node's statement, hypotheses,
  proof outline, API, unit tests, acceptance items, prerequisites and sources.
- `research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES0.lean` — 364
  lines of suggested signatures and `example` unit tests.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES0.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place, so every
  baseline reference was resolved against it and not merely checked for form.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.
- `python3 -m unittest discover -s tests` → OK.

**The Lean file was not compiled.** No Lean was run for this job. The Mathlib build on
this machine is a shared cache that must not be rebuilt, and this working tree has no
elaborated dependency modules. Nothing in this packet is claimed to be formalised and
every `implementationStatus` is `unchecked`.

## What this job rested on

**This roadmap has no integrated decomposition.** There is no file for
`ExcursionOperatorsAndSpectralAction` in `data/decompositions/`, no draft in
`research/expansion/drafts/` and no external contribution. There **is** a reviewed
library audit — `AUDIT-20`, see the correction above — and it returns *not built* for
every layer. All 26 nodes were written from Fargues–Scholze read
directly in this session, from `Geometrization.pdf` whose SHA-256
`9ab9efbd0df251bf…` reproduces the recorded value byte for byte. The text was extracted
by inflating the PDF's object streams and reading its text operators; printed pages came
off the running heads.

Sections read: **VIII.4 in full** (pp. 290–293), **VIII.5's statements** (p. 293,
Theorems VIII.5.1 and VIII.5.2), **IX.4** (p. 327), **IX.5 in full** (pp. 327–330), the
**head of IX.6** (p. 330), **IX.7 in full** (pp. 334–338), and the **whole of Chapter X**
(pp. 339–350).

A reviewer is therefore checking a first reading, not a refinement of a reviewed one,
and should treat every locator as unconfirmed by anyone else.

## Locators read here that belong to OTHER layers

These were read in full in this session and are recorded so that whoever takes those
layers does not have to find them again. None of them is planned in this packet.

| Statement | Printed page | Owner | One line |
| --- | --- | --- | --- |
| Corollary VIII.4.3 | 292–293 | `ES5` | For `End(X)=L`, a unique semisimple `φ_X : W → Ĝ(L) ⋊ W` up to `Ĝ(L)`-conjugation, characterised on all excursion data. |
| Definition/Proposition IX.4.1 | 327 | `ES5` | The same for Schur-irreducible `A ∈ D_lis(Bun_G,L)`, `End(A)=L` **as condensed algebras**. Its whole proof is: "By the arguments of Section VIII.4, we can build excursion data as required for Proposition VIII.3.8." |
| IX.5.3, second sentence | 329–330 | `ES6:duality` | Formation of `L`-parameters is compatible with Bernstein–Zelevinsky duals and with smooth duals; for supercuspidals the two duals agree, and in general the smooth-dual claim **follows from parabolic induction proved below**, so it is not independent of `ES7:parabolic`. |
| Theorem IX.6.1 | 330–331 | `ES6:functoriality` | Isogenies: for `G' → G` an isomorphism on adjoint groups, `φ_{A'}` is `φ_A` composed with `Ĝ → Ĝ'`. Proof by a push–pull computation `π_* T_{V'}(π^* A) = T_V(A)`. |
| Proposition IX.6.2 | 331 | `ES6:functoriality` | Products: `φ_A = (φ_{A_1}, φ_{A_2})`. |
| Proposition IX.6.3 | 331–332 | `ES6:functoriality` | Weil restriction: `Bun_{G'} = Bun_G`, `Z¹(W_E,Ĝ)/Ĝ = Z¹(W_{E'},Ĝ')/Ĝ'` and `Exc(W,Ĝ) = Exc(W',Ĝ')`, the last via `Z¹(F_n,Ĝ)//Ĝ = Z¹(F_n ×_W W', Ĝ')//Ĝ'` and the fact that `F_n ×_W W' ⊆ F_n` is of finite index, hence itself free of finite rank. |
| Propositions IX.6.4, IX.6.5 | 333 | `ES6:functoriality` | Tori: `Z^spec(T,Λ) = lim_K Λ[T(E)/K]` by local class field theory, and `Z^spec(T,Λ) → Z^geom(T,Λ) = ∏_{b ∈ B(T)} Z(T(E),Λ)` is the **diagonal embedding**. The proof reduces to `T = G_m` and evaluates the `I = {1,2}`, `V = std ⊗ std^∨` operator. |
| Definition IX.7.1 | 334 | `ES7:parabolic` | `Ψ_G : Z^spec → Z(G(E),Λ)` through `j_!`, and `Ψ^b_G` for each `b` through the left adjoint to `i_b^*`. **"Recall that in the `D_lis`-setting, we do not have a general `i_{b!}`-functor, although it can be defined in the present situation. All these maps will induce the same map to the Bernstein center."** |
| IX.7.1, the twisted Levi inclusion | 334 | `ES7:parabolic` | `Ĝ_b` is a Levi of `Ĝ`; the map on cocycles is `φ ↦ (w ↦ (2ρ_{Ĝ} − 2ρ_{Ĝ_b})(√q)^{|w|} φ(w))` with `|·| : W_E → Z` normalised by sending geometric Frobenius to 1. |
| Theorem IX.7.2 | 335–337 | `ES7:parabolic` | `Ψ^b_G` factors through `Ψ_{G_b}`. Proof: reduce to `Λ` killed by a power of `ℓ` (replacing the left side by an excursion algebra if `ℓ ∣ |π₀Z(G)|`) using that `Z(D(G_b(E),Λ)) = lim_K Z(Λ[K\G_b(E)/K])` is `ℓ`-adically separated; the basic case is `Bun_G ≅ Bun_{G_b}` of III.4.3; in general reduce to quasisplit `G` by a z-embedding, then use the increasingly unstable sequence `b_N = b·μ(N)` and the constant-term computation `Rg_! S_V = CT_P(S_V) = S_V|_{(M̂⋊Q)^I}[deg_P]`, the excursion operators needing only `deg_P = 0`. |
| Corollary IX.7.3 | 337 | `ES7:parabolic` | Compatibility with **unnormalised** parabolic induction, and `φ_{π̃}` conjugate to `W_E → M̂(L) ⋊ W_E → Ĝ(L) ⋊ W_E` **with the cyclotomic twist**. Proof: reduce to `π = c-Ind^{M(E)}_K` for `K` pro-`p`, take `μ` with dynamical parabolic `P`, `b = μ(π)`, so `G_b = M`, and note `T_μ(A)|_{Bun^1_G} = Ind^{G(E)}_{P(E)} π (d/2)[d]` with `d = ⟨2ρ,μ⟩`. |
| Theorem IX.7.4 | 338 | `ES7:GLn-comparison` | For `GL_n`, `φ_π` agrees with the usual semisimplified parameter. The **only** place in the paper relying on previous work on local Langlands, via the cohomology of the Lubin–Tate and Drinfeld towers. Uses `I = {1,2}`, `V = std ⊠ std^∨`; the shift `[n−1]` and the twist `(n−1/2)` are hidden in the normalisation of the perverse sheaf. Recovers Helm–Moss integrally. |
| Conjecture X.1.4, Remark X.1.5, Examples X.1.6, X.1.7, Remark X.1.8 | 344–346 | conjectural | The categorical form of geometric Langlands on the curve; the orthogonal decomposition by `π₁(G)` matching the `Z(Ĝ)^Γ`-eigenspaces; `Z^spec(G,Q̄_ℓ) → End(c-Ind^{G(E)}_{U(E)} ψ)`; the kernel of functoriality `A_f ∈ D_lis(Bun_H × Bun_G)`; and why quasisplitness is needed for the Whittaker sheaf. |
| The eigensheaf `Aut_φ = E_φ * W_ψ` | 345 | conjectural | `S_φ`-equivariant, and **already** a Hecke eigensheaf with eigenvalue `φ`; it is not known to be nonzero. |
| Conjecture X.2.2 | 347 | conjectural | `Perf([∗/S_φ]) → D^{C_φ}_lis(Bun_G,Q̄_ℓ)^ω`, `W ↦ Act_W(π)`, is a `t`-exact equivalence; with the formula `T_V(π) = ⊕_i Act_{W_i}(π) ⊗ σ_i`, essentially Kottwitz's conjecture [RV14, 7.3]. |
| Conjecture X.3.5 | 350 | conjectural | The integral categorical conjecture, with `Λ = O_L[1/n]`, `n = |π₀Z(G)|`, and nilpotent singular support. |

## What this packet plans, layer by layer

- **ES0** (6 nodes). `End(id_C)` with centrality and the one-object/all-objects
  distinction; excursion data and operators (VIII.4.2); the invariant function
  `f(V,α,β) ∈ O(Ĝ \ (Ĝ⋊Q)^I / Ĝ)` and the independence of the realising representation;
  the reindexing (cartesian), multiplication (fusion) and unit-insertion relations;
  Theorem VIII.4.1; and — as a `comparison` node — the **discretisation route**, which is
  how the roadmap's demand for "continuity in Weil variables" is actually met in the
  source: FS work with a *discrete* `W` on purpose, cut down by IX.5.1 and then
  discretise the tame inertia.
- **ES0:classical-center** (2). The map `Z^geom(G,Λ) → Z(G(E),Λ)` from the fully
  faithful embedding, presented as generalising Helm–Moss; and
  `Z(D(G_b(E),Λ)) = lim_K Z(Λ[K\G_b(E)/K])` with its `ℓ`-adic separatedness.
- **ES1** (1). The spectral centre, the geometric centre, the Hecke-compatible part.
- **ES1:finite-ramification** (2). IX.5.1 with its proof in full; the component
  decomposition — a **sum** on compacts, a **product** on Ind-categories.
- **ES1:spectral-center** (2). IX.5.2; and the excursion-algebra fallback.
- **ES2** (4). Compact support over a non-quasicompact stack; X.1.1 and X.1.2 each with
  its proof in full; X.1.3.
- **ES3** (6). The failure of X.1.2 integrally and the sifted-colimit approximation
  `Perf(Map)^♮`; X.3.1, X.3.2, X.3.3, X.3.4; X.0.1/X.0.2.
- **ES4** (3). The duality square of IX.5.3 (the square only); X.2.1; and the
  decomposition of an elliptic component over the basic elements of `B(G)`.

## The three findings a reviewer should look at first

1. **The parent layers of this roadmap are wired in two opposite directions.** `ES0`
   has six external suppliers and supplies its child `ES0:classical-center`; `ES1` has
   *no* external supplier and is supplied *by* its two children. A reader following the
   link graph would conclude that `ES1` — where the spectral centre, the geometric
   centre and the Hecke-compatible part are defined — rests on nothing outside this
   roadmap, when its own text quotes `LanglandsParameterStacks` and
   `VStackSheavesAndLisseCategories` throughout. The `ES1` node of this packet names
   eight external prerequisites, all filed as requests.
2. **`ES4`'s stage text names four inputs the atlas does not record**:
   `ES1:spectral-center`, `VS5`, `GS4:integral-dual-group` and `HS3`. All four are used
   by this packet's `ES4` nodes. A fifth edge is missing elsewhere: every excursion
   datum is an object of `Rep((Ĝ⋊Q)^I)`, so `GS4:integral-dual-group` is an input of
   `ES0`, `ES2` and `ES3` too, and no edge records it.
3. **`ES4` asks for a general spectral support that the source does not define.** FS
   give the component decomposition (which `ES1:finite-ramification`'s text already
   claims) and the elliptic special case. An annihilator-based support with functoriality
   under triangles, retracts and coefficient change is nowhere in Chapters VIII–X. No
   node was invented for it; the gap and the proposal are recorded instead.

## What remains

Eleven gaps, each with a next source action. In rough order of how much they block:

1. **Theorem VIII.5.1's proof (FS VIII.5, pp. 293–300) is unread.** Both IX.5.2 and
   X.0.2 finish by invoking it, so it is the single largest external dependence of this
   part. Requested from `LanglandsParameterStacks:LP3`.
2. **Highest weight theory over a discrete valuation ring has no source anywhere read.**
   The whole proof of X.3.2 is one sentence appealing to it, and it is exactly the input
   the rational argument does not need — so it is the mathematical content of the
   integral case.
3. **V. Lafforgue [Laf18] §§10–11 is unread.** The last compatibility in the proof of
   VIII.4.1 is quoted from it.
4. **Bernstein's block theorem is not in FS.** `ES0:classical-center`'s
   characteristic-zero dictionary has an unproved half until `SR.3` supplies it.
5. **FS VI.12.1 is unread**, and it is the only substantive input to `ES4`'s duality
   node.
6. **FS IX.3 was read only in passing**; Theorem IX.3.1 should be routed to
   `HeckeStacksAndLocalShtukas:HS3`, and then a `kind:link` job should draw `HS3 → ES4`,
   without which `ES4`'s local-shtuka obligation cannot be met at all.
7. The `Θ_I` display on printed p. 292 is damaged in the extraction used here; a
   reviewer should confirm the shape of the cartesian square against the printed page.
   Nothing else depends on its wording.
8. Helm–Moss [HM18] is unread, so the word "generalization" in IX.5 cannot be checked.
9. `ES2`'s obligation to prove the degree-zero action agrees with `ES1`'s map, and
   `ES3`'s obligations on coefficient change and normalised kernels, are the roadmap's
   own additions; they are **not** statements of the source and no node claims them.

## Where to resume

The packet is complete against the source for layers ES0–ES4. The next real work on this
roadmap is **ES5–ES7**, and whoever takes it should start from the table above rather
than re-extracting the PDF: IX.4.1, VIII.4.3, IX.5.3's second sentence, IX.6.1–IX.6.5
and IX.7.1–IX.7.4 were all read in full in this session and their page numbers and proof
structures are recorded there.

For this part, the highest-value follow-up is reading FS VIII.5 in full, which closes
gaps 1 and 2 at once and serves `LanglandsParameterStacks:LP3` as well as `ES3`.
