# REV-PAPER-ICHINO-PRASANNA-23 — review of the extraction of Ichino–Prasanna, *Hodge classes and the Jacquet–Langlands correspondence*

**Verdict: accept. All nine routes accepted, no coverage gap, all eight recorded mistakes confirmed, nothing corrected in place.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-442dc5`, issue #1375 — 120 items (2 library, 13 planned, 105 missing), 9 routes, 8 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Forum of Mathematics, Pi **11** (2023), e22, 1–135, [doi:10.1017/fmp.2023.20](https://doi.org/10.1017/fmp.2023.20), read in the published version and in [arXiv:1806.10563v2](https://arxiv.org/abs/1806.10563) with its TeX source.

## Provenance — and a provenance note worth copying

Both arXiv hashes match byte for byte: the v2 PDF `058fda94…28aad5` and the v2 e-print `4a631214…f7657f` (eighteen files — Ch01–Ch12 with Ch09.5, macros, preamble, the splittings appendix).

The extraction's note on the published PDF deserves credit. It records that "the publisher stamps each download, so a fresh download has another hash; its text layer is otherwise identical". That is exactly right for Cambridge Core, and it is the disclosure another extraction I reviewed earlier today was missing — there the recorded Cambridge hash looked like a check that anyone could repeat, and it is not.

## 1. Numbering and coverage

`macros.tex` declares `\newtheorem{thm}{Theorem}[section]` with `lem`, `prop`, `cor`, `defn`, `rem`, `conjecture`, `example` on the same counter, and separate counters for the introduction's `mtheorem`/`mcorollary`/`mremark` and the `\Alph`-printed `mconjecture`. Simulating that over the `\input` order gives **88 numbered objects** and reproduces every number I tested (Proposition 11.6, Theorem 12.4, Proposition A.1). Two sections (4 and 7) genuinely contain no numbered statement, and the appendix contains **27** (23 lemmas, 3 propositions, 1 remark) — both confirmed directly in the source.

**Coverage: nothing uncovered.** 84 of the 88 are cited by their own number, the introduction's Theorem 1 by name, and three appendix lemmas — A.16, A.19, A.22, the second halves of the three parallel Weil–Hodge computations — only through a section-level locator.

## 2. Internal references — clean

All **97** references of the form `<word>~\ref{label}` agree with the environment carrying the label; no duplicate labels, no undefined references.

## 3. Statuses — Tau Ceti, verified declaration by declaration

Both `library` items cite **Tau Ceti** rather than Mathlib, and all ten declarations resolve at pinned `f790474`. I located each and computed its enclosing namespaces:

| cited | where |
|---|---|
| `TauCeti.Hodge.HodgeStructureOn` | `Geometry/Hodge/Structure.lean:62` |
| `…HodgeStructureOn.piece` | `Structure.lean:156` |
| `…HodgeStructureOn.IsMorphism` | `Morphism.lean:69` |
| `TauCeti.Hodge.HodgeStructure.Hom` | `Morphism.lean:150` |
| `TauCeti.Hodge.RationalHodgeSubstructure` | `RationalSubstructure.lean:72` |
| `…HodgeStructureOn.tateTwist` | `Tate/Twist.lean:57` |
| `TauCeti.Hodge.tate` | `Tate/Basic.lean:90` |
| `…HodgeStructureOn.tensorProduct` | `TensorProduct.lean:109` |
| `…HodgeStructureOn.dual` | `Dual.lean:76` |
| `…HodgeStructureOn.internalHom` | `InternalHom.lean:230` |

A broad `git grep` first suggested three of these were missing — `HodgeStructure.Hom`, `.tensorProduct`, `.dual` — because it matched same-named declarations elsewhere in the library first. They are all there; **resolving namespaces file by file** is what settled it, and that is the check worth repeating rather than a name search.

The 13 `planned` items and the routes cite **26 layers, all present** in `data/atlas.json`.

## 4. Routes — one new roadmap, three Part IIs, five sources, all accepted

The **new roadmap** needed the most care, since only this extraction proposes it. Checked against the atlas rather than taken on trust: **"Kudla–Millson" appears zero times** in `data/atlas.json`, "theta lift" twice in unrelated contexts, and every one of the **nineteen** "Jacquet–Langlands" occurrences is the classical representation-theoretic correspondence (local JL on `GL_r(D)`, Badulescu's extended JL, base change, the two-tower cohomological realization) — none is a cycle- or Hodge-class realization. The "Hodge class" hits are Hodge tensors in a Hilbert construction and Gross–Zagier's degree-one class `ξ_U`. Nothing in the atlas constructs Hodge classes realizing functoriality between Shimura varieties.

All three **Part II** titles reproduce their parents' verbatim, and the metaplectic one **joins** a proposal that `PAPER-GAN-ICHINO-18` and `PAPER-GAN-SAVIN-23-B` already make — its own brief says so and points at the Gan–Ichino brief. The five source routes place the machinery where the atlas already owns it: dual pairs and theta kernels in `MP.3`/`MP.4`, Vogan–Zuckerman modules in `AF.4`, Adams–Johnson/Arthur packets in `ML.4`, realization functors in `MC.2` with the conjectural Hodge/Tate inputs in `MC.7`, and Eichler's norm theorem in `GN.2`.

## 5. Mistakes in the paper — 8 of 8 confirmed

**Three are substantive, and they form a chain** — which is the most valuable thing in this finding list:

- **E1** — the `L`-Hodge structure definition takes a number field `L` with a fixed embedding in `ℂ` and then conjugates on `V ⊗_L ℂ`. For `L ⊄ ℝ` that conjugation does not descend, so `conj(F^qV_ℂ)` has no meaning. The paper's own subsection opens "Some of our definitions below may be somewhat non-standard", and every field it is applied to is totally real, so the reach really is nil.
- **E4** — "The set of components of `Sh_{𝒢̃_B}` is in bijection with the Shimura variety attached to `(T_1,h_1)`". The derived group `(B_1^{(1)} × B_2^{(1)})/{±1}` is not simply connected, so the components are governed by `𝒢̃_B/ρ(𝒢̃_B^{sc})` and the square-class part survives; the map to `Sh(T_1,h_1)` need not be injective.
- **E8** — the rationality step in the proof of Theorem 12.4 asserts that `Gal(ℚ̄/F_Σ)` acts **trivially** on those components. That is E4 again, and here it is load-bearing: the invariance has to be arranged by choosing `c` inside the invariant subspace, which is what the entry's repair does. The entries are correctly linked.

**E5** is a genuine definedness failure: a character of `E^{(1)}\𝔸_E^{(1)}` is evaluated at `(t_1t_2)^{-1}α`, which has norm `N(α)^{-1}`. The repair — `η` on `𝔸_E^×/E^×𝔸_F^×`, the reading §§1.2 and 10.4 use — makes both displayed formulas come out as `η(α)`.

The rest are notational and each was found verbatim: degree `2d` for the middle degree `d` (**E2**); `U_E(V^♯_0)` for `U_B(V^♯_0)` inside a `\begin{turn}{90}` diagram — exactly where a subscript survives proofreading (**E3**); a missing subscript in `s_v(g_1)s(g_2)` in Proposition A.1(i) (**E6**); and a missing closing parenthesis in the `(p,q) = (1,1)` Hodge-type computation, whose arithmetic is right (**E7**).

## 6. What this extraction does well

120 items for a 135-page paper that runs from Shimura-variety motives through exceptional isomorphisms, Kudla–Millson theory and theta lifting to Arthur packets and Hodge–Tate classes, with the general machinery routed to five existing layers and three Part IIs and only the paper's own chain kept in the new roadmap. Its findings distinguish a wrong definition whose reach is nil (E1) from the same error where it carries a proof (E8), and say which is which.

## Tools

An `\input`-order inventory simulator (shared `thm` counter, separate intro counters, `\appendix`), a word/environment reference audit, and namespace resolution against pinned Tau Ceti `f790474`. Kept in the session scratchpad.
